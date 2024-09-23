@implementation NSURL(IMAdditions)

+ (id)percentEncodedStringToDictionary:()IMAdditions
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *v23;
  uint64_t v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "length");
  v23 = v3;
  if (v5)
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("&"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    v9 = CFSTR("=");
    v10 = 0x1E0C99000uLL;
    do
    {
      v11 = 0;
      v24 = v7;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v11), "componentsSeparatedByString:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByRemovingPercentEncoding");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(v10 + 3640), "null");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v12, "count") >= 2)
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
          v16 = v8;
          v17 = v4;
          v18 = v9;
          v19 = v10;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringByRemovingPercentEncoding");
          v21 = objc_claimAutoreleasedReturnValue();

          v10 = v19;
          v9 = v18;
          v4 = v17;
          v8 = v16;
          v7 = v24;
          v15 = (void *)v21;
        }
        objc_msgSend(v4, "setObject:forKey:", v15, v14);

        ++v11;
      }
      while (v7 != v11);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)pf_dictionaryToEscapedQueryString:()IMAdditions
{
  id v3;
  void *v4;
  void *v5;
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
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "keyEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        if (objc_msgSend(v4, "length"))
          objc_msgSend(v4, "appendString:", CFSTR("&"));
        objc_msgSend(v10, "pf_stringWithPercentEscape");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:", v11);

        objc_msgSend(v3, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 != v13)
        {
          objc_msgSend(v4, "appendString:", CFSTR("="));
          objc_msgSend(v12, "pf_stringWithPercentEscape");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendString:", v14);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)pf_URLByAppendingHashString:()IMAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0CB3998];
  v5 = a3;
  objc_msgSend(v4, "componentsWithURL:resolvingAgainstBaseURL:", a1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v6, "percentEncodedFragment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "percentEncodedStringToDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addEntriesFromDictionary:", v5);
  objc_msgSend(MEMORY[0x1E0C99E98], "pf_dictionaryToEscapedQueryString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPercentEncodedFragment:", v10);

  objc_msgSend(v6, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)pf_URLByAppendingQueryString:()IMAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0CB3998];
  v5 = a3;
  objc_msgSend(v4, "componentsWithURL:resolvingAgainstBaseURL:", a1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v6, "percentEncodedQuery");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "percentEncodedStringToDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addEntriesFromDictionary:", v5);
  objc_msgSend(MEMORY[0x1E0C99E98], "pf_dictionaryToEscapedQueryString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPercentEncodedQuery:", v10);

  objc_msgSend(v6, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)pf_unescapedPath
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByRemovingPercentEscapes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "hasPrefix:", CFSTR("/")))
  {
    objc_msgSend(v2, "substringFromIndex:", 1);
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  return v2;
}

- (uint64_t)pf_cleanUrlToStoreId
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(a1, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("/id+(\\d*)"), 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstMatchInString:options:range:", v1, 0, 0, objc_msgSend(v1, "length"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("id=+(\\d*)"), 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "firstMatchInString:options:range:", v1, 0, 0, objc_msgSend(v1, "length"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v10 = 0;
      goto LABEL_6;
    }
    v4 = (void *)v6;
  }
  v7 = objc_msgSend(v4, "rangeAtIndex:", 1);
  objc_msgSend(v1, "substringWithRange:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "longLongValue");

LABEL_6:
  return v10;
}

- (uint64_t)pf_cleanUrlToStoreTrackId
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a1, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("i=+(\\d*)"), 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstMatchInString:options:range:", v1, 0, 0, objc_msgSend(v1, "length"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "rangeAtIndex:", 1);
    objc_msgSend(v1, "substringWithRange:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "longLongValue");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)pf_cleanUrlToEpisodeGuid
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("episodeGuid=+([^&]+)"), 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstMatchInString:options:range:", v1, 0, 0, objc_msgSend(v1, "length"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "rangeAtIndex:", 1);
    objc_msgSend(v1, "substringWithRange:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByRemovingPercentEncoding");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (uint64_t)pf_cleanUrlToChannelStoreId
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(a1, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("podcast-channels/+(\\d*)"), 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstMatchInString:options:range:", v1, 0, 0, objc_msgSend(v1, "length"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("channel/.+/id(\\d+)"), 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "firstMatchInString:options:range:", v1, 0, 0, objc_msgSend(v1, "length"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v10 = 0;
      goto LABEL_6;
    }
    v4 = (void *)v6;
  }
  v7 = objc_msgSend(v4, "rangeAtIndex:", 1);
  objc_msgSend(v1, "substringWithRange:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "longLongValue");

LABEL_6:
  return v10;
}

@end
