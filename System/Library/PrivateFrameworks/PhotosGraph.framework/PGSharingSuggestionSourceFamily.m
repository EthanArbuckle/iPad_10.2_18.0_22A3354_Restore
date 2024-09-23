@implementation PGSharingSuggestionSourceFamily

- (id)name
{
  return CFSTR("Family");
}

- (id)details
{
  return CFSTR("Return family member suggestions for family related events");
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
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  unint64_t v21;
  void *v22;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[5];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v25 = a4;
  v27 = v5;
  objc_msgSend(v5, "momentNodes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "graph");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "familyMembers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "partners");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setByAddingObjectsFromSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    v29 = (void *)objc_opt_new();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = v26;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v49 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          objc_msgSend(v12, "collection");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "birthdayPersonNodes");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v14, "count")
            && (objc_msgSend(v14, "temporarySet"),
                v15 = (void *)objc_claimAutoreleasedReturnValue(),
                v16 = objc_msgSend(v15, "intersectsSet:", v8),
                v15,
                v16))
          {
            objc_msgSend(v29, "addObject:", v12);
          }
          else
          {
            v44 = 0;
            v45 = &v44;
            v46 = 0x2020000000;
            v47 = 0;
            v43[0] = MEMORY[0x1E0C809B0];
            v43[1] = 3221225472;
            v43[2] = __72__PGSharingSuggestionSourceFamily_suggestedResultsForInput_withOptions___block_invoke;
            v43[3] = &unk_1E842FD68;
            v43[4] = &v44;
            objc_msgSend(v12, "enumerateCelebratedHolidayNodesUsingBlock:", v43);
            if (*((_BYTE *)v45 + 24))
              goto LABEL_15;
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Wedding"), CFSTR("Celebration"), CFSTR("Gathering"), 0);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "meaningLabels");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "intersectsSet:", v17);

            v20 = *((_BYTE *)v45 + 24) ? 1 : v19;
            if (v20 == 1)
            {
LABEL_15:
              v39 = 0;
              v40 = &v39;
              v41 = 0x2020000000;
              v42 = 0;
              v35 = 0;
              v36 = &v35;
              v37 = 0x2020000000;
              v38 = 0;
              v31[0] = MEMORY[0x1E0C809B0];
              v31[1] = 3221225472;
              v31[2] = __72__PGSharingSuggestionSourceFamily_suggestedResultsForInput_withOptions___block_invoke_2;
              v31[3] = &unk_1E842F0C8;
              v32 = v8;
              v33 = &v39;
              v34 = &v35;
              objc_msgSend(v12, "enumeratePersonNodesUsingBlock:", v31);
              v21 = v40[3];
              if (v21 >= 2 && (double)v21 / (double)(v36[3] + v21) >= 0.25)
                objc_msgSend(v29, "addObject:", v12);

              _Block_object_dispose(&v35, 8);
              _Block_object_dispose(&v39, 8);
            }
            _Block_object_dispose(&v44, 8);
          }

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v29, "count"))
      -[PGSharingSuggestionSource suggestionResultsWithPersons:](self, "suggestionResultsWithPersons:", v8);
    else
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

uint64_t __72__PGSharingSuggestionSourceFamily_suggestedResultsForInput_withOptions___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "category");
  if (result == 2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t __72__PGSharingSuggestionSourceFamily_suggestedResultsForInput_withOptions___block_invoke_2(uint64_t a1, uint64_t a2)
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

@end
