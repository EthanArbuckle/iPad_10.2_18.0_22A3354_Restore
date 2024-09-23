@implementation UNUserNotificationSettingsServiceConnection

- (void)updateNotificationSourcesWithBundleIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  v5 = self->_observers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "settingsServiceConnection:didUpdateNotificationSourcesWithIdentifiers:", self, v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  return (id)sharedInstance___sharedInstance;
}

void __61__UNUserNotificationSettingsServiceConnection_sharedInstance__block_invoke()
{
  UNUserNotificationSettingsServiceConnection *v0;
  void *v1;

  v0 = objc_alloc_init(UNUserNotificationSettingsServiceConnection);
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

- (UNUserNotificationSettingsServiceConnection)init
{
  UNUserNotificationSettingsServiceConnection *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSMutableArray *v6;
  NSMutableArray *observers;
  NSObject *v8;
  _QWORD block[4];
  UNUserNotificationSettingsServiceConnection *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UNUserNotificationSettingsServiceConnection;
  v2 = -[UNUserNotificationSettingsServiceConnection init](&v12, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.usernotifications.UNUserNotificationSettingsServiceConnection", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    observers = v2->_observers;
    v2->_observers = v6;

    v8 = v2->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__UNUserNotificationSettingsServiceConnection_init__block_invoke;
    block[3] = &unk_24C3C8110;
    v11 = v2;
    dispatch_async(v8, block);

  }
  return v2;
}

id __51__UNUserNotificationSettingsServiceConnection_init__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
}

- (void)addObserver:(id)a3
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
  block[2] = __59__UNUserNotificationSettingsServiceConnection_addObserver___block_invoke;
  block[3] = &unk_24C3C80A0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __59__UNUserNotificationSettingsServiceConnection_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addObserver:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
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
  block[2] = __62__UNUserNotificationSettingsServiceConnection_removeObserver___block_invoke;
  block[3] = &unk_24C3C80A0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __62__UNUserNotificationSettingsServiceConnection_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeObserver:", *(_QWORD *)(a1 + 40));
}

- (id)notificationSourceWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v5 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v4;
    _os_log_impl(&dword_20ADA1000, v5, OS_LOG_TYPE_DEFAULT, "Getting notification source %{public}@ (sync)", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__UNUserNotificationSettingsServiceConnection_notificationSourceWithIdentifier___block_invoke;
  block[3] = &unk_24C3C8188;
  block[4] = self;
  v11 = v4;
  v12 = &v13;
  v7 = v4;
  dispatch_sync(queue, block);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __80__UNUserNotificationSettingsServiceConnection_notificationSourceWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__UNUserNotificationSettingsServiceConnection_notificationSourceWithIdentifier___block_invoke_2;
  v7[3] = &unk_24C3C8138;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __80__UNUserNotificationSettingsServiceConnection_notificationSourceWithIdentifier___block_invoke_4;
  v6[3] = &unk_24C3C8160;
  v5 = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v4, "getNotificationSource:withCompletionHandler:", v5, v6);

}

void __80__UNUserNotificationSettingsServiceConnection_notificationSourceWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
    __80__UNUserNotificationSettingsServiceConnection_notificationSourceWithIdentifier___block_invoke_2_cold_1();

}

void __80__UNUserNotificationSettingsServiceConnection_notificationSourceWithIdentifier___block_invoke_4(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v5 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_20ADA1000, v5, OS_LOG_TYPE_DEFAULT, "Got notification source %{public}@", (uint8_t *)&v7, 0xCu);
  }

}

- (id)notificationSourcesWithIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v5 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v4;
    _os_log_impl(&dword_20ADA1000, v5, OS_LOG_TYPE_DEFAULT, "Getting notification sources %{public}@ (sync)", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__UNUserNotificationSettingsServiceConnection_notificationSourcesWithIdentifiers___block_invoke;
  block[3] = &unk_24C3C8188;
  block[4] = self;
  v11 = v4;
  v12 = &v13;
  v7 = v4;
  dispatch_sync(queue, block);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __82__UNUserNotificationSettingsServiceConnection_notificationSourcesWithIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __82__UNUserNotificationSettingsServiceConnection_notificationSourcesWithIdentifiers___block_invoke_2;
  v7[3] = &unk_24C3C8138;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __82__UNUserNotificationSettingsServiceConnection_notificationSourcesWithIdentifiers___block_invoke_6;
  v6[3] = &unk_24C3C81B0;
  v5 = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v4, "getNotificationSources:withCompletionHandler:", v5, v6);

}

void __82__UNUserNotificationSettingsServiceConnection_notificationSourcesWithIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
    __82__UNUserNotificationSettingsServiceConnection_notificationSourcesWithIdentifiers___block_invoke_2_cold_1();

}

void __82__UNUserNotificationSettingsServiceConnection_notificationSourcesWithIdentifiers___block_invoke_6(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v5 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_20ADA1000, v5, OS_LOG_TYPE_DEFAULT, "Got notification sources %{public}@", (uint8_t *)&v7, 0xCu);
  }

}

- (id)allNotificationSources
{
  NSObject *v3;
  NSObject *queue;
  id v5;
  _QWORD v7[6];
  uint8_t buf[16];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v3 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20ADA1000, v3, OS_LOG_TYPE_DEFAULT, "Getting all notification sources (sync)", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__UNUserNotificationSettingsServiceConnection_allNotificationSources__block_invoke;
  v7[3] = &unk_24C3C8218;
  v7[4] = self;
  v7[5] = &v9;
  dispatch_sync(queue, v7);
  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __69__UNUserNotificationSettingsServiceConnection_allNotificationSources__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __69__UNUserNotificationSettingsServiceConnection_allNotificationSources__block_invoke_9;
  v4[3] = &unk_24C3C81B0;
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "getAllNotificationSourcesWithCompletionHandler:", v4);

}

void __69__UNUserNotificationSettingsServiceConnection_allNotificationSources__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
    __69__UNUserNotificationSettingsServiceConnection_allNotificationSources__block_invoke_2_cold_1();

}

void __69__UNUserNotificationSettingsServiceConnection_allNotificationSources__block_invoke_9(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v5 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_20ADA1000, v5, OS_LOG_TYPE_DEFAULT, "Got all notification sources %{public}@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)authorizationWithOptions:(unint64_t)a3 forNotificationSourceIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  unint64_t v17;
  uint8_t buf[4];
  unint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v19 = a3;
    v20 = 2114;
    v21 = v8;
    _os_log_impl(&dword_20ADA1000, v10, OS_LOG_TYPE_DEFAULT, "Authorize notification settings %ld for source %{public}@ (sync)", buf, 0x16u);
  }
  queue = self->_queue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __126__UNUserNotificationSettingsServiceConnection_authorizationWithOptions_forNotificationSourceIdentifier_withCompletionHandler___block_invoke;
  v14[3] = &unk_24C3C8288;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = a3;
  v12 = v9;
  v13 = v8;
  dispatch_sync(queue, v14);

}

void __126__UNUserNotificationSettingsServiceConnection_authorizationWithOptions_forNotificationSourceIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __126__UNUserNotificationSettingsServiceConnection_authorizationWithOptions_forNotificationSourceIdentifier_withCompletionHandler___block_invoke_11;
  v6[3] = &unk_24C3C8260;
  v7 = v5;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v3, "authorizationWithOptions:forNotificationSourceIdentifier:withCompletionHandler:", v4, v7, v6);

}

void __126__UNUserNotificationSettingsServiceConnection_authorizationWithOptions_forNotificationSourceIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
    __126__UNUserNotificationSettingsServiceConnection_authorizationWithOptions_forNotificationSourceIdentifier_withCompletionHandler___block_invoke_2_cold_1();

}

void __126__UNUserNotificationSettingsServiceConnection_authorizationWithOptions_forNotificationSourceIdentifier_withCompletionHandler___block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *MEMORY[0x24BDF8998];
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
      __126__UNUserNotificationSettingsServiceConnection_authorizationWithOptions_forNotificationSourceIdentifier_withCompletionHandler___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v9 = 138543618;
    v10 = v7;
    v11 = 1024;
    v12 = a2;
    _os_log_impl(&dword_20ADA1000, v6, OS_LOG_TYPE_DEFAULT, "Authorize notification settings for %{public}@ completed with status granted: %d", (uint8_t *)&v9, 0x12u);
  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

- (void)replaceNotificationSettings:(id)a3 forNotificationSourceIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v16 = v6;
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_20ADA1000, v8, OS_LOG_TYPE_DEFAULT, "Replace notification settings %{public}@ for source %{public}@ (sync)", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __107__UNUserNotificationSettingsServiceConnection_replaceNotificationSettings_forNotificationSourceIdentifier___block_invoke;
  block[3] = &unk_24C3C82D0;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_sync(queue, block);

}

void __107__UNUserNotificationSettingsServiceConnection_replaceNotificationSettings_forNotificationSourceIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_13);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "replaceNotificationSettings:forNotificationSourceIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __107__UNUserNotificationSettingsServiceConnection_replaceNotificationSettings_forNotificationSourceIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
    __107__UNUserNotificationSettingsServiceConnection_replaceNotificationSettings_forNotificationSourceIdentifier___block_invoke_2_cold_1();

}

- (void)replaceNotificationTopicSettings:(id)a3 forNotificationSourceIdentifier:(id)a4 topicIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v21 = v8;
    v22 = 2114;
    v23 = v9;
    v24 = 2114;
    v25 = v10;
    _os_log_impl(&dword_20ADA1000, v11, OS_LOG_TYPE_DEFAULT, "Replace notification topic settings %{public}@ for source %{public}@ and topic %{public}@ (sync)", buf, 0x20u);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __128__UNUserNotificationSettingsServiceConnection_replaceNotificationTopicSettings_forNotificationSourceIdentifier_topicIdentifier___block_invoke;
  v16[3] = &unk_24C3C8318;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  dispatch_sync(queue, v16);

}

void __128__UNUserNotificationSettingsServiceConnection_replaceNotificationTopicSettings_forNotificationSourceIdentifier_topicIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_14);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "replaceNotificationTopicSettings:forNotificationSourceIdentifier:topicIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __128__UNUserNotificationSettingsServiceConnection_replaceNotificationTopicSettings_forNotificationSourceIdentifier_topicIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
    __128__UNUserNotificationSettingsServiceConnection_replaceNotificationTopicSettings_forNotificationSourceIdentifier_topicIdentifier___block_invoke_2_cold_1();

}

- (id)notificationSystemSettings
{
  NSObject *v3;
  NSObject *queue;
  id v5;
  _QWORD v7[6];
  uint8_t buf[16];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v3 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20ADA1000, v3, OS_LOG_TYPE_DEFAULT, "Getting system settings (sync)", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__UNUserNotificationSettingsServiceConnection_notificationSystemSettings__block_invoke;
  v7[3] = &unk_24C3C8218;
  v7[4] = self;
  v7[5] = &v9;
  dispatch_sync(queue, v7);
  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __73__UNUserNotificationSettingsServiceConnection_notificationSystemSettings__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __73__UNUserNotificationSettingsServiceConnection_notificationSystemSettings__block_invoke_16;
  v4[3] = &unk_24C3C8360;
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "getNotificationSystemSettingsWithCompletionHandler:", v4);

}

void __73__UNUserNotificationSettingsServiceConnection_notificationSystemSettings__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
    __73__UNUserNotificationSettingsServiceConnection_notificationSystemSettings__block_invoke_2_cold_1();

}

void __73__UNUserNotificationSettingsServiceConnection_notificationSystemSettings__block_invoke_16(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v5 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_20ADA1000, v5, OS_LOG_TYPE_DEFAULT, "Got system settings %{public}@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)setNotificationSystemSettings:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20ADA1000, v5, OS_LOG_TYPE_DEFAULT, "Setting system settings (sync)", buf, 2u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __77__UNUserNotificationSettingsServiceConnection_setNotificationSystemSettings___block_invoke;
  v8[3] = &unk_24C3C80A0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(queue, v8);

}

void __77__UNUserNotificationSettingsServiceConnection_setNotificationSystemSettings___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_18);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNotificationSystemSettings:", *(_QWORD *)(a1 + 40));

}

void __77__UNUserNotificationSettingsServiceConnection_setNotificationSystemSettings___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
    __77__UNUserNotificationSettingsServiceConnection_setNotificationSystemSettings___block_invoke_2_cold_1();

}

- (void)resetScheduledDeliverySetting
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20ADA1000, v3, OS_LOG_TYPE_DEFAULT, "Resetting scheduled delivery setting (sync)", buf, 2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__UNUserNotificationSettingsServiceConnection_resetScheduledDeliverySetting__block_invoke;
  block[3] = &unk_24C3C8110;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __76__UNUserNotificationSettingsServiceConnection_resetScheduledDeliverySetting__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_19);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resetScheduledDeliverySetting");

}

void __76__UNUserNotificationSettingsServiceConnection_resetScheduledDeliverySetting__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
    __76__UNUserNotificationSettingsServiceConnection_resetScheduledDeliverySetting__block_invoke_2_cold_1();

}

- (void)_queue_addObserver:(id)a3
{
  -[NSMutableArray addObject:](self->_observers, "addObject:", a3);
}

- (void)_queue_removeObserver:(id)a3
{
  -[NSMutableArray removeObject:](self->_observers, "removeObject:", a3);
}

- (void)_invalidate
{
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", 0);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", 0);
  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", 0);
  -[UNUserNotificationSettingsServiceConnection setConnection:](self, "setConnection:", 0);
}

- (id)_queue_ensureConnection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  void *v9;
  NSXPCConnection *v10;
  id v11;
  NSXPCConnection *v12;
  uint64_t v13;
  NSXPCConnection *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id from;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  connection = self->_connection;
  if (!connection)
  {
    objc_initWeak(&location, self);
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.usernotifications.usernotificationsettingsservice"), 0);
    v5 = self->_connection;
    self->_connection = v4;

    v6 = self->_connection;
    +[UNUserNotificationSettingsService serverInterface](UNUserNotificationSettingsService, "serverInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);

    v8 = self->_connection;
    +[UNUserNotificationSettingsService clientInterface](UNUserNotificationSettingsService, "clientInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v8, "setExportedInterface:", v9);

    v10 = self->_connection;
    v11 = objc_loadWeakRetained(&location);
    -[NSXPCConnection setExportedObject:](v10, "setExportedObject:", v11);

    objc_initWeak(&from, self->_queue);
    v12 = self->_connection;
    v13 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __70__UNUserNotificationSettingsServiceConnection__queue_ensureConnection__block_invoke;
    v22[3] = &unk_24C3C83D0;
    objc_copyWeak(&v23, &from);
    objc_copyWeak(&v24, &location);
    -[NSXPCConnection setInterruptionHandler:](v12, "setInterruptionHandler:", v22);
    v14 = self->_connection;
    v16 = v13;
    v17 = 3221225472;
    v18 = __70__UNUserNotificationSettingsServiceConnection__queue_ensureConnection__block_invoke_3;
    v19 = &unk_24C3C83D0;
    objc_copyWeak(&v20, &from);
    objc_copyWeak(&v21, &location);
    -[NSXPCConnection setInvalidationHandler:](v14, "setInvalidationHandler:", &v16);
    -[NSXPCConnection resume](self->_connection, "resume", v16, v17, v18, v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

void __70__UNUserNotificationSettingsServiceConnection__queue_ensureConnection__block_invoke(uint64_t a1)
{
  NSObject *WeakRetained;
  _QWORD block[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__UNUserNotificationSettingsServiceConnection__queue_ensureConnection__block_invoke_2;
    block[3] = &unk_24C3C83A8;
    objc_copyWeak(&v4, (id *)(a1 + 40));
    dispatch_async(WeakRetained, block);
    objc_destroyWeak(&v4);
  }

}

void __70__UNUserNotificationSettingsServiceConnection__queue_ensureConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_interruptedConnection");

}

void __70__UNUserNotificationSettingsServiceConnection__queue_ensureConnection__block_invoke_3(uint64_t a1)
{
  NSObject *WeakRetained;
  _QWORD block[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__UNUserNotificationSettingsServiceConnection__queue_ensureConnection__block_invoke_4;
    block[3] = &unk_24C3C83A8;
    objc_copyWeak(&v4, (id *)(a1 + 40));
    dispatch_async(WeakRetained, block);
    objc_destroyWeak(&v4);
  }

}

void __70__UNUserNotificationSettingsServiceConnection__queue_ensureConnection__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_invalidatedConnection");

}

- (void)_queue_interruptedConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

- (void)_queue_invalidatedConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[UNUserNotificationSettingsServiceConnection _invalidate](self, "_invalidate");
}

- (void)updateNotificationSystemSettings:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  v5 = self->_observers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "settingsServiceConnection:didUpdateNotificationSystemSettings:", self, v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)callOutQueue
{
  return self->_callOutQueue;
}

- (void)setCallOutQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callOutQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __80__UNUserNotificationSettingsServiceConnection_notificationSourceWithIdentifier___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_20ADA1000, v0, v1, "Getting notification source %{public}@ (sync) failed with error: %{public}@");
  OUTLINED_FUNCTION_1();
}

void __82__UNUserNotificationSettingsServiceConnection_notificationSourcesWithIdentifiers___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_20ADA1000, v0, v1, "Getting notification sources %{public}@ (sync) failed with error: %{public}@");
  OUTLINED_FUNCTION_1();
}

void __69__UNUserNotificationSettingsServiceConnection_allNotificationSources__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20ADA1000, v0, v1, "Getting all notification sources (sync) failed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __126__UNUserNotificationSettingsServiceConnection_authorizationWithOptions_forNotificationSourceIdentifier_withCompletionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20ADA1000, v0, v1, "Authorize notification settings (sync) failed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __107__UNUserNotificationSettingsServiceConnection_replaceNotificationSettings_forNotificationSourceIdentifier___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20ADA1000, v0, v1, "Replace notification settings (sync) failed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __128__UNUserNotificationSettingsServiceConnection_replaceNotificationTopicSettings_forNotificationSourceIdentifier_topicIdentifier___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20ADA1000, v0, v1, "Replace notification topic settings (sync) failed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__UNUserNotificationSettingsServiceConnection_notificationSystemSettings__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20ADA1000, v0, v1, "Getting system settings (sync) failed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __77__UNUserNotificationSettingsServiceConnection_setNotificationSystemSettings___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20ADA1000, v0, v1, "Setting system settings (sync) failed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __76__UNUserNotificationSettingsServiceConnection_resetScheduledDeliverySetting__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20ADA1000, v0, v1, "Resetting scheduled delivery setting (sync) failed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
