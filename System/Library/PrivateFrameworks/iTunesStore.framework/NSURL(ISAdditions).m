@implementation NSURL(ISAdditions)

+ (id)copyDictionaryForQueryString:()ISAdditions unescapedValues:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v17 = v5;
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("&"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11), "componentsSeparatedByString:", CFSTR("="));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count") == 2)
        {
          objc_msgSend(v12, "objectAtIndex:", 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (a4)
          {
            objc_msgSend(MEMORY[0x24BDBCF48], "unescapedStringForString:", v13);
            v14 = objc_claimAutoreleasedReturnValue();

            v13 = (void *)v14;
          }
          objc_msgSend(v12, "objectAtIndex:", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKey:", v13, v15);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  return v6;
}

+ (id)escapedStringForString:()ISAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_URLQueryParameterValueAllowedCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAddingPercentEncodingWithAllowedCharacters:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)queryStringForDictionary:()ISAdditions escapedValues:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nextObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    v10 = 0;
    do
    {
      objc_msgSend(v5, "objectForKey:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "stringValue");
        v12 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v12;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (a4)
        {
          objc_msgSend(a1, "escapedStringForString:", v11);
          v13 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v13;
        }
        if (v10)
          v14 = CFSTR("&%@=%@");
        else
          v14 = CFSTR("%@=%@");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%@%@"), 0, v9, v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendString:", v15);

        ++v10;
      }

      objc_msgSend(v7, "nextObject");
      v16 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v16;
    }
    while (v16);
  }
  if (objc_msgSend(v6, "length"))
    v17 = v6;
  else
    v17 = 0;
  v18 = v17;

  return v18;
}

+ (id)unescapedStringForString:()ISAdditions
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = v3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "stringByRemovingPercentEncoding");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (uint64_t)copyQueryStringDictionaryWithUnescapedValues:()ISAdditions
{
  void *v4;
  void *v5;
  uint64_t v6;

  v4 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(a1, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "copyDictionaryForQueryString:unescapedValues:", v5, a3);

  return v6;
}

- (id)URLByAppendingQueryParameter:()ISAdditions value:
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;

  v6 = (objc_class *)MEMORY[0x24BDD16A8];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  objc_msgSend(a1, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithString:", v10);

  objc_msgSend(a1, "query");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "escapedStringForString:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v14 = CFSTR("&%@=%@");
  else
    v14 = CFSTR("?%@=%@");
  objc_msgSend(v11, "appendFormat:", v14, v8, v13);

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)urlBySettingQueryStringDictionary:()ISAdditions
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v31;
  id v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDD16A8]);
  objc_msgSend(a1, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithString:", v6);

  objc_msgSend(a1, "query");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_msgSend(v7, "rangeOfString:options:", v8, 4);
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v7, "deleteCharactersInRange:", v9, v10);
  }
  if ((objc_msgSend(v7, "hasSuffix:", CFSTR("?")) & 1) == 0)
    objc_msgSend(v7, "appendString:", CFSTR("?"));
  v31 = v8;
  v33 = v7;
  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v12 = (id)objc_msgSend(a1, "copyQueryStringDictionaryWithUnescapedValues:", 0);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v39 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKey:", v17, v31);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v18, v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v14);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v19 = v4;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v35 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
        v25 = (void *)MEMORY[0x24BDBCF48];
        objc_msgSend(v19, "objectForKey:", v24, v31);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "escapedStringForString:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
          objc_msgSend(v11, "setObject:forKey:", v27, v24);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v21);
  }

  objc_msgSend(MEMORY[0x24BDBCF48], "queryStringForDictionary:escapedValues:", v11, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    objc_msgSend(v33, "appendString:", v28);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v33, v31);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (uint64_t)isSafeExternalURL
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLBagForContext:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "valueForKey:", CFSTR("mobile-url-handlers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v6, "containsObject:", v2) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", CFSTR("http"), CFSTR("https"), CFSTR("itms"), CFSTR("itms-apps"), CFSTR("itms-books"), CFSTR("its-music"), CFSTR("its-videos"), CFSTR("itmss"), CFSTR("itms-appss"), CFSTR("itms-bookss"), CFSTR("mailto"), CFSTR("prefs"), CFSTR("fuse"), CFSTR("music"), CFSTR("musics"), CFSTR("itms-gc"), CFSTR("itms-gcs"),
                     CFSTR("itms-itunesu"),
                     CFSTR("itms-itunesus"),
                     CFSTR("its-musics"),
                     CFSTR("its-videoss"),
                     CFSTR("itms-podcasts"),
                     CFSTR("itms-podcastss"),
                     CFSTR("shoebox"),
                     CFSTR("itsradio"),
                     CFSTR("livenation"),
                     CFSTR("disneymoviesanywhere"),
                     0);
      v7 = objc_msgSend(v8, "containsObject:", v2);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)schemeSwizzledURL
{
  id v1;
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v1 = a1;
  objc_msgSend(v1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("itms")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("itms-apps")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("itms-books")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("itms-news")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("itms-gc")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("itms-itunesu")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("its-music")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("its-videos")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("itms-podcasts")) & 1) != 0)
  {
    v3 = CFSTR("http");
LABEL_11:
    objc_msgSend(v1, "absoluteString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v2, "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v7;
    goto LABEL_12;
  }
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("itmss")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("itms-appss")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("itms-bookss")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("itms-newss")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("itms-gcs")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("itms-itunesus")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("its-musics")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("its-videoss")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("itms-podcastss")) & 1) != 0
    || objc_msgSend(v2, "isEqualToString:", CFSTR("itms-ui")))
  {
    v3 = CFSTR("https");
    goto LABEL_11;
  }
LABEL_12:

  return v1;
}

- (id)urlByReplacingSchemeWithScheme:()ISAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v5, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)enumerateQueryWithBlock:()ISAdditions
{
  void (**v4)(id, void *, void *);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", CFSTR(";"),
    CFSTR("&"),
    0,
    0,
    objc_msgSend(v6, "length"));
  v17 = v6;
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("&"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11), "componentsSeparatedByString:", CFSTR("="));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count") == 2)
        {
          objc_msgSend(v12, "objectAtIndex:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringByRemovingPercentEncoding");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "objectAtIndex:", 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringByRemovingPercentEncoding");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v4[2](v4, v14, v16);
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

}

+ (id)_URLQueryParameterValueAllowedCharacterSet
{
  if (_URLQueryParameterValueAllowedCharacterSet_onceToken != -1)
    dispatch_once(&_URLQueryParameterValueAllowedCharacterSet_onceToken, &__block_literal_global_0);
  return (id)_URLQueryParameterValueAllowedCharacterSet_characterSet;
}

@end
