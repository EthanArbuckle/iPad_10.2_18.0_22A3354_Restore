@implementation SEFidoKeyService

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_1);
  return (id)shared_singleton;
}

void __26__SEFidoKeyService_shared__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)shared_singleton;
  shared_singleton = v0;

}

- (id)createFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 challenge:(id)a5 usingSession:(id)a6 withSessionSEID:(id)a7 externalizedAuth:(id)a8 error:(id *)a9
{
  return -[SEFidoKeyService createFidoKeyForRelyingParty:relyingPartyAccountHash:challenge:usingSession:withSessionSEID:error:](self, "createFidoKeyForRelyingParty:relyingPartyAccountHash:challenge:usingSession:withSessionSEID:error:", a3, a4, a5, a6, a7, a9);
}

- (id)createFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 challenge:(id)a5 usingSession:(id)a6 withSessionSEID:(id)a7 error:(id *)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id *v17;
  id *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  id obj;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__2;
  v36 = __Block_byref_object_dispose__2;
  v37 = 0;
  +[SESClient sharedClient]();
  v17 = (id *)objc_claimAutoreleasedReturnValue();
  v18 = (id *)(v33 + 5);
  obj = (id)v33[5];
  -[SESClient synchronousRemoteObjectProxyWithError:](v17, &obj);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v18, obj);

  if (v19 && !v33[5])
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__2;
    v29 = __Block_byref_object_dispose__2;
    v30 = 0;
    if (v15)
    {
      +[SEProxy withSession:seid:](SEProxy, "withSession:seid:", v15, v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __118__SEFidoKeyService_createFidoKeyForRelyingParty_relyingPartyAccountHash_challenge_usingSession_withSessionSEID_error___block_invoke;
    v24[3] = &unk_24C2BCF40;
    v24[4] = &v25;
    v24[5] = &v32;
    objc_msgSend(v19, "createFiDOKeyForRelyingParty:relyingPartyAccountHash:challenge:usingProxy:callback:", v12, v13, v14, v21, v24);
    if (v15)

    if (a8)
      *a8 = objc_retainAutorelease((id)v33[5]);
    v20 = (id)v26[5];
    _Block_object_dispose(&v25, 8);

  }
  else if (a8)
  {
    SESEnsureError();
    v20 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  _Block_object_dispose(&v32, 8);
  return v20;
}

void __118__SEFidoKeyService_createFidoKeyForRelyingParty_relyingPartyAccountHash_challenge_usingSession_withSessionSEID_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)checkFidoKeyPresence:(id)a3 usingSession:(id)a4 withSessionSEID:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  NSObject *v18;
  void *v19;
  void *v20;
  int v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v24[0] = v10;
  v11 = (void *)MEMORY[0x24BDBCE30];
  v12 = a5;
  v13 = a4;
  objc_msgSend(v11, "arrayWithObjects:count:", v24, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SEFidoKeyService checkMultipleFidoKeyPresence:usingSession:withSessionSEID:error:](self, "checkMultipleFidoKeyPresence:usingSession:withSessionSEID:error:", v14, v13, v12, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count") == 1
    && (objc_msgSend(v15, "objectAtIndexedSubscript:", 0),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v16,
        (isKindOfClass & 1) != 0))
  {
    SESDefaultLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412290;
      v23 = v19;
      _os_log_impl(&dword_20A048000, v18, OS_LOG_TYPE_INFO, "Single Check Presence %@", (uint8_t *)&v22, 0xCu);

    }
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a6)
  {
    SESEnsureError();
    v20 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)signWithFidoKeyFor:(id)a3 challenge:(id)a4 forNFCKeyWithIdentifier:(id)a5 usingSession:(id)a6 withSessionSEID:(id)a7 externalizedAuth:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  char isKindOfClass;
  void *v28;
  char v29;
  id *v30;
  void *v31;
  void *v32;
  void *v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v34 = v15;
  v38[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v36 = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
  v35 = 0;
  -[SEFidoKeyService signMultipleWithFidoKeysFor:challenges:forEndpointIdentifiers:usingSession:withSessionSEID:externalizedAuth:error:](self, "signMultipleWithFidoKeysFor:challenges:forEndpointIdentifiers:usingSession:withSessionSEID:externalizedAuth:error:", v21, v22, v23, v18, v19, v20, &v35);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v35;
  if (v17)

  if (objc_msgSend(v24, "count") != 1)
  {
    v30 = a9;
    if (a9)
    {
      SESEnsureError();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_16:
    v28 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    v29 = objc_opt_isKindOfClass();

    if ((v29 & 1) != 0)
    {
      v30 = a9;
      if (a9)
      {
        objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
        v28 = 0;
        *v30 = v31;
        goto LABEL_17;
      }
    }
    else
    {
      v28 = a9;
      if (!a9)
        goto LABEL_17;
      SESDefaultLogObject();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      SESCreateAndLogError();
      *a9 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_16;
  }
LABEL_17:

  return v28;
}

- (id)verifyWithFidoKeyFor:(id)a3 signedChallenge:(id)a4 usingSession:(id)a5 withSessionSEID:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id *v15;
  id *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  id obj;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__2;
  v33 = __Block_byref_object_dispose__2;
  v34 = 0;
  +[SESClient sharedClient]();
  v15 = (id *)objc_claimAutoreleasedReturnValue();
  v16 = (id *)(v30 + 5);
  obj = (id)v30[5];
  -[SESClient synchronousRemoteObjectProxyWithError:](v15, &obj);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v16, obj);

  if (v17 && !v30[5])
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__2;
    v26 = __Block_byref_object_dispose__2;
    v27 = 0;
    if (v13)
    {
      +[SEProxy withSession:seid:](SEProxy, "withSession:seid:", v13, v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __92__SEFidoKeyService_verifyWithFidoKeyFor_signedChallenge_usingSession_withSessionSEID_error___block_invoke;
    v21[3] = &unk_24C2BCF68;
    v21[4] = &v22;
    v21[5] = &v29;
    objc_msgSend(v17, "verifyWithFidoKeyFor:signedChallenge:usingProxy:callback:", v11, v12, v19, v21);
    if (v13)

    if (a7)
      *a7 = objc_retainAutorelease((id)v30[5]);
    v18 = (id)v23[5];
    _Block_object_dispose(&v22, 8);

  }
  else if (a7)
  {
    SESEnsureError();
    v18 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  _Block_object_dispose(&v29, 8);
  return v18;
}

void __92__SEFidoKeyService_verifyWithFidoKeyFor_signedChallenge_usingSession_withSessionSEID_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)deleteFidoKeyFor:(id)a3 usingSession:(id)a4 withSessionSEID:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id *v12;
  id *v13;
  void *v14;
  BOOL v15;
  void *v16;
  _QWORD v18[5];
  id obj;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v25 = 0;
  +[SESClient sharedClient]();
  v12 = (id *)objc_claimAutoreleasedReturnValue();
  v13 = (id *)(v21 + 5);
  obj = (id)v21[5];
  -[SESClient synchronousRemoteObjectProxyWithError:](v12, &obj);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v13, obj);

  if (v14 && !v21[5])
  {
    if (v10)
    {
      +[SEProxy withSession:seid:](SEProxy, "withSession:seid:", v10, v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __72__SEFidoKeyService_deleteFidoKeyFor_usingSession_withSessionSEID_error___block_invoke;
    v18[3] = &unk_24C2BCCB0;
    v18[4] = &v20;
    objc_msgSend(v14, "deleteFiDOKeyFor:usingProxy:callback:", v9, v16, v18);
    if (v10)

    if (a6)
      *a6 = objc_retainAutorelease((id)v21[5]);
    v15 = v21[5] == 0;
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

  _Block_object_dispose(&v20, 8);
  return v15;
}

void __72__SEFidoKeyService_deleteFidoKeyFor_usingSession_withSessionSEID_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)checkMultipleFidoKeyPresence:(id)a3 usingSession:(id)a4 withSessionSEID:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id *v12;
  id *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  id obj;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__2;
  v32 = __Block_byref_object_dispose__2;
  v33 = 0;
  +[SESClient sharedClient]();
  v12 = (id *)objc_claimAutoreleasedReturnValue();
  v13 = (id *)(v29 + 5);
  obj = (id)v29[5];
  -[SESClient synchronousRemoteObjectProxyWithError:](v12, &obj);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v13, obj);

  if (v14 && !v29[5])
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__2;
    v25 = __Block_byref_object_dispose__2;
    v26 = 0;
    if (v10)
    {
      +[SEProxy withSession:seid:](SEProxy, "withSession:seid:", v10, v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __84__SEFidoKeyService_checkMultipleFidoKeyPresence_usingSession_withSessionSEID_error___block_invoke;
    v20[3] = &unk_24C2BCBF8;
    v20[4] = &v21;
    v20[5] = &v28;
    objc_msgSend(v14, "checkMultipleFidoKeyPresence:usingProxy:callback:", v9, v16, v20);
    if (v10)

    SESDefaultLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = v22[5];
      *(_DWORD *)buf = 138412290;
      v35 = v18;
      _os_log_impl(&dword_20A048000, v17, OS_LOG_TYPE_INFO, "Multiple Check Presence %@", buf, 0xCu);
    }

    v15 = (id)v22[5];
    _Block_object_dispose(&v21, 8);

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

  _Block_object_dispose(&v28, 8);
  return v15;
}

void __84__SEFidoKeyService_checkMultipleFidoKeyPresence_usingSession_withSessionSEID_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)signMultipleWithFidoKeysFor:(id)a3 challenges:(id)a4 forEndpointIdentifiers:(id)a5 usingSession:(id)a6 withSessionSEID:(id)a7 externalizedAuth:(id)a8 error:(id *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id *v18;
  id *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  id v27;
  _QWORD v28[6];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  id obj;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v27 = a3;
  v26 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__2;
  v40 = __Block_byref_object_dispose__2;
  v41 = 0;
  +[SESClient sharedClient]();
  v18 = (id *)objc_claimAutoreleasedReturnValue();
  v19 = (id *)(v37 + 5);
  obj = (id)v37[5];
  -[SESClient synchronousRemoteObjectProxyWithError:](v18, &obj);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v19, obj);

  if (v20 && !v37[5])
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__2;
    v33 = __Block_byref_object_dispose__2;
    v34 = 0;
    if (v15)
    {
      +[SEProxy withSession:seid:](SEProxy, "withSession:seid:", v15, v16);
      v23 = v26;
      v22 = v27;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
      v23 = v26;
      v22 = v27;
    }
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __134__SEFidoKeyService_signMultipleWithFidoKeysFor_challenges_forEndpointIdentifiers_usingSession_withSessionSEID_externalizedAuth_error___block_invoke;
    v28[3] = &unk_24C2BCBF8;
    v28[4] = &v29;
    v28[5] = &v36;
    objc_msgSend(v20, "signMultipleWithFidoKeysFor:challenges:forEndpointIdentifiers:externalizedAuth:usingProxy:callback:", v22, v23, v14, v17, v24, v28, v26);
    if (v15)

    v21 = (id)v30[5];
    _Block_object_dispose(&v29, 8);

  }
  else
  {
    if (a9)
    {
      SESEnsureError();
      v21 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
    v23 = v26;
    v22 = v27;
  }

  _Block_object_dispose(&v36, 8);
  return v21;
}

void __134__SEFidoKeyService_signMultipleWithFidoKeysFor_challenges_forEndpointIdentifiers_usingSession_withSessionSEID_externalizedAuth_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
