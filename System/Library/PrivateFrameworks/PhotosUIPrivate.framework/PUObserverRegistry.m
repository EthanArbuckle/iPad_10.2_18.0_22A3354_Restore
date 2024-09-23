@implementation PUObserverRegistry

- (PUObserverRegistry)init
{
  PUObserverRegistry *v2;
  uint64_t v3;
  NSPointerArray *observers;
  dispatch_queue_t v5;
  OS_dispatch_queue *observerQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUObserverRegistry;
  v2 = -[PUObserverRegistry init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->__observers;
    v2->__observers = (NSPointerArray *)v3;

    v5 = dispatch_queue_create("com.apple.photosui.observerregistry.observer-queue", 0);
    observerQueue = v2->__observerQueue;
    v2->__observerQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)registerObserver:(id)a3
{
  id v4;
  NSObject *observerQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    observerQueue = self->__observerQueue;
    block[1] = 3221225472;
    block[2] = __39__PUObserverRegistry_registerObserver___block_invoke;
    block[3] = &unk_1E58ABCA8;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    dispatch_sync(observerQueue, block);

    v4 = v6;
  }

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  NSObject *observerQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    observerQueue = self->__observerQueue;
    block[1] = 3221225472;
    block[2] = __41__PUObserverRegistry_unregisterObserver___block_invoke;
    block[3] = &unk_1E58ABCA8;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    dispatch_sync(observerQueue, block);

    v4 = v6;
  }

}

- (void)enumerateObserversWithBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  NSObject *observerQueue;
  id v7;
  unint64_t v8;
  void *v9;
  void (**v10)(id, void *);
  _QWORD block[5];
  id v12;

  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    v10 = v4;
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    observerQueue = self->__observerQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__PUObserverRegistry_enumerateObserversWithBlock___block_invoke;
    block[3] = &unk_1E58ABCA8;
    block[4] = self;
    v7 = v5;
    v12 = v7;
    dispatch_sync(observerQueue, block);
    if (objc_msgSend(v7, "count"))
    {
      v8 = 0;
      do
      {
        objc_msgSend(v7, "pointerAtIndex:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10[2](v10, v9);

        ++v8;
      }
      while (v8 < objc_msgSend(v7, "count"));
    }

    v4 = v10;
  }

}

- (NSPointerArray)_observers
{
  return self->__observers;
}

- (OS_dispatch_queue)_observerQueue
{
  return self->__observerQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__observerQueue, 0);
  objc_storeStrong((id *)&self->__observers, 0);
}

void __50__PUObserverRegistry_enumerateObserversWithBlock___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_observers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v2 = 0;
    do
    {
      objc_msgSend(v4, "pointerAtIndex:", v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
        objc_msgSend(*(id *)(a1 + 40), "addPointer:", v3);

      ++v2;
    }
    while (v2 < objc_msgSend(v4, "count"));
  }

}

void __41__PUObserverRegistry_unregisterObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_observers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v2 = 0;
    while (objc_msgSend(v3, "pointerAtIndex:", v2) != *(_QWORD *)(a1 + 40))
    {
      if (++v2 >= (unint64_t)objc_msgSend(v3, "count"))
        goto LABEL_7;
    }
    objc_msgSend(v3, "removePointerAtIndex:", v2);
  }
LABEL_7:

}

void __39__PUObserverRegistry_registerObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_observers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v6, "count");
  v3 = v6;
  if (v2)
  {
    v4 = 0;
    while (objc_msgSend(v3, "pointerAtIndex:", v4) != *(_QWORD *)(a1 + 40))
    {
      ++v4;
      v5 = objc_msgSend(v6, "count");
      v3 = v6;
      if (v4 >= v5)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    objc_msgSend(v3, "addPointer:", *(_QWORD *)(a1 + 40));
  }

}

@end
