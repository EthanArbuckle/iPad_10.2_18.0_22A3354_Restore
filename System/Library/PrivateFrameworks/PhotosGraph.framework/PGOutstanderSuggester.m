@implementation PGOutstanderSuggester

+ (NSIndexSet)suggestionTypes
{
  return (NSIndexSet *)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 5);
}

+ (NSIndexSet)suggestionSubtypes
{
  return (NSIndexSet *)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 501);
}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  void *v6;
  double v7;
  char v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  NSObject *v15;
  void *v16;
  double Current;
  char v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  char v24;
  id v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  double v34;
  double v35;
  char v36;
  uint64_t v37;
  double *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint8_t buf[4];
  int v46;
  __int16 v47;
  const char *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v26 = a4;
  v6 = _Block_copy(v26);
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v37 = 0;
  v38 = (double *)&v37;
  v39 = 0x2020000000;
  v40 = 0;
  if (v6
    && (v7 = CFAbsoluteTimeGetCurrent(), v7 - v38[3] >= 0.01)
    && (v38[3] = v7,
        v36 = 0,
        (*((void (**)(void *, char *, double))v6 + 2))(v6, &v36, 0.0),
        v8 = *((_BYTE *)v42 + 24) | v36,
        (*((_BYTE *)v42 + 24) = v8) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v46 = 61;
      v47 = 2080;
      v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestion"
            "s/Suggesters/Single Asset Suggester/PGOutstanderSuggester.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v9 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[PGOutstanderSuggester startSuggestingWithOptions:](self, "startSuggestingWithOptions:", v28);
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = objc_msgSend(v28, "maximumNumberOfSuggestions");
    v27 = v10;
    v12 = 0;
    if (v11)
      v13 = v11;
    else
      v13 = -1;
    v14 = 0.0;
    v15 = MEMORY[0x1E0C81028];
    while (v12 < v13)
    {
      v16 = (void *)MEMORY[0x1CAA4EB2C]();
      if (v6
        && (Current = CFAbsoluteTimeGetCurrent(), Current - v38[3] >= 0.01)
        && (v38[3] = Current,
            v36 = 0,
            (*((void (**)(void *, char *, double))v6 + 2))(v6, &v36, v14),
            v18 = *((_BYTE *)v42 + 24) | v36,
            (*((_BYTE *)v42 + 24) = v18) != 0))
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v46 = 72;
          v47 = 2080;
          v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Single Asset Suggester/PGOutstanderSuggester.m";
          _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v19 = 1;
      }
      else
      {
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __57__PGOutstanderSuggester_suggestionsWithOptions_progress___block_invoke;
        v29[3] = &unk_1E84311C8;
        v30 = v6;
        v31 = &v37;
        v34 = v14;
        v35 = 1.0 / (double)v13;
        v32 = &v41;
        v33 = 0x3F847AE147AE147BLL;
        -[PGOutstanderSuggester nextSuggestionWithProgress:](self, "nextSuggestionWithProgress:", v29);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        if (*((_BYTE *)v42 + 24))
        {
          v19 = 1;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v46 = 77;
            v47 = 2080;
            v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Single Asset Suggester/PGOutstanderSuggester.m";
            _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
        else if (v20)
        {
          objc_msgSend(v27, "addObject:", v20);
          v19 = 0;
          ++v12;
          v14 = 1.0 / (double)v13 + v14;
        }
        else
        {
          v19 = 3;
        }

      }
      objc_autoreleasePoolPop(v16);
      if (v19)
      {
        if (v19 != 3)
        {
          v9 = (id)MEMORY[0x1E0C9AA60];
          v22 = v27;
          goto LABEL_35;
        }
        break;
      }
    }
    v22 = v27;
    if (v6
      && (v23 = CFAbsoluteTimeGetCurrent(), v23 - v38[3] >= 0.01)
      && (v38[3] = v23,
          v36 = 0,
          (*((void (**)(void *, char *, double))v6 + 2))(v6, &v36, 1.0),
          v24 = *((_BYTE *)v42 + 24) | v36,
          (*((_BYTE *)v42 + 24) = v24) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v46 = 86;
        v47 = 2080;
        v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGOutstanderSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v9 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v9 = v27;
    }
LABEL_35:

  }
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  return v9;
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
  void *v12;
  void *v13;
  char v14;

  v5 = a3;
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGOutstanderSuggester assetInternalPredicate:andEndDate:matchingAssetUUID:](self, "assetInternalPredicate:andEndDate:matchingAssetUUID:", 0, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGAbstractSuggester defaultAssetFetchOptionsWithInternalPredicate:](self, "defaultAssetFetchOptionsWithInternalPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFetchPropertySets:", v9);

  objc_msgSend(v8, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)startSuggestingWithOptions:(id)a3
{
  PGSuggestionOptions *v4;
  void *v5;
  NSObject *v6;
  PGSuggestionOptions *options;
  PGSuggestionOptions *v8;
  NSDictionary *assetUUIDsByScore;
  NSArray *sortedScores;
  NSEnumerator *currentSuggestedAssetEnumerator;
  uint8_t v12[16];

  v4 = (PGSuggestionOptions *)a3;
  -[PGAbstractSuggester session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loggingConnection");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_DEFAULT, "Outstander: Starting suggesting", v12, 2u);
  }

  options = self->_options;
  self->_options = v4;
  v8 = v4;

  assetUUIDsByScore = self->_assetUUIDsByScore;
  self->_assetUUIDsByScore = 0;

  sortedScores = self->_sortedScores;
  self->_sortedScores = 0;

  self->_currentScoreIndex = -1;
  currentSuggestedAssetEnumerator = self->_currentSuggestedAssetEnumerator;
  self->_currentSuggestedAssetEnumerator = 0;

}

- (id)nextSuggestionWithProgress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  PGSingleAssetSuggestion *v9;
  PGSingleAssetSuggestion *v10;
  void *v11;
  int v13;
  PGSingleAssetSuggestion *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGAbstractSuggester session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "loggingConnection");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_DEFAULT, "Outstander: nextSuggestion", (uint8_t *)&v13, 2u);
    }
    -[PGOutstanderSuggester nextSuggestedAssetWithProgress:](self, "nextSuggestedAssetWithProgress:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      && (v9 = -[PGSingleAssetSuggestion initWithType:subtype:asset:]([PGSingleAssetSuggestion alloc], "initWithType:subtype:asset:", 5, 501, v8)) != 0)
    {
      v10 = v9;
      if (-[PGSuggestionOptions computeReasons](self->_options, "computeReasons"))
      {
        -[PGOutstanderSuggester reasonsForSuggestion:](self, "reasonsForSuggestion:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGSingleAssetSuggestion setReasons:](v10, "setReasons:", v11);

      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138477827;
        v14 = v10;
        _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_DEFAULT, "Outstander: Suggesting %{private}@", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_DEFAULT, "Outstander: Nothing to suggest", (uint8_t *)&v13, 2u);
      }
      v10 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      LOWORD(v13) = 0;
      _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Outstander: Needs a session!", (uint8_t *)&v13, 2u);
    }
    v10 = 0;
  }

  return v10;
}

- (void)reset
{
  void *v3;
  NSObject *v4;
  NSEnumerator *currentSuggestedAssetEnumerator;
  uint8_t v6[16];

  -[PGAbstractSuggester session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loggingConnection");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CA237000, v4, OS_LOG_TYPE_DEFAULT, "Outstander: Resetting", v6, 2u);
  }

  self->_currentScoreIndex = -1;
  currentSuggestedAssetEnumerator = self->_currentSuggestedAssetEnumerator;
  self->_currentSuggestedAssetEnumerator = 0;

}

- (id)assetInternalPredicate:(id)a3 andEndDate:(id)a4 matchingAssetUUID:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("curationScore >= %f"), *MEMORY[0x1E0D77DD8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "noVideoPredicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "internalPredicateForProcessedAssetsWithMinimumSceneAnalysisVersion:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v10, v11, v12, 0);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dateCreated >= %@"), v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

  }
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dateCreated <= %@"), v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v15);

  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid == %@"), v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v16);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)computeNiceAssetsBetweenStartDate:(id)a3 andEndDate:(id)a4 withProgress:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double Current;
  NSObject *v19;
  id v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  double v25;
  void *v26;
  double v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  NSArray *v51;
  NSArray *sortedScores;
  NSObject *v53;
  const char *v54;
  os_log_type_t v55;
  uint32_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *log;
  unint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void (**v67)(void *, _BYTE *, double);
  void *v68;
  void *context;
  unint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  char v75;
  void *v76;
  uint8_t v77[128];
  uint8_t buf[4];
  _BYTE v79[14];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = 0.0;
  v67 = (void (**)(void *, _BYTE *, double))_Block_copy(v10);
  if (!v67 || (v12 = CFAbsoluteTimeGetCurrent(), v12 < 0.01))
  {
LABEL_7:
    -[PGAbstractSuggester session](self, "session");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v13)
    {
LABEL_53:

      goto LABEL_54;
    }
    objc_msgSend(v13, "loggingConnection");
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v79 = v9;
      _os_log_impl(&dword_1CA237000, log, OS_LOG_TYPE_DEFAULT, "Outstander: Computing eligible nice assets up to %@", buf, 0xCu);
    }
    -[PGOutstanderSuggester assetInternalPredicate:andEndDate:matchingAssetUUID:](self, "assetInternalPredicate:andEndDate:matchingAssetUUID:", v8, v9, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGAbstractSuggester defaultAssetFetchOptionsWithInternalPredicate:](self, "defaultAssetFetchOptionsWithInternalPredicate:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFetchPropertySets:", v17);

    objc_msgSend(v16, "setChunkSizeForFetch:", 200);
    objc_msgSend(v16, "setCacheSizeForFetch:", 400);
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v16);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (v67)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v11 >= 0.01)
      {
        v75 = 0;
        v67[2](v67, &v75, 0.2);
        if (v75)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v79 = 217;
            *(_WORD *)&v79[4] = 2080;
            *(_QWORD *)&v79[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Single Asset Suggester/PGOutstanderSuggester.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v19 = log;
LABEL_52:

          goto LABEL_53;
        }
        v11 = Current;
      }
    }
    v65 = objc_msgSend(MEMORY[0x1E0CD1390], "clsPrefetchOptionsForKeyAsset", v16, v15, v10, v9, v8);
    v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v21 = objc_msgSend(v66, "count");
    if (v21)
    {
      v22 = v21;
      v23 = 0;
      v24 = 0;
      v25 = (double)v21;
      v63 = v21;
      v64 = v14;
      while (1)
      {
        v26 = (void *)MEMORY[0x1CAA4EB2C]();
        if (v67)
        {
          v27 = CFAbsoluteTimeGetCurrent();
          if (v27 - v11 >= 0.01)
          {
            v75 = 0;
            v67[2](v67, &v75, (double)v24 * 0.8 / v25 + 0.2);
            if (v75)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v79 = 225;
                *(_WORD *)&v79[4] = 2080;
                *(_QWORD *)&v79[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Suggestions/Suggesters/Single Asset Suggester/PGOutstanderSuggester.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
              objc_autoreleasePoolPop(v26);
              v19 = log;
              goto LABEL_51;
            }
            v11 = v27;
          }
        }
        context = v26;
        v70 = v24;
        if (v22 - v24 >= 0xC8)
          v28 = 200;
        else
          v28 = v22 - v24;
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v24, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "objectsAtIndexes:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = objc_alloc(MEMORY[0x1E0CD1620]);
        objc_msgSend(v66, "photoLibrary");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "fetchPropertySets");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v31, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v30, v32, 0, v33, 0, 0);

        v35 = (void *)MEMORY[0x1E0CD1390];
        objc_msgSend(v14, "curationContext");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = (void *)v34;
        objc_msgSend(v35, "clsAllAssetsFromFetchResult:prefetchOptions:curationContext:", v34, v65, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        v38 = v37;
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
        if (v39)
        {
          v40 = v39;
          v41 = *(_QWORD *)v72;
          do
          {
            for (i = 0; i != v40; ++i)
            {
              if (*(_QWORD *)v72 != v41)
                objc_enumerationMutation(v38);
              v43 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
              if (-[PGAbstractSuggester processedAssetIsValidForSuggesting:allowGuestAsset:](self, "processedAssetIsValidForSuggesting:allowGuestAsset:", v43, 0))
              {
                objc_msgSend(v43, "uuid");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = -[PGOutstanderSuggester scoreWithAsset:](self, "scoreWithAsset:", v43);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v45);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "objectForKeyedSubscript:", v46);
                v47 = (id)objc_claimAutoreleasedReturnValue();
                if (!v47)
                {
                  v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  objc_msgSend(v20, "setObject:forKeyedSubscript:", v47, v46);
                }
                objc_msgSend(v47, "addObject:", v44);
                ++v23;

              }
            }
            v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
          }
          while (v40);
        }

        objc_autoreleasePoolPop(context);
        v24 = v70 + 200;
        v22 = v63;
        v14 = v64;
        if (v70 + 200 >= v63)
          goto LABEL_40;
      }
    }
    v23 = 0;
LABEL_40:
    objc_storeStrong((id *)&self->_assetUUIDsByScore, v20);
    -[NSDictionary allKeys](self->_assetUUIDsByScore, "allKeys");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v49;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "sortedArrayUsingDescriptors:", v50);
    v51 = (NSArray *)objc_claimAutoreleasedReturnValue();
    sortedScores = self->_sortedScores;
    self->_sortedScores = v51;

    v19 = log;
    if (v67 && CFAbsoluteTimeGetCurrent() - v11 >= 0.01 && (v75 = 0, v67[2](v67, &v75, 1.0), v75))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_51;
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v79 = 252;
      *(_WORD *)&v79[4] = 2080;
      *(_QWORD *)&v79[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Suggestions/Suggesters/Single Asset Suggester/PGOutstanderSuggester.m";
      v53 = MEMORY[0x1E0C81028];
      v54 = "Cancelled at line %d in file %s";
      v55 = OS_LOG_TYPE_INFO;
      v56 = 18;
    }
    else
    {
      if (!os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        goto LABEL_51;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v79 = v23;
      v54 = "Outstander: found %lu eligible assets";
      v53 = log;
      v55 = OS_LOG_TYPE_DEFAULT;
      v56 = 12;
    }
    _os_log_impl(&dword_1CA237000, v53, v55, v54, buf, v56);
LABEL_51:

    v9 = v60;
    v8 = v61;
    v15 = v58;
    v10 = v59;
    v16 = v57;
    goto LABEL_52;
  }
  v75 = 0;
  v67[2](v67, &v75, 0.0);
  if (!v75)
  {
    v11 = v12;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v79 = 196;
    *(_WORD *)&v79[4] = 2080;
    *(_QWORD *)&v79[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Suggestions/Suggesters/Single Asset Suggester/PGOutstanderSuggester.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_54:

}

- (unint64_t)scoreWithAsset:(id)a3
{
  id v4;
  unsigned int v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "isFavorite");
  objc_msgSend(v4, "clsAestheticScore");
  v7 = v6;
  -[PGAbstractSuggester session](self, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topTierAestheticScore");
  v10 = v9;

  v11 = 1;
  if (v5)
    v11 = 2;
  if (v7 >= v10)
    v12 = v11;
  else
    v12 = v5;
  v13 = v12 + objc_msgSend(v4, "isIncludedInCloudFeeds");
  if (objc_msgSend(v4, "clsShareCount") && objc_msgSend(v4, "clsVideoFaceCount"))
    ++v13;
  if ((unint64_t)objc_msgSend(v4, "clsPeopleCount") > 3)
    ++v13;

  return v13;
}

- (id)nextSuggestedAssetWithProgress:(id)a3
{
  id v4;
  void *v5;
  NSEnumerator *v6;
  NSEnumerator *currentSuggestedAssetEnumerator;

  v4 = a3;
  -[NSEnumerator nextObject](self->_currentSuggestedAssetEnumerator, "nextObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[PGOutstanderSuggester nextSuggestedAssetEnumeratorWithProgress:](self, "nextSuggestedAssetEnumeratorWithProgress:", v4);
    v6 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
    currentSuggestedAssetEnumerator = self->_currentSuggestedAssetEnumerator;
    self->_currentSuggestedAssetEnumerator = v6;

    -[NSEnumerator nextObject](self->_currentSuggestedAssetEnumerator, "nextObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)nextSuggestedAssetEnumeratorWithProgress:(id)a3
{
  id v4;
  void (**v5)(void *, _BYTE *, double);
  double Current;
  char v7;
  NSObject *v8;
  double v9;
  char v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  double v25;
  char v26;
  id v27;
  void *v28;
  void *v30;
  _QWORD v31[4];
  void (**v32)(void *, _BYTE *, double);
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  double *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  _QWORD v45[3];
  uint8_t buf[4];
  int v47;
  __int16 v48;
  const char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void (**)(void *, _BYTE *, double))_Block_copy(v4);
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v37 = 0;
  v38 = (double *)&v37;
  v39 = 0x2020000000;
  v40 = 0;
  if (v5)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v38[3] >= 0.01)
    {
      v38[3] = Current;
      v36 = 0;
      v5[2](v5, &v36, 0.0);
      v7 = *((_BYTE *)v42 + 24) | v36;
      *((_BYTE *)v42 + 24) = v7;
      if (v7)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v47 = 297;
          v48 = 2080;
          v49 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Single Asset Suggester/PGOutstanderSuggester.m";
          v8 = MEMORY[0x1E0C81028];
LABEL_12:
          _os_log_impl(&dword_1CA237000, v8, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_35;
        }
        goto LABEL_35;
      }
    }
  }
  if (!self->_assetUUIDsByScore)
  {
    -[PGSuggestionOptions universalEndDateForWholeLibrarySuggestions](self->_options, "universalEndDateForWholeLibrarySuggestions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      v24 = v22;
    }
    else
    {
      -[PGSuggestionOptions universalStartDate](self->_options, "universalStartDate");
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    v28 = v24;

    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __66__PGOutstanderSuggester_nextSuggestedAssetEnumeratorWithProgress___block_invoke;
    v31[3] = &unk_1E8434F30;
    v32 = v5;
    v33 = &v37;
    v34 = &v41;
    v35 = 0x3F847AE147AE147BLL;
    -[PGOutstanderSuggester computeNiceAssetsBetweenStartDate:andEndDate:withProgress:](self, "computeNiceAssetsBetweenStartDate:andEndDate:withProgress:", 0, v28, v31);
    if (*((_BYTE *)v42 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v47 = 306;
        v48 = 2080;
        v49 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGOutstanderSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }

      goto LABEL_35;
    }

  }
  if (v5)
  {
    v9 = CFAbsoluteTimeGetCurrent();
    if (v9 - v38[3] >= 0.01)
    {
      v38[3] = v9;
      v36 = 0;
      v5[2](v5, &v36, 0.5);
      v10 = *((_BYTE *)v42 + 24) | v36;
      *((_BYTE *)v42 + 24) = v10;
      if (v10)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v47 = 309;
          v48 = 2080;
          v49 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Single Asset Suggester/PGOutstanderSuggester.m";
          v8 = MEMORY[0x1E0C81028];
          goto LABEL_12;
        }
LABEL_35:
        v27 = 0;
        goto LABEL_36;
      }
    }
  }
  v11 = self->_currentScoreIndex + 1;
  self->_currentScoreIndex = v11;
  if (v11 >= -[NSArray count](self->_sortedScores, "count"))
  {
    v12 = 0;
    goto LABEL_21;
  }
  -[NSArray objectAtIndexedSubscript:](self->_sortedScores, "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
LABEL_21:
    v13 = 0;
LABEL_22:
    v21 = 0;
    if (!v5)
      goto LABEL_28;
    goto LABEL_23;
  }
  -[NSDictionary objectForKeyedSubscript:](self->_assetUUIDsByScore, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_22;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v13);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGAbstractSuggester defaultAssetFetchOptionsWithInternalPredicate:](self, "defaultAssetFetchOptionsWithInternalPredicate:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setChunkSizeForFetch:", 200);
  objc_msgSend(v14, "setCacheSizeForFetch:", 400);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("overallAestheticScore"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v15;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v16;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSortDescriptors:", v18);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "fetchedObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectEnumerator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_28;
LABEL_23:
  v25 = CFAbsoluteTimeGetCurrent();
  if (v25 - v38[3] >= 0.01)
  {
    v38[3] = v25;
    v36 = 0;
    v5[2](v5, &v36, 1.0);
    v26 = *((_BYTE *)v42 + 24) | v36;
    *((_BYTE *)v42 + 24) = v26;
    if (v26)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v47 = 332;
        v48 = 2080;
        v49 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGOutstanderSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v27 = 0;
      goto LABEL_29;
    }
  }
LABEL_28:
  v27 = v21;
LABEL_29:

LABEL_36:
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  return v27;
}

- (id)reasonsForSuggestion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "keyAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("score = %lu"), -[PGOutstanderSuggester scoreWithAsset:](self, "scoreWithAsset:", v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "overallAestheticScore");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("aesthetics = %.3f"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSuggestedAssetEnumerator, 0);
  objc_storeStrong((id *)&self->_sortedScores, 0);
  objc_storeStrong((id *)&self->_assetUUIDsByScore, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

void __66__PGOutstanderSuggester_nextSuggestedAssetEnumeratorWithProgress___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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

void __57__PGOutstanderSuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 64) + *(double *)(a1 + 72) * a3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

@end
