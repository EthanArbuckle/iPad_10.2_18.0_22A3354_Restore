@implementation PGRecentSyndicatedAssetSuggester

+ (NSIndexSet)suggestionTypes
{
  return (NSIndexSet *)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 3);
}

+ (NSIndexSet)suggestionSubtypes
{
  return (NSIndexSet *)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 306);
}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  void *v7;
  double v8;
  char v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  double Current;
  char v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  double v30;
  char v31;
  int v32;
  void *v33;
  _BOOL4 v34;
  double v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  id obj;
  id v41;
  id v42;
  id aBlock;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  double *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  uint8_t v62[128];
  uint8_t buf[4];
  int v64;
  __int16 v65;
  const char *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  aBlock = a4;
  objc_storeStrong((id *)&self->_options, a3);
  v7 = _Block_copy(aBlock);
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 0;
  v54 = 0;
  v55 = (double *)&v54;
  v56 = 0x2020000000;
  v57 = 0;
  if (!v7
    || (v8 = CFAbsoluteTimeGetCurrent(), v8 - v55[3] < 0.01)
    || (v55[3] = v8,
        v53 = 0,
        (*((void (**)(void *, char *, double))v7 + 2))(v7, &v53, 0.0),
        v9 = *((_BYTE *)v59 + 24) | v53,
        (*((_BYTE *)v59 + 24) = v9) == 0))
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v42, "universalStartDate");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "universalEndDate");
    v13 = objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __68__PGRecentSyndicatedAssetSuggester_suggestionsWithOptions_progress___block_invoke;
    v48[3] = &unk_1E8434F30;
    v41 = v7;
    v49 = v41;
    v50 = &v54;
    v51 = &v58;
    v52 = 0x3F847AE147AE147BLL;
    -[PGRecentSyndicatedAssetSuggester eligibleAssetsBetweenStartDate:andEndDate:matchingAssetUUID:progress:](self, "eligibleAssetsBetweenStartDate:andEndDate:matchingAssetUUID:progress:", v12, v13, 0, v48);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)v12;
    v39 = (void *)v13;
    if (*((_BYTE *)v59 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v64 = 64;
        v65 = 2080;
        v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentSyndicatedAssetSuggester.m";
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
        if (Current - v55[3] >= 0.01)
        {
          v55[3] = Current;
          v53 = 0;
          (*((void (**)(id, char *, double))v41 + 2))(v41, &v53, 0.5);
          v18 = *((_BYTE *)v59 + 24) | v53;
          *((_BYTE *)v59 + 24) = v18;
          if (v18)
          {
            if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              goto LABEL_11;
            *(_DWORD *)buf = 67109378;
            v64 = 66;
            v65 = 2080;
            v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Single Asset Suggester/PGRecentSyndicatedAssetSuggester.m";
            v15 = MEMORY[0x1E0C81028];
            goto LABEL_10;
          }
        }
      }
      if (objc_msgSend(v14, "count"))
      {
        v19 = objc_msgSend(v42, "maximumNumberOfSuggestions");
        if (v19)
          v20 = v19;
        else
          v20 = -1;
        v21 = objc_msgSend(v14, "count");
        if (v21 >= v20)
          v22 = v20;
        else
          v22 = v21;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v37 = v14;
        obj = v14;
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v62, 16);
        if (v23)
        {
          v24 = 1.0 / (double)v22;
          v25 = *(_QWORD *)v45;
          v26 = 0.0;
LABEL_28:
          v27 = 0;
          while (1)
          {
            if (*(_QWORD *)v45 != v25)
              objc_enumerationMutation(obj);
            v28 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v27);
            v29 = (void *)MEMORY[0x1CAA4EB2C]();
            if (!v7)
              goto LABEL_37;
            v30 = CFAbsoluteTimeGetCurrent();
            if (v30 - v55[3] >= 0.01
              && (v55[3] = v30,
                  v53 = 0,
                  (*((void (**)(id, char *, double))v41 + 2))(v41, &v53, v26 * 0.5 + 0.5),
                  v31 = *((_BYTE *)v59 + 24) | v53,
                  (*((_BYTE *)v59 + 24) = v31) != 0))
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                v64 = 74;
                v65 = 2080;
                v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Suggestions/Suggesters/Single Asset Suggester/PGRecentSyndicatedAssetSuggester.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
              v32 = 1;
            }
            else
            {
LABEL_37:
              -[PGRecentSyndicatedAssetSuggester createSuggestionWithAsset:](self, "createSuggestionWithAsset:", v28);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "addObject:", v33);
              v34 = objc_msgSend(v11, "count") >= v20;

              v26 = v24 + v26;
              v32 = 2 * v34;
            }
            objc_autoreleasePoolPop(v29);
            if (v32)
              break;
            if (v23 == ++v27)
            {
              v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v62, 16);
              if (v23)
                goto LABEL_28;
              goto LABEL_41;
            }
          }

          v14 = v37;
          if (v32 != 2)
            goto LABEL_11;
        }
        else
        {
LABEL_41:

          v14 = v37;
        }
      }
      if (!v7
        || (v35 = CFAbsoluteTimeGetCurrent(), v35 - v55[3] < 0.01)
        || (v55[3] = v35,
            v53 = 0,
            (*((void (**)(id, char *, double))v41 + 2))(v41, &v53, 1.0),
            v36 = *((_BYTE *)v59 + 24) | v53,
            (*((_BYTE *)v59 + 24) = v36) == 0))
      {
        v10 = v11;
        goto LABEL_12;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v64 = 85;
        v65 = 2080;
        v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentSyndicatedAssetSuggester.m";
        v15 = MEMORY[0x1E0C81028];
        goto LABEL_10;
      }
    }
LABEL_11:
    v10 = (id)MEMORY[0x1E0C9AA60];
LABEL_12:

    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v64 = 55;
    v65 = 2080;
    v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestions/"
          "Suggesters/Single Asset Suggester/PGRecentSyndicatedAssetSuggester.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v10 = (id)MEMORY[0x1E0C9AA60];
LABEL_13:
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);

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
  char v11;

  v5 = a3;
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGRecentSyndicatedAssetSuggester eligibleAssetsBetweenStartDate:andEndDate:matchingAssetUUID:progress:](self, "eligibleAssetsBetweenStartDate:andEndDate:matchingAssetUUID:progress:", 0, 0, v6, &__block_literal_global_51064);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
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
    _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_DEFAULT, "Recent Syndicated Asset: Starting suggesting", v10, 2u);
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
  NSArray *v11;
  NSArray *v12;
  NSEnumerator *v13;
  NSEnumerator *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGAbstractSuggester session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loggingConnection");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_DEFAULT, "Recent Syndicated Asset: nextSuggestion", (uint8_t *)&v18, 2u);
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
      -[PGRecentSyndicatedAssetSuggester eligibleAssetsBetweenStartDate:andEndDate:matchingAssetUUID:progress:](self, "eligibleAssetsBetweenStartDate:andEndDate:matchingAssetUUID:progress:", v9, v10, 0, v4);
      v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v12 = self->_suggestedAssets;
      self->_suggestedAssets = v11;

      suggestedAssets = self->_suggestedAssets;
    }
    -[NSArray objectEnumerator](suggestedAssets, "objectEnumerator");
    v13 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
    v14 = self->_suggestedAssetEnumerator;
    self->_suggestedAssetEnumerator = v13;

    suggestedAssetEnumerator = self->_suggestedAssetEnumerator;
  }
  -[NSEnumerator nextObject](suggestedAssetEnumerator, "nextObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[PGRecentSyndicatedAssetSuggester createSuggestionWithAsset:](self, "createSuggestionWithAsset:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138477827;
      v19 = v16;
      _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_DEFAULT, "Recent Syndicated Asset: Suggesting %{private}@", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_DEFAULT, "Recent Syndicated Asset: Nothing to suggest", (uint8_t *)&v18, 2u);
    }
    v16 = 0;
  }

  return v16;
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
    _os_log_impl(&dword_1CA237000, v4, OS_LOG_TYPE_DEFAULT, "Recent Syndicated Asset: Resetting", v6, 2u);
  }

  suggestedAssetEnumerator = self->_suggestedAssetEnumerator;
  self->_suggestedAssetEnumerator = 0;

}

- (id)createSuggestionWithAsset:(id)a3
{
  id v4;
  PGSingleAssetSuggestion *v5;
  void *v6;

  v4 = a3;
  v5 = -[PGSingleAssetSuggestion initWithType:subtype:asset:]([PGSingleAssetSuggestion alloc], "initWithType:subtype:asset:", 3, 306, v4);

  if (-[PGSuggestionOptions computeReasons](self->_options, "computeReasons"))
  {
    -[PGRecentSyndicatedAssetSuggester reasonsForSuggestion:](self, "reasonsForSuggestion:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGSingleAssetSuggestion setReasons:](v5, "setReasons:", v6);

  }
  return v5;
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

- (id)eligibleAssetsBetweenStartDate:(id)a3 andEndDate:(id)a4 matchingAssetUUID:(id)a5 progress:(id)a6
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
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  double Current;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void (**v37)(void *, _BYTE *, double);
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  unint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  NSObject *v66;
  void *v67;
  void *v68;
  _QWORD v69[5];
  char v70;
  _QWORD v71[4];
  uint8_t buf[4];
  _BYTE v73[18];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
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
LABEL_53:

      goto LABEL_54;
    }
    v67 = v17;
    objc_msgSend(v17, "loggingConnection");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v73 = v10;
      *(_WORD *)&v73[8] = 2112;
      *(_QWORD *)&v73[10] = v11;
      _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_DEFAULT, "Recent Syndicated Asset: Computing eligible assets between %@ and %@", buf, 0x16u);
    }
    v66 = v19;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("overallAestheticScore >= %f"), 0x3FE0000000000000);
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("curationScore >= %f"), *MEMORY[0x1E0D77DE0]);
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "noVideoPredicate");
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset"), 0);
    v58 = objc_claimAutoreleasedReturnValue();
    v59 = (void *)v22;
    v60 = (void *)v21;
    v61 = (void *)v20;
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v20, v21, v22, v58, 0);
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
    v64 = v11;
    v65 = v10;
    v18 = v67;
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid == %@"), v12);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v26);

    }
    v63 = v12;
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v23);
    v27 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "photoLibrary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "librarySpecificFetchOptions");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "setInternalPredicate:", v27);
    +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFetchPropertySets:", v30);

    objc_msgSend(v29, "setIncludeGuestAssets:", 1);
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v29);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)v27;
    if (v13)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v14 >= 0.01)
      {
        v70 = 0;
        v13[2](v13, &v70, 0.4);
        if (v70)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v73 = 205;
            *(_WORD *)&v73[4] = 2080;
            *(_QWORD *)&v73[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentSyndicatedAssetSuggester.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v16 = (id)MEMORY[0x1E0C9AA60];
          v32 = v66;
          v34 = v60;
          v33 = v61;
          v36 = (void *)v58;
          v35 = v59;
          goto LABEL_52;
        }
        v14 = Current;
      }
    }
    v37 = v13;
    v38 = objc_msgSend(MEMORY[0x1E0CD1390], "clsPrefetchOptionsForKeyAsset");
    v39 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(v67, "curationContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "clsAllAssetsFromFetchResult:prefetchOptions:curationContext:", v68, v38, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v37;
    v57 = v41;
    if (v37)
    {
      v42 = CFAbsoluteTimeGetCurrent();
      v43 = 0x1E0CB3000uLL;
      if (v42 - v14 >= 0.01)
      {
        v70 = 0;
        v37[2](v37, &v70, 0.8);
        if (v70)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v73 = 210;
            *(_WORD *)&v73[4] = 2080;
            *(_QWORD *)&v73[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentSyndicatedAssetSuggester.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v16 = (id)MEMORY[0x1E0C9AA60];
          v32 = v66;
          v18 = v67;
          goto LABEL_51;
        }
        v14 = v42;
      }
    }
    else
    {
      v43 = 0x1E0CB3000;
    }
    v44 = *(void **)(v43 + 2176);
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __105__PGRecentSyndicatedAssetSuggester_eligibleAssetsBetweenStartDate_andEndDate_matchingAssetUUID_progress___block_invoke;
    v69[3] = &unk_1E8430EB8;
    v69[4] = self;
    objc_msgSend(v44, "predicateWithBlock:", v69);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "filteredArrayUsingPredicate:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = v66;
    v47 = v66;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = objc_msgSend(v46, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v73 = v48;
      _os_log_impl(&dword_1CA237000, v47, OS_LOG_TYPE_DEFAULT, "Recent Syndicated Asset: found %lu eligible assets", buf, 0xCu);
    }

    v18 = v67;
    if (v13)
    {
      v49 = CFAbsoluteTimeGetCurrent();
      if (v49 - v14 >= 0.01)
      {
        v70 = 0;
        v13[2](v13, &v70, 0.9);
        if (v70)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v73 = 230;
            *(_WORD *)&v73[4] = 2080;
            *(_QWORD *)&v73[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentSyndicatedAssetSuggester.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v16 = (id)MEMORY[0x1E0C9AA60];
LABEL_50:

LABEL_51:
          v34 = v60;
          v33 = v61;
          v36 = (void *)v58;
          v35 = v59;

LABEL_52:
          v11 = v64;
          v10 = v65;
          v12 = v63;
          goto LABEL_53;
        }
        v14 = v49;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("overallAestheticScore"), 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v50;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("curationScore"), 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v71[1] = v51;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v71[2] = v52;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v71[3] = v53;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 4);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v46, "sortedArrayUsingDescriptors:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 && CFAbsoluteTimeGetCurrent() - v14 >= 0.01 && (v70 = 0, v13[2](v13, &v70, 1.0), v70))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v73 = 241;
        *(_WORD *)&v73[4] = 2080;
        *(_QWORD *)&v73[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/Suggesters/Single Asset Suggester/PGRecentSyndicatedAssetSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v16 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v16 = v55;
    }
    v32 = v66;

    v46 = v55;
    goto LABEL_50;
  }
  v70 = 0;
  v13[2](v13, &v70, 0.0);
  if (!v70)
  {
    v14 = v15;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v73 = 164;
    *(_WORD *)&v73[4] = 2080;
    *(_QWORD *)&v73[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Suggestions/Suggesters/Single Asset Suggester/PGRecentSyndicatedAssetSuggester.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v16 = (id)MEMORY[0x1E0C9AA60];
LABEL_54:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedAssetEnumerator, 0);
  objc_storeStrong((id *)&self->_suggestedAssets, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

uint64_t __105__PGRecentSyndicatedAssetSuggester_eligibleAssetsBetweenStartDate_andEndDate_matchingAssetUUID_progress___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "processedAssetIsValidForSuggesting:allowGuestAsset:", v3, 1))
  {
    if (objc_msgSend(v3, "clsPeopleCount"))
      v4 = 1;
    else
      v4 = objc_msgSend(*(id *)(a1 + 32), "hasSuggestableScenesWithAsset:", v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __68__PGRecentSyndicatedAssetSuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
