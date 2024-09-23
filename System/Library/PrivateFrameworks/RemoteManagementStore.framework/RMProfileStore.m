@implementation RMProfileStore

+ (id)profileStoreForOwner:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  RMProfileStore *v7;

  v3 = (void *)MEMORY[0x24BE7EB30];
  v4 = a3;
  objc_msgSend(v3, "currentManagedDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSharediPad");

  v7 = -[RMProfileStore initWithOwner:scope:]([RMProfileStore alloc], "initWithOwner:scope:", v4, v6 ^ 1u);
  return v7;
}

+ (id)profileStoreForOwner:(id)a3 scope:(int64_t)a4
{
  id v5;
  RMProfileStore *v6;

  v5 = a3;
  v6 = -[RMProfileStore initWithOwner:scope:]([RMProfileStore alloc], "initWithOwner:scope:", v5, a4);

  return v6;
}

- (RMProfileStore)initWithOwner:(id)a3 scope:(int64_t)a4
{
  id v6;
  RMProfileStore *v7;
  uint64_t v8;
  NSString *ownerIdentifier;
  dispatch_queue_t v10;
  OS_dispatch_queue *workQueue;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RMProfileStore;
  v7 = -[RMProfileStore init](&v13, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    ownerIdentifier = v7->_ownerIdentifier;
    v7->_ownerIdentifier = (NSString *)v8;

    v7->_scope = a4;
    v10 = dispatch_queue_create("RMProfileStore", 0);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v10;

  }
  return v7;
}

- (void)providerStoreWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  _QWORD v7[5];
  void (**v8)(id, void *, _QWORD);

  v4 = (void (**)(id, void *, _QWORD))a3;
  -[RMProfileStore providerStore](self, "providerStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[RMProfileStore providerStore](self, "providerStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6, 0);

  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __53__RMProfileStore_providerStoreWithCompletionHandler___block_invoke;
    v7[3] = &unk_25162F7A0;
    v7[4] = self;
    v8 = v4;
    -[RMProfileStore _findProviderStoreWithCompletionHandler:](self, "_findProviderStoreWithCompletionHandler:", v7);

  }
}

void __53__RMProfileStore_providerStoreWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "setProviderStore:", a2);
  objc_msgSend(*(id *)(a1 + 32), "providerStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    goto LABEL_6;
  v5 = *(void **)(a1 + 32);
  v12 = 0;
  objc_msgSend(v5, "_createStoreReturningError:", &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  objc_msgSend(*(id *)(a1 + 32), "setProviderStore:", v6);

  objc_msgSend(*(id *)(a1 + 32), "providerStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {

LABEL_6:
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "providerStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v10, 0);

    return;
  }
  objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    __53__RMProfileStore_providerStoreWithCompletionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)installProfile:(id)a3 declarations:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
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
  objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[RMProfileStore installProfile:declarations:completionHandler:].cold.1((uint64_t)v8, v9, v11);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __64__RMProfileStore_installProfile_declarations_completionHandler___block_invoke;
  v15[3] = &unk_25162F7F0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  -[RMProfileStore providerStoreWithCompletionHandler:](self, "providerStoreWithCompletionHandler:", v15);

}

void __64__RMProfileStore_installProfile_declarations_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __64__RMProfileStore_installProfile_declarations_completionHandler___block_invoke_2;
  v11[3] = &unk_25162F7C8;
  v8 = a1[4];
  v12 = v5;
  v13 = v8;
  v14 = v6;
  v17 = a1[7];
  v15 = a1[5];
  v16 = a1[6];
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, v11);

}

uint64_t __64__RMProfileStore_installProfile_declarations_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v3;

  if (*(_QWORD *)(a1 + 32))
    return objc_msgSend(*(id *)(a1 + 40), "_applyDeclarationsForPayload:declarations:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __64__RMProfileStore_installProfile_declarations_completionHandler___block_invoke_2_cold_1(a1);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

- (void)removeProfile:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[RMProfileStore removeProfile:completionHandler:].cold.1();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__RMProfileStore_removeProfile_completionHandler___block_invoke;
  v11[3] = &unk_25162F840;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  -[RMProfileStore providerStoreWithCompletionHandler:](self, "providerStoreWithCompletionHandler:", v11);

}

void __50__RMProfileStore_removeProfile_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__RMProfileStore_removeProfile_completionHandler___block_invoke_2;
  block[3] = &unk_25162F818;
  v8 = a1[4];
  v12 = v5;
  v13 = v8;
  v14 = v6;
  v16 = a1[6];
  v15 = a1[5];
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __50__RMProfileStore_removeProfile_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v3;

  if (*(_QWORD *)(a1 + 32))
    return objc_msgSend(*(id *)(a1 + 40), "_removeDeclarationsForPayload:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __50__RMProfileStore_removeProfile_completionHandler___block_invoke_2_cold_1(a1);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)observerStoreWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  _QWORD v7[5];
  void (**v8)(id, void *, _QWORD);

  v4 = (void (**)(id, void *, _QWORD))a3;
  -[RMProfileStore observerStore](self, "observerStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[RMProfileStore observerStore](self, "observerStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6, 0);

  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __53__RMProfileStore_observerStoreWithCompletionHandler___block_invoke;
    v7[3] = &unk_25162F770;
    v7[4] = self;
    v8 = v4;
    -[RMProfileStore _findObserverStoreWithCompletionHandler:](self, "_findObserverStoreWithCompletionHandler:", v7);

  }
}

void __53__RMProfileStore_observerStoreWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setObserverStore:", a2);
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "observerStore");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v4 + 16))(v4, v5, 0);

  }
}

- (void)declarationIdentifiersForProfilePayloadIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __87__RMProfileStore_declarationIdentifiersForProfilePayloadIdentifiers_completionHandler___block_invoke;
  v10[3] = &unk_25162F868;
  v11 = v6;
  v12 = v7;
  v10[4] = self;
  v8 = v6;
  v9 = v7;
  -[RMProfileStore observerStoreWithCompletionHandler:](self, "observerStoreWithCompletionHandler:", v10);

}

void __87__RMProfileStore_declarationIdentifiersForProfilePayloadIdentifiers_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__RMProfileStore_declarationIdentifiersForProfilePayloadIdentifiers_completionHandler___block_invoke_2;
  block[3] = &unk_25162F818;
  v8 = a1[4];
  v12 = v5;
  v13 = v8;
  v14 = v6;
  v16 = a1[6];
  v15 = a1[5];
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __87__RMProfileStore_declarationIdentifiersForProfilePayloadIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)objc_opt_new();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v3 = *(id *)(a1 + 56);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v28 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          v9 = *(void **)(a1 + 40);
          objc_msgSend(v9, "observerStore");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 0;
          objc_msgSend(v9, "_oldDeclarationKeysForPayload:store:error:", v8, v10, &v26);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v26;

          if (v12)
          {
            objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              __87__RMProfileStore_declarationIdentifiersForProfilePayloadIdentifiers_completionHandler___block_invoke_2_cold_2();

            (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
            goto LABEL_21;
          }
          objc_msgSend(v11, "allObjects");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObjectsFromArray:", v13);

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v5)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v2, "count"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v14 = v2;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "declarationIdentifier", (_QWORD)v22);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      }
      while (v16);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_21:

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __87__RMProfileStore_declarationIdentifiersForProfilePayloadIdentifiers_completionHandler___block_invoke_2_cold_1(a1);

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

- (void)_findProviderStoreWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  int64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[RMProfileStore _findProviderStoreWithCompletionHandler:].cold.1();

  v6 = -[RMProfileStore scope](self, "scope");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__RMProfileStore__findProviderStoreWithCompletionHandler___block_invoke;
  v8[3] = &unk_25162F890;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  +[RMProviderStore storesWithScope:completionHandler:](RMProviderStore, "storesWithScope:completionHandler:", v6, v8);

}

void __58__RMProfileStore__findProviderStoreWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v19 = v6;
      v20 = v5;
      v10 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v12, "type", v19, v20, (_QWORD)v21) == 2)
          {
            objc_msgSend(v12, "metadataValueForKey:error:", CFSTR("RMProfileStoreIdentifier"), 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "ownerIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v13, "isEqualToString:", v14);

            if (v15)
            {
              v16 = v12;

              goto LABEL_17;
            }

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v9)
          continue;
        break;
      }
      v16 = 0;
LABEL_17:
      v6 = v19;
      v5 = v20;
    }
    else
    {
      v16 = 0;
    }

    objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      __58__RMProfileStore__findProviderStoreWithCompletionHandler___block_invoke_cold_2(v16);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __58__RMProfileStore__findProviderStoreWithCompletionHandler___block_invoke_cold_1(a1);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)_findObserverStoreWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  int64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[RMProfileStore _findObserverStoreWithCompletionHandler:].cold.1();

  v6 = -[RMProfileStore scope](self, "scope");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__RMProfileStore__findObserverStoreWithCompletionHandler___block_invoke;
  v8[3] = &unk_25162F890;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  +[RMObserverStore storesWithScope:completionHandler:](RMObserverStore, "storesWithScope:completionHandler:", v6, v8);

}

void __58__RMProfileStore__findObserverStoreWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __58__RMProfileStore__findObserverStoreWithCompletionHandler___block_invoke_cold_1(a1);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_24;
  }
  v24 = v6;
  v25 = v5;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v9)
  {
LABEL_12:

LABEL_20:
    objc_msgSend(MEMORY[0x24BE7EB20], "profileStore", v24, v25);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      __58__RMProfileStore__findObserverStoreWithCompletionHandler___block_invoke_cold_2(a1, v20);

    v21 = (void *)MEMORY[0x24BE7EB08];
    v22 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "ownerIdentifier");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "createManagementSourceNotFoundErrorWithIdentifier:", v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v22 + 16))(v22, 0, v23);

    goto LABEL_23;
  }
  v10 = v9;
  v11 = *(_QWORD *)v27;
LABEL_4:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v27 != v11)
      objc_enumerationMutation(v8);
    v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
    if (objc_msgSend(v13, "type", v24, v25, (_QWORD)v26) != 2)
      goto LABEL_10;
    objc_msgSend(v13, "metadataValueForKey:error:", CFSTR("RMProfileStoreIdentifier"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "ownerIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqualToString:", v15);

    if ((v16 & 1) != 0)
      break;

LABEL_10:
    if (v10 == ++v12)
    {
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v10)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  v18 = v13;

  if (!v18)
    goto LABEL_20;
  objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    __58__RMProfileStore__findObserverStoreWithCompletionHandler___block_invoke_cold_3(v18);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_23:
  v7 = v24;
  v5 = v25;

LABEL_24:
}

- (id)_createStoreReturningError:(id *)a3
{
  NSObject *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int64_t v20;
  id v21;
  NSObject *v22;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[RMProfileStore _createStoreReturningError:].cold.4();

  v6 = (void *)objc_opt_new();
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__2;
  v42 = __Block_byref_object_dispose__2;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__2;
  v36 = __Block_byref_object_dispose__2;
  v37 = 0;
  v7 = -[RMProfileStore scope](self, "scope");
  v8 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __45__RMProfileStore__createStoreReturningError___block_invoke;
  v28[3] = &unk_25162F8B8;
  v30 = &v38;
  v31 = &v32;
  v9 = v6;
  v29 = v9;
  +[RMProviderStore createStoreWithType:scope:defaultToInteractive:dataSeparated:options:completionHandler:](RMProviderStore, "createStoreWithType:scope:defaultToInteractive:dataSeparated:options:completionHandler:", 2, v7, 0, 0, 0, v28);
  objc_msgSend(v9, "waitForCompletion");
  if (v39[5])
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[RMProfileStore _createStoreReturningError:].cold.3();

    if (a3 && (v11 = (void *)v39[5]) != 0)
    {
      v12 = 0;
      *a3 = objc_retainAutorelease(v11);
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v13 = (void *)v33[5];
    -[RMProfileStore ownerIdentifier](self, "ownerIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v15 = objc_msgSend(v13, "setMetadataValue:forKey:error:", v14, CFSTR("RMProfileStoreIdentifier"), &v27);
    v16 = v27;

    if ((v15 & 1) != 0)
    {
      v12 = (id)v33[5];
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[RMProfileStore _createStoreReturningError:].cold.2();

      v18 = (void *)objc_opt_new();
      objc_msgSend((id)v33[5], "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[RMProfileStore scope](self, "scope");
      v24[0] = v8;
      v24[1] = 3221225472;
      v24[2] = __45__RMProfileStore__createStoreReturningError___block_invoke_23;
      v24[3] = &unk_25162F8E0;
      v26 = &v38;
      v21 = v18;
      v25 = v21;
      +[RMProviderStore removeStoreWithIdentifier:scope:completionHandler:](RMProviderStore, "removeStoreWithIdentifier:scope:completionHandler:", v19, v20, v24);

      objc_msgSend(v21, "waitForCompletion");
      if (v39[5])
      {
        objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[RMProfileStore _createStoreReturningError:].cold.1();

      }
      if (a3 && v16)
        *a3 = objc_retainAutorelease(v16);

      v12 = 0;
    }

  }
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  return v12;
}

void __45__RMProfileStore__createStoreReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  objc_msgSend(*(id *)(a1 + 32), "complete");
}

void __45__RMProfileStore__createStoreReturningError___block_invoke_23(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "complete");

}

- (void)_applyDeclarationsForPayload:(id)a3 declarations:(id)a4 completionHandler:(id)a5
{
  NSObject *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void (**v57)(id, id);
  id v58;
  id obj;
  id v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  _QWORD v66[4];
  id v67;
  void (**v68)(id, id);
  id v69;
  _QWORD v70[5];
  id v71;
  uint64_t *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[4];
  id v78;
  id v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  uint8_t v96[128];
  uint8_t buf[4];
  void *v98;
  __int16 v99;
  uint64_t v100;
  uint8_t v101[4];
  uint64_t v102;
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  v56 = a3;
  v58 = a4;
  v57 = (void (**)(id, id))a5;
  objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[RMProfileStore _applyDeclarationsForPayload:declarations:completionHandler:].cold.7(v58);

  v63 = (void *)objc_opt_new();
  v95 = 0;
  v62 = -[RMProfileStore _newDeclarationsMap:error:](self, "_newDeclarationsMap:error:", v58, &v95);
  v8 = v95;
  if (v8)
  {
    v9 = v8;
    objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[RMProfileStore _applyDeclarationsForPayload:declarations:completionHandler:].cold.6();

    v57[2](v57, v9);
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v62, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    -[RMProfileStore providerStore](self, "providerStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = 0;
    -[RMProfileStore _oldDeclarationKeysForPayload:store:error:](self, "_oldDeclarationKeysForPayload:store:error:", v56, v13, &v94);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v94;

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __87__RMProfileStore_declarationIdentifiersForProfilePayloadIdentifiers_completionHandler___block_invoke_2_cold_2();

      v57[2](v57, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v55, "count"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = 0;
      v91 = 0;
      v92 = 0;
      +[RMStoreDeclarationKey synchronizeOldKeys:newKeys:returningUnchangedKeys:returningApplyKeys:returningRemoveKeys:](RMStoreDeclarationKey, "synchronizeOldKeys:newKeys:returningUnchangedKeys:returningApplyKeys:returningRemoveKeys:", v54, v55, &v93, &v92, &v91);
      v53 = v93;
      v15 = v92;
      v52 = v91;
      objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[RMProfileStore _applyDeclarationsForPayload:declarations:completionHandler:].cold.4(v15);

      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      obj = v15;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v103, 16);
      if (v17)
      {
        v60 = *(id *)v88;
        do
        {
          v18 = 0;
          do
          {
            if (*(id *)v88 != v60)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v18);
            v20 = (void *)MEMORY[0x24952F49C]();
            objc_msgSend(v19, "applyKey");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (void *)MEMORY[0x24BE7EBD0];
            objc_msgSend(v62, "objectForKeyedSubscript:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "loadData:serializationType:error:", v23, 1, 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v25 = (void *)objc_opt_new();
            v81 = 0;
            v82 = &v81;
            v83 = 0x3032000000;
            v84 = __Block_byref_object_copy__2;
            v85 = __Block_byref_object_dispose__2;
            v86 = 0;
            objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v24, "declarationIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[RMProfileStore _applyDeclarationsForPayload:declarations:completionHandler:].cold.3(v27, v101, &v102, v26);
            }

            -[RMProfileStore providerStore](self, "providerStore");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v77[0] = MEMORY[0x24BDAC760];
            v77[1] = 3221225472;
            v77[2] = __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke;
            v77[3] = &unk_25162F908;
            v29 = v24;
            v78 = v29;
            v80 = &v81;
            v30 = v25;
            v79 = v30;
            objc_msgSend(v28, "saveDeclaration:completionHandler:", v29, v77);

            objc_msgSend(v30, "waitForCompletion");
            if (v82[5])
            {
              objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v21, "declarationIdentifier");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v98 = v35;
                v99 = 2114;
                v100 = 0;
                _os_log_error_impl(&dword_245188000, v31, OS_LOG_TYPE_ERROR, "Failed to save declaration %{public}@: %{public}@", buf, 0x16u);

              }
              objc_msgSend(v21, "declarationIdentifier");
              v32 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "addObject:", v32);

              objc_msgSend(v19, "replaceKey");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v32) = v33 == 0;

              if ((v32 & 1) == 0)
              {
                objc_msgSend(v19, "replaceKey");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "addObject:", v34);

              }
            }
            else
            {
              objc_msgSend(v64, "addObject:", v21);
            }

            _Block_object_dispose(&v81, 8);
            objc_autoreleasePoolPop(v20);
            ++v18;
          }
          while (v17 != v18);
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v103, 16);
        }
        while (v17);
      }

      objc_msgSend(v64, "unionSet:", v53);
      objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        -[RMProfileStore _applyDeclarationsForPayload:declarations:completionHandler:].cold.2(v52);

      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v61 = v52;
      v37 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v73, v96, 16);
      if (v37)
      {
        v38 = *(_QWORD *)v74;
        do
        {
          v39 = 0;
          do
          {
            if (*(_QWORD *)v74 != v38)
              objc_enumerationMutation(v61);
            v40 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v39);
            v41 = (void *)MEMORY[0x24952F49C]();
            v42 = (void *)objc_opt_new();
            v81 = 0;
            v82 = &v81;
            v83 = 0x3032000000;
            v84 = __Block_byref_object_copy__2;
            v85 = __Block_byref_object_dispose__2;
            v86 = 0;
            -[RMProfileStore providerStore](self, "providerStore");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "declarationIdentifier");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v70[0] = MEMORY[0x24BDAC760];
            v70[1] = 3221225472;
            v70[2] = __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke_29;
            v70[3] = &unk_25162F908;
            v70[4] = v40;
            v72 = &v81;
            v45 = v42;
            v71 = v45;
            objc_msgSend(v43, "deleteDeclarationWithIdentifier:completionHandler:", v44, v70);

            objc_msgSend(v45, "waitForCompletion");
            if (v82[5])
            {
              objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
              v46 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v40, "declarationIdentifier");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v98 = v48;
                v99 = 2114;
                v100 = 0;
                _os_log_error_impl(&dword_245188000, v46, OS_LOG_TYPE_ERROR, "Failed to delete declaration %{public}@: %{public}@", buf, 0x16u);

              }
              objc_msgSend(v40, "declarationIdentifier");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "addObject:", v47);

              objc_msgSend(v64, "addObject:", v40);
            }

            _Block_object_dispose(&v81, 8);
            objc_autoreleasePoolPop(v41);
            ++v39;
          }
          while (v37 != v39);
          v37 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v73, v96, 16);
        }
        while (v37);
      }

      v69 = 0;
      -[RMProfileStore _saveDeclarationKeysForPayload:keys:error:](self, "_saveDeclarationKeysForPayload:keys:error:", v56, v64, &v69);
      v49 = v69;
      if (v49)
      {
        objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          -[RMProfileStore _applyDeclarationsForPayload:declarations:completionHandler:].cold.1();

      }
      -[RMProfileStore providerStore](self, "providerStore");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = MEMORY[0x24BDAC760];
      v66[1] = 3221225472;
      v66[2] = __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke_30;
      v66[3] = &unk_25162F3C0;
      v9 = v49;
      v67 = v9;
      v68 = v57;
      objc_msgSend(v51, "applyChangesWithCompletionHandler:", v66);

    }
  }

}

void __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke_cold_1(a1);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  objc_msgSend(*(id *)(a1 + 40), "complete");
}

void __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke_29_cold_1(a1);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  objc_msgSend(*(id *)(a1 + 40), "complete");
}

void __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke_30(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke_30_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_removeDeclarationsForPayload:(id)a3 completionHandler:(id)a4
{
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id obj;
  void *v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[5];
  id v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  uint64_t v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v27 = a3;
  v26 = a4;
  objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[RMProfileStore _removeDeclarationsForPayload:completionHandler:].cold.5();

  v30 = (void *)objc_opt_new();
  -[RMProfileStore providerStore](self, "providerStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  -[RMProfileStore _oldDeclarationKeysForPayload:store:error:](self, "_oldDeclarationKeysForPayload:store:error:", v27, v6, &v50);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v50;

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v25, "count"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[RMProfileStore _removeDeclarationsForPayload:completionHandler:].cold.3(v25);

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = v25;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v47;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v47 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v12);
          v14 = (void *)MEMORY[0x24952F49C]();
          v15 = (void *)objc_opt_new();
          v40 = 0;
          v41 = &v40;
          v42 = 0x3032000000;
          v43 = __Block_byref_object_copy__2;
          v44 = __Block_byref_object_dispose__2;
          v45 = 0;
          -[RMProfileStore providerStore](self, "providerStore");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "declarationIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v37[0] = MEMORY[0x24BDAC760];
          v37[1] = 3221225472;
          v37[2] = __66__RMProfileStore__removeDeclarationsForPayload_completionHandler___block_invoke;
          v37[3] = &unk_25162F908;
          v37[4] = v13;
          v39 = &v40;
          v18 = v15;
          v38 = v18;
          objc_msgSend(v16, "deleteDeclarationWithIdentifier:completionHandler:", v17, v37);

          objc_msgSend(v18, "waitForCompletion");
          if (v41[5])
          {
            objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v13, "declarationIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v52 = v21;
              v53 = 2114;
              v54 = 0;
              _os_log_error_impl(&dword_245188000, v19, OS_LOG_TYPE_ERROR, "Failed to delete declaration %{public}@: %{public}@", buf, 0x16u);

            }
            objc_msgSend(v13, "declarationIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "addObject:", v20);

            objc_msgSend(v29, "addObject:", v13);
          }

          _Block_object_dispose(&v40, 8);
          objc_autoreleasePoolPop(v14);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v29, "count"))
    {
      v35 = 0;
      -[RMProfileStore _saveDeclarationKeysForPayload:keys:error:](self, "_saveDeclarationKeysForPayload:keys:error:", v27, v29, &v35);
      v22 = v35;
      if (v22)
      {
        objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[RMProfileStore _applyDeclarationsForPayload:declarations:completionHandler:].cold.1();
LABEL_27:

      }
    }
    else
    {
      v36 = 0;
      -[RMProfileStore _removeDeclarationKeysForPayload:error:](self, "_removeDeclarationKeysForPayload:error:", v27, &v36);
      v22 = v36;
      if (v22)
      {
        objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[RMProfileStore _removeDeclarationsForPayload:completionHandler:].cold.1();
        goto LABEL_27;
      }
    }
    -[RMProfileStore providerStore](self, "providerStore");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __66__RMProfileStore__removeDeclarationsForPayload_completionHandler___block_invoke_31;
    v32[3] = &unk_25162F3C0;
    v7 = v22;
    v33 = v7;
    v34 = v26;
    objc_msgSend(v24, "applyChangesWithCompletionHandler:", v32);

    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __87__RMProfileStore_declarationIdentifiersForProfilePayloadIdentifiers_completionHandler___block_invoke_2_cold_2();

  (*((void (**)(id, id))v26 + 2))(v26, v7);
LABEL_29:

}

void __66__RMProfileStore__removeDeclarationsForPayload_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke_29_cold_1(a1);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  objc_msgSend(*(id *)(a1 + 40), "complete");
}

void __66__RMProfileStore__removeDeclarationsForPayload_completionHandler___block_invoke_31(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke_30_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_newDeclarationsMap:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id *v22;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v22 = a4;
    obj = v8;
    v11 = *(_QWORD *)v26;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v11)
        objc_enumerationMutation(obj);
      v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v12);
      v14 = (void *)MEMORY[0x24952F49C]();
      v24 = 0;
      objc_msgSend(MEMORY[0x24BE7EBD0], "loadData:serializationType:error:", v13, 1, &v24);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v24;
      if (v16)
        break;
      -[RMProfileStore providerStore](self, "providerStore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = +[RMStoreDeclarationKey newDeclarationKeyWithSubscriberIdentifier:store:declaration:](RMStoreDeclarationKey, "newDeclarationKeyWithSubscriberIdentifier:store:declaration:", CFSTR("ProfileSubscriber"), v17, v15);

      objc_msgSend(v7, "setObject:forKey:", v13, v18);
      objc_autoreleasePoolPop(v14);
      if (v10 == ++v12)
      {
        v8 = obj;
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v19 = v16;

    objc_autoreleasePoolPop(v14);
    v8 = obj;

    if (v22)
    {
      v20 = objc_retainAutorelease(v19);
      v7 = 0;
      *v22 = v20;
      v19 = v20;
      goto LABEL_12;
    }
    v7 = 0;
  }
  else
  {
LABEL_9:
    v19 = 0;
    v20 = v8;
LABEL_12:

  }
  return v7;
}

- (id)_oldDeclarationKeysForPayload:(id)a3 store:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  -[RMProfileStore _metadataKeyForPayload:](self, "_metadataKeyForPayload:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v8, "metadataValueForKey:error:", v9, &v29);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v29;
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[RMProfileStore _oldDeclarationKeysForPayload:store:error:].cold.4();

    if (a5)
      *a5 = objc_retainAutorelease(v11);
    goto LABEL_23;
  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[RMProfileStore _oldDeclarationKeysForPayload:store:error:].cold.1();
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[RMProfileStore _oldDeclarationKeysForPayload:store:error:].cold.3();
LABEL_22:

LABEL_23:
    v21 = (void *)objc_opt_new();
    goto LABEL_24;
  }
  v24 = v8;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        v19 = +[RMStoreDeclarationKey newDeclarationKey:](RMStoreDeclarationKey, "newDeclarationKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
        objc_msgSend(v13, "addObject:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    -[RMProfileStore _oldDeclarationKeysForPayload:store:error:].cold.2();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v24;
LABEL_24:

  return v21;
}

- (BOOL)_saveDeclarationKeysForPayload:(id)a3 keys:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v15), "key");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }

  -[RMProfileStore _metadataKeyForPayload:](self, "_metadataKeyForPayload:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMProfileStore providerStore](self, "providerStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v19 = objc_msgSend(v18, "setMetadataValue:forKey:error:", v10, v17, &v24);
  v20 = v24;

  objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if ((v19 & 1) != 0)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[RMProfileStore _saveDeclarationKeysForPayload:keys:error:].cold.1();

  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[RMProfileStore _saveDeclarationKeysForPayload:keys:error:].cold.2();

    if (a5 && v20)
      *a5 = objc_retainAutorelease(v20);
  }

  return v19;
}

- (BOOL)_removeDeclarationKeysForPayload:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v13;

  -[RMProfileStore _metadataKeyForPayload:](self, "_metadataKeyForPayload:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMProfileStore providerStore](self, "providerStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v8 = objc_msgSend(v7, "setMetadataValue:forKey:error:", 0, v6, &v13);
  v9 = v13;

  objc_msgSend(MEMORY[0x24BE7EB20], "profileStore");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[RMProfileStore _removeDeclarationKeysForPayload:error:].cold.1();

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[RMProfileStore _removeDeclarationKeysForPayload:error:].cold.2();

    if (a4 && v9)
      *a4 = objc_retainAutorelease(v9);
  }

  return v8;
}

- (id)_metadataKeyForPayload:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DMCSHA256Hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "DMCHexString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("RMProfileStore"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)ownerIdentifier
{
  return self->_ownerIdentifier;
}

- (void)setOwnerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (RMProviderStore)providerStore
{
  return self->_providerStore;
}

- (void)setProviderStore:(id)a3
{
  objc_storeStrong((id *)&self->_providerStore, a3);
}

- (RMObserverStore)observerStore
{
  return self->_observerStore;
}

- (void)setObserverStore:(id)a3
{
  objc_storeStrong((id *)&self->_observerStore, a3);
}

- (int64_t)scope
{
  return self->_scope;
}

- (void)setScope:(int64_t)a3
{
  self->_scope = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_observerStore, 0);
  objc_storeStrong((id *)&self->_providerStore, 0);
  objc_storeStrong((id *)&self->_ownerIdentifier, 0);
}

void __53__RMProfileStore_providerStoreWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Failed to create provider store: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)installProfile:(uint64_t)a1 declarations:(void *)a2 completionHandler:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = 138543618;
  v5 = a1;
  v6 = 2048;
  v7 = objc_msgSend(a2, "count");
  _os_log_debug_impl(&dword_245188000, a3, OS_LOG_TYPE_DEBUG, "Install profile %{public}@ with %lu declarations", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_3_1();
}

void __64__RMProfileStore_installProfile_declarations_completionHandler___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 40), "ownerIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_245188000, v2, v3, "Failed to install profile for owner %{public}@: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_2();
}

- (void)removeProfile:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1(&dword_245188000, v0, v1, "Remove profile %{public}@", v2);
  OUTLINED_FUNCTION_3();
}

void __50__RMProfileStore_removeProfile_completionHandler___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 40), "ownerIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_245188000, v2, v3, "Failed to remove profile for owner %{public}@: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_2();
}

void __87__RMProfileStore_declarationIdentifiersForProfilePayloadIdentifiers_completionHandler___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 40), "ownerIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_245188000, v2, v3, "Failed to get declarations for owner %{public}@: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_2();
}

void __87__RMProfileStore_declarationIdentifiersForProfilePayloadIdentifiers_completionHandler___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Failed to get old declaration keys: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_findProviderStoreWithCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_245188000, v0, v1, "Find provider store", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __58__RMProfileStore__findProviderStoreWithCompletionHandler___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_5_0(a1), "ownerIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_245188000, v2, v3, "Failed to lookup provider store for owner %{public}@: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_2();
}

void __58__RMProfileStore__findProviderStoreWithCompletionHandler___block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_1(&dword_245188000, v2, v3, "Found provider store with identifier: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_1();
}

- (void)_findObserverStoreWithCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_245188000, v0, v1, "Find observer store", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __58__RMProfileStore__findObserverStoreWithCompletionHandler___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_5_0(a1), "ownerIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_245188000, v2, v3, "Failed to lookup observer store for owner %{public}@: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_2();
}

void __58__RMProfileStore__findObserverStoreWithCompletionHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];

  objc_msgSend((id)OUTLINED_FUNCTION_5_0(a1), "ownerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_245188000, a2, OS_LOG_TYPE_ERROR, "No observer store with identifier: %{public}@", v4, 0xCu);

  OUTLINED_FUNCTION_3_1();
}

void __58__RMProfileStore__findObserverStoreWithCompletionHandler___block_invoke_cold_3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_1(&dword_245188000, v2, v3, "Found observer store with identifier: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_1();
}

- (void)_createStoreReturningError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Failed to remove provider store: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_createStoreReturningError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Failed to set provider store metadata: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_createStoreReturningError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Failed to create provider store: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_createStoreReturningError:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_245188000, v0, v1, "Creating provider store", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_applyDeclarationsForPayload:declarations:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Failed to save declaration manifest: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_applyDeclarationsForPayload:(void *)a1 declarations:completionHandler:.cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_1(&dword_245188000, v1, v2, "Removing %lu declarations", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_1();
}

- (void)_applyDeclarationsForPayload:(_QWORD *)a3 declarations:(NSObject *)a4 completionHandler:.cold.3(void *a1, uint8_t *a2, _QWORD *a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138543362;
  *a3 = a1;
  OUTLINED_FUNCTION_2_1(&dword_245188000, a4, (uint64_t)a3, "Saving declaration %{public}@", a2);

}

- (void)_applyDeclarationsForPayload:(void *)a1 declarations:completionHandler:.cold.4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_1(&dword_245188000, v1, v2, "Install %lu declarations", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_1();
}

- (void)_applyDeclarationsForPayload:declarations:completionHandler:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Failed to build declaration map: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_applyDeclarationsForPayload:(void *)a1 declarations:completionHandler:.cold.7(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_1(&dword_245188000, v1, v2, "Apply profile payload with %lu declarations", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_1();
}

void __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_5_0(a1), "declarationIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_1(&dword_245188000, v2, v3, "Saved declaration %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_1();
}

void __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke_29_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_5_0(a1), "declarationIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_1(&dword_245188000, v2, v3, "Removed declaration %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_1();
}

void __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke_30_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Failed to apply declarations: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_removeDeclarationsForPayload:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Failed to remove declaration manifest: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_removeDeclarationsForPayload:(void *)a1 completionHandler:.cold.3(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_1(&dword_245188000, v1, v2, "Removing %lu declarations", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_1();
}

- (void)_removeDeclarationsForPayload:completionHandler:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_245188000, v0, v1, "Remove profile payload declarations", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_oldDeclarationKeysForPayload:store:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1(&dword_245188000, v0, v1, "Empty declaration manifest for key %{public}@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)_oldDeclarationKeysForPayload:store:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1(&dword_245188000, v0, v1, "Read declaration manifest for key %{public}@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)_oldDeclarationKeysForPayload:store:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Invalid saved declaration manifest for key %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_oldDeclarationKeysForPayload:store:error:.cold.4()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7_0(&dword_245188000, v0, (uint64_t)v0, "Failed to read declaration manifest for key %{public}@: %{public}@", v1);
  OUTLINED_FUNCTION_3();
}

- (void)_saveDeclarationKeysForPayload:keys:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1(&dword_245188000, v0, v1, "Saved declaration manifest for key %{public}@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)_saveDeclarationKeysForPayload:keys:error:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7_0(&dword_245188000, v0, (uint64_t)v0, "Failed to save declaration manifest for key %{public}@: %{public}@", v1);
  OUTLINED_FUNCTION_3();
}

- (void)_removeDeclarationKeysForPayload:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1(&dword_245188000, v0, v1, "Removed declaration manifest for key %{public}@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)_removeDeclarationKeysForPayload:error:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7_0(&dword_245188000, v0, (uint64_t)v0, "Failed to remove declaration manifest for key %{public}@: %{public}@", v1);
  OUTLINED_FUNCTION_3();
}

@end
