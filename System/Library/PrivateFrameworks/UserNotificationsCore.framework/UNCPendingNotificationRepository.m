@implementation UNCPendingNotificationRepository

- (int64_t)_maxObjectsPerKey
{
  return 100;
}

- (UNCPendingNotificationRepository)initWithDirectory:(id)a3 librarian:(id)a4 repositoryProtectionStrategy:(id)a5
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
  UNCPendingNotificationRepository *v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[UNCKeyedDataStoreRepository initWithDirectory:fileName:pathExtension:librarian:repositoryProtectionStrategy:objectIdentifierKey:maxObjectsPerKey:]([UNCKeyedDataStoreRepository alloc], "initWithDirectory:fileName:pathExtension:librarian:repositoryProtectionStrategy:objectIdentifierKey:maxObjectsPerKey:", v10, CFSTR("PendingNotifications"), CFSTR("plist"), v9, v8, 0, -[UNCPendingNotificationRepository _maxObjectsPerKey](self, "_maxObjectsPerKey"));

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = dispatch_queue_create("com.apple.usernotificationsserver.PendingNotificationRepository.observable", v12);

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = dispatch_queue_create("com.apple.usernotificationsserver.PendingNotificationRepository.call-out", v14);

  v16 = -[UNCKeyedObservable initWithQueue:callOutQueue:]([UNCKeyedObservable alloc], "initWithQueue:callOutQueue:", v13, v15);
  v17 = -[UNCPendingNotificationRepository initWithDataStoreRepository:observable:librarian:](self, "initWithDataStoreRepository:observable:librarian:", v11, v16, v9);

  return v17;
}

- (UNCPendingNotificationRepository)initWithDataStoreRepository:(id)a3 observable:(id)a4 librarian:(id)a5
{
  id v9;
  id v10;
  id v11;
  UNCPendingNotificationRepository *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)UNCPendingNotificationRepository;
  v12 = -[UNCPendingNotificationRepository init](&v17, sel_init);
  if (v12)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.usernotificationsserver.PendingNotificationRepository", v13);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v12->_repository, a3);
    objc_storeStrong((id *)&v12->_observable, a4);
    objc_storeStrong((id *)&v12->_librarian, a5);
  }

  return v12;
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
  block[2] = __68__UNCPendingNotificationRepository_addObserver_forBundleIdentifier___block_invoke;
  block[3] = &unk_251AE0250;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __68__UNCPendingNotificationRepository_addObserver_forBundleIdentifier___block_invoke(_QWORD *a1)
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
  block[2] = __71__UNCPendingNotificationRepository_removeObserver_forBundleIdentifier___block_invoke;
  block[3] = &unk_251AE0250;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

uint64_t __71__UNCPendingNotificationRepository_removeObserver_forBundleIdentifier___block_invoke(_QWORD *a1)
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
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__UNCPendingNotificationRepository_allBundleIdentifiers__block_invoke;
  v5[3] = &unk_251AE0178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __56__UNCPendingNotificationRepository_allBundleIdentifiers__block_invoke(uint64_t a1)
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

- (id)pendingNotificationRecordsForBundleIdentifier:(id)a3
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
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__UNCPendingNotificationRepository_pendingNotificationRecordsForBundleIdentifier___block_invoke;
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

void __82__UNCPendingNotificationRepository_pendingNotificationRecordsForBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_pendingNotificationRecordsForBundleIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setPendingNotificationRecords:(id)a3 forBundleIdentifier:(id)a4
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
  block[2] = __86__UNCPendingNotificationRepository_setPendingNotificationRecords_forBundleIdentifier___block_invoke;
  block[3] = &unk_251AE0250;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __86__UNCPendingNotificationRepository_setPendingNotificationRecords_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setPendingNotificationRecords:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
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
  block[2] = __68__UNCPendingNotificationRepository_notificationSourcesDidUninstall___block_invoke;
  block[3] = &unk_251AE01A0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __68__UNCPendingNotificationRepository_notificationSourcesDidUninstall___block_invoke(uint64_t a1)
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
  block[2] = __80__UNCPendingNotificationRepository_contentProtectionStateChangedForFirstUnlock___block_invoke;
  block[3] = &unk_251AE02A0;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __80__UNCPendingNotificationRepository_contentProtectionStateChangedForFirstUnlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "protectionStateChanged");
}

- (id)_queue_pendingNotificationDictionariesForBundleIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[UNCKeyedDataStoreRepository objectsForKey:](self->_repository, "objectsForKey:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = (void *)v5;
  else
    v6 = (void *)MEMORY[0x24BDBD1A8];
  v7 = (void *)*MEMORY[0x24BDF89C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v10 = 138543618;
    v11 = v4;
    v12 = 2048;
    v13 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_2499A5000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Load %ld pending notification dictionaries", (uint8_t *)&v10, 0x16u);

  }
  return v6;
}

- (void)_queue_setPendingNotificationDictionaries:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x24BDF89C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = 138543618;
    v11 = v7;
    v12 = 2048;
    v13 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_2499A5000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save %ld pending notification dictionaries", (uint8_t *)&v10, 0x16u);

  }
  -[UNCKeyedDataStoreRepository setObjects:forKey:](self->_repository, "setObjects:forKey:", v6, v7);

}

- (id)_queue_pendingNotificationRecordsForBundleIdentifier:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[UNCPendingNotificationRepository _queue_pendingNotificationDictionariesForBundleIdentifier:](self, "_queue_pendingNotificationDictionariesForBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_map:", UNSDictionaryToNotificationRecord);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = (void *)v4;
  else
    v5 = (void *)MEMORY[0x24BDBD1A8];

  return v5;
}

- (void)_queue_setPendingNotificationRecords:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[UNCPendingNotificationRepository _queue_pendingNotificationDictionariesForBundleIdentifier:](self, "_queue_pendingNotificationDictionariesForBundleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_map:", UNSDictionaryToNotificationRecord);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((UNEqualObjects() & 1) == 0 && (objc_msgSend(v8, "count") || objc_msgSend(v10, "count")))
  {
    objc_msgSend(v10, "bs_map:", UNSNotificationRecordToDictionary);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCPendingNotificationRepository _queue_setPendingNotificationDictionaries:forBundleIdentifier:](self, "_queue_setPendingNotificationDictionaries:forBundleIdentifier:", v9, v6);
    -[UNCPendingNotificationRepository _queue_notifyObserversOfChangesFrom:to:forBundleIdentifier:](self, "_queue_notifyObserversOfChangesFrom:to:forBundleIdentifier:", v8, v10, v6);

  }
}

- (void)_queue_notifyObserversOfChangesFrom:(id)a3 to:(id)a4 forBundleIdentifier:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  os_log_t *v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  UNCKeyedObservable *observable;
  id v37;
  id v38;
  id v39;
  id v41;
  id obj;
  _QWORD v43[5];
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint8_t v59[128];
  uint8_t buf[4];
  id v61;
  __int16 v62;
  void *v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v39 = a4;
  v41 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v55;
    v13 = (os_log_t *)MEMORY[0x24BDF89C8];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v55 != v12)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v15, "identifier", v39);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "length");

        if (v17)
        {
          objc_msgSend(v15, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v15, v18);
        }
        else
        {
          +[UNSNotificationRecordRemoveUpdate updateWithNotificationRecord:shouldSync:](UNSNotificationRecordRemoveUpdate, "updateWithNotificationRecord:shouldSync:", v15, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v18);
          v19 = *v13;
          if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v61 = v41;
            v62 = 2112;
            v63 = v15;
            _os_log_error_impl(&dword_2499A5000, v19, OS_LOG_TYPE_ERROR, "[%{public}@] An invalid notification record was present in the pending notifications store (no identifier present), record=%@", buf, 0x16u);
          }
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
    }
    while (v11);
  }

  v52 = 0u;
  v53 = 0u;
  v51 = 0u;
  v50 = 0u;
  v20 = v39;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v51 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
        objc_msgSend(v25, "identifier", v39);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bs_takeObjectForKey:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          if ((objc_msgSend(v25, "isEqual:", v27) & 1) != 0)
            goto LABEL_22;
          +[UNSNotificationRecordReplaceUpdate updateWithNotificationRecord:replacedNotificationRecord:shouldRepost:](UNSNotificationRecordReplaceUpdate, "updateWithNotificationRecord:replacedNotificationRecord:shouldRepost:", v25, v27, 1);
          v28 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          +[UNSNotificationRecordAddUpdate updateWithNotificationRecord:shouldSync:](UNSNotificationRecordAddUpdate, "updateWithNotificationRecord:shouldSync:", v25, 1);
          v28 = objc_claimAutoreleasedReturnValue();
        }
        v29 = (void *)v28;
        objc_msgSend(v8, "addObject:", v28);

LABEL_22:
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v22);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v9, "allValues");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v47;
    do
    {
      for (k = 0; k != v32; ++k)
      {
        if (*(_QWORD *)v47 != v33)
          objc_enumerationMutation(v30);
        +[UNSNotificationRecordRemoveUpdate updateWithNotificationRecord:shouldSync:](UNSNotificationRecordRemoveUpdate, "updateWithNotificationRecord:shouldSync:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * k), 0, v39);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v35);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    }
    while (v32);
  }

  observable = self->_observable;
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __95__UNCPendingNotificationRepository__queue_notifyObserversOfChangesFrom_to_forBundleIdentifier___block_invoke;
  v43[3] = &unk_251AE0380;
  v43[4] = self;
  v44 = v8;
  v45 = v41;
  v37 = v41;
  v38 = v8;
  -[UNCKeyedObservable notifyObserversKey:usingBlock:](observable, "notifyObserversKey:usingBlock:", v37, v43);

}

uint64_t __95__UNCPendingNotificationRepository__queue_notifyObserversOfChangesFrom_to_forBundleIdentifier___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "pendingNotificationRepository:didPerformUpdates:forBundleIdentifier:", a1[4], a1[5], a1[6]);
}

- (void)_queue_notificationSourcesDidUninstall:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  os_log_t *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v15;
    v9 = (os_log_t *)MEMORY[0x24BDF89C8];
    *(_QWORD *)&v6 = 138543362;
    v13 = v6;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "bundleIdentifier", v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v13;
          v19 = v11;
          _os_log_impl(&dword_2499A5000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Remove all pending notification dictionaries", buf, 0xCu);
        }
        -[UNCKeyedDataStoreRepository removeStoreForKey:](self->_repository, "removeStoreForKey:", v11);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_librarian, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observable, 0);
  objc_storeStrong((id *)&self->_repository, 0);
}

@end
