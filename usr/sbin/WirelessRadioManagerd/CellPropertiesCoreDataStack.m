@implementation CellPropertiesCoreDataStack

- (void)setupManagedObjectContext:(id)a3 modelURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSPersistentStoreCoordinator *v9;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  const __CFString *v11;
  NSPersistentStoreCoordinator *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSManagedObjectContext *v17;
  NSManagedObjectContext *private_queue_context;
  id v19;
  NSString *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CellPropertiesCoreDataStack managedObjectModel:](self, "managedObjectModel:", v7));
  v9 = (NSPersistentStoreCoordinator *)objc_msgSend(objc_alloc((Class)NSPersistentStoreCoordinator), "initWithManagedObjectModel:", v8);
  persistentStoreCoordinator = self->persistentStoreCoordinator;
  self->persistentStoreCoordinator = v9;

  if (self->persistentStoreCoordinator)
    v11 = CFSTR("CellStationManager: persistentStoreCoordinator initialized");
  else
    v11 = CFSTR("CellStationManager: persistentStoreCoordinator is not initialized");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, v11);
  v12 = self->persistentStoreCoordinator;
  v20 = NSReadOnlyPersistentStoreOption;
  v21 = &__kCFBooleanTrue;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
  v19 = 0;
  v14 = -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v12, "addPersistentStoreWithType:configuration:URL:options:error:", NSSQLiteStoreType, 0, v6, v13, &v19);
  v15 = v19;

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "description"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellStationManager: error in creating persistent store: %@"), v16);

  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellStationManager: No error in creating persistent store"));
  }
  v17 = (NSManagedObjectContext *)objc_msgSend(objc_alloc((Class)NSManagedObjectContext), "initWithConcurrencyType:", 1);
  private_queue_context = self->private_queue_context;
  self->private_queue_context = v17;

  -[NSManagedObjectContext setPersistentStoreCoordinator:](self->private_queue_context, "setPersistentStoreCoordinator:", self->persistentStoreCoordinator);
}

- (NSManagedObjectContext)private_queue_context
{
  return self->private_queue_context;
}

- (id)managedObjectModel:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellStationManager: initializing managedObjectModel with the given model URL"));
  v4 = objc_msgSend(objc_alloc((Class)NSManagedObjectModel), "initWithContentsOfURL:", v3);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellStationManager: No error in initializing managedObjectModel"));
  if (v4)
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellStationManager: initialized managedObjectModel with the given model URL"));
  else
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellStationManager: mom is not initialized"));

  return v4;
}

- (CellPropertiesCoreDataStack)initWithStoreURL:(id)a3 modelURL:(id)a4
{
  id v6;
  id v7;
  CellPropertiesCoreDataStack *v8;
  CellPropertiesCoreDataStack *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CellPropertiesCoreDataStack;
  v8 = -[CellPropertiesCoreDataStack init](&v11, "init");
  v9 = v8;
  if (v8)
    -[CellPropertiesCoreDataStack setupManagedObjectContext:modelURL:](v8, "setupManagedObjectContext:modelURL:", v6, v7);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->private_queue_context, 0);
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

@end
