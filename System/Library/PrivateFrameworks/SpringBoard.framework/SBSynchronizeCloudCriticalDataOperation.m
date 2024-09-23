@implementation SBSynchronizeCloudCriticalDataOperation

- (SBSynchronizeCloudCriticalDataOperation)init
{
  void *v3;
  void *v4;
  void *v5;
  SBSynchronizeCloudCriticalDataOperation *v6;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bootDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBSynchronizeCloudCriticalDataOperation initWithDefaults:userManager:](self, "initWithDefaults:userManager:", v4, v5);

  return v6;
}

- (SBSynchronizeCloudCriticalDataOperation)initWithDefaults:(id)a3 userManager:(id)a4
{
  id v7;
  id v8;
  SBSynchronizeCloudCriticalDataOperation *v9;
  SBSynchronizeCloudCriticalDataOperation *v10;
  int v11;
  uint64_t v12;
  OS_dispatch_queue *queue;
  dispatch_group_t v14;
  OS_dispatch_group *queue_operationGroup;
  NSOperationQueue *v16;
  NSOperationQueue *operationQueue;
  NSObject *v18;
  const __CFString *v19;
  objc_super v21;
  uint8_t buf[4];
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SBSynchronizeCloudCriticalDataOperation;
  v9 = -[SBSynchronizeCloudCriticalDataOperation init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_queue_cloudSyncStartTime = -1.79769313e308;
    if (objc_msgSend(v8, "isMultiUser") && (objc_msgSend(v8, "isLoginSession") & 1) == 0)
      v11 = objc_msgSend(v7, "hasCompletedSynchronizingCloudCriticalData") ^ 1;
    else
      LOBYTE(v11) = 0;
    v10->_needsSync = v11;
    objc_msgSend(CFSTR("com.apple.springboard.synchronizeCloudCriticalData"), "UTF8String");
    v12 = BSDispatchQueueCreateWithQualityOfService();
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    v14 = dispatch_group_create();
    queue_operationGroup = v10->_queue_operationGroup;
    v10->_queue_operationGroup = (OS_dispatch_group *)v14;

    v10->_queue_isComplete = !v10->_needsSync;
    objc_storeStrong((id *)&v10->_queue_bootDefaults, a3);
    v10->_queue_operationCount = 0;
    v16 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v10->_operationQueue;
    v10->_operationQueue = v16;

    -[NSOperationQueue setQualityOfService:](v10->_operationQueue, "setQualityOfService:", 33);
    -[NSOperationQueue setName:](v10->_operationQueue, "setName:", CFSTR("com.apple.springboard.synchronizeCloudCriticalData"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v10->_operationQueue, "setMaxConcurrentOperationCount:", 5);
    SBLogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      if (v10->_needsSync)
        v19 = CFSTR("YES");
      else
        v19 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v23 = v19;
      _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "Needs to synchronize cloud critical data? %@", buf, 0xCu);
    }

  }
  return v10;
}

- (BOOL)isComplete
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__SBSynchronizeCloudCriticalDataOperation_isComplete__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__SBSynchronizeCloudCriticalDataOperation_isComplete__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_isComplete");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)startSynchronize
{
  NSObject *queue;
  _QWORD block[5];

  if (self->_needsSync)
  {
    kdebug_trace();
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__SBSynchronizeCloudCriticalDataOperation_startSynchronize__block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_sync(queue, block);
    kdebug_trace();
  }
}

uint64_t __59__SBSynchronizeCloudCriticalDataOperation_startSynchronize__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_startFetchingCloudCriticalData");
}

- (BOOL)waitForSynchronizeToCompleteWithTimeout:(double)a3
{
  NSObject *queue_operationGroup;
  dispatch_time_t v6;

  if (-[SBSynchronizeCloudCriticalDataOperation isComplete](self, "isComplete"))
    return 1;
  queue_operationGroup = self->_queue_operationGroup;
  v6 = BSDispatchTimeWithInterval();
  return dispatch_group_wait(queue_operationGroup, v6) == 0;
}

- (unint64_t)_pendingOperationCount
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__SBSynchronizeCloudCriticalDataOperation__pendingOperationCount__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __65__SBSynchronizeCloudCriticalDataOperation__pendingOperationCount__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "operationCount");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_addTestOperation:(id)a3 shouldBlock:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__SBSynchronizeCloudCriticalDataOperation__addTestOperation_shouldBlock___block_invoke;
  block[3] = &unk_1E8E9EE00;
  v11 = a4;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_sync(queue, block);

}

uint64_t __73__SBSynchronizeCloudCriticalDataOperation__addTestOperation_shouldBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
  {
    v3 = *(void **)(v2 + 72);
    if (!v3)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 72);
      *(_QWORD *)(v5 + 72) = v4;
      v7 = 72;
LABEL_6:

      v3 = *(void **)(*(_QWORD *)(a1 + 32) + v7);
    }
  }
  else
  {
    v3 = *(void **)(v2 + 80);
    if (!v3)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v9 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v9 + 80);
      *(_QWORD *)(v9 + 80) = v8;
      v7 = 80;
      goto LABEL_6;
    }
  }
  return objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_addOperation:(id)a3 shouldBlock:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _QWORD v7[5];
  BOOL v8;

  v4 = a4;
  v6 = a3;
  if (v4)
    dispatch_group_enter((dispatch_group_t)self->_queue_operationGroup);
  ++self->_queue_operationCount;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__SBSynchronizeCloudCriticalDataOperation__queue_addOperation_shouldBlock___block_invoke;
  v7[3] = &unk_1E8E9F508;
  v7[4] = self;
  v8 = v4;
  objc_msgSend(v6, "setCompletionBlock:", v7);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v6);

}

void __75__SBSynchronizeCloudCriticalDataOperation__queue_addOperation_shouldBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD v3[5];
  char v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __75__SBSynchronizeCloudCriticalDataOperation__queue_addOperation_shouldBlock___block_invoke_2;
  v3[3] = &unk_1E8E9F508;
  v3[4] = v1;
  v4 = *(_BYTE *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __75__SBSynchronizeCloudCriticalDataOperation__queue_addOperation_shouldBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  double v6;
  double v7;
  int v8;
  void *v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 48))
  {
    *(_BYTE *)(v2 + 56) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setHasCompletedSynchronizingCloudCriticalData:", 1);
    SBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      BSContinuousMachTimeNow();
      v7 = v6 - *(double *)(*(_QWORD *)(a1 + 32) + 64);
      v8 = 138543618;
      v9 = v5;
      v10 = 2048;
      v11 = v7;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ took %fs", (uint8_t *)&v8, 0x16u);

    }
  }
  if (*(_BYTE *)(a1 + 40))
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
}

- (BOOL)_queue_isComplete
{
  BSDispatchQueueAssert();
  return self->_queue_isComplete;
}

- (void)_queue_startFetchingCloudCriticalData
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *blockingTestOperations;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSMutableArray *nonblockingTestOperations;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssert();
  BSContinuousMachTimeNow();
  self->_queue_cloudSyncStartTime = v3;
  -[SBSynchronizeCloudCriticalDataOperation _queue_fetchCloudAccountOperation](self, "_queue_fetchCloudAccountOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSynchronizeCloudCriticalDataOperation _queue_fetchCloudDefaultsOperation](self, "_queue_fetchCloudDefaultsOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSynchronizeCloudCriticalDataOperation _queue_fetchMDMProfilesOperation](self, "_queue_fetchMDMProfilesOperation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSynchronizeCloudCriticalDataOperation _queue_migrateSoundPreferencesOperation](self, "_queue_migrateSoundPreferencesOperation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addDependency:", v4);
  objc_msgSend(v7, "addDependency:", v5);
  v8 = _os_feature_enabled_impl();
  v9 = _os_feature_enabled_impl();
  SBLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v9 ^ 1u;
    *(_DWORD *)buf = 138543874;
    v14 = v8 ^ 1u;
    v38 = v12;
    v39 = 1024;
    v40 = v13;
    v41 = 1024;
    v42 = v14;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ wait for iCloud sign-in: %d, wait for cloud defaults: %d", buf, 0x18u);

  }
  else
  {
    v13 = v9 ^ 1u;
    v14 = v8 ^ 1u;
  }

  -[SBSynchronizeCloudCriticalDataOperation _queue_addOperation:shouldBlock:](self, "_queue_addOperation:shouldBlock:", v4, v13);
  -[SBSynchronizeCloudCriticalDataOperation _queue_addOperation:shouldBlock:](self, "_queue_addOperation:shouldBlock:", v5, v14);
  -[SBSynchronizeCloudCriticalDataOperation _queue_addOperation:shouldBlock:](self, "_queue_addOperation:shouldBlock:", v6, 0);
  -[SBSynchronizeCloudCriticalDataOperation _queue_addOperation:shouldBlock:](self, "_queue_addOperation:shouldBlock:", v7, v14);
  blockingTestOperations = self->_blockingTestOperations;
  if (blockingTestOperations)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v16 = blockingTestOperations;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v32;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v32 != v19)
            objc_enumerationMutation(v16);
          -[SBSynchronizeCloudCriticalDataOperation _queue_addOperation:shouldBlock:](self, "_queue_addOperation:shouldBlock:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v20++), 1);
        }
        while (v18 != v20);
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v18);
    }

  }
  nonblockingTestOperations = self->_nonblockingTestOperations;
  if (nonblockingTestOperations)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v22 = nonblockingTestOperations;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v28;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v28 != v25)
            objc_enumerationMutation(v22);
          -[SBSynchronizeCloudCriticalDataOperation _queue_addOperation:shouldBlock:](self, "_queue_addOperation:shouldBlock:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v26++), 0, (_QWORD)v27);
        }
        while (v24 != v26);
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v24);
    }

  }
}

- (id)_queue_fetchCloudAccountOperation
{
  _SBSynchronizeOperation *v2;

  v2 = objc_alloc_init(_SBSynchronizeOperation);
  -[_SBSynchronizeOperation setName:](v2, "setName:", CFSTR("FetchICloudAccount"));
  -[_SBSynchronizeOperation setHumanReadableDescription:](v2, "setHumanReadableDescription:", CFSTR("Loading iCloud account data..."));
  -[_SBSynchronizeOperation addTask:](v2, "addTask:", &__block_literal_global_311);
  return v2;
}

- (id)_queue_fetchMDMProfilesOperation
{
  _SBSynchronizeOperation *v2;

  v2 = objc_alloc_init(_SBSynchronizeOperation);
  -[_SBSynchronizeOperation setName:](v2, "setName:", CFSTR("FetchMDMProfiles"));
  -[_SBSynchronizeOperation setHumanReadableDescription:](v2, "setHumanReadableDescription:", CFSTR("Fetching profiles..."));
  -[_SBSynchronizeOperation addTask:](v2, "addTask:", &__block_literal_global_22_4);
  return v2;
}

- (id)_queue_fetchCloudDefaultsOperation
{
  _SBSynchronizeOperation *v3;
  _QWORD v5[5];

  if (_queue_fetchCloudDefaultsOperation___once != -1)
    dispatch_once(&_queue_fetchCloudDefaultsOperation___once, &__block_literal_global_23_9);
  v3 = objc_alloc_init(_SBSynchronizeOperation);
  -[_SBSynchronizeOperation setName:](v3, "setName:", CFSTR("FetchICloudDefaults"));
  -[_SBSynchronizeOperation setHumanReadableDescription:](v3, "setHumanReadableDescription:", CFSTR("Fetching data from iCloud..."));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__SBSynchronizeCloudCriticalDataOperation__queue_fetchCloudDefaultsOperation__block_invoke_2;
  v5[3] = &unk_1E8EBAC10;
  v5[4] = self;
  -[_SBSynchronizeOperation addTask:](v3, "addTask:", v5);
  return v3;
}

void __77__SBSynchronizeCloudCriticalDataOperation__queue_fetchCloudDefaultsOperation__block_invoke()
{
  void *v0;

  v0 = (void *)_queue_fetchCloudDefaultsOperation___bootCriticalDomains;
  _queue_fetchCloudDefaultsOperation___bootCriticalDomains = (uint64_t)&unk_1E91CEE30;

}

void __77__SBSynchronizeCloudCriticalDataOperation__queue_fetchCloudDefaultsOperation__block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[5];
  NSObject *v12;
  uint64_t v13;

  v3 = a2;
  dispatch_group_enter(v3);
  kdebug_trace();
  BSContinuousMachTimeNow();
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.CloudDefaultsDomains"), CFSTR("com.apple.springboard.synchronizeCloudCriticalData"));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "UTF8String");
  v7 = (void *)BSDispatchQueueCreateWithQualityOfService();
  v8 = *(void **)(a1 + 32);
  v9 = _queue_fetchCloudDefaultsOperation___bootCriticalDomains;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__SBSynchronizeCloudCriticalDataOperation__queue_fetchCloudDefaultsOperation__block_invoke_3;
  v11[3] = &unk_1E8EA0AF0;
  v13 = v5;
  v11[4] = v8;
  v12 = v3;
  v10 = v3;
  objc_msgSend(v8, "_fetchDomains:fromIndex:queue:completion:", v9, 0, v7, v11);

}

void __77__SBSynchronizeCloudCriticalDataOperation__queue_fetchCloudDefaultsOperation__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  double v5;
  double v6;
  int v7;
  void *v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    BSContinuousMachTimeNow();
    v6 = v5 - *(double *)(a1 + 48);
    v7 = 138543618;
    v8 = v4;
    v9 = 2048;
    v10 = v6;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed syncing domains (duration: %f sec)", (uint8_t *)&v7, 0x16u);

  }
  kdebug_trace();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_fetchDomains:(id)a3 fromIndex:(int64_t)a4 queue:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD block[4];
  id v21;
  SBSynchronizeCloudCriticalDataOperation *v22;
  id v23;
  id v24;
  int64_t v25;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSynchronizeCloudCriticalDataOperation.m"), 268, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

    if (v13)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSynchronizeCloudCriticalDataOperation.m"), 269, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSynchronizeCloudCriticalDataOperation.m"), 267, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("domains"));

  if (!v12)
    goto LABEL_6;
LABEL_3:
  if (!v13)
    goto LABEL_7;
LABEL_4:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__SBSynchronizeCloudCriticalDataOperation__fetchDomains_fromIndex_queue_completion___block_invoke;
  block[3] = &unk_1E8E9FBF0;
  v24 = v13;
  v25 = a4;
  v21 = v11;
  v22 = self;
  v23 = v12;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  dispatch_async(v15, block);

}

void __84__SBSynchronizeCloudCriticalDataOperation__fetchDomains_fromIndex_queue_completion___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 64);
  if (v2 >= objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", *(_QWORD *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    BSContinuousMachTimeNow();
    SBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v6;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Start syncing domain: %@", buf, 0x16u);

    }
    v8 = *(id *)(a1 + 32);
    v9 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 56);
    v7 = v3;
    _CFPreferencesAppFullCloudSynchronize();

  }
}

uint64_t __84__SBSynchronizeCloudCriticalDataOperation__fetchDomains_fromIndex_queue_completion___block_invoke_50(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    BSContinuousMachTimeNow();
    v7 = v6 - *(double *)(a1 + 72);
    v9 = 138543874;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    v13 = 2048;
    v14 = v7;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed syncing domain: %@ (duration: %f sec)", (uint8_t *)&v9, 0x20u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_fetchDomains:fromIndex:queue:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80) + 1, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (id)_queue_migrateSoundPreferencesOperation
{
  _SBSynchronizeOperation *v2;

  v2 = objc_alloc_init(_SBSynchronizeOperation);
  -[_SBSynchronizeOperation setName:](v2, "setName:", CFSTR("MigrateSoundPreferences"));
  -[_SBSynchronizeOperation setHumanReadableDescription:](v2, "setHumanReadableDescription:", CFSTR("Migrating sound preferences from com.apple.springboard to com.apple.preferences.sounds..."));
  -[_SBSynchronizeOperation addTask:](v2, "addTask:", &__block_literal_global_56_0);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonblockingTestOperations, 0);
  objc_storeStrong((id *)&self->_blockingTestOperations, 0);
  objc_storeStrong((id *)&self->_queue_operationGroup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_queue_bootDefaults, 0);
}

@end
