@implementation SOTimersPublisher

- (SOTimersPublisher)init
{
  SOTimersPublisher *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *timersPublisherQueue;
  dispatch_group_t v6;
  OS_dispatch_group *timersPublisherDispatchGroup;
  uint64_t v8;
  NSHashTable *subscribers;
  MTTimerManager *v10;
  MTTimerManager *timerManager;
  NSString *typeName;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SOTimersPublisher;
  v2 = -[SOTimersPublisher init](&v14, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("SOTimersPublisher", v3);
    timersPublisherQueue = v2->_timersPublisherQueue;
    v2->_timersPublisherQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_group_create();
    timersPublisherDispatchGroup = v2->_timersPublisherDispatchGroup;
    v2->_timersPublisherDispatchGroup = (OS_dispatch_group *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 5, 0);
    subscribers = v2->_subscribers;
    v2->_subscribers = (NSHashTable *)v8;

    v10 = (MTTimerManager *)objc_alloc_init((Class)getMTTimerManagerClass());
    timerManager = v2->_timerManager;
    v2->_timerManager = v10;

    typeName = v2->_typeName;
    v2->_typeName = (NSString *)CFSTR("SOTimersPublisher");

    -[SOTimersPublisher _startObserving](v2, "_startObserving");
  }
  return v2;
}

- (void)getCurrentSnapshotWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *timersPublisherDispatchGroup;
  NSObject *timersPublisherQueue;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    timersPublisherQueue = self->_timersPublisherQueue;
    timersPublisherDispatchGroup = self->_timersPublisherDispatchGroup;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __54__SOTimersPublisher_getCurrentSnapshotWithCompletion___block_invoke;
    v8[3] = &unk_24CE75E20;
    v8[4] = self;
    v9 = v4;
    dispatch_group_notify(timersPublisherDispatchGroup, timersPublisherQueue, v8);

  }
}

- (void)addSubscriber:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __35__SOTimersPublisher_addSubscriber___block_invoke;
    v6[3] = &unk_24CE75E48;
    v6[4] = self;
    v7 = v4;
    -[SOTimersPublisher getCurrentSnapshotWithCompletion:](self, "getCurrentSnapshotWithCompletion:", v6);

  }
}

- (void)removeSubscriber:(id)a3
{
  id v4;
  void *v5;
  NSObject *timersPublisherQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    timersPublisherQueue = self->_timersPublisherQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __38__SOTimersPublisher_removeSubscriber___block_invoke;
    v7[3] = &unk_24CE75E70;
    v7[4] = self;
    v8 = v4;
    dispatch_async(timersPublisherQueue, v7);

  }
}

- (void)timersAdded:(id)a3
{
  -[SOTimersPublisher _notifySubscribersOfEvent:](self, "_notifySubscribersOfEvent:", 2);
}

- (void)timersUpdated:(id)a3
{
  -[SOTimersPublisher _notifySubscribersOfEvent:](self, "_notifySubscribersOfEvent:", 6);
}

- (void)timersRemoved:(id)a3
{
  -[SOTimersPublisher _notifySubscribersOfEvent:](self, "_notifySubscribersOfEvent:", 3);
}

- (void)timerFired:(id)a3
{
  -[SOTimersPublisher _notifySubscribersOfEvent:](self, "_notifySubscribersOfEvent:", 4);
}

- (void)firingTimerChanged:(id)a3
{
  -[SOTimersPublisher _notifySubscribersOfEvent:](self, "_notifySubscribersOfEvent:", 7);
}

- (void)firingTimerDismissed:(id)a3
{
  -[SOTimersPublisher _notifySubscribersOfEvent:](self, "_notifySubscribersOfEvent:", 5);
}

- (void)stateReset:(id)a3
{
  -[SOTimersPublisher _notifySubscribersOfEvent:](self, "_notifySubscribersOfEvent:", 1);
}

- (void)_notifySubscribersOfEvent:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __47__SOTimersPublisher__notifySubscribersOfEvent___block_invoke;
  v3[3] = &unk_24CE75E98;
  v3[4] = self;
  v3[5] = a3;
  -[SOTimersPublisher _createNewSnapshotWithCompletion:](self, "_createNewSnapshotWithCompletion:", v3);
}

- (void)_startObserving
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (self->_timerManager)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    getMTTimerManagerTimersAdded();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_timersAdded_, v3, self->_timerManager);

    getMTTimerManagerTimersUpdated();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_timersUpdated_, v4, self->_timerManager);

    getMTTimerManagerTimersRemoved();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_timersRemoved_, v5, self->_timerManager);

    getMTTimerManagerTimerFired();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_timerFired_, v6, self->_timerManager);

    getMTTimerManagerFiringTimerChanged();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_firingTimerChanged_, v7, self->_timerManager);

    getMTTimerManagerFiringTimerDismissed();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_firingTimerDismissed_, v8, self->_timerManager);

    getMTTimerManagerStateReset();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_stateReset_, v9, self->_timerManager);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SOTimersPublisher;
  -[SOTimersPublisher dealloc](&v4, sel_dealloc);
}

- (void)_createNewSnapshotWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  dispatch_group_enter((dispatch_group_t)self->_timersPublisherDispatchGroup);
  -[MTTimerManager timers](self->_timerManager, "timers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __54__SOTimersPublisher__createNewSnapshotWithCompletion___block_invoke;
    v12[3] = &unk_24CE75EE8;
    v12[4] = self;
    v7 = v4;
    v13 = v7;
    v8 = (id)objc_msgSend(v5, "addSuccessBlock:", v12);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __54__SOTimersPublisher__createNewSnapshotWithCompletion___block_invoke_3;
    v10[3] = &unk_24CE75F10;
    v10[4] = self;
    v11 = v7;
    v9 = (id)objc_msgSend(v5, "addFailureBlock:", v10);

  }
}

- (NSString)typeName
{
  return self->_typeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeName, 0);
  objc_storeStrong((id *)&self->_timerSnapshot, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_timersPublisherDispatchGroup, 0);
  objc_storeStrong((id *)&self->_timersPublisherQueue, 0);
}

void __54__SOTimersPublisher__createNewSnapshotWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t i;
  void *v4;
  void *v5;
  SOTimer *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  SOTimer *v23;
  SOTimersSnapshot *v24;
  void *v25;
  SOTimersSnapshot *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  SOTimersSnapshot *v30;
  id obj;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  _QWORD block[5];
  SOTimersSnapshot *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v34 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v2;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v35)
  {
    v33 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v42 != v33)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v4, "timerID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = [SOTimer alloc];
        objc_msgSend(v4, "timerURL");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v4, "isFiring");
        objc_msgSend(v4, "title");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v4, "state");
        objc_msgSend(v4, "duration");
        v12 = v11;
        objc_msgSend(v4, "siriContext");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MTTimerIntentSupportSiriContextTimerTypeKey"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v36 = v10;
        v37 = (void *)v9;
        if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v15 = (void *)v7;
          v16 = objc_msgSend(v14, "integerValue");
        }
        else
        {
          v15 = (void *)v7;
          v16 = 1;
        }

        objc_msgSend(v4, "remainingTime");
        v18 = v17;
        objc_msgSend(v4, "fireDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "firedDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "dismissedDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "lastModifiedDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[SOTimer initWithTimerID:timerURL:isFiring:title:state:duration:type:fireTimeInterval:fireDate:firedDate:dismissedDate:lastModifiedDate:](v6, "initWithTimerID:timerURL:isFiring:title:state:duration:type:fireTimeInterval:fireDate:firedDate:dismissedDate:lastModifiedDate:", v5, v15, v8, v37, v36, v16, v12, v18, v19, v20, v21, v22);

        objc_msgSend(v34, "setObject:forKey:", v23, v5);
      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v35);
  }

  v24 = [SOTimersSnapshot alloc];
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[SOTimersSnapshot initWithDate:timersByID:](v24, "initWithDate:timersByID:", v25, v34);

  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(void **)(a1 + 40);
  v29 = *(NSObject **)(v27 + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__SOTimersPublisher__createNewSnapshotWithCompletion___block_invoke_2;
  block[3] = &unk_24CE75EC0;
  block[4] = v27;
  v39 = v26;
  v40 = v28;
  v30 = v26;
  dispatch_async(v29, block);

}

void __54__SOTimersPublisher__createNewSnapshotWithCompletion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 16));
}

void __54__SOTimersPublisher__createNewSnapshotWithCompletion___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 16));
}

void __47__SOTimersPublisher__notifySubscribersOfEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (v5 && !a3)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "snapshotAvailable:forEvent:", v5, *(_QWORD *)(a1 + 40), (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

uint64_t __38__SOTimersPublisher_removeSubscriber___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

void __35__SOTimersPublisher_addSubscriber___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
  if (v5)
    NSLog(CFSTR("SOTimersPublisher received error code when trying to create new snapshot for subscriber: %@"), v5);
  else
    objc_msgSend(*(id *)(a1 + 40), "snapshotAvailable:forEvent:", v6, 0);

}

uint64_t __54__SOTimersPublisher_getCurrentSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = v2[5];
  if (v4)
    return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 40), v4, 0);
  else
    return objc_msgSend(v2, "_createNewSnapshotWithCompletion:", v3);
}

@end
