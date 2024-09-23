@implementation TRIPruningFactorLevelCache

- (TRIPruningFactorLevelCache)initWithPruningDelaySeconds:(double)a3 loadFactorLevels:(id)a4
{
  id v6;
  TRIPruningFactorLevelCache *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _PASLock *lock;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  _PASSimpleCoalescingTimer *pruningTimer;
  double v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id location;
  objc_super v28;

  v6 = a4;
  v28.receiver = self;
  v28.super_class = (Class)TRIPruningFactorLevelCache;
  v7 = -[TRIPruningFactorLevelCache init](&v28, sel_init);
  if (v7)
  {
    v8 = (_QWORD *)objc_opt_new();
    v9 = MEMORY[0x1A1AC6D30](v6);
    v10 = (void *)v8[1];
    v8[1] = v9;

    v11 = objc_opt_new();
    v12 = (void *)v8[2];
    v8[2] = v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v8);
    lock = v7->_lock;
    v7->_lock = (_PASLock *)v13;

    objc_initWeak(&location, v7);
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __75__TRIPruningFactorLevelCache_initWithPruningDelaySeconds_loadFactorLevels___block_invoke;
    v25 = &unk_1E3BFF650;
    objc_copyWeak(&v26, &location);
    v15 = (void *)MEMORY[0x1A1AC6D30](&v22);
    v16 = objc_alloc(MEMORY[0x1E0D81618]);
    dispatch_get_global_queue(9, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "initWithQueue:leewaySeconds:operation:", v17, v15, 1.0, v22, v23, v24, v25);
    pruningTimer = v7->_pruningTimer;
    v7->_pruningTimer = (_PASSimpleCoalescingTimer *)v18;

    v20 = 0.0;
    if (a3 >= 0.0)
      v20 = a3;
    v7->_pruningDelaySeconds = v20;

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

  }
  return v7;
}

void __71__TRIPruningFactorLevelCache__populateCacheForRequiredKey_guardedData___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v3 = (void *)MEMORY[0x1A1AC6B8C]();
  if (objc_msgSend(v12, "hasFactor"))
  {
    objc_msgSend(v12, "factor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasName");

    if (v5)
    {
      objc_msgSend(v12, "factor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = *(void **)(a1 + 32);
      if (v8 && (objc_msgSend(v8, "isEqualToString:", v7) & 1) != 0
        || (v9 = (_QWORD *)(a1 + 40),
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKeyedSubscript:", v7),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v10,
            v10))
      {
        v9 = (_QWORD *)(a1 + 40);
        v11 = 16;
      }
      else
      {
        v11 = 24;
      }
      objc_msgSend(*(id *)(*v9 + v11), "setObject:forKeyedSubscript:", v12, v7);

    }
  }
  objc_autoreleasePoolPop(v3);

}

- (void)_populateCacheForRequiredKey:(id)a3 guardedData:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_opt_new();
  v9 = (void *)*((_QWORD *)v7 + 3);
  *((_QWORD *)v7 + 3) = v8;

  if (*((_QWORD *)v7 + 1))
  {
    v10 = (void *)MEMORY[0x1A1AC6B8C]();
    (*(void (**)(void))(*((_QWORD *)v7 + 1) + 16))();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v10);
    if (v11)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __71__TRIPruningFactorLevelCache__populateCacheForRequiredKey_guardedData___block_invoke;
      v21[3] = &unk_1E3BFF6F0;
      v22 = v6;
      v23 = v7;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", v21);

      goto LABEL_8;
    }
    TRILogCategory_ClientFramework();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v14;
      _os_log_impl(&dword_19B89C000, v12, OS_LOG_TYPE_INFO, "%@: dropping loadFactorLevels because it failed", buf, 0xCu);

    }
    v15 = (void *)*((_QWORD *)v7 + 1);
    *((_QWORD *)v7 + 1) = 0;

  }
  v11 = 0;
LABEL_8:
  TRILogCategory_ClientFramework();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v11, "count");
    v20 = objc_msgSend(*((id *)v7 + 3), "count");
    *(_DWORD *)buf = 138412802;
    v25 = v18;
    v26 = 2048;
    v27 = v19;
    v28 = 2048;
    v29 = v20;
    _os_log_impl(&dword_19B89C000, v16, OS_LOG_TYPE_INFO, "%@: reloaded %tu factor levels (%tu prefetched)", buf, 0x20u);

  }
  if (objc_msgSend(*((id *)v7 + 3), "count"))
    -[_PASSimpleCoalescingTimer runAfterDelaySeconds:coalescingBehavior:](self->_pruningTimer, "runAfterDelaySeconds:coalescingBehavior:", 1, self->_pruningDelaySeconds);

}

- (void)enumerateFactorLevelsUsingBlock:(id)a3
{
  id v5;
  _PASLock *lock;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__4;
  v17 = __Block_byref_object_dispose__4;
  v18 = 0;
  lock = self->_lock;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__TRIPruningFactorLevelCache_enumerateFactorLevelsUsingBlock___block_invoke;
  v12[3] = &unk_1E3BFF6A0;
  v12[5] = &v13;
  v12[6] = a2;
  v12[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v12);
  v8 = (void *)v14[5];
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __62__TRIPruningFactorLevelCache_enumerateFactorLevelsUsingBlock___block_invoke_36;
  v10[3] = &unk_1E3BFF6C8;
  v9 = v5;
  v11 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

  _Block_object_dispose(&v13, 8);
}

void __62__TRIPruningFactorLevelCache_enumerateFactorLevelsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3[2])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TRIFactorLevelCaching.m"), 164, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("guardedData->requiredLevels"));

  }
  v4 = v3[3];
  TRILogCategory_ClientFramework();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v15;
      _os_log_debug_impl(&dword_19B89C000, v6, OS_LOG_TYPE_DEBUG, "%@: allValues prefetch hit", buf, 0xCu);

    }
    goto LABEL_6;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl(&dword_19B89C000, v6, OS_LOG_TYPE_INFO, "%@: allValues requires cache reload", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_populateCacheForRequiredKey:guardedData:", 0, v3);
  if (!v3[3])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TRIFactorLevelCaching.m"), 173, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("guardedData->prefetchedLevels"));
LABEL_6:

  }
  objc_msgSend(v3[2], "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3[3], "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

- (id)objectForKeyedSubscript:(id)a3
{
  id v5;
  void *v6;
  _PASLock *lock;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  SEL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v6 = (void *)MEMORY[0x1A1AC6B8C]();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  v20 = 0;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__TRIPruningFactorLevelCache_objectForKeyedSubscript___block_invoke;
  v11[3] = &unk_1E3BFF678;
  v13 = &v15;
  v14 = a2;
  v11[4] = self;
  v8 = v5;
  v12 = v8;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  objc_autoreleasePoolPop(v6);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pruningTimer, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __54__TRIPruningFactorLevelCache_objectForKeyedSubscript___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  objc_class *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3[2];
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("TRIFactorLevelCaching.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("guardedData->requiredLevels"));

    v4 = v3[2];
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v8 = v3[3];
    if (v8)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
        TRILogCategory_ClientFramework();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          v20 = (objc_class *)objc_opt_class();
          NSStringFromClass(v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          v26 = v21;
          v27 = 2112;
          v28 = v22;
          _os_log_debug_impl(&dword_19B89C000, v12, OS_LOG_TYPE_DEBUG, "%@: objectForKeyedSubscript:%@ prefetch hit", buf, 0x16u);

        }
        objc_msgSend(v3[3], "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
        objc_msgSend(v3[2], "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "runAfterDelaySeconds:coalescingBehavior:", 1, *(double *)(*(_QWORD *)(a1 + 32) + 24));
      }
    }
    else
    {
      TRILogCategory_ClientFramework();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v26 = v15;
        v27 = 2112;
        v28 = v16;
        _os_log_impl(&dword_19B89C000, v13, OS_LOG_TYPE_INFO, "%@: objectForKeyedSubscript:%@ requires cache reload", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "_populateCacheForRequiredKey:guardedData:", *(_QWORD *)(a1 + 40), v3);
      if (!v3[3])
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("TRIFactorLevelCaching.m"), 149, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("guardedData->prefetchedLevels"));

      }
      objc_msgSend(v3[2], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

    }
  }

}

void __75__TRIPruningFactorLevelCache_initWithPruningDelaySeconds_loadFactorLevels___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pruneSynchronously");

}

- (void)pruneSynchronously
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__TRIPruningFactorLevelCache_pruneSynchronously__block_invoke;
  v3[3] = &unk_1E3BFF718;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

void __48__TRIPruningFactorLevelCache_pruneSynchronously__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TRILogCategory_ClientFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v2[3], "count");
    v7 = objc_msgSend(v2[3], "count");
    v8 = objc_msgSend(v2[2], "count");
    v10 = 138412802;
    v11 = v5;
    v12 = 2048;
    v13 = v6;
    v14 = 2048;
    v15 = v8 + v7;
    _os_log_impl(&dword_19B89C000, v3, OS_LOG_TYPE_INFO, "%@: pruning %tu prefetched factor levels of %tu total", (uint8_t *)&v10, 0x20u);

  }
  v9 = v2[3];
  v2[3] = 0;

}

void __62__TRIPruningFactorLevelCache_enumerateFactorLevelsUsingBlock___block_invoke_36(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)MEMORY[0x1A1AC6B8C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v3);

}

- (id)factorLevelCurrentlyCachedForFactorName:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__TRIPruningFactorLevelCache_factorLevelCurrentlyCachedForFactorName___block_invoke;
  v9[3] = &unk_1E3BFF740;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __70__TRIPruningFactorLevelCache_factorLevelCurrentlyCachedForFactorName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id *v9;

  v9 = a2;
  objc_msgSend(v9[2], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(v9[3], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

@end
