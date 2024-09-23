@implementation RMConfigurationSubscriberDelegate

+ (id)sharedDelegateWithApplicators:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__RMConfigurationSubscriberDelegate_sharedDelegateWithApplicators___block_invoke;
  block[3] = &unk_25162F488;
  v9 = v3;
  v4 = sharedDelegateWithApplicators__onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&sharedDelegateWithApplicators__onceToken, block);
  v6 = (id)sharedDelegateWithApplicators__delegate;

  return v6;
}

void __67__RMConfigurationSubscriberDelegate_sharedDelegateWithApplicators___block_invoke(uint64_t a1)
{
  RMConfigurationSubscriberDelegate *v1;
  void *v2;

  v1 = -[RMConfigurationSubscriberDelegate initWithApplicators:]([RMConfigurationSubscriberDelegate alloc], "initWithApplicators:", *(_QWORD *)(a1 + 32));
  v2 = (void *)sharedDelegateWithApplicators__delegate;
  sharedDelegateWithApplicators__delegate = (uint64_t)v1;

}

- (RMConfigurationSubscriberDelegate)initWithApplicators:(id)a3
{
  id v4;
  RMConfigurationSubscriberDelegate *v5;
  RMConfigurationSubscriberDelegate *v6;
  id v7;
  NSDictionary *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  objc_class *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  NSDictionary *applicatorClassNameByConfigurationType;
  dispatch_queue_t v22;
  OS_dispatch_queue *applicatorQueue;
  uint64_t v24;
  NSConditionLock *applyLock;
  RMConfigurationSubscriberDelegate *v27;
  id v28;
  objc_super v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)RMConfigurationSubscriberDelegate;
  v5 = -[RMConfigurationSubscriberDelegate init](&v29, sel_init);
  v6 = v5;
  if (v5)
  {
    v27 = v5;
    v28 = v4;
    v7 = v4;
    v8 = (NSDictionary *)objc_opt_new();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(v9);
          v14 = *(objc_class **)(*((_QWORD *)&v34 + 1) + 8 * i);
          NSStringFromClass(v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          -[objc_class supportedConfigurationTypes](v14, "supportedConfigurationTypes");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v31;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v31 != v19)
                  objc_enumerationMutation(v16);
                -[NSDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v15, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j), v27);
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            }
            while (v18);
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v11);
    }

    v6 = v27;
    applicatorClassNameByConfigurationType = v27->_applicatorClassNameByConfigurationType;
    v27->_applicatorClassNameByConfigurationType = v8;

    v22 = dispatch_queue_create("com.apple.rmstore.applicator", 0);
    applicatorQueue = v27->_applicatorQueue;
    v27->_applicatorQueue = (OS_dispatch_queue *)v22;

    v24 = objc_msgSend(objc_alloc(MEMORY[0x24BDD14D0]), "initWithCondition:", 0);
    applyLock = v27->_applyLock;
    v27->_applyLock = (NSConditionLock *)v24;

    v4 = v28;
  }

  return v6;
}

- (void)didFetchConfigurationsByType:(id)a3 storesByIdentifier:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSConditionLock *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  id v20;
  NSConditionLock *v21;
  _QWORD block[4];
  NSConditionLock *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  int64_t v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberDelegate");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v29 = v10;
    _os_log_impl(&dword_245188000, v13, OS_LOG_TYPE_DEFAULT, "Did fetch configurations by type: %{public}@", buf, 0xCu);
  }

  v14 = self->_applyLock;
  if (!-[NSConditionLock tryLockWhenCondition:](v14, "tryLockWhenCondition:", 0))
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberDelegate");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_245188000, v15, OS_LOG_TYPE_DEFAULT, "Waiting for previous fetch to finish...", buf, 2u);
    }

    -[NSConditionLock lockWhenCondition:](v14, "lockWhenCondition:", 0);
  }
  -[NSConditionLock unlockWithCondition:](v14, "unlockWithCondition:", 1);
  -[RMConfigurationSubscriberDelegate _configurationsByApplicatorClassNameForConfigurationsByType:](self, "_configurationsByApplicatorClassNameForConfigurationsByType:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __109__RMConfigurationSubscriberDelegate_didFetchConfigurationsByType_storesByIdentifier_scope_completionHandler___block_invoke;
  v25[3] = &unk_25162F500;
  v26 = v11;
  v27 = a5;
  v25[4] = self;
  v18 = v11;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v25);
  -[RMConfigurationSubscriberDelegate applicatorQueue](self, "applicatorQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = v17;
  block[1] = 3221225472;
  block[2] = __109__RMConfigurationSubscriberDelegate_didFetchConfigurationsByType_storesByIdentifier_scope_completionHandler___block_invoke_12;
  block[3] = &unk_25162F528;
  v23 = v14;
  v24 = v12;
  v20 = v12;
  v21 = v14;
  dispatch_async(v19, block);

}

void __109__RMConfigurationSubscriberDelegate_didFetchConfigurationsByType_storesByIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "applicatorQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __109__RMConfigurationSubscriberDelegate_didFetchConfigurationsByType_storesByIdentifier_scope_completionHandler___block_invoke_2;
  v11[3] = &unk_25162F4D8;
  v8 = *(void **)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 48);
  v12 = v5;
  v13 = v6;
  v14 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, v11);

}

void __109__RMConfigurationSubscriberDelegate_didFetchConfigurationsByType_storesByIdentifier_scope_completionHandler___block_invoke_2(uint64_t a1)
{
  Class v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  Class v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = NSClassFromString(*(NSString **)(a1 + 32));
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberDelegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD17C8], "rms_stringWithScope:", *(_QWORD *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class supportedConfigurationTypes](v2, "supportedConfigurationTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v5;
    v19 = 2114;
    v20 = v6;
    v21 = 2114;
    v22 = v7;
    _os_log_impl(&dword_245188000, v4, OS_LOG_TYPE_DEFAULT, "Applicator %{public}@ in %{public}@ scope starting processing configurations of types: %{public}@", buf, 0x20u);

  }
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __109__RMConfigurationSubscriberDelegate_didFetchConfigurationsByType_storesByIdentifier_scope_completionHandler___block_invoke_9;
  v13[3] = &unk_25162F4B0;
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(id *)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 56);
  v14 = v11;
  v15 = v12;
  v16 = v2;
  objc_msgSend(v3, "applyConfigurations:storesByIdentifier:scope:completionHandler:", v10, v8, v9, v13);

}

void __109__RMConfigurationSubscriberDelegate_didFetchConfigurationsByType_storesByIdentifier_scope_completionHandler___block_invoke_9(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberDelegate");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD17C8], "rms_stringWithScope:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "supportedConfigurationTypes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543874;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_245188000, v2, OS_LOG_TYPE_DEFAULT, "Applicator %{public}@ in %{public}@ scope finished processing configurations of types: %{public}@", (uint8_t *)&v6, 0x20u);

  }
}

uint64_t __109__RMConfigurationSubscriberDelegate_didFetchConfigurationsByType_storesByIdentifier_scope_completionHandler___block_invoke_12(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "lockWhenCondition:", 1);
  objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberDelegate");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_245188000, v2, OS_LOG_TYPE_DEFAULT, "Fetching complete.", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "unlockWithCondition:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)didFailToFetchConfigurationsWithTypes:(id)a3 scope:(int64_t)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberDelegate");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "rms_stringWithScope:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v10;
    v13 = 2114;
    v14 = v7;
    v15 = 2114;
    v16 = v8;
    _os_log_impl(&dword_245188000, v9, OS_LOG_TYPE_DEFAULT, "Did fail in %{public}@ scope to fetch configurations %{public}@: %{public}@", (uint8_t *)&v11, 0x20u);

  }
}

- (void)didFetchConfigurationsWithVisibleUIByType:(id)a3 storesByIdentifier:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSConditionLock *v14;
  NSObject *v15;
  void *v16;
  dispatch_group_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  NSConditionLock *v22;
  _QWORD block[4];
  NSConditionLock *v24;
  id v25;
  __int128 *v26;
  _QWORD v27[4];
  NSObject *v28;
  RMConfigurationSubscriberDelegate *v29;
  __int128 *p_buf;
  int64_t v31;
  __int128 buf;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberDelegate");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_245188000, v13, OS_LOG_TYPE_DEFAULT, "Fetch configurationUIs by type: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v14 = self->_applyLock;
  if (!-[NSConditionLock tryLockWhenCondition:](v14, "tryLockWhenCondition:", 0))
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberDelegate");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_245188000, v15, OS_LOG_TYPE_DEFAULT, "Waiting for previous fetch UIs to finish...", (uint8_t *)&buf, 2u);
    }

    -[NSConditionLock lockWhenCondition:](v14, "lockWhenCondition:", 0);
  }
  -[NSConditionLock unlockWithCondition:](v14, "unlockWithCondition:", 1);
  -[RMConfigurationSubscriberDelegate _configurationsByApplicatorClassNameForConfigurationsByType:](self, "_configurationsByApplicatorClassNameForConfigurationsByType:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = dispatch_group_create();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__1;
  v35 = __Block_byref_object_dispose__1;
  v36 = 0;
  v18 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __122__RMConfigurationSubscriberDelegate_didFetchConfigurationsWithVisibleUIByType_storesByIdentifier_scope_completionHandler___block_invoke;
  v27[3] = &unk_25162F5A0;
  v19 = v17;
  v28 = v19;
  v29 = self;
  p_buf = &buf;
  v31 = a5;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v27);
  dispatch_get_global_queue(21, 0);
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = v18;
  block[1] = 3221225472;
  block[2] = __122__RMConfigurationSubscriberDelegate_didFetchConfigurationsWithVisibleUIByType_storesByIdentifier_scope_completionHandler___block_invoke_2_17;
  block[3] = &unk_25162F5C8;
  v24 = v14;
  v25 = v12;
  v26 = &buf;
  v21 = v12;
  v22 = v14;
  dispatch_group_notify(v19, v20, block);

  _Block_object_dispose(&buf, 8);
}

void __122__RMConfigurationSubscriberDelegate_didFetchConfigurationsWithVisibleUIByType_storesByIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "applicatorQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __122__RMConfigurationSubscriberDelegate_didFetchConfigurationsWithVisibleUIByType_storesByIdentifier_scope_completionHandler___block_invoke_2;
  v11[3] = &unk_25162F578;
  v16 = *(_QWORD *)(a1 + 48);
  v12 = *(id *)(a1 + 32);
  v13 = v5;
  v17 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 40);
  v14 = v6;
  v15 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, v11);

}

void __122__RMConfigurationSubscriberDelegate_didFetchConfigurationsWithVisibleUIByType_storesByIdentifier_scope_completionHandler___block_invoke_2(uint64_t a1)
{
  Class v2;
  char v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[6];
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    return;
  }
  v2 = NSClassFromString(*(NSString **)(a1 + 40));
  v19 = (void *)objc_opt_new();
  v3 = objc_opt_respondsToSelector();
  objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberDelegate");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if ((v3 & 1) != 0)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD17C8], "rms_stringWithScope:", *(_QWORD *)(a1 + 72));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class supportedConfigurationTypes](v2, "supportedConfigurationTypes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v6;
      v30 = 2114;
      v31 = v7;
      v32 = 2114;
      v33 = v8;
      v9 = "Applicator %{public}@ in %{public}@ scope processes configurationUIs of types: %{public}@";
LABEL_19:
      _os_log_debug_impl(&dword_245188000, v4, OS_LOG_TYPE_DEBUG, v9, buf, 0x20u);

    }
  }
  else if (v5)
  {
    v18 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD17C8], "rms_stringWithScope:", *(_QWORD *)(a1 + 72));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class supportedConfigurationTypes](v2, "supportedConfigurationTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = v18;
    v30 = 2114;
    v31 = v7;
    v32 = 2114;
    v33 = v8;
    v9 = "Applicator %{public}@ in %{public}@ scope does not process configurationUIs of types: %{public}@";
    goto LABEL_19;
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = *(id *)(a1 + 48);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((v3 & 1) != 0)
        {
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
          v20[0] = MEMORY[0x24BDAC760];
          v20[1] = 3221225472;
          v20[2] = __122__RMConfigurationSubscriberDelegate_didFetchConfigurationsWithVisibleUIByType_storesByIdentifier_scope_completionHandler___block_invoke_15;
          v20[3] = &unk_25162F550;
          v16 = *(_QWORD *)(a1 + 72);
          v17 = *(_QWORD *)(a1 + 56);
          v22 = *(_QWORD *)(a1 + 64);
          v20[4] = v17;
          v20[5] = v15;
          v21 = *(id *)(a1 + 32);
          objc_msgSend(v19, "configurationUIForConfiguration:scope:completionHandler:", v15, v16, v20);

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 56), "_sendConfigurationUIForConfigurationReference:visible:configurationUI:configurationUIGroup:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), 0, 0, *(_QWORD *)(a1 + 32));
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __122__RMConfigurationSubscriberDelegate_didFetchConfigurationsWithVisibleUIByType_storesByIdentifier_scope_completionHandler___block_invoke_15(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8;

  v8 = a4;
  if (v8)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a4);
  else
    objc_msgSend(*(id *)(a1 + 32), "_sendConfigurationUIForConfigurationReference:visible:configurationUI:configurationUIGroup:", *(_QWORD *)(a1 + 40), a2, a3, *(_QWORD *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __122__RMConfigurationSubscriberDelegate_didFetchConfigurationsWithVisibleUIByType_storesByIdentifier_scope_completionHandler___block_invoke_2_17(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "lockWhenCondition:", 1);
  objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberDelegate");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_245188000, v2, OS_LOG_TYPE_DEFAULT, "Fetching configuration UIs complete.", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "unlockWithCondition:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_configurationsByApplicatorClassNameForConfigurationsByType:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  v4 = (void *)MEMORY[0x24BDBCED8];
  v5 = a3;
  -[RMConfigurationSubscriberDelegate applicatorClassNameByConfigurationType](self, "applicatorClassNameByConfigurationType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __97__RMConfigurationSubscriberDelegate__configurationsByApplicatorClassNameForConfigurationsByType___block_invoke;
  v12[3] = &unk_25162F5F0;
  v12[4] = self;
  v8 = v7;
  v13 = v8;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v12);

  v9 = v13;
  v10 = v8;

  return v10;
}

void __97__RMConfigurationSubscriberDelegate__configurationsByApplicatorClassNameForConfigurationsByType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "applicatorClassNameByConfigurationType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v8);
    }
    objc_msgSend(v9, "addObjectsFromArray:", v10);

  }
}

- (void)_sendConfigurationUIForConfigurationReference:(id)a3 visible:(BOOL)a4 configurationUI:(id)a5 configurationUIGroup:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  BOOL v24;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "store");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v12);
  -[RMConfigurationSubscriberDelegate applicatorQueue](self, "applicatorQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __128__RMConfigurationSubscriberDelegate__sendConfigurationUIForConfigurationReference_visible_configurationUI_configurationUIGroup___block_invoke;
  block[3] = &unk_25162F618;
  v20 = v13;
  v21 = v10;
  v24 = a4;
  v22 = v11;
  v23 = v12;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = v13;
  dispatch_async(v14, block);

}

void __128__RMConfigurationSubscriberDelegate__sendConfigurationUIForConfigurationReference_visible_configurationUI_configurationUIGroup___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "declaration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(unsigned __int8 *)(a1 + 64);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __128__RMConfigurationSubscriberDelegate__sendConfigurationUIForConfigurationReference_visible_configurationUI_configurationUIGroup___block_invoke_2;
  v6[3] = &unk_25162F0C8;
  v5 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "setConfigurationUI:visible:ui:completionHandler:", v3, v4, v5, v6);

}

void __128__RMConfigurationSubscriberDelegate__sendConfigurationUIForConfigurationReference_visible_configurationUI_configurationUIGroup___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberDelegate");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __128__RMConfigurationSubscriberDelegate__sendConfigurationUIForConfigurationReference_visible_configurationUI_configurationUIGroup___block_invoke_2_cold_1((uint64_t)v3, v4);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (NSDictionary)applicatorClassNameByConfigurationType
{
  return self->_applicatorClassNameByConfigurationType;
}

- (OS_dispatch_queue)applicatorQueue
{
  return self->_applicatorQueue;
}

- (void)setApplicatorQueue:(id)a3
{
  objc_storeStrong((id *)&self->_applicatorQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicatorQueue, 0);
  objc_storeStrong((id *)&self->_applicatorClassNameByConfigurationType, 0);
  objc_storeStrong((id *)&self->_applyLock, 0);
}

void __128__RMConfigurationSubscriberDelegate__sendConfigurationUIForConfigurationReference_visible_configurationUI_configurationUIGroup___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_245188000, a2, OS_LOG_TYPE_ERROR, "Failed to update configuration UI: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
