@implementation NSString(PowerlogExtensions)

- (id)strip
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)tokenizedByString:()PowerlogExtensions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  id v12;

  v4 = a3;
  v5 = (void *)MEMORY[0x1BCC9E9B4]();
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  if ((objc_msgSend(v6, "isAtEnd") & 1) == 0)
  {
    v8 = 0;
    do
    {
      v9 = v8;
      v12 = v8;
      v10 = objc_msgSend(v6, "scanUpToString:intoString:", v4, &v12);
      v8 = v12;

      if (v10)
        objc_msgSend(v7, "addObject:", v8);
      else
        objc_msgSend(v6, "setScanLocation:", objc_msgSend(v6, "scanLocation") + 1);
    }
    while (!objc_msgSend(v6, "isAtEnd"));

  }
  objc_autoreleasePoolPop(v5);

  return v7;
}

- (id)tokenizedByStrings:()PowerlogExtensions
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", a1, 0);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v12 = v5;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v21;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v21 != v15)
                objc_enumerationMutation(v12);
              objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v16), "tokenizedByString:", v10);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "addObjectsFromArray:", v17);

              ++v16;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v14);
        }

        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v11);
        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }

  return v5;
}

- (uint64_t)matchingStringInArray:()PowerlogExtensions
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
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
        v7 |= objc_msgSend(a1, "caseInsensitiveCompare:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)) == 0;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7 & 1;
}

- (uint64_t)containsStringInArray:()PowerlogExtensions
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
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
        v7 |= objc_msgSend(a1, "rangeOfString:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)) != 0x7FFFFFFFFFFFFFFFLL;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7 & 1;
}

- (uint64_t)compareFloat:()PowerlogExtensions
{
  id v4;
  float v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a1, "floatValue");
  v6 = v5;
  objc_msgSend(v4, "floatValue");
  v8 = v7;

  v9 = -1;
  if (v6 >= v8)
    v9 = 1;
  if (v6 == v8)
    return 0;
  else
    return v9;
}

- (uint64_t)compareInt:()PowerlogExtensions
{
  id v4;
  int v5;
  int v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(a1, "intValue");
  v6 = objc_msgSend(v4, "intValue");

  v7 = -1;
  if (v5 >= v6)
    v7 = 1;
  if (v5 == v6)
    return 0;
  else
    return v7;
}

- (id)stringByReplacingOccurrencesOfStrings:()PowerlogExtensions withString:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = a1;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      v13 = v8;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v6);
        objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), v7);
        v8 = (id)objc_claimAutoreleasedReturnValue();

        ++v12;
        v13 = v8;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v8;
}

@end
