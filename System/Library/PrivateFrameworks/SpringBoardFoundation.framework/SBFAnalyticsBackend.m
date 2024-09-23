@implementation SBFAnalyticsBackend

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *asyncHandlerQueue;
  id v13;
  _QWORD block[5];
  id v16;
  unint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = self->_syncEventHandlers;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11++), "handleEvent:withContext:", a3, v6);
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  asyncHandlerQueue = self->_asyncHandlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SBFAnalyticsBackend_handleEvent_withContext___block_invoke;
  block[3] = &unk_1E200E650;
  v16 = v6;
  v17 = a3;
  block[4] = self;
  v13 = v6;
  dispatch_async(asyncHandlerQueue, block);

  return 1;
}

void __47__SBFAnalyticsBackend_handleEvent_withContext___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1[4] + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "handleEvent:withContext:", a1[6], a1[5], (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_9);
  return (id)sharedInstance___backend;
}

void __37__SBFAnalyticsBackend_sharedInstance__block_invoke()
{
  SBFAnalyticsBackend *v0;
  void *v1;

  v0 = objc_alloc_init(SBFAnalyticsBackend);
  v1 = (void *)sharedInstance___backend;
  sharedInstance___backend = (uint64_t)v0;

}

- (SBFAnalyticsBackend)init
{
  SBFAnalyticsBackend *v2;
  NSMutableArray *v3;
  NSMutableArray *asyncEventHandlers;
  NSMutableArray *v5;
  NSMutableArray *syncEventHandlers;
  NSMutableDictionary *v7;
  NSMutableDictionary *stateQueryHandlers;
  dispatch_queue_t v9;
  OS_dispatch_queue *queryHandlerQueue;
  dispatch_queue_t v11;
  OS_dispatch_queue *asyncHandlerQueue;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBFAnalyticsBackend;
  v2 = -[SBFAnalyticsBackend init](&v14, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    asyncEventHandlers = v2->_asyncEventHandlers;
    v2->_asyncEventHandlers = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    syncEventHandlers = v2->_syncEventHandlers;
    v2->_syncEventHandlers = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    stateQueryHandlers = v2->_stateQueryHandlers;
    v2->_stateQueryHandlers = v7;

    v9 = dispatch_queue_create("com.apple.springboard.analytics.statequery", 0);
    queryHandlerQueue = v2->_queryHandlerQueue;
    v2->_queryHandlerQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_create("com.apple.springboard.analytics.eventhandling", 0);
    asyncHandlerQueue = v2->_asyncHandlerQueue;
    v2->_asyncHandlerQueue = (OS_dispatch_queue *)v11;

  }
  return v2;
}

- (void)registerEventHandler:(id)a3
{
  SBFAnalyticsBackend *v4;
  NSObject *asyncHandlerQueue;
  SBFAnalyticsBackend *v6;
  id v7;
  _QWORD v8[5];
  SBFAnalyticsBackend *v9;

  v4 = (SBFAnalyticsBackend *)a3;
  if (v4 == self)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("don't be a jerk"), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  asyncHandlerQueue = self->_asyncHandlerQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__SBFAnalyticsBackend_registerEventHandler___block_invoke;
  v8[3] = &unk_1E200E2A0;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  dispatch_async(asyncHandlerQueue, v8);

}

uint64_t __44__SBFAnalyticsBackend_registerEventHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)registerSynchronousEventHandler:(id)a3
{
  SBFAnalyticsBackend *v4;
  id v5;
  SBFAnalyticsBackend *v6;

  v4 = (SBFAnalyticsBackend *)a3;
  if (v4 == self)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("don't be a jerk"), 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }
  v6 = v4;
  -[NSMutableArray addObject:](self->_syncEventHandlers, "addObject:", v4);

}

- (void)registerForQueryName:(unint64_t)a3 handler:(id)a4
{
  id v6;
  NSObject *queryHandlerQueue;
  id v8;
  void *v9;
  _QWORD block[5];
  id v11;
  unint64_t v12;

  v6 = a4;
  queryHandlerQueue = self->_queryHandlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SBFAnalyticsBackend_registerForQueryName_handler___block_invoke;
  block[3] = &unk_1E200E678;
  v11 = v6;
  v12 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queryHandlerQueue, block);
  NSStringFromAnalyticsQueryName();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSetCallbackForQueriedEventWithQueue();

}

void __52__SBFAnalyticsBackend_registerForQueryName_handler___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v2 = *(void **)(a1[4] + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("state query handler already registered for name"), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  v5 = *(void **)(a1[4] + 24);
  v8 = (id)MEMORY[0x18D774178](a1[5]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v8, v6);

}

- (void)stateForQueryName:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *queryHandlerQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  queryHandlerQueue = self->_queryHandlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SBFAnalyticsBackend_stateForQueryName_completion___block_invoke;
  block[3] = &unk_1E200E678;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queryHandlerQueue, block);

}

void __52__SBFAnalyticsBackend_stateForQueryName_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void (**v5)(void);

  v2 = *(void **)(a1[4] + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v5[2]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(a1[5] + 16))();

  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncHandlerQueue, 0);
  objc_storeStrong((id *)&self->_queryHandlerQueue, 0);
  objc_storeStrong((id *)&self->_stateQueryHandlers, 0);
  objc_storeStrong((id *)&self->_syncEventHandlers, 0);
  objc_storeStrong((id *)&self->_asyncEventHandlers, 0);
}

@end
