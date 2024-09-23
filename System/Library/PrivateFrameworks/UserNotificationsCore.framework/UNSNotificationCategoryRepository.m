@implementation UNSNotificationCategoryRepository

- (int64_t)_maxObjectsPerKey
{
  return 100;
}

- (UNSNotificationCategoryRepository)initWithDirectory:(id)a3 librarian:(id)a4 repositoryProtectionStrategy:(id)a5
{
  id v8;
  id v9;
  id v10;
  UNCKeyedDataStoreRepository *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  UNCKeyedObservable *v16;
  UNSNotificationCategoryRepository *v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[UNCKeyedDataStoreRepository initWithDirectory:fileName:pathExtension:librarian:repositoryProtectionStrategy:objectIdentifierKey:maxObjectsPerKey:]([UNCKeyedDataStoreRepository alloc], "initWithDirectory:fileName:pathExtension:librarian:repositoryProtectionStrategy:objectIdentifierKey:maxObjectsPerKey:", v10, CFSTR("Categories"), CFSTR("plist"), v9, v8, 0, -[UNSNotificationCategoryRepository _maxObjectsPerKey](self, "_maxObjectsPerKey"));

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = dispatch_queue_create("com.apple.NotificationCategoryRepository.observable", v12);

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = dispatch_queue_create("com.apple.NotificationCategoryRepository.call-out", v14);

  v16 = -[UNCKeyedObservable initWithQueue:callOutQueue:]([UNCKeyedObservable alloc], "initWithQueue:callOutQueue:", v13, v15);
  v17 = -[UNSNotificationCategoryRepository initWithDataStoreRepository:observable:](self, "initWithDataStoreRepository:observable:", v11, v16);

  return v17;
}

- (UNSNotificationCategoryRepository)initWithDataStoreRepository:(id)a3 observable:(id)a4
{
  id v7;
  id v8;
  UNSNotificationCategoryRepository *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UNSNotificationCategoryRepository;
  v9 = -[UNSNotificationCategoryRepository init](&v14, sel_init);
  if (v9)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.usernotificationsserver.NotificationCategoryRepository", v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_repository, a3);
    objc_storeStrong((id *)&v9->_observable, a4);
  }

  return v9;
}

- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__UNSNotificationCategoryRepository_addObserver_forBundleIdentifier___block_invoke;
  block[3] = &unk_251AE0250;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __69__UNSNotificationCategoryRepository_addObserver_forBundleIdentifier___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "addObserver:forKey:", a1[5], a1[6]);
}

- (void)removeObserver:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__UNSNotificationCategoryRepository_removeObserver_forBundleIdentifier___block_invoke;
  block[3] = &unk_251AE0250;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

uint64_t __72__UNSNotificationCategoryRepository_removeObserver_forBundleIdentifier___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "removeObserver:forKey:", a1[5], a1[6]);
}

- (id)allBundleIdentifiers
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
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__UNSNotificationCategoryRepository_allBundleIdentifiers__block_invoke;
  v5[3] = &unk_251AE0178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __57__UNSNotificationCategoryRepository_allBundleIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allKeys");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)categoriesForBundleIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__UNSNotificationCategoryRepository_categoriesForBundleIdentifier___block_invoke;
  block[3] = &unk_251AE0278;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __67__UNSNotificationCategoryRepository_categoriesForBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_categoriesForBundleIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setCategories:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__UNSNotificationCategoryRepository_setCategories_forBundleIdentifier___block_invoke;
  block[3] = &unk_251AE0250;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __71__UNSNotificationCategoryRepository_setCategories_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setCategories:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)notificationSourcesDidUninstall:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__UNSNotificationCategoryRepository_notificationSourcesDidUninstall___block_invoke;
  block[3] = &unk_251AE01A0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __69__UNSNotificationCategoryRepository_notificationSourcesDidUninstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notificationSourcesDidUninstall:", *(_QWORD *)(a1 + 40));
}

- (void)contentProtectionStateChangedForFirstUnlock:(BOOL)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__UNSNotificationCategoryRepository_contentProtectionStateChangedForFirstUnlock___block_invoke;
  block[3] = &unk_251AE02A0;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __81__UNSNotificationCategoryRepository_contentProtectionStateChangedForFirstUnlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "protectionStateChanged");
}

- (id)_queue_categoriesForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[UNCKeyedDataStoreRepository objectsForKey:](self->_repository, "objectsForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_map:", UNSDictionaryToNotificationCategoryRecord);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_queue_setCategories:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  UNCKeyedObservable *observable;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v7 = a4;
  -[UNSNotificationCategoryRepository _queue_categoriesForBundleIdentifier:](self, "_queue_categoriesForBundleIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((UNEqualObjects() & 1) == 0)
  {
    objc_msgSend(v6, "bs_map:", UNCNotificationCategoryRecordToDictionary);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCKeyedDataStoreRepository setObjects:forKey:](self->_repository, "setObjects:forKey:", v9, v7);
    observable = self->_observable;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __78__UNSNotificationCategoryRepository__queue_setCategories_forBundleIdentifier___block_invoke;
    v11[3] = &unk_251AE02C8;
    v11[4] = self;
    v12 = v7;
    -[UNCKeyedObservable notifyObserversKey:usingBlock:](observable, "notifyObserversKey:usingBlock:", v12, v11);

  }
}

uint64_t __78__UNSNotificationCategoryRepository__queue_setCategories_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "categoryRepository:didChangeCategoriesForBundleIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)categoryWithIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[UNSNotificationCategoryRepository categoriesForBundleIdentifier:](self, "categoriesForBundleIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v14, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v6, "isEqual:", v15);

          if (v16)
          {
            v17 = v14;

            v11 = v17;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_queue_notificationSourcesDidUninstall:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UNCKeyedDataStoreRepository removeStoreForKey:](self->_repository, "removeStoreForKey:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observable, 0);
  objc_storeStrong((id *)&self->_repository, 0);
}

@end
