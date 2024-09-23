@implementation RMSubscriberStore

+ (RMSubscriberStore)storeWithIdentifier:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  RMSubscriberStore *result;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v7 = a5;
  v8 = a3;
  v9 = +[RMStoreXPCProxy newConnectionWithScope:](RMStoreXPCProxy, "newConnectionWithScope:", a4);
  objc_msgSend(v9, "resume");
  v10 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __65__RMSubscriberStore_storeWithIdentifier_scope_completionHandler___block_invoke;
  v19[3] = &unk_25162EF90;
  v11 = v7;
  v20 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMStoreXPCConnection storeXPCConnection:](RMStoreXPCConnection, "storeXPCConnection:", v9);
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __65__RMSubscriberStore_storeWithIdentifier_scope_completionHandler___block_invoke_3;
  v16[3] = &unk_25162FBC8;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = v11;
  v13 = v17;
  v14 = v11;
  objc_msgSend(v12, "subscriberStoreWithIdentifier:completionHandler:", v8, v16);

  return result;
}

void __65__RMSubscriberStore_storeWithIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __63__RMObserverStore_storeWithIdentifier_scope_completionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __65__RMSubscriberStore_storeWithIdentifier_scope_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __63__RMObserverStore_storeWithIdentifier_scope_completionHandler___block_invoke_3_cold_1();
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_245188000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Fetched store", v8, 2u);
    }
    objc_msgSend(v5, "setXpcConnection:", *(_QWORD *)(a1 + 32));
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();

}

+ (void)storesWithScope:(int64_t)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a4;
  v6 = +[RMStoreXPCProxy newConnectionWithScope:](RMStoreXPCProxy, "newConnectionWithScope:", a3);
  objc_msgSend(v6, "resume");
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __55__RMSubscriberStore_storesWithScope_completionHandler___block_invoke;
  v15[3] = &unk_25162EF90;
  v8 = v5;
  v16 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMStoreXPCConnection storeXPCConnection:](RMStoreXPCConnection, "storeXPCConnection:", v6);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __55__RMSubscriberStore_storesWithScope_completionHandler___block_invoke_5;
  v12[3] = &unk_25162F030;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v8;
  v10 = v13;
  v11 = v8;
  objc_msgSend(v9, "subscriberStoresWithCompletionHandler:", v12);

}

void __55__RMSubscriberStore_storesWithScope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __63__RMObserverStore_storeWithIdentifier_scope_completionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __55__RMSubscriberStore_storesWithScope_completionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[8];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __53__RMObserverStore_storesWithScope_completionHandler___block_invoke_5_cold_1();
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_245188000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Fetched stores", buf, 2u);
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "setXpcConnection:", *(_QWORD *)(a1 + 32), (_QWORD)v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v10);
    }

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();

}

+ (void)subscribedStoreDeclarationsWithScope:(int64_t)a3 configurationTypes:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v7 = a5;
  v8 = a4;
  v9 = +[RMStoreXPCProxy newConnectionWithScope:](RMStoreXPCProxy, "newConnectionWithScope:", a3);
  objc_msgSend(v9, "resume");
  v10 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __95__RMSubscriberStore_subscribedStoreDeclarationsWithScope_configurationTypes_completionHandler___block_invoke;
  v18[3] = &unk_25162EF90;
  v11 = v7;
  v19 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMStoreXPCConnection storeXPCConnection:](RMStoreXPCConnection, "storeXPCConnection:", v9);
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __95__RMSubscriberStore_subscribedStoreDeclarationsWithScope_configurationTypes_completionHandler___block_invoke_7;
  v15[3] = &unk_25162FBF0;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = v11;
  v13 = v16;
  v14 = v11;
  objc_msgSend(v12, "subscribedStoreDeclarationsWithTypes:completionHandler:", v8, v15);

}

void __95__RMSubscriberStore_subscribedStoreDeclarationsWithScope_configurationTypes_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __95__RMSubscriberStore_subscribedStoreDeclarationsWithScope_configurationTypes_completionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __95__RMSubscriberStore_subscribedStoreDeclarationsWithScope_configurationTypes_completionHandler___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void (*v10)(void);
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[8];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __95__RMSubscriberStore_subscribedStoreDeclarationsWithScope_configurationTypes_completionHandler___block_invoke_7_cold_1();
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_245188000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Fetched stores and declarations", buf, 2u);
    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "setXpcConnection:", *(_QWORD *)(a1 + 32), (_QWORD)v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v13);
    }

    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v10();

}

+ (void)subscribedStoreConfigurationsVisibleUIWithScope:(int64_t)a3 configurationTypes:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v7 = a5;
  v8 = a4;
  v9 = +[RMStoreXPCProxy newConnectionWithScope:](RMStoreXPCProxy, "newConnectionWithScope:", a3);
  objc_msgSend(v9, "resume");
  v10 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __106__RMSubscriberStore_subscribedStoreConfigurationsVisibleUIWithScope_configurationTypes_completionHandler___block_invoke;
  v18[3] = &unk_25162EF90;
  v11 = v7;
  v19 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMStoreXPCConnection storeXPCConnection:](RMStoreXPCConnection, "storeXPCConnection:", v9);
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __106__RMSubscriberStore_subscribedStoreConfigurationsVisibleUIWithScope_configurationTypes_completionHandler___block_invoke_9;
  v15[3] = &unk_25162FBF0;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = v11;
  v13 = v16;
  v14 = v11;
  objc_msgSend(v12, "subscribedStoreConfigurationsVisibleUIWithTypes:completionHandler:", v8, v15);

}

void __106__RMSubscriberStore_subscribedStoreConfigurationsVisibleUIWithScope_configurationTypes_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __106__RMSubscriberStore_subscribedStoreConfigurationsVisibleUIWithScope_configurationTypes_completionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __106__RMSubscriberStore_subscribedStoreConfigurationsVisibleUIWithScope_configurationTypes_completionHandler___block_invoke_9(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void (*v10)(void);
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[8];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __106__RMSubscriberStore_subscribedStoreConfigurationsVisibleUIWithScope_configurationTypes_completionHandler___block_invoke_9_cold_1();
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_245188000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Fetched stores and configurations with visible UI", buf, 2u);
    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "setXpcConnection:", *(_QWORD *)(a1 + 32), (_QWORD)v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v13);
    }

    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v10();

}

- (void)resolveAsset:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;

  v6 = a3;
  v7 = a4;
  -[RMBaseStore xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __52__RMSubscriberStore_resolveAsset_completionHandler___block_invoke;
  v20[3] = &unk_25162EF90;
  v11 = v7;
  v21 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "resolveAs") != 1)
  {
LABEL_6:
    -[RMBaseStore identifier](self, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __52__RMSubscriberStore_resolveAsset_completionHandler___block_invoke_12;
    v18[3] = &unk_25162FC18;
    v18[4] = self;
    v19 = v11;
    objc_msgSend(v12, "resolveAsset:storeIdentifier:completionHandler:", v6, v16, v18);

    v17 = v19;
    goto LABEL_7;
  }
  v13 = (void *)MEMORY[0x24BE7EB38];
  objc_msgSend(v6, "downloadURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "tokenForURL:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v6, "addExtensionToken:", v15);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[RMSubscriberStore resolveAsset:completionHandler:].cold.2(v6);

    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[RMSubscriberStore resolveAsset:completionHandler:].cold.1();
  objc_msgSend(MEMORY[0x24BE7EB08], "createInternalError");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v17);
LABEL_7:

}

void __52__RMSubscriberStore_resolveAsset_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __52__RMSubscriberStore_resolveAsset_completionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __52__RMSubscriberStore_resolveAsset_completionHandler___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __52__RMSubscriberStore_resolveAsset_completionHandler___block_invoke_12_cold_1();
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_245188000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Resolved asset", v8, 2u);
    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");

}

+ (void)unassignAssets:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v7 = a5;
  v8 = a3;
  v9 = +[RMStoreXPCProxy newConnectionWithScope:](RMStoreXPCProxy, "newConnectionWithScope:", a4);
  objc_msgSend(v9, "resume");
  v10 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __60__RMSubscriberStore_unassignAssets_scope_completionHandler___block_invoke;
  v18[3] = &unk_25162EF90;
  v11 = v7;
  v19 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __60__RMSubscriberStore_unassignAssets_scope_completionHandler___block_invoke_14;
  v15[3] = &unk_25162EF18;
  v16 = v9;
  v17 = v11;
  v13 = v9;
  v14 = v11;
  objc_msgSend(v12, "unassignAssets:completionHandler:", v8, v15);

}

void __60__RMSubscriberStore_unassignAssets_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __60__RMSubscriberStore_unassignAssets_scope_completionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __60__RMSubscriberStore_unassignAssets_scope_completionHandler___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  uint8_t v4[16];

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __60__RMSubscriberStore_unassignAssets_scope_completionHandler___block_invoke_14_cold_1();
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_245188000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Unassigned assets", v4, 2u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)assetCannotBeDeserialized:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v8 = (void *)MEMORY[0x24BE7EBF8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "reasonWithCode:description:underlyingError:", CFSTR("Error.AssetCannotBeDeserialized"), CFSTR("Asset cannot be deserialized"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMSubscriberStore _reasonsFromErrorWithFirstReason:error:](self, "_reasonsFromErrorWithFirstReason:error:", v12, v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[RMSubscriberStore _writeStatusForDeclaration:validity:reasons:completionHandler:](self, "_writeStatusForDeclaration:validity:reasons:completionHandler:", v11, 0, v13, v9);
}

- (void)assetCannotBeDownloaded:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v8 = (void *)MEMORY[0x24BE7EBF8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "reasonWithCode:description:underlyingError:", CFSTR("Error.AssetCannotBeDownloaded"), CFSTR("Asset cannot be downloaded"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMSubscriberStore _reasonsFromErrorWithFirstReason:error:](self, "_reasonsFromErrorWithFirstReason:error:", v12, v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[RMSubscriberStore _writeStatusForDeclaration:validity:reasons:completionHandler:](self, "_writeStatusForDeclaration:validity:reasons:completionHandler:", v11, 0, v13, v9);
}

- (void)assetCannotBeVerified:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v8 = (void *)MEMORY[0x24BE7EBF8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "reasonWithCode:description:underlyingError:", CFSTR("Error.AssetCannotBeVerified"), CFSTR("Asset cannot be verified"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMSubscriberStore _reasonsFromErrorWithFirstReason:error:](self, "_reasonsFromErrorWithFirstReason:error:", v12, v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[RMSubscriberStore _writeStatusForDeclaration:validity:reasons:completionHandler:](self, "_writeStatusForDeclaration:validity:reasons:completionHandler:", v11, 0, v13, v9);
}

- (void)assetEncounteredInternalError:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v8 = (void *)MEMORY[0x24BE7EBF8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "reasonWithCode:description:underlyingError:", CFSTR("Error.AssetEncounteredInternalError"), CFSTR("Asset encountered an internal error"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMSubscriberStore _reasonsFromErrorWithFirstReason:error:](self, "_reasonsFromErrorWithFirstReason:error:", v12, v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[RMSubscriberStore _writeStatusForDeclaration:validity:reasons:completionHandler:](self, "_writeStatusForDeclaration:validity:reasons:completionHandler:", v11, 0, v13, v9);
}

- (void)assetSuccessfullyResolved:(id)a3 completionHandler:(id)a4
{
  -[RMSubscriberStore _writeStatusForDeclaration:validity:reasons:completionHandler:](self, "_writeStatusForDeclaration:validity:reasons:completionHandler:", a3, 1, 0, a4);
}

- (void)configurationCannotBeDeserialized:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v8 = (void *)MEMORY[0x24BE7EBF8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "reasonWithCode:description:underlyingError:", CFSTR("Error.ConfigurationCannotBeDeserialized"), CFSTR("Configuration cannot be deserialized"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMSubscriberStore _reasonsFromErrorWithFirstReason:error:](self, "_reasonsFromErrorWithFirstReason:error:", v12, v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[RMSubscriberStore _writeStatusForDeclaration:validity:reasons:completionHandler:](self, "_writeStatusForDeclaration:validity:reasons:completionHandler:", v11, 0, v13, v9);
}

- (void)configurationFailedToApply:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v8 = (void *)MEMORY[0x24BE7EBF8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "reasonWithCode:description:underlyingError:", CFSTR("Error.ConfigurationCannotBeApplied"), CFSTR("Configuration cannot be applied"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMSubscriberStore _reasonsFromErrorWithFirstReason:error:](self, "_reasonsFromErrorWithFirstReason:error:", v12, v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[RMSubscriberStore _writeStatusForDeclaration:validity:reasons:completionHandler:](self, "_writeStatusForDeclaration:validity:reasons:completionHandler:", v11, 0, v13, v9);
}

- (void)configurationFailedAlreadyPresent:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x24BE7EBF8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "reasonWithCode:description:underlyingError:", CFSTR("Error.ConfigurationAlreadyPresent"), CFSTR("Configuration cannot be applied as another is already present"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMSubscriberStore _reasonsFromErrorWithFirstReason:error:](self, "_reasonsFromErrorWithFirstReason:error:", v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[RMSubscriberStore _writeStatusForDeclaration:validity:reasons:completionHandler:](self, "_writeStatusForDeclaration:validity:reasons:completionHandler:", v8, 0, v10, v7);
}

- (void)configurationIsInvalid:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v8 = (void *)MEMORY[0x24BE7EBF8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "reasonWithCode:description:underlyingError:", CFSTR("Error.ConfigurationIsInvalid"), CFSTR("Configuration is invalid"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMSubscriberStore _reasonsFromErrorWithFirstReason:error:](self, "_reasonsFromErrorWithFirstReason:error:", v12, v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[RMSubscriberStore _writeStatusForDeclaration:validity:reasons:completionHandler:](self, "_writeStatusForDeclaration:validity:reasons:completionHandler:", v11, 0, v13, v9);
}

- (void)configurationNotSupported:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v8 = (void *)MEMORY[0x24BE7EBF8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "reasonWithCode:description:underlyingError:", CFSTR("Error.ConfigurationNotSupported"), CFSTR("Configuration not supported"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMSubscriberStore _reasonsFromErrorWithFirstReason:error:](self, "_reasonsFromErrorWithFirstReason:error:", v12, v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[RMSubscriberStore _writeStatusForDeclaration:validity:reasons:completionHandler:](self, "_writeStatusForDeclaration:validity:reasons:completionHandler:", v11, 0, v13, v9);
}

- (void)configurationErrorReasons:(id)a3 reasons:(id)a4 completionHandler:(id)a5
{
  -[RMSubscriberStore _writeStatusForDeclaration:validity:reasons:completionHandler:](self, "_writeStatusForDeclaration:validity:reasons:completionHandler:", a3, 0, a4, a5);
}

- (void)configurationSuccessfullyApplied:(id)a3 completionHandler:(id)a4
{
  -[RMSubscriberStore _writeStatusForDeclaration:validity:reasons:completionHandler:](self, "_writeStatusForDeclaration:validity:reasons:completionHandler:", a3, 1, 0, a4);
}

- (void)configurationSuccessfullyApplied:(id)a3 reasons:(id)a4 completionHandler:(id)a5
{
  -[RMSubscriberStore _writeStatusForDeclaration:validity:reasons:completionHandler:](self, "_writeStatusForDeclaration:validity:reasons:completionHandler:", a3, 1, a4, a5);
}

- (void)certificatePersistentRefForAssetKey:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a4;
  v7 = a3;
  -[RMBaseStore xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __75__RMSubscriberStore_certificatePersistentRefForAssetKey_completionHandler___block_invoke;
  v17[3] = &unk_25162EF90;
  v11 = v6;
  v18 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[RMBaseStore identifier](self, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __75__RMSubscriberStore_certificatePersistentRefForAssetKey_completionHandler___block_invoke_52;
  v15[3] = &unk_25162F058;
  v15[4] = self;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v12, "certificatePersistentRefForAssetKey:storeIdentifier:completionHandler:", v7, v13, v15);

}

void __75__RMSubscriberStore_certificatePersistentRefForAssetKey_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __75__RMSubscriberStore_certificatePersistentRefForAssetKey_completionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __75__RMSubscriberStore_certificatePersistentRefForAssetKey_completionHandler___block_invoke_52(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __75__RMSubscriberStore_certificatePersistentRefForAssetKey_completionHandler___block_invoke_52_cold_1();
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_245188000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Fetched certificate  persistent ref", v8, 2u);
    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");

}

- (void)certificateStatusWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[RMBaseStore xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __60__RMSubscriberStore_certificateStatusWithCompletionHandler___block_invoke;
  v14[3] = &unk_25162EF90;
  v8 = v4;
  v15 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[RMBaseStore identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __60__RMSubscriberStore_certificateStatusWithCompletionHandler___block_invoke_54;
  v12[3] = &unk_25162FC40;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v9, "certificateStatusWithStoreIdentifier:completionHandler:", v10, v12);

}

void __60__RMSubscriberStore_certificateStatusWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __60__RMSubscriberStore_certificateStatusWithCompletionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __60__RMSubscriberStore_certificateStatusWithCompletionHandler___block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __60__RMSubscriberStore_certificateStatusWithCompletionHandler___block_invoke_54_cold_1();
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_245188000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Fetched certificate status", v8, 2u);
    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");

}

- (void)setConfigurationUI:(id)a3 visible:(BOOL)a4 ui:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  RMSubscriberStore *v25;
  id v26;
  _QWORD v27[4];
  id v28;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  v12 = a5;
  -[RMBaseStore xpcConnection](self, "xpcConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __69__RMSubscriberStore_setConfigurationUI_visible_ui_completionHandler___block_invoke;
  v27[3] = &unk_25162EF90;
  v16 = v11;
  v28 = v16;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v27);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[RMBaseStore identifier](self, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "declarationIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "declarationServerToken");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __69__RMSubscriberStore_setConfigurationUI_visible_ui_completionHandler___block_invoke_56;
  v23[3] = &unk_25162FC68;
  v25 = self;
  v26 = v16;
  v24 = v10;
  v21 = v16;
  v22 = v10;
  objc_msgSend(v17, "setConfigurationUIWithStoreIdentifier:declarationIdentifier:declarationServerToken:visible:ui:completionHandler:", v18, v19, v20, v8, v12, v23);

}

void __69__RMSubscriberStore_setConfigurationUI_visible_ui_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __69__RMSubscriberStore_setConfigurationUI_visible_ui_completionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __69__RMSubscriberStore_setConfigurationUI_visible_ui_completionHandler___block_invoke_56(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __69__RMSubscriberStore_setConfigurationUI_visible_ui_completionHandler___block_invoke_56_cold_2();
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    __69__RMSubscriberStore_setConfigurationUI_visible_ui_completionHandler___block_invoke_56_cold_1(a1);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "xpcConnection");

}

- (void)publishStatus:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a4;
  v7 = a3;
  -[RMBaseStore xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __53__RMSubscriberStore_publishStatus_completionHandler___block_invoke;
  v17[3] = &unk_25162EF90;
  v11 = v6;
  v18 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[RMBaseStore identifier](self, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __53__RMSubscriberStore_publishStatus_completionHandler___block_invoke_57;
  v15[3] = &unk_25162EF18;
  v15[4] = self;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v12, "publishStatusWithStoreIdentifier:status:completionHandler:", v13, v7, v15);

}

void __53__RMSubscriberStore_publishStatus_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __69__RMSubscriberStore_setConfigurationUI_visible_ui_completionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __53__RMSubscriberStore_publishStatus_completionHandler___block_invoke_57(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __53__RMSubscriberStore_publishStatus_completionHandler___block_invoke_57_cold_2();
  }
  else
  {
    v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v4)
      __53__RMSubscriberStore_publishStatus_completionHandler___block_invoke_57_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");

}

- (BOOL)isValidStatusItem:(Class)a3
{
  return -[objc_class isSupportedForPlatform:scope:enrollmentType:](a3, "isSupportedForPlatform:scope:enrollmentType:", objc_msgSend(MEMORY[0x24BE7EBF0], "currentPlatform"), -[RMBaseStore scope](self, "scope"), -[RMBaseStore type](self, "type"));
}

- (id)_reasonsFromErrorWithFirstReason:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
    objc_msgSend(v7, "addObject:", v5);
  if (v6)
  {
    objc_msgSend(v6, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("RMModelStatusReasons"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "addObject:", v10);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v8, "addObjectsFromArray:", v10);
    }

  }
  return v8;
}

- (void)_writeStatusForDeclaration:(id)a3 validity:(BOOL)a4 reasons:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _BOOL4 v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[4];
  id v27;

  v23 = a4;
  v9 = a6;
  v10 = a5;
  v11 = a3;
  -[RMBaseStore xpcConnection](self, "xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __83__RMSubscriberStore__writeStatusForDeclaration_validity_reasons_completionHandler___block_invoke;
  v26[3] = &unk_25162EF90;
  v14 = v9;
  v27 = v14;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v26);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[RMBaseStore identifier](self, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "declarationType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "declarationIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "declarationServerToken");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bundleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __83__RMSubscriberStore__writeStatusForDeclaration_validity_reasons_completionHandler___block_invoke_62;
  v24[3] = &unk_25162EF18;
  v24[4] = self;
  v25 = v14;
  v22 = v14;
  objc_msgSend(v15, "writeStatusWithStoreIdentifier:declarationType:declarationIdentifier:declarationServerToken:sourceIdentifier:validity:reasons:completionHandler:", v16, v17, v18, v19, v21, v23, v10, v24);

}

void __83__RMSubscriberStore__writeStatusForDeclaration_validity_reasons_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __83__RMSubscriberStore__writeStatusForDeclaration_validity_reasons_completionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __83__RMSubscriberStore__writeStatusForDeclaration_validity_reasons_completionHandler___block_invoke_62(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __83__RMSubscriberStore__writeStatusForDeclaration_validity_reasons_completionHandler___block_invoke_62_cold_2();
  }
  else
  {
    v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v4)
      __83__RMSubscriberStore__writeStatusForDeclaration_validity_reasons_completionHandler___block_invoke_62_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");

}

- (void)_removeStatusForDeclarationIdentifier:(id)a3 declarationServerToken:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[RMBaseStore xpcConnection](self, "xpcConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __100__RMSubscriberStore__removeStatusForDeclarationIdentifier_declarationServerToken_completionHandler___block_invoke;
  v22[3] = &unk_25162EF90;
  v14 = v8;
  v23 = v14;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[RMBaseStore identifier](self, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __100__RMSubscriberStore__removeStatusForDeclarationIdentifier_declarationServerToken_completionHandler___block_invoke_63;
  v20[3] = &unk_25162EF18;
  v20[4] = self;
  v21 = v14;
  v19 = v14;
  objc_msgSend(v15, "removeStatusWithStoreIdentifier:declarationIdentifier:declarationServerToken:sourceIdentifier:completionHandler:", v16, v10, v9, v18, v20);

}

void __100__RMSubscriberStore__removeStatusForDeclarationIdentifier_declarationServerToken_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __100__RMSubscriberStore__removeStatusForDeclarationIdentifier_declarationServerToken_completionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __100__RMSubscriberStore__removeStatusForDeclarationIdentifier_declarationServerToken_completionHandler___block_invoke_63(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __100__RMSubscriberStore__removeStatusForDeclarationIdentifier_declarationServerToken_completionHandler___block_invoke_63_cold_2();
  }
  else
  {
    v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v4)
      __100__RMSubscriberStore__removeStatusForDeclarationIdentifier_declarationServerToken_completionHandler___block_invoke_63_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  RMSubscriberStore *v4;
  BOOL v5;

  v4 = (RMSubscriberStore *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[RMSubscriberStore isEqualToStore:](self, "isEqualToStore:", v4);
  }

  return v5;
}

- (BOOL)isEqualToStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RMSubscriberStore;
  return -[RMBaseStore isEqualToStore:](&v4, sel_isEqualToStore_, a3);
}

void __95__RMSubscriberStore_subscribedStoreDeclarationsWithScope_configurationTypes_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed XPC connection while fetching stores and declarations: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __95__RMSubscriberStore_subscribedStoreDeclarationsWithScope_configurationTypes_completionHandler___block_invoke_7_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed to fetch stores and declarations: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __106__RMSubscriberStore_subscribedStoreConfigurationsVisibleUIWithScope_configurationTypes_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed XPC connection while fetching stores and configurations with missing UI: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __106__RMSubscriberStore_subscribedStoreConfigurationsVisibleUIWithScope_configurationTypes_completionHandler___block_invoke_9_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed to fetch stores and configurations with visible UI: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)resolveAsset:completionHandler:.cold.1()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_245188000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to issue sandbox extension for file: %d", (uint8_t *)v1, 8u);
  OUTLINED_FUNCTION_5();
}

- (void)resolveAsset:(void *)a1 completionHandler:.cold.2(void *a1)
{
  void *v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "downloadURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_245188000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Created sandbox extension for file: %{public}@", v2, 0xCu);

  OUTLINED_FUNCTION_3_1();
}

void __52__RMSubscriberStore_resolveAsset_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed XPC connection while resolving asset: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __52__RMSubscriberStore_resolveAsset_completionHandler___block_invoke_12_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed to resolve: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __60__RMSubscriberStore_unassignAssets_scope_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed XPC connection while unassigning assets: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __60__RMSubscriberStore_unassignAssets_scope_completionHandler___block_invoke_14_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed to unassign assets: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __75__RMSubscriberStore_certificatePersistentRefForAssetKey_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed XPC connection while fetching certificate persistent ref: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __75__RMSubscriberStore_certificatePersistentRefForAssetKey_completionHandler___block_invoke_52_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed to fetch certificate persistent ref: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __60__RMSubscriberStore_certificateStatusWithCompletionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed XPC connection while fetching certificate status: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __60__RMSubscriberStore_certificateStatusWithCompletionHandler___block_invoke_54_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed to fetch certificate status: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __69__RMSubscriberStore_setConfigurationUI_visible_ui_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed XPC connection while publishing status: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __69__RMSubscriberStore_setConfigurationUI_visible_ui_completionHandler___block_invoke_56_cold_1(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "declarationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "declarationServerToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543618;
  v5 = v2;
  v6 = 2114;
  v7 = v3;
  _os_log_debug_impl(&dword_245188000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Set configuration UI for: %{public}@ %{public}@", (uint8_t *)&v4, 0x16u);

  OUTLINED_FUNCTION_3_1();
}

void __69__RMSubscriberStore_setConfigurationUI_visible_ui_completionHandler___block_invoke_56_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Could not set configuration UI: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __53__RMSubscriberStore_publishStatus_completionHandler___block_invoke_57_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_245188000, MEMORY[0x24BDACB70], a3, "Published status", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __53__RMSubscriberStore_publishStatus_completionHandler___block_invoke_57_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Could not publish status: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __83__RMSubscriberStore__writeStatusForDeclaration_validity_reasons_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed XPC connection while writing status: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __83__RMSubscriberStore__writeStatusForDeclaration_validity_reasons_completionHandler___block_invoke_62_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_245188000, MEMORY[0x24BDACB70], a3, "Wrote status", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __83__RMSubscriberStore__writeStatusForDeclaration_validity_reasons_completionHandler___block_invoke_62_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Could not write status: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __100__RMSubscriberStore__removeStatusForDeclarationIdentifier_declarationServerToken_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed XPC connection while removing status: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __100__RMSubscriberStore__removeStatusForDeclarationIdentifier_declarationServerToken_completionHandler___block_invoke_63_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_245188000, MEMORY[0x24BDACB70], a3, "Removed status", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __100__RMSubscriberStore__removeStatusForDeclarationIdentifier_declarationServerToken_completionHandler___block_invoke_63_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Could not remove status: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
