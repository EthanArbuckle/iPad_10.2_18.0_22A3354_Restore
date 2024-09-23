@implementation PGMemoryMusicQualityQuestionFactory

- (unsigned)questionType
{
  return 15;
}

- (int64_t)questionOptions
{
  return 0x4000;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  id v6;
  void (**v7)(void *, _BYTE *, double);
  double Current;
  char v9;
  NSObject *v10;
  double v11;
  char v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  double v21;
  char v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, void *, _BYTE *);
  void *v27;
  PGMemoryMusicQualityQuestionFactory *v28;
  id v29;
  void (**v30)(void *, _BYTE *, double);
  uint64_t *v31;
  uint64_t *v32;
  unint64_t v33;
  uint64_t v34;
  BOOL v35;
  char v36;
  uint64_t v37;
  double *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint8_t buf[4];
  int v46;
  __int16 v47;
  const char *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void (**)(void *, _BYTE *, double))_Block_copy(v6);
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v37 = 0;
  v38 = (double *)&v37;
  v39 = 0x2020000000;
  v40 = 0;
  if (v7)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v38[3] >= 0.01)
    {
      v38[3] = Current;
      v36 = 0;
      v7[2](v7, &v36, 0.0);
      v9 = *((_BYTE *)v42 + 24) | v36;
      *((_BYTE *)v42 + 24) = v9;
      if (v9)
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
LABEL_17:
          v19 = (void *)MEMORY[0x1E0C9AA60];
          goto LABEL_29;
        }
        *(_DWORD *)buf = 67109378;
        v46 = 41;
        v47 = 2080;
        v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Music/MusicQuality/PGMemoryMusicQualityQuestionFactory.m";
        v10 = MEMORY[0x1E0C81028];
LABEL_11:
        _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_17;
      }
    }
    if (!a3)
    {
      v11 = CFAbsoluteTimeGetCurrent();
      if (v11 - v38[3] < 0.01)
        goto LABEL_17;
      v38[3] = v11;
      v36 = 0;
      v7[2](v7, &v36, 1.0);
      v12 = *((_BYTE *)v42 + 24) | v36;
      *((_BYTE *)v42 + 24) = v12;
      if (!v12 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_17;
      *(_DWORD *)buf = 67109378;
      v46 = 45;
      v47 = 2080;
      v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Music/MusicQuality/PGMemoryMusicQualityQuestionFactory.m";
      v10 = MEMORY[0x1E0C81028];
      goto LABEL_11;
    }
  }
  else if (!a3)
  {
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D42A58], "ignoreProgress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[PGMusicCatalogMonitor checkMusicCatalogEligibilityWithProgressReporter:](PGMusicCatalogMonitor, "checkMusicCatalogEligibilityWithProgressReporter:", v14);

  PLStoryGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v46 = v15;
    _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_DEBUG, "[MusicQualityQuestion] isAppleMusicSubscriber = %d", buf, 8u);
  }

  if (v15)
  {
    -[PGSurveyQuestionFactory workingContext](self, "workingContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "photoLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __80__PGMemoryMusicQualityQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
    v27 = &unk_1E8433700;
    v35 = v15;
    v28 = self;
    v29 = v13;
    v33 = a3;
    v30 = v7;
    v31 = &v37;
    v34 = 0x3F847AE147AE147BLL;
    v32 = &v41;
    +[PGMemoryMusicQuestionUtils enumerateMemoryMusicSuggestionsInPhotoLibrary:block:](PGMemoryMusicQuestionUtils, "enumerateMemoryMusicSuggestionsInPhotoLibrary:block:", v18, &v24);

  }
  else
  {
    PLStoryGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_INFO, "[MusicQualityQuestion] Not an Apple Music subscriber so skipping Apple Music question generation ", buf, 2u);
    }

  }
  if (v7
    && (v21 = CFAbsoluteTimeGetCurrent(), v21 - v38[3] >= 0.01)
    && (v38[3] = v21, v36 = 0, v7[2](v7, &v36, 1.0), v22 = *((_BYTE *)v42 + 24) | v36, (*((_BYTE *)v42 + 24) = v22) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v46 = 81;
      v47 = 2080;
      v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Music/MusicQuality/PGMemoryMusicQualityQuestionFactory.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v19 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v13, "allObjects", v24, v25, v26, v27, v28);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_29:
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  return v19;
}

void __80__PGMemoryMusicQualityQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  PGMemoryMusicQualityQuestion *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  double Current;
  uint64_t v23;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = (void *)MEMORY[0x1CAA4EB2C]();
  +[PGMemoryMusicQuestionUtils extractKeySongInfoForMemory:isAppleMusicSubscriber:](PGMemoryMusicQuestionUtils, "extractKeySongInfoForMemory:isAppleMusicSubscriber:", v7, *(unsigned __int8 *)(a1 + 88));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10
    || (objc_msgSend(v10, "allKeys"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "count"),
        v12,
        !v13))
  {
    PLStoryGetLog();
    v14 = (PGMemoryMusicQualityQuestion *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v14->super.super, OS_LOG_TYPE_INFO))
      goto LABEL_12;
    objc_msgSend(v7, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412290;
    v25 = v16;
    _os_log_impl(&dword_1CA237000, &v14->super.super, OS_LOG_TYPE_INFO, "[MusicQualityQuestion] Skipping question for memory %@ since it's customized (song selected changed from system curated)", (uint8_t *)&v24, 0xCu);
LABEL_11:

    goto LABEL_12;
  }
  v14 = -[PGMemoryMusicQualityQuestion initWithMemory:withSongInfo:localFactoryScore:]([PGMemoryMusicQualityQuestion alloc], "initWithMemory:withSongInfo:localFactoryScore:", v7, v11, 1.0);
  -[PGMemoryMusicQualityQuestion additionalInfo](v14, "additionalInfo");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_12;
  v16 = (void *)v15;
  -[PGMemoryMusicQualityQuestion additionalInfo](v14, "additionalInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "count"))
  {

    goto LABEL_11;
  }
  v18 = objc_msgSend(*(id *)(a1 + 32), "shouldAddQuestion:toAlreadyGeneratedQuestions:", v14, *(_QWORD *)(a1 + 40));

  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= *(_QWORD *)(a1 + 72))
      *a4 = 1;
  }
LABEL_12:

  v19 = objc_msgSend(*(id *)(a1 + 40), "count");
  if (*(_QWORD *)(a1 + 48))
  {
    v20 = v19;
    v21 = *(_QWORD *)(a1 + 72);
    Current = CFAbsoluteTimeGetCurrent();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (Current - *(double *)(v23 + 24) >= *(double *)(a1 + 80))
    {
      *(double *)(v23 + 24) = Current;
      LOBYTE(v24) = 0;
      (*(void (**)(double))(*(_QWORD *)(a1 + 48) + 16))((double)v20 / (double)v21);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) |= v24;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        *a4 = 1;
    }
  }

  objc_autoreleasePoolPop(v9);
}

@end
