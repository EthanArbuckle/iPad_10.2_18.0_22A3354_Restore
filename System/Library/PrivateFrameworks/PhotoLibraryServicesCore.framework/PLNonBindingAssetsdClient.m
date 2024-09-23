@implementation PLNonBindingAssetsdClient

- (PLNonBindingAssetsdClient)init
{
  PLNonBindingAssetsdClient *v2;
  PLAssetsdClientXPCConnection *v3;
  PLAssetsdClientXPCConnection *connection;
  dispatch_queue_t v5;
  OS_dispatch_queue *isolationQueue;
  void *v7;
  PLNonBindingAssetsdClient *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PLNonBindingAssetsdClient;
  v2 = -[PLNonBindingAssetsdClient init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PLAssetsdClientXPCConnection);
    connection = v2->_connection;
    v2->_connection = v3;

    v5 = dispatch_queue_create("PLNonBindingAssetsdClient isolation queue", 0);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__updateLibraryStateConnectionInterrupted_, CFSTR("PLAssetsdClientXPCConnectionInterruptedInternalNotificationName"), v2->_connection);

    v8 = v2;
  }

  return v2;
}

- (PLAssetsdSystemLibraryURLReadOnlyClient)systemLibraryURLReadOnlyClient
{
  NSObject *isolationQueue;
  id v3;
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
  v9 = __Block_byref_object_copy__5667;
  v10 = __Block_byref_object_dispose__5668;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__PLNonBindingAssetsdClient_systemLibraryURLReadOnlyClient__block_invoke;
  v5[3] = &unk_1E376C748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdSystemLibraryURLReadOnlyClient *)v3;
}

- (PLAssetsdLibraryManagementClient)libraryManagementClient
{
  NSObject *isolationQueue;
  id v3;
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
  v9 = __Block_byref_object_copy__5667;
  v10 = __Block_byref_object_dispose__5668;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__PLNonBindingAssetsdClient_libraryManagementClient__block_invoke;
  v5[3] = &unk_1E376C748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdLibraryManagementClient *)v3;
}

- (PLAssetsdDemoClient)demoClient
{
  NSObject *isolationQueue;
  id v3;
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
  v9 = __Block_byref_object_copy__5667;
  v10 = __Block_byref_object_dispose__5668;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__PLNonBindingAssetsdClient_demoClient__block_invoke;
  v5[3] = &unk_1E376C748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdDemoClient *)v3;
}

- (PLAssetsdPrivacySupportClient)privacySupportClient
{
  NSObject *isolationQueue;
  id v3;
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
  v9 = __Block_byref_object_copy__5667;
  v10 = __Block_byref_object_dispose__5668;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__PLNonBindingAssetsdClient_privacySupportClient__block_invoke;
  v5[3] = &unk_1E376C748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdPrivacySupportClient *)v3;
}

- (void)_updateLibraryStateConnectionInterrupted:(id)a3
{
  NSObject *isolationQueue;
  _QWORD block[5];

  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PLNonBindingAssetsdClient__updateLibraryStateConnectionInterrupted___block_invoke;
  block[3] = &unk_1E376C6E0;
  block[4] = self;
  dispatch_async(isolationQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacySupportClient, 0);
  objc_storeStrong((id *)&self->_demoClient, 0);
  objc_storeStrong((id *)&self->_libraryManagementClient, 0);
  objc_storeStrong((id *)&self->_systemLibraryURLReadOnlyClient, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __70__PLNonBindingAssetsdClient__updateLibraryStateConnectionInterrupted___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 48);
  *(_QWORD *)(v8 + 48) = 0;

}

void __49__PLNonBindingAssetsdClient_privacySupportClient__block_invoke(uint64_t a1)
{
  void *v2;
  PLAssetsdPrivacySupportClient *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (!v2)
  {
    v3 = -[PLAssetsdBaseClient initWithQueue:proxyCreating:proxyGetter:]([PLAssetsdPrivacySupportClient alloc], "initWithQueue:proxyCreating:proxyGetter:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), sel_getPrivacySupportServiceWithReply_);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void __39__PLNonBindingAssetsdClient_demoClient__block_invoke(uint64_t a1)
{
  void *v2;
  PLAssetsdDemoClient *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (!v2)
  {
    v3 = -[PLAssetsdBaseClient initWithQueue:proxyCreating:proxyGetter:]([PLAssetsdDemoClient alloc], "initWithQueue:proxyCreating:proxyGetter:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), sel_getDemoServiceWithReply_);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void __52__PLNonBindingAssetsdClient_libraryManagementClient__block_invoke(uint64_t a1)
{
  void *v2;
  PLAssetsdLibraryManagementClient *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (!v2)
  {
    v3 = -[PLAssetsdBaseClient initWithQueue:proxyCreating:proxyGetter:]([PLAssetsdLibraryManagementClient alloc], "initWithQueue:proxyCreating:proxyGetter:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), sel_getLibraryManagementServiceWithReply_);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void __59__PLNonBindingAssetsdClient_systemLibraryURLReadOnlyClient__block_invoke(uint64_t a1)
{
  void *v2;
  PLAssetsdSystemLibraryURLReadOnlyClient *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    v3 = -[PLAssetsdBaseClient initWithQueue:proxyCreating:proxyGetter:]([PLAssetsdSystemLibraryURLReadOnlyClient alloc], "initWithQueue:proxyCreating:proxyGetter:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), sel_getSystemLibraryURLReadOnlyServiceWithReply_);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

@end
