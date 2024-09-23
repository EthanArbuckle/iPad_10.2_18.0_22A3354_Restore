@implementation VSAppsOperation

- (VSAppsOperation)initWithIdentityProvider:(id)a3
{
  return -[VSAppsOperation initWithIdentityProvider:accountChannels:](self, "initWithIdentityProvider:accountChannels:", a3, 0);
}

- (VSAppsOperation)initWithIdentityProvider:(id)a3 accountChannels:(id)a4
{
  id v7;
  id v8;
  VSAppsOperation *v9;
  VSAppsOperation *v10;
  dispatch_group_t v11;
  OS_dispatch_group *dispatchGroup;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VSAppsOperation;
  v9 = -[VSAppsOperation init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identityProvider, a3);
    objc_storeStrong((id *)&v10->_accountChannels, a4);
    v11 = dispatch_group_create();
    dispatchGroup = v10->_dispatchGroup;
    v10->_dispatchGroup = (OS_dispatch_group *)v11;

  }
  return v10;
}

- (void)fetchChannelAppsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  VSIdentityProviderFetchAppsOperation *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  -[VSAppsOperation identityProvider](self, "identityProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "forceUnwrapObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[VSIdentityProviderFetchAppsOperation initWithProviderIdentifier:andType:]([VSIdentityProviderFetchAppsOperation alloc], "initWithProviderIdentifier:andType:", v7, 3);
  objc_initWeak(&location, v8);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__VSAppsOperation_fetchChannelAppsWithCompletion___block_invoke;
  v10[3] = &unk_24FE1AFB0;
  v9 = v4;
  v11 = v9;
  objc_copyWeak(&v12, &location);
  -[VSIdentityProviderFetchAppsOperation setCompletionBlock:](v8, "setCompletionBlock:", v10);
  -[VSAsyncOperation start](v8, "start");
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

void __50__VSAppsOperation_fetchChannelAppsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);

}

- (id)createAppsResult
{
  VSApps *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  NSObject *v17;
  VSApps *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  NSObject *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[5];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(VSApps);
  -[VSAppsOperation identityProvider](self, "identityProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nonChannelAppDescriptions");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = MEMORY[0x24BDBD1A8];
  if (v5)
    v8 = v5;
  else
    v8 = MEMORY[0x24BDBD1A8];
  -[VSApps setNonChannelApps:](v3, "setNonChannelApps:", v8);

  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__4;
  v44 = __Block_byref_object_dispose__4;
  v45 = 0;
  -[VSAppsOperation channelAppsFailable](self, "channelAppsFailable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __35__VSAppsOperation_createAppsResult__block_invoke;
    v39[3] = &unk_24FE1AFD8;
    v39[4] = &v40;
    objc_msgSend(v9, "unwrapObject:error:", v39, &__block_literal_global_20);
    -[VSAppsOperation accountChannels](self, "accountChannels");
    v34 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v41[5], "allApps");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = v11;
    else
      v13 = v7;
    -[VSApps setAvailableApps:](v3, "setAvailableApps:", v13);

    -[VSApps availableApps](v3, "availableApps");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSApps setHasChannelApps:](v3, "setHasChannelApps:", objc_msgSend(v14, "count") != 0);

    objc_msgSend((id)v41[5], "appsByChannelID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "count"))
    {
      -[NSObject channelIDs](v34, "channelIDs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count") != 0;

    }
    else
    {
      v16 = 0;
    }
    -[VSApps setHasUserChannelList:](v3, "setHasUserChannelList:", v16);
    if (v16)
    {
      v19 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v20 = objc_alloc(MEMORY[0x24BDBCEB8]);
      -[VSApps availableApps](v3, "availableApps");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v20, "initWithArray:", v21);

      -[NSObject channelIDs](v34, "channelIDs");
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v36 != v25)
              objc_enumerationMutation(v23);
            v27 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
            objc_msgSend((id)v41[5], "appsByChannelID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectForKey:", v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
            {
              objc_msgSend(v22, "removeObjectsInArray:", v29);
              objc_msgSend(v19, "addObjectsFromArray:", v29);
            }

          }
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
        }
        while (v24);
      }

      v30 = (void *)objc_msgSend(v22, "copy");
      -[VSApps setAvailableApps:](v3, "setAvailableApps:", v30);

      objc_msgSend(v19, "allObjects");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSApps setSubscribedApps:](v3, "setSubscribedApps:", v31);

    }
    v18 = v3;

    v17 = v34;
  }
  else
  {
    VSErrorLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[VSAppsOperation createAppsResult].cold.1(v17);
    v18 = 0;
  }

  _Block_object_dispose(&v40, 8);
  return v18;
}

void __35__VSAppsOperation_createAppsResult__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __35__VSAppsOperation_createAppsResult__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  VSErrorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __35__VSAppsOperation_createAppsResult__block_invoke_2_cold_1((uint64_t)v2, v3);

}

- (void)filterVisionOSCompatibleApps:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x24BDD1758];
  v4 = a3;
  objc_msgSend(v3, "predicateWithBlock:", &__block_literal_global_8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availableApps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAvailableApps:", v6);

  objc_msgSend(v4, "subscribedApps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubscribedApps:", v8);

  objc_msgSend(v4, "nonChannelApps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filteredArrayUsingPredicate:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNonChannelApps:", v10);

}

uint64_t __48__VSAppsOperation_filterVisionOSCompatibleApps___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "isVisionOSCompatible");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "isVisionOSCompatible");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)executionDidBegin
{
  NSObject *v3;
  void *v4;
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[VSAppsOperation executionDidBegin]";
    _os_log_impl(&dword_2303C5000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[VSAppsOperation accountChannels](self, "accountChannels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  v6 = MEMORY[0x24BDAC760];
  if (v5)
  {
    -[VSAppsOperation dispatchGroup](self, "dispatchGroup");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v7);

    objc_msgSend(MEMORY[0x24BDF8B68], "sharedCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __36__VSAppsOperation_executionDidBegin__block_invoke;
    v15[3] = &unk_24FE1B060;
    objc_copyWeak(&v16, (id *)buf);
    objc_msgSend(v8, "fetchAccountChannelsWithCompletionHandler:", v15);

    objc_destroyWeak(&v16);
  }
  -[VSAppsOperation dispatchGroup](self, "dispatchGroup");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v9);

  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __36__VSAppsOperation_executionDidBegin__block_invoke_2;
  v13[3] = &unk_24FE1B088;
  objc_copyWeak(&v14, (id *)buf);
  -[VSAppsOperation fetchChannelAppsWithCompletion:](self, "fetchChannelAppsWithCompletion:", v13);
  -[VSAppsOperation dispatchGroup](self, "dispatchGroup");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __36__VSAppsOperation_executionDidBegin__block_invoke_3;
  block[3] = &unk_24FE1A3F0;
  objc_copyWeak(&v12, (id *)buf);
  dispatch_group_notify(v10, MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __36__VSAppsOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  NSObject *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setAccountChannels:", v3);

  objc_msgSend(WeakRetained, "dispatchGroup");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v4);

}

void __36__VSAppsOperation_executionDidBegin__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  NSObject *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setChannelAppsFailable:", v3);

  objc_msgSend(WeakRetained, "dispatchGroup");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v4);

}

void __36__VSAppsOperation_executionDidBegin__block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "createAppsResult");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setResult:", v1);
  objc_msgSend(WeakRetained, "finishExecutionIfPossible");

}

- (VSApps)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (VSIdentityProvider)identityProvider
{
  return self->_identityProvider;
}

- (void)setIdentityProvider:(id)a3
{
  objc_storeStrong((id *)&self->_identityProvider, a3);
}

- (VSAccountChannelsCenter)accountChannelsCenter
{
  return self->_accountChannelsCenter;
}

- (void)setAccountChannelsCenter:(id)a3
{
  objc_storeStrong((id *)&self->_accountChannelsCenter, a3);
}

- (VSAccountChannels)accountChannels
{
  return self->_accountChannels;
}

- (void)setAccountChannels:(id)a3
{
  objc_storeStrong((id *)&self->_accountChannels, a3);
}

- (NSArray)nonChannelApps
{
  return self->_nonChannelApps;
}

- (void)setNonChannelApps:(id)a3
{
  objc_storeStrong((id *)&self->_nonChannelApps, a3);
}

- (VSFailable)channelAppsFailable
{
  return self->_channelAppsFailable;
}

- (void)setChannelAppsFailable:(id)a3
{
  objc_storeStrong((id *)&self->_channelAppsFailable, a3);
}

- (OS_dispatch_group)dispatchGroup
{
  return self->_dispatchGroup;
}

- (void)setDispatchGroup:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
  objc_storeStrong((id *)&self->_channelAppsFailable, 0);
  objc_storeStrong((id *)&self->_nonChannelApps, 0);
  objc_storeStrong((id *)&self->_accountChannels, 0);
  objc_storeStrong((id *)&self->_accountChannelsCenter, 0);
  objc_storeStrong((id *)&self->_identityProvider, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

- (void)createAppsResult
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2303C5000, log, OS_LOG_TYPE_ERROR, "No ChannelAppsOperation result -- returning no apps.", v1, 2u);
}

void __35__VSAppsOperation_createAppsResult__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2303C5000, a2, OS_LOG_TYPE_ERROR, "Error fetching channel apps: %@", (uint8_t *)&v2, 0xCu);
}

@end
