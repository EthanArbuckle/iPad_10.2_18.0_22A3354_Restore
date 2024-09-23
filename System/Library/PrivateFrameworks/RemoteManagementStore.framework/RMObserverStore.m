@implementation RMObserverStore

+ (void)storeWithIdentifier:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
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
  v18[2] = __63__RMObserverStore_storeWithIdentifier_scope_completionHandler___block_invoke;
  v18[3] = &unk_25162EF90;
  v11 = v7;
  v19 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMStoreXPCConnection storeXPCConnection:](RMStoreXPCConnection, "storeXPCConnection:", v9);
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __63__RMObserverStore_storeWithIdentifier_scope_completionHandler___block_invoke_3;
  v15[3] = &unk_25162F770;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = v11;
  v13 = v16;
  v14 = v11;
  objc_msgSend(v12, "observerStoreWithIdentifier:completionHandler:", v8, v15);

}

void __63__RMObserverStore_storeWithIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __63__RMObserverStore_storeWithIdentifier_scope_completionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __63__RMObserverStore_storeWithIdentifier_scope_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
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

+ (void)storesWithCompletionHandler:(id)a3
{
  objc_msgSend(a1, "storesWithScope:completionHandler:", 1, a3);
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
  v15[2] = __53__RMObserverStore_storesWithScope_completionHandler___block_invoke;
  v15[3] = &unk_25162EF90;
  v8 = v5;
  v16 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMStoreXPCConnection storeXPCConnection:](RMStoreXPCConnection, "storeXPCConnection:", v6);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __53__RMObserverStore_storesWithScope_completionHandler___block_invoke_5;
  v12[3] = &unk_25162F030;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v8;
  v10 = v13;
  v11 = v8;
  objc_msgSend(v9, "observerStoresWithCompletionHandler:", v12);

}

void __53__RMObserverStore_storesWithScope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __53__RMObserverStore_storesWithScope_completionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __53__RMObserverStore_storesWithScope_completionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
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

- (void)displayPropertiesForConfigurationsWithCompletionHandler:(id)a3
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
  v14[2] = __75__RMObserverStore_displayPropertiesForConfigurationsWithCompletionHandler___block_invoke;
  v14[3] = &unk_25162EF90;
  v8 = v4;
  v15 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[RMBaseStore identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __75__RMObserverStore_displayPropertiesForConfigurationsWithCompletionHandler___block_invoke_7;
  v12[3] = &unk_25162F030;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v9, "configurationUIsForStoreIdentifier:completionHandler:", v10, v12);

}

void __75__RMObserverStore_displayPropertiesForConfigurationsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __75__RMObserverStore_displayPropertiesForConfigurationsWithCompletionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __75__RMObserverStore_displayPropertiesForConfigurationsWithCompletionHandler___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __75__RMObserverStore_displayPropertiesForConfigurationsWithCompletionHandler___block_invoke_7_cold_1();
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134217984;
      v9 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_245188000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Fetched configuration UIs: %lu", (uint8_t *)&v8, 0xCu);
    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");

}

- (void)displayableProfileConfigurationsWithCompletionHandler:(id)a3
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
  v14[2] = __73__RMObserverStore_displayableProfileConfigurationsWithCompletionHandler___block_invoke;
  v14[3] = &unk_25162EF90;
  v8 = v4;
  v15 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[RMBaseStore identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __73__RMObserverStore_displayableProfileConfigurationsWithCompletionHandler___block_invoke_8;
  v12[3] = &unk_25162F030;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v9, "displayableProfileConfigurationsForStoreIdentifier:completionHandler:", v10, v12);

}

void __73__RMObserverStore_displayableProfileConfigurationsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __73__RMObserverStore_displayableProfileConfigurationsWithCompletionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __73__RMObserverStore_displayableProfileConfigurationsWithCompletionHandler___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __73__RMObserverStore_displayableProfileConfigurationsWithCompletionHandler___block_invoke_8_cold_1();
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134217984;
      v9 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_245188000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Fetched profile configurations: %lu", (uint8_t *)&v8, 0xCu);
    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  RMObserverStore *v4;
  BOOL v5;

  v4 = (RMObserverStore *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[RMObserverStore isEqualToStore:](self, "isEqualToStore:", v4);
  }

  return v5;
}

- (BOOL)isEqualToStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RMObserverStore;
  return -[RMBaseStore isEqualToStore:](&v4, sel_isEqualToStore_, a3);
}

void __63__RMObserverStore_storeWithIdentifier_scope_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed XPC connection while fetching store: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __63__RMObserverStore_storeWithIdentifier_scope_completionHandler___block_invoke_3_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed to fetch store: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __53__RMObserverStore_storesWithScope_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed XPC connection while fetching stores: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __53__RMObserverStore_storesWithScope_completionHandler___block_invoke_5_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed to fetch stores: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __75__RMObserverStore_displayPropertiesForConfigurationsWithCompletionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed XPC connection while fetching configuration UIs: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __75__RMObserverStore_displayPropertiesForConfigurationsWithCompletionHandler___block_invoke_7_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed to fetch configuration UIs: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __73__RMObserverStore_displayableProfileConfigurationsWithCompletionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed XPC connection while fetching profile configurations: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __73__RMObserverStore_displayableProfileConfigurationsWithCompletionHandler___block_invoke_8_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed to fetch profile configurations: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
