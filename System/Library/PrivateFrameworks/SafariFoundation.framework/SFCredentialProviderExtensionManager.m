@implementation SFCredentialProviderExtensionManager

uint64_t __58__SFCredentialProviderExtensionManager__updateExtensions___block_invoke(uint64_t a1, void *a2)
{
  return extensionAndContainingAppHaveDeveloperEntitlement(a2);
}

uint64_t __52__SFCredentialProviderExtensionManager_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addObserverOnInternalQueue:shouldHoldWeakly:", *(_QWORD *)(a1 + 40), 0);
}

+ (SFCredentialProviderExtensionManager)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SFCredentialProviderExtensionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (SFCredentialProviderExtensionManager *)(id)sharedManager_sharedManager;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__SFCredentialProviderExtensionManager_addObserver___block_invoke;
  v7[3] = &unk_24C935280;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __64__SFCredentialProviderExtensionManager__beginExtensionDiscovery__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[1];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__SFCredentialProviderExtensionManager__beginExtensionDiscovery__block_invoke_2;
    block[3] = &unk_24C9354C8;
    block[4] = WeakRetained;
    v11 = v6;
    v12 = v5;
    dispatch_async(v9, block);

  }
}

void __53__SFCredentialProviderExtensionManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v1;

}

- (SFCredentialProviderExtensionManager)init
{
  SFCredentialProviderExtensionManager *v2;
  id v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSMutableOrderedSet *observers;
  uint64_t v8;
  NSHashTable *weakObservers;
  SFCredentialProviderExtensionManager *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFCredentialProviderExtensionManager;
  v2 = -[SFCredentialProviderExtensionManager init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.AuthenticationServices.%@.%p"), objc_opt_class(), v2);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = dispatch_queue_create((const char *)objc_msgSend(v3, "UTF8String"), 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v6 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSMutableOrderedSet *)v6;

    v2->_observerLock.ourl_lock._os_unfair_lock_opaque = 0;
    v2->_observerLock.ourl_count = 0;
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    weakObservers = v2->_weakObservers;
    v2->_weakObservers = (NSHashTable *)v8;

    v10 = v2;
  }

  return v2;
}

uint64_t __57__SFCredentialProviderExtensionManager__notifyObservers___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = os_unfair_recursive_lock_lock_with_options();
  v3 = (void *)MEMORY[0x212BBA31C](v2);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8++), "credentialProviderExtensionManagerExtensionListDidChange:", *(_QWORD *)(a1 + 32), (_QWORD)v12);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setCount:", 0);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;

  objc_autoreleasePoolPop(v3);
  return os_unfair_recursive_lock_unlock();
}

- (void)_updateExtensions:(id)a3
{
  uint64_t v4;
  NSSet *v5;
  NSSet *extensions;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "safari_filterObjectsUsingBlock:", &__block_literal_global_4);
  v4 = objc_claimAutoreleasedReturnValue();
  v10 = (id)v4;
  if (v4)
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
  else
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
  extensions = self->_extensions;
  self->_extensions = v5;

  -[NSMutableOrderedSet array](self->_observers, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHashTable allObjects](self->_weakObservers, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFCredentialProviderExtensionManager _notifyObservers:](self, "_notifyObservers:", v9);
}

- (void)_addObserverOnInternalQueue:(id)a3 shouldHoldWeakly:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  _QWORD v15[2];

  v4 = a4;
  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = -[NSMutableOrderedSet count](self->_observers, "count");
  -[NSHashTable allObjects](self->_weakObservers, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v4)
  {
    -[NSHashTable addObject:](self->_weakObservers, "addObject:", v6);
    objc_msgSend(v6, "safari_setDeallocationSentinelForObserver:", self);
  }
  else
  {
    -[NSMutableOrderedSet addObject:](self->_observers, "addObject:", v6);
  }
  v10 = v9 + v7;
  v11 = -[NSMutableOrderedSet count](self->_observers, "count");
  -[NSHashTable allObjects](self->_weakObservers, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count") + v11;

  if (v13 == 1)
    -[SFCredentialProviderExtensionManager _beginExtensionDiscovery](self, "_beginExtensionDiscovery");
  if (v13 > v10 && self->_extensions)
  {
    v15[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCredentialProviderExtensionManager _notifyObservers:](self, "_notifyObservers:", v14);

  }
}

- (void)_beginExtensionDiscovery
{
  void *v3;
  void *v4;
  void *v5;
  id extensionMatchingToken;
  _QWORD v7[4];
  id v8;
  id location;

  if (!self->_extensionMatchingToken)
  {
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x24BDD1550];
    extensionMatchingAttributes(0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __64__SFCredentialProviderExtensionManager__beginExtensionDiscovery__block_invoke;
    v7[3] = &unk_24C9359A8;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v3, "beginMatchingExtensionsWithAttributes:completion:", v4, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    extensionMatchingToken = self->_extensionMatchingToken;
    self->_extensionMatchingToken = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_notifyObservers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[6];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  v5 = (void *)MEMORY[0x212BBA31C]();
  objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v19[5];
  v19[5] = v6;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend((id)v19[5], "addPointer:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
    }
    while (v9);
  }

  objc_autoreleasePoolPop(v5);
  dispatch_get_global_queue(21, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__SFCredentialProviderExtensionManager__notifyObservers___block_invoke;
  v13[3] = &unk_24C935A10;
  v13[4] = self;
  v13[5] = &v18;
  dispatch_async(v12, v13);

  _Block_object_dispose(&v18, 8);
}

uint64_t __64__SFCredentialProviderExtensionManager__beginExtensionDiscovery__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 48) = *(_QWORD *)(result + 40) != 0;
  if (!*(_QWORD *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_updateExtensions:", *(_QWORD *)(result + 48));
  return result;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_extensionMatchingToken)
    objc_msgSend(MEMORY[0x24BDD1550], "endMatchingExtensions:");
  v3.receiver = self;
  v3.super_class = (Class)SFCredentialProviderExtensionManager;
  -[SFCredentialProviderExtensionManager dealloc](&v3, sel_dealloc);
}

- (void)getExtensionWithBundleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    queue = self->_queue;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __76__SFCredentialProviderExtensionManager_getExtensionWithBundleID_completion___block_invoke;
    v10[3] = &unk_24C935930;
    v12 = v7;
    v11 = v6;
    dispatch_async(queue, v10);

  }
}

void __76__SFCredentialProviderExtensionManager_getExtensionWithBundleID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  _QWORD *v9;
  uint64_t *v10;
  _QWORD v11[3];
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 0;
  v2 = (void *)MEMORY[0x24BDD1550];
  extensionMatchingAttributes(1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __76__SFCredentialProviderExtensionManager_getExtensionWithBundleID_completion___block_invoke_7;
  v6[3] = &unk_24C935908;
  v9 = v11;
  v8 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v10 = &v13;
  objc_msgSend(v2, "beginMatchingExtensionsWithAttributes:completion:", v3, v6);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v14[5];
  v14[5] = v4;

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);

}

void __76__SFCredentialProviderExtensionManager_getExtensionWithBundleID_completion___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v8 + 24))
  {
    *(_BYTE *)(v8 + 24) = 1;
    v30 = *(_QWORD *)(a1 + 40);
    v31 = v6;
    v9 = *(id *)(a1 + 32);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v10 = (id)objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_150);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v33 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v15, "sf_bundleIdentifierForContainingApp", v30, v31, (_QWORD)v32);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", v9);

          if ((v17 & 1) != 0)
          {
            v26 = v15;

            goto LABEL_14;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v12)
          continue;
        break;
      }
    }

    v18 = WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __76__SFCredentialProviderExtensionManager_getExtensionWithBundleID_completion___block_invoke_7_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
    objc_msgSend(v10, "firstObject", v30, v31);
    v26 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
    v7 = v31;

    (*(void (**)(uint64_t, id))(v30 + 16))(v30, v26);
  }
  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v28 = *(void **)(v27 + 40);
  if (v28)
  {
    *(_QWORD *)(v27 + 40) = 0;
    v29 = v28;

    objc_msgSend(MEMORY[0x24BDD1550], "endMatchingExtensions:", v29);
  }

}

- (void)getEnabledExtensionsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD block[4];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__SFCredentialProviderExtensionManager_getEnabledExtensionsWithCompletion___block_invoke;
    block[3] = &unk_24C935980;
    v8 = v4;
    dispatch_async(queue, block);

  }
}

void __75__SFCredentialProviderExtensionManager_getEnabledExtensionsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  uint64_t *v9;
  _QWORD v10[3];
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  v2 = (void *)MEMORY[0x24BDD1550];
  extensionMatchingAttributes(1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __75__SFCredentialProviderExtensionManager_getEnabledExtensionsWithCompletion___block_invoke_2;
  v6[3] = &unk_24C935958;
  v8 = v10;
  v7 = *(id *)(a1 + 32);
  v9 = &v12;
  objc_msgSend(v2, "beginMatchingExtensionsWithAttributes:completion:", v3, v6);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v13[5];
  v13[5] = v4;

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v12, 8);

}

void __75__SFCredentialProviderExtensionManager_getEnabledExtensionsWithCompletion___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1[5] + 8);
  if (!*(_BYTE *)(v6 + 24))
  {
    *(_BYTE *)(v6 + 24) = 1;
    (*(void (**)(_QWORD, uint64_t))(a1[4] + 16))(a1[4], objc_msgSend(v10, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_150));
  }
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  if (v8)
  {
    *(_QWORD *)(v7 + 40) = 0;
    v9 = v8;

    objc_msgSend(MEMORY[0x24BDD1550], "endMatchingExtensions:", v9);
  }

}

- (void)_endExtensionDiscovery
{
  id extensionMatchingToken;
  NSSet *extensions;

  if (self->_extensionMatchingToken)
  {
    objc_msgSend(MEMORY[0x24BDD1550], "endMatchingExtensions:");
    extensionMatchingToken = self->_extensionMatchingToken;
    self->_extensionMatchingToken = 0;

    extensions = self->_extensions;
    self->_extensions = 0;

  }
}

- (NSSet)extensions
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__SFCredentialProviderExtensionManager_extensions__block_invoke;
  v5[3] = &unk_24C9354F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

void __50__SFCredentialProviderExtensionManager_extensions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_extensions");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSSet)extensionsSync
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __54__SFCredentialProviderExtensionManager_extensionsSync__block_invoke;
  v5[3] = &unk_24C9354F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

void __54__SFCredentialProviderExtensionManager_extensionsSync__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v2 = (void *)MEMORY[0x24BDD1550];
    extensionMatchingAttributes(0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "extensionsWithMatchingAttributes:error:", v3, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v7);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (id)_extensions
{
  id extensionMatchingToken;

  if (self->_errorEncounteredDuringLastExtensionDiscovery)
  {
    extensionMatchingToken = self->_extensionMatchingToken;
    self->_extensionMatchingToken = 0;

    -[SFCredentialProviderExtensionManager _beginExtensionDiscovery](self, "_beginExtensionDiscovery");
  }
  return self->_extensions;
}

- (NSArray)enabledExtensions
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__SFCredentialProviderExtensionManager_enabledExtensions__block_invoke;
  v5[3] = &unk_24C9354F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __57__SFCredentialProviderExtensionManager_enabledExtensions__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_extensions");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), (id)objc_msgSend(v2, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_150));

}

- (NSArray)getEnabledExtensionsSynchronously
{
  NSObject *queue;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__SFCredentialProviderExtensionManager_getEnabledExtensionsSynchronously__block_invoke;
  block[3] = &unk_24C935A38;
  block[4] = self;
  block[5] = &v15;
  block[6] = &v9;
  dispatch_sync(queue, block);
  if (*((_BYTE *)v16 + 24))
  {
    v3 = (id)v10[5];
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD1550];
    extensionMatchingAttributes(1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extensionsWithMatchingAttributes:error:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v6, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_150);

  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return (NSArray *)v3;
}

void __73__SFCredentialProviderExtensionManager_getEnabledExtensionsSynchronously__block_invoke(_QWORD *a1)
{
  uint64_t v1;
  id v3;

  v1 = a1[4];
  if (*(_QWORD *)(v1 + 16))
  {
    if (*(_QWORD *)(v1 + 24))
    {
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
      objc_msgSend(*(id *)(a1[4] + 24), "allObjects");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), (id)objc_msgSend(v3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_150));

    }
  }
}

- (id)enabledExtensionWithContainingAppBundleID:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SFCredentialProviderExtensionManager getEnabledExtensionsSynchronously](self, "getEnabledExtensionsSynchronously");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
      objc_msgSend(v10, "sf_bundleIdentifierForContainingApp", (_QWORD)v23);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v4);

      if ((v12 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v13 = v10;

    if (v13)
      goto LABEL_14;
  }
  else
  {
LABEL_9:

  }
  v14 = WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[SFCredentialProviderExtensionManager enabledExtensionWithContainingAppBundleID:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
  v13 = 0;
LABEL_14:

  return v13;
}

- (void)addWeakObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__SFCredentialProviderExtensionManager_addWeakObserver___block_invoke;
  v7[3] = &unk_24C935280;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __56__SFCredentialProviderExtensionManager_addWeakObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addObserverOnInternalQueue:shouldHoldWeakly:", *(_QWORD *)(a1 + 40), 1);
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SFCredentialProviderExtensionManager_removeObserver___block_invoke;
  block[3] = &unk_24C935280;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);
  os_unfair_recursive_lock_unlock();

}

uint64_t __55__SFCredentialProviderExtensionManager_removeObserver___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_observerWasRemovedOnInternalQueue");
}

- (void)_observerWasRemovedOnInternalQueue
{
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = -[NSMutableOrderedSet count](self->_observers, "count");
  -[NSHashTable allObjects](self->_weakObservers, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!(v3 + v5))
    -[SFCredentialProviderExtensionManager _endExtensionDiscovery](self, "_endExtensionDiscovery");
}

- (BOOL)extensionIsEnabled:(id)a3
{
  return extensionIsEnabled(a3);
}

- (void)setExtension:(id)a3 isEnabled:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *queue;
  _QWORD block[5];

  v4 = a4;
  v6 = a3;
  if (v6 && -[SFCredentialProviderExtensionManager extensionIsEnabled:](self, "extensionIsEnabled:", v6) != v4)
  {
    if (!v4)
    {
      v7 = 2;
      goto LABEL_7;
    }
    if (-[SFCredentialProviderExtensionManager canEnableCredentialProviderExtension](self, "canEnableCredentialProviderExtension"))
    {
      v7 = 1;
LABEL_7:
      objc_msgSend(v6, "_plugIn");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setUserElection:", v7);

      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __63__SFCredentialProviderExtensionManager_setExtension_isEnabled___block_invoke;
      block[3] = &unk_24C935460;
      block[4] = self;
      dispatch_async(queue, block);
    }
  }

}

void __63__SFCredentialProviderExtensionManager_setExtension_isEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_notifyObservers:", v4);
}

- (BOOL)canEnableCredentialProviderExtension
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;

  +[SFCredentialProviderExtensionManager sharedManager](SFCredentialProviderExtensionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getEnabledExtensionsSynchronously");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[SFAutoFillFeatureManager sharedFeatureManager](SFAutoFillFeatureManager, "sharedFeatureManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldAutoFillPasswordsFromKeychain");

  LOBYTE(v4) = objc_msgSend(v3, "count") + (unint64_t)v5 < 3;
  return (char)v4;
}

- (id)displayNameForExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *, _BYTE *);
  void *v19;
  id v20;
  _QWORD *v21;
  _QWORD v22[3];
  char v23;

  v4 = a3;
  objc_msgSend(v4, "_plugIn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containingUrl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_plugIn");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedContainingName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  -[SFCredentialProviderExtensionManager extensionsSync](self, "extensionsSync");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __64__SFCredentialProviderExtensionManager_displayNameForExtension___block_invoke;
  v19 = &unk_24C935A60;
  v10 = v6;
  v20 = v10;
  v21 = v22;
  objc_msgSend(v9, "objectsPassingTest:", &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count") == 1)
  {
    v12 = v8;
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "objectForInfoDictionaryKey:", *MEMORY[0x24BDBD1D0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ — %@"), v8, v14, v16, v17, v18, v19);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(v22, 8);

  return v12;
}

uint64_t __64__SFCredentialProviderExtensionManager_displayNameForExtension___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a2, "_plugIn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containingUrl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)v7)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (*(_BYTE *)(v8 + 24))
      *a3 = 1;
    else
      *(_BYTE *)(v8 + 24) = 1;
  }
  return v7;
}

- (BOOL)shouldShowConfigurationUIForEnablingExtension:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_dictionaryForKey:", CFSTR("ASCredentialProviderExtensionCapabilities"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safari_numberForKey:", CFSTR("ShowsConfigurationUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "BOOLValue");
  }
  else
  {
    objc_msgSend(v3, "attributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "safari_BOOLForKey:", CFSTR("ASCredentialProviderExtensionShowsConfigurationUI"));

  }
  return v8;
}

- (BOOL)extensionSupportsPasskeys:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_dictionaryForKey:", CFSTR("ASCredentialProviderExtensionCapabilities"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("ProvidesPasskeys"));
  return (char)v3;
}

- (BOOL)extensionSupportsConditionalPasskeyRegistration:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_dictionaryForKey:", CFSTR("ASCredentialProviderExtensionCapabilities"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("SupportsConditionalPasskeyRegistration"));
  return (char)v3;
}

- (BOOL)atLeastOneEnabledExtensionSupportsPasskeys
{
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self->_shouldOverrideAtLeastOneExtensionSupportsPasskeys)
  {
    LOBYTE(v3) = self->_overrideAtLeastOneExtensionSupportsPasskeysValue;
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[SFCredentialProviderExtensionManager getEnabledExtensionsSynchronously](self, "getEnabledExtensionsSynchronously", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v3 = 0;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v3 |= -[SFCredentialProviderExtensionManager extensionSupportsPasskeys:](self, "extensionSupportsPasskeys:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }
    else
    {
      LOBYTE(v3) = 0;
    }

  }
  return v3 & 1;
}

- (void)test_overrideAtLeastOneExtensionSupportsPasskeys:(BOOL)a3
{
  self->_shouldOverrideAtLeastOneExtensionSupportsPasskeys = 1;
  self->_overrideAtLeastOneExtensionSupportsPasskeysValue = a3;
}

- (BOOL)atLeastOneEnabledExtensionSupportsOneTimeCodes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SFCredentialProviderExtensionManager getEnabledExtensionsSynchronously](self, "getEnabledExtensionsSynchronously", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (-[SFCredentialProviderExtensionManager extensionSupportsOneTimeCodes:](self, "extensionSupportsOneTimeCodes:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)))
        {
          v8 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)extensionSupportsOneTimeCodes:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_dictionaryForKey:", CFSTR("ASCredentialProviderExtensionCapabilities"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("ProvidesOneTimeCodes"));
  return (char)v3;
}

- (BOOL)extensionSupportsTextInsertion:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_dictionaryForKey:", CFSTR("ASCredentialProviderExtensionCapabilities"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("ProvidesTextToInsert"));
  return (char)v3;
}

- (BOOL)extensionSupportsPasswords:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_dictionaryForKey:", CFSTR("ASCredentialProviderExtensionCapabilities"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v3, "_sf_credentialProviderExtensionNeedsToDeclarePasswordSupport"))
    v6 = objc_msgSend(v5, "safari_BOOLForKey:", CFSTR("ProvidesPasswords"));
  else
    v6 = 1;

  return v6;
}

- (id)supportedCredentialTypesStringForExtension:(id)a3
{
  id v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;

  v4 = a3;
  v5 = -[SFCredentialProviderExtensionManager extensionSupportsPasswords:](self, "extensionSupportsPasswords:", v4);
  v6 = -[SFCredentialProviderExtensionManager extensionSupportsPasskeys:](self, "extensionSupportsPasskeys:", v4);
  v7 = -[SFCredentialProviderExtensionManager extensionSupportsOneTimeCodes:](self, "extensionSupportsOneTimeCodes:", v4);

  if (!v5 && !v6 && !v7)
    return &stru_24C9367F0;
  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)sentinelDidDeallocateWithContext:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__SFCredentialProviderExtensionManager_sentinelDidDeallocateWithContext___block_invoke;
  block[3] = &unk_24C935460;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __73__SFCredentialProviderExtensionManager_sentinelDidDeallocateWithContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_observerWasRemovedOnInternalQueue");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weakObservers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong(&self->_extensionMatchingToken, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __76__SFCredentialProviderExtensionManager_getExtensionWithBundleID_completion___block_invoke_7_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20E365000, a1, a3, "Wasn't able to find extension among enabled ones.", a5, a6, a7, a8, 0);
}

- (void)enabledExtensionWithContainingAppBundleID:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20E365000, a1, a3, "No enabled extension that would match provided bundleID were found.", a5, a6, a7, a8, 0);
}

@end
