@implementation PFCoalescerContext

- (PFCoalescerContext)initWithCoalescer:(id)a3
{
  id v4;
  PFCoalescerContext *v5;
  PFCoalescerContext *v6;
  dispatch_group_t v7;
  void *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PFCoalescerContext;
  v5 = -[PFCoalescerContext init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PFCoalescerContext setCoalescer:](v5, "setCoalescer:", v4);
    v7 = dispatch_group_create();
    -[PFCoalescerContext setGroup:](v6, "setGroup:", v7);

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFCoalescerContext setPendingActivityTokens:](v6, "setPendingActivityTokens:", v8);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("PFCoalescer context isolation", v9);
    -[PFCoalescerContext setIsolationQueue:](v6, "setIsolationQueue:", v10);

  }
  return v6;
}

- (void)pushBack:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PFCoalescerContext coalescer](self, "coalescer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "update:", v6);

}

- (void)delayNextInvocationByTimeInterval:(double)a3
{
  void *v5;
  void *v6;
  dispatch_time_t v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("delayNextInvocationByTimeInterval %f"), *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFCoalescerContext activityTokenWithReason:](self, "activityTokenWithReason:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PFCoalescerContext_delayNextInvocationByTimeInterval___block_invoke;
  block[3] = &unk_1E6B772D0;
  v11 = v6;
  v9 = v6;
  dispatch_after(v7, v8, block);

}

- (id)activityToken
{
  return -[PFCoalescerContext activityTokenWithReason:](self, "activityTokenWithReason:", CFSTR("(unknown)"));
}

- (id)activityTokenWithReason:(id)a3
{
  id v4;
  PFCoalescerActivityToken *v5;
  NSObject *isolationQueue;
  PFCoalescerActivityToken *v7;
  PFCoalescerActivityToken *v8;
  PFCoalescerActivityToken *v9;
  _QWORD v11[5];
  PFCoalescerActivityToken *v12;

  v4 = a3;
  v5 = -[PFCoalescerActivityToken initWithDispatchGroup:reason:]([PFCoalescerActivityToken alloc], "initWithDispatchGroup:reason:", self->_group, v4);

  isolationQueue = self->_isolationQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__PFCoalescerContext_activityTokenWithReason___block_invoke;
  v11[3] = &unk_1E6B772F8;
  v11[4] = self;
  v7 = v5;
  v12 = v7;
  dispatch_sync(isolationQueue, v11);
  v8 = v12;
  v9 = v7;

  return v9;
}

- (void)cancelPendingActivityTokens
{
  NSObject *isolationQueue;
  _QWORD block[5];

  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PFCoalescerContext_cancelPendingActivityTokens__block_invoke;
  block[3] = &unk_1E6B772D0;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

- (NSArray)pendingActivityTokensSnapshot
{
  NSObject *isolationQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__PFCoalescerContext_pendingActivityTokensSnapshot__block_invoke;
  v5[3] = &unk_1E6B77320;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)notifyActivityTokenCompletionOnQueue:(id)a3 handler:(id)a4
{
  dispatch_group_notify((dispatch_group_t)self->_group, (dispatch_queue_t)a3, a4);
}

- (unint64_t)coalescedUpdatesCount
{
  return self->_coalescedUpdatesCount;
}

- (void)setCoalescedUpdatesCount:(unint64_t)a3
{
  self->_coalescedUpdatesCount = a3;
}

- (PFCoalescer)coalescer
{
  return (PFCoalescer *)objc_loadWeakRetained((id *)&self->_coalescer);
}

- (void)setCoalescer:(id)a3
{
  objc_storeWeak((id *)&self->_coalescer, a3);
}

- (OS_dispatch_queue)isolationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIsolationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_group)group
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 32, 1);
}

- (void)setGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSHashTable)pendingActivityTokens
{
  return (NSHashTable *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPendingActivityTokens:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingActivityTokens, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_destroyWeak((id *)&self->_coalescer);
}

void __51__PFCoalescerContext_pendingActivityTokensSnapshot__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __49__PFCoalescerContext_cancelPendingActivityTokens__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "endActivity", (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
}

uint64_t __46__PFCoalescerContext_activityTokenWithReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __56__PFCoalescerContext_delayNextInvocationByTimeInterval___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endActivity");
}

@end
