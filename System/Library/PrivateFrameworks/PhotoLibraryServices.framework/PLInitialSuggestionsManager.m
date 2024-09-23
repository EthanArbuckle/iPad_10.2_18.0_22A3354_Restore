@implementation PLInitialSuggestionsManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PLInitialSuggestionsManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (id)sharedManager_sharedInstance;
}

+ (void)generateInitialSuggestionsForPhotoLibrary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  int v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0C99DC8];
  v5 = a3;
  objc_msgSend(v4, "currentLocale");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(&unk_1E3763DA0, "containsObject:", v6);

  objc_msgSend(a1, "generateInitialSuggestionsForPhotoLibrary:styleType:", v5, v7 ^ 1u);
}

+ (void)generateInitialSuggestionsForPhotoLibrary:(id)a3 styleType:(unint64_t)a4
{
  id v6;
  void *v7;
  PSIDatabase *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PSIDatabase initWithPathManager:options:]([PSIDatabase alloc], "initWithPathManager:options:", v7, 1);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = -[PSIDatabase countOfAssets](v8, "countOfAssets");
    v11 = objc_msgSend(a1, "recentAssetLimitForInitialSuggestionGenerationForIndexedAssetCount:", v10);
    v12 = objc_msgSend(a1, "scaledMinimumNumberOfResultsPerSuggestion:", v10);
    PLSearchBackendInitialSuggestionsGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v20 = v12;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Fetching initial suggestions with a required minimum of %tu results per suggestion.", buf, 0xCu);
    }

    +[PLInitialSuggestionsManager sharedManager](PLInitialSuggestionsManager, "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v18) = 1;
    objc_msgSend(v14, "_generateSuggestionsOnDemandWithLimitOfMostRecentAssets:suggestionLimit:minimumNumberOfResultsPerSuggestion:photoLibrary:psiDatabase:minResultCountPerSuggestion:locale:shouldGenerateAllSuggestions:suggestionStyleType:", v11, -1, v12, v6, v8, v12, v9, v18, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PLSearchBackendInitialSuggestionsGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v15, "count");
      *(_DWORD *)buf = 134218242;
      v20 = v17;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "Generated %tu initial suggestions for photolibrary %@.", buf, 0x16u);
    }

  }
  else
  {
    PLSearchBackendInitialSuggestionsGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Unexpected nil psiDatabase. No initial suggestions will be generated.", buf, 2u);
    }
  }

}

+ (unint64_t)recentAssetLimitForInitialSuggestionGenerationForIndexedAssetCount:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t result;
  unint64_t v7;
  NSObject *v8;
  uint8_t v9[16];
  uint64_t v10;
  uint64_t v11;

  if (a3)
  {
    v5 = vcvtmd_u64_f64((double)a3 * 0.25);
    result = 7500;
    if (v5 <= 0x1D4C)
    {
      v7 = 2500;
      if (a3 < 0x9C4)
        v7 = a3;
      if (v5 >= 0x9C4)
        return v5;
      else
        return v7;
    }
  }
  else
  {
    v10 = v3;
    v11 = v4;
    PLSearchBackendInitialSuggestionsGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Obtained count of 0 assets available for search, no initial suggestions will be generated", v9, 2u);
    }

    return 0;
  }
  return result;
}

+ (id)_templateCandidatesFromRankedGroups:(id)a3 assetIdsByDateFilter:(id)a4 scopedAssetIds:(__CFArray *)a5 templateProvider:(id)a6 mePersonExists:(BOOL)a7 shouldGenerateAllSuggestions:(BOOL)a8 minResultCountPerSuggestion:(unint64_t)a9 suggestionStyleType:(unint64_t)a10
{
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  CFIndex Count;
  unint64_t i;
  unint64_t j;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  os_signpost_id_t v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  void *v48;
  uint64_t v50;
  NSObject *v51;
  os_signpost_id_t spid;
  void *v54;
  void *v55;
  id v56;
  void *v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[8];
  _BYTE v66[128];
  _QWORD v67[3];

  v67[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v59 = a4;
  v60 = a6;
  v55 = v14;
  if (objc_msgSend(v14, "count"))
  {
    v54 = (void *)objc_msgSend(v14, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("rankingScore"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v54, "sortedArrayUsingDescriptors:", v16);

    if ((unint64_t)objc_msgSend(v14, "count") <= 0x1F3)
    {
      v18 = v54;
    }
    else
    {
      objc_msgSend(v54, "subarrayWithRange:", 0, 500);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v20 = v18;
    if (a8)
      objc_msgSend(v60, "allTemplates");
    else
      objc_msgSend(v60, "limitedTemplates");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v58, "count"))
    {
      v56 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      if (a10)
      {
        objc_msgSend(v60, "locale");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_singleEntitySearchCandidatesFromRankedGroups:minAssetResultCountPerSuggestion:locale:", v55, a9, v21);
        v22 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v56, "addObjectsFromArray:", v22);
      }
      else
      {
        PLPhotosSearchGetLog();
        v24 = (id)objc_claimAutoreleasedReturnValue();
        spid = os_signpost_id_generate(v24);

        v25 = v24;
        v26 = v25;
        if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_199541000, v26, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PLSearchBackendInitialSuggestionPopulateNonDateRankedTemplates", ", buf, 2u);
        }
        v51 = v26;

        if (a5)
          Count = CFArrayGetCount(a5);
        else
          Count = 0;
        for (i = 0; i < objc_msgSend(v20, "count") - 1; ++i)
        {
          for (j = i + 1; j < objc_msgSend(v20, "count"); ++j)
          {
            v30 = (void *)MEMORY[0x19AEC1554]();
            objc_msgSend(v20, "objectAtIndexedSubscript:", i);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectAtIndexedSubscript:", j);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v31, "isEqual:", v32) & 1) == 0)
            {
              LOBYTE(v50) = a7;
              objc_msgSend(a1, "_templateCandidatesForFirstRankedGroup:secondRankedGroup:allTemplates:assetIdsByDateFilter:scopedAssetIdsCount:templateProvider:mePersonExists:minResultCountPerSuggestion:", v31, v32, v58, v59, Count, v60, v50, a9);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "addObjectsFromArray:", v33);

            }
            objc_autoreleasePoolPop(v30);
          }
        }
        v34 = v51;
        v22 = v34;
        if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v34))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_199541000, v22, OS_SIGNPOST_INTERVAL_END, spid, "PLSearchBackendInitialSuggestionPopulateNonDateRankedTemplates", ", buf, 2u);
        }

        PLPhotosSearchGetLog();
        v35 = (id)objc_claimAutoreleasedReturnValue();
        v36 = os_signpost_id_generate(v35);

        v37 = v35;
        v38 = v37;
        if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_199541000, v38, OS_SIGNPOST_INTERVAL_BEGIN, v36, "PLSearchBackendInitialSuggestionPopulateDateOnlyRankedTemplates", ", buf, 2u);
        }

        objc_msgSend(v60, "dateOnlyTemplates");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_dateTemplateCandidatesFromTemplates:assetIdsByDateFilter:scopedAssetIds:minResultCountPerSuggestion:suggestionStyleType:", v39, v59, a5, a9, 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "addObjectsFromArray:", v40);
        v41 = v38;
        v42 = v41;
        if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_199541000, v42, OS_SIGNPOST_INTERVAL_END, v36, "PLSearchBackendInitialSuggestionPopulateDateOnlyRankedTemplates", ", buf, 2u);
        }

      }
      v43 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v23 = v56;
      v44 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
      if (v44)
      {
        v45 = *(_QWORD *)v62;
        do
        {
          for (k = 0; k != v44; ++k)
          {
            if (*(_QWORD *)v62 != v45)
              objc_enumerationMutation(v23);
            v47 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * k);
            if (objc_msgSend(v47, "intersectionCount") >= a9)
              objc_msgSend(v43, "addObject:", v47);
          }
          v44 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
        }
        while (v44);
      }

      objc_msgSend(v43, "allObjects");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v48, "copy");

    }
    else
    {
      PLSearchBackendInitialSuggestionsGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "Could not locate any templates for initial suggestions, no initial suggestions will be generated.", buf, 2u);
      }
      v19 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v19;
}

+ (id)_templateCandidatesForFirstRankedGroup:(id)a3 secondRankedGroup:(id)a4 allTemplates:(id)a5 assetIdsByDateFilter:(id)a6 scopedAssetIdsCount:(unint64_t)a7 templateProvider:(id)a8 mePersonExists:(BOOL)a9 minResultCountPerSuggestion:(unint64_t)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _BOOL4 v23;
  unint64_t v24;
  uint64_t i;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  CFArrayRef Copy;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *p_super;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  PLSearchSuggestionCandidate *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  void *v57;
  char v58;
  PLSearchSuggestionCandidate *v59;
  void *v60;
  id v61;
  id v62;
  PLSearchSuggestionCandidate *v63;
  void *v64;
  void *v65;
  char v66;
  void *v67;
  NSObject *v68;
  id v70;
  id v71;
  id v72;
  id v73;
  void *v74;
  NSObject *v75;
  uint64_t v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t buf[4];
  void *v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v73 = v16;
  if (a7)
  {
    v74 = v18;
    v70 = v19;
    v71 = v17;
    objc_msgSend(v19, "templatesForSearchIndexCategory:secondIndexCategory:limitedTemplates:", objc_msgSend(v15, "searchIndexingCategory"), objc_msgSend(v16, "searchIndexingCategory"), v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v21 = v20;
    v22 = v16;
    v23 = a9;
    v77 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
    if (!v77)
      goto LABEL_70;
    v76 = *(_QWORD *)v79;
    v24 = 0x1E0CB3000uLL;
    v75 = v21;
    while (1)
    {
      for (i = 0; i != v77; ++i)
      {
        if (*(_QWORD *)v79 != v76)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
        if (v23)
        {
          if (((objc_msgSend(v15, "isMePerson") & 1) != 0 || objc_msgSend(v22, "isMePerson"))
            && (objc_msgSend(v26, "isMeTemplate") & 1) == 0)
          {
            continue;
          }
        }
        else if ((objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * i), "isMeTemplate") & 1) != 0)
        {
          continue;
        }
        v27 = objc_msgSend(v26, "templateType");
        objc_msgSend(v26, "dateFilter");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          objc_msgSend(*(id *)(v24 + 2024), "numberWithUnsignedInteger:", objc_msgSend(v26, "templateDateType"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "objectForKeyedSubscript:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v30, "assetIds"))
          {
            objc_msgSend(*(id *)(v24 + 2024), "numberWithUnsignedInteger:", objc_msgSend(v26, "templateDateType"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "objectForKeyedSubscript:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            Copy = CFArrayCreateCopy(0, (CFArrayRef)objc_msgSend(v32, "assetIds"));

            v22 = v73;
          }
          else
          {
            Copy = 0;
          }

          v23 = a9;
          v21 = v75;
        }
        else
        {
          Copy = 0;
        }
        if ((~v27 & 3) != 0)
        {
          if ((v27 & 1) == 0)
          {
            PLSearchBackendInitialSuggestionsGetLog();
            p_super = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v83 = v26;
              _os_log_impl(&dword_199541000, p_super, OS_LOG_TYPE_ERROR, "Encountered invalid template during initial suggestion generation: %@.", buf, 0xCu);
            }
            goto LABEL_64;
          }
          v45 = objc_msgSend(v15, "searchIndexingCategory");
          if (v45 == objc_msgSend(v26, "firstIndexCategory"))
          {
            objc_msgSend(v26, "identifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            if (v46)
            {
              objc_msgSend(v15, "lookupIdentifier");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "identifier");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = objc_msgSend(v47, "isEqualToString:", v48);

              v22 = v73;
              if ((v49 & 1) == 0)
                goto LABEL_65;
            }
            else if (objc_msgSend(v26, "isMeTemplate") && (objc_msgSend(v15, "isMePerson") & 1) == 0)
            {
              goto LABEL_65;
            }
            v50 = -[PLSearchSuggestionCandidate initWithSearchSuggestionTemplate:firstGroup:secondGroup:assetIdsForDateFilter:minAssetResultCountPerSuggestion:styleType:]([PLSearchSuggestionCandidate alloc], "initWithSearchSuggestionTemplate:firstGroup:secondGroup:assetIdsForDateFilter:minAssetResultCountPerSuggestion:styleType:", v26, v15, 0, Copy, a10, 0);
            if (-[PLSearchSuggestionCandidate intersectionCount](v50, "intersectionCount"))
              objc_msgSend(v72, "addObject:", v50);

          }
          v51 = objc_msgSend(v22, "searchIndexingCategory");
          if (v51 == objc_msgSend(v26, "firstIndexCategory"))
          {
            objc_msgSend(v26, "identifier");
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            if (v52)
            {
              objc_msgSend(v22, "lookupIdentifier");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "identifier");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = objc_msgSend(v53, "isEqualToString:", v54);

              v22 = v73;
              if ((v55 & 1) == 0)
                goto LABEL_65;
            }
            else if (objc_msgSend(v26, "isMeTemplate") && (objc_msgSend(v22, "isMePerson") & 1) == 0)
            {
              goto LABEL_65;
            }
            v63 = -[PLSearchSuggestionCandidate initWithSearchSuggestionTemplate:firstGroup:secondGroup:assetIdsForDateFilter:minAssetResultCountPerSuggestion:styleType:]([PLSearchSuggestionCandidate alloc], "initWithSearchSuggestionTemplate:firstGroup:secondGroup:assetIdsForDateFilter:minAssetResultCountPerSuggestion:styleType:", v26, v22, 0, Copy, a10, 0);
            p_super = &v63->super;
LABEL_62:
            if (-[PLSearchSuggestionCandidate intersectionCount](v63, "intersectionCount"))
              objc_msgSend(v72, "addObject:", p_super);
LABEL_64:

          }
        }
        else
        {
          v34 = objc_msgSend(v15, "searchIndexingCategory");
          if (v34 == objc_msgSend(v26, "firstIndexCategory")
            && (v35 = objc_msgSend(v22, "searchIndexingCategory"), v35 == objc_msgSend(v26, "secondIndexCategory")))
          {
            objc_msgSend(v26, "identifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (v36)
            {
              objc_msgSend(v15, "lookupIdentifier");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "identifier");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v37, "isEqualToString:", v38))
              {

                v23 = a9;
LABEL_51:
                v59 = [PLSearchSuggestionCandidate alloc];
                v60 = v26;
                v61 = v15;
                v62 = v22;
LABEL_60:
                p_super = -[PLSearchSuggestionCandidate initWithSearchSuggestionTemplate:firstGroup:secondGroup:assetIdsForDateFilter:minAssetResultCountPerSuggestion:styleType:](v59, "initWithSearchSuggestionTemplate:firstGroup:secondGroup:assetIdsForDateFilter:minAssetResultCountPerSuggestion:styleType:", v60, v61, v62, Copy, a10, 0);
                v21 = v75;
                goto LABEL_61;
              }
              objc_msgSend(v22, "lookupIdentifier");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "identifier");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = objc_msgSend(v56, "isEqualToString:", v57);

              v22 = v73;
              v23 = a9;
              if ((v58 & 1) != 0)
                goto LABEL_51;
            }
            else if (!objc_msgSend(v26, "isMeTemplate") || (objc_msgSend(v15, "isMePerson") & 1) != 0)
            {
              goto LABEL_51;
            }
          }
          else
          {
            v40 = objc_msgSend(v15, "searchIndexingCategory");
            if (v40 != objc_msgSend(v26, "secondIndexCategory")
              || (v41 = objc_msgSend(v22, "searchIndexingCategory"), v41 != objc_msgSend(v26, "firstIndexCategory")))
            {
              p_super = 0;
LABEL_61:
              v63 = (PLSearchSuggestionCandidate *)p_super;
              goto LABEL_62;
            }
            objc_msgSend(v26, "identifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            if (v42)
            {
              objc_msgSend(v22, "lookupIdentifier");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "identifier");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v43, "isEqualToString:", v44))
              {

                v23 = a9;
LABEL_59:
                v59 = [PLSearchSuggestionCandidate alloc];
                v60 = v26;
                v61 = v22;
                v62 = v15;
                goto LABEL_60;
              }
              objc_msgSend(v15, "lookupIdentifier");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "identifier");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = objc_msgSend(v64, "isEqualToString:", v65);

              v22 = v73;
              v23 = a9;
              if ((v66 & 1) != 0)
                goto LABEL_59;
            }
            else if (!objc_msgSend(v26, "isMeTemplate") || (objc_msgSend(v22, "isMePerson") & 1) != 0)
            {
              goto LABEL_59;
            }
          }
          v21 = v75;
        }
LABEL_65:
        if (Copy)
          CFRelease(Copy);

        v24 = 0x1E0CB3000;
      }
      v77 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
      if (!v77)
      {
LABEL_70:

        v67 = (void *)objc_msgSend(v72, "copy");
        v18 = v74;
        v68 = v21;
        v19 = v70;
        v17 = v71;
        goto LABEL_74;
      }
    }
  }
  PLSearchBackendInitialSuggestionsGetLog();
  v68 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v68, OS_LOG_TYPE_INFO, "No scoped asset Ids provided for template generation, aborting initial suggestion generation", buf, 2u);
  }
  v67 = (void *)MEMORY[0x1E0C9AA60];
  v22 = v73;
LABEL_74:

  return v67;
}

+ (id)_singleEntitySearchCandidatesFromRankedGroups:(id)a3 minAssetResultCountPerSuggestion:(unint64_t)a4 locale:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  PLSearchSuggestionCandidate *v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        +[PLSearchSuggestionTemplateProvider templateForRankedGroup:locale:](PLSearchSuggestionTemplateProvider, "templateForRankedGroup:locale:", v14, v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = -[PLSearchSuggestionCandidate initWithSearchSuggestionTemplate:firstGroup:secondGroup:assetIdsForDateFilter:minAssetResultCountPerSuggestion:styleType:]([PLSearchSuggestionCandidate alloc], "initWithSearchSuggestionTemplate:firstGroup:secondGroup:assetIdsForDateFilter:minAssetResultCountPerSuggestion:styleType:", v15, v14, 0, 0, a4, 1);
          if (v16)
            objc_msgSend(v19, "addObject:", v16);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  v17 = (void *)objc_msgSend(v19, "copy");
  return v17;
}

+ (id)_dateTemplateCandidatesFromTemplates:(id)a3 assetIdsByDateFilter:(id)a4 scopedAssetIds:(__CFArray *)a5 minResultCountPerSuggestion:(unint64_t)a6 suggestionStyleType:(unint64_t)a7
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  const __CFArray *Copy;
  PLSearchSuggestionCandidate *v25;
  void *v26;
  id v28;
  uint64_t v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    v13 = 0x1E0CB3000uLL;
    v31 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v15, "dateFilter");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          PLSearchBackendInitialSuggestionsGetLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v38 = v15;
            _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Unable to generate date filter for date based template: %@.", buf, 0xCu);
          }
          goto LABEL_17;
        }
        objc_msgSend(*(id *)(v13 + 2024), "numberWithUnsignedInteger:", objc_msgSend(v15, "templateDateType"));
        v17 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v18, "assetIds"))
        {

LABEL_17:
          goto LABEL_18;
        }
        objc_msgSend(*(id *)(v13 + 2024), "numberWithUnsignedInteger:", objc_msgSend(v15, "templateDateType"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v19);
        v20 = v16;
        v21 = v11;
        v22 = v9;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        Copy = CFArrayCreateCopy(0, (CFArrayRef)objc_msgSend(v23, "assetIds"));

        v9 = v22;
        v11 = v21;
        v16 = v20;

        v12 = v31;
        v13 = 0x1E0CB3000;

        if (Copy)
        {
          if (CFArrayGetCount(Copy))
          {
            v25 = -[PLSearchSuggestionCandidate initWithSearchSuggestionTemplate:firstGroup:secondGroup:assetIdsForDateFilter:minAssetResultCountPerSuggestion:styleType:]([PLSearchSuggestionCandidate alloc], "initWithSearchSuggestionTemplate:firstGroup:secondGroup:assetIdsForDateFilter:minAssetResultCountPerSuggestion:styleType:", v15, 0, 0, Copy, a6, a7);
            if (v25)
              objc_msgSend(v28, "addObject:", v25);

          }
          CFRelease(Copy);
        }
LABEL_18:

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v11);
  }

  v26 = (void *)objc_msgSend(v28, "copy");
  return v26;
}

+ (id)_fetchAssetIdsForDateFilters:(id)a3 psiDatabase:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "psiDateFilter", (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setAssetIds:", objc_msgSend(v6, "assetIdsWithDateFilter:", v14));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "templateDateType"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v16 = (void *)objc_msgSend(v7, "copy");
  return v16;
}

+ (BOOL)_groupIsMePerson:(id)a3 mePersonUUID:(id)a4
{
  id v5;
  id v6;
  __int16 v7;
  void *v8;
  char v9;

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "length")
    || (v7 = objc_msgSend(v5, "category"),
        (unsigned __int16)(v7 - 1302) != 65534 && (unsigned __int16)(v7 - 1302) != 0xFFFF))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v5, "lookupIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", v6);

  }
  return v9;
}

+ (id)_mePersonUUIDForPhotoLibrary:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  uint8_t v8[16];
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__PLInitialSuggestionsManager__mePersonUUIDForPhotoLibrary___block_invoke;
  v9[3] = &unk_1E3677C68;
  v4 = v3;
  v10 = v4;
  v11 = &v12;
  objc_msgSend(v4, "performBlockAndWait:", v9);
  if (!objc_msgSend((id)v13[5], "length"))
  {
    PLSearchBackendInitialSuggestionsGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Unable to fetch Me person from photolibrary. Initial suggestions will not include Me templates", v8, 2u);
    }

  }
  v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

+ (id)validateInitialSuggestions:(id)a3 minResultCountPerSuggestion:(unint64_t)a4 psiDatabase:(id)a5 suggestionStyleType:(unint64_t)a6
{
  id v8;
  PLSearchSuggestionTemplateProvider *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  CFIndex Count;
  void *v40;
  char v41;
  NSObject *v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  void *v52;
  PLSearchSuggestionTemplateProvider *v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v58;
  id v59;
  unint64_t v60;
  void *v61;
  uint64_t v62;
  id v63;
  void *v65;
  void *v66;
  void *v67;
  CFArrayRef theArray;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[4];
  uint64_t v78;
  __int16 v79;
  uint64_t v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v63 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PLSearchSuggestionTemplateProvider initWithLocale:]([PLSearchSuggestionTemplateProvider alloc], "initWithLocale:", v55);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v74 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "suggestionTemplate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLSearchSuggestionTemplateProvider dateFilterForSearchSuggestionTemplateDateType:](v9, "dateFilterForSearchSuggestionTemplateDateType:", objc_msgSend(v16, "templateDateType"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          objc_msgSend(v10, "addObject:", v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
    }
    while (v13);
  }
  v53 = v9;

  v52 = v10;
  objc_msgSend((id)objc_opt_class(), "_fetchAssetIdsForDateFilters:psiDatabase:", v10, v63);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v18 = v11;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v70;
    v59 = v18;
    v60 = a6;
    v58 = *(_QWORD *)v70;
    do
    {
      v22 = 0;
      v62 = v20;
      do
      {
        if (*(_QWORD *)v70 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v22);
        if (objc_msgSend(v23, "styleType") == a6)
        {
          objc_msgSend(v23, "suggestionTemplate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "templateDateType");

          objc_msgSend(v23, "suggestionTemplate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "isDateOnlyTemplate");

          objc_msgSend(v23, "firstGroup");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "secondGroup");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            objc_msgSend(v23, "firstGroup");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "_updatedGroupFromGroup:psiDatabase:", v30, v63);
            v67 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
              goto LABEL_18;
LABEL_20:
            v32 = 0;
          }
          else
          {
            v67 = 0;
            if (!v29)
              goto LABEL_20;
LABEL_18:
            objc_msgSend(v23, "secondGroup");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "_updatedGroupFromGroup:psiDatabase:", v31, v63);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v23, "firstGroup");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "displayString");
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "secondGroup");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "displayString");
          v65 = (void *)objc_claimAutoreleasedReturnValue();

          v35 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v23, "suggestionTemplate");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "numberWithUnsignedInteger:", objc_msgSend(v36, "templateDateType"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "objectForKeyedSubscript:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          Count = objc_msgSend(v38, "assetIds");
          if (Count)
            Count = CFArrayGetCount((CFArrayRef)objc_msgSend(v38, "assetIds"));
          a6 = v60;
          v40 = v32;
          if (v60)
          {
            v41 = v25 ? 1 : v27;
            if ((v41 & 1) != 0 || v38 || v29 || !v28)
              goto LABEL_44;
          }
          if (v28 && !v67)
          {
            PLSearchBackendInitialSuggestionsGetLog();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
              goto LABEL_42;
LABEL_43:

LABEL_44:
            v21 = v58;
            v18 = v59;
            v20 = v62;
            goto LABEL_45;
          }
          if (v29 && !v32)
          {
            PLSearchBackendInitialSuggestionsGetLog();
            v42 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
              goto LABEL_43;
            goto LABEL_42;
          }
          if (v25 && !Count)
          {
            PLSearchBackendInitialSuggestionsGetLog();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
              goto LABEL_42;
            goto LABEL_43;
          }
          if (v67 && v32)
          {
            theArray = 0;
            if (objc_msgSend(v67, "assetIds"))
            {
              theArray = CFArrayCreateCopy(0, (CFArrayRef)objc_msgSend(v67, "assetIds"));
              if (theArray)
              {
                if (objc_msgSend(v32, "assetIds"))
                {
                  +[PLScopedSearchUtilities intersectSortedArray:withOtherSortedArray:intersectionLimit:](PLScopedSearchUtilities, "intersectSortedArray:withOtherSortedArray:intersectionLimit:", &theArray, objc_msgSend(v32, "assetIds"), a4);
                  v43 = CFArrayGetCount(theArray);
                }
                else
                {
                  v43 = 0;
                }
                if (theArray)
                  CFRelease(theArray);
                v40 = v32;
              }
              else
              {
                v43 = 0;
              }
            }
            else
            {
              v43 = 0;
              theArray = 0;
            }
            if (v43 < a4)
            {
              PLSearchBackendInitialSuggestionsGetLog();
              v42 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                goto LABEL_43;
              goto LABEL_42;
            }
          }
          else if (v67 && v38)
          {
            theArray = 0;
            if (objc_msgSend(v67, "assetIds"))
            {
              theArray = CFArrayCreateCopy(0, (CFArrayRef)objc_msgSend(v67, "assetIds"));
              if (theArray)
              {
                if (objc_msgSend(v38, "assetIds"))
                {
                  v40 = v32;
                  +[PLScopedSearchUtilities intersectSortedArray:withOtherSortedArray:intersectionLimit:](PLScopedSearchUtilities, "intersectSortedArray:withOtherSortedArray:intersectionLimit:", &theArray, objc_msgSend(v38, "assetIds"), a4);
                  v44 = CFArrayGetCount(theArray);
                }
                else
                {
                  v44 = 0;
                }
                if (theArray)
                  CFRelease(theArray);
              }
              else
              {
                v44 = 0;
              }
            }
            else
            {
              v44 = 0;
              theArray = 0;
            }
            if (v44 < a4)
            {
              PLSearchBackendInitialSuggestionsGetLog();
              v42 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                goto LABEL_43;
LABEL_42:
              *(_DWORD *)buf = 138412290;
              v78 = (uint64_t)v23;
              _os_log_impl(&dword_199541000, v42, OS_LOG_TYPE_INFO, "Stored initial suggestion is no longer valid: %@", buf, 0xCu);
              goto LABEL_43;
            }
          }
          else if (v67)
          {
            v45 = objc_msgSend(v67, "assetIds");
            if (v45)
              v45 = CFArrayGetCount((CFArrayRef)objc_msgSend(v67, "assetIds"));
            if (v45 < a4)
            {
              PLSearchBackendInitialSuggestionsGetLog();
              v42 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                goto LABEL_43;
              goto LABEL_42;
            }
          }
          else if (v27)
          {
            v46 = objc_msgSend(v38, "assetIds");
            if (v46)
              v46 = CFArrayGetCount((CFArrayRef)objc_msgSend(v38, "assetIds"));
            if (v46 < a4)
            {
              PLSearchBackendInitialSuggestionsGetLog();
              v42 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                goto LABEL_43;
              goto LABEL_42;
            }
          }
          objc_msgSend(a1, "_updatedCandidateFromCandidate:firstGroup:secondGroup:firstGroupDisplayString:secondGroupDisplayString:dateFilter:todayDate:locale:minResultCountPerSuggestion:suggestionStyleType:", v23, v67, v40, v66, v65, v38, v56, v55, a4, v60);
          v42 = objc_claimAutoreleasedReturnValue();
          if (v42)
            objc_msgSend(v54, "addObject:", v42);
          goto LABEL_43;
        }
LABEL_45:
        ++v22;
      }
      while (v20 != v22);
      v47 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
      v20 = v47;
    }
    while (v47);
  }

  PLSearchBackendInitialSuggestionsGetLog();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    v49 = objc_msgSend(v54, "count");
    v50 = objc_msgSend(v18, "count");
    *(_DWORD *)buf = 134218240;
    v78 = v49;
    v79 = 2048;
    v80 = v50;
    _os_log_impl(&dword_199541000, v48, OS_LOG_TYPE_DEFAULT, "Validated %tu initial suggestions out of %tu retrieved from disk", buf, 0x16u);
  }

  return v54;
}

+ (id)_updatedGroupFromGroup:(id)a3 psiDatabase:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5
    && v6
    && objc_msgSend(v5, "searchIndexingCategory")
    && (objc_msgSend(v5, "displayString"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "length"),
        v8,
        v9))
  {
    v10 = objc_msgSend(v5, "searchIndexingCategory");
    objc_msgSend(v5, "contentString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lookupIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isMePerson"))
      v13 = 0;
    else
      v13 = v11;
    objc_msgSend(v7, "groupForText:identifier:category:resultTypes:", v13, v12, v10, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLSearchBackendInitialSuggestionsGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412546;
      v18 = v5;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Invalid ranked group detected: %@ or nil psidatabase: %@", (uint8_t *)&v17, 0x16u);
    }

    v14 = 0;
  }

  return v14;
}

+ (id)_updatedCandidateFromCandidate:(id)a3 firstGroup:(id)a4 secondGroup:(id)a5 firstGroupDisplayString:(id)a6 secondGroupDisplayString:(id)a7 dateFilter:(id)a8 todayDate:(id)a9 locale:(id)a10 minResultCountPerSuggestion:(unint64_t)a11 suggestionStyleType:(unint64_t)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  PLSearchSuggestionTemplate *v30;
  void *v31;
  PSIRankedGroupV2 *v32;
  void *v33;
  PSIRankedGroupV2 *v34;
  PLSearchSuggestionCandidate *v35;
  PSIRankedGroupV2 *v36;
  void *v37;
  PSIRankedGroupV2 *v38;
  PLSearchSuggestionCandidate *v39;
  uint64_t v40;
  uint64_t v42;
  PLSearchSuggestionTemplate *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;

  v17 = a3;
  v49 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  if (v17)
  {
    v47 = v20;
    v48 = v19;
    v46 = v18;
    v21 = a10;
    v22 = a9;
    v45 = a8;
    objc_msgSend(v17, "suggestionTemplate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = [PLSearchSuggestionTemplate alloc];
    objc_msgSend(v23, "suggestionTemplateKey");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v23, "firstIndexCategory");
    v44 = v17;
    v25 = objc_msgSend(v23, "secondIndexCategory");
    v26 = objc_msgSend(v23, "templateType");
    v27 = objc_msgSend(v23, "templateContentType");
    v28 = objc_msgSend(v23, "templateDateType");
    objc_msgSend(v23, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[PLSearchSuggestionTemplate initWithSuggestionTemplateKey:firstIndexCategory:secondIndexCategory:templateType:templateContentType:templateDateType:styleType:identifier:todayDate:locale:](v43, "initWithSuggestionTemplateKey:firstIndexCategory:secondIndexCategory:templateType:templateContentType:templateDateType:styleType:identifier:todayDate:locale:", v24, v42, v25, v26, v27, v28, a12, v29, v22, v21);

    v31 = v49;
    if (v49)
    {
      v32 = [PSIRankedGroupV2 alloc];
      v17 = v44;
      objc_msgSend(v44, "firstGroup");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[PSIRankedGroupV2 initWithGroup:displayString:isMePerson:](v32, "initWithGroup:displayString:isMePerson:", v49, v48, objc_msgSend(v33, "isMePerson"));

    }
    else
    {
      v34 = 0;
      v17 = v44;
    }
    if (v46)
    {
      v36 = [PSIRankedGroupV2 alloc];
      objc_msgSend(v17, "secondGroup");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[PSIRankedGroupV2 initWithGroup:displayString:isMePerson:](v36, "initWithGroup:displayString:isMePerson:", v46, v47, objc_msgSend(v37, "isMePerson"));

    }
    else
    {
      v38 = 0;
    }
    v18 = v46;
    v39 = [PLSearchSuggestionCandidate alloc];
    v40 = objc_msgSend(v45, "assetIds");

    v35 = -[PLSearchSuggestionCandidate initWithSearchSuggestionTemplate:firstGroup:secondGroup:assetIdsForDateFilter:minAssetResultCountPerSuggestion:styleType:](v39, "initWithSearchSuggestionTemplate:firstGroup:secondGroup:assetIdsForDateFilter:minAssetResultCountPerSuggestion:styleType:", v30, v34, v38, v40, a11, a12);
    objc_msgSend(v17, "timeSinceLastUsed");
    -[PLSearchSuggestionCandidate setTimeSinceLastUsed:](v35, "setTimeSinceLastUsed:");

    v20 = v47;
    v19 = v48;
  }
  else
  {
    v35 = 0;
    v31 = v49;
  }

  return v35;
}

+ (id)_rankedGroupsFromPSIDatabase:(id)a3 photoLibrary:(id)a4 assetIds:(__CFArray *)a5 templateProvider:(id)a6 mePersonUUID:(id)a7 minResultCountPerSuggestion:(unint64_t)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  unint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  void *v29;
  BOOL v30;
  void *v31;
  id v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  os_signpost_id_t spid;
  id v39;
  unint64_t v40;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint8_t v48[8];
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  __CFArray *v53;
  unint64_t v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  uint8_t *v61;
  uint8_t buf[8];
  uint8_t *v63;
  uint64_t v64;
  char v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  _QWORD v71[3];

  v71[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v47 = a4;
  v13 = a6;
  v14 = a7;
  if (v12)
  {
    v40 = a8;
    v43 = v14;
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v13, "nonIdentifierBasedSupportedSearchEntityTypes");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "groupsForSearchIndexCategories:searchResultTypes:dateFilter:", v46, 1, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObjectsFromArray:", v45);
    objc_msgSend(v13, "supportedIdentifiers");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __140__PLInitialSuggestionsManager__rankedGroupsFromPSIDatabase_photoLibrary_assetIds_templateProvider_mePersonUUID_minResultCountPerSuggestion___block_invoke;
    v68[3] = &unk_1E36701C0;
    v69 = v12;
    v17 = v15;
    v70 = v17;
    objc_msgSend(v44, "enumerateObjectsUsingBlock:", v68);
    if (objc_msgSend(v17, "count"))
    {
      PLPhotosSearchGetLog();
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v19 = os_signpost_id_generate(v18);

      v20 = v18;
      v21 = v20;
      v22 = v19 - 1;
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "PLSearchBackendInitialSuggestionGenerateRankedGroups", ", buf, 2u);
      }
      spid = v19;

      v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v66[0] = v16;
      v66[1] = 3221225472;
      v66[2] = __140__PLInitialSuggestionsManager__rankedGroupsFromPSIDatabase_photoLibrary_assetIds_templateProvider_mePersonUUID_minResultCountPerSuggestion___block_invoke_45;
      v66[3] = &unk_1E365F688;
      v24 = v23;
      v67 = v24;
      objc_msgSend(v17, "enumerateObjectsUsingBlock:", v66);
      *(_QWORD *)buf = 0;
      v63 = buf;
      v64 = 0x2020000000;
      v65 = 0;
      if (objc_msgSend(v24, "count"))
      {
        v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v56[0] = v16;
        v56[1] = 3221225472;
        v56[2] = __140__PLInitialSuggestionsManager__rankedGroupsFromPSIDatabase_photoLibrary_assetIds_templateProvider_mePersonUUID_minResultCountPerSuggestion___block_invoke_2;
        v56[3] = &unk_1E3677970;
        v57 = v24;
        v58 = v47;
        v61 = buf;
        v26 = v25;
        v59 = v26;
        v60 = v17;
        objc_msgSend(v58, "performBlockAndWait:", v56, v19, v39);

      }
      else
      {
        v26 = 0;
      }
      if (v63[24])
      {
        objc_msgSend(v24, "allValues");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "count") == 0;

        if (!v30)
        {
          objc_msgSend(v24, "allValues");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "removeObjectsInArray:", v31);

        }
      }
      v49[0] = v16;
      v49[1] = 3221225472;
      v49[2] = __140__PLInitialSuggestionsManager__rankedGroupsFromPSIDatabase_photoLibrary_assetIds_templateProvider_mePersonUUID_minResultCountPerSuggestion___block_invoke_54;
      v49[3] = &unk_1E365F6B0;
      v53 = a5;
      v54 = v40;
      v55 = a1;
      v50 = v43;
      v32 = v26;
      v51 = v32;
      v33 = v39;
      v52 = v33;
      objc_msgSend(v17, "enumerateObjectsUsingBlock:", v49);
      v34 = v21;
      v28 = v34;
      if (v22 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
      {
        *(_WORD *)v48 = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v28, OS_SIGNPOST_INTERVAL_END, spid, "PLSearchBackendInitialSuggestionGenerateRankedGroups", ", v48, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("rankingScore"), 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "sortUsingDescriptors:", v36);

      v27 = v33;
      _Block_object_dispose(buf, 8);

    }
    else
    {
      PLSearchBackendInitialSuggestionsGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_INFO, "No entities found for initial suggestion generation, no suggestions will be generated.", buf, 2u);
      }
      v27 = (id)MEMORY[0x1E0C9AA60];
    }

    v14 = v43;
  }
  else
  {
    v27 = (id)MEMORY[0x1E0C9AA60];
  }

  return v27;
}

+ (id)rankedGroupCandidatesForInitialSuggestionsForPhotoLibrary:(id)a3
{
  id v4;
  void *v5;
  PSIDatabase *v6;
  void *v7;
  PLSearchSuggestionTemplateProvider *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __CFArray *v12;
  void *v13;
  NSObject *v14;
  uint8_t v16[16];

  v4 = a3;
  objc_msgSend(v4, "pathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PSIDatabase initWithPathManager:options:]([PSIDatabase alloc], "initWithPathManager:options:", v5, 1);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PLSearchSuggestionTemplateProvider initWithLocale:]([PLSearchSuggestionTemplateProvider alloc], "initWithLocale:", v7);
    v9 = -[PSIDatabase countOfAssets](v6, "countOfAssets");
    v10 = objc_msgSend(a1, "recentAssetLimitForInitialSuggestionGenerationForIndexedAssetCount:", v9);
    objc_msgSend(a1, "_mePersonUUIDForPhotoLibrary:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PSIDatabase mostRecentSortedAssetIdsWithLimit:](v6, "mostRecentSortedAssetIdsWithLimit:", v10);
    objc_msgSend(a1, "_rankedGroupsFromPSIDatabase:photoLibrary:assetIds:templateProvider:mePersonUUID:minResultCountPerSuggestion:", v6, v4, v12, v8, v11, objc_msgSend(a1, "scaledMinimumNumberOfResultsPerSuggestion:", v9));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      CFRelease(v12);

  }
  else
  {
    PLSearchBackendInitialSuggestionsGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Unexpected nil psiDatabase. No ranked groups will be generated.", v16, 2u);
    }

    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

+ (unint64_t)scaledMinimumNumberOfResultsPerSuggestion:(unint64_t)a3
{
  unint64_t v3;

  if (!a3)
    return 0;
  v3 = vcvtad_u64_f64(sqrt((float)((float)a3 * 0.25)));
  if (v3 >= 0x1F4)
    v3 = 500;
  if (v3 <= 0x14)
    return 20;
  else
    return v3;
}

void __140__PLInitialSuggestionsManager__rankedGroupsFromPSIDatabase_photoLibrary_assetIds_templateProvider_mePersonUUID_minResultCountPerSuggestion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "groupForLookupIdentifier:searchResultTypes:", a2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    v3 = v4;
  }

}

void __140__PLInitialSuggestionsManager__rankedGroupsFromPSIDatabase_photoLibrary_assetIds_templateProvider_mePersonUUID_minResultCountPerSuggestion___block_invoke_45(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "category") == 1300
    || objc_msgSend(v5, "category") == 1301
    || objc_msgSend(v5, "category") == 1330
    || objc_msgSend(v5, "category") == 1331)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v5, "lookupIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v4);

  }
}

void __140__PLInitialSuggestionsManager__rankedGroupsFromPSIDatabase_photoLibrary_assetIds_templateProvider_mePersonUUID_minResultCountPerSuggestion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  _BYTE v45[128];
  uint8_t v46[128];
  uint8_t buf[4];
  id v48;
  _QWORD v49[3];

  v49[1] = *MEMORY[0x1E0C80C00];
  +[PLPerson fetchRequest](PLPerson, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setResultType:", 0);
  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("personUUID"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v5);

  v49[0] = CFSTR("userFeedbacks");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRelationshipKeyPathsForPrefetching:", v6);

  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v2, &v44);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v44;
  if (v9 || !objc_msgSend(v8, "count"))
  {
    PLSearchBackendInitialSuggestionsGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Encountered error fetching persons for candidate groups: %@.", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
  else
  {
    v30 = v7;
    v31 = v2;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v29 = v8;
    obj = v8;
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v34)
    {
      v33 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v41 != v33)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v12, "displayName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "length");
          if (v14)
          {
            objc_msgSend(v12, "displayName");
            v15 = objc_claimAutoreleasedReturnValue();
            v35 = (void *)v15;
          }
          else
          {
            v15 = 0;
          }
          v16 = *(void **)(a1 + 48);
          objc_msgSend(v12, "personUUID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

          if (v14)
          objc_msgSend(v12, "userFeedbacks");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v37;
            do
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v37 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
                if (objc_msgSend(v23, "type") == 2 || objc_msgSend(v23, "type") == 3)
                {
                  objc_msgSend(v12, "personUUID");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = objc_msgSend(v24, "length");

                  if (v25)
                  {
                    v26 = *(void **)(a1 + 32);
                    objc_msgSend(v12, "personUUID");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "objectForKeyedSubscript:", v27);
                    v28 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v28)
                      objc_msgSend(*(id *)(a1 + 56), "removeObject:", v28);

                  }
                }
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
            }
            while (v20);
          }

        }
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v34);
    }

    v7 = v30;
    v2 = v31;
    v8 = v29;
    v9 = 0;
  }

}

void __140__PLInitialSuggestionsManager__rankedGroupsFromPSIDatabase_photoLibrary_assetIds_templateProvider_mePersonUUID_minResultCountPerSuggestion___block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PSIRankedGroupV2 *v12;
  CFArrayRef theArray;

  v3 = a2;
  if (objc_msgSend(v3, "category") == 1103)
  {
    objc_msgSend(v3, "score");
    v5 = v4 != 0.0;
  }
  else
  {
    v5 = 1;
  }
  if (PLSearchIndexCategoryIsEligibleForSuggestion((int)objc_msgSend(v3, "category")))
  {
    objc_msgSend(v3, "contentString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "length"))
      v5 = 0;

    if (v5)
    {
      if (objc_msgSend(v3, "assetIds"))
      {
        theArray = CFArrayCreateCopy(0, (CFArrayRef)objc_msgSend(v3, "assetIds"));
        if (theArray)
        {
          +[PLScopedSearchUtilities intersectSortedArray:withOtherSortedArray:intersectionLimit:](PLScopedSearchUtilities, "intersectSortedArray:withOtherSortedArray:intersectionLimit:", &theArray, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
          if (theArray)
          {
            if (CFArrayGetCount(theArray))
            {
              v7 = objc_msgSend((id)objc_opt_class(), "_groupIsMePerson:mePersonUUID:", v3, *(_QWORD *)(a1 + 32));
              objc_msgSend(v3, "lookupIdentifier");
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v8, "length"))
              {
                v9 = *(void **)(a1 + 40);
                objc_msgSend(v3, "lookupIdentifier");
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "objectForKeyedSubscript:", v10);
                v11 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v11 = 0;
              }

              v12 = -[PSIRankedGroupV2 initWithGroup:displayString:isMePerson:]([PSIRankedGroupV2 alloc], "initWithGroup:displayString:isMePerson:", v3, v11, v7);
              objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);

            }
            if (theArray)
              CFRelease(theArray);
          }
        }
      }
    }
  }

}

void __60__PLInitialSuggestionsManager__mePersonUUIDForPhotoLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPerson fetchMePersonInManagedObjectContext:](PLPerson, "fetchMePersonInManagedObjectContext:", v2);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "personUUID");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)fetchInitialSuggestionsWithLimit:(unint64_t)a3 minimumResultCountPerSuggestion:(unint64_t)a4 suggestionStyleType:(unint64_t)a5 photoLibrary:(id)a6 psiDatabase:(id)a7
{
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  uint64_t v40;
  unint64_t v41;
  uint8_t buf[4];
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v13 = a6;
  v14 = a7;
  v15 = v14;
  if (v13)
  {
    if (v14)
    {
LABEL_3:
      v41 = a3;
      PLPhotosSearchGetLog();
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = os_signpost_id_generate(v16);

      v18 = v16;
      v19 = v18;
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PLSearchBackendInitialSuggestionGetAssetCount", ", buf, 2u);
      }

      if (-[PLInitialSuggestionsManager cachedTotalNumberOfIndexedAssets](self, "cachedTotalNumberOfIndexedAssets"))
        v20 = 1;
      else
        v20 = objc_msgSend(v15, "countOfAssets");
      -[PLInitialSuggestionsManager setCachedTotalNumberOfIndexedAssets:](self, "setCachedTotalNumberOfIndexedAssets:", v20);
      v21 = v19;
      v22 = v21;
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v22, OS_SIGNPOST_INTERVAL_END, v17, "PLSearchBackendInitialSuggestionGetAssetCount", ", buf, 2u);
      }

      if (v20)
      {
        v23 = objc_msgSend((id)objc_opt_class(), "recentAssetLimitForInitialSuggestionGenerationForIndexedAssetCount:", v20);
        if (v23)
        {
          v24 = objc_msgSend((id)objc_opt_class(), "scaledMinimumNumberOfResultsPerSuggestion:", v20);
          if (v24 <= a4)
            v25 = a4;
          else
            v25 = v24;
          if (a4)
            v26 = v25;
          else
            v26 = v24;
          PLSearchBackendInitialSuggestionsGetLog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v43 = v26;
            _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEFAULT, "Fetching initial suggestions with a required minimum of %tu results per suggestion.", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLInitialSuggestionsManager _preGeneratedInitialSuggestionsForPhotoLibrary:minResultCountPerSuggestion:suggestionLimit:psiDatabase:locale:suggestionStyleType:](self, "_preGeneratedInitialSuggestionsForPhotoLibrary:minResultCountPerSuggestion:suggestionLimit:psiDatabase:locale:suggestionStyleType:", v13, v26, v41, v15, v28, a5);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v29, "count"))
          {
            v30 = v29;
            PLSearchBackendInitialSuggestionsGetLog();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              v32 = -[NSObject count](v30, "count");
              *(_DWORD *)buf = 134217984;
              v43 = v32;
              v33 = "Found pre-generated initial suggestions, returning %tu.";
LABEL_33:
              _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_DEFAULT, v33, buf, 0xCu);
            }
          }
          else
          {
            LOBYTE(v40) = 0;
            -[PLInitialSuggestionsManager _generateSuggestionsOnDemandWithLimitOfMostRecentAssets:suggestionLimit:minimumNumberOfResultsPerSuggestion:photoLibrary:psiDatabase:minResultCountPerSuggestion:locale:shouldGenerateAllSuggestions:suggestionStyleType:](self, "_generateSuggestionsOnDemandWithLimitOfMostRecentAssets:suggestionLimit:minimumNumberOfResultsPerSuggestion:photoLibrary:psiDatabase:minResultCountPerSuggestion:locale:shouldGenerateAllSuggestions:suggestionStyleType:", v23, v41, v26, v13, v15, v26, v28, v40, a5);
            v30 = objc_claimAutoreleasedReturnValue();
            PLSearchBackendInitialSuggestionsGetLog();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              v36 = -[NSObject count](v30, "count");
              *(_DWORD *)buf = 134217984;
              v43 = v36;
              v33 = "Generated initial suggestions on demand, returning %tu.";
              goto LABEL_33;
            }
          }

          v35 = -[NSObject copy](v30, "copy");
          goto LABEL_35;
        }
        PLSearchBackendInitialSuggestionsGetLog();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v34 = "No available assets for generating initial suggestions. No initial suggestions will be generated.";
          goto LABEL_29;
        }
      }
      else
      {
        PLSearchBackendInitialSuggestionsGetLog();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v34 = "0 assets available for search, no initial suggestions will be generated";
LABEL_29:
          _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_ERROR, v34, buf, 2u);
        }
      }
      v35 = (id)MEMORY[0x1E0C9AA60];
LABEL_35:

      goto LABEL_40;
    }
  }
  else
  {
    v37 = a3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLInitialSuggestionsManager.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

    a3 = v37;
    if (v15)
      goto LABEL_3;
  }
  PLSearchBackendInitialSuggestionsGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Unexpected nil psiDatabase. No initial suggestions will be generated.", buf, 2u);
  }
  v35 = (id)MEMORY[0x1E0C9AA60];
LABEL_40:

  return v35;
}

- (id)_generateSuggestionsOnDemandWithLimitOfMostRecentAssets:(unint64_t)a3 suggestionLimit:(unint64_t)a4 minimumNumberOfResultsPerSuggestion:(unint64_t)a5 photoLibrary:(id)a6 psiDatabase:(id)a7 minResultCountPerSuggestion:(unint64_t)a8 locale:(id)a9 shouldGenerateAllSuggestions:(BOOL)a10 suggestionStyleType:(unint64_t)a11
{
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  const __CFArray *v20;
  const __CFArray *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  PLSearchSuggestionTemplateProvider *v57;
  NSObject *v58;
  id v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  id v67;
  _BYTE v68[128];
  void *v69;
  uint8_t buf[4];
  id v71;
  __int16 v72;
  NSObject *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v60 = a6;
  v61 = a7;
  v59 = a9;
  PLPhotosSearchGetLog();
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = os_signpost_id_generate(v16);

  v18 = v16;
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PLSearchBackendInitialSuggestionIndexIdsFromUUIDs", ", buf, 2u);
  }
  v58 = v19;

  v20 = (const __CFArray *)objc_msgSend(v61, "mostRecentSortedAssetIdsWithLimit:", a3);
  v21 = v20;
  if (v20 && CFArrayGetCount(v20))
  {
    v22 = v19;
    v23 = v22;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v23, OS_SIGNPOST_INTERVAL_END, v17, "PLSearchBackendInitialSuggestionIndexIdsFromUUIDs", ", buf, 2u);
    }

    v57 = -[PLSearchSuggestionTemplateProvider initWithLocale:]([PLSearchSuggestionTemplateProvider alloc], "initWithLocale:", v59);
    objc_msgSend((id)objc_opt_class(), "_mePersonUUIDForPhotoLibrary:", v60);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSearchSuggestionTemplateProvider allDateFilters](v57, "allDateFilters");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_fetchAssetIdsForDateFilters:psiDatabase:", v54, v61);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_rankedGroupsFromPSIDatabase:photoLibrary:assetIds:templateProvider:mePersonUUID:minResultCountPerSuggestion:", v61, v60, v21, v57, v56, a8);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    PLPhotosSearchGetLog();
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = os_signpost_id_generate(v24);

    v26 = v24;
    v27 = v26;
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "PLSearchBackendInitialSuggestionGenerateRankedTemplates", ", buf, 2u);
    }

    objc_msgSend((id)objc_opt_class(), "_templateCandidatesFromRankedGroups:assetIdsByDateFilter:scopedAssetIds:templateProvider:mePersonExists:shouldGenerateAllSuggestions:minResultCountPerSuggestion:suggestionStyleType:", v52, v53, v21, v57, objc_msgSend(v56, "length") != 0, a10, a8, a11);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v29 = v28;
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v29, OS_SIGNPOST_INTERVAL_END, v25, "PLSearchBackendInitialSuggestionGenerateRankedTemplates", ", buf, 2u);
    }
    v51 = v29;

    CFRelease(v21);
    if (a10)
    {
      +[PLInitialSuggestionRanker trimmedListCandidatesOfCandidatesFromCandidates:maxNumberOfSuggestionsPerContentType:locale:](PLInitialSuggestionRanker, "trimmedListCandidatesOfCandidatesFromCandidates:maxNumberOfSuggestionsPerContentType:locale:", v55, 25, v59);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = 0;
      +[PLInitialSuggestionsStorageManager initialSearchSuggestionsForPhotoLibrary:error:](PLInitialSuggestionsStorageManager, "initialSearchSuggestionsForPhotoLibrary:error:", v60, &v67);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v67;
      if (v32)
      {
        PLSearchBackendInitialSuggestionsGetLog();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v71 = v60;
          v72 = 2112;
          v73 = v32;
          _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "Error retrieving initial suggestions for photoLibrary: %@, %@", buf, 0x16u);
        }

      }
      +[PLSearchSuggestionCandidate updateCandidates:withTimestampsFromPreviouslyStoredCandidates:](PLSearchSuggestionCandidate, "updateCandidates:withTimestampsFromPreviouslyStoredCandidates:", v30, v31);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (a4 != -1)
      {
        +[PLInitialSuggestionRanker rankSearchSuggestionCandidates:suggestionLimit:maxNumberOfSuggestionsPerContentType:locale:](PLInitialSuggestionRanker, "rankSearchSuggestionCandidates:suggestionLimit:maxNumberOfSuggestionsPerContentType:locale:", v55, a4, 25, v59);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      }
      v30 = (void *)objc_msgSend(v55, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("rankingScore"), 0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v48;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "sortUsingDescriptors:", v49);

      v34 = (void *)objc_msgSend(v30, "copy");
      PLSearchBackendInitialSuggestionsGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_DEFAULT, "Request made for all initial suggestions, no ranking applied, returning suggestions sorted by ranking score.", buf, 2u);
      }
    }

LABEL_29:
    if (a4 == -1)
      v37 = v34;
    else
      v37 = v55;
    -[PLInitialSuggestionsManager setCachedInitialSuggestions:](self, "setCachedInitialSuggestions:", v37);
    -[PLInitialSuggestionsManager cachedInitialSuggestions](self, "cachedInitialSuggestions");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0;
    +[PLInitialSuggestionsStorageManager saveInitialSuggestions:photoLibrary:error:](PLInitialSuggestionsStorageManager, "saveInitialSuggestions:photoLibrary:error:", v38, v60, &v66);
    v50 = v66;

    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v34, "count"));
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v40 = v34;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
    if (v41)
    {
      v42 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v63 != v42)
            objc_enumerationMutation(v40);
          v44 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
          objc_msgSend(v44, "populatedTemplateQueryString");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v45, "length"))
          {
            objc_msgSend(v39, "addObject:", v45);
          }
          else
          {
            PLSearchBackendInitialSuggestionsGetLog();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v71 = v44;
              _os_log_impl(&dword_199541000, v46, OS_LOG_TYPE_ERROR, "Unable to populate suggestion candidate %@, discarding suggestion", buf, 0xCu);
            }

          }
        }
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
      }
      while (v41);
    }

    v36 = (void *)objc_msgSend(v39, "copy");
    goto LABEL_45;
  }
  PLSearchBackendInitialSuggestionsGetLog();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_ERROR, "Error generating recent assetIds for initial suggestions. No initial suggestions will be generated.", buf, 2u);
  }

  if (v21)
    CFRelease(v21);
  v36 = (void *)MEMORY[0x1E0C9AA60];
LABEL_45:

  return v36;
}

- (id)_preGeneratedInitialSuggestionsForPhotoLibrary:(id)a3 minResultCountPerSuggestion:(unint64_t)a4 suggestionLimit:(unint64_t)a5 psiDatabase:(id)a6 locale:(id)a7 suggestionStyleType:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t buf[4];
  void *v46;
  _BYTE v47[128];
  _QWORD v48[3];

  v48[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a6;
  v16 = a7;
  -[PLInitialSuggestionsManager cachedInitialSuggestions](self, "cachedInitialSuggestions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v44 = 0;
    +[PLInitialSuggestionsStorageManager initialSearchSuggestionsForPhotoLibrary:error:](PLInitialSuggestionsStorageManager, "initialSearchSuggestionsForPhotoLibrary:error:", v14, &v44);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v18, "count"))
    {
      v34 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_20;
    }
    objc_msgSend((id)objc_opt_class(), "validateInitialSuggestions:minResultCountPerSuggestion:psiDatabase:suggestionStyleType:", v18, a4, v15, a8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");
    -[PLInitialSuggestionsManager setCachedInitialSuggestions:](self, "setCachedInitialSuggestions:", v20);

  }
  v37 = v15;
  v38 = v14;
  v36 = v16;
  -[PLInitialSuggestionsManager cachedInitialSuggestions](self, "cachedInitialSuggestions");
  if (a5 == -1)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v24, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("rankingScore"), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sortUsingDescriptors:", v25);

  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLInitialSuggestionRanker rankSearchSuggestionCandidates:suggestionLimit:maxNumberOfSuggestionsPerContentType:locale:](PLInitialSuggestionRanker, "rankSearchSuggestionCandidates:suggestionLimit:maxNumberOfSuggestionsPerContentType:locale:", v21, a5, 25, v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLInitialSuggestionsManager cachedInitialSuggestions](self, "cachedInitialSuggestions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    +[PLInitialSuggestionsStorageManager saveInitialSuggestions:photoLibrary:error:](PLInitialSuggestionsStorageManager, "saveInitialSuggestions:photoLibrary:error:", v23, v14, &v43);
  }

  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v22, "count"));
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v18 = v22;
  v27 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v40 != v29)
          objc_enumerationMutation(v18);
        v31 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v31, "populatedTemplateQueryString");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v32, "length"))
        {
          objc_msgSend(v26, "addObject:", v32);
        }
        else
        {
          PLSearchBackendInitialSuggestionsGetLog();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v31;
            _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "Unable to populate suggestion candidate: %@", buf, 0xCu);
          }

        }
      }
      v28 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v28);
  }

  v34 = (void *)objc_msgSend(v26, "copy");
  v15 = v37;
  v14 = v38;
  v16 = v36;
LABEL_20:

  return v34;
}

- (NSArray)cachedInitialSuggestions
{
  return self->_cachedInitialSuggestions;
}

- (void)setCachedInitialSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_cachedInitialSuggestions, a3);
}

- (unint64_t)cachedTotalNumberOfIndexedAssets
{
  return self->_cachedTotalNumberOfIndexedAssets;
}

- (void)setCachedTotalNumberOfIndexedAssets:(unint64_t)a3
{
  self->_cachedTotalNumberOfIndexedAssets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedInitialSuggestions, 0);
}

void __44__PLInitialSuggestionsManager_sharedManager__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___PLInitialSuggestionsManager;
  v1 = objc_msgSend(objc_msgSendSuper2(&v3, sel_alloc), "init");
  v2 = (void *)sharedManager_sharedInstance;
  sharedManager_sharedInstance = v1;

}

@end
