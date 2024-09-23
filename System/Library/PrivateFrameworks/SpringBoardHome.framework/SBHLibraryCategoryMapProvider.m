@implementation SBHLibraryCategoryMapProvider

uint64_t __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callbackQueue_notifyObserversFinishedRefreshSession:requests:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (id)requestLibraryCategoryMapRefreshWithOptions:(unint64_t)a3 reason:(id)a4
{
  id v6;
  SBHLibraryCategoryMapProviderRefreshRequest *v7;
  NSObject *workQueue;
  SBHLibraryCategoryMapProviderRefreshRequest *v9;
  SBHLibraryCategoryMapProviderRefreshRequest *v10;
  SBHLibraryCategoryMapProviderRefreshRequest *v11;
  _QWORD block[5];
  SBHLibraryCategoryMapProviderRefreshRequest *v14;
  unint64_t v15;

  v6 = a4;
  v7 = -[SBHLibraryCategoryMapProviderRefreshRequest initWithOptions:reason:]([SBHLibraryCategoryMapProviderRefreshRequest alloc], "initWithOptions:reason:", a3, v6);

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__SBHLibraryCategoryMapProvider_requestLibraryCategoryMapRefreshWithOptions_reason___block_invoke;
  block[3] = &unk_1E8D865D8;
  v15 = a3;
  block[4] = self;
  v9 = v7;
  v14 = v9;
  dispatch_async(workQueue, block);
  v10 = v14;
  v11 = v9;

  return v11;
}

- (void)_callbackQueue_notifyObserversCategoryMapDidntNeedRefresh
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssert();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = -[SBHLibraryCategoryMapProvider _copyOfObservers](self, "_copyOfObservers");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "libraryCategoryMapProviderRefreshedButFoundNoChanges:", self, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

void __84__SBHLibraryCategoryMapProvider_requestLibraryCategoryMapRefreshWithOptions_reason___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = (a1[6] >> 3) & 1;
  v2 = (void *)a1[4];
  v4[0] = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_workQueue_queueUpNextRequests:runNow:", v3, v1);

}

- (void)_workQueue_queueUpNextRequests:(id)a3 runNow:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  NSMutableArray *pendingRefreshRequests;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  NSMutableArray *v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  BSDispatchQueueAssert();
  if (objc_msgSend(v6, "count"))
  {
    SBLogProactiveAppLibrary();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      pendingRefreshRequests = self->_pendingRefreshRequests;
      v10 = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = pendingRefreshRequests;
      _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_DEFAULT, "Accumulating pending requests: %@ / Current Request Queue: %@", (uint8_t *)&v10, 0x16u);
    }

    -[NSMutableArray addObjectsFromArray:](self->_pendingRefreshRequests, "addObjectsFromArray:", v6);
  }
  if (-[NSArray count](self->_inflightRefreshRequests, "count"))
  {
    SBLogProactiveAppLibrary();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1CFEF3000, v9, OS_LOG_TYPE_DEFAULT, "Requests are inflight; deferring pending requests until after current requests are finished.",
        (uint8_t *)&v10,
        2u);
    }

  }
  else if (v4)
  {
    -[SBHLibraryCategoryMapProvider _workQueue_cancelAnyScheduledRefresh](self, "_workQueue_cancelAnyScheduledRefresh");
    -[SBHLibraryCategoryMapProvider _workQueue_performNextRequest](self, "_workQueue_performNextRequest");
  }
  else
  {
    -[SBHLibraryCategoryMapProvider _workQueue_scheduleRefreshIfNotScheduled](self, "_workQueue_scheduleRefreshIfNotScheduled");
  }

}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  uint64_t v27;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  BSDispatchQueueAssert();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    SBLogProactiveAppLibrary();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 72);
      *(_DWORD *)buf = 134217984;
      v30 = v6;
      _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "(%ld) Finished Library Category Map refresh", buf, 0xCu);
    }

    if (objc_msgSend(v3, "isEqualToCategoryMap:", *(_QWORD *)(a1 + 40)))
    {
      SBLogProactiveAppLibrary();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 72);
        *(_DWORD *)buf = 134217984;
        v30 = v8;
        _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_DEFAULT, "(%ld) Library category map refresh yielded no changes to map; bailing.",
          buf,
          0xCu);
      }

      v9 = *(NSObject **)(a1 + 48);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_128;
      block[3] = &unk_1E8D84C50;
      block[4] = WeakRetained;
      dispatch_async(v9, block);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      v10 = *(_QWORD *)(a1 + 40);
      SBLogProactiveAppLibrary();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v3 && v10)
      {
        if (v12)
        {
          v13 = *(_QWORD *)(a1 + 72);
          v14 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 134218240;
          v30 = v13;
          v31 = 2048;
          v32 = v14;
          _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_DEFAULT, "(%ld) Existing Library category map: %p", buf, 0x16u);
        }

        SBLogProactiveAppLibrary();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = *(_QWORD *)(a1 + 72);
          *(_DWORD *)buf = 134218240;
          v30 = v16;
          v31 = 2048;
          v32 = v3;
          _os_log_impl(&dword_1CFEF3000, v15, OS_LOG_TYPE_DEFAULT, "(%ld) Refreshed Library category map: %p", buf, 0x16u);
        }

        SBLogProactiveAppLibrary();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v17 = *(_QWORD *)(a1 + 72);
          +[SBHLibraryCategoryMap diffMap:withMap:](SBHLibraryCategoryMap, "diffMap:withMap:", v3, *(_QWORD *)(a1 + 40));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v30 = v17;
          v31 = 2112;
          v32 = v18;
          _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_DEFAULT, "(%ld) Library category map changes: %@", buf, 0x16u);

        }
      }
      else if (v12)
      {
        v19 = *(_QWORD *)(a1 + 72);
        *(_DWORD *)buf = 134218242;
        v30 = v19;
        v31 = 2112;
        v32 = v3;
        _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_DEFAULT, "(%ld) Library category map was freshly generated: %@", buf, 0x16u);
      }

      objc_msgSend(WeakRetained, "_workQueue_updateLibraryCategoryMap:withSessionId:shouldPersist:reason:", v3, *(_QWORD *)(a1 + 72), 1, CFSTR("_performNextRequest"));
      v20 = *(NSObject **)(a1 + 48);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_131;
      v25[3] = &unk_1E8D865D8;
      v21 = *(_QWORD *)(a1 + 80);
      v25[4] = WeakRetained;
      v27 = v21;
      v26 = v3;
      dispatch_async(v20, v25);
      (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 0, v22, v23, v24);

    }
  }

}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  _QWORD *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  const __CFString *v11;
  CFAbsoluteTime v12;
  uint64_t v13;
  _QWORD block[5];
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  CFAbsoluteTime v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  BSDispatchQueueAssert();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_2;
    block[3] = &unk_1E8D865D8;
    v6 = *(_QWORD *)(a1 + 64);
    block[4] = WeakRetained;
    v16 = v6;
    v7 = *(NSObject **)(a1 + 40);
    v15 = *(id *)(a1 + 48);
    dispatch_async(v7, block);
    v8 = (void *)v5[9];
    v5[9] = 0;

    SBLogProactiveAppLibrary();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 64);
      if (v3)
        v11 = CFSTR("UNSUCCESSFULLY");
      else
        v11 = CFSTR("SUCCESSFULLY");
      v12 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 72);
      v13 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134218754;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      v21 = 2048;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_1CFEF3000, v9, OS_LOG_TYPE_DEFAULT, "(%ld) Session completed '%@'; Request fulfillment time: %f -- Requests fulfilled: %@",
        buf,
        0x2Au);
    }

    objc_msgSend(v5, "_workQueue_scheduleRefreshIfNotScheduled");
  }

}

- (void)_workQueue_scheduleRefreshIfNotScheduled
{
  double v3;
  dispatch_time_t v4;
  NSObject *workQueue;
  _QWORD v6[4];
  id v7;
  id location;

  if (!self->_refreshIsScheduled)
  {
    objc_initWeak(&location, self);
    -[SBHLibraryCategoryMapProvider workQueueCoalescingInterval](self, "workQueueCoalescingInterval");
    v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
    workQueue = self->_workQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __73__SBHLibraryCategoryMapProvider__workQueue_scheduleRefreshIfNotScheduled__block_invoke;
    v6[3] = &unk_1E8D88B98;
    objc_copyWeak(&v7, &location);
    dispatch_after(v4, workQueue, v6);
    self->_refreshIsScheduled = 1;
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (double)workQueueCoalescingInterval
{
  return self->_workQueueCoalescingInterval;
}

- (void)_workQueue_performNextRequest
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "Discarding performing queued up requests (%@)... running PPTs right now", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (SBHLibraryCategoryMap)libraryCategoryMap
{
  SBHLibraryCategoryMapProvider *v2;
  SBHLibraryCategoryMap *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_libraryCategoryMap;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)hasCachedLibraryCategoryMapOnFileSystem
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "fileExistsAtPath:", self->_cacheFilePath);

  return (char)self;
}

- (void)_workQueue_cancelAnyScheduledRefresh
{
  self->_refreshIsScheduled = 0;
}

- (unint64_t)_nextSessionIdentifier
{
  SBHLibraryCategoryMapProvider *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_sessionIdentifier + 1;
  v2->_sessionIdentifier = v3;
  objc_sync_exit(v2);

  return v3;
}

- (void)_callbackQueue_notifyObserversWillRefresh:(int64_t)a3 options:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssert();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = -[SBHLibraryCategoryMapProvider _copyOfObservers](self, "_copyOfObservers");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "libraryCategoryMapProvider:willRefreshWithOptions:", self, a4, (_QWORD)v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)_callbackQueue_notifyObserversBeginningRefreshSession:(int64_t)a3 requests:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  BSDispatchQueueAssert();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = -[SBHLibraryCategoryMapProvider _copyOfObservers](self, "_copyOfObservers");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "libraryCategoryMapProvider:beginningRefreshWithSessionID:requests:", self, a3, v6, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)_callbackQueue_notifyObserversFinishedRefreshSession:(int64_t)a3 requests:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  BSDispatchQueueAssert();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = -[SBHLibraryCategoryMapProvider _copyOfObservers](self, "_copyOfObservers");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "libraryCategoryMapProvider:finishedRefreshWithSessionID:requests:", self, a3, v6, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (id)_copyOfObservers
{
  NSHashTable *v3;
  void *v4;

  v3 = self->_observers;
  objc_sync_enter(v3);
  v4 = (void *)-[NSHashTable copy](self->_observers, "copy");
  objc_sync_exit(v3);

  return v4;
}

+ (unint64_t)derivedOptionsFromArrayOfRequests:(id)a3
{
  id v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") > 1)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = v3;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v5 = 0;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v4);
          v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "options", (_QWORD)v11) & 0xF;
        }
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    objc_msgSend(v3, "firstObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "options");
  }

  return v5;
}

+ (void)clearCachesForReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&__lock);
  SBLogProactiveAppLibrary();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "Marking SBHLibraryCategoryMapProvider caches are needing to be wiped for reason: %@", buf, 0xCu);
  }

  objc_msgSend(a1, "cacheDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v7, "removeItemAtPath:error:", v6, &v13);
  v8 = v13;

  SBLogProactiveAppLibrary();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[SBHLibraryCategoryMapProvider clearCachesForReason:].cold.1();
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CFEF3000, v10, OS_LOG_TYPE_DEFAULT, "Success in deleting app library cache.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:", CFSTR("SBHLibraryCategoryMapProviderCachesWereClearedNotification"), 0);

  SBLogProactiveAppLibrary();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CFEF3000, v12, OS_LOG_TYPE_DEFAULT, "SBHLibraryCategoryMapProvider caches have been cleaned.  Hopefully successfully.", buf, 2u);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&__lock);
}

+ (id)categoryMapFromURL:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v13;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a3;
  objc_msgSend(v5, "setWithObjects:", objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v6, 1, &v13);

  v9 = v13;
  v10 = v9;
  if (v9)
  {
    v11 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v7, v8, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (SBHLibraryCategoryMapProvider)initWithSource:(id)a3
{
  id v5;
  SBHLibraryCategoryMapProvider *v6;
  SBHLibraryCategoryMapProvider *v7;
  uint64_t SerialWithQoS;
  OS_dispatch_queue *workQueue;
  uint64_t v10;
  OS_dispatch_queue *serializationQueue;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *cacheFilePath;
  uint64_t v16;
  NSMutableArray *pendingRefreshRequests;
  uint64_t v18;
  NSHashTable *observers;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBHLibraryCategoryMapProvider;
  v6 = -[SBHLibraryCategoryMapProvider init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryCategoryMapProviderSource, a3);
    -[SBHLibraryCategoryMapProviderSource setDelegate:](v7->_libraryCategoryMapProviderSource, "setDelegate:", v7);
    v7->_workQueueCoalescingInterval = 1.0;
    SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)SerialWithQoS;

    v10 = BSDispatchQueueCreateSerialWithQoS();
    serializationQueue = v7->_serializationQueue;
    v7->_serializationQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v7->_callbackQueue, MEMORY[0x1E0C80D38]);
    v12 = (void *)objc_opt_class();
    objc_msgSend(v5, "sourceName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "categoryMapCacheFilePathForVersion:source:", CFSTR("6"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    cacheFilePath = v7->_cacheFilePath;
    v7->_cacheFilePath = (NSString *)v14;

    v16 = objc_opt_new();
    pendingRefreshRequests = v7->_pendingRefreshRequests;
    v7->_pendingRefreshRequests = (NSMutableArray *)v16;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v18 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v18;

    -[SBHLibraryCategoryMapProvider _setupLocaleNotification](v7, "_setupLocaleNotification");
    -[SBHLibraryCategoryMapProvider _setupClearCacheNotification](v7, "_setupClearCacheNotification");
    -[SBHLibraryCategoryMapProvider _kickoffInitialHydration](v7, "_kickoffInitialHydration");
  }

  return v7;
}

+ (NSString)cacheDirectory
{
  void *v2;
  void *v3;
  void *v4;

  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("com.apple.springboard.appLibrary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

+ (id)baseFilePath
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "cacheDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.springboardhome.categorymapcache."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)categoryMapCacheFilePathForVersion:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "baseFilePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("%@.%@.%@"), v10, v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringByAppendingPathExtension:", CFSTR("plist"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)addObserver:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_observers;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)removeObserver:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_observers;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)_callbackQueue_notifyObserverCategoryMapWasRefreshedWithOptions:(unint64_t)a3 refreshedCategoryMap:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  BSDispatchQueueAssert();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = -[SBHLibraryCategoryMapProvider _copyOfObservers](self, "_copyOfObservers");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "libraryCategoryMapProvider:categoryMapWasRefreshed:libraryCategoryMap:", self, a3, v6, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)_callbackQueue_notifyObserversCategoryMapRefreshFailedWithError:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssert();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[SBHLibraryCategoryMapProvider _copyOfObservers](self, "_copyOfObservers");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "libraryCategoryMapProvider:failedToRefreshWithError:", self, v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_callbackQueue_notifyObserversWillReEnqueueFailedRequests:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssert();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[SBHLibraryCategoryMapProvider _copyOfObservers](self, "_copyOfObservers");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "libraryCategoryMapProvider:willReEnqueueFailedRequests:", self, v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_callbackQueue_notifyObserversWillSunsetFailedRequests:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssert();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[SBHLibraryCategoryMapProvider _copyOfObservers](self, "_copyOfObservers");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "libraryCategoryMapProvider:willSunsetFailedRequests:", self, v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)overrideCategoryMapForTestingAtURL:(id)a3 error:(id *)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "categoryMapFromURL:error:", v6, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SBHLibraryCategoryMapProvider overrideCategoryMapForTesting:](self, "overrideCategoryMapForTesting:", v7);
}

- (void)overrideCategoryMapForTesting:(id)a3
{
  id v4;
  SBHLibraryCategoryMapProvider *v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *workQueue;
  OS_dispatch_queue *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  OS_dispatch_queue *v12;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v5->_isCategoryMapOverriddenForTesting = v4 != 0;
  objc_sync_exit(v5);

  if (v4)
  {
    v6 = v5->_callbackQueue;
    workQueue = v5->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__SBHLibraryCategoryMapProvider_overrideCategoryMapForTesting___block_invoke;
    block[3] = &unk_1E8D84F18;
    block[4] = v5;
    v11 = v4;
    v12 = v6;
    v8 = v6;
    v9 = workQueue;
    dispatch_async(v9, block);

  }
}

void __63__SBHLibraryCategoryMapProvider_overrideCategoryMapForTesting___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_workQueue_updateLibraryCategoryMap:withSessionId:shouldPersist:reason:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_nextSessionIdentifier"), 0, CFSTR("Category map overidden for testing"));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__SBHLibraryCategoryMapProvider_overrideCategoryMapForTesting___block_invoke_2;
  v4[3] = &unk_1E8D84EF0;
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(a1 + 48);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v2;
  dispatch_async(v3, v4);

}

uint64_t __63__SBHLibraryCategoryMapProvider_overrideCategoryMapForTesting___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callbackQueue_notifyObserverCategoryMapWasRefreshedWithOptions:refreshedCategoryMap:", 6, *(_QWORD *)(a1 + 40));
}

- (void)clearOverride
{
  -[SBHLibraryCategoryMapProvider overrideCategoryMapForTesting:](self, "overrideCategoryMapForTesting:", 0);
}

- (void)resetForbiddenApplicationIdentifiers
{
  NSMutableSet *forbiddenApplicationIdentifiers;
  id v4;

  forbiddenApplicationIdentifiers = self->_forbiddenApplicationIdentifiers;
  if (forbiddenApplicationIdentifiers)
  {
    self->_forbiddenApplicationIdentifiers = 0;

    v4 = -[SBHLibraryCategoryMapProvider requestLibraryCategoryMapRefreshWithOptions:reason:](self, "requestLibraryCategoryMapRefreshWithOptions:reason:", 7, CFSTR("-[SBHLibraryCategoryMapProvider resetForbiddenApplicationIdentifiers]"));
  }
}

- (BOOL)forbidApplicationIdentifier:(id)a3
{
  id v4;
  NSMutableSet *forbiddenApplicationIdentifiers;
  BOOL v6;
  NSMutableSet *v7;
  NSMutableSet *v8;
  id v9;

  v4 = a3;
  if (!v4)
    goto LABEL_4;
  forbiddenApplicationIdentifiers = self->_forbiddenApplicationIdentifiers;
  if (!forbiddenApplicationIdentifiers)
  {
    v7 = (NSMutableSet *)objc_opt_new();
    v8 = self->_forbiddenApplicationIdentifiers;
    self->_forbiddenApplicationIdentifiers = v7;

    goto LABEL_6;
  }
  if ((-[NSMutableSet containsObject:](forbiddenApplicationIdentifiers, "containsObject:", v4) & 1) == 0)
  {
LABEL_6:
    -[NSMutableSet bs_safeAddObject:](self->_forbiddenApplicationIdentifiers, "bs_safeAddObject:", v4);
    v9 = -[SBHLibraryCategoryMapProvider requestLibraryCategoryMapRefreshWithOptions:reason:](self, "requestLibraryCategoryMapRefreshWithOptions:reason:", 14, CFSTR("-[SBHLibraryCategoryMapProvider forbidApplicationIdentifier]"));
    v6 = 1;
    goto LABEL_7;
  }
LABEL_4:
  v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)unforbidApplicationIdentifier:(id)a3
{
  id v4;
  int v5;
  NSMutableSet *forbiddenApplicationIdentifiers;
  id v7;

  v4 = a3;
  v5 = -[NSMutableSet containsObject:](self->_forbiddenApplicationIdentifiers, "containsObject:", v4);
  if (v5)
  {
    -[NSMutableSet removeObject:](self->_forbiddenApplicationIdentifiers, "removeObject:", v4);
    if (!-[NSMutableSet count](self->_forbiddenApplicationIdentifiers, "count"))
    {
      forbiddenApplicationIdentifiers = self->_forbiddenApplicationIdentifiers;
      self->_forbiddenApplicationIdentifiers = 0;

    }
    v7 = -[SBHLibraryCategoryMapProvider requestLibraryCategoryMapRefreshWithOptions:reason:](self, "requestLibraryCategoryMapRefreshWithOptions:reason:", 14, CFSTR("-[SBHLibraryCategoryMapProvider unforbidApplicationIdentifier]"));
  }

  return v5;
}

- (void)requestLibraryCategoryMapUpdateWithRefreshOptions:(unint64_t)a3 source:(id)a4
{
  void *v6;
  objc_class *v7;
  void *v8;
  id v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("-[SBHLibraryCategoryMapProvider requestLibraryCategoryMapUpdateWithRefreshOptions:source:%@]"), v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBHLibraryCategoryMapProvider requestLibraryCategoryMapRefreshWithOptions:reason:](self, "requestLibraryCategoryMapRefreshWithOptions:reason:", a3, v8);

}

- (BOOL)_workQueue_updateLibraryCategoryMap:(id)a3 withSessionId:(unint64_t)a4 shouldPersist:(BOOL)a5 reason:(id)a6
{
  _BOOL4 v7;
  id v11;
  id v12;
  OS_dispatch_queue *v13;
  SBHLibraryCategoryMapProvider *v14;
  NSObject *v15;
  _BOOL4 isCategoryMapOverriddenForTesting;
  NSObject *v17;
  NSString *v18;
  NSString *v19;
  NSObject *v20;
  const char *v21;
  BOOL v22;
  _BOOL4 v23;
  _BOOL4 v24;
  _QWORD v26[4];
  NSObject *v27;
  NSString *v28;
  SBHLibraryCategoryMapProvider *v29;
  unint64_t v30;
  uint8_t buf[4];
  unint64_t v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v7 = a5;
  v35 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  BSDispatchQueueAssert();
  v13 = self->_serializationQueue;
  v14 = self;
  objc_sync_enter(v14);
  SBLogProactiveAppLibrary();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v32 = a4;
    _os_log_impl(&dword_1CFEF3000, v15, OS_LOG_TYPE_DEFAULT, "(%ld) Will update library category map", buf, 0xCu);
  }

  objc_storeStrong((id *)&v14->_libraryCategoryMap, a3);
  isCategoryMapOverriddenForTesting = v14->_isCategoryMapOverriddenForTesting;
  SBLogProactiveAppLibrary();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v32 = a4;
    _os_log_impl(&dword_1CFEF3000, v17, OS_LOG_TYPE_DEFAULT, "(%ld) Did update library category map", buf, 0xCu);
  }

  objc_sync_exit(v14);
  v18 = v14->_cacheFilePath;
  v19 = v18;
  if (!v7)
  {
    SBLogProactiveAppLibrary();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v32 = a4;
      v33 = 2112;
      v34 = v12;
      _os_log_impl(&dword_1CFEF3000, v20, OS_LOG_TYPE_DEFAULT, "(%ld) Skipping library category map persistence; reason '%@' didn't want it",
        buf,
        0x16u);
    }
    goto LABEL_17;
  }
  if (!isCategoryMapOverriddenForTesting)
  {
    v23 = -[NSString length](v18, "length") == 0;
    SBLogProactiveAppLibrary();
    v20 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (!v24)
        goto LABEL_10;
      *(_DWORD *)buf = 134217984;
      v32 = a4;
      v21 = "(%ld) Skipping library category map persistence; no path specified";
      goto LABEL_9;
    }
    if (v24)
    {
      *(_DWORD *)buf = 134218242;
      v32 = a4;
      v33 = 2112;
      v34 = v12;
      _os_log_impl(&dword_1CFEF3000, v20, OS_LOG_TYPE_DEFAULT, "(%ld) Attempting to persist library category map, updated for reason: %@", buf, 0x16u);
    }

    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __104__SBHLibraryCategoryMapProvider__workQueue_updateLibraryCategoryMap_withSessionId_shouldPersist_reason___block_invoke;
    v26[3] = &unk_1E8D87570;
    v27 = v11;
    v28 = v19;
    v29 = v14;
    v30 = a4;
    dispatch_async((dispatch_queue_t)v13, v26);

    v20 = v27;
LABEL_17:
    v22 = 1;
    goto LABEL_18;
  }
  SBLogProactiveAppLibrary();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v32 = a4;
    v21 = "(%ld) Skipping library category map persistence; testing is running and so the data there is bupkis";
LABEL_9:
    _os_log_impl(&dword_1CFEF3000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
  }
LABEL_10:
  v22 = 0;
LABEL_18:

  return v22;
}

void __104__SBHLibraryCategoryMapProvider__workQueue_updateLibraryCategoryMap_withSessionId_shouldPersist_reason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  BOOL v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  id v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  char v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  id v60;
  uint64_t v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(*(id *)(a1 + 40), "stringByDeletingLastPathComponent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "fileURLWithPath:", v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v54 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject path](v4, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, &v54);

    v8 = objc_msgSend(*(id *)(a1 + 48), "hasCachedLibraryCategoryMapOnFileSystem");
    if (v7)
      v9 = v54 == 0;
    else
      v9 = 1;
    if (!v9 && v8 != 0)
    {
      SBLogProactiveAppLibrary();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v28 = *(_QWORD *)(a1 + 56);
        v29 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 134218242;
        v56 = v28;
        v57 = 2112;
        v58 = v29;
        _os_log_impl(&dword_1CFEF3000, v26, OS_LOG_TYPE_DEFAULT, "(%ld) Library category map caches directory exists @ '%@'; skipping creation...",
          buf,
          0x16u);
      }

LABEL_28:
      v36 = *(_QWORD *)(a1 + 32);
      v51 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v36, 1, &v51);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v51;
      SBLogProactiveAppLibrary();
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v22)
      {
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          __104__SBHLibraryCategoryMapProvider__workQueue_updateLibraryCategoryMap_withSessionId_shouldPersist_reason___block_invoke_cold_3();
      }
      else if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v40 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 134217984;
        v56 = v40;
        _os_log_impl(&dword_1CFEF3000, v39, OS_LOG_TYPE_DEFAULT, "(%ld) Library category map update persisted; contacting observers about successful refresh.",
          buf,
          0xCu);
      }

      v41 = *(_QWORD *)(a1 + 40);
      v50 = 0;
      objc_msgSend(v37, "writeToFile:options:error:", v41, 268435457, &v50);
      v42 = v50;
      SBLogProactiveAppLibrary();
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = v43;
      if (v42)
      {
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          __104__SBHLibraryCategoryMapProvider__workQueue_updateLibraryCategoryMap_withSessionId_shouldPersist_reason___block_invoke_cold_2();
      }
      else if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v45 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 134217984;
        v56 = v45;
        _os_log_impl(&dword_1CFEF3000, v44, OS_LOG_TYPE_DEFAULT, "(%ld) Library category map successfully written to file.", buf, 0xCu);
      }

      goto LABEL_39;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend((id)objc_opt_class(), "cacheDirectory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fileURLWithPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeItemAtURL:error:", v14, 0);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = *MEMORY[0x1E0CB2AD8];
    v62[0] = *MEMORY[0x1E0CB2AE0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0;
    v17 = objc_msgSend(v15, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, v16, &v53);
    v18 = v53;

    if ((v17 & 1) != 0)
    {
      SBLogProactiveAppLibrary();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(_QWORD *)(a1 + 56);
        v21 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 134218242;
        v56 = v20;
        v57 = 2112;
        v58 = v21;
        _os_log_impl(&dword_1CFEF3000, v19, OS_LOG_TYPE_DEFAULT, "(%ld) Library category map caches directory was created at URL '%@'", buf, 0x16u);
      }
      v22 = 0;
    }
    else
    {
      v22 = v18;
      SBLogProactiveAppLibrary();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v47 = *(_QWORD *)(a1 + 56);
        v48 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 134218498;
        v56 = v47;
        v57 = 2112;
        v58 = v48;
        v59 = 2112;
        v60 = v22;
        _os_log_error_impl(&dword_1CFEF3000, v19, OS_LOG_TYPE_ERROR, "(%ld) Error creating directory path '%@'  with error: %@", buf, 0x20u);
      }
    }

    v30 = *MEMORY[0x1E0C999D8];
    v52 = 0;
    v31 = -[NSObject setResourceValue:forKey:error:](v4, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAB0], v30, &v52);
    v32 = v52;
    SBLogProactiveAppLibrary();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if ((v31 & 1) != 0)
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v35 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 134217984;
        v56 = v35;
        _os_log_impl(&dword_1CFEF3000, v34, OS_LOG_TYPE_DEFAULT, "(%ld) Library category map cache directory path tagged excluded from backup successfully.", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      __104__SBHLibraryCategoryMapProvider__workQueue_updateLibraryCategoryMap_withSessionId_shouldPersist_reason___block_invoke_cold_4();
    }

    if (!v22)
      goto LABEL_28;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(a1 + 40);
    v49 = 0;
    objc_msgSend(v23, "removeItemAtPath:error:", v24, &v49);
    v22 = v49;

    SBLogProactiveAppLibrary();
    v25 = objc_claimAutoreleasedReturnValue();
    v4 = v25;
    if (v22)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        __104__SBHLibraryCategoryMapProvider__workQueue_updateLibraryCategoryMap_withSessionId_shouldPersist_reason___block_invoke_cold_1();
    }
    else if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v46 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 134217984;
      v56 = v46;
      _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_DEFAULT, "(%ld) Library category map update persisted; requested deletion of internal cache. Contacting observers about su"
        "ccessful refresh.",
        buf,
        0xCu);
    }
  }
LABEL_39:

}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_117(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  id *v34;
  id *from;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD block[4];
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  BSDispatchQueueAssert();
  from = (id *)(a1 + 72);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v34 = WeakRetained;
    objc_msgSend(v3, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
      v5 = (void *)MEMORY[0x1E0C9AA70];
    v7 = (void *)objc_msgSend(v5, "mutableCopy");

    if (*(_QWORD *)(a1 + 40))
      v8 = *(const __CFString **)(a1 + 40);
    else
      v8 = CFSTR("No reason?");
    v36 = v7;
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("SBHLibraryCategoryMapProviderUpdateReason"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 80));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("SBHLibraryCategoryMapProviderUpdateSessionId"));

    v10 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v3, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, objc_msgSend(v3, "code"), v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    SBLogProactiveAppLibrary();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_117_cold_4();

    SBLogProactiveAppLibrary();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_117_cold_3();

    v15 = (void *)objc_opt_new();
    v16 = (void *)objc_opt_new();
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v17 = *(id *)(a1 + 48);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v47 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v21, "accumulateFailure:forSession:", v12, *(_QWORD *)(a1 + 80));
          if (objc_msgSend(v21, "hasFailedSeveralTimes"))
            v22 = v16;
          else
            v22 = v15;
          objc_msgSend(v22, "addObject:", v21);
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      }
      while (v18);
    }

    v23 = objc_msgSend(v15, "count");
    v24 = MEMORY[0x1E0C809B0];
    if (v23)
    {
      SBLogProactiveAppLibrary();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_117_cold_2();

      objc_msgSend(v34[8], "addObjectsFromArray:", v15);
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v15, 1);
      v27 = *(NSObject **)(a1 + 56);
      block[0] = v24;
      block[1] = 3221225472;
      block[2] = __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_125;
      block[3] = &unk_1E8D88E90;
      objc_copyWeak(&v45, from);
      v44 = v26;
      v28 = v26;
      dispatch_async(v27, block);

      objc_destroyWeak(&v45);
    }
    if (objc_msgSend(v16, "count"))
    {
      SBLogProactiveAppLibrary();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_117_cold_1();

      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v16, 1);
      v31 = *(NSObject **)(a1 + 56);
      v40[0] = v24;
      v40[1] = 3221225472;
      v40[2] = __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_126;
      v40[3] = &unk_1E8D88E90;
      objc_copyWeak(&v42, from);
      v41 = v30;
      v32 = v30;
      dispatch_async(v31, v40);

      objc_destroyWeak(&v42);
    }
    v33 = *(NSObject **)(a1 + 56);
    v37[0] = v24;
    v37[1] = 3221225472;
    v37[2] = __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_2_127;
    v37[3] = &unk_1E8D88E90;
    objc_copyWeak(&v39, from);
    v3 = v12;
    v38 = v3;
    dispatch_async(v33, v37);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

    objc_destroyWeak(&v39);
    WeakRetained = v34;
  }

}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_125(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_callbackQueue_notifyObserversWillReEnqueueFailedRequests:", *(_QWORD *)(a1 + 32));

}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_126(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_callbackQueue_notifyObserversWillSunsetFailedRequests:", *(_QWORD *)(a1 + 32));

}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_2_127(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_callbackQueue_notifyObserversCategoryMapRefreshFailedWithError:", *(_QWORD *)(a1 + 32));

}

uint64_t __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_128(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callbackQueue_notifyObserversCategoryMapDidntNeedRefresh");
}

uint64_t __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_131(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callbackQueue_notifyObserverCategoryMapWasRefreshedWithOptions:refreshedCategoryMap:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_2_133(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_callbackQueue_notifyObserversBeginningRefreshSession:requests:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    SBLogProactiveAppLibrary();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 48);
      v6 = *(void **)(a1 + 32);
      v10 = 134218242;
      v11 = v5;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_DEFAULT, "(%ld) Starting Library Category Map refresh from requests '%@'", (uint8_t *)&v10, 0x16u);
    }

    SBLogProactiveAppLibrary();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 48);
      NSDictionaryFromSBHLibraryCategoryMapRefreshOptions(*(_QWORD *)(a1 + 56));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134218242;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_DEFAULT, "(%ld) Refresh options: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_msgSend(v3, "_callbackQueue_notifyObserversWillRefresh:options:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }

}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_134(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(uint64_t);
  uint64_t *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  BSDispatchQueueAssert();
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v11 = MEMORY[0x1E0C809B0];
    v7 = __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_2_135;
    v8 = &v11;
    v9 = v6;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v10 = MEMORY[0x1E0C809B0];
    v7 = __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_3_136;
    v8 = &v10;
    v9 = v5;
  }
  v8[1] = 3221225472;
  v8[2] = (uint64_t)v7;
  v8[3] = (uint64_t)&unk_1E8D865D8;
  v8[4] = (uint64_t)*(id *)(a1 + 40);
  v8[6] = *(_QWORD *)(a1 + 64);
  v8[5] = (uint64_t)v9;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_2_135(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v7, "options", (_QWORD)v11) & 0x20) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v15[0] = CFSTR("sbh_categoryMapRefreshSessionIDKey");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v15[1] = CFSTR("sbh_categoryMapRefreshErrorKey");
          v16[0] = v9;
          v16[1] = *(_QWORD *)(a1 + 40);
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("com.apple.springboardhome.categoryMapProviderRefreshCompleted"), v7, v10);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v4);
  }

}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_3_136(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v7, "options", (_QWORD)v11) & 0x20) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v15[0] = CFSTR("sbh_categoryMapRefreshSessionIDKey");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v15[1] = CFSTR("sbh_categoryMapKey");
          v16[0] = v9;
          v16[1] = *(_QWORD *)(a1 + 40);
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("com.apple.springboardhome.categoryMapProviderRefreshCompleted"), v7, v10);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v4);
  }

}

- (void)_kickoffInitialHydration
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "Error trying to open category map: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_setupClearCacheNotification
{
  void *v3;
  void *v4;
  id clearCacheNotificationHandle;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__SBHLibraryCategoryMapProvider__setupClearCacheNotification__block_invoke;
  v6[3] = &unk_1E8D88F58;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("SBHLibraryCategoryMapProviderCachesWereClearedNotification"), 0, 0, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  clearCacheNotificationHandle = self->_clearCacheNotificationHandle;
  self->_clearCacheNotificationHandle = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __61__SBHLibraryCategoryMapProvider__setupClearCacheNotification__block_invoke(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v2;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[4];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__SBHLibraryCategoryMapProvider__setupClearCacheNotification__block_invoke_2;
    block[3] = &unk_1E8D84C50;
    block[4] = v2;
    dispatch_async(v3, block);
  }

}

uint64_t __61__SBHLibraryCategoryMapProvider__setupClearCacheNotification__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_workQueue_updateLibraryCategoryMap:withSessionId:shouldPersist:reason:", 0, objc_msgSend(*(id *)(a1 + 32), "_nextSessionIdentifier"), 0, CFSTR("Caches Were Cleared Notification"));
}

- (void)_setupLocaleNotification
{
  void *v3;
  id localeNotificationHandle;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0C99720], 0, 0, &__block_literal_global_34);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  localeNotificationHandle = self->_localeNotificationHandle;
  self->_localeNotificationHandle = v3;

}

void __57__SBHLibraryCategoryMapProvider__setupLocaleNotification__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LOCALE WAS CHANGED: %@"), a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[SBHLibraryCategoryMapProvider clearCachesForReason:](SBHLibraryCategoryMapProvider, "clearCachesForReason:", v2);

}

void __73__SBHLibraryCategoryMapProvider__workQueue_scheduleRefreshIfNotScheduled__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  uint64_t v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_BYTE *)WeakRetained + 80))
    {
      *((_BYTE *)WeakRetained + 80) = 0;
      v4 = WeakRetained;
      v3 = objc_msgSend(WeakRetained[9], "count");
      v2 = v4;
      if (!v3)
      {
        objc_msgSend(v4, "_workQueue_performNextRequest");
        v2 = v4;
      }
    }
  }

}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryCategoryMap, 0);
  objc_storeStrong(&self->_clearCacheNotificationHandle, 0);
  objc_storeStrong(&self->_localeNotificationHandle, 0);
  objc_storeStrong((id *)&self->_inflightRefreshRequests, 0);
  objc_storeStrong((id *)&self->_pendingRefreshRequests, 0);
  objc_storeStrong((id *)&self->_forbiddenApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_cacheFilePath, 0);
  objc_storeStrong((id *)&self->_libraryCategoryMapProviderSource, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_serializationQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

+ (void)clearCachesForReason:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "Error deleting app library cache: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __104__SBHLibraryCategoryMapProvider__workQueue_updateLibraryCategoryMap_withSessionId_shouldPersist_reason___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_1(&dword_1CFEF3000, v0, v1, "(%ld) Error deleting category map: %@");
  OUTLINED_FUNCTION_3();
}

void __104__SBHLibraryCategoryMapProvider__workQueue_updateLibraryCategoryMap_withSessionId_shouldPersist_reason___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "(%ld) Error writing library category map to file.", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_3();
}

void __104__SBHLibraryCategoryMapProvider__workQueue_updateLibraryCategoryMap_withSessionId_shouldPersist_reason___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_1(&dword_1CFEF3000, v0, v1, "(%ld) Error persisting library category map: %@");
  OUTLINED_FUNCTION_3();
}

void __104__SBHLibraryCategoryMapProvider__workQueue_updateLibraryCategoryMap_withSessionId_shouldPersist_reason___block_invoke_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_1(&dword_1CFEF3000, v0, v1, "(%ld) Failed to tag library category map cache directory as excluded from backup:%@");
  OUTLINED_FUNCTION_3();
}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_117_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_1(&dword_1CFEF3000, v0, v1, "(%ld) Several failed requests are now invalid; letting these sunset: %@");
  OUTLINED_FUNCTION_3();
}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_117_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_1(&dword_1CFEF3000, v0, v1, "(%ld) Several failed requests are still valid; re-enqueing %@");
  OUTLINED_FUNCTION_3();
}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_117_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "(%ld) Updating requests w/ failure...", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_3();
}

void __62__SBHLibraryCategoryMapProvider__workQueue_performNextRequest__block_invoke_117_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_1(&dword_1CFEF3000, v0, v1, "(%ld) Finished Library Category Map refresh WITH ERROR: %@");
  OUTLINED_FUNCTION_3();
}

@end
