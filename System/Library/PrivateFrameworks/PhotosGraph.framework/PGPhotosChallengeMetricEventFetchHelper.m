@implementation PGPhotosChallengeMetricEventFetchHelper

- (PGPhotosChallengeMetricEventFetchHelper)initWithGraphManager:(id)a3
{
  id v5;
  PGPhotosChallengeMetricEventFetchHelper *v6;
  PGPhotosChallengeMetricEventFetchHelper *v7;
  uint64_t v8;
  PHPhotoLibrary *photoLibrary;
  void *v10;
  PGSuggestionSession *v11;
  PGSuggestionSession *featuredPhotosSuggestionSession;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PGPhotosChallengeMetricEventFetchHelper;
  v6 = -[PGPhotosChallengeMetricEventFetchHelper init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_manager, a3);
    objc_msgSend(v5, "photoLibrary");
    v8 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v7->_photoLibrary;
    v7->_photoLibrary = (PHPhotoLibrary *)v8;

    objc_msgSend(v5, "workingContextForSuggestions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PGSuggestionSession initWithProfile:workingContext:]([PGSuggestionSession alloc], "initWithProfile:workingContext:", 5, v10);
    featuredPhotosSuggestionSession = v7->_featuredPhotosSuggestionSession;
    v7->_featuredPhotosSuggestionSession = v11;

  }
  return v7;
}

- (id)initForTestingWithQuestions:(id)a3 assetsByAssetId:(id)a4 momentUUIDByAssetIdentifier:(id)a5 activePersonUUIDByPersonUUID:(id)a6 tripKeyAssetIdentifiers:(id)a7 momentUUIDsForExhaustiveMomentLabeling:(id)a8 dayHighlightAssetIdentifiers:(id)a9
{
  id v15;
  id v16;
  id v17;
  PGPhotosChallengeMetricEventFetchHelper *v18;
  id *p_isa;
  id v21;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v24 = a3;
  v23 = a4;
  v22 = a5;
  v21 = a6;
  v15 = a7;
  v16 = a8;
  v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)PGPhotosChallengeMetricEventFetchHelper;
  v18 = -[PGPhotosChallengeMetricEventFetchHelper init](&v25, sel_init);
  p_isa = (id *)&v18->super.isa;
  if (v18)
  {
    -[PGPhotosChallengeMetricEventFetchHelper _buildQuestionsByQuestionTypeByEntityTypeFromQuestions:](v18, "_buildQuestionsByQuestionTypeByEntityTypeFromQuestions:", v24, v21, v22, v23);
    objc_storeStrong(p_isa + 5, a4);
    objc_storeStrong(p_isa + 8, a5);
    objc_storeStrong(p_isa + 9, a6);
    objc_storeStrong(p_isa + 11, a7);
    objc_storeStrong(p_isa + 6, a8);
    objc_storeStrong(p_isa + 12, a9);
  }

  return p_isa;
}

- (BOOL)suggestsToStartSharedLibraryWithError:(id *)a3
{
  return -[PGManager suggestsToStartSharedLibraryWithError:](self->_manager, "suggestsToStartSharedLibraryWithError:", a3);
}

- (id)questionsForQuestionMetricType:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;

  v3 = a3;
  +[PGPhotosChallengeMetricEvent questionEntityTypesFromQuestionMetricType:](PGPhotosChallengeMetricEvent, "questionEntityTypesFromQuestionMetricType:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPhotosChallengeMetricEventFetchHelper questionsForQuestionType:questionEntityTypes:](self, "questionsForQuestionType:questionEntityTypes:", +[PGPhotosChallengeMetricEvent questionTypeFromQuestionMetricType:](PGPhotosChallengeMetricEvent, "questionTypeFromQuestionMetricType:", v3), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)questionsForQuestionType:(unsigned __int16)a3 questionEntityTypes:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v21;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v4 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C9AA60];
  if ((_DWORD)v4)
  {
    v8 = v4;
    if (!self->_questionsByQuestionTypeByEntityType)
      -[PGPhotosChallengeMetricEventFetchHelper _prefetchQuestions](self, "_prefetchQuestions");
    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v21 = v6;
    obj = v6;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(obj);
          -[NSDictionary objectForKeyedSubscript:](self->_questionsByQuestionTypeByEntityType, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v8);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v14);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v15;
          if (v15)
            v17 = (void *)v15;
          else
            v17 = v7;
          v18 = v7;
          v19 = v17;

          objc_msgSend(v23, "addObjectsFromArray:", v19);
          v7 = v18;
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v10);
    }

    v6 = v21;
  }
  else
  {
    v23 = (id)MEMORY[0x1E0C9AA60];
  }

  return v23;
}

- (void)_prefetchQuestions
{
  void *v3;
  uint64_t v4;
  id v5;

  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1720], "fetchAnsweredYesOrNoQuestionsWithOptions:validQuestionsOnly:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PGPhotosChallengeMetricEventFetchHelper _migrationStepNeededForTripTitlingQuestions:](self, "_migrationStepNeededForTripTitlingQuestions:", v3))
  {
    objc_msgSend(MEMORY[0x1E0CD1720], "fetchAnsweredYesOrNoQuestionsWithOptions:validQuestionsOnly:", v5, 1);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  -[PGPhotosChallengeMetricEventFetchHelper _buildQuestionsByQuestionTypeByEntityTypeFromQuestions:](self, "_buildQuestionsByQuestionTypeByEntityTypeFromQuestions:", v3);

}

- (BOOL)_migrationStepNeededForTripTitlingQuestions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  PHPhotoLibrary *photoLibrary;
  _BOOL4 v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint8_t v20[16];
  id v21;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    v10 = *MEMORY[0x1E0D78158];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v12, "type") == 26 && v10 > (int)objc_msgSend(v12, "questionVersion"))
          objc_msgSend(v5, "addObject:", v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }

  v13 = objc_msgSend(v5, "count");
  if (v13)
  {
    photoLibrary = self->_photoLibrary;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __87__PGPhotosChallengeMetricEventFetchHelper__migrationStepNeededForTripTitlingQuestions___block_invoke;
    v22[3] = &unk_1E8435668;
    v23 = v5;
    v21 = 0;
    v15 = -[PHPhotoLibrary performChangesAndWait:error:](photoLibrary, "performChangesAndWait:error:", v22, &v21);
    v16 = v21;
    if (v15)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "loggingConnection");
      v18 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1CA237000, v18, OS_LOG_TYPE_INFO, "[Questions] Succeeded performing changes on Trip Titling Questions with duplicate titles", v20, 2u);
      }

    }
  }

  return v13 != 0;
}

- (void)_buildQuestionsByQuestionTypeByEntityTypeFromQuestions:(id)a3
{
  id v3;
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSDictionary *questionsByQuestionTypeByEntityType;
  PGPhotosChallengeMetricEventFetchHelper *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v19 = self;
  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "entityType", v19);
        v11 = objc_msgSend(v9, "type");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v13, v14);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, v17);

        }
        objc_msgSend(v16, "addObject:", v9);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

  questionsByQuestionTypeByEntityType = v19->_questionsByQuestionTypeByEntityType;
  v19->_questionsByQuestionTypeByEntityType = v4;

}

- (NSSet)momentUUIDsForExhaustiveMomentLabelingQuestion
{
  NSSet *momentUUIDsForExhaustiveMomentLabelingQuestion;

  momentUUIDsForExhaustiveMomentLabelingQuestion = self->_momentUUIDsForExhaustiveMomentLabelingQuestion;
  if (!momentUUIDsForExhaustiveMomentLabelingQuestion)
  {
    -[PGPhotosChallengeMetricEventFetchHelper _prefetchMomentUUIDsForExhaustiveMomentLabelingQuestion](self, "_prefetchMomentUUIDsForExhaustiveMomentLabelingQuestion");
    momentUUIDsForExhaustiveMomentLabelingQuestion = self->_momentUUIDsForExhaustiveMomentLabelingQuestion;
  }
  return momentUUIDsForExhaustiveMomentLabelingQuestion;
}

- (void)_prefetchMomentUUIDsForExhaustiveMomentLabelingQuestion
{
  NSSet *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSSet *momentUUIDsForExhaustiveMomentLabelingQuestion;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!self->_momentUUIDsForExhaustiveMomentLabelingQuestion)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](self->_questionsByQuestionTypeByEntityType, "objectForKeyedSubscript:", &unk_1E84E3CC8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E84E3CE0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "entityIdentifier", (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSSet addObject:](v3, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    momentUUIDsForExhaustiveMomentLabelingQuestion = self->_momentUUIDsForExhaustiveMomentLabelingQuestion;
    self->_momentUUIDsForExhaustiveMomentLabelingQuestion = v3;

  }
}

- (NSDictionary)assetByAssetIdentifier
{
  NSDictionary *assetByAssetIdentifier;

  assetByAssetIdentifier = self->_assetByAssetIdentifier;
  if (!assetByAssetIdentifier)
  {
    -[PGPhotosChallengeMetricEventFetchHelper _prefetchAssetByAssetIdentifier](self, "_prefetchAssetByAssetIdentifier");
    assetByAssetIdentifier = self->_assetByAssetIdentifier;
  }
  return assetByAssetIdentifier;
}

- (void)_prefetchAssetByAssetIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSDictionary *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  NSDictionary *assetByAssetIdentifier;
  PGPhotosChallengeMetricEventFetchHelper *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (!self->_assetByAssetIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v34 = self;
    -[NSDictionary objectForKeyedSubscript:](self->_questionsByQuestionTypeByEntityType, "objectForKeyedSubscript:", &unk_1E84E3CF8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v44 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v40;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v40 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
                if (!objc_msgSend(v16, "entityType") && objc_msgSend(v16, "type") != 18)
                {
                  objc_msgSend(v16, "entityIdentifier");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v3, "addObject:", v17);

                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
            }
            while (v13);
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v7);
    }

    -[PHPhotoLibrary librarySpecificFetchOptions](v34->_photoLibrary, "librarySpecificFetchOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0C99DE8];
    +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "arrayWithArray:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "addObject:", *MEMORY[0x1E0CD19B0]);
    objc_msgSend(v18, "setFetchPropertySets:", v21);
    v22 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(v3, "allObjects");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "fetchAssetsWithLocalIdentifiers:options:", v23, v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v25 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v26 = v24;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v36;
      do
      {
        for (k = 0; k != v28; ++k)
        {
          if (*(_QWORD *)v36 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * k);
          objc_msgSend(v31, "uuid");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v31, v32);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      }
      while (v28);
    }

    assetByAssetIdentifier = v34->_assetByAssetIdentifier;
    v34->_assetByAssetIdentifier = v25;

  }
}

- (NSDictionary)assetByAssetSyndicationIdentifier
{
  NSDictionary *assetByAssetSyndicationIdentifier;

  assetByAssetSyndicationIdentifier = self->_assetByAssetSyndicationIdentifier;
  if (!assetByAssetSyndicationIdentifier)
  {
    -[PGPhotosChallengeMetricEventFetchHelper _prefetchAssetByAssetSyndicationIdentifier](self, "_prefetchAssetByAssetSyndicationIdentifier");
    assetByAssetSyndicationIdentifier = self->_assetByAssetSyndicationIdentifier;
  }
  return assetByAssetSyndicationIdentifier;
}

- (void)_prefetchAssetByAssetSyndicationIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSDictionary *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  void *v35;
  NSDictionary *assetByAssetSyndicationIdentifier;
  void *v37;
  NSObject *v38;
  id v39;
  void *v40;
  PGPhotosChallengeMetricEventFetchHelper *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _QWORD v56[3];
  uint8_t buf[4];
  void *v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (!self->_assetByAssetSyndicationIdentifier)
  {
    if (!self->_questionsByQuestionTypeByEntityType)
      -[PGPhotosChallengeMetricEventFetchHelper _prefetchQuestions](self, "_prefetchQuestions");
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v41 = self;
    -[NSDictionary objectForKeyedSubscript:](self->_questionsByQuestionTypeByEntityType, "objectForKeyedSubscript:", &unk_1E84E3CF8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v52 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v48;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v48 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
                if (!objc_msgSend(v16, "entityType") && objc_msgSend(v16, "type") == 18)
                {
                  objc_msgSend(v16, "entityIdentifier");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v3, "addObject:", v17);

                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
            }
            while (v13);
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      }
      while (v7);
    }

    v46 = 0;
    objc_msgSend(MEMORY[0x1E0CD16F8], "openPhotoLibraryWithWellKnownIdentifier:error:", 3, &v46);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v46;
    v20 = v19;
    if (v18)
    {
      v39 = v19;
      v40 = v18;
      objc_msgSend(v18, "librarySpecificFetchOptions");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *MEMORY[0x1E0CD19F0];
      v56[0] = *MEMORY[0x1E0CD1A50];
      v56[1] = v22;
      v56[2] = *MEMORY[0x1E0CD1978];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFetchPropertySets:", v23);

      objc_msgSend(v21, "setIncludeGuestAssets:", 1);
      v24 = (void *)MEMORY[0x1E0CD1390];
      objc_msgSend(v3, "allObjects");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "fetchAssetsWithSyndicationIdentifiers:options:", v25, v21);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v27 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v28 = v26;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v43;
        do
        {
          for (k = 0; k != v30; ++k)
          {
            if (*(_QWORD *)v43 != v31)
              objc_enumerationMutation(v28);
            v33 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * k);
            objc_msgSend(v33, "curationProperties");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "syndicationIdentifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v33, v35);

          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
        }
        while (v30);
      }

      assetByAssetSyndicationIdentifier = v41->_assetByAssetSyndicationIdentifier;
      v41->_assetByAssetSyndicationIdentifier = v27;

      v20 = v39;
      v18 = v40;
    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "loggingConnection");
      v38 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v20;
        _os_log_error_impl(&dword_1CA237000, v38, OS_LOG_TYPE_ERROR, "PGPhotosChallengeMetricEventFetchHelper: Failed to open syndicated library: %@", buf, 0xCu);
      }

      v21 = v41->_assetByAssetSyndicationIdentifier;
      v41->_assetByAssetSyndicationIdentifier = (NSDictionary *)MEMORY[0x1E0C9AA70];
    }

  }
}

- (NSDictionary)momentUUIDByAssetIdentifier
{
  NSDictionary *momentUUIDByAssetIdentifier;

  momentUUIDByAssetIdentifier = self->_momentUUIDByAssetIdentifier;
  if (!momentUUIDByAssetIdentifier)
  {
    -[PGPhotosChallengeMetricEventFetchHelper _prefetchMomentUUIDByAssetIdentifier](self, "_prefetchMomentUUIDByAssetIdentifier");
    momentUUIDByAssetIdentifier = self->_momentUUIDByAssetIdentifier;
  }
  return momentUUIDByAssetIdentifier;
}

- (void)_prefetchMomentUUIDByAssetIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  NSDictionary *v6;
  NSDictionary *momentUUIDByAssetIdentifier;
  id v8;

  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CD1670];
  -[PGPhotosChallengeMetricEventFetchHelper assetByAssetIdentifier](self, "assetByAssetIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchMomentUUIDByAssetUUIDForAssets:options:", v5, v8);
  v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  momentUUIDByAssetIdentifier = self->_momentUUIDByAssetIdentifier;
  self->_momentUUIDByAssetIdentifier = v6;

}

- (NSDictionary)activePersonUUIDByPersonUUID
{
  NSDictionary *activePersonUUIDByPersonUUID;

  activePersonUUIDByPersonUUID = self->_activePersonUUIDByPersonUUID;
  if (!activePersonUUIDByPersonUUID)
  {
    -[PGPhotosChallengeMetricEventFetchHelper _prefetchActivePersonUUIDByPersonUUID](self, "_prefetchActivePersonUUIDByPersonUUID");
    activePersonUUIDByPersonUUID = self->_activePersonUUIDByPersonUUID;
  }
  return activePersonUUIDByPersonUUID;
}

- (void)_prefetchActivePersonUUIDByPersonUUID
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSDictionary *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  NSDictionary *activePersonUUIDByPersonUUID;
  void *v35;
  PGPhotosChallengeMetricEventFetchHelper *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  void *v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v36 = self;
  -[NSDictionary objectForKeyedSubscript:](self->_questionsByQuestionTypeByEntityType, "objectForKeyedSubscript:", &unk_1E84E3D10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v47 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v43;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v43 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "entityIdentifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObject:", v16);

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
          }
          while (v13);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v7);
  }

  -[PHPhotoLibrary librarySpecificFetchOptions](v36->_photoLibrary, "librarySpecificFetchOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPersonContext:", 5);
  v18 = (void *)MEMORY[0x1E0CD16C0];
  objc_msgSend(v3, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v17;
  objc_msgSend(v18, "fetchPersonsWithLocalIdentifiers:options:", v19, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHPhotoLibrary librarySpecificFetchOptions](v36->_photoLibrary, "librarySpecificFetchOptions");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v22 = v20;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v39;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v39 != v25)
          objc_enumerationMutation(v22);
        v27 = *(id *)(*((_QWORD *)&v38 + 1) + 8 * v26);
        objc_msgSend(v27, "uuid");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v27, "verifiedType") == -2
          && (objc_msgSend(MEMORY[0x1E0CD16C0], "fetchFinalMergeTargetPersonsForPersonWithUUID:options:", v28, v37),
              v29 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v29, "firstObject"),
              v30 = objc_claimAutoreleasedReturnValue(),
              v27,
              v29,
              (v27 = (id)v30) == 0))
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "loggingConnection");
          v31 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v51 = v28;
            _os_log_error_impl(&dword_1CA237000, v31, OS_LOG_TYPE_ERROR, "Failed to find final merge target person for person with UUID: '%@'", buf, 0xCu);
          }
          v27 = 0;
        }
        else
        {
          objc_msgSend(v27, "uuid");
          v31 = objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v31, v28);
        }

        ++v26;
      }
      while (v24 != v26);
      v33 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
      v24 = v33;
    }
    while (v33);
  }

  activePersonUUIDByPersonUUID = v36->_activePersonUUIDByPersonUUID;
  v36->_activePersonUUIDByPersonUUID = v21;

}

- (NSDictionary)memoryByMemoryIdentifier
{
  NSDictionary *memoryByMemoryIdentifier;

  memoryByMemoryIdentifier = self->_memoryByMemoryIdentifier;
  if (!memoryByMemoryIdentifier)
  {
    -[PGPhotosChallengeMetricEventFetchHelper _prefetchMemoryByMemoryIdentifier](self, "_prefetchMemoryByMemoryIdentifier");
    memoryByMemoryIdentifier = self->_memoryByMemoryIdentifier;
  }
  return memoryByMemoryIdentifier;
}

- (void)_prefetchMemoryByMemoryIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSDictionary *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  NSDictionary *memoryByMemoryIdentifier;
  PGPhotosChallengeMetricEventFetchHelper *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!self->_memoryByMemoryIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v29 = self;
    -[NSDictionary objectForKeyedSubscript:](self->_questionsByQuestionTypeByEntityType, "objectForKeyedSubscript:", &unk_1E84E3D28);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v39 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v35;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v35 != v14)
                  objc_enumerationMutation(v11);
                objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "entityIdentifier");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "addObject:", v16);

              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
            }
            while (v13);
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v7);
    }

    -[PHPhotoLibrary librarySpecificFetchOptions](v29->_photoLibrary, "librarySpecificFetchOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN (%@)"), v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPredicate:", v18);

    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v21 = v19;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v31;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v31 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * k);
          objc_msgSend(v26, "uuid");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v26, v27);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      }
      while (v23);
    }

    memoryByMemoryIdentifier = v29->_memoryByMemoryIdentifier;
    v29->_memoryByMemoryIdentifier = v20;

  }
}

- (NSSet)tripKeyAssetIdentifiers
{
  NSSet *tripKeyAssetIdentifiers;

  tripKeyAssetIdentifiers = self->_tripKeyAssetIdentifiers;
  if (!tripKeyAssetIdentifiers)
  {
    -[PGPhotosChallengeMetricEventFetchHelper _prefetchTripKeyAssetIdentifiers](self, "_prefetchTripKeyAssetIdentifiers");
    tripKeyAssetIdentifiers = self->_tripKeyAssetIdentifiers;
  }
  return tripKeyAssetIdentifiers;
}

- (void)_prefetchTripKeyAssetIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSSet *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSSet *tripKeyAssetIdentifiers;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (!self->_tripKeyAssetIdentifiers)
  {
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = *MEMORY[0x1E0CD19C0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFetchPropertySets:", v4);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dayGroupHighlightBeingKeyAssetPrivate.type = %d || dayGroupHighlightBeingKeyAssetPrivate.type = %d"), 1, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInternalPredicate:", v5);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v6;
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
          -[NSSet addObject:](v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    tripKeyAssetIdentifiers = self->_tripKeyAssetIdentifiers;
    self->_tripKeyAssetIdentifiers = v7;

  }
}

- (NSSet)dayHighlightAssetIdentifiers
{
  NSSet *dayHighlightAssetIdentifiers;

  dayHighlightAssetIdentifiers = self->_dayHighlightAssetIdentifiers;
  if (!dayHighlightAssetIdentifiers)
  {
    -[PGPhotosChallengeMetricEventFetchHelper _prefetchDayHighlightAssetIdentifiers](self, "_prefetchDayHighlightAssetIdentifiers");
    dayHighlightAssetIdentifiers = self->_dayHighlightAssetIdentifiers;
  }
  return dayHighlightAssetIdentifiers;
}

- (void)_prefetchDayHighlightAssetIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSSet *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSSet *dayHighlightAssetIdentifiers;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (!self->_dayHighlightAssetIdentifiers)
  {
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = *MEMORY[0x1E0CD19C0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFetchPropertySets:", v4);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("highlightBeingKeyAssetPrivate.kind = %d || highlightBeingKeyAssetShared.kind = %d"), 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInternalPredicate:", v5);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v6;
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
          -[NSSet addObject:](v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    dayHighlightAssetIdentifiers = self->_dayHighlightAssetIdentifiers;
    self->_dayHighlightAssetIdentifiers = v7;

  }
}

- (NSDictionary)questionsByQuestionTypeByEntityType
{
  return self->_questionsByQuestionTypeByEntityType;
}

- (void)setQuestionsByQuestionTypeByEntityType:(id)a3
{
  objc_storeStrong((id *)&self->_questionsByQuestionTypeByEntityType, a3);
}

- (PGSuggestionSession)featuredPhotosSuggestionSession
{
  return self->_featuredPhotosSuggestionSession;
}

- (void)setFeaturedPhotosSuggestionSession:(id)a3
{
  objc_storeStrong((id *)&self->_featuredPhotosSuggestionSession, a3);
}

- (void)setAssetByAssetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assetByAssetIdentifier, a3);
}

- (void)setMomentUUIDsForExhaustiveMomentLabelingQuestion:(id)a3
{
  objc_storeStrong((id *)&self->_momentUUIDsForExhaustiveMomentLabelingQuestion, a3);
}

- (void)setAssetByAssetSyndicationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assetByAssetSyndicationIdentifier, a3);
}

- (void)setMomentUUIDByAssetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_momentUUIDByAssetIdentifier, a3);
}

- (void)setActivePersonUUIDByPersonUUID:(id)a3
{
  objc_storeStrong((id *)&self->_activePersonUUIDByPersonUUID, a3);
}

- (void)setMemoryByMemoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_memoryByMemoryIdentifier, a3);
}

- (void)setTripKeyAssetIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_tripKeyAssetIdentifiers, a3);
}

- (void)setDayHighlightAssetIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_dayHighlightAssetIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayHighlightAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_tripKeyAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_memoryByMemoryIdentifier, 0);
  objc_storeStrong((id *)&self->_activePersonUUIDByPersonUUID, 0);
  objc_storeStrong((id *)&self->_momentUUIDByAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_assetByAssetSyndicationIdentifier, 0);
  objc_storeStrong((id *)&self->_momentUUIDsForExhaustiveMomentLabelingQuestion, 0);
  objc_storeStrong((id *)&self->_assetByAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_featuredPhotosSuggestionSession, 0);
  objc_storeStrong((id *)&self->_questionsByQuestionTypeByEntityType, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __87__PGPhotosChallengeMetricEventFetchHelper__migrationStepNeededForTripTitlingQuestions___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = *(id *)(a1 + 32);
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v28;
    v1 = *MEMORY[0x1E0D78160];
    v26 = *MEMORY[0x1E0D78150];
    v20 = *MEMORY[0x1E0D77FD0];
    v2 = *MEMORY[0x1E0D78138];
    v3 = *MEMORY[0x1E0D77FC8];
    v21 = (__int16)*MEMORY[0x1E0D78158];
    v22 = *MEMORY[0x1E0D78160];
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v25, "additionalInfo");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)MEMORY[0x1E0D77EC8];
        objc_msgSend(v5, "objectForKeyedSubscript:", v1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "titleWithoutFormattingForTitle:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = (void *)MEMORY[0x1E0D77EC8];
        objc_msgSend(v5, "objectForKeyedSubscript:", v26);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "titleWithoutFormattingForTitle:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v13 = objc_msgSend(v8, "isEqualToString:", v11);
        if ((v13 & 1) == 0)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v20);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", v20);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, v20);

          }
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, v2);

        v1 = v22;
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, v22);
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v26);
        objc_msgSend(v5, "objectForKeyedSubscript:", v3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, v3);

        objc_msgSend(MEMORY[0x1E0CD1728], "changeRequestForQuestion:", v25);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setAdditionalInfo:", v12);
        objc_msgSend(v18, "setQuestionVersion:", v21);

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v24);
  }

}

@end
