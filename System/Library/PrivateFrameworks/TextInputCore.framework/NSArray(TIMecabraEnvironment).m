@implementation NSArray(TIMecabraEnvironment)

- (id)deletionRangesWithElementsToKeep:()TIMecabraEnvironment
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  id v19;
  id v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v7)
    goto LABEL_18;
  v8 = v7;
  v19 = v4;
  v21 = 0;
  v9 = *(_QWORD *)v23;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      v14 = v11;
      v15 = v10;
      if (*(_QWORD *)v23 != v9)
        objc_enumerationMutation(v6);
      if (objc_msgSend(v5, "containsObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i)))
      {
        v10 = 0x7FFFFFFFFFFFFFFFLL;
        v11 = 0x7FFFFFFFFFFFFFFFLL;
        v12 = 0x7FFFFFFFFFFFFFFFLL;
        if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v14, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v16);

          v10 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      else
      {
        v17 = v12 == 0x7FFFFFFFFFFFFFFFLL;
        v12 = v21 + i;
        if (v17)
          v10 = 1;
        else
          ++v10;
        if (v17)
          v11 = v21 + i;
      }
    }
    v21 += i;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v8);

  v4 = v19;
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v11, v10);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v6);
LABEL_18:

  }
  return v20;
}

- (id)mecabraCandidateSurfaces
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(v2, "addObject:", MecabraCandidateGetSurface(), v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  return v2;
}

@end
