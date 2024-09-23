@implementation PGWallpaperQuestionFactory

+ (BOOL)isHighRecallLandscapeAsset:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "sceneClassifications");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "extendedSceneIdentifier", (_QWORD)v12) == 2147481597)
        {
          objc_msgSend(v3, "curationModel");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "cityNatureModel");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "natureNode");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v5) = objc_msgSend(v10, "passesHighRecallWithSignal:", v8);

          goto LABEL_11;
        }
      }
      v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v5;
}

+ (BOOL)isHighRecallCityscapeAsset:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "clsSceneClassifications");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "extendedSceneIdentifier", (_QWORD)v12) == 2147481598)
        {
          objc_msgSend(v3, "curationModel");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "cityNatureModel");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "cityNode");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v5) = objc_msgSend(v10, "passesHighRecallWithSignal:", v8);

          goto LABEL_11;
        }
      }
      v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v5;
}

- (unsigned)questionType
{
  return 22;
}

- (int64_t)questionOptions
{
  return 256;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  uint32_t denom;
  uint32_t numer;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  mach_timebase_info info;
  uint8_t buf[4];
  _BYTE v35[18];
  __int16 v36;
  unint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D42A58], "progressReporterWithProgressBlock:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v35 = 58;
      *(_WORD *)&v35[4] = 2080;
      *(_QWORD *)&v35[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[PGSurveyQuestionFactory workingContext](self, "workingContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loggingConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      v32 = v9;
      v10 = v9;
      v11 = os_signpost_id_generate(v10);
      v12 = v10;
      v13 = v12;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "WallpaperQuestionGeneration", ", buf, 2u);
      }

      info = 0;
      mach_timebase_info(&info);
      v29 = mach_absolute_time();
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3 >= 4)
        v15 = 4;
      else
        v15 = a3;
      objc_msgSend(v6, "childProgressReporterFromStart:toEnd:", 0.0, 0.4);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGWallpaperQuestionFactory _generateTruePositiveQuestionsWithLimit:progressReporter:](self, "_generateTruePositiveQuestionsWithLimit:progressReporter:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "unionSet:", v16);
      v17 = a3 - objc_msgSend(v16, "count");
      objc_msgSend(v6, "childProgressReporterFromStart:toEnd:", 0.4, 1.0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGWallpaperQuestionFactory _generateQuestionsWithLimit:progressReporter:](self, "_generateQuestionsWithLimit:progressReporter:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "unionSet:", v18);
      v19 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v22 = v13;
      v23 = v22;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v23, OS_SIGNPOST_INTERVAL_END, v11, "WallpaperQuestionGeneration", ", buf, 2u);
      }

      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v35 = "WallpaperQuestionGeneration";
        *(_WORD *)&v35[8] = 2048;
        *(double *)&v35[10] = (float)((float)((float)((float)(v19 - v29) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v23, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      if (objc_msgSend(v6, "isCancelledWithProgress:", 1.0))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v35 = 85;
          *(_WORD *)&v35[4] = 2080;
          *(_QWORD *)&v35[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v7 = (void *)MEMORY[0x1E0C9AA60];
      }
      else
      {
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "loggingConnection");
        v25 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = objc_msgSend(v16, "count");
          v27 = objc_msgSend(v18, "count");
          *(_DWORD *)buf = 134218496;
          *(_QWORD *)v35 = v26;
          *(_WORD *)&v35[8] = 2048;
          *(_QWORD *)&v35[10] = v27;
          v36 = 2048;
          v37 = a3;
          _os_log_impl(&dword_1CA237000, v25, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Generated %lu true positive, %lu regular wallpaper questions, limit %lu", buf, 0x20u);
        }

        objc_msgSend(v14, "allObjects");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v9 = v32;
    }
    else
    {
      if (objc_msgSend(v6, "isCancelledWithProgress:", 1.0)
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v35 = 63;
        *(_WORD *)&v35[4] = 2080;
        *(_QWORD *)&v35[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v7 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  return v7;
}

- (id)_generateTruePositiveQuestionsWithLimit:(unint64_t)a3 progressReporter:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  PGSuggestionSession *v10;
  void *v11;
  PGSuggestionSession *v12;
  void *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint32_t denom;
  uint32_t numer;
  NSObject *v33;
  NSObject *v34;
  int v35;
  void *v36;
  _BOOL4 v37;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  PGSuggestionSession *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  mach_timebase_info info;
  uint8_t buf[4];
  _BYTE v51[18];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loggingConnection");
  v8 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v51 = a3;
    _os_log_impl(&dword_1CA237000, v8, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Generating true positive wallpaper questions with limit: %lu", buf, 0xCu);
  }

  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v48 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = [PGSuggestionSession alloc];
  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PGSuggestionSession initWithProfile:workingContext:](v10, "initWithProfile:workingContext:", 2, v11);

  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "loggingConnection");
  v14 = objc_claimAutoreleasedReturnValue();

  v15 = os_signpost_id_generate(v14);
  v16 = v14;
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "TruePositiveWallpaperQuestionGeneration", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v46 = mach_absolute_time();
  objc_msgSend(v6, "childProgressReporterFromStart:toEnd:", 0.01, 0.24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGWallpaperQuestionFactory _generateTruePositivePeopleQuestionWithLimit:suggestionSession:alreadyGeneratedQuestions:progressReporter:](self, "_generateTruePositivePeopleQuestionWithLimit:suggestionSession:alreadyGeneratedQuestions:progressReporter:", a3, v12, v9, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(v9, "unionSet:", v19);
    objc_msgSend(v48, "setObject:forKeyedSubscript:", v19, &unk_1E84E3650);
  }
  if (objc_msgSend(v6, "isCancelledWithProgress:", 0.25))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v51 = 112;
      *(_WORD *)&v51[4] = 2080;
      *(_QWORD *)&v51[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v20 = v47;
    v21 = v47;
  }
  else
  {
    v44 = v18;
    objc_msgSend(v6, "childProgressReporterFromStart:toEnd:", 0.25, 0.49);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGWallpaperQuestionFactory _generateTruePositivePetQuestionWithLimit:suggestionSession:alreadyGeneratedQuestions:progressReporter:](self, "_generateTruePositivePetQuestionWithLimit:suggestionSession:alreadyGeneratedQuestions:progressReporter:", a3, v12, v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "count"))
    {
      objc_msgSend(v9, "unionSet:", v22);
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v22, &unk_1E84E3668);
    }
    if (objc_msgSend(v6, "isCancelledWithProgress:", 0.5))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v51 = 121;
        *(_WORD *)&v51[4] = 2080;
        *(_QWORD *)&v51[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v20 = v47;
      v21 = v47;
    }
    else
    {
      objc_msgSend(v6, "childProgressReporterFromStart:toEnd:", 0.5, 0.74);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v12;
      -[PGWallpaperQuestionFactory _generateTruePositiveLandscapeQuestionWithLimit:suggestionSession:alreadyGeneratedQuestions:progressReporter:](self, "_generateTruePositiveLandscapeQuestionWithLimit:suggestionSession:alreadyGeneratedQuestions:progressReporter:", a3, v12, v9);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "count"))
      {
        objc_msgSend(v9, "unionSet:", v23);
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v23, &unk_1E84E3680);
      }
      if (objc_msgSend(v6, "isCancelledWithProgress:", 0.75))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v51 = 130;
          *(_WORD *)&v51[4] = 2080;
          *(_QWORD *)&v51[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v20 = v47;
        v21 = v47;
      }
      else
      {
        v41 = v17;
        objc_msgSend(v6, "childProgressReporterFromStart:toEnd:", 0.75, 0.99);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGWallpaperQuestionFactory _generateTruePositiveCityscapeQuestionWithLimit:suggestionSession:alreadyGeneratedQuestions:progressReporter:](self, "_generateTruePositiveCityscapeQuestionWithLimit:suggestionSession:alreadyGeneratedQuestions:progressReporter:", a3, v43, v9);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "count"))
        {
          objc_msgSend(v9, "unionSet:", v24);
          objc_msgSend(v48, "setObject:forKeyedSubscript:", v24, &unk_1E84E3698);
        }
        v39 = v24;
        v25 = v9;
        if (objc_msgSend(v25, "count") > a3)
        {
          -[PGWallpaperQuestionFactory evenlySelectQuestionsByType:limit:](self, "evenlySelectQuestionsByType:limit:", v48, a3);
          v26 = objc_claimAutoreleasedReturnValue();

          v25 = (id)v26;
        }
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "loggingConnection");
        v28 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = objc_msgSend(v25, "count");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)v51 = v29;
          _os_log_impl(&dword_1CA237000, v28, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Generated %lu true positive wallpaper questions.", buf, 0xCu);
        }

        v30 = mach_absolute_time();
        numer = info.numer;
        denom = info.denom;
        v33 = v41;
        v34 = v33;
        if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v34, OS_SIGNPOST_INTERVAL_END, v15, "TruePositiveWallpaperQuestionGeneration", ", buf, 2u);
        }

        v20 = v47;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v51 = "TruePositiveWallpaperQuestionGeneration";
          *(_WORD *)&v51[8] = 2048;
          *(double *)&v51[10] = (float)((float)((float)((float)(v30 - v46) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1CA237000, v34, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
        v35 = objc_msgSend(v6, "isCancelledWithProgress:", 1.0);
        v36 = v25;
        if (v35)
        {
          v37 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO);
          v36 = v47;
          if (v37)
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v51 = 148;
            *(_WORD *)&v51[4] = 2080;
            *(_QWORD *)&v51[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            v36 = v47;
          }
        }
        v21 = v36;

        v17 = v41;
      }

      v12 = v43;
    }

    v18 = v44;
  }

  return v21;
}

- (id)evenlySelectQuestionsByType:(id)a3 limit:(unint64_t)a4
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v21 = 0;
  v22 = 0;
  v18 = 0;
  v20 = 0;
  v7 = 0;
  while (1)
  {
    objc_msgSend(v5, "allKeys", v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sortedArrayUsingSelector:", sel_compare_);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "anyObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v6, "addObject:", v12);
      objc_msgSend(v11, "removeObject:", v12);
    }
    if (objc_msgSend(v11, "count"))
      ++v7;
    else
      objc_msgSend(v5, "removeObjectForKey:", v10);
    v13 = objc_msgSend(v5, "count");
    switch((unsigned __int16)objc_msgSend(v10, "unsignedIntValue"))
    {
      case 0x28Cu:
        ++v19;
        break;
      case 0x28Du:
        ++v20;
        break;
      case 0x28Eu:
        ++v21;
        break;
      case 0x28Fu:
        ++v22;
        break;
      default:
        break;
    }
    if (objc_msgSend(v6, "count", v19) == a4)
      break;
    v7 %= v13;
    v14 = objc_msgSend(v5, "count");

    if (!v14)
      goto LABEL_16;
  }

LABEL_16:
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "loggingConnection");
  v16 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219008;
    v24 = objc_msgSend(v6, "count");
    v25 = 2048;
    v26 = v18;
    v27 = 2048;
    v28 = v20;
    v29 = 2048;
    v30 = v21;
    v31 = 2048;
    v32 = v22;
    _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Selected %lu true positive questions. People:%lu, Pet:%lu, Landscape:%lu, Cityscape:%lu", buf, 0x34u);
  }

  return v6;
}

- (id)_generateTruePositivePeopleQuestionWithLimit:(unint64_t)a3 suggestionSession:(id)a4 alreadyGeneratedQuestions:(id)a5 progressReporter:(id)a6
{
  int v8;
  PGPeopleWallpaperSuggester *v9;
  char v10;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  PGWallpaperQuestion *v28;
  void *v29;
  PGWallpaperQuestion *v30;
  void *v31;
  NSObject *v32;
  id v33;
  void *v34;
  int v35;
  char v36;
  NSObject *v37;
  uint64_t v38;
  char v39;
  PGPeopleWallpaperSuggester *v40;
  void *v41;
  id obj;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *context;
  uint64_t v54;
  id v55;
  PGSinglePersonWallpaperAssetSuggester *v56;
  id v57;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[4];
  id v67;
  uint64_t *v68;
  uint8_t *v69;
  double v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[4];
  id v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  char v81;
  uint8_t v82[4];
  _BYTE v83[18];
  _BYTE v84[128];
  uint8_t v85[128];
  uint8_t buf[8];
  __int128 v87;
  uint64_t v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v49 = a4;
  v60 = a5;
  v78 = 0;
  v79 = &v78;
  v80 = 0x2020000000;
  v81 = 0;
  v50 = a6;
  v8 = objc_msgSend(v50, "isCancelledWithProgress:", 0.0);
  *((_BYTE *)v79 + 24) = v8;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = 212;
      LOWORD(v87) = 2080;
      *(_QWORD *)((char *)&v87 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v57 = 0;
    goto LABEL_12;
  }
  v9 = -[PGPeopleWallpaperSuggester initWithSession:]([PGPeopleWallpaperSuggester alloc], "initWithSession:", v49);
  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = __136__PGWallpaperQuestionFactory__generateTruePositivePeopleQuestionWithLimit_suggestionSession_alreadyGeneratedQuestions_progressReporter___block_invoke;
  v75[3] = &unk_1E84301E0;
  v77 = &v78;
  v48 = v50;
  v76 = v48;
  v40 = v9;
  -[PGPeopleWallpaperSuggester personLocalIdentifiersByOriginalPersonLocalIdentifierWithProgress:](v9, "personLocalIdentifiersByOriginalPersonLocalIdentifierWithProgress:", v75);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((_BYTE *)v79 + 24))
  {
    *((_BYTE *)v79 + 24) = 1;
LABEL_8:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = 221;
      LOWORD(v87) = 2080;
      *(_QWORD *)((char *)&v87 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v57 = 0;
    goto LABEL_11;
  }
  v10 = objc_msgSend(v48, "isCancelledWithProgress:", 0.5);
  *((_BYTE *)v79 + 24) = v10;
  if ((v10 & 1) != 0)
    goto LABEL_8;
  objc_msgSend(v49, "curationContext");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&v87 = buf;
  *((_QWORD *)&v87 + 1) = 0x2020000000;
  v88 = 0x3FE0000000000000;
  v12 = objc_msgSend(v41, "count");
  v61 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0D77EF8], "randomNumberGeneratorForWallpaperDonation");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PFShuffledArrayWithRandomNumberGenerator();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "loggingConnection");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = v14;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
  if (!v16)
    goto LABEL_46;
  v17 = 0.5 / (double)v12;
  v44 = *(_QWORD *)v72;
  v18 = v16;
  do
  {
    v54 = 0;
    v43 = v18;
    do
    {
      if (*(_QWORD *)v72 != v44)
        objc_enumerationMutation(obj);
      v19 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * v54);
      context = (void *)MEMORY[0x1CAA4EB2C]();
      v56 = -[PGSinglePersonWallpaperAssetSuggester initWithPersonLocalIdentifiers:curationContext:loggingConnection:]([PGSinglePersonWallpaperAssetSuggester alloc], "initWithPersonLocalIdentifiers:curationContext:loggingConnection:", v19, v46, v45);
      +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGSinglePersonWallpaperAssetSuggester setAssetFetchPropertySets:](v56, "setAssetFetchPropertySets:", v20);

      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = __136__PGWallpaperQuestionFactory__generateTruePositivePeopleQuestionWithLimit_suggestionSession_alreadyGeneratedQuestions_progressReporter___block_invoke_216;
      v66[3] = &unk_1E842A7F0;
      v68 = &v78;
      v55 = v48;
      v67 = v55;
      v69 = buf;
      v70 = v17;
      -[PGSinglePersonWallpaperAssetSuggester unsortedCandidatesFromPersonLocalIdentifiers:progressBlock:](v56, "unsortedCandidatesFromPersonLocalIdentifiers:progressBlock:", v19, v66);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      PFShuffledArrayWithRandomNumberGenerator();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGSinglePersonWallpaperAssetSuggester assetsFromCandidates:](v56, "assetsFromCandidates:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v22 = v21;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v62, v84, 16);
      if (!v23)
        goto LABEL_41;
      v24 = *(_QWORD *)v63;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v63 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v25);
          v27 = (void *)MEMORY[0x1CAA4EB2C]();
          v28 = [PGWallpaperQuestion alloc];
          objc_msgSend(v26, "uuid");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = -[PGWallpaperQuestion initWithAssetUUID:suggestionSubtype:](v28, "initWithAssetUUID:suggestionSubtype:", v29, 652);

          if (-[PGSurveyQuestionFactory shouldAddQuestion:toAlreadyGeneratedQuestions:](self, "shouldAddQuestion:toAlreadyGeneratedQuestions:", v30, v60))
          {
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "loggingConnection");
            v32 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              PHSuggestionStringWithSubtype();
              v33 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "uuid");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v82 = 138412546;
              *(_QWORD *)v83 = v33;
              *(_WORD *)&v83[8] = 2112;
              *(_QWORD *)&v83[10] = v34;
              _os_log_impl(&dword_1CA237000, v32, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Elected True Positive %@ question with asset %@", v82, 0x16u);

            }
            objc_msgSend(v61, "addObject:", v30);
            if (objc_msgSend(v61, "count") == a3)
            {
              if (*((_BYTE *)v79 + 24))
              {
                *((_BYTE *)v79 + 24) = 1;
              }
              else
              {
                v36 = objc_msgSend(v55, "isCancelledWithProgress:", 1.0);
                *((_BYTE *)v79 + 24) = v36;
                if ((v36 & 1) == 0)
                {
                  v57 = v61;
                  v35 = 1;
                  goto LABEL_35;
                }
              }
              v35 = 1;
              v37 = MEMORY[0x1E0C81028];
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v82 = 67109378;
                *(_DWORD *)v83 = 254;
                *(_WORD *)&v83[4] = 2080;
                *(_QWORD *)&v83[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
                _os_log_impl(&dword_1CA237000, v37, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v82, 0x12u);
              }
              v57 = 0;
            }
            else
            {
              v35 = 0;
            }
          }
          else
          {
            v35 = 5;
          }
LABEL_35:

          objc_autoreleasePoolPop(v27);
          if (v35 != 5 && v35)
          {

            goto LABEL_43;
          }
          ++v25;
        }
        while (v23 != v25);
        v38 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v62, v84, 16);
        v23 = v38;
      }
      while (v38);
LABEL_41:

      v35 = 0;
      *(double *)(v87 + 24) = v17 + *(double *)(v87 + 24);
LABEL_43:

      objc_autoreleasePoolPop(context);
      if (v35)
      {

        goto LABEL_53;
      }
      ++v54;
    }
    while (v54 != v43);
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
  }
  while (v18);
LABEL_46:

  if (*((_BYTE *)v79 + 24))
  {
    *((_BYTE *)v79 + 24) = 1;
    goto LABEL_50;
  }
  v39 = objc_msgSend(v48, "isCancelledWithProgress:", 1.0);
  *((_BYTE *)v79 + 24) = v39;
  if ((v39 & 1) != 0)
  {
LABEL_50:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v82 = 67109378;
      *(_DWORD *)v83 = 261;
      *(_WORD *)&v83[4] = 2080;
      *(_QWORD *)&v83[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v82, 0x12u);
    }
    v57 = 0;
  }
  else
  {
    v57 = v61;
  }
LABEL_53:

  _Block_object_dispose(buf, 8);
LABEL_11:

LABEL_12:
  _Block_object_dispose(&v78, 8);

  return v57;
}

- (id)_generateTruePositivePetQuestionWithLimit:(unint64_t)a3 suggestionSession:(id)a4 alreadyGeneratedQuestions:(id)a5 progressReporter:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  PGPetWallpaperSuggester *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  PGWallpaperQuestion *v34;
  void *v35;
  PGWallpaperQuestion *v36;
  PGWallpaperQuestionFactory *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  int v42;
  NSObject *v43;
  id v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  PGPetWallpaperSuggester *v54;
  char v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v59;
  id v61;
  id obj;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[4];
  _BYTE v72[18];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (!objc_msgSend(v11, "isCancelledWithProgress:", 0.0))
  {
    v13 = -[PGPetWallpaperSuggester initWithSession:]([PGPetWallpaperSuggester alloc], "initWithSession:", v9);
    v61 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(MEMORY[0x1E0D77EF8], "randomNumberGeneratorForWallpaperDonation");
    v14 = objc_claimAutoreleasedReturnValue();
    v54 = v13;
    -[PGPetWallpaperSuggester fetchPets](v13, "fetchPets");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc(MEMORY[0x1E0C99D20]);
    v47 = v15;
    objc_msgSend(v15, "fetchedObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithArray:", v17);
    v53 = (void *)v14;
    PFShuffledArrayWithRandomNumberGenerator();
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "isCancelledWithProgress:", 0.5))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v72 = 277;
        *(_WORD *)&v72[4] = 2080;
        *(_QWORD *)&v72[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v12 = 0;
      goto LABEL_48;
    }
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v46 = v19;
    v20 = v19;
    v52 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    if (v52)
    {
      v59 = v10;
      v45 = v9;
      v55 = 0;
      v51 = *(_QWORD *)v68;
      v49 = v20;
      v50 = v11;
      while (2)
      {
        for (i = 0; i != v52; ++i)
        {
          if (*(_QWORD *)v68 != v51)
            objc_enumerationMutation(v20);
          v22 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
          v23 = (void *)MEMORY[0x1CAA4EB2C]();
          -[PGPetWallpaperSuggester candidatesForPet:](v54, "candidatesForPet:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          PFShuffledArrayWithRandomNumberGenerator();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          obj = v25;
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
          v27 = v59;
          if (v26)
          {
            v28 = v26;
            v56 = v24;
            v57 = v23;
            v58 = i;
            v29 = *(_QWORD *)v64;
            while (2)
            {
              for (j = 0; j != v28; ++j)
              {
                if (*(_QWORD *)v64 != v29)
                  objc_enumerationMutation(obj);
                v31 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
                v32 = (void *)MEMORY[0x1CAA4EB2C]();
                objc_msgSend(v31, "asset");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = [PGWallpaperQuestion alloc];
                objc_msgSend(v33, "uuid");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = -[PGWallpaperQuestion initWithAssetUUID:suggestionSubtype:](v34, "initWithAssetUUID:suggestionSubtype:", v35, 653);

                if (-[PGSurveyQuestionFactory shouldAddQuestion:toAlreadyGeneratedQuestions:](self, "shouldAddQuestion:toAlreadyGeneratedQuestions:", v36, v27))
                {
                  v37 = self;
                  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "loggingConnection");
                  v39 = objc_claimAutoreleasedReturnValue();

                  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                  {
                    PHSuggestionStringWithSubtype();
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "uuid");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)v72 = v40;
                    *(_WORD *)&v72[8] = 2112;
                    *(_QWORD *)&v72[10] = v41;
                    _os_log_impl(&dword_1CA237000, v39, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Elected True Positive %@ question with asset %@", buf, 0x16u);

                    v27 = v59;
                  }

                  objc_msgSend(v61, "addObject:", v36);
                  self = v37;
                  if (objc_msgSend(v61, "count") == a3)
                  {
                    v11 = v50;
                    if ((v55 & 1) != 0 || objc_msgSend(v50, "isCancelledWithProgress:", 1.0))
                    {
                      v43 = MEMORY[0x1E0C81028];
                      v24 = v56;
                      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 67109378;
                        *(_DWORD *)v72 = 293;
                        *(_WORD *)&v72[4] = 2080;
                        *(_QWORD *)&v72[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis"
                                             "/PhotosGraph/Framework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
                        v55 = 1;
                        _os_log_impl(&dword_1CA237000, v43, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                      }
                      else
                      {
                        v55 = 1;
                      }
                      v48 = 0;
                    }
                    else
                    {
                      v48 = v61;
                      v55 = 0;
                      v24 = v56;
                    }

                    objc_autoreleasePoolPop(v32);
                    v42 = 0;
                    v20 = v49;
                    v23 = v57;
                    i = v58;
                    goto LABEL_35;
                  }
                }

                objc_autoreleasePoolPop(v32);
              }
              v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
              if (v28)
                continue;
              break;
            }
            v42 = 1;
            v20 = v49;
            v11 = v50;
            v23 = v57;
            i = v58;
            v24 = v56;
          }
          else
          {
            v42 = 1;
          }
LABEL_35:

          objc_autoreleasePoolPop(v23);
          if (!v42)
          {

            v9 = v45;
            v19 = v46;
            v10 = v59;
            v12 = v48;
            goto LABEL_48;
          }
        }
        v52 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
        if (v52)
          continue;
        break;
      }

      v9 = v45;
      v10 = v59;
      if ((v55 & 1) != 0)
        goto LABEL_43;
    }
    else
    {

    }
    if (!objc_msgSend(v11, "isCancelledWithProgress:", 1.0))
    {
      v12 = v61;
LABEL_47:
      v19 = v46;
LABEL_48:

      goto LABEL_49;
    }
LABEL_43:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v72 = 298;
      *(_WORD *)&v72[4] = 2080;
      *(_QWORD *)&v72[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v12 = 0;
    goto LABEL_47;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v72 = 267;
    *(_WORD *)&v72[4] = 2080;
    *(_QWORD *)&v72[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v12 = 0;
LABEL_49:

  return v12;
}

- (id)_generateTruePositiveLandscapeQuestionWithLimit:(unint64_t)a3 suggestionSession:(id)a4 alreadyGeneratedQuestions:(id)a5 progressReporter:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  PGWallpaperQuestion *v21;
  void *v22;
  PGWallpaperQuestion *v23;
  uint64_t v24;
  PGWallpaperQuestionFactory *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  PGLandscapeWallpaperSuggester *v32;
  void *v33;
  PGLandscapeWallpaperSuggester *v35;
  id v36;
  void *v37;
  void *v38;
  void *v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  _BYTE v47[18];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (objc_msgSend(v11, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v47 = 304;
      *(_WORD *)&v47[4] = 2080;
      *(_QWORD *)&v47[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v12 = 0;
  }
  else
  {
    v36 = v9;
    v35 = -[PGLandscapeWallpaperSuggester initWithSession:]([PGLandscapeWallpaperSuggester alloc], "initWithSession:", v9);
    v37 = v11;
    -[PGLandscapeWallpaperSuggester fetchUnsortedCandidatesWithProgressReporter:](v35, "fetchUnsortedCandidatesWithProgressReporter:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v15 = v13;
    v38 = v15;
    v41 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    if (v41)
    {
      v16 = *(_QWORD *)v43;
      while (2)
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v43 != v16)
            objc_enumerationMutation(v15);
          v18 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x1CAA4EB2C]();
          objc_msgSend(v18, "asset");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = [PGWallpaperQuestion alloc];
          objc_msgSend(v20, "uuid");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = -[PGWallpaperQuestion initWithAssetUUID:suggestionSubtype:](v21, "initWithAssetUUID:suggestionSubtype:", v22, 654);

          if (-[PGSurveyQuestionFactory shouldAddQuestion:toAlreadyGeneratedQuestions:](self, "shouldAddQuestion:toAlreadyGeneratedQuestions:", v23, v10))
          {
            v40 = v19;
            v24 = v16;
            v25 = self;
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "loggingConnection");
            v27 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              PHSuggestionStringWithSubtype();
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "uuid");
              v29 = v14;
              v30 = v10;
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v47 = v28;
              *(_WORD *)&v47[8] = 2112;
              *(_QWORD *)&v47[10] = v31;
              _os_log_impl(&dword_1CA237000, v27, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Elected True Positive %@ question with asset %@", buf, 0x16u);

              v10 = v30;
              v14 = v29;
              v15 = v38;

            }
            objc_msgSend(v14, "addObject:", v23);
            self = v25;
            v16 = v24;
            v19 = v40;
            if (objc_msgSend(v14, "count") == a3)
            {
              v11 = v37;
              if (objc_msgSend(v37, "isCancelledWithProgress:", 1.0))
              {
                v32 = v35;
                v9 = v36;
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v47 = 323;
                  *(_WORD *)&v47[4] = 2080;
                  *(_QWORD *)&v47[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
                  _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
                v12 = 0;
              }
              else
              {
                v12 = v14;
                v32 = v35;
                v9 = v36;
              }

              objc_autoreleasePoolPop(v40);
              v33 = v38;

              goto LABEL_28;
            }
          }

          objc_autoreleasePoolPop(v19);
        }
        v41 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
        if (v41)
          continue;
        break;
      }
    }

    v11 = v37;
    if (objc_msgSend(v37, "isCancelledWithProgress:", 1.0))
    {
      v9 = v36;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v47 = 327;
        *(_WORD *)&v47[4] = 2080;
        *(_QWORD *)&v47[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v12 = 0;
    }
    else
    {
      v12 = v14;
      v9 = v36;
    }
    v32 = v35;
    v33 = v38;
LABEL_28:

  }
  return v12;
}

- (id)_generateTruePositiveCityscapeQuestionWithLimit:(unint64_t)a3 suggestionSession:(id)a4 alreadyGeneratedQuestions:(id)a5 progressReporter:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  PGWallpaperQuestion *v21;
  void *v22;
  PGWallpaperQuestion *v23;
  uint64_t v24;
  PGWallpaperQuestionFactory *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  PGCityscapeWallpaperSuggester *v32;
  void *v33;
  PGCityscapeWallpaperSuggester *v35;
  id v36;
  void *v37;
  void *v38;
  void *v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  _BYTE v47[18];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (objc_msgSend(v11, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v47 = 333;
      *(_WORD *)&v47[4] = 2080;
      *(_QWORD *)&v47[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v12 = 0;
  }
  else
  {
    v36 = v9;
    v35 = -[PGCityscapeWallpaperSuggester initWithSession:]([PGCityscapeWallpaperSuggester alloc], "initWithSession:", v9);
    v37 = v11;
    -[PGCityscapeWallpaperSuggester fetchUnsortedCandidatesWithProgressReporter:](v35, "fetchUnsortedCandidatesWithProgressReporter:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v15 = v13;
    v38 = v15;
    v41 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    if (v41)
    {
      v16 = *(_QWORD *)v43;
      while (2)
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v43 != v16)
            objc_enumerationMutation(v15);
          v18 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x1CAA4EB2C]();
          objc_msgSend(v18, "asset");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = [PGWallpaperQuestion alloc];
          objc_msgSend(v20, "uuid");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = -[PGWallpaperQuestion initWithAssetUUID:suggestionSubtype:](v21, "initWithAssetUUID:suggestionSubtype:", v22, 655);

          if (-[PGSurveyQuestionFactory shouldAddQuestion:toAlreadyGeneratedQuestions:](self, "shouldAddQuestion:toAlreadyGeneratedQuestions:", v23, v10))
          {
            v40 = v19;
            v24 = v16;
            v25 = self;
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "loggingConnection");
            v27 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              PHSuggestionStringWithSubtype();
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "uuid");
              v29 = v14;
              v30 = v10;
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v47 = v28;
              *(_WORD *)&v47[8] = 2112;
              *(_QWORD *)&v47[10] = v31;
              _os_log_impl(&dword_1CA237000, v27, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Elected True Positive %@ question with asset %@", buf, 0x16u);

              v10 = v30;
              v14 = v29;
              v15 = v38;

            }
            objc_msgSend(v14, "addObject:", v23);
            self = v25;
            v16 = v24;
            v19 = v40;
            if (objc_msgSend(v14, "count") == a3)
            {
              v11 = v37;
              if (objc_msgSend(v37, "isCancelledWithProgress:", 1.0))
              {
                v32 = v35;
                v9 = v36;
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v47 = 352;
                  *(_WORD *)&v47[4] = 2080;
                  *(_QWORD *)&v47[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
                  _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
                v12 = 0;
              }
              else
              {
                v12 = v14;
                v32 = v35;
                v9 = v36;
              }

              objc_autoreleasePoolPop(v40);
              v33 = v38;

              goto LABEL_28;
            }
          }

          objc_autoreleasePoolPop(v19);
        }
        v41 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
        if (v41)
          continue;
        break;
      }
    }

    v11 = v37;
    if (objc_msgSend(v37, "isCancelledWithProgress:", 1.0))
    {
      v9 = v36;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v47 = 356;
        *(_WORD *)&v47[4] = 2080;
        *(_QWORD *)&v47[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v12 = 0;
    }
    else
    {
      v12 = v14;
      v9 = v36;
    }
    v32 = v35;
    v33 = v38;
LABEL_28:

  }
  return v12;
}

- (id)_generateQuestionsWithLimit:(unint64_t)a3 progressReporter:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint32_t denom;
  uint32_t numer;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  os_signpost_id_t v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint32_t v50;
  uint32_t v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  os_signpost_id_t v56;
  NSObject *v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  NSObject *v62;
  uint64_t v63;
  id v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint32_t v68;
  uint32_t v69;
  NSObject *v70;
  NSObject *v71;
  NSObject *v72;
  NSObject *v73;
  os_signpost_id_t v74;
  NSObject *v75;
  NSObject *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  NSObject *v80;
  uint64_t v81;
  id v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint32_t v86;
  uint32_t v87;
  NSObject *v88;
  NSObject *v89;
  NSObject *v90;
  void *v91;
  __int128 v92;
  unint64_t v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  PGWallpaperQuestion *v98;
  void *v99;
  PGWallpaperQuestion *v100;
  void *v101;
  NSObject *v102;
  id v103;
  void *v104;
  void *v105;
  NSObject *v106;
  id v107;
  void *v108;
  NSObject *v109;
  uint64_t v110;
  NSObject *v111;
  id v112;
  void *v113;
  NSObject *v114;
  uint64_t v115;
  uint32_t v116;
  uint32_t v117;
  NSObject *v118;
  NSObject *v119;
  NSObject *v120;
  uint64_t v121;
  uint32_t v122;
  uint32_t v123;
  NSObject *v124;
  NSObject *v125;
  __int128 v127;
  void *v128;
  NSObject *v129;
  void *v130;
  NSObject *v131;
  void *v132;
  NSObject *v133;
  void *v134;
  unint64_t v135;
  void *v136;
  void *context;
  unint64_t v138;
  os_signpost_id_t spid;
  uint64_t v140;
  unint64_t v141;
  void *v142;
  uint64_t v143;
  PGWallpaperQuestionFactory *v144;
  id v145;
  mach_timebase_info v146;
  mach_timebase_info v147;
  mach_timebase_info v148;
  mach_timebase_info v149;
  mach_timebase_info info;
  uint8_t buf[4];
  _BYTE v152[18];
  uint64_t v153;

  v153 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isCancelledWithProgress:", 0.0))
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v152 = a3;
      _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Generating regular wallpaper questions with limit: %lu", buf, 0xCu);
    }

    -[PGSurveyQuestionFactory workingContext](self, "workingContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loggingConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v12;
    v14 = os_signpost_id_generate(v13);
    v15 = v13;
    v16 = v15;
    v141 = v14 - 1;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "OtherWallpaperQuestionGeneration", ", buf, 2u);
    }
    spid = v14;

    info = 0;
    mach_timebase_info(&info);
    v140 = mach_absolute_time();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v143 = objc_claimAutoreleasedReturnValue();
    v145 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v17 = v16;
    v18 = os_signpost_id_generate(v17);
    v19 = v17;
    v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "WallpaperQuestionFetchPeopleAsset", ", buf, 2u);
    }

    v149 = 0;
    mach_timebase_info(&v149);
    v21 = mach_absolute_time();
    v144 = self;
    -[PGWallpaperQuestionFactory fetchPeopleAssets](self, "fetchPeopleAssets");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "loggingConnection");
    v24 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_msgSend(v22, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v152 = v25;
      _os_log_impl(&dword_1CA237000, v24, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Fetched %lu People assets", buf, 0xCu);
    }

    if (objc_msgSend(v22, "count"))
    {
      v26 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v22, "fetchedObjects");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v26, "initWithArray:", v27);
      objc_msgSend(v145, "setObject:forKeyedSubscript:", v28, &unk_1E84E3650);

    }
    v29 = mach_absolute_time();
    numer = v149.numer;
    denom = v149.denom;
    v32 = v20;
    v33 = v32;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v33, OS_SIGNPOST_INTERVAL_END, v18, "WallpaperQuestionFetchPeopleAsset", ", buf, 2u);
    }

    v34 = v33;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v152 = "WallpaperQuestionFetchPeopleAsset";
      *(_WORD *)&v152[8] = 2048;
      *(double *)&v152[10] = (float)((float)((float)((float)(v29 - v21) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v34, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    if (objc_msgSend(v6, "isCancelledWithProgress:", 0.1))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v152 = 381;
        *(_WORD *)&v152[4] = 2080;
        *(_QWORD *)&v152[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v8 = v7;
      v35 = (void *)v143;
      goto LABEL_119;
    }
    v138 = a3;
    v142 = v22;
    v36 = v34;
    v37 = os_signpost_id_generate(v36);
    v38 = v36;
    v39 = v38;
    if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v39, OS_SIGNPOST_INTERVAL_BEGIN, v37, "WallpaperQuestionFetchPetAsset", ", buf, 2u);
    }

    v148 = 0;
    mach_timebase_info(&v148);
    v40 = mach_absolute_time();
    -[PGWallpaperQuestionFactory fetchPetAssets](v144, "fetchPetAssets");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "loggingConnection");
    v43 = objc_claimAutoreleasedReturnValue();

    v44 = v41;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v45 = objc_msgSend(v41, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v152 = v45;
      _os_log_impl(&dword_1CA237000, v43, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Fetched %lu Pet assets", buf, 0xCu);
    }

    if (objc_msgSend(v41, "count"))
    {
      v46 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v41, "fetchedObjects");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (void *)objc_msgSend(v46, "initWithArray:", v47);
      objc_msgSend(v145, "setObject:forKeyedSubscript:", v48, &unk_1E84E3668);

      v44 = v41;
    }
    v49 = mach_absolute_time();
    v51 = v148.numer;
    v50 = v148.denom;
    v52 = v39;
    v53 = v52;
    if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v53, OS_SIGNPOST_INTERVAL_END, v37, "WallpaperQuestionFetchPetAsset", ", buf, 2u);
    }

    v54 = v53;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v152 = "WallpaperQuestionFetchPetAsset";
      *(_WORD *)&v152[8] = 2048;
      *(double *)&v152[10] = (float)((float)((float)((float)(v49 - v40) * (float)v51) / (float)v50) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v54, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    if (objc_msgSend(v6, "isCancelledWithProgress:", 0.2))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v152 = 390;
        *(_WORD *)&v152[4] = 2080;
        *(_QWORD *)&v152[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v8 = v7;
      v35 = (void *)v143;
      goto LABEL_118;
    }
    v133 = v54;
    v134 = v44;
    v55 = v54;
    v56 = os_signpost_id_generate(v55);
    v57 = v55;
    v58 = v57;
    if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v58, OS_SIGNPOST_INTERVAL_BEGIN, v56, "WallpaperQuestionFetchLandscapeAsset", ", buf, 2u);
    }

    v147 = 0;
    mach_timebase_info(&v147);
    v59 = mach_absolute_time();
    -[PGWallpaperQuestionFactory fetchLandscapeAssets](v144, "fetchLandscapeAssets");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "loggingConnection");
    v62 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      v63 = objc_msgSend(v60, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v152 = v63;
      _os_log_impl(&dword_1CA237000, v62, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Fetched %lu Landscape assets", buf, 0xCu);
    }

    v132 = v60;
    if (objc_msgSend(v60, "count"))
    {
      v64 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v60, "fetchedObjects");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = (void *)objc_msgSend(v64, "initWithArray:", v65);
      objc_msgSend(v145, "setObject:forKeyedSubscript:", v66, &unk_1E84E3680);

    }
    v67 = mach_absolute_time();
    v69 = v147.numer;
    v68 = v147.denom;
    v70 = v58;
    v71 = v70;
    if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v70))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v71, OS_SIGNPOST_INTERVAL_END, v56, "WallpaperQuestionFetchLandscapeAsset", ", buf, 2u);
    }

    v72 = v71;
    v44 = v134;
    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v152 = "WallpaperQuestionFetchLandscapeAsset";
      *(_WORD *)&v152[8] = 2048;
      *(double *)&v152[10] = (float)((float)((float)((float)(v67 - v59) * (float)v69) / (float)v68) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v72, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    v131 = v72;
    if (objc_msgSend(v6, "isCancelledWithProgress:", 0.3))
    {
      v54 = v133;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v152 = 399;
        *(_WORD *)&v152[4] = 2080;
        *(_QWORD *)&v152[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v8 = v7;
      v35 = (void *)v143;
      goto LABEL_117;
    }
    v73 = v72;
    v74 = os_signpost_id_generate(v73);
    v75 = v73;
    v76 = v75;
    if (v74 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v76, OS_SIGNPOST_INTERVAL_BEGIN, v74, "WallpaperQuestionFetchCityscapeAsset", ", buf, 2u);
    }

    v146 = 0;
    mach_timebase_info(&v146);
    v77 = mach_absolute_time();
    -[PGWallpaperQuestionFactory fetchCityscapeAssets](v144, "fetchCityscapeAssets");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "loggingConnection");
    v80 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      v81 = objc_msgSend(v78, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v152 = v81;
      _os_log_impl(&dword_1CA237000, v80, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Fetched %lu Cityscape assets", buf, 0xCu);
    }

    if (objc_msgSend(v78, "count"))
    {
      v82 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v78, "fetchedObjects");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = (void *)objc_msgSend(v82, "initWithArray:", v83);
      objc_msgSend(v145, "setObject:forKeyedSubscript:", v84, &unk_1E84E3698);

    }
    v85 = mach_absolute_time();
    v87 = v146.numer;
    v86 = v146.denom;
    v88 = v76;
    v89 = v88;
    if (v74 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v88))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v89, OS_SIGNPOST_INTERVAL_END, v74, "WallpaperQuestionFetchCityscapeAsset", ", buf, 2u);
    }

    v90 = v89;
    v44 = v134;
    if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v152 = "WallpaperQuestionFetchCityscapeAsset";
      *(_WORD *)&v152[8] = 2048;
      *(double *)&v152[10] = (float)((float)((float)((float)(v85 - v77) * (float)v87) / (float)v86) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v90, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v129 = v90;

    v91 = v145;
    v54 = v133;
    v128 = v78;
    if (objc_msgSend(v6, "isCancelledWithProgress:", 0.4))
    {
      v35 = (void *)v143;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v152 = 408;
        *(_WORD *)&v152[4] = 2080;
        *(_QWORD *)&v152[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
LABEL_93:
      v8 = v7;
LABEL_116:

LABEL_117:
LABEL_118:

LABEL_119:
      goto LABEL_120;
    }
    if (objc_msgSend(v145, "count"))
    {
      v130 = v7;
      v93 = 0;
      *(_QWORD *)&v92 = 138412290;
      v127 = v92;
      v35 = (void *)v143;
      while (1)
      {
        context = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(v91, "allKeys");
        v135 = v93;
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "objectAtIndexedSubscript:", v93);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "objectForKeyedSubscript:", v94);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = arc4random_uniform(objc_msgSend(v95, "count"));
        objc_msgSend(v95, "objectAtIndex:", v96);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = [PGWallpaperQuestion alloc];
        objc_msgSend(v97, "uuid");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = -[PGWallpaperQuestion initWithAssetUUID:suggestionSubtype:](v98, "initWithAssetUUID:suggestionSubtype:", v99, (unsigned __int16)objc_msgSend(v94, "unsignedIntValue"));

        if (-[PGSurveyQuestionFactory shouldAddQuestion:toAlreadyGeneratedQuestions:](v144, "shouldAddQuestion:toAlreadyGeneratedQuestions:", v100, v35))
        {
          objc_msgSend(v35, "addObject:", v100);
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "loggingConnection");
          v102 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v94, "integerValue");
            PHSuggestionStringWithSubtype();
            v103 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v97, "uuid");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v152 = v103;
            *(_WORD *)&v152[8] = 2112;
            *(_QWORD *)&v152[10] = v104;
            _os_log_impl(&dword_1CA237000, v102, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Generated %@ question with asset %@", buf, 0x16u);

            v91 = v145;
          }

          v35 = (void *)v143;
        }
        objc_msgSend(v95, "removeObjectAtIndex:", v96, v127);
        v7 = v130;
        if (!objc_msgSend(v95, "count"))
        {
          objc_msgSend(v91, "setObject:forKeyedSubscript:", 0, v94);
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "loggingConnection");
          v106 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v94, "integerValue");
            PHSuggestionStringWithSubtype();
            v107 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v127;
            *(_QWORD *)v152 = v107;
            _os_log_impl(&dword_1CA237000, v106, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Used all %@ assets", buf, 0xCu);

          }
          v91 = v145;
        }
        if (objc_msgSend(v35, "count") >= v138 || !objc_msgSend(v91, "count"))
          break;
        if (objc_msgSend(v6, "isCancelledWithProgress:", (double)(unint64_t)objc_msgSend(v35, "count") / (double)v138 * 0.6 + 0.4))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v152 = 445;
            *(_WORD *)&v152[4] = 2080;
            *(_QWORD *)&v152[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v8 = v130;

          objc_autoreleasePoolPop(context);
          v22 = v142;
          v44 = v134;
          goto LABEL_115;
        }
        v93 = (v135 + 1) % objc_msgSend(v91, "count");

        objc_autoreleasePoolPop(context);
      }

      objc_autoreleasePoolPop(context);
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "loggingConnection");
      v109 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
      {
        v110 = objc_msgSend(v35, "count");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v152 = v110;
        _os_log_impl(&dword_1CA237000, v109, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Generated %lu regular wallpaper questions.", buf, 0xCu);
      }

      v22 = v142;
      v44 = v134;
      if (objc_msgSend(v6, "isCancelledWithProgress:", 1.0))
      {
        v111 = MEMORY[0x1E0C81028];
        v112 = MEMORY[0x1E0C81028];
        v54 = v133;
        if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v152 = 452;
          *(_WORD *)&v152[4] = 2080;
          *(_QWORD *)&v152[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }

        goto LABEL_93;
      }
      v115 = mach_absolute_time();
      v117 = info.numer;
      v116 = info.denom;
      v118 = v129;
      v119 = v118;
      if (v141 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v118))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v119, OS_SIGNPOST_INTERVAL_END, spid, "OtherWallpaperQuestionGeneration", ", buf, 2u);
      }

      v120 = v119;
      if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v152 = "OtherWallpaperQuestionGeneration";
        *(_WORD *)&v152[8] = 2048;
        *(double *)&v152[10] = (float)((float)((float)((float)(v115 - v140) * (float)v117) / (float)v116) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v120, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }

      v8 = v35;
    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "loggingConnection");
      v114 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, v114, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Found 0 candidate assets for question generation", buf, 2u);
      }

      if (objc_msgSend(v6, "isCancelledWithProgress:", 1.0))
      {
        v54 = v133;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v152 = 412;
          *(_WORD *)&v152[4] = 2080;
          *(_QWORD *)&v152[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v8 = v7;
        v35 = (void *)v143;
        goto LABEL_116;
      }
      v121 = mach_absolute_time();
      v123 = info.numer;
      v122 = info.denom;
      v124 = v129;
      v125 = v124;
      if (v141 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v124))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v125, OS_SIGNPOST_INTERVAL_END, spid, "OtherWallpaperQuestionGeneration", ", buf, 2u);
      }

      if (os_log_type_enabled(v125, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v152 = "OtherWallpaperQuestionGeneration";
        *(_WORD *)&v152[8] = 2048;
        *(double *)&v152[10] = (float)((float)((float)((float)(v121 - v140) * (float)v123) / (float)v122) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v125, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v35 = (void *)v143;
    }
LABEL_115:
    v54 = v133;
    goto LABEL_116;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v152 = 364;
    *(_WORD *)&v152[4] = 2080;
    *(_QWORD *)&v152[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v8 = v7;
LABEL_120:

  return v8;
}

- (id)fetchAssetsWithPredicate:(id)a3 assetFilter:(id)a4
{
  id v6;
  unsigned int (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  void *context;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (unsigned int (**)(id, _QWORD))a4;
  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "librarySpecificFetchOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCacheSizeForFetch:", 200);
  objc_msgSend(v10, "setChunkSizeForFetch:", 200);
  v37 = v6;
  objc_msgSend(v10, "setInternalPredicate:", v6);
  +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFetchPropertySets:", v11);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSortDescriptors:", v13);

  v35 = v10;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v9;
  v34 = objc_alloc_init(MEMORY[0x1E0D77E18]);
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77E08]), "initWithPhotoLibrary:curationSession:", v9, v34);
  v40 = v14;
  v38 = objc_msgSend(v14, "count") / 0xC8uLL;
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0;
  do
  {
    context = (void *)MEMORY[0x1CAA4EB2C]();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectsAtIndexes:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1390], "prefetchOnAssets:options:curationContext:", v18, 31, v39);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v43;
LABEL_4:
      v23 = 0;
      while (1)
      {
        if (*(_QWORD *)v43 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v23);
        v25 = (void *)MEMORY[0x1CAA4EB2C]();
        if (v7[2](v7, v24))
          objc_msgSend(v15, "addObject:", v24);
        v26 = objc_msgSend(v15, "count");
        objc_autoreleasePoolPop(v25);
        if (v26 > 0xC7)
          break;
        if (v21 == ++v23)
        {
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
          if (v21)
            goto LABEL_4;
          break;
        }
      }
    }

    v27 = objc_msgSend(v15, "count");
    objc_autoreleasePoolPop(context);
    if (v27 > 0xC7)
      break;
  }
  while (v16++ != v38);
  v29 = objc_alloc(MEMORY[0x1E0CD1620]);
  v30 = *MEMORY[0x1E0CD1B90];
  objc_msgSend(v40, "fetchPropertySets");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v29, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v15, v36, v30, v31, 0, 0);

  return v32;
}

- (id)fetchPeopleAssets
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  void *v12;
  PGSinglePersonWallpaperAssetSuggesterFilteringContext *v13;
  id v14;
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
  void *v30;
  _QWORD v31[2];
  uint8_t buf[4];
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PFDeviceScreenSize();
  v8 = v6;
  v9 = v7;
  if (v6 == 0.0
    || v7 == 0.0
    || (v6 == *MEMORY[0x1E0D71130] ? (v10 = v7 == *(double *)(MEMORY[0x1E0D71130] + 8)) : (v10 = 0), v10))
  {
    v11 = 1.0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218496;
      v33 = v8;
      v34 = 2048;
      v35 = v9;
      v36 = 2048;
      v37 = 0x3FF0000000000000;
      _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
    }
  }
  else
  {
    v11 = fabs(v6 / v7);
  }
  v12 = (void *)MEMORY[0x1E0CB3528];
  v13 = [PGSinglePersonWallpaperAssetSuggesterFilteringContext alloc];
  v14 = -[PGSinglePersonWallpaperAssetSuggesterFilteringContext initForPeopleInOrientation:](v13, "initForPeopleInOrientation:", objc_msgSend(MEMORY[0x1E0D77EF8], "primaryOrientation"));
  +[PGSinglePersonWallpaperAssetSuggester prefilteringInternalPredicateWithContext:forTargetAspectRatio:](PGSinglePersonWallpaperAssetSuggester, "prefilteringInternalPredicateWithContext:forTargetAspectRatio:", v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v15;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K > %d OR %K.%K >= %f"), CFSTR("personForFace"), CFSTR("verifiedType"), 0, CFSTR("personForFace"), CFSTR("mergeCandidateConfidence"), *MEMORY[0x1E0CD1D48]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "andPredicateWithSubpredicates:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInternalPredicate:", v18);

  objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesWithOptions:", v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "photoLibrary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "librarySpecificFetchOptions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setCacheSizeForFetch:", 200);
  objc_msgSend(v22, "setChunkSizeForFetch:", 200);
  objc_msgSend(v22, "setFetchLimit:", 200);
  +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFetchPropertySets:", v23);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSortDescriptors:", v25);

  v26 = (void *)MEMORY[0x1E0CD1390];
  objc_msgSend(v19, "fetchedObjects");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "fetchAssetsForFaces:options:", v27, v22);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)fetchPetAssets
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  PGPetWallpaperSuggesterFilteringContext *v17;
  id v18;
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
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  void *v38;
  _QWORD v39[2];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = objc_alloc_init(MEMORY[0x1E0D77E18]);
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77E08]), "initWithPhotoLibrary:curationSession:", v4, v33);
  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)v5;
  +[PGGraphPetIdentityProcessor fetchInterestingEligiblePetsForWallpaperWithWorkingContext:curationContext:](PGGraphPetIdentityProcessor, "fetchInterestingEligiblePetsForWallpaperWithWorkingContext:curationContext:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v35;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v13), "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v11);
  }

  objc_msgSend(v4, "librarySpecificFetchOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setIncludedDetectionTypes:", &unk_1E84E9A00);
  v16 = (void *)MEMORY[0x1E0CB3528];
  v17 = [PGPetWallpaperSuggesterFilteringContext alloc];
  v18 = -[PGPetWallpaperSuggesterFilteringContext initForPetsInOrientation:](v17, "initForPetsInOrientation:", objc_msgSend(MEMORY[0x1E0D77EF8], "primaryOrientation"));
  +[PGPetWallpaperSuggester prefilteringInternalPredicateWithContext:](PGPetWallpaperSuggester, "prefilteringInternalPredicateWithContext:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v19;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K IN %@"), CFSTR("personForFace"), CFSTR("personUUID"), v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "andPredicateWithSubpredicates:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setInternalPredicate:", v22);

  objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesWithOptions:", v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCacheSizeForFetch:", 200);
  objc_msgSend(v24, "setChunkSizeForFetch:", 200);
  objc_msgSend(v24, "setFetchLimit:", 200);
  +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFetchPropertySets:", v25);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setSortDescriptors:", v27);

  v28 = (void *)MEMORY[0x1E0CD1390];
  objc_msgSend(v23, "fetchedObjects");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "fetchAssetsForFaces:options:", v29, v24);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)fetchLandscapeAssets
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  +[PGLandscapeWallpaperSuggester prefilteringInternalPredicateWithForbiddenAssetUUIDs:](PGLandscapeWallpaperSuggester, "prefilteringInternalPredicateWithForbiddenAssetUUIDs:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__PGWallpaperQuestionFactory_fetchLandscapeAssets__block_invoke;
  v6[3] = &unk_1E842A818;
  v6[4] = self;
  -[PGWallpaperQuestionFactory fetchAssetsWithPredicate:assetFilter:](self, "fetchAssetsWithPredicate:assetFilter:", v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)fetchCityscapeAssets
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  +[PGCityscapeWallpaperSuggester prefilteringInternalPredicateWithForbiddenAssetUUIDs:](PGCityscapeWallpaperSuggester, "prefilteringInternalPredicateWithForbiddenAssetUUIDs:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__PGWallpaperQuestionFactory_fetchCityscapeAssets__block_invoke;
  v6[3] = &unk_1E842A818;
  v6[4] = self;
  -[PGWallpaperQuestionFactory fetchAssetsWithPredicate:assetFilter:](self, "fetchAssetsWithPredicate:assetFilter:", v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __50__PGWallpaperQuestionFactory_fetchCityscapeAssets__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  v3 = objc_msgSend((id)objc_opt_class(), "isHighRecallCityscapeAsset:", v2);

  return v3;
}

uint64_t __50__PGWallpaperQuestionFactory_fetchLandscapeAssets__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  v3 = objc_msgSend((id)objc_opt_class(), "isHighRecallLandscapeAsset:", v2);

  return v3;
}

uint64_t __136__PGWallpaperQuestionFactory__generateTruePositivePeopleQuestionWithLimit_suggestionSession_alreadyGeneratedQuestions_progressReporter___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t v5;
  uint64_t result;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v5 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", a3 * 0.5);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v5 + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a2 = 1;
  return result;
}

uint64_t __136__PGWallpaperQuestionFactory__generateTruePositivePeopleQuestionWithLimit_suggestionSession_alreadyGeneratedQuestions_progressReporter___block_invoke_216(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t v5;
  uint64_t result;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v5 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) + *(double *)(a1 + 56) * a3);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v5 + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a2 = 1;
  return result;
}

@end
