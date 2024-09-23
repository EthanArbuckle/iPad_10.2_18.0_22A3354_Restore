@implementation NSError(RTExtensions)

- (uint64_t)isOnlyThrottlingError
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a1, "flattenErrors", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v2)
  {
    v13 = 1;
    goto LABEL_19;
  }
  v3 = v2;
  v4 = *(_QWORD *)v16;
  v5 = *MEMORY[0x1E0D26588];
  while (2)
  {
    for (i = 0; i != v3; ++i)
    {
      if (*(_QWORD *)v16 != v4)
        objc_enumerationMutation(v1);
      v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
      objc_msgSend(v7, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      GEOErrorDomain();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isEqualToString:", v9) & 1) == 0)
      {

LABEL_18:
        v13 = 0;
        goto LABEL_19;
      }
      if (objc_msgSend(v7, "code") == -7)
      {
        objc_msgSend(v7, "userInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "integerValue") == 429)
        {

          continue;
        }
        v12 = objc_msgSend(v7, "code");

      }
      else
      {
        v12 = objc_msgSend(v7, "code");
      }

      if (v12 != -3)
        goto LABEL_18;
    }
    v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    v13 = 1;
    if (v3)
      continue;
    break;
  }
LABEL_19:

  return v13;
}

- (uint64_t)isOnlyTimeoutError
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1, "flattenErrors", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v13;
    v5 = *MEMORY[0x1E0D18598];
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(v1);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v7, "domain");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v8, "isEqualToString:", v5))
        {

LABEL_13:
          v10 = 0;
          goto LABEL_14;
        }
        v9 = objc_msgSend(v7, "code");

        if (v9 != 15)
          goto LABEL_13;
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v10 = 1;
      if (v3)
        continue;
      break;
    }
  }
  else
  {
    v10 = 1;
  }
LABEL_14:

  return v10;
}

- (id)_underlyingErrorsRTMultiError
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D18598]) || objc_msgSend(a1, "code") != 9)
  {

    goto LABEL_6;
  }
  objc_msgSend(a1, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D18590];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D18590]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  objc_msgSend(a1, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_detailedErrors
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_underlyingErrorsRTMultiError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  objc_msgSend(a1, "underlyingErrors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  return v2;
}

- (id)flattenErrors
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_detailedErrors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "flattenErrors", (_QWORD)v11);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObjectsFromArray:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
  else
  {
    objc_msgSend(v2, "addObject:", a1);
  }

  return v2;
}

@end
