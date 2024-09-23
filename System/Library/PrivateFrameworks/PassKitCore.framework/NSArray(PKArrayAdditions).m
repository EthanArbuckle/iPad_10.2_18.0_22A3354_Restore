@implementation NSArray(PKArrayAdditions)

- (id)pk_arrayByApplyingBlock:()PKArrayAdditions
{
  return (id)objc_msgSend(a1, "pk_createArrayByApplyingBlock:");
}

- (uint64_t)pk_createArrayByApplyingBlock:()PKArrayAdditions
{
  void (**v4)(id, _QWORD);
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = a1;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x19400CFE8](v8);
          v4[2](v4, v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v14, (_QWORD)v17);

          objc_autoreleasePoolPop(v13);
          ++v11;
        }
        while (v9 != v11);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        v9 = v8;
      }
      while (v8);
    }

    v15 = objc_msgSend(v6, "copy");
  }
  else
  {
    v15 = MEMORY[0x1E0C9AA60];
  }

  return v15;
}

- (id)pk_objectsPassingTest:()PKArrayAdditions
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "indexesOfObjectsPassingTest:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectsAtIndexes:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pk_firstObjectPassingTest:()PKArrayAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__NSArray_PKArrayAdditions__pk_firstObjectPassingTest___block_invoke;
    v9[3] = &unk_1E2AC2338;
    v10 = v4;
    v6 = objc_msgSend(a1, "indexOfObjectPassingTest:", v9);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(a1, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)pk_arrayByRemovingObject:()PKArrayAdditions
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF != %@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pk_arrayByRemovingObjectsInArray:()PKArrayAdditions
{
  void *v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT(SELF IN %@)"), a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "filteredArrayUsingPredicate:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = a1;
  }
  return v5;
}

- (void)pk_createArrayByRemovingObjectAtIndex:()PKArrayAdditions
{
  void *v4;
  uint64_t v5;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    __break(1u);
  }
  else
  {
    v4 = (void *)objc_msgSend(result, "mutableCopy");
    objc_msgSend(v4, "removeObjectAtIndex:", a3);
    v5 = objc_msgSend(v4, "copy");

    return (void *)v5;
  }
  return result;
}

- (uint64_t)pk_createArrayByRemovingObjectsPassingTest:()PKArrayAdditions
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__NSArray_PKArrayAdditions__pk_createArrayByRemovingObjectsPassingTest___block_invoke;
  v10[3] = &unk_1E2AC2338;
  v11 = v4;
  v5 = v4;
  objc_msgSend(a1, "indexesOfObjectsPassingTest:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_msgSend(a1, "mutableCopy");
    objc_msgSend(v7, "removeObjectsAtIndexes:", v6);
    v8 = objc_msgSend(v7, "copy");

  }
  else
  {
    v8 = objc_msgSend(a1, "copy");
  }

  return v8;
}

- (uint64_t)pk_createArrayBySafelyApplyingBlock:()PKArrayAdditions
{
  void (**v4)(id, _QWORD);
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = a1;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x19400CFE8](v8);
          v4[2](v4, v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v6, "addObject:", v14, (_QWORD)v17);

          objc_autoreleasePoolPop(v13);
          ++v11;
        }
        while (v9 != v11);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        v9 = v8;
      }
      while (v8);
    }

    v15 = objc_msgSend(v6, "copy");
  }
  else
  {
    v15 = MEMORY[0x1E0C9AA60];
  }

  return v15;
}

- (id)pk_arrayBySafelyApplyingBlock:()PKArrayAdditions
{
  return (id)objc_msgSend(a1, "pk_createArrayBySafelyApplyingBlock:");
}

- (id)pk_createSetByApplyingBlock:()PKArrayAdditions
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (objc_msgSend(a1, "count"))
  {
    v5 = (void *)objc_msgSend(a1, "pk_createMutableSetByApplyingBlock:", v4);
    v6 = (id)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  }

  return v6;
}

- (id)pk_createMutableSetByApplyingBlock:()PKArrayAdditions
{
  void (**v4)(id, _QWORD);
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  v5 = objc_msgSend(a1, "count");
  if (v5)
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v5);
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
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x19400CFE8](v8);
          v4[2](v4, v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v14, (_QWORD)v16);

          objc_autoreleasePoolPop(v13);
          ++v11;
        }
        while (v9 != v11);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        v9 = v8;
      }
      while (v8);
    }

  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  }

  return v6;
}

- (id)pk_createOrderedSetByApplyingBlock:()PKArrayAdditions
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (objc_msgSend(a1, "count"))
  {
    v5 = (void *)objc_msgSend(a1, "pk_createMutableOrderedSetByApplyingBlock:", v4);
    v6 = (id)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E40]);
  }

  return v6;
}

- (id)pk_createMutableOrderedSetByApplyingBlock:()PKArrayAdditions
{
  void (**v4)(id, _QWORD);
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  v5 = objc_msgSend(a1, "count");
  if (v5)
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", v5);
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
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x19400CFE8](v8);
          v4[2](v4, v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v14, (_QWORD)v16);

          objc_autoreleasePoolPop(v13);
          ++v11;
        }
        while (v9 != v11);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        v9 = v8;
      }
      while (v8);
    }

  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  }

  return v6;
}

- (id)pk_shuffledArray
{
  unint64_t v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint32_t v6;
  uint32_t v7;
  void *v8;

  v2 = objc_msgSend(a1, "count");
  if (v2 < 2)
  {
    v8 = (void *)objc_msgSend(a1, "copy");
  }
  else
  {
    v3 = v2;
    v4 = (void *)objc_msgSend(a1, "mutableCopy");
    v5 = 0;
    do
    {
      if (v3 >= 0xFFFFFFFF)
        v6 = -1;
      else
        v6 = v3;
      v7 = arc4random_uniform(v6);
      if (v7)
        objc_msgSend(v4, "exchangeObjectAtIndex:withObjectAtIndex:", v5, v5 + v7);
      ++v5;
      --v3;
    }
    while (v3);
    v8 = (void *)objc_msgSend(v4, "copy");

  }
  return v8;
}

- (uint64_t)pk_countObjectsPassingTest:()PKArrayAdditions
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__NSArray_PKArrayAdditions__pk_countObjectsPassingTest___block_invoke;
  v8[3] = &unk_1E2AC2360;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)pk_indexDictionaryByApplyingBlock:()PKArrayAdditions
{
  void (**v4)(id, _QWORD);
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        v4[2](v4, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v11, v12, (_QWORD)v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)pk_groupDictionaryByApplyingBlock:()PKArrayAdditions
{
  void (**v4)(id, _QWORD);
  id v5;
  id v6;
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
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = a1;
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
        v4[2](v4, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v12, (_QWORD)v15);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v5, "setObject:forKey:", v13, v12);
        }
        objc_msgSend(v13, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)pk_intersectArray:()PKArrayAdditions
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0C99E10];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithArray:", a1);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v5);

  objc_msgSend(v6, "intersectOrderedSet:", v7);
  objc_msgSend(v6, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)pk_containsObjectPassingTest:()PKArrayAdditions
{
  id v4;
  void *v5;
  _BOOL8 v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__NSArray_PKArrayAdditions__pk_containsObjectPassingTest___block_invoke;
    v8[3] = &unk_1E2AC2338;
    v9 = v4;
    v6 = objc_msgSend(a1, "indexOfObjectPassingTest:", v8) != 0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)pk_lastObjectPassingTest:()PKArrayAdditions
{
  uint64_t (**v4)(id, void *);
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(a1, "reverseObjectEnumerator", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
          if ((v4[2](v4, v9) & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
