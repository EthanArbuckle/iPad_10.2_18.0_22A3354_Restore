@implementation PLManagedObjectContext

+ (id)managedObjectModel
{
  return +[PLPersistentContainer managedObjectModel](PLPersistentContainer, "managedObjectModel");
}

- (BOOL)pl_performWithOptions:(unint64_t)a3 andBlock:(id)a4
{
  id v7;
  _BOOL4 v8;
  objc_super v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v7 = a4;
  v8 = -[PLManagedObjectContext isValidForSelector:error:](self, "isValidForSelector:error:", a2, 0);
  if (v8)
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__PLManagedObjectContext_pl_performWithOptions_andBlock___block_invoke;
    v11[3] = &unk_1E3675A00;
    objc_copyWeak(&v13, &location);
    v12 = v7;
    v10.receiver = self;
    v10.super_class = (Class)PLManagedObjectContext;
    -[PLManagedObjectContext performWithOptions:andBlock:](&v10, sel_performWithOptions_andBlock_, a3, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (id)executeFetchRequest:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v12;

  v7 = a3;
  if (-[PLManagedObjectContext isValidForSelector:error:](self, "isValidForSelector:error:", a2, a4))
  {
    v12 = 0;
    -[PLManagedObjectContext _pl_executeFetchRequest:error:](self, "_pl_executeFetchRequest:error:", v7, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;
    if (!v8)
    {
      -[PLManagedObjectContext photoLibrary](self, "photoLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handlePossibleCoreDataError:", v9);

      if (a4)
        *a4 = objc_retainAutorelease(v9);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isValidForSelector:(SEL)a3 error:(id *)a4
{
  os_unfair_lock_s *p_invalidationStateLock;
  NSError *invalidationReason;
  NSObject *v9;
  void *v10;
  NSError *v11;
  int v13;
  void *v14;
  __int16 v15;
  NSError *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_invalidationStateLock = &self->_invalidationStateLock;
  os_unfair_lock_lock(&self->_invalidationStateLock);
  invalidationReason = self->_invalidationReason;
  if (invalidationReason)
  {
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = self->_invalidationReason;
      v13 = 138543618;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ called after invalidate: %@", (uint8_t *)&v13, 0x16u);

    }
    if (a4)
      *a4 = objc_retainAutorelease(self->_invalidationReason);
  }
  os_unfair_lock_unlock(p_invalidationStateLock);
  return invalidationReason == 0;
}

- (id)_pl_executeFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  objc_super v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[PLFetchRequest pl_importantFetchNameForFetchRequest:](PLFetchRequest, "pl_importantFetchNameForFetchRequest:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    PLImportantFetchGetLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = os_signpost_id_generate(v8);

    v10 = v8;
    v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_DWORD *)buf = 138543362;
      v19 = (uint64_t)v7;
      _os_signpost_emit_with_name_impl(&dword_199541000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ImportantPhotosFetch", "%{public}@", buf, 0xCu);
    }

  }
  else
  {
    v11 = 0;
    v9 = 0;
  }
  v17.receiver = self;
  v17.super_class = (Class)PLManagedObjectContext;
  -[PLManagedObjectContext executeFetchRequest:error:](&v17, sel_executeFetchRequest_error_, v6, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v13 = v11;
    v14 = v13;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      v15 = objc_msgSend(v12, "count");
      *(_DWORD *)buf = 134217984;
      v19 = v15;
      _os_signpost_emit_with_name_impl(&dword_199541000, v14, OS_SIGNPOST_INTERVAL_END, v9, "ImportantPhotosFetch", "%tu", buf, 0xCu);
    }

  }
  return v12;
}

+ (void)_pl_megamoc_contextPerformDepthPop
{
  char *v4;
  void *v5;

  if (_contextPerformDepthThreadKey_s_onceToken != -1)
    dispatch_once(&_contextPerformDepthThreadKey_s_onceToken, &__block_literal_global_490);
  v4 = (char *)pthread_getspecific(_contextPerformDepthThreadKey_s_key);
  if ((uint64_t)v4 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLManagedObjectContext.m"), 924, CFSTR("unbalanced calls to PLManagedObjectContext _contextPerformDepthPush/Pop()"));

  }
  if (_contextPerformDepthThreadKey_s_onceToken != -1)
    dispatch_once(&_contextPerformDepthThreadKey_s_onceToken, &__block_literal_global_490);
  pthread_setspecific(_contextPerformDepthThreadKey_s_key, v4 - 1);
}

void __57__PLManagedObjectContext_pl_performWithOptions_andBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "pl_wrapperForPerformBlock:", *(_QWORD *)(a1 + 32));

}

uint64_t __53__PLManagedObjectContext__directPerformBlockAndWait___block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_opt_class(), "_pl_megamoc_contextPerformDepthPush");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend((id)objc_opt_class(), "_pl_megamoc_contextPerformDepthPop");
}

+ (void)_pl_megamoc_contextPerformDepthPush
{
  char *v2;

  if (_contextPerformDepthThreadKey_s_onceToken != -1)
    dispatch_once(&_contextPerformDepthThreadKey_s_onceToken, &__block_literal_global_490);
  v2 = (char *)pthread_getspecific(_contextPerformDepthThreadKey_s_key);
  if (_contextPerformDepthThreadKey_s_onceToken != -1)
    dispatch_once(&_contextPerformDepthThreadKey_s_onceToken, &__block_literal_global_490);
  pthread_setspecific(_contextPerformDepthThreadKey_s_key, v2 + 1);
}

uint64_t __50__PLManagedObjectContext_setupDelegateWithBundle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTrackSQLiteDatabaseStatistics:", 1);
}

void __49__PLManagedObjectContext_updateTransactionAuthor__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[PLPersistentHistoryTransactionModifiers transactionAuthorFromChangeSource:syncChangeMarker:nonCoalescing:](PLPersistentHistoryTransactionModifiers, "transactionAuthorFromChangeSource:syncChangeMarker:nonCoalescing:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 340), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 240), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 337));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTransactionAuthor:", v2);

  PLPersistentHistoryGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "transactionAuthor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v4;
    v8 = 2048;
    v9 = v5;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Updated transaction author: %@, for context: %p", (uint8_t *)&v6, 0x16u);

  }
}

- (void)refreshAllObjects
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLManagedObjectContext;
  -[PLManagedObjectContext refreshAllObjects](&v4, sel_refreshAllObjects);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_lastResetTimestamp = v3;
}

- (void)setPhotoLibrary:(id)a3
{
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLManagedObjectContext.m"), 519, CFSTR("photoLibrary cannot be changed once set."));

  }
  objc_storeWeak((id *)&self->_photoLibrary, obj);

}

- (void)setName:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  PLManagedObjectContext *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLPhotosObjectLifecycleGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v8 = objc_opt_class();
    v9 = 2048;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "%@ %p setName:%@", buf, 0x20u);
  }

  v6.receiver = self;
  v6.super_class = (Class)PLManagedObjectContext;
  -[PLManagedObjectContext setName:](&v6, sel_setName_, v4);

}

- (PLManagedObjectContext)initWithConcurrencyType:(unint64_t)a3 libraryBundle:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PLManagedObjectContext *v10;

  v6 = a4;
  objc_msgSend(v6, "changeHandlingContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistentContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sharedPersistentStoreCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PLManagedObjectContext initWithConcurrencyType:libraryBundle:changeHandlingContainer:coordinator:](self, "initWithConcurrencyType:libraryBundle:changeHandlingContainer:coordinator:", a3, v6, v7, v9);

  return v10;
}

- (PLManagedObjectContext)initWithConcurrencyType:(unint64_t)a3 libraryBundle:(id)a4 changeHandlingContainer:(id)a5 coordinator:(id)a6
{
  id v10;
  id v11;
  id v12;
  PLManagedObjectContext *v13;
  PLManagedObjectContext *v14;
  PLPhotoLibraryPathManager *v15;
  PLPhotoLibraryPathManager *pathManager;
  PLPhotoLibraryPathManager *v17;
  PLMergePolicy *v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSMutableDictionary *uuidsForCloudDeletion;
  uint64_t v23;
  NSMutableDictionary *updatedObjectsAttributes;
  uint64_t v25;
  NSMutableDictionary *updatedObjectsRelationships;
  double v27;
  NSMutableSet *v28;
  NSMutableSet *backgroundWorkItemIdentifiers;
  NSObject *v30;
  uint64_t v31;
  PLPhotoLibraryPathManager *v32;
  PLManagedObjectContext *v33;
  objc_super v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  PLManagedObjectContext *v39;
  __int16 v40;
  unint64_t v41;
  __int16 v42;
  PLPhotoLibraryPathManager *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v35.receiver = self;
  v35.super_class = (Class)PLManagedObjectContext;
  v13 = -[PLManagedObjectContext initWithConcurrencyType:](&v35, sel_initWithConcurrencyType_, a3);
  v14 = v13;
  if (v13)
  {
    if (!v12)
    {
      v33 = 0;
      goto LABEL_8;
    }
    v13->_changeSource = 0;
    -[PLManagedObjectContext updateTransactionAuthor](v13, "updateTransactionAuthor");
    objc_msgSend(v10, "pathManager");
    v15 = (PLPhotoLibraryPathManager *)objc_claimAutoreleasedReturnValue();
    pathManager = v14->_pathManager;
    v14->_pathManager = v15;
    v17 = v15;

    objc_storeStrong((id *)&v14->_changeHandlingContainer, a5);
    -[PLManagedObjectContext setPersistentStoreCoordinator:](v14, "setPersistentStoreCoordinator:", v12);
    v18 = -[NSMergePolicy initWithMergeType:]([PLMergePolicy alloc], "initWithMergeType:", 2);
    -[PLManagedObjectContext setMergePolicy:](v14, "setMergePolicy:", v18);
    v19 = objc_alloc(MEMORY[0x1E0C99E08]);
    PLAllCloudDeletionKeys();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "initWithCapacity:", objc_msgSend(v20, "count"));
    uuidsForCloudDeletion = v14->_uuidsForCloudDeletion;
    v14->_uuidsForCloudDeletion = (NSMutableDictionary *)v21;

    v23 = objc_opt_new();
    updatedObjectsAttributes = v14->_updatedObjectsAttributes;
    v14->_updatedObjectsAttributes = (NSMutableDictionary *)v23;

    v25 = objc_opt_new();
    updatedObjectsRelationships = v14->_updatedObjectsRelationships;
    v14->_updatedObjectsRelationships = (NSMutableDictionary *)v25;

    -[PLManagedObjectContext connectToChangeHandling](v14, "connectToChangeHandling");
    -[PLManagedObjectContext setupLocalChangeNotifications](v14, "setupLocalChangeNotifications");
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v14->_lastResetTimestamp = v27;
    v14->_initFinished = 1;
    v28 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    backgroundWorkItemIdentifiers = v14->_backgroundWorkItemIdentifiers;
    v14->_backgroundWorkItemIdentifiers = v28;

    -[PLManagedObjectContext setupDelegateWithBundle:](v14, "setupDelegateWithBundle:", v10);
  }
  PLPhotosObjectLifecycleGetLog();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    v31 = objc_opt_class();
    v32 = v14->_pathManager;
    *(_DWORD *)buf = 138413058;
    v37 = v31;
    v38 = 2048;
    v39 = v14;
    v40 = 2048;
    v41 = a3;
    v42 = 2112;
    v43 = v32;
    _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_DEBUG, "%@ %p initWithConcurrencyType:%tu pathManager:%@", buf, 0x2Au);
  }

  v33 = v14;
LABEL_8:

  return v33;
}

- (void)updateTransactionAuthor
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __49__PLManagedObjectContext_updateTransactionAuthor__block_invoke;
  v2[3] = &unk_1E3677AA0;
  v2[4] = self;
  -[PLManagedObjectContext _directPerformBlockAndWait:](self, "_directPerformBlockAndWait:", v2);
}

- (void)performBlockAndWait:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  -[PLManagedObjectContext photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (PLIsAssetsd())
  {
    v6 = !self->_initFinished || v5 == 0;
    if (!v6
      && !+[PLManagedObjectContext _pl_megamoc_isInPLMocPerform](PLManagedObjectContext, "_pl_megamoc_isInPLMocPerform")&& !+[PLConcurrencyLimiter isRunningUnderLimiter](PLConcurrencyLimiter, "isRunningUnderLimiter"))
    {
      PLBackendGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_FAULT, "Unexpected direct call to performBlockAndWait: sidesteps concurrency limits, convert to a perform call on photoLibrary, or call PLConcurrencyLimiter directly for plain NSManagedObjectContexts.", v8, 2u);
      }

    }
  }
  -[PLManagedObjectContext _directPerformBlockAndWait:](self, "_directPerformBlockAndWait:", v4);

}

- (void)_directPerformBlockAndWait:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  PLManagedObjectContext *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __53__PLManagedObjectContext__directPerformBlockAndWait___block_invoke;
  v5[3] = &unk_1E3675C58;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)PLManagedObjectContext;
  v5[0] = MEMORY[0x1E0C809B0];
  v3 = v7;
  -[PLManagedObjectContext performBlockAndWait:](&v4, sel_performBlockAndWait_, v5);

}

- (PLPhotoLibrary)photoLibrary
{
  return (PLPhotoLibrary *)objc_loadWeakRetained((id *)&self->_photoLibrary);
}

- (void)setupDelegateWithBundle:(id)a3
{
  void *v4;
  PLManagedObjectContextDelegate *v5;
  PLManagedObjectContextDelegate *photosDelegate;
  id v7;
  _QWORD v8[5];

  v7 = a3;
  if (+[PLFetchRecorder isCurrentProcessEnabledForRecordingBundle:](PLFetchRecorder, "isCurrentProcessEnabledForRecordingBundle:"))
  {
    objc_msgSend(v7, "fetchRecorder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = objc_alloc_init(PLManagedObjectContextDelegate);
  photosDelegate = self->_photosDelegate;
  self->_photosDelegate = v5;

  -[PLManagedObjectContextDelegate setFetchRecorder:](self->_photosDelegate, "setFetchRecorder:", v4);
  -[PLManagedObjectContext _setDelegate:](self, "_setDelegate:", self->_photosDelegate);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__PLManagedObjectContext_setupDelegateWithBundle___block_invoke;
  v8[3] = &unk_1E3677AA0;
  v8[4] = self;
  -[PLManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v8);

}

- (void)connectToChangeHandling
{
  if (!self->_isConnectedToChangeHandling)
  {
    self->_isConnectedToChangeHandling = 1;
    if (objc_msgSend((id)objc_opt_class(), "canMergeRemoteChanges"))
      -[PLChangeHandlingContainer registerToReceiveCoreDataChanges:](self->_changeHandlingContainer, "registerToReceiveCoreDataChanges:", self);
    -[PLChangeHandlingContainer connectManagedObjectContext:](self->_changeHandlingContainer, "connectManagedObjectContext:", self);
  }
}

+ (BOOL)canMergeRemoteChanges
{
  return 1;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSMutableDictionary *uuidsForCloudDeletion;
  NSMutableDictionary *updatedObjectsAttributes;
  NSMutableDictionary *updatedObjectsRelationships;
  objc_super v9;
  uint8_t buf[4];
  PLManagedObjectContext *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v11 = self;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "PLManagedObjectContext %p dealloc", buf, 0xCu);
  }

  -[PLManagedObjectContext tearDownLocalChangeNotifications](self, "tearDownLocalChangeNotifications");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[PLManagedObjectContext setPtpNotificationDelegate:](self, "setPtpNotificationDelegate:", 0);
  if (self->_avalancheUUIDsForUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", objc_opt_class(), *MEMORY[0x1E0C978B8], self);

  }
  uuidsForCloudDeletion = self->_uuidsForCloudDeletion;
  self->_uuidsForCloudDeletion = 0;

  updatedObjectsAttributes = self->_updatedObjectsAttributes;
  self->_updatedObjectsAttributes = 0;

  updatedObjectsRelationships = self->_updatedObjectsRelationships;
  self->_updatedObjectsRelationships = 0;

  -[PLManagedObjectContext disconnectFromChangeHandling](self, "disconnectFromChangeHandling");
  v9.receiver = self;
  v9.super_class = (Class)PLManagedObjectContext;
  -[PLManagedObjectContext dealloc](&v9, sel_dealloc);
}

- (void)setPtpNotificationDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_ptpNotificationDelegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = objc_storeWeak((id *)&self->_ptpNotificationDelegate, obj);

    if (obj)
    {
      v7 = objc_loadWeakRetained((id *)&self->_photoLibrary);
      objc_msgSend(v7, "libraryBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "beginObservingChanges");

      v5 = obj;
      if (!self->_isObservingChangesForPTPNotificationDelegate)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__informPTPDelegateAboutChangesFromRemoteContextSaveNotification_, CFSTR("PLManagedObjectContextsPhotoKitNotification"), 0);

        v5 = obj;
        self->_isObservingChangesForPTPNotificationDelegate = 1;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObserver:name:object:", self, CFSTR("PLManagedObjectContextsPhotoKitNotification"), 0);

      self->_isObservingChangesForPTPNotificationDelegate = 0;
      v11 = objc_loadWeakRetained((id *)&self->_photoLibrary);
      objc_msgSend(v11, "libraryBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "endObservingChanges");

      v5 = 0;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pl_basename, 0);
  objc_destroyWeak((id *)&self->_ptpNotificationDelegate);
  objc_storeStrong((id *)&self->_backgroundWorkItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_invalidationReason, 0);
  objc_storeStrong((id *)&self->_changeHandlingContainer, 0);
  objc_storeStrong((id *)&self->_delayedSaveActions, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_storeStrong((id *)&self->_updatedObjectsRelationships, 0);
  objc_storeStrong((id *)&self->_updatedObjectsAttributes, 0);
  objc_storeStrong((id *)&self->_uuidsForCloudDeletion, 0);
  objc_storeStrong((id *)&self->_avalancheUUIDsForUpdate, 0);
  objc_storeStrong((id *)&self->_delayedDeletions, 0);
  objc_storeStrong((id *)&self->_photosDelegate, 0);
}

- (void)disconnectFromChangeHandling
{
  if (self->_isConnectedToChangeHandling)
  {
    self->_isConnectedToChangeHandling = 0;
    -[PLChangeHandlingContainer disconnectManagedObjectContext:](self->_changeHandlingContainer, "disconnectManagedObjectContext:", self);
  }
}

- (unint64_t)countForFetchRequest:(id)a3 error:(id *)a4
{
  id v7;
  _BOOL4 v8;
  unint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint8_t v17[16];
  objc_super v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = -[PLManagedObjectContext isValidForSelector:error:](self, "isValidForSelector:error:", a2, a4);
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8)
  {
    v18.receiver = self;
    v18.super_class = (Class)PLManagedObjectContext;
    v19 = 0;
    v9 = -[PLManagedObjectContext countForFetchRequest:error:](&v18, sel_countForFetchRequest_error_, v7, &v19);
    v10 = v19;
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[PLManagedObjectContext photoLibrary](self, "photoLibrary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handlePossibleCoreDataError:", v10);

      if (!v10)
      {
        PLBackendGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_FAULT, "countForFetchRequest returned NSNotFound but no error was returned", v17, 2u);
        }

        v13 = (void *)MEMORY[0x1E0CB35C8];
        v14 = *MEMORY[0x1E0D74498];
        v20 = *MEMORY[0x1E0CB2938];
        v21[0] = CFSTR("countForFetchRequest returned NSNotFound but no error was returned");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 41001, v15);
        v10 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (a4)
      {
        v10 = objc_retainAutorelease(v10);
        *a4 = v10;
      }
    }

  }
  return v9;
}

- (void)_directPerformBlock:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  PLManagedObjectContext *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __46__PLManagedObjectContext__directPerformBlock___block_invoke;
  v5[3] = &unk_1E3675C58;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)PLManagedObjectContext;
  v5[0] = MEMORY[0x1E0C809B0];
  v3 = v7;
  -[PLManagedObjectContext performBlock:](&v4, sel_performBlock_, v5);

}

- (double)lastResetTimestamp
{
  return self->_lastResetTimestamp;
}

- (PLManagedObjectContextPTPNotificationDelegate)ptpNotificationDelegate
{
  return (PLManagedObjectContextPTPNotificationDelegate *)objc_loadWeakRetained((id *)&self->_ptpNotificationDelegate);
}

- (BOOL)isUserInterfaceContext
{
  return 0;
}

- (BOOL)isDatabaseCreationContext
{
  return 0;
}

- (id)storeUUID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PLManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStores");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C97A08]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)withDispatchGroup:(id)a3 performBlock:(id)a4
{
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  NSObject *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v6)
    dispatch_group_enter(v6);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__PLManagedObjectContext_withDispatchGroup_performBlock___block_invoke;
  v10[3] = &unk_1E3675C58;
  v11 = v6;
  v12 = v7;
  v8 = v6;
  v9 = v7;
  -[PLManagedObjectContext performBlock:](self, "performBlock:", v10);

}

- (BOOL)isReadOnly
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[PLManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStores");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isReadOnly");

  return v5;
}

- (id)pathManager
{
  void *v3;
  PLPhotoLibraryPathManager *v4;

  -[PLManagedObjectContext photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathManager");
  v4 = (PLPhotoLibraryPathManager *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v4 = self->_pathManager;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
      v4 = (PLPhotoLibraryPathManager *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v4;
}

- (id)pl_libraryBundle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PLManagedObjectContext photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleForLibraryURL:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)pl_graphCache
{
  void *v2;
  void *v3;

  -[PLManagedObjectContext pl_libraryBundle](self, "pl_libraryBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "graphCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)invalidateWithReason:(id)a3
{
  id v5;
  NSObject *v6;
  void (**v7)(_QWORD);
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLManagedObjectContext.m"), 615, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  if (-[PLManagedObjectContext isValidForSelector:error:](self, "isValidForSelector:error:", a2, 0))
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "PLManagedObjectContext invalidateWithReason: %@", buf, 0xCu);
    }

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47__PLManagedObjectContext_invalidateWithReason___block_invoke;
    v9[3] = &unk_1E3677C18;
    v9[4] = self;
    v10 = v5;
    v7 = (void (**)(_QWORD))MEMORY[0x19AEC174C](v9);
    if (-[PLManagedObjectContext concurrencyType](self, "concurrencyType") == 1)
      -[PLManagedObjectContext _directPerformBlockAndWait:](self, "_directPerformBlockAndWait:", v7);
    else
      v7[2](v7);

  }
}

- (void)pl_wrapperForPerformBlock:(id)a3
{
  void (**v3)(_QWORD);

  v3 = (void (**)(_QWORD))a3;
  objc_msgSend((id)objc_opt_class(), "_pl_megamoc_contextPerformDepthPush");
  v3[2](v3);
  objc_msgSend((id)objc_opt_class(), "_pl_megamoc_contextPerformDepthPop");

}

- (void)_logDatabaseDirectoryDiagnosticInfo
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  -[PLManagedObjectContext pathManager](self, "pathManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photosDatabasePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByDeletingLastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Diagnostic info for database directory:", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D73208], "logDiagnosticInfoForURL:", v5);
  }
  else
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "PLMOC pathManager database directory path is nil", v7, 2u);
    }
  }

}

- (id)existingObjectWithID:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  objc_super v12;
  id v13;

  v7 = a3;
  if (-[PLManagedObjectContext isValidForSelector:error:](self, "isValidForSelector:error:", a2, a4))
  {
    v12.receiver = self;
    v12.super_class = (Class)PLManagedObjectContext;
    v13 = 0;
    -[PLManagedObjectContext existingObjectWithID:error:](&v12, sel_existingObjectWithID_error_, v7, &v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v13;
    if (!v8)
    {
      -[PLManagedObjectContext photoLibrary](self, "photoLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handlePossibleCoreDataError:", v9);

      if (a4)
        *a4 = objc_retainAutorelease(v9);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)executeRequest:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  objc_super v12;
  id v13;

  v7 = a3;
  if (-[PLManagedObjectContext isValidForSelector:error:](self, "isValidForSelector:error:", a2, a4))
  {
    v12.receiver = self;
    v12.super_class = (Class)PLManagedObjectContext;
    v13 = 0;
    -[PLManagedObjectContext executeRequest:error:](&v12, sel_executeRequest_error_, v7, &v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v13;
    if (!v8)
    {
      -[PLManagedObjectContext photoLibrary](self, "photoLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handlePossibleCoreDataError:", v9);

      if (a4)
        *a4 = objc_retainAutorelease(v9);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)save:(id *)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _BOOL4 v11;
  void *v12;
  BOOL v13;
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
  int v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;
  id v30;
  uint8_t buf[8];
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  if (-[PLManagedObjectContext isValidForSelector:error:](self, "isValidForSelector:error:", a2, a3))
  {
    +[PLUnintendedChangeChecker checkForUnintendedChangesDuringeSave:withBlock:](PLUnintendedChangeChecker, "checkForUnintendedChangesDuringeSave:withBlock:", self, &__block_literal_global_15871);
    if (objc_msgSend((id)objc_opt_class(), "shouldHavePhotoLibrary"))
    {
      -[PLManagedObjectContext photoLibrary](self, "photoLibrary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        PLBackendGetLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "strongPhotoLibrary is nil during PLMOC save", buf, 2u);
        }

        v7 = (void *)MEMORY[0x1E0CB35C8];
        v8 = *MEMORY[0x1E0D74498];
        v32 = *MEMORY[0x1E0CB2938];
        v33[0] = CFSTR("strongPhotoLibrary is nil during PLMOC save");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 41003, v9);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (a3)
        {
          v10 = objc_retainAutorelease(v10);
          v5 = 0;
          LOBYTE(v11) = 0;
          *a3 = v10;
        }
        else
        {
          v5 = 0;
          LOBYTE(v11) = 0;
        }
LABEL_28:

        return v11;
      }
    }
    else
    {
      v5 = 0;
    }
    if (PLIsAssetsdProxyService())
    {
      -[PLManagedObjectContext hasChanges](self, "hasChanges");
      v12 = 0;
      v13 = 1;
    }
    else
    {
      v13 = -[PLManagedObjectContext isDatabaseCreationContext](self, "isDatabaseCreationContext");
      v12 = 0;
      if (-[PLManagedObjectContext hasChanges](self, "hasChanges") && !v13)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("PLTransactionScopeFileIngestion"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLManagedObjectContext pathManager](self, "pathManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLClientServerTransaction beginClientTransactionWithChangeScopes:pathManager:identifier:](PLClientServerTransaction, "beginClientTransactionWithChangeScopes:pathManager:identifier:", v14, v15, "-[PLManagedObjectContext save:]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[PLManagedObjectContext userInfo](self, "userInfo");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLClientServerTransaction addTransaction:toUserInfo:](PLClientServerTransaction, "addTransaction:toUserInfo:", v12, v16);

        -[PLManagedObjectContext _createDelayedSaveActionsWithTransaction:](self, "_createDelayedSaveActionsWithTransaction:", v12);
        v13 = 0;
      }
    }
    -[PLManagedObjectContext _setNameFromCurrentQoS](self, "_setNameFromCurrentQoS");
    v29.receiver = self;
    v29.super_class = (Class)PLManagedObjectContext;
    v30 = 0;
    v11 = -[PLManagedObjectContext save:](&v29, sel_save_, &v30);
    v10 = v30;
    -[PLManagedObjectContext _resetName](self, "_resetName");
    if (!v11)
    {
      objc_msgSend(v12, "abortTransaction");
      objc_msgSend(v5, "handlePossibleCoreDataError:", v10);
      if (a3)
        *a3 = objc_retainAutorelease(v10);
    }
    -[PLManagedObjectContext userInfo](self, "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObjectForKey:", CFSTR("PLMOCRedundantDeleteObjectIDs"));

    if (!v13)
    {
      -[PLManagedObjectContext userInfo](self, "userInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLClientServerTransaction removeTransactionFromUserInfo:](PLClientServerTransaction, "removeTransactionFromUserInfo:", v18);

      -[PLManagedObjectContext _destroyDelayedSaveActions](self, "_destroyDelayedSaveActions");
    }
    if (v11)
    {
      if (self->_needsBackgroundJobProcessing)
      {
        objc_msgSend(v5, "libraryServicesManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "backgroundJobService");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLManagedObjectContext pl_libraryBundle](self, "pl_libraryBundle");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "signalBackgroundProcessingNeededOnBundle:", v21);

        self->_needsBackgroundJobProcessing = 0;
      }
      if (-[NSMutableSet count](self->_backgroundWorkItemIdentifiers, "count"))
        -[NSMutableSet removeAllObjects](self->_backgroundWorkItemIdentifiers, "removeAllObjects");
      -[PLManagedObjectContext userInfo](self, "userInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("com.apple.photos.PLCameraPreviewWellNeedsUpdate"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "BOOLValue");

      if (v24)
      {
        objc_msgSend(v5, "libraryServicesManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "cameraPreviewWellManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "refreshPreviewWellImageWithContext:avoidNotificationIfLinkIsAlreadySet:", self, 1);

        -[PLManagedObjectContext userInfo](self, "userInfo");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", 0, CFSTR("com.apple.photos.PLCameraPreviewWellNeedsUpdate"));

      }
    }

    goto LABEL_28;
  }
  LOBYTE(v11) = 0;
  return v11;
}

- (void)_setNameFromCurrentQoS
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLManagedObjectContext pl_basename](self, "pl_basename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  qos_class_self();
  PLShortStringFromQoSClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[PLManagedObjectContext setName:](self, "setName:", v6);
}

- (void)_resetName
{
  id v3;

  -[PLManagedObjectContext pl_basename](self, "pl_basename");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectContext setName:](self, "setName:", v3);

}

- (BOOL)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4
{
  BOOL v6;
  id v7;
  void *v8;
  objc_super v10;
  id v11;

  v10.receiver = self;
  v10.super_class = (Class)PLManagedObjectContext;
  v11 = 0;
  v6 = -[PLManagedObjectContext obtainPermanentIDsForObjects:error:](&v10, sel_obtainPermanentIDsForObjects_error_, a3, &v11);
  v7 = v11;
  if (!v6)
  {
    -[PLManagedObjectContext photoLibrary](self, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handlePossibleCoreDataError:", v7);

    if (a4)
      *a4 = objc_retainAutorelease(v7);
  }

  return v6;
}

- (void)reset
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLManagedObjectContext;
  -[PLManagedObjectContext reset](&v4, sel_reset);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_lastResetTimestamp = v3;
}

- (void)performBlock:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  -[PLManagedObjectContext photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (PLIsAssetsd())
  {
    v6 = !self->_initFinished || v5 == 0;
    if (!v6
      && !+[PLManagedObjectContext _pl_megamoc_isInPLMocPerform](PLManagedObjectContext, "_pl_megamoc_isInPLMocPerform")&& !+[PLConcurrencyLimiter isRunningUnderLimiter](PLConcurrencyLimiter, "isRunningUnderLimiter"))
    {
      PLBackendGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_FAULT, "Unexpected direct call to performBlock: sidesteps concurrency limits, convert to a perform call on photoLibrary, or call PLConcurrencyLimiter directly for plain NSManagedObjectContexts.", v8, 2u);
      }

    }
  }
  -[PLManagedObjectContext _directPerformBlock:](self, "_directPerformBlock:", v4);

}

- (void)recordManagedObjectWillSave:(id)a3
{
  NSMutableDictionary *updatedObjectsAttributes;
  void *v5;
  NSMutableDictionary *updatedObjectsRelationships;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if ((objc_msgSend(v10, "isInserted") & 1) == 0)
  {
    if (objc_msgSend(v10, "isDeleted"))
    {
      updatedObjectsAttributes = self->_updatedObjectsAttributes;
      objc_msgSend(v10, "objectID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](updatedObjectsAttributes, "removeObjectForKey:", v5);

      updatedObjectsRelationships = self->_updatedObjectsRelationships;
      objc_msgSend(v10, "objectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](updatedObjectsRelationships, "removeObjectForKey:", v7);
LABEL_8:

      goto LABEL_9;
    }
    if (objc_msgSend(v10, "isUpdated"))
    {
      objc_msgSend(v10, "changedValues");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allKeys");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
      {
        objc_msgSend(v10, "objectID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLManagedObjectContext _recordChangedKeys:forObjectID:](self, "_recordChangedKeys:forObjectID:", v8, v9);

      }
      goto LABEL_8;
    }
  }
LABEL_9:

}

- (void)recordChangesFromTriggerModifiedObjectIDs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const __CFString **v13;
  void *v14;
  int v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  const __CFString *v21;
  const __CFString *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "entity");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLManagedObject entityInManagedObjectContext:](PLPerson, "entityInManagedObjectContext:", self);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isKindOfEntity:", v11);

        if (v12)
        {
          v22 = CFSTR("faceCount");
          v13 = &v22;
        }
        else
        {
          +[PLManagedObject entityInManagedObjectContext:](PLDetectedFace, "entityInManagedObjectContext:", self);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v10, "isKindOfEntity:", v14);

          if (!v15)
            goto LABEL_11;
          v21 = CFSTR("assetVisible");
          v13 = &v21;
        }
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLManagedObjectContext _recordChangedKeys:forObjectID:](self, "_recordChangedKeys:forObjectID:", v16, v9);

LABEL_11:
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v6);
  }

}

- (void)_recordChangedKeys:(id)a3 forObjectID:(id)a4
{
  +[PLPropertyIndexMapping recordChangedKeys:forObjectID:inAttributesByOID:relationshipsByOID:](PLPropertyIndexMapping, "recordChangedKeys:forObjectID:inAttributesByOID:relationshipsByOID:", a3, a4, self->_updatedObjectsAttributes, self->_updatedObjectsRelationships);
}

- (void)getAndClearUpdatedObjectsAttributes:(id *)a3 relationships:(id *)a4
{
  if (a3)
  {
    *a3 = (id)-[NSMutableDictionary copy](self->_updatedObjectsAttributes, "copy");
    -[NSMutableDictionary removeAllObjects](self->_updatedObjectsAttributes, "removeAllObjects");
  }
  if (a4)
  {
    *a4 = (id)-[NSMutableDictionary copy](self->_updatedObjectsRelationships, "copy");
    -[NSMutableDictionary removeAllObjects](self->_updatedObjectsRelationships, "removeAllObjects");
  }
}

- (PLDelayedSaveActions)delayedSaveActions
{
  return self->_delayedSaveActions;
}

- (void)_createDelayedSaveActionsWithTransaction:(id)a3
{
  id v4;
  PLDelayedSaveActions *v5;
  PLDelayedSaveActions *delayedSaveActions;

  v4 = a3;
  v5 = -[PLDelayedSaveActions initWithClientTransaction:]([PLDelayedSaveActions alloc], "initWithClientTransaction:", v4);

  delayedSaveActions = self->_delayedSaveActions;
  self->_delayedSaveActions = v5;

}

- (void)_destroyDelayedSaveActions
{
  PLDelayedSaveActions *delayedSaveActions;

  delayedSaveActions = self->_delayedSaveActions;
  self->_delayedSaveActions = 0;

}

- (BOOL)hasPreviouslyMergedDeleteForObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PLManagedObjectContext userInfo](self, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("PLMOCRedundantDeleteObjectIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "containsObject:", v7);
  return (char)v4;
}

- (void)registerFilesystemDeletionInfo:(id)a3
{
  PLDelayedFiledSystemDeletions *v4;
  PLDelayedFiledSystemDeletions *delayedDeletions;
  void *v6;
  id v7;

  v7 = a3;
  if (!self->_delayedDeletions)
  {
    v4 = objc_alloc_init(PLDelayedFiledSystemDeletions);
    delayedDeletions = self->_delayedDeletions;
    self->_delayedDeletions = v4;

  }
  -[PLManagedObjectContext delayedDeletions](self, "delayedDeletions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addFilesystemDeletionInfo:", v7);

}

- (void)recordAvalancheUUIDForUpdate:(id)a3
{
  void *v4;
  NSMutableSet *avalancheUUIDsForUpdate;
  NSMutableSet *v6;
  NSMutableSet *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "avalancheUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(v9, "isDeleted"))
  {
    avalancheUUIDsForUpdate = self->_avalancheUUIDsForUpdate;
    if (!avalancheUUIDsForUpdate)
    {
      v6 = (NSMutableSet *)objc_opt_new();
      v7 = self->_avalancheUUIDsForUpdate;
      self->_avalancheUUIDsForUpdate = v6;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:selector:name:object:", objc_opt_class(), sel_handleUpdatesForContextWillSave_, *MEMORY[0x1E0C978B8], self);

      avalancheUUIDsForUpdate = self->_avalancheUUIDsForUpdate;
    }
    -[NSMutableSet addObject:](avalancheUUIDsForUpdate, "addObject:", v4);
  }

}

- (id)getAndClearRecordedAvalancheUUIDsForUpdate
{
  void *v3;

  v3 = (void *)-[NSMutableSet copy](self->_avalancheUUIDsForUpdate, "copy");
  -[NSMutableSet removeAllObjects](self->_avalancheUUIDsForUpdate, "removeAllObjects");
  return v3;
}

- (void)recordCloudDeletionForObject:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "cloudDeletionType");
  objc_msgSend(v4, "cloudUUIDForDeletion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && !-[PLManagedObjectContext isLocalOnlyDelete](self, "isLocalOnlyDelete")
    && (-[PLManagedObjectContext photoLibrary](self, "photoLibrary"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isCloudPhotoLibraryEnabled"),
        v7,
        v8))
  {
    PLPersistentHistoryGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v11;
      v17 = 2114;
      v18 = v6;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Marking as CPLCloudDeleteStateDeleted: %{public}@ [cloudGUID: %{public}@]", (uint8_t *)&v15, 0x16u);

    }
    objc_msgSend(v4, "setCloudDeleteState:", 1);
    -[PLManagedObjectContext recordSyncChangeMarker](self, "recordSyncChangeMarker");
    -[PLManagedObjectContext _addCloudUUID:forDeletionType:](self, "_addCloudUUID:forDeletionType:", v6, v5);
  }
  else
  {
    PLPersistentHistoryGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v14;
      v17 = 2114;
      v18 = v6;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEBUG, "NOT marking as CPLCloudDeleteStateDeleted: %{public}@ [cloudGUID: %{public}@]", (uint8_t *)&v15, 0x16u);

    }
  }

}

- (void)_addCloudUUID:(id)a3 forDeletionType:(int64_t)a4
{
  id v6;
  __CFString *v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4)
  {
    if ((unint64_t)a4 > 0xD)
      v7 = CFSTR("cloudUnknownDeleteGUIDs");
    else
      v7 = off_1E36690E8[a4 - 1];
    v9 = v7;
    -[NSMutableDictionary objectForKey:](self->_uuidsForCloudDeletion, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    if (!v11)
      v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "addObject:", v6);
    -[NSMutableDictionary setObject:forKey:](self->_uuidsForCloudDeletion, "setObject:forKey:", v11, v9);

  }
  else
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v12 = 134218242;
      v13 = 0;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_FAULT, "unexpected cloudDeletionType %ld for cloudUUID %@", (uint8_t *)&v12, 0x16u);
    }

  }
}

- (id)getAndClearRecordedObjectsForCloudDeletion
{
  void *v3;

  v3 = (void *)-[NSMutableDictionary copy](self->_uuidsForCloudDeletion, "copy");
  -[NSMutableDictionary removeAllObjects](self->_uuidsForCloudDeletion, "removeAllObjects");
  return v3;
}

- (void)recordSyncChangeMarker
{
  self->_syncChangeMarker = 1;
  -[PLManagedObjectContext updateTransactionAuthor](self, "updateTransactionAuthor");
}

- (BOOL)getAndClearSyncChangeMarker
{
  BOOL syncChangeMarker;

  syncChangeMarker = self->_syncChangeMarker;
  self->_syncChangeMarker = 0;
  -[PLManagedObjectContext updateTransactionAuthor](self, "updateTransactionAuthor");
  return syncChangeMarker;
}

- (void)setChangeSource:(int)a3
{
  self->_changeSource = a3;
  -[PLManagedObjectContext updateTransactionAuthor](self, "updateTransactionAuthor");
}

- (void)setNonCoalescing:(BOOL)a3
{
  self->_nonCoalescing = a3;
  -[PLManagedObjectContext updateTransactionAuthor](self, "updateTransactionAuthor");
}

- (BOOL)_tooManyAssetChangesToHandle:(unint64_t)a3
{
  _BOOL4 v4;
  unint64_t v5;

  v4 = -[PLChangeHandlingContainer isMergingCoalescedSaveNotification](self->_changeHandlingContainer, "isMergingCoalescedSaveNotification");
  v5 = 100;
  if (v4)
    v5 = 50;
  return v5 < a3;
}

- (void)recordNeedsBackgroundJobProcessing
{
  self->_needsBackgroundJobProcessing = 1;
}

- (void)recordBackgroundJobWorkItemCreated:(id)a3
{
  NSMutableSet *backgroundWorkItemIdentifiers;
  id v4;

  backgroundWorkItemIdentifiers = self->_backgroundWorkItemIdentifiers;
  objc_msgSend(a3, "jobIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](backgroundWorkItemIdentifiers, "addObject:", v4);

}

- (BOOL)hasRecordedBackgroundWorkItemWithIdentifier:(id)a3 jobType:(signed __int16)a4 jobFlags:(int64_t)a5
{
  NSMutableSet *backgroundWorkItemIdentifiers;
  void *v6;

  backgroundWorkItemIdentifiers = self->_backgroundWorkItemIdentifiers;
  +[PLBackgroundJobWorkItem jobIdentifierWithIdentifier:jobType:jobFlags:](PLBackgroundJobWorkItem, "jobIdentifierWithIdentifier:jobType:jobFlags:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(backgroundWorkItemIdentifiers) = -[NSMutableSet containsObject:](backgroundWorkItemIdentifiers, "containsObject:", v6);

  return (char)backgroundWorkItemIdentifiers;
}

- (id)pl_fetchObjectsWithIDs:(id)a3 rootEntity:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(v8, "setEntity:", v7);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF in %@"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);

  v15 = 0;
  -[PLManagedObjectContext executeFetchRequest:error:](self, "executeFetchRequest:error:", v8, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;
  if (!v10)
  {
    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v13;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch %@ oids %@: %@", buf, 0x20u);

    }
  }

  return v10;
}

- (id)pl_fetchObjectsWithIDs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v30;
  id v31;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v10, "entity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "superentity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          do
          {
            objc_msgSend(v11, "superentity");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v13, "superentity");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            v11 = v13;
          }
          while (v14);
        }
        else
        {
          v13 = v11;
        }
        objc_msgSend(v4, "objectForKey:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v15, v13);
        }
        objc_msgSend(v15, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
    }
    while (v7);
  }
  v30 = v5;

  v16 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(v16, "setIncludesPropertyValues:", 0);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v17 = v4;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v35 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        objc_msgSend(v17, "objectForKey:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setEntity:", v22);
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF in %@"), v23, v30);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setPredicate:", v24);

        v33 = 0;
        -[PLManagedObjectContext executeFetchRequest:error:](self, "executeFetchRequest:error:", v16, &v33);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v33;
        if (v25)
        {
          objc_msgSend(v31, "addObjectsFromArray:", v25);
        }
        else
        {
          PLBackendGetLog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v22, "name");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v43 = v28;
            v44 = 2112;
            v45 = v23;
            v46 = 2112;
            v47 = v26;
            _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "Failed to fetch %@ oids %@: %@", buf, 0x20u);

          }
        }

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
    }
    while (v19);
  }

  return v31;
}

- (void)_notifyALAssetsLibraryWithChanges:(id)a3 usingObjectIDs:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void (**v78)(_QWORD, _QWORD, _QWORD);
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  BOOL v91;
  void *v92;
  void *v93;
  id v94;
  id v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  _BOOL4 v101;
  uint64_t v102;
  void *v103;
  PLManagedObjectContext *v104;
  void *v105;
  id obj;
  void *v107;
  _QWORD v108[5];
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _QWORD v117[4];
  id v118;
  id v119;
  id v120;
  BOOL v121;
  _QWORD v122[2];
  _QWORD v123[2];
  _QWORD v124[2];
  _QWORD v125[2];
  _BYTE v126[128];
  _BYTE v127[128];
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x19AEC1554]();
  if (+[PLManagedObjectContext assetsLibraryLoggingEnabled](PLManagedObjectContext, "assetsLibraryLoggingEnabled"))
  {
    NSLog(CFSTR("##### %@ _notifyALAssetsLibraryWithChanges: %@"), self, v5);
  }
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C97880]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_63;
  v96 = v6;
  +[PLManagedObject entityInManagedObjectContext:](PLManagedAlbum, "entityInManagedObjectContext:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedObject entityInManagedObjectContext:](PLManagedAsset, "entityInManagedObjectContext:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[PLPhotoLibrary _assetsLibrary_isSharedPhotoStreamsSupportEnabled](PLPhotoLibrary, "_assetsLibrary_isSharedPhotoStreamsSupportEnabled");
  +[PLManagedObject entityInManagedObjectContext:](PLCloudSharedAlbum, "entityInManagedObjectContext:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v117[0] = MEMORY[0x1E0C809B0];
  v117[1] = 3221225472;
  v117[2] = __75__PLManagedObjectContext__notifyALAssetsLibraryWithChanges_usingObjectIDs___block_invoke;
  v117[3] = &unk_1E3664268;
  v95 = v8;
  v118 = v95;
  v91 = v10;
  v121 = v10;
  v94 = v11;
  v119 = v94;
  v12 = v9;
  v120 = v12;
  v13 = MEMORY[0x19AEC174C](v117);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C97870]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = (void *)v14;
  (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v13 + 16))(v13, v16, v14, v15);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C97A18]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t, void *))(v13 + 16))(v13, v19, v17, v18);

  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C979A0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t, void *))(v13 + 16))(v13, v20, v17, v18);

  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C97888]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = (void *)v17;
  (*(void (**)(uint64_t, void *, uint64_t, void *))(v13 + 16))(v13, v21, v17, v18);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = objc_claimAutoreleasedReturnValue();
  v97 = v5;
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C97838]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = (void *)v13;
  v100 = (void *)v22;
  v105 = (void *)v23;
  (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v13 + 16))(v13, v24, v22, v23);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = (void *)v15;
  v26 = v15;
  v27 = v25;
  objc_msgSend(v25, "addObjectsFromArray:", v26);
  objc_msgSend(v27, "addObjectsFromArray:", v18);
  v99 = v18;
  v101 = -[PLManagedObjectContext _tooManyAssetChangesToHandle:](self, "_tooManyAssetChangesToHandle:", objc_msgSend(v18, "count"));
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v104 = self;
  -[PLChangeHandlingContainer allDidSaveObjectIDsUserInfo](self->_changeHandlingContainer, "allDidSaveObjectIDsUserInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("PLUpdatedAttributesByObjectIDKey"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v113, v127, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v114;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v114 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * i);
        objc_msgSend(v34, "entity");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "isKindOfEntity:", v12);

        if (v36)
          objc_msgSend(v27, "addObject:", v34);
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v113, v127, 16);
    }
    while (v31);
  }

  self = v104;
  v37 = v98;
  if (!v101)
  {
    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    v110 = 0u;
    +[PLGenericAlbum allAlbumsRegisteredWithManagedObjectContext:](PLFetchingAlbum, "allAlbumsRegisteredWithManagedObjectContext:", v104);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v126, 16);
    if (!v38)
      goto LABEL_28;
    v39 = v38;
    v40 = *(_QWORD *)v110;
    v102 = *(_QWORD *)v110;
    v103 = v27;
    while (1)
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v110 != v40)
          objc_enumerationMutation(obj);
        v42 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * j);
        if (objc_msgSend(v42, "isLibrary"))
        {
          if (objc_msgSend(v105, "count"))
            goto LABEL_25;
          v43 = (void *)MEMORY[0x1E0C97B48];
          +[PLManagedAsset entityName](PLManagedAsset, "entityName");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "fetchRequestWithEntityName:", v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          v46 = (void *)MEMORY[0x1E0CB3528];
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), v27);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v125[0] = v47;
          objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForFinderSyncedAsset"), 1);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v125[1] = v48;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v125, 2);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "andPredicateWithSubpredicates:", v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setPredicate:", v50);

          v27 = v103;
          objc_msgSend(v45, "setFetchLimit:", 1);
          objc_msgSend(v45, "setResultType:", 4);
          objc_msgSend(v45, "setIncludesPropertyValues:", 0);
          objc_msgSend(v45, "setIncludesPendingChanges:", 0);
          v51 = -[PLManagedObjectContext countForFetchRequest:error:](v104, "countForFetchRequest:error:", v45, 0);

          if (v51)
            goto LABEL_25;
        }
        else if (+[PLManagedObjectContext _isAssetLibraryFetchingAlbum:](PLManagedObjectContext, "_isAssetLibraryFetchingAlbum:", v42))
        {
          v52 = (void *)MEMORY[0x1E0C97B48];
          +[PLManagedAsset entityName](PLManagedAsset, "entityName");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "fetchRequestWithEntityName:", v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          v55 = (void *)MEMORY[0x1E0CB3528];
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), v27);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v124[0] = v56;
          objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForNotifyALAssetsLibraryWithChangesExclusions"), 1);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v124[1] = v57;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 2);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "andPredicateWithSubpredicates:", v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          +[PLFetchingAlbum predicateForAlbumKind:](PLFetchingAlbum, "predicateForAlbumKind:", objc_msgSend(v42, "kindValue"));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = (void *)MEMORY[0x1E0CB3528];
          v123[0] = v59;
          v123[1] = v60;
          v40 = v102;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v123, 2);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "andPredicateWithSubpredicates:", v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v54, "setPredicate:", v63);
          objc_msgSend(v54, "setFetchLimit:", 1);
          objc_msgSend(v54, "setResultType:", 4);
          objc_msgSend(v54, "setIncludesPropertyValues:", 0);
          objc_msgSend(v54, "setIncludesPendingChanges:", 0);
          v64 = -[PLManagedObjectContext countForFetchRequest:error:](v104, "countForFetchRequest:error:", v54, 0);

          v27 = v103;
          if (v64)
          {
LABEL_25:
            objc_msgSend(v42, "objectID");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v107, "addObject:", v65);

            objc_msgSend(v42, "updateSnapshotAndClearCaches:", 0);
            continue;
          }
        }
      }
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v126, 16);
      if (!v39)
      {
LABEL_28:

        self = v104;
        v37 = v98;
        if (+[PLManagedObjectContext assetsLibraryLoggingEnabled](PLManagedObjectContext, "assetsLibraryLoggingEnabled"))
        {
          NSLog(CFSTR("##### %@ insertedAlbumOIDs: %@"), v104, v98);
          NSLog(CFSTR("##### %@ updatedAlbumOIDs: %@"), v104, v107);
          NSLog(CFSTR("##### %@ updatedAssetOIDs: %@"), v104, v99);
        }
        v66 = v99;
        v67 = v66;
        if (v91)
        {
          v68 = v66;
        }
        else
        {
          v69 = (void *)MEMORY[0x1E0C97B48];
          +[PLManagedAsset entityName](PLManagedAsset, "entityName");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "fetchRequestWithEntityName:", v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          v72 = (void *)MEMORY[0x1E0CB3528];
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), v67);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v122[0] = v73;
          objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForNotifyALAssetsLibraryWithChangesCloudSharedExclusions"), 1);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v122[1] = v74;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v122, 2);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "andPredicateWithSubpredicates:", v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "setPredicate:", v76);

          self = v104;
          objc_msgSend(v71, "setResultType:", 1);
          objc_msgSend(v71, "setIncludesPropertyValues:", 0);
          objc_msgSend(v71, "setIncludesPendingChanges:", 0);
          -[PLManagedObjectContext executeFetchRequest:error:](v104, "executeFetchRequest:error:", v71, 0);
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          if (+[PLManagedObjectContext assetsLibraryLoggingEnabled](PLManagedObjectContext, "assetsLibraryLoggingEnabled"))
          {
            NSLog(CFSTR("##### %@ updatedAssetOIDsFiltered: %@"), v104, v68);
          }

        }
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v98, "count")
          || objc_msgSend(v107, "count")
          || objc_msgSend(v100, "count")
          || objc_msgSend(v68, "count"))
        {
          v108[0] = MEMORY[0x1E0C809B0];
          v108[1] = 3221225472;
          v108[2] = __75__PLManagedObjectContext__notifyALAssetsLibraryWithChanges_usingObjectIDs___block_invoke_2;
          v108[3] = &unk_1E3664290;
          v108[4] = self;
          v78 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19AEC174C](v108);
          if (objc_msgSend(v98, "count"))
          {
            ((void (**)(_QWORD, void *, uint64_t))v78)[2](v78, v98, 1);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v79, "count"))
              objc_msgSend(v77, "setObject:forKey:", v79, CFSTR("insertedAssetGroups"));

          }
          if (objc_msgSend(v107, "count"))
          {
            ((void (**)(_QWORD, void *, _QWORD))v78)[2](v78, v107, 0);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v80, "count"))
              objc_msgSend(v77, "setObject:forKey:", v80, CFSTR("updatedAssetGroups"));

          }
          if (objc_msgSend(v100, "count"))
          {
            ((void (**)(_QWORD, void *, _QWORD))v78)[2](v78, v100, 0);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v81, "count"))
              objc_msgSend(v77, "setObject:forKey:", v81, CFSTR("deletedAssetGroups"));

          }
          if (objc_msgSend(v68, "count"))
          {
            ((void (**)(_QWORD, void *, _QWORD))v78)[2](v78, v68, 0);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v82, "count"))
              objc_msgSend(v77, "setObject:forKey:", v82, CFSTR("updatedAssets"));

          }
        }
        if (v91 || objc_msgSend(v77, "count"))
        {
          if (+[PLManagedObjectContext assetsLibraryLoggingEnabled](PLManagedObjectContext, "assetsLibraryLoggingEnabled"))
          {
            NSLog(CFSTR("##### %@ PLGenericChangeNotification: %@"), self, v77);
          }
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = (void *)MEMORY[0x1E0CB37C0];
          -[PLManagedObjectContext photoLibrary](self, "photoLibrary");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "notificationWithName:object:userInfo:", CFSTR("PLGenericChangeNotification"), v85, v77);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "postNotification:", v86);

        }
        break;
      }
    }
  }

  v6 = v96;
  v5 = v97;
  if (v101)
  {
LABEL_63:
    -[PLManagedObjectContext resetAllFetchingAlbums](self, "resetAllFetchingAlbums");
    if (+[PLManagedObjectContext assetsLibraryLoggingEnabled](PLManagedObjectContext, "assetsLibraryLoggingEnabled"))
    {
      NSLog(CFSTR("##### %@ PLGenericChangeNotification: TOO LARGE"), self);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = (void *)MEMORY[0x1E0CB37C0];
    -[PLManagedObjectContext photoLibrary](self, "photoLibrary");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "notificationWithName:object:userInfo:", CFSTR("PLGenericChangeNotification"), v89, 0);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "postNotification:", v90);

  }
  objc_autoreleasePoolPop(v6);

}

- (void)resetAllFetchingAlbums
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  +[PLGenericAlbum allAlbumsRegisteredWithManagedObjectContext:](PLFetchingAlbum, "allAlbumsRegisteredWithManagedObjectContext:", self, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if (objc_msgSend((id)objc_opt_class(), "_isAssetLibraryFetchingAlbum:", v7))
          objc_msgSend(v7, "updateSnapshotAndClearCaches:", 0);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_mergeChangesFromDidSaveDictionary:(id)a3 usingObjectIDs:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x19AEC1554]();
  v8 = -[PLManagedObjectContext mergingChanges](self, "mergingChanges");
  if (!v8)
    self->_mergingChanges = 1;
  -[PLManagedObjectContext userInfo](self, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("PLMOCRedundantDeleteObjectIDs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObjectContext userInfo](self, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v10, CFSTR("PLMOCRedundantDeleteObjectIDs"));

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C97838]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v10, "addObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  v19.receiver = self;
  v19.super_class = (Class)PLManagedObjectContext;
  -[PLManagedObjectContext _mergeChangesFromDidSaveDictionary:usingObjectIDs:](&v19, sel__mergeChangesFromDidSaveDictionary_usingObjectIDs_, v6, v4);
  -[PLManagedObjectContext ptpNotificationDelegate](self, "ptpNotificationDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    -[PLManagedObjectContext processPendingChanges](self, "processPendingChanges");
  if (-[PLManagedObjectContext isBackingALAssetsLibrary](self, "isBackingALAssetsLibrary"))
  {
    -[PLManagedObjectContext photoLibrary](self, "photoLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      -[PLManagedObjectContext _notifyALAssetsLibraryWithChanges:usingObjectIDs:](self, "_notifyALAssetsLibraryWithChanges:usingObjectIDs:", v6, v4);
  }
  if (!v8)
    self->_mergingChanges = 0;

  objc_autoreleasePoolPop(v7);
}

- (BOOL)_adjustmentTimestampChangedChangedAttribute:(id)a3 from:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  BOOL v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  if (v10)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedLongLongValue");

    v19[0] = CFSTR("adjustmentTimestamp");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[PLPropertyIndexMapping indexValueForAttributeNames:entity:](PLPropertyIndexMapping, "indexValueForAttributeNames:entity:", v13, v15);

    v17 = (v16 & v12) != 0;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_getInsertedIDs:(id)a3 deletedIDs:(id)a4 changedIDs:(id)a5 adjustedIDs:(id)a6 ofEntityKind:(id)a7 fromRemoteContextDidSaveObjectIDsNotification:(id)a8
{
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  int v24;
  char v25;
  void *v26;
  char v27;
  _BOOL4 v28;
  id obj;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v41 = a4;
  v38 = a5;
  v37 = a6;
  v13 = a7;
  objc_msgSend(a8, "userInfo");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("PLUpdatedAttributesByObjectIDKey"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  +[PLManagedObjectContext changeNotificationObjectIDKeys](PLManagedObjectContext, "changeNotificationObjectIDKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v32)
  {
    v30 = *(_QWORD *)v48;
    v14 = *MEMORY[0x1E0C97870];
    v40 = *MEMORY[0x1E0C97838];
    v39 = *MEMORY[0x1E0C97A18];
    v34 = *MEMORY[0x1E0C979A0];
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v48 != v30)
          objc_enumerationMutation(obj);
        v33 = v15;
        v16 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v15);
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        objc_msgSend(v31, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v44;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v44 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
              objc_msgSend(v22, "entity");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "isKindOfEntity:", v13);

              if (v24)
              {
                if ((v25 = objc_msgSend(v16, "isEqualToString:", v14), v26 = v42, (v25 & 1) != 0)
                  || (v27 = objc_msgSend(v16, "isEqualToString:", v40), v26 = v41, (v27 & 1) != 0)
                  || ((objc_msgSend(v16, "isEqualToString:", v39) & 1) != 0
                   || objc_msgSend(v16, "isEqualToString:", v34))
                  && (objc_msgSend(v38, "addObject:", v22),
                      v28 = -[PLManagedObjectContext _adjustmentTimestampChangedChangedAttribute:from:](self, "_adjustmentTimestampChangedChangedAttribute:from:", v22, v36), v26 = v37, v28))
                {
                  objc_msgSend(v26, "addObject:", v22);
                }
              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
          }
          while (v19);
        }

        v15 = v33 + 1;
      }
      while (v33 + 1 != v32);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    }
    while (v32);
  }

}

- (void)_informPTPDelegateAboutChangesFromRemoteContextSaveNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  PLManagedObjectContext *v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v15 = a3;
  v4 = (void *)MEMORY[0x19AEC1554]();
  -[PLManagedObjectContext ptpNotificationDelegate](self, "ptpNotificationDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedObject entityInManagedObjectContext:](PLManagedAsset, "entityInManagedObjectContext:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObjectContext _getInsertedIDs:deletedIDs:changedIDs:adjustedIDs:ofEntityKind:fromRemoteContextDidSaveObjectIDsNotification:](self, "_getInsertedIDs:deletedIDs:changedIDs:adjustedIDs:ofEntityKind:fromRemoteContextDidSaveObjectIDsNotification:", v6, v7, v8, v9, v10, v15);
    v11 = objc_msgSend(v6, "count");
    v12 = objc_msgSend(v7, "count") + v11;
    v13 = v12 + objc_msgSend(v8, "count");
    if (v13 + objc_msgSend(v9, "count"))
    {
      v14 = -[PLManagedObjectContext concurrencyType](self, "concurrencyType");
      if (v14 == *MEMORY[0x1E0C97C38])
      {
        objc_msgSend(v5, "managedObjectContext:libraryChangedWithInsertedAssetIDs:deletedAssetIDs:changedAssetIDs:adjustedAssetIDs:", self, v6, v7, v8, v9);
      }
      else
      {
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __90__PLManagedObjectContext__informPTPDelegateAboutChangesFromRemoteContextSaveNotification___block_invoke;
        v16[3] = &unk_1E3675A78;
        v17 = v5;
        v18 = self;
        v19 = v6;
        v20 = v7;
        v21 = v8;
        v22 = v9;
        -[PLManagedObjectContext _directPerformBlockAndWait:](self, "_directPerformBlockAndWait:", v16);

      }
    }

  }
  objc_autoreleasePoolPop(v4);

}

- (void)appendDelayedDeletionsToXPCMessage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PLManagedObjectContext delayedDeletions](self, "delayedDeletions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendToXPCMessage:managedObjectContext:", v4, self);

  -[PLManagedObjectContext setDelayedDeletions:](self, "setDelayedDeletions:", 0);
}

- (BOOL)shouldMergeFromRemoteContextWithChanges:(id)a3
{
  return 1;
}

- (BOOL)mergingChanges
{
  return self->_mergingChanges;
}

- (BOOL)savingDuringMerge
{
  return self->_savingDuringMerge;
}

- (PLDelayedFiledSystemDeletions)delayedDeletions
{
  return self->_delayedDeletions;
}

- (void)setDelayedDeletions:(id)a3
{
  objc_storeStrong((id *)&self->_delayedDeletions, a3);
}

- (BOOL)regenerateVideoThumbnails
{
  return self->_regenerateVideoThumbnails;
}

- (void)setRegenerateVideoThumbnails:(BOOL)a3
{
  self->_regenerateVideoThumbnails = a3;
}

- (int)changeSource
{
  return self->_changeSource;
}

- (BOOL)nonCoalescing
{
  return self->_nonCoalescing;
}

- (BOOL)isInitializingSingletons
{
  return self->_isInitializingSingletons;
}

- (void)setIsInitializingSingletons:(BOOL)a3
{
  self->_isInitializingSingletons = a3;
}

- (BOOL)isBackingALAssetsLibrary
{
  return self->_isBackingALAssetsLibrary;
}

- (void)setIsBackingALAssetsLibrary:(BOOL)a3
{
  self->_isBackingALAssetsLibrary = a3;
}

- (int64_t)resetCloudLibraryMode
{
  return self->_resetCloudLibraryMode;
}

- (void)setResetCloudLibraryMode:(int64_t)a3
{
  self->_resetCloudLibraryMode = a3;
}

- (BOOL)isLocalOnlyDelete
{
  return self->_localOnlyDelete;
}

- (void)setLocalOnlyDelete:(BOOL)a3
{
  self->_localOnlyDelete = a3;
}

- (NSString)pl_basename
{
  return self->_pl_basename;
}

- (void)setPl_basename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (BOOL)pl_suppressUnhandledErrorDuringPerform
{
  return self->_pl_suppressUnhandledErrorDuringPerform;
}

- (void)setPl_suppressUnhandledErrorDuringPerform:(BOOL)a3
{
  self->_pl_suppressUnhandledErrorDuringPerform = a3;
}

uint64_t __90__PLManagedObjectContext__informPTPDelegateAboutChangesFromRemoteContextSaveNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "managedObjectContext:libraryChangedWithInsertedAssetIDs:deletedAssetIDs:changedAssetIDs:adjustedAssetIDs:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

void __75__PLManagedObjectContext__notifyALAssetsLibraryWithChanges_usingObjectIDs___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v14, "objectID");
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = v14;
        }
        v16 = v15;
        if (v15)
        {
          objc_msgSend(v15, "entity");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v8
            && objc_msgSend(v17, "isKindOfEntity:", *(_QWORD *)(a1 + 32))
            && ((v19 = v8, *(_BYTE *)(a1 + 56))
             || (v20 = objc_msgSend(v18, "isKindOfEntity:", *(_QWORD *)(a1 + 40)), v19 = v8, !v20))
            || v9 && (v21 = objc_msgSend(v18, "isKindOfEntity:", *(_QWORD *)(a1 + 48)), v19 = v9, v21))
          {
            objc_msgSend(v19, "addObject:", v16);
          }

        }
      }
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

}

id __75__PLManagedObjectContext__notifyALAssetsLibraryWithChanges_usingObjectIDs___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v20;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectRegisteredForID:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = v6;
          v16 = v14;
LABEL_8:
          objc_msgSend(v15, "addObject:", v16);
          goto LABEL_13;
        }
        if (a3)
        {
          if (v10)
          {
            v15 = v10;
            v16 = v13;
            goto LABEL_8;
          }
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v13, 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
LABEL_13:

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (!v9)
      {

        if (v10)
        {
          objc_msgSend(*(id *)(a1 + 32), "pl_fetchObjectsWithIDs:", v7);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObjectsFromArray:", v17);
          goto LABEL_18;
        }
        goto LABEL_19;
      }
    }
  }
  v10 = 0;
  v17 = v7;
LABEL_18:

LABEL_19:
  return v6;
}

void __31__PLManagedObjectContext_save___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  PLBackendGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138413058;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_FAULT, "Unintended change during save: key %@, value: %@, context %@, object %@", buf, 0x2Au);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unintended change during save: key %@, value: %@, context %@, object %@"), v8, v9, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLDiagnostics fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:](PLDiagnostics, "fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:", CFSTR("Unexpected Photo Library state"), CFSTR("Please file a Radar against Photos"), CFSTR("TTR: Unintended change during save"), v13);

}

void __47__PLManagedObjectContext_invalidateWithReason___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 296));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 304), *(id *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 296));
}

void __57__PLManagedObjectContext_withDispatchGroup_performBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(NSObject **)(a1 + 32);
  if (v2)
    dispatch_group_leave(v2);
}

uint64_t __46__PLManagedObjectContext__directPerformBlock___block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_opt_class(), "_pl_megamoc_contextPerformDepthPush");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend((id)objc_opt_class(), "_pl_megamoc_contextPerformDepthPop");
}

+ (id)contextForUninitializedPhotoLibrary:(id)a3 automaticallyMerges:(BOOL)a4 automaticallyPinToFirstFetch:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  void *v9;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  pl_dispatch_once();
  v9 = (void *)objc_msgSend(a1, "newContextForPhotoLibrary:automaticallyMerges:", v8, v6);
  objc_msgSend(a1, "_setupNameForContext:withLibrary:", v9, v8);
  if (v5)
    objc_msgSend(a1, "_setupInitialQueryGenerationForContext:", v9);
  objc_msgSend(v9, "_pl_setupStalenessInterval");
  objc_msgSend(v9, "setPhotoLibrary:", v8);

  return v9;
}

+ (id)newContextForPhotoLibrary:(id)a3 automaticallyMerges:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  objc_class *v7;
  char isKindOfClass;
  uint64_t v9;
  void *v10;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "libraryBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 || !v4)
  {
    if ((isKindOfClass & 1) != 0)
      v9 = 2;
    else
      v9 = 1;
    v7 = (objc_class *)objc_opt_class();
  }
  else
  {
    v9 = 1;
  }
  v10 = (void *)objc_msgSend([v7 alloc], "initWithConcurrencyType:libraryBundle:", v9, v6);

  return v10;
}

+ (void)_setupNameForContext:(id)a3 withLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "libraryURL");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D73208], "redactedDescriptionForFileURL:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("anon");
  if (v9)
    v11 = (__CFString *)v9;
  v12 = v11;

  v13 = objc_msgSend(v5, "role");
  +[PLPhotoLibrary stringFromLibraryRole:](PLPhotoLibrary, "stringFromLibraryRole:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@) %@"), v12, v8, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPl_basename:", v15);
  objc_msgSend(v6, "setName:", v15);

}

+ (void)_setupInitialQueryGenerationForContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id obj;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C97C18], "currentQueryGenerationToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__15981;
  v22 = __Block_byref_object_dispose__15982;
  v23 = 0;
  v6 = objc_msgSend(v4, "concurrencyType");
  if (!v6 || *MEMORY[0x1E0C97C38] == v6)
  {
    v7 = (id *)(v19 + 5);
    obj = (id)v19[5];
    v8 = objc_msgSend(v4, "setQueryGenerationFromToken:error:", v5, &obj);
    objc_storeStrong(v7, obj);
    *((_BYTE *)v25 + 24) = v8;
    if (v8)
      goto LABEL_9;
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__PLManagedObjectContext__setupInitialQueryGenerationForContext___block_invoke;
    v13[3] = &unk_1E3676348;
    v14 = v4;
    v16 = &v24;
    v15 = v5;
    v17 = &v18;
    +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:](PLManagedObjectContext, "_pl_megamoc_runWithPerformWarningsSuppressed:", v13);

    if (*((_BYTE *)v25 + 24))
      goto LABEL_9;
  }
  PLPhotosObjectLifecycleGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = objc_opt_class();
    v11 = v19[5];
    *(_DWORD *)buf = 138412802;
    v29 = v10;
    v30 = 2048;
    v31 = a1;
    v32 = 2114;
    v33 = v11;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "%@ %p unable to set query generation to current: %{public}@", buf, 0x20u);
  }

LABEL_9:
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
}

+ (BOOL)_shouldRetryNewPersistentStoreCoordinatorWithError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0C979C8]);

  v6 = v5 && (objc_msgSend(v3, "code") == 15 || objc_msgSend(v3, "code") == 6 || objc_msgSend(v3, "code") == 5);
  return v6;
}

+ (id)contextForRepairingSingletonObjectsWithReason:(id)a3 libraryURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  float v20;
  NSObject *v21;
  PLDisconnectedManagedObjectContext *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD *v26;
  _QWORD *v27;
  void *v28;
  void *v29;
  id v30;
  PLDisconnectedManagedObjectContext *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  PLDisconnectedManagedObjectContext *v37;
  id *v39;
  id v40;
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  uint64_t v45;
  const __CFString *v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  double v50;
  __int16 v51;
  int v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  pl_dispatch_once();
  +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lookupOrCreateBundleForLibraryURL:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0D74498];
    v41[0] = *MEMORY[0x1E0CB2938];
    v41[1] = CFSTR("libraryURL");
    v42[0] = CFSTR("Failed to create library bundle");
    v42[1] = v9;
    v25 = (void *)MEMORY[0x1E0C99D80];
    v26 = v42;
    v27 = v41;
LABEL_13:
    objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 46102, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = v29;
LABEL_14:
    if (a5)
    {
      v30 = objc_retainAutorelease(v30);
      v22 = 0;
      *a5 = v30;
    }
    else
    {
      v22 = 0;
    }
    goto LABEL_25;
  }
  objc_msgSend(v11, "persistentContainer");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0D74498];
    v43[0] = *MEMORY[0x1E0CB2938];
    v43[1] = CFSTR("libraryURL");
    v44[0] = CFSTR("Failed to create persistent container");
    v44[1] = v9;
    v25 = (void *)MEMORY[0x1E0C99D80];
    v26 = v44;
    v27 = v43;
    goto LABEL_13;
  }
  v13 = (void *)v12;
  if (objc_msgSend(&unk_1E37634A0, "count"))
  {
    v39 = a5;
    v14 = 0;
    v15 = 0;
    while (1)
    {
      v16 = v15;
      v40 = v15;
      v17 = (void *)objc_msgSend(v13, "newPersistentStoreCoordinatorForMigration:", &v40);
      v15 = v40;

      if (v17)
        break;
      if (objc_msgSend(a1, "_shouldRetryNewPersistentStoreCoordinatorWithError:", v15))
      {
        objc_msgSend(&unk_1E37634A0, "objectAtIndexedSubscript:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "floatValue");
        v20 = v19;

        PLMigrationGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413058;
          v48 = v8;
          v49 = 2048;
          v50 = v20;
          v51 = 1024;
          v52 = v14;
          v53 = 2112;
          v54 = v15;
          _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Failed to create coordinator to repair singletons (reason: %@), retry in %2.2f s, retry count %d (%@)", buf, 0x26u);
        }

        usleep((float)(v20 * 1000000.0));
        if (objc_msgSend(&unk_1E37634A0, "count") > (unint64_t)++v14)
          continue;
      }
      v17 = 0;
      v22 = 0;
LABEL_23:
      a5 = v39;
      goto LABEL_24;
    }
    v31 = -[PLManagedObjectContext initWithConcurrencyType:libraryBundle:changeHandlingContainer:coordinator:]([PLDisconnectedManagedObjectContext alloc], "initWithConcurrencyType:libraryBundle:changeHandlingContainer:coordinator:", 1, v11, 0, v17);
    if (v31)
    {
      v22 = v31;
      v32 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v9, "path");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", CFSTR("reason:%@ (%@)"), v8, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLManagedObjectContext setName:](v22, "setName:", v34);
LABEL_22:

      goto LABEL_23;
    }
    a5 = v39;
    if (v39)
    {
      v35 = (void *)MEMORY[0x1E0CB35C8];
      v36 = *MEMORY[0x1E0D74498];
      v45 = *MEMORY[0x1E0CB2938];
      v46 = CFSTR("Failed to create PLDisconnectedManagedObjectContext");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", v36, 46502, v33);
      v22 = 0;
      v34 = v15;
      v15 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    v22 = 0;
  }
  else
  {
    v17 = 0;
    v15 = 0;
    v22 = 0;
  }
LABEL_24:

  v30 = v15;
  if (!v22)
    goto LABEL_14;
LABEL_25:

  v37 = v22;
  return v37;
}

+ (void)_pl_megamoc_runWithPerformWarningsSuppressed:(id)a3
{
  void (**v3)(_QWORD);

  v3 = (void (**)(_QWORD))a3;
  objc_msgSend((id)objc_opt_class(), "_pl_megamoc_contextPerformDepthPush");
  v3[2](v3);

  objc_msgSend((id)objc_opt_class(), "_pl_megamoc_contextPerformDepthPop");
}

+ (id)sanitizedErrorFromError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CB2D50]);
    objc_msgSend(v3, "localizedFailureReason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB2D68]);
    v7 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v3, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, objc_msgSend(v3, "code"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (void)removePhotosDatabaseWithPathManager:(id)a3
{
  +[PLPersistentContainer removePhotosDatabaseWithPathManager:](PLPersistentContainer, "removePhotosDatabaseWithPathManager:", a3);
}

+ (BOOL)shouldHavePhotoLibrary
{
  return 1;
}

+ (BOOL)_pl_megamoc_isInPLMocPerform
{
  if (_contextPerformDepthThreadKey_s_onceToken != -1)
    dispatch_once(&_contextPerformDepthThreadKey_s_onceToken, &__block_literal_global_490);
  return (uint64_t)pthread_getspecific(_contextPerformDepthThreadKey_s_key) > 0;
}

+ (void)getPersistentStoreURL:(id *)a3 options:(id *)a4 forDatabasePath:(id)a5
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__PLManagedObjectContext_getPersistentStoreURL_options_forDatabasePath___block_invoke;
  v5[3] = &__block_descriptor_48_e32_v24__0__NSURL_8__NSDictionary_16l;
  v5[4] = a3;
  v5[5] = a4;
  +[PLPersistentContainer getConfigurationForDatabasePath:withBlock:](PLPersistentContainer, "getConfigurationForDatabasePath:withBlock:", a5, v5);
}

+ (id)managedObjectModelURL
{
  return +[PLPersistentContainer managedObjectModelURL](PLPersistentContainer, "managedObjectModelURL");
}

+ (id)changeNotificationObjectMutationKeys
{
  pl_dispatch_once();
  return (id)changeNotificationObjectMutationKeys_pl_once_object_38;
}

+ (id)changeNotificationObjectKeys
{
  pl_dispatch_once();
  return (id)changeNotificationObjectKeys_pl_once_object_39;
}

+ (id)changeNotificationObjectIDMutationKeys
{
  pl_dispatch_once();
  return (id)changeNotificationObjectIDMutationKeys_pl_once_object_40;
}

+ (id)changeNotificationObjectIDKeys
{
  pl_dispatch_once();
  return (id)changeNotificationObjectIDKeys_pl_once_object_41;
}

+ (BOOL)_isAssetLibraryFetchingAlbum:(id)a3
{
  int v3;

  v3 = objc_msgSend(a3, "kindValue");
  return v3 == 1613 || v3 == 1552;
}

+ (BOOL)assetsLibraryLoggingEnabled
{
  pl_dispatch_once();
  return assetsLibraryLoggingEnabled_alLogging;
}

void __53__PLManagedObjectContext_assetsLibraryLoggingEnabled__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  assetsLibraryLoggingEnabled_alLogging = objc_msgSend(v0, "BOOLForKey:", CFSTR("ALAssetsLibraryLoggingEnabled"));

}

void __56__PLManagedObjectContext_changeNotificationObjectIDKeys__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E0C97870], *MEMORY[0x1E0C97A18], *MEMORY[0x1E0C97838], *MEMORY[0x1E0C97C40], *MEMORY[0x1E0C979A0], *MEMORY[0x1E0C97888], 0);
  v2 = (void *)changeNotificationObjectIDKeys_pl_once_object_41;
  changeNotificationObjectIDKeys_pl_once_object_41 = v1;

}

void __64__PLManagedObjectContext_changeNotificationObjectIDMutationKeys__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E0C97870], *MEMORY[0x1E0C97A18], *MEMORY[0x1E0C97838], *MEMORY[0x1E0C97C40], 0);
  v2 = (void *)changeNotificationObjectIDMutationKeys_pl_once_object_40;
  changeNotificationObjectIDMutationKeys_pl_once_object_40 = v1;

}

void __54__PLManagedObjectContext_changeNotificationObjectKeys__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E0C97878], *MEMORY[0x1E0C97A20], *MEMORY[0x1E0C97840], *MEMORY[0x1E0C97C48], *MEMORY[0x1E0C979A8], *MEMORY[0x1E0C97890], 0);
  v2 = (void *)changeNotificationObjectKeys_pl_once_object_39;
  changeNotificationObjectKeys_pl_once_object_39 = v1;

}

void __62__PLManagedObjectContext_changeNotificationObjectMutationKeys__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E0C97878], *MEMORY[0x1E0C97A20], *MEMORY[0x1E0C97840], *MEMORY[0x1E0C97C48], 0);
  v2 = (void *)changeNotificationObjectMutationKeys_pl_once_object_38;
  changeNotificationObjectMutationKeys_pl_once_object_38 = v1;

}

id __72__PLManagedObjectContext_getPersistentStoreURL_options_forDatabasePath___block_invoke(uint64_t a1, id a2, void *a3)
{
  id result;

  **(_QWORD **)(a1 + 32) = objc_retainAutorelease(a2);
  result = objc_retainAutorelease(a3);
  **(_QWORD **)(a1 + 40) = result;
  return result;
}

void __65__PLManagedObjectContext__setupInitialQueryGenerationForContext___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__PLManagedObjectContext__setupInitialQueryGenerationForContext___block_invoke_2;
  v5[3] = &unk_1E3676348;
  v8 = *(_QWORD *)(a1 + 48);
  v6 = v2;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  v7 = v3;
  v9 = v4;
  objc_msgSend(v6, "performBlockAndWait:", v5);

}

void __65__PLManagedObjectContext__setupInitialQueryGenerationForContext___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  obj = 0;
  v4 = objc_msgSend(v2, "setQueryGenerationFromToken:error:", v3, &obj);
  v5 = obj;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v4;
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v5);
}

@end
