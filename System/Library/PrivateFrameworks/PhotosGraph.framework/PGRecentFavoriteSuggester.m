@implementation PGRecentFavoriteSuggester

+ (NSIndexSet)suggestionTypes
{
  return (NSIndexSet *)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 3);
}

+ (NSIndexSet)suggestionSubtypes
{
  return (NSIndexSet *)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 301);
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
  void *v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t i;
  uint64_t v26;
  double v27;
  char v28;
  PGSingleAssetSuggestion *v29;
  void *v30;
  double v31;
  char v32;
  PGRecentFavoriteSuggester *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  double *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  uint8_t v58[128];
  uint8_t buf[4];
  int v60;
  __int16 v61;
  const char *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v37 = a4;
  v7 = _Block_copy(v37);
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  v50 = 0;
  v51 = (double *)&v50;
  v52 = 0x2020000000;
  v53 = 0;
  v39 = v6;
  if (!v7
    || (v8 = CFAbsoluteTimeGetCurrent(), v8 - v51[3] < 0.01)
    || (v51[3] = v8,
        v49 = 0,
        (*((void (**)(void *, char *, double))v7 + 2))(v7, &v49, 0.0),
        v9 = *((_BYTE *)v55 + 24) | v49,
        (*((_BYTE *)v55 + 24) = v9) == 0))
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v6, "universalStartDate");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "universalEndDate");
    v13 = objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __61__PGRecentFavoriteSuggester_suggestionsWithOptions_progress___block_invoke;
    v44[3] = &unk_1E8434F30;
    v14 = v7;
    v45 = v14;
    v46 = &v50;
    v47 = &v54;
    v48 = 0x3F847AE147AE147BLL;
    -[PGRecentFavoriteSuggester favoritedAssetsBetweenStartDate:andEndDate:matchingAssetUUID:progress:](self, "favoritedAssetsBetweenStartDate:andEndDate:matchingAssetUUID:progress:", v12, v13, 0, v44);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)v12;
    v36 = (void *)v13;
    if (*((_BYTE *)v55 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v60 = 59;
        v61 = 2080;
        v62 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentFavoriteSuggester.m";
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
        if (Current - v51[3] >= 0.01)
        {
          v51[3] = Current;
          v49 = 0;
          (*((void (**)(id, char *, double))v14 + 2))(v14, &v49, 0.5);
          v17 = *((_BYTE *)v55 + 24) | v49;
          *((_BYTE *)v55 + 24) = v17;
          if (v17)
          {
            if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              goto LABEL_11;
            *(_DWORD *)buf = 67109378;
            v60 = 61;
            v61 = 2080;
            v62 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Single Asset Suggester/PGRecentFavoriteSuggester.m";
            v15 = MEMORY[0x1E0C81028];
            goto LABEL_10;
          }
        }
      }
      if (objc_msgSend(v38, "count"))
      {
        -[PGRecentFavoriteSuggester suggestedAssetsInAssets:options:](self, "suggestedAssetsInAssets:options:", v38, v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v6, "maximumNumberOfSuggestions");
        v34 = self;
        if (v19)
          v20 = v19;
        else
          v20 = -1;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v21 = v18;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v58, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v41;
          v24 = 0.0;
          while (2)
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v41 != v23)
                objc_enumerationMutation(v21);
              v26 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
              if (v7)
              {
                v27 = CFAbsoluteTimeGetCurrent();
                if (v27 - v51[3] >= 0.01)
                {
                  v51[3] = v27;
                  v49 = 0;
                  (*((void (**)(id, char *, double))v14 + 2))(v14, &v49, v24 * 0.5 + 0.5);
                  v28 = *((_BYTE *)v55 + 24) | v49;
                  *((_BYTE *)v55 + 24) = v28;
                  if (v28)
                  {
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 67109378;
                      v60 = 72;
                      v61 = 2080;
                      v62 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Single Asset Suggester/PGRecentFavoriteSuggester.m";
                      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                    }

                    goto LABEL_11;
                  }
                }
              }
              v29 = -[PGSingleAssetSuggestion initWithType:subtype:asset:]([PGSingleAssetSuggestion alloc], "initWithType:subtype:asset:", 3, 301, v26);
              if (v29)
              {
                if (objc_msgSend(v39, "computeReasons"))
                {
                  -[PGRecentFavoriteSuggester reasonsForSuggestion:](v34, "reasonsForSuggestion:", v29);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PGSingleAssetSuggestion setReasons:](v29, "setReasons:", v30);

                }
                objc_msgSend(v11, "addObject:", v29, v34, v35, v36, v37);
                if (objc_msgSend(v11, "count") >= v20)
                {

                  goto LABEL_38;
                }
                v24 = 1.0 / (double)v20 + v24;
              }

            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v58, 16);
            if (v22)
              continue;
            break;
          }
        }
LABEL_38:

      }
      if (!v7
        || (v31 = CFAbsoluteTimeGetCurrent(), v31 - v51[3] < 0.01)
        || (v51[3] = v31,
            v49 = 0,
            (*((void (**)(id, char *, double))v14 + 2))(v14, &v49, 1.0),
            v32 = *((_BYTE *)v55 + 24) | v49,
            (*((_BYTE *)v55 + 24) = v32) == 0))
      {
        v10 = v11;
        goto LABEL_45;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v60 = 92;
        v61 = 2080;
        v62 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentFavoriteSuggester.m";
        v15 = MEMORY[0x1E0C81028];
        goto LABEL_10;
      }
    }
LABEL_11:
    v10 = (id)MEMORY[0x1E0C9AA60];
LABEL_45:

    goto LABEL_46;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v60 = 50;
    v61 = 2080;
    v62 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestions/"
          "Suggesters/Single Asset Suggester/PGRecentFavoriteSuggester.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v10 = (id)MEMORY[0x1E0C9AA60];
LABEL_46:
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);

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
  -[PGRecentFavoriteSuggester favoritedAssetsBetweenStartDate:andEndDate:matchingAssetUUID:progress:](self, "favoritedAssetsBetweenStartDate:andEndDate:matchingAssetUUID:progress:", 0, 0, v6, &__block_literal_global_25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGRecentFavoriteSuggester suggestedAssetsInAssets:](self, "suggestedAssetsInAssets:", v7);
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
    _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_DEFAULT, "Recent Favorite: Starting suggesting", v10, 2u);
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
    _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_DEFAULT, "Recent Favorite: nextSuggestion", (uint8_t *)&v21, 2u);
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
      -[PGRecentFavoriteSuggester favoritedAssetsBetweenStartDate:andEndDate:matchingAssetUUID:progress:](self, "favoritedAssetsBetweenStartDate:andEndDate:matchingAssetUUID:progress:", v9, v10, 0, v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGRecentFavoriteSuggester suggestedAssetsInAssets:](self, "suggestedAssetsInAssets:", v11);
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
    && (v17 = -[PGSingleAssetSuggestion initWithType:subtype:asset:]([PGSingleAssetSuggestion alloc], "initWithType:subtype:asset:", 3, 301, v16)) != 0)
  {
    v18 = v17;
    if (-[PGSuggestionOptions computeReasons](self->_options, "computeReasons"))
    {
      -[PGRecentFavoriteSuggester reasonsForSuggestion:](self, "reasonsForSuggestion:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGSingleAssetSuggestion setReasons:](v18, "setReasons:", v19);

    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138477827;
      v22 = v18;
      _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_DEFAULT, "Recent Favorite: Suggesting %{private}@", (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_DEFAULT, "Recent Favorite: Nothing to suggest", (uint8_t *)&v21, 2u);
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
    _os_log_impl(&dword_1CA237000, v4, OS_LOG_TYPE_DEFAULT, "Recent Favorite: Resetting", v6, 2u);
  }

  suggestedAssetEnumerator = self->_suggestedAssetEnumerator;
  self->_suggestedAssetEnumerator = 0;

}

- (id)favoritedAssetsBetweenStartDate:(id)a3 andEndDate:(id)a4 matchingAssetUUID:(id)a5 progress:(id)a6
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double Current;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  id v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[5];
  char v49;
  uint8_t buf[4];
  _BYTE v51[18];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
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
    v43 = v17;
    objc_msgSend(v17, "loggingConnection");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v51 = v10;
      *(_WORD *)&v51[8] = 2112;
      *(_QWORD *)&v51[10] = v11;
      _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_DEFAULT, "Recent Favorite: Computing eligible favorited assets between %@ and %@", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("favorite == YES"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "noVideoPredicate");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "internalPredicateForProcessedAssetsWithMinimumSceneAnalysisVersion:", 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)v21;
    v41 = (void *)v20;
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v20, v21, v45, 0);
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dateCreated >= %@"), v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v23);

    }
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dateCreated <= %@"), v11);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v24);

    }
    v42 = v19;
    v18 = v43;
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid == %@"), v12);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v25);

    }
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v22);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGAbstractSuggester defaultAssetFetchOptionsWithInternalPredicate:](self, "defaultAssetFetchOptionsWithInternalPredicate:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFetchPropertySets:", v27);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v26);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v14 >= 0.01)
      {
        v49 = 0;
        v13[2](v13, &v49, 0.4);
        if (v49)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v51 = 212;
            *(_WORD *)&v51[4] = 2080;
            *(_QWORD *)&v51[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentFavoriteSuggester.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v16 = (id)MEMORY[0x1E0C9AA60];
          v29 = v41;
          goto LABEL_43;
        }
        v14 = Current;
      }
    }
    v40 = v12;
    v30 = objc_msgSend(MEMORY[0x1E0CD1390], "clsPrefetchOptionsForKeyAsset");
    v31 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(v43, "curationContext");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "clsAllAssetsFromFetchResult:prefetchOptions:curationContext:", v47, v30, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v34 = CFAbsoluteTimeGetCurrent();
      if (v34 - v14 >= 0.01)
      {
        v49 = 0;
        v13[2](v13, &v49, 0.8);
        if (v49)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v51 = 217;
            *(_WORD *)&v51[4] = 2080;
            *(_QWORD *)&v51[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentFavoriteSuggester.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v16 = (id)MEMORY[0x1E0C9AA60];
          v19 = v42;
LABEL_42:
          v29 = v41;

          v12 = v40;
LABEL_43:

          goto LABEL_44;
        }
        v14 = v34;
      }
    }
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __99__PGRecentFavoriteSuggester_favoritedAssetsBetweenStartDate_andEndDate_matchingAssetUUID_progress___block_invoke;
    v48[3] = &unk_1E8430EB8;
    v48[4] = self;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v48);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "filteredArrayUsingPredicate:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v42;
    v37 = v42;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = objc_msgSend(v36, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v51 = v38;
      _os_log_impl(&dword_1CA237000, v37, OS_LOG_TYPE_DEFAULT, "Recent Favorite: found %lu eligible assets", buf, 0xCu);
    }

    if (v13 && CFAbsoluteTimeGetCurrent() - v14 >= 0.01 && (v49 = 0, v13[2](v13, &v49, 1.0), v49))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v51 = 224;
        *(_WORD *)&v51[4] = 2080;
        *(_QWORD *)&v51[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/Suggesters/Single Asset Suggester/PGRecentFavoriteSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v16 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v16 = v36;
    }

    goto LABEL_42;
  }
  v49 = 0;
  v13[2](v13, &v49, 0.0);
  if (!v49)
  {
    v14 = v15;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v51 = 170;
    *(_WORD *)&v51[4] = 2080;
    *(_QWORD *)&v51[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Suggestions/Suggesters/Single Asset Suggester/PGRecentFavoriteSuggester.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v16 = (id)MEMORY[0x1E0C9AA60];
LABEL_45:

  return v16;
}

- (id)suggestedAssetsInAssets:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3928];
  v4 = a3;
  objc_msgSend(v3, "sortDescriptorWithKey:ascending:", CFSTR("curationScore"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("overallAestheticScore"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)suggestedAssetsInAssets:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;

  v6 = a4;
  -[PGRecentFavoriteSuggester suggestedAssetsInAssets:](self, "suggestedAssetsInAssets:", a3);
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
  uint64_t v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "keyAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "curationScore");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("curation = %.3f"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "overallAestheticScore");
  objc_msgSend(v8, "stringWithFormat:", CFSTR("aesthetics = %.3f"), v9);
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

uint64_t __99__PGRecentFavoriteSuggester_favoritedAssetsBetweenStartDate_andEndDate_matchingAssetUUID_progress___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processedAssetIsValidForSuggesting:allowGuestAsset:", a2, 0);
}

void __61__PGRecentFavoriteSuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
