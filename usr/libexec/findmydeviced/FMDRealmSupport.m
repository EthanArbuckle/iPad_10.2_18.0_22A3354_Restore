@implementation FMDRealmSupport

+ (void)initialize
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  if (!qword_100306500)
  {
    v2 = objc_alloc_init((Class)NSMutableDictionary);
    v3 = (void *)qword_100306500;
    qword_100306500 = (uint64_t)v2;

    v4 = objc_alloc_init((Class)NSRecursiveLock);
    v5 = (void *)qword_100306508;
    qword_100306508 = (uint64_t)v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil dictionaryForKey:inDomain:](FMPreferencesUtil, "dictionaryForKey:inDomain:", CFSTR("RealmRedirects"), kFMDPrefDomain));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v12));
          v14 = objc_msgSend(v13, "mutableCopy");
          objc_msgSend((id)qword_100306500, "setObject:forKeyedSubscript:", v14, v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
}

+ (id)redirectedHostForHost:(id)a3 withContext:(id)a4
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = (__CFString *)a4;
  v7 = v6;
  v8 = CFSTR("DefaultContext");
  if (v6)
    v8 = v6;
  v9 = v8;
  objc_msgSend((id)qword_100306508, "lock");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100306500, "objectForKeyedSubscript:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v5));

  objc_msgSend((id)qword_100306508, "unlock");
  if (objc_msgSend(v11, "isEqualToString:", v5))
  {

    v11 = 0;
  }

  return v11;
}

+ (void)setRedirectedHost:(id)a3 forHost:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  id v13;
  NSObject *v14;
  void *v15;
  __int16 v16[12];

  v7 = a3;
  v8 = a4;
  v9 = (__CFString *)a5;
  v10 = v9;
  v11 = CFSTR("DefaultContext");
  if (v9)
    v11 = v9;
  v12 = v11;
  if (!v8)
  {
    v13 = sub_1000031B8();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Can't cache realm host - NULL host value", (uint8_t *)v16, 2u);
    }

  }
  objc_msgSend((id)qword_100306508, "lock");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100306500, "objectForKeyedSubscript:", v12));
  if (!v15)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend((id)qword_100306500, "setObject:forKeyedSubscript:", v15, v12);
  }
  if (v7)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v7, v8);
  else
    objc_msgSend(v15, "removeObjectForKey:", v8);
  +[FMDRealmSupport _updateRealmPrefs](FMDRealmSupport, "_updateRealmPrefs");

  objc_msgSend((id)qword_100306508, "unlock");
}

+ (void)clearCachedHostsWithContext:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;

  v3 = (__CFString *)a3;
  v4 = v3;
  v5 = CFSTR("DefaultContext");
  if (v3)
    v5 = v3;
  v6 = v5;
  objc_msgSend((id)qword_100306508, "lock");
  if (qword_100306500)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100306500, "objectForKeyedSubscript:", v6));

    if (v7)
    {
      objc_msgSend((id)qword_100306500, "removeObjectForKey:", v6);
      +[FMDRealmSupport _updateRealmPrefs](FMDRealmSupport, "_updateRealmPrefs");
    }
  }
  objc_msgSend((id)qword_100306508, "unlock");

}

+ (void)_updateRealmPrefs
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  objc_msgSend(v2, "beginTransaction:", CFSTR("UpdatingRealmPrefs"));

  +[FMPreferencesUtil setDictionary:forKey:inDomain:](FMPreferencesUtil, "setDictionary:forKey:inDomain:", qword_100306500, CFSTR("RealmRedirects"), kFMDPrefDomain);
  v3 = (id)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  objc_msgSend(v3, "endTransaction:", CFSTR("UpdatingRealmPrefs"));

}

@end
