@implementation ATXMotionManagerWrapper

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_18);
  return (id)sharedInstance_instance;
}

void __41__ATXMotionManagerWrapper_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = v0;

}

- (ATXMotionManagerWrapper)init
{
  ATXMotionManagerWrapper *v2;
  CMMotionActivityManager *v3;
  CMMotionActivityManager *motionActivityManager;
  NSOperationQueue *v5;
  NSOperationQueue *motionActivityQueue;
  id v7;
  ATXCachedMotion *v8;
  uint64_t v9;
  _PASLock *currentMotion;
  uint64_t v11;
  NSMutableDictionary *delegatesMonitoringForMotionType;
  NSObject *v13;
  _QWORD block[4];
  ATXMotionManagerWrapper *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ATXMotionManagerWrapper;
  v2 = -[ATXMotionManagerWrapper init](&v17, sel_init);
  if (v2)
  {
    v3 = (CMMotionActivityManager *)objc_alloc_init(MEMORY[0x1E0CA5660]);
    motionActivityManager = v2->_motionActivityManager;
    v2->_motionActivityManager = v3;

    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    motionActivityQueue = v2->_motionActivityQueue;
    v2->_motionActivityQueue = v5;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_motionActivityQueue, "setMaxConcurrentOperationCount:", 1);
    v7 = objc_alloc(MEMORY[0x1E0D815F0]);
    v8 = -[ATXCachedMotion initWithATXMotion:]([ATXCachedMotion alloc], "initWithATXMotion:", 0);
    v9 = objc_msgSend(v7, "initWithGuardedData:", v8);
    currentMotion = v2->_currentMotion;
    v2->_currentMotion = (_PASLock *)v9;

    v11 = objc_opt_new();
    delegatesMonitoringForMotionType = v2->_delegatesMonitoringForMotionType;
    v2->_delegatesMonitoringForMotionType = (NSMutableDictionary *)v11;

    dispatch_get_global_queue(9, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __31__ATXMotionManagerWrapper_init__block_invoke;
    block[3] = &unk_1E942E9B8;
    v16 = v2;
    dispatch_async(v13, block);

  }
  return v2;
}

void __31__ATXMotionManagerWrapper_init__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  if (+[ATXMotionManagerWrapper hasMotionActivity](ATXMotionManagerWrapper, "hasMotionActivity"))
  {
    v2 = *(_QWORD **)(a1 + 32);
    v3 = (void *)v2[5];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __31__ATXMotionManagerWrapper_init__block_invoke_2;
    v4[3] = &unk_1E942EF30;
    v5 = v2;
    objc_msgSend(v3, "runWithLockAcquired:", v4);

  }
}

uint64_t __31__ATXMotionManagerWrapper_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateCurrentActivity:", a2);
}

+ (BOOL)hasMotionActivity
{
  if (hasMotionActivity__pasOnceToken6 != -1)
    dispatch_once(&hasMotionActivity__pasOnceToken6, &__block_literal_global_10_0);
  return hasMotionActivity__pasExprOnceResult != 0;
}

void __44__ATXMotionManagerWrapper_hasMotionActivity__block_invoke()
{
  void *v0;
  _BOOL4 v1;

  v0 = (void *)MEMORY[0x1D82448B0]();
  if (objc_msgSend(MEMORY[0x1E0CA5660], "isActivityAvailable"))
    v1 = objc_msgSend(MEMORY[0x1E0CA5660], "authorizationStatus") == 3;
  else
    v1 = 0;
  hasMotionActivity__pasExprOnceResult = v1;
  objc_autoreleasePoolPop(v0);
}

- (id)_fetchMotionActivities
{
  dispatch_semaphore_t v3;
  CMMotionActivityManager *motionActivityManager;
  void *v5;
  void *v6;
  NSOperationQueue *motionActivityQueue;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__17;
  v22 = __Block_byref_object_dispose__17;
  v23 = 0;
  v3 = dispatch_semaphore_create(0);
  motionActivityManager = self->_motionActivityManager;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -30.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  motionActivityQueue = self->_motionActivityQueue;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __49__ATXMotionManagerWrapper__fetchMotionActivities__block_invoke;
  v15 = &unk_1E942EF58;
  v17 = &v18;
  v8 = v3;
  v16 = v8;
  -[CMMotionActivityManager queryActivityStartingFromDate:toDate:toQueue:withHandler:](motionActivityManager, "queryActivityStartingFromDate:toDate:toQueue:withHandler:", v5, v6, motionActivityQueue, &v12);

  if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v8, 60.0, v12, v13, v14, v15) == 1)
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ATXMotionManagerWrapper _fetchMotionActivities].cold.1(v9);

    v10 = 0;
  }
  else
  {
    v10 = (id)v19[5];
  }

  _Block_object_dispose(&v18, 8);
  return v10;
}

void __49__ATXMotionManagerWrapper__fetchMotionActivities__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)updateCurrentActivity:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[ATXMotionManagerWrapper _fetchMotionActivities](self, "_fetchMotionActivities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[ATXMotion summarizeActivityStream:](ATXMotion, "summarizeActivityStream:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "update:", v5);

  }
}

- (id)getCurrentActivity
{
  _PASLock *currentMotion;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (!+[ATXMotionManagerWrapper hasMotionActivity](ATXMotionManagerWrapper, "hasMotionActivity"))
    return -[ATXMotion initFromCMMotionActivity:]([ATXMotion alloc], "initFromCMMotionActivity:", 0);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__17;
  v11 = __Block_byref_object_dispose__17;
  v12 = 0;
  currentMotion = self->_currentMotion;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__ATXMotionManagerWrapper_getCurrentActivity__block_invoke;
  v6[3] = &unk_1E942EF80;
  v6[4] = self;
  v6[5] = &v7;
  -[_PASLock runWithLockAcquired:](currentMotion, "runWithLockAcquired:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __45__ATXMotionManagerWrapper_getCurrentActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "isExpired"))
    objc_msgSend(*(id *)(a1 + 32), "updateCurrentActivity:", v6);
  objc_msgSend(v6, "currentMotion");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_motionActivityHandler
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__ATXMotionManagerWrapper__motionActivityHandler__block_invoke;
  v8[3] = &unk_1E942EFA8;
  objc_copyWeak(&v9, &location);
  v2 = (void *)MEMORY[0x1D8244A3C](v8);
  v6 = (void *)MEMORY[0x1D8244A3C](v2, v3, v4, v5);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __49__ATXMotionManagerWrapper__motionActivityHandler__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id WeakRetained;
  void *v6;
  id *v7;
  id *v8;
  int v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  NSObject *v23;
  int v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  NSObject *v30;
  int v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  NSObject *v37;
  int v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
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
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint8_t v78[128];
  uint8_t buf[4];
  int v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = (id *)WeakRetained;
    objc_sync_enter(v7);
    if (v4)
    {
      v8 = v7 + 4;
      if (!v7[4] || (v9 = objc_msgSend(v4, "walking"), v9 != objc_msgSend(*v8, "walking")))
      {
        __atxlog_handle_default();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          v80 = objc_msgSend(v4, "walking");
          _os_log_impl(&dword_1D2C00000, v10, OS_LOG_TYPE_INFO, "ATXMotionManagerWrapper: WALKING state changed to %d", buf, 8u);
        }

        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        objc_msgSend(v7[3], "objectForKey:", &unk_1E943D410);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v67;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v67 != v13)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * v14++), "didUpdateMotionType:isActive:", 0, objc_msgSend(v4, "walking"));
            }
            while (v12 != v14);
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
          }
          while (v12);
        }

      }
      if (!*v8 || (v15 = objc_msgSend(v4, "running"), v15 != objc_msgSend(*v8, "running")))
      {
        __atxlog_handle_default();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = objc_msgSend(v4, "running");
          *(_DWORD *)buf = 67109120;
          v80 = v17;
          _os_log_impl(&dword_1D2C00000, v16, OS_LOG_TYPE_INFO, "ATXMotionManagerWrapper: RUNNING state changed to %d", buf, 8u);
        }

        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        objc_msgSend(v7[3], "objectForKey:", &unk_1E943D428);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v62, v77, 16);
        if (v19)
        {
          v20 = *(_QWORD *)v63;
          do
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v63 != v20)
                objc_enumerationMutation(v18);
              objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * v21++), "didUpdateMotionType:isActive:", 1, objc_msgSend(v4, "running"));
            }
            while (v19 != v21);
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v62, v77, 16);
          }
          while (v19);
        }

      }
      if (!*v8 || (v22 = objc_msgSend(v4, "cycling"), v22 != objc_msgSend(*v8, "cycling")))
      {
        __atxlog_handle_default();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v24 = objc_msgSend(v4, "cycling");
          *(_DWORD *)buf = 67109120;
          v80 = v24;
          _os_log_impl(&dword_1D2C00000, v23, OS_LOG_TYPE_INFO, "ATXMotionManagerWrapper: CYCLING state changed to %d", buf, 8u);
        }

        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        objc_msgSend(v7[3], "objectForKey:", &unk_1E943D440);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v58, v76, 16);
        if (v26)
        {
          v27 = *(_QWORD *)v59;
          do
          {
            v28 = 0;
            do
            {
              if (*(_QWORD *)v59 != v27)
                objc_enumerationMutation(v25);
              objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * v28++), "didUpdateMotionType:isActive:", 2, objc_msgSend(v4, "cycling"));
            }
            while (v26 != v28);
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v58, v76, 16);
          }
          while (v26);
        }

      }
      if (!*v8 || (v29 = objc_msgSend(v4, "automotive"), v29 != objc_msgSend(*v8, "automotive")))
      {
        __atxlog_handle_default();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = objc_msgSend(v4, "automotive");
          *(_DWORD *)buf = 67109120;
          v80 = v31;
          _os_log_impl(&dword_1D2C00000, v30, OS_LOG_TYPE_DEFAULT, "ATXMotionManagerWrapper: AUTOMOTIVE state changed to %d", buf, 8u);
        }

        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        objc_msgSend(v7[3], "objectForKey:", &unk_1E943D458);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v54, v75, 16);
        if (v33)
        {
          v34 = *(_QWORD *)v55;
          do
          {
            v35 = 0;
            do
            {
              if (*(_QWORD *)v55 != v34)
                objc_enumerationMutation(v32);
              objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * v35++), "didUpdateMotionType:isActive:", 3, objc_msgSend(v4, "automotive"));
            }
            while (v33 != v35);
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v54, v75, 16);
          }
          while (v33);
        }

      }
      if (!*v8 || (v36 = objc_msgSend(v4, "unknown"), v36 != objc_msgSend(*v8, "unknown")))
      {
        __atxlog_handle_default();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          v38 = objc_msgSend(v4, "unknown");
          *(_DWORD *)buf = 67109120;
          v80 = v38;
          _os_log_impl(&dword_1D2C00000, v37, OS_LOG_TYPE_INFO, "ATXMotionManagerWrapper: UNKNOWN state changed to %d", buf, 8u);
        }

        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        objc_msgSend(v7[3], "objectForKey:", &unk_1E943D470, 0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v50, v74, 16);
        if (v40)
        {
          v41 = *(_QWORD *)v51;
          do
          {
            v42 = 0;
            do
            {
              if (*(_QWORD *)v51 != v41)
                objc_enumerationMutation(v39);
              objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v42++), "didUpdateMotionType:isActive:", 4, objc_msgSend(v4, "unknown"));
            }
            while (v40 != v42);
            v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v50, v74, 16);
          }
          while (v40);
        }

      }
      objc_storeStrong(v7 + 4, a2);
    }
    else
    {
      for (i = 0; i != 5; ++i)
      {
        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        v44 = v7[3];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKey:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
        if (v47)
        {
          v48 = *(_QWORD *)v71;
          do
          {
            v49 = 0;
            do
            {
              if (*(_QWORD *)v71 != v48)
                objc_enumerationMutation(v46);
              objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * v49++), "didUpdateMotionType:isActive:", i, 0);
            }
            while (v47 != v49);
            v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
          }
          while (v47);
        }

      }
    }
    objc_sync_exit(v7);

  }
}

- (void)startUpdatingMotionType:(int64_t)a3 forDelegate:(id)a4
{
  ATXMotionManagerWrapper *v6;
  uint64_t v7;
  NSMutableDictionary *delegatesMonitoringForMotionType;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  CMMotionActivity *mostRecentActivity;
  uint64_t v18;
  void *v19;
  void *v20;
  CMMotionActivityManager *motionActivityManager;
  NSOperationQueue *motionActivityQueue;
  void *v23;
  id v24;

  v24 = a4;
  v6 = self;
  objc_sync_enter(v6);
  if (v6->_motionActivityManager)
  {
    v7 = -[NSMutableDictionary count](v6->_delegatesMonitoringForMotionType, "count");
    delegatesMonitoringForMotionType = v6->_delegatesMonitoringForMotionType;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](delegatesMonitoringForMotionType, "objectForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v11 = v6->_delegatesMonitoringForMotionType;
        v12 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v12, v13);

      }
      v14 = v6->_delegatesMonitoringForMotionType;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v14, "objectForKey:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v24);

      mostRecentActivity = v6->_mostRecentActivity;
      if (mostRecentActivity)
      {
        switch(a3)
        {
          case 0:
            v18 = -[CMMotionActivity walking](mostRecentActivity, "walking");
            goto LABEL_13;
          case 1:
            v18 = -[CMMotionActivity running](mostRecentActivity, "running");
            goto LABEL_13;
          case 2:
            v18 = -[CMMotionActivity cycling](mostRecentActivity, "cycling");
            goto LABEL_13;
          case 3:
            v18 = -[CMMotionActivity automotive](mostRecentActivity, "automotive");
            goto LABEL_13;
          case 4:
            v18 = -[CMMotionActivity unknown](mostRecentActivity, "unknown");
LABEL_13:
            objc_msgSend(v24, "didUpdateMotionType:isActive:", a3, v18);
            break;
          default:
            break;
        }
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v24);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](delegatesMonitoringForMotionType, "setObject:forKey:", v19, v20);

      motionActivityManager = v6->_motionActivityManager;
      motionActivityQueue = v6->_motionActivityQueue;
      -[ATXMotionManagerWrapper _motionActivityHandler](v6, "_motionActivityHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMMotionActivityManager startActivityUpdatesToQueue:withHandler:](motionActivityManager, "startActivityUpdatesToQueue:withHandler:", motionActivityQueue, v23);

    }
  }
  objc_sync_exit(v6);

}

- (void)stopUpdatingMotionType:(int64_t)a3 forDelegate:(id)a4
{
  ATXMotionManagerWrapper *v6;
  NSMutableDictionary *delegatesMonitoringForMotionType;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;

  v12 = a4;
  v6 = self;
  objc_sync_enter(v6);
  if (v6->_motionActivityManager)
  {
    delegatesMonitoringForMotionType = v6->_delegatesMonitoringForMotionType;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](delegatesMonitoringForMotionType, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "removeObject:", v12);
      if (!objc_msgSend(v9, "count"))
      {
        v10 = v6->_delegatesMonitoringForMotionType;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:", v11);

        if (!-[NSMutableDictionary count](v6->_delegatesMonitoringForMotionType, "count"))
          -[CMMotionActivityManager stopActivityUpdates](v6->_motionActivityManager, "stopActivityUpdates");
      }
    }

  }
  objc_sync_exit(v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentMotion, 0);
  objc_storeStrong((id *)&self->_mostRecentActivity, 0);
  objc_storeStrong((id *)&self->_delegatesMonitoringForMotionType, 0);
  objc_storeStrong((id *)&self->_motionActivityQueue, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
}

- (void)_fetchMotionActivities
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2C00000, log, OS_LOG_TYPE_ERROR, "Error: motion activity query timed out\n", v1, 2u);
}

@end
