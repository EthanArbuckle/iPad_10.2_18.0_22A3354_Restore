@implementation NSURLRequest(ICAdditions)

- (id)ic_valueForHTTPHeaderField:()ICAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  objc_msgSend(a1, "valueForHTTPHeaderField:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__31747;
    v17 = __Block_byref_object_dispose__31748;
    v18 = 0;
    objc_msgSend(a1, "allHTTPHeaderFields");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__NSURLRequest_ICAdditions__ic_valueForHTTPHeaderField___block_invoke;
    v10[3] = &unk_1E4390030;
    v11 = v4;
    v12 = &v13;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v10);

    v7 = (id)v14[5];
    _Block_object_dispose(&v13, 8);

  }
  return v7;
}

- (id)ic_valuesForCookieWithName:()ICAdditions
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_valueForHTTPHeaderField:", CFSTR("Cookie"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "componentsSeparatedByString:", CFSTR("; "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "rangeOfString:options:", CFSTR("="), 2);
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v12 = v10;
          v13 = v11;
          objc_msgSend(v9, "substringToIndex:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v19, "caseInsensitiveCompare:", v14))
          {
            objc_msgSend(v9, "substringFromIndex:", v12 + v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v15);

          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  return v18;
}

@end
