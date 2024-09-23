@implementation _DASCoreDataStorage

- (id)mocForProtectionClass:(id)a3
{
  id v4;
  unsigned __int8 v5;
  OS_dispatch_queue *mocQueue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v5 = -[_DASDataProtectionStateMonitor isDataAvailableFor:](self->_dataProtectionMonitor, "isDataAvailableFor:", v4);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_100038F10;
  v23 = sub_100038F20;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  mocQueue = self->_mocQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004CCC;
  block[3] = &unk_10015DB90;
  v12 = &v19;
  block[4] = self;
  v7 = v4;
  v14 = v5;
  v11 = v7;
  v13 = &v15;
  dispatch_sync((dispatch_queue_t)mocQueue, block);
  if (*((_BYTE *)v16 + 24))
  {
    -[_DASCoreDataStorage invalidateManagedObjectContextFor:](self, "invalidateManagedObjectContextFor:", v7);
    v8 = 0;
  }
  else
  {
    v8 = (id)v20[5];
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v8;
}

- (_DASCoreDataStorage)init
{

  return 0;
}

+ (id)storageWithDirectory:(id)a3 databaseName:(id)a4 modelURL:(id)a5 readOnly:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_msgSend(objc_alloc((Class)a1), "initWithDirectory:databaseName:modelURL:readOnly:", v12, v11, v10, v6);

  return v13;
}

- (_DASCoreDataStorage)initWithDirectory:(id)a3 databaseName:(id)a4 modelURL:(id)a5 readOnly:(BOOL)a6
{
  _DASCoreDataStorage *v11;
  _DASCoreDataStorage *v12;
  NSString **p_databaseDirectory;
  dispatch_queue_t v14;
  OS_dispatch_queue *mocQueue;
  dispatch_queue_t v16;
  OS_dispatch_queue *pscQueue;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSDictionary *paths;
  NSManagedObjectModel *managedObjectModel;
  uint64_t v28;
  NSMutableDictionary *managedObjectContexts;
  uint64_t v30;
  NSMutableDictionary *persistentStoreCoordinators;
  _DASDataProtectionStateMonitor *v32;
  _DASDataProtectionStateMonitor *dataProtectionMonitor;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id location;
  objc_super v41;
  _QWORD v42[3];
  _QWORD v43[3];

  v35 = a3;
  v36 = a4;
  v37 = a5;
  v41.receiver = self;
  v41.super_class = (Class)_DASCoreDataStorage;
  v11 = -[_DASCoreDataStorage init](&v41, "init");
  v12 = v11;
  if (v11)
  {
    p_databaseDirectory = &v11->_databaseDirectory;
    objc_storeStrong((id *)&v11->_databaseDirectory, a3);
    objc_storeStrong((id *)&v12->_databaseName, a4);
    objc_storeStrong((id *)&v12->_modelURL, a5);
    v12->_readOnly = a6;
    v14 = dispatch_queue_create("_DASCoreDataStore.mocQueue", 0);
    mocQueue = v12->_mocQueue;
    v12->_mocQueue = (OS_dispatch_queue *)v14;

    v16 = dispatch_queue_create("_DASCoreDataStore.queuePSC", 0);
    pscQueue = v12->_pscQueue;
    v12->_pscQueue = (OS_dispatch_queue *)v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), *p_databaseDirectory, v12->_databaseName));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@.db"), v18, CFSTR("ClassA")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@.db"), v18, CFSTR("ClassC")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@.db"), v18, CFSTR("ClassD")));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassA](_DASDataProtectionStateMonitor, "dataProtectionClassA"));
    v42[0] = v22;
    v43[0] = v19;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassC](_DASDataProtectionStateMonitor, "dataProtectionClassC"));
    v42[1] = v23;
    v43[1] = v20;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassD](_DASDataProtectionStateMonitor, "dataProtectionClassD"));
    v42[2] = v24;
    v43[2] = v21;
    v25 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 3));
    paths = v12->_paths;
    v12->_paths = (NSDictionary *)v25;

    managedObjectModel = v12->_managedObjectModel;
    v12->_managedObjectModel = 0;

    v28 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    managedObjectContexts = v12->_managedObjectContexts;
    v12->_managedObjectContexts = (NSMutableDictionary *)v28;

    v30 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    persistentStoreCoordinators = v12->_persistentStoreCoordinators;
    v12->_persistentStoreCoordinators = (NSMutableDictionary *)v30;

    v32 = objc_opt_new(_DASDataProtectionStateMonitor);
    dataProtectionMonitor = v12->_dataProtectionMonitor;
    v12->_dataProtectionMonitor = v32;

    objc_initWeak(&location, v12);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100038898;
    v38[3] = &unk_10015D438;
    objc_copyWeak(&v39, &location);
    -[_DASDataProtectionStateMonitor setChangeHandler:](v12->_dataProtectionMonitor, "setChangeHandler:", v38);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);

  }
  return v12;
}

- (void)handleDataProtectionChangeFor:(id)a3 willBeAvailable:(BOOL)a4
{
  id v5;

  if (!a4)
  {
    v5 = a3;
    -[_DASCoreDataStorage invalidateManagedObjectContextFor:](self, "invalidateManagedObjectContextFor:", v5);
    -[_DASCoreDataStorage invalidatePersistentStoreCoordinatorFor:](self, "invalidatePersistentStoreCoordinatorFor:", v5);

  }
}

- (void)invalidateManagedObjectContextFor:(id)a3
{
  id v4;
  OS_dispatch_queue *mocQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  mocQueue = self->_mocQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000389BC;
  block[3] = &unk_10015D558;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)mocQueue, block);

}

- (void)invalidatePersistentStoreCoordinatorFor:(id)a3
{
  id v4;
  OS_dispatch_queue *pscQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  pscQueue = self->_pscQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038B08;
  block[3] = &unk_10015D558;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)pscQueue, block);

}

- (NSManagedObjectModel)managedObjectModel
{
  NSManagedObjectModel *managedObjectModel;
  NSManagedObjectModel *v4;
  NSManagedObjectModel *v5;
  NSManagedObjectModel *v6;

  managedObjectModel = self->_managedObjectModel;
  if (!managedObjectModel)
  {
    if (!self->_modelURL)
    {
      NSLog(CFSTR("Missing model URL!"), a2);
      v6 = 0;
      return v6;
    }
    v4 = (NSManagedObjectModel *)objc_msgSend(objc_alloc((Class)NSManagedObjectModel), "initWithContentsOfURL:", self->_modelURL);
    v5 = self->_managedObjectModel;
    self->_managedObjectModel = v4;

    managedObjectModel = self->_managedObjectModel;
  }
  v6 = managedObjectModel;
  return v6;
}

+ (id)persistentStoreOptionsFor:(id)a3 readOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[5];

  v4 = a4;
  v9[0] = NSPersistentStoreConnectionPoolMaxSizeKey;
  v9[1] = NSMigratePersistentStoresAutomaticallyOption;
  v10[0] = &off_10016E5B8;
  v10[1] = &__kCFBooleanTrue;
  v10[2] = &__kCFBooleanTrue;
  v9[2] = NSInferMappingModelAutomaticallyOption;
  v9[3] = NSReadOnlyPersistentStoreOption;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  v9[4] = NSPersistentStoreFileProtectionKey;
  v10[3] = v6;
  v10[4] = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 5));

  return v7;
}

- (id)persistentStoreCoordinatorFor:(id)a3
{
  id v4;
  unsigned __int8 v5;
  OS_dispatch_queue *pscQueue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v5 = -[_DASDataProtectionStateMonitor isDataAvailableFor:](self->_dataProtectionMonitor, "isDataAvailableFor:", v4);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_100038F10;
  v23 = sub_100038F20;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  pscQueue = self->_pscQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038F28;
  block[3] = &unk_10015DB90;
  v12 = &v19;
  block[4] = self;
  v7 = v4;
  v14 = v5;
  v11 = v7;
  v13 = &v15;
  dispatch_sync((dispatch_queue_t)pscQueue, block);
  if (*((_BYTE *)v16 + 24))
  {
    -[_DASCoreDataStorage invalidatePersistentStoreCoordinatorFor:](self, "invalidatePersistentStoreCoordinatorFor:", v7);
    v8 = 0;
  }
  else
  {
    v8 = (id)v20[5];
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v8;
}

- (BOOL)deleteDatabaseForPSC:(id)a3 protectionClass:(id)a4 obliterate:(BOOL)a5
{
  _BOOL4 readOnly;
  _BOOL4 v6;
  NSDictionary *paths;
  id v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];

  readOnly = self->_readOnly;
  if (!self->_readOnly)
  {
    v6 = a5;
    paths = self->_paths;
    v9 = a3;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](paths, "objectForKeyedSubscript:", a4));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v10));

    if (v6)
    {
      v19[0] = NSPersistentStoreUnlinkDestroyOption;
      v19[1] = NSPersistentStoreForceDestroyOption;
      v20[0] = &__kCFBooleanTrue;
      v20[1] = &__kCFBooleanTrue;
      v12 = (void **)v20;
      v13 = v19;
      v14 = 2;
    }
    else
    {
      v17 = NSPersistentStoreUnlinkDestroyOption;
      v18 = &__kCFBooleanTrue;
      v12 = &v18;
      v13 = &v17;
      v14 = 1;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v13, v14));
    objc_msgSend(v9, "_destroyPersistentStoreAtURL:withType:options:error:", v11, NSSQLiteStoreType, v15, 0);

  }
  return !readOnly;
}

- (BOOL)deleteStorageFor:(id)a3 obliterate:(BOOL)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  if (self->_readOnly)
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](self, "mocForProtectionClass:", v6));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage persistentStoreCoordinatorFor:](self, "persistentStoreCoordinatorFor:", v6));
      if (v9)
      {
        v16 = 0;
        v17 = &v16;
        v18 = 0x2020000000;
        v19 = 0;
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_1000394F0;
        v11[3] = &unk_10015DBB8;
        v11[4] = self;
        v12 = v6;
        v14 = &v16;
        v13 = v9;
        v15 = a4;
        objc_msgSend(v8, "performWithOptions:andBlock:", 4, v11);
        v7 = *((_BYTE *)v17 + 24) != 0;

        _Block_object_dispose(&v16, 8);
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

+ (BOOL)createDatabaseDirectory:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v5, 1));

  LOBYTE(a4) = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, a4);
  return (char)a4;
}

- (NSString)databaseDirectory
{
  return self->_databaseDirectory;
}

- (NSString)databaseName
{
  return self->_databaseName;
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (NSDictionary)paths
{
  return self->_paths;
}

- (void)setManagedObjectModel:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectModel, a3);
}

- (NSMutableDictionary)managedObjectContexts
{
  return self->_managedObjectContexts;
}

- (NSMutableDictionary)persistentStoreCoordinators
{
  return self->_persistentStoreCoordinators;
}

- (OS_dispatch_queue)mocQueue
{
  return self->_mocQueue;
}

- (OS_dispatch_queue)pscQueue
{
  return self->_pscQueue;
}

- (_DASDataProtectionStateMonitor)dataProtectionMonitor
{
  return self->_dataProtectionMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProtectionMonitor, 0);
  objc_storeStrong((id *)&self->_pscQueue, 0);
  objc_storeStrong((id *)&self->_mocQueue, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinators, 0);
  objc_storeStrong((id *)&self->_managedObjectContexts, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_databaseName, 0);
  objc_storeStrong((id *)&self->_databaseDirectory, 0);
}

@end
