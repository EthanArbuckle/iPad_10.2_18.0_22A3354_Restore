@implementation NSArray(SafariCoreExtras)

- (id)safari_firstObjectPassingTest:()SafariCoreExtras
{
  unsigned int (**v4)(id, void *);
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v11[4];
  unsigned int (**v12)(id, void *);

  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  if (v5)
  {
    if (v5 == 1)
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4[2](v4, v6))
        v7 = v6;
      else
        v7 = 0;
      v8 = v7;
    }
    else
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __59__NSArray_SafariCoreExtras__safari_firstObjectPassingTest___block_invoke;
      v11[3] = &unk_1E649CA28;
      v12 = v4;
      v9 = objc_msgSend(a1, "indexOfObjectPassingTest:", v11);
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = 0;
      }
      else
      {
        objc_msgSend(a1, "objectAtIndexedSubscript:", v9);
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      v6 = v12;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)safari_filterObjectsUsingBlock:()SafariCoreExtras
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  if (!v5)
    goto LABEL_5;
  if (v5 != 1)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__NSArray_SafariCoreExtras__safari_filterObjectsUsingBlock___block_invoke;
    v11[3] = &unk_1E649CA28;
    v12 = v4;
    objc_msgSend(a1, "indexesOfObjectsPassingTest:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "objectsAtIndexes:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (*((uint64_t (**)(id, void *))v4 + 2))(v4, v6);

  if (v7)
    v8 = (void *)objc_msgSend(a1, "copy");
  else
LABEL_5:
    v8 = (void *)MEMORY[0x1E0C9AA60];
LABEL_7:

  return v8;
}

- (id)safari_mapAndFilterObjectsUsingBlock:()SafariCoreExtras
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__NSArray_SafariCoreExtras__safari_mapAndFilterObjectsUsingBlock___block_invoke;
  v8[3] = &unk_1E649C9D8;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "safari_mapAndFilterObjectsWithOptions:usingBlock:", 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)safari_mapAndFilterObjectsWithOptions:()SafariCoreExtras usingBlock:
{
  void (**v6)(id, void *, _QWORD, char *);
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  void (**v17)(id, void *, _QWORD, char *);
  char v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_msgSend(a1, "count");
  if (v7)
  {
    if (v7 == 1)
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      v6[2](v6, v8, 0, &v18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v19[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = (id)MEMORY[0x1E0C9AA60];
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __78__NSArray_SafariCoreExtras__safari_mapAndFilterObjectsWithOptions_usingBlock___block_invoke;
      v15[3] = &unk_1E649CA00;
      v17 = v6;
      v12 = v11;
      v16 = v12;
      objc_msgSend(a1, "enumerateObjectsWithOptions:usingBlock:", a3, v15);
      v13 = v16;
      v10 = v12;

    }
  }
  else
  {
    v10 = (id)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

+ (id)safari_arrayWithObjectsUnlessNil:()SafariCoreExtras
{
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id *v15;
  id v16;
  id *v18;

  v9 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id *)&a9;
  v11 = v9;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v13 = v11;
  if (v12 != v11)
  {
    v14 = v11;
    do
    {
      objc_msgSend(v10, "safari_addObjectUnlessNil:", v14);
      v15 = v18++;
      v13 = *v15;

      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (id)objc_claimAutoreleasedReturnValue();

      v14 = v13;
    }
    while (v13 != v16);
  }

  return v10;
}

- (uint64_t)safari_prefixWithMaxLength:()SafariCoreExtras
{
  unint64_t v5;
  unint64_t v6;

  v5 = objc_msgSend(a1, "count");
  if (v5 >= a3)
    v6 = a3;
  else
    v6 = v5;
  return objc_msgSend(a1, "subarrayWithRange:", 0, v6);
}

- (id)safari_arrayByAddingObjectsFromArrayIfNotDuplicates:()SafariCoreExtras
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99E10];
  v5 = a3;
  objc_msgSend(v4, "orderedSetWithArray:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v5);

  objc_msgSend(v6, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)safari_reduceObjectsWithInitialValue:()SafariCoreExtras usingBlock:
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "count");
  v9 = v6;
  v10 = v9;
  if (v8)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = a1;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    v10 = v9;
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      v10 = v9;
      do
      {
        v15 = 0;
        v16 = v10;
        do
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          v7[2](v7, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15), v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          ++v15;
          v16 = v10;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

  }
  return v10;
}

- (id)safari_setByApplyingBlock:()SafariCoreExtras
{
  void (**v4)(id, void *);
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  if (v5 == 1)
  {
    objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
    else
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

    goto LABEL_19;
  }
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = a1;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v4[2](v4, *(void **)(*((_QWORD *)&v15 + 1) + 8 * i));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v6, "addObject:", v13, (_QWORD)v15);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v6;
}

- (id)safari_partionedArrayUsingCondition:()SafariCoreExtras
{
  unsigned int (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = a1;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (v4[2](v4, v12))
          v13 = v6;
        else
          v13 = v5;
        objc_msgSend(v13, "addObject:", v12, (_QWORD)v16);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  objc_msgSend(v5, "addObjectsFromArray:", v6);
  v14 = (void *)objc_msgSend(v5, "copy");

  return v14;
}

- (uint64_t)safari_containsObjectPassingTest:()SafariCoreExtras
{
  uint64_t (**v4)(id, void *);
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[4];
  uint64_t (**v10)(id, void *);

  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  if (v5)
  {
    if (v5 == 1)
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v4[2](v4, v6);
    }
    else
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __62__NSArray_SafariCoreExtras__safari_containsObjectPassingTest___block_invoke;
      v9[3] = &unk_1E649CA28;
      v10 = v4;
      v7 = objc_msgSend(a1, "indexOfObjectPassingTest:", v9) != 0x7FFFFFFFFFFFFFFFLL;
      v6 = v10;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)safari_enumerateOutwardFromIndex:()SafariCoreExtras usingBlock:
{
  void (**v6)(id, void *, unint64_t, char *);
  uint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t i;
  void *v11;
  void *v12;
  char v13;

  v6 = a4;
  v7 = objc_msgSend(a1, "count");
  if (v7)
  {
    v8 = v7;
    v13 = 0;
    objc_msgSend(a1, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v9, a3, &v13);

    if (!v13 && v8 != 1)
    {
      for (i = 1; i < v8; ++i)
      {
        if (a3 >= i)
        {
          objc_msgSend(a1, "objectAtIndexedSubscript:", a3 - i);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v6[2](v6, v11, a3 - i, &v13);

          if (v13)
            break;
        }
        if (i + a3 < v8)
        {
          objc_msgSend(a1, "objectAtIndexedSubscript:", i + a3);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v6[2](v6, v12, i + a3, &v13);

          if (v13)
            break;
        }
      }
    }
  }

}

+ (id)safari_arrayWithArray:()SafariCoreExtras copyAction:
{
  void *v4;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  switch(a4)
  {
    case 0:
      objc_msgSend(a1, "arrayWithArray:", v7);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2:
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v11 = v8;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v19 != v14)
              objc_enumerationMutation(v11);
            v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "mutableCopyWithZone:", 0, (_QWORD)v18);
            objc_msgSend(v10, "addObject:", v16);

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v13);
      }

      objc_msgSend(a1, "arrayWithArray:", v10);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 1:
      v9 = objc_msgSend(objc_alloc((Class)a1), "initWithArray:copyItems:", v7, 1);
LABEL_6:
      v4 = (void *)v9;
      break;
  }

  return v4;
}

+ (id)safari_arrayFromDictionaryOfObjectsByIndex:()SafariCoreExtras
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__NSArray_SafariCoreExtras__safari_arrayFromDictionaryOfObjectsByIndex___block_invoke;
  v9[3] = &unk_1E649C9B0;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "safari_mapObjectsUsingBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)safari_numberAtIndex:()SafariCoreExtras
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectAtIndex:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)safari_stringAtIndex:()SafariCoreExtras
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectAtIndex:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)safari_URLAtIndex:()SafariCoreExtras
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectAtIndex:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)safari_dictionaryAtIndex:()SafariCoreExtras
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectAtIndex:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)safari_arrayAtIndex:()SafariCoreExtras
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectAtIndex:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (uint64_t)safari_enumerateZippedValuesWithArray:()SafariCoreExtras withBlock:
{
  return objc_msgSend(a1, "safari_enumerateZippedValuesWithArray:options:withBlock:", a3, 0, a4);
}

- (void)safari_enumerateZippedValuesWithArray:()SafariCoreExtras options:withBlock:
{
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(a1, "count");
  v11 = objc_msgSend(v8, "count");
  if (v10 >= v11)
    v12 = v11;
  else
    v12 = v10;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__NSArray_SafariCoreExtras__safari_enumerateZippedValuesWithArray_options_withBlock___block_invoke;
  v16[3] = &unk_1E649CA00;
  v17 = v8;
  v18 = v9;
  v14 = v8;
  v15 = v9;
  objc_msgSend(a1, "enumerateObjectsAtIndexes:options:usingBlock:", v13, a4, v16);

}

- (void)safari_enumerateOutwardFromIndex:()SafariCoreExtras otherIndex:usingBlock:
{
  void (**v8)(id, void *, unint64_t, unsigned __int8 *);
  uint64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  int64_t v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int64_t v26;
  void *v27;
  int64_t v28;
  unsigned __int8 v29;

  v8 = a5;
  if (a3 == a4)
  {
    objc_msgSend(a1, "safari_enumerateOutwardFromIndex:usingBlock:", a3, v8);
    goto LABEL_5;
  }
  v9 = objc_msgSend(a1, "count");
  if (v9)
  {
    v10 = v9;
    v29 = 0;
    objc_msgSend(a1, "objectAtIndexedSubscript:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v11, a3, &v29);

    if (!v29)
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v12, a4, &v29);

      if (!v29 && (unint64_t)v10 >= 2)
      {
        v13 = -1;
        v14 = 1;
        v28 = v10;
        do
        {
          v15 = a3 + v13;
          v16 = a3 + v14;
          v17 = a4 + v13;
          v18 = a4 + v14;
          if (a3 >= a4)
          {
            if (v15 >= v18)
            {
              objc_msgSend(a1, "objectAtIndexedSubscript:", a3 + v13);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v8[2](v8, v21, a3 + v13, &v29);

              v10 = v28;
              v18 = a4 + v14;
              if (v29)
                break;
            }
            if ((v17 & 0x8000000000000000) == 0)
            {
              objc_msgSend(a1, "objectAtIndexedSubscript:", a4 + v13);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v8[2](v8, v22, a4 + v13, &v29);

              v10 = v28;
              v18 = a4 + v14;
              if (v29)
                break;
            }
            if (v16 < v10)
            {
              objc_msgSend(a1, "objectAtIndexedSubscript:", a3 + v14);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v8[2](v8, v23, a3 + v14, &v29);

              v18 = a4 + v14;
              if (v29)
                break;
            }
            if (v18 < v15)
              goto LABEL_28;
          }
          else
          {
            if (v15 < 0)
            {
              v20 = 0;
            }
            else
            {
              objc_msgSend(a1, "objectAtIndexedSubscript:", a3 + v13);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v8[2](v8, v19, a3 + v13, &v29);

              v10 = v28;
              v18 = a4 + v14;
              v20 = v29;
              if (v29)
                break;
            }
            if (v17 > v16)
            {
              objc_msgSend(a1, "objectAtIndexedSubscript:", a4 + v13);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v8[2](v8, v24, a4 + v13, &v29);

              v18 = a4 + v14;
              v20 = v29;
              if (v29)
                break;
            }
            if (v16 <= v17)
            {
              objc_msgSend(a1, "objectAtIndexedSubscript:", a3 + v14);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v8[2](v8, v25, a3 + v14, &v29);

              v18 = a4 + v14;
              v20 = v29;
            }
            if (v20)
              break;
            if (v18 < v10)
            {
LABEL_28:
              v26 = v18;
              objc_msgSend(a1, "objectAtIndexedSubscript:", v18);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v8[2](v8, v27, v26, &v29);

              if (v29)
                break;
            }
          }
          ++v14;
          --v13;
        }
        while (v10 != v14);
      }
    }
  }
LABEL_5:

}

- (void)safari_enumerateAsynchronouslyOnQueue:()SafariCoreExtras enumerationBlock:completionBlock:
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_msgSend(a1, "copy");
  enumerateAsynchronously(v10, v11, 0, v9, v8);

}

- (id)safari_orderedSetByApplyingBlock:()SafariCoreExtras
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__NSArray_SafariCoreExtras__safari_orderedSetByApplyingBlock___block_invoke;
  v11[3] = &unk_1E649CA00;
  v13 = v4;
  v6 = v5;
  v12 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v11);
  v8 = v12;
  v9 = v6;

  return v9;
}

- (uint64_t)safari_reduceObjectsUsingBlock:()SafariCoreExtras
{
  return objc_msgSend(a1, "safari_reduceObjectsWithInitialValue:usingBlock:", 0, a3);
}

- (id)safari_maximumUsingComparator:()SafariCoreExtras
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__NSArray_SafariCoreExtras__safari_maximumUsingComparator___block_invoke;
  v8[3] = &unk_1E649CA50;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "safari_reduceObjectsUsingBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)safari_minimumUsingComparator:()SafariCoreExtras
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__NSArray_SafariCoreExtras__safari_minimumUsingComparator___block_invoke;
  v8[3] = &unk_1E649CA78;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "safari_maximumUsingComparator:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)safari_diffWithArray:()SafariCoreExtras
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "_safari_computeLengthsOfLongestSubsequencesCommonWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_safari_generateDiffWithLongestCommonSubsequenceLengths:array:indexIntoSelf:indexIntoArray:", v5, v4, objc_msgSend(a1, "count"), objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_safari_computeLengthsOfLongestSubsequencesCommonWithArray:()SafariCoreExtras
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  void *v29;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "count");
  v6 = 0;
  do
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", &unk_1E64CE2B0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:atIndexedSubscript:", v7, v6);

    ++v6;
  }
  while (v6 <= objc_msgSend(a1, "count"));
  v29 = a1;
  objc_msgSend(v4, "count");
  v8 = 0;
  do
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:atIndexedSubscript:", &unk_1E64CE2B0, v8);

    ++v8;
  }
  while (v8 <= objc_msgSend(v4, "count"));
  v10 = a1;
  if (objc_msgSend(a1, "count"))
  {
    v11 = 1;
    do
    {
      if (objc_msgSend(v4, "count"))
      {
        v12 = 1;
        do
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v11 - 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectAtIndexedSubscript:", v12 - 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isEqual:", v14);

          v16 = (void *)MEMORY[0x1E0CB37E8];
          if (v15)
          {
            objc_msgSend(v5, "objectAtIndexedSubscript:", v11 - 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectAtIndexedSubscript:", v12 - 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v18, "unsignedIntegerValue") + 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "objectAtIndexedSubscript:", v11);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setObject:atIndexedSubscript:", v19, v12);

          }
          else
          {
            objc_msgSend(v5, "objectAtIndexedSubscript:", v11);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectAtIndexedSubscript:", v12 - 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "unsignedIntegerValue");

            objc_msgSend(v5, "objectAtIndexedSubscript:", v11 - 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectAtIndexedSubscript:", v12);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "unsignedIntegerValue");

            if (v23 <= v26)
              v27 = v26;
            else
              v27 = v23;
            v10 = v29;
            objc_msgSend(v16, "numberWithUnsignedInteger:", v27);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "objectAtIndexedSubscript:", v11);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setObject:atIndexedSubscript:", v17, v12);
          }

          ++v12;
        }
        while (v12 <= objc_msgSend(v4, "count"));
      }
      ++v11;
    }
    while (v11 <= objc_msgSend(v10, "count"));
  }

  return v5;
}

- (__CFString)_safari_generateDiffWithLongestCommonSubsequenceLengths:()SafariCoreExtras array:indexIntoSelf:indexIntoArray:
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unint64_t v33;
  BOOL v34;
  __CFString *v35;
  uint64_t v37;
  void *v38;
  id v39;

  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (!a5 || !a6)
  {
    if (!a6)
    {
      if (a5)
      {
        v30 = a5 - 1;
LABEL_17:
        objc_msgSend(a1, "_safari_generateDiffWithLongestCommonSubsequenceLengths:array:indexIntoSelf:indexIntoArray:", v10, v12, v30, a6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "objectAtIndexedSubscript:", v30);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringByAppendingFormat:", CFSTR("- %@\n"), v19);
        goto LABEL_18;
      }
LABEL_20:
      v35 = &stru_1E64A2498;
      goto LABEL_19;
    }
    v15 = a6 - 1;
    if (!a5)
    {
LABEL_14:
      objc_msgSend(a1, "_safari_generateDiffWithLongestCommonSubsequenceLengths:array:indexIntoSelf:indexIntoArray:", v10, v12, a5, v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringByAppendingFormat:", CFSTR("+ %@\n"), v19);
      goto LABEL_18;
    }
    v38 = a1;
    v39 = v11;
    v13 = a5 - 1;
LABEL_9:
    v37 = v13;
    objc_msgSend(v10, "objectAtIndexedSubscript:", a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "unsignedIntegerValue");
    objc_msgSend(v10, "objectAtIndexedSubscript:", v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", a6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v10;
    v26 = objc_msgSend(v24, "unsignedIntegerValue");

    if (v22 < v26)
    {
      objc_msgSend(v25, "objectAtIndexedSubscript:", a5);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndexedSubscript:", v15);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "unsignedIntegerValue");
      v30 = v37;
      objc_msgSend(v25, "objectAtIndexedSubscript:", v37);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectAtIndexedSubscript:", a6);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "unsignedIntegerValue");

      v34 = v29 >= v33;
      v10 = v25;
      a1 = v38;
      v12 = v39;
      if (!v34)
        goto LABEL_17;
      goto LABEL_20;
    }
    v10 = v25;
    a1 = v38;
    v12 = v39;
    goto LABEL_14;
  }
  v13 = a5 - 1;
  objc_msgSend(a1, "objectAtIndexedSubscript:", a5 - 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = a6 - 1;
  objc_msgSend(v12, "objectAtIndexedSubscript:", a6 - 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v14, "isEqual:", v16);

  if (!v17)
  {
    v38 = a1;
    v39 = v12;
    goto LABEL_9;
  }
  objc_msgSend(a1, "_safari_generateDiffWithLongestCommonSubsequenceLengths:array:indexIntoSelf:indexIntoArray:", v10, v12, a5 - 1, a6 - 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectAtIndexedSubscript:", a5 - 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByAppendingFormat:", CFSTR("  %@\n"), v19);
LABEL_18:
  v35 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_19:
  return v35;
}

- (id)safari_lastObjectPassingTest:()SafariCoreExtras
{
  unsigned int (**v4)(id, void *);
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v11[4];
  unsigned int (**v12)(id, void *);

  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  if (v5)
  {
    if (v5 == 1)
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4[2](v4, v6))
        v7 = v6;
      else
        v7 = 0;
      v8 = v7;
    }
    else
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __58__NSArray_SafariCoreExtras__safari_lastObjectPassingTest___block_invoke;
      v11[3] = &unk_1E649CA28;
      v12 = v4;
      v9 = objc_msgSend(a1, "indexOfObjectWithOptions:passingTest:", 2, v11);
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = 0;
      }
      else
      {
        objc_msgSend(a1, "objectAtIndexedSubscript:", v9);
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      v6 = v12;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (uint64_t)safari_allObjectsPassTest:()SafariCoreExtras
{
  unsigned int (**v4)(id, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = a1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (!v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9)))
        {
          v10 = 0;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (uint64_t)safari_noObjectsPassTest:()SafariCoreExtras
{
  uint64_t (**v4)(id, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = a1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9)) & 1) != 0)
        {
          v10 = 0;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (id)safari_arrayByRemovingObject:()SafariCoreExtras
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "removeObject:", v4);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

+ (id)safari_arrayWithPropertyListData:()SafariCoreExtras options:
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

- (id)safari_flattenedArray
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6;
  v12 = __Block_byref_object_dispose__6;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__NSArray_SafariCoreExtras__safari_flattenedArray__block_invoke;
  v7[3] = &unk_1E649CAA0;
  v7[4] = a1;
  v7[5] = &v8;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v7);
  v2 = objc_msgSend((id)v9[5], "copy");
  v3 = (void *)v2;
  if (v2)
    v4 = (void *)v2;
  else
    v4 = a1;
  v5 = v4;

  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)safari_objectBefore:()SafariCoreExtras
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = objc_msgSend(a1, "indexOfObject:");
  v3 = v2;
  v4 = 0;
  if (v2 && v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a1, "objectAtIndexedSubscript:", v2 - 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  if (v3 && v3 != 0x7FFFFFFFFFFFFFFFLL)

  return v5;
}

- (id)safari_objectAfter:()SafariCoreExtras
{
  unint64_t v2;
  unint64_t v3;
  void *v4;

  v2 = objc_msgSend(a1, "indexOfObject:");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL || (v3 = v2, v2 >= objc_msgSend(a1, "count") - 1))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(a1, "objectAtIndexedSubscript:", v3 + 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (WBSPair)safari_splitArrayUsingCondition:()SafariCoreExtras
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  WBSPair *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__NSArray_SafariCoreExtras__safari_splitArrayUsingCondition___block_invoke;
  v12[3] = &unk_1E649CAC8;
  v14 = v6;
  v15 = v4;
  v13 = v5;
  v7 = v6;
  v8 = v5;
  v9 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v12);
  v10 = -[WBSPair initWithFirst:second:]([WBSPair alloc], "initWithFirst:second:", v8, v7);

  return v10;
}

- (id)safari_longestIncreasingSubsequenceUsingValues:()SafariCoreExtras
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  unint64_t v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "safari_mapAndFilterObjectsUsingBlock:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = v6;
    v38 = a1;
    v39 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C9AA60];
    do
    {
      objc_msgSend(v8, "addObject:", v9);
      --v7;
    }
    while (v7);
    v10 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayWithObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:atIndexedSubscript:", v12, 0);

    if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    {
      for (i = 1; i < objc_msgSend(v5, "count"); ++i)
      {
        v14 = 0;
        do
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "integerValue");
          objc_msgSend(v5, "objectAtIndexedSubscript:", i);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16 >= objc_msgSend(v17, "integerValue"))
          {

          }
          else
          {
            objc_msgSend(v8, "objectAtIndexedSubscript:", v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "count") + 1;
            objc_msgSend(v8, "objectAtIndexedSubscript:", i);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "count");

            if (v19 <= v21)
              goto LABEL_12;
            objc_msgSend(v8, "objectAtIndexedSubscript:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:atIndexedSubscript:", v15, i);
          }

LABEL_12:
          ++v14;
        }
        while (i != v14);
        objc_msgSend(v8, "objectAtIndexedSubscript:", i);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectAtIndexedSubscript:", i);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "arrayByAddingObject:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:atIndexedSubscript:", v24, i);

      }
    }
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v26 = v8;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v44 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
          v32 = objc_msgSend(v31, "count");
          if (v32 > objc_msgSend(v25, "count"))
          {
            v33 = v31;

            v25 = v33;
          }
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v28);
    }

    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __76__NSArray_SafariCoreExtras__safari_longestIncreasingSubsequenceUsingValues___block_invoke;
    v40[3] = &unk_1E649CAF0;
    v41 = v25;
    v4 = v39;
    v42 = v39;
    v34 = v25;
    objc_msgSend(v38, "indexesOfObjectsPassingTest:", v40);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectsAtIndexes:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v36 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v36;
}

- (id)safari_dictionaryByMappingObjectsToKeysUsingBlock:()SafariCoreExtras
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __79__NSArray_SafariCoreExtras__safari_dictionaryByMappingObjectsToKeysUsingBlock___block_invoke;
  v13 = &unk_1E649CA00;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)safari_dictionaryByMappingObjectsAsKeysToObjectsUsingBlock:()SafariCoreExtras
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __88__NSArray_SafariCoreExtras__safari_dictionaryByMappingObjectsAsKeysToObjectsUsingBlock___block_invoke;
  v13 = &unk_1E649CA00;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)safari_dictionaryOfArraysByMappingObjectsToKeysUsingBlock:()SafariCoreExtras
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __87__NSArray_SafariCoreExtras__safari_dictionaryOfArraysByMappingObjectsToKeysUsingBlock___block_invoke;
  v14 = &unk_1E649CA00;
  v15 = v5;
  v16 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v11);
  v8 = objc_alloc(MEMORY[0x1E0C99D80]);
  v9 = (void *)objc_msgSend(v8, "initWithDictionary:copyItems:", v6, 1, v11, v12, v13, v14);

  return v9;
}

- (id)safari_allPermutations
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", a1);
  v3 = objc_msgSend(a1, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_safari_generatePermutations:withPosition:permutationsArray:", v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_safari_generatePermutations:()SafariCoreExtras withPosition:permutationsArray:
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v8 = a3;
  v9 = a5;
  if (a4 == 1)
  {
    v10 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v9, "addObject:", v10);

  }
  else
  {
    v11 = (id)objc_msgSend(a1, "_safari_generatePermutations:withPosition:permutationsArray:", v8, a4 - 1, v9);
    v12 = 0;
    do
    {
      if ((a4 & 1) != 0)
        v13 = 0;
      else
        v13 = v12;
      objc_msgSend(v8, "exchangeObjectAtIndex:withObjectAtIndex:", v13, a4 - 1);
      v14 = (id)objc_msgSend(a1, "_safari_generatePermutations:withPosition:permutationsArray:", v8, a4 - 1, v9);
      ++v12;
    }
    while (a4 - 1 != v12);
  }

  return v9;
}

- (id)safari_objectsOfClass:()SafariCoreExtras
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__NSArray_SafariCoreExtras__safari_objectsOfClass___block_invoke;
  v4[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v4[4] = a3;
  objc_msgSend(a1, "safari_filterObjectsUsingBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
