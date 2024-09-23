@implementation PXSearchQueryExecutor

- (PXSearchQueryExecutor)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryExecutor.m"), 83, CFSTR("%s is not available as initializer"), "-[PXSearchQueryExecutor init]");

  abort();
}

- (PXSearchQueryExecutor)initWithPhotoLibrary:(id)a3 requestSceneAncestryInformation:(BOOL)a4 resultsHandler:(id)a5
{
  _BOOL4 v6;
  id v10;
  id v11;
  PXSearchQueryExecutor *v12;
  PXSearchQueryExecutor *v13;
  void *v14;
  id resultsHandler;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  PLSearchProcessor *plSearchProcessor;
  NSObject *v21;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *queryQueue;
  dispatch_queue_t v25;
  OS_dispatch_queue *workQueue;
  void *v28;
  objc_super v29;

  v6 = a4;
  v10 = a3;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryExecutor.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v29.receiver = self;
  v29.super_class = (Class)PXSearchQueryExecutor;
  v12 = -[PXSearchQueryExecutor init](&v29, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_photoLibrary, a3);
    v14 = _Block_copy(v11);
    resultsHandler = v13->_resultsHandler;
    v13->_resultsHandler = v14;

    v16 = objc_alloc(MEMORY[0x1E0D71AE8]);
    objc_msgSend(v10, "searchIndex");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "psiSearchIndex");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "initWithDatabase:", v18);
    plSearchProcessor = v13->_plSearchProcessor;
    v13->_plSearchProcessor = (PLSearchProcessor *)v19;

    v13->_requestSceneAncestryInformation = v6;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v21, QOS_CLASS_USER_INITIATED, 0);
    v22 = objc_claimAutoreleasedReturnValue();

    v23 = dispatch_queue_create("com.apple.photos.search.query_execution", v22);
    queryQueue = v13->_queryQueue;
    v13->_queryQueue = (OS_dispatch_queue *)v23;

    v25 = dispatch_queue_create("com.apple.photos.search.results_processing", v22);
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v25;

    -[PXSearchQueryExecutor _setupSearchResultsProcessor](v13, "_setupSearchResultsProcessor");
    if (v6)
      -[PXSearchQueryExecutor _requestSceneAncestryInformation](v13, "_requestSceneAncestryInformation");

  }
  return v13;
}

- (id)psiSearchIndex
{
  void *v2;
  void *v3;
  void *v4;

  -[PXSearchQueryExecutor photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "psiSearchIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_requestSceneAncestryInformation
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  dispatch_get_global_queue(17, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__PXSearchQueryExecutor__requestSceneAncestryInformation__block_invoke;
  v3[3] = &unk_1E5148D30;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_setupSearchResultsProcessor
{
  PXSearchQueryResultsProcessor *v3;
  void *v4;
  void *v5;
  PXSearchQueryResultsProcessor *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v3 = [PXSearchQueryResultsProcessor alloc];
  -[PXSearchQueryExecutor photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchQueryExecutor workQueue](self, "workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __53__PXSearchQueryExecutor__setupSearchResultsProcessor__block_invoke;
  v10 = &unk_1E511DA18;
  objc_copyWeak(&v11, &location);
  v6 = -[PXSearchQueryResultsProcessor initWithPhotoLibrary:dispatchQueue:resultsProcessingHandler:](v3, "initWithPhotoLibrary:dispatchQueue:resultsProcessingHandler:", v4, v5, &v7);
  -[PXSearchQueryExecutor setSearchResultsProcessor:](self, "setSearchResultsProcessor:", v6, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)setCurrentSearchQuery:(id)a3
{
  PXSearchQuery *v4;
  PXSearchQuery *currentSearchQuery;
  PXSearchQueryExecutor *obj;

  v4 = (PXSearchQuery *)a3;
  obj = self;
  objc_sync_enter(obj);
  currentSearchQuery = obj->_currentSearchQuery;
  obj->_currentSearchQuery = v4;

  objc_sync_exit(obj);
}

- (PXSearchQuery)currentSearchQuery
{
  PXSearchQueryExecutor *v2;
  PXSearchQuery *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_currentSearchQuery;
  objc_sync_exit(v2);

  return v3;
}

- (void)setCurrentPSIQuery:(id)a3
{
  PSIQuery *v4;
  PSIQuery *currentPSIQuery;
  PXSearchQueryExecutor *obj;

  v4 = (PSIQuery *)a3;
  obj = self;
  objc_sync_enter(obj);
  currentPSIQuery = obj->_currentPSIQuery;
  obj->_currentPSIQuery = v4;

  objc_sync_exit(obj);
}

- (PSIQuery)currentPSIQuery
{
  PXSearchQueryExecutor *v2;
  PSIQuery *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_currentPSIQuery;
  objc_sync_exit(v2);

  return v3;
}

- (void)executeSearchQuery:(id)a3
{
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryExecutor.m"), 195, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchQuery"));

  }
  if (PLIsMobileSlideShow()
    && (+[PXSearchSettings sharedInstance](PXSearchSettings, "sharedInstance"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "enableEmbeddingSearch"),
        v5,
        v6))
  {
    v7 = objc_alloc(MEMORY[0x1E0D71700]);
    objc_msgSend(v12, "searchText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithQueryText:", v8);

    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchQueryExecutor _executeEmbeddingsSearchQuery:embeddingTypes:searchQuery:](self, "_executeEmbeddingsSearchQuery:embeddingTypes:searchQuery:", v9, v10, v12);

  }
  else
  {
    -[PXSearchQueryExecutor _executePhotosIndexSearchQuery:](self, "_executePhotosIndexSearchQuery:", v12);
  }

}

- (void)_executePhotosIndexSearchQuery:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  os_signpost_id_t v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "options");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject wantsWordEmbeddings](v5, "wantsWordEmbeddings"))
  {
LABEL_5:

    goto LABEL_6;
  }
  v6 = -[PXSearchQueryExecutor requestSceneAncestryInformation](self, "requestSceneAncestryInformation");

  if (!v6)
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "requestSceneAncestryInformation must be set to YES to obtain word embedding results for a query", buf, 2u);
    }
    goto LABEL_5;
  }
LABEL_6:
  -[PXSearchQueryExecutor setCurrentSearchQuery:](self, "setCurrentSearchQuery:", v4);
  -[PXSearchQueryExecutor currentPSIQuery](self, "currentPSIQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancel");

  -[PXSearchQueryExecutor currentSearchQuery](self, "currentSearchQuery");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchQueryExecutor _backendQueryFromSearchQuery:](self, "_backendQueryFromSearchQuery:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSearchQueryExecutor setCurrentPSIQuery:](self, "setCurrentPSIQuery:", v9);
  PLPhotosSearchGetLog();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_make_with_pointer(v10, self);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v12 = v11;
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PXSearchQueryExecutor - Perform Query", " enableTelemetry=YES ", buf, 2u);
    }
  }

  -[PXSearchQueryExecutor queryQueue](self, "queryQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PXSearchQueryExecutor__executePhotosIndexSearchQuery___block_invoke;
  block[3] = &unk_1E51457C8;
  block[4] = self;
  v17 = v9;
  v18 = v4;
  v14 = v4;
  v15 = v9;
  dispatch_async(v13, block);

}

- (void)_processedQueryResultsForSearchQuery:(id)a3 psiQuery:(id)a4 assetResults:(id)a5 assetResultsForCompletions:(id)a6 collectionResults:(id)a7 topAssetsResult:(id)a8 topCollectionResults:(id)a9 plSearchSuggestions:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  _QWORD block[5];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  SEL v46;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v36 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v37 = a10;
  if (v17)
  {
    if (v18)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryExecutor.m"), 261, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchQuery"));

    if (v18)
    {
LABEL_3:
      if (v19)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryExecutor.m"), 262, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("psiQuery"));

  if (v19)
  {
LABEL_4:
    if (v20)
      goto LABEL_5;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryExecutor.m"), 264, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("collectionResults"));

    if (v22)
      goto LABEL_6;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryExecutor.m"), 265, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("topCollectionResults"));

    goto LABEL_6;
  }
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryExecutor.m"), 263, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetResults"));

  if (!v20)
    goto LABEL_10;
LABEL_5:
  if (!v22)
    goto LABEL_11;
LABEL_6:
  -[PXSearchQueryExecutor workQueue](self, "workQueue");
  v23 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __186__PXSearchQueryExecutor__processedQueryResultsForSearchQuery_psiQuery_assetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_plSearchSuggestions___block_invoke;
  block[3] = &unk_1E511DA88;
  block[4] = self;
  v39 = v17;
  v40 = v19;
  v41 = v18;
  v42 = v36;
  v43 = v20;
  v44 = v22;
  v45 = v21;
  v46 = a2;
  v24 = v21;
  v25 = v22;
  v26 = v20;
  v27 = v36;
  v28 = v18;
  v29 = v19;
  v30 = v17;
  dispatch_async(v23, block);

}

- (id)_backendQueryFromSearchQuery:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  objc_class *v35;
  void *v36;

  v5 = a3;
  objc_msgSend(v5, "searchText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryTokens");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v9 = v8;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryExecutor.m"), 438, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("queryTokens"), v34);
LABEL_24:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (objc_class *)objc_opt_class();
    NSStringFromClass(v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "px_descriptionForAssertionMessage");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryExecutor.m"), 438, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("queryTokens"), v34, v36);

    goto LABEL_24;
  }
LABEL_3:

  if ((objc_msgSend(v5, "isEmpty") & 1) != 0)
    goto LABEL_9;
  objc_msgSend(v5, "options");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "filterOptions");

  if (!v11)
    goto LABEL_9;
  if ((v11 & 1) != 0)
  {
    v26 = objc_alloc(MEMORY[0x1E0D71C08]);
    PLServicesLocalizedFrameworkString();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1900);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v26, "initWithText:userCategory:searchedCategories:matchType:", v27, 18, v28, 2);

    objc_msgSend(v29, "setIsFilterTypeToken:", 1);
    objc_msgSend(v9, "addObject:", v29);

    if ((v11 & 2) == 0)
    {
LABEL_7:
      if ((v11 & 4) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_7;
  }
  v30 = objc_alloc(MEMORY[0x1E0D71C08]);
  v31 = (void *)objc_msgSend(v30, "initWithIdentifier:userCategory:", *MEMORY[0x1E0D72B38], 24);
  objc_msgSend(v31, "setIsFilterTypeToken:", 1);
  objc_msgSend(v9, "addObject:", v31);

  if ((v11 & 4) != 0)
  {
LABEL_8:
    v12 = objc_alloc(MEMORY[0x1E0D71C08]);
    PLServicesLocalizedFrameworkString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1901);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithText:userCategory:searchedCategories:matchType:", v13, 19, v14, 2);

    objc_msgSend(v15, "setIsFilterTypeToken:", 1);
    objc_msgSend(v9, "addObject:", v15);

  }
LABEL_9:
  objc_msgSend(v5, "options");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "libraryScope");

  if (v17 == 2)
    v18 = 2;
  else
    v18 = v17 == 1;
  -[PXSearchQueryExecutor psiSearchIndex](self, "psiSearchIndex");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v9, "copy");
  v21 = (void *)objc_msgSend(v19, "newQueryWithSearchText:queryTokens:useWildcardSearchText:libraryScope:", v6, v20, 1, v18);

  objc_msgSend(v5, "options");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "wantsWordEmbeddings"))
    v23 = 258;
  else
    v23 = 0;
  objc_msgSend(v21, "setWordEmbeddingMode:", v23);

  if (objc_msgSend(v5, "hasSearchText"))
    v24 = 0;
  else
    v24 = 5;
  objc_msgSend(v21, "setNumberOfNextKeywordSuggestionToProcess:", v24);

  return v21;
}

- (id)_searchSuggestionsFromPSIQuery:(id)a3 searchSections:(id)a4 suggestionLimit:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v21;
  void *v22;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "searchText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length") && objc_msgSend(v9, "count"))
  {
    -[PXSearchQueryExecutor plSearchProcessor](self, "plSearchProcessor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "completionSuggestionsForQuery:withSearchSections:numberOfSuggestions:", v8, v9, 5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[PXSearchTokenSuggestionModelTranslator searchTokenSuggestionsFromCompletions:searchText:](PXSearchTokenSuggestionModelTranslator, "searchTokenSuggestionsFromCompletions:searchText:", v12, v10);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v16 = (void *)v13;
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(v8, "nextKeywordSuggestions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    objc_msgSend(v8, "nextKeywordSuggestions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSearchTokenSuggestionModelTranslator searchTokenSuggestionsFromNextTokenSuggestions:](PXSearchTokenSuggestionModelTranslator, "searchTokenSuggestionsFromNextTokenSuggestions:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (objc_msgSend(v9, "count"))
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v8, "substitutions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v21, "count");

    if (v16)
    {
      objc_msgSend(v8, "substitutions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSearchQueryExecutor sceneAncestryInformation](self, "sceneAncestryInformation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXSearchTokenSuggestionModelTranslator searchTokenSuggestionsFromWordEmbeddings:sceneAncestryInformation:searchText:](PXSearchTokenSuggestionModelTranslator, "searchTokenSuggestionsFromWordEmbeddings:sceneAncestryInformation:searchText:", v12, v22, v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
  }
LABEL_8:
  -[PXSearchQueryExecutor _limitedSearchSuggestions:limit:](self, "_limitedSearchSuggestions:limit:", v16, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
    v17 = (void *)MEMORY[0x1E0C9AA60];
  v19 = v17;

  return v19;
}

- (id)_limitedSearchSuggestions:(id)a3 limit:(unint64_t)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;

  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  if (v6 >= a4)
    v7 = a4;
  else
    v7 = v6;
  objc_msgSend(v5, "subarrayWithRange:", 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_executeEmbeddingsSearchQuery:(id)a3 embeddingTypes:(id)a4 searchQuery:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  PXSearchQueryExecutor *v22;
  id v23;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PXSearchQueryExecutor currentEmbeddingQuery](self, "currentEmbeddingQuery");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIsCancelled:", 1);

  -[PXSearchQueryExecutor setCurrentEmbeddingQuery:](self, "setCurrentEmbeddingQuery:", v8);
  -[PXSearchQueryExecutor setCurrentSearchQuery:](self, "setCurrentSearchQuery:", v10);
  PLPhotosSearchGetLog();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_make_with_pointer(v12, self);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v14 = v13;
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "Embedding Search Execute Query", " enableTelemetry=YES ", buf, 2u);
    }
  }

  -[PXSearchQueryExecutor queryQueue](self, "queryQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __82__PXSearchQueryExecutor__executeEmbeddingsSearchQuery_embeddingTypes_searchQuery___block_invoke;
  v19[3] = &unk_1E513DD48;
  v20 = v8;
  v21 = v9;
  v22 = self;
  v23 = v10;
  v16 = v10;
  v17 = v9;
  v18 = v8;
  dispatch_async(v15, v19);

}

- (void)setCurrentEmbeddingQuery:(id)a3
{
  PLEmbeddingQuery *v4;
  PLEmbeddingQuery *currentEmbeddingQuery;
  PXSearchQueryExecutor *obj;

  v4 = (PLEmbeddingQuery *)a3;
  obj = self;
  objc_sync_enter(obj);
  currentEmbeddingQuery = obj->_currentEmbeddingQuery;
  obj->_currentEmbeddingQuery = v4;

  objc_sync_exit(obj);
}

- (PLEmbeddingQuery)currentEmbeddingQuery
{
  PXSearchQueryExecutor *v2;
  PLEmbeddingQuery *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_currentEmbeddingQuery;
  objc_sync_exit(v2);

  return v3;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (id)resultsHandler
{
  return self->_resultsHandler;
}

- (PXSearchQueryResultsProcessor)searchResultsProcessor
{
  return self->_searchResultsProcessor;
}

- (void)setSearchResultsProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultsProcessor, a3);
}

- (PLSearchProcessor)plSearchProcessor
{
  return self->_plSearchProcessor;
}

- (OS_dispatch_queue)queryQueue
{
  return self->_queryQueue;
}

- (void)setQueryQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queryQueue, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (NSDictionary)sceneAncestryInformation
{
  return self->_sceneAncestryInformation;
}

- (void)setSceneAncestryInformation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)requestSceneAncestryInformation
{
  return self->_requestSceneAncestryInformation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneAncestryInformation, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_queryQueue, 0);
  objc_storeStrong((id *)&self->_plSearchProcessor, 0);
  objc_storeStrong((id *)&self->_searchResultsProcessor, 0);
  objc_storeStrong(&self->_resultsHandler, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_currentEmbeddingQuery, 0);
  objc_storeStrong((id *)&self->_currentPSIQuery, 0);
  objc_storeStrong((id *)&self->_currentSearchQuery, 0);
}

void __82__PXSearchQueryExecutor__executeEmbeddingsSearchQuery_embeddingTypes_searchQuery___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;

  v2 = *(void **)(a1 + 32);
  +[PXSearchSettings sharedInstance](PXSearchSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "embeddingVectorDistanceThreshold");
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "psiSearchIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSearchSettings sharedInstance](PXSearchSettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "queryDepersonalizationType");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__PXSearchQueryExecutor__executeEmbeddingsSearchQuery_embeddingTypes_searchQuery___block_invoke_2;
  v14[3] = &unk_1E511DAB0;
  v12 = *(void **)(a1 + 56);
  v14[4] = *(_QWORD *)(a1 + 48);
  v15 = v12;
  LOBYTE(v13) = 0;
  objc_msgSend(v2, "executeEmbeddingSearchQueryWithSimilarityThreshold:embeddingModelTypes:scopedAssetUUIDs:dateFilter:psiDatabase:photoLibrary:queryDepersonalization:enableRanking:completion:", v6, 0, 0, v7, v9, v11, v5, v13, v14);

}

void __82__PXSearchQueryExecutor__executeEmbeddingsSearchQuery_embeddingTypes_searchQuery___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD block[4];
  id v17;
  uint64_t v18;
  id v19;
  uint8_t buf[16];

  v3 = a2;
  PLPhotosSearchGetLog();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_make_with_pointer(v4, *(const void **)(a1 + 32));
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v4, OS_SIGNPOST_INTERVAL_END, v6, "Embedding Search Execute Query", " enableTelemetry=YES ", buf, 2u);
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "currentSearchQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__PXSearchQueryExecutor__executeEmbeddingsSearchQuery_embeddingTypes_searchQuery___block_invoke_75;
    block[3] = &unk_1E51457C8;
    v9 = v3;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    v17 = v9;
    v18 = v10;
    v19 = v11;
    dispatch_async(v8, block);

    v12 = v17;
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __82__PXSearchQueryExecutor__executeEmbeddingsSearchQuery_embeddingTypes_searchQuery___block_invoke_2_78;
    v14[3] = &unk_1E5148D08;
    v13 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v13;
    dispatch_async(MEMORY[0x1E0C80D38], v14);
    v12 = v15;
  }

}

void __82__PXSearchQueryExecutor__executeEmbeddingsSearchQuery_embeddingTypes_searchQuery___block_invoke_75(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D71708], "assetUUIDsFromEmbeddingCompareObjects:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D71B98]), "initWithAssetUUIDs:", v2);
  else
    v7 = 0;
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  +[PXSearchResultModelTranslator searchResultsForTopAssetsResult:](PXSearchResultModelTranslator, "searchResultsForTopAssetsResult:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  objc_msgSend(*(id *)(a1 + 40), "searchResultsProcessor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processCollectionSearchResults:assetSearchResults:personSearchResults:searchSuggestions:searchQueryMatchInfo:forSearchQuery:", MEMORY[0x1E0C9AA60], v5, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, *(_QWORD *)(a1 + 48));

}

void __82__PXSearchQueryExecutor__executeEmbeddingsSearchQuery_embeddingTypes_searchQuery___block_invoke_2_78(uint64_t a1)
{
  id v2;
  void (**v3)(id, uint64_t, id);

  objc_msgSend(*(id *)(a1 + 32), "resultsHandler");
  v3 = (void (**)(id, uint64_t, id))objc_claimAutoreleasedReturnValue();
  v2 = -[PXSearchQueryResult initEmptySearchQueryResultForQuery:]([PXSearchQueryResult alloc], "initEmptySearchQueryResultForQuery:", *(_QWORD *)(a1 + 40));
  v3[2](v3, 2, v2);

}

void __186__PXSearchQueryExecutor__processedQueryResultsForSearchQuery_psiQuery_assetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_plSearchSuggestions___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  os_signpost_id_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  int v35;
  int v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;
  char v48;
  void *v49;
  id v50;
  char isKindOfClass;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t k;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  id v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t m;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  os_signpost_id_t v85;
  os_signpost_id_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  id obj;
  int v98;
  void *v99;
  PXSearchQueryMatchInfo *v100;
  PXSearchQueryMatchInfo *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  void *v105;
  id v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  uint8_t buf[16];
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  PLPhotosSearchGetLog();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v3;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PXSearchQueryExecutor - Process Backend Query Results", " enableTelemetry=YES ", buf, 2u);
    }
  }

  objc_msgSend(*(id *)(a1 + 40), "queryTokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") <= 1)
  {
    if (objc_msgSend(v5, "count"))
      v6 = objc_msgSend(*(id *)(a1 + 40), "hasSearchText");
    else
      v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  v129 = 0u;
  v130 = 0u;
  v127 = 0u;
  v128 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v127, v137, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v128;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v128 != v10)
          objc_enumerationMutation(v7);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v127 + 1) + 8 * i), "userCategory") == 5)
        {
          v98 = 0;
          goto LABEL_19;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v127, v137, 16);
      if (v9)
        continue;
      break;
    }
  }
  v98 = 1;
LABEL_19:

  v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  v13 = *(id *)(a1 + 48);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v123, v136, 16);
  v93 = v7;
  v94 = v12;
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v124;
    while (2)
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v124 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * j);
        if ((objc_msgSend(v18, "isImplicitlyTokenized") & 1) != 0)
        {
          v6 = 1;
          goto LABEL_31;
        }
        if ((objc_msgSend(v18, "categoryMask") & 0x1C000000000) != 0)
        {
          objc_msgSend(v18, "assetUUIDs");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObjectsFromArray:", v19);

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v123, v136, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_31:

  objc_msgSend(*(id *)(a1 + 32), "plSearchProcessor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "searchResultSectionsForQuery:withAssetResults:assetResultsForCompletions:collectionResults:combineAssetSections:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = *(_QWORD *)(a1 + 56);
  v23 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "options");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_searchSuggestionsFromPSIQuery:searchSections:suggestionLimit:", v22, v21, objc_msgSend(v24, "suggestionLimit"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "plSearchProcessor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "updatedSearchSections:withTopCollectionResults:", v21, *(_QWORD *)(a1 + 80));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0x1E0C99000uLL;
  v106 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[PXSearchResultModelTranslator searchResultsForTopAssetsResult:](PXSearchResultModelTranslator, "searchResultsForTopAssetsResult:", *(_QWORD *)(a1 + 88));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v28;
  objc_msgSend(v28, "addObjectsFromArray:", v30);

  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  obj = v26;
  v95 = a1;
  v102 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v135, 16);
  if (!v102)
    goto LABEL_76;
  v31 = *(_QWORD *)v120;
  v96 = *(_QWORD *)v120;
  do
  {
    v32 = 0;
    do
    {
      if (*(_QWORD *)v120 != v31)
        objc_enumerationMutation(obj);
      v104 = v32;
      v33 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * v32);
      v34 = objc_msgSend(v33, "categoryMask");
      v35 = v6 ^ 1 | objc_msgSend((id)objc_opt_class(), "_sectionIsHighlightsSection:", v33);
      if (v34 == 256)
        v35 = 1;
      if (v34 == 4096)
        v36 = 1;
      else
        v36 = v35;
      if (v34 == 0x10000000000000 || v34 == 128)
        v36 &= v98;
      objc_msgSend(v33, "searchResults");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_alloc_init(*(Class *)(v27 + 3560));
      v39 = objc_alloc_init(*(Class *)(v27 + 3560));
      if (v36 && objc_msgSend(v37, "count"))
      {
        v117 = 0u;
        v118 = 0u;
        v115 = 0u;
        v116 = 0u;
        v99 = v37;
        v40 = v37;
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v115, v134, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v116;
          do
          {
            v44 = 0;
            do
            {
              if (*(_QWORD *)v116 != v43)
                objc_enumerationMutation(v40);
              v45 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * v44);
              v46 = objc_msgSend(v45, "type");
              if (v46 == 2)
              {
                v50 = v45;
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();
                v49 = v39;
                if ((isKindOfClass & 1) == 0)
                  goto LABEL_55;
LABEL_54:
                objc_msgSend(v49, "addObject:", v45);
                goto LABEL_55;
              }
              if (v46 != 1)
                goto LABEL_56;
              v47 = v45;
              objc_opt_class();
              v48 = objc_opt_isKindOfClass();
              v49 = v38;
              if ((v48 & 1) != 0)
                goto LABEL_54;
LABEL_55:

LABEL_56:
              ++v44;
            }
            while (v42 != v44);
            v52 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v115, v134, 16);
            v42 = v52;
          }
          while (v52);
        }

        a1 = v95;
        objc_msgSend(*(id *)(v95 + 40), "options");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "filterOptions");

        v27 = 0x1E0C99000;
        v31 = v96;
        v37 = v99;
        if (!v54)
        {
          +[PXSearchResultModelTranslator searchResultsForAssetResults:](PXSearchResultModelTranslator, "searchResultsForAssetResults:", v38);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v111 = 0u;
          v112 = 0u;
          v113 = 0u;
          v114 = 0u;
          v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v111, v133, 16);
          if (v56)
          {
            v57 = v56;
            v58 = *(_QWORD *)v112;
            do
            {
              for (k = 0; k != v57; ++k)
              {
                if (*(_QWORD *)v112 != v58)
                  objc_enumerationMutation(v55);
                v60 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * k);
                v61 = objc_msgSend(v60, "type");
                v62 = v29;
                if (v61 != 3)
                {
                  if (objc_msgSend(v60, "type") == 4)
                    v62 = v29;
                  else
                    v62 = v106;
                }
                objc_msgSend(v62, "addObject:", v60);
              }
              v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v111, v133, 16);
            }
            while (v57);
          }
          +[PXSearchResultModelTranslator searchResultsForCollectionResults:](PXSearchResultModelTranslator, "searchResultsForCollectionResults:", v39);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "addObjectsFromArray:", v63);

          v27 = 0x1E0C99000;
          v31 = v96;
          v37 = v99;
        }
      }

      v32 = v104 + 1;
    }
    while (v104 + 1 != v102);
    v102 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v135, 16);
  }
  while (v102);
LABEL_76:

  v64 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v65 = a1;
  v66 = v64;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  objc_msgSend(*(id *)(v65 + 56), "queryTokens");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v107, v132, 16);
  if (v68)
  {
    v69 = v68;
    v70 = *(_QWORD *)v108;
    do
    {
      for (m = 0; m != v69; ++m)
      {
        if (*(_QWORD *)v108 != v70)
          objc_enumerationMutation(v67);
        v72 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * m);
        if (objc_msgSend(v72, "userCategory") == 14 || !objc_msgSend(v72, "userCategory"))
        {
          objc_msgSend(v72, "text");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "addObject:", v73);

        }
      }
      v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v107, v132, 16);
    }
    while (v69);
  }

  objc_msgSend(*(id *)(v95 + 56), "searchText");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v105, "length"))
  {
    objc_msgSend(*(id *)(v95 + 56), "searchText");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addObject:", v74);

  }
  objc_msgSend(*(id *)(v95 + 56), "personIdentifiers");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v76 = objc_claimAutoreleasedReturnValue();

  v100 = [PXSearchQueryMatchInfo alloc];
  objc_msgSend(*(id *)(v95 + 40), "localizedQueryStringWithQuotationDelimitersForSearchText:", 1);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v95 + 56), "sceneIdentifiers");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = (void *)v76;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v76);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v95 + 56), "audioIdentifiers");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v95 + 56), "humanActionIdentifiers");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "allObjects");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "allObjects");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = -[PXSearchQueryMatchInfo initWithLocalizedQueryString:matchedSceneIdentifiers:personLocalIdentifiers:audioIdentifiers:humanActionIdentifiers:ocrTexts:ocrAssetUUIDS:queryEmbedding:countOfQueryTerms:](v100, "initWithLocalizedQueryString:matchedSceneIdentifiers:personLocalIdentifiers:audioIdentifiers:humanActionIdentifiers:ocrTexts:ocrAssetUUIDS:queryEmbedding:countOfQueryTerms:", v77, v78, v79, v80, v81, v82, v83, 0, 0);

  PLPhotosSearchGetLog();
  v84 = (id)objc_claimAutoreleasedReturnValue();
  v85 = os_signpost_id_make_with_pointer(v84, *(const void **)(v95 + 32));
  if (v85 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v86 = v85;
    if (os_signpost_enabled(v84))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v84, OS_SIGNPOST_INTERVAL_END, v86, "PXSearchQueryExecutor - Process Backend Query Results", " enableTelemetry=YES ", buf, 2u);
    }
  }

  objc_msgSend(*(id *)(v95 + 32), "searchResultsProcessor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = (void *)objc_msgSend(v106, "copy");
  v89 = (void *)objc_msgSend(v91, "copy");
  v90 = (void *)objc_msgSend(v29, "copy");
  objc_msgSend(v87, "processCollectionSearchResults:assetSearchResults:personSearchResults:searchSuggestions:searchQueryMatchInfo:forSearchQuery:", v88, v89, v90, v92, v101, *(_QWORD *)(v95 + 40));

}

uint64_t __186__PXSearchQueryExecutor__processedQueryResultsForSearchQuery_psiQuery_assetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_plSearchSuggestions___block_invoke_54(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CD16C0], "localIdentifierWithUUID:", a2);
}

void __56__PXSearchQueryExecutor__executePhotosIndexSearchQuery___block_invoke(id *a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;
  id v6;

  objc_msgSend(a1[4], "plSearchProcessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__PXSearchQueryExecutor__executePhotosIndexSearchQuery___block_invoke_2;
  v4[3] = &unk_1E511DA40;
  v3 = a1[5];
  v4[4] = a1[4];
  v5 = a1[6];
  v6 = a1[5];
  objc_msgSend(v2, "performQuery:withResultsHandler:", v3, v4);

}

void __56__PXSearchQueryExecutor__executePhotosIndexSearchQuery___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  os_signpost_id_t v17;
  os_signpost_id_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  os_signpost_id_t v23;
  os_signpost_id_t v24;
  id v25;
  uint64_t v26;
  _QWORD block[4];
  id v28;
  id v29;
  uint64_t v30;
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  PLPhotosSearchGetLog();
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = os_signpost_id_make_with_pointer(v16, *(const void **)(a1 + 32));
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v18 = v17;
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v16, OS_SIGNPOST_INTERVAL_END, v18, "PXSearchQueryExecutor - Perform Query", " enableTelemetry=YES ", buf, 2u);
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "currentSearchQuery");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isEqual:", *(_QWORD *)(a1 + 40)))
  {
    PLPhotosSearchGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v32 = v21;
      _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEFAULT, "Photos Search Query Executor: Processing backend results for query: %@", buf, 0xCu);
    }

    PLPhotosSearchGetLog();
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v23 = os_signpost_id_make_with_pointer(v22, *(const void **)(a1 + 32));
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v24 = v23;
      if (os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v24, "PXSearchQueryExecutor - Process Query Results", " enableTelemetry=YES ", buf, 2u);
      }
    }

    objc_msgSend(*(id *)(a1 + 32), "_processedQueryResultsForSearchQuery:psiQuery:assetResults:assetResultsForCompletions:collectionResults:topAssetsResult:topCollectionResults:plSearchSuggestions:", v19, *(_QWORD *)(a1 + 48), v11, v12, v13, v14, v15, MEMORY[0x1E0C9AA60]);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__PXSearchQueryExecutor__executePhotosIndexSearchQuery___block_invoke_39;
    block[3] = &unk_1E51457C8;
    v28 = *(id *)(a1 + 40);
    v25 = v19;
    v26 = *(_QWORD *)(a1 + 32);
    v29 = v25;
    v30 = v26;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __56__PXSearchQueryExecutor__executePhotosIndexSearchQuery___block_invoke_39(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLPhotosSearchGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7 = 138412546;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "Photos Search Query Executor: Cancelling query results processing for previous query: %@ in favor of new query: %@", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 48), "resultsHandler");
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v6 = -[PXSearchQueryResult initEmptySearchQueryResultForQuery:]([PXSearchQueryResult alloc], "initEmptySearchQueryResultForQuery:", *(_QWORD *)(a1 + 32));
  ((void (**)(_QWORD, uint64_t, id))v5)[2](v5, 2, v6);

}

void __53__PXSearchQueryExecutor__setupSearchResultsProcessor__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id *v7;
  id WeakRetained;
  os_signpost_id_t v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13[2];
  uint8_t buf[16];

  v5 = a3;
  PLPhotosSearchGetLog();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v7);
  v9 = os_signpost_id_make_with_pointer(v6, WeakRetained);

  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_END, v9, "PXSearchQueryExecutor - Process Query Results", " enableTelemetry=YES ", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PXSearchQueryExecutor__setupSearchResultsProcessor__block_invoke_31;
  block[3] = &unk_1E513FF48;
  objc_copyWeak(v13, v7);
  v12 = v5;
  v13[1] = a2;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v13);
}

void __53__PXSearchQueryExecutor__setupSearchResultsProcessor__block_invoke_31(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  PXSearchQueryResult *v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "currentSearchQuery");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "searchQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if (v6)
    {
      objc_msgSend(v3, "resultsHandler");
      v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v7[2](v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

    }
    else
    {
      PLPhotosSearchGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "searchQuery");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "currentSearchQuery");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = v9;
        v17 = 2112;
        v18 = v10;
        _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Photos Search Query Results Processor: During change handling processing, the underlying search query changed from %@ to %@, discarding results", (uint8_t *)&v15, 0x16u);

      }
      objc_msgSend(v3, "resultsHandler");
      v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v12 = [PXSearchQueryResult alloc];
      objc_msgSend(v3, "currentSearchQuery");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[PXSearchQueryResult initEmptySearchQueryResultForQuery:](v12, "initEmptySearchQueryResultForQuery:", v13);
      ((void (**)(_QWORD, uint64_t, id))v11)[2](v11, 2, v14);

    }
  }

}

void __57__PXSearchQueryExecutor__requestSceneAncestryInformation__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id WeakRetained;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  +[PXSearchTaxonomyUtility localizedSceneAncestryInformationWithError:](PXSearchTaxonomyUtility, "localizedSceneAncestryInformationWithError:", &v10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v10;
  if (v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setSceneAncestryInformation:", v2);

    PLPhotosSearchGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Got sceneAncestryInformation";
      v7 = v5;
      v8 = OS_LOG_TYPE_DEFAULT;
      v9 = 2;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v7, v8, v6, buf, v9);
    }
  }
  else
  {
    PLPhotosSearchGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      v6 = "Could not get scene ancestry information, error %@";
      v7 = v5;
      v8 = OS_LOG_TYPE_ERROR;
      v9 = 12;
      goto LABEL_6;
    }
  }

}

+ (BOOL)_sectionIsHighlightsSection:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  _BOOL8 v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "categoryMask");
  v5 = objc_msgSend(v3, "resultTypes");

  v6 = (v5 >> 1) & 1;
  if (v4 == 4096)
    LOBYTE(v6) = 0;
  return v4 != 256 && v6;
}

@end
