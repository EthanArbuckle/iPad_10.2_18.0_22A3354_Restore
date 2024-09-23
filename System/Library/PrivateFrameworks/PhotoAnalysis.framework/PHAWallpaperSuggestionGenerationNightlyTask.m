@implementation PHAWallpaperSuggestionGenerationNightlyTask

+ (BOOL)shouldRefreshGalleryWithLoggingConnection:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v10;
  int v11;
  _BOOL4 v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0;
  objc_msgSend(a1, "lastGalleryAppearanceDateWithError:", &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v16;
  +[PHAWallpaperSuggestionRefreshSession lastGalleryRefreshDate](PHAWallpaperSuggestionRefreshSession, "lastGalleryRefreshDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v5;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1CAC16000, v4, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionGenerationNightlyTask] LastGalleryAppearenceDate: %@, LastGalleryRefreshDate: %@", buf, 0x16u);
  }
  if (v6)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_error_impl(&dword_1CAC16000, v4, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionGenerationNightlyTask] Error getting LastGalleryAppearance date from Proactive: %@. Proceed with gallery refresh.", buf, 0xCu);
    }
    goto LABEL_6;
  }
  if (!v7)
  {
    v8 = 1;
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v13 = "[PHAWallpaperSuggestionGenerationNightlyTask] Should refresh wallpaper gallery. Last gallery refresh date is nil";
    v14 = v4;
    v15 = 2;
    goto LABEL_14;
  }
  objc_msgSend(v5, "laterDate:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToDate:", v5);

  v12 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (!v12)
    {
LABEL_6:
      v8 = 1;
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412546;
    v18 = v5;
    v19 = 2112;
    v20 = v7;
    v13 = "[PHAWallpaperSuggestionGenerationNightlyTask] Should refresh wallapper gallery. LastGalleryAppearenceDate: %@ "
          "is later than LastGalleryRefreshDate: %@";
    v8 = 1;
    v14 = v4;
    v15 = 22;
LABEL_14:
    _os_log_impl(&dword_1CAC16000, v14, OS_LOG_TYPE_INFO, v13, buf, v15);
    goto LABEL_7;
  }
  if (v12)
  {
    *(_DWORD *)buf = 138412546;
    v18 = v5;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1CAC16000, v4, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionGenerationNightlyTask] Skip refreshing wallapper gallery. LastGalleryAppearenceDate: %@, LastGalleryRefreshDate: %@", buf, 0x16u);
  }
  v8 = 0;
LABEL_7:

  return v8;
}

+ (id)lastGalleryAppearanceDateWithError:(id *)a3
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3835;
  v18 = __Block_byref_object_dispose__3836;
  v19 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__3835;
  v12[4] = __Block_byref_object_dispose__3836;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CF8E20], "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __82__PHAWallpaperSuggestionGenerationNightlyTask_lastGalleryAppearanceDateWithError___block_invoke;
    v8[3] = &unk_1E8520380;
    v10 = &v14;
    v11 = v12;
    v5 = v4;
    v9 = v5;
    objc_msgSend(v3, "synchronousDateOfLastGalleryAppearanceWithCompletion:", v8);
    dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  }
  v6 = (id)v15[5];

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v14, 8);

  return v6;
}

void __82__PHAWallpaperSuggestionGenerationNightlyTask_lastGalleryAppearanceDateWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (NSString)name
{
  return (NSString *)CFSTR("PHAWallpaperSuggestionGenerationNightlyTask");
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
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)priority
{
  return 1;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  return 1;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  void *v5;
  BOOL v6;

  -[PHAWallpaperSuggestionGenerationNightlyTask generateSuggestionsWithGraphManager:progressReporter:error:](self, "generateSuggestionsWithGraphManager:progressReporter:error:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHAWallpaperSuggestionGenerationNightlyTask timeoutFatal:]", "PHAWallpaperSuggestionGenerationNightlyTask.m", 81, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHAWallpaperSuggestionGenerationNightlyTask is stuck", v3, 2u);
  }
}

- (id)generateSuggestionsWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  PHAWallpaperSuggestionRefreshSession *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  PHAWallpaperSuggestionRefreshSession *v22;
  id v23;
  id v24;
  NSObject *v25;
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  NSObject *v35;
  id v36;
  id v37;
  NSObject *v38;
  dispatch_time_t v39;
  intptr_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  id v49;
  void *v50;
  id v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  _QWORD v57[4];
  id v58;
  NSObject *v59;
  id v60;
  id v61;
  NSObject *v62;
  _QWORD v63[4];
  id v64;
  NSObject *v65;
  id v66;
  id v67;
  NSObject *v68;
  _QWORD v69[4];
  id v70;
  NSObject *v71;
  id v72;
  id v73;
  NSObject *v74;
  id v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  id v81;
  uint8_t buf[4];
  _BYTE v83[14];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v83 = 89;
      *(_WORD *)&v83[4] = 2080;
      *(_QWORD *)&v83[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Fra"
                           "mework/Storytelling/Tasks/SuggestionTasks/PHAWallpaperSuggestionGenerationNightlyTask.m";
      _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v8 = (void *)MEMORY[0x1E0C9AA70];
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v6, "workingContextForSuggestions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loggingConnection");
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc_init(MEMORY[0x1E0CB3740]);
    v13 = -[PHAWallpaperSuggestionRefreshSession initWithGraphManager:]([PHAWallpaperSuggestionRefreshSession alloc], "initWithGraphManager:", v6);
    v75 = 0;
    LODWORD(v10) = -[PHAWallpaperSuggestionRefreshSession prepareWithError:](v13, "prepareWithError:", &v75);
    v14 = v75;
    v15 = v14;
    if ((_DWORD)v10)
    {
      v49 = v6;
      v51 = v14;
      v55 = v12;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v83 = v13;
        _os_log_impl(&dword_1CAC16000, v11, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionGenerationNightlyTask] Successfully created refresh session %@", buf, 0xCu);
      }
      v16 = dispatch_group_create();
      dispatch_group_enter(v16);
      v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v7, "progressReportersForParallelOperationsWithCount:", 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v16);
      objc_msgSend(v18, "firstObject");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if (v19)
        v21 = (void *)v19;
      else
        v21 = v7;
      v22 = v13;
      v23 = v21;

      v69[0] = MEMORY[0x1E0C809B0];
      v69[1] = 3221225472;
      v69[2] = __106__PHAWallpaperSuggestionGenerationNightlyTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke;
      v69[3] = &unk_1E8520358;
      v24 = v55;
      v70 = v24;
      v53 = v11;
      v25 = v11;
      v71 = v25;
      v26 = v9;
      v72 = v26;
      v27 = v17;
      v73 = v27;
      v28 = v16;
      v74 = v28;
      v50 = v23;
      -[PHAWallpaperSuggestionRefreshSession refreshPosterConfigurationsForNightlyRefresh:progressReporter:passingFilter:withCompletion:](v22, "refreshPosterConfigurationsForNightlyRefresh:progressReporter:passingFilter:withCompletion:", 1, v23, 0, v69);
      v54 = v18;
      if ((objc_msgSend((id)objc_opt_class(), "shouldRefreshGalleryWithLoggingConnection:", v25) & 1) != 0)
      {
        dispatch_group_enter(v28);
        if ((unint64_t)objc_msgSend(v18, "count") <= 1)
        {
          v29 = v7;
        }
        else
        {
          objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
          v29 = (id)objc_claimAutoreleasedReturnValue();
        }
        v31 = v29;
        v63[0] = MEMORY[0x1E0C809B0];
        v63[1] = 3221225472;
        v63[2] = __106__PHAWallpaperSuggestionGenerationNightlyTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke_146;
        v63[3] = &unk_1E8520358;
        v64 = v24;
        v65 = v25;
        v66 = v26;
        v67 = v27;
        v68 = v28;
        -[PHAWallpaperSuggestionRefreshSession refreshPosterDescriptorsWithProgressReporter:completion:](v22, "refreshPosterDescriptorsWithProgressReporter:completion:", v31, v63);

      }
      dispatch_group_enter(v28);
      if ((unint64_t)objc_msgSend(v18, "count") <= 2)
      {
        v32 = v7;
      }
      else
      {
        objc_msgSend(v18, "objectAtIndexedSubscript:", 2);
        v32 = (id)objc_claimAutoreleasedReturnValue();
      }
      v33 = v32;
      v15 = v51;
      v13 = v22;
      v6 = v49;
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __106__PHAWallpaperSuggestionGenerationNightlyTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke_149;
      v57[3] = &unk_1E8520358;
      v34 = v24;
      v58 = v34;
      v35 = v25;
      v59 = v35;
      v36 = v26;
      v60 = v36;
      v37 = v27;
      v61 = v37;
      v38 = v28;
      v62 = v38;
      -[PHAWallpaperSuggestionRefreshSession refreshAmbientDescriptorsWithProgressReporter:completion:](v13, "refreshAmbientDescriptorsWithProgressReporter:completion:", v33, v57);
      dispatch_group_leave(v38);
      v39 = dispatch_time(0, 300000000000);
      v52 = v38;
      v40 = dispatch_group_wait(v38, v39);
      if (objc_msgSend(v7, "isCancelledWithProgress:", 1.0))
      {
        objc_msgSend(v34, "lock");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CAC16000, v35, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionGenerationNightlyTask] Wallpaper suggestions refresh was canceled", buf, 2u);
        }
        if (objc_msgSend(v37, "count", v49))
        {
          v80 = *MEMORY[0x1E0CB2F70];
          v81 = v37;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v41 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:userInfo:", 16, v41);
        v43 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v34, "unlock");
        v36 = 0;
        v15 = (id)v43;
      }
      else if (v40)
      {
        objc_msgSend(v34, "lock");
        if (!v15)
        {
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1CAC16000, v35, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionGenerationNightlyTask] Timed out refreshing wallpaper suggestions", buf, 2u);
          }
          if (objc_msgSend(v37, "count", v49))
          {
            v78 = *MEMORY[0x1E0CB2F70];
            v79 = v37;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v42 = 0;
          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:userInfo:", 9, v42);
          v15 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v34, "unlock");
        v36 = 0;
      }
      else if (objc_msgSend(v37, "count"))
      {
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CAC16000, v35, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionGenerationNightlyTask] Refreshing wallpaper suggestions failed because of underlying errors", buf, 2u);
        }
        v44 = (void *)MEMORY[0x1E0CB35C8];
        v76 = *MEMORY[0x1E0CB2F70];
        v77 = v37;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1, v49);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "pl_analysisErrorWithCode:userInfo:", 26, v45);
        v46 = objc_claimAutoreleasedReturnValue();

        v36 = 0;
        v15 = (id)v46;
      }
      -[PHAWallpaperSuggestionRefreshSession cleanup](v13, "cleanup", v49);
      v11 = v53;
      v12 = v55;
      if (a5)
        *a5 = objc_retainAutorelease(v15);
      v9 = v36;

      v8 = v9;
    }
    else
    {
      v30 = v11;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        v47 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v83 = v47;
        _os_log_fault_impl(&dword_1CAC16000, v30, OS_LOG_TYPE_FAULT, "[PHAWallpaperSuggestionGenerationNightlyTask] Failed to create refresh session, %@ will not be able to run, bailing out", buf, 0xCu);
      }

      if (a5)
      {
        v15 = objc_retainAutorelease(v15);
        v8 = 0;
        *a5 = v15;
      }
      else
      {
        v8 = 0;
      }
    }

  }
  return v8;
}

- (NSDictionary)suggestionOptionsDictionary
{
  return self->_suggestionOptionsDictionary;
}

- (void)setSuggestionOptionsDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionOptionsDictionary, 0);
}

void __106__PHAWallpaperSuggestionGenerationNightlyTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "lock");
  v7 = *(NSObject **)(a1 + 40);
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_error_impl(&dword_1CAC16000, v7, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionGenerationNightlyTask] Failed to refresh poster configurations: %@", (uint8_t *)&v8, 0xCu);
      if (!v6)
        goto LABEL_8;
    }
    else if (!v6)
    {
      goto LABEL_8;
    }
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v6);
    goto LABEL_8;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1CAC16000, v7, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionGenerationNightlyTask] Successfully refreshed poster configurations", (uint8_t *)&v8, 2u);
  }
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v5, CFSTR("shuffleInfo"));
LABEL_8:
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

void __106__PHAWallpaperSuggestionGenerationNightlyTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke_146(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "lock");
  v7 = *(NSObject **)(a1 + 40);
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_error_impl(&dword_1CAC16000, v7, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionGenerationNightlyTask] Failed to refresh poster descriptors: %@", (uint8_t *)&v8, 0xCu);
      if (!v6)
        goto LABEL_8;
    }
    else if (!v6)
    {
      goto LABEL_8;
    }
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v6);
    goto LABEL_8;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1CAC16000, v7, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionGenerationNightlyTask] Successfully refreshed poster descriptors", (uint8_t *)&v8, 2u);
  }
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v5, CFSTR("galleryInfo"));
LABEL_8:
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

void __106__PHAWallpaperSuggestionGenerationNightlyTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke_149(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "lock");
  v7 = *(NSObject **)(a1 + 40);
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_error_impl(&dword_1CAC16000, v7, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionGenerationNightlyTask] Failed to refresh ambient poster descriptors: %@", (uint8_t *)&v8, 0xCu);
      if (!v6)
        goto LABEL_8;
    }
    else if (!v6)
    {
      goto LABEL_8;
    }
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v6);
    goto LABEL_8;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1CAC16000, v7, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionGenerationNightlyTask] Successfully refreshed ambient poster descriptors", (uint8_t *)&v8, 2u);
  }
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v5, CFSTR("ambientInfo"));
LABEL_8:
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

@end
