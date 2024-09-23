@implementation W5ActivityManager

+ (id)sharedActivityManager
{
  if (_MergedGlobals_0 != -1)
    dispatch_once(&_MergedGlobals_0, &__block_literal_global_0);
  return (id)qword_253D89D50;
}

void __42__W5ActivityManager_sharedActivityManager__block_invoke()
{
  W5ActivityManager *v0;
  void *v1;

  v0 = objc_alloc_init(W5ActivityManager);
  v1 = (void *)qword_253D89D50;
  qword_253D89D50 = (uint64_t)v0;

}

- (W5ActivityManager)init
{
  W5ActivityManager *v2;
  W5ActivityManager *v3;
  NSTimer *eagerExitTimeout;
  uint64_t v5;
  NSMutableArray *active_transactions;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  uint8_t v11[16];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)W5ActivityManager;
  v2 = -[W5ActivityManager init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    eagerExitTimeout = v2->_eagerExitTimeout;
    v2->_eagerExitTimeout = 0;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    active_transactions = v3->_active_transactions;
    v3->_active_transactions = (NSMutableArray *)v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("W5ActivityManager", v7);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v8;

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v11 = 0;
    _os_log_error_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[wifivelocity] W5ActivityManager init error!", v11, 2u);
  }
  return v3;
}

- (BOOL)debugTimerEnabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentDomainForName:", CFSTR("com.apple.wifivelocity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("eager-exit-debug"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    NSLog(CFSTR("%s: Found preference value in domain: %@ key: %@"), "-[W5ActivityManager debugTimerEnabled]", CFSTR("com.apple.wifivelocity"), CFSTR("eager-exit-debug"));
    v5 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)debugTimer
{
  NSTimer *periodicActiveListTimer;
  _BOOL4 v4;
  _QWORD block[5];
  uint8_t buf[16];

  periodicActiveListTimer = self->_periodicActiveListTimer;
  v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (periodicActiveListTimer)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager debugTimer already setup", buf, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager configuring _periodicActiveListTimer", buf, 2u);
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __31__W5ActivityManager_debugTimer__block_invoke;
    block[3] = &unk_24C23C2D8;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __31__W5ActivityManager_debugTimer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__W5ActivityManager_debugTimer__block_invoke_2;
  v5[3] = &unk_24C23C300;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:repeats:block:", 1, v5, 5.0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

}

void __31__W5ActivityManager_debugTimer__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 40);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__W5ActivityManager_debugTimer__block_invoke_3;
  block[3] = &unk_24C23C2D8;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __31__W5ActivityManager_debugTimer__block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t i;
  uint64_t description;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t v13[128];
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v1 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = objc_msgSend(v1, "count");
    _os_log_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager activeTransactions %lu", buf, 0xCu);
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = v1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          description = os_transaction_get_description();
          *(_DWORD *)buf = 136315138;
          v15 = description;
          _os_log_impl(&dword_209C3B000, v6, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager activeTransaction %s", buf, 0xCu);
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)osTransactionCreate:(const char *)a3 transaction:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  const char *v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__W5ActivityManager_osTransactionCreate_transaction___block_invoke;
  block[3] = &unk_24C23C328;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_sync(queue, block);

}

void __53__W5ActivityManager_osTransactionCreate_transaction___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (_QWORD *)a1[4];
  if (!v2[2])
  {
    v3 = objc_msgSend(v2, "debugTimerEnabled");
    v2 = (_QWORD *)a1[4];
    if (v3)
    {
      objc_msgSend(v2, "debugTimer");
      v2 = (_QWORD *)a1[4];
    }
  }
  if (!v2[6])
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = a1[4];
    v6 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v4;

    v2 = (_QWORD *)a1[4];
  }
  v7 = (void *)v2[1];
  if (v7 && objc_msgSend(v7, "isValid"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager osTransactionCreate, timer was running, invalidating and freeing", (uint8_t *)&v13, 2u);
    }
    objc_msgSend(*(id *)(a1[4] + 8), "invalidate");
    v8 = a1[4];
    v9 = *(void **)(v8 + 8);
    *(_QWORD *)(v8 + 8) = 0;

  }
  objc_msgSend(*(id *)(a1[4] + 24), "addObject:", a1[5]);
  ++*(_QWORD *)(a1[4] + 48);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v10 = a1[6];
    v11 = objc_msgSend(*(id *)(a1[4] + 24), "count");
    v12 = *(_QWORD *)(a1[4] + 48);
    v13 = 136315650;
    v14 = v10;
    v15 = 2048;
    v16 = v11;
    v17 = 2048;
    v18 = v12;
    _os_log_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager osTransactionCreate %s, active count is now %lu, total started is now %lu", (uint8_t *)&v13, 0x20u);
  }
}

- (void)osTransactionComplete:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  uint8_t v7[8];
  _QWORD block[4];
  id v9;
  W5ActivityManager *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__W5ActivityManager_osTransactionComplete___block_invoke;
  block[3] = &unk_24C23C3A0;
  v6 = v4;
  v9 = v6;
  v10 = self;
  v11 = &v12;
  dispatch_sync(queue, block);
  if (*((_BYTE *)v13 + 24) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_error_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[wifivelocity] W5ActivityManager osTransactionComplete TRANSACTION NOT FOUND ASSERT", v7, 2u);
  }

  _Block_object_dispose(&v12, 8);
}

void __43__W5ActivityManager_osTransactionComplete___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  double v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD block[6];
  uint8_t buf[4];
  uint64_t description;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    description = os_transaction_get_description();
    _os_log_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager osTransactionComplete %s", buf, 0xCu);
  }
  if ((objc_msgSend(*(id *)(a1[5] + 24), "containsObject:", a1[4]) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v11 = os_transaction_get_description();
      v12 = objc_msgSend(*(id *)(a1[5] + 24), "count");
      *(_DWORD *)buf = 136315394;
      description = v11;
      v16 = 2048;
      v17 = v12;
      _os_log_error_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[wifivelocity] W5ActivityManager osTransactionComplete %s, TRANSACTION NOT FOUND, active count is now %lu", buf, 0x16u);
    }
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  objc_msgSend(*(id *)(a1[5] + 24), "removeObject:", a1[4]);
  ++*(_QWORD *)(a1[5] + 64);
  if (!objc_msgSend(*(id *)(a1[5] + 24), "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "persistentDomainForName:", CFSTR("com.apple.wifivelocity"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "objectForKey:", CFSTR("eager-exit-timeout"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      NSLog(CFSTR("%s: Found preference value in domain: %@ key: %@"), "-[W5ActivityManager osTransactionComplete:]_block_invoke", CFSTR("com.apple.wifivelocity"), CFSTR("eager-exit-timeout"));
      v5 = objc_msgSend(v4, "intValue");
      if (v5 < 1)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager empty, eager exit timer disabled via defaults write", buf, 2u);
        }
        goto LABEL_21;
      }
      v6 = (double)v5;
    }
    else
    {
      v6 = 300.0;
    }
    v7 = *(void **)(a1[5] + 8);
    v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v8)
      {
        *(_DWORD *)buf = 134217984;
        description = *(_QWORD *)&v6;
        _os_log_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager empty, extending running eager exit timer to %f seconds", buf, 0xCu);
        v7 = *(void **)(a1[5] + 8);
      }
      if (objc_msgSend(v7, "isValid"))
        objc_msgSend(*(id *)(a1[5] + 8), "invalidate");
      v9 = a1[5];
      v10 = *(void **)(v9 + 8);
      *(_QWORD *)(v9 + 8) = 0;

    }
    else if (v8)
    {
      *(_DWORD *)buf = 134217984;
      description = *(_QWORD *)&v6;
      _os_log_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager empty, configuring eager exit timer in %f seconds", buf, 0xCu);
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__W5ActivityManager_osTransactionComplete___block_invoke_14;
    block[3] = &unk_24C23C378;
    block[4] = a1[5];
    *(double *)&block[5] = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
LABEL_21:

  }
}

void __43__W5ActivityManager_osTransactionComplete___block_invoke_14(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];

  v2 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__W5ActivityManager_osTransactionComplete___block_invoke_2;
  v6[3] = &unk_24C23C350;
  v6[4] = *(_QWORD *)(a1 + 32);
  v6[5] = v2;
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:repeats:block:", 0, v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v3;

}

void __43__W5ActivityManager_osTransactionComplete___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(v4 + 64);
    objc_msgSend(*(id *)(v4 + 56), "timeIntervalSinceNow");
    v9 = 134218240;
    v10 = v5;
    v11 = 2048;
    v12 = -v6;
    _os_log_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager Completed %lu transactions within uptime of %f seconds", (uint8_t *)&v9, 0x16u);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 40);
    v9 = 134217984;
    v10 = v7;
    _os_log_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager Attempting Daemon Eager Exit due to inactivity timeout of %f seconds", (uint8_t *)&v9, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_executeTimerBlock");
  objc_msgSend(*(id *)(a1 + 32), "alternateExecutionBlockForCleanExit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8
    && (xpc_transaction_try_exit_clean() & 1) == 0
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager Cannot eager exit, still outstanding transactions", (uint8_t *)&v9, 2u);
  }

}

- (void)_executeTimerBlock
{
  void *v3;
  void (**v4)(void);

  -[W5ActivityManager alternateExecutionBlockForCleanExit](self, "alternateExecutionBlockForCleanExit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[W5ActivityManager alternateExecutionBlockForCleanExit](self, "alternateExecutionBlockForCleanExit");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (unint64_t)osTransactionsActive
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
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__W5ActivityManager_osTransactionsActive__block_invoke;
  v5[3] = &unk_24C23C3C8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__W5ActivityManager_osTransactionsActive__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)alternateExecutionBlockForCleanExit
{
  return self->_alternateExecutionBlockForCleanExit;
}

- (void)setAlternateExecutionBlockForCleanExit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (unint64_t)transactionsStarted
{
  return self->_transactionsStarted;
}

- (void)setTransactionsStarted:(unint64_t)a3
{
  self->_transactionsStarted = a3;
}

- (NSDate)dateFirstTransaction
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDateFirstTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (unint64_t)transactionsCompleted
{
  return self->_transactionsCompleted;
}

- (void)setTransactionsCompleted:(unint64_t)a3
{
  self->_transactionsCompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFirstTransaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_alternateExecutionBlockForCleanExit, 0);
  objc_storeStrong((id *)&self->_active_transactions, 0);
  objc_storeStrong((id *)&self->_periodicActiveListTimer, 0);
  objc_storeStrong((id *)&self->_eagerExitTimeout, 0);
}

@end
