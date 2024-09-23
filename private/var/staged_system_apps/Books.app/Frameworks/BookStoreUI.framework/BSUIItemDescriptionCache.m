@implementation BSUIItemDescriptionCache

+ (BSUIItemDescriptionCache)sharedInstance
{
  if (qword_32C070 != -1)
    dispatch_once(&qword_32C070, &stru_2E5228);
  return (BSUIItemDescriptionCache *)(id)qword_32C068;
}

- (BSUIItemDescriptionCache)initWithMaxItemCount:(unint64_t)a3 subfolder:(id)a4
{
  id v7;
  BSUIItemDescriptionCache *v8;
  NSMutableArray *v9;
  NSMutableArray *identifiersQueuedForNetwork;
  NSMutableArray *v11;
  NSMutableArray *identifiersQueuedForCache;
  uint64_t v13;
  NSMapTable *futuresByIdentifier;
  id v15;
  BSUIItemDescriptionCache *v16;
  BUCoalescingCallBlock *v17;
  BUCoalescingCallBlock *coalescingFetch;
  NSManagedObjectContext *v19;
  NSManagedObjectContext *moc;
  NSManagedObjectContext *v21;
  void *v22;
  _QWORD v24[4];
  BSUIItemDescriptionCache *v25;
  objc_super v26;

  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)BSUIItemDescriptionCache;
  v8 = -[BSUIItemDescriptionCache init](&v26, "init");
  if (v8)
  {
    v9 = objc_opt_new(NSMutableArray);
    identifiersQueuedForNetwork = v8->_identifiersQueuedForNetwork;
    v8->_identifiersQueuedForNetwork = v9;

    v11 = objc_opt_new(NSMutableArray);
    identifiersQueuedForCache = v8->_identifiersQueuedForCache;
    v8->_identifiersQueuedForCache = v11;

    v13 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
    futuresByIdentifier = v8->_futuresByIdentifier;
    v8->_futuresByIdentifier = (NSMapTable *)v13;

    v15 = objc_alloc((Class)BUCoalescingCallBlock);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_2D4E8;
    v24[3] = &unk_2E5250;
    v16 = v8;
    v25 = v16;
    v17 = (BUCoalescingCallBlock *)objc_msgSend(v15, "initWithNotifyBlock:blockDescription:", v24, CFSTR("BSUIItemDescriptionCache"));
    coalescingFetch = v16->_coalescingFetch;
    v16->_coalescingFetch = v17;

    v16->_maxItemCount = a3;
    objc_storeStrong((id *)&v16->_testSubfolder, a4);
    v19 = (NSManagedObjectContext *)objc_msgSend(objc_alloc((Class)NSManagedObjectContext), "initWithConcurrencyType:", 1);
    moc = v16->_moc;
    v16->_moc = v19;

    v21 = v16->_moc;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIItemDescriptionCache _persistentStoreCoordinator](v16, "_persistentStoreCoordinator"));
    -[NSManagedObjectContext setPersistentStoreCoordinator:](v21, "setPersistentStoreCoordinator:", v22);

    -[NSManagedObjectContext setUndoManager:](v16->_moc, "setUndoManager:", 0);
  }

  return v8;
}

- (void)updateWithProfileDictionaries:(id)a3 expirationDate:(id)a4 requestedIdentifiers:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v7 = a3;
  v20 = a4;
  v8 = a5;
  v9 = objc_alloc_init((Class)NSMutableDictionary);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v7;
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
        v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v14);
        v16 = objc_alloc((Class)AEUserPublishingProductProfile);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v15));
        v18 = objc_msgSend(v16, "initWithProfileDictionary:", v17);

        if (v18)
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, v15);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  -[BSUIItemDescriptionCache updateWithProfiles:expirationDate:requestedIdentifiers:](self, "updateWithProfiles:expirationDate:requestedIdentifiers:", v9, v20, v8);
}

- (void)updateWithProfiles:(id)a3 expirationDate:(id)a4 requestedIdentifiers:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_2D784;
  v15[3] = &unk_2E52C8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = (id)objc_claimAutoreleasedReturnValue(-[BSUIItemDescriptionCache moc](self, "moc"));
  v19 = v10;
  v11 = v10;
  v12 = v18;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v12, "performBlockAndWait:", v15);

}

- (void)_flush
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BSUIItemDescriptionCache moc](self, "moc"));
  objc_msgSend(v2, "performBlockAndWait:", &stru_2E52E8);

}

- (void)_fetchItemDescriptionFromCacheForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIItemDescriptionCache moc](self, "moc"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIItemDescriptionCache moc](self, "moc"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_2DAE4;
  v13[3] = &unk_2E5310;
  v13[4] = self;
  v14 = v6;
  v15 = v8;
  v16 = v7;
  v10 = v7;
  v11 = v8;
  v12 = v6;
  objc_msgSend(v9, "performBlock:", v13);

}

- (id)sq_fetchCachedItemDescriptionsForIdentifiers:(id)a3 moc:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSString *v16;
  char *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  NSString *v28;
  char *v29;
  void *v30;
  void *v31;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  uint8_t v39[128];
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BSUICachedItemDescription")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K in %@ AND %K != NULL"), CFSTR("storeID"), v6, CFSTR("fileSize")));
  objc_msgSend(v8, "setPredicate:", v9);

  v38 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v8, &v38));
  v11 = (char *)v38;
  if (v11)
  {
    v12 = BCIMLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v41 = "-[BSUIItemDescriptionCache sq_fetchCachedItemDescriptionsForIdentifiers:moc:]";
      v42 = 2080;
      v43 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookStoreUI/BookStoreUI/Cache/BSUIItemDescriptionCache.m";
      v44 = 1024;
      v45 = 161;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    v14 = BCIMLog();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = NSStringFromSelector(a2);
      v17 = (char *)objc_claimAutoreleasedReturnValue(v16);
      *(_DWORD *)buf = 138412546;
      v41 = v17;
      v42 = 2112;
      v43 = v11;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "@\"%@: %@\", buf, 0x16u);

    }
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v19 = v10;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v35;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v35 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v23), "setLastAccessDate:", v18);
        v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v21);
  }

  if (objc_msgSend(v19, "count"))
  {

    v33 = 0;
    objc_msgSend(v7, "save:", &v33);
    v11 = (char *)v33;
    if (v11)
    {
      v24 = BCIMLog();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v41 = "-[BSUIItemDescriptionCache sq_fetchCachedItemDescriptionsForIdentifiers:moc:]";
        v42 = 2080;
        v43 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookStoreUI/BookStoreUI/Cache/BSUIItemDescriptionCache.m";
        v44 = 1024;
        v45 = 179;
        _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
      }

      v26 = BCIMLog();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v28 = NSStringFromSelector(a2);
        v29 = (char *)objc_claimAutoreleasedReturnValue(v28);
        *(_DWORD *)buf = 138412546;
        v41 = v29;
        v42 = 2112;
        v43 = v11;
        _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "@\"%@: %@\", buf, 0x16u);

      }
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "valueForKey:", CFSTR("storeID")));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:](NSDictionary, "dictionaryWithObjects:forKeys:", v19, v30));

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (id)sq_fetchItemDescriptionsForIdentifiers:(id)a3 moc:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIItemDescriptionCache sq_fetchCachedItemDescriptionsForIdentifiers:moc:](self, "sq_fetchCachedItemDescriptionsForIdentifiers:moc:", v6, v7));
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_2E100;
  v16 = sub_2E110;
  v17 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_2E118;
  v11[3] = &unk_2E5338;
  v11[4] = self;
  v11[5] = &v12;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v11);
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (id)sq_queueCacheRequestForIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_futuresByIdentifier, "objectForKey:", v4));
    if (!v5)
    {
      v5 = objc_alloc_init((Class)BCMutableFutureValue);
      -[NSMapTable setObject:forKey:](self->_futuresByIdentifier, "setObject:forKey:", v5, v4);
    }
    if ((-[NSMutableArray containsObject:](self->_identifiersQueuedForCache, "containsObject:", v4) & 1) == 0)
      -[NSMutableArray addObject:](self->_identifiersQueuedForCache, "addObject:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)sq_queueNetworkRequestForIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_futuresByIdentifier, "objectForKey:", v4));
    if (!v5)
    {
      v5 = objc_alloc_init((Class)BCMutableFutureValue);
      -[NSMapTable setObject:forKey:](self->_futuresByIdentifier, "setObject:forKey:", v5, v4);
    }
    if ((-[NSMutableArray containsObject:](self->_identifiersQueuedForNetwork, "containsObject:", v4) & 1) == 0)
      -[NSMutableArray addObject:](self->_identifiersQueuedForNetwork, "addObject:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_fetchWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_2E384;
  v7[3] = &unk_2E4B20;
  v7[4] = self;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BSUIItemDescriptionCache moc](self, "moc"));
  v9 = v4;
  v5 = v4;
  v6 = v8;
  objc_msgSend(v6, "performBlock:", v7);

}

- (id)itemDescriptionsFromIdentifiers:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void **v12;
  uint64_t v13;
  char *(*v14)(uint64_t);
  void *v15;
  id v16;
  BSUIItemDescriptionCache *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v4, "count"));
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIItemDescriptionCache moc](self, "moc"));
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_2EA20;
  v15 = &unk_2E53A8;
  v7 = v4;
  v16 = v7;
  v17 = self;
  v8 = v5;
  v18 = v8;
  v19 = &v20;
  objc_msgSend(v6, "performBlockAndWait:", &v12);

  if (*((_BYTE *)v21 + 24))
    -[BUCoalescingCallBlock signalWithCompletion:](self->_coalescingFetch, "signalWithCompletion:", &stru_2E53C8, v12, v13, v14, v15, v16, v17);
  v9 = v18;
  v10 = v8;

  _Block_object_dispose(&v20, 8);
  return v10;
}

- (void)sampleDownloadURLForAssetID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  id v21;

  v5 = a3;
  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_2E100;
  v19 = sub_2E110;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BSUIItemDescriptionCache sharedInstance](BSUIItemDescriptionCache, "sharedInstance"));
  v21 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemDescriptionsFromIdentifiers:", v8));
  v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v5));

  v10 = (void *)v16[5];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_2ED2C;
  v12[3] = &unk_2E53F0;
  v11 = v6;
  v13 = v11;
  v14 = &v15;
  objc_msgSend(v10, "get:", v12);

  _Block_object_dispose(&v15, 8);
}

+ (id)_persistentStoreDirectoryWithSubfolder:(id)a3
{
  id v4;
  NSArray *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  v5 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));

  v8 = (objc_class *)objc_opt_class(a1);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", v10));

  if (objc_msgSend(v4, "length"))
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingPathComponent:", v4));

    v11 = (void *)v12;
  }

  return v11;
}

+ (id)_persistentStoreFileName
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.sqlite"), CFSTR("v20160217"));
}

+ (void)_recreatePersistentStoreDirectoryWithSubfolder:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_persistentStoreDirectoryWithSubfolder:", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v6, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "relativePath"));
  objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, 0);

}

- (id)_managedObjectModel
{
  NSManagedObjectModel *model;
  NSBundle *v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  NSManagedObjectModel *v11;
  NSManagedObjectModel *v12;

  model = self->_model;
  if (!model)
  {
    v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (objc_class *)objc_opt_class(self);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathForResource:ofType:", v8, CFSTR("momd")));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v9, 1));
    v11 = (NSManagedObjectModel *)objc_msgSend(objc_alloc((Class)NSManagedObjectModel), "initWithContentsOfURL:", v10);
    v12 = self->_model;
    self->_model = v11;

    model = self->_model;
  }
  return model;
}

- (id)_persistentStoreCoordinator
{
  NSPersistentStoreCoordinator *psc;
  id v4;
  void *v5;
  NSPersistentStoreCoordinator *v6;
  NSPersistentStoreCoordinator *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSPersistentStoreCoordinator *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSPersistentStoreCoordinator *v24;
  id v25;
  id v27;
  id v28;
  _QWORD v29[2];
  _QWORD v30[2];

  psc = self->_psc;
  if (!psc)
  {
    v4 = objc_alloc((Class)NSPersistentStoreCoordinator);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIItemDescriptionCache _managedObjectModel](self, "_managedObjectModel"));
    v6 = (NSPersistentStoreCoordinator *)objc_msgSend(v4, "initWithManagedObjectModel:", v5);
    v7 = self->_psc;
    self->_psc = v6;

    v29[0] = NSInferMappingModelAutomaticallyOption;
    v29[1] = NSMigratePersistentStoresAutomaticallyOption;
    v30[0] = &__kCFBooleanTrue;
    v30[1] = &__kCFBooleanTrue;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2));
    v9 = (void *)objc_opt_class(self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIItemDescriptionCache testSubfolder](self, "testSubfolder"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_persistentStoreDirectoryWithSubfolder:", v10));

    v12 = objc_msgSend((id)objc_opt_class(self), "_persistentStoreFileName");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_opt_class(self);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIItemDescriptionCache testSubfolder](self, "testSubfolder"));
    objc_msgSend(v14, "_recreatePersistentStoreDirectoryWithSubfolder:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingPathComponent:", v13));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v16, 0));
    v18 = self->_psc;
    v28 = 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v18, "addPersistentStoreWithType:configuration:URL:options:error:", NSSQLiteStoreType, 0, v17, v8, &v28));
    v20 = v28;
    if (!v19)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      objc_msgSend(v21, "removeItemAtPath:error:", v11, 0);

      v22 = (void *)objc_opt_class(self);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIItemDescriptionCache testSubfolder](self, "testSubfolder"));
      objc_msgSend(v22, "_recreatePersistentStoreDirectoryWithSubfolder:", v23);

      v24 = self->_psc;
      v27 = v20;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v24, "addPersistentStoreWithType:configuration:URL:options:error:", NSSQLiteStoreType, 0, v17, v8, &v27));
      v25 = v27;

      v20 = v25;
    }

    psc = self->_psc;
  }
  return psc;
}

- (void)q_populateCachedDescription:(id)a3 productProfile:(id)a4 expirationDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "adamId"));
  objc_msgSend(v7, "setStoreID:", v10);

  v29 = 1.5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "artworkURLTemplateAspect:", &v29));
  objc_msgSend(v7, "setArtworkURLTemplate:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v29));
  objc_msgSend(v7, "setArtworkAspect:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "standardNotes"));
  if (v13)
  {
    objc_msgSend(v7, "setRawNotes:", v13);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "standardDescription"));
    objc_msgSend(v7, "setRawNotes:", v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
  objc_msgSend(v7, "setTitle:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "author"));
  objc_msgSend(v7, "setAuthor:", v16);

  objc_msgSend(v8, "averageRating");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v7, "setAverageRating:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "ratingCount")));
  objc_msgSend(v7, "setRatingCount:", v18);

  objc_msgSend(v7, "setExpirationDate:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v7, "setLastAccessDate:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "productURL"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "absoluteString"));
  objc_msgSend(v7, "setProductURL:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "priceString"));
  objc_msgSend(v7, "setPriceString:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionTextWithType:", 1));
  objc_msgSend(v7, "setActionString:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "buyParameters"));
  objc_msgSend(v7, "setBuyParameters:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bookSampleDownloadURL"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "absoluteString"));
  objc_msgSend(v7, "setSampleDownloadURL:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "kind"));
  objc_msgSend(v7, "setKind:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v8, "fileSize")));
  objc_msgSend(v7, "setFileSize:", v28);

}

- (id)q_updateDatabaseWithNewProfiles:(id)a3 expirationDate:(id)a4 moc:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  BSUICachedItemDescription *v25;
  void *v26;
  BSUICachedItemDescription *v27;
  char *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  NSString *v33;
  char *v34;
  void *v37;
  id v38;
  id v39;
  NSMutableDictionary *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;
  _BYTE v53[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v41 = objc_opt_new(NSMutableDictionary);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v11 = v8;
  objc_msgSend(v10, "timeIntervalSinceDate:", v11);
  v13 = v11;
  if (fabs(v12) < 30.0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 86400.0));

  }
  if (!v13 || objc_msgSend(v13, "compare:", v10) == (char *)&dword_0 + 1)
  {
    v14 = v13;
    v37 = v10;
    v38 = v11;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v39 = v7;
    v15 = v7;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v44;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v44 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v19);
          v21 = objc_opt_class(AEUserPublishingProductProfile);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v20));
          v23 = BUDynamicCast(v21, v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

          v25 = [BSUICachedItemDescription alloc];
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", CFSTR("BSUICachedItemDescription"), v9));
          v27 = -[BSUICachedItemDescription initWithEntity:insertIntoManagedObjectContext:](v25, "initWithEntity:insertIntoManagedObjectContext:", v26, v9);

          -[BSUIItemDescriptionCache q_populateCachedDescription:productProfile:expirationDate:](self, "q_populateCachedDescription:productProfile:expirationDate:", v27, v24, v14);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v41, "setObject:forKeyedSubscript:", v27, v20);

          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      }
      while (v17);
    }

    v11 = v38;
    v7 = v39;
    v10 = v37;
    v13 = v14;
  }
  if (-[NSMutableDictionary count](v41, "count"))
  {
    v42 = 0;
    objc_msgSend(v9, "save:", &v42);
    v28 = (char *)v42;
    if (v28)
    {
      v29 = BCIMLog();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v48 = "-[BSUIItemDescriptionCache q_updateDatabaseWithNewProfiles:expirationDate:moc:]";
        v49 = 2080;
        v50 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookStoreUI/BookStoreUI/Cache/BSUIItemDescriptionCache.m";
        v51 = 1024;
        v52 = 481;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
      }

      v31 = BCIMLog();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        v33 = NSStringFromSelector(a2);
        v34 = (char *)objc_claimAutoreleasedReturnValue(v33);
        *(_DWORD *)buf = 138412546;
        v48 = v34;
        v49 = 2112;
        v50 = v28;
        _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, "@\"%@: %@\", buf, 0x16u);

      }
    }

  }
  -[BSUIItemDescriptionCache q_evictCacheEntriesFromDatabase](self, "q_evictCacheEntriesFromDatabase");

  return v41;
}

- (BOOL)q_evictCacheEntriesFromDatabase
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSString *v13;
  char *v14;
  int v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  NSString *v29;
  char *v30;
  unint64_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  NSString *v37;
  char *v38;
  void *v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  void *v49;
  uint8_t v50[128];
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  int v56;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIItemDescriptionCache moc](self, "moc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BSUICachedItemDescription")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K < %@"), CFSTR("expirationDate"), v4));
  objc_msgSend(v5, "setPredicate:", v6);

  objc_msgSend(v5, "setReturnsObjectsAsFaults:", 1);
  v48 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v5, &v48));
  v8 = (char *)v48;
  v41 = v7;
  if (v8)
  {
    v9 = BCIMLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v52 = "-[BSUIItemDescriptionCache q_evictCacheEntriesFromDatabase]";
      v53 = 2080;
      v54 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookStoreUI/BookStoreUI/Cache/BSUIItemDescriptionCache.m";
      v55 = 1024;
      v56 = 509;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    v11 = BCIMLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = NSStringFromSelector(a2);
      v14 = (char *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 138412546;
      v52 = v14;
      v53 = 2112;
      v54 = v8;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "@\"%@: %@\", buf, 0x16u);

    }
    v15 = 0;
  }
  else
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v12 = v7;
    v16 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    v15 = v16 != 0;
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v45 != v18)
            objc_enumerationMutation(v12);
          objc_msgSend(v3, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i));
        }
        v17 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      }
      while (v17);
      v15 = 1;
    }
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BSUICachedItemDescription")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("lastAccessDate"), 0));
  v49 = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v49, 1));
  objc_msgSend(v20, "setSortDescriptors:", v22);

  objc_msgSend(v20, "setReturnsObjectsAsFaults:", 1);
  v43 = 0;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v20, &v43));
  v24 = (char *)v43;
  if (v24)
  {
    v25 = BCIMLog();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v52 = "-[BSUIItemDescriptionCache q_evictCacheEntriesFromDatabase]";
      v53 = 2080;
      v54 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookStoreUI/BookStoreUI/Cache/BSUIItemDescriptionCache.m";
      v55 = 1024;
      v56 = 529;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    v27 = BCIMLog();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = NSStringFromSelector(a2);
      v30 = (char *)objc_claimAutoreleasedReturnValue(v29);
      *(_DWORD *)buf = 138412546;
      v52 = v30;
      v53 = 2112;
      v54 = v24;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "@\"%@: %@\", buf, 0x16u);

    }
    if ((v15 & 1) == 0)
    {
      LOBYTE(v15) = 0;
      goto LABEL_33;
    }
  }
  else
  {
    v31 = -[BSUIItemDescriptionCache maxItemCount](self, "maxItemCount");
    if (v31 >= (unint64_t)objc_msgSend(v23, "count"))
    {
      if (!v15)
      {
        v24 = 0;
        goto LABEL_33;
      }
    }
    else
    {
      do
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", v31));
        objc_msgSend(v3, "deleteObject:", v32);

        ++v31;
      }
      while (v31 < (unint64_t)objc_msgSend(v23, "count"));
    }
  }

  v42 = 0;
  objc_msgSend(v3, "save:", &v42);
  v24 = (char *)v42;
  if (v24)
  {
    v33 = BCIMLog();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v52 = "-[BSUIItemDescriptionCache q_evictCacheEntriesFromDatabase]";
      v53 = 2080;
      v54 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookStoreUI/BookStoreUI/Cache/BSUIItemDescriptionCache.m";
      v55 = 1024;
      v56 = 549;
      _os_log_impl(&dword_0, v34, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    v35 = BCIMLog();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v37 = NSStringFromSelector(a2);
      v38 = (char *)objc_claimAutoreleasedReturnValue(v37);
      *(_DWORD *)buf = 138412546;
      v52 = v38;
      v53 = 2112;
      v54 = v24;
      _os_log_impl(&dword_0, v36, OS_LOG_TYPE_INFO, "@\"%@: %@\", buf, 0x16u);

    }
  }
  LOBYTE(v15) = 1;
LABEL_33:

  return v15;
}

- (id)q_itemDescriptionFromCachedItemDescription:(id)a3 moc:(id)a4
{
  id v6;
  id v7;
  BSUIItemDescription *v8;
  id v9;
  id v10;
  void *v11;
  BSUIItemDescription *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  SEL v17;

  v6 = a3;
  v7 = a4;
  v8 = [BSUIItemDescription alloc];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_3001C;
  v14[3] = &unk_2E5440;
  v15 = v7;
  v16 = v6;
  v17 = a2;
  v9 = v6;
  v10 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BCLazyValue objectAsyncProducer:](BCLazyValue, "objectAsyncProducer:", v14));
  v12 = -[BSUIItemDescription initWithCachedItemDescription:lazyNotes:](v8, "initWithCachedItemDescription:lazyNotes:", v9, v11);

  return v12;
}

- (BUCoalescingCallBlock)coalescingFetch
{
  return self->_coalescingFetch;
}

- (void)setCoalescingFetch:(id)a3
{
  objc_storeStrong((id *)&self->_coalescingFetch, a3);
}

- (NSMutableArray)identifiersQueuedForCache
{
  return self->_identifiersQueuedForCache;
}

- (void)setIdentifiersQueuedForCache:(id)a3
{
  objc_storeStrong((id *)&self->_identifiersQueuedForCache, a3);
}

- (NSMutableArray)identifiersQueuedForNetwork
{
  return self->_identifiersQueuedForNetwork;
}

- (void)setIdentifiersQueuedForNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_identifiersQueuedForNetwork, a3);
}

- (NSMapTable)futuresByIdentifier
{
  return self->_futuresByIdentifier;
}

- (void)setFuturesByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_futuresByIdentifier, a3);
}

- (unint64_t)maxItemCount
{
  return self->_maxItemCount;
}

- (void)setMaxItemCount:(unint64_t)a3
{
  self->_maxItemCount = a3;
}

- (NSManagedObjectContext)moc
{
  return self->_moc;
}

- (void)setMoc:(id)a3
{
  objc_storeStrong((id *)&self->_moc, a3);
}

- (NSString)testSubfolder
{
  return self->_testSubfolder;
}

- (void)setTestSubfolder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testSubfolder, 0);
  objc_storeStrong((id *)&self->_moc, 0);
  objc_storeStrong((id *)&self->_futuresByIdentifier, 0);
  objc_storeStrong((id *)&self->_identifiersQueuedForNetwork, 0);
  objc_storeStrong((id *)&self->_identifiersQueuedForCache, 0);
  objc_storeStrong((id *)&self->_coalescingFetch, 0);
  objc_storeStrong((id *)&self->_psc, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
