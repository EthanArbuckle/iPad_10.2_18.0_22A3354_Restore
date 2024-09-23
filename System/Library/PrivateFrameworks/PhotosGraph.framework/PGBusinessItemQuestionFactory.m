@implementation PGBusinessItemQuestionFactory

- (unsigned)questionType
{
  return 4;
}

- (int64_t)questionOptions
{
  return 8;
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
  PGBusinessItemQuestionFactory *v17;
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
  v15 = __74__PGBusinessItemQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
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

- (double)_localBusinessItemFactoryScoreForMomentNode:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  double v6;
  void *v7;
  NSObject *v8;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "businessNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 1.0 / (double)v5;
    if (v6 == 0.0)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "loggingConnection");
      v8 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "localIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v10;
        _os_log_error_impl(&dword_1CA237000, v8, OS_LOG_TYPE_ERROR, "Moment node %@ found to have no business nodes which is unexpected.", (uint8_t *)&v11, 0xCu);

      }
    }
  }
  else
  {
    v6 = 1.0;
  }

  return v6;
}

- (BOOL)_shouldAddNewBusinessItemQuestionForAssetUUID:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[PGSurveyQuestionFactory existingQuestionsForEntityIdentifier:](self, "existingQuestionsForEntityIdentifier:", a3);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "state", (_QWORD)v10) == 2)
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

void __74__PGBusinessItemQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
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
        v39 = 44;
        v40 = 2080;
        v41 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/BusinessItem/PGBusinessItemQuestionFactory.m";
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
    v21[2] = __74__PGBusinessItemQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_129;
    v21[3] = &unk_1E8428AA0;
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
    objc_msgSend(v10, "enumerateBusinessNodesUsingBlock:", v21);
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
            v39 = 96;
            v40 = 2080;
            v41 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Ques"
                  "tions/Survey/BusinessItem/PGBusinessItemQuestionFactory.m";
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
    v4[2](v4, &v29, 1.0);
    v9 = *((_BYTE *)v35 + 24) | v29;
    *((_BYTE *)v35 + 24) = v9;
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v39 = 48;
        v40 = 2080;
        v41 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/BusinessItem/PGBusinessItemQuestionFactory.m";
        v7 = MEMORY[0x1E0C81028];
        goto LABEL_11;
      }
    }
  }
LABEL_19:
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

}

void __74__PGBusinessItemQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_129(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;
  __int128 v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint8_t buf[16];

  v5 = a2;
  objc_msgSend(v5, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      objc_msgSend(v5, "collection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "momentNodes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __74__PGBusinessItemQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_131;
      v15[3] = &unk_1E8435050;
      v15[4] = *(_QWORD *)(a1 + 32);
      v16 = v5;
      v17 = *(id *)(a1 + 40);
      v11 = *(id *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 80);
      v18 = v11;
      v21 = v12;
      v22 = a3;
      v19 = *(id *)(a1 + 56);
      v23 = *(_QWORD *)(a1 + 88);
      v20 = *(_OWORD *)(a1 + 64);
      objc_msgSend(v10, "enumerateNodesUsingBlock:", v15);

      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
        *a3 = 1;

      goto LABEL_10;
    }
  }
  else
  {

  }
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "loggingConnection");
  v14 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CA237000, v14, OS_LOG_TYPE_ERROR, "Business node does not have a UUID or name, not generating question for it", buf, 2u);
  }

LABEL_10:
}

void __74__PGBusinessItemQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_131(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  PGBusinessItemQuestion *v18;
  void *v19;
  void *v20;
  void *v21;
  PGBusinessItemQuestion *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  double Current;
  uint64_t v27;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "_localBusinessItemFactoryScoreForMomentNode:", v6);
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 40), "coordinates");
  v10 = v9;
  v12 = v11;
  v13 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "radius");
  objc_msgSend(v13, "assetFromMomentNode:closestToLocationCoordinate:radius:curationContext:", v6, *(_QWORD *)(a1 + 48), v10, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = *(void **)(a1 + 32);
    objc_msgSend(v15, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = objc_msgSend(v16, "_shouldAddNewBusinessItemQuestionForAssetUUID:", v17);

    if (!(_DWORD)v16)
      goto LABEL_11;
    v18 = [PGBusinessItemQuestion alloc];
    objc_msgSend(v15, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[PGBusinessItemQuestion initWithAssetUUID:businessUUID:businessName:localFactoryScore:](v18, "initWithAssetUUID:businessUUID:businessName:localFactoryScore:", v19, v20, v21, v8);

    if (objc_msgSend(*(id *)(a1 + 32), "shouldAddQuestion:toAlreadyGeneratedQuestions:", v22, *(_QWORD *)(a1 + 56)))
    {
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v22);
      if ((unint64_t)objc_msgSend(*(id *)(a1 + 56), "count") >= *(_QWORD *)(a1 + 88))
      {
        *a3 = 1;
        **(_BYTE **)(a1 + 96) = 1;

        goto LABEL_11;
      }
    }

  }
  v23 = objc_msgSend(*(id *)(a1 + 56), "count");
  if (*(_QWORD *)(a1 + 64))
  {
    v24 = v23;
    v25 = *(_QWORD *)(a1 + 88);
    Current = CFAbsoluteTimeGetCurrent();
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    if (Current - *(double *)(v27 + 24) >= *(double *)(a1 + 104))
    {
      *(double *)(v27 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))((double)v24 / (double)v25);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
        *a3 = 1;
    }
  }
LABEL_11:

}

@end
