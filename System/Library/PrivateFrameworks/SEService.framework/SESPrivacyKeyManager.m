@implementation SESPrivacyKeyManager

+ (id)sharedManager
{
  if (sharedManager_onceToken[0] != -1)
    dispatch_once(sharedManager_onceToken, &__block_literal_global_7);
  return (id)sharedManager_shared;
}

void __37__SESPrivacyKeyManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_shared;
  sharedManager_shared = v0;

}

- (id)privacyKeysForGroupIdentifier:(id)a3 privacyKeyIdentifier:(id)a4 outError:(id *)a5
{
  id v7;
  id v8;
  id *v9;
  id *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  id obj;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v7 = a3;
  v8 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__10;
  v26 = __Block_byref_object_dispose__10;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__10;
  v20 = __Block_byref_object_dispose__10;
  v21 = 0;
  +[SESClient sharedClient]();
  v9 = (id *)objc_claimAutoreleasedReturnValue();
  v10 = (id *)(v17 + 5);
  obj = (id)v17[5];
  -[SESClient synchronousRemoteObjectProxyWithError:](v9, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v10, obj);

  if (v11 && !v17[5])
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __84__SESPrivacyKeyManager_privacyKeysForGroupIdentifier_privacyKeyIdentifier_outError___block_invoke;
    v14[3] = &unk_24C2BCBF8;
    v14[4] = &v22;
    v14[5] = &v16;
    objc_msgSend(v11, "privacyKeysForGroupIdentifier:keyIdentifier:completion:", v7, v8, v14);
    if (a5)
      *a5 = objc_retainAutorelease((id)v17[5]);
    v12 = (id)v23[5];
  }
  else if (a5)
  {
    SESEnsureError();
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __84__SESPrivacyKeyManager_privacyKeysForGroupIdentifier_privacyKeyIdentifier_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)createPrivacyKeyForGroupIdentifier:(id)a3 withOptions:(id)a4 outError:(id *)a5
{
  id v7;
  id v8;
  id *v9;
  id *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  id obj;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v7 = a3;
  v8 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__10;
  v26 = __Block_byref_object_dispose__10;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__10;
  v20 = __Block_byref_object_dispose__10;
  v21 = 0;
  +[SESClient sharedClient]();
  v9 = (id *)objc_claimAutoreleasedReturnValue();
  v10 = (id *)(v17 + 5);
  obj = (id)v17[5];
  -[SESClient synchronousRemoteObjectProxyWithError:](v9, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v10, obj);

  if (v11 && !v17[5])
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __80__SESPrivacyKeyManager_createPrivacyKeyForGroupIdentifier_withOptions_outError___block_invoke;
    v14[3] = &unk_24C2BD658;
    v14[4] = &v22;
    v14[5] = &v16;
    objc_msgSend(v11, "createPrivacyKeyForGroupIdentifier:withOptions:completion:", v7, v8, v14);
    if (a5)
      *a5 = objc_retainAutorelease((id)v17[5]);
    v12 = (id)v23[5];
  }
  else if (a5)
  {
    SESEnsureError();
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __80__SESPrivacyKeyManager_createPrivacyKeyForGroupIdentifier_withOptions_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (BOOL)deletePrivacyKey:(id)a3 outError:(id *)a4
{
  id v5;
  id *v6;
  id *v7;
  void *v8;
  BOOL v9;
  _QWORD v11[5];
  id obj;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__10;
  v17 = __Block_byref_object_dispose__10;
  v18 = 0;
  +[SESClient sharedClient]();
  v6 = (id *)objc_claimAutoreleasedReturnValue();
  v7 = (id *)(v14 + 5);
  obj = (id)v14[5];
  -[SESClient synchronousRemoteObjectProxyWithError:](v6, &obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v7, obj);

  if (v8 && !v14[5])
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __50__SESPrivacyKeyManager_deletePrivacyKey_outError___block_invoke;
    v11[3] = &unk_24C2BCCB0;
    v11[4] = &v13;
    objc_msgSend(v8, "deletePrivacyKey:completion:", v5, v11);
    if (a4)
      *a4 = objc_retainAutorelease((id)v14[5]);
    v9 = v14[5] == 0;
  }
  else if (a4)
  {
    SESEnsureError();
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  _Block_object_dispose(&v13, 8);
  return v9;
}

void __50__SESPrivacyKeyManager_deletePrivacyKey_outError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)decryptPayload:(id)a3 withGroupIdentifier:(id)a4 outError:(id *)a5
{
  id v7;
  id v8;
  id *v9;
  id *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  id obj;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v7 = a3;
  v8 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__10;
  v26 = __Block_byref_object_dispose__10;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__10;
  v20 = __Block_byref_object_dispose__10;
  v21 = 0;
  +[SESClient sharedClient]();
  v9 = (id *)objc_claimAutoreleasedReturnValue();
  v10 = (id *)(v17 + 5);
  obj = (id)v17[5];
  -[SESClient synchronousRemoteObjectProxyWithError:](v9, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v10, obj);

  if (v11 && !v17[5])
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __68__SESPrivacyKeyManager_decryptPayload_withGroupIdentifier_outError___block_invoke;
    v14[3] = &unk_24C2BCD00;
    v14[4] = &v22;
    v14[5] = &v16;
    objc_msgSend(v11, "decryptPayload:withGroupIdentifier:completion:", v7, v8, v14);
    if (a5)
      *a5 = objc_retainAutorelease((id)v17[5]);
    v12 = (id)v23[5];
  }
  else if (a5)
  {
    SESEnsureError();
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __68__SESPrivacyKeyManager_decryptPayload_withGroupIdentifier_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)encryptData:(id)a3 scheme:(id)a4 recipientPublicKey:(id)a5 outError:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id *v12;
  id *v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  id obj;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__10;
  v29 = __Block_byref_object_dispose__10;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__10;
  v23 = __Block_byref_object_dispose__10;
  v24 = 0;
  +[SESClient sharedClient]();
  v12 = (id *)objc_claimAutoreleasedReturnValue();
  v13 = (id *)(v20 + 5);
  obj = (id)v20[5];
  -[SESClient synchronousRemoteObjectProxyWithError:](v12, &obj);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v13, obj);

  if (v14 && !v20[5])
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __71__SESPrivacyKeyManager_encryptData_scheme_recipientPublicKey_outError___block_invoke;
    v17[3] = &unk_24C2BD3C0;
    v17[4] = &v25;
    v17[5] = &v19;
    objc_msgSend(v14, "encryptPayload:encryptionScheme:recipientPublicKey:completion:", v9, v10, v11, v17);
    if (a6)
      *a6 = objc_retainAutorelease((id)v20[5]);
    v15 = (id)v26[5];
  }
  else if (a6)
  {
    SESEnsureError();
    v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v15;
}

void __71__SESPrivacyKeyManager_encryptData_scheme_recipientPublicKey_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

@end
