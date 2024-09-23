@implementation PBFPosterExtensionDataStoreXPCServiceGlue

+ (PBFPosterExtensionDataStoreXPCServiceGlue)sharedInstance
{
  if (sharedInstance_onceToken[0] != -1)
    dispatch_once(sharedInstance_onceToken, &__block_literal_global_42);
  return (PBFPosterExtensionDataStoreXPCServiceGlue *)(id)sharedInstance_glue;
}

void __59__PBFPosterExtensionDataStoreXPCServiceGlue_sharedInstance__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  int v4;
  PBFPosterExtensionDataStoreXPCServiceGlue *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByDeletingPathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PosterBoard"));

  v5 = -[PBFPosterExtensionDataStoreXPCServiceGlue initWithOptions:]([PBFPosterExtensionDataStoreXPCServiceGlue alloc], "initWithOptions:", v4 ^ 1u);
  v6 = (void *)sharedInstance_glue;
  sharedInstance_glue = (uint64_t)v5;

}

- (PBFPosterExtensionDataStore)dataStore
{
  return (PBFPosterExtensionDataStore *)-[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", 0);
}

- (PBFPosterExtensionDataStoreXPCServiceGlue)initWithOptions:(unint64_t)a3
{
  PBFPosterExtensionDataStoreXPCServiceGlue *v5;
  PBFPosterExtensionDataStoreXPCServiceGlue *v6;
  uint64_t v7;
  id *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  id v24;
  id v26;
  id location;
  _QWORD block[4];
  id *v29;
  SEL v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)PBFPosterExtensionDataStoreXPCServiceGlue;
  v5 = -[PBFPosterExtensionDataStoreXPCServiceGlue init](&v31, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v5->_lock._os_unfair_lock_opaque = 0;
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __61__PBFPosterExtensionDataStoreXPCServiceGlue_initWithOptions___block_invoke;
    block[3] = &unk_1E86F77A8;
    v30 = a2;
    v8 = v5;
    v29 = v8;
    if (initWithOptions__onceToken != -1)
      dispatch_once(&initWithOptions__onceToken, block);
    if (a3 != 1)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0D7F708]);
      v10 = v8[7];
      v8[7] = v9;

      objc_msgSend(v8[7], "setDelegate:", v8);
      objc_msgSend(v8[7], "activate");
      v11 = objc_opt_new();
      v12 = v8[5];
      v8[5] = (id)v11;

      objc_msgSend(v8[5], "setDelegate:", v8);
      v13 = (id)objc_msgSend(MEMORY[0x1E0D03488], "activateManualDomain:", CFSTR("com.apple.posterboardservices"));
    }
    v14 = objc_alloc(MEMORY[0x1E0D1BCB0]);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithTraitEnvironment:", v15);
    v17 = v8[4];
    v8[4] = (id)v16;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v8, sel__localeDidChange_, *MEMORY[0x1E0C99720], 0);

    objc_initWeak(&location, v8);
    v19 = MEMORY[0x1E0C80D38];
    v20 = (void *)MEMORY[0x1E0CB3940];
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ - BaseDataStoreURL"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_copyWeak(&v26, &location);
    v24 = (id)BSLogAddStateCaptureBlockWithTitle();

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

  }
  return v6;
}

void __61__PBFPosterExtensionDataStoreXPCServiceGlue_initWithOptions___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  __int128 v4;
  _QWORD block[4];
  __int128 v6;

  objc_msgSend(MEMORY[0x1E0D7F8F0], "sharedWorkloop");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PBFPosterExtensionDataStoreXPCServiceGlue_initWithOptions___block_invoke_2;
  block[3] = &unk_1E86F77A8;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  v6 = v4;
  dispatch_async(v2, block);

}

void __61__PBFPosterExtensionDataStoreXPCServiceGlue_initWithOptions___block_invoke_2(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (MEMORY[0x1D17A3148]("-[PBFPosterExtensionDataStoreXPCServiceGlue initWithOptions:]_block_invoke_2"))
  {
    objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "deviceClass");

    if (v3 <= 2)
    {
      v4 = (void *)MEMORY[0x1E0CB34D0];
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/System/Library/ExtensionKit/Extensions/LegacyPoster.appex"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleWithURL:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LegacyPoster doesn't exist; please file a radar!"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          __61__PBFPosterExtensionDataStoreXPCServiceGlue_initWithOptions___block_invoke_2_cold_1(a1, (uint64_t)v7);

      }
    }
  }
}

id __61__PBFPosterExtensionDataStoreXPCServiceGlue_initWithOptions___block_invoke_31(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_baseDataStoreURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PBFRuntimeAssertionManager)runtimeAssertionManager
{
  os_unfair_lock_s *p_lock;
  PBFRuntimeAssertionManager *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_runtimeAssertionManager;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (PBFApplicationStateMonitor)applicationStateMonitor
{
  os_unfair_lock_s *p_lock;
  PBFApplicationStateMonitor *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_applicationStateMonitor;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_dataStoreWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_dataStoreWithError:](self, "_lock_dataStoreWithError:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)_lock_dataStoreWithError:(id *)a3
{
  PBFRuntimeAssertionManager *v5;
  PBFRuntimeAssertionManager *lock_runtimeAssertionManager;
  PBFApplicationStateMonitor *v7;
  PBFApplicationStateMonitor *lock_applicationStateMonitor;
  PBFPosterExtensionDataStore *lock_dataStore;
  PBFPosterExtensionDataStore *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  _BOOL8 v18;
  id v19;
  void *v20;
  PBFRuntimeAssertionManager *v21;
  PBFApplicationStateMonitor *v22;
  PBFPosterExtensionDataStore *v23;
  uint64_t v24;
  PBFPosterExtensionDataStore *v25;
  void *v26;
  void *v27;
  id v29;
  id v30;
  uint8_t buf[16];
  id v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  if (!self->_lock_runtimeAssertionManager)
  {
    v5 = objc_alloc_init(PBFRuntimeAssertionManager);
    lock_runtimeAssertionManager = self->_lock_runtimeAssertionManager;
    self->_lock_runtimeAssertionManager = v5;

  }
  if (!self->_lock_applicationStateMonitor)
  {
    v7 = (PBFApplicationStateMonitor *)objc_opt_new();
    lock_applicationStateMonitor = self->_lock_applicationStateMonitor;
    self->_lock_applicationStateMonitor = v7;

  }
  lock_dataStore = self->_lock_dataStore;
  if (!lock_dataStore)
  {
    -[PBFPosterExtensionDataStoreXPCServiceGlue _baseDataStoreURL](self, "_baseDataStoreURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0D87C98];
    objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pf_prewarmRuntimeAssertionForReason:target:invalidationHandler:", CFSTR("bootstrapDataStoreAssertion"), v13, &__block_literal_global_40_0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0;
    objc_msgSend(v14, "acquireWithError:", &v32);
    v15 = v32;
    PBFLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_dataStoreWithError:].cold.1();
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB9FA000, v17, OS_LOG_TYPE_DEFAULT, "Bootstrap RBSAssertion acquired", buf, 2u);
    }

    -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_reapTransientData:](self, "_lock_reapTransientData:", 0);
    v30 = 0;
    v18 = -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_performNecessaryMigrationsForDataStoreAtURL:shouldForce:error:](self, "_lock_performNecessaryMigrationsForDataStoreAtURL:shouldForce:error:", v11, 0, &v30);
    v19 = v30;
    v20 = v19;
    if (v19)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v19);
      objc_msgSend(v14, "invalidate");
    }
    else
    {
      v21 = self->_lock_runtimeAssertionManager;
      v22 = self->_lock_applicationStateMonitor;
      v29 = 0;
      -[PBFPosterExtensionDataStoreXPCServiceGlue buildDataStoreForURL:runtimeAssertionProvider:applicationStateMonitor:observer:wasMigrationJustPerformed:error:](self, "buildDataStoreForURL:runtimeAssertionProvider:applicationStateMonitor:observer:wasMigrationJustPerformed:error:", v11, v21, v22, self, v18, &v29);
      v23 = (PBFPosterExtensionDataStore *)objc_claimAutoreleasedReturnValue();
      v24 = (uint64_t)v29;
      v25 = self->_lock_dataStore;
      self->_lock_dataStore = v23;

      if (!((uint64_t)self->_lock_dataStore | v24))
      {
        v26 = (void *)MEMORY[0x1E0CB35C8];
        v33 = *MEMORY[0x1E0CB2D68];
        v34[0] = CFSTR("Data store could not be created for an unknown reason which evades explanation.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "pbf_generalErrorWithCode:userInfo:", 0, v27);
        v24 = objc_claimAutoreleasedReturnValue();

      }
      if (v24)
      {
        if (a3)
          *a3 = objc_retainAutorelease((id)v24);
        -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_teardownDataStoreWithError:](self, "_lock_teardownDataStoreWithError:", 0);
      }
      objc_msgSend(v14, "invalidate");

    }
    if (v20)
    {
      v10 = 0;
      return v10;
    }
    lock_dataStore = self->_lock_dataStore;
  }
  v10 = lock_dataStore;
  return v10;
}

void __70__PBFPosterExtensionDataStoreXPCServiceGlue__lock_dataStoreWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  PBFLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __70__PBFPosterExtensionDataStoreXPCServiceGlue__lock_dataStoreWithError___block_invoke_cold_1();

}

- (id)buildDataStoreForURL:(id)a3 runtimeAssertionProvider:(id)a4 applicationStateMonitor:(id)a5 observer:(id)a6 wasMigrationJustPerformed:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  id v16;
  PBFPosterExtensionDataStore *v17;

  v9 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[PBFPosterExtensionDataStore initWithURL:runtimeAssertionProvider:extensionProvider:observer:wasMigrationJustPerformed:applicationStateMonitor:error:]([PBFPosterExtensionDataStore alloc], "initWithURL:runtimeAssertionProvider:extensionProvider:observer:wasMigrationJustPerformed:applicationStateMonitor:error:", v16, v15, 0, v13, v9, v14, a8);

  return v17;
}

- (BOOL)_mutateDataStoreState:(unint64_t)a3 error:(id *)a4
{
  char v5;
  os_unfair_lock_s *p_lock;
  NSObject *v8;
  id v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  uint8_t v31[128];
  uint8_t buf[4];
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if ((a3 & 0x3F) != 0)
  {
    v5 = a3;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    PBFLogReaper();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB9FA000, v8, OS_LOG_TYPE_INFO, "Tearing down data store", buf, 2u);
    }

    v30 = 0;
    -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_teardownDataStoreWithError:](self, "_lock_teardownDataStoreWithError:", &v30);
    v9 = v30;
    v10 = v9;
    v11 = v9 == 0;
    if ((v5 & 2) == 0 || v9)
    {
      if (v9)
      {
        os_unfair_lock_unlock(p_lock);
        -[PBFPosterExtensionDataStoreXPCServiceGlue _postDidTearDownNotification](self, "_postDidTearDownNotification");
        if (a4)
          *a4 = objc_retainAutorelease(v10);
        goto LABEL_34;
      }
    }
    else
    {
      PBFLogReaper();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CB9FA000, v12, OS_LOG_TYPE_INFO, "Reaping snapshots", buf, 2u);
      }

      -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_reapSnapshots:](self, "_lock_reapSnapshots:", 1);
    }
    if ((v5 & 0xC) != 0)
    {
      v13 = v5 & 8;
      PBFLogReaper();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v33 = v13 >> 3;
        _os_log_impl(&dword_1CB9FA000, v14, OS_LOG_TYPE_INFO, "Reaping transient data (all? %{BOOL}u", buf, 8u);
      }

      -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_reapTransientData:](self, "_lock_reapTransientData:", v13 != 0);
    }
    if ((v5 & 0x10) != 0)
    {
      PBFLogReaper();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CB9FA000, v15, OS_LOG_TYPE_INFO, "Reaping data store", buf, 2u);
      }

      -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_reapEntirePosterBoardDataStore](self, "_lock_reapEntirePosterBoardDataStore");
    }
    if ((v5 & 0x20) != 0
      && MEMORY[0x1D17A3148]("-[PBFPosterExtensionDataStoreXPCServiceGlue _mutateDataStoreState:error:]"))
    {
      PBFLogReaper();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CB9FA000, v16, OS_LOG_TYPE_INFO, "Messing up data protections", buf, 2u);
      }

      -[PBFPosterExtensionDataStoreXPCServiceGlue _baseDataStoreURL](self, "_baseDataStoreURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v17, MEMORY[0x1E0C9AA60], 0, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v27;
        v23 = *MEMORY[0x1E0C99918];
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v27 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "pbf_setFileProtection:error:", v23, 0);
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        }
        while (v21);
      }

      objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_setNeedsFileProtectionsReset:", 1);
    }
    os_unfair_lock_unlock(p_lock);
    -[PBFPosterExtensionDataStoreXPCServiceGlue _postDidTearDownNotification](self, "_postDidTearDownNotification");
LABEL_34:

    return v11;
  }
  return 0;
}

- (void)_postDidTearDownNotification
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", PBFPosterExtensionDataStoreDidTearDownNotification, 0, 0);

}

- (void)_lock_teardownDataStoreWithError:(id *)a3
{
  void *v5;
  PBFPosterExtensionDataStore *lock_dataStore;
  PBFPosterExtensionDataStore *v7;
  PBFRuntimeAssertionManager *lock_runtimeAssertionManager;
  PBFRuntimeAssertionManager *v9;
  PBFApplicationStateMonitor *lock_applicationStateMonitor;
  PBFApplicationStateMonitor *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[15];

  v16[14] = *MEMORY[0x1E0C80C00];
  if (a3)
    v5 = (void *)objc_opt_new();
  else
    v5 = 0;
  lock_dataStore = self->_lock_dataStore;
  if (lock_dataStore)
  {
    -[PBFPosterExtensionDataStore removeObserver:](lock_dataStore, "removeObserver:", self);
    -[PBFPosterExtensionDataStore invalidate](self->_lock_dataStore, "invalidate");
  }
  v7 = self->_lock_dataStore;
  self->_lock_dataStore = 0;

  lock_runtimeAssertionManager = self->_lock_runtimeAssertionManager;
  if (lock_runtimeAssertionManager)
    -[PBFRuntimeAssertionManager invalidate](lock_runtimeAssertionManager, "invalidate");
  v9 = self->_lock_runtimeAssertionManager;
  self->_lock_runtimeAssertionManager = 0;

  lock_applicationStateMonitor = self->_lock_applicationStateMonitor;
  if (lock_applicationStateMonitor)
    -[PBFApplicationStateMonitor invalidate](lock_applicationStateMonitor, "invalidate");
  v11 = self->_lock_applicationStateMonitor;
  self->_lock_applicationStateMonitor = 0;

  if (a3 && objc_msgSend(v5, "count"))
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2F70];
    v15[0] = *MEMORY[0x1E0CB2D68];
    v15[1] = v13;
    v16[0] = CFSTR("_lock_teardownDataStoreWithError failed");
    v16[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pbf_generalErrorWithCode:userInfo:", 8, v14);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
}

- (id)_baseDataStoreURL
{
  return -[PBFPosterExtensionDataStoreXPCServiceGlue _baseDataStoreURL:](self, "_baseDataStoreURL:", objc_msgSend(MEMORY[0x1E0D7F648], "shouldUseSharedDataStore"));
}

- (id)_baseDataStoreURL:(BOOL)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0D7F648], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sharedResourcesDirectoryURL");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      PBFLogDataStore();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "absoluteString");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v28 = v6;
        _os_log_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_DEFAULT, "Opting to place data store at shared resources directory (system container): %@", buf, 0xCu);

      }
      v4 = v4;
      v7 = 0;
      v8 = v4;
    }
    else
    {
      v7 = 0;
      v8 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v4, "URLForDirectory:inDomain:appropriateForURL:create:error:", 14, 1, 0, 1, &v22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v22;
  }

  if (!v8)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99768];
    v25[0] = CFSTR("dataStoreURL");
    v14 = objc_alloc_init(MEMORY[0x1E0C99E98]);
    v25[1] = *MEMORY[0x1E0CB3388];
    v26[0] = v14;
    v26[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, CFSTR("Unable to setup dataStore URL"), v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  v21 = 0;
  v9 = objc_msgSend(v8, "checkResourceIsReachableAndReturnError:", &v21);
  v10 = v21;
  if ((v9 & 1) == 0)
  {
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99768];
    v19 = *MEMORY[0x1E0CB3388];
    v23[0] = CFSTR("dataStoreURL");
    v23[1] = v19;
    v24[0] = v8;
    v24[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, CFSTR("Unable to reach dataStore URL"), v20);
    v16 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
    objc_exception_throw(v16);
  }

  return v8;
}

- (id)acquireSnapshotterInUseAssertionWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PBFPosterExtensionDataStoreXPCServiceGlue dataStore](self, "dataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "acquireSnapshotterInUseAssertionWithReason:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)acquireSnapshotterDisabledAssertionForProvider:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[PBFPosterExtensionDataStoreXPCServiceGlue dataStore](self, "dataStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "acquireSnapshotterDisabledAssertionForProvider:withReason:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)acquireEditingSessionAssertionForProvider:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[PBFPosterExtensionDataStoreXPCServiceGlue dataStore](self, "dataStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "acquireEditingSessionAssertionForProvider:withReason:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)activeEditingSessionAssertionExtensionIdentifiers
{
  void *v2;
  void *v3;

  -[PBFPosterExtensionDataStoreXPCServiceGlue dataStore](self, "dataStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeEditingSessionAssertionExtensionIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)addBehaviorAssertionObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PBFPosterExtensionDataStoreXPCServiceGlue dataStore](self, "dataStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addBehaviorAssertionObserver:", v4);

}

- (void)removeBehaviorAssertionObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PBFPosterExtensionDataStoreXPCServiceGlue dataStore](self, "dataStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeBehaviorAssertionObserver:", v4);

}

- (void)server:(id)a3 deleteTransientDataWithCompletion:(id)a4
{
  void (**v5)(id, _QWORD);
  uint64_t v6;

  v6 = 0;
  v5 = (void (**)(id, _QWORD))a4;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _mutateDataStoreState:error:](self, "_mutateDataStoreState:error:", 9, &v6);
  v5[2](v5, v6);

}

- (void)server:(id)a3 deleteDataStoreWithCompletion:(id)a4
{
  void (**v5)(id, _QWORD);
  uint64_t v6;

  v6 = 0;
  v5 = (void (**)(id, _QWORD))a4;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _mutateDataStoreState:error:](self, "_mutateDataStoreState:error:", 25, &v6);
  v5[2](v5, v6);

}

- (void)server:(id)a3 triggerMessedUpDataProtectionWithCompletion:(id)a4
{
  void (**v5)(id, _QWORD);
  uint64_t v6;

  v6 = 0;
  v5 = (void (**)(id, _QWORD))a4;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _mutateDataStoreState:error:](self, "_mutateDataStoreState:error:", 33, &v6);
  v5[2](v5, v6);

}

- (void)server:(id)a3 fetchChargerIdentifierRelationshipsWithCompletion:(id)a4
{
  void (**v5)(id, _QWORD, id);
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v5 = (void (**)(id, _QWORD, id))a4;
  v13 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  if (v7)
  {
    v8 = v7;
    v5[2](v5, 0, v7);
  }
  else
  {
    v9 = *MEMORY[0x1E0D7FC00];
    v12 = 0;
    objc_msgSend(v6, "posterCollectionForRole:error:", v9, &v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;
    if (v8)
    {
      v5[2](v5, 0, v8);
    }
    else
    {
      objc_msgSend(v10, "chargerIdentifierRelationships");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, id))v5)[2](v5, v11, 0);

    }
  }

}

- (void)server:(id)a3 resetRole:(id)a4 completion:(id)a5
{
  -[PBFPosterExtensionDataStoreXPCServiceGlue _resetRole:completion:](self, "_resetRole:completion:", a4, a5);
}

- (void)server:(id)a3 invalidateDataStoreWithCompletion:(id)a4
{
  void (**v5)(id, _QWORD);
  uint64_t v6;

  v5 = (void (**)(id, _QWORD))a4;
  v6 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _mutateDataStoreState:error:](self, "_mutateDataStoreState:error:", 1, &v6);
  if (v5)
    v5[2](v5, v6);

}

- (void)server:(id)a3 deleteSnapshots:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void (**v7)(id, id);
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  void (**v14)(id, id);
  id v15;
  id v16;

  v5 = a4;
  v7 = (void (**)(id, id))a5;
  v16 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _mutateDataStoreState:error:](self, "_mutateDataStoreState:error:", 3, &v16);
  v8 = v16;
  if (v5)
  {
    v15 = 0;
    -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v15;
    objc_msgSend(v9, "currentGalleryConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      PBFLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionDataStoreXPCServiceGlue server:deleteSnapshots:completion:].cold.1();

      v7[2](v7, v10);
      goto LABEL_8;
    }
    if (v11)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __79__PBFPosterExtensionDataStoreXPCServiceGlue_server_deleteSnapshots_completion___block_invoke;
      v13[3] = &unk_1E86F77F0;
      v14 = v7;
      objc_msgSend(v11, "prewarmGallerySnapshotsWithCompletion:", v13);

LABEL_8:
      goto LABEL_11;
    }
  }
  if (v7)
    v7[2](v7, v8);
LABEL_11:

}

void __79__PBFPosterExtensionDataStoreXPCServiceGlue_server_deleteSnapshots_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  if (v3)
  {
    PBFLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStoreXPCServiceGlue server:deleteSnapshots:completion:].cold.1();

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)server:(id)a3 notifyPosterBoardOfApplicationUpdatesWithCompletion:(id)a4
{
  -[PBFPosterExtensionDataStoreXPCServiceGlue _handleLaunchServicesUpdates:completion:](self, "_handleLaunchServicesUpdates:completion:", 0, a4);
}

- (void)_handleLaunchServicesUpdates:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  void (**v7)(id, id);
  void *v8;
  void *v9;
  id v10;
  PBFRuntimeAssertionManager *lock_runtimeAssertionManager;
  void *v12;
  os_unfair_lock_s *p_lock;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  void (**v19)(id, id);
  id v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a3;
  v7 = (void (**)(id, id))a4;
  if (-[PBFPosterExtensionDataStoreXPCServiceGlue _migrationIsPending](self, "_migrationIsPending"))
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D68];
    v24[0] = CFSTR("Migration is pending; will not go through posterboard app update cycle");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pbf_generalErrorWithCode:userInfo:", 7, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v10);
  }
  else
  {
    lock_runtimeAssertionManager = self->_lock_runtimeAssertionManager;
    objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFRuntimeAssertionManager acquirePosterUpdateRuntimeAssertionForReason:target:](lock_runtimeAssertionManager, "acquirePosterUpdateRuntimeAssertionForReason:target:", CFSTR("notifyPosterBoardOfApplicationUpdatesWithCompletion"), v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v20 = 0;
    -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_dataStoreWithError:](self, "_lock_dataStoreWithError:", &v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v20;
    if (v14)
    {
      if (v6)
        v6[2](v6, v14);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __85__PBFPosterExtensionDataStoreXPCServiceGlue__handleLaunchServicesUpdates_completion___block_invoke;
      v17[3] = &unk_1E86F4458;
      v18 = v9;
      v19 = v7;
      objc_msgSend(v14, "updateExtensionsAndNotifyWhenComplete:", v17);
      os_unfair_lock_unlock(p_lock);

    }
    else
    {
      os_unfair_lock_unlock(p_lock);
      if (!v10)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v21 = *MEMORY[0x1E0CB2D68];
        v22 = CFSTR("Datastore could not be loaded and no error was returned");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "pbf_generalErrorWithCode:userInfo:", 7, v16);
        v10 = (id)objc_claimAutoreleasedReturnValue();

      }
      v7[2](v7, v10);
      objc_msgSend(v9, "invalidate");
    }

  }
}

uint64_t __85__PBFPosterExtensionDataStoreXPCServiceGlue__handleLaunchServicesUpdates_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_resetRole:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  os_unfair_lock_s *p_lock;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  PBFLogReaper();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v6;
    _os_log_impl(&dword_1CB9FA000, v9, OS_LOG_TYPE_INFO, "Resetting role %{public}@", buf, 0xCu);
  }

  v13 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_dataStoreWithError:](self, "_lock_dataStoreWithError:", &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v13;
  if (!v11)
  {
    v12 = 0;
    objc_msgSend(v10, "resetRole:error:", v6, &v12);
    v11 = v12;
  }
  os_unfair_lock_unlock(p_lock);
  if (v7)
    v7[2](v7, v11);

}

- (void)_lock_runLegacyMigration
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  uint8_t v9[16];

  +[PBFWallpaperKitBridge defaultBridge](PBFWallpaperKitBridge, "defaultBridge");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dataMigratorDeterminedLegacyWallpaperMigrationRequired");

  if (v4)
  {
    PBFLogMigration();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_DEFAULT, "Data migrator requested posterboard data store be reset so that a legacy wallpaper migration can occur.", v9, 2u);
    }

    -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_reapEntirePosterBoardDataStore](self, "_lock_reapEntirePosterBoardDataStore");
    -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_reapTransientData:](self, "_lock_reapTransientData:", 1);
    +[PBFWallpaperKitBridge defaultBridge](PBFWallpaperKitBridge, "defaultBridge");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clearLegacyWallpaperMigrationKeys");

  }
  v7 = objc_alloc_init(MEMORY[0x1E0D652A0]);
  objc_msgSend(v7, "performMigrationWithFailureHandler:", &__block_literal_global_73);
  objc_msgSend(v7, "setWallpaperMode:", 2);
  objc_msgSend(v7, "performMigrationWithFailureHandler:", &__block_literal_global_75);
  objc_msgSend(v7, "dataStores");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &__block_literal_global_78);

}

void __69__PBFPosterExtensionDataStoreXPCServiceGlue__lock_runLegacyMigration__block_invoke()
{
  NSObject *v0;

  PBFLogMigration();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __69__PBFPosterExtensionDataStoreXPCServiceGlue__lock_runLegacyMigration__block_invoke_cold_1();

}

void __69__PBFPosterExtensionDataStoreXPCServiceGlue__lock_runLegacyMigration__block_invoke_74()
{
  NSObject *v0;

  PBFLogMigration();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __69__PBFPosterExtensionDataStoreXPCServiceGlue__lock_runLegacyMigration__block_invoke_74_cold_1();

}

uint64_t __69__PBFPosterExtensionDataStoreXPCServiceGlue__lock_runLegacyMigration__block_invoke_76(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cleanup");
}

- (void)_lock_reapTransientData:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSObject *v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  __int128 v22;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  NSObject *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (self->_lock_dataStore)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Deleting the transient data underlying the data store while it is still very much in use will not end well."));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_reapTransientData:].cold.1();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAE124CLL);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "pbf_bootInstanceIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E98];
  PFTemporaryDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:isDirectory:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v4;
  objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v7, MEMORY[0x1E0C9AA60], 5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v27;
    *(_QWORD *)&v11 = 138543618;
    v22 = v11;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v15, "lastPathComponent", v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "hasPrefix:", CFSTR("TransientInfo")))
        {
          if (a3 || (objc_msgSend(v16, "containsString:", v23) & 1) != 0)
          {
            PBFLogReaper();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543362;
              v31 = v15;
              _os_log_impl(&dword_1CB9FA000, v17, OS_LOG_TYPE_INFO, "Deleting transient info: %{public}@", buf, 0xCu);
            }

            v25 = 0;
            v18 = objc_msgSend(v24, "removeItemAtURL:error:", v15, &v25);
            v19 = v25;
            if ((v18 & 1) == 0)
            {
              PBFLogReaper();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v22;
                v31 = v15;
                v32 = 2114;
                v33 = v19;
                _os_log_error_impl(&dword_1CB9FA000, v20, OS_LOG_TYPE_ERROR, "Unable to delete transient info %{public}@: %{public}@", buf, 0x16u);
              }

            }
          }
          else
          {
            PBFLogReaper();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v31 = v15;
              _os_log_debug_impl(&dword_1CB9FA000, v19, OS_LOG_TYPE_DEBUG, "Skipping deletion of transient info for '%{public}@'; is valid for current boot identifier.",
                buf,
                0xCu);
            }
          }

        }
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v12);
  }

}

- (void)_lock_fixFileProtections
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[PBFPosterExtensionDataStoreXPCServiceGlue _baseDataStoreURL](self, "_baseDataStoreURL");
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "pbf_dataStoreExtensionContainerURLForBaseURL:version:", v2, +[PBFPosterExtensionDataStore dataStoreVersion](PBFPosterExtensionDataStore, "dataStoreVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _PBFExtensionStoreCoordinatorsForDataStoreExtensionContainerURL(v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_84);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)v2;
  objc_msgSend(v5, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v2, MEMORY[0x1E0C9AA60], 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    v10 = *MEMORY[0x1E0C99940];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        PFFileProtectionNoneAttributes();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0;
        objc_msgSend(v13, "setAttributes:ofItemAtPath:error:", v14, v15, &v22);
        v16 = v22;

        if (v16)
        {
          PBFLogReaper();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v28 = v12;
            v29 = 2114;
            v30 = v16;
            _os_log_error_impl(&dword_1CB9FA000, v17, OS_LOG_TYPE_ERROR, "Unable to fix file attributes for %{public}@: %{public}@", buf, 0x16u);
          }

        }
        v21 = 0;
        objc_msgSend(v12, "pbf_setFileProtection:error:", v10, &v21);
        v18 = v21;

        if (v18)
        {
          PBFLogReaper();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v28 = v12;
            v29 = 2114;
            v30 = v18;
            _os_log_error_impl(&dword_1CB9FA000, v19, OS_LOG_TYPE_ERROR, "Unable to fix file protections for %{public}@: %{public}@", buf, 0x16u);
          }

        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v8);
  }

}

void __69__PBFPosterExtensionDataStoreXPCServiceGlue__lock_fixFileProtections__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;

  v4 = a2;
  v2 = (id)objc_msgSend(v4, "setupEnvironmentIfNecessary");
  v3 = (id)objc_msgSend(v4, "ensureFileSystemIntegrity");
  objc_msgSend(v4, "invalidate");

}

- (BOOL)_lock_reapSnapshots:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  int v18;
  BOOL v19;
  NSObject *v20;
  char v21;
  NSObject *v22;
  NSObject *v23;
  char v24;
  uint64_t v25;
  _BOOL4 v26;
  NSObject *v27;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  NSObject *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (self->_lock_dataStore)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Deleting data underlying the data store while it is still very much in use will not end well."));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_reapSnapshots:].cold.1();
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAE1AD0);
  }
  v3 = a3;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _baseDataStoreURL](self, "_baseDataStoreURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBFPosterExtensionDataStore dataStoreExtensionContainerURLForBaseURL:](PBFPosterExtensionDataStore, "dataStoreExtensionContainerURLForBaseURL:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v5;
  objc_msgSend(v33, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, 0, 4, &__block_literal_global_88);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PBFLogReaper();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v41) = v3;
    _os_log_impl(&dword_1CB9FA000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to reap snapshots; will reap runtime snapshot? %{BOOL}u",
      buf,
      8u);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v9)
  {
    v10 = v9;
    v30 = v4;
    v32 = 0;
    v11 = *(_QWORD *)v37;
    while (1)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v37 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v12);
        if (objc_msgSend(v13, "pbf_isPosterSnapshot", v30))
        {
          if (!v3)
          {
            objc_msgSend(v13, "lastPathComponent");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "containsString:", CFSTR("RuntimeSnapshot-"));

            if (v15)
            {
              PBFLogReaper();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                v41 = v13;
                _os_log_impl(&dword_1CB9FA000, v16, OS_LOG_TYPE_INFO, "Skipping Reap of snapshot URL; runtime snapshots excluded %{public}@",
                  buf,
                  0xCu);
              }
              goto LABEL_30;
            }
          }
          PBFLogReaper();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v41 = v13;
            _os_log_impl(&dword_1CB9FA000, v23, OS_LOG_TYPE_INFO, "Reaping snapshot URL: %{public}@", buf, 0xCu);
          }

          v35 = 0;
          v24 = objc_msgSend(v33, "removeItemAtURL:error:", v13, &v35);
          v16 = v35;
          if ((v24 & 1) == 0)
          {
            PBFLogReaper();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              goto LABEL_33;
            goto LABEL_29;
          }
          goto LABEL_27;
        }
        objc_msgSend(v13, "pathExtension");
        v16 = objc_claimAutoreleasedReturnValue();
        if (!-[NSObject isEqualToString:](v16, "isEqualToString:", CFSTR("plist")))
          goto LABEL_30;
        objc_msgSend(v13, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "hasPrefix:", CFSTR("RuntimeSnapshot"));

        if (v18)
          v19 = !v3;
        else
          v19 = 1;
        if (!v19)
        {
          PBFLogReaper();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v41 = v13;
            _os_log_impl(&dword_1CB9FA000, v20, OS_LOG_TYPE_INFO, "Reaping snapshot metadata URL: %{public}@", buf, 0xCu);
          }

          v34 = 0;
          v21 = objc_msgSend(v33, "removeItemAtURL:error:", v13, &v34);
          v16 = v34;
          if ((v21 & 1) == 0)
          {
            PBFLogReaper();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
LABEL_33:
              *(_DWORD *)buf = 138543618;
              v41 = v13;
              v42 = 2114;
              v43 = v16;
              _os_log_error_impl(&dword_1CB9FA000, v22, OS_LOG_TYPE_ERROR, "FAILED Reaping snapshot URL @ %{public}@: %{public}@", buf, 0x16u);
            }
LABEL_29:

LABEL_30:
            goto LABEL_31;
          }
LABEL_27:
          v32 = 1;
          goto LABEL_30;
        }
LABEL_31:
        ++v12;
      }
      while (v10 != v12);
      v25 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      v10 = v25;
      if (!v25)
      {

        if ((v32 & 1) != 0)
        {
          +[PBFPosterSnapshotReservation noteAllSnapshotsWereReaped](PBFPosterSnapshotReservation, "noteAllSnapshotsWereReaped");
          v26 = 1;
        }
        else
        {
          v26 = 0;
        }
        v4 = v30;
        goto LABEL_40;
      }
    }
  }

  v26 = 0;
LABEL_40:
  PBFLogReaper();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v41) = v26;
    _os_log_impl(&dword_1CB9FA000, v27, OS_LOG_TYPE_DEFAULT, "Did reap snapshots? %{BOOL}u", buf, 8u);
  }

  return v26;
}

uint64_t __65__PBFPosterExtensionDataStoreXPCServiceGlue__lock_reapSnapshots___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  PBFLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __65__PBFPosterExtensionDataStoreXPCServiceGlue__lock_reapSnapshots___block_invoke_cold_1();

  return 1;
}

- (void)_lock_reapDescriptors
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

uint64_t __66__PBFPosterExtensionDataStoreXPCServiceGlue__lock_reapDescriptors__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  PBFLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __66__PBFPosterExtensionDataStoreXPCServiceGlue__lock_reapDescriptors__block_invoke_cold_1();

  return 1;
}

- (void)_lock_reapExtensionProviderInfo
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

uint64_t __76__PBFPosterExtensionDataStoreXPCServiceGlue__lock_reapExtensionProviderInfo__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  PBFLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__PBFPosterExtensionDataStoreXPCServiceGlue__lock_reapExtensionProviderInfo__block_invoke_cold_1();

  return 1;
}

- (void)_lock_reapTemporaryDirectory
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  __int128 v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(MEMORY[0x1E0C99E98], "pf_temporaryDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v3, 0, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v16;
    *(_QWORD *)&v6 = 138543618;
    v13 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v14 = 0;
        objc_msgSend(v2, "removeItemAtURL:error:", v10, &v14, v13);
        v11 = v14;
        if (v11)
        {
          PBFLogReaper();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v13;
            v20 = v10;
            v21 = 2112;
            v22 = v11;
            _os_log_error_impl(&dword_1CB9FA000, v12, OS_LOG_TYPE_ERROR, "Failed to reap item within temporary directory %{public}@: %@", buf, 0x16u);
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v7);
  }

}

- (void)_lock_reapGallery
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

- (void)_lock_reapEntirePosterBoardDataStore
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

+ (BOOL)_clearMigrationFlagsWithError:(id *)a3
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_setSnapshotsLocaleIdentifier:", 0);
  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_clearStashedDeviceType");
  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_snapshotsBuildVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_setSnapshotsBuildVersion:", 0);

  return v3 != 0;
}

- (BOOL)_migrationIsPending
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  int v11;
  char v12;
  char v13;
  BOOL v14;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_snapshotsBuildVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D016F8], "fromString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_stashedDeviceTypeOutOfSync");
  v7 = objc_msgSend(v5, "isSameAs:", v3);
  v8 = (void *)objc_opt_class();
  -[PBFPosterExtensionDataStoreXPCServiceGlue _baseDataStoreURL](self, "_baseDataStoreURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "_checkIfLanguageChangeOccurred:", v9);

  if ((objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_needsFileProtectionsReset") & 1) != 0)
    LOBYTE(v11) = 1;
  else
    v11 = objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_hasHadFileProtectionsReset") ^ 1;
  v12 = v7 ^ 1;
  if (!v5)
    v12 = 1;
  v13 = v11 | v6;
  if (((v12 | v10) & 1) != 0)
    v14 = 1;
  else
    v14 = v13;

  return v14;
}

- (BOOL)_lock_performNecessaryMigrationsForDataStoreAtURL:(id)a3 shouldForce:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  void (*v25)(_QWORD *, const __CFString *);
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  BOOL v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  void *v55;
  _QWORD aBlock[4];
  id v57;
  uint8_t buf[16];
  id v59[2];

  v5 = a4;
  v7 = a3;
  NSClassFromString(CFSTR("NSURL"));
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_performNecessaryMigrationsForDataStoreAtURL:shouldForce:error:].cold.1();
LABEL_50:
    objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAE3544);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSURLClass]"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_performNecessaryMigrationsForDataStoreAtURL:shouldForce:error:].cold.1();
    goto LABEL_50;
  }

  objc_msgSend(MEMORY[0x1E0D87C98], "pf_migrationRuntimeAssertionWithExplanation:", CFSTR("PosterBoard Migration Assertion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInvalidationHandler:", &__block_literal_global_113);
  v59[0] = 0;
  v50 = v8;
  objc_msgSend(v8, "acquireWithError:", v59);
  v9 = v59[0];
  PBFLogMigration();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v52 = v7;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_performNecessaryMigrationsForDataStoreAtURL:shouldForce:error:].cold.2(v9, v11);
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB9FA000, v11, OS_LOG_TYPE_INFO, "Migration RBSAssertion acquired", buf, 2u);
  }
  v51 = v9;

  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "stringRepresentation");
  v54 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_snapshotsBuildVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D016F8], "fromString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_opt_new();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__PBFPosterExtensionDataStoreXPCServiceGlue__lock_performNecessaryMigrationsForDataStoreAtURL_shouldForce_error___block_invoke_114;
  aBlock[3] = &unk_1E86F7978;
  v49 = v15;
  v57 = v49;
  v16 = _Block_copy(aBlock);
  v55 = v14;
  v17 = objc_msgSend(v14, "isSameAs:", v12);
  v18 = (void *)objc_opt_class();
  -[PBFPosterExtensionDataStoreXPCServiceGlue _baseDataStoreURL](self, "_baseDataStoreURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "_checkIfLanguageChangeOccurred:", v19);

  if ((objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_needsFileProtectionsReset") & 1) != 0)
    v21 = 1;
  else
    v21 = objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_hasHadFileProtectionsReset") ^ 1;
  v22 = objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_stashedDeviceTypeOutOfSync");
  if (v55)
    v23 = v5;
  else
    v23 = 1;
  v24 = v23 | v17 ^ 1 | v20 | v21 | v22;
  v25 = (void (*)(_QWORD *, const __CFString *))v16[2];
  v48 = v24;
  if (v24 != 1)
  {
    v33 = (void *)v54;
    v25(v16, CFSTR("Data store migration not needed (current %@ vs stashed %@)."));
    v32 = v52;
    goto LABEL_41;
  }
  v26 = v22;
  v46 = v20;
  v25(v16, CFSTR("Data store migration initiated"));
  v44 = v13;
  ((void (*)(_QWORD *, const __CFString *))v16[2])(v16, CFSTR("current build version %@ vs stashed build version %@."));
  v27 = (void *)objc_opt_new();
  v43 = (void *)objc_opt_new();
  v28 = (void *)objc_opt_new();
  v45 = (void *)objc_opt_new();
  v47 = (void *)objc_opt_new();
  v53 = (void *)objc_opt_new();
  v29 = (void *)objc_opt_new();
  if (!objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_keynoteModeEnabled"))
  {
    if (!v5)
      goto LABEL_17;
LABEL_43:
    objc_msgSend(v27, "addObject:", CFSTR("migration forced"));
    objc_msgSend(v47, "addObject:", CFSTR("migration forced"));
    objc_msgSend(v53, "addObject:", CFSTR("migration forced"));
    objc_msgSend(v28, "addObject:", CFSTR("migration forced"));
    objc_msgSend(v29, "addObject:", CFSTR("migration forced"));
    if ((v17 & 1) != 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_setKeynoteModeEnabled:", 0);
  ((void (*)(_QWORD *, const __CFString *))v16[2])(v16, CFSTR("We are deleting the keynote mode here and moving on.  This is your problem, not my bug. (current %@ vs stashed %@)."));
  if (v5)
    goto LABEL_43;
LABEL_17:
  if ((v17 & 1) == 0)
  {
LABEL_18:
    objc_msgSend(v47, "addObject:", CFSTR("build version changed"));
    objc_msgSend(v53, "addObject:", CFSTR("build version changed"));
    objc_msgSend(v29, "addObject:", CFSTR("build version changed"));
  }
LABEL_19:
  v30 = v27;
  v31 = v28;
  if (v26)
  {
    objc_msgSend(v27, "addObject:", CFSTR("device changed"));
    objc_msgSend(v28, "addObject:", CFSTR("device changed"));
    objc_msgSend(v53, "addObject:", CFSTR("device changed"));
  }
  v13 = v44;
  if (v46)
  {
    objc_msgSend(v30, "addObject:", CFSTR("language change"));
    objc_msgSend(v43, "addObject:", CFSTR("language change"));
    objc_msgSend(v28, "addObject:", CFSTR("language change"));
    objc_msgSend(v45, "addObject:", CFSTR("language change"));
    objc_msgSend(v29, "addObject:", CFSTR("language change"));
  }
  if (v21)
  {
    objc_msgSend(v53, "addObject:", CFSTR("needsFileProtectionsMigration is true"));
    objc_msgSend(v29, "addObject:", CFSTR("needsFileProtectionsMigration is true"));
  }
  if (objc_msgSend(v53, "count"))
  {
    objc_msgSend(v53, "componentsJoinedByString:", CFSTR(","));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(_QWORD *, const __CFString *))v16[2])(v16, CFSTR("Running fixing file protection state for reasons: %@"));

    -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_fixFileProtections](self, "_lock_fixFileProtections");
    objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_setNeedsFileProtectionsReset:", 0);
    ((void (*)(_QWORD *, const __CFString *))v16[2])(v16, CFSTR("post fixing file protection state"));
  }
  if (objc_msgSend(v47, "count"))
  {
    objc_msgSend(v47, "componentsJoinedByString:", CFSTR(","));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(_QWORD *, const __CFString *))v16[2])(v16, CFSTR("Running legacy migration for reasons: %@"));

    -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_runLegacyMigration](self, "_lock_runLegacyMigration");
    ((void (*)(_QWORD *, const __CFString *))v16[2])(v16, CFSTR("Post running legacy migration"));
  }
  v32 = v52;
  if (objc_msgSend(v30, "count"))
  {
    objc_msgSend(v30, "componentsJoinedByString:", CFSTR(","));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(_QWORD *, const __CFString *))v16[2])(v16, CFSTR("Reaping snapshots for reasons: %@"));

    -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_reapSnapshots:](self, "_lock_reapSnapshots:", v46 ^ 1u);
    ((void (*)(_QWORD *, const __CFString *))v16[2])(v16, CFSTR("Reaped snapshot"));
  }
  if (objc_msgSend(v31, "count"))
  {
    objc_msgSend(v31, "componentsJoinedByString:", CFSTR(","));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(_QWORD *, const __CFString *))v16[2])(v16, CFSTR("Reaping gallery for reasons: %@"));

    -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_reapGallery](self, "_lock_reapGallery");
    ((void (*)(_QWORD *, const __CFString *))v16[2])(v16, CFSTR("Reaped gallery"));
  }
  if (objc_msgSend(v43, "count"))
  {
    objc_msgSend(v43, "componentsJoinedByString:", CFSTR(","));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(_QWORD *, const __CFString *))v16[2])(v16, CFSTR("Reaping descriptors for reasons: %@"));

    -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_reapDescriptors](self, "_lock_reapDescriptors");
    ((void (*)(_QWORD *, const __CFString *))v16[2])(v16, CFSTR("Reaped descriptors"));
  }
  if (objc_msgSend(v45, "count"))
  {
    objc_msgSend(v45, "componentsJoinedByString:", CFSTR(","));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(_QWORD *, const __CFString *))v16[2])(v16, CFSTR("Reaping extension provider info for reasons: %@"));

    -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_reapExtensionProviderInfo](self, "_lock_reapExtensionProviderInfo");
    ((void (*)(_QWORD *, const __CFString *))v16[2])(v16, CFSTR("Reaped extension provider info"));
  }
  -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_reapTransientData:](self, "_lock_reapTransientData:", 1);
  if (objc_msgSend(v29, "count"))
  {
    objc_msgSend(v29, "componentsJoinedByString:", CFSTR(","));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(_QWORD *, const __CFString *))v16[2])(v16, CFSTR("Reaping temp directory reasons: %@"));

    -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_reapTemporaryDirectory](self, "_lock_reapTemporaryDirectory");
    ((void (*)(_QWORD *, const __CFString *))v16[2])(v16, CFSTR("Reaped temp directory"));
  }
  -[PBFPosterExtensionDataStoreXPCServiceGlue _migration_updateStashedIdentifiers](self, "_migration_updateStashedIdentifiers");
  v33 = (void *)v54;
  ((void (*)(_QWORD *, const __CFString *))v16[2])(v16, CFSTR("Data store migration finished (stashed %@ -> current %@)."));

LABEL_41:
  objc_msgSend(v50, "invalidate");

  return v48;
}

void __113__PBFPosterExtensionDataStoreXPCServiceGlue__lock_performNecessaryMigrationsForDataStoreAtURL_shouldForce_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PBFLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "descriptionWithMultilinePrefix:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1CB9FA000, v4, OS_LOG_TYPE_DEFAULT, "Migration RBSAssertion invalidated: %{public}@", (uint8_t *)&v6, 0xCu);

  }
}

void __113__PBFPosterExtensionDataStoreXPCServiceGlue__lock_performNecessaryMigrationsForDataStoreAtURL_shouldForce_error___block_invoke_114(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v10;
  id v11;
  __CFString *v12;
  NSObject *v13;
  const __CFString *v14;
  uint8_t buf[4];
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = (objc_class *)MEMORY[0x1E0CB3940];
  v11 = a2;
  v12 = (__CFString *)objc_msgSend([v10 alloc], "initWithFormat:arguments:", v11, &a9);

  PBFLogMigration();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v12;
    _os_log_impl(&dword_1CB9FA000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  if (v12)
    v14 = v12;
  else
    v14 = CFSTR("(null entry)");
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);

}

+ (BOOL)_checkIfLanguageChangeOccurred:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PBFPosterGalleryLayoutPersistence *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v13[16];

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_snapshotsLocaleDidChange") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_snapshotsLocaleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[PBFPosterExtensionDataStore galleryCacheURLForBaseURL:](PBFPosterExtensionDataStore, "galleryCacheURLForBaseURL:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PBFPosterGalleryLayoutPersistence initWithURL:]([PBFPosterGalleryLayoutPersistence alloc], "initWithURL:", v4);
      -[PBFPosterGalleryLayoutPersistence loadNewestUsableGalleryLayoutReturningError:](v8, "loadNewestUsableGalleryLayoutReturningError:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "locale");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localeIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {

        LOBYTE(v4) = 0;
        goto LABEL_9;
      }
      PBFLogMigration();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1CB9FA000, v11, OS_LOG_TYPE_DEFAULT, "Found gallery; using gallery locale to populate stashedLocaleIdentifier",
          v13,
          2u);
      }

      objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_setSnapshotsLocaleIdentifier:", v7);
    }
    LODWORD(v4) = objc_msgSend(v7, "isEqualToString:", v6) ^ 1;

LABEL_9:
    goto LABEL_10;
  }
  LOBYTE(v4) = 1;
LABEL_10:

  return (char)v4;
}

- (void)_migration_updateStashedIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_setSnapshotsLocaleIdentifier:", v2);
  v3 = (void *)MEMORY[0x1E0C99EA0];
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "stringRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pbf_setSnapshotsBuildVersion:", v5);

  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_setSnapshotsLocaleDidChange:", 0);
  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_updateStashedDeviceType");

}

- (void)_localeDidChange:(id)a3
{
  NSObject *v4;
  NSObject *v5;

  PBFLogMigration();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[PBFPosterExtensionDataStoreXPCServiceGlue _localeDidChange:].cold.2();

  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_setSnapshotsLocaleDidChange:", 1);
  -[PRSServer invalidate](self->_server, "invalidate");
  os_unfair_lock_lock(&self->_lock);
  -[PBFPosterExtensionDataStore cancel](self->_lock_dataStore, "cancel");
  os_unfair_lock_unlock(&self->_lock);
  PBFLogMigration();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[PBFPosterExtensionDataStoreXPCServiceGlue _localeDidChange:].cold.1();

  if (_localeDidChange__onceToken != -1)
    dispatch_once(&_localeDidChange__onceToken, &__block_literal_global_172);
}

uint64_t __62__PBFPosterExtensionDataStoreXPCServiceGlue__localeDidChange___block_invoke()
{
  dispatch_source_t v0;
  void *v1;
  NSObject *v2;
  dispatch_time_t v3;
  NSObject *v4;

  v0 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, 0);
  v1 = (void *)PBFPosterExtensionDataStoreDidTearDownNotification_block_invoke_timerSource;
  PBFPosterExtensionDataStoreDidTearDownNotification_block_invoke_timerSource = (uint64_t)v0;

  v2 = PBFPosterExtensionDataStoreDidTearDownNotification_block_invoke_timerSource;
  v3 = dispatch_time(0, 1000000000);
  dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_source_set_event_handler((dispatch_source_t)PBFPosterExtensionDataStoreDidTearDownNotification_block_invoke_timerSource, &__block_literal_global_173);
  dispatch_resume((dispatch_object_t)PBFPosterExtensionDataStoreDidTearDownNotification_block_invoke_timerSource);
  PBFLogMigration();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__PBFPosterExtensionDataStoreXPCServiceGlue__localeDidChange___block_invoke_cold_1();

  return xpc_transaction_exit_clean();
}

void __62__PBFPosterExtensionDataStoreXPCServiceGlue__localeDidChange___block_invoke_2()
{
  NSObject *v0;
  NSObject *v1;
  uint8_t v2[16];
  uint8_t buf[16];

  PBFLogMigration();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CB9FA000, v0, OS_LOG_TYPE_ERROR, "[_localeDidChange] Second time calling xpc_transaction_exit_clean()", buf, 2u);
  }

  xpc_transaction_try_exit_clean();
  PBFLogMigration();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_error_impl(&dword_1CB9FA000, v1, OS_LOG_TYPE_ERROR, "[_localeDidChange] Hard Exit...", v2, 2u);
  }

  exit(0);
}

- (void)server:(id)a3 fetchPosterDescriptorsForExtension:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  v7 = a4;
  v8 = (void (**)(id, void *, id))a5;
  v14 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;
  if (v9)
  {
    v13 = 0;
    objc_msgSend(v9, "posterDescriptorsForExtensionBundleIdentifier:error:", v7, &v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13;

    v8[2](v8, v11, v12);
    v10 = v12;
  }
  else
  {
    v8[2](v8, 0, v10);
  }

}

- (void)server:(id)a3 fetchStaticPosterDescriptorsForExtension:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  v7 = a4;
  v8 = (void (**)(id, void *, id))a5;
  v14 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;
  if (v9)
  {
    v13 = 0;
    objc_msgSend(v9, "staticPosterDescriptorsForExtensionBundleIdentifier:error:", v7, &v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13;

    v8[2](v8, v11, v12);
    v10 = v12;
  }
  else
  {
    v8[2](v8, 0, v10);
  }

}

- (void)server:(id)a3 refreshPosterDescriptorsForExtension:(id)a4 sessionInfo:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v17 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v17;
  if (v12)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __112__PBFPosterExtensionDataStoreXPCServiceGlue_server_refreshPosterDescriptorsForExtension_sessionInfo_completion___block_invoke;
    v15[3] = &unk_1E86F79E0;
    v16 = v11;
    v14 = v13;
    objc_msgSend(v12, "reloadPosterDescriptorsForExtensionBundleIdentifier:sessionInfo:completion:", v9, v10, v15);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v11 + 2))(v11, 0, v17);
  }

}

uint64_t __112__PBFPosterExtensionDataStoreXPCServiceGlue_server_refreshPosterDescriptorsForExtension_sessionInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)server:(id)a3 deletePosterDescriptorsForExtension:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, id);
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v7 = a4;
  v8 = (void (**)(id, id))a5;
  v13 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;
  if (v9)
  {
    v12 = 0;
    objc_msgSend(v9, "deletePosterDescriptorsForExtensionBundleIdentifier:error:", v7, &v12);
    v11 = v12;

    v10 = v11;
  }
  v8[2](v8, v10);

}

- (void)server:(id)a3 fetchExtensionIdentifiersWithCompletion:(id)a4
{
  void (**v5)(id, uint64_t, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = (void (**)(id, uint64_t, _QWORD))a4;
  v12 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "knownExtensions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bs_mapNoNulls:", &__block_literal_global_176);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = v9;
    else
      v11 = MEMORY[0x1E0C9AA60];
    v5[2](v5, v11, 0);

  }
  else
  {
    v5[2](v5, 0, v12);
  }

}

uint64_t __92__PBFPosterExtensionDataStoreXPCServiceGlue_server_fetchExtensionIdentifiersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "posterExtensionBundleIdentifier");
}

- (void)server:(id)a3 fetchPosterSnapshotsWithRequest:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, uint64_t);
  void *v9;
  void *v10;
  uint64_t v11;

  v7 = a4;
  v11 = 0;
  v8 = (void (**)(id, _QWORD, uint64_t))a5;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "fetchPosterSnapshotsWithClientRequest:completion:", v7, v8);
  else
    v8[2](v8, 0, v11);

}

- (void)server:(id)a3 pushPosterGalleryUpdate:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  void *v9;
  void *v10;
  uint64_t v11;

  v7 = a4;
  v8 = (void (**)(id, _QWORD))a5;
  v11 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v7, "posterBoardRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateGallery:completion:", v10, v8);

  }
  else
  {
    v8[2](v8, v11);
  }

}

- (void)server:(id)a3 pushToProactiveWithCompletion:(id)a4
{
  void (**v5)(id, _QWORD);
  void *v6;
  void *v7;
  uint64_t v8;

  v8 = 0;
  v5 = (void (**)(id, _QWORD))a4;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "pushToProactiveWithCompletion:", v5);
  else
    v5[2](v5, v8);

}

- (void)server:(id)a3 fetchGallery:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a4;
  v11 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__PBFPosterExtensionDataStoreXPCServiceGlue_server_fetchGallery___block_invoke;
    v9[3] = &unk_1E86F7598;
    v10 = v5;
    v8 = v7;
    objc_msgSend(v6, "fetchGalleryConfigurationWithOptions:completion:", 4, v9);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v5 + 2))(v5, 0, 0, 0, v11);
  }

}

void __65__PBFPosterExtensionDataStoreXPCServiceGlue_server_fetchGallery___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = a5;
  v10 = a3;
  objc_msgSend(a2, "proactiveRepresentation");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, uint64_t, id))(v8 + 16))(v8, v11, v10, a4, v9);

}

- (void)server:(id)a3 retrieveGallery:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a4;
  v11 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__PBFPosterExtensionDataStoreXPCServiceGlue_server_retrieveGallery___block_invoke;
    v9[3] = &unk_1E86F7598;
    v10 = v5;
    v8 = v7;
    objc_msgSend(v6, "fetchGalleryConfigurationWithOptions:completion:", 2, v9);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v5 + 2))(v5, 0, 0, 0, v11);
  }

}

void __68__PBFPosterExtensionDataStoreXPCServiceGlue_server_retrieveGallery___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = a5;
  v10 = a3;
  objc_msgSend(a2, "proactiveRepresentation");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, uint64_t, id))(v8 + 16))(v8, v11, v10, a4, v9);

}

- (void)server:(id)a3 createPosterConfigurationForProviderIdentifier:(id)a4 posterDescriptorIdentifier:(id)a5 role:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v20 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v20;
  if (v15)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __142__PBFPosterExtensionDataStoreXPCServiceGlue_server_createPosterConfigurationForProviderIdentifier_posterDescriptorIdentifier_role_completion___block_invoke;
    v18[3] = &unk_1E86F7A28;
    v19 = v14;
    v17 = v16;
    objc_msgSend(v15, "createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:", v11, v12, v13, v18);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v14 + 2))(v14, 0, v20);
  }

}

uint64_t __142__PBFPosterExtensionDataStoreXPCServiceGlue_server_createPosterConfigurationForProviderIdentifier_posterDescriptorIdentifier_role_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)server:(id)a3 refreshPosterConfigurationMatchingUUID:(id)a4 sessionInfo:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v17 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v17;
  if (v12)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __114__PBFPosterExtensionDataStoreXPCServiceGlue_server_refreshPosterConfigurationMatchingUUID_sessionInfo_completion___block_invoke;
    v15[3] = &unk_1E86F7A28;
    v16 = v11;
    v14 = v13;
    objc_msgSend(v12, "refreshPosterConfigurationMatchingUUID:sessionInfo:completion:", v9, v10, v15);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v11 + 2))(v11, 0, v17);
  }

}

uint64_t __114__PBFPosterExtensionDataStoreXPCServiceGlue_server_refreshPosterConfigurationMatchingUUID_sessionInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)server:(id)a3 associateConfigurationMatchingUUID:(id)a4 focusModeActivityUUID:(id)a5 completion:(id)a6
{
  id v9;
  void (**v10)(id, id);
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void (**v29)(id, id);
  uint64_t v30;
  void *j;
  void *v32;
  void *v33;
  int v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  const __CFString **v46;
  uint64_t *v47;
  void *v48;
  void (**v49)(id, id);
  id v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  uint64_t v64;
  const __CFString *v65;
  uint64_t v66;
  const __CFString *v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v53 = a4;
  v9 = a5;
  v10 = (void (**)(id, id))a6;
  v63 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v63);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v63;
  v13 = v12;
  if (v11)
  {
    v52 = v12;
    objc_msgSend(v11, "switcherConfiguration");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    objc_msgSend(v51, "configurations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    if (v15)
    {
      v16 = v15;
      v48 = v11;
      v49 = v10;
      v17 = *(_QWORD *)v60;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v60 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          objc_msgSend(v19, "_path", v48);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "serverIdentity");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "posterUUID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isEqual:", v53);

          if (v23)
          {
            v24 = v19;
            goto LABEL_12;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
        if (v16)
          continue;
        break;
      }
      v24 = 0;
LABEL_12:
      v11 = v48;
      v10 = v49;
    }
    else
    {
      v24 = 0;
    }

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc_msgSend(MEMORY[0x1E0D22368], "sharedActivityManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "availableActivities");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (id)objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
    if (v27)
    {
      v50 = v24;
      v28 = v11;
      v29 = v10;
      v30 = *(_QWORD *)v56;
      while (2)
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(_QWORD *)v56 != v30)
            objc_enumerationMutation(v26);
          v32 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)j);
          objc_msgSend(v32, "activityUniqueIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "isEqual:", v9);

          if (v34)
          {
            v27 = v32;
            goto LABEL_25;
          }
        }
        v27 = (id)objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
        if (v27)
          continue;
        break;
      }
LABEL_25:
      v10 = v29;
      v11 = v28;
      v24 = v50;
    }

    v13 = v52;
    if (v24)
    {
      if (v27)
      {
        v35 = objc_alloc(MEMORY[0x1E0D7FB08]);
        objc_msgSend(v27, "activityIdentifier");
        v36 = v24;
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "activityUniqueIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)objc_msgSend(v35, "initWithActivityIdentifier:activityUUID:", v37, v38);

        v24 = v36;
        v40 = v51;
        v41 = (void *)objc_msgSend(v51, "mutableCopy");
        objc_msgSend(v41, "setFocusConfiguration:forPosterConfiguration:", v39, v36);
        v54 = 0;
        v42 = (id)objc_msgSend(v11, "updateDataStoreForSwitcherConfiguration:reason:error:", v41, CFSTR("associate focus mode with poster"), &v54);
        v43 = v54;

        v13 = v43;
LABEL_32:
        v10[2](v10, v43);

        goto LABEL_33;
      }
      v44 = (void *)MEMORY[0x1E0CB35C8];
      v64 = *MEMORY[0x1E0CB2D68];
      v65 = CFSTR("Invalid target activity for associateConfigurationMatchingUUID");
      v45 = (void *)MEMORY[0x1E0C99D80];
      v46 = &v65;
      v47 = &v64;
    }
    else
    {
      v44 = (void *)MEMORY[0x1E0CB35C8];
      v66 = *MEMORY[0x1E0CB2D68];
      v67 = CFSTR("Invalid target configuration for associateConfigurationMatchingUUID");
      v45 = (void *)MEMORY[0x1E0C99D80];
      v46 = &v67;
      v47 = &v66;
    }
    objc_msgSend(v45, "dictionaryWithObjects:forKeys:count:", v46, v47, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "pbf_generalErrorWithCode:userInfo:", 1, v39);
    v43 = (id)objc_claimAutoreleasedReturnValue();
    v41 = v43;
    v40 = v51;
    goto LABEL_32;
  }
  v10[2](v10, v12);
LABEL_33:

}

- (void)server:(id)a3 fetchPosterConfigurationsForRole:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  v7 = a4;
  v8 = (void (**)(id, void *, id))a5;
  v14 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;
  if (v9)
  {
    v13 = 0;
    objc_msgSend(v9, "posterConfigurationsForRole:error:", v7, &v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13;

    v8[2](v8, v11, v12);
    v10 = v12;
  }
  else
  {
    v8[2](v8, 0, v10);
  }

}

- (void)server:(id)a3 fetchPosterConfigurationsForExtension:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, void *, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v7 = a4;
  v8 = (void (**)(id, void *, _QWORD))a5;
  v12 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "posterConfigurationsForExtension:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v11, 0);

  }
  else
  {
    v8[2](v8, 0, v12);
  }

}

- (void)server:(id)a3 deletePosterConfigurationsMatchingUUID:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, id);
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v7 = a4;
  v8 = (void (**)(id, id))a5;
  v13 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;
  if (v9)
  {
    v12 = 0;
    objc_msgSend(v9, "deletePosterConfigurationsMatchingUUID:error:", v7, &v12);
    v11 = v12;

    v10 = v11;
  }
  v8[2](v8, v10);

}

- (void)server:(id)a3 exportPosterConfigurationMatchingUUID:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v7 = a4;
  v8 = (void (**)(id, void *, id))a5;
  v23 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v23;
  if (v9)
  {
    v22 = 0;
    objc_msgSend(v9, "exportPosterConfigurationMatchingUUID:error:", v7, &v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v22;

    if (v11)
    {
      v21 = v12;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v11, 1, &v21);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v21;

      v14 = objc_alloc_init(MEMORY[0x1E0CB3620]);
      v20 = 0;
      v15 = objc_msgSend(v14, "removeItemAtURL:error:", v11, &v20);
      v16 = v20;
      if ((v15 & 1) == 0)
      {
        PBFLogCommon();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[PBFPosterExtensionDataStoreXPCServiceGlue server:exportPosterConfigurationMatchingUUID:completion:].cold.1();

      }
      if (v13)
      {
        v18 = v13;
        v19 = 0;
      }
      else
      {
        v18 = 0;
        v19 = v10;
      }
      v8[2](v8, v18, v19);

    }
    else
    {
      v8[2](v8, 0, v12);
      v10 = v12;
    }

  }
  else
  {
    v8[2](v8, 0, v10);
  }

}

- (void)server:(id)a3 importPosterConfigurationFromArchiveData:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, uint64_t);
  void *v9;
  void *v10;
  uint64_t v11;

  v7 = a4;
  v11 = 0;
  v8 = (void (**)(id, _QWORD, uint64_t))a5;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "importPosterConfigurationFromArchiveData:completion:", v7, v8);
  else
    v8[2](v8, 0, v11);

}

- (void)server:(id)a3 refreshSnapshotForPosterConfigurationMatchUUID:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  v14 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __110__PBFPosterExtensionDataStoreXPCServiceGlue_server_refreshSnapshotForPosterConfigurationMatchUUID_completion___block_invoke;
    v12[3] = &unk_1E86F77F0;
    v13 = v8;
    v11 = v10;
    objc_msgSend(v9, "refreshSnapshotForPosterConfigurationMatchUUID:completion:", v7, v12);

  }
  else
  {
    (*((void (**)(id, id))v8 + 2))(v8, v14);
  }

}

uint64_t __110__PBFPosterExtensionDataStoreXPCServiceGlue_server_refreshSnapshotForPosterConfigurationMatchUUID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)server:(id)a3 notePosterConfigurationUnderlyingModelDidChange:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v6;
  void *v7;

  p_lock = &self->_lock;
  v6 = a4;
  os_unfair_lock_lock(p_lock);
  -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_dataStoreWithError:](self, "_lock_dataStoreWithError:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notePosterConfigurationUnderlyingModelDidChange:", v6);

  os_unfair_lock_unlock(p_lock);
}

- (void)server:(id)a3 ingestSnapshotCollection:(id)a4 forPosterConfigurationUUID:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, id);
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, id))a6;
  v16 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;
  if (v12)
  {
    v15 = 0;
    objc_msgSend(v12, "ingestSnapshotCollection:forPosterConfigurationUUID:error:", v9, v10, &v15);
    v14 = v15;

    v13 = v14;
  }
  v11[2](v11, v13);

}

- (void)server:(id)a3 fetchContentObstructionBoundsForPosterConfiguration:(id)a4 orientation:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *, void *);
  void *v13;
  void *v14;
  const __CFString **v15;
  uint64_t *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *, void *))a6;
  if ((unint64_t)(a5 - 1) >= 4)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0CB2D68];
    v34[0] = CFSTR("orientation must be a valid UIDeviceOrientation.");
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = (const __CFString **)v34;
    v16 = &v33;
  }
  else
  {
    if (-[PBFPosterExtensionDataStoreXPCServiceGlue _hasValidConfigurationForPoster:](self, "_hasValidConfigurationForPoster:", v11))
    {
      goto LABEL_7;
    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2D68];
    v32 = CFSTR("configuration must be a valid PRSPosterConfiguration.");
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = &v32;
    v16 = &v31;
  }
  objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pbf_generalErrorWithCode:userInfo:", 1, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_10;
  }
LABEL_7:
  -[PBFPosterExtensionDataStoreXPCServiceGlue _screenBoundsForOrientation:](self, "_screenBoundsForOrientation:", a5);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[CSProminentLayoutController tightFrameForElements:withBoundingRect:](self->_layoutController, "tightFrameForElements:withBoundingRect:", 3);
  -[PBFPosterExtensionDataStoreXPCServiceGlue _normalizedBounds:forScreenBounds:](self, "_normalizedBounds:forScreenBounds:");
  objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGRect:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObject:", v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PBFPosterExtensionDataStoreXPCServiceGlue _hasComplicationsForPosterConfiguration:](self, "_hasComplicationsForPosterConfiguration:", v11))
  {
    -[CSProminentLayoutController tightFrameForElements:withBoundingRect:](self->_layoutController, "tightFrameForElements:withBoundingRect:", 8, v21, v23, v25, v27);
    -[PBFPosterExtensionDataStoreXPCServiceGlue _normalizedBounds:forScreenBounds:](self, "_normalizedBounds:forScreenBounds:");
    objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGRect:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "arrayByAddingObject:", v29);
    v30 = objc_claimAutoreleasedReturnValue();

    v18 = 0;
    v19 = (void *)v30;
  }
  else
  {
    v18 = 0;
  }
LABEL_10:
  v12[2](v12, v19, v18);

}

- (void)server:(id)a3 fetchMaximalContentCutoutBoundsForOrientation:(int64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *, void *);
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *, void *))a5;
  if ((unint64_t)(a4 - 1) < 4)
    goto LABEL_4;
  v10 = (void *)MEMORY[0x1E0CB35C8];
  v18 = *MEMORY[0x1E0CB2D68];
  v19[0] = CFSTR("orientation must be a valid UIDeviceOrientation.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pbf_generalErrorWithCode:userInfo:", 1, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v15 = *MEMORY[0x1E0C9D628];
    v16 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  }
  else
  {
LABEL_4:
    -[PBFPosterExtensionDataStoreXPCServiceGlue _prominentObstructionForOrientation:showingComplications:](self, "_prominentObstructionForOrientation:showingComplications:", a4, 0);
    -[PBFPosterExtensionDataStoreXPCServiceGlue _cutoutBoundsForObstructionBounds:orientation:](self, "_cutoutBoundsForObstructionBounds:orientation:", a4);
    -[PBFPosterExtensionDataStoreXPCServiceGlue _normalizedBounds:orientation:](self, "_normalizedBounds:orientation:", a4);
    v12 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGRect:", v15, v16, v13, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v17, v12);

}

- (void)server:(id)a3 fetchContentCutoutBoundsForPosterConfiguration:(id)a4 orientation:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *, void *);
  void *v13;
  void *v14;
  const __CFString **v15;
  uint64_t *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *, void *))a6;
  if ((unint64_t)(a5 - 1) >= 4)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2D68];
    v27[0] = CFSTR("orientation must be a valid UIDeviceOrientation.");
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = (const __CFString **)v27;
    v16 = &v26;
  }
  else
  {
    if (-[PBFPosterExtensionDataStoreXPCServiceGlue _hasValidConfigurationForPoster:](self, "_hasValidConfigurationForPoster:", v11))
    {
LABEL_7:
      -[PBFPosterExtensionDataStoreXPCServiceGlue _prominentObstructionForConfiguration:orientation:](self, "_prominentObstructionForConfiguration:orientation:", v11, a5);
      -[PBFPosterExtensionDataStoreXPCServiceGlue _cutoutBoundsForObstructionBounds:orientation:](self, "_cutoutBoundsForObstructionBounds:orientation:", a5);
      -[PBFPosterExtensionDataStoreXPCServiceGlue _normalizedBounds:orientation:](self, "_normalizedBounds:orientation:", a5);
      v18 = 0;
      goto LABEL_8;
    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D68];
    v25 = CFSTR("configuration must be a valid PRSPosterConfiguration.");
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = &v25;
    v16 = &v24;
  }
  objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pbf_generalErrorWithCode:userInfo:", 1, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
    goto LABEL_7;
  v19 = *MEMORY[0x1E0C9D628];
  v20 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v21 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v22 = *(double *)(MEMORY[0x1E0C9D628] + 24);
LABEL_8:
  objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGRect:", v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2](v12, v23, v18);

}

- (void)server:(id)a3 fetchObscurableBoundsForPosterConfiguration:(id)a4 orientation:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *, void *);
  void *v13;
  void *v14;
  const __CFString **v15;
  uint64_t *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _BOOL4 v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double MaxY;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v45;
  double v46;
  double v47;
  void *v48;
  double MinY;
  CGFloat v50;
  CGFloat recta;
  CGFloat v52;
  CGFloat v53;
  uint64_t v54;
  const __CFString *v55;
  uint64_t v56;
  _QWORD v57[2];
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v57[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *, void *))a6;
  if ((unint64_t)(a5 - 1) >= 4)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v56 = *MEMORY[0x1E0CB2D68];
    v57[0] = CFSTR("orientation must be a valid UIDeviceOrientation.");
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = (const __CFString **)v57;
    v16 = &v56;
  }
  else
  {
    if (-[PBFPosterExtensionDataStoreXPCServiceGlue _hasValidConfigurationForPoster:](self, "_hasValidConfigurationForPoster:", v11))
    {
      goto LABEL_7;
    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v54 = *MEMORY[0x1E0CB2D68];
    v55 = CFSTR("configuration must be a valid PRSPosterConfiguration.");
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = &v55;
    v16 = &v54;
  }
  objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pbf_generalErrorWithCode:userInfo:", 1, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = *MEMORY[0x1E0C9D628];
    v20 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v21 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v22 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    goto LABEL_12;
  }
LABEL_7:
  v23 = -[PBFPosterExtensionDataStoreXPCServiceGlue _hasComplicationsForPosterConfiguration:](self, "_hasComplicationsForPosterConfiguration:", v11);
  -[PBFPosterExtensionDataStoreXPCServiceGlue _prominentObstructionForConfiguration:orientation:](self, "_prominentObstructionForConfiguration:orientation:", v11, a5);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _screenBoundsForOrientation:](self, "_screenBoundsForOrientation:", a5);
  v36 = v32;
  v37 = v33;
  v38 = v34;
  v39 = v35;
  if (v23)
  {
    -[CSProminentLayoutController tightFrameForElements:withBoundingRect:](self->_layoutController, "tightFrameForElements:withBoundingRect:", 8, v32, v33, v34, v35);
    MaxY = CGRectGetMaxY(v58);
  }
  else
  {
    -[CSProminentLayoutController tightFrameForElements:withBoundingRect:](self->_layoutController, "tightFrameForElements:withBoundingRect:", 1, v32, v33, v34, v35);
    v52 = v27;
    v53 = v25;
    x = v59.origin.x;
    y = v59.origin.y;
    v50 = v31;
    recta = v29;
    width = v59.size.width;
    height = v59.size.height;
    MinY = CGRectGetMinY(v59);
    v60.origin.x = x;
    v60.origin.y = y;
    v60.size.width = width;
    v60.size.height = height;
    v45 = CGRectGetHeight(v60);
    v61.size.height = v50;
    MaxY = MinY + v45 * 0.75;
    v61.origin.y = v52;
    v61.origin.x = v53;
    v61.size.width = recta;
    v46 = CGRectGetMaxY(v61);
    if (MaxY >= v46)
      MaxY = v46;
  }
  v62.origin.x = v36;
  v62.origin.y = v37;
  v62.size.width = v38;
  v62.size.height = v39;
  v47 = CGRectGetWidth(v62);
  v63.origin.x = v36;
  v63.origin.y = v37;
  v63.size.width = v38;
  v63.size.height = v39;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _normalizedBounds:forScreenBounds:](self, "_normalizedBounds:forScreenBounds:", 0.0, MaxY, v47, CGRectGetHeight(v63) - MaxY, v36, v37, v38, v39);
  v18 = 0;
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGRect:", v19, v20, v21, v22, *(_QWORD *)&MinY);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2](v12, v48, v18);

}

- (void)server:(id)a3 fetchLimitedOcclusionBoundsForPosterConfiguration:(id)a4 orientation:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *, _QWORD);
  void *v13;
  void *v14;
  const __CFString **v15;
  uint64_t *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  _QWORD v30[2];
  CGRect v31;

  v30[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *, _QWORD))a6;
  if ((unint64_t)(a5 - 1) >= 4)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D68];
    v30[0] = CFSTR("orientation must be a valid UIDeviceOrientation.");
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = (const __CFString **)v30;
    v16 = &v29;
  }
  else
  {
    if (-[PBFPosterExtensionDataStoreXPCServiceGlue _hasValidConfigurationForPoster:](self, "_hasValidConfigurationForPoster:", v11))
    {
LABEL_7:
      -[PBFPosterExtensionDataStoreXPCServiceGlue _screenBoundsForOrientation:](self, "_screenBoundsForOrientation:", a5);
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      -[CSProminentLayoutController tightFrameForElements:withBoundingRect:](self->_layoutController, "tightFrameForElements:withBoundingRect:", 1);
      -[PBFPosterExtensionDataStoreXPCServiceGlue _normalizedBounds:forScreenBounds:](self, "_normalizedBounds:forScreenBounds:", v31.origin.x, v31.origin.y, v31.size.width, CGRectGetHeight(v31) * 0.75, v20, v22, v24, v26);
      objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGRect:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v18, 0);
      goto LABEL_8;
    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2D68];
    v28 = CFSTR("configuration must be a valid PRSPosterConfiguration.");
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = &v28;
    v16 = &v27;
  }
  objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pbf_generalErrorWithCode:userInfo:", 1, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
    goto LABEL_7;
  ((void (**)(id, void *, void *))v12)[2](v12, 0, v18);
LABEL_8:

}

- (BOOL)_hasValidConfigurationForPoster:(id)a3
{
  return a3 != 0;
}

- (BOOL)_hasComplicationsForPosterConfiguration:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  BOOL v7;
  id v9;

  v3 = a3;
  v9 = 0;
  objc_msgSend(v3, "pr_loadComplicationLayoutWithError:", &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v5)
  {
    PBFLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStoreXPCServiceGlue _hasComplicationsForPosterConfiguration:].cold.1(v3, (uint64_t)v5, v6);
    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "complications");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = -[NSObject count](v6, "count") != 0;
  }

  return v7;
}

- (CGRect)_screenBoundsForOrientation:(int64_t)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double Width;
  double Height;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v22.origin.x = v6;
  v22.origin.y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  Width = CGRectGetWidth(v22);
  v23.origin.x = v6;
  v23.origin.y = v8;
  v23.size.width = v10;
  v23.size.height = v12;
  Height = CGRectGetHeight(v23);
  if (Width >= Height)
    v15 = Width;
  else
    v15 = Height;
  v24.origin.x = v6;
  v24.origin.y = v8;
  v24.size.width = v10;
  v24.size.height = v12;
  v16 = CGRectGetWidth(v24);
  v25.origin.x = v6;
  v25.origin.y = v8;
  v25.size.width = v10;
  v25.size.height = v12;
  v17 = CGRectGetHeight(v25);
  if (v16 < v17)
    v17 = v16;
  if ((unint64_t)(a3 - 1) >= 2)
    v18 = v15;
  else
    v18 = v17;
  if ((unint64_t)(a3 - 1) >= 2)
    v19 = v17;
  else
    v19 = v15;
  v20 = 0.0;
  v21 = 0.0;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)_cutoutBoundsForObstructionBounds:(CGRect)a3 orientation:(int64_t)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double MaxY;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _screenBoundsForOrientation:](self, "_screenBoundsForOrientation:", a4);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  MaxY = CGRectGetMaxY(v22);
  v23.origin.x = v9;
  v23.origin.y = v11;
  v23.size.width = v13;
  v23.size.height = v15;
  v17 = CGRectGetWidth(v23);
  v24.origin.x = v9;
  v24.origin.y = v11;
  v24.size.width = v13;
  v24.size.height = v15;
  v18 = CGRectGetHeight(v24) - MaxY;
  v19 = 0.0;
  v20 = MaxY;
  v21 = v17;
  result.size.height = v18;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)_normalizedBounds:(CGRect)a3 orientation:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _screenBoundsForOrientation:](self, "_screenBoundsForOrientation:", a4);
  -[PBFPosterExtensionDataStoreXPCServiceGlue _normalizedBounds:forScreenBounds:](self, "_normalizedBounds:forScreenBounds:", x, y, width, height, v9, v10, v11, v12);
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_normalizedBounds:(CGRect)a3 forScreenBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v17 = a3.size.height;
  v8 = a3.size.width;
  v9 = a3.origin.y;
  v10 = a3.origin.x;
  v11 = CGRectGetWidth(a4);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v12 = CGRectGetHeight(v18);
  v13 = v9 / v12;
  v14 = v8 / v11;
  v15 = v17 / v12;
  v16 = v10 / v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v16;
  return result;
}

- (CGRect)_prominentObstructionForConfiguration:(id)a3 orientation:(int64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[PBFPosterExtensionDataStoreXPCServiceGlue _prominentObstructionForOrientation:showingComplications:](self, "_prominentObstructionForOrientation:showingComplications:", a4, -[PBFPosterExtensionDataStoreXPCServiceGlue _hasComplicationsForPosterConfiguration:](self, "_hasComplicationsForPosterConfiguration:", a3));
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_prominentObstructionForOrientation:(int64_t)a3 showingComplications:(BOOL)a4
{
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  if (a4)
    v5 = 11;
  else
    v5 = 3;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _screenBoundsForOrientation:](self, "_screenBoundsForOrientation:", a3);
  -[CSProminentLayoutController tightFrameForElements:withBoundingRect:](self->_layoutController, "tightFrameForElements:withBoundingRect:", v5);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)server:(id)a3 updateToSelectedConfigurationMatchingUUID:(id)a4 role:(id)a5 from:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, id);
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(id, id))a7;
  v19 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v19;
  if (v15)
  {
    v18 = 0;
    objc_msgSend(v15, "updateSelectedPosterUUID:role:from:error:", v11, v12, v13, &v18);
    v17 = v18;

    v16 = v17;
  }
  v14[2](v14, v16);

}

- (void)server:(id)a3 fetchSelectedPosterForRole:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;

  v7 = a4;
  v8 = (void (**)(id, void *, id))a5;
  v15 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v9)
  {
    v14 = 0;
    objc_msgSend(v9, "selectedPosterForRole:error:", v7, &v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v14;

    objc_msgSend(v11, "_path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v8[2](v8, v13, v12);
    v10 = v12;
  }
  else
  {
    v8[2](v8, 0, v10);
  }

}

- (void)server:(id)a3 fetchActivePosterForRole:(id)a4 completion:(id)a5
{
  void (**v8)(id, void *, void *, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v8 = (void (**)(id, void *, void *, _QWORD))a5;
  v15 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue server:fetchActivePosterForRole:error:](self, "server:fetchActivePosterForRole:error:", a3, a4, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "lockScreenPosterConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "homeScreenPosterConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v8[2](v8, v14, v12, 0);
  }
  else
  {
    v8[2](v8, 0, 0, v15);
  }

}

- (id)server:(id)a3 fetchActivePosterForRole:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;

  v7 = a4;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v18 = 0;
    objc_msgSend(v8, "activePosterForRole:assocPoster:error:", v7, &v18, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = v18;
      objc_msgSend(v10, "_path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7F670]), "_initWithPath:", v12);
      if (v13)
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7F670]), "_initWithPath:", v13);
      else
        v15 = 0;
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7F640]), "initWithLockScreenPosterConfiguration:homeScreenPosterConfiguration:", v14, v15);

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)server:(id)a3 fetchFocusUUIDForConfiguration:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, id);
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v7 = a4;
  v8 = (void (**)(id, _QWORD, id))a5;
  v16 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  v11 = v10;
  if (!v9 || v10)
  {
    v8[2](v8, 0, v10);
  }
  else
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAD8]), "_initWithPath:", v7);
    v15 = 0;
    objc_msgSend(v12, "loadFocusConfigurationWithError:", &v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;
    objc_msgSend(v13, "activityUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, id))v8)[2](v8, v14, v11);

  }
}

- (void)server:(id)a3 removeAllFocusConfigurationsMatchingFocusUUID:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, id);
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void (**v27)(id, id);
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(id, id))a5;
  v33 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v33);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v33;
  v11 = v10;
  if (v9)
  {
    v24 = v10;
    v26 = v9;
    v27 = v8;
    objc_msgSend(v9, "switcherConfiguration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v25, "mutableCopy");
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v12, "configurations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v18, "loadFocusConfigurationWithError:", 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "activityUUID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqual:", v7);

          if (v21)
            objc_msgSend(v12, "setFocusConfiguration:forPosterConfiguration:", 0, v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v15);
    }

    v28 = 0;
    v9 = v26;
    v22 = (id)objc_msgSend(v26, "updateDataStoreForSwitcherConfiguration:reason:error:", v12, CFSTR("remove all focus configurations XPC"), &v28);
    v11 = v28;

    v8 = v27;
    if (v11)
    {
      PBFLogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionDataStoreXPCServiceGlue server:removeAllFocusConfigurationsMatchingFocusUUID:completion:].cold.1();

    }
    v27[2](v27, v11);

  }
  else
  {
    v8[2](v8, v10);
  }

}

- (void)server:(id)a3 notifyFocusModeDidChange:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, id);
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(id, id))a5;
  v16 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  v11 = v10;
  if (v9)
  {
    v15 = 0;
    objc_msgSend(v9, "updateDataStoreForIncomingFocusModeChange:error:", v7, &v15);
    v12 = v15;

    PBFLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionDataStoreXPCServiceGlue server:notifyFocusModeDidChange:completion:].cold.1();
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v7;
      _os_log_impl(&dword_1CB9FA000, v14, OS_LOG_TYPE_DEFAULT, "Successfully updated switcher configuration to match mode change to %{public}@", buf, 0xCu);
    }

  }
  else
  {
    v12 = v10;
  }
  v8[2](v8, v12);

}

- (void)server:(id)a3 notifyAvailableFocusModesDidChange:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, id);
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v7 = a4;
  v8 = (void (**)(id, id))a5;
  v13 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;
  if (v9)
  {
    v12 = 0;
    objc_msgSend(v9, "updateDataStoreForIncomingAvailableFocusModeChange:error:", v7, &v12);
    v11 = v12;

    v10 = v11;
  }
  v8[2](v8, v10);

}

- (void)server:(id)a3 notifyActiveChargerIdentifierDidUpdate:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, id);
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(id, id))a5;
  v16 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  v11 = v10;
  if (v9)
  {
    v15 = 0;
    objc_msgSend(v9, "updateDataStoreForIncomingActiveChargerIdentifierUpdate:error:", v7, &v15);
    v12 = v15;

    PBFLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionDataStoreXPCServiceGlue server:notifyActiveChargerIdentifierDidUpdate:completion:].cold.1();
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v7;
      _os_log_impl(&dword_1CB9FA000, v14, OS_LOG_TYPE_DEFAULT, "Successfully updated data store for activeChargerIdentifier update to %{public}@", buf, 0xCu);
    }

  }
  else
  {
    v12 = v10;
  }
  v8[2](v8, v12);

}

- (void)server:(id)a3 prewarmWithCompletion:(id)a4
{
  void (**v5)(id, _QWORD);
  void *v6;
  void *v7;
  uint64_t v8;

  v8 = 0;
  v5 = (void (**)(id, _QWORD))a4;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "prewarmWithCompletion:", v5);
  else
    v5[2](v5, v8);

}

- (void)server:(id)a3 overnightUpdateWithCompletion:(id)a4
{
  void (**v5)(id, _QWORD);
  void *v6;
  void *v7;
  uint64_t v8;

  v8 = 0;
  v5 = (void (**)(id, _QWORD))a4;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "overnightUpdateWithCompletion:", v5);
  else
    v5[2](v5, v8);

}

- (void)server:(id)a3 gatherDataFreshnessState:(id)a4
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *, _QWORD))a4;
  v10 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v11[0] = CFSTR("PBFDataComponentGallery");
    v11[1] = CFSTR("PBFDataComponentDynamicDescriptors");
    v11[2] = CFSTR("PBFDataComponentStaticDescriptors");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataFreshnessForComponents:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "freshnessDebugDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v5[2](v5, v9, 0);
  }
  else
  {
    v5[2](v5, 0, v10);
  }

}

- (void)server:(id)a3 refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:(id)a4 extensionIdentifier:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD);
  void *v12;
  void *v13;
  uint64_t v14;

  v9 = a4;
  v10 = a5;
  v14 = 0;
  v11 = (void (**)(id, _QWORD))a6;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:extensionIdentifier:completion:", v9, v10, v11);
  else
    v11[2](v11, v14);

}

- (void)server:(id)a3 fetchRuntimeAssertionState:(id)a4
{
  _QWORD *v5;
  id v6;
  void (*v7)(_QWORD *, _QWORD, id);
  id v8;
  os_unfair_lock_s *p_lock;
  id v10;
  id v11;

  v5 = a4;
  v11 = 0;
  v6 = -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v11);
  if (v11)
  {
    v7 = (void (*)(_QWORD *, _QWORD, id))v5[2];
    v8 = v11;
    v7(v5, 0, v8);
  }
  else
  {
    p_lock = &self->_lock;
    v10 = 0;
    os_unfair_lock_lock(&self->_lock);
    -[PBFRuntimeAssertionManager debugDescription](self->_lock_runtimeAssertionManager, "debugDescription");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(p_lock);
    ((void (*)(_QWORD *, id, _QWORD))v5[2])(v5, v8, 0);
  }

}

- (void)server:(id)a3 fetchAssociatedHomeScreenPosterConfigurationUUID:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, uint64_t);
  void *v9;
  void *v10;
  uint64_t v11;

  v7 = a4;
  v11 = 0;
  v8 = (void (**)(id, _QWORD, uint64_t))a5;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "fetchHomeScreenAssociatedPosterConfigurationForConfigurationUUID:completion:", v7, v8);
  else
    v8[2](v8, 0, v11);

}

- (void)server:(id)a3 runMigration:(BOOL)a4 migrationDescriptor:(id)a5 completion:(id)a6
{
  id v8;
  uint64_t v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  os_unfair_lock_s *p_lock;
  id v15;
  PBFPosterExtensionDataStoreMigrator *v16;
  void *v17;
  uint64_t v18;
  os_signpost_id_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  PBFPosterExtensionDataStoreIntrospector *v23;
  void *v24;
  PBFPosterExtensionDataStoreIntrospector *v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  unint64_t v34;
  NSObject *v35;
  NSObject *v36;
  id v37;
  void *v38;
  PBFPosterExtensionDataStoreMigrator *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  PBFPosterExtensionDataStoreIntrospector *v43;
  void *v44;
  PBFPosterExtensionDataStoreIntrospector *v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  unint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  unint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  NSObject *v80;
  void *v81;
  PBFPosterExtensionDataStoreXPCServiceGlue *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  NSObject *v89;
  id v90;
  void *v91;
  os_unfair_lock_s *v92;
  os_signpost_id_t spid;
  void (**v94)(id, _QWORD);
  unint64_t v95;
  void *v96;
  void *v97;
  _BOOL4 v98;
  PBFPosterExtensionDataStoreIntrospector *v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  id v105;
  id v106;
  id v107;
  id v108;
  uint8_t v109[128];
  uint8_t buf[4];
  NSObject *v111;
  uint64_t v112;

  v98 = a4;
  v112 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v94 = (void (**)(id, _QWORD))a6;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _baseDataStoreURL](self, "_baseDataStoreURL");
  v9 = objc_claimAutoreleasedReturnValue();
  PBFLogMigration();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  PBFLogMigration();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "Migration", ", buf, 2u);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v108 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_teardownDataStoreWithError:](self, "_lock_teardownDataStoreWithError:", &v108);
  v15 = v108;
  v16 = -[PBFPosterExtensionDataStoreMigrator initWithBaseURL:]([PBFPosterExtensionDataStoreMigrator alloc], "initWithBaseURL:", v9);
  -[PBFPosterExtensionDataStoreMigrator availableDataStoreVersions](v16, "availableDataStoreVersions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "lastIndex");

  v95 = v11 - 1;
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = v11;
    v20 = v8;
    v21 = (void *)v9;
    PBFLogMigration();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB9FA000, v22, OS_LOG_TYPE_DEFAULT, "Pre-migration; data store never ever initialized!",
        buf,
        2u);
    }
  }
  else
  {
    v90 = v8;
    v23 = [PBFPosterExtensionDataStoreIntrospector alloc];
    v21 = (void *)v9;
    objc_msgSend(MEMORY[0x1E0C99E98], "pbf_dataStoreURLForBaseURL:version:", v9, v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[PBFPosterExtensionDataStoreIntrospector initWithURL:error:](v23, "initWithURL:error:", v24, 0);
    v26 = -[PBFPosterExtensionDataStoreIntrospector numberOfPostersForRole:](v25, "numberOfPostersForRole:", *MEMORY[0x1E0D7FC58]);

    PBFLogMigration();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v111 = v26;
      _os_log_impl(&dword_1CB9FA000, v27, OS_LOG_TYPE_DEFAULT, "Pre-migration number of lock screen posters: %lu", buf, 0xCu);
    }

    PBFLogMigration();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v111 = v18;
      _os_log_impl(&dword_1CB9FA000, v22, OS_LOG_TYPE_DEFAULT, "Pre-migration data store version: %lu", buf, 0xCu);
    }
    v19 = v11;
    p_lock = &self->_lock;
    v20 = v90;
  }

  spid = v19;
  if (!v15)
  {
    v107 = 0;
    v29 = v21;
    -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_performNecessaryMigrationsForDataStoreAtURL:shouldForce:error:](self, "_lock_performNecessaryMigrationsForDataStoreAtURL:shouldForce:error:", v21, v98, &v107);
    v28 = v107;
    v30 = v20;
    if (v28)
      goto LABEL_15;
    v106 = 0;
    -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_dataStoreWithError:](self, "_lock_dataStoreWithError:", &v106);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v106;

    if (!v38)
      goto LABEL_15;
    v31 = v28;
    v39 = -[PBFPosterExtensionDataStoreMigrator initWithBaseURL:]([PBFPosterExtensionDataStoreMigrator alloc], "initWithBaseURL:", v29);
    -[PBFPosterExtensionDataStoreMigrator availableDataStoreVersions](v39, "availableDataStoreVersions");
    v40 = v29;
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "lastIndex");

    v43 = [PBFPosterExtensionDataStoreIntrospector alloc];
    v88 = v40;
    objc_msgSend(MEMORY[0x1E0C99E98], "pbf_dataStoreURLForBaseURL:version:", v40, v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = 0;
    v45 = -[PBFPosterExtensionDataStoreIntrospector initWithURL:error:](v43, "initWithURL:error:", v44, &v105);
    v89 = v105;

    v99 = v45;
    v46 = -[PBFPosterExtensionDataStoreIntrospector numberOfPostersForRole:](v45, "numberOfPostersForRole:", *MEMORY[0x1E0D7FC58]);
    PBFLogMigration();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v111 = v46;
      _os_log_impl(&dword_1CB9FA000, v47, OS_LOG_TYPE_DEFAULT, "Post-migration number of lock screen posters: %lu", buf, 0xCu);
    }

    PBFLogMigration();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v111 = v42;
      _os_log_impl(&dword_1CB9FA000, v48, OS_LOG_TYPE_DEFAULT, "Post-migration data store version: %lu", buf, 0xCu);
    }

    v29 = v88;
    if (v89)
    {
      PBFLogMigration();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v111 = v89;
        _os_log_impl(&dword_1CB9FA000, v49, OS_LOG_TYPE_DEFAULT, "Post-migration introspector error: %{public}@", buf, 0xCu);
      }
      v33 = v20;
      v34 = v95;
LABEL_66:

LABEL_67:
      v32 = v89;
      goto LABEL_18;
    }
    objc_msgSend(v20, "homeScreenTintColor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v20;
    v34 = v95;
    if (!v50)
    {
      objc_msgSend(v33, "isHomeScreenDim");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v50, "BOOLValue") & 1) == 0)
      {
        objc_msgSend(v33, "homeScreenIconStyle");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v51)
        {
          objc_msgSend(v33, "homeScreenIconSize");
          v81 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v81)
            goto LABEL_67;
          goto LABEL_42;
        }

      }
    }

LABEL_42:
    objc_msgSend(v33, "homeScreenTintColor");
    v49 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "isHomeScreenDim");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "homeScreenIconSize");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "homeScreenIconStyle");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterExtensionDataStoreIntrospector sortedPosterUUIDsForRole:error:](v99, "sortedPosterUUIDsForRole:error:", *MEMORY[0x1E0D7F950], 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v52, "count"))
    {
      v84 = v52;
      v82 = self;
      v53 = (void *)objc_opt_new();
      v54 = 0x1E0D7F000;
      v92 = p_lock;
      v83 = v31;
      if (v49)
      {
        -[NSObject UIColor](v49, "UIColor");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = (void *)objc_opt_new();
        objc_msgSend(v55, "setAccentColor:", v96);
        v56 = (void *)MEMORY[0x1E0D7F6B8];
        v57 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v55, "variation");
        objc_msgSend(v57, "numberWithDouble:");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v55, "saturation");
        objc_msgSend(v59, "numberWithDouble:");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v55, "luminance");
        objc_msgSend(v61, "numberWithDouble:");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "posterUpdateHomeScreenTintWithVariation:saturation:luminance:", v58, v60, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "bs_safeAddObject:", v63);

        v54 = 0x1E0D7F000uLL;
        v15 = 0;
        v34 = v95;

        v31 = v83;
      }
      v97 = v53;
      v64 = v54;
      if (v87)
      {
        objc_msgSend(*(id *)(v54 + 1720), "posterUpdateHomeScreenAppearanceDimWithValue:", objc_msgSend(v87, "BOOLValue"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "bs_safeAddObject:", v65);

      }
      if (v86)
      {
        v66 = *(void **)(v64 + 1720);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v86, "isEqual:", *MEMORY[0x1E0D7FBE0]));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "posterUpdateShouldUseLargeHomeScreenIcons:", v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "bs_safeAddObject:", v68);

      }
      if (v85)
      {
        objc_msgSend(*(id *)(v64 + 1720), "posterUpdateHomeScreenIconUserInterfaceStyle:");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "bs_safeAddObject:", v69);

      }
      if (objc_msgSend(v97, "count"))
      {
        v91 = v33;
        v103 = 0u;
        v104 = 0u;
        v101 = 0u;
        v102 = 0u;
        v70 = v52;
        v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v101, v109, 16);
        v72 = v97;
        if (v71)
        {
          v73 = v71;
          v74 = *(_QWORD *)v102;
          do
          {
            v75 = 0;
            do
            {
              if (*(_QWORD *)v102 != v74)
                objc_enumerationMutation(v70);
              -[PBFPosterExtensionDataStoreIntrospector posterWithUUID:](v99, "posterWithUUID:", *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * v75));
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v76, "_path");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0D7F700], "updaterForPath:", v77);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v100 = 0;
              objc_msgSend(v78, "applyUpdatesLocally:error:", v72, &v100);
              v79 = v100;
              if (v79)
              {
                PBFLogMigration();
                v80 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v111 = v79;
                  _os_log_error_impl(&dword_1CB9FA000, v80, OS_LOG_TYPE_ERROR, "tint color updates failed to apply: %{public}@", buf, 0xCu);
                }

                v72 = v97;
              }

              ++v75;
            }
            while (v73 != v75);
            v73 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v101, v109, 16);
          }
          while (v73);
        }

        v33 = v91;
        p_lock = v92;
        v34 = v95;
        v15 = 0;
        v31 = v83;
      }

      v29 = v88;
      self = v82;
      v52 = v84;
    }

    goto LABEL_66;
  }
  v28 = 0;
  v29 = v21;
  v30 = v20;
LABEL_15:
  v31 = v28;
  PBFLogMigration();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    -[PBFPosterExtensionDataStoreXPCServiceGlue server:runMigration:migrationDescriptor:completion:].cold.1();
  v33 = v30;
  v34 = v95;
LABEL_18:

  os_unfair_lock_unlock(p_lock);
  PBFLogMigration();
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v34 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v36, OS_SIGNPOST_INTERVAL_END, spid, "Migration", ", buf, 2u);
  }

  -[PBFPosterExtensionDataStoreXPCServiceGlue _postDidTearDownNotification](self, "_postDidTearDownNotification");
  if (v94)
  {
    if (v15)
      v37 = v15;
    else
      v37 = v31;
    ((void (**)(id, id))v94)[2](v94, v37);
  }

}

- (void)server:(id)a3 clearMigrationFlags:(id)a4
{
  void (**v4)(id, uint64_t, _QWORD);
  uint64_t v5;
  uint64_t v6;

  v4 = (void (**)(id, uint64_t, _QWORD))a4;
  v6 = 0;
  v5 = objc_msgSend((id)objc_opt_class(), "_clearMigrationFlagsWithError:", &v6);
  v4[2](v4, v5, v6);

}

- (void)server:(id)a3 updatePosterConfigurationMatchingUUID:(id)a4 updates:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v9 = a4;
  v10 = a5;
  v14 = 0;
  v11 = a6;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "updatePosterConfigurationMatchingUUID:updates:completion:", v9, v10, v11);
  else
    (*((void (**)(id, _QWORD, _QWORD, uint64_t))v11 + 2))(v11, 0, 0, v14);

}

- (void)server:(id)a3 updatePosterConfiguration:(id)a4 updates:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v20 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", &v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v20;
  if (v12)
  {
    if (v9)
    {
      v14 = objc_alloc(MEMORY[0x1E0D7FAD8]);
      objc_msgSend(v9, "_path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "_initWithPath:", v15);

      objc_msgSend(v12, "updatePosterConfiguration:updates:completion:", v16, v10, v11);
    }
    else
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0CB2D68];
      v22[0] = CFSTR("nil configuration specified");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pbf_generalErrorWithCode:userInfo:", 1, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v11 + 2))(v11, 0, 0, v19);

    }
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, id))v11 + 2))(v11, 0, 0, v13);
  }

}

- (void)server:(id)a3 fetchArchivedDataStoreNamesWithCompletion:(id)a4
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  PBFDataStoreArchiveAdjudicator *v7;
  void *v8;
  id v9;

  v5 = (void (**)(id, void *, _QWORD))a4;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _baseDataStoreURL](self, "_baseDataStoreURL");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "pbf_archivedDataStoreBaseURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PBFDataStoreArchiveAdjudicator initWithDataStoreBaseURL:archiveBaseURL:]([PBFDataStoreArchiveAdjudicator alloc], "initWithDataStoreBaseURL:archiveBaseURL:", v9, v6);
  -[PBFDataStoreArchiveAdjudicator archiveNames](v7, "archiveNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v8, 0);

}

- (void)_stashCurrentDataStoreWithName:(id)a3 url:(id)a4 options:(id)a5 withError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  PBFPosterExtensionDataStoreMigrator *v16;
  void *v17;
  uint64_t v18;
  PBFDataStoreArchiveAdjudicator *v19;
  PBFDataStoreArchiveAdjudicator *v20;
  id *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  os_unfair_lock_lock(&self->_lock);
  v30 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_teardownDataStoreWithError:](self, "_lock_teardownDataStoreWithError:", &v30);
  v13 = v30;
  if (v13)
  {
    os_unfair_lock_unlock(&self->_lock);
    *a6 = objc_retainAutorelease(v13);
  }
  else
  {
    v26 = a6;
    v27 = v10;
    -[PBFPosterExtensionDataStoreXPCServiceGlue _baseDataStoreURL](self, "_baseDataStoreURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "pbf_archivedDataStoreBaseURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PBFPosterExtensionDataStoreMigrator initWithBaseURL:]([PBFPosterExtensionDataStoreMigrator alloc], "initWithBaseURL:", v14);
    -[PBFPosterExtensionDataStoreMigrator archiveDataStoresBeforeCurrentDataStoreVersion](v16, "archiveDataStoresBeforeCurrentDataStoreVersion");
    -[PBFPosterExtensionDataStoreMigrator availableDataStoreVersions](v16, "availableDataStoreVersions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "lastIndex");

    v19 = -[PBFDataStoreArchiveAdjudicator initWithDataStoreBaseURL:archiveBaseURL:]([PBFDataStoreArchiveAdjudicator alloc], "initWithDataStoreBaseURL:archiveBaseURL:", v14, v15);
    v20 = v19;
    if (v11)
    {
      v28 = 0;
      v21 = (id *)&v28;
      v22 = -[PBFDataStoreArchiveAdjudicator archiveDataStoreVersion:toURL:options:removeAfterSuccess:error:](v19, "archiveDataStoreVersion:toURL:options:removeAfterSuccess:error:", v18, v11, v12, 0, &v28);
    }
    else
    {
      v29 = 0;
      v21 = (id *)&v29;
      v23 = -[PBFDataStoreArchiveAdjudicator archiveDataStoreVersion:name:options:removeAfterSuccess:error:](v19, "archiveDataStoreVersion:name:options:removeAfterSuccess:error:", v18, v27, v12, 0, &v29);
    }
    v24 = *v21;

    os_unfair_lock_unlock(&self->_lock);
    v25 = -[PBFPosterExtensionDataStoreXPCServiceGlue _dataStoreWithError:](self, "_dataStoreWithError:", 0);
    if (v24)
    {
      v10 = v27;
      if (v26)
        *v26 = objc_retainAutorelease(v24);
    }
    else
    {
      -[PBFPosterExtensionDataStoreXPCServiceGlue _postDidTearDownNotification](self, "_postDidTearDownNotification");
      v10 = v27;
    }

  }
}

- (void)server:(id)a3 stashCurrentDataStoreWithName:(id)a4 options:(id)a5 completion:(id)a6
{
  void (**v9)(id, _QWORD);
  uint64_t v10;

  v10 = 0;
  v9 = (void (**)(id, _QWORD))a6;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _stashCurrentDataStoreWithName:url:options:withError:](self, "_stashCurrentDataStoreWithName:url:options:withError:", a4, 0, a5, &v10);
  v9[2](v9, v10);

}

- (void)server:(id)a3 restoreArchivedDataStoreNamed:(id)a4 backupExistingDataStore:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v9;
  void (**v10)(id, id);
  id v11;
  void *v12;
  void *v13;
  PBFPosterExtensionDataStoreMigrator *v14;
  PBFDataStoreArchiveAdjudicator *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v7 = a5;
  v9 = a4;
  v10 = (void (**)(id, id))a6;
  os_unfair_lock_lock(&self->_lock);
  v23 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_teardownDataStoreWithError:](self, "_lock_teardownDataStoreWithError:", &v23);
  v11 = v23;
  if (v11)
  {
    os_unfair_lock_unlock(&self->_lock);
    v10[2](v10, v11);
  }
  else
  {
    -[PBFPosterExtensionDataStoreXPCServiceGlue _baseDataStoreURL](self, "_baseDataStoreURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "pbf_archivedDataStoreBaseURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PBFPosterExtensionDataStoreMigrator initWithBaseURL:]([PBFPosterExtensionDataStoreMigrator alloc], "initWithBaseURL:", v12);
    -[PBFPosterExtensionDataStoreMigrator archiveDataStoresBeforeCurrentDataStoreVersion](v14, "archiveDataStoresBeforeCurrentDataStoreVersion");

    v15 = -[PBFDataStoreArchiveAdjudicator initWithDataStoreBaseURL:archiveBaseURL:]([PBFDataStoreArchiveAdjudicator alloc], "initWithDataStoreBaseURL:archiveBaseURL:", v12, v13);
    -[PBFDataStoreArchiveAdjudicator archiveForName:](v15, "archiveForName:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    -[PBFDataStoreArchiveAdjudicator restoreArchive:backupExistingDataStoreIfPossible:error:](v15, "restoreArchive:backupExistingDataStoreIfPossible:error:", v16, v7, &v22);
    v17 = v22;

    if (!v17)
      -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_reapTransientData:](self, "_lock_reapTransientData:", 1);
    v21 = 0;
    v18 = -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_dataStoreWithError:](self, "_lock_dataStoreWithError:", &v21);
    v19 = v21;
    os_unfair_lock_unlock(&self->_lock);
    if (v17)
      v20 = v17;
    else
      v20 = v19;
    v10[2](v10, v20);

    if (!v20)
      -[PBFPosterExtensionDataStoreXPCServiceGlue _postDidTearDownNotification](self, "_postDidTearDownNotification");

    v10 = (void (**)(id, id))v17;
  }

}

- (void)server:(id)a3 deleteArchivedDataStoreNamed:(id)a4 completion:(id)a5
{
  void (**v7)(id, id);
  id v8;
  void *v9;
  void *v10;
  PBFDataStoreArchiveAdjudicator *v11;
  void *v12;
  id v13;
  id v14;

  v7 = (void (**)(id, id))a5;
  v8 = a4;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _baseDataStoreURL](self, "_baseDataStoreURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "pbf_archivedDataStoreBaseURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PBFDataStoreArchiveAdjudicator initWithDataStoreBaseURL:archiveBaseURL:]([PBFDataStoreArchiveAdjudicator alloc], "initWithDataStoreBaseURL:archiveBaseURL:", v9, v10);
  -[PBFDataStoreArchiveAdjudicator archiveForName:](v11, "archiveForName:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  -[PBFDataStoreArchiveAdjudicator deleteArchive:error:](v11, "deleteArchive:error:", v12, &v14);
  v13 = v14;

  v7[2](v7, v13);
}

- (void)server:(id)a3 exportArchivedDataStoreNamed:(id)a4 completion:(id)a5
{
  void (**v7)(id, void *, id);
  id v8;
  void *v9;
  void *v10;
  PBFDataStoreArchiveAdjudicator *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, void *, id))a5;
  v8 = a4;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _baseDataStoreURL](self, "_baseDataStoreURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "pbf_archivedDataStoreBaseURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PBFDataStoreArchiveAdjudicator initWithDataStoreBaseURL:archiveBaseURL:]([PBFDataStoreArchiveAdjudicator alloc], "initWithDataStoreBaseURL:archiveBaseURL:", v9, v10);
  -[PBFDataStoreArchiveAdjudicator archiveForName:](v11, "archiveForName:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v12, "archiveURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v13, "dataWithContentsOfURL:options:error:", v14, 8, &v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v18;
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D68];
    v20[0] = CFSTR("Data store could not be exported for an unknown reason which evades all possible explanation.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pbf_generalErrorWithCode:userInfo:", 0, v14);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v15 = 0;
  }

  v7[2](v7, v15, v16);
}

- (void)server:(id)a3 exportCurrentDataStoreToURL:(id)a4 options:(id)a5 sandboxToken:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = v15;
  if (v15)
  {
    objc_msgSend(objc_retainAutorelease(v15), "bytes");
    v17 = sandbox_extension_consume();
  }
  else
  {
    v17 = -1;
  }
  v20 = 0;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _stashCurrentDataStoreWithName:url:options:withError:](self, "_stashCurrentDataStoreWithName:url:options:withError:", 0, v13, v14, &v20);
  v18 = v20;
  if (v17 != -1)
    sandbox_extension_release();
  v19 = objc_retainAutorelease(v18);
  *a7 = v19;

}

- (void)server:(id)a3 ignoreExtension:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__PBFPosterExtensionDataStoreXPCServiceGlue_server_ignoreExtension_completion___block_invoke;
  v9[3] = &unk_1E86F7A50;
  v10 = v7;
  v8 = v7;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _handleLaunchServicesUpdates:completion:](self, "_handleLaunchServicesUpdates:completion:", v9, a5);

}

uint64_t __79__PBFPosterExtensionDataStoreXPCServiceGlue_server_ignoreExtension_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_ignoreExtension:", *(_QWORD *)(a1 + 32));
}

- (void)server:(id)a3 unignoreExtension:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__PBFPosterExtensionDataStoreXPCServiceGlue_server_unignoreExtension_completion___block_invoke;
  v9[3] = &unk_1E86F7A50;
  v10 = v7;
  v8 = v7;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _handleLaunchServicesUpdates:completion:](self, "_handleLaunchServicesUpdates:completion:", v9, a5);

}

uint64_t __81__PBFPosterExtensionDataStoreXPCServiceGlue_server_unignoreExtension_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_unignoreExtension:", *(_QWORD *)(a1 + 32));
}

- (void)_performPublisherChangeForDataStore:(id)a3 block:(id)a4
{
  void (**v6)(id, PBFWallpaperPublisher *);
  os_unfair_lock_s *p_lock;
  PBFPosterExtensionDataStore *v8;

  v8 = (PBFPosterExtensionDataStore *)a3;
  v6 = (void (**)(id, PBFWallpaperPublisher *))a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v8 && self->_lock_dataStore == v8)
  {
    os_unfair_lock_lock(&self->_publisherUpdateLock);
    os_unfair_lock_unlock(&self->_lock);
    v6[2](v6, self->_wallpaperPublisher);
    p_lock = &self->_publisherUpdateLock;
  }
  os_unfair_lock_unlock(p_lock);

}

- (void)posterExtensionDataStore:(id)a3 didInitializeWithSwitcherConfiguration:(id)a4 withChanges:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;

  v11 = a3;
  v8 = a4;
  if (v8)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __121__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didInitializeWithSwitcherConfiguration_withChanges___block_invoke;
    v12[3] = &unk_1E86F7A78;
    v13 = v8;
    v14 = a5;
    v9 = v8;
    -[PBFPosterExtensionDataStoreXPCServiceGlue _performPublisherChangeForDataStore:block:](self, "_performPublisherChangeForDataStore:block:", v11, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("switcherConfig"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStoreXPCServiceGlue posterExtensionDataStore:didInitializeWithSwitcherConfiguration:withChanges:].cold.1();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

void __121__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didInitializeWithSwitcherConfiguration_withChanges___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "selectedConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "homeScreenPosterConfigurationForPosterConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activeConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "homeScreenPosterConfigurationForPosterConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(v3, "_path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "_path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v14, "activateWithSelectedLockPath:selectedHomePath:activeLockPath:activeHomePath:recentlyChanged:", v7, v9, v10, v11, *(unsigned __int8 *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v5, "_path");
    v13 = v4;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activateWithSelectedLockPath:selectedHomePath:activeLockPath:activeHomePath:recentlyChanged:", v7, v9, v10, v12, *(unsigned __int8 *)(a1 + 40));

    v4 = v13;
  }

  if (!v8)
}

- (void)posterExtensionDataStore:(id)a3 didInitializeActivePosters:(id)a4 posterCollections:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __115__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didInitializeActivePosters_posterCollections___block_invoke;
  v22[3] = &unk_1E86F7AA0;
  v13 = v11;
  v23 = v13;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v22);

  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __115__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didInitializeActivePosters_posterCollections___block_invoke_2;
  v20[3] = &unk_1E86F3810;
  v14 = (id)objc_opt_new();
  v21 = v14;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v20);

  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __115__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didInitializeActivePosters_posterCollections___block_invoke_4;
  v17[3] = &unk_1E86F7AE8;
  v18 = v13;
  v19 = v14;
  v15 = v14;
  v16 = v13;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _performPublisherChangeForDataStore:block:](self, "_performPublisherChangeForDataStore:block:", v10, v17);

}

void __115__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didInitializeActivePosters_posterCollections___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "_path");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

void __115__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didInitializeActivePosters_posterCollections___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "bs_map:", &__block_literal_global_217);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

uint64_t __115__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didInitializeActivePosters_posterCollections___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_path");
}

void __115__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didInitializeActivePosters_posterCollections___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "activatePublishingOfRoles:", v3);
  objc_msgSend(v4, "activatePublishingOfCollectionsForRole:", *(_QWORD *)(a1 + 40));

}

- (void)posterExtensionDataStore:(id)a3 activePostersWereUpdatedForRoles:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __103__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_activePostersWereUpdatedForRoles___block_invoke;
  v14[3] = &unk_1E86F7AA0;
  v10 = v8;
  v15 = v10;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v14);

  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __103__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_activePostersWereUpdatedForRoles___block_invoke_2;
  v12[3] = &unk_1E86F7B10;
  v13 = v10;
  v11 = v10;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _performPublisherChangeForDataStore:block:](self, "_performPublisherChangeForDataStore:block:", v7, v12);

}

void __103__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_activePostersWereUpdatedForRoles___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "_path");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

uint64_t __103__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_activePostersWereUpdatedForRoles___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "issueUpdateForRoles:", *(_QWORD *)(a1 + 32));
}

- (void)posterExtensionDataStore:(id)a3 posterCollectionsWereUpdatedForRoles:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __107__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_posterCollectionsWereUpdatedForRoles___block_invoke;
  v14[3] = &unk_1E86F3810;
  v10 = v8;
  v15 = v10;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v14);

  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __107__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_posterCollectionsWereUpdatedForRoles___block_invoke_3;
  v12[3] = &unk_1E86F7B10;
  v13 = v10;
  v11 = v10;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _performPublisherChangeForDataStore:block:](self, "_performPublisherChangeForDataStore:block:", v7, v12);

}

void __107__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_posterCollectionsWereUpdatedForRoles___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "bs_map:", &__block_literal_global_219);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

uint64_t __107__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_posterCollectionsWereUpdatedForRoles___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_path");
}

uint64_t __107__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_posterCollectionsWereUpdatedForRoles___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "issuePosterCollectionUpdate:", *(_QWORD *)(a1 + 32));
}

- (void)posterExtensionDataStore:(id)a3 didUpdateSelectedConfiguration:(id)a4 associatedConfiguration:(id)a5 reason:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v17 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v10)
  {
    v13 = v12;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __132__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didUpdateSelectedConfiguration_associatedConfiguration_reason___block_invoke;
    v18[3] = &unk_1E86F7AE8;
    v19 = v10;
    v20 = v11;
    v14 = v11;
    v15 = v10;
    -[PBFPosterExtensionDataStoreXPCServiceGlue _performPublisherChangeForDataStore:block:](self, "_performPublisherChangeForDataStore:block:", v17, v18);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("newlySelectedConfiguration"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStoreXPCServiceGlue posterExtensionDataStore:didUpdateSelectedConfiguration:associatedConfiguration:reason:].cold.1();
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

void __132__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didUpdateSelectedConfiguration_associatedConfiguration_reason___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v6, "updateSelectedLockPath:selectedHomePath:activeLockPath:activeHomePath:", v3, v4, 0, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateSelectedLockPath:selectedHomePath:activeLockPath:activeHomePath:", v3, v5, 0, 0);

  }
}

- (void)posterExtensionDataStore:(id)a3 didUpdateActiveConfiguration:(id)a4 associatedConfiguration:(id)a5 reason:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v17 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v10)
  {
    v13 = v12;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __130__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didUpdateActiveConfiguration_associatedConfiguration_reason___block_invoke;
    v18[3] = &unk_1E86F7AE8;
    v19 = v10;
    v20 = v11;
    v14 = v11;
    v15 = v10;
    -[PBFPosterExtensionDataStoreXPCServiceGlue _performPublisherChangeForDataStore:block:](self, "_performPublisherChangeForDataStore:block:", v17, v18);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("newlyActivatedConfiguration"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStoreXPCServiceGlue posterExtensionDataStore:didUpdateActiveConfiguration:associatedConfiguration:reason:].cold.1();
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

void __130__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didUpdateActiveConfiguration_associatedConfiguration_reason___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v6, "updateSelectedLockPath:selectedHomePath:activeLockPath:activeHomePath:", 0, 0, v3, v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateSelectedLockPath:selectedHomePath:activeLockPath:activeHomePath:", 0, 0, v3, v5);

  }
}

- (void)posterExtensionDataStore:(id)a3 didUpdateConfiguration:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __93__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didUpdateConfiguration___block_invoke;
  v8[3] = &unk_1E86F7B10;
  v9 = v6;
  v7 = v6;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _performPublisherChangeForDataStore:block:](self, "_performPublisherChangeForDataStore:block:", a3, v8);

}

void __93__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didUpdateConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_path");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updatePath:", v4);

}

- (void)posterExtensionDataStore:(id)a3 posterConfiguration:(id)a4 didUpdateAssociatedHomeScreenPosterConfigurationTo:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __141__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_posterConfiguration_didUpdateAssociatedHomeScreenPosterConfigurationTo___block_invoke;
  v12[3] = &unk_1E86F7AE8;
  v13 = v9;
  v14 = v8;
  v10 = v8;
  v11 = v9;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _performPublisherChangeForDataStore:block:](self, "_performPublisherChangeForDataStore:block:", a3, v12);

}

void __141__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_posterConfiguration_didUpdateAssociatedHomeScreenPosterConfigurationTo___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_path");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateHomePath:matchingLockPath:", v6, v5);

}

- (void)posterExtensionDataStore:(id)a3 didUpdateSnapshotForPath:(id)a4 forDefinition:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "isServerPosterPath"))
  {
    objc_msgSend(v8, "identity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "type");

    if (v11 == 3)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __109__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didUpdateSnapshotForPath_forDefinition___block_invoke;
      v13[3] = &unk_1E86F7AE8;
      v14 = v8;
      v15 = v9;
      -[PBFPosterExtensionDataStoreXPCServiceGlue _performPublisherChangeForDataStore:block:](self, "_performPublisherChangeForDataStore:block:", v12, v13);

    }
  }

}

void __109__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didUpdateSnapshotForPath_forDefinition___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "noteSnapshotUpdateForPath:snapshotType:", v2, v5);

}

- (void)wallpaperPublisherDidReceiveObserverConnection
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "wallpaperPublisherDidReceiveObserverConnection: could not initialize data store: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (PRSServer)server
{
  return self->_server;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_wallpaperPublisher, 0);
  objc_storeStrong((id *)&self->_layoutController, 0);
  objc_storeStrong((id *)&self->_lock_dataStore, 0);
  objc_storeStrong((id *)&self->_lock_applicationStateMonitor, 0);
  objc_storeStrong((id *)&self->_lock_runtimeAssertionManager, 0);
}

void __61__PBFPosterExtensionDataStoreXPCServiceGlue_initWithOptions___block_invoke_2_cold_1(uint64_t a1, uint64_t a2)
{
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(*(SEL *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = 138544642;
  v9 = v4;
  v10 = 2114;
  v11 = v6;
  v12 = 2048;
  v13 = v7;
  v14 = 2114;
  v15 = CFSTR("PBFPosterExtensionDataStoreXPCServiceGlue.m");
  v16 = 1024;
  v17 = 126;
  v18 = 2114;
  v19 = a2;
  _os_log_fault_impl(&dword_1CB9FA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

  OUTLINED_FUNCTION_2();
}

- (void)_lock_dataStoreWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "Bootstrap RBSAssertion could not be acquired: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __70__PBFPosterExtensionDataStoreXPCServiceGlue__lock_dataStoreWithError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "Bootstrap RBSAssertion invalidated: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)server:deleteSnapshots:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "deleteSnapshots encountered an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __69__PBFPosterExtensionDataStoreXPCServiceGlue__lock_runLegacyMigration__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_4_4(&dword_1CB9FA000, v0, v1, "(light? something?) -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:]'s failure handler was called.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13_0();
}

void __69__PBFPosterExtensionDataStoreXPCServiceGlue__lock_runLegacyMigration__block_invoke_74_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_4_4(&dword_1CB9FA000, v0, v1, "(PBUIWallpaperModeDark) -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:]'s failure handler was called.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13_0();
}

- (void)_lock_reapTransientData:.cold.1()
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

- (void)_lock_reapSnapshots:.cold.1()
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

void __65__PBFPosterExtensionDataStoreXPCServiceGlue__lock_reapSnapshots___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "reapSnapshots encountered an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __66__PBFPosterExtensionDataStoreXPCServiceGlue__lock_reapDescriptors__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "reapDescriptors encountered an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __76__PBFPosterExtensionDataStoreXPCServiceGlue__lock_reapExtensionProviderInfo__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "reapExtensionProviderInfo encountered an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_lock_performNecessaryMigrationsForDataStoreAtURL:shouldForce:error:.cold.1()
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

- (void)_lock_performNecessaryMigrationsForDataStoreAtURL:(void *)a1 shouldForce:(NSObject *)a2 error:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "descriptionWithMultilinePrefix:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_1CB9FA000, a2, OS_LOG_TYPE_ERROR, "Migration RBSAssertion could not be acquired: %{public}@", v4, 0xCu);

}

- (void)_localeDidChange:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_4_4(&dword_1CB9FA000, v0, v1, "[_localeDidChange] XPC server invalidated, data store cancelled long running.  Calling xpc_transaction_exit_clean()", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13_0();
}

- (void)_localeDidChange:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_4_4(&dword_1CB9FA000, v0, v1, "[_localeDidChange] Locale changes did occur; cancelling long running operation and preparing for xpc_transaction_exit_clean()",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_13_0();
}

void __62__PBFPosterExtensionDataStoreXPCServiceGlue__localeDidChange___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_4_4(&dword_1CB9FA000, v0, v1, "[_localeDidChange] Calling xpc_transaction_exit_clean()", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13_0();
}

- (void)server:exportPosterConfigurationMatchingUUID:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "Failed to remove archive file: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_hasComplicationsForPosterConfiguration:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_1CB9FA000, a3, OS_LOG_TYPE_ERROR, "Failed to load complication layout for poster configuration '%@': %@", v6, 0x16u);

}

- (void)server:removeAllFocusConfigurationsMatchingFocusUUID:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "Could not update data store after removing all Focus configurations for mode: %{public}@, error: %{public}@");
  OUTLINED_FUNCTION_7();
}

- (void)server:notifyFocusModeDidChange:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "Failed to update switcher configuration for mode change '%{public}@': %{public}@");
  OUTLINED_FUNCTION_7();
}

- (void)server:notifyActiveChargerIdentifierDidUpdate:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "Failed to update data store for activeChargerIdentifier update to '%{public}@': %{public}@");
  OUTLINED_FUNCTION_7();
}

- (void)server:runMigration:migrationDescriptor:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "Post-migration bailed; failed to migrate: %{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_7();
}

- (void)posterExtensionDataStore:didInitializeWithSwitcherConfiguration:withChanges:.cold.1()
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

- (void)posterExtensionDataStore:didUpdateSelectedConfiguration:associatedConfiguration:reason:.cold.1()
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

- (void)posterExtensionDataStore:didUpdateActiveConfiguration:associatedConfiguration:reason:.cold.1()
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

@end
