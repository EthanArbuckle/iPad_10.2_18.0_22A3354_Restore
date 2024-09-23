@implementation ICInAppMessageManager

uint64_t __71__ICInAppMessageManager_getPropertyForKey_bundleIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __71__ICInAppMessageManager_getPropertyForKey_bundleIdentifier_completion___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __71__ICInAppMessageManager_messageEntriesForBundleIdentifiers_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (ICInAppMessageManager)sharedManager
{
  if (sharedManager_sOnceToken != -1)
    dispatch_once(&sharedManager_sOnceToken, &__block_literal_global_2467);
  return (ICInAppMessageManager *)(id)sharedManager_sSharedManager;
}

- (ICInAppMessageManager)initWithMessageStore:(id)a3 identityStore:(id)a4
{
  id v7;
  id v8;
  ICInAppMessageManager *v9;
  ICInAppMessageManager *v10;
  NSOperationQueue *v11;
  NSOperationQueue *operationQueue;
  NSOperationQueue *v13;
  NSOperationQueue *downloadOperationQueue;
  dispatch_queue_t v15;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v17;
  OS_dispatch_queue *callbackQueue;
  void *v19;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)ICInAppMessageManager;
  v9 = -[ICInAppMessageManager init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messageStore, a3);
    objc_storeStrong((id *)&v10->_identityStore, a4);
    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v10->_operationQueue;
    v10->_operationQueue = v11;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v10->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](v10->_operationQueue, "setName:", CFSTR("com.apple.iTunesCloud.ICInAppMessageManager.operationQueue"));
    -[NSOperationQueue setQualityOfService:](v10->_operationQueue, "setQualityOfService:", 25);
    v13 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    downloadOperationQueue = v10->_downloadOperationQueue;
    v10->_downloadOperationQueue = v13;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v10->_downloadOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](v10->_downloadOperationQueue, "setName:", CFSTR("com.apple.iTunesCloud.ICInAppMessageManager.downloadOperationQueue"));
    -[NSOperationQueue setQualityOfService:](v10->_downloadOperationQueue, "setQualityOfService:", 17);
    v15 = dispatch_queue_create("com.apple.iTunesCloud.ICInAppMessageManager.accessQueue", 0);
    accessQueue = v10->_accessQueue;
    v10->_accessQueue = (OS_dispatch_queue *)v15;

    v17 = dispatch_queue_create("com.apple.iTunesCloud.ICInAppMessageManager.accessQueue", MEMORY[0x1E0C80D50]);
    callbackQueue = v10->_callbackQueue;
    v10->_callbackQueue = (OS_dispatch_queue *)v17;

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v10, sel__handleICInAppMessagesDidChangeDistributedNotification_, CFSTR("com.apple.itunescloud.ICInAppMessagesDidChangeDistributedNotification"), 0);

  }
  return v10;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id location;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  ICInAppMessageManager *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "auditToken", v17);
  }
  else
  {
    v28 = 0u;
    v27 = 0u;
  }
  MSVBundleIDForAuditToken();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v30 = self;
    v31 = 2114;
    v32 = v8;
    v33 = 2114;
    v34 = v7;
    _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Receiving New incoming connection from %{public}@: %{public}@", buf, 0x20u);
  }

  objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.itunescloud.in-app-message-service"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if ((v11 & 1) != 0)
  {
    -[ICInAppMessageManager _performSyncRetryIfPending:](self, "_performSyncRetryIfPending:", 0);
    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v7);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5A9DD0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v12);
    objc_msgSend(v7, "setExportedObject:", self);
    v13 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __60__ICInAppMessageManager_listener_shouldAcceptNewConnection___block_invoke;
    v22[3] = &unk_1E438A208;
    objc_copyWeak(&v24, (id *)buf);
    objc_copyWeak(&v25, &location);
    v14 = v8;
    v23 = v14;
    objc_msgSend(v7, "setInterruptionHandler:", v22);
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __60__ICInAppMessageManager_listener_shouldAcceptNewConnection___block_invoke_375;
    v18[3] = &unk_1E438A208;
    objc_copyWeak(&v20, (id *)buf);
    objc_copyWeak(&v21, &location);
    v19 = v14;
    objc_msgSend(v7, "setInvalidationHandler:", v18);
    -[ICInAppMessageManager _addConnection:](self, "_addConnection:", v7);
    objc_msgSend(v7, "resume");

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v24);

    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v30 = self;
      v31 = 2114;
      v32 = v8;
      _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Client process %{public}@ does not have required entitlements - rejecting connection", buf, 0x16u);
    }

  }
  return v11;
}

- (void)_addConnection:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ICInAppMessageManager__addConnection___block_invoke;
  block[3] = &unk_1E4391110;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

- (void)messageEntriesForBundleIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  ICInAppMessageStore *messageStore;
  id *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  ICInAppMessageManager *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v27 = self;
    v28 = 2114;
    v29 = v6;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ fetching messages for bundle identifiers %{public}@", buf, 0x16u);
  }

  if (self->_isSystemService)
  {
    messageStore = self->_messageStore;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __71__ICInAppMessageManager_messageEntriesForBundleIdentifiers_completion___block_invoke_4;
    v19[3] = &unk_1E438FEF0;
    v19[4] = self;
    v10 = &v20;
    v11 = v6;
    v20 = v11;
    v21 = v7;
    v12 = v7;
    -[ICInAppMessageStore getAllMessageEntriesForBundleIdentifiers:completion:](messageStore, "getAllMessageEntriesForBundleIdentifiers:completion:", v11, v19);
    v13 = v21;
  }
  else
  {
    -[ICInAppMessageManager _xpcClientConnection](self, "_xpcClientConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __71__ICInAppMessageManager_messageEntriesForBundleIdentifiers_completion___block_invoke;
    v24[3] = &unk_1E43915E8;
    v24[4] = self;
    v10 = &v25;
    v16 = v7;
    v25 = v16;
    objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __71__ICInAppMessageManager_messageEntriesForBundleIdentifiers_completion___block_invoke_2;
    v22[3] = &unk_1E438FF68;
    v22[4] = self;
    v23 = v16;
    v18 = v16;
    objc_msgSend(v17, "messageEntriesForBundleIdentifiers:completion:", v6, v22);

    v13 = v23;
  }

}

- (void)getPropertyForKey:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  ICInAppMessageStore *messageStore;
  id *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;

  v8 = a5;
  v9 = v8;
  if (self->_isSystemService)
  {
    messageStore = self->_messageStore;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __71__ICInAppMessageManager_getPropertyForKey_bundleIdentifier_completion___block_invoke_4;
    v20[3] = &unk_1E4389E58;
    v20[4] = self;
    v11 = &v21;
    v21 = v8;
    v12 = a4;
    v13 = a3;
    -[ICInAppMessageStore getStorePropertyForKey:bundleIdentifier:completion:](messageStore, "getStorePropertyForKey:bundleIdentifier:completion:", v13, v12, v20);

  }
  else
  {
    v14 = a4;
    v15 = a3;
    -[ICInAppMessageManager _xpcClientConnection](self, "_xpcClientConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __71__ICInAppMessageManager_getPropertyForKey_bundleIdentifier_completion___block_invoke;
    v24[3] = &unk_1E43915E8;
    v24[4] = self;
    v11 = &v25;
    v18 = v9;
    v25 = v18;
    objc_msgSend(v16, "remoteObjectProxyWithErrorHandler:", v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v17;
    v22[1] = 3221225472;
    v22[2] = __71__ICInAppMessageManager_getPropertyForKey_bundleIdentifier_completion___block_invoke_2;
    v22[3] = &unk_1E4389E58;
    v22[4] = self;
    v23 = v18;
    objc_msgSend(v19, "getPropertyForKey:bundleIdentifier:completion:", v15, v14, v22);

  }
}

- (id)_xpcClientConnection
{
  NSXPCConnection *xpcClientConnection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSXPCConnection *v18;
  _QWORD v20[5];

  xpcClientConnection = self->_xpcClientConnection;
  if (!xpcClientConnection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.itunescloud.in-app-message-service"), 0);
    v5 = self->_xpcClientConnection;
    self->_xpcClientConnection = v4;

    -[NSXPCConnection setExportedObject:](self->_xpcClientConnection, "setExportedObject:", self);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5A9DD0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_allMessageEntriesWithCompletion_, 0, 1);

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_messageEntriesForBundleIdentifiers_completion_, 0, 1);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_addMessageEntry_completion_, 0, 0);

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_getAllMetadataForBundleIdentifiers_completion_, 0, 1);

    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcClientConnection, "setRemoteObjectInterface:", v6);
    -[NSXPCConnection setInterruptionHandler:](self->_xpcClientConnection, "setInterruptionHandler:", &__block_literal_global_297);
    v18 = self->_xpcClientConnection;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __45__ICInAppMessageManager__xpcClientConnection__block_invoke_298;
    v20[3] = &unk_1E43913D8;
    v20[4] = self;
    -[NSXPCConnection setInvalidationHandler:](v18, "setInvalidationHandler:", v20);
    -[NSXPCConnection resume](self->_xpcClientConnection, "resume");

    xpcClientConnection = self->_xpcClientConnection;
  }
  return xpcClientConnection;
}

- (void)_performSyncRetryIfPending:(BOOL)a3
{
  ICAsyncBlockOperation *v5;
  ICAsyncBlockOperation *v6;
  _QWORD v7[5];
  BOOL v8;

  v5 = [ICAsyncBlockOperation alloc];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__ICInAppMessageManager__performSyncRetryIfPending___block_invoke;
  v7[3] = &unk_1E438A078;
  v7[4] = self;
  v8 = a3;
  v6 = -[ICAsyncBlockOperation initWithStartHandler:](v5, "initWithStartHandler:", v7);
  -[ICAsyncBlockOperation setName:](v6, "setName:", CFSTR("com.apple.iTunesCloud.ICInAppMessageManager.performSyncRetryIfPending"));
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v6);

}

void __71__ICInAppMessageManager_getPropertyForKey_bundleIdentifier_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__ICInAppMessageManager_getPropertyForKey_bundleIdentifier_completion___block_invoke_5;
  block[3] = &unk_1E4390E58;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

void __71__ICInAppMessageManager_getPropertyForKey_bundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__ICInAppMessageManager_getPropertyForKey_bundleIdentifier_completion___block_invoke_3;
  block[3] = &unk_1E4390E58;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

void __71__ICInAppMessageManager_messageEntriesForBundleIdentifiers_completion___block_invoke_4(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[4];
      v9 = a1[5];
      v10 = 138543874;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      v14 = 2114;
      v15 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to load messages for bundle identifiers %{public}@. err=%{public}@", (uint8_t *)&v10, 0x20u);
    }

  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __71__ICInAppMessageManager_messageEntriesForBundleIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__ICInAppMessageManager_messageEntriesForBundleIdentifiers_completion___block_invoke_3;
  block[3] = &unk_1E4390E58;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

void __38__ICInAppMessageManager_sharedManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ICInAppMessageManager _init]([ICInAppMessageManager alloc], "_init");
  v1 = (void *)sharedManager_sSharedManager;
  sharedManager_sSharedManager = (uint64_t)v0;

}

void __52__ICInAppMessageManager__performSyncRetryIfPending___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  char v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__ICInAppMessageManager__performSyncRetryIfPending___block_invoke_2;
  v7[3] = &unk_1E438A050;
  v9 = *(_BYTE *)(a1 + 40);
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "allStorePropertiesWithCompletion:", v7);

}

uint64_t __40__ICInAppMessageManager__addConnection___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  if (!v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 96);
    *(_QWORD *)(v4 + 96) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

- (id)_init
{
  ICInAppMessageStore *v3;
  void *v4;
  ICInAppMessageManager *v5;

  v3 = objc_alloc_init(ICInAppMessageStore);
  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ICInAppMessageManager initWithMessageStore:identityStore:](self, "initWithMessageStore:identityStore:", v3, v4);

  return v5;
}

void __52__ICInAppMessageManager__performSyncRetryIfPending___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  double v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("syncPending"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("lastSyncAttempt"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "longLongValue");
  if (v5
    && (*(_BYTE *)(a1 + 48)
     || !v7
     || (objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate"), v8 - (double)v7 > 3600.0)))
  {
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v15 = v10;
      _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Had pending sync - retrying now", buf, 0xCu);
    }

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __52__ICInAppMessageManager__performSyncRetryIfPending___block_invoke_338;
    v12[3] = &unk_1E43902A0;
    v11 = *(void **)(a1 + 32);
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v11, "_performSyncWithCompletion:", v12);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", 0);
  }
}

- (void)startSystemService
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSXPCListener *v6;
  NSXPCListener *xpcServiceListener;
  uint64_t v8;
  ICInAppMessageStore *messageStore;
  void *v10;
  void *v11;
  NSCopying *v12;
  NSCopying *musicPrivacyObserverToken;
  void *v14;
  char v15;
  void *v16;
  NSCopying *v17;
  NSCopying *fitnessPrivacyObserverToken;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  uint8_t buf[4];
  ICInAppMessageManager *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v23 = self;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting system service...", buf, 0xCu);
  }

  self->_isSystemService = 1;
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isWatch") & 1) == 0
    && (objc_msgSend(v4, "isAudioAccessory") & 1) == 0
    && (objc_msgSend(v4, "isROSDevice") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handleUserIdentityStoreDidChangeNotification_, CFSTR("ICUserIdentityStoreDidChangeNotification"), self->_identityStore);

    v6 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.itunescloud.in-app-message-service"));
    xpcServiceListener = self->_xpcServiceListener;
    self->_xpcServiceListener = v6;

    -[NSXPCListener setDelegate:](self->_xpcServiceListener, "setDelegate:", self);
    -[NSXPCListener resume](self->_xpcServiceListener, "resume");
    -[ICInAppMessageManager _schedulePeriodicUpdate](self, "_schedulePeriodicUpdate");
    -[ICInAppMessageManager _handleUserIdentityStoreDidChangeNotification:](self, "_handleUserIdentityStoreDidChangeNotification:", 0);
    v8 = MEMORY[0x1E0C809B0];
    messageStore = self->_messageStore;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __43__ICInAppMessageManager_startSystemService__block_invoke;
    v21[3] = &unk_1E4389CF8;
    v21[4] = self;
    -[ICInAppMessageStore getStorePropertyForKey:completion:](messageStore, "getStorePropertyForKey:completion:", CFSTR("lastSyncedOSVersion"), v21);
    +[ICEnvironmentMonitor sharedMonitor](ICEnvironmentMonitor, "sharedMonitor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerObserver:", self);

    +[ICPrivacyInfo sharedPrivacyInfo](ICPrivacyInfo, "sharedPrivacyInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __43__ICInAppMessageManager_startSystemService__block_invoke_3;
    v20[3] = &unk_1E4389D20;
    v20[4] = self;
    objc_msgSend(v11, "beginObservingPrivacyAcknowledgementForIdentifier:handler:", CFSTR("Music"), v20);
    v12 = (NSCopying *)objc_claimAutoreleasedReturnValue();
    musicPrivacyObserverToken = self->_musicPrivacyObserverToken;
    self->_musicPrivacyObserverToken = v12;

    +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isMac");

    if ((v15 & 1) == 0)
    {
      +[ICPrivacyInfo sharedPrivacyInfo](ICPrivacyInfo, "sharedPrivacyInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v8;
      v19[1] = 3221225472;
      v19[2] = __43__ICInAppMessageManager_startSystemService__block_invoke_4;
      v19[3] = &unk_1E4389D20;
      v19[4] = self;
      objc_msgSend(v16, "beginObservingPrivacyAcknowledgementForIdentifier:handler:", CFSTR("FitnessPlus"), v19);
      v17 = (NSCopying *)objc_claimAutoreleasedReturnValue();
      fitnessPrivacyObserverToken = self->_fitnessPrivacyObserverToken;
      self->_fitnessPrivacyObserverToken = v17;

    }
  }

}

- (void)stopSystemService
{
  NSObject *v3;
  void *v4;
  NSCopying *musicPrivacyObserverToken;
  void *v6;
  NSCopying *fitnessPrivacyObserverToken;
  void *v8;
  int v9;
  ICInAppMessageManager *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = self;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping system service...", (uint8_t *)&v9, 0xCu);
  }

  self->_isSystemService = 0;
  if (self->_musicPrivacyObserverToken)
  {
    +[ICPrivacyInfo sharedPrivacyInfo](ICPrivacyInfo, "sharedPrivacyInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endObservingPrivacyAcknowledgementForIdentifier:withToken:", CFSTR("Music"), self->_musicPrivacyObserverToken);

    musicPrivacyObserverToken = self->_musicPrivacyObserverToken;
    self->_musicPrivacyObserverToken = 0;

  }
  if (self->_fitnessPrivacyObserverToken)
  {
    +[ICPrivacyInfo sharedPrivacyInfo](ICPrivacyInfo, "sharedPrivacyInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endObservingPrivacyAcknowledgementForIdentifier:withToken:", CFSTR("FitnessPlus"), self->_fitnessPrivacyObserverToken);

    fitnessPrivacyObserverToken = self->_fitnessPrivacyObserverToken;
    self->_fitnessPrivacyObserverToken = 0;

  }
  +[ICEnvironmentMonitor sharedMonitor](ICEnvironmentMonitor, "sharedMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unregisterObserver:", self);

  -[NSXPCListener invalidate](self->_xpcServiceListener, "invalidate");
}

- (void)allMessageEntriesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  ICInAppMessageStore *messageStore;
  id *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  ICInAppMessageManager *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = self;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ fetching all messages", buf, 0xCu);
  }

  if (self->_isSystemService)
  {
    messageStore = self->_messageStore;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __57__ICInAppMessageManager_allMessageEntriesWithCompletion___block_invoke_4;
    v14[3] = &unk_1E438FF68;
    v7 = &v15;
    v14[4] = self;
    v15 = v4;
    v8 = v4;
    -[ICInAppMessageStore getAllMessageEntriesWithCompletion:](messageStore, "getAllMessageEntriesWithCompletion:", v14);
  }
  else
  {
    -[ICInAppMessageManager _xpcClientConnection](self, "_xpcClientConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __57__ICInAppMessageManager_allMessageEntriesWithCompletion___block_invoke;
    v18[3] = &unk_1E43915E8;
    v18[4] = self;
    v7 = &v19;
    v11 = v4;
    v19 = v11;
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __57__ICInAppMessageManager_allMessageEntriesWithCompletion___block_invoke_2;
    v16[3] = &unk_1E438FF68;
    v16[4] = self;
    v17 = v11;
    v13 = v11;
    objc_msgSend(v12, "allMessageEntriesWithCompletion:", v16);

  }
}

- (void)messageEntriesForBundleIdentifier:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  objc_msgSend(v6, "setWithObject:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ICInAppMessageManager messageEntriesForBundleIdentifiers:completion:](self, "messageEntriesForBundleIdentifiers:completion:", v8, v7);

}

- (void)messageEntryWithIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  ICInAppMessageStore *messageStore;
  id *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  uint8_t buf[4];
  ICInAppMessageManager *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v32 = self;
    v33 = 2114;
    v34 = v8;
    v35 = 2114;
    v36 = v9;
    _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ fetching message with identifier %{public}@ for bundle identifier %{public}@", buf, 0x20u);
  }

  if (self->_isSystemService)
  {
    messageStore = self->_messageStore;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __80__ICInAppMessageManager_messageEntryWithIdentifier_bundleIdentifier_completion___block_invoke_4;
    v23[3] = &unk_1E4389D70;
    v23[4] = self;
    v13 = &v24;
    v14 = v8;
    v24 = v14;
    v15 = v9;
    v25 = v15;
    v26 = v10;
    v16 = v10;
    -[ICInAppMessageStore getMessageEntryWithIdentifier:bundleIdentifier:completion:](messageStore, "getMessageEntryWithIdentifier:bundleIdentifier:completion:", v14, v15, v23);

    v17 = v25;
  }
  else
  {
    -[ICInAppMessageManager _xpcClientConnection](self, "_xpcClientConnection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __80__ICInAppMessageManager_messageEntryWithIdentifier_bundleIdentifier_completion___block_invoke;
    v29[3] = &unk_1E43915E8;
    v29[4] = self;
    v13 = &v30;
    v20 = v10;
    v30 = v20;
    objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:", v29);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v19;
    v27[1] = 3221225472;
    v27[2] = __80__ICInAppMessageManager_messageEntryWithIdentifier_bundleIdentifier_completion___block_invoke_2;
    v27[3] = &unk_1E4389D48;
    v27[4] = self;
    v28 = v20;
    v22 = v20;
    objc_msgSend(v21, "messageEntryWithIdentifier:bundleIdentifier:completion:", v8, v9, v27);

    v17 = v28;
  }

}

- (void)addMessageEntry:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  ICAsyncBlockOperation *v9;
  id *v10;
  id v11;
  ICAsyncBlockOperation *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  ICInAppMessageManager *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v27 = self;
    v28 = 2114;
    v29 = v6;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ adding message: %{public}@", buf, 0x16u);
  }

  if (self->_isSystemService)
  {
    v9 = [ICAsyncBlockOperation alloc];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __52__ICInAppMessageManager_addMessageEntry_completion___block_invoke_4;
    v19[3] = &unk_1E438FB60;
    v19[4] = self;
    v10 = &v20;
    v20 = v6;
    v21 = v7;
    v11 = v7;
    v12 = -[ICAsyncBlockOperation initWithStartHandler:](v9, "initWithStartHandler:", v19);
    -[ICAsyncBlockOperation setName:](v12, "setName:", CFSTR("com.apple.iTunesCloud.ICInAppMessageManager.addMessage"));
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v12);

    v13 = v21;
  }
  else
  {
    -[ICInAppMessageManager _xpcClientConnection](self, "_xpcClientConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __52__ICInAppMessageManager_addMessageEntry_completion___block_invoke;
    v24[3] = &unk_1E43915E8;
    v24[4] = self;
    v10 = &v25;
    v16 = v7;
    v25 = v16;
    objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __52__ICInAppMessageManager_addMessageEntry_completion___block_invoke_2;
    v22[3] = &unk_1E43915E8;
    v22[4] = self;
    v23 = v16;
    v18 = v16;
    objc_msgSend(v17, "addMessageEntry:completion:", v6, v22);

    v13 = v23;
  }

}

- (void)updateMessageEntry:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  ICAsyncBlockOperation *v9;
  id *v10;
  id v11;
  ICAsyncBlockOperation *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  ICInAppMessageManager *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v27 = self;
    v28 = 2114;
    v29 = v6;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ updating message %{public}@", buf, 0x16u);
  }

  if (self->_isSystemService)
  {
    v9 = [ICAsyncBlockOperation alloc];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __55__ICInAppMessageManager_updateMessageEntry_completion___block_invoke_4;
    v19[3] = &unk_1E438FB60;
    v19[4] = self;
    v10 = &v20;
    v20 = v6;
    v21 = v7;
    v11 = v7;
    v12 = -[ICAsyncBlockOperation initWithStartHandler:](v9, "initWithStartHandler:", v19);
    -[ICAsyncBlockOperation setName:](v12, "setName:", CFSTR("com.apple.iTunesCloud.ICInAppMessageManager.updateMessage"));
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v12);

    v13 = v21;
  }
  else
  {
    -[ICInAppMessageManager _xpcClientConnection](self, "_xpcClientConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __55__ICInAppMessageManager_updateMessageEntry_completion___block_invoke;
    v24[3] = &unk_1E43915E8;
    v24[4] = self;
    v10 = &v25;
    v16 = v7;
    v25 = v16;
    objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __55__ICInAppMessageManager_updateMessageEntry_completion___block_invoke_2;
    v22[3] = &unk_1E43915E8;
    v22[4] = self;
    v23 = v16;
    v18 = v16;
    objc_msgSend(v17, "updateMessageEntry:completion:", v6, v22);

    v13 = v23;
  }

}

- (void)removeMessageEntryWithIdentifier:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  ICAsyncBlockOperation *v12;
  id *v13;
  id v14;
  ICAsyncBlockOperation *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  ICInAppMessageManager *v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;
  uint8_t buf[4];
  ICInAppMessageManager *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v35 = self;
    v36 = 2114;
    v37 = v8;
    v38 = 2114;
    v39 = v9;
    _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ removing message %{public}@ for bundle identifier %{public}@", buf, 0x20u);
  }

  if (self->_isSystemService)
  {
    v12 = [ICAsyncBlockOperation alloc];
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __89__ICInAppMessageManager_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_4;
    v25 = &unk_1E438FB38;
    v26 = self;
    v13 = &v27;
    v27 = v8;
    v28 = v9;
    v29 = v10;
    v14 = v10;
    v15 = -[ICAsyncBlockOperation initWithStartHandler:](v12, "initWithStartHandler:", &v22);
    -[ICAsyncBlockOperation setName:](v15, "setName:", CFSTR("com.apple.iTunesCloud.ICInAppMessageManager.removeMessageWithIdentifier"), v22, v23, v24, v25, v26);
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v15);

    v16 = v28;
  }
  else
  {
    -[ICInAppMessageManager _xpcClientConnection](self, "_xpcClientConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __89__ICInAppMessageManager_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke;
    v32[3] = &unk_1E43915E8;
    v32[4] = self;
    v13 = &v33;
    v19 = v10;
    v33 = v19;
    objc_msgSend(v17, "remoteObjectProxyWithErrorHandler:", v32);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v18;
    v30[1] = 3221225472;
    v30[2] = __89__ICInAppMessageManager_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_2;
    v30[3] = &unk_1E43915E8;
    v30[4] = self;
    v31 = v19;
    v21 = v19;
    objc_msgSend(v20, "removeMessageEntryWithIdentifier:forBundleIdentifier:completion:", v8, v9, v30);

    v16 = v31;
  }

}

- (void)removeAllMessageEntriesForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  ICAsyncBlockOperation *v9;
  id *v10;
  id v11;
  ICAsyncBlockOperation *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  ICInAppMessageManager *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v27 = self;
    v28 = 2114;
    v29 = v6;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ removing all messages for bundle identifier %{public}@", buf, 0x16u);
  }

  if (self->_isSystemService)
  {
    v9 = [ICAsyncBlockOperation alloc];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __79__ICInAppMessageManager_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_4;
    v19[3] = &unk_1E438FB60;
    v19[4] = self;
    v10 = &v20;
    v20 = v6;
    v21 = v7;
    v11 = v7;
    v12 = -[ICAsyncBlockOperation initWithStartHandler:](v9, "initWithStartHandler:", v19);
    -[ICAsyncBlockOperation setName:](v12, "setName:", CFSTR("com.apple.iTunesCloud.ICInAppMessageManager.removeAllMessagesForBundleIdentifier"));
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v12);

    v13 = v21;
  }
  else
  {
    -[ICInAppMessageManager _xpcClientConnection](self, "_xpcClientConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __79__ICInAppMessageManager_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke;
    v24[3] = &unk_1E43915E8;
    v24[4] = self;
    v10 = &v25;
    v16 = v7;
    v25 = v16;
    objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __79__ICInAppMessageManager_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_2;
    v22[3] = &unk_1E43915E8;
    v22[4] = self;
    v23 = v16;
    v18 = v16;
    objc_msgSend(v17, "removeAllMessageEntriesForBundleIdentifier:completion:", v6, v22);

    v13 = v23;
  }

}

- (void)addMessageEntryFromAMSDialogRequest:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  ICIAMApplicationMessage *v17;
  void *v18;
  void *v19;
  ICIAMMessageContent *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  ICIAMLocalNotification *v42;
  void *v43;
  id v44;
  uint64_t v45;
  NSObject *v46;
  ICInAppMessageManager *v47;
  ICInAppMessageEntry *v48;
  ICInAppMessageManager *v49;
  id v50;
  ICIAMApplicationMessage *v51;
  id v52;
  ICInAppMessageManager *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  ICIAMMessageContent *v58;
  void *v59;
  __CFString *v60;
  ICInAppMessageManager *v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  _QWORD v66[4];
  ICInAppMessageManager *v67;
  ICIAMApplicationMessage *v68;
  id v69;
  id v70;
  id v71;
  const __CFString *v72;
  const __CFString *v73;
  _QWORD v74[10];
  _QWORD v75[10];
  const __CFString *v76;
  const __CFString *v77;
  _QWORD v78[10];
  _QWORD v79[10];
  _QWORD v80[3];
  _QWORD v81[3];
  _QWORD v82[3];
  _QWORD v83[3];
  uint8_t buf[4];
  ICInAppMessageManager *v85;
  __int16 v86;
  id v87;
  __int16 v88;
  id v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v63 = a5;
  v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v85 = self;
    v86 = 2114;
    v87 = v9;
    v88 = 2114;
    v89 = v8;
    _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Adding message for bundle identifier '%{public}@' from dialog request %{public}@", buf, 0x20u);
  }

  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v61 = self;
  if (v11)
  {
    v65 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v65 = (id)objc_claimAutoreleasedReturnValue();

  }
  v59 = v9;

  objc_msgSend(v8, "defaultAction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "deepLink");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = v15;
  if (v15)
  {
    objc_msgSend(v15, "absoluteString");
    v16 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = CFSTR("music://itunes.apple.com");
  }
  v17 = objc_alloc_init(ICIAMApplicationMessage);
  -[ICIAMApplicationMessage setIdentifier:](v17, "setIdentifier:", v65);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSince1970");
  -[ICIAMApplicationMessage setStartDate:](v17, "setStartDate:");

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1209600.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSince1970");
  -[ICIAMApplicationMessage setEndDate:](v17, "setEndDate:");

  -[ICIAMApplicationMessage setAssetPrefetchStrategy:](v17, "setAssetPrefetchStrategy:", 1);
  -[ICIAMApplicationMessage setHasCloseButton:](v17, "setHasCloseButton:", 1);
  -[ICIAMApplicationMessage setMaximumDisplays:](v17, "setMaximumDisplays:", 1);
  -[ICIAMApplicationMessage setMessageType:](v17, "setMessageType:", 2);
  v20 = objc_alloc_init(ICIAMMessageContent);
  -[ICIAMMessageContent setIdentifier:](v20, "setIdentifier:", CFSTR("content-identifier"));
  objc_msgSend(v8, "title");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICIAMMessageContent setTitle:](v20, "setTitle:", v21);

  objc_msgSend(v8, "message");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICIAMMessageContent setSubtitle:](v20, "setSubtitle:", v22);

  v58 = v20;
  -[ICIAMApplicationMessage addContentPages:](v17, "addContentPages:", v20);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = CFSTR("title");
  objc_msgSend(v8, "title");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v24;
  v82[1] = CFSTR("body");
  v64 = v8;
  objc_msgSend(v8, "message");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v82[2] = CFSTR("level");
  v83[1] = v25;
  v83[2] = &unk_1E43E6520;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 3);
  v26 = objc_claimAutoreleasedReturnValue();

  v57 = (void *)v26;
  objc_msgSend(v23, "setObject:forKey:", v26, CFSTR("alert"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = CFSTR("_tp");
  v80[1] = CFSTR("_url");
  v81[0] = &unk_1E43E6538;
  v81[1] = v16;
  v80[2] = CFSTR("_mt");
  v78[0] = CFSTR("actionType");
  v78[1] = CFSTR("actionUrl");
  v79[0] = CFSTR("tap");
  v79[1] = v16;
  v60 = (__CFString *)v16;
  v78[2] = CFSTR("eventType");
  v78[3] = CFSTR("eventVersion");
  v79[2] = CFSTR("notificationAction");
  v79[3] = &unk_1E43E6538;
  v78[4] = CFSTR("notificationId");
  v78[5] = CFSTR("targetType");
  v79[4] = v65;
  v79[5] = CFSTR("notification");
  v78[6] = CFSTR("topic");
  v78[7] = CFSTR("app");
  v79[6] = CFSTR("xp_amp_notifications");
  v79[7] = v59;
  v79[8] = CFSTR("Content");
  v78[8] = CFSTR("notificationType");
  v78[9] = CFSTR("details");
  v76 = CFSTR("notificationSubtype");
  v77 = CFSTR("MusicAlertMessage");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v79[9] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 10);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v81[2] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, v80, 3);
  v30 = objc_claimAutoreleasedReturnValue();

  v55 = (void *)v30;
  objc_msgSend(v27, "addObject:", v30);
  v56 = v27;
  objc_msgSend(v23, "setObject:forKey:", v27, CFSTR("_ba"));
  objc_msgSend(v23, "setObject:forKey:", &unk_1E43E6538, CFSTR("content-available"));
  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "DSIDForUserIdentity:outError:", v32, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = v33;
  if (v33)
  {
    objc_msgSend(v33, "stringValue");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKey:", v34, CFSTR("_ds"));

  }
  else
  {
    objc_msgSend(v23, "setObject:forKey:", CFSTR("0"), CFSTR("_ds"));
  }
  objc_msgSend(v23, "setObject:forKey:", &unk_1E43E6550, CFSTR("_it"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ams_%@"), v65);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKey:", v35, CFSTR("_id"));

  objc_msgSend(v23, "setObject:forKey:", v59, CFSTR("_bid"));
  v74[0] = CFSTR("eventType");
  v74[1] = CFSTR("eventVersion");
  v75[0] = CFSTR("notificationRequest");
  v75[1] = &unk_1E43E6538;
  v74[2] = CFSTR("language");
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "currentLocale");
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v37;
  v39 = &stru_1E4391778;
  if (v37)
    v39 = (const __CFString *)v37;
  v75[2] = v39;
  v75[3] = v65;
  v74[3] = CFSTR("notificationId");
  v74[4] = CFSTR("notificationType");
  v75[4] = CFSTR("Content");
  v75[5] = CFSTR("29");
  v74[5] = CFSTR("platformId");
  v74[6] = CFSTR("platformName");
  v75[6] = CFSTR("P84");
  v75[7] = CFSTR("xp_amp_notifications");
  v74[7] = CFSTR("topic");
  v74[8] = CFSTR("app");
  v75[8] = v59;
  v74[9] = CFSTR("details");
  v72 = CFSTR("notificationSubtype");
  v73 = CFSTR("MusicAlertMessage");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v75[9] = v40;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 10);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setObject:forKey:", v41, CFSTR("_mt"));
  v42 = objc_alloc_init(ICIAMLocalNotification);
  v71 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v23, 0, &v71);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v71;
  if (v43
    && (objc_msgSend(v43, "base64EncodedStringWithOptions:", 0), (v45 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v46 = v45;
    -[ICIAMLocalNotification setNotification:](v42, "setNotification:", v45);
    -[ICIAMApplicationMessage setLocalNotification:](v17, "setLocalNotification:", v42);
    v47 = v61;
  }
  else
  {
    v46 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    v47 = v61;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v85 = v61;
      v86 = 2114;
      v87 = v44;
      _os_log_impl(&dword_1A03E3000, v46, OS_LOG_TYPE_ERROR, "%{public}@ Failed to serialize local notification data. err=%{public}@", buf, 0x16u);
    }
  }

  v48 = -[ICInAppMessageEntry initWithApplicationMessage:bundleIdentifier:]([ICInAppMessageEntry alloc], "initWithApplicationMessage:bundleIdentifier:", v17, v59);
  v49 = v47;
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __89__ICInAppMessageManager_addMessageEntryFromAMSDialogRequest_bundleIdentifier_completion___block_invoke;
  v66[3] = &unk_1E438EF60;
  v67 = v49;
  v68 = v17;
  v69 = v59;
  v70 = v63;
  v50 = v59;
  v51 = v17;
  v52 = v63;
  v53 = v49;
  -[ICInAppMessageManager addMessageEntry:completion:](v53, "addMessageEntry:completion:", v48, v66);

}

- (void)syncMessagesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  ICAsyncBlockOperation *v6;
  id *v7;
  id v8;
  ICAsyncBlockOperation *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  ICInAppMessageManager *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  ICInAppMessageManager *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = self;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing sync", buf, 0xCu);
  }

  if (self->_isSystemService)
  {
    v6 = [ICAsyncBlockOperation alloc];
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __52__ICInAppMessageManager_syncMessagesWithCompletion___block_invoke_4;
    v18 = &unk_1E438EFB0;
    v7 = &v20;
    v19 = self;
    v20 = v4;
    v8 = v4;
    v9 = -[ICAsyncBlockOperation initWithStartHandler:](v6, "initWithStartHandler:", &v15);
    -[ICAsyncBlockOperation setName:](v9, "setName:", CFSTR("com.apple.iTunesCloud.ICInAppMessageManager.syncMessages"), v15, v16, v17, v18, v19);
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v9);

  }
  else
  {
    -[ICInAppMessageManager _xpcClientConnection](self, "_xpcClientConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __52__ICInAppMessageManager_syncMessagesWithCompletion___block_invoke;
    v23[3] = &unk_1E43915E8;
    v23[4] = self;
    v7 = &v24;
    v12 = v4;
    v24 = v12;
    objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __52__ICInAppMessageManager_syncMessagesWithCompletion___block_invoke_2;
    v21[3] = &unk_1E43915E8;
    v21[4] = self;
    v22 = v12;
    v14 = v12;
    objc_msgSend(v13, "syncMessagesWithCompletion:", v21);

  }
}

- (void)resetMessagesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  ICAsyncBlockOperation *v6;
  id *v7;
  id v8;
  ICAsyncBlockOperation *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  ICInAppMessageManager *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  ICInAppMessageManager *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_isSystemService)
  {
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = self;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing reset", buf, 0xCu);
    }

    v6 = [ICAsyncBlockOperation alloc];
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __53__ICInAppMessageManager_resetMessagesWithCompletion___block_invoke_153;
    v18 = &unk_1E438EFB0;
    v7 = &v20;
    v19 = self;
    v20 = v4;
    v8 = v4;
    v9 = -[ICAsyncBlockOperation initWithStartHandler:](v6, "initWithStartHandler:", &v15);
    -[ICAsyncBlockOperation setName:](v9, "setName:", CFSTR("com.apple.iTunesCloud.ICInAppMessageManager.resetMessages"), v15, v16, v17, v18, v19);
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v9);

  }
  else
  {
    -[ICInAppMessageManager _xpcClientConnection](self, "_xpcClientConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __53__ICInAppMessageManager_resetMessagesWithCompletion___block_invoke;
    v23[3] = &unk_1E43915E8;
    v23[4] = self;
    v7 = &v24;
    v12 = v4;
    v24 = v12;
    objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __53__ICInAppMessageManager_resetMessagesWithCompletion___block_invoke_2;
    v21[3] = &unk_1E43915E8;
    v21[4] = self;
    v22 = v12;
    v14 = v12;
    objc_msgSend(v13, "resetMessagesWithCompletion:", v21);

  }
}

- (void)reportEventForMessageIdentifier:(id)a3 withParams:(id)a4 completion:(id)a5
{
  -[ICInAppMessageManager reportEventForMessageIdentifier:withParams:flushImmediately:completion:](self, "reportEventForMessageIdentifier:withParams:flushImmediately:completion:", a3, a4, 1, a5);
}

- (void)reportEventForMessageIdentifier:(id)a3 withParams:(id)a4 flushImmediately:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  ICAsyncBlockOperation *v14;
  id *v15;
  id v16;
  id v17;
  ICAsyncBlockOperation *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  BOOL v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  uint8_t buf[4];
  ICInAppMessageManager *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v7 = a5;
  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v34 = self;
    v35 = 2114;
    v36 = v10;
    v37 = 2114;
    v38 = v11;
    _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Reporting event for message identifier %{public}@: %{public}@", buf, 0x20u);
  }

  if (self->_isSystemService)
  {
    v14 = [ICAsyncBlockOperation alloc];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __96__ICInAppMessageManager_reportEventForMessageIdentifier_withParams_flushImmediately_completion___block_invoke_4;
    v24[3] = &unk_1E4389DE0;
    v24[4] = self;
    v15 = &v25;
    v25 = v10;
    v16 = v11;
    v28 = v7;
    v26 = v16;
    v27 = v12;
    v17 = v12;
    v18 = -[ICAsyncBlockOperation initWithStartHandler:](v14, "initWithStartHandler:", v24);
    -[ICAsyncBlockOperation setName:](v18, "setName:", CFSTR("com.apple.iTunesCloud.ICInAppMessageManager.reportEvents"));
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v18);

    v19 = v26;
  }
  else
  {
    -[ICInAppMessageManager _xpcClientConnection](self, "_xpcClientConnection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __96__ICInAppMessageManager_reportEventForMessageIdentifier_withParams_flushImmediately_completion___block_invoke;
    v31[3] = &unk_1E43915E8;
    v31[4] = self;
    v15 = &v32;
    v21 = v12;
    v32 = v21;
    objc_msgSend(v20, "remoteObjectProxyWithErrorHandler:", v31);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __96__ICInAppMessageManager_reportEventForMessageIdentifier_withParams_flushImmediately_completion___block_invoke_2;
    v29[3] = &unk_1E43915E8;
    v29[4] = self;
    v30 = v21;
    v23 = v21;
    objc_msgSend(v22, "reportEventForMessageIdentifier:withParams:flushImmediately:completion:", v10, v11, v7, v29);

    v19 = v30;
  }

}

- (void)flushEventsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  ICAsyncBlockOperation *v13;
  ICAsyncBlockOperation *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  ICInAppMessageManager *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  ICInAppMessageManager *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = self;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Flushing message events", buf, 0xCu);
  }

  if (!self->_isSystemService)
  {
    -[ICInAppMessageManager _xpcClientConnection](self, "_xpcClientConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke;
    v23[3] = &unk_1E43915E8;
    v23[4] = self;
    v10 = v4;
    v24 = v10;
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_2;
    v21[3] = &unk_1E43915E8;
    v21[4] = self;
    v22 = v10;
    objc_msgSend(v11, "flushEventsWithCompletion:", v21);

    v12 = v24;
LABEL_10:

    goto LABEL_11;
  }
  if (!-[ICInAppMessageManager _privacyAcknowledgementRequired](self, "_privacyAcknowledgementRequired"))
  {
    v13 = [ICAsyncBlockOperation alloc];
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_166;
    v18 = &unk_1E438EFB0;
    v19 = self;
    v20 = v4;
    v14 = -[ICAsyncBlockOperation initWithStartHandler:](v13, "initWithStartHandler:", &v15);
    -[ICAsyncBlockOperation setName:](v14, "setName:", CFSTR("com.apple.iTunesCloud.ICInAppMessageManager.flushEvents"), v15, v16, v17, v18, v19);
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v14);

    v12 = v20;
    goto LABEL_10;
  }
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = self;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Not flushing events because privacy acknowledgement is required", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7007, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v4 + 2))(v4, v7);

LABEL_11:
}

- (void)downloadResourcesForMessageWithIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  ICInAppMessageManager *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v28 = self;
    v29 = 2114;
    v30 = v9;
    v31 = 2114;
    v32 = v8;
    _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ downloading resources for message %{public}@:%{public}@", buf, 0x20u);
  }

  if (self->_isSystemService)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_4;
    v19[3] = &unk_1E438EF60;
    v22 = v10;
    v19[4] = self;
    v20 = v8;
    v21 = v9;
    v12 = v10;
    -[ICInAppMessageManager _updateShouldDownloadResources:onMessageWithIdentifier:bundleIdentifier:completion:](self, "_updateShouldDownloadResources:onMessageWithIdentifier:bundleIdentifier:completion:", 1, v20, v21, v19);

    v13 = v22;
  }
  else
  {
    -[ICInAppMessageManager _xpcClientConnection](self, "_xpcClientConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke;
    v25[3] = &unk_1E43915E8;
    v25[4] = self;
    v16 = v10;
    v26 = v16;
    objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v15;
    v23[1] = 3221225472;
    v23[2] = __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_2;
    v23[3] = &unk_1E43915E8;
    v23[4] = self;
    v24 = v16;
    v18 = v16;
    objc_msgSend(v17, "downloadResourcesForMessageWithIdentifier:bundleIdentifier:completion:", v8, v9, v23);

    v13 = v26;
  }

}

- (void)clearCachedResourcesForMessageWithIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  ICInAppMessageManager *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v26 = self;
    v27 = 2114;
    v28 = v9;
    v29 = 2114;
    v30 = v8;
    _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ clearing cached resources for message %{public}@:%{public}@", buf, 0x20u);
  }

  if (self->_isSystemService)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __98__ICInAppMessageManager_clearCachedResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_4;
    v19[3] = &unk_1E438E500;
    v20 = v10;
    v12 = v10;
    -[ICInAppMessageManager _updateShouldDownloadResources:onMessageWithIdentifier:bundleIdentifier:completion:](self, "_updateShouldDownloadResources:onMessageWithIdentifier:bundleIdentifier:completion:", 0, v8, v9, v19);
    v13 = v20;
  }
  else
  {
    -[ICInAppMessageManager _xpcClientConnection](self, "_xpcClientConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __98__ICInAppMessageManager_clearCachedResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke;
    v23[3] = &unk_1E43915E8;
    v23[4] = self;
    v16 = v10;
    v24 = v16;
    objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = __98__ICInAppMessageManager_clearCachedResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_2;
    v21[3] = &unk_1E43915E8;
    v21[4] = self;
    v22 = v16;
    v18 = v16;
    objc_msgSend(v17, "clearCachedResourcesForMessageWithIdentifier:bundleIdentifier:completion:", v8, v9, v21);

    v13 = v24;
  }

}

- (void)getMetadataForMessageIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  ICInAppMessageStore *messageStore;
  id *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;

  v8 = a5;
  v9 = v8;
  if (self->_isSystemService)
  {
    messageStore = self->_messageStore;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __85__ICInAppMessageManager_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_4;
    v20[3] = &unk_1E4389E08;
    v20[4] = self;
    v11 = &v21;
    v21 = v8;
    v12 = a4;
    v13 = a3;
    -[ICInAppMessageStore getMetadataForMessageIdentifier:bundleIdentifier:completion:](messageStore, "getMetadataForMessageIdentifier:bundleIdentifier:completion:", v13, v12, v20);

  }
  else
  {
    v14 = a4;
    v15 = a3;
    -[ICInAppMessageManager _xpcClientConnection](self, "_xpcClientConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __85__ICInAppMessageManager_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke;
    v24[3] = &unk_1E43915E8;
    v24[4] = self;
    v11 = &v25;
    v18 = v9;
    v25 = v18;
    objc_msgSend(v16, "remoteObjectProxyWithErrorHandler:", v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v17;
    v22[1] = 3221225472;
    v22[2] = __85__ICInAppMessageManager_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_2;
    v22[3] = &unk_1E4389E08;
    v22[4] = self;
    v23 = v18;
    objc_msgSend(v19, "getMetadataForMessageIdentifier:bundleIdentifier:completion:", v15, v14, v22);

  }
}

- (void)getAllMetadataForBundleIdentifier:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  objc_msgSend(v6, "setWithObject:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ICInAppMessageManager getAllMetadataForBundleIdentifiers:completion:](self, "getAllMetadataForBundleIdentifiers:completion:", v8, v7);

}

- (void)getAllMetadataForBundleIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  ICInAppMessageStore *messageStore;
  id *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;

  v6 = a4;
  v7 = v6;
  if (self->_isSystemService)
  {
    messageStore = self->_messageStore;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __71__ICInAppMessageManager_getAllMetadataForBundleIdentifiers_completion___block_invoke_4;
    v16[3] = &unk_1E438D600;
    v16[4] = self;
    v9 = &v17;
    v17 = v6;
    v10 = a3;
    -[ICInAppMessageStore getAllMetadataForBundleIdentifiers:completion:](messageStore, "getAllMetadataForBundleIdentifiers:completion:", v10, v16);

  }
  else
  {
    v11 = a3;
    -[ICInAppMessageManager _xpcClientConnection](self, "_xpcClientConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __71__ICInAppMessageManager_getAllMetadataForBundleIdentifiers_completion___block_invoke;
    v20[3] = &unk_1E43915E8;
    v20[4] = self;
    v9 = &v21;
    v14 = v7;
    v21 = v14;
    objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __71__ICInAppMessageManager_getAllMetadataForBundleIdentifiers_completion___block_invoke_2;
    v18[3] = &unk_1E438D600;
    v18[4] = self;
    v19 = v14;
    objc_msgSend(v15, "getAllMetadataForBundleIdentifiers:completion:", v11, v18);

  }
}

- (void)updateMetadata:(id)a3 messageIdentifier:(id)a4 bundleIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ICAsyncBlockOperation *v14;
  id *v15;
  id v16;
  ICAsyncBlockOperation *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  ICInAppMessageManager *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (self->_isSystemService)
  {
    v14 = [ICAsyncBlockOperation alloc];
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_4;
    v26 = &unk_1E4389E30;
    v27 = self;
    v15 = &v28;
    v28 = v10;
    v29 = v11;
    v30 = v12;
    v31 = v13;
    v16 = v13;
    v17 = -[ICAsyncBlockOperation initWithStartHandler:](v14, "initWithStartHandler:", &v23);
    -[ICAsyncBlockOperation setName:](v17, "setName:", CFSTR("com.apple.iTunesCloud.ICInAppMessageManager.updateMetadata"), v23, v24, v25, v26, v27);
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v17);

    v18 = v29;
  }
  else
  {
    -[ICInAppMessageManager _xpcClientConnection](self, "_xpcClientConnection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke;
    v34[3] = &unk_1E43915E8;
    v34[4] = self;
    v15 = &v35;
    v20 = v13;
    v35 = v20;
    objc_msgSend(v19, "remoteObjectProxyWithErrorHandler:", v34);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_2;
    v32[3] = &unk_1E43915E8;
    v32[4] = self;
    v33 = v20;
    v22 = v20;
    objc_msgSend(v21, "updateMetadata:messageIdentifier:bundleIdentifier:completion:", v10, v11, v12, v32);

    v18 = v33;
  }

}

- (void)removeMetadataForMessageIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICAsyncBlockOperation *v11;
  id *v12;
  id v13;
  ICAsyncBlockOperation *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_isSystemService)
  {
    v11 = [ICAsyncBlockOperation alloc];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_4;
    v21[3] = &unk_1E438FB38;
    v21[4] = self;
    v12 = &v22;
    v22 = v8;
    v23 = v9;
    v24 = v10;
    v13 = v10;
    v14 = -[ICAsyncBlockOperation initWithStartHandler:](v11, "initWithStartHandler:", v21);
    -[ICAsyncBlockOperation setName:](v14, "setName:", CFSTR("com.apple.iTunesCloud.ICInAppMessageManager.clearMetadataForMessageIdentifier"));
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v14);

    v15 = v23;
  }
  else
  {
    -[ICInAppMessageManager _xpcClientConnection](self, "_xpcClientConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke;
    v27[3] = &unk_1E43915E8;
    v27[4] = self;
    v12 = &v28;
    v18 = v10;
    v28 = v18;
    objc_msgSend(v16, "remoteObjectProxyWithErrorHandler:", v27);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v17;
    v25[1] = 3221225472;
    v25[2] = __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_2;
    v25[3] = &unk_1E43915E8;
    v25[4] = self;
    v26 = v18;
    v20 = v18;
    objc_msgSend(v19, "removeMetadataForMessageIdentifier:bundleIdentifier:completion:", v8, v9, v25);

    v15 = v26;
  }

}

- (void)getGlobalPropertyForKey:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  ICInAppMessageStore *messageStore;
  id *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;

  v6 = a4;
  v7 = v6;
  if (self->_isSystemService)
  {
    messageStore = self->_messageStore;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60__ICInAppMessageManager_getGlobalPropertyForKey_completion___block_invoke_4;
    v16[3] = &unk_1E4389E58;
    v16[4] = self;
    v9 = &v17;
    v17 = v6;
    v10 = a3;
    -[ICInAppMessageStore getStorePropertyForKey:completion:](messageStore, "getStorePropertyForKey:completion:", v10, v16);

  }
  else
  {
    v11 = a3;
    -[ICInAppMessageManager _xpcClientConnection](self, "_xpcClientConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __60__ICInAppMessageManager_getGlobalPropertyForKey_completion___block_invoke;
    v20[3] = &unk_1E43915E8;
    v20[4] = self;
    v9 = &v21;
    v14 = v7;
    v21 = v14;
    objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __60__ICInAppMessageManager_getGlobalPropertyForKey_completion___block_invoke_2;
    v18[3] = &unk_1E4389E58;
    v18[4] = self;
    v19 = v14;
    objc_msgSend(v15, "getGlobalPropertyForKey:completion:", v11, v18);

  }
}

- (void)setGlobalProperty:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  ICInAppMessageStore *messageStore;
  id *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;

  v8 = a5;
  v9 = v8;
  if (self->_isSystemService)
  {
    messageStore = self->_messageStore;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __61__ICInAppMessageManager_setGlobalProperty_forKey_completion___block_invoke_4;
    v20[3] = &unk_1E43915E8;
    v20[4] = self;
    v11 = &v21;
    v21 = v8;
    v12 = a4;
    v13 = a3;
    -[ICInAppMessageStore updateStoreProperty:forKey:completion:](messageStore, "updateStoreProperty:forKey:completion:", v13, v12, v20);

  }
  else
  {
    v14 = a4;
    v15 = a3;
    -[ICInAppMessageManager _xpcClientConnection](self, "_xpcClientConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __61__ICInAppMessageManager_setGlobalProperty_forKey_completion___block_invoke;
    v24[3] = &unk_1E43915E8;
    v24[4] = self;
    v11 = &v25;
    v18 = v9;
    v25 = v18;
    objc_msgSend(v16, "remoteObjectProxyWithErrorHandler:", v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v17;
    v22[1] = 3221225472;
    v22[2] = __61__ICInAppMessageManager_setGlobalProperty_forKey_completion___block_invoke_2;
    v22[3] = &unk_1E43915E8;
    v22[4] = self;
    v23 = v18;
    objc_msgSend(v19, "setGlobalProperty:forKey:completion:", v15, v14, v22);

  }
}

- (void)setProperty:(id)a3 forKey:(id)a4 bundleIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  void *v11;
  ICInAppMessageStore *messageStore;
  id *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;

  v10 = a6;
  v11 = v10;
  if (self->_isSystemService)
  {
    messageStore = self->_messageStore;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __72__ICInAppMessageManager_setProperty_forKey_bundleIdentifier_completion___block_invoke_4;
    v23[3] = &unk_1E43915E8;
    v23[4] = self;
    v13 = &v24;
    v24 = v10;
    v14 = a5;
    v15 = a4;
    v16 = a3;
    -[ICInAppMessageStore updateStoreProperty:forKey:bundleIdentifier:completion:](messageStore, "updateStoreProperty:forKey:bundleIdentifier:completion:", v16, v15, v14, v23);

  }
  else
  {
    v17 = a5;
    v18 = a4;
    v19 = a3;
    -[ICInAppMessageManager _xpcClientConnection](self, "_xpcClientConnection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __72__ICInAppMessageManager_setProperty_forKey_bundleIdentifier_completion___block_invoke;
    v27[3] = &unk_1E43915E8;
    v27[4] = self;
    v13 = &v28;
    v21 = v11;
    v28 = v21;
    objc_msgSend(v20, "remoteObjectProxyWithErrorHandler:", v27);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __72__ICInAppMessageManager_setProperty_forKey_bundleIdentifier_completion___block_invoke_2;
    v25[3] = &unk_1E43915E8;
    v25[4] = self;
    v26 = v21;
    objc_msgSend(v22, "setProperty:forKey:bundleIdentifier:completion:", v19, v18, v17, v25);

  }
}

- (void)removeApplicationBadgeForBundleIdentifier:(id)a3 fromPresentedMessageEntry:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  ICInAppMessageManager *v14;
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  if ((objc_msgSend(v11, "isBadgingApplication") & 1) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __104__ICInAppMessageManager_removeApplicationBadgeForBundleIdentifier_fromPresentedMessageEntry_completion___block_invoke;
    v12[3] = &unk_1E438D5B0;
    v13 = v11;
    v14 = self;
    v15 = v8;
    v16 = v13;
    v17 = v10;
    +[ICInAppMessageUserNotificationCoordinator removeBadgeIconForBundleIdentifier:completion:](ICInAppMessageUserNotificationCoordinator, "removeBadgeIconForBundleIdentifier:completion:", v15, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3
{
  ICAsyncBlockOperation *v4;
  ICAsyncBlockOperation *v5;
  _QWORD v6[5];

  v4 = [ICAsyncBlockOperation alloc];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__ICInAppMessageManager__handleUserIdentityStoreDidChangeNotification___block_invoke;
  v6[3] = &unk_1E438D788;
  v6[4] = self;
  v5 = -[ICAsyncBlockOperation initWithStartHandler:](v4, "initWithStartHandler:", v6);
  -[ICAsyncBlockOperation setName:](v5, "setName:", CFSTR("com.apple.iTunesCloud.ICInAppMessageManager.handleAccountChange"));
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v5);

}

- (void)_schedulePeriodicUpdate
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__ICInAppMessageManager__schedulePeriodicUpdate__block_invoke;
  v2[3] = &unk_1E4389F40;
  v2[4] = self;
  -[ICInAppMessageManager _loadConfigurationWithCompletion:](self, "_loadConfigurationWithCompletion:", v2);
}

- (id)_storeRequestContext
{
  ICStoreRequestContext *v3;
  _QWORD v5[5];

  v3 = [ICStoreRequestContext alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__ICInAppMessageManager__storeRequestContext__block_invoke;
  v5[3] = &unk_1E4390188;
  v5[4] = self;
  return -[ICStoreRequestContext initWithBlock:](v3, "initWithBlock:", v5);
}

- (void)_performSyncWithCompletion:(id)a3
{
  id v4;
  ICInAppMessageStore *messageStore;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  messageStore = self->_messageStore;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke;
  v7[3] = &unk_1E43915E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[ICInAppMessageStore updateStoreProperty:forKey:completion:](messageStore, "updateStoreProperty:forKey:completion:", MEMORY[0x1E0C9AAB0], CFSTR("syncPending"), v7);

}

- (void)_processSyncResponse:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  ICInAppMessageStore *messageStore;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  messageStore = self->_messageStore;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__ICInAppMessageManager__processSyncResponse_completion___block_invoke;
  v11[3] = &unk_1E438A028;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  -[ICInAppMessageStore getStorePropertyForKey:completion:](messageStore, "getStorePropertyForKey:completion:", CFSTR("serverRevision"), v11);

}

- (void)_addMessageEntry:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ICInAppMessageManager *v9;
  ICInAppMessageStore *messageStore;
  id v11;
  id v12;
  id v13;
  ICInAppMessageManager *v14;
  _QWORD v15[4];
  ICInAppMessageManager *v16;
  id v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "applicationMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hasAssetPrefetchStrategy")
    && objc_msgSend(v8, "assetPrefetchStrategy") == 1)
  {
    objc_msgSend(v6, "setShouldDownloadResources:", 1);
  }
  v9 = self;
  messageStore = v9->_messageStore;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__ICInAppMessageManager__addMessageEntry_completion___block_invoke;
  v15[3] = &unk_1E438EF60;
  v16 = v9;
  v17 = v8;
  v18 = v6;
  v19 = v7;
  v11 = v7;
  v12 = v6;
  v13 = v8;
  v14 = v9;
  -[ICInAppMessageStore addMessageEntry:completion:](messageStore, "addMessageEntry:completion:", v12, v15);

}

- (void)_removeMessageEntryWithIdentifier:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICInAppMessageStore *messageStore;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  messageStore = self->_messageStore;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __90__ICInAppMessageManager__removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke;
  v15[3] = &unk_1E4389D70;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[ICInAppMessageStore getMessageEntryWithIdentifier:bundleIdentifier:completion:](messageStore, "getMessageEntryWithIdentifier:bundleIdentifier:completion:", v14, v13, v15);

}

- (void)_removeAllMessageEntriesForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  ICInAppMessageStore *messageStore;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  messageStore = self->_messageStore;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__ICInAppMessageManager__removeAllMessageEntriesForBundleIdentifier_completion___block_invoke;
  v11[3] = &unk_1E438FEF0;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[ICInAppMessageStore getAllMessageEntriesForBundleIdentifier:completion:](messageStore, "getAllMessageEntriesForBundleIdentifier:completion:", v10, v11);

}

- (void)_handleICInAppMessagesDidChangeDistributedNotification:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("ICInAppMessagesDidChangeNotification"), self);

}

- (void)_updateShouldDownloadResources:(BOOL)a3 onMessageWithIdentifier:(id)a4 bundleIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  ICAsyncBlockOperation *v13;
  id v14;
  id v15;
  id v16;
  ICAsyncBlockOperation *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  BOOL v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = [ICAsyncBlockOperation alloc];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __108__ICInAppMessageManager__updateShouldDownloadResources_onMessageWithIdentifier_bundleIdentifier_completion___block_invoke;
  v18[3] = &unk_1E4389DE0;
  v18[4] = self;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v22 = a3;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  v17 = -[ICAsyncBlockOperation initWithStartHandler:](v13, "initWithStartHandler:", v18);
  -[ICAsyncBlockOperation setName:](v17, "setName:", CFSTR("com.apple.iTunesCloud.ICInAppMessageManager.setShouldDownloadResources"));
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v17);

}

- (void)_checkForMessageResourcesNeedingDownloadForcingIfNecessary:(BOOL)a3
{
  NSObject *v4;
  ICAsyncBlockOperation *v5;
  ICAsyncBlockOperation *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  ICInAppMessageManager *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3 || !-[NSOperationQueue operationCount](self->_downloadOperationQueue, "operationCount"))
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v9 = self;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Initiating downloads for messages marked for caching", buf, 0xCu);
    }

    v5 = [ICAsyncBlockOperation alloc];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __84__ICInAppMessageManager__checkForMessageResourcesNeedingDownloadForcingIfNecessary___block_invoke;
    v7[3] = &unk_1E438D788;
    v7[4] = self;
    v6 = -[ICAsyncBlockOperation initWithStartHandler:](v5, "initWithStartHandler:", v7);
    -[ICAsyncBlockOperation setName:](v6, "setName:", CFSTR("com.apple.iTunesCloud.ICInAppMessageManager.downloadMessageResources"));
    -[NSOperationQueue addOperation:](self->_downloadOperationQueue, "addOperation:", v6);

  }
}

- (void)_downloadResourcesForMessageWithIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICNetworkConstraints *v11;
  void *v12;
  uint64_t v13;
  ICInAppMessageStore *messageStore;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  ICInAppMessageManager *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[ICNetworkConstraints initWithBundleIdentifier:]([ICNetworkConstraints alloc], "initWithBundleIdentifier:", v9);
  +[ICEnvironmentMonitor sharedMonitor](ICEnvironmentMonitor, "sharedMonitor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "lastKnownNetworkType");

  if (-[ICNetworkConstraints shouldAllowDataForNetworkType:](v11, "shouldAllowDataForNetworkType:", v13))
  {
    messageStore = self->_messageStore;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke;
    v17[3] = &unk_1E4389D70;
    v17[4] = self;
    v18 = v9;
    v19 = v8;
    v20 = v10;
    -[ICInAppMessageStore getMessageEntryWithIdentifier:bundleIdentifier:completion:](messageStore, "getMessageEntryWithIdentifier:bundleIdentifier:completion:", v19, v18, v17);

  }
  else
  {
    v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v22 = self;
      v23 = 2114;
      v24 = v9;
      v25 = 2114;
      v26 = v8;
      v27 = 1024;
      v28 = v13;
      _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping downloads for message %{public}@:%{public}@ as its not allowed on the current network type (%d)", buf, 0x26u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7004, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v16);

  }
}

- (id)_resourceCacheDirectoryPath
{
  void *v2;
  void *v3;
  void *v4;

  ICDefaultCacheDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v2, CFSTR("InAppMessages"), CFSTR("ResourceCache"), 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_loadConfigurationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICInAppMessageManager _storeRequestContext](self, "_storeRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__ICInAppMessageManager__loadConfigurationWithCompletion___block_invoke;
  v8[3] = &unk_1E438D3F8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "getBagForRequestContext:withCompletionHandler:", v6, v8);

}

- (void)_performCacheConsistencyCheck
{
  ICAsyncBlockOperation *v3;
  ICAsyncBlockOperation *v4;
  _QWORD v5[5];

  v3 = [ICAsyncBlockOperation alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__ICInAppMessageManager__performCacheConsistencyCheck__block_invoke;
  v5[3] = &unk_1E438D788;
  v5[4] = self;
  v4 = -[ICAsyncBlockOperation initWithStartHandler:](v3, "initWithStartHandler:", v5);
  -[ICAsyncBlockOperation setName:](v4, "setName:", CFSTR("com.apple.iTunesCloud.ICInAppMessageManager.performCacheConsistencyCheck"));
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v4);

}

- (BOOL)_privacyAcknowledgementRequired
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[2];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99DE8];
  v23[0] = CFSTR("Music");
  v23[1] = CFSTR("TV");
  v23[2] = CFSTR("AppStore");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMac");

  if ((v6 & 1) == 0)
  {
    v22[0] = CFSTR("FitnessPlus");
    v22[1] = CFSTR("ImproveFitnessPlus");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v7);

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        +[ICPrivacyInfo sharedPrivacyInfo](ICPrivacyInfo, "sharedPrivacyInfo", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v13) = objc_msgSend(v14, "privacyAcknowledgementRequiredForIdentifier:", v13);

        if (!(_DWORD)v13)
        {
          v15 = 0;
          goto LABEL_13;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
  v15 = 1;
LABEL_13:

  return v15;
}

- (void)_removeConnection:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__ICInAppMessageManager__removeConnection___block_invoke;
  block[3] = &unk_1E4391110;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "isRemoteServerLikelyReachable")
    && ((unint64_t)(objc_msgSend(v4, "networkType") - 1) > 0x1F2
     || objc_msgSend(v4, "isCurrentNetworkLinkHighQuality")))
  {
    -[ICInAppMessageManager _checkForMessageResourcesNeedingDownloadForcingIfNecessary:](self, "_checkForMessageResourcesNeedingDownloadForcingIfNecessary:", 0);
  }

}

- (ICInAppMessageStore)_unsafeMessageStore
{
  return self->_messageStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClientConnection, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_xpcServiceListener, 0);
  objc_storeStrong((id *)&self->_fitnessPrivacyObserverToken, 0);
  objc_storeStrong((id *)&self->_musicPrivacyObserverToken, 0);
  objc_storeStrong((id *)&self->_foregroundApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_identityStore, 0);
  objc_storeStrong((id *)&self->_messageStore, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_downloadOperationQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

uint64_t __43__ICInAppMessageManager__removeConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeObject:", *(_QWORD *)(a1 + 40));
}

void __60__ICInAppMessageManager_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained((id *)(a1 + 48));
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138543874;
      v7 = WeakRetained;
      v8 = 2114;
      v9 = v5;
      v10 = 2114;
      v11 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection from %{public}@ interrupted - removing connection %{public}@", (uint8_t *)&v6, 0x20u);
    }

    if (v3)
      objc_msgSend(WeakRetained, "_removeConnection:", v3);

  }
}

void __60__ICInAppMessageManager_listener_shouldAcceptNewConnection___block_invoke_375(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained((id *)(a1 + 48));
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138543874;
      v7 = WeakRetained;
      v8 = 2114;
      v9 = v5;
      v10 = 2114;
      v11 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection from %{public}@ invalidated - removing connection %{public}@", (uint8_t *)&v6, 0x20u);
    }

    if (v3)
      objc_msgSend(WeakRetained, "_removeConnection:", v3);

  }
}

void __54__ICInAppMessageManager__performCacheConsistencyCheck__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__ICInAppMessageManager__performCacheConsistencyCheck__block_invoke_2;
  v7[3] = &unk_1E438A0C8;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "getAllMessageEntriesWithCompletion:", v7);

}

void __54__ICInAppMessageManager__performCacheConsistencyCheck__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id obj;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v53 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "applicationMessage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
    }
    while (v6);
  }
  v35 = v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(*(id *)(a1 + 32), "_resourceCacheDirectoryPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fileURLWithPath:", v14);
  v15 = objc_claimAutoreleasedReturnValue();

  v39 = v12;
  v34 = (void *)v15;
  objc_msgSend(v12, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v15, 0, 5, 0);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
  if (v16)
  {
    v17 = v16;
    v38 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v49 != v38)
          objc_enumerationMutation(obj);
        objc_msgSend(v39, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j), 0, 5, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v45;
          do
          {
            for (k = 0; k != v21; ++k)
            {
              if (*(_QWORD *)v45 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * k);
              objc_msgSend(v24, "lastPathComponent");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v3, "containsObject:", v25) & 1) == 0)
                objc_msgSend(v11, "addObject:", v24);

            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
          }
          while (v21);
        }

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
    }
    while (v17);
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v26 = v11;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v60, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v41;
    do
    {
      for (m = 0; m != v28; ++m)
      {
        if (*(_QWORD *)v41 != v29)
          objc_enumerationMutation(v26);
        v31 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * m);
        v32 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          v57 = v33;
          v58 = 2114;
          v59 = v31;
          _os_log_impl(&dword_1A03E3000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ Purging orphaned cache directory %{public}@", buf, 0x16u);
        }

        objc_msgSend(v39, "removeItemAtURL:error:", v31, 0);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v60, 16);
    }
    while (v28);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", 0);
}

void __58__ICInAppMessageManager__loadConfigurationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  ICInAppMessageConfiguration *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v13 = 138543618;
      v14 = v7;
      v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to load bag for configuration. err=%{public}@", (uint8_t *)&v13, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(a2, "dictionaryForBagKey:", CFSTR("inAppMessages"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_NSIsNSDictionary() & 1) != 0)
    {
      v9 = -[ICInAppMessageConfiguration initWithDictionary:]([ICInAppMessageConfiguration alloc], "initWithDictionary:", v8);
      (*(void (**)(_QWORD, ICInAppMessageConfiguration *, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v9, 0);
    }
    else
    {
      v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v13 = 138543362;
        v14 = v11;
        _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to load configuration from bag", (uint8_t *)&v13, 0xCu);
      }

      v12 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v9 = (ICInAppMessageConfiguration *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, ICInAppMessageConfiguration *))(v12 + 16))(v12, 0, v9);
    }

  }
}

void __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      v22 = v8;
      v23 = 2114;
      v24 = v9;
      v25 = 2114;
      v26 = v10;
      v27 = 2114;
      v28 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to fetch message %{public}@:%{public}@ to set the download flag on. err=%{public}@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v11 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_349;
    v15[3] = &unk_1E438A1E0;
    v12 = *(id *)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    v20 = v12;
    v15[4] = v13;
    v16 = v14;
    v17 = *(id *)(a1 + 48);
    v18 = v5;
    v19 = 0;
    objc_msgSend(v11, "_loadConfigurationWithCompletion:", v15);

  }
}

void __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_349(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  ICURLRequest *v26;
  void *v27;
  ICURLRequest *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  ICURLRequest *v47;
  void *v48;
  ICURLRequest *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t j;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  ICURLRequest *v76;
  void *v77;
  ICURLRequest *v78;
  void *v79;
  void *v80;
  id v81;
  NSObject *v82;
  void *v83;
  NSObject *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  id v88;
  id obj;
  uint64_t v90;
  uint64_t i;
  void *v92;
  void *v93;
  NSObject *group;
  uint64_t v95;
  id v96;
  uint64_t v97;
  _QWORD block[5];
  id v99;
  id v100;
  id v101;
  _QWORD *v102;
  __int128 *v103;
  _QWORD v104[6];
  id v105;
  id v106;
  id v107;
  NSObject *v108;
  __int128 *v109;
  _QWORD *v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _QWORD v119[5];
  id v120;
  id v121;
  id v122;
  NSObject *v123;
  __int128 *v124;
  _QWORD *v125;
  _QWORD v126[5];
  id v127;
  id v128;
  id v129;
  NSObject *v130;
  __int128 *v131;
  _QWORD *v132;
  id v133;
  _QWORD v134[5];
  id v135;
  uint8_t buf[4];
  uint64_t v137;
  __int16 v138;
  void *v139;
  __int16 v140;
  uint64_t v141;
  __int16 v142;
  uint64_t v143;
  _BYTE v144[128];
  uint8_t v145[128];
  __int128 v146;
  uint64_t v147;
  uint64_t (*v148)(uint64_t, uint64_t);
  void (*v149)(uint64_t);
  id v150;
  uint64_t v151;

  v151 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v93 = v5;
  if (!v6)
  {
    v95 = a1;
    objc_msgSend(v5, "resourceDomainURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v84 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        v85 = *(_QWORD *)(a1 + 32);
        LODWORD(v146) = 138543362;
        *(_QWORD *)((char *)&v146 + 4) = v85;
        _os_log_impl(&dword_1A03E3000, v84, OS_LOG_TYPE_DEFAULT, "%{public}@ base resource url missing from configuration - skipping download", (uint8_t *)&v146, 0xCu);
      }

      v86 = *(_QWORD *)(a1 + 72);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v86 + 16))(v86, v87);

      goto LABEL_39;
    }
    *(_QWORD *)&v146 = 0;
    *((_QWORD *)&v146 + 1) = &v146;
    v147 = 0x3032000000;
    v148 = __Block_byref_object_copy__2347;
    v149 = __Block_byref_object_dispose__2348;
    v150 = 0;
    v134[0] = 0;
    v134[1] = v134;
    v134[2] = 0x3032000000;
    v134[3] = __Block_byref_object_copy__2347;
    v134[4] = __Block_byref_object_dispose__2348;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v135 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_resourceCacheDirectoryPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", *(_QWORD *)(a1 + 48));
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = 0;
    objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v92, 1, 0, &v133);
    v88 = v133;

    group = dispatch_group_create();
    objc_msgSend(*(id *)(a1 + 56), "applicationMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v11, "hasWebArchiveURL");

    if ((_DWORD)v10)
    {
      objc_msgSend(*(id *)(a1 + 56), "cachedLocationForResourceWithIdentifier:", CFSTR("ICInAppMessageEntryResourceIdentifierWebArchive"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12 == 0;

      if (v13)
      {
        v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = *(_QWORD *)(a1 + 32);
          v16 = *(void **)(a1 + 40);
          v17 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 138543874;
          v137 = v15;
          v138 = 2114;
          v139 = v16;
          v140 = 2114;
          v141 = v17;
          _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Downloading web archive for message %{public}@:%{public}@", buf, 0x20u);
        }

        dispatch_group_enter(group);
        v18 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(*(id *)(a1 + 56), "applicationMessage");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "webArchiveURL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "resourceDomainURL");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "URLWithString:relativeToURL:", v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "lastPathComponent");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "stringByAppendingPathComponent:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "removeItemAtPath:error:", v24, 0);

        v26 = [ICURLRequest alloc];
        objc_msgSend(*(id *)(a1 + 32), "_storeRequestContext");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[ICURLRequest initWithURL:requestContext:](v26, "initWithURL:requestContext:", v22, v27);

        +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v24);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v126[0] = MEMORY[0x1E0C809B0];
        v126[1] = 3221225472;
        v126[2] = __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_353;
        v126[3] = &unk_1E438A0F0;
        v31 = *(_QWORD *)(a1 + 32);
        v131 = &v146;
        v126[4] = v31;
        v127 = *(id *)(a1 + 56);
        v128 = *(id *)(a1 + 64);
        v132 = v134;
        v32 = v24;
        v129 = v32;
        v130 = group;
        objc_msgSend(v29, "enqueueDownloadRequest:toDestination:withCompletionHandler:", v28, v30, v126);

      }
    }
    objc_msgSend(*(id *)(a1 + 56), "applicationMessage");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "hasTemplateURL"))
    {
      objc_msgSend(*(id *)(a1 + 56), "cachedLocationForResourceWithIdentifier:", CFSTR("ICInAppMessageEntryResourceIdentifierTemplate"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34 == 0;

      if (!v35)
      {
LABEL_15:
        v117 = 0u;
        v118 = 0u;
        v115 = 0u;
        v116 = 0u;
        objc_msgSend(*(id *)(a1 + 56), "applicationMessage");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "contentPages");
        obj = (id)objc_claimAutoreleasedReturnValue();

        v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v145, 16);
        if (v55)
        {
          v90 = *(_QWORD *)v116;
          do
          {
            for (i = 0; i != v55; ++i)
            {
              if (*(_QWORD *)v116 != v90)
                objc_enumerationMutation(obj);
              v56 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * i);
              v111 = 0u;
              v112 = 0u;
              v113 = 0u;
              v114 = 0u;
              objc_msgSend(v56, "images");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v111, v144, 16);
              if (v58)
              {
                v96 = v57;
                v97 = *(_QWORD *)v112;
                do
                {
                  for (j = 0; j != v58; ++j)
                  {
                    if (*(_QWORD *)v112 != v97)
                      objc_enumerationMutation(v96);
                    v60 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * j);
                    if (objc_msgSend(v60, "hasIdentifier"))
                    {
                      if (objc_msgSend(v60, "hasURL"))
                      {
                        v61 = *(void **)(v95 + 56);
                        objc_msgSend(v60, "identifier");
                        v62 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v61, "cachedLocationForResourceWithIdentifier:", v62);
                        v63 = (void *)objc_claimAutoreleasedReturnValue();
                        LODWORD(v61) = v63 == 0;

                        if ((_DWORD)v61)
                        {
                          v64 = os_log_create("com.apple.amp.iTunesCloud", "Default");
                          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                          {
                            v65 = *(_QWORD *)(v95 + 32);
                            objc_msgSend(v60, "identifier");
                            v66 = (void *)objc_claimAutoreleasedReturnValue();
                            v67 = *(_QWORD *)(v95 + 40);
                            v68 = *(_QWORD *)(v95 + 48);
                            *(_DWORD *)buf = 138544130;
                            v137 = v65;
                            v138 = 2114;
                            v139 = v66;
                            v140 = 2114;
                            v141 = v67;
                            v142 = 2114;
                            v143 = v68;
                            _os_log_impl(&dword_1A03E3000, v64, OS_LOG_TYPE_DEFAULT, "%{public}@ Downloading image %{public}@ for message %{public}@:%{public}@", buf, 0x2Au);

                          }
                          dispatch_group_enter(group);
                          v69 = (void *)MEMORY[0x1E0C99E98];
                          objc_msgSend(v60, "uRL");
                          v70 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v93, "resourceDomainURL");
                          v71 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v69, "URLWithString:relativeToURL:", v70, v71);
                          v72 = (void *)objc_claimAutoreleasedReturnValue();

                          objc_msgSend(v72, "lastPathComponent");
                          v73 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v92, "stringByAppendingPathComponent:", v73);
                          v74 = (void *)objc_claimAutoreleasedReturnValue();

                          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                          v75 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v75, "removeItemAtPath:error:", v74, 0);

                          v76 = [ICURLRequest alloc];
                          objc_msgSend(*(id *)(v95 + 32), "_storeRequestContext");
                          v77 = (void *)objc_claimAutoreleasedReturnValue();
                          v78 = -[ICURLRequest initWithURL:requestContext:](v76, "initWithURL:requestContext:", v72, v77);

                          +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
                          v79 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v74);
                          v80 = (void *)objc_claimAutoreleasedReturnValue();
                          v104[0] = MEMORY[0x1E0C809B0];
                          v104[1] = 3221225472;
                          v104[2] = __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_358;
                          v104[3] = &unk_1E438A118;
                          v109 = &v146;
                          v104[4] = *(_QWORD *)(v95 + 32);
                          v104[5] = v60;
                          v105 = *(id *)(v95 + 56);
                          v106 = *(id *)(v95 + 64);
                          v110 = v134;
                          v81 = v74;
                          v107 = v81;
                          v108 = group;
                          objc_msgSend(v79, "enqueueDownloadRequest:toDestination:withCompletionHandler:", v78, v80, v104);

                        }
                      }
                    }
                  }
                  v57 = v96;
                  v58 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v111, v144, 16);
                }
                while (v58);
              }

            }
            v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v145, 16);
          }
          while (v55);
        }

        dispatch_get_global_queue(0, 0);
        v82 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_2;
        block[3] = &unk_1E438A1B8;
        v83 = *(void **)(v95 + 40);
        block[4] = *(_QWORD *)(v95 + 32);
        v102 = v134;
        v99 = v83;
        v100 = *(id *)(v95 + 48);
        v101 = *(id *)(v95 + 72);
        v103 = &v146;
        dispatch_group_notify(group, v82, block);

        _Block_object_dispose(v134, 8);
        _Block_object_dispose(&v146, 8);

LABEL_39:
        v6 = 0;
        goto LABEL_40;
      }
      v36 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = *(_QWORD *)(a1 + 32);
        v38 = *(void **)(a1 + 40);
        v39 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        v137 = v37;
        v138 = 2114;
        v139 = v38;
        v140 = 2114;
        v141 = v39;
        _os_log_impl(&dword_1A03E3000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ Downloading template file for message %{public}@:%{public}@", buf, 0x20u);
      }

      dispatch_group_enter(group);
      v40 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(*(id *)(a1 + 56), "applicationMessage");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "templateURL");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "resourceDomainURL");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "URLWithString:relativeToURL:", v42, v43);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "lastPathComponent");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "stringByAppendingPathComponent:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "removeItemAtPath:error:", v45, 0);

      v47 = [ICURLRequest alloc];
      objc_msgSend(*(id *)(a1 + 32), "_storeRequestContext");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[ICURLRequest initWithURL:requestContext:](v47, "initWithURL:requestContext:", v33, v48);

      +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v45);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v119[0] = MEMORY[0x1E0C809B0];
      v119[1] = 3221225472;
      v119[2] = __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_356;
      v119[3] = &unk_1E438A0F0;
      v52 = *(_QWORD *)(a1 + 32);
      v124 = &v146;
      v119[4] = v52;
      v120 = *(id *)(a1 + 56);
      v121 = *(id *)(a1 + 64);
      v125 = v134;
      v53 = v45;
      v122 = v53;
      v123 = group;
      objc_msgSend(v50, "enqueueDownloadRequest:toDestination:withCompletionHandler:", v49, v51, v119);

    }
    goto LABEL_15;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_40:

}

void __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_353(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a3);
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v15 = v7;
      v16 = 2114;
      v17 = v8;
      v18 = 2114;
      v19 = v9;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to download web archive for message %{public}@. err=%{public}@", buf, 0x20u);
    }

  }
  else
  {
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_354;
    v11[3] = &unk_1E4391568;
    v13 = *(_QWORD *)(a1 + 80);
    v12 = *(id *)(a1 + 56);
    dispatch_sync(v10, v11);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

void __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_356(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a3);
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v15 = v7;
      v16 = 2114;
      v17 = v8;
      v18 = 2114;
      v19 = v9;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to download template for message %{public}@. err=%{public}@", buf, 0x20u);
    }

  }
  else
  {
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_357;
    v11[3] = &unk_1E4391568;
    v13 = *(_QWORD *)(a1 + 80);
    v12 = *(id *)(a1 + 56);
    dispatch_sync(v10, v11);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

void __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_358(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  _QWORD block[4];
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), a3);
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138544130;
      v19 = v7;
      v20 = 2114;
      v21 = v8;
      v22 = 2114;
      v23 = v9;
      v24 = 2114;
      v25 = v10;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to download image %{public}@ for message %{public}@. err=%{public}@", buf, 0x2Au);

    }
  }
  else
  {
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_359;
    block[3] = &unk_1E43907D8;
    v17 = *(_QWORD *)(a1 + 88);
    v12 = *(id *)(a1 + 64);
    v13 = *(_QWORD *)(a1 + 40);
    v15 = v12;
    v16 = v13;
    dispatch_sync(v11, block);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));

}

void __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  ICAsyncBlockOperation *v7;
  ICAsyncBlockOperation *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count");
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138544130;
    v19 = v3;
    v20 = 1024;
    v21 = v4;
    v22 = 2114;
    v23 = v5;
    v24 = 2114;
    v25 = v6;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Downloaded %d resources for message %{public}@:%{public}@", buf, 0x26u);
  }

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
  {
    v7 = [ICAsyncBlockOperation alloc];
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_360;
    v12 = &unk_1E438A190;
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(id *)(a1 + 48);
    v15 = *(id *)(a1 + 40);
    v16 = *(id *)(a1 + 56);
    v17 = *(_OWORD *)(a1 + 64);
    v8 = -[ICAsyncBlockOperation initWithStartHandler:](v7, "initWithStartHandler:", &v9);
    -[ICAsyncBlockOperation setName:](v8, "setName:", CFSTR("com.apple.iTunesCloud.ICInAppMessageManager.setShouldDownloadResources"), v9, v10, v11, v12, v13);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addOperation:", v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_360(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  __int128 v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(v4 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_2_361;
  v10[3] = &unk_1E438A168;
  v10[4] = v4;
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v11 = v3;
  v12 = v8;
  v13 = *(_OWORD *)(a1 + 64);
  v9 = v3;
  objc_msgSend(v6, "getMessageEntryWithIdentifier:bundleIdentifier:completion:", v5, v7, v10);

}

void __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_2_361(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v24 = v8;
      v25 = 2114;
      v26 = v5;
      v27 = 2114;
      v28 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to fetch message %{public}@ to update with cached resource locations. err=%{public}@", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v6);
  }
  else
  {
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v10 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_362;
    v21[3] = &unk_1E438E6C0;
    v11 = v5;
    v22 = v11;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v21);
    objc_msgSend(v11, "setDidCacheRequiredResources:", 1);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 40);
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_2_364;
    v16[3] = &unk_1E438A140;
    v16[4] = v12;
    v17 = v11;
    v14 = *(id *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 64);
    v19 = v14;
    v20 = v15;
    v18 = *(id *)(a1 + 40);
    objc_msgSend(v13, "updateMessageEntry:completion:", v17, v16);

  }
}

uint64_t __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_362(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCacheLocation:forResourceWithIdentifier:", a3, a2);
}

void __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_2_364(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v8 = 138543874;
      v9 = v5;
      v10 = 2114;
      v11 = v6;
      v12 = 2114;
      v13 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to update resource cache locations for message %{public}@. err=%{public}@", (uint8_t *)&v8, 0x20u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v3);
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("com.apple.itunescloud.ICInAppMessagesDidChangeDistributedNotification"), 0);

}

void __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_359(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKey:", v2, v3);

}

uint64_t __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_357(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("ICInAppMessageEntryResourceIdentifierTemplate"));
}

uint64_t __96__ICInAppMessageManager__downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_354(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("ICInAppMessageEntryResourceIdentifierWebArchive"));
}

void __84__ICInAppMessageManager__checkForMessageResourcesNeedingDownloadForcingIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__ICInAppMessageManager__checkForMessageResourcesNeedingDownloadForcingIfNecessary___block_invoke_2;
  v7[3] = &unk_1E438A0C8;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "getAllMessageEntriesWithCompletion:", v7);

}

void __84__ICInAppMessageManager__checkForMessageResourcesNeedingDownloadForcingIfNecessary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[4];
  id v23;
  _QWORD v24[4];
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v32 = v8;
      v33 = 2114;
      v34 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to load messages to check for downloads. err=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    v20 = 0;
    v7 = dispatch_group_create();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v21 = v5;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v14, "shouldDownloadResources", v20))
          {
            dispatch_group_enter(v7);
            v15 = *(void **)(a1 + 32);
            objc_msgSend(v14, "applicationMessage");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "bundleIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v24[0] = MEMORY[0x1E0C809B0];
            v24[1] = 3221225472;
            v24[2] = __84__ICInAppMessageManager__checkForMessageResourcesNeedingDownloadForcingIfNecessary___block_invoke_344;
            v24[3] = &unk_1E43902A0;
            v25 = v7;
            objc_msgSend(v15, "_downloadResourcesForMessageWithIdentifier:bundleIdentifier:completion:", v17, v18, v24);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v11);
    }

    dispatch_get_global_queue(0, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__ICInAppMessageManager__checkForMessageResourcesNeedingDownloadForcingIfNecessary___block_invoke_2_345;
    block[3] = &unk_1E43913D8;
    v23 = *(id *)(a1 + 40);
    dispatch_group_notify(v7, v19, block);

    v6 = v20;
    v5 = v21;
  }

}

void __84__ICInAppMessageManager__checkForMessageResourcesNeedingDownloadForcingIfNecessary___block_invoke_344(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __84__ICInAppMessageManager__checkForMessageResourcesNeedingDownloadForcingIfNecessary___block_invoke_2_345(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", 0);
}

void __108__ICInAppMessageManager__updateShouldDownloadResources_onMessageWithIdentifier_bundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(v4 + 40);
  v7 = *(void **)(a1 + 48);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __108__ICInAppMessageManager__updateShouldDownloadResources_onMessageWithIdentifier_bundleIdentifier_completion___block_invoke_2;
  v10[3] = &unk_1E438A0A0;
  v10[4] = v4;
  v11 = v7;
  v12 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 56);
  v13 = v3;
  v14 = v8;
  v15 = *(_BYTE *)(a1 + 64);
  v9 = v3;
  objc_msgSend(v6, "getMessageEntryWithIdentifier:bundleIdentifier:completion:", v5, v11, v10);

}

void __108__ICInAppMessageManager__updateShouldDownloadResources_onMessageWithIdentifier_bundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      v20 = v8;
      v21 = 2114;
      v22 = v9;
      v23 = 2114;
      v24 = v10;
      v25 = 2114;
      v26 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to fetch message %{public}@:%{public}@ to set the download setting on. err=%{public}@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v6);
  }
  else
  {
    objc_msgSend(v5, "setShouldDownloadResources:", *(unsigned __int8 *)(a1 + 72));
    if (!*(_BYTE *)(a1 + 72))
      objc_msgSend(v5, "clearCachedResources");
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v13 = *(void **)(v11 + 40);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __108__ICInAppMessageManager__updateShouldDownloadResources_onMessageWithIdentifier_bundleIdentifier_completion___block_invoke_341;
    v14[3] = &unk_1E438D5B0;
    v14[4] = v11;
    v15 = v12;
    v16 = *(id *)(a1 + 48);
    v18 = *(id *)(a1 + 64);
    v17 = *(id *)(a1 + 56);
    objc_msgSend(v13, "updateMessageEntry:completion:", v5, v14);

  }
}

void __108__ICInAppMessageManager__updateShouldDownloadResources_onMessageWithIdentifier_bundleIdentifier_completion___block_invoke_341(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v8 = 138544130;
      v9 = v5;
      v10 = 2114;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      v14 = 2114;
      v15 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to update message %{public}@:%{public}@ with the updated download setting. err=%{public}@", (uint8_t *)&v8, 0x2Au);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v3);

}

uint64_t __52__ICInAppMessageManager__performSyncRetryIfPending___block_invoke_338(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

void __80__ICInAppMessageManager__removeAllMessageEntriesForBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  char v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id obj;
  _QWORD v31[5];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v43 = v7;
      v44 = 2114;
      v45 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to gather messages to remove - some additional cleanup will be skipped. err=%{public}@", buf, 0x16u);
    }

  }
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isMac");

  v10 = (_QWORD *)&unk_1A06E6000;
  if ((v9 & 1) == 0)
  {
    v27 = v5;
    v28 = v4;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v4;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v38 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v15, "applicationMessage");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v17, "hasPrefix:", CFSTR("ams")))
          {
            v18 = v17;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ams_%@"), v17);
            v18 = (id)objc_claimAutoreleasedReturnValue();
          }
          v19 = v18;
          +[ICInAppMessageUserNotificationCoordinator removeNotificationWithIdentifier:forBundleIdentifier:](ICInAppMessageUserNotificationCoordinator, "removeNotificationWithIdentifier:forBundleIdentifier:", v18, *(_QWORD *)(a1 + 40));
          if (objc_msgSend(v15, "isBadgingApplication"))
          {
            objc_msgSend(v15, "applicationMessage");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "applicationBadge");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v21, "bundleIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v34[0] = MEMORY[0x1E0C809B0];
            v34[1] = 3221225472;
            v34[2] = __80__ICInAppMessageManager__removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_335;
            v34[3] = &unk_1E4390278;
            v35 = *(id *)(a1 + 40);
            v36 = v21;
            v23 = v21;
            +[ICInAppMessageUserNotificationCoordinator removeBadgeIconForBundleIdentifier:completion:](ICInAppMessageUserNotificationCoordinator, "removeBadgeIconForBundleIdentifier:completion:", v22, v34);

          }
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v12);
    }

    v5 = v27;
    v4 = v28;
    v10 = &unk_1A06E6000;
  }
  v24 = *(_QWORD *)(a1 + 32);
  v25 = *(void **)(a1 + 40);
  v26 = *(void **)(v24 + 40);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = v10[418];
  v31[2] = __80__ICInAppMessageManager__removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_336;
  v31[3] = &unk_1E438EF88;
  v31[4] = v24;
  v32 = v25;
  v33 = *(id *)(a1 + 48);
  objc_msgSend(v26, "removeAllMessageEntriesForBundleIdentifier:completion:", v32, v31);

}

void __80__ICInAppMessageManager__removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_335(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543874;
      v8 = v5;
      v9 = 2114;
      v10 = v6;
      v11 = 2114;
      v12 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Failed to remove badge for application with bundleId=%{public}@ and badgeId=%{public}@. err=%{public}@", (uint8_t *)&v7, 0x20u);

    }
  }

}

void __80__ICInAppMessageManager__removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_336(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v17 = v5;
      v18 = 2114;
      v19 = v6;
      v20 = 2114;
      v21 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to remove messages for bundle identifier %{public}@. err=%{public}@", buf, 0x20u);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(void **)(v7 + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__ICInAppMessageManager__removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_337;
  v12[3] = &unk_1E438EF60;
  v12[4] = v7;
  v13 = v8;
  v10 = *(id *)(a1 + 48);
  v14 = v3;
  v15 = v10;
  v11 = v3;
  objc_msgSend(v9, "removeAllMetadataForBundleIdentifier:completion:", v13, v12);

}

void __80__ICInAppMessageManager__removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_337(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v10 = 138543874;
      v11 = v5;
      v12 = 2114;
      v13 = v6;
      v14 = 2114;
      v15 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to remove message metadata for bundle identifier %{public}@. err=%{public}@", (uint8_t *)&v10, 0x20u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_resourceCacheDirectoryPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeItemAtPath:error:", v8, 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __90__ICInAppMessageManager__removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v32 = v8;
      v33 = 2114;
      v34 = v9;
      v35 = 2114;
      v36 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to fetch with message with identifier:  %{public}@. err=%{public}@. Will not remove badge.", buf, 0x20u);
    }

  }
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isMac");

  v12 = MEMORY[0x1E0C809B0];
  if ((v11 & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "hasPrefix:", CFSTR("ams")))
    {
      v13 = *(id *)(a1 + 40);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ams_%@"), *(_QWORD *)(a1 + 40));
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;
    v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v32 = v16;
      v33 = 2114;
      v34 = v14;
      _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ removing user notifications with identifier %{public}@", buf, 0x16u);
    }

    +[ICInAppMessageUserNotificationCoordinator removeNotificationWithIdentifier:forBundleIdentifier:](ICInAppMessageUserNotificationCoordinator, "removeNotificationWithIdentifier:forBundleIdentifier:", v14, *(_QWORD *)(a1 + 48));
    if (objc_msgSend(v5, "isBadgingApplication"))
    {
      objc_msgSend(v5, "applicationMessage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "applicationBadge");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "bundleIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v12;
      v29[1] = 3221225472;
      v29[2] = __90__ICInAppMessageManager__removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_332;
      v29[3] = &unk_1E43902A0;
      v30 = v18;
      v20 = v18;
      +[ICInAppMessageUserNotificationCoordinator removeBadgeIconForBundleIdentifier:completion:](ICInAppMessageUserNotificationCoordinator, "removeBadgeIconForBundleIdentifier:completion:", v19, v29);

    }
  }
  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(void **)(a1 + 40);
  v23 = *(void **)(v21 + 40);
  v24 = *(_QWORD *)(a1 + 48);
  v25[0] = v12;
  v25[1] = 3221225472;
  v25[2] = __90__ICInAppMessageManager__removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_333;
  v25[3] = &unk_1E438EF60;
  v25[4] = v21;
  v26 = v22;
  v27 = *(id *)(a1 + 48);
  v28 = *(id *)(a1 + 56);
  objc_msgSend(v23, "removeMessageEntryWithIdentifier:forBundleIdentifier:completion:", v26, v24, v25);

}

void __90__ICInAppMessageManager__removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_332(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543874;
      v8 = v5;
      v9 = 2114;
      v10 = v6;
      v11 = 2114;
      v12 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Failed to remove badge for application with bundleId=%{public}@ and badgeId=%{public}@. err=%{public}@", (uint8_t *)&v7, 0x20u);

    }
  }

}

void __90__ICInAppMessageManager__removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_333(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v19 = v5;
      v20 = 2114;
      v21 = v6;
      v22 = 2114;
      v23 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to remove message %{public}@. err=%{public}@", buf, 0x20u);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(void **)(v7 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __90__ICInAppMessageManager__removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_334;
  v13[3] = &unk_1E438D5B0;
  v13[4] = v7;
  v14 = v8;
  v15 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v16 = v3;
  v17 = v11;
  v12 = v3;
  objc_msgSend(v9, "removeMetadataForMessageIdentifier:bundleIdentifier:completion:", v14, v10, v13);

}

void __90__ICInAppMessageManager__removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_334(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v11 = 138543874;
      v12 = v5;
      v13 = 2114;
      v14 = v6;
      v15 = 2114;
      v16 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to remove message metadata for identifier %{public}@. err=%{public}@", (uint8_t *)&v11, 0x20u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_resourceCacheDirectoryPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeItemAtPath:error:", v9, 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __53__ICInAppMessageManager__addMessageEntry_completion___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  os_log_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  os_log_t v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  BOOL v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  id v50;
  _QWORD v51[4];
  NSObject *v52;
  id v53;
  _QWORD v54[4];
  _QWORD v55[4];
  _QWORD v56[3];
  _QWORD v57[3];
  uint8_t buf[4];
  id v59;
  __int16 v60;
  NSObject *v61;
  __int16 v62;
  NSObject *v63;
  __int16 v64;
  NSObject *v65;
  _QWORD v66[4];

  v66[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "applicationBadge");
    v7 = objc_claimAutoreleasedReturnValue();
    v5 = v7;
    if (v7 && -[NSObject hasBundleIdentifier](v7, "hasBundleIdentifier"))
    {
      -[NSObject bundleIdentifier](v5, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __53__ICInAppMessageManager__addMessageEntry_completion___block_invoke_319;
      v51[3] = &unk_1E4390278;
      v52 = v5;
      v53 = *(id *)(a1 + 48);
      +[ICInAppMessageUserNotificationCoordinator addBadgeIconForBundleIdentifier:completion:](ICInAppMessageUserNotificationCoordinator, "addBadgeIconForBundleIdentifier:completion:", v8, v51);

    }
    objc_msgSend(*(id *)(a1 + 40), "localNotification");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_41;
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v10 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v59 = v4;
      v60 = 2114;
      v61 = v10;
      _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Processing local user notification in message %{public}@", buf, 0x16u);

    }
    v11 = objc_alloc(MEMORY[0x1E0CFE2F0]);
    objc_msgSend(*(id *)(a1 + 48), "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 1);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithBundleIDs:states:", v13, *MEMORY[0x1E0CFE290]);

    objc_msgSend(*(id *)(a1 + 48), "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = objc_msgSend(v14, "applicationStateForApplication:", v15);

    objc_msgSend(v14, "invalidate");
    if ((v13 & 8) != 0)
    {
      v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v28 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v59 = v4;
        v60 = 2114;
        v61 = v28;
        _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Not posting local notification in message %{public}@ because the target app is in the foreground", buf, 0x16u);

      }
      goto LABEL_40;
    }
    -[NSObject notification](v6, "notification");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v29 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v59 = v4;
        v60 = 2114;
        v61 = v29;
        _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring local notification in message %{public}@ because the notification string was not provided", buf, 0x16u);

      }
      goto LABEL_39;
    }
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v16, 0);
    v48 = (void *)v17;
    v49 = v16;
    if (v17)
    {
      v50 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v17, 0, &v50);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v50;
      if (v18)
      {
        objc_msgSend(*(id *)(a1 + 48), "bundleIdentifier");
        v47 = objc_claimAutoreleasedReturnValue();
        if (v47)
        {
          v45 = v19;
          _ICLogCategoryDefault_Oversize();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v59 = v4;
            v60 = 2114;
            v61 = v18;
            _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Extracted notification content: %{public}@", buf, 0x16u);
          }
          v46 = v18;

          +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "DSIDForUserIdentity:outError:", v21, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringValue");
          v23 = objc_claimAutoreleasedReturnValue();

          v44 = (void *)v23;
          if (v23)
          {
            v54[0] = CFSTR("0");
            v54[1] = CFSTR("1");
            v55[0] = v23;
            v55[1] = &unk_1E43E6568;
            v54[2] = CFSTR("2");
            v54[3] = CFSTR("aps");
            v55[2] = v47;
            v55[3] = v46;
            v24 = (void *)MEMORY[0x1E0C99D80];
            v25 = v55;
            v26 = v54;
            v27 = 4;
          }
          else
          {
            _ICLogCategoryDefault();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
              v36 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v59 = v4;
              v60 = 2114;
              v61 = v36;
              _os_log_impl(&dword_1A03E3000, v35, OS_LOG_TYPE_ERROR, "%{public}@ Could not get DSID for userIdentity=%{public}@.", buf, 0x16u);

            }
            v56[0] = CFSTR("1");
            v56[1] = CFSTR("2");
            v57[0] = &unk_1E43E6568;
            v57[1] = v47;
            v56[2] = CFSTR("aps");
            v57[2] = v46;
            v24 = (void *)MEMORY[0x1E0C99D80];
            v25 = v57;
            v26 = v56;
            v27 = 3;
          }
          objc_msgSend(v24, "dictionaryWithObjects:forKeys:count:", v25, v26, v27);
          v37 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "bundleIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v37;
          v39 = +[ICInAppMessageUserNotificationCoordinator scheduleNotificationWithPayload:forBundleIdentifier:](ICInAppMessageUserNotificationCoordinator, "scheduleNotificationWithPayload:forBundleIdentifier:", v37, v38);

          if (!v39)
          {
            _ICLogCategoryDefault_Oversize();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(*(id *)(a1 + 40), "identifier");
              v41 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v59 = v4;
              v60 = 2114;
              v61 = v41;
              v62 = 2114;
              v63 = v49;
              _os_log_impl(&dword_1A03E3000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to process notification for message %{public}@. payload=%{public}@", buf, 0x20u);

            }
          }

          v19 = v45;
          v18 = v46;
          v33 = v43;
        }
        else
        {
          _ICLogCategoryDefault();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            v34 = *(NSObject **)(a1 + 48);
            *(_DWORD *)buf = 138543618;
            v59 = v4;
            v60 = 2114;
            v61 = v34;
            _os_log_impl(&dword_1A03E3000, v33, OS_LOG_TYPE_ERROR, "%{public}@ Skipping notification for messageEntry=%{public}@ as there is no bundleIdentifier", buf, 0x16u);
          }
        }

        v30 = (os_log_t)v47;
LABEL_38:

        v16 = v49;
LABEL_39:

LABEL_40:
        goto LABEL_41;
      }
    }
    else
    {
      v19 = 0;
    }
    v30 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v31 = v19;
      v32 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v59 = v4;
      v60 = 2114;
      v61 = v32;
      v62 = 2114;
      v63 = v31;
      v64 = 2114;
      v65 = v49;
      _os_log_impl(&dword_1A03E3000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to parse notification for message %{public}@. err=%{public}@, payload=%{public}@", buf, 0x2Au);

      v19 = v31;
    }
    v18 = 0;
    goto LABEL_38;
  }
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v59 = v4;
    v60 = 2114;
    v61 = v6;
    v62 = 2114;
    v63 = v3;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to add message %{public}@. err=%{public}@", buf, 0x20u);
LABEL_41:

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __53__ICInAppMessageManager__addMessageEntry_completion___block_invoke_319(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543874;
      v8 = v5;
      v9 = 2114;
      v10 = v6;
      v11 = 2114;
      v12 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Failed to badge application with bundleId=%{public}@ and badgeId=%{public}@. err=%{public}@", (uint8_t *)&v7, 0x20u);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setIsBadgingApplication:", 1);
  }

}

void __57__ICInAppMessageManager__processSyncResponse_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t i;
  void *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  const char *v19;
  id *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  __CFString *v24;
  id v25;
  uint64_t v26;
  __CFString *v27;
  void *v28;
  ICInAppMessageEntry *v29;
  dispatch_semaphore_t v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  dispatch_semaphore_t v34;
  id v35;
  void *v36;
  dispatch_semaphore_t v37;
  id v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  NSObject *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  unint64_t v48;
  void *v49;
  unint64_t v50;
  NSObject *log;
  _QWORD v52[5];
  id v53;
  _QWORD *v54;
  _QWORD v55[4];
  NSObject *v56;
  _BYTE *v57;
  _QWORD v58[4];
  NSObject *v59;
  _BYTE *v60;
  _QWORD v61[4];
  NSObject *v62;
  NSObject *v63;
  _QWORD *v64;
  _BYTE *v65;
  _QWORD v66[3];
  char v67;
  uint8_t v68[4];
  id v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  __CFString *v73;
  __int16 v74;
  void *v75;
  _BYTE buf[24];
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v46 = v5;
  v47 = a3;
  if (v47)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = a1[4];
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v47;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to get current server revision from message store. err=%{public}@", buf, 0x16u);
    }

    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v77 = __Block_byref_object_copy__2347;
    v78 = __Block_byref_object_dispose__2348;
    v79 = 0;
    v8 = objc_msgSend(v5, "longLongValue");
    v48 = 0;
    v66[0] = 0;
    v66[1] = v66;
    v9 = "com.apple.amp.iTunesCloud";
    v10 = "Default";
    v66[2] = 0x2020000000;
    v67 = 0;
    while (1)
    {
      v11 = objc_msgSend(a1[5], "applicationMessageSyncResponsesCount");
      v12 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      if (v48 >= v11)
        break;
      if (v12)
        goto LABEL_32;
      objc_msgSend(a1[5], "applicationMessageSyncResponsesAtIndex:", v48);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bundleID");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 0; i < objc_msgSend(v13, "syncCommandsCount") && !*(_QWORD *)(*(_QWORD *)&buf[8] + 40); ++i)
      {
        objc_msgSend(v13, "syncCommandsAtIndex:", i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "commandSerialNumber") <= v8)
        {
          log = os_log_create(v9, v10);
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            v25 = a1[4];
            v26 = objc_msgSend(v15, "commandSerialNumber");
            *(_DWORD *)v68 = 138543874;
            v69 = v25;
            v70 = 2048;
            v71 = v26;
            v72 = 2048;
            v73 = (__CFString *)v8;
            _os_log_impl(&dword_1A03E3000, log, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring sync command we've already applied (serial# %lld, currentRevision=%lld)", v68, 0x20u);
          }
        }
        else
        {
          objc_msgSend(v15, "applicationMessage");
          log = objc_claimAutoreleasedReturnValue();
          v16 = os_log_create(v9, v10);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v50 = i;
            v17 = v13;
            v18 = v10;
            v19 = v9;
            v20 = a1;
            v21 = a1[4];
            v22 = objc_msgSend(v15, "commandSerialNumber");
            v23 = objc_msgSend(v15, "commandType");
            if (v23 >= 4)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v23);
              v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v24 = off_1E438A228[v23];
            }
            v27 = v24;
            -[NSObject identifier](log, "identifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v68 = 138544130;
            v69 = v21;
            v70 = 2048;
            v71 = v22;
            v72 = 2114;
            v73 = v27;
            v74 = 2114;
            v75 = v28;
            _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Processing sync command #%lld: %{public}@ %{public}@", v68, 0x2Au);

            a1 = v20;
            v9 = v19;
            v10 = v18;
            v13 = v17;
            i = v50;

          }
          switch(objc_msgSend(v15, "commandType"))
          {
            case 0u:
              v29 = -[ICInAppMessageEntry initWithApplicationMessage:bundleIdentifier:]([ICInAppMessageEntry alloc], "initWithApplicationMessage:bundleIdentifier:", log, v49);
              v30 = dispatch_semaphore_create(0);
              v31 = a1[4];
              v61[0] = MEMORY[0x1E0C809B0];
              v61[1] = 3221225472;
              v61[2] = __57__ICInAppMessageManager__processSyncResponse_completion___block_invoke_316;
              v61[3] = &unk_1E4389FB8;
              v32 = v29;
              v62 = v32;
              v64 = v66;
              v65 = buf;
              v33 = v30;
              v63 = v33;
              objc_msgSend(v31, "_addMessageEntry:completion:", v32, v61);
              dispatch_semaphore_wait(v33, 0xFFFFFFFFFFFFFFFFLL);

              goto LABEL_23;
            case 1u:
              v34 = dispatch_semaphore_create(0);
              v35 = a1[4];
              -[NSObject identifier](log, "identifier");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v58[0] = MEMORY[0x1E0C809B0];
              v58[1] = 3221225472;
              v58[2] = __57__ICInAppMessageManager__processSyncResponse_completion___block_invoke_2;
              v58[3] = &unk_1E438AE40;
              v60 = buf;
              v32 = v34;
              v59 = v32;
              objc_msgSend(v35, "_removeMessageEntryWithIdentifier:forBundleIdentifier:completion:", v36, v49, v58);

              dispatch_semaphore_wait(v32, 0xFFFFFFFFFFFFFFFFLL);
              v33 = v59;
              goto LABEL_23;
            case 2u:
              v37 = dispatch_semaphore_create(0);
              v38 = a1[4];
              v55[0] = MEMORY[0x1E0C809B0];
              v55[1] = 3221225472;
              v55[2] = __57__ICInAppMessageManager__processSyncResponse_completion___block_invoke_3;
              v55[3] = &unk_1E438AE40;
              v57 = buf;
              v32 = v37;
              v56 = v32;
              objc_msgSend(v38, "_removeAllMessageEntriesForBundleIdentifier:completion:", v49, v55);
              dispatch_semaphore_wait(v32, 0xFFFFFFFFFFFFFFFFLL);
              v33 = v56;
LABEL_23:

              break;
            case 3u:
              objc_msgSend(a1[4], "resetMessagesWithCompletion:", &__block_literal_global_317);
              break;
            default:
              break;
          }
          if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
          {
            v39 = os_log_create(v9, v10);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              v40 = a1[4];
              v41 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
              *(_DWORD *)v68 = 138543618;
              v69 = v40;
              v70 = 2114;
              v71 = v41;
              _os_log_impl(&dword_1A03E3000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to process sync command. err=%{public}@", v68, 0x16u);
            }

          }
        }

        v8 = objc_msgSend(v15, "commandSerialNumber");
      }

      ++v48;
    }
    if (v12)
    {
LABEL_32:
      (*((void (**)(void))a1[6] + 2))();
      goto LABEL_33;
    }
    v42 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = a1[4];
      *(_DWORD *)v68 = 138543618;
      v69 = v43;
      v70 = 2048;
      v71 = v8;
      _os_log_impl(&dword_1A03E3000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished processing sync commands. currentSyncRevision=%lld", v68, 0x16u);
    }

    v44 = (void *)*((_QWORD *)a1[4] + 5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __57__ICInAppMessageManager__processSyncResponse_completion___block_invoke_318;
    v52[3] = &unk_1E438A000;
    v53 = a1[6];
    v54 = v66;
    v52[4] = a1[4];
    objc_msgSend(v44, "updateStoreProperty:forKey:completion:", v45, CFSTR("serverRevision"), v52);

LABEL_33:
    _Block_object_dispose(v66, 8);
    _Block_object_dispose(buf, 8);

  }
}

void __57__ICInAppMessageManager__processSyncResponse_completion___block_invoke_316(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "shouldDownloadResources"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;
  v6 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __57__ICInAppMessageManager__processSyncResponse_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __57__ICInAppMessageManager__processSyncResponse_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __57__ICInAppMessageManager__processSyncResponse_completion___block_invoke_318(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "_checkForMessageResourcesNeedingDownloadForcingIfNecessary:", 1);
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("com.apple.itunescloud.ICInAppMessagesDidChangeDistributedNotification"), 0);

}

void __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v12 = v5;
      v13 = 2114;
      v14 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to update sync pending flag. err=%{public}@", buf, 0x16u);
    }

  }
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_308;
  v9[3] = &unk_1E4389F90;
  v8 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  objc_msgSend(v6, "getPropertiesForUserIdentity:completionHandler:", v7, v9);

}

void __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_308(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v26 = v8;
      v27 = 2114;
      v28 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to get properties for active account for sync. err=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_15;
  }
  if (!v5)
  {
    v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v26 = v14;
      _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Not performing sync because there's no active account", buf, 0xCu);
    }

    v15 = *(void **)(a1 + 40);
    v16 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_309;
    v23[3] = &unk_1E438E500;
    v24 = v15;
    objc_msgSend(v16, "updateStoreProperty:forKey:completion:", MEMORY[0x1E0C9AAA0], CFSTR("syncPending"), v23);
    v17 = v24;
    goto LABEL_14;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "_privacyAcknowledgementRequired"))
  {
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(a1 + 40);
    v20 = *(void **)(v18 + 40);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_310;
    v21[3] = &unk_1E4389E58;
    v21[4] = v18;
    v22 = v19;
    objc_msgSend(v20, "getStorePropertyForKey:completion:", CFSTR("serverRevision"), v21);
    v17 = v22;
LABEL_14:

    goto LABEL_15;
  }
  v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v26 = v10;
    _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Not syncing because privacy acknowledgement is required", buf, 0xCu);
  }

  v11 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7007, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

LABEL_15:
}

uint64_t __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_309(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_310(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v20 = v8;
      v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to get current server revision from message store. err=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_311;
    v15[3] = &unk_1E438EF88;
    v12 = v5;
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    v16 = v12;
    v17 = v13;
    v18 = v14;
    objc_msgSend(v10, "updateStoreProperty:forKey:completion:", v11, CFSTR("lastSyncAttempt"), v15);

  }
}

void __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_311(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  ICInAppMessageSyncRequest *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "longLongValue");
  objc_msgSend(*(id *)(a1 + 40), "_storeRequestContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICInAppMessageSyncRequest initWithStoreRequestContext:fromRevision:]([ICInAppMessageSyncRequest alloc], "initWithStoreRequestContext:fromRevision:", v3, v2);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_2;
  v6[3] = &unk_1E4389F68;
  v5 = *(void **)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v5;
  -[ICInAppMessageSyncRequest performRequestWithResponseHandler:](v4, "performRequestWithResponseHandler:", v6);

}

void __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v13 = v7;
      v14 = 2114;
      v15 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Sync request failed. err=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_313;
    v9[3] = &unk_1E43915E8;
    v8 = *(void **)(a1 + 40);
    v10 = *(id *)(a1 + 32);
    v11 = v8;
    objc_msgSend(v10, "_processSyncResponse:completion:", a2, v9);

  }
}

void __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_313(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Sync completed. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_314;
  v9[3] = &unk_1E43915E8;
  v10 = v3;
  v11 = v6;
  v8 = v3;
  objc_msgSend(v7, "updateStoreProperty:forKey:completion:", MEMORY[0x1E0C9AAA0], CFSTR("syncPending"), v9);

}

uint64_t __52__ICInAppMessageManager__performSyncWithCompletion___block_invoke_314(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __45__ICInAppMessageManager__storeRequestContext__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  ICStoreURLResponseAuthenticationProvider *v4;
  id v5;

  v5 = a2;
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentity:", v3);

  objc_msgSend(v5, "setIdentityStore:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v4 = -[ICURLResponseAuthenticationProvider initWithUserInteractionLevel:]([ICStoreURLResponseAuthenticationProvider alloc], "initWithUserInteractionLevel:", 1);
  objc_msgSend(v5, "setAuthenticationProvider:", v4);

  objc_msgSend(v5, "setAllowsExpiredBags:", 1);
  objc_msgSend(v5, "setPersonalizationStyle:", 2);

}

void __48__ICInAppMessageManager__schedulePeriodicUpdate__block_invoke(uint64_t a1, void *a2)
{
  int64_t v3;
  void *v4;
  char v5;
  int64_t v6;
  NSObject *v7;
  uint64_t v8;
  int64_t v9;
  NSObject *v10;
  uint64_t v11;
  xpc_object_t v12;
  _QWORD handler[5];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  int64_t v17;
  __int16 v18;
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a2, "syncPollingInterval");
  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "bypassBagSanityChecks");

  v6 = *MEMORY[0x1E0C807B8];
  if ((v5 & 1) == 0 && v3 < v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v15 = v8;
      v16 = 2048;
      v17 = v3;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Adjusting bag refresh interval of %llds --> 7 days", buf, 0x16u);
    }

    v3 = *MEMORY[0x1E0C807E8];
  }
  if (v3 >= v6)
    v9 = *MEMORY[0x1E0C807C0];
  else
    v9 = 10;
  v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v15 = v11;
    v16 = 2048;
    v17 = v3;
    v18 = 2048;
    v19 = v9;
    _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting timer to perform periodic poll for %llds (+/- %llds)", buf, 0x20u);
  }

  v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v12, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
  xpc_dictionary_set_BOOL(v12, (const char *)*MEMORY[0x1E0C80898], 0);
  xpc_dictionary_set_int64(v12, (const char *)*MEMORY[0x1E0C807A8], v3);
  xpc_dictionary_set_int64(v12, (const char *)*MEMORY[0x1E0C80790], v9);
  xpc_dictionary_set_BOOL(v12, (const char *)*MEMORY[0x1E0C808D8], 0);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __48__ICInAppMessageManager__schedulePeriodicUpdate__block_invoke_301;
  handler[3] = &unk_1E438D828;
  handler[4] = *(_QWORD *)(a1 + 32);
  xpc_activity_register("com.apple.itunescloud.ICInAppMessageManager.periodic-poll-activity", v12, handler);

}

uint64_t __48__ICInAppMessageManager__schedulePeriodicUpdate__block_invoke_301(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v8 = v3;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing periodic sync", buf, 0xCu);
  }

  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__ICInAppMessageManager__schedulePeriodicUpdate__block_invoke_302;
  v6[3] = &unk_1E43902A0;
  v6[4] = v4;
  return objc_msgSend(v4, "flushEventsWithCompletion:", v6);
}

uint64_t __48__ICInAppMessageManager__schedulePeriodicUpdate__block_invoke_302(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__ICInAppMessageManager__schedulePeriodicUpdate__block_invoke_2;
  v3[3] = &unk_1E43902A0;
  v3[4] = v1;
  return objc_msgSend(v1, "syncMessagesWithCompletion:", v3);
}

void __48__ICInAppMessageManager__schedulePeriodicUpdate__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Periodic sync completed. err=%{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_performCacheConsistencyCheck");
  objc_msgSend(*(id *)(a1 + 32), "_schedulePeriodicUpdate");

}

void __45__ICInAppMessageManager__xpcClientConnection__block_invoke_298(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "Connection to in-app message service invalidated", v5, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 104);
  *(_QWORD *)(v3 + 104) = 0;

}

void __45__ICInAppMessageManager__xpcClientConnection__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A03E3000, v0, OS_LOG_TYPE_DEFAULT, "Connection to in-app message service interrupted", v1, 2u);
  }

}

void __71__ICInAppMessageManager__handleUserIdentityStoreDidChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__ICInAppMessageManager__handleUserIdentityStoreDidChangeNotification___block_invoke_2;
  v8[3] = &unk_1E4389EF8;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  objc_msgSend(v4, "getPropertiesForUserIdentity:completionHandler:", v5, v8);

}

void __71__ICInAppMessageManager__handleUserIdentityStoreDidChangeNotification___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "Failed to get account properties. err=%{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__ICInAppMessageManager__handleUserIdentityStoreDidChangeNotification___block_invoke_196;
    v12[3] = &unk_1E4389ED0;
    v13 = v8;
    v10 = v5;
    v11 = *(_QWORD *)(a1 + 40);
    v14 = v10;
    v15 = v11;
    objc_msgSend(v9, "getStorePropertyForKey:completion:", CFSTR("accountDSID"), v12);

  }
}

void __71__ICInAppMessageManager__handleUserIdentityStoreDidChangeNotification___block_invoke_196(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get message store account property. err=%{public}@", buf, 0xCu);
    }

    v7 = *(void **)(a1 + 32);
    v8 = v5;
    goto LABEL_7;
  }
  v9 = objc_msgSend(a2, "longLongValue");
  objc_msgSend(*(id *)(a1 + 40), "DSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "longLongValue");

  if (v11 == v9)
  {
    v7 = *(void **)(a1 + 32);
    v8 = 0;
LABEL_7:
    objc_msgSend(v7, "finishWithError:", v8);
    goto LABEL_8;
  }
  v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v20 = v13;
    v21 = 2048;
    v22 = v9;
    v23 = 2048;
    v24 = v11;
    _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ account changed from %lld --> %lld - performing reset", buf, 0x20u);
  }

  v14 = *(_QWORD *)(a1 + 48);
  v15 = *(void **)(v14 + 40);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__ICInAppMessageManager__handleUserIdentityStoreDidChangeNotification___block_invoke_197;
  v16[3] = &unk_1E4389EA8;
  v16[4] = v14;
  v17 = *(id *)(a1 + 32);
  v18 = v11;
  objc_msgSend(v15, "resetStoreWithCompletion:", v16);

LABEL_8:
}

void __71__ICInAppMessageManager__handleUserIdentityStoreDidChangeNotification___block_invoke_197(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v12 = v5;
      v13 = 2114;
      v14 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to reset message store. err=%{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
  }
  else
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __71__ICInAppMessageManager__handleUserIdentityStoreDidChangeNotification___block_invoke_199;
    v9[3] = &unk_1E4390278;
    v8 = *(void **)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v8;
    objc_msgSend(v6, "updateStoreProperty:forKey:completion:", v7, CFSTR("accountDSID"), v9);

  }
}

void __71__ICInAppMessageManager__handleUserIdentityStoreDidChangeNotification___block_invoke_199(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v11 = v5;
      v12 = 2114;
      v13 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to update message store account property. err=%{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __71__ICInAppMessageManager__handleUserIdentityStoreDidChangeNotification___block_invoke_200;
    v7[3] = &unk_1E4390278;
    v6 = *(void **)(a1 + 40);
    v8 = *(id *)(a1 + 32);
    v9 = v6;
    objc_msgSend(v8, "_performSyncWithCompletion:", v7);

  }
}

void __71__ICInAppMessageManager__handleUserIdentityStoreDidChangeNotification___block_invoke_200(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138543618;
      v7 = v5;
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to sync after the reset. err=%{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);

}

void __104__ICInAppMessageManager_removeApplicationBadgeForBundleIdentifier_fromPresentedMessageEntry_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  NSObject *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "applicationMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      v16 = v7;
      v17 = 2114;
      v18 = v8;
      v19 = 2114;
      v20 = v5;
      v21 = 2114;
      v22 = v3;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to remove badge for application with bundleId=%{public}@ and messageId=%{public}@. err=%{public}@", buf, 0x2Au);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "setIsBadgingApplication:", 0);
    v9 = *(void **)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 56);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __104__ICInAppMessageManager_removeApplicationBadgeForBundleIdentifier_fromPresentedMessageEntry_completion___block_invoke_195;
    v11[3] = &unk_1E4389E80;
    v12 = 0;
    v13 = v9;
    v14 = v5;
    objc_msgSend(v9, "updateMessageEntry:completion:", v10, v11);

    v6 = v12;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __104__ICInAppMessageManager_removeApplicationBadgeForBundleIdentifier_fromPresentedMessageEntry_completion___block_invoke_195(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1[4])
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = a1[5];
      v6 = a1[6];
      v7 = 138543874;
      v8 = v5;
      v9 = 2114;
      v10 = v6;
      v11 = 2114;
      v12 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to update messageEntry for messageId=%{public}@. err=%{public}@", (uint8_t *)&v7, 0x20u);
    }

  }
}

void __72__ICInAppMessageManager_setProperty_forKey_bundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__ICInAppMessageManager_setProperty_forKey_bundleIdentifier_completion___block_invoke_193;
  v9[3] = &unk_1E4390EF8;
  v10 = v3;
  v11 = v6;
  v8 = v3;
  dispatch_async(v7, v9);

}

void __72__ICInAppMessageManager_setProperty_forKey_bundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__ICInAppMessageManager_setProperty_forKey_bundleIdentifier_completion___block_invoke_3;
  v7[3] = &unk_1E4390EF8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __72__ICInAppMessageManager_setProperty_forKey_bundleIdentifier_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__ICInAppMessageManager_setProperty_forKey_bundleIdentifier_completion___block_invoke_5;
  v7[3] = &unk_1E4390EF8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __72__ICInAppMessageManager_setProperty_forKey_bundleIdentifier_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __72__ICInAppMessageManager_setProperty_forKey_bundleIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __72__ICInAppMessageManager_setProperty_forKey_bundleIdentifier_completion___block_invoke_193(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __71__ICInAppMessageManager_getPropertyForKey_bundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__ICInAppMessageManager_getPropertyForKey_bundleIdentifier_completion___block_invoke_192;
  v9[3] = &unk_1E4390EF8;
  v10 = v3;
  v11 = v6;
  v8 = v3;
  dispatch_async(v7, v9);

}

uint64_t __71__ICInAppMessageManager_getPropertyForKey_bundleIdentifier_completion___block_invoke_192(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __61__ICInAppMessageManager_setGlobalProperty_forKey_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__ICInAppMessageManager_setGlobalProperty_forKey_completion___block_invoke_191;
  v9[3] = &unk_1E4390EF8;
  v10 = v3;
  v11 = v6;
  v8 = v3;
  dispatch_async(v7, v9);

}

void __61__ICInAppMessageManager_setGlobalProperty_forKey_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__ICInAppMessageManager_setGlobalProperty_forKey_completion___block_invoke_3;
  v7[3] = &unk_1E4390EF8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __61__ICInAppMessageManager_setGlobalProperty_forKey_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__ICInAppMessageManager_setGlobalProperty_forKey_completion___block_invoke_5;
  v7[3] = &unk_1E4390EF8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __61__ICInAppMessageManager_setGlobalProperty_forKey_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __61__ICInAppMessageManager_setGlobalProperty_forKey_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __61__ICInAppMessageManager_setGlobalProperty_forKey_completion___block_invoke_191(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __60__ICInAppMessageManager_getGlobalPropertyForKey_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__ICInAppMessageManager_getGlobalPropertyForKey_completion___block_invoke_190;
  v9[3] = &unk_1E4390EF8;
  v10 = v3;
  v11 = v6;
  v8 = v3;
  dispatch_async(v7, v9);

}

void __60__ICInAppMessageManager_getGlobalPropertyForKey_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__ICInAppMessageManager_getGlobalPropertyForKey_completion___block_invoke_3;
  block[3] = &unk_1E4390E58;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

void __60__ICInAppMessageManager_getGlobalPropertyForKey_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__ICInAppMessageManager_getGlobalPropertyForKey_completion___block_invoke_5;
  block[3] = &unk_1E4390E58;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __60__ICInAppMessageManager_getGlobalPropertyForKey_completion___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __60__ICInAppMessageManager_getGlobalPropertyForKey_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __60__ICInAppMessageManager_getGlobalPropertyForKey_completion___block_invoke_190(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_187;
  v9[3] = &unk_1E4390EF8;
  v10 = v3;
  v11 = v6;
  v8 = v3;
  dispatch_async(v7, v9);

}

void __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_3;
  v7[3] = &unk_1E4390EF8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(v4 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_5;
  v10[3] = &unk_1E438EF88;
  v10[4] = v4;
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v11 = v3;
  v12 = v8;
  v9 = v3;
  objc_msgSend(v6, "removeMetadataForMessageIdentifier:bundleIdentifier:completion:", v5, v7, v10);

}

void __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_6;
  v10 = &unk_1E4390EF8;
  v5 = *(id *)(a1 + 48);
  v11 = v3;
  v12 = v5;
  v6 = v3;
  dispatch_async(v4, &v7);
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v6, v7, v8, v9, v10);

}

uint64_t __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __88__ICInAppMessageManager_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_187(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_184;
  v9[3] = &unk_1E4390EF8;
  v10 = v3;
  v11 = v6;
  v8 = v3;
  dispatch_async(v7, v9);

}

void __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_3;
  v7[3] = &unk_1E4390EF8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(v4 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_5;
  v11[3] = &unk_1E438EF88;
  v11[4] = v4;
  v9 = *(id *)(a1 + 64);
  v12 = v3;
  v13 = v9;
  v10 = v3;
  objc_msgSend(v6, "updateMetadata:messageIdentifier:bundleIdentifier:completion:", v5, v7, v8, v11);

}

void __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_6;
  v10 = &unk_1E4390EF8;
  v5 = *(id *)(a1 + 48);
  v11 = v3;
  v12 = v5;
  v6 = v3;
  dispatch_async(v4, &v7);
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v6, v7, v8, v9, v10);

}

uint64_t __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __86__ICInAppMessageManager_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_184(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __71__ICInAppMessageManager_getAllMetadataForBundleIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__ICInAppMessageManager_getAllMetadataForBundleIdentifiers_completion___block_invoke_182;
  v9[3] = &unk_1E4390EF8;
  v10 = v3;
  v11 = v6;
  v8 = v3;
  dispatch_async(v7, v9);

}

void __71__ICInAppMessageManager_getAllMetadataForBundleIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__ICInAppMessageManager_getAllMetadataForBundleIdentifiers_completion___block_invoke_3;
  block[3] = &unk_1E4390E58;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

void __71__ICInAppMessageManager_getAllMetadataForBundleIdentifiers_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__ICInAppMessageManager_getAllMetadataForBundleIdentifiers_completion___block_invoke_5;
  block[3] = &unk_1E4390E58;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __71__ICInAppMessageManager_getAllMetadataForBundleIdentifiers_completion___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __71__ICInAppMessageManager_getAllMetadataForBundleIdentifiers_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __71__ICInAppMessageManager_getAllMetadataForBundleIdentifiers_completion___block_invoke_182(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __85__ICInAppMessageManager_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__ICInAppMessageManager_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_179;
  v9[3] = &unk_1E4390EF8;
  v10 = v3;
  v11 = v6;
  v8 = v3;
  dispatch_async(v7, v9);

}

void __85__ICInAppMessageManager_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__ICInAppMessageManager_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_3;
  block[3] = &unk_1E4390E58;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

void __85__ICInAppMessageManager_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unint64_t v6;
  id v7;
  ICInAppMessageMetadataEntry *v8;
  void *v9;
  NSObject *v10;
  id v11;
  ICInAppMessageMetadataEntry *v12;
  _QWORD block[4];
  ICInAppMessageMetadataEntry *v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = (ICInAppMessageMetadataEntry *)v7;
  if (!((unint64_t)v7 | v6))
    v8 = objc_alloc_init(ICInAppMessageMetadataEntry);
  v9 = *(void **)(a1 + 40);
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__ICInAppMessageManager_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_5;
  block[3] = &unk_1E4390E58;
  v15 = (id)v6;
  v16 = v9;
  v14 = v8;
  v11 = (id)v6;
  v12 = v8;
  dispatch_async(v10, block);

}

uint64_t __85__ICInAppMessageManager_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __85__ICInAppMessageManager_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __85__ICInAppMessageManager_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_179(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __98__ICInAppMessageManager_clearCachedResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __98__ICInAppMessageManager_clearCachedResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_178;
  v9[3] = &unk_1E4390EF8;
  v10 = v3;
  v11 = v6;
  v8 = v3;
  dispatch_async(v7, v9);

}

void __98__ICInAppMessageManager_clearCachedResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __98__ICInAppMessageManager_clearCachedResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_3;
  v7[3] = &unk_1E4390EF8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __98__ICInAppMessageManager_clearCachedResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __98__ICInAppMessageManager_clearCachedResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __98__ICInAppMessageManager_clearCachedResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_178(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_175;
  v9[3] = &unk_1E4390EF8;
  v10 = v3;
  v11 = v6;
  v8 = v3;
  dispatch_async(v7, v9);

}

void __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_3;
  v7[3] = &unk_1E4390EF8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  ICAsyncBlockOperation *v3;
  void *v4;
  ICAsyncBlockOperation *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v3 = [ICAsyncBlockOperation alloc];
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_5;
    v9 = &unk_1E438FB38;
    v4 = *(void **)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = v4;
    v12 = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    v5 = -[ICAsyncBlockOperation initWithStartHandler:](v3, "initWithStartHandler:", &v6);
    -[ICAsyncBlockOperation setName:](v5, "setName:", CFSTR("com.apple.iTunesCloud.ICInAppMessageManager.downloadResourcesForMessageWithIdentifier"), v6, v7, v8, v9, v10);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addOperation:", v5);

  }
}

void __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_6;
  v9[3] = &unk_1E43915E8;
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v10 = v3;
  v11 = v7;
  v8 = v3;
  objc_msgSend(v4, "_downloadResourcesForMessageWithIdentifier:bundleIdentifier:completion:", v5, v6, v9);

}

void __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);

}

uint64_t __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __95__ICInAppMessageManager_downloadResourcesForMessageWithIdentifier_bundleIdentifier_completion___block_invoke_175(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_164;
  v9[3] = &unk_1E4390EF8;
  v10 = v3;
  v11 = v6;
  v8 = v3;
  dispatch_async(v7, v9);

}

void __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_3;
  v7[3] = &unk_1E4390EF8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_166(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_2_167;
  v9[3] = &unk_1E438FEF0;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v7;
  v12 = v6;
  v8 = v3;
  objc_msgSend(v5, "pendingMessageEventsWithCompletion:", v9);

}

void __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_2_167(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  dispatch_semaphore_t v13;
  ICInAppReportEventRequest *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  ICInAppReportEventRequest *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  void *v22;
  id obj;
  _QWORD v24[6];
  NSObject *v25;
  _BYTE *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  _BYTE buf[24];
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v21 = a2;
  v5 = a3;
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  v22 = v5;
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "Failed to load message events. err=%{public}@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);
  }
  else
  {
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = objc_msgSend(v21, "count");
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Flushing %d events", buf, 0x12u);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v33 = __Block_byref_object_copy__2347;
    v34 = __Block_byref_object_dispose__2348;
    v35 = 0;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v21;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v28;
LABEL_9:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v11);
        v13 = dispatch_semaphore_create(0);
        v14 = [ICInAppReportEventRequest alloc];
        objc_msgSend(*(id *)(a1 + 40), "_storeRequestContext");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "messageIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "params");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = -[ICInAppReportEventRequest initWithStoreRequestContext:messageIdentifier:params:](v14, "initWithStoreRequestContext:messageIdentifier:params:", v15, v16, v17);

        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_169;
        v24[3] = &unk_1E438E9C8;
        v26 = buf;
        v19 = *(_QWORD *)(a1 + 40);
        v24[4] = v12;
        v24[5] = v19;
        v20 = v13;
        v25 = v20;
        -[ICInAppReportEventRequest performRequestWithResponseHandler:](v18, "performRequestWithResponseHandler:", v24);
        dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
        LOBYTE(v17) = *(_QWORD *)(*(_QWORD *)&buf[8] + 40) == 0;

        if ((v17 & 1) == 0)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          if (v9)
            goto LABEL_9;
          break;
        }
      }
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    _Block_object_dispose(buf, 8);

  }
}

void __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_169(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "eventIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v12 = v6;
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "Failed to flush message event %{public}@. err=%{public}@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "updateStoreProperty:forKey:completion:", MEMORY[0x1E0C9AAB0], CFSTR("syncPending"), &__block_literal_global_171);
  }
  else
  {
    v8 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
    objc_msgSend(*(id *)(a1 + 32), "eventIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_2_172;
    v10[3] = &unk_1E43902A0;
    v10[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "removePendingMessageEventWithIdentifier:completion:", v9, v10);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_2_172(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "eventIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543618;
      v7 = v5;
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Failed to remove completed event %{public}@. err=%{public}@", (uint8_t *)&v6, 0x16u);

    }
  }

}

uint64_t __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __51__ICInAppMessageManager_flushEventsWithCompletion___block_invoke_164(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __96__ICInAppMessageManager_reportEventForMessageIdentifier_withParams_flushImmediately_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __96__ICInAppMessageManager_reportEventForMessageIdentifier_withParams_flushImmediately_completion___block_invoke_158;
  v9[3] = &unk_1E4390EF8;
  v10 = v3;
  v11 = v6;
  v8 = v3;
  dispatch_async(v7, v9);

}

void __96__ICInAppMessageManager_reportEventForMessageIdentifier_withParams_flushImmediately_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __96__ICInAppMessageManager_reportEventForMessageIdentifier_withParams_flushImmediately_completion___block_invoke_3;
  v7[3] = &unk_1E4390EF8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __96__ICInAppMessageManager_reportEventForMessageIdentifier_withParams_flushImmediately_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  ICInAppMessageEventEntry *v4;
  void *v5;
  ICInAppMessageEventEntry *v6;
  id v7;
  _QWORD v8[4];
  ICInAppMessageEventEntry *v9;
  id v10;
  id v11;
  id v12;
  char v13;
  id location;

  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v4 = -[ICInAppMessageEventEntry initWithMessageIdentifier:params:]([ICInAppMessageEventEntry alloc], "initWithMessageIdentifier:params:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __96__ICInAppMessageManager_reportEventForMessageIdentifier_withParams_flushImmediately_completion___block_invoke_5;
  v8[3] = &unk_1E4389DB8;
  objc_copyWeak(&v12, &location);
  v6 = v4;
  v9 = v6;
  v13 = *(_BYTE *)(a1 + 64);
  v11 = *(id *)(a1 + 56);
  v7 = v3;
  v10 = v7;
  objc_msgSend(v5, "addPendingMessageEvent:completion:", v6, v8);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __96__ICInAppMessageManager_reportEventForMessageIdentifier_withParams_flushImmediately_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      v8 = 138543618;
      v9 = WeakRetained;
      v10 = 2114;
      v11 = v3;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to add message event. err=%{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "eventIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = WeakRetained;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Added message event %{public}@ for message ", (uint8_t *)&v8, 0x16u);

  }
  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(WeakRetained, "flushEventsWithCompletion:", &__block_literal_global_161);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);

}

uint64_t __96__ICInAppMessageManager_reportEventForMessageIdentifier_withParams_flushImmediately_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __96__ICInAppMessageManager_reportEventForMessageIdentifier_withParams_flushImmediately_completion___block_invoke_158(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __53__ICInAppMessageManager_resetMessagesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__ICInAppMessageManager_resetMessagesWithCompletion___block_invoke_152;
  v9[3] = &unk_1E4390EF8;
  v10 = v3;
  v11 = v6;
  v8 = v3;
  dispatch_async(v7, v9);

}

void __53__ICInAppMessageManager_resetMessagesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__ICInAppMessageManager_resetMessagesWithCompletion___block_invoke_3;
  v7[3] = &unk_1E4390EF8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __53__ICInAppMessageManager_resetMessagesWithCompletion___block_invoke_153(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_resourceCacheDirectoryPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItemAtPath:error:", v4, 0);

  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__ICInAppMessageManager_resetMessagesWithCompletion___block_invoke_2_155;
  v9[3] = &unk_1E43915E8;
  v10 = v3;
  v11 = v6;
  v8 = v3;
  objc_msgSend(v7, "resetStoreWithCompletion:", v9);

}

void __53__ICInAppMessageManager_resetMessagesWithCompletion___block_invoke_2_155(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Failed to reset message store. err=%{public}@", (uint8_t *)&v5, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);

}

uint64_t __53__ICInAppMessageManager_resetMessagesWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __53__ICInAppMessageManager_resetMessagesWithCompletion___block_invoke_152(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __52__ICInAppMessageManager_syncMessagesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__ICInAppMessageManager_syncMessagesWithCompletion___block_invoke_149;
  v9[3] = &unk_1E4390EF8;
  v10 = v3;
  v11 = v6;
  v8 = v3;
  dispatch_async(v7, v9);

}

void __52__ICInAppMessageManager_syncMessagesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__ICInAppMessageManager_syncMessagesWithCompletion___block_invoke_3;
  v7[3] = &unk_1E4390EF8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __52__ICInAppMessageManager_syncMessagesWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__ICInAppMessageManager_syncMessagesWithCompletion___block_invoke_5;
  v7[3] = &unk_1E43915E8;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "_performSyncWithCompletion:", v7);

}

void __52__ICInAppMessageManager_syncMessagesWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);

}

uint64_t __52__ICInAppMessageManager_syncMessagesWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __52__ICInAppMessageManager_syncMessagesWithCompletion___block_invoke_149(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __89__ICInAppMessageManager_addMessageEntryFromAMSDialogRequest_bundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v12 = v4;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished adding message for dialog request. err=%{public}@", buf, 0x16u);
  }

  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    +[ICInAppMessageManager sharedManager](ICInAppMessageManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __89__ICInAppMessageManager_addMessageEntryFromAMSDialogRequest_bundleIdentifier_completion___block_invoke_148;
    v9[3] = &unk_1E438E500;
    v8 = *(_QWORD *)(a1 + 48);
    v10 = *(id *)(a1 + 56);
    objc_msgSend(v6, "downloadResourcesForMessageWithIdentifier:bundleIdentifier:completion:", v7, v8, v9);

  }
}

uint64_t __89__ICInAppMessageManager_addMessageEntryFromAMSDialogRequest_bundleIdentifier_completion___block_invoke_148(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__ICInAppMessageManager_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__ICInAppMessageManager_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_47;
  v9[3] = &unk_1E4390EF8;
  v10 = v3;
  v11 = v6;
  v8 = v3;
  dispatch_async(v7, v9);

}

void __79__ICInAppMessageManager_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__ICInAppMessageManager_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_3;
  v7[3] = &unk_1E4390EF8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __79__ICInAppMessageManager_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__ICInAppMessageManager_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_5;
  v8[3] = &unk_1E43915E8;
  v6 = *(id *)(a1 + 48);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  objc_msgSend(v4, "_removeAllMessageEntriesForBundleIdentifier:completion:", v5, v8);

}

void __79__ICInAppMessageManager_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);

}

uint64_t __79__ICInAppMessageManager_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __79__ICInAppMessageManager_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_47(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __89__ICInAppMessageManager_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __89__ICInAppMessageManager_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_44;
  v9[3] = &unk_1E4390EF8;
  v10 = v3;
  v11 = v6;
  v8 = v3;
  dispatch_async(v7, v9);

}

void __89__ICInAppMessageManager_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__ICInAppMessageManager_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_3;
  v7[3] = &unk_1E4390EF8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __89__ICInAppMessageManager_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __89__ICInAppMessageManager_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_5;
  v9[3] = &unk_1E43915E8;
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v10 = v3;
  v11 = v7;
  v8 = v3;
  objc_msgSend(v4, "_removeMessageEntryWithIdentifier:forBundleIdentifier:completion:", v5, v6, v9);

}

void __89__ICInAppMessageManager_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);

}

uint64_t __89__ICInAppMessageManager_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __89__ICInAppMessageManager_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_44(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __55__ICInAppMessageManager_updateMessageEntry_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__ICInAppMessageManager_updateMessageEntry_completion___block_invoke_41;
  v9[3] = &unk_1E4390EF8;
  v10 = v3;
  v11 = v6;
  v8 = v3;
  dispatch_async(v7, v9);

}

void __55__ICInAppMessageManager_updateMessageEntry_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__ICInAppMessageManager_updateMessageEntry_completion___block_invoke_3;
  v7[3] = &unk_1E4390EF8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __55__ICInAppMessageManager_updateMessageEntry_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__ICInAppMessageManager_updateMessageEntry_completion___block_invoke_5;
  v8[3] = &unk_1E438EF88;
  v9 = v4;
  v6 = *(id *)(a1 + 48);
  v10 = v3;
  v11 = v6;
  v7 = v3;
  objc_msgSend(v5, "updateMessageEntry:completion:", v9, v8);

}

void __55__ICInAppMessageManager_updateMessageEntry_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138543618;
      v7 = v5;
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Failed to update message %{public}@. err=%{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);

}

uint64_t __55__ICInAppMessageManager_updateMessageEntry_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __55__ICInAppMessageManager_updateMessageEntry_completion___block_invoke_41(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __52__ICInAppMessageManager_addMessageEntry_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__ICInAppMessageManager_addMessageEntry_completion___block_invoke_36;
  v9[3] = &unk_1E4390EF8;
  v10 = v3;
  v11 = v6;
  v8 = v3;
  dispatch_async(v7, v9);

}

void __52__ICInAppMessageManager_addMessageEntry_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__ICInAppMessageManager_addMessageEntry_completion___block_invoke_3;
  v7[3] = &unk_1E4390EF8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __52__ICInAppMessageManager_addMessageEntry_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__ICInAppMessageManager_addMessageEntry_completion___block_invoke_5;
  v8[3] = &unk_1E438EF88;
  v9 = v4;
  v6 = *(id *)(a1 + 48);
  v10 = v3;
  v11 = v6;
  v7 = v3;
  objc_msgSend(v5, "_addMessageEntry:completion:", v9, v8);

}

void __52__ICInAppMessageManager_addMessageEntry_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138543618;
      v7 = v5;
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Failed to add message %{public}@. err=%{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);

}

uint64_t __52__ICInAppMessageManager_addMessageEntry_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __52__ICInAppMessageManager_addMessageEntry_completion___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __80__ICInAppMessageManager_messageEntryWithIdentifier_bundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__ICInAppMessageManager_messageEntryWithIdentifier_bundleIdentifier_completion___block_invoke_34;
  v9[3] = &unk_1E4390EF8;
  v10 = v3;
  v11 = v6;
  v8 = v3;
  dispatch_async(v7, v9);

}

void __80__ICInAppMessageManager_messageEntryWithIdentifier_bundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__ICInAppMessageManager_messageEntryWithIdentifier_bundleIdentifier_completion___block_invoke_3;
  block[3] = &unk_1E4390E58;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

void __80__ICInAppMessageManager_messageEntryWithIdentifier_bundleIdentifier_completion___block_invoke_4(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[4];
      v9 = a1[5];
      v10 = a1[6];
      v11 = 138544130;
      v12 = v8;
      v13 = 2114;
      v14 = v9;
      v15 = 2114;
      v16 = v10;
      v17 = 2114;
      v18 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to load message %{public}@ for bundle identifier %{public}@. err=%{public}@", (uint8_t *)&v11, 0x2Au);
    }

  }
  (*(void (**)(void))(a1[7] + 16))();

}

uint64_t __80__ICInAppMessageManager_messageEntryWithIdentifier_bundleIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __80__ICInAppMessageManager_messageEntryWithIdentifier_bundleIdentifier_completion___block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __71__ICInAppMessageManager_messageEntriesForBundleIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__ICInAppMessageManager_messageEntriesForBundleIdentifiers_completion___block_invoke_33;
  v9[3] = &unk_1E4390EF8;
  v10 = v3;
  v11 = v6;
  v8 = v3;
  dispatch_async(v7, v9);

}

uint64_t __71__ICInAppMessageManager_messageEntriesForBundleIdentifiers_completion___block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __57__ICInAppMessageManager_allMessageEntriesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to connect to remote service. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__ICInAppMessageManager_allMessageEntriesWithCompletion___block_invoke_30;
  v9[3] = &unk_1E4390EF8;
  v10 = v3;
  v11 = v6;
  v8 = v3;
  dispatch_async(v7, v9);

}

void __57__ICInAppMessageManager_allMessageEntriesWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ICInAppMessageManager_allMessageEntriesWithCompletion___block_invoke_3;
  block[3] = &unk_1E4390E58;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

void __57__ICInAppMessageManager_allMessageEntriesWithCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138543618;
      v10 = v8;
      v11 = 2114;
      v12 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to load all messages. err=%{public}@", (uint8_t *)&v9, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __57__ICInAppMessageManager_allMessageEntriesWithCompletion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __57__ICInAppMessageManager_allMessageEntriesWithCompletion___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __43__ICInAppMessageManager_startSystemService__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!_NSIsNSString() || (objc_msgSend(v3, "isEqualToString:", v5) & 1) == 0)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543874;
      v9 = v7;
      v10 = 2114;
      v11 = v3;
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Requesting a sync because the system version has changed from %{public}@ --> %{public}@", (uint8_t *)&v8, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "syncMessagesWithCompletion:", &__block_literal_global_24);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "updateStoreProperty:forKey:completion:", v5, CFSTR("lastSyncedOSVersion"), &__block_literal_global_25);
  }

}

uint64_t __43__ICInAppMessageManager_startSystemService__block_invoke_3(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "_performSyncRetryIfPending:", 1);
  return result;
}

uint64_t __43__ICInAppMessageManager_startSystemService__block_invoke_4(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "_performSyncRetryIfPending:", 1);
  return result;
}

@end
