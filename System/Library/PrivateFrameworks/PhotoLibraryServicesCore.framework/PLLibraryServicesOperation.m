@implementation PLLibraryServicesOperation

- (PLLibraryServicesOperation)init
{
  PLLibraryServicesOperation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLLibraryServicesOperation;
  result = -[NSBlockOperation init](&v3, sel_init);
  if (result)
    result->_cancellationLock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_cancellationBlock)
    -[PLLibraryServicesOperation _safeRemoveCancellationObserver](self, "_safeRemoveCancellationObserver");
  v3.receiver = self;
  v3.super_class = (Class)PLLibraryServicesOperation;
  -[NSBlockOperation dealloc](&v3, sel_dealloc);
}

- (void)setExecutionBlockFromOperationBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PLLibraryServicesOperation_setExecutionBlockFromOperationBlock___block_invoke;
  v6[3] = &unk_1E376BBC0;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[NSBlockOperation addExecutionBlock:](self, "addExecutionBlock:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)_runOperationBlock:(id)a3
{
  void (**v4)(_QWORD);
  char v5;
  PLLibraryServicesOperation *v6;
  double v7;
  double v8;
  NSObject *v9;
  void *v10;
  qos_class_t v11;
  double v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  double v17;
  double v18;
  NSObject *v19;
  void *v20;
  qos_class_t v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  PLLibraryServicesOperation *v26;
  __int16 v27;
  double v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  v5 = objc_msgSend((id)objc_opt_class(), "shouldSuppressLogging");
  -[PLLibraryServicesOperation progress](self, "progress");
  v6 = (PLLibraryServicesOperation *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v8 = v7;
  if ((v5 & 1) == 0)
  {
    PLLibraryServicesGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[PLLibraryServicesOperation logPrefix](self, "logPrefix");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = qos_class_self();
      PLStringFromQoSClass(v11);
      v12 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v23 = 138543874;
      v24 = v10;
      v25 = 2114;
      v26 = self;
      v27 = 2114;
      v28 = v12;
      _os_log_impl(&dword_199DF7000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting operation %{public}@ with QoS %{public}@", (uint8_t *)&v23, 0x20u);

    }
  }
  -[PLLibraryServicesOperation becomeCurrentWithPendingUnitCount:](v6, "becomeCurrentWithPendingUnitCount:", -[PLLibraryServicesOperation totalUnitCount](v6, "totalUnitCount"));
  PLLibraryServicesGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    -[PLLibraryServicesOperation logPrefix](self, "logPrefix");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v14;
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_199DF7000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: progress becoming current: %@", (uint8_t *)&v23, 0x16u);

  }
  v4[2](v4);

  -[PLLibraryServicesOperation resignCurrent](v6, "resignCurrent");
  PLLibraryServicesGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    -[PLLibraryServicesOperation logPrefix](self, "logPrefix");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v16;
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_199DF7000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: progress resigned current: %@", (uint8_t *)&v23, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  if ((v5 & 1) == 0)
  {
    v18 = v17;
    PLLibraryServicesGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      -[PLLibraryServicesOperation logPrefix](self, "logPrefix");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = qos_class_self();
      PLStringFromQoSClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138544130;
      v24 = v20;
      v25 = 2114;
      v26 = self;
      v27 = 2048;
      v28 = v18 - v8;
      v29 = 2114;
      v30 = v22;
      _os_log_impl(&dword_199DF7000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Completed operation %{public}@ in %f seconds with QoS %{public}@", (uint8_t *)&v23, 0x2Au);

    }
  }

}

- (id)debugDescription
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)PLLibraryServicesOperation;
  -[PLLibraryServicesOperation description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PLLibraryServicesOperation progressPercentOfTotal](self, "progressPercentOfTotal");
  PLStringFromLibraryServicesState(-[PLLibraryServicesOperation requiredState](self, "requiredState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLLibraryServicesOperation qualityOfService](self, "qualityOfService");
  if (v7 <= 16)
  {
    if (v7 == -1)
    {
      v8 = CFSTR("NSQualityOfServiceDefault");
      goto LABEL_13;
    }
    if (v7 == 9)
    {
      v8 = CFSTR("NSQualityOfServiceBackground");
      goto LABEL_13;
    }
LABEL_12:
    v8 = CFSTR("Unknown");
    goto LABEL_13;
  }
  if (v7 == 17)
  {
    v8 = CFSTR("NSQualityOfServiceUtility");
    goto LABEL_13;
  }
  if (v7 == 33)
  {
    v8 = CFSTR("NSQualityOfServiceUserInteractive");
    goto LABEL_13;
  }
  if (v7 != 25)
    goto LABEL_12;
  v8 = CFSTR("NSQualityOfServiceUserInitiated");
LABEL_13:
  v9 = v8;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ progressUnits=%ld req=%@ qos=%@"), v4, v5, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setCancellationBlock:(id)a3
{
  id v4;
  os_unfair_lock_s *p_cancellationLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_cancellationLock = &self->_cancellationLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__PLLibraryServicesOperation_setCancellationBlock___block_invoke;
  v7[3] = &unk_1E376C7A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  PLSafeRunWithUnfairLock(p_cancellationLock, v7);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;
  _QWORD v14[4];
  id v15;
  id v16;
  PLLibraryServicesOperation *v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 == CFSTR("cancel changed context") && self->_cancellationBlock)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __77__PLLibraryServicesOperation_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v14[3] = &unk_1E376BBE8;
    v15 = v10;
    v16 = v12;
    v17 = self;
    PLSafeRunWithUnfairLock(&self->_cancellationLock, v14);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PLLibraryServicesOperation;
    -[PLLibraryServicesOperation observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)_safeRemoveCancellationObserver
{
  -[PLLibraryServicesOperation removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("cancelled"), CFSTR("cancel changed context"));
}

- (int64_t)requiredState
{
  return self->_requiredState;
}

- (void)setRequiredState:(int64_t)a3
{
  self->_requiredState = a3;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (int64_t)progressPercentOfTotal
{
  return self->_progressPercentOfTotal;
}

- (void)setProgressPercentOfTotal:(int64_t)a3
{
  self->_progressPercentOfTotal = a3;
}

- (id)cancellationBlock
{
  return self->_cancellationBlock;
}

- (NSString)logPrefix
{
  return (NSString *)objc_getProperty(self, a2, 304, 1);
}

- (void)setLogPrefix:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 304);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_cancellationBlock, 0);
}

void __77__PLLibraryServicesOperation_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  BOOL v6;
  uint64_t v7;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("cancelled")))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "BOOLValue");

    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if (v3)
      v6 = 1;
    else
      v6 = v5 == 0;
    if (!v6)
    {
      v7 = *(_QWORD *)(a1 + 48);
      if (!*(_BYTE *)(v7 + 276))
      {
        *(_BYTE *)(v7 + 276) = 1;
        (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 264) + 16))();
      }
    }
  }
}

void __51__PLLibraryServicesOperation_setCancellationBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264);
  v3 = MEMORY[0x19AEC3014](*(_QWORD *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 264);
  *(_QWORD *)(v4 + 264) = v3;

  if (*(_QWORD *)(a1 + 40))
  {
    if (!v2)
      objc_msgSend(*(id *)(a1 + 32), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("cancelled"), 3, CFSTR("cancel changed context"));
  }
  else if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_safeRemoveCancellationObserver");
  }
}

void __66__PLLibraryServicesOperation_setExecutionBlockFromOperationBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_runOperationBlock:", *(_QWORD *)(a1 + 32));

}

+ (void)setShouldSuppressLogging:(BOOL)a3
{
  _shouldSuppressLogging = a3;
}

+ (BOOL)shouldSuppressLogging
{
  return _shouldSuppressLogging;
}

+ (id)operationWithName:(id)a3 requiredState:(int64_t)a4 parentProgress:(id)a5 execution:(id)a6
{
  id v9;
  id v10;
  id v11;
  PLLibraryServicesOperation *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  v11 = a5;
  v12 = objc_alloc_init(PLLibraryServicesOperation);
  -[PLLibraryServicesOperation setName:](v12, "setName:", v9);
  -[PLLibraryServicesOperation setRequiredState:](v12, "setRequiredState:", a4);
  v13 = (int)PLProgressPercentForOperationName(v9);
  -[PLLibraryServicesOperation setProgressPercentOfTotal:](v12, "setProgressPercentOfTotal:", v13);
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLibraryServicesOperation setProgress:](v12, "setProgress:", v14);

  -[PLLibraryServicesOperation progress](v12, "progress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addChild:withPendingUnitCount:", v15, v13);

  PLLibraryServicesGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    -[PLLibraryServicesOperation progress](v12, "progress");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v9;
    v21 = 2112;
    v22 = v17;
    _os_log_impl(&dword_199DF7000, v16, OS_LOG_TYPE_DEBUG, "operation %@ progress: %@", (uint8_t *)&v19, 0x16u);

  }
  -[PLLibraryServicesOperation setExecutionBlockFromOperationBlock:](v12, "setExecutionBlockFromOperationBlock:", v10);

  return v12;
}

@end
