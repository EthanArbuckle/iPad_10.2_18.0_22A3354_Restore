@implementation UIViewInProcessAnimationManager

+ (id)sharedManager
{
  void *v5;
  _QWORD block[5];

  objc_opt_self();
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIViewInProcessAnimationManager.m"), 278, CFSTR("UIViewInProcessAnimationManager is not supported when Swift C2 is enabled"));

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__UIViewInProcessAnimationManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD82478 != -1)
    dispatch_once(&qword_1ECD82478, block);
  return (id)qword_1ECD82470;
}

- (void)scheduleAnimatorAdvancerToStart
{
  _UIViewInProcessAnimationManagerDriver **p_animatorAdvancer;
  UIViewInProcessAnimationManager *WeakRetained;
  UIViewInProcessAnimationManager *v5;
  UIViewInProcessAnimationManager *v6;

  p_animatorAdvancer = &self->_animatorAdvancer;
  if (!self->_animatorAdvancer)
  {
    WeakRetained = (UIViewInProcessAnimationManager *)objc_loadWeakRetained(&__externalAdvancer);
    v5 = WeakRetained;
    if (WeakRetained)
      v6 = WeakRetained;
    else
      v6 = self;
    objc_storeStrong((id *)p_animatorAdvancer, v6);

    self->_waitingForAnimatorAdvancerToStart = 1;
  }
}

- (void)performAfterTick:(id)a3
{
  NSMutableArray *postTickBlocks;
  void *v5;

  postTickBlocks = self->_postTickBlocks;
  v5 = _Block_copy(a3);
  -[NSMutableArray addObject:](postTickBlocks, "addObject:", v5);

  -[UIViewInProcessAnimationManager scheduleAnimatorAdvancerToStart](self, "scheduleAnimatorAdvancerToStart");
}

+ (void)_cancelPresentationModifierGroupRequest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  +[UIViewInProcessAnimationManager sharedManager](UIViewInProcessAnimationManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentTickThread");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIViewInProcessAnimationManager.m"), 931, CFSTR("%s may only be called while the current thread is processing an animation tick."), "+[UIViewInProcessAnimationManager _cancelPresentationModifierGroupRequest:]");

  }
  +[UIViewInProcessAnimationManager sharedManager](UIViewInProcessAnimationManager, "sharedManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_cancelPresentationModifierGroupRequest:", v5);

}

- (void)_cancelPresentationModifierGroupRequest:(id)a3
{
  --self->_presentationModifierRequestCount;
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_presentationModifierGroupRequestBlocks, "replaceObjectAtIndex:withObject:", objc_msgSend(a3, "unsignedIntegerValue"), &__block_literal_global_90_2);
}

+ (id)_requestPresentationModifierGroup:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v5 = a3;
  +[UIViewInProcessAnimationManager sharedManager](UIViewInProcessAnimationManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentTickThread");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIViewInProcessAnimationManager.m"), 916, CFSTR("%s may only be called while the current thread is processing an animation tick."), "+[UIViewInProcessAnimationManager _requestPresentationModifierGroup:]");

  }
  +[UIViewInProcessAnimationManager sharedManager](UIViewInProcessAnimationManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_requestPresentationModifierGroup:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (void)_dispatchAsyncOntoMainBeforeExit:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD block[4];
  id v13;

  v5 = a3;
  if (qword_1ECD82490 != -1)
    dispatch_once(&qword_1ECD82490, &__block_literal_global_93_5);
  +[UIViewInProcessAnimationManager sharedManager](UIViewInProcessAnimationManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentTickThread");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIViewInProcessAnimationManager.m"), 960, CFSTR("%s may only be called while the current thread is processing an animation tick."), "+[UIViewInProcessAnimationManager _dispatchAsyncOntoMainBeforeExit:]");

  }
  v9 = qword_1ECD82480;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__UIViewInProcessAnimationManager__dispatchAsyncOntoMainBeforeExit___block_invoke_2;
  block[3] = &unk_1E16B1BF8;
  v13 = v5;
  v11 = v5;
  dispatch_sync(v9, block);

}

- (NSThread)currentTickThread
{
  return (NSThread *)objc_loadWeakRetained((id *)&self->_currentTickThread);
}

- (id)_requestPresentationModifierGroup:(id)a3
{
  void *v4;
  NSMutableArray *presentationModifierGroupRequestBlocks;
  id v6;
  void *v7;
  NSMutableArray *v8;
  void *v9;

  ++self->_presentationModifierRequestCount;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  presentationModifierGroupRequestBlocks = self->_presentationModifierGroupRequestBlocks;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[NSMutableArray count](presentationModifierGroupRequestBlocks, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_presentationModifierGroupRequestBlocks;
  v9 = _Block_copy(v6);

  -[NSMutableArray addObject:](v8, "addObject:", v9);
  return v7;
}

void __69__UIViewInProcessAnimationManager__processPostTicksDelayIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 240);
  *(_QWORD *)(v1 + 240) = 0;

}

- (void)_performWhenInProcessAnimationsTransactionCommits:(id)a3
{
  NSMutableArray *preCommitBlocks;
  void *v5;
  _UIAppCACommitFuture **p_caCommitFuture;
  id WeakRetained;
  void *v8;
  void *v9;
  _QWORD aBlock[5];

  preCommitBlocks = self->_preCommitBlocks;
  v5 = _Block_copy(a3);
  -[NSMutableArray addObject:](preCommitBlocks, "addObject:", v5);

  if (!self->_processingPreCommits)
  {
    p_caCommitFuture = &self->_caCommitFuture;
    WeakRetained = objc_loadWeakRetained((id *)&self->_caCommitFuture);

    if (!WeakRetained)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __85__UIViewInProcessAnimationManager__performWhenInProcessAnimationsTransactionCommits___block_invoke;
      aBlock[3] = &unk_1E16B1B28;
      aBlock[4] = self;
      v8 = _Block_copy(aBlock);
      if (objc_msgSend(MEMORY[0x1E0CD28B0], "currentPhase") == -1)
        +[_UIAppCACommitFuture scheduledPreCommitFuture:](_UIAppCACommitFuture, "scheduledPreCommitFuture:", v8);
      else
        +[_UIAppCACommitFuture scheduledPostCommitFuture:](_UIAppCACommitFuture, "scheduledPostCommitFuture:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)p_caCommitFuture, v9);

    }
  }
}

void __68__UIViewInProcessAnimationManager__dispatchAsyncOntoMainBeforeExit___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)qword_1ECD82488;
  v2 = _Block_copy(*(const void **)(a1 + 32));
  objc_msgSend(v1, "addObject:", v2);

  if ((_MergedGlobals_1319 & 1) == 0)
  {
    +[UIViewInProcessAnimationManager sharedManager](UIViewInProcessAnimationManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "performBeforeExiting:", &__block_literal_global_95_2);

    _MergedGlobals_1319 = 1;
  }
}

- (void)performBeforeExiting:(id)a3
{
  NSMutableArray *preExitBlocks;
  id v4;

  preExitBlocks = self->_preExitBlocks;
  v4 = _Block_copy(a3);
  -[NSMutableArray addObject:](preExitBlocks, "addObject:", v4);

}

void __82__UIViewInProcessAnimationManager__performTick_cancel_force_eventName_entry_exit___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  _BOOL8 v9;
  id v10;
  _BYTE *v11;
  uint64_t v12;
  void *v13;
  char v14;

  v2 = (void *)MEMORY[0x186DC9484]();
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCurrentTickThread:", v3);

  objc_msgSend(*(id *)(a1 + 32), "currentTickThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMainThread");

  if ((v5 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
  v6 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v6 + 276) || *(_BYTE *)(a1 + 64) || *(_BYTE *)(v6 + 277))
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      (*(void (**)(void))(v7 + 16))();
      v6 = *(_QWORD *)(a1 + 32);
    }
    v8 = *(double *)(a1 + 56);
    if (v8 <= 0.0
      || (*(double *)(v6 + 168) = v8 - *(double *)(v6 + 160), v6 = *(_QWORD *)(a1 + 32), *(double *)(v6 + 168) <= 0.0))
    {
      *(_QWORD *)(v6 + 168) = 0;
    }
    else
    {
      *(_QWORD *)(v6 + 160) = *(_QWORD *)(a1 + 56);
    }
    v9 = 1;
    kdebug_trace();
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = *(_BYTE **)(a1 + 32);
    if (!*(_BYTE *)(a1 + 65))
      v9 = v11[277] != 0;
    objc_msgSend(v11, "_processEntriesCollectingEntriesToRemove:cancel:", v10, v9);
    objc_msgSend(*(id *)(a1 + 32), "_processPostTicksDelayIfNecessary:", *(double *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "_processPostTicks");
    objc_msgSend(*(id *)(a1 + 32), "_processPresentationModifierRequestsAndFlush");
    objc_msgSend(*(id *)(a1 + 32), "_processTickExitRemovingEntries:", v10);
    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
      (*(void (**)(void))(v12 + 16))();

  }
  else
  {
    kdebug_trace();
  }
  objc_msgSend(*(id *)(a1 + 32), "currentTickThread");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isMainThread");

  if ((v14 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  objc_msgSend(*(id *)(a1 + 32), "setCurrentTickThread:", 0);
  objc_autoreleasePoolPop(v2);
}

- (void)setCurrentTickThread:(id)a3
{
  objc_storeWeak((id *)&self->_currentTickThread, a3);
}

- (void)_processPostTicksDelayIfNecessary:(double)a3
{
  double v5;
  double v6;
  double v7;
  dispatch_time_t v8;
  NSObject *tickPrepQueue;
  _QWORD block[5];

  if (pthread_main_np() != 1)
  {
    v5 = CACurrentMediaTime() - a3;
    -[UIViewInProcessAnimationManager refreshInterval](self, "refreshInterval");
    if (v5 < v6 * 0.4)
    {
      -[UIViewInProcessAnimationManager refreshInterval](self, "refreshInterval");
      v8 = dispatch_time(0, (uint64_t)((v7 * 0.4 - v5) * 1000000000.0));
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_postTicksDelaySemaphore, v8);
      tickPrepQueue = self->_tickPrepQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__UIViewInProcessAnimationManager__processPostTicksDelayIfNecessary___block_invoke;
      block[3] = &unk_1E16B1B28;
      block[4] = self;
      dispatch_sync(tickPrepQueue, block);
    }
  }
}

- (double)refreshInterval
{
  double result;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;

  result = self->_refreshInterval;
  if (result == 0.0)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "maximumFramesPerSecond");
    v6 = 60;
    if (v5)
      v6 = v5;
    v7 = (double)v6 * 1.001;

    result = 1.0 / v7;
    self->_refreshInterval = 1.0 / v7;
  }
  return result;
}

- (void)_processTickExitRemovingEntries:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  NSMutableArray *preExitBlocks;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *entryLockingQueue;
  id v15;
  _QWORD block[4];
  id v17;
  UIViewInProcessAnimationManager *v18;
  _QWORD *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  kdebug_trace();
  v5 = 0;
  while (-[NSMutableArray count](self->_preExitBlocks, "count"))
  {
    v6 = -[NSMutableArray count](self->_preExitBlocks, "count");
    v7 = self->_preExitBlocks;
    v8 = (NSMutableArray *)objc_opt_new();
    preExitBlocks = self->_preExitBlocks;
    self->_preExitBlocks = v8;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v7;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v21;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v10);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13++) + 16))();
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v11);
    }

    v5 += v6;
  }
  entryLockingQueue = self->_entryLockingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__UIViewInProcessAnimationManager__processTickExitRemovingEntries___block_invoke;
  block[3] = &unk_1E16B9698;
  v19 = v24;
  v15 = v4;
  v17 = v15;
  v18 = self;
  dispatch_sync(entryLockingQueue, block);
  kdebug_trace();

  _Block_object_dispose(v24, 8);
}

- (void)_processPostTicks
{
  uint64_t v3;
  uint64_t v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  NSMutableArray *postTickBlocks;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v3 = 0;
  while (-[NSMutableArray count](self->_postTickBlocks, "count"))
  {
    v4 = -[NSMutableArray count](self->_postTickBlocks, "count");
    v5 = self->_postTickBlocks;
    v6 = (NSMutableArray *)objc_opt_new();
    postTickBlocks = self->_postTickBlocks;
    self->_postTickBlocks = v6;

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = v5;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++) + 16))();
        }
        while (v10 != v12);
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }
    v3 += v4;

  }
  kdebug_trace();
}

- (void)_processEntriesCollectingEntriesToRemove:(id)a3 cancel:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *entryLockingQueue;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t (**v13)(_QWORD, _QWORD, double);
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD block[7];
  _QWORD v20[4];
  _QWORD v21[4];
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  kdebug_trace();
  entryLockingQueue = self->_entryLockingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__UIViewInProcessAnimationManager__processEntriesCollectingEntriesToRemove_cancel___block_invoke;
  block[3] = &unk_1E16C3488;
  block[4] = self;
  block[5] = v20;
  block[6] = v21;
  dispatch_sync(entryLockingQueue, block);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_entries;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "callback", (_QWORD)v15);
        v13 = (uint64_t (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
        v14 = v13[2](v13, v4, self->_deltaTime);

        if (v14)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
    }
    while (v9);
  }

  kdebug_trace();
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v21, 8);

}

- (void)_processPresentationModifierRequestsAndFlush
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSHashTable *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (self->_presentationModifierRequestCount)
  {
    kdebug_trace();
    objc_msgSend(MEMORY[0x1E0CD2810], "groupWithCapacity:", self->_presentationModifierRequestCount);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUpdatesAsynchronously:", 0);
    -[NSHashTable addObject:](self->_presentationGroups, "addObject:", v3);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = self->_presentationModifierGroupRequestBlocks;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v19;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(v4);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8++) + 16))();
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v6);
    }

    -[NSMutableArray removeAllObjects](self->_presentationModifierGroupRequestBlocks, "removeAllObjects");
    self->_presentationModifierRequestCount = 0;
    kdebug_trace();

  }
  if (-[NSHashTable count](self->_presentationGroups, "count"))
  {
    kdebug_trace();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = self->_presentationGroups;
    v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "flushWithTransaction", (_QWORD)v14);
        }
        while (v11 != v13);
        v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      }
      while (v11);
    }

    -[NSHashTable count](self->_presentationGroups, "count");
    kdebug_trace();
  }
}

void __68__UIViewInProcessAnimationManager__dispatchAsyncOntoMainBeforeExit___block_invoke_3()
{
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_96_2);
}

- (void)startAnimationAdvancerIfNeeded
{
  double v3;
  double v4;

  if (self->_waitingForAnimatorAdvancerToStart)
  {
    self->_waitingForAnimatorAdvancerToStart = 0;
    v3 = CACurrentMediaTime();
    -[UIViewInProcessAnimationManager refreshInterval](self, "refreshInterval");
    self->_time = v3 + v4 * -0.4;
    self->_deltaTime = 0.0;
    -[_UIViewInProcessAnimationManagerDriver startAdvancingAnimationManager:](self->_animatorAdvancer, "startAdvancingAnimationManager:", self);
  }
}

uint64_t __55__UIViewInProcessAnimationManager__commitSynchronously__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startAnimationAdvancerIfNeeded");
}

uint64_t __55__UIViewInProcessAnimationManager__commitSynchronously__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processPreCommitBlocks");
}

- (void)_processPreCommitBlocks
{
  self->_processingPreCommits = 1;
  kdebug_trace();
  -[UIViewInProcessAnimationManager _runPreCommitBlocks](self, "_runPreCommitBlocks");
  kdebug_trace();
  self->_processingPreCommits = 0;
}

- (void)startAdvancingAnimationManager:(id)a3
{
  id v5;
  unint64_t v6;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  NSObject *entryLockingQueue;
  uint64_t v11;
  unint64_t executionMode;
  id WeakRetained;
  dispatch_semaphore_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *displayLinkAccessQueue;
  _QWORD *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[7];
  _QWORD v24[5];
  id v25;
  uint8_t *v26;
  _QWORD *v27;
  _QWORD v28[7];
  _QWORD v29[5];
  NSObject *v30;
  _QWORD block[7];
  _QWORD v32[5];
  id v33;
  uint8_t buf[8];
  uint8_t *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  int v39;

  v5 = a3;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewInProcessAnimationManager.m"), 1026, CFSTR("Call must be made on main thread"));

  }
  v6 = startAdvancingAnimationManager____s_category;
  if (!startAdvancingAnimationManager____s_category)
  {
    v6 = __UILogCategoryGetNode("InProcessAnimation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v6, (unint64_t *)&startAdvancingAnimationManager____s_category);
  }
  v7 = *(id *)(v6 + 8);
  v8 = os_signpost_id_make_with_pointer(*(os_log_t *)(v6 + 8), self);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "AnimatorRunning", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
    }
  }

  -[UIViewInProcessAnimationManager refreshInterval](self, "refreshInterval");
  *(_QWORD *)buf = 0;
  v35 = buf;
  v36 = 0x3010000000;
  v37 = &unk_18685B0AF;
  v38 = 0;
  v39 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__232;
  v32[4] = __Block_byref_object_dispose__232;
  v33 = 0;
  entryLockingQueue = self->_entryLockingQueue;
  v11 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__UIViewInProcessAnimationManager_startAdvancingAnimationManager___block_invoke;
  block[3] = &unk_1E16C3488;
  block[4] = self;
  block[5] = buf;
  block[6] = v32;
  dispatch_sync(entryLockingQueue, block);
  executionMode = self->_executionMode;
  if (executionMode == 1)
  {
    displayLinkAccessQueue = self->_displayLinkAccessQueue;
    v23[0] = v11;
    v23[1] = 3221225472;
    v23[2] = __66__UIViewInProcessAnimationManager_startAdvancingAnimationManager___block_invoke_8;
    v23[3] = &unk_1E16D5E70;
    v23[4] = self;
    v23[5] = buf;
    v23[6] = v32;
    v20 = v23;
LABEL_15:
    dispatch_sync(displayLinkAccessQueue, v20);
    goto LABEL_17;
  }
  if (!executionMode)
  {
    if (!-[UIViewInProcessAnimationManager _shouldKeepAnimationThreadAlive](self, "_shouldKeepAnimationThreadAlive"))
    {
      v21 = self->_displayLinkAccessQueue;
      v24[0] = v11;
      v24[1] = 3221225472;
      v24[2] = __66__UIViewInProcessAnimationManager_startAdvancingAnimationManager___block_invoke_6;
      v24[3] = &unk_1E16EA1A0;
      v24[4] = self;
      v25 = &__block_literal_global_104_2;
      v26 = buf;
      v27 = v32;
      dispatch_sync(v21, v24);

      goto LABEL_17;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_animationThread);

    if (!WeakRetained)
    {
      v14 = dispatch_semaphore_create(0);
      v15 = objc_alloc(MEMORY[0x1E0CB3978]);
      v29[0] = v11;
      v29[1] = 3221225472;
      v29[2] = __66__UIViewInProcessAnimationManager_startAdvancingAnimationManager___block_invoke_3;
      v29[3] = &unk_1E16B1B50;
      v29[4] = self;
      v16 = v14;
      v30 = v16;
      v17 = (void *)objc_msgSend(v15, "initWithBlock:", v29);
      v18 = objc_storeWeak((id *)&self->_animationThread, v17);
      __66__UIViewInProcessAnimationManager_startAdvancingAnimationManager___block_invoke_2((uint64_t)v18, v17);
      dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

    }
    displayLinkAccessQueue = self->_displayLinkAccessQueue;
    v28[0] = v11;
    v28[1] = 3221225472;
    v28[2] = __66__UIViewInProcessAnimationManager_startAdvancingAnimationManager___block_invoke_4;
    v28[3] = &unk_1E16D5E70;
    v28[4] = self;
    v28[5] = buf;
    v28[6] = v32;
    v20 = v28;
    goto LABEL_15;
  }
LABEL_17:
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(buf, 8);
}

- (BOOL)_shouldKeepAnimationThreadAlive
{
  return objc_msgSend((id)UIApp, "_isSpringBoard");
}

- (unint64_t)_runPreCommitBlocks
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  NSMutableArray *preCommitBlocks;
  unint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = self->_preCommitBlocks;
  v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  preCommitBlocks = self->_preCommitBlocks;
  self->_preCommitBlocks = v4;

  v6 = -[NSMutableArray count](v3, "count");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v3;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11));
        if (-[NSMutableArray count](self->_preCommitBlocks, "count", (_QWORD)v13))
          v6 += -[UIViewInProcessAnimationManager _runPreCommitBlocks](self, "_runPreCommitBlocks");
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  return v6;
}

- (void)addEntry:(id)a3
{
  id v4;
  NSObject *entryLockingQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  entryLockingQueue = self->_entryLockingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__UIViewInProcessAnimationManager_addEntry___block_invoke;
  block[3] = &unk_1E16B1B50;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(entryLockingQueue, block);

}

void __68__UIViewInProcessAnimationManager__dispatchAsyncOntoMainBeforeExit___block_invoke_4()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _QWORD block[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__232;
  v13 = __Block_byref_object_dispose__232;
  v14 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__UIViewInProcessAnimationManager__dispatchAsyncOntoMainBeforeExit___block_invoke_97;
  block[3] = &unk_1E16B14C0;
  block[4] = &v9;
  dispatch_sync((dispatch_queue_t)qword_1ECD82480, block);
  v6 = 0u;
  v7 = 0u;
  v4 = 0u;
  v5 = 0u;
  v0 = (id)v10[5];
  v1 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v4, v15, 16);
  if (v1)
  {
    v2 = *(_QWORD *)v5;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v5 != v2)
          objc_enumerationMutation(v0);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v4 + 1) + 8 * v3) + 16))(*(_QWORD *)(*((_QWORD *)&v4 + 1) + 8 * v3));
        ++v3;
      }
      while (v1 != v3);
      v1 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v4, v15, 16);
    }
    while (v1);
  }

  _Block_object_dispose(&v9, 8);
}

uint64_t __83__UIViewInProcessAnimationManager__processEntriesCollectingEntriesToRemove_cancel___block_invoke(_QWORD *a1)
{
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 24), "count");
  objc_msgSend(*(id *)(a1[4] + 16), "addObjectsFromArray:", *(_QWORD *)(a1[4] + 24));
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 16), "count");
  return objc_msgSend(*(id *)(a1[4] + 24), "removeAllObjects");
}

void __67__UIViewInProcessAnimationManager__processTickExitRemovingEntries___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  float v6;
  float v7;
  float v8;
  uint64_t i;
  void *v10;
  float minimum;
  float maximum;
  float preferred;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned __int8 *v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[5];
  int v40;
  int v41;
  int v42;
  _QWORD block[5];
  id v44;
  int v45;
  int v46;
  int v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;
  CAFrameRateRange v54;
  CAFrameRateRange v55;

  v53 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "count");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeObjectsInArray:", *(_QWORD *)(a1 + 32));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v50 = 0u;
    v51 = 0u;
    v49 = 0u;
    v48 = 0u;
    v2 = *(id *)(a1 + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v49;
      v6 = *MEMORY[0x1E0CD23C0];
      v7 = *(float *)(MEMORY[0x1E0CD23C0] + 4);
      v8 = *(float *)(MEMORY[0x1E0CD23C0] + 8);
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v49 != v5)
            objc_enumerationMutation(v2);
          v10 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          objc_msgSend(v10, "preferredFrameRateRange");
          minimum = v54.minimum;
          maximum = v54.maximum;
          preferred = v54.preferred;
          v55.minimum = v6;
          v55.maximum = v7;
          v55.preferred = v8;
          if (!CAFrameRateRangeIsEqualToRange(v54, v55))
          {
            v15 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
            *(float *)&v14 = minimum;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "removeObject:", v16);

            v17 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
            *(float *)&v18 = maximum;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "removeObject:", v19);

            v20 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
            *(float *)&v21 = preferred;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "removeObject:", v22);

            v23 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v10, "updateReason"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "removeObject:", v24);

            if ((objc_msgSend(v10, "allowsVFD") & 1) == 0)
              --*(_QWORD *)(*(_QWORD *)(a1 + 40) + 88);
            *(_BYTE *)(*(_QWORD *)(a1 + 40) + 320) &= ~1u;
            *(_BYTE *)(*(_QWORD *)(a1 + 40) + 320) &= ~2u;
          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      }
      while (v4);
    }

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "count")
    || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "count"))
  {
    v25 = *(unsigned __int8 **)(a1 + 40);
    if ((~v25[320] & 3) != 0)
    {
      objc_msgSend(v25, "preferredFrameRateRange");
      v27 = v26;
      v29 = v28;
      v31 = v30;
      objc_msgSend(*(id *)(a1 + 40), "updateReasonArray");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *(_QWORD *)(a1 + 40);
      v34 = *(NSObject **)(v33 + 216);
      v35 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__UIViewInProcessAnimationManager__processTickExitRemovingEntries___block_invoke_2;
      block[3] = &unk_1E16EA110;
      v45 = v27;
      v46 = v29;
      v47 = v31;
      block[4] = v33;
      v44 = v32;
      v36 = v32;
      dispatch_sync(v34, block);
      v39[0] = v35;
      v39[1] = 3221225472;
      v39[2] = __67__UIViewInProcessAnimationManager__processTickExitRemovingEntries___block_invoke_3;
      v39[3] = &unk_1E16D6650;
      v39[4] = *(_QWORD *)(a1 + 40);
      v40 = v27;
      v41 = v29;
      v42 = v31;
      dispatch_async(MEMORY[0x1E0C80D38], v39);

    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 296), "removeAllObjects");
    v37 = *(_QWORD *)(a1 + 40);
    if (!*(_BYTE *)(v37 + 249))
    {
      objc_msgSend(*(id *)(v37 + 152), "finishAdvancingAnimationManager");
      v37 = *(_QWORD *)(a1 + 40);
    }
    v38 = *(void **)(v37 + 152);
    *(_QWORD *)(v37 + 152) = 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 249) = 0;
    objc_msgSend(*(id *)(a1 + 40), "_setAnimationExecutionParameters");
  }
}

uint64_t __44__UIViewInProcessAnimationManager_addEntry___block_invoke(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  CAFrameRateRange v17;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "preferredFrameRateRange");
  minimum = v17.minimum;
  maximum = v17.maximum;
  preferred = v17.preferred;
  if (!CAFrameRateRangeIsEqualToRange(v17, *MEMORY[0x1E0CD23C0]))
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    *(float *)&v5 = minimum;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    *(float *)&v9 = maximum;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);

    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    *(float *)&v12 = preferred;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v13);

    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "updateReason"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v15);

    if ((objc_msgSend(*(id *)(a1 + 40), "allowsVFD") & 1) == 0)
      ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 320) &= ~1u;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 320) &= ~2u;
  }
  return objc_msgSend(*(id *)(a1 + 32), "scheduleAnimatorAdvancerToStart");
}

- (CAFrameRateRange)preferredFrameRateRange
{
  unint64_t numberOfEntriesNotAllowingVFD;
  int v4;
  float preferred;
  float v6;
  float minimum;
  float maximum;
  CAFrameRateRange result;

  if ((*(_BYTE *)&self->_clean & 1) != 0)
  {
    preferred = self->_preferredFrameRateRange.preferred;
  }
  else
  {
    numberOfEntriesNotAllowingVFD = self->_numberOfEntriesNotAllowingVFD;
    v4 = UIViewInProcessAnimationManagerPreferredFrameRateRangeComponent(self->_minimumFrameRates);
    if (numberOfEntriesNotAllowingVFD)
    {
      self->_preferredFrameRateRange.minimum = (float)v4;
      self->_preferredFrameRateRange.maximum = (float)(int)UIViewInProcessAnimationManagerPreferredFrameRateRangeComponent(self->_maximumFrameRates);
      preferred = (float)(int)UIViewInProcessAnimationManagerPreferredFrameRateRangeComponent(self->_preferredFrameRates);
    }
    else
    {
      v6 = fmin((double)v4, 48.0);
      self->_preferredFrameRateRange.minimum = v6;
      self->_preferredFrameRateRange.maximum = (float)(int)UIViewInProcessAnimationManagerPreferredFrameRateRangeComponent(self->_maximumFrameRates);
      preferred = 0.0;
    }
    self->_preferredFrameRateRange.preferred = preferred;
    *(_BYTE *)&self->_clean |= 1u;
  }
  minimum = self->_preferredFrameRateRange.minimum;
  maximum = self->_preferredFrameRateRange.maximum;
  result.preferred = preferred;
  result.maximum = maximum;
  result.minimum = minimum;
  return result;
}

- (_UIViewInProcessAnimationReasonArray)updateReasonArray
{
  _UIViewInProcessAnimationReasonArray *v3;
  _UIViewInProcessAnimationReasonArray *updateReasonArray;

  if ((*(_BYTE *)&self->_clean & 2) == 0)
  {
    v3 = -[_UIViewInProcessAnimationReasonArray initWithSet:]([_UIViewInProcessAnimationReasonArray alloc], "initWithSet:", self->_updateReasons);
    updateReasonArray = self->_updateReasonArray;
    self->_updateReasonArray = v3;

    *(_BYTE *)&self->_clean |= 2u;
  }
  return self->_updateReasonArray;
}

- (void)_setAnimationExecutionParameters
{
  self->_executionMode = self->_usesMainThreadExecution;
}

- (void)finishAdvancingAnimationManager
{
  unint64_t v3;
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  NSObject *displayLinkAccessQueue;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = finishAdvancingAnimationManager___s_category;
  if (!finishAdvancingAnimationManager___s_category)
  {
    v3 = __UILogCategoryGetNode("InProcessAnimation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&finishAdvancingAnimationManager___s_category);
  }
  v4 = *(id *)(v3 + 8);
  v5 = os_signpost_id_make_with_pointer(*(os_log_t *)(v3 + 8), self);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v4, OS_SIGNPOST_INTERVAL_END, v6, "AnimatorRunning", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
    }
  }

  displayLinkAccessQueue = self->_displayLinkAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__UIViewInProcessAnimationManager_finishAdvancingAnimationManager__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_sync(displayLinkAccessQueue, block);
}

void __50__UIViewInProcessAnimationManager__prepareForTick__block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_semaphore_t v3;
  uint64_t v4;
  void *v5;

  if (pthread_main_np() == 1)
  {
    v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 240);
    if (v2)
      dispatch_semaphore_signal(v2);
  }
  else
  {
    v3 = dispatch_semaphore_create(0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 240);
    *(_QWORD *)(v4 + 240) = v3;

  }
}

uint64_t __85__UIViewInProcessAnimationManager__performWhenInProcessAnimationsTransactionCommits___block_invoke(uint64_t a1)
{
  kdebug_trace();
  return objc_msgSend(*(id *)(a1 + 32), "_commitSynchronously");
}

- (void)_commitSynchronously
{
  BOOL v3;
  double v4;
  double time;
  double v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v3 = -[UIViewInProcessAnimationManager advancingOnCommitDisabled](self, "advancingOnCommitDisabled");
  v4 = 0.0;
  if (!v3)
  {
    time = self->_time;
    -[UIViewInProcessAnimationManager refreshInterval](self, "refreshInterval", 0.0);
    v4 = time + v6 * 0.25;
  }
  v7[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__UIViewInProcessAnimationManager__commitSynchronously__block_invoke;
  v8[3] = &unk_1E16B1B28;
  v8[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__UIViewInProcessAnimationManager__commitSynchronously__block_invoke_2;
  v7[3] = &unk_1E16B1B28;
  -[UIViewInProcessAnimationManager _performTick:cancel:force:eventName:entry:exit:](self, "_performTick:cancel:force:eventName:entry:exit:", 0, 1, CFSTR("commit"), v8, v7, v4);
}

- (void)_displayLinkFire:(id)a3
{
  id v4;
  NSObject *displayLinkAccessQueue;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  displayLinkAccessQueue = self->_displayLinkAccessQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__UIViewInProcessAnimationManager__displayLinkFire___block_invoke;
  v6[3] = &unk_1E16BC3A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(displayLinkAccessQueue, v6);
  if (!*((_BYTE *)v8 + 24))
  {
    kdebug_trace();
    objc_msgSend(v4, "timestamp");
    -[UIViewInProcessAnimationManager _advanceWithTime:](self, "_advanceWithTime:");
  }
  _Block_object_dispose(&v7, 8);

}

- (void)_performTick:(double)a3 cancel:(BOOL)a4 force:(BOOL)a5 eventName:(id)a6 entry:(id)a7 exit:(id)a8
{
  id v13;
  id v14;
  NSObject *tickQueue;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  double v21;
  BOOL v22;
  BOOL v23;

  v13 = a7;
  v14 = a8;
  kdebug_trace();
  -[UIViewInProcessAnimationManager _prepareForTick](self, "_prepareForTick");
  tickQueue = self->_tickQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__UIViewInProcessAnimationManager__performTick_cancel_force_eventName_entry_exit___block_invoke;
  block[3] = &unk_1E16EA138;
  v22 = a5;
  block[4] = self;
  v19 = v13;
  v21 = a3;
  v23 = a4;
  v20 = v14;
  v16 = v14;
  v17 = v13;
  dispatch_sync(tickQueue, block);

}

- (void)_prepareForTick
{
  NSObject *tickPrepQueue;
  _QWORD block[5];

  tickPrepQueue = self->_tickPrepQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__UIViewInProcessAnimationManager__prepareForTick__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_sync(tickPrepQueue, block);
}

- (void)_advanceWithTime:(double)a3
{
  -[UIViewInProcessAnimationManager _performTick:cancel:force:eventName:entry:exit:](self, "_performTick:cancel:force:eventName:entry:exit:", 0, 0, CFSTR("advance"), 0, 0, a3);
}

- (BOOL)advancingOnCommitDisabled
{
  return self->_advancingOnCommitDisabled;
}

void __52__UIViewInProcessAnimationManager__displayLinkFire___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 279))
  {
    objc_msgSend(*(id *)(v1 + 264), "invalidate");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 264);
    *(_QWORD *)(v3 + 264) = 0;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__UIViewInProcessAnimationManager__displayLinkFire___block_invoke_2;
    block[3] = &unk_1E16B1B28;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __67__UIViewInProcessAnimationManager__processTickExitRemovingEntries___block_invoke_3(uint64_t a1)
{
  int32x2_t *v1;
  float32x2_t v2;

  v1 = *(int32x2_t **)(a1 + 32);
  v2 = *(float32x2_t *)(a1 + 44);
  v1[15].i32[1] = *(float *)(a1 + 40);
  v1[16] = vrev64_s32((int32x2_t)vcvt_u32_f32(v2));
  return _UIUpdateRequestRegistryMutableRequestChanged((uint64_t)&mainRegistry, (_BYTE *)(*(_QWORD *)(a1 + 32) + 120));
}

uint64_t __67__UIViewInProcessAnimationManager__processTickExitRemovingEntries___block_invoke_2(uint64_t a1, double a2, double a3, double a4)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  LODWORD(a3) = *(_DWORD *)(a1 + 52);
  LODWORD(a4) = *(_DWORD *)(a1 + 56);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "setPreferredFrameRateRange:", a2, a3, a4);
  return +[_UIViewInProcessAnimationReasonArray applyReasons:toDisplayLink:](_UIViewInProcessAnimationReasonArray, "applyReasons:toDisplayLink:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264));
}

uint64_t __66__UIViewInProcessAnimationManager_startAdvancingAnimationManager___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addToRunLoop:forMode:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0C99860]);
}

uint64_t __66__UIViewInProcessAnimationManager_finishAdvancingAnimationManager__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 279) = 1;
  return result;
}

uint64_t __52__UIViewInProcessAnimationManager__displayLinkFire___block_invoke_2(uint64_t a1)
{
  return _UIUpdateRequestRegistryRemoveRecord((uint64_t)&mainRegistry, (_DWORD *)(*(_QWORD *)(a1 + 32) + 120), 0x100036u);
}

void __66__UIViewInProcessAnimationManager_startAdvancingAnimationManager___block_invoke(uint64_t a1)
{
  _DWORD *v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "preferredFrameRateRange");
  v2 = *(_DWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v2[8] = v3;
  v2[9] = v4;
  v2[10] = v5;
  objc_msgSend(*(id *)(a1 + 32), "updateReasonArray");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __66__UIViewInProcessAnimationManager_startAdvancingAnimationManager___block_invoke_4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id WeakRetained;
  id v7;
  id v8;
  _DWORD *v9;
  double v10;
  double v11;
  double v12;
  int32x2_t *v13;
  uint64_t v14;
  float32x2_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;

  *(_BYTE *)(a1[4] + 279) = 0;
  if (!*(_QWORD *)(a1[4] + 264))
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = a1[4];
    v4 = *(void **)(v3 + 264);
    *(_QWORD *)(v3 + 264) = v2;

    v5 = *(id *)(a1[4] + 264);
    WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 352));
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __66__UIViewInProcessAnimationManager_startAdvancingAnimationManager___block_invoke_5;
    v19 = &unk_1E16B1B50;
    v20 = v5;
    v21 = WeakRetained;
    v7 = WeakRetained;
    v8 = v5;
    objc_msgSend(v7, "performBlock:", &v16);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[4] + 360));
    v9 = *(_DWORD **)(a1[5] + 8);
    LODWORD(v10) = v9[8];
    LODWORD(v11) = v9[9];
    LODWORD(v12) = v9[10];
    objc_msgSend(*(id *)(a1[4] + 264), "setPreferredFrameRateRange:", v10, v11, v12, v16, v17, v18, v19);
    +[_UIViewInProcessAnimationReasonArray applyReasons:toDisplayLink:](_UIViewInProcessAnimationReasonArray, "applyReasons:toDisplayLink:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(a1[4] + 264));
    v13 = (int32x2_t *)a1[4];
    v14 = *(_QWORD *)(a1[5] + 8);
    v15 = *(float32x2_t *)(v14 + 36);
    v13[15].i32[1] = *(float *)(v14 + 32);
    v13[16] = vrev64_s32((int32x2_t)vcvt_u32_f32(v15));
    _UIUpdateRequestRegistryAddRecord((uint64_t)&mainRegistry, (int *)(a1[4] + 120), 0x100036u);

  }
}

void __66__UIViewInProcessAnimationManager_startAdvancingAnimationManager___block_invoke_3(uint64_t a1)
{
  void *v2;
  dispatch_semaphore_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  UIViewInProcessAnimationManagerSetFixedPriority();
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 352), v2);

  v3 = dispatch_semaphore_create(0);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 360);
  *(_QWORD *)(v4 + 360) = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  while (1)
  {
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "run");

    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 360), 0xFFFFFFFFFFFFFFFFLL);
  }
}

+ (void)_setExternalAnimationDriver:(id)a3
{
  objc_storeWeak(&__externalAdvancer, a3);
}

void __48__UIViewInProcessAnimationManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECD82470;
  qword_1ECD82470 = (uint64_t)v1;

}

- (UIViewInProcessAnimationManager)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  dispatch_queue_t v23;
  void *v24;
  dispatch_queue_t v25;
  void *v26;
  dispatch_queue_t v27;
  void *v28;
  dispatch_queue_t v29;
  void *v30;
  dispatch_queue_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)UIViewInProcessAnimationManager;
  v2 = -[UIViewInProcessAnimationManager init](&v39, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    v4 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v3;

    v5 = objc_opt_new();
    v6 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v5;

    v7 = objc_opt_new();
    v8 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v7;

    v9 = objc_opt_new();
    v10 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v9;

    v11 = objc_opt_new();
    v12 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v11;

    v13 = objc_opt_new();
    v14 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v13;

    v15 = objc_opt_new();
    v16 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v15;

    v17 = objc_opt_new();
    v18 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v17;

    v19 = objc_opt_new();
    v20 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = v19;

    v21 = objc_opt_new();
    v22 = (void *)*((_QWORD *)v2 + 10);
    *((_QWORD *)v2 + 10) = v21;

    *((_DWORD *)v2 + 30) = 5;
    *(_QWORD *)(v2 + 124) = 0;
    *(_QWORD *)(v2 + 140) = 0;
    *(_QWORD *)(v2 + 132) = 0;
    *((_DWORD *)v2 + 37) = 0;
    v23 = dispatch_queue_create("com.apple.UIKit.inProcessAnimationManagerTickQueue", 0);
    v24 = (void *)*((_QWORD *)v2 + 24);
    *((_QWORD *)v2 + 24) = v23;

    v25 = dispatch_queue_create("com.apple.UIKit.inProcessAnimationManagerTickEntryQueue", 0);
    v26 = (void *)*((_QWORD *)v2 + 23);
    *((_QWORD *)v2 + 23) = v25;

    v27 = dispatch_queue_create("com.apple.UIKit.inProcessAnimationManagerLockingQueue", 0);
    v28 = (void *)*((_QWORD *)v2 + 25);
    *((_QWORD *)v2 + 25) = v27;

    v29 = dispatch_queue_create("com.apple.UIKit.inProcessAnimationManagerDisplayLinkAccessQueue", 0);
    v30 = (void *)*((_QWORD *)v2 + 27);
    *((_QWORD *)v2 + 27) = v29;

    v31 = dispatch_queue_create("com.apple.UIKit.inProcessAnimationManagerBacklightQueue", 0);
    v32 = (void *)*((_QWORD *)v2 + 28);
    *((_QWORD *)v2 + 28) = v31;

    v2[249] = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)*((_QWORD *)v2 + 37);
    *((_QWORD *)v2 + 37) = v33;

    v2[280] = 0;
    *(_WORD *)(v2 + 277) = 0;
    *((_QWORD *)v2 + 36) = 0;
    if ((objc_msgSend((id)objc_opt_class(), "_isSystemUIService") & 1) == 0 && (_UIApplicationIsExtension() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addObserver:selector:name:object:", v2, sel__applicationDidEnterBackground, CFSTR("UIApplicationDidEnterBackgroundNotification"), UIApp);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addObserver:selector:name:object:", v2, sel__applicationBecameActive, CFSTR("UIApplicationDidBecomeActiveNotification"), UIApp);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "addObserver:selector:name:object:", v2, sel__screenBasedSceneWillAttachWindow_, CFSTR("_UIScreenBasedWindowSceneDidAttachWindowNotification"), 0);

    }
    objc_msgSend(v2, "_registerBacklightChangedNotification");
    objc_msgSend(v2, "setUsesMainThreadExecution:", 0);
  }
  return (UIViewInProcessAnimationManager *)v2;
}

- (void)_registerBacklightChangedNotification
{
  NSObject *backlightQueue;
  _QWORD handler[5];

  backlightQueue = self->_backlightQueue;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __72__UIViewInProcessAnimationManager__registerBacklightChangedNotification__block_invoke;
  handler[3] = &unk_1E16BDB68;
  handler[4] = self;
  notify_register_dispatch("com.apple.backboardd.backlight.changed", &self->_screenDimmingNotificationToken, backlightQueue, handler);
}

void __72__UIViewInProcessAnimationManager__registerBacklightChangedNotification__block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  int v4;
  double v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  _QWORD v12[5];
  _QWORD block[5];
  BOOL v14;
  uint64_t state64;

  state64 = 0;
  notify_get_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 272), &state64);
  v2 = state64;
  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v3 = (double)v2;
  v4 = _UIInternalPreferencesRevisionVar;
  v5 = 0.0;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    v11 = _UIInternalPreference_UIViewInProcessMinimumBacklightLevel;
    if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_UIViewInProcessMinimumBacklightLevel)
    {
      while (v4 >= v11)
      {
        _UIInternalPreferenceSync(v4, &_UIInternalPreference_UIViewInProcessMinimumBacklightLevel, (uint64_t)CFSTR("UIViewInProcessMinimumBacklightLevel"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
        v11 = _UIInternalPreference_UIViewInProcessMinimumBacklightLevel;
        if (v4 == _UIInternalPreference_UIViewInProcessMinimumBacklightLevel)
          goto LABEL_4;
      }
      v5 = *(double *)&qword_1EDDA83D8;
    }
  }
LABEL_4:
  v6 = v5 >= v3;
  v7 = *(_QWORD *)(a1 + 32);
  if (*(unsigned __int8 *)(v7 + 280) != v6)
  {
    *(_BYTE *)(v7 + 280) = v6;
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(NSObject **)(v8 + 192);
    v10 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__UIViewInProcessAnimationManager__registerBacklightChangedNotification__block_invoke_2;
    block[3] = &unk_1E16B1B78;
    block[4] = v8;
    v14 = v5 >= v3;
    dispatch_sync(v9, block);
    if (v5 >= v3)
    {
      v12[0] = v10;
      v12[1] = 3221225472;
      v12[2] = __72__UIViewInProcessAnimationManager__registerBacklightChangedNotification__block_invoke_3;
      v12[3] = &unk_1E16B1B28;
      v12[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(MEMORY[0x1E0C80D38], v12);
    }
  }
}

uint64_t __72__UIViewInProcessAnimationManager__registerBacklightChangedNotification__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 277) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __72__UIViewInProcessAnimationManager__registerBacklightChangedNotification__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelAllAnimationsImmediately");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("UIApplicationDidEnterBackgroundNotification");
  v6[1] = CFSTR("UIApplicationDidBecomeActiveNotification");
  v6[2] = CFSTR("UISceneDidDisconnectNotification");
  v6[3] = CFSTR("_UIScreenBasedWindowSceneDidAttachWindowNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  notify_cancel(self->_screenDimmingNotificationToken);
  v5.receiver = self;
  v5.super_class = (Class)UIViewInProcessAnimationManager;
  -[UIViewInProcessAnimationManager dealloc](&v5, sel_dealloc);
}

- (void)_cancelAllAnimationsImmediately
{
  id WeakRetained;
  void *v5;
  _QWORD v6[5];

  kdebug_trace();
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewInProcessAnimationManager.m"), 429, CFSTR("%s may only be called from the main thread"), "-[UIViewInProcessAnimationManager _cancelAllAnimationsImmediately]");

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_caCommitFuture);
  objc_msgSend(WeakRetained, "invalidate");

  objc_storeWeak((id *)&self->_caCommitFuture, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__UIViewInProcessAnimationManager__cancelAllAnimationsImmediately__block_invoke;
  v6[3] = &unk_1E16B1B28;
  v6[4] = self;
  -[UIViewInProcessAnimationManager _performTick:cancel:force:eventName:entry:exit:](self, "_performTick:cancel:force:eventName:entry:exit:", 1, 1, CFSTR("cancel"), v6, &__block_literal_global_75_4, 0.0);
}

uint64_t __66__UIViewInProcessAnimationManager__cancelAllAnimationsImmediately__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processPreCommitBlocks");
}

- (void)_screenBasedSceneWillAttachWindow:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  NSMutableArray *v7;
  NSMutableArray *observedWindowScenes;
  void *v9;
  id v10;

  objc_msgSend(a3, "object");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIWindowScene _unassociatedWindowSceneForScreen:create:](UIWindowScene, "_unassociatedWindowSceneForScreen:create:", v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 == v5)
  {
    v6 = objc_msgSend(v10, "activationState");

    if (v6)
      goto LABEL_5;
    if (!self->_observedWindowScenes)
    {
      v7 = (NSMutableArray *)objc_opt_new();
      observedWindowScenes = self->_observedWindowScenes;
      self->_observedWindowScenes = v7;

    }
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[NSMutableArray containsObject:](self->_observedWindowScenes, "containsObject:", v4) & 1) == 0)
    {
      -[NSMutableArray addObject:](self->_observedWindowScenes, "addObject:", v4);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__screenBasedSceneDidDisconnect_, CFSTR("UISceneDidDisconnectNotification"), v10);

      -[UIViewInProcessAnimationManager _updateAnimationSuspensionForAppStateChange](self, "_updateAnimationSuspensionForAppStateChange");
    }
  }
  else
  {

  }
LABEL_5:

}

- (void)_screenBasedSceneDidDisconnect:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSMutableArray indexOfObject:](self->_observedWindowScenes, "indexOfObject:", v5);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "UIViewInProcessAnimationManager received a scene disconnection notification for an unrecognized scene!", buf, 2u);
      }

    }
    else
    {
      v7 = _screenBasedSceneDidDisconnect____s_category;
      if (!_screenBasedSceneDidDisconnect____s_category)
      {
        v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&_screenBasedSceneDidDisconnect____s_category);
      }
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "UIViewInProcessAnimationManager received a scene disconnection notification for an unrecognized scene!", v11, 2u);
      }
    }
  }
  else
  {
    -[NSMutableArray removeObjectAtIndex:](self->_observedWindowScenes, "removeObjectAtIndex:", v6);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:name:object:", self, CFSTR("UISceneDidDisconnectNotification"), v4);

    -[UIViewInProcessAnimationManager _updateAnimationSuspensionForAppStateChange](self, "_updateAnimationSuspensionForAppStateChange");
  }

}

- (void)_applicationDidEnterBackground
{
  self->_appSuspended = 1;
  -[UIViewInProcessAnimationManager _updateAnimationSuspensionForAppStateChange](self, "_updateAnimationSuspensionForAppStateChange");
  -[UIViewInProcessAnimationManager _cancelAllAnimationsImmediately](self, "_cancelAllAnimationsImmediately");
}

- (void)_applicationBecameActive
{
  self->_appSuspended = 0;
  -[UIViewInProcessAnimationManager _updateAnimationSuspensionForAppStateChange](self, "_updateAnimationSuspensionForAppStateChange");
}

- (void)_updateAnimationSuspensionForAppStateChange
{
  _BOOL4 appSuspended;
  NSMutableArray *v4;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  appSuspended = self->_appSuspended;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_observedWindowScenes;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  v6 = appSuspended;
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "nonretainedObjectValue", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "activationState");

        if (!v11)
        {
          v6 = 0;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  -[UIViewInProcessAnimationManager _setAnimationsSuspended:](self, "_setAnimationsSuspended:", v6);
}

- (void)_setAnimationsSuspended:(BOOL)a3
{
  NSObject *tickQueue;
  _QWORD *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  if (self->_animationsSuspended != a3)
  {
    if (a3)
    {
      tickQueue = self->_tickQueue;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __59__UIViewInProcessAnimationManager__setAnimationsSuspended___block_invoke;
      v7[3] = &unk_1E16B1B28;
      v7[4] = self;
      v5 = v7;
    }
    else
    {
      -[UIViewInProcessAnimationManager _cancelAllAnimationsImmediately](self, "_cancelAllAnimationsImmediately");
      tickQueue = self->_tickQueue;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __59__UIViewInProcessAnimationManager__setAnimationsSuspended___block_invoke_2;
      v6[3] = &unk_1E16B1B28;
      v6[4] = self;
      v5 = v6;
    }
    dispatch_sync(tickQueue, v5);
  }
}

void __59__UIViewInProcessAnimationManager__setAnimationsSuspended___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 276) = 1;
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 249))
  {
    objc_msgSend(*(id *)(v2 + 152), "finishAdvancingAnimationManager");
    v2 = *(_QWORD *)(a1 + 32);
  }
  v3 = *(void **)(v2 + 152);
  *(_QWORD *)(v2 + 152) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 249) = 0;
}

uint64_t __59__UIViewInProcessAnimationManager__setAnimationsSuspended___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 276) = 0;
  return result;
}

- (void)setUsesMainThreadExecution:(BOOL)a3
{
  self->_usesMainThreadExecution = a3;
  if (-[UIViewInProcessAnimationManager _isInvalidated](self, "_isInvalidated"))
    -[UIViewInProcessAnimationManager _setAnimationExecutionParameters](self, "_setAnimationExecutionParameters");
}

- (void)_setCurrentMediaTime:(double)a3
{
  self->_time = a3;
}

- (BOOL)_isInvalidated
{
  NSObject *entryLockingQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  entryLockingQueue = self->_entryLockingQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__UIViewInProcessAnimationManager__isInvalidated__block_invoke;
  v5[3] = &unk_1E16BACE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(entryLockingQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __49__UIViewInProcessAnimationManager__isInvalidated__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 152) || objc_msgSend(*(id *)(v2 + 16), "count"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = WeakRetained == 0;

  }
}

void __68__UIViewInProcessAnimationManager__dispatchAsyncOntoMainBeforeExit___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  id v2;
  void *v3;

  v0 = dispatch_queue_create("com.apple.UIKit.inProcessAnimationManager.mainDispatchAsyncQueue", 0);
  v1 = (void *)qword_1ECD82480;
  qword_1ECD82480 = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = (void *)qword_1ECD82488;
  qword_1ECD82488 = (uint64_t)v2;

}

void __68__UIViewInProcessAnimationManager__dispatchAsyncOntoMainBeforeExit___block_invoke_97(uint64_t a1)
{
  id v2;
  void *v3;

  if (objc_msgSend((id)qword_1ECD82488, "count"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), (id)qword_1ECD82488);
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3 = (void *)qword_1ECD82488;
    qword_1ECD82488 = (uint64_t)v2;

  }
  _MergedGlobals_1319 = 0;
}

void __66__UIViewInProcessAnimationManager_startAdvancingAnimationManager___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0CB3978];
  v6 = a2;
  objc_msgSend(v2, "mainThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadPriority");
  v5 = v4;

  objc_msgSend(v6, "setThreadPriority:", fmax(v5, 0.85));
  objc_msgSend(v6, "setName:", CFSTR("com.apple.UIKit.inProcessAnimationManager"));
  objc_msgSend(v6, "start");

}

void __66__UIViewInProcessAnimationManager_startAdvancingAnimationManager___block_invoke_6(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  __n128 v7;
  _DWORD *v8;
  double v9;
  double v10;
  int32x2_t *v11;
  uint64_t v12;
  float32x2_t v13;
  _QWORD v14[5];

  *(_BYTE *)(a1[4] + 279) = 0;
  if (!*(_QWORD *)(a1[4] + 264))
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = a1[4];
    v4 = *(void **)(v3 + 264);
    *(_QWORD *)(v3 + 264) = v2;

    v5 = objc_alloc(MEMORY[0x1E0CB3978]);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __66__UIViewInProcessAnimationManager_startAdvancingAnimationManager___block_invoke_7;
    v14[3] = &unk_1E16B1B28;
    v14[4] = a1[4];
    v6 = (void *)objc_msgSend(v5, "initWithBlock:", v14);
    v7 = ((__n128 (*)(void))*(_QWORD *)(a1[5] + 16))();
    v8 = *(_DWORD **)(a1[6] + 8);
    v7.n128_u32[0] = v8[8];
    LODWORD(v9) = v8[9];
    LODWORD(v10) = v8[10];
    objc_msgSend(*(id *)(a1[4] + 264), "setPreferredFrameRateRange:", v7.n128_f64[0], v9, v10);
    +[_UIViewInProcessAnimationReasonArray applyReasons:toDisplayLink:](_UIViewInProcessAnimationReasonArray, "applyReasons:toDisplayLink:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), *(_QWORD *)(a1[4] + 264));
    v11 = (int32x2_t *)a1[4];
    v12 = *(_QWORD *)(a1[6] + 8);
    v13 = *(float32x2_t *)(v12 + 36);
    v11[15].i32[1] = *(float *)(v12 + 32);
    v11[16] = vrev64_s32((int32x2_t)vcvt_u32_f32(v13));
    _UIUpdateRequestRegistryAddRecord((uint64_t)&mainRegistry, (int *)(a1[4] + 120), 0x100036u);

  }
}

void __66__UIViewInProcessAnimationManager_startAdvancingAnimationManager___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  UIViewInProcessAnimationManagerSetFixedPriority();
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 264);
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addToRunLoop:forMode:", v3, *MEMORY[0x1E0C99860]);

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "run");

}

uint64_t __66__UIViewInProcessAnimationManager_startAdvancingAnimationManager___block_invoke_8(uint64_t result)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _DWORD *v10;
  double v11;
  double v12;
  double v13;
  int32x2_t *v14;
  uint64_t v15;
  float32x2_t v16;

  *(_BYTE *)(*(_QWORD *)(result + 32) + 279) = 0;
  if (!*(_QWORD *)(*(_QWORD *)(result + 32) + 264))
  {
    v1 = (_QWORD *)result;
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "displayLinkWithTarget:selector:", v1[4], sel__displayLinkFire_);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v1[4];
    v5 = *(void **)(v4 + 264);
    *(_QWORD *)(v4 + 264) = v3;

    v6 = *(void **)(v1[4] + 264);
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addToRunLoop:forMode:", v7, *MEMORY[0x1E0C99860]);

    v8 = *(void **)(v1[4] + 264);
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addToRunLoop:forMode:", v9, CFSTR("UITrackingRunLoopMode"));

    v10 = *(_DWORD **)(v1[5] + 8);
    LODWORD(v11) = v10[8];
    LODWORD(v12) = v10[9];
    LODWORD(v13) = v10[10];
    objc_msgSend(*(id *)(v1[4] + 264), "setPreferredFrameRateRange:", v11, v12, v13);
    +[_UIViewInProcessAnimationReasonArray applyReasons:toDisplayLink:](_UIViewInProcessAnimationReasonArray, "applyReasons:toDisplayLink:", *(_QWORD *)(*(_QWORD *)(v1[6] + 8) + 40), *(_QWORD *)(v1[4] + 264));
    v14 = (int32x2_t *)v1[4];
    v15 = *(_QWORD *)(v1[5] + 8);
    v16 = *(float32x2_t *)(v15 + 36);
    v14[15].i32[1] = *(float *)(v15 + 32);
    v14[16] = vrev64_s32((int32x2_t)vcvt_u32_f32(v16));
    return _UIUpdateRequestRegistryAddRecord((uint64_t)&mainRegistry, (int *)(v1[4] + 120), 0x100036u);
  }
  return result;
}

- (BOOL)usesMainThreadExecution
{
  return self->_usesMainThreadExecution;
}

- (unint64_t)executionMode
{
  return self->_executionMode;
}

- (void)setExecutionMode:(unint64_t)a3
{
  self->_executionMode = a3;
}

- (void)setAdvancingOnCommitDisabled:(BOOL)a3
{
  self->_advancingOnCommitDisabled = a3;
}

- (NSThread)animationThread
{
  return (NSThread *)objc_loadWeakRetained((id *)&self->_animationThread);
}

- (void)setAnimationThread:(id)a3
{
  objc_storeWeak((id *)&self->_animationThread, a3);
}

- (NSRunLoop)animationThreadRunLoop
{
  return (NSRunLoop *)objc_loadWeakRetained((id *)&self->_animationThreadRunLoop);
}

- (void)setAnimationThreadRunLoop:(id)a3
{
  objc_storeWeak((id *)&self->_animationThreadRunLoop, a3);
}

- (OS_dispatch_semaphore)animationThreadKeepAliveSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 360, 1);
}

- (void)setAnimationThreadKeepAliveSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationThreadKeepAliveSemaphore, 0);
  objc_destroyWeak((id *)&self->_animationThreadRunLoop);
  objc_destroyWeak((id *)&self->_animationThread);
  objc_destroyWeak((id *)&self->_currentTickThread);
  objc_storeStrong((id *)&self->_observedWindowScenes, 0);
  objc_storeStrong((id *)&self->_presentationGroups, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_destroyWeak((id *)&self->_caCommitFuture);
  objc_storeStrong((id *)&self->_postTicksDelaySemaphore, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_backlightQueue, 0);
  objc_storeStrong((id *)&self->_displayLinkAccessQueue, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_entryLockingQueue, 0);
  objc_storeStrong((id *)&self->_tickQueue, 0);
  objc_storeStrong((id *)&self->_tickPrepQueue, 0);
  objc_storeStrong((id *)&self->_animatorAdvancer, 0);
  objc_storeStrong((id *)&self->_updateReasonArray, 0);
  objc_storeStrong((id *)&self->_updateReasons, 0);
  objc_storeStrong((id *)&self->_preferredFrameRates, 0);
  objc_storeStrong((id *)&self->_maximumFrameRates, 0);
  objc_storeStrong((id *)&self->_minimumFrameRates, 0);
  objc_storeStrong((id *)&self->_presentationModifierGroupRequestBlocks, 0);
  objc_storeStrong((id *)&self->_preExitBlocks, 0);
  objc_storeStrong((id *)&self->_postTickBlocks, 0);
  objc_storeStrong((id *)&self->_newlyAddedEntries, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_preCommitBlocks, 0);
}

@end
