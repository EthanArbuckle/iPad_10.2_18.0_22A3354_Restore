@implementation PXSearchParsecAnalyticsUtilities

+ (id)descriptionForSearchString:(id)a3 searchTokens:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  _QWORD v28[4];
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length") || objc_msgSend(v7, "count"))
  {
    v8 = objc_msgSend(a1, "_wordCountForSearchString:", v6);
    objc_msgSend(a1, "_tokenCategoryTypesForSearchTokens:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = CFSTR("cc");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v10;
    v28[1] = CFSTR("wc");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v11;
    v28[2] = CFSTR("tc");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = CFSTR("tt");
    v29[2] = v12;
    v29[3] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v13, 0, &v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v21;
    if (v15)
    {
      PLSearchUIParsecAnalyticsGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v23 = v15;
        v24 = 2112;
        v25 = v6;
        v26 = 2112;
        v27 = v7;
        _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "Error serializing search characteristics: %@ for search string: %@, search tokens: %@", buf, 0x20u);
      }

    }
    if (v14)
      v17 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v14, 4);
    else
      v17 = 0;
    v18 = &stru_1E5149688;
    if (v17)
      v18 = v17;
    v19 = v18;

  }
  else
  {
    v19 = &stru_1E5149688;
  }

  return v19;
}

+ (id)SFSearchResultFromSearchResultObject:(id)a3 queryId:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchParsecAnalyticsUtilities.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResultObject"));

  }
  objc_msgSend(a1, "_baseSFSearchResultForQueryId:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_legacySearchResultDescriptionForSearchResultObject:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.photos"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setResultBundleId:", v10);
  objc_msgSend(v8, "setSectionBundleIdentifier:", v10);
  objc_msgSend(a1, "_identifierForSearchResultObject:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdentifier:", v11);

  return v8;
}

+ (id)SFSearchResultFromAssetUUID:(id)a3 isTopResult:(BOOL)a4 queryId:(int64_t)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v6 = a4;
  v8 = a3;
  objc_msgSend(a1, "_baseSFSearchResultForQueryId:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("AssetResult");
  if (v6)
    v10 = CFSTR("TopAssetResult");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.photos"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setResultBundleId:", v11);
  objc_msgSend(v9, "setSectionBundleIdentifier:", v11);
  objc_msgSend(v9, "setIdentifier:", v8);

  return v9;
}

+ (id)SFSearchResultFromCollectionIdentifier:(id)a3 type:(unint64_t)a4 queryId:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a3;
  objc_msgSend(a1, "_baseSFSearchResultForQueryId:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_searchResultDescriptionForSearchResultType:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.photos"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setResultBundleId:", v11);
  objc_msgSend(v9, "setSectionBundleIdentifier:", v11);
  objc_msgSend(v9, "setIdentifier:", v8);

  return v9;
}

+ (id)SFSearchResultFromZeroKeyword:(id)a3 queryId:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchParsecAnalyticsUtilities.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("zkw"));

  }
  objc_msgSend(a1, "_baseSFSearchResultForQueryId:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_searchResultDescriptionForZeroKeyword:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.photos.zkw"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setResultBundleId:", v10);
  objc_msgSend(v8, "setSectionBundleIdentifier:", v10);
  objc_msgSend(a1, "_identifierForZeroKeyword:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdentifier:", v11);

  return v8;
}

+ (id)SFSearchResultFromUISearchToken:(id)a3 queryId:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v11;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchParsecAnalyticsUtilities.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchToken"));

  }
  objc_msgSend(v7, "representedObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "legacySFSearchResultFromSearchSuggestion:queryId:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)SFSearchResultFromSearchSuggestion:(id)a3 queryId:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchParsecAnalyticsUtilities.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchSuggestion"));

  }
  objc_msgSend(a1, "_baseSFSearchResultForQueryId:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_descriptionForSearchToken:", objc_msgSend(v7, "categoriesType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.photos.suggestions"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_identifierForSearchSuggestion:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdentifier:", v11);

  objc_msgSend(v8, "setResultBundleId:", v10);
  objc_msgSend(v8, "setSectionBundleIdentifier:", CFSTR("com.apple.photos.suggestions"));
  objc_msgSend(v8, "setResultType:", CFSTR("suggestion"));

  return v8;
}

+ (id)legacySFSearchResultFromSearchSuggestion:(id)a3 queryId:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchParsecAnalyticsUtilities.m"), 139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchSuggestion"));

  }
  objc_msgSend(a1, "_baseSFSearchResultForQueryId:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_legacyDescriptionForSearchToken:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.photos.suggestions"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_legacyIdentifierForSearchSuggestion:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdentifier:", v11);

  objc_msgSend(v8, "setResultBundleId:", v10);
  objc_msgSend(v8, "setSectionBundleIdentifier:", CFSTR("com.apple.photos.suggestions"));
  objc_msgSend(v8, "setResultType:", CFSTR("suggestion"));

  return v8;
}

+ (id)SFSearchResultFromRecentSearchText:(id)a3 recentSearchSuggestions:(id)a4 queryId:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a1, "_baseSFSearchResultForQueryId:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.photos.zkw"), CFSTR("recentSearch"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setResultBundleId:", v11);
  objc_msgSend(v10, "setSectionBundleIdentifier:", v11);
  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = objc_msgSend(v9, "hash");

  v14 = objc_msgSend(v8, "hash");
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%lu%lu"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIdentifier:", v15);

  objc_msgSend(v10, "setResultType:", CFSTR("recentSearch"));
  return v10;
}

+ (id)_resultRankingFeedbacksFromSFSearchResults:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  if (objc_msgSend(v3, "count"))
  {
    v5 = 0;
    v6 = MEMORY[0x1E0C9AA60];
    do
    {
      v7 = objc_alloc(MEMORY[0x1E0D8C648]);
      objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithResult:hiddenResults:duplicateResults:localResultPosition:", v8, v6, v6, ++v5);

      objc_msgSend(v4, "addObject:", v9);
    }
    while (v5 < objc_msgSend(v3, "count"));
  }
  v10 = (void *)objc_msgSend(v4, "copy");

  return v10;
}

+ (id)commandFeedbackFromSFSearchResult:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0D8C298];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = objc_alloc_init(MEMORY[0x1E0D8C218]);
  v7 = objc_alloc_init(MEMORY[0x1E0D8C1E0]);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C2A8]), "initWithCommand:cardSection:result:button:", v5, v6, v4, v7);

  objc_msgSend(v8, "setTriggerEvent:", 2);
  return v8;
}

+ (id)sectionRankingFeedbackWithSearchSuggestions:(id)a3 searchResultSections:(id)a4 visibleIndexPaths:(id)a5 queryId:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  int64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  id v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v10, "count"))
  {
    if (v10)
      v14 = v10;
    else
      v14 = (id)MEMORY[0x1E0C9AA60];
    objc_msgSend(a1, "_resultSectionForSearchSuggestions:queryId:", v14, a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSearchParsecAnalyticsUtilities _sectionRankingFeedbackWithResultSection:localSectionPosition:](PXSearchParsecAnalyticsUtilities, "_sectionRankingFeedbackWithResultSection:localSectionPosition:", v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v16);

  }
  if (objc_msgSend(v11, "count"))
  {
    v30 = v12;
    objc_msgSend(a1, "_visibleIndexPathsForSearchResultsFromVisibleIndexPaths:queryHasSuggestions:", v12, objc_msgSend(v10, "count") != 0);
    v31 = v10;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v10, "count") != 0;
    if (objc_msgSend(v11, "count"))
    {
      v18 = 0;
      do
      {
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v19 = v32;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v20)
        {
          v21 = v13;
          v22 = a6;
          v23 = *(_QWORD *)v34;
          while (2)
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v34 != v23)
                objc_enumerationMutation(v19);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "section") == v18)
              {
                v20 = 1;
                goto LABEL_19;
              }
            }
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
            if (v20)
              continue;
            break;
          }
LABEL_19:
          a6 = v22;
          v13 = v21;
        }

        objc_msgSend(v11, "objectAtIndexedSubscript:", v18);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "resultSectionForSearchSection:sectionIsVisible:queryId:", v25, v20, a6);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1, "_sectionRankingFeedbackWithResultSection:localSectionPosition:", v26, ++v18 + v17);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v27);

      }
      while (v18 < objc_msgSend(v11, "count"));
    }

    v12 = v30;
    v10 = v31;
  }
  v28 = (void *)objc_msgSend(v13, "copy");

  return v28;
}

+ (id)visibleSFSearchResultsFromSearchSuggestions:(id)a3 searchResultSections:(id)a4 visibleIndexPaths:(id)a5 queryId:(int64_t)a6
{
  id v8;
  id v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t j;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  void *v40;
  id v41;
  id v42;
  void *v43;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  unint64_t v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v41 = a4;
  v42 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v8, "count"))
  {
    v10 = 0;
    do
    {
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v11 = v42;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v51 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
            if (!objc_msgSend(v16, "section") && objc_msgSend(v16, "row") == v10)
            {
              objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "legacySFSearchResultFromSearchSuggestion:queryId:", v17, a6);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObject:", v18);

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
        }
        while (v13);
      }

      ++v10;
    }
    while (v10 < objc_msgSend(v8, "count"));
  }
  objc_msgSend(a1, "_visibleIndexPathsForSearchResultsFromVisibleIndexPaths:queryHasSuggestions:", v42, objc_msgSend(v8, "count", v8) != 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v41;
  if (objc_msgSend(v41, "count"))
  {
    for (j = 0; j < objc_msgSend(v41, "count"); ++j)
    {
      objc_msgSend(v19, "objectAtIndexedSubscript:", j);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "results");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      if (!v23)
        goto LABEL_34;
      v24 = 0;
      do
      {
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v25 = v43;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
        if (!v26)
          goto LABEL_33;
        v27 = v26;
        v28 = *(_QWORD *)v47;
        do
        {
          for (k = 0; k != v27; ++k)
          {
            if (*(_QWORD *)v47 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * k);
            if (objc_msgSend(v30, "section") == j && objc_msgSend(v30, "row") == v24)
            {
              objc_msgSend(v21, "results");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "count");

              if (v24 < v32)
              {
                objc_msgSend(v21, "results");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "objectAtIndexedSubscript:", v24);
                v34 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(a1, "SFSearchResultFromSearchResultObject:queryId:", v34, a6);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "addObject:", v35);
                goto LABEL_29;
              }
              PLSearchUIParsecAnalyticsGetLog();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v21, "results");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218242;
                v55 = v24;
                v56 = 2112;
                v57 = v35;
                _os_log_impl(&dword_1A6789000, v34, OS_LOG_TYPE_ERROR, "Accessed result at out of bounds index:%lu for section results when reporting visible search results to parsec: %@.", buf, 0x16u);
LABEL_29:

              }
              continue;
            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
        }
        while (v27);
LABEL_33:

        ++v24;
        objc_msgSend(v21, "results");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "count");

      }
      while (v24 < v37);
LABEL_34:

      v19 = v41;
    }
  }
  v38 = (void *)objc_msgSend(v9, "copy");

  return v38;
}

+ (id)sectionRankingFeedbackWithSearchZeroKeywordSections:(id)a3 visibleIndexPaths:(id)a4 queryId:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  if (objc_msgSend(v8, "count"))
  {
    v11 = 0;
    do
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v12 = v9;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v21;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v21 != v14)
              objc_enumerationMutation(v12);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "section") == v11)
            {
              v13 = 1;
              goto LABEL_13;
            }
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v13)
            continue;
          break;
        }
      }
LABEL_13:

      objc_msgSend(v8, "objectAtIndexedSubscript:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_resultSectionForZeroKeywordSection:sectionIsVisible:queryId:", v16, v13, a5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_sectionRankingFeedbackWithResultSection:localSectionPosition:", v17, ++v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v18);

    }
    while (v11 < objc_msgSend(v8, "count"));
  }

  return v10;
}

+ (id)visibleSFSearchResultsFromZeroKeywordSections:(id)a3 visibleIndexPaths:(id)a4 queryId:(int64_t)a5
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v27;
  id v28;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  unint64_t v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v28 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v6, "count"))
  {
    v8 = 0;
    v27 = v6;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8, v27);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "viewModels");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (!v11)
        goto LABEL_21;
      v12 = 0;
      do
      {
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v13 = v28;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (!v14)
          goto LABEL_20;
        v15 = v14;
        v16 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v32 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            if (objc_msgSend(v18, "section") == v8 && objc_msgSend(v18, "row") == v12)
            {
              objc_msgSend(v9, "viewModels");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "count");

              if (v12 < v20)
              {
                objc_msgSend(v9, "viewModels");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "objectAtIndexedSubscript:", v12);
                v22 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(a1, "SFSearchResultFromZeroKeyword:queryId:", v22, a5);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "addObject:", v23);
                goto LABEL_16;
              }
              PLSearchUIParsecAnalyticsGetLog();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v9, "viewModels");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218242;
                v36 = v12;
                v37 = 2112;
                v38 = v23;
                _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_ERROR, "Accessed result at out of bounds index:%lu for section zero keywords when reporting visible zero keywords to parsec: %@.", buf, 0x16u);
LABEL_16:

              }
              continue;
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        }
        while (v15);
LABEL_20:

        ++v12;
        objc_msgSend(v9, "viewModels");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "count");

      }
      while (v12 < v25);
LABEL_21:

      ++v8;
      v6 = v27;
    }
    while (v8 < objc_msgSend(v27, "count"));
  }

  return v7;
}

+ (id)SFSearchResultFromSearchSuggestion:(id)a3 zeroKeyword:(id)a4 queryId:(int64_t)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchParsecAnalyticsUtilities.m"), 329, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchSuggestion"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchParsecAnalyticsUtilities.m"), 330, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("zeroKeyword"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(a1, "_baseSFSearchResultForQueryId:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_searchResultDescriptionForZeroKeyword:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.photos.zkw"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_legacyIdentifierForSearchSuggestion:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIdentifier:", v15);

  objc_msgSend(v12, "setResultBundleId:", v14);
  objc_msgSend(v12, "setSectionBundleIdentifier:", CFSTR("com.apple.photos.zkw"));
  objc_msgSend(v12, "setResultType:", CFSTR("zkw"));

  return v12;
}

+ (id)legacyDescriptionForSearchString:(id)a3 searchTokens:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  _QWORD v28[4];
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length") || objc_msgSend(v7, "count"))
  {
    v8 = objc_msgSend(a1, "_wordCountForSearchString:", v6);
    objc_msgSend(a1, "_legacyTokenCategoryTypesForSearchTokens:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = CFSTR("cc");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v10;
    v28[1] = CFSTR("wc");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v11;
    v28[2] = CFSTR("tc");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = CFSTR("tt");
    v29[2] = v12;
    v29[3] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v13, 0, &v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v21;
    if (v15)
    {
      PLSearchUIParsecAnalyticsGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v23 = v15;
        v24 = 2112;
        v25 = v6;
        v26 = 2112;
        v27 = v7;
        _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "Error serializing search characteristics: %@ for search string: %@, search tokens: %@", buf, 0x20u);
      }

    }
    if (v14)
      v17 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v14, 4);
    else
      v17 = 0;
    v18 = &stru_1E5149688;
    if (v17)
      v18 = v17;
    v19 = v18;

  }
  else
  {
    v19 = &stru_1E5149688;
  }

  return v19;
}

+ (id)resultSectionForSearchSection:(id)a3 sectionIsVisible:(BOOL)a4 queryId:(int64_t)a5
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v22 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  objc_msgSend(v24, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        +[PXSearchParsecAnalyticsUtilities SFSearchResultFromSearchResultObject:queryId:](PXSearchParsecAnalyticsUtilities, "SFSearchResultFromSearchResultObject:queryId:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), a5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v7, "addObject:", v13);
        }
        else
        {
          PLSearchUIParsecAnalyticsGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v30 = 0;
            _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "Error translating PXSearchResultObject: %@ into an SFSearchResult", buf, 0xCu);
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v10);
  }

  v15 = objc_alloc_init(MEMORY[0x1E0D8C650]);
  objc_msgSend(v15, "setResults:", v7);
  objc_msgSend(v24, "visibleResultIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMaxInitiallyVisibleResults:", objc_msgSend(v16, "count"));

  objc_msgSend(v15, "setIsInitiallyHidden:", !v22);
  v17 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "_descriptionForSectionType:", objc_msgSend(v24, "type"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.photos"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setIdentifier:", v19);

  objc_msgSend(v15, "setBundleIdentifier:", CFSTR("com.apple.photos"));
  if (objc_msgSend(v24, "type") == 17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v24, "allAssetResultUUIDs");
      v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTotalAvailableResults:", -[NSObject count](v20, "count"));
    }
    else
    {
      PLSearchUIParsecAnalyticsGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v24;
        _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "Encountered unexpected class type for assets section: %@, expecting PXNewSearchResultAssetsSection, cannot report totalAvailableResults to parsec", buf, 0xCu);
      }
    }

  }
  return v15;
}

+ (id)_baseSFSearchResultForQueryId:(int64_t)a3
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0D8C6A8]);
  objc_msgSend(v4, "setUserInput:", CFSTR("photos"));
  objc_msgSend(v4, "setApplicationBundleIdentifier:", CFSTR("com.apple.photos"));
  objc_msgSend(v4, "setQueryId:", a3);
  return v4;
}

+ (id)_resultSectionForSearchSuggestions:(id)a3 queryId:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v20;
    *(_QWORD *)&v9 = 138412290;
    v18 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        +[PXSearchParsecAnalyticsUtilities legacySFSearchResultFromSearchSuggestion:queryId:](PXSearchParsecAnalyticsUtilities, "legacySFSearchResultFromSearchSuggestion:queryId:", v13, a4, v18, (_QWORD)v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v6, "addObject:", v14);
        }
        else
        {
          PLSearchUIParsecAnalyticsGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            v24 = v13;
            _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "Error translating PXNewSearchToken: %@ into an SFSearchResult", buf, 0xCu);
          }

        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v10);
  }

  v16 = objc_alloc_init(MEMORY[0x1E0D8C650]);
  objc_msgSend(v16, "setResults:", v6);
  objc_msgSend(v16, "setMaxInitiallyVisibleResults:", 0);
  objc_msgSend(v16, "setIsInitiallyHidden:", 0);
  objc_msgSend(v16, "setIdentifier:", CFSTR("com.apple.photos.suggestions"));
  objc_msgSend(v16, "setBundleIdentifier:", CFSTR("com.apple.photos"));

  return v16;
}

+ (id)_resultSectionForZeroKeywordSection:(id)a3 sectionIsVisible:(BOOL)a4 queryId:(int64_t)a5
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v20 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  objc_msgSend(v22, "viewModels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        +[PXSearchParsecAnalyticsUtilities SFSearchResultFromZeroKeyword:queryId:](PXSearchParsecAnalyticsUtilities, "SFSearchResultFromZeroKeyword:queryId:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), a5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v7, "addObject:", v13);
        }
        else
        {
          PLSearchUIParsecAnalyticsGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v28 = 0;
            _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "Error translating ZeroKeyword: %@ into an SFSearchResult", buf, 0xCu);
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v10);
  }

  v15 = objc_alloc_init(MEMORY[0x1E0D8C650]);
  objc_msgSend(v15, "setResults:", v7);
  objc_msgSend(v15, "setIsInitiallyHidden:", !v20);
  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "_descriptionForZeroKeywordSectionType:", objc_msgSend(v22, "sectionType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.photos"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setIdentifier:", v18);

  objc_msgSend(v15, "setBundleIdentifier:", CFSTR("com.apple.photos"));
  return v15;
}

+ (id)_sectionRankingFeedbackWithResultSection:(id)a3 localSectionPosition:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(v6, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_resultRankingFeedbacksFromSFSearchResults:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C6D8]), "initWithResults:section:localSectionPosition:personalizationScore:", v8, v6, a4, 0.0);
  return v9;
}

+ (id)_tokenCategoryTypesForSearchTokens:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "_descriptionForSearchToken:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "categoriesType", (_QWORD)v14));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

+ (id)_legacyTokenCategoryTypesForSearchTokens:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "representedObject", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_legacyDescriptionForSearchToken:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

+ (id)_searchResultDescriptionForSearchResultType:(unint64_t)a3
{
  if (a3 > 6)
    return 0;
  else
    return off_1E512BA50[a3];
}

+ (id)_legacySearchResultDescriptionForSearchResultObject:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  __CFString *v8;

  v4 = a3;
  switch(objc_msgSend(v4, "type"))
  {
    case 1:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_6;
      objc_msgSend(a1, "_descriptionForAssetAggregationSearchResult:", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_6;
      objc_msgSend(a1, "_descriptionForCollectionSearchResult:", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      v6 = v5;
      break;
    case 3:
      v7 = objc_msgSend(v4, "subtype");
      v8 = CFSTR("People");
      if (v7 == 1)
        v8 = CFSTR("PersonalRelationship");
      v5 = v8;
      goto LABEL_10;
    case 4:
      v6 = CFSTR("Pet");
      break;
    case 5:
      v6 = CFSTR("TopResults");
      break;
    default:
LABEL_6:
      v6 = 0;
      break;
  }

  return v6;
}

+ (id)_searchResultDescriptionForZeroKeyword:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  int v10;
  const __CFString *v11;

  v3 = a3;
  v4 = CFSTR("SocialGroup");
  switch(objc_msgSend(v3, "itemType"))
  {
    case 0:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v3, "person");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "name");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "length");

        v8 = &stru_1E5149688;
        if (!v7)
          v8 = CFSTR("Unnamed");
        v9 = v8;
        v10 = objc_msgSend(v5, "detectionType");
        v11 = CFSTR("Person");
        if (v10 == 2)
          v11 = CFSTR("Pet");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v9, v11);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v4 = CFSTR("Unknown");
      }
      break;
    case 2:
      v4 = CFSTR("Place");
      break;
    case 3:
      v4 = CFSTR("Scene");
      break;
    case 4:
      v4 = CFSTR("Holiday");
      break;
    case 5:
      v4 = CFSTR("Meaning");
      break;
    case 6:
      v4 = CFSTR("Home");
      break;
    case 7:
      v4 = CFSTR("Date");
      break;
    case 8:
      v4 = CFSTR("Season");
      break;
    default:
      break;
  }

  return v4;
}

+ (id)_descriptionForAssetAggregationSearchResult:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "subtype");
  if ((unint64_t)(v3 - 1) > 0xD)
    return 0;
  else
    return off_1E512BA88[v3 - 1];
}

+ (id)_descriptionForCollectionSearchResult:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "subtype");
  if ((unint64_t)(v3 - 1) > 2)
    return 0;
  else
    return off_1E512BAF8[v3 - 1];
}

+ (id)_descriptionForSearchToken:(unint64_t)a3
{
  if (a3 > 0x29)
    return 0;
  else
    return off_1E512BB10[a3];
}

+ (id)_legacyDescriptionForSearchToken:(id)a3
{
  id v3;
  const __CFString *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = 0;
  switch(objc_msgSend(v3, "searchUserCategory"))
  {
    case 0:
      v4 = CFSTR("Generic");
      break;
    case 1:
      objc_msgSend(v3, "queryToken");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "searchedCategories");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v6, "containsIndex:", 1301))
        v4 = CFSTR("PersonalRelationship");
      else
        v4 = CFSTR("Person");

      break;
    case 2:
      v4 = CFSTR("Contributor");
      break;
    case 3:
      v4 = CFSTR("SharedLibrary");
      break;
    case 4:
    case 5:
      v4 = CFSTR("SocialGroup");
      break;
    case 6:
    case 7:
      v4 = CFSTR("Pet");
      break;
    case 8:
      v4 = CFSTR("Date");
      break;
    case 9:
      v4 = CFSTR("Place");
      break;
    case 10:
      v4 = CFSTR("Home");
      break;
    case 11:
      v4 = CFSTR("Work");
      break;
    case 12:
      v4 = CFSTR("Favorite");
      break;
    case 13:
      v4 = CFSTR("Tag");
      break;
    case 14:
      v4 = CFSTR("OCR");
      break;
    case 15:
      v4 = CFSTR("OCRTextFound");
      break;
    case 16:
      v4 = CFSTR("Album");
      break;
    case 17:
      v4 = CFSTR("Memory");
      break;
    case 18:
      v4 = CFSTR("Image");
      break;
    case 19:
      v4 = CFSTR("Video");
      break;
    case 20:
      v4 = CFSTR("Raw");
      break;
    case 21:
      v4 = CFSTR("CinematicVideo");
      break;
    case 22:
      v4 = CFSTR("ProRes");
      break;
    case 23:
      v4 = CFSTR("Slomo");
      break;
    case 24:
      v4 = CFSTR("LivePhoto");
      break;
    case 25:
      v4 = CFSTR("Screenshot");
      break;
    case 26:
      v4 = CFSTR("Panorama");
      break;
    case 27:
      v4 = CFSTR("Timelapse");
      break;
    case 28:
      v4 = CFSTR("ScreenRecording");
      break;
    case 29:
      v4 = CFSTR("LongExposure");
      break;
    case 30:
      v4 = CFSTR("Animated");
      break;
    case 31:
      v4 = CFSTR("Burst");
      break;
    case 32:
      v4 = CFSTR("Portrait");
      break;
    case 33:
      v4 = CFSTR("LivePortrait");
      break;
    case 34:
      v4 = CFSTR("Selfie");
      break;
    case 36:
      v4 = CFSTR("ImportedByApp");
      break;
    case 37:
      v4 = CFSTR("CameraMakeAndModel");
      break;
    case 38:
      v4 = CFSTR("AudioClassification");
      break;
    default:
      break;
  }

  return (id)v4;
}

+ (id)_descriptionForSectionType:(unint64_t)a3
{
  if (a3 - 1 > 0x11)
    return 0;
  else
    return off_1E512BC60[a3 - 1];
}

+ (id)_descriptionForZeroKeywordSectionType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return CFSTR("Moments");
  else
    return off_1E512BCF0[a3 - 1];
}

+ (unint64_t)_wordCountForSearchString:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (id)*MEMORY[0x1E0CCE0E8];
    v15[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCE168]), "initWithTagSchemes:", v5);
    objc_msgSend(v6, "setString:", v3);
    v7 = objc_msgSend(v3, "length");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__PXSearchParsecAnalyticsUtilities__wordCountForSearchString___block_invoke;
    v10[3] = &unk_1E512BA30;
    v10[4] = &v11;
    objc_msgSend(v6, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v7, 0, v4, 6, v10);
    v8 = v12[3];

  }
  else
  {
    v8 = v12[3];
  }
  _Block_object_dispose(&v11, 8);

  return v8;
}

+ (id)_identifierForSearchSuggestion:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v3, "hash"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    PLSearchUIParsecAnalyticsGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Error constructing identifier for search suggestion: %@", buf, 0xCu);
    }

  }
  return v4;
}

+ (id)_legacyIdentifierForSearchSuggestion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "queryToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v5, "hash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "length"))
  {
    PLSearchUIParsecAnalyticsGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v3;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Error constructing identifier for search suggestion: %@", buf, 0xCu);
    }

  }
  return v6;
}

+ (id)_identifierForSearchResultObject:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "personUUID");
  else
    objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_identifierForZeroKeyword:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "representedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v4, "hash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
    PLSearchUIParsecAnalyticsGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Error constructing identifier for Zero Keyword: %@", buf, 0xCu);
    }

  }
  return v5;
}

+ (id)_visibleIndexPathsForSearchResultsFromVisibleIndexPaths:(id)a3 queryHasSuggestions:(BOOL)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t v17[16];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v12, "section"))
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v12, "row"), objc_msgSend(v12, "section") - 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);

        }
        else if (!a4)
        {
          PLSearchUIParsecAnalyticsGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v17 = 0;
            _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "Error interpreting visible index paths, this will likely result in incorrect visible results reported to parsec.", v17, 2u);
          }

          v14 = v7;
          goto LABEL_15;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        continue;
      break;
    }
  }

  v14 = (void *)objc_msgSend(v6, "copy");
LABEL_15:

  return v14;
}

uint64_t __62__PXSearchParsecAnalyticsUtilities__wordCountForSearchString___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0CCE108]);
  if ((_DWORD)result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
