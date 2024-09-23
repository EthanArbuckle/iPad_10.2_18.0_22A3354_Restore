@implementation RBPrewarmManager

- (void)identityDidTerminate:(id)a3
{
  id v4;
  void *v5;
  NSObject *prewarmingQueue;
  _QWORD block[5];
  id v8;
  id v9;

  v4 = a3;
  os_unfair_lock_lock(&self->_dataLock);
  -[NSDictionary objectForKey:](self->_currentConfiguration, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    prewarmingQueue = self->_prewarmingQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__RBPrewarmManager_identityDidTerminate___block_invoke;
    block[3] = &unk_24DD45E60;
    block[4] = self;
    v8 = v4;
    v9 = v5;
    dispatch_async(prewarmingQueue, block);

  }
  os_unfair_lock_unlock(&self->_dataLock);

}

- (id)_prewarmingQueue
{
  return self->_prewarmingQueue;
}

- (RBPrewarmManager)initWithDelegate:(id)a3 timeProvider:(id)a4
{
  id v7;
  id v8;
  void *v9;
  RBPrewarmManager *v10;
  RBPrewarmManager *v11;
  uint64_t v12;
  OS_dispatch_queue *prewarmingQueue;
  RBPrewarmManager *v14;
  void *v16;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBPrewarmManager.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBPrewarmManager.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timeProvider"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)RBPrewarmManager;
  v10 = -[RBPrewarmManager init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v7);
    objc_storeStrong((id *)&v11->_timeProvider, a4);
    v12 = objc_msgSend(MEMORY[0x24BE80D58], "createBackgroundQueue:", CFSTR("RBPrewarmManager"));
    prewarmingQueue = v11->_prewarmingQueue;
    v11->_prewarmingQueue = (OS_dispatch_queue *)v12;

    v11->_dataLock._os_unfair_lock_opaque = 0;
    v14 = v11;
  }

  return v11;
}

- (void)_queue_runPrewarm
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  RBProcessManaging **p_delegate;
  uint64_t i;
  void *v8;
  void *v9;
  id WeakRetained;
  NSMutableSet *pendingPrewarms;
  RBPrewarmManager *v12;
  NSMutableSet *obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_prewarmingQueue);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = self;
  obj = self->_pendingPrewarms;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    p_delegate = &self->_delegate;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x24BE80BE8], "contextWithIdentity:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setExplanation:", CFSTR("RunningBoard Prewarming"));
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE80BF8]), "initWithContext:", v8);
        WeakRetained = objc_loadWeakRetained((id *)p_delegate);
        objc_msgSend(WeakRetained, "executeLaunchRequest:withCompletion:", v9, &__block_literal_global_9);

      }
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

  pendingPrewarms = v12->_pendingPrewarms;
  v12->_pendingPrewarms = 0;

}

- (void)_queue_addPrewarmForIdentity:(id)a3
{
  id v4;
  NSMutableSet *pendingPrewarms;
  NSMutableSet *v6;
  NSMutableSet *v7;
  NSObject *prewarmingQueue;
  _QWORD block[5];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_prewarmingQueue);
  pendingPrewarms = self->_pendingPrewarms;
  if (!pendingPrewarms)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_pendingPrewarms;
    self->_pendingPrewarms = v6;

    prewarmingQueue = self->_prewarmingQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__RBPrewarmManager__queue_addPrewarmForIdentity___block_invoke;
    block[3] = &unk_24DD46160;
    block[4] = self;
    dispatch_async(prewarmingQueue, block);
    pendingPrewarms = self->_pendingPrewarms;
  }
  -[NSMutableSet addObject:](pendingPrewarms, "addObject:", v4);

}

uint64_t __49__RBPrewarmManager__queue_addPrewarmForIdentity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_runPrewarm");
}

- (void)_queue_checkForNewPrewarms
{
  NSDictionary *v3;
  NSDictionary *v4;
  _QWORD v5[4];
  NSDictionary *v6;
  RBPrewarmManager *v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_prewarmingQueue);
  os_unfair_lock_lock(&self->_dataLock);
  v4 = self->_lastAppliedConfiguration;
  objc_storeStrong((id *)&self->_lastAppliedConfiguration, self->_currentConfiguration);
  v3 = self->_currentConfiguration;
  os_unfair_lock_unlock(&self->_dataLock);
  if (v4 != v3 && (!v4 || !v3 || (-[NSDictionary isEqual:](v4, "isEqual:", v3) & 1) == 0))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __46__RBPrewarmManager__queue_checkForNewPrewarms__block_invoke;
    v5[3] = &unk_24DD46C10;
    v6 = v4;
    v7 = self;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v3, "enumerateKeysAndObjectsUsingBlock:", v5);

  }
}

void __46__RBPrewarmManager__queue_checkForNewPrewarms__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v11 = v5;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_msgSend(v6, "doubleValue"), v9 = v8, objc_msgSend(v7, "doubleValue"), v9 < v10))
    objc_msgSend(*(id *)(a1 + 40), "_queue_addPrewarmForIdentity:", v11);

}

- (void)_queue_schedulePrewarmForIdentity:(id)a3 withInterval:(id)a4
{
  id v6;
  id v7;
  RBEventQueue *v8;
  RBEventQueue *prewarmingEventQueue;
  NSMutableSet *pendingPrewarms;
  double v11;
  double v12;
  RBEventQueueEvent *v15;
  double v16;
  _QWORD v17[5];

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_prewarmingQueue);
  if (!self->_prewarmingEventQueue)
  {
    v8 = -[RBEventQueue initWithQueue:timeProvider:]([RBEventQueue alloc], "initWithQueue:timeProvider:", self->_prewarmingQueue, self->_timeProvider);
    prewarmingEventQueue = self->_prewarmingEventQueue;
    self->_prewarmingEventQueue = v8;

  }
  pendingPrewarms = self->_pendingPrewarms;
  if (!pendingPrewarms || (-[NSMutableSet containsObject:](pendingPrewarms, "containsObject:", v6) & 1) == 0)
  {
    objc_msgSend(v7, "doubleValue");
    v12 = v11;
    if (v11 == 0.0)
      -[RBPrewarmManager _queue_addPrewarmForIdentity:](self, "_queue_addPrewarmForIdentity:", v6);
    if (v12 >= 0.0 && ((*(_QWORD *)&v12 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 <= 0x3FE
      || (unint64_t)(*(_QWORD *)&v12 - 1) <= 0xFFFFFFFFFFFFELL)
    {
      v15 = objc_alloc_init(RBEventQueueEvent);
      -[RBEventQueueEvent setContext:](v15, "setContext:", v6);
      -[RBTimeProviding currentTime](self->_timeProvider, "currentTime");
      -[RBEventQueueEvent setEventTime:](v15, "setEventTime:", v12 + v16);
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __67__RBPrewarmManager__queue_schedulePrewarmForIdentity_withInterval___block_invoke;
      v17[3] = &unk_24DD46C38;
      v17[4] = self;
      -[RBEventQueueEvent setAction:](v15, "setAction:", v17);
      -[RBEventQueue addEvent:](self->_prewarmingEventQueue, "addEvent:", v15);

    }
  }

}

void __67__RBPrewarmManager__queue_schedulePrewarmForIdentity_withInterval___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "context");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_queue_addPrewarmForIdentity:", v3);

}

- (void)prewarmingConfigurationDidChange:(id)a3
{
  NSDictionary *v4;
  NSDictionary *currentConfiguration;
  NSDictionary *v6;
  NSObject *prewarmingQueue;
  _QWORD block[5];

  v4 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_dataLock);
  currentConfiguration = self->_currentConfiguration;
  self->_currentConfiguration = v4;
  v6 = v4;

  os_unfair_lock_unlock(&self->_dataLock);
  prewarmingQueue = self->_prewarmingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__RBPrewarmManager_prewarmingConfigurationDidChange___block_invoke;
  block[3] = &unk_24DD46160;
  block[4] = self;
  dispatch_async(prewarmingQueue, block);

}

uint64_t __53__RBPrewarmManager_prewarmingConfigurationDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_checkForNewPrewarms");
}

uint64_t __41__RBPrewarmManager_identityDidTerminate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_schedulePrewarmForIdentity:withInterval:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_lastAppliedConfiguration, 0);
  objc_storeStrong((id *)&self->_prewarmingEventQueue, 0);
  objc_storeStrong((id *)&self->_pendingPrewarms, 0);
  objc_storeStrong((id *)&self->_prewarmingQueue, 0);
  objc_storeStrong((id *)&self->_timeProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
