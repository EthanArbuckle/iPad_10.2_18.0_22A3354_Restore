@implementation VUIARQLPreviewManager

- (void)cancelExistingDownloadsIfAny
{
  -[NSURLSession getAllTasksWithCompletionHandler:](self->_session, "getAllTasksWithCompletionHandler:", &__block_literal_global_12_0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_14 != -1)
    dispatch_once(&sharedInstance_onceToken_14, &__block_literal_global_66);
  return (id)sharedInstance_instance_1;
}

void __39__VUIARQLPreviewManager_sharedInstance__block_invoke()
{
  VUIARQLPreviewManager *v0;
  void *v1;

  v0 = objc_alloc_init(VUIARQLPreviewManager);
  v1 = (void *)sharedInstance_instance_1;
  sharedInstance_instance_1 = (uint64_t)v0;

}

- (VUIARQLPreviewManager)init
{
  VUIARQLPreviewManager *v2;
  VUIARQLPreviewManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIARQLPreviewManager;
  v2 = -[VUIARQLPreviewManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_resourceTimeout = 300.0;
    -[VUIARQLPreviewManager configureDownloadSession](v2, "configureDownloadSession");
  }
  return v3;
}

- (void)configureDownloadSession
{
  void *v3;
  NSObject *v4;
  double resourceTimeout;
  void *v6;
  NSURLSession *v7;
  NSURLSession *session;
  int v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB39F8], "backgroundSessionConfigurationWithIdentifier:", CFSTR("com.apple.tv.arql"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    resourceTimeout = self->_resourceTimeout;
    v9 = 134217984;
    v10 = resourceTimeout;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIARQLPreviewManager - configureDownloadSession with resourceTimeout: %lf", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(v3, "setTimeoutIntervalForResource:", self->_resourceTimeout);
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", v3, self, v6);
  v7 = (NSURLSession *)objc_claimAutoreleasedReturnValue();
  session = self->_session;
  self->_session = v7;

}

void __53__VUIARQLPreviewManager_cancelExistingDownloadsIfAny__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "cancel");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)configureUsingDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  NSObject *v8;
  double resourceTimeout;
  int v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "vui_numberForKey:", CFSTR("resourceTimeoutInterval"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "doubleValue");
      if (v7 > 0.0 && self->_resourceTimeout != v7)
      {
        self->_resourceTimeout = v7;
        VUIDefaultLogObject();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          resourceTimeout = self->_resourceTimeout;
          v10 = 134217984;
          v11 = resourceTimeout;
          _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIARQLPreviewManager - resourceTimeout set by js config: %lf", (uint8_t *)&v10, 0xCu);
        }

        -[NSURLSession invalidateAndCancel](self->_session, "invalidateAndCancel");
      }
    }

  }
}

- (void)setActiveAssetRequest:(id)a3
{
  VUIARQLPreviewManager *v5;
  VUIARAssetRequest *v6;

  v6 = (VUIARAssetRequest *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_activeAssetRequest != v6)
    objc_storeStrong((id *)&v5->_activeAssetRequest, a3);
  objc_sync_exit(v5);

}

- (VUIARAssetRequest)activeAssetRequest
{
  VUIARQLPreviewManager *v2;
  VUIARAssetRequest *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activeAssetRequest;
  objc_sync_exit(v2);

  return v3;
}

- (void)previewControllerDidDismiss:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[VUIARQLPreviewManager activeAssetRequest](self, "activeAssetRequest", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "isDownloading"))
    {
      VUIDefaultLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "fileName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412290;
        v9 = v7;
        _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIARQLPreviewManager - Cancel the active download: %@", (uint8_t *)&v8, 0xCu);

      }
      objc_msgSend(v5, "cancelDownload");
    }
    -[VUIARQLPreviewManager setActiveAssetRequest:](self, "setActiveAssetRequest:", 0);
  }

}

- (void)previewWithURL:(id)a3 shareURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastPathComponent");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[VUIARQLPreviewManager _presentPreviewControllerWithURL:shareURL:fileName:](self, "_presentPreviewControllerWithURL:shareURL:fileName:", v7, v6, v9);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[2];
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  -[VUIARQLPreviewManager activeAssetRequest](self, "activeAssetRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  VUIDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "remoteURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v11;
    v24 = 2112;
    v25 = v8;
    _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "VUIARQLPreviewManager - NSURLSessionDownloadDelegate: didFinishDownloadingToURL: remote URL: %@, location: %@", buf, 0x16u);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v17 = __75__VUIARQLPreviewManager_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke;
  v18 = &unk_1E9F99840;
  v19 = v7;
  v20 = v9;
  v21 = v8;
  v12 = (void *)MEMORY[0x1E0CB3978];
  v13 = v8;
  v14 = v9;
  v15 = v7;
  if (objc_msgSend(v12, "isMainThread"))
    v17((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __75__VUIARQLPreviewManager_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "response");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v2 = v6;
    if (objc_msgSend(v2, "statusCode") >= 200 && objc_msgSend(v2, "statusCode") <= 399)
    {
      objc_msgSend(*(id *)(a1 + 40), "cacheDownloadedFileFromLocation:", *(_QWORD *)(a1 + 48));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  else
  {
    v2 = 0;
  }
  v3 = 0;
LABEL_8:
  objc_msgSend(*(id *)(a1 + 40), "completionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "completionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v5)[2](v5, v3, 0);

  }
  objc_msgSend(*(id *)(a1 + 40), "setIsDownloading:", 0);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;

  v6 = a5;
  -[VUIARQLPreviewManager activeAssetRequest](self, "activeAssetRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[VUIARQLPreviewManager URLSession:task:didCompleteWithError:].cold.1(v7, (uint64_t)v6, v8);

  v12 = MEMORY[0x1E0C809B0];
  v13 = __62__VUIARQLPreviewManager_URLSession_task_didCompleteWithError___block_invoke;
  v14 = &unk_1E9F98FD8;
  v15 = v6;
  v16 = v7;
  v9 = (void *)MEMORY[0x1E0CB3978];
  v10 = v7;
  v11 = v6;
  if (objc_msgSend(v9, "isMainThread", v12, 3221225472))
    v13((uint64_t)&v12);
  else
    dispatch_async(MEMORY[0x1E0C80D38], &v12);

}

uint64_t __62__VUIARQLPreviewManager_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "recordLog:");
    objc_msgSend(*(id *)(a1 + 40), "completionHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 40), "completionHandler");
      v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "remoteURL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v3)[2](v3, v4, *(_QWORD *)(a1 + 32));

    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "setIsDownloading:", 0);
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3
{
  NSObject *v5;
  void *v6;
  _QWORD block[2];
  void (*v8)(uint64_t);
  void *v9;
  VUIARQLPreviewManager *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIARQLPreviewManager - Received %@", buf, 0xCu);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v8 = __74__VUIARQLPreviewManager_URLSessionDidFinishEventsForBackgroundURLSession___block_invoke;
  v9 = &unk_1E9F98DF0;
  v10 = self;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v8((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __74__VUIARQLPreviewManager_URLSessionDidFinishEventsForBackgroundURLSession___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("VUIARQLDownloadSessionDidFinishEventsForBackgroundURLSessionNotification"), *(_QWORD *)(a1 + 32));

}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIARQLPreviewManager - didBecomeInvalidWithError %@", (uint8_t *)&v7, 0xCu);
  }

  -[VUIARQLPreviewManager configureDownloadSession](self, "configureDownloadSession");
}

- (id)_quickLookPreviewItemWithFileURL:(id)a3 shareURL:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0C895E8];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithFileAtURL:", v7);

  objc_msgSend(v8, "setCanonicalWebPageURL:", v6);
  objc_msgSend(v8, "setForceIgnoreMuteSwitch:", 1);
  return v8;
}

- (void)_presentPreviewControllerWithURL:(id)a3 shareURL:(id)a4 fileName:(id)a5
{
  id v8;
  id v9;
  id v10;
  VUIARAssetRequest *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  VUIARQLPreviewController *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = -[VUIARAssetRequest initWithRemoteURL:shareURL:fileName:]([VUIARAssetRequest alloc], "initWithRemoteURL:shareURL:fileName:", v10, v8, v9);

  -[VUIARAssetRequest cachePath](v11, "cachePath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    VUIDefaultLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v13;
      _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "VUIARQLPreviewManager - Cached AR file found: %@", (uint8_t *)&v19, 0xCu);
    }

    -[VUIARQLPreviewManager _quickLookPreviewItemWithFileURL:shareURL:](self, "_quickLookPreviewItemWithFileURL:shareURL:", v13, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[VUIARQLPreviewController initWithQuickLookPreviewItem:]([VUIARQLPreviewController alloc], "initWithQuickLookPreviewItem:", v15);

  }
  else
  {
    -[VUIARQLPreviewManager _previewControllerWithAssetRequest:](self, "_previewControllerWithAssetRequest:", v11);
    v16 = (VUIARQLPreviewController *)objc_claimAutoreleasedReturnValue();
  }
  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "controllerPresenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "presentViewController:animated:completion:", v16, 1, 0);
}

- (id)_previewControllerWithAssetRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  __CFString *v7;
  __CFString *PreferredIdentifierForTag;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  VUIARQLPreviewController *v14;
  VUIARQLPreviewController *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  id v23;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  objc_msgSend(v4, "remoteURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathExtension");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E0CA5A88], v7, 0);
  objc_msgSend(v4, "shareURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIARQLPreviewManager _quickLookPreviewItemWithFileURL:shareURL:](self, "_quickLookPreviewItemWithFileURL:shareURL:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFE360]), "initWithPreviewItemProvider:contentType:previewTitle:fileSize:previewItem:", v5, PreferredIdentifierForTag, &stru_1E9FF3598, &unk_1EA0B9670, v10);
  objc_msgSend(v11, "setUseLoadingTimeout:", 0);
  objc_initWeak(&location, self);
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __60__VUIARQLPreviewManager__previewControllerWithAssetRequest___block_invoke;
  v20 = &unk_1E9F9E110;
  objc_copyWeak(&v23, &location);
  v12 = v6;
  v21 = v12;
  v13 = v4;
  v22 = v13;
  objc_msgSend(v5, "registerItemForTypeIdentifier:loadHandler:", PreferredIdentifierForTag, &v17);
  v14 = [VUIARQLPreviewController alloc];
  v15 = -[VUIARQLPreviewController initWithQuickLookWebKitItem:](v14, "initWithQuickLookWebKitItem:", v11, v17, v18, v19, v20);
  -[QLPreviewController setDelegate:](v15, "setDelegate:", self);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v15;
}

void __60__VUIARQLPreviewManager__previewControllerWithAssetRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD aBlock[4];
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v3)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__VUIARQLPreviewManager__previewControllerWithAssetRequest___block_invoke_2;
    aBlock[3] = &unk_1E9F9E0E8;
    v11 = *(id *)(a1 + 32);
    v12 = WeakRetained;
    v13 = v3;
    v5 = _Block_copy(aBlock);
    v6 = *(void **)(a1 + 40);
    objc_msgSend(WeakRetained, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDownloadWithSession:completionHandler:", v7, v5);

    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIARQLPreviewManager - Start downloading url: %@", buf, 0xCu);
    }

    objc_msgSend(WeakRetained, "setActiveAssetRequest:", *(_QWORD *)(a1 + 40));
  }

}

void __60__VUIARQLPreviewManager__previewControllerWithAssetRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if (!v3)
    v3 = *(id *)(a1 + 32);
  v4 = v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "setActiveAssetRequest:", 0);

}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (double)resourceTimeout
{
  return self->_resourceTimeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_activeAssetRequest, 0);
}

- (void)URLSession:(void *)a1 task:(uint64_t)a2 didCompleteWithError:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "remoteURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1D96EE000, a3, OS_LOG_TYPE_ERROR, "VUIARQLPreviewManager - NSURLSessionDownloadDelegate: didCompleteWithError: remote URL: %@, error: %@", (uint8_t *)&v6, 0x16u);

}

@end
