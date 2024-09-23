@implementation PGMemoryMusicEnergyQuestionFactory

- (unsigned)questionType
{
  return 16;
}

- (int64_t)questionOptions
{
  return 0x8000;
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
  void *v15;
  id v16;
  void (**v17)(void *, _BYTE *, double);
  double v18;
  char v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *, _BYTE *);
  void *v25;
  PGMemoryMusicEnergyQuestionFactory *v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  unint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  double *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  const char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void (**)(void *, _BYTE *, double))_Block_copy(v6);
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v34 = 0;
  v35 = (double *)&v34;
  v36 = 0x2020000000;
  v37 = 0;
  if (v7)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v35[3] >= 0.01)
    {
      v35[3] = Current;
      v33 = 0;
      v7[2](v7, &v33, 0.0);
      v9 = *((_BYTE *)v39 + 24) | v33;
      *((_BYTE *)v39 + 24) = v9;
      if (v9)
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
LABEL_19:
          v20 = (void *)MEMORY[0x1E0C9AA60];
          goto LABEL_22;
        }
        *(_DWORD *)buf = 67109378;
        v43 = 43;
        v44 = 2080;
        v45 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Music/MusicEnergy/PGMemoryMusicEnergyQuestionFactory.m";
        v10 = MEMORY[0x1E0C81028];
LABEL_11:
        _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_19;
      }
    }
    if (!a3)
    {
      v11 = CFAbsoluteTimeGetCurrent();
      if (v11 - v35[3] < 0.01)
        goto LABEL_19;
      v35[3] = v11;
      v33 = 0;
      v7[2](v7, &v33, 1.0);
      v12 = *((_BYTE *)v39 + 24) | v33;
      *((_BYTE *)v39 + 24) = v12;
      if (!v12 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_19;
      *(_DWORD *)buf = 67109378;
      v43 = 47;
      v44 = 2080;
      v45 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Music/MusicEnergy/PGMemoryMusicEnergyQuestionFactory.m";
      v10 = MEMORY[0x1E0C81028];
      goto LABEL_11;
    }
  }
  else if (!a3)
  {
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "photoLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __79__PGMemoryMusicEnergyQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
  v25 = &unk_1E84295D0;
  v26 = self;
  v16 = v13;
  v27 = v16;
  v31 = a3;
  v17 = v7;
  v28 = v17;
  v29 = &v34;
  v32 = 0x3F847AE147AE147BLL;
  v30 = &v38;
  +[PGMemoryMusicQuestionUtils enumerateMemoryMusicSuggestionsInPhotoLibrary:block:](PGMemoryMusicQuestionUtils, "enumerateMemoryMusicSuggestionsInPhotoLibrary:block:", v15, &v22);

  if (v7
    && (v18 = CFAbsoluteTimeGetCurrent(), v18 - v35[3] >= 0.01)
    && (v35[3] = v18,
        v33 = 0,
        v17[2](v17, &v33, 1.0),
        v19 = *((_BYTE *)v39 + 24) | v33,
        (*((_BYTE *)v39 + 24) = v19) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v43 = 71;
      v44 = 2080;
      v45 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Music/MusicEnergy/PGMemoryMusicEnergyQuestionFactory.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v20 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v16, "allObjects", v22, v23, v24, v25, v26, v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_22:
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  return v20;
}

void __79__PGMemoryMusicEnergyQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  PGMemoryMusicEnergyQuestion *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  double Current;
  uint64_t v15;

  v7 = a2;
  v8 = a3;
  v9 = (void *)MEMORY[0x1CAA4EB2C]();
  v10 = -[PGMemoryMusicEnergyQuestion initWithMemory:song:localFactoryScore:]([PGMemoryMusicEnergyQuestion alloc], "initWithMemory:song:localFactoryScore:", v7, v8, 1.0);
  if (objc_msgSend(*(id *)(a1 + 32), "shouldAddQuestion:toAlreadyGeneratedQuestions:", v10, *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= *(_QWORD *)(a1 + 72))
      *a4 = 1;
  }
  v11 = objc_msgSend(*(id *)(a1 + 40), "count");
  if (*(_QWORD *)(a1 + 48))
  {
    v12 = v11;
    v13 = *(_QWORD *)(a1 + 72);
    Current = CFAbsoluteTimeGetCurrent();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (Current - *(double *)(v15 + 24) >= *(double *)(a1 + 80))
    {
      *(double *)(v15 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 48) + 16))((double)v12 / (double)v13);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        *a4 = 1;
    }
  }

  objc_autoreleasePoolPop(v9);
}

@end
