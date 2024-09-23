@implementation ICDelegateAccountStoreXPCWriter

- (ICDelegateAccountStoreXPCWriter)initWithAccountStoreOptions:(id)a3
{
  id v4;
  void *v5;
  ICDelegateAccountStoreXPCWriter *v6;
  ICDelegateAccountStoreXPCWriter *v7;
  uint64_t v8;
  ICDelegateAccountStoreOptions *accountStoreOptions;
  dispatch_queue_t v10;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v12;
  OS_dispatch_queue *callbackQueue;
  objc_super v15;

  v4 = a3;
  objc_msgSend(v4, "XPCEndpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    objc_msgSend(v4, "XPCServiceName");
    v6 = (ICDelegateAccountStoreXPCWriter *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_7;
  }
  v15.receiver = self;
  v15.super_class = (Class)ICDelegateAccountStoreXPCWriter;
  v7 = -[ICDelegateAccountStoreXPCWriter init](&v15, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v4, "copy");
    accountStoreOptions = v7->_accountStoreOptions;
    v7->_accountStoreOptions = (ICDelegateAccountStoreOptions *)v8;

    v10 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegateAccountStoreXPCWriter.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v7->_accessQueue;
    v7->_accessQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegateAccountStoreXPCWriter.callbackQueue", 0);
    callbackQueue = v7->_callbackQueue;
    v7->_callbackQueue = (OS_dispatch_queue *)v12;

  }
  self = v7;
  v6 = self;
LABEL_7:

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ICDelegateAccountStoreXPCWriter;
  -[ICDelegateAccountStoreXPCWriter dealloc](&v3, sel_dealloc);
}

- (void)addDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __88__ICDelegateAccountStoreXPCWriter_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke;
  v14[3] = &unk_1E438CE00;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[ICDelegateAccountStoreXPCWriter _getXPCConnectionWithCompletion:](self, "_getXPCConnectionWithCompletion:", v14);

}

- (void)removeAllTokensWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__ICDelegateAccountStoreXPCWriter_removeAllTokensWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E438CE28;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ICDelegateAccountStoreXPCWriter _getXPCConnectionWithCompletion:](self, "_getXPCConnectionWithCompletion:", v6);

}

- (void)removeDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91__ICDelegateAccountStoreXPCWriter_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke;
  v14[3] = &unk_1E438CE00;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[ICDelegateAccountStoreXPCWriter _getXPCConnectionWithCompletion:](self, "_getXPCConnectionWithCompletion:", v14);

}

- (void)removeIdentityPropertiesForUserIdentity:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __93__ICDelegateAccountStoreXPCWriter_removeIdentityPropertiesForUserIdentity_completionHandler___block_invoke;
  v10[3] = &unk_1E438CE50;
  v11 = v6;
  v12 = v7;
  v10[4] = self;
  v8 = v6;
  v9 = v7;
  -[ICDelegateAccountStoreXPCWriter _getXPCConnectionWithCompletion:](self, "_getXPCConnectionWithCompletion:", v10);

}

- (void)removeTokenForUserIdentity:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__ICDelegateAccountStoreXPCWriter_removeTokenForUserIdentity_completionHandler___block_invoke;
  v10[3] = &unk_1E438CE50;
  v11 = v6;
  v12 = v7;
  v10[4] = self;
  v8 = v6;
  v9 = v7;
  -[ICDelegateAccountStoreXPCWriter _getXPCConnectionWithCompletion:](self, "_getXPCConnectionWithCompletion:", v10);

}

- (void)removeTokensExpiringBeforeDate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__ICDelegateAccountStoreXPCWriter_removeTokensExpiringBeforeDate_completionHandler___block_invoke;
  v10[3] = &unk_1E438CE50;
  v11 = v6;
  v12 = v7;
  v10[4] = self;
  v8 = v6;
  v9 = v7;
  -[ICDelegateAccountStoreXPCWriter _getXPCConnectionWithCompletion:](self, "_getXPCConnectionWithCompletion:", v10);

}

- (void)setIdentityProperties:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91__ICDelegateAccountStoreXPCWriter_setIdentityProperties_forUserIdentity_completionHandler___block_invoke;
  v14[3] = &unk_1E438CE00;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[ICDelegateAccountStoreXPCWriter _getXPCConnectionWithCompletion:](self, "_getXPCConnectionWithCompletion:", v14);

}

- (void)setToken:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__ICDelegateAccountStoreXPCWriter_setToken_forUserIdentity_completionHandler___block_invoke;
  v14[3] = &unk_1E438CE00;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[ICDelegateAccountStoreXPCWriter _getXPCConnectionWithCompletion:](self, "_getXPCConnectionWithCompletion:", v14);

}

- (void)delegateAccountStoreDidChange
{
  void *v3;
  void *v4;
  NSObject *callbackQueue;
  _QWORD block[4];
  id v7;

  -[ICDelegateAccountStoreXPCWriter externalChangeHandler](self, "externalChangeHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__ICDelegateAccountStoreXPCWriter_delegateAccountStoreDidChange__block_invoke;
    block[3] = &unk_1E4390D18;
    v7 = v3;
    dispatch_async(callbackQueue, block);

  }
}

- (id)externalChangeHandler
{
  NSObject *accessQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__18151;
  v10 = __Block_byref_object_dispose__18152;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__ICDelegateAccountStoreXPCWriter_externalChangeHandler__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (void *)MEMORY[0x1A1AFA8D0](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setExternalChangeHandler:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__ICDelegateAccountStoreXPCWriter_setExternalChangeHandler___block_invoke;
  v7[3] = &unk_1E4390EF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

- (void)invalidate
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__ICDelegateAccountStoreXPCWriter_invalidate__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__ICDelegateAccountStoreXPCWriter_openWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E438CE28;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ICDelegateAccountStoreXPCWriter _getXPCConnectionWithCompletion:](self, "_getXPCConnectionWithCompletion:", v6);

}

- (void)recreateWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__ICDelegateAccountStoreXPCWriter_recreateWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E438CEA0;
  v7 = v4;
  v5 = v4;
  -[ICDelegateAccountStoreXPCWriter _getXPCConnectionWithCompletion:](self, "_getXPCConnectionWithCompletion:", v6);

}

- (id)_onceWithCompletionHandler:(id)a3
{
  id v4;
  ICDispatchOnce *v5;
  id v6;
  ICDispatchOnce *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = [ICDispatchOnce alloc];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__ICDelegateAccountStoreXPCWriter__onceWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E438F330;
  v10 = v4;
  v6 = v4;
  v7 = -[ICDispatchOnce initWithBooleanHandler:](v5, "initWithBooleanHandler:", v9);
  -[ICDispatchOnce startWithTimeout:queue:](v7, "startWithTimeout:queue:", self->_callbackQueue, 10.0);

  return v7;
}

- (void)_getXPCConnectionWithCompletion:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke;
  v7[3] = &unk_1E4390EF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_externalChangeHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_accountStoreOptions, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  _QWORD block[4];
  id v10;
  id v11;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v4 = *(NSObject **)(v3 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_2;
    block[3] = &unk_1E4390EF8;
    v11 = *(id *)(a1 + 40);
    v10 = v2;
    dispatch_async(v4, block);

    v5 = v11;
  }
  else
  {
    v6 = *(NSObject **)(v3 + 8);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_3;
    v7[3] = &unk_1E4390EF8;
    v7[4] = v3;
    v8 = *(id *)(a1 + 40);
    dispatch_barrier_async(v6, v7);
    v5 = v8;
  }

}

uint64_t __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id from;
  id location[2];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  v4 = MEMORY[0x1E0C809B0];
  if (!v3)
  {
    if (*(_BYTE *)(v2 + 48))
    {
      v3 = 0;
      goto LABEL_10;
    }
    objc_msgSend(*(id *)(v2 + 16), "XPCEndpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "XPCServiceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v5);
    }
    else
    {
      if (!objc_msgSend(v6, "length"))
      {
LABEL_9:
        v11 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
        ICDelegateAccountStoreServiceGetInterface();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setRemoteObjectInterface:", v12);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setExportedObject:");
        v13 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
        objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5BD0C0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setExportedInterface:", v14);

        objc_initWeak(location, *(id *)(a1 + 32));
        objc_initWeak(&from, *(id *)(*(_QWORD *)(a1 + 32) + 32));
        v15 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
        v27[0] = v4;
        v27[1] = 3221225472;
        v27[2] = __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_4;
        v27[3] = &unk_1E438D8F8;
        objc_copyWeak(&v28, location);
        objc_copyWeak(&v29, &from);
        objc_msgSend(v15, "setInvalidationHandler:", v27);
        v16 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
        v24[0] = v4;
        v24[1] = 3221225472;
        v24[2] = __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_6;
        v24[3] = &unk_1E438D8F8;
        objc_copyWeak(&v25, location);
        objc_copyWeak(&v26, &from);
        objc_msgSend(v16, "setInterruptionHandler:", v24);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "resume");
        objc_destroyWeak(&v26);
        objc_destroyWeak(&v25);
        objc_destroyWeak(&v29);
        objc_destroyWeak(&v28);
        objc_destroyWeak(&from);
        objc_destroyWeak(location);

        v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
        goto LABEL_10;
      }
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", v7, 0);
    }
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 32);
    *(_QWORD *)(v9 + 32) = v8;

    goto LABEL_9;
  }
LABEL_10:
  v17 = v3;
  v18 = *(void **)(a1 + 40);
  v19 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_8;
  block[3] = &unk_1E4390EF8;
  v22 = v17;
  v23 = v18;
  v20 = v17;
  dispatch_async(v19, block);

}

void __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_4(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  _QWORD *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = v3;
  if (WeakRetained && v3)
  {
    v5 = WeakRetained[1];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_5;
    v6[3] = &unk_1E4391110;
    v7 = WeakRetained;
    v8 = v4;
    dispatch_barrier_async(v5, v6);

  }
}

void __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_6(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  _QWORD *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = v3;
  if (WeakRetained && v3)
  {
    v5 = WeakRetained[1];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_7;
    v6[3] = &unk_1E4391110;
    v7 = WeakRetained;
    v8 = v4;
    dispatch_barrier_async(v5, v6);

  }
}

uint64_t __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v3 == v2)
  {
    objc_msgSend(v3, "invalidate");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = 0;

  }
}

void __67__ICDelegateAccountStoreXPCWriter__getXPCConnectionWithCompletion___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v3 == v2)
  {
    objc_msgSend(v3, "invalidate");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
  }
}

uint64_t __62__ICDelegateAccountStoreXPCWriter__onceWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __65__ICDelegateAccountStoreXPCWriter_recreateWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "remoteObjectProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65__ICDelegateAccountStoreXPCWriter_recreateWithCompletionHandler___block_invoke_2;
    v7[3] = &unk_1E438F330;
    v8 = *(id *)(a1 + 32);
    objc_msgSend(v5, "recreateWithCompletionHandler:", v7);

LABEL_5:
    goto LABEL_6;
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v5);
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __65__ICDelegateAccountStoreXPCWriter_recreateWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __61__ICDelegateAccountStoreXPCWriter_openWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  ICDispatchOnce *v6;
  uint64_t v7;
  ICDispatchOnce *v8;
  ICDispatchOnce *v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "XPCServiceName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    v6 = [ICDispatchOnce alloc];
    v7 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __61__ICDelegateAccountStoreXPCWriter_openWithCompletionHandler___block_invoke_2;
    v16[3] = &unk_1E438D448;
    v17 = *(id *)(a1 + 40);
    v8 = -[ICDispatchOnce initWithObjectHandler:](v6, "initWithObjectHandler:", v16);
    v9 = v8;
    v10 = 10.0;
    if (!v5)
      v10 = 2.0;
    -[ICDispatchOnce startWithTimeout:queue:](v8, "startWithTimeout:queue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v10);
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __61__ICDelegateAccountStoreXPCWriter_openWithCompletionHandler___block_invoke_3;
    v15[3] = &unk_1E43902A0;
    v15[4] = v9;
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __61__ICDelegateAccountStoreXPCWriter_openWithCompletionHandler___block_invoke_4;
    v14[3] = &unk_1E438CE78;
    v14[4] = v9;
    objc_msgSend(v11, "openWithCompletionHandler:", v14);

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v12 + 16))(v12, 0, 0, v13);

    }
  }

}

void __61__ICDelegateAccountStoreXPCWriter_openWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    v6 = a2;
    (*(void (**)(uint64_t, BOOL, id, id))(v3 + 16))(v3, objc_msgSend(v6, "length") != 0, v6, v5);

  }
}

uint64_t __61__ICDelegateAccountStoreXPCWriter_openWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "failWithError:", a2);
}

uint64_t __61__ICDelegateAccountStoreXPCWriter_openWithCompletionHandler___block_invoke_4(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  void *v4;

  v4 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
    return objc_msgSend(v4, "finishWithObjectResult:error:", a3, 0);
  else
    return objc_msgSend(v4, "failWithError:", a4);
}

void __45__ICDelegateAccountStoreXPCWriter_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

}

void __60__ICDelegateAccountStoreXPCWriter_setExternalChangeHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A1AFA8D0](*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __56__ICDelegateAccountStoreXPCWriter_externalChangeHandler__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A1AFA8D0](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __64__ICDelegateAccountStoreXPCWriter_delegateAccountStoreDidChange__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__ICDelegateAccountStoreXPCWriter_setToken_forUserIdentity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_onceWithCompletionHandler:", *(_QWORD *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __78__ICDelegateAccountStoreXPCWriter_setToken_forUserIdentity_completionHandler___block_invoke_2;
    v11[3] = &unk_1E43902A0;
    v11[4] = v4;
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __78__ICDelegateAccountStoreXPCWriter_setToken_forUserIdentity_completionHandler___block_invoke_3;
    v10[3] = &unk_1E438E718;
    v10[4] = v4;
    objc_msgSend(v6, "setToken:forUserIdentity:completionHandler:", v7, v8, v10);

LABEL_5:
    goto LABEL_6;
  }
  v9 = *(_QWORD *)(a1 + 56);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v4);
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __78__ICDelegateAccountStoreXPCWriter_setToken_forUserIdentity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "failWithError:", a2);
}

uint64_t __78__ICDelegateAccountStoreXPCWriter_setToken_forUserIdentity_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithBooleanResult:error:", a2, a3);
}

void __91__ICDelegateAccountStoreXPCWriter_setIdentityProperties_forUserIdentity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_onceWithCompletionHandler:", *(_QWORD *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __91__ICDelegateAccountStoreXPCWriter_setIdentityProperties_forUserIdentity_completionHandler___block_invoke_2;
    v11[3] = &unk_1E43902A0;
    v11[4] = v4;
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __91__ICDelegateAccountStoreXPCWriter_setIdentityProperties_forUserIdentity_completionHandler___block_invoke_3;
    v10[3] = &unk_1E438E718;
    v10[4] = v4;
    objc_msgSend(v6, "setIdentityProperties:forUserIdentity:completionHandler:", v7, v8, v10);

LABEL_5:
    goto LABEL_6;
  }
  v9 = *(_QWORD *)(a1 + 56);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v4);
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __91__ICDelegateAccountStoreXPCWriter_setIdentityProperties_forUserIdentity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "failWithError:", a2);
}

uint64_t __91__ICDelegateAccountStoreXPCWriter_setIdentityProperties_forUserIdentity_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithBooleanResult:error:", a2, a3);
}

void __84__ICDelegateAccountStoreXPCWriter_removeTokensExpiringBeforeDate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_onceWithCompletionHandler:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __84__ICDelegateAccountStoreXPCWriter_removeTokensExpiringBeforeDate_completionHandler___block_invoke_2;
    v10[3] = &unk_1E43902A0;
    v10[4] = v4;
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __84__ICDelegateAccountStoreXPCWriter_removeTokensExpiringBeforeDate_completionHandler___block_invoke_3;
    v9[3] = &unk_1E438E718;
    v9[4] = v4;
    objc_msgSend(v6, "removeTokensExpiringBeforeDate:completionHandler:", v7, v9);

LABEL_5:
    goto LABEL_6;
  }
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v4);
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __84__ICDelegateAccountStoreXPCWriter_removeTokensExpiringBeforeDate_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "failWithError:", a2);
}

uint64_t __84__ICDelegateAccountStoreXPCWriter_removeTokensExpiringBeforeDate_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithBooleanResult:error:", a2, a3);
}

void __80__ICDelegateAccountStoreXPCWriter_removeTokenForUserIdentity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_onceWithCompletionHandler:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __80__ICDelegateAccountStoreXPCWriter_removeTokenForUserIdentity_completionHandler___block_invoke_2;
    v10[3] = &unk_1E43902A0;
    v10[4] = v4;
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __80__ICDelegateAccountStoreXPCWriter_removeTokenForUserIdentity_completionHandler___block_invoke_3;
    v9[3] = &unk_1E438E718;
    v9[4] = v4;
    objc_msgSend(v6, "removeTokenForUserIdentity:completionHandler:", v7, v9);

LABEL_5:
    goto LABEL_6;
  }
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v4);
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __80__ICDelegateAccountStoreXPCWriter_removeTokenForUserIdentity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "failWithError:", a2);
}

uint64_t __80__ICDelegateAccountStoreXPCWriter_removeTokenForUserIdentity_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithBooleanResult:error:", a2, a3);
}

void __93__ICDelegateAccountStoreXPCWriter_removeIdentityPropertiesForUserIdentity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_onceWithCompletionHandler:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __93__ICDelegateAccountStoreXPCWriter_removeIdentityPropertiesForUserIdentity_completionHandler___block_invoke_2;
    v10[3] = &unk_1E43902A0;
    v10[4] = v4;
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __93__ICDelegateAccountStoreXPCWriter_removeIdentityPropertiesForUserIdentity_completionHandler___block_invoke_3;
    v9[3] = &unk_1E438E718;
    v9[4] = v4;
    objc_msgSend(v6, "removeIdentityPropertiesForUserIdentity:completionHandler:", v7, v9);

LABEL_5:
    goto LABEL_6;
  }
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v4);
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __93__ICDelegateAccountStoreXPCWriter_removeIdentityPropertiesForUserIdentity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "failWithError:", a2);
}

uint64_t __93__ICDelegateAccountStoreXPCWriter_removeIdentityPropertiesForUserIdentity_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithBooleanResult:error:", a2, a3);
}

void __91__ICDelegateAccountStoreXPCWriter_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_onceWithCompletionHandler:", *(_QWORD *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __91__ICDelegateAccountStoreXPCWriter_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2;
    v11[3] = &unk_1E43902A0;
    v11[4] = v4;
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __91__ICDelegateAccountStoreXPCWriter_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_3;
    v10[3] = &unk_1E438E718;
    v10[4] = v4;
    objc_msgSend(v6, "removeDelegationUUIDs:forUserIdentity:completionHandler:", v7, v8, v10);

LABEL_5:
    goto LABEL_6;
  }
  v9 = *(_QWORD *)(a1 + 56);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v4);
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __91__ICDelegateAccountStoreXPCWriter_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "failWithError:", a2);
}

uint64_t __91__ICDelegateAccountStoreXPCWriter_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithBooleanResult:error:", a2, a3);
}

void __72__ICDelegateAccountStoreXPCWriter_removeAllTokensWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_onceWithCompletionHandler:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72__ICDelegateAccountStoreXPCWriter_removeAllTokensWithCompletionHandler___block_invoke_2;
    v10[3] = &unk_1E43902A0;
    v10[4] = v4;
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __72__ICDelegateAccountStoreXPCWriter_removeAllTokensWithCompletionHandler___block_invoke_3;
    v9[3] = &unk_1E438E718;
    v9[4] = v4;
    objc_msgSend(v6, "removeAllTokensWithCompletionHandler:", v9);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

    }
  }

}

uint64_t __72__ICDelegateAccountStoreXPCWriter_removeAllTokensWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "failWithError:", a2);
}

uint64_t __72__ICDelegateAccountStoreXPCWriter_removeAllTokensWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithBooleanResult:error:", a2, a3);
}

void __88__ICDelegateAccountStoreXPCWriter_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_onceWithCompletionHandler:", *(_QWORD *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __88__ICDelegateAccountStoreXPCWriter_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2;
    v11[3] = &unk_1E43902A0;
    v11[4] = v4;
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __88__ICDelegateAccountStoreXPCWriter_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_3;
    v10[3] = &unk_1E438E718;
    v10[4] = v4;
    objc_msgSend(v6, "addDelegationUUIDs:forUserIdentity:completionHandler:", v7, v8, v10);

LABEL_5:
    goto LABEL_6;
  }
  v9 = *(_QWORD *)(a1 + 56);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v4);
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __88__ICDelegateAccountStoreXPCWriter_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "failWithError:", a2);
}

uint64_t __88__ICDelegateAccountStoreXPCWriter_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithBooleanResult:error:", a2, a3);
}

@end
