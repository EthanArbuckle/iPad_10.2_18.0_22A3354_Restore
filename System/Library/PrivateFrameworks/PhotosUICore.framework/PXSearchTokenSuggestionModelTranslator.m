@implementation PXSearchTokenSuggestionModelTranslator

+ (id)searchTokenSuggestionsFromCompletions:(id)a3 searchText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  PXNewSearchToken *v16;
  void *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "suggestionText");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_attributedTitleForTokenTitle:searchText:", v14, v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = -[PXNewSearchToken initWithAttributedTitle:queryToken:type:priorityAssetUUID:]([PXNewSearchToken alloc], "initWithAttributedTitle:queryToken:type:priorityAssetUUID:", v15, v13, 2, 0);
        objc_msgSend(v8, "addObject:", v16);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  v17 = (void *)objc_msgSend(v8, "copy");
  return v17;
}

+ (id)_attributedTitleForTokenTitle:(id)a3 searchText:(id)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  if (!objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchTokenSuggestionModelTranslator.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tokenTitle.length > 0"));

  }
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchTokenSuggestionModelTranslator.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchText.length > 0"));

  }
  v9 = objc_alloc(MEMORY[0x1E0CB3778]);
  v24 = *MEMORY[0x1E0DC1140];
  v10 = v24;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithString:attributes:", v8, v12);

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v8, "localizedStandardRangeOfString:", v15);
  v18 = v17;

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAttribute:value:range:", v10, v19, v16, v18);

  v20 = (void *)objc_msgSend(v13, "copy");
  return v20;
}

+ (id)searchTokenSuggestionsFromNextTokenSuggestions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  PXNewSearchToken *v11;
  void *v12;
  PXNewSearchToken *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v11 = [PXNewSearchToken alloc];
        objc_msgSend(v10, "suggestionText", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[PXNewSearchToken initWithTitle:queryToken:type:priorityAssetUUID:](v11, "initWithTitle:queryToken:type:priorityAssetUUID:", v12, v10, 3, 0);

        objc_msgSend(v4, "addObject:", v13);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v14 = (void *)objc_msgSend(v4, "copy");
  return v14;
}

+ (id)searchTokenSuggestionsFromWordEmbeddings:(id)a3 sceneAncestryInformation:(id)a4 searchText:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD aBlock[4];
  id v28;
  id v29;
  id v30;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __119__PXSearchTokenSuggestionModelTranslator_searchTokenSuggestionsFromWordEmbeddings_sceneAncestryInformation_searchText___block_invoke;
  aBlock[3] = &unk_1E511E6B0;
  v29 = v11;
  v30 = a1;
  v28 = v9;
  v13 = v11;
  v14 = v9;
  v15 = _Block_copy(aBlock);
  objc_msgSend(a1, "_sortedWordEmbeddingsForCurrentQueryFromSubstitutions:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __119__PXSearchTokenSuggestionModelTranslator_searchTokenSuggestionsFromWordEmbeddings_sceneAncestryInformation_searchText___block_invoke_2;
  v22[3] = &unk_1E511E700;
  v23 = v8;
  v24 = v16;
  v25 = v15;
  v26 = a1;
  v17 = v15;
  v18 = v16;
  v19 = v8;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v22);
  v20 = (void *)objc_msgSend(v13, "copy");

  return v20;
}

+ (id)_attributedTitleForWordEmbeddingMatchedText:(id)a3 replacementText:(id)a4 searchText:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchTokenSuggestionModelTranslator.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("wordEmbeddingReplacementText"));

    if (v11)
      goto LABEL_4;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchTokenSuggestionModelTranslator.m"), 164, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("wordEmbeddingMatchedText"));

  if (!v10)
    goto LABEL_9;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchTokenSuggestionModelTranslator.m"), 166, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchText"));

LABEL_4:
  v36 = v10;
  if (objc_msgSend(a1, "_isRTL"))
  {
    PXLocalizedStringFromTable(CFSTR("SEARCH_RESULTS_WORD_EMBEDDINGS_SUBSTITUTION_ARROW_RTL"), CFSTR("PhotosUICore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@"), v10, v12, v9);
  }
  else
  {
    PXLocalizedStringFromTable(CFSTR("SEARCH_RESULTS_WORD_EMBEDDINGS_SUBSTITUTION_ARROW_LTR"), CFSTR("PhotosUICore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@"), v9, v12, v10);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v13);
  v15 = objc_msgSend(v13, "rangeOfString:", v9);
  v17 = v16;
  v35 = v9;
  v18 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAttribute:value:range:", v18, v19, v15, v17);

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v13, "localizedStandardRangeOfString:", v21);
  v24 = v23;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAttribute:value:range:", v18, v25, v22, v24);

  v26 = objc_msgSend(v13, "rangeOfString:", v12);
  v28 = v27;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAttribute:value:range:", v18, v29, v26, v28);

  v30 = (void *)objc_msgSend(v14, "copy");
  return v30;
}

+ (id)_bestParentWordEmbeddingsWithWordEmbeddings:(id)a3 sceneAncestryInformation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  id v33;
  id obj;
  uint64_t v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[3];
  _QWORD v46[3];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v36 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v42;
    v13 = *MEMORY[0x1E0D72DD0];
    obj = v8;
    v35 = *MEMORY[0x1E0D72DC0];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v15, "objectForKeyedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v16);
        objc_msgSend(v6, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(v36, "addObject:", v17);
          if (!v11)
          {
            objc_msgSend(v15, "objectForKeyedSubscript:", v35);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }

      }
      v8 = obj;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v10);

    if (!v11)
    {
      v30 = 0;
      goto LABEL_23;
    }
    v32 = v7;
    v33 = v6;
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v19 = v36;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v38;
      v23 = *MEMORY[0x1E0D72DC8];
      do
      {
        for (j = 0; j != v21; ++j)
        {
          v25 = v18;
          if (*(_QWORD *)v38 != v22)
            objc_enumerationMutation(v19);
          v26 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
          v27 = objc_msgSend(v19, "countForObject:", v26);
          v46[0] = v11;
          v45[0] = v35;
          v45[1] = v23;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v45[2] = v13;
          v46[1] = v28;
          v46[2] = v26;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = v25;
          objc_msgSend(v25, "addObject:", v29);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      }
      while (v21);
    }

    objc_msgSend(v18, "sortedArrayUsingComparator:", &__block_literal_global_58403);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v33;
    v8 = obj;
    v7 = v32;
  }
  else
  {
    v11 = 0;
    v30 = 0;
    v18 = v8;
  }

LABEL_23:
  return v30;
}

+ (id)_sortedWordEmbeddingsForCurrentQueryFromSubstitutions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (!_sortedWordEmbeddingsForCurrentQueryFromSubstitutions__wordEmbeddingsToReturn
    || (objc_msgSend((id)_sortedWordEmbeddingsForCurrentQueryFromSubstitutions__previousWordEmbeddings, "isEqualToDictionary:", v4) & 1) == 0)
  {
    objc_storeStrong((id *)&_sortedWordEmbeddingsForCurrentQueryFromSubstitutions__previousWordEmbeddings, a3);
    objc_msgSend(v4, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_165);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__58393;
    v15 = __Block_byref_object_dispose__58394;
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __96__PXSearchTokenSuggestionModelTranslator__sortedWordEmbeddingsForCurrentQueryFromSubstitutions___block_invoke_2;
    v10[3] = &unk_1E51369E0;
    v10[4] = &v11;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);
    objc_storeStrong((id *)&_sortedWordEmbeddingsForCurrentQueryFromSubstitutions__wordEmbeddingsToReturn, (id)v12[5]);
    _Block_object_dispose(&v11, 8);

  }
  v8 = (id)_sortedWordEmbeddingsForCurrentQueryFromSubstitutions__wordEmbeddingsToReturn;

  return v8;
}

+ (BOOL)_isRTL
{
  if (_isRTL_onceToken != -1)
    dispatch_once(&_isRTL_onceToken, &__block_literal_global_168);
  return _isRTL_isRTL;
}

uint64_t __48__PXSearchTokenSuggestionModelTranslator__isRTL__block_invoke()
{
  return px_dispatch_on_main_queue_sync();
}

void __48__PXSearchTokenSuggestionModelTranslator__isRTL__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _isRTL_isRTL = objc_msgSend(v0, "userInterfaceLayoutDirection") == 1;

}

void __96__PXSearchTokenSuggestionModelTranslator__sortedWordEmbeddingsForCurrentQueryFromSubstitutions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v17 = a1;
    v7 = *(_QWORD *)v19;
    v8 = *MEMORY[0x1E0D72DC0];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "allValues");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "objectForKey:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v13);

        if (v15)
        {
          objc_msgSend(v11, "addObject:", v3);

          goto LABEL_13;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v6)
        continue;
      break;
    }

    a1 = v17;
  }
  else
  {

    v8 = *MEMORY[0x1E0D72DC0];
  }
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v11, "addObject:", v3);
  objc_msgSend(v3, "objectForKey:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, v16);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v4);
LABEL_13:

}

BOOL __96__PXSearchTokenSuggestionModelTranslator__sortedWordEmbeddingsForCurrentQueryFromSubstitutions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v4 = a2;
  v5 = a3;
  v6 = *MEMORY[0x1E0D72DC0];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D72DC0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", v8))
  {
    v9 = *MEMORY[0x1E0D72DC8];
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D72DC8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "compare:", v11);
    if (!v12)
    {
      v13 = *MEMORY[0x1E0D72DD0];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D72DD0]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v14, "caseInsensitiveCompare:", v15);

    }
    v16 = v12 == -1;

  }
  else
  {
    v17 = objc_msgSend(v7, "length");
    v18 = objc_msgSend(v8, "length");
    if (v17 == v18)
    {
      v19 = *MEMORY[0x1E0D72DD0];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D72DD0]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v20, "caseInsensitiveCompare:", v21) == -1;

    }
    else
    {
      v16 = v17 > v18;
    }
  }

  return v16;
}

uint64_t __111__PXSearchTokenSuggestionModelTranslator__bestParentWordEmbeddingsWithWordEmbeddings_sceneAncestryInformation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v4 = a2;
  v5 = a3;
  v6 = *MEMORY[0x1E0D72DC8];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72DC8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  if (v9 > v12)
    v13 = -1;
  else
    v13 = v9 < v12;
  if (!v13)
  {
    v14 = *MEMORY[0x1E0D72DD0];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72DD0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v15, "compare:", v16);

  }
  return v13;
}

void __119__PXSearchTokenSuggestionModelTranslator_searchTokenSuggestionsFromWordEmbeddings_sceneAncestryInformation_searchText___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  PXNewSearchToken *v9;
  id v10;

  v5 = *(void **)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  objc_msgSend(v5, "_attributedTitleForWordEmbeddingMatchedText:replacementText:searchText:", a2, v7, v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71C08]), "initWithText:userCategory:matchType:", v7, 0, 2);

  v9 = -[PXNewSearchToken initWithAttributedTitle:queryToken:type:priorityAssetUUID:]([PXNewSearchToken alloc], "initWithAttributedTitle:queryToken:type:priorityAssetUUID:", v10, v8, 4, 0);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

}

void __119__PXSearchTokenSuggestionModelTranslator_searchTokenSuggestionsFromWordEmbeddings_sceneAncestryInformation_searchText___block_invoke_2(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v7 = a2;
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 56), "_bestParentWordEmbeddingsWithWordEmbeddings:sceneAncestryInformation:", v9, *(_QWORD *)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") < 2)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v10);
      v13 = MEMORY[0x1E0C809B0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __119__PXSearchTokenSuggestionModelTranslator_searchTokenSuggestionsFromWordEmbeddings_sceneAncestryInformation_searchText___block_invoke_3;
      v19[3] = &unk_1E5136908;
      v14 = v9;
      v20 = v14;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v19);
      objc_msgSend(v12, "addObjectsFromArray:", v14);
      v16[0] = v13;
      v16[1] = 3221225472;
      v16[2] = __119__PXSearchTokenSuggestionModelTranslator_searchTokenSuggestionsFromWordEmbeddings_sceneAncestryInformation_searchText___block_invoke_2_147;
      v16[3] = &unk_1E511E6D8;
      v18 = *(id *)(a1 + 48);
      v17 = v15;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v16);

    }
    else
    {
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0D72DD0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      if (a3 >= 3)
        *a4 = 1;
    }

  }
}

void __119__PXSearchTokenSuggestionModelTranslator_searchTokenSuggestionsFromWordEmbeddings_sceneAncestryInformation_searchText___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, uint64_t, _BYTE *);
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a2;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__58393;
  v17 = __Block_byref_object_dispose__58394;
  v18 = 0;
  v4 = *(void **)(a1 + 32);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __119__PXSearchTokenSuggestionModelTranslator_searchTokenSuggestionsFromWordEmbeddings_sceneAncestryInformation_searchText___block_invoke_145;
  v10 = &unk_1E51368E0;
  v5 = v3;
  v11 = v5;
  v12 = &v13;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v7);
  if (v14[5])
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v7, v8, v9, v10);
    v6 = (void *)v14[5];
    v14[5] = 0;

  }
  _Block_object_dispose(&v13, 8);

}

void __119__PXSearchTokenSuggestionModelTranslator_searchTokenSuggestionsFromWordEmbeddings_sceneAncestryInformation_searchText___block_invoke_2_147(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v7;

  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0D72DD0]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (a3 >= 3)
    *a4 = 1;

}

void __119__PXSearchTokenSuggestionModelTranslator_searchTokenSuggestionsFromWordEmbeddings_sceneAncestryInformation_searchText___block_invoke_145(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v7 = a2;
  v8 = *MEMORY[0x1E0D72DD0];
  v12 = v7;
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D72DD0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if (v11)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (PXSearchTokenSuggestionModelTranslator)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchTokenSuggestionModelTranslator.m"), 23, CFSTR("%s is not available as initializer"), "-[PXSearchTokenSuggestionModelTranslator init]");

  abort();
}

@end
