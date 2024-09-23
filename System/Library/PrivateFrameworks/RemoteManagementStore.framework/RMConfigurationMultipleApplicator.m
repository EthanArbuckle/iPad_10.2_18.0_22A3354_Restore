@implementation RMConfigurationMultipleApplicator

- (RMConfigurationMultipleApplicator)initWithAdapter:(id)a3 inPlaceUpdates:(BOOL)a4
{
  id v7;
  RMConfigurationMultipleApplicator *v8;
  RMConfigurationMultipleApplicator *v9;
  WrappedMultipleAdapter *v10;
  WrappedMultipleAdapter *wrappingAdapter;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RMConfigurationMultipleApplicator;
  v8 = -[RMConfigurationMultipleApplicator init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_adapter, a3);
    v10 = -[WrappedMultipleAdapter initWithAdapter:]([WrappedMultipleAdapter alloc], "initWithAdapter:", v9->_adapter);
    wrappingAdapter = v9->_wrappingAdapter;
    v9->_wrappingAdapter = v10;

    v9->_inPlaceUpdates = a4;
    v9->_removeBeforeApply = 0;
    v9->_doKeychainUnassign = -[RMConfigurationMultipleApplicator _usesKeychain](v9, "_usesKeychain");
  }

  return v9;
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
  -[RMConfigurationMultipleApplicator adapter](self, "adapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[RMConfigurationMultipleApplicator adapter](self, "adapter");
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
  -[RMConfigurationMultipleApplicator wrappingAdapter](self, "wrappingAdapter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __115__RMConfigurationMultipleApplicator__beginProcessingWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke;
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

void __115__RMConfigurationMultipleApplicator__beginProcessingWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "configurationMultipleApplicator");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __115__RMConfigurationMultipleApplicator__beginProcessingWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke_cold_1();

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
  -[RMConfigurationMultipleApplicator wrappingAdapter](self, "wrappingAdapter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __128__RMConfigurationMultipleApplicator__fetchExistingDeclarationKeysWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke;
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

void __128__RMConfigurationMultipleApplicator__fetchExistingDeclarationKeysWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(MEMORY[0x24BE7EB20], "configurationMultipleApplicator");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __128__RMConfigurationMultipleApplicator__fetchExistingDeclarationKeysWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke_cold_1();

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
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  _BOOL4 v24;
  id *v25;
  id v26;
  id *v27;
  void *v28;
  id v29;
  RMConfigurationMultipleApplicator *v30;
  id *v31;
  void *v32;
  void *v33;
  id v34;
  RMConfigurationMultipleApplicator *v35;
  _BOOL4 v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[5];
  void *v43;
  id v44;
  id v45;
  id v46;
  int64_t v47;
  _QWORD v48[5];
  id v49;
  void *v50;
  _QWORD v51[2];
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  id v56[2];

  v38 = a7;
  v11 = a4;
  -[RMConfigurationMultipleApplicator _configurationByDeclarationKeyFromConfigurations:](self, "_configurationByDeclarationKeyFromConfigurations:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v12, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = objc_claimAutoreleasedReturnValue();

  v55 = 0;
  v56[0] = 0;
  v54 = 0;
  +[RMStoreDeclarationKey synchronizeOldKeys:newKeys:returningUnchangedKeys:returningApplyKeys:returningRemoveKeys:](RMStoreDeclarationKey, "synchronizeOldKeys:newKeys:returningUnchangedKeys:returningApplyKeys:returningRemoveKeys:", v11, v15, v56, &v55, &v54);

  v16 = v56[0];
  v17 = v55;
  v18 = v54;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v17, "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x24BDAC760];
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke;
  v52[3] = &unk_25162F258;
  v21 = v19;
  v53 = v21;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v52);
  v39 = v18;
  if (-[RMConfigurationMultipleApplicator inPlaceUpdates](self, "inPlaceUpdates"))
  {
    v22 = v18;
  }
  else
  {
    objc_msgSend(v21, "setByAddingObjectsFromSet:", v18);
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23 = v22;
  v40 = v16;
  v41 = (void *)v15;
  if (-[RMConfigurationMultipleApplicator removeBeforeApply](self, "removeBeforeApply"))
  {
    objc_msgSend(v21, "objectEnumerator");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[RMConfigurationMultipleApplicator inPlaceUpdates](self, "inPlaceUpdates");
    if (v24)
      v24 = -[RMConfigurationMultipleApplicator doKeychainUnassign](self, "doKeychainUnassign");
    v36 = v24;
    v42[0] = v20;
    v42[1] = 3221225472;
    v42[2] = __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke_5;
    v42[3] = &unk_25162F2A8;
    v42[4] = self;
    v43 = v23;
    v25 = &v44;
    v47 = a6;
    v44 = v17;
    v26 = v17;
    v27 = &v45;
    v45 = v12;
    v28 = v38;
    v46 = v38;
    v29 = v23;
    v30 = self;
    v31 = &v43;
    v32 = v26;
    -[RMConfigurationMultipleApplicator _cleanupDeclarationKeysIfNeeded:scope:doIt:completionHandler:](v30, "_cleanupDeclarationKeysIfNeeded:scope:doIt:completionHandler:", v37, a6, v36, v42);

    v33 = v46;
  }
  else
  {
    objc_msgSend(v17, "objectEnumerator");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v20;
    v48[1] = 3221225472;
    v48[2] = __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke_2;
    v48[3] = &unk_25162F1E0;
    v48[4] = self;
    v51[1] = a6;
    v25 = &v50;
    v49 = v21;
    v50 = v23;
    v32 = v17;
    v27 = (id *)v51;
    v28 = v38;
    v51[0] = v38;
    v34 = v23;
    v35 = self;
    v31 = &v49;
    -[RMConfigurationMultipleApplicator _installDeclarationKeys:scope:configurations:completionHandler:](v35, "_installDeclarationKeys:scope:configurations:completionHandler:", v33, a6, v12, v48);
  }

}

void __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "replaceKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "replaceKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

void __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke_2(uint64_t a1)
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
  objc_msgSend(*(id *)(a1 + 40), "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 64);
  if (objc_msgSend(*(id *)(a1 + 32), "inPlaceUpdates"))
    v5 = objc_msgSend(*(id *)(a1 + 32), "doKeychainUnassign");
  else
    v5 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke_3;
  v9[3] = &unk_25162F280;
  v9[4] = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  v8 = *(void **)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v10 = v6;
  v12 = v7;
  v11 = v8;
  objc_msgSend(v2, "_cleanupDeclarationKeysIfNeeded:scope:doIt:completionHandler:", v3, v4, v5, v9);

}

void __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke_4;
  v6[3] = &unk_25162F1B8;
  v4 = *(void **)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v7 = v4;
  objc_msgSend(v2, "_uninstallDeclarationKeys:scope:completionHandler:", v3, v5, v6);

}

uint64_t __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endProcessingWithSuccess:scope:completionHandler:", 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 72);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke_6;
  v7[3] = &unk_25162F1E0;
  v7[4] = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 72);
  v8 = v5;
  v11 = v6;
  v9 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 64);
  objc_msgSend(v2, "_uninstallDeclarationKeys:scope:completionHandler:", v3, v4, v7);

}

void __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 64);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke_7;
  v6[3] = &unk_25162F1B8;
  v6[4] = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v5 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "_installDeclarationKeys:scope:configurations:completionHandler:", v3, v4, v5, v6);

}

uint64_t __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endProcessingWithSuccess:scope:completionHandler:", 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_installDeclarationKeys:(id)a3 scope:(int64_t)a4 configurations:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  RMConfigurationMultipleApplicator *v32;
  id v33;
  id v34;
  void (**v35)(_QWORD);
  int64_t v36;
  _QWORD v37[5];
  id v38;
  id v39;
  void (**v40)(_QWORD);
  int64_t v41;
  _QWORD v42[5];
  id v43;
  id v44;
  void (**v45)(_QWORD);
  int64_t v46;

  v10 = a3;
  v11 = a5;
  v12 = (void (**)(_QWORD))a6;
  objc_msgSend(v10, "nextObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "applyKey");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "declaration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[RMConfigurationMultipleApplicator _supportedConfigurationType:](self, "_supportedConfigurationType:", v16))
    {
      objc_msgSend(v15, "store");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isValidDeclaration:", v16);

      if ((v18 & 1) != 0)
      {
        -[RMConfigurationMultipleApplicator wrappingAdapter](self, "wrappingAdapter");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "replaceKey");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_2;
        v28[3] = &unk_25162F2F8;
        v29 = v27;
        v30 = v15;
        v31 = v16;
        v32 = self;
        v33 = v10;
        v36 = a4;
        v34 = v11;
        v35 = v12;
        objc_msgSend(v26, "applyConfiguration:replaceKey:scope:completionHandler:", v30, v19, a4, v28);

        v20 = v29;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE7EB20], "configurationMultipleApplicator");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[RMConfigurationMultipleApplicator _installDeclarationKeys:scope:configurations:completionHandler:].cold.1();

        objc_msgSend(v15, "store");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 3221225472;
        v37[2] = __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_53;
        v37[3] = &unk_25162F2D0;
        v37[4] = self;
        v38 = v10;
        v41 = a4;
        v39 = v11;
        v40 = v12;
        objc_msgSend(v25, "configurationNotSupported:error:completionHandler:", v16, 0, v37);

        v20 = v38;
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x24BE7EB20], "configurationMultipleApplicator");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[RMConfigurationMultipleApplicator _installDeclarationKeys:scope:configurations:completionHandler:].cold.2();

      objc_msgSend(MEMORY[0x24BE7EB08], "createInternalError");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "store");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x24BDAC760];
      v42[1] = 3221225472;
      v42[2] = __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke;
      v42[3] = &unk_25162F2D0;
      v42[4] = self;
      v43 = v10;
      v46 = a4;
      v44 = v11;
      v45 = v12;
      objc_msgSend(v23, "configurationIsInvalid:error:completionHandler:", v16, v22, v42);

    }
  }
  else
  {
    v12[2](v12);
  }

}

uint64_t __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_installDeclarationKeys:scope:configurations:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_53(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_installDeclarationKeys:scope:configurations:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id *v12;
  id v13;
  uint64_t v14;
  id *v15;
  id *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[2];
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD v30[2];
  _QWORD v31[5];
  id v32;
  id v33;
  _QWORD v34[2];

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BE7EB20], "configurationMultipleApplicator");
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
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_54;
      v31[3] = &unk_25162F2D0;
      v11 = *(void **)(a1 + 64);
      v31[4] = *(_QWORD *)(a1 + 56);
      v12 = &v32;
      v13 = v11;
      v14 = *(_QWORD *)(a1 + 88);
      v32 = v13;
      v34[1] = v14;
      v15 = &v33;
      v33 = *(id *)(a1 + 72);
      v16 = (id *)v34;
      v34[0] = *(id *)(a1 + 80);
      objc_msgSend(v9, "configurationErrorReasons:reasons:completionHandler:", v10, v5, v31);
    }
    else
    {
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_2_55;
      v27[3] = &unk_25162F2D0;
      v20 = *(void **)(a1 + 64);
      v27[4] = *(_QWORD *)(a1 + 56);
      v12 = &v28;
      v21 = v20;
      v22 = *(_QWORD *)(a1 + 88);
      v28 = v21;
      v30[1] = v22;
      v15 = &v29;
      v29 = *(id *)(a1 + 72);
      v16 = (id *)v30;
      v30[0] = *(id *)(a1 + 80);
      objc_msgSend(v9, "configurationFailedToApply:error:completionHandler:", v10, v6, v27);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_2_cold_1(a1);

    objc_msgSend(*(id *)(a1 + 40), "store");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_56;
    v23[3] = &unk_25162F2D0;
    v17 = *(_QWORD *)(a1 + 48);
    v23[4] = *(_QWORD *)(a1 + 56);
    v12 = &v24;
    v18 = *(id *)(a1 + 64);
    v19 = *(_QWORD *)(a1 + 88);
    v24 = v18;
    v26[1] = v19;
    v15 = &v25;
    v25 = *(id *)(a1 + 72);
    v16 = (id *)v26;
    v26[0] = *(id *)(a1 + 80);
    objc_msgSend(v9, "configurationSuccessfullyApplied:reasons:completionHandler:", v17, v5, v23);
  }

}

uint64_t __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_54(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_installDeclarationKeys:scope:configurations:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_2_55(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_installDeclarationKeys:scope:configurations:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_56(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_installDeclarationKeys:scope:configurations:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_cleanupDeclarationKeysIfNeeded:(id)a3 scope:(int64_t)a4 doIt:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  void (**v11)(_QWORD);
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  RMConfigurationMultipleApplicator *v17;
  id v18;
  void (**v19)(_QWORD);
  int64_t v20;
  BOOL v21;

  v10 = a3;
  v11 = (void (**)(_QWORD))a6;
  v12 = v11;
  if (a5)
  {
    objc_msgSend(v10, "nextObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __98__RMConfigurationMultipleApplicator__cleanupDeclarationKeysIfNeeded_scope_doIt_completionHandler___block_invoke;
      v15[3] = &unk_25162F320;
      v16 = v13;
      v17 = self;
      v18 = v10;
      v20 = a4;
      v21 = a5;
      v19 = v12;
      +[RMSubscriberStore unassignAssets:scope:completionHandler:](RMSubscriberStore, "unassignAssets:scope:completionHandler:", v16, a4, v15);

    }
    else
    {
      v12[2](v12);
    }

  }
  else
  {
    v11[2](v11);
  }

}

void __98__RMConfigurationMultipleApplicator__cleanupDeclarationKeysIfNeeded_scope_doIt_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "configurationMultipleApplicator");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __98__RMConfigurationMultipleApplicator__cleanupDeclarationKeysIfNeeded_scope_doIt_completionHandler___block_invoke_cold_1(a1);

  }
  objc_msgSend(*(id *)(a1 + 40), "_cleanupDeclarationKeysIfNeeded:scope:doIt:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 56));

}

- (void)_uninstallDeclarationKeys:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  RMConfigurationMultipleApplicator *v14;
  id v15;
  void (**v16)(_QWORD);
  int64_t v17;

  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  objc_msgSend(v8, "nextObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[RMConfigurationMultipleApplicator wrappingAdapter](self, "wrappingAdapter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __87__RMConfigurationMultipleApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke;
    v12[3] = &unk_25162F2D0;
    v13 = v10;
    v14 = self;
    v17 = a4;
    v15 = v8;
    v16 = v9;
    objc_msgSend(v11, "removeDeclarationKey:scope:completionHandler:", v13, a4, v12);

  }
  else
  {
    v9[2](v9);
  }

}

void __87__RMConfigurationMultipleApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BE7EB20], "configurationMultipleApplicator");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __87__RMConfigurationMultipleApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke_cold_2(a1);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __87__RMConfigurationMultipleApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke_cold_1(a1);
  }

  v19[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v6, "objectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 64);
  if (v3)
    v10 = 0;
  else
    v10 = objc_msgSend(*(id *)(a1 + 40), "doKeychainUnassign");
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __87__RMConfigurationMultipleApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke_60;
  v15[3] = &unk_25162F280;
  v11 = *(void **)(a1 + 48);
  v15[4] = *(_QWORD *)(a1 + 40);
  v12 = v11;
  v14 = *(void **)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 64);
  v16 = v12;
  v18 = v13;
  v17 = v14;
  objc_msgSend(v7, "_cleanupDeclarationKeysIfNeeded:scope:doIt:completionHandler:", v8, v9, v10, v15);

}

uint64_t __87__RMConfigurationMultipleApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke_60(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_uninstallDeclarationKeys:scope:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
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
  -[RMConfigurationMultipleApplicator wrappingAdapter](self, "wrappingAdapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __87__RMConfigurationMultipleApplicator__endProcessingWithSuccess_scope_completionHandler___block_invoke;
  v11[3] = &unk_25162EF90;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "endProcessingConfigurations:scope:completionHandler:", v6, a4, v11);

}

void __87__RMConfigurationMultipleApplicator__endProcessingWithSuccess_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "configurationMultipleApplicator");
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
        -[RMConfigurationMultipleApplicator adapter](self, "adapter", (_QWORD)v15);
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
  -[RMConfigurationMultipleApplicator adapter](self, "adapter", 0, 0);
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
  -[RMConfigurationMultipleApplicator adapter](self, "adapter", 0);
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
          objc_msgSend(MEMORY[0x24BE7EB20], "configurationMultipleApplicator");
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

  objc_msgSend(MEMORY[0x24BE7EB20], "configurationMultipleApplicator");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[RMConfigurationMultipleApplicator _usesKeychain].cold.1(v3, v8, v9, v10, v11, v12, v13, v14);
  v15 = 0;
LABEL_15:

  return v15;
}

- (RMConfigurationMultipleAdapter)adapter
{
  return self->_adapter;
}

- (BOOL)inPlaceUpdates
{
  return self->_inPlaceUpdates;
}

- (void)setInPlaceUpdates:(BOOL)a3
{
  self->_inPlaceUpdates = a3;
}

- (BOOL)removeBeforeApply
{
  return self->_removeBeforeApply;
}

- (void)setRemoveBeforeApply:(BOOL)a3
{
  self->_removeBeforeApply = a3;
}

- (WrappedMultipleAdapter)wrappingAdapter
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

void __115__RMConfigurationMultipleApplicator__beginProcessingWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Failed to begin processing configurations: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __128__RMConfigurationMultipleApplicator__fetchExistingDeclarationKeysWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Failed to fetch declaration keys: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_installDeclarationKeys:scope:configurations:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Declaration not supported: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_installDeclarationKeys:scope:configurations:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Incorrect declaration class: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_5_0(a1), "key");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_1(&dword_245188000, v2, v3, "Applied new configuration: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_1();
}

void __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_2_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_5_0(a1), "key");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_245188000, v2, v3, "Failed to apply new configuration: %{public}@ error:%{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_2();
}

void __98__RMConfigurationMultipleApplicator__cleanupDeclarationKeysIfNeeded_scope_doIt_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_5_0(a1), "key");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_245188000, v2, v3, "Failed to unassign asset reference %{public}@: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_2();
}

void __87__RMConfigurationMultipleApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_5_0(a1), "key");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_1(&dword_245188000, v2, v3, "Removed configuration: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_1();
}

void __87__RMConfigurationMultipleApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_5_0(a1), "key");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_245188000, v2, v3, "Failed to remove configuration: %{public}@ error:%{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_2();
}

void __87__RMConfigurationMultipleApplicator__endProcessingWithSuccess_scope_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Failed to end processing configurations: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_usesKeychain
{
  OUTLINED_FUNCTION_0(&dword_245188000, a1, a3, "Uses keychain assets", a5, a6, a7, a8, 0);
}

@end
