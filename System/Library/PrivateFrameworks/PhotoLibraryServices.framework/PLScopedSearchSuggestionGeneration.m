@implementation PLScopedSearchSuggestionGeneration

+ (id)rankedSearchSuggestionsFromSuggestionCandidates:(id)a3 suggestionType:(unint64_t)a4 queryAssetCount:(unint64_t)a5 queryCollectionCount:(unint64_t)a6 suggestionLimit:(unint64_t)a7 suggestionQuery:(id)a8
{
  id v14;
  id v15;
  void *v16;
  id v17;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  id v28;
  _QWORD v29[7];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint8_t buf[8];
  uint8_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  uint64_t *v47;
  id v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;

  v14 = a3;
  v15 = a8;
  if (objc_msgSend(v14, "count"))
  {
    v52 = 0;
    v53 = &v52;
    v54 = 0x2020000000;
    v55 = 0;
    v16 = (void *)objc_opt_new();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __170__PLScopedSearchSuggestionGeneration_rankedSearchSuggestionsFromSuggestionCandidates_suggestionType_queryAssetCount_queryCollectionCount_suggestionLimit_suggestionQuery___block_invoke;
    v44[3] = &unk_1E36776E0;
    v48 = a1;
    v49 = a5;
    v50 = a6;
    v51 = a4;
    v17 = v15;
    v45 = v17;
    v28 = v16;
    v46 = v28;
    v47 = &v52;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v44);
    v19 = a4 == 2 && a7 > 1;
    v20 = a7 - v19;
    if (v53[3] >= v20)
      v21 = v20;
    else
      v21 = v53[3];
    objc_msgSend(a1, "_orderedSuggestionCategoryTypes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v39 = buf;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__99952;
    v42 = __Block_byref_object_dispose__99953;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v21);
    v43 = (id)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    do
    {
      if (objc_msgSend(*((id *)v39 + 5), "count") >= v21)
        break;
      v23 = *((_QWORD *)v39 + 5);
      v24 = v31[3];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __170__PLScopedSearchSuggestionGeneration_rankedSearchSuggestionsFromSuggestionCandidates_suggestionType_queryAssetCount_queryCollectionCount_suggestionLimit_suggestionQuery___block_invoke_2;
      v29[3] = &unk_1E3677708;
      v29[4] = buf;
      v29[5] = &v34;
      v29[6] = &v30;
      objc_msgSend(a1, "_rankedSuggestionsFromRankedSuggestionsBySuggestionCategoriesType:orderedSuggestionCategoriesTypes:maxSuggestions:suggestionQuery:suggestionType:rankedSuggestions:bestSuggestionIndex:completion:", v28, v22, v21, v17, a4, v23, v24, v29);
      if (a4 == 2)
        break;
    }
    while (*((_BYTE *)v35 + 24));
    objc_msgSend(a1, "sortedSuggestionsFromSuggestions:", *((_QWORD *)v39 + 5));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v52, 8);
  }
  else
  {
    PLSearchBackendQueryGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_INFO, "No suggestion candidates provided for suggestion ranking", buf, 2u);
    }

    v25 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v25;
}

+ (void)_rankedSuggestionsFromRankedSuggestionsBySuggestionCategoriesType:(id)a3 orderedSuggestionCategoriesTypes:(id)a4 maxSuggestions:(unint64_t)a5 suggestionQuery:(id)a6 suggestionType:(unint64_t)a7 rankedSuggestions:(id)a8 bestSuggestionIndex:(unint64_t)a9 completion:(id)a10
{
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD, id);
  int v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unint64_t v26;
  _BOOL4 v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  uint64_t v38;
  void (**v39)(id, _QWORD, id);
  id v40;
  id obj;
  uint64_t v42;
  void *v43;
  uint64_t v45;
  uint64_t v46;
  int v47;
  id v49;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v49 = a6;
  v15 = a8;
  v16 = (void (**)(id, _QWORD, id))a10;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v14;
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
  v17 = 0;
  if (v46)
  {
    v18 = a9;
    v45 = *(_QWORD *)v56;
    v40 = v13;
    v39 = v16;
    do
    {
      v47 = v17;
      v19 = 0;
      do
      {
        if (*(_QWORD *)v56 != v45)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v19);
        if (objc_msgSend(v15, "count") >= a5)
          goto LABEL_46;
        objc_msgSend(v13, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "count") <= v18)
        {
          v22 = 0;
LABEL_14:
          v26 = 0;
          goto LABEL_15;
        }
        objc_msgSend(v21, "objectAtIndexedSubscript:", v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v22)
          goto LABEL_14;
        if ((objc_msgSend(v15, "containsObject:", v22) & 1) != 0)
          goto LABEL_39;
        v23 = v19;
        objc_msgSend(v15, "addObject:", v22);
        objc_msgSend(v22, "suggestionComponents");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "firstObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = objc_msgSend(v25, "indexCategory") == 1300 || objc_msgSend(v25, "indexCategory") == 1330;
        v47 = 1;
        v19 = v23;
LABEL_15:
        if (objc_msgSend(v15, "count") >= a5)
        {

LABEL_46:
          v16 = v39;
          LOBYTE(v17) = v47;
          goto LABEL_47;
        }
        v27 = objc_msgSend(v20, "integerValue") == 7 || objc_msgSend(v20, "integerValue") == 9;
        if (a7 == 1 && v27)
        {
          v42 = v19;
          v43 = v21;
          v53 = 0u;
          v54 = 0u;
          v51 = 0u;
          v52 = 0u;
          v28 = v21;
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v52;
LABEL_23:
            v32 = 0;
            while (1)
            {
              if (*(_QWORD *)v52 != v31)
                objc_enumerationMutation(v28);
              if (v26 > 2)
                break;
              v33 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v32);
              if ((objc_msgSend(v15, "containsObject:", v33) & 1) == 0)
              {
                v34 = v22;
                objc_msgSend(v22, "suggestionComponents");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "firstObject");
                v36 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v36, "indexCategory") == 1300 || objc_msgSend(v36, "indexCategory") == 1330)
                {
                  objc_msgSend(a1, "_percentOverlapWithCompletionText:suggestionQuery:minPercentOverlapForPrioritization:", v33, v49, 0.25);
                  if (v37 >= 0.25)
                  {
                    objc_msgSend(v15, "addObject:", v33);
                    ++v26;
                    v47 = 1;
                  }
                  if (objc_msgSend(v15, "count") >= a5)
                  {

                    v22 = v34;
                    break;
                  }
                }

                v22 = v34;
              }
              if (v30 == ++v32)
              {
                v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
                if (v30)
                  goto LABEL_23;
                break;
              }
            }
          }

          v18 = a9;
          v13 = v40;
          v19 = v42;
          v21 = v43;
        }
LABEL_39:

        ++v19;
      }
      while (v19 != v46);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      v16 = v39;
      v46 = v38;
      v17 = v47;
    }
    while (v38);
  }
LABEL_47:

  v16[2](v16, v17 & 1, v15);
}

+ (id)sortedSuggestionsFromSuggestions:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v3, "sortUsingComparator:", &__block_literal_global_100015);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

+ (id)_rankedSearchSuggestionsFromSuggestions:(id)a3 queryAssetCount:(unint64_t)a4 queryCollectionCount:(unint64_t)a5 suggestionType:(unint64_t)a6 suggestionQuery:(id)a7
{
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;

  v12 = a7;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __146__PLScopedSearchSuggestionGeneration__rankedSearchSuggestionsFromSuggestions_queryAssetCount_queryCollectionCount_suggestionType_suggestionQuery___block_invoke;
  v16[3] = &unk_1E3677770;
  v19 = a4;
  v20 = a5;
  v17 = v12;
  v18 = a1;
  v21 = a6;
  v13 = v12;
  objc_msgSend(a3, "sortedArrayUsingComparator:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (unint64_t)_countBasedPriorityForSuggestion:(id)a3 queryAssetCount:(unint64_t)a4 queryCollectionCount:(unint64_t)a5
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  double v9;

  v6 = a3;
  v7 = objc_msgSend(v6, "matchedAssetsCount");
  v8 = objc_msgSend(v6, "matchedCollectionsCount");

  v9 = (float)(v8 / a4);
  if (v7 >= a4)
    v9 = (double)(v7 / a4);
  if (v9 >= 0.25 && v9 <= 0.5)
    return 1;
  if (v9 > 0.5 && v9 <= 0.8)
    return 2;
  if (v9 >= 0.1 && v9 < 0.25)
    return 3;
  if (v9 > 0.8)
    return 4;
  if (v9 >= 0.1)
    return 0;
  return 5;
}

+ (double)_averageGroupRankingScoreForSuggestion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  float v12;
  double v13;
  double v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "suggestionComponents", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "score");
        v13 = v12;
        objc_msgSend(a1, "suggestionScoreForIndexCategory:", objc_msgSend(v11, "indexCategory"));
        v9 = v9 + v14 + v13;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);

    if (v9 == 0.0)
    {
      v15 = 0.0;
      goto LABEL_13;
    }
    objc_msgSend(v4, "suggestionComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v9 / (double)(unint64_t)objc_msgSend(v5, "count");
  }
  else
  {
    v15 = 0.0;
  }

LABEL_13:
  return v15;
}

+ (double)_percentOverlapWithCompletionText:(id)a3 suggestionQuery:(id)a4 minPercentOverlapForPrioritization:(double)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  id v31;
  id v32;
  uint64_t v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "suggestionOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "searchSuggestionType");

  v11 = 0.0;
  if (v10 == 2)
    goto LABEL_16;
  objc_msgSend(v7, "contentString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  v31 = v8;
  objc_msgSend(v8, "completionSuggestionTexts");
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (!v14)
    goto LABEL_15;
  v15 = v14;
  v16 = *(_QWORD *)v36;
  v17 = (double)v13;
  v32 = v7;
  do
  {
    v18 = 0;
    v33 = v15;
    do
    {
      if (*(_QWORD *)v36 != v16)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v18);
      v20 = objc_msgSend(v19, "length");
      objc_msgSend(v7, "contentString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lowercaseString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lowercaseString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "hasPrefix:", v23))
      {

      }
      else
      {
        objc_msgSend(v7, "contentString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "lowercaseString");
        v25 = v20;
        v26 = v16;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lowercaseString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v27, "isEqualToString:", v28);

        v16 = v26;
        v20 = v25;

        v7 = v32;
        v15 = v33;

        v11 = 0.0;
        if (!v29)
          goto LABEL_11;
      }
      v11 = (double)v20 / v17;
LABEL_11:
      if (v11 > a5)
        goto LABEL_15;
      ++v18;
    }
    while (v15 != v18);
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  }
  while (v15);
  v11 = 0.0;
LABEL_15:

  v8 = v31;
LABEL_16:

  return v11;
}

+ (unint64_t)_characterLengthForSuggestion:(id)a3 suggestionQuery:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;

  v5 = a3;
  objc_msgSend(a4, "suggestionOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "searchSuggestionType");

  if (v7 == 2)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v5, "contentString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "length");

  }
  return v8;
}

+ (id)_orderedSuggestionCategoryTypes
{
  return &unk_1E3764220;
}

+ (double)suggestionScoreForIndexCategory:(unint64_t)a3
{
  double result;

  result = 1.0;
  if ((uint64_t)a3 > 1529)
  {
    if ((uint64_t)a3 <= 1899)
    {
      if ((uint64_t)a3 <= 1610)
      {
        if ((uint64_t)a3 <= 1540)
        {
          if (a3 != 1530 && a3 != 1531 && a3 != 1540)
            return result;
        }
        else if ((uint64_t)a3 > 1600)
        {
          if (a3 != 1601 && a3 != 1610)
            return result;
        }
        else if (a3 != 1541 && a3 != 1600)
        {
          return result;
        }
        return 0.4;
      }
      if ((uint64_t)a3 > 1799)
      {
        switch(a3)
        {
          case 0x708uLL:
          case 0x709uLL:
          case 0x70AuLL:
          case 0x70BuLL:
            return 0.4;
          default:
            return result;
        }
        return result;
      }
      if (a3 == 1611)
        return 0.4;
      if (a3 != 1700)
      {
        if (a3 != 1701)
          return result;
        return 0.4;
      }
    }
    else
    {
      if ((uint64_t)a3 <= 1999)
      {
        switch(a3)
        {
          case 0x76CuLL:
          case 0x76DuLL:
          case 0x77DuLL:
            return 0.0;
          case 0x76EuLL:
          case 0x76FuLL:
          case 0x770uLL:
          case 0x771uLL:
          case 0x772uLL:
          case 0x773uLL:
          case 0x774uLL:
          case 0x775uLL:
          case 0x776uLL:
          case 0x777uLL:
          case 0x778uLL:
          case 0x779uLL:
          case 0x77AuLL:
          case 0x77BuLL:
          case 0x77CuLL:
          case 0x77EuLL:
          case 0x77FuLL:
            return 0.3;
          default:
            return result;
        }
        return result;
      }
      if ((uint64_t)a3 > 2499)
      {
        if ((uint64_t)a3 <= 2600)
        {
          if (a3 != 2500 && a3 != 2501 && a3 != 2600)
            return result;
          return 0.4;
        }
        if (a3 == 2601)
          return 0.4;
        if (a3 == 2800)
          result = 0.0;
        if (a3 == 2700)
          return 0.0;
        return result;
      }
      if ((uint64_t)a3 > 2299)
      {
        if (a3 == 2300)
          return 0.25;
        if (a3 == 2400 || a3 == 2401)
          return 0.3;
        return result;
      }
      if (a3 != 2000)
      {
        if (a3 == 2100)
          return 0.0;
        if (a3 != 2200)
          return result;
        return 0.4;
      }
    }
    return 0.65;
  }
  if ((uint64_t)a3 > 1099)
  {
    if ((uint64_t)a3 <= 1319)
    {
      switch(a3)
      {
        case 0x44CuLL:
        case 0x44DuLL:
        case 0x44EuLL:
        case 0x44FuLL:
          result = 0.7;
          break;
        case 0x450uLL:
        case 0x451uLL:
LABEL_39:
          result = 0.35;
          break;
        default:
          switch(a3)
          {
            case 0x4B0uLL:
            case 0x4B1uLL:
            case 0x4B2uLL:
            case 0x4B3uLL:
            case 0x4B4uLL:
            case 0x4B5uLL:
              goto LABEL_39;
            default:
              if (a3 == 1310)
                return 0.8;
              break;
          }
          break;
      }
      return result;
    }
    if ((uint64_t)a3 <= 1499)
    {
      if ((uint64_t)a3 <= 1329)
      {
        if (a3 == 1320 || a3 == 1321)
          return 0.9;
      }
      else if (a3 - 1330 < 2)
      {
        return 0.8;
      }
      else if (a3 == 1400)
      {
        return 0.2;
      }
      else if (a3 == 1401)
      {
        return 0.1;
      }
      return result;
    }
    if ((uint64_t)a3 > 1510)
    {
      if (a3 != 1511 && a3 != 1520 && a3 != 1521)
        return result;
    }
    else if (a3 != 1500 && a3 != 1501 && a3 != 1510)
    {
      return result;
    }
    return 0.4;
  }
  switch(a3)
  {
    case 0uLL:
    case 0xBuLL:
    case 0xDuLL:
      return 0.0;
    case 1uLL:
      result = 0.51;
      break;
    case 2uLL:
    case 3uLL:
      result = 0.5;
      break;
    case 4uLL:
      result = 0.52;
      break;
    case 5uLL:
      result = 0.56;
      break;
    case 6uLL:
      result = 0.55;
      break;
    case 7uLL:
      result = 0.57;
      break;
    case 8uLL:
      result = 0.58;
      break;
    case 9uLL:
      result = 0.53;
      break;
    case 0xAuLL:
      result = 0.59;
      break;
    case 0xCuLL:
      result = 0.6;
      break;
    case 0xEuLL:
      result = 0.54;
      break;
    default:
      switch(a3)
      {
        case 0x3E8uLL:
        case 0x3E9uLL:
          return 0.65;
        case 0x3EAuLL:
          result = 0.45;
          break;
        case 0x3EBuLL:
        case 0x3ECuLL:
        case 0x3EDuLL:
        case 0x3EEuLL:
          return 0.4;
        default:
          return result;
      }
      break;
  }
  return result;
}

+ (double)initialSuggestionScoreForIndexCategory:(unint64_t)a3
{
  double result;

  if ((uint64_t)a3 > 1500)
  {
    if ((uint64_t)a3 > 1799)
    {
      switch(a3)
      {
        case 0x708uLL:
        case 0x709uLL:
        case 0x70AuLL:
        case 0x70BuLL:
          return 0.85;
        default:
          if (a3 == 2600 || a3 == 2601)
            return 0.95;
          return 0.0;
      }
    }
    if ((uint64_t)a3 > 1600)
    {
      if (a3 != 1601 && a3 != 1610)
        return 0.0;
    }
    else
    {
      if (a3 == 1501)
        return 0.95;
      if (a3 != 1600)
        return 0.0;
    }
    return 0.85;
  }
  if ((uint64_t)a3 <= 1100)
  {
    switch(a3)
    {
      case 5uLL:
        return 0.75;
      case 0x3E8uLL:
        return 0.95;
      case 0x3E9uLL:
        return 0.65;
    }
    return 0.0;
  }
  if ((uint64_t)a3 > 1299)
  {
    if (a3 == 1300)
      return 1.0;
    if (a3 != 1330 && a3 != 1500)
      return 0.0;
    return 0.95;
  }
  switch(a3)
  {
    case 0x44DuLL:
      result = 0.25;
      break;
    case 0x44EuLL:
      result = 0.8;
      break;
    case 0x44FuLL:
      result = 0.6;
      break;
    case 0x450uLL:
    case 0x451uLL:
      result = 0.5;
      break;
    default:
      return 0.0;
  }
  return result;
}

+ (id)_suggestionsOrderedUserCategories
{
  return &unk_1E3764238;
}

+ (id)generateCompletionSuggestionsFromGroups:(id)a3 queryMatchedScopedAssetIds:(__CFArray *)a4 queryMatchedScopedCollectionIds:(__CFArray *)a5 searchResultTypes:(unint64_t)a6 normalizedSearchText:(id)a7 delegate:(id)a8
{
  char v10;
  id v15;
  id v16;
  id v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  CFIndex v22;
  const __CFArray *v23;
  CFIndex Count;
  uint64_t v25;
  CFIndex v26;
  uint64_t v27;
  const void *ValueAtIndex;
  const void *v29;
  char v30;
  CFIndex v31;
  CFIndex v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  CFIndex v36;
  const void *v37;
  const __CFArray *v38;
  const __CFArray *v39;
  unint64_t v40;
  const __CFArray *v41;
  CFIndex v42;
  const void *v43;
  const __CFArray *v44;
  CFIndex v45;
  uint64_t v46;
  CFIndex v47;
  uint64_t v48;
  _BYTE *v49;
  _BYTE *v50;
  char v51;
  CFIndex v52;
  CFIndex v53;
  uint64_t v54;
  BOOL v55;
  uint64_t v56;
  CFIndex v57;
  _BYTE *v58;
  const __CFArray *v59;
  const __CFArray *v60;
  unint64_t v61;
  const __CFArray *v62;
  CFIndex v63;
  _BYTE *v64;
  CFIndex v65;
  _BOOL4 v66;
  _BOOL4 v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  PLSearchSuggestionComponent *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  double v82;
  PLSearchSuggestionComponent *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  CFArrayRef cf;
  const __CFAllocator *allocator;
  uint64_t v97;
  id v98;
  id obj;
  char v100;
  __CFArray *v101;
  __CFArray *v102;
  CFArrayRef v103;
  const __CFArray *v104;
  const __CFArray *Mutable;
  CFArrayRef v106;
  CFArrayRef v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  const __CFArray *theArray;
  const __CFArray *theArraya;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE v119[128];
  uint64_t v120;
  CFRange v121;
  CFRange v122;

  v10 = a6;
  v120 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v94 = a7;
  v16 = a8;
  v17 = v16;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLScopedSearchSuggestionGeneration.m"), 597, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("groups"));

    if (v17)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLScopedSearchSuggestionGeneration.m"), 598, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

LABEL_3:
  v93 = v17;
  if (!objc_msgSend(v94, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLScopedSearchSuggestionGeneration.m"), 599, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("normalizedSearchText.length > 0"));

  }
  v98 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  obj = v15;
  v109 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v119, 16);
  if (v109)
  {
    v108 = *(_QWORD *)v116;
    allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v97 = v10 & 3;
    v100 = v10;
    v101 = a5;
    v102 = a4;
    do
    {
      for (i = 0; i != v109; ++i)
      {
        if (*(_QWORD *)v116 != v108)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * i);
        objc_msgSend(v19, "contentString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "length");

        if (!v21)
          continue;
        if ((v10 & 1) == 0)
        {
LABEL_12:
          v22 = 0;
          if ((v10 & 2) == 0)
            goto LABEL_131;
          goto LABEL_72;
        }
        if (a4 && CFArrayGetCount(a4) >= 1)
        {
          v110 = i;
          v103 = CFArrayCreate(allocator, 0, 0, 0);
          v23 = (const __CFArray *)objc_msgSend(v19, "assetIds");
          Mutable = CFArrayCreateMutable(allocator, 0, 0);
          Count = CFArrayGetCount(a4);
          if (v23)
          {
            v25 = Count;
            v26 = CFArrayGetCount(v23);
            if (v25)
            {
              v27 = v26;
              if (v26)
              {
                if (v25 >= 1 && v26 >= 1)
                {
                  ValueAtIndex = 0;
                  v29 = 0;
                  v30 = 0;
                  v31 = 0;
                  v32 = 0;
                  theArray = v102;
                  v33 = 8;
                  while (1)
                  {
                    if ((v30 & 1) == 0)
                    {
                      if (!v33)
                      {
                        if (!v29 || !ValueAtIndex)
                          goto LABEL_162;
LABEL_161:
                        __assert_rtn("sortedArrayIntersection", "PSIUtilities.h", 154, "seeking && !needsSeekStrategy");
                      }
                      v37 = v29;
LABEL_39:
                      v41 = Mutable;
LABEL_40:
                      while (2)
                      {
                        v30 = 1;
                        if (v32 >= v25 || v31 >= v27)
                        {
LABEL_57:
                          v29 = v37;
                          goto LABEL_58;
                        }
                        if (!v33)
                        {
                          v33 = -1;
                          v30 = 1;
                          goto LABEL_57;
                        }
                        if (v37)
                        {
                          if (ValueAtIndex)
                            goto LABEL_45;
LABEL_50:
                          ValueAtIndex = CFArrayGetValueAtIndex(v23, v31);
                        }
                        else
                        {
                          v37 = CFArrayGetValueAtIndex(theArray, v32);
                          if (!ValueAtIndex)
                            goto LABEL_50;
                        }
LABEL_45:
                        if (v37 >= ValueAtIndex)
                        {
                          if (v37 <= ValueAtIndex)
                          {
                            if (v41)
                              CFArrayGetCount(v41);
                            CFArrayAppendValue(v41, v37);
                            v37 = 0;
                            ValueAtIndex = 0;
                            ++v32;
                            ++v31;
                          }
                          else
                          {
                            ValueAtIndex = 0;
                            ++v31;
                            --v33;
                          }
                        }
                        else
                        {
                          v37 = 0;
                          ++v32;
                          --v33;
                        }
                        continue;
                      }
                    }
                    if (v29)
                    {
                      if (ValueAtIndex)
                        goto LABEL_25;
                    }
                    else
                    {
                      v29 = CFArrayGetValueAtIndex(theArray, v32);
                      if (ValueAtIndex)
                        goto LABEL_25;
                    }
                    ValueAtIndex = CFArrayGetValueAtIndex(v23, v31);
LABEL_25:
                    v34 = ValueAtIndex >= v29;
                    v35 = v25;
                    if (ValueAtIndex < v29)
                    {
                      v25 = v27;
                      v27 = v35;
                    }
                    v36 = v32;
                    if (ValueAtIndex >= v29)
                    {
                      v37 = v29;
                    }
                    else
                    {
                      v32 = v31;
                      v31 = v36;
                      v37 = ValueAtIndex;
                    }
                    if (ValueAtIndex < v29)
                      ValueAtIndex = v29;
                    v38 = theArray;
                    v39 = v23;
                    if (!v34)
                    {
                      v23 = theArray;
                      v38 = v39;
                    }
                    theArray = v38;
                    if (ValueAtIndex < v37)
LABEL_152:
                      __assert_rtn("sortedArrayIntersection", "PSIUtilities.h", 116, "elemB >= elemA");
                    if (v25 < 9)
                    {
                      v33 = 8;
                      goto LABEL_39;
                    }
                    v41 = Mutable;
                    v40 = (_BYTE *)ValueAtIndex - (_BYTE *)v37;
                    if (log((double)v25) >= (double)v40)
                    {
                      v33 = 8;
                      goto LABEL_40;
                    }
                    if (!v37 || !ValueAtIndex)
                      goto LABEL_162;
                    v121.length = v25 - v32;
                    v121.location = v32;
                    v42 = CFArrayBSearchValues(theArray, v121, ValueAtIndex, (CFComparatorFunction)PSIRowIDCompare_99963, 0);
                    if (v42 < v25)
                    {
                      v32 = v42;
                      v43 = CFArrayGetValueAtIndex(theArray, v42);
                      if (ValueAtIndex == v43)
                      {
                        v30 = 0;
                        v33 = 8;
                        v29 = ValueAtIndex;
                      }
                      else
                      {
                        v29 = v43;
                        if (ValueAtIndex >= v43)
                          goto LABEL_153;
                        v33 = 0;
                        v30 = 1;
                      }
LABEL_58:
                      if (v32 < v25 && v31 < v27)
                        continue;
                    }
                    break;
                  }
                }
              }
            }
          }
          v22 = CFArrayGetCount(Mutable);
          CFRelease(v103);
          CFRelease(Mutable);
          v10 = v100;
          a5 = v101;
          a4 = v102;
          i = v110;
          if ((v100 & 2) == 0)
          {
LABEL_131:
            v66 = 0;
            v65 = 0;
            v67 = v22 != 0;
LABEL_137:
            if ((v10 & 1) == 0)
              v67 = v66;
            if (!v67)
              continue;
            goto LABEL_140;
          }
        }
        else
        {
          if (!objc_msgSend(v19, "intersectedAssetIds"))
            goto LABEL_12;
          v22 = CFArrayGetCount((CFArrayRef)objc_msgSend(v19, "intersectedAssetIds"));
          if ((v10 & 2) == 0)
            goto LABEL_131;
        }
LABEL_72:
        if (a5 && CFArrayGetCount(a5) >= 1)
        {
          v106 = (CFArrayRef)v22;
          v111 = i;
          cf = CFArrayCreate(allocator, 0, 0, 0);
          v44 = (const __CFArray *)objc_msgSend(v19, "collectionIds");
          v104 = CFArrayCreateMutable(allocator, 0, 0);
          v45 = CFArrayGetCount(a5);
          if (!v44)
            goto LABEL_132;
          v46 = v45;
          v47 = CFArrayGetCount(v44);
          if (!v46)
            goto LABEL_132;
          v48 = v47;
          if (!v47 || v46 < 1 || v47 < 1)
            goto LABEL_132;
          v49 = 0;
          v50 = 0;
          v51 = 0;
          v52 = 0;
          v53 = 0;
          theArraya = v101;
          v54 = 8;
          while (1)
          {
            if ((v51 & 1) == 0)
            {
              if (!v54)
              {
                if (!v50 || !v49)
                  goto LABEL_162;
                goto LABEL_161;
              }
              v58 = v50;
              goto LABEL_97;
            }
            if (v50)
            {
              if (!v49)
                goto LABEL_120;
            }
            else
            {
              v50 = CFArrayGetValueAtIndex(theArraya, v53);
              if (!v49)
LABEL_120:
                v49 = CFArrayGetValueAtIndex(v44, v52);
            }
            v55 = v49 >= v50;
            v56 = v46;
            if (v49 < v50)
            {
              v46 = v48;
              v48 = v56;
            }
            v57 = v53;
            if (v49 >= v50)
            {
              v58 = v50;
            }
            else
            {
              v53 = v52;
              v52 = v57;
              v58 = v49;
            }
            if (v49 < v50)
              v49 = v50;
            v59 = theArraya;
            v60 = v44;
            if (!v55)
            {
              v44 = theArraya;
              v59 = v60;
            }
            theArraya = v59;
            if (v49 < v58)
              goto LABEL_152;
            if (v46 >= 9)
            {
              v62 = v104;
              v61 = v49 - v58;
              if (log((double)v46) >= (double)v61)
              {
                v54 = 8;
                goto LABEL_98;
              }
              if (v58 && v49)
              {
                v122.length = v46 - v53;
                v122.location = v53;
                v63 = CFArrayBSearchValues(theArraya, v122, v49, (CFComparatorFunction)PSIRowIDCompare_99963, 0);
                if (v63 >= v46)
                  goto LABEL_132;
                v53 = v63;
                v64 = CFArrayGetValueAtIndex(theArraya, v63);
                if (v49 == v64)
                {
                  v51 = 0;
                  v54 = 8;
                  v50 = v49;
                  goto LABEL_116;
                }
                v50 = v64;
                if (v49 < v64)
                {
                  v54 = 0;
                  v51 = 1;
                  goto LABEL_116;
                }
LABEL_153:
                __assert_rtn("sortedArrayIntersection", "PSIUtilities.h", 167, "elemA > elemB");
              }
LABEL_162:
              __assert_rtn("sortedArrayIntersection", "PSIUtilities.h", 153, "elemA && elemB");
            }
            v54 = 8;
LABEL_97:
            v62 = v104;
LABEL_98:
            while (1)
            {
              v51 = 1;
              if (v53 >= v46 || v52 >= v48)
                break;
              if (!v54)
              {
                v54 = -1;
                v51 = 1;
                break;
              }
              if (v58)
              {
                if (!v49)
                  goto LABEL_108;
              }
              else
              {
                v58 = CFArrayGetValueAtIndex(theArraya, v53);
                if (!v49)
LABEL_108:
                  v49 = CFArrayGetValueAtIndex(v44, v52);
              }
              if (v58 >= v49)
              {
                if (v58 <= v49)
                {
                  if (v62)
                    CFArrayGetCount(v62);
                  CFArrayAppendValue(v62, v58);
                  v58 = 0;
                  v49 = 0;
                  ++v53;
                  ++v52;
                }
                else
                {
                  v49 = 0;
                  ++v52;
                  --v54;
                }
              }
              else
              {
                v58 = 0;
                ++v53;
                --v54;
              }
            }
            v50 = v58;
LABEL_116:
            if (v53 >= v46 || v52 >= v48)
            {
LABEL_132:
              v65 = CFArrayGetCount(v104);
              CFRelease(cf);
              CFRelease(v104);
              v10 = v100;
              a5 = v101;
              a4 = v102;
              i = v111;
              v22 = (CFIndex)v106;
              goto LABEL_134;
            }
          }
        }
        if (objc_msgSend(v19, "intersectedCollectionIds"))
          v65 = CFArrayGetCount((CFArrayRef)objc_msgSend(v19, "intersectedCollectionIds"));
        else
          v65 = 0;
LABEL_134:
        v67 = v22 != 0;
        v66 = v65 != 0;
        if (v97 != 3)
          goto LABEL_137;
        if (!(v22 | v65))
          continue;
LABEL_140:
        v112 = i;
        v107 = (CFArrayRef)v22;
        if (objc_msgSend(v19, "tokenRangesCount"))
        {
          v68 = 0;
          while (1)
          {
            v69 = objc_msgSend(v19, "tokenRangeAtIndex:", v68);
            v71 = v70;
            objc_msgSend(v19, "normalizedString");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = objc_msgSend(v72, "rangeOfString:options:range:", v94, 137, v69, v71);
            v75 = v74;

            if (v73 != 0x7FFFFFFFFFFFFFFFLL)
              break;
            if (++v68 >= (unint64_t)objc_msgSend(v19, "tokenRangesCount"))
              goto LABEL_144;
          }
        }
        else
        {
LABEL_144:
          v75 = 0;
          v73 = 0x7FFFFFFFFFFFFFFFLL;
        }
        v76 = [PLSearchSuggestionComponent alloc];
        objc_msgSend(v19, "contentString");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v19, "groupId");
        v79 = objc_msgSend(v19, "owningGroupId");
        v80 = (int)objc_msgSend(v19, "category");
        objc_msgSend(v19, "lookupIdentifier");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "score");
        *(float *)&v82 = v82;
        v83 = -[PLSearchSuggestionComponent initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:](v76, "initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:", v77, v78, v79, v107, v65, v80, v82, v81, 1, 0, v73, v75);

        v84 = -[PLSearchSuggestionComponent userCategory](v83, "userCategory");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v84);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "objectForKeyedSubscript:", v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();

        if (v86)
        {
          objc_msgSend(v86, "addObject:", v83);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v83);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v84);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setObject:forKey:", v87, v88);

        }
        v10 = v100;
        a5 = v101;
        a4 = v102;
        i = v112;

      }
      v109 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v119, 16);
    }
    while (v109);
  }

  return v98;
}

+ (id)generateNextTermSuggestionsForQueryMatchedScopedAssetIds:(__CFArray *)a3 queryMatchedScopedCollectionIds:(__CFArray *)a4 searchResultTypes:(unint64_t)a5 delegate:(id)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  PLSearchSuggestionComponent *v16;
  char IsSynonym;
  CFIndex Count;
  void *v19;
  void *v20;
  uint64_t v21;
  CFIndex v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _BOOL4 v27;
  _BOOL4 v29;
  unsigned int v30;
  PLSearchSuggestionComponent *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  id v43;
  id v44;
  __CFArray *theArray;
  id obj;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  id v56;
  uint64_t *v57;
  _QWORD v58[4];
  id v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v43 = a6;
  theArray = a3;
  if (!v43)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLScopedSearchSuggestionGeneration.m"), 712, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = v9;
  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__99952;
  v71 = __Block_byref_object_dispose__99953;
  v72 = 0;
  v61 = 0;
  v62 = &v61;
  v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__99952;
  v65 = __Block_byref_object_dispose__99953;
  v66 = 0;
  v11 = MEMORY[0x1E0C809B0];
  if (a3)
  {
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __154__PLScopedSearchSuggestionGeneration_generateNextTermSuggestionsForQueryMatchedScopedAssetIds_queryMatchedScopedCollectionIds_searchResultTypes_delegate___block_invoke;
    v58[3] = &unk_1E3677798;
    v59 = v9;
    v60 = &v67;
    objc_msgSend(v43, "groupsForAssetIds:completion:", a3, v58);

  }
  if (a4)
  {
    v55[0] = v11;
    v55[1] = 3221225472;
    v55[2] = __154__PLScopedSearchSuggestionGeneration_generateNextTermSuggestionsForQueryMatchedScopedAssetIds_queryMatchedScopedCollectionIds_searchResultTypes_delegate___block_invoke_2;
    v55[3] = &unk_1E3677798;
    v56 = v10;
    v57 = &v61;
    v12 = (id)objc_msgSend(v43, "groupsForCollectionIds:completion:", a4, v55);

  }
  v44 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v10;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v73, 16);
  if (v13)
  {
    v49 = *(_QWORD *)v52;
    do
    {
      v50 = v13;
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v52 != v49)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v15, "contentString");
        v16 = (PLSearchSuggestionComponent *)objc_claimAutoreleasedReturnValue();
        if (!-[PLSearchSuggestionComponent length](v16, "length"))
          goto LABEL_50;
        IsSynonym = PLSearchIndexCategoryIsSynonym((int)objc_msgSend(v15, "category"));

        if ((IsSynonym & 1) != 0)
          continue;
        if (theArray)
          Count = CFArrayGetCount(theArray);
        else
          Count = 0;
        v19 = (void *)v68[5];
        if (v19)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v15, "groupId"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v19, "countForObject:", v20);

        }
        else
        {
          v21 = 0;
        }
        if (a4)
          v22 = CFArrayGetCount(a4);
        else
          v22 = 0;
        v23 = (void *)v62[5];
        if (v23)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v15, "groupId"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v23, "countForObject:", v24);

        }
        else
        {
          v25 = 0;
        }
        v27 = v21 != Count && v21 != 0;
        v29 = v25 != v22 && v25 != 0;
        if ((a5 & 3) == 3)
        {
          if (v27 || v29)
            goto LABEL_44;
        }
        else
        {
          v30 = v29 & (a5 >> 1);
          if ((a5 & 1) == 0)
            v27 = v30;
          if (v27)
          {
LABEL_44:
            v31 = [PLSearchSuggestionComponent alloc];
            objc_msgSend(v15, "contentString");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v15, "groupId");
            v34 = objc_msgSend(v15, "owningGroupId");
            if ((a5 & 2) == 0)
              v25 = 0;
            v35 = objc_msgSend(v15, "category");
            objc_msgSend(v15, "lookupIdentifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "score");
            *(float *)&v37 = v37;
            v16 = -[PLSearchSuggestionComponent initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:](v31, "initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:", v32, v33, v34, ((uint64_t)(a5 << 63) >> 63) & v21, v25, v35, v37, v36, 2, 0, 0x7FFFFFFFFFFFFFFFLL, 0);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PLSearchSuggestionComponent userCategory](v16, "userCategory"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "objectForKeyedSubscript:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            if (v39)
            {
              objc_msgSend(v39, "addObject:", v16);
            }
            else
            {
              v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v16, 0);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PLSearchSuggestionComponent userCategory](v16, "userCategory"));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "setObject:forKeyedSubscript:", v39, v40);

            }
LABEL_50:

            continue;
          }
        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v73, 16);
    }
    while (v13);
  }

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v67, 8);

  return v44;
}

+ (id)rankedSuggestionsFromSuggestionCandidates:(id)a3 suggestionType:(unint64_t)a4 queryAssetCount:(unint64_t)a5 queryCollectionCount:(unint64_t)a6 suggestionLimit:(unint64_t)a7
{
  void *v11;
  id v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  id v23;
  NSObject *v24;
  id v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  uint8_t *v36;
  id v37;
  unint64_t v38;
  unint64_t v39;
  uint8_t buf[8];
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  if (objc_msgSend(v26, "count"))
  {
    *(_QWORD *)buf = 0;
    v41 = buf;
    v42 = 0x2020000000;
    v43 = 0;
    v11 = (void *)objc_opt_new();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __148__PLScopedSearchSuggestionGeneration_rankedSuggestionsFromSuggestionCandidates_suggestionType_queryAssetCount_queryCollectionCount_suggestionLimit___block_invoke;
    v34[3] = &unk_1E36777C0;
    v37 = a1;
    v38 = a5;
    v39 = a6;
    v12 = v11;
    v35 = v12;
    v36 = buf;
    objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v34);
    if (*((_QWORD *)v41 + 3) >= a7)
      v13 = a7;
    else
      v13 = *((_QWORD *)v41 + 3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_suggestionsOrderedUserCategories");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    while (objc_msgSend(v14, "count") < v13)
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v16 = v27;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v31;
LABEL_9:
        v19 = 0;
        while (1)
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(v16);
          objc_msgSend(v12, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v19));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15 < objc_msgSend(v20, "count"))
          {
            objc_msgSend(v20, "objectAtIndex:", v15);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v21);

          }
          v22 = objc_msgSend(v14, "count") < v13;

          if (!v22)
            break;
          if (v17 == ++v19)
          {
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
            if (v17)
              goto LABEL_9;
            break;
          }
        }
      }

      ++v15;
    }
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __148__PLScopedSearchSuggestionGeneration_rankedSuggestionsFromSuggestionCandidates_suggestionType_queryAssetCount_queryCollectionCount_suggestionLimit___block_invoke_2;
    v28[3] = &unk_1E36777E8;
    v23 = v27;
    v29 = v23;
    objc_msgSend(v14, "sortUsingComparator:", v28);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    PLSearchBackendQueryGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_INFO, "No suggestion candidates provided for suggestion ranking", buf, 2u);
    }

    v14 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

+ (id)_rankedSuggestionsFromSuggestions:(id)a3 queryAssetCount:(unint64_t)a4 queryCollectionCount:(unint64_t)a5
{
  _QWORD v6[7];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __109__PLScopedSearchSuggestionGeneration__rankedSuggestionsFromSuggestions_queryAssetCount_queryCollectionCount___block_invoke;
  v6[3] = &__block_descriptor_56_e69_q24__0__PLSearchSuggestionComponent_8__PLSearchSuggestionComponent_16l;
  v6[4] = a1;
  v6[5] = a4;
  v6[6] = a5;
  objc_msgSend(a3, "sortedArrayUsingComparator:", v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (double)_scoreForSuggestion:(id)a3 queryAssetCount:(unint64_t)a4 queryCollectionCount:(unint64_t)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  double v15;
  double v16;
  unint64_t v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  NSObject *v27;
  int v29;
  double v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(a1, "suggestionScoreForIndexCategory:", objc_msgSend(v8, "indexCategory"));
  v10 = v9;
  v11 = (double)(unint64_t)objc_msgSend(v8, "matchedAssetsCount") / (double)a4;
  v12 = (double)(unint64_t)objc_msgSend(v8, "matchedCollectionsCount") / (double)a5;
  v13 = objc_msgSend(v8, "matchRangeOfSearchText");
  v15 = 0.0;
  v16 = 0.0;
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = v14;
    v18 = (double)v13;
    objc_msgSend(v8, "contentString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v18 / (double)(unint64_t)objc_msgSend(v19, "length");

    v15 = 1.0 - v20;
    v21 = (double)v17;
    objc_msgSend(v8, "contentString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v21 / (double)(unint64_t)objc_msgSend(v22, "length");

  }
  v23 = v10 * 2.0 + 0.0 + v15 + v16;
  if (objc_msgSend(v8, "matchedAssetsCount"))
    v24 = v11;
  else
    v24 = v12;
  v25 = (v23 + v24) / 5.0;
  if (v25 < 0.0 || v25 > 1.0)
  {
    PLSearchBackendQueryGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v29 = 134218242;
      v30 = v25;
      v31 = 2112;
      v32 = v8;
      _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "Suggestion score is out of bounds. Using default score of 0. Score %f, Suggestion: %@", (uint8_t *)&v29, 0x16u);
    }

    v25 = 0.0;
  }

  return v25;
}

+ (id)suggestionsQueryForSuggestionType:(unint64_t)a3 suggestionLimit:(unint64_t)a4 queryText:(id)a5 resultTypes:(unint64_t)a6 libraryScope:(unint64_t)a7 searchIndex:(id)a8
{
  id v15;
  id v16;
  void *v17;
  void *v19;

  v15 = a5;
  v16 = a8;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLScopedSearchSuggestionGeneration.m"), 951, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchIndex"));

  }
  v17 = (void *)objc_msgSend(v16, "newSuggestionsQueryForQueryText:suggestionType:suggestionLimit:resultTypes:libraryScope:", v15, a3, a4, a6, a7);

  return v17;
}

uint64_t __109__PLScopedSearchSuggestionGeneration__rankedSuggestionsFromSuggestions_queryAssetCount_queryCollectionCount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_scoreForSuggestion:queryAssetCount:queryCollectionCount:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "_scoreForSuggestion:queryAssetCount:queryCollectionCount:", v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (v8 <= v9)
  {
    if (v8 < v9)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(v5, "contentString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contentString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v11, "localizedCompare:", v12);

    }
  }
  else
  {
    v10 = -1;
  }

  return v10;
}

void __148__PLScopedSearchSuggestionGeneration_rankedSuggestionsFromSuggestionCandidates_suggestionType_queryAssetCount_queryCollectionCount_suggestionLimit___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  v5 = *(void **)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v8 = a2;
  objc_msgSend(v5, "_rankedSuggestionsFromSuggestions:queryAssetCount:queryCollectionCount:", a3, v6, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v8);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v9, "count");
}

uint64_t __148__PLScopedSearchSuggestionGeneration_rankedSuggestionsFromSuggestionCandidates_suggestionType_queryAssetCount_queryCollectionCount_suggestionLimit___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSObject *v16;
  uint64_t v17;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "userCategory");
  v8 = objc_msgSend(v6, "userCategory");
  v9 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "indexOfObject:", v10);

  v12 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "indexOfObject:", v13);

  if (v11 == 0x7FFFFFFFFFFFFFFFLL || v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLSearchBackendQueryGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = 138412546;
      v20 = v5;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Failed to determine Suggestion position while sorting suggestions: %@, %@", (uint8_t *)&v19, 0x16u);
    }

  }
  if (v11 < v14)
    v17 = -1;
  else
    v17 = v11 > v14;

  return v17;
}

void __154__PLScopedSearchSuggestionGeneration_generateNextTermSuggestionsForQueryMatchedScopedAssetIds_queryMatchedScopedCollectionIds_searchResultTypes_delegate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __154__PLScopedSearchSuggestionGeneration_generateNextTermSuggestionsForQueryMatchedScopedAssetIds_queryMatchedScopedCollectionIds_searchResultTypes_delegate___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __146__PLScopedSearchSuggestionGeneration__rankedSearchSuggestionsFromSuggestions_queryAssetCount_queryCollectionCount_suggestionType_suggestionQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v21;
  void *v22;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 40), "_averageGroupRankingScoreForSuggestion:", v5);
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 40), "_averageGroupRankingScoreForSuggestion:", v6);
  v10 = v9;
  v11 = objc_msgSend(*(id *)(a1 + 40), "_countBasedPriorityForSuggestion:queryAssetCount:queryCollectionCount:", v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v12 = objc_msgSend(*(id *)(a1 + 40), "_countBasedPriorityForSuggestion:queryAssetCount:queryCollectionCount:", v6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "_percentOverlapWithCompletionText:suggestionQuery:minPercentOverlapForPrioritization:", v5, *(_QWORD *)(a1 + 32), 0.5);
  v14 = v13;
  objc_msgSend(*(id *)(a1 + 40), "_percentOverlapWithCompletionText:suggestionQuery:minPercentOverlapForPrioritization:", v6, *(_QWORD *)(a1 + 32), 0.5);
  v16 = v15;
  v17 = objc_msgSend(*(id *)(a1 + 40), "_characterLengthForSuggestion:suggestionQuery:", v5, *(_QWORD *)(a1 + 32));
  v18 = objc_msgSend(*(id *)(a1 + 40), "_characterLengthForSuggestion:suggestionQuery:", v6, *(_QWORD *)(a1 + 32));
  if (*(_QWORD *)(a1 + 64) == 1)
  {
    if (v14 == 1.0)
      goto LABEL_11;
    if (v16 == 1.0)
      goto LABEL_14;
  }
  if (v8 <= v10)
  {
    if (v8 < v10)
      goto LABEL_14;
    if (v11 <= v12)
    {
      if (v11 < v12)
        goto LABEL_14;
      if (v14 <= v16)
      {
        if (v14 >= v16)
        {
          if (v17 < v18)
            goto LABEL_11;
          if (v17 <= v18)
          {
            objc_msgSend(v5, "contentString");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "contentString");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v21, "localizedCompare:", v22);

            goto LABEL_15;
          }
        }
LABEL_14:
        v19 = 1;
        goto LABEL_15;
      }
    }
  }
LABEL_11:
  v19 = -1;
LABEL_15:

  return v19;
}

uint64_t __71__PLScopedSearchSuggestionGeneration_sortedSuggestionsFromSuggestions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v4, "categoriesType") == 7 || objc_msgSend(v4, "categoriesType") == 9)
  {
    v6 = -1;
  }
  else if (objc_msgSend(v5, "categoriesType") == 7 || objc_msgSend(v5, "categoriesType") == 9)
  {
    v6 = 1;
  }
  else
  {
    v7 = objc_msgSend(v4, "matchedAssetsCount");
    if (!v7)
      v7 = objc_msgSend(v4, "matchedCollectionsCount");
    v8 = objc_msgSend(v5, "matchedAssetsCount");
    if (!v8)
      v8 = objc_msgSend(v5, "matchedCollectionsCount");
    if (v7 > v8)
      v6 = -1;
    else
      v6 = v7 < v8;
  }

  return v6;
}

void __170__PLScopedSearchSuggestionGeneration_rankedSearchSuggestionsFromSuggestionCandidates_suggestionType_queryAssetCount_queryCollectionCount_suggestionLimit_suggestionQuery___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  v5 = *(void **)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 80);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = a2;
  objc_msgSend(v5, "_rankedSearchSuggestionsFromSuggestions:queryAssetCount:queryCollectionCount:suggestionType:suggestionQuery:", a3, v6, v7, v8, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, v10);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v11, "count");
}

void __170__PLScopedSearchSuggestionGeneration_rankedSearchSuggestionsFromSuggestionCandidates_suggestionType_queryAssetCount_queryCollectionCount_suggestionLimit_suggestionQuery___block_invoke_2(_QWORD *a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);

}

@end
