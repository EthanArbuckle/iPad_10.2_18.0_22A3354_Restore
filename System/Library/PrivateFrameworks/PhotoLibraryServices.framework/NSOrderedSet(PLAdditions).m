@implementation NSOrderedSet(PLAdditions)

- (id)pl_shortDescription
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("{"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = a1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v11);

  objc_autoreleasePoolPop(v3);
  objc_msgSend(v2, "appendString:", CFSTR("}"));
  return v2;
}

- (uint64_t)pl_indexOfObjectIdenticalTo:()PLAdditions
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObjectIdenticalTo:", v4);

  return v6;
}

- (uint64_t)pl_isSortedUsingComparator:()PLAdditions
{
  uint64_t (**v4)(id, void *, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = a1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      v10 = 0;
      v11 = v8;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        if (v11 && v4[2](v4, v11, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10)) == 1)
        {
          v13 = 0;
          goto LABEL_12;
        }
        v8 = v12;

        ++v10;
        v11 = v8;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
    v13 = 1;
    v11 = v8;
LABEL_12:

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

@end
