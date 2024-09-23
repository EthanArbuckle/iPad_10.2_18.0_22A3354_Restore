@implementation MTURLSessionManager

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  MTURLSessionManager *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _MTLogCategoryNetwork();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v23 = self;
    v24 = 2112;
    v25 = v9;
    v26 = 2112;
    v27 = v8;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_1DA478000, v11, OS_LOG_TYPE_DEFAULT, "[BackgroundSession] %@ didCompleteWithError called for task %@ with session %@. Error: %@", buf, 0x2Au);
  }

  objc_msgSend(MEMORY[0x1E0D7F1C8], "sharedLogger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "shouldOverrideCondition:file:", CFSTR("MAXDEBUG"), CFSTR("/Library/Caches/com.apple.xbs/Sources/PodcastsUI/PodcastsUI/PodcastsUI/Networking/MTURLSessionManager.m"));

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D7F1C8], "sharedLogger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logFunction:format:", "-[MTURLSessionManager URLSession:task:didCompleteWithError:]", CFSTR("Session Did Complete: %@"), v8);

  }
  objc_msgSend(MEMORY[0x1E0D7F1C8], "sharedLogger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v10)
  {
    debuggingInfoForTask(v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/PodcastsUI/PodcastsUI/PodcastsUI/Networking/MTURLSessionManager.m", 487, CFSTR("ERROR: %@ (%@)"), v17, v18);

    -[MTURLSessionManager _invokeURLSessionBackgroundEventsCompletionHandler](self, "_invokeURLSessionBackgroundEventsCompletionHandler");
    -[MTURLSessionManager task:didFailWithError:orStatusCode:](self, "task:didFailWithError:orStatusCode:", v9, v10, -1);
  }
  else
  {
    v19 = objc_msgSend(v15, "shouldOverrideCondition:file:", CFSTR("MAXDEBUG"), CFSTR("/Library/Caches/com.apple.xbs/Sources/PodcastsUI/PodcastsUI/PodcastsUI/Networking/MTURLSessionManager.m"));

    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0D7F1C8], "sharedLogger");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      debuggingInfoForTask(v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "logFunction:format:", "-[MTURLSessionManager URLSession:task:didCompleteWithError:]", CFSTR("SUCCESS: %@"), v21);

    }
  }

}

void __116__MTURLSessionManager_startDownloadTaskForURL_userInitiated_useBackgroundFetch_usePrivatePath_downloadStartedBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "loadSessionsIfNeeded");
  v2 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 72))
    objc_msgSend(v2, "sessionForBackgroundDownloads");
  else
    objc_msgSend(v2, "sessionForForegroundDownloads");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNonAppInitiated:", objc_msgSend(*(id *)(a1 + 48), "nonAppInitiated"));
  objc_msgSend(v3, "downloadTaskWithRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(v5, "set_pathToDownloadTaskFile:");
    _MTLogCategoryDownload();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v6, "_pathToDownloadTaskFile");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v8;
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_1DA478000, v7, OS_LOG_TYPE_DEFAULT, "Download task created for URL %@. Response to be stored at %@.", buf, 0x16u);

    }
  }
  objc_msgSend(v6, "setInteractive:", *(unsigned __int8 *)(a1 + 73));
  objc_msgSend(v6, "setUseBackgroundFetch:", *(unsigned __int8 *)(a1 + 72));
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ task for: %@"), v12, *(_QWORD *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTaskDescription:", v13);

  if (*(_BYTE *)(a1 + 73))
  {
    LODWORD(v14) = 1.0;
    objc_msgSend(v6, "setPriority:", v14);
  }
  objc_msgSend(MEMORY[0x1E0D7F1C8], "sharedLogger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "shouldOverrideCondition:file:", CFSTR("MAXDEBUG"), CFSTR("/Library/Caches/com.apple.xbs/Sources/PodcastsUI/PodcastsUI/PodcastsUI/Networking/MTURLSessionManager.m"));

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0D7F1C8], "sharedLogger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "logFunction:format:", "-[MTURLSessionManager startDownloadTaskForURL:userInitiated:useBackgroundFetch:usePrivatePath:downloadStartedBlock:]_block_invoke", CFSTR("Start: %@, Session: %@, backgroundFetch: %d"), *(_QWORD *)(a1 + 40), v3, *(unsigned __int8 *)(a1 + 72));

  }
  objc_msgSend(v6, "resume");
  v18 = *(_QWORD *)(a1 + 64);
  if (v18)
    (*(void (**)(uint64_t, uint64_t))(v18 + 16))(v18, 1);

}

- (void)loadSessionsIfNeeded
{
  void *v3;
  MTURLSessionManager *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MTURLSessionManager *obj;

  -[MTURLSessionManager sessionForBackgroundDownloads](self, "sessionForBackgroundDownloads");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = self;
    objc_sync_enter(v4);
    -[MTURLSessionManager sessionForBackgroundDownloads](v4, "sessionForBackgroundDownloads");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (void *)MEMORY[0x1E0CB39F8];
      -[MTURLSessionManager backgroundSessionConfigurationIdentifier](v4, "backgroundSessionConfigurationIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "backgroundSessionConfigurationWithIdentifier:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "set_allowsConstrainedNetworkAccess:", 0);
      -[MTURLSessionManager sessionForConfiguration:](v4, "sessionForConfiguration:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTURLSessionManager setSessionForBackgroundDownloads:](v4, "setSessionForBackgroundDownloads:", v9);

    }
    objc_sync_exit(v4);

  }
  -[MTURLSessionManager sessionForForegroundDownloads](self, "sessionForForegroundDownloads");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    obj = self;
    objc_sync_enter(obj);
    -[MTURLSessionManager sessionForForegroundDownloads](obj, "sessionForForegroundDownloads");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTURLSessionManager sessionForConfiguration:](obj, "sessionForConfiguration:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTURLSessionManager setSessionForForegroundDownloads:](obj, "setSessionForForegroundDownloads:", v13);

    }
    objc_sync_exit(obj);

  }
}

- (NSURLSession)sessionForBackgroundDownloads
{
  return self->_sessionForBackgroundDownloads;
}

- (NSURLSession)sessionForForegroundDownloads
{
  return self->_sessionForForegroundDownloads;
}

- (void)_invokeURLSessionBackgroundEventsCompletionHandler
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint8_t buf[4];
  MTURLSessionManager *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _MTLogCategoryNetwork();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[MTURLSessionManager sessionCompletionHandler](self, "sessionCompletionHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = _Block_copy(v4);
    *(_DWORD *)buf = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1DA478000, v3, OS_LOG_TYPE_DEFAULT, "[BackgroundSession] %@ _invokeURLSessionBackgroundEventsCompletionHandler called with completionHandler: %@.", buf, 0x16u);

  }
  -[MTURLSessionManager sessionCompletionHandler](self, "sessionCompletionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MTURLSessionManager sessionCompletionHandler](self, "sessionCompletionHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__MTURLSessionManager__invokeURLSessionBackgroundEventsCompletionHandler__block_invoke;
    block[3] = &unk_1EA0C5070;
    v10 = v7;
    v8 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    -[MTURLSessionManager setSessionCompletionHandler:](self, "setSessionCompletionHandler:", 0);

  }
}

- (id)sessionCompletionHandler
{
  MTURLSessionManager *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = _Block_copy(v2->_sessionCompletionHandler);
  objc_sync_exit(v2);

  return v3;
}

+ (id)originalURLForTask:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "originalRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sessionForConfiguration:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "setAllowsCellularAccess:", 1);
  objc_msgSend(v4, "setDiscretionary:", 0);
  objc_msgSend(v4, "setSessionSendsLaunchEvents:", 1);
  objc_msgSend(v4, "setHTTPShouldUsePipelining:", 1);
  objc_msgSend(v4, "setRequestCachePolicy:", 1);
  objc_msgSend(v4, "setHTTPShouldSetCookies:", 0);
  objc_msgSend(v4, "setHTTPCookieAcceptPolicy:", 1);
  -[MTURLSessionManager configureSession:](self, "configureSession:", v4);
  v5 = (void *)objc_opt_new();
  if (isMulticore())
    v6 = 4;
  else
    v6 = 2;
  objc_msgSend(v5, "setMaxConcurrentOperationCount:", v6);
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ - %@"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v11);

  objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", v4, self, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (MTURLSessionManager)init
{
  MTURLSessionManager *v2;
  MTURLSessionManager *v3;
  objc_class *v4;
  id v5;
  const char *v6;
  dispatch_queue_t v7;
  MTURLSessionManager *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTURLSessionManager;
  v2 = -[MTURLSessionManager init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MTURLSessionManager _assertSubclassRequirements](v2, "_assertSubclassRequirements");
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (const char *)objc_msgSend(v5, "UTF8String");
    v7 = dispatch_queue_create(v6, MEMORY[0x1E0C80D50]);
    -[MTURLSessionManager setStartQueue:](v3, "setStartQueue:", v7);

    v8 = v3;
  }

  return v3;
}

- (void)setStartQueue:(id)a3
{
  objc_storeStrong((id *)&self->_startQueue, a3);
}

- (void)_assertSubclassRequirements
{
  _BOOL4 v3;
  _BOOL4 v4;
  BOOL v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  id v10;

  v3 = -[MTURLSessionManager _subclassImplementsDataDidDownload](self, "_subclassImplementsDataDidDownload");
  v4 = -[MTURLSessionManager _subclassImplementsURLDidDownload](self, "_subclassImplementsURLDidDownload");
  v5 = -[MTURLSessionManager _subclassImplementsDidFailWithError](self, "_subclassImplementsDidFailWithError");
  v6 = -[MTURLSessionManager _subclassImplementsConfigureSession](self, "_subclassImplementsConfigureSession");
  if (v3 && v4)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99750];
    v9 = CFSTR("Subclasses may not implement both -task:didCompleteWithData: and -task:didCompleteWithDownloadedContentUrl:");
    goto LABEL_11;
  }
  if (!v3 && !v4)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99750];
    v9 = CFSTR("Subclasses must implement one of -task:didCompleteWithData: or -task:didCompleteWithDownloadedContentUrl:");
    goto LABEL_11;
  }
  if (!v5)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99750];
    v9 = CFSTR("Subclasses must implement task:didFailWithError:orStatusCode:");
    goto LABEL_11;
  }
  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99750];
    v9 = CFSTR("Subclasses must implement configureSession:");
LABEL_11:
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
}

- (BOOL)_subclassImplementsInstanceMethod:(SEL)a3
{
  uint64_t v5;

  v5 = +[MTURLSessionManager instanceMethodForSelector:](MTURLSessionManager, "instanceMethodForSelector:");
  return -[MTURLSessionManager methodForSelector:](self, "methodForSelector:", a3) != v5;
}

- (BOOL)_subclassImplementsURLDidDownload
{
  return -[MTURLSessionManager _subclassImplementsInstanceMethod:](self, "_subclassImplementsInstanceMethod:", sel_task_didCompleteWithDownloadedContentUrl_);
}

- (BOOL)_subclassImplementsDidFailWithError
{
  return -[MTURLSessionManager _subclassImplementsInstanceMethod:](self, "_subclassImplementsInstanceMethod:", sel_task_didFailWithError_orStatusCode_);
}

- (BOOL)_subclassImplementsDataDidDownload
{
  return -[MTURLSessionManager _subclassImplementsInstanceMethod:](self, "_subclassImplementsInstanceMethod:", sel_task_didCompleteWithData_);
}

- (BOOL)_subclassImplementsConfigureSession
{
  return -[MTURLSessionManager _subclassImplementsInstanceMethod:](self, "_subclassImplementsInstanceMethod:", sel_configureSession_);
}

- (void)setSessionForForegroundDownloads:(id)a3
{
  objc_storeStrong((id *)&self->_sessionForForegroundDownloads, a3);
}

- (void)setSessionForBackgroundDownloads:(id)a3
{
  objc_storeStrong((id *)&self->_sessionForBackgroundDownloads, a3);
}

- (void)startDownloadTaskForURL:(id)a3 userInitiated:(BOOL)a4 useBackgroundFetch:(BOOL)a5 usePrivatePath:(id)a6 downloadStartedBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;
  BOOL v24;
  uint8_t buf[16];

  v12 = a3;
  v13 = a6;
  v14 = a7;
  objc_msgSend(v12, "url");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[MTURLSessionManager startQueue](self, "startQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __116__MTURLSessionManager_startDownloadTaskForURL_userInitiated_useBackgroundFetch_usePrivatePath_downloadStartedBlock___block_invoke;
    v18[3] = &unk_1EA0C6408;
    v18[4] = self;
    v23 = a5;
    v19 = v15;
    v20 = v12;
    v21 = v13;
    v24 = a4;
    v22 = v14;
    dispatch_async(v16, v18);

  }
  else
  {
    _MTLogCategoryDownload();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA478000, v17, OS_LOG_TYPE_ERROR, "Download task failed to start. Found nil URL", buf, 2u);
    }

    if (v14)
      (*((void (**)(id, _QWORD))v14 + 2))(v14, 0);
  }

}

- (OS_dispatch_queue)startQueue
{
  return self->_startQueue;
}

- (id)backgroundSessionConfigurationIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)setSessionCompletionHandler:(id)a3
{
  id v4;
  MTURLSessionManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id sessionCompletionHandler;
  int v10;
  MTURLSessionManager *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  _MTLogCategoryNetwork();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = _Block_copy(v4);
    v10 = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1DA478000, v6, OS_LOG_TYPE_DEFAULT, "[BackgroundSession] %@ setting sessionCompletionHandler to %@.", (uint8_t *)&v10, 0x16u);

  }
  v8 = _Block_copy(v4);
  sessionCompletionHandler = v5->_sessionCompletionHandler;
  v5->_sessionCompletionHandler = v8;

  objc_sync_exit(v5);
  -[MTURLSessionManager loadSessionsIfNeeded](v5, "loadSessionsIfNeeded");

}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  _QWORD block[4];
  id v39;
  MTURLSessionManager *v40;
  id v41;
  id v42;
  _BYTE *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  _BYTE buf[24];
  id v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  _MTLogCategoryNetwork();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    v53 = v9;
    v54 = 2112;
    v55 = v11;
    _os_log_impl(&dword_1DA478000, v13, OS_LOG_TYPE_DEFAULT, "[BackgroundSession] %@ didReceiveChallenge called for task %@ with session %@. Challenge: %@", buf, 0x2Au);
  }

  objc_msgSend(v11, "proposedCredential");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "protectionSpace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB39B0], "sharedCredentialStorage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "credentialsForProtectionSpace:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "count") == 1)
    {
      objc_msgSend(v17, "allValues");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x1E0CB39A8];
      objc_msgSend(v19, "user");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "password");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "credentialWithUser:password:persistence:", v21, v22, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v53) = 0;
  LOBYTE(v53) = objc_msgSend(v11, "previousFailureCount") > 2;
  objc_msgSend(v11, "failureResponse");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23 && objc_msgSend(v11, "previousFailureCount") >= 1)
  {

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0D7F1C8], "sharedLogger");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "shouldOverrideCondition:file:", CFSTR("MAXDEBUG"), CFSTR("/Library/Caches/com.apple.xbs/Sources/PodcastsUI/PodcastsUI/PodcastsUI/Networking/MTURLSessionManager.m"));

      if (v25)
      {
        objc_msgSend(MEMORY[0x1E0D7F1C8], "sharedLogger");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "logFunction:format:", "-[MTURLSessionManager URLSession:task:didReceiveChallenge:completionHandler:]", CFSTR("Failing auth due to max failure count: %ld"), objc_msgSend(v11, "previousFailureCount"));

      }
      objc_msgSend(v10, "setUserCanceledAuth:", 1);
    }
    v14 = 0;
  }
  else
  {

  }
  if ((objc_msgSend(MEMORY[0x1E0D7F278], "supportsGUI") & 1) != 0)
  {
    v27 = objc_msgSend(v10, "isInteractive");
    v28 = *(_QWORD *)&buf[8];
    if (v27 && !*(_BYTE *)(*(_QWORD *)&buf[8] + 24) && !v14)
    {
      objc_msgSend(v10, "originalRequest");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "URL");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D7F218], "sharedInstance");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "importContext");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = 0;
      v49 = &v48;
      v50 = 0x2020000000;
      v51 = 0;
      v33 = MEMORY[0x1E0C809B0];
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __77__MTURLSessionManager_URLSession_task_didReceiveChallenge_completionHandler___block_invoke;
      v44[3] = &unk_1EA0C52C8;
      v34 = v32;
      v45 = v34;
      v35 = v30;
      v46 = v35;
      v47 = &v48;
      objc_msgSend(v34, "performBlockAndWait:", v44);
      if (!*((_BYTE *)v49 + 24))
      {
        block[0] = v33;
        block[1] = 3221225472;
        block[2] = __77__MTURLSessionManager_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_2;
        block[3] = &unk_1EA0C6458;
        v39 = v10;
        v40 = self;
        v41 = v11;
        v42 = v12;
        v43 = buf;
        dispatch_async(MEMORY[0x1E0C80D38], block);

        _Block_object_dispose(&v48, 8);
        goto LABEL_30;
      }

      _Block_object_dispose(&v48, 8);
      if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
        goto LABEL_28;
LABEL_25:
      v36 = 3;
LABEL_29:
      (*((void (**)(id, uint64_t, _QWORD))v12 + 2))(v12, v36, 0);
      goto LABEL_30;
    }
  }
  else
  {
    v28 = *(_QWORD *)&buf[8];
  }
  if (*(_BYTE *)(v28 + 24))
    goto LABEL_25;
  if (!v14)
  {
LABEL_28:
    v36 = 1;
    goto LABEL_29;
  }
  (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v14);
LABEL_30:
  _Block_object_dispose(buf, 8);

}

void __77__MTURLSessionManager_URLSession_task_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "podcastForFeedUrl:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "isAuthenticatedDark");
    v4 = v5;
  }

}

void __77__MTURLSessionManager_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "originalRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__MTURLSessionManager_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_3;
  v11[3] = &unk_1EA0C6430;
  v6 = *(void **)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __77__MTURLSessionManager_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_4;
  v7[3] = &unk_1EA0C6350;
  v10 = *(_QWORD *)(a1 + 64);
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v6, "_showCredentialsActionControllerForHost:signIn:cancel:", v4, v11, v7);

}

void __77__MTURLSessionManager_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB39B0];
  v6 = a2;
  objc_msgSend(v3, "sharedCredentialStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "protectionSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCredential:forProtectionSpace:", v6, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __77__MTURLSessionManager_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_4(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  objc_msgSend(*(id *)(a1 + 32), "setUserCanceledAuth:", 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_showCredentialsActionControllerForHost:(id)a3 signIn:(id)a4 cancel:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;

  v7 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = (void *)MEMORY[0x1E0CB34D0];
  v11 = a3;
  objc_msgSend(v10, "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("AUTHENTICATION_MESSAGE"), &stru_1EA0D7620, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v13, v11);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("AUTHENTICATION_TITLE"), &stru_1EA0D7620, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "alertControllerWithTitle:message:preferredStyle:", v16, v32, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("AUTHENTICATION_SIGNIN"), &stru_1EA0D7620, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __77__MTURLSessionManager__showCredentialsActionControllerForHost_signIn_cancel___block_invoke;
  v35[3] = &unk_1EA0C6480;
  v36 = v17;
  v37 = v7;
  v22 = v7;
  v23 = v17;
  objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 0, v35);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addAction:", v24);

  v25 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1EA0D7620, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v21;
  v33[1] = 3221225472;
  v33[2] = __77__MTURLSessionManager__showCredentialsActionControllerForHost_signIn_cancel___block_invoke_2;
  v33[3] = &unk_1EA0C64A8;
  v34 = v8;
  v28 = v8;
  objc_msgSend(v25, "actionWithTitle:style:handler:", v27, 1, v33);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addAction:", v29);

  objc_msgSend(v23, "addTextFieldWithConfigurationHandler:", &__block_literal_global_17);
  objc_msgSend(v23, "addTextFieldWithConfigurationHandler:", &__block_literal_global_54);
  objc_msgSend(MEMORY[0x1E0DC3F20], "mt_rootViewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "mt_topViewController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "presentViewController:animated:completion:", v23, 1, 0);
}

void __77__MTURLSessionManager__showCredentialsActionControllerForHost_signIn_cancel___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "textFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "textFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB39A8];
  objc_msgSend(v10, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "credentialWithUser:password:persistence:", v6, v7, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v8);

}

uint64_t __77__MTURLSessionManager__showCredentialsActionControllerForHost_signIn_cancel___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __77__MTURLSessionManager__showCredentialsActionControllerForHost_signIn_cancel___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB34D0];
  v3 = a2;
  objc_msgSend(v2, "mainBundle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Username"), &stru_1EA0D7620, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPlaceholder:", v4);

}

void __77__MTURLSessionManager__showCredentialsActionControllerForHost_signIn_cancel___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "setSecureTextEntry:", 1);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Password"), &stru_1EA0D7620, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPlaceholder:", v3);

}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void (**v16)(_QWORD);
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[4];
  uint64_t (*v28)(uint64_t, uint64_t);
  id v29;
  void (**v30)(_QWORD);
  _BYTE *v31;
  _QWORD aBlock[4];
  id v33;
  _BYTE *v34;
  BOOL v35;
  _BYTE buf[24];
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (uint64_t (*)(uint64_t, uint64_t))a4;
  v10 = a5;
  _MTLogCategoryNetwork();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    v37 = v9;
    _os_log_impl(&dword_1DA478000, v11, OS_LOG_TYPE_DEFAULT, "[BackgroundSession] %@ didReceiveChallenge called for session %@. Challenge: %@", buf, 0x20u);
  }

  objc_msgSend(v9, "protectionSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v37 = __Block_byref_object_copy__7;
  v38 = __Block_byref_object_dispose__7;
  objc_msgSend(v9, "proposedCredential");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "previousFailureCount");
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__MTURLSessionManager_URLSession_didReceiveChallenge_completionHandler___block_invoke;
  aBlock[3] = &unk_1EA0C6530;
  v35 = v13 > 2;
  v15 = v10;
  v33 = v15;
  v34 = buf;
  v16 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(v12, "authenticationMethod");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB32C8]);

  if (!v18)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0D0D588], "defaultTrustManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v12, "serverTrust");
  objc_msgSend(v12, "host");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v19, "actionForTrust:forHost:andService:", v20, v21, *MEMORY[0x1E0D0D590]);

  if (v22 == 1)
  {
    v23 = (void *)MEMORY[0x1E0CB39A8];
    objc_msgSend(v9, "protectionSpace");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "credentialForTrust:", objc_msgSend(v24, "serverTrust"));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v25;

    goto LABEL_8;
  }
  if (v22 != 2)
  {
LABEL_8:
    v16[2](v16);
    goto LABEL_9;
  }
  v27[0] = v14;
  v27[1] = 3221225472;
  v27[2] = __72__MTURLSessionManager_URLSession_didReceiveChallenge_completionHandler___block_invoke_2;
  v27[3] = &unk_1EA0C6558;
  v28 = v9;
  v29 = v12;
  v31 = buf;
  v30 = v16;
  objc_msgSend(v8, "getAllTasksWithCompletionHandler:", v27);

LABEL_9:
  _Block_object_dispose(buf, 8);

}

uint64_t __72__MTURLSessionManager_URLSession_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__MTURLSessionManager_URLSession_didReceiveChallenge_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  v5 = v3;
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v23;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v7)
        objc_enumerationMutation(v3);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v8), "isInteractive", (_QWORD)v22) & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v6)
          goto LABEL_3;
        v5 = v3;
        goto LABEL_14;
      }
    }

    v5 = objc_alloc_init(MEMORY[0x1E0D0D580]);
    objc_msgSend(*(id *)(a1 + 32), "protectionSpace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTrust:", objc_msgSend(v9, "serverTrust"));

    objc_msgSend(*(id *)(a1 + 32), "protectionSpace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "host");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHost:", v11);

    v12 = *MEMORY[0x1E0D0D590];
    objc_msgSend(v5, "setService:", *MEMORY[0x1E0D0D590]);
    v13 = objc_msgSend(v5, "showAndWaitForResponse");
    if (v13 != 1)
    {
      if (v13 != 2)
        goto LABEL_14;
      objc_msgSend(MEMORY[0x1E0D0D588], "defaultTrustManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(*(id *)(a1 + 40), "serverTrust");
      objc_msgSend(*(id *)(a1 + 40), "host");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSSLTrust:hostname:service:", v15, v16, v12);

    }
    v17 = (void *)MEMORY[0x1E0CB39A8];
    objc_msgSend(*(id *)(a1 + 32), "protectionSpace");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "credentialForTrust:", objc_msgSend(v18, "serverTrust"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

  }
LABEL_14:

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  MTURLSessionManager *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _MTLogCategoryNetwork();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138413058;
    v15 = self;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_1DA478000, v11, OS_LOG_TYPE_DEFAULT, "[BackgroundSession] %@ didFinishDownloadingToURL called for task %@ with session %@ and location %@", (uint8_t *)&v14, 0x2Au);
  }

  if (-[MTURLSessionManager _subclassImplementsURLDidDownload](self, "_subclassImplementsURLDidDownload"))
  {
    -[MTURLSessionManager task:didCompleteWithDownloadedContentUrl:](self, "task:didCompleteWithDownloadedContentUrl:", v9, v10);
  }
  else
  {
    v12 = objc_msgSend((id)objc_opt_class(), "statusCodeForTask:", v9);
    if (v10 && v12 == 200)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTURLSessionManager task:didCompleteWithData:](self, "task:didCompleteWithData:", v9, v13);

    }
    else
    {
      -[MTURLSessionManager task:didFailWithError:orStatusCode:](self, "task:didFailWithError:orStatusCode:", v9, 0, v12);
    }
  }

}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  MTURLSessionManager *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _MTLogCategoryNetwork();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = 138412802;
    v10 = self;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1DA478000, v8, OS_LOG_TYPE_ERROR, "[BackgroundSession] %@ didBecomeInvalidWithError called for session %@ with error %@.", (uint8_t *)&v9, 0x20u);
  }

  -[MTURLSessionManager _invokeURLSessionBackgroundEventsCompletionHandler](self, "_invokeURLSessionBackgroundEventsCompletionHandler");
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  MTURLSessionManager *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _MTLogCategoryNetwork();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[MTURLSessionManager sessionCompletionHandler](self, "sessionCompletionHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = _Block_copy(v6);
    v8 = 138412802;
    v9 = self;
    v10 = 2112;
    v11 = v4;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1DA478000, v5, OS_LOG_TYPE_DEFAULT, "[BackgroundSession] %@ URLSessionDidFinishEventsForBackgroundURLSession called for session %@ with completionHandler: %@.", (uint8_t *)&v8, 0x20u);

  }
  -[MTURLSessionManager _invokeURLSessionBackgroundEventsCompletionHandler](self, "_invokeURLSessionBackgroundEventsCompletionHandler");

}

+ (int64_t)statusCodeForTask:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "statusCode");

  return v4;
}

uint64_t __73__MTURLSessionManager__invokeURLSessionBackgroundEventsCompletionHandler__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)purgeExternalCookies
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  _MTLogCategoryNetwork();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA478000, v2, OS_LOG_TYPE_DEBUG, "Purging external cookies", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3678], "sharedHTTPCookieStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v3, "cookies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v18;
    *(_QWORD *)&v6 = 138412546;
    v16 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "domain", v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "hasSuffix:", CFSTR(".apple.com"));

        if ((v12 & 1) == 0)
        {
          _MTLogCategoryNetwork();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v10, "domain");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "value");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v16;
            v22 = v14;
            v23 = 2112;
            v24 = v15;
            _os_log_impl(&dword_1DA478000, v13, OS_LOG_TYPE_DEBUG, "Purging cookie: %@ (%@)", buf, 0x16u);

          }
          objc_msgSend(v3, "deleteCookie:", v10);
        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionForBackgroundDownloads, 0);
  objc_storeStrong((id *)&self->_startQueue, 0);
  objc_storeStrong((id *)&self->_sessionForForegroundDownloads, 0);
  objc_storeStrong(&self->_sessionCompletionHandler, 0);
}

@end
