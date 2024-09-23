@implementation PGAbstractSuggester

- (PGAbstractSuggester)initWithSession:(id)a3
{
  id v4;
  PGAbstractSuggester *v5;
  PGAbstractSuggester *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CLSSceneConfidenceThresholdHelper *suggestableScenesHelper;
  NSSet *sharedLibraryPersonIdentifiers;

  v4 = a3;
  v5 = -[PGAbstractSuggester init](self, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_session, v4);
    v6->_lastSuggestionWasColliding = 0;
    v7 = objc_alloc(MEMORY[0x1E0D77E28]);
    +[PGGraphSceneNode suggestableSceneNames](PGGraphSceneNode, "suggestableSceneNames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "initWithSceneNames:thresholdType:", v9, 1);
    suggestableScenesHelper = v6->_suggestableScenesHelper;
    v6->_suggestableScenesHelper = (CLSSceneConfidenceThresholdHelper *)v10;

    *(_WORD *)&v6->_prefetchedSharedLibraryState = 0;
    sharedLibraryPersonIdentifiers = v6->_sharedLibraryPersonIdentifiers;
    v6->_sharedLibraryPersonIdentifiers = 0;

  }
  return v6;
}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)canGenerateSuggestionWithAsset:(id)a3 onDate:(id)a4
{
  return 0;
}

- (BOOL)assetIsValidForSuggesting:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  objc_msgSend(v4, "sceneAnalysisProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sceneAnalysisVersion");
  v7 = (__int16)*MEMORY[0x1E0D71F80];

  v9 = v6 > v7
    && (objc_msgSend(v4, "faceAdjustmentVersion"), v8 = (void *)objc_claimAutoreleasedReturnValue(),
                                                   v8,
                                                   v8)
    && -[PGAbstractSuggester processedAssetIsValidForSuggesting:allowGuestAsset:](self, "processedAssetIsValidForSuggesting:allowGuestAsset:", v4, 0);

  return v9;
}

- (double)userFeedbackScoreWithAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  double v18;
  double v19;
  PGAbstractSuggester *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clsPersonAndPetLocalIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    v21 = self;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(MEMORY[0x1E0CD16C0], "uuidFromLocalIdentifier:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v13));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
    }

    self = v21;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  objc_msgSend(WeakRetained, "curationContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "userFeedbackCalculator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scoreForKeyAssetUUID:personsUUIDsInKeyAsset:memoryFeatures:", v5, v8, 0);
  v19 = v18;

  return v19;
}

- (BOOL)processedAssetIsValidForSuggesting:(id)a3 allowGuestAsset:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  BOOL v8;
  void *v10;

  v4 = a4;
  v6 = a3;
  if ((objc_msgSend(v6, "clsIsUtility") & 1) != 0
    || (-[PGAbstractSuggester userFeedbackScoreWithAsset:](self, "userFeedbackScoreWithAsset:", v6),
        v7 < *MEMORY[0x1E0CD1E58]))
  {
    v8 = 0;
  }
  else
  {
    v8 = 0;
    if ((objc_msgSend(v6, "clsAvoidIfPossibleAsKeyItemForMemories:allowGuestAsset:", 0, v4) & 1) == 0)
    {
      objc_msgSend(v6, "clsFaceInformationSummary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "numberOfFaces"))
        v8 = objc_msgSend(v10, "numberOfGoodFacesOfVerifiedPersons") != 0;
      else
        v8 = 1;

    }
  }

  return v8;
}

- (id)defaultAssetFetchOptionsWithInternalPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGAbstractSuggester session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setIncludeGuestAssets:", 0);
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset"), 1);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v4)
  {
    v10 = (void *)MEMORY[0x1E0CB3528];
    v14[0] = v4;
    v14[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInternalPredicate:", v12);

  }
  else
  {
    objc_msgSend(v7, "setInternalPredicate:", v8);
  }
  objc_msgSend(v7, "setWantsIncrementalChangeDetails:", 0);

  return v7;
}

- (BOOL)hasSuggestableScenesWithAsset:(id)a3
{
  id v4;
  CLSSceneConfidenceThresholdHelper *suggestableScenesHelper;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  suggestableScenesHelper = self->_suggestableScenesHelper;
  objc_msgSend(v4, "curationModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSSceneConfidenceThresholdHelper confidenceThresholdBySceneIdentifierWithCurationModel:](suggestableScenesHelper, "confidenceThresholdBySceneIdentifierWithCurationModel:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "sceneClassifications", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v12, "extendedSceneIdentifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v12, "confidence");
          v16 = v15;
          objc_msgSend(v14, "doubleValue");
          if (v16 >= v17)
          {

            LOBYTE(v9) = 1;
            goto LABEL_12;
          }
        }

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_12:

  return v9;
}

- (void)_prefetchSharedLibraryStateIfNeeded
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  NSSet *v7;
  NSSet *sharedLibraryPersonIdentifiers;
  id v9;

  if (!self->_prefetchedSharedLibraryState)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_session);
    objc_msgSend(WeakRetained, "photoLibrary");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "librarySpecificFetchOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFetchLimit:", 1);
    objc_msgSend(MEMORY[0x1E0CD15E0], "fetchActiveLibraryScopeWithOptions:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    self->_isSharedLibraryEnabled = v6 != 0;
    if (v6)
    {
      +[PGAbstractSuggester _sharedLibraryPersonIdentifiersInLibrary:withScope:](PGAbstractSuggester, "_sharedLibraryPersonIdentifiersInLibrary:withScope:", v9, v6);
      v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
      sharedLibraryPersonIdentifiers = self->_sharedLibraryPersonIdentifiers;
      self->_sharedLibraryPersonIdentifiers = v7;

    }
    self->_prefetchedSharedLibraryState = 1;

  }
}

- (id)sharingSuggestionResultsForMomentNodes:(id)a3 withWorkingContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  id v28;
  void *v29;
  PGSharingManager *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v30 = -[PGSharingManager initWithWorkingContext:]([PGSharingManager alloc], "initWithWorkingContext:", v7);
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setSharingStream:", 1);
    v29 = v8;
    objc_msgSend(v8, "setIncludeUnverified:", 1);
    v9 = (void *)objc_opt_new();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v36 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "localIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v12);
    }

    -[PGSharingManager suggestionResultsForAssetLocalIdentifiers:momentLocalIdentifiers:options:](v30, "suggestionResultsForAssetLocalIdentifiers:momentLocalIdentifiers:options:", 0, v9, v29);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGAbstractSuggester _prefetchSharedLibraryStateIfNeeded](self, "_prefetchSharedLibraryStateIfNeeded");
    if (self->_isSharedLibraryEnabled)
    {
      v27 = v7;
      v28 = v6;
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v16, "count"));
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v18 = v16;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v32;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v32 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
            objc_msgSend(v23, "person", v27, v28);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "localIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v25 || !-[NSSet containsObject:](self->_sharedLibraryPersonIdentifiers, "containsObject:", v25))
              objc_msgSend(v17, "addObject:", v23);

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        }
        while (v20);
      }

      v7 = v27;
      v6 = v28;
    }
    else
    {
      v17 = v16;
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v17;
}

- (id)reasonsForSuggestion:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (PGSuggestionSession)session
{
  return (PGSuggestionSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (void)setSession:(id)a3
{
  objc_storeWeak((id *)&self->_session, a3);
}

- (BOOL)lastSuggestionWasColliding
{
  return self->_lastSuggestionWasColliding;
}

- (void)setLastSuggestionWasColliding:(BOOL)a3
{
  self->_lastSuggestionWasColliding = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_sharedLibraryPersonIdentifiers, 0);
  objc_storeStrong((id *)&self->_suggestableScenesHelper, 0);
}

+ (id)suggesterWithSession:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSession:", v4);

  return v5;
}

+ (NSIndexSet)suggestionTypes
{
  return (NSIndexSet *)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
}

+ (NSIndexSet)suggestionSubtypes
{
  return (NSIndexSet *)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
}

+ (id)noVideoPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("playbackStyle != %d && playbackStyle != %d"), 4, 5);
}

+ (id)internalPredicateForProcessedAssetsWithMinimumSceneAnalysisVersion:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("faceAdjustmentVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v6 = (void *)MEMORY[0x1E0D71880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateToIncludeOnlyAllowedForAnalysisAndProcessedAssetsToSceneVersion:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_sharedLibraryPersonIdentifiersInLibrary:(id)a3 withScope:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id obj;
  uint64_t v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v38 = v5;
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v6;
  objc_msgSend(MEMORY[0x1E0CD1600], "fetchLibraryScopeRulesForLibraryScope:options:", v6);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v52;
    v39 = *(_QWORD *)v52;
    do
    {
      v11 = 0;
      v41 = v9;
      do
      {
        if (*(_QWORD *)v52 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(v12, "personCondition");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14 && objc_msgSend(v14, "criteria") == 1)
        {
          objc_msgSend(v15, "personUUIDs");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v48;
            do
            {
              v20 = 0;
              do
              {
                if (*(_QWORD *)v48 != v19)
                  objc_enumerationMutation(v16);
                objc_msgSend(MEMORY[0x1E0CD16C0], "localIdentifierWithUUID:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v20));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "addObject:", v21);

                ++v20;
              }
              while (v18 != v20);
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
            }
            while (v18);
          }

          v10 = v39;
          v9 = v41;
        }

        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v9);
  }

  v42 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0CD17A8], "fetchParticipantsInShare:options:", v37, v36);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "librarySpecificFetchOptions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFetchLimit:", 1);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v24 = v22;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v44;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v44 != v27)
          objc_enumerationMutation(v24);
        v29 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v28);
        v30 = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonForShareParticipant:options:", v29, v23);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "firstObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          objc_msgSend(v32, "localIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "addObject:", v33);

        }
        objc_autoreleasePoolPop(v30);
        ++v28;
      }
      while (v26 != v28);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    }
    while (v26);
  }

  objc_msgSend(v42, "setByAddingObjectsFromSet:", v7);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

+ (id)suggestedPersonLocalIdentifiersFromSharingSuggestionResults:(id)a3 forMomentNodes:(id)a4 containsUnverifiedPersons:(BOOL *)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  id v28;
  BOOL *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v28 = v8;
    v29 = a5;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v35 != v13)
            objc_enumerationMutation(v9);
          v12 += objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "numberOfAssetsWithPersons", v28, v29);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v16 = v7;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v31 != v20)
            objc_enumerationMutation(v16);
          v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
          objc_msgSend(v22, "person", v28, v29, (_QWORD)v30);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v23, "isVerified")
            && (objc_msgSend(v22, "sourceWeight"), v24 >= 1.0)
            && (v12 < 0xA || (objc_msgSend(v22, "weight"), v25 > 1.0)))
          {
            objc_msgSend(v23, "localIdentifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v26);

          }
          else
          {
            v19 = 1;
          }

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v18);
    }
    else
    {
      v19 = 0;
    }

    v8 = v28;
    *v29 = v19 & 1;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v15;
}

@end
