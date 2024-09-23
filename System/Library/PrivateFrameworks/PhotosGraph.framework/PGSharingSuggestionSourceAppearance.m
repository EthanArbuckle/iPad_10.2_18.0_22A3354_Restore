@implementation PGSharingSuggestionSourceAppearance

- (id)name
{
  return CFSTR("Appearance");
}

- (id)details
{
  return CFSTR("Return suggestions if the person appears in the photos");
}

- (double)weight
{
  return 1.0;
}

- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  PGSharingSuggestionSourceAppearance *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "momentNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "numberOfAssets");
        v16[0] = v11;
        v16[1] = 3221225472;
        v16[2] = __76__PGSharingSuggestionSourceAppearance_suggestedResultsForInput_withOptions___block_invoke;
        v16[3] = &unk_1E842E780;
        v19 = v14;
        v17 = v6;
        v18 = self;
        objc_msgSend(v13, "enumeratePersonEdgesAndNodesUsingBlock:", v16);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  return v6;
}

void __76__PGSharingSuggestionSourceAppearance_suggestedResultsForInput_withOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if ((objc_msgSend(v5, "isMeNode") & 1) == 0)
  {
    v6 = objc_msgSend(v9, "numberOfAssets");
    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "suggestionResultWithPerson:weight:", v5, (double)v6 / (double)*(unint64_t *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
}

@end
