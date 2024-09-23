@implementation RMConfigurationSubscriberClient

+ (int)runConfigurationSubscriberClientWithApplicators:(id)a3 publisherClass:(Class)a4
{
  return objc_msgSend(a1, "runConfigurationSubscriberClientWithApplicators:publisherClass:initializeSandbox:", a3, a4, 1);
}

+ (int)runConfigurationSubscriberClientWithApplicators:(id)a3 publisherClass:(Class)a4 initializeSandbox:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  RMConfigurationSubscriberXPCListenerDelegate *v19;
  void *v20;
  int v21;
  Class v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v5 = a5;
  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberClient");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    +[RMConfigurationSubscriberClient runConfigurationSubscriberClientWithApplicators:publisherClass:initializeSandbox:].cold.2(v9);

  objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberClient");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    +[RMConfigurationSubscriberClient runConfigurationSubscriberClientWithApplicators:publisherClass:initializeSandbox:].cold.1(v5, v10, v11);

  if (v5 && !objc_msgSend(MEMORY[0x24BE7EB38], "configureSandbox"))
  {
    v21 = 78;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberClient");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      NSUserName();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v13;
      _os_log_impl(&dword_245188000, v12, OS_LOG_TYPE_INFO, "User: %@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberClient");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      NSHomeDirectory();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v15;
      _os_log_impl(&dword_245188000, v14, OS_LOG_TYPE_INFO, "Home directory: %@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberClient");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      NSTemporaryDirectory();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      _os_log_impl(&dword_245188000, v16, OS_LOG_TYPE_INFO, "Temp directory: %@", buf, 0xCu);

    }
    objc_msgSend(a1, "_loadDynamicSchema");
    objc_msgSend(a1, "_registerApplicatorModelClasses:", v8);
    if (a4)
    {
      v23 = a4;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_registerPublisherModelClasses:", v18);

    }
    v19 = -[RMConfigurationSubscriberXPCListenerDelegate initWithApplicators:publisherClass:]([RMConfigurationSubscriberXPCListenerDelegate alloc], "initWithApplicators:publisherClass:", v8, a4);
    objc_msgSend(MEMORY[0x24BDD1998], "serviceListener");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDelegate:", v19);
    objc_msgSend(v20, "resume");

    v21 = 0;
  }

  return v21;
}

+ (void)_loadDynamicSchema
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  v2 = (void *)MEMORY[0x24BE7EB18];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resourceURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationSchemaDirectoryForXPCServiceResourceURL:", v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if ((_DWORD)v4)
    objc_msgSend(MEMORY[0x24BE7EBC8], "loadDynamicSchemaFromDirectory:", v14);
  v7 = (void *)MEMORY[0x24BE7EB18];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resourceURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "statusSchemaDirectoryForXPCServiceResourceURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

  if (v13)
    objc_msgSend(MEMORY[0x24BE7EC00], "loadDynamicSchemaFromDirectory:", v10);

}

+ (void)_registerApplicatorModelClasses:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v8, "supportedConfigurationClassesArray");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE7EBB0], "ensureClassForDeclarations:", v9);
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
            goto LABEL_11;
          objc_msgSend(v8, "supportedConfigurationClasses");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)MEMORY[0x24BE7EBB0];
          objc_msgSend(v9, "allObjects");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "ensureClassForDeclarations:", v11);

        }
LABEL_11:
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

+ (void)_registerPublisherModelClasses:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v8, "supportedStatusClasses");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE7EBB0], "ensureClassForStatusItems:", v9);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)fetchConfigurationsWithTypes:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  int64_t v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __88__RMConfigurationSubscriberClient_fetchConfigurationsWithTypes_scope_completionHandler___block_invoke;
  v12[3] = &unk_25162F410;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a4;
  v10 = v9;
  v11 = v8;
  +[RMSubscriberStore subscribedStoreDeclarationsWithScope:configurationTypes:completionHandler:](RMSubscriberStore, "subscribedStoreDeclarationsWithScope:configurationTypes:completionHandler:", a4, v11, v12);

}

void __88__RMConfigurationSubscriberClient_fetchConfigurationsWithTypes_scope_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v36 = a3;
  v8 = a4;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "subscriberDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "subscriberDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "allObjects");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "didFailToFetchConfigurationsWithTypes:scope:error:", v11, *(_QWORD *)(a1 + 56), v8);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v33 = 0;
    v12 = (void *)objc_opt_new();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v35 = a1;
    v13 = *(id *)(a1 + 40);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v42 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
          v19 = (void *)objc_opt_new();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v15);
    }

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v34 = v7;
    v21 = v7;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v38 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
          v27 = *(void **)(v35 + 32);
          objc_msgSend(v26, "identifier", v33);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "_buildSubscribedReferences:declarations:store:", v12, v29, v26);

          objc_msgSend(v26, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v26, v30);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v23);
    }

    objc_msgSend(*(id *)(v35 + 32), "subscriberDelegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(*(id *)(v35 + 32), "subscriberDelegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "didFetchConfigurationsByType:storesByIdentifier:scope:completionHandler:", v12, v20, *(_QWORD *)(v35 + 56), *(_QWORD *)(v35 + 48));

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(v35 + 48) + 16))();
    }
    v8 = v33;
    v7 = v34;

  }
}

- (void)fetchConfigurationUIsWithTypes:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  int64_t v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __90__RMConfigurationSubscriberClient_fetchConfigurationUIsWithTypes_scope_completionHandler___block_invoke;
  v12[3] = &unk_25162F410;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a4;
  v10 = v9;
  v11 = v8;
  +[RMSubscriberStore subscribedStoreConfigurationsVisibleUIWithScope:configurationTypes:completionHandler:](RMSubscriberStore, "subscribedStoreConfigurationsVisibleUIWithScope:configurationTypes:completionHandler:", a4, v11, v12);

}

void __90__RMConfigurationSubscriberClient_fetchConfigurationUIsWithTypes_scope_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v36 = a3;
  v8 = a4;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "subscriberDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "subscriberDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "allObjects");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "didFailToFetchConfigurationsWithTypes:scope:error:", v11, *(_QWORD *)(a1 + 56), v8);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v33 = 0;
    v12 = (void *)objc_opt_new();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v35 = a1;
    v13 = *(id *)(a1 + 40);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v42 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
          v19 = (void *)objc_opt_new();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v15);
    }

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v34 = v7;
    v21 = v7;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v38 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
          v27 = *(void **)(v35 + 32);
          objc_msgSend(v26, "identifier", v33);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "_buildSubscribedReferences:declarations:store:", v12, v29, v26);

          objc_msgSend(v26, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v26, v30);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v23);
    }

    objc_msgSend(*(id *)(v35 + 32), "subscriberDelegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(*(id *)(v35 + 32), "subscriberDelegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "didFetchConfigurationsWithVisibleUIByType:storesByIdentifier:scope:completionHandler:", v12, v20, *(_QWORD *)(v35 + 56), *(_QWORD *)(v35 + 48));

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(v35 + 48) + 16))();
    }
    v8 = v33;
    v7 = v34;

  }
}

- (void)sendStatusKeys:(id)a3 storeIdentifier:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  RMConfigurationSubscriberClient *v18;
  id v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __90__RMConfigurationSubscriberClient_sendStatusKeys_storeIdentifier_scope_completionHandler___block_invoke;
  v16[3] = &unk_25162F460;
  v17 = v11;
  v18 = self;
  v19 = v10;
  v20 = v12;
  v13 = v10;
  v14 = v12;
  v15 = v11;
  +[RMSubscriberStore storeWithIdentifier:scope:completionHandler:](RMSubscriberStore, "storeWithIdentifier:scope:completionHandler:", v15, a5, v16);

}

void __90__RMConfigurationSubscriberClient_sendStatusKeys_storeIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberClient");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __90__RMConfigurationSubscriberClient_sendStatusKeys_storeIdentifier_scope_completionHandler___block_invoke_cold_2();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "publisherDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "publisherDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 48);
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __90__RMConfigurationSubscriberClient_sendStatusKeys_storeIdentifier_scope_completionHandler___block_invoke_26;
      v11[3] = &unk_25162F438;
      v12 = v10;
      v14 = *(id *)(a1 + 56);
      v13 = v5;
      objc_msgSend(v9, "fetchStatusForStatusKeys:store:completionHandler:", v12, v13, v11);

      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberClient");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __90__RMConfigurationSubscriberClient_sendStatusKeys_storeIdentifier_scope_completionHandler___block_invoke_cold_1(v7);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_7:

}

void __90__RMConfigurationSubscriberClient_sendStatusKeys_storeIdentifier_scope_completionHandler___block_invoke_26(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberClient");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __90__RMConfigurationSubscriberClient_sendStatusKeys_storeIdentifier_scope_completionHandler___block_invoke_26_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "publishStatus:completionHandler:", a2, *(_QWORD *)(a1 + 48));
  }

}

- (void)_buildSubscribedReferences:(id)a3 declarations:(id)a4 store:(id)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  RMSubscribedConfigurationReference *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  __int128 v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  void *v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v39 = a3;
  v7 = a4;
  v38 = a5;
  v8 = (void *)objc_opt_new();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v51 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v14, "declarationIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v15);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    }
    while (v11);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v9;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v47;
    *(_QWORD *)&v17 = 138543362;
    v36 = v17;
    v37 = *(_QWORD *)v47;
    do
    {
      v20 = 0;
      v40 = v18;
      do
      {
        if (*(_QWORD *)v47 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v20);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v21, "assetReferences");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v22, "count"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          v24 = v22;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v43;
            do
            {
              for (j = 0; j != v26; ++j)
              {
                if (*(_QWORD *)v43 != v27)
                  objc_enumerationMutation(v24);
                objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "identifier", v36);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "objectForKeyedSubscript:", v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                if (v30)
                  objc_msgSend(v23, "addObject:", v30);

              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
            }
            while (v26);
          }

          if (!objc_msgSend(v23, "count"))
          {

            v23 = 0;
          }
          v31 = -[RMSubscribedConfigurationReference initWithDeclaration:subscriberStore:assets:]([RMSubscribedConfigurationReference alloc], "initWithDeclaration:subscriberStore:assets:", v21, v38, v23);
          objc_msgSend(v21, "declarationType");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "objectForKeyedSubscript:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v33;
          v19 = v37;
          if (v33)
          {
            objc_msgSend(v33, "addObject:", v31);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberClient");
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v36;
              v55 = v32;
              _os_log_error_impl(&dword_245188000, v35, OS_LOG_TYPE_ERROR, "Store returned unexpected configuration type %{public}@ - ignoring", buf, 0xCu);
            }

          }
          v18 = v40;
        }
        ++v20;
      }
      while (v20 != v18);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
    }
    while (v18);
  }

}

- (RMConfigurationSubscriberDelegate)subscriberDelegate
{
  return self->_subscriberDelegate;
}

- (void)setSubscriberDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_subscriberDelegate, a3);
}

- (RMStatusPublisherDelegate)publisherDelegate
{
  return self->_publisherDelegate;
}

- (void)setPublisherDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_publisherDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherDelegate, 0);
  objc_storeStrong((id *)&self->_subscriberDelegate, 0);
}

+ (void)runConfigurationSubscriberClientWithApplicators:(char)a1 publisherClass:(NSObject *)a2 initializeSandbox:(uint64_t)a3 .cold.1(char a1, NSObject *a2, uint64_t a3)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("No");
  if ((a1 & 1) != 0)
    v3 = CFSTR("Yes");
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_2_1(&dword_245188000, a2, a3, "Will initialize Configuration Subscriber sandbox: %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3();
}

+ (void)runConfigurationSubscriberClientWithApplicators:(NSObject *)a1 publisherClass:initializeSandbox:.cold.2(NSObject *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_2_1(&dword_245188000, a1, v4, "Starting Configuration Subscriber XPC Service: %{public}@", (uint8_t *)&v5);

}

void __90__RMConfigurationSubscriberClient_sendStatusKeys_storeIdentifier_scope_completionHandler___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_245188000, log, OS_LOG_TYPE_DEBUG, "Status is not being published", v1, 2u);
}

void __90__RMConfigurationSubscriberClient_sendStatusKeys_storeIdentifier_scope_completionHandler___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_245188000, v0, v1, "Failed to lookup store %{public}@: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __90__RMConfigurationSubscriberClient_sendStatusKeys_storeIdentifier_scope_completionHandler___block_invoke_26_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_245188000, v0, v1, "Failed to fetch status keys %{public}@: %{public}@");
  OUTLINED_FUNCTION_3();
}

@end
