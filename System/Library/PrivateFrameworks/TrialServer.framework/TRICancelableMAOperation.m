@implementation TRICancelableMAOperation

- (TRICancelableMAOperation)init
{
  TRICancelableMAOperation *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _PASLock *lock;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TRICancelableMAOperation;
  v2 = -[TRICancelableMAOperation init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    *(_WORD *)(v3 + 8) = 0;
    v4 = objc_opt_new();
    v5 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v4;

    *(_BYTE *)(v3 + 24) = 0;
    v6 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = 0;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v3);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v7;

  }
  return v2;
}

- (void)addSemaphore:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__TRICancelableMAOperation_addSemaphore___block_invoke;
  v7[3] = &unk_1E93333E0;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

intptr_t __41__TRICancelableMAOperation_addSemaphore___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a2 + 24))
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  else
    return objc_msgSend(*(id *)(a2 + 16), "addObject:", *(_QWORD *)(a1 + 32));
}

- (BOOL)isCanceled
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__TRICancelableMAOperation_isCanceled__block_invoke;
  v5[3] = &unk_1E9333408;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__TRICancelableMAOperation_isCanceled__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 24);
  return result;
}

- (void)cancel
{
  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_16);
}

void __34__TRICancelableMAOperation_cancel__block_invoke(uint64_t a1, void *a2)
{
  _BYTE *v2;
  id v3;
  NSObject *v4;
  const __CFString *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = v2;
  if (!v2[24])
  {
    v2[24] = 1;
    TRILogCategory_Server();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (*((_BYTE *)v3 + 8))
        v5 = CFSTR("due to deferral");
      else
        v5 = &stru_1E9336E60;
      *(_DWORD *)buf = 138543362;
      v21 = v5;
      _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "MA asset download activity was cancelled %{public}@", buf, 0xCu);
    }

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = *((id *)v3 + 2);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*((_QWORD *)&v15 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    objc_msgSend(*((id *)v3 + 2), "removeAllObjects");
    v11 = (void *)objc_opt_new();
    objc_msgSend(*((id *)v3 + 4), "assetSelector");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __34__TRICancelableMAOperation_cancel__block_invoke_339;
    v13[3] = &unk_1E9331240;
    v14 = v3;
    objc_msgSend(v11, "cancelActivityForSelector:completion:", v12, v13);

  }
}

void __34__TRICancelableMAOperation_cancel__block_invoke_339(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TRILogCategory_Server();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "assetSelector");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v4;
      _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Upon fetch operation being cancelled, failed to cancel activity for MAAutoAsset %{public}@: %{public}@", (uint8_t *)&v8, 0x16u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "assetSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEFAULT, "Upon fetch operation being cancelled, cancelled activity for MAAutoAsset: %{public}@", (uint8_t *)&v8, 0xCu);
    goto LABEL_6;
  }

}

- (void)setCurrentAsset:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__TRICancelableMAOperation_setCurrentAsset___block_invoke;
  v7[3] = &unk_1E93333E0;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

void __44__TRICancelableMAOperation_setCurrentAsset___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 32), *(id *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
