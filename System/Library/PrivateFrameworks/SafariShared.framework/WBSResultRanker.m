@implementation WBSResultRanker

+ (WBSSearchParameters)searchParameters
{
  return (WBSSearchParameters *)(id)_searchParameters;
}

+ (void)setSearchParameters:(id)a3
{
  objc_storeStrong((id *)&_searchParameters, a3);
}

+ (id)filterOutUnlikelyMatchesFromTopHits:(id)a3 forQuery:(id)a4 searchProvider:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  char v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "queryString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "safari_isPrefixOfWwwDot");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __79__WBSResultRanker_filterOutUnlikelyMatchesFromTopHits_forQuery_searchProvider___block_invoke;
    v14[3] = &unk_1E4B3ED48;
    v16 = v10;
    v11 = v9;
    v15 = v11;
    objc_msgSend(v6, "safari_filterObjectsUsingBlock:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

uint64_t __79__WBSResultRanker_filterOutUnlikelyMatchesFromTopHits_forQuery_searchProvider___block_invoke(uint64_t a1, void *a2)
{
  WBSURLCompletionMatch *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;

  v3 = a2;
  -[WBSURLCompletionMatch originalURLString](v3, "originalURLString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(a1 + 40) || -[WBSURLCompletionMatch matchLocation](v3, "matchLocation") != 9)
    goto LABEL_7;
  objc_msgSend(v4, "safari_urlStringSuppressingHTTPFamilySchemeAndWWWSubdomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasPrefix:", *(_QWORD *)(a1 + 32)))
  {

LABEL_7:
    v7 = 1;
    goto LABEL_8;
  }
  v6 = objc_msgSend(MEMORY[0x1E0D89BE8], "isStreamlinedCompletionListEnabled");

  if (!v6)
    goto LABEL_7;
  logCompletionMatchToDebugChannel(CFSTR("Excluding TopHit that matches www subdomain"), v3);
  v7 = 0;
LABEL_8:

  return v7;
}

+ (id)filterOutUnlikelyMatchesBeforeTopHitPromotionFromMatches:(id)a3 forQuery:(id)a4 searchProvider:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  char v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "queryString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "safari_isPrefixOfWwwDot");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __100__WBSResultRanker_filterOutUnlikelyMatchesBeforeTopHitPromotionFromMatches_forQuery_searchProvider___block_invoke;
    v14[3] = &unk_1E4B3ED48;
    v16 = v10;
    v11 = v9;
    v15 = v11;
    objc_msgSend(v6, "safari_filterObjectsUsingBlock:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

uint64_t __100__WBSResultRanker_filterOutUnlikelyMatchesBeforeTopHitPromotionFromMatches_forQuery_searchProvider___block_invoke(uint64_t a1, void *a2)
{
  WBSURLCompletionMatch *v3;
  void *v4;
  void *v5;
  char v6;
  __CFString *v7;
  uint64_t v8;

  v3 = a2;
  -[WBSURLCompletionMatch originalURLString](v3, "originalURLString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 40) && -[WBSURLCompletionMatch matchLocation](v3, "matchLocation") == 9)
  {
    objc_msgSend(v4, "safari_urlStringSuppressingHTTPFamilySchemeAndWWWSubdomain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "hasPrefix:", *(_QWORD *)(a1 + 32)))
    {

    }
    else
    {
      v6 = objc_msgSend(MEMORY[0x1E0D89BE8], "isStreamlinedCompletionListEnabled");

      if ((v6 & 1) != 0)
      {
        v7 = CFSTR("Excluding URL that matches www subdomain");
        goto LABEL_9;
      }
    }
  }
  if (!+[WBSResultRanker matchNavigationIsClientOrServerError:](WBSResultRanker, "matchNavigationIsClientOrServerError:", v3))
  {
    v8 = 1;
    goto LABEL_11;
  }
  v7 = CFSTR("Excluding URL match that is a client or server error");
LABEL_9:
  logCompletionMatchToDebugChannel(&v7->isa, v3);
  v8 = 0;
LABEL_11:

  return v8;
}

+ (id)filterOutUnlikelyMatchesFromMatches:(id)a3 forQuery:(id)a4 rewrittenQuery:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  char v17;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend((id)_searchParameters, "isResultFilteringDisabled"))
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v8, "queryString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "safari_allowsLooserMatchingInSearch");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __79__WBSResultRanker_filterOutUnlikelyMatchesFromMatches_forQuery_rewrittenQuery___block_invoke;
    v14[3] = &unk_1E4B3ED70;
    v16 = a1;
    v12 = v10;
    v15 = v12;
    v17 = v11;
    objc_msgSend(v7, "safari_filterObjectsUsingBlock:", v14);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

uint64_t __79__WBSResultRanker_filterOutUnlikelyMatchesFromMatches_forQuery_rewrittenQuery___block_invoke(uint64_t a1, void *a2)
{
  WBSURLCompletionMatch *v3;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;
  BOOL v7;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 40), "matchNavigationIsClientOrServerError:", v3))
  {
    logCompletionMatchToDebugChannel(CFSTR("Excluding unlikely match due to client or server error"), v3);
  }
  else
  {
    if (-[WBSURLCompletionMatch isTopHit](v3, "isTopHit")
      || ((v5 = -[WBSURLCompletionMatch matchLocation](v3, "matchLocation"),
           v6 = +[WBSResultRankerHelpers allowMatch:forMatch:forQueryString:](WBSResultRankerHelpers, "allowMatch:forMatch:forQueryString:", _searchParameters, v3, *(_QWORD *)(a1 + 32)), *(_BYTE *)(a1 + 48))? (v7 = v5 > 1): (v7 = v6), v7))
    {
      v4 = 1;
      goto LABEL_10;
    }
    logCompletionMatchToDebugChannel(CFSTR("Excluding unlikely match due to nil match value"), v3);
  }
  v4 = 0;
LABEL_10:

  return v4;
}

+ (id)_visibleURLtoDisplayedURL:(id)a3
{
  objc_msgSend(a3, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 51, 1, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_dropQueryPart:(id)a3
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("?"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_1E4B40D18;
  v6 = v4;

  return v6;
}

+ (id)_urlStringWithoutQueryForMatch:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "userVisibleURLString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_dropQueryPart:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_simplifyURLForHistoryDedupe:(id)a3 withMobile:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  if (v4)
    objc_msgSend(a1, "_visibleURLtoDisplayedURL:", v6);
  else
    objc_msgSend(a1, "_dropQueryPart:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)_trackTitlesAndURLs:(id)a3 withMobile:(BOOL)a4 withBase:(id)a5 withSimplified:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v8 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v13);
        objc_msgSend(a1, "_trackTitleAndURLSingle:withMobile:withBase:withSimplified:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), v8, v11, v12, (_QWORD)v17);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

+ (void)_trackTitleAndURLSingle:(id)a3 withMobile:(BOOL)a4 withBase:(id)a5 withSimplified:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
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
  id v23;

  v8 = a4;
  v23 = a3;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v23, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v23, "userVisibleURLString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v23, "userVisibleURLString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_simplifyURLForHistoryDedupe:withMobile:", v14, v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "titlePrefix");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v23, "userVisibleURLString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v18);

      objc_msgSend(v23, "titlePrefix");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v19);

      objc_msgSend(v23, "titlePrefix");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v21, "addObject:", v15);
      objc_msgSend(v23, "titlePrefix");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, v22);

    }
  }

}

+ (BOOL)_shouldDedupeResult:(id)a3 withMobile:(BOOL)a4 withBase:(id)a5 withSimplified:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v8 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v25 = a5;
  v11 = a6;
  if (v8)
  {
    objc_msgSend(v10, "userVisibleURLString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_simplifyURLForHistoryDedupe:withMobile:", v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v10, "titlePrefix");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v15);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "isEqualToString:", v13) & 1) != 0)
          {
            LOBYTE(v16) = 1;
            goto LABEL_21;
          }
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v16)
          continue;
        break;
      }
    }
LABEL_21:

  }
  else
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v10, "titlePrefix");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v16)
    {
      v20 = *(_QWORD *)v27;
      while (2)
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(v13);
          v22 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
          objc_msgSend(v10, "userVisibleURLString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v22) = +[WBSResultRankerHelpers hostAreEqual:forSecondURLString:](WBSResultRankerHelpers, "hostAreEqual:forSecondURLString:", v23, v22);

          if ((v22 & 1) != 0)
          {
            LOBYTE(v16) = 1;
            goto LABEL_23;
          }
        }
        v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v16)
          continue;
        break;
      }
    }
  }
LABEL_23:

  return v16;
}

+ (id)dedupeSameTitleHistoryResults:(id)a3 withMobile:(BOOL)a4 withTophits:(id)a5 withTabs:(id)a6
{
  objc_msgSend(a1, "dedupeSameTitleHistoryResults:withMobile:withTophits:withTabs:cloudTabs:", a3, a4, a5, a6, MEMORY[0x1E0C9AA60]);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)dedupeSameTitleHistoryResults:(id)a3 withMobile:(BOOL)a4 withTophits:(id)a5 withTabs:(id)a6 cloudTabs:(id)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  BOOL v29;
  _QWORD v30[5];

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (objc_msgSend((id)_searchParameters, "isResultFilteringDisabled"))
  {
    v16 = v12;
  }
  else
  {
    v24 = v14;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_trackTitlesAndURLs:withMobile:withBase:withSimplified:", v13, v10, v17, v18);
    objc_msgSend(a1, "_trackTitlesAndURLs:withMobile:withBase:withSimplified:", v15, v10, v17, v18);
    v19 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __91__WBSResultRanker_dedupeSameTitleHistoryResults_withMobile_withTophits_withTabs_cloudTabs___block_invoke;
    v30[3] = &__block_descriptor_40_e31_B16__0__WBSURLCompletionMatch_8l;
    v30[4] = a1;
    objc_msgSend(v12, "safari_filterObjectsUsingBlock:", v30);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_trackTitlesAndURLs:withMobile:withBase:withSimplified:", v20, v10, v17, v18);

    if (objc_msgSend((id)_searchParameters, "enableCompletionListHistoryDeduplicationSwitchToTabValue"))
      objc_msgSend(a1, "_trackTitlesAndURLs:withMobile:withBase:withSimplified:", v24, v10, v17, v18);
    v25[0] = v19;
    v25[1] = 3221225472;
    v25[2] = __91__WBSResultRanker_dedupeSameTitleHistoryResults_withMobile_withTophits_withTabs_cloudTabs___block_invoke_2;
    v25[3] = &unk_1E4B3EDB8;
    v28 = a1;
    v29 = v10;
    v21 = v17;
    v26 = v21;
    v22 = v18;
    v27 = v22;
    objc_msgSend(v12, "safari_filterObjectsUsingBlock:", v25);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v14 = v24;
  }

  return v16;
}

uint64_t __91__WBSResultRanker_dedupeSameTitleHistoryResults_withMobile_withTophits_withTabs_cloudTabs___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "matchNavigationIsClientOrServerError:", a2);
}

uint64_t __91__WBSResultRanker_dedupeSameTitleHistoryResults_withMobile_withTophits_withTabs_cloudTabs___block_invoke_2(uint64_t a1, void *a2)
{
  WBSURLCompletionMatch *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  -[WBSURLCompletionMatch title](v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_6;
  -[WBSURLCompletionMatch userVisibleURLString](v3, "userVisibleURLString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_6;
  if (!objc_msgSend(*(id *)(a1 + 48), "_shouldDedupeResult:withMobile:withBase:withSimplified:", v3, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 48), "_trackTitleAndURLSingle:withMobile:withBase:withSimplified:", v3, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
LABEL_6:
    v6 = 1;
    goto LABEL_7;
  }
  logCompletionMatchToDebugChannel(CFSTR("Excluding duplicate match with same title and host"), v3);
  v6 = 0;
LABEL_7:

  return v6;
}

+ (id)deduplicateTopHits:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t i;
  WBSURLCompletionMatch *v11;
  void *v12;

  v4 = a3;
  if ((objc_msgSend((id)_searchParameters, "isResultFilteringDisabled") & 1) != 0
    || (unint64_t)objc_msgSend(v4, "count") <= 1)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v6);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(a1, "_urlStringWithoutQueryForMatch:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    for (i = 1; i < objc_msgSend(v4, "count"); ++i)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", i);
      v11 = (WBSURLCompletionMatch *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_urlStringWithoutQueryForMatch:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "containsObject:", v12))
      {
        logCompletionMatchToDebugChannel(CFSTR("Excluding duplicate top hit"), v11);
      }
      else
      {
        objc_msgSend(v9, "addObject:", v12);
        objc_msgSend(v5, "addObject:", v11);
      }

    }
  }

  return v5;
}

+ (BOOL)matchNavigationIsClientOrServerError:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if ((objc_msgSend((id)_searchParameters, "isResultFilteringDisabled") & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "visitWasClientError");

  }
  return v5;
}

+ (BOOL)includeBookmarksAndHistory:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = !objc_msgSend(v3, "isCFSearch") || objc_msgSend(v3, "maxBookmarksAndHistoryItems");

  return v4;
}

+ (id)urlStringsFromUniversalSearchResults:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "url", (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "safari_userVisibleString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "safari_urlStringForCompletionDeduplication");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          objc_msgSend(v4, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

+ (id)dedupeSameURLResults:(id)a3 withUniversalSearchResults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "urlStringsFromUniversalSearchResults:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__WBSResultRanker_dedupeSameURLResults_withUniversalSearchResults___block_invoke;
  v12[3] = &unk_1E4B3EDE0;
  v13 = v8;
  v9 = v8;
  objc_msgSend(v6, "safari_filterObjectsUsingBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __67__WBSResultRanker_dedupeSameURLResults_withUniversalSearchResults___block_invoke(uint64_t a1, void *a2)
{
  WBSURLCompletionMatch *v3;
  void *v4;
  void *v5;
  int v6;

  v3 = a2;
  -[WBSURLCompletionMatch originalURLString](v3, "originalURLString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_urlStringForCompletionDeduplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5);
  if (v6)
    logCompletionMatchToDebugChannel(CFSTR("Excluding duplicate match with URL"), v3);

  return v6 ^ 1u;
}

+ (id)dedupeResults:(id)a3 withSearchSuggestionStrings:(id)a4 searchProvider:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a4;
  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__WBSResultRanker_dedupeResults_withSearchSuggestionStrings_searchProvider___block_invoke;
  v13[3] = &unk_1E4B3EE08;
  v14 = v8;
  v15 = v7;
  v9 = v7;
  v10 = v8;
  objc_msgSend(a3, "safari_filterObjectsUsingBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __76__WBSResultRanker_dedupeResults_withSearchSuggestionStrings_searchProvider___block_invoke(uint64_t a1, void *a2)
{
  WBSURLCompletionMatch *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0C99E98];
  -[WBSURLCompletionMatch originalURLString](v3, "originalURLString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userVisibleQueryFromSearchURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && (v9 = *(void **)(a1 + 40),
        objc_msgSend(v8, "lowercaseString"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v9) = objc_msgSend(v9, "containsObject:", v10),
        v10,
        (_DWORD)v9))
  {
    logCompletionMatchToDebugChannel(CFSTR("Excluding duplicate match with search suggestion"), v3);
    v11 = 0;
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

+ (BOOL)shouldAutocompleteToURL:(id)a3 fromUserTypedString:(id)a4 withPredictedQueryString:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;

  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 15, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = WBSUnifiedFieldInputTypeForString(v7);
  if ((unint64_t)(v10 - 1) < 2
    || (v11 = 1, v10) && v10 != 4 && (unint64_t)(WBSUnifiedFieldInputTypeForString(v8) - 1) <= 3)
  {
    v11 = objc_msgSend(v9, "hasPrefix:", v7);
  }

  return v11;
}

@end
