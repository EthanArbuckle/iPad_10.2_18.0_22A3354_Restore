@implementation WFNetworkBehaviorMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_9);
  return (id)sharedInstance_s_sharedInstance;
}

void __42__WFNetworkBehaviorMonitor_sharedInstance__block_invoke()
{
  WFNetworkBehaviorMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(WFNetworkBehaviorMonitor);
  v1 = (void *)sharedInstance_s_sharedInstance;
  sharedInstance_s_sharedInstance = (uint64_t)v0;

}

- (WFNetworkBehaviorMonitor)init
{
  WFNetworkBehaviorMonitor *v2;
  uint64_t v3;
  NSHashTable *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFNetworkBehaviorMonitor;
  v2 = -[WFNetworkBehaviorMonitor init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

  }
  return v2;
}

- (void)logNetworkEvent:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__WFNetworkBehaviorMonitor_logNetworkEvent___block_invoke;
  v6[3] = &unk_24CCA17B0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __44__WFNetworkBehaviorMonitor_logNetworkEvent___block_invoke(uint64_t a1)
{
  void *v2;
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

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "networkEventMonitor:loggedEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFNetworkBehaviorMonitor observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFNetworkBehaviorMonitor observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
