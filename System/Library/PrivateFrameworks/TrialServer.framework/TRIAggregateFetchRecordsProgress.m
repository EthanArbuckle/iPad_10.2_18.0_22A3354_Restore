@implementation TRIAggregateFetchRecordsProgress

- (TRIAggregateFetchRecordsProgress)initWithProgressBlock:(id)a3
{
  id v4;
  TRIAggregateFetchRecordsProgressGuardedData *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *perCKRecordProgress;
  NSMutableDictionary *v8;
  NSMutableDictionary *perMARecordProgress;
  void *v10;
  void *v11;
  TRIAggregateFetchRecordsProgress *v12;

  v4 = a3;
  v5 = objc_alloc_init(TRIAggregateFetchRecordsProgressGuardedData);
  v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  perCKRecordProgress = v5->perCKRecordProgress;
  v5->perCKRecordProgress = v6;

  v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  perMARecordProgress = v5->perMARecordProgress;
  v5->perMARecordProgress = v8;

  v5->expectedTotalBytes = 0;
  v5->actualBytesTransferred = 0;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v5);
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.trial.aggregate-progress", 17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[TRIAggregateFetchRecordsProgress initWithProgressBlockForTesting:guardedData:lock:dispatchQueue:](self, "initWithProgressBlockForTesting:guardedData:lock:dispatchQueue:", v4, v5, v10, v11);

  return v12;
}

- (TRIAggregateFetchRecordsProgress)initWithProgressBlockForTesting:(id)a3 guardedData:(id)a4 lock:(id)a5 dispatchQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  TRIAggregateFetchRecordsProgress *v14;
  uint64_t v15;
  id progress;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TRIAggregateFetchRecordsProgress;
  v14 = -[TRIAggregateFetchRecordsProgress init](&v18, sel_init);
  if (v14)
  {
    v15 = MEMORY[0x1D8232C48](v10);
    progress = v14->_progress;
    v14->_progress = (id)v15;

    objc_storeStrong((id *)&v14->_lock, a5);
    objc_storeStrong((id *)&v14->_queue, a6);
    -[TRIAggregateFetchRecordsProgress _issueCurrentProgressWithGuardedData:](v14, "_issueCurrentProgressWithGuardedData:", v11);
  }

  return v14;
}

- (double)_fractionCompletedWithGuardedData:(id)a3
{
  unint64_t v3;
  double v4;

  v3 = *((_QWORD *)a3 + 3);
  if (v3)
    v4 = (double)*((unint64_t *)a3 + 4) / (double)v3;
  else
    v4 = 0.0;
  return fmin(v4, 1.0);
}

- (void)_issueCurrentProgressWithGuardedData:(id)a3
{
  NSObject *queue;
  uint64_t v5;
  _QWORD v6[6];

  -[TRIAggregateFetchRecordsProgress _fractionCompletedWithGuardedData:](self, "_fractionCompletedWithGuardedData:", a3);
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__TRIAggregateFetchRecordsProgress__issueCurrentProgressWithGuardedData___block_invoke;
  v6[3] = &unk_1E932FA70;
  v6[4] = self;
  v6[5] = v5;
  dispatch_async(queue, v6);
}

uint64_t __73__TRIAggregateFetchRecordsProgress__issueCurrentProgressWithGuardedData___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, double))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(double *)(a1 + 40));
}

- (void)registerRecordId:(id)a3 withExpectedSize:(unint64_t)a4
{
  id v6;
  _PASLock *lock;
  id v8;
  _QWORD v9[4];
  id v10;
  TRIAggregateFetchRecordsProgress *v11;
  unint64_t v12;

  v6 = a3;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__TRIAggregateFetchRecordsProgress_registerRecordId_withExpectedSize___block_invoke;
  v9[3] = &unk_1E9331B50;
  v11 = self;
  v12 = a4;
  v10 = v6;
  v8 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);

}

void __70__TRIAggregateFetchRecordsProgress_registerRecordId_withExpectedSize___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  NSObject *v5;
  TRICKRecordProgress *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3[1], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v7;
      _os_log_error_impl(&dword_1D207F000, v5, OS_LOG_TYPE_ERROR, "Registering duplicate progress for CKRecordID %@", (uint8_t *)&v8, 0xCu);
    }

  }
  else
  {
    v6 = -[TRICKRecordProgress initWithSize:transferred:]([TRICKRecordProgress alloc], "initWithSize:transferred:", *(_QWORD *)(a1 + 48), 0);
    objc_msgSend(v3[1], "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 32));

    v3[3] = (char *)v3[3] + *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "_issueCurrentProgressWithGuardedData:", v3);
  }

}

- (void)unregisterRecordId:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;
  TRIAggregateFetchRecordsProgress *v9;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__TRIAggregateFetchRecordsProgress_unregisterRecordId___block_invoke;
  v7[3] = &unk_1E9331B78;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

void __55__TRIAggregateFetchRecordsProgress_unregisterRecordId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id *v5;

  v5 = a2;
  objc_msgSend(v5[1], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5[3] = (char *)v5[3] - objc_msgSend(v3, "size");
    v5[4] = (char *)v5[4] - objc_msgSend(v4, "transferred");
    objc_msgSend(v5[1], "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "_issueCurrentProgressWithGuardedData:", v5);
  }

}

- (void)setFractionCompleted:(double)a3 forRecordId:(id)a4
{
  id v6;
  _PASLock *lock;
  id v8;
  _QWORD v9[4];
  id v10;
  TRIAggregateFetchRecordsProgress *v11;
  double v12;

  v6 = a4;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__TRIAggregateFetchRecordsProgress_setFractionCompleted_forRecordId___block_invoke;
  v9[3] = &unk_1E9331B50;
  v12 = a3;
  v10 = v6;
  v11 = self;
  v8 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);

}

void __69__TRIAggregateFetchRecordsProgress_setFractionCompleted_forRecordId___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3[1], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "copyWithReplacementTransferred:", (unint64_t)(*(double *)(a1 + 48) * (double)(unint64_t)objc_msgSend(v4, "size")));
    objc_msgSend(v3[1], "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 32));
    v3[4] = (char *)v3[4] - objc_msgSend(v5, "transferred");
    v3[4] = (char *)v3[4] + -[NSObject transferred](v6, "transferred");
    objc_msgSend(*(id *)(a1 + 40), "_issueCurrentProgressWithGuardedData:", v3);
  }
  else
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v7;
      _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Unable to set progress for unexpected CKRecordID %@", (uint8_t *)&v8, 0xCu);
    }
  }

}

- (void)registerMAAsset:(id)a3 withExpectedSize:(unint64_t)a4
{
  id v6;
  _PASLock *lock;
  id v8;
  _QWORD v9[4];
  id v10;
  TRIAggregateFetchRecordsProgress *v11;
  unint64_t v12;

  v6 = a3;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__TRIAggregateFetchRecordsProgress_registerMAAsset_withExpectedSize___block_invoke;
  v9[3] = &unk_1E9331B50;
  v11 = self;
  v12 = a4;
  v10 = v6;
  v8 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);

}

void __69__TRIAggregateFetchRecordsProgress_registerMAAsset_withExpectedSize___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  NSObject *v5;
  TRICKRecordProgress *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3[2], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v7;
      _os_log_error_impl(&dword_1D207F000, v5, OS_LOG_TYPE_ERROR, "Registering duplicate progress for MA asset ID %@", (uint8_t *)&v8, 0xCu);
    }

  }
  else
  {
    v6 = -[TRICKRecordProgress initWithSize:transferred:]([TRICKRecordProgress alloc], "initWithSize:transferred:", *(_QWORD *)(a1 + 48), 0);
    objc_msgSend(v3[2], "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 32));

    v3[3] = (char *)v3[3] + *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "_issueCurrentProgressWithGuardedData:", v3);
  }

}

- (void)unregisterMAAsset:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;
  TRIAggregateFetchRecordsProgress *v9;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__TRIAggregateFetchRecordsProgress_unregisterMAAsset___block_invoke;
  v7[3] = &unk_1E9331B78;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

void __54__TRIAggregateFetchRecordsProgress_unregisterMAAsset___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id *v5;

  v5 = a2;
  objc_msgSend(v5[2], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5[3] = (char *)v5[3] - objc_msgSend(v3, "size");
    v5[4] = (char *)v5[4] - objc_msgSend(v4, "transferred");
    objc_msgSend(v5[2], "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "_issueCurrentProgressWithGuardedData:", v5);
  }

}

- (void)setFractionCompleted:(double)a3 forMAAsset:(id)a4
{
  id v6;
  _PASLock *lock;
  id v8;
  _QWORD v9[4];
  id v10;
  TRIAggregateFetchRecordsProgress *v11;
  double v12;

  v6 = a4;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__TRIAggregateFetchRecordsProgress_setFractionCompleted_forMAAsset___block_invoke;
  v9[3] = &unk_1E9331B50;
  v12 = a3;
  v10 = v6;
  v11 = self;
  v8 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);

}

void __68__TRIAggregateFetchRecordsProgress_setFractionCompleted_forMAAsset___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3[2], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "copyWithReplacementTransferred:", (unint64_t)(*(double *)(a1 + 48) * (double)(unint64_t)objc_msgSend(v4, "size")));
    objc_msgSend(v3[2], "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 32));
    v3[4] = (char *)v3[4] - objc_msgSend(v5, "transferred");
    v3[4] = (char *)v3[4] + -[NSObject transferred](v6, "transferred");
    objc_msgSend(*(id *)(a1 + 40), "_issueCurrentProgressWithGuardedData:", v3);
  }
  else
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v7;
      _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Unable to set progress for unexpected MA asset ID %@", (uint8_t *)&v8, 0xCu);
    }
  }

}

- (void)setComplete
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__TRIAggregateFetchRecordsProgress_setComplete__block_invoke;
  block[3] = &unk_1E932F918;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __47__TRIAggregateFetchRecordsProgress_setComplete__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16))(1.0);
}

- (double)fractionCompleted
{
  _PASLock *lock;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__TRIAggregateFetchRecordsProgress_fractionCompleted__block_invoke;
  v5[3] = &unk_1E9331BA0;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__TRIAggregateFetchRecordsProgress_fractionCompleted__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(*(id *)(a1 + 32), "_fractionCompletedWithGuardedData:", a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong(&self->_progress, 0);
}

@end
