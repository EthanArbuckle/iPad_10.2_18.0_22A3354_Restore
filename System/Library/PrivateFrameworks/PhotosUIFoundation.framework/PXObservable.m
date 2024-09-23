@implementation PXObservable

uint64_t __45__PXObservable_enumerateObserversUsingBlock___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 56) = 0;
  return result;
}

void __47__PXObservable_registerChangeObserver_context___block_invoke(uint64_t a1)
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
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKey:", *(_QWORD *)(a1 + 40));
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
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
    {
      objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 64);
      *(_QWORD *)(v4 + 64) = v3;

    }
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1748]), "initWithOptions:", 256);
    objc_msgSend(v12, "addPointer:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKey:", v12, *(_QWORD *)(a1 + 40));
  }

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

  v18 = *MEMORY[0x24BDAC8D0];
  if (self->_observersQueue_shouldCopyChangeObserversOnWrite)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
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

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, uint64_t, char *))a3;
  isEnumeratingObservers = self->_isEnumeratingObservers;
  self->_isEnumeratingObservers = 1;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__3019;
  v29 = __Block_byref_object_dispose__3020;
  v30 = 0;
  observersQueue = self->_observersQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__PXObservable_enumerateObserversUsingBlock___block_invoke;
  block[3] = &unk_2514CF9F0;
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
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __45__PXObservable_enumerateObserversUsingBlock___block_invoke_2;
  v18[3] = &unk_2514D11A8;
  v18[4] = self;
  dispatch_sync(v16, v18);
  self->_isEnumeratingObservers = isEnumeratingObservers;
  -[PXObservable _setHasObservers:](self, "_setHasObservers:", v8 != 0);
  _Block_object_dispose(&v25, 8);

}

uint64_t __31__PXObservable__publishChanges__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "observable:didChange:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3);
}

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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__PXObservable_registerChangeObserver_context___block_invoke;
  block[3] = &unk_2514CF9C8;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(observersQueue, block);
  if (v8)
    -[PXObservable _setHasObservers:](self, "_setHasObservers:", 1);

}

- (void)_setHasObservers:(BOOL)a3
{
  if (self->_hasObservers != a3)
  {
    self->_hasObservers = a3;
    -[PXObservable hasObserversDidChange](self, "hasObserversDidChange");
  }
}

void __45__PXObservable_enumerateObserversUsingBlock___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_observersQueue_changeObserversWithContexts, 0);
  objc_storeStrong((id *)&self->_observersQueue, 0);
  objc_storeStrong((id *)&self->_pendingChangeBlocks, 0);
}

- (BOOL)isPerformingChanges
{
  return self->_nestedChanges > 0;
}

- (void)performChanges:(id)a3
{
  void (**v5)(id, void *);
  NSMutableArray *pendingChangeBlocks;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  void *v13;
  void (**v14)(id, void *);

  v5 = (void (**)(id, void *))a3;
  v14 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXObservable.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changeBlock != nil"));

    v5 = 0;
  }
  if (self->_isEnumeratingObservers)
  {
    pendingChangeBlocks = self->_pendingChangeBlocks;
    if (pendingChangeBlocks)
    {
      v7 = (void *)objc_msgSend(v5, "copy");
      -[NSMutableArray addObject:](pendingChangeBlocks, "addObject:", v7);

    }
    else
    {
      v9 = (void *)MEMORY[0x24BDBCEB8];
      v10 = (void *)objc_msgSend(v5, "copy");
      objc_msgSend(v9, "arrayWithObject:", v10);
      v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v12 = self->_pendingChangeBlocks;
      self->_pendingChangeBlocks = v11;

    }
  }
  else
  {
    -[PXObservable _willChange](self, "_willChange");
    -[PXObservable mutableChangeObject](self, "mutableChangeObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v8);

    -[PXObservable _didChange](self, "_didChange");
  }

}

- (void)signalChange:(unint64_t)a3
{
  self->_currentChange |= a3;
}

- (void)_willChange
{
  int64_t nestedChanges;

  nestedChanges = self->_nestedChanges;
  if (!nestedChanges)
  {
    -[PXObservable willPerformChanges](self, "willPerformChanges");
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
    -[PXObservable didPerformChanges](self, "didPerformChanges");
    nestedChanges = self->_nestedChanges;
  }
  v4 = nestedChanges - 1;
  self->_nestedChanges = v4;
  if (!v4)
  {
    if (-[PXObservable shouldNotifyObserversAfterApplyingChangeBlocks](self, "shouldNotifyObserversAfterApplyingChangeBlocks"))
    {
      -[PXObservable _publishChanges](self, "_publishChanges");
      -[PXObservable didPublishChanges](self, "didPublishChanges");
      self->_currentChange = 0;
    }
    -[PXObservable didEndChangeHandling](self, "didEndChangeHandling");
    -[PXObservable _applyPendingChanges](self, "_applyPendingChanges");
  }
}

- (BOOL)shouldNotifyObserversAfterApplyingChangeBlocks
{
  return -[PXObservable currentChanges](self, "currentChanges") != 0;
}

- (unint64_t)currentChanges
{
  return self->_currentChange;
}

- (void)_applyPendingChanges
{
  int64_t numAppliedPendingChanges;
  NSObject *v5;
  NSMutableArray *pendingChangeBlocks;
  NSMutableArray *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  void *v10;
  _QWORD v11[4];
  NSMutableArray *v12;
  uint8_t buf[16];

  numAppliedPendingChanges = self->_numAppliedPendingChanges;
  self->_numAppliedPendingChanges = numAppliedPendingChanges + 1;
  if (numAppliedPendingChanges >= 39)
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_24430E000, v5, OS_LOG_TYPE_ERROR, "Change depth limit almost reached", buf, 2u);
    }

    if (self->_numAppliedPendingChanges >= 50)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXObservable.m"), 256, CFSTR("Change depth limit reached (%ld), this indicates infinite state ping-ponging, investigate the stack trace and figure out why the observable doesn't reach a stable state. Typically because two observers are trying to set different new values in response to the same change."), 50);

    }
  }
  pendingChangeBlocks = self->_pendingChangeBlocks;
  if (pendingChangeBlocks)
  {
    v7 = pendingChangeBlocks;
    v8 = self->_pendingChangeBlocks;
    self->_pendingChangeBlocks = 0;

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __36__PXObservable__applyPendingChanges__block_invoke;
    v11[3] = &unk_2514CFA40;
    v12 = v7;
    v9 = v7;
    -[PXObservable performChanges:](self, "performChanges:", v11);

  }
  --self->_numAppliedPendingChanges;
}

- (void)_publishChanges
{
  unint64_t currentChange;
  _QWORD v3[6];

  currentChange = self->_currentChange;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __31__PXObservable__publishChanges__block_invoke;
  v3[3] = &unk_2514CFA18;
  v3[4] = self;
  v3[5] = currentChange;
  -[PXObservable enumerateObserversUsingBlock:](self, "enumerateObserversUsingBlock:", v3);
}

void __36__PXObservable__applyPendingChanges__block_invoke(uint64_t a1, void *a2)
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

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
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

- (PXObservable)init
{
  PXObservable *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *observersQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXObservable;
  v2 = -[PXObservable init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.photosuifoundation.observable.internal-queue", 0);
    observersQueue = v2->_observersQueue;
    v2->_observersQueue = (OS_dispatch_queue *)v3;

    v2->_currentChange = 0;
    -[PXObservable setLog:](v2, "setLog:", 0);
    v2->_logContext = (unint64_t)v2;
  }
  return v2;
}

- (void)setLog:(id)a3
{
  OS_os_log *v4;
  const char *v5;
  objc_class *v6;
  id v7;
  OS_os_log *log;

  v4 = (OS_os_log *)a3;
  if (!v4)
  {
    v5 = (const char *)*MEMORY[0x24BE71BC8];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (OS_os_log *)os_log_create(v5, (const char *)objc_msgSend(v7, "UTF8String"));

  }
  log = self->_log;
  self->_log = v4;

}

void __49__PXObservable_unregisterChangeObserver_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_observersQueue_copyChangeObserversForWriteIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKey:", *(_QWORD *)(a1 + 40));
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
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObjectForKey:", *(_QWORD *)(a1 + 40));

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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__PXObservable_unregisterChangeObserver_context___block_invoke;
  block[3] = &unk_2514CF9C8;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(observersQueue, block);

}

- (void)copyLogConfigurationFrom:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(v4, "log");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXObservable setLog:](self, "setLog:", v5);

  v6 = objc_msgSend(v4, "logContext");
  -[PXObservable setLogContext:](self, "setLogContext:", v6);
}

- (BOOL)hasObservers
{
  return self->_hasObservers;
}

- (OS_os_log)log
{
  return self->_log;
}

- (unint64_t)logContext
{
  return self->_logContext;
}

- (void)setLogContext:(unint64_t)a3
{
  self->_logContext = a3;
}

@end
