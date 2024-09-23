@implementation UNSAuthorizationAlertController

- (void)requestAuthorizationForBundleIdentifier:(id)a3 displayName:(id)a4 usageDescription:(id)a5 withResult:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  id v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[UNSAuthorizationAlertController _queue_addResultBlock:forBundleIdentifier:](self, "_queue_addResultBlock:forBundleIdentifier:", v13, v10);
  if (!-[UNSAuthorizationAlertController _queue_isAlertActiveForBundleIdentifier:](self, "_queue_isAlertActiveForBundleIdentifier:", v10))
  {
    -[UNSAuthorizationAlertController _queue_addAlertActiveForBundleIdentifier:](self, "_queue_addAlertActiveForBundleIdentifier:", v10);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __115__UNSAuthorizationAlertController_requestAuthorizationForBundleIdentifier_displayName_usageDescription_withResult___block_invoke;
    block[3] = &unk_24D639D40;
    block[4] = self;
    v15 = v10;
    v16 = v11;
    v17 = v12;
    v18 = v13;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

- (BOOL)_queue_isAlertActiveForBundleIdentifier:(id)a3
{
  return -[NSMutableSet containsObject:](self->_bundleIdentifersForActiveAlerts, "containsObject:", a3);
}

- (void)_queue_addResultBlock:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->_bundleIdentifiersToResultBlocks, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_bundleIdentifiersToResultBlocks, "setObject:forKey:", v7, v6);
  }
  v8 = (void *)objc_msgSend(v10, "copy");
  v9 = _Block_copy(v8);
  objc_msgSend(v7, "addObject:", v9);

}

- (UNSAuthorizationAlertController)initWithQueue:(id)a3
{
  id v5;
  UNSAuthorizationAlertController *v6;
  UNSAuthorizationAlertController *v7;
  NSMutableSet *v8;
  NSMutableSet *bundleIdentifersForActiveAlerts;
  NSMutableDictionary *v10;
  NSMutableDictionary *bundleIdentifiersToResultBlocks;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UNSAuthorizationAlertController;
  v6 = -[UNSAuthorizationAlertController init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    bundleIdentifersForActiveAlerts = v7->_bundleIdentifersForActiveAlerts;
    v7->_bundleIdentifersForActiveAlerts = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    bundleIdentifiersToResultBlocks = v7->_bundleIdentifiersToResultBlocks;
    v7->_bundleIdentifiersToResultBlocks = v10;

  }
  return v7;
}

uint64_t __115__UNSAuthorizationAlertController_requestAuthorizationForBundleIdentifier_displayName_usageDescription_withResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentAuthorizationAlertForBundleIdentifier:displayName:usageDescription:withResult:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_presentAuthorizationAlertForBundleIdentifier:(id)a3 displayName:(id)a4 usageDescription:(id)a5 withResult:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __121__UNSAuthorizationAlertController__presentAuthorizationAlertForBundleIdentifier_displayName_usageDescription_withResult___block_invoke;
  v15[3] = &unk_24D639D90;
  v15[4] = self;
  objc_copyWeak(&v17, &location);
  v14 = v10;
  v16 = v14;
  -[UNSAuthorizationAlertController presentAuthorizationAlertForBundleIdentifier:displayName:usageDescription:withResult:](self, "presentAuthorizationAlertForBundleIdentifier:displayName:usageDescription:withResult:", v14, v11, v12, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __121__UNSAuthorizationAlertController__presentAuthorizationAlertForBundleIdentifier_displayName_usageDescription_withResult___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7[2];

  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __121__UNSAuthorizationAlertController__presentAuthorizationAlertForBundleIdentifier_displayName_usageDescription_withResult___block_invoke_2;
  block[3] = &unk_24D639D68;
  objc_copyWeak(v7, (id *)(a1 + 48));
  v6 = *(id *)(a1 + 40);
  v7[1] = a2;
  dispatch_async(v4, block);

  objc_destroyWeak(v7);
}

void __121__UNSAuthorizationAlertController__presentAuthorizationAlertForBundleIdentifier_displayName_usageDescription_withResult___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_removeAlertActiveForBundleIdentifier:", *(_QWORD *)(a1 + 32));

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "_queue_sendResponse:forBundleIdentifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)_queue_addAlertActiveForBundleIdentifier:(id)a3
{
  -[NSMutableSet addObject:](self->_bundleIdentifersForActiveAlerts, "addObject:", a3);
}

- (void)_queue_removeAlertActiveForBundleIdentifier:(id)a3
{
  -[NSMutableSet removeObject:](self->_bundleIdentifersForActiveAlerts, "removeObject:", a3);
}

- (void)_queue_sendResponse:(int64_t)a3 forBundleIdentifier:(id)a4
{
  id v5;
  void *v6;
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
  v5 = a4;
  -[NSMutableDictionary objectForKey:](self->_bundleIdentifiersToResultBlocks, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
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
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++) + 16))();
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
  -[NSMutableDictionary removeObjectForKey:](self->_bundleIdentifiersToResultBlocks, "removeObjectForKey:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiersToResultBlocks, 0);
  objc_storeStrong((id *)&self->_bundleIdentifersForActiveAlerts, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
