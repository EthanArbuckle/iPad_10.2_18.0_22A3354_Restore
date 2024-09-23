@implementation RTPersistenceManager

- (BOOL)persistenceContextShouldExecute:(id)a3
{
  return -[RTPersistenceManager availability](self, "availability", a3) == 2;
}

- (unint64_t)availability
{
  return self->_availability;
}

- (RTPersistenceManager)init
{
  void *v3;
  void *v4;
  RTPersistenceManager *v5;

  +[RTPersistenceManager defaultModelsDirectory](RTPersistenceManager, "defaultModelsDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPersistenceManager defaultStoresDirectory](RTPersistenceManager, "defaultStoresDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[RTPersistenceManager initWithModelsDirectory:storesDirectory:](self, "initWithModelsDirectory:storesDirectory:", v3, v4);

  return v5;
}

- (RTPersistenceManager)initWithModelsDirectory:(id)a3 storesDirectory:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  RTPersistenceManager *v10;
  void *v11;
  void *v12;
  NSURL *v13;
  NSURL *modelsDirectory;
  void *v15;
  void *v16;
  NSURL *v17;
  NSURL *storesDirectory;
  NSRecursiveLock *v19;
  NSRecursiveLock *pointerArrayLock;
  NSRecursiveLock *v21;
  NSRecursiveLock *storesArrayLock;
  NSMutableArray *v23;
  NSMutableArray *remoteServers;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSPointerArray *v29;
  NSPointerArray *outstandingContexts;
  RTPersistenceManager *v31;
  NSObject *v32;
  objc_super v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isFileURL") & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[RTPersistenceManager initWithModelsDirectory:storesDirectory:]";
      v37 = 1024;
      v38 = 162;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: modelsDirectory.isFileURL (in %s:%d)", buf, 0x12u);
    }

  }
  if ((objc_msgSend(v7, "isFileURL") & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[RTPersistenceManager initWithModelsDirectory:storesDirectory:]";
      v37 = 1024;
      v38 = 163;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: storesDirectory.isFileURL (in %s:%d)", buf, 0x12u);
    }

  }
  if (!objc_msgSend(v6, "isFileURL") || !objc_msgSend(v7, "isFileURL"))
    goto LABEL_18;
  v34.receiver = self;
  v34.super_class = (Class)RTPersistenceManager;
  v10 = -[RTNotifier init](&v34, sel_init);
  self = v10;
  if (v10)
  {
    v10->_availability = 0;
    v11 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v6, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileURLWithPath:isDirectory:", v12, 1);
    v13 = (NSURL *)objc_claimAutoreleasedReturnValue();
    modelsDirectory = self->_modelsDirectory;
    self->_modelsDirectory = v13;

    v15 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v7, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fileURLWithPath:isDirectory:", v16, 1);
    v17 = (NSURL *)objc_claimAutoreleasedReturnValue();
    storesDirectory = self->_storesDirectory;
    self->_storesDirectory = v17;

    v19 = (NSRecursiveLock *)objc_opt_new();
    pointerArrayLock = self->_pointerArrayLock;
    self->_pointerArrayLock = v19;

    v21 = (NSRecursiveLock *)objc_opt_new();
    storesArrayLock = self->_storesArrayLock;
    self->_storesArrayLock = v21;

    v23 = (NSMutableArray *)objc_opt_new();
    remoteServers = self->_remoteServers;
    self->_remoteServers = v23;

    -[RTPersistenceManager latestModel](self, "latestModel");
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = (void *)v25;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_onCoreDataResetSync_, *MEMORY[0x1E0C97828], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addObserver:selector:name:object:", self, sel_onCoreDataResetSync_, *MEMORY[0x1E0C97818], 0);

      objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
      v29 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
      outstandingContexts = self->_outstandingContexts;
      self->_outstandingContexts = v29;

      goto LABEL_14;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[RTPersistenceManager initWithModelsDirectory:storesDirectory:]";
      v37 = 1024;
      v38 = 182;
      _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "Expected at least one model in _modelsDirectory (in %s:%d)", buf, 0x12u);
    }

LABEL_18:
    v31 = 0;
    goto LABEL_19;
  }
LABEL_14:
  self = self;
  v31 = self;
LABEL_19:

  return v31;
}

- (BOOL)initializePersistenceStores
{
  BOOL v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  RTPersistenceStore *v7;
  RTPersistenceStore *v8;
  RTPersistenceStore *v9;
  RTPersistenceStore *v10;
  NSObject *v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v3 = 0;
  v4 = 0;
  v18 = *MEMORY[0x1E0C80C00];
  while (1)
  {
    -[RTPersistenceManager storeDescriptionForStoreWithType:](self, "storeDescriptionForStoreWithType:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
      break;
    v6 = (void *)v5;
    v7 = -[RTPersistenceStore initWithStoreDescription:]([RTPersistenceStore alloc], "initWithStoreDescription:", v5);
    if (!v7)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v14 = 136315394;
        v15 = "-[RTPersistenceManager initializePersistenceStores]";
        v16 = 1024;
        v17 = 214;
        _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Persistence store must not be nil (in %s:%d)", (uint8_t *)&v14, 0x12u);
      }

      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v14) = 0;
        _os_log_fault_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_FAULT, "Persistence store must not be nil", (uint8_t *)&v14, 2u);
      }

      return v3;
    }
    v8 = v7;
    -[NSRecursiveLock lock](self->_storesArrayLock, "lock");
    v9 = self->_stores[v4];
    self->_stores[v4] = v8;
    v10 = v8;

    -[NSRecursiveLock unlock](self->_storesArrayLock, "unlock");
    v3 = v4++ > 2;
    if (v4 == 4)
      return 1;
  }
  return v3;
}

- (void)_shutdownWithHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    v5 = v6;
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)RTPersistenceManager;
  -[RTPersistenceManager dealloc](&v4, sel_dealloc);
}

- (BOOL)initializeContainer
{
  NSObject *v3;
  NSObject *WeakRetained;
  BOOL v5;
  NSObject *v6;
  RTPersistenceContainer *v7;
  void *v8;
  RTPersistenceContainer *v9;
  RTPersistenceContainer *container;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_container)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315394;
      v14 = "-[RTPersistenceManager initializeContainer]";
      v15 = 1024;
      v16 = 245;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "Expected container to be nil (in %s:%d)", (uint8_t *)&v13, 0x12u);
    }

    if (self->_container)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      WeakRetained = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v13) = 0;
        _os_log_fault_impl(&dword_1D1A22000, WeakRetained, OS_LOG_TYPE_FAULT, "Expected container to be nil", (uint8_t *)&v13, 2u);
      }
      goto LABEL_10;
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained != 0;
  if (!WeakRetained)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315394;
      v14 = "-[RTPersistenceManager initializeContainer]";
      v15 = 1024;
      v16 = 252;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Expected a delegate. (in %s:%d)", (uint8_t *)&v13, 0x12u);
    }

    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v13) = 0;
      _os_log_fault_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_FAULT, "Expected a delegate.", (uint8_t *)&v13, 2u);
    }
    goto LABEL_15;
  }
  if (-[RTPersistenceManager initializePersistenceStores](self, "initializePersistenceStores"))
  {
    -[RTPersistenceManager persistenceStoreConfigurations](self, "persistenceStoreConfigurations");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = [RTPersistenceContainer alloc];
    -[RTPersistenceManager latestModel](self, "latestModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[RTPersistenceContainer initWithName:model:configurations:](v7, "initWithName:model:configurations:", CFSTR("All"), v8, v6);
    container = self->_container;
    self->_container = v9;

    -[RTPersistenceContainer setDelegate:](self->_container, "setDelegate:", self);
LABEL_15:

    goto LABEL_16;
  }
LABEL_10:
  v5 = 0;
LABEL_16:

  return v5;
}

+ (id)protectedStoreFilesExtensions
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)protectedStoreFilesExtensions_cacheFilesExtensions;
  if (!protectedStoreFilesExtensions_cacheFilesExtensions)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("sqlite"), CFSTR("sqlite-wal"), CFSTR("sqlite-shm"), 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)protectedStoreFilesExtensions_cacheFilesExtensions;
    protectedStoreFilesExtensions_cacheFilesExtensions = v3;

    v2 = (void *)protectedStoreFilesExtensions_cacheFilesExtensions;
  }
  return v2;
}

- (void)createManagedObjectContext:(id)a3
{
  id v4;
  RTPersistenceContainer *container;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  container = self->_container;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__RTPersistenceManager_createManagedObjectContext___block_invoke;
  v7[3] = &unk_1E929EB78;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[RTPersistenceContainer persistenceContextWithHandler:](container, "persistenceContextWithHandler:", v7);

}

void __51__RTPersistenceManager_createManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setDelegate:", v3);
  objc_msgSend(*(id *)(a1 + 32), "trackContext:", v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)managedObjectContext
{
  void *v3;

  -[RTPersistenceContainer persistenceContext](self->_container, "persistenceContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);
  -[RTPersistenceManager trackContext:](self, "trackContext:", v3);
  return v3;
}

- (id)persistenceContextWithOptions:(unint64_t)a3
{
  void *v4;

  -[RTPersistenceContainer persistenceContextWithOptions:](self->_container, "persistenceContextWithOptions:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);
  -[RTPersistenceManager trackContext:](self, "trackContext:", v4);
  return v4;
}

- (id)waitForPersistenceContext
{
  void *v3;

  -[RTPersistenceContainer waitForPersistenceContext](self->_container, "waitForPersistenceContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);
  -[RTPersistenceManager trackContext:](self, "trackContext:", v3);
  return v3;
}

- (void)trackContext:(id)a3
{
  NSRecursiveLock *pointerArrayLock;
  id v5;

  pointerArrayLock = self->_pointerArrayLock;
  v5 = a3;
  -[NSRecursiveLock lock](pointerArrayLock, "lock");
  -[NSPointerArray addPointer:](self->_outstandingContexts, "addPointer:", v5);

  -[NSRecursiveLock unlock](self->_pointerArrayLock, "unlock");
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (void)setupPersistenceContainers:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__RTPersistenceManager_setupPersistenceContainers___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __51__RTPersistenceManager_setupPersistenceContainers___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_setupPersistenceContainers");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v2);
  return result;
}

- (BOOL)_setupPersistenceContainers
{
  NSObject *v3;
  void *v4;
  _BOOL4 v5;
  RTPersistenceContainer *container;
  uint64_t v7;
  uint8_t v9[16];

  if (-[RTPersistenceContainer storesNeedSetup](self->_container, "storesNeedSetup"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v9 = 0;
      _os_log_debug_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEBUG, "setting up containers", v9, 2u);
    }

    -[RTPersistenceManager persistenceStoreConfigurations](self, "persistenceStoreConfigurations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[RTPersistenceContainer updateContainerConfigurations:](self->_container, "updateContainerConfigurations:", v4);
    container = self->_container;
    if (v5)
    {
      -[RTPersistenceContainer setupPersistenceStores](container, "setupPersistenceStores");
    }
    else
    {
      if (-[RTPersistenceContainer storesNeedSetup](container, "storesNeedSetup"))
        v7 = 1;
      else
        v7 = 2;
      -[RTPersistenceManager _updateAvailabilityAfterSetupAttemptWithAvailability:](self, "_updateAvailabilityAfterSetupAttemptWithAvailability:", v7);
    }

  }
  return -[RTPersistenceManager availability](self, "availability") == 2;
}

- (void)tearDownPersistenceStack:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__RTPersistenceManager_tearDownPersistenceStack___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __49__RTPersistenceManager_tearDownPersistenceStack___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_updateStoreAvailability:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setServeContexts:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "tearDownPersistenceStack");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 88);
  *(_QWORD *)(v2 + 88) = 0;

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

- (void)_setupRemoteStoreServers
{
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  RTPersistenceRemoteStoreServer *v8;
  void *v9;
  RTPersistenceRemoteStoreServer *v10;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  for (i = 0; i != 4; ++i)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "remoteServerOptionsForStoreWithType:", i);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        -[RTPersistenceManager sortedModelNames](self, "sortedModelNames");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "lastObject");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTPersistenceManager urlForModelWithName:](self, "urlForModelWithName:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = [RTPersistenceRemoteStoreServer alloc];
        -[RTPersistenceManager URLForStoreType:](self, "URLForStoreType:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[RTPersistenceRemoteStoreServer initWithStoreURL:modelURL:options:](v8, "initWithStoreURL:modelURL:options:", v9, v7, v4);

        if (v10 && (-[NSMutableArray containsObject:](self->_remoteServers, "containsObject:", v10) & 1) == 0)
        {
          -[NSMutableArray addObject:](self->_remoteServers, "addObject:", v10);
          -[RTPersistenceRemoteStoreServer startListening](v10, "startListening");
        }

      }
    }
  }

}

- (id)URLForStoreType:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3 >= 4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[RTPersistenceManager URLForStoreType:]";
      v11 = 1024;
      v12 = 402;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: 0 <= type && type < RTPersistenceStoreTypeCount (in %s:%d)", (uint8_t *)&v9, 0x12u);
    }

  }
  if (a3 > 3)
  {
    v7 = 0;
  }
  else
  {
    -[NSURL URLByAppendingPathComponent:](self->_storesDirectory, "URLByAppendingPathComponent:", off_1E929EC70[a3]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathExtension:", CFSTR("sqlite"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (unint64_t)storeTypeForURL:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  unint64_t v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[RTPersistenceManager storeTypeForURL:]";
      v11 = 1024;
      v12 = 415;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: url (in %s:%d)", (uint8_t *)&v9, 0x12u);
    }

  }
  objc_msgSend(v3, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByDeletingPathExtension");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Cache")) & 1) != 0)
  {
    v7 = 0;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Cloud-V2")) & 1) != 0)
  {
    v7 = 1;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Local")) & 1) != 0)
  {
    v7 = 2;
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("SafetyCache")))
  {
    v7 = 3;
  }
  else
  {
    v7 = 4;
  }

  return v7;
}

- (id)persistenceStoreConfigurations
{
  id WeakRetained;
  void *v4;
  unint64_t v5;
  __int128 v6;
  RTPersistenceStore *v7;
  void *v8;
  void *v9;
  RTPersistenceMigrator *v10;
  void *v11;
  RTPersistenceMigrator *v12;
  void *v13;
  NSObject *v14;
  __CFString *v15;
  RTPersistenceStoreConfiguration *v16;
  __int128 v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  *(_QWORD *)&v6 = 136315394;
  v18 = v6;
  do
  {
    -[NSRecursiveLock lock](self->_storesArrayLock, "lock", v18);
    v7 = self->_stores[v5];
    -[NSRecursiveLock unlock](self->_storesArrayLock, "unlock");
    if (v7)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(WeakRetained, "mirroringOptionsForStoreWithType:", v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RTPersistenceDriverMirroringDelegateOptionsKey"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTPersistenceStore setMirroringDelegateOptions:](v7, "setMirroringDelegateOptions:", v9);

      }
      v10 = [RTPersistenceMigrator alloc];
      -[RTPersistenceManager delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[RTPersistenceMigrator initWithStore:modelProvider:delegate:](v10, "initWithStore:modelProvider:delegate:", v7, self, v11);
      -[RTPersistenceStore setMigrator:](v7, "setMigrator:", v12);

      -[RTPersistenceStore migrator](v7, "migrator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v18;
          v20 = "-[RTPersistenceManager persistenceStoreConfigurations]";
          v21 = 1024;
          v22 = 445;
          _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Persistence store migrator must not be nil (in %s:%d)", buf, 0x12u);
        }

      }
      if (v5 > 3)
        v15 = 0;
      else
        v15 = off_1E929EC90[v5];
      v16 = -[RTPersistenceStoreConfiguration initWithName:readOnly:store:]([RTPersistenceStoreConfiguration alloc], "initWithName:readOnly:store:", v15, 0, v7);
      if (v16)
        objc_msgSend(v4, "addObject:", v16);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v16 = (RTPersistenceStoreConfiguration *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v18;
        v20 = "-[RTPersistenceManager persistenceStoreConfigurations]";
        v21 = 1024;
        v22 = 432;
        _os_log_error_impl(&dword_1D1A22000, &v16->super, OS_LOG_TYPE_ERROR, "Persistence store must not be nil (in %s:%d)", buf, 0x12u);
      }
    }

    ++v5;
  }
  while (v5 != 4);

  return v4;
}

- (id)storeDescriptionForStoreWithType:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint8_t v24[128];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a3 >= 4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[RTPersistenceManager storeDescriptionForStoreWithType:]";
      v27 = 1024;
      v28 = 462;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: 0 <= type && type < RTPersistenceStoreTypeCount (in %s:%d)", buf, 0x12u);
    }

  }
  -[RTPersistenceManager URLForStoreType:](self, "URLForStoreType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_opt_new();
    -[NSObject setShouldAddStoreAsynchronously:](v7, "setShouldAddStoreAsynchronously:", 0);
    -[NSObject setShouldMigrateStoreAutomatically:](v7, "setShouldMigrateStoreAutomatically:", 0);
    -[NSObject setShouldInferMappingModelAutomatically:](v7, "setShouldInferMappingModelAutomatically:", 0);
    -[NSObject setURL:](v7, "setURL:", v6);
    -[NSObject setType:](v7, "setType:", *MEMORY[0x1E0C979E8]);
    -[NSObject setOption:forKey:](v7, "setOption:forKey:", *MEMORY[0x1E0CB2AB8], *MEMORY[0x1E0C97940]);
    -[NSObject setValue:forPragmaNamed:](v7, "setValue:forPragmaNamed:", CFSTR("WAL"), CFSTR("journal_mode"));
    if (a3 - 1 <= 2)
      -[NSObject setOption:forKey:](v7, "setOption:forKey:", MEMORY[0x1E0C9AA70], *MEMORY[0x1E0C97900]);
    -[RTPersistenceManager delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[RTPersistenceManager storeDescriptionForStoreWithType:]";
        v27 = 1024;
        v28 = 488;
        _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "no available persistence delegate (in %s:%d)", buf, 0x12u);
      }

      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_FAULT, "no available persistence delegate", buf, 2u);
      }
      v10 = 0;
      goto LABEL_29;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v23 = 0;
      objc_msgSend(v8, "optionsForStoreWithType:error:", a3, &v23);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = 0;
      if (v23)
      {
LABEL_29:

        goto LABEL_30;
      }
    }
    else
    {
      v9 = 0;
    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = v9;
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v9);
          v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v16, (_QWORD)v19);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setOption:forKey:](v7, "setOption:forKey:", v17, v16);

        }
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v13);
    }

    v10 = v7;
    goto LABEL_29;
  }
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "unknown URL for store type", buf, 2u);
  }
  v10 = 0;
LABEL_30:

  return v10;
}

- (int64_t)mirroringDelegateStateForStoreType:(unint64_t)a3
{
  NSObject *v3;
  int64_t v7;
  uint8_t v8[16];

  if (a3 < 4)
  {
    -[NSRecursiveLock lock](self->_storesArrayLock, "lock");
    v7 = -[RTPersistenceStore mirroringDelegateState](self->_stores[a3], "mirroringDelegateState");
    -[NSRecursiveLock unlock](self->_storesArrayLock, "unlock");
    return v7;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: 0 <= storeType && storeType < RTPersistenceStoreTypeCount", v8, 2u);
    }

    return 0;
  }
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  RTPersistenceManagerNotificationAvailabilityDidChange *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[RTNotification notificationName](RTPersistenceManagerNotificationAvailabilityDidChange, "notificationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    v10 = -[RTPersistenceManagerNotificationAvailabilityDidChange initWithAvailability:]([RTPersistenceManagerNotificationAvailabilityDidChange alloc], "initWithAvailability:", -[RTPersistenceManager availability](self, "availability"));
    -[RTNotifier postNotification:toObserver:](self, "postNotification:toObserver:", v10, v6);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v7;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "unhandled notification %@", (uint8_t *)&v13, 0xCu);
    }

    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412802;
      v14 = v7;
      v15 = 2080;
      v16 = "-[RTPersistenceManager internalAddObserver:name:]";
      v17 = 1024;
      v18 = 536;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "unhandled notification %@ (in %s:%d)", (uint8_t *)&v13, 0x1Cu);
    }

  }
}

- (void)updateStoreAvailability:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__RTPersistenceManager_updateStoreAvailability___block_invoke;
  v6[3] = &unk_1E9297BF0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

uint64_t __48__RTPersistenceManager_updateStoreAvailability___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2 == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "suspendPersistenceStores");
  }
  else if (v2 == 2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "resumePersistenceStores");
  }
  return objc_msgSend(*(id *)(a1 + 32), "_updateStoreAvailability:", *(_QWORD *)(a1 + 40));
}

- (void)_updateStoreAvailability:(unint64_t)a3
{
  NSObject *v5;
  unint64_t v6;
  __CFString *v7;
  __CFString *v8;
  RTPersistenceManagerNotificationAvailabilityDidChange *v9;
  int v10;
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (-[RTPersistenceManager availability](self, "availability") != a3)
  {
    -[RTPersistenceManager setAvailability:](self, "setAvailability:", a3);
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = -[RTPersistenceManager availability](self, "availability");
      v7 = CFSTR("Unknown");
      if (v6 == 1)
        v7 = CFSTR("Unavailable");
      if (v6 == 2)
        v7 = CFSTR("Available");
      v8 = v7;
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "update persistence manager available, %@", (uint8_t *)&v10, 0xCu);

    }
    v9 = -[RTPersistenceManagerNotificationAvailabilityDidChange initWithAvailability:]([RTPersistenceManagerNotificationAvailabilityDidChange alloc], "initWithAvailability:", -[RTPersistenceManager availability](self, "availability"));
    -[RTNotifier postNotification:](self, "postNotification:", v9);

  }
}

- (id)latestModel
{
  NSManagedObjectModel *latestModel;
  void *v4;
  void *v5;
  NSManagedObjectModel *v6;
  NSManagedObjectModel *v7;

  latestModel = self->_latestModel;
  if (!latestModel)
  {
    -[RTPersistenceManager sortedModelNames](self, "sortedModelNames");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPersistenceManager modelNamed:](self, "modelNamed:", v5);
    v6 = (NSManagedObjectModel *)objc_claimAutoreleasedReturnValue();
    v7 = self->_latestModel;
    self->_latestModel = v6;

    latestModel = self->_latestModel;
  }
  return latestModel;
}

- (id)modelFollowingModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v13[16];

  v4 = a3;
  if (v4)
  {
    -[RTPersistenceManager sortedModelNames](self, "sortedModelNames");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "versionIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, objc_msgSend(v5, "count"), 1536, &__block_literal_global_61);
    v9 = 0;
    if (v8 < objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTPersistenceManager modelNamed:](self, "modelNamed:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: model", v13, 2u);
    }

    v9 = 0;
  }

  return v9;
}

uint64_t __44__RTPersistenceManager_modelFollowingModel___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "compare:options:", a3, 64);
}

- (id)sortedModelNames
{
  NSArray *sortedModelNames;
  void *v4;
  NSObject *v5;
  NSArray *v6;
  NSArray *v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  sortedModelNames = self->_sortedModelNames;
  if (!sortedModelNames)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "sortedContentsOfDirectoryAtURL:withExtension:", self->_modelsDirectory, CFSTR("mom"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "count"))
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v9 = 136315394;
        v10 = "-[RTPersistenceManager sortedModelNames]";
        v11 = 1024;
        v12 = 606;
        _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Expected at least one model in _modelsDirectory (in %s:%d)", (uint8_t *)&v9, 0x12u);
      }

    }
    objc_msgSend(v4, "valueForKeyPath:", CFSTR("lastPathComponent.stringByDeletingPathExtension"));
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_sortedModelNames;
    self->_sortedModelNames = v6;

    sortedModelNames = self->_sortedModelNames;
  }
  return sortedModelNames;
}

- (id)urlForModelWithName:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];

  if (a3)
  {
    objc_msgSend(a3, "stringByAppendingPathExtension:", CFSTR("mom"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:relativeToURL:", v4, 1, self->_modelsDirectory);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: name", v8, 2u);
    }

    v5 = 0;
  }
  return v5;
}

- (id)modelNamed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  id v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[RTPersistenceManager urlForModelWithName:](self, "urlForModelWithName:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B98]), "initWithContentsOfURL:", v5);
    if (!v6)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v10 = 138412802;
        v11 = v4;
        v12 = 2080;
        v13 = "-[RTPersistenceManager modelNamed:]";
        v14 = 1024;
        v15 = 630;
        _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Model named, %@, doesn't appear to exist. (in %s:%d)", (uint8_t *)&v10, 0x1Cu);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setVersionIdentifiers:", v8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: name", (uint8_t *)&v10, 2u);
    }
    v6 = 0;
  }

  return v6;
}

- (void)persistenceContext:(id)a3 encounteredError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  int v12;
  void *v14;
  NSObject *v15;
  void *v16;
  RTPersistenceStore *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  id v29;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C979C8];
  v10 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C979C8]);

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "code"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      goto LABEL_3;
LABEL_15:
    objc_msgSend(v7, "domain");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqual:", *MEMORY[0x1E0CB28A8]);

    if (!v24)
      goto LABEL_29;
    v25 = objc_msgSend(v7, "code");
    v17 = 0;
    if (v25 == 256 || v25 == 259)
    {
      v15 = 0;
    }
    else
    {
      v15 = 0;
      if (v25 != 512)
        goto LABEL_29;
    }
LABEL_25:
    -[RTPersistenceManager delegate](self, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v26, "persistenceStore:encounteredCriticalError:", v17, v7);

    goto LABEL_28;
  }
  objc_msgSend(v7, "userInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_15;
LABEL_3:
  v12 = objc_msgSend(v11, "intValue");
  if (v12 == 11 || v12 == 26)
  {
    objc_msgSend(v7, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AA0]);
    v15 = objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSRecursiveLock lock](self->_storesArrayLock, "lock");
      v17 = self->_stores[-[RTPersistenceManager storeTypeForURL:](self, "storeTypeForURL:", v16)];
      -[NSRecursiveLock unlock](self->_storesArrayLock, "unlock");
      objc_msgSend(v6, "persistentStoreCoordinator");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("RTPersistentStoreMetadataStoreCorruptKey");
      v31[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      -[RTPersistenceStore updateMetadata:coordinator:error:](v17, "updateMetadata:coordinator:error:", v19, v18, &v27);
      v20 = v27;

      if (v20)
      {
        _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v20;
          _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Failed to update metadata, %@", buf, 0xCu);
        }

      }
    }
    else
    {
      v17 = 0;
    }
    goto LABEL_25;
  }
  if (v12 == 1555)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_FAULT, "Save failed due to primary key constraints. Please file a radar with sysdiagnose and \"wedge diagnose\" and attach to rdar://50515616", buf, 2u);
    }
LABEL_28:

  }
LABEL_29:

}

- (BOOL)persistenceContextPerformedSave:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v20;
  id WeakRetained;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mirroringDelegate);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v20, "persistentStoreCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentStores");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    v11 = *MEMORY[0x1E0C97958];
    v12 = *MEMORY[0x1E0C97950];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v14, "options");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKey:", v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          objc_msgSend(WeakRetained, "performMirroringRequestWithType:affectedStore:qualityOfService:handler:", 1, v14, objc_msgSend(v20, "mirroringQualityOfService"), 0);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  if (a4)
    *a4 = 0;

  return 1;
}

- (void)performMirroringRequestOfType:(int64_t)a3 qualityOfService:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  int64_t v12;
  int64_t v13;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__RTPersistenceManager_performMirroringRequestOfType_qualityOfService_handler___block_invoke;
  v10[3] = &unk_1E929EC10;
  v10[4] = self;
  v11 = v8;
  v12 = a3;
  v13 = a4;
  v9 = v8;
  -[RTPersistenceManager createManagedObjectContext:](self, "createManagedObjectContext:", v10);

}

void __79__RTPersistenceManager_performMirroringRequestOfType_qualityOfService_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  id obj;
  void *v23;
  NSObject *group;
  id v25;
  void *WeakRetained;
  _QWORD block[4];
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  NSObject *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  uint64_t v40;
  _QWORD v41[4];

  v41[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 152));
    v23 = (void *)objc_opt_new();
    group = dispatch_group_create();
    v25 = v3;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v3, "persistentStoreCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "persistentStores");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v5;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v34;
      v9 = *MEMORY[0x1E0C97958];
      v10 = *MEMORY[0x1E0C97950];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v34 != v8)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v12, "options");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            dispatch_group_enter(group);
            v16 = *(_QWORD *)(a1 + 48);
            v17 = *(_QWORD *)(a1 + 56);
            v30[0] = MEMORY[0x1E0C809B0];
            v30[1] = 3221225472;
            v30[2] = __79__RTPersistenceManager_performMirroringRequestOfType_qualityOfService_handler___block_invoke_77;
            v30[3] = &unk_1E929EBE8;
            v30[4] = *(_QWORD *)(a1 + 32);
            v31 = v23;
            v32 = group;
            objc_msgSend(WeakRetained, "performMirroringRequestWithType:affectedStore:qualityOfService:managedObjectContext:handler:", v16, v12, v17, v25, v30);

          }
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v7);
    }

    objc_msgSend(*(id *)(a1 + 32), "queue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__RTPersistenceManager_performMirroringRequestOfType_qualityOfService_handler___block_invoke_3;
    block[3] = &unk_1E9297650;
    v28 = v23;
    v29 = *(id *)(a1 + 40);
    v19 = v23;
    v20 = group;
    dispatch_group_notify(group, v18, block);

    v3 = v25;
  }
  else
  {
    v40 = *MEMORY[0x1E0CB2D50];
    v41[0] = CFSTR("A managed object context is required to perform a mirroring request.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceErrorDomain"), 7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(a1 + 40);
    if (v21)
      (*(void (**)(uint64_t, _QWORD, void *))(v21 + 16))(v21, 0, v20);
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v20;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "invalid managed object context while servicing mirroring request, %@", buf, 0xCu);
    }
  }

}

void __79__RTPersistenceManager_performMirroringRequestOfType_qualityOfService_handler___block_invoke_77(id *a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(a1[4], "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__RTPersistenceManager_performMirroringRequestOfType_qualityOfService_handler___block_invoke_2;
  v8[3] = &unk_1E929EBC0;
  v12 = a2;
  v9 = v5;
  v10 = a1[5];
  v11 = a1[6];
  v7 = v5;
  dispatch_async(v6, v8);

}

void __79__RTPersistenceManager_performMirroringRequestOfType_qualityOfService_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 56))
  {
    if (!v2)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (v2)
  {
LABEL_5:
    objc_msgSend(*(id *)(a1 + 40), "addObject:");
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceErrorDomain"), 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

LABEL_6:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __79__RTPersistenceManager_performMirroringRequestOfType_qualityOfService_handler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _RTSafeArray();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _RTMultiErrorCreate();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v7 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "multiple errors occurred while servicing mirroring request, %@", buf, 0xCu);
    }

  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, BOOL, void *))(v5 + 16))(v5, v3 == 0, v3);

}

- (void)performImportMirroringRequestWithQualityOfService:(int64_t)a3 handler:(id)a4
{
  -[RTPersistenceManager performMirroringRequestOfType:qualityOfService:handler:](self, "performMirroringRequestOfType:qualityOfService:handler:", 0, a3, a4);
}

- (void)performExportMirroringRequestWithQualityOfService:(int64_t)a3 handler:(id)a4
{
  -[RTPersistenceManager performMirroringRequestOfType:qualityOfService:handler:](self, "performMirroringRequestOfType:qualityOfService:handler:", 1, a3, a4);
}

- (void)performZoneResetMirroringRequestWithQualityOfService:(int64_t)a3 handler:(id)a4
{
  -[RTPersistenceManager performMirroringRequestOfType:qualityOfService:handler:](self, "performMirroringRequestOfType:qualityOfService:handler:", 2, a3, a4);
}

- (void)onCoreDataResetSync:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__RTPersistenceManager_onCoreDataResetSync___block_invoke;
  block[3] = &unk_1E9297540;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __44__RTPersistenceManager_onCoreDataResetSync___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onCoreDataResetSync:", *(_QWORD *)(a1 + 40));
}

- (void)_onCoreDataResetSync:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C97828]);

  if (v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0C97820]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 134217984;
      v21 = objc_msgSend(v10, "unsignedIntegerValue");
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "received will reset sync notification, reason %lu", (uint8_t *)&v20, 0xCu);

    }
    objc_msgSend(v4, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPersistenceContainer persistenceContextWithOptions:](self->_container, "persistenceContextWithOptions:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "persistenceManagerWillStartResetSync:userInfo:context:", self, v11, v12);

    -[RTPersistenceContainer suspendPersistenceStores](self->_container, "suspendPersistenceStores");
    -[RTPersistenceManager _updateStoreAvailability:](self, "_updateStoreAvailability:", 1);
  }
  else
  {
    objc_msgSend(v4, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0C97818]);

    if (v14)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "received did reset sync notification", (uint8_t *)&v20, 2u);
      }

      objc_msgSend(v4, "userInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "persistenceManagerDidFinishResetSync:userInfo:", self, v16);

      -[RTPersistenceContainer resumePersistenceStores](self->_container, "resumePersistenceStores");
      -[RTPersistenceManager _updateStoreAvailability:](self, "_updateStoreAvailability:", 2);
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "initiating import after reset sync", (uint8_t *)&v20, 2u);
      }

      -[RTPersistenceManager performImportMirroringRequestWithQualityOfService:handler:](self, "performImportMirroringRequestWithQualityOfService:handler:", 3, &__block_literal_global_80);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412802;
        v21 = (uint64_t)v19;
        v22 = 2080;
        v23 = "-[RTPersistenceManager _onCoreDataResetSync:]";
        v24 = 1024;
        v25 = 856;
        _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "unknown notification name %@ (in %s:%d)", (uint8_t *)&v20, 0x1Cu);

      }
    }
  }

}

void __45__RTPersistenceManager__onCoreDataResetSync___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "finished import after reset sync, error, %@", (uint8_t *)&v5, 0xCu);
  }

}

- (id)outstandingContexts
{
  void *v3;

  -[NSRecursiveLock lock](self->_pointerArrayLock, "lock");
  -[NSPointerArray allObjects](self->_outstandingContexts, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSRecursiveLock unlock](self->_pointerArrayLock, "unlock");
  return v3;
}

- (id)historyTokenForStoreType:(unint64_t)a3
{
  NSObject *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v11[16];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (a3 >= 4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: 0 <= storeType && storeType < RTPersistenceStoreTypeCount", v11, 2u);
    }
    goto LABEL_7;
  }
  -[RTPersistenceManager URLForStoreType:](self, "URLForStoreType:");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_10;
  }
  -[RTPersistenceContainer coordinator](self->_container, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentStoreForURL:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RTPersistenceContainer coordinator](self->_container, "coordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentPersistentHistoryTokenFromStores:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

LABEL_10:
  return v9;
}

- (id)persistenceStoreForType:(unint64_t)a3
{
  NSObject *v3;
  RTPersistenceStore *v7;
  uint8_t v8[16];

  if (a3 < 4)
  {
    -[NSRecursiveLock lock](self->_storesArrayLock, "lock");
    v7 = self->_stores[a3];
    -[NSRecursiveLock unlock](self->_storesArrayLock, "unlock");
    return v7;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: 0 <= storeType && storeType < RTPersistenceStoreTypeCount", v8, 2u);
    }

    return 0;
  }
}

- (unint64_t)countOfPersistenceStores
{
  -[NSRecursiveLock lock](self->_storesArrayLock, "lock");
  -[NSRecursiveLock unlock](self->_storesArrayLock, "unlock");
  return 4;
}

+ (id)defaultModelsDirectory
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "_coreroutineBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("CoreRoutine"), CFSTR("momd"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)defaultStoresDirectory
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "routineCacheDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v2, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)container:(id)a3 willActivateRequestsQueue:(id)a4
{
  -[RTPersistenceManager _updateAvailabilityAfterSetupAttemptWithAvailability:](self, "_updateAvailabilityAfterSetupAttemptWithAvailability:", 2, a4);
}

- (void)container:(id)a3 failedToActivateRequestsQueue:(id)a4
{
  -[RTPersistenceManager _updateAvailabilityAfterSetupAttemptWithAvailability:](self, "_updateAvailabilityAfterSetupAttemptWithAvailability:", 1, a4);
}

- (void)_updateAvailabilityAfterSetupAttemptWithAvailability:(unint64_t)a3
{
  id WeakRetained;

  -[RTPersistenceManager _updateStoreAvailability:](self, "_updateStoreAvailability:", a3);
  if (-[RTPersistenceManager availability](self, "availability") == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "persistenceManager:didFinishSetup:", self, 1);
    -[RTPersistenceManager _setupRemoteStoreServers](self, "_setupRemoteStoreServers");

  }
}

- (BOOL)_generateDiagnosticFilesAtURL:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t i;
  RTPersistenceStore *v11;
  char v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  NSObject *v19;
  objc_class *v20;
  RTPersistenceStore *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  const char *aSelector;
  id *v27;
  id v28;
  uint8_t buf[4];
  RTPersistenceStore *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[RTPersistenceManager delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v18 = 0;
      goto LABEL_24;
    }
    aSelector = a2;
    v27 = a4;
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    for (i = 0; i != 4; ++i)
    {
      -[NSRecursiveLock lock](self->_storesArrayLock, "lock");
      v11 = self->_stores[i];
      -[NSRecursiveLock unlock](self->_storesArrayLock, "unlock");
      if (v11)
      {
        v28 = 0;
        v12 = objc_msgSend(v8, "copyPersistenceStore:outputURL:error:", v11, v7, &v28);
        v13 = v28;
        if ((v12 & 1) == 0)
        {
          _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v30 = v11;
            v31 = 2112;
            v32 = (uint64_t)v13;
            _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "copy persistence store, %@, error, %@", buf, 0x16u);
          }

          if (v13)
            -[NSObject addObject:](v9, "addObject:", v13);
        }

      }
    }
    _RTSafeArray();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
      *v27 = objc_retainAutorelease(v16);
    v17 = -[NSObject count](v9, "count", 1);
    v18 = v17 == 0;
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (RTPersistenceStore *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      v24 = CFSTR("NO:");
      *(_DWORD *)buf = 138413058;
      v30 = v21;
      v31 = 2112;
      if (!v17)
        v24 = CFSTR("YES");
      v32 = v22;
      v33 = 2112;
      v34 = v24;
      v35 = 2112;
      v36 = v16;
      _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "%@ %@, success, %@, error, %@", buf, 0x2Au);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: strongDelegate", buf, 2u);
    }
    v18 = 0;
  }

LABEL_24:
  return v18;
}

- (void)sendDiagnosticsToURL:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[RTNotifier queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__RTPersistenceManager_sendDiagnosticsToURL_options_handler___block_invoke;
  block[3] = &unk_1E9298750;
  v19 = v11;
  v20 = a2;
  block[4] = self;
  v17 = v10;
  v18 = v9;
  v13 = v9;
  v14 = v11;
  v15 = v10;
  dispatch_async(v12, block);

}

void __61__RTPersistenceManager_sendDiagnosticsToURL_options_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(const __CFString **)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    v20 = v4;
    v21 = 2112;
    v22 = (uint64_t)v5;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@ %@, options, %@", buf, 0x20u);

  }
  if ((objc_msgSend(*(id *)(a1 + 40), "hasMask:", 1) & 1) != 0)
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 48);
    v18 = 0;
    v9 = objc_msgSend(v7, "_generateDiagnosticFilesAtURL:error:", v8, &v18);
    v10 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      v16 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v20 = v13;
      v21 = 2112;
      if (v9)
        v16 = CFSTR("YES");
      v22 = v14;
      v23 = 2112;
      v24 = v16;
      v25 = 2112;
      v26 = v10;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@ %@, success, %@, error, %@", buf, 0x2Au);

    }
    v17 = *(_QWORD *)(a1 + 56);
    if (v17)
      (*(void (**)(uint64_t, id))(v17 + 16))(v17, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (void)setAvailability:(unint64_t)a3
{
  self->_availability = a3;
}

- (RTPersistenceDelegate)delegate
{
  return (RTPersistenceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RTPersistenceMirroringDelegate)mirroringDelegate
{
  return (RTPersistenceMirroringDelegate *)objc_loadWeakRetained((id *)&self->_mirroringDelegate);
}

- (void)setMirroringDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_mirroringDelegate, a3);
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_destroyWeak((id *)&self->_mirroringDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteServers, 0);
  objc_storeStrong((id *)&self->_outstandingContexts, 0);
  objc_storeStrong((id *)&self->_storesArrayLock, 0);
  objc_storeStrong((id *)&self->_pointerArrayLock, 0);
  objc_storeStrong((id *)&self->_latestModel, 0);
  objc_storeStrong((id *)&self->_container, 0);
  for (i = 3; i != -1; --i)
    objc_storeStrong((id *)&self->_stores[i], 0);
  objc_storeStrong((id *)&self->_sortedModelNames, 0);
  objc_storeStrong((id *)&self->_storesDirectory, 0);
  objc_storeStrong((id *)&self->_modelsDirectory, 0);
}

- (void)performImportMirroringRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__RTPersistenceManager_Internal__performImportMirroringRequest___block_invoke;
  v6[3] = &unk_1E929A448;
  v7 = v4;
  v5 = v4;
  -[RTPersistenceManager performImportMirroringRequestWithQualityOfService:handler:](self, "performImportMirroringRequestWithQualityOfService:handler:", 3, v6);

}

void __64__RTPersistenceManager_Internal__performImportMirroringRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    if (v4)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v10 = 138412290;
        v11 = v4;
        _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v10, 0xCu);
      }

      v7 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v4, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, objc_msgSend(v4, "code"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v9 = 0;
    }
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v9);

  }
}

- (void)performExportMirroringRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__RTPersistenceManager_Internal__performExportMirroringRequest___block_invoke;
  v6[3] = &unk_1E929A448;
  v7 = v4;
  v5 = v4;
  -[RTPersistenceManager performExportMirroringRequestWithQualityOfService:handler:](self, "performExportMirroringRequestWithQualityOfService:handler:", 3, v6);

}

void __64__RTPersistenceManager_Internal__performExportMirroringRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    if (v4)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v10 = 138412290;
        v11 = v4;
        _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v10, 0xCu);
      }

      v7 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v4, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, objc_msgSend(v4, "code"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v9 = 0;
    }
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v9);

  }
}

- (void)performZoneResetMirroringRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__RTPersistenceManager_Internal__performZoneResetMirroringRequest___block_invoke;
  v6[3] = &unk_1E929A448;
  v7 = v4;
  v5 = v4;
  -[RTPersistenceManager performZoneResetMirroringRequestWithQualityOfService:handler:](self, "performZoneResetMirroringRequestWithQualityOfService:handler:", 3, v6);

}

void __67__RTPersistenceManager_Internal__performZoneResetMirroringRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    if (v4)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v10 = 138412290;
        v11 = v4;
        _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v10, 0xCu);
      }

      v7 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v4, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, objc_msgSend(v4, "code"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v9 = 0;
    }
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v9);

  }
}

- (void)mirroringDelegateSetupState:(id)a3
{
  int64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = -[RTPersistenceManager mirroringDelegateStateForStoreType:](self, "mirroringDelegateStateForStoreType:", 1);
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, int64_t, _QWORD))v6 + 2))(v6, v4, 0);
    v5 = v6;
  }

}

@end
