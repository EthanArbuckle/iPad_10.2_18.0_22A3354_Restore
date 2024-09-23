@implementation PLMomentGenerationDataManager

- (PLMomentGenerationDataManager)initWithManagedObjectContext:(id)a3 pathManagerForLightweightMigration:(id)a4
{
  id v6;
  id v7;
  PLMomentGenerationDataManager *v8;
  id v9;
  void *v10;
  PLMomentGenerationDataManager *v11;
  PLMomentGeneration *v12;
  void *v13;
  uint64_t v14;
  PLMomentGeneration *generator;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PLMomentGenerationDataManager;
  v8 = -[PLMomentGenerationDataManager init](&v17, sel_init);
  if (!PLPlatformMomentsSupported())
  {
    v11 = v8;
    v8 = 0;
LABEL_8:

    goto LABEL_9;
  }
  if (v8)
  {
    -[PLMomentGenerationDataManager _initIsolationQueue](v8, "_initIsolationQueue");
    v8->_isLightweightMigrationManager = 1;
    v8->_lightweightMigrationLock._os_unfair_lock_opaque = 0;
    -[PLMomentGenerationDataManager setMomentGenerationLibrary:](v8, "setMomentGenerationLibrary:", 0);
    -[PLMomentGenerationDataManager setManagedObjectContext:](v8, "setManagedObjectContext:", v6);
    objc_opt_class();
    v9 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    v12 = [PLMomentGeneration alloc];
    -[PLMomentGenerationDataManager pl_libraryBundle](v11, "pl_libraryBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PLMomentGeneration initWithMomentGenerationDataManager:bundle:](v12, "initWithMomentGenerationDataManager:bundle:", v8, v13);
    generator = v8->_generator;
    v8->_generator = (PLMomentGeneration *)v14;

    objc_storeStrong((id *)&v8->_lightWeightMigrationPathManager, a4);
    -[PLMomentGenerationDataManager _finalizeInit](v8, "_finalizeInit");
    goto LABEL_8;
  }
LABEL_9:

  return v8;
}

- (PLMomentGenerationDataManager)initWithLibraryServicesManager:(id)a3
{
  id v4;
  PLMomentGenerationDataManager *v5;
  PLMomentGeneration *v6;
  void *v7;
  uint64_t v8;
  PLMomentGeneration *generator;
  PLRoutineService *v10;
  PLRoutineService *routineManager;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLMomentGenerationDataManager;
  v5 = -[PLMomentGenerationDataManager init](&v13, sel_init);
  if ((PLPlatformMomentsSupported() & 1) != 0)
  {
    if (v5)
    {
      -[PLMomentGenerationDataManager _initIsolationQueue](v5, "_initIsolationQueue");
      objc_storeWeak((id *)&v5->_libraryServicesManager, v4);
      -[PLMomentGenerationDataManager reloadGenerationOptions](v5, "reloadGenerationOptions");
      v6 = [PLMomentGeneration alloc];
      objc_msgSend(v4, "libraryBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PLMomentGeneration initWithMomentGenerationDataManager:bundle:](v6, "initWithMomentGenerationDataManager:bundle:", v5, v7);
      generator = v5->_generator;
      v5->_generator = (PLMomentGeneration *)v8;

      v10 = -[PLRoutineService initWithFetchDateInterval:]([PLRoutineService alloc], "initWithFetchDateInterval:", 0);
      routineManager = v5->_routineManager;
      v5->_routineManager = v10;

      -[PLMomentGenerationDataManager _finalizeInit](v5, "_finalizeInit");
    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (void)_initIsolationQueue
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *isolationQueue;
  id v5;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  pl_dispatch_queue_create_with_fallback_qos();
  v3 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  isolationQueue = self->_isolationQueue;
  self->_isolationQueue = v3;

}

- (void)_finalizeInit
{
  void *v3;
  void *v4;
  void *v5;
  PLCameraAppWatcher *v6;
  PLCameraAppWatcher *cameraWatcher;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_shouldPerformLightweightValidation = objc_msgSend(v3, "BOOLForKey:", CFSTR("com.apple.photos.validation.performLightweightValidation"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_previousValidatedModelVersion = objc_msgSend(v4, "integerForKey:", CFSTR("com.apple.photos.validation.previousValidatedModelVersion"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_previousValidationSucceeded = objc_msgSend(v5, "BOOLForKey:", CFSTR("com.apple.photos.validation.previousValidationSucceeded"));

  v6 = objc_alloc_init(PLCameraAppWatcher);
  cameraWatcher = self->_cameraWatcher;
  self->_cameraWatcher = v6;

}

- (void)reloadGenerationOptions
{
  id v3;
  void *v4;
  NSDictionary *v5;
  NSDictionary *generationOptions;
  id v7;

  if (PLIsAssetsd())
  {
    if (MEMORY[0x19AEC04BC]())
    {
      v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
      objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("/Library/Preferences/com.apple.mobileslideshow"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v3, "initWithSuiteName:", v4);

      objc_msgSend(v7, "objectForKey:", CFSTR("MomentGenerationOptionsDictionary"));
      v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      generationOptions = self->_generationOptions;
      self->_generationOptions = v5;

    }
  }
}

- (id)generator
{
  return self->_generator;
}

- (void)invalidateAllHighlightSubtitles
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C97AB0]);
  +[PLPhotosHighlight entity](PLPhotosHighlight, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithEntity:", v4);

  v17 = CFSTR("subtitle");
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPropertiesToUpdate:", v7);

  objc_msgSend(v5, "setResultType:", 2);
  -[PLMomentGenerationDataManager momentGenerationLibrary](self, "momentGenerationLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v9, "executeRequest:error:", v5, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v14;

  PLMomentsGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "result");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v13;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Invalidate all titles for %@ Highlights", buf, 0xCu);

  }
}

- (PLPhotoLibrary)momentGenerationLibrary
{
  PLLibraryServicesManager **p_libraryServicesManager;
  id WeakRetained;
  PLMomentGenerationDataManager *v6;
  id v7;
  void *v8;
  uint64_t v9;
  PLPhotoLibrary *momentGenerationLibrary;
  PLPhotoLibrary *v11;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  if ((PLPlatformMomentsSupported() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLMomentGenerationDataManager.m"), 177, CFSTR("Unsupported platform"));

  }
  if (self->_isLightweightMigrationManager)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLMomentGenerationDataManager.m"), 178, CFSTR("Moment Generation attempted to set up a photolibrary during lightweight migration"));

  }
  p_libraryServicesManager = &self->_libraryServicesManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);

  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLMomentGenerationDataManager.m"), 179, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_libraryServicesManager"));

  }
  v6 = self;
  objc_sync_enter(v6);
  if (!v6->_momentGenerationLibrary)
  {
    v7 = objc_loadWeakRetained((id *)p_libraryServicesManager);
    objc_msgSend(v7, "databaseContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "momentLibrary");
    v9 = objc_claimAutoreleasedReturnValue();
    momentGenerationLibrary = v6->_momentGenerationLibrary;
    v6->_momentGenerationLibrary = (PLPhotoLibrary *)v9;

    v11 = v6->_momentGenerationLibrary;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __56__PLMomentGenerationDataManager_momentGenerationLibrary__block_invoke;
    v16[3] = &unk_1E3677AA0;
    v16[4] = v6;
    -[PLPhotoLibrary performBlockAndWait:](v11, "performBlockAndWait:", v16);
  }
  objc_sync_exit(v6);

  return v6->_momentGenerationLibrary;
}

- (NSManagedObjectContext)managedObjectContext
{
  NSManagedObjectContext *managedObjectContext;
  NSManagedObjectContext *v3;
  void *v4;

  managedObjectContext = self->_managedObjectContext;
  if (managedObjectContext)
  {
    v3 = managedObjectContext;
  }
  else
  {
    -[PLMomentGenerationDataManager momentGenerationLibrary](self, "momentGenerationLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
    v3 = (NSManagedObjectContext *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)performBlock:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5
{
  -[PLMomentGenerationDataManager performBlock:synchronously:priority:completionHandler:](self, "performBlock:synchronously:priority:completionHandler:", a3, a4, 1, a5);
}

- (void)performBlock:(id)a3 synchronously:(BOOL)a4 priority:(int64_t)a5 completionHandler:(id)a6
{
  _BOOL4 v8;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void (**v13)(_QWORD);

  v8 = a4;
  v13 = (void (**)(_QWORD))a3;
  v10 = (void (**)(_QWORD))a6;
  if (self->_isLightweightMigrationManager)
  {
    os_unfair_lock_lock(&self->_lightweightMigrationLock);
    if (v13)
      v13[2](v13);
    if (v10)
      v10[2](v10);
    os_unfair_lock_unlock(&self->_lightweightMigrationLock);
  }
  else
  {
    -[PLMomentGenerationDataManager momentGenerationLibrary](self, "momentGenerationLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v8)
      objc_msgSend(v11, "performBlockAndWait:completionHandler:", v13, v10);
    else
      objc_msgSend(v11, "performBlock:completionHandler:withPriority:", v13, v10, a5);

  }
}

- (void)performDataTransaction:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5
{
  -[PLMomentGenerationDataManager performDataTransaction:synchronously:priority:completionHandler:](self, "performDataTransaction:synchronously:priority:completionHandler:", a3, a4, 1, a5);
}

- (void)performDataTransaction:(id)a3 synchronously:(BOOL)a4 priority:(int64_t)a5 completionHandler:(id)a6
{
  _BOOL4 v8;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void (**v13)(_QWORD);

  v8 = a4;
  v13 = (void (**)(_QWORD))a3;
  v10 = (void (**)(_QWORD))a6;
  if (self->_isLightweightMigrationManager)
  {
    os_unfair_lock_lock(&self->_lightweightMigrationLock);
    if (v13)
      v13[2](v13);
    -[PLMomentGenerationDataManager save:](self, "save:", 0);
    -[PLMomentGenerationDataManager refreshAllObjects](self, "refreshAllObjects");
    if (v10)
      v10[2](v10);
    os_unfair_lock_unlock(&self->_lightweightMigrationLock);
  }
  else
  {
    -[PLMomentGenerationDataManager momentGenerationLibrary](self, "momentGenerationLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v8)
      objc_msgSend(v11, "performTransactionAndWait:completionHandler:", v13, v10);
    else
      objc_msgSend(v11, "performTransaction:completionHandler:withPriority:", v13, v10, a5);

  }
}

- (id)insertedObjects
{
  void *v2;
  void *v3;

  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)updatedObjects
{
  void *v2;
  void *v3;

  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updatedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)deletedObjects
{
  void *v2;
  void *v3;

  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deletedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)assetWithUniqueID:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v11;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLMomentGenerationDataManager.m"), 283, CFSTR("Must get object with NSManagedObjectID"));

  }
  v7 = v6;
  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset assetWithObjectID:inManagedObjectContext:](PLManagedAsset, "assetWithObjectID:inManagedObjectContext:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)assetsWithUniqueIDs:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C97B48];
  v7 = a3;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);
  v11 = objc_msgSend(v7, "count");

  if (v11 >= 0x65)
    objc_msgSend(v9, "setFetchBatchSize:", 100);
  objc_msgSend(v9, "setReturnsObjectsAsFaults:", 0);
  v16[0] = CFSTR("moment");
  v16[1] = CFSTR("additionalAttributes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRelationshipKeyPathsForPrefetching:", v12);

  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "executeFetchRequest:error:", v9, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)momentWithUniqueID:(id)a3 error:(id *)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLMomentGenerationDataManager.m"), 309, CFSTR("Must get object with NSManagedObjectID"));

  }
  v8 = v7;
  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "existingObjectWithID:error:", v8, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)momentsWithUniqueIDs:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)MEMORY[0x1E0C97B48];
    +[PLMoment entityName](PLMoment, "entityName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPredicate:", v10);
    if ((unint64_t)objc_msgSend(v6, "count") >= 0x65)
      objc_msgSend(v9, "setFetchBatchSize:", 100);
    objc_msgSend(v9, "setReturnsObjectsAsFaults:", 0);
    -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "executeFetchRequest:error:", v9, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (id)momentsForAssetsWithUniqueIDs:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)MEMORY[0x1E0C97B48];
    +[PLMoment entityName](PLMoment, "entityName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY assets IN %@"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPredicate:", v10);
    if ((unint64_t)objc_msgSend(v6, "count") >= 0x65)
      objc_msgSend(v9, "setFetchBatchSize:", 100);
    objc_msgSend(v9, "setReturnsObjectsAsFaults:", 0);
    -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "executeFetchRequest:error:", v9, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (void)refreshAllObjects
{
  id v2;

  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshAllObjects");

}

- (BOOL)hasChanges
{
  void *v2;
  char v3;

  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasChanges");

  return v3;
}

- (Class)momentDataClass
{
  return (Class)objc_opt_class();
}

- (Class)momentAssetDataClass
{
  return (Class)objc_opt_class();
}

- (BOOL)save:(id *)a3
{
  void *v4;
  int v5;

  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "save:", a3);
  if (v5)
    objc_msgSend(v4, "refreshAllObjects");

  return v5;
}

- (void)resetOnFailure
{
  id v2;

  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

}

- (unint64_t)hardGenerationBatchSizeLimit
{
  return 1000;
}

- (NSDictionary)generationOptions
{
  NSDictionary *v3;

  if (MEMORY[0x19AEC04BC](self, a2))
    v3 = self->_generationOptions;
  else
    v3 = 0;
  return v3;
}

- (id)fetchNeighborHighlightItemsForHighlightItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  uint64_t v36;
  PLMomentGenerationDataManager *v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  id v45;
  _QWORD v46[3];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    v21 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v38 = v4;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v8)
  {
    v9 = v8;
    v37 = self;
    v10 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v12, "startDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "earlierDate:", v5);
          v15 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v15;
        }
        objc_msgSend(v12, "endDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "laterDate:", v6);
          v18 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v18;
        }
        v19 = objc_msgSend(v12, "kind");

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    }
    while (v9);

    if (v19)
    {
      v20 = &PLYearGroupingRuleTimeIntervalForNeighbors;
      self = v37;
      goto LABEL_19;
    }
    self = v37;
  }
  else
  {

  }
  v19 = 0;
  v20 = &PLMonthGroupingRuleTimeIntervalForNeighbors;
LABEL_19:
  v22 = *(double *)v20;
  v23 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v5, "dateByAddingTimeInterval:", -*(double *)v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "predicateWithFormat:", CFSTR("startDate >= %@"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v6, "dateByAddingTimeInterval:", v22);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "predicateWithFormat:", CFSTR("endDate <= %@"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19 - 1 < 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind = %d"), v19, v36);
  }
  else
  {
    if (v19 && v19 != 3)
    {
      v29 = 0;
      goto LABEL_25;
    }
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind = %d || kind = %d"), 0, 3);
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:
  v30 = (void *)MEMORY[0x1E0CB3528];
  v46[0] = v25;
  v46[1] = v28;
  v46[2] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "andPredicateWithSubpredicates:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0;
  -[PLMomentGenerationDataManager allPhotosHighlightsWithPredicate:error:](self, "allPhotosHighlightsWithPredicate:error:", v32, &v39);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v39;
  if (v33)
  {
    PLMomentsGetLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v33;
      _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "Error fetching child highlight: %@", buf, 0xCu);
    }

  }
  v4 = v38;
LABEL_30:

  return v21;
}

- (id)fetchChildHighlightItemsForHighlightItem:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "childPhotosHighlights");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)fetchParentHighlightItemsForHighlightItems:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "parentPhotosHighlight", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_networkReachabilityDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CFA300]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__28166;
  v15 = __Block_byref_object_dispose__28167;
  v16 = 0;
  _networkReachabilityQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__PLMomentGenerationDataManager__networkReachabilityDidChange___block_invoke;
  v10[3] = &unk_1E3677C68;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(v8, v10);

  v9 = v12[5];
  if (v9)
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v7);
  _Block_object_dispose(&v11, 8);

}

- (CNContactStore)_contactStore
{
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!self->_contactStore
    && (unint64_t)(objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) - 1) <= 1)
  {
    PLBackendGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "We should never attempt to access the contact store when it isn't authorized. %@", (uint8_t *)&v6, 0xCu);

    }
  }
  return self->_contactStore;
}

- (id)_currentHomeAddressDictionary
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  _BYTE v22[128];
  _QWORD v23[3];

  v23[1] = *MEMORY[0x1E0C80C00];
  -[PLMomentGenerationDataManager _contactStore](self, "_contactStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = *MEMORY[0x1E0C967F0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v2, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v3, &v21);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v21;

  if (v4)
  {
    objc_msgSend(v4, "postalAddresses");
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      v10 = *MEMORY[0x1E0C96FF8];
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v12, "label", (_QWORD)v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isEqualToString:", v10))
          {
            objc_msgSend(v12, "value");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "dictionaryRepresentation");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_12;
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v8)
          continue;
        break;
      }
    }
    v14 = 0;
LABEL_12:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_highlightRelationshipsToPrefetchForHighlightKind:(unsigned __int16)a3
{
  void *v3;
  const __CFString **v4;
  uint64_t v5;
  id result;
  const __CFString *v7;
  _QWORD v8[2];
  _QWORD v9[6];
  _QWORD v10[8];

  v10[7] = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0u:
      v10[0] = CFSTR("parentPhotosHighlight");
      v10[1] = CFSTR("assets");
      v10[2] = CFSTR("assets.additionalAttributes");
      v10[3] = CFSTR("summaryAssets");
      v10[4] = CFSTR("extendedAssets");
      v10[5] = CFSTR("moments");
      v10[6] = CFSTR("parentDayGroupPhotosHighlight");
      v3 = (void *)MEMORY[0x1E0C99D20];
      v4 = (const __CFString **)v10;
      v5 = 7;
      goto LABEL_7;
    case 1u:
      v8[0] = CFSTR("parentPhotosHighlight");
      v8[1] = CFSTR("childPhotosHighlights");
      v3 = (void *)MEMORY[0x1E0C99D20];
      v4 = (const __CFString **)v8;
      v5 = 2;
      goto LABEL_7;
    case 2u:
      v7 = CFSTR("childPhotosHighlights");
      v3 = (void *)MEMORY[0x1E0C99D20];
      v4 = &v7;
      v5 = 1;
      goto LABEL_7;
    case 3u:
      v9[0] = CFSTR("parentPhotosHighlight");
      v9[1] = CFSTR("dayGroupAssets");
      v9[2] = CFSTR("dayGroupAssets.additionalAttributes");
      v9[3] = CFSTR("dayGroupSummaryAssets");
      v9[4] = CFSTR("dayGroupExtendedAssets");
      v9[5] = CFSTR("childDayGroupPhotosHighlights");
      v3 = (void *)MEMORY[0x1E0C99D20];
      v4 = (const __CFString **)v9;
      v5 = 6;
LABEL_7:
      objc_msgSend(v3, "arrayWithObjects:count:", v4, v5);
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)_highlightRelationshipsToPrefetchForHighlightOfAnyKind
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("parentPhotosHighlight");
  v3[1] = CFSTR("childPhotosHighlights");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)highlightsIntersectingDateInterval:(id)a3 ofKind:(unsigned __int16)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;

  v4 = a4;
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLMomentGenerationDataManager.m"), 579, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dateInterval"));

  }
  v8 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v7, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("(startDate <= %@) AND (endDate >= %@) AND kind = %d"), v9, v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("PhotosHighlight"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFetchBatchSize:", 100);
  objc_msgSend(v12, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v12, "setPredicate:", v11);
  -[PLMomentGenerationDataManager _highlightRelationshipsToPrefetchForHighlightKind:](self, "_highlightRelationshipsToPrefetchForHighlightKind:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRelationshipKeyPathsForPrefetching:", v13);

  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "executeFetchRequest:error:", v12, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)momentsIntersectingDateInterval:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLMomentGenerationDataManager.m"), 594, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dateInterval"));

  }
  v6 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v5, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("(startDate <= %@) AND (endDate >= %@)"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Moment"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFetchBatchSize:", 100);
  objc_msgSend(v10, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v10, "setPredicate:", v9);
  objc_msgSend(v10, "setRelationshipKeyPathsForPrefetching:", &unk_1E3763950);
  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "executeFetchRequest:error:", v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)momentsBetweenDate:(id)a3 andDate:(id)a4 sorted:(BOOL)a5 excludeExternal:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[2];
  _QWORD v27[3];

  v6 = a6;
  v7 = a5;
  v27[2] = *MEMORY[0x1E0C80C00];
  v10 = (void *)MEMORY[0x1E0C97B48];
  v11 = a4;
  v12 = a3;
  +[PLMoment entityName](PLMoment, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchRequestWithEntityName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K >= %@) AND (%K <= %@)"), CFSTR("endDate"), v12, CFSTR("startDate"), v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[PLMoment fetchPredicateForExcludingOriginatorState:](PLMoment, "fetchPredicateForExcludingOriginatorState:", 8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB3528];
    v27[0] = v15;
    v27[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "andPredicateWithSubpredicates:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPredicate:", v19);

  }
  else
  {
    objc_msgSend(v14, "setPredicate:", v15);
  }
  objc_msgSend(v14, "setReturnsObjectsAsFaults:", 0);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("representativeDate"), 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v20;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSortDescriptors:", v22);

  }
  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "executeFetchRequest:error:", v14, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)allPhotosHighlightsOfAllKindsWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMomentGenerationDataManager _highlightRelationshipsToPrefetchForHighlightOfAnyKind](self, "_highlightRelationshipsToPrefetchForHighlightOfAnyKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotosHighlight allPhotosHighlightsInManagedObjectContext:predicate:keyPathsForPrefetching:error:](PLPhotosHighlight, "allPhotosHighlightsInManagedObjectContext:predicate:keyPathsForPrefetching:error:", v5, 0, v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)allInvalidPhotosHighlightsOfAllKindsWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotosHighlight predicateForInvalidHighlightsOfAllKinds](PLPhotosHighlight, "predicateForInvalidHighlightsOfAllKinds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotosHighlight allPhotosHighlightsInManagedObjectContext:predicate:keyPathsForPrefetching:error:](PLPhotosHighlight, "allPhotosHighlightsInManagedObjectContext:predicate:keyPathsForPrefetching:error:", v4, v5, 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)allEmptyPhotosHighlightsOfKind:(unsigned __int16)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotosHighlight predicateForEmptyHighlightsOfKind:](PLPhotosHighlight, "predicateForEmptyHighlightsOfKind:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotosHighlight allPhotosHighlightsInManagedObjectContext:predicate:keyPathsForPrefetching:error:](PLPhotosHighlight, "allPhotosHighlightsInManagedObjectContext:predicate:keyPathsForPrefetching:error:", v6, v7, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)allPhotosHighlightsOfKind:(unsigned __int16)a3 error:(id *)a4
{
  return -[PLMomentGenerationDataManager allPhotosHighlightsOfKind:withPredicate:error:](self, "allPhotosHighlightsOfKind:withPredicate:error:", a3, 0, a4);
}

- (id)allPhotosHighlightsOfKind:(unsigned __int16)a3 withPredicate:(id)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v6 = a3;
  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind = %d"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
  {
    v12 = (void *)MEMORY[0x1E0CB3528];
    v18[0] = v10;
    v18[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "andPredicateWithSubpredicates:", v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = v10;
  }
  -[PLMomentGenerationDataManager _highlightRelationshipsToPrefetchForHighlightKind:](self, "_highlightRelationshipsToPrefetchForHighlightKind:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotosHighlight allPhotosHighlightsInManagedObjectContext:predicate:keyPathsForPrefetching:error:](PLPhotosHighlight, "allPhotosHighlightsInManagedObjectContext:predicate:keyPathsForPrefetching:error:", v9, v14, v15, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)allPhotosHighlightsWithPredicate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMomentGenerationDataManager _highlightRelationshipsToPrefetchForHighlightOfAnyKind](self, "_highlightRelationshipsToPrefetchForHighlightOfAnyKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotosHighlight allPhotosHighlightsInManagedObjectContext:predicate:keyPathsForPrefetching:error:](PLPhotosHighlight, "allPhotosHighlightsInManagedObjectContext:predicate:keyPathsForPrefetching:error:", v7, v6, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)allMomentsWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLMoment allMomentsInManagedObjectContext:error:](PLMoment, "allMomentsInManagedObjectContext:error:", v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)allInvalidMomentsWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLMoment allInvalidMomentsInManagedObjectContext:error:](PLMoment, "allInvalidMomentsInManagedObjectContext:error:", v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)momentsRequiringLocationProcessingWhenCoreRoutineIsAvailable:(id *)a3
{
  void *v4;
  void *v5;

  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLMoment momentsRequiringLocationProcessingWhenCoreRoutineIsAvailableInManagedObjectContext:error:](PLMoment, "momentsRequiringLocationProcessingWhenCoreRoutineIsAvailableInManagedObjectContext:error:", v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)momentsRequiringLocationProcessingWhenFrequentLocationsAreAvailable:(id *)a3
{
  void *v4;
  void *v5;

  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLMoment momentsRequiringLocationProcessingWhenFrequentLocationsAreAvailableInManagedObjectContext:error:](PLMoment, "momentsRequiringLocationProcessingWhenFrequentLocationsAreAvailableInManagedObjectContext:error:", v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)momentsRequiringLocationProcessingWhenFrequentLocationsChangedWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLMoment momentsRequiringLocationProcessingWhenFrequentLocationsChangedInManagedObjectContext:error:](PLMoment, "momentsRequiringLocationProcessingWhenFrequentLocationsChangedInManagedObjectContext:error:", v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)allMomentIDsWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLMoment allMomentIDsInManagedObjectContext:error:](PLMoment, "allMomentIDsInManagedObjectContext:error:", v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)allAssetsToBeIncludedInMomentsWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLMoment allAssetsIncludedInMomentsInManagedObjectContext:IDsOnly:error:](PLMoment, "allAssetsIncludedInMomentsInManagedObjectContext:IDsOnly:error:", v4, 0, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)allInvalidAssetsWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLMoment allInvalidAssetsInManagedObjectContext:error:](PLMoment, "allInvalidAssetsInManagedObjectContext:error:", v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)allAssetIDsToBeIncludedInMomentsWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLMoment allAssetsIncludedInMomentsInManagedObjectContext:IDsOnly:error:](PLMoment, "allAssetsIncludedInMomentsInManagedObjectContext:IDsOnly:error:", v4, 1, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_batchDeleteForEntityName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v7);
  objc_msgSend(v8, "setResultType:", 2);
  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v9, "executeRequest:error:", v8, &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16;
  PLMigrationGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v6;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Failed to clear %@ references, %@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "result");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v14;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Cleared all %@ %@ references from assets", buf, 0x16u);

  }
  if (a4)
    *a4 = objc_retainAutorelease(v11);

  return v11 == 0;
}

- (BOOL)_deleteAllObjectsForEntityName:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  PLEnumerateAndSaveController *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  PLEnumerateAndSaveController *v15;
  _BOOL4 v16;
  id v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v10 = [PLEnumerateAndSaveController alloc];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pathManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __70__PLMomentGenerationDataManager__deleteAllObjectsForEntityName_error___block_invoke;
  v26[3] = &unk_1E36700D0;
  v27 = v9;
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __70__PLMomentGenerationDataManager__deleteAllObjectsForEntityName_error___block_invoke_2;
  v23[3] = &unk_1E36677F0;
  v14 = v27;
  v24 = v14;
  v25 = &v28;
  v15 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultsBlock:](v10, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultsBlock:", v11, v8, v14, v12, 0, 1, v26, 0, v23);

  v22 = 0;
  v16 = -[PLEnumerateAndSaveController processObjectsWithError:](v15, "processObjectsWithError:", &v22);
  v17 = v22;
  if (v16)
  {
    PLMomentsGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)v29[3];
      *(_DWORD *)buf = 138412546;
      v33 = v7;
      v34 = 2048;
      v35 = v19;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Finished deleting entity: %@, count deleted: %ld", buf, 0x16u);
    }

  }
  else
  {
    PLMomentsGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v33 = v7;
      v34 = 2112;
      v35 = v17;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Failed to delete objects of entity: %@, error: %@", buf, 0x16u);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v17);
  }

  _Block_object_dispose(&v28, 8);
  return v16;
}

- (BOOL)deleteAllMomentsWithError:(id *)a3
{
  void *v5;

  +[PLMoment entityName](PLMoment, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[PLMomentGenerationDataManager _batchDeleteForEntityName:error:](self, "_batchDeleteForEntityName:error:", v5, a3);

  return (char)a3;
}

- (BOOL)deleteAllHighlightsWithError:(id *)a3
{
  void *v5;

  +[PLPhotosHighlight entityName](PLPhotosHighlight, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[PLMomentGenerationDataManager _deleteAllObjectsForEntityName:error:](self, "_deleteAllObjectsForEntityName:error:", v5, a3);

  return (char)a3;
}

- (id)insertNewMoment
{
  void *v2;
  void *v3;
  void *v4;

  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLMoment entityName](PLMoment, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v3, (uint64_t)v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)insertNewPhotosHighlight
{
  void *v2;
  void *v3;
  uint64_t v5;

  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  +[PLPhotosHighlight insertNewPhotosHighlightInManagedObjectContext:error:](PLPhotosHighlight, "insertNewPhotosHighlightInManagedObjectContext:error:", v2, &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)orphanedAssetIDsWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Asset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForAssetsIncludedInMoments"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("visibilityState"), 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != 1"), CFSTR("hidden"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v9;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("trashedState"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v10;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == NULL"), CFSTR("moment"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPredicate:", v13);
  objc_msgSend(v5, "setResultType:", 1);
  objc_msgSend(v5, "setIncludesPropertyValues:", 0);
  -[PLMomentGenerationDataManager managedObjectContext](self, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "executeFetchRequest:error:", v5, a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)verifyAndRepairOrphanedAssets:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[PLMomentGenerationDataManager isolationQueue](self, "isolationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  v9 = v7;
  v10 = v6;
  pl_dispatch_async();

}

- (BOOL)wantsMomentReplayLogging
{
  int v2;

  v2 = MEMORY[0x19AEC04BC](self, a2);
  if (v2)
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(CFSTR("PLMomentGenerationReplayLoggingEnabled"), CFSTR("com.apple.mobileslideshow"), 0) != 0;
  return v2;
}

- (id)replayLogPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Logs/CrashReporter/DiagnosticLogs/com.apple.photos/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("MomentsReplayLog.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)logRoutineInformation
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[PLMomentGenerationDataManager routineIsAvailable](self, "routineIsAvailable"))
  {
    -[PLMomentGenerationDataManager locationsOfInterest](self, "locationsOfInterest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PLMomentsGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Routine is available with %lu LOIs:", buf, 0xCu);
    }

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v3;
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          PLMomentsGetLog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138477827;
            v18 = v10;
            _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "\t%{private}@", buf, 0xCu);
          }

        }
        v7 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    PLMomentsGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Routine is not available", buf, 2u);
    }
  }

}

- (BOOL)routineIsAvailable
{
  return !-[PLMomentGenerationDataManager cameraIsActive](self, "cameraIsActive")
      && -[PLRoutineService routineIsAvailable](self->_routineManager, "routineIsAvailable");
}

- (id)locationsOfInterest
{
  void *v3;

  if (-[PLMomentGenerationDataManager routineIsAvailable](self, "routineIsAvailable"))
  {
    -[PLRoutineService allLocationsOfInterest](self->_routineManager, "allLocationsOfInterest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)cameraIsActive
{
  void *v2;
  char v3;

  -[PLMomentGenerationDataManager cameraWatcher](self, "cameraWatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCameraRunning");

  return v3;
}

- (void)fetchLocationsOfInterestIfNeeded
{
  -[PLRoutineService fetchLocationsOfInterestIfNeeded](self->_routineManager, "fetchLocationsOfInterestIfNeeded");
}

- (id)lastLocationOfInterestVisit
{
  return -[PLRoutineService lastLocationOfInterestVisit](self->_routineManager, "lastLocationOfInterestVisit");
}

- (void)setShouldPerformLightweightValidation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_shouldPerformLightweightValidation = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("com.apple.photos.validation.performLightweightValidation"));

}

- (void)setPreviousValidatedModelVersion:(int64_t)a3
{
  id v4;

  self->_previousValidatedModelVersion = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("com.apple.photos.validation.previousValidatedModelVersion"));

}

- (void)setPreviousValidationSucceeded:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_previousValidationSucceeded = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("com.apple.photos.validation.previousValidationSucceeded"));

}

- (void)runPeriodicMaintenanceTasks:(unint64_t)a3 withTransaction:(id)a4
{
  char v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  PLMomentGeneration *generator;
  NSObject *v12;
  PLMomentGeneration *v13;
  NSObject *v14;
  PLMomentGeneration *v15;
  NSObject *v16;
  NSObject *v17;
  PLMomentGeneration *v18;
  NSObject *v19;
  PLMomentGeneration *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  _QWORD v24[4];
  NSObject *v25;
  _QWORD v26[4];
  NSObject *v27;
  _QWORD v28[4];
  NSObject *v29;
  _QWORD v30[4];
  NSObject *v31;
  _QWORD v32[4];
  NSObject *v33;
  _QWORD v34[4];
  NSObject *v35;
  uint8_t buf[16];

  v4 = a3;
  v6 = a4;
  PLMomentsGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "Periodic maintenance tasks: Start", buf, 2u);
  }

  v8 = dispatch_group_create();
  v9 = MEMORY[0x1E0C809B0];
  if ((v4 & 1) != 0)
  {
    PLMomentsGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "Process recent highlights: Start", buf, 2u);
    }

    dispatch_group_enter(v8);
    generator = self->_generator;
    v34[0] = v9;
    v34[1] = 3221225472;
    v34[2] = __77__PLMomentGenerationDataManager_runPeriodicMaintenanceTasks_withTransaction___block_invoke;
    v34[3] = &unk_1E3677AA0;
    v35 = v8;
    -[PLMomentGeneration processRecentHighlightsWithCompletionBlock:](generator, "processRecentHighlightsWithCompletionBlock:", v34);

    if ((v4 & 4) == 0)
    {
LABEL_5:
      if ((v4 & 8) == 0)
        goto LABEL_6;
      goto LABEL_16;
    }
  }
  else if ((v4 & 4) == 0)
  {
    goto LABEL_5;
  }
  PLMomentsGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEBUG, "Process unprocessed moment locations: Start", buf, 2u);
  }

  dispatch_group_enter(v8);
  v13 = self->_generator;
  v32[0] = v9;
  v32[1] = 3221225472;
  v32[2] = __77__PLMomentGenerationDataManager_runPeriodicMaintenanceTasks_withTransaction___block_invoke_175;
  v32[3] = &unk_1E3677AA0;
  v33 = v8;
  -[PLMomentGeneration processUnprocessedMomentLocationsWithCompletionBlock:](v13, "processUnprocessedMomentLocationsWithCompletionBlock:", v32);

  if ((v4 & 8) == 0)
  {
LABEL_6:
    if ((v4 & 2) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_16:
  PLMomentsGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "Update highlight titles: Start", buf, 2u);
  }

  dispatch_group_enter(v8);
  v15 = self->_generator;
  v30[0] = v9;
  v30[1] = 3221225472;
  v30[2] = __77__PLMomentGenerationDataManager_runPeriodicMaintenanceTasks_withTransaction___block_invoke_176;
  v30[3] = &unk_1E3677AA0;
  v31 = v8;
  -[PLMomentGeneration updateHighlightTitlesWithCompletionBlock:](v15, "updateHighlightTitlesWithCompletionBlock:", v30);

  if ((v4 & 2) == 0)
  {
LABEL_7:
    if ((v4 & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_19:
  PLMomentsGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "Run repair of orphaned assets: Start", buf, 2u);
  }

  dispatch_group_enter(v8);
  v28[0] = v9;
  v28[1] = 3221225472;
  v28[2] = __77__PLMomentGenerationDataManager_runPeriodicMaintenanceTasks_withTransaction___block_invoke_177;
  v28[3] = &unk_1E3677AA0;
  v29 = v8;
  -[PLMomentGenerationDataManager verifyAndRepairOrphanedAssets:completionBlock:](self, "verifyAndRepairOrphanedAssets:completionBlock:", v6, v28);

  if ((v4 & 0x10) == 0)
  {
LABEL_8:
    if ((v4 & 0x20) == 0)
      goto LABEL_28;
    goto LABEL_25;
  }
LABEL_22:
  PLMomentsGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEBUG, "Validate library: Start", buf, 2u);
  }

  dispatch_group_enter(v8);
  v18 = self->_generator;
  v26[0] = v9;
  v26[1] = 3221225472;
  v26[2] = __77__PLMomentGenerationDataManager_runPeriodicMaintenanceTasks_withTransaction___block_invoke_178;
  v26[3] = &unk_1E3677AA0;
  v27 = v8;
  -[PLMomentGeneration validateLibraryWithCompletionBlock:](v18, "validateLibraryWithCompletionBlock:", v26);

  if ((v4 & 0x20) != 0)
  {
LABEL_25:
    PLMomentsGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEBUG, "Cleanup empty highlights: Start", buf, 2u);
    }

    dispatch_group_enter(v8);
    v20 = self->_generator;
    v24[0] = v9;
    v24[1] = 3221225472;
    v24[2] = __77__PLMomentGenerationDataManager_runPeriodicMaintenanceTasks_withTransaction___block_invoke_179;
    v24[3] = &unk_1E3677AA0;
    v25 = v8;
    -[PLMomentGeneration cleanupEmptyHighlightsWithCompletionBlock:](v20, "cleanupEmptyHighlightsWithCompletionBlock:", v24);

  }
LABEL_28:
  PLMomentsGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEBUG, "Wait for tasks to complete", buf, 2u);
  }

  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  PLMomentsGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEBUG, "Release memory intensive objects", buf, 2u);
  }

  -[PLMomentGeneration releaseMemoryIntensiveObjects](self->_generator, "releaseMemoryIntensiveObjects");
  objc_msgSend(v6, "stillAlive");
  PLMomentsGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEBUG, "Periodic maintenance tasks: Done", buf, 2u);
  }

}

- (void)releaseMemoryIntensiveObjects
{
  -[PLRoutineService invalidateLocationsOfInterest](self->_routineManager, "invalidateLocationsOfInterest");
}

- (BOOL)shouldPerformLightweightValidation
{
  return self->_shouldPerformLightweightValidation;
}

- (int64_t)previousValidatedModelVersion
{
  return self->_previousValidatedModelVersion;
}

- (BOOL)previousValidationSucceeded
{
  return self->_previousValidationSucceeded;
}

- (PLCameraAppWatcher)cameraWatcher
{
  return self->_cameraWatcher;
}

- (OS_dispatch_queue)isolationQueue
{
  return self->_isolationQueue;
}

- (void)setManagedObjectContext:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectContext, a3);
}

- (BOOL)isLightweightMigrationManager
{
  return self->_isLightweightMigrationManager;
}

- (void)setMomentGenerationLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_momentGenerationLibrary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentGenerationLibrary, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_cameraWatcher, 0);
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_destroyWeak((id *)&self->_libraryServicesManager);
  objc_storeStrong((id *)&self->_lightWeightMigrationPathManager, 0);
  objc_storeStrong((id *)&self->_generationOptions, 0);
  objc_storeStrong((id *)&self->_generator, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong(&self->_reachabilityBlock, 0);
}

void __77__PLMomentGenerationDataManager_runPeriodicMaintenanceTasks_withTransaction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  PLMomentsGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "Process recent highlights: Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __77__PLMomentGenerationDataManager_runPeriodicMaintenanceTasks_withTransaction___block_invoke_175(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  PLMomentsGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "Process unprocessed moment locations: Dont", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __77__PLMomentGenerationDataManager_runPeriodicMaintenanceTasks_withTransaction___block_invoke_176(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  PLMomentsGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "Update highlight titles: Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __77__PLMomentGenerationDataManager_runPeriodicMaintenanceTasks_withTransaction___block_invoke_177(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  PLMomentsGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "Run repair of orphaned assets: Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __77__PLMomentGenerationDataManager_runPeriodicMaintenanceTasks_withTransaction___block_invoke_178(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  PLMomentsGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "Validate library: Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __77__PLMomentGenerationDataManager_runPeriodicMaintenanceTasks_withTransaction___block_invoke_179(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  PLMomentsGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "Cleanup empty highlights: Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __79__PLMomentGenerationDataManager_verifyAndRepairOrphanedAssets_completionBlock___block_invoke(id *a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__162;
  v21 = __Block_byref_object_dispose__163;
  v22 = 0;
  v2 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__PLMomentGenerationDataManager_verifyAndRepairOrphanedAssets_completionBlock___block_invoke_164;
  v14[3] = &unk_1E3677C68;
  v3 = a1[5];
  v15 = a1[4];
  v16 = &v17;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__PLMomentGenerationDataManager_verifyAndRepairOrphanedAssets_completionBlock___block_invoke_165;
  v12[3] = &unk_1E3677AA0;
  v13 = v3;
  objc_msgSend(v15, "performBlock:synchronously:completionHandler:", v14, 1, v12);
  v4 = (void *)v18[5];
  if (v4 && objc_msgSend(v4, "count"))
  {
    PLMomentsGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend((id)v18[5], "count");
      *(_DWORD *)buf = 134217984;
      v24 = v6;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "MOMENTS: found %lu orphaned assets. Marking for moment generation", buf, 0xCu);
    }

    objc_msgSend(a1[4], "generator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v18[5];
    v9[0] = v2;
    v9[1] = 3221225472;
    v9[2] = __79__PLMomentGenerationDataManager_verifyAndRepairOrphanedAssets_completionBlock___block_invoke_166;
    v9[3] = &unk_1E3675C58;
    v10 = a1[5];
    v11 = a1[6];
    objc_msgSend(v7, "generateWithAssetInsertsAndUpdates:assetDeletes:assetUpdatesForHighlights:momentUpdatesForHighlights:completionHandler:", v8, 0, 0, 0, v9);

  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }

  _Block_object_dispose(&v17, 8);
}

void __79__PLMomentGenerationDataManager_verifyAndRepairOrphanedAssets_completionBlock___block_invoke_164(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v8 = 0;
  objc_msgSend(v2, "orphanedAssetIDsWithError:", &v8);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v8;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    PLMomentsGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "MOMENTS: error fetching orphaned assets: %@", buf, 0xCu);
    }

  }
}

uint64_t __79__PLMomentGenerationDataManager_verifyAndRepairOrphanedAssets_completionBlock___block_invoke_165(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

uint64_t __79__PLMomentGenerationDataManager_verifyAndRepairOrphanedAssets_completionBlock___block_invoke_166(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "stillAlive");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id __70__PLMomentGenerationDataManager__deleteAllObjectsForEntityName_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __70__PLMomentGenerationDataManager__deleteAllObjectsForEntityName_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 32), "deleteObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

void __63__PLMomentGenerationDataManager__networkReachabilityDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x19AEC174C](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __56__PLMomentGenerationDataManager_momentGenerationLibrary__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "managedObjectContext");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  +[PLMomentGenerationDataManager setManagedObjectContextMomentarilyBlessed:](PLMomentGenerationDataManager, "setManagedObjectContextMomentarilyBlessed:", v1);

}

+ (void)initialize
{
  void *v2;
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___PLMomentGenerationDataManager;
  objc_msgSendSuper2(&v3, sel_initialize);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerDefaults:", &unk_1E37645A8);

}

+ (void)setManagerMomentarilyBlessed:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLMomentGenerationDataManager.m"), 265, CFSTR("Passed in incorrect data manager class"));

  }
  if ((PLPlatformMomentsSupported() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLMomentGenerationDataManager.m"), 266, CFSTR("Unsupported platform"));

  }
  objc_msgSend(v8, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setManagedObjectContextMomentarilyBlessed:", v5);

}

+ (void)setManagedObjectContextMomentarilyBlessed:(id)a3
{
  id v3;

  objc_msgSend(a3, "userInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("MomentarilyBlessed"));

}

+ (BOOL)isManagedObjectContextMomentarilyBlessed:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v10;

  v5 = a3;
  if ((PLPlatformMomentsSupported() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLMomentGenerationDataManager.m"), 278, CFSTR("Unsupported platform"));

  }
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("MomentarilyBlessed"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

+ (id)processingMomentsFromMoments:(id)a3
{
  return (id)objc_msgSend(a3, "_pl_map:", &__block_literal_global_141);
}

PLMomentProcessingData *__62__PLMomentGenerationDataManager_processingMomentsFromMoments___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PLMomentProcessingData *v3;

  v2 = a2;
  v3 = -[PLMomentProcessingData initWithMoment:]([PLMomentProcessingData alloc], "initWithMoment:", v2);

  return v3;
}

@end
