@implementation PGLongTailSuggester

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  void *v6;
  double v7;
  char v8;
  id v9;
  unint64_t v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  double Current;
  char v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  char v22;
  id v24;
  id v25;
  id aBlock;
  void *v27;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  double v33;
  double v34;
  char v35;
  uint64_t v36;
  double *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint8_t buf[4];
  int v45;
  __int16 v46;
  const char *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  aBlock = a4;
  -[PGAbstractSuggester session](self, "session");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v6 = _Block_copy(aBlock);
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v43 = 0;
    v36 = 0;
    v37 = (double *)&v36;
    v38 = 0x2020000000;
    v39 = 0;
    if (v6
      && (v7 = CFAbsoluteTimeGetCurrent(), v7 - v37[3] >= 0.01)
      && (v37[3] = v7,
          v35 = 0,
          (*((void (**)(void *, char *, double))v6 + 2))(v6, &v35, 0.0),
          v8 = *((_BYTE *)v41 + 24) | v35,
          (*((_BYTE *)v41 + 24) = v8) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v45 = 192;
        v46 = 2080;
        v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v9 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      -[PGLongTailSuggester startSuggestingWithOptions:](self, "startSuggestingWithOptions:", v25);
      v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v10 = 0;
      v11 = 1.0 / (double)self->_maximumNumberOfSuggestions;
      v12 = 0.0;
      v13 = MEMORY[0x1E0C81028];
      while (v10 < self->_maximumNumberOfSuggestions)
      {
        v14 = (void *)MEMORY[0x1CAA4EB2C]();
        if (v6
          && (Current = CFAbsoluteTimeGetCurrent(), Current - v37[3] >= 0.01)
          && (v37[3] = Current,
              v35 = 0,
              (*((void (**)(void *, char *, double))v6 + 2))(v6, &v35, v12),
              v16 = *((_BYTE *)v41 + 24) | v35,
              (*((_BYTE *)v41 + 24) = v16) != 0))
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v45 = 202;
            v46 = 2080;
            v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
            _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v17 = 1;
        }
        else
        {
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __55__PGLongTailSuggester_suggestionsWithOptions_progress___block_invoke;
          v28[3] = &unk_1E84311C8;
          v29 = v6;
          v30 = &v36;
          v33 = v12;
          v34 = v11;
          v31 = &v40;
          v32 = 0x3F847AE147AE147BLL;
          -[PGLongTailSuggester nextSuggestionWithProgress:](self, "nextSuggestionWithProgress:", v28);
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v18;
          if (*((_BYTE *)v41 + 24))
          {
            v17 = 1;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v45 = 207;
              v46 = 2080;
              v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Su"
                    "ggestions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
              _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
          else if (v18)
          {
            objc_msgSend(v24, "addObject:", v18);
            v17 = 0;
            ++v10;
            v12 = v11 + v12;
          }
          else
          {
            v17 = 3;
          }

        }
        objc_autoreleasePoolPop(v14);
        if (v17)
        {
          if (v17 != 3)
          {
            v9 = (id)MEMORY[0x1E0C9AA60];
            v20 = v24;
            goto LABEL_34;
          }
          break;
        }
      }
      v20 = v24;
      if (v6
        && (v21 = CFAbsoluteTimeGetCurrent(), v21 - v37[3] >= 0.01)
        && (v37[3] = v21,
            v35 = 0,
            (*((void (**)(void *, char *, double))v6 + 2))(v6, &v35, 1.0),
            v22 = *((_BYTE *)v41 + 24) | v35,
            (*((_BYTE *)v41 + 24) = v22) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v45 = 217;
          v46 = 2080;
          v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v9 = (id)MEMORY[0x1E0C9AA60];
      }
      else
      {
        v9 = v24;
      }
LABEL_34:

    }
    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);

  }
  else
  {
    v9 = (id)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

- (BOOL)canGenerateSuggestionWithAsset:(id)a3 onDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v6 = a3;
  v7 = a4;
  -[PGAbstractSuggester session](self, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workingContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__PGLongTailSuggester_canGenerateSuggestionWithAsset_onDate___block_invoke;
  v14[3] = &unk_1E84340C0;
  v14[4] = self;
  v11 = v6;
  v15 = v11;
  v12 = v9;
  v16 = v12;
  v17 = &v18;
  objc_msgSend(v10, "performSynchronousConcurrentGraphReadUsingBlock:", v14);

  LOBYTE(v10) = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)v10;
}

- (void)captureInformationFromGraph:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *meNodeLocalIdentifier;
  void *v7;
  NSObject *v8;
  NSString *v9;
  int v10;
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "meNodeWithFallbackInferredMeNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localIdentifier");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  meNodeLocalIdentifier = self->_meNodeLocalIdentifier;
  self->_meNodeLocalIdentifier = v5;

  -[PGAbstractSuggester session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loggingConnection");
  v8 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = self->_meNodeLocalIdentifier;
    v10 = 138412290;
    v11 = v9;
    _os_log_debug_impl(&dword_1CA237000, v8, OS_LOG_TYPE_DEBUG, "Long Tail: meNode local identifier is: %@", (uint8_t *)&v10, 0xCu);
  }

}

- (void)startSuggestingWithOptions:(id)a3
{
  PGSuggestionOptions *v4;
  void *v5;
  NSObject *v6;
  PGSuggestionOptions *options;
  PGSuggestionOptions *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  double v12;
  NSMutableSet *v13;
  NSMutableSet *suggestedAssetsFromPreviousBatch;
  NSMutableSet *v15;
  NSMutableSet *candidateAssetsFromPreviousBatch;
  PGLongTailAdditionalOptions *v17;
  void *v18;
  PGLongTailAdditionalOptions *v19;
  PGLongTailAdditionalOptions *additionalOptions;
  void *v21;
  _QWORD v22[5];
  uint8_t buf[16];

  v4 = (PGSuggestionOptions *)a3;
  -[PGAbstractSuggester session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loggingConnection");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CA237000, v6, OS_LOG_TYPE_DEBUG, "Long Tail Suggester: Starting suggestion", buf, 2u);
  }

  -[PGAbstractSuggester setLastSuggestionWasColliding:](self, "setLastSuggestionWasColliding:", 0);
  options = self->_options;
  self->_options = v4;
  v8 = v4;

  v9 = -[PGSuggestionOptions maximumNumberOfSuggestions](self->_options, "maximumNumberOfSuggestions");
  if (v9)
    v10 = v9;
  else
    v10 = -1;
  self->_maximumNumberOfSuggestions = v10;
  self->_numberOfGeneratedSuggestions = 0;
  -[PGSuggestionOptions localToday](v8, "localToday");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSince1970");
  self->_randomSeed = v12;

  v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  suggestedAssetsFromPreviousBatch = self->_suggestedAssetsFromPreviousBatch;
  self->_suggestedAssetsFromPreviousBatch = v13;

  v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  candidateAssetsFromPreviousBatch = self->_candidateAssetsFromPreviousBatch;
  self->_candidateAssetsFromPreviousBatch = v15;

  v17 = [PGLongTailAdditionalOptions alloc];
  -[PGSuggestionOptions additionalOptions](v8, "additionalOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PGLongTailAdditionalOptions initWithDictionary:](v17, "initWithDictionary:", v18);
  additionalOptions = self->_additionalOptions;
  self->_additionalOptions = v19;

  objc_msgSend(v5, "workingContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __50__PGLongTailSuggester_startSuggestingWithOptions___block_invoke;
  v22[3] = &unk_1E84353C0;
  v22[4] = self;
  objc_msgSend(v21, "performSynchronousConcurrentGraphReadUsingBlock:", v22);

}

- (id)nextSuggestionWithProgress:(id)a3
{
  id v4;
  PGSingleAssetSuggestion *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  PGSingleAssetSuggestion *v10;
  void *v11;
  NSObject *v12;
  void *v14;
  int v15;
  PGSingleAssetSuggestion *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_numberOfGeneratedSuggestions < 0x65)
  {
    -[PGAbstractSuggester session](self, "session");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "loggingConnection");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v15) = 0;
        _os_log_debug_impl(&dword_1CA237000, v8, OS_LOG_TYPE_DEBUG, "Long Tail Suggester: nextSuggestion", (uint8_t *)&v15, 2u);
      }
      -[PGLongTailSuggester nextSuggestedAssetWithProgress:](self, "nextSuggestedAssetWithProgress:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9
        && (v10 = -[PGSingleAssetSuggestion initWithType:subtype:asset:]([PGSingleAssetSuggestion alloc], "initWithType:subtype:asset:", 5, 502, v9)) != 0)
      {
        v5 = v10;
        if (-[PGSuggestionOptions computeReasons](self->_options, "computeReasons"))
        {
          -[PGLongTailSuggester reasonsForSuggestion:](self, "reasonsForSuggestion:", v5);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGSingleAssetSuggestion setReasons:](v5, "setReasons:", v11);

        }
        v12 = v8;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          -[PGSingleAssetSuggestion reasons](v5, "reasons");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138478083;
          v16 = v5;
          v17 = 2112;
          v18 = v14;
          _os_log_debug_impl(&dword_1CA237000, v12, OS_LOG_TYPE_DEBUG, "Long Tail Suggester: Suggesting %{private}@ with reasons: %@", (uint8_t *)&v15, 0x16u);

        }
      }
      else
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v15) = 0;
          _os_log_debug_impl(&dword_1CA237000, v8, OS_LOG_TYPE_DEBUG, "Long Tail Suggester: Nothing to suggest", (uint8_t *)&v15, 2u);
        }
        v5 = 0;
      }

    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        LOWORD(v15) = 0;
        _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Long Tail Suggester: Needs a session!", (uint8_t *)&v15, 2u);
      }
      v5 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Long Tail Suggester: All suggestion trials have been used.", (uint8_t *)&v15, 2u);
    }
    v5 = 0;
  }

  return v5;
}

- (void)reset
{
  void *v3;
  NSObject *v4;
  void *v5;
  double v6;
  NSMutableSet *v7;
  NSMutableSet *suggestedAssetsFromPreviousBatch;
  NSMutableSet *v9;
  NSMutableSet *candidateAssetsFromPreviousBatch;
  uint8_t v11[16];

  -[PGAbstractSuggester session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loggingConnection");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v11 = 0;
    _os_log_debug_impl(&dword_1CA237000, v4, OS_LOG_TYPE_DEBUG, "Long Tail Suggester: Resetting", v11, 2u);
  }

  -[PGAbstractSuggester setLastSuggestionWasColliding:](self, "setLastSuggestionWasColliding:", 0);
  -[PGSuggestionOptions localToday](self->_options, "localToday");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  self->_randomSeed = v6;

  self->_numberOfGeneratedSuggestions = 0;
  v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  suggestedAssetsFromPreviousBatch = self->_suggestedAssetsFromPreviousBatch;
  self->_suggestedAssetsFromPreviousBatch = v7;

  v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  candidateAssetsFromPreviousBatch = self->_candidateAssetsFromPreviousBatch;
  self->_candidateAssetsFromPreviousBatch = v9;

}

- (BOOL)_shouldUsePreviousBatchOfCandidateAssets
{
  uint64_t v3;

  LODWORD(v3) = -[PGAbstractSuggester lastSuggestionWasColliding](self, "lastSuggestionWasColliding");
  if ((_DWORD)v3)
  {
    v3 = -[NSMutableSet count](self->_candidateAssetsFromPreviousBatch, "count");
    if (v3)
      LOBYTE(v3) = (unint64_t)-[NSMutableSet count](self->_suggestedAssetsFromPreviousBatch, "count") < 0x14;
  }
  return v3;
}

- (id)_nextCandidateAssetsWithProgress:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *v6;
  NSMutableSet *candidateAssetsFromPreviousBatch;
  NSMutableSet *v8;
  NSMutableSet *suggestedAssetsFromPreviousBatch;

  v4 = a3;
  -[NSMutableSet minusSet:](self->_candidateAssetsFromPreviousBatch, "minusSet:", self->_suggestedAssetsFromPreviousBatch);
  if (-[PGLongTailSuggester _shouldUsePreviousBatchOfCandidateAssets](self, "_shouldUsePreviousBatchOfCandidateAssets"))
  {
    -[NSMutableSet allObjects](self->_candidateAssetsFromPreviousBatch, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PGLongTailSuggester _batchOfRandomAssetsWithCount:progress:](self, "_batchOfRandomAssetsWithCount:progress:", 200, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v5);
    candidateAssetsFromPreviousBatch = self->_candidateAssetsFromPreviousBatch;
    self->_candidateAssetsFromPreviousBatch = v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    suggestedAssetsFromPreviousBatch = self->_suggestedAssetsFromPreviousBatch;
    self->_suggestedAssetsFromPreviousBatch = v8;

  }
  return v5;
}

- (id)nextSuggestedAssetWithProgress:(id)a3
{
  void *v4;
  double v5;
  char v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  double Current;
  char v13;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSDictionary *v22;
  void *v23;
  NSDictionary *verifiedPersonUUIDsByAssetUUIds;
  double v25;
  char v26;
  void *v27;
  double v28;
  char v29;
  void *v30;
  double v31;
  char v32;
  void *v33;
  double v34;
  char v35;
  void *v36;
  void *v37;
  double v38;
  char v39;
  void *v40;
  id v41;
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
  v41 = a3;
  v4 = _Block_copy(v41);
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  v52 = 0;
  v53 = (double *)&v52;
  v54 = 0x2020000000;
  v55 = 0;
  if (!v4
    || (v5 = CFAbsoluteTimeGetCurrent(), v5 - v53[3] < 0.01)
    || (v53[3] = v5,
        v51 = 0,
        (*((void (**)(void *, char *, double))v4 + 2))(v4, &v51, 0.0),
        v6 = *((_BYTE *)v57 + 24) | v51,
        (*((_BYTE *)v57 + 24) = v6) == 0))
  {
    ++self->_randomSeed;
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __54__PGLongTailSuggester_nextSuggestedAssetWithProgress___block_invoke;
    v46[3] = &unk_1E8434F30;
    v8 = v4;
    v47 = v8;
    v48 = &v52;
    v49 = &v56;
    v50 = 0x3F847AE147AE147BLL;
    -[PGLongTailSuggester _nextCandidateAssetsWithProgress:](self, "_nextCandidateAssetsWithProgress:", v46);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (*((_BYTE *)v57 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_17:
        v7 = 0;
LABEL_18:

        goto LABEL_19;
      }
      *(_DWORD *)buf = 67109378;
      v62 = 394;
      v63 = 2080;
      v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestion"
            "s/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
      v11 = MEMORY[0x1E0C81028];
LABEL_10:
      _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      goto LABEL_17;
    }
    if (!objc_msgSend(v9, "count"))
      goto LABEL_17;
    if (v4)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v53[3] >= 0.01)
      {
        v53[3] = Current;
        v51 = 0;
        (*((void (**)(id, char *, double))v8 + 2))(v8, &v51, 0.2);
        v13 = *((_BYTE *)v57 + 24) | v51;
        *((_BYTE *)v57 + 24) = v13;
        if (v13)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            goto LABEL_17;
          *(_DWORD *)buf = 67109378;
          v62 = 401;
          v63 = 2080;
          v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
          v11 = MEMORY[0x1E0C81028];
          goto LABEL_10;
        }
      }
    }
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v16 = v10;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v60, 16);
    v40 = v10;
    if (v17)
    {
      v18 = *(_QWORD *)v43;
      do
      {
        v19 = 0;
        v20 = v15;
        do
        {
          if (*(_QWORD *)v43 != v18)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v19), "uuid", v40, v41, (_QWORD)v42);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "arrayByAddingObject:", v21);
          v15 = (id)objc_claimAutoreleasedReturnValue();

          ++v19;
          v20 = v15;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v60, 16);
      }
      while (v17);
    }

    -[PGLongTailSuggester _fetchVerifiedPersonUUIDsByAssetUUIds:](self, "_fetchVerifiedPersonUUIDsByAssetUUIds:", v15);
    v22 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v23 = v40;
    verifiedPersonUUIDsByAssetUUIds = self->_verifiedPersonUUIDsByAssetUUIds;
    self->_verifiedPersonUUIDsByAssetUUIds = v22;

    if (v4)
    {
      v25 = CFAbsoluteTimeGetCurrent();
      if (v25 - v53[3] >= 0.01)
      {
        v53[3] = v25;
        v51 = 0;
        (*((void (**)(id, char *, double))v8 + 2))(v8, &v51, 0.4);
        v26 = *((_BYTE *)v57 + 24) | v51;
        *((_BYTE *)v57 + 24) = v26;
        if (v26)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v62 = 410;
            v63 = 2080;
            v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v7 = 0;
          goto LABEL_64;
        }
      }
    }
    -[PGLongTailSuggester _candidateByAssetUUIDsFromAssets:](self, "_candidateByAssetUUIDsFromAssets:", v16, v40);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v28 = CFAbsoluteTimeGetCurrent();
      if (v28 - v53[3] >= 0.01)
      {
        v53[3] = v28;
        v51 = 0;
        (*((void (**)(id, char *, double))v8 + 2))(v8, &v51, 0.6);
        v29 = *((_BYTE *)v57 + 24) | v51;
        *((_BYTE *)v57 + 24) = v29;
        if (v29)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v62 = 415;
            v63 = 2080;
            v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v7 = 0;
          goto LABEL_63;
        }
      }
    }
    -[PGLongTailSuggester _bestAssetUUIDsFromCandidates:percentile:](self, "_bestAssetUUIDsFromCandidates:percentile:", v27, -[PGLongTailAdditionalOptions qualityPercentile](self->_additionalOptions, "qualityPercentile"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v30, "count"))
      goto LABEL_45;
    if (v4)
    {
      v31 = CFAbsoluteTimeGetCurrent();
      if (v31 - v53[3] >= 0.01)
      {
        v53[3] = v31;
        v51 = 0;
        (*((void (**)(id, char *, double))v8 + 2))(v8, &v51, 0.8);
        v32 = *((_BYTE *)v57 + 24) | v51;
        *((_BYTE *)v57 + 24) = v32;
        if (v32)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v62 = 424;
            v63 = 2080;
            v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_45:
          v7 = 0;
LABEL_62:

LABEL_63:
LABEL_64:

          v10 = v23;
          goto LABEL_18;
        }
      }
    }
    -[PGLongTailSuggester _assetUUIDByWeightedProbablisticSamplingFromAssetUUIDS:weights:](self, "_assetUUIDByWeightedProbablisticSamplingFromAssetUUIDS:weights:", v30, v27);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      if (!v4
        || (v34 = CFAbsoluteTimeGetCurrent(), v34 - v53[3] < 0.01)
        || (v53[3] = v34,
            v51 = 0,
            (*((void (**)(id, char *, double))v8 + 2))(v8, &v51, 0.9),
            v35 = *((_BYTE *)v57 + 24) | v51,
            (*((_BYTE *)v57 + 24) = v35) == 0))
      {
        objc_msgSend(v27, "objectForKeyedSubscript:", v33);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "asset");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](self->_suggestedAssetsFromPreviousBatch, "addObject:", v37);
        ++self->_numberOfGeneratedSuggestions;
        if (v4
          && (v38 = CFAbsoluteTimeGetCurrent(), v38 - v53[3] >= 0.01)
          && (v53[3] = v38,
              v51 = 0,
              (*((void (**)(id, char *, double))v8 + 2))(v8, &v51, 1.0),
              v39 = *((_BYTE *)v57 + 24) | v51,
              (*((_BYTE *)v57 + 24) = v39) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v62 = 442;
            v63 = 2080;
            v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v7 = 0;
        }
        else
        {
          v7 = v37;
        }

        goto LABEL_61;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v62 = 433;
        v63 = 2080;
        v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    v7 = 0;
LABEL_61:

    goto LABEL_62;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v62 = 386;
    v63 = 2080;
    v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestions/"
          "Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v7 = 0;
LABEL_19:
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);

  return v7;
}

- (unint64_t)_longTailScoreWithAsset:(id)a3 withAdditionalOptions:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  NSDictionary *verifiedPersonUUIDsByAssetUUIds;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isFavorite"))
    v8 = 2;
  else
    v8 = 1;
  v9 = v8 + objc_msgSend(v6, "isIncludedInCloudFeeds");
  if (objc_msgSend(v6, "clsShareCount"))
    ++v9;
  if (objc_msgSend(v6, "clsPeopleCount"))
    ++v9;
  -[PGAbstractSuggester session](self, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topTierAestheticScore");
  v12 = v11;

  if (v12 != 0.0)
  {
    objc_msgSend(v6, "clsAestheticScore");
    if (v13 >= v12)
      v9 += objc_msgSend(v7, "topTierAestheticScoreValue");
  }
  verifiedPersonUUIDsByAssetUUIds = self->_verifiedPersonUUIDsByAssetUUIds;
  objc_msgSend(v6, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](verifiedPersonUUIDsByAssetUUIds, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "count"))
    v9 += objc_msgSend(v7, "verifiedPersonScoreValue");

  return v9;
}

- (id)_fetchVerifiedPersonUUIDsByAssetUUIds:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[PGAbstractSuggester session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "librarySpecificFetchOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("personForFace.type"), -1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInternalPredicate:", v9);

    objc_msgSend(MEMORY[0x1E0CD16C0], "fetchVerifiedPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:options:", v4, v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_batchOfRandomAssetsWithCount:(unint64_t)a3 progress:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(void *, _BYTE *, double);
  double Current;
  char v10;
  id v11;
  void (**v12)(void *, _BYTE *, double);
  void *v13;
  NSObject *v14;
  double v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  char v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  double v34;
  char v35;
  void *v37;
  void *v38;
  NSObject *oslog;
  _QWORD v40[4];
  id v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  double *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  uint8_t buf[4];
  int v55;
  __int16 v56;
  const char *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PGAbstractSuggester session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void (**)(void *, _BYTE *, double))_Block_copy(v6);
    v50 = 0;
    v51 = &v50;
    v52 = 0x2020000000;
    v53 = 0;
    v46 = 0;
    v47 = (double *)&v46;
    v48 = 0x2020000000;
    v49 = 0;
    if (v8)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v47[3] >= 0.01)
      {
        v47[3] = Current;
        v45 = 0;
        v8[2](v8, &v45, 0.0);
        v10 = *((_BYTE *)v51 + 24) | v45;
        *((_BYTE *)v51 + 24) = v10;
        if (v10)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v55 = 508;
            v56 = 2080;
            v57 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v11 = (id)MEMORY[0x1E0C9AA60];
          goto LABEL_50;
        }
      }
    }
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __62__PGLongTailSuggester__batchOfRandomAssetsWithCount_progress___block_invoke;
    v40[3] = &unk_1E8434F30;
    v12 = v8;
    v41 = v12;
    v42 = &v46;
    v43 = &v50;
    v44 = 0x3F847AE147AE147BLL;
    -[PGLongTailSuggester _eligibleAssetUUIDsWithProgress:](self, "_eligibleAssetUUIDsWithProgress:", v40);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v51 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v55 = 513;
        v56 = 2080;
        v57 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
        v14 = MEMORY[0x1E0C81028];
LABEL_11:
        _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      if (!v8
        || (v15 = CFAbsoluteTimeGetCurrent(), v15 - v47[3] < 0.01)
        || (v47[3] = v15,
            v45 = 0,
            v12[2](v12, &v45, 0.5),
            v16 = *((_BYTE *)v51 + 24) | v45,
            (*((_BYTE *)v51 + 24) = v16) == 0))
      {
        objc_msgSend(v7, "loggingConnection");
        oslog = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_DEBUG, "Long Tail: Selecting random batch of assets", buf, 2u);
        }
        v17 = objc_msgSend(v13, "count");
        if (v17)
        {
          v18 = -[PGLongTailSuggester _randomRangeWithLocationUpperBound:maxLength:](self, "_randomRangeWithLocationUpperBound:maxLength:", v17, a3);
          v20 = v19;
          if (v8
            && (v21 = CFAbsoluteTimeGetCurrent(), v21 - v47[3] >= 0.01)
            && (v47[3] = v21,
                v45 = 0,
                v12[2](v12, &v45, 0.7),
                v22 = *((_BYTE *)v51 + 24) | v45,
                (*((_BYTE *)v51 + 24) = v22) != 0))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v55 = 529;
              v56 = 2080;
              v57 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Su"
                    "ggestions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            v11 = (id)MEMORY[0x1E0C9AA60];
          }
          else
          {
            v23 = (void *)MEMORY[0x1E0C99E60];
            objc_msgSend(v13, "subarrayWithRange:", v18, v20);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setWithArray:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_DEBUG, "Long Tail: Fetching selected random batch of assets with curation properties", buf, 2u);
            }
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(uuid IN %@)"), v25);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[PGAbstractSuggester defaultAssetFetchOptionsWithInternalPredicate:](self, "defaultAssetFetchOptionsWithInternalPredicate:");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setFetchPropertySets:", v27);

            objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v26);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (v8
              && (v28 = CFAbsoluteTimeGetCurrent(), v28 - v47[3] >= 0.01)
              && (v47[3] = v28,
                  v45 = 0,
                  v12[2](v12, &v45, 0.8),
                  v29 = *((_BYTE *)v51 + 24) | v45,
                  (*((_BYTE *)v51 + 24) = v29) != 0))
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                v55 = 542;
                v56 = 2080;
                v57 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Suggestions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
              v11 = (id)MEMORY[0x1E0C9AA60];
            }
            else
            {
              v30 = (void *)MEMORY[0x1E0CD1390];
              v31 = objc_msgSend(MEMORY[0x1E0CD1390], "clsPrefetchOptionsForKeyAsset");
              objc_msgSend(v7, "curationContext");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "clsAllAssetsFromFetchResult:prefetchOptions:curationContext:", v38, v31, v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              if (v8
                && (v34 = CFAbsoluteTimeGetCurrent(), v34 - v47[3] >= 0.01)
                && (v47[3] = v34,
                    v45 = 0,
                    v12[2](v12, &v45, 1.0),
                    v35 = *((_BYTE *)v51 + 24) | v45,
                    (*((_BYTE *)v51 + 24) = v35) != 0))
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  v55 = 546;
                  v56 = 2080;
                  v57 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewor"
                        "k/Suggestions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
                  _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
                v11 = (id)MEMORY[0x1E0C9AA60];
              }
              else
              {
                v11 = v33;
              }

            }
          }
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Fetch of all highighted assets return empty results.", buf, 2u);
          }
          v11 = 0;
        }

        goto LABEL_49;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v55 = 515;
        v56 = 2080;
        v57 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
        v14 = MEMORY[0x1E0C81028];
        goto LABEL_11;
      }
    }
    v11 = (id)MEMORY[0x1E0C9AA60];
LABEL_49:

LABEL_50:
    _Block_object_dispose(&v46, 8);
    _Block_object_dispose(&v50, 8);

    goto LABEL_51;
  }
  v11 = 0;
LABEL_51:

  return v11;
}

- (id)highlightedAssetInternalPredicate
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0D77E18], "legacyAestheticScoreThresholdToBeAestheticallyPrettyGood");
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("highlightBeingExtendedAssets != nil AND overallAestheticScore >= %f AND (kindSubtype & %d) == 0"), v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "noVideoPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "internalPredicateForProcessedAssetsWithMinimumSceneAnalysisVersion:", 33);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3528];
  v11[0] = v4;
  v11[1] = v5;
  v11[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isMomentNodeInteresting:(id)a3 withNeighborScoreComputer:(id)a4
{
  id v5;
  id v6;
  BOOL v7;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isInteresting") & 1) != 0
    || (objc_msgSend(v5, "isSmartInteresting") & 1) != 0
    || (objc_msgSend(v5, "isMeaningful") & 1) != 0
    || (objc_msgSend(v5, "isPartOfTrip") & 1) != 0
    || (objc_msgSend(v5, "isInterestingForMemories") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v6, "neighborScoreWithMomentNode:", v5);
    v7 = +[PGGraphMomentNode breakoutOfRoutineTypeWithNeighborScore:](PGGraphMomentNode, "breakoutOfRoutineTypeWithNeighborScore:") != 0;
  }

  return v7;
}

- (id)allInterestingMomentsFromGraph:(id)a3 progress:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  char v10;
  id v11;
  PGNeighborScoreComputer *v12;
  void *v13;
  id v14;
  PGNeighborScoreComputer *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double Current;
  char v21;
  char v23;
  _QWORD v24[5];
  PGNeighborScoreComputer *v25;
  id v26;
  _QWORD *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t *p_buf;
  uint64_t v31;
  _QWORD v32[4];
  uint64_t v33;
  double *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  int v41;
  int v42;
  __int16 v43;
  const char *v44;
  uint64_t buf;
  __int128 v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _Block_copy(v7);
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = (double *)&v33;
  v35 = 0x2020000000;
  v36 = 0;
  if (v8
    && (v9 = CFAbsoluteTimeGetCurrent(), v9 - v34[3] >= 0.01)
    && (v34[3] = v9,
        LOBYTE(v32[0]) = 0,
        (*((void (**)(void *, _QWORD *, double))v8 + 2))(v8, v32, 0.0),
        v10 = *((_BYTE *)v38 + 24) | LOBYTE(v32[0]),
        (*((_BYTE *)v38 + 24) = v10) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      buf = 0x24504000202;
      LOWORD(v46) = 2080;
      *(_QWORD *)((char *)&v46 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Suggestions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
    }
    v11 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v12 = objc_alloc_init(PGNeighborScoreComputer);
    buf = 0;
    *(_QWORD *)&v46 = &buf;
    *((_QWORD *)&v46 + 1) = 0x3032000000;
    v47 = __Block_byref_object_copy__24244;
    v48 = __Block_byref_object_dispose__24245;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v49 = (id)objc_claimAutoreleasedReturnValue();
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    v32[3] = 0;
    objc_msgSend(v6, "momentNodes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __63__PGLongTailSuggester_allInterestingMomentsFromGraph_progress___block_invoke;
    v24[3] = &unk_1E842B518;
    v27 = v32;
    v14 = v8;
    v31 = 0x3F847AE147AE147BLL;
    v28 = &v33;
    v29 = &v37;
    v26 = v14;
    v24[4] = self;
    v15 = v12;
    v25 = v15;
    p_buf = &buf;
    objc_msgSend(v13, "enumerateNodesUsingBlock:", v24);

    if (*((_BYTE *)v38 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v41 = 67109378;
        v42 = 595;
        v43 = 2080;
        v44 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v41, 0x12u);
      }
      v11 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v16 = *(_QWORD *)(v46 + 40);
      -[PGAbstractSuggester session](self, "session");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "photoLibrary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "momentsForMomentNodes:inPhotoLibrary:sortChronologically:", v16, v18, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8
        && (Current = CFAbsoluteTimeGetCurrent(), Current - v34[3] >= 0.01)
        && (v34[3] = Current,
            v23 = 0,
            (*((void (**)(id, char *, double))v14 + 2))(v14, &v23, 1.0),
            v21 = *((_BYTE *)v38 + 24) | v23,
            (*((_BYTE *)v38 + 24) = v21) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          v41 = 67109378;
          v42 = 599;
          v43 = 2080;
          v44 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v41, 0x12u);
        }
        v11 = (id)MEMORY[0x1E0C9AA60];
      }
      else
      {
        v11 = v19;
      }

    }
    _Block_object_dispose(v32, 8);
    _Block_object_dispose(&buf, 8);

  }
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v11;
}

- (id)_eligibleAssetUUIDsWithProgress:(id)a3
{
  void *v4;
  double v5;
  char v6;
  NSObject *v7;
  NSArray **p_eligibleAssetUUIDs;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  double Current;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  unint64_t v22;
  uint64_t v23;
  __int128 v24;
  double v25;
  double v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  double v30;
  char v31;
  int v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  double v39;
  char v40;
  NSArray *v41;
  int v43;
  int v44;
  __int128 v45;
  os_log_t oslog;
  void *v47;
  id *location;
  NSObject *log;
  id v50;
  NSObject *obj;
  void *v52;
  uint64_t v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  char v63;
  _QWORD v64[5];
  id v65;
  uint8_t *v66;
  uint64_t *v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  double *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  char v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _QWORD v80[2];
  uint64_t v81;
  uint8_t buf[4];
  int v83;
  __int16 v84;
  const char *v85;
  uint8_t v86[8];
  __int128 v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v4 = _Block_copy(v54);
  v74 = 0;
  v75 = &v74;
  v76 = 0x2020000000;
  v77 = 0;
  v70 = 0;
  v71 = (double *)&v70;
  v72 = 0x2020000000;
  v73 = 0;
  if (v4
    && (v5 = CFAbsoluteTimeGetCurrent(), v5 - v71[3] >= 0.01)
    && (v71[3] = v5,
        buf[0] = 0,
        (*((void (**)(void *, uint8_t *, double))v4 + 2))(v4, buf, 0.0),
        v6 = *((_BYTE *)v75 + 24) | buf[0],
        (*((_BYTE *)v75 + 24) = v6) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v86 = 67109378;
      *(_DWORD *)&v86[4] = 607;
      LOWORD(v87) = 2080;
      *(_QWORD *)((char *)&v87 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Suggestions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
      v7 = MEMORY[0x1E0C81028];
LABEL_58:
      _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v86, 0x12u);
    }
  }
  else
  {
    p_eligibleAssetUUIDs = &self->_eligibleAssetUUIDs;
    if (!self->_eligibleAssetUUIDs)
    {
      -[PGAbstractSuggester session](self, "session");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "loggingConnection");
        log = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v86 = 0;
          _os_log_debug_impl(&dword_1CA237000, log, OS_LOG_TYPE_DEBUG, "Long Tail: Fetching all interesting moments", v86, 2u);
        }
        location = (id *)&self->_eligibleAssetUUIDs;
        *(_QWORD *)v86 = 0;
        *(_QWORD *)&v87 = v86;
        *((_QWORD *)&v87 + 1) = 0x3032000000;
        v88 = __Block_byref_object_copy__24244;
        v89 = __Block_byref_object_dispose__24245;
        v90 = 0;
        v47 = v10;
        objc_msgSend(v10, "workingContext");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __55__PGLongTailSuggester__eligibleAssetUUIDsWithProgress___block_invoke;
        v64[3] = &unk_1E842B540;
        v66 = v86;
        v64[4] = self;
        v50 = v4;
        v65 = v50;
        v67 = &v70;
        v68 = &v74;
        v69 = 0x3F847AE147AE147BLL;
        objc_msgSend(v11, "performSynchronousConcurrentGraphReadUsingBlock:", v64);

        if (*((_BYTE *)v75 + 24))
        {
          v12 = 1;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v83 = 630;
            v84 = 2080;
            v85 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
        else
        {
          v13 = log;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            v43 = objc_msgSend(*(id *)(v87 + 40), "count");
            *(_DWORD *)buf = 67109120;
            v83 = v43;
            _os_log_debug_impl(&dword_1CA237000, v13, OS_LOG_TYPE_DEBUG, "Long Tail: Fetching all interesting moments: %d found", buf, 8u);
          }
          oslog = v13;

          if (!v4)
            goto LABEL_64;
          Current = CFAbsoluteTimeGetCurrent();
          if (Current - v71[3] >= 0.01
            && (v71[3] = Current,
                v63 = 0,
                (*((void (**)(id, char *, double))v50 + 2))(v50, &v63, 0.2),
                v15 = *((_BYTE *)v75 + 24) | v63,
                (*((_BYTE *)v75 + 24) = v15) != 0))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v83 = 634;
              v84 = 2080;
              v85 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Su"
                    "ggestions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            v12 = 1;
          }
          else
          {
LABEL_64:
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1CA237000, v13, OS_LOG_TYPE_DEBUG, "Long Tail: Fetching all UUIDs of assets highlighted in interesting moments in curated library", buf, 2u);
            }
            -[PGLongTailSuggester highlightedAssetInternalPredicate](self, "highlightedAssetInternalPredicate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[PGAbstractSuggester defaultAssetFetchOptionsWithInternalPredicate:](self, "defaultAssetFetchOptionsWithInternalPredicate:", v16);
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            v81 = *MEMORY[0x1E0CD19C0];
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "setFetchPropertySets:", v17);

            objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v80[0] = v18;
            objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v80[1] = v19;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 2);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "setSortDescriptors:", v20);

            v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v22 = objc_msgSend(*(id *)(v87 + 40), "count");
            v61 = 0u;
            v62 = 0u;
            v59 = 0u;
            v60 = 0u;
            obj = *(id *)(v87 + 40);
            v23 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v79, 16);
            if (v23)
            {
              v25 = 1.0 / (double)v22;
              v53 = *(_QWORD *)v60;
              v26 = 0.0;
              *(_QWORD *)&v24 = 67109378;
              v45 = v24;
              while (2)
              {
                for (i = 0; i != v23; ++i)
                {
                  if (*(_QWORD *)v60 != v53)
                    objc_enumerationMutation(obj);
                  v28 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
                  v29 = (void *)MEMORY[0x1CAA4EB2C]();
                  if (v4
                    && (v30 = CFAbsoluteTimeGetCurrent(), v30 - v71[3] >= 0.01)
                    && (v71[3] = v30,
                        v63 = 0,
                        (*((void (**)(id, char *, double))v50 + 2))(v50, &v63, v26 * 0.8 + 0.2),
                        v31 = *((_BYTE *)v75 + 24) | v63,
                        (*((_BYTE *)v75 + 24) = v31) != 0))
                  {
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = v45;
                      v83 = 649;
                      v84 = 2080;
                      v85 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
                      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                    }
                    v32 = 0;
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v28, v52, v45);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v57 = 0u;
                    v58 = 0u;
                    v55 = 0u;
                    v56 = 0u;
                    v34 = v33;
                    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v55, v78, 16);
                    if (v35)
                    {
                      v36 = *(_QWORD *)v56;
                      do
                      {
                        for (j = 0; j != v35; ++j)
                        {
                          if (*(_QWORD *)v56 != v36)
                            objc_enumerationMutation(v34);
                          objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * j), "uuid");
                          v38 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v21, "addObject:", v38);

                        }
                        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v55, v78, 16);
                      }
                      while (v35);
                    }

                    v26 = v25 + v26;
                    v32 = 1;
                  }
                  objc_autoreleasePoolPop(v29);
                  if (!v32)
                  {
                    v12 = 1;
                    goto LABEL_49;
                  }
                }
                v23 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v79, 16);
                if (v23)
                  continue;
                break;
              }
            }

            objc_storeStrong(location, v21);
            obj = oslog;
            if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
            {
              v44 = objc_msgSend(v21, "count");
              *(_DWORD *)buf = 67109120;
              v83 = v44;
              _os_log_debug_impl(&dword_1CA237000, obj, OS_LOG_TYPE_DEBUG, "Long Tail: Fetching all UUIDs of assets highlighted in interesting moments in curated library: %d found", buf, 8u);
            }
            v12 = 0;
LABEL_49:

          }
        }

        _Block_object_dispose(v86, 8);
        v10 = v47;
        p_eligibleAssetUUIDs = (NSArray **)location;
        if (v12)
        {

          goto LABEL_59;
        }
      }

    }
    if (!v4
      || (v39 = CFAbsoluteTimeGetCurrent(), v39 - v71[3] < 0.01)
      || (v71[3] = v39,
          buf[0] = 0,
          (*((void (**)(void *, uint8_t *, double))v4 + 2))(v4, buf, 1.0),
          v40 = *((_BYTE *)v75 + 24) | buf[0],
          (*((_BYTE *)v75 + 24) = v40) == 0))
    {
      v41 = *p_eligibleAssetUUIDs;
      goto LABEL_61;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v86 = 67109378;
      *(_DWORD *)&v86[4] = 666;
      LOWORD(v87) = 2080;
      *(_QWORD *)((char *)&v87 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Suggestions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
      v7 = MEMORY[0x1E0C81028];
      goto LABEL_58;
    }
  }
LABEL_59:
  v41 = (NSArray *)MEMORY[0x1E0C9AA60];
LABEL_61:
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);

  return v41;
}

- (id)_candidateByAssetUUIDsFromAssets:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  PGLongTailSuggestionCandidate *v12;
  id v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(v9, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[PGLongTailSuggestionCandidate initWithAsset:score:]([PGLongTailSuggestionCandidate alloc], "initWithAsset:score:", v9, -[PGLongTailSuggester _longTailScoreWithAsset:withAdditionalOptions:](self, "_longTailScoreWithAsset:withAdditionalOptions:", v9, self->_additionalOptions));
        if (-[PGLongTailSuggestionCandidate isValidWithMeNodeLocalIdentifier:](v12, "isValidWithMeNodeLocalIdentifier:", self->_meNodeLocalIdentifier))
        {
          objc_msgSend(v14, "setValue:forKey:", v12, v11);
        }

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v14;
}

- (id)_bestAssetUUIDsFromCandidates:(id)a3 percentile:(unint64_t)a4
{
  id v5;
  unint64_t v6;
  void *v7;

  objc_msgSend(a3, "keysSortedByValueUsingComparator:", &__block_literal_global_24237);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)((double)a4 / 100.0 * (double)(unint64_t)objc_msgSend(v5, "count"));
  v7 = v5;
  if (v6)
  {
    v7 = v5;
    if (objc_msgSend(v5, "count") > v6)
    {
      objc_msgSend(v5, "subarrayWithRange:", 0, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

- (id)_assetUUIDByWeightedProbablisticSamplingFromAssetUUIDS:(id)a3 weights:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(v6, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "score");
        if (v16)
        {
          v17 = v16;
          do
          {
            objc_msgSend(v7, "addObject:", v13);
            --v17;
          }
          while (v17);
        }

        objc_autoreleasePoolPop(v14);
        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  v18 = objc_msgSend(v7, "count");
  if (v18)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", +[PGLongTailSuggester randomIntegerWithUpperBound:seed:](PGLongTailSuggester, "randomIntegerWithUpperBound:seed:", v18, self->_randomSeed));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }

  return v19;
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

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("score = %lu"), -[PGLongTailSuggester _longTailScoreWithAsset:withAdditionalOptions:](self, "_longTailScoreWithAsset:withAdditionalOptions:", v5, self->_additionalOptions));
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

- (id)_assetUUIDsFromAssets:(id)a3 atIndices:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v5, "objectsAtIndexes:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

- (_NSRange)_randomRangeWithLocationUpperBound:(unint64_t)a3 maxLength:(unint64_t)a4
{
  NSUInteger v5;
  NSUInteger v6;
  _NSRange result;

  if (a3 <= a4)
  {
    v6 = a3;
    v5 = 0;
  }
  else
  {
    v5 = +[PGLongTailSuggester randomIntegerWithUpperBound:seed:](PGLongTailSuggester, "randomIntegerWithUpperBound:seed:", a3 - a4 + 1, self->_randomSeed);
    v6 = a4;
  }
  result.length = v6;
  result.location = v5;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meNodeLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_candidateAssetsFromPreviousBatch, 0);
  objc_storeStrong((id *)&self->_suggestedAssetsFromPreviousBatch, 0);
  objc_storeStrong((id *)&self->_verifiedPersonUUIDsByAssetUUIds, 0);
  objc_storeStrong((id *)&self->_eligibleAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_additionalOptions, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

uint64_t __64__PGLongTailSuggester__bestAssetUUIDsFromCandidates_percentile___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(a2, "score");
  v6 = objc_msgSend(v4, "score");

  if (v5 <= v6)
    v7 = 0;
  else
    v7 = -1;
  if (v5 < v6)
    return 1;
  else
    return v7;
}

void __55__PGLongTailSuggester__eligibleAssetUUIDsWithProgress___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  __int128 v10;
  uint64_t v11;

  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__PGLongTailSuggester__eligibleAssetUUIDsWithProgress___block_invoke_2;
    v8[3] = &unk_1E8434F30;
    v4 = *(void **)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 72);
    v10 = *(_OWORD *)(a1 + 56);
    objc_msgSend(v4, "allInterestingMomentsFromGraph:progress:", v3, v8);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void __55__PGLongTailSuggester__eligibleAssetUUIDsWithProgress___block_invoke_2(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.2);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __63__PGLongTailSuggester_allInterestingMomentsFromGraph_progress___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  double Current;
  uint64_t v9;

  v5 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(_QWORD *)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7 + 1;
  if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * v7, 1) <= 0x1999999999999999uLL
    && *(_QWORD *)(a1 + 48)
    && (Current = CFAbsoluteTimeGetCurrent(),
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8),
        Current - *(double *)(v9 + 24) >= *(double *)(a1 + 88))
    && (*(double *)(v9 + 24) = Current,
        (*(void (**)(double))(*(_QWORD *)(a1 + 48) + 16))(0.5),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                               + 24)) != 0))
  {
    *a3 = 1;
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isMomentNodeInteresting:withNeighborScoreComputer:", v5, *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "addObject:", v5);
  }

}

void __62__PGLongTailSuggester__batchOfRandomAssetsWithCount_progress___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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

void __54__PGLongTailSuggester_nextSuggestedAssetWithProgress___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.2);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __50__PGLongTailSuggester_startSuggestingWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "graph");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureInformationFromGraph:", v3);

}

void __61__PGLongTailSuggester_canGenerateSuggestionWithAsset_onDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PGNeighborScoreComputer *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  PGLongTailSuggestionCandidate *v32;
  void *v33;
  PGNeighborScoreComputer *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "captureInformationFromGraph:", v3);
  objc_msgSend(*(id *)(a1 + 32), "highlightedAssetInternalPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("uuid == %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3528];
  v40[0] = v4;
  v40[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "defaultAssetFetchOptionsWithInternalPredicate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFetchPropertySets:", v12);

  objc_msgSend(v11, "setFetchLimit:", 1);
  v13 = (void *)MEMORY[0x1E0CD1390];
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fetchAssetsWithUUIDs:options:", v15, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "count"))
  {
    v36 = v7;
    v37 = v4;
    objc_msgSend(*(id *)(a1 + 48), "librarySpecificFetchOptions");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CD1670];
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)v17;
    objc_msgSend(v18, "fetchMomentUUIDByAssetUUIDForAssetUUIDs:options:", v20, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allValues");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = objc_alloc_init(PGNeighborScoreComputer);
      +[PGGraphMomentNodeCollection momentNodeForUUID:inGraph:](PGGraphMomentNodeCollection, "momentNodeForUUID:inGraph:", v23, v3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "anyNode");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26
        && objc_msgSend(*(id *)(a1 + 32), "isMomentNodeInteresting:withNeighborScoreComputer:", v26, v24))
      {
        v34 = v24;
        v27 = (void *)MEMORY[0x1E0CD1390];
        v28 = objc_msgSend(MEMORY[0x1E0CD1390], "clsPrefetchOptionsForKeyAsset");
        objc_msgSend(*(id *)(a1 + 32), "session");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "curationContext");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "clsAllAssetsFromFetchResult:prefetchOptions:curationContext:", v16, v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "firstObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          v32 = -[PGLongTailSuggestionCandidate initWithAsset:score:]([PGLongTailSuggestionCandidate alloc], "initWithAsset:score:", v31, objc_msgSend(*(id *)(a1 + 32), "_longTailScoreWithAsset:withAdditionalOptions:", v31, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56)));
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = -[PGLongTailSuggestionCandidate isValidWithMeNodeLocalIdentifier:](v32, "isValidWithMeNodeLocalIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));

        }
        v24 = v34;
      }

    }
    v7 = v36;
    v4 = v37;
  }

}

void __55__PGLongTailSuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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

+ (id)suggestionTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 5);
}

+ (id)suggestionSubtypes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 502);
}

+ (unint64_t)randomIntegerWithUpperBound:(unint64_t)a3 seed:(unsigned int)a4
{
  srand(a4);
  return rand() % a3;
}

@end
