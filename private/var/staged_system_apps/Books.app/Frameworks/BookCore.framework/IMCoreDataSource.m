@implementation IMCoreDataSource

- (IMCoreDataSource)initWithPersistentStoreURL:(id)a3
{
  id v5;
  IMCoreDataSource *v6;
  IMCoreDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMCoreDataSource;
  v6 = -[IMCoreDataSource init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_persistentStoreURL, a3);

  return v7;
}

+ (id)persistentStoreName
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v2 = (void *)objc_opt_class(a1);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "managedObjectModelName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "persistentStoreVersion"));
  v5 = v3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("-%@"), v4));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "persistentStoreNameSeed"));
  if (objc_msgSend(v6, "length"))
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("-%@"), v6));

    v5 = (void *)v7;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "persistentStoreExtension"));
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathExtension:", v8));

    v5 = (void *)v9;
  }
  v10 = v5;

  return v10;
}

+ (id)persistentStoreVersion
{
  return &stru_296430;
}

+ (id)persistentStoreExtension
{
  return CFSTR("sqlite");
}

+ (id)persistentStoreNameSeed
{
  return &stru_296430;
}

- (void)loadCoreData
{
  -[IMCoreDataSource loadManagedObjectModel](self, "loadManagedObjectModel");
  -[IMCoreDataSource loadPersistentStoreCoordinator](self, "loadPersistentStoreCoordinator");
  -[IMCoreDataSource loadPersistentStore](self, "loadPersistentStore");
}

- (void)loadCoreDataPersistentStoreInitializedHandler:(id)a3 migrationHandler:(id)a4
{
  id v6;

  v6 = a4;
  -[IMCoreDataSource setPersistentStoreInitializedHandler:](self, "setPersistentStoreInitializedHandler:", a3);
  -[IMCoreDataSource setMigrationHandler:](self, "setMigrationHandler:", v6);

  -[IMCoreDataSource loadManagedObjectModel](self, "loadManagedObjectModel");
  -[IMCoreDataSource loadPersistentStoreCoordinator](self, "loadPersistentStoreCoordinator");
  -[IMCoreDataSource loadPersistentStore](self, "loadPersistentStore");
}

- (id)newManagedObjectContext
{
  uint64_t v3;

  v3 = objc_opt_class(NSManagedObjectContext, a2);
  return -[IMCoreDataSource newManagedObjectContextWithClass:](self, "newManagedObjectContextWithClass:", v3);
}

- (id)newPrivateQueueManagedObjectContextWithClass:(Class)a3
{
  id v4;
  void *v5;

  v4 = objc_msgSend([a3 alloc], "initWithConcurrencyType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMCoreDataSource persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  objc_msgSend(v4, "setPersistentStoreCoordinator:", v5);

  objc_msgSend(v4, "setUndoManager:", 0);
  objc_msgSend(v4, "setMergePolicy:", NSMergeByPropertyObjectTrumpMergePolicy);
  return v4;
}

- (id)newManagedObjectContextWithClass:(Class)a3
{
  id v4;
  void *v5;

  v4 = objc_msgSend([a3 alloc], "initWithConcurrencyType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMCoreDataSource persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  objc_msgSend(v4, "setPersistentStoreCoordinator:", v5);

  objc_msgSend(v4, "setUndoManager:", 0);
  objc_msgSend(v4, "setMergePolicy:", NSMergeByPropertyObjectTrumpMergePolicy);
  return v4;
}

- (void)saveMetaData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[2];
  _QWORD v12[2];

  if (-[IMCoreDataSource metadataDictionaryDirty](self, "metadataDictionaryDirty"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMCoreDataSource metadataDictionary](self, "metadataDictionary"));

    if (v3)
    {
      v11[0] = NSMigratePersistentStoresAutomaticallyOption;
      v11[1] = NSInferMappingModelAutomaticallyOption;
      v12[0] = &__kCFBooleanTrue;
      v12[1] = &__kCFBooleanTrue;
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMCoreDataSource persistentStoreCoordinator](self, "persistentStoreCoordinator"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMCoreDataSource persistentStore](self, "persistentStore"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metadataForPersistentStore:", v6));
      v8 = objc_msgSend(v7, "mutableCopy");

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMCoreDataSource metadataDictionary](self, "metadataDictionary"));
      v10 = objc_msgSend(v9, "copy");
      objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("BKDatabase-Metadata"));

      +[NSPersistentStoreCoordinator setMetadata:forPersistentStoreOfType:URL:options:error:](NSPersistentStoreCoordinator, "setMetadata:forPersistentStoreOfType:URL:options:error:", v8, NSSQLiteStoreType, self->_persistentStoreURL, v4, 0);
      -[IMCoreDataSource setMetadataDictionaryDirty:](self, "setMetadataDictionaryDirty:", 0);

    }
  }
}

- (void)saveManagedObjectContext:(id)a3
{
  id v4;
  unsigned __int8 v5;
  char *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;

  v4 = a3;
  -[IMCoreDataSource saveMetaData](self, "saveMetaData");
  if (objc_msgSend(v4, "hasChanges"))
  {
    v11 = 0;
    v5 = objc_msgSend(v4, "save:", &v11);
    v6 = (char *)v11;
    if ((v5 & 1) == 0)
    {
      v7 = BCIMLog();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v13 = "-[IMCoreDataSource saveManagedObjectContext:]";
        v14 = 2080;
        v15 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Database/BCCoreDataSource.m";
        v16 = 1024;
        v17 = 155;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
      }

      v9 = BCIMLog();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v6;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "@\"Failed to save MOC with error: %@\", buf, 0xCu);
      }

    }
  }
  else
  {
    v6 = 0;
  }

}

- (id)bundleForManagedObjectModel
{
  return +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
}

- (void)loadManagedObjectModel
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  NSURLResourceKey v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMCoreDataSource managedObjectModel](self, "managedObjectModel"));

  if (!v3)
  {
    v4 = objc_msgSend((id)objc_opt_class(self), "managedObjectModelName");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMCoreDataSource bundleForManagedObjectModel](self, "bundleForManagedObjectModel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pathForResource:ofType:", v5, CFSTR("momd")));
    if (!v7)
    {
      v24 = v6;
      v25 = v5;
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resourceURL"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v31 = NSURLNameKey;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
      v23 = (void *)v8;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v8, v10, 1, 0));

      v12 = objc_alloc_init((Class)NSMutableArray);
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v13 = v11;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v27 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "pathExtension"));
            v20 = objc_msgSend(v19, "hasPrefix:", CFSTR("mom"));

            if (v20)
              objc_msgSend(v12, "addObject:", v18);
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v15);
      }

      v6 = v24;
      v5 = v25;
      v7 = 0;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v7));
    v22 = objc_msgSend(objc_alloc((Class)NSManagedObjectModel), "initWithContentsOfURL:", v21);
    -[IMCoreDataSource setManagedObjectModel:](self, "setManagedObjectModel:", v22);

  }
}

- (void)loadPersistentStoreCoordinator
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMCoreDataSource persistentStoreCoordinator](self, "persistentStoreCoordinator"));

  if (!v3)
  {
    v4 = objc_alloc((Class)NSPersistentStoreCoordinator);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMCoreDataSource managedObjectModel](self, "managedObjectModel"));
    v6 = objc_msgSend(v4, "initWithManagedObjectModel:", v5);

    -[IMCoreDataSource setPersistentStoreCoordinator:](self, "setPersistentStoreCoordinator:", v6);
  }
}

- (void)loadPersistentStore
{
  -[IMCoreDataSource _loadPersistentStoreAndRetryIfNeeded:](self, "_loadPersistentStoreAndRetryIfNeeded:", 1);
}

- (void)_loadPersistentStoreAndRetryIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void *v13;
  void *v14;
  char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char *v19;
  uint64_t v20;
  void *v21;
  NSString *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  void *v30;
  char *v31;
  unsigned int v32;
  id v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  NSString *v37;
  char *v38;
  char *v39;
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];

  v3 = a3;
  v49[0] = NSMigratePersistentStoresAutomaticallyOption;
  v49[1] = NSInferMappingModelAutomaticallyOption;
  v50[0] = &__kCFBooleanFalse;
  v50[1] = &__kCFBooleanTrue;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v50, v49, 2));
  v6 = objc_claimAutoreleasedReturnValue(-[IMCoreDataSource persistentStoreURL](self, "persistentStoreURL"));
  v7 = NSSQLiteStoreType;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMCoreDataSource persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  v40 = 0;
  v37 = v7;
  v9 = v7;
  v10 = (char *)v6;
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "addPersistentStoreWithType:configuration:URL:options:error:", v9, 0, v6, v5, &v40));
  v12 = (char *)v40;

  if (v11)
  {
    v13 = (void *)v11;
    v14 = v5;
    v15 = v12;
LABEL_7:
    -[IMCoreDataSource setPersistentStore:](self, "setPersistentStore:", v13);
    v20 = objc_claimAutoreleasedReturnValue(-[IMCoreDataSource persistentStoreInitializedHandler](self, "persistentStoreInitializedHandler"));
    v21 = (void *)v20;
    if (v20)
      (*(void (**)(uint64_t))(v20 + 16))(v20);

    v22 = v37;
    if (!v11)
    {
      v23 = objc_claimAutoreleasedReturnValue(-[IMCoreDataSource migrationHandler](self, "migrationHandler"));
      v24 = (void *)v23;
      if (v23)
        (*(void (**)(uint64_t))(v23 + 16))(v23);

    }
    -[IMCoreDataSource setPersistentStoreInitializedHandler:](self, "setPersistentStoreInitializedHandler:", 0);
    -[IMCoreDataSource setMigrationHandler:](self, "setMigrationHandler:", 0);

    goto LABEL_14;
  }
  if (objc_msgSend(v12, "code") == &loc_20BD4 || objc_msgSend(v12, "code") == &loc_20B84)
  {
    v47[0] = NSMigratePersistentStoresAutomaticallyOption;
    v47[1] = NSInferMappingModelAutomaticallyOption;
    v48[0] = &__kCFBooleanTrue;
    v48[1] = &__kCFBooleanTrue;
    v16 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47, 2));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[IMCoreDataSource persistentStoreCoordinator](self, "persistentStoreCoordinator"));
    v39 = v12;
    v18 = (void *)v16;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "addPersistentStoreWithType:configuration:URL:options:error:", v37, 0, v10, v16, &v39));
    v19 = v39;

    if (v13)
    {
      -[IMCoreDataSource setPersistentStore:](self, "setPersistentStore:", v13);
      v14 = v18;
      v15 = v19;
      goto LABEL_7;
    }
    v25 = v19;
    v14 = v18;
    v22 = v37;
  }
  else
  {
    v25 = v12;
    v14 = v5;
    v22 = v37;
  }
  v26 = BCIMLog();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v42 = "-[IMCoreDataSource _loadPersistentStoreAndRetryIfNeeded:]";
    v43 = 2080;
    v44 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Database/BCCoreDataSource.m";
    v45 = 1024;
    v46 = 250;
    _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
  }

  v28 = BCIMLog();
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v42 = v10;
    v43 = 2112;
    v44 = v25;
    _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "@\"Failed to add persistentStore {%@} error {%@}\", buf, 0x16u);
  }

  if (v3)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[IMCoreDataSource persistentStoreCoordinator](self, "persistentStoreCoordinator"));
    v31 = (char *)v25;
    v38 = (char *)v25;
    v32 = objc_msgSend(v30, "bkspi_destroyPersistentStoreAtURL:withType:error:", v10, v22, &v38);
    v15 = v38;

    if (v32)
    {
      -[IMCoreDataSource _loadPersistentStoreAndRetryIfNeeded:](self, "_loadPersistentStoreAndRetryIfNeeded:", 0);
    }
    else
    {
      v33 = BCIMLog();
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v42 = "-[IMCoreDataSource _loadPersistentStoreAndRetryIfNeeded:]";
        v43 = 2080;
        v44 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Database/BCCoreDataSource.m";
        v45 = 1024;
        v46 = 260;
        _os_log_impl(&dword_0, v34, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
      }

      v35 = BCIMLog();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v42 = v10;
        v43 = 2112;
        v44 = v15;
        _os_log_impl(&dword_0, v36, OS_LOG_TYPE_INFO, "@\"Failed to destroy persistent store at URL {%@} error {%@}\", buf, 0x16u);
      }

      -[IMCoreDataSource setPersistentStoreInitializedHandler:](self, "setPersistentStoreInitializedHandler:", 0);
      -[IMCoreDataSource setMigrationHandler:](self, "setMigrationHandler:", 0);
    }
  }
  else
  {
    -[IMCoreDataSource setPersistentStoreInitializedHandler:](self, "setPersistentStoreInitializedHandler:", 0);
    -[IMCoreDataSource setMigrationHandler:](self, "setMigrationHandler:", 0);
    v15 = (char *)v25;
  }
LABEL_14:

}

- (id)copyMaxSortValue:(id)a3 forEntityName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entity:withPredicate:sortBy:ascending:fetchLimit:", v5, v7, CFSTR("sortKey"), 0, 1));

  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", 0));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", CFSTR("sortKey")));

  }
  else
  {
    v10 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", 0);
  }

  return v10;
}

- (id)copyNextSortValue:(id)a3 forKey:(id)a4 forEntityName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  char *v17;
  id v18;
  char *v19;
  id v20;
  id v21;
  char *v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMCoreDataSource persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "persistentStores"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));

  if (v13)
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(-[IMCoreDataSource metadataObjectForKey:](self, "metadataObjectForKey:", v9));
    if (!v14)
    {
      v15 = -[IMCoreDataSource copyMaxSortValue:forEntityName:](self, "copyMaxSortValue:forEntityName:", v8, v10);
      v16 = objc_alloc((Class)NSNumber);
      v17 = (char *)objc_msgSend(v15, "longLongValue");
      v14 = objc_msgSend(v16, "initWithLongLong:", &v17[kIMCoreDataSourceSortOrderInitialGap]);

    }
    v18 = objc_alloc((Class)NSNumber);
    v19 = (char *)objc_msgSend(v14, "longLongValue");
    v20 = objc_msgSend(v18, "initWithLongLong:", &v19[kIMCoreDataSourceSortOrderInitialGap]);
    -[IMCoreDataSource setMetadataObject:forKey:](self, "setMetadataObject:forKey:", v20, v9);
  }
  else
  {
    v20 = -[IMCoreDataSource copyMaxSortValue:forEntityName:](self, "copyMaxSortValue:forEntityName:", v8, v10);
    v21 = objc_alloc((Class)NSNumber);
    v22 = (char *)objc_msgSend(v20, "longLongValue");
    v14 = objc_msgSend(v21, "initWithLongLong:", &v22[kIMCoreDataSourceSortOrderInitialGap]);
  }

  return v14;
}

- (void)setMetadataObject:(id)a3 forKey:(id)a4
{
  id v6;
  IMCoreDataSource *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v10 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMCoreDataSource persistentStore](v7, "persistentStore"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMCoreDataSource persistentStoreCoordinator](v7, "persistentStoreCoordinator"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_3AE08;
    v11[3] = &unk_28C5F0;
    v11[4] = v7;
    v12 = v10;
    v13 = v6;
    objc_msgSend(v9, "performBlockAndWait:", v11);

  }
  objc_sync_exit(v7);

}

- (id)metadataObjectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_3AF74;
  v16 = sub_3AF84;
  v17 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMCoreDataSource persistentStore](self, "persistentStore"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMCoreDataSource persistentStoreCoordinator](self, "persistentStoreCoordinator"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_3AF8C;
    v9[3] = &unk_28D240;
    v9[4] = self;
    v11 = &v12;
    v10 = v4;
    objc_msgSend(v6, "performBlockAndWait:", v9);

  }
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)cacheMetadataDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMCoreDataSource metadataDictionary](self, "metadataDictionary"));

  if (!v3)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[IMCoreDataSource persistentStore](self, "persistentStore"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMCoreDataSource persistentStoreCoordinator](self, "persistentStoreCoordinator"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadataForPersistentStore:", v10));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("BKDatabase-Metadata")));
    v7 = v6;
    if (v6)
      v8 = objc_msgSend(v6, "mutableCopy");
    else
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v9 = v8;
    -[IMCoreDataSource setMetadataDictionary:](self, "setMetadataDictionary:", v8);

    -[IMCoreDataSource setMetadataDictionaryDirty:](self, "setMetadataDictionaryDirty:", 0);
  }
}

- (id)generationValue:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[IMCoreDataSource metadataObjectForKey:](self, "metadataObjectForKey:", a3));
  if (!v3)
    v3 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedLongLong:", 0);
  return v3;
}

- (void)incrementGeneration:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[IMCoreDataSource generationValue:](self, "generationValue:", v4));
  v5 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedLongLong:", (char *)objc_msgSend(v6, "unsignedLongLongValue") + 1);
  -[IMCoreDataSource setGenerationValue:forKey:](self, "setGenerationValue:forKey:", v5, v4);

}

- (NSURL)persistentStoreURL
{
  return self->_persistentStoreURL;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (void)setPersistentStoreCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, a3);
}

- (NSManagedObjectModel)managedObjectModel
{
  return (NSManagedObjectModel *)objc_getProperty(self, a2, 32, 1);
}

- (void)setManagedObjectModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSPersistentStore)persistentStore
{
  return (NSPersistentStore *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPersistentStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)metadataDictionary
{
  return self->_metadataDictionary;
}

- (void)setMetadataDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_metadataDictionary, a3);
}

- (BOOL)metadataDictionaryDirty
{
  return self->_metadataDictionaryDirty;
}

- (void)setMetadataDictionaryDirty:(BOOL)a3
{
  self->_metadataDictionaryDirty = a3;
}

- (id)persistentStoreInitializedHandler
{
  return self->_persistentStoreInitializedHandler;
}

- (void)setPersistentStoreInitializedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)migrationHandler
{
  return self->_migrationHandler;
}

- (void)setMigrationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_migrationHandler, 0);
  objc_storeStrong(&self->_persistentStoreInitializedHandler, 0);
  objc_storeStrong((id *)&self->_metadataDictionary, 0);
  objc_storeStrong((id *)&self->_persistentStore, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_persistentStoreURL, 0);
}

@end
