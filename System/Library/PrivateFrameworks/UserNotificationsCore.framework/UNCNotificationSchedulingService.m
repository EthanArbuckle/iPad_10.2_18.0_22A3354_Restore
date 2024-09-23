@implementation UNCNotificationSchedulingService

- (UNCNotificationSchedulingService)initWithNotificationRepository:(id)a3 pendingNotificationRepository:(id)a4 notificationScheduleRepository:(id)a5 locationMonitor:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  UNCNotificationSchedulingService *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v19;
  NSMutableDictionary *clients;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)UNCNotificationSchedulingService;
  v15 = -[UNCNotificationSchedulingService init](&v22, sel_init);
  if (v15)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.usernotificationsserver.NotificationSchedulingService", v16);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    clients = v15->_clients;
    v15->_clients = v19;

    objc_storeStrong((id *)&v15->_notificationRepository, a3);
    objc_storeStrong((id *)&v15->_notificationScheduleRepository, a5);
    objc_storeStrong((id *)&v15->_pendingNotificationRepository, a4);
    objc_storeStrong((id *)&v15->_locationMonitor, a6);
  }

  return v15;
}

- (void)addPendingNotificationRecords:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __108__UNCNotificationSchedulingService_addPendingNotificationRecords_forBundleIdentifier_withCompletionHandler___block_invoke;
  v15[3] = &unk_251AE0BE8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

uint64_t __108__UNCNotificationSchedulingService_addPendingNotificationRecords_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_queue_addPendingNotificationRecords:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
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
  block[2] = __86__UNCNotificationSchedulingService_setPendingNotificationRecords_forBundleIdentifier___block_invoke;
  block[3] = &unk_251AE0250;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __86__UNCNotificationSchedulingService_setPendingNotificationRecords_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setPendingNotificationRecords:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)removePendingNotificationRecordsWithIdentifiers:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __126__UNCNotificationSchedulingService_removePendingNotificationRecordsWithIdentifiers_forBundleIdentifier_withCompletionHandler___block_invoke;
  v15[3] = &unk_251AE0BE8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

uint64_t __126__UNCNotificationSchedulingService_removePendingNotificationRecordsWithIdentifiers_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_queue_removePendingNotificationRecordsWithIdentifiers:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeSimilarPendingNotificationRecords:(id)a3 forBundleIdentifier:(id)a4
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
  block[2] = __96__UNCNotificationSchedulingService_removeSimilarPendingNotificationRecords_forBundleIdentifier___block_invoke;
  block[3] = &unk_251AE0250;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __96__UNCNotificationSchedulingService_removeSimilarPendingNotificationRecords_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeSimilarPendingNotificationRecords:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)removeAllPendingNotificationRecordsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
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
  block[2] = __113__UNCNotificationSchedulingService_removeAllPendingNotificationRecordsForBundleIdentifier_withCompletionHandler___block_invoke;
  block[3] = &unk_251AE0698;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __113__UNCNotificationSchedulingService_removeAllPendingNotificationRecordsForBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllPendingNotificationRecordsForBundleIdentifier:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
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
  v15 = __Block_byref_object_copy__8;
  v16 = __Block_byref_object_dispose__8;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__UNCNotificationSchedulingService_pendingNotificationRecordsForBundleIdentifier___block_invoke;
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

void __82__UNCNotificationSchedulingService_pendingNotificationRecordsForBundleIdentifier___block_invoke(uint64_t a1)
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

- (id)undeliveredNotificationRecordsForBundleIdentifier:(id)a3
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
  v15 = __Block_byref_object_copy__8;
  v16 = __Block_byref_object_dispose__8;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__UNCNotificationSchedulingService_undeliveredNotificationRecordsForBundleIdentifier___block_invoke;
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

void __86__UNCNotificationSchedulingService_undeliveredNotificationRecordsForBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_undeliveredNotificationRequestsForBundleIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)didChangeNotificationSettings:(id)a3 forBundleIdentifier:(id)a4
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
  block[2] = __86__UNCNotificationSchedulingService_didChangeNotificationSettings_forBundleIdentifier___block_invoke;
  block[3] = &unk_251AE0250;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

uint64_t __86__UNCNotificationSchedulingService_didChangeNotificationSettings_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_didChangeNotificationSettings:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
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
  block[2] = __68__UNCNotificationSchedulingService_notificationSourcesDidUninstall___block_invoke;
  block[3] = &unk_251AE01A0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __68__UNCNotificationSchedulingService_notificationSourcesDidUninstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notificationSourcesDidUninstall:", *(_QWORD *)(a1 + 40));
}

- (void)applicationStateDidRestore
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__UNCNotificationSchedulingService_applicationStateDidRestore__block_invoke;
  block[3] = &unk_251AE02A0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __62__UNCNotificationSchedulingService_applicationStateDidRestore__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_applicationStateDidRestore");
}

- (void)localeDidChange
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__UNCNotificationSchedulingService_localeDidChange__block_invoke;
  block[3] = &unk_251AE02A0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __51__UNCNotificationSchedulingService_localeDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_localeDidChange");
}

- (void)timeDidChangeSignificantly
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__UNCNotificationSchedulingService_timeDidChangeSignificantly__block_invoke;
  block[3] = &unk_251AE02A0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __62__UNCNotificationSchedulingService_timeDidChangeSignificantly__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_timeDidChangeSignificantly");
}

- (void)_queue_addPendingNotificationRecords:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[UNCNotificationSchedulingService _queue_clientForBundleIdentifier:](self, "_queue_clientForBundleIdentifier:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addPendingNotificationRecords:", v6);

}

- (void)_queue_setPendingNotificationRecords:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[UNCNotificationSchedulingService _queue_clientForBundleIdentifier:](self, "_queue_clientForBundleIdentifier:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPendingNotificationRecords:", v6);

}

- (void)_queue_removePendingNotificationRecordsWithIdentifiers:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[UNCNotificationSchedulingService _queue_clientForBundleIdentifier:](self, "_queue_clientForBundleIdentifier:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removePendingNotificationRecordsWithIdentifiers:", v6);

}

- (void)_queue_removeSimilarPendingNotificationRecords:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[UNCNotificationSchedulingService _queue_clientForBundleIdentifier:](self, "_queue_clientForBundleIdentifier:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removePendingNotificationRecords:", v6);

}

- (void)_queue_removeAllPendingNotificationRecordsForBundleIdentifier:(id)a3
{
  id v3;

  -[UNCNotificationSchedulingService _queue_clientForBundleIdentifier:](self, "_queue_clientForBundleIdentifier:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllPendingNotificationRecords");

}

- (id)_queue_pendingNotificationRecordsForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[UNCNotificationSchedulingService _queue_clientForBundleIdentifier:](self, "_queue_clientForBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pendingNotificationRecords");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_queue_undeliveredNotificationRequestsForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[UNCNotificationSchedulingService _queue_clientForBundleIdentifier:](self, "_queue_clientForBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undeliveredNotificationRecords");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_queue_didChangeNotificationSettings:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;

  v7 = a4;
  if (objc_msgSend(a3, "hasEnabledSettings"))
    v6 = -[UNCNotificationSchedulingService _queue_addClientForBundleIdentifier:](self, "_queue_addClientForBundleIdentifier:", v7);
  else
    -[UNCNotificationSchedulingService _queue_removeClientForBundleIdentifier:](self, "_queue_removeClientForBundleIdentifier:", v7);

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
        -[UNCNotificationSchedulingService _queue_removeClientForBundleIdentifier:](self, "_queue_removeClientForBundleIdentifier:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_queue_applicationStateDidRestore
{
  void *v3;
  NSMutableDictionary *clients;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)*MEMORY[0x24BDF89C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
  {
    clients = self->_clients;
    v5 = v3;
    *(_DWORD *)buf = 134217984;
    v17 = -[NSMutableDictionary count](clients, "count");
    _os_log_impl(&dword_2499A5000, v5, OS_LOG_TYPE_DEFAULT, "Application state restored for %ld clients", buf, 0xCu);

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](self->_clients, "allValues", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "handleApplicationStateRestore");
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_queue_localeDidChange
{
  void *v3;
  NSMutableDictionary *clients;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)*MEMORY[0x24BDF89C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
  {
    clients = self->_clients;
    v5 = v3;
    *(_DWORD *)buf = 134217984;
    v17 = -[NSMutableDictionary count](clients, "count");
    _os_log_impl(&dword_2499A5000, v5, OS_LOG_TYPE_DEFAULT, "Handle locale change for %ld clients", buf, 0xCu);

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](self->_clients, "allValues", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "handleLocaleChange");
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_queue_timeDidChangeSignificantly
{
  void *v3;
  NSMutableDictionary *clients;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)*MEMORY[0x24BDF89C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
  {
    clients = self->_clients;
    v5 = v3;
    *(_DWORD *)buf = 134217984;
    v17 = -[NSMutableDictionary count](clients, "count");
    _os_log_impl(&dword_2499A5000, v5, OS_LOG_TYPE_DEFAULT, "Handle significant time change for %ld clients", buf, 0xCu);

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](self->_clients, "allValues", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "handleSignificantTimeChange");
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (id)_queue_addClientForBundleIdentifier:(id)a3
{
  id v4;
  UNCLocalNotificationClient *v5;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_clients, "objectForKey:", v4);
  v5 = (UNCLocalNotificationClient *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[UNCLocalNotificationClient initWithNotificationRepository:pendingNotificationRepository:notificationScheduleRepository:locationMonitor:bundleIdentifier:queue:]([UNCLocalNotificationClient alloc], "initWithNotificationRepository:pendingNotificationRepository:notificationScheduleRepository:locationMonitor:bundleIdentifier:queue:", self->_notificationRepository, self->_pendingNotificationRepository, self->_notificationScheduleRepository, self->_locationMonitor, v4, self->_queue);
    -[NSMutableDictionary setObject:forKey:](self->_clients, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (void)_queue_removeClientForBundleIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UNCNotificationSchedulingService _queue_clientForBundleIdentifier:](self, "_queue_clientForBundleIdentifier:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");
  -[NSMutableDictionary removeObjectForKey:](self->_clients, "removeObjectForKey:", v4);

}

- (id)_queue_clientForBundleIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_clients, "objectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_locationMonitor, 0);
  objc_storeStrong((id *)&self->_notificationScheduleRepository, 0);
  objc_storeStrong((id *)&self->_pendingNotificationRepository, 0);
  objc_storeStrong((id *)&self->_notificationRepository, 0);
}

@end
