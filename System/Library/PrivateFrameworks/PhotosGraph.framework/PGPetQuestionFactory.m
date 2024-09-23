@implementation PGPetQuestionFactory

+ (id)petSceneLabels
{
  return &unk_1E84E9790;
}

- (unsigned)questionType
{
  return 13;
}

- (int64_t)questionOptions
{
  return 4096;
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
  id v17;
  void (**v18)(void *, _BYTE *, double);
  double v19;
  char v20;
  void *v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  double *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint8_t buf[4];
  int v41;
  __int16 v42;
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void (**)(void *, _BYTE *, double))_Block_copy(v6);
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v32 = 0;
  v33 = (double *)&v32;
  v34 = 0x2020000000;
  v35 = 0;
  if (v7)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v33[3] >= 0.01)
    {
      v33[3] = Current;
      v31 = 0;
      v7[2](v7, &v31, 0.0);
      v9 = *((_BYTE *)v37 + 24) | v31;
      *((_BYTE *)v37 + 24) = v9;
      if (v9)
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
LABEL_19:
          v21 = (void *)MEMORY[0x1E0C9AA60];
          goto LABEL_22;
        }
        *(_DWORD *)buf = 67109378;
        v41 = 48;
        v42 = 2080;
        v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Pet/PGPetQuestionFactory.m";
        v10 = MEMORY[0x1E0C81028];
LABEL_11:
        _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_19;
      }
    }
    if (!a3)
    {
      v11 = CFAbsoluteTimeGetCurrent();
      if (v11 - v33[3] < 0.01)
        goto LABEL_19;
      v33[3] = v11;
      v31 = 0;
      v7[2](v7, &v31, 1.0);
      v12 = *((_BYTE *)v37 + 24) | v31;
      *((_BYTE *)v37 + 24) = v12;
      if (!v12 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_19;
      *(_DWORD *)buf = 67109378;
      v41 = 52;
      v42 = 2080;
      v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Pet/PGPetQuestionFactory.m";
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
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __65__PGPetQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
  v23[3] = &unk_1E84294A0;
  v23[4] = self;
  v16 = v13;
  v24 = v16;
  v17 = v15;
  v25 = v17;
  v29 = a3;
  v18 = v7;
  v26 = v18;
  v27 = &v32;
  v30 = 0x3F847AE147AE147BLL;
  v28 = &v36;
  objc_msgSend(v14, "performSynchronousConcurrentGraphReadUsingBlock:", v23);
  if (v7
    && (v19 = CFAbsoluteTimeGetCurrent(), v19 - v33[3] >= 0.01)
    && (v33[3] = v19,
        v31 = 0,
        v18[2](v18, &v31, 1.0),
        v20 = *((_BYTE *)v37 + 24) | v31,
        (*((_BYTE *)v37 + 24) = v20) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v41 = 114;
      v42 = 2080;
      v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Pet/PGPetQuestionFactory.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v21 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v16, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_22:
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v21;
}

- (id)initialPetQuestion
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type = %d AND entityType = %d AND entityIdentifier = %@"), 13, 4, CFSTR("PET_INITIAL_QUESTION_FAKE_ASSET"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(MEMORY[0x1E0CD1720], "fetchQuestionsWithOptions:validQuestionsOnly:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)updateInitialQuestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __46__PGPetQuestionFactory_updateInitialQuestion___block_invoke;
  v12[3] = &unk_1E8435668;
  v7 = v4;
  v13 = v7;
  v11 = 0;
  objc_msgSend(v6, "performChangesAndWait:error:", v12, &v11);
  v8 = v11;

  if (v8)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "[Questions] Error performing library changes for pet inital question: %@", buf, 0xCu);
    }

  }
}

void __46__PGPetQuestionFactory_updateInitialQuestion___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CD1728], "changeRequestForQuestion:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setState:", 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCreationDate:", v1);

}

void __65__PGPetQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  PGPetQuestion *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  PGPetQuestion *v21;
  void *v22;
  PGPetQuestion *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  double Current;
  uint64_t v28;
  void *v29;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "initialPetQuestion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "state"))
    {
      if (objc_msgSend(v5, "state") == 3 || objc_msgSend(v5, "state") == 1)
      {
        objc_msgSend(v5, "creationDate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "timeIntervalSinceNow");
        v8 = v7;

        if (v8 < -15778800.0)
          objc_msgSend(*(id *)(a1 + 32), "updateInitialQuestion:", v5);
      }
      else
      {
        objc_msgSend(v3, "graph");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGGraphNodeCollection nodesInGraph:](PGGraphPetNodeCollection, "nodesInGraph:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = v11;
        objc_msgSend(v11, "localIdentifiers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "allObjects");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 48), "librarySpecificFetchOptions");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("faceCount"), 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setSortDescriptors:", v16);

        objc_msgSend(v14, "setIncludedDetectionTypes:", &unk_1E84E9778);
        objc_msgSend(v14, "setPersonContext:", 1);
        v29 = v14;
        objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithLocalIdentifiers:options:", v13, v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "count"))
        {
          v18 = 0;
          while (1)
          {
            v19 = (void *)MEMORY[0x1CAA4EB2C]();
            objc_msgSend(v17, "objectAtIndexedSubscript:", v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = [PGPetQuestion alloc];
            objc_msgSend(v20, "uuid");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = -[PGPetQuestion initWithPetUUID:displayString:localFactoryScore:](v21, "initWithPetUUID:displayString:localFactoryScore:", v22, 0, 1.0);

            if (objc_msgSend(*(id *)(a1 + 32), "shouldAddQuestion:toAlreadyGeneratedQuestions:", v23, *(_QWORD *)(a1 + 40)))
            {
              objc_msgSend(*(id *)(a1 + 40), "addObject:", v23);
              v24 = objc_msgSend(*(id *)(a1 + 40), "count");
              if (*(_QWORD *)(a1 + 56))
              {
                v25 = v24;
                v26 = *(_QWORD *)(a1 + 80);
                Current = CFAbsoluteTimeGetCurrent();
                v28 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
                if (Current - *(double *)(v28 + 24) >= *(double *)(a1 + 88))
                {
                  *(double *)(v28 + 24) = Current;
                  (*(void (**)(double))(*(_QWORD *)(a1 + 56) + 16))((double)v25 / (double)v26);
                  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                                        + 24);
                  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
                    break;
                }
              }
              if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= *(_QWORD *)(a1 + 80))
                break;
            }

            objc_autoreleasePoolPop(v19);
            if (++v18 >= (unint64_t)objc_msgSend(v17, "count"))
              goto LABEL_18;
          }

          objc_autoreleasePoolPop(v19);
        }
LABEL_18:

      }
    }
  }
  else
  {
    v9 = -[PGPetQuestion initWithPetUUID:displayString:localFactoryScore:]([PGPetQuestion alloc], "initWithPetUUID:displayString:localFactoryScore:", CFSTR("PET_INITIAL_QUESTION_FAKE_ASSET"), CFSTR("🐶 🐱"), 1.0);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

  }
}

@end
