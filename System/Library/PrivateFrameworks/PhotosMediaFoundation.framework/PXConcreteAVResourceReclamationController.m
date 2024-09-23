@implementation PXConcreteAVResourceReclamationController

- (PXConcreteAVResourceReclamationController)init
{
  PXConcreteAVResourceReclamationController *v2;
  uint64_t v3;
  NSHashTable *observers;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *observersQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXConcreteAVResourceReclamationController;
  v2 = -[PXConcreteAVResourceReclamationController init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INITIATED, 0);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = dispatch_queue_create("com.apple.PXConcreteAVResourceReclamationController.observers", v6);
    observersQueue = v2->_observersQueue;
    v2->_observersQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (void)registerObserver:(id)a3
{
  id v4;
  NSObject *observersQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  observersQueue = self->_observersQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__PXConcreteAVResourceReclamationController_registerObserver___block_invoke;
  v7[3] = &unk_2514A2DF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(observersQueue, v7);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  NSObject *observersQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  observersQueue = self->_observersQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__PXConcreteAVResourceReclamationController_unregisterObserver___block_invoke;
  v7[3] = &unk_2514A2DF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(observersQueue, v7);

}

- (id)observationWithWeakTarget:(id)a3 selector:(SEL)a4
{
  id v6;
  PXResourceReclamationObservation *v7;

  v6 = a3;
  v7 = -[PXResourceReclamationObservation initWithController:weakTarget:selector:]([PXResourceReclamationObservation alloc], "initWithController:weakTarget:selector:", self, v6, a4);

  return v7;
}

- (id)takeAssertionPreventingResourceReclamationWithReason:(id)a3
{
  return 0;
}

- (void)setMostRecentReclamationEvent:(id)a3
{
  PXAVResourceReclamationEvent *v5;
  _QWORD v6[4];
  PXAVResourceReclamationEvent *v7;

  v5 = (PXAVResourceReclamationEvent *)a3;
  if (self->_mostRecentReclamationEvent != v5)
  {
    objc_storeStrong((id *)&self->_mostRecentReclamationEvent, a3);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __75__PXConcreteAVResourceReclamationController_setMostRecentReclamationEvent___block_invoke;
    v6[3] = &unk_2514A2E18;
    v7 = v5;
    -[PXConcreteAVResourceReclamationController _enumerateObservers:](self, "_enumerateObservers:", v6);

  }
}

- (void)_enumerateObservers:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *observersQueue;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD block[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  observersQueue = self->_observersQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__PXConcreteAVResourceReclamationController__enumerateObservers___block_invoke;
  block[3] = &unk_2514A2E40;
  block[4] = self;
  block[5] = &v15;
  dispatch_sync(observersQueue, block);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = (id)v16[5];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        if (*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9))
          v4[2](v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v21, 16);
    }
    while (v7);
  }

  _Block_object_dispose(&v15, 8);
}

- (PXAVResourceReclamationEvent)mostRecentReclamationEvent
{
  return self->_mostRecentReclamationEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentReclamationEvent, 0);
  objc_storeStrong((id *)&self->_observersQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __65__PXConcreteAVResourceReclamationController__enumerateObservers___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __75__PXConcreteAVResourceReclamationController_setMostRecentReclamationEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resourceReclamationEventDidOccur:", *(_QWORD *)(a1 + 32));
}

uint64_t __64__PXConcreteAVResourceReclamationController_unregisterObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __62__PXConcreteAVResourceReclamationController_registerObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", *(_QWORD *)(a1 + 40));
}

@end
