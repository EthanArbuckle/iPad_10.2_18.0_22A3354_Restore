@implementation ICURLSessionManager

void __59__ICURLSessionManager_sessionWithIdentifier_creationBlock___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!v2)
  {
    (*(void (**)(void))(a1[6] + 16))();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[7] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), a1[5]);
  }
}

ICURLSession *__81__ICURLSessionManager__defaultSessionWithQualityOfService_maxConcurrentRequests___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  ICURLSession *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C92CA0], "ic_defaultSessionConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[6];
  if (v3 == 33 || v3 == 25)
  {
    +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isWatch");

    if (v6)
    {
      objc_msgSend(v2, "set_requiresSustainedDataDelivery:", 1);
      objc_msgSend(v2, "set_ignoreDidReceiveResponseDisposition:", 1);
    }
    +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
    v7 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject hasCellularDataCapability](v7, "hasCellularDataCapability") & 1) != 0)
    {
      +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "enableMultipathTCP");

      if (!v9)
        goto LABEL_13;
      objc_msgSend(v2, "setMultipathServiceType:", 2);
      v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = a1[4];
        v11 = a1[5];
        v14 = 138543618;
        v15 = v10;
        v16 = 2114;
        v17 = v11;
        _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ enabled multipath service type NSURLSessionMultipathServiceTypeInteractive for session %{public}@", (uint8_t *)&v14, 0x16u);
      }
    }

  }
LABEL_13:
  v12 = -[ICURLSession initWithConfiguration:maxConcurrentRequests:qualityOfService:]([ICURLSession alloc], "initWithConfiguration:maxConcurrentRequests:qualityOfService:", v2, a1[7], a1[6]);

  return v12;
}

+ (ICURLSession)defaultSession
{
  void *v2;
  void *v3;

  +[ICURLSessionManager sharedSessionManager](ICURLSessionManager, "sharedSessionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_defaultSessionWithQualityOfService:maxConcurrentRequests:", -1, +[ICURLSession defaultMaximumConcurrentRequests](ICURLSession, "defaultMaximumConcurrentRequests"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICURLSession *)v3;
}

+ (ICURLSession)highPrioritySession
{
  void *v2;
  void *v3;

  +[ICURLSessionManager sharedSessionManager](ICURLSessionManager, "sharedSessionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_defaultSessionWithQualityOfService:maxConcurrentRequests:", 33, +[ICURLSession defaultMaximumConcurrentRequests](ICURLSession, "defaultMaximumConcurrentRequests"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICURLSession *)v3;
}

+ (ICURLSession)unlimitedHighPrioritySession
{
  void *v2;
  void *v3;

  +[ICURLSessionManager sharedSessionManager](ICURLSessionManager, "sharedSessionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_defaultSessionWithQualityOfService:maxConcurrentRequests:", 33, -1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICURLSession *)v3;
}

- (id)_defaultSessionWithQualityOfService:(int64_t)a3 maxConcurrentRequests:(unint64_t)a4
{
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  int64_t v13;
  unint64_t v14;

  -[ICURLSessionManager _defaultSessionIdentifierWithQualityOfService:maxConcurrentRequests:](self, "_defaultSessionIdentifierWithQualityOfService:maxConcurrentRequests:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__ICURLSessionManager__defaultSessionWithQualityOfService_maxConcurrentRequests___block_invoke;
  v11[3] = &unk_1E438A3C0;
  v11[4] = self;
  v12 = v7;
  v13 = a3;
  v14 = a4;
  v8 = v7;
  -[ICURLSessionManager sessionWithIdentifier:creationBlock:](self, "sessionWithIdentifier:creationBlock:", v8, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)sessionWithIdentifier:(id)a3 creationBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3358;
  v21 = __Block_byref_object_dispose__3359;
  v22 = 0;
  accessQueue = self->_accessQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__ICURLSessionManager_sessionWithIdentifier_creationBlock___block_invoke;
  v13[3] = &unk_1E43909E8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(accessQueue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (id)_defaultSessionIdentifierWithQualityOfService:(int64_t)a3 maxConcurrentRequests:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;

  if (a3 <= 16)
  {
    if (a3 == -1)
    {
      v6 = CFSTR("Default");
      return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.iTunesCloud.ICURLSessionManager.%@.max%lu"), v6, a4, v4, v5);
    }
    if (a3 == 9)
    {
      v6 = CFSTR("Background");
      return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.iTunesCloud.ICURLSessionManager.%@.max%lu"), v6, a4, v4, v5);
    }
LABEL_12:
    v6 = CFSTR("Unknown");
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.iTunesCloud.ICURLSessionManager.%@.max%lu"), v6, a4, v4, v5);
  }
  if (a3 == 17)
  {
    v6 = CFSTR("Utility");
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.iTunesCloud.ICURLSessionManager.%@.max%lu"), v6, a4, v4, v5);
  }
  if (a3 == 33)
  {
    v6 = CFSTR("UserInteractive");
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.iTunesCloud.ICURLSessionManager.%@.max%lu"), v6, a4, v4, v5);
  }
  if (a3 != 25)
    goto LABEL_12;
  v6 = CFSTR("UserInitiated");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.iTunesCloud.ICURLSessionManager.%@.max%lu"), v6, a4, v4, v5);
}

+ (ICURLSessionManager)sharedSessionManager
{
  if (sharedSessionManager_sOnceToken != -1)
    dispatch_once(&sharedSessionManager_sOnceToken, &__block_literal_global_3372);
  return (ICURLSessionManager *)(id)sharedSessionManager_sSharedSessionManager;
}

void __43__ICURLSessionManager_sharedSessionManager__block_invoke()
{
  ICURLSessionManager *v0;
  void *v1;

  v0 = objc_alloc_init(ICURLSessionManager);
  v1 = (void *)sharedSessionManager_sSharedSessionManager;
  sharedSessionManager_sSharedSessionManager = (uint64_t)v0;

}

- (ICURLSessionManager)init
{
  ICURLSessionManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  uint64_t v5;
  NSMutableDictionary *cachedSessions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICURLSessionManager;
  v2 = -[ICURLSessionManager init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iTunesCloud.ICURLSessionManager.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    cachedSessions = v2->_cachedSessions;
    v2->_cachedSessions = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (id)sessionWithQualityOfService:(int64_t)a3
{
  return -[ICURLSessionManager _defaultSessionWithQualityOfService:maxConcurrentRequests:](self, "_defaultSessionWithQualityOfService:maxConcurrentRequests:", a3, +[ICURLSession defaultMaximumConcurrentRequests](ICURLSession, "defaultMaximumConcurrentRequests"));
}

- (void)removeSessionWithIdentifier:(id)a3
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
  block[2] = __51__ICURLSessionManager_removeSessionWithIdentifier___block_invoke;
  block[3] = &unk_1E4391110;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

- (id)sessionWithIdentifier:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3358;
  v16 = __Block_byref_object_dispose__3359;
  v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__ICURLSessionManager_sessionWithIdentifier___block_invoke;
  block[3] = &unk_1E43907D8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)sessionWithIdentifier:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__ICURLSessionManager_sessionWithIdentifier_configuration___block_invoke;
  v10[3] = &unk_1E438A398;
  v11 = v6;
  v7 = v6;
  -[ICURLSessionManager sessionWithIdentifier:creationBlock:](self, "sessionWithIdentifier:creationBlock:", a3, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)addSession:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__ICURLSessionManager_addSession_withIdentifier___block_invoke;
  block[3] = &unk_1E4391230;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(accessQueue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSessions, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

uint64_t __49__ICURLSessionManager_addSession_withIdentifier___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKey:", a1[5], a1[6]);
}

ICURLSession *__59__ICURLSessionManager_sessionWithIdentifier_configuration___block_invoke(uint64_t a1)
{
  return -[ICURLSession initWithConfiguration:]([ICURLSession alloc], "initWithConfiguration:", *(_QWORD *)(a1 + 32));
}

void __45__ICURLSessionManager_sessionWithIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __51__ICURLSessionManager_removeSessionWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

@end
