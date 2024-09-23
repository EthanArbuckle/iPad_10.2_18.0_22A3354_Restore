@implementation REDataSourceManager

void __66__REDataSourceManager__queue_updateAvailableDataSourceIdentifiers__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", REAvailableDataSourceIdentifiersDidChange, 0);

}

uint64_t __77__REDataSourceManager_initWithRelevanceEngine_dataSourceLoader_withDelegate___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_availableDataSourcesDidChange");
  return objc_msgSend(*(id *)(a1 + 32), "endActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"), *(_QWORD *)(a1 + 32));
}

- (void)_queue_availableDataSourcesDidChange
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  -[RERelevanceEngineSubsystem beginActivity:forObject:](self, "beginActivity:forObject:");
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v4 = self->_dataSourceControllers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v47 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
    }
    while (v6);
  }

  -[REDataSourceManager _queue_updateAvailableDataSourceIdentifiers](self, "_queue_updateAvailableDataSourceIdentifiers");
  -[REDataSourceManager availableDataSourceIdentifiers](self, "availableDataSourceIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "minusSet:", self->_disabledDataSources);
  v12 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v12, "minusSet:", v11);
  v33 = v11;
  v13 = (void *)objc_msgSend(v11, "mutableCopy");
  objc_msgSend(v13, "minusSet:", v3);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v43 != v17)
          objc_enumerationMutation(v14);
        -[REDataSourceManager _queue_unloadDataSourceWithIdentifier:](self, "_queue_unloadDataSourceWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
    }
    while (v16);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v19 = v13;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v39;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v39 != v22)
          objc_enumerationMutation(v19);
        -[REDataSourceManager _queue_loadDataSourceWithIdentifier:](self, "_queue_loadDataSourceWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * k));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
    }
    while (v21);
  }

  v24 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v25 = self->_dataSourceControllers;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v35;
    do
    {
      for (m = 0; m != v27; ++m)
      {
        if (*(_QWORD *)v35 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * m), "dataSource");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v30);

      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
    }
    while (v27);
  }

  v31 = (void *)objc_msgSend(v24, "copy");
  -[REDataSourceManager setCurrentDataSources:](self, "setCurrentDataSources:", v31);

  if (objc_msgSend(v14, "count") || objc_msgSend(v19, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "postNotificationName:object:", CFSTR("REUpNextDataSourcesDidChangeNotification"), 0);

  }
  -[RERelevanceEngineSubsystem endActivity:forObject:](self, "endActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"), self);

}

- (NSSet)availableDataSourceIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 136, 1);
}

- (void)setCurrentDataSources:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void)_queue_updateAvailableDataSourceIdentifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSDictionary allKeys](self->_identifierDataSourceMap, "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (!-[REDataSourceManager _isApplicationRemovedOrRestrictedForIdentifier:](self, "_isApplicationRemovedOrRestrictedForIdentifier:", v9))objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  -[REDataSourceManager availableDataSourceIdentifiers](self, "availableDataSourceIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqual:", v3) & 1) == 0)
  {
    v11 = (void *)objc_msgSend(v3, "copy");
    -[REDataSourceManager setAvailableDataSourceIdentifiers:](self, "setAvailableDataSourceIdentifiers:", v11);

    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_40_0);
  }

}

- (void)_queue_loadDataSourceWithIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  REElementDataSourceController *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  int v12;
  NSMutableArray *dataSourceControllers;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  id v18;

  v18 = a3;
  if (v18)
  {
    -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = -[NSDictionary objectForKeyedSubscript:](self->_identifierDataSourceMap, "objectForKeyedSubscript:", v18);
      -[NSDictionary objectForKeyedSubscript:](self->_unmanagedDataSourcesMap, "objectForKeyedSubscript:", v18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = [REElementDataSourceController alloc];
      -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        v9 = -[REElementDataSourceController initWithRelevanceEngine:dataSource:](v7, "initWithRelevanceEngine:dataSource:", v8, v6);
      else
        v9 = -[REElementDataSourceController initWithRelevanceEngine:dataSourceClass:](v7, "initWithRelevanceEngine:dataSourceClass:", v8, v5);
      v10 = (void *)v9;

      v11 = -[RERelevanceEngineSubsystem isRunning](self, "isRunning");
      v12 = objc_msgSend((id)objc_opt_class(), "_isPrioritizedDataSourceClass:", v5);
      dataSourceControllers = self->_dataSourceControllers;
      if (v12)
        -[NSMutableArray insertObject:atIndex:](dataSourceControllers, "insertObject:atIndex:", v10, 0);
      else
        -[NSMutableArray addObject:](dataSourceControllers, "addObject:", v10);
      objc_msgSend(v10, "setState:", self->_dataSourceState);
      objc_msgSend(v10, "setAllowsLocationUse:", self->_locationAllowed);
      -[REDataSourceManager currentDataSourceIdentifiers](self, "currentDataSourceIdentifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setByAddingObject:", v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)objc_msgSend(v15, "copy");
      -[REDataSourceManager setCurrentDataSourceIdentifiers:](self, "setCurrentDataSourceIdentifiers:", v16);

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "dataSourceManager:didLoadDataSourceController:", self, v10);

      if (v11)
      {
        objc_msgSend(v10, "resume");
        objc_msgSend(v10, "invalidateAndReloadWithCompletion:", 0);
      }

    }
  }

}

- (NSSet)currentDataSourceIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 144, 1);
}

- (BOOL)_isApplicationRemovedOrRestrictedForIdentifier:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (self->_ignoreAppInstallation)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_identifierApplicationIdentifierMap, "objectForKeyedSubscript:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      if (!REApplicationIsRemote(v4)
        || (RELocalApplicationIdentifierForRemoteApplication(v5),
            v3 = objc_claimAutoreleasedReturnValue(),
            v5,
            (v5 = (void *)v3) != 0))
      {
        if ((REApplicationIsRestricted(v5) & 1) != 0)
          LOBYTE(v3) = 1;
        else
          LOBYTE(v3) = REApplicationIsRemoved(v5);
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }

  }
  return v3;
}

+ (BOOL)_isPrioritizedDataSourceClass:(Class)a3
{
  void *v4;

  objc_msgSend(a1, "_prioritizedDataSourceClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "containsObject:", a3);

  return (char)a3;
}

+ (id)_prioritizedDataSourceClasses
{
  if (_prioritizedDataSourceClasses_onceToken != -1)
    dispatch_once(&_prioritizedDataSourceClasses_onceToken, &__block_literal_global_52);
  return (id)_prioritizedDataSourceClasses_Classes;
}

- (REDataSourceManager)initWithRelevanceEngine:(id)a3 dataSourceLoader:(id)a4 withDelegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  REDataSourceManager *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSMutableArray *dataSourceControllers;
  uint64_t v16;
  REConcurrentDictionary *elementGroupMap;
  uint64_t v18;
  NSSet *disabledDataSources;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  REDataSourceLoader *loader;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  REDataSourceLoader *v33;
  id v34;
  id v35;
  uint64_t v36;
  NSDictionary *identifierDataSourceMap;
  uint64_t v38;
  NSDictionary *identifierApplicationIdentifierMap;
  uint64_t v40;
  NSDictionary *identifierOperatingSystemVersionMap;
  uint64_t v42;
  NSDictionary *unmanagedDataSourcesMap;
  void *v44;
  REDataSourceLoader *v45;
  id v46;
  uint64_t v47;
  NSSet *elementGroupSupportingConfigurations;
  NSObject *v49;
  REDataSourceManager *v50;
  void *v51;
  id v53;
  id v54;
  _QWORD block[4];
  REDataSourceManager *v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  objc_super v66;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v66.receiver = self;
  v66.super_class = (Class)REDataSourceManager;
  v11 = -[RERelevanceEngineSubsystem initWithRelevanceEngine:](&v66, sel_initWithRelevanceEngine_, v8);
  if (v11)
  {
    objc_msgSend(v8, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_ignoreAppInstallation = objc_msgSend(v12, "ignoresInstalledApplications");

    objc_msgSend(v8, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_disableAutomaticContentManagement = objc_msgSend(v13, "disableAutomaticContentManagement");

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    dataSourceControllers = v11->_dataSourceControllers;
    v11->_dataSourceControllers = (NSMutableArray *)v14;

    v16 = objc_opt_new();
    elementGroupMap = v11->_elementGroupMap;
    v11->_elementGroupMap = (REConcurrentDictionary *)v16;

    v11->_dataSourceState = 1;
    v11->_locationAllowed = 0;
    v54 = v9;
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v18 = objc_claimAutoreleasedReturnValue();
    disabledDataSources = v11->_disabledDataSources;
    v11->_disabledDataSources = (NSSet *)v18;

    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[REDataSourceManager setAvailableDataSourceIdentifiers:](v11, "setAvailableDataSourceIdentifiers:", v20);

    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[REDataSourceManager setCurrentDataSourceIdentifiers:](v11, "setCurrentDataSourceIdentifiers:", v21);

    objc_storeWeak((id *)&v11->_delegate, v10);
    objc_storeStrong((id *)&v11->_loader, a4);
    -[REDataSourceManager _updatePreferences](v11, "_updatePreferences");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v11, sel__updatePreferences, CFSTR("RERelevanceEnginePreferencesDidUpdate"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v11, sel__handleApplicationStateChange, CFSTR("REApplicationStateDidChange"), 0);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    loader = v11->_loader;
    v53 = v10;
    v29 = MEMORY[0x24BDAC760];
    v62[0] = MEMORY[0x24BDAC760];
    v62[1] = 3221225472;
    v62[2] = __77__REDataSourceManager_initWithRelevanceEngine_dataSourceLoader_withDelegate___block_invoke;
    v62[3] = &unk_24CF8F268;
    v30 = v24;
    v63 = v30;
    v64 = v25;
    v65 = v26;
    v31 = v26;
    v32 = v25;
    -[REDataSourceLoader enumerateDataSourceClassesWithBlock:](loader, "enumerateDataSourceClassesWithBlock:", v62);
    v33 = v11->_loader;
    v59[0] = v29;
    v59[1] = 3221225472;
    v59[2] = __77__REDataSourceManager_initWithRelevanceEngine_dataSourceLoader_withDelegate___block_invoke_2;
    v59[3] = &unk_24CF8F290;
    v60 = v27;
    v61 = v30;
    v34 = v30;
    v35 = v27;
    -[REDataSourceLoader enumerateDataSourceObjectsWithBlock:](v33, "enumerateDataSourceObjectsWithBlock:", v59);
    v36 = objc_msgSend(v34, "copy");
    identifierDataSourceMap = v11->_identifierDataSourceMap;
    v11->_identifierDataSourceMap = (NSDictionary *)v36;

    v38 = objc_msgSend(v32, "copy");
    identifierApplicationIdentifierMap = v11->_identifierApplicationIdentifierMap;
    v11->_identifierApplicationIdentifierMap = (NSDictionary *)v38;

    v40 = objc_msgSend(v31, "copy");
    identifierOperatingSystemVersionMap = v11->_identifierOperatingSystemVersionMap;
    v11->_identifierOperatingSystemVersionMap = (NSDictionary *)v40;

    v42 = objc_msgSend(v35, "copy");
    unmanagedDataSourcesMap = v11->_unmanagedDataSourcesMap;
    v11->_unmanagedDataSourcesMap = (NSDictionary *)v42;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v11->_loader;
    v57[0] = v29;
    v57[1] = 3221225472;
    v57[2] = __77__REDataSourceManager_initWithRelevanceEngine_dataSourceLoader_withDelegate___block_invoke_3;
    v57[3] = &unk_24CF8BC00;
    v58 = v44;
    v46 = v44;
    -[REDataSourceLoader enumerateBundleConfigurations:](v45, "enumerateBundleConfigurations:", v57);
    v47 = objc_msgSend(v46, "copy");
    elementGroupSupportingConfigurations = v11->_elementGroupSupportingConfigurations;
    v11->_elementGroupSupportingConfigurations = (NSSet *)v47;

    -[RERelevanceEngineSubsystem beginActivity:forObject:](v11, "beginActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"), v11);
    -[RERelevanceEngineSubsystem queue](v11, "queue");
    v49 = objc_claimAutoreleasedReturnValue();
    block[0] = v29;
    v10 = v53;
    block[1] = 3221225472;
    block[2] = __77__REDataSourceManager_initWithRelevanceEngine_dataSourceLoader_withDelegate___block_invoke_4;
    block[3] = &unk_24CF8AAF0;
    v50 = v11;
    v56 = v50;
    dispatch_async(v49, block);

    objc_msgSend(v8, "logger");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addLoggable:", v50);

    v9 = v54;
  }

  return v11;
}

- (void)setCurrentDataSourceIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void)setAvailableDataSourceIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

void __77__REDataSourceManager_initWithRelevanceEngine_dataSourceLoader_withDelegate___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v18 = a2;
  objc_msgSend((id)objc_opt_class(), "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)*MEMORY[0x24BDBCAB0];
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v3);
      RERaiseInternalException(v11, CFSTR("Data source %@ and %@ have matching bundle identifiers %@. Skipping one..."), v12, v13, v14, v15, v16, v17, (uint64_t)v18);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v18, v3);
    }
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB0], CFSTR("Data source (%@) does not have a bundle identifier"), v4, v5, v6, v7, v8, v9, (uint64_t)v18);
  }

}

void __77__REDataSourceManager_initWithRelevanceEngine_dataSourceLoader_withDelegate___block_invoke(id *a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[3];

  objc_msgSend(a2, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    if (objc_msgSend(a1[4], "objectForKeyedSubscript:", v4))
    {
      v11 = (void *)*MEMORY[0x24BDBCAB0];
      objc_msgSend(a1[4], "objectForKeyedSubscript:", v4);
      RERaiseInternalException(v11, CFSTR("Data sources %@ and %@ have matching bundle identifiers %@. Skipping one..."), v12, v13, v14, v15, v16, v17, (uint64_t)a2);
    }
    else
    {
      objc_msgSend(a1[4], "setObject:forKeyedSubscript:", a2, v4);
      objc_msgSend(a2, "applicationBundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v18, v4);

      memset(v20, 0, sizeof(v20));
      if (a2)
        objc_msgSend(a2, "minimumSupportedSystemVersion");
      objc_msgSend(MEMORY[0x24BDD1968], "value:withObjCType:", v20, "{?=qqq}");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v19, v4);

    }
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB0], CFSTR("Data source (%@) does not have a bundle identifier"), v5, v6, v7, v8, v9, v10, (uint64_t)a2);
  }

}

void __77__REDataSourceManager_initWithRelevanceEngine_dataSourceLoader_withDelegate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (REBundleConfiguraitonSupportsElementGroups(v3))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (void)_updatePreferences
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  char v13;

  -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectivePreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "disabledDataSourceIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "mode") & 1;
    v7 = ~(objc_msgSend(v4, "mode") >> 1) & 1;
    -[RERelevanceEngineSubsystem queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __41__REDataSourceManager__updatePreferences__block_invoke;
    v10[3] = &unk_24CF8F2D8;
    v11 = v5;
    v12 = v7;
    v13 = v6;
    v10[4] = self;
    v9 = v5;
    dispatch_async(v8, v10);

  }
}

void __41__REDataSourceManager__updatePreferences__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v5;
  int v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  char v13;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 48);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = v3 != v4;
  if (v3 != v4)
  {
    *(_QWORD *)(v2 + 48) = v4;
    v2 = *(_QWORD *)(a1 + 32);
  }
  v6 = *(unsigned __int8 *)(a1 + 56);
  if (*(unsigned __int8 *)(v2 + 56) != v6)
  {
    *(_BYTE *)(v2 + 56) = v6;
    v2 = *(_QWORD *)(a1 + 32);
    v5 = 1;
  }
  v7 = objc_msgSend(*(id *)(v2 + 64), "isEqualToSet:", *(_QWORD *)(a1 + 40));
  if ((v7 & 1) != 0)
  {
    if (!v5)
      goto LABEL_7;
  }
  else
  {
    v8 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 64);
    *(_QWORD *)(v9 + 64) = v8;

    if (!v5)
    {
LABEL_7:
      if ((v7 & 1) != 0)
        return;
      goto LABEL_8;
    }
  }
  v11 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __41__REDataSourceManager__updatePreferences__block_invoke_2;
  v12[3] = &__block_descriptor_41_e39_v16__0__REElementDataSourceController_8l;
  v12[4] = *(_QWORD *)(a1 + 48);
  v13 = *(_BYTE *)(a1 + 56);
  objc_msgSend(v11, "enumerateElementDataSourceControllers:", v12);
  if ((v7 & 1) != 0)
    return;
LABEL_8:
  objc_msgSend(*(id *)(a1 + 32), "_queue_availableDataSourcesDidChange");
}

void __52__REDataSourceManager__prioritizedDataSourceClasses__block_invoke()
{
  void *v0;
  id v1;
  void (**v2)(_QWORD, _QWORD);
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__REDataSourceManager__prioritizedDataSourceClasses__block_invoke_2;
  v5[3] = &unk_24CF8F0F8;
  v6 = v0;
  v1 = v0;
  v2 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199B2434](v5);
  ((void (**)(_QWORD, const __CFString *))v2)[2](v2, CFSTR("RESiriSnippetDataSource"));
  ((void (**)(_QWORD, const __CFString *))v2)[2](v2, CFSTR("REBreatheDataSource"));
  ((void (**)(_QWORD, const __CFString *))v2)[2](v2, CFSTR("NTKUpNextNewsDataSource"));
  ((void (**)(_QWORD, const __CFString *))v2)[2](v2, CFSTR("NSREDataSource"));
  v3 = objc_msgSend(v1, "copy");
  v4 = (void *)_prioritizedDataSourceClasses_Classes;
  _prioritizedDataSourceClasses_Classes = v3;

}

Class __52__REDataSourceManager__prioritizedDataSourceClasses__block_invoke_2(uint64_t a1, NSString *aClassName)
{
  Class result;

  result = NSClassFromString(aClassName);
  if (result)
    return (Class)objc_msgSend(*(id *)(a1 + 32), "addObject:", result);
  return result;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeLoggable:", self);

  v6.receiver = self;
  v6.super_class = (Class)REDataSourceManager;
  -[RERelevanceEngineSubsystem dealloc](&v6, sel_dealloc);
}

void __41__REDataSourceManager__updatePreferences__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setState:", v3);
  objc_msgSend(v4, "setAllowsLocationUse:", *(unsigned __int8 *)(a1 + 40));

}

- (void)pause
{
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_dataSourceControllers, "enumerateObjectsUsingBlock:", &__block_literal_global_35_2);
}

uint64_t __28__REDataSourceManager_pause__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pause");
}

- (void)resume
{
  REExpectation *v3;
  dispatch_group_t v4;
  NSMutableArray *dataSourceControllers;
  uint64_t v6;
  NSObject *v7;
  REExpectation *v8;
  void *v9;
  dispatch_block_t v10;
  NSMutableArray *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  NSObject *v16;
  _QWORD v17[5];
  NSObject *v18;
  REExpectation *v19;

  v3 = objc_alloc_init(REExpectation);
  -[RERelevanceEngineSubsystem beginActivity:forObject:](self, "beginActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"), self);
  v4 = dispatch_group_create();
  dataSourceControllers = self->_dataSourceControllers;
  v6 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __29__REDataSourceManager_resume__block_invoke;
  v17[3] = &unk_24CF8F340;
  v17[4] = self;
  v7 = v4;
  v18 = v7;
  v19 = v3;
  v8 = v3;
  -[NSMutableArray enumerateObjectsUsingBlock:](dataSourceControllers, "enumerateObjectsUsingBlock:", v17);
  -[RERelevanceEngineSubsystem queue](self, "queue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, -1, &__block_literal_global_37);
  -[REExpectation notifyOperationsCompleteOrPerformUsingQueue:block:](v8, "notifyOperationsCompleteOrPerformUsingQueue:block:", v9, v10);

  v11 = self->_dataSourceControllers;
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __29__REDataSourceManager_resume__block_invoke_4;
  v15[3] = &unk_24CF8F388;
  v15[4] = self;
  v16 = v7;
  v12 = v7;
  -[NSMutableArray enumerateObjectsUsingBlock:](v11, "enumerateObjectsUsingBlock:", v15);
  -[RERelevanceEngineSubsystem queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __29__REDataSourceManager_resume__block_invoke_6;
  v14[3] = &unk_24CF8AAF0;
  v14[4] = self;
  dispatch_group_notify(v12, v13, v14);

}

void __29__REDataSourceManager_resume__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;

  v3 = a2;
  if (objc_msgSend((id)objc_opt_class(), "_isPrioritizedDataSourceClass:", objc_msgSend(v3, "dataSourceClass")))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "beginOperation");
    objc_msgSend(v3, "resume");
    v5 = MEMORY[0x24BDAC760];
    v6 = 3221225472;
    v7 = __29__REDataSourceManager_resume__block_invoke_2;
    v8 = &unk_24CF8AB18;
    v9 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 40);
    v4 = (void *)MEMORY[0x2199B2434](&v5);
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 121))
      objc_msgSend(v3, "processPendingUpdatesWhilePause:", v4, v5, v6, v7, v8, v9);
    else
      objc_msgSend(v3, "invalidateAndReloadWithCompletion:", v4, v5, v6, v7, v8, v9);

  }
}

void __29__REDataSourceManager_resume__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "endOperation");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __29__REDataSourceManager_resume__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  if ((objc_msgSend((id)objc_opt_class(), "_isPrioritizedDataSourceClass:", objc_msgSend(v3, "dataSourceClass")) & 1) == 0)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    objc_msgSend(v3, "resume");
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __29__REDataSourceManager_resume__block_invoke_5;
    v5[3] = &unk_24CF8AAF0;
    v6 = *(id *)(a1 + 40);
    v4 = (void *)MEMORY[0x2199B2434](v5);
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 121))
      objc_msgSend(v3, "processPendingUpdatesWhilePause:", v4);
    else
      objc_msgSend(v3, "invalidateAndReloadWithCompletion:", v4);

  }
}

void __29__REDataSourceManager_resume__block_invoke_5(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __29__REDataSourceManager_resume__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"), *(_QWORD *)(a1 + 32));
}

- (void)enumerateElementDataSourceControllers:(id)a3
{
  -[REDataSourceManager enumerateElementDataSourceControllers:completion:](self, "enumerateElementDataSourceControllers:completion:", a3, 0);
}

- (void)enumerateElementDataSourceControllers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[RERelevanceEngineSubsystem queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__REDataSourceManager_enumerateElementDataSourceControllers_completion___block_invoke;
    block[3] = &unk_24CF8CD88;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(v8, block);

  }
}

void __72__REDataSourceManager_enumerateElementDataSourceControllers_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[2] = __72__REDataSourceManager_enumerateElementDataSourceControllers_completion___block_invoke_2;
  v5[3] = &unk_24CF8F3B0;
  v5[1] = 3221225472;
  v6 = v2;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);
  v4 = a1[6];
  if (v4)
    (*(void (**)(void))(v4 + 16))();

}

uint64_t __72__REDataSourceManager_enumerateElementDataSourceControllers_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)minimumSupportedSystemVersionForDataSourceWithIdentifier:(SEL)a3
{
  void *v5;
  id v6;

  if (a4)
  {
    objc_msgSend((id)self[3].var2, "objectForKey:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    retstr->var1 = 0;
    retstr->var2 = 0;
    retstr->var0 = 0;
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "getValue:", retstr);
      v5 = v6;
    }

  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }
  return self;
}

- (void)_queue_unloadDataSourceWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *dataSourceControllers;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0x7FFFFFFFFFFFFFFFLL;
    dataSourceControllers = self->_dataSourceControllers;
    v7 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __61__REDataSourceManager__queue_unloadDataSourceWithIdentifier___block_invoke;
    v20[3] = &unk_24CF8F3D8;
    v8 = v4;
    v21 = v8;
    v22 = &v23;
    -[NSMutableArray enumerateObjectsUsingBlock:](dataSourceControllers, "enumerateObjectsUsingBlock:", v20);
    if (v24[3] != 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = 0;
      v15 = &v14;
      v16 = 0x3032000000;
      v17 = __Block_byref_object_copy__20;
      v18 = __Block_byref_object_dispose__20;
      -[NSMutableArray objectAtIndexedSubscript:](self->_dataSourceControllers, "objectAtIndexedSubscript:");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v15[5], "pause");
      objc_msgSend((id)v15[5], "prepareToUnload");
      objc_msgSend((id)v15[5], "elementOperationQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      v13[0] = v7;
      v13[1] = 3221225472;
      v13[2] = __61__REDataSourceManager__queue_unloadDataSourceWithIdentifier___block_invoke_39;
      v13[3] = &unk_24CF8C1F0;
      v13[4] = self;
      v13[5] = &v14;
      dispatch_async(v9, v13);

      -[REDataSourceManager currentDataSourceIdentifiers](self, "currentDataSourceIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");

      objc_msgSend(v11, "removeObject:", v8);
      v12 = (void *)objc_msgSend(v11, "copy");
      -[REDataSourceManager setCurrentDataSourceIdentifiers:](self, "setCurrentDataSourceIdentifiers:", v12);

      -[NSMutableArray removeObjectAtIndex:](self->_dataSourceControllers, "removeObjectAtIndex:", v24[3]);
      _Block_object_dispose(&v14, 8);

    }
    _Block_object_dispose(&v23, 8);
  }

}

void __61__REDataSourceManager__queue_unloadDataSourceWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;

  objc_msgSend(a2, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

void __61__REDataSourceManager__queue_unloadDataSourceWithIdentifier___block_invoke_39(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 160));
  objc_msgSend(WeakRetained, "dataSourceManager:willUnloadDataSourceController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

- (void)_handleApplicationStateChange
{
  NSObject *v3;
  _QWORD block[5];

  -[RERelevanceEngineSubsystem queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__REDataSourceManager__handleApplicationStateChange__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __52__REDataSourceManager__handleApplicationStateChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_availableDataSourcesDidChange");
}

- (NSSet)unrestirctedDataSourceIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[NSDictionary allKeys](self->_identifierDataSourceMap, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSArray)dataSourceControllers
{
  return (NSArray *)self->_dataSourceControllers;
}

- (NSSet)disabledDataSources
{
  return self->_disabledDataSources;
}

- (REDataSourceLoader)loader
{
  return self->_loader;
}

- (NSArray)currentDataSources
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (REDataSourceManagerObserver)delegate
{
  return (REDataSourceManagerObserver *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)hasCompletedFirstElementLoad
{
  return self->_completedFirstElementLoad;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentDataSources, 0);
  objc_storeStrong((id *)&self->_currentDataSourceIdentifiers, 0);
  objc_storeStrong((id *)&self->_availableDataSourceIdentifiers, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_elementGroupMap, 0);
  objc_storeStrong((id *)&self->_elementGroupSupportingConfigurations, 0);
  objc_storeStrong((id *)&self->_unmanagedDataSourcesMap, 0);
  objc_storeStrong((id *)&self->_identifierOperatingSystemVersionMap, 0);
  objc_storeStrong((id *)&self->_identifierApplicationIdentifierMap, 0);
  objc_storeStrong((id *)&self->_identifierDataSourceMap, 0);
  objc_storeStrong((id *)&self->_disabledDataSources, 0);
  objc_storeStrong((id *)&self->_dataSourceControllers, 0);
}

- (Class)classForDataSourceIdentifier:(id)a3
{
  return (Class)-[NSDictionary objectForKeyedSubscript:](self->_identifierDataSourceMap, "objectForKeyedSubscript:", a3);
}

- (id)elementGroupForIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  NSSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  REDataSourceManager *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[REConcurrentDictionary objectForKeyedSubscript:](self->_elementGroupMap, "objectForKeyedSubscript:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", v6);

    if (v8)
    {

      v6 = 0;
    }
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = self->_elementGroupSupportingConfigurations;
    v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v10)
    {
      v11 = v10;
      v25 = 112;
      v26 = self;
      v6 = 0;
      v12 = *(_QWORD *)v28;
      v13 = (void *)*MEMORY[0x24BDBCAB8];
      do
      {
        v14 = 0;
        v15 = v6;
        do
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v14), "elementGroupWithIdentifier:", v4, v25);
          v6 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "groupIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", v4);

          if ((v17 & 1) != 0)
          {
            if (v6)
            {
              objc_msgSend(*(id *)((char *)&v26->super.super.isa + v25), "setObject:forKeyedSubscript:", v6, v4);
              goto LABEL_17;
            }
          }
          else
          {
            RERaiseInternalException(v13, CFSTR("The group identifiers should match"), v18, v19, v20, v21, v22, v23, v25);
          }
          ++v14;
          v15 = v6;
        }
        while (v11 != v14);
        v11 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v11);
    }
    else
    {
      v6 = 0;
    }
LABEL_17:

  }
  return v6;
}

@end
