@implementation NSHTTPURLResponse(ICAdditions)

- (id)ic_valueForHTTPHeaderField:()ICAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__23697;
  v16 = __Block_byref_object_dispose__23698;
  v17 = 0;
  objc_msgSend(a1, "allHeaderFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__NSHTTPURLResponse_ICAdditions__ic_valueForHTTPHeaderField___block_invoke;
  v9[3] = &unk_1E4390030;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)hasCacheControl
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "ic_valueForHTTPHeaderField:", CFSTR("Cache-Control"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (double)cacheControlMaxAge
{
  void *v1;
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a1, "_cacheControlParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("max-age"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (id)_cacheControlParameters
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_valueForHTTPHeaderField:", CFSTR("Cache-Control"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v2;
    objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(","));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v8), "componentsSeparatedByString:", CFSTR("="));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "count") == 2)
          {
            objc_msgSend(v9, "objectAtIndex:", 0);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v3);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v9, "objectAtIndex:", 1);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v3);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "setObject:forKey:", v13, v11);
          }

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v6);
    }

    v2 = v15;
  }

  return v16;
}

@end
