@implementation NSURL(VideosUI)

- (id)vui_parsedQueryParametersDictionary
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "query");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("&"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "count");
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v3);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = v2;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "stringByRemovingPercentEncoding", (_QWORD)v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("="));
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v11, "count") == 2)
          {
            objc_msgSend(v11, "objectAtIndex:", 1);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectAtIndex:", 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKey:", v12, v13);

          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    v14 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (uint64_t)vui_containsQueryParamWithName:()VideosUI
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", a1, 0);
  v6 = 0;
  if (objc_msgSend(v4, "length") && v5)
  {
    objc_msgSend(v5, "queryItems");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "name", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "caseInsensitiveCompare:", v4);

          if (!v11)
          {
            v6 = 1;
            goto LABEL_13;
          }
        }
        v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v6;
}

- (id)vui_URLByAddingQueryParamWithName:()VideosUI value:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  if (objc_msgSend(v6, "length") && objc_msgSend(v7, "length"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v8, 0);
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "percentEncodedQueryItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v11, "mutableCopy");

      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", v6, v7);
      if (!v12)
        v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (v13)
        objc_msgSend(v12, "addObject:", v13);
      objc_msgSend(v10, "setPercentEncodedQueryItems:", v12);
      objc_msgSend(v10, "URL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v16 = v14;

        v8 = v16;
      }

    }
  }

  return v8;
}

- (id)vui_URLByAddingQueryParamsDictionary:()VideosUI
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
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
  v5 = a1;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      v10 = v5;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "vui_URLByAddingQueryParamWithName:value:", v11, v12);
        v5 = (id)objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = v5;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)vui_URLByRemovingQueryParamWithName:()VideosUI
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = a1;
  v21 = v5;
  if (objc_msgSend(v4, "length"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v5, 0);
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "percentEncodedQueryItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v8, "mutableCopy");

      if (!v9)
        v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v10 = (void *)objc_msgSend(v9, "copy");
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v23 != v12)
              objc_enumerationMutation(v10);
            v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_msgSend(v14, "name");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", v4);

            if (v16)
              objc_msgSend(v9, "removeObject:", v14);
          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v11);
      }

      objc_msgSend(v7, "setPercentEncodedQueryItems:", v9);
      objc_msgSend(v7, "URL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        v19 = v17;

        v21 = v19;
      }

    }
  }

  return v21;
}

+ (id)vui_sortedQueryItemsFromDictionary:()VideosUI
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v11;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
            goto LABEL_14;
          objc_msgSend(v11, "stringValue");
          v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        v13 = v12;
        if (v12)
        {
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", v10, v12);
          if (v14)
            objc_msgSend(v16, "addObject:", v14);

        }
LABEL_14:

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v16;
}

- (void)vui_URLByAddingQueryParamWithName:()VideosUI value:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_13();
  OUTLINED_FUNCTION_5_7(&dword_1D96EE000, v0, v1, "Unable to add query param %@ to URL %@");
}

@end
