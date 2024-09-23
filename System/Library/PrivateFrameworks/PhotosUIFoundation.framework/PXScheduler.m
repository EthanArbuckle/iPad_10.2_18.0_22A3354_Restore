@implementation PXScheduler

void __30__PXScheduler_sharedScheduler__block_invoke()
{
  PXScheduler *v0;
  void *v1;

  v0 = objc_alloc_init(PXScheduler);
  v1 = (void *)sharedScheduler_scheduler;
  sharedScheduler_scheduler = (uint64_t)v0;

}

- (PXScheduler)init
{
  PXScheduler *v2;
  NSMutableArray *v3;
  NSMutableArray *pendingBlocks;
  NSMutableArray *v5;
  NSMutableArray *performWhenNotAnimatingPendingBlocks;
  uint64_t v7;
  NSHashTable *activeAnimations;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXScheduler;
  v2 = -[PXScheduler init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    pendingBlocks = v2->_pendingBlocks;
    v2->_pendingBlocks = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    performWhenNotAnimatingPendingBlocks = v2->_performWhenNotAnimatingPendingBlocks;
    v2->_performWhenNotAnimatingPendingBlocks = v5;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    activeAnimations = v2->_activeAnimations;
    v2->_activeAnimations = (NSHashTable *)v7;

  }
  return v2;
}

+ (PXScheduler)sharedScheduler
{
  if (sharedScheduler_onceToken != -1)
    dispatch_once(&sharedScheduler_onceToken, &__block_literal_global_7181);
  return (PXScheduler *)(id)sharedScheduler_scheduler;
}

- (void)_performPendingBlocksIfNeeded
{
  if (-[NSMutableArray count](self->_pendingBlocks, "count"))
  {
    if (!self->_isPerformingPendingBlocks)
      -[PXScheduler _performPendingBlocks](self, "_performPendingBlocks");
  }
}

- (void)dispatchOnMainThreadWhenNotScrollingAfterDelay:(double)a3 block:(id)a4
{
  id v6;
  dispatch_time_t v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __68__PXScheduler_dispatchOnMainThreadWhenNotScrollingAfterDelay_block___block_invoke;
  v9[3] = &unk_2514D0C98;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_after(v7, MEMORY[0x24BDAC9B8], v9);

}

- (void)dispatchInMainTransaction:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__PXScheduler_dispatchInMainTransaction___block_invoke;
  v6[3] = &unk_2514D0C98;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  px_dispatch_on_main_queue(v6);

}

- (void)dispatchInMainTransactionAfterDelay:(double)a3 block:(id)a4
{
  id v6;
  dispatch_time_t v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__PXScheduler_dispatchInMainTransactionAfterDelay_block___block_invoke;
  v9[3] = &unk_2514D0C98;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_after(v7, MEMORY[0x24BDAC9B8], v9);

}

- (void)_enteredDefaultRunLoopMode
{
  self->_hasPendingPerformInDefaultRunLoopMode = 0;
  -[PXScheduler _performPendingBlocksIfNeeded](self, "_performPendingBlocksIfNeeded");
}

- (void)_performPendingBlocks
{
  BOOL isPerformingPendingBlocks;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  isPerformingPendingBlocks = self->_isPerformingPendingBlocks;
  self->_isPerformingPendingBlocks = 1;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_pendingBlocks;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[NSMutableArray removeAllObjects](self->_pendingBlocks, "removeAllObjects", (_QWORD)v9);
  self->_isPerformingPendingBlocks = isPerformingPendingBlocks;
}

- (void)dispatchOnMainThreadWhenNotScrolling:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v4 = _Block_copy(a3);
  v6[0] = *MEMORY[0x24BDBCA90];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXScheduler performSelectorOnMainThread:withObject:waitUntilDone:modes:](self, "performSelectorOnMainThread:withObject:waitUntilDone:modes:", sel__performBlock_, v4, 0, v5);

}

- (void)_performBlock:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (void)dispatchGraduallyOnMainThreadWhenNotAnimating:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__PXScheduler_dispatchGraduallyOnMainThreadWhenNotAnimating___block_invoke;
  v6[3] = &unk_2514D0C98;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  px_dispatch_on_main_queue(v6);

}

- (id)startTrackedAnimationWithLabel:(id)a3
{
  id v4;
  PXSchedulerTrackedAnimation *v5;

  v4 = a3;
  v5 = -[PXSchedulerTrackedAnimation initWithScheduler:label:]([PXSchedulerTrackedAnimation alloc], "initWithScheduler:label:", self, v4);

  -[NSHashTable addObject:](self->_activeAnimations, "addObject:", v5);
  return v5;
}

- (void)endTrackedAnimation:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__PXScheduler_endTrackedAnimation___block_invoke;
  v6[3] = &unk_2514D0CC0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  px_dispatch_on_main_queue(v6);

}

- (void)schedulePerformPendingBlocksAfterAnimation
{
  uint64_t v2;
  _QWORD v3[5];

  if (!self->_hasPendingPerformInDefaultRunLoopModeForAnimationTracking)
  {
    v2 = MEMORY[0x24BDAC760];
    self->_hasPendingPerformInDefaultRunLoopModeForAnimationTracking = 1;
    v3[0] = v2;
    v3[1] = 3221225472;
    v3[2] = __57__PXScheduler_schedulePerformPendingBlocksAfterAnimation__block_invoke;
    v3[3] = &unk_2514D11A8;
    v3[4] = self;
    px_perform_on_main_runloop(2, v3);
  }
}

- (void)performPendingBlocksAfterAnimationIfPossible
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *performWhenNotAnimatingPendingBlocks;
  void *v11;
  _OWORD v12[4];
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableArray count](self->_performWhenNotAnimatingPendingBlocks, "count"))
  {
    -[NSHashTable allObjects](self->_activeAnimations, "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "currentMode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDBCA90]);

      if ((v7 & 1) != 0)
      {
        memset(v12, 0, sizeof(v12));
        v8 = (void *)-[NSMutableArray copy](self->_performWhenNotAnimatingPendingBlocks, "copy", 0);
        if (objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v12, v13, 16))
        {
          v9 = **((_QWORD **)&v12[0] + 1);
          performWhenNotAnimatingPendingBlocks = self->_performWhenNotAnimatingPendingBlocks;
          v11 = _Block_copy(**((const void ***)&v12[0] + 1));
          -[NSMutableArray removeObject:](performWhenNotAnimatingPendingBlocks, "removeObject:", v11);

          (*(void (**)(uint64_t))(v9 + 16))(v9);
        }

        if (-[NSMutableArray count](self->_performWhenNotAnimatingPendingBlocks, "count"))
          -[PXScheduler schedulePerformPendingBlocksAfterAnimation](self, "schedulePerformPendingBlocksAfterAnimation");
      }
      else
      {
        -[PXScheduler schedulePerformPendingBlocksAfterAnimation](self, "schedulePerformPendingBlocksAfterAnimation");
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAnimations, 0);
  objc_storeStrong((id *)&self->_performWhenNotAnimatingPendingBlocks, 0);
  objc_storeStrong((id *)&self->_pendingBlocks, 0);
}

uint64_t __57__PXScheduler_schedulePerformPendingBlocksAfterAnimation__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __57__PXScheduler_schedulePerformPendingBlocksAfterAnimation__block_invoke_2;
  v3[3] = &unk_2514D11A8;
  v3[4] = v1;
  return objc_msgSend(v1, "dispatchOnMainThreadWhenNotScrollingAfterDelay:block:", v3, 0.05);
}

uint64_t __57__PXScheduler_schedulePerformPendingBlocksAfterAnimation__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 34) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "performPendingBlocksAfterAnimationIfPossible");
}

uint64_t __35__PXScheduler_endTrackedAnimation___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "schedulePerformPendingBlocksAfterAnimation");
}

uint64_t __61__PXScheduler_dispatchGraduallyOnMainThreadWhenNotAnimating___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = _Block_copy(*(const void **)(a1 + 40));
  objc_msgSend(v2, "addObject:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "schedulePerformPendingBlocksAfterAnimation");
}

uint64_t __68__PXScheduler_dispatchOnMainThreadWhenNotScrollingAfterDelay_block___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchOnMainThreadWhenNotScrolling:", *(_QWORD *)(a1 + 40));
}

uint64_t __57__PXScheduler_dispatchInMainTransactionAfterDelay_block___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchInMainTransaction:", *(_QWORD *)(a1 + 40));
}

void __41__PXScheduler_dispatchInMainTransaction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDBCA90];
  v5 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDBCA90]);

  if ((v5 & 1) != 0
    || *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33)
    || (objc_msgSend(MEMORY[0x24BDE57D8], "currentState") & 3) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v7 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(v6, "addObject:", v7);

    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) && (PFProcessIsLaunchedToExecuteTests() & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
      v8 = *(void **)(a1 + 32);
      v10[0] = v4;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "performSelector:withObject:afterDelay:inModes:", sel__enteredDefaultRunLoopMode, 0, v9, 0.0);

    }
  }
}

@end
