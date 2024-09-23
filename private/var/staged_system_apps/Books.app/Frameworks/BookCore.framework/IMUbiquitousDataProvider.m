@implementation IMUbiquitousDataProvider

+ (void)initialize
{
  dispatch_queue_t v2;
  void *v3;

  if ((id)objc_opt_class(IMUbiquitousDataProvider, a2) == a1)
  {
    v2 = dispatch_queue_create("com.apple.itunesmobile.ubiquity", 0);
    v3 = (void *)qword_30D5F0;
    qword_30D5F0 = (uint64_t)v2;

  }
}

+ (id)ubiquityQueue
{
  return (id)qword_30D5F0;
}

- (IMUbiquitousDataProvider)init
{
  IMUbiquitousDataProvider *v2;
  IMUbiquitousPersistentStoreLoader *v3;
  IMUbiquitousPersistentStoreLoader *localPersistentStoreLoader;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMUbiquitousDataProvider;
  v2 = -[IMUbiquitousDataProvider init](&v6, "init");
  if (v2)
  {
    v3 = -[IMUbiquitousPersistentStoreLoader initWithIdentifier:]([IMUbiquitousPersistentStoreLoader alloc], "initWithIdentifier:", CFSTR("local"));
    localPersistentStoreLoader = v2->_localPersistentStoreLoader;
    v2->_localPersistentStoreLoader = v3;

  }
  __dmb(0xBu);
  return v2;
}

- (IMUbiquitousDataProvider)initWithPersistentStoreURL:(id)a3
{
  id v4;
  IMUbiquitousDataProvider *v5;
  IMUbiquitousPersistentStoreLoader *v6;
  IMUbiquitousPersistentStoreLoader *localPersistentStoreLoader;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMUbiquitousDataProvider;
  v5 = -[IMUbiquitousDataProvider init](&v9, "init");
  if (v5)
  {
    v6 = -[IMUbiquitousPersistentStoreLoader initWithPersistentStoreURL:]([IMUbiquitousPersistentStoreLoader alloc], "initWithPersistentStoreURL:", v4);
    localPersistentStoreLoader = v5->_localPersistentStoreLoader;
    v5->_localPersistentStoreLoader = v6;

  }
  return v5;
}

- (BOOL)isReady
{
  return (-[IMUbiquitousDataProvider currentPersistentStoreType](self, "currentPersistentStoreType") & 0xFFFFFFFD) != 0;
}

+ (BOOL)ubiquityDebug
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  if ((byte_30D5F9 & 1) == 0)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "environment"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForKey:", CFSTR("kIMUbiquitousDataProviderDebug")));

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("kIMUbiquitousDataProviderDebug")));

    byte_30D5F8 = objc_msgSend(v4, "isEqualToString:", CFSTR("YES"));
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("YES"));
    byte_30D5F8 |= v7;
    byte_30D5F9 = 1;

  }
  return byte_30D5F8;
}

- (BOOL)saveManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  unsigned __int8 v17;
  char *v18;
  BOOL v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider currentPersistentStore](self, "currentPersistentStore"));
  if (-[IMUbiquitousDataProvider metadataDictionaryDirty](self, "metadataDictionaryDirty"))
  {
    v6 = objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider metadataDictionary](self, "metadataDictionary"));
    if (v6)
    {
      v7 = (void *)v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistentStoreCoordinator"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider persistentStoreCoordinator](self, "persistentStoreCoordinator"));
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider persistentStoreCoordinator](self, "persistentStoreCoordinator"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "metadataForPersistentStore:", v5));
        v13 = objc_msgSend(v12, "mutableCopy");

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider metadataDictionary](self, "metadataDictionary"));
        v15 = objc_msgSend(v14, "copy");

        objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("BKDatabase-Metadata"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider persistentStoreCoordinator](self, "persistentStoreCoordinator"));
        objc_msgSend(v16, "setMetadata:forPersistentStore:", v13, v5);

        -[IMUbiquitousDataProvider setMetadataDictionaryDirty:](self, "setMetadataDictionaryDirty:", 0);
      }
    }
  }
  if (!objc_msgSend(v4, "hasChanges"))
  {
    v18 = 0;
LABEL_14:
    v19 = 0;
    goto LABEL_15;
  }
  v25 = 0;
  v17 = objc_msgSend(v4, "save:", &v25);
  v18 = (char *)v25;
  if ((v17 & 1) == 0)
  {
    v20 = BCIMLog();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v27 = "-[IMUbiquitousDataProvider saveManagedObjectContext:]";
      v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Database/BCUbiquitousDataProvider.m";
      v30 = 1024;
      v31 = 140;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    v22 = BCIMLog();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v18;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "@\"Failed to save syncMOC with error: %@\", buf, 0xCu);
    }

    goto LABEL_14;
  }
  v19 = 1;
LABEL_15:

  return v19;
}

- (id)newManagedObjectContextWithClass:(Class)a3 concurrencyType:(unint64_t)a4
{
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  -[IMUbiquitousDataProvider loadCoreData](self, "loadCoreData");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  v8 = objc_msgSend([a3 alloc], "initWithConcurrencyType:", a4);
  if (objc_msgSend(v8, "concurrencyType"))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_53F68;
    v10[3] = &unk_28B808;
    v11 = v8;
    v12 = v7;
    objc_msgSend(v11, "performBlock:", v10);

    if (v8)
      goto LABEL_9;
  }
  else
  {
    objc_msgSend(v8, "setPersistentStoreCoordinator:", v7);
    objc_msgSend(v8, "setUndoManager:", 0);
    objc_msgSend(v8, "setMergePolicy:", NSMergeByPropertyObjectTrumpMergePolicy);
    if (v8)
      goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1B487C();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1B4838();
LABEL_9:

  return v8;
}

- (id)newManagedObjectContextWithClass:(Class)a3
{
  return -[IMUbiquitousDataProvider newManagedObjectContextWithClass:concurrencyType:](self, "newManagedObjectContextWithClass:concurrencyType:", a3, 0);
}

- (id)newManagedObjectContext
{
  uint64_t v3;

  v3 = objc_opt_class(NSManagedObjectContext, a2);
  return -[IMUbiquitousDataProvider newManagedObjectContextWithClass:](self, "newManagedObjectContextWithClass:", v3);
}

- (void)loadCoreData
{
  int64_t *p_onceToken;
  int64_t onceToken;
  _QWORD block[5];

  onceToken = self->_onceToken;
  p_onceToken = &self->_onceToken;
  block[4] = self;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_54048;
  block[3] = &unk_28B960;
  if (onceToken != -1)
    dispatch_once(p_onceToken, block);
}

- (void)setMetadataObject:(id)a3 forKey:(id)a4
{
  id v6;
  IMUbiquitousDataProvider *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v10 = a3;
  v6 = a4;
  if (v10)
  {
    v7 = self;
    objc_sync_enter(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider currentPersistentStore](v7, "currentPersistentStore"));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider persistentStoreCoordinator](v7, "persistentStoreCoordinator"));
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_54184;
      v11[3] = &unk_28C5F0;
      v11[4] = v7;
      v12 = v10;
      v13 = v6;
      objc_msgSend(v9, "performBlockAndWait:", v11);

    }
    objc_sync_exit(v7);

  }
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
  v15 = sub_542F0;
  v16 = sub_54300;
  v17 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider currentPersistentStore](self, "currentPersistentStore"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider persistentStoreCoordinator](self, "persistentStoreCoordinator"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_54308;
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

- (void)applicationDidBecomeActive:(id)a3
{
  if (-[IMUbiquitousDataProvider isReady](self, "isReady", a3))
    -[IMUbiquitousDataProvider updateCurrentPersistentStore](self, "updateCurrentPersistentStore");
}

+ (void)deleteCloudDataWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void (**v7)(id, BOOL, id);
  id v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMUbiquitousPersistentStoreLoader databaseFolderURL](IMUbiquitousPersistentStoreLoader, "databaseFolderURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8 = 0;
  objc_msgSend(v5, "removeItemAtURL:error:", v4, &v8);
  v6 = v8;

  v7 = (void (**)(id, BOOL, id))objc_retainBlock(v3);
  if (v7)
    v7[2](v7, v6 == 0, v6);

}

- (void)loadManagedObjectModel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider managedObjectModel](self, "managedObjectModel"));

  if (!v3)
  {
    v4 = (void *)objc_opt_class(self);
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectModelName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectModelBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathForResource:ofType:", v9, CFSTR("momd")));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v6));
    v8 = objc_msgSend(objc_alloc((Class)NSManagedObjectModel), "initWithContentsOfURL:", v7);
    -[IMUbiquitousDataProvider setManagedObjectModel:](self, "setManagedObjectModel:", v8);

  }
}

- (void)loadPersistentStoreCoordinator
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider persistentStoreCoordinator](self, "persistentStoreCoordinator"));

  if (!v3)
  {
    v4 = objc_alloc((Class)NSPersistentStoreCoordinator);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider managedObjectModel](self, "managedObjectModel"));
    v6 = objc_msgSend(v4, "initWithManagedObjectModel:", v5);

    -[IMUbiquitousDataProvider setPersistentStoreCoordinator:](self, "setPersistentStoreCoordinator:", v6);
  }
}

- (void)loadLocalPersistentStoreWithCompletionBlock:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider localPersistentStoreLoader](self, "localPersistentStoreLoader"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addPersistentStoreToPersistentStoreCoordinator:", v5));
  -[IMUbiquitousDataProvider setCurrentPersistentStore:](self, "setCurrentPersistentStore:", v6);

  -[IMUbiquitousDataProvider setCurrentPersistentStoreType:](self, "setCurrentPersistentStoreType:", 1);
  v7 = v8;
  if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
    v7 = v8;
  }

}

- (void)loadPersistentStore
{
  -[IMUbiquitousDataProvider loadLocalPersistentStoreWithCompletionBlock:](self, "loadLocalPersistentStoreWithCompletionBlock:", 0);
}

- (void)loadBringUpPersistentStore
{
  void *v3;
  _QWORD v4[5];

  if (!-[IMUbiquitousDataProvider currentPersistentStoreType](self, "currentPersistentStoreType"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider persistentStoreCoordinator](self, "persistentStoreCoordinator"));
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_546F0;
    v4[3] = &unk_28B960;
    v4[4] = self;
    objc_msgSend(v3, "performBlockAndWait:", v4);

  }
}

- (void)removePersistentStores
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentStores"));
  v5 = objc_msgSend(v4, "copy");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider persistentStoreCoordinator](self, "persistentStoreCoordinator"));
        v15 = 0;
        v13 = objc_msgSend(v12, "removePersistentStore:error:", v11, &v15);
        v14 = v15;

        if ((v13 & 1) == 0)
          +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("%@ Could not remove local Persistent Store: %@\nError: %@"), objc_opt_class(self), v11, v14);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  -[IMUbiquitousDataProvider setCurrentPersistentStore:](self, "setCurrentPersistentStore:", 0);
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider metadataDictionary](self, "metadataDictionary"));

  if (!v3)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider currentPersistentStore](self, "currentPersistentStore"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider persistentStoreCoordinator](self, "persistentStoreCoordinator"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadataForPersistentStore:", v10));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("BKDatabase-Metadata")));
    v7 = v6;
    if (v6)
      v8 = objc_msgSend(v6, "mutableCopy");
    else
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v9 = v8;
    -[IMUbiquitousDataProvider setMetadataDictionary:](self, "setMetadataDictionary:", v8);

    -[IMUbiquitousDataProvider setMetadataDictionaryDirty:](self, "setMetadataDictionaryDirty:", 0);
  }
}

- (BOOL)isEnabled
{
  return 1;
}

+ (id)managedObjectModelName
{
  NSString *v3;
  void *v4;

  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("%@ is an abstract class, %@ should be implemented by a concrete subclass"), a1, v4);

  return 0;
}

+ (id)managedObjectModelBundle
{
  return +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(a1));
}

- (NSManagedObjectModel)managedObjectModel
{
  return (NSManagedObjectModel *)objc_getProperty(self, a2, 8, 1);
}

- (void)setManagedObjectModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return (NSPersistentStoreCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPersistentStoreCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSPersistentStore)currentPersistentStore
{
  return self->_currentPersistentStore;
}

- (void)setCurrentPersistentStore:(id)a3
{
  objc_storeStrong((id *)&self->_currentPersistentStore, a3);
}

- (int)currentPersistentStoreType
{
  return self->_currentPersistentStoreType;
}

- (void)setCurrentPersistentStoreType:(int)a3
{
  self->_currentPersistentStoreType = a3;
}

- (IMUbiquitousPersistentStoreLoader)bringUpPersistentStoreLoader
{
  return self->_bringUpPersistentStoreLoader;
}

- (void)setBringUpPersistentStoreLoader:(id)a3
{
  objc_storeStrong((id *)&self->_bringUpPersistentStoreLoader, a3);
}

- (IMUbiquitousPersistentStoreLoader)localPersistentStoreLoader
{
  return self->_localPersistentStoreLoader;
}

- (void)setLocalPersistentStoreLoader:(id)a3
{
  objc_storeStrong((id *)&self->_localPersistentStoreLoader, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataDictionary, 0);
  objc_storeStrong((id *)&self->_localPersistentStoreLoader, 0);
  objc_storeStrong((id *)&self->_bringUpPersistentStoreLoader, 0);
  objc_storeStrong((id *)&self->_currentPersistentStore, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
}

@end
