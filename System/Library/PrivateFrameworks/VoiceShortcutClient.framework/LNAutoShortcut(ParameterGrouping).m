@implementation LNAutoShortcut(ParameterGrouping)

- (id)allGroupedPhrases
{
  uint64_t v1;
  unint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  id v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  WFLocalizedPhrasesGroupedByParameterIdentifier(a1, &v16, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (unint64_t)v16;
  v3 = 0;
  if (v1 | v2)
  {
    v4 = (void *)objc_opt_new();
    v3 = v4;
    if (v2)
      objc_msgSend(v4, "addObject:", v2);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = (id)v1;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "phrases", (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v7);
    }

  }
  return v3;
}

- (id)primaryPhrases
{
  id v1;
  id v3;

  v3 = 0;
  v1 = WFLocalizedPhrasesGroupedByParameterIdentifier(a1, 0, &v3);
  return v3;
}

- (id)parameterlessPhrases
{
  id v1;
  id v3;

  v3 = 0;
  v1 = WFLocalizedPhrasesGroupedByParameterIdentifier(a1, &v3, 0);
  return v3;
}

- (id)parameterGroups
{
  return WFLocalizedPhrasesGroupedByParameterIdentifier(a1, 0, 0);
}

@end
