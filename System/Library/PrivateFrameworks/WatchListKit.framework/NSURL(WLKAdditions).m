@implementation NSURL(WLKAdditions)

+ (id)wlk_sortedQueryItemsFromDictionary:()WLKAdditions
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  __int128 v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v21;
    *(_QWORD *)&v7 = 138412290;
    v18 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v11, v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v12;
          goto LABEL_10;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v12, "stringValue");
          v13 = objc_claimAutoreleasedReturnValue();
LABEL_10:
          v14 = v13;
          if (v13)
            goto LABEL_11;
          goto LABEL_19;
        }
        if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v12))
        {
          objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v12, 0, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v16
              ? objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v16, 4)
              : 0;

          if (v14)
          {
LABEL_11:
            v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", v11, v14);
            if (v15)
              objc_msgSend(v19, "addObject:", v15);

            goto LABEL_21;
          }
        }
LABEL_19:
        WLKNetworkingLogObject();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          v25 = v12;
          _os_log_impl(&dword_1B515A000, v14, OS_LOG_TYPE_DEFAULT, "NSURL-WLKAdditions: Invalid query param: %@", buf, 0xCu);
        }
LABEL_21:

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v8);
  }

  return v19;
}

+ (id)wlk_URLWithServerConfig:()WLKAdditions endpoint:relativeToBaseURL:queryParameters:suppressParameterEncoding:
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  id v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  if (a5)
  {
    WLKBaseURLReturningError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    if (v15)
    {
      v29[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "wlk_stringByAppendingPathComponents:", v17);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      WLKNetworkingLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v16;
        _os_log_impl(&dword_1B515A000, v17, OS_LOG_TYPE_DEFAULT, "NSURL-WLKAdditions: Failed to fetch baseURL: %@", buf, 0xCu);
      }
      v18 = 0;
    }

    if (!v18)
      goto LABEL_16;
  }
  else
  {
    v18 = v13;
    if (!v18)
    {
LABEL_16:
      WLKNetworkingLogObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v13;
        _os_log_impl(&dword_1B515A000, v20, OS_LOG_TYPE_DEFAULT, "NSURL-WLKAdditions: Could not construct url with endpoint: %@", buf, 0xCu);
      }
      v25 = 0;
      goto LABEL_19;
    }
  }
  objc_msgSend(v12, "requiredRequestKeyValuePairsDictionary:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "mutableCopy");

  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  +[WLKLocationManager defaultLocationManager](WLKLocationManager, "defaultLocationManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_locationQueryParameters");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject addEntriesFromDictionary:](v20, "addEntriesFromDictionary:", v22);

  -[NSObject addEntriesFromDictionary:](v20, "addEntriesFromDictionary:", v14);
  objc_msgSend(a1, "wlk_sortedQueryItemsFromDictionary:", v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", v18);
  if (objc_msgSend(v23, "count"))
  {
    if (a7)
      objc_msgSend(v24, "setPercentEncodedQueryItems:", v23);
    else
      objc_msgSend(v24, "setQueryItems:", v23);
  }
  objc_msgSend(v24, "URL");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
  return v25;
}

+ (id)wlk_URLWithServerConfig:()WLKAdditions routeName:queryParameters:suppressParameterEncoding:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "serverRouteNamed:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "requiredKVPType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "requiredRequestKeyValuePairsForType:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v14, "requiresLocation"))
    {
      +[WLKLocationManager defaultLocationManager](WLKLocationManager, "defaultLocationManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_locationQueryParameters");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addEntriesFromDictionary:", v19);

    }
    objc_msgSend(v17, "addEntriesFromDictionary:", v12);
    objc_msgSend(a1, "wlk_sortedQueryItemsFromDictionary:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc(MEMORY[0x1E0CB3998]);
    objc_msgSend(v14, "URL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithURL:resolvingAgainstBaseURL:", v22, 0);

    if (objc_msgSend(v20, "count"))
    {
      if (a6)
        objc_msgSend(v23, "setPercentEncodedQueryItems:", v20);
      else
        objc_msgSend(v23, "setQueryItems:", v20);
    }
    objc_msgSend(v23, "URL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    WLKNetworkingLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 138412290;
      v28 = v11;
      _os_log_impl(&dword_1B515A000, v24, OS_LOG_TYPE_DEFAULT, "NSURL-WLKAdditions: Could not construct url with route name: %@", (uint8_t *)&v27, 0xCu);
    }

    v25 = 0;
  }

  return v25;
}

@end
