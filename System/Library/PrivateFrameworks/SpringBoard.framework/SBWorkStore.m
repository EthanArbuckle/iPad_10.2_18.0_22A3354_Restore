@implementation SBWorkStore

- (SBWorkStore)initWithMaximumNumberOfWorkItemsPerKey:(unint64_t)a3
{
  SBWorkStore *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *workItemsPerKey;
  NSMutableArray *v7;
  NSMutableArray *keysWithWork;
  NSMutableDictionary *v9;
  NSMutableDictionary *workExpirationPeriods;
  uint64_t Serial;
  OS_dispatch_queue *workQueue;
  uint64_t v13;
  OS_dispatch_queue *observerQueue;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBWorkStore;
  v4 = -[SBWorkStore init](&v16, sel_init);
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    workItemsPerKey = v4->_workItemsPerKey;
    v4->_workItemsPerKey = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    keysWithWork = v4->_keysWithWork;
    v4->_keysWithWork = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    workExpirationPeriods = v4->_workExpirationPeriods;
    v4->_workExpirationPeriods = v9;

    Serial = BSDispatchQueueCreateSerial();
    workQueue = v4->_workQueue;
    v4->_workQueue = (OS_dispatch_queue *)Serial;

    v13 = BSDispatchQueueCreateSerial();
    observerQueue = v4->_observerQueue;
    v4->_observerQueue = (OS_dispatch_queue *)v13;

    v4->_maxWorkPerKey = a3;
  }
  return v4;
}

- (NSArray)keysWithWork
{
  NSObject *workQueue;
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
  v9 = __Block_byref_object_copy__103;
  v10 = __Block_byref_object_dispose__103;
  v11 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__SBWorkStore_keysWithWork__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __27__SBWorkStore_keysWithWork__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *observerQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    observerQueue = self->_observerQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __27__SBWorkStore_addObserver___block_invoke;
    v7[3] = &unk_1E8E9E820;
    v7[4] = self;
    v8 = v4;
    dispatch_async(observerQueue, v7);

  }
}

uint64_t __27__SBWorkStore_addObserver___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *observerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__SBWorkStore_removeObserver___block_invoke;
  v7[3] = &unk_1E8E9E820;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(observerQueue, v7);

}

uint64_t __30__SBWorkStore_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)addWorkItem:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *workQueue;
  _QWORD block[4];
  id v11;
  SBWorkStore *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__SBWorkStore_addWorkItem_forKey___block_invoke;
    block[3] = &unk_1E8E9E270;
    v11 = v7;
    v12 = self;
    v13 = v6;
    dispatch_async(workQueue, block);

  }
}

void __34__SBWorkStore_addWorkItem_forKey___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  id v6;

  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKey:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKey:", v2, v6);
  }
  objc_msgSend(*(id *)(a1 + 40), "_workQueue_expireWorkForKey:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "insertObject:atIndex:", *(_QWORD *)(a1 + 48), 0);
  v3 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v3 + 40))
  {
    v4 = objc_msgSend(v2, "count");
    v3 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(v3 + 40);
    if (v4 > v5)
    {
      objc_msgSend(v2, "removeObjectsInRange:", v5, objc_msgSend(v2, "count") - *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
      v3 = *(_QWORD *)(a1 + 40);
    }
  }
  objc_msgSend(*(id *)(v3 + 16), "removeObject:", v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "insertObject:atIndex:", v6, 0);
  objc_msgSend(*(id *)(a1 + 40), "_notifyObserversWorkDidChange");

}

- (id)dequeueWorkForKey:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  SBWorkStore *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__103;
  v17 = __Block_byref_object_dispose__103;
  v18 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SBWorkStore_dequeueWorkForKey___block_invoke;
  block[3] = &unk_1E8EA4CE8;
  v10 = v4;
  v11 = self;
  v12 = &v13;
  v6 = v4;
  dispatch_sync(workQueue, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __33__SBWorkStore_dequeueWorkForKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKey:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 40), "_workQueue_expireWorkForKey:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKey:", *(_QWORD *)(a1 + 32));
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = v3;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeObject:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 40), "_notifyObserversWorkDidChange");
    }
  }
}

- (void)purgeWorkForKey:(id)a3
{
  id v3;

  v3 = -[SBWorkStore dequeueWorkForKey:](self, "dequeueWorkForKey:", a3);
}

- (void)setWorkExpirationPeriod:(double)a3 forKey:(id)a4
{
  id v6;
  NSObject *workQueue;
  id v8;
  _QWORD block[4];
  id v10;
  SBWorkStore *v11;
  double v12;

  v6 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SBWorkStore_setWorkExpirationPeriod_forKey___block_invoke;
  block[3] = &unk_1E8EA0AF0;
  v10 = v6;
  v11 = self;
  v12 = a3;
  v8 = v6;
  dispatch_sync(workQueue, block);

}

void __46__SBWorkStore_setWorkExpirationPeriod_forKey___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v3, *(_QWORD *)(a1 + 32));

  }
}

- (void)_workQueue_expireWorkForKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double defaultWorkExpirationPeriod;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v4 = a3;
  if (v4)
  {
    v19 = v4;
    -[NSMutableDictionary objectForKey:](self->_workItemsPerKey, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    v4 = v19;
    if (v6)
    {
      defaultWorkExpirationPeriod = self->_defaultWorkExpirationPeriod;
      -[NSMutableDictionary objectForKey:](self->_workExpirationPeriods, "objectForKey:", v19);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "doubleValue");
        defaultWorkExpirationPeriod = v10;
      }
      if (defaultWorkExpirationPeriod > 0.0)
      {
        -[NSMutableDictionary objectForKey:](self->_workItemsPerKey, "objectForKey:", v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dateByAddingTimeInterval:", -defaultWorkExpirationPeriod);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "count"))
        {
          v14 = 0;
          v15 = 0;
          do
          {
            objc_msgSend(v11, "objectAtIndex:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "creationDate");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "compare:", v13);

            if (v18 == -1)
            {
              objc_msgSend(v11, "removeObjectAtIndex:", v14);
              --v15;
            }
            v14 = ++v15;
          }
          while (objc_msgSend(v11, "count") > (unint64_t)v15);
        }

      }
      v4 = v19;
    }
  }

}

- (void)_notifyObserversWorkDidChange
{
  NSObject *observerQueue;
  _QWORD block[5];

  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SBWorkStore__notifyObserversWorkDidChange__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(observerQueue, block);
}

void __44__SBWorkStore__notifyObserversWorkDidChange__block_invoke(uint64_t a1)
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
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "workDidChange:", *(_QWORD *)(a1 + 32), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p; maxWork: %d>"),
               objc_opt_class(),
               self,
               self->_maxWorkPerKey);
}

- (id)debugDescription
{
  NSObject *workQueue;
  void *v4;
  _QWORD block[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__103;
  v17 = __Block_byref_object_dispose__103;
  v18 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__103;
  v11 = __Block_byref_object_dispose__103;
  v12 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__SBWorkStore_debugDescription__block_invoke;
  block[3] = &unk_1E8EBCF00;
  block[4] = self;
  block[5] = &v19;
  block[6] = &v13;
  block[7] = &v7;
  dispatch_sync(workQueue, block);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p; maxWork: %d \nkeysWithWork: %@ \nwork: %@>"),
    objc_opt_class(),
    self,
    v20[3],
    v14[5],
    v8[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v4;
}

void __31__SBWorkStore_debugDescription__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(a1[4] + 40);
  v2 = objc_msgSend(*(id *)(a1[4] + 16), "copy");
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = objc_msgSend(*(id *)(a1[4] + 8), "copy");
  v6 = *(_QWORD *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (double)defaultWorkExpirationPeriod
{
  return self->_defaultWorkExpirationPeriod;
}

- (void)setDefaultWorkExpirationPeriod:(double)a3
{
  self->_defaultWorkExpirationPeriod = a3;
}

- (NSMutableDictionary)workItemsPerKey
{
  return self->_workItemsPerKey;
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (unint64_t)maxWorkPerKey
{
  return self->_maxWorkPerKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_workExpirationPeriods, 0);
  objc_storeStrong((id *)&self->_keysWithWork, 0);
  objc_storeStrong((id *)&self->_workItemsPerKey, 0);
}

@end
