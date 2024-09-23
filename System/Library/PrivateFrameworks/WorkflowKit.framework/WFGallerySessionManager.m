@implementation WFGallerySessionManager

- (WFGallerySessionManager)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  WFGallerySessionManager *v14;

  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", CFSTR("WFGalleryEnvironment"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = (void *)*MEMORY[0x1E0D142F0];
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "BOOLForKey:", CFSTR("WFGallerySandbox")))
    v9 = 2;
  else
    v9 = 1;

  objc_msgSend(MEMORY[0x1E0C94C28], "containerIDForContainerIdentifier:environment:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:", v10);
  objc_msgSend(v11, "wf_setShortcutsAppAttribution");
  v12 = (void *)MGCopyAnswer();
  +[WFGallerySessionManager currentDeviceIdiom](WFGallerySessionManager, "currentDeviceIdiom");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WFGallerySessionManager initWithContainer:preferredLocalizations:currentRegion:currentIdiom:performExpensiveFetchOperations:](self, "initWithContainer:preferredLocalizations:currentRegion:currentIdiom:performExpensiveFetchOperations:", v11, 0, v12, v13, 0);

  return v14;
}

- (WFGallerySessionManager)initWithContainer:(id)a3 preferredLocalizations:(id)a4 currentRegion:(id)a5 currentIdiom:(id)a6 performExpensiveFetchOperations:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  WFGallerySessionManager *v17;
  WFGallerySessionManager *v18;
  uint64_t v19;
  CKDatabase *database;
  NSArray *v21;
  NSArray *preferredLocalizations;
  uint64_t v23;
  NSString *currentRegion;
  uint64_t v25;
  NSString *currentIdiom;
  uint64_t v27;
  NSCache *workflowSearchCache;
  uint64_t v29;
  NSCache *collectionSearchCache;
  uint64_t v31;
  NSCache *pageCache;
  uint64_t v33;
  NSCache *workflowCache;
  uint64_t v35;
  NSCache *bannerImageCache;
  WFGallerySessionManager *v37;
  objc_super v39;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v39.receiver = self;
  v39.super_class = (Class)WFGallerySessionManager;
  v17 = -[WFGallerySessionManager init](&v39, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_container, a3);
    -[CKContainer publicCloudDatabase](v18->_container, "publicCloudDatabase");
    v19 = objc_claimAutoreleasedReturnValue();
    database = v18->_database;
    v18->_database = (CKDatabase *)v19;

    if (v14)
    {
      v21 = (NSArray *)v14;
    }
    else
    {
      +[WFGallerySessionManager defaultPreferredLocalizations](WFGallerySessionManager, "defaultPreferredLocalizations");
      v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    preferredLocalizations = v18->_preferredLocalizations;
    v18->_preferredLocalizations = v21;

    v23 = objc_msgSend(v15, "copy");
    currentRegion = v18->_currentRegion;
    v18->_currentRegion = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    currentIdiom = v18->_currentIdiom;
    v18->_currentIdiom = (NSString *)v25;

    v18->_performExpensiveFetchOperations = a7;
    v27 = objc_opt_new();
    workflowSearchCache = v18->_workflowSearchCache;
    v18->_workflowSearchCache = (NSCache *)v27;

    v29 = objc_opt_new();
    collectionSearchCache = v18->_collectionSearchCache;
    v18->_collectionSearchCache = (NSCache *)v29;

    v31 = objc_opt_new();
    pageCache = v18->_pageCache;
    v18->_pageCache = (NSCache *)v31;

    v33 = objc_opt_new();
    workflowCache = v18->_workflowCache;
    v18->_workflowCache = (NSCache *)v33;

    v35 = objc_opt_new();
    bannerImageCache = v18->_bannerImageCache;
    v18->_bannerImageCache = (NSCache *)v35;

    v37 = v18;
  }

  return v18;
}

- (int64_t)version
{
  void *v2;
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE90]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (VCIsInternalBuild())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "BOOLForKey:", CFSTR("WFGalleryOverrideBuildKey")))
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "integerForKey:", CFSTR("WFGalleryOverrideBuildVersionKey"));

    }
  }
  getWFGalleryLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "-[WFGallerySessionManager version]";
    v11 = 2048;
    v12 = v4;
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_INFO, "%s using build version: %li", (uint8_t *)&v9, 0x16u);
  }

  return v4;
}

- (NSString)containerDescription
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;

  if (!os_variant_has_internal_content())
    return 0;
  -[WFGallerySessionManager container](self, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D142F0]);

  -[WFGallerySessionManager container](self, "container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "environment");

  if (v5)
  {
    if (v8 == 2)
      return (NSString *)CFSTR("Dev");
    else
      return 0;
  }
  else if (v8 == 2)
  {
    return (NSString *)CFSTR("QA (Dev)");
  }
  else
  {
    return (NSString *)CFSTR("QA");
  }
}

- (id)createItemRequest
{
  WFCloudKitItemRequest *v3;
  void *v4;
  void *v5;
  WFCloudKitItemRequest *v6;

  v3 = [WFCloudKitItemRequest alloc];
  -[WFGallerySessionManager container](self, "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFGallerySessionManager database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFCloudKitItemRequest initWithContainer:database:](v3, "initWithContainer:database:", v4, v5);

  -[WFCloudKitItemRequest setPerformExpensiveFetchOperations:](v6, "setPerformExpensiveFetchOperations:", -[WFGallerySessionManager performExpensiveFetchOperations](self, "performExpensiveFetchOperations"));
  return v6;
}

- (void)getHomeWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFGallerySessionManager preferredLocalizations](self, "preferredLocalizations");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFGallerySessionManager getHomeWithPreferredLanguages:completionHandler:](self, "getHomeWithPreferredLanguages:completionHandler:", v5, v4);

}

- (void)getHomeWithPreferredLanguages:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isRoot = 1 AND language IN %@ AND minVersion <= %ld"), v6, -[WFGallerySessionManager version](self, "version"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFGallerySessionManager createItemRequest](self, "createItemRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__WFGallerySessionManager_getHomeWithPreferredLanguages_completionHandler___block_invoke;
  v14[3] = &unk_1E7AF7FC8;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v11 = v7;
  v12 = v6;
  v13 = (id)objc_msgSend(v9, "fetchItemsWithPredicate:itemType:groupName:properties:completionHandler:", v8, v10, CFSTR("GalleryPageQuery"), &unk_1E7B8DB50, v14);

}

- (void)getPageWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  id v15;
  void (**v16)(id, void *, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  -[WFGallerySessionManager pageCache](self, "pageCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v7[2](v7, v10, 0);
  }
  else
  {
    -[WFGallerySessionManager createItemRequest](self, "createItemRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_class();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__WFGallerySessionManager_getPageWithID_completionHandler___block_invoke;
    v14[3] = &unk_1E7AF7DF0;
    v14[4] = self;
    v15 = v6;
    v16 = v7;
    v13 = (id)objc_msgSend(v11, "fetchItemWithID:itemType:groupName:properties:completionHandler:", v15, v12, CFSTR("GalleryFetch"), 0, v14);

  }
}

- (id)getImageForBanner:(id)a3 size:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, uint64_t, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  WFCloudKitTask *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v22;
  _QWORD v23[5];
  id v24;
  void (**v25)(id, void *, uint64_t, _QWORD);
  int64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *, uint64_t, _QWORD))a5;
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recordName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@-%ld"), v12, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFGallerySessionManager bannerImageCache](self, "bannerImageCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v9[2](v9, v15, 1, 0);
    v16 = objc_alloc_init(WFCloudKitTask);
  }
  else
  {
    -[WFGallerySessionManager createItemRequest](self, "createItemRequest");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_class();
    +[WFGalleryBanner propertyForSize:](WFGalleryBanner, "propertyForSize:", a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __68__WFGallerySessionManager_getImageForBanner_size_completionHandler___block_invoke;
    v23[3] = &unk_1E7AF7E18;
    v26 = a4;
    v23[4] = self;
    v24 = v13;
    v25 = v9;
    objc_msgSend(v22, "fetchItemWithID:itemType:groupName:properties:completionHandler:", v17, v18, CFSTR("GalleryFetch"), v20, v23);
    v16 = (WFCloudKitTask *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (id)preferredPageInPages:(id)a3 preferredLanguages:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_163);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "objectMatchingKey:value:", CFSTR("language"), *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), (_QWORD)v15);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (id)pageWithoutRestrictedContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[5];

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v4, "collections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__WFGallerySessionManager_pageWithoutRestrictedContent___block_invoke;
  v13[3] = &unk_1E7AF7E80;
  v13[4] = self;
  objc_msgSend(v6, "if_compactMap:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCollections:", v8);

  objc_msgSend(v4, "banners");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __56__WFGallerySessionManager_pageWithoutRestrictedContent___block_invoke_2;
  v12[3] = &unk_1E7AF7EA8;
  v12[4] = self;
  objc_msgSend(v9, "if_compactMap:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBanners:", v10);

  return v5;
}

- (id)collectionWithoutRestrictedContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v4, "workflows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__WFGallerySessionManager_collectionWithoutRestrictedContent___block_invoke;
  v9[3] = &unk_1E7AF7ED0;
  v9[4] = self;
  objc_msgSend(v6, "if_objectsPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWorkflows:", v7);

  return v5;
}

- (BOOL)bannerIsRestricted:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  v4 = a3;
  objc_msgSend(v4, "supportedIdioms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[WFGallerySessionManager currentIdiom](self, "currentIdiom");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v4, "supportedIdioms");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFGallerySessionManager currentIdiom](self, "currentIdiom");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "containsObject:", v9) ^ 1;

    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)collectionIsRestricted:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  v4 = a3;
  objc_msgSend(v4, "supportedIdioms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[WFGallerySessionManager currentIdiom](self, "currentIdiom");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v4, "supportedIdioms");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFGallerySessionManager currentIdiom](self, "currentIdiom");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "containsObject:", v9) ^ 1;

    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)workflowIsRestricted:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;

  v4 = a3;
  objc_msgSend(v4, "hiddenRegions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[WFGallerySessionManager currentRegion](self, "currentRegion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v4, "hiddenRegions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFGallerySessionManager currentRegion](self, "currentRegion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "containsObject:", v9);

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
  objc_msgSend(v4, "supportedIdioms");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    -[WFGallerySessionManager currentIdiom](self, "currentIdiom");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v4, "supportedIdioms");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFGallerySessionManager currentIdiom](self, "currentIdiom");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "containsObject:", v15) ^ 1;

    }
    else
    {
      LOBYTE(v16) = 0;
    }

  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v10 | v16;
}

- (id)loadWorkflowInGalleryWorkflow:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[5];
  void (**v20)(id, void *, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  -[WFGallerySessionManager workflowCache](self, "workflowCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v7[2](v7, v11, 0);
  }
  else
  {
    objc_msgSend(v6, "workflowRecord");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      -[WFGallerySessionManager createItemRequest](self, "createItemRequest");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_opt_class();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __75__WFGallerySessionManager_loadWorkflowInGalleryWorkflow_completionHandler___block_invoke;
      v19[3] = &unk_1E7AF7F00;
      v19[4] = self;
      v20 = v7;
      objc_msgSend(v16, "fetchItemWithID:itemType:groupName:properties:completionHandler:", v17, v18, CFSTR("GalleryFetch"), &unk_1E7B8DB68, v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
    objc_msgSend(v6, "workflowRecord");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v13, 0);

  }
  v14 = 0;
LABEL_6:

  return v14;
}

- (id)searchWorkflowsAndCollections:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD *v21;
  _QWORD v22[4];
  id v23;
  WFGallerySessionManager *v24;
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__58944;
  v28[4] = __Block_byref_object_dispose__58945;
  v29 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __75__WFGallerySessionManager_searchWorkflowsAndCollections_completionHandler___block_invoke;
  v22[3] = &unk_1E7AF7F78;
  v10 = v8;
  v23 = v10;
  v11 = v7;
  v26 = v11;
  v24 = self;
  v12 = v6;
  v25 = v12;
  v27 = v28;
  -[WFGallerySessionManager searchWorkflows:completionHandler:](self, "searchWorkflows:completionHandler:", v12, v22);
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __75__WFGallerySessionManager_searchWorkflowsAndCollections_completionHandler___block_invoke_6;
  v18[3] = &unk_1E7AF7FA0;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v19 = v13;
  v21 = v28;
  v14 = v11;
  v20 = v14;
  objc_msgSend(v10, "setCancellationHandler:", v18);
  v15 = v20;
  v16 = v10;

  _Block_object_dispose(v28, 8);
  return v16;
}

- (id)searchWorkflows:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v21[5];
  id v22;
  void (**v23)(id, void *, _QWORD);
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFGallerySessionManager workflowSearchCache](self, "workflowSearchCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v7[2](v7, v11, 0);
    v12 = 0;
  }
  else
  {
    -[WFGallerySessionManager queryFilterForTokenizedKey:query:](self, "queryFilterForTokenizedKey:query:", CFSTR("name"), v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFCloudKitWebServiceQueryFilter filterWithComparisonOf:toInt:by:](WFCloudKitWebServiceQueryFilter, "filterWithComparisonOf:toInt:by:", CFSTR("searchable"), 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFGallerySessionManager preferredLocalizations](self, "preferredLocalizations");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFCloudKitWebServiceQueryFilter filterWithComparisonOf:toStringArray:by:](WFCloudKitWebServiceQueryFilter, "filterWithComparisonOf:toStringArray:by:", CFSTR("language"), v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v24[0] = v13;
    v24[1] = v14;
    v24[2] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFCloudKitWebServiceQueryFilter filterWithCombinationOf:by:](WFCloudKitWebServiceQueryFilter, "filterWithCombinationOf:by:", v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_opt_class();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __61__WFGallerySessionManager_searchWorkflows_completionHandler___block_invoke;
    v21[3] = &unk_1E7AF7FC8;
    v23 = v7;
    v21[4] = self;
    v22 = v9;
    -[WFGallerySessionManager searchUsingWebServicesForItem:query:queryFilter:completionHandler:](self, "searchUsingWebServicesForItem:query:queryFilter:completionHandler:", v19, v6, v18, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)searchUsingWebServicesForItem:(Class)a3 query:(id)a4 queryFilter:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  WFCloudKitWebServiceRequest *v13;
  void *v14;
  uint64_t v15;
  WFCloudKitWebServiceRequest *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = [WFCloudKitWebServiceRequest alloc];
  -[WFGallerySessionManager container](self, "container");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFGallerySessionManager database](self, "database");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = -[WFCloudKitWebServiceRequest initWithContainer:database:](v13, "initWithContainer:database:", v14, v15);

  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = objc_msgSend(v17, "BOOLForKey:", CFSTR("WFDisableGallerySearchEdgeCaching"));

  if ((v15 & 1) != 0)
  {
    v18 = 0;
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    -[WFGallerySessionManager container](self, "container");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "containerIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class recordType](a3, "recordType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@-%@-%li"), v21, v22, objc_msgSend(v10, "hash"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[WFCloudKitWebServiceRequest fetchRecordsWithItemType:filter:cacheKey:completionHandler:](v16, "fetchRecordsWithItemType:filter:cacheKey:completionHandler:", a3, v11, v18, v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)queryFilterForTokenizedKey:(id)a3 query:(id)a4
{
  return +[WFCloudKitWebServiceQueryFilter filterWithComparisonOf:toString:by:](WFCloudKitWebServiceQueryFilter, "filterWithComparisonOf:toString:by:", a3, a4, 3);
}

- (id)searchCollections:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v20[5];
  id v21;
  void (**v22)(id, void *, _QWORD);
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFGallerySessionManager collectionSearchCache](self, "collectionSearchCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v7[2](v7, v11, 0);
    v12 = 0;
  }
  else
  {
    -[WFGallerySessionManager queryFilterForTokenizedKey:query:](self, "queryFilterForTokenizedKey:query:", CFSTR("name"), v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFGallerySessionManager preferredLocalizations](self, "preferredLocalizations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFCloudKitWebServiceQueryFilter filterWithComparisonOf:toStringArray:by:](WFCloudKitWebServiceQueryFilter, "filterWithComparisonOf:toStringArray:by:", CFSTR("language"), v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v23[0] = v13;
    v23[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFCloudKitWebServiceQueryFilter filterWithCombinationOf:by:](WFCloudKitWebServiceQueryFilter, "filterWithCombinationOf:by:", v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_opt_class();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __63__WFGallerySessionManager_searchCollections_completionHandler___block_invoke;
    v20[3] = &unk_1E7AF7FC8;
    v22 = v7;
    v20[4] = self;
    v21 = v9;
    -[WFGallerySessionManager searchUsingWebServicesForItem:query:queryFilter:completionHandler:](self, "searchUsingWebServicesForItem:query:queryFilter:completionHandler:", v18, v6, v17, v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)sortAndFilterSearchResults:(id)a3 query:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v29;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v29 = a4;
  v6 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (!v8)
    goto LABEL_24;
  v9 = v8;
  v10 = *(_QWORD *)v38;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v38 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
      objc_msgSend(v12, "persistentIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = v12;
        if (v14)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = v14;
            if (-[WFGallerySessionManager workflowIsRestricted:](self, "workflowIsRestricted:", v14))
              goto LABEL_21;
          }
          else
          {

            v15 = 0;
          }
          v16 = v14;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (-[WFGallerySessionManager collectionIsRestricted:](self, "collectionIsRestricted:", v16))
            {
LABEL_20:

              v14 = v15;
LABEL_21:

              goto LABEL_22;
            }
LABEL_17:
            objc_msgSend(v6, "objectForKey:", v13);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v17)
            {
              v17 = (void *)objc_opt_new();
              objc_msgSend(v6, "setObject:forKey:", v17, v13);
            }
            objc_msgSend(v17, "addObject:", v14);

            goto LABEL_20;
          }
        }
        else
        {
          v15 = 0;
        }

        v16 = 0;
        goto LABEL_17;
      }
LABEL_22:

    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  }
  while (v9);
LABEL_24:

  -[WFGallerySessionManager preferredLocalizations](self, "preferredLocalizations");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __60__WFGallerySessionManager_sortAndFilterSearchResults_query___block_invoke;
  v35[3] = &unk_1E7AF8020;
  v20 = v18;
  v36 = v20;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v35);
  v33[0] = v19;
  v33[1] = 3221225472;
  v33[2] = __60__WFGallerySessionManager_sortAndFilterSearchResults_query___block_invoke_3;
  v33[3] = &unk_1E7AF8048;
  v21 = v6;
  v34 = v21;
  objc_msgSend(v7, "if_objectsPassingTest:", v33);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "componentsSeparatedByCharactersInSet:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v31[0] = v19;
    v31[1] = 3221225472;
    v31[2] = __60__WFGallerySessionManager_sortAndFilterSearchResults_query___block_invoke_4;
    v31[3] = &unk_1E7AF7FF8;
    v32 = v25;
    v26 = v25;
    objc_msgSend(v22, "sortedArrayUsingComparator:", v31);
    v27 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = v22;
  }

  return v27;
}

- (id)getWorkflowForIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  WFCloudKitWebServiceRequest *v8;
  void *v9;
  void *v10;
  WFCloudKitWebServiceRequest *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = [WFCloudKitWebServiceRequest alloc];
  -[WFGallerySessionManager container](self, "container");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFGallerySessionManager database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WFCloudKitWebServiceRequest initWithContainer:database:](v8, "initWithContainer:database:", v9, v10);

  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCloudKitWebServiceRequest fetchProxiedRecordWithIdentifier:possibleItemTypes:completionHandler:](v11, "fetchProxiedRecordWithIdentifier:possibleItemTypes:completionHandler:", v7, v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)getCollectionForPersistentIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;

  v6 = a4;
  v7 = a3;
  -[WFGallerySessionManager createItemRequest](self, "createItemRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE90]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  v12 = (void *)MEMORY[0x1E0CB3880];
  +[WFGallerySessionManager defaultPreferredLocalizations](WFGallerySessionManager, "defaultPreferredLocalizations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateWithFormat:", CFSTR("persistentIdentifier == %@ AND language IN %@ AND minVersion <= %ld"), v7, v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_opt_class();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __82__WFGallerySessionManager_getCollectionForPersistentIdentifier_completionHandler___block_invoke;
  v18[3] = &unk_1E7AF8790;
  v18[4] = self;
  v19 = v6;
  v16 = v6;
  v17 = (id)objc_msgSend(v8, "fetchItemsWithPredicate:itemType:groupName:properties:completionHandler:", v14, v15, CFSTR("GalleryFetch"), 0, v18);

}

- (void)getCollectionForIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[WFGallerySessionManager createItemRequest](self, "createItemRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "fetchItemWithID:itemType:groupName:properties:completionHandler:", v9, objc_opt_class(), CFSTR("GalleryFetch"), 0, v6);

}

- (void)getCurrentUserIdentifierWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[WFGallerySessionManager container](self, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__WFGallerySessionManager_getCurrentUserIdentifierWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E7AF8070;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchUserRecordIDWithCompletionHandler:", v7);

}

- (id)updateItems:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[WFGallerySessionManager createItemRequest](self, "createItemRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateItems:setNilValues:completionHandler:", v7, 0, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)unshareSharedShortcut:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[WFGallerySessionManager createItemRequest](self, "createItemRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteItem:completionHandler:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)reportWorkflow:(id)a3 iCloudIdentifier:(id)a4 reportReason:(id)a5 reportMessage:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, id);
  void *v16;
  void *v17;
  id v18;
  WFShortcutConcerningReport *v19;
  void *v20;
  WFCloudKitItemRequest *v21;
  void *v22;
  void *v23;
  WFCloudKitItemRequest *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, id))a7;
  objc_msgSend(a3, "fileRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v16, "writeToDiskWithError:", &v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v28;
  if (v17)
  {
    v27 = v13;
    v19 = -[WFShortcutConcerningReport initWithReason:shortcutContent:]([WFShortcutConcerningReport alloc], "initWithReason:shortcutContent:", v13, v17);
    -[WFShortcutConcerningReport setReportMessage:](v19, "setReportMessage:", v14);
    if (v12)
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:", v12);
      -[WFShortcutConcerningReport setShortcut:](v19, "setShortcut:", v20);

    }
    v21 = [WFCloudKitItemRequest alloc];
    -[WFGallerySessionManager container](self, "container");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFGallerySessionManager database](self, "database");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[WFCloudKitItemRequest initWithContainer:database:](v21, "initWithContainer:database:", v22, v23);

    v29[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[WFCloudKitItemRequest updateItems:setNilValues:qualityOfService:timeoutIntervalForRequest:completionHandler:](v24, "updateItems:setNilValues:qualityOfService:timeoutIntervalForRequest:completionHandler:", v25, 0, 25, v15, 30.0);

    v13 = v27;
  }
  else
  {
    v15[2](v15, v18);
  }

}

- (void)uploadWorkflow:(id)a3 withName:(id)a4 shortDescription:(id)a5 longDescription:(id)a6 private:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  WFSharedShortcut *v19;
  void *v20;
  void *v21;
  WFCloudKitItemRequest *v22;
  void *v23;
  void *v24;
  WFCloudKitItemRequest *v25;
  void *v26;
  WFSharedShortcut *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  WFSharedShortcut *v31;
  id v32;
  _QWORD v33[2];

  v9 = a7;
  v33[1] = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = a6;
  v16 = a8;
  v17 = a4;
  v18 = a3;
  if (v9)
  {
    v19 = objc_alloc_init(WFSharedShortcut);
    -[WFSharedShortcut setName:](v19, "setName:", v17);

    objc_msgSend(v18, "icon");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSharedShortcut setIcon:](v19, "setIcon:", v20);

  }
  else
  {
    v19 = objc_alloc_init(WFMutableGalleryWorkflow);
    -[WFSharedShortcut setName:](v19, "setName:", v17);

    objc_msgSend(v18, "icon");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSharedShortcut setIcon:](v19, "setIcon:", v21);

    -[WFSharedShortcut setShortDescription:](v19, "setShortDescription:", v14);
    -[WFSharedShortcut setLongDescription:](v19, "setLongDescription:", v15);
  }
  -[WFSharedShortcut setWorkflowRecord:](v19, "setWorkflowRecord:", a3);

  v22 = [WFCloudKitItemRequest alloc];
  -[WFGallerySessionManager container](self, "container");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFGallerySessionManager database](self, "database");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[WFCloudKitItemRequest initWithContainer:database:](v22, "initWithContainer:database:", v23, v24);

  v33[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __110__WFGallerySessionManager_uploadWorkflow_withName_shortDescription_longDescription_private_completionHandler___block_invoke;
  v30[3] = &unk_1E7AF9450;
  v31 = v19;
  v32 = v16;
  v27 = v19;
  v28 = v16;
  v29 = -[WFCloudKitItemRequest updateItems:setNilValues:qualityOfService:timeoutIntervalForRequest:completionHandler:](v25, "updateItems:setNilValues:qualityOfService:timeoutIntervalForRequest:completionHandler:", v26, 0, 25, v30, 30.0);

}

- (BOOL)performExpensiveFetchOperations
{
  return self->_performExpensiveFetchOperations;
}

- (CKContainer)container
{
  return self->_container;
}

- (CKDatabase)database
{
  return self->_database;
}

- (NSArray)preferredLocalizations
{
  return self->_preferredLocalizations;
}

- (NSString)currentRegion
{
  return self->_currentRegion;
}

- (NSString)currentIdiom
{
  return self->_currentIdiom;
}

- (NSCache)workflowSearchCache
{
  return self->_workflowSearchCache;
}

- (NSCache)collectionSearchCache
{
  return self->_collectionSearchCache;
}

- (NSCache)pageCache
{
  return self->_pageCache;
}

- (NSCache)workflowCache
{
  return self->_workflowCache;
}

- (NSCache)bannerImageCache
{
  return self->_bannerImageCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerImageCache, 0);
  objc_storeStrong((id *)&self->_workflowCache, 0);
  objc_storeStrong((id *)&self->_pageCache, 0);
  objc_storeStrong((id *)&self->_collectionSearchCache, 0);
  objc_storeStrong((id *)&self->_workflowSearchCache, 0);
  objc_storeStrong((id *)&self->_currentIdiom, 0);
  objc_storeStrong((id *)&self->_currentRegion, 0);
  objc_storeStrong((id *)&self->_preferredLocalizations, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

void __110__WFGallerySessionManager_uploadWorkflow_withName_shortDescription_longDescription_private_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void (*v3)(void);
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a2)
  {
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_3:
    v3();
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_3;
  }
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WFGallerySharingURLForIdentifier(v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __73__WFGallerySessionManager_getCurrentUserIdentifierWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a3;
  objc_msgSend(a2, "recordName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__WFGallerySessionManager_getCurrentUserIdentifierWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E7AF8378;
  v7 = *(id *)(a1 + 32);
  v12 = v5;
  v13 = v7;
  v11 = v6;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __73__WFGallerySessionManager_getCurrentUserIdentifierWithCompletionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __82__WFGallerySessionManager_getCollectionForPersistentIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  objc_msgSend(v5, "sortAndFilterSearchResults:query:", a2, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v7, v6);

}

void __60__WFGallerySessionManager_sortAndFilterSearchResults_query___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__WFGallerySessionManager_sortAndFilterSearchResults_query___block_invoke_2;
  v4[3] = &unk_1E7AF7FF8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a3, "sortUsingComparator:", v4);

}

BOOL __60__WFGallerySessionManager_sortAndFilterSearchResults_query___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "persistentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "language");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = 1;
  if (v4 && v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v9 == v3;

  }
  return v7;
}

uint64_t __60__WFGallerySessionManager_sortAndFilterSearchResults_query___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = a3;
  objc_msgSend(a2, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "localizedStandardRangeOfString:", *(_QWORD *)(a1 + 32));

  objc_msgSend(v5, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "localizedStandardRangeOfString:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "compare:", v11);

  return v12;
}

uint64_t __60__WFGallerySessionManager_sortAndFilterSearchResults_query___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v18;
  void *v19;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "language");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        objc_msgSend(v6, "language"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v5, "language");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "indexOfObject:", v11);

    v13 = *(void **)(a1 + 32);
    objc_msgSend(v6, "language");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "indexOfObject:", v14);

    if (v12 >= v15)
    {
      if (v12 > v15)
      {
        v16 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "minVersion"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "minVersion"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v18, "compare:", v19);

      }
    }
    else
    {
      v16 = -1;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __63__WFGallerySessionManager_searchCollections_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 48);
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 48), 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sortAndFilterSearchResults:query:", a2, *(_QWORD *)(a1 + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v4, 0);

  }
}

void __61__WFGallerySessionManager_searchWorkflows_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 48);
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 48), 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sortAndFilterSearchResults:query:", a2, *(_QWORD *)(a1 + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v4, 0);

  }
}

void __75__WFGallerySessionManager_searchWorkflowsAndCollections_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    if (v6)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      v7 = MEMORY[0x1E0C809B0];
      if (v5)
      {
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __75__WFGallerySessionManager_searchWorkflowsAndCollections_completionHandler___block_invoke_2;
        v24[3] = &unk_1E7AF7ED0;
        v24[4] = *(_QWORD *)(a1 + 40);
        objc_msgSend(v5, "if_objectsPassingTest:", v24);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "workflowSearchCache");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v8, *(_QWORD *)(a1 + 48));

      }
      else
      {
        v8 = 0;
      }
      v18[0] = v7;
      v18[1] = 3221225472;
      v18[2] = __75__WFGallerySessionManager_searchWorkflowsAndCollections_completionHandler___block_invoke_3;
      v18[3] = &unk_1E7AF7F50;
      v11 = *(void **)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v12 = *(id *)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(void **)(a1 + 48);
      v19 = v12;
      v20 = v13;
      v21 = v14;
      v23 = *(id *)(a1 + 56);
      v5 = v8;
      v22 = v5;
      objc_msgSend(v11, "searchCollections:completionHandler:", v10, v18);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

    }
  }

}

void __75__WFGallerySessionManager_searchWorkflowsAndCollections_completionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "cancel");
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFCloudKitErrorDomain"), 0, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v2 + 16))(v2, 0, 0, v3);

}

uint64_t __75__WFGallerySessionManager_searchWorkflowsAndCollections_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "workflowIsRestricted:", a2) ^ 1;
}

void __75__WFGallerySessionManager_searchWorkflowsAndCollections_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    if (v3)
    {
      v4 = MEMORY[0x1E0C809B0];
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __75__WFGallerySessionManager_searchWorkflowsAndCollections_completionHandler___block_invoke_4;
      v8[3] = &unk_1E7AF7F28;
      v8[4] = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "if_objectsPassingTest:", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v7[0] = v4;
      v7[1] = 3221225472;
      v7[2] = __75__WFGallerySessionManager_searchWorkflowsAndCollections_completionHandler___block_invoke_5;
      v7[3] = &unk_1E7AF7E80;
      v7[4] = *(_QWORD *)(a1 + 40);
      objc_msgSend(v5, "if_map:", v7);
      v3 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "collectionSearchCache");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v3, *(_QWORD *)(a1 + 48));

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

uint64_t __75__WFGallerySessionManager_searchWorkflowsAndCollections_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "collectionIsRestricted:", a2) ^ 1;
}

uint64_t __75__WFGallerySessionManager_searchWorkflowsAndCollections_completionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "collectionWithoutRestrictedContent:", a2);
}

void __75__WFGallerySessionManager_loadWorkflowInGalleryWorkflow_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("WFCloudKitErrorDomain")))
  {
    v7 = objc_msgSend(v5, "code");

    if (!v7)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_11;
    }
  }
  else
  {

  }
  objc_msgSend(v15, "workflowRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "workflowCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recordName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v8, v11);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v12 = (void *)objc_opt_new();
    WFLocalizedString(CFSTR("Unable to load this shortcut. Please try again later."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CB2D50]);

    if (v5)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFGalleryErrorDomain"), 1, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
LABEL_11:

}

uint64_t __62__WFGallerySessionManager_collectionWithoutRestrictedContent___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "workflowIsRestricted:", a2) ^ 1;
}

id __56__WFGallerySessionManager_pageWithoutRestrictedContent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "collectionIsRestricted:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "collectionWithoutRestrictedContent:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

id __56__WFGallerySessionManager_pageWithoutRestrictedContent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "bannerIsRestricted:", v3) & 1) != 0)
    v4 = 0;
  else
    v4 = v3;

  return v4;
}

uint64_t __67__WFGallerySessionManager_preferredPageInPages_preferredLanguages___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "minVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __68__WFGallerySessionManager_getImageForBanner_size_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a2, "imageForSize:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "bannerImageCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v5, *(_QWORD *)(a1 + 40));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __59__WFGallerySessionManager_getPageWithID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "pageWithoutRestrictedContent:", v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "pageCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "recordName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v9, v8);

  }
  else
  {
    v9 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __75__WFGallerySessionManager_getHomeWithPreferredLanguages_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (v11
    && !v5
    && (objc_msgSend(*(id *)(a1 + 32), "preferredPageInPages:preferredLanguages:", v11, *(_QWORD *)(a1 + 40)),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = v6;
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getPageWithID:completionHandler:", v9, *(_QWORD *)(a1 + 48));
  }
  else
  {
    WFLocalizedString(CFSTR("The gallery is not available right now."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB2D50]);
    if (v5)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFGalleryErrorDomain"), 0, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

+ (id)currentDeviceIdiom
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "idiom");

  if (v3 > 4)
    return 0;
  else
    return off_1E7AF8090[v3];
}

+ (WFGallerySessionManager)sharedManager
{
  if (sharedManager_onceToken_59004 != -1)
    dispatch_once(&sharedManager_onceToken_59004, &__block_literal_global_59005);
  return (WFGallerySessionManager *)(id)sharedManager_sharedManager_59006;
}

+ (id)defaultPreferredLocalizations
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "localizations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = (void *)objc_opt_new();
  while (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "preferredLocalizationsFromArray:forPreferences:", v4, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v7, "addObject:", v9);
    objc_msgSend(v6, "removeObjectAtIndex:", 0);

  }
  objc_msgSend(v7, "addObject:", CFSTR("en"));
  objc_msgSend(v7, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __40__WFGallerySessionManager_sharedManager__block_invoke()
{
  WFGallerySessionManager *v0;
  void *v1;

  v0 = objc_alloc_init(WFGallerySessionManager);
  v1 = (void *)sharedManager_sharedManager_59006;
  sharedManager_sharedManager_59006 = (uint64_t)v0;

}

@end
