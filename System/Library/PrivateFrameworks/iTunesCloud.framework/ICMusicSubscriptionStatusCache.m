@implementation ICMusicSubscriptionStatusCache

void __75__ICMusicSubscriptionStatusCache__getCacheKeyForRequestContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentity:", v2);

  objc_msgSend(v3, "setAllowsExpiredBags:", 1);
}

uint64_t __98__ICMusicSubscriptionStatusCache_getCachedSubscriptionStatusResponseForRequestContext_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __98__ICMusicSubscriptionStatusCache_getCachedSubscriptionStatusResponseForRequestContext_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __98__ICMusicSubscriptionStatusCache_getCachedSubscriptionStatusResponseForRequestContext_completion___block_invoke_2;
  v4[3] = &unk_1E43897A0;
  v4[4] = v2;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_getCacheKeyForRequestContext:completion:", v3, v4);

}

- (void)_getCacheKeyForRequestContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v8 = (void *)-[ICMusicSubscriptionStatusCacheKey copy](self->_baseCacheKey, "copy");
  objc_msgSend(v6, "delegatedIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v6, "identity");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_msgSend(v6, "identityStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75__ICMusicSubscriptionStatusCache__getCacheKeyForRequestContext_completion___block_invoke;
  v16[3] = &unk_1E4389F90;
  v17 = v8;
  v18 = v7;
  v14 = v7;
  v15 = v8;
  objc_msgSend(v13, "getPropertiesForUserIdentity:completionHandler:", v12, v16);

}

void __75__ICMusicSubscriptionStatusCache__getCacheKeyForRequestContext_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  ICStoreRequestContext *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(a2, "DSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setDSID:", v3);
  v4 = -[ICStoreRequestContext initWithBlock:]([ICStoreRequestContext alloc], "initWithBlock:", &__block_literal_global_53);
  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__ICMusicSubscriptionStatusCache__getCacheKeyForRequestContext_completion___block_invoke_3;
  v6[3] = &unk_1E438D3F8;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v5, "getBagForRequestContext:forceRefetch:withCompletionHandler:", v4, 0, v6);

}

void __75__ICMusicSubscriptionStatusCache__getCacheKeyForRequestContext_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "stringForBagKey:", CFSTR("storeFrontId"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    objc_msgSend(*(id *)(a1 + 32), "setStorefrontIdentifier:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __98__ICMusicSubscriptionStatusCache_getCachedSubscriptionStatusResponseForRequestContext_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __98__ICMusicSubscriptionStatusCache_getCachedSubscriptionStatusResponseForRequestContext_completion___block_invoke_3;
  v7[3] = &unk_1E4390EF8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));

}

- (void)getCachedSubscriptionStatusResponseForRequestContext:(id)a3 completion:(id)a4
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
  block[2] = __98__ICMusicSubscriptionStatusCache_getCachedSubscriptionStatusResponseForRequestContext_completion___block_invoke;
  block[3] = &unk_1E4390E58;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(accessQueue, block);

}

+ (ICMusicSubscriptionStatusCache)sharedCache
{
  if (sharedCache_sOnceToken != -1)
    dispatch_once(&sharedCache_sOnceToken, &__block_literal_global);
  return (ICMusicSubscriptionStatusCache *)(id)sharedCache_sSharedCache;
}

- (id)_init
{
  ICMusicSubscriptionStatusCache *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *calloutQueue;
  dispatch_queue_t v7;
  OS_dispatch_queue *persistenceQueue;
  void *v9;
  void *v10;
  void *v11;
  ICMusicSubscriptionStatusCacheKey *v12;
  ICMusicSubscriptionStatusCacheKey *baseCacheKey;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v20[16];
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)ICMusicSubscriptionStatusCache;
  v2 = -[ICMusicSubscriptionStatusCache init](&v21, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicSubscriptionStatusCache.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicSubscriptionStatusCache.calloutQueue", 0);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicSubscriptionStatusCache.persistenceQueue", 0);
    persistenceQueue = v2->_persistenceQueue;
    v2->_persistenceQueue = (OS_dispatch_queue *)v7;

    +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_isPhoneNumberAccessRestricted = objc_msgSend(v9, "isPhoneNumberAccessRestricted");

    +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastKnownSubscriptionStatusBaseCacheKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = -[ICMusicSubscriptionStatusCacheKey initWithDictionaryRepresentation:requiringDSID:]([ICMusicSubscriptionStatusCacheKey alloc], "initWithDictionaryRepresentation:requiringDSID:", v11, 0);
      baseCacheKey = v2->_baseCacheKey;
      v2->_baseCacheKey = v12;

    }
    -[ICMusicSubscriptionStatusCache updateBaseCacheKey](v2, "updateBaseCacheKey");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2->_isPhoneNumberAccessRestricted)
    {
      v15 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_DEFAULT, "Subscription status cache will not observe phone number because phone number access is restricted.", v20, 2u);
      }
    }
    else
    {
      +[ICTelephonyController sharedController](ICTelephonyController, "sharedController");
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObserver:selector:name:object:", v2, sel__handlePhoneNumberDidChangeNotification_, CFSTR("ICTelephonyPhoneNumberDidChangeNotification"), v15);
    }

    +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v2, sel__handleUserIdentityStoreDidChangeNotification_, CFSTR("ICUserIdentityStoreDidChangeNotification"), v16);

    +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v2, sel__handleActiveAccountDidChangeNotification_, CFSTR("ICActiveUserIdentityDidChangeNotification"), v17);

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v2, sel__handleSubscriptionStatusChangedDistributedNotification_, CFSTR("com.apple.itunescloud.ICMusicSubscriptionStatusDidChangeDistributedNotification"), 0);

    -[ICMusicSubscriptionStatusCache _loadPersistedCacheWithCompletion:](v2, "_loadPersistedCacheWithCompletion:", 0);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.itunescloud.ICMusicSubscriptionStatusDidChangeDistributedNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_isPhoneNumberAccessRestricted)
  {
    +[ICTelephonyController sharedController](ICTelephonyController, "sharedController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("ICTelephonyPhoneNumberDidChangeNotification"), v5);

  }
  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("ICUserIdentityStoreDidChangeNotification"), v6);

  v7.receiver = self;
  v7.super_class = (Class)ICMusicSubscriptionStatusCache;
  -[ICMusicSubscriptionStatusCache dealloc](&v7, sel_dealloc);
}

- (void)setCachedSubscriptionStatusResponse:(id)a3 forRequestContext:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *accessQueue;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((objc_msgSend(v9, "isFinalResponse") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicSubscriptionStatusCache.m"), 119, CFSTR("Caching a non final subscription status request is not allowed: %@."), v9);

  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponse_forRequestContext_completion___block_invoke;
  block[3] = &unk_1E4390EA8;
  block[4] = self;
  v18 = v10;
  v19 = v9;
  v20 = v11;
  v13 = v11;
  v14 = v9;
  v15 = v10;
  dispatch_barrier_async(accessQueue, block);

}

- (void)setCachedSubscriptionStatusResponseNeedsReloadForAllRequestContextsWithCompletion:(id)a3
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
  v7[2] = __116__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponseNeedsReloadForAllRequestContextsWithCompletion___block_invoke;
  v7[3] = &unk_1E4390EF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

- (void)setCachedSubscriptionStatusResponseNeedsReloadForRequestContext:(id)a3 completion:(id)a4
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
  block[2] = __109__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponseNeedsReloadForRequestContext_completion___block_invoke;
  block[3] = &unk_1E4390E58;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_async(accessQueue, block);

}

- (void)updateBaseCacheKey
{
  BOOL isPhoneNumberAccessRestricted;
  NSObject *accessQueue;
  _QWORD v4[5];
  BOOL v5;

  isPhoneNumberAccessRestricted = self->_isPhoneNumberAccessRestricted;
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__ICMusicSubscriptionStatusCache_updateBaseCacheKey__block_invoke;
  v4[3] = &unk_1E438E600;
  v4[4] = self;
  v5 = isPhoneNumberAccessRestricted;
  dispatch_barrier_async(accessQueue, v4);
}

- (void)_handlePhoneNumberDidChangeNotification:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Received phone number did change notification. Updating base cache key for subscription status cache.", v5, 2u);
  }

  -[ICMusicSubscriptionStatusCache updateBaseCacheKey](self, "updateBaseCacheKey");
}

- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Received user identity store did change notification. Updating base cache key for subscription status cache.", v5, 2u);
  }

  -[ICMusicSubscriptionStatusCache updateBaseCacheKey](self, "updateBaseCacheKey");
}

- (void)_handleActiveAccountDidChangeNotification:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Received active identity did change notification - invalidating cache.", v5, 2u);
  }

  -[ICMusicSubscriptionStatusCache setCachedSubscriptionStatusResponseNeedsReloadForAllRequestContextsWithCompletion:](self, "setCachedSubscriptionStatusResponseNeedsReloadForAllRequestContextsWithCompletion:", &__block_literal_global_51);
}

- (void)_handleSubscriptionStatusChangedDistributedNotification:(id)a3
{
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Reloading subscription status cache due to external change notification", buf, 2u);
  }

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __90__ICMusicSubscriptionStatusCache__handleSubscriptionStatusChangedDistributedNotification___block_invoke;
  v5[3] = &unk_1E438AD20;
  v5[4] = self;
  -[ICMusicSubscriptionStatusCache _loadPersistedCacheWithCompletion:](self, "_loadPersistedCacheWithCompletion:", v5);
}

- (void)_loadPersistedCacheWithCompletion:(id)a3
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
  v7[2] = __68__ICMusicSubscriptionStatusCache__loadPersistedCacheWithCompletion___block_invoke;
  v7[3] = &unk_1E4390EF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

- (void)_persistCachePostingGlobalNotification:(BOOL)a3
{
  void *v5;
  NSMutableDictionary *cachedSubscriptionStatusResponses;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *persistenceQueue;
  id v19;
  _QWORD v20[4];
  id v21;
  BOOL v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  ICMusicSubscriptionStatusCache *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_cachedSubscriptionStatusResponses, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  cachedSubscriptionStatusResponses = self->_cachedSubscriptionStatusResponses;
  v7 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __73__ICMusicSubscriptionStatusCache__persistCachePostingGlobalNotification___block_invoke;
  v24[3] = &unk_1E4389888;
  v8 = v5;
  v25 = v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cachedSubscriptionStatusResponses, "enumerateKeysAndObjectsUsingBlock:", v24);
  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v9, "DSIDForUserIdentity:outError:", v10, &v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v23;

  if (v12)
  {
    v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v27 = self;
      v28 = 2114;
      v29 = v12;
      _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load active account DSID to save. err=%{public}@", buf, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "buildVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forKey:", v16, CFSTR("lastKnownOSVersion"));

  if (v11)
    v17 = v11;
  else
    v17 = &unk_1E43E6508;
  objc_msgSend(v14, "setValue:forKey:", v17, CFSTR("lastKnownActiveDSID"));
  objc_msgSend(v14, "setValue:forKey:", v8, CFSTR("responses"));
  persistenceQueue = self->_persistenceQueue;
  v20[0] = v7;
  v20[1] = 3221225472;
  v20[2] = __73__ICMusicSubscriptionStatusCache__persistCachePostingGlobalNotification___block_invoke_60;
  v20[3] = &unk_1E438E600;
  v21 = v14;
  v22 = a3;
  v19 = v14;
  dispatch_async(persistenceQueue, v20);

}

- (void)_postLocalChangeNotificationWithUserInfo:(id)a3
{
  NSObject *calloutQueue;
  id v5;
  id v6;

  calloutQueue = self->_calloutQueue;
  v5 = a3;
  dispatch_assert_queue_V2(calloutQueue);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("ICMusicSubscriptionStatusCacheDidChangeNotification"), self, v5);

}

- (id)_statusChangeUserInfoForUserIdentity:(id)a3 oldStatus:(id)a4 newStatus:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99E08];
  v10 = a3;
  objc_msgSend(v9, "dictionaryWithCapacity:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "copy");

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("ICUserIdentityForMusicSubscriptionStatusDidChangeKey"));
  if (v7)
  {
    v13 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("ICOldStatusForMusicSubscriptionStatusDidChangeKey"));

  }
  if (v8)
  {
    v14 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("ICNewStatusForMusicSubscriptionStatusDidChangeKey"));

  }
  v15 = (void *)objc_msgSend(v11, "copy");

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSubscriptionStatusResponses, 0);
  objc_storeStrong((id *)&self->_baseCacheKey, 0);
  objc_storeStrong((id *)&self->_persistenceQueue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __73__ICMusicSubscriptionStatusCache__persistCachePostingGlobalNotification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  objc_msgSend(a2, "stringRepresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyListRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v6)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v7);

}

void __73__ICMusicSubscriptionStatusCache__persistCachePostingGlobalNotification___block_invoke_60(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCachedSubscriptionStatus:", *(_QWORD *)(a1 + 32));

  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronize");

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("com.apple.itunescloud.ICMusicSubscriptionStatusDidChangeDistributedNotification"), 0);

  }
}

void __68__ICMusicSubscriptionStatusCache__loadPersistedCacheWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  _UNKNOWN **v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  ICMusicSubscriptionStatusCacheKey *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  id v51;
  void (**v52)(_QWORD);
  void *v53;
  char v54;
  void *v55;
  void *v56;
  NSObject *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  uint64_t v72;
  _QWORD block[4];
  id v74;
  void (**v75)(_QWORD);
  _QWORD v76[5];
  id v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  id v83;
  uint8_t v84[128];
  uint8_t buf[4];
  uint64_t v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  id v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  void *v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v65 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "synchronize");

  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedSubscriptionStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "ic_dictionaryValueForKey:", CFSTR("responses"));
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_stringValueForKey:", CFSTR("lastKnownOSVersion"));
  v5 = objc_claimAutoreleasedReturnValue();
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buildVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = 0;
  objc_msgSend(v8, "DSIDForUserIdentity:outError:", v9, &v83);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v83;

  objc_msgSend(v3, "ic_numberValueForKey:", CFSTR("lastKnownActiveDSID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v86 = v14;
      v87 = 2114;
      v88 = (uint64_t)v11;
      _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load active account DSID - skipping account check. err=%{public}@", buf, 0x16u);
    }

  }
  v15 = v7;
  if ((id)v5 == v15)
  {

    if (!v11)
      goto LABEL_10;
  }
  else
  {
    v16 = objc_msgSend((id)v5, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
    if (!v11)
    {
LABEL_10:
      v17 = objc_msgSend(v12, "unsignedLongLongValue");
      if (v17 == objc_msgSend(v10, "unsignedLongLongValue"))
        goto LABEL_11;
LABEL_12:
      v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138544386;
        v86 = v19;
        v87 = 2114;
        v88 = v5;
        v89 = 2114;
        v90 = v15;
        v91 = 2114;
        v92 = v12;
        v93 = 2114;
        v94 = v10;
        _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ invalidating loaded cached subscription status. cachedOSVersion=%{public}@, currentOSVersion=%{public}@; cachedActiveAcccountDSID=%{public}@, currentActiveAccountDSID=%{public}@",
          buf,
          0x34u);
      }

      v69 = 1;
      goto LABEL_15;
    }
  }
LABEL_11:
  v69 = 0;
LABEL_15:
  if (!(v5 | v4))
  {
    if (objc_msgSend(v3, "count"))
      v4 = v3;
    else
      v4 = 0;
  }
  v64 = v3;
  v20 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v86 = v21;
    v87 = 2114;
    v88 = v4;
    _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ loaded subscription status cache: %{public}@", buf, 0x16u);
  }
  v59 = v15;
  v60 = v12;
  v61 = v11;
  v62 = v10;
  v63 = (void *)v5;

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v22 = (id)v4;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
  v71 = v22;
  if (!v23)
  {
    v70 = 0;
    v25 = 0;
    v27 = a1;
    goto LABEL_55;
  }
  v24 = v23;
  v70 = 0;
  v25 = 0;
  v72 = *(_QWORD *)v80;
  v26 = &off_1E437A000;
  v27 = a1;
  v28 = 0x1E0C99000uLL;
  do
  {
    v29 = 0;
    do
    {
      if (*(_QWORD *)v80 != v72)
        objc_enumerationMutation(v22);
      v30 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * v29);
      objc_msgSend(v22, "objectForKey:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!_NSIsNSString() || !_NSIsNSDictionary())
      {
        v32 = 0;
        v35 = 0;
LABEL_44:
        if (!v25)
          goto LABEL_45;
        goto LABEL_46;
      }
      v32 = -[ICMusicSubscriptionStatusCacheKey initWithStringRepresentation:]([ICMusicSubscriptionStatusCacheKey alloc], "initWithStringRepresentation:", v30);
      v33 = v31;
      if ((objc_msgSend(v26[277], "isValidSubscriptionStatusPropertyListRepresentation:error:", v33, 0) & 1) == 0)
      {

        v35 = 0;
LABEL_50:
        v22 = v71;
        if (!v25)
LABEL_45:
          v25 = objc_alloc_init(*(Class *)(v28 + 3560));
LABEL_46:
        objc_msgSend(v25, "addObject:", v30);
        goto LABEL_47;
      }
      v34 = (void *)objc_msgSend(objc_alloc((Class)v26[277]), "initWithPropertyListRepresentation:", v33);
      v35 = v34;
      if (v69)
        objc_msgSend(v34, "setNeedsReload:", 1);

      if (!v32)
        goto LABEL_50;
      v22 = v71;
      if (!v35)
        goto LABEL_44;
      v36 = v70;
      if (!v70)
        v36 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v70 = v36;
      objc_msgSend(v36, "setObject:forKey:", v35, v32);
      objc_msgSend(*(id *)(*(_QWORD *)(v27 + 32) + 48), "objectForKey:", v32);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = *(void **)(*(_QWORD *)(v27 + 32) + 48);
      if (!v38)
      {
        v39 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v40 = *(_QWORD *)(v27 + 32);
        v41 = *(void **)(v40 + 48);
        *(_QWORD *)(v40 + 48) = v39;

        v38 = *(void **)(*(_QWORD *)(v27 + 32) + 48);
      }
      objc_msgSend(v38, "setObject:forKey:", v35, v32);
      objc_msgSend(v37, "subscriptionStatus");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "subscriptionStatus");
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = (void *)v43;
      if (v42 != (void *)v43 && (!v42 || !v43 || (objc_msgSend(v42, "isEqualToStatus:", v43) & 1) == 0))
      {
        -[ICMusicSubscriptionStatusCacheKey DSID](v32, "DSID");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICUserIdentity specificAccountWithDSID:](ICUserIdentity, "specificAccountWithDSID:", v67);
        v68 = v37;
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v27 + 32), "_statusChangeUserInfoForUserIdentity:oldStatus:newStatus:", v45, v42, v44);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "addObject:", v46);

        v27 = a1;
        v37 = v68;

      }
      v28 = 0x1E0C99000;
      v22 = v71;
LABEL_47:

      ++v29;
      v26 = &off_1E437A000;
    }
    while (v24 != v29);
    v47 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
    v24 = v47;
  }
  while (v47);
LABEL_55:

  v48 = MEMORY[0x1E0C809B0];
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __68__ICMusicSubscriptionStatusCache__loadPersistedCacheWithCompletion___block_invoke_57;
  v76[3] = &unk_1E4390E58;
  v49 = *(id *)(v27 + 40);
  v50 = *(_QWORD *)(v27 + 32);
  v78 = v49;
  v76[4] = v50;
  v51 = v65;
  v77 = v51;
  v52 = (void (**)(_QWORD))MEMORY[0x1A1AFA8D0](v76);
  if (objc_msgSend(v25, "count")
    && (objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"),
        v53 = (void *)objc_claimAutoreleasedReturnValue(),
        v54 = objc_msgSend(v53, "ic_isCloudDaemon"),
        v53,
        (v54 & 1) != 0))
  {
    v55 = (void *)objc_msgSend(v64, "mutableCopy");
    objc_msgSend(v55, "removeObjectsForKeys:", v25);
    v56 = (void *)objc_msgSend(v55, "copy");

    v57 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    block[0] = v48;
    block[1] = 3221225472;
    block[2] = __68__ICMusicSubscriptionStatusCache__loadPersistedCacheWithCompletion___block_invoke_3;
    block[3] = &unk_1E4390EF8;
    v58 = v56;
    v74 = v58;
    v75 = v52;
    dispatch_async(v57, block);

  }
  else
  {
    v52[2](v52);
    v58 = v64;
  }

}

void __68__ICMusicSubscriptionStatusCache__loadPersistedCacheWithCompletion___block_invoke_57(uint64_t a1)
{
  void *v1;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v1 = *(void **)(a1 + 48);
  if (v1)
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __68__ICMusicSubscriptionStatusCache__loadPersistedCacheWithCompletion___block_invoke_2;
    v4[3] = &unk_1E4390EF8;
    v6 = v1;
    v5 = *(id *)(a1 + 40);
    dispatch_async(v3, v4);

  }
}

uint64_t __68__ICMusicSubscriptionStatusCache__loadPersistedCacheWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCachedSubscriptionStatus:", *(_QWORD *)(a1 + 32));

  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronize");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __68__ICMusicSubscriptionStatusCache__loadPersistedCacheWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __90__ICMusicSubscriptionStatusCache__handleSubscriptionStatusChangedDistributedNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "shouldTreatSubscriptionStatusAsExpired"))
  {
    v5 = MSVDeviceOSIsInternalInstall();

    if (v5)
    {
      v6 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "Posting local change notification as shouldTreatSubscriptionStatusAsExpired is set", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_postLocalChangeNotificationWithUserInfo:", 0);
      goto LABEL_16;
    }
  }
  else
  {

  }
  if (objc_msgSend(v3, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(a1 + 32), "_postLocalChangeNotificationWithUserInfo:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v9);
    }

  }
LABEL_16:

}

void __52__ICMusicSubscriptionStatusCache_updateBaseCacheKey__block_invoke(uint64_t a1)
{
  ICStoreRequestContext *v2;
  void *v3;
  _QWORD v4[5];
  char v5;

  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = -[ICStoreRequestContext initWithBlock:]([ICStoreRequestContext alloc], "initWithBlock:", &__block_literal_global_43);
  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__ICMusicSubscriptionStatusCache_updateBaseCacheKey__block_invoke_3;
  v4[3] = &unk_1E4389860;
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(_BYTE *)(a1 + 40);
  objc_msgSend(v3, "getBagForRequestContext:forceRefetch:withCompletionHandler:", v2, 0, v4);

}

void __52__ICMusicSubscriptionStatusCache_updateBaseCacheKey__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  ICMusicSubscriptionStatusCacheKey *v8;
  ICMusicSubscriptionStatusCacheKey *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  const __CFString *v13;
  ICMusicSubscriptionStatusCacheKey *v14;
  ICMusicSubscriptionStatusCacheKey *v15;
  _BOOL4 v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  ICMusicSubscriptionStatusCacheKey *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (v7)
    v8 = (ICMusicSubscriptionStatusCacheKey *)objc_msgSend(v7, "copy");
  else
    v8 = objc_alloc_init(ICMusicSubscriptionStatusCacheKey);
  v9 = v8;
  objc_msgSend(v5, "stringForBagKey:", CFSTR("storeFrontId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
    -[ICMusicSubscriptionStatusCacheKey setStorefrontIdentifier:](v9, "setStorefrontIdentifier:", v10);
  if (*(_BYTE *)(a1 + 40))
  {
    v11 = 0;
  }
  else
  {
    +[ICTelephonyController sharedController](ICTelephonyController, "sharedController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "phoneNumber");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  if (v11)
    v13 = v11;
  else
    v13 = &stru_1E4391778;
  -[ICMusicSubscriptionStatusCacheKey setPhoneNumber:](v9, "setPhoneNumber:", v13);
  v14 = (ICMusicSubscriptionStatusCacheKey *)*(id *)(*(_QWORD *)(a1 + 32) + 40);
  if (v14 == v9)
  {

  }
  else
  {
    v15 = v14;
    v16 = -[ICMusicSubscriptionStatusCacheKey isEqual:](v14, "isEqual:", v9);

    if (!v16)
    {
      v17 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
        *(_DWORD *)buf = 138543618;
        v29 = v18;
        v30 = 2114;
        v31 = v9;
        _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_DEFAULT, "Base cache key for subscription status cache updated from %{public}@ to %{public}@.", buf, 0x16u);
      }

      v19 = -[ICMusicSubscriptionStatusCacheKey copy](v9, "copy");
      v20 = *(_QWORD *)(a1 + 32);
      v21 = *(void **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = v19;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "dictionaryRepresentationIncludingDSID:", 0);
      v22 = objc_claimAutoreleasedReturnValue();
      +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setLastKnownSubscriptionStatusBaseCacheKey:", v22);

      v24 = *(_QWORD *)(a1 + 32);
      v25 = *(NSObject **)(v24 + 16);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__ICMusicSubscriptionStatusCache_updateBaseCacheKey__block_invoke_48;
      block[3] = &unk_1E43913D8;
      block[4] = v24;
      dispatch_async(v25, block);
      goto LABEL_20;
    }
  }
  v22 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
    *(_DWORD *)buf = 138543362;
    v29 = v26;
    _os_log_impl(&dword_1A03E3000, v22, OS_LOG_TYPE_DEFAULT, "Base cache key for subscription status cache remains unchanged: %{public}@.", buf, 0xCu);
  }
LABEL_20:

  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
}

void __52__ICMusicSubscriptionStatusCache_updateBaseCacheKey__block_invoke_48(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = CFSTR("ICMusicSubscriptionStatusCacheUnderlyingCachingPropertiesDidChangeNotification");
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "Posting %{public}@.", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("ICMusicSubscriptionStatusCacheUnderlyingCachingPropertiesDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __52__ICMusicSubscriptionStatusCache_updateBaseCacheKey__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentity:", v2);

  objc_msgSend(v3, "setAllowsExpiredBags:", 1);
}

void __109__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponseNeedsReloadForRequestContext_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __109__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponseNeedsReloadForRequestContext_completion___block_invoke_2;
  v4[3] = &unk_1E43897A0;
  v4[4] = v2;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_getCacheKeyForRequestContext:completion:", v3, v4);

}

void __109__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponseNeedsReloadForRequestContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  if (v5)
  {
    if ((objc_msgSend(v5, "needsReload") & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKey:", v5, v3);
    }
    else
    {
      objc_msgSend(v5, "setNeedsReload:", 1);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKey:", v5, v3);
      objc_msgSend(*(id *)(a1 + 32), "_persistCachePostingGlobalNotification:", 1);
    }
  }
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __109__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponseNeedsReloadForRequestContext_completion___block_invoke_3;
    block[3] = &unk_1E4390D18;
    v9 = v6;
    dispatch_async(v7, block);

  }
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));

}

uint64_t __109__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponseNeedsReloadForRequestContext_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __116__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponseNeedsReloadForAllRequestContextsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __116__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponseNeedsReloadForAllRequestContextsWithCompletion___block_invoke_2;
  v8[3] = &unk_1E4389818;
  v8[4] = *(_QWORD *)(a1 + 32);
  v8[5] = &v9;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v8);

  if (*((_BYTE *)v10 + 24))
    objc_msgSend(*(id *)(a1 + 32), "_persistCachePostingGlobalNotification:", 1);
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __116__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponseNeedsReloadForAllRequestContextsWithCompletion___block_invoke_3;
    block[3] = &unk_1E4390D18;
    v7 = v4;
    dispatch_async(v5, block);

  }
  _Block_object_dispose(&v9, 8);
}

void __116__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponseNeedsReloadForAllRequestContextsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  v5 = (void *)objc_msgSend(a3, "copy");
  if ((objc_msgSend(v5, "needsReload") & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    objc_msgSend(v5, "setNeedsReload:", 1);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKey:", v5, v6);

}

uint64_t __116__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponseNeedsReloadForAllRequestContextsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __99__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponse_forRequestContext_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;

  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __99__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponse_forRequestContext_completion___block_invoke_2;
  v4[3] = &unk_1E43897F0;
  v4[4] = v2;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "_getCacheKeyForRequestContext:completion:", v3, v4);

}

void __99__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponse_forRequestContext_completion___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  char v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  char v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*((id *)a1[4] + 6), "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1[5];
  v6 = (void *)*((_QWORD *)a1[4] + 6);
  if (v5)
  {
    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = a1[4];
      v9 = (void *)v8[6];
      v8[6] = v7;

      v5 = a1[5];
      v6 = (void *)*((_QWORD *)a1[4] + 6);
    }
    objc_msgSend(v6, "setObject:forKey:", v5, v3);
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1[5], "subscriptionStatus");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v3;
      v31 = 2114;
      v32 = v11;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "Setting cached subscription status response for cache key %{public}@: %{public}@.", buf, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", v3);
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v3;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "Removing cached subscription status response for cache key %{public}@.", buf, 0xCu);
    }
  }

  objc_msgSend(v4, "subscriptionStatus");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "subscriptionStatus");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v12 == (void *)v13)
  {
    v16 = 0;
  }
  else
  {
    if (v12)
      v15 = v13 == 0;
    else
      v15 = 1;
    if (v15)
      v16 = 1;
    else
      v16 = objc_msgSend(v12, "isEqualToStatus:", v13) ^ 1;
  }
  objc_msgSend(a1[4], "_persistCachePostingGlobalNotification:", 1);
  v17 = *((_QWORD *)a1[4] + 2);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __99__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponse_forRequestContext_completion___block_invoke_39;
  v22[3] = &unk_1E43897C8;
  v28 = v16;
  v18 = a1[6];
  v19 = a1[4];
  v23 = v18;
  v24 = v19;
  v25 = v12;
  v26 = v14;
  v27 = a1[7];
  v20 = v14;
  v21 = v12;
  dispatch_async(v17, v22);
  dispatch_resume(*((dispatch_object_t *)a1[4] + 1));

}

uint64_t __99__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponse_forRequestContext_completion___block_invoke_39(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t result;

  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegatedIdentity");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      v4 = v2;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "identity");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;

    v6 = *(void **)(a1 + 40);
    objc_msgSend(v6, "_statusChangeUserInfoForUserIdentity:oldStatus:newStatus:", v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_postLocalChangeNotificationWithUserInfo:", v7);

  }
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __45__ICMusicSubscriptionStatusCache_sharedCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ICMusicSubscriptionStatusCache _init]([ICMusicSubscriptionStatusCache alloc], "_init");
  v1 = (void *)sharedCache_sSharedCache;
  sharedCache_sSharedCache = (uint64_t)v0;

}

@end
