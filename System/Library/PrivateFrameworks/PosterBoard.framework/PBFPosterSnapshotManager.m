@implementation PBFPosterSnapshotManager

- (PBFPosterSnapshotManager)initWithRuntimeAssertionProvider:(id)a3 extensionProvider:(id)a4 modelCoordinatorProvider:(id)a5 applicationStateMonitor:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  PBFPosterSnapshotManager *v22;
  PBFPosterSnapshotManager *v23;
  uint64_t v24;
  NSMapTable *lock_requestToCompletion;
  uint64_t v26;
  PBFPriorityQueue *lock_priorityQueue;
  uint64_t v28;
  NSMutableArray *lock_fulfilledSnapshotBlocks;
  uint64_t v30;
  NSMutableSet *assertionLock_inUseAssertions;
  uint64_t v32;
  NSMutableDictionary *assertionLock_extensionSnapshotterDisabledAssertions;
  uint64_t v34;
  NSMutableDictionary *assertionLock_extensionEditingInProgressAssertions;
  NSOperationQueue *v36;
  NSOperationQueue *operationQueue;
  os_activity_t v38;
  OS_os_activity *snapshotActivity;
  uint64_t v40;
  PRUISSnapshotService *snapshotService;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  objc_super v50;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v11;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager initWithRuntimeAssertionProvider:extensionProvider:modelCoordinatorProvider:applicationStateMonitor:].cold.1();
LABEL_36:
    objc_msgSend(objc_retainAutorelease(v43), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA758E8);
  }
  v16 = v15;
  if ((objc_msgSend(v15, "conformsToProtocol:", &unk_1EF9EC398) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PBFRuntimeAssertionProviding)]"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager initWithRuntimeAssertionProvider:extensionProvider:modelCoordinatorProvider:applicationStateMonitor:].cold.1();
    objc_msgSend(objc_retainAutorelease(v44), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA7594CLL);
  }

  v17 = v12;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager initWithRuntimeAssertionProvider:extensionProvider:modelCoordinatorProvider:applicationStateMonitor:].cold.2();
    objc_msgSend(objc_retainAutorelease(v45), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA759B0);
  }
  v18 = v17;
  if ((objc_msgSend(v17, "conformsToProtocol:", &unk_1EF9CE9A0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PBFExtensionProviding)]"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager initWithRuntimeAssertionProvider:extensionProvider:modelCoordinatorProvider:applicationStateMonitor:].cold.2();
    objc_msgSend(objc_retainAutorelease(v46), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA75A14);
  }

  v19 = v13;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager initWithRuntimeAssertionProvider:extensionProvider:modelCoordinatorProvider:applicationStateMonitor:].cold.3();
    objc_msgSend(objc_retainAutorelease(v47), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA75A78);
  }
  v20 = v19;
  if ((objc_msgSend(v19, "conformsToProtocol:", &unk_1EF9CEA70) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PBFModelCoordinatorProviding)]"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager initWithRuntimeAssertionProvider:extensionProvider:modelCoordinatorProvider:applicationStateMonitor:].cold.3();
    objc_msgSend(objc_retainAutorelease(v48), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA75ADCLL);
  }

  v21 = v14;
  NSClassFromString(CFSTR("PBFApplicationStateMonitor"));
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager initWithRuntimeAssertionProvider:extensionProvider:modelCoordinatorProvider:applicationStateMonitor:].cold.4();
    objc_msgSend(objc_retainAutorelease(v49), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA75B40);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PBFApplicationStateMonitorClass]"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager initWithRuntimeAssertionProvider:extensionProvider:modelCoordinatorProvider:applicationStateMonitor:].cold.4();
    goto LABEL_36;
  }

  v50.receiver = self;
  v50.super_class = (Class)PBFPosterSnapshotManager;
  v22 = -[PBFPosterSnapshotManager init](&v50, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeWeak((id *)&v22->_modelCoordinatorProvider, v20);
    objc_storeStrong((id *)&v23->_runtimeAssertionProvider, a3);
    objc_storeStrong((id *)&v23->_applicationStateMonitor, a6);
    *(_QWORD *)&v23->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v23->_extensionProvider, v18);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v24 = objc_claimAutoreleasedReturnValue();
    lock_requestToCompletion = v23->_lock_requestToCompletion;
    v23->_lock_requestToCompletion = (NSMapTable *)v24;

    v26 = objc_opt_new();
    lock_priorityQueue = v23->_lock_priorityQueue;
    v23->_lock_priorityQueue = (PBFPriorityQueue *)v26;

    v28 = objc_opt_new();
    lock_fulfilledSnapshotBlocks = v23->_lock_fulfilledSnapshotBlocks;
    v23->_lock_fulfilledSnapshotBlocks = (NSMutableArray *)v28;

    v30 = objc_opt_new();
    assertionLock_inUseAssertions = v23->_assertionLock_inUseAssertions;
    v23->_assertionLock_inUseAssertions = (NSMutableSet *)v30;

    v32 = objc_opt_new();
    assertionLock_extensionSnapshotterDisabledAssertions = v23->_assertionLock_extensionSnapshotterDisabledAssertions;
    v23->_assertionLock_extensionSnapshotterDisabledAssertions = (NSMutableDictionary *)v32;

    v34 = objc_opt_new();
    assertionLock_extensionEditingInProgressAssertions = v23->_assertionLock_extensionEditingInProgressAssertions;
    v23->_assertionLock_extensionEditingInProgressAssertions = (NSMutableDictionary *)v34;

    v36 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v23->_operationQueue;
    v23->_operationQueue = v36;

    -[NSOperationQueue setName:](v23->_operationQueue, "setName:", CFSTR("SnapshotQueue"));
    -[NSOperationQueue setSuspended:](v23->_operationQueue, "setSuspended:", 1);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v23->_operationQueue, "setMaxConcurrentOperationCount:", 6);
    v23->_assertionLock_isOperationQueueSuspended = 1;
    v38 = _os_activity_create(&dword_1CB9FA000, "PBFPosterSnapshotManager Snapshotting Activity", MEMORY[0x1E0C80FE0], OS_ACTIVITY_FLAG_DETACHED);
    snapshotActivity = v23->_snapshotActivity;
    v23->_snapshotActivity = (OS_os_activity *)v38;

    -[PBFPosterSnapshotManager _setupMemoryPressureTracking](v23, "_setupMemoryPressureTracking");
    if (PUIFeatureEnabled())
    {
      v40 = objc_opt_new();
      snapshotService = v23->_snapshotService;
      v23->_snapshotService = (PRUISSnapshotService *)v40;

    }
  }

  return v23;
}

- (void)dealloc
{
  NSObject *memoryPressureSource;
  OS_dispatch_source *v4;
  objc_super v5;

  memoryPressureSource = self->_memoryPressureSource;
  if (memoryPressureSource)
  {
    dispatch_source_cancel(memoryPressureSource);
    v4 = self->_memoryPressureSource;
    self->_memoryPressureSource = 0;

  }
  os_unfair_lock_lock(&self->_lock);
  -[PBFPosterSnapshotManager _lock_invalidateAllCompletionHandlers](self, "_lock_invalidateAllCompletionHandlers");
  os_unfair_lock_unlock(&self->_lock);
  -[PBFPosterSnapshotManager _teardownBehaviorAssertionsIfAppropriate:](self, "_teardownBehaviorAssertionsIfAppropriate:", CFSTR("Dealloc"));
  -[PBFPosterSnapshotManager _teardownPrewarmAssertionIfAppropriate:](self, "_teardownPrewarmAssertionIfAppropriate:", CFSTR("Dealloc"));
  v5.receiver = self;
  v5.super_class = (Class)PBFPosterSnapshotManager;
  -[PBFPosterSnapshotManager dealloc](&v5, sel_dealloc);
}

- (void)_setupMemoryPressureTracking
{
  NSObject *v3;
  OS_dispatch_source *v4;
  OS_dispatch_source *memoryPressureSource;
  NSOperationQueue *v6;
  NSObject *v7;
  NSOperationQueue *v8;
  _QWORD handler[4];
  NSOperationQueue *v10;
  id v11;
  id location;

  if (!self->_memoryPressureSource)
  {
    v3 = dispatch_queue_create("com.apple.PosterBoard.PBFPosterSnapshotManager.memoryWarningQueue", 0);
    objc_initWeak(&location, self);
    v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 7uLL, v3);
    memoryPressureSource = self->_memoryPressureSource;
    self->_memoryPressureSource = v4;

    v6 = self->_operationQueue;
    v7 = self->_memoryPressureSource;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __56__PBFPosterSnapshotManager__setupMemoryPressureTracking__block_invoke;
    handler[3] = &unk_1E86F47F0;
    objc_copyWeak(&v11, &location);
    v10 = v6;
    v8 = v6;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume((dispatch_object_t)self->_memoryPressureSource);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
}

void __56__PBFPosterSnapshotManager__setupMemoryPressureTracking__block_invoke(uint64_t a1)
{
  dispatch_source_t *WeakRetained;
  dispatch_source_t *v3;
  uintptr_t data;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  int v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    data = dispatch_source_get_data(WeakRetained[21]);
    switch(data)
    {
      case 4uLL:
        PBFLogSnapshotter();
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = 1;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v8 = 67109120;
          v9 = 1;
          v7 = "DISPATCH_MEMORYPRESSURE_CRITICAL; setting MaxConcurrentOperationCount to %d";
          goto LABEL_11;
        }
LABEL_12:

        objc_msgSend(*(id *)(a1 + 32), "setMaxConcurrentOperationCount:", v6);
        break;
      case 2uLL:
        PBFLogSnapshotter();
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = 2;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v8 = 67109120;
          v9 = 2;
          v7 = "DISPATCH_MEMORYPRESSURE_WARN; setting MaxConcurrentOperationCount to %d";
          goto LABEL_11;
        }
        goto LABEL_12;
      case 1uLL:
        PBFLogSnapshotter();
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = 6;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v8 = 67109120;
          v9 = 6;
          v7 = "DISPATCH_MEMORYPRESSURE_NORMAL; setting MaxConcurrentOperationCount to %d";
LABEL_11:
          _os_log_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v8, 8u);
          goto LABEL_12;
        }
        goto LABEL_12;
    }
  }

}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *lock_observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    os_unfair_lock_lock(&self->_lock);
    lock_observers = self->_lock_observers;
    if (!lock_observers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_lock_observers;
      self->_lock_observers = v6;

      lock_observers = self->_lock_observers;
    }
    -[NSHashTable addObject:](lock_observers, "addObject:", v8);
    os_unfair_lock_unlock(&self->_lock);
    v4 = v8;
  }

}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSHashTable *lock_observers;

  if (a3)
  {
    p_lock = &self->_lock;
    v5 = a3;
    os_unfair_lock_lock(p_lock);
    -[NSHashTable removeObject:](self->_lock_observers, "removeObject:", v5);

    if (!-[NSHashTable count](self->_lock_observers, "count"))
    {
      lock_observers = self->_lock_observers;
      self->_lock_observers = 0;

    }
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)_lock_enumerateObservers:(id)a3
{
  void (**v4)(id, uint64_t, char *);
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, char *))a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_lock_observers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
      v11 = 0;
      v4[2](v4, v10, &v11);
      if (v11)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (BOOL)ingestSnapshotCollection:(id)a3 forConfiguration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int IsVolatile;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  PBFPosterSnapshotManager *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  int v55;
  NSObject *v56;
  _BOOL4 v57;
  id *v58;
  void *v59;
  void *v60;
  const char *v61;
  NSObject *v62;
  uint32_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t i;
  uint64_t v73;
  void *v74;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  id *v87;
  id v88;
  PBFPosterSnapshotManager *v89;
  void *v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  uint64_t v96;
  const __CFString *v97;
  uint8_t buf[4];
  id v99;
  __int16 v100;
  void *v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v8;
  NSClassFromString(CFSTR("PRSPosterSnapshotCollection"));
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager ingestSnapshotCollection:forConfiguration:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v76), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA768D0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterSnapshotCollectionClass]"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager ingestSnapshotCollection:forConfiguration:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v77), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA76934);
  }

  v11 = v9;
  NSClassFromString(CFSTR("PRPosterConfiguration"));
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager ingestSnapshotCollection:forConfiguration:error:].cold.2();
    objc_msgSend(objc_retainAutorelease(v78), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA76998);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterConfigurationClass]"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager ingestSnapshotCollection:forConfiguration:error:].cold.2();
    objc_msgSend(objc_retainAutorelease(v79), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA769FCLL);
  }

  objc_msgSend(v11, "_path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "loadConfiguredPropertiesWithError:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v10, "primaryLayersSnapshot");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "surface");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      if (a5)
      {
        v25 = (void *)MEMORY[0x1E0CB35C8];
        v96 = *MEMORY[0x1E0CB2D68];
        v97 = CFSTR("unable to ingest snapshotCollection which does not possess snapshots backed by IOSurface");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = objc_retainAutorelease(v27);
        *a5 = v28;

      }
      PBFLogSnapshotter();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v99 = v10;
        _os_log_impl(&dword_1CB9FA000, v29, OS_LOG_TYPE_DEFAULT, "Snapshotter could not ingest snapshotCollection because it is not backed by an IOSurface: %@", buf, 0xCu);
      }
      v24 = 0;
      goto LABEL_57;
    }
    IsVolatile = PUIIOSurfaceIsVolatile();
    PBFLogSnapshotter();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    v87 = a5;
    v89 = self;
    if (IsVolatile)
    {
      if (!v18)
        goto LABEL_19;
      objc_msgSend(v12, "serverIdentity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "posterUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v99 = v15;
      v100 = 2114;
      v101 = v20;
      v21 = "Attempting to ingest *VOLATILE* Surface %@ for path %{public}@";
      v22 = v17;
      v23 = 22;
    }
    else
    {
      if (!v18)
        goto LABEL_19;
      objc_msgSend(v12, "serverIdentity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "posterUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v99 = v20;
      v21 = "Attempting to ingest Surface for path %{public}@";
      v22 = v17;
      v23 = 12;
    }
    _os_log_impl(&dword_1CB9FA000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);

LABEL_19:
    v90 = v12;

    v30 = objc_msgSend(v10, "interfaceStyle");
    if (v30 == 2)
      v31 = 2;
    else
      v31 = v30 == 1;
    v32 = objc_msgSend(v10, "accessibilityContrast");
    if (v32 == 1)
      v33 = 0;
    else
      v33 = -1;
    if (v32 == 2)
      v34 = 1;
    else
      v34 = v33;
    objc_msgSend(v15, "attachmentForKey:", CFSTR("kPaperboardIOSurfaceDeviceOrientationPropertiesKey"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v15;
    v37 = objc_msgSend(v35, "unsignedIntegerValue");

    objc_msgSend(v36, "attachmentForKey:", CFSTR("kPaperboardIOSurfaceInterfaceOrientationPropertiesKey"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "unsignedIntegerValue");

    if (MEMORY[0x1D17A2F74]())
      v40 = v37;
    else
      v40 = v39;
    if (!v40)
    {
      v41 = objc_msgSend(v10, "interfaceOrientation");
      if (v41 > 2)
        v40 = 0;
      else
        v40 = qword_1CBB8E328[v41];
    }
    objc_msgSend(v10, "snapshotScale");
    v43 = v42;
    objc_msgSend(v10, "snapshotDisplayIdentity");
    v84 = objc_claimAutoreleasedReturnValue();
    +[PBFGenericDisplayContext displayContextForDisplayIdentifier:](PBFGenericDisplayContext, "displayContextForDisplayIdentifier:");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "displayContextWithUpdatedUserInterfaceStyle:", PBFUserInterfaceStyleFromUIUserInterfaceStyle(v31));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "displayContextWithUpdatedAccessibilityContrast:", PBFAccessibilityContrastFromUIAccessibilityContrast(v34));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "displayContextWithUpdatedInterfaceOrientation:", v40);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBFPosterSnapshotDefinition switcherSnapshotDefinition](PBFPosterSnapshotDefinition, "switcherSnapshotDefinition");
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = v89;
    -[PBFPosterSnapshotManager _createSnapshotForDefinition:withSurface:snapshotScale:configuredProperties:path:context:error:](v89, "_createSnapshotForDefinition:withSurface:snapshotScale:configuredProperties:path:context:error:", v49, v36, v13, v90, v47, v87, v43);
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = (void *)v51;
    v15 = v36;
    v85 = (void *)v49;
    if (!v51)
    {
      v24 = 0;
      v12 = v90;
      v29 = v84;
LABEL_56:

LABEL_57:
      goto LABEL_58;
    }
    v82 = (void *)v51;
    v83 = v36;
    objc_msgSend(v48, "setObject:forKeyedSubscript:", v51, v49);
    objc_msgSend(v10, "floatingLayerSnapshot");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "surface");
    v54 = objc_claimAutoreleasedReturnValue();

    v86 = (void *)v54;
    if (!v54)
      goto LABEL_46;
    v55 = PUIIOSurfaceIsVolatile();
    PBFLogSnapshotter();
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT);
    if (v55)
    {
      v12 = v90;
      v58 = v87;
      if (v57)
      {
        objc_msgSend(v90, "serverIdentity");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "posterUUID");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v99 = v83;
        v100 = 2114;
        v101 = v60;
        v61 = "Attempting to ingest *VOLATILE* floating Surface %@ for path %{public}@";
        v62 = v56;
        v63 = 22;
LABEL_43:
        _os_log_impl(&dword_1CB9FA000, v62, OS_LOG_TYPE_DEFAULT, v61, buf, v63);

        v12 = v90;
      }
    }
    else
    {
      v12 = v90;
      v58 = v87;
      if (v57)
      {
        objc_msgSend(v90, "serverIdentity");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "posterUUID");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v99 = v60;
        v61 = "Attempting to ingest floating Surface for path %{public}@";
        v62 = v56;
        v63 = 12;
        goto LABEL_43;
      }
    }

    +[PBFPosterSnapshotDefinition switcherFloatingLayerSnapshotDefinition](PBFPosterSnapshotDefinition, "switcherFloatingLayerSnapshotDefinition");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterSnapshotManager _createSnapshotForDefinition:withSurface:snapshotScale:configuredProperties:path:context:error:](v89, "_createSnapshotForDefinition:withSurface:snapshotScale:configuredProperties:path:context:error:", v64, v86, v13, v12, v47, v58, v43);
    v65 = objc_claimAutoreleasedReturnValue();
    if (!v65)
    {
      v24 = 0;
LABEL_55:

      v15 = v83;
      v29 = v84;
      v52 = v82;
      goto LABEL_56;
    }
    v66 = (void *)v65;
    objc_msgSend(v48, "setObject:forKeyedSubscript:", v65, v64);

    v50 = v89;
LABEL_46:
    v81 = v11;
    v88 = v10;
    -[PBFPosterSnapshotManager _snapshotCoordinatorForPath:](v50, "_snapshotCoordinatorForPath:", v90);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "ingestSnapshotsByDefinition:path:configuredProperties:context:", v48, v90, v13, v47);
    v67 = (void *)objc_opt_new();
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v80 = v48;
    v68 = v48;
    v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v91, v95, 16);
    if (v69)
    {
      v70 = v69;
      v71 = *(_QWORD *)v92;
      do
      {
        for (i = 0; i != v70; ++i)
        {
          if (*(_QWORD *)v92 != v71)
            objc_enumerationMutation(v68);
          v73 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * i);
          objc_msgSend(v64, "snapshotReservationForDefinition:configuredProperties:context:", v73, v13, v47);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "setObject:forKeyedSubscript:", v74, v73);

        }
        v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v91, v95, 16);
      }
      while (v70);
    }

    os_unfair_lock_lock(&v89->_lock);
    v12 = v90;
    -[PBFPosterSnapshotManager _lock_fireDidUpdateSnapshotForPath:snapshotImagesByReservation:](v89, "_lock_fireDidUpdateSnapshotForPath:snapshotImagesByReservation:", v90, v67);
    os_unfair_lock_unlock(&v89->_lock);

    v24 = 1;
    v10 = v88;
    v48 = v80;
    v11 = v81;
    goto LABEL_55;
  }
  v24 = 0;
LABEL_58:

  return v24;
}

- (id)_createSnapshotForDefinition:(id)a3 withSurface:(id)a4 snapshotScale:(double)a5 configuredProperties:(id)a6 path:(id)a7 context:(id)a8 error:(id *)a9
{
  void *v15;
  id v16;
  void *v17;
  void *v18;

  v15 = (void *)MEMORY[0x1E0D7FCD8];
  v16 = a4;
  objc_msgSend(v15, "pbf_imageEncoderForPath:definition:configuredProperties:context:", a7, a3, a6, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBFPosterSnapshotter createSnapshotUsingIOSurface:snapshotScale:imageEncoder:error:](PBFPosterSnapshotter, "createSnapshotUsingIOSurface:snapshotScale:imageEncoder:error:", v16, v17, a9, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)acquireSnapshotterInUseAssertionWithReason:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0D01868]);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __71__PBFPosterSnapshotManager_acquireSnapshotterInUseAssertionWithReason___block_invoke;
  v11 = &unk_1E86F5238;
  objc_copyWeak(&v12, &location);
  v6 = (void *)objc_msgSend(v5, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("com.apple.PosterBoard.snapshotter.inUseAssertion"), v4, &v8);
  os_unfair_lock_lock(&self->_assertionLock);
  -[NSMutableSet addObject:](self->_assertionLock_inUseAssertions, "addObject:", v6, v8, v9, v10, v11);
  -[PBFPosterSnapshotManager _assertionLock_evaluateInUseAssertions](self, "_assertionLock_evaluateInUseAssertions");
  os_unfair_lock_unlock(&self->_assertionLock);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

void __71__PBFPosterSnapshotManager_acquireSnapshotterInUseAssertionWithReason___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_invalidateInUseAssertion:", v3);

}

- (void)_invalidateInUseAssertion:(id)a3
{
  os_unfair_lock_s *p_assertionLock;
  id v5;

  p_assertionLock = &self->_assertionLock;
  v5 = a3;
  os_unfair_lock_lock(p_assertionLock);
  -[NSMutableSet removeObject:](self->_assertionLock_inUseAssertions, "removeObject:", v5);

  -[PBFPosterSnapshotManager _assertionLock_evaluateInUseAssertions](self, "_assertionLock_evaluateInUseAssertions");
  os_unfair_lock_unlock(p_assertionLock);
}

- (void)_assertionLock_evaluateInUseAssertions
{
  uint64_t v3;
  _BOOL4 assertionLock_isOperationQueueSuspended;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  const char *v8;
  PBFRuntimeAssertionProviding *v9;
  void *v10;
  void *v11;
  id *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  PBFRuntimeAssertionProviding *runtimeAssertionProvider;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD aBlock[4];
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[8];
  id location;

  v3 = -[NSMutableSet count](self->_assertionLock_inUseAssertions, "count");
  assertionLock_isOperationQueueSuspended = self->_assertionLock_isOperationQueueSuspended;
  objc_initWeak(&location, self);
  if (!v3)
  {
    if (assertionLock_isOperationQueueSuspended)
    {
      PBFLogSnapshotter();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "snapshotter operation queue already suspended";
LABEL_14:
        _os_log_impl(&dword_1CB9FA000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
      }
    }
    else
    {
      -[PBFPosterSnapshotManager _assertionLock_updateOperationQueueSuspended:](self, "_assertionLock_updateOperationQueueSuspended:", 1);
      -[NSOperationQueue setSuspended:](self->_operationQueue, "setSuspended:", 1);
      os_activity_scope_leave(&self->_snapshotActivityState);
      PBFLogSnapshotter();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "snapshotter operation queue suspending";
        goto LABEL_14;
      }
    }

    runtimeAssertionProvider = self->_runtimeAssertionProvider;
    objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFRuntimeAssertionProviding acquirePrewarmRuntimeAssertionForReason:target:invalidationHandler:](runtimeAssertionProvider, "acquirePrewarmRuntimeAssertionForReason:target:invalidationHandler:", CFSTR("Updating foreground->background"), v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __66__PBFPosterSnapshotManager__assertionLock_evaluateInUseAssertions__block_invoke;
    v25[3] = &unk_1E86F5288;
    v12 = &v27;
    objc_copyWeak(&v27, &location);
    v25[4] = self;
    v13 = v19;
    v26 = v13;
    v20 = _Block_copy(v25);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFPosterSnapshotManager _assertionLock_evaluateInUseAssertions]");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBFDispatchAsyncWithString(v21, QOS_CLASS_USER_INITIATED, v20);

    v16 = v26;
    goto LABEL_16;
  }
  if (assertionLock_isOperationQueueSuspended)
  {
    -[PBFPosterSnapshotManager _assertionLock_updateOperationQueueSuspended:](self, "_assertionLock_updateOperationQueueSuspended:", 0);
    -[NSOperationQueue setSuspended:](self->_operationQueue, "setSuspended:", 0);
    os_activity_scope_enter((os_activity_t)self->_snapshotActivity, &self->_snapshotActivityState);
    PBFLogSnapshotter();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "snapshotter operation queue activating";
LABEL_10:
      _os_log_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    }
  }
  else
  {
    PBFLogSnapshotter();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "snapshotter operation queue already activated";
      goto LABEL_10;
    }
  }

  v9 = self->_runtimeAssertionProvider;
  objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFRuntimeAssertionProviding acquirePrewarmRuntimeAssertionForReason:target:invalidationHandler:](v9, "acquirePrewarmRuntimeAssertionForReason:target:invalidationHandler:", CFSTR("Updating background->foreground"), v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PBFPosterSnapshotManager__assertionLock_evaluateInUseAssertions__block_invoke_155;
  aBlock[3] = &unk_1E86F47F0;
  v12 = &v24;
  objc_copyWeak(&v24, &location);
  v13 = v11;
  v23 = v13;
  v14 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFPosterSnapshotManager _assertionLock_evaluateInUseAssertions]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PBFDispatchAsyncWithString(v15, QOS_CLASS_USER_INITIATED, v14);

  v16 = v23;
LABEL_16:

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __66__PBFPosterSnapshotManager__assertionLock_evaluateInUseAssertions__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __66__PBFPosterSnapshotManager__assertionLock_evaluateInUseAssertions__block_invoke_2;
    v4[3] = &unk_1E86F5260;
    v4[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "_enumerateAssertionObservers:respondingToSelector:", v4, sel_assertionProviderDidRelinquishInUseAssertion_);
    objc_msgSend(v3, "_teardownPrewarmAssertionIfAppropriate:", CFSTR("Queue suspended"));
  }
  objc_msgSend(*(id *)(a1 + 40), "invalidate");

}

uint64_t __66__PBFPosterSnapshotManager__assertionLock_evaluateInUseAssertions__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assertionProviderDidRelinquishInUseAssertion:", *(_QWORD *)(a1 + 32));
}

void __66__PBFPosterSnapshotManager__assertionLock_evaluateInUseAssertions__block_invoke_155(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_acquirePrewarmAssertionIfNeeded:", 0);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __66__PBFPosterSnapshotManager__assertionLock_evaluateInUseAssertions__block_invoke_2_156;
    v4[3] = &unk_1E86F5260;
    v4[4] = v3;
    objc_msgSend(v3, "_enumerateAssertionObservers:respondingToSelector:", v4, sel_assertionProviderDidAcquireInUseAssertion_);
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

uint64_t __66__PBFPosterSnapshotManager__assertionLock_evaluateInUseAssertions__block_invoke_2_156(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assertionProviderDidAcquireInUseAssertion:", *(_QWORD *)(a1 + 32));
}

- (id)acquireSnapshotterDisabledAssertionForProvider:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  NSClassFromString(CFSTR("NSString"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager acquireSnapshotterDisabledAssertionForProvider:withReason:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA77320);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager acquireSnapshotterDisabledAssertionForProvider:withReason:].cold.2();
    goto LABEL_11;
  }

  objc_initWeak(&location, self);
  v9 = objc_alloc(MEMORY[0x1E0D01868]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.PosterBoard.snapshotter.disabledAssertion-%@"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __86__PBFPosterSnapshotManager_acquireSnapshotterDisabledAssertionForProvider_withReason___block_invoke;
  v16[3] = &unk_1E86F52B0;
  objc_copyWeak(&v18, &location);
  v11 = v8;
  v17 = v11;
  v12 = (void *)objc_msgSend(v9, "initWithIdentifier:forReason:invalidationBlock:", v10, v7, v16);

  os_unfair_lock_lock(&self->_assertionLock);
  -[NSMutableDictionary objectForKey:](self->_assertionLock_extensionSnapshotterDisabledAssertions, "objectForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v13 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKey:](self->_assertionLock_extensionSnapshotterDisabledAssertions, "setObject:forKey:", v13, v11);
  }
  objc_msgSend(v13, "addObject:", v12);
  os_unfair_lock_unlock(&self->_assertionLock);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v12;
}

void __86__PBFPosterSnapshotManager_acquireSnapshotterDisabledAssertionForProvider_withReason___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_invalidateExtensionSnapshotterDisabledAssertion:extensionIdentifier:", v4, *(_QWORD *)(a1 + 32));

}

- (id)acquireEditingSessionAssertionForProvider:(id)a3 withReason:(id)a4
{
  id v6;
  __CFString *v7;
  id v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id location;

  v6 = a3;
  v7 = (__CFString *)a4;
  v8 = v6;
  NSClassFromString(CFSTR("NSString"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager acquireEditingSessionAssertionForProvider:withReason:].cold.1();
LABEL_16:
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA776D4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager acquireEditingSessionAssertionForProvider:withReason:].cold.2();
    goto LABEL_16;
  }

  objc_initWeak(&location, self);
  if (v7)
    v9 = v7;
  else
    v9 = CFSTR("(null)");
  objc_msgSend(CFSTR("EditingSessionAcquisition-"), "stringByAppendingString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterSnapshotManager acquireSnapshotterDisabledAssertionForProvider:withReason:](self, "acquireSnapshotterDisabledAssertionForProvider:withReason:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0D01868]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.PosterBoard.editingSession-%@"), v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __81__PBFPosterSnapshotManager_acquireEditingSessionAssertionForProvider_withReason___block_invoke;
  v24[3] = &unk_1E86F52D8;
  v14 = v11;
  v25 = v14;
  objc_copyWeak(&v27, &location);
  v15 = v8;
  v26 = v15;
  v16 = (void *)objc_msgSend(v12, "initWithIdentifier:forReason:invalidationBlock:", v13, v7, v24);

  os_unfair_lock_lock(&self->_assertionLock);
  -[NSMutableDictionary objectForKey:](self->_assertionLock_extensionEditingInProgressAssertions, "objectForKey:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");
  if (!v18)
  {
    v19 = objc_opt_new();

    -[NSMutableDictionary setObject:forKey:](self->_assertionLock_extensionEditingInProgressAssertions, "setObject:forKey:", v19, v15);
    v17 = (void *)v19;
  }
  objc_msgSend(v17, "addObject:", v16);
  os_unfair_lock_unlock(&self->_assertionLock);
  if (!v18)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __81__PBFPosterSnapshotManager_acquireEditingSessionAssertionForProvider_withReason___block_invoke_2;
    v22[3] = &unk_1E86F5300;
    v22[4] = self;
    v23 = v15;
    -[PBFPosterSnapshotManager _enumerateAssertionObservers:respondingToSelector:](self, "_enumerateAssertionObservers:respondingToSelector:", v22, sel_assertionProviderDidAcquireEditingSessionAssertion_forExtensionIdentifier_);

  }
  objc_destroyWeak(&v27);

  objc_destroyWeak(&location);
  return v16;
}

void __81__PBFPosterSnapshotManager_acquireEditingSessionAssertionForProvider_withReason___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id WeakRetained;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "invalidate");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_invalidateEditingSessionAssertion:extensionIdentifier:", v4, *(_QWORD *)(a1 + 40));

}

uint64_t __81__PBFPosterSnapshotManager_acquireEditingSessionAssertionForProvider_withReason___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assertionProviderDidAcquireEditingSessionAssertion:forExtensionIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)activeEditingSessionAssertionExtensionIdentifiers
{
  os_unfair_lock_s *p_assertionLock;
  void *v4;
  void *v5;
  void *v6;

  p_assertionLock = &self->_assertionLock;
  os_unfair_lock_lock(&self->_assertionLock);
  v4 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allKeys](self->_assertionLock_extensionEditingInProgressAssertions, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_assertionLock);
  return v6;
}

- (void)addBehaviorAssertionObserver:(id)a3
{
  id v4;
  NSHashTable *assertionLock_assertionObservers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    os_unfair_lock_lock(&self->_assertionLock);
    assertionLock_assertionObservers = self->_assertionLock_assertionObservers;
    if (!assertionLock_assertionObservers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_assertionLock_assertionObservers;
      self->_assertionLock_assertionObservers = v6;

      assertionLock_assertionObservers = self->_assertionLock_assertionObservers;
    }
    -[NSHashTable addObject:](assertionLock_assertionObservers, "addObject:", v8);
    os_unfair_lock_unlock(&self->_assertionLock);
    v4 = v8;
  }

}

- (void)removeBehaviorAssertionObserver:(id)a3
{
  os_unfair_lock_s *p_assertionLock;
  id v5;

  if (a3)
  {
    p_assertionLock = &self->_assertionLock;
    v5 = a3;
    os_unfair_lock_lock(p_assertionLock);
    -[NSHashTable removeObject:](self->_assertionLock_assertionObservers, "removeObject:", v5);

    os_unfair_lock_unlock(p_assertionLock);
  }
}

- (void)_enumerateAssertionObservers:(id)a3 respondingToSelector:(SEL)a4
{
  id v6;
  void *v7;
  os_unfair_lock_s *p_lock;
  _BOOL4 lock_invalidated;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  SEL v14;

  v6 = a3;
  os_unfair_lock_lock(&self->_assertionLock);
  v7 = (void *)-[NSHashTable copy](self->_assertionLock_assertionObservers, "copy");
  os_unfair_lock_unlock(&self->_assertionLock);
  if (objc_msgSend(v7, "count"))
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    lock_invalidated = self->_lock_invalidated;
    os_unfair_lock_unlock(p_lock);
    if (!lock_invalidated)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFPosterSnapshotManager _enumerateAssertionObservers:respondingToSelector:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __78__PBFPosterSnapshotManager__enumerateAssertionObservers_respondingToSelector___block_invoke;
      v11[3] = &unk_1E86F5328;
      v12 = v7;
      v14 = a4;
      v13 = v6;
      PBFDispatchAsyncWithString(v10, QOS_CLASS_USER_INITIATED, v11);

    }
  }

}

void __78__PBFPosterSnapshotManager__enumerateAssertionObservers_respondingToSelector___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_invalidateExtensionSnapshotterDisabledAssertion:(id)a3 extensionIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  os_unfair_lock_lock(&self->_assertionLock);
  -[NSMutableDictionary objectForKey:](self->_assertionLock_extensionSnapshotterDisabledAssertions, "objectForKey:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v6);

  if (objc_msgSend(v7, "count"))
  {
    os_unfair_lock_unlock(&self->_assertionLock);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_assertionLock_extensionSnapshotterDisabledAssertions, "removeObjectForKey:", v8);
    os_unfair_lock_unlock(&self->_assertionLock);
    -[PBFPosterSnapshotManager _kickoffNextOperation](self, "_kickoffNextOperation");
  }

}

- (void)_invalidateEditingSessionAssertion:(id)a3 extensionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  v7 = a3;
  os_unfair_lock_lock(&self->_assertionLock);
  -[NSMutableDictionary objectForKey:](self->_assertionLock_extensionEditingInProgressAssertions, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v7);

  if (objc_msgSend(v8, "count"))
  {
    os_unfair_lock_unlock(&self->_assertionLock);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_assertionLock_extensionEditingInProgressAssertions, "removeObjectForKey:", v6);
    os_unfair_lock_unlock(&self->_assertionLock);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __83__PBFPosterSnapshotManager__invalidateEditingSessionAssertion_extensionIdentifier___block_invoke;
    v9[3] = &unk_1E86F5300;
    v9[4] = self;
    v10 = v6;
    -[PBFPosterSnapshotManager _enumerateAssertionObservers:respondingToSelector:](self, "_enumerateAssertionObservers:respondingToSelector:", v9, sel_assertionProviderDidRelinquishEditingSessionAssertion_forExtensionIdentifier_);

  }
}

uint64_t __83__PBFPosterSnapshotManager__invalidateEditingSessionAssertion_extensionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assertionProviderDidRelinquishEditingSessionAssertion:forExtensionIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)_snapshotSuspendedExtensionBundleIdentifiers
{
  os_unfair_lock_s *p_assertionLock;
  void *v4;
  void *v5;
  void *v6;

  p_assertionLock = &self->_assertionLock;
  os_unfair_lock_lock(&self->_assertionLock);
  v4 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allKeys](self->_assertionLock_extensionSnapshotterDisabledAssertions, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_assertionLock);
  return v6;
}

- (BOOL)_isExtensionProhibitedFromSnapshotting:(id)a3
{
  PBFPosterSnapshotManager *v3;
  os_unfair_lock_s *p_assertionLock;
  id v5;

  v3 = self;
  p_assertionLock = &self->_assertionLock;
  v5 = a3;
  os_unfair_lock_lock(p_assertionLock);
  LOBYTE(v3) = -[PBFPosterSnapshotManager _assertionLock_isExtensionProhibitedFromSnapshotting:](v3, "_assertionLock_isExtensionProhibitedFromSnapshotting:", v5);

  os_unfair_lock_unlock(p_assertionLock);
  return (char)v3;
}

- (BOOL)_assertionLock_isExtensionProhibitedFromSnapshotting:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKey:](self->_assertionLock_extensionSnapshotterDisabledAssertions, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)_posterBoardPrewarmAssertionWasInvalidated
{
  -[PBFPosterSnapshotManager _teardownPrewarmAssertionIfAppropriate:](self, "_teardownPrewarmAssertionIfAppropriate:", CFSTR("Prewarm Assertion was invalidated."));
}

- (BOOL)_isOperationQueueSuspended
{
  PBFPosterSnapshotManager *v2;
  os_unfair_lock_s *p_assertionLock;

  v2 = self;
  p_assertionLock = &self->_assertionLock;
  os_unfair_lock_lock(&self->_assertionLock);
  LOBYTE(v2) = v2->_assertionLock_isOperationQueueSuspended;
  os_unfair_lock_unlock(p_assertionLock);
  return (char)v2;
}

- (BOOL)_assertionLock_updateOperationQueueSuspended:(BOOL)a3
{
  _BOOL4 assertionLock_isOperationQueueSuspended;

  assertionLock_isOperationQueueSuspended = self->_assertionLock_isOperationQueueSuspended;
  if (assertionLock_isOperationQueueSuspended != a3)
    self->_assertionLock_isOperationQueueSuspended = a3;
  return assertionLock_isOperationQueueSuspended != a3;
}

- (id)posterSnapshotForRequest:(id)a3 definition:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;

  v8 = a3;
  v9 = a4;
  v10 = v8;
  NSClassFromString(CFSTR("PBFPosterSnapshotRequest"));
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager posterSnapshotForRequest:definition:error:].cold.1();
LABEL_22:
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA78028);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PBFPosterSnapshotRequestClass]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager posterSnapshotForRequest:definition:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA7808CLL);
  }

  v11 = v9;
  NSClassFromString(CFSTR("PBFPosterSnapshotDefinition"));
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager posterSnapshotForRequest:definition:error:].cold.2();
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA780F0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PBFPosterSnapshotDefinitionClass]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager posterSnapshotForRequest:definition:error:].cold.2();
    goto LABEL_22;
  }

  if (-[PBFPosterSnapshotManager isSnapshotRequestFulfilled:](self, "isSnapshotRequestFulfilled:", v10))
  {
    objc_msgSend(v10, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterSnapshotManager _snapshotCoordinatorForPath:](self, "_snapshotCoordinatorForPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configuredProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "snapshotReservationForDefinition:configuredProperties:context:", v11, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a5)
      *a5 = objc_retainAutorelease(v17);
    objc_msgSend(v16, "image");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)fetchPosterSnapshotForRequest:(id)a3 definition:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void (**v17)(void *, void *, _QWORD);
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  void (**v28)(void *, void *, _QWORD);
  _QWORD aBlock[4];
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  NSClassFromString(CFSTR("PBFPosterSnapshotRequest"));
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager fetchPosterSnapshotForRequest:definition:completion:].cold.1();
LABEL_22:
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA78408);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PBFPosterSnapshotRequestClass]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager fetchPosterSnapshotForRequest:definition:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA7846CLL);
  }

  v12 = v9;
  NSClassFromString(CFSTR("PBFPosterSnapshotDefinition"));
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager fetchPosterSnapshotForRequest:definition:completion:].cold.2();
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA784D0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PBFPosterSnapshotDefinitionClass]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager fetchPosterSnapshotForRequest:definition:completion:].cold.2();
    goto LABEL_22;
  }

  objc_msgSend(v11, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterSnapshotManager _snapshotCoordinatorForPath:](self, "_snapshotCoordinatorForPath:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__PBFPosterSnapshotManager_fetchPosterSnapshotForRequest_definition_completion___block_invoke;
  aBlock[3] = &unk_1E86F5350;
  v16 = v10;
  v30 = v16;
  v17 = (void (**)(void *, void *, _QWORD))_Block_copy(aBlock);
  if (-[PBFPosterSnapshotManager isSnapshotRequestFulfilled:](self, "isSnapshotRequestFulfilled:", v11))
  {
    objc_msgSend(v11, "configuredProperties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "snapshotReservationForDefinition:configuredProperties:context:", v12, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v17[2](v17, v20, 0);
  }
  else if (v16)
  {
    v24[0] = v15;
    v24[1] = 3221225472;
    v24[2] = __80__PBFPosterSnapshotManager_fetchPosterSnapshotForRequest_definition_completion___block_invoke_2;
    v24[3] = &unk_1E86F5378;
    v25 = v14;
    v26 = v12;
    v27 = v11;
    v28 = v17;
    -[PBFPosterSnapshotManager _enqueueSnapshotForRequestIfNeeded:relativePriority:completion:](self, "_enqueueSnapshotForRequestIfNeeded:relativePriority:completion:", v27, 0, v24);

  }
  else
  {
    -[PBFPosterSnapshotManager _enqueueSnapshotForRequestIfNeeded:relativePriority:completion:](self, "_enqueueSnapshotForRequestIfNeeded:relativePriority:completion:", v11, 0, 0);
  }

}

void __80__PBFPosterSnapshotManager_fetchPosterSnapshotForRequest_definition_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v9, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v5);
    }
    else
    {
      objc_msgSend(v9, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);

    }
  }

}

void __80__PBFPosterSnapshotManager_fetchPosterSnapshotForRequest_definition_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    v4 = 0;
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "configuredProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "displayContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "snapshotReservationForDefinition:configuredProperties:context:", v6, v7, v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)fetchPosterSnapshotsForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  void (**v15)(_QWORD, _QWORD);

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("completion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager fetchPosterSnapshotsForRequest:completion:].cold.1();
LABEL_16:
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA78810);
  }
  v8 = (void (**)(_QWORD, _QWORD))v7;
  v9 = v6;
  NSClassFromString(CFSTR("PBFPosterSnapshotRequest"));
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager fetchPosterSnapshotsForRequest:completion:].cold.2();
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA78874);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PBFPosterSnapshotRequestClass]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager fetchPosterSnapshotsForRequest:completion:].cold.2();
    goto LABEL_16;
  }

  if (-[PBFPosterSnapshotManager isSnapshotRequestFulfilled:](self, "isSnapshotRequestFulfilled:", v9))
  {
    -[PBFPosterSnapshotManager _loadReservationsForDefinitionForRequest:](self, "_loadReservationsForDefinitionForRequest:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v8)[2](v8, v10);

  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __70__PBFPosterSnapshotManager_fetchPosterSnapshotsForRequest_completion___block_invoke;
    v13[3] = &unk_1E86F53A0;
    v13[4] = self;
    v14 = v9;
    v15 = v8;
    -[PBFPosterSnapshotManager _enqueueSnapshotForRequestIfNeeded:relativePriority:completion:](self, "_enqueueSnapshotForRequestIfNeeded:relativePriority:completion:", v14, 0, v13);

  }
}

void __70__PBFPosterSnapshotManager_fetchPosterSnapshotsForRequest_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadReservationsForDefinitionForRequest:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)prewarmSnapshotsForRequests:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  NSObject *v23;
  PBFPosterSnapshotManager *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    v9 = (void *)objc_opt_new();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (-[PBFPosterSnapshotManager isSnapshotRequestFulfilled:](self, "isSnapshotRequestFulfilled:", v15))
          {
            objc_msgSend(v9, "addObject:", v15);
            objc_msgSend(v8, "removeObject:", v15);
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v12);
    }

    -[PBFPosterSnapshotManager prewarmCachesForFulfilledRequests:](self, "prewarmCachesForFulfilledRequests:", v9);
    if (objc_msgSend(v8, "count"))
    {
      v16 = dispatch_group_create();
      dispatch_group_enter(v16);
      v17 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __67__PBFPosterSnapshotManager_prewarmSnapshotsForRequests_completion___block_invoke;
      v22[3] = &unk_1E86F53F0;
      v18 = v16;
      v23 = v18;
      v24 = self;
      v25 = v10;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v22);
      if (v7)
      {
        dispatch_get_global_queue(25, 0);
        v19 = objc_claimAutoreleasedReturnValue();
        v20[0] = v17;
        v20[1] = 3221225472;
        v20[2] = __67__PBFPosterSnapshotManager_prewarmSnapshotsForRequests_completion___block_invoke_3;
        v20[3] = &unk_1E86F5418;
        v21 = v7;
        dispatch_group_notify(v18, v19, v20);

      }
      dispatch_group_leave(v18);

    }
    else if (v7)
    {
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __67__PBFPosterSnapshotManager_prewarmSnapshotsForRequests_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v5 = *(NSObject **)(a1 + 32);
  v6 = a2;
  dispatch_group_enter(v5);
  v7 = *(void **)(a1 + 40);
  v8 = objc_msgSend(*(id *)(a1 + 48), "count") - a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__PBFPosterSnapshotManager_prewarmSnapshotsForRequests_completion___block_invoke_2;
  v9[3] = &unk_1E86F53C8;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v7, "_enqueueSnapshotForRequestIfNeeded:relativePriority:completion:", v6, v8, v9);

}

void __67__PBFPosterSnapshotManager_prewarmSnapshotsForRequests_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __67__PBFPosterSnapshotManager_prewarmSnapshotsForRequests_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = 1;
  -[PBFPosterSnapshotManager _lock_cancelAllRequests](self, "_lock_cancelAllRequests");
  -[PBFPosterSnapshotManager _lock_invalidateAllCompletionHandlers](self, "_lock_invalidateAllCompletionHandlers");
  -[PBFPosterSnapshotManager _lock_teardownPrewarmAssertionIfAppropriate:](self, "_lock_teardownPrewarmAssertionIfAppropriate:", CFSTR("invalidated"));
  os_unfair_lock_unlock(p_lock);
  -[PBFPosterSnapshotManager _teardownBehaviorAssertionsIfAppropriate:](self, "_teardownBehaviorAssertionsIfAppropriate:", CFSTR("invalidated"));
}

- (void)cancelRequests:(id)a3 reason:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "allObjects");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PBFPosterSnapshotManager cancelRequestedSnapshotsForRequests:reason:](self, "cancelRequestedSnapshotsForRequests:reason:", v7, v6);

}

- (void)_lock_invalidateAllCompletionHandlers
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[NSMapTable keyEnumerator](self->_lock_requestToCompletion, "keyEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      objc_msgSend(v3, "addObject:", v6);
      objc_msgSend(v4, "nextObject");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    while (v7);
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[PBFPosterSnapshotManager _lock_fireCompletionsForRequest:snapshotImagesByReservation:error:](self, "_lock_fireCompletionsForRequest:snapshotImagesByReservation:error:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), 0, v8, (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)purgeSnapshotCacheForType:(int64_t)a3
{
  id WeakRetained;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_modelCoordinatorProvider);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__PBFPosterSnapshotManager_purgeSnapshotCacheForType___block_invoke;
  v5[3] = &__block_descriptor_40_e69_v32__0__PBFPosterSnapshotCoordinator_8__PFServerPosterIdentity_16_B24l;
  v5[4] = a3;
  objc_msgSend(WeakRetained, "pbf_enumerateSnapshotCoordinators:", v5);

}

void __54__PBFPosterSnapshotManager_purgeSnapshotCacheForType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "type") == *(_QWORD *)(a1 + 32))
    objc_msgSend(v5, "cancel");

}

- (void)prewarmCachesForFulfilledRequests:(id)a3
{
  id v5;
  id WeakRetained;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_modelCoordinatorProvider);
  if (WeakRetained)
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__PBFPosterSnapshotManager_prewarmCachesForFulfilledRequests___block_invoke;
    v8[3] = &unk_1E86F2540;
    v9 = v5;
    v10 = WeakRetained;
    PBFDispatchAsyncWithString(v7, QOS_CLASS_USER_INITIATED, v8);

  }
}

void __62__PBFPosterSnapshotManager_prewarmCachesForFulfilledRequests___block_invoke(uint64_t a1)
{
  uint64_t i;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id obj;
  uint64_t v18;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = *(id *)(a1 + 32);
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v20)
  {
    v18 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(obj);
        v2 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v3 = *(void **)(a1 + 40);
        objc_msgSend(v2, "path");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "identity");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "pbf_posterSnapshotCoordinatorForIdentity:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v2, "definitions");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v22;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v22 != v10)
                objc_enumerationMutation(v7);
              v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j);
              objc_msgSend(v2, "configuredProperties");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v2, "displayContext");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "snapshotReservationForDefinition:configuredProperties:context:", v12, v13, v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = (id)objc_msgSend(v15, "image");

            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v9);
        }

      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v20);
  }

}

- (BOOL)cancelRequestedSnapshotsForExtensionBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager cancelRequestedSnapshotsForExtensionBundleIdentifier:].cold.1();
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA79434);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager cancelRequestedSnapshotsForExtensionBundleIdentifier:].cold.1();
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA79498);
  }

  os_unfair_lock_lock(&self->_lock);
  -[PBFPosterSnapshotManager _lock_snapshottersForExtensionBundleIdentifier:](self, "_lock_snapshottersForExtensionBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  v8 = v7;
  if (v7)
  {
    v9 = *(_QWORD *)v16;
    v10 = v7;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        -[PBFPosterSnapshotManager _lock_cancelSnapshotter:reason:](self, "_lock_cancelSnapshotter:reason:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11++), CFSTR("cancelRequestedSnapshotsForExtensionBundleIdentifier:"));
      }
      while (v10 != v11);
      v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  os_unfair_lock_unlock(&self->_lock);
  return v8 != 0;
}

- (BOOL)cancelRequestedSnapshotsForRequests:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  PBFPosterSnapshotManager *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  os_unfair_lock_t lock;
  void *v42;
  id obj;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v54 = a4;
  v42 = v6;
  if (objc_msgSend(v6, "count"))
  {
    lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v46 = (void *)objc_opt_new();
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v72 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
          objc_msgSend(v12, "provider", lock, v42);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[PBFPriorityQueue numberOfEnqueuedUpItemsForIdentifier:](self->_lock_priorityQueue, "numberOfEnqueuedUpItemsForIdentifier:", v13);
          if (v14 | -[PBFPriorityQueue numberOfActiveItemForIdentifier:](self->_lock_priorityQueue, "numberOfActiveItemForIdentifier:", v13))
          {
            objc_msgSend(v46, "objectForKey:", v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v15)
            {
              v15 = (void *)objc_opt_new();
              objc_msgSend(v46, "setObject:forKey:", v15, v13);
            }
            objc_msgSend(v15, "addObject:", v12);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
      }
      while (v9);
    }

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    objc_msgSend(v46, "keyEnumerator");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
    v16 = 0;
    if (v45)
    {
      v44 = *(_QWORD *)v68;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v68 != v44)
            objc_enumerationMutation(obj);
          v47 = v17;
          v53 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * v17);
          objc_msgSend(v46, "objectForKey:", lock);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          v48 = v18;
          v50 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
          if (v50)
          {
            v49 = *(_QWORD *)v64;
            do
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v64 != v49)
                  objc_enumerationMutation(v48);
                v52 = v19;
                v20 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * v19);
                -[PBFPriorityQueue enqueuedItemsForIdentifier:](self->_lock_priorityQueue, "enqueuedItemsForIdentifier:", v53);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v59 = 0u;
                v60 = 0u;
                v61 = 0u;
                v62 = 0u;
                v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v59, v76, 16);
                if (v22)
                {
                  v23 = v22;
                  v24 = *(_QWORD *)v60;
                  do
                  {
                    for (j = 0; j != v23; ++j)
                    {
                      if (*(_QWORD *)v60 != v24)
                        objc_enumerationMutation(v21);
                      v26 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
                      objc_msgSend(v26, "request");
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      v28 = objc_msgSend(v27, "isEqual:", v20);

                      if (v28)
                      {
                        objc_msgSend(v26, "snapshotter");
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        -[PBFPosterSnapshotManager _lock_cancelSnapshotter:reason:](self, "_lock_cancelSnapshotter:reason:", v29, v54);

                        v16 = 1;
                      }
                    }
                    v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v59, v76, 16);
                  }
                  while (v23);
                }
                v51 = v21;
                v30 = self;
                -[PBFPriorityQueue activeItemsForIdentifier:](self->_lock_priorityQueue, "activeItemsForIdentifier:", v53);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v55 = 0u;
                v56 = 0u;
                v57 = 0u;
                v58 = 0u;
                v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v55, v75, 16);
                if (v32)
                {
                  v33 = v32;
                  v34 = *(_QWORD *)v56;
                  do
                  {
                    for (k = 0; k != v33; ++k)
                    {
                      if (*(_QWORD *)v56 != v34)
                        objc_enumerationMutation(v31);
                      v36 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * k);
                      objc_msgSend(v36, "request");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      v38 = objc_msgSend(v37, "isEqual:", v20);

                      if (v38)
                      {
                        objc_msgSend(v36, "snapshotter");
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        -[PBFPosterSnapshotManager _lock_cancelSnapshotter:reason:](v30, "_lock_cancelSnapshotter:reason:", v39, v54);

                        v16 = 1;
                      }
                    }
                    v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v55, v75, 16);
                  }
                  while (v33);
                }

                v19 = v52 + 1;
                self = v30;
              }
              while (v52 + 1 != v50);
              v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
            }
            while (v50);
          }

          v17 = v47 + 1;
        }
        while (v47 + 1 != v45);
        v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
      }
      while (v45);
    }

    os_unfair_lock_unlock(lock);
  }
  else
  {
    v16 = 0;
  }

  return v16 & 1;
}

- (BOOL)cancelRequestedSnapshotsForIdentity:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v17;
  void *v18;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("identity"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotManager cancelRequestedSnapshotsForIdentity:].cold.1();
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA79B98);
  }
  v5 = v4;
  objc_msgSend(v4, "provider");
  v6 = objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  v18 = (void *)v6;
  -[PBFPosterSnapshotManager _lock_snapshottersForExtensionBundleIdentifier:](self, "_lock_snapshottersForExtensionBundleIdentifier:", v6);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v19 = 0;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v12, "serverPosterPath");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identity");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", v5);

        if (v15)
        {
          -[PBFPosterSnapshotManager _lock_cancelSnapshotter:reason:](self, "_lock_cancelSnapshotter:reason:", v12, CFSTR("cancelRequestedSnapshotsForIdentity:"));
          v19 = 1;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }
  else
  {
    v19 = 0;
  }
  os_unfair_lock_unlock(&self->_lock);

  return v19 & 1;
}

- (BOOL)areSnapshotsFullyPrepared:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (!-[PBFPosterSnapshotManager isSnapshotRequestFulfilled:](self, "isSnapshotRequestFulfilled:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)isSnapshotRequestFulfilled:(id)a3
{
  id v4;
  PBFModelCoordinatorProviding **p_modelCoordinatorProvider;
  id WeakRetained;
  BOOL v7;
  id v8;

  v4 = a3;
  p_modelCoordinatorProvider = &self->_modelCoordinatorProvider;
  WeakRetained = objc_loadWeakRetained((id *)p_modelCoordinatorProvider);

  v7 = 0;
  if (v4 && WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)p_modelCoordinatorProvider);
    v7 = +[PBFPosterSnapshotRequest isRequestFulfilled:modelCoordinatorProvider:](PBFPosterSnapshotRequest, "isRequestFulfilled:modelCoordinatorProvider:", v4, v8);

  }
  return v7;
}

- (BOOL)_isRequestValid:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D7FC90];
  objc_msgSend(a3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "role");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "snapshottingSupportedForRole:", v7);

  if (a4 && (v8 & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2D68];
    v13[0] = CFSTR("PBFPosterSnapshotManager only supports PFPosterRoleLockScreen currently.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pbf_generalErrorWithCode:userInfo:", 1, v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)cancelAllRequests
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PBFPosterSnapshotManager _lock_cancelAllRequests](self, "_lock_cancelAllRequests");
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_cancelAllRequests
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[PBFPriorityQueue enqueuedIdentifiers](self->_lock_priorityQueue, "enqueuedIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(v3);
        -[PBFPriorityQueue enqueuedItemsForIdentifier:](self->_lock_priorityQueue, "enqueuedItemsForIdentifier:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "makeObjectsPerformSelector:", sel_cancel);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v5);
  }

  -[PBFPriorityQueue removeAllEnqueuedItems](self->_lock_priorityQueue, "removeAllEnqueuedItems");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[PBFPriorityQueue activeIdentifiers](self->_lock_priorityQueue, "activeIdentifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        -[PBFPriorityQueue activeItemsForIdentifier:](self->_lock_priorityQueue, "activeItemsForIdentifier:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v22;
          do
          {
            for (k = 0; k != v16; ++k)
            {
              if (*(_QWORD *)v22 != v17)
                objc_enumerationMutation(v14);
              objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * k), "snapshotter");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[PBFPosterSnapshotManager _lock_cancelSnapshotter:reason:](self, "_lock_cancelSnapshotter:reason:", v19, CFSTR("cancelAllRequests"));

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
          }
          while (v16);
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v10);
  }

  -[PBFPriorityQueue removeAllActiveItems](self->_lock_priorityQueue, "removeAllActiveItems");
}

- (void)duplicateSnapshotsFromPath:(id)a3 to:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[PBFPosterSnapshotManager _snapshotCoordinatorForPath:](self, "_snapshotCoordinatorForPath:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PBFPosterSnapshotManager _snapshotCoordinatorForPath:](self, "_snapshotCoordinatorForPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "ingestSnapshotsFromCoordinator:", v8);
}

- (BOOL)_lock_cancelSnapshotter:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  PBFPriorityQueue *lock_priorityQueue;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  BOOL v22;
  BOOL v23;
  void *v24;
  uint64_t v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "provider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  lock_priorityQueue = self->_lock_priorityQueue;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __59__PBFPosterSnapshotManager__lock_cancelSnapshotter_reason___block_invoke;
  v33[3] = &unk_1E86F5460;
  v11 = v6;
  v34 = v11;
  -[PBFPriorityQueue firstActiveItemForIdentifier:passingTest:](lock_priorityQueue, "firstActiveItemForIdentifier:passingTest:", v9, v33);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v7;
  if (v12)
  {
    objc_msgSend(v11, "cancelWithReason:", v7);
    objc_msgSend(v11, "error");
    v26 = objc_claimAutoreleasedReturnValue();
    -[PBFPriorityQueue removeActiveItem:forIdentifier:](self->_lock_priorityQueue, "removeActiveItem:forIdentifier:", v12, v9);
  }
  else
  {
    v26 = 0;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[PBFPriorityQueue enqueuedItemsForIdentifier:](self->_lock_priorityQueue, "enqueuedItemsForIdentifier:", v9, v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
LABEL_6:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v17);
      objc_msgSend(v18, "snapshotter");
      v19 = (id)objc_claimAutoreleasedReturnValue();

      if (v19 == v11)
        break;
      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
        if (v15)
          goto LABEL_6;
        goto LABEL_12;
      }
    }
    v20 = v28;
    objc_msgSend(v11, "cancelWithReason:", v28);
    objc_msgSend(v11, "error");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = -[PBFPriorityQueue removeEnqueuedItem:forIdentifier:](self->_lock_priorityQueue, "removeEnqueuedItem:forIdentifier:", v18, v9);
    if (!v12 && !v22)
    {
      v23 = 0;
      goto LABEL_19;
    }
  }
  else
  {
LABEL_12:

    if (!v12)
    {
      v23 = 0;
      v21 = v27;
      v20 = v28;
      goto LABEL_19;
    }
    v21 = v27;
    v20 = v28;
  }
  objc_msgSend(v11, "request");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterSnapshotManager _lock_fireCompletionsForRequest:snapshotImagesByReservation:error:](self, "_lock_fireCompletionsForRequest:snapshotImagesByReservation:error:", v24, 0, v21);

  v23 = 1;
LABEL_19:

  return v23;
}

BOOL __59__PBFPosterSnapshotManager__lock_cancelSnapshotter_reason___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "snapshotter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (id)_snapshotCoordinatorForPath:(id)a3
{
  PBFModelCoordinatorProviding **p_modelCoordinatorProvider;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;

  p_modelCoordinatorProvider = &self->_modelCoordinatorProvider;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_modelCoordinatorProvider);
  objc_msgSend(v4, "serverIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "pbf_posterSnapshotCoordinatorForIdentity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_loadReservationsForDefinitionForRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int *v20;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[4];
  int v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "path");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v3, "definitions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "configuredProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v25;
    v20 = &v29;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (!v11)
        {
          -[PBFPosterSnapshotManager _snapshotCoordinatorForPath:](self, "_snapshotCoordinatorForPath:", v22);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v3, "displayContext", v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "snapshotReservationForDefinition:configuredProperties:context:", v14, v7, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v16, "isValid"))
        {
          objc_msgSend(v23, "setObject:forKey:", v16, v14);
        }
        else
        {
          objc_msgSend(v16, "error");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            PBFLogSnapshotter();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              -[PBFPosterSnapshotManager _loadReservationsForDefinitionForRequest:].cold.1(v28, v16, v20, v18);

          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  return v23;
}

- (void)_enqueueSnapshotForRequestIfNeeded:(id)a3 relativePriority:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  BOOL v10;
  id v11;
  void *v12;
  os_unfair_lock_s *p_lock;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a5;
  v22 = 0;
  v10 = -[PBFPosterSnapshotManager _isRequestValid:error:](self, "_isRequestValid:error:", v8, &v22);
  v11 = v22;
  if (v10)
  {
    if (-[PBFPosterSnapshotManager isSnapshotRequestFulfilled:](self, "isSnapshotRequestFulfilled:", v8))
    {
      if (v9)
      {
        -[PBFPosterSnapshotManager _loadReservationsForDefinitionForRequest:](self, "_loadReservationsForDefinitionForRequest:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, v12, 0);

      }
      goto LABEL_21;
    }
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_lock_invalidated)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    v21 = 0;
    -[PBFPosterSnapshotManager _lock_snapshotterForRequest:requestContainingRequest:](self, "_lock_snapshotterForRequest:requestContainingRequest:", v8, &v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v21;

    if (v15)
    {
      if (v9)
      {
        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("requestContainingRequest != nil"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[PBFPosterSnapshotManager _enqueueSnapshotForRequestIfNeeded:relativePriority:completion:].cold.1();
          objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1CBA7A9B8);
        }
        -[PBFPosterSnapshotManager _lock_addCompletion:forRequest:](self, "_lock_addCompletion:forRequest:", v9, v16);
      }
    }
    else
    {
      if (!PUIFeatureEnabled())
      {
        -[PBFPosterSnapshotManager _lock_buildSnapshotterForRequest:attemptNumber:](self, "_lock_buildSnapshotterForRequest:attemptNumber:", v8, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          -[PBFPosterSnapshotManager _lock_enqueueSnapshotter:forRequest:attempt:relativePriority:completion:](self, "_lock_enqueueSnapshotter:forRequest:attempt:relativePriority:completion:", v17, v8, 0, a4, v9);
          v14 = 0;
        }
        else
        {
          v18 = (void *)MEMORY[0x1E0CB35C8];
          v23 = *MEMORY[0x1E0CB2D68];
          v24[0] = CFSTR("Unable to build snapshotter for request; check extension provider?");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v19);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_16;
      }
      -[PBFPosterSnapshotManager _lock_submitSBRendererRequestForRequest:relativePriority:completion:](self, "_lock_submitSBRendererRequestForRequest:relativePriority:completion:", v8, a4, v9);
    }
    v14 = 0;
LABEL_16:

LABEL_17:
    os_unfair_lock_unlock(p_lock);
    if (v9 && v14)
      ((void (**)(id, void *, void *))v9)[2](v9, 0, v14);

    goto LABEL_21;
  }
  if (v9)
    ((void (**)(id, void *, id))v9)[2](v9, 0, v11);
LABEL_21:

}

- (void)_lock_submitSBRendererRequestForRequest:(id)a3 relativePriority:(unint64_t)a4 completion:(id)a5
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  PRUISSnapshotService *snapshotService;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v27;
  _QWORD block[4];
  id v29;
  PBFPosterSnapshotManager *v30;
  _QWORD *v31;
  _BYTE *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint64_t v36;
  NSObject *v37;
  _QWORD *v38;
  _QWORD *v39;
  _BYTE *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  id v46;
  _QWORD v47[4];
  int v48;
  uint8_t v49[4];
  id v50;
  __int16 v51;
  void *v52;
  uint8_t v53[128];
  _BYTE buf[24];
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v25 = a5;
  v27 = v6;
  objc_msgSend(v6, "buildPUIPosterSnapshotRequestsForOutput:priority:timeout:", 2, 0, 30.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PBFLogSnapshotter();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v7, "count");
    objc_msgSend(v6, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134349314;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_1CB9FA000, v8, OS_LOG_TYPE_DEFAULT, "Submitting %{public}lu snapshotService requests for path: %{public}@", buf, 0x16u);

  }
  if (v25)
    -[PBFPosterSnapshotManager _lock_addCompletion:forRequest:](self, "_lock_addCompletion:forRequest:", v25, v6);
  v11 = dispatch_group_create();
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2810000000;
  v47[3] = &unk_1CBBCDE9F;
  v48 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v55 = __Block_byref_object_copy__6;
  v56 = __Block_byref_object_dispose__6;
  v57 = (id)objc_opt_new();
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__6;
  v45[4] = __Block_byref_object_dispose__6;
  v46 = 0;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v42 != v14)
          objc_enumerationMutation(v12);
        v16 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v11);
        PBFLogSnapshotter();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v17, "uniqueIdentifier");
          v19 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "path");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v49 = 138543618;
          v50 = v19;
          v51 = 2114;
          v52 = v20;
          _os_log_impl(&dword_1CB9FA000, v18, OS_LOG_TYPE_DEFAULT, "Submitting snapshotService request %{public}@ for path: %{public}@", v49, 0x16u);

        }
        snapshotService = self->_snapshotService;
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __96__PBFPosterSnapshotManager__lock_submitSBRendererRequestForRequest_relativePriority_completion___block_invoke;
        v33[3] = &unk_1E86F5488;
        v38 = v47;
        v22 = v17;
        v34 = v22;
        v23 = v27;
        v39 = v45;
        v40 = buf;
        v35 = v23;
        v36 = v16;
        v37 = v11;
        -[PRUISSnapshotService executeSnapshotRequest:completion:](snapshotService, "executeSnapshotRequest:completion:", v22, v33);

      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    }
    while (v13);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__PBFPosterSnapshotManager__lock_submitSBRendererRequestForRequest_relativePriority_completion___block_invoke_218;
  block[3] = &unk_1E86F4368;
  v29 = v27;
  v30 = self;
  v31 = v45;
  v32 = buf;
  v24 = v27;
  dispatch_group_notify(v11, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v47, 8);
}

void __96__PBFPosterSnapshotManager__lock_submitSBRendererRequestForRequest_relativePriority_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32));
  PBFLogSnapshotter();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "executionTime");
      v11 = v10;
      objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 134349570;
      v18 = v11;
      v19 = 2114;
      v20 = v12;
      v21 = 2114;
      v22 = v13;
      _os_log_impl(&dword_1CB9FA000, v9, OS_LOG_TYPE_DEFAULT, "snapshotService response (%{public}f seconds) for request %{public}@ path: %{public}@", (uint8_t *)&v17, 0x20u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setObject:forKey:", v6, *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __96__PBFPosterSnapshotManager__lock_submitSBRendererRequestForRequest_relativePriority_completion___block_invoke_cold_2(a1);

    v14 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pui_errorWithCode:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v14);
    if (!v7)

  }
  objc_msgSend(v6, "executionTime");
  if (v15 > 11.0)
  {
    PBFLogSnapshotter();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __96__PBFPosterSnapshotManager__lock_submitSBRendererRequestForRequest_relativePriority_completion___block_invoke_cold_1(v6, a1);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

uint64_t __96__PBFPosterSnapshotManager__lock_submitSBRendererRequestForRequest_relativePriority_completion___block_invoke_218(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  PBFLogSnapshotter();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __96__PBFPosterSnapshotManager__lock_submitSBRendererRequestForRequest_relativePriority_completion___block_invoke_218_cold_1(a1);

    return objc_msgSend(*(id *)(a1 + 40), "_failRequest:withError:shouldReEnqueue:attempt:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 0, 0);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "path");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1CB9FA000, v4, OS_LOG_TYPE_DEFAULT, "SUCCESS: Received all snapshotService responses for path: %{public}@", (uint8_t *)&v7, 0xCu);

    }
    return objc_msgSend(*(id *)(a1 + 40), "_ingestSnapshotServiceResult:forRequest:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 32));
  }
}

- (void)_operationDidComplete:(id)a3 snapshotter:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  _BOOL4 v11;
  char v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[PBFPosterSnapshotManager _lock_cleanupAfterOperation:](self, "_lock_cleanupAfterOperation:", v14);
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v6, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", PBFGeneralErrorDomain))
    v9 = objc_msgSend(v7, "code") == 4;
  else
    v9 = 0;

  objc_msgSend(v7, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", PBFGeneralErrorDomain))
    v11 = objc_msgSend(v7, "code") == 3;
  else
    v11 = 0;

  if (v7)
    v12 = 1;
  else
    v12 = v9;
  if ((v12 & 1) != 0 || v11)
  {
    objc_msgSend(v14, "request");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterSnapshotManager _failRequest:withError:shouldReEnqueue:attempt:](self, "_failRequest:withError:shouldReEnqueue:attempt:", v13, v7, !v9 && !v11, objc_msgSend(v14, "attempt"));
  }
  else
  {
    objc_msgSend(v14, "snapshotter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterSnapshotManager _ingestResultsFromSnapshotter:](self, "_ingestResultsFromSnapshotter:", v13);
  }

}

- (void)_failRequest:(id)a3 withError:(id)a4 shouldReEnqueue:(BOOL)a5 attempt:(unint64_t)a6
{
  _BOOL4 v7;
  id v10;
  int64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v7 = a5;
  v14 = a3;
  v10 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (!v7)
  {
    v13 = 0;
LABEL_6:
    -[PBFPosterSnapshotManager _lock_fireCompletionsForRequest:snapshotImagesByReservation:error:](self, "_lock_fireCompletionsForRequest:snapshotImagesByReservation:error:", v14, 0, v10);
    goto LABEL_7;
  }
  v11 = a6 + 1;
  -[PBFPosterSnapshotManager _lock_buildSnapshotterForRequest:attemptNumber:](self, "_lock_buildSnapshotterForRequest:attemptNumber:", v14, a6 + 1);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v11 > 2 || !v12)
    goto LABEL_6;
  -[PBFPosterSnapshotManager _lock_enqueueSnapshotter:forRequest:attempt:relativePriority:completion:](self, "_lock_enqueueSnapshotter:forRequest:attempt:relativePriority:completion:", v12, v14, v11, 0, 0);
LABEL_7:
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_ingestSnapshotServiceResult:(id)a3 forRequest:(id)a4
{
  id v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v24 = a4;
  v23 = (void *)objc_opt_new();
  v22 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v5;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v25)
  {
    v21 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(obj, "objectForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "snapshotBundle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[PBFPosterSnapshotDefinition snapshotOptionsForDefinition:](PBFPosterSnapshotDefinition, "snapshotOptionsForDefinition:", v7);
        PRSPosterSnapshotOptionsIsFloatingLayerOnly();
        objc_msgSend(v9, "bundleURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        PUIPosterSnapshotBundleURLForComponent();
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v24, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "configuredProperties");
        v14 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "displayContext");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "pbf_snapshotURLForPath:definition:configuredProperties:context:", v13, v7, v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "removeItemAtURL:error:", v16, 0);
        v27 = 0;
        LOBYTE(v14) = objc_msgSend(v22, "copyItemAtURL:toURL:error:", v11, v16, &v27);
        v17 = v27;
        PBFLogSnapshotter();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if ((v14 & 1) != 0)
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v33 = v11;
            v34 = 2112;
            v35 = v16;
            _os_log_impl(&dword_1CB9FA000, v19, OS_LOG_TYPE_DEFAULT, "Successfully copied %@ to %@", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v33 = v17;
          v34 = 2112;
          v35 = v11;
          v36 = 2112;
          v37 = v16;
          _os_log_error_impl(&dword_1CB9FA000, v19, OS_LOG_TYPE_ERROR, "Snapshot copy failed (%@) to copy from %@ to %@", buf, 0x20u);
        }

        objc_msgSend(v23, "setObject:forKey:", v16, v7);
      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v25);
  }

  os_unfair_lock_lock(&self->_lock);
  -[PBFPosterSnapshotManager _lock_ingestSnapshotsByDefinition:forRequest:](self, "_lock_ingestSnapshotsByDefinition:forRequest:", v23, v24);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_ingestResultsFromSnapshotter:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  id v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend(v5, "snapshotsByDefinition");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PBFPosterSnapshotManager _lock_ingestSnapshotsByDefinition:forRequest:](self, "_lock_ingestSnapshotsByDefinition:forRequest:", v7, v6);
  os_unfair_lock_unlock(p_lock);

}

- (void)_lock_ingestSnapshotsByDefinition:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;

  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_modelCoordinatorProvider);
  objc_msgSend(v6, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serverIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "pbf_posterSnapshotCoordinatorForIdentity:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "configuredProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ingestSnapshotsByDefinition:path:configuredProperties:context:", v7, v13, v12, v14);

  v15 = (void *)objc_opt_new();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __73__PBFPosterSnapshotManager__lock_ingestSnapshotsByDefinition_forRequest___block_invoke;
  v20[3] = &unk_1E86F54B0;
  v21 = v11;
  v22 = v12;
  v23 = v6;
  v24 = v15;
  v16 = v15;
  v17 = v6;
  v18 = v12;
  v19 = v11;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v20);

  -[PBFPosterSnapshotManager _lock_fireCompletionsForRequest:snapshotImagesByReservation:error:](self, "_lock_fireCompletionsForRequest:snapshotImagesByReservation:error:", v17, v16, 0);
}

void __73__PBFPosterSnapshotManager__lock_ingestSnapshotsByDefinition_forRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "displayContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshotReservationForDefinition:configuredProperties:context:", v7, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v6, v7);

}

- (void)_lock_addCompletion:(id)a3 forRequest:(id)a4
{
  id v6;
  NSMapTable *lock_requestToCompletion;
  id v8;
  void *v9;
  PBFPosterSnapshotFetchCompletionHandler *v10;
  id v11;

  v6 = a4;
  if (a3 && v6)
  {
    lock_requestToCompletion = self->_lock_requestToCompletion;
    v11 = v6;
    v8 = a3;
    -[NSMapTable objectForKey:](lock_requestToCompletion, "objectForKey:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PBFPosterSnapshotFetchCompletionHandler initWithRequest:completionHandler:]([PBFPosterSnapshotFetchCompletionHandler alloc], "initWithRequest:completionHandler:", v11, v8);

    if (v9)
    {
      objc_msgSend(v9, "addObject:", v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](self->_lock_requestToCompletion, "setObject:forKey:", v9, v11);
    }

    v6 = v11;
  }

}

- (void)_lock_fireCompletionsForRequest:(id)a3 snapshotImagesByReservation:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  dispatch_qos_class_t v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NSMapTable objectForKey:](self->_lock_requestToCompletion, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterSnapshotManager _lock_cleanupAfterRequest:](self, "_lock_cleanupAfterRequest:", v8);
  if (objc_msgSend(v11, "count"))
  {
    v12 = PBFDispatchQualityOfServiceFromPBFPosterSnapshotRequestIntention(objc_msgSend(v8, "intention"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFPosterSnapshotManager _lock_fireCompletionsForRequest:snapshotImagesByReservation:error:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __94__PBFPosterSnapshotManager__lock_fireCompletionsForRequest_snapshotImagesByReservation_error___block_invoke;
    v15[3] = &unk_1E86F3130;
    v16 = v11;
    v17 = v10;
    v18 = v9;
    PBFDispatchAsyncWithString(v13, v12, v15);

  }
  objc_msgSend(v8, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterSnapshotManager _lock_fireDidUpdateSnapshotForPath:snapshotImagesByReservation:](self, "_lock_fireDidUpdateSnapshotForPath:snapshotImagesByReservation:", v14, v9);

}

void __94__PBFPosterSnapshotManager__lock_fireCompletionsForRequest_snapshotImagesByReservation_error___block_invoke(uint64_t a1)
{
  id v2;
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
  v2 = *(id *)(a1 + 32);
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
        if (*(_QWORD *)(a1 + 40))
          objc_msgSend(v7, "finishWithError:");
        else
          objc_msgSend(v7, "finishWithSuccess:", *(_QWORD *)(a1 + 48), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_lock_fireDidUpdateSnapshotForPath:(id)a3 snapshotImagesByReservation:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  PBFPosterSnapshotManager *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __91__PBFPosterSnapshotManager__lock_fireDidUpdateSnapshotForPath_snapshotImagesByReservation___block_invoke;
  v10[3] = &unk_1E86F54D8;
  v11 = v7;
  v12 = self;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  -[PBFPosterSnapshotManager _lock_enumerateObservers:](self, "_lock_enumerateObservers:", v10);

}

void __91__PBFPosterSnapshotManager__lock_fireDidUpdateSnapshotForPath_snapshotImagesByReservation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "error");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
            objc_msgSend(v3, "snapshotManager:didUpdateSnapshotForPath:forDefinition:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v9);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
}

- (void)_lock_cleanupAfterRequest:(id)a3
{
  id v4;
  PBFPriorityQueue *lock_priorityQueue;
  uint64_t v6;
  id v7;
  void *v8;
  PBFPriorityQueue *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  -[NSMapTable removeObjectForKey:](self->_lock_requestToCompletion, "removeObjectForKey:", v4);
  objc_msgSend(v4, "provider");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  lock_priorityQueue = self->_lock_priorityQueue;
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__PBFPosterSnapshotManager__lock_cleanupAfterRequest___block_invoke;
  v15[3] = &unk_1E86F5460;
  v7 = v4;
  v16 = v7;
  -[PBFPriorityQueue firstActiveItemForIdentifier:passingTest:](lock_priorityQueue, "firstActiveItemForIdentifier:passingTest:", v12, v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[PBFPriorityQueue removeActiveItem:forIdentifier:](self->_lock_priorityQueue, "removeActiveItem:forIdentifier:", v8, v12);
  v9 = self->_lock_priorityQueue;
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __54__PBFPosterSnapshotManager__lock_cleanupAfterRequest___block_invoke_2;
  v13[3] = &unk_1E86F5500;
  v14 = v7;
  v10 = v7;
  v11 = -[PBFPriorityQueue filterEnqueuedItemForIdentifier:passingTest:](v9, "filterEnqueuedItemForIdentifier:passingTest:", v12, v13);
  -[PBFPosterSnapshotManager _lock_kickoffNextOperation](self, "_lock_kickoffNextOperation");
  -[PBFPosterSnapshotManager _lock_teardownPrewarmAssertionIfAppropriate:](self, "_lock_teardownPrewarmAssertionIfAppropriate:", CFSTR("Cleanup after request"));

}

uint64_t __54__PBFPosterSnapshotManager__lock_cleanupAfterRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __54__PBFPosterSnapshotManager__lock_cleanupAfterRequest___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_lock_cleanupAfterOperation:(id)a3
{
  id v4;
  void *v5;
  PBFPriorityQueue *lock_priorityQueue;
  uint64_t v7;
  id v8;
  id v9;
  PBFPriorityQueue *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  objc_msgSend(v4, "request");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  lock_priorityQueue = self->_lock_priorityQueue;
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__PBFPosterSnapshotManager__lock_cleanupAfterOperation___block_invoke;
  v16[3] = &unk_1E86F5460;
  v8 = v4;
  v17 = v8;
  -[PBFPriorityQueue firstActiveItemForIdentifier:passingTest:](lock_priorityQueue, "firstActiveItemForIdentifier:passingTest:", v5, v16);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 == v8)
    -[PBFPriorityQueue removeActiveItem:forIdentifier:](self->_lock_priorityQueue, "removeActiveItem:forIdentifier:", v8, v5);
  v10 = self->_lock_priorityQueue;
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __56__PBFPosterSnapshotManager__lock_cleanupAfterOperation___block_invoke_2;
  v14[3] = &unk_1E86F5460;
  v15 = v8;
  v11 = v8;
  v12 = -[PBFPriorityQueue filterEnqueuedItemForIdentifier:passingTest:](v10, "filterEnqueuedItemForIdentifier:passingTest:", v5, v14);
  -[PBFPosterSnapshotManager _lock_kickoffNextOperation](self, "_lock_kickoffNextOperation");
  -[PBFPosterSnapshotManager _lock_teardownPrewarmAssertionIfAppropriate:](self, "_lock_teardownPrewarmAssertionIfAppropriate:", CFSTR("Cleanup after operation"));

}

BOOL __56__PBFPosterSnapshotManager__lock_cleanupAfterOperation___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

BOOL __56__PBFPosterSnapshotManager__lock_cleanupAfterOperation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

- (id)_lock_snapshotterForRequest:(id)a3 requestContainingRequest:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__6;
  v26 = __Block_byref_object_dispose__6;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__6;
  v20 = __Block_byref_object_dispose__6;
  v21 = 0;
  objc_msgSend(v6, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterSnapshotManager _lock_snapshottersForExtensionBundleIdentifier:](self, "_lock_snapshottersForExtensionBundleIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__PBFPosterSnapshotManager__lock_snapshotterForRequest_requestContainingRequest___block_invoke;
  v12[3] = &unk_1E86F5528;
  v9 = v6;
  v13 = v9;
  v14 = &v16;
  v15 = &v22;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);
  if (a4)
    *a4 = objc_retainAutorelease((id)v17[5]);
  v10 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __81__PBFPosterSnapshotManager__lock_snapshotterForRequest_requestContainingRequest___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "containsRequest:", a1[4]))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v7);
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)_lock_snapshottersForExtensionBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[PBFPriorityQueue enqueuedItemsForIdentifier:](self->_lock_priorityQueue, "enqueuedItemsForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  -[PBFPriorityQueue activeItemsForIdentifier:](self->_lock_priorityQueue, "activeItemsForIdentifier:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bs_mapNoNulls:", &__block_literal_global_233);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v10);

  return v5;
}

uint64_t __75__PBFPosterSnapshotManager__lock_snapshottersForExtensionBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "snapshotter");
}

uint64_t __75__PBFPosterSnapshotManager__lock_snapshottersForExtensionBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "snapshotter");
}

- (void)_lock_enqueueSnapshotter:(id)a3 forRequest:(id)a4 attempt:(int64_t)a5 relativePriority:(unint64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PBFPosterSnapshotterOperation *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  BOOL v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id from;
  id location;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD))v14;
  if (a5 < 4)
  {
    if (self->_lock_invalidated)
    {
      if (v14)
      {
        v19 = (void *)MEMORY[0x1E0CB35C8];
        v42 = *MEMORY[0x1E0CB2D68];
        v43 = CFSTR("snapshot manager was invalidated");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "pbf_generalErrorWithCode:userInfo:", 3, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v15)[2](v15, 0, v21);

      }
    }
    else
    {
      -[PBFPosterSnapshotManager _lock_acquirePrewarmAssertionIfNeeded:](self, "_lock_acquirePrewarmAssertionIfNeeded:", 1);
      location = 0;
      v22 = -[PBFPosterSnapshotterOperation initWithRequest:snapshotter:]([PBFPosterSnapshotterOperation alloc], "initWithRequest:snapshotter:", v13, v12);
      objc_storeWeak(&location, v22);
      -[PBFPosterSnapshotterOperation setMaxNumberOfAttempts:](v22, "setMaxNumberOfAttempts:", 3);
      -[PBFPosterSnapshotterOperation setAttempt:](v22, "setAttempt:", a5);
      if ((objc_msgSend(v12, "necessitatesExtensionInstance") & 1) != 0)
      {
        v35 = 0;
        if (a5 <= 0)
          v23 = 8 * (objc_msgSend(v13, "intention") == 2);
        else
          v23 = -4;
      }
      else
      {
        v35 = -1;
        v23 = 8;
      }
      objc_msgSend(v12, "definitions", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[PBFPosterSnapshotDefinition switcherSnapshotDefinition](PBFPosterSnapshotDefinition, "switcherSnapshotDefinition");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "containsObject:", v25);

      if ((v26 & 1) != 0)
      {
        v27 = -2;
        v28 = 8;
      }
      else
      {
        objc_msgSend(v12, "definitions");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[PBFPosterSnapshotDefinition switcherFloatingLayerSnapshotDefinition](PBFPosterSnapshotDefinition, "switcherFloatingLayerSnapshotDefinition");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "containsObject:", v30);

        if (v31)
          v28 = 8;
        else
          v28 = v34;
        if (v31)
          v27 = -2;
        else
          v27 = v35;
      }
      -[PBFPosterSnapshotterOperation setQueuePriority:](v22, "setQueuePriority:", v28);
      if (v27)
        v32 = 1;
      else
        v32 = a6 == 0x7FFFFFFFFFFFFFFFLL;
      if (v32)
        v33 = v27;
      else
        v33 = a6;
      -[PBFPosterSnapshotterOperation setAdvisoryQueuePriority:](v22, "setAdvisoryQueuePriority:", v33);
      objc_initWeak(&from, self);
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __100__PBFPosterSnapshotManager__lock_enqueueSnapshotter_forRequest_attempt_relativePriority_completion___block_invoke;
      v36[3] = &unk_1E86F55B0;
      objc_copyWeak(&v38, &from);
      objc_copyWeak(&v39, &location);
      v37 = v12;
      -[PBFPosterSnapshotterOperation setCompletionBlock:](v22, "setCompletionBlock:", v36);
      -[PBFPosterSnapshotManager _lock_prioritizeOperation:](self, "_lock_prioritizeOperation:", v22);
      if (!a5 && v15)
        -[PBFPosterSnapshotManager _lock_addCompletion:forRequest:](self, "_lock_addCompletion:forRequest:", v15, v13);
      -[PBFPosterSnapshotManager _lock_kickoffNextOperation](self, "_lock_kickoffNextOperation");

      objc_destroyWeak(&v39);
      objc_destroyWeak(&v38);
      objc_destroyWeak(&from);

      objc_destroyWeak(&location);
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v44 = *MEMORY[0x1E0CB2D68];
    v45[0] = CFSTR("Exceeded max number of retries");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pbf_generalErrorWithCode:userInfo:", 3, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterSnapshotManager _lock_fireCompletionsForRequest:snapshotImagesByReservation:error:](self, "_lock_fireCompletionsForRequest:snapshotImagesByReservation:error:", v13, 0, v18);

  }
}

void __100__PBFPosterSnapshotManager__lock_enqueueSnapshotter_forRequest_attempt_relativePriority_completion___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_operationDidComplete:snapshotter:", v2, *(_QWORD *)(a1 + 32));

}

- (void)_kickoffNextOperation
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PBFPosterSnapshotManager _lock_kickoffNextOperation](self, "_lock_kickoffNextOperation");
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_kickoffNextOperation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  NSObject *v14;
  PBFPriorityQueue *lock_priorityQueue;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  char v34;
  uint64_t v35;
  NSObject *v36;
  __int128 v37;
  uint64_t v38;
  void *v39;
  void *v40;
  BOOL v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  NSObject *v53;
  BOOL v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  id v60;
  __int16 v61;
  unint64_t v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  if (self->_lock_invalidated)
    return;
  -[PBFPosterSnapshotManager _snapshotSuspendedExtensionBundleIdentifiers](self, "_snapshotSuspendedExtensionBundleIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PBFPosterSnapshotManager _isOperationQueueSuspended](self, "_isOperationQueueSuspended"))
    goto LABEL_47;
  -[PBFApplicationStateMonitor currentApplicationContext](self->_applicationStateMonitor, "currentApplicationContext");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "posterUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v4, "count") != 0;

  v57 = 0u;
  v58 = 0u;
  v56 = 0u;
  v55 = 0u;
  -[PBFPriorityQueue enqueuedIdentifiers](self->_lock_priorityQueue, "enqueuedIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
  if (!v6)
    goto LABEL_46;
  v8 = v6;
  v9 = *(_QWORD *)v56;
  *(_QWORD *)&v7 = 138543618;
  v37 = v7;
  v39 = v5;
  v40 = v3;
  v38 = *(_QWORD *)v56;
  do
  {
    v10 = 0;
    v43 = v8;
    do
    {
      if (*(_QWORD *)v56 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v10);
      if ((objc_msgSend(v3, "containsObject:", v11, v37) & 1) != 0)
        goto LABEL_44;
      v12 = -[PBFPriorityQueue numberOfActiveItemForIdentifier:](self->_lock_priorityQueue, "numberOfActiveItemForIdentifier:", v11);
      if (v12)
      {
        v13 = v12;
        PBFLogSnapshotter();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v37;
          v60 = v11;
          v61 = 2048;
          v62 = v13;
          _os_log_debug_impl(&dword_1CB9FA000, v14, OS_LOG_TYPE_DEBUG, "%{public}@ numberOfActiveOperations %lu >= MAX_NUMBER_OF_ACTIVE_ITEMS; moving on.",
            buf,
            0x16u);
        }
        goto LABEL_43;
      }
      v45 = v10;
      lock_priorityQueue = self->_lock_priorityQueue;
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __54__PBFPosterSnapshotManager__lock_kickoffNextOperation__block_invoke;
      v52[3] = &unk_1E86F55D8;
      v54 = v41;
      v53 = v42;
      -[PBFPriorityQueue sortItemsForIdentifier:usingComparator:](lock_priorityQueue, "sortItemsForIdentifier:usingComparator:", v11, v52);
      -[PBFPriorityQueue enqueuedItemsForIdentifier:](self->_lock_priorityQueue, "enqueuedItemsForIdentifier:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      objc_msgSend(v16, "reverseObjectEnumerator");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
      if (!v18)
      {
        v8 = v43;
        goto LABEL_41;
      }
      v19 = v18;
      v44 = v16;
      v20 = *(_QWORD *)v49;
      v21 = v17;
      v46 = v17;
LABEL_14:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v49 != v20)
          objc_enumerationMutation(v21);
        v23 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v22);
        if ((objc_msgSend(v23, "isCancelled") & 1) != 0)
          goto LABEL_23;
        if ((objc_msgSend(v23, "isFinished") & 1) != 0)
          goto LABEL_23;
        objc_msgSend(v23, "snapshotter");
        v24 = objc_claimAutoreleasedReturnValue();
        if (!v24)
          goto LABEL_23;
        v25 = (void *)v24;
        objc_msgSend(v23, "snapshotter");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "isFinished"))
        {

LABEL_23:
          PBFLogSnapshotter();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            v60 = v23;
            _os_log_debug_impl(&dword_1CB9FA000, v29, OS_LOG_TYPE_DEBUG, "Operation is finished already, bailing... %{public}@", buf, 0xCu);
          }

          -[PBFPriorityQueue removeEnqueuedItem:forIdentifier:](self->_lock_priorityQueue, "removeEnqueuedItem:forIdentifier:", v23, v11);
          objc_msgSend(v23, "request");
          v30 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "snapshotter");
          v31 = objc_claimAutoreleasedReturnValue();
          -[NSObject error](v31, "error");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[PBFPosterSnapshotManager _lock_fireCompletionsForRequest:snapshotImagesByReservation:error:](self, "_lock_fireCompletionsForRequest:snapshotImagesByReservation:error:", v30, 0, v32);

          goto LABEL_26;
        }
        objc_msgSend(v23, "snapshotter");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "error");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = v46;
        if (v28)
          goto LABEL_23;
        objc_msgSend(v23, "snapshotter");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0;
        v34 = objc_msgSend(v33, "checkIfSnapshotterIsPreparedToExecute:", &v47);
        v30 = v47;

        if ((v34 & 1) != 0)
          break;
        -[PBFPriorityQueue removeEnqueuedItem:forIdentifier:](self->_lock_priorityQueue, "removeEnqueuedItem:forIdentifier:", v23, v11);
        objc_msgSend(v23, "request");
        v31 = objc_claimAutoreleasedReturnValue();
        -[PBFPosterSnapshotManager _lock_fireCompletionsForRequest:snapshotImagesByReservation:error:](self, "_lock_fireCompletionsForRequest:snapshotImagesByReservation:error:", v31, 0, v30);
        v21 = v46;
LABEL_26:

        if (v19 == ++v22)
        {
          v35 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
          v19 = v35;
          if (!v35)
          {
            v17 = v21;
            v5 = v39;
            v3 = v40;
            v9 = v38;
            v8 = v43;
            v10 = v45;
            goto LABEL_40;
          }
          goto LABEL_14;
        }
      }
      if (objc_msgSend(v23, "isExecuting"))
      {
        PBFLogSnapshotter();
        v31 = objc_claimAutoreleasedReturnValue();
        v21 = v46;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v60 = v23;
          _os_log_impl(&dword_1CB9FA000, v31, OS_LOG_TYPE_DEFAULT, "Operation is still executing, continuing... %{public}@", buf, 0xCu);
        }
        goto LABEL_26;
      }
      v17 = v23;

      v5 = v39;
      v3 = v40;
      v9 = v38;
      v8 = v43;
      v16 = v44;
      v10 = v45;
      if (!v17)
        goto LABEL_42;
      -[PBFPriorityQueue markItemActive:forIdentifier:](self->_lock_priorityQueue, "markItemActive:forIdentifier:", v17, v11);
      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v17);
      PBFLogSnapshotter();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v60 = v17;
        _os_log_debug_impl(&dword_1CB9FA000, v36, OS_LOG_TYPE_DEBUG, "Operation moving to active %{public}@", buf, 0xCu);
      }

LABEL_40:
      v16 = v44;
LABEL_41:

LABEL_42:
      v14 = v53;
LABEL_43:

LABEL_44:
      ++v10;
    }
    while (v10 != v8);
    v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
  }
  while (v8);
LABEL_46:

  -[PBFPosterSnapshotManager _lock_logOperationQueueStatus](self, "_lock_logOperationQueueStatus");
LABEL_47:

}

uint64_t __54__PBFPosterSnapshotManager__lock_kickoffNextOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  uint64_t v20;

  v5 = a2;
  v6 = a3;
  if (!*(_BYTE *)(a1 + 40))
    goto LABEL_7;
  objc_msgSend(v5, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serverIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serverIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "posterUUIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "posterUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "containsObject:", v14);

  objc_msgSend(*(id *)(a1 + 32), "posterUUIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "posterUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "containsObject:", v17);

  if (!v15 || v18)
  {
    v19 = v15 | v18 ^ 1;
    v20 = -1;
  }
  else
  {
    v19 = 0;
    v20 = 1;
  }

  if (v19)
  {
LABEL_7:
    objc_msgSend(v5, "queuePriority");
    objc_msgSend(v6, "queuePriority");
    v20 = BSCompareIntegers();
    if (!v20)
    {
      objc_msgSend(v5, "advisoryQueuePriority");
      objc_msgSend(v6, "advisoryQueuePriority");
      v20 = BSCompareIntegers();
    }
  }

  return v20;
}

- (void)_lock_prioritizeOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v4 = a3;
  v5 = v4;
  if (!self->_lock_invalidated)
  {
    objc_msgSend(v4, "snapshotter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serverIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "provider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "necessitatesExtensionInstance"))
    {
      -[PBFPriorityQueue enqueueItem:forIdentifier:](self->_lock_priorityQueue, "enqueueItem:forIdentifier:", v5, v10);
    }
    else
    {
      PBFLogSnapshotter();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PBFPosterSnapshotManager _lock_prioritizeOperation:].cold.1((uint64_t)v5, v11);

      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v5);
    }
    -[PBFPosterSnapshotManager _lock_logOperationQueueStatus](self, "_lock_logOperationQueueStatus");

  }
}

- (void)_lock_logOperationQueueStatus
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  NSUInteger v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[NSOperationQueue operationCount](self->_operationQueue, "operationCount");
  -[PBFPriorityQueue activeIdentifiers](self->_lock_priorityQueue, "activeIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = -[PBFPosterSnapshotManager _lock_numberOfRemainingOperations](self, "_lock_numberOfRemainingOperations");
  -[PBFPosterSnapshotManager _snapshotSuspendedExtensionBundleIdentifiers](self, "_snapshotSuspendedExtensionBundleIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  PBFLogSnapshotter();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = 134218752;
    v11 = v3;
    v12 = 2048;
    v13 = v5;
    v14 = 2048;
    v15 = v6;
    v16 = 2048;
    v17 = v8;
    _os_log_debug_impl(&dword_1CB9FA000, v9, OS_LOG_TYPE_DEBUG, "Operations active %lu / Operations queue active %lu / Operations queued %lu / Assertions preventing extensions from snapshotting: %lu", (uint8_t *)&v10, 0x2Au);
  }

}

- (unint64_t)_lock_numberOfRemainingOperations
{
  return -[PBFPriorityQueue numberOfEnqueuedItems](self->_lock_priorityQueue, "numberOfEnqueuedItems");
}

- (id)_lock_buildSnapshotterForRequest:(id)a3 attemptNumber:(unint64_t)a4
{
  id v5;
  id WeakRetained;
  PBFPosterSnapshotter *v7;
  id v8;
  PBFPosterSnapshotter *v9;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_extensionProvider);

  if (WeakRetained)
  {
    v7 = [PBFPosterSnapshotter alloc];
    v8 = objc_loadWeakRetained((id *)&self->_extensionProvider);
    v9 = -[PBFPosterSnapshotter initWithRequest:extensionProvider:runtimeAssertionProvider:](v7, "initWithRequest:extensionProvider:runtimeAssertionProvider:", v5, v8, self->_runtimeAssertionProvider);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_acquirePrewarmAssertionIfNeeded:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PBFPosterSnapshotManager _lock_acquirePrewarmAssertionIfNeeded:](self, "_lock_acquirePrewarmAssertionIfNeeded:", v3);
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_acquirePrewarmAssertionIfNeeded:(BOOL)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  PBFRuntimeAssertionProviding *runtimeAssertionProvider;
  void *v30;
  RBSAssertion *v31;
  RBSAssertion *posterBoardPrewarmAssertion;
  NSObject *v33;
  _QWORD v34[5];
  uint8_t buf[16];

  if (self->_lock_invalidated)
    return;
  if (self->_posterBoardPrewarmAssertion)
  {
    PBFLogSnapshotter();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[PBFPosterSnapshotManager _lock_acquirePrewarmAssertionIfNeeded:].cold.3(v4, v5, v6, v7, v8, v9, v10, v11);
LABEL_8:

    return;
  }
  if (-[PBFPosterSnapshotManager _isOperationQueueSuspended](self, "_isOperationQueueSuspended"))
  {
    PBFLogSnapshotter();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[PBFPosterSnapshotManager _lock_acquirePrewarmAssertionIfNeeded:].cold.1(v4, v13, v14, v15, v16, v17, v18, v19);
    goto LABEL_8;
  }
  if (!-[PBFPriorityQueue isEmpty](self->_lock_priorityQueue, "isEmpty"))
    goto LABEL_15;
  PBFLogSnapshotter();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (a3)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[PBFPosterSnapshotManager _lock_acquirePrewarmAssertionIfNeeded:].cold.2(v21, v22, v23, v24, v25, v26, v27, v28);

LABEL_15:
    runtimeAssertionProvider = self->_runtimeAssertionProvider;
    objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __66__PBFPosterSnapshotManager__lock_acquirePrewarmAssertionIfNeeded___block_invoke;
    v34[3] = &unk_1E86F26D8;
    v34[4] = self;
    -[PBFRuntimeAssertionProviding acquirePrewarmRuntimeAssertionForReason:target:invalidationHandler:](runtimeAssertionProvider, "acquirePrewarmRuntimeAssertionForReason:target:invalidationHandler:", CFSTR("Snapshotter is snapshotting"), v30, v34);
    v31 = (RBSAssertion *)objc_claimAutoreleasedReturnValue();
    posterBoardPrewarmAssertion = self->_posterBoardPrewarmAssertion;
    self->_posterBoardPrewarmAssertion = v31;

    PBFLogSnapshotter();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB9FA000, v33, OS_LOG_TYPE_DEFAULT, "Prewarm Assertion was acquired; kicking off next operation",
        buf,
        2u);
    }

    -[PBFPosterSnapshotManager _lock_kickoffNextOperation](self, "_lock_kickoffNextOperation");
    return;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB9FA000, v21, OS_LOG_TYPE_INFO, "Prewarm Assertion was not acquired; operation queue has nothing queued up and we're not forcing it",
      buf,
      2u);
  }

}

void __66__PBFPosterSnapshotManager__lock_acquirePrewarmAssertionIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFPosterSnapshotManager _lock_acquirePrewarmAssertionIfNeeded:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__PBFPosterSnapshotManager__lock_acquirePrewarmAssertionIfNeeded___block_invoke_2;
  v3[3] = &unk_1E86F2518;
  v3[4] = *(_QWORD *)(a1 + 32);
  PBFDispatchAsyncWithString(v2, QOS_CLASS_USER_INITIATED, v3);

}

uint64_t __66__PBFPosterSnapshotManager__lock_acquirePrewarmAssertionIfNeeded___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_posterBoardPrewarmAssertionWasInvalidated");
}

- (void)_teardownPrewarmAssertionIfAppropriate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PBFPosterSnapshotManager _lock_teardownPrewarmAssertionIfAppropriate:](self, "_lock_teardownPrewarmAssertionIfAppropriate:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)_teardownBehaviorAssertionsIfAppropriate:(id)a3
{
  void *v4;
  NSMutableDictionary *assertionLock_extensionSnapshotterDisabledAssertions;
  uint64_t v6;
  id v7;
  NSMutableDictionary *assertionLock_extensionEditingInProgressAssertions;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  os_unfair_lock_lock(&self->_assertionLock);
  assertionLock_extensionSnapshotterDisabledAssertions = self->_assertionLock_extensionSnapshotterDisabledAssertions;
  v6 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __69__PBFPosterSnapshotManager__teardownBehaviorAssertionsIfAppropriate___block_invoke;
  v21[3] = &unk_1E86F5600;
  v7 = v4;
  v22 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](assertionLock_extensionSnapshotterDisabledAssertions, "enumerateKeysAndObjectsUsingBlock:", v21);
  -[NSMutableDictionary removeAllObjects](self->_assertionLock_extensionSnapshotterDisabledAssertions, "removeAllObjects");
  assertionLock_extensionEditingInProgressAssertions = self->_assertionLock_extensionEditingInProgressAssertions;
  v19[0] = v6;
  v19[1] = 3221225472;
  v19[2] = __69__PBFPosterSnapshotManager__teardownBehaviorAssertionsIfAppropriate___block_invoke_2;
  v19[3] = &unk_1E86F5600;
  v9 = v7;
  v20 = v9;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](assertionLock_extensionEditingInProgressAssertions, "enumerateKeysAndObjectsUsingBlock:", v19);
  -[NSMutableDictionary removeAllObjects](self->_assertionLock_extensionEditingInProgressAssertions, "removeAllObjects");
  objc_msgSend(v9, "unionSet:", self->_assertionLock_inUseAssertions);
  -[NSMutableSet removeAllObjects](self->_assertionLock_inUseAssertions, "removeAllObjects");
  os_unfair_lock_unlock(&self->_assertionLock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "invalidate", (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

uint64_t __69__PBFPosterSnapshotManager__teardownBehaviorAssertionsIfAppropriate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unionSet:");
}

uint64_t __69__PBFPosterSnapshotManager__teardownBehaviorAssertionsIfAppropriate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unionSet:");
}

- (void)_lock_teardownPrewarmAssertionIfAppropriate:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSUInteger v7;
  NSUInteger v8;
  _BOOL4 lock_invalidated;
  RBSAssertion *posterBoardPrewarmAssertion;
  RBSAssertion *v11;
  int v12;
  id v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  NSUInteger v17;
  __int16 v18;
  NSUInteger v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_posterBoardPrewarmAssertion
    && (!-[NSMapTable count](self->_lock_requestToCompletion, "count")
     || -[PBFPosterSnapshotManager _isOperationQueueSuspended](self, "_isOperationQueueSuspended")
     || self->_lock_invalidated))
  {
    PBFLogSnapshotter();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = -[NSOperationQueue isSuspended](self->_operationQueue, "isSuspended");
      v7 = -[NSMapTable count](self->_lock_requestToCompletion, "count");
      v8 = -[NSOperationQueue operationCount](self->_operationQueue, "operationCount");
      lock_invalidated = self->_lock_invalidated;
      v12 = 138544386;
      v13 = v4;
      v14 = 1024;
      v15 = v6;
      v16 = 2048;
      v17 = v7;
      v18 = 2048;
      v19 = v8;
      v20 = 1024;
      v21 = lock_invalidated;
      _os_log_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_DEFAULT, "Prewarm Assertion was cleaned up for reason: %{public}@; operation queue is suspended %{BOOL}u; number of _lock_"
        "requestToCompletion handlers %ld; number of operations %ld; invalidated: %{BOOL}u",
        (uint8_t *)&v12,
        0x2Cu);
    }

    posterBoardPrewarmAssertion = self->_posterBoardPrewarmAssertion;
    self->_posterBoardPrewarmAssertion = 0;
    v11 = posterBoardPrewarmAssertion;

    -[RBSAssertion invalidate](v11, "invalidate");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotService, 0);
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_applicationStateMonitor, 0);
  objc_destroyWeak((id *)&self->_modelCoordinatorProvider);
  objc_destroyWeak((id *)&self->_extensionProvider);
  objc_storeStrong((id *)&self->_runtimeAssertionProvider, 0);
  objc_storeStrong((id *)&self->_posterBoardPrewarmAssertion, 0);
  objc_storeStrong((id *)&self->_assertionLock_assertionObservers, 0);
  objc_storeStrong((id *)&self->_assertionLock_extensionEditingInProgressAssertions, 0);
  objc_storeStrong((id *)&self->_assertionLock_extensionSnapshotterDisabledAssertions, 0);
  objc_storeStrong((id *)&self->_assertionLock_inUseAssertions, 0);
  objc_storeStrong((id *)&self->_lock_fulfilledSnapshotBlocks, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_lock_requestToCompletion, 0);
  objc_storeStrong((id *)&self->_lock_priorityQueue, 0);
  objc_storeStrong((id *)&self->_snapshotActivity, 0);
}

- (void)initWithRuntimeAssertionProvider:extensionProvider:modelCoordinatorProvider:applicationStateMonitor:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithRuntimeAssertionProvider:extensionProvider:modelCoordinatorProvider:applicationStateMonitor:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithRuntimeAssertionProvider:extensionProvider:modelCoordinatorProvider:applicationStateMonitor:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithRuntimeAssertionProvider:extensionProvider:modelCoordinatorProvider:applicationStateMonitor:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)ingestSnapshotCollection:forConfiguration:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)ingestSnapshotCollection:forConfiguration:error:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)acquireSnapshotterDisabledAssertionForProvider:withReason:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)acquireSnapshotterDisabledAssertionForProvider:withReason:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)acquireEditingSessionAssertionForProvider:withReason:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)acquireEditingSessionAssertionForProvider:withReason:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)posterSnapshotForRequest:definition:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)posterSnapshotForRequest:definition:error:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)fetchPosterSnapshotForRequest:definition:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)fetchPosterSnapshotForRequest:definition:completion:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)fetchPosterSnapshotsForRequest:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)fetchPosterSnapshotsForRequest:completion:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)cancelRequestedSnapshotsForExtensionBundleIdentifier:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)cancelRequestedSnapshotsForIdentity:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_loadReservationsForDefinitionForRequest:(_QWORD *)a3 .cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl(&dword_1CB9FA000, a4, OS_LOG_TYPE_ERROR, "skipping reservation; had error: %{public}@", a1, 0xCu);

}

- (void)_enqueueSnapshotForRequestIfNeeded:relativePriority:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __96__PBFPosterSnapshotManager__lock_submitSBRendererRequestForRequest_relativePriority_completion___block_invoke_cold_1(void *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  os_log_t v6;
  os_log_type_t v7;
  const char *v8;
  uint8_t *v9;

  objc_msgSend(a1, "executionTime");
  objc_msgSend(*(id *)(a2 + 32), "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a2 + 40), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10_0();
  _os_log_error_impl(v5, v6, v7, v8, v9, 0x20u);

}

void __96__PBFPosterSnapshotManager__lock_submitSBRendererRequestForRequest_relativePriority_completion___block_invoke_cold_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  os_log_t v5;
  os_log_type_t v6;
  const char *v7;
  uint8_t *v8;

  objc_msgSend(0, "executionTime");
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10_0();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x2Au);

}

void __96__PBFPosterSnapshotManager__lock_submitSBRendererRequestForRequest_relativePriority_completion___block_invoke_218_cold_1(uint64_t a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_0();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x16u);

}

- (void)_lock_prioritizeOperation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1CB9FA000, a2, OS_LOG_TYPE_DEBUG, "NON-BLOCKING Operation moving to active %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_lock_acquirePrewarmAssertionIfNeeded:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8_1(&dword_1CB9FA000, a1, a3, "Prewarm Assertion was not acquired; operation queue is suspended",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_13_0();
}

- (void)_lock_acquirePrewarmAssertionIfNeeded:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8_1(&dword_1CB9FA000, a1, a3, "Prewarm Assertion will be acquired; forcing acquisition.",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_13_0();
}

- (void)_lock_acquirePrewarmAssertionIfNeeded:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8_1(&dword_1CB9FA000, a1, a3, "Prewarm Assertion was not acquired; already have a prewarm assertion active!",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_13_0();
}

@end
