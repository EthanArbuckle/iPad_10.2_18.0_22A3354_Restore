@implementation PGRecentAestheticsSuggester

+ (NSIndexSet)suggestionTypes
{
  return (NSIndexSet *)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 3);
}

+ (NSIndexSet)suggestionSubtypes
{
  return (NSIndexSet *)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 303);
}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  id v6;
  void *v7;
  double v8;
  char v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  double Current;
  char v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  double v25;
  uint64_t i;
  uint64_t v27;
  double v28;
  char v29;
  PGSingleAssetSuggestion *v30;
  void *v31;
  double v32;
  char v33;
  void *v35;
  PGRecentAestheticsSuggester *v36;
  id obj;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  id v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  double *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  uint8_t v60[128];
  uint8_t buf[4];
  int v62;
  __int16 v63;
  const char *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v40 = a4;
  v7 = _Block_copy(v40);
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  v52 = 0;
  v53 = (double *)&v52;
  v54 = 0x2020000000;
  v55 = 0;
  if (!v7
    || (v8 = CFAbsoluteTimeGetCurrent(), v8 - v53[3] < 0.01)
    || (v53[3] = v8,
        v51 = 0,
        (*((void (**)(void *, char *, double))v7 + 2))(v7, &v51, 0.0),
        v9 = *((_BYTE *)v57 + 24) | v51,
        (*((_BYTE *)v57 + 24) = v9) == 0))
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v6, "universalStartDate");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "universalEndDate");
    v13 = objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __63__PGRecentAestheticsSuggester_suggestionsWithOptions_progress___block_invoke;
    v46[3] = &unk_1E8434F30;
    v14 = v7;
    v47 = v14;
    v48 = &v52;
    v49 = &v56;
    v50 = 0x3F847AE147AE147BLL;
    -[PGRecentAestheticsSuggester niceAssetsBetweenStartDate:andEndDate:matchingAssetUUID:progress:](self, "niceAssetsBetweenStartDate:andEndDate:matchingAssetUUID:progress:", v12, v13, 0, v46);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)v12;
    v39 = (void *)v13;
    if (*((_BYTE *)v57 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v62 = 65;
        v63 = 2080;
        v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentAestheticsSuggester.m";
        v15 = MEMORY[0x1E0C81028];
LABEL_10:
        _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      if (v7)
      {
        Current = CFAbsoluteTimeGetCurrent();
        if (Current - v53[3] >= 0.01)
        {
          v53[3] = Current;
          v51 = 0;
          (*((void (**)(id, char *, double))v14 + 2))(v14, &v51, 0.5);
          v17 = *((_BYTE *)v57 + 24) | v51;
          *((_BYTE *)v57 + 24) = v17;
          if (v17)
          {
            if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              goto LABEL_11;
            *(_DWORD *)buf = 67109378;
            v62 = 67;
            v63 = 2080;
            v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Single Asset Suggester/PGRecentAestheticsSuggester.m";
            v15 = MEMORY[0x1E0C81028];
            goto LABEL_10;
          }
        }
      }
      if (objc_msgSend(v41, "count"))
      {
        -[PGRecentAestheticsSuggester suggestedAssetsInAssets:options:](self, "suggestedAssetsInAssets:options:", v41, v6);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v35, "count"))
        {
          v18 = objc_msgSend(v6, "maximumNumberOfSuggestions");
          if (v18)
            v19 = v18;
          else
            v19 = -1;
          v20 = objc_msgSend(v35, "count");
          v36 = self;
          if (v20 >= v19)
            v21 = v19;
          else
            v21 = v20;
          v44 = 0u;
          v45 = 0u;
          v42 = 0u;
          v43 = 0u;
          obj = v35;
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v60, 16);
          if (v22)
          {
            v23 = 1.0 / (double)v21;
            v24 = *(_QWORD *)v43;
            v25 = 0.0;
            while (2)
            {
              for (i = 0; i != v22; ++i)
              {
                if (*(_QWORD *)v43 != v24)
                  objc_enumerationMutation(obj);
                v27 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
                if (v7)
                {
                  v28 = CFAbsoluteTimeGetCurrent();
                  if (v28 - v53[3] >= 0.01)
                  {
                    v53[3] = v28;
                    v51 = 0;
                    (*((void (**)(id, char *, double))v14 + 2))(v14, &v51, v25 * 0.5 + 0.5);
                    v29 = *((_BYTE *)v57 + 24) | v51;
                    *((_BYTE *)v57 + 24) = v29;
                    if (v29)
                    {
                      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 67109378;
                        v62 = 80;
                        v63 = 2080;
                        v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Single Asset Suggester/PGRecentAestheticsSuggester.m";
                        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                      }

                      goto LABEL_11;
                    }
                  }
                }
                v30 = -[PGSingleAssetSuggestion initWithType:subtype:asset:]([PGSingleAssetSuggestion alloc], "initWithType:subtype:asset:", 3, 303, v27);
                if (v30)
                {
                  if (objc_msgSend(v6, "computeReasons"))
                  {
                    -[PGRecentAestheticsSuggester reasonsForSuggestion:](v36, "reasonsForSuggestion:", v30);
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    -[PGSingleAssetSuggestion setReasons:](v30, "setReasons:", v31);

                  }
                  objc_msgSend(v11, "addObject:", v30);
                  if (objc_msgSend(v11, "count") >= v19)
                  {

                    goto LABEL_42;
                  }
                  v25 = v23 + v25;
                }

              }
              v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v60, 16);
              if (v22)
                continue;
              break;
            }
          }
LABEL_42:

        }
      }
      if (!v7
        || (v32 = CFAbsoluteTimeGetCurrent(), v32 - v53[3] < 0.01)
        || (v53[3] = v32,
            v51 = 0,
            (*((void (**)(id, char *, double))v14 + 2))(v14, &v51, 1.0),
            v33 = *((_BYTE *)v57 + 24) | v51,
            (*((_BYTE *)v57 + 24) = v33) == 0))
      {
        v10 = v11;
        goto LABEL_50;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v62 = 101;
        v63 = 2080;
        v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentAestheticsSuggester.m";
        v15 = MEMORY[0x1E0C81028];
        goto LABEL_10;
      }
    }
LABEL_11:
    v10 = (id)MEMORY[0x1E0C9AA60];
LABEL_50:

    goto LABEL_51;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v62 = 56;
    v63 = 2080;
    v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestions/"
          "Suggesters/Single Asset Suggester/PGRecentAestheticsSuggester.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v10 = (id)MEMORY[0x1E0C9AA60];
LABEL_51:
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);

  return v10;
}

- (BOOL)canGenerateSuggestionWithAsset:(id)a3 onDate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v5 = a3;
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGRecentAestheticsSuggester niceAssetsBetweenStartDate:andEndDate:matchingAssetUUID:progress:](self, "niceAssetsBetweenStartDate:andEndDate:matchingAssetUUID:progress:", 0, 0, v6, &__block_literal_global_39582);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGRecentAestheticsSuggester suggestedAssetsInAssets:](self, "suggestedAssetsInAssets:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") == 1)
  {
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)startSuggestingWithOptions:(id)a3
{
  PGSuggestionOptions *v4;
  void *v5;
  NSObject *v6;
  NSArray *suggestedAssets;
  NSEnumerator *suggestedAssetEnumerator;
  PGSuggestionOptions *options;
  uint8_t v10[16];

  v4 = (PGSuggestionOptions *)a3;
  -[PGAbstractSuggester session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loggingConnection");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_DEFAULT, "Recent Aesthetics: Starting suggesting", v10, 2u);
  }

  suggestedAssets = self->_suggestedAssets;
  self->_suggestedAssets = 0;

  suggestedAssetEnumerator = self->_suggestedAssetEnumerator;
  self->_suggestedAssetEnumerator = 0;

  options = self->_options;
  self->_options = v4;

}

- (id)nextSuggestionWithProgress:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSEnumerator *suggestedAssetEnumerator;
  NSArray *suggestedAssets;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  NSEnumerator *v14;
  NSEnumerator *v15;
  void *v16;
  PGSingleAssetSuggestion *v17;
  PGSingleAssetSuggestion *v18;
  void *v19;
  int v21;
  PGSingleAssetSuggestion *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGAbstractSuggester session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loggingConnection");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21) = 0;
    _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_DEFAULT, "Recent Aesthetics: nextSuggestion", (uint8_t *)&v21, 2u);
  }
  suggestedAssetEnumerator = self->_suggestedAssetEnumerator;
  if (!suggestedAssetEnumerator)
  {
    suggestedAssets = self->_suggestedAssets;
    if (!suggestedAssets)
    {
      -[PGSuggestionOptions universalStartDate](self->_options, "universalStartDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGSuggestionOptions universalEndDate](self->_options, "universalEndDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGRecentAestheticsSuggester niceAssetsBetweenStartDate:andEndDate:matchingAssetUUID:progress:](self, "niceAssetsBetweenStartDate:andEndDate:matchingAssetUUID:progress:", v9, v10, 0, v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGRecentAestheticsSuggester suggestedAssetsInAssets:](self, "suggestedAssetsInAssets:", v11);
      v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v13 = self->_suggestedAssets;
      self->_suggestedAssets = v12;

      suggestedAssets = self->_suggestedAssets;
    }
    -[NSArray objectEnumerator](suggestedAssets, "objectEnumerator");
    v14 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
    v15 = self->_suggestedAssetEnumerator;
    self->_suggestedAssetEnumerator = v14;

    suggestedAssetEnumerator = self->_suggestedAssetEnumerator;
  }
  -[NSEnumerator nextObject](suggestedAssetEnumerator, "nextObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16
    && (v17 = -[PGSingleAssetSuggestion initWithType:subtype:asset:]([PGSingleAssetSuggestion alloc], "initWithType:subtype:asset:", 3, 303, v16)) != 0)
  {
    v18 = v17;
    if (-[PGSuggestionOptions computeReasons](self->_options, "computeReasons"))
    {
      -[PGRecentAestheticsSuggester reasonsForSuggestion:](self, "reasonsForSuggestion:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGSingleAssetSuggestion setReasons:](v18, "setReasons:", v19);

    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138477827;
      v22 = v18;
      _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_DEFAULT, "Recent Aesthetics: Suggesting %{private}@", (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_DEFAULT, "Recent Aesthetics: Nothing to suggest", (uint8_t *)&v21, 2u);
    }
    v18 = 0;
  }

  return v18;
}

- (void)reset
{
  void *v3;
  NSObject *v4;
  NSEnumerator *suggestedAssetEnumerator;
  uint8_t v6[16];

  -[PGAbstractSuggester session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loggingConnection");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CA237000, v4, OS_LOG_TYPE_DEFAULT, "Recent Aesthetics: Resetting", v6, 2u);
  }

  suggestedAssetEnumerator = self->_suggestedAssetEnumerator;
  self->_suggestedAssetEnumerator = 0;

}

- (id)niceAssetsBetweenStartDate:(id)a3 andEndDate:(id)a4 matchingAssetUUID:(id)a5 progress:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(void *, _BYTE *, double);
  double v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double Current;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[5];
  char v51;
  uint8_t buf[4];
  _BYTE v53[18];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(void *, _BYTE *, double))_Block_copy(a6);
  v14 = 0.0;
  if (!v13 || (v15 = CFAbsoluteTimeGetCurrent(), v15 < 0.01))
  {
LABEL_8:
    -[PGAbstractSuggester session](self, "session");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v17)
    {
      v16 = (id)MEMORY[0x1E0C9AA60];
LABEL_44:

      goto LABEL_45;
    }
    v45 = v17;
    objc_msgSend(v17, "loggingConnection");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v53 = v10;
      *(_WORD *)&v53[8] = 2112;
      *(_QWORD *)&v53[10] = v11;
      _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_DEFAULT, "Recent Aesthetics: Computing eligible nice assets between %@ and %@", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("overallAestheticScore >= %f"), 0x3FE4CCCCCCCCCCCDLL);
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("curationScore > %f"), *MEMORY[0x1E0D77DE0]);
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "noVideoPredicate");
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "internalPredicateForProcessedAssetsWithMinimumSceneAnalysisVersion:", 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)v22;
    v48 = (void *)v21;
    v42 = (void *)v20;
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v20, v21, v22, v46, 0);
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dateCreated >= %@"), v10);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v24);

    }
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dateCreated <= %@"), v11);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v25);

    }
    v18 = v45;
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid == %@"), v12);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v26);

    }
    v43 = v12;
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v23);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGAbstractSuggester defaultAssetFetchOptionsWithInternalPredicate:](self, "defaultAssetFetchOptionsWithInternalPredicate:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFetchPropertySets:", v28);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v27);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v14 >= 0.01)
      {
        v51 = 0;
        v13[2](v13, &v51, 0.4);
        if (v51)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v53 = 222;
            *(_WORD *)&v53[4] = 2080;
            *(_QWORD *)&v53[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentAestheticsSuggester.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v16 = (id)MEMORY[0x1E0C9AA60];
          v30 = v42;
          goto LABEL_43;
        }
        v14 = Current;
      }
    }
    v41 = v10;
    v31 = objc_msgSend(MEMORY[0x1E0CD1390], "clsPrefetchOptionsForKeyAsset");
    v32 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(v45, "curationContext");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "clsAllAssetsFromFetchResult:prefetchOptions:curationContext:", v49, v31, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v35 = CFAbsoluteTimeGetCurrent();
      if (v35 - v14 >= 0.01)
      {
        v51 = 0;
        v13[2](v13, &v51, 0.8);
        if (v51)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v53 = 227;
            *(_WORD *)&v53[4] = 2080;
            *(_QWORD *)&v53[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentAestheticsSuggester.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v16 = (id)MEMORY[0x1E0C9AA60];
          v12 = v43;
LABEL_42:
          v30 = v42;

          v10 = v41;
LABEL_43:

          goto LABEL_44;
        }
        v14 = v35;
      }
    }
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __96__PGRecentAestheticsSuggester_niceAssetsBetweenStartDate_andEndDate_matchingAssetUUID_progress___block_invoke;
    v50[3] = &unk_1E8430EB8;
    v50[4] = self;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v50);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "filteredArrayUsingPredicate:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = v19;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = objc_msgSend(v37, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v53 = v39;
      _os_log_impl(&dword_1CA237000, v38, OS_LOG_TYPE_DEFAULT, "Recent Aesthetics: found %lu eligible assets", buf, 0xCu);
    }

    v12 = v43;
    if (v13 && CFAbsoluteTimeGetCurrent() - v14 >= 0.01 && (v51 = 0, v13[2](v13, &v51, 1.0), v51))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v53 = 234;
        *(_WORD *)&v53[4] = 2080;
        *(_QWORD *)&v53[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/Suggesters/Single Asset Suggester/PGRecentAestheticsSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v16 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v16 = v37;
    }

    goto LABEL_42;
  }
  v51 = 0;
  v13[2](v13, &v51, 0.0);
  if (!v51)
  {
    v14 = v15;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v53 = 179;
    *(_WORD *)&v53[4] = 2080;
    *(_QWORD *)&v53[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Suggestions/Suggesters/Single Asset Suggester/PGRecentAestheticsSuggester.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v16 = (id)MEMORY[0x1E0C9AA60];
LABEL_45:

  return v16;
}

- (id)suggestedAssetsInAssets:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v11, "clsPeopleCount", (_QWORD)v19)
          || -[PGAbstractSuggester hasSuggestableScenesWithAsset:](self, "hasSuggestableScenesWithAsset:", v11))
        {
          objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("overallAestheticScore"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("curationScore"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v13;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v14;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)suggestedAssetsInAssets:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;

  v6 = a4;
  -[PGRecentAestheticsSuggester suggestedAssetsInAssets:](self, "suggestedAssetsInAssets:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "maximumNumberOfSuggestions");

  if (v8 < objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "subarrayWithRange:", 0, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  return v7;
}

- (id)reasonsForSuggestion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "keyAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "overallAestheticScore");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("aesthetics = %.3f"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "curationScore");
  objc_msgSend(v8, "stringWithFormat:", CFSTR("curation = %.3f"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedAssetEnumerator, 0);
  objc_storeStrong((id *)&self->_suggestedAssets, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

uint64_t __96__PGRecentAestheticsSuggester_niceAssetsBetweenStartDate_andEndDate_matchingAssetUUID_progress___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processedAssetIsValidForSuggesting:allowGuestAsset:", a2, 0);
}

void __63__PGRecentAestheticsSuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

@end
