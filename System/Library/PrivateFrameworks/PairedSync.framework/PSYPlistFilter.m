@implementation PSYPlistFilter

+ (BOOL)isPlistObject:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (isPlistObject__onceToken != -1)
    dispatch_once(&isPlistObject__onceToken, &__block_literal_global_1);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = (id)isPlistObject__plistClasses;
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
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_13:

  return v5;
}

void __32__PSYPlistFilter_isPlistObject___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)isPlistObject__plistClasses;
  isPlistObject__plistClasses = v7;

}

+ (id)filteredPlistDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = v6;
      v19 = v3;
      v8 = 0;
      v9 = *(_QWORD *)v21;
      while (1)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v8 = 1;
            goto LABEL_17;
          }
          objc_msgSend(v5, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[PSYPlistFilter filteredPlistDictionary:](PSYPlistFilter, "filteredPlistDictionary:", v12);
            v13 = objc_claimAutoreleasedReturnValue();
LABEL_13:
            v14 = (void *)v13;
            if ((void *)v13 != v12)
              v8 = 1;
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v11);

            goto LABEL_16;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[PSYPlistFilter filteredPlistArray:](PSYPlistFilter, "filteredPlistArray:", v12);
            v13 = objc_claimAutoreleasedReturnValue();
            goto LABEL_13;
          }
          if (+[PSYPlistFilter isPlistObject:](PSYPlistFilter, "isPlistObject:", v12))
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v11);
          else
            v8 = 1;
LABEL_16:

LABEL_17:
          ++v10;
        }
        while (v7 != v10);
        v15 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        v7 = v15;
        if (!v15)
        {

          v16 = v4;
          v3 = v19;
          if ((v8 & 1) != 0)
            goto LABEL_28;
          goto LABEL_27;
        }
      }
    }

  }
  else
  {
    v4 = 0;
  }
LABEL_27:
  v16 = v4;
  v4 = v3;
LABEL_28:
  v17 = v4;

  return v17;
}

+ (id)filteredPlistArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v18 = v3;
      v8 = 0;
      v9 = *(_QWORD *)v20;
      while (1)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[PSYPlistFilter filteredPlistDictionary:](PSYPlistFilter, "filteredPlistDictionary:", v11);
            v12 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (+[PSYPlistFilter isPlistObject:](PSYPlistFilter, "isPlistObject:", v11))
                objc_msgSend(v4, "addObject:", v11);
              else
                v8 = 1;
              goto LABEL_14;
            }
            +[PSYPlistFilter filteredPlistArray:](PSYPlistFilter, "filteredPlistArray:", v11);
            v12 = objc_claimAutoreleasedReturnValue();
          }
          v13 = (void *)v12;
          if (v12 != v11)
            v8 = 1;
          objc_msgSend(v4, "addObject:", v12);

LABEL_14:
          ++v10;
        }
        while (v7 != v10);
        v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        v7 = v14;
        if (!v14)
        {

          v15 = v4;
          v3 = v18;
          if ((v8 & 1) != 0)
            goto LABEL_25;
          goto LABEL_24;
        }
      }
    }

  }
  else
  {
    v4 = 0;
  }
LABEL_24:
  v15 = v4;
  v4 = v3;
LABEL_25:
  v16 = v4;

  return v16;
}

@end
