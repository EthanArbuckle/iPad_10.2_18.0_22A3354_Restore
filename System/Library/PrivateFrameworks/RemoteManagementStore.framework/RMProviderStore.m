@implementation RMProviderStore

+ (void)createStoreWithType:(int64_t)a3 scope:(int64_t)a4 defaultToInteractive:(BOOL)a5 dataSeparated:(BOOL)a6 options:(id)a7 completionHandler:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v9 = a6;
  v10 = a5;
  v13 = a8;
  v14 = a7;
  v15 = +[RMStoreXPCProxy newConnectionWithScope:](RMStoreXPCProxy, "newConnectionWithScope:", a4);
  objc_msgSend(v15, "resume");
  v16 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __106__RMProviderStore_createStoreWithType_scope_defaultToInteractive_dataSeparated_options_completionHandler___block_invoke;
  v24[3] = &unk_25162EF90;
  v17 = v13;
  v25 = v17;
  objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMStoreXPCConnection storeXPCConnection:](RMStoreXPCConnection, "storeXPCConnection:", v15);
  v21[0] = v16;
  v21[1] = 3221225472;
  v21[2] = __106__RMProviderStore_createStoreWithType_scope_defaultToInteractive_dataSeparated_options_completionHandler___block_invoke_9;
  v21[3] = &unk_25162F7A0;
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v23 = v17;
  v19 = v22;
  v20 = v17;
  objc_msgSend(v18, "createStoreWithType:defaultToInteractive:dataSeparated:options:completionHandler:", a3, v10, v9, v14, v21);

}

void __106__RMProviderStore_createStoreWithType_scope_defaultToInteractive_dataSeparated_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __106__RMProviderStore_createStoreWithType_scope_defaultToInteractive_dataSeparated_options_completionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __106__RMProviderStore_createStoreWithType_scope_defaultToInteractive_dataSeparated_options_completionHandler___block_invoke_9(uint64_t a1, void *a2, void *a3)
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
      __106__RMProviderStore_createStoreWithType_scope_defaultToInteractive_dataSeparated_options_completionHandler___block_invoke_9_cold_1();
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_245188000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Created store", v8, 2u);
    }
    objc_msgSend(v5, "setXpcConnection:", *(_QWORD *)(a1 + 32));
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();

}

+ (void)removeStoreWithIdentifier:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
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
  v18[2] = __69__RMProviderStore_removeStoreWithIdentifier_scope_completionHandler___block_invoke;
  v18[3] = &unk_25162EF90;
  v11 = v7;
  v19 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __69__RMProviderStore_removeStoreWithIdentifier_scope_completionHandler___block_invoke_11;
  v15[3] = &unk_25162F3C0;
  v16 = v9;
  v17 = v11;
  v13 = v11;
  v14 = v9;
  objc_msgSend(v12, "removeStoreWithIdentifier:completionHandler:", v8, v15);

}

void __69__RMProviderStore_removeStoreWithIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __106__RMProviderStore_createStoreWithType_scope_defaultToInteractive_dataSeparated_options_completionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __69__RMProviderStore_removeStoreWithIdentifier_scope_completionHandler___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  void (*v4)(void);
  uint8_t v5[16];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __69__RMProviderStore_removeStoreWithIdentifier_scope_completionHandler___block_invoke_11_cold_1();
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_245188000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Removed store", v5, 2u);
    }
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v4();

}

+ (RMProviderStore)storeWithIdentifier:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  RMProviderStore *result;
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
  v19[2] = __63__RMProviderStore_storeWithIdentifier_scope_completionHandler___block_invoke;
  v19[3] = &unk_25162EF90;
  v11 = v7;
  v20 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMStoreXPCConnection storeXPCConnection:](RMStoreXPCConnection, "storeXPCConnection:", v9);
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __63__RMProviderStore_storeWithIdentifier_scope_completionHandler___block_invoke_12;
  v16[3] = &unk_25162F7A0;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = v11;
  v13 = v17;
  v14 = v11;
  objc_msgSend(v12, "providerStoreWithIdentifier:completionHandler:", v8, v16);

  return result;
}

void __63__RMProviderStore_storeWithIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __63__RMObserverStore_storeWithIdentifier_scope_completionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __63__RMProviderStore_storeWithIdentifier_scope_completionHandler___block_invoke_12(uint64_t a1, void *a2, void *a3)
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
  v15[2] = __53__RMProviderStore_storesWithScope_completionHandler___block_invoke;
  v15[3] = &unk_25162EF90;
  v8 = v5;
  v16 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMStoreXPCConnection storeXPCConnection:](RMStoreXPCConnection, "storeXPCConnection:", v6);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __53__RMProviderStore_storesWithScope_completionHandler___block_invoke_13;
  v12[3] = &unk_25162F030;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v8;
  v10 = v13;
  v11 = v8;
  objc_msgSend(v9, "providerStoresWithCompletionHandler:", v12);

}

void __53__RMProviderStore_storesWithScope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __63__RMObserverStore_storeWithIdentifier_scope_completionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __53__RMProviderStore_storesWithScope_completionHandler___block_invoke_13(uint64_t a1, void *a2, void *a3)
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

- (void)applyChangesWithCompletionHandler:(id)a3
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
  v14[2] = __53__RMProviderStore_applyChangesWithCompletionHandler___block_invoke;
  v14[3] = &unk_25162EF90;
  v8 = v4;
  v15 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[RMBaseStore identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __53__RMProviderStore_applyChangesWithCompletionHandler___block_invoke_15;
  v12[3] = &unk_25162EF18;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v9, "applyChangesForStoreIdentifier:completionHandler:", v10, v12);

}

void __53__RMProviderStore_applyChangesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __53__RMProviderStore_applyChangesWithCompletionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __53__RMProviderStore_applyChangesWithCompletionHandler___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  void (*v4)(void);
  uint8_t v5[16];

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __53__RMProviderStore_applyChangesWithCompletionHandler___block_invoke_15_cold_1();
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_245188000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Applied changes for store", v5, 2u);
    }
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v4();
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");

}

- (void)deleteDeclarationWithIdentifier:(id)a3 completionHandler:(id)a4
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
  v17[2] = __69__RMProviderStore_deleteDeclarationWithIdentifier_completionHandler___block_invoke;
  v17[3] = &unk_25162EF90;
  v11 = v6;
  v18 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[RMBaseStore identifier](self, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __69__RMProviderStore_deleteDeclarationWithIdentifier_completionHandler___block_invoke_16;
  v15[3] = &unk_25162EF18;
  v15[4] = self;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v12, "deleteDeclarationWithIdentifier:storeIdentifier:completionHandler:", v7, v13, v15);

}

void __69__RMProviderStore_deleteDeclarationWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __69__RMProviderStore_deleteDeclarationWithIdentifier_completionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __69__RMProviderStore_deleteDeclarationWithIdentifier_completionHandler___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  void (*v4)(void);
  uint8_t v5[16];

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __69__RMProviderStore_deleteDeclarationWithIdentifier_completionHandler___block_invoke_16_cold_1();
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_245188000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Deleted declaration", v5, 2u);
    }
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v4();
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");

}

- (void)saveDeclaration:(id)a3 completionHandler:(id)a4
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
  v17[2] = __53__RMProviderStore_saveDeclaration_completionHandler___block_invoke;
  v17[3] = &unk_25162EF90;
  v11 = v6;
  v18 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[RMBaseStore identifier](self, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __53__RMProviderStore_saveDeclaration_completionHandler___block_invoke_17;
  v15[3] = &unk_25162EF18;
  v15[4] = self;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v12, "saveDeclaration:storeIdentifier:completionHandler:", v7, v13, v15);

}

void __53__RMProviderStore_saveDeclaration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __53__RMProviderStore_saveDeclaration_completionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __53__RMProviderStore_saveDeclaration_completionHandler___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  void (*v4)(void);
  uint8_t v5[16];

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __53__RMProviderStore_saveDeclaration_completionHandler___block_invoke_17_cold_1();
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_245188000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Saved declaration", v5, 2u);
    }
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v4();
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");

}

- (BOOL)setMetadataValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[4];
  id v27;

  v8 = a3;
  v9 = a4;
  -[RMBaseStore xpcConnection](self, "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __49__RMProviderStore_setMetadataValue_forKey_error___block_invoke;
  v26[3] = &unk_25162F0C8;
  v13 = v9;
  v27 = v13;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = 0;
  -[RMBaseStore identifier](self, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __49__RMProviderStore_setMetadataValue_forKey_error___block_invoke_18;
  v19[3] = &unk_25162F950;
  v19[4] = &v20;
  objc_msgSend(v14, "setMetadataValue:forKey:storeIdentifier:completionHandler:", v8, v13, v15, v19);

  v16 = v21[5];
  if (v16)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[RMProviderStore setMetadataValue:forKey:error:].cold.2();
      if (!a5)
        goto LABEL_8;
    }
    else if (!a5)
    {
      goto LABEL_8;
    }
    v17 = (void *)v21[5];
    if (v17)
      *a5 = objc_retainAutorelease(v17);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    -[RMProviderStore setMetadataValue:forKey:error:].cold.1();
  }
LABEL_8:
  _Block_object_dispose(&v20, 8);

  return v16 == 0;
}

void __49__RMProviderStore_setMetadataValue_forKey_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __49__RMProviderStore_setMetadataValue_forKey_error___block_invoke_cold_1(a1, a2, v4, v5, v6, v7, v8, v9);
}

void __49__RMProviderStore_setMetadataValue_forKey_error___block_invoke_18(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  RMProviderStore *v4;
  BOOL v5;

  v4 = (RMProviderStore *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[RMProviderStore isEqualToStore:](self, "isEqualToStore:", v4);
  }

  return v5;
}

- (BOOL)isEqualToStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RMProviderStore;
  return -[RMBaseStore isEqualToStore:](&v4, sel_isEqualToStore_, a3);
}

void __106__RMProviderStore_createStoreWithType_scope_defaultToInteractive_dataSeparated_options_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed XPC connection while creating store: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __106__RMProviderStore_createStoreWithType_scope_defaultToInteractive_dataSeparated_options_completionHandler___block_invoke_9_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed to create store: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __69__RMProviderStore_removeStoreWithIdentifier_scope_completionHandler___block_invoke_11_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed to remove store: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __53__RMProviderStore_applyChangesWithCompletionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed XPC connection while applying changes for store: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __53__RMProviderStore_applyChangesWithCompletionHandler___block_invoke_15_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed to apply changes for store: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __69__RMProviderStore_deleteDeclarationWithIdentifier_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed XPC connection while deleting declaration: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __69__RMProviderStore_deleteDeclarationWithIdentifier_completionHandler___block_invoke_16_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed to delete declaration: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __53__RMProviderStore_saveDeclaration_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed XPC connection while saving declaration: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __53__RMProviderStore_saveDeclaration_completionHandler___block_invoke_17_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed to save declaration: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)setMetadataValue:forKey:error:.cold.1()
{
  uint64_t v0;
  uint8_t v1[12];
  __int16 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  v2 = 2114;
  v3 = v0;
  _os_log_debug_impl(&dword_245188000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Set metadata key %{public}@: %{public}@", v1, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)setMetadataValue:forKey:error:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_0(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed to set metadata key %{public}@: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __49__RMProviderStore_setMetadataValue_forKey_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_245188000, MEMORY[0x24BDACB70], a3, "Failed XPC connection while setting metadata key %{public}@: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
