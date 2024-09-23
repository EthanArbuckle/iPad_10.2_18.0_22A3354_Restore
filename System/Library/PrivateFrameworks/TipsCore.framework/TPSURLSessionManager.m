@implementation TPSURLSessionManager

+ (id)defaultManager
{
  if (defaultManager_predicate_0 != -1)
    dispatch_once(&defaultManager_predicate_0, &__block_literal_global_23);
  return (id)defaultManager_gURLSessionManager;
}

- (id)newURLSessionItemWithRequest:(id)a3 identifier:(id)a4 attributionIdentifier:(id)a5 requestType:(id)a6 networkDelegate:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  TPSURLSessionTask *v24;
  void *v25;
  id WeakRetained;
  unint64_t v27;
  TPSURLSessionItem *v28;
  NSObject *sessionTaskQueue;
  NSObject *v30;
  id v31;
  TPSURLSessionItem *v32;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  TPSURLSessionManager *v44;
  id v45;
  id v46;
  uint64_t *v47;
  _QWORD block[5];
  id v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v40 = a6;
  v17 = a7;
  v41 = a8;
  if (v16 && !-[TPSURLSessionManager allowsNetworkAttribution](self, "allowsNetworkAttribution"))
  {

    v16 = 0;
  }
  v39 = v14;
  -[TPSURLSessionManager _mappedURLRequest:](self, "_mappedURLRequest:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "URL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19 && (v15 || (objc_msgSend(v19, "lastPathComponent"), (v15 = (id)objc_claimAutoreleasedReturnValue()) != 0)))
  {
    v51 = 0;
    v52 = &v51;
    v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__7;
    v55 = __Block_byref_object_dispose__7;
    v56 = 0;
    if (v17)
      goto LABEL_8;
    if (!self->_coalesceRequests)
      goto LABEL_8;
    sessionTaskQueue = self->_sessionTaskQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __132__TPSURLSessionManager_newURLSessionItemWithRequest_identifier_attributionIdentifier_requestType_networkDelegate_completionHandler___block_invoke;
    block[3] = &unk_1E395C0B8;
    v50 = &v51;
    block[4] = self;
    v49 = v20;
    dispatch_sync(sessionTaskQueue, block);

    if (!v52[5])
    {
LABEL_8:
      -[TPSURLSessionManager URLSessionForAttributionIdentifier:](self, "URLSessionForAttributionIdentifier:", v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dataTaskWithRequest:", v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[TPSLogger data](TPSLogger, "data");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v14, "URL");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "configuration");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "_sourceApplicationBundleIdentifier");
        v35 = objc_claimAutoreleasedReturnValue();
        v37 = v34;
        *(_DWORD *)buf = 138412802;
        v58 = v38;
        v59 = 2112;
        v60 = v16;
        v61 = 2112;
        v62 = v35;
        v36 = (void *)v35;
        _os_log_debug_impl(&dword_19A906000, v23, OS_LOG_TYPE_DEBUG, "Network request - %@. Attribution - Requested: %@, Effective: %@", buf, 0x20u);

      }
      objc_msgSend(v22, "setTaskDescription:", v16);
      v24 = -[TPSURLSessionTask initWithSessionTask:identifier:]([TPSURLSessionTask alloc], "initWithSessionTask:identifier:", v22, v15);
      v25 = (void *)v52[5];
      v52[5] = (uint64_t)v24;

      objc_msgSend((id)v52[5], "setUnderlyingSession:", v21);
      objc_msgSend((id)v52[5], "setRequestType:", v40);
      WeakRetained = v17;
      if (!v17)
        WeakRetained = objc_loadWeakRetained((id *)&self->_defaultSessionDelegate);
      objc_msgSend((id)v52[5], "setNetworkDelegate:", WeakRetained);
      if (v17)
      {
        v27 = (unint64_t)+[TPSURLSessionTask delegateRespondsWithDelegate:](TPSURLSessionTask, "delegateRespondsWithDelegate:", v17);
      }
      else
      {

        v27 = *(unsigned int *)&self->_defaultSessionDelegateResponds.willCacheResponse | ((unint64_t)self->_defaultSessionDelegateResponds.taskDidReceiveChallenge << 32);
      }
      objc_msgSend((id)v52[5], "setDelegateResponds:", v27 & 0xFFFFFFFFFFLL);
      v30 = self->_sessionTaskQueue;
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __132__TPSURLSessionManager_newURLSessionItemWithRequest_identifier_attributionIdentifier_requestType_networkDelegate_completionHandler___block_invoke_24;
      v42[3] = &unk_1E395D630;
      v43 = v17;
      v44 = self;
      v46 = v22;
      v47 = &v51;
      v45 = v20;
      v31 = v22;
      dispatch_sync(v30, v42);

    }
    v32 = [TPSURLSessionItem alloc];
    v28 = -[TPSURLSessionItem initWithSessionTask:completionHandler:](v32, "initWithSessionTask:completionHandler:", v52[5], v41);
    _Block_object_dispose(&v51, 8);

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)newURLSessionItemWithRequest:(id)a3 identifier:(id)a4 attributionIdentifier:(id)a5 requestType:(id)a6 completionHandler:(id)a7
{
  return -[TPSURLSessionManager newURLSessionItemWithRequest:identifier:attributionIdentifier:requestType:networkDelegate:completionHandler:](self, "newURLSessionItemWithRequest:identifier:attributionIdentifier:requestType:networkDelegate:completionHandler:", a3, a4, a5, a6, 0, a7);
}

- (id)URLSessionForAttributionIdentifier:(id)a3
{
  id v4;
  NSObject *sessionMapQueue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  TPSURLSessionManager *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  if (v4 && !-[TPSURLSessionManager allowsNetworkAttribution](self, "allowsNetworkAttribution"))
  {

    v4 = 0;
  }
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__7;
  v17 = __Block_byref_object_dispose__7;
  v18 = 0;
  sessionMapQueue = self->_sessionMapQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__TPSURLSessionManager_URLSessionForAttributionIdentifier___block_invoke;
  block[3] = &unk_1E395D608;
  v11 = self;
  v12 = &v13;
  v10 = v4;
  v6 = v4;
  dispatch_sync(sessionMapQueue, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __28__TPSURLSessionManager_init__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[16];
  Class (*v18)(uint64_t);
  void *v19;
  uint64_t *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C9AA70];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "setCoalesceTaskURLMap:", v3);

  v4 = (void *)objc_msgSend(v2, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "setUncoalesceTaskMap:", v4);

  v5 = (void *)objc_msgSend(v2, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "setURLSessionMap:", v5);

  if (+[TPSCommonDefines isInternalDevice](TPSCommonDefines, "isInternalDevice"))
  {
    if (!PingPongClientLibraryCore_frameworkLibrary_0)
    {
      *(_OWORD *)buf = xmmword_1E395D6F0;
      v18 = 0;
      PingPongClientLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    }
    if (PingPongClientLibraryCore_frameworkLibrary_0)
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2050000000;
      v6 = (void *)getPPCRedirectClass_softClass;
      v16 = getPPCRedirectClass_softClass;
      if (!getPPCRedirectClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        v18 = __getPPCRedirectClass_block_invoke;
        v19 = &unk_1E395D3B0;
        v20 = &v13;
        __getPPCRedirectClass_block_invoke((uint64_t)buf);
        v6 = (void *)v14[3];
      }
      v7 = objc_retainAutorelease(v6);
      _Block_object_dispose(&v13, 8);
      v8 = objc_alloc_init(v7);
      objc_msgSend(*(id *)(a1 + 32), "setUrlRedirector:", v8, v13);

      objc_msgSend(*(id *)(a1 + 32), "urlRedirector");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v8) = v9 == 0;
      +[TPSLogger data](TPSLogger, "data");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if ((v8 & 1) != 0)
      {
        if (v11)
        {
          *(_WORD *)buf = 0;
          v12 = "PPCRedirect not found.";
          goto LABEL_12;
        }
      }
      else if (v11)
      {
        *(_WORD *)buf = 0;
        v12 = "PPCRedirect initialized.";
LABEL_12:
        _os_log_impl(&dword_19A906000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
      }

    }
  }
}

- (void)setUrlRedirector:(id)a3
{
  objc_storeStrong((id *)&self->_urlRedirector, a3);
}

- (void)setUncoalesceTaskMap:(id)a3
{
  objc_storeStrong((id *)&self->_uncoalesceTaskMap, a3);
}

- (void)setURLSessionMap:(id)a3
{
  objc_storeStrong((id *)&self->_URLSessionMap, a3);
}

- (void)setCoalesceTaskURLMap:(id)a3
{
  objc_storeStrong((id *)&self->_coalesceTaskURLMap, a3);
}

- (id)_mappedURLRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[TPSURLSessionManager urlRedirector](self, "urlRedirector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSURLSessionManager urlRedirector](self, "urlRedirector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mappedURL:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || (objc_msgSend(v8, "isEqual:", v6) & 1) != 0)
  {

LABEL_5:
    v9 = v4;
    goto LABEL_6;
  }
  v9 = (id)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v9, "setURL:", v8);
  +[TPSLogger data](TPSLogger, "data");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[TPSURLSessionManager _mappedURLRequest:].cold.1(v9, v11);

  v12 = (void *)MEMORY[0x1E0C99E08];
  -[TPSURLSessionManager authenticationHandler](self, "authenticationHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "customHeaderFields");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryWithDictionary:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v9, "allHTTPHeaderFields");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addEntriesFromDictionary:", v16);

    objc_msgSend(v9, "setAllHTTPHeaderFields:", v15);
  }

LABEL_6:
  return v9;
}

- (PPCRedirect)urlRedirector
{
  return self->_urlRedirector;
}

- (void)setAuthenticationHandler:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationHandler, a3);
}

- (void)resumeSessionItem:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "state") == 1)
    objc_msgSend(v3, "resume");

}

- (void)cancelSessionItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "cancel");
    objc_msgSend(v4, "sessionTask");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v8;
    if (v8)
    {
      v6 = objc_msgSend(v8, "isCancelled");
      v5 = v8;
      if (v6)
      {
        objc_msgSend(v8, "task");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[TPSURLSessionManager removeTaskFromMap:](self, "removeTaskFromMap:", v7);

        v5 = v8;
      }
    }

  }
}

- (NSMutableDictionary)uncoalesceTaskMap
{
  return self->_uncoalesceTaskMap;
}

- (BOOL)coalesceRequests
{
  return self->_coalesceRequests;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_delegate, obj);
    self->_respondsToDidReceiveChallenge = objc_opt_respondsToSelector() & 1;

  }
}

- (void)setDefaultSessionDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  uint64_t v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_defaultSessionDelegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_defaultSessionDelegate, obj);
    v6 = (uint64_t)+[TPSURLSessionTask delegateRespondsWithDelegate:](TPSURLSessionTask, "delegateRespondsWithDelegate:", obj);
    *(_DWORD *)&self->_defaultSessionDelegateResponds.willCacheResponse = v6;
    self->_defaultSessionDelegateResponds.taskDidReceiveChallenge = BYTE4(v6);

  }
}

void __38__TPSURLSessionManager_defaultManager__block_invoke()
{
  TPSURLSessionManager *v0;
  void *v1;

  v0 = objc_alloc_init(TPSURLSessionManager);
  v1 = (void *)defaultManager_gURLSessionManager;
  defaultManager_gURLSessionManager = (uint64_t)v0;

}

- (TPSURLSessionManager)init
{
  TPSURLSessionManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *sessionTaskQueue;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *sessionMapQueue;
  NSObject *v9;
  _QWORD block[4];
  TPSURLSessionManager *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TPSURLSessionManager;
  v2 = -[TPSURLSessionManager init](&v13, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.IPURLSessionTaskSerialQueue", v3);
    sessionTaskQueue = v2->_sessionTaskQueue;
    v2->_sessionTaskQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.IPURLSessionMapSerialQueue", v6);
    sessionMapQueue = v2->_sessionMapQueue;
    v2->_sessionMapQueue = (OS_dispatch_queue *)v7;

    v9 = v2->_sessionTaskQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __28__TPSURLSessionManager_init__block_invoke;
    block[3] = &unk_1E395B100;
    v12 = v2;
    dispatch_sync(v9, block);

  }
  return v2;
}

void __59__TPSURLSessionManager_URLSessionForAttributionIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v2 = *(void **)(a1 + 32);
  if (!v2
    || (+[TPSCommonDefines clientBundleIdentifier](TPSCommonDefines, "clientBundleIdentifier"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v2, "isEqualToString:", v3),
        v3,
        v4))
  {
    objc_msgSend(*(id *)(a1 + 40), "defaultURLSession");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;
LABEL_4:

    return;
  }
  objc_msgSend(*(id *)(a1 + 40), "URLSessionMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "defaultURLSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "configuration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "set_sourceApplicationBundleIdentifier:", *(_QWORD *)(a1 + 32));
    v13 = (void *)MEMORY[0x1E0CB39F0];
    v14 = *(void **)(a1 + 40);
    objc_msgSend(v14, "defaultURLSession");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "delegateQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sessionWithConfiguration:delegate:delegateQueue:", v22, v14, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 40), "URLSessionMap");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, *(_QWORD *)(a1 + 32));

    v7 = v22;
    goto LABEL_4;
  }
}

- (NSURLSession)defaultURLSession
{
  NSURLSession *defaultURLSession;
  id WeakRetained;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  char v12;
  id v13;
  id v14;
  id v15;
  char v16;
  id v17;
  NSURLSession *v18;
  NSURLSession *v19;

  defaultURLSession = self->_defaultURLSession;
  if (!defaultURLSession)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v6, "URLSessionManagerSessionConfiguration:", self);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB3990];
      v9 = objc_msgSend((id)objc_opt_class(), "defaultURLCacheMemoryCapcity");
      objc_msgSend(v8, "tps_urlCacheWithIdentifier:memoryCapacity:diskCapacity:", 0, v9, objc_msgSend((id)objc_opt_class(), "defaultURLCacheDiskCapcity"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3990], "setSharedURLCache:", v6);
      objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setURLCache:", v6);
    }

    if (-[TPSURLSessionManager allowsNetworkAttribution](self, "allowsNetworkAttribution"))
    {
      +[TPSCommonDefines clientBundleIdentifier](TPSCommonDefines, "clientBundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "set_sourceApplicationBundleIdentifier:", v10);

    }
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      v13 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v13, "URLSessionManagerSessionOperationQueue:", self);
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = objc_alloc_init(MEMORY[0x1E0CB3828]);
      objc_msgSend(v14, "setMaxConcurrentOperationCount:", 4);
    }
    v15 = objc_loadWeakRetained((id *)&self->_delegate);
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      v17 = objc_loadWeakRetained((id *)&self->_delegate);
      self->_coalesceRequests = objc_msgSend(v17, "URLSessionManagerShouldCoalesceRequest:", self);

    }
    objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", v7, self, v14);
    v18 = (NSURLSession *)objc_claimAutoreleasedReturnValue();
    v19 = self->_defaultURLSession;
    self->_defaultURLSession = v18;

    defaultURLSession = self->_defaultURLSession;
  }
  return defaultURLSession;
}

+ (unint64_t)defaultURLCacheMemoryCapcity
{
  return 0;
}

+ (unint64_t)defaultURLCacheDiskCapcity
{
  return 78643200;
}

- (void)dealloc
{
  NSObject *sessionTaskQueue;
  objc_super v4;
  _QWORD block[5];

  -[NSURLSession invalidateAndCancel](self->_defaultURLSession, "invalidateAndCancel");
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_URLSessionMap, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_2);
  sessionTaskQueue = self->_sessionTaskQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__TPSURLSessionManager_dealloc__block_invoke_2;
  block[3] = &unk_1E395B100;
  block[4] = self;
  dispatch_sync(sessionTaskQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)TPSURLSessionManager;
  -[TPSURLSessionManager dealloc](&v4, sel_dealloc);
}

uint64_t __31__TPSURLSessionManager_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidateAndCancel");
}

void __31__TPSURLSessionManager_dealloc__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "coalesceTaskURLMap");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

- (BOOL)allowsNetworkAttribution
{
  return +[TPSCommonDefines callerIsTipsdWithSource:](TPSCommonDefines, "callerIsTipsdWithSource:", CFSTR("Networking"));
}

void __132__TPSURLSessionManager_newURLSessionItemWithRequest_identifier_attributionIdentifier_requestType_networkDelegate_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "coalesceTaskURLMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isCancelled"))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
}

void __132__TPSURLSessionManager_newURLSessionItemWithRequest_identifier_attributionIdentifier_requestType_networkDelegate_completionHandler___block_invoke_24(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  if (*(_QWORD *)(a1 + 32) || !objc_msgSend(*(id *)(a1 + 40), "coalesceRequests"))
  {
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 40), "uncoalesceTaskMap");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 56);
  }
  else
  {
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 40), "coalesceTaskURLMap");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 48);
  }
  v5 = v3;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

}

- (void)sessionTask:(id)a3 didCompleteWithError:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __57__TPSURLSessionManager_sessionTask_didCompleteWithError___block_invoke;
    v13 = &unk_1E395B150;
    v8 = v6;
    v14 = v8;
    v15 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], &v10);
    objc_msgSend(v8, "task", v10, v11, v12, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSURLSessionManager removeTaskFromMap:](self, "removeTaskFromMap:", v9);

  }
}

uint64_t __57__TPSURLSessionManager_sessionTask_didCompleteWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didCompleteWithError:", *(_QWORD *)(a1 + 40));
}

- (void)removeTaskFromMap:(id)a3
{
  id v4;
  NSObject *sessionTaskQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  sessionTaskQueue = self->_sessionTaskQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__TPSURLSessionManager_removeTaskFromMap___block_invoke;
  v7[3] = &unk_1E395B150;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(sessionTaskQueue, v7);

}

void __42__TPSURLSessionManager_removeTaskFromMap___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "coalesceRequests");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "coalesceTaskURLMap");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "originalRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v5);

  }
  else
  {
    objc_msgSend(v3, "uncoalesceTaskMap");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }

}

- (id)sessionTaskForTask:(id)a3
{
  id v4;
  NSObject *sessionTaskQueue;
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
  v15 = __Block_byref_object_copy__7;
  v16 = __Block_byref_object_dispose__7;
  v17 = 0;
  sessionTaskQueue = self->_sessionTaskQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__TPSURLSessionManager_sessionTaskForTask___block_invoke;
  block[3] = &unk_1E395C950;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(sessionTaskQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __43__TPSURLSessionManager_sessionTaskForTask___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  if (objc_msgSend(*(id *)(a1 + 32), "coalesceRequests"))
  {
    objc_msgSend(*(id *)(a1 + 40), "originalRequest");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "URL");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "coalesceTaskURLMap");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v9);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "uncoalesceTaskMap");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v3 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
  }

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(_QWORD);
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  TPSURLSessionManager *v26;
  id v27;
  void (**v28)(_QWORD);
  id v29;
  _QWORD aBlock[4];
  id v31;
  id v32;
  TPSURLSessionManager *v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[TPSURLSessionManager sessionTaskForTask:](self, "sessionTaskForTask:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__TPSURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
    aBlock[3] = &unk_1E395D680;
    v14 = v12;
    v31 = v14;
    v15 = v10;
    v32 = v15;
    v33 = self;
    v16 = v11;
    v34 = v16;
    v17 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[TPSURLSessionManager authenticationHandler](self, "authenticationHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)objc_opt_class(), "canAuthenticateWithURLResponse:", v15))
    {
      v23 = v16;
      v19 = objc_msgSend(v14, "retryCount");

      if (!v19)
      {
        +[TPSLogger data](TPSLogger, "data");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v15, "URL");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v36 = v21;
          _os_log_impl(&dword_19A906000, v20, OS_LOG_TYPE_INFO, "Authentication required for URL: %@", buf, 0xCu);

        }
        objc_msgSend(v14, "setRetryCount:", objc_msgSend(v14, "retryCount") + 1);
        -[TPSURLSessionManager authenticationHandler](self, "authenticationHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __81__TPSURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_28;
        v24[3] = &unk_1E395D6D0;
        v28 = v17;
        v25 = v9;
        v29 = v23;
        v26 = self;
        v27 = v14;
        objc_msgSend(v22, "authenticateForURLResponse:completion:", v15, v24);

        goto LABEL_10;
      }
    }
    else
    {

    }
    v17[2](v17);
LABEL_10:

    goto LABEL_11;
  }
  (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
LABEL_11:

}

void __81__TPSURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;

  if ((objc_msgSend(*(id *)(a1 + 32), "delegateResponds") & 0x10000) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "networkDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __81__TPSURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2;
    v6[3] = &unk_1E395D658;
    v6[4] = *(_QWORD *)(a1 + 48);
    v7 = v4;
    v8 = *(id *)(a1 + 56);
    objc_msgSend(v3, "sessionTask:didReceiveResponse:completionHandler:", v7, v5, v6);

  }
  else
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    objc_msgSend(*(id *)(a1 + 32), "setDataTaskData:", v2);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

uint64_t __81__TPSURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  id v4;

  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionTask:didCompleteWithError:", *(_QWORD *)(a1 + 40), 0);
  }
  else if (a2 == 1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    objc_msgSend(*(id *)(a1 + 40), "setDataTaskData:", v4);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __81__TPSURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_28(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  if (v8)
  {
    +[TPSLogger data](TPSLogger, "data");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __81__TPSURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_28_cold_1((uint64_t)v8, v9, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "state") != 3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "originalRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v12, "setAllHTTPHeaderFields:", v7);
    objc_msgSend(*(id *)(a1 + 32), "taskDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "URLSessionForAttributionIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dataTaskWithRequest:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTaskDescription:", v13);
    objc_msgSend(*(id *)(a1 + 48), "setTask:", v15);
    +[TPSLogger data](TPSLogger, "data");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v12, "URL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "configuration");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_sourceApplicationBundleIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = v21;
      v30 = 2112;
      v31 = v13;
      v32 = 2112;
      v33 = v22;
      _os_log_debug_impl(&dword_19A906000, v16, OS_LOG_TYPE_DEBUG, "Network request - %@. Attribution - Requested: %@, Effective: %@", buf, 0x20u);

    }
    v18 = *(void **)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 40);
    v19 = *(NSObject **)(v17 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__TPSURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_29;
    block[3] = &unk_1E395D6A8;
    block[4] = v17;
    v25 = v18;
    v26 = v15;
    v27 = *(id *)(a1 + 48);
    v20 = v15;
    dispatch_sync(v19, block);
    objc_msgSend(v20, "resume");

  }
}

void __81__TPSURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_29(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "uncoalesceTaskMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "uncoalesceTaskMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 32), "uncoalesceTaskMap");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a5;
  -[TPSURLSessionManager sessionTaskForTask:](self, "sessionTaskForTask:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataTaskData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "appendData:", v10);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeDownloadTask:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *sessionTaskQueue;
  id v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;

  v7 = a4;
  v8 = a5;
  -[TPSURLSessionManager sessionTaskForTask:](self, "sessionTaskForTask:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTask:", v8);
  objc_msgSend(v9, "setDataTaskData:", 0);
  sessionTaskQueue = self->_sessionTaskQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__TPSURLSessionManager_URLSession_dataTask_didBecomeDownloadTask___block_invoke;
  block[3] = &unk_1E395D6A8;
  block[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v7;
  v11 = v7;
  v12 = v9;
  v13 = v8;
  dispatch_sync(sessionTaskQueue, block);
  objc_msgSend(v13, "resume");

}

void __66__TPSURLSessionManager_URLSession_dataTask_didBecomeDownloadTask___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "coalesceRequests") & 1) == 0)
  {
    v2 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "uncoalesceTaskMap");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "uncoalesceTaskMap");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 56));

  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6
{
  void (**v9)(id, id);
  void *v10;
  void *v11;
  id v12;

  v12 = a5;
  v9 = (void (**)(id, id))a6;
  -[TPSURLSessionManager sessionTaskForTask:](self, "sessionTaskForTask:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "delegateResponds") & 1) != 0)
  {
    objc_msgSend(v10, "networkDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sessionTask:willCacheResponse:completionHandler:", v10, v12, v9);

  }
  else
  {
    v9[2](v9, v12);
  }

}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  int64_t v8;
  id v9;

  if (a7 >= 1 || a6 <= 0)
    v8 = a7;
  else
    v8 = a6;
  if (v8 >= 1)
  {
    -[TPSURLSessionManager sessionTaskForTask:](self, "sessionTaskForTask:", a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDownloadTaskTotalBytes:", v8);

  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a5;
  -[TPSURLSessionManager sessionTaskForTask:](self, "sessionTaskForTask:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "downloadTaskTotalBytes");
  if (v13 && v8)
  {
    if ((objc_msgSend(v7, "delegateResponds") & 0x100) != 0)
    {
      objc_msgSend(v7, "networkDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sessionTask:didFinishDownloadingToURL:", v7, v13);

    }
    else
    {
      v9 = (void *)MEMORY[0x1E0C99D50];
      objc_msgSend(v13, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dataWithContentsOfFile:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFormattedData:", v11);

    }
  }
  else
  {
    objc_msgSend(v7, "setDownloadTaskTotalBytes:", 0);
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v7 = a5;
  objc_msgSend(v7, "transactionMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[TPSURLSessionManager sessionTaskForTask:](self, "sessionTaskForTask:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "requestType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[TPSAnalyticsEventServiceRequest serviceRequestEventWithType:metrics:](TPSAnalyticsEventServiceRequest, "serviceRequestEventWithType:metrics:", v12, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "log");

    }
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  v7 = a5;
  -[TPSURLSessionManager sessionTaskForTask:](self, "sessionTaskForTask:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "response");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v16, "response");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setResponse:", v11);
    objc_msgSend(v11, "allHeaderFields");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Last-Modified"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLastModified:", v13);

  }
  if ((objc_msgSend(v8, "delegateResponds") & 0x1000000) != 0)
  {
    objc_msgSend(v8, "networkDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sessionTask:didCompleteWithError:", v8, v7);

  }
  if (v8)
  {
    if (v7)
    {
      -[TPSURLSessionManager sessionTask:didCompleteWithError:](self, "sessionTask:didCompleteWithError:", v8, v7);
    }
    else
    {
      objc_msgSend(v8, "dataError");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPSURLSessionManager sessionTask:didCompleteWithError:](self, "sessionTask:didCompleteWithError:", v8, v15);

    }
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  void (**v9)(id, uint64_t, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;

  v15 = a5;
  v9 = (void (**)(id, uint64_t, _QWORD))a6;
  -[TPSURLSessionManager sessionTaskForTask:](self, "sessionTaskForTask:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "delegateResponds") & 0x100000000) != 0
    && (objc_msgSend(v15, "protectionSpace"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "host"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "hasSuffix:", CFSTR(".apple.com")),
        v12,
        v11,
        v13))
  {
    objc_msgSend(v10, "networkDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sessionTask:didReceiveChallenge:completionHandler:", v10, v15, v9);

  }
  else
  {
    v9[2](v9, 3, 0);
  }

}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  void *v10;
  void *v11;
  int v12;
  id WeakRetained;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  if (self->_respondsToDidReceiveChallenge
    && (objc_msgSend(v8, "protectionSpace"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "host"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "hasSuffix:", CFSTR(".apple.com")),
        v11,
        v10,
        v12))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "URLSessionManagerDidReceiveChallenge:completionHandler:", v8, v9);

  }
  else
  {
    v9[2](v9, 3, 0);
  }

}

- (TPSURLSessionManagerDelegate)delegate
{
  return (TPSURLSessionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (TPSURLSessionDelegate)defaultSessionDelegate
{
  return (TPSURLSessionDelegate *)objc_loadWeakRetained((id *)&self->_defaultSessionDelegate);
}

- (TPSURLSessionCustomAuthHandling)authenticationHandler
{
  return self->_authenticationHandler;
}

- (BOOL)respondsToDidReceiveChallenge
{
  return self->_respondsToDidReceiveChallenge;
}

- (void)setRespondsToDidReceiveChallenge:(BOOL)a3
{
  self->_respondsToDidReceiveChallenge = a3;
}

- (void)setCoalesceRequests:(BOOL)a3
{
  self->_coalesceRequests = a3;
}

- (NSMutableDictionary)coalesceTaskURLMap
{
  return self->_coalesceTaskURLMap;
}

- (NSMutableDictionary)URLSessionMap
{
  return self->_URLSessionMap;
}

- (void)setDefaultURLSession:(id)a3
{
  objc_storeStrong((id *)&self->_defaultURLSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlRedirector, 0);
  objc_storeStrong((id *)&self->_defaultURLSession, 0);
  objc_storeStrong((id *)&self->_URLSessionMap, 0);
  objc_storeStrong((id *)&self->_uncoalesceTaskMap, 0);
  objc_storeStrong((id *)&self->_coalesceTaskURLMap, 0);
  objc_storeStrong((id *)&self->_authenticationHandler, 0);
  objc_destroyWeak((id *)&self->_defaultSessionDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionMapQueue, 0);
  objc_storeStrong((id *)&self->_sessionTaskQueue, 0);
}

- (void)_mappedURLRequest:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_3_0(&dword_19A906000, a2, v4, "Mapped URL Request: %@", (uint8_t *)&v5);

}

void __81__TPSURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_28_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_3_0(&dword_19A906000, a2, a3, "Failed to authenticate: %@", (uint8_t *)&v3);
}

@end
