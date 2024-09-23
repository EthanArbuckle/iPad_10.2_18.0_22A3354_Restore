@implementation RMAssetResolverController

+ (void)resolveUserNameAndPasswordAsset:(id)a3 assetIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  RMStoreUnresolvedAsset *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    objc_msgSend(v7, "store");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assetWithIdentifier:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = -[RMStoreUnresolvedAsset initWithAsset:queryParameters:]([RMStoreUnresolvedAsset alloc], "initWithAsset:queryParameters:", v11, 0);
        objc_msgSend(v7, "store");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_2;
        v21[3] = &unk_25162EF40;
        v22 = v11;
        v23 = v10;
        v24 = v9;
        objc_msgSend(v13, "resolveAsset:completionHandler:", v12, v21);

        v14 = v22;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE7EB20], "assetResolverController");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          +[RMAssetResolverController resolveUserNameAndPasswordAsset:assetIdentifier:completionHandler:].cold.3();

        v18 = (void *)MEMORY[0x24BE7EB08];
        objc_msgSend(v11, "declarationType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "createAssetTypeInvalidError:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke;
        v25[3] = &unk_25162EF18;
        v26 = v20;
        v27 = v9;
        v12 = v20;
        objc_msgSend(v10, "assetEncounteredInternalError:error:completionHandler:", v11, v12, v25);

        v14 = v27;
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x24BE7EB20], "assetResolverController");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        +[RMAssetResolverController resolveUserNameAndPasswordAsset:assetIdentifier:completionHandler:].cold.2();

      objc_msgSend(MEMORY[0x24BE7EB08], "createInternalError");
      v12 = (RMStoreUnresolvedAsset *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, RMStoreUnresolvedAsset *))v9 + 2))(v9, 0, v12);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "assetResolverController");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      +[RMAssetResolverController resolveUserNameAndPasswordAsset:assetIdentifier:completionHandler:].cold.1();

    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }

}

uint64_t __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id *v17;
  id *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;

  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "assetResolverController");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_2_cold_3();

    v8 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_8;
    v28[3] = &unk_25162EF18;
    v30 = *(id *)(a1 + 48);
    v29 = v5;
    objc_msgSend(v7, "assetCannotBeDownloaded:error:completionHandler:", v8, v29, v28);

    v9 = v30;
  }
  else
  {
    v10 = (void *)MEMORY[0x24BE7EC08];
    objc_msgSend(a2, "assetData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v10, "loadData:serializationType:error:", v11, 1, &v27);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v27;

    objc_msgSend(MEMORY[0x24BE7EB20], "assetResolverController");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v9)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_2_cold_2();

      v16 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(a1 + 40);
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_10;
      v24[3] = &unk_25162EF18;
      v17 = &v26;
      v26 = *(id *)(a1 + 48);
      v18 = &v25;
      v25 = v9;
      objc_msgSend(v15, "assetCannotBeDeserialized:error:completionHandler:", v16, v25, v24);
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_2_cold_1();

      v20 = *(_QWORD *)(a1 + 32);
      v19 = *(void **)(a1 + 40);
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_11;
      v21[3] = &unk_25162EF18;
      v17 = &v23;
      v23 = *(id *)(a1 + 48);
      v18 = &v22;
      v22 = v12;
      objc_msgSend(v19, "assetSuccessfullyResolved:completionHandler:", v20, v21);
    }

  }
}

uint64_t __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

+ (void)extractUserIdentityAsset:(id)a3 assetIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  NSObject *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    objc_msgSend(v7, "store");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assetWithIdentifier:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      objc_msgSend(MEMORY[0x24BE7EB20], "assetResolverController");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((isKindOfClass & 1) != 0)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          +[RMAssetResolverController extractUserIdentityAsset:assetIdentifier:completionHandler:].cold.3();

        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __88__RMAssetResolverController_extractUserIdentityAsset_assetIdentifier_completionHandler___block_invoke_14;
        v21[3] = &unk_25162EF18;
        v23 = v9;
        v22 = v11;
        objc_msgSend(v10, "assetSuccessfullyResolved:completionHandler:", v22, v21);

        v15 = v23;
      }
      else
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          +[RMAssetResolverController resolveUserNameAndPasswordAsset:assetIdentifier:completionHandler:].cold.3();

        v18 = (void *)MEMORY[0x24BE7EB08];
        objc_msgSend(v11, "declarationType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "createAssetTypeInvalidError:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __88__RMAssetResolverController_extractUserIdentityAsset_assetIdentifier_completionHandler___block_invoke;
        v24[3] = &unk_25162EF18;
        v25 = v20;
        v26 = v9;
        v15 = v20;
        objc_msgSend(v10, "assetEncounteredInternalError:error:completionHandler:", v11, v15, v24);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE7EB20], "assetResolverController");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        +[RMAssetResolverController resolveUserNameAndPasswordAsset:assetIdentifier:completionHandler:].cold.2();

      objc_msgSend(MEMORY[0x24BE7EB08], "createInternalError");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, id))v9 + 2))(v9, 0, v15);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "assetResolverController");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      +[RMAssetResolverController resolveUserNameAndPasswordAsset:assetIdentifier:completionHandler:].cold.1();

    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }

}

uint64_t __88__RMAssetResolverController_extractUserIdentityAsset_assetIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __88__RMAssetResolverController_extractUserIdentityAsset_assetIdentifier_completionHandler___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

+ (void)resolveKeychainAsset:(id)a3 assetIdentifier:(id)a4 subscriberIdentifier:(id)a5 completionHandler:(id)a6
{
  +[RMAssetResolverController resolveKeychainAsset:assetIdentifier:completionHandler:](RMAssetResolverController, "resolveKeychainAsset:assetIdentifier:completionHandler:", a3, a4, a6);
}

+ (void)resolveKeychainAsset:(id)a3 assetIdentifier:(id)a4 completionHandler:(id)a5
{
  +[RMAssetResolverController resolveKeychainAsset:assetIdentifier:accessGroup:completionHandler:](RMAssetResolverController, "resolveKeychainAsset:assetIdentifier:accessGroup:completionHandler:", a3, a4, &stru_25162FD48, a5);
}

+ (void)resolveKeychainAsset:(id)a3 assetIdentifier:(id)a4 accessGroup:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v10 = a6;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __96__RMAssetResolverController_resolveKeychainAsset_assetIdentifier_accessGroup_completionHandler___block_invoke;
  v12[3] = &unk_25162EF68;
  v13 = v10;
  v11 = v10;
  objc_msgSend(a1, "_resolveKeychainAsset:assetIdentifier:accessGroup:completionHandler:", a3, a4, a5, v12);

}

void __96__RMAssetResolverController_resolveKeychainAsset_assetIdentifier_accessGroup_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "assetKeychainReference");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

+ (void)resolveKeychainAssets:(id)a3 assetIdentifiers:(id)a4 accessGroup:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v11)
  {
    v13 = (void *)MEMORY[0x24BDBCEB8];
    v14 = a6;
    objc_msgSend(v13, "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectEnumerator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_resolveKeychainAssets:assetIdentifiers:accessGroup:persistentRefs:completionHandler:", v10, v16, v12, v15, v14);

  }
  else
  {
    v17 = (void *)MEMORY[0x24BE7EB20];
    v18 = a6;
    objc_msgSend(v17, "assetResolverController");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      +[RMAssetResolverController resolveKeychainAssets:assetIdentifiers:accessGroup:completionHandler:].cold.1();

    (*((void (**)(id, _QWORD, _QWORD))v18 + 2))(v18, 0, 0);
  }

}

+ (void)resolveKeychainPasswordAsset:(id)a3 assetIdentifier:(id)a4 accessGroup:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v10 = a6;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __104__RMAssetResolverController_resolveKeychainPasswordAsset_assetIdentifier_accessGroup_completionHandler___block_invoke;
  v12[3] = &unk_25162EF68;
  v13 = v10;
  v11 = v10;
  objc_msgSend(a1, "_resolveKeychainAsset:assetIdentifier:accessGroup:completionHandler:", a3, a4, a5, v12);

}

void __104__RMAssetResolverController_resolveKeychainPasswordAsset_assetIdentifier_accessGroup_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "assetKeychainReference");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetKeychainUserName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *, id))(v4 + 16))(v4, v8, v7, v5);
}

+ (void)resolveDataAsset:(id)a3 assetIdentifier:(id)a4 downloadURL:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  RMStoreUnresolvedAsset *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v10)
  {
    objc_msgSend(v9, "store");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetWithIdentifier:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = -[RMStoreUnresolvedAsset initWithAsset:queryParameters:downloadURL:]([RMStoreUnresolvedAsset alloc], "initWithAsset:queryParameters:downloadURL:", v14, 0, v11);
        objc_msgSend(v9, "store");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __92__RMAssetResolverController_resolveDataAsset_assetIdentifier_downloadURL_completionHandler___block_invoke_2;
        v24[3] = &unk_25162EF40;
        v25 = v14;
        v26 = v13;
        v27 = v12;
        objc_msgSend(v16, "resolveAsset:completionHandler:", v15, v24);

        v17 = v25;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE7EB20], "assetResolverController");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          +[RMAssetResolverController resolveUserNameAndPasswordAsset:assetIdentifier:completionHandler:].cold.3();

        v21 = (void *)MEMORY[0x24BE7EB08];
        objc_msgSend(v14, "declarationType");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "createAssetTypeInvalidError:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __92__RMAssetResolverController_resolveDataAsset_assetIdentifier_downloadURL_completionHandler___block_invoke;
        v28[3] = &unk_25162EF18;
        v29 = v23;
        v30 = v12;
        v15 = v23;
        objc_msgSend(v13, "assetEncounteredInternalError:error:completionHandler:", v14, v15, v28);

        v17 = v30;
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x24BE7EB20], "assetResolverController");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        +[RMAssetResolverController resolveUserNameAndPasswordAsset:assetIdentifier:completionHandler:].cold.2();

      objc_msgSend(MEMORY[0x24BE7EB08], "createInternalError");
      v15 = (RMStoreUnresolvedAsset *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, RMStoreUnresolvedAsset *))v12 + 2))(v12, 0, v15);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "assetResolverController");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      +[RMAssetResolverController resolveDataAsset:assetIdentifier:downloadURL:completionHandler:].cold.1();

    (*((void (**)(id, uint64_t, _QWORD))v12 + 2))(v12, 1, 0);
  }

}

uint64_t __92__RMAssetResolverController_resolveDataAsset_assetIdentifier_downloadURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __92__RMAssetResolverController_resolveDataAsset_assetIdentifier_downloadURL_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE7EB20], "assetResolverController");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_2_cold_3();

    v8 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __92__RMAssetResolverController_resolveDataAsset_assetIdentifier_downloadURL_completionHandler___block_invoke_19;
    v14[3] = &unk_25162EF18;
    v9 = &v16;
    v16 = *(id *)(a1 + 48);
    v15 = v4;
    objc_msgSend(v7, "assetCannotBeDownloaded:error:completionHandler:", v8, v15, v14);

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __92__RMAssetResolverController_resolveDataAsset_assetIdentifier_downloadURL_completionHandler___block_invoke_2_cold_1();

    v11 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __92__RMAssetResolverController_resolveDataAsset_assetIdentifier_downloadURL_completionHandler___block_invoke_20;
    v12[3] = &unk_25162EF90;
    v9 = &v13;
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v10, "assetSuccessfullyResolved:completionHandler:", v11, v12);
  }

}

uint64_t __92__RMAssetResolverController_resolveDataAsset_assetIdentifier_downloadURL_completionHandler___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __92__RMAssetResolverController_resolveDataAsset_assetIdentifier_downloadURL_completionHandler___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)_resolveKeychainAssets:(id)a3 assetIdentifiers:(id)a4 accessGroup:(id)a5 persistentRefs:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v13, "nextObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __114__RMAssetResolverController__resolveKeychainAssets_assetIdentifiers_accessGroup_persistentRefs_completionHandler___block_invoke;
    v18[3] = &unk_25162EFB8;
    v23 = v16;
    v19 = v15;
    v24 = a1;
    v20 = v12;
    v21 = v13;
    v22 = v14;
    objc_msgSend(a1, "_resolveKeychainAsset:assetIdentifier:accessGroup:completionHandler:", v20, v17, v22, v18);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v16 + 2))(v16, v15, 0);
  }

}

uint64_t __114__RMAssetResolverController__resolveKeychainAssets_assetIdentifiers_accessGroup_persistentRefs_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;

  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(a2, "assetKeychainReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  return objc_msgSend(*(id *)(a1 + 72), "_resolveKeychainAssets:assetIdentifiers:accessGroup:persistentRefs:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64));
}

+ (void)_resolveKeychainAsset:(id)a3 assetIdentifier:(id)a4 accessGroup:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, _QWORD, id);
  void *v13;
  void *v14;
  id v15;
  id *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  RMStoreUnresolvedKeychainAsset *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  void (**v33)(id, _QWORD, id);
  _QWORD v34[4];
  id v35;
  void (**v36)(id, _QWORD, id);

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD, id))a6;
  if (v10)
  {
    objc_msgSend(v9, "store");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetWithIdentifier:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BE7EB20], "assetResolverController");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        +[RMAssetResolverController resolveUserNameAndPasswordAsset:assetIdentifier:completionHandler:].cold.2();

      objc_msgSend(MEMORY[0x24BE7EB08], "createInternalError");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0, v15);
      goto LABEL_22;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x24BE7EB20], "assetResolverController");
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                +[RMAssetResolverController resolveUserNameAndPasswordAsset:assetIdentifier:completionHandler:].cold.3();

              v26 = (void *)MEMORY[0x24BE7EB08];
              objc_msgSend(v14, "declarationType");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "createAssetTypeInvalidError:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              v34[0] = MEMORY[0x24BDAC760];
              v34[1] = 3221225472;
              v34[2] = __97__RMAssetResolverController__resolveKeychainAsset_assetIdentifier_accessGroup_completionHandler___block_invoke;
              v34[3] = &unk_25162EF18;
              v35 = v28;
              v36 = v12;
              v15 = v28;
              objc_msgSend(v13, "assetEncounteredInternalError:error:completionHandler:", v14, v15, v34);

              goto LABEL_22;
            }
          }
        }
      }
    }
    v15 = v11;
    if (objc_msgSend(v15, "length"))
    {
LABEL_15:
      v18 = +[RMStoreDeclarationKey newDeclarationKeyWithSubscriberIdentifier:reference:](RMStoreDeclarationKey, "newDeclarationKeyWithSubscriberIdentifier:reference:", CFSTR("RMAssetResolverController"), v9, v11);
      v19 = +[RMStoreDeclarationKey newDeclarationKeyWithSubscriberIdentifier:store:declaration:](RMStoreDeclarationKey, "newDeclarationKeyWithSubscriberIdentifier:store:declaration:", CFSTR("RMAssetResolverController"), v13, v14);
      v20 = v13;
      v21 = -[RMStoreUnresolvedKeychainAsset initWithAsset:assetKey:configurationKey:group:defaultAccessibility:]([RMStoreUnresolvedKeychainAsset alloc], "initWithAsset:assetKey:configurationKey:group:defaultAccessibility:", v14, v19, v18, v15, 0);
      objc_msgSend(v9, "store");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __97__RMAssetResolverController__resolveKeychainAsset_assetIdentifier_accessGroup_completionHandler___block_invoke_2;
      v30[3] = &unk_25162EF40;
      v31 = v14;
      v32 = v20;
      v33 = v12;
      objc_msgSend(v22, "resolveAsset:completionHandler:", v21, v30);

      v13 = v20;
      v11 = v29;
LABEL_22:

      goto LABEL_23;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v16 = (id *)MEMORY[0x24BE7EB60];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_15;
        v17 = 0;
        goto LABEL_14;
      }
      v16 = (id *)MEMORY[0x24BE7EB58];
    }
    v17 = *v16;
LABEL_14:

    v15 = v17;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BE7EB20], "assetResolverController");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    +[RMAssetResolverController _resolveKeychainAsset:assetIdentifier:accessGroup:completionHandler:].cold.1();

  v12[2](v12, 0, 0);
LABEL_23:

}

uint64_t __97__RMAssetResolverController__resolveKeychainAsset_assetIdentifier_accessGroup_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __97__RMAssetResolverController__resolveKeychainAsset_assetIdentifier_accessGroup_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id *v11;
  id *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BE7EB20], "assetResolverController");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_2_cold_3();

    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __97__RMAssetResolverController__resolveKeychainAsset_assetIdentifier_accessGroup_completionHandler___block_invoke_29;
    v18[3] = &unk_25162EF18;
    v11 = &v20;
    v20 = *(id *)(a1 + 48);
    v12 = &v19;
    v19 = v6;
    objc_msgSend(v9, "assetCannotBeDownloaded:error:completionHandler:", v10, v19, v18);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __97__RMAssetResolverController__resolveKeychainAsset_assetIdentifier_accessGroup_completionHandler___block_invoke_2_cold_1();

    v14 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(a1 + 40);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __97__RMAssetResolverController__resolveKeychainAsset_assetIdentifier_accessGroup_completionHandler___block_invoke_30;
    v15[3] = &unk_25162EF18;
    v11 = &v17;
    v17 = *(id *)(a1 + 48);
    v12 = &v16;
    v16 = v5;
    objc_msgSend(v13, "assetSuccessfullyResolved:completionHandler:", v14, v15);
  }

}

uint64_t __97__RMAssetResolverController__resolveKeychainAsset_assetIdentifier_accessGroup_completionHandler___block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __97__RMAssetResolverController__resolveKeychainAsset_assetIdentifier_accessGroup_completionHandler___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

+ (void)resolveUserNameAndPasswordAsset:assetIdentifier:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_245188000, v0, v1, "Asset not specified for user name and password", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)resolveUserNameAndPasswordAsset:assetIdentifier:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Missing asset: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)resolveUserNameAndPasswordAsset:assetIdentifier:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Wrong asset type: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_245188000, v0, v1, "RMModelUserNameAndPasswordCredentialDeclaration resolved", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_2_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_245188000, v0, v1, "Could not deserialize credentials asset %{public}@: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_2_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_245188000, v0, v1, "Error resolving asset %{public}@: %{public}@");
  OUTLINED_FUNCTION_3();
}

+ (void)extractUserIdentityAsset:assetIdentifier:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_245188000, v0, v1, "RMModelUserIdentityDeclaration extracted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)resolveKeychainAssets:assetIdentifiers:accessGroup:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_245188000, v0, v1, "Assets not specified for keychain items", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)resolveDataAsset:assetIdentifier:downloadURL:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_245188000, v0, v1, "Asset not specified for data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __92__RMAssetResolverController_resolveDataAsset_assetIdentifier_downloadURL_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_245188000, v0, v1, "RMModelAssetDataDeclaration resolved", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)_resolveKeychainAsset:assetIdentifier:accessGroup:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_245188000, v0, v1, "Asset not specified for keychain item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __97__RMAssetResolverController__resolveKeychainAsset_assetIdentifier_accessGroup_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_245188000, v0, v1, "Keychain asset resolved", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
