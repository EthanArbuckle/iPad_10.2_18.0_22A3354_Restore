@implementation PXTimelineDataSource

- (PXTimelineDataSource)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTimelineDataSource.m"), 101, CFSTR("%s is not available as initializer"), "-[PXTimelineDataSource init]");

  abort();
}

- (PXTimelineDataSource)initWithPhotoLibrary:(id)a3
{
  return -[PXTimelineDataSource initWithPhotoLibrary:forWidgetSize:](self, "initWithPhotoLibrary:forWidgetSize:", a3, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (PXTimelineDataSource)initWithPhotoLibrary:(id)a3 forWidgetSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  id v8;
  PXTimelineDataSource *v9;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = -[PXTimelineDataSourceOptions initForWidgetWithSize:]([PXTimelineDataSourceOptions alloc], "initForWidgetWithSize:", width, height);
  v9 = -[PXTimelineDataSource initWithPhotoLibrary:options:](self, "initWithPhotoLibrary:options:", v7, v8);

  return v9;
}

- (PXTimelineDataSource)initWithPhotoLibrary:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  PXTimelineDataSource *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  os_signpost_id_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableArray *v16;
  NSMutableArray *filteredContent;
  uint64_t v18;
  PHUserFeedbackCalculator *userFeedbackCalculator;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  NSMutableArray *v27;
  NSMutableArray *memoryCandidates;
  NSMutableArray *v29;
  NSMutableArray *featuredPhotoCandidates;
  id v31;
  void *v32;
  uint64_t v33;
  PHFetchResult *featuredMemories;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_signpost_id_t v43;
  os_signpost_id_t v44;
  objc_super v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v46.receiver = self;
  v46.super_class = (Class)PXTimelineDataSource;
  v8 = -[PXTimelineDataSource init](&v46, sel_init);
  if (v8)
  {
    PLTimelineGetLog();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_id_make_with_pointer(v9, v8);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v11 = v10;
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "Initialize - TimelineDataSource", " enableTelemetry=YES ", buf, 2u);
      }
    }

    PLMemoriesGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "widgetSize");
      v14 = v13;
      objc_msgSend(v7, "widgetSize");
      *(_DWORD *)buf = 134218240;
      v48 = v14;
      v49 = 2048;
      v50 = v15;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "Prepare TimelineDataSource for WidgetSize:{%.2f, %.2f}:", buf, 0x16u);
    }

    objc_storeWeak((id *)&v8->_photoLibrary, v6);
    objc_storeStrong((id *)&v8->_options, a4);
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    filteredContent = v8->_filteredContent;
    v8->_filteredContent = v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD17F8]), "initWithPhotoLibrary:", v6);
    userFeedbackCalculator = v8->_userFeedbackCalculator;
    v8->_userFeedbackCalculator = (PHUserFeedbackCalculator *)v18;

    if (PFOSVariantHasInternalUI())
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobileslideshow"));
      objc_msgSend(v20, "stringForKey:", CFSTR("forceWidgetEntryUUID"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = 0;
    }
    if (objc_msgSend(v21, "length"))
    {
      -[PXTimelineDataSource _initializeWithForceEntryUUID:](v8, "_initializeWithForceEntryUUID:", v21);
    }
    else
    {
      if (PLIsFeaturedContentAllowed())
      {
        -[PXTimelineDataSource _fetchMemoriesWithFeaturedState:](v8, "_fetchMemoriesWithFeaturedState:", 1);
        v22 = objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)&v8->_featuredMemories, v22);
        if (objc_msgSend(v7, "includeSuggestions"))
        {
          -[PXTimelineDataSource _fetchSuggestionsWithFeaturedState:](v8, "_fetchSuggestionsWithFeaturedState:", 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          PLMemoriesGetLog();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v25 = -[NSObject count](v22, "count");
            v26 = objc_msgSend(v23, "count");
            *(_DWORD *)buf = 134218240;
            v48 = v25;
            v49 = 2048;
            v50 = v26;
            _os_log_impl(&dword_1A6789000, v24, OS_LOG_TYPE_DEFAULT, "%lu memories and %lu suggestions are featured", buf, 0x16u);
          }
        }
        else
        {
          PLMemoriesGetLog();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v35 = -[NSObject count](v22, "count");
            *(_DWORD *)buf = 134217984;
            v48 = v35;
            _os_log_impl(&dword_1A6789000, v24, OS_LOG_TYPE_DEFAULT, "%lu memories featured with no suggestions", buf, 0xCu);
          }
          v23 = 0;
        }

        -[PXTimelineDataSource _initializeFeaturedCandidatesWithMemoryResult:suggestionResult:](v8, "_initializeFeaturedCandidatesWithMemoryResult:suggestionResult:", v22, v23);
        v36 = -[NSMutableArray count](v8->_memoryCandidates, "count");
        if (!(v36 + -[NSMutableArray count](v8->_featuredPhotoCandidates, "count")))
        {
          -[PXTimelineDataSource _fetchFallbackMemoriesAndSetFeatured](v8, "_fetchFallbackMemoriesAndSetFeatured");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong((id *)&v8->_featuredMemories, v37);
          if (objc_msgSend(v7, "includeSuggestions"))
          {
            -[PXTimelineDataSource _fetchFallbackSuggestionsAndSetFeatured](v8, "_fetchFallbackSuggestionsAndSetFeatured");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v38 = 0;
          }
          -[PXTimelineDataSource _initializeFeaturedCandidatesWithMemoryResult:suggestionResult:](v8, "_initializeFeaturedCandidatesWithMemoryResult:suggestionResult:", v37, v38);

        }
        PLMemoriesGetLog();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = -[NSMutableArray count](v8->_memoryCandidates, "count");
          v41 = -[NSMutableArray count](v8->_featuredPhotoCandidates, "count");
          *(_DWORD *)buf = 134218240;
          v48 = v40;
          v49 = 2048;
          v50 = v41;
          _os_log_impl(&dword_1A6789000, v39, OS_LOG_TYPE_DEFAULT, "Used For Scheduling - Memories:%lu, Suggestions:%lu\n", buf, 0x16u);
        }

      }
      else
      {
        v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        memoryCandidates = v8->_memoryCandidates;
        v8->_memoryCandidates = v27;

        v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        featuredPhotoCandidates = v8->_featuredPhotoCandidates;
        v8->_featuredPhotoCandidates = v29;

        v31 = objc_alloc(MEMORY[0x1E0CD1620]);
        -[PXTimelineDataSource photoLibrary](v8, "photoLibrary");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v31, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", MEMORY[0x1E0C9AA60], v32, *MEMORY[0x1E0CD1BB0], 0, 0, 0);
        featuredMemories = v8->_featuredMemories;
        v8->_featuredMemories = (PHFetchResult *)v33;

        PLMemoriesGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_DEFAULT, "Featured Content is disabled", buf, 2u);
        }
      }

    }
    PLTimelineGetLog();
    v42 = (id)objc_claimAutoreleasedReturnValue();
    v43 = os_signpost_id_make_with_pointer(v42, v8);
    if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v44 = v43;
      if (os_signpost_enabled(v42))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v42, OS_SIGNPOST_INTERVAL_END, v44, "Initialize - TimelineDataSource", " enableTelemetry=YES ", buf, 2u);
      }
    }

  }
  return v8;
}

- (PXTimelineDataSource)initWithAlbumLocalIdentifier:(id)a3 widgetIdentifier:(id)a4 widgetSize:(CGSize)a5 photoLibrary:(id)a6
{
  double height;
  double width;
  NSString *v12;
  id v13;
  id v14;
  PXTimelineDataSource *v15;
  PXTimelineDataSourceOptions *v16;
  PXTimelineDataSourceOptions *options;
  NSMutableArray *v18;
  NSMutableArray *filteredContent;
  id v20;
  void *v21;
  uint64_t v22;
  PHFetchResult *featuredMemories;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  NSString *sourceIdentifier;
  unint64_t sourceType;
  int v33;
  objc_super v35;
  uint8_t buf[4];
  NSString *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;
  uint64_t v48;

  height = a5.height;
  width = a5.width;
  v48 = *MEMORY[0x1E0C80C00];
  v12 = (NSString *)a3;
  v13 = a4;
  v14 = a6;
  v35.receiver = self;
  v35.super_class = (Class)PXTimelineDataSource;
  v15 = -[PXTimelineDataSource init](&v35, sel_init);
  if (v15)
  {
    v16 = -[PXTimelineDataSourceOptions initForWidgetWithSize:]([PXTimelineDataSourceOptions alloc], "initForWidgetWithSize:", width, height);
    options = v15->_options;
    v15->_options = v16;

    objc_storeWeak((id *)&v15->_photoLibrary, v14);
    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    filteredContent = v15->_filteredContent;
    v15->_filteredContent = v18;

    v15->_sourceType = 1;
    objc_storeStrong((id *)&v15->_sourceIdentifier, a3);
    v20 = objc_alloc(MEMORY[0x1E0CD1620]);
    -[PXTimelineDataSource photoLibrary](v15, "photoLibrary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", MEMORY[0x1E0C9AA60], v21, *MEMORY[0x1E0CD1BB0], 0, 0, 0);
    featuredMemories = v15->_featuredMemories;
    v15->_featuredMemories = (PHFetchResult *)v22;

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77F28]), "initWithAlbumLocalIdentifier:widgetIdentifier:photoLibrary:", v12, v13, v14);
    objc_msgSend(v25, "removeSuggestionsNotRelevantForDate:", v24);
    objc_msgSend(v25, "suggestions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXTimelineDataSource _initializeFeaturedCandidatesWithMemoryResult:suggestionResult:](v15, "_initializeFeaturedCandidatesWithMemoryResult:suggestionResult:", 0, v26);
    if (!-[NSMutableArray count](v15->_featuredPhotoCandidates, "count"))
    {
      PLMemoriesGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v12;
        _os_log_impl(&dword_1A6789000, v27, OS_LOG_TYPE_DEFAULT, "No suggestions for album %@, generating new", buf, 0xCu);
      }

      v28 = (id)objc_msgSend(v25, "updatedSuggestionLocalIdentifiersForDate:numberOfSuggestions:", v24, *MEMORY[0x1E0D78198]);
      objc_msgSend(v25, "suggestions");
      v29 = objc_claimAutoreleasedReturnValue();

      -[PXTimelineDataSource _initializeFeaturedCandidatesWithMemoryResult:suggestionResult:](v15, "_initializeFeaturedCandidatesWithMemoryResult:suggestionResult:", 0, v29);
      v26 = (void *)v29;
    }
    PLMemoriesGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      sourceIdentifier = v15->_sourceIdentifier;
      sourceType = v15->_sourceType;
      v33 = objc_msgSend(v26, "count");
      *(_DWORD *)buf = 138413570;
      v37 = sourceIdentifier;
      v38 = 2112;
      v39 = v13;
      v40 = 1024;
      v41 = sourceType;
      v42 = 1024;
      v43 = v33;
      v44 = 2048;
      v45 = width;
      v46 = 2048;
      v47 = height;
      _os_log_impl(&dword_1A6789000, v30, OS_LOG_TYPE_DEFAULT, "Initialized source id %@, widget id %@, type %d, with %d suggestions for widgetSize:{%.2f, %.2f}", buf, 0x36u);
    }

  }
  return v15;
}

- (void)_initializeWithForceEntryUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PHFetchResult *v10;
  PHFetchResult *featuredMemories;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint8_t buf[4];
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXTimelineDataSource photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setFetchLimit:", 1);
  objc_msgSend(v6, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(v6, "setIncludePendingMemories:", 1);
  objc_msgSend(MEMORY[0x1E0CD1630], "localIdentifierWithUUID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CD13B8];
  v21[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchAssetCollectionsWithLocalIdentifiers:options:", v9, v6);
  v10 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
  featuredMemories = self->_featuredMemories;
  self->_featuredMemories = v10;

  if (-[PHFetchResult count](self->_featuredMemories, "count"))
  {
    PLMemoriesGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v4;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "Using forced memory with uuid: %@", buf, 0xCu);
    }

    v13 = objc_alloc_init(MEMORY[0x1E0CD1580]);
  }
  else
  {
    -[PXTimelineDataSource photoLibrary](self, "photoLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "librarySpecificFetchOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setFetchLimit:", 1);
    objc_msgSend(v15, "setWantsIncrementalChangeDetails:", 0);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("uuid"), v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPredicate:", v16);

    objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v15);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      PLMemoriesGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v4;
        _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_DEFAULT, "Using forced suggestion with uuid: %@", buf, 0xCu);
      }

    }
    v6 = v15;
  }
  -[PXTimelineDataSource _initializeFeaturedCandidatesWithMemoryResult:suggestionResult:](self, "_initializeFeaturedCandidatesWithMemoryResult:suggestionResult:", self->_featuredMemories, v13);
  if (!-[PHFetchResult count](self->_featuredMemories, "count") && !objc_msgSend(v13, "count"))
  {
    PLMemoriesGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v4;
      _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_ERROR, "Forced entry was not found: %@", buf, 0xCu);
    }

  }
}

- (void)_initializeFeaturedCandidatesWithMemoryResult:(id)a3 suggestionResult:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  NSMutableArray *memoryCandidates;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  NSMutableArray *featuredPhotoCandidates;
  NSDictionary *v17;
  NSDictionary *keyAssetByMemoryLocalIdentifier;
  NSDictionary *v19;
  NSDictionary *keyAssetByFeaturedPhotoLocalIdentifier;
  void *v21;
  NSDictionary *v22;
  NSDictionary *suggestedCropByFeaturedPhotoLocalIdentifier;
  int v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLMemoriesGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 134218240;
    v25 = objc_msgSend(v6, "count");
    v26 = 2048;
    v27 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Candidate For Scheduling - Memories:%lu, Suggestions:%lu\n", (uint8_t *)&v24, 0x16u);
  }

  v9 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v6, "fetchedObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayWithArray:", v10);
  v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  memoryCandidates = self->_memoryCandidates;
  self->_memoryCandidates = v11;

  v13 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v7, "fetchedObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayWithArray:", v14);
  v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  featuredPhotoCandidates = self->_featuredPhotoCandidates;
  self->_featuredPhotoCandidates = v15;

  if (-[PXTimelineDataSourceOptions includeAssets](self->_options, "includeAssets"))
  {
    -[PXTimelineDataSource _gatedKeyAssetByMemoryLocalIdentifierWithMemories:](self, "_gatedKeyAssetByMemoryLocalIdentifierWithMemories:", v6);
    v17 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    keyAssetByMemoryLocalIdentifier = self->_keyAssetByMemoryLocalIdentifier;
    self->_keyAssetByMemoryLocalIdentifier = v17;

    -[PXTimelineDataSource _gatedKeyAssetBySuggestionLocalIdentifierWithSuggestions:](self, "_gatedKeyAssetBySuggestionLocalIdentifierWithSuggestions:", v7);
    v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    keyAssetByFeaturedPhotoLocalIdentifier = self->_keyAssetByFeaturedPhotoLocalIdentifier;
    self->_keyAssetByFeaturedPhotoLocalIdentifier = v19;

    -[PXTimelineDataSource featuredPhotoCandidates](self, "featuredPhotoCandidates");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXTimelineDataSource _gatedCropSpecBySuggestionLocalIdentiferFromSuggestions:](self, "_gatedCropSpecBySuggestionLocalIdentiferFromSuggestions:", v21);
    v22 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    suggestedCropByFeaturedPhotoLocalIdentifier = self->_suggestedCropByFeaturedPhotoLocalIdentifier;
    self->_suggestedCropByFeaturedPhotoLocalIdentifier = v22;

  }
}

- (id)_defaultSortDescriptorsForMemories
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_defaultSortDescriptorsForSuggestions
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_fetchMemoriesWithFeaturedState:(int64_t)a3
{
  return -[PXTimelineDataSource _fetchMemoriesWithFeaturedState:fetchLimit:](self, "_fetchMemoriesWithFeaturedState:fetchLimit:", a3, 20);
}

- (id)_fetchMemoriesWithFeaturedState:(int64_t)a3 fetchLimit:(unint64_t)a4
{
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  os_signpost_id_t v21;
  uint8_t buf[8];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  PLTimelineGetLog();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, self);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Fetch - MemoriesWithFeaturedState", " enableTelemetry=YES ", buf, 2u);
    }
  }

  -[PXTimelineDataSource photoLibrary](self, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "librarySpecificFetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setFetchLimit:", a4);
  objc_msgSend(v11, "setWantsIncrementalChangeDetails:", 1);
  objc_msgSend(v11, "setIncludePendingMemories:", 1);
  -[PXTimelineDataSource _defaultSortDescriptorsForMemories](self, "_defaultSortDescriptorsForMemories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSortDescriptors:", v12);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("featuredState == %d"), a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("rejected == NO AND userCreated == NO"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB3528];
  v24[0] = v13;
  v24[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "andPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v17);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PLTimelineGetLog();
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v20 = os_signpost_id_make_with_pointer(v19, self);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v21 = v20;
    if (os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v19, OS_SIGNPOST_INTERVAL_END, v21, "Fetch - MemoriesWithFeaturedState", " enableTelemetry=YES ", buf, 2u);
    }
  }

  return v18;
}

- (id)_fetchSuggestionsWithFeaturedState:(unsigned __int16)a3
{
  return -[PXTimelineDataSource _fetchSuggestionsWithFeaturedState:fetchLimit:](self, "_fetchSuggestionsWithFeaturedState:fetchLimit:", a3, 20);
}

- (id)_fetchSuggestionsWithFeaturedState:(unsigned __int16)a3 fetchLimit:(unint64_t)a4
{
  uint64_t v5;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  os_signpost_id_t v22;
  uint8_t v24[16];
  uint8_t buf[16];

  v5 = a3;
  PLTimelineGetLog();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, self);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Fetch - SuggestionsWithFeaturedState", " enableTelemetry=YES ", buf, 2u);
    }
  }

  -[PXTimelineDataSource photoLibrary](self, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "librarySpecificFetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFetchLimit:", a4);
  objc_msgSend(v11, "setWantsIncrementalChangeDetails:", 0);
  -[PXTimelineDataSource _defaultSortDescriptorsForSuggestions](self, "_defaultSortDescriptorsForSuggestions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSortDescriptors:", v12);

  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K == %d || %K == %d)"), CFSTR("state"), 1, CFSTR("state"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v14);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("subtype"), 302);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v15);

  +[PXContentSyndicationConfigurationProvider contentSyndicationConfigurationProviderWithPhotoLibrary:](PXContentSyndicationConfigurationProvider, "contentSyndicationConfigurationProviderWithPhotoLibrary:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "showUnsavedSyndicatedContentInFeaturedPhotos") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("subtype"), 306);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v17);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v18);

  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchWidgetSuggestionsWithFeaturedState:withOptions:", v5, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  PLTimelineGetLog();
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v21 = os_signpost_id_make_with_pointer(v20, self);
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v22 = v21;
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)v24 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v20, OS_SIGNPOST_INTERVAL_END, v22, "Fetch - SuggestionsWithFeaturedState", " enableTelemetry=YES ", v24, 2u);
    }
  }

  return v19;
}

- (id)_fetchFallbackMemoriesAndSetFeatured
{
  NSObject *v3;
  os_signpost_id_t v4;
  os_signpost_id_t v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  os_signpost_id_t v15;
  os_signpost_id_t v16;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  NSObject *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  PLTimelineGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Fetch - FallbackMemoriesAndSetFeatured", " enableTelemetry=YES ", buf, 2u);
    }
  }

  -[PXTimelineDataSource _fetchMemoriesWithFeaturedState:fetchLimit:](self, "_fetchMemoriesWithFeaturedState:fetchLimit:", 0, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    -[PXTimelineDataSource photoLibrary](self, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __60__PXTimelineDataSource__fetchFallbackMemoriesAndSetFeatured__block_invoke;
    v19[3] = &unk_1E5149198;
    v8 = v6;
    v20 = v8;
    v18 = 0;
    v9 = objc_msgSend(v7, "performChangesAndWait:error:", v19, &v18);
    v10 = v18;

    if ((v9 & 1) == 0)
    {
      PLMemoriesGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v10;
        _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Setting featureState on memories - failed: %@", buf, 0xCu);
      }

    }
    PLMemoriesGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = v13;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "Using fallback: %d memories", buf, 8u);
    }

  }
  else
  {
    PLMemoriesGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "No fallback memories", buf, 2u);
    }
  }

  PLTimelineGetLog();
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_make_with_pointer(v14, self);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v16 = v15;
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v14, OS_SIGNPOST_INTERVAL_END, v16, "Fetch - FallbackMemoriesAndSetFeatured", " enableTelemetry=YES ", buf, 2u);
    }
  }

  return v6;
}

- (id)_fetchFallbackSuggestionsAndSetFeatured
{
  NSObject *v3;
  os_signpost_id_t v4;
  os_signpost_id_t v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  os_signpost_id_t v15;
  os_signpost_id_t v16;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  NSObject *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  PLTimelineGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Fetch - FallbackSuggestionsAndSetFeatured", " enableTelemetry=YES ", buf, 2u);
    }
  }

  -[PXTimelineDataSource _fetchSuggestionsWithFeaturedState:fetchLimit:](self, "_fetchSuggestionsWithFeaturedState:fetchLimit:", 0, 10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    -[PXTimelineDataSource photoLibrary](self, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __63__PXTimelineDataSource__fetchFallbackSuggestionsAndSetFeatured__block_invoke;
    v19[3] = &unk_1E5149198;
    v8 = v6;
    v20 = v8;
    v18 = 0;
    v9 = objc_msgSend(v7, "performChangesAndWait:error:", v19, &v18);
    v10 = v18;

    if ((v9 & 1) == 0)
    {
      PLMemoriesGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v10;
        _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Setting featureState on suggestions - failed: %@", buf, 0xCu);
      }

    }
    PLMemoriesGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = v13;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "Using fallback: %d suggestions", buf, 8u);
    }

  }
  else
  {
    PLMemoriesGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "No fallback suggestions", buf, 2u);
    }
  }

  PLTimelineGetLog();
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_make_with_pointer(v14, self);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v16 = v15;
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v14, OS_SIGNPOST_INTERVAL_END, v16, "Fetch - FallbackSuggestionsAndSetFeatured", " enableTelemetry=YES ", buf, 2u);
    }
  }

  return v6;
}

- (id)keyAssetFetchOptions
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[PXTimelineDataSource photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *MEMORY[0x1E0CD1A50];
  v7[0] = *MEMORY[0x1E0CD19C0];
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchPropertySets:", v5);

  objc_msgSend(v3, "setFetchLimit:", 1);
  objc_msgSend(v3, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(v3, "setIncludeGuestAssets:", 1);
  return v3;
}

- (id)_gatedKeyAssetByMemoryLocalIdentifierWithMemories:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  PXTimelineEntry *v26;
  void *v27;
  PXTimelineDataSource *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  os_signpost_id_t v37;
  os_signpost_id_t v38;
  id v40;
  id v41;
  void *v42;
  id v43;
  id obj;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  void *v56;
  NSObject *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v41 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v4, "count"))
  {
    PLTimelineGetLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Fetch & Gate - MemoryKeyAssets", " enableTelemetry=YES ", buf, 2u);
      }
    }

    -[PXTimelineDataSource keyAssetFetchOptions](self, "keyAssetFetchOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v40 = v4;
    obj = v4;
    v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v46)
    {
      v45 = *(_QWORD *)v50;
      v42 = v8;
      do
      {
        for (i = 0; i != v46; ++i)
        {
          if (*(_QWORD *)v50 != v45)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyCuratedAssetInAssetCollection:referenceAsset:options:", v10, 0, v8, v40);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "firstObject");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            objc_msgSend(v12, "uuid");
            v14 = objc_claimAutoreleasedReturnValue();
            -[PXTimelineDataSource photoLibrary](self, "photoLibrary");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "librarySpecificFetchOptions");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setIncludedDetectionTypes:", v17);

            v18 = (void *)MEMORY[0x1E0CD16C0];
            v57 = v14;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "fetchPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:options:", v19, v16);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            v48 = v20;
            objc_msgSend(v20, "objectForKeyedSubscript:", v14);
            v21 = objc_claimAutoreleasedReturnValue();
            v22 = (void *)v21;
            v23 = (void *)MEMORY[0x1E0C9AA60];
            if (v21)
              v23 = (void *)v21;
            v24 = v23;

            v25 = 1;
            v47 = v24;
            if (objc_msgSend(MEMORY[0x1E0D77E50], "assetIsSafeForWidgetDisplay:", v13))
            {
              if (-[PXTimelineDataSource _isAcceptableUserFeedbackForAssetCollection:personUUIDs:asset:](self, "_isAcceptableUserFeedbackForAssetCollection:personUUIDs:asset:", v10, v24, v13))
              {
                objc_msgSend(v10, "localIdentifier");
                v26 = (PXTimelineEntry *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "setObject:forKeyedSubscript:", v13, v26);
LABEL_24:

                goto LABEL_25;
              }
              v25 = 4;
            }
            v28 = self;
            objc_msgSend(v43, "addObject:", v10);
            v26 = -[PXTimelineEntry initWithMemory:andMemoryKeyAsset:]([PXTimelineEntry alloc], "initWithMemory:andMemoryKeyAsset:", v10, v13);
            -[PXTimelineEntry setRejectReason:](v26, "setRejectReason:", v25);
            if (v26)
            {
              -[PXTimelineDataSource filteredContent](self, "filteredContent");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "addObject:", v26);

            }
            PLMemoriesGetLog();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v10, "localIdentifier");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              +[PXTimelineEntry descriptionForRejectReason:](PXTimelineEntry, "descriptionForRejectReason:", v25);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v54 = (uint64_t)v31;
              v55 = 2114;
              v56 = v32;
              _os_log_impl(&dword_1A6789000, v30, OS_LOG_TYPE_DEFAULT, "Memory %{public}@ is filtered from widget timeline with reason:%{public}@", buf, 0x16u);

            }
            self = v28;
            v8 = v42;
            goto LABEL_24;
          }
          PLMemoriesGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v10, "localIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v54 = (uint64_t)v27;
            _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "Memory key asset is nil: %{public}@", buf, 0xCu);

          }
LABEL_25:

        }
        v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      }
      while (v46);
    }

    PLMemoriesGetLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = objc_msgSend(v43, "count");
      *(_DWORD *)buf = 134217984;
      v54 = v34;
      _os_log_impl(&dword_1A6789000, v33, OS_LOG_TYPE_DEFAULT, "NotSafeForDisplay - Memories:%lu\n", buf, 0xCu);
    }

    -[PXTimelineDataSource memoryCandidates](self, "memoryCandidates");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "removeObjectsInArray:", v43);

    PLTimelineGetLog();
    v36 = (id)objc_claimAutoreleasedReturnValue();
    v37 = os_signpost_id_make_with_pointer(v36, self);
    if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v38 = v37;
      if (os_signpost_enabled(v36))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v36, OS_SIGNPOST_INTERVAL_END, v38, "Fetch & Gate - MemoryKeyAssets", " enableTelemetry=YES ", buf, 2u);
      }
    }

    v4 = v40;
  }

  return v41;
}

- (id)_gatedKeyAssetBySuggestionLocalIdentifierWithSuggestions:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  PXTimelineEntry *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  PXTimelineEntry *v36;
  PXTimelineEntry *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  os_signpost_id_t v47;
  os_signpost_id_t v48;
  void *v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id obj;
  void *v57;
  void *v58;
  PXTimelineDataSource *v59;
  uint64_t v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  uint64_t v71;
  __int16 v72;
  void *v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v54 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v4, "count"))
  {
    PLTimelineGetLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Fetch & Gate - SuggestionKeyAssets", " enableTelemetry=YES ", buf, 2u);
      }
    }

    -[PXTimelineDataSource keyAssetFetchOptions](self, "keyAssetFetchOptions");
    v8 = objc_claimAutoreleasedReturnValue();
    v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v50 = (void *)v8;
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetBySuggestionUUIDForSuggestions:options:", v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXTimelineDataSource _fetchMomentByAssetUUIDForAssets:](self, "_fetchMomentByAssetUUIDForAssets:", v10);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    obj = v10;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v67 != v13)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * i), "uuid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "addObject:", v15);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
      }
      while (v12);
    }

    v16 = (void *)MEMORY[0x1E0CD16C0];
    -[PXTimelineDataSource photoLibrary](self, "photoLibrary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "librarySpecificFetchOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fetchPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:options:", v61, v18);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v51 = v4;
    v55 = v4;
    v19 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
    if (v19)
    {
      v20 = v19;
      v60 = *(_QWORD *)v63;
      v59 = self;
      v52 = v9;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v63 != v60)
            objc_enumerationMutation(v55);
          v22 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
          objc_msgSend(v22, "uuid");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            objc_msgSend(v24, "uuid");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "objectForKeyedSubscript:", v25);
            v26 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v24, "uuid");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "objectForKeyedSubscript:", v27);
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = (void *)v28;
            v30 = (void *)MEMORY[0x1E0C9AA60];
            if (v28)
              v30 = (void *)v28;
            v31 = v30;

            if (-[PXTimelineDataSource sourceType](self, "sourceType") == 1)
            {
LABEL_21:
              objc_msgSend(v22, "localIdentifier");
              v32 = (PXTimelineEntry *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "setObject:forKeyedSubscript:", v24, v32);
            }
            else
            {
              if (objc_msgSend(MEMORY[0x1E0D77E50], "assetIsSafeForWidgetDisplay:", v24))
              {
                if ((objc_msgSend((id)objc_opt_class(), "_momentIsLocationTypeAtWork:", v26) & 1) != 0)
                {
                  v34 = 2;
                }
                else
                {
                  if (-[PXTimelineDataSource _isAcceptableUserFeedbackForAssetCollection:personUUIDs:asset:](self, "_isAcceptableUserFeedbackForAssetCollection:personUUIDs:asset:", v22, v31, v24))
                  {
                    goto LABEL_21;
                  }
                  v34 = 4;
                }
              }
              else
              {
                v34 = 1;
              }
              objc_msgSend(v53, "addObject:", v22);
              v35 = -[PXTimelineDataSource sourceType](v59, "sourceType");
              v36 = [PXTimelineEntry alloc];
              v37 = v36;
              if (v35 == 1)
              {
                -[PXTimelineDataSource sourceIdentifier](v59, "sourceIdentifier");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = -[PXTimelineEntry initWithAlbumFeaturedPhoto:localAlbumIdentifier:andFeaturedPhotoKeyAsset:suggestedCrop:](v37, "initWithAlbumFeaturedPhoto:localAlbumIdentifier:andFeaturedPhotoKeyAsset:suggestedCrop:", v22, v38, v24, 0);

              }
              else
              {
                v32 = -[PXTimelineEntry initWithFeaturedPhoto:andFeaturedPhotoKeyAsset:](v36, "initWithFeaturedPhoto:andFeaturedPhotoKeyAsset:", v22, v24);
              }
              -[PXTimelineEntry setRejectReason:](v32, "setRejectReason:", v34);
              v9 = v52;
              if (v32)
              {
                -[PXTimelineDataSource filteredContent](v59, "filteredContent");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "addObject:", v32);

              }
              PLMemoriesGetLog();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v22, "localIdentifier");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                +[PXTimelineEntry descriptionForRejectReason:](PXTimelineEntry, "descriptionForRejectReason:", v34);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v71 = (uint64_t)v41;
                v72 = 2114;
                v73 = v42;
                _os_log_impl(&dword_1A6789000, v40, OS_LOG_TYPE_DEFAULT, "Suggestion %{public}@ is filtered from widget timeline with reason:%{public}@", buf, 0x16u);

              }
              self = v59;
            }

            goto LABEL_39;
          }
          PLMemoriesGetLog();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v22, "localIdentifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v71 = (uint64_t)v33;
            _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_ERROR, "Suggestion key asset is nil: %{public}@", buf, 0xCu);

          }
LABEL_39:

        }
        v20 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
      }
      while (v20);
    }

    PLMemoriesGetLog();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = objc_msgSend(v53, "count");
      *(_DWORD *)buf = 134217984;
      v71 = v44;
      _os_log_impl(&dword_1A6789000, v43, OS_LOG_TYPE_DEFAULT, "NotSafeForDisplay - Suggestions:%lu\n", buf, 0xCu);
    }

    -[PXTimelineDataSource featuredPhotoCandidates](self, "featuredPhotoCandidates");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "removeObjectsInArray:", v53);

    PLTimelineGetLog();
    v46 = (id)objc_claimAutoreleasedReturnValue();
    v47 = os_signpost_id_make_with_pointer(v46, self);
    v4 = v51;
    if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v48 = v47;
      if (os_signpost_enabled(v46))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v46, OS_SIGNPOST_INTERVAL_END, v48, "Fetch & Gate - SuggestionKeyAssets", " enableTelemetry=YES ", buf, 2u);
      }
    }

  }
  return v54;
}

- (id)_fetchMomentByAssetUUIDForAssets:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  os_signpost_id_t v36;
  os_signpost_id_t v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  PXTimelineDataSource *ptr;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[16];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLTimelineGetLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, self);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Fetch - MomentsForAssets", " enableTelemetry=YES ", buf, 2u);
    }
  }

  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PXTimelineDataSource photoLibrary](self, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "librarySpecificFetchOptions");
  v10 = objc_claimAutoreleasedReturnValue();

  v42 = (void *)v10;
  objc_msgSend(MEMORY[0x1E0CD1670], "fetchMomentUUIDByAssetUUIDForAssets:options:", v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ptr = self;
  -[PXTimelineDataSource photoLibrary](self, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "librarySpecificFetchOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setFetchLimit:", objc_msgSend(v12, "count"));
  v41 = v12;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPredicate:", v15);

  v40 = v14;
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchMomentsWithOptions:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v18 = v16;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v49 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v23, "uuid");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v23, v24);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v20);
  }
  v39 = v18;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v25 = v4;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v45 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
        objc_msgSend(v30, "uuid");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "objectForKeyedSubscript:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "uuid");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v33, v34);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v27);
  }

  PLTimelineGetLog();
  v35 = (id)objc_claimAutoreleasedReturnValue();
  v36 = os_signpost_id_make_with_pointer(v35, ptr);
  if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v37 = v36;
    if (os_signpost_enabled(v35))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v35, OS_SIGNPOST_INTERVAL_END, v37, "Fetch - MomentsForAssets", " enableTelemetry=YES ", buf, 2u);
    }
  }

  return v8;
}

- (BOOL)_isAcceptableUserFeedbackForAssetCollection:(id)a3 personUUIDs:(id)a4 asset:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  char v19;
  void *v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v11;
  v23[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PXTimelineDataSource userFeedbackCalculator](self, "userFeedbackCalculator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scoreForAssetUUIDs:personsUUIDsByAssetUUIDs:", v14, v12);
    v16 = v15;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = *MEMORY[0x1E0CD1E70];
      goto LABEL_7;
    }
    objc_msgSend(v8, "blockableFeatures");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXTimelineDataSource userFeedbackCalculator](self, "userFeedbackCalculator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scoreForAssetUUIDs:keyAssetUUID:personsUUIDsByAssetUUIDs:memoryFeatures:", MEMORY[0x1E0C9AA60], v17, v12, v13);
    v16 = v18;

  }
LABEL_7:
  v19 = objc_msgSend(MEMORY[0x1E0CD17F8], "score:meetsScoreThreshold:", v16, *MEMORY[0x1E0CD1E58]);

  return v19;
}

- (id)_gatedCropSpecBySuggestionLocalIdentiferFromSuggestions:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  NSObject *v10;
  os_signpost_id_t v11;
  os_signpost_id_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  double v23;
  PXTimelineDataItem *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  id v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  PXTimelineEntry *v46;
  void *v47;
  void *v48;
  PXTimelineEntry *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  os_signpost_id_t v55;
  os_signpost_id_t v56;
  NSObject *v57;
  os_signpost_id_t v58;
  os_signpost_id_t v59;
  id v61;
  void *v62;
  id v63;
  NSObject *v64;
  uint64_t v65;
  id obj;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  uint64_t v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  void *v81;
  _BYTE v82[128];
  void *v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXTimelineDataSourceOptions widgetSize](self->_options, "widgetSize");
  v7 = v6;
  v8 = v5;
  v9 = v6 == *MEMORY[0x1E0C9D820] && v5 == *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v9 || !objc_msgSend(v4, "count"))
  {
    v67 = (id)MEMORY[0x1E0C9AA70];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.f, %.f}"), *(_QWORD *)&v7, *(_QWORD *)&v8);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    PLTimelineGetLog();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = os_signpost_id_make_with_pointer(v10, self);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v12 = v11;
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Gate - SuggestedCrop", " enableTelemetry=YES ", buf, 2u);
      }
    }

    PLMemoriesGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v77 = 0x3FD999999999999ALL;
      v78 = 2112;
      v79 = (uint64_t)v62;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEFAULT, "Start filtering suggestions with minimum cropScore:%f, widgetSize:%@", buf, 0x16u);
    }

    v67 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v63 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v61 = v4;
    obj = v4;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v73 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
          objc_msgSend(v18, "localIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXTimelineDataSource keyAssetByFeaturedPhotoLocalIdentifier](self, "keyAssetByFeaturedPhotoLocalIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            +[PXTimelineCrop cropForAsset:withTargetSize:](PXTimelineCrop, "cropForAsset:withTargetSize:", v21, v7, v8);
            v22 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "setObject:forKeyedSubscript:", v22, v19);
            -[NSObject cropScore](v22, "cropScore");
            if (v23 < 0.4)
            {
              v24 = -[PXTimelineDataItem initWithAssetCollection:suggestedCrop:]([PXTimelineDataItem alloc], "initWithAssetCollection:suggestedCrop:", v18, v22);
              objc_msgSend(v63, "addObject:", v24);

            }
          }
          else
          {
            PLMemoriesGetLog();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v77 = (uint64_t)v19;
              _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_ERROR, "Suggestion key asset is nil: %{public}@", buf, 0xCu);
            }
          }

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
      }
      while (v15);
    }

    PLMemoriesGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v63;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(v63, "count");
      *(_DWORD *)buf = 134217984;
      v77 = v27;
      _os_log_impl(&dword_1A6789000, v25, OS_LOG_TYPE_DEFAULT, "Found %lu suggestions with low crop score", buf, 0xCu);
    }

    if (objc_msgSend(v63, "count"))
    {
      v28 = v63;
      v29 = (uint64_t)((double)(unint64_t)objc_msgSend(obj, "count") * 0.25);
      v30 = v28;
      if (objc_msgSend(v28, "count") > v29)
      {
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("suggestedCrop.cropScore"), 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = v31;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "sortUsingDescriptors:", v32);

        objc_msgSend(v28, "subarrayWithRange:", 0, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

      }
      PLMemoriesGetLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = objc_msgSend(v28, "count");
        v35 = objc_msgSend(v30, "count");
        *(_DWORD *)buf = 134218240;
        v77 = v34;
        v78 = 2048;
        v79 = v35;
        _os_log_impl(&dword_1A6789000, v33, OS_LOG_TYPE_DEFAULT, "BadCrop - Suggestions:%lu, Removed:%lu\n", buf, 0x16u);
      }

      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v36 = v30;
      v37 = -[NSObject countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
      if (v37)
      {
        v38 = v37;
        v65 = *(_QWORD *)v69;
        v64 = v36;
        do
        {
          for (j = 0; j != v38; ++j)
          {
            if (*(_QWORD *)v69 != v65)
              objc_enumerationMutation(v64);
            v40 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
            objc_msgSend(v40, "assetCollection");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "localIdentifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[PXTimelineDataSource keyAssetByFeaturedPhotoLocalIdentifier](self, "keyAssetByFeaturedPhotoLocalIdentifier");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "objectForKeyedSubscript:", v42);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            v45 = -[PXTimelineDataSource sourceType](self, "sourceType");
            v46 = [PXTimelineEntry alloc];
            if (v45 == 1)
            {
              -[PXTimelineDataSource sourceIdentifier](self, "sourceIdentifier");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "suggestedCrop");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = -[PXTimelineEntry initWithAlbumFeaturedPhoto:localAlbumIdentifier:andFeaturedPhotoKeyAsset:suggestedCrop:](v46, "initWithAlbumFeaturedPhoto:localAlbumIdentifier:andFeaturedPhotoKeyAsset:suggestedCrop:", v41, v47, v44, v48);

            }
            else
            {
              objc_msgSend(v40, "suggestedCrop");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = -[PXTimelineEntry initWithFeaturedPhoto:andFeaturedPhotoKeyAsset:suggestedCrop:](v46, "initWithFeaturedPhoto:andFeaturedPhotoKeyAsset:suggestedCrop:", v41, v44, v47);
            }

            -[PXTimelineEntry setRejectReason:](v49, "setRejectReason:", 3);
            if (v49)
            {
              -[PXTimelineDataSource filteredContent](self, "filteredContent");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "addObject:", v49);

            }
            objc_msgSend(obj, "removeObject:", v41);
            objc_msgSend(v67, "setObject:forKeyedSubscript:", 0, v42);
            PLMemoriesGetLog();
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v41, "localIdentifier");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "suggestedCrop");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v77 = (uint64_t)v52;
              v78 = 2114;
              v79 = (uint64_t)v62;
              v80 = 2114;
              v81 = v53;
              _os_log_impl(&dword_1A6789000, v51, OS_LOG_TYPE_DEFAULT, "Removed:%{public}@ displaySize:%{public}@ suggestedCrop:%{public}@", buf, 0x20u);

            }
          }
          v36 = v64;
          v38 = -[NSObject countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
        }
        while (v38);
      }

      PLTimelineGetLog();
      v54 = (id)objc_claimAutoreleasedReturnValue();
      v55 = os_signpost_id_make_with_pointer(v54, self);
      if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v56 = v55;
        if (os_signpost_enabled(v54))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v54, OS_SIGNPOST_INTERVAL_END, v56, "Gate - SuggestedCrop", " enableTelemetry=YES ", buf, 2u);
        }
      }

      v4 = v61;
      v26 = v63;
    }
    else
    {
      PLTimelineGetLog();
      v57 = (id)objc_claimAutoreleasedReturnValue();
      v58 = os_signpost_id_make_with_pointer(v57, self);
      if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v59 = v58;
        if (os_signpost_enabled(v57))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v57, OS_SIGNPOST_INTERVAL_END, v59, "Gate - SuggestedCrop", " enableTelemetry=YES ", buf, 2u);
        }
      }

      PLMemoriesGetLog();
      v36 = objc_claimAutoreleasedReturnValue();
      v4 = v61;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v36, OS_LOG_TYPE_DEFAULT, "BadCrop - Suggestions:0, Removed:0\n", buf, 2u);
      }
    }

  }
  return v67;
}

- (NSDictionary)keyAssetByMemoryLocalIdentifier
{
  return self->_keyAssetByMemoryLocalIdentifier;
}

- (NSDictionary)keyAssetByFeaturedPhotoLocalIdentifier
{
  return self->_keyAssetByFeaturedPhotoLocalIdentifier;
}

- (NSDictionary)suggestedCropByFeaturedPhotoLocalIdentifier
{
  return self->_suggestedCropByFeaturedPhotoLocalIdentifier;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (unint64_t)widgetSizeClass
{
  return self->_widgetSizeClass;
}

- (PHFetchResult)featuredMemories
{
  return self->_featuredMemories;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_loadWeakRetained((id *)&self->_photoLibrary);
}

- (NSMutableArray)memoryCandidates
{
  return self->_memoryCandidates;
}

- (void)setMemoryCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_memoryCandidates, a3);
}

- (NSMutableArray)featuredPhotoCandidates
{
  return self->_featuredPhotoCandidates;
}

- (void)setFeaturedPhotoCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_featuredPhotoCandidates, a3);
}

- (NSMutableArray)filteredContent
{
  return self->_filteredContent;
}

- (void)setFilteredContent:(id)a3
{
  objc_storeStrong((id *)&self->_filteredContent, a3);
}

- (PHUserFeedbackCalculator)userFeedbackCalculator
{
  return self->_userFeedbackCalculator;
}

- (void)setUserFeedbackCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_userFeedbackCalculator, a3);
}

- (PXTimelineDataSourceOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_userFeedbackCalculator, 0);
  objc_storeStrong((id *)&self->_filteredContent, 0);
  objc_storeStrong((id *)&self->_featuredPhotoCandidates, 0);
  objc_storeStrong((id *)&self->_memoryCandidates, 0);
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_featuredMemories, 0);
  objc_storeStrong((id *)&self->_suggestedCropByFeaturedPhotoLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_keyAssetByFeaturedPhotoLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_keyAssetByMemoryLocalIdentifier, 0);
}

void __63__PXTimelineDataSource__fetchFallbackSuggestionsAndSetFeatured__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(MEMORY[0x1E0CD17D8], "changeRequestForSuggestion:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5), (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setFeaturedState:", 1);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __60__PXTimelineDataSource__fetchFallbackMemoriesAndSetFeatured__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(MEMORY[0x1E0CD1640], "changeRequestForMemory:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5), (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setFeaturedState:", 1);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

+ (BOOL)_momentIsLocationTypeAtWork:(id)a3
{
  return objc_msgSend(a3, "processedLocation") == 4;
}

@end
