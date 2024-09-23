@implementation SKPresence

- (SKPresence)initWithPresenceIdentifier:(id)a3 isPersonal:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  SKPresenceOptions *v7;
  SKPresence *v8;

  v4 = a4;
  v6 = a3;
  v7 = -[SKPresenceOptions initWithServiceIdentifier:]([SKPresenceOptions alloc], "initWithServiceIdentifier:", &stru_24CF74158);
  -[SKPresenceOptions setIsPersonal:](v7, "setIsPersonal:", v4);
  v8 = -[SKPresence initWithPresenceIdentifier:options:](self, "initWithPresenceIdentifier:options:", v6, v7);

  return v8;
}

- (SKPresence)initWithPresenceIdentifier:(id)a3
{
  return -[SKPresence initWithPresenceIdentifier:isPersonal:](self, "initWithPresenceIdentifier:isPersonal:", a3, 0);
}

- (SKPresence)initWithPresenceIdentifier:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SKPresence *v9;
  uint64_t v10;
  NSString *presenceIdentifier;
  uint64_t v12;
  NSMapTable *delegates;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *privateWorkQueue;
  NSObject *v19;
  uint8_t v21[16];
  objc_super v22;

  v6 = a3;
  v7 = a4;
  if (!v6)
    -[SKPresence initWithPresenceIdentifier:options:].cold.1();
  v8 = v7;
  v22.receiver = self;
  v22.super_class = (Class)SKPresence;
  v9 = -[SKPresence init](&v22, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    presenceIdentifier = v9->_presenceIdentifier;
    v9->_presenceIdentifier = (NSString *)v10;

    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v12 = objc_claimAutoreleasedReturnValue();
    delegates = v9->_delegates;
    v9->_delegates = (NSMapTable *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v14, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();

    dispatch_get_global_queue(0, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create_with_target_V2("com.apple.StatusKit.Presence", v15, v16);
    privateWorkQueue = v9->_privateWorkQueue;
    v9->_privateWorkQueue = (OS_dispatch_queue *)v17;

    v9->_lock._os_unfair_lock_opaque = 0;
    v9->_delegateLock._os_unfair_lock_opaque = 0;
    +[SKPresence _logger](SKPresence, "_logger");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_213251000, v19, OS_LOG_TYPE_DEFAULT, "_delegateLock init", v21, 2u);
    }

    objc_storeStrong((id *)&v9->_options, a4);
  }

  return v9;
}

- (BOOL)isPersonal
{
  void *v2;
  char v3;

  -[SKPresence options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPersonal");

  return v3;
}

- (void)hasInitialCloudKitImportOccurredWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v4 = a3;
  +[SKPresence _logger](SKPresence, "_logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213251000, v5, OS_LOG_TYPE_DEFAULT, "Checking if the initial cloud kit import has occurred.", buf, 2u);
  }

  -[SKPresence daemonConnection](self, "daemonConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61__SKPresence_hasInitialCloudKitImportOccurredWithCompletion___block_invoke;
  v13[3] = &unk_24CF73500;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v6, "asynchronousRemoteDaemonWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __61__SKPresence_hasInitialCloudKitImportOccurredWithCompletion___block_invoke_15;
  v11[3] = &unk_24CF738E0;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "hasInitialCloudKitImportOccurredWithCompletion:", v11);

}

void __61__SKPresence_hasInitialCloudKitImportOccurredWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[SKPresence _logger](SKPresence, "_logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__SKPresence_hasInitialCloudKitImportOccurredWithCompletion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __61__SKPresence_hasInitialCloudKitImportOccurredWithCompletion___block_invoke_15(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;

  v5 = a2;
  if (v5)
  {
    +[SKPresence _logger](SKPresence, "_logger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __61__SKPresence_hasInitialCloudKitImportOccurredWithCompletion___block_invoke_15_cold_1();

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a3, v5);

}

- (void)assertPresenceWithCompletion:(id)a3
{
  -[SKPresence assertPresenceWithPresencePayload:completion:](self, "assertPresenceWithPresencePayload:completion:", 0, a3);
}

- (void)assertPresenceWithPresencePayload:(id)a3 completion:(id)a4
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
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SKPresence presenceIdentifier](self, "presenceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKPresence _logger](SKPresence, "_logger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v25 = v8;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_213251000, v9, OS_LOG_TYPE_DEFAULT, "Asserting presence for %@ with payload %@", buf, 0x16u);
  }

  -[SKPresence _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKPresence daemonConnection](self, "daemonConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __59__SKPresence_assertPresenceWithPresencePayload_completion___block_invoke;
  v22[3] = &unk_24CF73500;
  v12 = v7;
  v23 = v12;
  objc_msgSend(v10, "asynchronousRemoteDaemonWithErrorHandler:", v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __59__SKPresence_assertPresenceWithPresencePayload_completion___block_invoke_17;
  v17[3] = &unk_24CF73908;
  v14 = v8;
  v18 = v14;
  objc_copyWeak(&v21, (id *)buf);
  v15 = v6;
  v19 = v15;
  v16 = v12;
  v20 = v16;
  objc_msgSend(v13, "assertPresenceForIdentifier:withPresencePayload:completion:", v14, v15, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);

}

void __59__SKPresence_assertPresenceWithPresencePayload_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[SKPresence _logger](SKPresence, "_logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59__SKPresence_assertPresenceWithPresencePayload_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __59__SKPresence_assertPresenceWithPresencePayload_completion___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *WeakRetained;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[SKPresence _logger](SKPresence, "_logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __59__SKPresence_assertPresenceWithPresencePayload_completion___block_invoke_17_cold_1();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_213251000, v5, OS_LOG_TYPE_DEFAULT, "Successfully asserted presence for presence identifier %@", (uint8_t *)&v9, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v5 = WeakRetained;
    if (WeakRetained)
    {
      -[NSObject setHasPresenceAssertion:](WeakRetained, "setHasPresenceAssertion:", 1);
      -[NSObject setPayload:](v5, "setPayload:", *(_QWORD *)(a1 + 40));
    }
  }

  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

- (void)releasePresenceWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  SKPresence *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SKPresence presenceIdentifier](self, "presenceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKPresence _logger](SKPresence, "_logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v5;
    _os_log_impl(&dword_213251000, v6, OS_LOG_TYPE_DEFAULT, "Releasing presence for  %@", buf, 0xCu);
  }

  -[SKPresence daemonConnection](self, "daemonConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __44__SKPresence_releasePresenceWithCompletion___block_invoke;
  v18[3] = &unk_24CF73500;
  v9 = v4;
  v19 = v9;
  objc_msgSend(v7, "asynchronousRemoteDaemonWithErrorHandler:", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __44__SKPresence_releasePresenceWithCompletion___block_invoke_18;
  v13[3] = &unk_24CF73908;
  v11 = v5;
  v14 = v11;
  objc_copyWeak(&v17, (id *)buf);
  v15 = self;
  v12 = v9;
  v16 = v12;
  objc_msgSend(v10, "releasePresenceForIdentifier:completion:", v11, v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

void __44__SKPresence_releasePresenceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[SKPresence _logger](SKPresence, "_logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __44__SKPresence_releasePresenceWithCompletion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __44__SKPresence_releasePresenceWithCompletion___block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *WeakRetained;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[SKPresence _logger](SKPresence, "_logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __44__SKPresence_releasePresenceWithCompletion___block_invoke_18_cold_1();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_213251000, v5, OS_LOG_TYPE_DEFAULT, "Successfully released presence for presence identifier %@", (uint8_t *)&v9, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v5 = WeakRetained;
    if (WeakRetained)
    {
      -[NSObject setHasPresenceAssertion:](WeakRetained, "setHasPresenceAssertion:", 0);
      -[NSObject setPayload:](v5, "setPayload:", 0);
    }
  }

  if ((objc_msgSend(*(id *)(a1 + 40), "hasTransientSubscription") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "releaseDaemonConnection");
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

- (void)retainTransientSubscriptionAssertionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SKPresence presenceIdentifier](self, "presenceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKPresence _logger](SKPresence, "_logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v5;
    _os_log_impl(&dword_213251000, v6, OS_LOG_TYPE_DEFAULT, "Retaining transient subscription assertion for presenceIdentifier %@", buf, 0xCu);
  }

  -[SKPresence daemonConnection](self, "daemonConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKPresence _logger](SKPresence, "_logger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v5;
    _os_log_impl(&dword_213251000, v8, OS_LOG_TYPE_DEFAULT, "calling _registerForDelegateCallbacksIfNecessary for presenceIdentifier %@", buf, 0xCu);
  }

  -[SKPresence _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  v9 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __65__SKPresence_retainTransientSubscriptionAssertionWithCompletion___block_invoke;
  v20[3] = &unk_24CF73500;
  v10 = v4;
  v21 = v10;
  objc_msgSend(v7, "asynchronousRemoteDaemonWithErrorHandler:", v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  +[SKPresence _logger](SKPresence, "_logger");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v5;
    _os_log_impl(&dword_213251000, v12, OS_LOG_TYPE_DEFAULT, "calling daemon retainTransientSubscriptionAssertionForPresenceIdentifier for presenceIdentifier %@", buf, 0xCu);
  }

  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __65__SKPresence_retainTransientSubscriptionAssertionWithCompletion___block_invoke_19;
  v15[3] = &unk_24CF735A8;
  v13 = v5;
  v16 = v13;
  objc_copyWeak(&v18, &location);
  v14 = v10;
  v17 = v14;
  objc_msgSend(v11, "retainTransientSubscriptionAssertionForPresenceIdentifier:completion:", v13, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __65__SKPresence_retainTransientSubscriptionAssertionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[SKPresence _logger](SKPresence, "_logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __75__SKStatusSubscription_retainTransientSubscriptionAssertionWithCompletion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __65__SKPresence_retainTransientSubscriptionAssertionWithCompletion___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *WeakRetained;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[SKPresence _logger](SKPresence, "_logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __75__SKStatusSubscription_retainTransientSubscriptionAssertionWithCompletion___block_invoke_1_cold_1();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_213251000, v5, OS_LOG_TYPE_DEFAULT, "Successfully retained transient subscription assertion for presence identifier %@", (uint8_t *)&v9, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v5 = WeakRetained;
    if (WeakRetained)
      -[NSObject setHasTransientSubscription:](WeakRetained, "setHasTransientSubscription:", 1);
  }

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

- (void)releaseTransientSubscriptionAssertionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  SKPresence *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SKPresence presenceIdentifier](self, "presenceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKPresence _logger](SKPresence, "_logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v5;
    _os_log_impl(&dword_213251000, v6, OS_LOG_TYPE_DEFAULT, "Releasing transient subscription assertion for presenceIdentifier %@", buf, 0xCu);
  }

  -[SKPresence daemonConnection](self, "daemonConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __66__SKPresence_releaseTransientSubscriptionAssertionWithCompletion___block_invoke;
  v18[3] = &unk_24CF73500;
  v9 = v4;
  v19 = v9;
  objc_msgSend(v7, "asynchronousRemoteDaemonWithErrorHandler:", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __66__SKPresence_releaseTransientSubscriptionAssertionWithCompletion___block_invoke_20;
  v13[3] = &unk_24CF73908;
  v11 = v5;
  v14 = v11;
  objc_copyWeak(&v17, (id *)buf);
  v15 = self;
  v12 = v9;
  v16 = v12;
  objc_msgSend(v10, "releaseTransientSubscriptionAssertionForPresenceIdentifier:completion:", v11, v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

void __66__SKPresence_releaseTransientSubscriptionAssertionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[SKPresence _logger](SKPresence, "_logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__SKStatusSubscription_releaseTransientSubscriptionAssertionWithCompletion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __66__SKPresence_releaseTransientSubscriptionAssertionWithCompletion___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *WeakRetained;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[SKPresence _logger](SKPresence, "_logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __76__SKStatusSubscription_releaseTransientSubscriptionAssertionWithCompletion___block_invoke_3_cold_1();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_213251000, v5, OS_LOG_TYPE_DEFAULT, "Successfully released transient subscription assertion for presence identifier %@", (uint8_t *)&v9, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v5 = WeakRetained;
    if (WeakRetained)
      -[NSObject setHasTransientSubscription:](WeakRetained, "setHasTransientSubscription:", 0);
  }

  if ((objc_msgSend(*(id *)(a1 + 40), "hasPresenceAssertion") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "releaseDaemonConnection");
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

- (NSArray)presentDevices
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  __int128 *v15;
  _QWORD v16[4];
  id v17;
  __int128 *p_buf;
  id v19;
  id location;
  __int128 buf;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[SKPresence _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKPresence presenceIdentifier](self, "presenceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKPresence _logger](SKPresence, "_logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_213251000, v4, OS_LOG_TYPE_DEFAULT, "Retrieving present decives. Presence: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  -[SKPresence daemonConnection](self, "daemonConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __28__SKPresence_presentDevices__block_invoke;
  v16[3] = &unk_24CF735F8;
  v7 = v3;
  v17 = v7;
  objc_copyWeak(&v19, &location);
  p_buf = &buf;
  objc_msgSend(v5, "synchronousRemoteDaemonWithErrorHandler:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __28__SKPresence_presentDevices__block_invoke_21;
  v13[3] = &unk_24CF73620;
  v9 = v7;
  v14 = v9;
  v15 = &buf;
  objc_msgSend(v8, "presentDevicesForPresenceIdentifier:completion:", v9, v13);
  v10 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  if (!v10)
    v10 = (void *)MEMORY[0x24BDBD1A8];
  v11 = v10;

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
  return (NSArray *)v11;
}

void __28__SKPresence_presentDevices__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;

  v3 = a2;
  +[SKPresence _logger](SKPresence, "_logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __28__SKPresence_presentDevices__block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v3);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

void __28__SKPresence_presentDevices__block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[SKPresence _oversizeLogger](SKPresence, "_oversizeLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v13 = 138543874;
      v14 = v9;
      v15 = 2112;
      v16 = v5;
      v17 = 2112;
      v18 = v6;
      _os_log_error_impl(&dword_213251000, v8, OS_LOG_TYPE_ERROR, "Retrieved present devices. Presence: %{public}@ Handles: %@ Error: %@", (uint8_t *)&v13, 0x20u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v13 = 138543618;
    v14 = v10;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_213251000, v8, OS_LOG_TYPE_DEFAULT, "Retrieved present devices. Presence: %{public}@ Handles: %@", (uint8_t *)&v13, 0x16u);
  }

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v5;

}

- (NSArray)invitedHandles
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  __int128 *v15;
  _QWORD v16[4];
  id v17;
  __int128 *p_buf;
  id v19;
  id location;
  __int128 buf;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[SKPresence _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKPresence presenceIdentifier](self, "presenceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKPresence _logger](SKPresence, "_logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_213251000, v4, OS_LOG_TYPE_DEFAULT, "Retrieving invited handles. Presence: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  -[SKPresence daemonConnection](self, "daemonConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __28__SKPresence_invitedHandles__block_invoke;
  v16[3] = &unk_24CF735F8;
  v7 = v3;
  v17 = v7;
  objc_copyWeak(&v19, &location);
  p_buf = &buf;
  objc_msgSend(v5, "synchronousRemoteDaemonWithErrorHandler:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __28__SKPresence_invitedHandles__block_invoke_23;
  v13[3] = &unk_24CF73620;
  v9 = v7;
  v14 = v9;
  v15 = &buf;
  objc_msgSend(v8, "invitedHandlesForPresenceIdentifier:completion:", v9, v13);
  v10 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  if (!v10)
    v10 = (void *)MEMORY[0x24BDBD1A8];
  v11 = v10;

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
  return (NSArray *)v11;
}

void __28__SKPresence_invitedHandles__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;

  v3 = a2;
  +[SKPresence _logger](SKPresence, "_logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __28__SKPresence_presentDevices__block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v3);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

void __28__SKPresence_invitedHandles__block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[SKPresence _logger](SKPresence, "_logger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v13 = 138543874;
      v14 = v9;
      v15 = 2112;
      v16 = v5;
      v17 = 2112;
      v18 = v6;
      _os_log_error_impl(&dword_213251000, v8, OS_LOG_TYPE_ERROR, "Retrieved invited handles. Presence: %{public}@ Handles: %@ Error: %@", (uint8_t *)&v13, 0x20u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v13 = 138543618;
    v14 = v10;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_213251000, v8, OS_LOG_TYPE_DEFAULT, "Retrieved invited handles. Presence: %{public}@ Handles: %@", (uint8_t *)&v13, 0x16u);
  }

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v5;

}

- (BOOL)isHandleInvitedFromPrimaryAccountHandle:(id)a3
{
  return -[SKPresence _isHandleInvited:fromSenderHandle:](self, "_isHandleInvited:fromSenderHandle:", a3, 0);
}

- (BOOL)_isHandleInvited:(id)a3 fromSenderHandle:(id)a4
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
  _QWORD v17[4];
  id v18;
  id v19;
  _BYTE *v20;
  _QWORD v21[4];
  id v22;
  _BYTE *v23;
  _BYTE buf[24];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SKPresence _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKPresence presenceIdentifier](self, "presenceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKPresence _logger](SKPresence, "_logger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2114;
    v25 = v8;
    _os_log_impl(&dword_213251000, v9, OS_LOG_TYPE_DEFAULT, "Checking if handle %@ has already been invited (sync) from handle: %@. Presence: %{public}@", buf, 0x20u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v25) = 0;
  -[SKPresence daemonConnection](self, "daemonConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __48__SKPresence__isHandleInvited_fromSenderHandle___block_invoke;
  v21[3] = &unk_24CF73648;
  v12 = v8;
  v22 = v12;
  v23 = buf;
  objc_msgSend(v10, "synchronousRemoteDaemonWithErrorHandler:", v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __48__SKPresence__isHandleInvited_fromSenderHandle___block_invoke_24;
  v17[3] = &unk_24CF73670;
  v14 = v12;
  v18 = v14;
  v15 = v6;
  v19 = v15;
  v20 = buf;
  objc_msgSend(v13, "isHandleInvited:fromSenderHandle:forPresenceIdentifier:completion:", v15, v7, v14, v17);
  LOBYTE(v12) = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return (char)v12;
}

void __48__SKPresence__isHandleInvited_fromSenderHandle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[SKPresence _logger](SKPresence, "_logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __48__SKPresence__isHandleInvited_fromSenderHandle___block_invoke_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

void __48__SKPresence__isHandleInvited_fromSenderHandle___block_invoke_24(_QWORD *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[SKPresence _logger](SKPresence, "_logger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = a1[4];
      v9 = a1[5];
      v12 = 138544130;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 1024;
      v17 = a2;
      v18 = 2112;
      v19 = v5;
      _os_log_error_impl(&dword_213251000, v7, OS_LOG_TYPE_ERROR, "Checked if handle is invited (sync). Presence: %{public}@ Handle: %@ isInvited:%d Error: %@", (uint8_t *)&v12, 0x26u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = a1[4];
    v11 = a1[5];
    v12 = 138543874;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    v16 = 1024;
    v17 = a2;
    _os_log_impl(&dword_213251000, v7, OS_LOG_TYPE_DEFAULT, "Determined if handle is invited (sync). Presence: %{public}@ Handle: %@ isInvited: %d", (uint8_t *)&v12, 0x1Cu);
  }

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
}

- (void)isHandleInvitedFromPrimaryAccountHandle:(id)a3 completion:(id)a4
{
  -[SKPresence _isHandleInvited:fromSenderHandle:completion:](self, "_isHandleInvited:fromSenderHandle:completion:", a3, 0, a4);
}

- (void)_isHandleInvited:(id)a3 fromSenderHandle:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SKPresence _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKPresence presenceIdentifier](self, "presenceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKPresence _logger](SKPresence, "_logger");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v31 = v8;
    v32 = 2112;
    v33 = v9;
    v34 = 2114;
    v35 = v11;
    _os_log_impl(&dword_213251000, v12, OS_LOG_TYPE_DEFAULT, "Checking if handle %@ has already been invited (async) from handle: %@. Presence: %{public}@", buf, 0x20u);
  }

  -[SKPresence daemonConnection](self, "daemonConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __59__SKPresence__isHandleInvited_fromSenderHandle_completion___block_invoke;
  v26[3] = &unk_24CF73698;
  v15 = v11;
  v27 = v15;
  v16 = v8;
  v28 = v16;
  v17 = v10;
  v29 = v17;
  objc_msgSend(v13, "asynchronousRemoteDaemonWithErrorHandler:", v26);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __59__SKPresence__isHandleInvited_fromSenderHandle_completion___block_invoke_26;
  v22[3] = &unk_24CF736C0;
  v23 = v15;
  v24 = v16;
  v25 = v17;
  v19 = v17;
  v20 = v16;
  v21 = v15;
  objc_msgSend(v18, "isHandleInvited:fromSenderHandle:forPresenceIdentifier:completion:", v20, v9, v21, v22);

}

void __59__SKPresence__isHandleInvited_fromSenderHandle_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[SKPresence _logger](SKPresence, "_logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59__SKPresence__isHandleInvited_fromSenderHandle_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __59__SKPresence__isHandleInvited_fromSenderHandle_completion___block_invoke_26(_QWORD *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[SKPresence _logger](SKPresence, "_logger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = a1[4];
      v9 = a1[5];
      v12 = 138544130;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 1024;
      v17 = a2;
      v18 = 2112;
      v19 = v5;
      _os_log_error_impl(&dword_213251000, v7, OS_LOG_TYPE_ERROR, "Error while checking if handle has already been invited (async). Presence: %{public}@ Handle: %@ isInvited:%d Error: %@", (uint8_t *)&v12, 0x26u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = a1[4];
    v11 = a1[5];
    v12 = 138543874;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    v16 = 1024;
    v17 = a2;
    _os_log_impl(&dword_213251000, v7, OS_LOG_TYPE_DEFAULT, "Checked if handle is invited (async). Presence: %{public}@ Handle: %@ isInvited: %d", (uint8_t *)&v12, 0x1Cu);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)fetchHandleInvitabilityFromPrimaryAccountHandle:(id)a3 completion:(id)a4
{
  -[SKPresence _fetchHandleInvitability:fromSenderHandle:completion:](self, "_fetchHandleInvitability:fromSenderHandle:completion:", a3, 0, a4);
}

- (void)_fetchHandleInvitability:(id)a3 fromSenderHandle:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
    -[SKPresence _fetchHandleInvitability:fromSenderHandle:completion:].cold.1();
  v11 = v10;
  -[SKPresence _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKPresence presenceIdentifier](self, "presenceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKPresence _logger](SKPresence, "_logger");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = v8;
    v33 = 2114;
    v34 = v12;
    _os_log_impl(&dword_213251000, v13, OS_LOG_TYPE_DEFAULT, "Fetching handle %@ invitability. Presence: %{public}@", buf, 0x16u);
  }

  -[SKPresence daemonConnection](self, "daemonConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __67__SKPresence__fetchHandleInvitability_fromSenderHandle_completion___block_invoke;
  v27[3] = &unk_24CF73698;
  v16 = v12;
  v28 = v16;
  v17 = v8;
  v29 = v17;
  v18 = v11;
  v30 = v18;
  objc_msgSend(v14, "asynchronousRemoteDaemonWithErrorHandler:", v27);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __67__SKPresence__fetchHandleInvitability_fromSenderHandle_completion___block_invoke_28;
  v23[3] = &unk_24CF736E8;
  v24 = v16;
  v25 = v17;
  v26 = v18;
  v20 = v18;
  v21 = v17;
  v22 = v16;
  objc_msgSend(v19, "fetchHandleInvitability:fromHandle:forPresenceIdentifier:completion:", v21, v9, v22, v23);

}

void __67__SKPresence__fetchHandleInvitability_fromSenderHandle_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[SKPresence _logger](SKPresence, "_logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __67__SKPresence__fetchHandleInvitability_fromSenderHandle_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __67__SKPresence__fetchHandleInvitability_fromSenderHandle_completion___block_invoke_28(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[SKPresence _logger](SKPresence, "_logger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = a1[4];
      v10 = a1[5];
      v13 = 138544130;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v5;
      v19 = 2112;
      v20 = v6;
      _os_log_error_impl(&dword_213251000, v8, OS_LOG_TYPE_ERROR, "Error fetching handle invitability. Presence: %{public}@ Handle: %@ invitability:%@ Error: %@", (uint8_t *)&v13, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = a1[4];
    v12 = a1[5];
    v13 = 138543874;
    v14 = v11;
    v15 = 2112;
    v16 = v12;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_213251000, v8, OS_LOG_TYPE_DEFAULT, "Checked if handle is invitable. Presence: %{public}@ Handle: %@ invitability: %@", (uint8_t *)&v13, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)inviteHandleFromPrimaryAccountHandle:(id)a3 completion:(id)a4
{
  -[SKPresence _inviteHandle:fromSenderHandle:completion:](self, "_inviteHandle:fromSenderHandle:completion:", a3, 0, a4);
}

- (void)_inviteHandle:(id)a3 fromSenderHandle:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v8 = (void *)MEMORY[0x24BDBCE30];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKPresence inviteHandles:fromSenderHandle:completion:](self, "inviteHandles:fromSenderHandle:completion:", v12, v10, v9, v13, v14);
}

- (void)inviteHandlesFromPrimaryAccountHandle:(id)a3 completion:(id)a4
{
  -[SKPresence _inviteHandles:fromSenderHandle:completion:](self, "_inviteHandles:fromSenderHandle:completion:", a3, 0, a4);
}

- (void)_inviteHandles:(id)a3 fromSenderHandle:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
    -[SKPresence _inviteHandles:fromSenderHandle:completion:].cold.1();
  v11 = v10;
  -[SKPresence _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKPresence presenceIdentifier](self, "presenceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKPresence _logger](SKPresence, "_logger");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v30 = v8;
    v31 = 2114;
    v32 = v12;
    v33 = 2112;
    v34 = v9;
    _os_log_impl(&dword_213251000, v13, OS_LOG_TYPE_DEFAULT, "Received request to invite handles: %@ to presenceIdentifier: %{public}@ from sender handle: %@", buf, 0x20u);
  }

  -[SKPresence daemonConnection](self, "daemonConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v15 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __57__SKPresence__inviteHandles_fromSenderHandle_completion___block_invoke;
  v24[3] = &unk_24CF73558;
  v16 = v12;
  v25 = v16;
  v17 = v8;
  v26 = v17;
  objc_copyWeak(&v28, (id *)buf);
  v18 = v11;
  v27 = v18;
  objc_msgSend(v14, "asynchronousRemoteDaemonWithErrorHandler:", v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __57__SKPresence__inviteHandles_fromSenderHandle_completion___block_invoke_31;
  v21[3] = &unk_24CF73710;
  objc_copyWeak(&v23, (id *)buf);
  v20 = v18;
  v22 = v20;
  objc_msgSend(v19, "inviteHandles:fromSenderHandle:presenceIdentifier:completion:", v17, v9, v16, v21);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v28);

  objc_destroyWeak((id *)buf);
}

void __57__SKPresence__inviteHandles_fromSenderHandle_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  +[SKPresence _logger](SKPresence, "_logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __57__SKPresence__inviteHandles_fromSenderHandle_completion___block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __57__SKPresence__inviteHandles_fromSenderHandle_completion___block_invoke_31(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *WeakRetained;
  uint8_t v6[16];

  v3 = a2;
  +[SKPresence _logger](SKPresence, "_logger");
  v4 = objc_claimAutoreleasedReturnValue();
  WeakRetained = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __94__SKStatusPublishingService__inviteHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_16_cold_1();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[NSObject _simulateCrashIfNecessaryForError:](WeakRetained, "_simulateCrashIfNecessaryForError:", v3);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_213251000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Inviting handles completed.", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeInvitedHandle:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKPresence removeInvitedHandles:completion:](self, "removeInvitedHandles:completion:", v9, v7, v10, v11);
}

- (void)removeInvitedHandles:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
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
  -[SKPresence _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKPresence presenceIdentifier](self, "presenceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKPresence _logger](SKPresence, "_logger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v26 = v8;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_213251000, v9, OS_LOG_TYPE_DEFAULT, "Removing invited handles. Presence: %{public}@ Handles: %@", buf, 0x16u);
  }

  -[SKPresence daemonConnection](self, "daemonConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v11 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __46__SKPresence_removeInvitedHandles_completion___block_invoke;
  v20[3] = &unk_24CF73558;
  v12 = v8;
  v21 = v12;
  v13 = v6;
  v22 = v13;
  objc_copyWeak(&v24, (id *)buf);
  v14 = v7;
  v23 = v14;
  objc_msgSend(v10, "asynchronousRemoteDaemonWithErrorHandler:", v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __46__SKPresence_removeInvitedHandles_completion___block_invoke_32;
  v17[3] = &unk_24CF73710;
  objc_copyWeak(&v19, (id *)buf);
  v16 = v14;
  v18 = v16;
  objc_msgSend(v15, "removeInvitedHandles:presenceIdentifier:completion:", v13, v12, v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v24);

  objc_destroyWeak((id *)buf);
}

void __46__SKPresence_removeInvitedHandles_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  +[SKPresence _logger](SKPresence, "_logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__SKPresence_removeInvitedHandles_completion___block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __46__SKPresence_removeInvitedHandles_completion___block_invoke_32(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *WeakRetained;
  uint8_t v6[16];

  v3 = a2;
  +[SKPresence _logger](SKPresence, "_logger");
  v4 = objc_claimAutoreleasedReturnValue();
  WeakRetained = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __61__SKStatusPublishingService_removeInvitedHandles_completion___block_invoke_17_cold_1();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[NSObject _simulateCrashIfNecessaryForError:](WeakRetained, "_simulateCrashIfNecessaryForError:", v3);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_213251000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Remove invited handles completed.", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchPresenceCapability:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

  v4 = a3;
  if (!v4)
    -[SKPresence fetchPresenceCapability:].cold.1();
  v5 = v4;
  -[SKPresence _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  +[SKPresence _logger](SKPresence, "_logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213251000, v6, OS_LOG_TYPE_DEFAULT, "Fetching presence capability.", buf, 2u);
  }

  -[SKPresence daemonConnection](self, "daemonConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __38__SKPresence_fetchPresenceCapability___block_invoke;
  v14[3] = &unk_24CF73500;
  v9 = v5;
  v15 = v9;
  objc_msgSend(v7, "asynchronousRemoteDaemonWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __38__SKPresence_fetchPresenceCapability___block_invoke_33;
  v12[3] = &unk_24CF73930;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "fetchPresenceCapability:", v12);

}

void __38__SKPresence_fetchPresenceCapability___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[SKPresence _logger](SKPresence, "_logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __38__SKPresence_fetchPresenceCapability___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __38__SKPresence_fetchPresenceCapability___block_invoke_33(uint64_t a1, int a2)
{
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  +[SKPresence _logger](SKPresence, "_logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_213251000, v4, OS_LOG_TYPE_DEFAULT, "Checked if account is presence capable: %d", (uint8_t *)v6, 8u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  SKDelegateResponseQueue *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  +[SKPresence _logger](SKPresence, "_logger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213251000, v8, OS_LOG_TYPE_DEFAULT, "_delegateLock addDelegate waiting", buf, 2u);
  }

  os_unfair_lock_lock(&self->_delegateLock);
  +[SKPresence _logger](SKPresence, "_logger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_213251000, v9, OS_LOG_TYPE_DEFAULT, "_delegateLock addDelegate Locked", v13, 2u);
  }

  v10 = -[SKDelegateResponseQueue initWithQueue:]([SKDelegateResponseQueue alloc], "initWithQueue:", v6);
  -[NSMapTable setObject:forKey:](self->_delegates, "setObject:forKey:", v10, v7);

  +[SKPresence _logger](SKPresence, "_logger");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_213251000, v11, OS_LOG_TYPE_DEFAULT, "_delegateLock addDelegate unlock", v12, 2u);
  }

  os_unfair_lock_unlock(&self->_delegateLock);
  -[SKPresence _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");

}

- (void)removeDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t v9[16];
  uint8_t buf[16];

  v4 = a3;
  +[SKPresence _logger](SKPresence, "_logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213251000, v5, OS_LOG_TYPE_DEFAULT, "_delegateLock removeDelegate waiting", buf, 2u);
  }

  os_unfair_lock_lock(&self->_delegateLock);
  +[SKPresence _logger](SKPresence, "_logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_213251000, v6, OS_LOG_TYPE_DEFAULT, "_delegateLock removeDelegate locked", v9, 2u);
  }

  -[NSMapTable removeObjectForKey:](self->_delegates, "removeObjectForKey:", v4);
  +[SKPresence _logger](SKPresence, "_logger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_213251000, v7, OS_LOG_TYPE_DEFAULT, "_delegateLock removeDelegate unlocked", v8, 2u);
  }

  os_unfair_lock_unlock(&self->_delegateLock);
}

- (void)_registerForDelegateCallbacksIfNecessary
{
  NSObject *v3;
  os_unfair_lock_s *p_delegateLock;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  +[SKPresence _logger](SKPresence, "_logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213251000, v3, OS_LOG_TYPE_DEFAULT, "_delegateLock _registerForDelegateCallbacksIfNecessary waiting", buf, 2u);
  }

  p_delegateLock = &self->_delegateLock;
  os_unfair_lock_lock(&self->_delegateLock);
  +[SKPresence _logger](SKPresence, "_logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213251000, v5, OS_LOG_TYPE_DEFAULT, "_delegateLock _registerForDelegateCallbacksIfNecessary locked", buf, 2u);
  }

  if (self->_registeredForDelegateCallbacks)
  {
    +[SKPresence _logger](SKPresence, "_logger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213251000, v6, OS_LOG_TYPE_DEFAULT, "_delegateLock _registerForDelegateCallbacksIfNecessary unlocked already registered", buf, 2u);
    }
LABEL_8:

    os_unfair_lock_unlock(p_delegateLock);
    return;
  }
  if (!-[NSMapTable count](self->_delegates, "count"))
  {
    +[SKPresence _logger](SKPresence, "_logger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213251000, v6, OS_LOG_TYPE_DEFAULT, "_delegateLock _registerForDelegateCallbacksIfNecessary unlocked already delegate count 0", buf, 2u);
    }
    goto LABEL_8;
  }
  self->_registeredForDelegateCallbacks = 1;
  +[SKPresence _logger](SKPresence, "_logger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213251000, v7, OS_LOG_TYPE_DEFAULT, "_delegateLock _registerForDelegateCallbacksIfNecessary unlocked registering", buf, 2u);
  }

  os_unfair_lock_unlock(&self->_delegateLock);
  -[SKPresence presenceIdentifier](self, "presenceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKPresence _logger](SKPresence, "_logger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v8;
    _os_log_impl(&dword_213251000, v9, OS_LOG_TYPE_DEFAULT, "Registering for delegate callbacks for presenceIdentifier: %{public}@", buf, 0xCu);
  }

  -[SKPresence daemonConnection](self, "daemonConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __54__SKPresence__registerForDelegateCallbacksIfNecessary__block_invoke;
  v18[3] = &unk_24CF73738;
  objc_copyWeak(&v19, (id *)buf);
  objc_msgSend(v10, "asynchronousRemoteDaemonWithErrorHandler:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKPresence options](self, "options");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __54__SKPresence__registerForDelegateCallbacksIfNecessary__block_invoke_36;
  v15[3] = &unk_24CF73760;
  objc_copyWeak(&v17, (id *)buf);
  v14 = v8;
  v16 = v14;
  objc_msgSend(v12, "registerForDelegateCallbacksWithPresenceIdentifier:options:completion:", v14, v13, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

}

void __54__SKPresence__registerForDelegateCallbacksIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  +[SKPresence _logger](SKPresence, "_logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__SKStatusPublishingService__registerForDelegateCallbacksIfNecessary__block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v3);

}

void __54__SKPresence__registerForDelegateCallbacksIfNecessary__block_invoke_36(uint64_t a1, void *a2)
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
  +[SKPresence _logger](SKPresence, "_logger");
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
    _os_log_impl(&dword_213251000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Completed registration for delegate callbacks for presence identifier: %@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)_delegatesPerformOnResponseQueueForGroup:(id)a3 block:(id)a4
{
  NSObject *v6;
  id v7;
  os_unfair_lock_s *p_delegateLock;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id obj;
  _QWORD block[5];
  NSObject *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[16];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  p_delegateLock = &self->_delegateLock;
  os_unfair_lock_lock(&self->_delegateLock);
  v9 = (void *)-[NSMapTable copy](self->_delegates, "copy");
  os_unfair_lock_unlock(p_delegateLock);
  if (!objc_msgSend(v9, "count"))
  {
    +[SKPresence _logger](SKPresence, "_logger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213251000, v10, OS_LOG_TYPE_DEFAULT, "No delegates available to perform presence delegate callback", buf, 2u);
    }

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v9, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "dispatchQueue");
        v17 = objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v6);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __61__SKPresence__delegatesPerformOnResponseQueueForGroup_block___block_invoke;
        block[3] = &unk_24CF73788;
        v21 = v7;
        block[4] = v15;
        v20 = v6;
        dispatch_async(v17, block);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v12);
  }

}

void __61__SKPresence__delegatesPerformOnResponseQueueForGroup_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)presentHandlesChangedForPresenceIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  char v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *privateWorkQueue;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[SKPresence _logger](SKPresence, "_logger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_impl(&dword_213251000, v8, OS_LOG_TYPE_DEFAULT, "Present devices changed on presence: %@", buf, 0xCu);
  }

  v9 = dispatch_group_create();
  -[SKPresence presenceIdentifier](self, "presenceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", v6);

  v12 = MEMORY[0x24BDAC760];
  if ((v11 & 1) != 0)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __68__SKPresence_presentHandlesChangedForPresenceIdentifier_completion___block_invoke;
    v18[3] = &unk_24CF73958;
    v18[4] = self;
    -[SKPresence _delegatesPerformOnResponseQueueForGroup:block:](self, "_delegatesPerformOnResponseQueueForGroup:block:", v9, v18);
  }
  else
  {
    +[SKPresence _logger](SKPresence, "_logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      _os_log_impl(&dword_213251000, v13, OS_LOG_TYPE_DEFAULT, "Delegate received message for other identifier: %@", buf, 0xCu);
    }

  }
  privateWorkQueue = self->_privateWorkQueue;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __68__SKPresence_presentHandlesChangedForPresenceIdentifier_completion___block_invoke_41;
  v16[3] = &unk_24CF73980;
  v17 = v7;
  v15 = v7;
  dispatch_group_notify(v9, privateWorkQueue, v16);

}

void __68__SKPresence_presentHandlesChangedForPresenceIdentifier_completion___block_invoke(uint64_t a1, void *a2)
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
  +[SKPresence _logger](SKPresence, "_logger");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_213251000, v6, OS_LOG_TYPE_DEFAULT, "Informing delegate of present devices update. Delegate: %@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(v3, "presentDevicesChangedForPresence:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __68__SKPresence_presentHandlesChangedForPresenceIdentifier_completion___block_invoke_cold_1();

  }
}

uint64_t __68__SKPresence_presentHandlesChangedForPresenceIdentifier_completion___block_invoke_41(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invitedHandlesChangedForPresenceIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  char v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *privateWorkQueue;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[SKPresence _logger](SKPresence, "_logger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_impl(&dword_213251000, v8, OS_LOG_TYPE_DEFAULT, "Invited handles changed for presence identifier: %@", buf, 0xCu);
  }

  v9 = dispatch_group_create();
  -[SKPresence presenceIdentifier](self, "presenceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", v6);

  v12 = MEMORY[0x24BDAC760];
  if ((v11 & 1) != 0)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __68__SKPresence_invitedHandlesChangedForPresenceIdentifier_completion___block_invoke;
    v18[3] = &unk_24CF73958;
    v18[4] = self;
    -[SKPresence _delegatesPerformOnResponseQueueForGroup:block:](self, "_delegatesPerformOnResponseQueueForGroup:block:", v9, v18);
  }
  else
  {
    +[SKPresence _logger](SKPresence, "_logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      _os_log_impl(&dword_213251000, v13, OS_LOG_TYPE_DEFAULT, "Delegate received message for other identifier: %@", buf, 0xCu);
    }

  }
  privateWorkQueue = self->_privateWorkQueue;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __68__SKPresence_invitedHandlesChangedForPresenceIdentifier_completion___block_invoke_44;
  v16[3] = &unk_24CF73980;
  v17 = v7;
  v15 = v7;
  dispatch_group_notify(v9, privateWorkQueue, v16);

}

void __68__SKPresence_invitedHandlesChangedForPresenceIdentifier_completion___block_invoke(uint64_t a1, void *a2)
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
  +[SKPresence _logger](SKPresence, "_logger");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_213251000, v6, OS_LOG_TYPE_DEFAULT, "Informing delegate of invited handle update. Delegate: %@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(v3, "invitedHandlesChangedForPresence:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __68__SKPresence_presentHandlesChangedForPresenceIdentifier_completion___block_invoke_cold_1();

  }
}

uint64_t __68__SKPresence_invitedHandlesChangedForPresenceIdentifier_completion___block_invoke_44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)presenceDaemonConnectionDidDisconnect:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_group_t v8;
  _QWORD v9[5];
  id v10;
  id buf[2];

  v4 = a3;
  +[SKPresence _logger](SKPresence, "_logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_213251000, v5, OS_LOG_TYPE_DEFAULT, "_delegateLock presenceDaemonConnectionDidDisconnect waiting", (uint8_t *)buf, 2u);
  }

  os_unfair_lock_lock(&self->_delegateLock);
  +[SKPresence _logger](SKPresence, "_logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_213251000, v6, OS_LOG_TYPE_DEFAULT, "_delegateLock presenceDaemonConnectionDidDisconnect locked", (uint8_t *)buf, 2u);
  }

  self->_registeredForDelegateCallbacks = 0;
  +[SKPresence _logger](SKPresence, "_logger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_213251000, v7, OS_LOG_TYPE_DEFAULT, "_delegateLock presenceDaemonConnectionDidDisconnect unlocked", (uint8_t *)buf, 2u);
  }

  os_unfair_lock_unlock(&self->_delegateLock);
  v8 = dispatch_group_create();
  objc_initWeak(buf, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__SKPresence_presenceDaemonConnectionDidDisconnect___block_invoke;
  v9[3] = &unk_24CF739A8;
  v9[4] = self;
  objc_copyWeak(&v10, buf);
  -[SKPresence _delegatesPerformOnResponseQueueForGroup:block:](self, "_delegatesPerformOnResponseQueueForGroup:block:", v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);

}

void __52__SKPresence_presenceDaemonConnectionDidDisconnect___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  NSObject *v5;
  _BOOL4 v6;
  id WeakRetained;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = a2;
  v4 = objc_opt_respondsToSelector();
  +[SKPresence _logger](SKPresence, "_logger");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) != 0)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213251000, v5, OS_LOG_TYPE_DEFAULT, "Notifying presence delegate that the XPC connection has disconnected", buf, 2u);
    }

    objc_msgSend(v3, "presenceDaemonDisconnected:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_213251000, v5, OS_LOG_TYPE_DEFAULT, "Presence delegate does not implement the delegate method to be notified the XPC connection has disconnected", v9, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v8 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "releaseDaemonConnection");
      objc_msgSend(v8, "_attemptReconnectingToDaemon");
    }

  }
}

- (void)initialCloudKitImportReceivedWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *privateWorkQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];

  v4 = a3;
  v5 = dispatch_group_create();
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__SKPresence_initialCloudKitImportReceivedWithCompletion___block_invoke;
  v11[3] = &unk_24CF73958;
  v11[4] = self;
  -[SKPresence _delegatesPerformOnResponseQueueForGroup:block:](self, "_delegatesPerformOnResponseQueueForGroup:block:", v5, v11);
  privateWorkQueue = self->_privateWorkQueue;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __58__SKPresence_initialCloudKitImportReceivedWithCompletion___block_invoke_49;
  v9[3] = &unk_24CF73980;
  v10 = v4;
  v8 = v4;
  dispatch_group_notify(v5, privateWorkQueue, v9);

}

void __58__SKPresence_initialCloudKitImportReceivedWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v3 = a2;
  v4 = objc_opt_respondsToSelector();
  +[SKPresence _logger](SKPresence, "_logger");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) != 0)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213251000, v5, OS_LOG_TYPE_DEFAULT, "Notifying presence delegate that the initial cloud kit import was received.", buf, 2u);
    }

    objc_msgSend(v3, "initialCloudKitImportReceived:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_213251000, v5, OS_LOG_TYPE_DEFAULT, "Presence delegate does not implement the delegate method to be notified the initial cloud kit import was received.", v7, 2u);
    }

  }
}

uint64_t __58__SKPresence_initialCloudKitImportReceivedWithCompletion___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_attemptReconnectingToDaemon
{
  NSObject *v3;
  SKPresenceDaemonConnection *daemonConnection;
  _QWORD v5[4];
  id v6;
  id buf[2];

  +[SKPresence _logger](SKPresence, "_logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_213251000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to reconnect with the daemon", (uint8_t *)buf, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  daemonConnection = self->_daemonConnection;
  os_unfair_lock_unlock(&self->_lock);
  if (!daemonConnection)
  {
    objc_initWeak(buf, self);
    if (-[SKPresence hasPresenceAssertion](self, "hasPresenceAssertion")
      && -[SKPresence hasTransientSubscription](self, "hasTransientSubscription"))
    {
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = __42__SKPresence__attemptReconnectingToDaemon__block_invoke;
      v5[3] = &unk_24CF737D8;
      objc_copyWeak(&v6, buf);
      -[SKPresence _reassertPresenceWithCompletion:](self, "_reassertPresenceWithCompletion:", v5);
      objc_destroyWeak(&v6);
    }
    else if (-[SKPresence hasPresenceAssertion](self, "hasPresenceAssertion"))
    {
      -[SKPresence _reassertPresenceWithCompletion:](self, "_reassertPresenceWithCompletion:", &__block_literal_global_50);
    }
    else if (-[SKPresence hasTransientSubscription](self, "hasTransientSubscription"))
    {
      -[SKPresence _reRetainTransientSubscriptionWithCompletion:](self, "_reRetainTransientSubscriptionWithCompletion:", &__block_literal_global_51);
    }
    objc_destroyWeak(buf);
  }
}

void __42__SKPresence__attemptReconnectingToDaemon__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_reRetainTransientSubscriptionWithCompletion:", &__block_literal_global_8);
    WeakRetained = v2;
  }

}

- (void)_reassertPresenceWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SKPresence payload](self, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__SKPresence__reassertPresenceWithCompletion___block_invoke;
  v7[3] = &unk_24CF739F0;
  v6 = v4;
  v8 = v6;
  objc_copyWeak(&v9, &location);
  -[SKPresence assertPresenceWithPresencePayload:completion:](self, "assertPresenceWithPresencePayload:completion:", v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __46__SKPresence__reassertPresenceWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v2;
  _QWORD *WeakRetained;
  _QWORD *v4;
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  if (a2)
  {
    v2 = (id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "releaseDaemonConnection");
      v5 = dispatch_walltime(0, 10000000000);
      v6 = v4[8];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __46__SKPresence__reassertPresenceWithCompletion___block_invoke_2;
      block[3] = &unk_24CF737D8;
      objc_copyWeak(&v8, v2);
      dispatch_after(v5, v6, block);
      objc_destroyWeak(&v8);
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __46__SKPresence__reassertPresenceWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_attemptReconnectingToDaemon");
    WeakRetained = v2;
  }

}

- (void)_reRetainTransientSubscriptionWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__SKPresence__reRetainTransientSubscriptionWithCompletion___block_invoke;
  v6[3] = &unk_24CF739F0;
  v5 = v4;
  v7 = v5;
  objc_copyWeak(&v8, &location);
  -[SKPresence retainTransientSubscriptionAssertionWithCompletion:](self, "retainTransientSubscriptionAssertionWithCompletion:", v6);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __59__SKPresence__reRetainTransientSubscriptionWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v2;
  _QWORD *WeakRetained;
  _QWORD *v4;
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  if (a2)
  {
    v2 = (id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "releaseDaemonConnection");
      v5 = dispatch_walltime(0, 10000000000);
      v6 = v4[8];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __59__SKPresence__reRetainTransientSubscriptionWithCompletion___block_invoke_2;
      block[3] = &unk_24CF737D8;
      objc_copyWeak(&v8, v2);
      dispatch_after(v5, v6, block);
      objc_destroyWeak(&v8);
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __59__SKPresence__reRetainTransientSubscriptionWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_attemptReconnectingToDaemon");
    WeakRetained = v2;
  }

}

+ (id)_logger
{
  if (_logger_onceToken != -1)
    dispatch_once(&_logger_onceToken, &__block_literal_global_52);
  return (id)_logger__logger;
}

void __21__SKPresence__logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKPresence");
  v1 = (void *)_logger__logger;
  _logger__logger = (uint64_t)v0;

}

+ (id)_oversizeLogger
{
  if (_oversizeLogger_onceToken != -1)
    dispatch_once(&_oversizeLogger_onceToken, &__block_literal_global_55);
  return (id)_oversizeLogger__logger;
}

void __29__SKPresence__oversizeLogger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "StatusKit-oversized");
  v1 = (void *)_oversizeLogger__logger;
  _oversizeLogger__logger = (uint64_t)v0;

}

- (SKPresenceDaemonConnection)daemonConnection
{
  os_unfair_lock_s *p_lock;
  SKPresenceDaemonConnection *daemonConnection;
  SKPresenceDaemonConnection *v5;
  SKPresenceDaemonConnection *v6;
  SKPresenceDaemonConnection *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  daemonConnection = self->_daemonConnection;
  if (!daemonConnection)
  {
    v5 = -[SKPresenceDaemonConnection initWithPresenceDaemonDelegate:connectionDelegate:]([SKPresenceDaemonConnection alloc], "initWithPresenceDaemonDelegate:connectionDelegate:", self, self);
    v6 = self->_daemonConnection;
    self->_daemonConnection = v5;

    daemonConnection = self->_daemonConnection;
  }
  v7 = daemonConnection;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)releaseDaemonConnection
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  SKPresenceDaemonConnection *daemonConnection;
  uint8_t v7[16];
  uint8_t v8[16];
  uint8_t buf[16];

  +[SKPresence _logger](SKPresence, "_logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213251000, v3, OS_LOG_TYPE_DEFAULT, "_delegateLock releaseDaemonConnection waiting", buf, 2u);
  }

  os_unfair_lock_lock(&self->_delegateLock);
  +[SKPresence _logger](SKPresence, "_logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_213251000, v4, OS_LOG_TYPE_DEFAULT, "_delegateLock releaseDaemonConnection locked", v8, 2u);
  }

  self->_registeredForDelegateCallbacks = 0;
  +[SKPresence _logger](SKPresence, "_logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_213251000, v5, OS_LOG_TYPE_DEFAULT, "_delegateLock releaseDaemonConnection unlocked", v7, 2u);
  }

  os_unfair_lock_unlock(&self->_delegateLock);
  os_unfair_lock_lock(&self->_lock);
  -[SKPresenceDaemonConnection invalidate](self->_daemonConnection, "invalidate");
  daemonConnection = self->_daemonConnection;
  self->_daemonConnection = 0;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setHasAssertion:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_hasPresenceAssertion = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasAssertion
{
  SKPresence *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_hasPresenceAssertion;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHasTransientSubscription:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_hasTransientSubscription = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasTransientSubscription
{
  SKPresence *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_hasTransientSubscription;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setPayload:(id)a3
{
  SKPresencePayload *v4;
  SKPresencePayload *payload;

  v4 = (SKPresencePayload *)a3;
  os_unfair_lock_lock(&self->_lock);
  payload = self->_payload;
  self->_payload = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (SKPresencePayload)payload
{
  os_unfair_lock_s *p_lock;
  SKPresencePayload *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_payload;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDaemonConnection:(id)a3
{
  objc_storeStrong((id *)&self->_daemonConnection, a3);
}

- (BOOL)hasPresenceAssertion
{
  return self->_hasPresenceAssertion;
}

- (void)setHasPresenceAssertion:(BOOL)a3
{
  self->_hasPresenceAssertion = a3;
}

- (NSString)presenceIdentifier
{
  return self->_presenceIdentifier;
}

- (SKPresenceOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
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

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (os_unfair_lock_s)delegateLock
{
  return self->_delegateLock;
}

- (void)setDelegateLock:(os_unfair_lock_s)a3
{
  self->_delegateLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateWorkQueue, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_presenceIdentifier, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

- (void)initWithPresenceIdentifier:options:.cold.1()
{
  __assert_rtn("-[SKPresence initWithPresenceIdentifier:options:]", "SKPresence.m", 52, "presenceIdentifier");
}

void __61__SKPresence_hasInitialCloudKitImportOccurredWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "XPC Error checking initial cloud kit import. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __61__SKPresence_hasInitialCloudKitImportOccurredWithCompletion___block_invoke_15_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "XPC Error checking if the cloudkit import has occurred. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __59__SKPresence_assertPresenceWithPresencePayload_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "XPC Error retaining presence assertion. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __59__SKPresence_assertPresenceWithPresencePayload_completion___block_invoke_17_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "Error asserting presence. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __44__SKPresence_releasePresenceWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "XPC Error releasing presence assertion. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __44__SKPresence_releasePresenceWithCompletion___block_invoke_18_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "Error releasing presence. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __28__SKPresence_presentDevices__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_213251000, v0, v1, "XPC Error retrieving invited handles. Presence: %{public}@ Error: %{public}@");
  OUTLINED_FUNCTION_5();
}

void __48__SKPresence__isHandleInvited_fromSenderHandle___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_213251000, v0, v1, "XPC Error checking if handle is invited (sync). Presence: %{public}@ Error: %{public}@");
  OUTLINED_FUNCTION_5();
}

void __59__SKPresence__isHandleInvited_fromSenderHandle_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_213251000, v0, v1, "XPC Error checking if handle is invited (async). Presence: %{public}@ handle:%@ Error: %{public}@");
  OUTLINED_FUNCTION_6();
}

- (void)_fetchHandleInvitability:fromSenderHandle:completion:.cold.1()
{
  __assert_rtn("-[SKPresence _fetchHandleInvitability:fromSenderHandle:completion:]", "SKPresence.m", 326, "completionHandler");
}

void __67__SKPresence__fetchHandleInvitability_fromSenderHandle_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_213251000, v0, v1, "XPC Error checking invitability. Presence: %{public}@ handle:%@ Error: %{public}@");
  OUTLINED_FUNCTION_6();
}

- (void)_inviteHandles:fromSenderHandle:completion:.cold.1()
{
  __assert_rtn("-[SKPresence _inviteHandles:fromSenderHandle:completion:]", "SKPresence.m", 367, "completionHandler");
}

void __57__SKPresence__inviteHandles_fromSenderHandle_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_213251000, v0, v1, "XPC Error inviting handles. Presence: %{public}@ handles:%@ Error: %{public}@");
  OUTLINED_FUNCTION_6();
}

void __46__SKPresence_removeInvitedHandles_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_213251000, v0, v1, "XPC Error removing invited handles. Presence: %{public}@ handles:%@ Error: %{public}@");
  OUTLINED_FUNCTION_6();
}

- (void)fetchPresenceCapability:.cold.1()
{
  __assert_rtn("-[SKPresence fetchPresenceCapability:]", "SKPresence.m", 417, "completionHandler");
}

void __38__SKPresence_fetchPresenceCapability___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "XPC Error checking presence capability.  Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __68__SKPresence_presentHandlesChangedForPresenceIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "Delegate does not implement presentHandlesChangedForPresence:, not informing delegate: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
