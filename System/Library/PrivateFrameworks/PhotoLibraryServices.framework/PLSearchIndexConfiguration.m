@implementation PLSearchIndexConfiguration

- (PLSearchIndexConfiguration)initWithPathManager:(id)a3
{
  id v6;
  PLSearchIndexConfiguration *v7;
  PLSearchIndexConfiguration *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchIndexConfiguration.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PLSearchIndexConfiguration;
  v7 = -[PLSearchIndexConfiguration init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_pathManager, a3);

  return v8;
}

- (PLSearchIndexingContext)indexingContext
{
  PLSearchIndexingContext *indexingContext;
  PLSearchIndexDateFormatter *v4;
  PLSearchIndexingContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PLSearchIndexingContext *v10;
  PLSearchIndexingContext *v11;

  indexingContext = self->_indexingContext;
  if (!indexingContext)
  {
    v4 = objc_alloc_init(PLSearchIndexDateFormatter);
    v5 = [PLSearchIndexingContext alloc];
    -[PLSearchIndexConfiguration sceneTaxonomyProvider](self, "sceneTaxonomyProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSearchIndexConfiguration csuTaxonomyObjectStore](self, "csuTaxonomyObjectStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSearchIndexConfiguration locale](PLSearchIndexConfiguration, "locale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSearchIndexConfiguration calendar](PLSearchIndexConfiguration, "calendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PLSearchIndexingContext initWithSceneTaxonomyProvider:csuTaxonomyObjectStore:locale:calendar:indexDateFormatter:delegate:seasonSynonyms:synonymsByIndexCategoryMask:](v5, "initWithSceneTaxonomyProvider:csuTaxonomyObjectStore:locale:calendar:indexDateFormatter:delegate:seasonSynonyms:synonymsByIndexCategoryMask:", v6, v7, v8, v9, v4, self, MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70]);
    v11 = self->_indexingContext;
    self->_indexingContext = v10;

    indexingContext = self->_indexingContext;
  }
  return indexingContext;
}

- (PLSearchIndexSceneTaxonomyProvider)sceneTaxonomyProvider
{
  PLSearchIndexSceneTaxonomyProvider *sceneTaxonomyProvider;
  PLSearchIndexSceneTaxonomyProvider *v4;
  PLSearchIndexSceneTaxonomyProvider *v5;

  sceneTaxonomyProvider = self->_sceneTaxonomyProvider;
  if (!sceneTaxonomyProvider)
  {
    v4 = objc_alloc_init(PLSearchIndexSceneTaxonomyProvider);
    v5 = self->_sceneTaxonomyProvider;
    self->_sceneTaxonomyProvider = v4;

    sceneTaxonomyProvider = self->_sceneTaxonomyProvider;
  }
  return sceneTaxonomyProvider;
}

- (CSUSearchableKnowledgeObjectStore)csuTaxonomyObjectStore
{
  CSUSearchableKnowledgeObjectStore *csuTaxonomyObjectStore;
  void *v4;
  void *v5;
  id v6;
  id v7;
  CSUSearchableKnowledgeObjectStore *v8;
  id v9;
  CSUSearchableKnowledgeObjectStore *v10;
  NSObject *v11;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!_os_feature_enabled_impl())
    return (CSUSearchableKnowledgeObjectStore *)0;
  csuTaxonomyObjectStore = self->_csuTaxonomyObjectStore;
  if (!csuTaxonomyObjectStore)
  {
    -[PLSearchIndexConfiguration pathManager](self, "pathManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v4, "internalDirectoryWithSubType:additionalPathComponents:createIfNeeded:error:", 5, 0, 0, &v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v14;

    v7 = objc_alloc(MEMORY[0x1E0D188F0]);
    v13 = v6;
    v8 = (CSUSearchableKnowledgeObjectStore *)objc_msgSend(v7, "initExistingDB:error:", v5, &v13);
    v9 = v13;

    v10 = self->_csuTaxonomyObjectStore;
    self->_csuTaxonomyObjectStore = v8;

    if (!self->_csuTaxonomyObjectStore || v9)
    {
      PLSearchBackendSceneTaxonomyGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v9;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Victoria: Failed to load CSU EntityStore. Error: %@", buf, 0xCu);
      }

    }
    csuTaxonomyObjectStore = self->_csuTaxonomyObjectStore;
  }
  return csuTaxonomyObjectStore;
}

- (void)inLibraryPerform_refreshSharedLibraryEnabledWithManagedObjectContext:(id)a3
{
  void *v4;

  +[PLLibraryScope activeLibraryScopeInManagedObjectContext:](PLLibraryScope, "activeLibraryScopeInManagedObjectContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isSharedLibraryEnabled = v4 != 0;

}

- (BOOL)isSharedLibraryEnabledForSearchIndexingContext:(id)a3
{
  return self->_isSharedLibraryEnabled;
}

- (void)setIndexingContext:(id)a3
{
  objc_storeStrong((id *)&self->_indexingContext, a3);
}

- (void)setSceneTaxonomyProvider:(id)a3
{
  objc_storeStrong((id *)&self->_sceneTaxonomyProvider, a3);
}

- (PLPhotoLibraryPathManager)pathManager
{
  return self->_pathManager;
}

- (void)setPathManager:(id)a3
{
  objc_storeStrong((id *)&self->_pathManager, a3);
}

- (void)setCsuTaxonomyObjectStore:(id)a3
{
  objc_storeStrong((id *)&self->_csuTaxonomyObjectStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_csuTaxonomyObjectStore, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomyProvider, 0);
  objc_storeStrong((id *)&self->_indexingContext, 0);
}

+ (unint64_t)currentSearchIndexVersion
{
  return 18006;
}

+ (unint64_t)currentEmbeddingModelVersion
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getVCPMediaAnalyzerClass_softClass;
  v9 = getVCPMediaAnalyzerClass_softClass;
  if (!getVCPMediaAnalyzerClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getVCPMediaAnalyzerClass_block_invoke;
    v5[3] = &unk_1E3677580;
    v5[4] = &v6;
    __getVCPMediaAnalyzerClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  return objc_msgSend(v3, "getUnifiedEmbeddingVersion");
}

+ (unint64_t)currentUtilityTypeClassifierVersion
{
  return objc_msgSend(MEMORY[0x1E0D78230], "latestVersion");
}

+ (NSLocale)locale
{
  return (NSLocale *)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
}

+ (NSCalendar)calendar
{
  return (NSCalendar *)objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
}

+ (unint64_t)featureSettings
{
  return 0;
}

+ (BOOL)shouldIndexFilenames
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_shouldIndexFilenamesNumber;
  if (!_shouldIndexFilenamesNumber)
  {
    if (shouldIndexFilenames_pred != -1)
      dispatch_once(&shouldIndexFilenames_pred, &__block_literal_global_31278);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", shouldIndexFilenames_shouldIndexFilenames);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_shouldIndexFilenamesNumber;
    _shouldIndexFilenamesNumber = v3;

    v2 = (void *)_shouldIndexFilenamesNumber;
  }
  return objc_msgSend(v2, "BOOLValue");
}

+ (void)setShouldIndexFilenames:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_shouldIndexFilenamesNumber;
  _shouldIndexFilenamesNumber = v3;

}

void __50__PLSearchIndexConfiguration_shouldIndexFilenames__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PLSearchIndexIncludeFilenames"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
    shouldIndexFilenames_shouldIndexFilenames = objc_msgSend(v0, "BOOLValue");

}

@end
