@implementation PLSearchIndexingContext

- (PLSearchIndexingContext)initWithSceneTaxonomyProvider:(id)a3 csuTaxonomyObjectStore:(id)a4 locale:(id)a5 calendar:(id)a6 indexDateFormatter:(id)a7 delegate:(id)a8 seasonSynonyms:(id)a9 synonymsByIndexCategoryMask:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  PLSearchIndexingContext *v23;
  PLSearchIndexingContext *v24;
  uint64_t v25;
  NSDictionary *seasonSynonymsBySeason;
  uint64_t v27;
  NSDictionary *synonymsByIndexCategoryMask;
  PLUtilityAssetPool *v29;
  PLUtilityAssetPool *utilityAssetPool;
  uint64_t v31;
  CSCustomAttributeKey *photosAlbumUUIDsKey;
  uint64_t v33;
  CSCustomAttributeKey *photosAlbumAssetCountsKey;
  uint64_t v35;
  CSCustomAttributeKey *photosMemoryUUIDsKey;
  uint64_t v37;
  CSCustomAttributeKey *photosMemoryAssetCountsKey;
  uint64_t v39;
  CSCustomAttributeKey *photosHighlightUUIDsKey;
  uint64_t v41;
  CSCustomAttributeKey *photosHighlightAssetCountsKey;
  uint64_t v43;
  CSCustomAttributeKey *photosSensitiveLocationKey;
  uint64_t v45;
  CSCustomAttributeKey *photosEmbeddingCountKey;
  uint64_t v47;
  CSCustomAttributeKey *photosReverseLocationDataIsValidKey;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id obj;
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  objc_super v61;
  uint8_t buf[16];

  v17 = a3;
  obj = a4;
  v18 = a4;
  v59 = a5;
  v60 = a6;
  v58 = a7;
  v57 = a8;
  v19 = a9;
  v20 = a10;
  v56 = v18;
  if (!v18 && _os_feature_enabled_impl())
  {
    PLSearchBackendIndexManagerGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Victoria: csuTaxonomyObjectStore argument is nil", buf, 2u);
    }

  }
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchIndexingContext.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneTaxonomyProvider"));

  }
  v22 = v59;
  if (!v59)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchIndexingContext.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("locale"));

    v22 = 0;
  }
  if (v60)
  {
    if (v19)
      goto LABEL_12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchIndexingContext.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("calendar"));

    v22 = v59;
    if (v19)
      goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchIndexingContext.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("seasonSynonymsBySeason"));

  v22 = v59;
LABEL_12:
  v61.receiver = self;
  v61.super_class = (Class)PLSearchIndexingContext;
  v23 = -[PLSearchIndexingContext init](&v61, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_sceneTaxonomyProvider, a3);
    objc_storeStrong((id *)&v24->_csuTaxonomyObjectStore, obj);
    objc_storeStrong((id *)&v24->_locale, a5);
    objc_storeStrong((id *)&v24->_calendar, a6);
    v25 = objc_msgSend(v19, "copy");
    seasonSynonymsBySeason = v24->_seasonSynonymsBySeason;
    v24->_seasonSynonymsBySeason = (NSDictionary *)v25;

    v27 = objc_msgSend(v20, "copy");
    synonymsByIndexCategoryMask = v24->_synonymsByIndexCategoryMask;
    v24->_synonymsByIndexCategoryMask = (NSDictionary *)v27;

    objc_storeStrong((id *)&v24->_searchIndexDateFormatter, a7);
    objc_storeWeak((id *)&v24->_delegate, v57);
    v29 = objc_alloc_init(PLUtilityAssetPool);
    utilityAssetPool = v24->_utilityAssetPool;
    v24->_utilityAssetPool = v29;

    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("photosAlbumUUIDs"), 0, 0, 0, 1);
    photosAlbumUUIDsKey = v24->_photosAlbumUUIDsKey;
    v24->_photosAlbumUUIDsKey = (CSCustomAttributeKey *)v31;

    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("photosAlbumAssetCounts"), 0, 0, 0, 1);
    photosAlbumAssetCountsKey = v24->_photosAlbumAssetCountsKey;
    v24->_photosAlbumAssetCountsKey = (CSCustomAttributeKey *)v33;

    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("photosMemoryUUIDs"), 0, 0, 0, 1);
    photosMemoryUUIDsKey = v24->_photosMemoryUUIDsKey;
    v24->_photosMemoryUUIDsKey = (CSCustomAttributeKey *)v35;

    v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("photosMemoryAssetCounts"), 0, 0, 0, 1);
    photosMemoryAssetCountsKey = v24->_photosMemoryAssetCountsKey;
    v24->_photosMemoryAssetCountsKey = (CSCustomAttributeKey *)v37;

    v39 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("photosHighlightUUIDs"), 0, 0, 0, 1);
    photosHighlightUUIDsKey = v24->_photosHighlightUUIDsKey;
    v24->_photosHighlightUUIDsKey = (CSCustomAttributeKey *)v39;

    v41 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("photosHighlightAssetCounts"), 0, 0, 0, 1);
    photosHighlightAssetCountsKey = v24->_photosHighlightAssetCountsKey;
    v24->_photosHighlightAssetCountsKey = (CSCustomAttributeKey *)v41;

    v43 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("photosSensitiveLocation"), 0, 0, 0, 0);
    photosSensitiveLocationKey = v24->_photosSensitiveLocationKey;
    v24->_photosSensitiveLocationKey = (CSCustomAttributeKey *)v43;

    v45 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("photosEmbeddingCount"), 0, 0, 0, 0);
    photosEmbeddingCountKey = v24->_photosEmbeddingCountKey;
    v24->_photosEmbeddingCountKey = (CSCustomAttributeKey *)v45;

    v47 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("photosReverseLocationDataIsValid"), 0, 0, 0, 0);
    photosReverseLocationDataIsValidKey = v24->_photosReverseLocationDataIsValidKey;
    v24->_photosReverseLocationDataIsValidKey = (CSCustomAttributeKey *)v47;

  }
  return v24;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[10];

  v17[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p"), objc_opt_class(), self);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v16;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sceneTaxonomyProvider: %@"), self->_sceneTaxonomyProvider);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("csuTaxonomyObjectStore: %@"), self->_csuTaxonomyObjectStore);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("locale: %@"), self->_locale);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("calendar: %@"), self->_calendar);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("searchIndexDateFormatter: %@"), self->_searchIndexDateFormatter);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("seasonSynonymsBySeason: %@"), self->_seasonSynonymsBySeason);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("synonymsByIndexCategoryMask: %@"), self->_synonymsByIndexCategoryMask);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v9;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("isSharedLibraryEnabled: %d"), -[PLSearchIndexingContext isSharedLibraryEnabled](self, "isSharedLibraryEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@>"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isSharedLibraryEnabled
{
  PLSearchIndexingContext *v2;
  void *v3;

  v2 = self;
  -[PLSearchIndexingContext delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "isSharedLibraryEnabledForSearchIndexingContext:", v2);

  return (char)v2;
}

- (PLSearchIndexingContextDelegate)delegate
{
  return (PLSearchIndexingContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PLSearchIndexSceneTaxonomyProvider)sceneTaxonomyProvider
{
  return self->_sceneTaxonomyProvider;
}

- (CSUSearchableKnowledgeObjectStore)csuTaxonomyObjectStore
{
  return self->_csuTaxonomyObjectStore;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (PLSearchIndexDateFormatter)searchIndexDateFormatter
{
  return self->_searchIndexDateFormatter;
}

- (NSDictionary)seasonSynonymsBySeason
{
  return self->_seasonSynonymsBySeason;
}

- (NSDictionary)synonymsByIndexCategoryMask
{
  return self->_synonymsByIndexCategoryMask;
}

- (PLUtilityAssetPool)utilityAssetPool
{
  return self->_utilityAssetPool;
}

- (CSCustomAttributeKey)photosAlbumUUIDsKey
{
  return self->_photosAlbumUUIDsKey;
}

- (CSCustomAttributeKey)photosAlbumAssetCountsKey
{
  return self->_photosAlbumAssetCountsKey;
}

- (CSCustomAttributeKey)photosMemoryUUIDsKey
{
  return self->_photosMemoryUUIDsKey;
}

- (CSCustomAttributeKey)photosMemoryAssetCountsKey
{
  return self->_photosMemoryAssetCountsKey;
}

- (CSCustomAttributeKey)photosHighlightUUIDsKey
{
  return self->_photosHighlightUUIDsKey;
}

- (CSCustomAttributeKey)photosHighlightAssetCountsKey
{
  return self->_photosHighlightAssetCountsKey;
}

- (CSCustomAttributeKey)photosSensitiveLocationKey
{
  return self->_photosSensitiveLocationKey;
}

- (CSCustomAttributeKey)photosReverseLocationDataIsValidKey
{
  return self->_photosReverseLocationDataIsValidKey;
}

- (CSCustomAttributeKey)photosEmbeddingCountKey
{
  return self->_photosEmbeddingCountKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosEmbeddingCountKey, 0);
  objc_storeStrong((id *)&self->_photosReverseLocationDataIsValidKey, 0);
  objc_storeStrong((id *)&self->_photosSensitiveLocationKey, 0);
  objc_storeStrong((id *)&self->_photosHighlightAssetCountsKey, 0);
  objc_storeStrong((id *)&self->_photosHighlightUUIDsKey, 0);
  objc_storeStrong((id *)&self->_photosMemoryAssetCountsKey, 0);
  objc_storeStrong((id *)&self->_photosMemoryUUIDsKey, 0);
  objc_storeStrong((id *)&self->_photosAlbumAssetCountsKey, 0);
  objc_storeStrong((id *)&self->_photosAlbumUUIDsKey, 0);
  objc_storeStrong((id *)&self->_utilityAssetPool, 0);
  objc_storeStrong((id *)&self->_synonymsByIndexCategoryMask, 0);
  objc_storeStrong((id *)&self->_seasonSynonymsBySeason, 0);
  objc_storeStrong((id *)&self->_searchIndexDateFormatter, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_csuTaxonomyObjectStore, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomyProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
