@implementation PUViewModel

- (PUViewModel)init
{
  PUViewModel *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *observerQueue;
  uint64_t v5;
  NSHashTable *changeObservers;
  uint64_t v7;
  NSMutableArray *pendingChangeBlocks;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUViewModel;
  v2 = -[PUViewModel init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.photos.viewmodel.observer-queue", 0);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    changeObservers = v2->__changeObservers;
    v2->__changeObservers = (NSHashTable *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    pendingChangeBlocks = v2->_pendingChangeBlocks;
    v2->_pendingChangeBlocks = (NSMutableArray *)v7;

  }
  return v2;
}

- (void)registerChangeObserver:(id)a3
{
  id v4;
  NSObject *observerQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__PUViewModel_registerChangeObserver___block_invoke;
  block[3] = &unk_1E58ABCA8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(observerQueue, block);

}

void __38__PUViewModel_registerChangeObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "_isPublishingChanges"))
  {
    v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "mutableCopy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 56);
    *(_QWORD *)(v3 + 56) = v2;

  }
  objc_msgSend(*(id *)(a1 + 32), "_changeObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 40));

}

- (BOOL)_isPublishingChanges
{
  return self->__publishingChanges;
}

- (NSHashTable)_changeObservers
{
  return self->__changeObservers;
}

- (id)newViewModelChange
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUViewModel.m"), 40, CFSTR("Concrete subclass must implement %@"), v5);

  return 0;
}

- (void)assertInsideChangesBlock
{
  id v4;

  if (self->_nestedChanges < 1 || -[PUViewModel _isPublishingChanges](self, "_isPublishingChanges"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUViewModel.m"), 45, CFSTR("Changes must be made inside a block passed to performChanges"));

  }
}

- (PUViewModelChange)currentChange
{
  PUViewModelChange *v4;
  PUViewModelChange *currentChange;
  void *v7;

  if (self->_nestedChanges >= 1 && !self->_currentChange)
  {
    v4 = -[PUViewModel newViewModelChange](self, "newViewModelChange");
    currentChange = self->_currentChange;
    self->_currentChange = v4;

    if (!self->_currentChange)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUViewModel.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_currentChange != nil"));

    }
  }
  return self->_currentChange;
}

- (PUViewModelChange)currentChangeIfExists
{
  return self->_currentChange;
}

- (void)performChanges:(id)a3
{
  NSMutableArray *pendingChangeBlocks;
  void *v6;
  void *v7;
  void (**v8)(void);

  v8 = (void (**)(void))a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUViewModel.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changeBlock != nil"));

  }
  if (-[PUViewModel _isPublishingChanges](self, "_isPublishingChanges"))
  {
    pendingChangeBlocks = self->_pendingChangeBlocks;
    v6 = (void *)objc_msgSend(v8, "copy");
    -[NSMutableArray addObject:](pendingChangeBlocks, "addObject:", v6);

  }
  else
  {
    -[PUViewModel _willChange](self, "_willChange");
    v8[2]();
    -[PUViewModel _didChange](self, "_didChange");
  }

}

- (void)_willChange
{
  void *v4;

  if (-[PUViewModel _isPublishingChanges](self, "_isPublishingChanges"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUViewModel.m"), 90, CFSTR("PUViewModel currently disallows new changes while publishing changes. This requirement might have to be relaxed, but for now it is strict. This makes debugging easier and avoids ping-ponging state. Please figure out if the changes that are being made has to be made in reaction to a viewModel change, or could be made in some other way."));

  }
  ++self->_nestedChanges;
}

- (void)_didChange
{
  int64_t nestedChanges;
  int64_t v4;
  PUViewModelChange *currentChange;
  void *v7;
  void *v8;

  nestedChanges = self->_nestedChanges;
  if (nestedChanges <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUViewModel.m"), 96, CFSTR("%@ called without a change in progress."), v8);

    nestedChanges = self->_nestedChanges;
  }
  if (nestedChanges == 1)
  {
    -[PUViewModel didPerformChanges](self, "didPerformChanges");
    if (-[PUViewModelChange hasChanges](self->_currentChange, "hasChanges"))
      -[PUViewModel willPublishChanges](self, "willPublishChanges");
  }
  v4 = self->_nestedChanges - 1;
  self->_nestedChanges = v4;
  if (!v4)
  {
    if (-[PUViewModelChange hasChanges](self->_currentChange, "hasChanges"))
    {
      -[PUViewModel _publishChanges](self, "_publishChanges");
      -[PUViewModel didPublishChanges](self, "didPublishChanges");
    }
    currentChange = self->_currentChange;
    self->_currentChange = 0;

    -[PUViewModel _applyPendingChanges](self, "_applyPendingChanges");
  }
}

- (void)_publishChanges
{
  NSObject *observerQueue;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD block[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__102794;
  v22 = __Block_byref_object_dispose__102795;
  v23 = 0;
  observerQueue = self->_observerQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__PUViewModel__publishChanges__block_invoke;
  block[3] = &unk_1E58AAE48;
  block[4] = self;
  block[5] = &v18;
  dispatch_sync(observerQueue, block);
  -[PUViewModel currentChange](self, "currentChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (id)v19[5];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v24, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "viewModel:didChange:", self, v5);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v24, 16);
    }
    while (v7);
  }

  v11 = self->_observerQueue;
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __30__PUViewModel__publishChanges__block_invoke_2;
  v12[3] = &unk_1E58ABD10;
  v12[4] = self;
  dispatch_sync(v11, v12);

  _Block_object_dispose(&v18, 8);
}

- (void)_applyPendingChanges
{
  int64_t numAppliedPendingChanges;
  void *v4;
  id v5;
  void *v7;
  _QWORD v8[4];
  id v9;

  numAppliedPendingChanges = self->_numAppliedPendingChanges;
  self->_numAppliedPendingChanges = numAppliedPendingChanges + 1;
  if (numAppliedPendingChanges >= 50)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUViewModel.m"), 137, CFSTR("Change depth limit reached (%ld), this indicates infinite state ping-ponging, investigate the stack trace and figure out why the model doesn't reach a stable state. Typically because two observers are trying to set different new values in response to the same change."), 50);

  }
  if (-[NSMutableArray count](self->_pendingChangeBlocks, "count"))
  {
    v4 = (void *)-[NSMutableArray copy](self->_pendingChangeBlocks, "copy");
    -[NSMutableArray removeAllObjects](self->_pendingChangeBlocks, "removeAllObjects");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __35__PUViewModel__applyPendingChanges__block_invoke;
    v8[3] = &unk_1E58ABD10;
    v9 = v4;
    v5 = v4;
    -[PUViewModel performChanges:](self, "performChanges:", v8);

  }
  --self->_numAppliedPendingChanges;
}

- (void)unregisterChangeObserver:(id)a3
{
  id v4;
  NSObject *observerQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__PUViewModel_unregisterChangeObserver___block_invoke;
  block[3] = &unk_1E58ABCA8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(observerQueue, block);

}

- (void)_setPublishingChanges:(BOOL)a3
{
  self->__publishingChanges = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__changeObservers, 0);
  objc_storeStrong((id *)&self->_currentChange, 0);
  objc_storeStrong((id *)&self->_pendingChangeBlocks, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
}

void __40__PUViewModel_unregisterChangeObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "_isPublishingChanges"))
  {
    v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "mutableCopy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 56);
    *(_QWORD *)(v3 + 56) = v2;

  }
  objc_msgSend(*(id *)(a1 + 32), "_changeObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __35__PUViewModel__applyPendingChanges__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void __30__PUViewModel__publishChanges__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_setPublishingChanges:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_changeObservers");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __30__PUViewModel__publishChanges__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPublishingChanges:", 0);
}

@end
