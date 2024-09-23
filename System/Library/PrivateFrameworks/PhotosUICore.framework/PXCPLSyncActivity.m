@implementation PXCPLSyncActivity

- (PXCPLSyncActivity)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCPLSyncActivity.m"), 74, CFSTR("%s is not available as initializer"), "-[PXCPLSyncActivity init]");

  abort();
}

- (id)_init
{
  PXCPLSyncActivity *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *serialQueue;
  NSObject *v6;
  dispatch_block_t v7;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXCPLSyncActivity;
  v2 = -[PXCPLSyncActivity init](&v12, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.photos.pxcplsyncactivity", v3);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    objc_initWeak(&location, v2);
    v6 = v2->_serialQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __26__PXCPLSyncActivity__init__block_invoke;
    v9[3] = &unk_1E5148D30;
    objc_copyWeak(&v10, &location);
    v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_DETACHED, QOS_CLASS_UTILITY, 0, v9);
    dispatch_async(v6, v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[PXCPLSyncActivity _unsubscribeFromSyncProgress](self, "_unsubscribeFromSyncProgress");
  v3.receiver = self;
  v3.super_class = (Class)PXCPLSyncActivity;
  -[PXCPLSyncActivity dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p, syncing:%d>"), objc_opt_class(), self, self->_isSyncing);
}

- (void)setIsSyncing:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD v5[5];
  BOOL v6;

  v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_isSyncing != v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __34__PXCPLSyncActivity_setIsSyncing___block_invoke;
    v5[3] = &unk_1E5142B28;
    v5[4] = self;
    v6 = v3;
    -[PXCPLSyncActivity performChanges:](self, "performChanges:", v5);
  }
}

- (void)_setSyncProgress:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSProgress **p_syncProgress;
  NSProgress *syncProgress;
  id v11;

  v11 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(sel_userInfo);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  getCPLSyncProgressStateKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  p_syncProgress = &self->_syncProgress;
  syncProgress = self->_syncProgress;
  if (syncProgress)
    -[NSProgress removeObserver:forKeyPath:context:](syncProgress, "removeObserver:forKeyPath:context:", self, v8, _CPLSyncProgressStateObservationContext);
  objc_storeStrong((id *)&self->_syncProgress, a3);
  if (*p_syncProgress)
    -[NSProgress addObserver:forKeyPath:options:context:](*p_syncProgress, "addObserver:forKeyPath:options:context:", self, v8, 4, _CPLSyncProgressStateObservationContext);
  else
    -[PXCPLSyncActivity _updateIsSyncing](self, "_updateIsSyncing");

}

- (void)_setSyncProgressState:(unint64_t)a3
{
  NSObject *v4;
  unint64_t syncProgressState;
  __CFString *v6;
  int v7;
  PXCPLSyncActivity *v8;
  __int16 v9;
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_syncProgressState != a3)
  {
    self->_syncProgressState = a3;
    PLUserStatusGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      syncProgressState = self->_syncProgressState;
      if (syncProgressState > 4)
        v6 = 0;
      else
        v6 = off_1E5127418[syncProgressState];
      v7 = 138543618;
      v8 = self;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ Sync progress state changed:\"%@\", (uint8_t *)&v7, 0x16u);
    }

    -[PXCPLSyncActivity _updateIsSyncing](self, "_updateIsSyncing");
  }
}

- (void)_queue_subscribeToSyncProgress
{
  NSObject *v4;
  void *v5;
  double v6;
  double v7;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id syncProgressSubscriber;
  NSObject *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD aBlock[4];
  id v20;
  id location;
  _BYTE buf[24];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_syncProgressSubscriber)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCPLSyncActivity.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_syncProgressSubscriber"));

  }
  PLUserStatusGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = self;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Subscribe to sync progress", buf, 0xCu);
  }

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PXCPLSyncActivity__queue_subscribeToSyncProgress__block_invoke;
  aBlock[3] = &unk_1E51273E0;
  objc_copyWeak(&v20, &location);
  v5 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v7 = v6;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v8 = (id *)getCPLLibraryIdentifierSystemLibrarySymbolLoc_ptr;
  v23 = getCPLLibraryIdentifierSystemLibrarySymbolLoc_ptr;
  if (!getCPLLibraryIdentifierSystemLibrarySymbolLoc_ptr)
  {
    v9 = CloudPhotoLibraryLibrary();
    v8 = (id *)dlsym(v9, "CPLLibraryIdentifierSystemLibrary");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v8;
    getCPLLibraryIdentifierSystemLibrarySymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(buf, 8);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getCPLLibraryIdentifierSystemLibrary(void)");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PXCPLSyncActivity.m"), 23, CFSTR("%s"), dlerror());

    __break(1u);
  }
  v10 = *v8;
  objc_msgSend(CFSTR("com.apple.cpl."), "stringByAppendingString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB38A8], "_addSubscriberForCategory:usingPublishingHandler:", v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  syncProgressSubscriber = self->_syncProgressSubscriber;
  self->_syncProgressSubscriber = v12;

  PLUserStatusGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v15 - v7;
    _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Subscribed in: %f s", buf, 0x16u);
  }

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)_unsubscribeFromSyncProgress
{
  NSObject *v3;
  double v4;
  double v5;
  NSObject *v6;
  double v7;
  id syncProgressSubscriber;
  int v9;
  PXCPLSyncActivity *v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PLUserStatusGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = self;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Unsubscribe from sync progress", (uint8_t *)&v9, 0xCu);
  }

  if (self->_syncProgressSubscriber)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0CB38A8], "_removeSubscriber:", self->_syncProgressSubscriber);
    PLUserStatusGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v9 = 138543618;
      v10 = self;
      v11 = 2048;
      v12 = v7 - v5;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Unsubscribed in: %f s", (uint8_t *)&v9, 0x16u);
    }

    syncProgressSubscriber = self->_syncProgressSubscriber;
    self->_syncProgressSubscriber = 0;

  }
}

- (void)_updateIsSyncing
{
  _BOOL8 v2;

  if (self->_syncProgress)
    v2 = self->_syncProgressState - 1 < 3;
  else
    v2 = 0;
  -[PXCPLSyncActivity setIsSyncing:](self, "setIsSyncing:", v2);
}

- (void)_updateSyncProgressState
{
  void *v3;
  void *v4;
  id v5;

  -[NSProgress userInfo](self->_syncProgress, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getCPLSyncProgressStateKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PXCPLSyncActivity _setSyncProgressState:](self, "_setSyncProgressState:", objc_msgSend(v5, "unsignedIntegerValue"));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if ((void *)_CPLSyncProgressStateObservationContext == a6)
  {
    -[PXCPLSyncActivity _updateSyncProgressState](self, "_updateSyncProgressState", a3, a4, a5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PXCPLSyncActivity;
    -[PXCPLSyncActivity observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (BOOL)isSyncing
{
  return self->_isSyncing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncProgress, 0);
  objc_storeStrong(&self->_syncProgressSubscriber, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

id __51__PXCPLSyncActivity__queue_subscribeToSyncProgress__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  id *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD aBlock[4];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLUserStatusGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    *(_DWORD *)buf = 138543362;
    v14 = WeakRetained;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ Sync progress provided", buf, 0xCu);

  }
  v6 = (id *)(a1 + 32);
  v7 = objc_loadWeakRetained(v6);
  objc_msgSend(v7, "_setSyncProgress:", v3);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PXCPLSyncActivity__queue_subscribeToSyncProgress__block_invoke_20;
  aBlock[3] = &unk_1E5148D30;
  objc_copyWeak(&v12, v6);
  v8 = _Block_copy(aBlock);
  v9 = _Block_copy(v8);

  objc_destroyWeak(&v12);
  return v9;
}

void __51__PXCPLSyncActivity__queue_subscribeToSyncProgress__block_invoke_20(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLUserStatusGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = 138543362;
    v6 = WeakRetained;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEBUG, "%{public}@ Sync progress cleared", (uint8_t *)&v5, 0xCu);

  }
  v4 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v4, "_setSyncProgress:", 0);

}

uint64_t __34__PXCPLSyncActivity_setIsSyncing___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 128) = *(_BYTE *)(a1 + 40);
  PLUserStatusGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Syncing state changed", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 1);
}

void __26__PXCPLSyncActivity__init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_subscribeToSyncProgress");

}

+ (PXCPLSyncActivity)sharedInstance
{
  if (sharedInstance_predicate != -1)
    dispatch_once(&sharedInstance_predicate, &__block_literal_global_108284);
  return (PXCPLSyncActivity *)(id)sharedInstance__sharedInstance;
}

void __35__PXCPLSyncActivity_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PXCPLSyncActivity _init]([PXCPLSyncActivity alloc], "_init");
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;

}

@end
