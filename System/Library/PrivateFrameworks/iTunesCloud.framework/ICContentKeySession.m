@implementation ICContentKeySession

- (ICContentKeySession)init
{
  ICStoreRequestContext *v3;
  void *v4;
  ICStoreRequestContext *v5;
  ICContentKeySession *v6;

  v3 = [ICStoreRequestContext alloc];
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ICStoreRequestContext initWithIdentity:](v3, "initWithIdentity:", v4);

  v6 = -[ICContentKeySession initWithRequestContext:](self, "initWithRequestContext:", v5);
  return v6;
}

- (ICContentKeySession)initWithRequestContext:(id)a3
{
  return -[ICContentKeySession initWithRequestContext:keyStore:](self, "initWithRequestContext:keyStore:", a3, 0);
}

- (ICContentKeySession)initWithRequestContext:(id)a3 keyStore:(id)a4
{
  return -[ICContentKeySession initWithRequestContext:keyStore:delegate:](self, "initWithRequestContext:keyStore:delegate:", a3, a4, 0);
}

- (ICContentKeySession)initWithRequestContext:(id)a3 keyStore:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICContentKeySession *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *accessQueue;
  dispatch_semaphore_t v14;
  OS_dispatch_semaphore *waitForKeysSemaphore;
  uint64_t v16;
  NSMutableSet *pendingKeyIdentifiers;
  uint64_t v18;
  ICStoreRequestContext *requestContext;
  uint64_t v20;
  NSMutableDictionary *keyRenewalDates;
  uint64_t v22;
  NSMutableDictionary *completedKeyRequests;
  uint64_t v24;
  NSMutableDictionary *keyResponses;
  void *v26;
  void *v27;
  ICFileContentKeyStore *v28;
  ICFileContentKeyStore *prefetchedContentKeyStore;
  ICContentKeySessionPrefetchKeyConfiguration *v30;
  ICContentKeySessionPrefetchKeyConfiguration *prefetchKeyConfiguration;
  uint64_t v32;
  AVContentKeySession *contentKeySession;
  NSObject *v34;
  AVContentKeySession *v35;
  objc_super v37;
  uint8_t buf[4];
  ICContentKeySession *v39;
  __int16 v40;
  AVContentKeySession *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v37.receiver = self;
  v37.super_class = (Class)ICContentKeySession;
  v11 = -[ICContentKeySession init](&v37, sel_init);
  if (v11)
  {
    v12 = dispatch_queue_create("com.apple.iTunesCloud.ICContentKeySession.accessQueue", 0);
    accessQueue = v11->_accessQueue;
    v11->_accessQueue = (OS_dispatch_queue *)v12;

    v14 = dispatch_semaphore_create(0);
    waitForKeysSemaphore = v11->_waitForKeysSemaphore;
    v11->_waitForKeysSemaphore = (OS_dispatch_semaphore *)v14;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    pendingKeyIdentifiers = v11->_pendingKeyIdentifiers;
    v11->_pendingKeyIdentifiers = (NSMutableSet *)v16;

    v18 = objc_msgSend(v8, "copy");
    requestContext = v11->_requestContext;
    v11->_requestContext = (ICStoreRequestContext *)v18;

    objc_storeStrong((id *)&v11->_keyStore, a4);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    keyRenewalDates = v11->_keyRenewalDates;
    v11->_keyRenewalDates = (NSMutableDictionary *)v20;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v22 = objc_claimAutoreleasedReturnValue();
    completedKeyRequests = v11->_completedKeyRequests;
    v11->_completedKeyRequests = (NSMutableDictionary *)v22;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = objc_claimAutoreleasedReturnValue();
    keyResponses = v11->_keyResponses;
    v11->_keyResponses = (NSMutableDictionary *)v24;

    objc_storeWeak((id *)&v11->_delegate, v10);
    v11->_active = 1;
    v11->_isStoreKeyServer = 1;
    +[ICContentKeySession enhancedAudioSharedContentKeyPath](ICContentKeySession, "enhancedAudioSharedContentKeyPath");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v26, 1, 0, 0);

    v28 = -[ICFileContentKeyStore initWithPath:]([ICFileContentKeyStore alloc], "initWithPath:", v26);
    prefetchedContentKeyStore = v11->_prefetchedContentKeyStore;
    v11->_prefetchedContentKeyStore = v28;

    v30 = -[ICContentKeySessionPrefetchKeyConfiguration initWithRequestContext:]([ICContentKeySessionPrefetchKeyConfiguration alloc], "initWithRequestContext:", v8);
    prefetchKeyConfiguration = v11->_prefetchKeyConfiguration;
    v11->_prefetchKeyConfiguration = v30;

    objc_msgSend(MEMORY[0x1E0C8B1A0], "contentKeySessionWithKeySystem:", *MEMORY[0x1E0C8A1F0]);
    v32 = objc_claimAutoreleasedReturnValue();
    contentKeySession = v11->_contentKeySession;
    v11->_contentKeySession = (AVContentKeySession *)v32;

    -[AVContentKeySession setDelegate:queue:](v11->_contentKeySession, "setDelegate:queue:", v11, v11->_accessQueue);
    v34 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = v11->_contentKeySession;
      *(_DWORD *)buf = 138543618;
      v39 = v11;
      v40 = 2114;
      v41 = v35;
      _os_log_impl(&dword_1A03E3000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Created AVContentKeySession %{public}@", buf, 0x16u);
    }

  }
  return v11;
}

- (void)dealloc
{
  NSObject *keyRenewalTimer;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  keyRenewalTimer = self->_keyRenewalTimer;
  if (keyRenewalTimer)
    dispatch_source_cancel(keyRenewalTimer);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_renewalCompletionBlocks;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)ICContentKeySession;
  -[ICContentKeySession dealloc](&v9, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p (%@, requestOfflineKeys:%d)>"), objc_opt_class(), self, self->_contentKeySession, self->_requestOfflineKeys);
}

- (void)addAsset:(id)a3
{
  -[ICContentKeySession addAsset:shouldPreloadKeys:waitForKeyIdentifiers:](self, "addAsset:shouldPreloadKeys:waitForKeyIdentifiers:", a3, 0, 0);
}

- (void)addAsset:(id)a3 shouldPreloadKeys:(BOOL)a4 waitForKeyIdentifiers:(BOOL)a5
{
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  NSObject *accessQueue;
  _QWORD block[5];
  id v12;
  BOOL v13;
  uint8_t buf[4];
  ICContentKeySession *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v6 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v15 = self;
    v16 = 2114;
    v17 = v8;
    v18 = 1024;
    v19 = v6;
    _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Adding asset %{public}@. shouldPreloadKeys=%{BOOL}u", buf, 0x1Cu);
  }

  -[AVContentKeySession addContentKeyRecipient:](self->_contentKeySession, "addContentKeyRecipient:", v8);
  if (v6)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__ICContentKeySession_addAsset_shouldPreloadKeys_waitForKeyIdentifiers___block_invoke;
    block[3] = &unk_1E438E9A0;
    v13 = a5;
    block[4] = self;
    v12 = v8;
    dispatch_async(accessQueue, block);

  }
}

- (void)removeAsset:(id)a3
{
  -[AVContentKeySession removeContentKeyRecipient:](self->_contentKeySession, "removeContentKeyRecipient:", a3);
}

- (void)processKeyWithIdentifier:(id)a3
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
  block[2] = __48__ICContentKeySession_processKeyWithIdentifier___block_invoke;
  block[3] = &unk_1E4391110;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

- (void)pauseAutomaticKeyRenewal
{
  NSObject *v3;
  NSObject *accessQueue;
  _QWORD block[5];
  uint8_t buf[4];
  ICContentKeySession *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!self->_automaticKeyRenewalPaused)
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v7 = self;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Pausing automatic key renewal", buf, 0xCu);
    }

    self->_automaticKeyRenewalPaused = 1;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__ICContentKeySession_pauseAutomaticKeyRenewal__block_invoke;
    block[3] = &unk_1E43913D8;
    block[4] = self;
    dispatch_sync(accessQueue, block);
  }
}

- (void)resumeAutomaticKeyRenewal
{
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *accessQueue;
  _QWORD block[5];
  uint8_t buf[4];
  ICContentKeySession *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_automaticKeyRenewalPaused)
  {
    self->_automaticKeyRenewalPaused = 0;
    v3 = -[NSMutableDictionary count](self->_keyRenewalDates, "count");
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        *(_DWORD *)buf = 138543362;
        v9 = self;
        _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Resuming automatic key renewal", buf, 0xCu);
      }

      accessQueue = self->_accessQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__ICContentKeySession_resumeAutomaticKeyRenewal__block_invoke;
      block[3] = &unk_1E43913D8;
      block[4] = self;
      dispatch_sync(accessQueue, block);
    }
    else
    {
      if (v5)
      {
        *(_DWORD *)buf = 138543362;
        v9 = self;
        _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Automatic key renewal will resume when the first key has been requested.", buf, 0xCu);
      }

    }
  }
}

- (void)renewAllKeys
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__ICContentKeySession_renewAllKeys__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)stopSessionInvalidatingKeys:(BOOL)a3 withCompletion:(id)a4
{
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD *v11;
  BOOL v12;
  _QWORD v13[5];
  id v14;

  v6 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__27550;
  v13[4] = __Block_byref_object_dispose__27551;
  v14 = 0;
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__ICContentKeySession_stopSessionInvalidatingKeys_withCompletion___block_invoke;
  v9[3] = &unk_1E438EA40;
  v12 = a3;
  v10 = v6;
  v11 = v13;
  v9[4] = self;
  v8 = v6;
  dispatch_sync(accessQueue, v9);

  _Block_object_dispose(v13, 8);
}

- (void)invalidateKeyWithIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  ICContentKeyStoreProtocol *keyStore;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  void (**v19)(id, id);
  id v20;
  uint8_t buf[4];
  ICContentKeySession *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  keyStore = self->_keyStore;
  if (keyStore)
  {
    v20 = 0;
    -[ICContentKeyStoreProtocol loadKeyForIdentifier:error:](keyStore, "loadKeyForIdentifier:error:", v6, &v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v20;
    if (v10)
    {
      v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v22 = self;
        v23 = 2114;
        v24 = v6;
        v25 = 2114;
        v26 = v10;
        _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Failed to load key to stop with identifier %{public}@. err=%{public}@", buf, 0x20u);
      }

      v7[2](v7, v10);
    }
    objc_msgSend(v9, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "adamID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accountDSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "keyData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __66__ICContentKeySession_invalidateKeyWithIdentifier_withCompletion___block_invoke;
    v17[3] = &unk_1E438EF88;
    v17[4] = self;
    v18 = v9;
    v19 = v7;
    v16 = v9;
    -[ICContentKeySession _invalidateKeyWithIdentifier:forAdamID:offline:usingAccountDSID:keyData:withCompletion:](self, "_invalidateKeyWithIdentifier:forAdamID:offline:usingAccountDSID:keyData:withCompletion:", v12, v13, 1, v14, v15, v17);

  }
}

- (void)waitForKeyRenewalsWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  NSMutableSet *pendingRenewalKeyIdentifiers;
  NSObject *accessQueue;
  _QWORD v11[5];
  void (**v12)(_QWORD);
  uint8_t buf[4];
  ICContentKeySession *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  NSMutableSet *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  v5 = -[NSMutableSet count](self->_pendingRenewalKeyIdentifiers, "count");
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v8 = -[NSMutableSet count](self->_pendingRenewalKeyIdentifiers, "count");
      pendingRenewalKeyIdentifiers = self->_pendingRenewalKeyIdentifiers;
      *(_DWORD *)buf = 138543874;
      v14 = self;
      v15 = 2048;
      v16 = v8;
      v17 = 2114;
      v18 = pendingRenewalKeyIdentifiers;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Waiting for key renewals to complete for %lu identifiers %{public}@", buf, 0x20u);
    }

    accessQueue = self->_accessQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __63__ICContentKeySession_waitForKeyRenewalsWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E4390EF8;
    v11[4] = self;
    v12 = v4;
    dispatch_async(accessQueue, v11);

  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 138543362;
      v14 = self;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - No pending key renewals to wait for", buf, 0xCu);
    }

    v4[2](v4);
  }

}

- (void)waitForAllKeysToProcess
{
  -[ICContentKeySession waitForAllKeysToProcessWithTimeout:](self, "waitForAllKeysToProcessWithTimeout:", 0.0);
}

- (void)waitForAllKeysToProcessWithTimeout:(double)a3
{
  NSObject *v5;
  uint64_t v6;
  NSObject *accessQueue;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  NSMutableSet *pendingKeyIdentifiers;
  dispatch_time_t v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  uint64_t v18;
  NSMutableSet *v19;
  _QWORD block[6];
  uint8_t v21[4];
  ICContentKeySession *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  NSMutableSet *v26;
  _BYTE buf[24];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = (unint64_t)a3;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Waiting for key requests to complete with timeout %lus", buf, 0x16u);
  }

  v6 = MEMORY[0x1E0C809B0];
  while (1)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v28 = 0;
    accessQueue = self->_accessQueue;
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __58__ICContentKeySession_waitForAllKeysToProcessWithTimeout___block_invoke;
    block[3] = &unk_1E4391568;
    block[4] = self;
    block[5] = buf;
    dispatch_sync(accessQueue, block);
    v8 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (!v8)
    {
      if (!v10)
        goto LABEL_17;
      *(_DWORD *)v21 = 138543362;
      v22 = self;
      v14 = "%{public}@ [SKD] - Finished waiting for key requests to complete";
      v15 = v9;
      v16 = OS_LOG_TYPE_DEFAULT;
      v17 = 12;
      goto LABEL_16;
    }
    if (v10)
    {
      v11 = -[NSMutableSet count](self->_pendingKeyIdentifiers, "count");
      pendingKeyIdentifiers = self->_pendingKeyIdentifiers;
      *(_DWORD *)v21 = 138543874;
      v22 = self;
      v23 = 2048;
      v24 = v11;
      v25 = 2114;
      v26 = pendingKeyIdentifiers;
      _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Waiting for %lu keys: %{public}@", v21, 0x20u);
    }

    v13 = a3 == 0.0 ? -1 : dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_waitForKeysSemaphore, v13))
      break;
    _Block_object_dispose(buf, 8);
  }
  v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    goto LABEL_17;
  v18 = -[NSMutableSet count](self->_pendingKeyIdentifiers, "count");
  v19 = self->_pendingKeyIdentifiers;
  *(_DWORD *)v21 = 138543874;
  v22 = self;
  v23 = 2048;
  v24 = v18;
  v25 = 2114;
  v26 = v19;
  v14 = "%{public}@ [SKD] - Timed out waiting for %lu keys: %{public}@";
  v15 = v9;
  v16 = OS_LOG_TYPE_ERROR;
  v17 = 32;
LABEL_16:
  _os_log_impl(&dword_1A03E3000, v15, v16, v14, v21, v17);
LABEL_17:

  _Block_object_dispose(buf, 8);
}

- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4
{
  id v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  _BOOL4 requestOfflineKeys;
  uint64_t v13;
  id v14;
  void *v15;
  char v17;
  NSObject *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  uint8_t buf[4];
  ICContentKeySession *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICContentKeySession _isPrefetchKey:](self, "_isPrefetchKey:", v6);
  if (-[ICContentKeySession allowFallbackToStreamingKeys](self, "allowFallbackToStreamingKeys"))
  {
    +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shouldForceStreamingOnlyKeysForPlayback");

  }
  else
  {
    v9 = 0;
  }
  v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "ic_description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v31 = self;
    v32 = 2114;
    v33 = v11;
    v34 = 1024;
    LODWORD(v35[0]) = v7;
    WORD2(v35[0]) = 1024;
    *(_DWORD *)((char *)v35 + 6) = v9;
    _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - handling key request %{public}@. isPrefetchKey=%{BOOL}u, shouldForceStreamingOnlyKeysForPlayback=%{BOOL}u", buf, 0x22u);

  }
  requestOfflineKeys = self->_requestOfflineKeys;
  v13 = 48;
  if (v7)
    v13 = 104;
  v14 = *(id *)((char *)&self->super.isa + v13);
  v15 = v14;
  if (!requestOfflineKeys || v14 == 0)
    v17 = 1;
  else
    v17 = v9;
  if ((v17 & 1) == 0)
  {
    v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "ic_description");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = self;
      v32 = 2114;
      v33 = v19;
      _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Requesting persistable content key for %{public}@", buf, 0x16u);

    }
    v29 = 0;
    v20 = objc_msgSend(v5, "respondByRequestingPersistableContentKeyRequestAndReturnError:", &v29);
    v21 = v29;
    v22 = v21;
    if (v20)
    {

      goto LABEL_26;
    }
    v23 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "ic_description");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = self;
      v32 = 2114;
      v33 = v24;
      v34 = 2114;
      v35[0] = v22;
      _os_log_impl(&dword_1A03E3000, v23, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Failed to request persistable content key for '%{public}@' - requesting streaming key instead. err=%{public}@", buf, 0x20u);

    }
  }
  v25 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
  v26 = os_signpost_id_make_with_pointer(v25, v5);

  v27 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
  v28 = v27;
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_DWORD *)buf = 67240192;
    LODWORD(v31) = 1;
    _os_signpost_emit_with_name_impl(&dword_1A03E3000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v26, "ContentKeyRequest", " enableTelemetry=YES type=%{public, signpost.telemetry:number1, name=type}d", buf, 8u);
  }

  -[ICContentKeySession _performKeyDeliveryRequestForContentKeyRequest:persistResponse:isRenewal:](self, "_performKeyDeliveryRequestForContentKeyRequest:persistResponse:isRenewal:", v5, 0, 0);
LABEL_26:

}

- (void)contentKeySession:(id)a3 didProvidePersistableContentKeyRequest:(id)a4
{
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  unint64_t v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  id WeakRetained;
  void *v31;
  void *v32;
  uint64_t v33;
  BOOL v34;
  NSObject *v35;
  void *v36;
  dispatch_time_t v37;
  NSObject *accessQueue;
  void *v39;
  void *v40;
  os_signpost_id_t spid;
  int v42;
  _QWORD block[5];
  id v44;
  id v45;
  uint8_t buf[4];
  ICContentKeySession *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
  v7 = os_signpost_id_make_with_pointer(v6, v5);

  v8 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
  v9 = v8;
  v10 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 67240192;
    LODWORD(v47) = 2;
    _os_signpost_emit_with_name_impl(&dword_1A03E3000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ContentKeyRequest", " enableTelemetry=YES type=%{public, signpost.telemetry:number1, name=type}d", buf, 8u);
  }

  objc_msgSend(v5, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ICContentKeySession _isPrefetchKey:](self, "_isPrefetchKey:", v11);
  v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "ic_description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v47 = self;
    v48 = 2114;
    v49 = v14;
    v50 = 1024;
    LODWORD(v51) = v12;
    _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - handling persistable content key request %{public}@. isPrefetchKey=%{BOOL}u", buf, 0x1Cu);

  }
  +[ICEnvironmentMonitor sharedMonitor](ICEnvironmentMonitor, "sharedMonitor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isRemoteServerLikelyReachable"))
    v16 = objc_msgSend(v15, "isCurrentNetworkLinkHighQuality") ^ 1;
  else
    v16 = 1;
  v17 = 48;
  if (v12)
    v17 = 104;
  v18 = *(id *)((char *)&self->super.isa + v17);
  if (self->_bypassCache)
    goto LABEL_16;
  v42 = v16;
  spid = v7;
  objc_msgSend(v5, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  objc_msgSend(v18, "loadKeyForIdentifier:error:", v19, &v45);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v45;

  if (v21)
  {
    v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "ic_description");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v47 = self;
      v48 = 2114;
      v49 = v23;
      v50 = 2114;
      v51 = v21;
      _os_log_impl(&dword_1A03E3000, v22, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Failed to load key from store for key request %{public}@. err=%{public}@", buf, 0x20u);

    }
LABEL_16:
    v24 = 0;
LABEL_17:
    -[ICContentKeySession _performKeyDeliveryRequestForContentKeyRequest:persistResponse:isRenewal:](self, "_performKeyDeliveryRequestForContentKeyRequest:persistResponse:isRenewal:", v5, 1, 0);
    goto LABEL_18;
  }
  objc_msgSend(v20, "renewalDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "keyData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
    goto LABEL_17;
  v26 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "ic_description");
    v39 = v25;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v47 = self;
    v48 = 2114;
    v49 = v27;
    v50 = 2114;
    v51 = v24;
    _os_log_impl(&dword_1A03E3000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Returning cached key for key request %{public}@. renewalDate=%{public}@", buf, 0x20u);

    v25 = v39;
  }

  objc_msgSend(MEMORY[0x1E0C8B198], "contentKeyResponseWithFairPlayStreamingKeyResponseData:", v25);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processContentKeyResponse:");
  v28 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
  v29 = v28;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_DWORD *)buf = 136446210;
    v47 = (ICContentKeySession *)"FromCache";
    _os_signpost_emit_with_name_impl(&dword_1A03E3000, v29, OS_SIGNPOST_INTERVAL_END, spid, "ContentKeyRequest", " enableTelemetry=YES result=%{public, signpost.telemetry:string1, name=result}s", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "contentKeySession:didFinishProcessingKey:withResponse:error:", self, v11, 0, 0);
  if (((!v12 | v42) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v25;
    v33 = objc_msgSend(v24, "compare:", v31);

    v34 = v33 == -1;
    v25 = v32;
    if (v34)
    {
      _ICLogCategoryDefault();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "ic_description");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v47 = self;
        v48 = 2114;
        v49 = v36;
        v50 = 2114;
        v51 = v24;
        _os_log_impl(&dword_1A03E3000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - attempting to renew stale shared key for key request %{public}@. renewalDate=%{public}@", buf, 0x20u);

      }
      v37 = dispatch_time(0, 2000000000);
      accessQueue = self->_accessQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __80__ICContentKeySession_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke;
      block[3] = &unk_1E4391110;
      block[4] = self;
      v44 = v5;
      dispatch_after(v37, accessQueue, block);

      v25 = v32;
    }
  }
  -[ICContentKeySession _finishProcessingKeyWithIdentifier:](self, "_finishProcessingKeyWithIdentifier:", v11);

LABEL_18:
}

- (void)contentKeySession:(id)a3 didProvideRenewingContentKeyRequest:(id)a4
{
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  int v14;
  ICContentKeySession *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
  v7 = os_signpost_id_make_with_pointer(v6, v5);

  v8 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v14 = 67240192;
    LODWORD(v15) = 3;
    _os_signpost_emit_with_name_impl(&dword_1A03E3000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ContentKeyRequest", " enableTelemetry=YES type=%{public, signpost.telemetry:number1, name=type}d", (uint8_t *)&v14, 8u);
  }

  objc_msgSend(v5, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ICContentKeySession _isPrefetchKey:](self, "_isPrefetchKey:", v10);
  v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "ic_description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = self;
    v16 = 2114;
    v17 = v13;
    v18 = 1024;
    v19 = v11;
    _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - handling renewing key request %{public}@. isPrefetchKey=%{BOOL}u", (uint8_t *)&v14, 0x1Cu);

  }
  -[ICContentKeySession _performKeyDeliveryRequestForContentKeyRequest:persistResponse:isRenewal:](self, "_performKeyDeliveryRequestForContentKeyRequest:persistResponse:isRenewal:", v5, 0, 1);

}

- (void)contentKeySession:(id)a3 contentKeyRequestDidSucceed:(id)a4
{
  id v5;
  NSObject *v6;
  AVContentKeySession *contentKeySession;
  void *v8;
  int v9;
  ICContentKeySession *v10;
  __int16 v11;
  AVContentKeySession *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    contentKeySession = self->_contentKeySession;
    objc_msgSend(v5, "ic_description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = self;
    v11 = 2114;
    v12 = contentKeySession;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - contentKeySession:%{public}@ contentKeyRequestDidSucceed:%{public}@", (uint8_t *)&v9, 0x20u);

  }
}

- (void)contentKeySession:(id)a3 contentKeyRequest:(id)a4 didFailWithError:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  AVContentKeySession *contentKeySession;
  void *v11;
  int v12;
  ICContentKeySession *v13;
  __int16 v14;
  AVContentKeySession *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    contentKeySession = self->_contentKeySession;
    objc_msgSend(v7, "ic_description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544130;
    v13 = self;
    v14 = 2114;
    v15 = contentKeySession;
    v16 = 2114;
    v17 = v11;
    v18 = 2114;
    v19 = v8;
    _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - contentKeySession:%{public}@ contentKeyRequest:%{public}@ didFailWithError:%{public}@", (uint8_t *)&v12, 0x2Au);

  }
}

- (BOOL)_isPrefetchKey:(id)a3
{
  ICContentKeySessionPrefetchKeyConfiguration *prefetchKeyConfiguration;
  id v4;
  void *v5;
  char v6;

  prefetchKeyConfiguration = self->_prefetchKeyConfiguration;
  v4 = a3;
  -[ICContentKeySessionPrefetchKeyConfiguration keyIdentifiers](prefetchKeyConfiguration, "keyIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)_performKeyDeliveryRequestForContentKeyRequest:(id)a3 persistResponse:(BOOL)a4 isRenewal:(BOOL)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  _BOOL4 v10;
  BOOL v11;
  uint64_t v12;
  id v13;
  NSURL *offlineLeaseStartURL;
  NSURL *v15;
  NSURL *v16;
  NSURL *keyCertificateURL;
  NSURL *v18;
  NSURL *v19;
  ICSecureKeyDeliveryRequest *v20;
  NSNumber *adamID;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  BOOL v29;
  BOOL v30;

  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ICContentKeySession _isPrefetchKey:](self, "_isPrefetchKey:", v9);
  v11 = v10;
  v12 = 48;
  if (v10)
    v12 = 104;
  v13 = *(id *)((char *)&self->super.isa + v12);
  if (v6 && (offlineLeaseStartURL = self->_offlineLeaseStartURL) != 0
    || (offlineLeaseStartURL = self->_keyServerURL) != 0)
  {
    v15 = offlineLeaseStartURL;
  }
  else
  {
    -[ICContentKeySessionPrefetchKeyConfiguration keyServerURL](self->_prefetchKeyConfiguration, "keyServerURL");
    v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;
  keyCertificateURL = self->_keyCertificateURL;
  if (keyCertificateURL)
  {
    v18 = keyCertificateURL;
  }
  else
  {
    -[ICContentKeySessionPrefetchKeyConfiguration keyCertificateURL](self->_prefetchKeyConfiguration, "keyCertificateURL");
    v18 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;
  v20 = -[ICSecureKeyDeliveryRequest initWithRequestContext:contentKeyRequest:]([ICSecureKeyDeliveryRequest alloc], "initWithRequestContext:contentKeyRequest:", self->_requestContext, v8);
  -[ICSecureKeyDeliveryRequest setShouldIncludeDeviceGUID:](v20, "setShouldIncludeDeviceGUID:", 1);
  -[ICSecureKeyDeliveryRequest setCertificateURL:](v20, "setCertificateURL:", v19);
  -[ICSecureKeyDeliveryRequest setKeyServerURL:](v20, "setKeyServerURL:", v16);
  -[ICSecureKeyDeliveryRequest setITunesStoreRequest:](v20, "setITunesStoreRequest:", -[ICContentKeySession isStoreKeyServer](self, "isStoreKeyServer"));
  -[ICSecureKeyDeliveryRequest setIsOfflineDownload:](v20, "setIsOfflineDownload:", v6);
  if (v11)
    adamID = (NSNumber *)&unk_1E43E6808;
  else
    adamID = self->_adamID;
  -[ICSecureKeyDeliveryRequest setAdamID:](v20, "setAdamID:", adamID);
  -[ICSecureKeyDeliveryRequest setRequestProtocolType:](v20, "setRequestProtocolType:", self->_keyServerProtocolType);
  -[ICSecureKeyDeliveryRequest setLeaseActionType:](v20, "setLeaseActionType:", 2);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __96__ICContentKeySession__performKeyDeliveryRequestForContentKeyRequest_persistResponse_isRenewal___block_invoke;
  v25[3] = &unk_1E438EAB8;
  v25[4] = self;
  v26 = v8;
  v29 = v6;
  v27 = v9;
  v28 = v13;
  v30 = a5;
  v22 = v13;
  v23 = v9;
  v24 = v8;
  -[ICSecureKeyDeliveryRequest performWithResponseHandler:](v20, "performWithResponseHandler:", v25);

}

- (void)_scheduleKeyRefreshTimer
{
  NSObject *v3;
  OS_dispatch_source *v4;
  OS_dispatch_source *keyRenewalTimer;
  NSObject *v6;
  NSObject *v7;
  NSMutableDictionary *keyRenewalDates;
  NSMutableDictionary *v9;
  double v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  double v14;
  dispatch_time_t v15;
  _QWORD v16[5];
  _QWORD handler[4];
  id v18;
  uint8_t v19[4];
  ICContentKeySession *v20;
  __int16 v21;
  uint64_t v22;
  _BYTE buf[24];
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->_automaticKeyRenewalPaused)
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Automatic key renewal is currently paused", buf, 0xCu);
    }

  }
  else
  {
    if (!self->_keyRenewalTimer)
    {
      v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_accessQueue);
      keyRenewalTimer = self->_keyRenewalTimer;
      self->_keyRenewalTimer = v4;
      v6 = v4;

      objc_initWeak((id *)buf, self);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __47__ICContentKeySession__scheduleKeyRefreshTimer__block_invoke;
      handler[3] = &unk_1E4391400;
      objc_copyWeak(&v18, (id *)buf);
      dispatch_source_set_event_handler(v6, handler);
      dispatch_resume(v6);

      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
    if (-[NSMutableDictionary count](self->_keyRenewalDates, "count"))
    {
      v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        keyRenewalDates = self->_keyRenewalDates;
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = keyRenewalDates;
        _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Scheduling next key renewal using renewal times %{public}@", buf, 0x16u);
      }

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v24 = __Block_byref_object_copy__27550;
      v25 = __Block_byref_object_dispose__27551;
      v26 = 0;
      v9 = self->_keyRenewalDates;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __47__ICContentKeySession__scheduleKeyRefreshTimer__block_invoke_90;
      v16[3] = &unk_1E438EAE0;
      v16[4] = buf;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v9, "enumerateKeysAndObjectsUsingBlock:", v16);
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "timeIntervalSinceNow");
      if (v10 >= 1.0)
      {
        v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          *(_DWORD *)v19 = 138543618;
          v20 = self;
          v21 = 2114;
          v22 = v12;
          _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Scheduling next key refresh at %{public}@", v19, 0x16u);
        }

        v13 = self->_keyRenewalTimer;
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "timeIntervalSinceNow");
        v15 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
        dispatch_source_set_timer(v13, v15, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      }
      else
      {
        -[ICContentKeySession _renewExpiredKeys](self, "_renewExpiredKeys");
      }
      _Block_object_dispose(buf, 8);

    }
    else
    {
      dispatch_source_set_timer((dispatch_source_t)self->_keyRenewalTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    }
  }
}

- (void)_renewExpiredKeys
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSMutableDictionary *keyRenewalDates;
  uint64_t v8;
  id v9;
  id v10;
  NSMutableSet *pendingRenewalKeyIdentifiers;
  NSMutableSet *v12;
  NSMutableSet *v13;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  ICContentKeySession *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", 60.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v19 = self;
    v20 = 2114;
    v21 = v4;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Renewing key requests due to expire before %{public}@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[NSMutableDictionary count](self->_keyRenewalDates, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  keyRenewalDates = self->_keyRenewalDates;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __40__ICContentKeySession__renewExpiredKeys__block_invoke;
  v15[3] = &unk_1E438EB08;
  v9 = v4;
  v16 = v9;
  v10 = v6;
  v17 = v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](keyRenewalDates, "enumerateKeysAndObjectsUsingBlock:", v15);
  if (objc_msgSend(v10, "count"))
  {
    pendingRenewalKeyIdentifiers = self->_pendingRenewalKeyIdentifiers;
    if (pendingRenewalKeyIdentifiers)
    {
      -[NSMutableSet unionSet:](pendingRenewalKeyIdentifiers, "unionSet:", v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v10);
      v12 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v13 = self->_pendingRenewalKeyIdentifiers;
      self->_pendingRenewalKeyIdentifiers = v12;

    }
  }
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __40__ICContentKeySession__renewExpiredKeys__block_invoke_2;
  v14[3] = &unk_1E4390970;
  v14[4] = self;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);

}

- (void)_processKeyWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  ICContentKeySession *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543618;
    v7 = self;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Requesting key with identifier %{public}@", (uint8_t *)&v6, 0x16u);
  }

  -[NSMutableSet addObject:](self->_pendingKeyIdentifiers, "addObject:", v4);
  -[AVContentKeySession processContentKeyRequestWithIdentifier:initializationData:options:](self->_contentKeySession, "processContentKeyRequestWithIdentifier:initializationData:options:", v4, 0, 0);

}

- (void)_finishProcessingKeyWithIdentifier:(id)a3
{
  NSMutableSet *pendingKeyIdentifiers;
  id v5;
  void *v6;
  NSMutableArray *renewalCompletionBlocks;
  NSObject *v8;
  int v9;
  ICContentKeySession *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  pendingKeyIdentifiers = self->_pendingKeyIdentifiers;
  v5 = a3;
  -[NSMutableSet removeObject:](pendingKeyIdentifiers, "removeObject:", v5);
  -[NSMutableSet removeObject:](self->_pendingRenewalKeyIdentifiers, "removeObject:", v5);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_waitForKeysSemaphore);
  if (!-[NSMutableSet count](self->_pendingRenewalKeyIdentifiers, "count")
    && -[NSMutableArray count](self->_renewalCompletionBlocks, "count"))
  {
    v6 = (void *)-[NSMutableArray copy](self->_renewalCompletionBlocks, "copy");
    renewalCompletionBlocks = self->_renewalCompletionBlocks;
    self->_renewalCompletionBlocks = 0;

    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = self;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Finished waiting for key renewals to complete", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(v6, "enumerateObjectsUsingBlock:", &__block_literal_global_94);
  }
}

- (void)_invalidateKeyWithIdentifier:(id)a3 forAdamID:(id)a4 offline:(BOOL)a5 usingAccountDSID:(id)a6 keyData:(id)a7 withCompletion:(id)a8
{
  _BOOL4 v11;
  id v14;
  NSNumber *v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSNumber *adamID;
  NSNumber *v23;
  ICContentKeyNonceRequest *v24;
  void *v25;
  NSURL *streamingleaseStopURL;
  NSURL *v27;
  NSURL *keyCertificateURL;
  NSURL *v29;
  NSURL *v30;
  ICSecureKeyDeliveryRequest *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  NSNumber *v36;
  id v37;
  _QWORD v38[5];
  id v39;
  id v40;
  uint8_t buf[4];
  ICContentKeySession *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  _BOOL4 v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v11 = a5;
  v49 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = (NSNumber *)a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v20 = v19;
  if (v17)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      ICCreateLoggableValueForDSID(v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v42 = self;
      v43 = 2114;
      v44 = v14;
      v45 = 1024;
      v46 = v11;
      v47 = 2114;
      v48 = v21;
      _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - invalidating key with identifier '%{public}@'. offline=%{BOOL}u, accountDSID=%{public}@", buf, 0x26u);

    }
    -[NSMutableDictionary removeObjectForKey:](self->_keyRenewalDates, "removeObjectForKey:", v14);
    adamID = v15;
    if (!v15)
      adamID = self->_adamID;
    v23 = adamID;
    if (v11)
    {
      v24 = -[ICContentKeyNonceRequest initWithStoreRequestContext:adamID:accountDSID:keyServerURL:]([ICContentKeyNonceRequest alloc], "initWithStoreRequestContext:adamID:accountDSID:keyServerURL:", self->_requestContext, v23, v16, self->_offlineLeaseStopNonceURL);
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __110__ICContentKeySession__invalidateKeyWithIdentifier_forAdamID_offline_usingAccountDSID_keyData_withCompletion___block_invoke_96;
      v32[3] = &unk_1E438EBC0;
      v32[4] = self;
      v33 = v14;
      v37 = v18;
      v34 = v17;
      v35 = v16;
      v36 = v23;
      -[ICContentKeyNonceRequest performWithResponseHandler:](v24, "performWithResponseHandler:", v32);

    }
    else
    {
      streamingleaseStopURL = self->_streamingleaseStopURL;
      if (streamingleaseStopURL || (streamingleaseStopURL = self->_keyServerURL) != 0)
      {
        v27 = streamingleaseStopURL;
      }
      else
      {
        -[ICContentKeySessionPrefetchKeyConfiguration keyServerURL](self->_prefetchKeyConfiguration, "keyServerURL");
        v27 = (NSURL *)objc_claimAutoreleasedReturnValue();
      }
      v24 = (ICContentKeyNonceRequest *)v27;
      keyCertificateURL = self->_keyCertificateURL;
      if (keyCertificateURL)
      {
        v29 = keyCertificateURL;
      }
      else
      {
        -[ICContentKeySessionPrefetchKeyConfiguration keyCertificateURL](self->_prefetchKeyConfiguration, "keyCertificateURL");
        v29 = (NSURL *)objc_claimAutoreleasedReturnValue();
      }
      v30 = v29;
      v31 = -[ICSecureKeyDeliveryRequest initWithRequestContext:serverPlaybackContextData:]([ICSecureKeyDeliveryRequest alloc], "initWithRequestContext:serverPlaybackContextData:", self->_requestContext, v17);
      -[ICSecureKeyDeliveryRequest setContentURI:](v31, "setContentURI:", v14);
      -[ICSecureKeyDeliveryRequest setShouldIncludeDeviceGUID:](v31, "setShouldIncludeDeviceGUID:", 1);
      -[ICSecureKeyDeliveryRequest setCertificateURL:](v31, "setCertificateURL:", v30);
      -[ICSecureKeyDeliveryRequest setKeyServerURL:](v31, "setKeyServerURL:", v24);
      -[ICSecureKeyDeliveryRequest setITunesStoreRequest:](v31, "setITunesStoreRequest:", -[ICContentKeySession isStoreKeyServer](self, "isStoreKeyServer"));
      -[ICSecureKeyDeliveryRequest setIsOfflineDownload:](v31, "setIsOfflineDownload:", 0);
      -[ICSecureKeyDeliveryRequest setAdamID:](v31, "setAdamID:", v23);
      -[ICSecureKeyDeliveryRequest setRequestProtocolType:](v31, "setRequestProtocolType:", self->_keyServerProtocolType);
      -[ICSecureKeyDeliveryRequest setLeaseActionType:](v31, "setLeaseActionType:", 3);
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __110__ICContentKeySession__invalidateKeyWithIdentifier_forAdamID_offline_usingAccountDSID_keyData_withCompletion___block_invoke;
      v38[3] = &unk_1E438EB70;
      v38[4] = self;
      v39 = v14;
      v40 = v18;
      -[ICSecureKeyDeliveryRequest performWithResponseHandler:](v31, "performWithResponseHandler:", v38);

    }
    goto LABEL_20;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    ICCreateLoggableValueForDSID(v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v42 = self;
    v43 = 2114;
    v44 = v14;
    v45 = 1024;
    v46 = v11;
    v47 = 2114;
    v48 = v25;
    _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - not invalidating key with identifier '%{public}@'. offline=%{BOOL}u, accountDSID=%{public}@ as keyData is nil", buf, 0x26u);

  }
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7101, 0);
    v23 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, NSNumber *))v18 + 2))(v18, v23);
LABEL_20:

  }
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (NSURL)keyServerURL
{
  return self->_keyServerURL;
}

- (void)setKeyServerURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSURL)keyCertificateURL
{
  return self->_keyCertificateURL;
}

- (void)setKeyCertificateURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)bypassCache
{
  return self->_bypassCache;
}

- (void)setBypassCache:(BOOL)a3
{
  self->_bypassCache = a3;
}

- (BOOL)requestOfflineKeys
{
  return self->_requestOfflineKeys;
}

- (void)setRequestOfflineKeys:(BOOL)a3
{
  self->_requestOfflineKeys = a3;
}

- (BOOL)allowFallbackToStreamingKeys
{
  return self->_allowFallbackToStreamingKeys;
}

- (void)setAllowFallbackToStreamingKeys:(BOOL)a3
{
  self->_allowFallbackToStreamingKeys = a3;
}

- (BOOL)isStoreKeyServer
{
  return self->_isStoreKeyServer;
}

- (void)setIsStoreKeyServer:(BOOL)a3
{
  self->_isStoreKeyServer = a3;
}

- (int64_t)keyServerProtocolType
{
  return self->_keyServerProtocolType;
}

- (void)setKeyServerProtocolType:(int64_t)a3
{
  self->_keyServerProtocolType = a3;
}

- (ICContentKeyStoreProtocol)keyStore
{
  return self->_keyStore;
}

- (NSURL)streamingleaseStopURL
{
  return self->_streamingleaseStopURL;
}

- (void)setStreamingleaseStopURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSURL)offlineLeaseStartURL
{
  return self->_offlineLeaseStartURL;
}

- (void)setOfflineLeaseStartURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSURL)offlineLeaseStopNonceURL
{
  return self->_offlineLeaseStopNonceURL;
}

- (void)setOfflineLeaseStopNonceURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSURL)offlineLeaseStopURL
{
  return self->_offlineLeaseStopURL;
}

- (void)setOfflineLeaseStopURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineLeaseStopURL, 0);
  objc_storeStrong((id *)&self->_offlineLeaseStopNonceURL, 0);
  objc_storeStrong((id *)&self->_offlineLeaseStartURL, 0);
  objc_storeStrong((id *)&self->_streamingleaseStopURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keyRenewalTimer, 0);
  objc_storeStrong((id *)&self->_keyResponses, 0);
  objc_storeStrong((id *)&self->_completedKeyRequests, 0);
  objc_storeStrong((id *)&self->_keyRenewalDates, 0);
  objc_storeStrong((id *)&self->_prefetchedContentKeyStore, 0);
  objc_storeStrong((id *)&self->_prefetchKeyConfiguration, 0);
  objc_storeStrong((id *)&self->_waitForKeysSemaphore, 0);
  objc_storeStrong((id *)&self->_renewalCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_pendingRenewalKeyIdentifiers, 0);
  objc_storeStrong((id *)&self->_pendingKeyIdentifiers, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_keyStore, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_contentKeySession, 0);
  objc_storeStrong((id *)&self->_keyCertificateURL, 0);
  objc_storeStrong((id *)&self->_keyServerURL, 0);
}

void __110__ICContentKeySession__invalidateKeyWithIdentifier_forAdamID_offline_usingAccountDSID_keyData_withCompletion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = a1[4];
      v8 = a1[5];
      objc_msgSend(v4, "msv_description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v7;
      v14 = 2114;
      v15 = v8;
      v16 = 2114;
      v17 = v9;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Completed stop request for key identifier '%{public}@' error=%{public}@", (uint8_t *)&v12, 0x20u);

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = a1[4];
    v11 = a1[5];
    v12 = 138543618;
    v13 = v10;
    v14 = 2114;
    v15 = v11;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Completed stop request for key identifier '%{public}@'", (uint8_t *)&v12, 0x16u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __110__ICContentKeySession__invalidateKeyWithIdentifier_forAdamID_offline_usingAccountDSID_keyData_withCompletion___block_invoke_96(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v6, "msv_description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v9;
      v30 = 2114;
      v31 = v10;
      v32 = 2114;
      v33 = v11;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Completed stop nonce request for key identifier '%{public}@' error=%{public}@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v29 = v12;
      v30 = 2114;
      v31 = v13;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Completed stop nonce request for key identifier '%{public}@'", buf, 0x16u);
    }

    objc_msgSend(v5, "nonceData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *MEMORY[0x1E0C8A1E8];
    v27 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(a1 + 40);
    v18 = *(void **)(v16 + 24);
    v20[2] = __110__ICContentKeySession__invalidateKeyWithIdentifier_forAdamID_offline_usingAccountDSID_keyData_withCompletion___block_invoke_98;
    v20[3] = &unk_1E438EB98;
    v19 = *(_QWORD *)(a1 + 48);
    v20[1] = 3221225472;
    v20[4] = v16;
    v21 = v17;
    v25 = *(id *)(a1 + 72);
    v22 = 0;
    v23 = *(id *)(a1 + 56);
    v24 = *(id *)(a1 + 64);
    objc_msgSend(v18, "invalidatePersistableContentKey:options:completionHandler:", v19, v15, v20);

  }
}

void __110__ICContentKeySession__invalidateKeyWithIdentifier_forAdamID_offline_usingAccountDSID_keyData_withCompletion___block_invoke_98(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  ICSecureKeyDeliveryRequest *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v26 = v8;
      v27 = 2114;
      v28 = v9;
      v29 = 2114;
      v30 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Failed to invalidate persisted key for identifier '%{public}@'. err=%{public}@", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 200);
    if (v11 || (v11 = *(void **)(v10 + 8)) != 0)
    {
      v12 = v11;
    }
    else
    {
      objc_msgSend(*(id *)(v10 + 96), "keyServerURL");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 16);
    if (v15)
    {
      v16 = v15;
    }
    else
    {
      objc_msgSend(*(id *)(v14 + 96), "keyCertificateURL");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v16;
    v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v26 = v19;
      v27 = 2114;
      v28 = v17;
      _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_ERROR, "%{public}@ certificateURL=%{public}@", buf, 0x16u);
    }

    v20 = -[ICSecureKeyDeliveryRequest initWithRequestContext:serverPlaybackContextData:]([ICSecureKeyDeliveryRequest alloc], "initWithRequestContext:serverPlaybackContextData:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), v5);
    -[ICSecureKeyDeliveryRequest setContentURI:](v20, "setContentURI:", *(_QWORD *)(a1 + 40));
    -[ICSecureKeyDeliveryRequest setAccountDSID:](v20, "setAccountDSID:", *(_QWORD *)(a1 + 56));
    -[ICSecureKeyDeliveryRequest setShouldIncludeDeviceGUID:](v20, "setShouldIncludeDeviceGUID:", 1);
    -[ICSecureKeyDeliveryRequest setCertificateURL:](v20, "setCertificateURL:", v17);
    -[ICSecureKeyDeliveryRequest setKeyServerURL:](v20, "setKeyServerURL:", v13);
    -[ICSecureKeyDeliveryRequest setITunesStoreRequest:](v20, "setITunesStoreRequest:", objc_msgSend(*(id *)(a1 + 32), "isStoreKeyServer"));
    -[ICSecureKeyDeliveryRequest setIsOfflineDownload:](v20, "setIsOfflineDownload:", 0);
    -[ICSecureKeyDeliveryRequest setAdamID:](v20, "setAdamID:", *(_QWORD *)(a1 + 64));
    -[ICSecureKeyDeliveryRequest setRequestProtocolType:](v20, "setRequestProtocolType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168));
    -[ICSecureKeyDeliveryRequest setLeaseActionType:](v20, "setLeaseActionType:", 3);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __110__ICContentKeySession__invalidateKeyWithIdentifier_forAdamID_offline_usingAccountDSID_keyData_withCompletion___block_invoke_99;
    v22[3] = &unk_1E438EB70;
    v21 = *(void **)(a1 + 40);
    v22[4] = *(_QWORD *)(a1 + 32);
    v23 = v21;
    v24 = *(id *)(a1 + 72);
    -[ICSecureKeyDeliveryRequest performWithResponseHandler:](v20, "performWithResponseHandler:", v22);

  }
}

void __110__ICContentKeySession__invalidateKeyWithIdentifier_forAdamID_offline_usingAccountDSID_keyData_withCompletion___block_invoke_99(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v6 = v5;
  if (v4)
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
LABEL_6:

      goto LABEL_7;
    }
    v7 = a1[4];
    v8 = a1[5];
    objc_msgSend(v4, "msv_description");
    v9 = objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v7;
    v20 = 2114;
    v21 = v8;
    v22 = 2114;
    v23 = v9;
    v10 = "%{public}@ [SKD] - Completed stop request for key identifier '%{public}@' error=%{public}@";
    v11 = v6;
    v12 = 32;
    goto LABEL_4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13 = a1[4];
    v14 = a1[5];
    v18 = 138543618;
    v19 = v13;
    v20 = 2114;
    v21 = v14;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Completed stop request for key identifier '%{public}@'", (uint8_t *)&v18, 0x16u);
  }

  v15 = *(void **)(a1[4] + 48);
  if (v15)
  {
    objc_msgSend(v15, "removeKeyForIdentifier:", a1[5]);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_6;
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    v16 = a1[4];
    v17 = a1[5];
    v18 = 138543618;
    v19 = v16;
    v20 = 2114;
    v21 = v17;
    v10 = "%{public}@ [SKD] - Failed to purge persisted key with identifier '%{public}@'";
    v11 = v9;
    v12 = 22;
LABEL_4:
    _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v18, v12);
LABEL_5:

    goto LABEL_6;
  }
LABEL_7:
  (*(void (**)(void))(a1[6] + 16))();

}

uint64_t __58__ICContentKeySession__finishProcessingKeyWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __40__ICContentKeySession__renewExpiredKeys__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "compare:", *(_QWORD *)(a1 + 32)) == -1)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

void __40__ICContentKeySession__renewExpiredKeys__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "removeObjectForKey:", v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v4, "ic_description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v8;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Renewing key request %{public}@", (uint8_t *)&v10, 0x16u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "removeObjectForKey:", v3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "renewExpiringResponseDataForContentKeyRequest:", v4);
  }
  else
  {
    if (v6)
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138543618;
      v11 = v9;
      v12 = 2114;
      v13 = v3;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - No existing key request to renew for identifier %{public}@ - requesting a new one", (uint8_t *)&v10, 0x16u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "processContentKeyRequestWithIdentifier:initializationData:options:", v3, 0, 0);
  }

}

void __47__ICContentKeySession__scheduleKeyRefreshTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_renewExpiredKeys");

}

void __47__ICContentKeySession__scheduleKeyRefreshTimer__block_invoke_90(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (!*(_QWORD *)(v7 + 40))
    goto LABEL_4;
  if (objc_msgSend(v5, "compare:") == -1)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
LABEL_4:
    objc_storeStrong((id *)(v7 + 40), a3);
  }

}

void __96__ICContentKeySession__performKeyDeliveryRequestForContentKeyRequest_persistResponse_isRenewal___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  char v21;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __96__ICContentKeySession__performKeyDeliveryRequestForContentKeyRequest_persistResponse_isRenewal___block_invoke_2;
  block[3] = &unk_1E438EA90;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 56);
  block[1] = 3221225472;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  v10 = *(id *)(a1 + 48);
  v20 = *(_BYTE *)(a1 + 64);
  v17 = v10;
  v18 = v5;
  v19 = *(id *)(a1 + 56);
  v21 = *(_BYTE *)(a1 + 65);
  v11 = v5;
  v12 = v6;
  dispatch_async(v9, block);

}

void __96__ICContentKeySession__performKeyDeliveryRequestForContentKeyRequest_persistResponse_isRenewal___block_invoke_2(uint64_t a1)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  os_signpost_id_t v39;
  void *v40;
  void *v41;
  __CFString *v42;
  void *v43;
  uint64_t v44;
  id v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  id v52;
  NSObject *v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  void *v58;
  NSObject *v59;
  uint64_t v60;
  void *v61;
  NSObject *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  uint64_t v75;
  NSObject *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  NSObject *v81;
  uint64_t v82;
  void *v83;
  id WeakRetained;
  NSObject *v85;
  NSObject *v86;
  uint64_t v87;
  id v88;
  id v89;
  id v90;
  id v91;
  uint8_t buf[4];
  uint64_t v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  id v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "ic_description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v93 = v5;
      v94 = 2114;
      v95 = v6;
      v96 = 2114;
      v97 = v2;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Secure key request failed for request %{public}@. err=%{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "removeObjectForKey:", *(_QWORD *)(a1 + 56));
    if (!*(_BYTE *)(a1 + 80) || !objc_msgSend(*(id *)(a1 + 40), "allowFallbackToStreamingKeys"))
      goto LABEL_11;
    objc_msgSend(v2, "domain");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("ICKeyServerError")))
    {
      v8 = objc_msgSend(v2, "code");

      if (v8 == -1004)
      {
        v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543362;
          v93 = v10;
          _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Key server returned a slot error - disabling requesting of offline keys for future retries", buf, 0xCu);
        }

        *(_BYTE *)(*(_QWORD *)(a1 + 40) + 161) = 0;
        +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setShouldForceStreamingOnlyKeysForPlayback:", 1);
        goto LABEL_33;
      }
LABEL_11:
      v11 = 0;
      goto LABEL_35;
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "ic_description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(void **)(a1 + 64);
      *(_DWORD *)buf = 138543874;
      v93 = v12;
      v94 = 2114;
      v95 = v13;
      v96 = 2114;
      v97 = v14;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Secure key request completed for request %{public}@. response=%{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "setObject:forKey:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
    if (!*(_BYTE *)(a1 + 80))
    {
      objc_msgSend(*(id *)(a1 + 64), "contentKeyContextData");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v7 = v34;
        v2 = 0;
        v11 = v7;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "data");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 0;
        v2 = 0;
      }
      goto LABEL_34;
    }
    v7 = *(id *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 64), "contentKeyContextData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = 0;
    objc_msgSend(v7, "persistableContentKeyFromKeyVendorResponse:options:error:", v15, 0, &v91);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v91;

    if (v11)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "identityStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "identity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = 0;
      objc_msgSend(v16, "DSIDForUserIdentity:outError:", v17, &v90);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v90;

      if (v19)
      {
        v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = *(_QWORD *)(a1 + 40);
          objc_msgSend(*(id *)(a1 + 48), "ic_description");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v93 = v21;
          v94 = 2114;
          v95 = v22;
          v96 = 2114;
          v97 = v19;
          _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Failed to resolve DSID for saving key request %{public}@. err=%{public}@", buf, 0x20u);

        }
      }
      v23 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = *(_QWORD *)(a1 + 40);
        v25 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138543874;
        v93 = v24;
        v94 = 2114;
        v95 = v25;
        v96 = 2114;
        v97 = v18;
        _os_log_impl(&dword_1A03E3000, v23, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - saving key with identifier %{public}@. accountDSID=%{public}@", buf, 0x20u);
      }

      v26 = *(void **)(a1 + 72);
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
      v28 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 64), "renewalDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "saveKey:forIdentifier:adamID:withRenewalDate:accountDSID:keyServerProtocolType:", v11, v28, v27, v29, v18, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 168));
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        v31 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v32 = *(_QWORD *)(a1 + 40);
          objc_msgSend(*(id *)(a1 + 48), "ic_description");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v93 = v32;
          v94 = 2114;
          v95 = v33;
          v96 = 2114;
          v97 = v30;
          _os_log_impl(&dword_1A03E3000, v31, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Failed to save key for persistable key request %{public}@. err=%{public}@", buf, 0x20u);

        }
      }

      goto LABEL_34;
    }
    v35 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "ic_description");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v93 = v36;
      v94 = 2114;
      v95 = v37;
      v96 = 2114;
      v97 = v2;
      _os_log_impl(&dword_1A03E3000, v35, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Failed to create persistable data for key request %{public}@. err=%{public}@", buf, 0x20u);

    }
    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
      v2 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_33:
  v11 = 0;
LABEL_34:

LABEL_35:
  v38 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
  v39 = os_signpost_id_make_with_pointer(v38, *(const void **)(a1 + 48));

  if (v2)
  {
    v40 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v2, "domain");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "stringWithFormat:", CFSTR("Error-%@-%lld"), v41, objc_msgSend(v2, "code"));
    v42 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v43 = *(void **)(a1 + 72);
    v44 = *(_QWORD *)(a1 + 56);
    v89 = 0;
    LODWORD(v41) = objc_msgSend(v43, "containsKeyForIdentifier:error:", v44, &v89);
    v45 = v89;
    if ((_DWORD)v41)
    {
      v46 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "ic_description");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v93 = v47;
        v94 = 2114;
        v95 = v48;
        _os_log_impl(&dword_1A03E3000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Failed to renew key for request %{public}@ - falling back to existing cached key", buf, 0x16u);

      }
      v49 = *(void **)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = v45;
      objc_msgSend(v49, "loadKeyForIdentifier:error:", v50, &v88);
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = v88;

      if (v52
        || (-[NSObject keyData](v51, "keyData"),
            v70 = (void *)objc_claimAutoreleasedReturnValue(),
            v70,
            !v70))
      {
        v53 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          v54 = *(_QWORD *)(a1 + 40);
          objc_msgSend(*(id *)(a1 + 48), "ic_description");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v93 = v54;
          v94 = 2114;
          v95 = v55;
          v96 = 2114;
          v97 = v52;
          _os_log_impl(&dword_1A03E3000, v53, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Can't fall back to cached prefetch key for request %{public}@. err=%{public}@", buf, 0x20u);

        }
        objc_msgSend(*(id *)(a1 + 48), "processContentKeyResponseError:", v2);
        v56 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          v57 = *(_QWORD *)(a1 + 40);
          objc_msgSend(*(id *)(a1 + 48), "ic_description");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v93 = v57;
          v94 = 2114;
          v95 = v58;
          v96 = 2114;
          v97 = v2;
          _os_log_impl(&dword_1A03E3000, v56, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Completed content key request %{public}@ with response error %{public}@", buf, 0x20u);

        }
      }
      else
      {
        v71 = (void *)MEMORY[0x1E0C8B198];
        -[NSObject keyData](v51, "keyData");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "contentKeyResponseWithFairPlayStreamingKeyResponseData:", v72);
        v56 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 48), "processContentKeyResponse:", v56);
        v42 = CFSTR("Fallback");
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "processContentKeyResponseError:", v2);
      v51 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        v65 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "ic_description");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v93 = v65;
        v94 = 2114;
        v95 = v66;
        v96 = 2114;
        v97 = v2;
        _os_log_impl(&dword_1A03E3000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Completed content key request %{public}@ with response error %{public}@", buf, 0x20u);

      }
      v52 = v45;
    }

    objc_msgSend(v2, "domain");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v73, "isEqualToString:", CFSTR("ICError")) & 1) != 0)
    {
      if (objc_msgSend(v2, "code") == -7100)
      {

LABEL_64:
        if (*(_BYTE *)(a1 + 81) && !*(_BYTE *)(a1 + 80))
        {
          v76 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            v77 = *(_QWORD *)(a1 + 40);
            objc_msgSend(*(id *)(a1 + 48), "ic_description");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v93 = v77;
            v94 = 2114;
            v95 = v78;
            _os_log_impl(&dword_1A03E3000, v76, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Scheduling a retry in 2 minutes for key %{public}@", buf, 0x16u);

          }
          v79 = *(void **)(*(_QWORD *)(a1 + 40) + 112);
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 120.0);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "setObject:forKey:", v80, *(_QWORD *)(a1 + 56));

        }
        else
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "removeObjectForKey:", *(_QWORD *)(a1 + 56));
        }
        goto LABEL_75;
      }
      v75 = objc_msgSend(v2, "code");

      if (v75 == -7003)
        goto LABEL_64;
    }
    else
    {

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "removeObjectForKey:", *(_QWORD *)(a1 + 56));
    v74 = (id)objc_msgSend(*(id *)(a1 + 72), "incrementFailureCountForKeyWithIdentifier:", *(_QWORD *)(a1 + 56));
    goto LABEL_75;
  }
  objc_msgSend(MEMORY[0x1E0C8B198], "contentKeyResponseWithFairPlayStreamingKeyResponseData:", v11);
  v52 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "processContentKeyResponse:", v52);
  v59 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    v60 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "ic_description");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v93 = v60;
    v94 = 2114;
    v95 = v61;
    v96 = 2114;
    v97 = v52;
    _os_log_impl(&dword_1A03E3000, v59, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Completed content key request %{public}@ with response %{public}@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "setObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  if (*(_BYTE *)(a1 + 80))
  {
    v62 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      v63 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "ic_description");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v93 = v63;
      v94 = 2114;
      v95 = v64;
      _os_log_impl(&dword_1A03E3000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - skipping automatic renewal for offline key request %{public}@", buf, 0x16u);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 64), "renewalDate");
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (v67)
    {
      v68 = *(void **)(*(_QWORD *)(a1 + 40) + 112);
      objc_msgSend(*(id *)(a1 + 64), "renewalDate");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setObject:forKey:", v69, *(_QWORD *)(a1 + 56));

    }
    else
    {
      v81 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        v82 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "ic_description");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v93 = v82;
        v94 = 2114;
        v95 = v83;
        _os_log_impl(&dword_1A03E3000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - No renewal date provided in response to key request %{public}@ - skipping automatic renewal", buf, 0x16u);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "removeObjectForKey:", *(_QWORD *)(a1 + 56));
    }
  }
  v42 = CFSTR("Success");
LABEL_75:

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 152));
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "contentKeySession:didFinishProcessingKey:withResponse:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_finishProcessingKeyWithIdentifier:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "_scheduleKeyRefreshTimer");
  v85 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
  v86 = v85;
  if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v85))
  {
    v87 = -[__CFString UTF8String](objc_retainAutorelease(v42), "UTF8String");
    *(_DWORD *)buf = 136446210;
    v93 = v87;
    _os_signpost_emit_with_name_impl(&dword_1A03E3000, v86, OS_SIGNPOST_INTERVAL_END, v39, "ContentKeyRequest", " enableTelemetry=YES result=%{public, signpost.telemetry:string1, name=result}s", buf, 0xCu);
  }

}

uint64_t __80__ICContentKeySession_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "renewExpiringResponseDataForContentKeyRequest:", *(_QWORD *)(a1 + 40));
}

uint64_t __58__ICContentKeySession_waitForAllKeysToProcessWithTimeout___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __63__ICContentKeySession_waitForKeyRenewalsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count"))
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    if (v2)
    {
      v9 = (id)MEMORY[0x1A1AFA8D0](*(_QWORD *)(a1 + 40));
      objc_msgSend(v2, "addObject:");

    }
    else
    {
      v5 = (void *)MEMORY[0x1E0C99DE8];
      v10 = (id)MEMORY[0x1A1AFA8D0](*(_QWORD *)(a1 + 40));
      objc_msgSend(v5, "arrayWithObject:");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 80);
      *(_QWORD *)(v7 + 80) = v6;

    }
  }
  else
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v12 = v4;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Finished waiting for key renewals to complete", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __66__ICContentKeySession_invalidateKeyWithIdentifier_withCompletion___block_invoke(uint64_t a1, void *a2)
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
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
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
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Failed to stop session for key %{public}@. err=%{public}@", (uint8_t *)&v7, 0x20u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __66__ICContentKeySession_stopSessionInvalidatingKeys_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  id obj;
  void *v38;
  NSObject *group;
  _QWORD block[5];
  id v41;
  uint64_t v42;
  _QWORD v43[6];
  NSObject *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  NSObject *v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint8_t v57[128];
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v59 = v3;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Stopping...", buf, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 145) = 0;
  group = dispatch_group_create();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "identityStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  objc_msgSend(v4, "DSIDForUserIdentity:outError:", v5, &v56);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v56;

  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v59 = v8;
      v60 = 2114;
      v61 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Failed to resolve DSID to invalidate keys with. err=%{public}@", buf, 0x16u);
    }

  }
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 48);
    if (v11)
    {
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __66__ICContentKeySession_stopSessionInvalidatingKeys_withCompletion___block_invoke_69;
      v50[3] = &unk_1E438E9F0;
      v51 = group;
      v52 = v9;
      v12 = v38;
      v13 = *(_QWORD *)(a1 + 32);
      v53 = v12;
      v54 = v13;
      v55 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v11, "enumerateKeyEntriesUsingBlock:", v50);

      v10 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend(*(id *)(v10 + 112), "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    objc_msgSend(v15, "removeObjectsInArray:", v9);
    if (objc_msgSend(v15, "count"))
    {
      v35 = v9;
      v36 = v6;
      v48 = 0u;
      v49 = 0u;
      v47 = 0u;
      v46 = 0u;
      v34 = v15;
      obj = v15;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v47 != v18)
              objc_enumerationMutation(obj);
            v20 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "objectForKey:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21)
            {
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "removeObjectForKey:", v20);
              dispatch_group_enter(group);
              v22 = *(_QWORD **)(a1 + 32);
              v23 = v22[5];
              objc_msgSend(v21, "serverPlaybackContextData");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v43[0] = MEMORY[0x1E0C809B0];
              v43[1] = 3221225472;
              v43[2] = __66__ICContentKeySession_stopSessionInvalidatingKeys_withCompletion___block_invoke_72;
              v43[3] = &unk_1E438E9C8;
              v43[4] = *(_QWORD *)(a1 + 32);
              v43[5] = v20;
              v45 = *(_QWORD *)(a1 + 48);
              v44 = group;
              objc_msgSend(v22, "_invalidateKeyWithIdentifier:forAdamID:offline:usingAccountDSID:keyData:withCompletion:", v20, v23, 0, v38, v24, v43);

            }
            else
            {
              v25 = os_log_create("com.apple.amp.iTunesCloud", "Default");
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                v26 = *(_QWORD *)(a1 + 32);
                *(_DWORD *)buf = 138543618;
                v59 = v26;
                v60 = 2114;
                v61 = v20;
                _os_log_impl(&dword_1A03E3000, v25, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Skipping invalidation for key '%{public}@' because the previous response couldn't be found", buf, 0x16u);
              }

            }
          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
        }
        while (v17);
      }

      v9 = v35;
      v6 = v36;
      v15 = v34;
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "removeAllObjects");
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(NSObject **)(v27 + 136);
  if (v28)
  {
    dispatch_source_cancel(v28);
    v29 = *(_QWORD *)(a1 + 32);
    v30 = *(void **)(v29 + 136);
    *(_QWORD *)(v29 + 136) = 0;

    v27 = *(_QWORD *)(a1 + 32);
  }
  v31 = *(NSObject **)(v27 + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__ICContentKeySession_stopSessionInvalidatingKeys_withCompletion___block_invoke_73;
  block[3] = &unk_1E438EA18;
  block[4] = v27;
  v32 = *(id *)(a1 + 40);
  v33 = *(_QWORD *)(a1 + 48);
  v41 = v32;
  v42 = v33;
  dispatch_group_notify(group, v31, block);

}

void __66__ICContentKeySession_stopSessionInvalidatingKeys_withCompletion___block_invoke_69(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t v17;

  v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v4 = *(void **)(a1 + 40);
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  objc_msgSend(v3, "accountDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "longLongValue"))
  {
    v7 = *(id *)(a1 + 48);

    v6 = v7;
  }
  v8 = *(void **)(a1 + 56);
  objc_msgSend(v3, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adamID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__ICContentKeySession_stopSessionInvalidatingKeys_withCompletion___block_invoke_2;
  v14[3] = &unk_1E438E9C8;
  v12 = *(_QWORD *)(a1 + 64);
  v14[4] = *(_QWORD *)(a1 + 56);
  v15 = v3;
  v17 = v12;
  v16 = *(id *)(a1 + 32);
  v13 = v3;
  objc_msgSend(v8, "_invalidateKeyWithIdentifier:forAdamID:offline:usingAccountDSID:keyData:withCompletion:", v9, v10, 1, v6, v11, v14);

}

void __66__ICContentKeySession_stopSessionInvalidatingKeys_withCompletion___block_invoke_72(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138543874;
      v9 = v6;
      v10 = 2114;
      v11 = v7;
      v12 = 2114;
      v13 = v4;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Failed to stop session for key %{public}@. err=%{public}@", (uint8_t *)&v8, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __66__ICContentKeySession_stopSessionInvalidatingKeys_withCompletion___block_invoke_73(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Session stopped", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __66__ICContentKeySession_stopSessionInvalidatingKeys_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543874;
      v9 = v6;
      v10 = 2114;
      v11 = v7;
      v12 = 2114;
      v13 = v4;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Failed to stop session for key %{public}@. err=%{public}@", (uint8_t *)&v8, 0x20u);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __35__ICContentKeySession_renewAllKeys__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(v3 + 120), "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v3;
    v28 = 2114;
    v29 = v4;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Issuing renewal for key requests. identifiers = %{public}@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "removeAllObjects");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v10, "ic_description");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v27 = v12;
          v28 = 2114;
          v29 = v13;
          _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Renewing key request %{public}@", buf, 0x16u);

        }
        v14 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
        if (v14)
        {
          objc_msgSend(v10, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v15);
        }
        else
        {
          v16 = (void *)MEMORY[0x1E0C99E20];
          objc_msgSend(v10, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setWithObject:", v15);
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = *(_QWORD *)(a1 + 32);
          v19 = *(void **)(v18 + 72);
          *(_QWORD *)(v18 + 72) = v17;

        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "renewExpiringResponseDataForContentKeyRequest:", v10);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

}

uint64_t __48__ICContentKeySession_resumeAutomaticKeyRenewal__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleKeyRefreshTimer");
}

void __47__ICContentKeySession_pauseAutomaticKeyRenewal__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 136);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 136);
    *(_QWORD *)(v3 + 136) = 0;

  }
}

uint64_t __48__ICContentKeySession_processKeyWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processKeyWithIdentifier:", *(_QWORD *)(a1 + 40));
}

void __72__ICContentKeySession_addAsset_shouldPreloadKeys_waitForKeyIdentifiers___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  NSObject *v10;
  id v11;
  char v12;
  id location;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
    v2 = dispatch_semaphore_create(0);
  else
    v2 = 0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v3 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__ICContentKeySession_addAsset_shouldPreloadKeys_waitForKeyIdentifiers___block_invoke_2;
  v8[3] = &unk_1E438E978;
  objc_copyWeak(&v11, &location);
  v9 = *(id *)(a1 + 40);
  v12 = *(_BYTE *)(a1 + 48);
  v4 = v2;
  v10 = v4;
  objc_msgSend(v3, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E43E6D70, v8);
  if (*(_BYTE *)(a1 + 48))
  {
    v5 = dispatch_time(0, 10000000000);
    if (dispatch_semaphore_wait(v4, v5))
    {
      v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v15 = v7;
        _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Timed out waiting for the list of content keys on the asset to load. this may delay key fetch", buf, 0xCu);
      }

    }
  }

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __72__ICContentKeySession_addAsset_shouldPreloadKeys_waitForKeyIdentifiers___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  dispatch_queue_t *v3;
  void (**v4)(_QWORD);
  void *v5;
  _QWORD v6[4];
  id v7;
  dispatch_queue_t *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __72__ICContentKeySession_addAsset_shouldPreloadKeys_waitForKeyIdentifiers___block_invoke_3;
    v6[3] = &unk_1E4391110;
    v7 = *(id *)(a1 + 32);
    v3 = (dispatch_queue_t *)WeakRetained;
    v8 = v3;
    v4 = (void (**)(_QWORD))MEMORY[0x1A1AFA8D0](v6);
    v5 = v4;
    if (*(_BYTE *)(a1 + 56))
    {
      v4[2](v4);
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    }
    else
    {
      dispatch_async(v3[7], v4);
    }

  }
}

void __72__ICContentKeySession_addAsset_shouldPreloadKeys_waitForKeyIdentifiers___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  uint64_t v47;
  int v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *obj;
  id obja;
  id objb;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t v71[128];
  uint8_t buf[4];
  id v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentKeySpecifiersEligibleForPreloading");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v68 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
    }
    while (v5);
  }
  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "msv_firstWhere:", &__block_literal_global_61);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if ((_NSIsNSString() & 1) != 0)
      {
        v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v12, 0);
        if (v13)
        {
          v66 = 0;
          objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v13, 0, &v66);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v66;
          if (v14)
          {
            if ((_NSIsNSArray() & 1) != 0)
            {
              v64 = 0u;
              v65 = 0u;
              v62 = 0u;
              v63 = 0u;
              v54 = v14;
              obj = v14;
              v16 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v80, 16);
              if (v16)
              {
                v17 = v16;
                v49 = v15;
                v50 = v13;
                v51 = v12;
                v52 = v11;
                v53 = v9;
                v18 = *(_QWORD *)v63;
                v19 = obj;
                do
                {
                  for (j = 0; j != v17; ++j)
                  {
                    if (*(_QWORD *)v63 != v18)
                      objc_enumerationMutation(v19);
                    v21 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
                    if ((_NSIsNSDictionary() & 1) != 0)
                    {
                      objc_msgSend(v21, "ic_stringValueForKey:", CFSTR("uri"));
                      v22 = objc_claimAutoreleasedReturnValue();
                      if (v22)
                      {
                        v23 = v22;
                        objc_msgSend(v2, "addObject:", v22);
                      }
                      else
                      {
                        v27 = os_log_create("com.apple.amp.iTunesCloud", "Default");
                        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                        {
                          v28 = *(void **)(a1 + 40);
                          *(_DWORD *)buf = 138543618;
                          v73 = v28;
                          v74 = 2114;
                          v75 = (uint64_t)v21;
                          _os_log_impl(&dword_1A03E3000, v27, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Failed to find key URI in key info dictionary %{public}@", buf, 0x16u);
                        }

                        v23 = 0;
                      }
                    }
                    else
                    {
                      v23 = os_log_create("com.apple.amp.iTunesCloud", "Default");
                      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                      {
                        v24 = *(void **)(a1 + 40);
                        v25 = (void *)objc_opt_class();
                        *(_DWORD *)buf = 138543874;
                        v73 = v24;
                        v19 = obj;
                        v74 = 2114;
                        v75 = (uint64_t)v25;
                        v76 = 2114;
                        v77 = v21;
                        v26 = v25;
                        _os_log_impl(&dword_1A03E3000, v23, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Got unexpected key info object type %{public}@. info=%{public}@", buf, 0x20u);

                      }
                    }

                  }
                  v17 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v62, v80, 16);
                }
                while (v17);
                v29 = v19;
                v11 = v52;
                v9 = v53;
                v13 = v50;
                v12 = v51;
                v15 = v49;
                v14 = v54;
              }
              else
              {
                v29 = obj;
              }
            }
            else
            {
              v29 = os_log_create("com.apple.amp.iTunesCloud", "Default");
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                obja = *(id *)(a1 + 40);
                v37 = (void *)objc_opt_class();
                *(_DWORD *)buf = 138543874;
                v73 = obja;
                v74 = 2114;
                v75 = (uint64_t)v37;
                v76 = 2114;
                v77 = v14;
                objb = v37;
                _os_log_impl(&dword_1A03E3000, v29, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Key list is not an array! class=%{public}@. keyList=%{public}@", buf, 0x20u);

              }
            }
          }
          else
          {
            v29 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              v36 = *(void **)(a1 + 40);
              *(_DWORD *)buf = 138543618;
              v73 = v36;
              v74 = 2114;
              v75 = (uint64_t)v15;
              _os_log_impl(&dword_1A03E3000, v29, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Failed to create keyInfo list from data. err=%{public}@", buf, 0x16u);
            }
          }

        }
        else
        {
          v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v35 = *(void **)(a1 + 40);
            *(_DWORD *)buf = 138543618;
            v73 = v35;
            v74 = 2114;
            v75 = (uint64_t)v12;
            _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Failed to create key data from metadata string '%{public}@'", buf, 0x16u);
          }
        }

        goto LABEL_44;
      }
      v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v34 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v73 = v34;
        v74 = 2114;
        v75 = (uint64_t)v12;
        v31 = "%{public}@ [SKD] - Got unexpected value type for key metadata item - ignoring. value=%{public}@";
        v32 = v13;
        v33 = 22;
        goto LABEL_34;
      }
    }
    else
    {
      v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v30 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v73 = v30;
        v31 = "%{public}@ [SKD] - Got nil value for key metadata item - ignoring";
        v32 = v13;
        v33 = 12;
LABEL_34:
        _os_log_impl(&dword_1A03E3000, v32, OS_LOG_TYPE_ERROR, v31, buf, v33);
      }
    }
LABEL_44:

  }
  v38 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    v39 = *(void **)(a1 + 40);
    v40 = objc_msgSend(v2, "count");
    v41 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138544130;
    v73 = v39;
    v74 = 2048;
    v75 = v40;
    v76 = 2114;
    v77 = v41;
    v78 = 2114;
    v79 = v2;
    _os_log_impl(&dword_1A03E3000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Found %lu keys to preload for asset %{public}@: %{public}@", buf, 0x2Au);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v42 = v2;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v59;
    do
    {
      for (k = 0; k != v44; ++k)
      {
        if (*(_QWORD *)v59 != v45)
          objc_enumerationMutation(v42);
        v47 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * k);
        v48 = objc_msgSend(*(id *)(a1 + 40), "_isPrefetchKey:", v47, v49, v50, v51, v52, v53);
        if (MSVDeviceIsAudioAccessory())
        {
          if (!v48)
            continue;
        }
        else if ((v48 & 1) != 0)
        {
          continue;
        }
        if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "containsObject:", v47) & 1) == 0)
          objc_msgSend(*(id *)(a1 + 40), "_processKeyWithIdentifier:", v47);
      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
    }
    while (v44);
  }

}

uint64_t __72__ICContentKeySession_addAsset_shouldPreloadKeys_waitForKeyIdentifiers___block_invoke_4(uint64_t a1, void *a2)
{
  __CFString *v2;
  __CFString *v3;
  uint64_t v4;

  objc_msgSend(a2, "key");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 == CFSTR("com.apple.hls.keys"))
    v4 = 1;
  else
    v4 = -[__CFString isEqual:](v2, "isEqual:", CFSTR("com.apple.hls.keys"));

  return v4;
}

+ (NSString)enhancedAudioSharedContentKeyPath
{
  if (enhancedAudioSharedContentKeyPath_onceToken != -1)
    dispatch_once(&enhancedAudioSharedContentKeyPath_onceToken, &__block_literal_global_27865);
  return (NSString *)(id)enhancedAudioSharedContentKeyPath_path;
}

+ (NSString)pendingInvalidationKeyStorePath
{
  void *v2;
  void *v3;

  MSVMobileHomeDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Media/ContentKeys/PendingInvalidation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)copyKeysToPendingInvalidationStoreFromPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  ICFileContentKeyStore *v9;
  ICFileContentKeyStore *v10;
  ICFileContentKeyStore *v11;
  id v12;
  _QWORD v14[4];
  ICFileContentKeyStore *v15;
  uint64_t *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__27550;
  v22 = __Block_byref_object_dispose__27551;
  v23 = 0;
  +[ICContentKeySession pendingInvalidationKeyStorePath](ICContentKeySession, "pendingInvalidationKeyStorePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "fileExistsAtPath:", v4) & 1) == 0)
  {
    v17 = 0;
    objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v17);
    v6 = v17;
    if (v6)
    {
      v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "msv_description");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v8;
        _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "ICContentKeySession Failed to create key purgatory directory error=%{public}@", buf, 0xCu);

      }
    }

  }
  v9 = -[ICFileContentKeyStore initWithPath:]([ICFileContentKeyStore alloc], "initWithPath:", v4);
  v10 = -[ICFileContentKeyStore initWithPath:]([ICFileContentKeyStore alloc], "initWithPath:", v3);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__ICContentKeySession_copyKeysToPendingInvalidationStoreFromPath___block_invoke;
  v14[3] = &unk_1E438EA68;
  v11 = v9;
  v15 = v11;
  v16 = &v18;
  -[ICFileContentKeyStore enumerateKeyEntriesUsingBlock:](v10, "enumerateKeyEntriesUsingBlock:", v14);
  v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __66__ICContentKeySession_copyKeysToPendingInvalidationStoreFromPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "saveKeyEntry:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "msv_description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v6;
      v10 = 2114;
      v11 = v7;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_ERROR, "ICContentKeySession Moving key '%{public}@' to invalidation directory error=%{public}@", (uint8_t *)&v8, 0x16u);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
  }

}

void __56__ICContentKeySession_enhancedAudioSharedContentKeyPath__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  MSVMobileHomeDirectory();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Media/EnhancedAudioSharedKeys/"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)enhancedAudioSharedContentKeyPath_path;
  enhancedAudioSharedContentKeyPath_path = v0;

}

@end
