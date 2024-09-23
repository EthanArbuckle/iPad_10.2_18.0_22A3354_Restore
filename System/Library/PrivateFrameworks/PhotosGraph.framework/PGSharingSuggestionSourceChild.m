@implementation PGSharingSuggestionSourceChild

- (id)name
{
  return CFSTR("Child");
}

- (id)details
{
  return CFSTR("Return close family member suggestions for moments with the user's children");
}

- (double)weight
{
  return 0.6;
}

- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18 = a4;
  objc_msgSend(v5, "momentNodes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "graph");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v21, "parents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "partners");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setByAddingObjectsFromSet:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v19, "count"))
    {
      v22 = (void *)objc_opt_new();
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v9 = v20;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v31;
        v12 = MEMORY[0x1E0C809B0];
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v31 != v11)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            v26 = 0;
            v27 = &v26;
            v28 = 0x2020000000;
            v29 = 0;
            v23[0] = v12;
            v23[1] = 3221225472;
            v23[2] = __71__PGSharingSuggestionSourceChild_suggestedResultsForInput_withOptions___block_invoke;
            v23[3] = &unk_1E84341D8;
            v24 = v6;
            v25 = &v26;
            objc_msgSend(v14, "enumeratePersonNodesUsingBlock:", v23);
            if (*((_BYTE *)v27 + 24))
              objc_msgSend(v22, "addObject:", v14);

            _Block_object_dispose(&v26, 8);
          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v10);
      }

      if (objc_msgSend(v22, "count"))
        -[PGSharingSuggestionSource suggestionResultsWithPersons:](self, "suggestionResultsWithPersons:", v19);
      else
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

uint64_t __71__PGSharingSuggestionSourceChild_suggestedResultsForInput_withOptions___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

@end
