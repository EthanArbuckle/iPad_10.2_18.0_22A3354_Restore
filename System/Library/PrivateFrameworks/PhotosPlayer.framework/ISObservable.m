@implementation ISObservable

- (void)registerChangeObserver:(id)a3 context:(void *)a4
{
  id v6;
  NSObject *observersQueue;
  id v8;
  _QWORD block[5];
  id v10;
  void *v11;

  v6 = a3;
  observersQueue = self->_observersQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__ISObservable_registerChangeObserver_context___block_invoke;
  block[3] = &unk_1E9453BD0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(observersQueue, block);
  if (v8)
    -[ISObservable _setHasObservers:](self, "_setHasObservers:", 1);

}

- (void)_setHasObservers:(BOOL)a3
{
  if (self->_hasObservers != a3)
  {
    self->_hasObservers = a3;
    -[ISObservable hasObserversDidChange](self, "hasObserversDidChange");
  }
}

- (void)unregisterChangeObserver:(id)a3 context:(void *)a4
{
  id v6;
  NSObject *observersQueue;
  id v8;
  _QWORD block[5];
  id v10;
  void *v11;

  v6 = a3;
  observersQueue = self->_observersQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__ISObservable_unregisterChangeObserver_context___block_invoke;
  block[3] = &unk_1E9453BD0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(observersQueue, block);

}

void __49__ISObservable_unregisterChangeObserver_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_observersQueue_copyChangeObserversForWriteIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKey:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "count");
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    while (objc_msgSend(v5, "pointerAtIndex:", v4) != *(_QWORD *)(a1 + 48))
    {
      if (v3 == ++v4)
        goto LABEL_7;
    }
    objc_msgSend(v5, "removePointerAtIndex:", v4);
  }
LABEL_7:
  if (v5 && !objc_msgSend(v5, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

void __47__ISObservable_registerChangeObserver_context___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_observersQueue_copyChangeObserversForWriteIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v12 = v2;
    v6 = objc_msgSend(v2, "count");
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = v12;
      while (1)
      {
        v10 = objc_msgSend(v9, "pointerAtIndex:", v8);
        v11 = *(_QWORD *)(a1 + 48);
        if (v10 == v11)
          break;
        ++v8;
        v9 = v12;
        if (v7 == v8)
          goto LABEL_12;
      }
    }
    else
    {
      v11 = *(_QWORD *)(a1 + 48);
LABEL_12:
      objc_msgSend(v12, "addPointer:", v11);
    }
  }
  else
  {
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 72);
      *(_QWORD *)(v4 + 72) = v3;

    }
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 256);
    objc_msgSend(v12, "addPointer:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setObject:forKey:", v12, *(_QWORD *)(a1 + 40));
  }

}

- (ISObservable)init
{
  ISObservable *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *observersQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *pendingChangesQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ISObservable;
  v2 = -[ISObservable init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.photosplayer.observable.internal-queue", 0);
    observersQueue = v2->_observersQueue;
    v2->_observersQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.photosplayer.observable.pending-change-queue", 0);
    pendingChangesQueue = v2->_pendingChangesQueue;
    v2->_pendingChangesQueue = (OS_dispatch_queue *)v5;

    v2->_currentChange = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersQueue_changeObserversWithContexts, 0);
  objc_storeStrong((id *)&self->_pendingChangesQueue, 0);
  objc_storeStrong((id *)&self->_observersQueue, 0);
  objc_storeStrong((id *)&self->_pendingChangesQueue_pendingChangeBlocks, 0);
}

- (void)performChanges:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  NSObject *pendingChangesQueue;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (self->_isEnumeratingObservers)
  {
    pendingChangesQueue = self->_pendingChangesQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __31__ISObservable_performChanges___block_invoke;
    v8[3] = &unk_1E9453B48;
    v8[4] = self;
    v9 = v4;
    dispatch_async(pendingChangesQueue, v8);

  }
  else
  {
    -[ISObservable _willChange](self, "_willChange");
    -[ISObservable mutableChangeObject](self, "mutableChangeObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v7);

    -[ISObservable _didChange](self, "_didChange");
  }

}

- (void)signalChange:(unint64_t)a3
{
  self->_currentChange |= a3;
}

- (unint64_t)currentChanges
{
  return self->_currentChange;
}

- (BOOL)isPerformingChanges
{
  return self->_nestedChanges > 0;
}

- (void)enumerateObserversUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, char *);
  NSObject *observersQueue;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  _BOOL4 v15;
  NSObject *v16;
  BOOL isEnumeratingObservers;
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char v23;
  _QWORD block[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, uint64_t, char *))a3;
  isEnumeratingObservers = self->_isEnumeratingObservers;
  self->_isEnumeratingObservers = 1;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  observersQueue = self->_observersQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__ISObservable_enumerateObserversUsingBlock___block_invoke;
  block[3] = &unk_1E9454248;
  block[4] = self;
  block[5] = &v25;
  dispatch_sync(observersQueue, block);
  v23 = 0;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend((id)v26[5], "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
  v8 = v7;
  if (v7)
  {
    v9 = *(_QWORD *)v20;
    v10 = v7;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v9)
        objc_enumerationMutation(v6);
      v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v11);
      objc_msgSend((id)v26[5], "objectForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      while (v14 < objc_msgSend(v13, "count"))
      {
        v4[2](v4, v12, objc_msgSend(v13, "pointerAtIndex:", v14++), &v23);
        if (v23)
        {

          goto LABEL_13;
        }
      }
      v15 = v23 == 0;

      if (!v15)
        break;
      if (++v11 == v10)
      {
        v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }
LABEL_13:

  v16 = self->_observersQueue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __45__ISObservable_enumerateObserversUsingBlock___block_invoke_2;
  v18[3] = &unk_1E9453F48;
  v18[4] = self;
  dispatch_sync(v16, v18);
  self->_isEnumeratingObservers = isEnumeratingObservers;
  -[ISObservable _setHasObservers:](self, "_setHasObservers:", v8 != 0);
  _Block_object_dispose(&v25, 8);

}

- (void)_willChange
{
  int64_t nestedChanges;

  nestedChanges = self->_nestedChanges;
  if (!nestedChanges)
  {
    -[ISObservable willPerformChanges](self, "willPerformChanges");
    nestedChanges = self->_nestedChanges;
  }
  self->_nestedChanges = nestedChanges + 1;
}

- (void)_didChange
{
  int64_t nestedChanges;
  int64_t v4;

  nestedChanges = self->_nestedChanges;
  if (nestedChanges == 1)
  {
    -[ISObservable didPerformChanges](self, "didPerformChanges");
    nestedChanges = self->_nestedChanges;
  }
  v4 = nestedChanges - 1;
  self->_nestedChanges = v4;
  if (!v4)
  {
    if (self->_currentChange)
    {
      -[ISObservable _publishChanges](self, "_publishChanges");
      -[ISObservable didPublishChanges](self, "didPublishChanges");
      self->_currentChange = 0;
    }
    -[ISObservable _applyPendingChanges](self, "_applyPendingChanges");
  }
}

- (void)_publishChanges
{
  unint64_t currentChange;
  _QWORD v3[6];

  currentChange = self->_currentChange;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__ISObservable__publishChanges__block_invoke;
  v3[3] = &unk_1E94538C8;
  v3[4] = self;
  v3[5] = currentChange;
  -[ISObservable enumerateObserversUsingBlock:](self, "enumerateObserversUsingBlock:", v3);
}

- (void)_applyPendingChanges
{
  int64_t numAppliedPendingChanges;
  NSObject *v4;
  NSObject *pendingChangesQueue;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD block[6];
  uint8_t buf[8];
  uint8_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  numAppliedPendingChanges = self->_numAppliedPendingChanges;
  self->_numAppliedPendingChanges = numAppliedPendingChanges + 1;
  if (numAppliedPendingChanges >= 39)
  {
    ISGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2DCA000, v4, OS_LOG_TYPE_DEFAULT, "Change depth limit almost reached", buf, 2u);
    }

  }
  *(_QWORD *)buf = 0;
  v10 = buf;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  pendingChangesQueue = self->_pendingChangesQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__ISObservable__applyPendingChanges__block_invoke;
  block[3] = &unk_1E9454248;
  block[4] = self;
  block[5] = buf;
  dispatch_sync(pendingChangesQueue, block);
  if (*((_QWORD *)v10 + 5))
  {
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __36__ISObservable__applyPendingChanges__block_invoke_2;
    v7[3] = &unk_1E94538F0;
    v7[4] = buf;
    -[ISObservable performChanges:](self, "performChanges:", v7);
  }
  --self->_numAppliedPendingChanges;
  _Block_object_dispose(buf, 8);

}

- (void)_observersQueue_copyChangeObserversForWriteIfNeeded
{
  NSMapTable *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMapTable *observersQueue_changeObserversWithContexts;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_observersQueue_shouldCopyChangeObserversOnWrite)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v3 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[NSMapTable keyEnumerator](self->_observersQueue_changeObserversWithContexts, "keyEnumerator", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          -[NSMapTable objectForKey:](self->_observersQueue_changeObserversWithContexts, "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)objc_msgSend(v10, "copy");

          -[NSMapTable setObject:forKey:](v3, "setObject:forKey:", v11, v9);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

    observersQueue_changeObserversWithContexts = self->_observersQueue_changeObserversWithContexts;
    self->_observersQueue_changeObserversWithContexts = v3;

    self->_observersQueue_shouldCopyChangeObserversOnWrite = 0;
  }
}

- (BOOL)hasObservers
{
  return self->_hasObservers;
}

void __36__ISObservable__applyPendingChanges__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

}

void __36__ISObservable__applyPendingChanges__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
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

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

uint64_t __31__ISObservable__publishChanges__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "observable:didChange:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3);
}

void __45__ISObservable_enumerateObserversUsingBlock___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 72));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 1;
}

uint64_t __45__ISObservable_enumerateObserversUsingBlock___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 64) = 0;
  return result;
}

void __31__ISObservable_performChanges___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v2)
  {
    v7 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(v2, "addObject:");
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C99DE8];
    v7 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(v3, "arrayWithObject:");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v4;

  }
}

@end
