@implementation PLBackgroundMigrationContext

- (PLBackgroundMigrationContext)initWithPathManager:(id)a3 databaseContext:(id)a4 analyticsEventManager:(id)a5
{
  id v10;
  id v11;
  id v12;
  PLBackgroundMigrationContext *v13;
  PLBackgroundMigrationContext *v14;
  id v15;
  id v16;
  uint64_t v17;
  PLLazyObject *lazyModelMigrationHistory;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLModelMigrationContext.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLModelMigrationContext.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("databaseContext"));

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)PLBackgroundMigrationContext;
  v13 = -[PLBackgroundMigrationContext init](&v25, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_pathManager, a3);
    objc_storeStrong((id *)&v14->_databaseContext, a4);
    objc_storeStrong((id *)&v14->_analyticsEventManager, a5);
    v14->_policy = 0;
    v14->_libraryIdentifier = PLMigrationContextWellKnownPhotoLibraryIdentifier(v14->_pathManager);
    v15 = objc_initWeak(&location, v14);

    v16 = objc_alloc(MEMORY[0x1E0D73248]);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __90__PLBackgroundMigrationContext_initWithPathManager_databaseContext_analyticsEventManager___block_invoke;
    v22[3] = &unk_1E36759D8;
    objc_copyWeak(&v23, &location);
    v17 = objc_msgSend(v16, "initWithBlock:", v22);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
    lazyModelMigrationHistory = v14->_lazyModelMigrationHistory;
    v14->_lazyModelMigrationHistory = (PLLazyObject *)v17;

  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[PLLazyObject invalidate](self->_lazyModelMigrationHistory, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PLBackgroundMigrationContext;
  -[PLBackgroundMigrationContext dealloc](&v3, sel_dealloc);
}

- (id)newModelMigrationHistory
{
  PLDatabaseContext *databaseContext;
  objc_class *v3;
  id v4;
  id v5;
  PLModelMigrationHistory *v6;
  void *v7;
  PLModelMigrationHistory *v8;

  databaseContext = self->_databaseContext;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = -[PLDatabaseContext newShortLivedLibraryWithName:](databaseContext, "newShortLivedLibraryWithName:", objc_msgSend(v4, "UTF8String"));

  v6 = [PLModelMigrationHistory alloc];
  objc_msgSend(v5, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PLModelMigrationHistory initWithManagedObjectContext:](v6, "initWithManagedObjectContext:", v7);

  return v8;
}

- (PLModelMigrationHistory)modelMigrationHistory
{
  return (PLModelMigrationHistory *)-[PLLazyObject objectValue](self->_lazyModelMigrationHistory, "objectValue");
}

- (PLDatabaseContext)databaseContext
{
  return self->_databaseContext;
}

- (void)setDatabaseContext:(id)a3
{
  objc_storeStrong((id *)&self->_databaseContext, a3);
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

- (PLGraphCache)graphCache
{
  return (PLGraphCache *)objc_getProperty(self, a2, 56, 1);
}

- (void)setGraphCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphCache, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_analyticsEventManager, 0);
  objc_storeStrong((id *)&self->_databaseContext, 0);
  objc_storeStrong((id *)&self->_lazyModelMigrationHistory, 0);
}

id __90__PLBackgroundMigrationContext_initWithPathManager_databaseContext_analyticsEventManager___block_invoke(uint64_t a1)
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
