@implementation RAPCategoriesDownloader

+ (void)fetchCategories:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v4 = a3;
  v6 = GEOURLString(12, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sharedSession](NSURLSession, "sharedSession"));
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_100518314;
  v16 = &unk_1011BA120;
  v17 = v4;
  v18 = a1;
  v11 = v4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataTaskWithRequest:completionHandler:", v9, &v13));
  objc_msgSend(v12, "resume", v13, v14, v15, v16);

}

+ (id)adjustedPreferredLanguages
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  const __CFString *v12;
  unsigned int v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v7);
        v9 = objc_msgSend(objc_alloc((Class)NSLocale), "initWithLocaleIdentifier:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", NSLocaleLanguageCode));
        if ((objc_msgSend(v10, "isEqualToString:", v8) & 1) == 0)
        {
          objc_msgSend(v2, "addObject:", v8);
          v11 = objc_msgSend(v8, "hasPrefix:", CFSTR("zh-Hant"));
          v12 = CFSTR("zh-TW");
          if ((v11 & 1) != 0
            || (v13 = objc_msgSend(v8, "hasPrefix:", CFSTR("zh-Hans")), v12 = CFSTR("zh-CN"), v13))
          {
            objc_msgSend(v2, "addObject:", v12);
          }
        }
        if ((objc_msgSend(v2, "containsObject:", v10) & 1) == 0)
          objc_msgSend(v2, "addObject:", v10);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  v14 = objc_msgSend(v2, "copy");
  return v14;
}

+ (id)preferredTranslationInTitles:(id)a3 givenPreferredLanguagesList:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];

  v5 = a3;
  v6 = a4;
  v32 = v5;
  if (objc_msgSend(v6, "count"))
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v42;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v42 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("language")));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
          v15 = objc_msgSend(v13, "isEqualToString:", v14);

          if ((v15 & 1) != 0)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("value")));
            goto LABEL_29;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
        if (v9)
          continue;
        break;
      }
    }

    v5 = v32;
  }
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v5, "count")));
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v16 = v5;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v38 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("value")));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("language")));
        objc_msgSend(v7, "setValue:forKey:", v22, v23);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v18);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v24 = v6;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v34;
LABEL_20:
    v28 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v27)
        objc_enumerationMutation(v24);
      v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v28)));
      if (v29)
        break;
      if (v26 == (id)++v28)
      {
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
        if (v26)
          goto LABEL_20;
        goto LABEL_26;
      }
    }
  }
  else
  {
LABEL_26:

    v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("value")));
  }
  v30 = (void *)v29;

LABEL_29:
  return v30;
}

@end
