@implementation PGHolidayQuestionFactory

- (unsigned)questionType
{
  return 7;
}

- (int64_t)questionOptions
{
  return 64;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  PGHolidayQuestionFactory *v17;
  id v18;
  id v19;
  unint64_t v20;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __69__PGHolidayQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
  v16 = &unk_1E84350A0;
  v19 = v6;
  v20 = a3;
  v17 = self;
  v18 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performSynchronousConcurrentGraphReadUsingBlock:", &v13);

  objc_msgSend(v9, "allObjects", v13, v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __69__PGHolidayQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(void *, _BYTE *, double);
  double Current;
  char v6;
  NSObject *v7;
  double v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void (**v18)(void *, _BYTE *, double);
  double v19;
  char v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  double *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint8_t buf[4];
  int v39;
  __int16 v40;
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void (**)(void *, _BYTE *, double))_Block_copy(*(const void **)(a1 + 48));
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = (double *)&v30;
  v32 = 0x2020000000;
  v33 = 0;
  if (!v4)
  {
    if (!*(_QWORD *)(a1 + 56))
      goto LABEL_19;
    goto LABEL_13;
  }
  Current = CFAbsoluteTimeGetCurrent();
  if (Current - v31[3] >= 0.01)
  {
    v31[3] = Current;
    v29 = 0;
    v4[2](v4, &v29, 0.0);
    v6 = *((_BYTE *)v35 + 24) | v29;
    *((_BYTE *)v35 + 24) = v6;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v39 = 42;
        v40 = 2080;
        v41 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Holiday/PGHolidayQuestionFactory.m";
        v7 = MEMORY[0x1E0C81028];
LABEL_11:
        _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
  }
  if (*(_QWORD *)(a1 + 56))
  {
LABEL_13:
    objc_msgSend(v3, "graph");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x1E0D77E08]);
    objc_msgSend(*(id *)(a1 + 32), "workingContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithPhotoLibrary:", v13);

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __69__PGHolidayQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_129;
    v21[3] = &unk_1E842C888;
    v21[4] = *(_QWORD *)(a1 + 32);
    v15 = v14;
    v22 = v15;
    v16 = *(id *)(a1 + 40);
    v17 = *(_QWORD *)(a1 + 56);
    v23 = v16;
    v27 = v17;
    v18 = v4;
    v24 = v18;
    v25 = &v30;
    v28 = 0x3F847AE147AE147BLL;
    v26 = &v34;
    objc_msgSend(v10, "enumerateCelebratedHolidayNodesUsingBlock:", v21);
    if (v4)
    {
      v19 = CFAbsoluteTimeGetCurrent();
      if (v19 - v31[3] >= 0.01)
      {
        v31[3] = v19;
        v29 = 0;
        v18[2](v18, &v29, 1.0);
        v20 = *((_BYTE *)v35 + 24) | v29;
        *((_BYTE *)v35 + 24) = v20;
        if (v20)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v39 = 89;
            v40 = 2080;
            v41 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Ques"
                  "tions/Survey/Holiday/PGHolidayQuestionFactory.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }

    goto LABEL_19;
  }
  v8 = CFAbsoluteTimeGetCurrent();
  if (v8 - v31[3] >= 0.01)
  {
    v31[3] = v8;
    v29 = 0;
    v4[2](v4, &v29, 0.0);
    v9 = *((_BYTE *)v35 + 24) | v29;
    *((_BYTE *)v35 + 24) = v9;
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v39 = 46;
        v40 = 2080;
        v41 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Holiday/PGHolidayQuestionFactory.m";
        v7 = MEMORY[0x1E0C81028];
        goto LABEL_11;
      }
    }
  }
LABEL_19:
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

}

void __69__PGHolidayQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_129(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  __int128 v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "localizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__PGHolidayQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_131;
    v14[3] = &unk_1E842C860;
    v8 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v8;
    v16 = v6;
    v9 = v7;
    v17 = v9;
    v10 = *(id *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 80);
    v18 = v10;
    v21 = v11;
    v22 = a3;
    v19 = *(id *)(a1 + 56);
    v23 = *(_QWORD *)(a1 + 88);
    v20 = *(_OWORD *)(a1 + 64);
    objc_msgSend(v5, "enumerateCelebratingMomentNodesUsingBlock:", v14);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
      *a3 = 1;

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v13;
      _os_log_error_impl(&dword_1CA237000, v9, OS_LOG_TYPE_ERROR, "Holiday node with uuid %@ has nil name, not generating question for it", buf, 0xCu);

    }
  }

}

void __69__PGHolidayQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_131(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  PGHolidayQuestion *v11;
  void *v12;
  PGHolidayQuestion *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  double Current;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "representativeAssetsFromMomentNode:curationContext:", a2, *(_QWORD *)(a1 + 40));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v11 = [PGHolidayQuestion alloc];
        objc_msgSend(v10, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[PGHolidayQuestion initWithAssetUUID:holidayName:localizedHolidayName:localFactoryScore:](v11, "initWithAssetUUID:holidayName:localizedHolidayName:localFactoryScore:", v12, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 1.0);

        if (objc_msgSend(*(id *)(a1 + 32), "shouldAddQuestion:toAlreadyGeneratedQuestions:", v13, *(_QWORD *)(a1 + 64)))
        {
          objc_msgSend(*(id *)(a1 + 64), "addObject:", v13);
          if ((unint64_t)objc_msgSend(*(id *)(a1 + 64), "count") >= *(_QWORD *)(a1 + 96))
          {
            *a3 = 1;
            **(_BYTE **)(a1 + 104) = 1;
LABEL_16:

            goto LABEL_17;
          }
        }
        v14 = objc_msgSend(*(id *)(a1 + 64), "count");
        if (*(_QWORD *)(a1 + 72))
        {
          v15 = v14;
          v16 = *(_QWORD *)(a1 + 96);
          Current = CFAbsoluteTimeGetCurrent();
          v18 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
          if (Current - *(double *)(v18 + 24) >= *(double *)(a1 + 112))
          {
            *(double *)(v18 + 24) = Current;
            (*(void (**)(double))(*(_QWORD *)(a1 + 72) + 16))((double)v15 / (double)v16);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88)
                                                                                              + 8)
                                                                                  + 24);
            if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
            {
              *a3 = 1;
              goto LABEL_16;
            }
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_17:

}

@end
