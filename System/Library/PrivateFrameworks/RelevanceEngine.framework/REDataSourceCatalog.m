@implementation REDataSourceCatalog

- (REDataSourceCatalog)initWithDataSourceManager:(id)a3
{
  id v5;
  REDataSourceCatalog *v6;
  REDataSourceCatalog *v7;
  NSCache *v8;
  NSCache *iconCache;
  uint64_t v10;
  NSMutableDictionary *localizedNameCache;
  uint64_t v12;
  OS_dispatch_queue *queue;
  uint64_t v14;
  REAppIconCache *appIconCache;
  uint64_t v16;
  REAppNameCache *appNameCache;
  void *v18;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)REDataSourceCatalog;
  v6 = -[REDataSourceCatalog init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSourceManager, a3);
    v8 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    iconCache = v7->_iconCache;
    v7->_iconCache = v8;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    localizedNameCache = v7->_localizedNameCache;
    v7->_localizedNameCache = (NSMutableDictionary *)v10;

    objc_msgSend(v5, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v12;

    +[RESingleton sharedInstance](REAppIconCache, "sharedInstance");
    v14 = objc_claimAutoreleasedReturnValue();
    appIconCache = v7->_appIconCache;
    v7->_appIconCache = (REAppIconCache *)v14;

    +[RESingleton sharedInstance](REAppNameCache, "sharedInstance");
    v16 = objc_claimAutoreleasedReturnValue();
    appNameCache = v7->_appNameCache;
    v7->_appNameCache = (REAppNameCache *)v16;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v7, sel__applicationsStatesDidChange, CFSTR("REApplicationStateDidChange"), 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)REDataSourceCatalog;
  -[REDataSourceCatalog dealloc](&v4, sel_dealloc);
}

- (void)_applicationsStatesDidChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__REDataSourceCatalog__applicationsStatesDidChange__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __51__REDataSourceCatalog__applicationsStatesDidChange__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

- (NSSet)dataSourceIdentifiers
{
  return -[REDataSourceManager availableDataSourceIdentifiers](self->_dataSourceManager, "availableDataSourceIdentifiers");
}

- (NSSet)unrestrictedDataSourceIdentifiers
{
  return -[REDataSourceManager unrestirctedDataSourceIdentifiers](self->_dataSourceManager, "unrestirctedDataSourceIdentifiers");
}

- (void)enumerateDataSources:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[REDataSourceManager currentDataSources](self->_dataSourceManager, "currentDataSources", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)donatedAppIdentifiersWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[RESingleton sharedInstance](REDuetKnowledgeStore, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queryForAllRelevantShortcuts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[RESingleton sharedInstance](REDuetKnowledgeStore, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __59__REDataSourceCatalog_donatedAppIdentifiersWithCompletion___block_invoke;
    v14[3] = &unk_24CF8E728;
    v9 = v4;
    v15 = v9;
    objc_msgSend(v7, "executeQuerySynchronouslyWithBatching:completion:", v6, v14);

    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __59__REDataSourceCatalog_donatedAppIdentifiersWithCompletion___block_invoke_2;
    block[3] = &unk_24CF8B2E0;
    v12 = v9;
    v13 = v3;
    v10 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __59__REDataSourceCatalog_donatedAppIdentifiersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  v5 = (void *)MEMORY[0x24BDBD1A8];
  if (v3)
    v5 = v3;
  v6 = v5;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "bundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = *(void **)(a1 + 32);
          objc_msgSend(v11, "bundleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

void __59__REDataSourceCatalog_donatedAppIdentifiersWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)localAndRemoteAppIdentifiersForDataSourceIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        -[objc_class applicationBundleIdentifier](-[REDataSourceManager classForDataSourceIdentifier:](self->_dataSourceManager, "classForDataSourceIdentifier:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10), (_QWORD)v15), "applicationBundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v5, "addObject:", v11);
          RELocalApplicationIdentifierForRemoteApplication(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v5, "addObject:", v12);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

- (void)imageForApplicationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id *v10;
  NSObject *queue;
  _QWORD v12[4];
  id v13;
  _QWORD block[4];
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      +[RESingleton sharedInstance](REAppIconCache, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __68__REDataSourceCatalog_imageForApplicationWithIdentifier_completion___block_invoke_2;
      v12[3] = &unk_24CF8E750;
      v10 = &v13;
      v13 = v8;
      objc_msgSend(v9, "iconForApplicationWithIdentifier:completion:", v6, v12);

    }
    else
    {
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __68__REDataSourceCatalog_imageForApplicationWithIdentifier_completion___block_invoke;
      block[3] = &unk_24CF8B1B0;
      v10 = &v15;
      v15 = v7;
      dispatch_async(queue, block);
    }

  }
}

uint64_t __68__REDataSourceCatalog_imageForApplicationWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__REDataSourceCatalog_imageForApplicationWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)imageForDataSourceWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  uint64_t v9;
  id v10;
  BOOL v11;
  NSObject *queue;
  objc_class *v13;
  objc_class *v14;
  id v15;
  void *v16;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  void (**v21)(_QWORD, _QWORD);
  _QWORD v22[4];
  void (**v23)(_QWORD, _QWORD);
  _QWORD block[4];
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (v7)
  {
    if (!v6)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __67__REDataSourceCatalog_imageForDataSourceWithIdentifier_completion___block_invoke;
      block[3] = &unk_24CF8B1B0;
      v25 = v7;
      dispatch_async(queue, block);
      v11 = 0;
      v10 = v25;
      goto LABEL_15;
    }
    -[NSCache objectForKey:](self->_iconCache, "objectForKey:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (id)v9;
LABEL_5:
      ((void (**)(_QWORD, id))v8)[2](v8, v10);
      v11 = 1;
LABEL_15:

      goto LABEL_16;
    }
    v13 = -[REDataSourceManager classForDataSourceIdentifier:](self->_dataSourceManager, "classForDataSourceIdentifier:", v6);
    if (v13)
    {
      v14 = v13;
      -[objc_class overrideDataSourceImage](v13, "overrideDataSourceImage");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[NSCache setObject:forKey:](self->_iconCache, "setObject:forKey:", v10, v6);
        goto LABEL_5;
      }
      -[objc_class applicationBundleIdentifier](v14, "applicationBundleIdentifier");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        v18 = self->_queue;
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __67__REDataSourceCatalog_imageForDataSourceWithIdentifier_completion___block_invoke_2;
        v22[3] = &unk_24CF8B1B0;
        v23 = v8;
        dispatch_async(v18, v22);
        v16 = v23;
        goto LABEL_14;
      }
    }
    else
    {
      v15 = v6;
    }
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __67__REDataSourceCatalog_imageForDataSourceWithIdentifier_completion___block_invoke_3;
    v19[3] = &unk_24CF8B910;
    v19[4] = self;
    v20 = v15;
    v21 = v8;
    v10 = v15;
    -[REDataSourceCatalog imageForApplicationWithIdentifier:completion:](self, "imageForApplicationWithIdentifier:completion:", v10, v19);

    v16 = v20;
LABEL_14:

    v11 = 0;
    goto LABEL_15;
  }
  v11 = 0;
LABEL_16:

  return v11;
}

uint64_t __67__REDataSourceCatalog_imageForDataSourceWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__REDataSourceCatalog_imageForDataSourceWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__REDataSourceCatalog_imageForDataSourceWithIdentifier_completion___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (v3)
    objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKey:", v3, a1[5]);
  (*(void (**)(void))(a1[6] + 16))();

}

- (id)localizedNameForApplicationWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!v4)
    goto LABEL_7;
  -[REAppNameCache localizedNameForApplicationWithIdentifier:](self->_appNameCache, "localizedNameForApplicationWithIdentifier:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (_fetchedInternalBuildOnceToken_2 != -1)
      dispatch_once(&_fetchedInternalBuildOnceToken_2, &__block_literal_global_39);
    if (_isInternalDevice_2)
    {
      v5 = v4;
      goto LABEL_8;
    }
LABEL_7:
    v5 = 0;
  }
LABEL_8:

  return v5;
}

uint64_t __65__REDataSourceCatalog_localizedNameForApplicationWithIdentifier___block_invoke()
{
  uint64_t result;

  result = _REGetIsInternalBuild();
  _isInternalDevice_2 = result;
  return result;
}

- (id)localizedNameForDataSourceWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  objc_class *v7;
  uint64_t v8;
  void *v10;

  v4 = a3;
  if (!v4)
    goto LABEL_6;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_localizedNameCache, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_7;
  v6 = -[REDataSourceManager classForDataSourceIdentifier:](self->_dataSourceManager, "classForDataSourceIdentifier:", v4);
  if (!v6)
  {
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  v7 = v6;
  -[objc_class overrideLocalizedDataSourceName](v6, "overrideLocalizedDataSourceName");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v5 = (void *)v8;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_localizedNameCache, "setObject:forKeyedSubscript:", v8, v4);
  }
  else
  {
    -[objc_class applicationBundleIdentifier](v7, "applicationBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[REDataSourceCatalog localizedNameForApplicationWithIdentifier:](self, "localizedNameForApplicationWithIdentifier:", v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_localizedNameCache, "setObject:forKeyedSubscript:", v5, v10);
    }
    else
    {
      v5 = 0;
    }

  }
LABEL_7:

  return v5;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)minimumSupportedSystemVersionForDataSourceWithIdentifier:(SEL)a3
{
  $9FE6E10C8CE45DBC9A88DFDEA39A390D *result;

  result = ($9FE6E10C8CE45DBC9A88DFDEA39A390D *)self->_dataSourceManager;
  if (result)
    return ($9FE6E10C8CE45DBC9A88DFDEA39A390D *)-[$9FE6E10C8CE45DBC9A88DFDEA39A390D minimumSupportedSystemVersionForDataSourceWithIdentifier:](result, "minimumSupportedSystemVersionForDataSourceWithIdentifier:", a4);
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  return result;
}

- (id)applicationIdentifierForDataSourceWithIdentifier:(id)a3
{
  return (id)-[objc_class applicationBundleIdentifier](-[REDataSourceManager classForDataSourceIdentifier:](self->_dataSourceManager, "classForDataSourceIdentifier:", a3), "applicationBundleIdentifier");
}

- (BOOL)wantsApplicationPrewarmForDataSourceWithIdentifier:(id)a3
{
  REDataSourceManager *dataSourceManager;
  id v5;
  objc_class *v6;
  void *v7;
  char v8;

  dataSourceManager = self->_dataSourceManager;
  v5 = a3;
  v6 = -[REDataSourceManager classForDataSourceIdentifier:](dataSourceManager, "classForDataSourceIdentifier:", v5);
  -[REDataSourceCatalog applicationIdentifierForDataSourceWithIdentifier:](self, "applicationIdentifierForDataSourceWithIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = -[objc_class wantsAppPrewarm](v6, "wantsAppPrewarm");
  else
    v8 = 0;

  return v8;
}

- (BOOL)requiresLocationInUseAssertonForDataSourceWithIdentifier:(id)a3
{
  return -[objc_class wantsLocationInUseAsserton](-[REDataSourceManager classForDataSourceIdentifier:](self->_dataSourceManager, "classForDataSourceIdentifier:", a3), "wantsLocationInUseAsserton");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appNameCache, 0);
  objc_storeStrong((id *)&self->_appIconCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localizedNameCache, 0);
  objc_storeStrong((id *)&self->_iconCache, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
}

@end
