@implementation ICCloudClient

- (void)updateJaliscoLibraryWithReason:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__ICCloudClient_updateJaliscoLibraryWithReason_completionHandler___block_invoke;
  v15[3] = &unk_1E438E500;
  v9 = v6;
  v16 = v9;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __66__ICCloudClient_updateJaliscoLibraryWithReason_completionHandler___block_invoke_2;
  v13[3] = &unk_1E438E500;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v10, "updateJaliscoLibraryWithReason:forConfiguration:completion:", a3, v11, v13);

}

- (void)loadIsJaliscoUpdateInProgressWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__ICCloudClient_loadIsJaliscoUpdateInProgressWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E438E500;
  v7 = v4;
  v14 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __68__ICCloudClient_loadIsJaliscoUpdateInProgressWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E438A568;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v8, "loadIsJaliscoUpdateInProgressForConfiguration:completion:", v9, v11);

}

- (BOOL)canShowCloudVideo
{
  void *v2;
  char v3;

  -[ICCloudClient availabilityService](self, "availabilityService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canShowCloudVideo");

  return v3;
}

- (BOOL)canShowCloudMusic
{
  void *v2;
  char v3;

  -[ICCloudClient availabilityService](self, "availabilityService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canShowCloudMusic");

  return v3;
}

- (BOOL)hasProperNetworkConditionsToPlayMedia
{
  void *v2;
  char v3;

  -[ICCloudClient availabilityService](self, "availabilityService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasProperNetworkConditionsToPlayMedia");

  return v3;
}

- (ICCloudClientAvailabilityService)availabilityService
{
  return self->_availabilityService;
}

- (void)dealloc
{
  objc_super v3;

  -[ICCloudClient _tearDownNotifications](self, "_tearDownNotifications");
  v3.receiver = self;
  v3.super_class = (Class)ICCloudClient;
  -[ICCloudClient dealloc](&v3, sel_dealloc);
}

- (NSXPCConnection)xpcConnection
{
  void *v2;
  void *v3;

  -[ICCloudClient cloudService](self, "cloudService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSXPCConnection *)v3;
}

- (ICCloudClientCloudService)cloudService
{
  return self->_cloudService;
}

- (void)_tearDownNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  __CFNotificationCenter *v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.itunescloud.setupcompleted"), 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, CFSTR("com.apple.itunescloudd.sagaUpdateInProgressChanged"), 0);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, CFSTR("com.apple.itunescloudd.jaliscoUpdateInProgressChanged"), 0);
}

- (void)becomeActive
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  ICCloudClient *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!-[ICCloudClient isActive](self, "isActive"))
  {
    -[ICCloudClient setActive:](self, "setActive:", 1);
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__3706;
    v17 = __Block_byref_object_dispose__3707;
    v18 = 0;
    -[ICCloudClient xpcConnection](self, "xpcConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __29__ICCloudClient_becomeActive__block_invoke;
    v12[3] = &unk_1E438FE28;
    v12[4] = &v13;
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14[5])
    {
      v5 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = v14[5];
        *(_DWORD *)buf = 134218242;
        v20 = self;
        v21 = 2114;
        v22 = v6;
        _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_ERROR, "ICCloudClient %p - becomeActive - Error retrieving xpc service - error=%{public}@", buf, 0x16u);
      }
      goto LABEL_13;
    }
    -[ICCloudClient configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setupInitialJaliscoPoolingForConfiguration:", v7);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();

    ICBundleIdentifierForSystemApplicationType(0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSObject isEqualToString:](v5, "isEqualToString:", v9))
    {
      if (!-[ICCloudClient isAuthenticated](self, "isAuthenticated") || !-[ICCloudClient isActive](self, "isActive"))
        goto LABEL_12;
      -[ICCloudClient configuration](self, "configuration");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setupInitialSagaPoolingForConfiguration:", v10);
    }
    else
    {
      v10 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v20 = (ICCloudClient *)v5;
        _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "Skip refreshing cloud library and subscribed playlists for bundle: %{public}@", buf, 0xCu);
      }
    }

LABEL_12:
    -[ICCloudClient configuration](self, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateArtistHeroImagesForConfiguration:", v11);

LABEL_13:
    _Block_object_dispose(&v13, 8);

  }
}

- (void)isAuthenticatedWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  BOOL v13;

  v6 = a3;
  v7 = a4;
  v8 = -[ICCloudClient _isAuthenticated](self, "_isAuthenticated");
  if (v6)
  {
    v9 = v6;
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  if (v7)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__ICCloudClient_isAuthenticatedWithQueue_completionHandler___block_invoke;
    v11[3] = &unk_1E438FBD8;
    v12 = v7;
    v13 = v8;
    dispatch_async(v10, v11);

  }
}

- (void)setActive:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[ICCloudClient serialAccessQueue](self, "serialAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__ICCloudClient_setActive___block_invoke;
  v6[3] = &unk_1E438E600;
  v6[4] = self;
  v7 = a3;
  dispatch_sync(v5, v6);

}

- (BOOL)isActive
{
  ICCloudClient *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ICCloudClient serialAccessQueue](self, "serialAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__ICCloudClient_isActive__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (OS_dispatch_queue)serialAccessQueue
{
  return self->_serialAccessQueue;
}

- (BOOL)_isAuthenticated
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  ICCloudClient *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[ICCloudClient configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userIdentityStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICCloudClient.m"), 2085, CFSTR("userIndentityStore cannot be nil"));

  }
  objc_msgSend(v4, "userIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICCloudClient.m"), 2086, CFSTR("userIndentity cannot be nil"));

  }
  objc_msgSend(v4, "userIdentityStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronize");

  -[ICCloudClient configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userIdentityStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v9, "getPropertiesForUserIdentity:error:", v11, &v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v20;

  if (v13 || !v12)
  {
    v15 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "userIdentity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = self;
      v23 = 2112;
      v24 = v16;
      v25 = 2114;
      v26 = v13;
      _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_ERROR, "%{public}@ - isAuthenticatedWithQueue: - Error retrieving properties - userIdentity=%@ - error=%{public}@", buf, 0x20u);

    }
    LOBYTE(v14) = 0;
  }
  else
  {
    v14 = objc_msgSend(v12, "isActiveLocker");
    v15 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v22 = self;
      v23 = 1024;
      LODWORD(v24) = v14;
      _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - isAuthenticatedWithQueue: - isAuthenticated=%{BOOL}u", buf, 0x12u);
    }
  }

  return v14;
}

- (ICConnectionConfiguration)configuration
{
  ICConnectionConfiguration *configuration;
  ICConnectionConfiguration *v4;

  configuration = self->_configuration;
  if (configuration)
    return configuration;
  v4 = objc_alloc_init(ICConnectionConfiguration);
  return v4;
}

- (void)setUpdateJaliscoInProgressChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)_serverJaliscoUpdateInProgressDidChange
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  ICCloudClient *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[ICCloudClient updateJaliscoInProgressChangedHandler](self, "updateJaliscoInProgressChangedHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v8 = self;
    v9 = 1024;
    v10 = v3 != 0;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - Receveived Jalisco update in progress notification [Handler present: %{BOOL}u", buf, 0x12u);
  }

  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__ICCloudClient__serverJaliscoUpdateInProgressDidChange__block_invoke;
    v5[3] = &unk_1E438A568;
    v6 = v3;
    -[ICCloudClient loadIsJaliscoUpdateInProgressWithCompletionHandler:](self, "loadIsJaliscoUpdateInProgressWithCompletionHandler:", v5);

  }
}

- (id)updateJaliscoInProgressChangedHandler
{
  return self->_updateJaliscoInProgressChangedHandler;
}

- (ICCloudClient)init
{
  return -[ICCloudClient initWithConfiguration:](self, "initWithConfiguration:", 0);
}

- (ICCloudClient)initWithConfiguration:(id)a3
{
  id v4;
  ICCloudClient *v5;
  uint64_t v6;
  ICConnectionConfiguration *configuration;
  dispatch_queue_t v8;
  OS_dispatch_queue *serialAccessQueue;
  dispatch_queue_t v10;
  OS_dispatch_queue *serverSetupBlockQueue;
  ICCloudServerListenerEndpointProvider *v12;
  ICCloudServerListenerEndpointProvider *listenerEndpointProvider;
  ICCloudClientAvailabilityService *v14;
  ICCloudClientAvailabilityService *availabilityService;
  ICCloudBadgingService *v16;
  ICCloudBadgingService *badgingService;
  ICCloudClientCloudService *v18;
  ICCloudClientCloudService *cloudService;
  uint64_t v20;
  NSMutableArray *pendingServerSetupCompleteBlocks;
  uint64_t v23;
  int out_token;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ICCloudClient;
  v5 = -[ICCloudClient init](&v25, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (ICConnectionConfiguration *)v6;

    v8 = dispatch_queue_create("com.apple.iTunesCloud.ICCloudClient.serial.access", 0);
    serialAccessQueue = v5->_serialAccessQueue;
    v5->_serialAccessQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_create("com.apple.iTunesCloud.ICCloudClient.serverSetupQueue", 0);
    serverSetupBlockQueue = v5->_serverSetupBlockQueue;
    v5->_serverSetupBlockQueue = (OS_dispatch_queue *)v10;

    v5->_preferredVideoQuality = -1;
    v12 = objc_alloc_init(ICCloudServerListenerEndpointProvider);
    listenerEndpointProvider = v5->_listenerEndpointProvider;
    v5->_listenerEndpointProvider = v12;

    v14 = -[ICCloudClientAvailabilityService initWithListenerEndpointProvider:]([ICCloudClientAvailabilityService alloc], "initWithListenerEndpointProvider:", v5->_listenerEndpointProvider);
    availabilityService = v5->_availabilityService;
    v5->_availabilityService = v14;

    v16 = -[ICCloudBadgingService initWithListenerEndpointProvider:]([ICCloudBadgingService alloc], "initWithListenerEndpointProvider:", v5->_listenerEndpointProvider);
    badgingService = v5->_badgingService;
    v5->_badgingService = v16;

    v18 = -[ICCloudClientCloudService initWithListenerEndpointProvider:]([ICCloudClientCloudService alloc], "initWithListenerEndpointProvider:", v5->_listenerEndpointProvider);
    cloudService = v5->_cloudService;
    v5->_cloudService = v18;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = objc_claimAutoreleasedReturnValue();
    pendingServerSetupCompleteBlocks = v5->_pendingServerSetupCompleteBlocks;
    v5->_pendingServerSetupCompleteBlocks = (NSMutableArray *)v20;

    out_token = -1;
    notify_register_check("com.apple.itunescloud.setupcompleted", &out_token);
    v23 = 0;
    notify_get_state(out_token, &v23);
    notify_cancel(out_token);
    v5->_serverIsSetup = v23 == 1;
    -[ICCloudClient _setupNotifications](v5, "_setupNotifications");
  }

  return v5;
}

- (void)_setupNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  __CFNotificationCenter *v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_ServerDidCompleteSetup, CFSTR("com.apple.itunescloud.setupcompleted"), 0, (CFNotificationSuspensionBehavior)1028);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)_ServerJaliscoUpdateInProgressDidChangeNotification, CFSTR("com.apple.itunescloudd.jaliscoUpdateInProgressChanged"), 0, (CFNotificationSuspensionBehavior)1028);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)_ServerSagaUpdateInProgressDidChangeNotification, CFSTR("com.apple.itunescloudd.sagaUpdateInProgressChanged"), 0, (CFNotificationSuspensionBehavior)1028);
}

uint64_t __27__ICCloudClient_setActive___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __60__ICCloudClient_isAuthenticatedWithQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __25__ICCloudClient_isActive__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

uint64_t __68__ICCloudClient_loadIsJaliscoUpdateInProgressWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

uint64_t __66__ICCloudClient_updateJaliscoLibraryWithReason_completionHandler___block_invoke_67(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingServerSetupCompleteBlocks, 0);
  objc_storeStrong((id *)&self->_cloudService, 0);
  objc_storeStrong((id *)&self->_badgingService, 0);
  objc_storeStrong((id *)&self->_availabilityService, 0);
  objc_storeStrong((id *)&self->_serverSetupBlockQueue, 0);
  objc_storeStrong((id *)&self->_serialAccessQueue, 0);
  objc_storeStrong((id *)&self->_listenerEndpointProvider, 0);
  objc_storeStrong(&self->_updateJaliscoInProgressChangedHandler, 0);
  objc_storeStrong(&self->_updateSagaInProgressChangedHandler, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

void __68__ICCloudClient_loadIsJaliscoUpdateInProgressWithCompletionHandler___block_invoke_2(uint64_t a1, char a2, char a3)
{
  void *v3;
  _QWORD v6[4];
  id v7;
  char v8;
  char v9;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__ICCloudClient_loadIsJaliscoUpdateInProgressWithCompletionHandler___block_invoke_3;
    v6[3] = &unk_1E438FC28;
    v7 = v3;
    v8 = a2;
    v9 = a3;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

void __66__ICCloudClient_updateJaliscoLibraryWithReason_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Update Jalisco Library failed with error: %{public}@", buf, 0xCu);
    }

  }
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __66__ICCloudClient_updateJaliscoLibraryWithReason_completionHandler___block_invoke_68;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __56__ICCloudClient__serverJaliscoUpdateInProgressDidChange__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (ICCloudClient)initWithUserIdentity:(id)a3
{
  id v4;
  ICConnectionConfiguration *v5;
  ICCloudClient *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ICConnectionConfiguration initWithUserIdentity:]([ICConnectionConfiguration alloc], "initWithUserIdentity:", v4);

  }
  else
  {
    v5 = 0;
  }
  v6 = -[ICCloudClient initWithConfiguration:](self, "initWithConfiguration:", v5);

  return v6;
}

- (void)performBlockAfterServerSetup:(id)a3
{
  id v4;
  NSObject *serverSetupBlockQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serverSetupBlockQueue = self->_serverSetupBlockQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__ICCloudClient_performBlockAfterServerSetup___block_invoke;
  v7[3] = &unk_1E4390EF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serverSetupBlockQueue, v7);

}

- (void)setCloudAddToPlaylistBehavior:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__ICCloudClient_setCloudAddToPlaylistBehavior_completionHandler___block_invoke;
  v15[3] = &unk_1E438E500;
  v9 = v6;
  v16 = v9;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __65__ICCloudClient_setCloudAddToPlaylistBehavior_completionHandler___block_invoke_2;
  v13[3] = &unk_1E438E500;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v10, "setCloudAddToPlaylistBehavior:forConfiguration:completion:", a3, v11, v13);

}

- (void)setCloudFavoriteSongAddToLibraryBehavior:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__ICCloudClient_setCloudFavoriteSongAddToLibraryBehavior_completionHandler___block_invoke;
  v15[3] = &unk_1E438E500;
  v9 = v6;
  v16 = v9;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __76__ICCloudClient_setCloudFavoriteSongAddToLibraryBehavior_completionHandler___block_invoke_2;
  v13[3] = &unk_1E438E500;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v10, "setCloudFavoriteSongAddToLibraryBehavior:forConfiguration:completion:", a3, v11, v13);

}

- (void)createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 trackList:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[16];

  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "objectForKey:", CFSTR("name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    -[ICCloudClient xpcConnection](self, "xpcConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __87__ICCloudClient_createPlaylistWithPersistentID_properties_trackList_completionHandler___block_invoke;
    v24[3] = &unk_1E438E500;
    v17 = v12;
    v25 = v17;
    objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudClient configuration](self, "configuration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __87__ICCloudClient_createPlaylistWithPersistentID_properties_trackList_completionHandler___block_invoke_2;
    v22[3] = &unk_1E438E0D8;
    v23 = v17;
    objc_msgSend(v18, "createPlaylistWithPersistentID:properties:trackList:configuration:completion:", a3, v10, v11, v19, v22);

    v20 = v25;
LABEL_7:

    goto LABEL_8;
  }
  v21 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_ERROR, "Must provide at least a playlist name when creating a playlist.", buf, 2u);
  }

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ic_cloudClientErrorWithCode:userInfo:", 2015, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v20);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)sdk_createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 tracklist:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[16];

  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "objectForKey:", CFSTR("name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    -[ICCloudClient xpcConnection](self, "xpcConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __91__ICCloudClient_sdk_createPlaylistWithPersistentID_properties_tracklist_completionHandler___block_invoke;
    v24[3] = &unk_1E438E500;
    v17 = v12;
    v25 = v17;
    objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudClient configuration](self, "configuration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __91__ICCloudClient_sdk_createPlaylistWithPersistentID_properties_tracklist_completionHandler___block_invoke_2;
    v22[3] = &unk_1E438E0D8;
    v23 = v17;
    objc_msgSend(v18, "sdk_createPlaylistWithPersistentID:properties:trackList:configuration:completion:", a3, v10, v11, v19, v22);

    v20 = v25;
LABEL_7:

    goto LABEL_8;
  }
  v21 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_ERROR, "Must provide at least a playlist name when creating a playlist.", buf, 2u);
  }

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ic_cloudClientErrorWithCode:userInfo:", 2015, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v20);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 completionHandler:(id)a6
{
  unint64_t v10;
  unint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v10 = (unint64_t)a3;
  v11 = (unint64_t)a4;
  v12 = a6;
  v13 = v12;
  if (v10 | v11)
  {
    -[ICCloudClient xpcConnection](self, "xpcConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __91__ICCloudClient_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke;
    v21[3] = &unk_1E438E500;
    v16 = v13;
    v22 = v16;
    objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudClient configuration](self, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v15;
    v19[1] = 3221225472;
    v19[2] = __91__ICCloudClient_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke_2;
    v19[3] = &unk_1E438E500;
    v20 = v16;
    objc_msgSend(v17, "setPlaylistProperties:trackList:forPlaylistPersistentID:configuration:completion:", v10, v11, a5, v18, v19);

  }
  else if (v12)
  {
    (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
  }

}

- (void)sdk_setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 completionHandler:(id)a6
{
  unint64_t v10;
  unint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v10 = (unint64_t)a3;
  v11 = (unint64_t)a4;
  v12 = a6;
  v13 = v12;
  if (v10 | v11)
  {
    -[ICCloudClient xpcConnection](self, "xpcConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __95__ICCloudClient_sdk_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke;
    v21[3] = &unk_1E438E500;
    v16 = v13;
    v22 = v16;
    objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudClient configuration](self, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v15;
    v19[1] = 3221225472;
    v19[2] = __95__ICCloudClient_sdk_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke_2;
    v19[3] = &unk_1E438E500;
    v20 = v16;
    objc_msgSend(v17, "sdk_setPlaylistProperties:trackList:forPlaylistPersistentID:configuration:completion:", v10, v11, a5, v18, v19);

  }
  else if (v12)
  {
    (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
  }

}

- (void)addStoreItemWithAdamID:(int64_t)a3 referral:(id)a4 toPlaylistWithPersistentID:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v10 = a6;
  v11 = a4;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __94__ICCloudClient_addStoreItemWithAdamID_referral_toPlaylistWithPersistentID_completionHandler___block_invoke;
  v20[3] = &unk_1E438E500;
  v14 = v10;
  v21 = v14;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __94__ICCloudClient_addStoreItemWithAdamID_referral_toPlaylistWithPersistentID_completionHandler___block_invoke_2;
  v18[3] = &unk_1E438E500;
  v19 = v14;
  v17 = v14;
  objc_msgSend(v15, "addStoreItemWithAdamID:referral:toPlaylistWithPersistentID:configuration:completion:", a3, v11, a5, v16, v18);

}

- (void)addItemWithSagaID:(int64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __80__ICCloudClient_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke;
  v17[3] = &unk_1E438E500;
  v11 = v8;
  v18 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __80__ICCloudClient_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke_2;
  v15[3] = &unk_1E438E500;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v12, "addItemWithSagaID:toPlaylistWithPersistentID:configuration:completion:", a3, a4, v13, v15);

}

- (void)sdk_addStoreItemWithOpaqueID:(id)a3 toPlaylistWithPersistentID:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  v9 = a3;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __91__ICCloudClient_sdk_addStoreItemWithOpaqueID_toPlaylistWithPersistentID_completionHandler___block_invoke;
  v18[3] = &unk_1E438E500;
  v12 = v8;
  v19 = v12;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __91__ICCloudClient_sdk_addStoreItemWithOpaqueID_toPlaylistWithPersistentID_completionHandler___block_invoke_2;
  v16[3] = &unk_1E438A3E8;
  v17 = v12;
  v15 = v12;
  objc_msgSend(v13, "sdk_addStoreItemWithOpaqueID:toPlaylistWithPersistentID:configuration:completion:", v9, a4, v14, v16);

}

- (void)sdk_addItemWithSagaID:(int64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __84__ICCloudClient_sdk_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke;
  v17[3] = &unk_1E438E500;
  v11 = v8;
  v18 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __84__ICCloudClient_sdk_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke_2;
  v15[3] = &unk_1E438E500;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v12, "sdk_addItemWithSagaID:toPlaylistWithPersistentID:configuration:completion:", a3, a4, v13, v15);

}

- (void)publishPlaylistWithSagaID:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__ICCloudClient_publishPlaylistWithSagaID_completionHandler___block_invoke;
  v15[3] = &unk_1E438E500;
  v9 = v6;
  v16 = v9;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __61__ICCloudClient_publishPlaylistWithSagaID_completionHandler___block_invoke_2;
  v13[3] = &unk_1E438A410;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v10, "publishPlaylistWithSagaID:configuration:completion:", a3, v11, v13);

}

- (void)uploadArtworkForPlaylistWithPersistentID:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__ICCloudClient_uploadArtworkForPlaylistWithPersistentID_completionHandler___block_invoke;
  v15[3] = &unk_1E438E500;
  v9 = v6;
  v16 = v9;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __76__ICCloudClient_uploadArtworkForPlaylistWithPersistentID_completionHandler___block_invoke_2;
  v13[3] = &unk_1E438E500;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v10, "uploadArtworkForPlaylistWithPersistentID:configuration:completion:", a3, v11, v13);

}

- (void)updateSubscribedPlaylistsWithSagaIDs:(id)a3 ignoreMinRefreshInterval:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __97__ICCloudClient_updateSubscribedPlaylistsWithSagaIDs_ignoreMinRefreshInterval_completionHandler___block_invoke;
  v18[3] = &unk_1E438E500;
  v12 = v8;
  v19 = v12;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __97__ICCloudClient_updateSubscribedPlaylistsWithSagaIDs_ignoreMinRefreshInterval_completionHandler___block_invoke_2;
  v16[3] = &unk_1E438E500;
  v17 = v12;
  v15 = v12;
  objc_msgSend(v13, "updateSubscribedPlaylistsWithSagaIDs:ignoreMinRefreshInterval:configuration:completion:", v9, v5, v14, v16);

}

- (void)updatePinnedSubscribedPlaylistsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__ICCloudClient_updatePinnedSubscribedPlaylistsWithCompletion___block_invoke;
  v13[3] = &unk_1E438E500;
  v7 = v4;
  v14 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __63__ICCloudClient_updatePinnedSubscribedPlaylistsWithCompletion___block_invoke_2;
  v11[3] = &unk_1E438E500;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v8, "updatePinnedSubscribedPlaylistsWithConfiguration:completion:", v9, v11);

}

- (void)addStoreItemWithAdamID:(int64_t)a3 referral:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  int64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (a3 <= 0)
  {
    v15 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v21 = a3;
      _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_ERROR, "Must provide a valid adam ID (%lld) adding to library.", buf, 0xCu);
    }

    if (v9)
      (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }
  else
  {
    -[ICCloudClient xpcConnection](self, "xpcConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __67__ICCloudClient_addStoreItemWithAdamID_referral_completionHandler___block_invoke;
    v18[3] = &unk_1E438E500;
    v12 = v9;
    v19 = v12;
    objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudClient configuration](self, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __67__ICCloudClient_addStoreItemWithAdamID_referral_completionHandler___block_invoke_2;
    v16[3] = &unk_1E438A3E8;
    v17 = v12;
    objc_msgSend(v13, "addStoreItemWithAdamID:referral:configuration:completion:", a3, v8, v14, v16);

  }
}

- (void)sdk_addStoreItemWithOpaqueID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v7 = a3;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__ICCloudClient_sdk_addStoreItemWithOpaqueID_completionHandler___block_invoke;
  v16[3] = &unk_1E438E500;
  v10 = v6;
  v17 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __64__ICCloudClient_sdk_addStoreItemWithOpaqueID_completionHandler___block_invoke_2;
  v14[3] = &unk_1E438A3E8;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v11, "sdk_addStoreItemWithOpaqueID:configuration:completion:", v7, v12, v14);

}

- (void)addStorePlaylistWithGlobalID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v7 = a3;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__ICCloudClient_addStorePlaylistWithGlobalID_completionHandler___block_invoke;
  v16[3] = &unk_1E438E500;
  v10 = v6;
  v17 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __64__ICCloudClient_addStorePlaylistWithGlobalID_completionHandler___block_invoke_2;
  v14[3] = &unk_1E438A3E8;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v11, "addStorePlaylistWithGlobalID:configuration:completion:", v7, v12, v14);

}

- (void)removePlaylistsWithSagaIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v7 = a3;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__ICCloudClient_removePlaylistsWithSagaIDs_completionHandler___block_invoke;
  v16[3] = &unk_1E438E500;
  v10 = v6;
  v17 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __62__ICCloudClient_removePlaylistsWithSagaIDs_completionHandler___block_invoke_2;
  v14[3] = &unk_1E438E500;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v11, "removePlaylistsWithSagaIDs:configuration:completion:", v7, v12, v14);

}

- (void)removeItemsWithSagaIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v7 = a3;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__ICCloudClient_removeItemsWithSagaIDs_completionHandler___block_invoke;
  v16[3] = &unk_1E438E500;
  v10 = v6;
  v17 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __58__ICCloudClient_removeItemsWithSagaIDs_completionHandler___block_invoke_2;
  v14[3] = &unk_1E438E500;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v11, "removeItemsWithSagaIDs:configuration:completion:", v7, v12, v14);

}

- (void)hideItemsWithPurchaseHistoryIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v7 = a3;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__ICCloudClient_hideItemsWithPurchaseHistoryIDs_completionHandler___block_invoke;
  v16[3] = &unk_1E438E500;
  v10 = v6;
  v17 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __67__ICCloudClient_hideItemsWithPurchaseHistoryIDs_completionHandler___block_invoke_2;
  v14[3] = &unk_1E438E500;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v11, "hideItemsWithPurchaseHistoryIDs:configuration:completion:", v7, v12, v14);

}

- (void)addGeniusPlaylistWithPersistentID:(int64_t)a3 name:(id)a4 seedItemSagaIDs:(id)a5 itemSagaIDs:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __102__ICCloudClient_addGeniusPlaylistWithPersistentID_name_seedItemSagaIDs_itemSagaIDs_completionHandler___block_invoke;
  v24[3] = &unk_1E438E500;
  v18 = v12;
  v25 = v18;
  objc_msgSend(v16, "remoteObjectProxyWithErrorHandler:", v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __102__ICCloudClient_addGeniusPlaylistWithPersistentID_name_seedItemSagaIDs_itemSagaIDs_completionHandler___block_invoke_2;
  v22[3] = &unk_1E438E0D8;
  v23 = v18;
  v21 = v18;
  objc_msgSend(v19, "addGeniusPlaylistWithPersistentID:name:seedItemSagaIDs:itemSagaIDs:configuration:completion:", a3, v15, v14, v13, v20, v22);

}

- (void)favoriteEntityWithPersistentID:(int64_t)a3 storeID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  int64_t v22;
  _QWORD v23[4];
  id v24;
  int64_t v25;

  v12 = a7;
  v13 = a6;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __90__ICCloudClient_favoriteEntityWithPersistentID_storeID_entityType_time_completionHandler___block_invoke;
  v23[3] = &unk_1E438E398;
  v25 = a4;
  v16 = v12;
  v24 = v16;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __90__ICCloudClient_favoriteEntityWithPersistentID_storeID_entityType_time_completionHandler___block_invoke_2;
  v20[3] = &unk_1E438E398;
  v21 = v16;
  v22 = a4;
  v19 = v16;
  objc_msgSend(v17, "favoriteEntityWithPersistentID:storeID:entityType:time:configuration:completionHandler:", a3, a4, a5, v13, v18, v20);

}

- (void)favoritePlaylistWithPersistentID:(int64_t)a3 globalID:(id)a4 time:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v10 = a4;
  v11 = a6;
  v12 = a5;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __82__ICCloudClient_favoritePlaylistWithPersistentID_globalID_time_completionHandler___block_invoke;
  v24[3] = &unk_1E43915E8;
  v15 = v10;
  v25 = v15;
  v16 = v11;
  v26 = v16;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __82__ICCloudClient_favoritePlaylistWithPersistentID_globalID_time_completionHandler___block_invoke_2;
  v21[3] = &unk_1E43915E8;
  v22 = v15;
  v23 = v16;
  v19 = v16;
  v20 = v15;
  objc_msgSend(v17, "favoritePlaylistWithPersistentID:globalID:time:configuration:completionHandler:", a3, v20, v12, v18, v21);

}

- (void)favoriteEntityWithPersistentID:(int64_t)a3 sagaID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  int64_t v22;
  _QWORD v23[4];
  id v24;
  int64_t v25;

  v12 = a7;
  v13 = a6;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __89__ICCloudClient_favoriteEntityWithPersistentID_sagaID_entityType_time_completionHandler___block_invoke;
  v23[3] = &unk_1E438E398;
  v25 = a4;
  v16 = v12;
  v24 = v16;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __89__ICCloudClient_favoriteEntityWithPersistentID_sagaID_entityType_time_completionHandler___block_invoke_2;
  v20[3] = &unk_1E438E398;
  v21 = v16;
  v22 = a4;
  v19 = v16;
  objc_msgSend(v17, "favoriteEntityWithPersistentID:sagaID:entityType:time:configuration:completionHandler:", a3, a4, a5, v13, v18, v20);

}

- (void)favoriteAlbumWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v10 = a4;
  v11 = a6;
  v12 = a5;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __85__ICCloudClient_favoriteAlbumWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke;
  v24[3] = &unk_1E43915E8;
  v15 = v10;
  v25 = v15;
  v16 = v11;
  v26 = v16;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __85__ICCloudClient_favoriteAlbumWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke_2;
  v21[3] = &unk_1E43915E8;
  v22 = v15;
  v23 = v16;
  v19 = v16;
  v20 = v15;
  objc_msgSend(v17, "favoriteAlbumWithPersistentID:cloudLibraryID:time:configuration:completionHandler:", a3, v20, v12, v18, v21);

}

- (void)favoriteArtistWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v10 = a4;
  v11 = a6;
  v12 = a5;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __86__ICCloudClient_favoriteArtistWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke;
  v24[3] = &unk_1E43915E8;
  v15 = v10;
  v25 = v15;
  v16 = v11;
  v26 = v16;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __86__ICCloudClient_favoriteArtistWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke_2;
  v21[3] = &unk_1E43915E8;
  v22 = v15;
  v23 = v16;
  v19 = v16;
  v20 = v15;
  objc_msgSend(v17, "favoriteArtistWithPersistentID:cloudLibraryID:time:configuration:completionHandler:", a3, v20, v12, v18, v21);

}

- (void)beginCollaborationUsingPlaylistWithPersistentID:(int64_t)a3 sharingMode:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  int64_t v17;
  _QWORD v18[5];
  id v19;

  v8 = a5;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__ICCloudClient_beginCollaborationUsingPlaylistWithPersistentID_sharingMode_completion___block_invoke;
  v18[3] = &unk_1E43915E8;
  v18[4] = self;
  v11 = v8;
  v19 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __88__ICCloudClient_beginCollaborationUsingPlaylistWithPersistentID_sharingMode_completion___block_invoke_2;
  v15[3] = &unk_1E438A438;
  v16 = v11;
  v17 = a3;
  v15[4] = self;
  v14 = v11;
  objc_msgSend(v12, "beginCollaborationUsingPlaylistWithPersistentID:sharingMode:configuration:completion:", a3, a4, v13, v15);

}

- (void)endCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  int64_t v15;
  _QWORD v16[5];
  id v17;

  v6 = a4;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__ICCloudClient_endCollaborationWithPersistentID_completion___block_invoke;
  v16[3] = &unk_1E43915E8;
  v16[4] = self;
  v9 = v6;
  v17 = v9;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __61__ICCloudClient_endCollaborationWithPersistentID_completion___block_invoke_2;
  v13[3] = &unk_1E438A438;
  v14 = v9;
  v15 = a3;
  v13[4] = self;
  v12 = v9;
  objc_msgSend(v10, "endCollaborationWithPersistentID:configuration:completion:", a3, v11, v13);

}

- (void)editCollaborationWithPersistentID:(int64_t)a3 properties:(id)a4 trackEdits:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  int64_t v21;
  _QWORD v22[5];
  id v23;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __84__ICCloudClient_editCollaborationWithPersistentID_properties_trackEdits_completion___block_invoke;
  v22[3] = &unk_1E43915E8;
  v22[4] = self;
  v15 = v10;
  v23 = v15;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __84__ICCloudClient_editCollaborationWithPersistentID_properties_trackEdits_completion___block_invoke_2;
  v19[3] = &unk_1E438E438;
  v20 = v15;
  v21 = a3;
  v19[4] = self;
  v18 = v15;
  objc_msgSend(v16, "editCollaborationWithPersistentID:configuration:properties:trackEdits:completion:", a3, v17, v12, v11, v19);

}

- (void)joinCollaborationWithGlobalPlaylistID:(id)a3 invitationURL:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __80__ICCloudClient_joinCollaborationWithGlobalPlaylistID_invitationURL_completion___block_invoke;
  v21[3] = &unk_1E43915E8;
  v21[4] = self;
  v13 = v9;
  v22 = v13;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __80__ICCloudClient_joinCollaborationWithGlobalPlaylistID_invitationURL_completion___block_invoke_2;
  v18[3] = &unk_1E438E288;
  v18[4] = self;
  v19 = v8;
  v20 = v13;
  v16 = v13;
  v17 = v8;
  objc_msgSend(v14, "joinCollaborationWithGlobalPlaylistID:invitationURL:configuration:completion:", v17, v10, v15, v18);

}

- (void)respondToPendingCollaborator:(id)a3 onCollaborationWithPersistentID:(int64_t)a4 withApproval:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  int64_t v20;
  _QWORD v21[5];
  id v22;

  v6 = a5;
  v10 = a6;
  v11 = a3;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __102__ICCloudClient_respondToPendingCollaborator_onCollaborationWithPersistentID_withApproval_completion___block_invoke;
  v21[3] = &unk_1E43915E8;
  v21[4] = self;
  v14 = v10;
  v22 = v14;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __102__ICCloudClient_respondToPendingCollaborator_onCollaborationWithPersistentID_withApproval_completion___block_invoke_2;
  v18[3] = &unk_1E438E438;
  v19 = v14;
  v20 = a4;
  v18[4] = self;
  v17 = v14;
  objc_msgSend(v15, "respondToPendingCollaborator:onCollaborationWithPersistentID:withApproval:configuration:completion:", v11, a4, v6, v16, v18);

}

- (void)removeCollaborators:(id)a3 fromCollaborationWithPersistentID:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v8 = a5;
  v9 = a3;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __82__ICCloudClient_removeCollaborators_fromCollaborationWithPersistentID_completion___block_invoke;
  v18[3] = &unk_1E43915E8;
  v18[4] = self;
  v12 = v8;
  v19 = v12;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __82__ICCloudClient_removeCollaborators_fromCollaborationWithPersistentID_completion___block_invoke_2;
  v16[3] = &unk_1E43915E8;
  v16[4] = self;
  v17 = v12;
  v15 = v12;
  objc_msgSend(v13, "removeCollaborators:fromCollaborationWithPersistentID:configuration:completion:", v9, a4, v14, v16);

}

- (void)resetInvitationURLForCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__ICCloudClient_resetInvitationURLForCollaborationWithPersistentID_completion___block_invoke;
  v15[3] = &unk_1E43915E8;
  v15[4] = self;
  v9 = v6;
  v16 = v9;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __79__ICCloudClient_resetInvitationURLForCollaborationWithPersistentID_completion___block_invoke_2;
  v13[3] = &unk_1E438A460;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v10, "resetInvitationURLForCollaborationWithPersistentID:configuration:completion:", a3, v11, v13);

}

- (void)authenticateWithCompletionHandler:(id)a3
{
  -[ICCloudClient authenticateAndStartInitialImport:completionHandler:](self, "authenticateAndStartInitialImport:completionHandler:", 0, a3);
}

- (void)authenticateAndStartInitialImport:(BOOL)a3 completionHandler:(id)a4
{
  -[ICCloudClient _enableCloudLibraryWithPolicy:startinitialImport:isExplicitUserAction:completionHandler:](self, "_enableCloudLibraryWithPolicy:startinitialImport:isExplicitUserAction:completionHandler:", 2, a3, 0, a4);
}

- (void)enableCloudLibraryWithPolicy:(int64_t)a3 startInitialImport:(BOOL)a4 completionHandler:(id)a5
{
  -[ICCloudClient _enableCloudLibraryWithPolicy:startinitialImport:isExplicitUserAction:completionHandler:](self, "_enableCloudLibraryWithPolicy:startinitialImport:isExplicitUserAction:completionHandler:", a3, a4, 1, a5);
}

- (void)_enableCloudLibraryWithPolicy:(int64_t)a3 startinitialImport:(BOOL)a4 isExplicitUserAction:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  NSObject *v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  ICCloudClient *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  _BOOL4 v30;
  uint64_t v31;

  v6 = a5;
  v7 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    v24 = self;
    v25 = 1024;
    v26 = a3;
    v27 = 1024;
    v28 = v7;
    v29 = 1024;
    v30 = v6;
    _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "<ICCloudClient %p> - Attempting cloud library authenticate (start initial import with explicit user action, merge policy=%d, shouldStartInitialImport=%{BOOL}u, isExplicitUserAction = %{BOOL}u)", buf, 0x1Eu);
  }

  v12 = -[ICCloudClient _isAuthenticated](self, "_isAuthenticated");
  if (!a3 || !v12)
  {
    -[ICCloudClient xpcConnection](self, "xpcConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __105__ICCloudClient__enableCloudLibraryWithPolicy_startinitialImport_isExplicitUserAction_completionHandler___block_invoke;
    v21[3] = &unk_1E438E500;
    v16 = v10;
    v22 = v16;
    objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudClient configuration](self, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v15;
    v19[1] = 3221225472;
    v19[2] = __105__ICCloudClient__enableCloudLibraryWithPolicy_startinitialImport_isExplicitUserAction_completionHandler___block_invoke_64;
    v19[3] = &unk_1E438E500;
    v20 = v16;
    objc_msgSend(v17, "authenticateForConfiguration:startInitialImport:enableCloudLibraryPolicy:isExplicitUserAction:completion:", v18, v7, a3, v6, v19);

    v13 = v22;
    goto LABEL_8;
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v13);
LABEL_8:

  }
}

- (void)disableCloudLibraryWithCompletionHandler:(id)a3
{
  -[ICCloudClient disableCloudLibraryWithReason:completionHandler:](self, "disableCloudLibraryWithReason:completionHandler:", -7, a3);
}

- (void)disableCloudLibraryWithReason:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  ICCloudClient *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v18 = self;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "<ICCloudClient %p> - Attempting disable cloud library", buf, 0xCu);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__ICCloudClient_disableCloudLibraryWithReason_completionHandler___block_invoke;
  v15[3] = &unk_1E43915E8;
  v15[4] = self;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __65__ICCloudClient_disableCloudLibraryWithReason_completionHandler___block_invoke_65;
  v13[3] = &unk_1E438E500;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "disableCloudLibraryWithReason:completion:", a3, v13);

}

- (void)removeJaliscoLibraryWithCompletionHander:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__ICCloudClient_removeJaliscoLibraryWithCompletionHander___block_invoke;
  v13[3] = &unk_1E438E500;
  v7 = v4;
  v14 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __58__ICCloudClient_removeJaliscoLibraryWithCompletionHander___block_invoke_2;
  v11[3] = &unk_1E438E500;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v8, "removeJaliscoLibraryForConfiguration:completion:", v9, v11);

}

- (BOOL)isMediaKindDisabledForJaliscoLibrary:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[6];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__ICCloudClient_isMediaKindDisabledForJaliscoLibrary___block_invoke;
  v11[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v11[4] = a3;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __54__ICCloudClient_isMediaKindDisabledForJaliscoLibrary___block_invoke_71;
  v10[3] = &unk_1E438A4A8;
  v10[4] = &v12;
  v10[5] = a3;
  objc_msgSend(v7, "isMediaKindDisabledForJaliscoLibrary:configuration:completion:", a3, v8, v10);

  LOBYTE(a3) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return a3;
}

- (BOOL)musicPurchasesDisabledForJaliscoLibrary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[ICCloudClient configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getML3MusicLibraryClass(), "musicLibraryForUserAccount:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "jaliscoLastExcludedMediaKinds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", &unk_1E43E65B0);

  return v6;
}

- (void)updateJaliscoLibraryWithCompletionHandler:(id)a3
{
  -[ICCloudClient updateJaliscoLibraryWithReason:completionHandler:](self, "updateJaliscoLibraryWithReason:completionHandler:", 0, a3);
}

- (void)updateSagaLibraryWithCompletionHandler:(id)a3
{
  -[ICCloudClient updateSagaLibraryWithReason:completionHandler:](self, "updateSagaLibraryWithReason:completionHandler:", 0, a3);
}

- (void)updateSagaLibraryWithReason:(int64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD);
  NSObject *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void (**v13)(id, _QWORD);
  void *v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(id, _QWORD);
  _QWORD v18[4];
  id v19;
  uint8_t buf[16];

  v6 = (void (**)(id, _QWORD))a4;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "Sending request to update Cloud Library...", buf, 2u);
  }

  +[ICCloudAvailabilityController sharedController](ICCloudAvailabilityController, "sharedController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldProhibitMusicActionForCurrentNetworkConditions");

  if (v9)
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "Can't update cloud library using current network - skipping", buf, 2u);
    }

    if (v6)
      v6[2](v6, 0);
  }
  else
  {
    -[ICCloudClient xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __63__ICCloudClient_updateSagaLibraryWithReason_completionHandler___block_invoke;
    v18[3] = &unk_1E438E500;
    v13 = v6;
    v19 = v13;
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudClient configuration](self, "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __63__ICCloudClient_updateSagaLibraryWithReason_completionHandler___block_invoke_77;
    v16[3] = &unk_1E438E500;
    v17 = v13;
    objc_msgSend(v14, "updateSagaLibraryWithReason:forConfiguration:completion:", a3, v15, v16);

  }
}

- (void)deauthenticateWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

  v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "Sending deauthenticate request...", buf, 2u);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__ICCloudClient_deauthenticateWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E438E500;
  v8 = v4;
  v15 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __53__ICCloudClient_deauthenticateWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E438E500;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v9, "deauthenticateForConfiguration:completion:", v10, v12);

}

- (void)isAuthenticatedWithCompletionHandler:(id)a3
{
  -[ICCloudClient isAuthenticatedWithQueue:completionHandler:](self, "isAuthenticatedWithQueue:completionHandler:", MEMORY[0x1E0C80D38], a3);
}

- (void)loadLastKnownEnableICMLErrorStatusWithCompletionHander:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__ICCloudClient_loadLastKnownEnableICMLErrorStatusWithCompletionHander___block_invoke;
  v13[3] = &unk_1E438E500;
  v7 = v4;
  v14 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __72__ICCloudClient_loadLastKnownEnableICMLErrorStatusWithCompletionHander___block_invoke_81;
  v11[3] = &unk_1E438A4D0;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v8, "loadLastKnownEnableICMLErrorStatusForConfiguration:completion:", v9, v11);

}

- (void)importItemArtworkForPurchaseHistoryID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v19 = a3;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "Sending request to import item artwork for purchase history ID %llu...", buf, 0xCu);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__ICCloudClient_importItemArtworkForPurchaseHistoryID_completionHandler___block_invoke;
  v16[3] = &unk_1E438E500;
  v10 = v6;
  v17 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __73__ICCloudClient_importItemArtworkForPurchaseHistoryID_completionHandler___block_invoke_83;
  v14[3] = &unk_1E438E500;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v11, "importItemArtworkForPurchaseHistoryID:configuration:completion:", a3, v12, v14);

}

- (void)importScreenshotForPurchaseHistoryID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  +[ICCloudAvailabilityController sharedController](ICCloudAvailabilityController, "sharedController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldProhibitVideosActionForCurrentNetworkConditions");

  v9 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 134217984;
      v22 = a3;
      _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "Sending request to import screenshot for purchase history ID %llu...", buf, 0xCu);
    }

    -[ICCloudClient xpcConnection](self, "xpcConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __72__ICCloudClient_importScreenshotForPurchaseHistoryID_completionHandler___block_invoke;
    v19[3] = &unk_1E438E500;
    v14 = v6;
    v20 = v14;
    objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudClient configuration](self, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __72__ICCloudClient_importScreenshotForPurchaseHistoryID_completionHandler___block_invoke_84;
    v17[3] = &unk_1E438E500;
    v18 = v14;
    objc_msgSend(v15, "importScreenshotForPurchaseHistoryID:configuration:completion:", a3, v16, v17);

    v11 = v20;
    goto LABEL_9;
  }
  if (v10)
  {
    *(_DWORD *)buf = 134217984;
    v22 = a3;
    _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "Skipping request to import item screenshot for purchase history ID %llu due to insufficient network conditions", buf, 0xCu);
  }

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ic_cloudClientErrorWithCode:userInfo:", 2006, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v11);
LABEL_9:

  }
}

- (void)importItemArtworkForSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v19 = a3;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "Sending request to import item artwork for saga ID %llu...", buf, 0xCu);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__ICCloudClient_importItemArtworkForSagaID_completionHandler___block_invoke;
  v16[3] = &unk_1E438E500;
  v10 = v6;
  v17 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __62__ICCloudClient_importItemArtworkForSagaID_completionHandler___block_invoke_85;
  v14[3] = &unk_1E438E500;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v11, "importItemArtworkForSagaID:configuration:completion:", a3, v12, v14);

}

- (void)importScreenshotForSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v19 = a3;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "Sending request to import screenshot for saga ID %llu...", buf, 0xCu);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__ICCloudClient_importScreenshotForSagaID_completionHandler___block_invoke;
  v16[3] = &unk_1E438E500;
  v10 = v6;
  v17 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __61__ICCloudClient_importScreenshotForSagaID_completionHandler___block_invoke_86;
  v14[3] = &unk_1E438E500;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v11, "importScreenshotForSagaID:configuration:completion:", a3, v12, v14);

}

- (void)importContainerArtworkForSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v19 = a3;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "Sending request to import container artwork for saga ID %llu...", buf, 0xCu);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__ICCloudClient_importContainerArtworkForSagaID_completionHandler___block_invoke;
  v16[3] = &unk_1E438E500;
  v10 = v6;
  v17 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __67__ICCloudClient_importContainerArtworkForSagaID_completionHandler___block_invoke_87;
  v14[3] = &unk_1E438E500;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v11, "importContainerArtworkForSagaID:configuration:completion:", a3, v12, v14);

}

- (void)importSubscriptionItemArtworkForPersistentID:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v19 = a3;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "Sending request to import subscription artwork for item persistent ID %lld...", buf, 0xCu);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__ICCloudClient_importSubscriptionItemArtworkForPersistentID_completionHandler___block_invoke;
  v16[3] = &unk_1E438E500;
  v10 = v6;
  v17 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __80__ICCloudClient_importSubscriptionItemArtworkForPersistentID_completionHandler___block_invoke_88;
  v14[3] = &unk_1E438E500;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v11, "importSubscriptionItemArtworkForPersistentID:configuration:completion:", a3, v12, v14);

}

- (void)importSubscriptionScreenshotForPersistentID:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v19 = a3;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "Sending request to import subscription screenshot for item persistent ID %lld...", buf, 0xCu);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__ICCloudClient_importSubscriptionScreenshotForPersistentID_completionHandler___block_invoke;
  v16[3] = &unk_1E438E500;
  v10 = v6;
  v17 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __79__ICCloudClient_importSubscriptionScreenshotForPersistentID_completionHandler___block_invoke_89;
  v14[3] = &unk_1E438E500;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v11, "importSubscriptionScreenshotForPersistentID:configuration:completion:", a3, v12, v14);

}

- (void)importSubscriptionContainerArtworkForPersistentID:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v19 = a3;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "Sending request to import subscription artwork for container persistent ID %lld...", buf, 0xCu);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__ICCloudClient_importSubscriptionContainerArtworkForPersistentID_completionHandler___block_invoke;
  v16[3] = &unk_1E438E500;
  v10 = v6;
  v17 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __85__ICCloudClient_importSubscriptionContainerArtworkForPersistentID_completionHandler___block_invoke_90;
  v14[3] = &unk_1E438E500;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v11, "importSubscriptionContainerArtworkForPersistentID:configuration:completion:", a3, v12, v14);

}

- (void)importArtistHeroImageForPersistentID:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v19 = a3;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "Sending request to artist hero image hero for item persistent ID %lld...", buf, 0xCu);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__ICCloudClient_importArtistHeroImageForPersistentID_completionHandler___block_invoke;
  v16[3] = &unk_1E438E500;
  v10 = v6;
  v17 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __72__ICCloudClient_importArtistHeroImageForPersistentID_completionHandler___block_invoke_91;
  v14[3] = &unk_1E438E500;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v11, "importArtistHeroImageForPersistentID:configuration:completion:", a3, v12, v14);

}

- (void)importAlbumArtistHeroImageForPersistentID:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v19 = a3;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "Sending request to import album artist hero image for item persistent ID %lld...", buf, 0xCu);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__ICCloudClient_importAlbumArtistHeroImageForPersistentID_completionHandler___block_invoke;
  v16[3] = &unk_1E438E500;
  v10 = v6;
  v17 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __77__ICCloudClient_importAlbumArtistHeroImageForPersistentID_completionHandler___block_invoke_92;
  v14[3] = &unk_1E438E500;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v11, "importAlbumArtistHeroImageForPersistentID:configuration:completion:", a3, v12, v14);

}

- (void)deprioritizeItemArtworkForPurchaseHistoryID:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = a3;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "Sending request to deprioritize item artwork import with purchase history ID %llu...", buf, 0xCu);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__ICCloudClient_deprioritizeItemArtworkForPurchaseHistoryID___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v9[4] = a3;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deprioritizeItemArtworkForPurchaseHistoryID:configuration:", a3, v8);

}

- (void)deprioritizeScreenshotForPurchaseHistoryID:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = a3;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "Sending request to deprioritize screenshot artwork import with purchase history ID %llu...", buf, 0xCu);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__ICCloudClient_deprioritizeScreenshotForPurchaseHistoryID___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v9[4] = a3;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deprioritizeScreenshotForPurchaseHistoryID:configuration:", a3, v8);

}

- (void)deprioritizeItemArtworkForSagaID:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = a3;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "Sending request to deprioritize item artwork import with saga ID %llu...", buf, 0xCu);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__ICCloudClient_deprioritizeItemArtworkForSagaID___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v9[4] = a3;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deprioritizeItemArtworkForSagaID:configuration:", a3, v8);

}

- (void)deprioritizeScreenshotForSagaID:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = a3;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "Sending request to deprioritize screenshot import with saga ID %llu...", buf, 0xCu);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__ICCloudClient_deprioritizeScreenshotForSagaID___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v9[4] = a3;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deprioritizeScreenshotForSagaID:configuration:", a3, v8);

}

- (void)deprioritizeContainerArtworkForSagaID:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = a3;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "Sending request to deprioritize container artwork import with saga ID %llu...", buf, 0xCu);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__ICCloudClient_deprioritizeContainerArtworkForSagaID___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v9[4] = a3;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deprioritizeContainerArtworkForSagaID:configuration:", a3, v8);

}

- (void)deprioritizeSubscriptionItemArtworkForPersistentID:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = a3;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "Sending request to deprioritize subscription item artwork import with persistent ID %lld...", buf, 0xCu);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__ICCloudClient_deprioritizeSubscriptionItemArtworkForPersistentID___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v9[4] = a3;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deprioritizeSubscriptionItemArtworkForPersistentID:configuration:", a3, v8);

}

- (void)deprioritizeSubscriptionScreenshotForPersistentID:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = a3;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "Sending request to deprioritize subscription screenshot import with persistent ID %lld...", buf, 0xCu);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__ICCloudClient_deprioritizeSubscriptionScreenshotForPersistentID___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v9[4] = a3;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deprioritizeSubscriptionScreenshotForPersistentID:configuration:", a3, v8);

}

- (void)deprioritizeSubscriptionContainerArtworkForPersistentID:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = a3;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "Sending request to deprioritize subscription container artwork import with persistent ID %lld...", buf, 0xCu);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__ICCloudClient_deprioritizeSubscriptionContainerArtworkForPersistentID___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v9[4] = a3;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deprioritizeSubscriptionContainerArtworkForPersistentID:configuration:", a3, v8);

}

- (void)deprioritizeArtistHeroImageForPersistentID:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = a3;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "Sending request to deprioritize artist hero artwork import with persistent ID %lld...", buf, 0xCu);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__ICCloudClient_deprioritizeArtistHeroImageForPersistentID___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v9[4] = a3;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deprioritizeArtistHeroImageForPersistentID:configuration:", a3, v8);

}

- (void)deprioritizeAlbumArtistHeroImageForPersistentID:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = a3;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "Sending request to deprioritize album artist hero artwork import with persistent ID %lld...", buf, 0xCu);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__ICCloudClient_deprioritizeAlbumArtistHeroImageForPersistentID___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v9[4] = a3;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deprioritizeAlbumArtistHeroImageForPersistentID:configuration:", a3, v8);

}

- (void)loadArtworkInfoForPurchaseHistoryID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__ICCloudClient_loadArtworkInfoForPurchaseHistoryID_completionHandler___block_invoke;
  v10[3] = &unk_1E438A4F8;
  v11 = v6;
  v9 = v6;
  -[ICCloudClient loadArtworkInfoForPurchaseHistoryIDs:completionHandler:](self, "loadArtworkInfoForPurchaseHistoryIDs:completionHandler:", v8, v10);

}

- (void)loadArtworkInfoForPurchaseHistoryIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    -[ICCloudClient xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __72__ICCloudClient_loadArtworkInfoForPurchaseHistoryIDs_completionHandler___block_invoke;
    v15[3] = &unk_1E438E500;
    v10 = v7;
    v16 = v10;
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudClient configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __72__ICCloudClient_loadArtworkInfoForPurchaseHistoryIDs_completionHandler___block_invoke_2;
    v13[3] = &unk_1E438A520;
    v14 = v10;
    objc_msgSend(v11, "loadArtworkInfoForPurchaseHistoryIDs:configuration:completion:", v6, v12, v13);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA60]);
  }

}

- (void)loadScreenshotInfoForPurchaseHistoryID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__ICCloudClient_loadScreenshotInfoForPurchaseHistoryID_completionHandler___block_invoke;
  v10[3] = &unk_1E438A4F8;
  v11 = v6;
  v9 = v6;
  -[ICCloudClient loadScreenshotInfoForPurchaseHistoryIDs:completionHandler:](self, "loadScreenshotInfoForPurchaseHistoryIDs:completionHandler:", v8, v10);

}

- (void)loadScreenshotInfoForPurchaseHistoryIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    -[ICCloudClient xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __75__ICCloudClient_loadScreenshotInfoForPurchaseHistoryIDs_completionHandler___block_invoke;
    v15[3] = &unk_1E438E500;
    v10 = v7;
    v16 = v10;
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudClient configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __75__ICCloudClient_loadScreenshotInfoForPurchaseHistoryIDs_completionHandler___block_invoke_2;
    v13[3] = &unk_1E438A520;
    v14 = v10;
    objc_msgSend(v11, "loadScreenshotInfoForPurchaseHistoryIDs:configuration:completion:", v6, v12, v13);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA60]);
  }

}

- (void)loadArtworkInfoForSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__ICCloudClient_loadArtworkInfoForSagaID_completionHandler___block_invoke;
  v10[3] = &unk_1E438A4F8;
  v11 = v6;
  v9 = v6;
  -[ICCloudClient loadArtworkInfoForSagaIDs:completionHandler:](self, "loadArtworkInfoForSagaIDs:completionHandler:", v8, v10);

}

- (void)loadArtworkInfoForSagaIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    -[ICCloudClient xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __61__ICCloudClient_loadArtworkInfoForSagaIDs_completionHandler___block_invoke;
    v15[3] = &unk_1E438E500;
    v10 = v7;
    v16 = v10;
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudClient configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __61__ICCloudClient_loadArtworkInfoForSagaIDs_completionHandler___block_invoke_2;
    v13[3] = &unk_1E438A520;
    v14 = v10;
    objc_msgSend(v11, "loadArtworkInfoForSagaIDs:configuration:completion:", v6, v12, v13);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA60]);
  }

}

- (void)loadArtworkInfoForContainerSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__ICCloudClient_loadArtworkInfoForContainerSagaID_completionHandler___block_invoke;
  v10[3] = &unk_1E438A4F8;
  v11 = v6;
  v9 = v6;
  -[ICCloudClient loadArtworkInfoForContainerSagaIDs:completionHandler:](self, "loadArtworkInfoForContainerSagaIDs:completionHandler:", v8, v10);

}

- (void)loadArtworkInfoForContainerSagaIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    -[ICCloudClient xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __70__ICCloudClient_loadArtworkInfoForContainerSagaIDs_completionHandler___block_invoke;
    v15[3] = &unk_1E438E500;
    v10 = v7;
    v16 = v10;
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudClient configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __70__ICCloudClient_loadArtworkInfoForContainerSagaIDs_completionHandler___block_invoke_2;
    v13[3] = &unk_1E438A520;
    v14 = v10;
    objc_msgSend(v11, "loadArtworkInfoForContainerSagaIDs:configuration:completion:", v6, v12, v13);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA60]);
  }

}

- (void)loadScreenshotInfoForSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__ICCloudClient_loadScreenshotInfoForSagaID_completionHandler___block_invoke;
  v10[3] = &unk_1E438A4F8;
  v11 = v6;
  v9 = v6;
  -[ICCloudClient loadScreenshotInfoForSagaIDs:completionHandler:](self, "loadScreenshotInfoForSagaIDs:completionHandler:", v8, v10);

}

- (void)loadScreenshotInfoForSagaIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    -[ICCloudClient xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __64__ICCloudClient_loadScreenshotInfoForSagaIDs_completionHandler___block_invoke;
    v15[3] = &unk_1E438E500;
    v10 = v7;
    v16 = v10;
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudClient configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __64__ICCloudClient_loadScreenshotInfoForSagaIDs_completionHandler___block_invoke_2;
    v13[3] = &unk_1E438A520;
    v14 = v10;
    objc_msgSend(v11, "loadScreenshotInfoForSagaIDs:configuration:completion:", v6, v12, v13);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA60]);
  }

}

- (void)loadArtworkInfoForSubscriptionItemPersistentID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__ICCloudClient_loadArtworkInfoForSubscriptionItemPersistentID_completionHandler___block_invoke;
  v10[3] = &unk_1E438A4F8;
  v11 = v6;
  v9 = v6;
  -[ICCloudClient loadArtworkInfoForSubscriptionItemPersistentIDs:completionHandler:](self, "loadArtworkInfoForSubscriptionItemPersistentIDs:completionHandler:", v8, v10);

}

- (void)loadArtworkInfoForSubscriptionItemPersistentIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    -[ICCloudClient xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __83__ICCloudClient_loadArtworkInfoForSubscriptionItemPersistentIDs_completionHandler___block_invoke;
    v15[3] = &unk_1E438E500;
    v10 = v7;
    v16 = v10;
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudClient configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __83__ICCloudClient_loadArtworkInfoForSubscriptionItemPersistentIDs_completionHandler___block_invoke_2;
    v13[3] = &unk_1E438A520;
    v14 = v10;
    objc_msgSend(v11, "loadArtworkInfoForSubscriptionItemPersistentIDs:configuration:completion:", v6, v12, v13);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA60]);
  }

}

- (void)loadScreenshotInfoForSubscriptionPersistentID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__ICCloudClient_loadScreenshotInfoForSubscriptionPersistentID_completionHandler___block_invoke;
  v10[3] = &unk_1E438A4F8;
  v11 = v6;
  v9 = v6;
  -[ICCloudClient loadScreenshotInfoForSubscriptionPersistentIDs:completionHandler:](self, "loadScreenshotInfoForSubscriptionPersistentIDs:completionHandler:", v8, v10);

}

- (void)loadScreenshotInfoForSubscriptionPersistentIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    -[ICCloudClient xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __82__ICCloudClient_loadScreenshotInfoForSubscriptionPersistentIDs_completionHandler___block_invoke;
    v15[3] = &unk_1E438E500;
    v10 = v7;
    v16 = v10;
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudClient configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __82__ICCloudClient_loadScreenshotInfoForSubscriptionPersistentIDs_completionHandler___block_invoke_2;
    v13[3] = &unk_1E438A520;
    v14 = v10;
    objc_msgSend(v11, "loadScreenshotInfoForSubscriptionPersistentIDs:configuration:completion:", v6, v12, v13);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA60]);
  }

}

- (void)loadArtworkInfoForSubscriptionContainerPersistentID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__ICCloudClient_loadArtworkInfoForSubscriptionContainerPersistentID_completionHandler___block_invoke;
  v10[3] = &unk_1E438A4F8;
  v11 = v6;
  v9 = v6;
  -[ICCloudClient loadArtworkInfoForSubscriptionContainerPersistentIDs:completionHandler:](self, "loadArtworkInfoForSubscriptionContainerPersistentIDs:completionHandler:", v8, v10);

}

- (void)loadArtworkInfoForSubscriptionContainerPersistentIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    -[ICCloudClient xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __88__ICCloudClient_loadArtworkInfoForSubscriptionContainerPersistentIDs_completionHandler___block_invoke;
    v15[3] = &unk_1E438E500;
    v10 = v7;
    v16 = v10;
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudClient configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __88__ICCloudClient_loadArtworkInfoForSubscriptionContainerPersistentIDs_completionHandler___block_invoke_2;
    v13[3] = &unk_1E438A520;
    v14 = v10;
    objc_msgSend(v11, "loadArtworkInfoForSubscriptionContainerPersistentIDs:configuration:completion:", v6, v12, v13);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA60]);
  }

}

- (void)loadMissingArtwork
{
  void *v3;
  void *v4;
  id v5;

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_3641);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadMissingArtworkForConfiguration:", v4);

}

- (void)loadGeniusItemsForSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  void (**v16)(_QWORD, _QWORD, _QWORD);
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  if (a3)
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v20 = a3;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "Sending load genius items request for saga ID %llu...", buf, 0xCu);
    }

    -[ICCloudClient xpcConnection](self, "xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __60__ICCloudClient_loadGeniusItemsForSagaID_completionHandler___block_invoke;
    v17[3] = &unk_1E438E500;
    v11 = v7;
    v18 = v11;
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudClient configuration](self, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __60__ICCloudClient_loadGeniusItemsForSagaID_completionHandler___block_invoke_2;
    v15[3] = &unk_1E438C2C0;
    v16 = v11;
    objc_msgSend(v12, "loadGeniusItemsForSagaID:configuration:completion:", a3, v13, v15);

  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ic_cloudClientErrorWithCode:userInfo:", 2015, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v14);

  }
}

- (void)loadIsUpdateInProgressWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__ICCloudClient_loadIsUpdateInProgressWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E438E500;
  v7 = v4;
  v14 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __61__ICCloudClient_loadIsUpdateInProgressWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E438A568;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v8, "loadIsUpdateInProgressForConfiguration:completion:", v9, v11);

}

- (void)loadUpdateProgressWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__ICCloudClient_loadUpdateProgressWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E438E500;
  v7 = v4;
  v14 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __57__ICCloudClient_loadUpdateProgressWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E438A5B8;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v8, "loadUpdateProgressForConfiguration:completion:", v9, v11);

}

- (void)loadIsSagaUpdateInProgressWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__ICCloudClient_loadIsSagaUpdateInProgressWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E438E500;
  v7 = v4;
  v14 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __65__ICCloudClient_loadIsSagaUpdateInProgressWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E438A568;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v8, "loadIsSagaUpdateInProgressForConfiguration:completion:", v9, v11);

}

- (void)loadSagaUpdateProgressWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__ICCloudClient_loadSagaUpdateProgressWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E438E500;
  v7 = v4;
  v14 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __61__ICCloudClient_loadSagaUpdateProgressWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E438A5B8;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v8, "loadSagaUpdateProgressForConfiguration:completion:", v9, v11);

}

- (void)loadJaliscoUpdateProgressWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__ICCloudClient_loadJaliscoUpdateProgressWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E438E500;
  v7 = v4;
  v14 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __64__ICCloudClient_loadJaliscoUpdateProgressWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E438A5B8;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v8, "loadJaliscoUpdateProgressForConfiguration:completion:", v9, v11);

}

- (BOOL)initialLibrarySyncsComplete
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  BOOL v20;
  int v21;
  unsigned int v22;
  NSObject *v23;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[ICCloudClient configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(getML3MusicLibraryClass(), "musicLibraryForUserAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userIdentityStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v7, "getPropertiesForUserIdentity:error:", v4, &v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v25;

  if (v9)
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v9;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_ERROR, "Check for initial library syncs completion failed to load identity properties. err = %{public}@", buf, 0xCu);
    }

  }
  v11 = objc_msgSend(v5, "jaliscoOnDiskDatabaseRevision");
  v12 = objc_msgSend(v5, "sagaOnDiskDatabaseRevision");
  objc_msgSend(v5, "syncLibraryID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v8, "isActiveLocker");
  v15 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138544386;
    v27 = v4;
    v28 = 2048;
    v29 = v11;
    v30 = 2048;
    v31 = v12;
    v32 = 2114;
    v33 = v13;
    v34 = 1024;
    v35 = v14;
    _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_ERROR, "Checking if initial library syncs are completed. userIdentity = %{public}@, jaliscoOnDiskDatabaseRevision=%ld, sagaOnDiskDatabaseRevision=%ld, syncLibraryID=%{public}@, isActiveLocker=%{BOOL}u", buf, 0x30u);
  }

  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isWatch"))
  {
    +[ICNanoPairedDeviceStatusMonitor sharedMonitor](ICNanoPairedDeviceStatusMonitor, "sharedMonitor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isMediaSyncingSupported") ^ 1;
    if (v13)
      v19 = 1;
    else
      v19 = v18;

  }
  else
  {
    v19 = 1;
  }

  if (v8)
    v20 = v11 == 0;
  else
    v20 = 0;
  v21 = !v20;
  v22 = ((v12 != 0) | ~objc_msgSend(v8, "isActiveLocker")) & v21 & v19;
  v23 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = v22;
    _os_log_impl(&dword_1A03E3000, v23, OS_LOG_TYPE_ERROR, "Initial library syncs completed: %{BOOL}u", buf, 8u);
  }

  return v22;
}

- (void)reportAppIconBadgeActionMetrics
{
  id v2;

  -[ICCloudClient badgingService](self, "badgingService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportAppIconBadgeActionMetrics");

}

- (void)resetConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[ICCloudClient serialAccessQueue](self, "serialAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__ICCloudClient_resetConfiguration___block_invoke;
  block[3] = &unk_1E4391110;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)resignActive
{
  -[ICCloudClient setActive:](self, "setActive:", 0);
}

- (void)setPreferredVideoQuality:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int64_t preferredVideoQuality;
  void *v9;
  _QWORD v10[6];

  -[ICCloudClient serialAccessQueue](self, "serialAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__ICCloudClient_setPreferredVideoQuality___block_invoke;
  v10[3] = &unk_1E438E1E8;
  v10[4] = self;
  v10[5] = a3;
  dispatch_sync(v5, v10);

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  preferredVideoQuality = self->_preferredVideoQuality;
  -[ICCloudClient configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferredVideoQuality:forConfiguration:completion:", preferredVideoQuality, v9, &__block_literal_global_129);

}

- (void)setItemProperties:(id)a3 forPurchaseHistoryID:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543618;
      v12 = v6;
      v13 = 2048;
      v14 = a4;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "Setting item properties %{public}@ for purchaseHistoryID %llu...", (uint8_t *)&v11, 0x16u);
    }

    -[ICCloudClient xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_130);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudClient configuration](self, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setItemProperties:forPurchaseHistoryID:configuration:completion:", v6, a4, v10, &__block_literal_global_132);

  }
}

- (void)setItemProperties:(id)a3 forSagaID:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543618;
      v12 = v6;
      v13 = 2048;
      v14 = a4;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "Setting item properties %{public}@ for saga ID %llu...", (uint8_t *)&v11, 0x16u);
    }

    -[ICCloudClient xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_133);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudClient configuration](self, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setItemProperties:forSagaID:configuration:completion:", v6, a4, v10, &__block_literal_global_135);

  }
}

- (void)uploadCloudItemProperties
{
  void *v3;
  void *v4;
  id v5;

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_136);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uploadCloudItemPropertiesForConfiguration:completion:", v4, &__block_literal_global_138);

}

- (void)uploadCloudPlaylistProperties
{
  void *v3;
  void *v4;
  id v5;

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_139);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uploadCloudPlaylistPropertiesForConfiguration:completion:", v4, &__block_literal_global_141);

}

- (void)setAlbumProperties:(id)a3 forAlbumPersistentID:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  int64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v22 = v8;
    v23 = 2048;
    v24 = a4;
    _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "Setting album properties %{public}@ for persistent ID %llu...", buf, 0x16u);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __75__ICCloudClient_setAlbumProperties_forAlbumPersistentID_completionHandler___block_invoke;
  v19[3] = &unk_1E438E500;
  v13 = v9;
  v20 = v13;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __75__ICCloudClient_setAlbumProperties_forAlbumPersistentID_completionHandler___block_invoke_2;
  v17[3] = &unk_1E438E500;
  v18 = v13;
  v16 = v13;
  objc_msgSend(v14, "setAlbumProperties:forAlbumPersistentID:configuration:completion:", v8, a4, v15, v17);

}

- (void)setAlbumEntityProperties:(id)a3 forAlbumPersistentID:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  int64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v22 = v8;
    v23 = 2048;
    v24 = a4;
    _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "Setting album properties %{public}@ for persistent ID %llu ...", buf, 0x16u);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __81__ICCloudClient_setAlbumEntityProperties_forAlbumPersistentID_completionHandler___block_invoke;
  v19[3] = &unk_1E438E500;
  v13 = v9;
  v20 = v13;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __81__ICCloudClient_setAlbumEntityProperties_forAlbumPersistentID_completionHandler___block_invoke_2;
  v17[3] = &unk_1E438E500;
  v18 = v13;
  v16 = v13;
  objc_msgSend(v14, "setAlbumEntityProperties:forAlbumPersistentID:configuration:completion:", v8, a4, v15, v17);

}

- (void)setAlbumArtistProperties:(id)a3 forAlbumArtistPersistentID:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  int64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v22 = v8;
    v23 = 2048;
    v24 = a4;
    _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "Setting album artist properties %{public}@ for persistent ID %llu...", buf, 0x16u);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __87__ICCloudClient_setAlbumArtistProperties_forAlbumArtistPersistentID_completionHandler___block_invoke;
  v19[3] = &unk_1E438E500;
  v13 = v9;
  v20 = v13;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __87__ICCloudClient_setAlbumArtistProperties_forAlbumArtistPersistentID_completionHandler___block_invoke_2;
  v17[3] = &unk_1E438E500;
  v18 = v13;
  v16 = v13;
  objc_msgSend(v14, "setAlbumArtistProperties:forAlbumArtistPersistentID:configuration:completion:", v8, a4, v15, v17);

}

- (void)updateArtistHeroImages
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "Sending request to update artist hero images...", v7, 2u);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_148);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateArtistHeroImagesForConfiguration:", v6);

}

- (void)loadBooksForStoreIDs:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v7 = a3;
  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __60__ICCloudClient_loadBooksForStoreIDs_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E438E500;
  v10 = v6;
  v17 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudClient configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __60__ICCloudClient_loadBooksForStoreIDs_withCompletionHandler___block_invoke_2;
  v14[3] = &unk_1E438C2C0;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v11, "loadBooksForStoreIDs:configuration:completion:", v7, v12, v14);

}

- (void)handleAutomaticDownloadPreferenceChangedForMediaKindMusic:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  ICStoreRequestContext *v9;
  void *v10;
  ICStoreRequestContext *v11;
  ICUpdateAutomaticDownloadMediaKindsRequest *v12;
  void *v13;
  void *v14;
  ICUpdateAutomaticDownloadMediaKindsRequest *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  BOOL v19;
  uint8_t buf[4];
  ICCloudClient *v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v4 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = self;
    v22 = 1024;
    v23 = v4;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating automatic download preference change. shouldAutomaticallyDownload=%{BOOL}u", buf, 0x12u);
  }

  +[ICUpdateAutomaticDownloadMediaKindsRequest automaticDownloadMediaKindsForMusic](ICUpdateAutomaticDownloadMediaKindsRequest, "automaticDownloadMediaKindsForMusic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [ICStoreRequestContext alloc];
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ICStoreRequestContext initWithIdentity:](v9, "initWithIdentity:", v10);

  v12 = [ICUpdateAutomaticDownloadMediaKindsRequest alloc];
  if (v4)
    v13 = v8;
  else
    v13 = 0;
  if (v4)
    v14 = 0;
  else
    v14 = v8;
  v15 = -[ICUpdateAutomaticDownloadMediaKindsRequest initWithRequestContext:mediaKindsToAdd:mediaKindsToRemove:](v12, "initWithRequestContext:mediaKindsToAdd:mediaKindsToRemove:", v11, v13, v14);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __97__ICCloudClient_handleAutomaticDownloadPreferenceChangedForMediaKindMusic_withCompletionHandler___block_invoke;
  v17[3] = &unk_1E438BA58;
  v19 = v4;
  v17[4] = self;
  v18 = v6;
  v16 = v6;
  -[ICRequestOperation performRequestWithCompletionHandler:](v15, "performRequestWithCompletionHandler:", v17);

}

- (BOOL)isAutomaticDownloadsEnabledForMediaKindMusic
{
  void *v2;
  void *v3;
  id v4;
  int v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ic_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "ic_activeStoreAccountWithError:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;

  if (v3)
  {
    v5 = objc_msgSend(v3, "ic_isAutomaticDownloadsEnabledForMediaKindMusic");
    v6 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v10) = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "Automatic downloads are %{BOOL}u for media kind music", buf, 8u);
    }
  }
  else
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v4;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "Not able to determine if automatic downloads are enabled for media kind music. Could not load active store account: error=%{public}@", buf, 0xCu);
    }
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)hasSetPreferenceForAutomaticDownloads
{
  void *v2;
  char v3;

  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "automaticDownloadsEnabled");

  return v3;
}

- (BOOL)createMusicNotificationFromAMSDialogRequest:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  ICBundleIdentifierForSystemApplicationType(0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICInAppMessageManager sharedManager](ICInAppMessageManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addMessageEntryFromAMSDialogRequest:bundleIdentifier:completion:", v5, v6, &__block_literal_global_158);

  if (a4)
    *a4 = 0;

  return 1;
}

- (void)refreshEnhancedAudioSharedKeys
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "Sending request to refresh enhanced-audio shared keys...", v6, 2u);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_159);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "refreshEnhancedAudioSharedKeys");

}

- (void)fetchEnhancedAudioOfflineKeys
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "Sending request to fetch enhanced-audio offline keys...", v6, 2u);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_160);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchEnhancedAudioOfflineKeys");

}

- (void)processPendingKeyInvalidations
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "Sending request to process pending key invalidations...", v6, 2u);
  }

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_161_3634);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processPendingKeyInvalidations");

}

- (void)notifyDeviceSetupFinishedWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  ICCloudServerListenerEndpointProvider *listenerEndpointProvider;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "Sending notification that setup has completed...", buf, 2u);
  }

  listenerEndpointProvider = self->_listenerEndpointProvider;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__ICCloudClient_notifyDeviceSetupFinishedWithCompletion___block_invoke;
  v8[3] = &unk_1E438E500;
  v9 = v4;
  v7 = v4;
  -[ICCloudServerListenerEndpointProvider notifyDeviceSetupFinishedWithCompletion:](listenerEndpointProvider, "notifyDeviceSetupFinishedWithCompletion:", v8);

}

- (void)listCloudServerOperations
{
  void *v2;
  id v3;

  -[ICCloudClient xpcConnection](self, "xpcConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_162);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "listCloudServerOperations");

}

- (BOOL)hasProperNetworkConditionsToShowCloudMedia
{
  void *v2;
  char v3;

  -[ICCloudClient availabilityService](self, "availabilityService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasProperNetworkConditionsToShowCloudMedia");

  return v3;
}

- (BOOL)isCellularDataRestrictedForMusic
{
  void *v2;
  char v3;

  -[ICCloudClient availabilityService](self, "availabilityService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCellularDataRestrictedForMusic");

  return v3;
}

- (BOOL)shouldProhibitMusicActionForCurrentNetworkConditions
{
  void *v2;
  char v3;

  -[ICCloudClient availabilityService](self, "availabilityService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldProhibitMusicActionForCurrentNetworkConditions");

  return v3;
}

- (BOOL)isCellularDataRestrictedForVideos
{
  void *v2;
  char v3;

  -[ICCloudClient availabilityService](self, "availabilityService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCellularDataRestrictedForVideos");

  return v3;
}

- (BOOL)shouldProhibitVideosActionForCurrentNetworkConditions
{
  void *v2;
  char v3;

  -[ICCloudClient availabilityService](self, "availabilityService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldProhibitVideosActionForCurrentNetworkConditions");

  return v3;
}

- (BOOL)isCellularDataRestrictedForStoreApps
{
  void *v2;
  char v3;

  -[ICCloudClient availabilityService](self, "availabilityService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCellularDataRestrictedForStoreApps");

  return v3;
}

- (BOOL)shouldProhibitStoreAppsActionForCurrentNetworkConditions
{
  void *v2;
  char v3;

  -[ICCloudClient availabilityService](self, "availabilityService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldProhibitStoreAppsActionForCurrentNetworkConditions");

  return v3;
}

- (BOOL)canShowCloudDownloadButtons
{
  void *v2;
  char v3;

  -[ICCloudClient availabilityService](self, "availabilityService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canShowCloudDownloadButtons");

  return v3;
}

- (BOOL)isCellularDataRestricted
{
  void *v2;
  char v3;

  -[ICCloudClient availabilityService](self, "availabilityService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCellularDataRestrictedForStoreApps");

  return v3;
}

- (BOOL)shouldProhibitActionsForCurrentNetworkConditions
{
  void *v2;
  char v3;

  -[ICCloudClient availabilityService](self, "availabilityService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldProhibitStoreAppsActionForCurrentNetworkConditions");

  return v3;
}

- (void)_serverSetupDidComplete
{
  NSObject *serverSetupBlockQueue;
  _QWORD block[5];

  serverSetupBlockQueue = self->_serverSetupBlockQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ICCloudClient__serverSetupDidComplete__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_async(serverSetupBlockQueue, block);
}

- (void)_serverSagaUpdateInProgressDidChange
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  ICCloudClient *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[ICCloudClient updateSagaInProgressChangedHandler](self, "updateSagaInProgressChangedHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v8 = self;
    v9 = 1024;
    v10 = v3 != 0;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - Receveived Saga update in progress notification [Handler present: %{BOOL}u", buf, 0x12u);
  }

  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __53__ICCloudClient__serverSagaUpdateInProgressDidChange__block_invoke;
    v5[3] = &unk_1E438A568;
    v6 = v3;
    -[ICCloudClient loadIsSagaUpdateInProgressWithCompletionHandler:](self, "loadIsSagaUpdateInProgressWithCompletionHandler:", v5);

  }
}

- (id)updateSagaInProgressChangedHandler
{
  return self->_updateSagaInProgressChangedHandler;
}

- (void)setUpdateSagaInProgressChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (ICCloudServerListenerEndpointProvider)listenerEndpointProvider
{
  return self->_listenerEndpointProvider;
}

- (OS_dispatch_queue)serverSetupBlockQueue
{
  return self->_serverSetupBlockQueue;
}

- (int64_t)preferredVideoQuality
{
  return self->_preferredVideoQuality;
}

- (ICCloudBadgingService)badgingService
{
  return self->_badgingService;
}

- (NSMutableArray)pendingServerSetupCompleteBlocks
{
  return self->_pendingServerSetupCompleteBlocks;
}

- (void)setPendingServerSetupCompleteBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_pendingServerSetupCompleteBlocks, a3);
}

- (BOOL)serverIsSetup
{
  return self->_serverIsSetup;
}

- (void)setServerIsSetup:(BOOL)a3
{
  self->_serverIsSetup = a3;
}

uint64_t __53__ICCloudClient__serverSagaUpdateInProgressDidChange__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __40__ICCloudClient__serverSetupDidComplete__block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "serverIsSetup");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setServerIsSetup:", 1);
    v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "count");
      *(_DWORD *)buf = 67109120;
      v17 = v4;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "Running %d blocks.", buf, 8u);
    }

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = objc_unsafeClaimAutoreleasedReturnValue((id)(*(uint64_t (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9)
                                                                                              + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9)));
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeAllObjects", (_QWORD)v11);
  }
  return result;
}

void __42__ICCloudClient_listCloudServerOperations__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_ERROR, "Failed to list cloud server operations with error: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __57__ICCloudClient_notifyDeviceSetupFinishedWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "msv_description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_ERROR, "Completing sending setup completed notification error=%{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "Completing sending setup completed notification", (uint8_t *)&v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __47__ICCloudClient_processPendingKeyInvalidations__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_ERROR, "Failed to invalidate offline keys. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __46__ICCloudClient_fetchEnhancedAudioOfflineKeys__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_ERROR, "Failed to fetch enhanced-audio offline keys. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __47__ICCloudClient_refreshEnhancedAudioSharedKeys__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_ERROR, "Failed to refresh enhanced-audio shared keys. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __67__ICCloudClient_createMusicNotificationFromAMSDialogRequest_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_ERROR, "Failed to add message entry from AMS dialog. err=%{public}@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __97__ICCloudClient_handleAutomaticDownloadPreferenceChangedForMediaKindMusic_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "msv_description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v6;
      v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Automatic download media kind update task completed error=%{public}@", buf, 0x16u);

    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v15 = v8;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Automatic download media kind update task completed", buf, 0xCu);
    }

    +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject setAutomaticDownloadsEnabled:](v5, "setAutomaticDownloadsEnabled:", *(unsigned __int8 *)(a1 + 48));
  }

  v9 = *(void **)(a1 + 40);
  if (v9)
  {
    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __97__ICCloudClient_handleAutomaticDownloadPreferenceChangedForMediaKindMusic_withCompletionHandler___block_invoke_155;
    v11[3] = &unk_1E4390EF8;
    v13 = v9;
    v12 = v3;
    dispatch_async(v10, v11);

  }
}

uint64_t __97__ICCloudClient_handleAutomaticDownloadPreferenceChangedForMediaKindMusic_withCompletionHandler___block_invoke_155(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __60__ICCloudClient_loadBooksForStoreIDs_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Load Books failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__ICCloudClient_loadBooksForStoreIDs_withCompletionHandler___block_invoke_149;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __60__ICCloudClient_loadBooksForStoreIDs_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "Load Books failed with error: %{public}@", buf, 0xCu);
    }

  }
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__ICCloudClient_loadBooksForStoreIDs_withCompletionHandler___block_invoke_150;
    block[3] = &unk_1E4390E58;
    v13 = v8;
    v11 = v5;
    v12 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __60__ICCloudClient_loadBooksForStoreIDs_withCompletionHandler___block_invoke_150(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __60__ICCloudClient_loadBooksForStoreIDs_withCompletionHandler___block_invoke_149(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __39__ICCloudClient_updateArtistHeroImages__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_ERROR, "Failed to update artist hero images with error: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __87__ICCloudClient_setAlbumArtistProperties_forAlbumArtistPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Failed to set album artist properties with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __87__ICCloudClient_setAlbumArtistProperties_forAlbumArtistPersistentID_completionHandler___block_invoke_146;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __87__ICCloudClient_setAlbumArtistProperties_forAlbumArtistPersistentID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Failed to set album artist properties with error: %{public}@", buf, 0xCu);
    }

  }
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __87__ICCloudClient_setAlbumArtistProperties_forAlbumArtistPersistentID_completionHandler___block_invoke_147;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __87__ICCloudClient_setAlbumArtistProperties_forAlbumArtistPersistentID_completionHandler___block_invoke_147(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __87__ICCloudClient_setAlbumArtistProperties_forAlbumArtistPersistentID_completionHandler___block_invoke_146(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __81__ICCloudClient_setAlbumEntityProperties_forAlbumPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Failed to set collection properties with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __81__ICCloudClient_setAlbumEntityProperties_forAlbumPersistentID_completionHandler___block_invoke_144;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __81__ICCloudClient_setAlbumEntityProperties_forAlbumPersistentID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Failed to set collection properties with error: %{public}@", buf, 0xCu);
    }

  }
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __81__ICCloudClient_setAlbumEntityProperties_forAlbumPersistentID_completionHandler___block_invoke_145;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __81__ICCloudClient_setAlbumEntityProperties_forAlbumPersistentID_completionHandler___block_invoke_145(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __81__ICCloudClient_setAlbumEntityProperties_forAlbumPersistentID_completionHandler___block_invoke_144(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __75__ICCloudClient_setAlbumProperties_forAlbumPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Failed to set collection properties with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __75__ICCloudClient_setAlbumProperties_forAlbumPersistentID_completionHandler___block_invoke_142;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __75__ICCloudClient_setAlbumProperties_forAlbumPersistentID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Failed to set collection properties with error: %{public}@", buf, 0xCu);
    }

  }
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __75__ICCloudClient_setAlbumProperties_forAlbumPersistentID_completionHandler___block_invoke_143;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __75__ICCloudClient_setAlbumProperties_forAlbumPersistentID_completionHandler___block_invoke_143(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __75__ICCloudClient_setAlbumProperties_forAlbumPersistentID_completionHandler___block_invoke_142(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __46__ICCloudClient_uploadCloudPlaylistProperties__block_invoke_140(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_ERROR, "Failed to update cloud plaulist properties with error: %{public}@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __46__ICCloudClient_uploadCloudPlaylistProperties__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_ERROR, "Failed to update cloud plaulist properties with error: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __42__ICCloudClient_uploadCloudItemProperties__block_invoke_137(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_ERROR, "Failed to update cloud item properties with error: %{public}@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __42__ICCloudClient_uploadCloudItemProperties__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_ERROR, "Failed to update cloud item properties with error: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __45__ICCloudClient_setItemProperties_forSagaID___block_invoke_134(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_ERROR, "Failed to set item properties with error: %{public}@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __45__ICCloudClient_setItemProperties_forSagaID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_ERROR, "Failed to set item properties with error: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __56__ICCloudClient_setItemProperties_forPurchaseHistoryID___block_invoke_131(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_ERROR, "Failed to set item properties with error: %{public}@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __56__ICCloudClient_setItemProperties_forPurchaseHistoryID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "Failed to set item properties with error: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

uint64_t __42__ICCloudClient_setPreferredVideoQuality___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 64) = *(_QWORD *)(result + 40);
  return result;
}

void __36__ICCloudClient_resetConfiguration___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

void __64__ICCloudClient_loadJaliscoUpdateProgressWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Jalisco update progress failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__ICCloudClient_loadJaliscoUpdateProgressWithCompletionHandler___block_invoke_125;
    block[3] = &unk_1E4390D18;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

void __64__ICCloudClient_loadJaliscoUpdateProgressWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, float a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  float v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "Jalisco update progress failed with error: %{public}@", buf, 0xCu);
    }

  }
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__ICCloudClient_loadJaliscoUpdateProgressWithCompletionHandler___block_invoke_126;
    v9[3] = &unk_1E438A590;
    v10 = v7;
    v11 = a3;
    dispatch_async(v8, v9);

  }
}

uint64_t __64__ICCloudClient_loadJaliscoUpdateProgressWithCompletionHandler___block_invoke_126(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, float))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(float *)(a1 + 40));
}

uint64_t __64__ICCloudClient_loadJaliscoUpdateProgressWithCompletionHandler___block_invoke_125(uint64_t a1)
{
  return (*(uint64_t (**)(float))(*(_QWORD *)(a1 + 32) + 16))(3.4028e38);
}

void __61__ICCloudClient_loadSagaUpdateProgressWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Saga update progress failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__ICCloudClient_loadSagaUpdateProgressWithCompletionHandler___block_invoke_123;
    block[3] = &unk_1E4390D18;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

void __61__ICCloudClient_loadSagaUpdateProgressWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, float a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  float v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "Saga update progress failed with error: %{public}@", buf, 0xCu);
    }

  }
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__ICCloudClient_loadSagaUpdateProgressWithCompletionHandler___block_invoke_124;
    v9[3] = &unk_1E438A590;
    v10 = v7;
    v11 = a3;
    dispatch_async(v8, v9);

  }
}

uint64_t __61__ICCloudClient_loadSagaUpdateProgressWithCompletionHandler___block_invoke_124(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, float))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(float *)(a1 + 40));
}

uint64_t __61__ICCloudClient_loadSagaUpdateProgressWithCompletionHandler___block_invoke_123(uint64_t a1)
{
  return (*(uint64_t (**)(float))(*(_QWORD *)(a1 + 32) + 16))(3.4028e38);
}

void __68__ICCloudClient_loadIsJaliscoUpdateInProgressWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Jalisco load Update In Progress failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__ICCloudClient_loadIsJaliscoUpdateInProgressWithCompletionHandler___block_invoke_122;
    block[3] = &unk_1E4390D18;
    v7 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __68__ICCloudClient_loadIsJaliscoUpdateInProgressWithCompletionHandler___block_invoke_122(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__ICCloudClient_loadIsSagaUpdateInProgressWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Saga update In Progress failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__ICCloudClient_loadIsSagaUpdateInProgressWithCompletionHandler___block_invoke_121;
    block[3] = &unk_1E4390D18;
    v7 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __65__ICCloudClient_loadIsSagaUpdateInProgressWithCompletionHandler___block_invoke_2(uint64_t a1, char a2, char a3)
{
  void *v3;
  _QWORD v6[4];
  id v7;
  char v8;
  char v9;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65__ICCloudClient_loadIsSagaUpdateInProgressWithCompletionHandler___block_invoke_3;
    v6[3] = &unk_1E438FC28;
    v7 = v3;
    v8 = a2;
    v9 = a3;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

uint64_t __65__ICCloudClient_loadIsSagaUpdateInProgressWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

uint64_t __65__ICCloudClient_loadIsSagaUpdateInProgressWithCompletionHandler___block_invoke_121(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__ICCloudClient_loadUpdateProgressWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Load Update In Progress failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__ICCloudClient_loadUpdateProgressWithCompletionHandler___block_invoke_118;
    block[3] = &unk_1E4390D18;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

void __57__ICCloudClient_loadUpdateProgressWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, float a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  float v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "Load Update In Progress failed with error: %{public}@", buf, 0xCu);
    }

  }
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__ICCloudClient_loadUpdateProgressWithCompletionHandler___block_invoke_119;
    v9[3] = &unk_1E438A590;
    v10 = v7;
    v11 = a3;
    dispatch_async(v8, v9);

  }
}

uint64_t __57__ICCloudClient_loadUpdateProgressWithCompletionHandler___block_invoke_119(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, float))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(float *)(a1 + 40));
}

uint64_t __57__ICCloudClient_loadUpdateProgressWithCompletionHandler___block_invoke_118(uint64_t a1)
{
  return (*(uint64_t (**)(float))(*(_QWORD *)(a1 + 32) + 16))(3.4028e38);
}

void __61__ICCloudClient_loadIsUpdateInProgressWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Load Update In Progress failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__ICCloudClient_loadIsUpdateInProgressWithCompletionHandler___block_invoke_116;
    block[3] = &unk_1E4390D18;
    v7 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __61__ICCloudClient_loadIsUpdateInProgressWithCompletionHandler___block_invoke_2(uint64_t a1, char a2, char a3)
{
  void *v3;
  _QWORD v6[4];
  id v7;
  char v8;
  char v9;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61__ICCloudClient_loadIsUpdateInProgressWithCompletionHandler___block_invoke_3;
    v6[3] = &unk_1E438FC28;
    v7 = v3;
    v8 = a2;
    v9 = a3;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

uint64_t __61__ICCloudClient_loadIsUpdateInProgressWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

uint64_t __61__ICCloudClient_loadIsUpdateInProgressWithCompletionHandler___block_invoke_116(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__ICCloudClient_loadGeniusItemsForSagaID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Load Genius Items failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__ICCloudClient_loadGeniusItemsForSagaID_completionHandler___block_invoke_113;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __60__ICCloudClient_loadGeniusItemsForSagaID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "Load Genius Items failed with error: %{public}@", buf, 0xCu);
    }

  }
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__ICCloudClient_loadGeniusItemsForSagaID_completionHandler___block_invoke_114;
    block[3] = &unk_1E4390E58;
    v13 = v8;
    v11 = v5;
    v12 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __60__ICCloudClient_loadGeniusItemsForSagaID_completionHandler___block_invoke_114(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __60__ICCloudClient_loadGeniusItemsForSagaID_completionHandler___block_invoke_113(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __35__ICCloudClient_loadMissingArtwork__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_ERROR, "loadMissingArtwork failed with error: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __88__ICCloudClient_loadArtworkInfoForSubscriptionContainerPersistentIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Load Subscription Container Artwork Info failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__ICCloudClient_loadArtworkInfoForSubscriptionContainerPersistentIDs_completionHandler___block_invoke_111;
    block[3] = &unk_1E4390D18;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

void __88__ICCloudClient_loadArtworkInfoForSubscriptionContainerPersistentIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v5;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "Load Subscription Container Artwork Info failed with error: %{public}@", buf, 0xCu);
    }

  }
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __88__ICCloudClient_loadArtworkInfoForSubscriptionContainerPersistentIDs_completionHandler___block_invoke_112;
    v10[3] = &unk_1E4390EF8;
    v12 = v8;
    v11 = v6;
    dispatch_async(v9, v10);

  }
}

uint64_t __88__ICCloudClient_loadArtworkInfoForSubscriptionContainerPersistentIDs_completionHandler___block_invoke_112(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __88__ICCloudClient_loadArtworkInfoForSubscriptionContainerPersistentIDs_completionHandler___block_invoke_111(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__ICCloudClient_loadArtworkInfoForSubscriptionContainerPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "firstObject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __82__ICCloudClient_loadScreenshotInfoForSubscriptionPersistentIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Load Subscription Screenshot Artwork Info failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__ICCloudClient_loadScreenshotInfoForSubscriptionPersistentIDs_completionHandler___block_invoke_109;
    block[3] = &unk_1E4390D18;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

void __82__ICCloudClient_loadScreenshotInfoForSubscriptionPersistentIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v5;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "Load Subscription Screenshot Artwork Info failed with error: %{public}@", buf, 0xCu);
    }

  }
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __82__ICCloudClient_loadScreenshotInfoForSubscriptionPersistentIDs_completionHandler___block_invoke_110;
    v10[3] = &unk_1E4390EF8;
    v12 = v8;
    v11 = v6;
    dispatch_async(v9, v10);

  }
}

uint64_t __82__ICCloudClient_loadScreenshotInfoForSubscriptionPersistentIDs_completionHandler___block_invoke_110(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __82__ICCloudClient_loadScreenshotInfoForSubscriptionPersistentIDs_completionHandler___block_invoke_109(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81__ICCloudClient_loadScreenshotInfoForSubscriptionPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "firstObject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __83__ICCloudClient_loadArtworkInfoForSubscriptionItemPersistentIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Load Subscription Item Artwork Info failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__ICCloudClient_loadArtworkInfoForSubscriptionItemPersistentIDs_completionHandler___block_invoke_107;
    block[3] = &unk_1E4390D18;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

void __83__ICCloudClient_loadArtworkInfoForSubscriptionItemPersistentIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v5;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "Load Subscription Item Artwork Info failed with error: %{public}@", buf, 0xCu);
    }

  }
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __83__ICCloudClient_loadArtworkInfoForSubscriptionItemPersistentIDs_completionHandler___block_invoke_108;
    v10[3] = &unk_1E4390EF8;
    v12 = v8;
    v11 = v6;
    dispatch_async(v9, v10);

  }
}

uint64_t __83__ICCloudClient_loadArtworkInfoForSubscriptionItemPersistentIDs_completionHandler___block_invoke_108(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __83__ICCloudClient_loadArtworkInfoForSubscriptionItemPersistentIDs_completionHandler___block_invoke_107(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__ICCloudClient_loadArtworkInfoForSubscriptionItemPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "firstObject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __64__ICCloudClient_loadScreenshotInfoForSagaIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Load Container Artwork Info failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__ICCloudClient_loadScreenshotInfoForSagaIDs_completionHandler___block_invoke_105;
    block[3] = &unk_1E4390D18;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

void __64__ICCloudClient_loadScreenshotInfoForSagaIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v5;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "Load Container Artwork Info failed with error: %{public}@", buf, 0xCu);
    }

  }
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__ICCloudClient_loadScreenshotInfoForSagaIDs_completionHandler___block_invoke_106;
    v10[3] = &unk_1E4390EF8;
    v12 = v8;
    v11 = v6;
    dispatch_async(v9, v10);

  }
}

uint64_t __64__ICCloudClient_loadScreenshotInfoForSagaIDs_completionHandler___block_invoke_106(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __64__ICCloudClient_loadScreenshotInfoForSagaIDs_completionHandler___block_invoke_105(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__ICCloudClient_loadScreenshotInfoForSagaID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "firstObject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __70__ICCloudClient_loadArtworkInfoForContainerSagaIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Load Container Artwork Info failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__ICCloudClient_loadArtworkInfoForContainerSagaIDs_completionHandler___block_invoke_103;
    block[3] = &unk_1E4390D18;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

void __70__ICCloudClient_loadArtworkInfoForContainerSagaIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v5;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "Load Container Artwork Info failed with error: %{public}@", buf, 0xCu);
    }

  }
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__ICCloudClient_loadArtworkInfoForContainerSagaIDs_completionHandler___block_invoke_104;
    v10[3] = &unk_1E4390EF8;
    v12 = v8;
    v11 = v6;
    dispatch_async(v9, v10);

  }
}

uint64_t __70__ICCloudClient_loadArtworkInfoForContainerSagaIDs_completionHandler___block_invoke_104(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __70__ICCloudClient_loadArtworkInfoForContainerSagaIDs_completionHandler___block_invoke_103(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__ICCloudClient_loadArtworkInfoForContainerSagaID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "firstObject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __61__ICCloudClient_loadArtworkInfoForSagaIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Load Artwork Info failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__ICCloudClient_loadArtworkInfoForSagaIDs_completionHandler___block_invoke_101;
    block[3] = &unk_1E4390D18;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

void __61__ICCloudClient_loadArtworkInfoForSagaIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v5;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "Load Artwork Info failed with error: %{public}@", buf, 0xCu);
    }

  }
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__ICCloudClient_loadArtworkInfoForSagaIDs_completionHandler___block_invoke_102;
    v10[3] = &unk_1E4390EF8;
    v12 = v8;
    v11 = v6;
    dispatch_async(v9, v10);

  }
}

uint64_t __61__ICCloudClient_loadArtworkInfoForSagaIDs_completionHandler___block_invoke_102(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __61__ICCloudClient_loadArtworkInfoForSagaIDs_completionHandler___block_invoke_101(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__ICCloudClient_loadArtworkInfoForSagaID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "firstObject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __75__ICCloudClient_loadScreenshotInfoForPurchaseHistoryIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Load Artwork Info for purchase history screenshot failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__ICCloudClient_loadScreenshotInfoForPurchaseHistoryIDs_completionHandler___block_invoke_99;
    block[3] = &unk_1E4390D18;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

void __75__ICCloudClient_loadScreenshotInfoForPurchaseHistoryIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v5;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "Load Artwork Info for purchase history screenshot failed with error: %{public}@", buf, 0xCu);
    }

  }
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __75__ICCloudClient_loadScreenshotInfoForPurchaseHistoryIDs_completionHandler___block_invoke_100;
    v10[3] = &unk_1E4390EF8;
    v12 = v8;
    v11 = v6;
    dispatch_async(v9, v10);

  }
}

uint64_t __75__ICCloudClient_loadScreenshotInfoForPurchaseHistoryIDs_completionHandler___block_invoke_100(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __75__ICCloudClient_loadScreenshotInfoForPurchaseHistoryIDs_completionHandler___block_invoke_99(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__ICCloudClient_loadScreenshotInfoForPurchaseHistoryID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "firstObject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __72__ICCloudClient_loadArtworkInfoForPurchaseHistoryIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Load Artwork Info failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__ICCloudClient_loadArtworkInfoForPurchaseHistoryIDs_completionHandler___block_invoke_96;
    block[3] = &unk_1E4390D18;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

void __72__ICCloudClient_loadArtworkInfoForPurchaseHistoryIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v5;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "Load Artwork Info failed with error: %{public}@", buf, 0xCu);
    }

  }
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72__ICCloudClient_loadArtworkInfoForPurchaseHistoryIDs_completionHandler___block_invoke_97;
    v10[3] = &unk_1E4390EF8;
    v12 = v8;
    v11 = v6;
    dispatch_async(v9, v10);

  }
}

uint64_t __72__ICCloudClient_loadArtworkInfoForPurchaseHistoryIDs_completionHandler___block_invoke_97(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __72__ICCloudClient_loadArtworkInfoForPurchaseHistoryIDs_completionHandler___block_invoke_96(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__ICCloudClient_loadArtworkInfoForPurchaseHistoryID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "firstObject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __65__ICCloudClient_deprioritizeAlbumArtistHeroImageForPersistentID___block_invoke(uint64_t a1, void *a2)
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
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 134218242;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Failed to deprioritize album artist hero artwork import with persistent ID %lld with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __60__ICCloudClient_deprioritizeArtistHeroImageForPersistentID___block_invoke(uint64_t a1, void *a2)
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
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 134218242;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Failed to deprioritize artist hero artwork import with persistent ID %lld with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __73__ICCloudClient_deprioritizeSubscriptionContainerArtworkForPersistentID___block_invoke(uint64_t a1, void *a2)
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
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 134218242;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Failed to deprioritize subscription container artwork import with persistent ID %lld with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __67__ICCloudClient_deprioritizeSubscriptionScreenshotForPersistentID___block_invoke(uint64_t a1, void *a2)
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
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 134218242;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Failed to deprioritize subscription screenshot import with persistent ID %lld with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __68__ICCloudClient_deprioritizeSubscriptionItemArtworkForPersistentID___block_invoke(uint64_t a1, void *a2)
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
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 134218242;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Failed to deprioritize subscription item artwork import with persistent ID %lld with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __55__ICCloudClient_deprioritizeContainerArtworkForSagaID___block_invoke(uint64_t a1, void *a2)
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
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 134218242;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Failed to deprioritize container artwork import with saga ID %llu with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __49__ICCloudClient_deprioritizeScreenshotForSagaID___block_invoke(uint64_t a1, void *a2)
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
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 134218242;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Failed to deprioritize screenshot import with saga ID %llu with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __50__ICCloudClient_deprioritizeItemArtworkForSagaID___block_invoke(uint64_t a1, void *a2)
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
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 134218242;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Failed to deprioritize item artwork import with saga ID %llu with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __60__ICCloudClient_deprioritizeScreenshotForPurchaseHistoryID___block_invoke(uint64_t a1, void *a2)
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
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 134218242;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Failed to deprioritize screenshot artwork import with purchase history ID %llu with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __61__ICCloudClient_deprioritizeItemArtworkForPurchaseHistoryID___block_invoke(uint64_t a1, void *a2)
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
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 134218242;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Failed to deprioritize item artwork import with purchase history ID %llu with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __77__ICCloudClient_importAlbumArtistHeroImageForPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Import Album Artist Hero Artwork failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __77__ICCloudClient_importAlbumArtistHeroImageForPersistentID_completionHandler___block_invoke_92(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Import Album Artist Hero Artwork failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __72__ICCloudClient_importArtistHeroImageForPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Import Artist Hero Artwork failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __72__ICCloudClient_importArtistHeroImageForPersistentID_completionHandler___block_invoke_91(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Import Artist Hero Artwork failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __85__ICCloudClient_importSubscriptionContainerArtworkForPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Import Subscription Container Artwork with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __85__ICCloudClient_importSubscriptionContainerArtworkForPersistentID_completionHandler___block_invoke_90(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Import Subscription Container Artwork with error: %{public}@", (uint8_t *)&v6, 0xCu);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __79__ICCloudClient_importSubscriptionScreenshotForPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Import Subscription Screenshot failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __79__ICCloudClient_importSubscriptionScreenshotForPersistentID_completionHandler___block_invoke_89(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Import Subscription Screenshot failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __80__ICCloudClient_importSubscriptionItemArtworkForPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Import Subscription Item Artwork failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __80__ICCloudClient_importSubscriptionItemArtworkForPersistentID_completionHandler___block_invoke_88(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Import Subscription Item Artwork failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __67__ICCloudClient_importContainerArtworkForSagaID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Import Container Artwork failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __67__ICCloudClient_importContainerArtworkForSagaID_completionHandler___block_invoke_87(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Import Container Artwork failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __61__ICCloudClient_importScreenshotForSagaID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Import Cloud Screenshot failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __61__ICCloudClient_importScreenshotForSagaID_completionHandler___block_invoke_86(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Import Cloud Screenshot failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __62__ICCloudClient_importItemArtworkForSagaID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Import Item Artwork failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __62__ICCloudClient_importItemArtworkForSagaID_completionHandler___block_invoke_85(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Import Item Artwork failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __72__ICCloudClient_importScreenshotForPurchaseHistoryID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Import Purchase History Screenshot failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __72__ICCloudClient_importScreenshotForPurchaseHistoryID_completionHandler___block_invoke_84(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Import Purchase History Screenshot failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __73__ICCloudClient_importItemArtworkForPurchaseHistoryID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Import Item Artwork failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __73__ICCloudClient_importItemArtworkForPurchaseHistoryID_completionHandler___block_invoke_83(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Import Item Artwork failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __72__ICCloudClient_loadLastKnownEnableICMLErrorStatusWithCompletionHander___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "loading last known iCML state change failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __72__ICCloudClient_loadLastKnownEnableICMLErrorStatusWithCompletionHander___block_invoke_81(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "loading last known iCML state change failed with error: %{public}@", (uint8_t *)&v9, 0xCu);
    }

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

void __53__ICCloudClient_deauthenticateWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Deauthenticate failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__ICCloudClient_deauthenticateWithCompletionHandler___block_invoke_79;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __53__ICCloudClient_deauthenticateWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Deauthenticate failed with error: %{public}@", buf, 0xCu);
    }

  }
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__ICCloudClient_deauthenticateWithCompletionHandler___block_invoke_80;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __53__ICCloudClient_deauthenticateWithCompletionHandler___block_invoke_80(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __53__ICCloudClient_deauthenticateWithCompletionHandler___block_invoke_79(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __63__ICCloudClient_updateSagaLibraryWithReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Update Match Library failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __63__ICCloudClient_updateSagaLibraryWithReason_completionHandler___block_invoke_77(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a2, "code");
  if (v3 >= 1)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v11 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Update Match Library failed with status: %ld", buf, 0xCu);
    }

  }
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __63__ICCloudClient_updateSagaLibraryWithReason_completionHandler___block_invoke_78;
    v7[3] = &unk_1E438DF40;
    v8 = v5;
    v9 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __63__ICCloudClient_updateSagaLibraryWithReason_completionHandler___block_invoke_78(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40) == 0);
}

void __54__ICCloudClient_isMediaKindDisabledForJaliscoLibrary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6[0] = 67109378;
    v6[1] = v5;
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Checking if mediakind=%d is disabled failed with error=%{public}@", (uint8_t *)v6, 0x12u);
  }

}

void __54__ICCloudClient_isMediaKindDisabledForJaliscoLibrary___block_invoke_71(uint64_t a1, char a2, void *a3)
{
  char *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  const char *v14;
  int v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      v15 = 67109634;
      v16 = v7;
      v17 = 2114;
      v18 = v5;
      v19 = 1024;
      v20 = v8;
      v9 = "Could not get if mediaKind=%d is disabled for Jalisco sync. error=%{public}@, isMediaKindDisabled=%d";
      v10 = v6;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 24;
LABEL_9:
      _os_log_impl(&dword_1A03E3000, v10, v11, v9, (uint8_t *)&v15, v12);
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
    v6 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 40);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
        v14 = "disabled";
      else
        v14 = "enabled";
      v15 = 67109378;
      v16 = v13;
      v17 = 2082;
      v18 = v14;
      v9 = "mediaKind=%d is %{public}s for Jalisco sync";
      v10 = v6;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 18;
      goto LABEL_9;
    }
  }

}

void __58__ICCloudClient_removeJaliscoLibraryWithCompletionHander___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Remove Jalisco failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__ICCloudClient_removeJaliscoLibraryWithCompletionHander___block_invoke_69;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __58__ICCloudClient_removeJaliscoLibraryWithCompletionHander___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Remove Jalisco failed with error: %{public}@", buf, 0xCu);
    }

  }
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__ICCloudClient_removeJaliscoLibraryWithCompletionHander___block_invoke_70;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __58__ICCloudClient_removeJaliscoLibraryWithCompletionHander___block_invoke_70(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __58__ICCloudClient_removeJaliscoLibraryWithCompletionHander___block_invoke_69(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __66__ICCloudClient_updateJaliscoLibraryWithReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Update Jalisco Library failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__ICCloudClient_updateJaliscoLibraryWithReason_completionHandler___block_invoke_67;
    block[3] = &unk_1E4390D18;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

uint64_t __66__ICCloudClient_updateJaliscoLibraryWithReason_completionHandler___block_invoke_68(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32) == 0);
}

void __29__ICCloudClient_becomeActive__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Update Jalisco Library failed with error: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __65__ICCloudClient_disableCloudLibraryWithReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Could not get remote object to deauth Saga library - error=%{public}@", (uint8_t *)&v7, 0xCu);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void __65__ICCloudClient_disableCloudLibraryWithReason_completionHandler___block_invoke_65(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  uint64_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  v5 = v4;
  if (v3)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v11 = 138543362;
    v12 = v3;
    v6 = "Could not deauthenticate Saga library and disable active locker account - error=%{public}@.";
    v7 = v5;
    v8 = OS_LOG_TYPE_ERROR;
    v9 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    LOWORD(v11) = 0;
    v6 = "Finished deauthenticating Saga library";
    v7 = v5;
    v8 = OS_LOG_TYPE_DEFAULT;
    v9 = 2;
  }
  _os_log_impl(&dword_1A03E3000, v7, v8, v6, (uint8_t *)&v11, v9);
LABEL_7:

  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);

}

void __105__ICCloudClient__enableCloudLibraryWithPolicy_startinitialImport_isExplicitUserAction_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Could not get remote object to authenticate and start initial Saga import - error=%{public}@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __105__ICCloudClient__enableCloudLibraryWithPolicy_startinitialImport_isExplicitUserAction_completionHandler___block_invoke_64(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  uint64_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  v5 = v4;
  if (v3)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v11 = 138543362;
    v12 = v3;
    v6 = "Could not authenticate and start initial import of Saga library - error=%{public}@";
    v7 = v5;
    v8 = OS_LOG_TYPE_ERROR;
    v9 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    LOWORD(v11) = 0;
    v6 = "Successfully authenticated and finished Saga import.";
    v7 = v5;
    v8 = OS_LOG_TYPE_DEFAULT;
    v9 = 2;
  }
  _os_log_impl(&dword_1A03E3000, v7, v8, v6, (uint8_t *)&v11, v9);
LABEL_7:

  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);

}

void __79__ICCloudClient_resetInvitationURLForCollaborationWithPersistentID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v12 = v5;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to connect to remote proxy. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __79__ICCloudClient_resetInvitationURLForCollaborationWithPersistentID_completion___block_invoke_61;
    v8[3] = &unk_1E4390EF8;
    v10 = v6;
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

void __79__ICCloudClient_resetInvitationURLForCollaborationWithPersistentID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v6, "msv_description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v9;
      v20 = 2114;
      v21 = v10;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Completed request to reset invitation link error=%{public}@", buf, 0x16u);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v19 = v11;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed request to reset invitation link", buf, 0xCu);
  }

  v12 = *(void **)(a1 + 40);
  if (v12)
  {
    dispatch_get_global_queue(0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__ICCloudClient_resetInvitationURLForCollaborationWithPersistentID_completion___block_invoke_62;
    block[3] = &unk_1E4390E58;
    v17 = v12;
    v15 = v5;
    v16 = v6;
    dispatch_async(v13, block);

  }
}

uint64_t __79__ICCloudClient_resetInvitationURLForCollaborationWithPersistentID_completion___block_invoke_62(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __79__ICCloudClient_resetInvitationURLForCollaborationWithPersistentID_completion___block_invoke_61(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __82__ICCloudClient_removeCollaborators_fromCollaborationWithPersistentID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v12 = v5;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to connect to remote proxy. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __82__ICCloudClient_removeCollaborators_fromCollaborationWithPersistentID_completion___block_invoke_59;
    v8[3] = &unk_1E4390EF8;
    v10 = v6;
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

void __82__ICCloudClient_removeCollaborators_fromCollaborationWithPersistentID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "msv_description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v6;
      v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Completed removing collaborator request error=%{public}@", buf, 0x16u);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v15 = v8;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed removing collaborator request", buf, 0xCu);
  }

  v9 = *(void **)(a1 + 40);
  if (v9)
  {
    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __82__ICCloudClient_removeCollaborators_fromCollaborationWithPersistentID_completion___block_invoke_60;
    v11[3] = &unk_1E4390EF8;
    v13 = v9;
    v12 = v3;
    dispatch_async(v10, v11);

  }
}

uint64_t __82__ICCloudClient_removeCollaborators_fromCollaborationWithPersistentID_completion___block_invoke_60(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __82__ICCloudClient_removeCollaborators_fromCollaborationWithPersistentID_completion___block_invoke_59(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __102__ICCloudClient_respondToPendingCollaborator_onCollaborationWithPersistentID_withApproval_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v12 = v5;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to connect to remote proxy. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __102__ICCloudClient_respondToPendingCollaborator_onCollaborationWithPersistentID_withApproval_completion___block_invoke_57;
    v8[3] = &unk_1E4390EF8;
    v10 = v6;
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

void __102__ICCloudClient_respondToPendingCollaborator_onCollaborationWithPersistentID_withApproval_completion___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = a1[4];
      v7 = a1[6];
      objc_msgSend(v3, "msv_description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v6;
      v18 = 2048;
      v19 = v7;
      v20 = 2114;
      v21 = v8;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Completed responding to collaboration join request persistentID %lld error=%{public}@", buf, 0x20u);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = a1[4];
    v10 = a1[6];
    *(_DWORD *)buf = 138543618;
    v17 = v9;
    v18 = 2048;
    v19 = v10;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed responding to collaboration join request persistentID %lld", buf, 0x16u);
  }

  v11 = (void *)a1[5];
  if (v11)
  {
    dispatch_get_global_queue(0, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __102__ICCloudClient_respondToPendingCollaborator_onCollaborationWithPersistentID_withApproval_completion___block_invoke_58;
    v13[3] = &unk_1E4390EF8;
    v15 = v11;
    v14 = v3;
    dispatch_async(v12, v13);

  }
}

uint64_t __102__ICCloudClient_respondToPendingCollaborator_onCollaborationWithPersistentID_withApproval_completion___block_invoke_58(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __102__ICCloudClient_respondToPendingCollaborator_onCollaborationWithPersistentID_withApproval_completion___block_invoke_57(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __80__ICCloudClient_joinCollaborationWithGlobalPlaylistID_invitationURL_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v12 = v5;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to connect to remote proxy. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __80__ICCloudClient_joinCollaborationWithGlobalPlaylistID_invitationURL_completion___block_invoke_55;
    v8[3] = &unk_1E4390EF8;
    v10 = v6;
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

void __80__ICCloudClient_joinCollaborationWithGlobalPlaylistID_invitationURL_completion___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = a1[4];
      v9 = a1[5];
      objc_msgSend(v5, "msv_description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v8;
      v21 = 2114;
      v22 = v9;
      v23 = 2114;
      v24 = v10;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Completed request to join collaboration for playlist %{public}@ error=%{public}@", buf, 0x20u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = a1[4];
    v12 = a1[5];
    *(_DWORD *)buf = 138543618;
    v20 = v11;
    v21 = 2114;
    v22 = v12;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed request to join collaboration for playlist %{public}@", buf, 0x16u);
  }

  v13 = (void *)a1[6];
  if (v13)
  {
    dispatch_get_global_queue(0, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__ICCloudClient_joinCollaborationWithGlobalPlaylistID_invitationURL_completion___block_invoke_56;
    block[3] = &unk_1E438DF68;
    v17 = v13;
    v18 = a2;
    v16 = v5;
    dispatch_async(v14, block);

  }
}

uint64_t __80__ICCloudClient_joinCollaborationWithGlobalPlaylistID_invitationURL_completion___block_invoke_56(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __80__ICCloudClient_joinCollaborationWithGlobalPlaylistID_invitationURL_completion___block_invoke_55(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __84__ICCloudClient_editCollaborationWithPersistentID_properties_trackEdits_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v12 = v5;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to connect to remote proxy. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __84__ICCloudClient_editCollaborationWithPersistentID_properties_trackEdits_completion___block_invoke_53;
    v8[3] = &unk_1E4390EF8;
    v10 = v6;
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

void __84__ICCloudClient_editCollaborationWithPersistentID_properties_trackEdits_completion___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = a1[4];
      v7 = a1[6];
      objc_msgSend(v3, "msv_description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v6;
      v18 = 2048;
      v19 = v7;
      v20 = 2114;
      v21 = v8;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Completed request to edit collaboration for persistentID %lld error=%{public}@", buf, 0x20u);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = a1[4];
    v10 = a1[6];
    *(_DWORD *)buf = 138543618;
    v17 = v9;
    v18 = 2048;
    v19 = v10;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed request to edit collaboration for persistentID %lld", buf, 0x16u);
  }

  v11 = (void *)a1[5];
  if (v11)
  {
    dispatch_get_global_queue(0, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __84__ICCloudClient_editCollaborationWithPersistentID_properties_trackEdits_completion___block_invoke_54;
    v13[3] = &unk_1E4390EF8;
    v15 = v11;
    v14 = v3;
    dispatch_async(v12, v13);

  }
}

uint64_t __84__ICCloudClient_editCollaborationWithPersistentID_properties_trackEdits_completion___block_invoke_54(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __84__ICCloudClient_editCollaborationWithPersistentID_properties_trackEdits_completion___block_invoke_53(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __61__ICCloudClient_endCollaborationWithPersistentID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v12 = v5;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to connect to remote proxy. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__ICCloudClient_endCollaborationWithPersistentID_completion___block_invoke_51;
    v8[3] = &unk_1E4390EF8;
    v10 = v6;
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

void __61__ICCloudClient_endCollaborationWithPersistentID_completion___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = a1[4];
      v9 = a1[6];
      objc_msgSend(v5, "msv_description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v8;
      v21 = 2048;
      v22 = v9;
      v23 = 2114;
      v24 = v10;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Completed request to end collaboration with persistentID %lld error=%{public}@", buf, 0x20u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = a1[4];
    v12 = a1[6];
    *(_DWORD *)buf = 138543618;
    v20 = v11;
    v21 = 2048;
    v22 = v12;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed request to end collaboration with persistentID %lld", buf, 0x16u);
  }

  v13 = (void *)a1[5];
  if (v13)
  {
    dispatch_get_global_queue(0, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__ICCloudClient_endCollaborationWithPersistentID_completion___block_invoke_52;
    block[3] = &unk_1E438DF68;
    v17 = v13;
    v18 = a2;
    v16 = v5;
    dispatch_async(v14, block);

  }
}

uint64_t __61__ICCloudClient_endCollaborationWithPersistentID_completion___block_invoke_52(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __61__ICCloudClient_endCollaborationWithPersistentID_completion___block_invoke_51(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __88__ICCloudClient_beginCollaborationUsingPlaylistWithPersistentID_sharingMode_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v12 = v5;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to connect to remote proxy. err=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __88__ICCloudClient_beginCollaborationUsingPlaylistWithPersistentID_sharingMode_completion___block_invoke_49;
    v8[3] = &unk_1E4390EF8;
    v10 = v6;
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

void __88__ICCloudClient_beginCollaborationUsingPlaylistWithPersistentID_sharingMode_completion___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = a1[4];
      v9 = a1[6];
      objc_msgSend(v5, "msv_description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v8;
      v21 = 2048;
      v22 = v9;
      v23 = 2114;
      v24 = v10;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Completed request to start collaboration for persistentID %lld error=%{public}@", buf, 0x20u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = a1[4];
    v12 = a1[6];
    *(_DWORD *)buf = 138543618;
    v20 = v11;
    v21 = 2048;
    v22 = v12;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed request to start collaboration for persistentID %lld", buf, 0x16u);
  }

  v13 = (void *)a1[5];
  if (v13)
  {
    dispatch_get_global_queue(0, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__ICCloudClient_beginCollaborationUsingPlaylistWithPersistentID_sharingMode_completion___block_invoke_50;
    block[3] = &unk_1E438DF68;
    v17 = v13;
    v18 = a2;
    v16 = v5;
    dispatch_async(v14, block);

  }
}

uint64_t __88__ICCloudClient_beginCollaborationUsingPlaylistWithPersistentID_sharingMode_completion___block_invoke_50(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __88__ICCloudClient_beginCollaborationUsingPlaylistWithPersistentID_sharingMode_completion___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __86__ICCloudClient_favoriteArtistWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v12 = v5;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Favoriting artist with cloud=%{public}@ failed with error: %{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __86__ICCloudClient_favoriteArtistWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke_47;
    v8[3] = &unk_1E4390EF8;
    v10 = v6;
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

void __86__ICCloudClient_favoriteArtistWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
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
    v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v12 = v5;
      v13 = 2114;
      v14 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Failed to favorite artist with cloudID=%{public}@} with error: %{public}@", buf, 0x16u);
    }

  }
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __86__ICCloudClient_favoriteArtistWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke_48;
    v8[3] = &unk_1E4390EF8;
    v10 = v6;
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __86__ICCloudClient_favoriteArtistWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke_48(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __86__ICCloudClient_favoriteArtistWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke_47(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __85__ICCloudClient_favoriteAlbumWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v12 = v5;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Favoriting album with cloud=%{public}@ failed with error: %{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __85__ICCloudClient_favoriteAlbumWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke_45;
    v8[3] = &unk_1E4390EF8;
    v10 = v6;
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

void __85__ICCloudClient_favoriteAlbumWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
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
    v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v12 = v5;
      v13 = 2114;
      v14 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Failed to favorite album with cloudID=%{public}@} with error: %{public}@", buf, 0x16u);
    }

  }
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __85__ICCloudClient_favoriteAlbumWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke_46;
    v8[3] = &unk_1E4390EF8;
    v10 = v6;
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __85__ICCloudClient_favoriteAlbumWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke_46(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __85__ICCloudClient_favoriteAlbumWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke_45(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __89__ICCloudClient_favoriteEntityWithPersistentID_sagaID_entityType_time_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    v12 = v5;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Favoriting entity with cloud=%lld failed with error: %{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __89__ICCloudClient_favoriteEntityWithPersistentID_sagaID_entityType_time_completionHandler___block_invoke_43;
    v8[3] = &unk_1E4390EF8;
    v10 = v6;
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

void __89__ICCloudClient_favoriteEntityWithPersistentID_sagaID_entityType_time_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
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
    v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      v12 = v5;
      v13 = 2114;
      v14 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Failed to favorite entity with itemIdentifiers=%lld with error: %{public}@", buf, 0x16u);
    }

  }
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __89__ICCloudClient_favoriteEntityWithPersistentID_sagaID_entityType_time_completionHandler___block_invoke_44;
    v8[3] = &unk_1E4390EF8;
    v10 = v6;
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __89__ICCloudClient_favoriteEntityWithPersistentID_sagaID_entityType_time_completionHandler___block_invoke_44(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __89__ICCloudClient_favoriteEntityWithPersistentID_sagaID_entityType_time_completionHandler___block_invoke_43(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __82__ICCloudClient_favoritePlaylistWithPersistentID_globalID_time_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v12 = v5;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Favoriting entity with globalPlaylistID=%{public}@ failed with error: %{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __82__ICCloudClient_favoritePlaylistWithPersistentID_globalID_time_completionHandler___block_invoke_41;
    v8[3] = &unk_1E4390EF8;
    v10 = v6;
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

void __82__ICCloudClient_favoritePlaylistWithPersistentID_globalID_time_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
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
    v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v12 = v5;
      v13 = 2114;
      v14 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Failed to favorite entity with globalPlaylistID=%{public}@ with error: %{public}@", buf, 0x16u);
    }

  }
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __82__ICCloudClient_favoritePlaylistWithPersistentID_globalID_time_completionHandler___block_invoke_42;
    v8[3] = &unk_1E4390EF8;
    v10 = v6;
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __82__ICCloudClient_favoritePlaylistWithPersistentID_globalID_time_completionHandler___block_invoke_42(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __82__ICCloudClient_favoritePlaylistWithPersistentID_globalID_time_completionHandler___block_invoke_41(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __90__ICCloudClient_favoriteEntityWithPersistentID_storeID_entityType_time_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    v12 = v5;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Favoriting entity with storeID=%lld failed with error: %{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __90__ICCloudClient_favoriteEntityWithPersistentID_storeID_entityType_time_completionHandler___block_invoke_39;
    v8[3] = &unk_1E4390EF8;
    v10 = v6;
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

void __90__ICCloudClient_favoriteEntityWithPersistentID_storeID_entityType_time_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
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
    v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      v12 = v5;
      v13 = 2114;
      v14 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Failed to favorite entity with itemIdentifiers=%lld with error: %{public}@", buf, 0x16u);
    }

  }
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __90__ICCloudClient_favoriteEntityWithPersistentID_storeID_entityType_time_completionHandler___block_invoke_40;
    v8[3] = &unk_1E4390EF8;
    v10 = v6;
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __90__ICCloudClient_favoriteEntityWithPersistentID_storeID_entityType_time_completionHandler___block_invoke_40(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __90__ICCloudClient_favoriteEntityWithPersistentID_storeID_entityType_time_completionHandler___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __102__ICCloudClient_addGeniusPlaylistWithPersistentID_name_seedItemSagaIDs_itemSagaIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Create cloud genius playlist failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __102__ICCloudClient_addGeniusPlaylistWithPersistentID_name_seedItemSagaIDs_itemSagaIDs_completionHandler___block_invoke_37;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __102__ICCloudClient_addGeniusPlaylistWithPersistentID_name_seedItemSagaIDs_itemSagaIDs_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "Failed to create Genius playlist with error: %{public}@", buf, 0xCu);
    }

  }
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __102__ICCloudClient_addGeniusPlaylistWithPersistentID_name_seedItemSagaIDs_itemSagaIDs_completionHandler___block_invoke_38;
    block[3] = &unk_1E438DF68;
    v11 = v7;
    v12 = a2;
    v10 = v5;
    dispatch_async(v8, block);

  }
}

uint64_t __102__ICCloudClient_addGeniusPlaylistWithPersistentID_name_seedItemSagaIDs_itemSagaIDs_completionHandler___block_invoke_38(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __102__ICCloudClient_addGeniusPlaylistWithPersistentID_name_seedItemSagaIDs_itemSagaIDs_completionHandler___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __67__ICCloudClient_hideItemsWithPurchaseHistoryIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Hide items from purchase history failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__ICCloudClient_hideItemsWithPurchaseHistoryIDs_completionHandler___block_invoke_36;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __67__ICCloudClient_hideItemsWithPurchaseHistoryIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __67__ICCloudClient_hideItemsWithPurchaseHistoryIDs_completionHandler___block_invoke_3;
    v6[3] = &unk_1E4390EF8;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __67__ICCloudClient_hideItemsWithPurchaseHistoryIDs_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __67__ICCloudClient_hideItemsWithPurchaseHistoryIDs_completionHandler___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __58__ICCloudClient_removeItemsWithSagaIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Remove cloud items from library failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__ICCloudClient_removeItemsWithSagaIDs_completionHandler___block_invoke_35;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __58__ICCloudClient_removeItemsWithSagaIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __58__ICCloudClient_removeItemsWithSagaIDs_completionHandler___block_invoke_3;
    v6[3] = &unk_1E4390EF8;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __58__ICCloudClient_removeItemsWithSagaIDs_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __58__ICCloudClient_removeItemsWithSagaIDs_completionHandler___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __62__ICCloudClient_removePlaylistsWithSagaIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Remove cloud playlists from library failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __62__ICCloudClient_removePlaylistsWithSagaIDs_completionHandler___block_invoke_34;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __62__ICCloudClient_removePlaylistsWithSagaIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__ICCloudClient_removePlaylistsWithSagaIDs_completionHandler___block_invoke_3;
    v6[3] = &unk_1E4390EF8;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __62__ICCloudClient_removePlaylistsWithSagaIDs_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __62__ICCloudClient_removePlaylistsWithSagaIDs_completionHandler___block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __64__ICCloudClient_addStorePlaylistWithGlobalID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Add store playlist to library failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64__ICCloudClient_addStorePlaylistWithGlobalID_completionHandler___block_invoke_33;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __64__ICCloudClient_addStorePlaylistWithGlobalID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__ICCloudClient_addStorePlaylistWithGlobalID_completionHandler___block_invoke_3;
    block[3] = &unk_1E4390E58;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __64__ICCloudClient_addStorePlaylistWithGlobalID_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __64__ICCloudClient_addStorePlaylistWithGlobalID_completionHandler___block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __64__ICCloudClient_sdk_addStoreItemWithOpaqueID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "SDK: Add store item to library failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64__ICCloudClient_sdk_addStoreItemWithOpaqueID_completionHandler___block_invoke_32;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __64__ICCloudClient_sdk_addStoreItemWithOpaqueID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__ICCloudClient_sdk_addStoreItemWithOpaqueID_completionHandler___block_invoke_3;
    block[3] = &unk_1E4390E58;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __64__ICCloudClient_sdk_addStoreItemWithOpaqueID_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __64__ICCloudClient_sdk_addStoreItemWithOpaqueID_completionHandler___block_invoke_32(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __67__ICCloudClient_addStoreItemWithAdamID_referral_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Add store item to library failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__ICCloudClient_addStoreItemWithAdamID_referral_completionHandler___block_invoke_31;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __67__ICCloudClient_addStoreItemWithAdamID_referral_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__ICCloudClient_addStoreItemWithAdamID_referral_completionHandler___block_invoke_3;
    block[3] = &unk_1E4390E58;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __67__ICCloudClient_addStoreItemWithAdamID_referral_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __67__ICCloudClient_addStoreItemWithAdamID_referral_completionHandler___block_invoke_31(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __63__ICCloudClient_updatePinnedSubscribedPlaylistsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Update pinned subscribed playlists failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __63__ICCloudClient_updatePinnedSubscribedPlaylistsWithCompletion___block_invoke_30;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __63__ICCloudClient_updatePinnedSubscribedPlaylistsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__ICCloudClient_updatePinnedSubscribedPlaylistsWithCompletion___block_invoke_3;
    v6[3] = &unk_1E4390EF8;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __63__ICCloudClient_updatePinnedSubscribedPlaylistsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __63__ICCloudClient_updatePinnedSubscribedPlaylistsWithCompletion___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __97__ICCloudClient_updateSubscribedPlaylistsWithSagaIDs_ignoreMinRefreshInterval_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Update subscribed playlists failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __97__ICCloudClient_updateSubscribedPlaylistsWithSagaIDs_ignoreMinRefreshInterval_completionHandler___block_invoke_29;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __97__ICCloudClient_updateSubscribedPlaylistsWithSagaIDs_ignoreMinRefreshInterval_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __97__ICCloudClient_updateSubscribedPlaylistsWithSagaIDs_ignoreMinRefreshInterval_completionHandler___block_invoke_3;
    v6[3] = &unk_1E4390EF8;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __97__ICCloudClient_updateSubscribedPlaylistsWithSagaIDs_ignoreMinRefreshInterval_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __97__ICCloudClient_updateSubscribedPlaylistsWithSagaIDs_ignoreMinRefreshInterval_completionHandler___block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __76__ICCloudClient_uploadArtworkForPlaylistWithPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Upload playlist artwork failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76__ICCloudClient_uploadArtworkForPlaylistWithPersistentID_completionHandler___block_invoke_28;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __76__ICCloudClient_uploadArtworkForPlaylistWithPersistentID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __76__ICCloudClient_uploadArtworkForPlaylistWithPersistentID_completionHandler___block_invoke_3;
    v6[3] = &unk_1E4390EF8;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __76__ICCloudClient_uploadArtworkForPlaylistWithPersistentID_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __76__ICCloudClient_uploadArtworkForPlaylistWithPersistentID_completionHandler___block_invoke_28(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __61__ICCloudClient_publishPlaylistWithSagaID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Publish cloud playlist failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__ICCloudClient_publishPlaylistWithSagaID_completionHandler___block_invoke_26;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __61__ICCloudClient_publishPlaylistWithSagaID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 32);
  if (v10)
  {
    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__ICCloudClient_publishPlaylistWithSagaID_completionHandler___block_invoke_3;
    v12[3] = &unk_1E4390EA8;
    v16 = v10;
    v13 = v7;
    v14 = v8;
    v15 = v9;
    dispatch_async(v11, v12);

  }
}

uint64_t __61__ICCloudClient_publishPlaylistWithSagaID_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

uint64_t __61__ICCloudClient_publishPlaylistWithSagaID_completionHandler___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

void __84__ICCloudClient_sdk_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "SDK: Add saga id to playlist failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __84__ICCloudClient_sdk_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke_25;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __84__ICCloudClient_sdk_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __84__ICCloudClient_sdk_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke_3;
    v6[3] = &unk_1E4390EF8;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __84__ICCloudClient_sdk_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __84__ICCloudClient_sdk_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __91__ICCloudClient_sdk_addStoreItemWithOpaqueID_toPlaylistWithPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "SDK: Add store item to playlist failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __91__ICCloudClient_sdk_addStoreItemWithOpaqueID_toPlaylistWithPersistentID_completionHandler___block_invoke_23;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __91__ICCloudClient_sdk_addStoreItemWithOpaqueID_toPlaylistWithPersistentID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__ICCloudClient_sdk_addStoreItemWithOpaqueID_toPlaylistWithPersistentID_completionHandler___block_invoke_3;
    block[3] = &unk_1E4390E58;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __91__ICCloudClient_sdk_addStoreItemWithOpaqueID_toPlaylistWithPersistentID_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __91__ICCloudClient_sdk_addStoreItemWithOpaqueID_toPlaylistWithPersistentID_completionHandler___block_invoke_23(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __80__ICCloudClient_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Add saga id to playlist failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __80__ICCloudClient_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke_22;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __80__ICCloudClient_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __80__ICCloudClient_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke_3;
    v6[3] = &unk_1E4390EF8;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __80__ICCloudClient_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __80__ICCloudClient_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __94__ICCloudClient_addStoreItemWithAdamID_referral_toPlaylistWithPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Add store item to playlist failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __94__ICCloudClient_addStoreItemWithAdamID_referral_toPlaylistWithPersistentID_completionHandler___block_invoke_21;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __94__ICCloudClient_addStoreItemWithAdamID_referral_toPlaylistWithPersistentID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __94__ICCloudClient_addStoreItemWithAdamID_referral_toPlaylistWithPersistentID_completionHandler___block_invoke_3;
    v6[3] = &unk_1E4390EF8;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __94__ICCloudClient_addStoreItemWithAdamID_referral_toPlaylistWithPersistentID_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __94__ICCloudClient_addStoreItemWithAdamID_referral_toPlaylistWithPersistentID_completionHandler___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __95__ICCloudClient_sdk_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "SDK Set cloud playlist properties failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __95__ICCloudClient_sdk_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke_20;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __95__ICCloudClient_sdk_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __95__ICCloudClient_sdk_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke_3;
    v6[3] = &unk_1E4390EF8;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __95__ICCloudClient_sdk_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __95__ICCloudClient_sdk_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __91__ICCloudClient_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Set cloud playlist properties failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __91__ICCloudClient_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke_19;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __91__ICCloudClient_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __91__ICCloudClient_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke_3;
    v6[3] = &unk_1E4390EF8;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __91__ICCloudClient_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __91__ICCloudClient_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __91__ICCloudClient_sdk_createPlaylistWithPersistentID_properties_tracklist_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "SDK: Create cloud playlist failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __91__ICCloudClient_sdk_createPlaylistWithPersistentID_properties_tracklist_completionHandler___block_invoke_18;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __91__ICCloudClient_sdk_createPlaylistWithPersistentID_properties_tracklist_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a3;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__ICCloudClient_sdk_createPlaylistWithPersistentID_properties_tracklist_completionHandler___block_invoke_3;
  block[3] = &unk_1E438DF68;
  v10 = *(id *)(a1 + 32);
  v11 = a2;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

uint64_t __91__ICCloudClient_sdk_createPlaylistWithPersistentID_properties_tracklist_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __91__ICCloudClient_sdk_createPlaylistWithPersistentID_properties_tracklist_completionHandler___block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __87__ICCloudClient_createPlaylistWithPersistentID_properties_trackList_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Create cloud playlist failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __87__ICCloudClient_createPlaylistWithPersistentID_properties_trackList_completionHandler___block_invoke_16;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __87__ICCloudClient_createPlaylistWithPersistentID_properties_trackList_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__ICCloudClient_createPlaylistWithPersistentID_properties_trackList_completionHandler___block_invoke_3;
    block[3] = &unk_1E438DF68;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __87__ICCloudClient_createPlaylistWithPersistentID_properties_trackList_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __87__ICCloudClient_createPlaylistWithPersistentID_properties_trackList_completionHandler___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __76__ICCloudClient_setCloudFavoriteSongAddToLibraryBehavior_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Set cloud favorite-to-library behavior failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76__ICCloudClient_setCloudFavoriteSongAddToLibraryBehavior_completionHandler___block_invoke_13;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __76__ICCloudClient_setCloudFavoriteSongAddToLibraryBehavior_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __76__ICCloudClient_setCloudFavoriteSongAddToLibraryBehavior_completionHandler___block_invoke_3;
    v6[3] = &unk_1E4390EF8;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __76__ICCloudClient_setCloudFavoriteSongAddToLibraryBehavior_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __76__ICCloudClient_setCloudFavoriteSongAddToLibraryBehavior_completionHandler___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __65__ICCloudClient_setCloudAddToPlaylistBehavior_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Set cloud add-to-playlist behavior failed with error: %{public}@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65__ICCloudClient_setCloudAddToPlaylistBehavior_completionHandler___block_invoke_11;
    v7[3] = &unk_1E4390EF8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __65__ICCloudClient_setCloudAddToPlaylistBehavior_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65__ICCloudClient_setCloudAddToPlaylistBehavior_completionHandler___block_invoke_3;
    v6[3] = &unk_1E4390EF8;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __65__ICCloudClient_setCloudAddToPlaylistBehavior_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __65__ICCloudClient_setCloudAddToPlaylistBehavior_completionHandler___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __46__ICCloudClient_performBlockAfterServerSetup___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "serverIsSetup"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
    v3 = (void *)MEMORY[0x1A1AFA8D0](*(_QWORD *)(a1 + 40));
    objc_msgSend(v2, "addObject:", v3);

    objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "count");
        v7 = 134217984;
        v8 = v6;
        _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_ERROR, "xpcConnection=nil. %lu pending blocks may not execute.", (uint8_t *)&v7, 0xCu);
      }

    }
  }
}

@end
