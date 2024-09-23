@implementation PGSharedLibraryAssetsQuestionFactory

+ (BOOL)isSharedLibraryQuestionsEnabledForPhotoLibrary:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "_libraryScopeFromPhotoLibrary:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (id)_libraryScopeFromPhotoLibrary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v6);

  objc_msgSend(MEMORY[0x1E0CD15E0], "fetchActiveLibraryScopeWithOptions:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, "[PGSharedLibraryAssetsQuestionFactory] no active scope", (uint8_t *)&v14, 2u);
    }
    v8 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "localIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v11;
      _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_DEFAULT, "[PGSharedLibraryAssetsQuestionFactory] more than 1 scope configured, using first one: %@", (uint8_t *)&v14, 0xCu);

    }
LABEL_8:

  }
  return v8;
}

- (unsigned)questionType
{
  return 20;
}

- (id)collidingQuestionTypes
{
  return &unk_1E84EA1F8;
}

- (int64_t)questionOptions
{
  return 0x80000;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  id v4;
  void (**v5)(void *, _BYTE *, double);
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  double v16;
  uint64_t v17;
  double v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double Current;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  PGSharedLibraryAssetsQuestion *v33;
  PGSharedLibraryAssetsQuestion *v34;
  double v35;
  PGSharedLibraryAssetsQuestion *v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void (**v46)(void *, _BYTE *, double);
  id v47;
  void *context;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  char v59;
  _BYTE v60[128];
  uint8_t v61[128];
  uint8_t buf[4];
  int v63;
  __int16 v64;
  const char *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  v5 = (void (**)(void *, _BYTE *, double))_Block_copy(v4);
  v6 = 0.0;
  if (!v5 || (v7 = CFAbsoluteTimeGetCurrent(), v7 < 0.01))
  {
LABEL_8:
    -[PGSurveyQuestionFactory workingContext](self, "workingContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend((id)objc_opt_class(), "isSharedLibraryQuestionsEnabledForPhotoLibrary:", v10) & 1) != 0)
    {
      if (a3)
      {
        v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        -[PGSharedLibraryAssetsQuestionFactory _eligibleMomentsFetchResult](self, "_eligibleMomentsFetchResult");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");
        if (v13)
        {
          v14 = v13;
          v57 = 0u;
          v58 = 0u;
          v55 = 0u;
          v56 = 0u;
          v15 = v12;
          v41 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
          if (v41)
          {
            v16 = 1.0 / (double)v14;
            v17 = *(_QWORD *)v56;
            v18 = 0.0;
            v19 = 0x1E0C99000uLL;
            v46 = v5;
            v47 = v4;
            v44 = v12;
            v45 = v10;
            v43 = v15;
            v40 = *(_QWORD *)v56;
            while (2)
            {
              v20 = 0;
              do
              {
                if (*(_QWORD *)v56 != v17)
                  objc_enumerationMutation(v15);
                v21 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v20);
                if (v5)
                {
                  Current = CFAbsoluteTimeGetCurrent();
                  if (Current - v6 >= 0.01)
                  {
                    v59 = 0;
                    v5[2](v5, &v59, v18);
                    if (v59)
                    {
                      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 67109378;
                        v63 = 72;
                        v64 = 2080;
                        v65 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Questions/Survey/SharedLibrary/PGSharedLibraryAssetsQuestionFactory.m";
                        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                      }

                      goto LABEL_61;
                    }
                    v6 = Current;
                  }
                }
                v42 = v20;
                context = (void *)MEMORY[0x1CAA4EB2C]();
                -[PGSharedLibraryAssetsQuestionFactory _assetsFetchResultFromMoment:](self, "_assetsFetchResultFromMoment:", v21);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "lastObject");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "uuid");
                v25 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(*(id *)(v19 + 3432), "distantPast");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v51 = 0u;
                v52 = 0u;
                v53 = 0u;
                v54 = 0u;
                v27 = v23;
                v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
                if (v28)
                {
                  v29 = v28;
                  v30 = *(_QWORD *)v52;
                  while (2)
                  {
                    for (i = 0; i != v29; ++i)
                    {
                      if (*(_QWORD *)v52 != v30)
                        objc_enumerationMutation(v27);
                      v32 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
                      objc_msgSend(v32, "creationDate");
                      v33 = (PGSharedLibraryAssetsQuestion *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v32, "uuid");
                      v34 = (PGSharedLibraryAssetsQuestion *)objc_claimAutoreleasedReturnValue();
                      if ((objc_msgSend(v25, "isEqualToString:", v34) & 1) != 0
                        || (-[PGSharedLibraryAssetsQuestion timeIntervalSinceDate:](v33, "timeIntervalSinceDate:", v26),
                            v35 >= 600.0))
                      {
                        v36 = -[PGSharedLibraryAssetsQuestion initWithAssetUUID:]([PGSharedLibraryAssetsQuestion alloc], "initWithAssetUUID:", v34);
                        if (-[PGSurveyQuestionFactory shouldAddQuestion:toAlreadyGeneratedQuestions:](self, "shouldAddQuestion:toAlreadyGeneratedQuestions:", v36, v11))
                        {
                          objc_msgSend(v11, "addObject:", v36);
                          if (objc_msgSend(v11, "count") >= a3)
                          {

                            objc_autoreleasePoolPop(context);
                            v5 = v46;
                            v4 = v47;
                            v12 = v44;
                            v10 = v45;
                            v15 = v43;
                            goto LABEL_49;
                          }
                        }

                        v26 = v33;
                      }
                      else
                      {
                        v36 = v34;
                        v34 = v33;
                      }

                    }
                    v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
                    if (v29)
                      continue;
                    break;
                  }
                }

                objc_autoreleasePoolPop(context);
                v18 = v16 + v18;
                v20 = v42 + 1;
                v5 = v46;
                v4 = v47;
                v12 = v44;
                v10 = v45;
                v15 = v43;
                v17 = v40;
                v19 = 0x1E0C99000;
              }
              while (v42 + 1 != v41);
              v41 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
              if (v41)
                continue;
              break;
            }
          }
LABEL_49:

          if (!v5 || CFAbsoluteTimeGetCurrent() - v6 < 0.01 || (v59 = 0, v5[2](v5, &v59, 1.0), !v59))
          {
            objc_msgSend(v11, "allObjects");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_62:

            goto LABEL_63;
          }
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
LABEL_61:
            v8 = (void *)MEMORY[0x1E0C9AA60];
            goto LABEL_62;
          }
          *(_DWORD *)buf = 67109378;
          v63 = 103;
          v64 = 2080;
          v65 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questi"
                "ons/Survey/SharedLibrary/PGSharedLibraryAssetsQuestionFactory.m";
          v38 = MEMORY[0x1E0C81028];
        }
        else
        {
          if (!v5)
            goto LABEL_61;
          if (CFAbsoluteTimeGetCurrent() - v6 < 0.01)
            goto LABEL_61;
          v59 = 0;
          v5[2](v5, &v59, 1.0);
          if (!v59 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            goto LABEL_61;
          *(_DWORD *)buf = 67109378;
          v63 = 64;
          v64 = 2080;
          v65 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questi"
                "ons/Survey/SharedLibrary/PGSharedLibraryAssetsQuestionFactory.m";
          v38 = MEMORY[0x1E0C81028];
        }
        _os_log_impl(&dword_1CA237000, v38, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_61;
      }
      if (!v5
        || CFAbsoluteTimeGetCurrent() - v6 < 0.01
        || (v59 = 0, v5[2](v5, &v59, 1.0), !v59)
        || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_47:
        v8 = (void *)MEMORY[0x1E0C9AA60];
LABEL_63:

        goto LABEL_64;
      }
      *(_DWORD *)buf = 67109378;
      v63 = 54;
      v64 = 2080;
      v65 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/SharedLibrary/PGSharedLibraryAssetsQuestionFactory.m";
      v37 = MEMORY[0x1E0C81028];
    }
    else
    {
      if (!v5)
        goto LABEL_47;
      if (CFAbsoluteTimeGetCurrent() - v6 < 0.01)
        goto LABEL_47;
      v59 = 0;
      v5[2](v5, &v59, 1.0);
      if (!v59 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_47;
      *(_DWORD *)buf = 67109378;
      v63 = 49;
      v64 = 2080;
      v65 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/SharedLibrary/PGSharedLibraryAssetsQuestionFactory.m";
      v37 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1CA237000, v37, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    goto LABEL_47;
  }
  v59 = 0;
  v5[2](v5, &v59, 0.0);
  if (!v59)
  {
    v6 = v7;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v63 = 45;
    v64 = 2080;
    v65 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/Su"
          "rvey/SharedLibrary/PGSharedLibraryAssetsQuestionFactory.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v8 = (void *)MEMORY[0x1E0C9AA60];
LABEL_64:

  return v8;
}

- (id)_eligibleMomentsFetchResult
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[2];
  uint64_t v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_libraryScopeFromPhotoLibrary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "librarySpecificFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1600], "fetchLibraryScopeRulesForLibraryScope:options:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "dateRangeCondition");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13 && objc_msgSend(v13, "criteria") == 2)
          {
            objc_msgSend(v14, "endDate");
            v16 = objc_claimAutoreleasedReturnValue();

            v7 = (void *)v16;
            goto LABEL_14;
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_14:

    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "loggingConnection");
    v18 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "localIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v34 = v19;
      v35 = 2112;
      v36 = v7;
      _os_log_impl(&dword_1CA237000, v18, OS_LOG_TYPE_INFO, "[PGSharedLibraryAssetsQuestionFactory] using scope: %@, with %@ start date", buf, 0x16u);

    }
    objc_msgSend(v3, "librarySpecificFetchOptions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *MEMORY[0x1E0CD19C0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFetchPropertySets:", v21);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("startDate >= %@"), v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setInternalPredicate:", v22);

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v23;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSortDescriptors:", v25);

    objc_msgSend(v20, "setWantsIncrementalChangeDetails:", 0);
    objc_msgSend(MEMORY[0x1E0CD1670], "fetchMomentsWithOptions:", v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_assetsFetchResultFromMoment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("kindSubtype"), 10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("kindSubtype"), 103);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setInternalPredicate:", v12);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v13;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v15);

  objc_msgSend(v7, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v4, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
