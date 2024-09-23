@implementation RMConfigurationCombineApplicator

- (RMConfigurationCombineApplicator)initWithAdapter:(id)a3
{
  id v5;
  RMConfigurationCombineApplicator *v6;
  RMConfigurationCombineApplicator *v7;
  WrappedCombineAdapter *v8;
  WrappedCombineAdapter *wrappingAdapter;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RMConfigurationCombineApplicator;
  v6 = -[RMConfigurationCombineApplicator init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_adapter, a3);
    v8 = -[WrappedCombineAdapter initWithAdapter:]([WrappedCombineAdapter alloc], "initWithAdapter:", v7->_adapter);
    wrappingAdapter = v7->_wrappingAdapter;
    v7->_wrappingAdapter = v8;

  }
  return v7;
}

- (void)configurationUIForConfiguration:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a5;
  -[RMConfigurationCombineApplicator adapter](self, "adapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[RMConfigurationCombineApplicator adapter](self, "adapter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configurationUIForConfiguration:scope:completionHandler:", v12, a4, v8);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v8 + 2))(v8, 0, 0, 0);
  }

}

- (void)_beginProcessingWithConfigurations:(id)a3 storesByIdentifier:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  int64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[RMConfigurationCombineApplicator wrappingAdapter](self, "wrappingAdapter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __114__RMConfigurationCombineApplicator__beginProcessingWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke;
  v17[3] = &unk_25162F118;
  v17[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21 = a5;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  objc_msgSend(v13, "beginProcessingConfigurationsForScope:completionHandler:", a5, v17);

}

void __114__RMConfigurationCombineApplicator__beginProcessingWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "configurationCombineApplicator");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __114__RMConfigurationCombineApplicator__beginProcessingWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_fetchExistingDeclarationKeysWithConfigurations:storesByIdentifier:scope:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
  }

}

- (void)_fetchExistingDeclarationKeysWithConfigurations:(id)a3 storesByIdentifier:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  int64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[RMConfigurationCombineApplicator wrappingAdapter](self, "wrappingAdapter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __127__RMConfigurationCombineApplicator__fetchExistingDeclarationKeysWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke;
  v17[3] = &unk_25162F140;
  v20 = v12;
  v21 = a5;
  v17[4] = self;
  v18 = v10;
  v19 = v11;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  objc_msgSend(v13, "allDeclarationKeysForScope:completionHandler:", a5, v17);

}

void __127__RMConfigurationCombineApplicator__fetchExistingDeclarationKeysWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "configurationCombineApplicator");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __127__RMConfigurationCombineApplicator__fetchExistingDeclarationKeysWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke_cold_1();

    v8 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 64);
    v11 = 0;
  }
  else
  {
    if (objc_msgSend(v5, "count") || objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_processExistingDeclarationKeysWithConfigurations:oldDeclarationKeys:storesByIdentifier:scope:completionHandler:", *(_QWORD *)(a1 + 40), v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
      goto LABEL_9;
    }
    v8 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 64);
    v11 = 1;
  }
  objc_msgSend(v8, "_endProcessingWithSuccess:scope:completionHandler:", v11, v9, v10);
LABEL_9:

}

- (void)_processExistingDeclarationKeysWithConfigurations:(id)a3 oldDeclarationKeys:(id)a4 storesByIdentifier:(id)a5 scope:(int64_t)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;

  v11 = a3;
  v12 = a4;
  v13 = a7;
  -[RMConfigurationCombineApplicator _configurationByDeclarationKeyFromConfigurations:](self, "_configurationByDeclarationKeyFromConfigurations:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v14, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "isEqualToSet:", v17))
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "configurationCombineApplicator");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[RMConfigurationCombineApplicator _processExistingDeclarationKeysWithConfigurations:oldDeclarationKeys:storesByIdentifier:scope:completionHandler:].cold.1(v18);

    -[RMConfigurationCombineApplicator _endProcessingWithSuccess:scope:completionHandler:](self, "_endProcessingWithSuccess:scope:completionHandler:", 1, a6, v13);
  }
  else if (objc_msgSend(v11, "count"))
  {
    -[RMConfigurationCombineApplicator _installDeclarationKeysWithScope:configurations:completionHandler:](self, "_installDeclarationKeysWithScope:configurations:completionHandler:", a6, v14, v13);
  }
  else
  {
    objc_msgSend(v12, "objectEnumerator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[RMConfigurationCombineApplicator _uninstallDeclarationKeys:scope:completionHandler:](self, "_uninstallDeclarationKeys:scope:completionHandler:", v19, a6, v13);

  }
}

- (void)_installDeclarationKeysWithScope:(int64_t)a3 configurations:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  char v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  int64_t v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  id v46;
  int64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[4];
  uint64_t v53;
  uint8_t buf[4];
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v31 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v7, "count"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (!v9)
    goto LABEL_18;
  v10 = v9;
  v11 = *(_QWORD *)v49;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v49 != v11)
        objc_enumerationMutation(v8);
      v13 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
      objc_msgSend(v8, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "declaration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[RMConfigurationCombineApplicator adapter](self, "adapter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "configurationClass");
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v14, "store");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isValidDeclaration:", v15);

        if ((v19 & 1) != 0)
        {
          objc_msgSend(v34, "addObject:", v15);
          objc_msgSend(v33, "addObject:", v13);
          goto LABEL_16;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[RMConfigurationCombineApplicator _installDeclarationKeysWithScope:configurations:completionHandler:].cold.1(v52, (uint64_t)v15, &v53);
        v21 = v35;
        v22 = &unk_251635D48;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE7EB20], "configurationCombineApplicator");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v55 = v15;
          _os_log_error_impl(&dword_245188000, v20, OS_LOG_TYPE_ERROR, "Incorrect declaration class: %{public}@", buf, 0xCu);
        }

        v21 = v35;
        v22 = &unk_251635D30;
      }
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, v13);
LABEL_16:

    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  }
  while (v10);
LABEL_18:

  if (objc_msgSend(v34, "count"))
  {
    -[RMConfigurationCombineApplicator adapter](self, "adapter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "combineConfigurations:", v34);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    -[RMConfigurationCombineApplicator wrappingAdapter](self, "wrappingAdapter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __102__RMConfigurationCombineApplicator__installDeclarationKeysWithScope_configurations_completionHandler___block_invoke_53;
    v36[3] = &unk_25162F190;
    v40 = v31;
    v41 = a3;
    v36[4] = self;
    v37 = v33;
    v38 = v35;
    v39 = v8;
    v26 = v8;
    v27 = v35;
    v28 = v33;
    v29 = v31;
    objc_msgSend(v25, "applyCombinedConfiguration:declarationKeys:scope:completionHandler:", v24, v28, a3, v36);

  }
  else
  {
    -[RMConfigurationCombineApplicator wrappingAdapter](self, "wrappingAdapter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __102__RMConfigurationCombineApplicator__installDeclarationKeysWithScope_configurations_completionHandler___block_invoke;
    v42[3] = &unk_25162F168;
    v46 = v31;
    v47 = a3;
    v42[4] = self;
    v43 = v33;
    v44 = v35;
    v45 = v8;
    v27 = v8;
    v28 = v35;
    v29 = v33;
    v24 = v31;
    objc_msgSend(v30, "removeCombinedConfigurationForScope:completionHandler:", a3, v42);

  }
}

void __102__RMConfigurationCombineApplicator__installDeclarationKeysWithScope_configurations_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "configurationCombineApplicator");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __102__RMConfigurationCombineApplicator__installDeclarationKeysWithScope_configurations_completionHandler___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "_endProcessingWithSuccess:scope:completionHandler:", 0, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_sendStatusForSuccessKeys:failedKeys:reasons:scope:configurations:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }

}

void __102__RMConfigurationCombineApplicator__installDeclarationKeysWithScope_configurations_completionHandler___block_invoke_53(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "configurationCombineApplicator");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __102__RMConfigurationCombineApplicator__installDeclarationKeysWithScope_configurations_completionHandler___block_invoke_53_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "_endProcessingWithSuccess:scope:completionHandler:", 0, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_sendStatusForSuccessKeys:failedKeys:reasons:scope:configurations:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }

}

- (void)_sendStatusForSuccessKeys:(id)a3 failedKeys:(id)a4 reasons:(id)a5 scope:(int64_t)a6 configurations:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  int64_t v26;

  v14 = a4;
  v15 = a7;
  v16 = a8;
  v17 = a5;
  objc_msgSend(a3, "objectEnumerator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __120__RMConfigurationCombineApplicator__sendStatusForSuccessKeys_failedKeys_reasons_scope_configurations_completionHandler___block_invoke;
  v22[3] = &unk_25162F1E0;
  v22[4] = self;
  v23 = v14;
  v25 = v16;
  v26 = a6;
  v24 = v15;
  v19 = v16;
  v20 = v15;
  v21 = v14;
  -[RMConfigurationCombineApplicator _sendStatusForSuccessKeys:reasons:scope:configurations:completionHandler:](self, "_sendStatusForSuccessKeys:reasons:scope:configurations:completionHandler:", v18, v17, a6, v20, v22);

}

void __120__RMConfigurationCombineApplicator__sendStatusForSuccessKeys_failedKeys_reasons_scope_configurations_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "keyEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 64);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __120__RMConfigurationCombineApplicator__sendStatusForSuccessKeys_failedKeys_reasons_scope_configurations_completionHandler___block_invoke_2;
  v7[3] = &unk_25162F1B8;
  v7[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v6 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v2, "_sendStatusForFailedKeys:enumerator:scope:configurations:completionHandler:", v3, v4, v5, v6, v7);

}

uint64_t __120__RMConfigurationCombineApplicator__sendStatusForSuccessKeys_failedKeys_reasons_scope_configurations_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endProcessingWithSuccess:scope:completionHandler:", 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_sendStatusForSuccessKeys:(id)a3 reasons:(id)a4 scope:(int64_t)a5 configurations:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  RMConfigurationCombineApplicator *v22;
  id v23;
  id v24;
  id v25;
  void (**v26)(_QWORD);
  int64_t v27;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(_QWORD))a7;
  objc_msgSend(v12, "nextObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "store");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "declaration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __109__RMConfigurationCombineApplicator__sendStatusForSuccessKeys_reasons_scope_configurations_completionHandler___block_invoke;
    v20[3] = &unk_25162F208;
    v21 = v16;
    v22 = self;
    v23 = v12;
    v24 = v13;
    v27 = a5;
    v25 = v14;
    v26 = v15;
    objc_msgSend(v18, "configurationSuccessfullyApplied:reasons:completionHandler:", v19, v24, v20);

  }
  else
  {
    v15[2](v15);
  }

}

uint64_t __109__RMConfigurationCombineApplicator__sendStatusForSuccessKeys_reasons_scope_configurations_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "configurationCombineApplicator");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __109__RMConfigurationCombineApplicator__sendStatusForSuccessKeys_reasons_scope_configurations_completionHandler___block_invoke_cold_1(a1, v3);

  }
  return objc_msgSend(*(id *)(a1 + 40), "_sendStatusForSuccessKeys:reasons:scope:configurations:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (void)_sendStatusForFailedKeys:(id)a3 enumerator:(id)a4 scope:(int64_t)a5 configurations:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id *v21;
  id *v22;
  void *v23;
  void *v24;
  void *v25;
  id *v26;
  id *v27;
  id *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];
  id v32;
  id v33;
  id v34;
  _QWORD v35[6];
  _QWORD v36[2];
  id v37;
  id v38;
  id v39;
  _QWORD v40[6];
  _QWORD v41[2];
  id v42;
  id v43;
  id v44;
  _QWORD v45[3];

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(_QWORD))a7;
  objc_msgSend(v13, "nextObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "integerValue");

  if (v16)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "store");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v18 == 2)
    {
      v23 = (void *)v20;
      objc_msgSend(v19, "declaration");
      v30 = objc_claimAutoreleasedReturnValue();
      v35[2] = MEMORY[0x24BDAC760];
      v35[3] = 3221225472;
      v35[4] = __111__RMConfigurationCombineApplicator__sendStatusForFailedKeys_enumerator_scope_configurations_completionHandler___block_invoke_55;
      v35[5] = &unk_25162F208;
      v28 = (id *)v36;
      v36[0] = v16;
      v36[1] = self;
      v27 = &v37;
      v37 = v12;
      v26 = &v38;
      v38 = v13;
      v40[1] = a5;
      v21 = &v39;
      v39 = v14;
      v22 = (id *)v40;
      v40[0] = v15;
      v24 = (void *)v30;
      objc_msgSend(v23, "configurationNotSupported:error:completionHandler:");
    }
    else
    {
      v25 = (void *)v20;
      objc_msgSend(v19, "declaration");
      v29 = objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v28 = (id *)v31;
        v31[0] = v16;
        v31[1] = self;
        v27 = &v32;
        v32 = v12;
        v26 = &v33;
        v33 = v13;
        v35[1] = a5;
        v21 = &v34;
        v34 = v14;
        v22 = (id *)v35;
        v35[0] = v15;
        v23 = v25;
        v24 = (void *)v29;
        objc_msgSend(v25, "configurationFailedToApply:error:completionHandler:");
      }
      else
      {
        v40[2] = MEMORY[0x24BDAC760];
        v40[3] = 3221225472;
        v40[4] = __111__RMConfigurationCombineApplicator__sendStatusForFailedKeys_enumerator_scope_configurations_completionHandler___block_invoke;
        v40[5] = &unk_25162F208;
        v28 = (id *)v41;
        v41[0] = v16;
        v41[1] = self;
        v27 = &v42;
        v42 = v12;
        v26 = &v43;
        v43 = v13;
        v45[1] = a5;
        v21 = &v44;
        v44 = v14;
        v22 = (id *)v45;
        v45[0] = v15;
        v23 = v25;
        v24 = (void *)v29;
        objc_msgSend(v25, "configurationIsInvalid:error:completionHandler:");
      }
    }

  }
  else
  {
    v15[2](v15);
  }

}

uint64_t __111__RMConfigurationCombineApplicator__sendStatusForFailedKeys_enumerator_scope_configurations_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "configurationCombineApplicator");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __111__RMConfigurationCombineApplicator__sendStatusForFailedKeys_enumerator_scope_configurations_completionHandler___block_invoke_cold_1(a1, v3);

  }
  return objc_msgSend(*(id *)(a1 + 40), "_sendStatusForFailedKeys:enumerator:scope:configurations:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

uint64_t __111__RMConfigurationCombineApplicator__sendStatusForFailedKeys_enumerator_scope_configurations_completionHandler___block_invoke_55(uint64_t a1, uint64_t a2)
{
  NSObject *v3;

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "configurationCombineApplicator");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __111__RMConfigurationCombineApplicator__sendStatusForFailedKeys_enumerator_scope_configurations_completionHandler___block_invoke_cold_1(a1, v3);

  }
  return objc_msgSend(*(id *)(a1 + 40), "_sendStatusForFailedKeys:enumerator:scope:configurations:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

uint64_t __111__RMConfigurationCombineApplicator__sendStatusForFailedKeys_enumerator_scope_configurations_completionHandler___block_invoke_56(uint64_t a1, uint64_t a2)
{
  NSObject *v3;

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "configurationCombineApplicator");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __111__RMConfigurationCombineApplicator__sendStatusForFailedKeys_enumerator_scope_configurations_completionHandler___block_invoke_cold_1(a1, v3);

  }
  return objc_msgSend(*(id *)(a1 + 40), "_sendStatusForFailedKeys:enumerator:scope:configurations:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (void)_uninstallDeclarationKeys:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  int64_t v17;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BE7EB20], "configurationCombineApplicator");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[RMConfigurationCombineApplicator _uninstallDeclarationKeys:scope:completionHandler:].cold.1();

  -[RMConfigurationCombineApplicator wrappingAdapter](self, "wrappingAdapter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __86__RMConfigurationCombineApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke;
  v14[3] = &unk_25162F230;
  v16 = v9;
  v17 = a4;
  v14[4] = self;
  v15 = v8;
  v12 = v8;
  v13 = v9;
  objc_msgSend(v11, "removeCombinedConfigurationForScope:completionHandler:", a4, v14);

}

void __86__RMConfigurationCombineApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BE7EB20], "configurationCombineApplicator");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __102__RMConfigurationCombineApplicator__installDeclarationKeysWithScope_configurations_completionHandler___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __86__RMConfigurationCombineApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke_cold_1(a1, v5, v6, v7, v8, v9, v10, v11);
  }

  objc_msgSend(*(id *)(a1 + 32), "_endProcessingWithSuccess:scope:completionHandler:", v3 == 0, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_endProcessingWithSuccess:(BOOL)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v8 = a5;
  -[RMConfigurationCombineApplicator wrappingAdapter](self, "wrappingAdapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __86__RMConfigurationCombineApplicator__endProcessingWithSuccess_scope_completionHandler___block_invoke;
  v11[3] = &unk_25162EF90;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "endProcessingConfigurations:scope:completionHandler:", v6, a4, v11);

}

void __86__RMConfigurationCombineApplicator__endProcessingWithSuccess_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "configurationCombineApplicator");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __86__RMConfigurationCombineApplicator__endProcessingWithSuccess_scope_completionHandler___block_invoke_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_configurationByDeclarationKeyFromConfigurations:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        -[RMConfigurationCombineApplicator adapter](self, "adapter", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "declarationKeyForConfiguration:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v13);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (RMConfigurationCombineAdapter)adapter
{
  return self->_adapter;
}

- (WrappedCombineAdapter)wrappingAdapter
{
  return self->_wrappingAdapter;
}

- (BOOL)doKeychainUnassign
{
  return self->_doKeychainUnassign;
}

- (void)setDoKeychainUnassign:(BOOL)a3
{
  self->_doKeychainUnassign = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappingAdapter, 0);
  objc_storeStrong((id *)&self->_adapter, 0);
}

void __114__RMConfigurationCombineApplicator__beginProcessingWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_245188000, v0, v1, "Failed to begin processing configurations: %{public}@", v2);
  OUTLINED_FUNCTION_3();
}

void __127__RMConfigurationCombineApplicator__fetchExistingDeclarationKeysWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_245188000, v0, v1, "Failed to fetch declaration keys: %{public}@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)_processExistingDeclarationKeysWithConfigurations:(os_log_t)log oldDeclarationKeys:storesByIdentifier:scope:completionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_245188000, log, OS_LOG_TYPE_DEBUG, "Declaration keys match - nothing to apply", v1, 2u);
}

- (void)_installDeclarationKeysWithScope:(uint8_t *)a1 configurations:(uint64_t)a2 completionHandler:(_QWORD *)a3 .cold.1(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138543362;
  *a3 = a2;
  OUTLINED_FUNCTION_0_0(&dword_245188000, MEMORY[0x24BDACB70], (uint64_t)a3, "Declaration not supported: %{public}@", a1);
}

void __102__RMConfigurationCombineApplicator__installDeclarationKeysWithScope_configurations_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_245188000, v0, v1, "Failed to remove effective state: %{public}@", v2);
  OUTLINED_FUNCTION_3();
}

void __102__RMConfigurationCombineApplicator__installDeclarationKeysWithScope_configurations_completionHandler___block_invoke_53_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_245188000, v0, v1, "Failed to apply effective state: %{public}@", v2);
  OUTLINED_FUNCTION_3();
}

void __109__RMConfigurationCombineApplicator__sendStatusForSuccessKeys_reasons_scope_configurations_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_5_0(a1), "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_245188000, a2, v4, "Failed to notify store of applied declaration key: %{public}@", v5);

  OUTLINED_FUNCTION_3_1();
}

void __111__RMConfigurationCombineApplicator__sendStatusForFailedKeys_enumerator_scope_configurations_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_5_0(a1), "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_245188000, a2, v4, "Failed to notify store of failure of declaration key: %{public}@", v5);

  OUTLINED_FUNCTION_3_1();
}

- (void)_uninstallDeclarationKeys:scope:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_245188000, v0, v1, "Removing all declaration keys: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __86__RMConfigurationCombineApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_245188000, a2, a3, "Removed all declaration keys: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __86__RMConfigurationCombineApplicator__endProcessingWithSuccess_scope_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_245188000, v0, v1, "Failed to end processing configurations: %{public}@", v2);
  OUTLINED_FUNCTION_3();
}

@end
