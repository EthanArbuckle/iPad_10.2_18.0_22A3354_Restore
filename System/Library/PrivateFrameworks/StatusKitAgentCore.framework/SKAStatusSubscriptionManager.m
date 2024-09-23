@implementation SKAStatusSubscriptionManager

- (SKAStatusSubscriptionManager)initWithDatabaseManager:(id)a3 channelManager:(id)a4 pushManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  SKAStatusSubscriptionManager *v12;
  uint64_t v13;
  NSMapTable *activeTransientSubscriptionsByClient;
  uint64_t v15;
  NSMapTable *activePresenceSubscriptionsByClient;
  NSObject *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *internalWorkQueue;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SKAStatusSubscriptionManager;
  v12 = -[SKAStatusSubscriptionManager init](&v22, sel_init);
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v13 = objc_claimAutoreleasedReturnValue();
    activeTransientSubscriptionsByClient = v12->_activeTransientSubscriptionsByClient;
    v12->_activeTransientSubscriptionsByClient = (NSMapTable *)v13;

    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v15 = objc_claimAutoreleasedReturnValue();
    activePresenceSubscriptionsByClient = v12->_activePresenceSubscriptionsByClient;
    v12->_activePresenceSubscriptionsByClient = (NSMapTable *)v15;

    objc_storeStrong((id *)&v12->_databaseManager, a3);
    objc_storeStrong((id *)&v12->_channelManager, a4);
    objc_storeStrong((id *)&v12->_pushManager, a5);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_DEFAULT, 0);
    v18 = objc_claimAutoreleasedReturnValue();

    v19 = dispatch_queue_create("com.apple.StatusKitAgent.SubscriptionManager", v18);
    internalWorkQueue = v12->_internalWorkQueue;
    v12->_internalWorkQueue = (OS_dispatch_queue *)v19;

    *(_QWORD *)&v12->_transientSubscriptionsLock._os_unfair_lock_opaque = 0;
  }

  return v12;
}

- (void)retainTransientSubscriptionAssertionForSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 client:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *internalWorkQueue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  SKAStatusSubscriptionManager *v19;
  id v20;
  id v21;
  id location;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __133__SKAStatusSubscriptionManager_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke;
  v16[3] = &unk_24D9775E8;
  objc_copyWeak(&v21, &location);
  v17 = v10;
  v18 = v9;
  v19 = self;
  v20 = v11;
  v13 = v11;
  v14 = v9;
  v15 = v10;
  dispatch_async(internalWorkQueue, v16);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __133__SKAStatusSubscriptionManager_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if ((objc_msgSend(WeakRetained, "_addTransientSubscriptionAssertionForClient:subscriptionIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "Transient subscription assertion already existed, but still refreshing registered subscription assertions, to ensure apsd is in sync.", buf, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 48), "_markCacheSubscriptionDateForChannelIdentifier:", *(_QWORD *)(a1 + 40));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __133__SKAStatusSubscriptionManager_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke_5;
  v5[3] = &unk_24D976460;
  v4 = *(void **)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v4, "updateRegisteredSubscriptionsForActiveAssertionsWithCompletion:", v5);

}

void __133__SKAStatusSubscriptionManager_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void (*v6)(void);
  uint8_t v7[16];

  v3 = a2;
  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __133__SKAStatusSubscriptionManager_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke_5_cold_1();

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated registered subscriptions following transient assertion retain", v7, 2u);
    }

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (void)releaseTransientSubscriptionAssertionForSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 client:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *internalWorkQueue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  SKAStatusSubscriptionManager *v19;
  id v20;
  id v21;
  id location;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __134__SKAStatusSubscriptionManager_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke;
  v16[3] = &unk_24D9775E8;
  objc_copyWeak(&v21, &location);
  v17 = v10;
  v18 = v9;
  v19 = self;
  v20 = v11;
  v13 = v11;
  v14 = v9;
  v15 = v10;
  dispatch_async(internalWorkQueue, v16);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __134__SKAStatusSubscriptionManager_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = objc_msgSend(WeakRetained, "_removeTransientSubscriptionAssertionForClient:subscriptionIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Successfully removed transient subscription assertion from in memory model for subscription identifier: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __134__SKAStatusSubscriptionManager_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke_cold_1(a1 + 40, v5, v7, v8, v9, v10, v11, v12);
  }

  objc_msgSend(*(id *)(a1 + 48), "_markCacheSubscriptionDateForChannelIdentifier:", *(_QWORD *)(a1 + 40));
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __134__SKAStatusSubscriptionManager_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke_8;
  v14[3] = &unk_24D976460;
  v13 = *(void **)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  objc_msgSend(v13, "updateRegisteredSubscriptionsForActiveAssertionsWithCompletion:", v14);

}

void __134__SKAStatusSubscriptionManager_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void (*v6)(void);
  uint8_t v7[16];

  v3 = a2;
  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __134__SKAStatusSubscriptionManager_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke_8_cold_1();

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated registered subscriptions following transient assertion release", v7, 2u);
    }

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (void)releaseAllTransientSubscriptionAssertionsAssociatedWithClient:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *internalWorkQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SKAStatusSubscriptionManager *v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __105__SKAStatusSubscriptionManager_releaseAllTransientSubscriptionAssertionsAssociatedWithClient_completion___block_invoke;
  block[3] = &unk_24D977610;
  objc_copyWeak(&v15, &location);
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalWorkQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __105__SKAStatusSubscriptionManager_releaseAllTransientSubscriptionAssertionsAssociatedWithClient_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "activeTransientSubscriptionsByClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "count");
  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 134218242;
      v13 = objc_msgSend(v4, "count");
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Disconnecting client had %ld transient subscription assertion, removing transient assertions and updating registrations for channels: %@", buf, 0x16u);
    }

    objc_msgSend(WeakRetained, "activeTransientSubscriptionsByClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __105__SKAStatusSubscriptionManager_releaseAllTransientSubscriptionAssertionsAssociatedWithClient_completion___block_invoke_9;
    v10[3] = &unk_24D976460;
    v9 = *(void **)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v9, "updateRegisteredSubscriptionsForActiveAssertionsWithCompletion:", v10);

  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Disconnecting client had no active transient subscription assertions, not updating registered subscriptions", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __105__SKAStatusSubscriptionManager_releaseAllTransientSubscriptionAssertionsAssociatedWithClient_completion___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void (*v6)(void);
  uint8_t v7[16];

  v3 = a2;
  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __105__SKAStatusSubscriptionManager_releaseAllTransientSubscriptionAssertionsAssociatedWithClient_completion___block_invoke_9_cold_1();

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated registered subscriptions following client disconnect", v7, 2u);
    }

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (void)retainPersistentSubscriptionAssertionForSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 applicationIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *internalWorkQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  SKAStatusSubscriptionManager *v23;
  id v24;
  id v25;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __149__SKAStatusSubscriptionManager_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke;
  block[3] = &unk_24D977638;
  objc_copyWeak(&v25, &location);
  v20 = v10;
  v21 = v12;
  v22 = v11;
  v23 = self;
  v24 = v13;
  v15 = v13;
  v16 = v11;
  v17 = v12;
  v18 = v10;
  dispatch_async(internalWorkQueue, block);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __149__SKAStatusSubscriptionManager_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  NSObject *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "databaseManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "newBackgroundContext");
  objc_msgSend(v3, "existingSubscriptionAssertionForSubscriptionIdentifier:applicationIdentifier:databaseContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __149__SKAStatusSubscriptionManager_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(v3, "createSubscriptionAssertionForSubscriptionIdentifier:applicationIdentifier:statusTypeIdentifier:databaseContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v4);
    v6 = objc_claimAutoreleasedReturnValue();
    +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Created subscription assertion: %@", buf, 0xCu);
    }

  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __149__SKAStatusSubscriptionManager_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_10;
  v9[3] = &unk_24D976460;
  v8 = *(void **)(a1 + 56);
  v10 = *(id *)(a1 + 64);
  objc_msgSend(v8, "updateRegisteredSubscriptionsForActiveAssertionsWithCompletion:", v9);

}

void __149__SKAStatusSubscriptionManager_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void (*v6)(void);
  uint8_t v7[16];

  v3 = a2;
  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __149__SKAStatusSubscriptionManager_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_10_cold_1();

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated registered subscriptions following persistent assertion retain", v7, 2u);
    }

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (void)releasePersistentSubscriptionAssertionForSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 applicationIdentifier:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *internalWorkQueue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  SKAStatusSubscriptionManager *v19;
  id v20;
  id v21;
  id location;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __150__SKAStatusSubscriptionManager_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke;
  v16[3] = &unk_24D9775E8;
  objc_copyWeak(&v21, &location);
  v17 = v9;
  v18 = v10;
  v19 = self;
  v20 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(internalWorkQueue, v16);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __150__SKAStatusSubscriptionManager_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "databaseManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "newBackgroundContext");
  v5 = objc_msgSend(v3, "deleteSubscriptionAssertionWithSubscriptionIdentifier:applicationIdentifier:databaseContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v4);
  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v19 = v8;
      _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Successfully removed persistent subscription assertion from database for subscription identifier: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __150__SKAStatusSubscriptionManager_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_cold_1(a1 + 32, v7, v9, v10, v11, v12, v13, v14);
  }

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __150__SKAStatusSubscriptionManager_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_11;
  v16[3] = &unk_24D976460;
  v15 = *(void **)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  objc_msgSend(v15, "updateRegisteredSubscriptionsForActiveAssertionsWithCompletion:", v16);

}

void __150__SKAStatusSubscriptionManager_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void (*v6)(void);
  uint8_t v7[16];

  v3 = a2;
  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __150__SKAStatusSubscriptionManager_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_11_cold_1();

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated registered subscriptions following persistent assertion release", v7, 2u);
    }

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (void)allSubscriptionIdentifiersWithActiveAssertionsForStatusTypeIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *internalWorkQueue;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v5 = a4;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __113__SKAStatusSubscriptionManager_allSubscriptionIdentifiersWithActiveAssertionsForStatusTypeIdentifier_completion___block_invoke;
  block[3] = &unk_24D977660;
  objc_copyWeak(&v10, &location);
  v9 = v5;
  v7 = v5;
  dispatch_async(internalWorkQueue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __113__SKAStatusSubscriptionManager_allSubscriptionIdentifiersWithActiveAssertionsForStatusTypeIdentifier_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_fetchAllClientActiveSubscriptionAssertions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Returning %lu active assertions.", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)allStatusSubscriptionIdentifiersWithActiveSubscriptionsWithCompletion:(id)a3
{
  id v4;
  NSObject *internalWorkQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __102__SKAStatusSubscriptionManager_allStatusSubscriptionIdentifiersWithActiveSubscriptionsWithCompletion___block_invoke;
  block[3] = &unk_24D977660;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(internalWorkQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __102__SKAStatusSubscriptionManager_allStatusSubscriptionIdentifiersWithActiveSubscriptionsWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "channelManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __102__SKAStatusSubscriptionManager_allStatusSubscriptionIdentifiersWithActiveSubscriptionsWithCompletion___block_invoke_2;
  v4[3] = &unk_24D9772A0;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "activeStatusChannelSubscriptionsWithCompletion:", v4);

}

void __102__SKAStatusSubscriptionManager_allStatusSubscriptionIdentifiersWithActiveSubscriptionsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Returning %lu active subscriptions.", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)releaseAllPresenceSubscriptionAssertionsAssociatedWithClient:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *internalWorkQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SKAStatusSubscriptionManager *v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __104__SKAStatusSubscriptionManager_releaseAllPresenceSubscriptionAssertionsAssociatedWithClient_completion___block_invoke;
  block[3] = &unk_24D977610;
  objc_copyWeak(&v15, &location);
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalWorkQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __104__SKAStatusSubscriptionManager_releaseAllPresenceSubscriptionAssertionsAssociatedWithClient_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "activePresenceSubscriptionsByClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "count");
  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 134218242;
      v13 = objc_msgSend(v4, "count");
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Disconnecting presence client had %ld transient subscription assertion, removing transient assertions and updating registrations for channels: %@", buf, 0x16u);
    }

    objc_msgSend(WeakRetained, "activePresenceSubscriptionsByClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __104__SKAStatusSubscriptionManager_releaseAllPresenceSubscriptionAssertionsAssociatedWithClient_completion___block_invoke_13;
    v10[3] = &unk_24D976460;
    v9 = *(void **)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v9, "updateRegisteredSubscriptionsForActiveAssertionsWithCompletion:", v10);

  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Disconnecting presence client had no active transient subscription assertions, not updating registered subscriptions", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __104__SKAStatusSubscriptionManager_releaseAllPresenceSubscriptionAssertionsAssociatedWithClient_completion___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void (*v6)(void);
  uint8_t v7[16];

  v3 = a2;
  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __105__SKAStatusSubscriptionManager_releaseAllTransientSubscriptionAssertionsAssociatedWithClient_completion___block_invoke_9_cold_1();

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated registered subscriptions following client disconnect", v7, 2u);
    }

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (void)releasePresenceSubscriptionAssertionForSubscriptionIdentifier:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *internalWorkQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  SKAStatusSubscriptionManager *v18;
  id v19;
  id v20;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __112__SKAStatusSubscriptionManager_releasePresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke;
  v15[3] = &unk_24D9775E8;
  objc_copyWeak(&v20, &location);
  v16 = v9;
  v17 = v8;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(internalWorkQueue, v15);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __112__SKAStatusSubscriptionManager_releasePresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = objc_msgSend(WeakRetained, "_removePresenceSubscriptionAssertionForClient:subscriptionIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Successfully removed presence subscription assertion from in memory model for subscription identifier: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __112__SKAStatusSubscriptionManager_releasePresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke_cold_1(a1 + 40, v5, v7, v8, v9, v10, v11, v12);
  }

  objc_msgSend(*(id *)(a1 + 48), "_markCacheSubscriptionDateForChannelIdentifier:", *(_QWORD *)(a1 + 40));
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __112__SKAStatusSubscriptionManager_releasePresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke_14;
  v14[3] = &unk_24D976460;
  v13 = *(void **)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  objc_msgSend(v13, "updateRegisteredSubscriptionsForActiveAssertionsWithCompletion:", v14);

}

void __112__SKAStatusSubscriptionManager_releasePresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void (*v6)(void);
  uint8_t v7[16];

  v3 = a2;
  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __112__SKAStatusSubscriptionManager_releasePresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke_14_cold_1();

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated registered subscriptions following presence assertion release", v7, 2u);
    }

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (void)retainPresenceSubscriptionAssertionForSubscriptionIdentifier:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *internalWorkQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __111__SKAStatusSubscriptionManager_retainPresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke;
  v15[3] = &unk_24D977688;
  objc_copyWeak(&v19, &location);
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_async(internalWorkQueue, v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __111__SKAStatusSubscriptionManager_retainPresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "_fetchAllActivePresenceSubscriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4 >= objc_msgSend(*(id *)(a1 + 32), "_maxPresenceSubscriptionCacheCount"))
  {
    v7 = *(_QWORD *)(a1 + 56);
    +[SKAStatusSubscriptionManager _tooManySubscriptionsError](SKAStatusSubscriptionManager, "_tooManySubscriptionsError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
  else
  {
    if ((objc_msgSend(WeakRetained, "_addPresenceSubscriptionAssertionForClient:subscriptionIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)) & 1) == 0)
    {
      +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Presence subscription assertion already existed, but still refreshing registered subscription assertions, to ensure apsd is in sync.", buf, 2u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_markCacheSubscriptionDateForChannelIdentifier:", *(_QWORD *)(a1 + 48));
    v6 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __111__SKAStatusSubscriptionManager_retainPresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke_15;
    v9[3] = &unk_24D976460;
    v10 = *(id *)(a1 + 56);
    objc_msgSend(v6, "updateRegisteredSubscriptionsForActiveAssertionsWithCompletion:", v9);

  }
}

void __111__SKAStatusSubscriptionManager_retainPresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void (*v6)(void);
  uint8_t v7[16];

  v3 = a2;
  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __111__SKAStatusSubscriptionManager_retainPresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke_15_cold_1();

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated registered subscriptions following presence assertion retain", v7, 2u);
    }

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (BOOL)activePresenceSubscriptionAssertionsExistForChannelIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  char v16;
  os_unfair_lock_t lock;
  id obj;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  lock = &self->_presenceSubscriptionsLock;
  os_unfair_lock_lock(&self->_presenceSubscriptionsLock);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[NSMapTable objectEnumerator](self->_activePresenceSubscriptionsByClient, "objectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v6 = v5;
    v20 = 0;
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v22;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v22 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "subscriptionIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isEqualToString:", v4);

              if ((v16 & 1) != 0)
              {
                v20 = 1;
                goto LABEL_16;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v12)
              continue;
            break;
          }
        }
LABEL_16:

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v6);
  }
  else
  {
    v20 = 0;
  }

  os_unfair_lock_unlock(lock);
  return v20 & 1;
}

- (BOOL)_addTransientSubscriptionAssertionForClient:(id)a3 subscriptionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  SKATransientSubscriptionAssertion *v19;
  BOOL v20;
  NSObject *v21;
  __int128 v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v24 = v6;
  -[SKAStatusSubscriptionManager _activeTransientSubscriptionsForClient:](self, "_activeTransientSubscriptionsForClient:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (!v9)
    goto LABEL_16;
  v11 = v9;
  v12 = 0;
  v13 = *(_QWORD *)v26;
  *(_QWORD *)&v10 = 138412802;
  v23 = v10;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v26 != v13)
        objc_enumerationMutation(v8);
      v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      objc_msgSend(v15, "subscriptionIdentifier", v23);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", v7);

      if (v17)
      {
        +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v23;
          v30 = v7;
          v31 = 2112;
          v32 = v24;
          v33 = 2112;
          v34 = v15;
          _os_log_impl(&dword_2188DF000, v18, OS_LOG_TYPE_DEFAULT, "Found an existing transient subscription assertion for \"%@\" and client: %@. ExistingAssertion: %@", buf, 0x20u);
        }

        v12 = 1;
      }
    }
    v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  }
  while (v11);
  if ((v12 & 1) != 0)
  {
    +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
    v19 = (SKATransientSubscriptionAssertion *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v19->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, &v19->super, OS_LOG_TYPE_DEFAULT, "Not creating a new transient subscription assertion, one already exists.", buf, 2u);
    }
    v20 = 0;
  }
  else
  {
LABEL_16:
    v19 = -[SKATransientSubscriptionAssertion initWithSubscriptionIdentifier:]([SKATransientSubscriptionAssertion alloc], "initWithSubscriptionIdentifier:", v7);
    objc_msgSend(v8, "addObject:", v19);
    +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v7;
      _os_log_impl(&dword_2188DF000, v21, OS_LOG_TYPE_DEFAULT, "Successfully added transient subscription assertion to in memory model for subscription identifier: %@", buf, 0xCu);
    }

    v20 = 1;
  }

  return v20;
}

- (BOOL)_addPresenceSubscriptionAssertionForClient:(id)a3 subscriptionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  SKAPresenceSubscriptionAssertion *v19;
  BOOL v20;
  NSObject *v21;
  __int128 v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v24 = v6;
  -[SKAStatusSubscriptionManager _activePresenceSubscriptionsForClient:](self, "_activePresenceSubscriptionsForClient:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (!v9)
    goto LABEL_16;
  v11 = v9;
  v12 = 0;
  v13 = *(_QWORD *)v26;
  *(_QWORD *)&v10 = 138412802;
  v23 = v10;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v26 != v13)
        objc_enumerationMutation(v8);
      v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      objc_msgSend(v15, "subscriptionIdentifier", v23);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", v7);

      if (v17)
      {
        +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v23;
          v30 = v7;
          v31 = 2112;
          v32 = v24;
          v33 = 2112;
          v34 = v15;
          _os_log_impl(&dword_2188DF000, v18, OS_LOG_TYPE_DEFAULT, "Found an existing presence subscription assertion for \"%@\" and client: %@. ExistingAssertion: %@", buf, 0x20u);
        }

        v12 = 1;
      }
    }
    v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  }
  while (v11);
  if ((v12 & 1) != 0)
  {
    +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
    v19 = (SKAPresenceSubscriptionAssertion *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v19->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, &v19->super, OS_LOG_TYPE_DEFAULT, "Not creating a new presence subscription assertion, one already exists.", buf, 2u);
    }
    v20 = 0;
  }
  else
  {
LABEL_16:
    v19 = -[SKAPresenceSubscriptionAssertion initWithSubscriptionIdentifier:]([SKAPresenceSubscriptionAssertion alloc], "initWithSubscriptionIdentifier:", v7);
    objc_msgSend(v8, "addObject:", v19);
    +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v7;
      _os_log_impl(&dword_2188DF000, v21, OS_LOG_TYPE_DEFAULT, "Successfully added presence subscription assertion to in memory model for subscription identifier: %@", buf, 0xCu);
    }

    v20 = 1;
  }

  return v20;
}

- (void)_markCacheSubscriptionDateForChannelIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Marking subscription change time for channel %@", (uint8_t *)&v9, 0xCu);
  }

  v7 = (void *)-[SKADatabaseManaging newBackgroundContext](self->_databaseManager, "newBackgroundContext");
  v8 = (id)-[SKADatabaseManaging createOrUpdateTransientSubscriptionHistoryForChannelIdentifier:lastSubscriptionDate:databaseContext:](self->_databaseManager, "createOrUpdateTransientSubscriptionHistoryForChannelIdentifier:lastSubscriptionDate:databaseContext:", v4, v5, v7);

}

- (BOOL)_removeTransientSubscriptionAssertionForClient:(id)a3 subscriptionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t);
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SKAStatusSubscriptionManager _activeTransientSubscriptionsForClient:](self, "_activeTransientSubscriptionsForClient:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __102__SKAStatusSubscriptionManager__removeTransientSubscriptionAssertionForClient_subscriptionIdentifier___block_invoke;
  v20 = &unk_24D9776B0;
  v10 = v7;
  v21 = v10;
  v11 = v9;
  v22 = v11;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v17);
  v12 = objc_msgSend(v11, "count", v17, v18, v19, v20);
  if (v12)
  {
    v13 = objc_msgSend(v8, "count");
    objc_msgSend(v8, "removeObjectsAtIndexes:", v11);
    v14 = objc_msgSend(v8, "count");
    +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v24 = v10;
      v25 = 2048;
      v26 = v13;
      v27 = 2048;
      v28 = v14;
      v29 = 2112;
      v30 = v6;
      _os_log_impl(&dword_2188DF000, v15, OS_LOG_TYPE_DEFAULT, "Succesfully removed transient subscription assertion for identifier: %@. Client had %ld transient subscription assertions, now has %ld. Client: %@", buf, 0x2Au);
    }
  }
  else
  {
    +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v24 = v10;
      v25 = 2112;
      v26 = (uint64_t)v8;
      v27 = 2112;
      v28 = (uint64_t)v6;
      _os_log_error_impl(&dword_2188DF000, v15, OS_LOG_TYPE_ERROR, "Could not find transient subscription assertion for subscription identifier: \"%@\". Active transient subscription assertions: %@ for client: %@", buf, 0x20u);
    }
  }

  return v12 != 0;
}

void __102__SKAStatusSubscriptionManager__removeTransientSubscriptionAssertionForClient_subscriptionIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(a2, "subscriptionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "isEqualToString:", v6);

  if ((_DWORD)v5)
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
}

- (BOOL)_removePresenceSubscriptionAssertionForClient:(id)a3 subscriptionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t);
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SKAStatusSubscriptionManager _activePresenceSubscriptionsForClient:](self, "_activePresenceSubscriptionsForClient:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __101__SKAStatusSubscriptionManager__removePresenceSubscriptionAssertionForClient_subscriptionIdentifier___block_invoke;
  v20 = &unk_24D9776D8;
  v10 = v7;
  v21 = v10;
  v11 = v9;
  v22 = v11;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v17);
  v12 = objc_msgSend(v11, "count", v17, v18, v19, v20);
  if (v12)
  {
    v13 = objc_msgSend(v8, "count");
    objc_msgSend(v8, "removeObjectsAtIndexes:", v11);
    v14 = objc_msgSend(v8, "count");
    +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v24 = v10;
      v25 = 2048;
      v26 = v13;
      v27 = 2048;
      v28 = v14;
      v29 = 2112;
      v30 = v6;
      _os_log_impl(&dword_2188DF000, v15, OS_LOG_TYPE_DEFAULT, "Succesfully removed presence subscription assertion for identifier: %@. Client had %ld transient subscription assertions, now has %ld. Client: %@", buf, 0x2Au);
    }
  }
  else
  {
    +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v24 = v10;
      v25 = 2112;
      v26 = (uint64_t)v8;
      v27 = 2112;
      v28 = (uint64_t)v6;
      _os_log_error_impl(&dword_2188DF000, v15, OS_LOG_TYPE_ERROR, "Could not find presence subscription assertion for subscription identifier: \"%@\". Active transient subscription assertions: %@ for client: %@", buf, 0x20u);
    }
  }

  return v12 != 0;
}

void __101__SKAStatusSubscriptionManager__removePresenceSubscriptionAssertionForClient_subscriptionIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(a2, "subscriptionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "isEqualToString:", v6);

  if ((_DWORD)v5)
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
}

- (id)_activePresenceSubscriptionsForClient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  os_unfair_lock_lock(&self->_presenceSubscriptionsLock);
  -[NSMapTable objectForKey:](self->_activePresenceSubscriptionsByClient, "objectForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
    -[NSMapTable setObject:forKey:](self->_activePresenceSubscriptionsByClient, "setObject:forKey:", v5, v4);
  }
  os_unfair_lock_unlock(&self->_presenceSubscriptionsLock);

  return v5;
}

- (id)_activeTransientSubscriptionsForClient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  os_unfair_lock_lock(&self->_transientSubscriptionsLock);
  -[NSMapTable objectForKey:](self->_activeTransientSubscriptionsByClient, "objectForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
    -[NSMapTable setObject:forKey:](self->_activeTransientSubscriptionsByClient, "setObject:forKey:", v5, v4);
  }
  os_unfair_lock_unlock(&self->_transientSubscriptionsLock);

  return v5;
}

- (void)updateRegisteredSubscriptionsForActiveAssertionsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  SKAChannelManaging *channelManager;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  id location;

  v4 = a3;
  -[SKAStatusSubscriptionManager _fetchAllActiveSubscriptionAssertionsWithCache](self, "_fetchAllActiveSubscriptionAssertionsWithCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  channelManager = self->_channelManager;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __95__SKAStatusSubscriptionManager_updateRegisteredSubscriptionsForActiveAssertionsWithCompletion___block_invoke;
  v9[3] = &unk_24D977728;
  v9[4] = self;
  objc_copyWeak(&v12, &location);
  v7 = v5;
  v10 = v7;
  v8 = v4;
  v11 = v8;
  -[SKAChannelManaging activeStatusChannelSubscriptionsWithCompletion:](channelManager, "activeStatusChannelSubscriptionsWithCompletion:", v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __95__SKAStatusSubscriptionManager_updateRegisteredSubscriptionsForActiveAssertionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "channelManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __95__SKAStatusSubscriptionManager_updateRegisteredSubscriptionsForActiveAssertionsWithCompletion___block_invoke_2;
  v7[3] = &unk_24D977700;
  v5 = v3;
  v8 = v5;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  v6 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v4, "activePresenceChannelSubscriptionsWithCompletion:", v7);

  objc_destroyWeak(&v12);
}

void __95__SKAStatusSubscriptionManager_updateRegisteredSubscriptionsForActiveAssertionsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  _BOOL4 v52;
  void *v53;
  void *v54;
  const char *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id WeakRetained;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint8_t v72[128];
  uint8_t buf[4];
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "arrayByAddingObjectsFromArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 40), "_sortAndDedupeSubscriptionIdentifiers:", *(_QWORD *)(a1 + 48));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_enforceSubscriptionsHardCapOnSubscriptionIdentifiers:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v74 = (uint64_t)v5;
    _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "StatusKitAgent wants to be subscribed to: %@", buf, 0xCu);
  }

  v59 = (void *)v4;
  objc_msgSend(*(id *)(a1 + 40), "_sortAndDedupeSubscriptionIdentifiers:", v4);
  v7 = objc_claimAutoreleasedReturnValue();
  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v74 = v7;
    _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, "StatusKitAgent was previously subscriped to: %@", buf, 0xCu);
  }

  v56 = (void *)v7;
  v57 = v5;
  objc_msgSend(v5, "differenceFromArray:", v7);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "removals");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v68 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "object");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "length"))
          objc_msgSend(v10, "addObject:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
    }
    while (v13);
  }

  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v74 = (uint64_t)v10;
    _os_log_impl(&dword_2188DF000, v17, OS_LOG_TYPE_DEFAULT, "Unsubscribing from channels: %@", buf, 0xCu);
  }

  v18 = objc_msgSend(v10, "count");
  if (v18)
  {
    v19 = objc_alloc(MEMORY[0x24BDBCEF0]);
    v20 = (void *)MEMORY[0x24BDBD1A8];
    if (*(_QWORD *)(a1 + 32))
      v21 = *(_QWORD *)(a1 + 32);
    else
      v21 = MEMORY[0x24BDBD1A8];
    v22 = (void *)objc_msgSend(v19, "initWithArray:", v21);
    objc_msgSend(v22, "intersectSet:", v10);
    objc_msgSend(v22, "allObjects");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "count"))
    {
      objc_msgSend(WeakRetained, "channelManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "unsubscribeFromStatusChannels:", v23);

    }
    v25 = objc_alloc(MEMORY[0x24BDBCEF0]);
    if (v3)
      v26 = v3;
    else
      v26 = v20;
    v27 = (void *)objc_msgSend(v25, "initWithArray:", v26);
    objc_msgSend(v27, "intersectSet:", v10);
    objc_msgSend(v27, "allObjects");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "count"))
    {
      objc_msgSend(WeakRetained, "channelManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "unsubscribeFromPresenceChannels:", v28);

    }
  }
  v60 = v3;
  objc_msgSend(v61, "insertions");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v32 = v30;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v64;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v64 != v35)
          objc_enumerationMutation(v32);
        objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * j), "object");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v37, "length"))
          objc_msgSend(v31, "addObject:", v37);

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
    }
    while (v34);
  }

  v38 = objc_msgSend(v31, "count");
  if (v38)
  {
    +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v74 = (uint64_t)v31;
      _os_log_impl(&dword_2188DF000, v39, OS_LOG_TYPE_DEFAULT, "Subscribing to channels: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_filterSubscriptionIdentifierToStatus:", v31);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v40, "count"))
    {
      objc_msgSend(WeakRetained, "channelManager");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "subscribeToStatusChannels:", v40);

    }
    objc_msgSend(*(id *)(a1 + 40), "_filterSubscriptionIdentifierToPresence:", v31);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v42, "count"))
    {
      objc_msgSend(WeakRetained, "channelManager");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "subscribeToPresenceChannels:", v42);

    }
  }
  v44 = objc_msgSend(*(id *)(a1 + 40), "_activeTransientAssertionsExist");
  objc_msgSend(*(id *)(a1 + 40), "pushManager");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v45;
  if (v44)
    objc_msgSend(v45, "switchStatusFilterToEnabled");
  else
    objc_msgSend(v45, "switchStatusFilterToNonwaking");

  v47 = objc_msgSend(*(id *)(a1 + 40), "_activePresenceAssertionsExist");
  objc_msgSend(*(id *)(a1 + 40), "pushManager");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v48;
  if (v47)
    objc_msgSend(v48, "switchPresenceFilterToEnabled");
  else
    objc_msgSend(v48, "switchPresenceFilterToNonwaking");

  v50 = v38 | v18;
  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v51 = objc_claimAutoreleasedReturnValue();
  v52 = os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT);
  if (v50)
  {
    v54 = v56;
    v53 = v57;
    if (v52)
    {
      *(_DWORD *)buf = 138412290;
      v74 = (uint64_t)v57;
      v55 = "Subscriptions updated. Subscribed to: %@";
LABEL_56:
      _os_log_impl(&dword_2188DF000, v51, OS_LOG_TYPE_DEFAULT, v55, buf, 0xCu);
    }
  }
  else
  {
    v54 = v56;
    v53 = v57;
    if (v52)
    {
      *(_DWORD *)buf = 138412290;
      v74 = (uint64_t)v56;
      v55 = "No changes for active subscriptions based on current assertions. Subscribed to: %@";
      goto LABEL_56;
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (id)_sortAndDedupeSubscriptionIdentifiers:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BDBCF20];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithArray:", v4);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", 0, 1, sel_compare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_enforceSubscriptionsHardCapOnSubscriptionIdentifiers:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[SKAStatusSubscriptionManager _hardMaxSubscriptionCount](self, "_hardMaxSubscriptionCount");
  v6 = objc_msgSend(v4, "count");
  if (v6 <= v5)
  {
    +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 134218240;
      v17 = v6;
      v18 = 2048;
      v19 = v5;
      _os_log_impl(&dword_2188DF000, v13, OS_LOG_TYPE_DEFAULT, "Active subscription count %ld does not exceed cap of %ld", (uint8_t *)&v16, 0x16u);
    }

    v14 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    v7 = (void *)CFPreferencesCopyAppValue(CFSTR("lastFaultTime"), CFSTR("com.apple.StatusKitAgent"));
    if (v7
      && (objc_msgSend(MEMORY[0x24BDBCE60], "now"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "timeIntervalSinceDate:", v7),
          v10 = v9,
          v8,
          v10 <= 3600.0))
    {
      +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SKAStatusSubscriptionManager _enforceSubscriptionsHardCapOnSubscriptionIdentifiers:].cold.2();
    }
    else
    {
      +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[SKAStatusSubscriptionManager _enforceSubscriptionsHardCapOnSubscriptionIdentifiers:].cold.1();

      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v12 = objc_claimAutoreleasedReturnValue();
      CFPreferencesSetAppValue(CFSTR("lastFaultTime"), v12, CFSTR("com.apple.StatusKitAgent"));
    }

    objc_msgSend(v4, "subarrayWithRange:", 0, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (id)_fetchAllClientActiveSubscriptionAssertions
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  os_unfair_lock_t lock;
  SKAStatusSubscriptionManager *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  lock = &self->_transientSubscriptionsLock;
  os_unfair_lock_lock(&self->_transientSubscriptionsLock);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v23 = self;
  -[NSMapTable objectEnumerator](self->_activeTransientSubscriptionsByClient, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v8);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v34, 16, lock);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v25;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v25 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v14), "subscriptionIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObject:", v15);

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(lock);
  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v3;
    _os_log_impl(&dword_2188DF000, v16, OS_LOG_TYPE_DEFAULT, "Transient subscription assertions: %@", buf, 0xCu);
  }

  v17 = (void *)-[SKADatabaseManaging newBackgroundContext](v23->_databaseManager, "newBackgroundContext");
  -[SKADatabaseManaging allPersistentSubscriptionAssertionChannelIdentifiersWithDatabaseContext:](v23->_databaseManager, "allPersistentSubscriptionAssertionChannelIdentifiersWithDatabaseContext:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v18;
    _os_log_impl(&dword_2188DF000, v19, OS_LOG_TYPE_DEFAULT, "Persistent subscription assertions: %@", buf, 0xCu);
  }

  objc_msgSend(v3, "addObjectsFromArray:", v18);
  v20 = (void *)objc_msgSend(v3, "copy");

  return v20;
}

- (id)_fetchAllActiveSubscriptionAssertionsWithCache
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  os_unfair_lock_t lock;
  SKAStatusSubscriptionManager *v46;
  id obj;
  id obja;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint8_t v66[128];
  uint8_t buf[4];
  id v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  lock = &self->_transientSubscriptionsLock;
  os_unfair_lock_lock(&self->_transientSubscriptionsLock);
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v46 = self;
  -[NSMapTable objectEnumerator](self->_activeTransientSubscriptionsByClient, "objectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v62 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v58;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v58 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * j), "subscriptionIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObject:", v15);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
          }
          while (v12);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(lock);
  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v68 = v3;
    _os_log_impl(&dword_2188DF000, v16, OS_LOG_TYPE_DEFAULT, "Transient subscription assertions: %@", buf, 0xCu);
  }

  os_unfair_lock_lock(&v46->_presenceSubscriptionsLock);
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[NSMapTable objectEnumerator](v46->_activePresenceSubscriptionsByClient, "objectEnumerator");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v54;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v54 != v19)
          objc_enumerationMutation(obja);
        v21 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * k);
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v22 = v21;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v50;
          do
          {
            for (m = 0; m != v24; ++m)
            {
              if (*(_QWORD *)v50 != v25)
                objc_enumerationMutation(v22);
              objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * m), "subscriptionIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObject:", v27);
              objc_msgSend(v4, "addObject:", v27);

            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
          }
          while (v24);
        }

      }
      v18 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
    }
    while (v18);
  }

  os_unfair_lock_unlock(&v46->_presenceSubscriptionsLock);
  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v68 = v4;
    _os_log_impl(&dword_2188DF000, v28, OS_LOG_TYPE_DEFAULT, "Active presence subscription assertions: %@", buf, 0xCu);
  }

  v29 = (void *)-[SKADatabaseManaging newBackgroundContext](v46->_databaseManager, "newBackgroundContext");
  -[SKADatabaseManaging allPersistentSubscriptionAssertionChannelIdentifiersWithDatabaseContext:](v46->_databaseManager, "allPersistentSubscriptionAssertionChannelIdentifiersWithDatabaseContext:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v68 = v30;
    _os_log_impl(&dword_2188DF000, v31, OS_LOG_TYPE_DEFAULT, "Persistent subscription assertions: %@", buf, 0xCu);
  }

  objc_msgSend(v3, "addObjectsFromArray:", v30);
  -[SKAStatusSubscriptionManager _allPersonalChannelIdentifiersRequiringSelfSubscriptionWithDatabaseContext:](v46, "_allPersonalChannelIdentifiersRequiringSelfSubscriptionWithDatabaseContext:", v29);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v68 = v32;
    _os_log_impl(&dword_2188DF000, v33, OS_LOG_TYPE_DEFAULT, "Personal channels requiring self subscription: %@", buf, 0xCu);
  }

  objc_msgSend(v3, "addObjectsFromArray:", v32);
  v34 = -[SKAStatusSubscriptionManager _maxSubscriptionCacheCount](v46, "_maxSubscriptionCacheCount");
  v35 = -[SKAStatusSubscriptionManager _maxPresenceSubscriptionCacheCount](v46, "_maxPresenceSubscriptionCacheCount");
  v36 = objc_msgSend(v4, "count");
  v37 = objc_msgSend(v3, "count");
  v38 = (v34 - v37) & ~((v34 - v37) >> 63);
  v39 = (v35 - v36) & ~((v35 - v36) >> 63);
  v40 = (void *)objc_msgSend(v3, "copy");
  -[SKAStatusSubscriptionManager _recentlyReleasedTransientSubscriptionAssertionIdentifiersExcludingSubscriptionIdentifiers:count:presenceCount:databaseContext:](v46, "_recentlyReleasedTransientSubscriptionAssertionIdentifiersExcludingSubscriptionIdentifiers:count:presenceCount:databaseContext:", v40, v38, v39, v29);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v68 = v41;
    _os_log_impl(&dword_2188DF000, v42, OS_LOG_TYPE_DEFAULT, "Cached channels for subscription: %@", buf, 0xCu);
  }

  objc_msgSend(v3, "addObjectsFromArray:", v41);
  v43 = (void *)objc_msgSend(v3, "copy");

  return v43;
}

- (id)_fetchAllActivePresenceSubscriptions
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  os_unfair_lock_t lock;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  lock = &self->_presenceSubscriptionsLock;
  os_unfair_lock_lock(&self->_presenceSubscriptionsLock);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMapTable objectEnumerator](self->_activePresenceSubscriptionsByClient, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v19;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v19 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "subscriptionIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObject:", v15);

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(lock);
  return v3;
}

- (id)_recentlyReleasedTransientSubscriptionAssertionIdentifiersExcludingSubscriptionIdentifiers:(id)a3 count:(int64_t)a4 presenceCount:(int64_t)a5 databaseContext:(id)a6
{
  id v9;
  double v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  id v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  NSObject *v29;
  int64_t v30;
  void *v31;
  id v33;
  id obj;
  int64_t v36;
  SKAStatusSubscriptionManager *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  _QWORD v45[3];

  *(_QWORD *)((char *)&v45[1] + 4) = *MEMORY[0x24BDAC8D0];
  v33 = a3;
  v9 = a6;
  v37 = self;
  v38 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[SKAStatusSubscriptionManager _subscriptionTTL](self, "_subscriptionTTL");
  v11 = v10;
  +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v45[0] = a4;
    _os_log_impl(&dword_2188DF000, v12, OS_LOG_TYPE_DEFAULT, "Finding at most %ld cached channels to subscribe to", buf, 0xCu);
  }

  -[SKADatabaseManaging existingRecentTransientSubscriptionHistoriesWithLimit:databaseContext:](self->_databaseManager, "existingRecentTransientSubscriptionHistoriesWithLimit:databaseContext:", objc_msgSend(v33, "count") + a4, v9);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v13)
  {
    v14 = v13;
    v36 = 0;
    v15 = *(_QWORD *)v40;
LABEL_5:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v40 != v15)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v16);
      if (objc_msgSend(v38, "count") >= a4)
        goto LABEL_28;
      -[SKAStatusSubscriptionManager databaseManager](v37, "databaseManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "channelIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "existingChannelForSubscriptionIdentifier:databaseContext:", v19, v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
        break;
      objc_msgSend(v20, "presenceIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "length");

      if (v22)
        v23 = v36 < a5;
      else
        v23 = 1;
      if (!v23)
      {

        goto LABEL_28;
      }
      v24 = v9;
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastSubscriptionDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "timeIntervalSinceDate:", v26);
      v28 = v27;

      if (v28 <= v11)
      {
        objc_msgSend(v17, "channelIdentifier");
        v29 = objc_claimAutoreleasedReturnValue();
        if (-[NSObject length](v29, "length"))
        {
          v9 = v24;
          if ((objc_msgSend(v33, "containsObject:", v29) & 1) == 0)
          {
            objc_msgSend(v38, "addObject:", v29);
            v30 = v36;
            if (v22)
              v30 = v36 + 1;
            v36 = v30;
          }
        }
        else
        {
          v9 = v24;
        }
LABEL_25:

        goto LABEL_26;
      }
      v9 = v24;
LABEL_26:

      if (v14 == ++v16)
      {
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        if (v14)
          goto LABEL_5;
        goto LABEL_28;
      }
    }
    +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[SKAStatusSubscriptionManager _recentlyReleasedTransientSubscriptionAssertionIdentifiersExcludingSubscriptionIdentifiers:count:presenceCount:databaseContext:].cold.1(buf, v17, v45, v29);
    goto LABEL_25;
  }
LABEL_28:

  objc_msgSend(v38, "allObjects");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)_allPersonalChannelIdentifiersRequiringSelfSubscriptionWithDatabaseContext:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SKAStatusSubscriptionManager _statusTypeIdentifiersRequiringSelfSubscription](self, "_statusTypeIdentifiersRequiringSelfSubscription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v21;
    *(_QWORD *)&v8 = 138412290;
    v19 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[SKADatabaseManaging existingPersonalChannelForStatusTypeIdentifier:databaseContext:](self->_databaseManager, "existingPersonalChannelForStatusTypeIdentifier:databaseContext:", v12, v4, v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "identifier");
          v15 = objc_claimAutoreleasedReturnValue();
          if (-[NSObject length](v15, "length"))
          {
            objc_msgSend(v5, "addObject:", v15);
          }
          else
          {
            +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v19;
              v25 = v14;
              _os_log_error_impl(&dword_2188DF000, v16, OS_LOG_TYPE_ERROR, "Personal channel has no identifier: %@", buf, 0xCu);
            }

          }
        }
        else
        {
          +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v19;
            v25 = v12;
            _os_log_impl(&dword_2188DF000, v15, OS_LOG_TYPE_DEFAULT, "No personal channel for statusTypeIdentifier: %@", buf, 0xCu);
          }
        }

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v9);
  }
  v17 = (void *)objc_msgSend(v5, "copy");

  return v17;
}

- (id)_statusTypeIdentifiersRequiringSelfSubscription
{
  return &unk_24D98DE20;
}

- (BOOL)_activeTransientAssertionsExist
{
  os_unfair_lock_s *p_transientSubscriptionsLock;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  p_transientSubscriptionsLock = &self->_transientSubscriptionsLock;
  os_unfair_lock_lock(&self->_transientSubscriptionsLock);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMapTable objectEnumerator](self->_activeTransientSubscriptionsByClient, "objectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "count"))
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_transientSubscriptionsLock);
  return v5;
}

- (BOOL)_activePresenceAssertionsExist
{
  os_unfair_lock_s *p_presenceSubscriptionsLock;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  p_presenceSubscriptionsLock = &self->_presenceSubscriptionsLock;
  os_unfair_lock_lock(&self->_presenceSubscriptionsLock);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMapTable objectEnumerator](self->_activePresenceSubscriptionsByClient, "objectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "count"))
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_presenceSubscriptionsLock);
  return v5;
}

- (id)_filterSubscriptionIdentifierToStatus:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SKAStatusSubscriptionManager databaseManager](self, "databaseManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "newBackgroundContext");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        -[SKAStatusSubscriptionManager databaseManager](self, "databaseManager", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "existingChannelForSubscriptionIdentifier:databaseContext:", v13, v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15 && !objc_msgSend(v15, "channelType"))
          objc_msgSend(v5, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v5;
}

+ (id)_tooManySubscriptionsError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEB10C8];
  v7 = *MEMORY[0x24BDD0BA0];
  v8[0] = CFSTR("There are too many presence subscriptions");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -7009, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_filterSubscriptionIdentifierToPresence:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SKAStatusSubscriptionManager databaseManager](self, "databaseManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "newBackgroundContext");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        -[SKAStatusSubscriptionManager databaseManager](self, "databaseManager", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "existingChannelForSubscriptionIdentifier:databaseContext:", v13, v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15 && objc_msgSend(v15, "channelType") == 1)
          objc_msgSend(v5, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v5;
}

- (int64_t)_maxSubscriptionCacheCount
{
  void *v2;
  void *v3;
  int64_t v4;
  NSObject *v5;
  int v7;
  int64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE4FE58], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("shared-channels-subscription-cache-size"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = (int)objc_msgSend(v3, "intValue");
    +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = v4;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Server bag indicates our max subscription count should be %lu", (uint8_t *)&v7, 0xCu);
    }

  }
  else
  {
    v4 = 35;
  }

  return v4;
}

- (int64_t)_maxPresenceSubscriptionCacheCount
{
  void *v2;
  void *v3;
  int64_t v4;
  NSObject *v5;
  int v7;
  int64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE4FE58], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("activity-presence-max-subscription-size"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = (int)objc_msgSend(v3, "intValue");
    +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = v4;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Server bag indicates our max presence subscription count should be %lu", (uint8_t *)&v7, 0xCu);
    }

  }
  else
  {
    v4 = 8;
  }

  return v4;
}

- (int64_t)_hardMaxSubscriptionCount
{
  void *v2;
  void *v3;
  int64_t v4;
  NSObject *v5;
  int v7;
  int64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE4FE58], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("shared-channels-max-subscription-size-v2"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = (int)objc_msgSend(v3, "intValue");
    +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = v4;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Server bag indicates our hard max subscription count should be %lu", (uint8_t *)&v7, 0xCu);
    }

  }
  else
  {
    v4 = 43;
  }

  return v4;
}

- (double)_subscriptionTTL
{
  void *v2;
  void *v3;
  double v4;
  NSObject *v5;
  int v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE4FE58], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("shared-channels-subscription-ttl-minutes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 86400.0;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = (double)(int)(60 * objc_msgSend(v3, "intValue"));
      +[SKAStatusSubscriptionManager logger](SKAStatusSubscriptionManager, "logger");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 134217984;
        v8 = v4;
        _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Server bag indicates our subscription TTL should be %f seconds", (uint8_t *)&v7, 0xCu);
      }

    }
  }

  return v4;
}

+ (id)logger
{
  if (logger_onceToken_19 != -1)
    dispatch_once(&logger_onceToken_19, &__block_literal_global_19);
  return (id)logger__logger_19;
}

void __38__SKAStatusSubscriptionManager_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKAStatusSubscriptionManager");
  v1 = (void *)logger__logger_19;
  logger__logger_19 = (uint64_t)v0;

}

- (NSMapTable)activeTransientSubscriptionsByClient
{
  return self->_activeTransientSubscriptionsByClient;
}

- (void)setActiveTransientSubscriptionsByClient:(id)a3
{
  objc_storeStrong((id *)&self->_activeTransientSubscriptionsByClient, a3);
}

- (NSMapTable)activePresenceSubscriptionsByClient
{
  return self->_activePresenceSubscriptionsByClient;
}

- (void)setActivePresenceSubscriptionsByClient:(id)a3
{
  objc_storeStrong((id *)&self->_activePresenceSubscriptionsByClient, a3);
}

- (SKADatabaseManaging)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
  objc_storeStrong((id *)&self->_databaseManager, a3);
}

- (SKAChannelManaging)channelManager
{
  return self->_channelManager;
}

- (void)setChannelManager:(id)a3
{
  objc_storeStrong((id *)&self->_channelManager, a3);
}

- (SKAPushManaging)pushManager
{
  return self->_pushManager;
}

- (void)setPushManager:(id)a3
{
  objc_storeStrong((id *)&self->_pushManager, a3);
}

- (OS_dispatch_queue)internalWorkQueue
{
  return self->_internalWorkQueue;
}

- (void)setInternalWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalWorkQueue, a3);
}

- (os_unfair_lock_s)transientSubscriptionsLock
{
  return self->_transientSubscriptionsLock;
}

- (void)setTransientSubscriptionsLock:(os_unfair_lock_s)a3
{
  self->_transientSubscriptionsLock = a3;
}

- (os_unfair_lock_s)presenceSubscriptionsLock
{
  return self->_presenceSubscriptionsLock;
}

- (void)setPresenceSubscriptionsLock:(os_unfair_lock_s)a3
{
  self->_presenceSubscriptionsLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalWorkQueue, 0);
  objc_storeStrong((id *)&self->_pushManager, 0);
  objc_storeStrong((id *)&self->_channelManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_activePresenceSubscriptionsByClient, 0);
  objc_storeStrong((id *)&self->_activeTransientSubscriptionsByClient, 0);
}

void __133__SKAStatusSubscriptionManager_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke_5_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Failed to update registered subscriptions following transient assertion retain with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __134__SKAStatusSubscriptionManager_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2188DF000, a2, a3, "Could not find transient subscription assertion to remove from in memory model for subscription identifier: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __134__SKAStatusSubscriptionManager_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke_8_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Failed to update registered subscriptions following transient assertion release with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __105__SKAStatusSubscriptionManager_releaseAllTransientSubscriptionAssertionsAssociatedWithClient_completion___block_invoke_9_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Failed to update registered subscriptions following client disconnect with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __149__SKAStatusSubscriptionManager_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "A subscription assertion already exists, no need to create a new one. Existing: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __149__SKAStatusSubscriptionManager_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_10_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Failed to update registered subscriptions following persistent assertion retain with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __150__SKAStatusSubscriptionManager_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2188DF000, a2, a3, "Did not delete persistent subscription assertion because one was not found for subscription identifier: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __150__SKAStatusSubscriptionManager_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_11_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Failed to update registered subscriptions following persistent assertion release with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __112__SKAStatusSubscriptionManager_releasePresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2188DF000, a2, a3, "Could not find presence subscription assertion to remove from in memory model for subscription identifier: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __112__SKAStatusSubscriptionManager_releasePresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke_14_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Failed to update registered subscriptions following presence assertion release with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __111__SKAStatusSubscriptionManager_retainPresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke_15_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Failed to update registered subscriptions following presence assertion retain with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_enforceSubscriptionsHardCapOnSubscriptionIdentifiers:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_2();
  _os_log_fault_impl(&dword_2188DF000, v0, OS_LOG_TYPE_FAULT, "Active subscription count %ld exceeds cap of %ld", v1, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)_enforceSubscriptionsHardCapOnSubscriptionIdentifiers:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_2();
  _os_log_error_impl(&dword_2188DF000, v0, OS_LOG_TYPE_ERROR, "Active subscription count %ld exceeds cap of %ld", v1, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)_recentlyReleasedTransientSubscriptionAssertionIdentifiersExcludingSubscriptionIdentifiers:(uint8_t *)a1 count:(void *)a2 presenceCount:(_QWORD *)a3 databaseContext:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "channelIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_2188DF000, a4, OS_LOG_TYPE_ERROR, "Channel from history is gone from database: %@", a1, 0xCu);

}

@end
