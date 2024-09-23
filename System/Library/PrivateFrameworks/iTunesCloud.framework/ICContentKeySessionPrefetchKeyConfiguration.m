@implementation ICContentKeySessionPrefetchKeyConfiguration

- (ICContentKeySessionPrefetchKeyConfiguration)initWithRequestContext:(id)a3
{
  id v4;
  ICContentKeySessionPrefetchKeyConfiguration *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  dispatch_group_t v8;
  OS_dispatch_group *group;
  void *v10;
  void *v11;
  uint64_t v12;
  NSSet *keyIdentifiers;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICContentKeySessionPrefetchKeyConfiguration;
  v5 = -[ICContentKeySessionPrefetchKeyConfiguration init](&v15, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.iTunesCloud.ICContentKeySession.prefetchKeyConfig", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    v8 = dispatch_group_create();
    group = v5->_group;
    v5->_group = (OS_dispatch_group *)v8;

    v5->_timeout = dispatch_time(0, 10000000000);
    +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "prefetchKeyIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (_NSIsNSArray() && objc_msgSend(v11, "count"))
    {
      v5->_initWithDefaultKeyIdentifiers = 1;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      keyIdentifiers = v5->_keyIdentifiers;
      v5->_keyIdentifiers = (NSSet *)v12;

    }
    -[ICContentKeySessionPrefetchKeyConfiguration _fetchWithRequestContext:](v5, "_fetchWithRequestContext:", v4);

  }
  return v5;
}

- (NSSet)keyIdentifiers
{
  NSObject *queue;
  id v4;
  NSObject *v6;
  _QWORD v7[6];
  __int128 buf;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_initWithDefaultKeyIdentifiers)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__27550;
    v11 = __Block_byref_object_dispose__27551;
    v12 = 0;
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__ICContentKeySessionPrefetchKeyConfiguration_keyIdentifiers__block_invoke;
    v7[3] = &unk_1E4391568;
    v7[4] = self;
    v7[5] = &buf;
    dispatch_sync(queue, v7);
    v4 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    _Block_object_dispose(&buf, 8);

    return (NSSet *)v4;
  }
  else if (dispatch_group_wait((dispatch_group_t)self->_group, self->_timeout))
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Timed out waiting for the enhanced audio configuration (prefetchKeyIdentifiers) to load.", (uint8_t *)&buf, 0xCu);
    }

    return (NSSet *)0;
  }
  else
  {
    return self->_keyIdentifiers;
  }
}

- (NSURL)keyServerURL
{
  NSObject *v3;
  int v5;
  ICContentKeySessionPrefetchKeyConfiguration *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!dispatch_group_wait((dispatch_group_t)self->_group, self->_timeout))
    return self->_keyServerURL;
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Timed out waiting for the enhanced audio configuration (prefetchKeyServerURL) to load.", (uint8_t *)&v5, 0xCu);
  }

  return (NSURL *)0;
}

- (NSURL)keyCertificateURL
{
  NSObject *v3;
  int v5;
  ICContentKeySessionPrefetchKeyConfiguration *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!dispatch_group_wait((dispatch_group_t)self->_group, self->_timeout))
    return self->_keyCertificateURL;
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Timed out waiting for the enhanced audio configuration (prefetchKeyCertificateURL) to load.", (uint8_t *)&v5, 0xCu);
  }

  return (NSURL *)0;
}

- (void)_fetchWithRequestContext:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  ICContentKeySessionPrefetchKeyConfiguration *v9;

  v4 = a3;
  dispatch_group_enter((dispatch_group_t)self->_group);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__ICContentKeySessionPrefetchKeyConfiguration__fetchWithRequestContext___block_invoke;
  v7[3] = &unk_1E4391110;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_keyCertificateURL, 0);
  objc_storeStrong((id *)&self->_keyServerURL, 0);
  objc_storeStrong((id *)&self->_keyIdentifiers, 0);
}

void __72__ICContentKeySessionPrefetchKeyConfiguration__fetchWithRequestContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__ICContentKeySessionPrefetchKeyConfiguration__fetchWithRequestContext___block_invoke_2;
  v4[3] = &unk_1E4391658;
  v3 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "getBagForRequestContext:withCompletionHandler:", v3, v4);

}

void __72__ICContentKeySessionPrefetchKeyConfiguration__fetchWithRequestContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "enhancedAudioConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v11 = v7;
    v12 = v5;
    msv_dispatch_sync_on_queue();

  }
  else
  {
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Failed to load enhanced audio configuration from the bag. err=%{public}@", buf, 0x16u);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));

}

void __72__ICContentKeySessionPrefetchKeyConfiguration__fetchWithRequestContext___block_invoke_11(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "prefetchSKDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "isEqualToSet:", v3) & 1) == 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 16), v3);
      v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 40);
        v6 = *(_QWORD *)(v5 + 16);
        v14 = 138543618;
        v15 = v5;
        v16 = 2114;
        v17 = v6;
        _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Updated prefetch identifiers %{public}@", (uint8_t *)&v14, 0x16u);
      }

      +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPrefetchKeyIdentifiers:", v2);

    }
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(v8 + 16);
    if (!v9)
      goto LABEL_9;
    *(_QWORD *)(v8 + 16) = 0;

    +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPrefetchKeyIdentifiers:", 0);
  }

LABEL_9:
  objc_msgSend(*(id *)(a1 + 32), "keyServerURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(*(id *)(a1 + 48), "urlForBagKey:", CFSTR("fps-request"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 24), v11);
  if (!v10)

  objc_msgSend(*(id *)(a1 + 32), "certificateURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(*(id *)(a1 + 48), "urlForBagKey:", CFSTR("fps-cert"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 32), v13);
  if (!v12)

}

void __61__ICContentKeySessionPrefetchKeyConfiguration_keyIdentifiers__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

@end
