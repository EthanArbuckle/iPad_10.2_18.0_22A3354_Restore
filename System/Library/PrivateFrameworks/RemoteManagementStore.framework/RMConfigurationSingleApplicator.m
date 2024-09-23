@implementation RMConfigurationSingleApplicator

- (RMConfigurationSingleApplicator)initWithAdapter:(id)a3
{
  id v5;
  RMConfigurationSingleApplicator *v6;
  RMConfigurationSingleApplicator *v7;
  WrappedSingleAdapter *v8;
  WrappedSingleAdapter *wrappingAdapter;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RMConfigurationSingleApplicator;
  v6 = -[RMConfigurationSingleApplicator init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_adapter, a3);
    v8 = -[WrappedSingleAdapter initWithAdapter:]([WrappedSingleAdapter alloc], "initWithAdapter:", v7->_adapter);
    wrappingAdapter = v7->_wrappingAdapter;
    v7->_wrappingAdapter = v8;

    v7->_doKeychainUnassign = -[RMConfigurationSingleApplicator _usesKeychain](v7, "_usesKeychain");
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
  -[RMConfigurationSingleApplicator adapter](self, "adapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[RMConfigurationSingleApplicator adapter](self, "adapter");
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
  -[RMConfigurationSingleApplicator wrappingAdapter](self, "wrappingAdapter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __113__RMConfigurationSingleApplicator__beginProcessingWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke;
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

void __113__RMConfigurationSingleApplicator__beginProcessingWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "configurationSingleApplicator");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __115__RMConfigurationMultipleApplicator__beginProcessingWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_fetchExistingDeclarationKeyWithConfigurations:storesByIdentifier:scope:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
  }

}

- (void)_fetchExistingDeclarationKeyWithConfigurations:(id)a3 storesByIdentifier:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6
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
  -[RMConfigurationSingleApplicator wrappingAdapter](self, "wrappingAdapter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __125__RMConfigurationSingleApplicator__fetchExistingDeclarationKeyWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke;
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

void __125__RMConfigurationSingleApplicator__fetchExistingDeclarationKeyWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;

  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "configurationSingleApplicator");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __125__RMConfigurationSingleApplicator__fetchExistingDeclarationKeyWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "_endProcessingWithSuccess:scope:completionHandler:", 0, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
  }
  else
  {
    objc_msgSend(a2, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 || objc_msgSend(*(id *)(a1 + 40), "count"))
      objc_msgSend(*(id *)(a1 + 32), "_processExistingDeclarationKeyWithConfigurations:oldDeclarationKey:storesByIdentifier:scope:completionHandler:", *(_QWORD *)(a1 + 40), v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
    else
      objc_msgSend(*(id *)(a1 + 32), "_endProcessingWithSuccess:scope:completionHandler:", 1, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));

  }
}

- (void)_processExistingDeclarationKeyWithConfigurations:(id)a3 oldDeclarationKey:(id)a4 storesByIdentifier:(id)a5 scope:(int64_t)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  id v40;
  id v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  int64_t v48;
  _QWORD v49[5];
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  id v56;
  id v57;
  id v58[2];

  v11 = a3;
  v12 = a4;
  v36 = a5;
  v37 = v11;
  v38 = a7;
  -[RMConfigurationSingleApplicator _configurationByDeclarationKeyFromConfigurations:](self, "_configurationByDeclarationKeyFromConfigurations:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v13, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v12);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = objc_opt_new();
  }
  v18 = (void *)v17;
  v57 = 0;
  v58[0] = 0;
  v56 = 0;
  +[RMStoreDeclarationKey synchronizeOldKeys:newKeys:returningUnchangedKeys:returningApplyKeys:returningRemoveKeys:](RMStoreDeclarationKey, "synchronizeOldKeys:newKeys:returningUnchangedKeys:returningApplyKeys:returningRemoveKeys:", v17, v16, v58, &v57, &v56);
  v41 = v58[0];
  v19 = v57;
  v40 = v56;

  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__0;
  v54 = __Block_byref_object_dispose__0;
  v20 = MEMORY[0x24BDAC760];
  v55 = 0;
  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = __145__RMConfigurationSingleApplicator__processExistingDeclarationKeyWithConfigurations_oldDeclarationKey_storesByIdentifier_scope_completionHandler___block_invoke;
  v49[3] = &unk_25162F348;
  v49[4] = &v50;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", v49);
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v16, "count"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v19;
  if (objc_msgSend(v41, "count"))
  {
    objc_msgSend(v21, "unionSet:", v16);
    objc_msgSend(v41, "anyObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeObject:", v22);
    v23 = 0;
LABEL_15:
    v28 = v12;

LABEL_16:
    v27 = 0;
    goto LABEL_17;
  }
  v24 = (void *)v51[5];
  if (v24)
  {
    v23 = v24;
    objc_msgSend(v21, "unionSet:", v16);
    objc_msgSend(v23, "applyKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeObject:", v22);
    goto LABEL_15;
  }
  if (objc_msgSend(v19, "count"))
  {
    if (objc_msgSend(v40, "count"))
    {
      objc_msgSend(v19, "anyObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "applyKey");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "anyObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = +[RMStoreDeclarationKeyPair newDeclarationKeyPairWithUpdateKey:replaceKey:](RMStoreDeclarationKeyPair, "newDeclarationKeyPairWithUpdateKey:replaceKey:", v25, v26);

    }
    else
    {
      objc_msgSend(v19, "anyObject");
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v21, "unionSet:", v16);
    objc_msgSend(v23, "applyKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeObject:", v22);
    goto LABEL_15;
  }
  if (!objc_msgSend(v40, "count"))
  {
    v28 = v12;
    v23 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v40, "anyObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v12;
  v23 = 0;
LABEL_17:
  v42[0] = v20;
  v42[1] = 3221225472;
  v42[2] = __145__RMConfigurationSingleApplicator__processExistingDeclarationKeyWithConfigurations_oldDeclarationKey_storesByIdentifier_scope_completionHandler___block_invoke_2;
  v42[3] = &unk_25162F370;
  v42[4] = self;
  v29 = v21;
  v43 = v29;
  v48 = a6;
  v30 = v13;
  v44 = v30;
  v31 = v23;
  v45 = v31;
  v32 = v27;
  v46 = v32;
  v33 = v38;
  v47 = v33;
  -[RMConfigurationSingleApplicator _installDeclarationKey:scope:configurations:completionHandler:](self, "_installDeclarationKey:scope:configurations:completionHandler:", v31, a6, v30, v42);

  _Block_object_dispose(&v50, 8);
}

void __145__RMConfigurationSingleApplicator__processExistingDeclarationKeyWithConfigurations_oldDeclarationKey_storesByIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "replaceKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __145__RMConfigurationSingleApplicator__processExistingDeclarationKeyWithConfigurations_oldDeclarationKey_storesByIdentifier_scope_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 80);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __145__RMConfigurationSingleApplicator__processExistingDeclarationKeyWithConfigurations_oldDeclarationKey_storesByIdentifier_scope_completionHandler___block_invoke_3;
  v8[3] = &unk_25162F1E0;
  v8[4] = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 80);
  v9 = v6;
  v12 = v7;
  v10 = *(id *)(a1 + 64);
  v11 = *(id *)(a1 + 72);
  objc_msgSend(v2, "_invalidDeclarationKeys:scope:configurations:completionHandler:", v3, v4, v5, v8);

}

void __145__RMConfigurationSingleApplicator__processExistingDeclarationKeyWithConfigurations_oldDeclarationKey_storesByIdentifier_scope_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint64_t v12;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "replaceKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 64);
  v5 = objc_msgSend(*(id *)(a1 + 32), "doKeychainUnassign");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __145__RMConfigurationSingleApplicator__processExistingDeclarationKeyWithConfigurations_oldDeclarationKey_storesByIdentifier_scope_completionHandler___block_invoke_4;
  v9[3] = &unk_25162F280;
  v9[4] = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  v8 = *(void **)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v10 = v6;
  v12 = v7;
  v11 = v8;
  objc_msgSend(v2, "_cleanupDeclarationKeyIfNeeded:scope:doIt:completionHandler:", v3, v4, v5, v9);

}

void __145__RMConfigurationSingleApplicator__processExistingDeclarationKeyWithConfigurations_oldDeclarationKey_storesByIdentifier_scope_completionHandler___block_invoke_4(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  uint64_t v7;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __145__RMConfigurationSingleApplicator__processExistingDeclarationKeyWithConfigurations_oldDeclarationKey_storesByIdentifier_scope_completionHandler___block_invoke_5;
  v5[3] = &unk_25162F1B8;
  v3 = (void *)a1[6];
  v4 = a1[7];
  v5[4] = v1;
  v7 = v4;
  v6 = v3;
  objc_msgSend(v1, "_uninstallDeclarationKey:scope:completionHandler:", v2, v4, v5);

}

uint64_t __145__RMConfigurationSingleApplicator__processExistingDeclarationKeyWithConfigurations_oldDeclarationKey_storesByIdentifier_scope_completionHandler___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endProcessingWithSuccess:scope:completionHandler:", 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_installDeclarationKey:(id)a3 scope:(int64_t)a4 configurations:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v10)
  {
    objc_msgSend(v10, "applyKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "declaration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[RMConfigurationSingleApplicator _supportedConfigurationType:](self, "_supportedConfigurationType:", v16))
    {
      objc_msgSend(v15, "store");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isValidDeclaration:", v16);

      if ((v18 & 1) != 0)
      {
        -[RMConfigurationSingleApplicator wrappingAdapter](self, "wrappingAdapter");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "replaceKey");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __97__RMConfigurationSingleApplicator__installDeclarationKey_scope_configurations_completionHandler___block_invoke_2;
        v26[3] = &unk_25162F398;
        v27 = v14;
        v28 = v15;
        v29 = v16;
        v30 = v13;
        objc_msgSend(v19, "applyConfiguration:replaceKey:scope:completionHandler:", v28, v20, a4, v26);

        v21 = v27;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE7EB20], "configurationSingleApplicator");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[RMConfigurationMultipleApplicator _installDeclarationKeys:scope:configurations:completionHandler:].cold.1();

        objc_msgSend(v15, "store");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = __97__RMConfigurationSingleApplicator__installDeclarationKey_scope_configurations_completionHandler___block_invoke_54;
        v31[3] = &unk_25162EF90;
        v32 = v13;
        objc_msgSend(v25, "configurationNotSupported:error:completionHandler:", v16, 0, v31);

        v21 = v32;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE7EB20], "configurationSingleApplicator");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[RMConfigurationMultipleApplicator _installDeclarationKeys:scope:configurations:completionHandler:].cold.2();

      objc_msgSend(MEMORY[0x24BE7EB08], "createInternalError");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "store");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __97__RMConfigurationSingleApplicator__installDeclarationKey_scope_configurations_completionHandler___block_invoke;
      v33[3] = &unk_25162EF90;
      v34 = v13;
      objc_msgSend(v23, "configurationIsInvalid:error:completionHandler:", v16, v21, v33);

    }
  }
  else
  {
    (*((void (**)(id))v12 + 2))(v12);
  }

}

uint64_t __97__RMConfigurationSingleApplicator__installDeclarationKey_scope_configurations_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __97__RMConfigurationSingleApplicator__installDeclarationKey_scope_configurations_completionHandler___block_invoke_54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __97__RMConfigurationSingleApplicator__installDeclarationKey_scope_configurations_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BE7EB20], "configurationSingleApplicator");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_2_cold_2(a1);

    objc_msgSend(*(id *)(a1 + 40), "store");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 48);
    if (v5)
    {
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __97__RMConfigurationSingleApplicator__installDeclarationKey_scope_configurations_completionHandler___block_invoke_55;
      v17[3] = &unk_25162EF90;
      v11 = &v18;
      v18 = *(id *)(a1 + 56);
      objc_msgSend(v9, "configurationErrorReasons:reasons:completionHandler:", v10, v5, v17);
    }
    else
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __97__RMConfigurationSingleApplicator__installDeclarationKey_scope_configurations_completionHandler___block_invoke_2_56;
      v15[3] = &unk_25162EF90;
      v11 = &v16;
      v16 = *(id *)(a1 + 56);
      objc_msgSend(v9, "configurationFailedToApply:error:completionHandler:", v10, v6, v15);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_2_cold_1(a1);

    objc_msgSend(*(id *)(a1 + 40), "store");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __97__RMConfigurationSingleApplicator__installDeclarationKey_scope_configurations_completionHandler___block_invoke_57;
    v13[3] = &unk_25162EF90;
    v11 = &v14;
    v12 = *(_QWORD *)(a1 + 48);
    v14 = *(id *)(a1 + 56);
    objc_msgSend(v9, "configurationSuccessfullyApplied:reasons:completionHandler:", v12, v5, v13);
  }

}

uint64_t __97__RMConfigurationSingleApplicator__installDeclarationKey_scope_configurations_completionHandler___block_invoke_55(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __97__RMConfigurationSingleApplicator__installDeclarationKey_scope_configurations_completionHandler___block_invoke_2_56(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __97__RMConfigurationSingleApplicator__installDeclarationKey_scope_configurations_completionHandler___block_invoke_57(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_invalidDeclarationKeys:(id)a3 scope:(int64_t)a4 configurations:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  void (**v23)(_QWORD);
  int64_t v24;
  _QWORD v25[5];
  id v26;
  id v27;
  void (**v28)(_QWORD);
  int64_t v29;

  v10 = a3;
  v11 = a5;
  v12 = (void (**)(_QWORD))a6;
  objc_msgSend(v10, "nextObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "declaration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[RMConfigurationSingleApplicator _supportedConfigurationType:](self, "_supportedConfigurationType:", v15))
    {
      objc_msgSend(v14, "store");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __98__RMConfigurationSingleApplicator__invalidDeclarationKeys_scope_configurations_completionHandler___block_invoke_2;
      v20[3] = &unk_25162F2D0;
      v20[4] = self;
      v21 = v10;
      v24 = a4;
      v22 = v11;
      v23 = v12;
      objc_msgSend(v16, "configurationFailedAlreadyPresent:completionHandler:", v15, v20);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BE7EB20], "configurationSingleApplicator");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[RMConfigurationMultipleApplicator _installDeclarationKeys:scope:configurations:completionHandler:].cold.2();

      objc_msgSend(MEMORY[0x24BE7EB08], "createInternalError");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "store");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __98__RMConfigurationSingleApplicator__invalidDeclarationKeys_scope_configurations_completionHandler___block_invoke;
      v25[3] = &unk_25162F2D0;
      v25[4] = self;
      v26 = v10;
      v29 = a4;
      v27 = v11;
      v28 = v12;
      objc_msgSend(v19, "configurationIsInvalid:error:completionHandler:", v15, v18, v25);

    }
  }
  else
  {
    v12[2](v12);
  }

}

uint64_t __98__RMConfigurationSingleApplicator__invalidDeclarationKeys_scope_configurations_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidDeclarationKeys:scope:configurations:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __98__RMConfigurationSingleApplicator__invalidDeclarationKeys_scope_configurations_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidDeclarationKeys:scope:configurations:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_cleanupDeclarationKeyIfNeeded:(id)a3 scope:(int64_t)a4 doIt:(BOOL)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v9 = a3;
  v10 = a6;
  v11 = v10;
  if (v9 && a5)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __95__RMConfigurationSingleApplicator__cleanupDeclarationKeyIfNeeded_scope_doIt_completionHandler___block_invoke;
    v12[3] = &unk_25162F3C0;
    v13 = v9;
    v14 = v11;
    +[RMSubscriberStore unassignAssets:scope:completionHandler:](RMSubscriberStore, "unassignAssets:scope:completionHandler:", v13, a4, v12);

  }
  else
  {
    (*((void (**)(id))v10 + 2))(v10);
  }

}

void __95__RMConfigurationSingleApplicator__cleanupDeclarationKeyIfNeeded_scope_doIt_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "configurationSingleApplicator");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __98__RMConfigurationMultipleApplicator__cleanupDeclarationKeysIfNeeded_scope_doIt_completionHandler___block_invoke_cold_1(a1);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_uninstallDeclarationKey:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  RMConfigurationSingleApplicator *v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v8)
  {
    -[RMConfigurationSingleApplicator wrappingAdapter](self, "wrappingAdapter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __84__RMConfigurationSingleApplicator__uninstallDeclarationKey_scope_completionHandler___block_invoke;
    v12[3] = &unk_25162F3E8;
    v13 = v8;
    v14 = self;
    v16 = a4;
    v15 = v10;
    objc_msgSend(v11, "removeDeclarationKey:scope:completionHandler:", v13, a4, v12);

  }
  else
  {
    (*((void (**)(id))v9 + 2))(v9);
  }

}

void __84__RMConfigurationSingleApplicator__uninstallDeclarationKey_scope_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BE7EB20], "configurationSingleApplicator");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __87__RMConfigurationMultipleApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke_cold_2((uint64_t)a1);

    v6 = 0;
    v8 = a1[4];
    v7 = (void *)a1[5];
    v9 = a1[7];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __87__RMConfigurationMultipleApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke_cold_1((uint64_t)a1);

    v8 = a1[4];
    v7 = (void *)a1[5];
    v9 = a1[7];
    v6 = objc_msgSend(v7, "doKeychainUnassign");
  }
  objc_msgSend(v7, "_cleanupDeclarationKeyIfNeeded:scope:doIt:completionHandler:", v8, v9, v6, a1[6]);

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
  -[RMConfigurationSingleApplicator wrappingAdapter](self, "wrappingAdapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __85__RMConfigurationSingleApplicator__endProcessingWithSuccess_scope_completionHandler___block_invoke;
  v11[3] = &unk_25162EF90;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "endProcessingConfigurations:scope:completionHandler:", v6, a4, v11);

}

void __85__RMConfigurationSingleApplicator__endProcessingWithSuccess_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "configurationSingleApplicator");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __87__RMConfigurationMultipleApplicator__endProcessingWithSuccess_scope_completionHandler___block_invoke_cold_1();

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
        -[RMConfigurationSingleApplicator adapter](self, "adapter", (_QWORD)v15);
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

- (BOOL)_supportedConfigurationType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[RMConfigurationSingleApplicator adapter](self, "adapter", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)_usesKeychain
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[RMConfigurationSingleApplicator adapter](self, "adapter", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationClasses");
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "usesKeychainAssets"))
        {
          objc_msgSend(MEMORY[0x24BE7EB20], "configurationSingleApplicator");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            -[RMConfigurationMultipleApplicator _usesKeychain].cold.2(v16, v17, v18, v19, v20, v21, v22, v23);

          v15 = 1;
          goto LABEL_15;
        }
      }
      v5 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v5)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x24BE7EB20], "configurationSingleApplicator");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[RMConfigurationMultipleApplicator _usesKeychain].cold.1(v3, v8, v9, v10, v11, v12, v13, v14);
  v15 = 0;
LABEL_15:

  return v15;
}

- (RMConfigurationSingleAdapter)adapter
{
  return self->_adapter;
}

- (WrappedSingleAdapter)wrappingAdapter
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

void __125__RMConfigurationSingleApplicator__fetchExistingDeclarationKeyWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Failed to fetch declaration key: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
