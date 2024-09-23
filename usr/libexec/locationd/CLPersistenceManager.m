@implementation CLPersistenceManager

- (CLPersistenceManager)initWithDefaultDirectories:(BOOL)a3
{
  return -[CLPersistenceManager initWithModelsDirectory:storesDirectory:useCloudKit:](self, "initWithModelsDirectory:storesDirectory:useCloudKit:", +[CLPersistenceManager defaultModelsDirectory](CLPersistenceManager, "defaultModelsDirectory"), +[CLPersistenceManager defaultStoresDirectory](CLPersistenceManager, "defaultStoresDirectory"), a3);
}

- (CLPersistenceManager)initWithModelsDirectory:(id)a3 storesDirectory:(id)a4 useCloudKit:(BOOL)a5
{
  CLPersistenceManager *v10;
  NSManagedObjectModel *v11;
  objc_class *v12;
  uint64_t v13;
  objc_super v15;

  if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CLPersistenceManager.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("modelsDirectory.isFileURL"));
  if ((objc_msgSend(a4, "isFileURL") & 1) == 0)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CLPersistenceManager.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("storesDirectory.isFileURL"));
  if (objc_msgSend(a3, "isFileURL") && objc_msgSend(a4, "isFileURL"))
  {
    self->_useCloudKit = a5;
    v15.receiver = self;
    v15.super_class = (Class)CLPersistenceManager;
    v10 = -[CLPersistenceManager init](&v15, "init");
    if (!v10)
    {
LABEL_16:
      NSLog(CFSTR("CoreData, PersistenceManager initialized with models directory %@ and stores directory %@"), v10->_modelsDirectory, v10->_storesDirectory);
      return v10;
    }
    v10->_modelsDirectory = +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", objc_msgSend(a3, "path"), 1);
    v10->_storesDirectory = +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", objc_msgSend(a4, "path"), 1);
    v11 = (NSManagedObjectModel *)objc_msgSend(objc_alloc((Class)NSManagedObjectModel), "initWithContentsOfURL:", v10->_modelsDirectory);
    v10->_managedObjectModel = v11;
    if (v11)
    {
      NSLog(CFSTR("CoreData, Initialized NSManagedObjectModel from URL: %@"), v10->_modelsDirectory);
      NSLog(CFSTR("CoreData, Loaded ManagedObjectModel Version: %@"), -[NSManagedObjectModel versionIdentifiers](v10->_managedObjectModel, "versionIdentifiers"));
      if (v10->_useCloudKit)
      {
        v12 = (objc_class *)objc_msgSend(objc_alloc((Class)NSPersistentCloudKitContainer), "initWithName:managedObjectModel:", CFSTR("CoreLocation"), v10->_managedObjectModel);
        v13 = 56;
      }
      else
      {
        v12 = (objc_class *)objc_msgSend(objc_alloc((Class)NSPersistentStoreCoordinator), "initWithManagedObjectModel:", v10->_managedObjectModel);
        v13 = 40;
      }
      *(Class *)((char *)&v10->super.isa + v13) = v12;
      v10->_lock._os_unfair_lock_opaque = 0;
      goto LABEL_16;
    }
    NSLog(CFSTR("CoreData, Failed to initialize persistence model from URL: %@"), v10->_modelsDirectory);
  }
  return 0;
}

- (void)initializeCloudKitSchema
{
  uint64_t v2;

  v2 = 0;
  if (-[NSPersistentCloudKitContainer initializeCloudKitSchemaWithOptions:error:](self->_persistentCloudKitContainer, "initializeCloudKitSchemaWithOptions:error:", 0, &v2))
  {
    NSLog(CFSTR("CoreData+CloudKit, initializeCloudKitSchema, Successfully initialized CloudKit schema!"));
  }
  else
  {
    NSLog(CFSTR("CoreData+CloudKit, initializeCloudKitSchema, Failed to initialize CloudKit schema: %@"), v2);
  }
}

+ (id)getStoreURLFromDirectory:(id)a3
{
  return _objc_msgSend(objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("CoreData")), "URLByAppendingPathExtension:", CFSTR("sqlite"));
}

- (BOOL)connectToStore
{
  os_unfair_lock_s *p_lock;
  unsigned __int8 v4;
  CLPersistenceStore *v5;
  id v6;
  NSPersistentCloudKitContainer *persistentCloudKitContainer;
  NSPersistentCloudKitContainer *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  id v15;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[CLPersistenceManager _isStoreConnected](self, "_isStoreConnected"))
  {
    v4 = 1;
  }
  else
  {
    v5 = -[CLPersistenceStore initWithURL:useCloudKit:]([CLPersistenceStore alloc], "initWithURL:useCloudKit:", +[CLPersistenceManager getStoreURLFromDirectory:](CLPersistenceManager, "getStoreURLFromDirectory:", self->_storesDirectory), self->_useCloudKit);
    self->_persistenceStore = v5;
    if (self->_useCloudKit)
    {
      v6 = -[CLPersistenceStore persistentStoreDescription](v5, "persistentStoreDescription");
      persistentCloudKitContainer = self->_persistentCloudKitContainer;
      v15 = v6;
      -[NSPersistentCloudKitContainer setPersistentStoreDescriptions:](persistentCloudKitContainer, "setPersistentStoreDescriptions:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
      v11 = 0;
      v12 = &v11;
      v13 = 0x2020000000;
      v14 = 0;
      v8 = self->_persistentCloudKitContainer;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10102205C;
      v10[3] = &unk_102199FD8;
      v10[4] = &v11;
      -[NSPersistentCloudKitContainer loadPersistentStoresWithCompletionHandler:](v8, "loadPersistentStoresWithCompletionHandler:", v10);
      v4 = *((_BYTE *)v12 + 24) != 0;
      _Block_object_dispose(&v11, 8);
    }
    else
    {
      v4 = -[CLPersistenceStore loadWithCoordinator:](v5, "loadWithCoordinator:", self->_persistentStoreCoordinator);
    }
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)disconnectFromStore
{
  os_unfair_lock_s *p_lock;
  NSPersistentCloudKitContainer *persistentCloudKitContainer;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  unsigned int v6;
  id v7;
  id v8;
  uint64_t v10;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[CLPersistenceManager _isStoreConnected](self, "_isStoreConnected"))
  {
    persistentCloudKitContainer = self->_persistentCloudKitContainer;
    if (persistentCloudKitContainer)
    {
      persistentStoreCoordinator = (NSPersistentStoreCoordinator *)-[NSPersistentCloudKitContainer persistentStoreCoordinator](persistentCloudKitContainer, "persistentStoreCoordinator");
      self->_persistentStoreCoordinator = persistentStoreCoordinator;
    }
    else
    {
      persistentStoreCoordinator = self->_persistentStoreCoordinator;
    }
    v10 = 0;
    v7 = -[NSArray firstObject](-[NSPersistentStoreCoordinator persistentStores](persistentStoreCoordinator, "persistentStores"), "firstObject");
    -[NSPersistentStoreCoordinator removePersistentStore:error:](self->_persistentStoreCoordinator, "removePersistentStore:error:", v7, &v10);
    if (v10)
    {
      v8 = objc_msgSend(v7, "URL");
      NSLog(CFSTR("Failed to disconnect from store %@ with error %@"), v8, v10);
    }
    v6 = !-[CLPersistenceManager _isStoreConnected](self, "_isStoreConnected");
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)createManagedObjectContext
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!-[CLPersistenceManager _isStoreConnected](self, "_isStoreConnected"))
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CLPersistenceManager.m"), 185, CFSTR("Unable to create managed object context since no store is connected"));
    goto LABEL_5;
  }
  v5 = objc_msgSend(objc_alloc((Class)NSManagedObjectContext), "initWithConcurrencyType:", 1);
  objc_msgSend(v5, "setMergePolicy:", +[NSMergePolicy errorMergePolicy](NSMergePolicy, "errorMergePolicy"));
  objc_msgSend(v5, "setPersistentStoreCoordinator:", -[CLPersistenceManager persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  objc_msgSend(v5, "setName:", -[NSProcessInfo processName](+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"), "processName"));
  objc_msgSend(v5, "setTransactionAuthor:", objc_msgSend(v5, "name"));
  objc_msgSend(v5, "setUndoManager:", 0);
  if (!v5)
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CLPersistenceManager.m"), 207, CFSTR("Failed to create a valid managed object context."));
LABEL_5:
    v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

+ (id)defaultModelsDirectory
{
  NSBundle *v4;
  NSString *v5;

  v4 = +[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.corelocation"));
  NSLog(CFSTR("coreLocationFrameworkBundle: %@"), v4);
  v5 = -[NSBundle pathForResource:ofType:](v4, "pathForResource:ofType:", CFSTR("CoreLocationCoreDataModel"), CFSTR("momd"));
  if (!v5)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CLPersistenceManager.m"), 224, CFSTR("Failed to find models directory!"));
  return +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v5, 1);
}

+ (id)defaultStoresDirectory
{
  uint64_t v4;

  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", CFSTR("/var/root/Library/Caches/locationd")))
  {
    return +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", CFSTR("/var/root/Library/Caches/locationd"), 1);
  }
  v4 = 0;
  if (-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/root/Library/Caches/locationd"), 1, 0, &v4)&& v4 == 0)
  {
    return +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", CFSTR("/var/root/Library/Caches/locationd"), 1);
  }
  NSLog(CFSTR("CoreData, Failed to create %@, error, %@"), CFSTR("/var/root/Library/Caches/locationd"), v4);
  return 0;
}

+ (void)deleteStoreFile:(id)a3
{
  BOOL v4;
  uint64_t v5;

  if (a3)
  {
    if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", a3))
    {
      v5 = 0;
      if (-[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", a3, &v5))
      {
        v4 = v5 == 0;
      }
      else
      {
        v4 = 0;
      }
      if (v4)
        NSLog(CFSTR("CoreData, successfully deleted store file %@"), a3);
      else
        NSLog(CFSTR("CoreData, failed to delete store file %@, error, %@"), a3, v5);
    }
    else
    {
      NSLog(CFSTR("CoreData, skip deleting store file %@ as it does not exist"), a3);
    }
  }
}

+ (void)deleteDefaultStoreFileFromDisk
{
  id v3;
  id v4;

  v3 = +[CLPersistenceManager getStoreURLFromDirectory:](CLPersistenceManager, "getStoreURLFromDirectory:", +[CLPersistenceManager defaultStoresDirectory](CLPersistenceManager, "defaultStoresDirectory"));
  if (v3)
  {
    v4 = objc_msgSend(v3, "path");
    objc_msgSend(a1, "deleteStoreFile:", v4);
    objc_msgSend(a1, "deleteStoreFile:", objc_msgSend(v4, "stringByAppendingString:", CFSTR("-shm")));
    objc_msgSend(a1, "deleteStoreFile:", objc_msgSend(v4, "stringByAppendingString:", CFSTR("-wal")));
  }
}

- (BOOL)_isStoreConnected
{
  NSPersistentCloudKitContainer *persistentCloudKitContainer;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;

  persistentCloudKitContainer = self->_persistentCloudKitContainer;
  if (persistentCloudKitContainer)
  {
    persistentStoreCoordinator = (NSPersistentStoreCoordinator *)-[NSPersistentCloudKitContainer persistentStoreCoordinator](persistentCloudKitContainer, "persistentStoreCoordinator");
    self->_persistentStoreCoordinator = persistentStoreCoordinator;
  }
  else
  {
    persistentStoreCoordinator = self->_persistentStoreCoordinator;
  }
  return -[NSArray count](-[NSPersistentStoreCoordinator persistentStores](persistentStoreCoordinator, "persistentStores"), "count") != 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLPersistenceManager;
  -[CLPersistenceManager dealloc](&v3, "dealloc");
}

- (NSManagedObjectModel)managedObjectModel
{
  return self->_managedObjectModel;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (void)setPersistentStoreCoordinator:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (CLPersistenceStore)persistenceStore
{
  return self->_persistenceStore;
}

- (void)setPersistenceStore:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSPersistentCloudKitContainer)persistentCloudKitContainer
{
  return self->_persistentCloudKitContainer;
}

- (void)setPersistentCloudKitContainer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (BOOL)useCloudKit
{
  return self->_useCloudKit;
}

- (void)setUseCloudKit:(BOOL)a3
{
  self->_useCloudKit = a3;
}

@end
