@implementation PLCloudTaskManager

- (PLCloudTaskManager)init
{
  PLCloudTaskManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *pendingTaskForTaskIdentifier;
  NSMutableDictionary *v5;
  NSMutableDictionary *highPriorityResourceToTaskIdentifierMap;
  NSMutableDictionary *v7;
  NSMutableDictionary *lowPriorityResourceToTaskIdentifierMap;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *isolationQueue;
  PLCloudTaskManager *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PLCloudTaskManager;
  v2 = -[PLCloudTaskManager init](&v14, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingTaskForTaskIdentifier = v2->_pendingTaskForTaskIdentifier;
    v2->_pendingTaskForTaskIdentifier = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    highPriorityResourceToTaskIdentifierMap = v2->_highPriorityResourceToTaskIdentifierMap;
    v2->_highPriorityResourceToTaskIdentifierMap = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lowPriorityResourceToTaskIdentifierMap = v2->_lowPriorityResourceToTaskIdentifierMap;
    v2->_lowPriorityResourceToTaskIdentifierMap = v7;

    PLCloudCopyDefaultSerialQueueAttributes();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.assetsd.PLCloudTaskManager.isolation", v9);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v10;

    v12 = v2;
  }

  return v2;
}

- (BOOL)addProgressBlock:(id)a3 completionHandler:(id)a4 forResourceIdentifier:(id)a5 highPriority:(BOOL)a6 withTaskIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *isolationQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111__PLCloudTaskManager_addProgressBlock_completionHandler_forResourceIdentifier_highPriority_withTaskIdentifier___block_invoke;
  block[3] = &unk_1E36632D0;
  block[4] = self;
  v23 = v14;
  v28 = a6;
  v26 = v13;
  v27 = &v29;
  v24 = v15;
  v25 = v12;
  v17 = v15;
  v18 = v13;
  v19 = v12;
  v20 = v14;
  dispatch_sync(isolationQueue, block);
  LOBYTE(isolationQueue) = *((_BYTE *)v30 + 24);

  _Block_object_dispose(&v29, 8);
  return (char)isolationQueue;
}

- (void)setPendingTaskWithTransferTask:(id)a3 withTaskIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  OS_dispatch_queue *isolationQueue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isolationQueue = self->_isolationQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__PLCloudTaskManager_setPendingTaskWithTransferTask_withTaskIdentifier___block_invoke;
  v12[3] = &unk_1E3677530;
  v12[4] = self;
  v13 = v7;
  v14 = v6;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v8, "dispatchAsync:block:", isolationQueue, v12);

}

- (void)reportProgress:(float)a3 forResourceIdentifier:(id)a4 highPriority:(BOOL)a5
{
  id v8;
  void *v9;
  OS_dispatch_queue *isolationQueue;
  id v11;
  _QWORD v12[5];
  id v13;
  float v14;
  BOOL v15;

  v8 = a4;
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isolationQueue = self->_isolationQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__PLCloudTaskManager_reportProgress_forResourceIdentifier_highPriority___block_invoke;
  v12[3] = &unk_1E36632F8;
  v12[4] = self;
  v13 = v8;
  v15 = a5;
  v14 = a3;
  v11 = v8;
  objc_msgSend(v9, "dispatchAsync:block:", isolationQueue, v12);

}

- (void)reportCompletionForResourceIdentifier:(id)a3 highPriority:(BOOL)a4 withError:(id)a5
{
  id v8;
  id v9;
  void *v10;
  OS_dispatch_queue *isolationQueue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a5;
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isolationQueue = self->_isolationQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __83__PLCloudTaskManager_reportCompletionForResourceIdentifier_highPriority_withError___block_invoke;
  v14[3] = &unk_1E36752E0;
  v14[4] = self;
  v15 = v8;
  v17 = a4;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v10, "dispatchAsync:block:", isolationQueue, v14);

}

- (id)getPendingTaskForTaskIdentifier:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  id v7;
  _QWORD block[5];
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
  v15 = __Block_byref_object_copy__12437;
  v16 = __Block_byref_object_dispose__12438;
  v17 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PLCloudTaskManager_getPendingTaskForTaskIdentifier___block_invoke;
  block[3] = &unk_1E3676EA0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(isolationQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)cancelTaskWithTaskIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  OS_dispatch_queue *isolationQueue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isolationQueue = self->_isolationQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__PLCloudTaskManager_cancelTaskWithTaskIdentifier_completion___block_invoke;
  v12[3] = &unk_1E3676290;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v8, "dispatchAsync:block:", isolationQueue, v12);

}

- (void)reset
{
  void *v3;
  OS_dispatch_queue *isolationQueue;
  _QWORD v5[5];

  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__PLCloudTaskManager_reset__block_invoke;
  v5[3] = &unk_1E3677AA0;
  v5[4] = self;
  objc_msgSend(v3, "dispatchAsync:block:", isolationQueue, v5);

}

- (id)_taskForResourceIdentifier:(id)a3 highPriority:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  -[PLCloudTaskManager _taskIdentifiersForResourceIdentifier:highPriority:](self, "_taskIdentifiersForResourceIdentifier:highPriority:", v6, v4);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingTaskForTaskIdentifier, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), (_QWORD)v15);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (id)_taskIdentifiersForResourceIdentifier:(id)a3 highPriority:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *isolationQueue;
  id v7;
  uint64_t v8;
  void *v9;

  v4 = a4;
  isolationQueue = self->_isolationQueue;
  v7 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  v8 = 24;
  if (v4)
    v8 = 16;
  objc_msgSend(*(id *)((char *)&self->super.isa + v8), "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_setTaskIdentifiers:(id)a3 forResourceIdentifier:(id)a4 highPriority:(BOOL)a5
{
  _BOOL4 v5;
  NSObject *isolationQueue;
  id v9;
  uint64_t v10;
  id v11;

  v5 = a5;
  isolationQueue = self->_isolationQueue;
  v9 = a4;
  v11 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  v10 = 24;
  if (v5)
    v10 = 16;
  objc_msgSend(*(id *)((char *)&self->super.isa + v10), "setObject:forKey:", v11, v9);

}

- (void)_removeTaskIdentifiersForResourceIdentifier:(id)a3 highPriority:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *isolationQueue;
  uint64_t v7;
  id v8;

  v4 = a4;
  isolationQueue = self->_isolationQueue;
  v8 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  v7 = 24;
  if (v4)
    v7 = 16;
  objc_msgSend(*(id *)((char *)&self->super.isa + v7), "removeObjectForKey:", v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_lowPriorityResourceToTaskIdentifierMap, 0);
  objc_storeStrong((id *)&self->_highPriorityResourceToTaskIdentifierMap, 0);
  objc_storeStrong((id *)&self->_pendingTaskForTaskIdentifier, 0);
}

uint64_t __27__PLCloudTaskManager_reset__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint8_t v6[8];
  _QWORD v7[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __27__PLCloudTaskManager_reset__block_invoke_2;
  v7[3] = &unk_1E3663320;
  v7[4] = v2;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEBUG, "Removing all PLCloudPendingResourceTasks", v6, 2u);
    }

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
}

uint64_t __27__PLCloudTaskManager_reset__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelTaskWithTaskIdentifier:completion:", a2, 0);
}

void __62__PLCloudTaskManager_cancelTaskWithTaskIdentifier_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "cancelTaskWithIdentifier:", a1[5]);
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v5 = a1[5];
        v7 = 134218242;
        v8 = v3;
        v9 = 2112;
        v10 = v5;
        _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEBUG, "Removing PLCloudPendingResourceTask [cancelled] %p for identifier: %@", (uint8_t *)&v7, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1[4] + 8), "removeObjectForKey:", a1[5]);
  }
  v6 = a1[6];
  if (v6)
    (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, v3 != 0);

}

void __54__PLCloudTaskManager_getPendingTaskForTaskIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __83__PLCloudTaskManager_reportCompletionForResourceIdentifier_highPriority_withError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_taskForResourceIdentifier:highPriority:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "taskIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    objc_msgSend(v3, "reportCompletionWithError:", *(_QWORD *)(a1 + 48));
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v17;
      v11 = (_BYTE *)MEMORY[0x1E0D115D0];
      *(_QWORD *)&v8 = 134218242;
      v15 = v8;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v6);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
          if (!*v11)
          {
            __CPLAssetsdOSLogDomain();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v15;
              v21 = v3;
              v22 = 2112;
              v23 = v13;
              _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "Removing PLCloudPendingResourceTask [completed] %p for identifier: %@", buf, 0x16u);
            }

          }
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", v13, v15, (_QWORD)v16);
          ++v12;
        }
        while (v9 != v12);
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v9);
    }

    objc_msgSend(*(id *)(a1 + 32), "_removeTaskIdentifiersForResourceIdentifier:highPriority:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  }

}

void __72__PLCloudTaskManager_reportProgress_forResourceIdentifier_highPriority___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_taskForResourceIdentifier:highPriority:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 52));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    LODWORD(v3) = *(_DWORD *)(a1 + 48);
    v4 = v2;
    objc_msgSend(v2, "reportProgress:", v3);
    v2 = v4;
  }

}

void __72__PLCloudTaskManager_setPendingTaskWithTransferTask_withTaskIdentifier___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTransferTask:", a1[6]);

}

void __111__PLCloudTaskManager_addProgressBlock_completionHandler_forResourceIdentifier_highPriority_withTaskIdentifier___block_invoke(uint64_t a1)
{
  PLCloudPendingResourceTask *v2;
  PLCloudPendingResourceTask *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  int v7;
  PLCloudPendingResourceTask *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_taskForResourceIdentifier:highPriority:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 80));
  v2 = (PLCloudPendingResourceTask *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    -[PLCloudPendingResourceTask addProgressBlock:completionHandler:withTaskIdentifier:](v2, "addProgressBlock:completionHandler:withTaskIdentifier:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v3 = -[PLCloudPendingResourceTask initWithProgressBlock:completionHandler:forTaskIdentifier:]([PLCloudPendingResourceTask alloc], "initWithProgressBlock:completionHandler:forTaskIdentifier:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(a1 + 48);
      v7 = 134218242;
      v8 = v3;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEBUG, "Set PLCloudPendingResourceTask %p for identifier: %@", (uint8_t *)&v7, 0x16u);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", v3, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_taskIdentifiersForResourceIdentifier:highPriority:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 80));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(a1 + 32), "_setTaskIdentifiers:forResourceIdentifier:highPriority:", v6, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 80));
  }
  objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 48));

}

@end
