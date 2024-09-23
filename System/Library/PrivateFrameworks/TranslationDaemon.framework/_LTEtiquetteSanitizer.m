@implementation _LTEtiquetteSanitizer

- (_LTEtiquetteSanitizer)initWithReplacementTokenDictionary:(id)a3 language:(id)a4
{
  id v6;
  id v7;
  _LTEtiquetteSanitizer *v8;
  _LTEtiquetteSanitizer *v9;
  uint64_t v10;
  NSDictionary *replacementTree;
  _LTEtiquetteSanitizer *v12;

  v6 = a3;
  v7 = a4;
  v8 = -[_LTEtiquetteSanitizer init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[_LTEtiquetteSanitizer treeForReplacementTokens:](v8, "treeForReplacementTokens:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    replacementTree = v9->_replacementTree;
    v9->_replacementTree = (NSDictionary *)v10;

    objc_storeStrong((id *)&v9->_locale, a4);
    v12 = v9;
  }

  return v9;
}

- (_LTEtiquetteSanitizer)initWithModelURL:(id)a3 language:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _LTEtiquetteSanitizer *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("etiquette.json"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  replacementDictionaryForEtiquetteFileAtURL(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = _LTOSLogEtiquetteSanitizer();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = 138543362;
      v13 = v7;
      _os_log_impl(&dword_2491B9000, v9, OS_LOG_TYPE_INFO, "Creating etiquette sanitizer with URL: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  v10 = -[_LTEtiquetteSanitizer initWithReplacementTokenDictionary:language:](self, "initWithReplacementTokenDictionary:language:", v8, v6);

  return v10;
}

- (id)treeForReplacementTokens:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50___LTEtiquetteSanitizer_treeForReplacementTokens___block_invoke;
  v8[3] = &unk_251A126B0;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

- (id)matchesForString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _QWORD *v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id location;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__4;
  v35[4] = __Block_byref_object_dispose__4;
  v36 = 0;
  objc_msgSend(v24, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v24, "length");
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __42___LTEtiquetteSanitizer_matchesForString___block_invoke;
  v29[3] = &unk_251A126D8;
  v23 = &v34;
  objc_copyWeak(&v34, &location);
  v9 = v5;
  v30 = v9;
  v33 = v35;
  v10 = v4;
  v31 = v10;
  v11 = v6;
  v32 = v11;
  objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 2, v29);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v38, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v16, "node", v23);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("TOKEN"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setToken:", v18);

        objc_msgSend(v16, "token");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
          objc_msgSend(v10, "addObject:", v16);
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v38, 16);
    }
    while (v13);
  }

  v20 = v32;
  v21 = v10;

  objc_destroyWeak(v23);
  _Block_object_dispose(v35, 8);

  objc_destroyWeak(&location);
  return v21;
}

- (id)replacementStringForString:(id)a3 forToken:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = objc_msgSend(v5, "length");
  v9 = objc_msgSend(v6, "length");

  if (v8 >= v9)
    v10 = v9;
  else
    v10 = v8;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61___LTEtiquetteSanitizer_replacementStringForString_forToken___block_invoke;
  v13[3] = &unk_251A12700;
  v11 = v7;
  v14 = v11;
  objc_msgSend(v5, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 2, v13);

  return v11;
}

- (id)stringByReplacingMatches:(id)a3 inString:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "mutableCopy");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "range");
        objc_msgSend(v7, "substringWithRange:", v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "token");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[_LTEtiquetteSanitizer replacementStringForString:forToken:](self, "replacementStringForString:forToken:", v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = objc_msgSend(v18, "length");
        v10 += v19 - objc_msgSend(v16, "length");
        v20 = objc_msgSend(v13, "range");
        objc_msgSend(v7, "replaceCharactersInRange:withString:", v20 + v10, v21, v18);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  v22 = (void *)objc_msgSend(v7, "copy");
  return v22;
}

- (id)sanitizedStringForString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSLocale *locale;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_LTEtiquetteSanitizer matchesForString:](self, "matchesForString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[_LTEtiquetteSanitizer stringByReplacingMatches:inString:](self, "stringByReplacingMatches:inString:", v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = _LTOSLogEtiquetteSanitizer();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    locale = self->_locale;
    v9 = v7;
    -[NSLocale localeIdentifier](locale, "localeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138740483;
    v13 = v6;
    v14 = 2117;
    v15 = v4;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_2491B9000, v9, OS_LOG_TYPE_INFO, "sanitizedString '%{sensitive}@' forString '%{sensitive}@' locale: %{public}@", (uint8_t *)&v12, 0x20u);

  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_replacementTree, 0);
}

@end
