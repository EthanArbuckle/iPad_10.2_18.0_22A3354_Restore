@implementation MailPersistentStorage

- (id)sceneRestorationDictionary
{
  return -[MailPersistentStorage _objectForKey:inGroup:](self, "_objectForKey:inGroup:", CFSTR("SceneRestorationDict"), CFSTR("SceneData"));
}

- (MailPersistentStorage)initWithFilePath:(id)a3
{
  id v4;
  MailPersistentStorage *v5;
  NSOperationQueue *v6;
  NSOperationQueue *saveOperationQueue;
  NSString *v8;
  NSString *filePath;
  NSMutableDictionary *v10;
  NSMutableDictionary *groups;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MailPersistentStorage;
  v5 = -[MailPersistentStorage init](&v15, "init");
  if (v5)
  {
    v6 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    saveOperationQueue = v5->_saveOperationQueue;
    v5->_saveOperationQueue = v6;

    -[NSOperationQueue setQualityOfService:](v5->_saveOperationQueue, "setQualityOfService:", 17);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v5->_saveOperationQueue, "setMaxConcurrentOperationCount:", 1);
    v8 = (NSString *)objc_msgSend(v4, "copy");
    filePath = v5->_filePath;
    v5->_filePath = v8;

    v10 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithContentsOfFile:", v4);
    groups = v5->_groups;
    v5->_groups = v10;

    if (!v5->_groups)
    {
      v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v13 = v5->_groups;
      v5->_groups = v12;

    }
  }

  return v5;
}

- (id)_objectForKey:(id)a3 inGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const char *v11;
  int v12;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v11 = "group";
    v12 = 185;
    goto LABEL_6;
  }
  if (!v6)
  {
    v11 = "key";
    v12 = 186;
LABEL_6:
    __assert_rtn("-[MailPersistentStorage _objectForKey:inGroup:]", "MailPersistentStorage.m", v12, v11);
  }
  -[MailPersistentStorage mf_lock](self, "mf_lock");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_groups, "objectForKeyedSubscript:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v6));
  -[MailPersistentStorage mf_unlock](self, "mf_unlock");

  return v9;
}

+ (id)sharedStorage
{
  pthread_once(&stru_1005A0088, sub_100039FD4);
  return (id)qword_1005A9D98;
}

+ (id)defaultFilePath
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = MFMailDirectory(a1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("metadata.plist")));

  return v4;
}

+ (void)wipePersistentStorage
{
  void *v2;

  v2 = (void *)qword_1005A9D98;
  qword_1005A9D98 = 0;

  sub_100039FD4();
}

- (MailPersistentStorage)init
{
  id v3;
  void *v4;
  MailPersistentStorage *v5;

  v3 = objc_msgSend((id)objc_opt_class(self), "defaultFilePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[MailPersistentStorage initWithFilePath:](self, "initWithFilePath:", v4);

  return v5;
}

- (void)save
{
  void *v3;
  MailPersistentStorageSaveOperation *v4;

  -[MailPersistentStorage mf_lock](self, "mf_lock");
  v4 = -[MailPersistentStorageSaveOperation initWithDestinationPath:groupDictionary:]([MailPersistentStorageSaveOperation alloc], "initWithDestinationPath:groupDictionary:", self->_filePath, self->_groups);
  -[MailPersistentStorage mf_unlock](self, "mf_unlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailPersistentStorage saveOperationQueue](self, "saveOperationQueue"));
  objc_msgSend(v3, "addOperation:", v4);

}

- (void)_setObject:(id)a3 forKey:(id)a4 inGroup:(id)a5
{
  id v8;
  __CFString *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (__CFString *)a5;
  if (!v8)
    __assert_rtn("-[MailPersistentStorage _setObject:forKey:inGroup:]", "MailPersistentStorage.m", 165, "key");
  -[MailPersistentStorage mf_lock](self, "mf_lock");
  if (!v9)
    v9 = CFSTR("GenericData");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_groups, "objectForKey:", v9));
  if (!v10)
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (v11)
    objc_msgSend(v10, "setObject:forKey:", v11, v8);
  else
    objc_msgSend(v10, "removeObjectForKey:", v8);
  -[NSMutableDictionary setObject:forKey:](self->_groups, "setObject:forKey:", v10, v9);
  -[MailPersistentStorage mf_unlock](self, "mf_unlock");

}

- (void)setFetchDate:(id)a3 forSource:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v6)
    -[MailPersistentStorage _setObject:forKey:inGroup:](self, "_setObject:forKey:inGroup:", v7, v6, CFSTR("FetchingData"));

}

- (id)fetchDateForSource:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailPersistentStorage _objectForKey:inGroup:](self, "_objectForKey:inGroup:", v4, CFSTR("FetchingData")));
  else
    v5 = 0;

  return v5;
}

- (void)setLastAdditionalMailboxesFetchDate:(id)a3
{
  -[MailPersistentStorage _setObject:forKey:inGroup:](self, "_setObject:forKey:inGroup:", a3, CFSTR("LastAdditionalMailboxesFetch"), CFSTR("FetchingData"));
}

- (id)lastAdditionalMailboxesFetchDate
{
  return -[MailPersistentStorage _objectForKey:inGroup:](self, "_objectForKey:inGroup:", CFSTR("LastAdditionalMailboxesFetch"), CFSTR("FetchingData"));
}

- (void)setBodyBackfillDate:(id)a3 forSource:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v6)
    -[MailPersistentStorage _setObject:forKey:inGroup:](self, "_setObject:forKey:inGroup:", v7, v6, CFSTR("BodyBackfillData"));

}

- (id)bodyBackfillDateForSource:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailPersistentStorage _objectForKey:inGroup:](self, "_objectForKey:inGroup:", v4, CFSTR("BodyBackfillData")));
  else
    v5 = 0;

  return v5;
}

- (void)touchLastLoadOlder
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[MailPersistentStorage _setObject:forKey:inGroup:](self, "_setObject:forKey:inGroup:");

}

- (void)clearLastLoadOlder
{
  -[MailPersistentStorage _setObject:forKey:inGroup:](self, "_setObject:forKey:inGroup:", 0, CFSTR("LastLoadOlder"), CFSTR("OverflowData"));
}

- (id)lastLoadOlder
{
  return -[MailPersistentStorage _objectForKey:inGroup:](self, "_objectForKey:inGroup:", CFSTR("LastLoadOlder"), CFSTR("OverflowData"));
}

- (void)searchedServer
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[MailPersistentStorage _setObject:forKey:inGroup:](self, "_setObject:forKey:inGroup:");

}

- (void)clearSearchedServer
{
  -[MailPersistentStorage _setObject:forKey:inGroup:](self, "_setObject:forKey:inGroup:", 0, CFSTR("AllSearch"), CFSTR("SearchData"));
}

- (id)searchedServerDate
{
  return -[MailPersistentStorage _objectForKey:inGroup:](self, "_objectForKey:inGroup:", CFSTR("AllSearch"), CFSTR("SearchData"));
}

- (void)setSceneRestorationDictionary:(id)a3
{
  -[MailPersistentStorage _setObject:forKey:inGroup:](self, "_setObject:forKey:inGroup:", a3, CFSTR("SceneRestorationDict"), CFSTR("SceneData"));
}

- (void)removeAllDataBelongingToAccount:(id)a3
{
  id v4;
  id v5;
  void *i;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *j;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  void *k;
  uint64_t v19;
  id v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];

  v4 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = objc_msgSend(&off_100542190, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v5)
  {
    v19 = *(_QWORD *)v31;
    do
    {
      v20 = v5;
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(&off_100542190);
        v7 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_groups, "objectForKey:", v7));
        v8 = objc_alloc_init((Class)NSMutableArray);
        v9 = objc_opt_class(NSDictionary);
        if ((objc_opt_isKindOfClass(v21, v9) & 1) != 0)
        {
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allKeys"));
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
          if (v11)
          {
            v12 = *(_QWORD *)v27;
            do
            {
              for (j = 0; j != v11; j = (char *)j + 1)
              {
                if (*(_QWORD *)v27 != v12)
                  objc_enumerationMutation(v10);
                v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j);
                if (objc_msgSend(v4, "ownsMailboxUidWithURL:", v14))
                  objc_msgSend(v8, "addObject:", v14);
              }
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
            }
            while (v11);
          }

        }
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v15 = v8;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v23;
          do
          {
            for (k = 0; k != v16; k = (char *)k + 1)
            {
              if (*(_QWORD *)v23 != v17)
                objc_enumerationMutation(v15);
              -[MailPersistentStorage _setObject:forKey:inGroup:](self, "_setObject:forKey:inGroup:", 0, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)k), v7);
            }
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
          }
          while (v16);
        }

      }
      v5 = objc_msgSend(&off_100542190, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v5);
  }
  -[MailPersistentStorage save](self, "save");

}

- (NSOperationQueue)saveOperationQueue
{
  return self->_saveOperationQueue;
}

- (void)setSaveOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_saveOperationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveOperationQueue, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end
