@implementation PHARemoveFeaturedContentTask

- (PHARemoveFeaturedContentTask)init
{
  PHARemoveFeaturedContentTask *v2;
  os_log_t v3;
  OS_os_log *loggingConnection;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHARemoveFeaturedContentTask;
  v2 = -[PHARemoveFeaturedContentTask init](&v6, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.PhotosGraph", "suggestions");
    loggingConnection = v2->_loggingConnection;
    v2->_loggingConnection = (OS_os_log *)v3;

  }
  return v2;
}

- (NSString)name
{
  return (NSString *)CFSTR("PHARemoveFeaturedContentTask");
}

- (double)period
{
  return -2.0;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (id)incrementalKey
{
  return 0;
}

- (id)taskClassDependencies
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (int)priority
{
  return 1;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  void *v4;

  objc_msgSend(a3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PHARemoveFeaturedContentTask shouldRunWithPhotoLibrary:](self, "shouldRunWithPhotoLibrary:", v4);

  return (char)self;
}

- (BOOL)shouldRunWithPhotoLibrary:(id)a3
{
  char v4;
  NSObject *loggingConnection;
  uint8_t v7[16];

  v4 = PLIsFeaturedContentAllowed();
  if ((v4 & 1) == 0)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_INFO, "[PHARemoveFeaturedContentTask] should run, featured content is disabled", v7, 2u);
    }
  }
  return v4 ^ 1;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "workingContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "analytics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = -[PHARemoveFeaturedContentTask runWithPhotoLibrary:analytics:progressReporter:error:](self, "runWithPhotoLibrary:analytics:progressReporter:error:", v11, v12, v8, a5);
  return (char)a5;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHARemoveFeaturedContentTask timeoutFatal:]", "PHARemoveFeaturedContentTask.m", 77, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHARemoveFeaturedContentTask is stuck", v3, 2u);
  }
}

- (BOOL)runWithPhotoLibrary:(id)a3 analytics:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  return -[PHARemoveFeaturedContentTask clearAllFeaturedStateForMemoriesAndSuggestionsWithPhotoLibrary:error:](self, "clearAllFeaturedStateForMemoriesAndSuggestionsWithPhotoLibrary:error:", a3, a6, a5);
}

- (BOOL)clearAllFeaturedStateForMemoriesAndSuggestionsWithPhotoLibrary:(id)a3 error:(id *)a4
{
  id v5;
  OS_os_log *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  id v24;
  NSObject *loggingConnection;
  uint64_t v26;
  uint32_t denom;
  uint32_t numer;
  NSObject *v29;
  NSObject *v30;
  id v32;
  os_signpost_id_t spid;
  PHARemoveFeaturedContentTask *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  unint64_t v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  mach_timebase_info info;
  uint8_t buf[4];
  _BYTE v46[10];
  double v47[2];
  _QWORD v48[4];

  v48[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v35 = self;
  v6 = self->_loggingConnection;
  v7 = os_signpost_id_generate((os_log_t)v6);
  info = 0;
  mach_timebase_info(&info);
  v8 = v6;
  v9 = v8;
  v39 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ClearAllFeaturedStateForMemoriesAndSuggestions", ", buf, 2u);
  }
  spid = v7;

  v36 = mach_absolute_time();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWantsIncrementalChangeDetails:", 0);
  LOBYTE(v11) = 1;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("featuredState == %d"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v12);

  objc_msgSend(v10, "setIncludePendingMemories:", 1);
  objc_msgSend(v10, "setIncludeGuestAssets:", 1);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(v14, "setIncludeGuestAssets:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("featuredState == %d"), 1);
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD17D0], "predicateForAllFeaturedStateEnabledSuggestionTypesForWidget");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CB3528];
  v37 = (void *)v16;
  v38 = (void *)v15;
  v48[0] = v16;
  v48[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "andPredicateWithSubpredicates:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPredicate:", v19);

  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchAllFeaturedStateEnabledSuggestionsWithOptions:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v13, "count");
  v22 = objc_msgSend(v20, "count");
  if (v21 | v22)
  {
    v23 = v22;
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __101__PHARemoveFeaturedContentTask_clearAllFeaturedStateForMemoriesAndSuggestionsWithPhotoLibrary_error___block_invoke;
    v41[3] = &unk_1E85211E0;
    v42 = v13;
    v43 = v20;
    v40 = 0;
    v32 = v5;
    v11 = objc_msgSend(v5, "performChangesAndWait:error:", v41, &v40);
    v24 = v40;
    loggingConnection = v35->_loggingConnection;
    if (v11)
    {
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v46 = v21;
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)&v46[6] = v23;
        _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHARemoveFeaturedContentTask] Unfeatured %d memories and %d suggestions", buf, 0xEu);
      }
    }
    else
    {
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v46 = v21;
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)&v46[6] = v23;
        LOWORD(v47[0]) = 2112;
        *(_QWORD *)((char *)v47 + 2) = v24;
        _os_log_error_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_ERROR, "[PHARemoveFeaturedContentTask] Update featured %d memories and %d suggestions - failed: %@", buf, 0x18u);
      }
      if (a4)
        *a4 = objc_retainAutorelease(v24);
    }

    v5 = v32;
  }
  v26 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v29 = v9;
  v30 = v29;
  if (v39 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v30, OS_SIGNPOST_INTERVAL_END, spid, "ClearAllFeaturedStateForMemoriesAndSuggestions", ", buf, 2u);
  }

  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)v46 = "ClearAllFeaturedStateForMemoriesAndSuggestions";
    *(_WORD *)&v46[8] = 2048;
    v47[0] = (float)((float)((float)((float)(v26 - v36) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CAC16000, v30, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

void __101__PHARemoveFeaturedContentTask_clearAllFeaturedStateForMemoriesAndSuggestionsWithPhotoLibrary_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(MEMORY[0x1E0CD1640], "changeRequestForMemory:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setFeaturedState:", 0);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v4);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = *(id *)(a1 + 40);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(MEMORY[0x1E0CD17D8], "changeRequestForSuggestion:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12), (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setFeaturedState:", 0);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v10);
  }

}

@end
