@implementation PLAssetsdClient

void __51__PLAssetsdClient_sharedSystemLibraryAssetsdClient__block_invoke_3()
{
  PLAssetsdClient *v0;
  uint64_t v1;
  void *v2;
  id v3;

  if (!sharedSystemLibraryAssetsdClient_sharedAssetsdClient)
  {
    v0 = [PLAssetsdClient alloc];
    +[PLPhotoLibraryPathManagerCore systemLibraryURL](PLPhotoLibraryPathManagerCore, "systemLibraryURL");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v1 = -[PLAssetsdClient initWithPhotoLibraryURL:](v0, "initWithPhotoLibraryURL:", v3);
    v2 = (void *)sharedSystemLibraryAssetsdClient_sharedAssetsdClient;
    sharedSystemLibraryAssetsdClient_sharedAssetsdClient = v1;

  }
}

- (PLAssetsdClient)initWithPhotoLibraryURL:(id)a3
{
  id v5;
  BOOL v6;
  PLAssetsdClient *v7;
  PLAssetsdClientSandboxExtensions *v8;
  PLAssetsdClientSandboxExtensions *sandboxExtensions;
  PLAssetsdClientXPCConnection *v10;
  PLAssetsdClientXPCConnection *connection;
  PLAutoBindingProxyFactory *v12;
  PLAutoBindingProxyFactory *autoBindingProxyFactory;
  dispatch_queue_t v14;
  OS_dispatch_queue *isolationQueue;
  void *v16;
  void *v18;
  objc_super v19;

  v5 = a3;
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
  if (PLIsReallyAssetsd_isAssetsd)
    v6 = 0;
  else
    v6 = __PLIsAssetsdProxyService == 0;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdClient.m"), 131, CFSTR("PLAssetsdClient must not be used by assetsd"));

  }
  v19.receiver = self;
  v19.super_class = (Class)PLAssetsdClient;
  v7 = -[PLAssetsdClient init](&v19, sel_init);
  if (v7)
  {
    v8 = objc_alloc_init(PLAssetsdClientSandboxExtensions);
    sandboxExtensions = v7->_sandboxExtensions;
    v7->_sandboxExtensions = v8;

    v10 = objc_alloc_init(PLAssetsdClientXPCConnection);
    connection = v7->_connection;
    v7->_connection = v10;

    v12 = -[PLAutoBindingProxyFactory initWithProxyFactory:photoLibraryURL:]([PLAutoBindingProxyFactory alloc], "initWithProxyFactory:photoLibraryURL:", v7->_connection, v5);
    autoBindingProxyFactory = v7->_autoBindingProxyFactory;
    v7->_autoBindingProxyFactory = v12;

    v14 = dispatch_queue_create("PLAssetsdClient isolation queue", 0);
    isolationQueue = v7->_isolationQueue;
    v7->_isolationQueue = (OS_dispatch_queue *)v14;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v7, sel__updateLibraryStateConnectionInterrupted_, CFSTR("PLAssetsdClientXPCConnectionInterruptedInternalNotificationName"), v7->_connection);

  }
  return v7;
}

void __41__PLAssetsdClient_resourceInternalClient__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 112));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setupClientClass:proxyGetter:options:", objc_opt_class(), sel_getResourceInternalServiceWithReply_, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 112);
    *(_QWORD *)(v3 + 112) = v2;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
  }
}

void __32__PLAssetsdClient_libraryClient__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setupClientClass:proxyGetter:options:", objc_opt_class(), sel_getLibraryServiceWithReply_, 3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
  }
}

- (id)_setupClientClass:(Class)a3 proxyGetter:(SEL)a4 options:(int64_t)a5
{
  char v5;
  uint64_t v9;
  id v10;
  id v11;
  OS_dispatch_queue *isolationQueue;
  uint64_t v13;
  void *v14;

  v5 = a5;
  v9 = 24;
  if ((a5 & 1) == 0)
    v9 = 16;
  v10 = *(id *)((char *)&self->super.isa + v9);
  v11 = [a3 alloc];
  isolationQueue = self->_isolationQueue;
  if ((v5 & 2) != 0)
    v13 = objc_msgSend(v11, "initWithQueue:proxyCreating:proxyGetter:sandboxExtensions:", isolationQueue, v10, a4, self->_sandboxExtensions);
  else
    v13 = objc_msgSend(v11, "initWithQueue:proxyCreating:proxyGetter:", isolationQueue, v10, a4);
  v14 = (void *)v13;

  return v14;
}

void __51__PLAssetsdClient_sharedSystemLibraryAssetsdClient__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("sharedSystemLibraryAssetsdClient", 0);
  v1 = (void *)sharedSystemLibraryAssetsdClient_sharedAssetsdClientQueue;
  sharedSystemLibraryAssetsdClient_sharedAssetsdClientQueue = (uint64_t)v0;

}

+ (id)sharedSystemLibraryAssetsdClient
{
  if (sharedSystemLibraryAssetsdClient_onceToken != -1)
    dispatch_once(&sharedSystemLibraryAssetsdClient_onceToken, &__block_literal_global_5580);
  notify_register_dispatch("com.apple.photos.systemphotolibraryurl", (int *)&sharedSystemLibraryAssetsdClient_splURLChangeNotificationToken, (dispatch_queue_t)sharedSystemLibraryAssetsdClient_sharedAssetsdClientQueue, &__block_literal_global_3);
  dispatch_sync((dispatch_queue_t)sharedSystemLibraryAssetsdClient_sharedAssetsdClientQueue, &__block_literal_global_4_5581);
  return (id)sharedSystemLibraryAssetsdClient_sharedAssetsdClient;
}

- (PLAssetsdResourceInternalClient)resourceInternalClient
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
  v9 = __Block_byref_object_copy__5524;
  v10 = __Block_byref_object_dispose__5525;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__PLAssetsdClient_resourceInternalClient__block_invoke;
  v5[3] = &unk_1E376C748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdResourceInternalClient *)v3;
}

- (PLAssetsdLibraryClient)libraryClient
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
  v9 = __Block_byref_object_copy__5524;
  v10 = __Block_byref_object_dispose__5525;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__PLAssetsdClient_libraryClient__block_invoke;
  v5[3] = &unk_1E376C748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdLibraryClient *)v3;
}

void __36__PLAssetsdClient_diagnosticsClient__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 168));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setupClientClass:proxyGetter:options:", objc_opt_class(), sel_getDiagnosticsServiceWithReply_, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 168);
    *(_QWORD *)(v3 + 168) = v2;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
  }
}

- (PLAssetsdDiagnosticsClient)diagnosticsClient
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
  v9 = __Block_byref_object_copy__5524;
  v10 = __Block_byref_object_dispose__5525;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__PLAssetsdClient_diagnosticsClient__block_invoke;
  v5[3] = &unk_1E376C748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdDiagnosticsClient *)v3;
}

- (PLAssetsdClient)init
{
  -[PLAssetsdClient doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[PLAssetsdClientXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PLAssetsdClient;
  -[PLAssetsdClient dealloc](&v3, sel_dealloc);
}

- (void)addPhotoLibraryUnavailabilityHandler:(id)a3
{
  id v5;
  PLAssetsdClientXPCConnection *connection;
  void *v7;
  id v8;

  v5 = a3;
  connection = self->_connection;
  v8 = v5;
  if (!connection)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdClient.m"), 149, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_connection != nil"));

    v5 = v8;
    connection = self->_connection;
  }
  -[PLAssetsdClientXPCConnection addPhotoLibraryUnavailabilityHandler:](connection, "addPhotoLibraryUnavailabilityHandler:", v5);

}

- (PLAssetsdLibraryInternalClient)libraryInternalClient
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
  v9 = __Block_byref_object_copy__5524;
  v10 = __Block_byref_object_dispose__5525;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__PLAssetsdClient_libraryInternalClient__block_invoke;
  v5[3] = &unk_1E376C748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdLibraryInternalClient *)v3;
}

- (id)systemLibraryURLReadOnlyClient
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
  v9 = __Block_byref_object_copy__5524;
  v10 = __Block_byref_object_dispose__5525;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__PLAssetsdClient_systemLibraryURLReadOnlyClient__block_invoke;
  v5[3] = &unk_1E376C748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
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
  v9 = __Block_byref_object_copy__5524;
  v10 = __Block_byref_object_dispose__5525;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__PLAssetsdClient_libraryManagementClient__block_invoke;
  v5[3] = &unk_1E376C748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdLibraryManagementClient *)v3;
}

- (PLAssetsdPhotoKitClient)photoKitClient
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
  v9 = __Block_byref_object_copy__5524;
  v10 = __Block_byref_object_dispose__5525;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__PLAssetsdClient_photoKitClient__block_invoke;
  v5[3] = &unk_1E376C748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdPhotoKitClient *)v3;
}

- (PLAssetsdResourceAvailabilityClient)resourceAvailabilityClient
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
  v9 = __Block_byref_object_copy__5524;
  v10 = __Block_byref_object_dispose__5525;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__PLAssetsdClient_resourceAvailabilityClient__block_invoke;
  v5[3] = &unk_1E376C748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdResourceAvailabilityClient *)v3;
}

- (PLAssetsdPhotoKitAddClient)photoKitAddClient
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
  v9 = __Block_byref_object_copy__5524;
  v10 = __Block_byref_object_dispose__5525;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__PLAssetsdClient_photoKitAddClient__block_invoke;
  v5[3] = &unk_1E376C748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdPhotoKitAddClient *)v3;
}

- (PLAssetsdResourceClient)resourceClient
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
  v9 = __Block_byref_object_copy__5524;
  v10 = __Block_byref_object_dispose__5525;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__PLAssetsdClient_resourceClient__block_invoke;
  v5[3] = &unk_1E376C748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdResourceClient *)v3;
}

- (id)resourceWriteOnlyClient
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
  v9 = __Block_byref_object_copy__5524;
  v10 = __Block_byref_object_dispose__5525;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__PLAssetsdClient_resourceWriteOnlyClient__block_invoke;
  v5[3] = &unk_1E376C748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (PLAssetsdCloudClient)cloudClient
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
  v9 = __Block_byref_object_copy__5524;
  v10 = __Block_byref_object_dispose__5525;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__PLAssetsdClient_cloudClient__block_invoke;
  v5[3] = &unk_1E376C748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdCloudClient *)v3;
}

- (PLAssetsdCloudInternalClient)cloudInternalClient
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
  v9 = __Block_byref_object_copy__5524;
  v10 = __Block_byref_object_dispose__5525;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__PLAssetsdClient_cloudInternalClient__block_invoke;
  v5[3] = &unk_1E376C748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdCloudInternalClient *)v3;
}

- (PLAssetsdMigrationClient)migrationClient
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
  v9 = __Block_byref_object_copy__5524;
  v10 = __Block_byref_object_dispose__5525;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__PLAssetsdClient_migrationClient__block_invoke;
  v5[3] = &unk_1E376C748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdMigrationClient *)v3;
}

- (PLAssetsdSyncClient)syncClient
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
  v9 = __Block_byref_object_copy__5524;
  v10 = __Block_byref_object_dispose__5525;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__PLAssetsdClient_syncClient__block_invoke;
  v5[3] = &unk_1E376C748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdSyncClient *)v3;
}

- (PLAssetsdNotificationClient)notificationClient
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
  v9 = __Block_byref_object_copy__5524;
  v10 = __Block_byref_object_dispose__5525;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__PLAssetsdClient_notificationClient__block_invoke;
  v5[3] = &unk_1E376C748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdNotificationClient *)v3;
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
  v9 = __Block_byref_object_copy__5524;
  v10 = __Block_byref_object_dispose__5525;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__PLAssetsdClient_demoClient__block_invoke;
  v5[3] = &unk_1E376C748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdDemoClient *)v3;
}

- (PLAssetsdDebugClient)debugClient
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
  v9 = __Block_byref_object_copy__5524;
  v10 = __Block_byref_object_dispose__5525;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__PLAssetsdClient_debugClient__block_invoke;
  v5[3] = &unk_1E376C748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdDebugClient *)v3;
}

- (id)privacySupportClient
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
  v9 = __Block_byref_object_copy__5524;
  v10 = __Block_byref_object_dispose__5525;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__PLAssetsdClient_privacySupportClient__block_invoke;
  v5[3] = &unk_1E376C748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_updateLibraryStateConnectionInterrupted:(id)a3
{
  NSObject *isolationQueue;
  _QWORD block[5];

  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PLAssetsdClient__updateLibraryStateConnectionInterrupted___block_invoke;
  block[3] = &unk_1E376C6E0;
  block[4] = self;
  dispatch_async(isolationQueue, block);
}

- (void)sendDaemonJob:(id)a3 shouldRunSerially:(BOOL)a4 replyHandler:(id)a5
{
  char *v9;
  id v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *isolationQueue;
  id v16;
  char *v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  const char *Name;
  _QWORD block[5];
  char *v23;
  id v24;
  char v25;
  id v26;
  __int128 v27;
  __int128 v28;
  SEL v29;
  BOOL v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = (char *)a3;
  v10 = a5;
  v32 = 0u;
  v33 = 0u;
  v31 = 0u;
  v11 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v31) = v11;
  if (v11)
  {
    v12 = _os_activity_create(&dword_199DF7000, "PLXPC Client: sendDaemonJob:shouldRunSerially:replyHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v13 = (void *)*((_QWORD *)&v31 + 1);
    *((_QWORD *)&v31 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  PLGatekeeperXPCGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v9;
    _os_log_impl(&dword_199DF7000, v14, OS_LOG_TYPE_DEFAULT, "Sending sendDaemonJob:shouldRunSerially:replyHandler: with job %@", buf, 0xCu);
  }

  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3254779904;
  block[2] = __64__PLAssetsdClient_sendDaemonJob_shouldRunSerially_replyHandler___block_invoke;
  block[3] = &unk_1E3767748;
  v16 = v10;
  v24 = v16;
  block[4] = self;
  v25 = v31;
  v26 = *((id *)&v31 + 1);
  v27 = v32;
  v28 = v33;
  v29 = a2;
  v17 = v9;
  v23 = v17;
  v30 = a4;
  dispatch_async(isolationQueue, block);

  if ((_BYTE)v31)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v32 + 8));
  if ((_QWORD)v32)
  {
    PLRequestGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = v32;
    if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      Name = sel_getName(*((SEL *)&v33 + 1));
      *(_DWORD *)buf = 136446210;
      v35 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)waitUntilConnectionSendsAllMessages
{
  NSObject *v3;
  dispatch_block_t v4;
  os_activity_scope_state_s v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = _os_activity_create(&dword_199DF7000, "Submitting barrier block to NSXPC send queue", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v5.opaque[0] = 0;
    v5.opaque[1] = 0;
    os_activity_scope_enter(v3, &v5);
    v4 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_88_5506);
    -[PLAssetsdClientXPCConnection addBarrierBlock:](self->_connection, "addBarrierBlock:", v4);
    dispatch_block_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

    os_activity_scope_leave(&v5);
  }
  else
  {
    PLGatekeeperXPCGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v5.opaque[0]) = 0;
      _os_log_impl(&dword_199DF7000, v3, OS_LOG_TYPE_ERROR, "Proxy factory object does not respond to addBarrierBlock:", (uint8_t *)&v5, 2u);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacySupportClient, 0);
  objc_storeStrong((id *)&self->_debugClient, 0);
  objc_storeStrong((id *)&self->_diagnosticsClient, 0);
  objc_storeStrong((id *)&self->_demoClient, 0);
  objc_storeStrong((id *)&self->_notificationClient, 0);
  objc_storeStrong((id *)&self->_syncClient, 0);
  objc_storeStrong((id *)&self->_migrationClient, 0);
  objc_storeStrong((id *)&self->_cloudInternalClient, 0);
  objc_storeStrong((id *)&self->_cloudClient, 0);
  objc_storeStrong((id *)&self->_resourceInternalClient, 0);
  objc_storeStrong((id *)&self->_resourceWriteOnlyClient, 0);
  objc_storeStrong((id *)&self->_resourceClient, 0);
  objc_storeStrong((id *)&self->_photoKitAddClient, 0);
  objc_storeStrong((id *)&self->_resourceAvailabilityClient, 0);
  objc_storeStrong((id *)&self->_photoKitClient, 0);
  objc_storeStrong((id *)&self->_libraryManagementClient, 0);
  objc_storeStrong((id *)&self->_systemLibraryURLReadOnlyClient, 0);
  objc_storeStrong((id *)&self->_libraryInternalClient, 0);
  objc_storeStrong((id *)&self->_libraryClient, 0);
  objc_storeStrong((id *)&self->_sandboxExtensions, 0);
  objc_storeStrong((id *)&self->_autoBindingProxyFactory, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

void __54__PLAssetsdClient_waitUntilConnectionSendsAllMessages__block_invoke()
{
  NSObject *v0;
  os_activity_scope_state_s v1;

  v0 = _os_activity_create(&dword_199DF7000, "NSXPC barrier block", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v1.opaque[0] = 0;
  v1.opaque[1] = 0;
  os_activity_scope_enter(v0, &v1);
  os_activity_scope_leave(&v1);

}

void __64__PLAssetsdClient_sendDaemonJob_shouldRunSerially_replyHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  const __CFString *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 48);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __64__PLAssetsdClient_sendDaemonJob_shouldRunSerially_replyHandler___block_invoke_2;
    v20[3] = &unk_1E376C3A8;
    v21 = v2;
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v20);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 56))
    {
      PLRequestGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = os_signpost_id_generate(v5);
      v26 = CFSTR("SignpostId");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "set_userInfo:", v8);

      v9 = v5;
      v10 = v9;
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        NSStringFromSelector(*(SEL *)(a1 + 104));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v11;
        _os_signpost_emit_with_name_impl(&dword_199DF7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PLXPC Async", "%{public}@", buf, 0xCu);

      }
    }
    objc_msgSend(v4, "runDaemonJob:isSerial:withReply:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 112), *(_QWORD *)(a1 + 48));

    v12 = v21;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_85);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 56))
    {
      PLRequestGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_signpost_id_generate(v13);
      v22 = CFSTR("SignpostId");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "set_userInfo:", v16);

      v17 = v13;
      v18 = v17;
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        NSStringFromSelector(*(SEL *)(a1 + 104));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v19;
        _os_signpost_emit_with_name_impl(&dword_199DF7000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PLXPC Async", "%{public}@", buf, 0xCu);

      }
    }
    objc_msgSend(v12, "runDaemonJob:isSerial:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 112));
  }

}

uint64_t __64__PLAssetsdClient_sendDaemonJob_shouldRunSerially_replyHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__PLAssetsdClient_sendDaemonJob_shouldRunSerially_replyHandler___block_invoke_84(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_199DF7000, v3, OS_LOG_TYPE_ERROR, "Error getting assetsd remote object proxy (%@)", (uint8_t *)&v4, 0xCu);
  }

}

void __60__PLAssetsdClient__updateLibraryStateConnectionInterrupted___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 64);
  *(_QWORD *)(v8 + 64) = 0;

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 72);
  *(_QWORD *)(v10 + 72) = 0;

  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 80);
  *(_QWORD *)(v12 + 80) = 0;

  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 88);
  *(_QWORD *)(v14 + 88) = 0;

  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 96);
  *(_QWORD *)(v16 + 96) = 0;

  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 104);
  *(_QWORD *)(v18 + 104) = 0;

  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(void **)(v20 + 112);
  *(_QWORD *)(v20 + 112) = 0;

  v22 = *(_QWORD *)(a1 + 32);
  v23 = *(void **)(v22 + 120);
  *(_QWORD *)(v22 + 120) = 0;

  v24 = *(_QWORD *)(a1 + 32);
  v25 = *(void **)(v24 + 128);
  *(_QWORD *)(v24 + 128) = 0;

  v26 = *(_QWORD *)(a1 + 32);
  v27 = *(void **)(v26 + 136);
  *(_QWORD *)(v26 + 136) = 0;

  v28 = *(_QWORD *)(a1 + 32);
  v29 = *(void **)(v28 + 144);
  *(_QWORD *)(v28 + 144) = 0;

  v30 = *(_QWORD *)(a1 + 32);
  v31 = *(void **)(v30 + 152);
  *(_QWORD *)(v30 + 152) = 0;

  v32 = *(_QWORD *)(a1 + 32);
  v33 = *(void **)(v32 + 160);
  *(_QWORD *)(v32 + 160) = 0;

  v34 = *(_QWORD *)(a1 + 32);
  v35 = *(void **)(v34 + 168);
  *(_QWORD *)(v34 + 168) = 0;

  v36 = *(_QWORD *)(a1 + 32);
  v37 = *(void **)(v36 + 176);
  *(_QWORD *)(v36 + 176) = 0;

  v38 = *(_QWORD *)(a1 + 32);
  v39 = *(void **)(v38 + 184);
  *(_QWORD *)(v38 + 184) = 0;

}

void __39__PLAssetsdClient_privacySupportClient__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 184));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setupClientClass:proxyGetter:options:", objc_opt_class(), sel_getPrivacySupportServiceWithReply_, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 184);
    *(_QWORD *)(v3 + 184) = v2;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
  }
}

void __30__PLAssetsdClient_debugClient__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 176));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setupClientClass:proxyGetter:options:", objc_opt_class(), sel_getDebugServiceWithReply_, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 176);
    *(_QWORD *)(v3 + 176) = v2;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
  }
}

void __29__PLAssetsdClient_demoClient__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 160));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setupClientClass:proxyGetter:options:", objc_opt_class(), sel_getDemoServiceWithReply_, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 160);
    *(_QWORD *)(v3 + 160) = v2;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
  }
}

void __37__PLAssetsdClient_notificationClient__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 152));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setupClientClass:proxyGetter:options:", objc_opt_class(), sel_getNotificationServiceWithReply_, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 152);
    *(_QWORD *)(v3 + 152) = v2;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
  }
}

void __29__PLAssetsdClient_syncClient__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 144));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setupClientClass:proxyGetter:options:", objc_opt_class(), sel_getSyncServiceWithReply_, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 144);
    *(_QWORD *)(v3 + 144) = v2;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
  }
}

void __34__PLAssetsdClient_migrationClient__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 136));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setupClientClass:proxyGetter:options:", objc_opt_class(), sel_getMigrationServiceWithReply_, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 136);
    *(_QWORD *)(v3 + 136) = v2;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
  }
}

void __38__PLAssetsdClient_cloudInternalClient__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 128));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setupClientClass:proxyGetter:options:", objc_opt_class(), sel_getCloudInternalServiceWithReply_, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 128);
    *(_QWORD *)(v3 + 128) = v2;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
  }
}

void __30__PLAssetsdClient_cloudClient__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 120));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setupClientClass:proxyGetter:options:", objc_opt_class(), sel_getCloudServiceWithReply_, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 120);
    *(_QWORD *)(v3 + 120) = v2;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
  }
}

void __42__PLAssetsdClient_resourceWriteOnlyClient__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 104));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setupClientClass:proxyGetter:options:", objc_opt_class(), sel_getResourceWriteOnlyServiceWithReply_, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 104);
    *(_QWORD *)(v3 + 104) = v2;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
  }
}

void __33__PLAssetsdClient_resourceClient__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 96));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setupClientClass:proxyGetter:options:", objc_opt_class(), sel_getResourceServiceWithReply_, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 96);
    *(_QWORD *)(v3 + 96) = v2;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
  }
}

void __36__PLAssetsdClient_photoKitAddClient__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 88));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setupClientClass:proxyGetter:options:", objc_opt_class(), sel_getPhotoKitAddServiceWithReply_, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 88);
    *(_QWORD *)(v3 + 88) = v2;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
  }
}

void __45__PLAssetsdClient_resourceAvailabilityClient__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 80));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setupClientClass:proxyGetter:options:", objc_opt_class(), sel_getResourceAvailabilityServiceWithReply_, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 80);
    *(_QWORD *)(v3 + 80) = v2;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
  }
}

void __33__PLAssetsdClient_photoKitClient__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 72));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setupClientClass:proxyGetter:options:", objc_opt_class(), sel_getPhotoKitServiceWithReply_, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 72);
    *(_QWORD *)(v3 + 72) = v2;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
  }
}

void __42__PLAssetsdClient_libraryManagementClient__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setupClientClass:proxyGetter:options:", objc_opt_class(), sel_getLibraryManagementServiceWithReply_, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 64);
    *(_QWORD *)(v3 + 64) = v2;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
  }
}

void __49__PLAssetsdClient_systemLibraryURLReadOnlyClient__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setupClientClass:proxyGetter:options:", objc_opt_class(), sel_getSystemLibraryURLReadOnlyServiceWithReply_, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 56);
    *(_QWORD *)(v3 + 56) = v2;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
  }
}

void __40__PLAssetsdClient_libraryInternalClient__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setupClientClass:proxyGetter:options:", objc_opt_class(), sel_getLibraryInternalServiceWithReply_, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 48);
    *(_QWORD *)(v3 + 48) = v2;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
  }
}

void __51__PLAssetsdClient_sharedSystemLibraryAssetsdClient__block_invoke_2()
{
  void *v0;

  v0 = (void *)sharedSystemLibraryAssetsdClient_sharedAssetsdClient;
  sharedSystemLibraryAssetsdClient_sharedAssetsdClient = 0;

}

@end
