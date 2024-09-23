@implementation PHASharedLibrarySuggestionGenerationTask

- (PHASharedLibrarySuggestionGenerationTask)initWithTaskType:(signed __int16)a3
{
  PHASharedLibrarySuggestionGenerationTask *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHASharedLibrarySuggestionGenerationTask;
  result = -[PHASharedLibrarySuggestionGenerationTask init](&v5, sel_init);
  if (result)
    result->_taskType = a3;
  return result;
}

- (NSString)name
{
  const __CFString *v2;

  v2 = CFSTR("SharedLibrarySuggestionsUnknown");
  if (self->_taskType == 1)
    v2 = CFSTR("PHASharedLibrarySuggestionGenerationWeeklyTask");
  if (self->_taskType)
    return &v2->isa;
  else
    return (NSString *)CFSTR("PHASharedLibrarySuggestionGenerationDailyTask");
}

- (double)period
{
  double result;

  result = dbl_1CADD05A0[self->_taskType == 1];
  if (!self->_taskType)
    return 86400.0;
  return result;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (id)incrementalKey
{
  if (self->_taskType == 1)
    return 0;
  -[PHASharedLibrarySuggestionGenerationTask name](self, "name");
  return (id)objc_claimAutoreleasedReturnValue();
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
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isSystemPhotoLibrary") & 1) == 0)
  {
    objc_msgSend(v4, "workingContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();

    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    -[PHASharedLibrarySuggestionGenerationTask name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v10;
    v11 = "Task is running on a non system photo library: not running %@ job";
LABEL_11:
    _os_log_impl(&dword_1CAC16000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v15, 0xCu);

    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0D76230], "libraryScopeToUseWithPhotoLibrary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v4, "workingContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();

    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    -[PHASharedLibrarySuggestionGenerationTask name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v10;
    v11 = "%@ task is not running without an active shared library scope to use";
    goto LABEL_11;
  }
  if ((PLIsSharedLibrarySuggestionsEnabled() & 1) == 0)
  {
    objc_msgSend(v4, "workingContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[PHASharedLibrarySuggestionGenerationTask name](self, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v10;
      v11 = "Shared Library suggestions are disabled in defaults: not running %@ job";
      goto LABEL_11;
    }
LABEL_12:

    v7 = 0;
    goto LABEL_13;
  }
  v7 = objc_msgSend(v4, "isReady");
LABEL_13:

  return v7;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  _QWORD v36[4];
  id v37;
  uint64_t *v38;
  _QWORD v39[4];
  id v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  uint8_t buf[4];
  int v47;
  __int16 v48;
  const char *v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  objc_msgSend(v7, "workingContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D76230];
  objc_msgSend(v9, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "libraryScopeToUseWithPhotoLibrary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D76230]), "initWithWorkingContext:libraryScope:", v9, v12);
    if (self->_taskType)
    {
      if (self->_taskType != 1)
      {
        v15 = 0;
LABEL_19:
        if (*((_BYTE *)v43 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v47 = 183;
            v48 = 2080;
            v49 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/St"
                  "orytelling/Tasks/SharedLibraryTasks/PHASharedLibrarySuggestionGenerationTask.m";
            _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          if (a5 && !*a5)
          {
            objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
            v15 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v15 = 0;
          }
        }
        else
        {
          objc_msgSend(v7, "photoLibrary");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "workingContext");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "loggingConnection");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHASharedLibrarySuggestionGenerationTask _sendNotificationWithPhotoLibrary:loggingConnection:](self, "_sendNotificationWithPhotoLibrary:loggingConnection:", v30, v32);

        }
        goto LABEL_28;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __87__PHASharedLibrarySuggestionGenerationTask_runWithGraphManager_progressReporter_error___block_invoke_2;
      v36[3] = &unk_1E8521AC0;
      v38 = &v42;
      v37 = v8;
      v15 = objc_msgSend(v34, "processSuggestionsFromStartDate:toDate:withError:progressBlock:", v13, v14, a5, v36);

      v16 = v37;
    }
    else
    {
      objc_msgSend(v7, "photoLibrary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "librarySpecificFetchOptions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setFetchLimit:", 1);
      objc_msgSend(v16, "setWantsIncrementalChangeDetails:", 0);
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setSortDescriptors:", v20);

      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "count"))
      {
        objc_msgSend(v21, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "creationDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23)
        {
          v25 = v23;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v25 = (id)objc_claimAutoreleasedReturnValue();
        }
        v26 = v25;

        v27 = (void *)MEMORY[0x1E0D4B130];
        objc_msgSend(MEMORY[0x1E0D4B130], "startOfDayForDate:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "dateByAddingDays:toDate:", -90, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __87__PHASharedLibrarySuggestionGenerationTask_runWithGraphManager_progressReporter_error___block_invoke;
        v39[3] = &unk_1E8521AC0;
        v41 = &v42;
        v40 = v8;
        v15 = objc_msgSend(v34, "processSuggestionsFromStartDate:toDate:withError:progressBlock:", v29, v26, a5, v39);

      }
      else
      {
        v15 = 1;
      }

    }
    goto LABEL_19;
  }
  objc_msgSend(v9, "loggingConnection");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CAC16000, v17, OS_LOG_TYPE_ERROR, "[PGSharedLibrarySuggestionsProcessor] Cannot instanciate without a valid library scope", buf, 2u);
  }

  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 9);
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
LABEL_28:

  _Block_object_dispose(&v42, 8);
  return v15;
}

- (BOOL)runWithGraphManager:(id)a3 withIncrementalChange:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v24 = a4;
  v11 = a5;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  objc_msgSend(v10, "workingContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0D76230];
  objc_msgSend(v12, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "libraryScopeToUseWithPhotoLibrary:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D76230]), "initWithWorkingContext:libraryScope:", v12, v15);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __109__PHASharedLibrarySuggestionGenerationTask_runWithGraphManager_withIncrementalChange_progressReporter_error___block_invoke;
    v25[3] = &unk_1E8521AC0;
    v27 = &v28;
    v26 = v11;
    v17 = objc_msgSend(v16, "processSuggestionsForIncrementalChange:withError:progressBlock:", v24, a6, v25);
    if (*((_BYTE *)v29 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v33 = 207;
        v34 = 2080;
        v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storyt"
              "elling/Tasks/SharedLibraryTasks/PHASharedLibrarySuggestionGenerationTask.m";
        _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      if (a6 && !*a6)
      {
        objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
        v18 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }
    }
    else
    {
      v18 = v17;
      objc_msgSend(v10, "photoLibrary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "workingContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "loggingConnection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHASharedLibrarySuggestionGenerationTask _sendNotificationWithPhotoLibrary:loggingConnection:](self, "_sendNotificationWithPhotoLibrary:loggingConnection:", v20, v22);

    }
  }
  else
  {
    objc_msgSend(v12, "loggingConnection");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CAC16000, v19, OS_LOG_TYPE_ERROR, "[PGSharedLibrarySuggestionsProcessor] Cannot instanciate without a valid library scope", buf, 2u);
    }

    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 9);
      v18 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
  }

  _Block_object_dispose(&v28, 8);
  return v18;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHASharedLibrarySuggestionGenerationTask timeoutFatal:]", "PHASharedLibrarySuggestionGenerationTask.m", 216, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHASharedLibrarySuggestionGenerationTask is stuck", v3, 2u);
  }
}

- (void)_sendNotificationWithPhotoLibrary:(id)a3 loggingConnection:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int HasInternalDiagnostics;
  char v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  int v24;
  __CFString *v25;
  __CFString *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  __CFString *v31;
  __CFString *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint8_t buf[4];
  _BYTE v46[10];
  _DWORD v47[4];
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobileslideshow"));
  HasInternalDiagnostics = PFOSVariantHasInternalDiagnostics();
  v9 = HasInternalDiagnostics;
  if (HasInternalDiagnostics)
    v10 = objc_msgSend(v7, "BOOLForKey:", CFSTR("ForceSharedLibrarySuggestionsNotification"));
  else
    v10 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0CB3A38]);
  v13 = (void *)objc_msgSend(v12, "initWithStoreIdentifier:type:", *MEMORY[0x1E0D75950], 0);
  v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v6, OS_LOG_TYPE_DEFAULT, "[PHASharedLibrarySuggestionGenerationTask] notification defaults override is set", buf, 2u);
    }
    goto LABEL_49;
  }
  if ((objc_msgSend(v13, "synchronize") & 1) == 0 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CAC16000, v6, OS_LOG_TYPE_ERROR, "[PHASharedLibrarySuggestionGenerationTask] Store synchronize failed", buf, 2u);
  }
  objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0D75940]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v44 = v7;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = *MEMORY[0x1E0CD19C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFetchPropertySets:", v20);

  objc_msgSend(v19, "setShouldPrefetchCount:", 1);
  objc_msgSend(v19, "setWantsIncrementalChangeDetails:", 0);
  v43 = v18;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > %@"), CFSTR("addedDate"), v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setInternalPredicate:", v21);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInPreviewStateWithPhotosOrPhotosDeferredSuggestedByClientTypeWithOptions:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");
  if ((uint64_t)v23 > 9)
  {
    v40 = v5;
    v41 = v22;
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0D75938]);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v42)
      goto LABEL_61;
    if ((v9 & 1) != 0)
    {
      v25 = CFSTR("SLNotificationMinimumNumberOfDaysBetweenNotifications");
      if (v23 > 0x31)
        v25 = CFSTR("SLHPNotificationMinimumNumberOfDaysBetweenNotifications");
      v26 = v25;
      v27 = objc_msgSend(v44, "integerForKey:", v26);
      if (v27 < 1)
      {

        v38 = 15;
        if (v23 > 0x31)
          v38 = 3;
        if (!v27)
          v27 = v38;
      }
      else
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v46 = v26;
          *(_WORD *)&v46[8] = 1024;
          v47[0] = v27;
          _os_log_impl(&dword_1CAC16000, v6, OS_LOG_TYPE_INFO, "[PHASharedLibrarySuggestionGenerationTask] notification using override %@ = %d", buf, 0x12u);
        }

      }
    }
    else
    {
      v27 = v23 <= 0x31 ? 15 : 3;
    }
    objc_msgSend(MEMORY[0x1E0D4B130], "components:fromDate:toDate:options:", 16, v42, v11, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "day");

    if (v29 < v27)
    {
      v24 = 1;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v46 = v23;
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)&v46[6] = v29;
        LOWORD(v47[0]) = 1024;
        *(_DWORD *)((char *)v47 + 2) = v27;
        v30 = "[PHASharedLibrarySuggestionGenerationTask] skip notification for %d suggestions - %d days since last notif"
              "ied less than %d";
LABEL_44:
        _os_log_impl(&dword_1CAC16000, v6, OS_LOG_TYPE_INFO, v30, buf, 0x14u);
      }
    }
    else
    {
LABEL_61:
      if (!v16)
        goto LABEL_45;
      if ((v9 & 1) != 0)
      {
        v31 = CFSTR("SLHPNotificationMinimumNumberOfDaysSinceLastSeenSuggestions");
        if (v23 > 0x31)
          v31 = CFSTR("SLNotificationMinimumNumberOfDaysSinceLastSeenSuggestions");
        v32 = v31;
        v33 = objc_msgSend(v44, "integerForKey:", v32);
        if (v33 < 1)
        {

          v39 = 15;
          if (v23 > 0x31)
            v39 = 3;
          if (!v33)
            v33 = v39;
        }
        else
        {
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v46 = v32;
            *(_WORD *)&v46[8] = 1024;
            v47[0] = v33;
            _os_log_impl(&dword_1CAC16000, v6, OS_LOG_TYPE_INFO, "[PHASharedLibrarySuggestionGenerationTask] notification using override %@ = %d", buf, 0x12u);
          }

        }
      }
      else
      {
        v33 = v23 <= 0x31 ? 15 : 3;
      }
      objc_msgSend(MEMORY[0x1E0D4B130], "components:fromDate:toDate:options:", 16, v16, v11, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "day");

      if (v35 >= v33)
      {
LABEL_45:
        v24 = 0;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v46 = v23;
          _os_log_impl(&dword_1CAC16000, v6, OS_LOG_TYPE_DEFAULT, "[PHASharedLibrarySuggestionGenerationTask] sending notification for %d suggestions", buf, 8u);
          v24 = 0;
        }
        goto LABEL_47;
      }
      v24 = 1;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v46 = v23;
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)&v46[6] = v35;
        LOWORD(v47[0]) = 1024;
        *(_DWORD *)((char *)v47 + 2) = v33;
        v30 = "[PHASharedLibrarySuggestionGenerationTask] skip notification for %d suggestions - %d days since last seen less than %d";
        goto LABEL_44;
      }
    }
LABEL_47:

    v5 = v40;
    v22 = v41;
    goto LABEL_48;
  }
  v24 = 1;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v46 = v23;
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = 10;
    _os_log_impl(&dword_1CAC16000, v6, OS_LOG_TYPE_INFO, "[PHASharedLibrarySuggestionGenerationTask] skip notification - not enough suggestions: %d < %d", buf, 0xEu);
  }
LABEL_48:

  v7 = v44;
  if (!v24)
  {
LABEL_49:
    objc_msgSend(v5, "assetsdClient");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "notificationClient");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "asyncNotifySharedLibrarySuggestionsWithNotificationDeliveryDate:", v11);
    objc_msgSend(v14, "setObject:forKey:", v11, *MEMORY[0x1E0D75938]);

  }
}

uint64_t __109__PHASharedLibrarySuggestionGenerationTask_runWithGraphManager_withIncrementalChange_progressReporter_error___block_invoke(uint64_t a1, _BYTE *a2)
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

uint64_t __87__PHASharedLibrarySuggestionGenerationTask_runWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, _BYTE *a2)
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

uint64_t __87__PHASharedLibrarySuggestionGenerationTask_runWithGraphManager_progressReporter_error___block_invoke_2(uint64_t a1, _BYTE *a2)
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

+ (BOOL)resetSuggestionsWithGraphManager:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  int v18;
  id v19;
  void *v20;
  void *v22;
  id *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1D1798448]();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD15E0], "fetchActiveLibraryScopeWithOptions:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") == 1)
  {
    objc_msgSend(v6, "librarySpecificFetchOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = *MEMORY[0x1E0CD19C0];
    LOBYTE(v11) = 1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFetchPropertySets:", v12);

    v24 = v10;
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInPreviewStateWithPhotosOrPhotosDeferredSuggestedByClientTypeWithOptions:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      v22 = v7;
      v23 = a4;
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __83__PHASharedLibrarySuggestionGenerationTask_resetSuggestionsWithGraphManager_error___block_invoke;
      v26[3] = &unk_1E85211E0;
      v27 = v9;
      v14 = v13;
      v28 = v14;
      v25 = 0;
      v11 = objc_msgSend(v6, "performChangesAndWait:error:", v26, &v25);
      v15 = v25;
      objc_msgSend(v5, "workingContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "loggingConnection");
      v17 = objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = objc_msgSend(v14, "count");
          *(_DWORD *)buf = 67109120;
          LODWORD(v30) = v18;
          _os_log_impl(&dword_1CAC16000, v17, OS_LOG_TYPE_INFO, "Reset %d shared library suggestions", buf, 8u);
        }
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v15;
        _os_log_error_impl(&dword_1CAC16000, v17, OS_LOG_TYPE_ERROR, "Failed to reset shared library suggestions: %@", buf, 0xCu);
      }

      v7 = v22;
      a4 = v23;
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
    LOBYTE(v11) = 1;
  }

  objc_autoreleasePoolPop(v7);
  v19 = objc_alloc(MEMORY[0x1E0CB3A38]);
  v20 = (void *)objc_msgSend(v19, "initWithStoreIdentifier:type:", *MEMORY[0x1E0D75950], 0);
  objc_msgSend(v20, "removeObjectForKey:", *MEMORY[0x1E0D75948]);
  objc_msgSend(v20, "removeObjectForKey:", *MEMORY[0x1E0D75940]);
  objc_msgSend(v20, "removeObjectForKey:", *MEMORY[0x1E0D75930]);
  objc_msgSend(v20, "synchronize");
  if (*a4)
    *a4 = objc_retainAutorelease(v15);

  return v11;
}

void __83__PHASharedLibrarySuggestionGenerationTask_resetSuggestionsWithGraphManager_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0CD15E8];
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changeRequestForLibraryScope:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "removePreviewAssetsSuggestedByPhotos:", *(_QWORD *)(a1 + 40));
}

@end
