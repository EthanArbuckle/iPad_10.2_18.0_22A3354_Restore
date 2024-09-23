@implementation PGSyndicatedAssetsQuestionFactory

- (unsigned)questionType
{
  return 18;
}

- (int64_t)questionOptions
{
  return 0x20000;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  double Current;
  double v7;
  double v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  os_signpost_id_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t i;
  void *v27;
  void *v28;
  NSObject *v29;
  PGSyndicatedAssetsQuestion *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  double v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  unint64_t v40;
  uint64_t v41;
  uint32_t denom;
  uint32_t numer;
  id v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  os_signpost_id_t v50;
  uint64_t v51;
  void *v52;
  unint64_t v53;
  void (**v54)(void *, mach_timebase_info *, double);
  char v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  mach_timebase_info info;
  id v61;
  uint8_t buf[4];
  _BYTE v63[18];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v54 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(a4);
  if (v54)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = 0.0;
    if (Current >= 0.01)
    {
      v8 = Current;
      LOBYTE(info.numer) = 0;
      v54[2](v54, &info, 0.0);
      if (LOBYTE(info.numer))
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
LABEL_59:
          v11 = (void *)MEMORY[0x1E0C9AA60];
          goto LABEL_78;
        }
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v63 = 37;
        *(_WORD *)&v63[4] = 2080;
        *(_QWORD *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Questions/Survey/SyndicatedAssets/PGSyndicatedAssetsQuestionFactory.m";
        v9 = MEMORY[0x1E0C81028];
LABEL_58:
        _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_59;
      }
      v7 = v8;
    }
    if (!-[PGSyndicatedAssetsQuestionFactory _isHubbleFeatureFlagEnabled](self, "_isHubbleFeatureFlagEnabled"))
    {
      if (CFAbsoluteTimeGetCurrent() - v7 < 0.01)
        goto LABEL_59;
      LOBYTE(info.numer) = 0;
      v54[2](v54, &info, 1.0);
      if (!LOBYTE(info.numer) || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_59;
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v63 = 40;
      *(_WORD *)&v63[4] = 2080;
      *(_QWORD *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Questions/Survey/SyndicatedAssets/PGSyndicatedAssetsQuestionFactory.m";
      v9 = MEMORY[0x1E0C81028];
      goto LABEL_58;
    }
    if (!a3)
    {
      if (CFAbsoluteTimeGetCurrent() - v7 < 0.01)
        goto LABEL_59;
      LOBYTE(info.numer) = 0;
      v54[2](v54, &info, 1.0);
      if (!LOBYTE(info.numer) || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_59;
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v63 = 45;
      *(_WORD *)&v63[4] = 2080;
      *(_QWORD *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Questions/Survey/SyndicatedAssets/PGSyndicatedAssetsQuestionFactory.m";
      v9 = MEMORY[0x1E0C81028];
      goto LABEL_58;
    }
  }
  else
  {
    v10 = -[PGSyndicatedAssetsQuestionFactory _isHubbleFeatureFlagEnabled](self, "_isHubbleFeatureFlagEnabled");
    v11 = (void *)MEMORY[0x1E0C9AA60];
    if (!a3)
      goto LABEL_78;
    v7 = 0.0;
    if (!v10)
      goto LABEL_78;
  }
  v61 = 0;
  -[PGSyndicatedAssetsQuestionFactory _syndicatedPhotoLibraryWithError:](self, "_syndicatedPhotoLibraryWithError:", &v61);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v61;
  v14 = v13;
  if (!v12 || v13)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "loggingConnection");
    v39 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v63 = v14;
      _os_log_error_impl(&dword_1CA237000, v39, OS_LOG_TYPE_ERROR, "PGSyndicatedAssetsQuestionFactory: Failed to open syndicated library: %@", buf, 0xCu);
    }

    if (v54)
    {
      if (CFAbsoluteTimeGetCurrent() - v7 >= 0.01)
      {
        LOBYTE(info.numer) = 0;
        v54[2](v54, &info, 1.0);
        if (LOBYTE(info.numer))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v63 = 53;
            *(_WORD *)&v63[4] = 2080;
            *(_QWORD *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Questions/Survey/SyndicatedAssets/PGSyndicatedAssetsQuestionFactory.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v15 = MEMORY[0x1E0C81028];
    v16 = MEMORY[0x1E0C81028];
    v17 = os_signpost_id_generate(v15);
    v18 = v15;
    v53 = v17 - 1;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_BEGIN, v17, "SyndicatedAssetsQuestionGeneration", ", buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v51 = mach_absolute_time();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGSyndicatedAssetsQuestionFactory _validRandomAssetsWithLimit:photoLibrary:](self, "_validRandomAssetsWithLimit:photoLibrary:", a3, v12);
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    if (v21)
    {
      v22 = v21;
      v50 = v17;
      v52 = v12;
      v23 = 0;
      v24 = *(_QWORD *)v57;
      v25 = (double)a3;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v57 != v24)
            objc_enumerationMutation(v20);
          v27 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_msgSend(v27, "curationProperties");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "syndicationIdentifier");
          v29 = objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            v30 = -[PGSyndicatedAssetsQuestion initWithAssetSyndicationIdentifier:]([PGSyndicatedAssetsQuestion alloc], "initWithAssetSyndicationIdentifier:", v29);
            if (-[PGSurveyQuestionFactory shouldAddQuestion:toAlreadyGeneratedQuestions:](self, "shouldAddQuestion:toAlreadyGeneratedQuestions:", v30, v19))
            {
              objc_msgSend(v19, "addObject:", v30);
            }
            else
            {
              ++v23;
            }
            v33 = objc_msgSend(v19, "count");
            if (v54)
            {
              v34 = v33;
              v35 = CFAbsoluteTimeGetCurrent();
              if (v35 - v7 >= 0.01)
              {
                v55 = 0;
                v54[2](v54, (mach_timebase_info *)&v55, (double)v34 / v25);
                if (v55)
                {
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)v63 = 77;
                    *(_WORD *)&v63[4] = 2080;
                    *(_QWORD *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Questions/Survey/SyndicatedAssets/PGSyndicatedAssetsQuestionFactory.m";
                    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }

                  v11 = (void *)MEMORY[0x1E0C9AA60];
                  v14 = 0;
                  v12 = v52;
                  goto LABEL_76;
                }
                v7 = v35;
              }
            }

          }
          else
          {
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "loggingConnection");
            v29 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v27, "uuid");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v63 = v32;
              _os_log_error_impl(&dword_1CA237000, v29, OS_LOG_TYPE_ERROR, "PGSyndicatedAssetsQuestionFactory: syndication identifier is nil for asset %@", buf, 0xCu);

            }
          }

        }
        v22 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
        if (v22)
          continue;
        break;
      }

      if (!v23)
      {
        v14 = 0;
        v12 = v52;
        v17 = v50;
        v40 = v53;
        goto LABEL_62;
      }
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "loggingConnection");
      v37 = objc_claimAutoreleasedReturnValue();

      v14 = 0;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v63 = v23;
        _os_log_impl(&dword_1CA237000, v37, OS_LOG_TYPE_DEFAULT, "PGSyndicatedAssetsQuestionFactory: skipping %lu questions because other questions already exist for the same assets.", buf, 0xCu);
      }
      v12 = v52;
      v17 = v50;
    }
    else
    {
      v37 = v20;
    }
    v40 = v53;

LABEL_62:
    v41 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v44 = MEMORY[0x1E0C81028];
    if (v40 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_END, v17, "SyndicatedAssetsQuestionGeneration", ", buf, 2u);
    }
    v45 = MEMORY[0x1E0C81028];

    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v63 = "SyndicatedAssetsQuestionGeneration";
      *(_WORD *)&v63[8] = 2048;
      *(double *)&v63[10] = (float)((float)((float)((float)(v41 - v51) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    if (v54 && CFAbsoluteTimeGetCurrent() - v7 >= 0.01 && (v55 = 0, v54[2](v54, (mach_timebase_info *)&v55, 1.0), v55))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v63 = 86;
        *(_WORD *)&v63[4] = 2080;
        *(_QWORD *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Questions/Survey/SyndicatedAssets/PGSyndicatedAssetsQuestionFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v11 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "loggingConnection");
      v47 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        v48 = objc_msgSend(v19, "count");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v63 = v48;
        _os_log_impl(&dword_1CA237000, v47, OS_LOG_TYPE_DEFAULT, "PGSyndicatedAssetsQuestionFactory: returning %lu questions to be saved.", buf, 0xCu);
      }

      objc_msgSend(v19, "allObjects");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_76:

  }
LABEL_78:

  return v11;
}

- (id)_validRandomAssetsWithLimit:(unint64_t)a3 photoLibrary:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint8_t v32[8];
  _QWORD v33[3];
  _QWORD v34[2];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setChunkSizeForFetch:", 200);
  objc_msgSend(v7, "setCacheSizeForFetch:", 200);
  v9 = *MEMORY[0x1E0CD19F0];
  v34[0] = *MEMORY[0x1E0CD1A50];
  v8 = v34[0];
  v34[1] = v9;
  v35 = *MEMORY[0x1E0CD1978];
  v10 = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchPropertySets:", v11);

  objc_msgSend(MEMORY[0x1E0D77E50], "internalPredicateToFilterGuestSyndicatedAssetsEligibleForQuestion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInternalPredicate:", v12);

  objc_msgSend(v7, "setIncludeGuestAssets:", 1);
  -[PGSyndicatedAssetsQuestionFactory _allAssetsFetchResultWithOptions:](self, "_allAssetsFetchResultWithOptions:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setChunkSizeForFetch:", 200);
  objc_msgSend(v14, "setCacheSizeForFetch:", 200);
  v33[0] = v8;
  v33[1] = v9;
  v33[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFetchPropertySets:", v15);

  objc_msgSend(MEMORY[0x1E0D77E50], "internalPredicateToFilterSyndicatedAssetsEligibleForQuestion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setInternalPredicate:", v16);

  -[PGSyndicatedAssetsQuestionFactory _allAssetsFetchResultWithOptions:](self, "_allAssetsFetchResultWithOptions:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = a3 >> 1;
  if (a3 >> 1 >= objc_msgSend(v13, "count"))
    v18 = objc_msgSend(v13, "count");
  v19 = a3 - v18;
  v20 = objc_msgSend(v17, "count");
  if (v19 >= v20)
    v19 = v20;
  v21 = a3 - v19;
  v22 = objc_msgSend(v13, "count");
  if (v21 >= v22)
    v23 = v22;
  else
    v23 = v21;
  -[PGSyndicatedAssetsQuestionFactory _validRandomAssetsFromFetchResult:limit:](self, "_validRandomAssetsFromFetchResult:limit:", v13, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSyndicatedAssetsQuestionFactory _validRandomAssetsFromFetchResult:limit:](self, "_validRandomAssetsFromFetchResult:limit:", v17, v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v25, "count") + objc_msgSend(v24, "count"));
  objc_msgSend(v24, "allObjects");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObjectsFromArray:", v27);

  objc_msgSend(v25, "allObjects");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObjectsFromArray:", v28);

  if (!objc_msgSend(v26, "count"))
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "loggingConnection");
    v30 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_1CA237000, v30, OS_LOG_TYPE_DEFAULT, "PGSyndicatedAssetsQuestionFactory: no valid random samples.", v32, 2u);
    }

  }
  return v26;
}

- (id)_allAssetsFetchResultWithOptions:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", a3);
}

- (BOOL)_isHubbleFeatureFlagEnabled
{
  return 1;
}

- (id)_syndicatedPhotoLibraryWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CD16F8], "openPhotoLibraryWithWellKnownIdentifier:error:", 3, a3);
}

- (id)_validRandomAssetsFromFetchResult:(id)a3 limit:(unint64_t)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v5 = a3;
  if (a4)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    if (objc_msgSend(v5, "count"))
    {
      v7 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v8);

        ++v7;
      }
      while (v7 < objc_msgSend(v5, "count"));
    }
    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    while (objc_msgSend(v6, "count") && objc_msgSend(v9, "count") < a4)
    {
      v10 = (void *)MEMORY[0x1CAA4EB2C]();
      v11 = arc4random_uniform(objc_msgSend(v6, "count"));
      objc_msgSend(v6, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "unsignedIntegerValue");

      objc_msgSend(v5, "objectAtIndexedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObjectAtIndex:", v11);
      objc_msgSend(v14, "mediaAnalysisProperties");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LOWORD(v13) = objc_msgSend(v15, "syndicationProcessingValue");

      if ((v13 & 0x1000) == 0 && (unint64_t)(objc_msgSend(v14, "syndicationEligibility") + 1) <= 3)
        objc_msgSend(v9, "addObject:", v14);

      objc_autoreleasePoolPop(v10);
    }

  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  }

  return v9;
}

@end
