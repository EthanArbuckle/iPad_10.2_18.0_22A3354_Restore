@implementation PHASuggestionGenerationTask

- (PHASuggestionGenerationTask)init
{
  PHASuggestionGenerationTask *v2;
  PHASuggestionGenerationTask *v3;
  os_log_t v4;
  OS_os_log *loggingConnection;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHASuggestionGenerationTask;
  v2 = -[PHASuggestionGenerationTask init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_fastPass = 0;
    v4 = os_log_create("com.apple.PhotosGraph", "SuggestionGenerationTask");
    loggingConnection = v3->_loggingConnection;
    v3->_loggingConnection = (OS_os_log *)v4;

    v3->_featureCode = 100;
  }
  return v3;
}

- (id)initForFastPass
{
  id result;

  result = -[PHASuggestionGenerationTask init](self, "init");
  if (result)
    *((_BYTE *)result + 16) = 1;
  return result;
}

- (NSString)name
{
  return (NSString *)CFSTR("PHASuggestionGenerationTask");
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
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)priority
{
  return 1;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  char v4;
  NSObject *loggingConnection;
  uint8_t v7[16];

  v4 = PLIsFeaturedContentAllowed();
  if ((v4 & 1) == 0)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHASuggestionGenerationTask] featured content is disabled in settings", v7, 2u);
    }
  }
  return v4;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  void *v5;
  BOOL v6;

  -[PHASuggestionGenerationTask generateSuggestionsWithGraphManager:progressReporter:error:](self, "generateSuggestionsWithGraphManager:progressReporter:error:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHASuggestionGenerationTask timeoutFatal:]", "PHASuggestionGenerationTask.m", 108, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHASuggestionGenerationTask is stuck", v3, 2u);
  }
}

- (id)generateSuggestionsWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  PHASuggestionController *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  NSDictionary *suggestionOptionsDictionary;
  void *v19;
  char v20;
  void *v21;
  OS_os_log *v22;
  int v23;
  void *v24;
  void *v25;
  unsigned __int16 v26;
  void *v27;
  int v28;
  void *v29;
  OS_os_log *v30;
  int v31;
  void *v32;
  int v33;
  unint64_t v34;
  uint64_t v35;
  void *v36;
  OS_os_log *v37;
  int v38;
  void *v39;
  OS_os_log *loggingConnection;
  BOOL v41;
  id v42;
  NSObject *v43;
  char v44;
  uint64_t *v46;
  id *v47;
  void *v48;
  id v49;
  id v50;
  unsigned int v51;
  id v52;
  void *v54;
  void *v55;
  id v56;
  _QWORD v57[4];
  id v58;
  uint64_t *v59;
  _QWORD v60[4];
  id v61;
  uint64_t *v62;
  _QWORD v63[4];
  id v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  id v73;
  uint8_t buf[4];
  _BYTE v75[14];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v66 = 0;
  v67 = &v66;
  v68 = 0x2020000000;
  v69 = 0;
  objc_msgSend(v7, "photoLibrary");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = -[PHASuggestionController initWithGraphManager:]([PHASuggestionController alloc], "initWithGraphManager:", v7);
  if (self->_suggestionOptionsDictionary)
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D76250]), "initWithOptionsDictionary:", self->_suggestionOptionsDictionary);
  else
    v10 = objc_alloc_init(MEMORY[0x1E0D76250]);
  v11 = v10;
  objc_msgSend(v10, "setDefaultStartAndEndDatesIfNeeded");
  -[NSDictionary objectForKeyedSubscript:](self->_suggestionOptionsDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0D722A8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHASuggestionController ingestExistingSuggestionsWithOptions:](v9, "ingestExistingSuggestionsWithOptions:", v11);
  objc_msgSend(v55, "librarySpecificFetchOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIncludePendingMemories:", 1);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fetchedObjects");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHASuggestionController setExistingMemories:](v9, "setExistingMemories:", v54);
  -[PHASuggestionController cacheWidgetSuggestionsWithCurrentlyFeaturedState](v9, "cacheWidgetSuggestionsWithCurrentlyFeaturedState");
  if (*((_BYTE *)v67 + 24))
  {
    *((_BYTE *)v67 + 24) = 1;
    goto LABEL_7;
  }
  v15 = objc_msgSend(v8, "isCancelledWithProgress:", 0.0);
  *((_BYTE *)v67 + 24) = v15;
  if ((v15 & 1) != 0)
  {
LABEL_7:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v75 = 135;
      *(_WORD *)&v75[4] = 2080;
      *(_QWORD *)&v75[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Fra"
                           "mework/Storytelling/Tasks/SuggestionTasks/PHASuggestionGenerationTask.m";
      _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    if (a5 && !*a5)
    {
      objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
      v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
      v17 = 0;
      *a5 = v16;
      goto LABEL_78;
    }
    goto LABEL_77;
  }
  suggestionOptionsDictionary = self->_suggestionOptionsDictionary;
  if (suggestionOptionsDictionary
    && (-[NSDictionary objectForKeyedSubscript:](suggestionOptionsDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0D72288]), v19 = (void *)objc_claimAutoreleasedReturnValue(), v20 = objc_msgSend(v19, "BOOLValue"), v19, (v20 & 1) == 0))
  {
    -[NSDictionary objectForKeyedSubscript:](self->_suggestionOptionsDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0D722D0]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "integerValue");

    -[NSDictionary objectForKeyedSubscript:](self->_suggestionOptionsDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0D722C0]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(v25) = objc_msgSend(v27, "integerValue");

    v51 = 0;
    v28 = -[PHASuggestionGenerationTask suggestionProfileFromSuggestionType:subtype:](self, "suggestionProfileFromSuggestionType:subtype:", v26, (unsigned __int16)v25);
    if (v28)
      goto LABEL_30;
  }
  else
  {
    v51 = 1;
  }
  if (!v12)
    objc_msgSend(v11, "setMaximumNumberOfSuggestions:", 1);
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __90__PHASuggestionGenerationTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke;
  v63[3] = &unk_1E8521AC0;
  v65 = &v66;
  v64 = v8;
  -[PHASuggestionController generateSingleAssetSuggestionsWithOptions:progress:](v9, "generateSingleAssetSuggestionsWithOptions:progress:", v11, v63);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = self->_loggingConnection;
  if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_INFO))
  {
    v49 = v8;
    v23 = objc_msgSend(v21, "count");
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR(", "));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v75 = v23;
    *(_WORD *)&v75[4] = 2112;
    *(_QWORD *)&v75[6] = v24;
    _os_log_impl(&dword_1CAC16000, (os_log_t)v22, OS_LOG_TYPE_INFO, "[PHASuggestionGenerationTask] Generated %d Single Asset suggestions with local identifiers %@", buf, 0x12u);

    v8 = v49;
  }

  if (*((_BYTE *)v67 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v75 = 154;
      *(_WORD *)&v75[4] = 2080;
      *(_QWORD *)&v75[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Fra"
                           "mework/Storytelling/Tasks/SuggestionTasks/PHASuggestionGenerationTask.m";
      _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    if (a5 && !*a5)
    {
      objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_77;
  }
  objc_msgSend(v52, "addObjectsFromArray:", v21);

  v28 = 0;
LABEL_30:
  if ((v51 & 1) != 0 || v28 == 4)
  {
    if (!v12)
      objc_msgSend(v11, "setMaximumNumberOfSuggestions:", 3);
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __90__PHASuggestionGenerationTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke_144;
    v60[3] = &unk_1E8521AC0;
    v62 = &v66;
    v61 = v8;
    -[PHASuggestionController generateOnThisDayAssetSuggestionsWithOptions:progress:](v9, "generateOnThisDayAssetSuggestionsWithOptions:progress:", v11, v60);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = self->_loggingConnection;
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_INFO))
    {
      v50 = v8;
      v48 = v29;
      v31 = objc_msgSend(v29, "count");
      objc_msgSend(v48, "componentsJoinedByString:", CFSTR(", "));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v75 = v31;
      *(_WORD *)&v75[4] = 2112;
      *(_QWORD *)&v75[6] = v32;
      _os_log_impl(&dword_1CAC16000, (os_log_t)v30, OS_LOG_TYPE_INFO, "[PHASuggestionGenerationTask] Generated %d On This Day suggestions with local identifiers %@", buf, 0x12u);

      v29 = v48;
      v8 = v50;
    }

    if (*((_BYTE *)v67 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v75 = 167;
        *(_WORD *)&v75[4] = 2080;
        *(_QWORD *)&v75[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/F"
                             "ramework/Storytelling/Tasks/SuggestionTasks/PHASuggestionGenerationTask.m";
        _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      if (a5 && !*a5)
      {
        objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_77;
    }
    objc_msgSend(v52, "addObjectsFromArray:", v29);

  }
  if (v28 == 3)
    v33 = 1;
  else
    v33 = v51;
  if (v33 == 1)
  {
    if (!v12)
    {
      v34 = -[PHASuggestionController newFeaturedSuggestionsCount](v9, "newFeaturedSuggestionsCount");
      if (v34 >= 0xA)
        v35 = 1;
      else
        v35 = 10 - v34;
      objc_msgSend(v11, "setMaximumNumberOfSuggestions:", v35);
    }
    objc_msgSend(v11, "setClearFeaturedSuggestions:", v51);
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __90__PHASuggestionGenerationTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke_145;
    v57[3] = &unk_1E8521AC0;
    v59 = &v66;
    v58 = v8;
    -[PHASuggestionController generateWidgetSuggestionsWithOptions:progress:](v9, "generateWidgetSuggestionsWithOptions:progress:", v11, v57);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = self->_loggingConnection;
    if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_INFO))
    {
      v38 = objc_msgSend(v36, "count");
      objc_msgSend(v36, "componentsJoinedByString:", CFSTR(", "));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v75 = v38;
      *(_WORD *)&v75[4] = 2112;
      *(_QWORD *)&v75[6] = v39;
      _os_log_impl(&dword_1CAC16000, (os_log_t)v37, OS_LOG_TYPE_INFO, "[PHASuggestionGenerationTask] Generated %d Widget suggestions with local identifiers %@", buf, 0x12u);

    }
    if (*((_BYTE *)v67 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v75 = 186;
        *(_WORD *)&v75[4] = 2080;
        *(_QWORD *)&v75[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/F"
                             "ramework/Storytelling/Tasks/SuggestionTasks/PHASuggestionGenerationTask.m";
        _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      if (a5 && !*a5)
      {
        objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_77;
    }
    objc_msgSend(v52, "addObjectsFromArray:", v36);

  }
  if (objc_msgSend(v52, "count"))
  {
    if (!self->_fastPass)
      self->_featureComplete = 1;
    loggingConnection = self->_loggingConnection;
    v56 = 0;
    v41 = +[PHAMemoryElectionTask reloadForYouWidgetTimelineWithLoggingConnection:error:](PHAMemoryElectionTask, "reloadForYouWidgetTimelineWithLoggingConnection:error:", loggingConnection, &v56);
    v42 = v56;
    if (!v41)
    {
      v43 = self->_loggingConnection;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v75 = v42;
        _os_log_error_impl(&dword_1CAC16000, v43, OS_LOG_TYPE_ERROR, "[PHASuggestionGenerationTask] Error calling reloadWidgetTimelineWithPhotoLibrary (%@)", buf, 0xCu);
      }
    }

  }
  if (*((_BYTE *)v67 + 24))
  {
    *((_BYTE *)v67 + 24) = 1;
    goto LABEL_73;
  }
  v44 = objc_msgSend(v8, "isCancelledWithProgress:", 1.0);
  *((_BYTE *)v67 + 24) = v44;
  if ((v44 & 1) != 0)
  {
LABEL_73:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v75 = 203;
      *(_WORD *)&v75[4] = 2080;
      *(_QWORD *)&v75[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Fra"
                           "mework/Storytelling/Tasks/SuggestionTasks/PHASuggestionGenerationTask.m";
      _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    if (a5 && !*a5)
    {
      objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_77:
    v17 = 0;
    goto LABEL_78;
  }
  if ((objc_msgSend(v11, "discardGeneratedSuggestions") & 1) != 0)
  {
    v70 = *MEMORY[0x1E0D722D8];
    v71 = v52;
    v46 = &v70;
    v47 = &v71;
  }
  else
  {
    v72 = *MEMORY[0x1E0D722E0];
    v73 = v52;
    v46 = &v72;
    v47 = &v73;
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_78:

  _Block_object_dispose(&v66, 8);
  return v17;
}

- (BOOL)generateWallpaperSuggestions
{
  return 1;
}

- (unsigned)suggestionProfileFromSuggestionType:(unsigned __int16)a3 subtype:(unsigned __int16)a4
{
  if (a4 == 502)
    return 3;
  if (a3 > 0xAu)
    return 0;
  return byte_1CADD0728[a3];
}

- (NSDictionary)suggestionOptionsDictionary
{
  return self->_suggestionOptionsDictionary;
}

- (void)setSuggestionOptionsDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)featureComplete
{
  return self->_featureComplete;
}

- (unint64_t)featureCode
{
  return self->_featureCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionOptionsDictionary, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

uint64_t __90__PHASuggestionGenerationTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, _BYTE *a2)
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

uint64_t __90__PHASuggestionGenerationTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke_144(uint64_t a1, _BYTE *a2)
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

uint64_t __90__PHASuggestionGenerationTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke_145(uint64_t a1, _BYTE *a2)
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
