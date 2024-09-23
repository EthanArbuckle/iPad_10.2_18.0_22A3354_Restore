@implementation PHAQuestionController

- (PHAQuestionController)initWithGraphManager:(id)a3
{
  id v5;
  PHAQuestionController *v6;
  uint64_t v7;
  NSUbiquitousKeyValueStore *store;
  os_log_t v9;
  OS_os_log *loggingConnection;
  uint64_t v11;
  PGTrialSession *trialSession;
  uint64_t v13;
  NSMutableDictionary *questionTypeImportanceByQuestionType;
  void *v15;
  double v16;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PHAQuestionController;
  v6 = -[PHAQuestionController init](&v18, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A38]), "_initWithStoreIdentifier:usingEndToEndEncryption:", CFSTR("com.apple.photoanalysisd"), 1);
    store = v6->_store;
    v6->_store = (NSUbiquitousKeyValueStore *)v7;

    objc_storeStrong((id *)&v6->_graphManager, a3);
    v9 = os_log_create("com.apple.photoanalysisd", "photosChallenge");
    loggingConnection = v6->_loggingConnection;
    v6->_loggingConnection = (OS_os_log *)v9;

    v11 = objc_msgSend(MEMORY[0x1E0D76278], "newTrialSession");
    trialSession = v6->_trialSession;
    v6->_trialSession = (PGTrialSession *)v11;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    questionTypeImportanceByQuestionType = v6->_questionTypeImportanceByQuestionType;
    v6->_questionTypeImportanceByQuestionType = (NSMutableDictionary *)v13;

    -[PGTrialSession levelForFactorName:withNamespaceType:](v6->_trialSession, "levelForFactorName:withNamespaceType:", CFSTR("CurrentQuestionVersion"), 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v6->_currentQuestionVersion = (int)v16;

  }
  return v6;
}

- (BOOL)generateQuestionsWithOptions:(int64_t)a3 progress:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  _QWORD v25[4];
  id v26;
  _QWORD *v27;
  uint64_t *v28;
  _QWORD v29[4];
  id v30;
  _QWORD *v31;
  uint64_t *v32;
  _QWORD v33[4];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint8_t buf[4];
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v7 = MEMORY[0x1E0C809B0];
  v33[3] = 0;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __63__PHAQuestionController_generateQuestionsWithOptions_progress___block_invoke;
  v29[3] = &unk_1E8521468;
  v31 = v33;
  v8 = v6;
  v30 = v8;
  v32 = &v34;
  -[PHAQuestionController _handleQuestionVersionBumpIfNeededWithProgressBlock:](self, "_handleQuestionVersionBumpIfNeededWithProgressBlock:", v29);
  if (*((_BYTE *)v35 + 24))
  {
    if (__PXLog_genericOnceToken != -1)
      dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_8660);
    v9 = __PXLog_genericOSLog;
    if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v9, OS_LOG_TYPE_INFO, "[Questions] Question generation stop requested by progress handler.", buf, 2u);
    }
    v10 = 0;
  }
  else
  {
    v25[0] = v7;
    v25[1] = 3221225472;
    v25[2] = __63__PHAQuestionController_generateQuestionsWithOptions_progress___block_invoke_165;
    v25[3] = &unk_1E8521468;
    v27 = v33;
    v11 = v8;
    v26 = v11;
    v28 = &v34;
    -[PHAQuestionController _updateInvalidQuestionsWithProgressBlock:](self, "_updateInvalidQuestionsWithProgressBlock:", v25);
    if (*((_BYTE *)v35 + 24))
    {
      if (__PXLog_genericOnceToken != -1)
        dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_167);
      v12 = __PXLog_genericOSLog;
      if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CAC16000, v12, OS_LOG_TYPE_INFO, "[Questions] Question generation stop requested by progress handler.", buf, 2u);
      }
      v10 = 0;
    }
    else
    {
      -[PGManager photoLibrary](self->_graphManager, "photoLibrary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "librarySpecificFetchOptions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setShouldPrefetchCount:", 1);
      objc_msgSend(MEMORY[0x1E0CD1720], "fetchUnansweredQuestionsWithOptions:validQuestionsOnly:", v14, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      -[PGTrialSession levelForFactorName:withNamespaceType:](self->_trialSession, "levelForFactorName:withNamespaceType:", CFSTR("QuestionGenerationLimit"), 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValue");
      v19 = v18;

      if (v16 == (unint64_t)v19)
      {
        if (__PXLog_genericOnceToken != -1)
          dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_170);
        v20 = __PXLog_genericOSLog;
        v10 = 1;
        if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          v39 = v16;
          _os_log_impl(&dword_1CAC16000, v20, OS_LOG_TYPE_INFO, "[Questions] 0 questions generated since already at unanswered question limit of %d", buf, 8u);
        }
      }
      else
      {
        v22[0] = v7;
        v22[1] = 3221225472;
        v22[2] = __63__PHAQuestionController_generateQuestionsWithOptions_progress___block_invoke_171;
        v22[3] = &unk_1E85214F0;
        v24 = v33;
        v23 = v11;
        v10 = -[PHAQuestionController generateQuestionsWithOptions:limit:handleQuestionVersionBump:updateInvalidQuestions:progress:](self, "generateQuestionsWithOptions:limit:handleQuestionVersionBump:updateInvalidQuestions:progress:", a3, (unint64_t)v19, 0, 0, v22);

      }
    }

  }
  _Block_object_dispose(v33, 8);
  _Block_object_dispose(&v34, 8);

  return v10;
}

- (BOOL)generateQuestionsWithOptions:(int64_t)a3 limit:(unint64_t)a4 handleQuestionVersionBump:(BOOL)a5 updateInvalidQuestions:(BOOL)a6 progress:(id)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  unint64_t v24;
  id v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  void *v30;
  double Current;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  objc_class *v37;
  char *v38;
  double v39;
  uint64_t v40;
  void *v41;
  int v42;
  NSObject *v43;
  uint64_t v44;
  uint32_t denom;
  uint32_t numer;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  uint64_t v51;
  NSObject *v52;
  os_signpost_id_t spid;
  void *v54;
  id obj;
  uint64_t v56;
  void *v57;
  id v58;
  _QWORD v59[4];
  id v60;
  uint64_t *v61;
  double v62;
  double v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  mach_timebase_info info;
  _QWORD v69[4];
  id v70;
  uint64_t *v71;
  uint64_t v72;
  _QWORD v73[4];
  id v74;
  uint64_t *v75;
  uint64_t v76;
  _QWORD v77[4];
  id v78;
  uint64_t *v79;
  uint64_t v80;
  _QWORD v81[4];
  id v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  char v88;
  uint8_t buf[4];
  const char *v90;
  __int16 v91;
  double v92;
  __int16 v93;
  uint64_t v94;
  void *v95;
  _BYTE v96[128];
  uint64_t v97;

  v7 = a6;
  v8 = a5;
  v97 = *MEMORY[0x1E0C80C00];
  v12 = a7;
  v85 = 0;
  v86 = &v85;
  v87 = 0x2020000000;
  v88 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke;
  v81[3] = &unk_1E8521518;
  v14 = v12;
  v83 = &v85;
  v84 = 0;
  v82 = v14;
  -[PHAQuestionController _handleKVSQuestionsUpdateIfNeededWithProgressBlock:](self, "_handleKVSQuestionsUpdateIfNeededWithProgressBlock:", v81);
  if (*((_BYTE *)v86 + 24))
  {
    if (__PXLog_genericOnceToken != -1)
      dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_172_8642);
    v15 = __PXLog_genericOSLog;
    if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v15, OS_LOG_TYPE_INFO, "[Questions] Question generation stop requested by progress handler.", buf, 2u);
    }
LABEL_21:
    LOBYTE(v18) = 0;
    goto LABEL_22;
  }
  if (v8)
  {
    v77[0] = v13;
    v77[1] = 3221225472;
    v77[2] = __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_173;
    v77[3] = &unk_1E8521518;
    v80 = 0x3FB999999999999ALL;
    v78 = v14;
    v79 = &v85;
    -[PHAQuestionController _handleQuestionVersionBumpIfNeededWithProgressBlock:](self, "_handleQuestionVersionBumpIfNeededWithProgressBlock:", v77);
    if (*((_BYTE *)v86 + 24))
    {
      if (__PXLog_genericOnceToken != -1)
        dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_175);
      v16 = __PXLog_genericOSLog;
      if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CAC16000, v16, OS_LOG_TYPE_INFO, "[Questions] Question generation stop requested by progress handler.", buf, 2u);
      }

      goto LABEL_21;
    }

  }
  if (v7)
  {
    v73[0] = v13;
    v73[1] = 3221225472;
    v73[2] = __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_176;
    v73[3] = &unk_1E8521518;
    v76 = 0x3FC999999999999ALL;
    v74 = v14;
    v75 = &v85;
    -[PHAQuestionController _updateInvalidQuestionsWithProgressBlock:](self, "_updateInvalidQuestionsWithProgressBlock:", v73);
    if (*((_BYTE *)v86 + 24))
    {
      if (__PXLog_genericOnceToken != -1)
        dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_178_8645);
      v17 = __PXLog_genericOSLog;
      if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CAC16000, v17, OS_LOG_TYPE_INFO, "[Questions] Question generation stop requested by progress handler.", buf, 2u);
      }

      goto LABEL_21;
    }

  }
  v69[0] = v13;
  v69[1] = 3221225472;
  v69[2] = __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_179;
  v69[3] = &unk_1E8521518;
  v72 = 0x3FD3333333333333;
  v58 = v14;
  v70 = v58;
  v71 = &v85;
  -[PHAQuestionController _syncAnsweredQuestionsWithProgressBlock:](self, "_syncAnsweredQuestionsWithProgressBlock:", v69);
  if (*((_BYTE *)v86 + 24))
  {
    if (__PXLog_genericOnceToken != -1)
      dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_181);
    v20 = __PXLog_genericOSLog;
    if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v20, OS_LOG_TYPE_INFO, "[Questions] Question generation stop requested by progress handler.", buf, 2u);
    }
    LOBYTE(v18) = 0;
  }
  else
  {
    -[PHAQuestionController loggingConnection](self, "loggingConnection");
    v21 = objc_claimAutoreleasedReturnValue();
    spid = os_signpost_id_generate(v21);
    info = 0;
    mach_timebase_info(&info);
    v22 = v21;
    v23 = v22;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CAC16000, v23, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PhotosChallengeQuestionGeneration", ", buf, 2u);
    }
    v52 = v23;

    v51 = mach_absolute_time();
    -[PHAQuestionController questionFactoriesForOptions:](self, "questionFactoriesForOptions:", a3);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v54, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v54, "count");
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v25 = v54;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v64, v96, 16);
      if (v26)
      {
        v27 = 0.6 / (double)v24;
        v56 = *(_QWORD *)v65;
        v28 = 0.4;
        obj = v25;
        while (2)
        {
          v29 = 0;
          do
          {
            if (*(_QWORD *)v65 != v56)
              objc_enumerationMutation(obj);
            v30 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v29);
            Current = CFAbsoluteTimeGetCurrent();
            v59[0] = v13;
            v59[1] = 3221225472;
            v59[2] = __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_184;
            v59[3] = &unk_1E85215E0;
            v62 = v28;
            v63 = v27;
            v60 = v58;
            v61 = &v85;
            objc_msgSend(v30, "generateQuestionsWithLimit:progressBlock:", a4, v59);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (void *)objc_msgSend(v32, "mutableCopy");

            if (*((_BYTE *)v86 + 24))
            {
              if (__PXLog_genericOnceToken != -1)
                dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_186);
              v49 = __PXLog_genericOSLog;
              if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1CAC16000, v49, OS_LOG_TYPE_INFO, "[Questions] Question generation stop requested by progress handler.", buf, 2u);
              }

              LOBYTE(v18) = 0;
              v41 = obj;
              goto LABEL_61;
            }
            objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("localFactoryScore"), 0);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v95 = v33;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v95, 1);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "sortUsingDescriptors:", v34);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v30, "questionType"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "setObject:forKeyedSubscript:", v18, v35);

            if (__PXLog_genericOnceToken != -1)
              dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_193);
            v36 = (id)__PXLog_genericOSLog;
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              v37 = (objc_class *)objc_opt_class();
              NSStringFromClass(v37);
              v38 = (char *)(id)objc_claimAutoreleasedReturnValue();
              v39 = CFAbsoluteTimeGetCurrent();
              v40 = objc_msgSend(v18, "count");
              *(_DWORD *)buf = 138412802;
              v90 = v38;
              v91 = 2048;
              v92 = v39 - Current;
              v93 = 2048;
              v94 = v40;
              _os_log_impl(&dword_1CAC16000, v36, OS_LOG_TYPE_INFO, "[Performance] %@ took %.3fs to generate %tu questions", buf, 0x20u);

            }
            v28 = v27 + v28;
            ++v29;
          }
          while (v26 != v29);
          v25 = obj;
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v96, 16);
          if (v26)
            continue;
          break;
        }
      }

      -[PHAQuestionController selectedQuestionsFromSortedQuestionsByQuestionType:withLimit:](self, "selectedQuestionsFromSortedQuestionsByQuestionType:withLimit:", v57, a4);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAQuestionController assignScoreToQuestions:](self, "assignScoreToQuestions:", v41);
      LODWORD(v18) = -[PHAQuestionController persistQuestions:](self, "persistQuestions:", v41);
      if ((_DWORD)v18)
      {
        v42 = objc_msgSend(v41, "count");
        if (__PXLog_genericOnceToken != -1)
          dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_195_8653);
        v43 = __PXLog_genericOSLog;
        if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v90) = v42;
          _os_log_impl(&dword_1CAC16000, v43, OS_LOG_TYPE_INFO, "[Questions] Generated %d questions", buf, 8u);
        }
      }
      v44 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v47 = v52;
      v48 = v47;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CAC16000, v48, OS_SIGNPOST_INTERVAL_END, spid, "PhotosChallengeQuestionGeneration", ", buf, 2u);
      }

      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v90 = "PhotosChallengeQuestionGeneration";
        v91 = 2048;
        v92 = (float)((float)((float)((float)(v44 - v51) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1CAC16000, v48, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
LABEL_61:

    }
    else
    {
      if (__PXLog_genericOnceToken != -1)
        dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_183);
      v50 = __PXLog_genericOSLog;
      if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v90) = a3;
        _os_log_impl(&dword_1CAC16000, v50, OS_LOG_TYPE_INFO, "[Questions] No question factories for options: %d", buf, 8u);
      }
      LOBYTE(v18) = 0;
    }

  }
LABEL_22:

  _Block_object_dispose(&v85, 8);
  return (char)v18;
}

- (id)selectedQuestionsFromSortedQuestionsByQuestionType:(id)a3 withLimit:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t i;
  double v21;
  id v22;
  double v23;
  uint64_t j;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  unint64_t v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  uint64_t v41;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[5];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4)
  {
    objc_msgSend(v6, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __86__PHAQuestionController_selectedQuestionsFromSortedQuestionsByQuestionType_withLimit___block_invoke;
    v59[3] = &unk_1E8521668;
    v59[4] = self;
    objc_msgSend(v8, "sortedArrayUsingComparator:", v59);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0x1E0C99000uLL;
    v43 = v10;
    while (1)
    {
      objc_msgSend(v7, "allValues", v43);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (!v14)
        break;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v15 = v10;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v56;
        v19 = 0.0;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v56 != v18)
              objc_enumerationMutation(v15);
            -[PHAQuestionController importanceOfQuestionType:](self, "importanceOfQuestionType:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i));
            v19 = v19 + v21;
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
        }
        while (v17);
      }
      else
      {
        v19 = 0.0;
      }

      objc_msgSend(*(id *)(v12 + 3616), "set");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v22 = v15;
      v44 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      if (v44)
      {
        v45 = *(_QWORD *)v52;
        v23 = (double)a4;
        while (2)
        {
          for (j = 0; j != v44; ++j)
          {
            if (*(_QWORD *)v52 != v45)
              objc_enumerationMutation(v22);
            v25 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j);
            -[PHAQuestionController importanceOfQuestionType:](self, "importanceOfQuestionType:", v25);
            v27 = v26 / v19;
            v28 = fmax(floor(v26 / v19 * v23), 1.0);
            if (v27 <= 0.0)
              v28 = 0.0;
            v29 = (unint64_t)v28;
            objc_msgSend(v7, "objectForKeyedSubscript:", v25);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "count");
            if (v31 >= v29)
              v32 = v29;
            else
              v32 = v31;
            if (v32)
            {
              while (1)
              {
                objc_msgSend(v30, "firstObject");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "removeObjectAtIndex:", 0);
                objc_msgSend(v11, "addObject:", v33);

                if (!--a4)
                  break;
                if (!--v32)
                  goto LABEL_26;
              }

              v10 = v43;
              goto LABEL_43;
            }
LABEL_26:
            v34 = objc_msgSend(v30, "count");
            if (v27 == 0.0 || v34 == 0)
              objc_msgSend(v46, "addObject:", v25);

          }
          v44 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
          if (v44)
            continue;
          break;
        }
      }

      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v36 = v46;
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v48;
        do
        {
          for (k = 0; k != v38; ++k)
          {
            if (*(_QWORD *)v48 != v39)
              objc_enumerationMutation(v36);
            v41 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * k);
            objc_msgSend(v7, "removeObjectForKey:", v41);
            objc_msgSend(v22, "removeObject:", v41);
          }
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
        }
        while (v38);
      }

      v10 = v43;
      v12 = 0x1E0C99000;
    }
LABEL_43:

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

- (void)assignScoreToQuestions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v10, "type"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          objc_msgSend(v12, "addObject:", v10);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("localFactoryScore"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __48__PHAQuestionController_assignScoreToQuestions___block_invoke;
  v18[3] = &unk_1E8521690;
  v19 = v16;
  v17 = v16;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v18);

}

- (BOOL)persistQuestions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  int v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  __CFString *v14;
  NSObject *v15;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  PHAQuestionController *v21;
  uint8_t buf[4];
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGManager photoLibrary](self->_graphManager, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __42__PHAQuestionController_persistQuestions___block_invoke;
  v18[3] = &unk_1E85216B8;
  v7 = v4;
  v19 = v7;
  v8 = v6;
  v20 = v8;
  v21 = self;
  v17 = 0;
  v9 = objc_msgSend(v5, "performChangesAndWait:error:", v18, &v17);
  v10 = v17;
  if (!v10)
  {
    v14 = CFSTR("NO");
    if (v9)
      v14 = CFSTR("YES");
    v12 = v14;
    if (__PXLog_genericOnceToken != -1)
      dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_208);
    v15 = __PXLog_genericOSLog;
    if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v12;
      _os_log_impl(&dword_1CAC16000, v15, OS_LOG_TYPE_INFO, "[Questions] Succeeded persisting questions: %@", buf, 0xCu);
    }
    goto LABEL_12;
  }
  if (__PXLog_genericOnceToken != -1)
    dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_202);
  v11 = (void *)__PXLog_genericOSLog;
  if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
  {
    v12 = v11;
    objc_msgSend(v10, "description");
    v13 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v23 = v13;
    _os_log_error_impl(&dword_1CAC16000, v12, OS_LOG_TYPE_ERROR, "[Questions] Error performing library changes for questions: %@", buf, 0xCu);

LABEL_12:
  }

  return v9;
}

- (double)importanceOfQuestionType:(id)a3
{
  id v4;
  void *v5;
  unsigned __int16 v6;
  double v7;
  double v8;
  __CFString *v9;
  void *v10;
  void *v11;
  double v12;
  NSObject *v13;
  void *v14;
  int v16;
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_questionTypeImportanceByQuestionType, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "unsignedIntegerValue");
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    v8 = v7;
  }
  else
  {
    v8 = 0.0;
    if (v6 <= 0x1Eu && ((0x7FFFFDFFu >> v6) & 1) != 0)
    {
      v9 = off_1E8521920[(__int16)v6];
      -[PGTrialSession levelForFactorName:withNamespaceType:](self->_trialSession, "levelForFactorName:withNamespaceType:", v9, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "doubleValue");
        v8 = v12;
      }
      else
      {
        if (__PXLog_genericOnceToken != -1)
          dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_209_8631);
        v13 = __PXLog_genericOSLog;
        if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
        {
          v16 = 138412290;
          v17 = v9;
          _os_log_impl(&dword_1CAC16000, v13, OS_LOG_TYPE_INFO, "nil level found for factor %@", (uint8_t *)&v16, 0xCu);
        }
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_questionTypeImportanceByQuestionType, "setObject:forKeyedSubscript:", v14, v4);

  }
  return v8;
}

- (id)questionFactoriesForOptions:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[PHAQuestionController allQuestionFactories](self, "allQuestionFactories");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (a3 == 536838143)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v8 = v5;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v15 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
            if ((objc_msgSend(v13, "questionOptions", (_QWORD)v14) & a3) != 0)
              objc_msgSend(v6, "addObject:", v13);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v10);
      }

    }
    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)allQuestionFactories
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[30];

  v35[28] = *MEMORY[0x1E0C80C00];
  -[PGManager workingContext](self->_graphManager, "workingContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75C90]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[0] = v34;
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D760B0]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[1] = v33;
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D761F8]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[2] = v32;
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D76180]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[3] = v31;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D760F0]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[4] = v30;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D761D8]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[5] = v29;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D76280]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[6] = v28;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D76048]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[7] = v27;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D76240]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[8] = v26;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75F70]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[9] = v25;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75C50]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[10] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D760E8]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[11] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D761B8]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[12] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75F60]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[13] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D760D0]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[14] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D760C8]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[15] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D76268]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[16] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D761A8]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[17] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D76220]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[18] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D76228]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[19] = v15;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75C98]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[20] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75C58]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[21] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75D08]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[22] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D76288]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[23] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D76098]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[24] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D76040]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[25] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75D18]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[26] = v10;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D76248]), "initWithWorkingContext:questionVersion:", v3, self->_currentQuestionVersion);
  v35[27] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 28);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_handleQuestionVersionBumpIfNeededWithProgressBlock:(id)a3
{
  void (**v4)(id, _BYTE *, double);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  char v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _BYTE *, double))a3;
  -[PGManager photoLibrary](self->_graphManager, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("questionVersion < %d"), self->_currentQuestionVersion);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v7);

  objc_msgSend(MEMORY[0x1E0CD1720], "fetchUnansweredQuestionsWithOptions:validQuestionsOnly:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v4[2](v4, &v16, 0.5);
  if (!v16)
  {
    if (objc_msgSend(v8, "count"))
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __77__PHAQuestionController__handleQuestionVersionBumpIfNeededWithProgressBlock___block_invoke;
      v14[3] = &unk_1E8521740;
      v15 = v8;
      v13 = 0;
      v9 = objc_msgSend(v5, "performChangesAndWait:error:", v14, &v13);
      v10 = v13;
      if (v9)
      {
        if (__PXLog_genericOnceToken != -1)
          dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_243_8603);
        v11 = __PXLog_genericOSLog;
        if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CAC16000, v11, OS_LOG_TYPE_INFO, "[Questions] Succeeded handling question version bump", buf, 2u);
        }
      }
      else
      {
        if (__PXLog_genericOnceToken != -1)
          dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_245);
        v12 = __PXLog_genericOSLog;
        if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v10;
          _os_log_error_impl(&dword_1CAC16000, v12, OS_LOG_TYPE_ERROR, "[Questions] Failed to delete unanswered questions below current version with error: %@", buf, 0xCu);
        }
      }

    }
    v4[2](v4, &v16, 1.0);
  }

}

- (void)_updateInvalidQuestionsWithProgressBlock:(id)a3
{
  void (**v4)(id, _BYTE *, double);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  NSObject *v21;
  __CFString *v22;
  NSObject *v23;
  __CFString *v24;
  __CFString *v25;
  id v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  char v37;
  uint8_t buf[4];
  __CFString *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _BYTE *, double))a3;
  -[PGManager photoLibrary](self->_graphManager, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  objc_msgSend(MEMORY[0x1E0CD1720], "fetchUnansweredQuestionsWithOptions:validQuestionsOnly:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, &v37, 0.2);
  if (!v37)
  {
    v27 = v7;
    objc_msgSend(MEMORY[0x1E0CD1720], "questionsWithValidEntitiesFromQuestions:photoLibrary:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "uuid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      }
      while (v12);
    }

    v4[2](v4, &v37, 0.4);
    v7 = v27;
    if (!v37)
    {
      objc_msgSend(v5, "librarySpecificFetchOptions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD1720], "fetchInvalidatedQuestionsWithOptions:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, &v37, 0.6);
      if (!v37)
      {
        objc_msgSend(MEMORY[0x1E0CD1720], "questionsWithValidEntitiesFromQuestions:photoLibrary:", v17, v5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, &v37, 0.8);
        if (!v37)
        {
          if (objc_msgSend(v27, "count") || objc_msgSend(v18, "count"))
          {
            v29[0] = MEMORY[0x1E0C809B0];
            v29[1] = 3221225472;
            v29[2] = __66__PHAQuestionController__updateInvalidQuestionsWithProgressBlock___block_invoke;
            v29[3] = &unk_1E85216B8;
            v30 = v27;
            v31 = v9;
            v32 = v18;
            v28 = 0;
            v19 = objc_msgSend(v5, "performChangesAndWait:error:", v29, &v28);
            v26 = v28;
            if (v26)
            {
              if (__PXLog_genericOnceToken != -1)
                dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_246);
              v20 = (void *)__PXLog_genericOSLog;
              if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
              {
                v21 = v20;
                objc_msgSend(v26, "description");
                v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v39 = v24;
                _os_log_error_impl(&dword_1CAC16000, v21, OS_LOG_TYPE_ERROR, "[Questions] Error performing library changes to invalidate questions: %@", buf, 0xCu);

              }
            }
            else
            {
              v22 = CFSTR("NO");
              if (v19)
                v22 = CFSTR("YES");
              v25 = v22;
              if (__PXLog_genericOnceToken != -1)
                dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_248);
              v23 = __PXLog_genericOSLog;
              if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v39 = v25;
                _os_log_impl(&dword_1CAC16000, v23, OS_LOG_TYPE_INFO, "[Questions] Succeeded invalidating questions: %@", buf, 0xCu);
              }

            }
          }
          v4[2](v4, &v37, 1.0);
        }

      }
    }

  }
}

- (void)_syncAnsweredQuestionsWithProgressBlock:(id)a3
{
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  char *v31;
  double v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint32_t denom;
  uint32_t numer;
  NSObject *v48;
  NSObject *v49;
  os_signpost_id_t spid;
  uint64_t v51;
  void *v52;
  unint64_t v53;
  PHAQuestionController *v54;
  NSObject *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void (**v62)(id, _BYTE *, double);
  id obj;
  void *context;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  unsigned __int8 v69;
  mach_timebase_info info;
  _QWORD v71[8];
  _QWORD v72[8];
  uint8_t buf[4];
  const char *v74;
  __int16 v75;
  double v76;
  void *v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v62 = (void (**)(id, _BYTE *, double))a3;
  -[PHAQuestionController loggingConnection](self, "loggingConnection");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_generate(v4);
  info = 0;
  mach_timebase_info(&info);
  v6 = v4;
  v7 = v6;
  v53 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PhotosChallengeQuestionKVSSync", ", buf, 2u);
  }
  spid = v5;

  v51 = mach_absolute_time();
  v54 = self;
  -[PGManager photoLibrary](self->_graphManager, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("entityType != %d"), 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  v56 = v9;
  objc_msgSend(MEMORY[0x1E0CD1720], "fetchAnsweredQuestionsWithOptions:validQuestionsOnly:", v9, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  if (v12)
  {
    v13 = v12;
    v55 = v7;
    v69 = 0;
    v52 = v8;
    objc_msgSend(v8, "librarySpecificFetchOptions");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setFetchLimit:", 1);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = v11;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 1.0 / (double)v13;
      v17 = *(_QWORD *)v66;
      v18 = 0.0;
      v57 = *(_QWORD *)v66;
      v58 = v11;
LABEL_7:
      v19 = 0;
      v59 = v15;
      while (1)
      {
        if (*(_QWORD *)v66 != v17)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v19);
        v21 = (void *)MEMORY[0x1D1798448]();
        objc_msgSend(v20, "entityIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "entityType"))
        {
          if (objc_msgSend(v20, "entityType") != 3 && objc_msgSend(v20, "entityType") != 8)
            break;
        }
        if (objc_msgSend(v20, "type") == 18)
        {
          v23 = v22;
        }
        else
        {
          context = v21;
          v24 = (void *)MEMORY[0x1E0CD1390];
          objc_msgSend(v20, "entityIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = v25;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "fetchAssetsWithLocalIdentifiers:options:", v26, v60);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "firstObject");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v28, "cloudIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v23, "length"))
          {

LABEL_23:
            objc_msgSend(v20, "additionalInfo");
            v33 = objc_claimAutoreleasedReturnValue();
            v34 = (void *)v33;
            v35 = (void *)MEMORY[0x1E0C9AA70];
            if (v33)
              v35 = (void *)v33;
            v36 = v35;

            v72[0] = v23;
            v71[0] = CFSTR("syncedEntityIdentifier");
            v71[1] = CFSTR("type");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v20, "type"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v72[1] = v37;
            v71[2] = CFSTR("entityType");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v20, "entityType"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v72[2] = v38;
            v71[3] = CFSTR("state");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v20, "state"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v72[3] = v39;
            v71[4] = CFSTR("displayType");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v20, "displayType"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v72[4] = v40;
            v72[5] = v36;
            v71[5] = CFSTR("additionalInfo");
            v71[6] = CFSTR("score");
            v41 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v20, "score");
            objc_msgSend(v41, "numberWithDouble:");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v72[6] = v42;
            v71[7] = CFSTR("creationDate");
            objc_msgSend(v20, "creationDate");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v72[7] = v43;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 8);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v61, "addObject:", v44);
            v18 = v16 + v18;
            v62[2](v62, &v69, v18);
            LODWORD(v40) = v69;

            if ((_DWORD)v40)
            {

              objc_autoreleasePoolPop(context);
              v11 = v58;
              goto LABEL_35;
            }
            v11 = v58;
            v15 = v59;
            v17 = v57;
            v21 = context;
            goto LABEL_27;
          }
          if (__PXLog_genericOnceToken != -1)
            dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_252);
          v21 = context;
          v29 = (void *)__PXLog_genericOSLog;
          if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v30 = v29;
            objc_msgSend(v28, "uuid");
            v31 = (char *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "uuid");
            v32 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            *(_DWORD *)buf = 138412546;
            v74 = v31;
            v75 = 2112;
            v76 = v32;
            _os_log_impl(&dword_1CAC16000, v30, OS_LOG_TYPE_DEFAULT, "[Questions] cloudIdentifier not found for asset %@, not syncing question %@", buf, 0x16u);

          }
        }
LABEL_27:

        objc_autoreleasePoolPop(v21);
        if (v15 == ++v19)
        {
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
          if (v15)
            goto LABEL_7;
          goto LABEL_29;
        }
      }
      context = v21;
      v23 = v22;
      goto LABEL_23;
    }
LABEL_29:

    -[NSUbiquitousKeyValueStore setArray:forKey:](v54->_store, "setArray:forKey:", v61, CFSTR("PHQuestionKVSDataKey"));
    -[NSUbiquitousKeyValueStore synchronizeWithCompletionHandler:](v54->_store, "synchronizeWithCompletionHandler:", &__block_literal_global_270);
    v45 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v48 = v55;
    v49 = v48;
    if (v53 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CAC16000, v49, OS_SIGNPOST_INTERVAL_END, spid, "PhotosChallengeQuestionKVSSync", ", buf, 2u);
    }

    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v74 = "PhotosChallengeQuestionKVSSync";
      v75 = 2048;
      v76 = (float)((float)((float)((float)(v45 - v51) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CAC16000, v49, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
LABEL_35:

    v7 = v55;
    v8 = v52;
  }

}

- (void)_handleKVSQuestionsUpdateIfNeededWithProgressBlock:(id)a3
{
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  double v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  __int16 v21;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  unsigned __int16 v43;
  void *v44;
  unsigned __int16 v45;
  void *v46;
  unsigned __int16 v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  id v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  char v66;
  void *v67;
  NSObject *v68;
  void *v69;
  id v70;
  int v71;
  id v72;
  NSObject *v73;
  void *v74;
  NSObject *v75;
  void *v76;
  unsigned __int16 v77;
  int v78;
  uint64_t v79;
  int v80;
  id v81;
  void *v82;
  NSObject *v83;
  void *v84;
  __CFString *v85;
  NSObject *v86;
  uint64_t v87;
  uint32_t numer;
  uint32_t denom;
  NSObject *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id obj;
  void *v98;
  os_signpost_id_t spid;
  uint64_t v100;
  unint64_t v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  int v106;
  unsigned __int16 v107;
  unsigned __int16 v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  NSObject *v115;
  unsigned __int16 v116;
  PHAQuestionController *v117;
  uint64_t v118;
  void *v119;
  void (**v120)(id, _BYTE *, double);
  id v121;
  _QWORD v122[4];
  id v123;
  id v124;
  id v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  unsigned __int8 v142;
  mach_timebase_info info;
  uint8_t buf[4];
  _BYTE v145[20];
  __int16 v146;
  void *v147;
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  uint64_t v152;

  v152 = *MEMORY[0x1E0C80C00];
  v120 = (void (**)(id, _BYTE *, double))a3;
  -[PHAQuestionController loggingConnection](self, "loggingConnection");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_generate(v4);
  info = 0;
  mach_timebase_info(&info);
  v6 = v4;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PhotosChallengeQuestionKVSUpdate", ", buf, 2u);
  }

  v8 = mach_absolute_time();
  -[PHAQuestionController currentQuestionsKVSData](self, "currentQuestionsKVSData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  if (!v10)
    goto LABEL_108;
  v117 = self;
  v100 = v8;
  v101 = v5 - 1;
  spid = v5;
  v115 = v7;
  v142 = 0;
  v11 = 1.0 / (double)v10;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = 0u;
  v139 = 0u;
  v140 = 0u;
  v141 = 0u;
  v110 = v9;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v138, v151, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v139;
    v16 = 0.0;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v139 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * i);
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("syncedEntityIdentifier"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("entityType"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "unsignedIntValue");

        if (v19)
        {
          if ((v21 & 0xFFF7) == 0 || v21 == 3)
            objc_msgSend(v119, "addObject:", v19);
        }
        v16 = v16 + v11 * 0.1;
        v120[2](v120, &v142, v16);
        v23 = v142;

        if (v23)
        {
          v24 = v12;
          v7 = v115;
          goto LABEL_107;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v138, v151, 16);
      if (v14)
        continue;
      break;
    }
  }
  else
  {
    v16 = 0.0;
  }

  -[PGManager photoLibrary](v117->_graphManager, "photoLibrary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "librarySpecificFetchOptions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1E0CD1390];
  objc_msgSend(v119, "allObjects");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "fetchAssetsWithCloudIdentifiers:options:", v27, v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v28, "count"))
  {
    if (__PXLog_genericOnceToken != -1)
      dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_273);
    v29 = __PXLog_genericOSLog;
    if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v145 = v119;
      _os_log_impl(&dword_1CAC16000, v29, OS_LOG_TYPE_DEFAULT, "[Questions] No assets found with syncedEntityIdentifiers %@", buf, 0xCu);
    }
  }
  v120[2](v120, &v142, 0.2);
  v7 = v115;
  if (!v142)
  {
    v93 = v25;
    v96 = v24;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = 0u;
    v135 = 0u;
    v136 = 0u;
    v137 = 0u;
    v92 = v28;
    v31 = v28;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v134, v150, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v135;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v135 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * j);
          objc_msgSend(v36, "cloudIdentifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "uuid");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v38, v37);

        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v134, v150, 16);
      }
      while (v33);
    }

    v120[2](v120, &v142, 0.3);
    if (v142)
    {
LABEL_105:

      v7 = v115;
      v24 = v96;
      v28 = v92;
      v25 = v93;
      goto LABEL_106;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "librarySpecificFetchOptions");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = 0u;
    v131 = 0u;
    v132 = 0u;
    v133 = 0u;
    obj = v12;
    v104 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v149, 16);
    if (v104)
    {
      v103 = *(_QWORD *)v131;
      do
      {
        v39 = 0;
        do
        {
          if (*(_QWORD *)v131 != v103)
            objc_enumerationMutation(obj);
          v40 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * v39);
          v118 = MEMORY[0x1D1798448]();
          objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("syncedEntityIdentifier"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("type"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "unsignedIntValue");

          objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("entityType"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "unsignedIntValue");

          objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("state"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "unsignedIntValue");

          objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("additionalInfo"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("creationDate"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = v40;
          objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("score"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "doubleValue");
          v52 = v51;

          v53 = v41;
          v54 = v53;
          if ((v45 & 0xFFF7) != 0 && (v55 = (uint64_t)v53, v45 != 3)
            || (objc_msgSend(v30, "objectForKeyedSubscript:", v53),
                v55 = objc_claimAutoreleasedReturnValue(),
                v54,
                v55))
          {
            v107 = v45;
            v108 = v43;
            v116 = v47;
            v113 = v54;
            v114 = v49;
            v111 = v39;
            v112 = (void *)v55;
            v105 = v43;
            v106 = v45;
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type = %d AND entityType = %d AND entityIdentifier = %@"), v43, v45, v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "setPredicate:", v56);

            objc_msgSend(MEMORY[0x1E0CD1720], "fetchQuestionsWithOptions:validQuestionsOnly:", v102, 0);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v126 = 0u;
            v127 = 0u;
            v128 = 0u;
            v129 = 0u;
            v58 = v57;
            v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v126, v148, 16);
            if (v59)
            {
              v60 = v59;
              v61 = *(_QWORD *)v127;
LABEL_47:
              v62 = 0;
              while (1)
              {
                if (*(_QWORD *)v127 != v61)
                  objc_enumerationMutation(v58);
                v63 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * v62);
                objc_msgSend(v63, "additionalInfo");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                if (!objc_msgSend(v64, "count") && !objc_msgSend(v48, "count"))
                  break;
                objc_msgSend(v63, "additionalInfo");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v66 = objc_msgSend(v65, "isEqualToDictionary:", v48);

                if ((v66 & 1) != 0)
                  goto LABEL_62;
                if (v60 == ++v62)
                {
                  v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v126, v148, 16);
                  if (v60)
                    goto LABEL_47;
                  goto LABEL_55;
                }
              }

LABEL_62:
              v70 = v63;

              if (!v70)
                goto LABEL_70;
              v71 = objc_msgSend(v70, "state");
              v67 = (void *)v118;
              v49 = v114;
              if (!v116 || v71 == v116)
              {
                v69 = v112;
                goto LABEL_76;
              }
              objc_msgSend(v70, "uuid");
              v72 = (id)objc_claimAutoreleasedReturnValue();
              if (__PXLog_genericOnceToken != -1)
                dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_279);
              v69 = v112;
              v73 = __PXLog_genericOSLog;
              if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v145 = v72;
                _os_log_impl(&dword_1CAC16000, v73, OS_LOG_TYPE_INFO, "[Questions] Updating question state for question %@", buf, 0xCu);
              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v116);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "setObject:forKeyedSubscript:", v74, v72);

              objc_msgSend(v95, "addObject:", v70);
            }
            else
            {
LABEL_55:

LABEL_70:
              v67 = (void *)v118;
              v49 = v114;
              if (__PXLog_genericOnceToken != -1)
                dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_281);
              v69 = v112;
              v75 = __PXLog_genericOSLog;
              if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109890;
                *(_DWORD *)v145 = v105;
                *(_WORD *)&v145[4] = 2112;
                *(_QWORD *)&v145[6] = v112;
                *(_WORD *)&v145[14] = 1024;
                *(_DWORD *)&v145[16] = v106;
                v146 = 2112;
                v147 = v48;
                _os_log_impl(&dword_1CAC16000, v75, OS_LOG_TYPE_INFO, "[Questions] Syncing new question of type %d with entity identifier: %@ for entity type: %d and additionalInfo: %@", buf, 0x22u);
              }
              objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("displayType"));
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              v77 = objc_msgSend(v76, "unsignedIntValue");

              v72 = objc_alloc_init(MEMORY[0x1E0D76260]);
              objc_msgSend(v72, "setEntityIdentifier:", v112);
              objc_msgSend(v72, "setType:", v108);
              objc_msgSend(v72, "setState:", v116);
              objc_msgSend(v72, "setEntityType:", v107);
              objc_msgSend(v72, "setDisplayType:", v77);
              objc_msgSend(v72, "setScore:", v52);
              objc_msgSend(v72, "setAdditionalInfo:", v48);
              objc_msgSend(v72, "setCreationDate:", v114);
              objc_msgSend(v98, "addObject:", v72);
              v70 = 0;
            }

LABEL_76:
            v16 = v16 + v11 * 0.6;
            v120[2](v120, &v142, v16);
            v78 = v142;

            if (v78)
            {

              objc_autoreleasePoolPop(v67);
              goto LABEL_104;
            }
            v39 = v111;
            v54 = v113;
          }
          else
          {
            if (__PXLog_genericOnceToken != -1)
              dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_275);
            v67 = (void *)v118;
            v68 = __PXLog_genericOSLog;
            if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v145 = v54;
              _os_log_impl(&dword_1CAC16000, v68, OS_LOG_TYPE_DEFAULT, "[Questions] No entityIdentifier found for asset syncedEntityIdentifier %@", buf, 0xCu);
            }
            v69 = 0;
          }

          objc_autoreleasePoolPop(v67);
          ++v39;
        }
        while (v39 != v104);
        v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v149, 16);
        v104 = v79;
      }
      while (v79);
    }

    if (!objc_msgSend(v98, "count") && !objc_msgSend(v95, "count"))
    {
LABEL_98:
      v87 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v90 = v115;
      v91 = v90;
      if (v101 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v90))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CAC16000, v91, OS_SIGNPOST_INTERVAL_END, spid, "PhotosChallengeQuestionKVSUpdate", ", buf, 2u);
      }

      if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v145 = "PhotosChallengeQuestionKVSUpdate";
        *(_WORD *)&v145[8] = 2048;
        *(double *)&v145[10] = (float)((float)((float)((float)(v87 - v100) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1CAC16000, v91, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      v120[2](v120, &v142, 1.0);
LABEL_104:

      goto LABEL_105;
    }
    v122[0] = MEMORY[0x1E0C809B0];
    v122[1] = 3221225472;
    v122[2] = __76__PHAQuestionController__handleKVSQuestionsUpdateIfNeededWithProgressBlock___block_invoke_283;
    v122[3] = &unk_1E85216B8;
    v123 = v95;
    v124 = v94;
    v125 = v98;
    v121 = 0;
    v80 = objc_msgSend(v96, "performChangesAndWait:error:", v122, &v121);
    v81 = v121;
    if (v81)
    {
      if (__PXLog_genericOnceToken != -1)
        dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_284);
      v82 = (void *)__PXLog_genericOSLog;
      if (!os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
        goto LABEL_97;
      v83 = v82;
      objc_msgSend(v81, "description");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v145 = v84;
      _os_log_error_impl(&dword_1CAC16000, v83, OS_LOG_TYPE_ERROR, "[Questions] Error performing library changes for updated questions: %@", buf, 0xCu);

    }
    else
    {
      v85 = CFSTR("NO");
      if (v80)
        v85 = CFSTR("YES");
      v83 = v85;
      if (__PXLog_genericOnceToken != -1)
        dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_286);
      v86 = __PXLog_genericOSLog;
      if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v145 = v83;
        _os_log_impl(&dword_1CAC16000, v86, OS_LOG_TYPE_INFO, "[Questions] Succeeded updating questions: %@", buf, 0xCu);
      }
    }

LABEL_97:
    goto LABEL_98;
  }
LABEL_106:

LABEL_107:
  v9 = v110;

LABEL_108:
}

- (id)currentQuestionsKVSData
{
  return -[NSUbiquitousKeyValueStore arrayForKey:](self->_store, "arrayForKey:", CFSTR("PHQuestionKVSDataKey"));
}

- (void)removeCurrentKVSData
{
  -[NSUbiquitousKeyValueStore removeObjectForKey:](self->_store, "removeObjectForKey:", CFSTR("PHQuestionKVSDataKey"));
  -[NSUbiquitousKeyValueStore synchronize](self->_store, "synchronize");
}

- (PGManager)graphManager
{
  return self->_graphManager;
}

- (void)setGraphManager:(id)a3
{
  objc_storeStrong((id *)&self->_graphManager, a3);
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (PGTrialSession)trialSession
{
  return self->_trialSession;
}

- (void)setTrialSession:(id)a3
{
  objc_storeStrong((id *)&self->_trialSession, a3);
}

- (NSMutableDictionary)questionTypeImportanceByQuestionType
{
  return self->_questionTypeImportanceByQuestionType;
}

- (void)setQuestionTypeImportanceByQuestionType:(id)a3
{
  objc_storeStrong((id *)&self->_questionTypeImportanceByQuestionType, a3);
}

- (NSUbiquitousKeyValueStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_questionTypeImportanceByQuestionType, 0);
  objc_storeStrong((id *)&self->_trialSession, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_graphManager, 0);
}

void __76__PHAQuestionController__handleKVSQuestionsUpdateIfNeededWithProgressBlock___block_invoke_283(uint64_t a1)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int16 v13;
  uint64_t j;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  unint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  v4 = 0x1E0CD1000uLL;
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v37 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CD1728], "changeRequestForQuestion:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(a1 + 40);
        objc_msgSend(v8, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "unsignedIntValue");

        objc_msgSend(v9, "setState:", v13);
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v5);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = *(id *)(a1 + 48);
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v33 != v29)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        v31 = *(void **)(v4 + 1832);
        objc_msgSend(v15, "entityIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "type");
        v18 = objc_msgSend(v15, "state");
        v19 = objc_msgSend(v15, "entityType");
        v20 = objc_msgSend(v15, "displayType");
        objc_msgSend(v15, "score");
        v22 = v21;
        objc_msgSend(v15, "additionalInfo");
        v23 = v4;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "creationDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LOWORD(v27) = objc_msgSend(v15, "questionVersion");
        v26 = (id)objc_msgSend(v31, "creationRequestForQuestionWithEntityIdentifier:type:state:entityType:displayType:score:additionalInfo:creationDate:questionVersion:", v16, v17, v18, v19, v20, v24, v22, v25, v27);

        v4 = v23;
      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v30);
  }

}

void __76__PHAQuestionController__handleKVSQuestionsUpdateIfNeededWithProgressBlock___block_invoke_285()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __76__PHAQuestionController__handleKVSQuestionsUpdateIfNeededWithProgressBlock___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __76__PHAQuestionController__handleKVSQuestionsUpdateIfNeededWithProgressBlock___block_invoke_280()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __76__PHAQuestionController__handleKVSQuestionsUpdateIfNeededWithProgressBlock___block_invoke_278()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __76__PHAQuestionController__handleKVSQuestionsUpdateIfNeededWithProgressBlock___block_invoke_274()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __76__PHAQuestionController__handleKVSQuestionsUpdateIfNeededWithProgressBlock___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __65__PHAQuestionController__syncAnsweredQuestionsWithProgressBlock___block_invoke_268(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    if (__PXLog_genericOnceToken != -1)
      dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_271);
    v3 = (void *)__PXLog_genericOSLog;
    if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_error_impl(&dword_1CAC16000, v4, OS_LOG_TYPE_ERROR, "[Questions] Store synchronize error: %@", (uint8_t *)&v6, 0xCu);

    }
  }

}

void __65__PHAQuestionController__syncAnsweredQuestionsWithProgressBlock___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __65__PHAQuestionController__syncAnsweredQuestionsWithProgressBlock___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __66__PHAQuestionController__updateInvalidQuestionsWithProgressBlock___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v8 = *(void **)(a1 + 40);
        objc_msgSend(v7, "uuid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v8) = objc_msgSend(v8, "containsObject:", v9);

        if ((v8 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CD1728], "changeRequestForQuestion:", v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setState:", 4);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v4);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = *(id *)(a1 + 48);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(MEMORY[0x1E0CD1728], "changeRequestForQuestion:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setState:", 0);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

}

void __66__PHAQuestionController__updateInvalidQuestionsWithProgressBlock___block_invoke_247()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __66__PHAQuestionController__updateInvalidQuestionsWithProgressBlock___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

uint64_t __77__PHAQuestionController__handleQuestionVersionBumpIfNeededWithProgressBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CD1728], "deleteQuestions:", *(_QWORD *)(a1 + 32));
}

void __77__PHAQuestionController__handleQuestionVersionBumpIfNeededWithProgressBlock___block_invoke_244()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __77__PHAQuestionController__handleQuestionVersionBumpIfNeededWithProgressBlock___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __50__PHAQuestionController_importanceOfQuestionType___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __42__PHAQuestionController_persistQuestions___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "persistWithCreationDate:questionVersion:", *(_QWORD *)(a1 + 40), *(__int16 *)(*(_QWORD *)(a1 + 48) + 8), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __42__PHAQuestionController_persistQuestions___block_invoke_207()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __42__PHAQuestionController_persistQuestions___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __48__PHAQuestionController_assignScoreToQuestions___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  double v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "sortUsingDescriptors:", *(_QWORD *)(a1 + 32));
  v4 = objc_msgSend(v9, "count");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 1.0 / (double)(unint64_t)(v4 + 1);
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setScore:", v7 * (double)v5);

      ++v6;
      --v5;
    }
    while (v5);
  }

}

uint64_t __86__PHAQuestionController_selectedQuestionsFromSortedQuestionsByQuestionType_withLimit___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "importanceOfQuestionType:", a2);
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "importanceOfQuestionType:", v6);
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "compare:", v12);

  return v13;
}

uint64_t __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 48) + a3 * 0.1);
  if (*a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_173(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 48) + a3 * 0.1);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *a2;
  return result;
}

uint64_t __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_176(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 48) + a3 * 0.1);
  if (*a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_179(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 48) + a3 * 0.1);
  if (*a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_184(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 48) + a3 * *(double *)(a1 + 56));
  if (*a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

void __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_194()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_192()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_2_185()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_182()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_2_180()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_2_177()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_2_174()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

uint64_t __63__PHAQuestionController_generateQuestionsWithOptions_progress___block_invoke(_QWORD *a1, _BYTE *a2, double a3)
{
  uint64_t result;

  *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = *(double *)(*(_QWORD *)(a1[5] + 8) + 24) + a3 * 0.1;
  result = (*(uint64_t (**)(double))(a1[4] + 16))(*(double *)(*(_QWORD *)(a1[5] + 8) + 24));
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *a2;
  return result;
}

uint64_t __63__PHAQuestionController_generateQuestionsWithOptions_progress___block_invoke_165(_QWORD *a1, _BYTE *a2, double a3)
{
  uint64_t result;

  *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = *(double *)(*(_QWORD *)(a1[5] + 8) + 24) + a3 * 0.1;
  result = (*(uint64_t (**)(double))(a1[4] + 16))(*(double *)(*(_QWORD *)(a1[5] + 8) + 24));
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *a2;
  return result;
}

uint64_t __63__PHAQuestionController_generateQuestionsWithOptions_progress___block_invoke_171(uint64_t a1, double a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + a2 * 0.8;
  return (*(uint64_t (**)(_QWORD, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __63__PHAQuestionController_generateQuestionsWithOptions_progress___block_invoke_169()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __63__PHAQuestionController_generateQuestionsWithOptions_progress___block_invoke_2_166()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __63__PHAQuestionController_generateQuestionsWithOptions_progress___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

@end
