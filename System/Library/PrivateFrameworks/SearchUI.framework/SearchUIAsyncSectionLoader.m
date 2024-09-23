@implementation SearchUIAsyncSectionLoader

+ (id)asyncLoaderSupportingSectionModel:(id)a3 result:(id)a4 queryId:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  objc_class *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)asyncLoaderSupportingSectionModel_result_queryId__classes;
  if (!asyncLoaderSupportingSectionModel_result_queryId__classes)
  {
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v25[2] = objc_opt_class();
    v25[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)asyncLoaderSupportingSectionModel_result_queryId__classes;
    asyncLoaderSupportingSectionModel_result_queryId__classes = v10;

    v9 = (void *)asyncLoaderSupportingSectionModel_result_queryId__classes;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(objc_class **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((-[objc_class supportsSectionModel:](v17, "supportsSectionModel:", v7, (_QWORD)v20) & 1) != 0)
        {
          v18 = (void *)objc_msgSend([v17 alloc], "initWithSectionModel:result:queryId:", v7, v8, a5);
          goto LABEL_13;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v14)
        continue;
      break;
    }
  }
  v18 = 0;
LABEL_13:

  return v18;
}

+ (BOOL)supportsSectionModel:(id)a3
{
  return 0;
}

- (SearchUIAsyncSectionLoader)initWithSectionModel:(id)a3 result:(id)a4 queryId:(unint64_t)a5
{
  id v8;
  id v9;
  SearchUIAsyncSectionLoader *v10;
  void *v11;
  uint64_t v12;
  NSString *sectionIdentifier;

  v8 = a3;
  v9 = a4;
  v10 = -[SearchUIAsyncSectionLoader init](self, "init");
  if (v10)
  {
    objc_msgSend(v8, "section");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sectionIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    sectionIdentifier = v10->_sectionIdentifier;
    v10->_sectionIdentifier = (NSString *)v12;

    objc_storeStrong((id *)&v10->_searchResult, a4);
    v10->_queryId = a5;
    if (initWithSectionModel_result_queryId__onceToken[0] != -1)
      dispatch_once(initWithSectionModel_result_queryId__onceToken, &__block_literal_global);
  }

  return v10;
}

void __66__SearchUIAsyncSectionLoader_initWithSectionModel_result_queryId___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)computeCache;
  computeCache = v0;

}

- (id)backgroundColor
{
  return 0;
}

- (id)placeholderCardSections
{
  return 0;
}

- (id)cacheIdentifier
{
  return 0;
}

- (BOOL)supportsPreloading
{
  return 1;
}

- (void)fetchCardSectionsWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (id)cardSections
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SearchUIAsyncSectionLoader cachedValue](self, "cachedValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SearchUIAsyncSectionLoader placeholderCardSections](self, "placeholderCardSections");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)preloadIfNecessary
{
  if (-[SearchUIAsyncSectionLoader supportsPreloading](self, "supportsPreloading"))
    -[SearchUIAsyncSectionLoader start](self, "start");
}

- (void)start
{
  void *v3;
  uint64_t v4;
  void *v5;
  void (**v6)(void *, void *);
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD aBlock[4];
  id v12;
  id location;

  -[SearchUIAsyncSectionLoader cachedValue](self, "cachedValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __35__SearchUIAsyncSectionLoader_start__block_invoke;
    aBlock[3] = &unk_1EA1F6058;
    objc_copyWeak(&v12, &location);
    v5 = _Block_copy(aBlock);
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __35__SearchUIAsyncSectionLoader_start__block_invoke_2;
    v9[3] = &unk_1EA1F6080;
    objc_copyWeak(&v10, &location);
    v6 = (void (**)(void *, void *))_Block_copy(v9);
    -[SearchUIAsyncSectionLoader cacheIdentifier](self, "cacheIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)objc_opt_new();
      objc_msgSend(v8, "setIdentifier:", v7);
      objc_msgSend(v8, "setComputeBlock:", v6);
      objc_msgSend((id)computeCache, "getObjectForKey:completionHandler:", v8, v5);

    }
    else
    {
      v6[2](v6, v5);
    }

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __35__SearchUIAsyncSectionLoader_start__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v6, "cardSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v6, "cardSection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "reloadWithCardSections:animated:reconfigureExisting:", v5, objc_msgSend(v6, "animated"), objc_msgSend(v6, "reconfigureExisting"));

  }
}

void __35__SearchUIAsyncSectionLoader_start__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  SearchUIAppTopHitSectionLoaderLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  SearchUIAppTopHitSectionLoaderLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DAD39000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "performAsyncSectionLoader", ", buf, 2u);
  }

  objc_msgSend(WeakRetained, "fetchCardSectionsWithCompletionHandler:", v3);
  SearchUIAppTopHitSectionLoaderLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DAD39000, v10, OS_SIGNPOST_INTERVAL_END, v6, "performAsyncSectionLoader", ", v11, 2u);
  }

}

- (void)reloadWithCardSections:(id)a3 animated:(BOOL)a4 reconfigureExisting:(BOOL)a5
{
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  BOOL v12;
  BOOL v13;
  id location;

  v8 = a3;
  if (v8)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __82__SearchUIAsyncSectionLoader_reloadWithCardSections_animated_reconfigureExisting___block_invoke;
    v9[3] = &unk_1EA1F60A8;
    objc_copyWeak(&v11, &location);
    v10 = v8;
    v12 = a4;
    v13 = a5;
    +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __82__SearchUIAsyncSectionLoader_reloadWithCardSections_animated_reconfigureExisting___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setObjectCache:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadSectionWithIdentifier:animated:reconfigureExisting:", v3, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));

}

- (id)cachedValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SearchUIAsyncSectionLoader cacheIdentifier](self, "cacheIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_opt_new();
    -[SearchUIAsyncSectionLoader cacheIdentifier](self, "cacheIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIdentifier:", v5);

    objc_msgSend((id)computeCache, "getCachedObjectIfAvailableForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cardSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SearchUIAsyncSectionLoader objectCache](self, "objectCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (SearchUIAsyncSectionLoaderDelegate)delegate
{
  return (SearchUIAsyncSectionLoaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SFSearchResult)searchResult
{
  return (SFSearchResult *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (NSArray)objectCache
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setObjectCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)sectionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_objectCache, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
