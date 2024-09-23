@implementation PGSharingSuggestionSourceActivity

- (id)name
{
  return CFSTR("Activity");
}

- (id)details
{
  return CFSTR("Return people related to activity");
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
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  id v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  void *v30;
  id v31;
  void *v32;
  id obj;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v31 = a4;
  v32 = v5;
  objc_msgSend(v5, "momentNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "graph");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "_checkCanRead");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v52 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "meaningLabels");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "unionSet:", v12);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v9);
  }

  if (!objc_msgSend(v7, "count"))
    goto LABEL_31;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Hiking"), CFSTR("Climbing"), CFSTR("Beaching"), CFSTR("Diving"), CFSTR("WinterSport"), CFSTR("AmusementPark"), CFSTR("Performance"), CFSTR("Concert"), CFSTR("Festival"), CFSTR("SportEvent"), CFSTR("NightOut"), CFSTR("Museum"), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intersectSet:", v30);
  if (!objc_msgSend(v7, "count"))
  {
LABEL_30:

LABEL_31:
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v7;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  if (v14)
  {
    v34 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v48 != v34)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CB3550], "set");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 0;
        v44 = &v43;
        v45 = 0x2020000000;
        v46 = 0;
        v18 = +[PGGraph meaningForMeaningLabel:](PGGraph, "meaningForMeaningLabel:", v16);
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __74__PGSharingSuggestionSourceActivity_suggestedResultsForInput_withOptions___block_invoke;
        v40[3] = &unk_1E8432DF8;
        v19 = v17;
        v41 = v19;
        v42 = &v43;
        objc_msgSend(v35, "enumerateMeaningfulEventsWithMeaning:usingBlock:", v18, v40);
        v20 = v44[3];
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v21 = v19;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v55, 16);
        if (v22)
        {
          v23 = (double)v20 * 0.5;
          v24 = *(_QWORD *)v37;
          do
          {
            for (k = 0; k != v22; ++k)
            {
              if (*(_QWORD *)v37 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * k);
              if ((objc_msgSend(v26, "isMeNode") & 1) == 0
                && v23 <= (double)(unint64_t)objc_msgSend(v21, "countForObject:", v26))
              {
                objc_msgSend(v13, "addObject:", v26);
              }
            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v55, 16);
          }
          while (v22);
        }

        _Block_object_dispose(&v43, 8);
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    }
    while (v14);
  }

  if (!objc_msgSend(v13, "count"))
  {

    goto LABEL_30;
  }
  -[PGSharingSuggestionSource suggestionResultsWithPersons:](self, "suggestionResultsWithPersons:", v13);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_32:
  return v27;
}

void __74__PGSharingSuggestionSourceActivity_suggestedResultsForInput_withOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "peopledEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v6 = v3;
    objc_msgSend(v3, "personNodes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unionSet:", v5);

    v3 = v6;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }

}

@end
