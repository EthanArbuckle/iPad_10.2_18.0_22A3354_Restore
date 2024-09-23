@implementation ICDeviceSetupStatusMonitor

- (BOOL)isDeviceSetupComplete
{
  os_unfair_lock_s *p_lock;
  void *v4;
  int v5;
  uint64_t v6;
  char v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isWatch");
  v6 = 40;
  if (v5)
    v6 = 41;
  v7 = *((_BYTE *)&self->super.isa + v6);

  os_unfair_lock_unlock(p_lock);
  return v7;
}

+ (ICDeviceSetupStatusMonitor)sharedMonitor
{
  if (sharedMonitor_sOnceToken_16223 != -1)
    dispatch_once(&sharedMonitor_sOnceToken_16223, &__block_literal_global_16224);
  return (ICDeviceSetupStatusMonitor *)(id)sharedMonitor_sSharedMonitor_16225;
}

- (id)_init
{
  ICDeviceSetupStatusMonitor *v2;
  ICDeviceSetupStatusMonitor *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *workQueue;
  uint64_t v7;
  NSMutableArray *pendingBuddyCompleteBlocks;
  uint64_t v9;
  NSMutableArray *pendingSetupCompleteBlocks;
  NSObject *v11;
  unsigned __int8 *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  int v19;
  uint64_t v20;
  int v21;
  _QWORD block[4];
  unsigned __int8 *v24;
  objc_super v25;
  uint8_t buf[4];
  unsigned __int8 *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)ICDeviceSetupStatusMonitor;
  v2 = -[ICDeviceSetupStatusMonitor init](&v25, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.amp.iTunesCloud.ICDeviceSetupStatusMonitor.callBackQueue", v4);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    pendingBuddyCompleteBlocks = v3->_pendingBuddyCompleteBlocks;
    v3->_pendingBuddyCompleteBlocks = (NSMutableArray *)v7;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    pendingSetupCompleteBlocks = v3->_pendingSetupCompleteBlocks;
    v3->_pendingSetupCompleteBlocks = (NSMutableArray *)v9;

    v11 = v3->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__ICDeviceSetupStatusMonitor__init__block_invoke;
    block[3] = &unk_1E43913D8;
    v12 = v3;
    v24 = v12;
    dispatch_sync(v11, block);
    +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isWatch");

    if (v14)
    {
      +[ICNanoPairedDeviceStatusMonitor sharedMonitor](ICNanoPairedDeviceStatusMonitor, "sharedMonitor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObserver:", v12);
      v12[41] = objc_msgSend(v15, "isInitialSyncComplete");

    }
    v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v12[40];
      +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isWatch");
      v20 = 40;
      if (v19)
        v20 = 41;
      v21 = v12[v20];
      *(_DWORD *)buf = 138543874;
      v27 = v12;
      v28 = 1024;
      v29 = v17;
      v30 = 1024;
      v31 = v21;
      _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ initialized. isSetupAssistantComplete=%{BOOL}u, isDeviceSetupComplete=%{BOOL}u", buf, 0x18u);

    }
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  int v4;
  void *v5;
  int setupAssistantLaunchedNotifyToken;
  int setupAssistantFinishedNotifyToken;
  objc_super v8;

  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isWatch");

  if (v4)
  {
    +[ICNanoPairedDeviceStatusMonitor sharedMonitor](ICNanoPairedDeviceStatusMonitor, "sharedMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", self);

  }
  setupAssistantLaunchedNotifyToken = self->_setupAssistantLaunchedNotifyToken;
  if (setupAssistantLaunchedNotifyToken)
  {
    notify_cancel(setupAssistantLaunchedNotifyToken);
    self->_setupAssistantLaunchedNotifyToken = 0;
  }
  setupAssistantFinishedNotifyToken = self->_setupAssistantFinishedNotifyToken;
  if (setupAssistantFinishedNotifyToken)
  {
    notify_cancel(setupAssistantFinishedNotifyToken);
    self->_setupAssistantFinishedNotifyToken = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)ICDeviceSetupStatusMonitor;
  -[ICDeviceSetupStatusMonitor dealloc](&v8, sel_dealloc);
}

- (BOOL)isSetupAssistantComplete
{
  ICDeviceSetupStatusMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = !v2->_setupAssistantComplete;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSetupAssistantComplete:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  NSObject *v6;
  void *v7;
  char v8;
  int v9;
  ICDeviceSetupStatusMonitor *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = self;
    v11 = 1024;
    v12 = v3;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Setup assistant has completed:%{BOOL}u", (uint8_t *)&v9, 0x12u);
  }

  self->_setupAssistantComplete = v3;
  if (v3)
  {
    -[ICDeviceSetupStatusMonitor _runAllPendingBlocksOfType:](self, "_runAllPendingBlocksOfType:", 0);
    +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isWatch");

    if ((v8 & 1) == 0)
      -[ICDeviceSetupStatusMonitor _runAllPendingBlocksOfType:](self, "_runAllPendingBlocksOfType:", 1);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)performBlockAfterBuddySetup:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSObject *workQueue;
  NSMutableArray *pendingBuddyCompleteBlocks;
  void *v8;
  _QWORD block[4];
  id v10;

  v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_setupAssistantComplete)
    {
      workQueue = self->_workQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__ICDeviceSetupStatusMonitor_performBlockAfterBuddySetup___block_invoke;
      block[3] = &unk_1E4390D18;
      v10 = v4;
      dispatch_async(workQueue, block);

    }
    else
    {
      pendingBuddyCompleteBlocks = self->_pendingBuddyCompleteBlocks;
      v8 = (void *)MEMORY[0x1A1AFA8D0](v4);
      -[NSMutableArray addObject:](pendingBuddyCompleteBlocks, "addObject:", v8);

    }
    os_unfair_lock_unlock(p_lock);
  }

}

- (void)performBlockAfterDeviceSetup:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  int v7;
  uint64_t v8;
  int v9;
  NSObject *workQueue;
  id *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSMutableArray *pendingSetupCompleteBlocks;
  void *v20;
  _QWORD block[4];
  id v22;
  _QWORD v23[4];
  _QWORD v24[2];
  uint8_t buf[4];
  ICDeviceSetupStatusMonitor *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isWatch");
    v8 = 40;
    if (v7)
      v8 = 41;
    v9 = *((unsigned __int8 *)&self->super.isa + v8);

    if (v9)
    {
      workQueue = self->_workQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __59__ICDeviceSetupStatusMonitor_performBlockAfterDeviceSetup___block_invoke_10;
      block[3] = &unk_1E4390D18;
      v11 = &v22;
      v22 = v4;
      dispatch_async(workQueue, block);
    }
    else
    {
      v12 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
      v13 = os_signpost_id_generate(v12);

      v14 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
      v15 = v14;
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A03E3000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "ICInitialSync", ", buf, 2u);
      }

      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __59__ICDeviceSetupStatusMonitor_performBlockAfterDeviceSetup___block_invoke;
      v23[3] = &unk_1E438DF40;
      v24[1] = v13;
      v11 = (id *)v24;
      v24[0] = v4;
      v16 = (void *)MEMORY[0x1A1AFA8D0](v23);
      v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = self;
        v27 = 2114;
        v28 = v18;
        _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Device %{public}@ has not completed setup and initial sync", buf, 0x16u);

      }
      pendingSetupCompleteBlocks = self->_pendingSetupCompleteBlocks;
      v20 = (void *)MEMORY[0x1A1AFA8D0](v16);
      -[NSMutableArray addObject:](pendingSetupCompleteBlocks, "addObject:", v20);

    }
    os_unfair_lock_unlock(p_lock);
  }

}

- (void)nanoPairedDeviceStatusMonitor:(id)a3 didChangeClientSyncState:(unint64_t)a4
{
  os_unfair_lock_s *p_lock;
  NSObject *v7;
  void *v8;
  int v9;
  ICDeviceSetupStatusMonitor *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (a4 == 3)
  {
    self->_watchInitialSyncIsComplete = 1;
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = self;
      v11 = 2114;
      v12 = v8;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Device %{public}@ has completed setup and initial sync", (uint8_t *)&v9, 0x16u);

    }
    -[ICDeviceSetupStatusMonitor _runAllPendingBlocksOfType:](self, "_runAllPendingBlocksOfType:", 1);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_runAllPendingBlocksOfType:(int64_t)a3
{
  int v3;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  NSObject *workQueue;
  _QWORD block[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  ICDeviceSetupStatusMonitor *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v5 = 24;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v5 = 32;
LABEL_5:
    v6 = (void *)objc_msgSend(*(id *)((char *)&self->super.isa + v5), "copy");
    objc_msgSend(*(id *)((char *)&self->super.isa + v5), "removeAllObjects");
    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v23 = self;
    v24 = 1024;
    v25 = objc_msgSend(v6, "count");
    v26 = 1024;
    v27 = v3;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Running %d blocks of type %d", buf, 0x18u);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    v12 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        workQueue = self->_workQueue;
        block[0] = v12;
        block[1] = 3221225472;
        block[2] = __57__ICDeviceSetupStatusMonitor__runAllPendingBlocksOfType___block_invoke;
        block[3] = &unk_1E4390D18;
        block[4] = v14;
        dispatch_async(workQueue, block);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSetupCompleteBlocks, 0);
  objc_storeStrong((id *)&self->_pendingBuddyCompleteBlocks, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

id __57__ICDeviceSetupStatusMonitor__runAllPendingBlocksOfType___block_invoke(uint64_t a1)
{
  return (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__ICDeviceSetupStatusMonitor_performBlockAfterDeviceSetup___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v6[16];

  v2 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A03E3000, v3, OS_SIGNPOST_INTERVAL_END, v4, "ICInitialSync", " enableTelemetry=YES ", v6, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__ICDeviceSetupStatusMonitor_performBlockAfterDeviceSetup___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__ICDeviceSetupStatusMonitor_performBlockAfterBuddySetup___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __35__ICDeviceSetupStatusMonitor__init__block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  int *v11;
  int *v12;
  NSObject *v13;
  uint64_t v14;
  id *v15;
  void *v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  uint64_t v20;
  id v21;
  const char *v22;
  int *v23;
  int *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  NSObject *v36;
  id v37;
  _QWORD handler[4];
  NSObject *v39;
  id v40;
  _BYTE buf[24];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v2 = (id *)getBYSetupAssistantLaunchedDarwinNotificationSymbolLoc_ptr;
  v42 = (void *)getBYSetupAssistantLaunchedDarwinNotificationSymbolLoc_ptr;
  if (!getBYSetupAssistantLaunchedDarwinNotificationSymbolLoc_ptr)
  {
    v3 = SetupAssistantLibrary();
    v2 = (id *)dlsym(v3, "BYSetupAssistantLaunchedDarwinNotification");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v2;
    getBYSetupAssistantLaunchedDarwinNotificationSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(buf, 8);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getBYSetupAssistantLaunchedDarwinNotification(void)");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("ICDeviceSetupStatusMonitor.m"), 23, CFSTR("%s"), dlerror());

    goto LABEL_29;
  }
  v4 = *v2;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  v7 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    if (v6)
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v4;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Registering for darwin notification: %{public}@", buf, 0x16u);
    }

    v9 = objc_retainAutorelease(v4);
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    v11 = *(int **)(a1 + 32);
    v12 = v11 + 12;
    v13 = *((_QWORD *)v11 + 2);
    handler[0] = v7;
    handler[1] = 3221225472;
    handler[2] = __35__ICDeviceSetupStatusMonitor__init__block_invoke_3;
    handler[3] = &unk_1E438C938;
    v39 = v11;
    v40 = v9;
    notify_register_dispatch(v10, v12, v13, handler);

    v5 = v39;
  }
  else if (v6)
  {
    v14 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v14;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to weak link symbol BYSetupAssistantLaunchedDarwinNotification", buf, 0xCu);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v15 = (id *)getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr;
  v42 = (void *)getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr;
  if (!getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr)
  {
    v16 = SetupAssistantLibrary();
    v15 = (id *)dlsym(v16, "BYSetupAssistantFinishedDarwinNotification");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v15;
    getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(buf, 8);
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getBYSetupAssistantFinishedDarwinNotification(void)");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("ICDeviceSetupStatusMonitor.m"), 24, CFSTR("%s"), dlerror());

LABEL_29:
    __break(1u);
  }
  v17 = *v15;
  v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v19)
    {
      v20 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v17;
      _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Registering for darwin notification: %{public}@", buf, 0x16u);
    }

    v21 = objc_retainAutorelease(v17);
    v22 = (const char *)objc_msgSend(v21, "UTF8String");
    v23 = *(int **)(a1 + 32);
    v24 = v23 + 11;
    v25 = *((_QWORD *)v23 + 2);
    v35[0] = v7;
    v35[1] = 3221225472;
    v35[2] = __35__ICDeviceSetupStatusMonitor__init__block_invoke_5;
    v35[3] = &unk_1E438C938;
    v36 = v23;
    v37 = v21;
    notify_register_dispatch(v22, v24, v25, v35);

    v18 = v36;
  }
  else if (v19)
  {
    v26 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v26;
    _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to weak link symbol BYSetupAssistantFinishedDarwinNotification", buf, 0xCu);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v27 = getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
  v42 = getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
  if (!getBYSetupAssistantNeedsToRunSymbolLoc_ptr)
  {
    v28 = SetupAssistantLibrary();
    v27 = dlsym(v28, "BYSetupAssistantNeedsToRun");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v27;
    getBYSetupAssistantNeedsToRunSymbolLoc_ptr = v27;
  }
  _Block_object_dispose(buf, 8);
  if (v27)
  {
    objc_msgSend(*(id *)(a1 + 32), "setSetupAssistantComplete:", ((unsigned int (*)(void))v27)() ^ 1);
  }
  else
  {
    v29 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v30;
      _os_log_impl(&dword_1A03E3000, v29, OS_LOG_TYPE_ERROR, "%{public}@ Could not determine if setup assistant needs to run - assume its not needed", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setSetupAssistantComplete:", 1);
  }

}

uint64_t __35__ICDeviceSetupStatusMonitor__init__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Received darwin notification: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "setSetupAssistantComplete:", 0);
}

uint64_t __35__ICDeviceSetupStatusMonitor__init__block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Received darwin notification: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "setSetupAssistantComplete:", 1);
}

void __43__ICDeviceSetupStatusMonitor_sharedMonitor__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ICDeviceSetupStatusMonitor _init]([ICDeviceSetupStatusMonitor alloc], "_init");
  v1 = (void *)sharedMonitor_sSharedMonitor_16225;
  sharedMonitor_sSharedMonitor_16225 = (uint64_t)v0;

}

@end
