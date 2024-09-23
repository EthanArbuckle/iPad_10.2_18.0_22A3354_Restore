@implementation ISURLBagLoadingController

+ (id)sharedBagLoadingController
{
  if (sharedBagLoadingController_sOnceToken != -1)
    dispatch_once(&sharedBagLoadingController_sOnceToken, &__block_literal_global_2);
  return (id)sharedBagLoadingController_sSharedController;
}

void __55__ISURLBagLoadingController_sharedBagLoadingController__block_invoke()
{
  ISURLBagLoadingController *v0;
  void *v1;

  v0 = objc_alloc_init(ISURLBagLoadingController);
  v1 = (void *)sharedBagLoadingController_sSharedController;
  sharedBagLoadingController_sSharedController = (uint64_t)v0;

}

- (ISURLBagLoadingController)init
{
  ISURLBagLoadingController *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v6;
  OS_dispatch_queue *notificationQueue;
  NSObject *v8;
  ISURLBagLoadingController *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD block[4];
  ISURLBagLoadingController *v18;
  objc_super v19;

  __ISRecordSPIClassUsage(self);
  v19.receiver = self;
  v19.super_class = (Class)ISURLBagLoadingController;
  v3 = -[ISURLBagLoadingController init](&v19, sel_init);
  if (v3)
  {
    v4 = dispatch_queue_create("com.apple.iTunesStore.ISURLBagLoadingController.accessQueue", MEMORY[0x24BDAC9C0]);
    accessQueue = v3->_accessQueue;
    v3->_accessQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_create("com.apple.iTunesStore.ISURLBagLoadingController.notificationQueue", 0);
    notificationQueue = v3->_notificationQueue;
    v3->_notificationQueue = (OS_dispatch_queue *)v6;

    v8 = v3->_accessQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __33__ISURLBagLoadingController_init__block_invoke;
    block[3] = &unk_24C43C128;
    v9 = v3;
    v18 = v9;
    dispatch_barrier_sync(v8, block);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[ISNetworkObserver sharedInstance](ISNetworkObserver, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, sel__handleNetworkReachabilityFlagsDidChangeNotification_, CFSTR("ISNetworkReachabilityFlagsChangedNotification"), v11);

    v12 = *MEMORY[0x24BEB20F0];
    objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, sel__handleAccountStoreDidChangeNotification_, v12, v13);

    v14 = *MEMORY[0x24BEB21E8];
    objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, sel__handleStoreFrontDidChangeNotification_, v14, v15);

  }
  return v3;
}

uint64_t __33__ISURLBagLoadingController_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadURLBagAllowingUpdateUsingExistingBagDictionary:", 1);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISNetworkObserver sharedInstance](ISNetworkObserver, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("ISNetworkReachabilityFlagsChangedNotification"), v4);

  v5 = *MEMORY[0x24BEB20F0];
  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v5, v6);

  v7 = *MEMORY[0x24BEB21E8];
  objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v7, v8);

  v9.receiver = self;
  v9.super_class = (Class)ISURLBagLoadingController;
  -[ISURLBagLoadingController dealloc](&v9, sel_dealloc);
}

- (NSDictionary)bagDictionary
{
  NSObject *accessQueue;
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
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__ISURLBagLoadingController_bagDictionary__block_invoke;
  v5[3] = &unk_24C43C1D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __42__ISURLBagLoadingController_bagDictionary__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)addBagObserver:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    block[1] = 3221225472;
    block[2] = __44__ISURLBagLoadingController_addBagObserver___block_invoke;
    block[3] = &unk_24C43C178;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x24BDAC760];
    v8 = v4;
    dispatch_barrier_sync(accessQueue, block);

    v4 = v6;
  }

}

uint64_t __44__ISURLBagLoadingController_addBagObserver___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 56);
      *(_QWORD *)(v5 + 56) = v4;

      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    }
    return objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)removeBagObserver:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    block[1] = 3221225472;
    block[2] = __47__ISURLBagLoadingController_removeBagObserver___block_invoke;
    block[3] = &unk_24C43C178;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x24BDAC760];
    v8 = v4;
    dispatch_barrier_sync(accessQueue, block);

    v4 = v6;
  }

}

uint64_t __47__ISURLBagLoadingController_removeBagObserver___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObject:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)requestAccessToBagUsingBlock:(id)a3
{
  id v4;
  NSObject *accessQueue;
  void (**v6)(_QWORD);
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__ISURLBagLoadingController_requestAccessToBagUsingBlock___block_invoke;
  v7[3] = &unk_24C43C1F8;
  v9 = &v17;
  v10 = &v11;
  v7[4] = self;
  v6 = (void (**)(_QWORD))v4;
  v8 = v6;
  dispatch_barrier_sync(accessQueue, v7);
  if (v18[5] | v12[5])
    v6[2](v6);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

}

void __58__ISURLBagLoadingController_requestAccessToBagUsingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
    && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    if (!v2)
    {
      v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = v3;

      v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    }
    v7 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
    v6 = (void *)MEMORY[0x20BD37BD4]();
    objc_msgSend(v2, "addObject:", v6);

  }
}

- (void)reloadBag
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__ISURLBagLoadingController_reloadBag__block_invoke;
  block[3] = &unk_24C43C128;
  block[4] = self;
  dispatch_barrier_sync(accessQueue, block);
}

uint64_t __38__ISURLBagLoadingController_reloadBag__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadURLBagAllowingUpdateUsingExistingBagDictionary:", 0);
}

- (void)_handleAccountStoreDidChangeNotification:(id)a3
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__ISURLBagLoadingController__handleAccountStoreDidChangeNotification___block_invoke;
  block[3] = &unk_24C43C128;
  block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

uint64_t __70__ISURLBagLoadingController__handleAccountStoreDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadURLBagAllowingUpdateUsingExistingBagDictionary:", 0);
}

- (void)_handleNetworkReachabilityFlagsDidChangeNotification:(id)a3
{
  void *v4;
  _BOOL4 v5;
  NSObject *accessQueue;
  _QWORD block[5];

  +[ISNetworkObserver sharedInstance](ISNetworkObserver, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[ISNetworkObserver isLikelyToReachRemoteServerWithReachabilityFlags:](ISNetworkObserver, "isLikelyToReachRemoteServerWithReachabilityFlags:", objc_msgSend(v4, "networkReachabilityFlags"));

  if (v5)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__ISURLBagLoadingController__handleNetworkReachabilityFlagsDidChangeNotification___block_invoke;
    block[3] = &unk_24C43C128;
    block[4] = self;
    dispatch_barrier_async(accessQueue, block);
  }
}

_BYTE *__82__ISURLBagLoadingController__handleNetworkReachabilityFlagsDidChangeNotification___block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[24])
    return (_BYTE *)objc_msgSend(result, "_reloadURLBagAllowingUpdateUsingExistingBagDictionary:", 0);
  return result;
}

- (void)_handleStoreFrontDidChangeNotification:(id)a3
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__ISURLBagLoadingController__handleStoreFrontDidChangeNotification___block_invoke;
  block[3] = &unk_24C43C128;
  block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

uint64_t __68__ISURLBagLoadingController__handleStoreFrontDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadURLBagAllowingUpdateUsingExistingBagDictionary:", 0);
}

- (void)_didCompleteLoadingBagDictionary:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__ISURLBagLoadingController__didCompleteLoadingBagDictionary_withError___block_invoke;
  block[3] = &unk_24C43C1A0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_async(accessQueue, block);

}

void __72__ISURLBagLoadingController__didCompleteLoadingBagDictionary_withError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_updateBagWithDictionary:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__ISURLBagLoadingController__didCompleteLoadingBagDictionary_withError___block_invoke_2;
  block[3] = &unk_24C43C128;
  block[4] = v2;
  dispatch_async(v3, block);
}

void __72__ISURLBagLoadingController__didCompleteLoadingBagDictionary_withError___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ISURLBagLoadingControllerIsLoadingBagDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (void)_reloadURLBagAllowingUpdateUsingExistingBagDictionary:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  ISSSURLBag *v6;
  SSURLBag *URLBag;
  void *v8;
  uint64_t v9;
  NSObject *notificationQueue;
  void *v11;
  SSURLBag *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD block[5];

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SSURLBag initWithURLBagContext:]([ISSSURLBag alloc], "initWithURLBagContext:", v5);
  URLBag = self->_URLBag;
  self->_URLBag = &v6->super;

  if (v3)
  {
    -[SSURLBag existingBagDictionary](self->_URLBag, "existingBagDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISURLBagLoadingController _updateBagWithDictionary:error:](self, "_updateBagWithDictionary:error:", v8, 0);

  }
  self->_loadingBag = 1;
  v9 = MEMORY[0x24BDAC760];
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__ISURLBagLoadingController__reloadURLBagAllowingUpdateUsingExistingBagDictionary___block_invoke;
  block[3] = &unk_24C43C128;
  block[4] = self;
  dispatch_async(notificationQueue, block);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithWeakObject:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = self->_URLBag;
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __83__ISURLBagLoadingController__reloadURLBagAllowingUpdateUsingExistingBagDictionary___block_invoke_2;
  v14[3] = &unk_24C43C220;
  v15 = v11;
  v13 = v11;
  -[SSURLBag loadWithCompletionBlock:](v12, "loadWithCompletionBlock:", v14);

}

void __83__ISURLBagLoadingController__reloadURLBagAllowingUpdateUsingExistingBagDictionary___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ISURLBagLoadingControllerIsLoadingBagDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __83__ISURLBagLoadingController__reloadURLBagAllowingUpdateUsingExistingBagDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "weakObjectValue");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_didCompleteLoadingBagDictionary:withError:", v6, v5);

}

- (void)_updateBagWithDictionary:(id)a3 error:(id)a4
{
  NSDictionary *v6;
  id v7;
  void *v8;
  NSDictionary *bagDictionary;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *bagAccessRequestBlocks;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v6 = (NSDictionary *)a3;
  v7 = a4;
  v8 = (void *)-[NSDictionary copy](self->_bagDictionary, "copy");
  bagDictionary = self->_bagDictionary;
  if (bagDictionary == v6 || -[NSDictionary isEqualToDictionary:](bagDictionary, "isEqualToDictionary:", v6))
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)-[NSDictionary copy](v6, "copy");

    objc_storeStrong((id *)&self->_bagDictionary, v11);
    -[NSHashTable allObjects](self->_bagObservers, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
  }
  objc_storeStrong((id *)&self->_bagLoadingError, a4);
  v12 = (void *)-[NSMutableArray copy](self->_bagAccessRequestBlocks, "copy");
  bagAccessRequestBlocks = self->_bagAccessRequestBlocks;
  self->_bagAccessRequestBlocks = 0;

  dispatch_get_global_queue(0, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __60__ISURLBagLoadingController__updateBagWithDictionary_error___block_invoke;
  v19[3] = &unk_24C43C248;
  v20 = v12;
  v21 = v8;
  v22 = v7;
  v23 = v10;
  v15 = v10;
  v16 = v7;
  v17 = v8;
  v18 = v12;
  dispatch_async(v14, v19);

}

void __60__ISURLBagLoadingController__updateBagWithDictionary_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v4);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *(id *)(a1 + 56);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "bagDidChange:", *(_QWORD *)(a1 + 40), (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v9);
  }

}

- (BOOL)isLoadingBag
{
  return self->_loadingBag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLBag, 0);
  objc_storeStrong((id *)&self->_bagObservers, 0);
  objc_storeStrong((id *)&self->_bagLoadingError, 0);
  objc_storeStrong((id *)&self->_bagAccessRequestBlocks, 0);
  objc_storeStrong((id *)&self->_bagDictionary, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
