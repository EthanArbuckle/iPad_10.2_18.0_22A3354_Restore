@implementation PGSharingSuggestionSourceTimeBasedFriend

- (id)name
{
  return CFSTR("Top Friends Time");
}

- (id)details
{
  return CFSTR("Return suggestions based on the top friends at the time");
}

- (double)weight
{
  return 0.25;
}

- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4
{
  id v4;
  void *v5;
  PGGraphMomentNodeCollection *v6;
  void *v7;
  PGGraphMomentNodeCollection *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v24;
  PGGraphMomentNodeCollection *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "graph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [PGGraphMomentNodeCollection alloc];
  objc_msgSend(v4, "momentNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MAElementCollection initWithArray:graph:](v6, "initWithArray:graph:", v7, v5);

  v25 = v8;
  -[PGGraphMomentNodeCollection dateNodes](v8, "dateNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "yearNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v10;
  objc_msgSend(v10, "dateNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "momentNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sortedSocialGroupNodesWithMomentNodes:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v28;
LABEL_3:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v19)
        objc_enumerationMutation(v15);
      objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v20), "personNodes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "unionSet:", v21);

      if ((v18 & 1) != 0)
        break;
      ++v20;
      v18 = 1;
      if (v17 == v20)
      {
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v17)
          goto LABEL_3;
        break;
      }
    }
  }

  -[PGSharingSuggestionSource suggestionResultsWithPersons:](self, "suggestionResultsWithPersons:", v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

@end
