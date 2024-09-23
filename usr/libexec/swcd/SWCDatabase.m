@implementation SWCDatabase

+ (OS_dispatch_queue)queue
{
  if (qword_100037240 != -1)
    dispatch_once(&qword_100037240, &stru_100030C68);
  return (OS_dispatch_queue *)(id)qword_100037238;
}

+ (SWCDatabase)sharedDatabase
{
  id v2;
  NSObject *v3;

  v2 = objc_msgSend((id)objc_opt_class(a1), "queue");
  v3 = objc_claimAutoreleasedReturnValue(v2);
  dispatch_assert_queue_V2(v3);

  if (qword_100037230 != -1)
    dispatch_once(&qword_100037230, &stru_100030C48);
  return (SWCDatabase *)(id)qword_100037228;
}

+ (SWCDatabase)new
{
  abort();
}

- (SWCDatabase)init
{
  abort();
}

+ (id)loadContentsOfURL:(id)a3 error:(id *)a4
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;

  v7 = objc_autoreleasePoolPush();
  v17 = 0;
  v8 = objc_msgSend(objc_alloc((Class)NSData), "initWithContentsOfURL:options:error:", a3, 1, &v17);
  v9 = v17;
  v10 = v9;
  if (v8)
  {
    v16 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_storageFromArchivedData:error:", v8, &v16));
    v12 = v16;

    if (v11)
      v13 = v11;

    v10 = v12;
  }
  else
  {
    v11 = 0;
  }

  objc_autoreleasePoolPop(v7);
  if (!v11)
  {
    if (qword_100037250 != -1)
      dispatch_once(&qword_100037250, &stru_100030D78);
    v14 = qword_100037248;
    if (os_log_type_enabled((os_log_t)qword_100037248, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to load SWC database: %@", buf, 0xCu);
      if (!a4)
        goto LABEL_12;
      goto LABEL_11;
    }
    if (a4)
LABEL_11:
      *a4 = objc_retainAutorelease(v10);
  }
LABEL_12:

  return v11;
}

- (void)receiveSIGTERMSignal
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = (void *)os_transaction_create("com.apple.swc.db.SIGTERM");
  v4 = objc_claimAutoreleasedReturnValue(+[SWCDatabase queue](SWCDatabase, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000F734;
  v6[3] = &unk_1000307C0;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

- (NSURL)storageURL
{
  if ((*((_BYTE *)self + 40) & 1) != 0)
    return (NSURL *)(id)objc_claimAutoreleasedReturnValue(-[SWCDatabase _dataURLReturningError:](self, "_dataURLReturningError:", 0));
  else
    return (NSURL *)0;
}

- (id)entry:(id)a3
{
  void *v5;
  id v6;
  void *v7;

  v5 = objc_autoreleasePoolPush();
  v6 = -[NSMutableOrderedSet indexOfObject:](self->_entries, "indexOfObject:", a3);
  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
    v7 = 0;
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet objectAtIndexedSubscript:](self->_entries, "objectAtIndexedSubscript:", v6));
  objc_autoreleasePoolPop(v5);
  return v7;
}

- (BOOL)mayContainEntryMatchingServiceSpecifier:(id)a3
{
  return 1;
}

- (void)enumerateEntries:(id)a3 matchingService:(id)a4 domain:(id)a5 appID:(id)a6 block:(id)a7
{
  NSMutableOrderedSet *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  unsigned __int8 v24;
  void *context;
  id obj;
  id obja;
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  context = objc_autoreleasePoolPush();
  v13 = (NSMutableOrderedSet *)a3;
  obj = v13;
  if (a5 && self->_entries == v13 && -[SWCDomainCache isValid](self->_domainCache, "isValid"))
  {
    v14 = objc_claimAutoreleasedReturnValue(-[SWCDomainCache entriesForDomain:](self->_domainCache, "entriesForDomain:", a5));

    obj = (id)v14;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obja = obj;
  v15 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v30;
LABEL_7:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v16)
        objc_enumerationMutation(obja);
      v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v17);
      if (!a4
        || (v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v17), "serviceType")),
            v20 = objc_msgSend(v19, "caseInsensitiveCompare:", a4) == 0,
            v19,
            v20))
      {
        if (!a5
          || (v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "domain")),
              v22 = objc_msgSend(v21, "encompassesDomain:", a5),
              v21,
              (v22 & 1) != 0))
        {
          if (!a6
            || (v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "applicationIdentifier")),
                v24 = objc_msgSend(v23, "isEqualToApplicationIdentifierIgnoringPrefix:", a6),
                v23,
                (v24 & 1) != 0))
          {
            v28 = 0;
            (*((void (**)(id, void *, char *))a7 + 2))(a7, v18, &v28);
            if (v28)
              break;
          }
        }
      }
      if (v15 == (id)++v17)
      {
        v15 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v15)
          goto LABEL_7;
        break;
      }
    }
  }

  objc_autoreleasePoolPop(context);
}

- (void)enumerateEntries:(id)a3 matchingServiceSpecifier:(id)a4 block:(id)a5
{
  void *v9;
  void *v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "serviceType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "SWCDomain"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "SWCApplicationIdentifier"));
  -[SWCDatabase enumerateEntries:matchingService:domain:appID:block:](self, "enumerateEntries:matchingService:domain:appID:block:", a3, v11, v9, v10, a5);

}

- (void)enumerateEntriesWithBlock:(id)a3
{
  NSMutableOrderedSet *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_entries;
  v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v6)
        objc_enumerationMutation(v4);
      v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
      v9 = objc_autoreleasePoolPush();
      v10 = 0;
      (*((void (**)(id, uint64_t, unsigned __int8 *))a3 + 2))(a3, v8, &v10);
      LODWORD(v8) = v10;
      objc_autoreleasePoolPop(v9);
      if ((_DWORD)v8)
        break;
      if (v5 == (id)++v7)
      {
        v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)enumerateEntriesMatchingService:(id)a3 domain:(id)a4 appID:(id)a5 block:(id)a6
{
  -[SWCDatabase enumerateEntries:matchingService:domain:appID:block:](self, "enumerateEntries:matchingService:domain:appID:block:", self->_entries, a3, a4, a5, a6);
}

- (void)enumerateEntriesMatchingServiceSpecifier:(id)a3 block:(id)a4
{
  NSMutableOrderedSet *entries;
  void *v8;
  void *v9;
  id v10;

  entries = self->_entries;
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "serviceType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "SWCDomain"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "SWCApplicationIdentifier"));
  -[SWCDatabase enumerateEntries:matchingService:domain:appID:block:](self, "enumerateEntries:matchingService:domain:appID:block:", entries, v10, v8, v9, a4);

}

- (void)enumerateEntriesMatchingService:(id)a3 exactDomain:(id)a4 appID:(id)a5 block:(id)a6
{
  _QWORD v6[6];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000FE18;
  v6[3] = &unk_100030C90;
  v6[4] = a4;
  v6[5] = a6;
  -[SWCDatabase enumerateEntriesMatchingService:domain:appID:block:](self, "enumerateEntriesMatchingService:domain:appID:block:", a3, a4, a5, v6);
}

- (void)enumerateEntriesMatchingServiceSpecifierWithExactDomain:(id)a3 block:(id)a4
{
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "serviceType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "SWCDomain"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "SWCApplicationIdentifier"));
  -[SWCDatabase enumerateEntriesMatchingService:exactDomain:appID:block:](self, "enumerateEntriesMatchingService:exactDomain:appID:block:", v9, v7, v8, a4);

}

- (id)entryMatchingService:(id)a3 domain:(id)a4 appID:(id)a5
{
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_100010044;
  v12 = sub_100010054;
  v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001005C;
  v7[3] = &unk_100030CB8;
  v7[4] = a4;
  v7[5] = &v8;
  -[SWCDatabase enumerateEntriesMatchingService:domain:appID:block:](self, "enumerateEntriesMatchingService:domain:appID:block:", a3, a4, a5, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)entryMatchingServiceSpecifier:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "serviceType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "SWCDomain"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "SWCApplicationIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase entryMatchingService:domain:appID:](self, "entryMatchingService:domain:appID:", v5, v6, v7));

  return v8;
}

- (BOOL)addEntries:(id)a3
{
  id v5;
  id v6;

  v5 = -[NSMutableOrderedSet count](self->_entries, "count");
  -[NSMutableOrderedSet unionOrderedSet:](self->_entries, "unionOrderedSet:", a3);
  v6 = -[NSMutableOrderedSet count](self->_entries, "count");
  if (v6 != v5)
  {
    -[SWCDomainCache updateCachedDomainsForEntries:](self->_domainCache, "updateCachedDomainsForEntries:", a3);
    -[SWCDatabase _scheduleSave](self, "_scheduleSave");
  }
  return v6 != v5;
}

- (BOOL)removeEntries:(id)a3
{
  id v5;
  id v6;

  v5 = -[NSMutableOrderedSet count](self->_entries, "count");
  -[NSMutableOrderedSet minusOrderedSet:](self->_entries, "minusOrderedSet:", a3);
  v6 = -[NSMutableOrderedSet count](self->_entries, "count");
  if (v6 != v5)
  {
    -[SWCDomainCache clear](self->_domainCache, "clear");
    -[SWCDomainCache updateCachedDomainsForEntries:](self->_domainCache, "updateCachedDomainsForEntries:", self->_entries);
    -[SWCDatabase _scheduleSave](self, "_scheduleSave");
  }
  return v6 != v5;
}

- (void)removeAllEntries
{
  NSNumber *launchServicesDatabaseGeneration;
  NSData *enterpriseState;
  NSObject *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;

  -[NSMutableOrderedSet removeAllObjects](self->_entries, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_settings, "removeAllObjects");
  launchServicesDatabaseGeneration = self->_launchServicesDatabaseGeneration;
  self->_launchServicesDatabaseGeneration = 0;

  enterpriseState = self->_enterpriseState;
  self->_enterpriseState = 0;

  -[SWCDomainCache clear](self->_domainCache, "clear");
  if (qword_100037250 != -1)
    dispatch_once(&qword_100037250, &stru_100030D78);
  v5 = qword_100037248;
  if (os_log_type_enabled((os_log_t)qword_100037248, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Deleting old SWC database from storage", buf, 2u);
  }
  v9 = 0;
  v6 = -[SWCDatabase _deleteStorageItemReturningError:](self, "_deleteStorageItemReturningError:", &v9);
  v7 = v9;
  if ((v6 & 1) == 0)
  {
    if (qword_100037250 != -1)
      dispatch_once(&qword_100037250, &stru_100030D78);
    v8 = qword_100037248;
    if (os_log_type_enabled((os_log_t)qword_100037248, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Delete SWC database from storage failed with error %@", buf, 0xCu);
    }
  }

}

- (void)updateEntriesForDomain:(id)a3 canonicalEntries:(id)a4
{
  void *v7;
  NSObject *v8;
  id v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (!objc_msgSend(a4, "count"))
  {
    if (qword_100037250 != -1)
      dispatch_once(&qword_100037250, &stru_100030D78);
    v8 = qword_100037248;
    if (os_log_type_enabled((os_log_t)qword_100037248, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "JSON file for %@ had no entries", buf, 0xCu);
    }
  }
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_1000106F0;
  v13 = &unk_100030CE0;
  v9 = v7;
  v14 = v9;
  v15 = a4;
  -[SWCDatabase enumerateEntriesMatchingService:exactDomain:appID:block:](self, "enumerateEntriesMatchingService:exactDomain:appID:block:", 0, a3, 0, &v10);
  -[SWCDatabase _reorderAppLinks:domain:](self, "_reorderAppLinks:domain:", a4, a3, v10, v11, v12, v13);
  +[SWCEntry canonicalizeEntries:](SWCEntry, "canonicalizeEntries:", self->_entries);
  -[SWCDatabase scheduleNextSave](self, "scheduleNextSave");

}

- (id)settingsDictionaryForServiceSpecifier:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_settings, "objectForKeyedSubscript:", a3);
}

- (void)setSettingsDictionary:(id)a3 forServiceSpecifier:(id)a4
{
  id v6;
  _SWCGeneration *v7;
  _SWCGeneration *settingsGeneration;

  v6 = objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_settings, "setObject:forKeyedSubscript:", v6, a4);

  v7 = (_SWCGeneration *)objc_claimAutoreleasedReturnValue(-[_SWCGeneration generationByIncrementingSelf](self->_settingsGeneration, "generationByIncrementingSelf"));
  settingsGeneration = self->_settingsGeneration;
  self->_settingsGeneration = v7;

  +[_SWCServiceSettings postChangeNotificationForServiceSpecifier:](_SWCServiceSettings, "postChangeNotificationForServiceSpecifier:", a4);
  -[SWCDatabase scheduleNextSave](self, "scheduleNextSave");
}

- (void)removeSettingsForKeys:(id)a3 serviceType:(id)a4
{
  id v7;
  NSMutableDictionary *settings;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  _SWCGeneration *v15;
  _SWCGeneration *settingsGeneration;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  id v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v7 = objc_alloc_init((Class)NSMutableArray);
  settings = self->_settings;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100010B64;
  v29[3] = &unk_100030D08;
  v29[4] = a4;
  v9 = v7;
  v30 = v9;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](settings, "enumerateKeysAndObjectsUsingBlock:", v29);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allObjects"));
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v26;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v11);
        -[SWCDatabase _removeSettingsForKeysNoSave:serviceSpecifier:](self, "_removeSettingsForKeysNoSave:serviceSpecifier:", v10, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v14));
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    }
    while (v12);
  }

  v15 = (_SWCGeneration *)objc_claimAutoreleasedReturnValue(-[_SWCGeneration generationByIncrementingSelf](self->_settingsGeneration, "generationByIncrementingSelf"));
  settingsGeneration = self->_settingsGeneration;
  self->_settingsGeneration = v15;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v17 = v11;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v17);
        +[_SWCServiceSettings postChangeNotificationForServiceSpecifier:](_SWCServiceSettings, "postChangeNotificationForServiceSpecifier:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v20), (_QWORD)v21);
        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v18);
  }

  -[SWCDatabase scheduleNextSave](self, "scheduleNextSave");
}

- (void)removeSettingsForKeys:(id)a3 serviceSpecifier:(id)a4
{
  void *v6;
  _SWCGeneration *v7;
  _SWCGeneration *settingsGeneration;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allObjects"));
  -[SWCDatabase _removeSettingsForKeysNoSave:serviceSpecifier:](self, "_removeSettingsForKeysNoSave:serviceSpecifier:", v6, a4);

  v7 = (_SWCGeneration *)objc_claimAutoreleasedReturnValue(-[_SWCGeneration generationByIncrementingSelf](self->_settingsGeneration, "generationByIncrementingSelf"));
  settingsGeneration = self->_settingsGeneration;
  self->_settingsGeneration = v7;

  +[_SWCServiceSettings postChangeNotificationForServiceSpecifier:](_SWCServiceSettings, "postChangeNotificationForServiceSpecifier:", a4);
  -[SWCDatabase scheduleNextSave](self, "scheduleNextSave");
}

- (void)enumerateSettingsDictionariesWithBlock:(id)a3
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_settings, "enumerateKeysAndObjectsUsingBlock:", a3);
}

- (void)cleanOldSettings
{
  void *v3;
  id v4;
  NSMutableDictionary *settings;
  void *v6;
  _SWCGeneration *v7;
  _SWCGeneration *settingsGeneration;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[5];
  id v18;
  _BYTE v19[128];

  v3 = objc_autoreleasePoolPush();
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100010E80;
  v17[3] = &unk_100030D08;
  v17[4] = self;
  v4 = objc_alloc_init((Class)NSMutableSet);
  v18 = v4;
  -[SWCDatabase enumerateSettingsDictionariesWithBlock:](self, "enumerateSettingsDictionariesWithBlock:", v17);
  if (objc_msgSend(v4, "count"))
  {
    settings = self->_settings;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
    -[NSMutableDictionary removeObjectsForKeys:](settings, "removeObjectsForKeys:", v6);

    v7 = (_SWCGeneration *)objc_claimAutoreleasedReturnValue(-[_SWCGeneration generationByIncrementingSelf](self->_settingsGeneration, "generationByIncrementingSelf"));
    settingsGeneration = self->_settingsGeneration;
    self->_settingsGeneration = v7;

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v9);
          +[_SWCServiceSettings postChangeNotificationForServiceSpecifier:](_SWCServiceSettings, "postChangeNotificationForServiceSpecifier:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), (_QWORD)v13);
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      }
      while (v10);
    }

    -[SWCDatabase scheduleNextSave](self, "scheduleNextSave");
  }

  objc_autoreleasePoolPop(v3);
}

- (BOOL)saveReturningError:(id *)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;

  v5 = objc_autoreleasePoolPush();
  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v9 = (void *)os_transaction_create("com.apple.swc.db.save");
    if (qword_100037250 != -1)
      dispatch_once(&qword_100037250, &stru_100030D78);
    v10 = (id)qword_100037248;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = -[NSMutableOrderedSet count](self->_entries, "count");
      *(_DWORD *)buf = 134217984;
      v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Saving SWC database with %llu entries...", buf, 0xCu);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase _storageForArchiving](self, "_storageForArchiving"));
    v20 = 0;
    v13 = objc_msgSend((id)objc_opt_class(self), "_archivedDataFromStorage:error:", v12, &v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = v20;
    v7 = v15;
    if (v14)
    {
      v19 = v15;
      v8 = -[SWCDatabase _updateStorageItemWithData:error:](self, "_updateStorageItemWithData:error:", v14, &v19);
      v16 = v19;

      v7 = v16;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    if (qword_100037250 != -1)
      dispatch_once(&qword_100037250, &stru_100030D78);
    v6 = qword_100037248;
    if (os_log_type_enabled((os_log_t)qword_100037248, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Non-shared instance of SWCDatabase cannot save--ignoring call.", buf, 2u);
    }
    v7 = 0;
    v8 = 1;
  }
  objc_autoreleasePoolPop(v5);
  if (!v8)
  {
    if (qword_100037250 != -1)
      dispatch_once(&qword_100037250, &stru_100030D78);
    v17 = qword_100037248;
    if (os_log_type_enabled((os_log_t)qword_100037248, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to save SWC database: %@", buf, 0xCu);
      if (!a3)
        goto LABEL_21;
      goto LABEL_20;
    }
    if (a3)
LABEL_20:
      *a3 = objc_retainAutorelease(v7);
  }
LABEL_21:

  return v8;
}

- (_SWCGeneration)settingsGeneration
{
  return (_SWCGeneration *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)launchServicesDatabaseGeneration
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLaunchServicesDatabaseGeneration:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSData)enterpriseState
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEnterpriseState:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enterpriseState, 0);
  objc_storeStrong((id *)&self->_launchServicesDatabaseGeneration, 0);
  objc_storeStrong((id *)&self->_settingsGeneration, 0);
  objc_storeStrong((id *)&self->_domainCache, 0);
  objc_storeStrong((id *)&self->_saveTimer, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

- (id)_initShared
{
  SWCDatabase *v2;
  void *v3;
  _SWCGeneration *v4;
  _SWCGeneration *settingsGeneration;
  SWCDomainCache *v6;
  SWCDomainCache *domainCache;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *settings;
  void *v17;
  NSMutableOrderedSet *v18;
  NSMutableOrderedSet *entries;
  void *v20;
  NSNumber *v21;
  NSNumber *launchServicesDatabaseGeneration;
  void *v23;
  NSData *v24;
  NSData *enterpriseState;
  NSObject *v26;
  id v27;
  NSMutableOrderedSet *v28;
  NSMutableOrderedSet *v29;
  NSObject *v30;
  NSMutableOrderedSet *v31;
  NSMutableOrderedSet *v32;
  NSMutableDictionary *v33;
  NSMutableDictionary *v34;
  id v36;
  id v37;
  objc_super v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  uint64_t v42;

  v38.receiver = self;
  v38.super_class = (Class)SWCDatabase;
  v2 = -[SWCDatabase init](&v38, "init");
  if (v2)
  {
    v3 = objc_autoreleasePoolPush();
    *((_BYTE *)v2 + 40) |= 1u;
    v4 = (_SWCGeneration *)objc_alloc_init((Class)_SWCGeneration);
    settingsGeneration = v2->_settingsGeneration;
    v2->_settingsGeneration = v4;

    v6 = objc_alloc_init(SWCDomainCache);
    domainCache = v2->_domainCache;
    v2->_domainCache = v6;

    v37 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase _dataFromStorageReturningError:](v2, "_dataFromStorageReturningError:", &v37));
    v9 = v37;
    v10 = v9;
    if (v8)
    {
      v36 = v9;
      v11 = objc_msgSend((id)objc_opt_class(v2), "_storageFromArchivedData:error:", v8, &v36);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = v36;

      if (v12)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "settings"));
        v15 = (NSMutableDictionary *)objc_msgSend(v14, "mutableCopy");
        settings = v2->_settings;
        v2->_settings = v15;

        if (objc_msgSend(v12, "databaseVersion") == (id)9)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "entries"));
          v18 = (NSMutableOrderedSet *)objc_msgSend(v17, "mutableCopy");
          entries = v2->_entries;
          v2->_entries = v18;

          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "launchServicesDatabaseGeneration"));
          v21 = (NSNumber *)objc_msgSend(v20, "copy");
          launchServicesDatabaseGeneration = v2->_launchServicesDatabaseGeneration;
          v2->_launchServicesDatabaseGeneration = v21;

          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "enterpriseState"));
          v24 = (NSData *)objc_msgSend(v23, "copy");
          enterpriseState = v2->_enterpriseState;
          v2->_enterpriseState = v24;

          -[SWCDomainCache updateCachedDomainsForEntries:](v2->_domainCache, "updateCachedDomainsForEntries:", v2->_entries);
        }
        else
        {
          if (qword_100037250 != -1)
            dispatch_once(&qword_100037250, &stru_100030D78);
          v26 = (id)qword_100037248;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = objc_msgSend(v12, "databaseVersion");
            *(_DWORD *)buf = 134218240;
            v40 = v27;
            v41 = 2048;
            v42 = 9;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "SWC database version did not match (had %llu, wanted %llu). Keeping settings and regenerating entries.", buf, 0x16u);
          }

          v28 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
          v29 = v2->_entries;
          v2->_entries = v28;

        }
      }

    }
    else
    {
      v13 = v9;
    }

    if (!v2->_entries || !v2->_settings)
    {
      if (qword_100037250 != -1)
        dispatch_once(&qword_100037250, &stru_100030D78);
      v30 = qword_100037248;
      if (os_log_type_enabled((os_log_t)qword_100037248, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to get SWC database, rebuilding: %@", buf, 0xCu);
      }
      v31 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
      v32 = v2->_entries;
      v2->_entries = v31;

      v33 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v34 = v2->_settings;
      v2->_settings = v33;

    }
    objc_autoreleasePoolPop(v3);
  }
  return v2;
}

- (void)_removeSettingsForKeysNoSave:(id)a3 serviceSpecifier:(id)a4
{
  NSMutableDictionary *settings;
  void *v8;
  id v9;
  id v10;

  settings = self->_settings;
  if (a3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](settings, "objectForKeyedSubscript:", a4));
    v10 = objc_msgSend(v8, "mutableCopy");

    if (v10)
    {
      objc_msgSend(v10, "removeObjectsForKeys:", a3);
      if (objc_msgSend(v10, "count"))
      {
        v9 = objc_msgSend(v10, "copy");
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_settings, "setObject:forKeyedSubscript:", v9, a4);

      }
      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_settings, "setObject:forKeyedSubscript:", 0, a4);
      }
    }

  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](settings, "setObject:forKeyedSubscript:", 0, a4);
  }
}

- (id)_storageForArchiving
{
  SWCDatabaseStorage *v4;
  void *v6;

  v4 = objc_alloc_init(SWCDatabaseStorage);
  if (!v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SWCDatabase.mm"), 806, CFSTR("Failed to allocate storage object"));

  }
  -[SWCDatabaseStorage setDatabaseVersion:](v4, "setDatabaseVersion:", 9);
  -[SWCDatabaseStorage setEntries:](v4, "setEntries:", self->_entries);
  -[SWCDatabaseStorage setSettings:](v4, "setSettings:", self->_settings);
  -[SWCDatabaseStorage setLaunchServicesDatabaseGeneration:](v4, "setLaunchServicesDatabaseGeneration:", self->_launchServicesDatabaseGeneration);
  -[SWCDatabaseStorage setEnterpriseState:](v4, "setEnterpriseState:", self->_enterpriseState);
  return v4;
}

+ (id)_storageFromArchivedData:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v11;

  v6 = objc_autoreleasePoolPush();
  v11 = 0;
  v7 = +[NSKeyedUnarchiver swc_unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "swc_unarchivedObjectOfClass:fromData:error:", objc_opt_class(SWCDatabaseStorage), a3, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v11;
  objc_autoreleasePoolPop(v6);
  if (a4 && !v8)
    *a4 = objc_retainAutorelease(v9);

  return v8;
}

+ (id)_archivedDataFromStorage:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  id v10;

  v6 = objc_autoreleasePoolPush();
  v10 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v10));
  v8 = v10;
  objc_autoreleasePoolPop(v6);
  if (a4 && !v7)
    *a4 = objc_retainAutorelease(v8);

  return v7;
}

- (void)_scheduleSave
{
  NSObject *v2;
  id v4;
  _QWORD v5[4];
  id v6;
  id location;
  uint8_t buf[8];
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v9 = 0;
    *(_QWORD *)buf = 0x402E000000000000;
    v10 = 0x401E000000000000;
    v4 = objc_msgSend((id)objc_opt_class(self), "queue");
    v11 = (id)objc_claimAutoreleasedReturnValue(v4);
    v12 = (id)os_transaction_create("com.apple.swc.db.schedulesave");
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100012454;
    v5[3] = &unk_100030D58;
    objc_copyWeak(&v6, &location);
    sub_10001E064((dispatch_object_t *)&self->_saveTimer, (uint64_t)buf, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);

  }
  else
  {
    if (qword_100037250 != -1)
      dispatch_once(&qword_100037250, &stru_100030D78);
    v2 = qword_100037248;
    if (os_log_type_enabled((os_log_t)qword_100037248, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Non-shared instance of SWCDatabase cannot save--ignoring scheduling call.", buf, 2u);
    }
  }
}

- (void)_reorderAppLinks:(id)a3 domain:(id)a4
{
  id v6;
  id v7;
  id v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  _BYTE v26[128];

  v6 = objc_alloc_init((Class)NSMutableOrderedSet);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = a3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v8)
  {
    v10 = *(_QWORD *)v21;
    v11 = _SWCServiceTypeAppLinks;
    *(_QWORD *)&v9 = 138412290;
    v19 = v9;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "serviceType", v19, (_QWORD)v20));
        v15 = objc_msgSend(v14, "isEqual:", v11);

        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase entry:](self, "entry:", v13));
          if (v16)
          {
            if (qword_100037250 != -1)
              dispatch_once(&qword_100037250, &stru_100030D78);
            v17 = qword_100037248;
            if (os_log_type_enabled((os_log_t)qword_100037248, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v19;
              v25 = v16;
              _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Removing to reorder %@", buf, 0xCu);
            }
            objc_msgSend(v6, "addObject:", v16);
          }

        }
        v12 = (char *)v12 + 1;
      }
      while (v8 != v12);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v8);
  }

  -[SWCDatabase removeEntries:](self, "removeEntries:", v6);
  -[SWCDatabase addEntries:](self, "addEntries:", v6);
  if (objc_msgSend(v6, "count"))
  {
    if (qword_100037250 != -1)
      dispatch_once(&qword_100037250, &stru_100030D78);
    v18 = qword_100037248;
    if (os_log_type_enabled((os_log_t)qword_100037248, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Reordered %@", buf, 0xCu);
    }
  }

}

- (id)_dataURLReturningError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](_SWCPrefs, "sharedPrefs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerURLReturningError:", a3));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("swc.db"), 0));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_dataFromStorageReturningError:(id *)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase _dataURLReturningError:](self, "_dataURLReturningError:"));
  if (v4)
    v5 = objc_msgSend(objc_alloc((Class)NSData), "initWithContentsOfURL:options:error:", v4, 1, a3);
  else
    v5 = 0;

  return v5;
}

- (BOOL)_updateStorageItemWithData:(id)a3 error:(id *)a4
{
  void *v6;
  unsigned __int8 v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase _dataURLReturningError:](self, "_dataURLReturningError:", a4));
  if (v6)
    v7 = objc_msgSend(a3, "writeToURL:options:error:", v6, 268435457, a4);
  else
    v7 = 0;

  return v7;
}

- (BOOL)_deleteStorageItemReturningError:(id *)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase _dataURLReturningError:](self, "_dataURLReturningError:"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v6 = objc_msgSend(v5, "removeItemAtURL:error:", v4, a3);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
