@implementation PHAUserFeedbackUpdater

- (PHAUserFeedbackUpdater)initWithGraphManager:(id)a3
{
  id v5;
  PHAUserFeedbackUpdater *v6;
  PHAUserFeedbackUpdater *v7;
  uint64_t v8;
  PHPhotoLibrary *photoLibrary;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *highlighUpdationQueue;
  void *v13;
  void *v14;
  uint64_t v15;
  PHUserFeedbackCalculator *userFeedbackCalculator;
  void *v17;
  uint64_t v18;
  OS_os_log *loggingConnection;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PHAUserFeedbackUpdater;
  v6 = -[PHAUserFeedbackUpdater init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphManager, a3);
    objc_msgSend(v5, "photoLibrary");
    v8 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v7->_photoLibrary;
    v7->_photoLibrary = (PHPhotoLibrary *)v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.PHAUserFeedbackHighlightUpdation", v10);
    highlighUpdationQueue = v7->_highlighUpdationQueue;
    v7->_highlighUpdationQueue = (OS_dispatch_queue *)v11;

    v13 = (void *)objc_opt_class();
    objc_msgSend(v5, "photoLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_userFeedbackCalculatorWithPhotoLibrary:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    userFeedbackCalculator = v7->_userFeedbackCalculator;
    v7->_userFeedbackCalculator = (PHUserFeedbackCalculator *)v15;

    objc_msgSend(v5, "workingContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "loggingConnection");
    v18 = objc_claimAutoreleasedReturnValue();
    loggingConnection = v7->_loggingConnection;
    v7->_loggingConnection = (OS_os_log *)v18;

  }
  return v7;
}

- (BOOL)updateFeatureContentWithPersonUUIDs:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  void *v9;
  NSObject *highlighUpdationQueue;
  BOOL v11;
  BOOL v12;
  _QWORD block[5];
  id v15;
  char v16;

  v5 = a3;
  -[PHAUserFeedbackUpdater _suggestionsToRetire](self, "_suggestionsToRetire");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v7 = -[PHAUserFeedbackUpdater _retireAndUnfeatureSuggestions:didUnfeatureSuggestions:](self, "_retireAndUnfeatureSuggestions:didUnfeatureSuggestions:", v6, &v16);
  -[PHAUserFeedbackUpdater _demoteNotFeaturedMemories](self, "_demoteNotFeaturedMemories");
  v8 = -[PHAUserFeedbackUpdater _demoteFeaturedMemories](self, "_demoteFeaturedMemories");
  -[PHUserFeedbackCalculator personUUIDsWithNegativeFeedback](self->_userFeedbackCalculator, "personUUIDsWithNegativeFeedback");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAUserFeedbackUpdater _processWallpaperSuggestionsWithNegativeFeedbackPersonUUIDs:](self, "_processWallpaperSuggestionsWithNegativeFeedbackPersonUUIDs:", v9);
  if (v5)
  {
    highlighUpdationQueue = self->_highlighUpdationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__PHAUserFeedbackUpdater_updateFeatureContentWithPersonUUIDs_error___block_invoke;
    block[3] = &unk_1E85211E0;
    block[4] = self;
    v15 = v5;
    dispatch_async(highlighUpdationQueue, block);

  }
  if (v16)
    v11 = v7;
  else
    v11 = 0;
  v12 = v11 || v8;

  return v12;
}

- (id)_suggestionsToRetire
{
  NSObject *loggingConnection;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  char *v23;
  NSObject *v24;
  uint64_t v25;
  uint32_t denom;
  uint32_t numer;
  NSObject *v28;
  NSObject *v29;
  os_signpost_id_t spid;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  id v38;
  id obj;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  double v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] Started fetching suggestions to retire based on user feedback.", buf, 2u);
    loggingConnection = self->_loggingConnection;
  }
  v4 = loggingConnection;
  v5 = os_signpost_id_generate(v4);
  info = 0;
  mach_timebase_info(&info);
  v6 = v4;
  v7 = v6;
  v35 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SuggestionsToRetire", ", buf, 2u);
  }
  spid = v5;
  v34 = v7;

  v32 = mach_absolute_time();
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(state == %d || state == %d || state == %d)"), 1, 0, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);

  v37 = v8;
  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchAllFeaturedStateEnabledSuggestionsWithOptions:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIncludeGuestAssets:", 1);
  v36 = v11;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetBySuggestionUUIDForSuggestions:options:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allValues");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAUserFeedbackUpdater _personUUIDsByAssetUUIDFromAssets:](self, "_personUUIDsByAssetUUIDFromAssets:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v10;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v42 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v18 = (void *)MEMORY[0x1D1798448]();
        objc_msgSend(v17, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          -[PHAUserFeedbackUpdater _userFeedbackScoreForAssetCollection:assetsFetchResult:keyAsset:personUUIDsByAssetUUID:](self, "_userFeedbackScoreForAssetCollection:assetsFetchResult:keyAsset:personUUIDsByAssetUUID:", v17, 0, v20, v40);
          if (objc_msgSend(MEMORY[0x1E0CD17F8], "score:meetsScoreThreshold:"))
            objc_msgSend(v38, "addObject:", v17);
        }
        else
        {
          v21 = self->_loggingConnection;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v22 = v21;
            objc_msgSend(v17, "uuid");
            v23 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v47 = v23;
            _os_log_error_impl(&dword_1CAC16000, v22, OS_LOG_TYPE_ERROR, "[PHAUserFeedbackUpdater] Key asset is nil for suggestion with UUID %@", buf, 0xCu);

          }
        }

        objc_autoreleasePoolPop(v18);
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v14);
  }

  v24 = self->_loggingConnection;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAC16000, v24, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] Finished fetching suggestions to retire based on user feedback.", buf, 2u);
  }
  v25 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v28 = v34;
  v29 = v28;
  if (v35 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v29, OS_SIGNPOST_INTERVAL_END, spid, "SuggestionsToRetire", ", buf, 2u);
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v47 = "SuggestionsToRetire";
    v48 = 2048;
    v49 = (float)((float)((float)((float)(v25 - v32) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CAC16000, v29, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v38;
}

- (BOOL)_retireAndUnfeatureSuggestions:(id)a3 didUnfeatureSuggestions:(BOOL *)a4
{
  id v6;
  NSObject *loggingConnection;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  PHPhotoLibrary *photoLibrary;
  id v14;
  _BOOL4 v15;
  char *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint8_t v20;
  uint64_t v21;
  uint32_t denom;
  uint32_t numer;
  NSObject *v24;
  NSObject *v25;
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t *v30;
  uint8_t buf[8];
  uint8_t *v32;
  uint64_t v33;
  char v34;
  mach_timebase_info info;
  uint8_t v36[4];
  const char *v37;
  __int16 v38;
  double v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!objc_msgSend(v6, "count"))
  {
    LOBYTE(v15) = 0;
    goto LABEL_23;
  }
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] Started retiring suggestions.", buf, 2u);
    loggingConnection = self->_loggingConnection;
  }
  v8 = loggingConnection;
  v9 = os_signpost_id_generate(v8);
  info = 0;
  mach_timebase_info(&info);
  v10 = v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "RetireAndUnfeatureSuggestions", ", buf, 2u);
  }

  v12 = mach_absolute_time();
  *(_QWORD *)buf = 0;
  v32 = buf;
  v33 = 0x2020000000;
  v34 = 0;
  photoLibrary = self->_photoLibrary;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __81__PHAUserFeedbackUpdater__retireAndUnfeatureSuggestions_didUnfeatureSuggestions___block_invoke;
  v28[3] = &unk_1E851F508;
  v14 = v6;
  v29 = v14;
  v30 = buf;
  v27 = 0;
  v15 = -[PHPhotoLibrary performChangesAndWait:error:](photoLibrary, "performChangesAndWait:error:", v28, &v27);
  v16 = (char *)v27;
  v17 = self->_loggingConnection;
  if (v15)
  {
    v18 = v17;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v14, "count");
      *(_DWORD *)v36 = 134217984;
      v37 = (const char *)v19;
      _os_log_impl(&dword_1CAC16000, v18, OS_LOG_TYPE_DEFAULT, "[PHAUserFeedbackUpdater] %lu suggestion(s) marked as retired.", v36, 0xCu);
    }

    if (!a4)
      goto LABEL_17;
    v20 = v32[24];
    goto LABEL_16;
  }
  if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    if (!a4)
      goto LABEL_17;
    goto LABEL_15;
  }
  *(_DWORD *)v36 = 138412290;
  v37 = v16;
  _os_log_error_impl(&dword_1CAC16000, v17, OS_LOG_TYPE_ERROR, "[PHAUserFeedbackUpdater] Retiring suggestions failed with error: %@", v36, 0xCu);
  if (a4)
  {
LABEL_15:
    v20 = 0;
LABEL_16:
    *a4 = v20;
  }
LABEL_17:
  v21 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v24 = v11;
  v25 = v24;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)v36 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v25, OS_SIGNPOST_INTERVAL_END, v9, "RetireAndUnfeatureSuggestions", ", v36, 2u);
  }

  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v36 = 136315394;
    v37 = "RetireAndUnfeatureSuggestions";
    v38 = 2048;
    v39 = (float)((float)((float)((float)(v21 - v12) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CAC16000, v25, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v36, 0x16u);
  }

  _Block_object_dispose(buf, 8);
LABEL_23:

  return v15;
}

- (BOOL)_demoteFeaturedMemories
{
  NSObject *loggingConnection;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  char *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint32_t denom;
  uint32_t numer;
  NSObject *v21;
  NSObject *v22;
  BOOL v23;
  id v25;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] Started unfeaturing memories based on user feedback.", buf, 2u);
    loggingConnection = self->_loggingConnection;
  }
  v4 = loggingConnection;
  v5 = os_signpost_id_generate(v4);
  info = 0;
  mach_timebase_info(&info);
  v6 = v4;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "UnfeatureMemories", ", buf, 2u);
  }

  v8 = mach_absolute_time();
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("featuredState == %d"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  objc_msgSend(v9, "setIncludePendingMemories:", 1);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAUserFeedbackUpdater _notRecommendedMemoriesFromMemories:](self, "_notRecommendedMemoriesFromMemories:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v13 = -[PHAUserFeedbackUpdater _neverFeatureMemories:error:](self, "_neverFeatureMemories:error:", v12, &v25);
  v14 = (char *)v25;
  v15 = self->_loggingConnection;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      v17 = objc_msgSend(v12, "count");
      *(_DWORD *)buf = 134217984;
      v28 = (const char *)v17;
      _os_log_impl(&dword_1CAC16000, v16, OS_LOG_TYPE_DEFAULT, "[PHAUserFeedbackUpdater] Finished unfeaturing memories based on user feedback. %lu memories marked as never featured.", buf, 0xCu);

    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v14;
    _os_log_error_impl(&dword_1CAC16000, v15, OS_LOG_TYPE_ERROR, "[PHAUserFeedbackUpdater] Unfeaturing memories based on user feedback failed with error: %@", buf, 0xCu);
  }
  v18 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v21 = v7;
  v22 = v21;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v22, OS_SIGNPOST_INTERVAL_END, v5, "UnfeatureMemories", ", buf, 2u);
  }

  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "UnfeatureMemories";
    v29 = 2048;
    v30 = (float)((float)((float)((float)(v18 - v8) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CAC16000, v22, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v23 = v13 && objc_msgSend(v12, "count") != 0;

  return v23;
}

- (void)_demoteNotFeaturedMemories
{
  PHAUserFeedbackUpdater *v2;
  NSObject *loggingConnection;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  PHAUserFeedbackUpdater *v25;
  void *v26;
  id v27;
  unint64_t v28;
  _BOOL4 v29;
  char *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint32_t denom;
  uint32_t numer;
  NSObject *v38;
  NSObject *v39;
  os_signpost_id_t spid;
  uint64_t v41;
  NSObject *v42;
  unint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  double v59;
  _BYTE v60[128];
  _QWORD v61[4];

  v2 = self;
  v61[2] = *MEMORY[0x1E0C80C00];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] Started marking memories as never feature based on user feedback.", buf, 2u);
    loggingConnection = v2->_loggingConnection;
  }
  v4 = loggingConnection;
  v5 = os_signpost_id_generate(v4);
  info = 0;
  mach_timebase_info(&info);
  v6 = v4;
  v7 = v6;
  v43 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "UnfeatureMemories", ", buf, 2u);
  }
  spid = v5;
  v42 = v7;

  v41 = mach_absolute_time();
  -[PHPhotoLibrary librarySpecificFetchOptions](v2->_photoLibrary, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWantsIncrementalChangeDetails:", 1);
  objc_msgSend(v8, "setChunkSizeForFetch:", 13);
  objc_msgSend(v8, "setCacheSizeForFetch:", 13);
  objc_msgSend(v8, "setIncludePendingMemories:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("rejected = NO AND featuredState == %d"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v12);

  v44 = v8;
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
  v46 = v15;
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v48 = *(_QWORD *)v52;
    while (2)
    {
      v19 = 0;
      v49 = v18 + 1;
      v45 = v18 + v17;
      do
      {
        if (*(_QWORD *)v52 != v48)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v19);
        v21 = (void *)MEMORY[0x1D1798448]();
        objc_msgSend(v20, "objectID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v22);

        v23 = v49 + v19;
        if (objc_msgSend(v14, "count") == 13 || v23 >= objc_msgSend(v15, "count"))
        {
          objc_msgSend((id)objc_opt_class(), "_memoriesFetchResultWithObjectIDs:existingMemoriesFetchResult:", v14, v15);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v2;
          -[PHAUserFeedbackUpdater _notRecommendedMemoriesFromMemories:](v2, "_notRecommendedMemoriesFromMemories:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "addObjectsFromArray:", v26);
          v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

          v28 = v23 - objc_msgSend(v47, "count");
          if (v28 > 4)
          {
            objc_autoreleasePoolPop(v21);
            v14 = v27;
            v2 = v25;
            v15 = v46;
            goto LABEL_19;
          }
          v14 = v27;
          v2 = v25;
          v15 = v46;
        }
        objc_autoreleasePoolPop(v21);
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      v18 = v45;
      if (v17)
        continue;
      break;
    }
  }
LABEL_19:

  v50 = 0;
  v29 = -[PHAUserFeedbackUpdater _neverFeatureMemories:error:](v2, "_neverFeatureMemories:error:", v47, &v50);
  v30 = (char *)v50;
  v31 = v2->_loggingConnection;
  if (v29)
  {
    v32 = v42;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v33 = v31;
      v34 = objc_msgSend(v47, "count");
      *(_DWORD *)buf = 134217984;
      v57 = (const char *)v34;
      _os_log_impl(&dword_1CAC16000, v33, OS_LOG_TYPE_DEFAULT, "[PHAUserFeedbackUpdater] Finished marking memories as never feature based on user feedback. %lu memories marked as never featured.", buf, 0xCu);

    }
  }
  else
  {
    v32 = v42;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v57 = v30;
      _os_log_error_impl(&dword_1CAC16000, v31, OS_LOG_TYPE_ERROR, "[PHAUserFeedbackUpdater] Marking memories as never featurebased on user feedback failed with error: %@", buf, 0xCu);
    }
  }
  v35 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v38 = v32;
  v39 = v38;
  if (v43 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v39, OS_SIGNPOST_INTERVAL_END, spid, "UnfeatureMemories", ", buf, 2u);
  }

  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v57 = "UnfeatureMemories";
    v58 = 2048;
    v59 = (float)((float)((float)((float)(v35 - v41) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CAC16000, v39, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

- (id)_notRecommendedMemoriesFromMemories:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *loggingConnection;
  NSObject *v18;
  void *v19;
  void *v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludeGuestAssets:", 1);
  v21 = v5;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetByMemoryUUIDForMemories:options:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAUserFeedbackUpdater _personUUIDsByAssetUUIDFromAssets:](self, "_personUUIDsByAssetUUIDFromAssets:", v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1D1798448]();
        objc_msgSend(v13, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          -[PHAUserFeedbackUpdater _userFeedbackScoreForAssetCollection:assetsFetchResult:keyAsset:personUUIDsByAssetUUID:](self, "_userFeedbackScoreForAssetCollection:assetsFetchResult:keyAsset:personUUIDsByAssetUUID:", v13, 0, v16, v23);
          if (objc_msgSend(MEMORY[0x1E0CD17F8], "score:meetsScoreThreshold:"))
            objc_msgSend(v22, "addObject:", v13);
        }
        else
        {
          loggingConnection = self->_loggingConnection;
          if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
          {
            v18 = loggingConnection;
            objc_msgSend(v13, "uuid");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v29 = v19;
            _os_log_error_impl(&dword_1CAC16000, v18, OS_LOG_TYPE_ERROR, "[PHAUserFeedbackUpdater] Key asset is nil for memory with UUID %@", buf, 0xCu);

          }
        }

        objc_autoreleasePoolPop(v14);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v10);
  }

  return v22;
}

- (BOOL)_neverFeatureMemories:(id)a3 error:(id *)a4
{
  id v6;
  PHPhotoLibrary *photoLibrary;
  char v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    photoLibrary = self->_photoLibrary;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__PHAUserFeedbackUpdater__neverFeatureMemories_error___block_invoke;
    v10[3] = &unk_1E8521740;
    v11 = v6;
    v8 = -[PHPhotoLibrary performChangesAndWait:error:](photoLibrary, "performChangesAndWait:error:", v10, a4);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)_processWallpaperSuggestionsWithNegativeFeedbackPersonUUIDs:(id)a3
{
  id v4;
  NSObject *loggingConnection;
  void *v6;
  OS_os_log *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  uint32_t denom;
  uint32_t numer;
  NSObject *v16;
  NSObject *v17;
  OS_os_log *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  mach_timebase_info v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  mach_timebase_info v28;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] About to process Wallpaper Suggestions", buf, 2u);
  }
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CD16C0], "localIdentifiersWithUUIDs:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self->_loggingConnection;
    v8 = os_signpost_id_generate((os_log_t)v7);
    info = 0;
    mach_timebase_info(&info);
    v9 = v7;
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CAC16000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "WallpaperTopSuggestionDeletion", ", buf, 2u);
    }

    v11 = mach_absolute_time();
    v12 = -[PHAUserFeedbackUpdater _deleteWallpaperTopSuggestionsOfPersonsForLocalIdentifiers:](self, "_deleteWallpaperTopSuggestionsOfPersonsForLocalIdentifiers:", v6);
    v13 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v16 = v10;
    v17 = v16;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CAC16000, v17, OS_SIGNPOST_INTERVAL_END, v8, "WallpaperTopSuggestionDeletion", ", buf, 2u);
    }

    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "WallpaperTopSuggestionDeletion";
      v32 = 2048;
      v33 = (float)((float)((float)((float)(v13 - v11) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CAC16000, v17, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v18 = self->_loggingConnection;
    v19 = os_signpost_id_generate((os_log_t)v18);
    v28 = 0;
    mach_timebase_info(&v28);
    v20 = v18;
    v21 = v20;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CAC16000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "WallpaperSuggestionReload", ", buf, 2u);
    }

    v22 = mach_absolute_time();
    -[PHAUserFeedbackUpdater _reloadWallpaperSuggestionsWithRejectedPersonsForLocalIdentifiers:forceReload:](self, "_reloadWallpaperSuggestionsWithRejectedPersonsForLocalIdentifiers:forceReload:", v6, v12);
    v23 = mach_absolute_time();
    v24 = v28;
    v25 = v21;
    v26 = v25;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CAC16000, v26, OS_SIGNPOST_INTERVAL_END, v19, "WallpaperSuggestionReload", ", buf, 2u);
    }

    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "WallpaperSuggestionReload";
      v32 = 2048;
      v33 = (float)((float)((float)((float)(v23 - v22) * (float)v24.numer) / (float)v24.denom) / 1000000.0);
      _os_log_impl(&dword_1CAC16000, v26, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

  }
  else
  {
    v27 = self->_loggingConnection;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v27, OS_LOG_TYPE_DEFAULT, "[PHAUserFeedbackUpdater] No person with negative feedback, nothing to do", buf, 2u);
    }
  }

}

- (BOOL)_deleteWallpaperTopSuggestionsOfPersonsForLocalIdentifiers:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PHPhotoLibrary *photoLibrary;
  id v14;
  _BOOL4 v15;
  id v16;
  NSObject *loggingConnection;
  NSObject *v18;
  int v19;
  NSObject *v20;
  int v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  _BYTE v27[14];
  __int16 v28;
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3928];
  v5 = a3;
  objc_msgSend(v4, "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d AND %K IN %@"), CFSTR("subtype"), 602, CFSTR("context"), v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setPredicate:", v11);
  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    photoLibrary = self->_photoLibrary;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __85__PHAUserFeedbackUpdater__deleteWallpaperTopSuggestionsOfPersonsForLocalIdentifiers___block_invoke;
    v24[3] = &unk_1E8521740;
    v14 = v12;
    v25 = v14;
    v23 = 0;
    v15 = -[PHPhotoLibrary performChangesAndWait:error:](photoLibrary, "performChangesAndWait:error:", v24, &v23);
    v16 = v23;
    loggingConnection = self->_loggingConnection;
    if (v15)
    {
      if (!os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        goto LABEL_10;
      }
      v18 = loggingConnection;
      v19 = objc_msgSend(v14, "count");
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v27 = v19;
      *(_WORD *)&v27[4] = 2112;
      *(_QWORD *)&v27[6] = v9;
      _os_log_impl(&dword_1CAC16000, v18, OS_LOG_TYPE_DEFAULT, "[PHAUserFeedbackUpdater] Successfully deleted %d Wallpaper Top Suggestions for persons %@", buf, 0x12u);
    }
    else
    {
      if (!os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      v18 = loggingConnection;
      v22 = objc_msgSend(v14, "count");
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v27 = v22;
      *(_WORD *)&v27[4] = 2112;
      *(_QWORD *)&v27[6] = v9;
      v28 = 2112;
      v29 = v16;
      _os_log_error_impl(&dword_1CAC16000, v18, OS_LOG_TYPE_ERROR, "[PHAUserFeedbackUpdater] Failed to delete %d Wallpaper Top Suggestions for persons %@: %@", buf, 0x1Cu);
    }

    goto LABEL_9;
  }
  v20 = self->_loggingConnection;
  LOBYTE(v15) = 0;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v27 = v9;
    _os_log_impl(&dword_1CAC16000, v20, OS_LOG_TYPE_DEFAULT, "[PHAUserFeedbackUpdater] No Wallpaper Top Suggestions for persons %@", buf, 0xCu);
    LOBYTE(v15) = 0;
  }
LABEL_10:

  return v15;
}

- (void)_reloadWallpaperSuggestionsWithRejectedPersonsForLocalIdentifiers:(id)a3 forceReload:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  PHAWallpaperSuggestionRefreshSession *v18;
  _BOOL4 v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  NSObject *loggingConnection;
  int v31;
  id v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  _BYTE v43[14];
  __int16 v44;
  id v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v4 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d AND %K = %d AND %K IN %@"), CFSTR("subtype"), 652, CFSTR("featuredState"), 1, CFSTR("context"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
    v10 = 0;
  else
    v10 = !v4;
  if (!v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v39 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "uuid");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v14);
    }

    v18 = -[PHAWallpaperSuggestionRefreshSession initWithGraphManager:]([PHAWallpaperSuggestionRefreshSession alloc], "initWithGraphManager:", self->_graphManager);
    v37 = 0;
    v19 = -[PHAWallpaperSuggestionRefreshSession prepareWithError:](v18, "prepareWithError:", &v37);
    v20 = v37;
    if (!v19)
    {
      loggingConnection = self->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v43 = v20;
        _os_log_fault_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_FAULT, "[PHAUserFeedbackUpdater] Failed to prepare Wallpaper Suggestions refresh session: %@", buf, 0xCu);
      }
      goto LABEL_23;
    }
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D761C8]), "initWithTaskName:loggingConnection:", CFSTR("ReloadWallpaperSuggestionsForUserFeedbackUpdater"), self->_loggingConnection);
    v22 = objc_alloc(MEMORY[0x1E0D42A70]);
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __104__PHAUserFeedbackUpdater__reloadWallpaperSuggestionsWithRejectedPersonsForLocalIdentifiers_forceReload___block_invoke;
    v35[3] = &unk_1E8521A20;
    v34 = v21;
    v36 = v34;
    v33 = (void *)objc_msgSend(v22, "initWithProgressBlock:", v35);
    LODWORD(v22) = -[PHAWallpaperSuggestionRefreshSession reloadWallpaperSuggestionsForUUIDs:progress:error:](v18, "reloadWallpaperSuggestionsForUUIDs:progress:error:", v11);
    v32 = v20;

    -[PHAWallpaperSuggestionRefreshSession cleanup](v18, "cleanup");
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sortedArrayUsingDescriptors:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = self->_loggingConnection;
    if ((_DWORD)v22)
    {
      v20 = v32;
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
LABEL_22:

LABEL_23:
        goto LABEL_24;
      }
      v27 = v26;
      v28 = objc_msgSend(v25, "count");
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v43 = v28;
      *(_WORD *)&v43[4] = 2112;
      *(_QWORD *)&v43[6] = v25;
      _os_log_impl(&dword_1CAC16000, v27, OS_LOG_TYPE_DEFAULT, "[PHAUserFeedbackUpdater] Successfully reloaded Wallpaper Suggestions for %d impacted featured Suggestions %@", buf, 0x12u);
    }
    else
    {
      v20 = v32;
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        goto LABEL_22;
      v27 = v26;
      v31 = objc_msgSend(v25, "count");
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v43 = v31;
      *(_WORD *)&v43[4] = 2112;
      *(_QWORD *)&v43[6] = v25;
      v44 = 2112;
      v45 = v32;
      _os_log_error_impl(&dword_1CAC16000, v27, OS_LOG_TYPE_ERROR, "[PHAUserFeedbackUpdater] Failed to reload Wallpaper Suggestions for %d impacted featured Suggestions %@: %@", buf, 0x1Cu);
    }

    goto LABEL_22;
  }
  v29 = self->_loggingConnection;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAC16000, v29, OS_LOG_TYPE_DEFAULT, "[PHAUserFeedbackUpdater] No featured Wallpaper Suggestion to reload for", buf, 2u);
  }
LABEL_24:

}

- (id)_fetchAssetsWithNegativeFeedbackFrom:(id)a3
{
  id v4;
  NSObject *loggingConnection;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[16];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] Initiate fetching assets for persons with negative feedback.", buf, 2u);
  }
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIncludedDetectionTypes:", &unk_1E8540BD8);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN (%@)"), CFSTR("personUUID"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInternalPredicate:", v7);

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = *MEMORY[0x1E0CD19C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFetchPropertySets:", v10);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsForPersons:options:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_enrichKeyAssetsforHighlightsWithNegativeFeedbackWithAssets:(id)a3
{
  id v4;
  NSObject *loggingConnection;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  int v25;
  objc_class *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  uint32_t denom;
  uint32_t numer;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  unint64_t v39;
  uint64_t v40;
  os_signpost_id_t spid;
  void *v42;
  NSObject *v43;
  id v44;
  mach_timebase_info info;
  void *v46;
  _BYTE buf[24];
  void *v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] About to initiate enriching key assets for persons with negative feedback.", buf, 2u);
  }
  v6 = objc_msgSend(v4, "count");
  v7 = self->_loggingConnection;
  if (v6)
  {
    v8 = v7;
    v9 = os_signpost_id_generate(v8);
    info = 0;
    mach_timebase_info(&info);
    v10 = v8;
    v11 = v10;
    v12 = v9 - 1;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CAC16000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "EnrichKeyAssetsUserFeedback", ", buf, 2u);
    }
    spid = v9;
    v43 = v11;

    v13 = mach_absolute_time();
    v14 = self->_loggingConnection;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v14, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] Initiate fetching highlights for assets.", buf, 2u);
    }
    objc_msgSend(v4, "fetchedObjectIDsSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K IN %@ OR ANY %K IN %@ OR ANY %K IN %@ OR ANY %K IN %@"), CFSTR("keyAssetPrivate"), v15, CFSTR("keyAssetShared"), v15, CFSTR("dayGroupKeyAssetPrivate"), v15, CFSTR("dayGroupKeyAssetShared"), v15);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:");
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setInternalPredicate:", v18);

    objc_msgSend(MEMORY[0x1E0CD1708], "fetchHighlightsWithOptions:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count"))
    {
      v39 = v12;
      v40 = v13;
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75FF8]), "initWithHighlightTailorOptions:", 24);
      v46 = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
      v21 = objc_claimAutoreleasedReturnValue();

      v38 = (void *)v21;
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75F88]), "initWithManager:enrichmentProcessors:", self->_graphManager, v21);
      v23 = self->_loggingConnection;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = v23;
        v25 = objc_msgSend(v19, "count");
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v25;
        _os_log_impl(&dword_1CAC16000, v24, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] Initiate enriching key assets for persons with negative feedback.Number of highlights with key asset with negative feedback is %d", buf, 8u);

      }
      v26 = (objc_class *)MEMORY[0x1E0C99E20];
      v27 = v19;
      v28 = objc_alloc_init(v26);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __86__PHAUserFeedbackUpdater__enrichKeyAssetsforHighlightsWithNegativeFeedbackWithAssets___block_invoke_2;
      v48 = &unk_1E851F530;
      v29 = v28;
      v49 = v29;
      objc_msgSend(v27, "enumerateObjectsUsingBlock:", buf);

      v44 = 0;
      LOBYTE(v27) = objc_msgSend(v22, "enrichDataModelForHighlightUUIDs:withError:progressBlock:", v29, &v44, &__block_literal_global_243);
      v30 = v44;

      v31 = self->_loggingConnection;
      if ((v27 & 1) != 0)
      {
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CAC16000, v31, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] Finished enriching key assets for persons with negative feedback.", buf, 2u);
        }
      }
      else if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v30;
        _os_log_error_impl(&dword_1CAC16000, v31, OS_LOG_TYPE_ERROR, "[PHAUserFeedbackUpdater] Failed to enrich key assets for highlights with persons with negative feedback: %@", buf, 0xCu);
      }

      v12 = v39;
      v13 = v40;
    }
    else
    {
      v32 = self->_loggingConnection;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CAC16000, v32, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] No highlights found with negative feedback persons.", buf, 2u);
      }
    }
    v33 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v36 = v43;
    v37 = v36;
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CAC16000, v37, OS_SIGNPOST_INTERVAL_END, spid, "EnrichKeyAssetsUserFeedback", ", buf, 2u);
    }

    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "EnrichKeyAssetsUserFeedback";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (float)((float)((float)((float)(v33 - v13) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CAC16000, v37, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

  }
  else if (os_log_type_enabled((os_log_t)self->_loggingConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CAC16000, v7, OS_LOG_TYPE_DEBUG, "[PHAUserFeedbackUpdater] No assets with persons with negative feedback, nothing to do", buf, 2u);
  }

}

- (void)_clearEnrichmentStateOfHighlightsWithNegativeFeedback:(id)a3
{
  id v4;
  NSObject *loggingConnection;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  int v21;
  PHPhotoLibrary *photoLibrary;
  BOOL v23;
  char *v24;
  NSObject *v25;
  uint64_t v26;
  uint32_t denom;
  uint32_t numer;
  NSObject *v29;
  NSObject *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  double v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] About to mark highlights with negative feedback persons for re-erichment.", buf, 2u);
  }
  v6 = objc_msgSend(v4, "count");
  v7 = self->_loggingConnection;
  if (v6)
  {
    v8 = v7;
    v9 = os_signpost_id_generate(v8);
    info = 0;
    mach_timebase_info(&info);
    v10 = v8;
    v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CAC16000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "UpdateHighlightsWithNegativeFeedbackPersons", ", buf, 2u);
    }

    v12 = mach_absolute_time();
    v13 = self->_loggingConnection;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v13, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] Initiate fetching highlights for assets.", buf, 2u);
    }
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("enrichmentState != %ld"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPredicate:", v15);

    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAssets:withType:options:", v4, 6, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    v18 = self->_loggingConnection;
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (v17)
    {
      if (v19)
      {
        v20 = v18;
        v21 = objc_msgSend(v16, "count");
        *(_DWORD *)buf = 67109120;
        LODWORD(v36) = v21;
        _os_log_impl(&dword_1CAC16000, v20, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] Initiate marking highlights with negative feedback persons to re-enrich. Highlights with assets with persons with negative feedback is %d", buf, 8u);

      }
      photoLibrary = self->_photoLibrary;
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __80__PHAUserFeedbackUpdater__clearEnrichmentStateOfHighlightsWithNegativeFeedback___block_invoke;
      v32[3] = &unk_1E8521740;
      v33 = v16;
      v31 = 0;
      v23 = -[PHPhotoLibrary performChangesAndWait:error:](photoLibrary, "performChangesAndWait:error:", v32, &v31);
      v24 = (char *)v31;
      v25 = self->_loggingConnection;
      if (v23)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CAC16000, v25, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] Finished marking highlights with negative feedback persons for re-erichment.", buf, 2u);
        }
      }
      else if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v24;
        _os_log_error_impl(&dword_1CAC16000, v25, OS_LOG_TYPE_ERROR, "[PHAUserFeedbackUpdater] Failed to update highlights with negative feedback: %@", buf, 0xCu);
      }

    }
    else if (v19)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v18, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] No highlights found with negative feedback persons.", buf, 2u);
    }
    v26 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v29 = v11;
    v30 = v29;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CAC16000, v30, OS_SIGNPOST_INTERVAL_END, v9, "UpdateHighlightsWithNegativeFeedbackPersons", ", buf, 2u);
    }

    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "UpdateHighlightsWithNegativeFeedbackPersons";
      v37 = 2048;
      v38 = (float)((float)((float)((float)(v26 - v12) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CAC16000, v30, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

  }
  else if (os_log_type_enabled((os_log_t)self->_loggingConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CAC16000, v7, OS_LOG_TYPE_DEBUG, "[PHAUserFeedbackUpdater] No assets with persons with negative feedback, nothing to do", buf, 2u);
  }

}

- (id)_personUUIDsByAssetUUIDFromAssets:(id)a3
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
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "uuid", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIncludedDetectionTypes:", &unk_1E8540BF0);
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:options:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (double)_userFeedbackScoreForAssetCollection:(id)a3 assetsFetchResult:(id)a4 keyAsset:(id)a5 personUUIDsByAssetUUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  PHUserFeedbackCalculator *userFeedbackCalculator;
  void *v28;
  double v29;
  double v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v15 = v11;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v33;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v33 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v19), "uuid", (_QWORD)v32);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v17);
  }

  objc_msgSend(v12, "uuid");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayByAddingObject:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(v13, "objectsForKeys:notFoundMarker:", v22, MEMORY[0x1E0C9AA60]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dictionaryWithObjects:forKeys:", v24, v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_blockableFeaturesForAssetCollection:", v10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  userFeedbackCalculator = self->_userFeedbackCalculator;
  objc_msgSend(v12, "uuid");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHUserFeedbackCalculator scoreForAssetUUIDs:keyAssetUUID:personsUUIDsByAssetUUIDs:memoryFeatures:](userFeedbackCalculator, "scoreForAssetUUIDs:keyAssetUUID:personsUUIDsByAssetUUIDs:memoryFeatures:", v14, v28, v25, v26);
  v30 = v29;

  return v30;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_highlighUpdationQueue, 0);
  objc_storeStrong((id *)&self->_userFeedbackCalculator, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_graphManager, 0);
}

void __80__PHAUserFeedbackUpdater__clearEnrichmentStateOfHighlightsWithNegativeFeedback___block_invoke(uint64_t a1)
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
        objc_msgSend(MEMORY[0x1E0CD1710], "changeRequestForPhotosHighlight:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5), (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setEnrichmentState:", 0);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __86__PHAUserFeedbackUpdater__enrichKeyAssetsforHighlightsWithNegativeFeedbackWithAssets___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uuid");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __104__PHAUserFeedbackUpdater__reloadWallpaperSuggestionsWithRejectedPersonsForLocalIdentifiers_forceReload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkCallsWithProgress:stop:", 0);
}

uint64_t __85__PHAUserFeedbackUpdater__deleteWallpaperTopSuggestionsOfPersonsForLocalIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CD17D8], "deleteSuggestions:", *(_QWORD *)(a1 + 32));
}

void __54__PHAUserFeedbackUpdater__neverFeatureMemories_error___block_invoke(uint64_t a1)
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
        objc_msgSend(v6, "setFeaturedState:", -1);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __81__PHAUserFeedbackUpdater__retireAndUnfeatureSuggestions_didUnfeatureSuggestions___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CD17D8], "changeRequestForSuggestion:", v7, (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "markRetired");
        if (objc_msgSend(v7, "featuredState") == 1)
        {
          objc_msgSend(v8, "setFeaturedState:", 0);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

void __68__PHAUserFeedbackUpdater_updateFeatureContentWithPersonUUIDs_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_fetchAssetsWithNegativeFeedbackFrom:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_clearEnrichmentStateOfHighlightsWithNegativeFeedback:", v2);
  objc_msgSend(*(id *)(a1 + 32), "_enrichKeyAssetsforHighlightsWithNegativeFeedbackWithAssets:", v2);

}

+ (id)_userFeedbackCalculatorWithPhotoLibrary:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CD17F8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithPhotoLibrary:", v4);

  return v5;
}

+ (id)_blockableFeaturesForAssetCollection:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "blockableFeatures");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

+ (id)_memoriesFetchResultWithObjectIDs:(id)a3 existingMemoriesFetchResult:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0CD1580];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithExistingFetchResult:filteredObjectIDs:", v6, v7);

  return v8;
}

@end
