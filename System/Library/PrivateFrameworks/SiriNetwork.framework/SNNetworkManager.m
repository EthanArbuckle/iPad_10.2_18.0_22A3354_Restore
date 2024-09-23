@implementation SNNetworkManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_0);
  return (id)sharedInstance_sSharedInstance_0;
}

void __34__SNNetworkManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SNNetworkManager _init]([SNNetworkManager alloc], "_init");
  v1 = (void *)sharedInstance_sSharedInstance_0;
  sharedInstance_sSharedInstance_0 = (uint64_t)v0;

}

- (id)_init
{
  SNNetworkManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSHashTable *observers;
  uint64_t v7;
  SNNetworkManagerInternal *underlyingNetworkManager;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SNNetworkManager;
  v2 = -[SNNetworkManager init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("SNNetworkManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 5, 1);
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    +[SNNetworkManagerInternal shared](SNNetworkManagerInternal, "shared");
    v7 = objc_claimAutoreleasedReturnValue();
    underlyingNetworkManager = v2->_underlyingNetworkManager;
    v2->_underlyingNetworkManager = (SNNetworkManagerInternal *)v7;

  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__SNNetworkManager_addObserver___block_invoke;
  block[3] = &unk_25183F7A8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __32__SNNetworkManager_addObserver___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained[1], "addObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained[3], "addObserver:");

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__SNNetworkManager_removeObserver___block_invoke;
  block[3] = &unk_25183F7A8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __35__SNNetworkManager_removeObserver___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained[1], "removeObject:", *(_QWORD *)(a1 + 32));
  if (!objc_msgSend(WeakRetained[1], "count"))
    objc_msgSend(WeakRetained[3], "removeObserver:");

}

- (void)startMonitoringNetworkForHost:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__SNNetworkManager_startMonitoringNetworkForHost___block_invoke;
  block[3] = &unk_25183F7A8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __50__SNNetworkManager_startMonitoringNetworkForHost___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained[3], "startMonitoringNetwork:", *(_QWORD *)(a1 + 32));

}

- (void)stopMonitoringNetwork
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__SNNetworkManager_stopMonitoringNetwork__block_invoke;
  v4[3] = &unk_25183F7D0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __41__SNNetworkManager_stopMonitoringNetwork__block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[3], "stopMonitoringNetwork");

}

- (void)acquireWiFiAssertion:(int64_t)a3
{
  NSObject *queue;
  _QWORD block[4];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SNNetworkManager_acquireWiFiAssertion___block_invoke;
  block[3] = &unk_25183F7F8;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __41__SNNetworkManager_acquireWiFiAssertion___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[3], "acquireWiFiAssertionWithWifiAssertionTypeRawValue:", *(_QWORD *)(a1 + 40));

}

- (void)releaseWiFiAssertion
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__SNNetworkManager_releaseWiFiAssertion__block_invoke;
  v4[3] = &unk_25183F7D0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __40__SNNetworkManager_releaseWiFiAssertion__block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[3], "releaseWiFiAssertion");

}

- (void)forceFastDormancy
{
  -[SNNetworkManagerInternal forceFastDormancy](self->_underlyingNetworkManager, "forceFastDormancy");
}

+ (void)acquireDormancySuspendAssertion:(const void *)a3
{
  +[SNNetworkManagerInternal acquireDormancySuspendAssertion:](SNNetworkManagerInternal, "acquireDormancySuspendAssertion:", a3);
}

+ (void)releaseDormancySuspendAssertion:(const void *)a3
{
  +[SNNetworkManagerInternal releaseDormancySuspendAssertion:](SNNetworkManagerInternal, "releaseDormancySuspendAssertion:", a3);
}

- (void)registerClient
{
  -[SNNetworkManagerInternal registerClient](self->_underlyingNetworkManager, "registerClient");
}

- (void)unregisterClient
{
  -[SNNetworkManagerInternal unregisterClient](self->_underlyingNetworkManager, "unregisterClient");
}

- (void)resetLinkRecommendationInfo
{
  -[SNNetworkManagerInternal resetLinkRecommendationInfo](self->_underlyingNetworkManager, "resetLinkRecommendationInfo");
}

- (void)getLinkRecommendation:(BOOL)a3 recommendation:(id)a4
{
  -[SNNetworkManagerInternal getSNProximityLinkRecommendationWithRetry:completion:](self->_underlyingNetworkManager, "getSNProximityLinkRecommendationWithRetry:completion:", a3, a4);
}

- (void)getLinkRecommendationMetrics:(id)a3
{
  -[SNNetworkManagerInternal getSNLinkRecommendationMetrics:](self->_underlyingNetworkManager, "getSNLinkRecommendationMetrics:", a3);
}

- (void)updateNetworkPerformanceFeed
{
  -[SNNetworkManagerInternal updateNetworkPerformanceFeed](self->_underlyingNetworkManager, "updateNetworkPerformanceFeed");
}

- (int64_t)networkQuality:(int64_t)a3
{
  return -[SNNetworkManagerInternal networkQualityWithNetworkType:](self->_underlyingNetworkManager, "networkQualityWithNetworkType:", a3);
}

- (void)networkManagerLostNonWWANConnectivity:(id)a3
{
  NSObject *queue;
  _QWORD block[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__SNNetworkManager_networkManagerLostNonWWANConnectivity___block_invoke;
  block[3] = &unk_25183F7A8;
  objc_copyWeak(&v6, &location);
  block[4] = self;
  dispatch_async(queue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __58__SNNetworkManager_networkManagerLostNonWWANConnectivity___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = WeakRetained[1];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "networkManagerLostNonWWANConnectivity:", *(_QWORD *)(a1 + 32), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)networkManagerNetworkUnreachable:(id)a3
{
  NSObject *queue;
  _QWORD block[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SNNetworkManager_networkManagerNetworkUnreachable___block_invoke;
  block[3] = &unk_25183F7A8;
  objc_copyWeak(&v6, &location);
  block[4] = self;
  dispatch_async(queue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __53__SNNetworkManager_networkManagerNetworkUnreachable___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = WeakRetained[1];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "networkManagerNetworkUnreachable:", *(_QWORD *)(a1 + 32), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)networkManagerNonWWANDidBecomeAvailable:(id)a3
{
  NSObject *queue;
  _QWORD block[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__SNNetworkManager_networkManagerNonWWANDidBecomeAvailable___block_invoke;
  block[3] = &unk_25183F7A8;
  objc_copyWeak(&v6, &location);
  block[4] = self;
  dispatch_async(queue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __60__SNNetworkManager_networkManagerNonWWANDidBecomeAvailable___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = WeakRetained[1];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "networkManagerNonWWANDidBecomeAvailable:", *(_QWORD *)(a1 + 32), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (SNNetworkManagerInternal)underlyingNetworkManager
{
  return self->_underlyingNetworkManager;
}

- (void)setUnderlyingNetworkManager:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingNetworkManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingNetworkManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
