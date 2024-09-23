@implementation PGAgeCategoryQuestionFactory

- (unsigned)questionType
{
  return 10;
}

- (int64_t)questionOptions
{
  return 512;
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
  PGAgeCategoryQuestionFactory *v17;
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
  v15 = __73__PGAgeCategoryQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
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

- (id)_sortedAgeCategories
{
  return &unk_1E84EA210;
}

- (BOOL)_shouldAddNewAgeCategoryQuestionForPersonUUID:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PGSurveyQuestionFactory existingQuestionsForEntityIdentifier:](self, "existingQuestionsForEntityIdentifier:", a3);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "state", (_QWORD)v11) == 2 || !objc_msgSend(v8, "state"))
        {
          v9 = 0;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v9 = 1;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v9 = 1;
  }
LABEL_13:

  return v9;
}

void __73__PGAgeCategoryQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(void *, _BYTE *, double);
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  double Current;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  PGAgeCategoryQuestion *v27;
  unint64_t v28;
  unint64_t v29;
  BOOL v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  PGAgeCategoryQuestion *v39;
  unint64_t v40;
  unint64_t v41;
  void *v42;
  void *v43;
  __int128 v44;
  void *v45;
  void *v46;
  id v47;
  void (**v48)(void *, _BYTE *, double);
  uint64_t v49;
  void *v50;
  id obj;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  char v61;
  _BYTE v62[128];
  _BYTE v63[128];
  void *v64;
  uint8_t buf[4];
  _BYTE v66[14];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void (**)(void *, _BYTE *, double))_Block_copy(*(const void **)(a1 + 48));
  if (!v4)
  {
    v6 = 0.0;
    if (!*(_QWORD *)(a1 + 56))
      goto LABEL_61;
LABEL_10:
    v47 = v3;
    objc_msgSend(v3, "graph");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_sortedAgeCategories");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v9;
    objc_msgSend(v9, "personNodesIncludingMe:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("localIdentifier"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v10;
    objc_msgSend(v10, "sortedArrayUsingDescriptors:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    obj = v13;
    v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
    if (!v52)
    {
LABEL_55:

      v42 = v46;
      v3 = v47;
      v43 = v45;
      if (v4)
      {
        if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
        {
          v61 = 0;
          v4[2](v4, &v61, 1.0);
          if (v61)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v66 = 116;
              *(_WORD *)&v66[4] = 2080;
              *(_QWORD *)&v66[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Questions/Survey/AgeCategory/PGAgeCategoryQuestionFactory.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }
LABEL_60:

      goto LABEL_61;
    }
    v15 = *(_QWORD *)v58;
    *(_QWORD *)&v14 = 138412290;
    v44 = v14;
    v48 = v4;
    v49 = *(_QWORD *)v58;
LABEL_12:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v58 != v15)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v16);
      v18 = objc_msgSend(*(id *)(a1 + 40), "count", v44);
      if (v4)
      {
        v19 = v18;
        v20 = *(_QWORD *)(a1 + 56);
        Current = CFAbsoluteTimeGetCurrent();
        if (Current - v6 >= 0.01)
        {
          v61 = 0;
          v4[2](v4, &v61, (double)v19 / (double)v20);
          if (v61)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v66 = 62;
              *(_WORD *)&v66[4] = 2080;
              *(_QWORD *)&v66[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Questions/Survey/AgeCategory/PGAgeCategoryQuestionFactory.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            v42 = v46;
            v3 = v47;
            v43 = v45;
            goto LABEL_60;
          }
          v6 = Current;
        }
      }
      objc_msgSend(v17, "localIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD16C0], "uuidFromLocalIdentifier:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
        break;
      if (!objc_msgSend(*(id *)(a1 + 32), "_shouldAddNewAgeCategoryQuestionForPersonUUID:", v23))
        goto LABEL_29;
      v24 = (void *)objc_msgSend(v50, "mutableCopy");
      v25 = objc_msgSend(v17, "ageCategory");
      if (v25)
      {
        v26 = v25;
        v27 = -[PGAgeCategoryQuestion initWithPersonUUID:ageCategory:localFactoryScore:]([PGAgeCategoryQuestion alloc], "initWithPersonUUID:ageCategory:localFactoryScore:", v23, v25, 1.0);
        if ((objc_msgSend(*(id *)(a1 + 32), "shouldAddQuestion:toAlreadyGeneratedQuestions:", v27, *(_QWORD *)(a1 + 40)) & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v27);
          v28 = objc_msgSend(*(id *)(a1 + 40), "count");
          v29 = *(_QWORD *)(a1 + 56);

          v30 = v28 >= v29;
          v15 = v49;
          if (v30)
            goto LABEL_55;
          goto LABEL_43;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "removeObject:", v33);

      }
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v34 = v24;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v54;
        while (2)
        {
          for (i = 0; i != v36; ++i)
          {
            if (*(_QWORD *)v54 != v37)
              objc_enumerationMutation(v34);
            v39 = -[PGAgeCategoryQuestion initWithPersonUUID:ageCategory:localFactoryScore:]([PGAgeCategoryQuestion alloc], "initWithPersonUUID:ageCategory:localFactoryScore:", v23, objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "unsignedIntegerValue"), 0.5);
            if (objc_msgSend(*(id *)(a1 + 32), "shouldAddQuestion:toAlreadyGeneratedQuestions:", v39, *(_QWORD *)(a1 + 40)))
            {
              objc_msgSend(*(id *)(a1 + 40), "addObject:", v39);

              goto LABEL_41;
            }

          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
          if (v36)
            continue;
          break;
        }
      }
LABEL_41:

      v40 = objc_msgSend(*(id *)(a1 + 40), "count");
      v41 = *(_QWORD *)(a1 + 56);

      v30 = v40 >= v41;
      v4 = v48;
      v15 = v49;
      if (v30)
      {

        goto LABEL_55;
      }
LABEL_42:

LABEL_43:
      if (++v16 == v52)
      {
        v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
        if (v52)
          goto LABEL_12;
        goto LABEL_55;
      }
    }
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "loggingConnection");
    v32 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v44;
      *(_QWORD *)v66 = v22;
      _os_log_error_impl(&dword_1CA237000, v32, OS_LOG_TYPE_ERROR, "Person uuid found to be nil given local identifier %@", buf, 0xCu);
    }

LABEL_29:
    goto LABEL_42;
  }
  v5 = CFAbsoluteTimeGetCurrent();
  v6 = 0.0;
  if (v5 >= 0.01)
  {
    v7 = v5;
    v61 = 0;
    v4[2](v4, &v61, 0.0);
    if (v61)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v66 = 45;
        *(_WORD *)&v66[4] = 2080;
        *(_QWORD *)&v66[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Questions/Survey/AgeCategory/PGAgeCategoryQuestionFactory.m";
        v8 = MEMORY[0x1E0C81028];
LABEL_50:
        _os_log_impl(&dword_1CA237000, v8, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_61;
      }
      goto LABEL_61;
    }
    v6 = v7;
  }
  if (*(_QWORD *)(a1 + 56))
    goto LABEL_10;
  if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
  {
    v61 = 0;
    v4[2](v4, &v61, 1.0);
    if (v61)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v66 = 49;
        *(_WORD *)&v66[4] = 2080;
        *(_QWORD *)&v66[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Questions/Survey/AgeCategory/PGAgeCategoryQuestionFactory.m";
        v8 = MEMORY[0x1E0C81028];
        goto LABEL_50;
      }
    }
  }
LABEL_61:

}

@end
