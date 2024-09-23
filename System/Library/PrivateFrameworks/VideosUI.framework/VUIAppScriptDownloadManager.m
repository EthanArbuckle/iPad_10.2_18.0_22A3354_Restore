@implementation VUIAppScriptDownloadManager

void __45__VUIAppScriptDownloadManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VUIAppScriptDownloadManager _init]([VUIAppScriptDownloadManager alloc], "_init");
  v1 = (void *)sharedInstance___sharedInstance_3;
  sharedInstance___sharedInstance_3 = (uint64_t)v0;

}

- (id)_init
{
  VUIAppScriptDownloadManager *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSURLSession *session;
  id v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *completionBlocksDict;
  objc_super v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)VUIAppScriptDownloadManager;
  v2 = -[VUIAppScriptDownloadManager init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3990]), "initWithMemoryCapacity:diskCapacity:diskPath:", 0x100000, 52428800, 0);
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = objc_msgSend(v4, "memoryCapacity");
      v7 = objc_msgSend(v4, "diskCapacity");
      *(_DWORD *)buf = 134218240;
      v16 = v6;
      v17 = 2048;
      v18 = v7;
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_INFO, "Applicaiton script download manager uses custom URL cache: mem capacity %lu disk capacity %lu", buf, 0x16u);
    }

    objc_msgSend(v3, "setURLCache:", v4);
    objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:", v3);
    v8 = objc_claimAutoreleasedReturnValue();
    session = v2->_session;
    v2->_session = (NSURLSession *)v8;

    -[VUIAppScriptDownloadManager setCurrentURL:](v2, "setCurrentURL:", 0);
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[VUIAppScriptDownloadManager setAppScriptDict:](v2, "setAppScriptDict:", v10);

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    completionBlocksDict = v2->_completionBlocksDict;
    v2->_completionBlocksDict = v11;

  }
  return v2;
}

void __80__VUIAppScriptDownloadManager_fetchAppJavascript_cachePolicy_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (v5 && !v6)
  {
    objc_msgSend(v5, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    VUIDefaultLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "url");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "absoluteString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v11;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_INFO, "Successfully downloaded script from: %@.", buf, 0xCu);

    }
    v12 = *(_QWORD *)(a1 + 48);
    if (!v12)
    {
      if (v8)
      {
        v13 = *(id *)(a1 + 32);
        objc_sync_enter(v13);
        objc_msgSend(WeakRetained, "appScriptDict");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v8, *(_QWORD *)(a1 + 40));

        objc_sync_exit(v13);
      }
      goto LABEL_12;
    }
LABEL_11:
    (*(void (**)(uint64_t, void *, id, uint64_t))(v12 + 16))(v12, v8, v6, 200);
    goto LABEL_12;
  }
  VUIDefaultLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "url");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "absoluteString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = v17;
    v31 = 2112;
    v32 = v18;
    _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_INFO, "Failed to download application script from: %@. -- %@", buf, 0x16u);

  }
  v8 = 0;
  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
    goto LABEL_11;
LABEL_12:
  os_unfair_lock_lock((os_unfair_lock_t)&__completionBlocksLock);
  objc_msgSend(WeakRetained[2], "objectForKey:", *(_QWORD *)(a1 + 40));
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v25;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v19);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v22) + 16))(*(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v22));
        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v20);
  }

  objc_msgSend(v19, "removeAllObjects", (_QWORD)v24);
  os_unfair_lock_unlock((os_unfair_lock_t)&__completionBlocksLock);
  v23 = *(id *)(a1 + 32);
  objc_sync_enter(v23);
  objc_msgSend(WeakRetained, "setCurrentURL:", 0);
  objc_sync_exit(v23);

}

- (void)setCurrentURL:(id)a3
{
  objc_storeStrong((id *)&self->_currentURL, a3);
}

- (void)setAppScriptDict:(id)a3
{
  objc_storeStrong((id *)&self->_appScriptDict, a3);
}

- (NSMutableDictionary)appScriptDict
{
  return self->_appScriptDict;
}

- (void)fetchAppJavascript:(id)a3 cachePolicy:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!v9)
  {
    VUIDefaultLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "absoluteString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v11;
      _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_INFO, "Prefetch application script from: %@.", buf, 0xCu);

    }
  }
  v12 = kVUIBagTVAppJetpackURL;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIJetPackController controllerWithBagKey:defaults:urlOverrideDefaultKey:withCachePolicy:](_TtC8VideosUI20VUIJetPackController, "controllerWithBagKey:defaults:urlOverrideDefaultKey:withCachePolicy:", v12, v13, CFSTR("boot-url"), a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, self);
  objc_msgSend(v14, "getJetPackSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __80__VUIAppScriptDownloadManager_fetchAppJavascript_cachePolicy_completionHandler___block_invoke;
  v18[3] = &unk_1E9FA01A0;
  objc_copyWeak(&v21, (id *)buf);
  v16 = v9;
  v20 = v16;
  v18[4] = self;
  v17 = v8;
  v19 = v17;
  objc_msgSend(v15, "addFinishBlock:", v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);

}

+ (id)sharedInstance
{
  if (sharedInstance___once != -1)
    dispatch_once(&sharedInstance___once, &__block_literal_global_98);
  return (id)sharedInstance___sharedInstance_3;
}

- (NSURL)currentURL
{
  return self->_currentURL;
}

- (NSURLSessionDataTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_appScriptDict, 0);
  objc_storeStrong((id *)&self->_currentURL, 0);
  objc_storeStrong((id *)&self->_completionBlocksDict, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
