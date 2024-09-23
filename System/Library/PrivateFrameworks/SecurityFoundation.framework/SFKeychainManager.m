@implementation SFKeychainManager

void __36___SFKeychainManager_defaultManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[_SFKeychainManager initManager]([_SFKeychainManager alloc], "initManager");
  v1 = (void *)defaultManager_defaultManager;
  defaultManager_defaultManager = (uint64_t)v0;

}

void __46___SFKeychainManager_defaultOverCommitManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[_SFKeychainManager initOverCommitManager]([_SFKeychainManager alloc], "initOverCommitManager");
  v1 = (void *)defaultOverCommitManager_defaultOverCommitManager;
  defaultOverCommitManager_defaultOverCommitManager = (uint64_t)v0;

}

void __70___SFKeychainManager_setKey_forIdentifier_accessPolicy_resultHandler___block_invoke(uint64_t a1)
{
  const __CFDictionary *v2;
  OSStatus v3;
  OSStatus v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  OSStatus v8;

  objc_msgSend(*(id *)(a1 + 32), "_symmetricKeyAttributesForIdentifier:accessPolicy:key:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v3 = SecItemAdd(v2, 0);
  if (*(_QWORD *)(a1 + 64))
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "keychainReplyQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __70___SFKeychainManager_setKey_forIdentifier_accessPolicy_resultHandler___block_invoke_2;
    v6[3] = &unk_1E6F12F10;
    v8 = v4;
    v7 = *(id *)(a1 + 64);
    dispatch_async(v5, v6);

  }
}

void __70___SFKeychainManager_setKey_forIdentifier_accessPolicy_resultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(int *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  if ((_DWORD)v1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v1, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32), 1, 0);
  }
}

void __67___SFKeychainManager_setIdentity_forIdentifier_accessPolicy_error___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "generateAttributesForIdentityAndAddToKeychain:forIdentifier:accessPolicy:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  if (v2)
  {
    *(_BYTE *)(v3 + 24) = 0;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v2, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  else
  {
    *(_BYTE *)(v3 + 24) = 1;
  }
}

void __75___SFKeychainManager_setIdentity_forIdentifier_accessPolicy_resultHandler___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  int v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "generateAttributesForIdentityAndAddToKeychain:forIdentifier:accessPolicy:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  if (*(_QWORD *)(a1 + 64))
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "keychainReplyQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __75___SFKeychainManager_setIdentity_forIdentifier_accessPolicy_resultHandler___block_invoke_2;
    v5[3] = &unk_1E6F12F10;
    v7 = v3;
    v6 = *(id *)(a1 + 64);
    dispatch_async(v4, v5);

  }
}

void __75___SFKeychainManager_setIdentity_forIdentifier_accessPolicy_resultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(int *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  if ((_DWORD)v1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v1, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32), 1, 0);
  }
}

void __63___SFKeychainManager_keyForIdentifier_specifier_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  OSStatus v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  OSStatus v11;
  CFTypeRef result;

  objc_msgSend(*(id *)(a1 + 32), "_symmetricKeyAttributesForIdentifier:accessPolicy:key:", *(_QWORD *)(a1 + 40), 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7018]);
  result = 0;
  v3 = SecItemCopyMatching((CFDictionaryRef)v2, &result);
  v4 = (void *)result;
  objc_msgSend(*(id *)(a1 + 32), "keychainReplyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63___SFKeychainManager_keyForIdentifier_specifier_resultHandler___block_invoke_2;
  block[3] = &unk_1E6F12F88;
  v8 = v4;
  v11 = v3;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v6 = v4;
  dispatch_async(v5, block);

}

void __63___SFKeychainManager_keyForIdentifier_specifier_resultHandler___block_invoke_2(uint64_t a1)
{
  int v2;
  BOOL v3;
  uint64_t v4;
  void *v5;
  SFTripleDESKey *v6;
  uint64_t v7;
  _SFTripleDESKeySpecifier *v8;
  _SFAESKey *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _SFAESKey *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;

  v2 = *(_DWORD *)(a1 + 56);
  if (*(_QWORD *)(a1 + 32))
    v3 = v2 == 0;
  else
    v3 = 0;
  if (!v3)
  {
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v2, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    +[_SFKeychainFetchResult fetchResultWithError:](_SFKeychainKeyFetchResult, "fetchResultWithError:", v22);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

    return;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = [_SFAESKey alloc];
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      v23 = 0;
      v9 = -[_SFSymmetricKey initWithData:specifier:error:](v13, "initWithData:specifier:error:", v14, v15, &v23);
      v16 = v23;
      if (v16)
      {
        v10 = v16;
        v11 = *(_QWORD *)(a1 + 48);
        goto LABEL_12;
      }
      if (v9)
      {
        v20 = *(_QWORD *)(a1 + 48);
        +[_SFKeychainFetchResult fetchResultWithValue:](_SFKeychainKeyFetchResult, "fetchResultWithValue:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v12);
        goto LABEL_16;
      }
    }
    else
    {
      v9 = 0;
    }
LABEL_17:
    v21 = *(_QWORD *)(a1 + 48);
    +[_SFKeychainFetchResult fetchResultWithValue:](_SFKeychainKeyFetchResult, "fetchResultWithValue:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v21 + 16))(v21, v10);
    goto LABEL_18;
  }
  v6 = [SFTripleDESKey alloc];
  v7 = *(_QWORD *)(a1 + 32);
  v8 = objc_alloc_init(_SFTripleDESKeySpecifier);
  v24 = 0;
  v9 = -[_SFSymmetricKey initWithData:specifier:error:](v6, "initWithData:specifier:error:", v7, v8, &v24);
  v10 = v24;

  v11 = *(_QWORD *)(a1 + 48);
  if (!v10)
  {
    +[_SFKeychainFetchResult fetchResultWithValue:](_SFKeychainKeyFetchResult, "fetchResultWithValue:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
LABEL_16:

    goto LABEL_17;
  }
LABEL_12:
  +[_SFKeychainFetchResult fetchResultWithError:](_SFKeychainKeyFetchResult, "fetchResultWithError:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v17);

  v18 = *(_QWORD *)(a1 + 48);
  +[_SFKeychainFetchResult fetchResultWithError:](_SFKeychainKeyFetchResult, "fetchResultWithError:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);

LABEL_18:
}

void __44___SFKeychainManager_identityForIdentifier___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  unsigned int v11;

  v11 = 0;
  v2 = (void *)a1[4];
  v3 = a1[5];
  v10 = 0;
  v4 = objc_msgSend(v2, "findPrivateKeyWithIdentifier:certificate:result:", v3, &v10, &v11);
  v5 = v10;
  v6 = (void *)a1[4];
  if (v4)
    objc_msgSend(v6, "foundPrivateKey:certificate:", v4, v5);
  else
    objc_msgSend(v6, "publicKeyLookupWithIdentifier:certificate:result:", a1[5], v5, v11);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1[6] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void __58___SFKeychainManager_identityForIdentifier_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id *v9;
  id v10;
  id *v11;
  id v12;
  _QWORD *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  void *v17;
  id v18;
  _QWORD v19[4];
  void *v20;
  id v21;
  id v22;
  unsigned int v23;

  v23 = 0;
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v22 = 0;
  v4 = objc_msgSend(v2, "findPrivateKeyWithIdentifier:certificate:result:", v3, &v22, &v23);
  v5 = v22;
  v6 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v6, "foundPrivateKey:certificate:", v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "keychainReplyQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __58___SFKeychainManager_identityForIdentifier_resultHandler___block_invoke_2;
    v19[3] = &unk_1E6F13000;
    v9 = &v21;
    v10 = *(id *)(a1 + 48);
    v11 = &v20;
    v20 = v7;
    v21 = v10;
    v12 = v7;
    v13 = v19;
  }
  else
  {
    objc_msgSend(v6, "publicKeyLookupWithIdentifier:certificate:result:", *(_QWORD *)(a1 + 40), v5, v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "keychainReplyQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __58___SFKeychainManager_identityForIdentifier_resultHandler___block_invoke_3;
    v16[3] = &unk_1E6F13000;
    v9 = &v18;
    v15 = *(id *)(a1 + 48);
    v11 = &v17;
    v17 = v14;
    v18 = v15;
    v12 = v14;
    v13 = v16;
  }
  dispatch_async(v8, v13);

}

uint64_t __58___SFKeychainManager_identityForIdentifier_resultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __58___SFKeychainManager_identityForIdentifier_resultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __61___SFKeychainManager_removeItemWithIdentifier_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  const __CFDictionary *v13;
  OSStatus v14;
  NSObject *v15;
  id obj;
  _QWORD block[4];
  id v18;
  OSStatus v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _BYTE v27[128];
  _QWORD v28[6];

  v28[4] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CD6CA0];
  v28[0] = *MEMORY[0x1E0CD6CC0];
  v28[1] = v2;
  v3 = *MEMORY[0x1E0CD6CB8];
  v28[2] = *MEMORY[0x1E0CD6CA8];
  v28[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v22;
    v8 = *MEMORY[0x1E0CD6A90];
    v9 = *MEMORY[0x1E0CD6C98];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v12 = *(_QWORD *)(a1 + 32);
        v25[0] = v8;
        v25[1] = v9;
        v26[0] = v12;
        v26[1] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
        v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        v14 = SecItemDelete(v13);
        v6 |= v14 == 0;

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v5);
  }
  else
  {
    v14 = 0;
    v6 = 0;
  }

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "keychainReplyQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61___SFKeychainManager_removeItemWithIdentifier_resultHandler___block_invoke_2;
    block[3] = &unk_1E6F13050;
    v20 = v6 & 1;
    v18 = *(id *)(a1 + 48);
    v19 = v14;
    dispatch_async(v15, block);

  }
}

void __61___SFKeychainManager_removeItemWithIdentifier_resultHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  if (*(_BYTE *)(a1 + 44))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], *(int *)(a1 + 40), 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

@end
