@implementation WBSPasswordManagerURL

+ (id)resourceSpecifierEncodedKey:(id)a3 value:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)MEMORY[0x1E0CB3500];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "URLQueryAllowedCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "removeCharactersInString:", CFSTR("&="));
  objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=%@"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)passwordManagerURLWithDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[WBSFeatureAvailability isPasswordManagerAppEnabled](WBSFeatureAvailability, "isPasswordManagerAppEnabled"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v5, "setScheme:", CFSTR("https"));
    objc_msgSend(v5, "setHost:", CFSTR("passwords.apple.com"));
    objc_msgSend(v5, "setPath:", CFSTR("/app"));
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v7 = v4;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v36 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
            v13 = objc_alloc(MEMORY[0x1E0CB39D8]);
            objc_msgSend(v7, "objectForKeyedSubscript:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (void *)objc_msgSend(v13, "initWithName:value:", v12, v14);
            objc_msgSend(v6, "addObject:", v15);

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v9);
      }

      v16 = objc_alloc_init(MEMORY[0x1E0CB3998]);
      objc_msgSend(v16, "setQueryItems:", v6);
      objc_msgSend(v16, "string");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPercentEncodedFragment:", v17);

    }
    objc_msgSend(v5, "URL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "resourceSpecifierEncodedKey:value:", CFSTR("root"), CFSTR("PASSWORDS"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v19);

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v20 = v4;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v32 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
          objc_msgSend(v20, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "resourceSpecifierEncodedKey:value:", v25, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v27);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v22);
    }

    objc_msgSend(v5, "componentsJoinedByString:", CFSTR("&"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("prefs"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v29);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

+ (id)passwordManagerURLWithPrefsURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (+[WBSFeatureAvailability isPasswordManagerAppEnabled](WBSFeatureAvailability, "isPasswordManagerAppEnabled"))
  {
    v5 = (void *)MEMORY[0x1E0CB3998];
    objc_msgSend(a1, "passwordManagerURLWithDictionary:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsWithURL:resolvingAgainstBaseURL:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPercentEncodedFragment:", v8);

    objc_msgSend(v7, "URL");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v4;
  }

  return v9;
}

+ (NSURL)passwordManagerURLForRecentlyDeleted
{
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("recentlyDeleted");
  v7[0] = CFSTR("true");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "passwordManagerURLWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

+ (id)passwordManagerURLForGroupWithID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("sharingGroupID");
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "passwordManagerURLWithDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (NSURL)passwordManagerURLForGeneratedPasswords
{
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("generatedPasswords");
  v7[0] = CFSTR("true");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "passwordManagerURLWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

+ (id)passwordManagerURLWithOtpauthURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("path");
  v8[1] = CFSTR("url");
  v9[0] = CFSTR("OTPAUTH_URL");
  objc_msgSend(a3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "passwordManagerURLWithDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)_urlIsPasswordManagerURL:(id)a3 resourceSpecifierDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  char v14;
  void *v15;
  int v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("http")) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", CFSTR("https")))
  {
    objc_msgSend(v6, "host");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("passwords.apple.com"));

    if (v11)
    {
      objc_msgSend(v6, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("/app"));

      if ((v13 & 1) != 0)
        goto LABEL_5;
    }
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v6, "scheme");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("prefs"));

  if (!v16)
    goto LABEL_7;
LABEL_5:
  v14 = objc_msgSend(a1, "_resourceSpecifierDictionaryIsPasswordManagerResourceSpecifierDictionary:", v7);
LABEL_8:

  return v14;
}

+ (BOOL)_resourceSpecifierDictionaryIsPasswordManagerResourceSpecifierDictionary:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "safari_stringForKey:", CFSTR("root"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = !objc_msgSend(v3, "length")
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("PASSWORDS")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("ACCOUNTS_AND_PASSWORDS"));

  return v4;
}

+ (BOOL)urlIsPasswordManagerURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_resourceSpecifierDictionaryForURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "_urlIsPasswordManagerURL:resourceSpecifierDictionary:", v4, v5);

  return (char)a1;
}

+ (id)_resourceSpecifierDictionaryForURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("http")) & 1) != 0
    || (v6 = v3, objc_msgSend(v5, "isEqualToString:", CFSTR("https"))))
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fragment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (!v9)
    {

      v15 = (void *)MEMORY[0x1E0C9AA70];
LABEL_30:
      v40 = v3;
      goto LABEL_31;
    }
    v10 = (void *)MEMORY[0x1E0CB3998];
    objc_msgSend(v7, "percentEncodedFragment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsWithString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "queryItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      v43 = v5;
      v45 = v3;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      objc_msgSend(v12, "percentEncodedQueryItems");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v52 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
            objc_msgSend(v21, "value");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "stringByRemovingPercentEncoding");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "name");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, v24);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        }
        while (v18);
      }

      v5 = v43;
      v3 = v45;
      goto LABEL_29;
    }
    objc_msgSend(v12, "scheme");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("prefs"));

    if (!v26)
    {
      v15 = (void *)MEMORY[0x1E0C9AA70];
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(v12, "URL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v6 = v3;
    if (v27)
    {
      v6 = v27;

    }
  }
  v44 = v5;
  v46 = v3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v6;
  objc_msgSend(v6, "resourceSpecifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "componentsSeparatedByString:", CFSTR("&"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v31 = v30;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v48 != v34)
          objc_enumerationMutation(v31);
        objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * j), "componentsSeparatedByString:", CFSTR("="));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v36, "count") == 2)
        {
          objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectAtIndexedSubscript:", 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "stringByRemovingPercentEncoding");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "setObject:forKeyedSubscript:", v39, v37);
        }

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v33);
  }

  v5 = v44;
  v3 = v46;
  v40 = v42;
LABEL_31:

  return v15;
}

+ (id)dictionaryWithPasswordManagerURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_resourceSpecifierDictionaryForURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(a1, "_urlIsPasswordManagerURL:resourceSpecifierDictionary:", v4, v5);

  if ((_DWORD)a1)
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    v9[0] = CFSTR("root");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectsForKeys:", v7);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)valueForPasswordManagerURL:(id)a3 key:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "dictionaryWithPasswordManagerURL:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_stringForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)valueForPasswordManagerResourceDictionary:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "_resourceSpecifierDictionaryIsPasswordManagerResourceSpecifierDictionary:", v6))
  {
    objc_msgSend(v6, "safari_stringForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)BOOLForPasswordManagerResourceDictionary:(id)a3 key:(id)a4 defaultValue:(BOOL)a5
{
  int v5;
  void *v6;

  v5 = a5;
  objc_msgSend(a1, "valueForPasswordManagerResourceDictionary:key:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if ((objc_msgSend(CFSTR("true"), "isEqualToString:", v6) & 1) != 0)
      LOBYTE(v5) = 1;
    else
      v5 &= ~objc_msgSend(CFSTR("false"), "isEqualToString:", v6);
  }

  return v5;
}

+ (BOOL)isPasswordManagerPasswordOptionsResourceDictionary:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (objc_msgSend(a1, "_resourceSpecifierDictionaryIsPasswordManagerResourceSpecifierDictionary:", v4))
  {
    objc_msgSend(v4, "safari_stringForKey:", CFSTR("path"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("PASSWORD_OPTIONS"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (NSURL)passwordManagerSecurityRecommendationsURL
{
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("path");
  v7[0] = CFSTR("SECURITY_RECOMMENDATIONS");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "passwordManagerURLWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

+ (BOOL)isPasswordManagerSecurityRecommendationsResourceDictionary:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (objc_msgSend(a1, "_resourceSpecifierDictionaryIsPasswordManagerResourceSpecifierDictionary:", v4))
  {
    objc_msgSend(v4, "safari_stringForKey:", CFSTR("path"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("SECURITY_RECOMMENDATIONS"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isOtpauthResourceDictionary:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (objc_msgSend(a1, "_resourceSpecifierDictionaryIsPasswordManagerResourceSpecifierDictionary:", v4))
  {
    objc_msgSend(v4, "safari_stringForKey:", CFSTR("path"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("OTPAUTH_URL"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isOtpauthMigrationResourceDictionary:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (objc_msgSend(a1, "_resourceSpecifierDictionaryIsPasswordManagerResourceSpecifierDictionary:", v4))
  {
    objc_msgSend(v4, "safari_stringForKey:", CFSTR("path"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("OTPAUTH_MIGRATION_URL"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isPasswordManagerRecentlyDeletedResourceDictionary:(id)a3
{
  return objc_msgSend(a1, "BOOLForPasswordManagerResourceDictionary:key:defaultValue:", a3, CFSTR("recentlyDeleted"), 0);
}

+ (BOOL)isPasswordManagerVerificationCodesURL:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a1, "dictionaryWithPasswordManagerURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_stringForKey:", CFSTR("path"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("VERIFICATION_CODES"));

  return v5;
}

+ (BOOL)isPasswordManagerVerificationCodesResourceDictionary:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (objc_msgSend(a1, "_resourceSpecifierDictionaryIsPasswordManagerResourceSpecifierDictionary:", v4))
  {
    objc_msgSend(v4, "safari_stringForKey:", CFSTR("path"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("VERIFICATION_CODES"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isPasswordManagerPasskeysResourceDictionary:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "safari_stringForKey:", CFSTR("path"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PASSKEYS"));

  return v4;
}

+ (BOOL)isPasswordManagerFamilySharingGroupSetupURL:(id)a3
{
  id v3;
  void *v4;

  v3 = a1;
  objc_msgSend(a1, "dictionaryWithPasswordManagerURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "BOOLForPasswordManagerResourceDictionary:key:defaultValue:", v4, CFSTR("familySharingGroupSetup"), 0);

  return (char)v3;
}

+ (BOOL)isPasswordManagerGeneratedPasswordsResourceDictionary:(id)a3
{
  return objc_msgSend(a1, "BOOLForPasswordManagerResourceDictionary:key:defaultValue:", a3, CFSTR("generatedPasswords"), 0);
}

@end
