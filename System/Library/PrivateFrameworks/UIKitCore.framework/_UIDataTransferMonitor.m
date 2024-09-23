@implementation _UIDataTransferMonitor

- (_UIDataTransferMonitor)init
{
  _UIDataTransferMonitor *v2;
  uint64_t v3;
  NSMutableDictionary *transferQueue_requestsBySourceItemUUID;
  uint64_t v5;
  NSMutableSet *transferQueue_requestsInProgress;
  uint64_t v7;
  NSMutableSet *transferQueue_allEncounteredItemUUIDs;
  uint64_t v9;
  NSProgress *transferQueue_masterProgress;
  uint64_t v11;
  NSMutableArray *transferQueue_childProgresses;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)_UIDataTransferMonitor;
  v2 = -[_UIDataTransferMonitor init](&v20, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    transferQueue_requestsBySourceItemUUID = v2->_transferQueue_requestsBySourceItemUUID;
    v2->_transferQueue_requestsBySourceItemUUID = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    transferQueue_requestsInProgress = v2->_transferQueue_requestsInProgress;
    v2->_transferQueue_requestsInProgress = (NSMutableSet *)v5;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    transferQueue_allEncounteredItemUUIDs = v2->_transferQueue_allEncounteredItemUUIDs;
    v2->_transferQueue_allEncounteredItemUUIDs = (NSMutableSet *)v7;

    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 0);
    v9 = objc_claimAutoreleasedReturnValue();
    transferQueue_masterProgress = v2->_transferQueue_masterProgress;
    v2->_transferQueue_masterProgress = (NSProgress *)v9;

    objc_initWeak(&location, v2);
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __30___UIDataTransferMonitor_init__block_invoke;
    v17 = &unk_1E16B3F40;
    objc_copyWeak(&v18, &location);
    -[NSProgress setCancellationHandler:](v2->_transferQueue_masterProgress, "setCancellationHandler:", &v14);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array", v14, v15, v16, v17);
    v11 = objc_claimAutoreleasedReturnValue();
    transferQueue_childProgresses = v2->_transferQueue_childProgresses;
    v2->_transferQueue_childProgresses = (NSMutableArray *)v11;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setSuppressEventsUntilRequested:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  _transferQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58___UIDataTransferMonitor_setSuppressEventsUntilRequested___block_invoke;
  v6[3] = &unk_1E16B1B78;
  v6[4] = self;
  v7 = a3;
  dispatch_sync(v5, v6);

}

- (BOOL)suppressEventsUntilRequested
{
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  _transferQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54___UIDataTransferMonitor_suppressEventsUntilRequested__block_invoke;
  v5[3] = &unk_1E16BACE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

- (void)_transferQueue_scheduleBeganCallback
{
  if (self->_transferQueue_suppressEventsUntilRequested)
  {
    self->_transferQueue_shouldSendBeganCallback = 1;
  }
  else if (!self->_transferQueue_hasSentBeganCallback)
  {
    -[_UIDataTransferMonitor _transferQueue_sendBeganCallback](self, "_transferQueue_sendBeganCallback");
  }
}

- (void)_transferQueue_sendBeganCallback
{
  uint64_t v2;
  _QWORD v3[5];

  v2 = MEMORY[0x1E0C809B0];
  self->_transferQueue_hasSentBeganCallback = 1;
  v3[0] = v2;
  v3[1] = 3221225472;
  v3[2] = __58___UIDataTransferMonitor__transferQueue_sendBeganCallback__block_invoke;
  v3[3] = &unk_1E16B1B28;
  v3[4] = self;
  _dispatchCallback(v3);
}

- (void)_transferQueue_scheduleFinishedCallback
{
  if (self->_transferQueue_suppressEventsUntilRequested)
  {
    self->_transferQueue_shouldSendFinishedCallback = 1;
  }
  else
  {
    if (!self->_transferQueue_hasSentBeganCallback)
      -[_UIDataTransferMonitor _transferQueue_scheduleBeganCallback](self, "_transferQueue_scheduleBeganCallback");
    if (!self->_transferQueue_hasSentFinishedCallback)
      -[_UIDataTransferMonitor _transferQueue_sendFinishedCallback](self, "_transferQueue_sendFinishedCallback");
  }
}

- (void)_transferQueue_sendFinishedCallback
{
  uint64_t v2;
  _QWORD v3[5];

  v2 = MEMORY[0x1E0C809B0];
  self->_transferQueue_hasSentFinishedCallback = 1;
  v3[0] = v2;
  v3[1] = 3221225472;
  v3[2] = __61___UIDataTransferMonitor__transferQueue_sendFinishedCallback__block_invoke;
  v3[3] = &unk_1E16B1B28;
  v3[4] = self;
  _dispatchCallback(v3);
}

- (unint64_t)totalItemsCount
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  _transferQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41___UIDataTransferMonitor_totalItemsCount__block_invoke;
  v6[3] = &unk_1E16BACE0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)sendDelegateEventsIfNeeded
{
  NSObject *v3;
  _QWORD block[5];

  _transferQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52___UIDataTransferMonitor_sendDelegateEventsIfNeeded__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (NSProgress)progress
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__72;
  v11 = __Block_byref_object_dispose__72;
  v12 = 0;
  _transferQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34___UIDataTransferMonitor_progress__block_invoke;
  v6[3] = &unk_1E16BACE0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSProgress *)v4;
}

- (void)cancelOutstandingRequests
{
  NSObject *v3;
  _QWORD block[5];

  _transferQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51___UIDataTransferMonitor_cancelOutstandingRequests__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)itemProvider:(id)a3 beganDataTransferTransactionUUID:(id)a4 progress:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  _UIDataTransferMonitor *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  _transferQueue();
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81___UIDataTransferMonitor_itemProvider_beganDataTransferTransactionUUID_progress___block_invoke;
  block[3] = &unk_1E16C47E0;
  v12 = v8;
  v16 = v12;
  v13 = v9;
  v17 = v13;
  v14 = v10;
  v18 = v14;
  v19 = self;
  v20 = &v21;
  dispatch_sync(v11, block);

  -[_UIDataTransferMonitor willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("outstandingItemsCount"));
  self->_outstandingItemsCount = v22[3];
  -[_UIDataTransferMonitor didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("outstandingItemsCount"));

  _Block_object_dispose(&v21, 8);
}

- (void)_transferQueue_recomputeMasterProgress
{
  uint64_t v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  double v10;
  NSProgress *v11;
  NSProgress *v12;
  _QWORD v13[4];
  NSProgress *v14;
  uint64_t v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = -[NSMutableArray count](self->_transferQueue_childProgresses, "count");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = self->_transferQueue_childProgresses;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "fractionCompleted");
        v8 = v8 + v10;
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0.0;
  }

  v11 = self->_transferQueue_masterProgress;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64___UIDataTransferMonitor__transferQueue_recomputeMasterProgress__block_invoke;
  v13[3] = &unk_1E16B4E70;
  v14 = v11;
  v15 = 100 * v3;
  v16 = v8;
  v12 = v11;
  _dispatchCallback(v13);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  char isKindOfClass;
  NSObject *v11;
  _QWORD block[5];

  v8 = a3;
  v9 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && objc_msgSend(v8, "isEqualToString:", CFSTR("fractionCompleted")))
  {
    _transferQueue();
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73___UIDataTransferMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    dispatch_async(v11, block);

  }
}

- (void)itemProvider:(id)a3 finishedDataTransferTransactionUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[5];
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v6 = a3;
  v7 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  _transferQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75___UIDataTransferMonitor_itemProvider_finishedDataTransferTransactionUUID___block_invoke;
  block[3] = &unk_1E16C3B20;
  v18 = &v24;
  block[4] = self;
  v10 = v6;
  v16 = v10;
  v11 = v7;
  v17 = v11;
  v19 = &v20;
  dispatch_sync(v8, block);

  v12 = v25[3];
  if (v12 != v21[3])
  {
    -[_UIDataTransferMonitor willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("outstandingItemsCount"));
    self->_outstandingItemsCount = v21[3];
    -[_UIDataTransferMonitor didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("outstandingItemsCount"));
    v12 = v25[3];
  }
  if (v12 && !v21[3])
  {
    _transferQueue();
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __75___UIDataTransferMonitor_itemProvider_finishedDataTransferTransactionUUID___block_invoke_2;
    v14[3] = &unk_1E16B1B28;
    v14[4] = self;
    dispatch_sync(v13, v14);

  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

}

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableDictionary *obj;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableDictionary count](self->_transferQueue_requestsBySourceItemUUID, "count"))
  {
    v3 = objc_opt_class();
    NSLog(CFSTR("ERROR: %@ was deallocated while data transfer was still in progress."), v3);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_transferQueue_requestsBySourceItemUUID;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_transferQueue_requestsBySourceItemUUID, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v17;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v17 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "progress");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "removeObserver:forKeyPath:", self, CFSTR("fractionCompleted"));

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v10);
        }

        ++v7;
      }
      while (v7 != v5);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v5);
  }

  v15.receiver = self;
  v15.super_class = (Class)_UIDataTransferMonitor;
  -[_UIDataTransferMonitor dealloc](&v15, sel_dealloc);
}

- (_UIDataTransferMonitorDelegate)delegate
{
  return (_UIDataTransferMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)outstandingRequests
{
  return self->_outstandingRequests;
}

- (unint64_t)outstandingItemsCount
{
  return self->_outstandingItemsCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingRequests, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transferQueue_allEncounteredItemUUIDs, 0);
  objc_storeStrong((id *)&self->_transferQueue_childProgresses, 0);
  objc_storeStrong((id *)&self->_transferQueue_masterProgress, 0);
  objc_storeStrong((id *)&self->_transferQueue_requestsInProgress, 0);
  objc_storeStrong((id *)&self->_transferQueue_requestsBySourceItemUUID, 0);
}

@end
