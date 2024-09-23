@implementation _PSFamilyPhotoSuggestions

+ (id)photosContactsKnowledgeSuggestions
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void **v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  void *v32;
  id v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "fetchVerifiedPersonsForFamilyPhotoSuggestionsModel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    +[_PSFamilyPhotoSuggestions photosContactsKnowledgeSuggestions].cold.5(v2, v3, v4, v5, v6, v7, v8, v9);

  v10 = (void *)objc_opt_new();
  v41 = 0;
  v42 = &v41;
  v43 = 0x2050000000;
  v11 = (void *)getGDViewServiceClass_softClass;
  v44 = getGDViewServiceClass_softClass;
  if (!getGDViewServiceClass_softClass)
  {
    v46 = MEMORY[0x1E0C809B0];
    v47 = 3221225472;
    v48 = (uint64_t)__getGDViewServiceClass_block_invoke;
    v49 = &unk_1E43FEA00;
    v50 = &v41;
    __getGDViewServiceClass_block_invoke((uint64_t)&v46);
    v11 = (void *)v42[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v41, 8);
  objc_msgSend(v12, "clientService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v47 = (uint64_t)&v46;
  v48 = 0x2020000000;
  v14 = (void **)getGDAutonamingViewPhotosAutonamingViewNameSymbolLoc_ptr;
  v49 = (void *)getGDAutonamingViewPhotosAutonamingViewNameSymbolLoc_ptr;
  if (!getGDAutonamingViewPhotosAutonamingViewNameSymbolLoc_ptr)
  {
    v15 = (void *)IntelligencePlatformLibrary();
    v14 = (void **)dlsym(v15, "GDAutonamingViewPhotosAutonamingViewName");
    *(_QWORD *)(v47 + 24) = v14;
    getGDAutonamingViewPhotosAutonamingViewNameSymbolLoc_ptr = (uint64_t)v14;
  }
  _Block_object_dispose(&v46, 8);
  if (!v14)
  {
    -[_PSBlockedHandlesCache beginSyncingWithTU].cold.1();
    __break(1u);
  }
  v16 = *v14;
  v40 = 0;
  v17 = v16;
  objc_msgSend(v13, "autonamingViewWithViewName:error:", v17, &v40);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v40;

  if (v18)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v19 = v35;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v37 != v21)
            objc_enumerationMutation(v19);
          v23 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v23, "localIdentifier", v34);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "personForIdentifier:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v25
            || (objc_msgSend(v25, "contactIdentifier"),
                v26 = (void *)objc_claimAutoreleasedReturnValue(),
                v27 = v26 == 0,
                v26,
                v27))
          {
            +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              +[_PSFamilyPhotoSuggestions photosContactsKnowledgeSuggestions].cold.4((uint8_t *)&v46, v23, (uint64_t *)((char *)&v46 + 4), v28);
          }
          else
          {
            objc_msgSend(v25, "contactIdentifier");
            v28 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v28);
          }

        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      }
      while (v20);
    }

    +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      +[_PSFamilyPhotoSuggestions photosContactsKnowledgeSuggestions].cold.3(v10);

    v30 = v10;
  }
  else
  {
    if (v34)
    {
      +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        +[_PSFamilyPhotoSuggestions photosContactsKnowledgeSuggestions].cold.2();

    }
    v30 = (id)objc_opt_new();
  }
  v32 = v30;

  return v32;
}

+ (id)photosRelationshipKnowledgeSuggestions
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "fetchVerifiedPersonsForFamilyPhotoSuggestionsModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[_PSFamilyPhotoSuggestions photosRelationshipKnowledgeSuggestions].cold.3(v4, v5, v6, v7, v8, v9, v10, v11);

  objc_msgSend(getPHPersonClass(), "batchFetchRelationshipInferencesForPersons:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __67___PSFamilyPhotoSuggestions_photosRelationshipKnowledgeSuggestions__block_invoke;
  v29[3] = &unk_1E4401958;
  v31 = a1;
  v14 = v13;
  v30 = v14;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v29);
  +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    +[_PSFamilyPhotoSuggestions photosRelationshipKnowledgeSuggestions].cold.2(v14);

  v16 = (void *)objc_opt_new();
  objc_msgSend(getPHPersonClass(), "fetchPersonsWithLocalIdentifiers:options:", v14, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v26;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v21), "personUri");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
          objc_msgSend(v16, "addObject:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    }
    while (v19);
  }
  +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    +[_PSFamilyPhotoSuggestions photosRelationshipKnowledgeSuggestions].cold.1(v16);

  return v16;
}

+ (id)fetchVerifiedPersonsForFamilyPhotoSuggestionsModel
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v2 = (void *)getPHPhotoLibraryClass_softClass_0;
  v14 = getPHPhotoLibraryClass_softClass_0;
  if (!getPHPhotoLibraryClass_softClass_0)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getPHPhotoLibraryClass_block_invoke_0;
    v10[3] = &unk_1E43FEA00;
    v10[4] = &v11;
    __getPHPhotoLibraryClass_block_invoke_0((uint64_t)v10);
    v2 = (void *)v12[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v11, 8);
  objc_msgSend(v3, "sharedPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("verifiedType = %@ OR verifiedType = %@"), &unk_1E442B510, &unk_1E442B528);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setPredicate:](v6, "setPredicate:", v7);

    -[NSObject setShouldPrefetchCount:](v6, "setShouldPrefetchCount:", 1);
    -[NSObject setFetchLimit:](v6, "setFetchLimit:", 100);
    objc_msgSend(getPHPersonClass(), "fetchPersonsWithOptions:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      +[_PSFamilyPhotoSuggestions fetchVerifiedPersonsForFamilyPhotoSuggestionsModel].cold.1(v6);
    v8 = 0;
  }

  return v8;
}

+ (BOOL)_allowRelationship:(int64_t)a3
{
  return ((unint64_t)a3 > 0xD) | (0x7FEu >> a3) & 1;
}

+ (void)photosContactsKnowledgeSuggestions
{
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, a1, a3, "Fetching contacts inferences from Megadome", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

+ (void)photosRelationshipKnowledgeSuggestions
{
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, a1, a3, "Fetching family inferences from Photos", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

+ (void)fetchVerifiedPersonsForFamilyPhotoSuggestionsModel
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A07F4000, log, OS_LOG_TYPE_FAULT, "Photo library is nil. Will fail to suggest family suggestions from Photos framework", v1, 2u);
  OUTLINED_FUNCTION_9();
}

@end
