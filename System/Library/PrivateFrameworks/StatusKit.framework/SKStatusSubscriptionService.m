@implementation SKStatusSubscriptionService

- (SKStatusSubscriptionService)initWithStatusTypeIdentifier:(id)a3
{
  id v4;
  SKStatusSubscriptionService *v5;
  uint64_t v6;
  NSString *statusTypeIdentifier;
  uint64_t v8;
  NSMapTable *delegates;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *privateWorkQueue;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SKStatusSubscriptionService;
  v5 = -[SKStatusSubscriptionService init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    statusTypeIdentifier = v5->_statusTypeIdentifier;
    v5->_statusTypeIdentifier = (NSString *)v6;

    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    delegates = v5->_delegates;
    v5->_delegates = (NSMapTable *)v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_DEFAULT, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = dispatch_queue_create("com.apple.StatusKit.SubscriptionService", v11);
    privateWorkQueue = v5->_privateWorkQueue;
    v5->_privateWorkQueue = (OS_dispatch_queue *)v12;

  }
  return v5;
}

- (id)statusSubscriptionForHandle:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  SKStatusSubscription *v11;
  SKStatusSubscription *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  id v18;
  _BYTE *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id location;
  _BYTE buf[24];
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SKStatusSubscriptionService _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKStatusSubscriptionService statusTypeIdentifier](self, "statusTypeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v5;
    _os_log_impl(&dword_213251000, v6, OS_LOG_TYPE_DEFAULT, "Fetching subscription (sync) for handle %@ statusType: %{public}@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v27 = 0;
  -[SKStatusSubscriptionService daemonConnection](self, "daemonConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __59__SKStatusSubscriptionService_statusSubscriptionForHandle___block_invoke;
  v21[3] = &unk_24CF73A40;
  objc_copyWeak(&v22, &location);
  v21[4] = buf;
  objc_msgSend(v7, "synchronousRemoteDaemonWithErrorHandler:", v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8;
  v15 = 3221225472;
  v16 = __59__SKStatusSubscriptionService_statusSubscriptionForHandle___block_invoke_4;
  v17 = &unk_24CF73A68;
  v10 = v4;
  v18 = v10;
  objc_copyWeak(&v20, &location);
  v19 = buf;
  objc_msgSend(v9, "subscriptionMetadataForHandle:statusTypeIdentifier:completion:", v10, v5, &v14);
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    v11 = [SKStatusSubscription alloc];
    v12 = -[SKStatusSubscription initWithSubscriptionMetadata:daemonConnection:](v11, "initWithSubscriptionMetadata:daemonConnection:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v7, v14, v15, v16, v17, v18);
  }
  else
  {
    v12 = 0;
  }
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  _Block_object_dispose(buf, 8);
  return v12;
}

void __59__SKStatusSubscriptionService_statusSubscriptionForHandle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;

  v3 = a2;
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59__SKStatusSubscriptionService_statusSubscriptionForHandle___block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v3);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

void __59__SKStatusSubscriptionService_statusSubscriptionForHandle___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *WeakRetained;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __59__SKStatusSubscriptionService_statusSubscriptionForHandle___block_invoke_4_cold_1();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    -[NSObject _simulateCrashIfNecessaryForError:](WeakRetained, "_simulateCrashIfNecessaryForError:", v6);
  }
  else
  {
    +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
    WeakRetained = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v9)
      {
        v10 = *(_QWORD *)(a1 + 32);
        v14 = 138412546;
        v15 = v5;
        v16 = 2112;
        v17 = v10;
        _os_log_impl(&dword_213251000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Retreived subscription metadata for handle. subscriptionMetadata: %@ handle: %@", (uint8_t *)&v14, 0x16u);
      }

      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = v5;
      WeakRetained = *(NSObject **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v12;
    }
    else if (v9)
    {
      v13 = *(void **)(a1 + 32);
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_213251000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Did not find subscription metadata for handle. handle: %@", (uint8_t *)&v14, 0xCu);
    }
  }

}

- (void)statusSubscriptionForHandle:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SKStatusSubscriptionService _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKStatusSubscriptionService statusTypeIdentifier](self, "statusTypeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v24 = v6;
    v25 = 2114;
    v26 = v8;
    _os_log_impl(&dword_213251000, v9, OS_LOG_TYPE_DEFAULT, "Fetching subscription (async) for handle %@ statusType: %{public}@", buf, 0x16u);
  }

  -[SKStatusSubscriptionService daemonConnection](self, "daemonConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v11 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __70__SKStatusSubscriptionService_statusSubscriptionForHandle_completion___block_invoke;
  v21[3] = &unk_24CF73738;
  objc_copyWeak(&v22, (id *)buf);
  objc_msgSend(v10, "asynchronousRemoteDaemonWithErrorHandler:", v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __70__SKStatusSubscriptionService_statusSubscriptionForHandle_completion___block_invoke_7;
  v16[3] = &unk_24CF73A90;
  v13 = v6;
  v17 = v13;
  objc_copyWeak(&v20, (id *)buf);
  v14 = v7;
  v19 = v14;
  v15 = v10;
  v18 = v15;
  objc_msgSend(v12, "subscriptionMetadataForHandle:statusTypeIdentifier:completion:", v13, v8, v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);

}

void __70__SKStatusSubscriptionService_statusSubscriptionForHandle_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v3);

  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __59__SKStatusSubscriptionService_statusSubscriptionForHandle___block_invoke_cold_1();

}

void __70__SKStatusSubscriptionService_statusSubscriptionForHandle_completion___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  void (*v9)(void);
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  SKStatusSubscription *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __59__SKStatusSubscriptionService_statusSubscriptionForHandle___block_invoke_4_cold_1();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v6);

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_5:
    v9();
    goto LABEL_10;
  }
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v11)
    {
      v14 = *(void **)(a1 + 32);
      v15 = 138412290;
      v16 = v14;
      _os_log_impl(&dword_213251000, v10, OS_LOG_TYPE_DEFAULT, "Did not find subscription metadata for handle. handle: %@", (uint8_t *)&v15, 0xCu);
    }

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_5;
  }
  if (v11)
  {
    v12 = *(_QWORD *)(a1 + 32);
    v15 = 138412546;
    v16 = v5;
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_213251000, v10, OS_LOG_TYPE_DEFAULT, "Retreived subscription metadata for handle. subscriptionMetadata: %@ handle: %@", (uint8_t *)&v15, 0x16u);
  }

  v13 = -[SKStatusSubscription initWithSubscriptionMetadata:daemonConnection:]([SKStatusSubscription alloc], "initWithSubscriptionMetadata:daemonConnection:", v5, *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_10:
}

- (SKStatusSubscription)personalStatusSubscription
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  SKStatusSubscription *v9;
  SKStatusSubscription *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  __int128 *p_buf;
  id v18;
  _QWORD v19[5];
  id v20;
  id location;
  __int128 buf;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[SKStatusSubscriptionService _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKStatusSubscriptionService statusTypeIdentifier](self, "statusTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_213251000, v4, OS_LOG_TYPE_DEFAULT, "Fetching personal subscription (sync) for statusType: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  v26 = 0;
  -[SKStatusSubscriptionService daemonConnection](self, "daemonConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __57__SKStatusSubscriptionService_personalStatusSubscription__block_invoke;
  v19[3] = &unk_24CF73A40;
  objc_copyWeak(&v20, &location);
  v19[4] = &buf;
  objc_msgSend(v5, "synchronousRemoteDaemonWithErrorHandler:", v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  v13 = 3221225472;
  v14 = __57__SKStatusSubscriptionService_personalStatusSubscription__block_invoke_8;
  v15 = &unk_24CF73AB8;
  objc_copyWeak(&v18, &location);
  p_buf = &buf;
  v8 = v3;
  v16 = v8;
  objc_msgSend(v7, "subscriptionMetadataForPersonalSubscriptionWithStatusTypeIdentifier:completion:", v8, &v12);
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    v9 = [SKStatusSubscription alloc];
    v10 = -[SKStatusSubscription initWithSubscriptionMetadata:daemonConnection:](v9, "initWithSubscriptionMetadata:daemonConnection:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v5, v12, v13, v14, v15);
  }
  else
  {
    v10 = 0;
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
  return v10;
}

void __57__SKStatusSubscriptionService_personalStatusSubscription__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;

  v3 = a2;
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __57__SKStatusSubscriptionService_personalStatusSubscription__block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v3);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

void __57__SKStatusSubscriptionService_personalStatusSubscription__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *WeakRetained;
  _BOOL4 v9;
  uint64_t v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __57__SKStatusSubscriptionService_personalStatusSubscription__block_invoke_8_cold_1();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    -[NSObject _simulateCrashIfNecessaryForError:](WeakRetained, "_simulateCrashIfNecessaryForError:", v6);
  }
  else
  {
    +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
    WeakRetained = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v9)
      {
        v13 = 138412290;
        v14 = v5;
        _os_log_impl(&dword_213251000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Retreived personal subscription metadata. subscriptionMetadata: %@", (uint8_t *)&v13, 0xCu);
      }

      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = v5;
      WeakRetained = *(NSObject **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v11;
    }
    else if (v9)
    {
      v12 = *(void **)(a1 + 32);
      v13 = 138412290;
      v14 = v12;
      _os_log_impl(&dword_213251000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Did not find personal subscription metadata for status type: %@", (uint8_t *)&v13, 0xCu);
    }
  }

}

- (id)allStatusSubscriptions
{
  return -[SKStatusSubscriptionService _allStatusSubscriptionsIncludingPersonalSubscription:](self, "_allStatusSubscriptionsIncludingPersonalSubscription:", 1);
}

- (id)allStatusSubscriptionsExceptPersonalSubscription
{
  return -[SKStatusSubscriptionService _allStatusSubscriptionsIncludingPersonalSubscription:](self, "_allStatusSubscriptionsIncludingPersonalSubscription:", 1);
}

- (id)allStatusSubscriptionsWithActiveAssertions
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SKStatusSubscription *v15;
  SKStatusSubscription *v16;
  id *v18;
  id *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  __int128 *p_buf;
  id v27;
  _QWORD v28[5];
  id v29;
  id location;
  uint8_t v31[128];
  __int128 buf;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[SKStatusSubscriptionService _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKStatusSubscriptionService statusTypeIdentifier](self, "statusTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_213251000, v4, OS_LOG_TYPE_DEFAULT, "Fetching all subscription assertions (sync) for statusType: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__1;
  v35 = __Block_byref_object_dispose__1;
  v36 = 0;
  -[SKStatusSubscriptionService daemonConnection](self, "daemonConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __73__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveAssertions__block_invoke;
  v28[3] = &unk_24CF73A40;
  v18 = &v29;
  objc_copyWeak(&v29, &location);
  v28[4] = &buf;
  objc_msgSend(v5, "synchronousRemoteDaemonWithErrorHandler:", v28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v6;
  v24[1] = 3221225472;
  v24[2] = __73__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveAssertions__block_invoke_9;
  v24[3] = &unk_24CF73AE0;
  v8 = v3;
  v25 = v8;
  v19 = &v27;
  objc_copyWeak(&v27, &location);
  p_buf = &buf;
  objc_msgSend(v7, "allSubscriptionMetadatasWithActiveAssertionsForStatusTypeIdentifier:completion:", v8, v24);
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13);
        v15 = [SKStatusSubscription alloc];
        v16 = -[SKStatusSubscription initWithSubscriptionMetadata:daemonConnection:](v15, "initWithSubscriptionMetadata:daemonConnection:", v14, v5, v18, v19, (_QWORD)v20);
        if (v16)
          objc_msgSend(v9, "addObject:", v16);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
    }
    while (v11);
  }

  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
  return v9;
}

void __73__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveAssertions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;

  v3 = a2;
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveAssertions__block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v3);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

void __73__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveAssertions__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *WeakRetained;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  int v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __73__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveAssertions__block_invoke_9_cold_2();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    -[NSObject _simulateCrashIfNecessaryForError:](WeakRetained, "_simulateCrashIfNecessaryForError:", v6);
  }
  else
  {
    +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    WeakRetained = v9;
    if (v5)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v13 = 138412546;
        v14 = v5;
        v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_213251000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Retreived subscription assertions metadatas for status type. subscriptionMetadata: %@ statusType: %@", (uint8_t *)&v13, 0x16u);
      }

      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = v5;
      WeakRetained = *(NSObject **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v12;
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __73__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveAssertions__block_invoke_9_cold_1();
    }
  }

}

- (id)allStatusSubscriptionsWithActiveSubscriptions
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SKStatusSubscription *v15;
  SKStatusSubscription *v16;
  id *v18;
  id *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  __int128 *p_buf;
  id v27;
  _QWORD v28[5];
  id v29;
  id location;
  uint8_t v31[128];
  __int128 buf;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[SKStatusSubscriptionService _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKStatusSubscriptionService statusTypeIdentifier](self, "statusTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_213251000, v4, OS_LOG_TYPE_DEFAULT, "Fetching all active subscription (sync) for statusType: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__1;
  v35 = __Block_byref_object_dispose__1;
  v36 = 0;
  -[SKStatusSubscriptionService daemonConnection](self, "daemonConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __76__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveSubscriptions__block_invoke;
  v28[3] = &unk_24CF73A40;
  v18 = &v29;
  objc_copyWeak(&v29, &location);
  v28[4] = &buf;
  objc_msgSend(v5, "synchronousRemoteDaemonWithErrorHandler:", v28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v6;
  v24[1] = 3221225472;
  v24[2] = __76__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveSubscriptions__block_invoke_12;
  v24[3] = &unk_24CF73AE0;
  v8 = v3;
  v25 = v8;
  v19 = &v27;
  objc_copyWeak(&v27, &location);
  p_buf = &buf;
  objc_msgSend(v7, "allSubscriptionMetadatasWithActiveSubscriptionsForStatusTypeIdentifier:completion:", v8, v24);
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13);
        v15 = [SKStatusSubscription alloc];
        v16 = -[SKStatusSubscription initWithSubscriptionMetadata:daemonConnection:](v15, "initWithSubscriptionMetadata:daemonConnection:", v14, v5, v18, v19, (_QWORD)v20);
        if (v16)
          objc_msgSend(v9, "addObject:", v16);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
    }
    while (v11);
  }

  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
  return v9;
}

void __76__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveSubscriptions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;

  v3 = a2;
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveSubscriptions__block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v3);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

void __76__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveSubscriptions__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *WeakRetained;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  int v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __76__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveSubscriptions__block_invoke_12_cold_2();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    -[NSObject _simulateCrashIfNecessaryForError:](WeakRetained, "_simulateCrashIfNecessaryForError:", v6);
  }
  else
  {
    +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    WeakRetained = v9;
    if (v5)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v13 = 138412546;
        v14 = v5;
        v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_213251000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Retreived active subscription metadatas for status type. subscriptionMetadata: %@ statusType: %@", (uint8_t *)&v13, 0x16u);
      }

      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = v5;
      WeakRetained = *(NSObject **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v12;
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __76__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveSubscriptions__block_invoke_12_cold_1();
    }
  }

}

- (id)_allStatusSubscriptionsIncludingPersonalSubscription:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  SKStatusSubscription *v17;
  SKStatusSubscription *v18;
  id *v20;
  id *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  __int128 *p_buf;
  id v29;
  _QWORD v30[5];
  id v31;
  id location;
  uint8_t v33[128];
  __int128 buf;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;

  v3 = a3;
  v39 = *MEMORY[0x24BDAC8D0];
  -[SKStatusSubscriptionService _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKStatusSubscriptionService statusTypeIdentifier](self, "statusTypeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_213251000, v6, OS_LOG_TYPE_DEFAULT, "Fetching all subscription (sync) for statusType: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__1;
  v37 = __Block_byref_object_dispose__1;
  v38 = 0;
  -[SKStatusSubscriptionService daemonConnection](self, "daemonConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __84__SKStatusSubscriptionService__allStatusSubscriptionsIncludingPersonalSubscription___block_invoke;
  v30[3] = &unk_24CF73A40;
  v20 = &v31;
  objc_copyWeak(&v31, &location);
  v30[4] = &buf;
  objc_msgSend(v7, "synchronousRemoteDaemonWithErrorHandler:", v30);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v8;
  v26[1] = 3221225472;
  v26[2] = __84__SKStatusSubscriptionService__allStatusSubscriptionsIncludingPersonalSubscription___block_invoke_13;
  v26[3] = &unk_24CF73AE0;
  v10 = v5;
  v27 = v10;
  v21 = &v29;
  objc_copyWeak(&v29, &location);
  p_buf = &buf;
  objc_msgSend(v9, "allSubscriptionMetadatasForStatusTypeIdentifier:includingPersonalSubscription:completion:", v10, v3, v26);
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v23;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v12);
        v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15);
        v17 = [SKStatusSubscription alloc];
        v18 = -[SKStatusSubscription initWithSubscriptionMetadata:daemonConnection:](v17, "initWithSubscriptionMetadata:daemonConnection:", v16, v7, v20, v21, (_QWORD)v22);
        if (v18)
          objc_msgSend(v11, "addObject:", v18);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
    }
    while (v13);
  }

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
  return v11;
}

void __84__SKStatusSubscriptionService__allStatusSubscriptionsIncludingPersonalSubscription___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;

  v3 = a2;
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __84__SKStatusSubscriptionService__allStatusSubscriptionsIncludingPersonalSubscription___block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v3);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

void __84__SKStatusSubscriptionService__allStatusSubscriptionsIncludingPersonalSubscription___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *WeakRetained;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  int v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __84__SKStatusSubscriptionService__allStatusSubscriptionsIncludingPersonalSubscription___block_invoke_13_cold_2();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    -[NSObject _simulateCrashIfNecessaryForError:](WeakRetained, "_simulateCrashIfNecessaryForError:", v6);
  }
  else
  {
    +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    WeakRetained = v9;
    if (v5)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v13 = 138412546;
        v14 = v5;
        v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_213251000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Retreived subscription metadatas for status type. subscriptionMetadata: %@ statusType: %@", (uint8_t *)&v13, 0x16u);
      }

      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = v5;
      WeakRetained = *(NSObject **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v12;
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __84__SKStatusSubscriptionService__allStatusSubscriptionsIncludingPersonalSubscription___block_invoke_13_cold_1();
    }
  }

}

- (void)allStatusSubscriptionsWithPersistentSubscriptionAssertionForApplicationIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SKStatusSubscriptionService _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKStatusSubscriptionService statusTypeIdentifier](self, "statusTypeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v26 = v8;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_213251000, v9, OS_LOG_TYPE_DEFAULT, "Fetching all subscription with persistent assertion for statusType: %{public}@ application identifer: %@", buf, 0x16u);
  }

  -[SKStatusSubscriptionService daemonConnection](self, "daemonConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v11 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __124__SKStatusSubscriptionService_allStatusSubscriptionsWithPersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke;
  v22[3] = &unk_24CF73710;
  objc_copyWeak(&v24, (id *)buf);
  v12 = v7;
  v23 = v12;
  objc_msgSend(v10, "asynchronousRemoteDaemonWithErrorHandler:", v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __124__SKStatusSubscriptionService_allStatusSubscriptionsWithPersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_14;
  v17[3] = &unk_24CF73B08;
  v14 = v8;
  v18 = v14;
  objc_copyWeak(&v21, (id *)buf);
  v15 = v12;
  v20 = v15;
  v16 = v10;
  v19 = v16;
  objc_msgSend(v13, "allStatusSubscriptionsWithPersistentSubscriptionAssertionForApplicationIdentifier:statusTypeIdentifier:completion:", v6, v14, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);

}

void __124__SKStatusSubscriptionService_allStatusSubscriptionsWithPersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __124__SKStatusSubscriptionService_allStatusSubscriptionsWithPersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __124__SKStatusSubscriptionService_allStatusSubscriptionsWithPersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id WeakRetained;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  SKStatusSubscription *v19;
  SKStatusSubscription *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __84__SKStatusSubscriptionService__allStatusSubscriptionsIncludingPersonalSubscription___block_invoke_13_cold_2();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v6);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v5, "count");
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218498;
      v27 = v10;
      v28 = 2112;
      v29 = v5;
      v30 = 2112;
      v31 = v11;
      _os_log_impl(&dword_213251000, v8, OS_LOG_TYPE_DEFAULT, "Retreived %ld subscription metadatas for status type. subscriptionMetadata: %@ statusType: %@", buf, 0x20u);
    }

    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = v5;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v17);
          v19 = [SKStatusSubscription alloc];
          v20 = -[SKStatusSubscription initWithSubscriptionMetadata:daemonConnection:](v19, "initWithSubscriptionMetadata:daemonConnection:", v18, *(_QWORD *)(a1 + 40), (_QWORD)v21);
          if (v20)
            objc_msgSend(v12, "addObject:", v20);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v15);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (id)subscriptionValidationTokensForHandle:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  _BYTE *v18;
  id v19;
  _QWORD v20[6];
  id v21;
  id location;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE buf[24];
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SKStatusSubscriptionService _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKStatusSubscriptionService statusTypeIdentifier](self, "statusTypeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "handleString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_213251000, v8, OS_LOG_TYPE_DEFAULT, "Fetching channel validation token (sync) for statusType: %{public}@ handle: %@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__1;
  v27 = __Block_byref_object_dispose__1;
  v28 = 0;
  -[SKStatusSubscriptionService daemonConnection](self, "daemonConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v11 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __75__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_error___block_invoke;
  v20[3] = &unk_24CF73B30;
  objc_copyWeak(&v21, &location);
  v20[4] = buf;
  v20[5] = &v23;
  objc_msgSend(v10, "synchronousRemoteDaemonWithErrorHandler:", v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __75__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_error___block_invoke_15;
  v16[3] = &unk_24CF73B58;
  objc_copyWeak(&v19, &location);
  v13 = v6;
  v17 = v13;
  v18 = buf;
  objc_msgSend(v12, "subscriptionValidationTokensForHandle:statusTypeIdentifier:completion:", v13, v7, v16);
  if (a4)
    *a4 = objc_retainAutorelease((id)v24[5]);
  v14 = *(id *)(*(_QWORD *)&buf[8] + 40);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(buf, 8);

  return v14;
}

void __75__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __75__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_error___block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v3);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __75__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_error___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *WeakRetained;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __75__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_error___block_invoke_15_cold_2();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    -[NSObject _simulateCrashIfNecessaryForError:](WeakRetained, "_simulateCrashIfNecessaryForError:", v6);
  }
  else
  {
    +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    WeakRetained = v9;
    if (v5)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "handleString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412546;
        v21 = v10;
        v22 = 2112;
        v23 = v5;
        _os_log_impl(&dword_213251000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Subscription validation (sync) token for handle: %@ is \"%@\", (uint8_t *)&v20, 0x16u);

      }
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = v5;
      WeakRetained = *(NSObject **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v12;
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      __75__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_error___block_invoke_15_cold_1(WeakRetained, v13, v14, v15, v16, v17, v18, v19);
    }
  }

}

- (void)subscriptionValidationTokensForHandle:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SKStatusSubscriptionService _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKStatusSubscriptionService statusTypeIdentifier](self, "statusTypeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "handleString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v8;
    v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_213251000, v9, OS_LOG_TYPE_DEFAULT, "Fetching channel validation token (async) for statusType: %{public}@ handle: %@", buf, 0x16u);

  }
  -[SKStatusSubscriptionService daemonConnection](self, "daemonConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v12 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __80__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_completion___block_invoke;
  v21[3] = &unk_24CF73710;
  objc_copyWeak(&v23, (id *)buf);
  v13 = v7;
  v22 = v13;
  objc_msgSend(v11, "asynchronousRemoteDaemonWithErrorHandler:", v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __80__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_completion___block_invoke_17;
  v17[3] = &unk_24CF73B80;
  objc_copyWeak(&v20, (id *)buf);
  v15 = v13;
  v19 = v15;
  v16 = v6;
  v18 = v16;
  objc_msgSend(v14, "subscriptionValidationTokensForHandle:statusTypeIdentifier:completion:", v16, v8, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);

}

void __80__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __80__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_completion___block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_completion___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  void (*v9)(void);
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __80__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_completion___block_invoke_17_cold_2();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v6);

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v5)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "handleString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412546;
        v21 = v12;
        v22 = 2112;
        v23 = v5;
        _os_log_impl(&dword_213251000, v11, OS_LOG_TYPE_DEFAULT, "Subscription validation token (async) for handle: %@ is \"%@\", (uint8_t *)&v20, 0x16u);

      }
      v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        __80__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_completion___block_invoke_17_cold_1(v11, v13, v14, v15, v16, v17, v18, v19);

      v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
  }
  v9();

}

- (void)validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens:(id)a3 fromSender:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SKStatusSubscriptionService _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKStatusSubscriptionService statusTypeIdentifier](self, "statusTypeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "handleString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v30 = v8;
    v31 = 2114;
    v32 = v11;
    v33 = 2112;
    v34 = v13;
    _os_log_impl(&dword_213251000, v12, OS_LOG_TYPE_DEFAULT, "Validating subscription validation token \"%@\" for statusType: %{public}@ fromHandle: %@", buf, 0x20u);

  }
  -[SKStatusSubscriptionService daemonConnection](self, "daemonConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v15 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __123__SKStatusSubscriptionService_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_completion___block_invoke;
  v26[3] = &unk_24CF73710;
  objc_copyWeak(&v28, (id *)buf);
  v16 = v10;
  v27 = v16;
  objc_msgSend(v14, "asynchronousRemoteDaemonWithErrorHandler:", v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __123__SKStatusSubscriptionService_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_completion___block_invoke_18;
  v21[3] = &unk_24CF73BA8;
  objc_copyWeak(&v25, (id *)buf);
  v18 = v8;
  v22 = v18;
  v19 = v9;
  v23 = v19;
  v20 = v16;
  v24 = v20;
  objc_msgSend(v17, "validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens:fromSender:statusTypeIdentifier:completion:", v18, v19, v11, v21);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);

}

void __123__SKStatusSubscriptionService_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __123__SKStatusSubscriptionService_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_completion___block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __123__SKStatusSubscriptionService_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_completion___block_invoke_18(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *WeakRetained;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __123__SKStatusSubscriptionService_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_completion___block_invoke_18_cold_3();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    -[NSObject _simulateCrashIfNecessaryForError:](WeakRetained, "_simulateCrashIfNecessaryForError:", v5);
  }
  else if (a2 == 2)
  {
    +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      __123__SKStatusSubscriptionService_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_completion___block_invoke_18_cold_2(a1, WeakRetained);
  }
  else if (a2 == 1)
  {
    +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "handleString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_213251000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Subscription validation token \"%@\" from %@ is valid", (uint8_t *)&v10, 0x16u);

    }
  }
  else
  {
    if (a2)
      goto LABEL_6;
    +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      __123__SKStatusSubscriptionService_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_completion___block_invoke_18_cold_1(a1, WeakRetained);
  }

LABEL_6:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6;
  NSMapTable *v7;
  SKDelegateResponseQueue *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self->_delegates;
  objc_sync_enter(v7);
  v8 = -[SKDelegateResponseQueue initWithQueue:]([SKDelegateResponseQueue alloc], "initWithQueue:", v6);
  -[NSMapTable setObject:forKey:](self->_delegates, "setObject:forKey:", v8, v9);

  objc_sync_exit(v7);
  -[SKStatusSubscriptionService _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");

}

- (void)removeDelegate:(id)a3
{
  NSMapTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_delegates;
  objc_sync_enter(v4);
  -[NSMapTable removeObjectForKey:](self->_delegates, "removeObjectForKey:", v5);
  objc_sync_exit(v4);

}

- (void)_registerForDelegateCallbacksIfNecessary
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSMapTable *obj;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  obj = self->_delegates;
  objc_sync_enter(obj);
  if (self->_registeredForDelegateCallbacks || !-[NSMapTable count](self->_delegates, "count"))
  {
    objc_sync_exit(obj);

  }
  else
  {
    self->_registeredForDelegateCallbacks = 1;
    objc_sync_exit(obj);

    -[SKStatusSubscriptionService statusTypeIdentifier](self, "statusTypeIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v3;
      _os_log_impl(&dword_213251000, v4, OS_LOG_TYPE_DEFAULT, "Registering for delegate callbacks for statusTypeIdentifier: %{public}@", buf, 0xCu);
    }

    -[SKStatusSubscriptionService daemonConnection](self, "daemonConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    v6 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __71__SKStatusSubscriptionService__registerForDelegateCallbacksIfNecessary__block_invoke;
    v13[3] = &unk_24CF73738;
    objc_copyWeak(&v14, (id *)buf);
    objc_msgSend(v5, "asynchronousRemoteDaemonWithErrorHandler:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __71__SKStatusSubscriptionService__registerForDelegateCallbacksIfNecessary__block_invoke_21;
    v10[3] = &unk_24CF73760;
    objc_copyWeak(&v12, (id *)buf);
    v8 = v3;
    v11 = v8;
    objc_msgSend(v7, "registerForDelegateCallbacksWithStatusTypeIdentifier:completion:", v8, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);

  }
}

void __71__SKStatusSubscriptionService__registerForDelegateCallbacksIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__SKStatusPublishingService__registerForDelegateCallbacksIfNecessary__block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v3);

}

void __71__SKStatusSubscriptionService__registerForDelegateCallbacksIfNecessary__block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *WeakRetained;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  WeakRetained = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __69__SKStatusPublishingService__registerForDelegateCallbacksIfNecessary__block_invoke_20_cold_1();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[NSObject _simulateCrashIfNecessaryForError:](WeakRetained, "_simulateCrashIfNecessaryForError:", v3);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_213251000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Completed registration for delegate callbacks for statusTypeIdentifier: %@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)subscriptionDaemonConnectionDidDisconnect:(id)a3
{
  NSMapTable *v4;
  dispatch_group_t v5;
  _QWORD v6[5];

  v4 = self->_delegates;
  objc_sync_enter(v4);
  self->_registeredForDelegateCallbacks = 0;
  objc_sync_exit(v4);

  v5 = dispatch_group_create();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __73__SKStatusSubscriptionService_subscriptionDaemonConnectionDidDisconnect___block_invoke;
  v6[3] = &unk_24CF73BD0;
  v6[4] = self;
  -[SKStatusSubscriptionService _delegatesPerformOnResponseQueueForGroup:block:](self, "_delegatesPerformOnResponseQueueForGroup:block:", v5, v6);

}

void __73__SKStatusSubscriptionService_subscriptionDaemonConnectionDidDisconnect___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v3 = a2;
  v4 = objc_opt_respondsToSelector();
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) != 0)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213251000, v5, OS_LOG_TYPE_DEFAULT, "Notifying subscription service delegate that the XPC connection has disconnected", buf, 2u);
    }

    objc_msgSend(v3, "subscriptionServiceDaemonDisconnected:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_213251000, v5, OS_LOG_TYPE_DEFAULT, "Subscription service delegate does not implement the delegate method to be notified the XPC connection has disconnected", v7, 2u);
    }

  }
}

- (void)subscriptionStateChangedForSubscriptions:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SKStatusSubscription *v14;
  SKStatusSubscription *v15;
  NSObject *privateWorkQueue;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  _QWORD v21[4];
  SKStatusSubscription *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v18 = a4;
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v6;
    _os_log_impl(&dword_213251000, v7, OS_LOG_TYPE_DEFAULT, "Subscription state changed: %@", buf, 0xCu);
  }

  v8 = dispatch_group_create();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = -[SKStatusSubscription initWithSubscriptionMetadata:daemonConnection:]([SKStatusSubscription alloc], "initWithSubscriptionMetadata:daemonConnection:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v13), self->_daemonConnection);
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __83__SKStatusSubscriptionService_subscriptionStateChangedForSubscriptions_completion___block_invoke;
        v21[3] = &unk_24CF73BD0;
        v22 = v14;
        v15 = v14;
        -[SKStatusSubscriptionService _delegatesPerformOnResponseQueueForGroup:block:](self, "_delegatesPerformOnResponseQueueForGroup:block:", v8, v21);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  privateWorkQueue = self->_privateWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__SKStatusSubscriptionService_subscriptionStateChangedForSubscriptions_completion___block_invoke_27;
  block[3] = &unk_24CF73980;
  v20 = v18;
  v17 = v18;
  dispatch_group_notify(v8, privateWorkQueue, block);

}

void __83__SKStatusSubscriptionService_subscriptionStateChangedForSubscriptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_opt_respondsToSelector();
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_213251000, v6, OS_LOG_TYPE_DEFAULT, "Informing delegate of state change. Delegate: %@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(v3, "subscriptionStateChanged:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __83__SKStatusSubscriptionService_subscriptionStateChangedForSubscriptions_completion___block_invoke_cold_1();

  }
}

uint64_t __83__SKStatusSubscriptionService_subscriptionStateChangedForSubscriptions_completion___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)subscriptionReceivedStatusUpdate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  SKStatusSubscription *v10;
  uint64_t v11;
  SKStatusSubscription *v12;
  NSObject *privateWorkQueue;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  SKStatusSubscription *v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_impl(&dword_213251000, v8, OS_LOG_TYPE_DEFAULT, "Subscription received a status update: %@", buf, 0xCu);
  }

  v9 = dispatch_group_create();
  v10 = -[SKStatusSubscription initWithSubscriptionMetadata:daemonConnection:]([SKStatusSubscription alloc], "initWithSubscriptionMetadata:daemonConnection:", v6, self->_daemonConnection);
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __75__SKStatusSubscriptionService_subscriptionReceivedStatusUpdate_completion___block_invoke;
  v17[3] = &unk_24CF73BD0;
  v18 = v10;
  v12 = v10;
  -[SKStatusSubscriptionService _delegatesPerformOnResponseQueueForGroup:block:](self, "_delegatesPerformOnResponseQueueForGroup:block:", v9, v17);
  privateWorkQueue = self->_privateWorkQueue;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __75__SKStatusSubscriptionService_subscriptionReceivedStatusUpdate_completion___block_invoke_31;
  v15[3] = &unk_24CF73980;
  v16 = v7;
  v14 = v7;
  dispatch_group_notify(v9, privateWorkQueue, v15);

}

void __75__SKStatusSubscriptionService_subscriptionReceivedStatusUpdate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_opt_respondsToSelector();
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_213251000, v6, OS_LOG_TYPE_DEFAULT, "Informing delegate of status update. Delegate: %@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(v3, "subscriptionReceivedStatusUpdate:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __75__SKStatusSubscriptionService_subscriptionReceivedStatusUpdate_completion___block_invoke_cold_1();

  }
}

uint64_t __75__SKStatusSubscriptionService_subscriptionReceivedStatusUpdate_completion___block_invoke_31(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)subscriptionInvitationReceived:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  SKStatusSubscription *v10;
  uint64_t v11;
  SKStatusSubscription *v12;
  NSObject *privateWorkQueue;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  SKStatusSubscription *v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_impl(&dword_213251000, v8, OS_LOG_TYPE_DEFAULT, "Invitation received for subscription: %@", buf, 0xCu);
  }

  v9 = dispatch_group_create();
  v10 = -[SKStatusSubscription initWithSubscriptionMetadata:daemonConnection:]([SKStatusSubscription alloc], "initWithSubscriptionMetadata:daemonConnection:", v6, self->_daemonConnection);
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __73__SKStatusSubscriptionService_subscriptionInvitationReceived_completion___block_invoke;
  v17[3] = &unk_24CF73BD0;
  v18 = v10;
  v12 = v10;
  -[SKStatusSubscriptionService _delegatesPerformOnResponseQueueForGroup:block:](self, "_delegatesPerformOnResponseQueueForGroup:block:", v9, v17);
  privateWorkQueue = self->_privateWorkQueue;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __73__SKStatusSubscriptionService_subscriptionInvitationReceived_completion___block_invoke_34;
  v15[3] = &unk_24CF73980;
  v16 = v7;
  v14 = v7;
  dispatch_group_notify(v9, privateWorkQueue, v15);

}

void __73__SKStatusSubscriptionService_subscriptionInvitationReceived_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_opt_respondsToSelector();
  +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_213251000, v6, OS_LOG_TYPE_DEFAULT, "Informing delegate of invitation received. Delegate: %@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(v3, "subscriptionInvitationReceived:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __73__SKStatusSubscriptionService_subscriptionInvitationReceived_completion___block_invoke_cold_1();

  }
}

uint64_t __73__SKStatusSubscriptionService_subscriptionInvitationReceived_completion___block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_delegatesPerformOnResponseQueueForGroup:(id)a3 block:(id)a4
{
  NSObject *v6;
  id v7;
  NSMapTable *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id obj;
  _QWORD block[5];
  NSObject *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[16];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self->_delegates;
  objc_sync_enter(v8);
  v9 = (void *)-[NSMapTable copy](self->_delegates, "copy");
  objc_sync_exit(v8);

  if (!objc_msgSend(v9, "count"))
  {
    +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213251000, v10, OS_LOG_TYPE_DEFAULT, "No delegates available to perform subscription service delegate callback", buf, 2u);
    }

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v9, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dispatchQueue");
        v16 = objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v6);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __78__SKStatusSubscriptionService__delegatesPerformOnResponseQueueForGroup_block___block_invoke;
        block[3] = &unk_24CF73788;
        v20 = v7;
        block[4] = v14;
        v19 = v6;
        dispatch_async(v16, block);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v11);
  }

}

void __78__SKStatusSubscriptionService__delegatesPerformOnResponseQueueForGroup_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_simulateCrashIfNecessaryForError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("SKStatusSubscriptionErrorDomain"));

  if (v6 && objc_msgSend(v4, "code") == -2000)
  {
    +[SKStatusSubscriptionService logger](SKStatusSubscriptionService, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[SKStatusSubscriptionService _simulateCrashIfNecessaryForError:].cold.1(self, v7);

  }
}

+ (id)logger
{
  if (logger_onceToken_8 != -1)
    dispatch_once(&logger_onceToken_8, &__block_literal_global_9);
  return (id)logger__logger_8;
}

void __37__SKStatusSubscriptionService_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SubscriptionService");
  v1 = (void *)logger__logger_8;
  logger__logger_8 = (uint64_t)v0;

}

- (SKStatusSubscriptionDaemonConnection)daemonConnection
{
  SKStatusSubscriptionService *v2;
  SKStatusSubscriptionDaemonConnection *daemonConnection;
  SKStatusSubscriptionDaemonConnection *v4;
  SKStatusSubscriptionDaemonConnection *v5;
  SKStatusSubscriptionDaemonConnection *v6;

  v2 = self;
  objc_sync_enter(v2);
  daemonConnection = v2->_daemonConnection;
  if (!daemonConnection)
  {
    v4 = -[SKStatusSubscriptionDaemonConnection initWithSubscriptionDaemonDelegate:connectionDelegate:]([SKStatusSubscriptionDaemonConnection alloc], "initWithSubscriptionDaemonDelegate:connectionDelegate:", v2, v2);
    v5 = v2->_daemonConnection;
    v2->_daemonConnection = v4;

    daemonConnection = v2->_daemonConnection;
  }
  v6 = daemonConnection;
  objc_sync_exit(v2);

  return v6;
}

- (void)setDaemonConnection:(id)a3
{
  objc_storeStrong((id *)&self->_daemonConnection, a3);
}

- (NSString)statusTypeIdentifier
{
  return self->_statusTypeIdentifier;
}

- (NSMapTable)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_delegates, a3);
}

- (BOOL)registeredForDelegateCallbacks
{
  return self->_registeredForDelegateCallbacks;
}

- (void)setRegisteredForDelegateCallbacks:(BOOL)a3
{
  self->_registeredForDelegateCallbacks = a3;
}

- (OS_dispatch_queue)privateWorkQueue
{
  return self->_privateWorkQueue;
}

- (void)setPrivateWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateWorkQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateWorkQueue, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_statusTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

- (id)subscriptionValidationTokenForHandle:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  -[SKStatusSubscriptionService subscriptionValidationTokensForHandle:error:](self, "subscriptionValidationTokensForHandle:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptionValidationToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)subscriptionValidationTokenForHandle:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __91__SKStatusSubscriptionService_Deprecated__subscriptionValidationTokenForHandle_completion___block_invoke;
  v8[3] = &unk_24CF73BF8;
  v9 = v6;
  v7 = v6;
  -[SKStatusSubscriptionService subscriptionValidationTokensForHandle:completion:](self, "subscriptionValidationTokensForHandle:completion:", a3, v8);

}

void __91__SKStatusSubscriptionService_Deprecated__subscriptionValidationTokenForHandle_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a2, "subscriptionValidationToken");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)validatePersonalStatusSubscriptionMatchesSubscriptionValidationToken:(id)a3 fromSender:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKSubscriptionValidationTokens *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[SKSubscriptionValidationTokens initWithSubscriptionValidationToken:encryptionValidationToken:]([SKSubscriptionValidationTokens alloc], "initWithSubscriptionValidationToken:encryptionValidationToken:", v10, 0);

  -[SKStatusSubscriptionService validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens:fromSender:completion:](self, "validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens:fromSender:completion:", v11, v9, v8);
}

void __59__SKStatusSubscriptionService_statusSubscriptionForHandle___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "XPC Error retrieving subscription. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __59__SKStatusSubscriptionService_statusSubscriptionForHandle___block_invoke_4_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_213251000, v0, v1, "Error retrieving subscription for handle. Error: %@ handle: %@");
  OUTLINED_FUNCTION_5();
}

void __57__SKStatusSubscriptionService_personalStatusSubscription__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "XPC Error retrieving personal subscription. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __57__SKStatusSubscriptionService_personalStatusSubscription__block_invoke_8_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "Error retrieving personal subscription. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __73__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveAssertions__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "XPC Error retrieving all subscription assertions. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __73__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveAssertions__block_invoke_9_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_9(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "Did not find subscription assertions for status type: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void __73__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveAssertions__block_invoke_9_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_213251000, v0, v1, "Error retrieving all subscription assertions for status type: %@. Error: %@");
  OUTLINED_FUNCTION_5();
}

void __76__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveSubscriptions__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "XPC Error retrieving all active subscriptions. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __76__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveSubscriptions__block_invoke_12_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_9(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "Did not find active subscriptions for status type: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void __76__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveSubscriptions__block_invoke_12_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_213251000, v0, v1, "Error retrieving all active subscription for status type: %@. Error: %@");
  OUTLINED_FUNCTION_5();
}

void __84__SKStatusSubscriptionService__allStatusSubscriptionsIncludingPersonalSubscription___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "XPC Error retrieving all subscriptions. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __84__SKStatusSubscriptionService__allStatusSubscriptionsIncludingPersonalSubscription___block_invoke_13_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_9(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "Did not find subscriptions for status type: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void __84__SKStatusSubscriptionService__allStatusSubscriptionsIncludingPersonalSubscription___block_invoke_13_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_213251000, v0, v1, "Error retrieving all subscription for status type: %@. Error: %@");
  OUTLINED_FUNCTION_5();
}

void __124__SKStatusSubscriptionService_allStatusSubscriptionsWithPersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "XPC Error retrieving all subscriptions with persistent assertion. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __75__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "XPC Error fetching channel validation token (sync). Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __75__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_error___block_invoke_15_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8_0(&dword_213251000, a1, a3, "Daemon returned neither a subscription validation token nor an error (sync), this should not happen, daemon should return empty string to indicate a value is not found.", a5, a6, a7, a8, 0);
}

void __75__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_error___block_invoke_15_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "Error fetching channel validation token (sync). Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __80__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "XPC Error fetching channel validation token (async). Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __80__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_completion___block_invoke_17_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8_0(&dword_213251000, a1, a3, "Daemon returned neither a subscription validation token nor an error (async), this should not happen, daemon should return empty string to indicate a value is not found.", a5, a6, a7, a8, 0);
}

void __80__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_completion___block_invoke_17_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "Error fetching channel validation token (async). Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __123__SKStatusSubscriptionService_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "XPC Error validating validation token (async). Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __123__SKStatusSubscriptionService_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_completion___block_invoke_18_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 40), "handleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_4_0(&dword_213251000, a2, v4, "Subscription validation token \"%@\" from %@ has an UNKNOWN VALIDITY (!?), with no error. This is likely a bug in StatusKit.", v5);

  OUTLINED_FUNCTION_7_0();
}

void __123__SKStatusSubscriptionService_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_completion___block_invoke_18_cold_2(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 40), "handleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_4_0(&dword_213251000, a2, v4, "Subscription validation token \"%@\" from %@ is NOT VALID. Client should re-invite this handle if appropriate.", v5);

  OUTLINED_FUNCTION_7_0();
}

void __123__SKStatusSubscriptionService_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_completion___block_invoke_18_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "Error validating subscription validation token (async). Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __83__SKStatusSubscriptionService_subscriptionStateChangedForSubscriptions_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "Delegate does not implement subscriptionStateChanged:, not informing delegate: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __75__SKStatusSubscriptionService_subscriptionReceivedStatusUpdate_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "Delegate does not implement subscriptionReceivedStatusUpdate:, not informing delegate: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __73__SKStatusSubscriptionService_subscriptionInvitationReceived_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "Delegate does not implement subscriptionInvitationReceived:, not informing delegate: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_simulateCrashIfNecessaryForError:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[12];
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "statusTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  v5 = 2114;
  v6 = CFSTR("com.apple.StatusKit.subscribe.types");
  _os_log_fault_impl(&dword_213251000, a2, OS_LOG_TYPE_FAULT, "Client is attempting to access StatusKit subscription information of type %{public}@ but is not entitled. Client needs %{public}@ entitlement with this status type identifier.", v4, 0x16u);

}

@end
