@implementation WAActivityManager

+ (id)sharedActivityManager
{
  if (_MergedGlobals_2 != -1)
    dispatch_once(&_MergedGlobals_2, &__block_literal_global_2);
  return (id)qword_253D3A4A0;
}

void __42__WAActivityManager_sharedActivityManager__block_invoke()
{
  WAActivityManager *v0;
  void *v1;

  v0 = objc_alloc_init(WAActivityManager);
  v1 = (void *)qword_253D3A4A0;
  qword_253D3A4A0 = (uint64_t)v0;

}

- (WAActivityManager)init
{
  WAActivityManager *v2;
  WAActivityManager *v3;
  NSTimer *eagerExitTimeout;
  uint64_t v5;
  NSMutableArray *active_transactions;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 isEagerExitEnabled;
  NSObject *v20;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)WAActivityManager;
  v2 = -[WAActivityManager init](&v21, sel_init);
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
    v8 = dispatch_queue_create("WAActivityManager", v7);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v8;

    v3->isEagerExitEnabled = 0;
    v10 = MGGetProductType();
    WALogActivityManagerHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10 == 3348380076)
    {
      if (v12)
      {
        *(_DWORD *)buf = 136446466;
        v23 = "-[WAActivityManager init]";
        v24 = 1024;
        v25 = 77;
        _os_log_impl(&dword_212581000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WAActivityManager is b520, setting isEagerExitEnabled", buf, 0x12u);
      }

      v3->isEagerExitEnabled = 1;
    }
    else
    {
      if (v12)
      {
        *(_DWORD *)buf = 136446466;
        v23 = "-[WAActivityManager init]";
        v24 = 1024;
        v25 = 80;
        _os_log_impl(&dword_212581000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WAActivityManager is not b520, no isEagerExitEnabled", buf, 0x12u);
      }

    }
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "persistentDomainForName:", CFSTR("com.apple.wifianalyticsd"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "objectForKey:", CFSTR("eager-exit-enable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v3->isEagerExitEnabled = objc_msgSend(v15, "BOOLValue");
      WALogActivityManagerHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        isEagerExitEnabled = v3->isEagerExitEnabled;
        *(_DWORD *)buf = 136447234;
        v23 = "-[WAActivityManager init]";
        v24 = 1024;
        v25 = 88;
        v26 = 2112;
        v27 = CFSTR("com.apple.wifianalyticsd");
        v28 = 2112;
        v29 = CFSTR("eager-exit-enable");
        v30 = 1024;
        v31 = isEagerExitEnabled;
        _os_log_impl(&dword_212581000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found preference value in domain: %@ key: %@ value: %d", buf, 0x2Cu);
      }

    }
    v3->waitingToInitDebugTimer = 0;
  }
  else
  {
    WALogActivityManagerHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v23 = "-[WAActivityManager init]";
      v24 = 1024;
      v25 = 100;
      _os_log_impl(&dword_212581000, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:WAActivityManager init error!", buf, 0x12u);
    }

  }
  return v3;
}

- (BOOL)isEagerExitEnabled
{
  return self->isEagerExitEnabled;
}

- (BOOL)debugTimerEnabled
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  char v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentDomainForName:", CFSTR("com.apple.wifianalyticsd"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("eager-exit-debug"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    WALogActivityManagerHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136446978;
      v9 = "-[WAActivityManager debugTimerEnabled]";
      v10 = 1024;
      v11 = 121;
      v12 = 2112;
      v13 = CFSTR("com.apple.wifianalyticsd");
      v14 = 2112;
      v15 = CFSTR("eager-exit-debug");
      _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found preference value in domain: %@ key: %@", (uint8_t *)&v8, 0x26u);
    }

    v6 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)debugTimer
{
  NSObject *v2;
  NSObject *v3;
  WAActivityManager *obj;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (self->_periodicActiveListTimer)
  {
    WALogActivityManagerHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v7 = "-[WAActivityManager debugTimer]";
      v8 = 1024;
      v9 = 130;
      _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WAActivityManager debugTimer already setup", buf, 0x12u);
    }

  }
  else
  {
    obj = self;
    objc_sync_enter(obj);
    if (obj->waitingToInitDebugTimer)
    {
      objc_sync_exit(obj);

    }
    else
    {
      WALogActivityManagerHandle();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v7 = "-[WAActivityManager debugTimer]";
        v8 = 1024;
        v9 = 136;
        _os_log_impl(&dword_212581000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:configuring _periodicActiveListTimer", buf, 0x12u);
      }

      obj->waitingToInitDebugTimer = 1;
      objc_sync_exit(obj);

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __31__WAActivityManager_debugTimer__block_invoke;
      block[3] = &unk_24CDDCCF8;
      block[4] = obj;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
  }
}

void __31__WAActivityManager_debugTimer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__WAActivityManager_debugTimer__block_invoke_2;
  v6[3] = &unk_24CDDDE50;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:repeats:block:", 1, v6, 5.0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  WALogActivityManagerHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v8 = "-[WAActivityManager debugTimer]_block_invoke";
    v9 = 1024;
    v10 = 160;
    _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:configured _periodicActiveListTimer", buf, 0x12u);
  }

}

void __31__WAActivityManager_debugTimer__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 64);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__WAActivityManager_debugTimer__block_invoke_3;
  block[3] = &unk_24CDDCCF8;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __31__WAActivityManager_debugTimer__block_invoke_3(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSObject *v8;
  uint64_t description;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v1 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  WALogActivityManagerHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v16 = "-[WAActivityManager debugTimer]_block_invoke_3";
    v17 = 1024;
    v18 = 149;
    v19 = 2048;
    v20 = objc_msgSend(v1, "count");
    _os_log_impl(&dword_212581000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:activeTransactions %lu", buf, 0x1Cu);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        WALogActivityManagerHandle();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          description = os_transaction_get_description();
          *(_DWORD *)buf = 136446722;
          v16 = "-[WAActivityManager debugTimer]_block_invoke";
          v17 = 1024;
          v18 = 152;
          v19 = 2080;
          v20 = description;
          _os_log_impl(&dword_212581000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:activeTransaction %s", buf, 0x1Cu);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
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
  if (self->isEagerExitEnabled)
  {
    queue = self->_queue;
    block[1] = 3221225472;
    block[2] = __53__WAActivityManager_osTransactionCreate_transaction___block_invoke;
    block[3] = &unk_24CDDDE78;
    block[4] = self;
    v8 = v6;
    block[0] = MEMORY[0x24BDAC760];
    v10 = v6;
    v11 = a3;
    dispatch_sync(queue, block);

    v6 = v8;
  }

}

void __53__WAActivityManager_osTransactionCreate_transaction___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
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
  if (!v2[9])
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = a1[4];
    v6 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v4;

    v2 = (_QWORD *)a1[4];
  }
  v7 = (void *)v2[1];
  if (v7 && objc_msgSend(v7, "isValid"))
  {
    WALogActivityManagerHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136446466;
      v16 = "-[WAActivityManager osTransactionCreate:transaction:]_block_invoke";
      v17 = 1024;
      v18 = 184;
      _os_log_impl(&dword_212581000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:osTransactionCreate, timer was running, invalidating and freeing", (uint8_t *)&v15, 0x12u);
    }

    objc_msgSend(*(id *)(a1[4] + 8), "invalidate");
    v9 = a1[4];
    v10 = *(void **)(v9 + 8);
    *(_QWORD *)(v9 + 8) = 0;

  }
  objc_msgSend(*(id *)(a1[4] + 32), "addObject:", a1[5]);
  ++*(_QWORD *)(a1[4] + 72);
  WALogActivityManagerHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = a1[6];
    v13 = objc_msgSend(*(id *)(a1[4] + 32), "count");
    v14 = *(_QWORD *)(a1[4] + 72);
    v15 = 136447234;
    v16 = "-[WAActivityManager osTransactionCreate:transaction:]_block_invoke";
    v17 = 1024;
    v18 = 192;
    v19 = 2080;
    v20 = v12;
    v21 = 2048;
    v22 = v13;
    v23 = 2048;
    v24 = v14;
    _os_log_impl(&dword_212581000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:osTransactionCreate %s, active count is now %lu, total started is now %lu", (uint8_t *)&v15, 0x30u);
  }

}

- (void)osTransactionComplete:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  WAActivityManager *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  if (self->isEagerExitEnabled)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__WAActivityManager_osTransactionComplete___block_invoke;
    block[3] = &unk_24CDDCD20;
    v9 = v4;
    v10 = self;
    v11 = &v12;
    dispatch_sync(queue, block);
    if (*((_BYTE *)v13 + 24))
    {
      WALogActivityManagerHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v17 = "-[WAActivityManager osTransactionComplete:]";
        v18 = 1024;
        v19 = 269;
        _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:osTransactionComplete TRANSACTION NOT FOUND ASSERT", buf, 0x12u);
      }

    }
  }
  _Block_object_dispose(&v12, 8);

}

void __43__WAActivityManager_osTransactionComplete___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  double v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[6];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const __CFString *description;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  WALogActivityManagerHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v19 = "-[WAActivityManager osTransactionComplete:]_block_invoke";
    v20 = 1024;
    v21 = 208;
    v22 = 2080;
    description = (const __CFString *)os_transaction_get_description();
    _os_log_impl(&dword_212581000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:osTransactionComplete %s", buf, 0x1Cu);
  }

  if ((objc_msgSend(*(id *)(a1[5] + 32), "containsObject:", a1[4]) & 1) == 0)
  {
    WALogActivityManagerHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = os_transaction_get_description();
      v5 = objc_msgSend(*(id *)(a1[5] + 32), "count");
      *(_DWORD *)buf = 136446978;
      v19 = "-[WAActivityManager osTransactionComplete:]_block_invoke";
      v20 = 1024;
      v21 = 211;
      v22 = 2080;
      description = (const __CFString *)v4;
      v24 = 2048;
      v25 = (const __CFString *)v5;
      _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:osTransactionComplete %s, TRANSACTION NOT FOUND, active count before completing %lu", buf, 0x26u);
    }

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  objc_msgSend(*(id *)(a1[5] + 32), "removeObject:", a1[4]);
  ++*(_QWORD *)(a1[5] + 88);
  if (!objc_msgSend(*(id *)(a1[5] + 32), "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "persistentDomainForName:", CFSTR("com.apple.wifianalyticsd"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKey:", CFSTR("eager-exit-timeout"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      WALogActivityManagerHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446978;
        v19 = "-[WAActivityManager osTransactionComplete:]_block_invoke";
        v20 = 1024;
        v21 = 224;
        v22 = 2112;
        description = CFSTR("com.apple.wifianalyticsd");
        v24 = 2112;
        v25 = CFSTR("eager-exit-timeout");
        _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found preference value in domain: %@ key: %@", buf, 0x26u);
      }

      v10 = objc_msgSend(v8, "intValue");
      if (v10 < 1)
      {
        WALogActivityManagerHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v19 = "-[WAActivityManager osTransactionComplete:]_block_invoke";
          v20 = 1024;
          v21 = 263;
          _os_log_impl(&dword_212581000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_active_transactions empty, eager exit timer disabled via defaults write", buf, 0x12u);
        }

        goto LABEL_26;
      }
      v11 = (double)v10;
    }
    else
    {
      v11 = 300.0;
    }
    v12 = *(_QWORD *)(a1[5] + 8);
    WALogActivityManagerHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        *(_DWORD *)buf = 136446722;
        v19 = "-[WAActivityManager osTransactionComplete:]_block_invoke";
        v20 = 1024;
        v21 = 232;
        v22 = 2048;
        description = *(const __CFString **)&v11;
        _os_log_impl(&dword_212581000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_active_transactions empty, extending running eager exit timer to %f seconds", buf, 0x1Cu);
      }

      if (objc_msgSend(*(id *)(a1[5] + 8), "isValid"))
        objc_msgSend(*(id *)(a1[5] + 8), "invalidate");
      v15 = a1[5];
      v13 = *(NSObject **)(v15 + 8);
      *(_QWORD *)(v15 + 8) = 0;
    }
    else if (v14)
    {
      *(_DWORD *)buf = 136446722;
      v19 = "-[WAActivityManager osTransactionComplete:]_block_invoke";
      v20 = 1024;
      v21 = 230;
      v22 = 2048;
      description = *(const __CFString **)&v11;
      _os_log_impl(&dword_212581000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_active_transactions empty, configuring eager exit timer in %f seconds", buf, 0x1Cu);
    }

    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __43__WAActivityManager_osTransactionComplete___block_invoke_15;
    v17[3] = &unk_24CDDDEC8;
    v17[4] = a1[5];
    *(double *)&v17[5] = v11;
    dispatch_async(MEMORY[0x24BDAC9B8], v17);
LABEL_26:

  }
}

void __43__WAActivityManager_osTransactionComplete___block_invoke_15(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];

  v2 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__WAActivityManager_osTransactionComplete___block_invoke_2;
  v6[3] = &unk_24CDDDEA0;
  v6[4] = *(_QWORD *)(a1 + 32);
  v6[5] = v2;
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:repeats:block:", 0, v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v3;

}

void __43__WAActivityManager_osTransactionComplete___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WALogActivityManagerHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 88);
    objc_msgSend(*(id *)(v3 + 80), "timeIntervalSinceNow");
    v10 = 136446978;
    v11 = "-[WAActivityManager osTransactionComplete:]_block_invoke_2";
    v12 = 1024;
    v13 = 242;
    v14 = 2048;
    v15 = v4;
    v16 = 2048;
    v17 = -v5;
    _os_log_impl(&dword_212581000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Completed %lu transactions within uptime of %f seconds", (uint8_t *)&v10, 0x26u);
  }

  WALogActivityManagerHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 40);
    v10 = 136446722;
    v11 = "-[WAActivityManager osTransactionComplete:]_block_invoke";
    v12 = 1024;
    v13 = 247;
    v14 = 2048;
    v15 = v7;
    _os_log_impl(&dword_212581000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Attempting Daemon Eager Exit due to inactivity timeout of %f seconds", (uint8_t *)&v10, 0x1Cu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_executeBeforePossibleEagerExit");
  objc_msgSend(*(id *)(a1 + 32), "alternateExecutionBlockForCleanExit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "_executeTimerBlock");
  }
  else if ((xpc_transaction_try_exit_clean() & 1) == 0)
  {
    WALogActivityManagerHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136446466;
      v11 = "-[WAActivityManager osTransactionComplete:]_block_invoke";
      v12 = 1024;
      v13 = 254;
      _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Cannot eager exit, still outstanding transactions", (uint8_t *)&v10, 0x12u);
    }

  }
}

- (void)_executeBeforePossibleEagerExit
{
  void *v3;
  void (**v4)(void);

  -[WAActivityManager executeBeforePossibleEagerExit](self, "executeBeforePossibleEagerExit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WAActivityManager executeBeforePossibleEagerExit](self, "executeBeforePossibleEagerExit");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)_executeTimerBlock
{
  void *v3;
  void (**v4)(void);

  -[WAActivityManager alternateExecutionBlockForCleanExit](self, "alternateExecutionBlockForCleanExit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WAActivityManager alternateExecutionBlockForCleanExit](self, "alternateExecutionBlockForCleanExit");
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
  v5[2] = __41__WAActivityManager_osTransactionsActive__block_invoke;
  v5[3] = &unk_24CDDDEF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__WAActivityManager_osTransactionsActive__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)alternateExecutionBlockForCleanExit
{
  return self->_alternateExecutionBlockForCleanExit;
}

- (void)setAlternateExecutionBlockForCleanExit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)executeBeforePossibleEagerExit
{
  return self->_executeBeforePossibleEagerExit;
}

- (void)setExecuteBeforePossibleEagerExit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
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
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDateFirstTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
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
  objc_storeStrong(&self->_executeBeforePossibleEagerExit, 0);
  objc_storeStrong(&self->_alternateExecutionBlockForCleanExit, 0);
  objc_storeStrong((id *)&self->_active_transactions, 0);
  objc_storeStrong((id *)&self->_periodicActiveListTimer, 0);
  objc_storeStrong((id *)&self->_eagerExitTimeout, 0);
}

@end
