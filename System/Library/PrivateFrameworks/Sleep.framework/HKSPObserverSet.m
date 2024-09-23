@implementation HKSPObserverSet

- (HKSPObserverSet)init
{
  void *v3;
  HKSPObserverSet *v4;

  objc_msgSend(MEMORY[0x1E0D519E8], "hkspMainThreadScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKSPObserverSet initWithCallbackScheduler:](self, "initWithCallbackScheduler:", v3);

  return v4;
}

- (HKSPObserverSet)initWithCallbackScheduler:(id)a3
{
  id v4;
  HKSPObserverSet *v5;
  HKSPObserverSet *v6;
  NAScheduler *v7;
  void *callbackScheduler;
  uint64_t v9;
  NAScheduler *v10;
  uint64_t v11;
  NSMapTable *observerRecords;
  HKSPObserverSet *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKSPObserverSet;
  v5 = -[HKSPObserverSet init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v7 = (NAScheduler *)v4;
      callbackScheduler = v6->_callbackScheduler;
      v6->_callbackScheduler = v7;
    }
    else
    {
      HKSPDispatchQueueName(v5, 0);
      callbackScheduler = (void *)objc_claimAutoreleasedReturnValue();
      HKSPSerialQueueBackedSchedulerWithQoS(callbackScheduler, QOS_CLASS_UNSPECIFIED);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v6->_callbackScheduler;
      v6->_callbackScheduler = (NAScheduler *)v9;

    }
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v11 = objc_claimAutoreleasedReturnValue();
    observerRecords = v6->_observerRecords;
    v6->_observerRecords = (NSMapTable *)v11;

    v6->_observersLock._os_unfair_lock_opaque = 0;
    v13 = v6;
  }

  return v6;
}

- (void)addObserver:(id)a3 callbackScheduler:(id)a4 wasFirst:(BOOL *)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL *v17;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPObserverSet.m"), 63, CFSTR("observer cannot be nil"));

  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__HKSPObserverSet_addObserver_callbackScheduler_wasFirst___block_invoke;
  v14[3] = &unk_1E4E3AE58;
  v14[4] = self;
  v15 = v9;
  v16 = v10;
  v17 = a5;
  v11 = v10;
  v12 = v9;
  -[HKSPObserverSet _withLock:](self, "_withLock:", v14);

}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  void (**v4)(_QWORD);

  p_observersLock = &self->_observersLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_observersLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_observersLock);
}

void __58__HKSPObserverSet_addObserver_callbackScheduler_wasFirst___block_invoke(uint64_t a1)
{
  void *v2;
  _HKSPObserverRecord *v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v3 = -[_HKSPObserverRecord initWithObserver:callbackScheduler:]([_HKSPObserverRecord alloc], "initWithObserver:callbackScheduler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(v2, "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));

  if (*(_QWORD *)(a1 + 56))
    **(_BYTE **)(a1 + 56) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count") == 1;
}

- (void)addObserver:(id)a3 wasFirst:(BOOL *)a4
{
  -[HKSPObserverSet addObserver:callbackScheduler:wasFirst:](self, "addObserver:callbackScheduler:wasFirst:", a3, self->_callbackScheduler, a4);
}

- (void)addObserver:(id)a3
{
  -[HKSPObserverSet addObserver:wasFirst:](self, "addObserver:wasFirst:", a3, 0);
}

- (void)addObserver:(id)a3 callbackScheduler:(id)a4
{
  -[HKSPObserverSet addObserver:callbackScheduler:wasFirst:](self, "addObserver:callbackScheduler:wasFirst:", a3, a4, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerRecords, 0);
  objc_storeStrong((id *)&self->_callbackScheduler, 0);
}

- (void)removeObserver:(id)a3
{
  -[HKSPObserverSet removeObserver:wasLast:](self, "removeObserver:wasLast:", a3, 0);
}

- (void)removeObserver:(id)a3 wasLast:(BOOL *)a4
{
  id v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  BOOL *v12;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPObserverSet.m"), 78, CFSTR("observer cannot be nil"));

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__HKSPObserverSet_removeObserver_wasLast___block_invoke;
  v10[3] = &unk_1E4E3AE80;
  v10[4] = self;
  v11 = v7;
  v12 = a4;
  v8 = v7;
  -[HKSPObserverSet _withLock:](self, "_withLock:", v10);

}

uint64_t __42__HKSPObserverSet_removeObserver_wasLast___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48))
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
    **(_BYTE **)(a1 + 48) = result == 0;
  }
  return result;
}

- (void)removeAllObservers
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __37__HKSPObserverSet_removeAllObservers__block_invoke;
  v2[3] = &unk_1E4E3AF48;
  v2[4] = self;
  -[HKSPObserverSet _withLock:](self, "_withLock:", v2);
}

uint64_t __37__HKSPObserverSet_removeAllObservers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
}

- (void)enumerateObserversWithBlock:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__HKSPObserverSet_enumerateObserversWithBlock___block_invoke;
  v7[3] = &unk_1E4E3AEA8;
  v8 = v4;
  v5 = v4;
  v6 = -[HKSPObserverSet enumerateObserversWithFutureBlock:](self, "enumerateObserversWithFutureBlock:", v7);

}

uint64_t __47__HKSPObserverSet_enumerateObserversWithBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (id)enumerateObserversWithFutureBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NAScheduler *v12;
  NAScheduler *callbackScheduler;
  NAScheduler *v14;
  void *v15;
  id v16;
  void *v17;
  HKSPObserverSet *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __53__HKSPObserverSet_enumerateObserversWithFutureBlock___block_invoke;
  v27[3] = &unk_1E4E3AED0;
  v27[4] = self;
  v27[5] = &v28;
  v19 = self;
  -[HKSPObserverSet _withLock:](self, "_withLock:", v27);
  v5 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = (id)v29[5];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v10, "observer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "callbackScheduler");
          v12 = (NAScheduler *)objc_claimAutoreleasedReturnValue();
          callbackScheduler = v12;
          if (!v12)
            callbackScheduler = v19->_callbackScheduler;
          v14 = callbackScheduler;

          v15 = (void *)objc_opt_new();
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __53__HKSPObserverSet_enumerateObserversWithFutureBlock___block_invoke_2;
          v20[3] = &unk_1E4E3AEF8;
          v22 = v4;
          v20[4] = v10;
          v16 = v15;
          v21 = v16;
          -[NAScheduler performBlock:](v14, "performBlock:", v20);
          objc_msgSend(v5, "addObject:", v16);

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v28, 8);
  return v17;
}

void __53__HKSPObserverSet_enumerateObserversWithFutureBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectEnumerator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __53__HKSPObserverSet_enumerateObserversWithFutureBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "observer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "completionHandlerAdapter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "addCompletionBlock:", v4);

}

- (BOOL)containsObserver:(id)a3
{
  id v5;
  id v6;
  char v7;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPObserverSet.m"), 125, CFSTR("observer cannot be nil"));

  }
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __36__HKSPObserverSet_containsObserver___block_invoke;
  v10[3] = &unk_1E4E3AF20;
  v12 = &v13;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  -[HKSPObserverSet _withLock:](self, "_withLock:", v10);
  v7 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __36__HKSPObserverSet_containsObserver___block_invoke(_QWORD *a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v2 != 0;

}

- (unint64_t)count
{
  unint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __24__HKSPObserverSet_count__block_invoke;
  v4[3] = &unk_1E4E3AED0;
  v4[4] = self;
  v4[5] = &v5;
  -[HKSPObserverSet _withLock:](self, "_withLock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __24__HKSPObserverSet_count__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)description
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__HKSPObserverSet_description__block_invoke;
  v4[3] = &unk_1E4E3AED0;
  v4[4] = self;
  v4[5] = &v5;
  -[HKSPObserverSet _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __30__HKSPObserverSet_description__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "dictionaryRepresentation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NAScheduler)callbackScheduler
{
  return self->_callbackScheduler;
}

- (os_unfair_lock_s)observersLock
{
  return self->_observersLock;
}

- (NSMapTable)observerRecords
{
  return self->_observerRecords;
}

@end
