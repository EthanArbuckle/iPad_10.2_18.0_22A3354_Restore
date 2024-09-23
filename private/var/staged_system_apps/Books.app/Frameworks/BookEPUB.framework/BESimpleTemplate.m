@implementation BESimpleTemplate

+ (id)_appVersionNumber
{
  if (qword_3C19E8 != -1)
    dispatch_once(&qword_3C19E8, &stru_3776D0);
  return (id)qword_3C19E0;
}

+ (id)javascriptStringFromJavascriptSource:(id)a3 replacements:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v24;
  id obj;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("version")));

  if (!v9)
  {
    v10 = objc_msgSend(v7, "mutableCopy");
    if (!v10)
      v10 = objc_alloc_init((Class)NSMutableDictionary);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_appVersionNumber"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("version"));

    v7 = v10;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  v24 = v8;
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    do
    {
      v15 = 0;
      v16 = v8;
      do
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v17));
        v19 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
        {
          v20 = v18;
        }
        else
        {
          v26 = 0;
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v18, 0, &v26));
          if (objc_msgSend(v21, "length"))
            v20 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v21, 4);
          else
            v20 = &stru_38FF08;

        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[[__%@__]]"), v17));
        v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", v22, v20));

        v15 = (char *)v15 + 1;
        v16 = v8;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v13);
  }

  return v8;
}

@end
