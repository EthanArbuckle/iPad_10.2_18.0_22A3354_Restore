@implementation UIPasteboard(PCXPasteboardAdditions)

+ (uint64_t)pcxPasteboardWithName:()PCXPasteboardAdditions
{
  if (!PCInfo_IsUnitTesting())
    return objc_msgSend(MEMORY[0x1E0CEA810], "pasteboardWithName:create:", a3, 1);
  if (pcxPasteboardWithName__s_makePasteboardOnce != -1)
    dispatch_once(&pcxPasteboardWithName__s_makePasteboardOnce, &__block_literal_global_59);
  return pcxPasteboardWithName__s_utPasteboard;
}

- (uint64_t)pcxTypes
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(a1, "pasteboardTypesForItemSet:", 0);
  v2 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v1);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v16;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v16 != v10)
                objc_enumerationMutation(v7);
              v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j);
              if ((objc_msgSend(v2, "containsObject:", v12) & 1) == 0)
                objc_msgSend(v2, "addObject:", v12);
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v9);
        }
      }
      v4 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v4);
  }
  v13 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", objc_msgSend(v2, "array"));

  return v13;
}

- (uint64_t)pcxClearContents
{
  objc_msgSend(a1, "setItems:", MEMORY[0x1E0C9AA60]);
  return objc_msgSend(a1, "changeCount");
}

@end
