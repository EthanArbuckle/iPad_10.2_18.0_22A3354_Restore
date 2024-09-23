@implementation PGSharingSuggestionSourceChildSocialGroup

- (id)name
{
  return CFSTR("Child Social Group");
}

- (id)details
{
  return CFSTR("Return social group suggestions including a present detected child");
}

- (double)weight
{
  return 0.25;
}

- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  uint64_t *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v30 = a4;
  v32 = v5;
  objc_msgSend(v5, "momentNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "graph");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v33, "meNode");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v42;
    v11 = MEMORY[0x1E0C809B0];
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v42 != v10)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v38[0] = v11;
        v38[1] = 3221225472;
        v38[2] = __82__PGSharingSuggestionSourceChildSocialGroup_suggestedResultsForInput_withOptions___block_invoke;
        v38[3] = &unk_1E84341D8;
        v39 = v7;
        v40 = &v45;
        objc_msgSend(v13, "enumeratePersonNodesUsingBlock:", v38);
        if (*((_BYTE *)v46 + 24))
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "set");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v39;
          v15 = v8;
          goto LABEL_24;
        }

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      if (v9)
        continue;
      break;
    }
  }

  if ((unint64_t)objc_msgSend(v7, "count") <= 2 && objc_msgSend(v7, "count"))
  {
    if (v31)
      v14 = 1;
    else
      v14 = 2;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "socialGroupNodesSortedByImportance");
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v49, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v35;
LABEL_16:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v35 != v18)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v19), "personNodes");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");
        if (v21 != v14)
          break;
        objc_msgSend(v15, "unionSet:", v20);

        if (v17 == ++v19)
        {
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v49, 16);
          if (v17)
            goto LABEL_16;
          goto LABEL_34;
        }
      }
      if (objc_msgSend(v15, "count") && !objc_msgSend(v15, "intersectsSet:", v20)
        || !objc_msgSend(v20, "intersectsSet:", v7))
      {

        goto LABEL_34;
      }
      if (v21 >= 6)
      {
        +[PGGraphPersonNode personScoreSortDescriptors](PGGraphPersonNode, "personScoreSortDescriptors");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "sortedArrayUsingDescriptors:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v25, "subarrayWithRange:", 0, 5);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setWithArray:", v27);
        v28 = objc_claimAutoreleasedReturnValue();

        v20 = (void *)v28;
      }
      -[PGSharingSuggestionSource suggestionResultsWithPersons:](self, "suggestionResultsWithPersons:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_34:

      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_24:

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v45, 8);

  return v22;
}

void __82__PGSharingSuggestionSourceChildSocialGroup_suggestedResultsForInput_withOptions___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((objc_msgSend(v7, "isMeNode") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    v5 = objc_msgSend(v7, "ageCategory");
    objc_msgSend(v7, "contactIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {

      if ((unint64_t)(v5 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        *a3 = 1;
      }
    }
    else
    {

    }
  }

}

@end
