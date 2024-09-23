@implementation TBPersistenceManager

- (NSPersistentStoreCoordinator)persistenceCoordinator
{
  return self->_persistenceCoordinator;
}

- (TBPersistenceManager)initWithManagedObjectModel:(id)a3 storeDescriptor:(id)a4
{
  id v7;
  id v8;
  TBPersistenceManager *v9;
  uint64_t v10;
  NSPersistentStoreCoordinator *persistenceCoordinator;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSPersistentStoreCoordinator *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  TBPersistenceRemoteStoreServer *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  TBPersistenceRemoteStoreServer *remoteStoreServer;
  uint64_t v35;
  objc_super v36;

  v7 = a3;
  v8 = a4;
  v36.receiver = self;
  v36.super_class = (Class)TBPersistenceManager;
  v9 = -[TBPersistenceManager init](&v36, sel_init);
  objc_storeStrong((id *)&v9->_managedObjectModel, a3);
  if (!v9->_managedObjectModel)
  {
    NSLog(CFSTR("%s: NSManagedObjectModel is nil"), "-[TBPersistenceManager initWithManagedObjectModel:storeDescriptor:]");
    goto LABEL_12;
  }
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97C00]), "initWithManagedObjectModel:", v9->_managedObjectModel);
  persistenceCoordinator = v9->_persistenceCoordinator;
  v9->_persistenceCoordinator = (NSPersistentStoreCoordinator *)v10;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storeURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "fileExistsAtPath:", v14) & 1) != 0)
  {
    v15 = objc_opt_class();
    objc_msgSend(v8, "storeURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v15) = objc_msgSend((id)v15, "isStoreCompatibleAtURL:withModel:", v16, v9->_managedObjectModel);

    if ((v15 & 1) != 0)
      goto LABEL_9;
    objc_msgSend(v8, "storeURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: removing incompatible store at URL %@"), "-[TBPersistenceManager initWithManagedObjectModel:storeDescriptor:]", v17);

    v18 = v9->_persistenceCoordinator;
    objc_msgSend(v8, "storeURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "storeDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "type");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "storeOptions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    -[NSPersistentStoreCoordinator destroyPersistentStoreAtURL:withType:options:error:](v18, "destroyPersistentStoreAtURL:withType:options:error:", v19, v21, v22, &v35);
    v23 = v35;

    if (!v23)
      goto LABEL_9;
    objc_msgSend(v8, "storeURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: Failed to store at URL %@"), "-[TBPersistenceManager initWithManagedObjectModel:storeDescriptor:]", v12);
  }
  else
  {

  }
LABEL_9:
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 1);
  objc_msgSend(MEMORY[0x1E0C97BA8], "mergeByPropertyObjectTrumpMergePolicy");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setMergePolicy:", v25);

  objc_msgSend(v24, "setPersistentStoreCoordinator:", v9->_persistenceCoordinator);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "processName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTransactionAuthor:", v27);

  objc_storeStrong((id *)&v9->_persistenceContext, v24);
  if (!objc_msgSend(v8, "type"))
  {
    v28 = [TBPersistenceRemoteStoreServer alloc];
    objc_msgSend(v8, "storeURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "modelURL");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "storeOptions");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[TBPersistenceRemoteStoreServer initWithStoreURL:modelURL:options:](v28, "initWithStoreURL:modelURL:options:", v29, v30, v31);
    remoteStoreServer = v9->_remoteStoreServer;
    v9->_remoteStoreServer = (TBPersistenceRemoteStoreServer *)v32;

    -[TBPersistenceRemoteStoreServer startListening](v9->_remoteStoreServer, "startListening");
    NSLog(CFSTR("%s: initialized remote server %@"), "-[TBPersistenceManager initWithManagedObjectModel:storeDescriptor:]", v9->_remoteStoreServer);
  }

LABEL_12:
  return v9;
}

- (void)addPersistentStorage:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSPersistentStoreCoordinator *persistenceCoordinator;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  persistenceCoordinator = self->_persistenceCoordinator;
  objc_msgSend(a3, "storeDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__TBPersistenceManager_addPersistentStorage_completionHandler___block_invoke;
  v10[3] = &unk_1E881E350;
  v11 = v6;
  v9 = v6;
  -[NSPersistentStoreCoordinator addPersistentStoreWithDescription:completionHandler:](persistenceCoordinator, "addPersistentStoreWithDescription:completionHandler:", v8, v10);

}

+ (BOOL)isStoreCompatibleAtURL:(id)a3 withModel:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  id v12;

  v5 = a4;
  v6 = *MEMORY[0x1E0C979E8];
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C97C00], "metadataForPersistentStoreOfType:URL:options:error:", v6, a3, 0, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  v9 = v8;
  if (v8)
  {
    NSLog(CFSTR("%s: error (%@) retrieving store"), "+[TBPersistenceManager isStoreCompatibleAtURL:withModel:]", v8);
LABEL_7:
    v10 = 0;
    goto LABEL_4;
  }
  if (!v7)
  {
    NSLog(CFSTR("%s: failed to get metadata for store"), "+[TBPersistenceManager isStoreCompatibleAtURL:withModel:]");
    goto LABEL_7;
  }
  v10 = objc_msgSend(v5, "isConfiguration:compatibleWithStoreMetadata:", 0, v7);
LABEL_4:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteStoreServer, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_persistenceCoordinator, 0);
  objc_storeStrong((id *)&self->_persistenceContext, 0);
}

void __63__TBPersistenceManager_addPersistentStorage_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  TBError *v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD);
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = a3;
    NSLog(CFSTR("Error %@ adding persistent store %@"), v5, a2);
    v6 = *MEMORY[0x1E0CB3388];
    v11[0] = *MEMORY[0x1E0CB2D50];
    v11[1] = v6;
    v12[0] = CFSTR("Failed to add persistent store.");
    v12[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = -[TBError initWithType:userInfo:]([TBError alloc], "initWithType:userInfo:", 104, v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void (**)(uint64_t, _QWORD))(v9 + 16);
    v7 = 0;
    v10(v9, 0);
  }

}

- (NSManagedObjectContext)persistenceContext
{
  return self->_persistenceContext;
}

- (void)setPersistenceContext:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceContext, a3);
}

- (void)setPersistenceCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceCoordinator, a3);
}

- (NSManagedObjectModel)managedObjectModel
{
  return self->_managedObjectModel;
}

- (void)setManagedObjectModel:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectModel, a3);
}

- (TBPersistenceRemoteStoreServer)remoteStoreServer
{
  return self->_remoteStoreServer;
}

- (void)setRemoteStoreServer:(id)a3
{
  objc_storeStrong((id *)&self->_remoteStoreServer, a3);
}

@end
