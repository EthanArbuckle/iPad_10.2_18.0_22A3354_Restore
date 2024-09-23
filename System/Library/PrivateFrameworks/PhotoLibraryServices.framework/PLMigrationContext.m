@implementation PLMigrationContext

- (PLMigrationContext)initWithPathManager:(id)a3 coordinator:(id)a4 onStore:(id)a5 orStoreURL:(id)a6 version:(unsigned __int16)a7 options:(id)a8 migrationPolicy:(unsigned int)a9 analyticsEventManager:(id)a10 graphCache:(id)a11
{
  id v17;
  id v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  PLMigrationContext *v22;
  PLMigrationContext *v23;
  PLMigrationContext *v24;
  void *v25;
  uint64_t v26;
  NSURL *storeURL;
  uint64_t v28;
  NSDictionary *options;
  id v30;
  id v31;
  uint64_t v32;
  PLLazyObject *lazyModelMigrationHistory;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id obj;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id location;
  objc_super v47;

  v17 = a3;
  v18 = a4;
  obj = a5;
  v19 = (unint64_t)a5;
  v20 = (unint64_t)a6;
  v21 = a8;
  v22 = self;
  v43 = a10;
  v42 = a11;
  if (v17)
  {
    if (v18)
      goto LABEL_3;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLModelMigrationContext.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coordinator"));

    if (v21)
      goto LABEL_4;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLModelMigrationContext.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

  if (!v18)
    goto LABEL_14;
LABEL_3:
  if (v21)
    goto LABEL_4;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, v22, CFSTR("PLModelMigrationContext.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

LABEL_4:
  if (!(v19 | v20))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, v22, CFSTR("PLModelMigrationContext.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceStore || storeURL"));

  }
  v47.receiver = v22;
  v47.super_class = (Class)PLMigrationContext;
  v23 = -[PLMigrationContext init](&v47, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_pathManager, a3);
    objc_storeStrong((id *)&v24->_coordinator, a4);
    objc_storeStrong((id *)&v24->_store, obj);
    v25 = (void *)v20;
    if (!v20)
    {
      objc_msgSend((id)v19, "URL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v26 = objc_msgSend(v25, "copy");
    storeURL = v24->_storeURL;
    v24->_storeURL = (NSURL *)v26;

    if (!v20)
    v24->_previousStoreVersion = a7;
    v28 = objc_msgSend(v21, "copy");
    options = v24->_options;
    v24->_options = (NSDictionary *)v28;

    v24->_policy = a9;
    objc_storeStrong((id *)&v24->_analyticsEventManager, a10);
    v24->_libraryIdentifier = PLMigrationContextWellKnownPhotoLibraryIdentifier(v24->_pathManager);
    v30 = objc_initWeak(&location, v24);

    v31 = objc_alloc(MEMORY[0x1E0D73248]);
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __138__PLMigrationContext_initWithPathManager_coordinator_onStore_orStoreURL_version_options_migrationPolicy_analyticsEventManager_graphCache___block_invoke;
    v44[3] = &unk_1E36759D8;
    objc_copyWeak(&v45, &location);
    v32 = objc_msgSend(v31, "initWithBlock:", v44);
    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);
    lazyModelMigrationHistory = v24->_lazyModelMigrationHistory;
    v24->_lazyModelMigrationHistory = (PLLazyObject *)v32;

    objc_storeStrong((id *)&v24->_graphCache, a11);
  }

  return v24;
}

- (void)dealloc
{
  objc_super v3;

  -[PLLazyObject invalidate](self->_lazyModelMigrationHistory, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PLMigrationContext;
  -[PLMigrationContext dealloc](&v3, sel_dealloc);
}

- (id)newModelMigrationHistory
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PLModelMigrationHistory *v9;

  -[PLMigrationContext coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMigrationContext pathManager](self, "pathManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMigrationContext graphCache](self, "graphCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLManagedObjectContextForMigrationActionWithCoordinator(v3, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PLModelMigrationHistory initWithManagedObjectContext:]([PLModelMigrationHistory alloc], "initWithManagedObjectContext:", v8);
  return v9;
}

- (PLModelMigrationHistory)modelMigrationHistory
{
  return (PLModelMigrationHistory *)-[PLLazyObject objectValue](self->_lazyModelMigrationHistory, "objectValue");
}

- (NSPersistentStoreCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_coordinator, a3);
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (void)setStoreURL:(id)a3
{
  objc_storeStrong((id *)&self->_storeURL, a3);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (NSPersistentStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (unsigned)previousStoreVersion
{
  return self->_previousStoreVersion;
}

- (void)setPreviousStoreVersion:(unsigned __int16)a3
{
  self->_previousStoreVersion = a3;
}

- (PLCoreAnalyticsEventManager)analyticsEventManager
{
  return self->_analyticsEventManager;
}

- (void)setAnalyticsEventManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsEventManager, a3);
}

- (PLPhotoLibraryPathManager)pathManager
{
  return self->_pathManager;
}

- (void)setPathManager:(id)a3
{
  objc_storeStrong((id *)&self->_pathManager, a3);
}

- (PLGraphCache)graphCache
{
  return (PLGraphCache *)objc_getProperty(self, a2, 72, 1);
}

- (void)setGraphCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (unsigned)policy
{
  return self->_policy;
}

- (void)setPolicy:(unsigned int)a3
{
  self->_policy = a3;
}

- (int64_t)libraryIdentifier
{
  return self->_libraryIdentifier;
}

- (void)setLibraryIdentifier:(int64_t)a3
{
  self->_libraryIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphCache, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_analyticsEventManager, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_lazyModelMigrationHistory, 0);
}

id __138__PLMigrationContext_initWithPathManager_coordinator_onStore_orStoreURL_version_options_migrationPolicy_analyticsEventManager_graphCache___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newModelMigrationHistory");
  else
    v3 = 0;

  return v3;
}

@end
