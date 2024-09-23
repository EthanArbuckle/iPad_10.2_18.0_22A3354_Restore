@implementation RMStoreProfilesController

+ (id)newProfileControllerWithPrefix:(id)a3 scope:(int64_t)a4
{
  id v5;
  RMStoreProfilesController *v6;

  v5 = a3;
  v6 = -[RMStoreProfilesController initWithProfileIdentifierPrefix:scope:]([RMStoreProfilesController alloc], "initWithProfileIdentifierPrefix:scope:", v5, a4);

  return v6;
}

- (RMStoreProfilesController)initWithProfileIdentifierPrefix:(id)a3
{
  return -[RMStoreProfilesController initWithProfileIdentifierPrefix:scope:](self, "initWithProfileIdentifierPrefix:scope:", a3, 1);
}

- (RMStoreProfilesController)initWithProfileIdentifierPrefix:(id)a3 scope:(int64_t)a4
{
  id v6;
  RMStoreProfilesAdapter *v7;
  RMStoreProfilesController *v8;

  v6 = a3;
  v7 = -[RMStoreProfilesAdapter initWithScope:]([RMStoreProfilesAdapter alloc], "initWithScope:", a4);
  v8 = -[RMStoreProfilesController initWithProfilesAdapter:profileIdentifierPrefix:](self, "initWithProfilesAdapter:profileIdentifierPrefix:", v7, v6);

  return v8;
}

- (RMStoreProfilesController)initWithProfilesAdapter:(id)a3 profileIdentifierPrefix:(id)a4
{
  id v7;
  id v8;
  RMStoreProfilesController *v9;
  RMStoreProfilesController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RMStoreProfilesController;
  v9 = -[RMStoreProfilesController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_profilesAdapter, a3);
    objc_storeStrong((id *)&v10->_profileIdentifierPrefix, a4);
  }

  return v10;
}

- (id)installedProfileIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[RMStoreProfilesController installedProfileIdentifierByDeclarationKey](self, "installedProfileIdentifierByDeclarationKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)allPrefixedProfileIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[RMStoreProfilesController profilesAdapter](self, "profilesAdapter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allProfileIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__RMStoreProfilesController_allPrefixedProfileIdentifiers__block_invoke;
  v8[3] = &unk_25162FA98;
  v8[4] = self;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredSetUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __58__RMStoreProfilesController_allPrefixedProfileIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "profileIdentifierPrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hasPrefix:", v4);

  return v5;
}

- (id)profileIdentifierForConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "declaration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[RMStoreProfilesController profileIdentifierForDeclaration:store:](self, "profileIdentifierForDeclaration:store:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)profileIdentifierForDeclaration:(id)a3 store:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[RMStoreProfilesController declarationKeyForStore:declaration:](self, "declarationKeyForStore:declaration:", a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMStoreProfilesController installedProfileIdentifierByDeclarationKey](self, "installedProfileIdentifierByDeclarationKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)profileNameForProfileIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[RMStoreProfilesController profilesAdapter](self, "profilesAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "profileNameForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)installedProfileIdentifierByDeclarationKey
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  RMStoreProfilesController *v20;
  id v21;

  -[RMStoreProfilesController profilesAdapter](self, "profilesAdapter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "installedProfileIdentifierByDeclarationKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __71__RMStoreProfilesController_installedProfileIdentifierByDeclarationKey__block_invoke;
  v19 = &unk_25162FAC0;
  v20 = self;
  v6 = v5;
  v21 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v16);
  objc_msgSend(MEMORY[0x24BE7EB20], "profilesController", v16, v17, v18, v19, v20);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[RMStoreProfilesController installedProfileIdentifierByDeclarationKey].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  v14 = (void *)objc_msgSend(v6, "copy");
  return v14;
}

void __71__RMStoreProfilesController_installedProfileIdentifierByDeclarationKey__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v9, "subscriberIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "profileIdentifierPrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v9);

}

- (id)configurationByDeclarationKeyForConfigurations:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "store", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "declaration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[RMStoreProfilesController declarationKeyForStore:declaration:](self, "declarationKeyForStore:declaration:", v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v14);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)declarationKeyForStore:(id)a3 declaration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[RMStoreProfilesController profileIdentifierPrefix](self, "profileIdentifierPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[RMStoreDeclarationKey newDeclarationKeyWithSubscriberIdentifier:store:declaration:](RMStoreDeclarationKey, "newDeclarationKeyWithSubscriberIdentifier:store:declaration:", v8, v7, v6);

  return v9;
}

- (void)downloadAndInstallProfileConfiguration:(id)a3 fromURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "declaration");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "store");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[RMStoreProfilesController downloadAndInstallProfileDeclaration:store:fromURL:completionHandler:](self, "downloadAndInstallProfileDeclaration:store:fromURL:completionHandler:", v12, v11, v9, v8);
}

- (void)downloadAndInstallProfileDeclaration:(id)a3 store:(id)a4 fromURL:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  RMStoreProfilesController *v18;
  id v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __98__RMStoreProfilesController_downloadAndInstallProfileDeclaration_store_fromURL_completionHandler___block_invoke;
  v16[3] = &unk_25162FAE8;
  v17 = v10;
  v18 = self;
  v19 = v11;
  v20 = v12;
  v13 = v11;
  v14 = v12;
  v15 = v10;
  objc_msgSend(v13, "fetchDataAtURL:completionHandler:", a5, v16);

}

void __98__RMStoreProfilesController_downloadAndInstallProfileDeclaration_store_fromURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "profilesController");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __98__RMStoreProfilesController_downloadAndInstallProfileDeclaration_store_fromURL_completionHandler___block_invoke_cold_1(a1, (uint64_t)v6, v7);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "declarationKeyForStore:declaration:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_installProfileData:store:declarationKey:completionHandler:", v5, *(_QWORD *)(a1 + 48), v8, *(_QWORD *)(a1 + 56));

  }
}

- (void)_installProfileAtPath:(id)a3 store:(id)a4 declaration:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v14, "attributesOfItemAtPath:error:", v10, &v33);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v33;
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BDD0D08]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "declarationIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    if (objc_msgSend(v17, "longLongValue") >= 1 && objc_msgSend(v17, "longLongValue") < 30721)
    {
      v32 = 0;
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v10, 0, &v32);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v32;
      if (v24)
      {
        -[RMStoreProfilesController declarationKeyForStore:declaration:](self, "declarationKeyForStore:declaration:", v11, v12);
        v28 = v25;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __87__RMStoreProfilesController__installProfileAtPath_store_declaration_completionHandler___block_invoke;
        v29[3] = &unk_25162FB10;
        v30 = v18;
        v31 = v13;
        -[RMStoreProfilesController _installProfileData:store:declarationKey:completionHandler:](self, "_installProfileData:store:declarationKey:completionHandler:", v24, v11, v26, v29);

        v25 = v28;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE7EB20], "profilesController");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[RMStoreProfilesController _installProfileAtPath:store:declaration:completionHandler:].cold.3();

        (*((void (**)(id, _QWORD, id))v13 + 2))(v13, 0, v25);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x24BE7EB20], "profilesController");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[RMStoreProfilesController _installProfileAtPath:store:declaration:completionHandler:].cold.2((uint64_t)v18, v17, v19);

      v20 = (void *)MEMORY[0x24BDD1540];
      v34 = *MEMORY[0x24BDD0BA0];
      v35[0] = CFSTR("Invalid profile size");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("ProfilesErrorDomain"), 0, v21);
      v22 = objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, uint64_t))v13 + 2))(v13, 0, v22);
      v16 = (id)v22;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "profilesController");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[RMStoreProfilesController _installProfileAtPath:store:declaration:completionHandler:].cold.1();

    (*((void (**)(id, _QWORD, id))v13 + 2))(v13, 0, v16);
  }

}

void __87__RMStoreProfilesController__installProfileAtPath_store_declaration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BE7EB20];
  v7 = a2;
  objc_msgSend(v6, "profilesController");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __87__RMStoreProfilesController__installProfileAtPath_store_declaration_completionHandler___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    __87__RMStoreProfilesController__installProfileAtPath_store_declaration_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_installProfileData:(id)a3 store:(id)a4 declarationKey:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD *v23;
  _QWORD v24[4];
  id v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__4;
  v27[4] = __Block_byref_object_dispose__4;
  v28 = 0;
  -[RMStoreProfilesController installedProfileIdentifierByDeclarationKey](self, "installedProfileIdentifierByDeclarationKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __88__RMStoreProfilesController__installProfileData_store_declarationKey_completionHandler___block_invoke;
  v24[3] = &unk_25162FB38;
  v16 = v12;
  v25 = v16;
  v26 = v27;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v24);
  -[RMStoreProfilesController profilesAdapter](self, "profilesAdapter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __88__RMStoreProfilesController__installProfileData_store_declarationKey_completionHandler___block_invoke_2;
  v20[3] = &unk_25162FB88;
  v23 = v27;
  v20[4] = self;
  v18 = v11;
  v21 = v18;
  v19 = v13;
  v22 = v19;
  objc_msgSend(v17, "installProfileData:store:declarationKey:completionHandler:", v10, v18, v16, v20);

  _Block_object_dispose(v27, 8);
}

void __88__RMStoreProfilesController__installProfileData_store_declarationKey_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a3;
  objc_msgSend(a2, "keyWithoutServerToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "keyWithoutServerToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

void __88__RMStoreProfilesController__installProfileData_store_declarationKey_completionHandler___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint64_t v25;

  v5 = a2;
  v6 = a3;
  if (v6)
    goto LABEL_2;
  objc_msgSend(MEMORY[0x24BE7EB20], "profilesController");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __88__RMStoreProfilesController__installProfileData_store_declarationKey_completionHandler___block_invoke_2_cold_2((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

  v14 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
  if (!v14 || (objc_msgSend(v14, "isEqualToString:", v5) & 1) != 0)
  {
LABEL_2:
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "profilesController");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __88__RMStoreProfilesController__installProfileData_store_declarationKey_completionHandler___block_invoke_2_cold_1();

    v17 = (void *)a1[6];
    v16 = a1[7];
    v18 = *(_QWORD *)(*(_QWORD *)(v16 + 8) + 40);
    v20 = (void *)a1[4];
    v19 = a1[5];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __88__RMStoreProfilesController__installProfileData_store_declarationKey_completionHandler___block_invoke_28;
    v21[3] = &unk_25162FB60;
    v25 = v16;
    v24 = v17;
    v22 = v5;
    v23 = 0;
    objc_msgSend(v20, "uninstallProfileWithIdentifier:store:completionHandler:", v18, v19, v21);

  }
}

uint64_t __88__RMStoreProfilesController__installProfileData_store_declarationKey_completionHandler___block_invoke_28(uint64_t a1, uint64_t a2)
{
  NSObject *v3;

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "profilesController");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __88__RMStoreProfilesController__installProfileData_store_declarationKey_completionHandler___block_invoke_28_cold_1();

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)uninstallProfileWithIdentifier:(id)a3 store:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v8 = a3;
  v9 = (void *)MEMORY[0x24BE7EB20];
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "profilesController");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[RMStoreProfilesController uninstallProfileWithIdentifier:store:completionHandler:].cold.1((uint64_t)v8, v12, v13, v14, v15, v16, v17, v18);

  -[RMStoreProfilesController profilesAdapter](self, "profilesAdapter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "uninstallProfileWithIdentifier:store:completionHandler:", v8, v11, v10);

}

- (RMStoreProfilesAdapter)profilesAdapter
{
  return self->_profilesAdapter;
}

- (void)setProfilesAdapter:(id)a3
{
  objc_storeStrong((id *)&self->_profilesAdapter, a3);
}

- (NSString)profileIdentifierPrefix
{
  return self->_profileIdentifierPrefix;
}

- (void)setProfileIdentifierPrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileIdentifierPrefix, 0);
  objc_storeStrong((id *)&self->_profilesAdapter, 0);
}

- (void)installedProfileIdentifierByDeclarationKey
{
  OUTLINED_FUNCTION_4_1(&dword_245188000, a2, a3, "Profile identifiers by declaration key: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __98__RMStoreProfilesController_downloadAndInstallProfileDeclaration_store_fromURL_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "declarationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = a2;
  OUTLINED_FUNCTION_7_0(&dword_245188000, a3, v6, "Unable to download profile or declaration identifier %{public}@: %{public}@", (uint8_t *)&v7);

}

- (void)_installProfileAtPath:store:declaration:completionHandler:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7_0(&dword_245188000, v0, (uint64_t)v0, "Unable to check size of profile for declaration identifier %{public}@: %{public}@", v1);
  OUTLINED_FUNCTION_3();
}

- (void)_installProfileAtPath:(NSObject *)a3 store:declaration:completionHandler:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = 138543618;
  v6 = a1;
  v7 = 2048;
  v8 = objc_msgSend(a2, "longLongValue");
  OUTLINED_FUNCTION_7_0(&dword_245188000, a3, v4, "Profile for declaration identifier %{public}@ has invalid size %lld", (uint8_t *)&v5);
}

- (void)_installProfileAtPath:store:declaration:completionHandler:.cold.3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7_0(&dword_245188000, v0, (uint64_t)v0, "Unable to read profile for declaration identifier %{public}@: %{public}@", v1);
  OUTLINED_FUNCTION_3();
}

void __87__RMStoreProfilesController__installProfileAtPath_store_declaration_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_1(&dword_245188000, v0, v1, "Installed profile for declaration identifier %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __87__RMStoreProfilesController__installProfileAtPath_store_declaration_completionHandler___block_invoke_cold_2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_15();
  v3 = 2114;
  v4 = v0;
  OUTLINED_FUNCTION_7_0(&dword_245188000, v1, (uint64_t)v1, "Error installing profile for declaration identifier %{public}@: %{public}@", v2);
  OUTLINED_FUNCTION_3();
}

void __88__RMStoreProfilesController__installProfileData_store_declarationKey_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_1(&dword_245188000, v0, v1, "Uninstall old profile during replacement with identifier %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __88__RMStoreProfilesController__installProfileData_store_declarationKey_completionHandler___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_245188000, a2, a3, "Installed profile with identifier %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __88__RMStoreProfilesController__installProfileData_store_declarationKey_completionHandler___block_invoke_28_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_15();
  _os_log_error_impl(&dword_245188000, v0, OS_LOG_TYPE_ERROR, "Unable to uninstall old profile during replacement with identifier %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)uninstallProfileWithIdentifier:(uint64_t)a3 store:(uint64_t)a4 completionHandler:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_245188000, a2, a3, "Uninstalling profile with identifier %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
