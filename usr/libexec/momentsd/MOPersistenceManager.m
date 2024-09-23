@implementation MOPersistenceManager

- (MOPersistenceManager)initWithUniverse:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MOPersistenceManager *v14;
  dispatch_queue_attr_t v15;
  NSObject *v16;
  OS_dispatch_queue *v17;
  OS_dispatch_queue *queue;
  id v19;
  NSPersistentContainer *v20;
  NSPersistentContainer *persistentContainer;
  NSPersistentStoreDescription *v22;
  void *v23;
  NSManagedObjectContext *v24;
  NSManagedObjectContext *managedObjectContext;
  id os_log;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  MODispatcher *v34;
  MODispatcher *dispatcher;
  id v36;
  uint64_t v37;
  objc_class *v38;
  NSString *v39;
  void *v40;
  MOConfigurationManager *v41;
  MOConfigurationManager *configurationManager;
  MOPersistenceManager *v43;
  id v44;
  NSObject *v45;
  objc_super v47;
  id v48;

  v5 = a3;
  v48 = (id)os_transaction_create("com.apple.momentsd-MOPersistenceManager", v6);
  v8 = (objc_class *)objc_opt_class(MODarwinNotifier, v7);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v10));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MOPersistenceManager defaultModelsDirectory](MOPersistenceManager, "defaultModelsDirectory"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MOPersistenceManager defaultStoresDirectory](MOPersistenceManager, "defaultStoresDirectory"));
    v47.receiver = self;
    v47.super_class = (Class)MOPersistenceManager;
    v14 = -[MOPersistenceManager init](&v47, "init");
    self = v14;
    if (v14 && v13 && v12)
    {
      objc_storeStrong((id *)&v14->_modelsDirectory, v12);
      objc_storeStrong((id *)&self->_storesDirectory, v13);
      v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      v17 = (OS_dispatch_queue *)dispatch_queue_create("MOPersistenceManager", v16);
      queue = self->_queue;
      self->_queue = v17;

      v19 = (id)objc_claimAutoreleasedReturnValue(+[MOPersistenceManager currentManagedObjectModel](MOPersistenceManager, "currentManagedObjectModel"));
      v20 = (NSPersistentContainer *)objc_msgSend(objc_alloc((Class)NSPersistentContainer), "initWithName:managedObjectModel:", CFSTR("moments"), v19);
      persistentContainer = self->_persistentContainer;
      self->_persistentContainer = v20;

      self->_availability = 1;
      v22 = objc_opt_new(NSPersistentStoreDescription);
      -[NSPersistentStoreDescription setShouldAddStoreAsynchronously:](v22, "setShouldAddStoreAsynchronously:", 0);
      -[NSPersistentStoreDescription setShouldMigrateStoreAutomatically:](v22, "setShouldMigrateStoreAutomatically:", 1);
      -[NSPersistentStoreDescription setShouldInferMappingModelAutomatically:](v22, "setShouldInferMappingModelAutomatically:", 1);
      -[NSPersistentStoreDescription setURL:](v22, "setURL:", self->_storesDirectory);
      -[NSPersistentStoreDescription setType:](v22, "setType:", NSSQLiteStoreType);
      -[NSPersistentStoreDescription setOption:forKey:](v22, "setOption:forKey:", NSFileProtectionCompleteUnlessOpen, NSPersistentStoreFileProtectionKey);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v22, 0));
      -[NSPersistentContainer setPersistentStoreDescriptions:](self->_persistentContainer, "setPersistentStoreDescriptions:", v23);

      v24 = -[NSPersistentContainer newBackgroundContext](self->_persistentContainer, "newBackgroundContext");
      managedObjectContext = self->_managedObjectContext;
      self->_managedObjectContext = v24;

      os_log = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
      v27 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[MOPersistenceManager initWithUniverse:].cold.2((uint64_t)&self->_managedObjectContext, v27, v28, v29, v30, v31, v32, v33);

      v34 = -[MODispatcher initWithNotifier:]([MODispatcher alloc], "initWithNotifier:", v11);
      dispatcher = self->_dispatcher;
      self->_dispatcher = v34;

      -[MOPersistenceManager registerForNotifications](self, "registerForNotifications");
      v36 = v48;
      v48 = 0;

      v38 = (objc_class *)objc_opt_class(MOConfigurationManager, v37);
      v39 = NSStringFromClass(v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      v41 = (MOConfigurationManager *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v40));
      configurationManager = self->_configurationManager;
      self->_configurationManager = v41;

      v43 = self;
    }
    else
    {
      v43 = 0;
      v19 = v48;
      v48 = 0;
    }

  }
  else
  {
    v44 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      -[MOPersistenceManager initWithUniverse:].cold.1();

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOPersistenceManager.m"), 45, CFSTR("Invalid parameter not satisfying: notifier"));
    v43 = 0;
  }

  return v43;
}

- (void)registerForNotifications
{
  _QWORD *v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __48__MOPersistenceManager_registerForNotifications__block_invoke;
  v5[3] = &unk_1002B26F0;
  v5[4] = self;
  v3 = objc_retainBlock(v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOPersistenceManager dispatcher](self, "dispatcher"));
  objc_msgSend(v4, "registerForNotification:withHandler:", 2, v3);

}

void __48__MOPersistenceManager_registerForNotifications__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id os_log;
  NSObject *v7;

  v5 = a3;
  if (a2 == 2)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
    v7 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __48__MOPersistenceManager_registerForNotifications__block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "onLockStateChangeNotification:", v5);
  }

}

- (void)onLockStateChangeNotification:(id)a3
{
  void *v4;
  id os_log;
  NSObject *v6;
  NSObject *queue;
  _QWORD block[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForKey:", CFSTR("isUnlocked")));

  if (v4 && (id)-[MOPersistenceManager availability](self, "availability") == (id)2)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[MOPersistenceManager onLockStateChangeNotification:].cold.1();

    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __54__MOPersistenceManager_onLockStateChangeNotification___block_invoke;
    block[3] = &unk_1002AD8A8;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

void __54__MOPersistenceManager_onLockStateChangeNotification___block_invoke(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dispatcher"));
  objc_msgSend(v1, "unregisterForNotification:", 2);

}

- (unint64_t)availability
{
  MOPersistenceManager *v2;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_availability != 2 && -[MOPersistenceManager loadStore](v2, "loadStore"))
    v2->_availability = 2;
  objc_sync_exit(v2);

  return v2->_availability;
}

- (BOOL)loadStore
{
  unsigned int v3;
  id os_log;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  dispatch_semaphore_t v8;
  NSPersistentContainer *persistentContainer;
  NSObject *v10;
  void *v11;
  BOOL v12;
  id v13;
  id v14;
  NSObject *v15;
  uint8_t v16;
  id v18;
  _QWORD v19[4];
  NSObject *v20;
  uint8_t *v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  char v25;

  v3 = -[MOPersistenceManager _acquireBackgroundProcessingPermissions](self, "_acquireBackgroundProcessingPermissions");
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (!v6)
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v7 = "Succeed to update background processing assertion";
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v7 = "Fail to update background processing assertion";
  }
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v7, buf, 2u);
LABEL_7:

  *(_QWORD *)buf = 0;
  v23 = buf;
  v24 = 0x2020000000;
  v25 = 0;
  v8 = dispatch_semaphore_create(0);
  persistentContainer = self->_persistentContainer;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __33__MOPersistenceManager_loadStore__block_invoke;
  v19[3] = &unk_1002B2DB8;
  v21 = buf;
  v10 = v8;
  v20 = v10;
  -[NSPersistentContainer loadPersistentStoresWithCompletionHandler:](persistentContainer, "loadPersistentStoresWithCompletionHandler:", v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/Persistence/MOPersistenceManager.m", 153, "-[MOPersistenceManager loadStore]"));
  v18 = 0;
  v12 = MOSemaphoreWaitAndFaultIfTimeout_Internal(v10, &v18, v11, 10.0);
  v13 = v18;
  if (!v12)
  {
    v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

  }
  v16 = v23[24];

  _Block_object_dispose(buf, 8);
  return v16;
}

void __33__MOPersistenceManager_loadStore__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id os_log;
  NSObject *v6;
  NSObject *v7;

  v4 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __33__MOPersistenceManager_loadStore__block_invoke_cold_2();

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __33__MOPersistenceManager_loadStore__block_invoke_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return -[NSPersistentContainer persistentStoreCoordinator](self->_persistentContainer, "persistentStoreCoordinator");
}

- (void)performBlock:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __37__MOPersistenceManager_performBlock___block_invoke;
  v7[3] = &unk_1002B2DE0;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MOPersistenceManager managedObjectContext](self, "managedObjectContext"));
  v9 = v4;
  v5 = v8;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

void __37__MOPersistenceManager_performBlock___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
}

- (void)performBlockAndWait:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __44__MOPersistenceManager_performBlockAndWait___block_invoke;
  v7[3] = &unk_1002B2DE0;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MOPersistenceManager managedObjectContext](self, "managedObjectContext"));
  v9 = v4;
  v5 = v8;
  v6 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v7);

}

void __44__MOPersistenceManager_performBlockAndWait___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
}

+ (id)defaultModelsDirectory
{
  void *v4;
  void *v5;
  id os_log;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  unsigned __int8 v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v20;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resourceURL"));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[MOPersistenceManager defaultModelsDirectory].cold.4();

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("moments"), "stringByAppendingPathExtension:", CFSTR("momd")));
  v9 = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    +[MOPersistenceManager defaultModelsDirectory].cold.3();

  v11 = objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:relativeToURL:", v8, v5);
  v20 = 0;
  v12 = objc_msgSend(v11, "checkResourceIsReachableAndReturnError:", &v20);
  v13 = v20;
  if ((v12 & 1) == 0)
  {
    v14 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[MOPersistenceManager defaultModelsDirectory].cold.2();

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MOPersistenceManager.m"), 196, CFSTR("Failed to locate momd bundle: %@ (in %s:%d)"), v13, "+[MOPersistenceManager defaultModelsDirectory]", 196);

  }
  v17 = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    +[MOPersistenceManager defaultModelsDirectory].cold.1();

  return v11;
}

+ (id)defaultStoresDirectory
{
  void *v2;
  NSObject *v3;
  void *v4;
  id os_log;
  NSObject *v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "userCacheDirectoryPath"));
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v2, 1));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject URLByAppendingPathComponent:](v3, "URLByAppendingPathComponent:", CFSTR("momentsDataModel.sqlite")));
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      +[MOPersistenceManager defaultStoresDirectory].cold.2();

  }
  else
  {
    v7 = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
    v3 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      +[MOPersistenceManager defaultStoresDirectory].cold.1();
    v4 = 0;
  }

  return v4;
}

+ (id)currentManagedObjectModel
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __49__MOPersistenceManager_currentManagedObjectModel__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentManagedObjectModel_onceToken != -1)
    dispatch_once(&currentManagedObjectModel_onceToken, block);
  return (id)currentManagedObjectModel__model;
}

void __49__MOPersistenceManager_currentManagedObjectModel__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "createModel"));
  v2 = (void *)currentManagedObjectModel__model;
  currentManagedObjectModel__model = v1;

}

+ (id)createModel
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)NSManagedObjectModel);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultModelsDirectory"));
  v5 = objc_msgSend(v3, "initWithContentsOfURL:", v4);

  return v5;
}

+ (id)userCacheDirectoryPath
{
  return +[MOPersistenceUtilities userCacheDirectoryPath](MOPersistenceUtilities, "userCacheDirectoryPath");
}

+ (id)getPlistFileURL
{
  void *v2;
  void *v3;
  void *v4;
  id os_log;
  NSObject *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "userCacheDirectoryPath"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v2, 1));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("lastCollection.plist")));

  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MODaemonAnalyticsManager getDaemonPlistFileURL].cold.1();

    v4 = 0;
  }

  return v4;
}

+ (void)persistCollectionDate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "couldn't write to the collection plist file, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (id)getCollectionDate
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  id os_log;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  __CFString *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v16;
  uint8_t buf[4];
  const __CFString *v18;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getPlistFileURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "path"));
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v18 = CFSTR("lastCollection.plist");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "File %@ found.", buf, 0xCu);
    }

    v16 = 0;
    v9 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfURL:error:", v2, &v16);
    v7 = v16;
    if (v7 || !v9)
    {
      v14 = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
      v13 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        +[MOPersistenceManager getCollectionDate].cold.1();
    }
    else
    {
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("lastCollectTriggerDate")));
      v11 = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      v13 = v12;
      if (v10)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v10;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "The most recent collection date was successfully read from plist, %@", buf, 0xCu);
        }
        goto LABEL_17;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[MOPersistenceManager getCollectionDate].cold.2();
    }
    v10 = 0;
LABEL_17:

    goto LABEL_18;
  }
  if (v8)
  {
    *(_DWORD *)buf = 138412290;
    v18 = CFSTR("lastCollection.plist");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "File %@ doesn't exists.", buf, 0xCu);
  }
  v10 = 0;
LABEL_18:

  return v10;
}

+ (id)getBundlingJSONURLWithTrigger:(unint64_t)a3
{
  unint64_t v3;
  id os_log;
  NSObject *v5;
  void *v6;

  v3 = a3 - 1;
  if (a3 - 1 < 5 && ((0x1Bu >> v3) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MOPersistenceUtilities getBundlingJSONURLWithDirectorySuffix:](MOPersistenceUtilities, "getBundlingJSONURLWithDirectorySuffix:", *(&off_1002B2E20 + v3)));
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
    v5 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[MOPersistenceManager getBundlingJSONURLWithTrigger:].cold.1();

    v6 = 0;
  }
  return v6;
}

- (int)_acquireBackgroundAssertionForFileDescriptor:(int)a3
{
  void *v4;
  double v5;
  double v6;
  _QWORD v8[2];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOPersistenceManager configurationManager](self, "configurationManager"));
  objc_msgSend(v4, "getDoubleSettingForKey:withFallback:", CFSTR("persistenceDriverBackgroundProcessingAssertionDuration"), 86400.0);
  v6 = v5;

  v8[0] = 0;
  v8[1] = (unint64_t)(v6 * 1000000000.0);
  return fcntl(a3, 108, v8);
}

- (int)_getFileDescriptorForPersistenceStoreFile:(id)a3
{
  return open_dprotected_np((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), 2, 2, 0, 416);
}

+ (id)protectedStoreFilesExtensions
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)protectedStoreFilesExtensions_cacheFilesExtensions;
  if (!protectedStoreFilesExtensions_cacheFilesExtensions)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("sqlite"), CFSTR("sqlite-wal"), CFSTR("sqlite-shm"), 0));
    v4 = (void *)protectedStoreFilesExtensions_cacheFilesExtensions;
    protectedStoreFilesExtensions_cacheFilesExtensions = v3;

    v2 = (void *)protectedStoreFilesExtensions_cacheFilesExtensions;
  }
  return v2;
}

- (BOOL)_acquireBackgroundProcessingPermissionForStoreURL:(id)a3 cacheFileExtension:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unsigned int v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSString *v16;
  void *v17;
  int v18;
  int *v19;
  char *v20;
  id os_log;
  BOOL v22;
  NSString *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  _BYTE v31[10];
  __int16 v32;
  char *v33;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("sqlite"), v8));

  v11 = -[MOPersistenceManager _getFileDescriptorForPersistenceStoreFile:](self, "_getFileDescriptorForPersistenceStoreFile:", v10);
  if ((v11 & 0x80000000) != 0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
    v15 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MOPersistenceManager _acquireBackgroundProcessingPermissionForStoreURL:cacheFileExtension:].cold.1((uint64_t)v10, v15);
    goto LABEL_7;
  }
  v12 = -[MOPersistenceManager _acquireBackgroundAssertionForFileDescriptor:](self, "_acquireBackgroundAssertionForFileDescriptor:", v11);
  v13 = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = *__error();
      v19 = __error();
      v20 = strerror(*v19);
      v26 = 138413314;
      v27 = v17;
      v28 = 2112;
      v29 = v7;
      v30 = 1024;
      *(_DWORD *)v31 = v12;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = v18;
      v32 = 2080;
      v33 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@ Fail to acquire background processing assertion for the persistence store file %@ with code error %d and errno %d %s", (uint8_t *)&v26, 0x2Cu);

    }
LABEL_7:
    v22 = 0;
    goto LABEL_8;
  }
  v22 = 1;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v24 = NSStringFromSelector(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = 138412802;
    v27 = v25;
    v28 = 2112;
    v29 = v7;
    v30 = 2112;
    *(_QWORD *)v31 = v8;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%@ Succeed to acquire background processing assertion for the persistence store type %@ and the extension %@", (uint8_t *)&v26, 0x20u);

  }
LABEL_8:

  return v22;
}

- (BOOL)_acquireBackgroundProcessingPermissions
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MOPersistenceManager protectedStoreFilesExtensions](MOPersistenceManager, "protectedStoreFilesExtensions", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[MOPersistenceManager defaultStoresDirectory](MOPersistenceManager, "defaultStoresDirectory"));
        LODWORD(v8) = -[MOPersistenceManager _acquireBackgroundProcessingPermissionForStoreURL:cacheFileExtension:](self, "_acquireBackgroundProcessingPermissionForStoreURL:cacheFileExtension:", v9, v8);

        if (!(_DWORD)v8)
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (NSManagedObjectModel)managedObjectModel
{
  return (NSManagedObjectModel *)objc_getProperty(self, a2, 24, 1);
}

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 32, 1);
}

- (NSURL)modelsDirectory
{
  return self->_modelsDirectory;
}

- (NSURL)storesDirectory
{
  return self->_storesDirectory;
}

- (MODispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_dispatcher, a3);
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_storesDirectory, 0);
  objc_storeStrong((id *)&self->_modelsDirectory, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

- (void)initWithUniverse:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: notifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)initWithUniverse:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, a2, a3, "set up context, %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __48__MOPersistenceManager_registerForNotifications__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Locked status changed %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)onLockStateChangeNotification:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v0, v1, "store is already loaded and available so unregister for lock state change notification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __33__MOPersistenceManager_loadStore__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v0, v1, "load store successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __33__MOPersistenceManager_loadStore__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fail to load store, error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)defaultModelsDirectory
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "resourceURL, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)defaultStoresDirectory
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "storepath, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)getCollectionDate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "couldn't read a valid last collection date.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

+ (void)getBundlingJSONURLWithTrigger:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "No known data dump trigger source.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_acquireBackgroundProcessingPermissionForStoreURL:(uint64_t)a1 cacheFileExtension:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;

  v4 = *__error();
  v5 = 138412546;
  v6 = a1;
  v7 = 1024;
  v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "acquireBackgroundProcessing:Unable to to get the file descriptor for the file %@ with data protection, errno, %{errno}d", (uint8_t *)&v5, 0x12u);
}

@end
