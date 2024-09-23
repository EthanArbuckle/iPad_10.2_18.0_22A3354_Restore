@implementation PHAPhotosChallengeTask

- (PHAPhotosChallengeTask)init
{
  PHAPhotosChallengeTask *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHAPhotosChallengeTask;
  result = -[PHAPhotosChallengeTask init](&v3, sel_init);
  if (result)
    *(_OWORD *)&result->_limit = xmmword_1CADD05F0;
  return result;
}

- (NSString)name
{
  return (NSString *)CFSTR("PHAPhotosChallengeTask");
}

- (double)period
{
  return 86400.0;
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
  return -2;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  NSObject *v10;
  uint8_t v12[16];

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0D760A0], "photosChallengeIsEnabled")
    && objc_msgSend(v3, "isReady"))
  {
    objc_msgSend(v3, "workingContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ratioOfAssetsWithFacesProcessed");
    v7 = v6;
    objc_msgSend(v5, "ratioOfAssetsWithScenesProcessed");
    v9 = v8 >= 0.75 && v7 >= 0.75;
    if (!v9)
    {
      objc_msgSend(v4, "loggingConnection");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1CAC16000, v10, OS_LOG_TYPE_INFO, "[PHAPhotosChallengeTask] shouldRunWithGraphManager returning NO, library does not have enough faces and/or scenes processed.", v12, 2u);
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  PHAQuestionController *v12;
  int64_t limit;
  int64_t v14;
  BOOL v15;
  int64_t questionOptions;
  _BOOL4 v17;
  int v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  _QWORD v26[4];
  id v27;
  uint8_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint8_t v34[4];
  int v35;
  __int16 v36;
  const char *v37;
  uint8_t buf[8];
  __int128 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  if (PFOSVariantHasInternalDiagnostics())
  {
    v10 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0D71908], "_notificationDeliveryDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postSubmissionNotificationIfNeededWithGraphManager:notificationDate:", v8, v11);

  }
  v12 = -[PHAQuestionController initWithGraphManager:]([PHAQuestionController alloc], "initWithGraphManager:", v8);
  limit = self->_limit;
  if (limit == -1)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&v39 = buf;
    *((_QWORD *)&v39 + 1) = 0x2020000000;
    v40 = 0;
    questionOptions = self->_questionOptions;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __69__PHAPhotosChallengeTask_runWithGraphManager_progressReporter_error___block_invoke;
    v26[3] = &unk_1E8520438;
    v28 = buf;
    v29 = &v30;
    v27 = v9;
    v17 = -[PHAQuestionController generateQuestionsWithOptions:progress:](v12, "generateQuestionsWithOptions:progress:", questionOptions, v26);
    v18 = *((unsigned __int8 *)v31 + 24);
    if (*((_BYTE *)v31 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v34 = 67109378;
        v35 = 145;
        v36 = 2080;
        v37 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storyt"
              "elling/Tasks/PHAPhotosChallengeTask.m";
        _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v34, 0x12u);
      }
      if (a5 && !*a5)
      {
        objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      objc_msgSend(v8, "workingContext");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v17)
      {
        objc_msgSend(v19, "loggingConnection");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v34 = 0;
          _os_log_impl(&dword_1CAC16000, v21, OS_LOG_TYPE_INFO, "[PHAPhotosChallengeTask] Automatic question generation completed successfully.", v34, 2u);
        }
      }
      else
      {
        objc_msgSend(v19, "loggingConnection");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v34 = 0;
          _os_log_error_impl(&dword_1CAC16000, v21, OS_LOG_TYPE_ERROR, "[PHAPhotosChallengeTask] Automatic question generation did not complete successfully.", v34, 2u);
        }
      }

    }
    _Block_object_dispose(buf, 8);
    if (v18)
      goto LABEL_25;
  }
  else
  {
    v14 = self->_questionOptions;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __69__PHAPhotosChallengeTask_runWithGraphManager_progressReporter_error___block_invoke_149;
    v23[3] = &unk_1E8521AC0;
    v25 = &v30;
    v24 = v9;
    v15 = -[PHAQuestionController generateQuestionsWithOptions:limit:handleQuestionVersionBump:updateInvalidQuestions:progress:](v12, "generateQuestionsWithOptions:limit:handleQuestionVersionBump:updateInvalidQuestions:progress:", v14, limit, 1, 1, v23);
    if (*((_BYTE *)v31 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 157;
        LOWORD(v39) = 2080;
        *(_QWORD *)((char *)&v39 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "oAnalysis/Framework/Storytelling/Tasks/PHAPhotosChallengeTask.m";
        _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      if (a5 && !*a5)
      {
        objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

LABEL_25:
      LOBYTE(v17) = 0;
      goto LABEL_26;
    }
    LOBYTE(v17) = v15;

  }
LABEL_26:

  _Block_object_dispose(&v30, 8);
  return v17;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHAPhotosChallengeTask timeoutFatal:]", "PHAPhotosChallengeTask.m", 171, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHAPhotosChallengeTask is stuck", v3, 2u);
  }
}

- (int64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

- (int64_t)questionOptions
{
  return self->_questionOptions;
}

- (void)setQuestionOptions:(int64_t)a3
{
  self->_questionOptions = a3;
}

uint64_t __69__PHAPhotosChallengeTask_runWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t v5;
  uint64_t result;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3 * 0.05 + 0.9;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v5 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  }
  *(_BYTE *)(v5 + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a2 = 1;
  return result;
}

uint64_t __69__PHAPhotosChallengeTask_runWithGraphManager_progressReporter_error___block_invoke_149(uint64_t a1, _BYTE *a2)
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

+ (id)currentQuestionsKVSDataFromGraphManager:(id)a3
{
  id v3;
  PHAQuestionController *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = -[PHAQuestionController initWithGraphManager:]([PHAQuestionController alloc], "initWithGraphManager:", v3);

  -[PHAQuestionController currentQuestionsKVSData](v4, "currentQuestionsKVSData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = (void *)MEMORY[0x1E0C9AA60];
  v7 = v5;

  return v7;
}

+ (void)removeCurrentKVSDataFromGraphManager:(id)a3
{
  id v3;
  PHAQuestionController *v4;

  v3 = a3;
  v4 = -[PHAQuestionController initWithGraphManager:]([PHAQuestionController alloc], "initWithGraphManager:", v3);

  -[PHAQuestionController removeCurrentKVSData](v4, "removeCurrentKVSData");
}

+ (BOOL)postSubmissionNotificationIfNeededWithGraphManager:(id)a3 notificationDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  BOOL v15;
  void *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  double v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  BOOL v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  _QWORD v43[4];
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "workingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryForKey:", CFSTR("PhotosChallengeSubmissionLastPostedNotificationMetadata"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10
    || (objc_msgSend(v10, "dateByAddingTimeInterval:", 1814400.0),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "compare:", v6),
        v12,
        v13 == -1))
  {
    objc_msgSend(v5, "photoLibrary");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject librarySpecificFetchOptions](v14, "librarySpecificFetchOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setShouldPrefetchCount:", 1);
    objc_msgSend(MEMORY[0x1E0CD1720], "fetchAnsweredQuestionsWithOptions:validQuestionsOnly:", v16, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18 <= 0x31)
    {
      objc_msgSend(v7, "loggingConnection");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v20 = "[PHAPhotosChallengeTask] Not posting a submission notification, user hasn't answered enough questions.";
LABEL_23:
        _os_log_impl(&dword_1CAC16000, v19, OS_LOG_TYPE_INFO, v20, buf, 2u);
        goto LABEL_24;
      }
      goto LABEL_24;
    }
    if ((int)*MEMORY[0x1E0D47690] <= 84)
      v21 = 84;
    else
      v21 = *MEMORY[0x1E0D47690];
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("sceneAnalysisVersion"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "integerValue");

    if (v23 >= v21
      || (-[NSObject ratioOfAssetsAtOrAboveSceneAnalysisVersion:](v14, "ratioOfAssetsAtOrAboveSceneAnalysisVersion:", (__int16)v21), v24 >= 0.75))
    {
      v39 = v23 < v21;
      v37 = v21;
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("faceAnalysisVersion"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "integerValue");
      v27 = (int)*MEMORY[0x1E0D47688];

      if (v26 < v27)
      {
        -[NSObject ratioOfAssetsAtOrAboveFaceAnalysisVersion:](v14, "ratioOfAssetsAtOrAboveFaceAnalysisVersion:", (__int16)v27);
        if (v28 < 0.75)
          goto LABEL_16;
        v39 = 1;
      }
      v41 = v6;
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("graphVersion"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "integerValue");
      v31 = objc_msgSend(v5, "currentGraphVersion");

      if (v30 < v31 || v39)
      {
        -[NSObject assetsdClient](v14, "assetsdClient");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "notificationClient");
        v19 = objc_claimAutoreleasedReturnValue();

        -[NSObject asyncNotifyPhotosChallengeSubmissionWithNotificationDeliveryDate:](v19, "asyncNotifyPhotosChallengeSubmissionWithNotificationDeliveryDate:");
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = v41;
        v42[0] = CFSTR("date");
        v42[1] = CFSTR("sceneAnalysisVersion");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v37);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v43[1] = v40;
        v42[2] = CFSTR("faceAnalysisVersion");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v43[2] = v38;
        v42[3] = CFSTR("graphVersion");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "currentGraphVersion"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v43[3] = v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 4);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKey:", v36, CFSTR("PhotosChallengeSubmissionLastPostedNotificationMetadata"));

        v6 = v41;
        v15 = 1;
        goto LABEL_25;
      }
      objc_msgSend(v7, "loggingConnection");
      v19 = objc_claimAutoreleasedReturnValue();
      v6 = v41;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v20 = "[PHAPhotosChallengeTask] Not posting a submission notification, relevant data versions haven't changed sin"
              "ce last notification.";
        goto LABEL_23;
      }
      goto LABEL_24;
    }
LABEL_16:
    objc_msgSend(v7, "loggingConnection");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v20 = "[PHAPhotosChallengeTask] Not posting a submission notification, not enough of library has been processed wit"
            "h newest data versions yet.";
      goto LABEL_23;
    }
LABEL_24:
    v15 = 0;
LABEL_25:

    goto LABEL_26;
  }
  objc_msgSend(v7, "loggingConnection");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v11;
    _os_log_impl(&dword_1CAC16000, v14, OS_LOG_TYPE_INFO, "[PHAPhotosChallengeTask] Already recently posted a submission notification (on date: %@).", buf, 0xCu);
  }
  v15 = 0;
LABEL_26:

  return v15;
}

+ (BOOL)postNewQuestionsNotificationIfNeededWithGraphManager:(id)a3 notificationDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  BOOL v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  int v23;
  _DWORD v24[7];

  *(_QWORD *)&v24[5] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "workingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("PhotosChallengeLastPostedNewQuestionsNotificationDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9
    || (objc_msgSend(v9, "dateByAddingTimeInterval:", 259200.0),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "compare:", v6),
        v10,
        v11 == -1))
  {
    objc_msgSend(v5, "photoLibrary");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject librarySpecificFetchOptions](v12, "librarySpecificFetchOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setShouldPrefetchCount:", 1);
    objc_msgSend(MEMORY[0x1E0CD1720], "fetchUnansweredQuestionsWithOptions:validQuestionsOnly:", v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    v13 = v16 > 9;
    if (v16 > 9)
    {
      -[NSObject assetsdClient](v12, "assetsdClient");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "notificationClient");
      v20 = objc_claimAutoreleasedReturnValue();

      -[NSObject asyncNotifyPhotosChallengeNewQuestionsWithNotificationDeliveryDate:](v20, "asyncNotifyPhotosChallengeNewQuestionsWithNotificationDeliveryDate:", v6);
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setValue:forKey:", v6, CFSTR("PhotosChallengeLastPostedNewQuestionsNotificationDate"));

      objc_msgSend(v7, "loggingConnection");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 138412290;
        *(_QWORD *)v24 = v6;
        _os_log_impl(&dword_1CAC16000, v19, OS_LOG_TYPE_DEFAULT, "[PHAPhotosChallengeTask] Post notification for new questions at %@", (uint8_t *)&v23, 0xCu);
      }

    }
    else
    {
      objc_msgSend(v7, "loggingConnection");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v23 = 67109376;
        v24[0] = v16;
        LOWORD(v24[1]) = 1024;
        *(_DWORD *)((char *)&v24[1] + 2) = 10;
        _os_log_impl(&dword_1CAC16000, v20, OS_LOG_TYPE_INFO, "[PHAPhotosChallengeTask] Not posting a new questions notification, user does not have enough unanswered questions: %d < %d", (uint8_t *)&v23, 0xEu);
      }
    }

  }
  else
  {
    objc_msgSend(v7, "loggingConnection");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v23 = 138412290;
      *(_QWORD *)v24 = v9;
      _os_log_impl(&dword_1CAC16000, v12, OS_LOG_TYPE_INFO, "[PHAPhotosChallengeTask] Already recently posted a new questions notification (on date: %@).", (uint8_t *)&v23, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

@end
