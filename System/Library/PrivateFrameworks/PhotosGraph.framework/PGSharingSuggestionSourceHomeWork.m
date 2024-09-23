@implementation PGSharingSuggestionSourceHomeWork

- (id)name
{
  return CFSTR("Home/Work");
}

- (id)details
{
  return CFSTR("Return Home/Work owner suggestions");
}

- (double)weight
{
  return 0.6;
}

- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  PGGraphPersonNodeCollection *v17;
  void *v18;
  void *v19;
  void *v22;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "momentNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v4;
  objc_msgSend(v4, "graph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_checkCanRead");
  v7 = objc_alloc_init(MEMORY[0x1E0D429B0]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    v12 = MEMORY[0x1E0C809B0];
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v13);
        v23[0] = v12;
        v23[1] = 3221225472;
        v23[2] = __74__PGSharingSuggestionSourceHomeWork_suggestedResultsForInput_withOptions___block_invoke;
        v23[3] = &unk_1E8434620;
        v24 = v7;
        objc_msgSend(v14, "enumeratePreciseAddressNodesUsingBlock:", v23);

        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count")
    && (objc_msgSend(v6, "meNodeCollection"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v15, "elementIdentifiers"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "subtractIdentifierSet:", v16),
        v16,
        v15,
        objc_msgSend(v7, "count")))
  {
    v17 = -[MAElementCollection initWithGraph:elementIdentifiers:]([PGGraphPersonNodeCollection alloc], "initWithGraph:elementIdentifiers:", v6, v7);
    -[MAElementCollection temporarySet](v17, "temporarySet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGSharingSuggestionSource suggestionResultsWithPersons:](self, "suggestionResultsWithPersons:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

void __74__PGSharingSuggestionSourceHomeWork_suggestedResultsForInput_withOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "collection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeWorkNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ownerNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elementIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionWithIdentifierSet:", v5);

}

@end
