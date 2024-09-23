@implementation PBDataTransferMonitor

- (PBDataTransferMonitor)init
{
  PBDataTransferMonitor *v2;
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
  v20.super_class = (Class)PBDataTransferMonitor;
  v2 = -[PBDataTransferMonitor init](&v20, sel_init);
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
    v16 = __29__PBDataTransferMonitor_init__block_invoke;
    v17 = &unk_1E2431D40;
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

void __29__PBDataTransferMonitor_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "cancelOutstandingRequests");
    WeakRetained = v2;
  }

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
  v6[2] = __57__PBDataTransferMonitor_setSuppressEventsUntilRequested___block_invoke;
  v6[3] = &unk_1E2431C78;
  v6[4] = self;
  v7 = a3;
  dispatch_sync(v5, v6);

}

uint64_t __57__PBDataTransferMonitor_setSuppressEventsUntilRequested___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 24) = *(_BYTE *)(result + 40);
  return result;
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
  v5[2] = __53__PBDataTransferMonitor_suppressEventsUntilRequested__block_invoke;
  v5[3] = &unk_1E24314F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __53__PBDataTransferMonitor_suppressEventsUntilRequested__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

- (void)_transferQueue_scheduleBeganCallback
{
  if (self->_transferQueue_suppressEventsUntilRequested)
  {
    self->_transferQueue_shouldSendBeganCallback = 1;
  }
  else if (!self->_transferQueue_hasSentBeganCallback)
  {
    -[PBDataTransferMonitor _transferQueue_sendBeganCallback](self, "_transferQueue_sendBeganCallback");
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
  v3[2] = __57__PBDataTransferMonitor__transferQueue_sendBeganCallback__block_invoke;
  v3[3] = &unk_1E2430DF0;
  v3[4] = self;
  PBDispatchAsyncCallback(v3);
}

void __57__PBDataTransferMonitor__transferQueue_sendBeganCallback__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "dataTransferMonitorBeganTransfers:", *(_QWORD *)(a1 + 32));

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
      -[PBDataTransferMonitor _transferQueue_scheduleBeganCallback](self, "_transferQueue_scheduleBeganCallback");
    if (!self->_transferQueue_hasSentFinishedCallback)
      -[PBDataTransferMonitor _transferQueue_sendFinishedCallback](self, "_transferQueue_sendFinishedCallback");
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
  v3[2] = __60__PBDataTransferMonitor__transferQueue_sendFinishedCallback__block_invoke;
  v3[3] = &unk_1E2430DF0;
  v3[4] = self;
  PBDispatchAsyncCallback(v3);
}

void __60__PBDataTransferMonitor__transferQueue_sendFinishedCallback__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "dataTransferMonitorFinishedTransfers:", *(_QWORD *)(a1 + 32));

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
  v6[2] = __40__PBDataTransferMonitor_totalItemsCount__block_invoke;
  v6[3] = &unk_1E24314F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __40__PBDataTransferMonitor_totalItemsCount__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)sendDelegateEventsIfNeeded
{
  NSObject *v3;
  _QWORD block[5];

  _transferQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PBDataTransferMonitor_sendDelegateEventsIfNeeded__block_invoke;
  block[3] = &unk_1E2430DF0;
  block[4] = self;
  dispatch_sync(v3, block);

}

_BYTE *__51__PBDataTransferMonitor_sendDelegateEventsIfNeeded__block_invoke(uint64_t a1)
{
  _BYTE *result;
  uint64_t v3;
  _BYTE *v4;
  int v5;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  result = *(_BYTE **)(a1 + 32);
  if (!result[26])
  {
    if (result[25])
    {
      result[25] = 0;
      result = (_BYTE *)objc_msgSend(*(id *)(a1 + 32), "_transferQueue_sendBeganCallback");
      v3 = *(_QWORD *)(a1 + 32);
      v5 = *(unsigned __int8 *)(v3 + 28);
      v4 = (_BYTE *)(v3 + 28);
      if (!v5)
        return result;
    }
    else
    {
      v4 = result + 28;
      if (!result[28])
      {
        objc_msgSend(result, "_transferQueue_sendBeganCallback");
        return (_BYTE *)objc_msgSend(*(id *)(a1 + 32), "_transferQueue_sendFinishedCallback");
      }
    }
    *v4 = 0;
    return (_BYTE *)objc_msgSend(*(id *)(a1 + 32), "_transferQueue_sendFinishedCallback");
  }
  return result;
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
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  _transferQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__PBDataTransferMonitor_progress__block_invoke;
  v6[3] = &unk_1E24314F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSProgress *)v4;
}

void __33__PBDataTransferMonitor_progress__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)cancelOutstandingRequests
{
  NSObject *v3;
  _QWORD block[5];

  _transferQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PBDataTransferMonitor_cancelOutstandingRequests__block_invoke;
  block[3] = &unk_1E2430DF0;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __50__PBDataTransferMonitor_cancelOutstandingRequests__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v5), "progress", (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "cancel");

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)itemCollection:(id)a3 item:(id)a4 representation:(id)a5 beganDataTransferWithProgress:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  PBDataTransferMonitor *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  _transferQueue();
  v14 = objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __90__PBDataTransferMonitor_itemCollection_item_representation_beganDataTransferWithProgress___block_invoke;
  v22 = &unk_1E24321E8;
  v15 = v10;
  v23 = v15;
  v16 = v11;
  v24 = v16;
  v17 = v12;
  v25 = v17;
  v18 = v13;
  v26 = v18;
  v27 = self;
  v28 = &v29;
  dispatch_sync(v14, &v19);

  -[PBDataTransferMonitor willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("outstandingItemsCount"), v19, v20, v21, v22);
  self->_outstandingItemsCount = v30[3];
  -[PBDataTransferMonitor didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("outstandingItemsCount"));

  _Block_object_dispose(&v29, 8);
}

void __90__PBDataTransferMonitor_itemCollection_item_representation_beganDataTransferWithProgress___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  PBDataTransferRequest *v4;

  v4 = objc_alloc_init(PBDataTransferRequest);
  -[PBDataTransferRequest setItemCollection:](v4, "setItemCollection:", *(_QWORD *)(a1 + 32));
  -[PBDataTransferRequest setItem:](v4, "setItem:", *(_QWORD *)(a1 + 40));
  -[PBDataTransferRequest setRepr:](v4, "setRepr:", *(_QWORD *)(a1 + 48));
  -[PBDataTransferRequest setProgress:](v4, "setProgress:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 48), "addObject:", v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 8), "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 8), "setObject:forKeyedSubscript:", v3, v2);
  }
  objc_msgSend(v3, "addObject:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 16), "addObject:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 40), "addObject:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 56), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 64), CFSTR("fractionCompleted"), 1, 0);
  objc_msgSend(*(id *)(a1 + 64), "_transferQueue_recomputeMasterProgress");
  objc_msgSend(*(id *)(a1 + 64), "_transferQueue_scheduleBeganCallback");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 8), "count");

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
  v13[2] = __63__PBDataTransferMonitor__transferQueue_recomputeMasterProgress__block_invoke;
  v13[3] = &unk_1E2432210;
  v14 = v11;
  v15 = 100 * v3;
  v16 = v8;
  v12 = v11;
  PBDispatchAsyncCallback(v13);

}

uint64_t __63__PBDataTransferMonitor__transferQueue_recomputeMasterProgress__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTotalUnitCount:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", (uint64_t)(*(double *)(a1 + 48) * 100.0));
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
    block[2] = __72__PBDataTransferMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E2430DF0;
    block[4] = self;
    dispatch_async(v11, block);

  }
}

uint64_t __72__PBDataTransferMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transferQueue_recomputeMasterProgress");
}

- (void)itemCollection:(id)a3 item:(id)a4 representationFinishedDataTransfer:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  PBDataTransferMonitor *v20;
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  _transferQueue();
  v11 = objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __80__PBDataTransferMonitor_itemCollection_item_representationFinishedDataTransfer___block_invoke;
  v19 = &unk_1E2432238;
  v24 = &v30;
  v20 = self;
  v12 = v9;
  v21 = v12;
  v13 = v8;
  v22 = v13;
  v14 = v10;
  v23 = v14;
  v25 = &v26;
  dispatch_sync(v11, &v16);

  v15 = v31[3];
  if (v15 != v27[3])
  {
    -[PBDataTransferMonitor willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("outstandingItemsCount"), v16, v17, v18, v19, v20, v21, v22);
    self->_outstandingItemsCount = v27[3];
    -[PBDataTransferMonitor didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("outstandingItemsCount"));
    v15 = v31[3];
  }
  if (v15 && !v27[3])
    -[PBDataTransferMonitor _transferQueue_scheduleFinishedCallback](self, "_transferQueue_scheduleFinishedCallback");

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

}

void __80__PBDataTransferMonitor_itemCollection_item_representationFinishedDataTransfer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  v6 = v2;
  v7 = v3;
  v8 = v4;
  v18 = v5;
  if (objc_msgSend(v6, "count"))
  {
    v9 = 0;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "itemCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "isEqual:", v7))
        goto LABEL_8;
      objc_msgSend(v10, "item");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isEqual:", v8) & 1) == 0)
        break;
      objc_msgSend(v10, "repr");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqual:", v18);

      if (v14)
      {

        goto LABEL_11;
      }
LABEL_9:

      if (++v9 >= (unint64_t)objc_msgSend(v6, "count"))
        goto LABEL_10;
    }

LABEL_8:
    goto LABEL_9;
  }
LABEL_10:
  v9 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "progress");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 32), CFSTR("fractionCompleted"));

  objc_msgSend(v6, "removeObjectAtIndex:", v9);
  if (!objc_msgSend(v6, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", v17);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", v15);
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"))
    objc_msgSend(*(id *)(a1 + 32), "_transferQueue_scheduleFinishedCallback");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");

}

- (void)dealloc
{
  NSObject *v3;
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
  id v14;
  NSMutableDictionary *obj;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableDictionary count](self->_transferQueue_requestsBySourceItemUUID, "count"))
  {
    _PBLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = (id)objc_opt_class();
      v14 = v28;
      _os_log_fault_impl(&dword_18C53A000, v3, OS_LOG_TYPE_FAULT, "ERROR: %@ was deallocated while data transfer was still in progress.", buf, 0xCu);

    }
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = self->_transferQueue_requestsBySourceItemUUID;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_transferQueue_requestsBySourceItemUUID, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v18;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v18 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "progress");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "removeObserver:forKeyPath:", self, CFSTR("fractionCompleted"));

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v10);
        }

        ++v7;
      }
      while (v7 != v5);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);
  }

  v16.receiver = self;
  v16.super_class = (Class)PBDataTransferMonitor;
  -[PBDataTransferMonitor dealloc](&v16, sel_dealloc);
}

- (PBDataTransferMonitorDelegate)delegate
{
  return (PBDataTransferMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
