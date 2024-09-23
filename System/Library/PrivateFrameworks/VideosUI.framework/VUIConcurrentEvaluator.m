@implementation VUIConcurrentEvaluator

- (void)lockSchedulingForEvaluation:(id)a3
{
  VUIConcurrentEvaluator *v4;
  void (**v5)(_QWORD);
  int64_t numberOfSchedulingLocksAcquired;
  uint64_t v7;
  dispatch_semaphore_t *obj;

  v4 = self;
  v5 = (void (**)(_QWORD))a3;
  objc_sync_enter(v4);
  numberOfSchedulingLocksAcquired = v4->_numberOfSchedulingLocksAcquired;
  v4->_numberOfSchedulingLocksAcquired = numberOfSchedulingLocksAcquired + 1;
  if (!numberOfSchedulingLocksAcquired)
    dispatch_semaphore_wait((dispatch_semaphore_t)v4->_schedulingLock, 0xFFFFFFFFFFFFFFFFLL);
  objc_sync_exit(v4);

  v5[2](v5);
  obj = v4;
  objc_sync_enter(obj);
  v7 = v4->_numberOfSchedulingLocksAcquired - 1;
  v4->_numberOfSchedulingLocksAcquired = v7;
  if (!v7)
    dispatch_semaphore_signal(obj[6]);
  objc_sync_exit(obj);

}

+ (id)idleEvaluator
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__VUIConcurrentEvaluator_idleEvaluator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (idleEvaluator_onceToken != -1)
    dispatch_once(&idleEvaluator_onceToken, block);
  return (id)idleEvaluator_idleEvaluator;
}

void __39__VUIConcurrentEvaluator_idleEvaluator__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  dispatch_get_global_queue(-32768, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "initWithQueue:concurrencyCount:", v4, 1);
  v3 = (void *)idleEvaluator_idleEvaluator;
  idleEvaluator_idleEvaluator = v2;

}

- (VUIConcurrentEvaluator)initWithQueue:(id)a3 concurrencyCount:(int64_t)a4
{
  id v7;
  VUIConcurrentEvaluator *v8;
  VUIConcurrentEvaluator *v9;
  int64_t v10;
  dispatch_semaphore_t v11;
  OS_dispatch_semaphore *schedulingLock;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VUIConcurrentEvaluator;
  v8 = -[VUIConcurrentEvaluator init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a3);
    v10 = 10;
    if (a4 < 10)
      v10 = a4;
    v9->_concurrencyCount = v10;
    v11 = dispatch_semaphore_create(1);
    schedulingLock = v9->_schedulingLock;
    v9->_schedulingLock = (OS_dispatch_semaphore *)v11;

  }
  return v9;
}

- (VUIConcurrentEvaluator)initWithQueue:(id)a3
{
  return -[VUIConcurrentEvaluator initWithQueue:concurrencyCount:](self, "initWithQueue:concurrencyCount:", a3, 10);
}

- (void)addEvaluationBlock:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  VUIConcurrentEvaluator *v15;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  _QWORD *v19;
  _QWORD aBlock[4];
  NSObject *v21;
  _QWORD *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__19;
  v24[4] = __Block_byref_object_dispose__19;
  v25 = 0;
  v8 = dispatch_semaphore_create(0);
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__VUIConcurrentEvaluator_addEvaluationBlock_forKey___block_invoke;
  aBlock[3] = &unk_1E9FA0758;
  objc_copyWeak(&v23, &location);
  v10 = v8;
  v21 = v10;
  v22 = v24;
  v11 = _Block_copy(aBlock);
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __52__VUIConcurrentEvaluator_addEvaluationBlock_forKey___block_invoke_2;
  v16[3] = &unk_1E9FA0780;
  v19 = v24;
  v12 = v6;
  v18 = v12;
  v13 = v10;
  v17 = v13;
  v14 = _Block_copy(v16);
  v15 = self;
  objc_sync_enter(v15);
  -[VUIConcurrentEvaluator _insertFetcher:getter:forKey:](v15, "_insertFetcher:getter:forKey:", v14, v11, v7);
  -[VUIConcurrentEvaluator _scheduleFetchRelayed:](v15, "_scheduleFetchRelayed:", 0);
  objc_sync_exit(v15);

  objc_destroyWeak(&v23);
  _Block_object_dispose(v24, 8);

  objc_destroyWeak(&location);
}

id __52__VUIConcurrentEvaluator_addEvaluationBlock_forKey___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

intptr_t __52__VUIConcurrentEvaluator_addEvaluationBlock_forKey___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)objectForKey:(id)a3
{
  id v4;
  VUIConcurrentEvaluator *v5;
  void (**v6)(_QWORD);
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[VUIConcurrentEvaluator _getterForKey:](v5, "_getterForKey:", v4);
  v6 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  if (v6)
  {
    v6[2](v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_insertFetcher:(id)a3 getter:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *fetchers;
  void *v12;
  NSMutableArray *orderedKeys;
  NSMutableArray *v14;
  NSMutableArray *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *getters;
  void *v18;
  id aBlock;

  aBlock = a3;
  v8 = a4;
  v9 = a5;
  if (!self->_fetchers)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    fetchers = self->_fetchers;
    self->_fetchers = v10;

  }
  v12 = _Block_copy(aBlock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fetchers, "setObject:forKeyedSubscript:", v12, v9);

  orderedKeys = self->_orderedKeys;
  if (!orderedKeys)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v15 = self->_orderedKeys;
    self->_orderedKeys = v14;

    orderedKeys = self->_orderedKeys;
  }
  -[NSMutableArray removeObject:](orderedKeys, "removeObject:", v9);
  -[NSMutableArray addObject:](self->_orderedKeys, "addObject:", v9);
  if (!self->_getters)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v16 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    getters = self->_getters;
    self->_getters = v16;

  }
  v18 = _Block_copy(v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_getters, "setObject:forKeyedSubscript:", v18, v9);

}

- (id)_removeFetcherForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[NSMutableArray firstObject](self->_orderedKeys, "firstObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v7 = 0;
      goto LABEL_5;
    }
  }
  -[NSMutableArray removeObject:](self->_orderedKeys, "removeObject:", v6);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_fetchers, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_fetchers, "removeObjectForKey:", v6);
LABEL_5:
  v8 = _Block_copy(v7);

  return v8;
}

- (id)_getterForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[VUIConcurrentEvaluator _removeFetcherForKey:](self, "_removeFetcherForKey:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_getters, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_scheduleFetchRelayed:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int64_t activeFetchCount;
  int64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v3 = a3;
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __48__VUIConcurrentEvaluator__scheduleFetchRelayed___block_invoke;
  v12 = &unk_1E9F99C98;
  objc_copyWeak(&v13, &location);
  v5 = _Block_copy(&v9);
  if (v3)
    --self->_activeFetchCount;
  if (-[NSMutableArray count](self->_orderedKeys, "count", v9, v10, v11, v12))
  {
    activeFetchCount = self->_activeFetchCount;
    if (!activeFetchCount)
    {
      v7 = 1;
      goto LABEL_9;
    }
    if (activeFetchCount < -[VUIConcurrentEvaluator concurrencyCount](self, "concurrencyCount")
      && !self->_numberOfSchedulingLocksAcquired)
    {
      v7 = self->_activeFetchCount + 1;
LABEL_9:
      self->_activeFetchCount = v7;
      -[VUIConcurrentEvaluator queue](self, "queue");
      v8 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v8, v5);

    }
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __48__VUIConcurrentEvaluator__scheduleFetchRelayed___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t *WeakRetained;
  dispatch_semaphore_t *v2;
  void (**v3)(_QWORD);
  dispatch_semaphore_t *v4;
  dispatch_semaphore_t *v5;

  WeakRetained = (dispatch_semaphore_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    dispatch_semaphore_wait(WeakRetained[6], 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_signal(v5[6]);
    v2 = v5;
    objc_sync_enter(v2);
    -[dispatch_semaphore_t _removeFetcherForKey:](v2, "_removeFetcherForKey:", 0);
    v3 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    -[dispatch_semaphore_t _scheduleFetchRelayed:](v2, "_scheduleFetchRelayed:", 0);
    objc_sync_exit(v2);

    if (v3)
      v3[2](v3);
    v4 = v2;
    objc_sync_enter(v4);
    -[dispatch_semaphore_t _scheduleFetchRelayed:](v4, "_scheduleFetchRelayed:", 1);
    objc_sync_exit(v4);

    WeakRetained = v5;
  }

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int64_t)concurrencyCount
{
  return self->_concurrencyCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_schedulingLock, 0);
  objc_storeStrong((id *)&self->_getters, 0);
  objc_storeStrong((id *)&self->_fetchers, 0);
  objc_storeStrong((id *)&self->_orderedKeys, 0);
}

@end
