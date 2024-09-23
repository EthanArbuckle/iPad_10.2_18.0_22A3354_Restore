@implementation NSDictionary(SafariCoreExtras)

- (id)safari_dictionaryForKey:()SafariCoreExtras
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)safari_numberForKey:()SafariCoreExtras
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)safari_arrayForKey:()SafariCoreExtras
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)safari_stringForKey:()SafariCoreExtras
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (uint64_t)safari_BOOLForKey:()SafariCoreExtras
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "safari_numberForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (id)safari_setValuesFromDictionary:()SafariCoreExtras
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    v13 = a1;
LABEL_13:
    v5 = v13;
    goto LABEL_14;
  }
  if (!objc_msgSend(a1, "count"))
  {
    v13 = v4;
    goto LABEL_13;
  }
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

LABEL_14:
  return v5;
}

- (id)safari_dateForKey:()SafariCoreExtras
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)safari_URLForKey:()SafariCoreExtras
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

+ (id)safari_dictionaryWithPropertyListData:()SafariCoreExtras options:
{
  void *v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, a4, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v5 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)safari_mapAndFilterKeysAndObjectsUsingBlock:()SafariCoreExtras
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  if (objc_msgSend(a1, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __78__NSDictionary_SafariCoreExtras__safari_mapAndFilterKeysAndObjectsUsingBlock___block_invoke;
    v10[3] = &unk_1E649CC78;
    v12 = v4;
    v6 = v5;
    v11 = v6;
    objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v10);
    v7 = v11;
    v8 = v6;

  }
  else
  {
    v8 = (id)MEMORY[0x1E0C9AA70];
  }

  return v8;
}

+ (uint64_t)safari_dictionaryWithPropertyListData:()SafariCoreExtras
{
  return objc_msgSend(a1, "safari_dictionaryWithPropertyListData:options:", a3, 0);
}

- (id)safari_stringForKey:()SafariCoreExtras returningNilIfEmpty:
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a1, "safari_stringForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!a4 || (v7 = (void *)objc_msgSend(v5, "length")) != 0)
    v7 = v6;
  v8 = v7;

  return v8;
}

- (id)safari_dataForKey:()SafariCoreExtras
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)safari_mutableArrayForKey:()SafariCoreExtras
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)safari_arrayContainingObjectsOfClass:()SafariCoreExtras forKey:
{
  void *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend(a1, "objectForKey:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __78__NSDictionary_SafariCoreExtras__safari_arrayContainingObjectsOfClass_forKey___block_invoke;
    v8[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
    v8[4] = a3;
    objc_msgSend(v5, "safari_filterObjectsUsingBlock:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)safari_UUIDForKey:()SafariCoreExtras
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)safari_setForKey:()SafariCoreExtras
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)safari_userActivityForKey:()SafariCoreExtras
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)safari_dictionaryByMergingWithDictionary:()SafariCoreExtras
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    v14 = a1;
LABEL_15:
    v5 = v14;
    goto LABEL_16;
  }
  if (!objc_msgSend(a1, "count"))
  {
    v14 = v4;
    goto LABEL_15;
  }
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(a1, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v11);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

LABEL_16:
  return v5;
}

- (id)safari_dictionaryWithLowercaseKeys
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(a1, "allKeys", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(a1, "objectForKeyedSubscript:", v8);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "lowercaseString");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, v10);

          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA70];
  }
  return v2;
}

- (id)safari_jsonRepresentation
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a1, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v1, 4);
  else
    v2 = 0;

  return v2;
}

- (id)safari_mapTableForKey:()SafariCoreExtras
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)safari_mapAndFilterKeysUsingBlock:()SafariCoreExtras
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  if (objc_msgSend(a1, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68__NSDictionary_SafariCoreExtras__safari_mapAndFilterKeysUsingBlock___block_invoke;
    v10[3] = &unk_1E649CC78;
    v12 = v4;
    v6 = v5;
    v11 = v6;
    objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v10);
    v7 = v11;
    v8 = v6;

  }
  else
  {
    v8 = (id)MEMORY[0x1E0C9AA70];
  }

  return v8;
}

- (id)_safari_sortedTupleArray
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[2];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v18[0] = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_msgSend(a1, "objectForKeyedSubscript:", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18[1] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v2, "copy");
  return v12;
}

- (id)safari_diffWithDictionary:()SafariCoreExtras
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_safari_sortedTupleArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_safari_sortedTupleArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safari_diffWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)safari_dictionaryByRemovingNullObjects
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__7;
  v11 = __Block_byref_object_dispose__7;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__NSDictionary_SafariCoreExtras__safari_dictionaryByRemovingNullObjects__block_invoke;
  v6[3] = &unk_1E649CCA0;
  v6[4] = a1;
  v6[5] = &v7;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v6);
  v2 = (void *)v8[5];
  if (v2)
    v3 = v2;
  else
    v3 = (id)objc_msgSend(a1, "copy");
  v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)safari_containsObject:()SafariCoreExtras
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__NSDictionary_SafariCoreExtras__safari_containsObject___block_invoke;
    v9[3] = &unk_1E649CCC8;
    v10 = v4;
    objc_msgSend(a1, "keysOfEntriesPassingTest:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)safari_containsEntryPassingTest:()SafariCoreExtras
{
  id v4;
  id v5;
  void *v6;
  _BOOL8 v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__NSDictionary_SafariCoreExtras__safari_containsEntryPassingTest___block_invoke;
  v9[3] = &unk_1E649CCF0;
  v10 = v4;
  v5 = v4;
  objc_msgSend(a1, "keysOfEntriesPassingTest:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") != 0;

  return v7;
}

+ (id)safari_dictionaryWithJSONData:()SafariCoreExtras options:
{
  void *v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, a4, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v5 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)safari_dictionaryWithJSONOrPropertyListData:()SafariCoreExtras
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "safari_dictionaryWithJSONData:options:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(a1, "safari_dictionaryWithPropertyListData:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)safari_dictionaryWithObjectsInFastEnumerationCollection:()SafariCoreExtras groupedUsingBlock:
{
  id v5;
  void (**v6)(id, _QWORD);
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        v6[2](v6, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", v14, (_QWORD)v20);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
          {
            v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v14);

          }
          objc_msgSend(v7, "objectForKeyedSubscript:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v13);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  v18 = (void *)objc_msgSend(v7, "copy");
  return v18;
}

- (id)safari_mutableDeepCopy
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_18);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  return v2;
}

- (id)safari_valueOfEntryPassingTest:()SafariCoreExtras
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__NSDictionary_SafariCoreExtras__safari_valueOfEntryPassingTest___block_invoke;
  v10[3] = &unk_1E649CD58;
  v11 = v4;
  v5 = v4;
  objc_msgSend(a1, "keysOfEntriesPassingTest:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)safari_valuesOfEntriesPassingTest:()SafariCoreExtras
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, void *);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __68__NSDictionary_SafariCoreExtras__safari_valuesOfEntriesPassingTest___block_invoke;
  v13 = &unk_1E649CC78;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

@end
