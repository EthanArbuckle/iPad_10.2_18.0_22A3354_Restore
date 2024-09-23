@implementation WRM_GenericCoreDataStack

- (WRM_GenericCoreDataStack)initWithModelURL:(id)a3 modelURL:(id)a4
{
  id v6;
  id v7;
  WRM_GenericCoreDataStack *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  WRM_GenericCoreDataStack *v16;
  objc_super v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WRM_GenericCoreDataStack;
  v8 = -[WRM_GenericCoreDataStack init](&v18, "init");
  if (v8)
  {
    v9 = objc_alloc((Class)NSPersistentContainer);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_GenericCoreDataStack managedObjectModel:](v8, "managedObjectModel:", v7));
    v11 = objc_msgSend(v9, "initWithName:managedObjectModel:", CFSTR("CoreDataStore"), v10);
    -[WRM_GenericCoreDataStack setPersistentContainer:](v8, "setPersistentContainer:", v11);

    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("DataStoreManager: persistentContainer initiated with MOM"));
    v12 = objc_msgSend(objc_alloc((Class)NSPersistentStoreDescription), "initWithURL:", v6);
    v19 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_GenericCoreDataStack persistentContainer](v8, "persistentContainer"));
    objc_msgSend(v14, "setPersistentStoreDescriptions:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_GenericCoreDataStack persistentContainer](v8, "persistentContainer"));
    objc_msgSend(v15, "loadPersistentStoresWithCompletionHandler:", &stru_100202A30);

    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("DataStoreManager: persistentContainer created"));
    v16 = v8;
  }

  return v8;
}

- (WRM_GenericCoreDataStack)initWithStoreURL:(id)a3 modelURL:(id)a4
{
  id v6;
  id v7;
  WRM_GenericCoreDataStack *v8;
  WRM_GenericCoreDataStack *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WRM_GenericCoreDataStack;
  v8 = -[WRM_GenericCoreDataStack init](&v11, "init");
  v9 = v8;
  if (v8)
    -[WRM_GenericCoreDataStack setupManagedObjectContext:modelURL:](v8, "setupManagedObjectContext:modelURL:", v6, v7);

  return v9;
}

- (void)setupManagedObjectContext:(id)a3 modelURL:(id)a4
{
  id v6;
  void *v7;
  NSPersistentStoreCoordinator *v8;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  const __CFString *v10;
  NSPersistentStoreCoordinator *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSManagedObjectContext *v16;
  NSManagedObjectContext *private_queue_context;
  id v18;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_GenericCoreDataStack managedObjectModel:](self, "managedObjectModel:", a4));
  v8 = (NSPersistentStoreCoordinator *)objc_msgSend(objc_alloc((Class)NSPersistentStoreCoordinator), "initWithManagedObjectModel:", v7);
  persistentStoreCoordinator = self->persistentStoreCoordinator;
  self->persistentStoreCoordinator = v8;

  if (self->persistentStoreCoordinator)
    v10 = CFSTR("DataStoreManager: persistentStoreCoordinator initialized");
  else
    v10 = CFSTR("DataStoreManager: persistentStoreCoordinator is not initialized");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, v10);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("DataStoreManager: Adding persistentStoreCoordinator"));
  v11 = self->persistentStoreCoordinator;
  v18 = 0;
  v12 = -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v11, "addPersistentStoreWithType:configuration:URL:options:error:", NSSQLiteStoreType, 0, v6, 0, &v18);
  v13 = v18;
  v14 = v13;
  if (v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "description"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("DataStoreManager: error in creating persistent store: %@"), v15);

  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("DataStoreManager: No error in creating persistent store"));
  }
  v16 = (NSManagedObjectContext *)objc_msgSend(objc_alloc((Class)NSManagedObjectContext), "initWithConcurrencyType:", 1);
  private_queue_context = self->private_queue_context;
  self->private_queue_context = v16;

  -[NSManagedObjectContext setPersistentStoreCoordinator:](self->private_queue_context, "setPersistentStoreCoordinator:", self->persistentStoreCoordinator);
}

- (id)managedObjectModel:(id)a3
{
  id v3;
  id v4;
  const __CFString *v5;

  v3 = a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellStationManager: initializing managedObjectModel with the given model URL"));
  v4 = objc_msgSend(objc_alloc((Class)NSManagedObjectModel), "initWithContentsOfURL:", v3);

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellStationManager: No error in initializing managedObjectModel"));
  if (v4)
    v5 = CFSTR("CellStationManager: initialized managedObjectModel with the given model URL");
  else
    v5 = CFSTR("CellStationManager: mom is not initialized");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, v5);
  return v4;
}

- (NSManagedObjectContext)private_queue_context
{
  return self->private_queue_context;
}

- (void)setPrivate_queue_context:(id)a3
{
  objc_storeStrong((id *)&self->private_queue_context, a3);
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->persistentStoreCoordinator;
}

- (void)setPersistentStoreCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->persistentStoreCoordinator, a3);
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void)setPersistentContainer:(id)a3
{
  objc_storeStrong((id *)&self->_persistentContainer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentContainer, 0);
  objc_storeStrong((id *)&self->persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->private_queue_context, 0);
}

@end
