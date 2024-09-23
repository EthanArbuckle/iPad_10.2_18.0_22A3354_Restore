@implementation PHAWallpaperSuggestionGenerationWeeklyTask

- (PHAWallpaperSuggestionGenerationWeeklyTask)initWithGenerationOptions:(unint64_t)a3
{
  PHAWallpaperSuggestionGenerationWeeklyTask *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHAWallpaperSuggestionGenerationWeeklyTask;
  result = -[PHAWallpaperSuggestionGenerationWeeklyTask init](&v5, sel_init);
  if (result)
  {
    result->_generationOptions = a3;
    result->_generatedContent = 0;
  }
  return result;
}

- (NSString)name
{
  id v3;
  unint64_t generationOptions;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  generationOptions = self->_generationOptions;
  if ((generationOptions & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "generationOptionNameFromSingleOption:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

    generationOptions = self->_generationOptions;
    if ((generationOptions & 2) == 0)
    {
LABEL_3:
      if ((generationOptions & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((generationOptions & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend((id)objc_opt_class(), "generationOptionNameFromSingleOption:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  generationOptions = self->_generationOptions;
  if ((generationOptions & 4) == 0)
  {
LABEL_4:
    if ((generationOptions & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend((id)objc_opt_class(), "generationOptionNameFromSingleOption:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  generationOptions = self->_generationOptions;
  if ((generationOptions & 8) == 0)
  {
LABEL_5:
    if ((generationOptions & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_12:
  objc_msgSend((id)objc_opt_class(), "generationOptionNameFromSingleOption:", 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  if ((self->_generationOptions & 0x10) != 0)
  {
LABEL_6:
    objc_msgSend((id)objc_opt_class(), "generationOptionNameFromSingleOption:", 16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
LABEL_7:
  if (objc_msgSend(v3, "count"))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("|"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("PHAWallpaperWeeklyTask[%@]"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("PHAWallpaperWeeklyTask");
  }

  return (NSString *)v8;
}

- (double)period
{
  void *v3;
  unsigned __int8 v4;
  unint64_t generationOptions;
  void *v6;
  int v7;
  double result;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("PHAWallpaperSuggestionGenerationWeeklyTaskLibraryIsProcessedEnough"));

  generationOptions = self->_generationOptions;
  if ((generationOptions & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("PHAWallpaperSuggestionGenerationWeeklyTaskLibraryIsProcessedEnoughForAmbient"));

    if (!v7)
      return 21600.0;
  }
  result = 604800.0;
  if ((v4 & ((generationOptions & 4) == 0)) == 0)
    return -2.0;
  return result;
}

- (unint64_t)version
{
  return 2;
}

- (BOOL)currentPlatformIsSupported
{
  if (self->_generationOptions == 4)
    return objc_msgSend(MEMORY[0x1E0D71280], "currentDeviceSupportsSettlingEffect");
  else
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
  id v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSystemPhotoLibrary");

  if ((v6 & 1) != 0)
  {
    if ((self->_generationOptions & 0x12) != 0)
      v7 = objc_msgSend(v4, "isReady");
    else
      v7 = 1;
  }
  else
  {
    objc_msgSend(v4, "workingContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[PHAWallpaperSuggestionGenerationWeeklyTask name](self, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_1CAC16000, v9, OS_LOG_TYPE_DEFAULT, "%@ is running on a non system photo library", (uint8_t *)&v12, 0xCu);

    }
    v7 = 0;
  }

  return v7;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  void *v5;
  BOOL v6;

  -[PHAWallpaperSuggestionGenerationWeeklyTask generateSuggestionsWithGraphManager:progressReporter:error:](self, "generateSuggestionsWithGraphManager:progressReporter:error:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHAWallpaperSuggestionGenerationWeeklyTask timeoutFatal:]", "PHAWallpaperSuggestionGenerationWeeklyTask.m", 193, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHAWallpaperSuggestionGenerationWeeklyTask is stuck", v3, 2u);
  }
}

- (id)generateSuggestionsWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  PHASuggestionController *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  PHASuggestionController *v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  id v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  NSObject *v51;
  int v52;
  int v53;
  int v54;
  void *v55;
  PHASuggestionController *v56;
  PHAWallpaperSuggestionGenerationWeeklyTask *v57;
  void *v58;
  NSObject *v59;
  id v60;
  int v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  NSObject *v69;
  id v70;
  int v71;
  void *v72;
  PHAWallpaperSuggestionGenerationWeeklyTask *v74;
  id v75;
  PHAWallpaperSuggestionRefreshSession *v76;
  _BOOL4 v77;
  id v78;
  void *v79;
  _BOOL4 v80;
  id v81;
  void *v82;
  unsigned int v83;
  void *v84;
  PHAWallpaperSuggestionAnalyticsSender *v85;
  void *v86;
  void *v87;
  char v88;
  void *v89;
  id *v90;
  uint64_t *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  NSObject *v101;
  void *v102;
  void *v103;
  PHASuggestionController *v104;
  PHASuggestionController *v105;
  PHASuggestionController *v106;
  unsigned int v107;
  int v108;
  int v109;
  PHAWallpaperSuggestionGenerationWeeklyTask *v110;
  PHAWallpaperSuggestionGenerationWeeklyTask *v111;
  PHAWallpaperSuggestionGenerationWeeklyTask *v112;
  PHAWallpaperSuggestionGenerationWeeklyTask *v113;
  int v114;
  void *v115;
  void (**v116)(void);
  void *v117;
  id v118;
  id v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  unsigned __int8 v128;
  char v129;
  _QWORD aBlock[4];
  NSObject *v131;
  id *v132;
  uint64_t v133;
  id v134;
  uint64_t v135;
  id v136;
  _BYTE v137[128];
  uint8_t v138[128];
  uint8_t buf[4];
  _BYTE v140[14];
  uint64_t v141;

  v141 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "workingContextForSuggestions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "loggingConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PHASuggestionController initWithGraphManager:]([PHASuggestionController alloc], "initWithGraphManager:", v8);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v115 = v8;
  objc_msgSend(v8, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__PHAWallpaperSuggestionGenerationWeeklyTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke;
  aBlock[3] = &unk_1E85205F0;
  v15 = v11;
  v131 = v15;
  v132 = a5;
  v116 = (void (**)(void))_Block_copy(aBlock);
  v117 = v9;
  if (objc_msgSend(v9, "isCancelledWithProgress:", 0.0))
  {
    v116[2]();
    v16 = 0;
  }
  else
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D762A0]), "initWithPhotoLibrary:", v14);
    v107 = objc_msgSend(v17, "libraryIsProcessedEnough");
    v114 = 0;
    v129 = 0;
    if ((self->_generationOptions & 1) != 0)
    {
      objc_msgSend(v9, "childProgressReporterFromStart:toEnd:", 0.11, 0.29);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = self;
      -[PHAWallpaperSuggestionGenerationWeeklyTask generateSuggestionsWithContentMode:suggestionController:progressReporter:shouldReload:](self, "generateSuggestionsWithContentMode:suggestionController:progressReporter:shouldReload:", 0, v12, v18, &v129);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = v129 != 0;
      v20 = v15;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = v12;
        v22 = v17;
        v23 = objc_msgSend(v19, "count");
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR(", "));
        v102 = v14;
        v24 = v13;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v140 = v23;
        v17 = v22;
        v12 = v21;
        *(_WORD *)&v140[4] = 2112;
        *(_QWORD *)&v140[6] = v25;
        _os_log_impl(&dword_1CAC16000, v20, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionGenerationWeeklyTask] Generated %d wallpaper shuffle suggestions with local identifiers %@", buf, 0x12u);

        v13 = v24;
        v14 = v102;
      }

      objc_msgSend(v13, "addObjectsFromArray:", v19);
      self = v110;
      if (objc_msgSend(v19, "count"))
        v110->_generatedContent |= 1uLL;

    }
    if (objc_msgSend(v117, "isCancelledWithProgress:", 0.3))
      goto LABEL_63;
    v128 = 0;
    if ((self->_generationOptions & 2) != 0)
    {
      objc_msgSend(v117, "childProgressReporterFromStart:toEnd:", 0.31, 0.59);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = self;
      -[PHAWallpaperSuggestionGenerationWeeklyTask generateSuggestionsWithContentMode:suggestionController:progressReporter:shouldReload:](self, "generateSuggestionsWithContentMode:suggestionController:progressReporter:shouldReload:", 1, v12, v26, &v128);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = (v128 | v114) != 0;
      v28 = v15;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = v10;
        v30 = v15;
        v31 = v13;
        v32 = objc_msgSend(v27, "count");
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR(", "));
        v95 = v17;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v140 = v32;
        v13 = v31;
        v15 = v30;
        v10 = v29;
        *(_WORD *)&v140[4] = 2112;
        *(_QWORD *)&v140[6] = v33;
        _os_log_impl(&dword_1CAC16000, v28, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionGenerationWeeklyTask] Generated %d wallpaper top suggestions with local identifiers %@", buf, 0x12u);

        v17 = v95;
      }

      objc_msgSend(v13, "addObjectsFromArray:", v27);
      self = v111;
      if (v27)
        v111->_generatedContent |= 2uLL;

    }
    if (objc_msgSend(v117, "isCancelledWithProgress:", 0.5))
      goto LABEL_63;
    if ((self->_generationOptions & 4) != 0)
    {
      v93 = v13;
      objc_msgSend(MEMORY[0x1E0D77EF8], "fetchSettlingEffectSuggestionsInPhotoLibrary:", v14);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "childProgressReporterFromStart:toEnd:", 0.61, 0.79);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAWallpaperSuggestionGenerationWeeklyTask generateSuggestionsWithContentMode:suggestionController:progressReporter:shouldReload:](self, "generateSuggestionsWithContentMode:suggestionController:progressReporter:shouldReload:", 2, v12);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D77EF8], "fetchSettlingEffectSuggestionsInPhotoLibrary:", v14);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v34;
      v103 = v14;
      v104 = v12;
      v96 = v17;
      v101 = v15;
      v112 = self;
      if (objc_msgSend(v34, "count"))
        v37 = 0;
      else
        v37 = objc_msgSend(v35, "count") != 0;
      v38 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v124 = 0u;
      v125 = 0u;
      v126 = 0u;
      v127 = 0u;
      v39 = v35;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v124, v138, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v125;
        do
        {
          for (i = 0; i != v41; ++i)
          {
            if (*(_QWORD *)v125 != v42)
              objc_enumerationMutation(v39);
            objc_msgSend(*(id *)(*((_QWORD *)&v124 + 1) + 8 * i), "localIdentifier");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "addObject:", v44);

          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v124, v138, 16);
        }
        while (v41);
      }

      v122 = 0u;
      v123 = 0u;
      v120 = 0u;
      v121 = 0u;
      v45 = v36;
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v120, v137, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v121;
        do
        {
          for (j = 0; j != v47; ++j)
          {
            if (*(_QWORD *)v121 != v48)
              objc_enumerationMutation(v45);
            objc_msgSend(*(id *)(*((_QWORD *)&v120 + 1) + 8 * j), "localIdentifier");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "removeObject:", v50);

          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v120, v137, 16);
        }
        while (v47);
      }

      v15 = v101;
      v51 = v101;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        v52 = objc_msgSend(v39, "count");
        v53 = objc_msgSend(v45, "count");
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v140 = v52 - v53;
        *(_WORD *)&v140[4] = 2112;
        *(_QWORD *)&v140[6] = v38;
        _os_log_impl(&dword_1CAC16000, v51, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionGenerationWeeklyTask] Updated %d wallpaper with settling effect with local identifiers %@", buf, 0x12u);
      }
      v114 |= v37;

      v13 = v93;
      objc_msgSend(v93, "addObjectsFromArray:", v94);
      self = v112;
      v14 = v103;
      v12 = v104;
      if (objc_msgSend(v38, "count"))
        v112->_generatedContent |= 4uLL;

      v17 = v96;
    }
    if (objc_msgSend(v117, "isCancelledWithProgress:", 0.6))
      goto LABEL_63;
    if ((self->_generationOptions & 8) != 0)
    {
      if (PNAmbientPhotoFrameEnabled())
      {
        objc_msgSend(v117, "childProgressReporterFromStart:toEnd:", 0.61, 0.69);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v12;
        v57 = self;
        v105 = v56;
        -[PHAWallpaperSuggestionGenerationWeeklyTask generateSuggestionsWithContentMode:suggestionController:progressReporter:shouldReload:](self, "generateSuggestionsWithContentMode:suggestionController:progressReporter:shouldReload:", 3);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v15;
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          v60 = v13;
          v61 = objc_msgSend(v58, "count");
          objc_msgSend(v58, "componentsJoinedByString:", CFSTR(", "));
          v97 = v17;
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v140 = v61;
          v13 = v60;
          *(_WORD *)&v140[4] = 2112;
          *(_QWORD *)&v140[6] = v62;
          _os_log_impl(&dword_1CAC16000, v59, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionGenerationWeeklyTask] Generated %d ambient suggestions with local identifiers %@", buf, 0x12u);

          v17 = v97;
        }

        objc_msgSend(v13, "addObjectsFromArray:", v58);
        if (objc_msgSend(v58, "count"))
        {
          v57->_generatedContent |= 8uLL;
          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "setBool:forKey:", 1, CFSTR("PHAWallpaperSuggestionGenerationWeeklyTaskLibraryIsProcessedEnoughForAmbient"));
        }
        else
        {
          v98 = v17;
          v64 = (v107 & 1) != 0 ? 1 : objc_msgSend(v17, "libraryIsEmpty");
          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "setBool:forKey:", v64, CFSTR("PHAWallpaperSuggestionGenerationWeeklyTaskLibraryIsProcessedEnoughForAmbient"));
          v17 = v98;
        }

        v54 = 1;
        self = v57;
        v12 = v105;
      }
      else
      {
        v54 = 0;
        self->_generatedContent |= 8uLL;
      }
    }
    else
    {
      v54 = 0;
    }
    if (objc_msgSend(v117, "isCancelledWithProgress:", 0.7))
      goto LABEL_63;
    if (_os_feature_enabled_impl() && (self->_generationOptions & 0x10) != 0)
    {
      v108 = v54;
      objc_msgSend(v117, "childProgressReporterFromStart:toEnd:", 0.71, 0.79);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = self;
      -[PHAWallpaperSuggestionGenerationWeeklyTask generateSuggestionsWithContentMode:suggestionController:progressReporter:shouldReload:](self, "generateSuggestionsWithContentMode:suggestionController:progressReporter:shouldReload:", 4, v12, v65, 0);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v15;
      if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
      {
        v68 = v10;
        v69 = v15;
        v70 = v13;
        v71 = objc_msgSend(v66, "count");
        objc_msgSend(v66, "componentsJoinedByString:", CFSTR(", "));
        v99 = v17;
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v140 = v71;
        v13 = v70;
        v15 = v69;
        v10 = v68;
        *(_WORD *)&v140[4] = 2112;
        *(_QWORD *)&v140[6] = v72;
        _os_log_impl(&dword_1CAC16000, v67, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionGenerationWeeklyTask] Generated %d Me suggestions with local identifiers %@", buf, 0x12u);

        v17 = v99;
      }

      objc_msgSend(v13, "addObjectsFromArray:", v66);
      self = v113;
      if (objc_msgSend(v66, "count"))
        v113->_generatedContent |= 0x10uLL;

      v54 = v108;
    }
    if (objc_msgSend(v117, "isCancelledWithProgress:", 0.8))
    {
LABEL_63:
      v116[2]();
      v16 = 0;
    }
    else
    {
      v106 = v12;
      v74 = self;
      if (v114)
      {
        v100 = v17;
        v75 = v13;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CAC16000, v15, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionGenerationWeeklyTask] No preexisting Wallpaper Suggestions, attempting to run refresh session", buf, 2u);
        }
        v76 = -[PHAWallpaperSuggestionRefreshSession initWithGraphManager:]([PHAWallpaperSuggestionRefreshSession alloc], "initWithGraphManager:", v115);
        v119 = 0;
        v77 = -[PHAWallpaperSuggestionRefreshSession prepareWithError:](v76, "prepareWithError:", &v119);
        v78 = v119;
        v109 = v54;
        if (v77)
        {
          objc_msgSend(v117, "childProgressReporterFromStart:toEnd:", 0.9, 1.0);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v118 = v78;
          v80 = -[PHAWallpaperSuggestionRefreshSession reloadWallpaperSuggestionsForUUIDs:progress:error:](v76, "reloadWallpaperSuggestionsForUUIDs:progress:error:", 0, v79, &v118);
          v81 = v118;

          -[PHAWallpaperSuggestionRefreshSession cleanup](v76, "cleanup");
          if (v80)
          {
            v17 = v100;
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1CAC16000, v15, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionGenerationWeeklyTask] Successfully ran refresh session", buf, 2u);
            }
          }
          else
          {
            v17 = v100;
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v140 = v81;
              _os_log_error_impl(&dword_1CAC16000, v15, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionGenerationWeeklyTask] Failed to run refresh session: %@", buf, 0xCu);
            }
          }

        }
        else
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v140 = v78;
            _os_log_fault_impl(&dword_1CAC16000, v15, OS_LOG_TYPE_FAULT, "[PHAWallpaperSuggestionGenerationWeeklyTask] Failed to prepare refresh session: %@", buf, 0xCu);
          }
          v81 = v78;
          v17 = v100;
        }

        v54 = v109;
      }
      else
      {
        v75 = v13;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CAC16000, v15, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionGenerationWeeklyTask] Wallpaper Suggestions preexisted this generation, assuming refresh session already ran today", buf, 2u);
        }
      }
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "setBool:forKey:", v107, CFSTR("PHAWallpaperSuggestionGenerationWeeklyTaskLibraryIsProcessedEnough"));

      if (v128)
        v83 = v107;
      else
        v83 = 0;
      if (v83 == 1)
        objc_msgSend((id)objc_opt_class(), "sendWallpaperGenerationCompletedBiomeEvent:", v15);
      -[PHAWallpaperSuggestionGenerationWeeklyTask suggestionOptionsDictionary](v74, "suggestionOptionsDictionary");
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v84)
      {
        v85 = -[PHAWallpaperSuggestionAnalyticsSender initWithGraphManager:libraryAnalysisSummary:]([PHAWallpaperSuggestionAnalyticsSender alloc], "initWithGraphManager:libraryAnalysisSummary:", v115, v17);
        -[PHAWallpaperSuggestionAnalyticsSender sendWallpaperGenerationSummaryEventWithGeneratedSuggestionLocalIdentifiers:](v85, "sendWallpaperGenerationSummaryEventWithGeneratedSuggestionLocalIdentifiers:", v75);
        if (v54)
          -[PHAWallpaperSuggestionAnalyticsSender sendAmbientGenerationSummaryEventWithGeneratedSuggestionLocalIdentifiers:](v85, "sendAmbientGenerationSummaryEventWithGeneratedSuggestionLocalIdentifiers:", v75);

      }
      if (objc_msgSend(v117, "isCancelledWithProgress:", 1.0))
      {
        v116[2]();
        v16 = 0;
        v13 = v75;
      }
      else
      {
        -[PHAWallpaperSuggestionGenerationWeeklyTask suggestionOptionsDictionary](v74, "suggestionOptionsDictionary");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "objectForKeyedSubscript:", *MEMORY[0x1E0D72270]);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = objc_msgSend(v87, "BOOLValue");

        if ((v88 & 1) != 0)
        {
          v133 = *MEMORY[0x1E0D722D8];
          v134 = v75;
          v13 = v75;
          v89 = (void *)MEMORY[0x1E0C99D80];
          v90 = &v134;
          v91 = &v133;
        }
        else
        {
          v135 = *MEMORY[0x1E0D722E0];
          v136 = v75;
          v13 = v75;
          v89 = (void *)MEMORY[0x1E0C99D80];
          v90 = &v136;
          v91 = &v135;
        }
        objc_msgSend(v89, "dictionaryWithObjects:forKeys:count:", v90, v91, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v12 = v106;
    }

  }
  return v16;
}

- (BOOL)isGraphDependentSubtype:(unsigned __int16)a3
{
  BOOL result;
  unsigned int v4;

  result = 1;
  if ((int)a3 > 679)
  {
    if ((int)a3 <= 909)
    {
      if ((a3 - 680) <= 0x17 && ((1 << (a3 + 88)) & 0xE00007) != 0)
        return 0;
      v4 = a3 - 801;
      goto LABEL_21;
    }
    if ((a3 - 910) < 8 || (a3 - 1101) <= 1)
      return 0;
  }
  else
  {
    if ((int)a3 > 300)
    {
      if ((int)a3 <= 500)
      {
        if ((a3 - 301) >= 6 && a3 != 401)
          return result;
        return 0;
      }
      if ((a3 - 601) <= 0x36 && ((1 << (a3 - 89)) & 0x60000000000019) != 0)
        return 0;
      v4 = a3 - 501;
LABEL_21:
      if (v4 >= 2)
        return result;
      return 0;
    }
    if ((a3 - 201) < 4 || (a3 - 101) < 3 || !a3)
      return 0;
  }
  return result;
}

- (id)suggestionOptionsWithContentMode:(signed __int16)a3 isGraphReady:(BOOL)a4 loggingConnection:(id)a5
{
  int v6;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  NSObject *oslog;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  int v35;
  _BYTE v36[128];
  uint64_t v37;

  v6 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  switch(v6)
  {
    case 0:
      v10 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(MEMORY[0x1E0CD17D0], "allShuffleWallpaperSuggestionSubtypes");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWithSet:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v13 = 200;
      goto LABEL_8;
    case 1:
      v14 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(MEMORY[0x1E0CD17D0], "allTopWallpaperSuggestionSubtypes");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setWithSet:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v13 = 25;
      goto LABEL_8;
    case 2:
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", &unk_1E85403D0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = 100;
      goto LABEL_10;
    case 3:
      v15 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(MEMORY[0x1E0CD17D0], "allAmbientSuggestionSubtypes");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setWithSet:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v13 = 400;
LABEL_8:
      v9 = (id)v11;
      goto LABEL_10;
    case 4:
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", &unk_1E85403E8);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = 25;
LABEL_10:

      v9 = (id)v12;
      if (!a4)
        goto LABEL_11;
      goto LABEL_25;
    default:
      v13 = 0;
      if (a4)
        goto LABEL_25;
LABEL_11:
      oslog = v8;
      v16 = v13;
      v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v18 = v9;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v29 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            if (-[PHAWallpaperSuggestionGenerationWeeklyTask isGraphDependentSubtype:](self, "isGraphDependentSubtype:", (unsigned __int16)objc_msgSend(v23, "integerValue")))
            {
              objc_msgSend(v17, "addObject:", v23);
            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        }
        while (v20);
      }

      v13 = v16;
      v8 = oslog;
      if (objc_msgSend(v17, "count"))
      {
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v33 = v17;
          v34 = 1024;
          v35 = v6;
          _os_log_impl(&dword_1CAC16000, oslog, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionGenerationWeeklyTask] Graph is not ready; removing suggestions for %@ for content mode %hd",
            buf,
            0x12u);
        }
        objc_msgSend(v18, "minusSet:", v17);
      }

LABEL_25:
      -[PHAWallpaperSuggestionGenerationWeeklyTask baseSuggestionOptionsWithSubtypes:](self, "baseSuggestionOptionsWithSubtypes:", v9);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](self->_suggestionOptionsDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0D722A8]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
        objc_msgSend(v24, "setMaximumNumberOfSuggestions:", v13);

      return v24;
  }
}

- (unsigned)suggestionProfileForContentMode:(signed __int16)a3
{
  if (a3 == 3)
    return 6;
  else
    return 2;
}

- (id)subtypePredicateWithContentMode:(signed __int16)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;

  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CD17D0], "predicateForAllShuffleWallpaperSuggestions");
      self = (PHAWallpaperSuggestionGenerationWeeklyTask *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(MEMORY[0x1E0CD17D0], "predicateForAllTopWallpaperSuggestions");
      self = (PHAWallpaperSuggestionGenerationWeeklyTask *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      v6 = (void *)MEMORY[0x1E0CB3880];
      v7 = 680;
      goto LABEL_8;
    case 3:
      objc_msgSend(MEMORY[0x1E0CD17D0], "predicateForAllAmbientSuggestions");
      self = (PHAWallpaperSuggestionGenerationWeeklyTask *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      v6 = (void *)MEMORY[0x1E0CB3880];
      v7 = 901;
LABEL_8:
      objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("subtype"), v7, v3, v4);
      self = (PHAWallpaperSuggestionGenerationWeeklyTask *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return self;
  }
  return self;
}

- (id)baseSuggestionOptionsWithSubtypes:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v10++), "unsignedIntValue"));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  if (self->_suggestionOptionsDictionary)
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D76250]), "initWithOptionsDictionary:", self->_suggestionOptionsDictionary);
  else
    v11 = objc_alloc_init(MEMORY[0x1E0D76250]);
  v12 = v11;
  objc_msgSend(v11, "setDefaultStartAndEndDatesIfNeeded");
  objc_msgSend(v12, "setIgnoreCollisionsWithExistingSuggestions:", 1);
  objc_msgSend(v12, "suggestionSubtypeWhitelist");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v12, "suggestionSubtypeWhitelist");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __80__PHAWallpaperSuggestionGenerationWeeklyTask_baseSuggestionOptionsWithSubtypes___block_invoke;
    v18[3] = &unk_1E851F690;
    v19 = v5;
    objc_msgSend(v15, "indexesPassingTest:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSuggestionSubtypeWhitelist:", v16);

  }
  else
  {
    objc_msgSend(v12, "setSuggestionSubtypeWhitelist:", v5);
  }

  return v12;
}

- (id)generateSuggestionsWithContentMode:(signed __int16)a3 suggestionController:(id)a4 progressReporter:(id)a5 shouldReload:(BOOL *)a6
{
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  BOOL v23;
  _QWORD v24[4];
  id v25;
  _QWORD *v26;
  _QWORD v27[3];
  char v28;

  v8 = a3;
  v10 = a4;
  v11 = a5;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v28 = 0;
  objc_msgSend(v10, "graphManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAWallpaperSuggestionGenerationWeeklyTask subtypePredicateWithContentMode:](self, "subtypePredicateWithContentMode:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[PHAWallpaperSuggestionGenerationWeeklyTask suggestionsExistInPhotoLibrary:subtypePredicate:](self, "suggestionsExistInPhotoLibrary:subtypePredicate:", v14, v13);

  v15 = objc_msgSend(v12, "isReady");
  objc_msgSend(v12, "workingContextForSuggestions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "loggingConnection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHAWallpaperSuggestionGenerationWeeklyTask suggestionOptionsWithContentMode:isGraphReady:loggingConnection:](self, "suggestionOptionsWithContentMode:isGraphReady:loggingConnection:", v8, v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PHAWallpaperSuggestionGenerationWeeklyTask suggestionProfileForContentMode:](self, "suggestionProfileForContentMode:", v8);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __132__PHAWallpaperSuggestionGenerationWeeklyTask_generateSuggestionsWithContentMode_suggestionController_progressReporter_shouldReload___block_invoke;
  v24[3] = &unk_1E8521AC0;
  v26 = v27;
  v20 = v11;
  v25 = v20;
  objc_msgSend(v10, "generateSuggestionsWithProfile:options:progress:", v19, v18, v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6)
    *a6 = !v23;

  _Block_object_dispose(v27, 8);
  return v21;
}

- (BOOL)suggestionsExistInPhotoLibrary:(id)a3 subtypePredicate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v5 = a4;
  objc_msgSend(a3, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v5);

  objc_msgSend(v6, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") != 0;

  return v8;
}

- (BOOL)featureAvailable
{
  return (self->_generationOptions & ~self->_generatedContent) == 0;
}

- (unint64_t)featureCode
{
  unint64_t generatedContent;

  generatedContent = self->_generatedContent;
  if ((generatedContent & 1) != 0)
    return 103;
  else
    return ((uint64_t)(generatedContent << 61) >> 63) & 0x68;
}

- (NSDictionary)suggestionOptionsDictionary
{
  return self->_suggestionOptionsDictionary;
}

- (void)setSuggestionOptionsDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionOptionsDictionary, 0);
}

uint64_t __132__PHAWallpaperSuggestionGenerationWeeklyTask_generateSuggestionsWithContentMode_suggestionController_progressReporter_shouldReload___block_invoke(uint64_t a1, _BYTE *a2)
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

uint64_t __80__PHAWallpaperSuggestionGenerationWeeklyTask_baseSuggestionOptionsWithSubtypes___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2);
}

void __105__PHAWallpaperSuggestionGenerationWeeklyTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1CAC16000, v2, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionGenerationWeeklyTask] Wallpaper suggestions generation was canceled", v3, 2u);
  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 16);
    **(_QWORD **)(a1 + 40) = (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (id)generationOptionNameFromSingleOption:(unint64_t)a3
{
  id result;

  result = CFSTR("Shuffle");
  switch(a3)
  {
    case 1uLL:
      return result;
    case 2uLL:
      result = CFSTR("Top");
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_5;
    case 4uLL:
      result = CFSTR("SettlingEffect");
      break;
    case 8uLL:
      result = CFSTR("Ambient");
      break;
    default:
      if (a3 == 16)
        result = CFSTR("Me");
      else
LABEL_5:
        result = CFSTR("None");
      break;
  }
  return result;
}

+ (void)sendWallpaperGenerationCompletedBiomeEvent:(id)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01FF0]), "initWithContentIdentifier:context:osBuild:userInfo:", CFSTR("com.apple.photoanalysisd.wallpaper-generation-completed"), v5, 0, 0);
  BiomeLibrary();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "Discoverability");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "Signals");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "source");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "sendEvent:", v6);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1CAC16000, v3, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionGenerationWeeklyTask] Sent wallpaper-generation-completed Biome event", v11, 2u);
  }

}

@end
