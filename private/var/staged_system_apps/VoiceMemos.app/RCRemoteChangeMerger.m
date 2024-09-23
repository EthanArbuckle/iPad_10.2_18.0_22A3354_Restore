@implementation RCRemoteChangeMerger

- (RCRemoteChangeMerger)initWithStores:(id)a3 viewContext:(id)a4 transactionAuthorToIgnore:(id)a5
{
  id v8;
  id v9;
  id v10;
  RCRemoteChangeMerger *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *storeMergers;
  uint64_t v14;
  NSHashTable *backgroundContexts;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  RCStoreChangeMerger *v24;
  NSMutableDictionary *v25;
  void *v26;
  void *v27;
  id v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  void *v36;
  _BYTE v37[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v35.receiver = self;
  v35.super_class = (Class)RCRemoteChangeMerger;
  v11 = -[RCRemoteChangeMerger init](&v35, "init");
  if (v11)
  {
    v12 = objc_opt_new(NSMutableDictionary);
    storeMergers = v11->storeMergers;
    v11->storeMergers = v12;

    objc_storeStrong((id *)&v11->_viewContext, a4);
    v14 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    backgroundContexts = v11->_backgroundContexts;
    v11->_backgroundContexts = (NSHashTable *)v14;

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = v8;
    obj = v8;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "persistentStoreCoordinator", v29));
          v36 = v20;
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "currentPersistentHistoryTokenFromStores:", v22));

          v24 = -[RCStoreChangeMerger initWithPersistentStore:transactionAuthorToIgnore:startingToken:viewContext:]([RCStoreChangeMerger alloc], "initWithPersistentStore:transactionAuthorToIgnore:startingToken:viewContext:", v20, v10, v23, v9);
          -[RCStoreChangeMerger setDelegate:](v24, "setDelegate:", v11);
          v25 = v11->storeMergers;
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v24, v26);

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v17);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v27, "addObserver:selector:name:object:", v11, "_handleRemoteChangeNotification:", NSPersistentStoreRemoteChangeNotification, 0);

    v8 = v29;
  }

  return v11;
}

- (void)addContextToMergeChangesInto:(id)a3
{
  id v4;
  NSManagedObjectContext *viewContext;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  viewContext = self->_viewContext;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004B238;
  v7[3] = &unk_1001AB6E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSManagedObjectContext performBlockAndWait:](viewContext, "performBlockAndWait:", v7);

}

- (void)_handleRemoteChangeNotification:(id)a3
{
  void *v4;
  NSMutableDictionary *storeMergers;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  storeMergers = self->storeMergers;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", NSStoreUUIDKey));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](storeMergers, "objectForKeyedSubscript:", v6));

  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", NSPersistentHistoryTokenKey));
  v9 = (void *)v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10004B344;
    v11[3] = &unk_1001AB6E8;
    v12 = v7;
    v13 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

  }
}

- (id)backgroundContexts
{
  return self->_backgroundContexts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewContext, 0);
  objc_storeStrong((id *)&self->_backgroundContexts, 0);
  objc_storeStrong((id *)&self->storeMergers, 0);
}

@end
