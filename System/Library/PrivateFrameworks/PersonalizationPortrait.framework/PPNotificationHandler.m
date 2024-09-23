@implementation PPNotificationHandler

- (PPNotificationHandler)initWithName:(id)a3 waitSeconds:(double)a4
{
  id v7;
  PPNotificationHandler *v8;
  PPNotificationHandler *v9;
  double v10;
  void *v11;
  id v12;
  uint64_t v13;
  OS_dispatch_queue *waiterQueue;
  id v15;
  void *v16;
  uint64_t v17;
  _PASLock *lock;
  objc_super v20;

  v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PPNotificationHandler;
  v8 = -[PPNotificationHandler init](&v20, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v10 = 0.0;
    if (a4 >= 0.0)
      v10 = a4;
    v9->_waitSeconds = v10;
    v11 = (void *)MEMORY[0x1E0D81598];
    v12 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("PPNotificationHandler.%@.waiterQueue"), v7));
    objc_msgSend(v11, "autoreleasingSerialQueueWithLabel:qosClass:", objc_msgSend(v12, "UTF8String"), 9);
    v13 = objc_claimAutoreleasedReturnValue();
    waiterQueue = v9->_waiterQueue;
    v9->_waiterQueue = (OS_dispatch_queue *)v13;

    v15 = objc_alloc(MEMORY[0x1E0D815F0]);
    v16 = (void *)objc_opt_new();
    v17 = objc_msgSend(v15, "initWithGuardedData:", v16);
    lock = v9->_lock;
    v9->_lock = (_PASLock *)v17;

  }
  return v9;
}

- (void)_executeBlocksWithGuardedData:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  PPNotificationHandler *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v5 = (void *)MEMORY[0x18D7805AC]();
  objc_msgSend(v4[3], "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  pp_default_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v22 = objc_msgSend(v7, "count");
    v23 = objc_msgSend(v4[4], "count");
    *(_DWORD *)buf = 138412802;
    v30 = self;
    v31 = 2048;
    v32 = v22;
    v33 = 2048;
    v34 = v23;
    _os_log_debug_impl(&dword_18BE3A000, v8, OS_LOG_TYPE_DEBUG, "%@ is executing %tu blocks for %tu objects", buf, 0x20u);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x18D7805AC](v10);
        objc_msgSend(v4[4], "allObjects", (_QWORD)v24);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v16);

        objc_autoreleasePoolPop(v15);
        ++v13;
      }
      while (v11 != v13);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v11 = v10;
    }
    while (v10);
  }

  v17 = objc_opt_new();
  v18 = v4[4];
  v4[4] = (id)v17;

  pp_default_log_handle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v30 = self;
    _os_log_debug_impl(&dword_18BE3A000, v19, OS_LOG_TYPE_DEBUG, "%@ reset object buffer to an empty set", buf, 0xCu);
  }

  v20 = (void *)objc_opt_new();
  objc_msgSend(v20, "timeIntervalSince1970");
  v4[2] = v21;

  objc_autoreleasePoolPop(v5);
}

- (void)_delayedExecutionAfterSeconds:(double)a3
{
  void *v5;
  OS_dispatch_queue *waiterQueue;
  _QWORD v7[4];
  id v8;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0D81598];
  waiterQueue = self->_waiterQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__PPNotificationHandler__delayedExecutionAfterSeconds___block_invoke;
  v7[3] = &unk_1E226B998;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v5, "runAsyncOnQueue:afterDelaySeconds:block:", waiterQueue, v7, a3);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)fireWithObjects:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;
  PPNotificationHandler *v9;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__PPNotificationHandler_fireWithObjects___block_invoke;
  v7[3] = &unk_1E226B4D8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

- (void)addObserverBlock:(id)a3 forLifetimeOfObject:(id)a4
{
  id v6;
  id v7;
  _PASLock *lock;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__PPNotificationHandler_addObserverBlock_forLifetimeOfObject___block_invoke;
  v11[3] = &unk_1E226B500;
  v12 = v7;
  v13 = v6;
  v9 = v7;
  v10 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v11);

}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PPNotificationHandler: %@>"), self->_name);
}

- (double)waitSeconds
{
  return self->_waitSeconds;
}

- (void)setWaitSeconds:(double)a3
{
  self->_waitSeconds = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_waiterQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __62__PPNotificationHandler_addObserverBlock_forLifetimeOfObject___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a2 + 24);
  v5 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  v4 = (void *)MEMORY[0x18D780768]();
  objc_msgSend(v3, "setObject:forKey:", v4, *(_QWORD *)(a1 + 32));

}

void __41__PPNotificationHandler_fireWithObjects___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3[4], "addObjectsFromArray:");
    pp_default_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v19 = *(_QWORD *)(a1 + 40);
      v20 = objc_msgSend(*(id *)(a1 + 32), "count");
      v21 = objc_msgSend(v4[4], "count");
      v22 = 138412802;
      v23 = v19;
      v24 = 2048;
      v25 = v20;
      v26 = 2048;
      v27 = v21;
      _os_log_debug_impl(&dword_18BE3A000, v5, OS_LOG_TYPE_DEBUG, "%@ added %tu objects. Queue now has %tu.", (uint8_t *)&v22, 0x20u);
    }

  }
  pp_default_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 40);
    v22 = 138412290;
    v23 = v7;
    _os_log_impl(&dword_18BE3A000, v6, OS_LOG_TYPE_DEFAULT, "%@ is trying to fire", (uint8_t *)&v22, 0xCu);
  }

  if (*((_BYTE *)v4 + 8))
  {
    pp_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v22 = 138412290;
      v23 = v9;
      _os_log_impl(&dword_18BE3A000, v8, OS_LOG_TYPE_DEFAULT, "%@ delayedFiringInProgress was YES so doing nothing", (uint8_t *)&v22, 0xCu);
    }

  }
  else
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "timeIntervalSince1970");
    v12 = v11;

    v13 = v12 - *((double *)v4 + 2);
    v14 = *(double *)(*(_QWORD *)(a1 + 40) + 24);
    pp_default_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v13 >= v14)
    {
      if (v16)
      {
        v18 = *(_QWORD *)(a1 + 40);
        v22 = 138412290;
        v23 = v18;
        _os_log_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_DEFAULT, "%@ is firing immediately", (uint8_t *)&v22, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 40), "_executeBlocksWithGuardedData:", v4);
    }
    else
    {
      if (v16)
      {
        v17 = *(_QWORD *)(a1 + 40);
        v22 = 138412290;
        v23 = v17;
        _os_log_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_DEFAULT, "%@ waitSeconds has not elapsed, scheduling delayed execution", (uint8_t *)&v22, 0xCu);
      }

      *((_BYTE *)v4 + 8) = 1;
      objc_msgSend(*(id *)(a1 + 40), "_delayedExecutionAfterSeconds:", *(double *)(*(_QWORD *)(a1 + 40) + 24) - v13);
    }
  }

}

void __55__PPNotificationHandler__delayedExecutionAfterSeconds___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 1);
    v5[1] = 3221225472;
    v5[2] = __55__PPNotificationHandler__delayedExecutionAfterSeconds___block_invoke_2;
    v5[3] = &unk_1E226B4B0;
    v5[4] = v2;
    v4 = v2;
    v5[0] = MEMORY[0x1E0C809B0];
    objc_msgSend(v3, "runWithLockAcquired:", v5);
    v2 = v4;
  }

}

void __55__PPNotificationHandler__delayedExecutionAfterSeconds___block_invoke_2(uint64_t a1, void *a2)
{
  _BYTE *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  pp_default_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_18BE3A000, v4, OS_LOG_TYPE_DEFAULT, "%@ is done waiting to fire", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_executeBlocksWithGuardedData:", v3);
  v3[8] = 0;

}

- (void)waitOnQueueToDrain
{
  char v3;
  uint64_t v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  v3 = 10;
  v4 = MEMORY[0x1E0C809B0];
  while (*((_BYTE *)v9 + 24))
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("PPNotificationHandlerWaitOnQueueToDrainTimeout"), CFSTR("PPNotificationHandler waitOnQueueToDrain timeout"), 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v6);
    }
    usleep(0x186A0u);
    --v3;
    lock = self->_lock;
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __56__PPNotificationHandler_TestHelpers__waitOnQueueToDrain__block_invoke;
    v7[3] = &unk_1E226B888;
    v7[4] = &v8;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __56__PPNotificationHandler_TestHelpers__waitOnQueueToDrain__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 8);
  return result;
}

@end
