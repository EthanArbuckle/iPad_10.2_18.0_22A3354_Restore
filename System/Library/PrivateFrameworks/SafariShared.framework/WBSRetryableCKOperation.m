@implementation WBSRetryableCKOperation

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___WBSRetryableCKOperation;
  objc_msgSendSuper2(&v8, sel_keyPathsForValuesAffectingValueForKey_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("isExecuting")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("isFinished")))
  {
    objc_msgSend(v5, "setByAddingObject:", CFSTR("status"));
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }

  return v5;
}

- (WBSRetryableCKOperation)initWithOwner:(id)a3 handlingQueue:(id)a4
{
  id v6;
  id v7;
  WBSRetryableCKOperation *v8;
  WBSRetryableCKOperation *v9;
  WBSCloudKitOperationRetryManager *v10;
  WBSCloudKitOperationRetryManager *retryManager;
  void *v12;
  uint64_t v13;
  NSString *operationID;
  uint64_t v15;
  NSMutableArray *childOperationIDs;
  NSOperationQueue *v17;
  NSOperationQueue *operationQueue;
  void *v19;
  uint64_t v20;
  NSMutableSet *explicitlySetProperties;
  id v22;
  WBSRetryableCKOperation *v23;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)WBSRetryableCKOperation;
  v8 = -[WBSRetryableCKOperation init](&v25, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_owner, v6);
    objc_storeStrong((id *)&v9->_handlingQueue, a4);
    v10 = objc_alloc_init(WBSCloudKitOperationRetryManager);
    retryManager = v9->_retryManager;
    v9->_retryManager = v10;

    -[WBSCloudKitOperationRetryManager setScheduleQueue:](v9->_retryManager, "setScheduleQueue:", v7);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = objc_claimAutoreleasedReturnValue();
    operationID = v9->_operationID;
    v9->_operationID = (NSString *)v13;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    childOperationIDs = v9->_childOperationIDs;
    v9->_childOperationIDs = (NSMutableArray *)v15;

    v17 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v9->_operationQueue;
    v9->_operationQueue = v17;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.SafariShared.WBSRetryableCKOperation.%@.%p._operationQueue"), objc_opt_class(), v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v9->_operationQueue, "setName:", v19);

    -[NSOperationQueue setUnderlyingQueue:](v9->_operationQueue, "setUnderlyingQueue:", v7);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v20 = objc_claimAutoreleasedReturnValue();
    explicitlySetProperties = v9->_explicitlySetProperties;
    v9->_explicitlySetProperties = (NSMutableSet *)v20;

    v22 = objc_alloc_init(MEMORY[0x1E0C94F78]);
    -[WBSRetryableCKOperation setConfiguration:](v9, "setConfiguration:", v22);

    objc_msgSend(v6, "safari_setDeallocationSentinelForObserver:", v9);
    v23 = v9;
  }

  return v9;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained(&self->_owner);
  objc_msgSend(WeakRetained, "safari_removeDeallocationSentinelForObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WBSRetryableCKOperation;
  -[WBSRetryableCKOperation dealloc](&v4, sel_dealloc);
}

- (OS_os_log)log
{
  os_unfair_lock_s *p_internalLock;
  OS_os_log *v4;
  OS_os_log *v5;
  OS_os_log *v6;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_log;
  os_unfair_lock_unlock(p_internalLock);
  if (v4)
    v5 = v4;
  else
    v5 = (OS_os_log *)MEMORY[0x1E0C81028];
  v6 = v5;

  return v6;
}

- (void)setLog:(id)a3
{
  id v4;
  os_unfair_lock_s *p_internalLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_internalLock = &self->_internalLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__WBSRetryableCKOperation_setLog___block_invoke;
  v7[3] = &unk_1E4B2A118;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_lock(p_internalLock);
  __34__WBSRetryableCKOperation_setLog___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_internalLock);

}

uint64_t __34__WBSRetryableCKOperation_setLog___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 328), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "setLog:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328));
}

- (double)timeout
{
  os_unfair_lock_s *p_internalLock;
  double v4;
  double v5;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  -[WBSCloudKitOperationRetryManager timeout](self->_retryManager, "timeout");
  v5 = v4;
  os_unfair_lock_unlock(p_internalLock);
  return v5;
}

- (void)setTimeout:(double)a3
{
  os_unfair_lock_s *p_internalLock;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  -[WBSCloudKitOperationRetryManager setTimeout:](self->_retryManager, "setTimeout:", a3);
  os_unfair_lock_unlock(p_internalLock);
}

- (unint64_t)numberOfRetries
{
  os_unfair_lock_s *p_internalLock;
  unint64_t v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = -[WBSCloudKitOperationRetryManager numberOfRetries](self->_retryManager, "numberOfRetries");
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (int64_t)_status
{
  os_unfair_lock_s *p_internalLock;
  int64_t status;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  status = self->_status;
  os_unfair_lock_unlock(p_internalLock);
  return status;
}

- (void)_setStatus:(int64_t)a3
{
  os_unfair_lock_s *p_internalLock;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  self->_status = a3;
  os_unfair_lock_unlock(p_internalLock);
}

- (id)didReceiveNonRetryableError
{
  os_unfair_lock_s *p_internalLock;
  void *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = (void *)objc_msgSend(self->_didReceiveNonRetryableError, "copy");
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setDidReceiveNonRetryableError:(id)a3
{
  os_unfair_lock_s *p_internalLock;
  id v5;
  void *v6;
  id didReceiveNonRetryableError;

  p_internalLock = &self->_internalLock;
  v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)objc_msgSend(v5, "copy");

  didReceiveNonRetryableError = self->_didReceiveNonRetryableError;
  self->_didReceiveNonRetryableError = v6;

  -[NSMutableSet addObject:](self->_explicitlySetProperties, "addObject:", CFSTR("didReceiveNonRetryableError"));
  os_unfair_lock_unlock(p_internalLock);
}

- (id)didExceedRetryTimeout
{
  os_unfair_lock_s *p_internalLock;
  void *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = (void *)objc_msgSend(self->_didExceedRetryTimeout, "copy");
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setDidExceedRetryTimeout:(id)a3
{
  os_unfair_lock_s *p_internalLock;
  id v5;
  void *v6;
  id didExceedRetryTimeout;

  p_internalLock = &self->_internalLock;
  v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)objc_msgSend(v5, "copy");

  didExceedRetryTimeout = self->_didExceedRetryTimeout;
  self->_didExceedRetryTimeout = v6;

  -[NSMutableSet addObject:](self->_explicitlySetProperties, "addObject:", CFSTR("didExceedRetryTimeout"));
  os_unfair_lock_unlock(p_internalLock);
}

- (void)start
{
  NSObject *v3;
  NSObject *v4;
  NSOperationQueue *operationQueue;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  WBSRetryableCKOperation *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[WBSRetryableCKOperation _setStatus:](self, "_setStatus:", 1);
  if (-[WBSRetryableCKOperation isCancelled](self, "isCancelled"))
  {
    -[WBSRetryableCKOperation _setStatus:](self, "_setStatus:", 2);
    -[WBSRetryableCKOperation log](self, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v9 = self;
      _os_log_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_INFO, "Operation %{public}@ was cancelled before starting", buf, 0xCu);
    }

  }
  else
  {
    -[WBSRetryableCKOperation log](self, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v9 = self;
      _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_DEFAULT, "Operation %{public}@ is starting", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    operationQueue = self->_operationQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __32__WBSRetryableCKOperation_start__block_invoke;
    v6[3] = &unk_1E4B2BC78;
    objc_copyWeak(&v7, (id *)buf);
    -[NSOperationQueue addOperationWithBlock:](operationQueue, "addOperationWithBlock:", v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)buf);
  }
}

void __32__WBSRetryableCKOperation_start__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_scheduleNextOperation");
    WeakRetained = v2;
  }

}

- (void)cancel
{
  NSObject *v3;
  id WeakRetained;
  NSOperationQueue *operationQueue;
  _QWORD v6[4];
  id v7;
  objc_super v8;
  uint8_t buf[4];
  WBSRetryableCKOperation *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[WBSRetryableCKOperation log](self, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v10 = self;
    _os_log_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_DEFAULT, "Operation %{public}@ will cancel", buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)WBSRetryableCKOperation;
  -[WBSRetryableCKOperation cancel](&v8, sel_cancel);
  WeakRetained = objc_loadWeakRetained(&self->_owner);
  objc_msgSend(WeakRetained, "safari_removeDeallocationSentinelForObserver:", self);

  if (-[WBSRetryableCKOperation isExecuting](self, "isExecuting"))
  {
    objc_initWeak((id *)buf, self);
    operationQueue = self->_operationQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __33__WBSRetryableCKOperation_cancel__block_invoke;
    v6[3] = &unk_1E4B2BC78;
    objc_copyWeak(&v7, (id *)buf);
    -[NSOperationQueue addBarrierBlock:](operationQueue, "addBarrierBlock:", v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)buf);
  }
}

void __33__WBSRetryableCKOperation_cancel__block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v2;
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  os_unfair_lock_s *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 68);
    v3 = *(id *)&v2[90]._os_unfair_lock_opaque;
    v4 = *(void **)&v2[90]._os_unfair_lock_opaque;
    *(_QWORD *)&v2[90]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(v2 + 68);
    -[os_unfair_lock_s log](v2, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = objc_opt_class();
      objc_msgSend(v3, "operationID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543874;
      v9 = v6;
      v10 = 2114;
      v11 = v7;
      v12 = 2114;
      v13 = v2;
      _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_INFO, "Cancelling %{public}@ with ID %{public}@ in %{public}@", (uint8_t *)&v8, 0x20u);

    }
    objc_msgSend(v3, "cancel");
    -[os_unfair_lock_s _setStatus:](v2, "_setStatus:", 2);

  }
}

- (BOOL)isExecuting
{
  return -[WBSRetryableCKOperation _status](self, "_status") == 1;
}

- (BOOL)isFinished
{
  return -[WBSRetryableCKOperation _status](self, "_status") == 2;
}

- (int64_t)qualityOfService
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  objc_super v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WBSRetryableCKOperation;
  v3 = -[WBSRetryableCKOperation qualityOfService](&v15, sel_qualityOfService);
  -[WBSRetryableCKOperation configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasQualityOfService");

  if (v5)
  {
    -[WBSRetryableCKOperation configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "qualityOfService");
  }
  else
  {
    -[WBSRetryableCKOperation group](self, "group");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hasQualityOfService");

    v7 = (int64_t)v3;
    if (!v10)
      goto LABEL_6;
    -[WBSRetryableCKOperation group](self, "group");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "defaultConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v11, "qualityOfService");

  }
LABEL_6:
  if (v7 == -1)
  {
    -[WBSRetryableCKOperation configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v12, "qualityOfService");

  }
  if ((id)v7 != v3)
  {
    v14.receiver = self;
    v14.super_class = (Class)WBSRetryableCKOperation;
    -[WBSRetryableCKOperation setQualityOfService:](&v14, sel_setQualityOfService_, v7);
  }
  -[NSOperationQueue setQualityOfService:](self->_operationQueue, "setQualityOfService:", v7);
  return v7;
}

- (void)setQualityOfService:(int64_t)a3
{
  os_unfair_lock_s *p_internalLock;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  -[CKOperationConfiguration setQualityOfService:](self->_configuration, "setQualityOfService:", a3);
  os_unfair_lock_unlock(p_internalLock);
  -[WBSRetryableCKOperation qualityOfService](self, "qualityOfService");
}

- (CKOperationConfiguration)configuration
{
  os_unfair_lock_s *p_internalLock;
  CKOperationConfiguration *v4;
  void *v5;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_configuration;
  os_unfair_lock_unlock(p_internalLock);
  v5 = (void *)-[CKOperationConfiguration copy](v4, "copy");

  return (CKOperationConfiguration *)v5;
}

- (void)setConfiguration:(id)a3
{
  id v4;
  CKOperationConfiguration *v5;
  CKOperationConfiguration *configuration;
  id v7;

  v4 = a3;
  if (!v4)
    v4 = objc_alloc_init(MEMORY[0x1E0C94F78]);
  v7 = v4;
  os_unfair_lock_lock(&self->_internalLock);
  v5 = (CKOperationConfiguration *)objc_msgSend(v7, "copy");
  configuration = self->_configuration;
  self->_configuration = v5;

  os_unfair_lock_unlock(&self->_internalLock);
  -[WBSRetryableCKOperation qualityOfService](self, "qualityOfService");

}

- (CKOperationGroup)group
{
  os_unfair_lock_s *p_internalLock;
  CKOperationGroup *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_group;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setGroup:(id)a3
{
  CKOperationGroup *v4;
  CKOperationGroup *group;
  CKOperationGroup *v6;

  v4 = (CKOperationGroup *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  group = self->_group;
  self->_group = v4;
  v6 = v4;

  os_unfair_lock_unlock(&self->_internalLock);
  -[WBSCloudKitOperationRetryManager setOperationGroup:](self->_retryManager, "setOperationGroup:", v6);

  -[WBSRetryableCKOperation qualityOfService](self, "qualityOfService");
}

- (void)_scheduleNextOperation
{
  CKOperation *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  CKOperation *currentOperation;
  CKOperation *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((-[WBSRetryableCKOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    os_unfair_lock_lock(&self->_internalLock);
    -[WBSRetryableCKOperation _makeOperation](self, "_makeOperation");
    v3 = (CKOperation *)objc_claimAutoreleasedReturnValue();
    -[WBSRetryableCKOperation _setUpOperation:](self, "_setUpOperation:", v3);
    -[CKOperation operationID](v3, "operationID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](self->_childOperationIDs, "addObject:", v4);
    os_unfair_lock_unlock(&self->_internalLock);
    -[WBSRetryableCKOperation description](self, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_class();
    v7 = -[WBSRetryableCKOperation numberOfRetries](self, "numberOfRetries");
    -[WBSRetryableCKOperation log](self, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138544130;
      v19 = v6;
      v20 = 2114;
      v21 = v4;
      v22 = 2114;
      v23 = v5;
      v24 = 2048;
      v25 = v7;
      _os_log_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_INFO, "Will begin %{public}@ with ID %{public}@ in %{public}@ retry: %ld", buf, 0x2Au);
    }

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __49__WBSRetryableCKOperation__scheduleNextOperation__block_invoke;
    v13[3] = &unk_1E4B3F218;
    v13[4] = self;
    v14 = v4;
    v15 = v5;
    v16 = v6;
    v17 = v7;
    v9 = v5;
    v10 = v4;
    -[CKOperation setCompletionBlock:](v3, "setCompletionBlock:", v13);
    os_unfair_lock_lock(&self->_internalLock);
    currentOperation = self->_currentOperation;
    self->_currentOperation = v3;
    v12 = v3;

    os_unfair_lock_unlock(&self->_internalLock);
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v12);

  }
}

void __49__WBSRetryableCKOperation__scheduleNextOperation__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 64);
    v7 = 138544130;
    v8 = v5;
    v9 = 2114;
    v10 = v3;
    v11 = 2114;
    v12 = v4;
    v13 = 2048;
    v14 = v6;
    _os_log_impl(&dword_1A3D90000, v2, OS_LOG_TYPE_INFO, "Did finish %{public}@ with ID %{public}@ in %{public}@ retry: %ld", (uint8_t *)&v7, 0x2Au);
  }

}

- (void)sentinelDidDeallocateWithContext:(id)a3
{
  void (**ownerDidDeallocateBlock)(id, WBSRetryableCKOperation *);

  if (!-[WBSRetryableCKOperation isFinished](self, "isFinished", a3)
    && (-[WBSRetryableCKOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[WBSRetryableCKOperation cancel](self, "cancel");
    ownerDidDeallocateBlock = (void (**)(id, WBSRetryableCKOperation *))self->_ownerDidDeallocateBlock;
    if (ownerDidDeallocateBlock)
      ownerDidDeallocateBlock[2](ownerDidDeallocateBlock, self);
  }
}

- (BOOL)_scheduleRetryIfNeededForError:(id)a3
{
  id v4;
  id WeakRetained;
  WBSCloudKitOperationRetryManager *retryManager;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location[5];

  location[4] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(&self->_owner);
  if (WeakRetained)
  {
    objc_initWeak(location, self);
    retryManager = self->_retryManager;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __58__WBSRetryableCKOperation__scheduleRetryIfNeededForError___block_invoke;
    v18 = &unk_1E4B2BC78;
    objc_copyWeak(&v19, location);
    v7 = -[WBSCloudKitOperationRetryManager scheduleRetryIfNeededForError:usingBlock:](retryManager, "scheduleRetryIfNeededForError:usingBlock:", v4, &v15);
    if (v7 == 1)
    {
      -[WBSRetryableCKOperation log](self, "log", v15, v16, v17, v18);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WBSRetryableCKOperation _scheduleRetryIfNeededForError:].cold.2();
      }
    }
    else
    {
      if (v7 == 2)
      {
        -[WBSRetryableCKOperation log](self, "log", v15, v16, v17, v18);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v4, "safari_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          -[WBSRetryableCKOperation _scheduleRetryIfNeededForError:].cold.3();
        }

        os_unfair_lock_lock(&self->_internalLock);
        v13 = (void *)MEMORY[0x1A8599ED0](self->_didExceedRetryTimeout);
        os_unfair_lock_unlock(&self->_internalLock);
        v10 = MEMORY[0x1A8599ED0](v13);

        v11 = v10 != 0;
        if (!v10)
          goto LABEL_17;
      }
      else
      {
        if (v7 != 3)
        {
          v11 = 0;
          goto LABEL_19;
        }
        -[WBSRetryableCKOperation log](self, "log", v15, v16, v17, v18);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v4, "safari_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          -[WBSRetryableCKOperation _scheduleRetryIfNeededForError:].cold.1();
        }

        os_unfair_lock_lock(&self->_internalLock);
        v9 = (void *)MEMORY[0x1A8599ED0](self->_didReceiveNonRetryableError);
        os_unfair_lock_unlock(&self->_internalLock);
        v10 = MEMORY[0x1A8599ED0](v9);

        v11 = v10 != 0;
        if (!v10)
        {
LABEL_17:

LABEL_19:
          objc_destroyWeak(&v19);
          objc_destroyWeak(location);
          goto LABEL_20;
        }
      }
      (*(void (**)(uint64_t, WBSRetryableCKOperation *, id, id))(v10 + 16))(v10, self, WeakRetained, v4);
      -[WBSRetryableCKOperation _didFinishOperation](self, "_didFinishOperation");
    }
    v11 = 1;
    goto LABEL_17;
  }
  v11 = 1;
LABEL_20:

  return v11;
}

void __58__WBSRetryableCKOperation__scheduleRetryIfNeededForError___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 33);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __58__WBSRetryableCKOperation__scheduleRetryIfNeededForError___block_invoke_2;
    v4[3] = &unk_1E4B2A078;
    v4[4] = v2;
    objc_msgSend(v3, "addOperationWithBlock:", v4);
  }

}

uint64_t __58__WBSRetryableCKOperation__scheduleRetryIfNeededForError___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A3D90000, v2, OS_LOG_TYPE_INFO, "Will attempt retry of %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_scheduleNextOperation");
}

- (void)_didFinishOperation
{
  os_unfair_lock_s *p_internalLock;
  CKOperation *currentOperation;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  currentOperation = self->_currentOperation;
  self->_currentOperation = 0;

  os_unfair_lock_unlock(p_internalLock);
  -[WBSRetryableCKOperation _setStatus:](self, "_setStatus:", 2);
}

- (id)_makeOperation
{
  return 0;
}

- (void)_setUpOperation:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_msgSend(v4, "setConfiguration:", self->_configuration);
  objc_msgSend(v4, "setGroup:", self->_group);
  if (-[CKOperationConfiguration isLongLived](self->_configuration, "isLongLived"))
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __43__WBSRetryableCKOperation__setUpOperation___block_invoke;
    v5[3] = &unk_1E4B2BC78;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v4, "setLongLivedOperationWasPersistedBlock:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

}

void __43__WBSRetryableCKOperation__setUpOperation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 33);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __43__WBSRetryableCKOperation__setUpOperation___block_invoke_2;
    v4[3] = &unk_1E4B2A078;
    v4[4] = v2;
    objc_msgSend(v3, "addOperationWithBlock:", v4);
  }

}

void __43__WBSRetryableCKOperation__setUpOperation___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 248));
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 272));
    v3 = (void *)MEMORY[0x1A8599ED0](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 376));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 272));
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8599ED0](v3);

    if (v4)
      ((void (**)(_QWORD, _QWORD, id))v4)[2](v4, *(_QWORD *)(a1 + 32), WeakRetained);
    objc_msgSend(*(id *)(a1 + 32), "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_DEFAULT, "Long lived operation of %{public}@ was persisted", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_didFinishOperation");
  }

}

- (NSString)description
{
  os_unfair_lock_s *p_internalLock;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  NSString *operationID;
  void *v11;
  void *v12;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = (void *)-[NSMutableArray copy](self->_childOperationIDs, "copy");
  os_unfair_lock_unlock(p_internalLock);
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("; childOperationIDs: %@"), v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_1E4B40D18;
  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = objc_opt_class();
  operationID = self->_operationID;
  -[CKOperationGroup safari_logDescription](self->_group, "safari_logDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p; operationID: %@; %@%@>"), v9, self, operationID, v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (id)owner
{
  return objc_loadWeakRetained(&self->_owner);
}

- (OS_dispatch_queue)handlingQueue
{
  return self->_handlingQueue;
}

- (NSString)operationID
{
  return self->_operationID;
}

- (CKOperation)currentOperation
{
  return self->_currentOperation;
}

- (id)ownerDidDeallocateBlock
{
  return self->_ownerDidDeallocateBlock;
}

- (void)setOwnerDidDeallocateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (id)longLivedOperationWasPersistedBlock
{
  return self->_longLivedOperationWasPersistedBlock;
}

- (void)setLongLivedOperationWasPersistedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_longLivedOperationWasPersistedBlock, 0);
  objc_storeStrong(&self->_ownerDidDeallocateBlock, 0);
  objc_storeStrong((id *)&self->_currentOperation, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
  objc_storeStrong(&self->_didExceedRetryTimeout, 0);
  objc_storeStrong(&self->_didReceiveNonRetryableError, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_childOperationIDs, 0);
  objc_storeStrong((id *)&self->_retryManager, 0);
  objc_storeStrong((id *)&self->_explicitlySetProperties, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_handlingQueue, 0);
  objc_destroyWeak(&self->_owner);
}

- (void)_scheduleRetryIfNeededForError:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_1_1(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A3D90000, "Operation of %{public}@ failed with non-retryable error: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_scheduleRetryIfNeededForError:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_1_1(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A3D90000, "Failed to perform operation of %{public}@ with retryable error: %{public}@; will retry",
    v4,
    v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_scheduleRetryIfNeededForError:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_1_1(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A3D90000, "Retry timeout of %{public}@ exceeded, with error: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

@end
