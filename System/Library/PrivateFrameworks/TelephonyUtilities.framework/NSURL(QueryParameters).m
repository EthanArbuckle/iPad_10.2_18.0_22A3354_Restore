@implementation NSURL(QueryParameters)

- (id)tuQueryParameters
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  NSObject *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2 || objc_msgSend(v2, "isEqual:", &stru_1E38A53C8))
  {
    v4 = (void *)MEMORY[0x1E0CB3998];
    objc_msgSend(a1, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "query");
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
    if (!v7)
      goto LABEL_5;
  }
  if ((objc_msgSend(v3, "isEqual:", &stru_1E38A53C8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v3;
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("&"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("="));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "count") == 2)
          {
            objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "stringByRemovingPercentEncoding");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "stringByRemovingPercentEncoding");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
              v21 = v20 == 0;
            else
              v21 = 1;
            if (!v21)
              objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, v18);

          }
          else if (objc_msgSend(v16, "count") == 1)
          {
            objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("1"), v15);
          }
          else
          {
            TUDefaultLog();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v30 = v15;
              _os_log_impl(&dword_19A50D000, v22, OS_LOG_TYPE_DEFAULT, "[WARN] Couldn't parse query parameter: %@", buf, 0xCu);
            }

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v12);
    }
    v8 = (void *)objc_msgSend(v9, "copy");

    v3 = v24;
  }
  else
  {
LABEL_5:
    v8 = 0;
  }

  return v8;
}

- (id)URLBySettingQueryParameterValue:()QueryParameters forKey:
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = (objc_class *)MEMORY[0x1E0CB3998];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithURL:resolvingAgainstBaseURL:", a1, 0);
  objc_msgSend(v9, "queryItems");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = (void *)MEMORY[0x1E0C9AA60];
  if (v10)
    v12 = (void *)v10;
  v13 = v12;

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", v7, v8);
  objc_msgSend(v13, "arrayByAddingObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setQueryItems:", v15);
  objc_msgSend(v9, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)URLByDeletingQueryParameterWithKey:()QueryParameters
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", a1, 0);
  objc_msgSend(v5, "queryItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3880];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__NSURL_QueryParameters__URLByDeletingQueryParameterWithKey___block_invoke;
  v13[3] = &unk_1E38A1628;
  v14 = v4;
  v8 = v4;
  objc_msgSend(v7, "predicateWithBlock:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setQueryItems:", v10);

  objc_msgSend(v5, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
