@implementation SYBacklinkMonitorFilterCacheOperation

- (void)_updateBacklinkFilterCacheWithInfos:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  SYBacklinkFilterCache *v8;
  void *v9;
  void *v10;
  void *v11;
  SYBacklinkFilterCache *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SYBacklinkMonitorOperation processingQueue](self, "processingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SYBacklinkMonitorOperation _setOperationState:](self, "_setOperationState:", 2);
  -[SYBacklinkMonitorOperation inputUserActivityInfo](self, "inputUserActivityInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activityType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [SYBacklinkFilterCache alloc];
    -[SYBacklinkMonitorOperation inputUserActivityInfo](self, "inputUserActivityInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activityType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SYBacklinkFilterCache initWithActivityTypes:](v8, "initWithActivityTypes:", v11);

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = v4;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          -[SYBacklinkFilterCache addEntriesForItem:](v12, "addEntriesForItem:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v17++), (_QWORD)v21);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v15);
    }

    -[SYBacklinkFilterCache finalize](v12, "finalize");
  }
  else
  {
    v12 = 0;
  }
  -[SYBacklinkMonitorOperation delegate](self, "delegate", (_QWORD)v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    -[SYBacklinkMonitorOperation delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "backlinkMonitorOperation:shouldUpdateFilterCache:", self, v12);

  }
  -[SYBacklinkMonitorFilterCacheOperation _finishProcessingAndNotify](self, "_finishProcessingAndNotify");

}

- (int64_t)type
{
  return 0;
}

uint64_t __77__SYBacklinkMonitorFilterCacheOperation__searchBacklinksForInputUserActivity__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(*(id *)(a1 + 40), "count");
    v5 = *(double *)(a1 + 48) * 1000.0;
    v7 = 134218496;
    v8 = v3;
    v9 = 2048;
    v10 = v4;
    v11 = 2048;
    v12 = v5;
    _os_log_impl(&dword_1BCC38000, v2, OS_LOG_TYPE_DEFAULT, "BacklinkMonitorFilterOperation %p: Found %ld item(s) linked to current activityType. Query duration: %0.0f ms.", (uint8_t *)&v7, 0x20u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_updateBacklinkFilterCacheWithInfos:", *(_QWORD *)(a1 + 40));
}

void __77__SYBacklinkMonitorFilterCacheOperation__searchBacklinksForInputUserActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  double v10;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v5 = v4 - *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "processingQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__SYBacklinkMonitorFilterCacheOperation__searchBacklinksForInputUserActivity__block_invoke_2;
  block[3] = &unk_1E757BC20;
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v5;
  v7 = v3;
  dispatch_async(v6, block);

}

- (void)_searchBacklinksForInputUserActivity
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  _QWORD v11[6];
  uint8_t buf[4];
  SYBacklinkMonitorFilterCacheOperation *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[SYBacklinkMonitorOperation processingQueue](self, "processingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SYBacklinkMonitorOperation _setOperationState:](self, "_setOperationState:", 1);
  -[SYBacklinkMonitorOperation inputUserActivityInfo](self, "inputUserActivityInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && SYIsLinkableUserActivity(v4))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v7 = v6;
    objc_msgSend(v5, "activityType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __77__SYBacklinkMonitorFilterCacheOperation__searchBacklinksForInputUserActivity__block_invoke;
    v11[3] = &unk_1E757BC48;
    v11[5] = v7;
    v11[4] = self;
    +[SYItemIndexingManager fetchActivitiesWithActivityType:completion:](SYItemIndexingManager, "fetchActivitiesWithActivityType:completion:", v8, v11);

  }
  else
  {
    v9 = os_log_create("com.apple.synapse", "BacklinkMonitor");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("not linkable");
      if (!v5)
        v10 = CFSTR("nil");
      *(_DWORD *)buf = 134218242;
      v13 = self;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_1BCC38000, v9, OS_LOG_TYPE_DEFAULT, "BacklinkMonitorFilterOperation %p: Skipping query, input activity is %@.", buf, 0x16u);
    }

    -[SYBacklinkMonitorFilterCacheOperation _updateBacklinkFilterCacheWithInfos:](self, "_updateBacklinkFilterCacheWithInfos:", 0);
  }

}

- (void)_finishProcessingAndNotify
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  SYBacklinkMonitorFilterCacheOperation *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[SYBacklinkMonitorOperation processingQueue](self, "processingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SYBacklinkMonitorOperation _setOperationState:](self, "_setOperationState:", 3);
  v4 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = self;
    _os_log_impl(&dword_1BCC38000, v4, OS_LOG_TYPE_DEFAULT, "BacklinkMonitorFilterOperation %p: Finished, notifying delegate.", (uint8_t *)&v6, 0xCu);
  }

  -[SYBacklinkMonitorOperation delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backlinkMonitorOperationDidFinish:", self);

}

@end
