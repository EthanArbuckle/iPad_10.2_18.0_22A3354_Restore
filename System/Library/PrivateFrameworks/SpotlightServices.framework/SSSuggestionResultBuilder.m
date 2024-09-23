@implementation SSSuggestionResultBuilder

+ (id)buildResultWithResult:(id)a3 queryContext:(id)a4
{
  id v5;
  id v6;
  SSSuggestionResultBuilder *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[SSSuggestionResultBuilder initWithResult:queryContext:]([SSSuggestionResultBuilder alloc], "initWithResult:queryContext:", v6, v5);

  -[SSSuggestionResultBuilder buildResult](v7, "buildResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearBackendData");

  return v8;
}

- (SSSuggestionResultBuilder)initWithResult:(id)a3 queryContext:(id)a4
{
  id v6;
  id v7;
  SSSuggestionResultBuilder *v8;
  SSSuggestionResultBuilder *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SSSuggestionResultBuilder;
  v8 = -[SSSuggestionResultBuilder init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    -[SSResultBuilder setQueryContext:](v8, "setQueryContext:", v7);
    objc_msgSend(v7, "searchString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SPSearchSuggestionResult searchSuggestionRankingResultWithResult:query:sectionBundleIdentifier:queryId:](SPSearchSuggestionResult, "searchSuggestionRankingResultWithResult:query:sectionBundleIdentifier:queryId:", v6, v10, CFSTR("com.apple.searchd.suggestions"), objc_msgSend(v7, "queryIdent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSResultBuilder setResult:](v9, "setResult:", v11);

    -[SSResultBuilder result](v9, "result");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "searchEntities");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSSuggestionResultBuilder setEntity:](v9, "setEntity:", v14);

    -[SSResultBuilder result](v9, "result");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "completion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[SSResultBuilder result](v9, "result");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "completion");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSSuggestionResultBuilder setSuggestionString:](v9, "setSuggestionString:", v18);

      -[SSSuggestionResultBuilder suggestionString](v9, "suggestionString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSResultBuilder setMatchedStrings:](v9, "setMatchedStrings:", v20);

    }
  }

  return v9;
}

+ (id)buildResultWithSuggestion:(id)a3 queryContext:(id)a4
{
  id v5;
  id v6;
  SSSuggestionResultBuilder *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[SSSuggestionResultBuilder initWithSuggestion:queryContext:]([SSSuggestionResultBuilder alloc], "initWithSuggestion:queryContext:", v6, v5);

  -[SSSuggestionResultBuilder buildResult](v7, "buildResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearBackendData");

  return v8;
}

- (SSSuggestionResultBuilder)initWithSuggestion:(id)a3 queryContext:(id)a4
{
  id v6;
  id v7;
  SSSuggestionResultBuilder *v8;
  SSSuggestionResultBuilder *v9;
  void *v10;
  void *v11;
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
  objc_super v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SSSuggestionResultBuilder;
  v8 = -[SSSuggestionResultBuilder init](&v23, sel_init);
  v9 = v8;
  if (v8)
  {
    -[SSResultBuilder setQueryContext:](v8, "setQueryContext:", v7);
    objc_msgSend(v6, "suggestion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[SSSuggestionResultBuilder setSuggestionString:](v9, "setSuggestionString:", v10);
    }
    else
    {
      objc_msgSend(v7, "searchString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSSuggestionResultBuilder setSuggestionString:](v9, "setSuggestionString:", v11);

    }
    objc_msgSend(v7, "searchString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SPSearchSuggestionResult searchSuggestionRankingResultWithSuggestion:query:sectionBundleIdentifier:queryId:](SPSearchSuggestionResult, "searchSuggestionRankingResultWithSuggestion:query:sectionBundleIdentifier:queryId:", v6, v12, CFSTR("com.apple.searchd.suggestions"), objc_msgSend(v7, "queryIdent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSResultBuilder setResult:](v9, "setResult:", v13);

    -[SSResultBuilder result](v9, "result");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "searchEntities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSSuggestionResultBuilder setEntity:](v9, "setEntity:", v16);

    -[SSSuggestionResultBuilder entity](v9, "entity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_msgSend(v6, "suggestion");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[SPSearchEntity searchEntityWithSearchString:spotlightQueryString:preferredBundleIDs:](SPSearchEntity, "searchEntityWithSearchString:spotlightQueryString:preferredBundleIDs:", v18, 0, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSSuggestionResultBuilder setEntity:](v9, "setEntity:", v19);

    }
    -[SSSuggestionResultBuilder setSuggestion:](v9, "setSuggestion:", v6);
    -[SSSuggestionResultBuilder suggestionString](v9, "suggestionString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSResultBuilder setMatchedStrings:](v9, "setMatchedStrings:", v21);

  }
  return v9;
}

+ (id)buildResultWithSpotlightSuggestion:(id)a3 queryContext:(id)a4
{
  id v5;
  id v6;
  SSSuggestionResultBuilder *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "suggestionKind") == 2)
  {
    v7 = -[SSSuggestionResultBuilder initWithSpotlightSuggestion:queryContext:]([SSSuggestionResultBuilder alloc], "initWithSpotlightSuggestion:queryContext:", v5, v6);
    -[SSSuggestionResultBuilder buildResult](v7, "buildResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)buildResultsWithCompletionsData:(id)a3 queryContext:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  SSSuggestionResultBuilder *v23;
  void *v24;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  const __CFString *v33;
  _QWORD v34[3];

  v34[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    if ((isMacOS() & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      SSBundlesDonatingPhotos();
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CA6B70], "emptySuggestion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CA6B70];
    objc_msgSend(v6, "searchString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updatedSuggestionWithCurrentSuggestion:userString:tokens:", v9, v11, MEMORY[0x1E0C9AA60]);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0CA6B70];
    objc_msgSend(v6, "searchString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = CFSTR("photosBundleIDs");
    v34[0] = v7;
    v27 = (void *)v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)v12;
    objc_msgSend(v13, "suggestionsWithCurrentSuggestion:userQueryString:completionData:options:", v12, v14, v5, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (objc_msgSend(v22, "suggestionKind") == 2)
          {
            v23 = -[SSSuggestionResultBuilder initWithSpotlightSuggestion:queryContext:]([SSSuggestionResultBuilder alloc], "initWithSpotlightSuggestion:queryContext:", v22, v6);
            -[SSSuggestionResultBuilder buildResult](v23, "buildResult");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
              objc_msgSend(v8, "addObject:", v24);

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v19);
    }

  }
  else
  {
    v8 = (id)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

+ (id)buildResultsWithSuggestionsData:(id)a3 queryContext:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  SSSuggestionResultBuilder *v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = (void *)MEMORY[0x1E0CA6B70];
    objc_msgSend(MEMORY[0x1E0CA6B70], "emptySuggestion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "searchString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updatedSuggestionWithCurrentSuggestion:userString:tokens:", v9, v10, MEMORY[0x1E0C9AA60]);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0CA6B70];
    objc_msgSend(v6, "searchString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)v11;
    objc_msgSend(v12, "suggestionsWithCurrentSuggestion:userQueryString:suggestionData:options:", v11, v13, v5, MEMORY[0x1E0C9AA70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (objc_msgSend(v20, "suggestionKind") == 2)
          {
            v21 = -[SSSuggestionResultBuilder initWithSpotlightSuggestion:queryContext:]([SSSuggestionResultBuilder alloc], "initWithSpotlightSuggestion:queryContext:", v20, v6);
            -[SSSuggestionResultBuilder buildResult](v21, "buildResult");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
              objc_msgSend(v7, "addObject:", v22);

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v17);
    }

  }
  else
  {
    v7 = (id)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (SSSuggestionResultBuilder)initWithSpotlightSuggestion:(id)a3 queryContext:(id)a4
{
  id v6;
  id v7;
  SSSuggestionResultBuilder *v8;
  SSSuggestionResultBuilder *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SSSuggestionResultBuilder;
  v8 = -[SSSuggestionResultBuilder init](&v20, sel_init);
  v9 = v8;
  if (v8)
  {
    -[SSResultBuilder setQueryContext:](v8, "setQueryContext:", v7);
    objc_msgSend(v7, "searchString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSSuggestionResultBuilder setSuggestionString:](v9, "setSuggestionString:", v10);

    objc_msgSend(v7, "searchString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SPSearchSuggestionResult searchSuggestionRankingResultWithSpotlightSuggestion:query:sectionBundleIdentifier:queryId:](SPSearchSuggestionResult, "searchSuggestionRankingResultWithSpotlightSuggestion:query:sectionBundleIdentifier:queryId:", v6, v11, CFSTR("com.apple.searchd.suggestions"), objc_msgSend(v7, "queryIdent"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSResultBuilder setResult:](v9, "setResult:", v12);

    -[SSResultBuilder result](v9, "result");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "searchEntities");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSSuggestionResultBuilder setEntity:](v9, "setEntity:", v15);

    -[SSSuggestionResultBuilder setSpotlightSuggestion:](v9, "setSpotlightSuggestion:", v6);
    -[SSResultBuilder result](v9, "result");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "completion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSResultBuilder setMatchedStrings:](v9, "setMatchedStrings:", v18);

  }
  return v9;
}

- (id)buildResult
{
  void *v2;
  void *v3;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  void *v24;
  void *v25;
  void *v26;

  -[SSSuggestionResultBuilder suggestion](self, "suggestion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    -[SSSuggestionResultBuilder spotlightSuggestion](self, "spotlightSuggestion");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v2 = (void *)v7;
      v6 = 0;
    }
    else
    {
      -[SSResultBuilder result](self, "result");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (SSResultTypeIsServer(objc_msgSend(v3, "type")))
      {

        goto LABEL_10;
      }
      v2 = 0;
      v6 = 1;
    }
  }
  -[SSResultBuilder result](self, "result");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inlineCard");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  if (!v5)

  if (!v9)
  {
    -[SSResultBuilder buildCompactCard](self, "buildCompactCard");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSResultBuilder result](self, "result");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCompactCard:", v18);

    -[SSResultBuilder buildInlineCard](self, "buildInlineCard");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSResultBuilder result](self, "result");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setInlineCard:", v20);

    -[SSResultBuilder buildPreviewButtonItems](self, "buildPreviewButtonItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSResultBuilder result](self, "result");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "inlineCard");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "cardSections");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setPreviewButtonItems:", v22);

LABEL_16:
    return -[SSResultBuilder result](self, "result");
  }
LABEL_10:
  -[SSResultBuilder result](self, "result");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inlineCard");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {

LABEL_15:
    -[SSResultBuilder buildInlineCard](self, "buildInlineCard");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSResultBuilder result](self, "result");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setInlineCard:", v22);
    goto LABEL_16;
  }
  v12 = (void *)v11;
  -[SSResultBuilder result](self, "result");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "inlineCard");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cardSections");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "command");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
    goto LABEL_15;
  return -[SSResultBuilder result](self, "result");
}

- (id)buildCompactCardSection
{
  return 0;
}

- (id)buildInlineCardSections
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  SSContactResultBuilder *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char IsServer;
  void *v42;
  uint64_t v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  SSContactResultBuilder *v57;
  void *v58;
  void *v59;
  void *v61;
  void *v62;
  void *v63;
  SSContactResultBuilder *v64;
  void *v65;
  _QWORD v66[2];

  v66[1] = *MEMORY[0x1E0C80C00];
  -[SSResultBuilder result](self, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") == 32)
  {
    v4 = 1;
  }
  else
  {
    -[SSResultBuilder result](self, "result");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "type") == 38;

  }
  -[SSSuggestionResultBuilder spotlightSuggestion](self, "spotlightSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[SSSuggestionResultBuilder suggestion](self, "suggestion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[SSSuggestionResultBuilder suggestion](self, "suggestion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v7, "type");
      -[SSSuggestionResultBuilder entity](self, "entity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isContactEntitySearch");

      if ((v17 & 0xFFFFFFFD) == 0xC)
        v20 = 4;
      else
        v20 = 3;
      if (v17 > 0xE || ((1 << v17) & 0x5800) == 0)
      {
        -[SSSuggestionResultBuilder entity](self, "entity");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isAppEntitySearch");

        if (v22)
          v20 = 2;
        else
          v20 = v19;
      }
      v9 = (void *)objc_opt_new();
      objc_msgSend(v7, "bundleIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBundleIdentifier:", v23);

      v24 = (SSContactResultBuilder *)objc_opt_new();
      -[SSSuggestionResultBuilder buildHighlightedTextForSuggestion](self, "buildHighlightedTextForSuggestion");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSContactResultBuilder setSuggestionText:](v24, "setSuggestionText:", v25);

      -[SSContactResultBuilder suggestionText](v24, "suggestionText");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setMaxLines:", 1);

      -[SSContactResultBuilder setSuggestionType:](v24, "setSuggestionType:", v20);
      v27 = (void *)MEMORY[0x1E0D8C660];
      objc_msgSend(v7, "detailText");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "textWithString:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSContactResultBuilder setDetailText:](v24, "setDetailText:", v29);

      v65 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSContactResultBuilder setPunchoutOptions:](v24, "setPunchoutOptions:", v30);

      -[SSSuggestionResultBuilder buildSymbolImage](self, "buildSymbolImage");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSContactResultBuilder setThumbnail:](v24, "setThumbnail:", v31);

      -[SSSuggestionResultBuilder buildCommand](self, "buildCommand");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSContactResultBuilder setCommand:](v24, "setCommand:", v32);

      v64 = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
      v33 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    if (v4)
    {
      -[SSSuggestionResultBuilder entity](self, "entity");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isContactEntitySearch");

      if (v35)
      {
        -[SSSuggestionResultBuilder entity](self, "entity");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }
      v9 = (void *)objc_opt_new();
      -[SSResultBuilder result](self, "result");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "resultBundleId");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBundleIdentifier:", v56);

      v57 = [SSContactResultBuilder alloc];
      -[SSResultBuilder result](self, "result");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contact");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[SSContactResultBuilder initWithResult:contactEntity:contact:](v57, "initWithResult:contactEntity:contact:", v58, v7, v59);

      -[SSResultBuilder buildCompactCardSection](v24, "buildCompactCardSection");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v48;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:

      goto LABEL_32;
    }
    -[SSResultBuilder result](self, "result");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "inlineCard");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "cardSections");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && (objc_msgSend(v7, "command"), v39 = (void *)objc_claimAutoreleasedReturnValue(), v39, !v39))
    {
      -[SSSuggestionResultBuilder buildCommand](self, "buildCommand");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCommand:", v61);

    }
    else
    {
      -[SSResultBuilder result](self, "result");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      IsServer = SSResultTypeIsServer(objc_msgSend(v40, "type"));

      if ((IsServer & 1) == 0)
      {
        v9 = (void *)objc_opt_new();
        -[SSSuggestionResultBuilder entity](self, "entity");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "symbolName");
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = (void *)v43;
        if (v43)
          v45 = (const __CFString *)v43;
        else
          v45 = CFSTR("magnifyingglass");
        objc_msgSend(v9, "setSymbolName:", v45);

        objc_msgSend(v9, "setIsTemplate:", 1);
        v24 = (SSContactResultBuilder *)objc_opt_new();
        -[SSResultBuilder result](self, "result");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "resultBundleId");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSContactResultBuilder setBundleIdentifier:](v24, "setBundleIdentifier:", v47);

        v48 = (void *)objc_opt_new();
        objc_msgSend(v48, "setThumbnail:", v9);
        objc_msgSend(v48, "setShouldUseCompactDisplay:", 1);
        v49 = (void *)MEMORY[0x1E0D8C660];
        -[SSSuggestionResultBuilder suggestionString](self, "suggestionString");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "textWithString:", v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setTitle:", v51);

        objc_msgSend(v48, "title");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setMaxLines:", 1);

        v53 = (void *)objc_opt_new();
        -[SSSuggestionResultBuilder suggestionString](self, "suggestionString");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setSearchString:", v54);

        objc_msgSend(v53, "setQuerySource:", 1);
        objc_msgSend(v48, "setCommand:", v53);
        v62 = v48;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_31;
      }
    }
    -[SSResultBuilder result](self, "result");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "inlineCard");
    v24 = (SSContactResultBuilder *)objc_claimAutoreleasedReturnValue();
    -[SSContactResultBuilder cardSections](v24, "cardSections");
    v33 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v15 = (void *)v33;
LABEL_32:

    goto LABEL_33;
  }
  v7 = (void *)objc_opt_new();
  -[SSSuggestionResultBuilder buildSymbolImage](self, "buildSymbolImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setThumbnail:", v8);

  objc_msgSend(v7, "setShouldUseCompactDisplay:", 1);
  -[SSSuggestionResultBuilder buildHighlightedTextForSuggestion](self, "buildHighlightedTextForSuggestion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSSuggestionResultBuilder entity](self, "entity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isPhotosEntitySearch");

  if (v11)
  {
    -[SSSuggestionResultBuilder buildPhotoTextAndGlyphForSuggestion:](self, "buildPhotoTextAndGlyphForSuggestion:", v9);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  objc_msgSend(v7, "setTitle:", v9);
  objc_msgSend(v7, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMaxLines:", 1);

  -[SSSuggestionResultBuilder buildCommand](self, "buildCommand");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCommand:", v14);

  v66[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:

  return v15;
}

- (id)buildSymbolImage
{
  void *v3;
  void *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char IsLocalSuggestion;
  void *v10;

  -[SSSuggestionResultBuilder entity](self, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "symbolName");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
LABEL_8:
      v10 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    -[SSSuggestionResultBuilder suggestion](self, "suggestion");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_8;
    v7 = (void *)v6;
    -[SSResultBuilder result](self, "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    IsLocalSuggestion = SSResultTypeIsLocalSuggestion(objc_msgSend(v8, "type"));

    if ((IsLocalSuggestion & 1) == 0)
      goto LABEL_8;
    v5 = CFSTR("magnifyingglass");
  }
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setSymbolName:", v5);
  objc_msgSend(v10, "setIsTemplate:", 1);

LABEL_9:
  return v10;
}

- (id)buildCommand
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v31;
  int IsLocalSuggestion;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  -[SSSuggestionResultBuilder spotlightSuggestion](self, "spotlightSuggestion");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[SSSuggestionResultBuilder entity](self, "entity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[SSSuggestionResultBuilder entity](self, "entity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "command");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      return v7;
    }
  }
  -[SSSuggestionResultBuilder suggestion](self, "suggestion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SSSuggestionResultBuilder suggestion](self, "suggestion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "type") != 12 && objc_msgSend(v9, "type") != 14)
    {
      -[SSResultBuilder result](self, "result");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      IsLocalSuggestion = SSResultTypeIsLocalSuggestion(objc_msgSend(v31, "type"));

      if (IsLocalSuggestion)
      {
        v7 = (void *)objc_opt_new();
        -[SSSuggestionResultBuilder entity](self, "entity");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "searchString");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setSearchString:", v34);

        objc_msgSend(v7, "setQuerySource:", 1);
      }
      else
      {
        v7 = 0;
      }
      goto LABEL_24;
    }
    v7 = (void *)objc_opt_new();
    -[SSResultBuilder result](self, "result");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString title](v10, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v7, "setSearchString:", v12);
    }
    else
    {
      -[SSSuggestionResultBuilder suggestionString](self, "suggestionString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSearchString:", v29);

    }
    goto LABEL_22;
  }
  -[SSSuggestionResultBuilder entity](self, "entity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isContactEntitySearch");

  if (v14)
  {
    -[SSSuggestionResultBuilder entity](self, "entity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_new();
    objc_msgSend(v9, "tokenText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTokenString:", v15);

    objc_msgSend(v9, "personQueryIdentifier");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v18 = &stru_1E6E549F0;
    if (v16)
      v18 = (__CFString *)v16;
    v10 = v18;

    objc_msgSend(v9, "contactIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v9, "contactIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[SPSearchContactEntity updatePersonQueryIdentifier:withContactIdentifier:](SPSearchContactEntity, "updatePersonQueryIdentifier:withContactIdentifier:", v10, v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v10 = (__CFString *)v21;
    }
    objc_msgSend(v9, "personIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v9, "personIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[SPSearchContactEntity updatePersonQueryIdentifier:withPersonIdentifier:](SPSearchContactEntity, "updatePersonQueryIdentifier:withPersonIdentifier:", v10, v23);
      v24 = objc_claimAutoreleasedReturnValue();

      v10 = (__CFString *)v24;
    }
    objc_msgSend(v7, "setEntityIdentifier:", v10);
    objc_msgSend(v7, "setEntityType:", 2);
    -[SSSuggestionResultBuilder buildSymbolImage](self, "buildSymbolImage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSymbolImage:", v25);

    goto LABEL_23;
  }
  -[SSResultBuilder result](self, "result");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "resultBundleId");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isEqual:", CFSTR("com.apple.spotlight.related_search_as_typed.web"));

  if (v28)
  {
    v7 = (void *)objc_opt_new();
    -[SSResultBuilder result](self, "result");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "title");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString text](v10, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v7, "setSearchString:", v11);
    }
    else
    {
      -[SSSuggestionResultBuilder suggestionString](self, "suggestionString");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSearchString:", v38);

    }
LABEL_22:

LABEL_23:
LABEL_24:

    return v7;
  }
  v7 = (void *)objc_opt_new();
  -[SSResultBuilder result](self, "result");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "title");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "text");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    objc_msgSend(v7, "setSearchString:", v37);
  }
  else
  {
    -[SSSuggestionResultBuilder suggestionString](self, "suggestionString");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSearchString:", v39);

  }
  objc_msgSend(v7, "setQuerySource:", 2);
  return v7;
}

- (id)buildHighlightedTextForSuggestion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  const __CFString *v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  -[SSResultBuilder matchedStrings](self, "matchedStrings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SSResultBuilder queryContext](self, "queryContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[SSResultBuilder queryContext](self, "queryContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "searchEntities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v8, "searchString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setText:", v4);
  objc_msgSend(v13, "setIsEmphasized:", 1);
  v32[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setFormattedTextPieces:", v14);
  if ((objc_msgSend(v4, "isEqual:", v12) & 1) == 0)
  {
    -[SSResultBuilder buildHighlightedMatchedTextWithTitle:headTruncation:](self, "buildHighlightedMatchedTextWithTitle:headTruncation:", 0, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      v18 = (void *)v16;
    else
      v18 = v15;
    v19 = v18;

    v15 = v19;
  }
  if (SSDefaultsGetState(6uLL))
  {
    -[SSSuggestionResultBuilder spotlightSuggestion](self, "spotlightSuggestion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[SSResultBuilder result](self, "result");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "type");

      if (v22 == 31)
      {
        v23 = CFSTR(" L");
LABEL_17:
        v28 = (void *)objc_opt_new();
        objc_msgSend(v28, "setText:", v23);
        objc_msgSend(v28, "setTextColor:", 3);
        objc_msgSend(v15, "formattedTextPieces");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "arrayByAddingObject:", v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setFormattedTextPieces:", v30);

        goto LABEL_18;
      }
      -[SSResultBuilder result](self, "result");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "type");

      if (v25 == 34)
      {
        v23 = CFSTR(" N");
        goto LABEL_17;
      }
      -[SSResultBuilder result](self, "result");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "type");

      if (v27 == 39)
      {
        v23 = CFSTR(" T");
        goto LABEL_17;
      }
    }
  }
LABEL_18:

  return v15;
}

- (id)buildPhotoTextAndGlyphForSuggestion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v3 = a3;
  objc_msgSend(v3, "formattedTextPieces");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setSymbolName:", CFSTR("photo.on.rectangle"));
  objc_msgSend(v4, "setIsTemplate:", 1);
  v5 = objc_alloc_init(MEMORY[0x1E0D8C3D0]);
  v36 = v4;
  objc_msgSend(v5, "setGlyph:", v4);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("TEMPLATE_PHOTOS_LOCATION_SEARCH"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v7;
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("<query>"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v11 = 0;
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", &stru_1E6E549F0);

      if ((v13 & 1) == 0)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v14);

      }
      if (v11 < objc_msgSend(v9, "count") - 1)
        objc_msgSend(v10, "addObjectsFromArray:", v38);
      ++v11;
    }
    while (v11 < objc_msgSend(v9, "count"));
  }
  v37 = v3;
  if (objc_msgSend(v10, "count"))
  {
    v15 = 0;
    while (1)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      objc_msgSend(v10, "objectAtIndexedSubscript:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if ((isKindOfClass & 1) == 0)
        break;
      v20 = objc_msgSend(v18, "rangeOfString:", CFSTR("<photo-icon>"));

      objc_msgSend(v10, "objectAtIndexedSubscript:", v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v20 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v21, "componentsSeparatedByString:", CFSTR("<photo-icon>"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v19, "count"))
        {
          v26 = 0;
          do
          {
            objc_msgSend(v19, "objectAtIndexedSubscript:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "isEqualToString:", &stru_1E6E549F0);

            if ((v28 & 1) == 0)
            {
              v29 = (void *)MEMORY[0x1E0D8C3D0];
              objc_msgSend(v19, "objectAtIndexedSubscript:", v26);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "textWithString:", v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v31);

            }
            if (v26 < objc_msgSend(v19, "count") - 1)
              objc_msgSend(v8, "addObject:", v5);
            ++v26;
          }
          while (v26 < objc_msgSend(v19, "count"));
        }
        goto LABEL_22;
      }
      v23 = objc_msgSend(v21, "isEqualToString:", &stru_1E6E549F0);

      if ((v23 & 1) == 0)
      {
        v24 = (void *)MEMORY[0x1E0D8C3D0];
        objc_msgSend(v10, "objectAtIndexedSubscript:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "textWithString:", v19);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v25);

LABEL_22:
      }
      if (++v15 >= (unint64_t)objc_msgSend(v10, "count"))
        goto LABEL_24;
    }
    objc_msgSend(v8, "addObject:", v18);
    goto LABEL_22;
  }
LABEL_24:
  if (objc_msgSend(v8, "count"))
  {
    v32 = (id)objc_opt_new();
    objc_msgSend(v32, "setFormattedTextPieces:", v8);
    v33 = v37;
  }
  else
  {
    v33 = v37;
    v32 = v37;
  }

  return v32;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_contactIdentifier, a3);
}

- (NSString)suggestionString
{
  return self->_suggestionString;
}

- (void)setSuggestionString:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionString, a3);
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setQueryString:(id)a3
{
  objc_storeStrong((id *)&self->_queryString, a3);
}

- (SFSearchSuggestion)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_suggestion, a3);
}

- (CSSuggestion)spotlightSuggestion
{
  return self->_spotlightSuggestion;
}

- (void)setSpotlightSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_spotlightSuggestion, a3);
}

- (SPSearchEntity)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
  objc_storeStrong((id *)&self->_entity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_spotlightSuggestion, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_suggestionString, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end
