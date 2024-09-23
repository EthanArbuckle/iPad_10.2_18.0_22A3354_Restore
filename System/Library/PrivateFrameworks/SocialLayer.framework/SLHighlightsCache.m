@implementation SLHighlightsCache

void __38__SLHighlightsCache_initialFetchGroup__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

uint64_t __25__SLHighlightsCache_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerNotifications");
}

void __52__SLHighlightsCache_setClientUpdateHighlightsBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = _Block_copy(*(const void **)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __48__SLHighlightsCache_clientUpdateHighlightsBlock__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __33__SLHighlightsCache_addDelegate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;

  SLFrameworkLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __33__SLHighlightsCache_addDelegate___block_invoke_cold_1(a1, v2, v3);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "addObject:", *(_QWORD *)(a1 + 32));
}

void __37__SLHighlightsCache_currentDelegates__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegates");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (NSHashTable)delegates
{
  return self->_delegates;
}

void __40__SLHighlightsCache_highlightFetchQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.SocialLayer.HighlightFetchQueue", v2);
  v1 = (void *)highlightFetchQueue_queue;
  highlightFetchQueue_queue = (uint64_t)v0;

}

void __79__SLHighlightsCache__updateHighlightsWithPreviousUpdateBlock_debounceInterval___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fetchAndUpdateHighlightsImmediately");

}

- (void)_fetchAndUpdateHighlightsImmediately
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[SLHighlightsCache highlights](self, "highlights");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__SLHighlightsCache__fetchAndUpdateHighlightsImmediately__block_invoke;
  v5[3] = &unk_1E3794D98;
  objc_copyWeak(&v7, &location);
  v4 = v3;
  v6 = v4;
  -[SLHighlightsCache fetchHighlightsWithLimit:reason:variant:completionBlock:](self, "fetchHighlightsWithLimit:reason:variant:completionBlock:", 0x7FFFFFFFFFFFFFFFLL, 0, 0, v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)fetchHighlightsWithLimit:(unint64_t)a3 variant:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  SLFrameworkLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134217984;
    v12 = a3;
    _os_log_impl(&dword_199EFF000, v10, OS_LOG_TYPE_DEFAULT, "Fetching highlights with limit: %lu", (uint8_t *)&v11, 0xCu);
  }

  -[SLHighlightsCache fetchHighlightsWithLimit:reason:variant:completionBlock:](self, "fetchHighlightsWithLimit:reason:variant:completionBlock:", a3, 0, v9, v8);
}

- (SLInteractionHandler)interactionHandler
{
  SLInteractionHandler *interactionHandler;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  SLInteractionHandler *v8;
  SLInteractionHandler *v9;

  interactionHandler = self->_interactionHandler;
  if (!interactionHandler)
  {
    -[SLHighlightsCache currentDelegates](self, "currentDelegates");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "appIdentifierForHighlightsCache");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      SLFrameworkLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[SLHighlightsCache interactionHandler].cold.1();

      if (objc_msgSend(v6, "length"))
        v8 = -[SLInteractionHandler initWithAppIdentifier:]([SLInteractionHandler alloc], "initWithAppIdentifier:", v6);
      else
        v8 = objc_alloc_init(SLInteractionHandler);
      v9 = self->_interactionHandler;
      self->_interactionHandler = v8;

    }
    interactionHandler = self->_interactionHandler;
  }
  return interactionHandler;
}

- (void)_leaveInitialFetchGroupIfNecessary
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[SLHighlightsCache initialFetchGroup](self, "initialFetchGroup");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    SLFrameworkLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_199EFF000, v4, OS_LOG_TYPE_INFO, "Leaving initial fetch group to invoke callbacks waiting on the first fetch.", v5, 2u);
    }

    dispatch_group_leave(v3);
    -[SLHighlightsCache setInitialFetchGroup:](self, "setInitialFetchGroup:", 0);
  }

}

- (OS_dispatch_group)initialFetchGroup
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
  v10 = __Block_byref_object_copy__8;
  v11 = __Block_byref_object_dispose__8;
  v12 = 0;
  -[SLHighlightsCache threadSafePropertyQueue](self, "threadSafePropertyQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__SLHighlightsCache_initialFetchGroup__block_invoke;
  v6[3] = &unk_1E37942E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (OS_dispatch_group *)v4;
}

- (void)setHighlights:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[5];
  _QWORD block[5];
  id v11;
  _QWORD *v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  -[SLHighlightsCache highlights](self, "highlights");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToArray:", v5);

  if ((v6 & 1) == 0)
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3032000000;
    v13[3] = __Block_byref_object_copy__8;
    v13[4] = __Block_byref_object_dispose__8;
    -[SLHighlightsCache appIdentifier](self, "appIdentifier");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[SLHighlightsCache threadSafePropertyQueue](self, "threadSafePropertyQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__SLHighlightsCache_setHighlights___block_invoke;
    block[3] = &unk_1E3794E38;
    block[4] = self;
    v11 = v4;
    v12 = v13;
    dispatch_barrier_sync(v7, block);

    v9[0] = v8;
    v9[1] = 3221225472;
    v9[2] = __35__SLHighlightsCache_setHighlights___block_invoke_2;
    v9[3] = &unk_1E3794360;
    v9[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], v9);

    _Block_object_dispose(v13, 8);
  }

}

- (void)updateHighlights
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  SLFrameworkLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_199EFF000, v3, OS_LOG_TYPE_DEFAULT, "_updateHighlights for client: ", v6, 2u);
  }

  -[SLHighlightsCache clientUpdateHighlightsBlock](self, "clientUpdateHighlightsBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlightsCache _updateHighlightsWithPreviousUpdateBlock:debounceInterval:](self, "_updateHighlightsWithPreviousUpdateBlock:debounceInterval:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlightsCache setClientUpdateHighlightsBlock:](self, "setClientUpdateHighlightsBlock:", v5);

}

- (void)setClientUpdateHighlightsBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[SLHighlightsCache threadSafePropertyQueue](self, "threadSafePropertyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SLHighlightsCache_setClientUpdateHighlightsBlock___block_invoke;
  block[3] = &unk_1E3794DE8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_sync(v5, block);

}

- (id)clientUpdateHighlightsBlock
{
  NSObject *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *(*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__35;
  v11 = __Block_byref_object_dispose__36;
  v12 = 0;
  -[SLHighlightsCache threadSafePropertyQueue](self, "threadSafePropertyQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__SLHighlightsCache_clientUpdateHighlightsBlock__block_invoke;
  v6[3] = &unk_1E37942E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = _Block_copy((const void *)v8[5]);
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_updateHighlightsWithPreviousUpdateBlock:(id)a3 debounceInterval:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  dispatch_block_t v13;
  dispatch_time_t v14;
  NSObject *v15;
  void *v16;
  _QWORD block[4];
  id v19;
  id buf[2];

  v6 = a3;
  SLFrameworkLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SLHighlightsCache _updateHighlightsWithPreviousUpdateBlock:debounceInterval:].cold.1(v7, v8, v9);

  v10 = _Block_copy(v6);
  v11 = v10;
  if (v10)
    dispatch_block_cancel(v10);
  SLFrameworkLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_199EFF000, v12, OS_LOG_TYPE_DEFAULT, "_updateHighlightsWithPreviousUpdateBlock: ", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__SLHighlightsCache__updateHighlightsWithPreviousUpdateBlock_debounceInterval___block_invoke;
  block[3] = &unk_1E3794220;
  objc_copyWeak(&v19, buf);
  v13 = dispatch_block_create((dispatch_block_flags_t)0, block);
  v14 = dispatch_time(0, 1000000000 * a4);
  +[SLHighlightsCache highlightFetchQueue](SLHighlightsCache, "highlightFetchQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_after(v14, v15, v13);

  v16 = _Block_copy(v13);
  objc_destroyWeak(&v19);
  objc_destroyWeak(buf);

  return v16;
}

- (NSArray)highlights
{
  NSObject *v3;
  id v4;
  _QWORD block[7];
  _QWORD v7[5];
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__8;
  v13 = __Block_byref_object_dispose__8;
  v14 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__8;
  v7[4] = __Block_byref_object_dispose__8;
  -[SLHighlightsCache appIdentifier](self, "appIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SLHighlightsCache threadSafePropertyQueue](self, "threadSafePropertyQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__SLHighlightsCache_highlights__block_invoke;
  block[3] = &unk_1E3794E10;
  block[4] = self;
  block[5] = &v9;
  block[6] = v7;
  dispatch_sync(v3, block);

  v4 = (id)v10[5];
  _Block_object_dispose(v7, 8);

  _Block_object_dispose(&v9, 8);
  return (NSArray *)v4;
}

- (OS_dispatch_queue)threadSafePropertyQueue
{
  return self->_threadSafePropertyQueue;
}

- (NSString)appIdentifier
{
  void *v3;
  __CFString *v4;

  -[SLInteractionHandler appIdentifier](self->_interactionHandler, "appIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SLInteractionHandler appIdentifier](self->_interactionHandler, "appIdentifier");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("highlights");
  }

  return (NSString *)v4;
}

- (void)setInitialFetchGroup:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[SLHighlightsCache threadSafePropertyQueue](self, "threadSafePropertyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SLHighlightsCache_setInitialFetchGroup___block_invoke;
  block[3] = &unk_1E37942C0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_sync(v5, block);

}

- (void)_registerNotifications
{
  OUTLINED_FUNCTION_2();
}

+ (id)highlightFetchQueue
{
  if (highlightFetchQueue_onceToken != -1)
    dispatch_once(&highlightFetchQueue_onceToken, &__block_literal_global_6);
  return (id)highlightFetchQueue_queue;
}

void __57__SLHighlightsCache__fetchAndUpdateHighlightsImmediately__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  char v15;
  _BYTE v16[15];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "highlights");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(WeakRetained, "highlights");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToArray:", *(_QWORD *)(a1 + 32));

    if ((v6 & 1) == 0)
    {
      v14 = WeakRetained;
      objc_msgSend(WeakRetained, "currentDelegates");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v18;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v12, "legacyDidAddHighlights");
              SLFrameworkLogHandle();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v22 = v12;
                _os_log_impl(&dword_199EFF000, v13, OS_LOG_TYPE_DEFAULT, "legacyDidAddHighlights: delegate: %@", buf, 0xCu);
              }
            }
            else
            {
              SLFrameworkLogHandle();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                __57__SLHighlightsCache__fetchAndUpdateHighlightsImmediately__block_invoke_cold_1(&v15, v16);
            }

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
        }
        while (v9);
      }

      WeakRetained = v14;
    }
  }

}

- (id)currentDelegates
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
  v10 = __Block_byref_object_copy__8;
  v11 = __Block_byref_object_dispose__8;
  v12 = 0;
  -[SLHighlightsCache threadSafePropertyQueue](self, "threadSafePropertyQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__SLHighlightsCache_currentDelegates__block_invoke;
  v6[3] = &unk_1E37942E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)addDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  SLHighlightsCache *v9;

  v4 = a3;
  -[SLHighlightsCache threadSafePropertyQueue](self, "threadSafePropertyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SLHighlightsCache_addDelegate___block_invoke;
  block[3] = &unk_1E37942C0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_barrier_sync(v5, block);

}

+ (id)sharedCache
{
  SLHighlightsCache *WeakRetained;

  WeakRetained = (SLHighlightsCache *)objc_loadWeakRetained(&sSharedCache);
  if (!WeakRetained)
  {
    WeakRetained = objc_alloc_init(SLHighlightsCache);
    objc_storeWeak(&sSharedCache, WeakRetained);
  }
  return WeakRetained;
}

- (SLHighlightsCache)init
{
  SLHighlightsCache *v2;
  SLHighlightsCache *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *threadSafePropertyQueue;
  NSMutableDictionary *v7;
  NSMutableDictionary *highlightsCache;
  uint64_t v9;
  NSHashTable *delegates;
  dispatch_group_t v11;
  OS_dispatch_group *initialFetchGroup;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *initialFetchWaitingQueue;
  _QWORD block[4];
  SLHighlightsCache *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SLHighlightsCache;
  v2 = -[SLHighlightsCache init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_notificationTokenRefreshHighlights = -1;
    v2->_notificationTokenDeleteHighlights = -1;
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.SocialLayer.PropertyQueue", v4);
    threadSafePropertyQueue = v3->_threadSafePropertyQueue;
    v3->_threadSafePropertyQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    highlightsCache = v3->_highlightsCache;
    v3->_highlightsCache = v7;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = objc_claimAutoreleasedReturnValue();
    delegates = v3->_delegates;
    v3->_delegates = (NSHashTable *)v9;

    v11 = dispatch_group_create();
    initialFetchGroup = v3->_initialFetchGroup;
    v3->_initialFetchGroup = (OS_dispatch_group *)v11;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.SocialLayer.InitialFetchWaitingQueue", v13);
    initialFetchWaitingQueue = v3->_initialFetchWaitingQueue;
    v3->_initialFetchWaitingQueue = (OS_dispatch_queue *)v14;

    dispatch_group_enter((dispatch_group_t)v3->_initialFetchGroup);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __25__SLHighlightsCache_init__block_invoke;
    block[3] = &unk_1E3794360;
    v18 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  return v3;
}

void __42__SLHighlightsCache_setInitialFetchGroup___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

void __31__SLHighlightsCache_highlights__block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (id)userInitiatedHighlightFetchQueue
{
  if (userInitiatedHighlightFetchQueue_onceToken != -1)
    dispatch_once(&userInitiatedHighlightFetchQueue_onceToken, &__block_literal_global_9);
  return (id)userInitiatedHighlightFetchQueue_queue;
}

void __53__SLHighlightsCache_userInitiatedHighlightFetchQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.SocialLayer.UserInitiatedHighlightFetchQueue", v2);
  v1 = (void *)userInitiatedHighlightFetchQueue_queue;
  userInitiatedHighlightFetchQueue_queue = (uint64_t)v0;

}

+ (id)highlightQueryHandlerQueue
{
  if (highlightQueryHandlerQueue_onceToken != -1)
    dispatch_once(&highlightQueryHandlerQueue_onceToken, &__block_literal_global_11);
  return (id)highlightQueryHandlerQueue_queue;
}

void __47__SLHighlightsCache_highlightQueryHandlerQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.SocialLayer.HighlightQueryHandlerQueue", v2);
  v1 = (void *)highlightQueryHandlerQueue_queue;
  highlightQueryHandlerQueue_queue = (uint64_t)v0;

}

- (void)runAfterInitialFetch:(id)a3 onQueue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[SLHighlightsCache initialFetchWaitingQueue](self, "initialFetchWaitingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__SLHighlightsCache_runAfterInitialFetch_onQueue___block_invoke;
  v11[3] = &unk_1E3794D70;
  objc_copyWeak(&v14, &location);
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __50__SLHighlightsCache_runAfterInitialFetch_onQueue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_time_t v6;
  intptr_t v7;
  NSObject *v8;
  const __CFString *v9;
  id *v10;
  NSObject *v11;
  _QWORD *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  _QWORD v17[2];
  _QWORD v18[4];
  _QWORD v19[2];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "initialFetchGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  if (v3)
  {
    SLFrameworkLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[SLHighlightsCache runAfterInitialFetch:onQueue:]_block_invoke";
      _os_log_impl(&dword_199EFF000, v4, OS_LOG_TYPE_INFO, "%s Waiting on initial fetch group before running target block.", buf, 0xCu);
    }

    objc_msgSend(WeakRetained, "initialFetchGroup");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_time(0, 3000000000);
    v7 = dispatch_group_wait(v5, v6);

    if (v7)
      *((_BYTE *)v21 + 24) = 1;
    SLFrameworkLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      if (*((_BYTE *)v21 + 24))
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      *(_DWORD *)buf = 136315394;
      v25 = "-[SLHighlightsCache runAfterInitialFetch:onQueue:]_block_invoke";
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_199EFF000, v8, OS_LOG_TYPE_INFO, "%s Finished waiting on initial fetch group, and invoking target block. didTimeout: %@", buf, 0x16u);
    }

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __50__SLHighlightsCache_runAfterInitialFetch_onQueue___block_invoke_17;
    v18[3] = &unk_1E3794D48;
    v10 = (id *)v19;
    v11 = *(NSObject **)(a1 + 32);
    v19[0] = *(id *)(a1 + 40);
    v19[1] = &v20;
    v12 = v18;
  }
  else
  {
    SLFrameworkLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __50__SLHighlightsCache_runAfterInitialFetch_onQueue___block_invoke_cold_1(v13, v14, v15);

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __50__SLHighlightsCache_runAfterInitialFetch_onQueue___block_invoke_19;
    v16[3] = &unk_1E3794D48;
    v10 = (id *)v17;
    v11 = *(NSObject **)(a1 + 32);
    v17[0] = *(id *)(a1 + 40);
    v17[1] = &v20;
    v12 = v16;
  }
  dispatch_async(v11, v12);

  _Block_object_dispose(&v20, 8);
}

uint64_t __50__SLHighlightsCache_runAfterInitialFetch_onQueue___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

uint64_t __50__SLHighlightsCache_runAfterInitialFetch_onQueue___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

- (void)removeDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  SLHighlightsCache *v9;

  v4 = a3;
  -[SLHighlightsCache threadSafePropertyQueue](self, "threadSafePropertyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SLHighlightsCache_removeDelegate___block_invoke;
  block[3] = &unk_1E37942C0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_barrier_sync(v5, block);

}

uint64_t __36__SLHighlightsCache_removeDelegate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;

  SLFrameworkLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __36__SLHighlightsCache_removeDelegate___block_invoke_cold_1(a1, v2, v3);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "removeObject:", *(_QWORD *)(a1 + 32));
}

void __43__SLHighlightsCache__registerNotifications__block_invoke(uint64_t a1)
{
  NSObject *v1;
  id v2;
  uint8_t v3[8];
  id to;

  objc_copyWeak(&to, (id *)(a1 + 32));
  SLFrameworkLogHandle();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_199EFF000, v1, OS_LOG_TYPE_DEFAULT, "_updateHighlights for SLSocialHighlightsRefreshedNotification: ", v3, 2u);
  }

  v2 = objc_loadWeakRetained(&to);
  objc_msgSend(v2, "_updateHighlightsForSystemNotification");

  objc_destroyWeak(&to);
}

void __43__SLHighlightsCache__registerNotifications__block_invoke_26(uint64_t a1)
{
  NSObject *v1;
  id v2;
  uint8_t v3[8];
  id to;

  objc_copyWeak(&to, (id *)(a1 + 32));
  SLFrameworkLogHandle();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_199EFF000, v1, OS_LOG_TYPE_DEFAULT, "_updateHighlights for SLScreenTimeConversationDidObserveChangesNotification: ", v3, 2u);
  }

  v2 = objc_loadWeakRetained(&to);
  objc_msgSend(v2, "_updateHighlightsForSystemNotification");

  objc_destroyWeak(&to);
}

void __43__SLHighlightsCache__registerNotifications__block_invoke_28(uint64_t a1)
{
  NSObject *v2;
  id v3;
  id to;
  uint8_t buf[16];

  SLFrameworkLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199EFF000, v2, OS_LOG_TYPE_DEFAULT, "SLHighlightsCache notify_register_dispatch: com.apple.spotlight.SyndicatedContentDeleted observed.", buf, 2u);
  }

  objc_copyWeak(&to, (id *)(a1 + 32));
  v3 = objc_loadWeakRetained(&to);
  objc_msgSend(v3, "didDeleteHighlightsOrAttributions");

  objc_destroyWeak(&to);
}

- (void)_updateHighlightsForSystemNotification
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  SLFrameworkLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_199EFF000, v3, OS_LOG_TYPE_DEFAULT, "_updateHighlightsForSystemNotification: ", v6, 2u);
  }

  -[SLHighlightsCache systemUpdateHighlightsBlock](self, "systemUpdateHighlightsBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlightsCache _updateHighlightsWithPreviousUpdateBlock:debounceInterval:](self, "_updateHighlightsWithPreviousUpdateBlock:debounceInterval:", v4, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlightsCache setSystemUpdateHighlightsBlock:](self, "setSystemUpdateHighlightsBlock:", v5);

}

- (void)didDeleteHighlightsOrAttributions
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[SLHighlightsCache didDeleteHighlightsOrAttributions]";
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, a1, a3, "%s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

void __54__SLHighlightsCache_didDeleteHighlightsOrAttributions__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  uint64_t v33;
  char v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  _BOOL4 v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "highlights");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      SLFrameworkLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        __54__SLHighlightsCache_didDeleteHighlightsOrAttributions__block_invoke_cold_3();

      v6 = objc_alloc(MEMORY[0x1E0C99E08]);
      objc_msgSend(*(id *)(a1 + 32), "highlights");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

      v9 = objc_alloc(MEMORY[0x1E0C99E08]);
      objc_msgSend(*(id *)(a1 + 32), "highlights");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v12 = *(id *)(a1 + 40);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v50 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
            objc_msgSend(v17, "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKey:", v17, v18);

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
        }
        while (v14);
      }

      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "highlights");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v46;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v46 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
            objc_msgSend(v24, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKey:", v24, v25);

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
        }
        while (v21);
      }
      v26 = a1;

      v40 = v11;
      objc_msgSend(v11, "allKeys");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      objc_msgSend(v8, "allKeys");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v42;
        do
        {
          for (k = 0; k != v30; ++k)
          {
            if (*(_QWORD *)v42 != v31)
              objc_enumerationMutation(v28);
            v33 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * k);
            v34 = objc_msgSend(v27, "containsObject:", v33);
            objc_msgSend(v8, "objectForKey:", v33);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v34 & 1) != 0)
            {
              objc_msgSend(v40, "objectForKey:", v33);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v35, "isEqual:", v36) & 1) == 0)
                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v26 + 56) + 8) + 24) = 1;

            }
            else
            {
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v26 + 48) + 8) + 40), "addObject:", v35);
            }

          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
        }
        while (v30);
      }

      v37 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v26 + 48) + 8) + 40), "count");
      SLFrameworkLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG);
      if (v37)
      {
        if (v39)
          __54__SLHighlightsCache_didDeleteHighlightsOrAttributions__block_invoke_cold_2(v26 + 48, v38);

        objc_msgSend(*(id *)(v26 + 32), "_notifyDelegatesWithNotificationType:withHighlights:", 2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v26 + 48) + 8) + 40));
      }
      else
      {
        if (v39)
          __54__SLHighlightsCache_didDeleteHighlightsOrAttributions__block_invoke_cold_1();

      }
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v26 + 56) + 8) + 24))
        objc_msgSend(*(id *)(v26 + 32), "_notifyDelegatesWithNotificationType:withHighlights:", 1, 0);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_notifyDelegatesWithNotificationType:withHighlights:", 2, *(_QWORD *)(a1 + 40));
    }
  }
}

- (void)_notifyDelegatesWithNotificationType:(int64_t)a3 withHighlights:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t k;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  NSObject *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  char v36;
  _BYTE v37[15];
  char v38;
  _BYTE v39[15];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[SLHighlightsCache currentDelegates](self, "currentDelegates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  switch(a3)
  {
    case 2:
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v16 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v29 != v18)
              objc_enumerationMutation(v8);
            v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            if (v20 && (objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v20, "legacyDidRemoveHighlights:", v6);
            }
            else
            {
              SLFrameworkLogHandle();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                -[SLHighlightsCache _notifyDelegatesWithNotificationType:withHighlights:].cold.4(&v38, v39);

            }
          }
          v17 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
        }
        while (v17);
      }
      break;
    case 1:
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v22 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v33;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v33 != v24)
              objc_enumerationMutation(v8);
            v26 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v26, "legacyDidAddHighlights");
            }
            else
            {
              SLFrameworkLogHandle();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                __57__SLHighlightsCache__fetchAndUpdateHighlightsImmediately__block_invoke_cold_1(&v38, v39);

            }
          }
          v23 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
        }
        while (v23);
      }
      break;
    case 0:
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v41;
        do
        {
          for (k = 0; k != v10; ++k)
          {
            if (*(_QWORD *)v41 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * k);
            SLFrameworkLogHandle();
            v14 = objc_claimAutoreleasedReturnValue();
            v15 = v14;
            if (v13)
            {
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
                -[SLHighlightsCache _notifyDelegatesWithNotificationType:withHighlights:].cold.2(&v38, v39);

              objc_msgSend(v13, "highlightsChanged");
            }
            else
            {
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                -[SLHighlightsCache _notifyDelegatesWithNotificationType:withHighlights:].cold.1(&v36, v37);

            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
        }
        while (v10);
      }
      break;
  }

}

- (id)systemUpdateHighlightsBlock
{
  NSObject *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *(*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__35;
  v11 = __Block_byref_object_dispose__36;
  v12 = 0;
  -[SLHighlightsCache threadSafePropertyQueue](self, "threadSafePropertyQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__SLHighlightsCache_systemUpdateHighlightsBlock__block_invoke;
  v6[3] = &unk_1E37942E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = _Block_copy((const void *)v8[5]);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __48__SLHighlightsCache_systemUpdateHighlightsBlock__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 48));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setSystemUpdateHighlightsBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[SLHighlightsCache threadSafePropertyQueue](self, "threadSafePropertyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SLHighlightsCache_setSystemUpdateHighlightsBlock___block_invoke;
  block[3] = &unk_1E3794DE8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_sync(v5, block);

}

void __52__SLHighlightsCache_setSystemUpdateHighlightsBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = _Block_copy(*(const void **)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

}

void __35__SLHighlightsCache_setHighlights___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1[4] + 24);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", a1[5]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

}

uint64_t __35__SLHighlightsCache_setHighlights___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegatesWithNotificationType:withHighlights:", 0, 0);
}

- (void)fetchHighlightsWithLimit:(unint64_t)a3 reason:(id)a4 variant:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  SLHighlightsCache *v20;
  id v21;
  id v22;
  unint64_t v23;
  uint8_t buf[4];
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  SLFrameworkLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v25 = a3;
    _os_log_impl(&dword_199EFF000, v13, OS_LOG_TYPE_DEFAULT, "Fetching highlights with limit: %lu", buf, 0xCu);
  }

  if (objc_msgSend(v10, "isEqualToString:", CFSTR("deleteHighlights")))
    +[SLHighlightsCache userInitiatedHighlightFetchQueue](SLHighlightsCache, "userInitiatedHighlightFetchQueue");
  else
    +[SLHighlightsCache highlightFetchQueue](SLHighlightsCache, "highlightFetchQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__SLHighlightsCache_fetchHighlightsWithLimit_reason_variant_completionBlock___block_invoke;
  block[3] = &unk_1E3794E88;
  v19 = v11;
  v20 = self;
  v22 = v12;
  v23 = a3;
  v21 = v10;
  v15 = v12;
  v16 = v10;
  v17 = v11;
  dispatch_async(v14, block);

}

void __77__SLHighlightsCache_fetchHighlightsWithLimit_reason_variant_completionBlock___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (!objc_msgSend(v2, "length"))
  {
    v3 = (id)*MEMORY[0x1E0D70F10];

    v2 = v3;
  }
  objc_msgSend(*(id *)(a1 + 40), "interactionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 48);
  v18 = 0;
  objc_msgSend(v4, "fetchInteractionsWithLimit:reason:variant:error:", v5, v6, v2, &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v18;

  if (v7)
  {
    +[SLHighlightsCache highlightQueryHandlerQueue](SLHighlightsCache, "highlightQueryHandlerQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__SLHighlightsCache_fetchHighlightsWithLimit_reason_variant_completionBlock___block_invoke_2;
    block[3] = &unk_1E3794E60;
    block[4] = *(_QWORD *)(a1 + 40);
    v15 = v7;
    v17 = *(id *)(a1 + 56);
    v16 = v8;
    dispatch_async(v9, block);

  }
  else
  {
    SLFrameworkLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 64);
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v20 = v11;
      v21 = 2048;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      _os_log_error_impl(&dword_199EFF000, v10, OS_LOG_TYPE_ERROR, "Failed to obtain results due to %@. Limit: %lu, Variant: %@", buf, 0x20u);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "_leaveInitialFetchGroupIfNecessary");

}

void __77__SLHighlightsCache_fetchHighlightsWithLimit_reason_variant_completionBlock___block_invoke_2(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  NSObject *v4;

  v2 = (id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "setHighlights:", *(_QWORD *)(a1 + 40));
  SLFrameworkLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __77__SLHighlightsCache_fetchHighlightsWithLimit_reason_variant_completionBlock___block_invoke_2_cold_2(v2, v3);

  if (*(_QWORD *)(a1 + 56))
  {
    SLFrameworkLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __77__SLHighlightsCache_fetchHighlightsWithLimit_reason_variant_completionBlock___block_invoke_2_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_199EFF000, v0, v1, "SLHighlightsConsumer: Dealloc called. Canceling listening to highlight change notifcations", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (NSMutableDictionary)highlightsCache
{
  return self->_highlightsCache;
}

- (void)setHighlightsCache:(id)a3
{
  objc_storeStrong((id *)&self->_highlightsCache, a3);
}

- (void)setDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_delegates, a3);
}

- (void)setInteractionHandler:(id)a3
{
  objc_storeStrong((id *)&self->_interactionHandler, a3);
}

- (OS_dispatch_queue)initialFetchWaitingQueue
{
  return self->_initialFetchWaitingQueue;
}

- (void)setInitialFetchWaitingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_initialFetchWaitingQueue, a3);
}

- (int)notificationTokenRefreshHighlights
{
  return self->_notificationTokenRefreshHighlights;
}

- (int)notificationTokenScreenTimeChange
{
  return self->_notificationTokenScreenTimeChange;
}

- (int)notificationTokenDeleteHighlights
{
  return self->_notificationTokenDeleteHighlights;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialFetchWaitingQueue, 0);
  objc_storeStrong((id *)&self->_threadSafePropertyQueue, 0);
  objc_storeStrong((id *)&self->_interactionHandler, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong(&self->_systemUpdateHighlightsBlock, 0);
  objc_storeStrong(&self->_clientUpdateHighlightsBlock, 0);
  objc_storeStrong((id *)&self->_initialFetchGroup, 0);
  objc_storeStrong((id *)&self->_highlightsCache, 0);
}

void __50__SLHighlightsCache_runAfterInitialFetch_onQueue___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[SLHighlightsCache runAfterInitialFetch:onQueue:]_block_invoke_2";
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, a1, a3, "%s Initial fetch has already completed, running target block.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

void __33__SLHighlightsCache_addDelegate___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, a2, a3, "Adding SLHighlightCacheDelegate: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_5();
}

void __36__SLHighlightsCache_removeDelegate___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, a2, a3, "Removing SLHighlightCacheDelegate: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_5();
}

- (void)interactionHandler
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, v0, v1, "Initializing Highlights cache with applicationIdentifier: %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)_updateHighlightsWithPreviousUpdateBlock:(uint64_t)a3 debounceInterval:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[SLHighlightsCache _updateHighlightsWithPreviousUpdateBlock:debounceInterval:]";
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, a1, a3, "%s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

void __57__SLHighlightsCache__fetchAndUpdateHighlightsImmediately__block_invoke_cold_1(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_4_1(a1, a2);
  OUTLINED_FUNCTION_2_0(&dword_199EFF000, v2, v3, "Delegate does not respond to legacyDidAddHighlights", v4);
}

void __54__SLHighlightsCache_didDeleteHighlightsOrAttributions__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_199EFF000, v0, v1, "SLHighlightsCache didDeleteHighlightsOrAttributions: No highlights were found to have been deleted.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __54__SLHighlightsCache_didDeleteHighlightsOrAttributions__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40), "count");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, a2, v3, "SLHighlightsCache didDeleteHighlightsOrAttributions: Notify delegates of deletion of %lu highlights", v4);
  OUTLINED_FUNCTION_6();
}

void __54__SLHighlightsCache_didDeleteHighlightsOrAttributions__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_199EFF000, v0, v1, "SLHighlightsCache didDeleteHighlightsOrAttributions: successfully fetched new highlights", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_notifyDelegatesWithNotificationType:(_BYTE *)a1 withHighlights:(_BYTE *)a2 .cold.1(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_4_1(a1, a2);
  OUTLINED_FUNCTION_2_0(&dword_199EFF000, v2, v3, "Delegate does not respond to highlightsChanged", v4);
}

- (void)_notifyDelegatesWithNotificationType:(_BYTE *)a1 withHighlights:(_BYTE *)a2 .cold.2(_BYTE *a1, _BYTE *a2)
{
  os_log_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_4_1(a1, a2);
  _os_log_debug_impl(&dword_199EFF000, v2, OS_LOG_TYPE_DEBUG, "Informing delegate highlights did change.", v3, 2u);
}

- (void)_notifyDelegatesWithNotificationType:(_BYTE *)a1 withHighlights:(_BYTE *)a2 .cold.4(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_4_1(a1, a2);
  OUTLINED_FUNCTION_2_0(&dword_199EFF000, v2, v3, "Delegate does not respond to legacyDidRemoveHighlights", v4);
}

void __77__SLHighlightsCache_fetchHighlightsWithLimit_reason_variant_completionBlock___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_199EFF000, v0, v1, "in completion block", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __77__SLHighlightsCache_fetchHighlightsWithLimit_reason_variant_completionBlock___block_invoke_2_cold_2(id *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "count");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, a2, v3, "Got %tu results from InteractionHandler", v4);
  OUTLINED_FUNCTION_6();
}

@end
