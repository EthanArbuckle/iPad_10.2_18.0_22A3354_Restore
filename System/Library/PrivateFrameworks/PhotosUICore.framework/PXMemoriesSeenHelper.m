@implementation PXMemoriesSeenHelper

- (PXMemoriesSeenHelper)init
{
  PXMemoriesSeenHelper *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *workQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXMemoriesSeenHelper;
  v2 = -[PXMemoriesSeenHelper init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.photos.MemoriesSeenHelper", v4);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)clearAnyPendingNotificationsFromMemories:(id)a3 inLibrary:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *workQueue;
  _QWORD block[6];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        workQueue = self->_workQueue;
        block[0] = v11;
        block[1] = 3221225472;
        block[2] = __75__PXMemoriesSeenHelper_clearAnyPendingNotificationsFromMemories_inLibrary___block_invoke;
        block[3] = &unk_1E51457C8;
        block[4] = v13;
        block[5] = self;
        v16 = v7;
        dispatch_async(workQueue, block);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

- (void)clearAnyPendingStateFromMemories:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  v9 = v7;
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v7);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "pendingState") == 1)
        {

          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 3221225472;
          v13[2] = __67__PXMemoriesSeenHelper_clearAnyPendingStateFromMemories_inLibrary___block_invoke;
          v13[3] = &unk_1E5149198;
          v14 = v7;
          objc_msgSend(v6, "performChanges:completionHandler:", v13, &__block_literal_global_131_164882);
          v9 = v14;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
    v9 = v7;
  }
LABEL_11:

}

- (void)_clearPendingNotificationForMemory:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
  id v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  objc_class *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  id v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __69__PXMemoriesSeenHelper__clearPendingNotificationForMemory_inLibrary___block_invoke;
  v21[3] = &unk_1E5149198;
  v6 = v5;
  v22 = v6;
  v20 = 0;
  v7 = a4;
  v8 = objc_msgSend(v7, "performChangesAndWait:error:", v21, &v20);
  v9 = v20;
  if (v8)
  {
    +[PXUserEventTracker sharedInstance](PXUserEventTracker, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logInterestingMemoryNotificationSeenCount");

    v11 = (void *)MEMORY[0x1E0D09910];
    v12 = *MEMORY[0x1E0D09818];
    v26[0] = v6;
    v13 = *MEMORY[0x1E0D09830];
    v25[0] = v12;
    v25[1] = v13;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v26[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.memoryNotificationSeen"), v16);

  }
  else
  {
    PLUIGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v9;
      _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "Error while updating memory notification state: %@", buf, 0xCu);
    }
  }

  objc_msgSend(v7, "assetsdClient");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "notificationClient");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "asyncNotifyInterestingMemoryNotificationViewedForColletionID:", v19);

}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __69__PXMemoriesSeenHelper__clearPendingNotificationForMemory_inLibrary___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x1E0CD1640], "changeRequestForMemory:", *(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNotificationState:", 2);

}

void __67__PXMemoriesSeenHelper_clearAnyPendingStateFromMemories_inLibrary___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "pendingState", (_QWORD)v8) == 1)
        {
          objc_msgSend(MEMORY[0x1E0CD1640], "changeRequestForMemory:", v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setPendingState:", 0);

        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

}

void __67__PXMemoriesSeenHelper_clearAnyPendingStateFromMemories_inLibrary___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Error while marking memories as pending: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

uint64_t __75__PXMemoriesSeenHelper_clearAnyPendingNotificationsFromMemories_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "notificationState");
  if (result == 1)
    return objc_msgSend(*(id *)(a1 + 40), "_clearPendingNotificationForMemory:inLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  return result;
}

+ (id)defaultHelper
{
  if (defaultHelper_onceToken != -1)
    dispatch_once(&defaultHelper_onceToken, &__block_literal_global_164888);
  return (id)defaultHelper_defaultHelper;
}

void __37__PXMemoriesSeenHelper_defaultHelper__block_invoke()
{
  PXMemoriesSeenHelper *v0;
  void *v1;

  v0 = objc_alloc_init(PXMemoriesSeenHelper);
  v1 = (void *)defaultHelper_defaultHelper;
  defaultHelper_defaultHelper = (uint64_t)v0;

}

@end
