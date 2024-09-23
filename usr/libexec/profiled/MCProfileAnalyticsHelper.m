@implementation MCProfileAnalyticsHelper

+ (void)addContainsPayloadInfoWithProfile:(id)a3 eventPayload:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  const __CFString *v18;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v5 = a3;
  v19 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileAnalyticsHelper _containsPayloadsDictionary](MCProfileAnalyticsHelper, "_containsPayloadsDictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allValues"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileAnalyticsHelper _getBoolDictionaryFromKeySet:](MCProfileAnalyticsHelper, "_getBoolDictionaryFromKeySet:", v8));

  objc_msgSend(v9, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("profile_containsPayload_other"));
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v20 = v5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "payloads"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v14), "type"));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v15));

        if (!v16
          || (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v16)),
              v17,
              v18 = v16,
              !v17))
        {
          v18 = CFSTR("profile_containsPayload_other");
        }
        objc_msgSend(v9, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v18);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  objc_msgSend(v19, "addEntriesFromDictionary:", v9);
}

+ (id)_containsPayloadsDictionary
{
  if (qword_1000FD9D0 != -1)
    dispatch_once(&qword_1000FD9D0, &stru_1000E4318);
  return (id)qword_1000FD9C8;
}

+ (id)_getBoolDictionaryFromKeySet:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), (_QWORD)v11);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v4;
}

@end
