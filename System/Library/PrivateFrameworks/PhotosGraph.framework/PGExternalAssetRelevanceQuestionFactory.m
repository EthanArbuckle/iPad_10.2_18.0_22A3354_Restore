@implementation PGExternalAssetRelevanceQuestionFactory

- (int64_t)questionOptions
{
  return 0x8000000;
}

- (unsigned)questionType
{
  return 29;
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
  PGExternalAssetRelevanceQuestionFactory *v17;
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
  v15 = __84__PGExternalAssetRelevanceQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
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

void __84__PGExternalAssetRelevanceQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(void *, _BYTE *, double);
  double Current;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  double v35;
  void *v36;
  __int16 v37;
  void (**v38)(void *, _BYTE *, double);
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  _BOOL8 v45;
  void *v46;
  PGExternalAssetRelevanceQuestion *v47;
  void *v48;
  PGExternalAssetRelevanceQuestion *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id obj;
  void (**v60)(void *, _BYTE *, double);
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *context;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  char v75;
  void *v76;
  void *v77;
  _BYTE v78[128];
  _QWORD v79[2];
  uint8_t v80[128];
  uint8_t buf[4];
  int v82;
  __int16 v83;
  const char *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void (**)(void *, _BYTE *, double))_Block_copy(*(const void **)(a1 + 48));
  if (!v4)
  {
    v6 = 0.0;
    if (!*(_QWORD *)(a1 + 56))
      goto LABEL_48;
    goto LABEL_10;
  }
  Current = CFAbsoluteTimeGetCurrent();
  v6 = 0.0;
  if (Current >= 0.01)
  {
    v7 = Current;
    v75 = 0;
    v4[2](v4, &v75, 0.0);
    if (v75)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v82 = 37;
        v83 = 2080;
        v84 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/ExternalAssetRelevance/PGExternalAssetRelevanceQuestionFactory.m";
        v8 = MEMORY[0x1E0C81028];
LABEL_37:
        _os_log_impl(&dword_1CA237000, v8, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_48;
      }
      goto LABEL_48;
    }
    v6 = v7;
  }
  if (*(_QWORD *)(a1 + 56))
  {
LABEL_10:
    v58 = v3;
    v64 = a1;
    objc_msgSend(*(id *)(a1 + 32), "workingContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v63 = v10;
    objc_msgSend(v10, "librarySpecificFetchOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type == %d"), 29);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPredicate:", v12);

    v57 = v11;
    objc_msgSend(MEMORY[0x1E0CD1720], "fetchQuestionsWithOptions:validQuestionsOnly:", v11, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v72 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "entityIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
      }
      while (v17);
    }
    v54 = v15;

    objc_msgSend(v63, "librarySpecificFetchOptions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFetchPropertySets:", v22);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (uuid IN %@)"), v14);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0D77E80], "internalPredicateToIncludeProcessedExternalAssets");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = v25;
    v79[1] = v23;
    v55 = (void *)v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "andPredicateWithSubpredicates:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setInternalPredicate:", v27);

    objc_msgSend(v21, "setFetchLimit:", 1000);
    v56 = v21;
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v21);
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
    if (v62)
    {
      v61 = *(_QWORD *)v68;
      v28 = v64;
      v60 = v4;
      while (2)
      {
        for (j = 0; j != v62; ++j)
        {
          if (*(_QWORD *)v68 != v61)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
          v31 = (void *)MEMORY[0x1CAA4EB2C]();
          v32 = objc_msgSend(*(id *)(v28 + 40), "count");
          if (v4)
          {
            v33 = v32;
            v34 = *(_QWORD *)(v28 + 56);
            v35 = CFAbsoluteTimeGetCurrent();
            if (v35 - v6 >= 0.01)
            {
              v75 = 0;
              v4[2](v4, &v75, (double)v33 / (double)v34 * 0.9);
              if (v75)
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  v82 = 68;
                  v83 = 2080;
                  v84 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewor"
                        "k/Questions/Survey/ExternalAssetRelevance/PGExternalAssetRelevanceQuestionFactory.m";
                  _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
                objc_autoreleasePoolPop(v31);

                v50 = v57;
                v3 = v58;
                v52 = v55;
                v51 = v56;
                v53 = v54;
                goto LABEL_47;
              }
              v6 = v35;
            }
          }
          context = v31;
          objc_msgSend(v30, "mediaAnalysisProperties");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "syndicationProcessingValue");

          objc_msgSend(v63, "librarySpecificFetchOptions");
          v38 = v4;
          v39 = objc_claimAutoreleasedReturnValue();
          v77 = v30;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          +[PGShareBackSuggesterInput universalDateIntervalForSuggesterInputs:withTimeIntervalPadding:](PGShareBackSuggesterInput, "universalDateIntervalForSuggesterInputs:withTimeIntervalPadding:", v40, 7200.0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          v76 = v30;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = (void *)v39;
          v43 = v39;
          v4 = v38;
          +[PGShareBackSuggester momentUUIDsForExtendedUniversalDateInterval:suggesterInputs:momentFetchOptions:](PGShareBackSuggester, "momentUUIDsForExtendedUniversalDateInterval:suggesterInputs:momentFetchOptions:", v41, v42, v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v44, "count"))
          {
            v45 = (v37 & 0x3CF1) != 0;
            objc_msgSend(MEMORY[0x1E0CD1670], "localIdentifiersWithUUIDs:", v44);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = [PGExternalAssetRelevanceQuestion alloc];
            objc_msgSend(v30, "uuid");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = -[PGExternalAssetRelevanceQuestion initWithAssetUUID:momentLocalIdentifiers:assetInferredAsRelevant:](v47, "initWithAssetUUID:momentLocalIdentifiers:assetInferredAsRelevant:", v48, v46, v45);

            if (objc_msgSend(*(id *)(v64 + 32), "shouldAddQuestion:toAlreadyGeneratedQuestions:", v49, *(_QWORD *)(v64 + 40)))
            {
              objc_msgSend(*(id *)(v64 + 40), "addObject:", v49);
              if ((unint64_t)objc_msgSend(*(id *)(v64 + 40), "count") >= *(_QWORD *)(v64 + 56))
              {

                objc_autoreleasePoolPop(context);
                v4 = v60;
                goto LABEL_42;
              }
            }

            v4 = v60;
          }

          objc_autoreleasePoolPop(context);
          v28 = v64;
        }
        v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
        if (v62)
          continue;
        break;
      }
    }
LABEL_42:

    v50 = v57;
    v3 = v58;
    v52 = v55;
    v51 = v56;
    v53 = v54;
    if (v4)
    {
      if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
      {
        v75 = 0;
        v4[2](v4, &v75, 1.0);
        if (v75)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v82 = 95;
            v83 = 2080;
            v84 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Ques"
                  "tions/Survey/ExternalAssetRelevance/PGExternalAssetRelevanceQuestionFactory.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
LABEL_47:

    goto LABEL_48;
  }
  if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
  {
    v75 = 0;
    v4[2](v4, &v75, 1.0);
    if (v75)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v82 = 40;
        v83 = 2080;
        v84 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/ExternalAssetRelevance/PGExternalAssetRelevanceQuestionFactory.m";
        v8 = MEMORY[0x1E0C81028];
        goto LABEL_37;
      }
    }
  }
LABEL_48:

}

@end
