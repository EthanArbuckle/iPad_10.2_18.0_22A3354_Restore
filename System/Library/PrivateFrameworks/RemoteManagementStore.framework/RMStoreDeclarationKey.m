@implementation RMStoreDeclarationKey

+ (id)newDeclarationKey:(id)a3
{
  id v3;
  RMStoreDeclarationKey *v4;

  v3 = a3;
  v4 = -[RMStoreDeclarationKey initWithDeclarationKey:]([RMStoreDeclarationKey alloc], "initWithDeclarationKey:", v3);

  return v4;
}

+ (id)newDeclarationKeyWithSubscriberIdentifier:(id)a3 store:(id)a4 declaration:(id)a5
{
  id v7;
  id v8;
  id v9;
  RMStoreDeclarationKey *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[RMStoreDeclarationKey initWithSubscriberIdentifier:store:declaration:assets:]([RMStoreDeclarationKey alloc], "initWithSubscriberIdentifier:store:declaration:assets:", v9, v8, v7, 0);

  return v10;
}

+ (id)newDeclarationKeyWithSubscriberIdentifier:(id)a3 reference:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  RMStoreDeclarationKey *v17;
  void *v18;
  RMStoreDeclarationKey *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "declaration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "assetReferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v21 = v5;
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v23;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v23 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v14), "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "assetWithIdentifier:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
              objc_msgSend(v9, "addObject:", v16);

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v12);
      }

      v5 = v21;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  v17 = [RMStoreDeclarationKey alloc];
  objc_msgSend(v6, "store");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[RMStoreDeclarationKey initWithSubscriberIdentifier:store:declaration:assets:](v17, "initWithSubscriberIdentifier:store:declaration:assets:", v5, v18, v7, v9);

  return v19;
}

+ (id)newDeclarationKeyWithSubscriberIdentifier:(id)a3 storeIdentifier:(id)a4 declarationIdentifier:(id)a5 declarationServerToken:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  RMStoreDeclarationKey *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[RMStoreDeclarationKey initWithSubscriberIdentifier:storeIdentifier:declarationIdentifier:declarationServerToken:assets:]([RMStoreDeclarationKey alloc], "initWithSubscriberIdentifier:storeIdentifier:declarationIdentifier:declarationServerToken:assets:", v12, v11, v10, v9, 0);

  return v13;
}

+ (id)newDeclarationKeyWithSubscriberIdentifier:(id)a3 storeIdentifier:(id)a4 declarationIdentifier:(id)a5 declarationServerToken:(id)a6 assetKeys:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  RMStoreDeclarationKey *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[RMStoreDeclarationKey initWithSubscriberIdentifier:storeIdentifier:declarationIdentifier:declarationServerToken:assetKeys:]([RMStoreDeclarationKey alloc], "initWithSubscriberIdentifier:storeIdentifier:declarationIdentifier:declarationServerToken:assetKeys:", v15, v14, v13, v12, v11);

  return v16;
}

+ (id)newDeclarationKeyWithoutAssets:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  objc_msgSend(v3, "subscriberIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "declarationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "declarationServerToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = +[RMStoreDeclarationKey newDeclarationKeyWithSubscriberIdentifier:storeIdentifier:declarationIdentifier:declarationServerToken:](RMStoreDeclarationKey, "newDeclarationKeyWithSubscriberIdentifier:storeIdentifier:declarationIdentifier:declarationServerToken:", v4, v5, v6, v7);
  return v8;
}

- (RMStoreDeclarationKey)initWithDeclarationKey:(id)a3
{
  id v5;
  RMStoreDeclarationKey *v6;
  RMStoreDeclarationKey *v7;
  RMStoreDeclarationKey *v8;
  void *v9;
  NSString *subscriberIdentifier;
  NSString *storeIdentifier;
  NSString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *keyWithoutServerToken;
  _QWORD v18[4];
  RMStoreDeclarationKey *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)RMStoreDeclarationKey;
  v6 = -[RMStoreDeclarationKey init](&v25, sel_init);
  v7 = v6;
  if (v6)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __48__RMStoreDeclarationKey_initWithDeclarationKey___block_invoke;
    v18[3] = &unk_25162FA38;
    v20 = &v21;
    v8 = v6;
    v19 = v8;
    -[RMStoreDeclarationKey _parseDeclarationKey:completionHandler:](v8, "_parseDeclarationKey:completionHandler:", v5, v18);
    if (*((_BYTE *)v22 + 24))
    {
      objc_storeStrong((id *)&v8->_key, a3);
      v9 = (void *)MEMORY[0x24BDD17C8];
      subscriberIdentifier = v8->_subscriberIdentifier;
      storeIdentifier = v8->_storeIdentifier;
      v12 = v8->_declarationIdentifier;
      -[NSString dataUsingEncoding:](v12, "dataUsingEncoding:", 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@/%@:%@"), subscriberIdentifier, storeIdentifier, v14);
      v15 = objc_claimAutoreleasedReturnValue();
      keyWithoutServerToken = v8->_keyWithoutServerToken;
      v8->_keyWithoutServerToken = (NSString *)v15;

    }
    _Block_object_dispose(&v21, 8);
  }

  return v7;
}

void __48__RMStoreDeclarationKey_initWithDeclarationKey___block_invoke(uint64_t a1, char a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 24);
  *(_QWORD *)(v18 + 24) = v13;
  v31 = v13;

  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(void **)(v20 + 32);
  *(_QWORD *)(v20 + 32) = v14;
  v22 = v14;

  v23 = *(_QWORD *)(a1 + 32);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v15;
  v25 = v15;

  v26 = *(_QWORD *)(a1 + 32);
  v27 = *(void **)(v26 + 48);
  *(_QWORD *)(v26 + 48) = v16;
  v28 = v16;

  v29 = *(_QWORD *)(a1 + 32);
  v30 = *(void **)(v29 + 56);
  *(_QWORD *)(v29 + 56) = v17;

}

- (RMStoreDeclarationKey)initWithSubscriberIdentifier:(id)a3 store:(id)a4 declaration:(id)a5 assets:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  RMStoreDeclarationKey *v16;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  objc_msgSend(a4, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "declarationIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "declarationServerToken");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[RMStoreDeclarationKey initWithSubscriberIdentifier:storeIdentifier:declarationIdentifier:declarationServerToken:assets:](self, "initWithSubscriberIdentifier:storeIdentifier:declarationIdentifier:declarationServerToken:assets:", v12, v13, v14, v15, v10);
  return v16;
}

- (RMStoreDeclarationKey)initWithSubscriberIdentifier:(id)a3 storeIdentifier:(id)a4 declarationIdentifier:(id)a5 declarationServerToken:(id)a6 assets:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  id v24;
  RMStoreDeclarationKey *v25;
  RMStoreDeclarationKey *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = v16;
  if (v16 && objc_msgSend(v16, "count"))
  {
    v27 = self;
    v28 = v13;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v17, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v30 != v22)
            objc_enumerationMutation(v19);
          v24 = +[RMStoreAssetKey newAssetKeyWithAsset:](RMStoreAssetKey, "newAssetKeyWithAsset:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
          objc_msgSend(v18, "addObject:", v24);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v21);
    }

    v13 = v28;
    self = v27;
  }
  else
  {
    v18 = 0;
  }
  v25 = -[RMStoreDeclarationKey initWithSubscriberIdentifier:storeIdentifier:declarationIdentifier:declarationServerToken:assetKeys:](self, "initWithSubscriberIdentifier:storeIdentifier:declarationIdentifier:declarationServerToken:assetKeys:", v12, v13, v14, v15, v18);

  return v25;
}

- (RMStoreDeclarationKey)initWithSubscriberIdentifier:(id)a3 storeIdentifier:(id)a4 declarationIdentifier:(id)a5 declarationServerToken:(id)a6 assetKeys:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  RMStoreDeclarationKey *v17;
  RMStoreDeclarationKey *v18;
  void *v19;
  NSString *subscriberIdentifier;
  NSString *storeIdentifier;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *keyWithoutServerToken;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSString *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSString *key;
  void *v40;
  NSString *v41;
  void *v42;
  uint64_t v43;
  id v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  objc_super v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v47 = a5;
  v15 = a6;
  v16 = a7;
  v52.receiver = self;
  v52.super_class = (Class)RMStoreDeclarationKey;
  v17 = -[RMStoreDeclarationKey init](&v52, sel_init);
  v18 = v17;
  if (v17)
  {
    v45 = v14;
    v46 = v13;
    objc_storeStrong((id *)&v17->_subscriberIdentifier, a3);
    objc_storeStrong((id *)&v18->_storeIdentifier, a4);
    objc_storeStrong((id *)&v18->_declarationIdentifier, a5);
    objc_storeStrong((id *)&v18->_declarationServerToken, a6);
    v19 = (void *)MEMORY[0x24BDD17C8];
    subscriberIdentifier = v18->_subscriberIdentifier;
    storeIdentifier = v18->_storeIdentifier;
    -[NSString dataUsingEncoding:](v18->_declarationIdentifier, "dataUsingEncoding:", 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "base64EncodedStringWithOptions:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@/%@:%@"), subscriberIdentifier, storeIdentifier, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    keyWithoutServerToken = v18->_keyWithoutServerToken;
    v18->_keyWithoutServerToken = (NSString *)v24;

    if (v16 && objc_msgSend(v16, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v27 = v16;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v49;
        do
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v49 != v30)
              objc_enumerationMutation(v27);
            objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v31), "key");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObject:", v32);

            ++v31;
          }
          while (v29 != v31);
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        }
        while (v29);
      }

      objc_storeStrong((id *)&v18->_declarationAssets, a7);
      v33 = (void *)MEMORY[0x24BDD17C8];
      v34 = v18->_keyWithoutServerToken;
      -[NSString dataUsingEncoding:](v18->_declarationServerToken, "dataUsingEncoding:", 4);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "base64EncodedStringWithOptions:", 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "componentsJoinedByString:", CFSTR("$"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringWithFormat:", CFSTR("%@.%@$%@"), v34, v36, v37);
      v38 = objc_claimAutoreleasedReturnValue();
      key = v18->_key;
      v18->_key = (NSString *)v38;

    }
    else
    {
      v40 = (void *)MEMORY[0x24BDD17C8];
      v41 = v18->_keyWithoutServerToken;
      -[NSString dataUsingEncoding:](v18->_declarationServerToken, "dataUsingEncoding:", 4);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "base64EncodedStringWithOptions:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v40, "stringWithFormat:", CFSTR("%@.%@"), v41, v26);
      v43 = objc_claimAutoreleasedReturnValue();
      v36 = v18->_key;
      v18->_key = (NSString *)v43;
    }

    v14 = v45;
    v13 = v46;
  }

  return v18;
}

- (BOOL)isValid
{
  void *v2;
  BOOL v3;

  -[RMStoreDeclarationKey key](self, "key");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)keyByReplacingSubscriberIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[RMStoreDeclarationKey storeIdentifier](self, "storeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMStoreDeclarationKey declarationIdentifier](self, "declarationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMStoreDeclarationKey declarationServerToken](self, "declarationServerToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMStoreDeclarationKey declarationAssets](self, "declarationAssets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[RMStoreDeclarationKey newDeclarationKeyWithSubscriberIdentifier:storeIdentifier:declarationIdentifier:declarationServerToken:assetKeys:](RMStoreDeclarationKey, "newDeclarationKeyWithSubscriberIdentifier:storeIdentifier:declarationIdentifier:declarationServerToken:assetKeys:", v4, v5, v6, v7, v8);

  return v9;
}

+ (BOOL)assetDifferencesOnlyForOldKey:(id)a3 newKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int v21;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "keyWithoutServerToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyWithoutServerToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", v8))
  {
    objc_msgSend(v5, "declarationServerToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "declarationServerToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    if (!v11)
    {
      LOBYTE(v21) = 0;
      goto LABEL_13;
    }
    v12 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v5, "declarationAssets");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = MEMORY[0x24BDBD1A8];
    if (v13)
      v16 = v13;
    else
      v16 = MEMORY[0x24BDBD1A8];
    objc_msgSend(v12, "setWithArray:", v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v6, "declarationAssets");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = v18;
    else
      v20 = v15;
    objc_msgSend(v17, "setWithArray:", v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v7, "isEqualToSet:", v8) ^ 1;
  }
  else
  {
    LOBYTE(v21) = 0;
  }

LABEL_13:
  return v21;
}

+ (void)synchronizeOldKeys:(id)a3 newKeys:(id)a4 returningUnchangedKeys:(id *)a5 returningApplyKeys:(id *)a6 returningRemoveKeys:(id *)a7
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
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
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t m;
  void *v45;
  void *v46;
  char v47;
  void *v51;
  void *v52;
  void *v53;
  id obj;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = v8;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v64 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        objc_msgSend(v17, "keyWithoutServerToken");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, v18);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
    }
    while (v14);
  }

  v19 = v9;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v21 = v19;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v64;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v64 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
        objc_msgSend(v26, "keyWithoutServerToken");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v26, v27);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
    }
    while (v23);
  }

  v28 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v20, "allKeys");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setWithArray:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v21, "count"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v21, "count"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v12, "count"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v21;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v60;
    do
    {
      for (k = 0; k != v32; ++k)
      {
        if (*(_QWORD *)v60 != v33)
          objc_enumerationMutation(obj);
        v35 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * k);
        if ((objc_msgSend(v12, "containsObject:", v35) & 1) != 0)
        {
          objc_msgSend(v53, "addObject:", v35);
        }
        else
        {
          objc_msgSend(v35, "keyWithoutServerToken");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
            v38 = +[RMStoreDeclarationKeyPair newDeclarationKeyPairWithUpdateKey:replaceKey:](RMStoreDeclarationKeyPair, "newDeclarationKeyPairWithUpdateKey:replaceKey:", v35, v37);
          else
            v38 = +[RMStoreDeclarationKeyPair newDeclarationKeyPairWithNewKey:](RMStoreDeclarationKeyPair, "newDeclarationKeyPairWithNewKey:", v35);
          v39 = v38;
          objc_msgSend(v52, "addObject:", v38);

        }
      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    }
    while (v32);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v40 = v12;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v56;
    do
    {
      for (m = 0; m != v42; ++m)
      {
        if (*(_QWORD *)v56 != v43)
          objc_enumerationMutation(v40);
        v45 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * m);
        objc_msgSend(v45, "keyWithoutServerToken");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v30, "containsObject:", v46);

        if ((v47 & 1) == 0)
          objc_msgSend(v51, "addObject:", v45);
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
    }
    while (v42);
  }

  *a5 = (id)objc_msgSend(v53, "copy");
  *a6 = (id)objc_msgSend(v52, "copy");
  *a7 = (id)objc_msgSend(v51, "copy");

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMStoreDeclarationKey)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  RMStoreDeclarationKey *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("declaration-key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[RMStoreDeclarationKey initWithDeclarationKey:](self, "initWithDeclarationKey:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RMStoreDeclarationKey key](self, "key");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("declaration-key"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMStoreDeclarationKey subscriberIdentifier](self, "subscriberIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMStoreDeclarationKey storeIdentifier](self, "storeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMStoreDeclarationKey declarationIdentifier](self, "declarationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMStoreDeclarationKey declarationServerToken](self, "declarationServerToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { subscriber = %@, store = %@, identifier = %@, serverToken = %@ }>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  RMStoreDeclarationKey *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (RMStoreDeclarationKey *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[RMStoreDeclarationKey key](self, "key");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[RMStoreDeclarationKey key](v4, "key");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[RMStoreDeclarationKey key](self, "key");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  id v4;

  -[RMStoreDeclarationKey key](self, "key", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[RMStoreDeclarationKey newDeclarationKey:](RMStoreDeclarationKey, "newDeclarationKey:", v3);

  return v4;
}

- (void)_parseDeclarationKey:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD, __CFString *, __CFString *, __CFString *, __CFString *, void *);
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  id v33;

  v33 = a3;
  v5 = (void (**)(id, _QWORD, __CFString *, __CFString *, __CFString *, __CFString *, void *))a4;
  v6 = objc_msgSend(v33, "rangeOfString:", CFSTR("/"));
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
    v8 = 0;
    v9 = &stru_25162FD48;
    v10 = &stru_25162FD48;
    v11 = &stru_25162FD48;
    v12 = &stru_25162FD48;
  }
  else
  {
    v13 = v6;
    objc_msgSend(v33, "substringToIndex:", v6);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "substringFromIndex:", v13 + 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsSeparatedByString:", CFSTR(":"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count") == 2)
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsSeparatedByString:", CFSTR("$"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsSeparatedByString:", CFSTR("."));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");
      v8 = v20 == 2;
      v32 = v20 == 2;
      v30 = v19;
      v31 = v18;
      if (v20 == 2)
      {
        objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v28, 0);
        v10 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v21, 4);

        objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v22, 0);
        v9 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v23, 4);

        v8 = v32;
      }
      else
      {
        v9 = &stru_25162FD48;
        v10 = &stru_25162FD48;
      }
      if ((unint64_t)objc_msgSend(v17, "count") < 2)
      {
        v7 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v17, "count") - 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v17, "count") >= 2)
        {
          v27 = v15;
          v29 = v12;
          v24 = 1;
          do
          {
            objc_msgSend(v17, "objectAtIndexedSubscript:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = +[RMStoreAssetKey newAssetKey:](RMStoreAssetKey, "newAssetKey:", v25);
            objc_msgSend(v7, "addObject:", v26);

            ++v24;
          }
          while (v24 < objc_msgSend(v17, "count"));
          v12 = v29;
          v15 = v27;
        }
        v8 = v32;
      }

    }
    else
    {
      v7 = 0;
      v8 = 0;
      v9 = &stru_25162FD48;
      v10 = &stru_25162FD48;
      v11 = &stru_25162FD48;
    }

  }
  v5[2](v5, v8, v12, v11, v10, v9, v7);

}

- (NSString)key
{
  return self->_key;
}

- (RMStoreDeclarationKey)keyWithoutServerToken
{
  return (RMStoreDeclarationKey *)self->_keyWithoutServerToken;
}

- (NSString)subscriberIdentifier
{
  return self->_subscriberIdentifier;
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (NSString)declarationIdentifier
{
  return self->_declarationIdentifier;
}

- (NSString)declarationServerToken
{
  return self->_declarationServerToken;
}

- (NSArray)declarationAssets
{
  return self->_declarationAssets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declarationAssets, 0);
  objc_storeStrong((id *)&self->_declarationServerToken, 0);
  objc_storeStrong((id *)&self->_declarationIdentifier, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_subscriberIdentifier, 0);
  objc_storeStrong((id *)&self->_keyWithoutServerToken, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
