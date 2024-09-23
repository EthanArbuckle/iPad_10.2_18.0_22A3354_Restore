@implementation SPQueryResultsQueue

- (void)addJob:(id)a3
{
  uint64_t v4;
  void *v5;
  NSMutableDictionary *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "siJob");
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_jobs;
  objc_sync_enter(v6);
  -[NSMutableDictionary setObject:forKey:](self->_jobs, "setObject:forKey:", v7, v5);
  objc_msgSend(v7, "setResultsQueue:", self);
  objc_sync_exit(v6);

}

- (__SIResultQueue)siResultsQueue
{
  return self->_siResultsQueue;
}

void __38__SPQueryResultsQueue__processResults__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  __int128 v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  unsigned int *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x2199C2D78]();
  logForCSLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __38__SPQueryResultsQueue__processResults__block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v5 + 12))
  {
    objc_msgSend(*(id *)(a1 + 32), "pauseResults");
    v5 = *(_QWORD *)(a1 + 32);
  }
  if (!*(_QWORD *)(v5 + 24))
  {
    if (*(_BYTE *)(v5 + 12))
      goto LABEL_45;
    goto LABEL_46;
  }
  v6 = 0;
  *(_QWORD *)&v4 = 134217984;
  v22 = v4;
  do
  {
    v7 = SIResultQueueDequeue();
    v8 = (unsigned int *)v7;
    if (!v7)
      break;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", *(_QWORD *)(v7 + 8));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
    objc_sync_enter(v10);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v10);

    if (v11)
    {
      v12 = *v8;
      logForCSLogCategoryQuery();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
        *(_DWORD *)buf = 134218242;
        v24 = v12;
        v25 = 2112;
        v26 = v17;
        _os_log_debug_impl(&dword_213CF1000, v13, OS_LOG_TYPE_DEBUG, "Processing results, kind:%ld, identifier:%@", buf, 0x16u);
      }

      objc_msgSend(v11, "resultsHandler");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v14;
      if (v14)
      {
        switch((int)v12)
        {
          case 1:
            logForCSLogCategoryQuery();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              v21 = *((_QWORD *)v8 + 6);
              *(_DWORD *)buf = v22;
              v24 = v21;
              _os_log_debug_impl(&dword_213CF1000, v16, OS_LOG_TYPE_DEBUG, "%ld items", buf, 0xCu);
            }

            ((void (**)(_QWORD, void *, _QWORD, _QWORD, _QWORD, _QWORD))v15)[2](v15, v11, 0, *((_QWORD *)v8 + 6), *((_QWORD *)v8 + 4), *((_QWORD *)v8 + 5));
            goto LABEL_34;
          case 2:
            (*(void (**)(uint64_t, void *, uint64_t, _QWORD, _QWORD, _QWORD))(v14 + 16))(v14, v11, 3, 0, 0, *((_QWORD *)v8 + 4));
            v6 = 1;
            goto LABEL_23;
          case 3:
            (*(void (**)(uint64_t, void *, uint64_t, _QWORD, _QWORD, _QWORD))(v14 + 16))(v14, v11, 4, 0, 0, *((_QWORD *)v8 + 4));
            goto LABEL_34;
          case 4:
            goto LABEL_22;
          case 5:
            if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 10))
            {
              (*(void (**)(uint64_t, void *, uint64_t, _QWORD, _QWORD, _QWORD))(v14 + 16))(v14, v11, 2, 0, 0, 0);
              SIResultBatchFree();
            }
            else
            {
LABEL_22:
              (*(void (**)(uint64_t, void *, uint64_t, _QWORD, _QWORD, _QWORD))(v14 + 16))(v14, v11, 1, 0, 0, 0);
LABEL_23:
              SIResultBatchFree();
              objc_msgSend(v11, "setResultsHandler:", 0);
              v18 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
              objc_sync_enter(v18);
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", v9);
              objc_sync_exit(v18);

            }
            goto LABEL_30;
          case 6:
            (*(void (**)(uint64_t, void *, uint64_t, _QWORD, _QWORD, _QWORD))(v14 + 16))(v14, v11, 5, *((_QWORD *)v8 + 4), 0, 0);
            goto LABEL_34;
          case 7:
            v19 = (int)v8[14];
            if (v19 > 3)
              v20 = -1;
            else
              v20 = qword_213D7E198[v19];
            (*(void (**)(uint64_t, void *, uint64_t, _QWORD, _QWORD, _QWORD))(v14 + 16))(v14, v11, v20, *((_QWORD *)v8 + 6), *((_QWORD *)v8 + 4), *((_QWORD *)v8 + 5));
LABEL_34:
            SIResultBatchFree();
            break;
          case 9:
            (*(void (**)(uint64_t, void *, uint64_t, _QWORD, _QWORD, _QWORD))(v14 + 16))(v14, v11, 8, *((_QWORD *)v8 + 6), *((_QWORD *)v8 + 4), *((_QWORD *)v8 + 5));
            SIResultBatchFree();
            goto LABEL_30;
          case 10:
            (*(void (**)(uint64_t, void *, uint64_t, _QWORD, _QWORD, _QWORD))(v14 + 16))(v14, v11, 9, 0, 0, *((_QWORD *)v8 + 4));
            SIResultBatchFree();
            goto LABEL_30;
          case 11:
            (*(void (**)(uint64_t, void *, uint64_t, _QWORD, _QWORD, _QWORD))(v14 + 16))(v14, v11, 11, 0, 0, *((_QWORD *)v8 + 5));
            SIResultBatchFree();
            goto LABEL_30;
          default:
            goto LABEL_17;
        }
LABEL_35:
        if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 12))
        {

          v6 = 1;
          break;
        }
        v6 = 1;
      }
      else
      {
LABEL_17:
        SIResultBatchFree();
LABEL_30:
        if ((v6 & 1) != 0)
          goto LABEL_35;
        v6 = 0;
      }

      goto LABEL_38;
    }
    SIResultBatchFree();
LABEL_38:

  }
  while (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v5 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v5 + 12))
  {
LABEL_46:
    objc_msgSend((id)v5, "_scheduleWakeupForced:", 0, v22);
    goto LABEL_47;
  }
  if ((v6 & 1) == 0)
LABEL_45:
    objc_msgSend((id)v5, "resumeResults", v22);
LABEL_47:
  objc_autoreleasePoolPop(v2);
}

- (void)_scheduleWakeupForced:(BOOL)a3
{
  _BOOL4 v3;
  NSString *v5;
  NSObject *v6;
  NSString *v7;
  const __CFString *v8;
  _BOOL4 canceled;
  const __CFString *v10;
  int v11;
  NSString *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  if (a3 || !-[SPQueryResultsQueue hasPausedResults](self, "hasPausedResults"))
  {
    v5 = self->_identifier;
    logForCSLogCategoryQuery();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = CFSTR("NO");
      canceled = self->_canceled;
      if (v3)
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      v11 = 138412802;
      v12 = v5;
      v13 = 2112;
      if (canceled)
        v8 = CFSTR("YES");
      v14 = v10;
      v15 = 2112;
      v16 = v8;
      _os_log_debug_impl(&dword_213CF1000, v6, OS_LOG_TYPE_DEBUG, "Schedule wakeup, identifier:%@, forced:%@, canceled:%@", (uint8_t *)&v11, 0x20u);
    }

    v7 = v5;
    if ((SIResultQueueSetWakeupTrigger() & 1) == 0)
      CFRelease(v7);

  }
}

+ (id)findResultsQueueWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  if (!sResultsQueueMap)
    +[SPQueryResultsQueue findResultsQueueWithIdentifier:].cold.1();
  v4 = v3;
  v5 = (id)sResultsQueueMap;
  objc_sync_enter(v5);
  objc_msgSend((id)sResultsQueueMap, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (BOOL)hasPausedResults
{
  SPQueryResultsQueue *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_pausedCount > 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)_processResults
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  qos_class_self();
  OUTLINED_FUNCTION_4(&dword_213CF1000, v0, v1, "QOS _processResults 1: %d", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_1();
}

- (void)setLive:(BOOL)a3
{
  self->_live = a3;
}

+ (id)sharedInstanceDispatchQueue:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SPQueryResultsQueue_sharedInstanceDispatchQueue___block_invoke;
  block[3] = &unk_24D0EA758;
  v9 = v3;
  v4 = sharedInstanceDispatchQueue__onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&sharedInstanceDispatchQueue__onceToken, block);
  v6 = (id)sharedInstanceDispatchQueue__sSharedInstance;

  return v6;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)_stopTracking
{
  SPQueryResultsQueue *v2;
  _BOOL4 tracked;

  v2 = self;
  objc_sync_enter(v2);
  tracked = v2->_tracked;
  v2->_tracked = 0;
  objc_sync_exit(v2);

  if (tracked)
    +[SPQueryResultsQueue stopTrackingResultsQueueWithIdentifier:](SPQueryResultsQueue, "stopTrackingResultsQueueWithIdentifier:", v2->_identifier);
}

+ (void)stopTrackingResultsQueueWithIdentifier:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  if (!sResultsQueueMap)
    +[SPQueryResultsQueue stopTrackingResultsQueueWithIdentifier:].cold.1();
  v3 = (id)sResultsQueueMap;
  objc_sync_enter(v3);
  objc_msgSend((id)sResultsQueueMap, "removeObjectForKey:", v4);
  objc_sync_exit(v3);

}

- (void)cancel
{
  SPQueryResultsQueue *v2;
  _BOOL4 canceled;
  NSObject *dispatchQueue;
  dispatch_block_t v5;
  _QWORD block[5];

  if (!self->_shared)
  {
    v2 = self;
    objc_sync_enter(v2);
    canceled = v2->_canceled;
    v2->_canceled = 1;
    objc_sync_exit(v2);

    if (!canceled)
    {
      dispatchQueue = v2->_dispatchQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __29__SPQueryResultsQueue_cancel__block_invoke;
      block[3] = &unk_24D0EA758;
      block[4] = v2;
      v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      dispatch_async(dispatchQueue, v5);

    }
  }
}

+ (id)sharedInstanceMaintenanceDispatchQueue:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__SPQueryResultsQueue_sharedInstanceMaintenanceDispatchQueue___block_invoke;
  block[3] = &unk_24D0EA758;
  v9 = v3;
  v4 = sharedInstanceMaintenanceDispatchQueue__onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&sharedInstanceMaintenanceDispatchQueue__onceToken, block);
  v6 = (id)sharedInstanceMaintenanceDispatchQueue__sSharedInstance;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_jobs, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (SPQueryResultsQueue)initWithIdentifier:(id)a3 dispatchQueue:(id)a4
{
  id v7;
  id v8;
  SPQueryResultsQueue *v9;
  SPQueryResultsQueue *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *jobs;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SPQueryResultsQueue;
  v9 = -[SPQueryResultsQueue init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_dispatchQueue, a4);
    v10->_siResultsQueue = (__SIResultQueue *)SIResultQueueCreate();
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    jobs = v10->_jobs;
    v10->_jobs = v11;

    -[SPQueryResultsQueue _startTracking](v10, "_startTracking");
    -[SPQueryResultsQueue _scheduleWakeupForced:](v10, "_scheduleWakeupForced:", 1);
    logForCSLogCategoryQuery();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[SPQueryResultsQueue initWithIdentifier:dispatchQueue:].cold.1((uint64_t)v7, v13, v14, v15, v16, v17, v18, v19);

  }
  return v10;
}

- (void)_startTracking
{
  SPQueryResultsQueue *v2;
  _BOOL4 tracked;

  v2 = self;
  objc_sync_enter(v2);
  tracked = v2->_tracked;
  v2->_tracked = 1;
  objc_sync_exit(v2);

  if (!tracked)
    +[SPQueryResultsQueue startTrackingResultsQueue:](SPQueryResultsQueue, "startTrackingResultsQueue:", v2);
}

+ (void)startTrackingResultsQueue:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = a3;
  v6 = v3;
  if (startTrackingResultsQueue__onceToken != -1)
  {
    dispatch_once(&startTrackingResultsQueue__onceToken, &__block_literal_global_0);
    v3 = v6;
  }
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)sResultsQueueMap;
  objc_sync_enter(v5);
  objc_msgSend((id)sResultsQueueMap, "setObject:forKey:", v6, v4);
  objc_sync_exit(v5);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)dealloc
{
  __assert_rtn("-[SPQueryResultsQueue dealloc]", "SPCoreSpotlightTask.m", 135, "!_tracked || !_siResultsQueue || SIResultQueueNoWakeupTrigger(_siResultsQueue)");
}

void __29__SPQueryResultsQueue_cancel__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  v2 = (void *)MEMORY[0x2199C2D78]();
  logForCSLogCategoryQuery();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __29__SPQueryResultsQueue_cancel__block_invoke_cold_1();

  SIResultQueueCancel();
  objc_msgSend(*(id *)(a1 + 32), "_scheduleWakeupForced:", 1);
  objc_autoreleasePoolPop(v2);
}

+ (void)stopTrackingResultsQueueWithIdentifier:.cold.1()
{
  __assert_rtn("+[SPQueryResultsQueue stopTrackingResultsQueueWithIdentifier:]", "SPCoreSpotlightTask.m", 76, "sResultsQueueMap");
}

+ (void)findResultsQueueWithIdentifier:.cold.1()
{
  __assert_rtn("+[SPQueryResultsQueue findResultsQueueWithIdentifier:]", "SPCoreSpotlightTask.m", 84, "sResultsQueueMap");
}

void __49__SPQueryResultsQueue_startTrackingResultsQueue___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sResultsQueueMap;
  sResultsQueueMap = v0;

}

void __51__SPQueryResultsQueue_sharedInstanceDispatchQueue___block_invoke(uint64_t a1)
{
  SPQueryResultsQueue *v1;
  void *v2;

  if (!*(_QWORD *)(a1 + 32))
    __51__SPQueryResultsQueue_sharedInstanceDispatchQueue___block_invoke_cold_1();
  v1 = -[SPQueryResultsQueue initWithIdentifier:dispatchQueue:]([SPQueryResultsQueue alloc], "initWithIdentifier:dispatchQueue:", CFSTR("com.apple.spotlight.queryResults.default"), *(_QWORD *)(a1 + 32));
  -[SPQueryResultsQueue setShared:](v1, "setShared:", 1);
  v2 = (void *)sharedInstanceDispatchQueue__sSharedInstance;
  sharedInstanceDispatchQueue__sSharedInstance = (uint64_t)v1;

}

void __62__SPQueryResultsQueue_sharedInstanceMaintenanceDispatchQueue___block_invoke(uint64_t a1)
{
  SPQueryResultsQueue *v1;
  void *v2;

  if (!*(_QWORD *)(a1 + 32))
    __62__SPQueryResultsQueue_sharedInstanceMaintenanceDispatchQueue___block_invoke_cold_1();
  v1 = -[SPQueryResultsQueue initWithIdentifier:dispatchQueue:]([SPQueryResultsQueue alloc], "initWithIdentifier:dispatchQueue:", CFSTR("com.apple.spotlight.queryResults.maintenance"), *(_QWORD *)(a1 + 32));
  -[SPQueryResultsQueue setShared:](v1, "setShared:", 1);
  v2 = (void *)sharedInstanceMaintenanceDispatchQueue__sSharedInstance;
  sharedInstanceMaintenanceDispatchQueue__sSharedInstance = (uint64_t)v1;

}

- (void)cancelJob:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  NSObject *dispatchQueue;
  dispatch_block_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", objc_msgSend(v4, "siJob"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self->_jobs;
    objc_sync_enter(v7);
    -[NSMutableDictionary objectForKey:](self->_jobs, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](self->_jobs, "removeObjectForKey:", v6);
    objc_sync_exit(v7);

    if (v8)
    {
      objc_msgSend(v8, "resultsHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v8, "setResultsHandler:", 0);
        dispatchQueue = self->_dispatchQueue;
        v13 = MEMORY[0x24BDAC760];
        v14 = 3221225472;
        v15 = __33__SPQueryResultsQueue_cancelJob___block_invoke;
        v16 = &unk_24D0EA840;
        v18 = v9;
        v17 = v8;
        v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &v13);
        dispatch_async(dispatchQueue, v11);

      }
      if (objc_msgSend(v8, "siJob", v13, v14, v15, v16))
      {
        logForCSLogCategoryQuery();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[SPQueryResultsQueue cancelJob:].cold.1(v8, v12);

        objc_msgSend(v8, "siJob");
        SICancel();
        objc_msgSend(v8, "setSiJob:", 0);
      }

    }
  }

}

void __33__SPQueryResultsQueue_cancelJob___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x2199C2D78]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
}

- (void)pauseResults
{
  NSObject *v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_213CF1000, v0, (uint64_t)v0, "Paused results, identifier:%@, count:%ld", v1);
  OUTLINED_FUNCTION_1();
}

- (void)resumeResults
{
  NSObject *v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_213CF1000, v0, (uint64_t)v0, "Resumed results, identifier:%@, count:%ld", v1);
  OUTLINED_FUNCTION_1();
}

void __36__SPQueryResultsQueue_resumeResults__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x2199C2D78]();
  objc_msgSend(*(id *)(a1 + 32), "_scheduleWakeupForced:", 1);
  objc_autoreleasePoolPop(v2);
}

- (void)resumeResultsIfSystemInGoodState
{
  void *v3;
  char v4;
  dispatch_time_t v5;
  NSObject *dispatchQueue;
  _QWORD v7[4];
  id v8;
  id location;

  objc_msgSend(MEMORY[0x24BE2E230], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsDiscretionaryWorkForTask:withPriority:withParameters:", CFSTR("indexing"), *MEMORY[0x24BE2E2A0], 0);

  if ((v4 & 1) != 0)
  {
    -[SPQueryResultsQueue resumeResults](self, "resumeResults");
  }
  else
  {
    location = 0;
    objc_initWeak(&location, self);
    v5 = dispatch_time(0, 60000000000);
    dispatchQueue = self->_dispatchQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __55__SPQueryResultsQueue_resumeResultsIfSystemInGoodState__block_invoke;
    v7[3] = &unk_24D0EA868;
    objc_copyWeak(&v8, &location);
    dispatch_after(v5, dispatchQueue, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __55__SPQueryResultsQueue_resumeResultsIfSystemInGoodState__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "resumeResults");

}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setSiResultsQueue:(__SIResultQueue *)a3
{
  self->_siResultsQueue = a3;
}

- (NSMutableDictionary)jobs
{
  return self->_jobs;
}

- (void)setJobs:(id)a3
{
  objc_storeStrong((id *)&self->_jobs, a3);
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (int64_t)pausedCount
{
  return self->_pausedCount;
}

- (void)setPausedCount:(int64_t)a3
{
  self->_pausedCount = a3;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (BOOL)tracked
{
  return self->_tracked;
}

- (void)setTracked:(BOOL)a3
{
  self->_tracked = a3;
}

- (BOOL)live
{
  return self->_live;
}

- (BOOL)shared
{
  return self->_shared;
}

- (void)setShared:(BOOL)a3
{
  self->_shared = a3;
}

- (BOOL)disableResultStreaming
{
  return self->_disableResultStreaming;
}

- (void)setDisableResultStreaming:(BOOL)a3
{
  self->_disableResultStreaming = a3;
}

void __51__SPQueryResultsQueue_sharedInstanceDispatchQueue___block_invoke_cold_1()
{
  __assert_rtn("+[SPQueryResultsQueue sharedInstanceDispatchQueue:]_block_invoke", "SPCoreSpotlightTask.m", 95, "dispatchQueue");
}

void __62__SPQueryResultsQueue_sharedInstanceMaintenanceDispatchQueue___block_invoke_cold_1()
{
  __assert_rtn("+[SPQueryResultsQueue sharedInstanceMaintenanceDispatchQueue:]_block_invoke", "SPCoreSpotlightTask.m", 108, "dispatchQueue");
}

- (void)initWithIdentifier:(uint64_t)a3 dispatchQueue:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_213CF1000, a2, a3, "Created query results queue, identifier:%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cancelJob:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4[0] = 67109376;
  v4[1] = qos_class_self();
  v5 = 2048;
  v6 = objc_msgSend(a1, "siJob");
  _os_log_debug_impl(&dword_213CF1000, a2, OS_LOG_TYPE_DEBUG, "Canceling query in results queue at QoS: %d for job id:%p", (uint8_t *)v4, 0x12u);
  OUTLINED_FUNCTION_7();
}

void __29__SPQueryResultsQueue_cancel__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_213CF1000, v0, v1, "Canceling query results queue, identifier:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __38__SPQueryResultsQueue__processResults__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  qos_class_self();
  OUTLINED_FUNCTION_4(&dword_213CF1000, v0, v1, "QOS _processResults 2: %d", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_1();
}

@end
