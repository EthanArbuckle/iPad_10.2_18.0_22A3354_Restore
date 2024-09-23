@implementation VSIdentityProviderSubscriptionOperation

- (VSIdentityProviderSubscriptionOperation)init
{
  VSIdentityProviderSubscriptionOperation *v2;
  NSOperationQueue *v3;
  NSOperationQueue *privateQueue;
  uint64_t v5;
  VSSubscriptionRegistrationCenter *registrationCenter;
  VSDeveloperSettingsFetchOperation *v7;
  VSDeveloperSettingsFetchOperation *developerSettingsFetchOperation;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VSIdentityProviderSubscriptionOperation;
  v2 = -[VSIdentityProviderSubscriptionOperation init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = v3;

    -[NSOperationQueue setName:](v2->_privateQueue, "setName:", CFSTR("VSBulkSubscriptionOperation"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_privateQueue, "setMaxConcurrentOperationCount:", 1);
    objc_msgSend(MEMORY[0x24BDF8C98], "defaultSubscriptionRegistrationCenter");
    v5 = objc_claimAutoreleasedReturnValue();
    registrationCenter = v2->_registrationCenter;
    v2->_registrationCenter = (VSSubscriptionRegistrationCenter *)v5;

    v7 = (VSDeveloperSettingsFetchOperation *)objc_alloc_init(MEMORY[0x24BDF8BD0]);
    developerSettingsFetchOperation = v2->_developerSettingsFetchOperation;
    v2->_developerSettingsFetchOperation = v7;

  }
  return v2;
}

- (VSIdentityProviderSubscriptionOperation)initWithRegistrationCenter:(id)a3 andDeveloperSettingsFetchOperation:(id)a4
{
  id v7;
  id v8;
  VSIdentityProviderSubscriptionOperation *v9;
  VSIdentityProviderSubscriptionOperation *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[VSIdentityProviderSubscriptionOperation init](self, "init");
  v10 = v9;
  if (v9)
  {
    if (v7)
      objc_storeStrong((id *)&v9->_registrationCenter, a3);
    if (v8)
      objc_storeStrong((id *)&v10->_developerSettingsFetchOperation, a4);
  }

  return v10;
}

- (void)executionDidBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[7];
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  VSIdentityProviderSubscriptionOperation *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  id v29;
  char v30;
  id location;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[3];
  char v39;

  -[VSIdentityProviderSubscriptionOperation privateQueue](self, "privateQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderSubscriptionOperation identityProvider](self, "identityProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderSubscriptionOperation subscriptionsToAdd](self, "subscriptionsToAdd");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderSubscriptionOperation subscriptionsToRemoveByBundleID](self, "subscriptionsToRemoveByBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isDeveloper");
  objc_msgSend(v4, "nonChannelAppDescriptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
    v9 = 1;
  else
    v9 = v7;

  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy_;
  v36[4] = __Block_byref_object_dispose_;
  v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy_;
  v34[4] = __Block_byref_object_dispose_;
  v35 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy_;
  v32[4] = __Block_byref_object_dispose_;
  objc_msgSend(v4, "nonChannelAppDescriptions");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = (void *)MEMORY[0x24BDBD1A8];
  if (v10)
    v12 = (void *)v10;
  v33 = v12;

  if (v9 && (objc_msgSend(v5, "count") || objc_msgSend(v6, "count")))
  {
    objc_initWeak(&location, self);
    v13 = (void *)MEMORY[0x24BDD1478];
    v14 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __60__VSIdentityProviderSubscriptionOperation_executionDidBegin__block_invoke;
    v21[3] = &unk_24FE198F0;
    objc_copyWeak(&v29, &location);
    v30 = v7;
    v25 = v38;
    v26 = v36;
    v27 = v34;
    v28 = v32;
    v22 = v6;
    v23 = v5;
    v24 = self;
    objc_msgSend(v13, "blockOperationWithBlock:", v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderSubscriptionOperation developerSettingsFetchOperation](self, "developerSettingsFetchOperation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3042000000;
    v19[3] = __Block_byref_object_copy__11;
    v19[4] = __Block_byref_object_dispose__12;
    objc_initWeak(&v20, v16);
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __60__VSIdentityProviderSubscriptionOperation_executionDidBegin__block_invoke_13;
    v18[3] = &unk_24FE19980;
    v18[4] = v19;
    v18[5] = v38;
    v18[6] = v36;
    objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addDependency:", v16);
    objc_msgSend(v15, "addDependency:", v17);
    objc_msgSend(v3, "addOperation:", v16);
    objc_msgSend(v3, "addOperation:", v17);
    objc_msgSend(v3, "addOperation:", v15);
    objc_msgSend(v15, "waitUntilFinished");

    _Block_object_dispose(v19, 8);
    objc_destroyWeak(&v20);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  else
  {
    -[VSAsyncOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
  }
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);

  _Block_object_dispose(v38, 8);
}

void __60__VSIdentityProviderSubscriptionOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12[16];
  uint8_t buf[16];
  uint8_t v14[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (!WeakRetained)
    goto LABEL_23;
  if (*(_BYTE *)(a1 + 96))
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
      || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      VSDefaultLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_2303C5000, v8, OS_LOG_TYPE_DEFAULT, "Will allow any subscription bundle IDs for developer provider not in Set Top Box Mode or without a bundle identifier.", v14, 2u);
      }

      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v7 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = 0;
      goto LABEL_15;
    }
    VSDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2303C5000, v3, OS_LOG_TYPE_DEFAULT, "Will write subscriptions for developer provider in Set Top Box Mode and with a bundle identifier.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    VSDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "Will configure app as non channel purple software.", v12, 2u);
    }

    objc_msgSend(WeakRetained, "_authorizedBundleIdsFromAppDescriptions:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;
LABEL_15:

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The clearSubscriptionBundleIdsOrNil parameter must not be nil."));
      v10 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend(WeakRetained, "_removeSubscriptionsForBundleIdentifiers:withAuthorizedBundleIdentifiers:", v10, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v11 = *(_QWORD *)(a1 + 40);
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The newSubscriptionsOrNil parameter must not be nil."));
      v11 = *(_QWORD *)(a1 + 40);
    }
    objc_msgSend(WeakRetained, "_registerSubscriptions:withAuthorizedBundleIdentifiers:", v11, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  }
LABEL_23:
  objc_msgSend(*(id *)(a1 + 48), "finishExecutionIfPossible");

}

void __60__VSIdentityProviderSubscriptionOperation_executionDidBegin__block_invoke_13(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  _QWORD v5[4];
  __int128 v6;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  objc_msgSend(WeakRetained, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forceUnwrapObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__VSIdentityProviderSubscriptionOperation_executionDidBegin__block_invoke_2;
  v5[3] = &unk_24FE19918;
  v6 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v4, "unwrapObject:error:", v5, &__block_literal_global_0);

}

void __60__VSIdentityProviderSubscriptionOperation_executionDidBegin__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v8, "isInSetTopBoxMode");
  objc_msgSend(v8, "setTopBoxBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    objc_msgSend(v8, "setTopBoxBundleIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void __60__VSIdentityProviderSubscriptionOperation_executionDidBegin__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  VSErrorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __60__VSIdentityProviderSubscriptionOperation_executionDidBegin__block_invoke_3_cold_1((uint64_t)v2, v3);

}

- (id)_authorizedBundleIdsFromAppDescriptions:(id)a3
{
  id v3;
  id v4;
  id v5;
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
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "bundleID", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)_removeSubscriptionsForBundleIdentifiers:(id)a3 withAuthorizedBundleIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  VSIdentityProviderSubscriptionOperation *v21;
  id v22;
  id v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[VSIdentityProviderSubscriptionOperation registrationCenter](self, "registrationCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BDF8C78]);
  v24 = *MEMORY[0x24BDF8F38];
  v25[0] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __116__VSIdentityProviderSubscriptionOperation__removeSubscriptionsForBundleIdentifiers_withAuthorizedBundleIdentifiers___block_invoke;
  v18 = &unk_24FE199A8;
  v19 = v6;
  v20 = v7;
  v21 = self;
  v22 = v8;
  v23 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  v14 = v6;
  objc_msgSend(v12, "fetchActiveSubscriptionsWithOptions:completionHandler:", v10, &v15);
  objc_msgSend(v11, "wait", v15, v16, v17, v18);

}

void __116__VSIdentityProviderSubscriptionOperation__removeSubscriptionsForBundleIdentifiers_withAuthorizedBundleIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  void *v30;
  void *v31;
  id v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v39;
    *(_QWORD *)&v6 = 138412546;
    v29 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v10, "source", v29);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        VSDefaultLogObject();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v44 = (uint64_t)v12;
          _os_log_impl(&dword_2303C5000, v13, OS_LOG_TYPE_DEFAULT, "will check if subscription for bundle ID %@ exists and is authorized for removal", buf, 0xCu);
        }

        if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v12))
        {
          v14 = *(void **)(a1 + 40);
          if (v14 && !objc_msgSend(v14, "containsObject:", v12))
          {
            VSErrorLogObject();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(*(id *)(a1 + 48), "identityProvider");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "providerID");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "forceUnwrapObject");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v29;
              v44 = (uint64_t)v12;
              v45 = 2112;
              v46 = v30;
              _os_log_error_impl(&dword_2303C5000, v15, OS_LOG_TYPE_ERROR, "denying subscription removal for subscription for bundle ID %@ from identity provider %@", buf, 0x16u);

            }
          }
          else
          {
            objc_msgSend(v4, "addObject:", v10);
          }
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
  {
    VSDefaultLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(v4, "count");
      *(_DWORD *)buf = 134217984;
      v44 = v18;
      _os_log_impl(&dword_2303C5000, v17, OS_LOG_TYPE_DEFAULT, "will remove %lu subscriptions due to idenity provider clear request.", buf, 0xCu);
    }

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = v4;
    v19 = v4;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v35;
      v23 = *MEMORY[0x24BDF8E80];
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v35 != v22)
            objc_enumerationMutation(v19);
          v25 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
          objc_msgSend(*(id *)(a1 + 48), "identityProvider");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "providerID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "forceUnwrapObject");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setModifierIdentifier:", v28);

          objc_msgSend(v25, "setModifierType:", v23);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v21);
    }

    objc_msgSend(*(id *)(a1 + 56), "removeSubscriptions:", v19);
    v4 = v32;
  }
  objc_msgSend(*(id *)(a1 + 64), "signal");

}

- (void)_registerSubscriptions:(id)a3 withAuthorizedBundleIdentifiers:(id)a4
{
  id v6;
  id v7;
  VSIdentityProviderSubscriptionOperation *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  void *v27;
  void *v28;
  id obj;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self;
  -[VSIdentityProviderSubscriptionOperation registrationCenter](self, "registrationCenter");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v32;
    v13 = *MEMORY[0x24BDF8E80];
    *(_QWORD *)&v10 = 138412546;
    v26 = v10;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v14);
        if (v7
          && (objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v14), "source"),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v16, "identifier"),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              v18 = objc_msgSend(v7, "containsObject:", v17),
              v17,
              v16,
              !v18))
        {
          VSErrorLogObject();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v15, "source");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "identifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[VSIdentityProviderSubscriptionOperation identityProvider](v8, "identityProvider");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "providerID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "forceUnwrapObject");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v26;
            v36 = v23;
            v37 = 2112;
            v38 = v25;
            _os_log_error_impl(&dword_2303C5000, v22, OS_LOG_TYPE_ERROR, "denying subscription registration for subscription for bundle ID %@ from identity provider %@", buf, 0x16u);

          }
        }
        else
        {
          -[VSIdentityProviderSubscriptionOperation identityProvider](v8, "identityProvider", v26);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "providerID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "forceUnwrapObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setModifierIdentifier:", v21);

          objc_msgSend(v15, "setModifierType:", v13);
          objc_msgSend(v30, "registerSubscription:", v15);
        }
        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v11);
  }

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSIdentityProviderSubscriptionOperation;
  -[VSAsyncOperation cancel](&v4, sel_cancel);
  -[VSIdentityProviderSubscriptionOperation privateQueue](self, "privateQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllOperations");

}

- (VSIdentityProvider)identityProvider
{
  return self->_identityProvider;
}

- (void)setIdentityProvider:(id)a3
{
  objc_storeStrong((id *)&self->_identityProvider, a3);
}

- (NSArray)subscriptionsToAdd
{
  return self->_subscriptionsToAdd;
}

- (void)setSubscriptionsToAdd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSArray)subscriptionsToRemoveByBundleID
{
  return self->_subscriptionsToRemoveByBundleID;
}

- (void)setSubscriptionsToRemoveByBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (VSSubscriptionRegistrationCenter)registrationCenter
{
  return self->_registrationCenter;
}

- (void)setRegistrationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_registrationCenter, a3);
}

- (VSDeveloperSettingsFetchOperation)developerSettingsFetchOperation
{
  return self->_developerSettingsFetchOperation;
}

- (void)setDeveloperSettingsFetchOperation:(id)a3
{
  objc_storeStrong((id *)&self->_developerSettingsFetchOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_developerSettingsFetchOperation, 0);
  objc_storeStrong((id *)&self->_registrationCenter, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_subscriptionsToRemoveByBundleID, 0);
  objc_storeStrong((id *)&self->_subscriptionsToAdd, 0);
  objc_storeStrong((id *)&self->_identityProvider, 0);
}

void __60__VSIdentityProviderSubscriptionOperation_executionDidBegin__block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2303C5000, a2, OS_LOG_TYPE_ERROR, "Error fetching developer settings: %@", (uint8_t *)&v2, 0xCu);
}

@end
