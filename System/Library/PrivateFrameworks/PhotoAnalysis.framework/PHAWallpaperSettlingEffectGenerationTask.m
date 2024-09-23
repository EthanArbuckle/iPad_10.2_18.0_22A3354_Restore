@implementation PHAWallpaperSettlingEffectGenerationTask

- (NSString)name
{
  return (NSString *)CFSTR("PHAWallpaperSettlingEffectGenerationTask");
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

  -[PHAWallpaperSettlingEffectGenerationTask generateSuggestionsWithGraphManager:progressReporter:error:](self, "generateSuggestionsWithGraphManager:progressReporter:error:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHAWallpaperSettlingEffectGenerationTask timeoutFatal:]", "PHAWallpaperSettlingEffectGenerationTask.m", 68, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHAWallpaperSettlingEffectGenerationTask is stuck", v3, 2u);
  }
}

- (id)generateSuggestionsWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  PHASuggestionController *v18;
  id v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  char *v23;
  char v24;
  int v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  void *v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  objc_msgSend(v7, "workingContextForSuggestions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "loggingConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*((_BYTE *)v30 + 24))
  {
    v11 = objc_msgSend(v8, "isCancelledWithProgress:", 0.0);
    *((_BYTE *)v30 + 24) = v11;
    if ((v11 & 1) != 0)
      goto LABEL_4;
    if (self->_suggestionOptionsDictionary)
      v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D76250]), "initWithOptionsDictionary:", self->_suggestionOptionsDictionary);
    else
      v14 = objc_alloc_init(MEMORY[0x1E0D76250]);
    v15 = v14;
    objc_msgSend(v14, "setDefaultStartAndEndDatesIfNeeded");
    objc_msgSend(v15, "setIgnoreCollisionsWithExistingSuggestions:", 1);
    -[NSDictionary objectForKeyedSubscript:](self->_suggestionOptionsDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0D722A8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16 == 0;

    if (v17)
      objc_msgSend(v15, "setMaximumNumberOfSuggestions:", 200);
    v18 = -[PHASuggestionController initWithGraphManager:]([PHASuggestionController alloc], "initWithGraphManager:", v7);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __103__PHAWallpaperSettlingEffectGenerationTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke;
    v26[3] = &unk_1E8521AC0;
    v28 = &v29;
    v19 = v8;
    v27 = v19;
    -[PHASuggestionController generateWallpaperSuggestionsWithOptions:progress:](v18, "generateWallpaperSuggestionsWithOptions:progress:", v15, v26);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v30 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v36 = 93;
        v37 = 2080;
        v38 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storyt"
              "elling/Tasks/SuggestionTasks/PHAWallpaperSettlingEffectGenerationTask.m";
        v21 = MEMORY[0x1E0C81028];
LABEL_23:
        _os_log_impl(&dword_1CAC16000, v21, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      v22 = v10;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v25 = objc_msgSend(v20, "count");
        objc_msgSend(v20, "componentsJoinedByString:", CFSTR(", "));
        v23 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109378;
        v36 = v25;
        v37 = 2112;
        v38 = v23;
        _os_log_impl(&dword_1CAC16000, v22, OS_LOG_TYPE_INFO, "[PHAWallpaperSettlingEffectGenerationTask] Generated %d wallpaper suggestions with local identifiers %@", buf, 0x12u);

      }
      if (*((_BYTE *)v30 + 24))
      {
        *((_BYTE *)v30 + 24) = 1;
      }
      else
      {
        v24 = objc_msgSend(v19, "isCancelledWithProgress:", 1.0);
        *((_BYTE *)v30 + 24) = v24;
        if ((v24 & 1) == 0)
        {
          v33 = *MEMORY[0x1E0D722E0];
          v34 = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v36 = 97;
        v37 = 2080;
        v38 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storyt"
              "elling/Tasks/SuggestionTasks/PHAWallpaperSettlingEffectGenerationTask.m";
        v21 = MEMORY[0x1E0C81028];
        goto LABEL_23;
      }
    }
    v12 = (void *)MEMORY[0x1E0C9AA70];
LABEL_25:

    goto LABEL_7;
  }
  *((_BYTE *)v30 + 24) = 1;
LABEL_4:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v36 = 80;
    v37 = 2080;
    v38 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storytelli"
          "ng/Tasks/SuggestionTasks/PHAWallpaperSettlingEffectGenerationTask.m";
    _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v12 = (void *)MEMORY[0x1E0C9AA70];
LABEL_7:

  _Block_object_dispose(&v29, 8);
  return v12;
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

uint64_t __103__PHAWallpaperSettlingEffectGenerationTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, _BYTE *a2)
{
  uint64_t v4;
  uint64_t result;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v4 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v4 + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a2 = 1;
  return result;
}

@end
