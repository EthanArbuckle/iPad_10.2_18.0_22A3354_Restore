@implementation ICMusicUserTokenCache

- (id)_init
{
  ICMusicUserTokenCache *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *calloutQueue;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  ICMusicUserTokenCache *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICMusicUserTokenCache;
  v2 = -[ICMusicUserTokenCache init](&v12, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicUserTokenCache.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicUserTokenCache.calloutQueue", 0);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__handleMusicUserTokensDidChangeDistributedNotification_, CFSTR("com.apple.iTunesCloud.ICMusicUserTokensDidChangeDistributedNotification"), 0);

    v8 = v2->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30__ICMusicUserTokenCache__init__block_invoke;
    block[3] = &unk_1E43913D8;
    v11 = v2;
    dispatch_barrier_async(v8, block);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.iTunesCloud.ICMusicUserTokensDidChangeDistributedNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)ICMusicUserTokenCache;
  -[ICMusicUserTokenCache dealloc](&v4, sel_dealloc);
}

- (void)getCachedUserTokenForDeveloperToken:(id)a3 requestContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_class();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __87__ICMusicUserTokenCache_getCachedUserTokenForDeveloperToken_requestContext_completion___block_invoke;
  v13[3] = &unk_1E4390CA0;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "_getCacheKeyForDeveloperToken:requestContext:completion:", v10, v9, v13);

}

- (void)setCachedUserToken:(id)a3 forDeveloperToken:(id)a4 requestContext:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = (void *)objc_opt_class();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __88__ICMusicUserTokenCache_setCachedUserToken_forDeveloperToken_requestContext_completion___block_invoke;
  v17[3] = &unk_1E4390C58;
  v18 = v10;
  v19 = v11;
  v17[4] = self;
  v15 = v10;
  v16 = v11;
  objc_msgSend(v14, "_getCacheKeyForDeveloperToken:requestContext:completion:", v13, v12, v17);

}

- (void)_handleMusicUserTokensDidChangeDistributedNotification:(id)a3
{
  NSObject *v4;
  NSObject *accessQueue;
  _QWORD block[5];
  uint8_t buf[4];
  ICMusicUserTokenCache *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v8 = self;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_INFO, "%{public}@: Reloading Music User Token due to external change notification.", buf, 0xCu);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__ICMusicUserTokenCache__handleMusicUserTokensDidChangeDistributedNotification___block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

- (void)_loadPersistedCacheWithCompletion:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *cachedUserTokens;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *v10;
  char v11;
  NSObject *calloutQueue;
  _QWORD block[4];
  id v14;
  char v15;
  _QWORD v16[5];

  v4 = a3;
  dispatch_assert_queue_barrier((dispatch_queue_t)self->_accessQueue);
  v5 = (NSMutableDictionary *)-[NSMutableDictionary copy](self->_cachedUserTokens, "copy");
  cachedUserTokens = self->_cachedUserTokens;
  self->_cachedUserTokens = 0;

  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronize");
  objc_msgSend(v7, "cachedMusicUserTokens");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__ICMusicUserTokenCache__loadPersistedCacheWithCompletion___block_invoke;
  v16[3] = &unk_1E438E6C0;
  v16[4] = self;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v16);
  v10 = self->_cachedUserTokens;
  if (v5 == v10)
  {
    v11 = 0;
    if (!v4)
      goto LABEL_7;
    goto LABEL_6;
  }
  v11 = 1;
  if (v5 && v10)
    v11 = -[NSMutableDictionary isEqualToDictionary:](v5, "isEqualToDictionary:") ^ 1;
  if (v4)
  {
LABEL_6:
    calloutQueue = self->_calloutQueue;
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __59__ICMusicUserTokenCache__loadPersistedCacheWithCompletion___block_invoke_2;
    block[3] = &unk_1E438FBD8;
    v14 = v4;
    v15 = v11;
    dispatch_async(calloutQueue, block);

  }
LABEL_7:

}

- (void)_persistCache
{
  id v3;

  dispatch_assert_queue_barrier((dispatch_queue_t)self->_accessQueue);
  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCachedMusicUserTokens:", self->_cachedUserTokens);
  objc_msgSend(v3, "synchronize");

}

- (void)_postLocalChangeNotification
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_calloutQueue);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("ICMusicUserTokenCacheDidChangeNotification"), self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedUserTokens, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __59__ICMusicUserTokenCache__loadPersistedCacheWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (_NSIsNSString() && _NSIsNSString())
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 24);
      *(_QWORD *)(v8 + 24) = v7;

      v6 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    }
    objc_msgSend(v6, "setObject:forKey:", v5, v10);
  }

}

uint64_t __59__ICMusicUserTokenCache__loadPersistedCacheWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __80__ICMusicUserTokenCache__handleMusicUserTokensDidChangeDistributedNotification___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __80__ICMusicUserTokenCache__handleMusicUserTokensDidChangeDistributedNotification___block_invoke_2;
  v3[3] = &unk_1E438E670;
  v3[4] = v1;
  return objc_msgSend(v1, "_loadPersistedCacheWithCompletion:", v3);
}

void __80__ICMusicUserTokenCache__handleMusicUserTokensDidChangeDistributedNotification___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 1024;
    v9 = a2;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_INFO, "%{public}@: _handleMusicUserTokensDidChangeDistributedNotification: didContentsChange = %{BOOL}d", (uint8_t *)&v6, 0x12u);
  }

  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "_postLocalChangeNotification");
}

void __88__ICMusicUserTokenCache_setCachedUserToken_forDeveloperToken_requestContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(NSObject **)(v8 + 8);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __88__ICMusicUserTokenCache_setCachedUserToken_forDeveloperToken_requestContext_completion___block_invoke_3;
    v12[3] = &unk_1E4390EA8;
    v12[4] = v8;
    v13 = v5;
    v14 = *(id *)(a1 + 40);
    v15 = *(id *)(a1 + 48);
    dispatch_barrier_async(v9, v12);

    v10 = v13;
LABEL_5:

    goto LABEL_6;
  }
  if (*(_QWORD *)(a1 + 48))
  {
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__ICMusicUserTokenCache_setCachedUserToken_forDeveloperToken_requestContext_completion___block_invoke_2;
    block[3] = &unk_1E4390EF8;
    v17 = v6;
    v18 = *(id *)(a1 + 48);
    dispatch_async(v11, block);

    v10 = v17;
    goto LABEL_5;
  }
LABEL_6:

}

void __88__ICMusicUserTokenCache_setCachedUserToken_forDeveloperToken_requestContext_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), -8103, *(_QWORD *)(a1 + 32), CFSTR("User Token caching failed"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __88__ICMusicUserTokenCache_setCachedUserToken_forDeveloperToken_requestContext_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  _QWORD block[4];
  id v20;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 != *(void **)(a1 + 48) && !objc_msgSend(v2, "isEqualToString:"))
  {
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    if (v7)
    {
      if (!v8)
      {
        v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(v10 + 24);
        *(_QWORD *)(v10 + 24) = v9;

        v8 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
        v7 = *(_QWORD *)(a1 + 48);
      }
      objc_msgSend(v8, "setObject:forKey:", v7, *(_QWORD *)(a1 + 40));
    }
    else
    {
      objc_msgSend(v8, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
      if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(void **)(v12 + 24);
        *(_QWORD *)(v12 + 24) = 0;

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_persistCache");
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:", CFSTR("com.apple.iTunesCloud.ICMusicUserTokensDidChangeDistributedNotification"), 0);

    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(NSObject **)(v15 + 16);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __88__ICMusicUserTokenCache_setCachedUserToken_forDeveloperToken_requestContext_completion___block_invoke_5;
    v17[3] = &unk_1E4390EF8;
    v17[4] = v15;
    v18 = *(id *)(a1 + 56);
    dispatch_async(v16, v17);
    v6 = v18;
    goto LABEL_12;
  }
  v4 = *(void **)(a1 + 56);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__ICMusicUserTokenCache_setCachedUserToken_forDeveloperToken_requestContext_completion___block_invoke_4;
    block[3] = &unk_1E4390D18;
    v20 = v4;
    dispatch_async(v5, block);
    v6 = v20;
LABEL_12:

  }
}

uint64_t __88__ICMusicUserTokenCache_setCachedUserToken_forDeveloperToken_requestContext_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88__ICMusicUserTokenCache_setCachedUserToken_forDeveloperToken_requestContext_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_postLocalChangeNotification");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

void __87__ICMusicUserTokenCache_getCachedUserTokenForDeveloperToken_requestContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD block[4];
  id v16;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 8);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __87__ICMusicUserTokenCache_getCachedUserTokenForDeveloperToken_requestContext_completion___block_invoke_3;
    v12[3] = &unk_1E4390E58;
    v12[4] = v7;
    v13 = v5;
    v14 = *(id *)(a1 + 40);
    dispatch_async(v8, v12);

    v9 = v13;
LABEL_5:

    goto LABEL_6;
  }
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__ICMusicUserTokenCache_getCachedUserTokenForDeveloperToken_requestContext_completion___block_invoke_2;
    block[3] = &unk_1E4390D18;
    v16 = v10;
    dispatch_async(v11, block);
    v9 = v16;
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __87__ICMusicUserTokenCache_getCachedUserTokenForDeveloperToken_requestContext_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__ICMusicUserTokenCache_getCachedUserTokenForDeveloperToken_requestContext_completion___block_invoke_3(_QWORD *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)a1[6];
  if (v3)
  {
    v4 = *(NSObject **)(a1[4] + 16);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __87__ICMusicUserTokenCache_getCachedUserTokenForDeveloperToken_requestContext_completion___block_invoke_4;
    v5[3] = &unk_1E4390EF8;
    v7 = v3;
    v6 = v2;
    dispatch_async(v4, v5);

  }
}

uint64_t __87__ICMusicUserTokenCache_getCachedUserTokenForDeveloperToken_requestContext_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __30__ICMusicUserTokenCache__init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadPersistedCacheWithCompletion:", 0);
}

+ (ICMusicUserTokenCache)sharedCache
{
  if (sharedCache_sOnceToken_26465 != -1)
    dispatch_once(&sharedCache_sOnceToken_26465, &__block_literal_global_26466);
  return (ICMusicUserTokenCache *)(id)sharedCache_sSharedCache_26467;
}

+ (id)_decodeDeveloperTokenPart:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  objc_class *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NSObject length](v4, "length") & 3;
  if (v5 == 3)
  {
    v7 = CFSTR("=");
LABEL_7:
    -[NSObject stringByAppendingString:](v4, "stringByAppendingString:", v7);
    v6 = objc_claimAutoreleasedReturnValue();

LABEL_8:
    if (!v6)
      goto LABEL_13;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);
    if (!v8)
    {
      v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v18 = a1;
        v19 = 2112;
        v20 = v6;
        _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to convert base 64 encoded string with developer token encoded part to data: \"%@\".", buf, 0x16u);
      }
      v11 = 0;
      goto LABEL_25;
    }
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v8, 0, &v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v16;
    if (v9)
    {
      if ((_NSIsNSDictionary() & 1) != 0)
      {
        v11 = v9;
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = a1;
        v19 = 2114;
        v20 = v14;
        _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to decode developer token encoded part because resulting object is of unexpected type: %{public}@.", buf, 0x16u);

      }
    }
    else
    {
      v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v18 = a1;
        v19 = 2114;
        v20 = v10;
        _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to deserialize developer token encoded part data with error: %{public}@.", buf, 0x16u);
      }
    }

    v11 = 0;
    goto LABEL_24;
  }
  if (v5 == 2)
  {
    v7 = CFSTR("==");
    goto LABEL_7;
  }
  v6 = v4;
  if (v5 != 1)
    goto LABEL_8;

LABEL_13:
  v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v18 = a1;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to correct developer token encoded part: \"%@\".", buf, 0x16u);
  }
  v6 = 0;
  v11 = 0;
LABEL_26:

  return v11;
}

+ (void)_getCacheKeyForDeveloperToken:(id)a3 requestContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("."));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count") == 3)
  {
    v26 = v8;
    v27 = v10;
    v28 = v9;
    objc_msgSend(v11, "objectAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_decodeDeveloperTokenPart:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("kid"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    if (_NSIsNSString())
      v15 = v14;
    objc_msgSend(v11, "objectAtIndex:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = a1;
    objc_msgSend(a1, "_decodeDeveloperTokenPart:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", CFSTR("iss"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
      v20 = v19;
    else
      v20 = 0;

    if (v15)
    {
      v10 = v27;
      v9 = v28;
      v8 = v26;
      if (v20)
      {
        objc_msgSend(v28, "identity");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "identityStore");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __81__ICMusicUserTokenCache__getCacheKeyForDeveloperToken_requestContext_completion___block_invoke;
        v29[3] = &unk_1E438E698;
        v33 = v17;
        v32 = v27;
        v15 = v15;
        v30 = v15;
        v20 = v20;
        v31 = v20;
        objc_msgSend(v23, "getPropertiesForUserIdentity:completionHandler:", v22, v29);

        goto LABEL_17;
      }
    }
    else
    {
      v10 = v27;
      v9 = v28;
      v8 = v26;
    }
  }
  else
  {
    v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v35 = a1;
      v36 = 2112;
      v37 = v8;
      v38 = 2048;
      v39 = objc_msgSend(v11, "count");
      _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Failed to extract key identifier and team identifier from developer token \"%@\" because it has an unexpected number of parts: %lu.", buf, 0x20u);
    }
    v17 = a1;

    v15 = 0;
    v20 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -8202, CFSTR("Failed to create a key for the Music User Token Cache because the key identifier and/or the team identifier could not be derived from developer token \"%@\"."), v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v22, "msv_description");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v17;
    v36 = 2114;
    v37 = v25;
    _os_log_impl(&dword_1A03E3000, v24, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", buf, 0x16u);

  }
  (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v22);
LABEL_17:

}

void __81__ICMusicUserTokenCache__getCacheKeyForDeveloperToken_requestContext_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void (*v9)(void);
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "DSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lli;%@;%@"),
      objc_msgSend(v6, "longLongValue"),
      a1[4],
      a1[5]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void (**)(void))(a1[6] + 16);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), -7401, v5, CFSTR("Failed to create a key for the Music User Token Cache because there was no DSID in the user identity for the request."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = a1[7];
      objc_msgSend(v8, "msv_description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v11;
      v15 = 2114;
      v16 = v12;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", buf, 0x16u);

    }
    v9 = *(void (**)(void))(a1[6] + 16);
  }
  v9();

}

void __36__ICMusicUserTokenCache_sharedCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ICMusicUserTokenCache _init]([ICMusicUserTokenCache alloc], "_init");
  v1 = (void *)sharedCache_sSharedCache_26467;
  sharedCache_sSharedCache_26467 = (uint64_t)v0;

}

@end
