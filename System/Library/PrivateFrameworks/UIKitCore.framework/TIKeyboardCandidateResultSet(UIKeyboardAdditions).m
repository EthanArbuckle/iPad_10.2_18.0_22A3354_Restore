@implementation TIKeyboardCandidateResultSet(UIKeyboardAdditions)

- (uint64_t)hasOnlyTextSuggestions
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "isDummySet") & 1) != 0)
    return 0;
  objc_msgSend(a1, "candidates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
    return 0;
  v13 = 0u;
  v14 = 0u;
  v12 = 0u;
  objc_msgSend(a1, "candidates", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v9 = 0;
          goto LABEL_14;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_14:

  return v9;
}

- (uint64_t)hasOnlySlottedCandidates
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "isDummySet") & 1) != 0)
    return 0;
  objc_msgSend(a1, "candidates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "candidates", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isSlottedCandidate") & 1) == 0 && !objc_msgSend(v9, "isAutofillCandidate"))
        {
          v10 = 0;
          goto LABEL_15;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_15:

  return v10;
}

- (uint64_t)hasOnlyCompletionCandidates
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "isDummySet") & 1) != 0)
    return 0;
  objc_msgSend(a1, "candidates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a1, "candidates", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "isCompletionCandidate"))
        {
          v9 = 0;
          goto LABEL_14;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_14:

  return v9;
}

- (uint64_t)slottedCandidatesCount
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "isDummySet") & 1) != 0)
    return 0;
  objc_msgSend(a1, "candidates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a1, "candidates", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        v7 += objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "isSlottedCandidate");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)hasAutofillCandidates
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "isDummySet") & 1) != 0)
    return 0;
  objc_msgSend(a1, "candidates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
    return 0;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(a1, "candidates", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isAutofillCandidate") & 1) != 0)
        {
          v5 = 1;
          goto LABEL_14;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_14:

  return v5;
}

- (id)ui_uniqueSupplementalCandidates
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(a1, "candidatesIfSupplemental");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithArray:copyItems:", v3, 1);

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v33 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v11, "candidate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v13, "supplementalItemIdentifiers");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "supplementalItemIdentifiers");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setSupplementalItemIdentifiers:", v16);

          }
          else
          {
            objc_msgSend(v11, "candidate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKey:", v11, v14);
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v8);
    }

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v18 = v6;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
          objc_msgSend(v23, "candidate", (_QWORD)v28);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKey:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            objc_msgSend(v17, "addObject:", v25);
            objc_msgSend(v23, "candidate");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "removeObjectForKey:", v26);

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v20);
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v17;
}

@end
