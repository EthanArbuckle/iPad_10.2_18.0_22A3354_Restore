@implementation OTClique(Framework)

- (BOOL)setLocalSecureElementIdentity:()Framework error:
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _BOOL8 v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD v21[5];
  id obj;
  uint8_t v23[4];
  uint64_t v24;
  __int128 buf;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  secLogObjForScope();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "ctx");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_19A7FA000, v7, OS_LOG_TYPE_DEFAULT, "setLocalSecureElementIdentity invoked for context:%@", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  objc_msgSend(a1, "ctx");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id *)(*((_QWORD *)&buf + 1) + 40);
  obj = *(id *)(*((_QWORD *)&buf + 1) + 40);
  objc_msgSend(v9, "makeOTControl:", &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v10, obj);

  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0CD5C78]);
    objc_msgSend(a1, "ctx");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithConfiguration:", v13);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __59__OTClique_Framework__setLocalSecureElementIdentity_error___block_invoke;
    v21[3] = &unk_1E39190E0;
    v21[4] = &buf;
    objc_msgSend(v11, "setLocalSecureElementIdentity:secureElementIdentity:reply:", v14, v6, v21);

    v15 = *((_QWORD *)&buf + 1);
    if (a4)
    {
      v16 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      if (v16)
      {
        *a4 = objc_retainAutorelease(v16);
        v15 = *((_QWORD *)&buf + 1);
      }
    }
    v17 = *(_QWORD *)(v15 + 40) == 0;
  }
  else
  {
    secLogObjForScope();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v23 = 138412290;
      v24 = v19;
      _os_log_impl(&dword_19A7FA000, v18, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", v23, 0xCu);
    }

    v17 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  }

  _Block_object_dispose(&buf, 8);
  return v17;
}

- (BOOL)removeLocalSecureElementIdentityPeerID:()Framework error:
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _BOOL8 v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD v21[5];
  id obj;
  uint8_t v23[4];
  uint64_t v24;
  __int128 buf;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  secLogObjForScope();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "ctx");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_19A7FA000, v7, OS_LOG_TYPE_DEFAULT, "removeLocalSecureElementIdentityPeerID invoked for context:%@", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  objc_msgSend(a1, "ctx");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id *)(*((_QWORD *)&buf + 1) + 40);
  obj = *(id *)(*((_QWORD *)&buf + 1) + 40);
  objc_msgSend(v9, "makeOTControl:", &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v10, obj);

  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0CD5C78]);
    objc_msgSend(a1, "ctx");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithConfiguration:", v13);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __68__OTClique_Framework__removeLocalSecureElementIdentityPeerID_error___block_invoke;
    v21[3] = &unk_1E39190E0;
    v21[4] = &buf;
    objc_msgSend(v11, "removeLocalSecureElementIdentityPeerID:secureElementIdentityPeerID:reply:", v14, v6, v21);

    v15 = *((_QWORD *)&buf + 1);
    if (a4)
    {
      v16 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      if (v16)
      {
        *a4 = objc_retainAutorelease(v16);
        v15 = *((_QWORD *)&buf + 1);
      }
    }
    v17 = *(_QWORD *)(v15 + 40) == 0;
  }
  else
  {
    secLogObjForScope();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v23 = 138412290;
      v24 = v19;
      _os_log_impl(&dword_19A7FA000, v18, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", v23, 0xCu);
    }

    v17 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  }

  _Block_object_dispose(&buf, 8);
  return v17;
}

- (id)fetchTrustedSecureElementIdentities:()Framework
{
  NSObject *v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD v18[6];
  id obj;
  __int128 v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  __int128 buf;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  secLogObjForScope();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "ctx");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_19A7FA000, v5, OS_LOG_TYPE_DEFAULT, "fetchTrustedSecureElementIdentities invoked for context:%@", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  objc_msgSend(a1, "ctx");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id *)(*((_QWORD *)&buf + 1) + 40);
  obj = *(id *)(*((_QWORD *)&buf + 1) + 40);
  objc_msgSend(v7, "makeOTControl:", &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v8, obj);

  if (v9)
  {
    *(_QWORD *)&v20 = 0;
    *((_QWORD *)&v20 + 1) = &v20;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy_;
    v23 = __Block_byref_object_dispose_;
    v24 = 0;
    v10 = objc_alloc(MEMORY[0x1E0CD5C78]);
    objc_msgSend(a1, "ctx");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithConfiguration:", v11);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __59__OTClique_Framework__fetchTrustedSecureElementIdentities___block_invoke;
    v18[3] = &unk_1E3919108;
    v18[4] = &v20;
    v18[5] = &buf;
    objc_msgSend(v9, "fetchTrustedSecureElementIdentities:reply:", v12, v18);

    if (a3)
    {
      v13 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      if (v13)
        *a3 = objc_retainAutorelease(v13);
    }
    v14 = *(id *)(*((_QWORD *)&v20 + 1) + 40);
    _Block_object_dispose(&v20, 8);

  }
  else
  {
    secLogObjForScope();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      LODWORD(v20) = 138412290;
      *(_QWORD *)((char *)&v20 + 4) = v16;
      _os_log_impl(&dword_19A7FA000, v15, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", (uint8_t *)&v20, 0xCu);
    }

    v14 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  }

  _Block_object_dispose(&buf, 8);
  return v14;
}

- (BOOL)setAccountSetting:()Framework error:
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _BOOL8 v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD v21[5];
  id obj;
  uint8_t v23[4];
  uint64_t v24;
  __int128 buf;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  secLogObjForScope();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "ctx");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_19A7FA000, v7, OS_LOG_TYPE_DEFAULT, "setAccountSetting invoked for context:%@", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  objc_msgSend(a1, "ctx");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id *)(*((_QWORD *)&buf + 1) + 40);
  obj = *(id *)(*((_QWORD *)&buf + 1) + 40);
  objc_msgSend(v9, "makeOTControl:", &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v10, obj);

  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0CD5C78]);
    objc_msgSend(a1, "ctx");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithConfiguration:", v13);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __47__OTClique_Framework__setAccountSetting_error___block_invoke;
    v21[3] = &unk_1E39190E0;
    v21[4] = &buf;
    objc_msgSend(v11, "setAccountSetting:setting:reply:", v14, v6, v21);

    v15 = *((_QWORD *)&buf + 1);
    if (a4)
    {
      v16 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      if (v16)
      {
        *a4 = objc_retainAutorelease(v16);
        v15 = *((_QWORD *)&buf + 1);
      }
    }
    v17 = *(_QWORD *)(v15 + 40) == 0;
  }
  else
  {
    secLogObjForScope();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v23 = 138412290;
      v24 = v19;
      _os_log_impl(&dword_19A7FA000, v18, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", v23, 0xCu);
    }

    v17 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  }

  _Block_object_dispose(&buf, 8);
  return v17;
}

- (id)fetchAccountSettings:()Framework
{
  NSObject *v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD v18[6];
  id obj;
  __int128 v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  __int128 buf;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  secLogObjForScope();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "ctx");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_19A7FA000, v5, OS_LOG_TYPE_DEFAULT, "fetchAccountSettings invoked for context:%@", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  objc_msgSend(a1, "ctx");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id *)(*((_QWORD *)&buf + 1) + 40);
  obj = *(id *)(*((_QWORD *)&buf + 1) + 40);
  objc_msgSend(v7, "makeOTControl:", &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v8, obj);

  if (v9)
  {
    *(_QWORD *)&v20 = 0;
    *((_QWORD *)&v20 + 1) = &v20;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy_;
    v23 = __Block_byref_object_dispose_;
    v24 = 0;
    v10 = objc_alloc(MEMORY[0x1E0CD5C78]);
    objc_msgSend(a1, "ctx");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithConfiguration:", v11);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __44__OTClique_Framework__fetchAccountSettings___block_invoke;
    v18[3] = &unk_1E3919130;
    v18[4] = &v20;
    v18[5] = &buf;
    objc_msgSend(v9, "fetchAccountSettings:reply:", v12, v18);

    if (a3)
    {
      v13 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      if (v13)
        *a3 = objc_retainAutorelease(v13);
    }
    v14 = *(id *)(*((_QWORD *)&v20 + 1) + 40);
    _Block_object_dispose(&v20, 8);

  }
  else
  {
    secLogObjForScope();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      LODWORD(v20) = 138412290;
      *(_QWORD *)((char *)&v20 + 4) = v16;
      _os_log_impl(&dword_19A7FA000, v15, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", (uint8_t *)&v20, 0xCu);
    }

    v14 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  }

  _Block_object_dispose(&buf, 8);
  return v14;
}

- (BOOL)waitForPriorityViewKeychainDataRecovery:()Framework
{
  NSObject *v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _BOOL8 v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD v19[5];
  id obj;
  uint8_t v21[4];
  uint64_t v22;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  secLogObjForScope();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "ctx");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_19A7FA000, v5, OS_LOG_TYPE_DEFAULT, "waitForPriorityViewKeychainDataRecovery invoked for context:%@", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  objc_msgSend(a1, "ctx");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id *)(*((_QWORD *)&buf + 1) + 40);
  obj = *(id *)(*((_QWORD *)&buf + 1) + 40);
  objc_msgSend(v7, "makeOTControl:", &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v8, obj);

  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0CD5C78]);
    objc_msgSend(a1, "ctx");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithConfiguration:", v11);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __63__OTClique_Framework__waitForPriorityViewKeychainDataRecovery___block_invoke;
    v19[3] = &unk_1E39190E0;
    v19[4] = &buf;
    objc_msgSend(v9, "waitForPriorityViewKeychainDataRecovery:reply:", v12, v19);

    v13 = *((_QWORD *)&buf + 1);
    if (a3)
    {
      v14 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      if (v14)
      {
        *a3 = objc_retainAutorelease(v14);
        v13 = *((_QWORD *)&buf + 1);
      }
    }
    v15 = *(_QWORD *)(v13 + 40) == 0;
  }
  else
  {
    secLogObjForScope();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v21 = 138412290;
      v22 = v17;
      _os_log_impl(&dword_19A7FA000, v16, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", v21, 0xCu);
    }

    v15 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  }

  _Block_object_dispose(&buf, 8);
  return v15;
}

- (id)tlkRecoverabilityForEscrowRecord:()Framework error:
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  _QWORD v25[6];
  id obj;
  uint8_t v27[4];
  uint64_t v28;
  __int16 v29;
  id v30;
  __int128 v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  __int128 buf;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  secLogObjForScope();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "ctx");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_19A7FA000, v7, OS_LOG_TYPE_DEFAULT, "tlkRecoverabiltyForEscrowRecord invoked for context:%@", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  v40 = 0;
  objc_msgSend(a1, "ctx");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id *)(*((_QWORD *)&buf + 1) + 40);
  obj = *(id *)(*((_QWORD *)&buf + 1) + 40);
  objc_msgSend(v9, "makeOTControl:", &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v10, obj);

  if (v11)
  {
    *(_QWORD *)&v31 = 0;
    *((_QWORD *)&v31 + 1) = &v31;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy_;
    v34 = __Block_byref_object_dispose_;
    v35 = 0;
    v12 = objc_alloc(MEMORY[0x1E0CD5C78]);
    objc_msgSend(a1, "ctx");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithConfiguration:", v13);
    objc_msgSend(v6, "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "ctx");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "escrowFetchSource");
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __62__OTClique_Framework__tlkRecoverabilityForEscrowRecord_error___block_invoke;
    v25[3] = &unk_1E3919180;
    v25[4] = &v31;
    v25[5] = &buf;
    objc_msgSend(v11, "tlkRecoverabilityForEscrowRecordData:recordData:source:reply:", v14, v15, v17, v25);

    if (a4)
    {
      v18 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      if (v18)
        *a4 = objc_retainAutorelease(v18);
    }
    secLogObjForScope();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 40);
      *(_DWORD *)v27 = 138412546;
      v28 = v20;
      v29 = 2112;
      v30 = v6;
      _os_log_impl(&dword_19A7FA000, v19, OS_LOG_TYPE_DEFAULT, "views %@ supported for record %@", v27, 0x16u);
    }

    v21 = *(id *)(*((_QWORD *)&v31 + 1) + 40);
    _Block_object_dispose(&v31, 8);

  }
  else
  {
    secLogObjForScope();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      LODWORD(v31) = 138412290;
      *(_QWORD *)((char *)&v31 + 4) = v23;
      _os_log_impl(&dword_19A7FA000, v22, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", (uint8_t *)&v31, 0xCu);
    }

    v21 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  }

  _Block_object_dispose(&buf, 8);
  return v21;
}

- (uint64_t)deliverAKDeviceListDelta:()Framework error:
{
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  secLogObjForScope();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "ctx");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_19A7FA000, v6, OS_LOG_TYPE_DEFAULT, "Unimplemented deliverAKDeviceListDelta for context:%@", (uint8_t *)&v9, 0xCu);

  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -4, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)removeRecoveryKeyFromSOSWhenInCircle:()Framework error:
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  _BOOL8 v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  secLogObjForScope();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A7FA000, v6, OS_LOG_TYPE_DEFAULT, "Removing recovery key when device is in circle", buf, 2u);
  }

  v27 = 0;
  v7 = objc_msgSend(MEMORY[0x1E0CD5C68], "isRecoveryKeySetInSOS:error:", v5, &v27);
  v8 = v27;
  v9 = v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 0;
  if (v10)
  {
    v26 = 0;
    v13 = objc_msgSend(MEMORY[0x1E0CD5C68], "ensureBackupKeyExistsinSOS:", &v26);
    v14 = v26;
    v15 = v14;
    if (!v13 || v14)
    {
      if (a4)
      {
        v19 = objc_retainAutorelease(v14);
LABEL_23:
        v12 = 0;
        *a4 = v19;
LABEL_35:

        goto LABEL_36;
      }
    }
    else
    {
      if ((SOSCCRegisterRecoveryPublicKey() & 1) != 0)
      {
        objc_msgSend(v5, "sbd");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
          v18 = v16;
        else
          v18 = objc_alloc_init((Class)getSecureBackupClass());
        v21 = v18;

        objc_msgSend(v21, "backupForRecoveryKeyWithInfo:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v22 == 0;
        if (v22)
        {
          secLogObjForScope();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v29 = v22;
            _os_log_impl(&dword_19A7FA000, v23, OS_LOG_TYPE_DEFAULT, "octagon-remove-recovery-key: failed to perform backup: %@", buf, 0xCu);
          }

          if (a4)
            *a4 = objc_retainAutorelease(v22);
        }
        else
        {
          secLogObjForScope();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19A7FA000, v24, OS_LOG_TYPE_DEFAULT, "Removed recovery key from SOS", buf, 2u);
          }

        }
        goto LABEL_35;
      }
      secLogObjForScope();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = 0;
        _os_log_impl(&dword_19A7FA000, v20, OS_LOG_TYPE_DEFAULT, "octagon-remove-recovery-key: failed to remove recovery key from SOS: %@", buf, 0xCu);
      }

      if (a4)
      {
        v19 = 0;
        goto LABEL_23;
      }
    }
    v12 = 0;
    goto LABEL_35;
  }
  secLogObjForScope();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v9;
    _os_log_impl(&dword_19A7FA000, v11, OS_LOG_TYPE_DEFAULT, "octagon-register-recovery-key, recovery key not registered in SOS: %@", buf, 0xCu);
  }

  v12 = 0;
  if (a4)
    *a4 = objc_retainAutorelease(v9);
LABEL_36:

  return v12;
}

- (unint64_t)removeRecoveryKeyFromSOSWhenNOTInCircle:()Framework error:
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  secLogObjForScope();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A7FA000, v6, OS_LOG_TYPE_DEFAULT, "Removing recovery key when not in circle", buf, 2u);
  }

  v18 = 0;
  if (SOSCCPushResetCircle())
  {
    secLogObjForScope();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A7FA000, v7, OS_LOG_TYPE_DEFAULT, "successfully pushed a reset circle", buf, 2u);
    }

    objc_msgSend(v5, "sbd");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (unint64_t)v8;
    if (v8)
      v10 = v8;
    else
      v10 = objc_alloc_init((Class)getSecureBackupClass());
    v12 = v10;

    v17 = 0;
    LODWORD(v9) = objc_msgSend(v12, "removeRecoveryKeyFromBackup:", &v17);
    v13 = v17;
    if (v13)
      v9 = 0;
    else
      v9 = v9;
    if ((v9 & 1) != 0)
    {
      secLogObjForScope();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19A7FA000, v14, OS_LOG_TYPE_DEFAULT, "removed recovery key from the backup", buf, 2u);
      }

    }
    else
    {
      secLogObjForScope();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v13;
        _os_log_impl(&dword_19A7FA000, v15, OS_LOG_TYPE_DEFAULT, "octagon-remove-recovery-key: failed to remove recovery key from the backup: %@", buf, 0xCu);
      }

      if (a4)
        *a4 = objc_retainAutorelease(v13);
    }

  }
  else
  {
    secLogObjForScope();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v18;
      _os_log_impl(&dword_19A7FA000, v11, OS_LOG_TYPE_DEFAULT, "octagon-remove-recovery-key: failed to push: %@", buf, 0xCu);
    }

    v9 = 0;
    if (a4)
      *a4 = v18;
  }

  return v9;
}

- (BOOL)removeRecoveryKey:()Framework error:
{
  id v6;
  NSObject *v7;
  int v8;
  int v9;
  int v10;
  id *v11;
  id v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _BOOL8 v21;
  NSObject *v22;
  uint64_t v23;
  _QWORD v25[5];
  id obj;
  uint64_t v27;
  _QWORD v28[2];
  uint8_t v29[4];
  uint64_t v30;
  __int128 buf;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35[3];

  v35[2] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  secLogObjForScope();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_19A7FA000, v7, OS_LOG_TYPE_DEFAULT, "Removing recovery key for context:%@", (uint8_t *)&buf, 0xCu);
  }

  v28[1] = 0;
  v8 = SOSCCThisDeviceIsInCircle();
  v9 = SOSCCIsSOSTrustAndSyncingEnabled();
  if (v8)
    v10 = 0;
  else
    v10 = v9;
  if (v10 == 1)
  {
    v28[0] = 0;
    objc_msgSend(a1, "removeRecoveryKeyFromSOSWhenInCircle:error:", v6, v28);
    v11 = (id *)v28;
  }
  else
  {
    v27 = 0;
    objc_msgSend(a1, "removeRecoveryKeyFromSOSWhenNOTInCircle:error:", v6, &v27);
    v11 = (id *)&v27;
  }
  v12 = *v11;
  if (v12)
  {
    secLogObjForScope();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v12;
    v14 = "octagon-remove-recovery-key, error removing recovery key from SOS: %@";
    v15 = v13;
    v16 = 12;
  }
  else
  {
    secLogObjForScope();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    LOWORD(buf) = 0;
    v14 = "Removed recovery key from SOS";
    v15 = v13;
    v16 = 2;
  }
  _os_log_impl(&dword_19A7FA000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&buf, v16);
LABEL_15:

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35[0] = 0;
  obj = 0;
  objc_msgSend(v6, "makeOTControl:", &obj);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v35, obj);
  if (v17)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C78]), "initWithConfiguration:", v6);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __47__OTClique_Framework__removeRecoveryKey_error___block_invoke;
    v25[3] = &unk_1E39190E0;
    v25[4] = &buf;
    objc_msgSend(v17, "removeRecoveryKey:reply:", v18, v25);

    v19 = *((_QWORD *)&buf + 1);
    if (a4)
    {
      v20 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      if (v20)
      {
        *a4 = objc_retainAutorelease(v20);
        v19 = *((_QWORD *)&buf + 1);
      }
    }
    v21 = *(_QWORD *)(v19 + 40) == 0;
  }
  else
  {
    secLogObjForScope();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v29 = 138412290;
      v30 = v23;
      _os_log_impl(&dword_19A7FA000, v22, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", v29, 0xCu);
    }

    v21 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  }

  _Block_object_dispose(&buf, 8);
  return v21;
}

+ (id)filterViableSOSRecords:()Framework
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "viabilityStatus", (_QWORD)v12) == 1)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)sortListPrioritizingiOSRecords:()Framework
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id obj;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v9, "escrowInformationMetadata");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "clientMetadata");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "hasSecureBackupUsesNumericPassphrase") & 1) != 0)
        {
          objc_msgSend(v9, "escrowInformationMetadata");
          v12 = v4;
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "clientMetadata");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "secureBackupUsesNumericPassphrase");

          v4 = v12;
          v16 = v12;
          if (v15)
            goto LABEL_11;
        }
        else
        {

        }
        v16 = v19;
LABEL_11:
        objc_msgSend(v16, "addObject:", v9);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  objc_msgSend(v4, "addObjectsFromArray:", v19);
  return v4;
}

+ (id)filterRecords:()Framework
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t i;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  NSObject *v61;
  int v62;
  void *v63;
  id v64;
  NSObject *v65;
  int v66;
  uint64_t v67;
  void *v68;
  void *v70;
  NSObject *v71;
  int v72;
  NSObject *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  id obj;
  id v80;
  id v81;
  id v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  uint8_t v101[128];
  uint8_t buf[4];
  void *v103;
  __int16 v104;
  void *v105;
  __int16 v106;
  void *v107;
  __int16 v108;
  int v109;
  _BYTE v110[128];
  _BYTE v111[128];
  uint64_t v112;

  v74 = a1;
  v112 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v82 = (id)objc_claimAutoreleasedReturnValue();
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v111, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v97;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v97 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v8);
        if (!objc_msgSend(v9, "recordViability", v74))
        {
          objc_msgSend(v9, "escrowInformationMetadata");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "bottleId");
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = (void *)v18;
            objc_msgSend(v9, "escrowInformationMetadata");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "bottleId");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "length");

            v16 = v4;
            if (v22)
              goto LABEL_16;
          }
          else
          {

          }
        }
        if (objc_msgSend(v9, "recordViability") == 1)
        {
          objc_msgSend(v9, "escrowInformationMetadata");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "bottleId");
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = (void *)v11;
            objc_msgSend(v9, "escrowInformationMetadata");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "bottleId");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "length");

            v16 = v75;
            if (v15)
              goto LABEL_16;
          }
          else
          {

          }
        }
        v16 = v82;
LABEL_16:
        objc_msgSend(v16, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v111, 16);
      v6 = v23;
    }
    while (v23);
  }

  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v24 = v4;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v92, v110, 16);
  v78 = v24;
  if (v25)
  {
    v26 = v25;
    v27 = *(id *)v93;
    v80 = *(id *)v93;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(id *)v93 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * i);
        secLogObjForScope();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v29, "label");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "escrowInformationMetadata");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "serial");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "escrowInformationMetadata");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "bottleId");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v29, "silentAttemptAllowed");
          *(_DWORD *)buf = 138413058;
          v103 = v31;
          v104 = 2112;
          v105 = v33;
          v106 = 2112;
          v107 = v35;
          v108 = 1024;
          v109 = v36;
          _os_log_impl(&dword_19A7FA000, v30, OS_LOG_TYPE_DEFAULT, "viable record: %@ serial:%@ bottleID:%@ silent allowed:%{BOOL}d", buf, 0x26u);

          v24 = v78;
          v27 = v80;
        }

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v92, v110, 16);
    }
    while (v26);
  }

  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v81 = v75;
  v37 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v88, v101, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v89;
    v76 = *(_QWORD *)v89;
    do
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v89 != v39)
          objc_enumerationMutation(v81);
        v41 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * j);
        secLogObjForScope();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v41, "label");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "escrowInformationMetadata");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "serial");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "escrowInformationMetadata");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "bottleId");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v41, "silentAttemptAllowed");
          *(_DWORD *)buf = 138413058;
          v103 = v43;
          v104 = 2112;
          v105 = v45;
          v106 = 2112;
          v107 = v47;
          v108 = 1024;
          v109 = v48;
          _os_log_impl(&dword_19A7FA000, v42, OS_LOG_TYPE_DEFAULT, "partially viable record: %@ serial:%@ bottleID:%@ silent allowed:%{BOOL}d", buf, 0x26u);

          v39 = v76;
        }

      }
      v38 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v88, v101, 16);
    }
    while (v38);
  }

  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v83 = v82;
  v49 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v84, v100, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v85;
    v77 = *(_QWORD *)v85;
    do
    {
      for (k = 0; k != v50; ++k)
      {
        if (*(_QWORD *)v85 != v51)
          objc_enumerationMutation(v83);
        v53 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * k);
        secLogObjForScope();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v53, "label");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "escrowInformationMetadata");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "serial");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "escrowInformationMetadata");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "bottleId");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v53, "silentAttemptAllowed");
          *(_DWORD *)buf = 138413058;
          v103 = v55;
          v104 = 2112;
          v105 = v57;
          v106 = 2112;
          v107 = v59;
          v108 = 1024;
          v109 = v60;
          _os_log_impl(&dword_19A7FA000, v54, OS_LOG_TYPE_DEFAULT, "nonviable record: %@ serial:%@ bottleID:%@ silent allowed:%{BOOL}d", buf, 0x26u);

          v51 = v77;
        }

      }
      v50 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v84, v100, 16);
    }
    while (v50);
  }

  if (objc_msgSend(v78, "count"))
  {
    secLogObjForScope();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      v62 = objc_msgSend(v78, "count");
      *(_DWORD *)buf = 67109120;
      LODWORD(v103) = v62;
      _os_log_impl(&dword_19A7FA000, v61, OS_LOG_TYPE_DEFAULT, "Returning %d viable records", buf, 8u);
    }

    v63 = v74;
    v64 = v78;
LABEL_55:
    objc_msgSend(v63, "sortListPrioritizingiOSRecords:", v64, v74);
    v67 = objc_claimAutoreleasedReturnValue();
LABEL_56:
    v68 = (void *)v67;
    goto LABEL_57;
  }
  if (objc_msgSend(v81, "count"))
  {
    secLogObjForScope();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      v66 = objc_msgSend(v81, "count");
      *(_DWORD *)buf = 67109120;
      LODWORD(v103) = v66;
      _os_log_impl(&dword_19A7FA000, v65, OS_LOG_TYPE_DEFAULT, "Returning %d partially viable records", buf, 8u);
    }

    v63 = v74;
    v64 = v81;
    goto LABEL_55;
  }
  if (!SOSCCIsSOSTrustAndSyncingEnabled())
  {
    secLogObjForScope();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A7FA000, v73, OS_LOG_TYPE_DEFAULT, "no viable records!", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v67 = objc_claimAutoreleasedReturnValue();
    goto LABEL_56;
  }
  objc_msgSend(v74, "filterViableSOSRecords:", v83);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  secLogObjForScope();
  v71 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    v72 = objc_msgSend(v70, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v103) = v72;
    _os_log_impl(&dword_19A7FA000, v71, OS_LOG_TYPE_DEFAULT, "Returning %d sos viable records", buf, 8u);
  }

  objc_msgSend(v74, "sortListPrioritizingiOSRecords:", v70);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_57:
  return v68;
}

+ (NSObject)fetchAndHandleEscrowRecords:()Framework shouldFilter:error:
{
  id v6;
  void *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t Nanoseconds;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t i;
  OTEscrowRecord *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  unsigned int v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  const void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  int v61;
  NSObject *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  void *v71;
  os_signpost_id_t v72;
  id v73;
  unint64_t v75;
  id v76;
  id obj;
  NSObject *v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  id v85;
  _BYTE v86[128];
  _BYTE buf[12];
  __int16 v88;
  double v89;
  __int16 v90;
  int v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _OctagonSignpostLogSystem();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _OctagonSignpostCreate();

  _OctagonSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v75 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19A7FA000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "FetchEscrowRecords", " enableTelemetry=YES ", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v8;
    _os_log_impl(&dword_19A7FA000, v11, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchEscrowRecords  enableTelemetry=YES ", buf, 0xCu);
  }

  v85 = 0;
  objc_msgSend(MEMORY[0x1E0CD5C68], "fetchEscrowRecordsInternal:error:", v6, &v85);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v85;
  if (v76)
  {
    secLogObjForScope();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v76;
      _os_log_impl(&dword_19A7FA000, v13, OS_LOG_TYPE_DEFAULT, "octagontrust-fetchAndHandleEscrowRecords: failed to fetch escrow records: %@", buf, 0xCu);
    }

    if (a5)
      *a5 = objc_retainAutorelease(v76);
    Nanoseconds = _OctagonSignpostGetNanoseconds();
    _OctagonSignpostLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v75 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_QWORD *)buf = 67240192;
      _os_signpost_emit_with_name_impl(&dword_19A7FA000, v16, OS_SIGNPOST_INTERVAL_END, v8, "FetchEscrowRecords", " OctagonSignpostNameFetchEscrowRecords=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEscrowRecords}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v8;
      v88 = 2048;
      v89 = (double)(unint64_t)Nanoseconds / 1000000000.0;
      v90 = 1026;
      v91 = 0;
      _os_log_impl(&dword_19A7FA000, v17, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchEscrowRecords  OctagonSignpostNameFetchEscrowRecords=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEscrowRecords}d ", buf, 0x1Cu);
    }
    v18 = 0;
    goto LABEL_70;
  }
  v72 = v8;
  v73 = v6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = objc_claimAutoreleasedReturnValue();
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v71 = v12;
  obj = v12;
  v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
  if (v80)
  {
    v79 = *(_QWORD *)v82;
    v78 = v17;
    do
    {
      for (i = 0; i != v80; ++i)
      {
        if (*(_QWORD *)v82 != v79)
          objc_enumerationMutation(obj);
        v20 = -[OTEscrowRecord initWithData:]([OTEscrowRecord alloc], "initWithData:", *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * i));
        -[OTEscrowRecord escrowInformationMetadata](v20, "escrowInformationMetadata");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "bottleValidity");
        v22 = objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = (void *)v22;
          -[OTEscrowRecord escrowInformationMetadata](v20, "escrowInformationMetadata");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "bottleValidity");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isEqualToString:", &stru_1E3919890);

          if (!v26)
            goto LABEL_31;
        }
        else
        {

        }
        v27 = -[OTEscrowRecord recordViability](v20, "recordViability");
        if (v27 == 2)
        {
          -[OTEscrowRecord escrowInformationMetadata](v20, "escrowInformationMetadata");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v28;
          v30 = CFSTR("invalid");
          goto LABEL_30;
        }
        if (v27 <= 1)
        {
          -[OTEscrowRecord escrowInformationMetadata](v20, "escrowInformationMetadata");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v28;
          v30 = CFSTR("valid");
LABEL_30:
          objc_msgSend(v28, "setBottleValidity:", v30);

        }
LABEL_31:
        -[OTEscrowRecord recordId](v20, "recordId");
        v31 = objc_claimAutoreleasedReturnValue();
        if (!v31
          || (v32 = (void *)v31,
              -[OTEscrowRecord recordId](v20, "recordId"),
              v33 = (void *)objc_claimAutoreleasedReturnValue(),
              v34 = objc_msgSend(v33, "isEqualToString:", &stru_1E3919890),
              v33,
              v32,
              v34))
        {
          -[OTEscrowRecord label](v20, "label");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "stringByReplacingOccurrencesOfString:withString:", *MEMORY[0x1E0CD5C98], &stru_1E3919890);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)objc_msgSend(v36, "mutableCopy");
          -[OTEscrowRecord setRecordId:](v20, "setRecordId:", v37);

        }
        -[OTEscrowRecord serialNumber](v20, "serialNumber");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          -[OTEscrowRecord serialNumber](v20, "serialNumber");
          v11 = objc_claimAutoreleasedReturnValue();
          if (!-[NSObject isEqualToString:](v11, "isEqualToString:", &stru_1E3919890))
            goto LABEL_42;
        }
        -[OTEscrowRecord escrowInformationMetadata](v20, "escrowInformationMetadata");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "peerInfo");
        v40 = objc_claimAutoreleasedReturnValue();
        if (!v40)
        {

          if (!v38)
            goto LABEL_43;
LABEL_42:

          goto LABEL_43;
        }
        v41 = (void *)v40;
        -[OTEscrowRecord escrowInformationMetadata](v20, "escrowInformationMetadata");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "peerInfo");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "length");

        if (v38)
        {

        }
        v17 = v78;
        if (v44)
        {
          -[OTEscrowRecord escrowInformationMetadata](v20, "escrowInformationMetadata");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "peerInfo");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = (const void *)SOSPeerInfoCreateFromData();

          v57 = (void *)SOSPeerInfoCopySerialNumber();
          -[OTEscrowRecord setSerialNumber:](v20, "setSerialNumber:", v57);

          -[OTEscrowRecord serialNumber](v20, "serialNumber");
          v58 = objc_claimAutoreleasedReturnValue();
          if (!v58
            || (v59 = (void *)v58,
                -[OTEscrowRecord serialNumber](v20, "serialNumber"),
                v60 = (void *)objc_claimAutoreleasedReturnValue(),
                v61 = objc_msgSend(v60, "isEqualToString:", &stru_1E3919890),
                v60,
                v59,
                v61))
          {
            secLogObjForScope();
            v62 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19A7FA000, v62, OS_LOG_TYPE_DEFAULT, "attempted to use peer info's serial number and failed, using metadata", buf, 2u);
            }

            -[OTEscrowRecord escrowInformationMetadata](v20, "escrowInformationMetadata");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "serial");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            -[OTEscrowRecord setSerialNumber:](v20, "setSerialNumber:", v64);

          }
          if (v47)
            CFRelease(v47);
          goto LABEL_59;
        }
LABEL_43:
        -[OTEscrowRecord serialNumber](v20, "serialNumber");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (v48)
        {
          -[OTEscrowRecord serialNumber](v20, "serialNumber");
          v6 = (id)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v6, "isEqualToString:", &stru_1E3919890) & 1) == 0)
            goto LABEL_51;
        }
        -[OTEscrowRecord escrowInformationMetadata](v20, "escrowInformationMetadata");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "serial");
        v50 = objc_claimAutoreleasedReturnValue();
        if (!v50)
        {

          if (!v48)
            goto LABEL_59;
LABEL_51:

          goto LABEL_59;
        }
        v51 = (void *)v50;
        -[OTEscrowRecord escrowInformationMetadata](v20, "escrowInformationMetadata");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "serial");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "isEqualToString:", &stru_1E3919890);

        if (v48)
        {

        }
        v17 = v78;
        if ((v54 & 1) == 0)
        {
          -[OTEscrowRecord escrowInformationMetadata](v20, "escrowInformationMetadata");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "serial");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[OTEscrowRecord setSerialNumber:](v20, "setSerialNumber:", v56);

        }
LABEL_59:
        -[NSObject addObject:](v17, "addObject:", v20);

      }
      v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
    }
    while (v80);
  }

  v65 = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v66 = objc_claimAutoreleasedReturnValue();
  v67 = v66;
  if (v75 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
  {
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = 1;
    _os_signpost_emit_with_name_impl(&dword_19A7FA000, v67, OS_SIGNPOST_INTERVAL_END, v72, "FetchEscrowRecords", " OctagonSignpostNameFetchEscrowRecords=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEscrowRecords}d ", buf, 8u);
  }

  _OctagonSignpostLogSystem();
  v68 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)&buf[4] = v72;
    v88 = 2048;
    v89 = (double)(unint64_t)v65 / 1000000000.0;
    v90 = 1026;
    v91 = 1;
    _os_log_impl(&dword_19A7FA000, v68, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchEscrowRecords  OctagonSignpostNameFetchEscrowRecords=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEscrowRecords}d ", buf, 0x1Cu);
  }

  v6 = v73;
  v12 = v71;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CD5C68], "filterRecords:", v17);
    v69 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v69 = v17;
    v17 = v69;
  }
  v18 = v69;
LABEL_70:

  return v18;
}

+ (id)fetchAllEscrowRecords:()Framework error:
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  secLogObjForScope();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "altDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_19A7FA000, v6, OS_LOG_TYPE_DEFAULT, "fetching all escrow records for context :%@, altdsid:%@", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CD5C68], "fetchAndHandleEscrowRecords:shouldFilter:error:", v5, 0, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)fetchEscrowRecords:()Framework error:
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  secLogObjForScope();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "altDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_19A7FA000, v6, OS_LOG_TYPE_DEFAULT, "fetching filtered escrow records for context:%@, altdsid:%@", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CD5C68], "fetchAndHandleEscrowRecords:shouldFilter:error:", v5, 1, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)handleRecoveryResults:()Framework recoveredInformation:record:performedSilentBurn:recoverError:error:
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  int v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  os_signpost_id_t v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  id v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD *v50;
  void *v51;
  void *v52;
  _QWORD *v53;
  void *v54;
  _QWORD *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  id v61;
  NSObject *v62;
  id v63;
  id v64;
  NSObject *v65;
  id v66;
  unsigned int v68;
  void *v69;
  uint64_t v70;
  id v71;
  int v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  id v79;
  _QWORD v80[7];
  char v81;
  id v82;
  uint8_t v83[4];
  os_signpost_id_t v84;
  __int128 buf;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  if ((objc_msgSend(a1, "isCloudServicesAvailable") & 1) != 0)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C68]), "initWithContextData:", v14);
    if (v17)
    {
      secLogObjForScope();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v17;
        _os_log_impl(&dword_19A7FA000, v19, OS_LOG_TYPE_DEFAULT, "octagontrust-handleRecoveryResults: sbd escrow recovery failed: %@", (uint8_t *)&buf, 0xCu);
      }

      v20 = 0;
      if (a8)
        *a8 = objc_retainAutorelease(v17);
      goto LABEL_93;
    }
    objc_msgSend(v14, "otControl");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v14, "otControl");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = 0;
    }
    else
    {
      v82 = 0;
      objc_msgSend(v14, "makeOTControl:", &v82);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = v82;
    }
    if (!v77)
    {
      secLogObjForScope();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v76;
        _os_log_impl(&dword_19A7FA000, v38, OS_LOG_TYPE_DEFAULT, "octagontrust-handleRecoveryResults: unable to create otcontrol: %@", (uint8_t *)&buf, 0xCu);
      }

      v20 = 0;
      if (a8)
        *a8 = objc_retainAutorelease(v76);
      goto LABEL_92;
    }
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("bottleID"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("bottleValid"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("EscrowServiceEscrowData"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("BottledPeerEntropy"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (v74)
      v23 = v75 == 0;
    else
      v23 = 1;
    v24 = !v23;
    v72 = v24;
    if (v23 || !objc_msgSend(v73, "isEqualToString:", CFSTR("valid")))
    {
      secLogObjForScope();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v75;
        _os_log_impl(&dword_19A7FA000, v34, OS_LOG_TYPE_DEFAULT, "bottle %@ is not valid, resetting octagon", (uint8_t *)&buf, 0xCu);
      }

      v79 = 0;
      objc_msgSend(v18, "resetAndEstablish:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:error:", 3, 0, 0, 0, 0, &v79);
      v35 = v79;
      if (v35)
      {
        v36 = v35;
        secLogObjForScope();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v36;
          _os_log_impl(&dword_19A7FA000, v37, OS_LOG_TYPE_DEFAULT, "octagontrust-handleRecoveryResults: failed to reset octagon: %@", (uint8_t *)&buf, 0xCu);
        }

        if (a8)
          *a8 = objc_retainAutorelease(v36);

        goto LABEL_57;
      }
      secLogObjForScope();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_19A7FA000, v39, OS_LOG_TYPE_DEFAULT, "reset octagon succeeded", (uint8_t *)&buf, 2u);
      }

      v68 = 1;
LABEL_59:
      objc_msgSend(v14, "sbd");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v47;
      if (v47)
        v71 = v47;
      else
        v71 = objc_alloc_init((Class)getSecureBackupClass());

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "addObject:", CFSTR("iCloudIdentity"));
      objc_msgSend(v49, "addObject:", CFSTR("PCS-MasterKey"));
      objc_msgSend(v49, "addObject:", CFSTR("KeychainV0"));
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v86 = 0x2020000000;
      v50 = (_QWORD *)getkEscrowServiceRecordDataKeySymbolLoc_ptr;
      v87 = (uint64_t (*)(uint64_t, uint64_t))getkEscrowServiceRecordDataKeySymbolLoc_ptr;
      if (!getkEscrowServiceRecordDataKeySymbolLoc_ptr)
      {
        v51 = (void *)CloudServicesLibrary_642();
        v50 = dlsym(v51, "kEscrowServiceRecordDataKey");
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v50;
        getkEscrowServiceRecordDataKeySymbolLoc_ptr = (uint64_t)v50;
      }
      _Block_object_dispose(&buf, 8);
      if (v50)
      {
        objc_msgSend(v15, "objectForKeyedSubscript:", *v50);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v52)
        {
          secLogObjForScope();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_19A7FA000, v60, OS_LOG_TYPE_DEFAULT, "unable to request keychain restore, record data missing", (uint8_t *)&buf, 2u);
          }

          v61 = v18;
          goto LABEL_90;
        }
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v86 = 0x2020000000;
        v53 = (_QWORD *)getkSecureBackupKeybagDigestKeySymbolLoc_ptr;
        v87 = (uint64_t (*)(uint64_t, uint64_t))getkSecureBackupKeybagDigestKeySymbolLoc_ptr;
        if (!getkSecureBackupKeybagDigestKeySymbolLoc_ptr)
        {
          v54 = (void *)CloudServicesLibrary_642();
          v53 = dlsym(v54, "kSecureBackupKeybagDigestKey");
          *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v53;
          getkSecureBackupKeybagDigestKeySymbolLoc_ptr = (uint64_t)v53;
        }
        _Block_object_dispose(&buf, 8);
        if (v53)
        {
          objc_msgSend(v52, "objectForKeyedSubscript:", *v53);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v86 = 0x2020000000;
          v55 = (_QWORD *)getkSecureBackupBagPasswordKeySymbolLoc_ptr;
          v87 = (uint64_t (*)(uint64_t, uint64_t))getkSecureBackupBagPasswordKeySymbolLoc_ptr;
          if (!getkSecureBackupBagPasswordKeySymbolLoc_ptr)
          {
            v56 = (void *)CloudServicesLibrary_642();
            v55 = dlsym(v56, "kSecureBackupBagPasswordKey");
            *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v55;
            getkSecureBackupBagPasswordKeySymbolLoc_ptr = (uint64_t)v55;
          }
          _Block_object_dispose(&buf, 8);
          if (v55)
          {
            objc_msgSend(v52, "objectForKeyedSubscript:", *v55);
            v57 = objc_claimAutoreleasedReturnValue();
            v58 = (void *)v57;
            if (v69 && v57)
            {
              if (v72 && (objc_msgSend(v73, "isEqualToString:", CFSTR("valid")) & 1) != 0)
                v59 = 1;
              else
                v59 = v68;
              v78 = 0;
              objc_msgSend(v71, "restoreKeychainAsyncWithPassword:keybagDigest:haveBottledPeer:viewsNotToBeRestored:error:", v58, v69, v59, v49, &v78);
              v64 = v78;
              if (v64)
              {
                secLogObjForScope();
                v65 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(buf) = 138412290;
                  *(_QWORD *)((char *)&buf + 4) = v64;
                  _os_log_impl(&dword_19A7FA000, v65, OS_LOG_TYPE_DEFAULT, "octagontrust-handleRecoveryResults: error restoring keychain items: %@", (uint8_t *)&buf, 0xCu);
                }

              }
              v66 = v18;

            }
            else
            {
              secLogObjForScope();
              v62 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(buf) = 0;
                _os_log_impl(&dword_19A7FA000, v62, OS_LOG_TYPE_DEFAULT, "unable to request keychain restore, digest or password missing", (uint8_t *)&buf, 2u);
              }

              v63 = v18;
            }

LABEL_90:
            v20 = v18;
            goto LABEL_91;
          }
        }
      }
      dlerror();
      abort_report_np();
      __break(1u);
    }
    secLogObjForScope();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v75;
      _os_log_impl(&dword_19A7FA000, v25, OS_LOG_TYPE_DEFAULT, "recovering from bottle: %@", (uint8_t *)&buf, 0xCu);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v86 = 0x3032000000;
    v87 = __Block_byref_object_copy_;
    v88 = __Block_byref_object_dispose_;
    v89 = 0;
    if (a6)
    {
      _OctagonSignpostLogSystem();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = _OctagonSignpostCreate();
      v70 = v28;
      v29 = v27;

      _OctagonSignpostLogSystem();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        *(_WORD *)v83 = 0;
        _os_signpost_emit_with_name_impl(&dword_19A7FA000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "PerformOctagonJoinForSilent", " enableTelemetry=YES ", v83, 2u);
      }

      _OctagonSignpostLogSystem();
      v32 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        goto LABEL_53;
      *(_DWORD *)v83 = 134217984;
      v84 = v29;
      v33 = "BEGIN [%lld]: PerformOctagonJoinForSilent  enableTelemetry=YES ";
    }
    else
    {
      _OctagonSignpostLogSystem();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = _OctagonSignpostCreate();
      v70 = v42;
      v29 = v41;

      _OctagonSignpostLogSystem();
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = v43;
      if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
      {
        *(_WORD *)v83 = 0;
        _os_signpost_emit_with_name_impl(&dword_19A7FA000, v44, OS_SIGNPOST_INTERVAL_BEGIN, v29, "PerformOctagonJoinForNonSilent", " enableTelemetry=YES ", v83, 2u);
      }

      _OctagonSignpostLogSystem();
      v32 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        goto LABEL_53;
      *(_DWORD *)v83 = 134217984;
      v84 = v29;
      v33 = "BEGIN [%lld]: PerformOctagonJoinForNonSilent  enableTelemetry=YES ";
    }
    _os_log_impl(&dword_19A7FA000, v32, OS_LOG_TYPE_DEFAULT, v33, v83, 0xCu);
LABEL_53:

    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C78]), "initWithConfiguration:", v14);
    v80[0] = MEMORY[0x1E0C809B0];
    v80[1] = 3221225472;
    v80[2] = __112__OTClique_Framework__handleRecoveryResults_recoveredInformation_record_performedSilentBurn_recoverError_error___block_invoke;
    v80[3] = &unk_1E3919090;
    v81 = a6;
    v80[4] = &buf;
    v80[5] = v29;
    v80[6] = v70;
    objc_msgSend(v77, "restoreFromBottle:entropy:bottleID:reply:", v45, v74, v75, v80);

    v46 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v46)
    {
      if (a8)
        *a8 = objc_retainAutorelease(v46);
      _Block_object_dispose(&buf, 8);

LABEL_57:
      v20 = 0;
LABEL_91:

LABEL_92:
LABEL_93:

      goto LABEL_94;
    }
    _Block_object_dispose(&buf, 8);

    v68 = 0;
    goto LABEL_59;
  }
  if (a8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -4, 0);
    v20 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
LABEL_94:

  return v20;
}

+ (id)performEscrowRecovery:()Framework cdpContext:escrowRecord:error:
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  NSObject *v23;
  void *v24;
  os_signpost_id_t v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  id v30;
  uint64_t Nanoseconds;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  _QWORD *v37;
  void *v38;
  void *v39;
  _QWORD *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  os_signpost_id_t v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  _BOOL4 v57;
  void *v58;
  unint64_t v59;
  id v60;
  uint64_t spid;
  id v63;
  id v64;
  _BYTE buf[24];
  uint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  secLogObjForScope();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "altDSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v14;
    _os_log_impl(&dword_19A7FA000, v12, OS_LOG_TYPE_DEFAULT, "performEscrowRecovery invoked for context:%@, altdsid:%@", buf, 0x16u);

  }
  if ((objc_msgSend(a1, "isCloudServicesAvailable") & 1) != 0)
  {
    _OctagonSignpostLogSystem();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    spid = _OctagonSignpostCreate();

    _OctagonSignpostLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v59 = spid - 1;
    if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19A7FA000, v17, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PerformEscrowRecovery", " enableTelemetry=YES ", buf, 2u);
    }

    _OctagonSignpostLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = spid;
      _os_log_impl(&dword_19A7FA000, v18, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PerformEscrowRecovery  enableTelemetry=YES ", buf, 0xCu);
    }

    objc_msgSend(v9, "sbd");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
      v60 = v19;
    else
      v60 = objc_alloc_init((Class)getSecureBackupClass());

    v22 = +[OTEscrowTranslation supportedRestorePath:](OTEscrowTranslation, "supportedRestorePath:", v10);
    secLogObjForScope();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v22;
      _os_log_impl(&dword_19A7FA000, v23, OS_LOG_TYPE_DEFAULT, "restore path is supported? %{BOOL}d", buf, 8u);
    }

    if (v22)
    {
      _OctagonSignpostLogSystem();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = _OctagonSignpostCreate();

      _OctagonSignpostLogSystem();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19A7FA000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "RecoverWithCDPContext", " enableTelemetry=YES ", buf, 2u);
      }

      _OctagonSignpostLogSystem();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v25;
        _os_log_impl(&dword_19A7FA000, v28, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RecoverWithCDPContext  enableTelemetry=YES ", buf, 0xCu);
      }

      v64 = 0;
      objc_msgSend(v60, "recoverWithCDPContext:escrowRecord:error:", v10, v11, &v64);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      v30 = v64;
      v57 = v30 == 0;
      Nanoseconds = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v25 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v32))
      {
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)&buf[4] = v30 == 0;
        _os_signpost_emit_with_name_impl(&dword_19A7FA000, v33, OS_SIGNPOST_INTERVAL_END, v25, "RecoverWithCDPContext", " OctagonSignpostNameRecoverWithCDPContext=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverWithCDPContext}d ", buf, 8u);
      }

      _OctagonSignpostLogSystem();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = (double)(unint64_t)Nanoseconds / 1000000000.0;
        *(_WORD *)&buf[22] = 1026;
        LODWORD(v66) = v30 == 0;
        _os_log_impl(&dword_19A7FA000, v34, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecoverWithCDPContext  OctagonSignpostNameRecoverWithCDPContext=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverWithCDPContext}d ", buf, 0x1Cu);
      }
    }
    else
    {
      +[OTEscrowTranslation CDPRecordContextToDictionary:](OTEscrowTranslation, "CDPRecordContextToDictionary:", v10);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v35, "mutableCopy");

      objc_msgSend(v11, "escrowInformationMetadata");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      +[OTEscrowTranslation metadataToDictionary:](OTEscrowTranslation, "metadataToDictionary:", v36);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v37 = (_QWORD *)getkSecureBackupMetadataKeySymbolLoc_ptr;
      v66 = getkSecureBackupMetadataKeySymbolLoc_ptr;
      if (!getkSecureBackupMetadataKeySymbolLoc_ptr)
      {
        v38 = (void *)CloudServicesLibrary_642();
        v37 = dlsym(v38, "kSecureBackupMetadataKey");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v37;
        getkSecureBackupMetadataKeySymbolLoc_ptr = (uint64_t)v37;
      }
      _Block_object_dispose(buf, 8);
      if (!v37)
        goto LABEL_61;
      -[NSObject setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", v58, *v37);
      objc_msgSend(v11, "recordId");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v40 = (_QWORD *)getkSecureBackupRecordIDKeySymbolLoc_ptr_670;
      v66 = getkSecureBackupRecordIDKeySymbolLoc_ptr_670;
      if (!getkSecureBackupRecordIDKeySymbolLoc_ptr_670)
      {
        v41 = (void *)CloudServicesLibrary_642();
        v40 = dlsym(v41, "kSecureBackupRecordIDKey");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v40;
        getkSecureBackupRecordIDKeySymbolLoc_ptr_670 = (uint64_t)v40;
      }
      _Block_object_dispose(buf, 8);
      if (!v40)
      {
LABEL_61:
        dlerror();
        abort_report_np();
        __break(1u);
      }
      -[NSObject setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", v39, *v40);

      secLogObjForScope();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v34;
        _os_log_impl(&dword_19A7FA000, v42, OS_LOG_TYPE_DEFAULT, "using sbdRecoveryArguments: %@", buf, 0xCu);
      }

      _OctagonSignpostLogSystem();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = _OctagonSignpostCreate();

      _OctagonSignpostLogSystem();
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = v45;
      if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19A7FA000, v46, OS_SIGNPOST_INTERVAL_BEGIN, v44, "PerformRecoveryFromSBD", " enableTelemetry=YES ", buf, 2u);
      }

      _OctagonSignpostLogSystem();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v44;
        _os_log_impl(&dword_19A7FA000, v47, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PerformRecoveryFromSBD  enableTelemetry=YES ", buf, 0xCu);
      }

      v63 = 0;
      objc_msgSend(v60, "recoverWithInfo:results:", v34, &v63);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v29 = v63;
      v57 = v30 == 0;
      v48 = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      v49 = objc_claimAutoreleasedReturnValue();
      v50 = v49;
      if (v44 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v49))
      {
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)&buf[4] = v30 == 0;
        _os_signpost_emit_with_name_impl(&dword_19A7FA000, v50, OS_SIGNPOST_INTERVAL_END, v44, "PerformRecoveryFromSBD", " OctagonSignpostNamePerformRecoveryFromSBD=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformRecoveryFromSBD}d ", buf, 8u);
      }

      _OctagonSignpostLogSystem();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)&buf[4] = v44;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = (double)(unint64_t)v48 / 1000000000.0;
        *(_WORD *)&buf[22] = 1026;
        LODWORD(v66) = v30 == 0;
        _os_log_impl(&dword_19A7FA000, v51, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformRecoveryFromSBD  OctagonSignpostNamePerformRecoveryFromSBD=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformRecoveryFromSBD}d ", buf, 0x1Cu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CD5C68], "handleRecoveryResults:recoveredInformation:record:performedSilentBurn:recoverError:error:", v9, v29, v11, 0, v30, a6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = _OctagonSignpostGetNanoseconds();
    _OctagonSignpostLogSystem();
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = v53;
    if (v30)
    {
      if (v59 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
      {
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)&buf[4] = 0;
        _os_signpost_emit_with_name_impl(&dword_19A7FA000, v54, OS_SIGNPOST_INTERVAL_END, spid, "PerformEscrowRecovery", " OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", buf, 8u);
      }

      _OctagonSignpostLogSystem();
      v55 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        goto LABEL_59;
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = spid;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)(unint64_t)v52 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v66) = 0;
    }
    else
    {
      if (v59 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
      {
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)&buf[4] = v57;
        _os_signpost_emit_with_name_impl(&dword_19A7FA000, v54, OS_SIGNPOST_INTERVAL_END, spid, "PerformEscrowRecovery", " OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", buf, 8u);
      }

      _OctagonSignpostLogSystem();
      v55 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        goto LABEL_59;
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = spid;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)(unint64_t)v52 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v66) = v57;
    }
    _os_log_impl(&dword_19A7FA000, v55, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformEscrowRecovery  OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", buf, 0x1Cu);
LABEL_59:

    goto LABEL_60;
  }
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -4, 0);
    v21 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
LABEL_60:

  return v21;
}

+ (id)recordMatchingLabel:()Framework allRecords:
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a4;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "label", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v5);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)performSilentEscrowRecovery:()Framework cdpContext:allRecords:error:
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  NSObject *v23;
  void *v24;
  os_signpost_id_t v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  id v30;
  uint64_t Nanoseconds;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  os_signpost_id_t v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  _QWORD *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  _BOOL4 v53;
  unint64_t v54;
  id v55;
  uint64_t spid;
  id v57;
  id v58;
  id v59;
  _BYTE buf[24];
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v57 = a5;
  secLogObjForScope();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "altDSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v14;
    _os_log_impl(&dword_19A7FA000, v12, OS_LOG_TYPE_DEFAULT, "performSilentEscrowRecovery invoked for context:%@, altdsid:%@", buf, 0x16u);

  }
  if ((objc_msgSend(a1, "isCloudServicesAvailable") & 1) != 0)
  {
    _OctagonSignpostLogSystem();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    spid = _OctagonSignpostCreate();

    _OctagonSignpostLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v54 = spid - 1;
    if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19A7FA000, v17, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PerformSilentEscrowRecovery", " enableTelemetry=YES ", buf, 2u);
    }

    _OctagonSignpostLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = spid;
      _os_log_impl(&dword_19A7FA000, v18, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PerformSilentEscrowRecovery  enableTelemetry=YES ", buf, 0xCu);
    }

    objc_msgSend(v10, "sbd");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
      v55 = v19;
    else
      v55 = objc_alloc_init((Class)getSecureBackupClass());

    v22 = +[OTEscrowTranslation supportedRestorePath:](OTEscrowTranslation, "supportedRestorePath:", v11);
    secLogObjForScope();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v22;
      _os_log_impl(&dword_19A7FA000, v23, OS_LOG_TYPE_DEFAULT, "restore path is supported? %{BOOL}d", buf, 8u);
    }

    if (v22)
    {
      _OctagonSignpostLogSystem();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = _OctagonSignpostCreate();

      _OctagonSignpostLogSystem();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19A7FA000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "RecoverSilentWithCDPContext", " enableTelemetry=YES ", buf, 2u);
      }

      _OctagonSignpostLogSystem();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v25;
        _os_log_impl(&dword_19A7FA000, v28, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RecoverSilentWithCDPContext  enableTelemetry=YES ", buf, 0xCu);
      }

      v59 = 0;
      objc_msgSend(v55, "recoverSilentWithCDPContext:allRecords:error:", v11, v57, &v59);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      v30 = v59;
      v53 = v30 == 0;
      Nanoseconds = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v25 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v32))
      {
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)&buf[4] = v30 == 0;
        _os_signpost_emit_with_name_impl(&dword_19A7FA000, v33, OS_SIGNPOST_INTERVAL_END, v25, "RecoverSilentWithCDPContext", " OctagonSignpostNameRecoverSilentWithCDPContext=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverSilentWithCDPContext}d ", buf, 8u);
      }

      _OctagonSignpostLogSystem();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = (double)(unint64_t)Nanoseconds / 1000000000.0;
        *(_WORD *)&buf[22] = 1026;
        LODWORD(v61) = v30 == 0;
        _os_log_impl(&dword_19A7FA000, v34, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecoverSilentWithCDPContext  OctagonSignpostNameRecoverSilentWithCDPContext=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverSilentWithCDPContext}d ", buf, 0x1Cu);
      }
    }
    else
    {
      +[OTEscrowTranslation CDPRecordContextToDictionary:](OTEscrowTranslation, "CDPRecordContextToDictionary:", v11);
      v34 = objc_claimAutoreleasedReturnValue();
      _OctagonSignpostLogSystem();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = _OctagonSignpostCreate();

      _OctagonSignpostLogSystem();
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19A7FA000, v38, OS_SIGNPOST_INTERVAL_BEGIN, v36, "PerformRecoveryFromSBD", " enableTelemetry=YES ", buf, 2u);
      }

      _OctagonSignpostLogSystem();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v36;
        _os_log_impl(&dword_19A7FA000, v39, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PerformRecoveryFromSBD  enableTelemetry=YES ", buf, 0xCu);
      }

      v58 = 0;
      objc_msgSend(v55, "recoverWithInfo:results:", v34, &v58);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v29 = v58;
      v53 = v30 == 0;
      v40 = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if (v36 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v41))
      {
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)&buf[4] = v30 == 0;
        _os_signpost_emit_with_name_impl(&dword_19A7FA000, v42, OS_SIGNPOST_INTERVAL_END, v36, "PerformRecoveryFromSBD", " OctagonSignpostNamePerformRecoveryFromSBD=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformRecoveryFromSBD}d ", buf, 8u);
      }

      _OctagonSignpostLogSystem();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)&buf[4] = v36;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = (double)(unint64_t)v40 / 1000000000.0;
        *(_WORD *)&buf[22] = 1026;
        LODWORD(v61) = v30 == 0;
        _os_log_impl(&dword_19A7FA000, v43, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformRecoveryFromSBD  OctagonSignpostNamePerformRecoveryFromSBD=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformRecoveryFromSBD}d ", buf, 0x1Cu);
      }

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v44 = (_QWORD *)getkSecureBackupRecordLabelKeySymbolLoc_ptr_669;
    v61 = getkSecureBackupRecordLabelKeySymbolLoc_ptr_669;
    if (!getkSecureBackupRecordLabelKeySymbolLoc_ptr_669)
    {
      v45 = (void *)CloudServicesLibrary_642();
      v44 = dlsym(v45, "kSecureBackupRecordLabelKey");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v44;
      getkSecureBackupRecordLabelKeySymbolLoc_ptr_669 = (uint64_t)v44;
    }
    _Block_object_dispose(buf, 8);
    if (!v44)
    {
      dlerror();
      abort_report_np();
      __break(1u);
    }
    objc_msgSend(v29, "objectForKeyedSubscript:", *v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD5C68], "recordMatchingLabel:allRecords:", v46, v57);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD5C68], "handleRecoveryResults:recoveredInformation:record:performedSilentBurn:recoverError:error:", v10, v29, v47, 1, v30, a6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = _OctagonSignpostGetNanoseconds();
    _OctagonSignpostLogSystem();
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = v49;
    if (v30)
    {
      if (v54 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
      {
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)&buf[4] = 0;
        _os_signpost_emit_with_name_impl(&dword_19A7FA000, v50, OS_SIGNPOST_INTERVAL_END, spid, "PerformSilentEscrowRecovery", " OctagonSignpostNamePerformSilentEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformSilentEscrowRecovery}d ", buf, 8u);
      }

      _OctagonSignpostLogSystem();
      v51 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        goto LABEL_54;
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = spid;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)(unint64_t)v48 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v61) = 0;
    }
    else
    {
      if (v54 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
      {
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)&buf[4] = v53;
        _os_signpost_emit_with_name_impl(&dword_19A7FA000, v50, OS_SIGNPOST_INTERVAL_END, spid, "PerformSilentEscrowRecovery", " OctagonSignpostNamePerformSilentEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformSilentEscrowRecovery}d ", buf, 8u);
      }

      _OctagonSignpostLogSystem();
      v51 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        goto LABEL_54;
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = spid;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)(unint64_t)v48 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v61) = v53;
    }
    _os_log_impl(&dword_19A7FA000, v51, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformSilentEscrowRecovery  OctagonSignpostNamePerformSilentEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformSilentEscrowRecovery}d ", buf, 0x1Cu);
LABEL_54:

    goto LABEL_55;
  }
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -4, 0);
    v21 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
LABEL_55:

  return v21;
}

+ (BOOL)invalidateEscrowCache:()Framework error:
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  _BOOL8 v15;
  _QWORD v17[6];
  id obj;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint8_t v23[4];
  uint64_t v24;
  _BYTE buf[24];
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28[3];

  v28[2] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a3;
  secLogObjForScope();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "altDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_19A7FA000, v6, OS_LOG_TYPE_DEFAULT, "invalidateEscrowCache invoked for context:%@, altdsid:%@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28[0] = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  obj = 0;
  objc_msgSend(v5, "makeOTControl:", &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v28, obj);
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C78]), "initWithConfiguration:", v5);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __51__OTClique_Framework__invalidateEscrowCache_error___block_invoke;
    v17[3] = &unk_1E39190B8;
    v17[4] = &v19;
    v17[5] = buf;
    objc_msgSend(v9, "invalidateEscrowCache:reply:", v10, v17);

    if (a4)
    {
      v11 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (v11)
        *a4 = objc_retainAutorelease(v11);
    }
    secLogObjForScope();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_19A7FA000, v12, OS_LOG_TYPE_DEFAULT, "invalidateEscrowCache complete", v23, 2u);
    }

  }
  else
  {
    secLogObjForScope();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v23 = 138412290;
      v24 = v14;
      _os_log_impl(&dword_19A7FA000, v13, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", v23, 0xCu);
    }

    if (a4)
      *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  }
  v15 = *((_BYTE *)v20 + 24) != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(buf, 8);

  return v15;
}

+ (id)_fetchAccountWideSettingsDefaultWithForceFetch:()Framework useDefault:configuration:error:
{
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD v18[6];
  char v19;
  id obj;
  __int128 v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _BYTE buf[24];
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29[3];

  v29[2] = *(id *)MEMORY[0x1E0C80C00];
  v9 = a5;
  secLogObjForScope();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a3;
    _os_log_impl(&dword_19A7FA000, v10, OS_LOG_TYPE_DEFAULT, "fetchAccountWideSettings invoked for context:%@ forceFetch:%{BOOL}d", buf, 0x12u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29[0] = 0;
  obj = 0;
  objc_msgSend(v9, "makeOTControl:", &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v29, obj);
  if (v11)
  {
    *(_QWORD *)&v21 = 0;
    *((_QWORD *)&v21 + 1) = &v21;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy_;
    v24 = __Block_byref_object_dispose_;
    v25 = 0;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C78]), "initWithConfiguration:", v9);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __101__OTClique_Framework___fetchAccountWideSettingsDefaultWithForceFetch_useDefault_configuration_error___block_invoke;
    v18[3] = &unk_1E3919158;
    v19 = a4;
    v18[4] = &v21;
    v18[5] = buf;
    objc_msgSend(v11, "fetchAccountWideSettingsWithForceFetch:arguments:reply:", a3, v12, v18);

    if (a6)
    {
      v13 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (v13)
        *a6 = objc_retainAutorelease(v13);
    }
    v14 = *(id *)(*((_QWORD *)&v21 + 1) + 40);
    _Block_object_dispose(&v21, 8);

  }
  else
  {
    secLogObjForScope();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      LODWORD(v21) = 138412290;
      *(_QWORD *)((char *)&v21 + 4) = v16;
      _os_log_impl(&dword_19A7FA000, v15, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", (uint8_t *)&v21, 0xCu);
    }

    v14 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  }

  _Block_object_dispose(buf, 8);
  return v14;
}

+ (uint64_t)fetchAccountWideSettingsWithForceFetch:()Framework configuration:error:
{
  return objc_msgSend(MEMORY[0x1E0CD5C68], "_fetchAccountWideSettingsDefaultWithForceFetch:useDefault:configuration:error:", a3, 0, a4, a5);
}

+ (uint64_t)fetchAccountWideSettingsDefaultWithForceFetch:()Framework configuration:error:
{
  return objc_msgSend(MEMORY[0x1E0CD5C68], "_fetchAccountWideSettingsDefaultWithForceFetch:useDefault:configuration:error:", a3, 1, a4, a5);
}

+ (uint64_t)fetchAccountWideSettings:()Framework error:
{
  return objc_msgSend(MEMORY[0x1E0CD5C68], "_fetchAccountWideSettingsDefaultWithForceFetch:useDefault:configuration:error:", 0, 0, a3, a4);
}

+ (uint64_t)ensureBackupKeyExistsinSOS:()Framework
{
  const void *v4;
  const void *v5;
  NSObject *v6;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (const void *)SOSCCCopyMyPeerInfo();
  if (v4)
  {
    v5 = (const void *)SOSPeerInfoCopyBackupKey();
    CFRelease(v4);
    if (v5)
    {
      CFRelease(v5);
      secLogObjForScope();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19A7FA000, v6, OS_LOG_TYPE_DEFAULT, "backup key already registered", buf, 2u);
      }

      return 1;
    }
    v9 = (void *)SecPasswordGenerate();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "dataUsingEncoding:", 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = SOSCCCopyMyPeerWithNewDeviceRecoverySecret();
      if (v12)
      {
        v13 = (const void *)v12;
        secLogObjForScope();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19A7FA000, v14, OS_LOG_TYPE_DEFAULT, "registered backup key", buf, 2u);
        }

        CFRelease(v13);
        return 1;
      }
      secLogObjForScope();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = 0;
        _os_log_impl(&dword_19A7FA000, v16, OS_LOG_TYPE_DEFAULT, "octagon-register-recovery-key, SOSCCCopyMyPeerWithNewDeviceRecoverySecret() failed: %@", buf, 0xCu);
      }

      if (a3)
        *a3 = 0;

    }
    else
    {
      secLogObjForScope();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = 0;
        _os_log_impl(&dword_19A7FA000, v15, OS_LOG_TYPE_DEFAULT, "octagon-register-recovery-key, SecPasswordGenerate() failed: %@", buf, 0xCu);
      }

      if (a3)
        *a3 = 0;
    }

  }
  else
  {
    secLogObjForScope();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = 0;
      _os_log_impl(&dword_19A7FA000, v8, OS_LOG_TYPE_DEFAULT, "octagon-register-recovery-key, SOSCCCopyMyPeerInfo() failed: %@", buf, 0xCu);
    }

    if (a3)
      *a3 = 0;
  }
  return 0;
}

+ (uint64_t)registerRecoveryKeyInSOSAndBackup:()Framework recoveryKey:error:
{
  id v7;
  id v8;
  int v9;
  int v10;
  int v11;
  char v12;
  id v13;
  char v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  char v26;
  void *v27;
  id *v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  id v38[2];
  __int128 buf;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v38[1] = 0;
  v9 = SOSCCThisDeviceIsInCircle();
  v10 = SOSCCIsSOSTrustAndSyncingEnabled();
  if (v9)
    v11 = 0;
  else
    v11 = v10;
  if (v11 != 1)
  {
    secLogObjForScope();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19A7FA000, v22, OS_LOG_TYPE_DEFAULT, "device is not participating in SOS, skipping recovery key registration", (uint8_t *)&buf, 2u);
    }

    goto LABEL_19;
  }
  v38[0] = 0;
  v12 = objc_msgSend(MEMORY[0x1E0CD5C68], "ensureBackupKeyExistsinSOS:", v38);
  v13 = v38[0];
  if (v13)
    v14 = 0;
  else
    v14 = v12;
  if ((v14 & 1) == 0)
  {
    v15 = v13;
    if (a5)
      *a5 = objc_retainAutorelease(v13);
    goto LABEL_50;
  }
  SecRKCreateRecoveryKeyWithError();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = v16;
  if (!v15 || v16)
  {
    secLogObjForScope();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v17;
      _os_log_impl(&dword_19A7FA000, v24, OS_LOG_TYPE_DEFAULT, "octagon-register-recovery-key, SecRKCreateRecoveryKeyWithError() failed: %@", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", CFSTR("SecRKCreateRecoveryKeyWithError() failed"), *MEMORY[0x1E0CB2D50]);
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CB3388]);
    v26 = objc_msgSend(MEMORY[0x1E0CD5C68], "isCloudServicesAvailable");
    v27 = (void *)MEMORY[0x1E0CB35C8];
    if ((v26 & 1) != 0)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v40 = 0x2020000000;
      v28 = (id *)getkSecureBackupErrorDomainSymbolLoc_ptr;
      v41 = getkSecureBackupErrorDomainSymbolLoc_ptr;
      if (!getkSecureBackupErrorDomainSymbolLoc_ptr)
      {
        v29 = (void *)CloudServicesLibrary_642();
        v28 = (id *)dlsym(v29, "kSecureBackupErrorDomain");
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v28;
        getkSecureBackupErrorDomainSymbolLoc_ptr = (uint64_t)v28;
      }
      _Block_object_dispose(&buf, 8);
      if (!v28)
      {
        dlerror();
        abort_report_np();
        __break(1u);
      }
      v30 = *v28;
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", v30, 24, v25);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!a5)
        goto LABEL_37;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -4, v25);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a5)
      {
LABEL_37:

LABEL_51:
        v23 = 0;
        goto LABEL_52;
      }
    }
    *a5 = objc_retainAutorelease(v31);
    goto LABEL_37;
  }
  if ((SecRKRegisterBackupPublicKey() & 1) == 0)
  {
    secLogObjForScope();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = 0;
      _os_log_impl(&dword_19A7FA000, v32, OS_LOG_TYPE_DEFAULT, "octagon-register-recovery-key, SecRKRegisterBackupPublicKey() failed: %@", (uint8_t *)&buf, 0xCu);
    }

    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:", *MEMORY[0x1E0CB2F90], 11, CFSTR("Failed to register backup public key"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_50:

    goto LABEL_51;
  }
  secLogObjForScope();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_19A7FA000, v18, OS_LOG_TYPE_DEFAULT, "successfully registered recovery key for SOS", (uint8_t *)&buf, 2u);
  }

  objc_msgSend(v7, "sbd");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
    v21 = v19;
  else
    v21 = objc_alloc_init((Class)getSecureBackupClass());
  v33 = v21;

  objc_msgSend(v33, "backupForRecoveryKeyWithInfo:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    secLogObjForScope();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v34;
      _os_log_impl(&dword_19A7FA000, v35, OS_LOG_TYPE_DEFAULT, "octagon-register-recovery-key: failed to perform backup: %@", (uint8_t *)&buf, 0xCu);
    }

    if (a5)
      *a5 = objc_retainAutorelease(v34);
  }
  else
  {
    secLogObjForScope();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19A7FA000, v36, OS_LOG_TYPE_DEFAULT, "created iCloud Identity backup", (uint8_t *)&buf, 2u);
    }

  }
  if (v34)
    goto LABEL_51;
LABEL_19:
  v23 = 1;
LABEL_52:

  return v23;
}

+ (uint64_t)registerRecoveryKeyWithContext:()Framework recoveryKey:error:
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  __int128 buf;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  secLogObjForScope();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_19A7FA000, v9, OS_LOG_TYPE_DEFAULT, "registerRecoveryKeyWithContext invoked for context: %@", (uint8_t *)&buf, 0xCu);

  }
  v31 = 0;
  objc_msgSend(v7, "makeOTControl:", &v31);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v31;
  if (v11)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy_;
    v35 = __Block_byref_object_dispose_;
    v36 = 0;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C78]), "initWithConfiguration:", v7);
    v14 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __72__OTClique_Framework__registerRecoveryKeyWithContext_recoveryKey_error___block_invoke;
    v30[3] = &unk_1E39190E0;
    v30[4] = &buf;
    objc_msgSend(v11, "createRecoveryKey:recoveryKey:reply:", v13, v8, v30);

    v15 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v15)
    {
      v16 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v15);
    }
    else
    {
      v29 = 0;
      LODWORD(v16) = objc_msgSend(MEMORY[0x1E0CD5C68], "registerRecoveryKeyInSOSAndBackup:recoveryKey:error:", v7, v8, &v29);
      v18 = v29;
      if (v18)
        v16 = 0;
      else
        v16 = v16;
      if ((v16 & 1) == 0)
      {
        v23 = 0;
        v24 = &v23;
        v25 = 0x3032000000;
        v26 = __Block_byref_object_copy_;
        v27 = __Block_byref_object_dispose_;
        v28 = 0;
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C78]), "initWithConfiguration:", v7);
        v22[0] = v14;
        v22[1] = 3221225472;
        v22[2] = __72__OTClique_Framework__registerRecoveryKeyWithContext_recoveryKey_error___block_invoke_60;
        v22[3] = &unk_1E39190E0;
        v22[4] = &v23;
        objc_msgSend(v11, "removeRecoveryKey:reply:", v19, v22);

        if (a5)
        {
          v20 = v18;
          if (v18 || (v20 = (void *)v24[5]) != 0)
            *a5 = objc_retainAutorelease(v20);
        }
        _Block_object_dispose(&v23, 8);

      }
    }
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    secLogObjForScope();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_19A7FA000, v17, OS_LOG_TYPE_DEFAULT, "failed to make OTControl object: %@", (uint8_t *)&buf, 0xCu);
    }

    v16 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v12);
  }

  return v16;
}

+ (id)createAndSetRecoveryKeyWithContext:()Framework error:
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v19[2];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  secLogObjForScope();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v8;
    _os_log_impl(&dword_19A7FA000, v7, OS_LOG_TYPE_DEFAULT, "createAndSetRecoveryKeyWithContext invoked for context: %@", buf, 0xCu);

  }
  v19[1] = 0;
  SecRKCreateRecoveryKeyString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = v10;
  if (!v9 || v10)
  {
    secLogObjForScope();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v11;
      _os_log_impl(&dword_19A7FA000, v16, OS_LOG_TYPE_DEFAULT, "octagon-create-recovery-key, failed to create recovery key error: %@", buf, 0xCu);
    }

    v15 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v11);
  }
  else
  {
    v19[0] = 0;
    v12 = objc_msgSend(a1, "registerRecoveryKeyWithContext:recoveryKey:error:", v6, v9, v19);
    v13 = v19[0];
    v14 = v13;
    if (!v12 || v13)
    {
      secLogObjForScope();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v14;
        _os_log_impl(&dword_19A7FA000, v17, OS_LOG_TYPE_DEFAULT, "octagon-create-recovery-key, failed to register recovery key error: %@", buf, 0xCu);
      }

      v15 = 0;
      if (a4 && v14)
      {
        v15 = 0;
        *a4 = objc_retainAutorelease(v14);
      }
    }
    else
    {
      v15 = v9;
    }

  }
  return v15;
}

+ (BOOL)setRecoveryKeyWithContext:()Framework recoveryKey:error:
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  NSObject *v16;
  _QWORD v18[5];
  id v19;
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  secLogObjForScope();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_19A7FA000, v9, OS_LOG_TYPE_DEFAULT, "setRecoveryKeyWithContext invoked for context: %@", (uint8_t *)&buf, 0xCu);

  }
  v19 = 0;
  objc_msgSend(v7, "makeOTControl:", &v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v19;
  if (v11)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy_;
    v23 = __Block_byref_object_dispose_;
    v24 = 0;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C78]), "initWithConfiguration:", v7);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __67__OTClique_Framework__setRecoveryKeyWithContext_recoveryKey_error___block_invoke;
    v18[3] = &unk_1E39190E0;
    v18[4] = &buf;
    objc_msgSend(v11, "createRecoveryKey:recoveryKey:reply:", v13, v8, v18);

    v14 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    v15 = v14 == 0;
    if (a5 && v14)
      *a5 = objc_retainAutorelease(v14);
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    secLogObjForScope();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_19A7FA000, v16, OS_LOG_TYPE_DEFAULT, "failed to make OTControl object: %@", (uint8_t *)&buf, 0xCu);
    }

    v15 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v12);
  }

  return v15;
}

+ (BOOL)isRecoveryKeySetInOctagon:()Framework error:
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  NSObject *v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  id v19;
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  secLogObjForScope();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_19A7FA000, v6, OS_LOG_TYPE_DEFAULT, "Checking Octagon recovery key status for context:%@", (uint8_t *)&buf, 0xCu);
  }

  v19 = 0;
  objc_msgSend(v5, "makeOTControl:", &v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v19;
  if (v7)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy_;
    v23 = __Block_byref_object_dispose_;
    v24 = 0;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C78]), "initWithConfiguration:", v5);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55__OTClique_Framework__isRecoveryKeySetInOctagon_error___block_invoke;
    v14[3] = &unk_1E39191A8;
    v14[4] = &buf;
    v14[5] = &v15;
    objc_msgSend(v7, "isRecoveryKeySet:reply:", v9, v14);

    if (a4)
    {
      v10 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      if (v10)
        *a4 = objc_retainAutorelease(v10);
    }
    v11 = *((_BYTE *)v16 + 24) != 0;
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    secLogObjForScope();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_19A7FA000, v12, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", (uint8_t *)&buf, 0xCu);
    }

    v11 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }

  return v11;
}

+ (uint64_t)isRecoveryKeySetInSOS:()Framework error:
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  secLogObjForScope();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v5;
    _os_log_impl(&dword_19A7FA000, v6, OS_LOG_TYPE_DEFAULT, "Checking SOS recovery key status for context:%@", buf, 0xCu);
  }

  objc_msgSend(v5, "sbd");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = objc_alloc_init((Class)getSecureBackupClass());
  v10 = v9;

  v16 = 0;
  v11 = objc_msgSend(v10, "isRecoveryKeySet:", &v16);
  v12 = v16;
  if (v12)
  {
    secLogObjForScope();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl(&dword_19A7FA000, v13, OS_LOG_TYPE_DEFAULT, "octagon-is-recovery-key-set-in-sos: failed to check the recovery key in SOS: %@", buf, 0xCu);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v12);
  }
  else
  {
    secLogObjForScope();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = v11;
      _os_log_impl(&dword_19A7FA000, v14, OS_LOG_TYPE_DEFAULT, "recovery key set in SOS: %{BOOL}d", buf, 8u);
    }

  }
  return v11;
}

+ (uint64_t)isRecoveryKeySet:()Framework error:
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  unsigned int v9;
  id v10;
  void *v11;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  secLogObjForScope();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_19A7FA000, v6, OS_LOG_TYPE_DEFAULT, "Checking recovery key status for context:%@", buf, 0xCu);
  }

  v14 = 0;
  v7 = objc_msgSend(MEMORY[0x1E0CD5C68], "isRecoveryKeySetInOctagon:error:", v5, &v14);
  v8 = v14;
  v13 = 0;
  v9 = objc_msgSend(MEMORY[0x1E0CD5C68], "isRecoveryKeySetInSOS:error:", v5, &v13);
  v10 = v13;
  if (a4)
  {
    if ((v9 & 1) == 0 && (v7 & 1) == 0)
    {
      v11 = v8;
      if (v8 || (v11 = v10) != 0)
        *a4 = objc_retainAutorelease(v11);
    }
  }

  return v7 | v9;
}

+ (uint64_t)doesRecoveryKeyExistInSOSAndIsCorrect:()Framework recoveryKey:error:
{
  id v7;
  id v8;
  int v9;
  id v10;
  BOOL v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v27 = 0;
  v9 = objc_msgSend(MEMORY[0x1E0CD5C68], "isRecoveryKeySetInSOS:error:", v7, &v27);
  v10 = v27;
  if (v9)
    v11 = v10 == 0;
  else
    v11 = 0;
  if (v11)
  {
    secLogObjForScope();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A7FA000, v15, OS_LOG_TYPE_DEFAULT, "recovery key is registered in SOS", buf, 2u);
    }

    objc_msgSend(v7, "sbd");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      v18 = v16;
    else
      v18 = objc_alloc_init((Class)getSecureBackupClass());
    v19 = v18;

    v26 = 0;
    v20 = objc_msgSend(v19, "verifyRecoveryKey:error:", v8, &v26);
    v21 = v26;
    v12 = v21;
    if (!v20 || v21)
    {
      secLogObjForScope();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19A7FA000, v23, OS_LOG_TYPE_DEFAULT, "recovery key is NOT correct in SOS", buf, 2u);
      }

      if (a5)
      {
        if (v12)
        {
          v24 = objc_retainAutorelease(v12);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:", *MEMORY[0x1E0CD5CA0], 67, CFSTR("Recovery key is incorrect"));
          v24 = (id)objc_claimAutoreleasedReturnValue();
        }
        *a5 = v24;
      }
      v22 = 2;
    }
    else
    {
      v22 = 3;
    }

  }
  else
  {
    v12 = v10;
    secLogObjForScope();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v12;
      _os_log_impl(&dword_19A7FA000, v13, OS_LOG_TYPE_DEFAULT, "octagon-recover-with-rk: Recovery Key not registered in SOS: %@", buf, 0xCu);
    }

    if (a5)
    {
      if (v12)
      {
        v14 = objc_retainAutorelease(v12);
        v12 = v14;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:", *MEMORY[0x1E0CD5CA0], 64, CFSTR("Recovery key does not exist in Octagon"));
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      *a5 = v14;
    }
    v22 = 1;
  }

  return v22;
}

+ (uint64_t)doesRecoveryKeyExistInOctagonAndIsCorrect:()Framework recoveryKey:error:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[6];
  id obj;
  id v25;
  __int128 buf;
  uint64_t v27;
  char v28;
  __int128 v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33[3];

  v33[2] = *(id *)MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v25 = 0;
  objc_msgSend(v7, "makeOTControl:", &v25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v25;
  if (v9)
  {
    *(_QWORD *)&v29 = 0;
    *((_QWORD *)&v29 + 1) = &v29;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy_;
    v32 = __Block_byref_object_dispose_;
    v33[0] = 0;
    obj = 0;
    v11 = objc_msgSend(MEMORY[0x1E0CD5C68], "isRecoveryKeySetInOctagon:error:", v7, &obj);
    objc_storeStrong(v33, obj);
    if (v11 && !*(_QWORD *)(*((_QWORD *)&v29 + 1) + 40))
    {
      secLogObjForScope();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_19A7FA000, v19, OS_LOG_TYPE_DEFAULT, "recovery key is registered in Octagon, checking if it is correct", (uint8_t *)&buf, 2u);
      }

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v27 = 0x2020000000;
      v28 = 0;
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C78]), "initWithConfiguration:", v7);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __83__OTClique_Framework__doesRecoveryKeyExistInOctagonAndIsCorrect_recoveryKey_error___block_invoke;
      v23[3] = &unk_1E39191A8;
      v23[4] = &v29;
      v23[5] = &buf;
      objc_msgSend(v9, "preflightRecoverOctagonUsingRecoveryKey:recoveryKey:reply:", v20, v8, v23);

      if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24) && !*(_QWORD *)(*((_QWORD *)&v29 + 1) + 40))
      {
        v17 = 3;
      }
      else
      {
        if (a5)
        {
          v21 = *(void **)(*((_QWORD *)&v29 + 1) + 40);
          if (v21)
          {
            v22 = objc_retainAutorelease(v21);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:", *MEMORY[0x1E0CD5CA0], 67, CFSTR("Recovery key is incorrect"));
            v22 = (id)objc_claimAutoreleasedReturnValue();
          }
          *a5 = v22;
        }
        v17 = 2;
      }
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      secLogObjForScope();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 40);
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v13;
        _os_log_impl(&dword_19A7FA000, v12, OS_LOG_TYPE_DEFAULT, "octagon-recover-with-rk: recovery key not registered in Octagon, error: %@", (uint8_t *)&buf, 0xCu);
      }

      if (a5)
      {
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 40);
        if (v14)
        {
          v15 = objc_retainAutorelease(v14);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:", *MEMORY[0x1E0CD5CA0], 64, CFSTR("Recovery key does not exist in Octagon"));
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        *a5 = v15;
      }
      v17 = 1;
    }
    _Block_object_dispose(&v29, 8);

  }
  else
  {
    secLogObjForScope();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v29) = 138412290;
      *(_QWORD *)((char *)&v29 + 4) = v10;
      _os_log_impl(&dword_19A7FA000, v16, OS_LOG_TYPE_DEFAULT, "octagon-recover-with-rk: unable to create otcontrol: %@", (uint8_t *)&v29, 0xCu);
    }

    v17 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v10);
  }

  return v17;
}

+ (BOOL)recoverWithRecoveryKey:()Framework recoveryKey:error:
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  NSObject *v23;
  NSObject *v24;
  _BOOL8 v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  int v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  int v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  uint64_t v44;
  id v45;
  void *v46;
  NSObject *v47;
  id v49;
  id v50;
  _QWORD v51[5];
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  __int128 *p_buf;
  id obj;
  id v58;
  id v59;
  id v60;
  id v61;
  uint8_t v62[4];
  uint64_t v63;
  __int128 buf;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68[5];

  v68[2] = *(id *)MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  secLogObjForScope();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_19A7FA000, v9, OS_LOG_TYPE_DEFAULT, "Recovering account trust using recovery key for context:%@", (uint8_t *)&buf, 0xCu);
  }

  v61 = 0;
  if ((SecPasswordValidatePasswordFormat() & 1) != 0)
  {
    v60 = 0;
    v10 = objc_msgSend(MEMORY[0x1E0CD5C68], "doesRecoveryKeyExistInSOSAndIsCorrect:recoveryKey:error:", v7, v8, &v60);
    v11 = v60;
    v59 = 0;
    v12 = objc_msgSend(MEMORY[0x1E0CD5C68], "doesRecoveryKeyExistInOctagonAndIsCorrect:recoveryKey:error:", v7, v8, &v59);
    v50 = v59;
    if (v50)
    {
      objc_msgSend(v50, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CD6780]))
        goto LABEL_27;
      v14 = objc_msgSend(v50, "code") == 31;

      if (v14)
      {
        objc_msgSend(v50, "userInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *MEMORY[0x1E0CB3388];
        objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v13, "domain");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CD6788]))
          {
LABEL_26:

            goto LABEL_27;
          }
          v18 = objc_msgSend(v13, "code") == 3;

          if (v18)
          {
            objc_msgSend(v13, "userInfo");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKeyedSubscript:", v16);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              objc_msgSend(v20, "domain");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0CB2F90]) & 1) != 0)
              {
                v22 = objc_msgSend(v20, "code") == -25308;

                if (v22)
                {
                  secLogObjForScope();
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    LODWORD(buf) = 138412290;
                    *(_QWORD *)((char *)&buf + 4) = v20;
                    _os_log_impl(&dword_19A7FA000, v23, OS_LOG_TYPE_DEFAULT, "octagon-recover-with-rk: device is locked %@", (uint8_t *)&buf, 0xCu);
                  }

                  if (a5)
                    *a5 = objc_retainAutorelease(v20);

                  goto LABEL_99;
                }
              }
              else
              {

              }
              v17 = v20;
            }
            else
            {
              v17 = 0;
            }
            goto LABEL_26;
          }
        }
LABEL_27:

      }
    }
    if (v10 != 3 && v12 != 3)
    {
      secLogObjForScope();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_19A7FA000, v26, OS_LOG_TYPE_DEFAULT, "octagon-recover-with-rk: recovery key will not work for both SOS and Octagon", (uint8_t *)&buf, 2u);
      }

      if (!a5)
        goto LABEL_99;
      if (v10 == 1 && v12 == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:", *MEMORY[0x1E0CD5CA0], 64, CFSTR("Recovery key is not registered"));
        v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_95:
        v25 = 0;
        *a5 = v27;
        goto LABEL_100;
      }
      if (v12 != 2 && v10 != 2)
      {
        if (v50)
        {
          v27 = objc_retainAutorelease(v50);
          goto LABEL_95;
        }
        v31 = SOSCCIsSOSTrustAndSyncingEnabled();
        if (v11)
          v32 = v31;
        else
          v32 = 0;
        if (v32 == 1)
        {
          v27 = objc_retainAutorelease(v11);
          goto LABEL_95;
        }
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:", *MEMORY[0x1E0CD5CA0], 67, CFSTR("Recovery key is not correct"));
      v27 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_95;
    }
    if (v10 != 3)
      goto LABEL_72;
    if (SOSCCIsSOSTrustAndSyncingEnabled())
    {
      objc_msgSend(v8, "dataUsingEncoding:", 4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v28)
      {
        if (!a5)
        {
LABEL_99:
          v25 = 0;
          goto LABEL_100;
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:", *MEMORY[0x1E0CD5CA0], 41, CFSTR("Malformed recovery key"));
        v27 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_95;
      }
      objc_msgSend(v7, "sbd");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
        v49 = v29;
      else
        v49 = objc_alloc_init((Class)getSecureBackupClass());

      v58 = 0;
      v33 = objc_msgSend(v49, "restoreKeychainWithBackupPassword:error:", v28, &v58);
      v34 = v58;
      if (v33)
      {
        secLogObjForScope();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_19A7FA000, v35, OS_LOG_TYPE_DEFAULT, "restoreKeychainWithBackupPassword succeeded", (uint8_t *)&buf, 2u);
        }

      }
      else
      {
        secLogObjForScope();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v34;
          _os_log_impl(&dword_19A7FA000, v36, OS_LOG_TYPE_DEFAULT, "octagon-recover-with-rk: restoreKeychainWithBackupPassword returned error: %@", (uint8_t *)&buf, 0xCu);
        }

        if (v12 != 3)
        {
          if (a5)
          {
            if (v34)
            {
              v37 = objc_retainAutorelease(v34);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:", *MEMORY[0x1E0CD5CA0], 66, CFSTR("Restore Keychain With Backup Password Failed"));
              v37 = (id)objc_claimAutoreleasedReturnValue();
            }
            *a5 = v37;
          }

          goto LABEL_99;
        }
      }

    }
    if (v12 == 1)
    {
      if ((SOSCCIsSOSTrustAndSyncingEnabled() & 1) == 0 && objc_msgSend(v7, "octagonCapableRecordsExist"))
      {
        secLogObjForScope();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_19A7FA000, v38, OS_LOG_TYPE_DEFAULT, "Recovery key exists in SOS but not in Octagon and this platform does not support SOS.  Octagon records exist, forcing iCSC restore", (uint8_t *)&buf, 2u);
        }

        if (!a5)
          goto LABEL_99;
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:", *MEMORY[0x1E0CD5CA0], 65, CFSTR("recover with recovery key configuration not supported, forcing iCSC restore"));
        v27 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_95;
      }
      v39 = 1;
    }
    else
    {
LABEL_72:
      v39 = 0;
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v65 = 0x3032000000;
    v66 = __Block_byref_object_copy_;
    v67 = __Block_byref_object_dispose_;
    v68[0] = 0;
    obj = 0;
    objc_msgSend(v7, "makeOTControl:", &obj);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v68, obj);
    if (v40)
    {
      if (v39)
      {
        v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C78]), "initWithConfiguration:", v7);
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __64__OTClique_Framework__recoverWithRecoveryKey_recoveryKey_error___block_invoke;
        v52[3] = &unk_1E39191F8;
        p_buf = &buf;
        v53 = v40;
        v54 = v7;
        v55 = v8;
        objc_msgSend(v53, "resetAndEstablish:resetReason:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:reply:", v41, 5, 0, 0, 0, 0, v52);

        v42 = v53;
        goto LABEL_82;
      }
      if (v12 == 3)
      {
        v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C78]), "initWithConfiguration:", v7);
        v51[0] = MEMORY[0x1E0C809B0];
        v51[1] = 3221225472;
        v51[2] = __64__OTClique_Framework__recoverWithRecoveryKey_recoveryKey_error___block_invoke_93;
        v51[3] = &unk_1E39190E0;
        v51[4] = &buf;
        objc_msgSend(v40, "recoverWithRecoveryKey:recoveryKey:reply:", v42, v8, v51);
LABEL_82:

        v46 = *(void **)(*((_QWORD *)&buf + 1) + 40);
        if (a5 && v46)
        {
          *a5 = objc_retainAutorelease(v46);
          v46 = *(void **)(*((_QWORD *)&buf + 1) + 40);
        }
        v25 = v46 == 0;
        goto LABEL_93;
      }
      secLogObjForScope();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v62 = 0;
        _os_log_impl(&dword_19A7FA000, v47, OS_LOG_TYPE_DEFAULT, "octagon-recover-with-rk: joining with recovery key failed, recovery key is not correct in Octagon", v62, 2u);
      }

      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:", *MEMORY[0x1E0CD5CA0], 67, CFSTR("Recovery key is not correct"));
        v45 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_91;
      }
    }
    else
    {
      secLogObjForScope();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        *(_DWORD *)v62 = 138412290;
        v63 = v44;
        _os_log_impl(&dword_19A7FA000, v43, OS_LOG_TYPE_DEFAULT, "octagon-recover-with-rk: unable to create otcontrol: %@", v62, 0xCu);
      }

      if (a5)
      {
        v45 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
LABEL_91:
        v25 = 0;
        *a5 = v45;
LABEL_93:

        _Block_object_dispose(&buf, 8);
LABEL_100:

        goto LABEL_101;
      }
    }
    v25 = 0;
    goto LABEL_93;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:underlying:", *MEMORY[0x1E0CD5CA0], 41, CFSTR("Malformed Recovery Key"), v61);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  secLogObjForScope();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_19A7FA000, v24, OS_LOG_TYPE_DEFAULT, "octagon-recover-with-rk: recovery failed validation with error:%@", (uint8_t *)&buf, 0xCu);
  }

  if (a5)
  {
    v11 = objc_retainAutorelease(v11);
    v25 = 0;
    *a5 = v11;
  }
  else
  {
    v25 = 0;
  }
LABEL_101:

  return v25;
}

+ (BOOL)preflightRecoverOctagonUsingRecoveryKey:()Framework recoveryKey:error:
{
  id v7;
  id v8;
  NSObject *v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  _QWORD v20[6];
  id obj[2];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint8_t v26[4];
  void *v27;
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  secLogObjForScope();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_19A7FA000, v9, OS_LOG_TYPE_DEFAULT, "Preflight using recovery key for context: %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  obj[1] = 0;
  if ((SecPasswordValidatePasswordFormat() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:", *MEMORY[0x1E0CD5CA0], 41, CFSTR("malformed recovery key"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    secLogObjForScope();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v26 = 138412290;
      v27 = v11;
      _os_log_impl(&dword_19A7FA000, v15, OS_LOG_TYPE_DEFAULT, "octagon-preflight-recovery-key: recovery failed validation with error:%@", v26, 0xCu);
    }

    if (a5)
    {
      v16 = objc_retainAutorelease(v11);
      v11 = v16;
LABEL_17:
      v14 = 0;
      *a5 = v16;
      goto LABEL_20;
    }
LABEL_19:
    v14 = 0;
    goto LABEL_20;
  }
  v10 = (id *)(*((_QWORD *)&buf + 1) + 40);
  obj[0] = *(id *)(*((_QWORD *)&buf + 1) + 40);
  objc_msgSend(v7, "makeOTControl:", obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v10, obj[0]);
  if (!v11)
  {
    secLogObjForScope();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v26 = 138412290;
      v27 = v18;
      _os_log_impl(&dword_19A7FA000, v17, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", v26, 0xCu);
    }

    if (a5)
    {
      v16 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
      v11 = 0;
      goto LABEL_17;
    }
    v11 = 0;
    goto LABEL_19;
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C78]), "initWithConfiguration:", v7);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __81__OTClique_Framework__preflightRecoverOctagonUsingRecoveryKey_recoveryKey_error___block_invoke;
  v20[3] = &unk_1E39191A8;
  v20[4] = &v22;
  v20[5] = &buf;
  objc_msgSend(v11, "preflightRecoverOctagonUsingRecoveryKey:recoveryKey:reply:", v12, v8, v20);

  if (a5)
  {
    v13 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v13)
      *a5 = objc_retainAutorelease(v13);
  }
  v14 = *((_BYTE *)v23 + 24) != 0;
LABEL_20:

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&buf, 8);

  return v14;
}

+ (id)totalTrustedPeers:()Framework error:
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  id v24;
  uint8_t v25[4];
  uint64_t v26;
  __int128 buf;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  secLogObjForScope();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_19A7FA000, v6, OS_LOG_TYPE_DEFAULT, "totalTrustedPeers invoked for context: %@", (uint8_t *)&buf, 0xCu);

  }
  v24 = 0;
  objc_msgSend(v5, "makeOTControl:", &v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v24;
  if (v8)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy_;
    v30 = __Block_byref_object_dispose_;
    v31 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy_;
    v22 = __Block_byref_object_dispose_;
    v23 = 0;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C78]), "initWithConfiguration:", v5);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __47__OTClique_Framework__totalTrustedPeers_error___block_invoke;
    v17[3] = &unk_1E3919220;
    v17[4] = &buf;
    v17[5] = &v18;
    objc_msgSend(v8, "totalTrustedPeers:reply:", v10, v17);

    v11 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v11)
    {
      v12 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v11);
    }
    else
    {
      secLogObjForScope();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v19[5];
        *(_DWORD *)v25 = 138412290;
        v26 = v15;
        _os_log_impl(&dword_19A7FA000, v14, OS_LOG_TYPE_DEFAULT, "Number of trusted Octagon peers: %@", v25, 0xCu);
      }

      v12 = (id)v19[5];
    }
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    secLogObjForScope();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_19A7FA000, v13, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", (uint8_t *)&buf, 0xCu);
    }

    v12 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }

  return v12;
}

+ (BOOL)areRecoveryKeysDistrusted:()Framework error:
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  NSObject *v13;
  NSObject *v14;
  const __CFString *v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  id v22;
  uint8_t v23[4];
  const __CFString *v24;
  __int128 buf;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  secLogObjForScope();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_19A7FA000, v6, OS_LOG_TYPE_DEFAULT, "areRecoveryKeysDistrusted invoked for context: %@", (uint8_t *)&buf, 0xCu);

  }
  v22 = 0;
  objc_msgSend(v5, "makeOTControl:", &v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v22;
  if (v8)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy_;
    v28 = __Block_byref_object_dispose_;
    v29 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C78]), "initWithConfiguration:", v5);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __55__OTClique_Framework__areRecoveryKeysDistrusted_error___block_invoke;
    v17[3] = &unk_1E39191A8;
    v17[4] = &buf;
    v17[5] = &v18;
    objc_msgSend(v8, "areRecoveryKeysDistrusted:reply:", v10, v17);

    v11 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v11)
    {
      v12 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v11);
    }
    else
    {
      secLogObjForScope();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        if (*((_BYTE *)v19 + 24))
          v15 = CFSTR("contains");
        else
          v15 = CFSTR("does not contain");
        *(_DWORD *)v23 = 138412290;
        v24 = v15;
        _os_log_impl(&dword_19A7FA000, v14, OS_LOG_TYPE_DEFAULT, "Octagon circle %@ distrusted recovery keys", v23, 0xCu);
      }

      v12 = *((_BYTE *)v19 + 24) != 0;
    }
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    secLogObjForScope();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_19A7FA000, v13, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", (uint8_t *)&buf, 0xCu);
    }

    v12 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }

  return v12;
}

@end
