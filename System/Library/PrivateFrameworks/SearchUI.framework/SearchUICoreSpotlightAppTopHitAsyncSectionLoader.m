@implementation SearchUICoreSpotlightAppTopHitAsyncSectionLoader

- (SearchUICoreSpotlightAppTopHitAsyncSectionLoader)initWithSectionModel:(id)a3 result:(id)a4 queryId:(unint64_t)a5
{
  SearchUICoreSpotlightAppTopHitAsyncSectionLoader *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SearchUICoreSpotlightAppTopHitAsyncSectionLoader;
  v5 = -[SearchUIAppTopHitAsyncSectionLoader initWithSectionModel:result:queryId:](&v8, sel_initWithSectionModel_result_queryId_, a3, a4, a5);
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    -[SearchUICoreSpotlightAppTopHitAsyncSectionLoader setLock:](v5, "setLock:", v6);

  }
  return v5;
}

- (void)fetchCardSectionsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  id v31;
  _QWORD v32[5];
  uint64_t v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SearchUIAppTopHitSectionLoaderLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[SearchUIAppTopHitAsyncSectionLoader bundleIdentifier](self, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v35 = v6;
    v36 = 2112;
    v37 = v8;
    _os_log_impl(&dword_1DAD39000, v5, OS_LOG_TYPE_DEFAULT, "Fetching Spotlight AppTopHit results for bundle %@ using sectionLoader %@", buf, 0x16u);

  }
  -[SearchUICoreSpotlightAppTopHitAsyncSectionLoader lock](self, "lock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lock");

  v10 = (void *)objc_opt_new();
  -[SearchUICoreSpotlightAppTopHitAsyncSectionLoader setFoundItems:](self, "setFoundItems:", v10);

  -[SearchUICoreSpotlightAppTopHitAsyncSectionLoader lock](self, "lock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unlock");

  -[SearchUIAppTopHitAsyncSectionLoader bundleIdentifier](self, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICoreSpotlightAppTopHitAsyncSectionLoader buildSearchQueryForBundleIdentifier:](self, "buildSearchQueryForBundleIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SearchUIAsyncSectionLoader delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "deviceIsAuthenticated");

    if ((v15 & 1) == 0)
    {
      v33 = *MEMORY[0x1E0CB2AC0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setProtectionClasses:", v16);

    }
    SSGetDisabledBundleSet();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "queryContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDisableBundles:", v18);

    v20 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __91__SearchUICoreSpotlightAppTopHitAsyncSectionLoader_fetchCardSectionsWithCompletionHandler___block_invoke;
    v32[3] = &unk_1EA1F6480;
    v32[4] = self;
    objc_msgSend(v13, "setFoundItemsHandler:", v32);
    objc_initWeak((id *)buf, self);
    v26 = v20;
    v27 = 3221225472;
    v28 = __91__SearchUICoreSpotlightAppTopHitAsyncSectionLoader_fetchCardSectionsWithCompletionHandler___block_invoke_2;
    v29 = &unk_1EA1F64A8;
    objc_copyWeak(&v31, (id *)buf);
    v30 = v4;
    objc_msgSend(v13, "setCompletionHandler:", &v26);
    -[SearchUICoreSpotlightAppTopHitAsyncSectionLoader setQuery:](self, "setQuery:", v13, v26, v27, v28, v29);
    objc_msgSend(v13, "start");

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    SearchUIAppTopHitSectionLoaderLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      -[SearchUIAppTopHitAsyncSectionLoader bundleIdentifier](self, "bundleIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v35 = v22;
      v36 = 2112;
      v37 = v24;
      _os_log_impl(&dword_1DAD39000, v21, OS_LOG_TYPE_DEFAULT, "Failed to fetch Spotlight AppTopHit results for bundle %@ using sectionLoader %@: No query generated", buf, 0x16u);

    }
    -[SearchUIAppTopHitAsyncSectionLoader responseForCardSections:animated:](self, "responseForCardSections:animated:", MEMORY[0x1E0C9AA60], 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v25);

  }
}

void __91__SearchUICoreSpotlightAppTopHitAsyncSectionLoader_fetchCardSectionsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  objc_msgSend(*(id *)(a1 + 32), "foundItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v4);

  objc_msgSend(*(id *)(a1 + 32), "lock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

void __91__SearchUICoreSpotlightAppTopHitAsyncSectionLoader_fetchCardSectionsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  SearchUIAppTopHitSectionLoaderLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      objc_msgSend(WeakRetained, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v7;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = (uint64_t)v3;
      _os_log_impl(&dword_1DAD39000, v5, OS_LOG_TYPE_DEFAULT, "Failed to fetch Spotlight AppTopHit results for bundle %@ using sectionLoader %@: %@", (uint8_t *)&v18, 0x20u);

    }
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "responseForCardSections:animated:", MEMORY[0x1E0C9AA60], 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }
  else
  {
    if (v6)
    {
      objc_msgSend(WeakRetained, "bundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "foundItems");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v12;
      v20 = 2112;
      v21 = v14;
      v22 = 2048;
      v23 = objc_msgSend(v15, "count");
      _os_log_impl(&dword_1DAD39000, v5, OS_LOG_TYPE_DEFAULT, "Successfully fetched Spotlight AppTopHit results for bundle %@ using sectionLoader %@. Count: %lu", (uint8_t *)&v18, 0x20u);

    }
    v16 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "foundItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "responseForFoundItems:animated:", v11, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);

  }
}

- (id)defaultFetchAttributes
{
  if (defaultFetchAttributes_onceToken != -1)
    dispatch_once(&defaultFetchAttributes_onceToken, &__block_literal_global_4);
  return (id)defaultFetchAttributes_fetchAttributes;
}

void __74__SearchUICoreSpotlightAppTopHitAsyncSectionLoader_defaultFetchAttributes__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  rankingPrefetchedAttributesArray();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v1, "removeObject:", *MEMORY[0x1E0CA6070]);
  v2 = (void *)defaultFetchAttributes_fetchAttributes;
  defaultFetchAttributes_fetchAttributes = (uint64_t)v1;

}

- (id)buildSearchQueryForBundleIdentifier:(id)a3
{
  return 0;
}

- (id)buildCardSectionsForFoundItems:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void *v31;
  void *v32;
  SearchUICoreSpotlightAppTopHitAsyncSectionLoader *v33;
  void *v34;
  id v35;
  unint64_t v36;
  unint64_t v37;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = objc_msgSend((id)objc_opt_class(), "maxNumOfTopHitEntities");
  v7 = objc_msgSend(v4, "count");
  if (v6 >= v7)
    v8 = v7;
  else
    v8 = v6;
  if (v8)
  {
    v9 = 0;
    v32 = v4;
    v33 = self;
    v31 = v5;
    do
    {
      v36 = v9;
      objc_msgSend(v4, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_alloc(MEMORY[0x1E0DA9C98]);
      objc_msgSend(v10, "uniqueIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bundleID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "protection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "attributeSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "serializedAttributes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "allKeys");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "attributeSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "serializedAttributes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "allValues");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v35, "initWithIdentifier:bundleIdentifier:protectionClass:attributeKeys:attributeValues:type:completion:", v34, v11, v12, v15, v18, 3, 0);

      v5 = v31;
      objc_msgSend(MEMORY[0x1E0DA9CB0], "resultBuilderWithResult:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "buildAppTopHitEntityCardSection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIAppTopHitAsyncSectionLoader bundleIdentifier](v33, "bundleIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setApplicationBundleIdentifier:", v22);

      -[SearchUIAsyncSectionLoader searchResult](v33, "searchResult");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "completion");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setCompletion:", v24);

      -[SearchUIAsyncSectionLoader searchResult](v33, "searchResult");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "title");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setTitle:", v26);

      v4 = v32;
      objc_msgSend(v21, "setSpotlightBackingResult:", v19);
      objc_msgSend(v31, "addObject:", v21);

      v37 = v36 + 1;
      v27 = objc_msgSend((id)objc_opt_class(), "maxNumOfTopHitEntities");
      v28 = objc_msgSend(v32, "count");
      v9 = v37;
      if (v27 >= v28)
        v29 = v28;
      else
        v29 = v27;
    }
    while (v37 < v29);
  }

  return v5;
}

- (id)responseForFoundItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  -[SearchUICoreSpotlightAppTopHitAsyncSectionLoader buildCardSectionsForFoundItems:](self, "buildCardSectionsForFoundItems:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIAppTopHitAsyncSectionLoader responseForCardSections:animated:](self, "responseForCardSections:animated:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSMutableArray)foundItems
{
  return self->_foundItems;
}

- (void)setFoundItems:(id)a3
{
  objc_storeStrong((id *)&self->_foundItems, a3);
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (CSSearchQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_foundItems, 0);
}

@end
