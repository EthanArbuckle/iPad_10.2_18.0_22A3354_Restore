@implementation PGSharingSuggestionSourceCoworker

- (id)name
{
  return CFSTR("Coworker");
}

- (id)details
{
  return CFSTR("Return coworker suggestions for work events");
}

- (double)weight
{
  return 0.6;
}

- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18 = a4;
  objc_msgSend(v5, "momentNodes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "graph");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "coworkers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v20, "meNodeCollection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_opt_new();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v19;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v37;
      v9 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v37 != v8)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          v32 = 0;
          v33 = &v32;
          v34 = 0x2020000000;
          v35 = 0;
          v28 = 0;
          v29 = &v28;
          v30 = 0x2020000000;
          v31 = 0;
          v24[0] = v9;
          v24[1] = 3221225472;
          v24[2] = __74__PGSharingSuggestionSourceCoworker_suggestedResultsForInput_withOptions___block_invoke;
          v24[3] = &unk_1E842F0C8;
          v25 = v6;
          v26 = &v32;
          v27 = &v28;
          objc_msgSend(v11, "enumeratePersonNodesUsingBlock:", v24);
          if (v33[3])
          {
            if (objc_msgSend(v11, "happensPartiallyAtWorkOfPersonNodes:", v23)
              || (v12 = v33[3], v12 >= 3) && (double)v12 / (double)(v29[3] + v12) >= 0.75)
            {
              objc_msgSend(v21, "addObject:", v11);
            }
          }

          _Block_object_dispose(&v28, 8);
          _Block_object_dispose(&v32, 8);
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v7);
    }

    if (objc_msgSend(v21, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_44829);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "filteredSetUsingPredicate:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[PGSharingSuggestionSource suggestionResultsWithPersons:](self, "suggestionResultsWithPersons:", v14);
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

uint64_t __74__PGSharingSuggestionSourceCoworker_suggestedResultsForInput_withOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
  v4 = 48;
  if ((_DWORD)result)
    v4 = 40;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + v4) + 8) + 24);
  return result;
}

BOOL __74__PGSharingSuggestionSourceCoworker_suggestedResultsForInput_withOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  _BOOL8 v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a2;
  v5 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__44831;
  v16 = __Block_byref_object_dispose__44832;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "momentNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__PGSharingSuggestionSourceCoworker_suggestedResultsForInput_withOptions___block_invoke_178;
  v11[3] = &unk_1E842FA68;
  v11[4] = &v12;
  objc_msgSend(v7, "enumerateNodesUsingBlock:", v11);

  objc_msgSend((id)v13[5], "timeIntervalSinceNow");
  v9 = fabs(v8) < 15778800.0;
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __74__PGSharingSuggestionSourceCoworker_suggestedResultsForInput_withOptions___block_invoke_178(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "universalStartDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "laterDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

@end
