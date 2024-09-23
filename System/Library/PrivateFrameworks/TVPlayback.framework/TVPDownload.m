@implementation TVPDownload

+ (void)initialize
{
  if (initialize_onceToken_3 != -1)
    dispatch_once(&initialize_onceToken_3, &__block_literal_global_8);
}

void __25__TVPDownload_initialize__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppleTV.playback", "TVPDownload");
  v1 = (void *)sLogObject_2;
  sLogObject_2 = (uint64_t)v0;

}

- (TVPDownload)initWithMediaItem:(id)a3 downloadSession:(id)a4 existingDownloadTask:(id)a5
{
  id v9;
  id v10;
  id v11;
  TVPDownload *v12;
  TVPDownload *v13;
  uint64_t v14;
  NSPointerArray *delegates;
  unint64_t v16;
  AVAssetDownloadTask *downloadTask;
  void *v18;
  int64_t state;
  NSObject *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  TVPStateMachine *v26;
  TVPStateMachine *stateMachine;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)TVPDownload;
  v12 = -[TVPDownload init](&v29, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mediaItem, a3);
    objc_storeWeak((id *)&v13->_downloadSession, v10);
    v13->_state = 0;
    objc_storeStrong((id *)&v13->_downloadTask, a5);
    objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
    v14 = objc_claimAutoreleasedReturnValue();
    delegates = v13->_delegates;
    v13->_delegates = (NSPointerArray *)v14;

    v16 = *MEMORY[0x24BDF7608];
    v13->_downloadInitiationBackgroundTask = *MEMORY[0x24BDF7608];
    v13->_downloadTerminationBackgroundTask = v16;
    v13->_allowMultichannelAudio = 1;
    *(_DWORD *)&v13->_includeDefaultAudioOption = 16843009;
    downloadTask = v13->_downloadTask;
    if (downloadTask)
    {
      objc_msgSend(v10, "registerDownloadTask:forDownload:", downloadTask, v13);
      -[AVAssetDownloadTask addObserver:forKeyPath:options:context:](v13->_downloadTask, "addObserver:forKeyPath:options:context:", v13, CFSTR("progress.fractionCompleted"), 0, __DownloadTaskProgressKVOContext);
      v13->_addedProgressObserver = 1;
    }
    v18 = (void *)sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      state = v13->_state;
      v20 = v18;
      -[TVPDownload descriptionForState:](v13, "descriptionForState:", state);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v21;
      _os_log_impl(&dword_228A4E000, v20, OS_LOG_TYPE_DEFAULT, "Setting state to %@", buf, 0xCu);

    }
    v22 = objc_alloc(MEMORY[0x24BDD16A8]);
    v23 = objc_opt_class();
    v24 = initWithMediaItem_downloadSession_existingDownloadTask__instanceNumber++;
    v25 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("%@ %ld"), v23, v24);
    v26 = -[TVPStateMachine initWithName:initialState:mode:]([TVPStateMachine alloc], "initWithName:initialState:mode:", v25, CFSTR("Not started"), 0);
    stateMachine = v13->_stateMachine;
    v13->_stateMachine = v26;

    -[TVPStateMachine setLogObject:](v13->_stateMachine, "setLogObject:", sLogObject_2);
    -[TVPDownload _registerStateMachineHandlers](v13, "_registerStateMachineHandlers");
    -[TVPStateMachine setShouldAcceptEvents:](v13->_stateMachine, "setShouldAcceptEvents:", 1);

  }
  return v13;
}

- (void)dealloc
{
  AVAssetDownloadTask *downloadTask;
  objc_super v4;

  if (self->_addedProgressObserver)
  {
    downloadTask = self->_downloadTask;
    if (downloadTask)
      -[AVAssetDownloadTask removeObserver:forKeyPath:context:](downloadTask, "removeObserver:forKeyPath:context:", self, CFSTR("progress.fractionCompleted"), __DownloadTaskProgressKVOContext);
  }
  v4.receiver = self;
  v4.super_class = (Class)TVPDownload;
  -[TVPDownload dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v15;
  _QWORD v16[5];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if ((void *)__TVPMediaItemLoaderStateKVOContext == a6)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPDownload _mediaItemLoaderStateDidChangeTo:](self, "_mediaItemLoaderStateDidChangeTo:", v14);

  }
  else if ((void *)__DownloadTaskProgressKVOContext == a6)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __62__TVPDownload_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v16[3] = &unk_24F15BEF8;
    v16[4] = self;
    TVPPerformBlockOnMainThreadIfNeeded(v16);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)TVPDownload;
    -[TVPDownload observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

uint64_t __62__TVPDownload_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_downloadProgressDidChange");
}

- (void)addDelegate:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[TVPDownload delegates](self, "delegates");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addPointer:", v4);

  }
}

- (void)removeDelegate:(id)a3
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  if (v12)
  {
    -[TVPDownload delegates](self, "delegates");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      v6 = 0;
      while (1)
      {
        -[TVPDownload delegates](self, "delegates");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "pointerAtIndex:", v6);

        if ((id)v8 == v12)
          break;
        ++v6;
        -[TVPDownload delegates](self, "delegates");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v6 >= v10)
          goto LABEL_8;
      }
      -[TVPDownload delegates](self, "delegates");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removePointerAtIndex:", v6);

    }
  }
LABEL_8:

}

- (double)progress
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double result;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;

  -[TVPDownload stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Downloading"));

  if (v5)
  {
    -[TVPDownload downloadTask](self, "downloadTask");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "progress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fractionCompleted");
    v9 = v8;

    return v9;
  }
  -[TVPDownload stateMachine](self, "stateMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Terminating"));

  if (v13)
  {
    -[TVPDownload lastDownloadProgressFractionCompleted](self, "lastDownloadProgressFractionCompleted");
    return result;
  }
  -[TVPDownload stateMachine](self, "stateMachine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "currentState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isEqualToString:", CFSTR("Download complete")))
  {

  }
  else
  {
    -[TVPDownload stateMachine](self, "stateMachine");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("Processing finished download"));

    result = 0.0;
    if (!v18)
      return result;
  }
  return 1.0;
}

- (void)start
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_228A4E000, v0, v1, "Posting error on start since startError is present", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)cancel
{
  id v2;

  -[TVPDownload stateMachine](self, "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:", CFSTR("Cancel"));

}

- (void)failWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TVPDownload stateMachine](self, "stateMachine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postEvent:withContext:", CFSTR("Error did occur"), v4);

}

- (id)descriptionForState:(int64_t)a3
{
  if ((unint64_t)a3 > 6)
    return 0;
  else
    return off_24F15C1D8[a3];
}

- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 willDownloadToURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  unint64_t v21;
  int v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    -[TVPDownload mediaItem](self, "mediaItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412802;
    v23 = v9;
    v24 = 2112;
    v25 = v13;
    v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_228A4E000, v12, OS_LOG_TYPE_DEFAULT, "Task [%@] for media item [%@] will download to [%@]", (uint8_t *)&v22, 0x20u);

  }
  -[TVPDownload delegates](self, "delegates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v16 = 0;
    do
    {
      -[TVPDownload delegates](self, "delegates");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "pointerAtIndex:", v16);

      if (v18)
      {
        v19 = v18;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v19, "download:willDownloadToURL:", self, v10);

      }
      ++v16;
      -[TVPDownload delegates](self, "delegates");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

    }
    while (v16 < v21);
  }

}

- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 willDownloadVariants:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  unint64_t v21;
  int v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    -[TVPDownload mediaItem](self, "mediaItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412802;
    v23 = v9;
    v24 = 2112;
    v25 = v13;
    v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_228A4E000, v12, OS_LOG_TYPE_DEFAULT, "Download task [%@] for media item [%@] will download variants %@", (uint8_t *)&v22, 0x20u);

  }
  -[TVPDownload delegates](self, "delegates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v16 = 0;
    do
    {
      -[TVPDownload delegates](self, "delegates");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "pointerAtIndex:", v16);

      if (v18)
      {
        v19 = v18;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v19, "download:willDownloadVariants:", self, v10);

      }
      ++v16;
      -[TVPDownload delegates](self, "delegates");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

    }
    while (v16 < v21);
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = -[TVPDownload downloadTerminationBackgroundTask](self, "downloadTerminationBackgroundTask");
  if (v9 == *MEMORY[0x24BDF7608])
  {
    v10 = v9;
    v11 = (void *)MEMORY[0x24BDD17C8];
    -[TVPDownload stateMachine](self, "stateMachine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Download termination [%@]"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __52__TVPDownload_URLSession_task_didCompleteWithError___block_invoke;
    v22[3] = &unk_24F15BEF8;
    v22[4] = self;
    v16 = objc_msgSend(v15, "beginBackgroundTaskWithName:expirationHandler:", v14, v22);

    v17 = sLogObject_2;
    if (v16 == v10)
    {
      if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR))
        -[TVPDownload URLSession:task:didCompleteWithError:].cold.1();
    }
    else if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v24 = v16;
      v25 = 2112;
      v26 = v14;
      _os_log_impl(&dword_228A4E000, v17, OS_LOG_TYPE_DEFAULT, "Beginning download termination background task with identifier %lu, name: %@", buf, 0x16u);
    }
    -[TVPDownload setDownloadTerminationBackgroundTask:](self, "setDownloadTerminationBackgroundTask:", v16);

  }
  else if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR))
  {
    -[TVPDownload URLSession:task:didCompleteWithError:].cold.2();
  }
  v18 = (void *)sLogObject_2;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR))
    {
      v19 = v18;
      -[TVPDownload mediaItem](self, "mediaItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v24 = (uint64_t)v7;
      v25 = 2112;
      v26 = v20;
      v27 = 2112;
      v28 = v8;
      _os_log_error_impl(&dword_228A4E000, v19, OS_LOG_TYPE_ERROR, "Task [%@] for media item [%@] did complete with error: %@", buf, 0x20u);
LABEL_15:

    }
  }
  else if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    v19 = v18;
    -[TVPDownload mediaItem](self, "mediaItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v24 = (uint64_t)v7;
    v25 = 2112;
    v26 = v20;
    _os_log_impl(&dword_228A4E000, v19, OS_LOG_TYPE_DEFAULT, "Task [%@] for media item [%@] did complete download task successfully", buf, 0x16u);
    goto LABEL_15;
  }
  -[TVPDownload stateMachine](self, "stateMachine");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "postEvent:withContext:", CFSTR("Download task did complete"), v8);

}

uint64_t __52__TVPDownload_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  id *v1;
  uint64_t result;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = (id *)(a1 + 32);
  result = objc_msgSend(*(id *)(a1 + 32), "downloadTerminationBackgroundTask");
  v3 = *MEMORY[0x24BDF7608];
  if (result != *MEMORY[0x24BDF7608])
  {
    v4 = (void *)sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR))
      __52__TVPDownload_URLSession_task_didCompleteWithError___block_invoke_cold_1((uint64_t)v1, v4);
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endBackgroundTask:", objc_msgSend(*v1, "downloadTerminationBackgroundTask"));

    return objc_msgSend(*v1, "setDownloadTerminationBackgroundTask:", v3);
  }
  return result;
}

- (void)_downloadProgressDidChange
{
  NSObject *v3;
  void *v4;
  void *v5;
  double v6;
  int v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "downloadTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "progress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fractionCompleted");
  v7 = 134217984;
  v8 = v6 * 100.0;
  _os_log_debug_impl(&dword_228A4E000, v3, OS_LOG_TYPE_DEBUG, "Download progress did change to %.2f%%", (uint8_t *)&v7, 0xCu);

}

- (void)_mediaItemLoaderStateDidChangeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "isEqualToString:", 0x24F163DF8))
  {
    -[TVPDownload stateMachine](self, "stateMachine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postEvent:", CFSTR("AVAsset keys did load"));
LABEL_5:

    goto LABEL_6;
  }
  if (objc_msgSend(v7, "isEqualToString:", 0x24F15F8F8))
  {
    -[TVPDownload stateMachine](self, "stateMachine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPDownload mediaItemLoader](self, "mediaItemLoader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postEvent:withContext:", CFSTR("Error did occur"), v6);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)_addMediaSelectionOptionsIfNotAlreadyAdded:(id)a3 toMediaSelections:(id)a4 forMediaSelectionGroup:(id)a5 baseMediaSelection:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  id v23;
  id obj;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v26 = a4;
  v10 = a5;
  v23 = a6;
  obj = v9;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v11)
  {
    v12 = v11;
    v25 = *(_QWORD *)v32;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v32 != v25)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v13);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v15 = v26;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v28;
LABEL_8:
          v19 = 0;
          while (1)
          {
            if (*(_QWORD *)v28 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v19), "selectedMediaOptionInMediaSelectionGroup:", v10);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v14, "isEqual:", v20);

            if ((v21 & 1) != 0)
              break;
            if (v17 == ++v19)
            {
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
              if (v17)
                goto LABEL_8;
              goto LABEL_14;
            }
          }
        }
        else
        {
LABEL_14:

          v22 = (void *)objc_msgSend(v23, "mutableCopy");
          objc_msgSend(v22, "selectMediaOption:inMediaSelectionGroup:", v14, v10);
          objc_msgSend(v15, "addObject:", v22);
          v15 = v22;
        }

        ++v13;
      }
      while (v13 != v12);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v12);
  }

}

- (id)_variantQualifiersForCurrentSettingsAndAudioOption:(id)a3 useMultichannelAudio:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[2];
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[4];

  v4 = a4;
  v79[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v69 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v6)
  {
    if (v4)
      v7 = 2;
    else
      v7 = 1;
    objc_msgSend(MEMORY[0x24BDB23F8], "predicateForChannelCount:mediaSelectionOption:operatorType:", 2, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("averageBitRate > 0"));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
  -[TVPDownload maximumPresentationWidth](self, "maximumPresentationWidth");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDB23F8];
    -[TVPDownload maximumPresentationWidth](self, "maximumPresentationWidth");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    objc_msgSend(v11, "predicateForPresentationWidth:operatorType:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x24BDD14C0];
    v79[0] = v9;
    v79[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v79, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "andPredicateWithSubpredicates:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v16;
  }
  if (!-[TVPDownload preferMostCompatibleRendition](self, "preferMostCompatibleRendition"))
  {
    v68 = v6;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("videoAttributes.videoRange == %@"), *MEMORY[0x24BDB2358]);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BDD14C0];
    v78[0] = v17;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%@ IN videoAttributes.codecTypes"), &unk_24F1734F8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v78[1] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v78, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "andPredicateWithSubpredicates:", v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x24BDD14C0];
    v77[0] = v9;
    v77[1] = v21;
    v66 = (void *)v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v77, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "andPredicateWithSubpredicates:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x24BDD14C0];
    v76[0] = v9;
    v76[1] = v17;
    v67 = (void *)v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v76, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "andPredicateWithSubpredicates:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[TVPDownload maximumAverageBitrateForHDR](self, "maximumAverageBitrateForHDR");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = (void *)MEMORY[0x24BDD1758];
      -[TVPDownload maximumAverageBitrateForHDR](self, "maximumAverageBitrateForHDR");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "predicateWithFormat:", CFSTR("averageBitRate < %@"), v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = (void *)MEMORY[0x24BDD14C0];
      v75[0] = v24;
      v75[1] = v31;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v75, 2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "andPredicateWithSubpredicates:", v33);
      v34 = objc_claimAutoreleasedReturnValue();

      v35 = (void *)MEMORY[0x24BDD14C0];
      v74[0] = v27;
      v74[1] = v31;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v74, 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "andPredicateWithSubpredicates:", v36);
      v37 = objc_claimAutoreleasedReturnValue();

      v24 = (void *)v34;
      v27 = (void *)v37;
    }
    objc_msgSend(MEMORY[0x24BDB23F8], "assetVariantQualifierWithPredicate:", v24);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "addObject:", v38);

    v65 = v27;
    objc_msgSend(MEMORY[0x24BDB23F8], "assetVariantQualifierWithPredicate:", v27);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "addObject:", v39);

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%@ IN videoAttributes.codecTypes"), &unk_24F173510);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)MEMORY[0x24BDD14C0];
    v73[0] = v9;
    v73[1] = v40;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "andPredicateWithSubpredicates:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    -[TVPDownload maximumAverageBitrateForSDRHEVC](self, "maximumAverageBitrateForSDRHEVC");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      v45 = (void *)MEMORY[0x24BDD1758];
      -[TVPDownload maximumAverageBitrateForSDRHEVC](self, "maximumAverageBitrateForSDRHEVC");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "predicateWithFormat:", CFSTR("averageBitRate < %@"), v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = (void *)MEMORY[0x24BDD14C0];
      v72[0] = v43;
      v72[1] = v47;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v72, 2);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "andPredicateWithSubpredicates:", v49);
      v50 = objc_claimAutoreleasedReturnValue();

      v43 = (void *)v50;
    }
    objc_msgSend(MEMORY[0x24BDB23F8], "assetVariantQualifierWithPredicate:", v43);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "addObject:", v51);

    v6 = v68;
  }
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%@ IN videoAttributes.codecTypes"), &unk_24F173528);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)MEMORY[0x24BDD14C0];
  v71[0] = v9;
  v71[1] = v52;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 2);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "andPredicateWithSubpredicates:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  -[TVPDownload maximumAverageBitrateForAVC](self, "maximumAverageBitrateForAVC");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    v57 = (void *)MEMORY[0x24BDD1758];
    -[TVPDownload maximumAverageBitrateForAVC](self, "maximumAverageBitrateForAVC");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "predicateWithFormat:", CFSTR("averageBitRate < %@"), v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = (void *)MEMORY[0x24BDD14C0];
    v70[0] = v55;
    v70[1] = v59;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 2);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "andPredicateWithSubpredicates:", v61);
    v62 = objc_claimAutoreleasedReturnValue();

    v55 = (void *)v62;
  }
  objc_msgSend(MEMORY[0x24BDB23F8], "assetVariantQualifierWithPredicate:", v55);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "addObject:", v63);

  return v69;
}

- (BOOL)_anyDelegateRespondsToProcessFinishedDownload
{
  void *v3;
  uint64_t v4;
  int v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[TVPDownload delegates](self, "delegates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = 0;
  if (v4)
  {
    v6 = 0;
    do
    {
      -[TVPDownload delegates](self, "delegates");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "pointerAtIndex:", v6);

      if (v8)
        v5 |= objc_opt_respondsToSelector();
      ++v6;
      -[TVPDownload delegates](self, "delegates");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

    }
    while (v6 < v10);
  }
  return v5 & 1;
}

- (void)_processFinishedDownloadWithCompletion:(id)a3
{
  NSObject *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[4];
  NSObject *v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;

  v13 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__1;
  v20[4] = __Block_byref_object_dispose__1;
  v21 = 0;
  v4 = dispatch_group_create();
  v5 = 0;
  v6 = MEMORY[0x24BDAC760];
  while (1)
  {
    -[TVPDownload delegates](self, "delegates", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v5 >= v8)
      break;
    -[TVPDownload delegates](self, "delegates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "pointerAtIndex:", v5);

    if (v10)
    {
      v11 = v10;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        dispatch_group_enter(v4);
        v17[0] = v6;
        v17[1] = 3221225472;
        v17[2] = __54__TVPDownload__processFinishedDownloadWithCompletion___block_invoke;
        v17[3] = &unk_24F15BF20;
        v19 = v20;
        v18 = v4;
        objc_msgSend(v11, "download:processFinishedDownloadWithCompletion:", self, v17);

      }
    }
    ++v5;
  }
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __54__TVPDownload__processFinishedDownloadWithCompletion___block_invoke_2;
  block[3] = &unk_24F15BF48;
  v15 = v13;
  v16 = v20;
  v12 = v13;
  dispatch_group_notify(v4, MEMORY[0x24BDAC9B8], block);

  _Block_object_dispose(v20, 8);
}

void __54__TVPDownload__processFinishedDownloadWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __54__TVPDownload__processFinishedDownloadWithCompletion___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40);
    v3 = sLogObject_2;
    v4 = os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT);
    if (v2)
    {
      if (v4)
      {
        v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 40);
        v9 = 138412290;
        v10 = v5;
        v6 = "Processed finished download with error %@";
        v7 = v3;
        v8 = 12;
LABEL_7:
        _os_log_impl(&dword_228A4E000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
      }
    }
    else if (v4)
    {
      LOWORD(v9) = 0;
      v6 = "Processed finished download successfully";
      v7 = v3;
      v8 = 2;
      goto LABEL_7;
    }
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 32) + 16))(*(_QWORD *)(v1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 40));
  }
  return result;
}

- (void)_registerStateMachineHandlers
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id location;
  _QWORD v39[5];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[4];

  v42[2] = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  -[TVPDownload stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke;
  v36[3] = &unk_24F15BF98;
  objc_copyWeak(&v37, &location);
  v5 = (void *)MEMORY[0x22E2BA4B0](v36);
  v33[0] = v4;
  v33[1] = 3221225472;
  v33[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_2;
  v33[3] = &unk_24F15BFE8;
  objc_copyWeak(&v35, &location);
  v6 = v5;
  v34 = v6;
  v7 = (void *)MEMORY[0x22E2BA4B0](v33);
  v30[0] = v4;
  v30[1] = 3221225472;
  v30[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_92;
  v30[3] = &unk_24F15C060;
  objc_copyWeak(&v32, &location);
  v15 = v6;
  v31 = v15;
  objc_msgSend(v3, "registerHandlerForEvent:onState:withBlock:", CFSTR("Start"), CFSTR("Not started"), v30);
  v28[0] = v4;
  v28[1] = 3221225472;
  v28[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_106;
  v28[3] = &unk_24F15C0D8;
  objc_copyWeak(&v29, &location);
  objc_msgSend(v3, "registerHandlerForEvent:onState:withBlock:", CFSTR("AVAsset keys did load"), CFSTR("Waiting for AVAsset keys to load"), v28);
  v26[0] = v4;
  v26[1] = 3221225472;
  v26[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_162;
  v26[3] = &unk_24F15C128;
  objc_copyWeak(&v27, &location);
  v26[4] = self;
  objc_msgSend(v3, "registerHandlerForEvent:onState:withBlock:", CFSTR("Key fetch attempt complete"), CFSTR("Fetching playback keys"), v26);
  v42[0] = CFSTR("Waiting for AVAsset keys to load");
  v42[1] = CFSTR("Fetching playback keys");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Download task did complete"), v8, &__block_literal_global_184);

  v41[0] = CFSTR("Not started");
  v41[1] = CFSTR("Downloading");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v4;
  v23[1] = 3221225472;
  v23[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_186;
  v23[3] = &unk_24F15C060;
  objc_copyWeak(&v25, &location);
  v10 = v7;
  v24 = v10;
  objc_msgSend(v3, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Download task did complete"), v9, v23);

  objc_msgSend(v3, "registerHandlerForEvent:onState:withBlock:", CFSTR("Download task did complete"), CFSTR("Terminating"), &__block_literal_global_189);
  v21[0] = v4;
  v21[1] = 3221225472;
  v21[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_191;
  v21[3] = &unk_24F15C1B8;
  v11 = v10;
  v22 = v11;
  objc_msgSend(v3, "registerHandlerForEvent:onState:withBlock:", CFSTR("Did process finished download"), CFSTR("Processing finished download"), v21);
  v40[0] = CFSTR("Cancel");
  v40[1] = CFSTR("Error did occur");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = CFSTR("Not started");
  v39[1] = CFSTR("Waiting for AVAsset keys to load");
  v39[2] = CFSTR("Fetching playback keys");
  v39[3] = CFSTR("Downloading");
  v39[4] = CFSTR("Processing finished download");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v4;
  v19[1] = 3221225472;
  v19[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_4_193;
  v19[3] = &unk_24F15C0D8;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v3, "registerHandlerForEvents:onStates:withBlock:", v12, v13, v19);

  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_196;
  v16[3] = &unk_24F15C060;
  objc_copyWeak(&v18, &location);
  v14 = v11;
  v17 = v14;
  objc_msgSend(v3, "registerHandlerForEvent:onState:withBlock:", CFSTR("Termination delay did finish"), CFSTR("Terminating"), v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v35);

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[6];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = (void *)sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    objc_msgSend(WeakRetained, "descriptionForState:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_impl(&dword_228A4E000, v5, OS_LOG_TYPE_DEFAULT, "Setting state to %@", buf, 0xCu);

  }
  objc_msgSend(WeakRetained, "setState:", a2);
  objc_msgSend(WeakRetained, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_85;
  v8[3] = &unk_24F15BF70;
  v8[4] = WeakRetained;
  v8[5] = a2;
  objc_msgSend(v7, "executeBlockAfterCurrentStateTransition:", v8);

}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_85(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "delegates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v4 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "delegates");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "pointerAtIndex:", v4);

      if (v6)
      {
        v7 = v6;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "download:didChangeStateTo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

      }
      ++v4;
      objc_msgSend(*(id *)(a1 + 32), "delegates");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

    }
    while (v4 < v9);
  }
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  TVPReportingSession *v13;
  void *v14;
  TVPReportingSession *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  uint64_t v24;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (a2 != 5)
  {
    v6 = a2 == 4;
    v7 = 0;
    goto LABEL_8;
  }
  objc_msgSend(WeakRetained, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD1308]) & 1) != 0)
  {
    objc_msgSend(v5, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "code");

    if (v11 == -999)
    {
      v7 = 0;
      v6 = 1;
      goto LABEL_8;
    }
  }
  else
  {

  }
  objc_msgSend(v5, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 2;
LABEL_8:
  objc_msgSend(v5, "reportingSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = [TVPReportingSession alloc];
    objc_msgSend(v5, "mediaItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[TVPReportingSession initWithMediaItem:](v13, "initWithMediaItem:", v14);
    objc_msgSend(v5, "setReportingSession:", v15);

  }
  objc_msgSend(v5, "reportingSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reportDownloadFinishedWithResult:error:", v6, v7);

  if (objc_msgSend(v5, "addedProgressObserver"))
  {
    objc_msgSend(v5, "downloadTask");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObserver:forKeyPath:context:", v5, CFSTR("progress.fractionCompleted"), __DownloadTaskProgressKVOContext);

    objc_msgSend(v5, "setAddedProgressObserver:", 0);
  }
  objc_msgSend(v5, "setDownloadTask:", 0);
  objc_msgSend(v5, "setLastDownloadProgressFractionCompleted:", 0.0);
  if (objc_msgSend(v5, "addedMediaItemLoaderStateObserver"))
  {
    objc_msgSend(v5, "mediaItemLoader");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObserver:forKeyPath:context:", v5, CFSTR("state"), __TVPMediaItemLoaderStateKVOContext);

    objc_msgSend(v5, "setAddedMediaItemLoaderStateObserver:", 0);
  }
  objc_msgSend(v5, "mediaItemLoader");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "cleanupIfNecessary");

  objc_msgSend(v5, "setMediaItemLoader:", 0);
  objc_msgSend(v5, "downloadSession");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "unregisterDownloadTaskForDownload:", v5);

  objc_msgSend(v5, "setStorageSettingsImageData:", 0);
  objc_msgSend(v5, "stateMachine");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_3;
  v22[3] = &unk_24F15BFC0;
  v23 = *(id *)(a1 + 32);
  v24 = a2;
  v22[4] = v5;
  objc_msgSend(v21, "executeBlockAfterCurrentStateTransition:", v22);

}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_3(uint64_t a1)
{
  _QWORD block[5];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_4;
  block[3] = &unk_24F15BEF8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t result;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "downloadInitiationBackgroundTask");
  v3 = *MEMORY[0x24BDF7608];
  if (v2 != *MEMORY[0x24BDF7608])
  {
    v4 = (void *)sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 32);
      v6 = v4;
      v14 = 134217984;
      v15 = objc_msgSend(v5, "downloadInitiationBackgroundTask");
      _os_log_impl(&dword_228A4E000, v6, OS_LOG_TYPE_DEFAULT, "Ending download initiation background task with identifier %lu", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endBackgroundTask:", objc_msgSend(*(id *)(a1 + 32), "downloadInitiationBackgroundTask"));

    objc_msgSend(*(id *)(a1 + 32), "setDownloadInitiationBackgroundTask:", v3);
  }
  result = objc_msgSend(*(id *)(a1 + 32), "downloadTerminationBackgroundTask");
  if (result != v3)
  {
    v9 = (void *)sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(void **)(a1 + 32);
      v11 = v9;
      v12 = objc_msgSend(v10, "downloadTerminationBackgroundTask");
      v14 = 134217984;
      v15 = v12;
      _os_log_impl(&dword_228A4E000, v11, OS_LOG_TYPE_DEFAULT, "Ending download termination background task with identifier %lu", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "endBackgroundTask:", objc_msgSend(*(id *)(a1 + 32), "downloadTerminationBackgroundTask"));

    return objc_msgSend(*(id *)(a1 + 32), "setDownloadTerminationBackgroundTask:", v3);
  }
  return result;
}

const __CFString *__44__TVPDownload__registerStateMachineHandlers__block_invoke_92(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  const __CFString *v23;
  void *v24;
  TVPReportingSession *v25;
  void *v26;
  TVPReportingSession *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  _QWORD v38[5];
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  uint64_t v48;
  _QWORD v49[5];
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "downloadTask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = MEMORY[0x24BDAC760];
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_103;
    v39[3] = &unk_24F15C038;
    v40 = *(id *)(a1 + 32);
    objc_msgSend(v3, "executeBlockAfterCurrentStateTransition:", v39);
    objc_msgSend(WeakRetained, "downloadTask");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "state");

    if (v8 == 1)
    {
      v9 = sLogObject_2;
      if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_228A4E000, v9, OS_LOG_TYPE_DEFAULT, "Download task already exists but is suspended.  Resuming", buf, 2u);
      }
      objc_msgSend(WeakRetained, "downloadTask");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "resume");

    }
    else
    {
      objc_msgSend(WeakRetained, "downloadTask");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "state");

      if (v21 == 3)
      {
        v22 = sLogObject_2;
        if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_228A4E000, v22, OS_LOG_TYPE_DEFAULT, "Calling URLSession:task:didCompleteWithError: since download task is already completed", buf, 2u);
        }
        v38[0] = v6;
        v38[1] = 3221225472;
        v38[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_104;
        v38[3] = &unk_24F15BEF8;
        v38[4] = WeakRetained;
        objc_msgSend(v3, "executeBlockAfterCurrentStateTransition:", v38);
      }
    }
    v23 = CFSTR("Downloading");
    v24 = v40;
  }
  else
  {
    v11 = objc_msgSend(WeakRetained, "downloadInitiationBackgroundTask");
    if (v11 == *MEMORY[0x24BDF7608])
    {
      v12 = v11;
      v13 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(WeakRetained, "stateMachine");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("Download initiation [%@]"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = MEMORY[0x24BDAC760];
      v49[1] = 3221225472;
      v49[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_95;
      v49[3] = &unk_24F15BEF8;
      v49[4] = WeakRetained;
      v18 = objc_msgSend(v17, "beginBackgroundTaskWithName:expirationHandler:", v16, v49);

      v19 = sLogObject_2;
      if (v18 == v12)
      {
        if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR))
          __44__TVPDownload__registerStateMachineHandlers__block_invoke_92_cold_2();
      }
      else if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v51 = v18;
        v52 = 2112;
        v53 = v16;
        _os_log_impl(&dword_228A4E000, v19, OS_LOG_TYPE_DEFAULT, "Beginning download initiation background task with identifier %lu, name: %@", buf, 0x16u);
      }
      objc_msgSend(WeakRetained, "setDownloadInitiationBackgroundTask:", v18);

    }
    else if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR))
    {
      __44__TVPDownload__registerStateMachineHandlers__block_invoke_92_cold_3();
    }
    v25 = [TVPReportingSession alloc];
    objc_msgSend(WeakRetained, "mediaItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[TVPReportingSession initWithMediaItem:](v25, "initWithMediaItem:", v26);
    objc_msgSend(WeakRetained, "setReportingSession:", v27);

    objc_msgSend(WeakRetained, "mediaItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[TVPMediaItemLoader loaderForMediaItem:](TVPMediaItemLoader, "loaderForMediaItem:", v28);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(WeakRetained, "downloadTask");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "URLAsset");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setExistingAVAsset:", v30);

      objc_msgSend(v24, "setAllowsCellularUsage:", objc_msgSend(WeakRetained, "allowCellularUsage"));
      objc_msgSend(WeakRetained, "setMediaItemLoader:", v24);
      objc_msgSend(v24, "addObserver:forKeyPath:options:context:", WeakRetained, CFSTR("state"), 1, __TVPMediaItemLoaderStateKVOContext);
      objc_msgSend(WeakRetained, "setAddedMediaItemLoaderStateObserver:", 1);
      v31 = objc_msgSend(WeakRetained, "performKeyFetchOnly");
      v32 = MEMORY[0x24BDAC760];
      if (v31)
        v33 = 6;
      else
        v33 = 1;
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_97;
      v46[3] = &unk_24F15C010;
      v47 = *(id *)(a1 + 32);
      v48 = v33;
      objc_msgSend(v3, "executeBlockAfterCurrentStateTransition:", v46);
      objc_msgSend(v24, "loadIfNecessary");
      objc_msgSend(v24, "state");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v34, "isEqualToString:", 0x24F163DF8) & 1) != 0
        || (objc_msgSend(v34, "isEqualToString:", 0x24F163E18) & 1) != 0
        || objc_msgSend(v34, "isEqualToString:", 0x24F163E38))
      {
        v44[0] = v32;
        v44[1] = 3221225472;
        v44[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_98;
        v44[3] = &unk_24F15BEF8;
        v45 = v3;
        objc_msgSend(v45, "executeBlockAfterCurrentStateTransition:", v44);

      }
      v35 = v47;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR))
        __44__TVPDownload__registerStateMachineHandlers__block_invoke_92_cold_1();
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), 802, 0);
      v41[0] = MEMORY[0x24BDAC760];
      v41[1] = 3221225472;
      v41[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_102;
      v41[3] = &unk_24F15BCB0;
      v42 = v3;
      v43 = v36;
      v35 = v36;
      objc_msgSend(v42, "executeBlockAfterCurrentStateTransition:", v41);

    }
    v23 = CFSTR("Waiting for AVAsset keys to load");
  }

  return v23;
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_95(uint64_t a1)
{
  id *v1;
  uint64_t result;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = (id *)(a1 + 32);
  result = objc_msgSend(*(id *)(a1 + 32), "downloadInitiationBackgroundTask");
  v3 = *MEMORY[0x24BDF7608];
  if (result != *MEMORY[0x24BDF7608])
  {
    v4 = (void *)sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR))
      __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_95_cold_1((uint64_t)v1, v4);
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endBackgroundTask:", objc_msgSend(*v1, "downloadInitiationBackgroundTask"));

    return objc_msgSend(*v1, "setDownloadInitiationBackgroundTask:", v3);
  }
  return result;
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_97(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_98(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:", CFSTR("AVAsset keys did load"));
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_102(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:withContext:", CFSTR("Error did occur"), *(_QWORD *)(a1 + 40));
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_103(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_104(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "downloadSession");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "downloadSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "downloadTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "downloadTask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLSession:task:didCompleteWithError:", v3, v4, v6);

}

const __CFString *__44__TVPDownload__registerStateMachineHandlers__block_invoke_2_106(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  id *v31;
  NSObject *v32;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  uint8_t buf[16];

  v9 = a2;
  v36 = a3;
  v35 = a4;
  v34 = a5;
  v10 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "mediaItemLoader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "AVAsset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "tvp_maximumVideoRange");
  v15 = objc_msgSend(v13, "tvp_maximumVideoResolution");
  objc_msgSend(WeakRetained, "delegates");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    v18 = 0;
    do
    {
      objc_msgSend(WeakRetained, "delegates");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v19, "pointerAtIndex:", v18);

      if (v20)
      {
        v21 = v20;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v21, "download:didDetermineMaximumResolution:maximumVideoRange:", WeakRetained, v15, v14);

      }
      ++v18;
      objc_msgSend(WeakRetained, "delegates");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

    }
    while (v18 < v23);
  }
  objc_msgSend(WeakRetained, "mediaItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataContentKeyRequestParams"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "mediaItemLoader");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "contentKeySession");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v25, "count")
    && (objc_msgSend(WeakRetained, "mediaItem"),
        v28 = (void *)objc_claimAutoreleasedReturnValue(),
        v29 = objc_msgSend(v28, "conformsToProtocol:", &unk_255A073F0),
        v28,
        v29))
  {
    v30 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228A4E000, v30, OS_LOG_TYPE_DEFAULT, "Key params are available, will attempt to prefetch playback keys prior to starting download task", buf, 2u);
    }
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_159;
    v39[3] = &unk_24F15C0B0;
    v40 = v27;
    v41 = v25;
    objc_copyWeak(&v42, v10);
    objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", v39);
    v31 = &v40;
    objc_destroyWeak(&v42);

  }
  else
  {
    v32 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228A4E000, v32, OS_LOG_TYPE_DEFAULT, "No key params are available, will not prefetch playback keys prior to starting download task", buf, 2u);
    }
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_161;
    v37[3] = &unk_24F15BEF8;
    v31 = &v38;
    v38 = v9;
    objc_msgSend(v38, "executeBlockAfterCurrentStateTransition:", v37);
  }

  return CFSTR("Fetching playback keys");
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_159(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_160;
  v3[3] = &unk_24F15C088;
  objc_copyWeak(&v4, (id *)(a1 + 48));
  objc_msgSend(v1, "fetchOfflineKeysForParams:completion:", v2, v3);
  objc_destroyWeak(&v4);
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_160(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  uint8_t v5[16];

  v2 = sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_228A4E000, v2, OS_LOG_TYPE_DEFAULT, "Finished key prefetch attempt", v5, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postEvent:", CFSTR("Key fetch attempt complete"));

}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_161(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:", CFSTR("Key fetch attempt complete"));
}

const __CFString *__44__TVPDownload__registerStateMachineHandlers__block_invoke_2_162(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  char v39;
  NSObject *v40;
  _BOOL4 v41;
  NSObject *v42;
  id v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  NSObject *v64;
  NSObject *v65;
  id v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t j;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t k;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  NSObject *v92;
  id v93;
  void *v94;
  void *v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t m;
  void *v102;
  void *v103;
  int v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t n;
  void *v110;
  void *v111;
  void *v112;
  NSObject *v113;
  id v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t ii;
  void *v120;
  NSObject *v121;
  void *v122;
  uint64_t v123;
  NSObject *v124;
  void *v125;
  NSObject *v126;
  id v127;
  void *v128;
  NSObject *v129;
  CFArrayRef v130;
  void *v131;
  void *v132;
  void *v133;
  id v134;
  NSObject *v135;
  const __CFString *v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t jj;
  void *v141;
  void *v142;
  char v143;
  void *v144;
  int v145;
  id v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  void *v152;
  int v153;
  void *v154;
  void *v155;
  id v156;
  void *v157;
  id v158;
  void *v159;
  id v160;
  void *v161;
  id v162;
  id v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t kk;
  uint64_t v168;
  void *v169;
  void *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t mm;
  void *v175;
  NSObject *v176;
  id v177;
  void *v178;
  NSObject *v179;
  void *v180;
  void *v181;
  id v182;
  void *v183;
  void *v184;
  int v185;
  id v186;
  id v187;
  void *v188;
  void *v189;
  NSObject *v190;
  void *v191;
  void *v192;
  void *v193;
  uint64_t v194;
  unint64_t v195;
  void *v196;
  void *v197;
  id v198;
  void *v199;
  void *v200;
  unint64_t v201;
  void *v202;
  NSObject *v203;
  id v204;
  CFArrayRef v206;
  void *v207;
  void *v208;
  void *v209;
  CFArrayRef v210;
  uint64_t v211;
  id v212;
  void *v213;
  void *v214;
  id v215;
  id v216;
  id v217;
  id v218;
  id v219;
  id v220;
  void *v221;
  void *v222;
  int v223;
  id v224;
  id v225;
  void *v226;
  id v227;
  uint64_t v228;
  id v229;
  void *v230;
  void *v231;
  uint64_t v232;
  id v233;
  id v234;
  void *v235;
  uint64_t v236;
  void *v237;
  void *v238;
  void *v239;
  _QWORD block[5];
  _QWORD v241[4];
  id v242;
  void *v243;
  id v244;
  id v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  _QWORD v286[4];
  id v287;
  _BYTE v288[128];
  _BYTE v289[128];
  _BYTE v290[128];
  _BYTE v291[128];
  _BYTE v292[128];
  _BYTE v293[128];
  _BYTE v294[128];
  uint64_t v295;
  _BYTE v296[128];
  uint64_t v297;
  uint64_t v298;
  _BYTE v299[128];
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  _BYTE v303[128];
  uint64_t v304;
  uint8_t buf[4];
  uint64_t v306;
  uint64_t v307;
  _QWORD v308[5];

  v308[2] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v231 = WeakRetained;
  if (objc_msgSend(WeakRetained, "performKeyFetchOnly"))
  {
    v14 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228A4E000, v14, OS_LOG_TYPE_DEFAULT, "Skipping actual download since performKeyFetchOnly is YES", buf, 2u);
    }
    v286[0] = MEMORY[0x24BDAC760];
    v286[1] = 3221225472;
    v286[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_163;
    v286[3] = &unk_24F15BEF8;
    v287 = v9;
    objc_msgSend(v287, "executeBlockAfterCurrentStateTransition:", v286);
    v15 = v287;
    v16 = v231;
    goto LABEL_205;
  }
  v219 = v9;
  v220 = v11;
  v17 = v10;
  objc_msgSend(WeakRetained, "mediaItemLoader");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "AVAsset");
  v19 = a1;
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x24BDB1C90]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x24BDB1CD8]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v235 = v20;
  objc_msgSend(v20, "options");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x24BDB2568];
  v24 = *MEMORY[0x24BDB1CD0];
  v236 = *MEMORY[0x24BDB1CC8];
  v308[0] = *MEMORY[0x24BDB1CC8];
  v308[1] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v308, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v222 = (void *)v22;
  objc_msgSend(v23, "mediaSelectionOptionsFromArray:withMediaCharacteristics:", v22, v25);
  v221 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "preferredMediaSelection");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v234 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v211 = v19;
  objc_msgSend(*(id *)(v19 + 32), "mediaItemLoader");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v25) = objc_msgSend(v27, "containsStreamingAVAsset");

  v226 = v21;
  v230 = v26;
  if (!(_DWORD)v25)
  {
    v42 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228A4E000, v42, OS_LOG_TYPE_DEFAULT, "Will download all media selections since download is CRABS", buf, 2u);
    }
    v43 = (id)MEMORY[0x24BDBD1A8];
    goto LABEL_188;
  }
  v215 = v15;
  v217 = v12;
  if (!v26)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR))
      __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_162_cold_2();
    v44 = (id)MEMORY[0x24BDBD1A8];
    goto LABEL_178;
  }
  v28 = v231;
  v29 = 0x24BDBC000uLL;
  if (objc_msgSend(v231, "includeDefaultAudioOption"))
  {
    v30 = (id)sLogObject_2;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228A4E000, v30, OS_LOG_TYPE_DEFAULT, "Including default audio option due to user preference", buf, 2u);
    }

    objc_msgSend(v234, "addObject:", v26);
    v28 = v231;
  }
  if (objc_msgSend(v28, "includeOriginalAudio"))
  {
    v31 = (id)sLogObject_2;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228A4E000, v31, OS_LOG_TYPE_DEFAULT, "Including original audio due to user preference", buf, 2u);
    }

    v32 = (void *)MEMORY[0x24BDB2568];
    v307 = *MEMORY[0x24BDB1CB0];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v307, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "mediaSelectionOptionsFromArray:withoutMediaCharacteristics:", v221, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = v231;
    objc_msgSend(v231, "_addMediaSelectionOptionsIfNotAlreadyAdded:toMediaSelections:forMediaSelectionGroup:baseMediaSelection:", v34, v234, v235, v26);

  }
  objc_msgSend(v28, "preferredAudioLanguageCodes");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v214 = (void *)objc_msgSend(v35, "mutableCopy");

  if (objc_msgSend(v28, "includeDeviceLanguageAudio"))
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "firstObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      v38 = v214;
      if (!v214)
        v38 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v214 = v38;
      v39 = objc_msgSend(v38, "containsObject:", v37);
      v40 = (id)sLogObject_2;
      v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
      if ((v39 & 1) != 0)
      {
        if (v41)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_228A4E000, v40, OS_LOG_TYPE_DEFAULT, "Device language already exists in preferred audio language codes", buf, 2u);
        }

      }
      else
      {
        if (v41)
        {
          *(_DWORD *)buf = 138412290;
          v306 = (uint64_t)v37;
          _os_log_impl(&dword_228A4E000, v40, OS_LOG_TYPE_DEFAULT, "Adding device language to preferred audio language codes: %@", buf, 0xCu);
        }

        objc_msgSend(v214, "insertObject:atIndex:", v37, 0);
      }
    }

  }
  v45 = (id)sLogObject_2;
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v306 = (uint64_t)v214;
    _os_log_impl(&dword_228A4E000, v45, OS_LOG_TYPE_DEFAULT, "Preferred audio language codes: %@", buf, 0xCu);
  }

  v212 = v17;
  if (objc_msgSend(v214, "count"))
  {
    v46 = (void *)MEMORY[0x24BDB2568];
    v304 = v236;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v304, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "mediaSelectionOptionsFromArray:withMediaCharacteristics:", v222, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v284 = 0u;
    v285 = 0u;
    v282 = 0u;
    v283 = 0u;
    v49 = v214;
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v282, v303, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v283;
      v53 = *MEMORY[0x24BDB1CB0];
      do
      {
        for (i = 0; i != v51; ++i)
        {
          if (*(_QWORD *)v283 != v52)
            objc_enumerationMutation(v49);
          v55 = (void *)MEMORY[0x24BDB2568];
          v302 = *(_QWORD *)(*((_QWORD *)&v282 + 1) + 8 * i);
          objc_msgSend(*(id *)(v29 + 3632), "arrayWithObjects:count:", &v302, 1);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "mediaSelectionOptionsFromArray:filteredAndSortedAccordingToPreferredLanguages:", v48, v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          v58 = (void *)MEMORY[0x24BDB2568];
          v301 = v53;
          objc_msgSend(*(id *)(v29 + 3632), "arrayWithObjects:count:", &v301, 1);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "mediaSelectionOptionsFromArray:withoutMediaCharacteristics:", v57, v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v60, "firstObject");
          v61 = objc_claimAutoreleasedReturnValue();
          v62 = (void *)v61;
          if (v61)
          {
            v300 = v61;
            objc_msgSend(*(id *)(v29 + 3632), "arrayWithObjects:count:", &v300, 1);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v231, "_addMediaSelectionOptionsIfNotAlreadyAdded:toMediaSelections:forMediaSelectionGroup:baseMediaSelection:", v63, v234, v235, v230);

            v29 = 0x24BDBC000;
          }

        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v282, v303, 16);
      }
      while (v51);
    }

    v17 = v212;
    v21 = v226;
    v26 = v230;
  }
  if (!objc_msgSend(v234, "count"))
  {
    v64 = (id)sLogObject_2;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228A4E000, v64, OS_LOG_TYPE_DEFAULT, "Including default audio option since none of user's preferred audio languages could be found", buf, 2u);
    }

    objc_msgSend(v234, "addObject:", v26);
  }
  v210 = MAAudibleMediaCopyPreferredCharacteristics();
  if (-[__CFArray containsObject:](v210, "containsObject:", *MEMORY[0x24BDDB940]))
  {
    v65 = (id)sLogObject_2;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228A4E000, v65, OS_LOG_TYPE_DEFAULT, "Audio descriptions accessibility pref is enabled", buf, 2u);
    }

    v66 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v278 = 0u;
    v279 = 0u;
    v280 = 0u;
    v281 = 0u;
    v67 = v234;
    v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v278, v299, 16);
    if (v68)
    {
      v69 = v68;
      v70 = *(_QWORD *)v279;
      do
      {
        for (j = 0; j != v69; ++j)
        {
          if (*(_QWORD *)v279 != v70)
            objc_enumerationMutation(v67);
          objc_msgSend(*(id *)(*((_QWORD *)&v278 + 1) + 8 * j), "selectedMediaOptionInMediaSelectionGroup:", v235);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "extendedLanguageTag");
          v73 = (void *)objc_claimAutoreleasedReturnValue();

          if (v73)
            objc_msgSend(v66, "addObject:", v73);

        }
        v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v278, v299, 16);
      }
      while (v69);
    }

    v74 = (void *)MEMORY[0x24BDB2568];
    v298 = v236;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v298, 1);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "mediaSelectionOptionsFromArray:withMediaCharacteristics:", v222, v75);
    v76 = objc_claimAutoreleasedReturnValue();

    v77 = (void *)MEMORY[0x24BDB2568];
    objc_msgSend(v66, "allObjects");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v237 = (void *)v76;
    objc_msgSend(v77, "mediaSelectionOptionsFromArray:filteredAndSortedAccordingToPreferredLanguages:", v76, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    v80 = (void *)MEMORY[0x24BDB2568];
    v297 = *MEMORY[0x24BDB1CB0];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v297, 1);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "mediaSelectionOptionsFromArray:withMediaCharacteristics:", v79, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    v276 = 0u;
    v277 = 0u;
    v274 = 0u;
    v275 = 0u;
    v83 = v82;
    v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v274, v296, 16);
    if (v84)
    {
      v85 = v84;
      v86 = *(_QWORD *)v275;
      do
      {
        for (k = 0; k != v85; ++k)
        {
          if (*(_QWORD *)v275 != v86)
            objc_enumerationMutation(v83);
          v88 = *(_QWORD *)(*((_QWORD *)&v274 + 1) + 8 * k);
          objc_msgSend(v67, "firstObject");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = (void *)objc_msgSend(v89, "mutableCopy");

          objc_msgSend(v90, "selectMediaOption:inMediaSelectionGroup:", v88, v235);
          objc_msgSend(v67, "addObject:", v90);

        }
        v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v274, v296, 16);
      }
      while (v85);
    }

    v17 = v212;
    v21 = v226;
    v29 = 0x24BDBC000uLL;
  }
  objc_msgSend(v21, "options");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v209 = v91;
  if (objc_msgSend(v231, "includesAllSubtitles"))
  {
    v92 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228A4E000, v92, OS_LOG_TYPE_DEFAULT, "Including all subtitles", buf, 2u);
    }
    v93 = v91;
    goto LABEL_170;
  }
  v229 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v233 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v94 = (void *)MEMORY[0x24BDB2568];
  v295 = *MEMORY[0x24BDB1CA0];
  objc_msgSend(*(id *)(v29 + 3632), "arrayWithObjects:count:", &v295, 1);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "mediaSelectionOptionsFromArray:withoutMediaCharacteristics:", v91, v95);
  v208 = (void *)objc_claimAutoreleasedReturnValue();

  v272 = 0u;
  v273 = 0u;
  v270 = 0u;
  v271 = 0u;
  v96 = v91;
  v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v270, v294, 16);
  if (v97)
  {
    v98 = v97;
    v99 = *(_QWORD *)v271;
    v100 = *MEMORY[0x24BDB1CF8];
    do
    {
      for (m = 0; m != v98; ++m)
      {
        if (*(_QWORD *)v271 != v99)
          objc_enumerationMutation(v96);
        v102 = *(void **)(*((_QWORD *)&v270 + 1) + 8 * m);
        objc_msgSend(v102, "mediaType");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = objc_msgSend(v103, "isEqualToString:", v100);

        if (v104)
          objc_msgSend(v233, "addObject:", v102);
      }
      v98 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v270, v294, 16);
    }
    while (v98);
  }

  v268 = 0u;
  v269 = 0u;
  v266 = 0u;
  v267 = 0u;
  v105 = v234;
  v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v266, v293, 16);
  v21 = v226;
  if (v106)
  {
    v107 = v106;
    v108 = *(_QWORD *)v267;
    do
    {
      for (n = 0; n != v107; ++n)
      {
        if (*(_QWORD *)v267 != v108)
          objc_enumerationMutation(v105);
        objc_msgSend(*(id *)(*((_QWORD *)&v266 + 1) + 8 * n), "selectedMediaOptionInMediaSelectionGroup:", v235);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "associatedMediaSelectionOptionInMediaSelectionGroup:", v226);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        if (v111)
          objc_msgSend(v233, "addObject:", v111);
        objc_msgSend(v110, "extendedLanguageTag");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        if (v112)
          objc_msgSend(v229, "addObject:", v112);

      }
      v107 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v266, v293, 16);
    }
    while (v107);
  }

  if (objc_msgSend(v214, "count"))
    objc_msgSend(v229, "addObjectsFromArray:", v214);
  v113 = (id)sLogObject_2;
  if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v306 = (uint64_t)v229;
    _os_log_impl(&dword_228A4E000, v113, OS_LOG_TYPE_DEFAULT, "Will look for subtitles that match preferred audio languages and audio languages being downloaded: %@", buf, 0xCu);
  }

  v114 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v262 = 0u;
  v263 = 0u;
  v264 = 0u;
  v265 = 0u;
  v115 = v221;
  v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v262, v292, 16);
  if (v116)
  {
    v117 = v116;
    v118 = *(_QWORD *)v263;
    do
    {
      for (ii = 0; ii != v117; ++ii)
      {
        if (*(_QWORD *)v263 != v118)
          objc_enumerationMutation(v115);
        objc_msgSend(*(id *)(*((_QWORD *)&v262 + 1) + 8 * ii), "extendedLanguageTag");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        if (v120)
          objc_msgSend(v114, "addObject:", v120);

      }
      v117 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v262, v292, 16);
    }
    while (v117);
  }

  v121 = (id)sLogObject_2;
  if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v306 = (uint64_t)v114;
    _os_log_impl(&dword_228A4E000, v121, OS_LOG_TYPE_DEFAULT, "Will look for subtitles that match original audio language: %@", buf, 0xCu);
  }

  objc_msgSend(v114, "allObjects");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v229, "addObjectsFromArray:", v122);

  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v123 = objc_claimAutoreleasedReturnValue();
  if (v123)
  {
    v124 = (id)sLogObject_2;
    if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v306 = v123;
      _os_log_impl(&dword_228A4E000, v124, OS_LOG_TYPE_DEFAULT, "Will look for subtitles that match device languages: %@", buf, 0xCu);
    }

    objc_msgSend(v229, "addObjectsFromArray:", v123);
  }
  objc_msgSend(v231, "preferredSubtitleLanguageCodes");
  v125 = (void *)objc_claimAutoreleasedReturnValue();

  v207 = (void *)v123;
  if (v125)
  {
    v126 = (id)sLogObject_2;
    if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v231, "preferredSubtitleLanguageCodes");
      v127 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v306 = (uint64_t)v127;
      _os_log_impl(&dword_228A4E000, v126, OS_LOG_TYPE_DEFAULT, "Will look for subtitles that match user's preferred subtitle languages: %@", buf, 0xCu);

    }
    objc_msgSend(v231, "preferredSubtitleLanguageCodes");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v229, "addObjectsFromArray:", v128);

  }
  if (objc_msgSend(v229, "containsObject:", CFSTR("yue")))
    objc_msgSend(v229, "addObject:", CFSTR("yue-Hant"));
  v129 = (id)sLogObject_2;
  if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v306 = (uint64_t)v229;
    _os_log_impl(&dword_228A4E000, v129, OS_LOG_TYPE_DEFAULT, "Final list of preferred subtitle languages: %@", buf, 0xCu);
  }

  v223 = 1;
  v130 = MACaptionAppearanceCopyPreferredCaptioningMediaCharacteristics(kMACaptionAppearanceDomainUser);
  if ((-[__CFArray containsObject:](v130, "containsObject:", *MEMORY[0x24BDDB938]) & 1) == 0)
    v223 = -[__CFArray containsObject:](v130, "containsObject:", *MEMORY[0x24BDDB948]);
  v206 = v130;
  v131 = (void *)MEMORY[0x24BDB2568];
  objc_msgSend(v229, "allObjects");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "mediaSelectionOptionsFromArray:filteredAndSortedAccordingToPreferredLanguages:", v208, v132);
  v133 = (void *)objc_claimAutoreleasedReturnValue();

  v134 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v135 = (id)sLogObject_2;
  if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
  {
    v136 = CFSTR("NO");
    if (v223)
      v136 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v306 = (uint64_t)v136;
    _os_log_impl(&dword_228A4E000, v135, OS_LOG_TYPE_DEFAULT, "Will prefer SDH subtitles: %@", buf, 0xCu);
  }

  v260 = 0u;
  v261 = 0u;
  v258 = 0u;
  v259 = 0u;
  v137 = v133;
  v232 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v258, v291, 16);
  if (v232)
  {
    v138 = *(_QWORD *)v259;
    v139 = *MEMORY[0x24BDB1D38];
    v224 = v134;
    v225 = v114;
    v227 = v137;
    v228 = *(_QWORD *)v259;
    do
    {
      for (jj = 0; jj != v232; ++jj)
      {
        if (*(_QWORD *)v259 != v138)
          objc_enumerationMutation(v137);
        v141 = *(void **)(*((_QWORD *)&v258 + 1) + 8 * jj);
        objc_msgSend(v141, "extendedLanguageTag");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v142)
          goto LABEL_167;
        v238 = v142;
        v143 = objc_msgSend(v134, "containsObject:", v142);
        v142 = v238;
        if ((v143 & 1) != 0)
          goto LABEL_167;
        objc_msgSend(v141, "mediaType");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        v145 = objc_msgSend(v144, "isEqualToString:", v139);

        v142 = v238;
        v138 = v228;
        if (!v145)
          goto LABEL_167;
        v256 = 0u;
        v257 = 0u;
        v254 = 0u;
        v255 = 0u;
        v146 = v137;
        v147 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v254, v290, 16);
        if (!v147)
        {
LABEL_147:

LABEL_163:
          objc_msgSend(v233, "addObject:", v141);
          v21 = v226;
          v137 = v227;
          v134 = v224;
          goto LABEL_166;
        }
        v148 = v147;
        v149 = *(_QWORD *)v255;
LABEL_137:
        v150 = 0;
        while (1)
        {
          if (*(_QWORD *)v255 != v149)
            objc_enumerationMutation(v146);
          v151 = *(void **)(*((_QWORD *)&v254 + 1) + 8 * v150);
          if (v151 == v141)
            goto LABEL_145;
          objc_msgSend(*(id *)(*((_QWORD *)&v254 + 1) + 8 * v150), "mediaType");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          v153 = objc_msgSend(v152, "isEqualToString:", v139);

          if (!v153)
            goto LABEL_145;
          objc_msgSend(v151, "extendedLanguageTag");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          v155 = v154;
          if (v154)
          {
            if ((objc_msgSend(v154, "isEqualToString:", v238) & 1) != 0)
              break;
          }

LABEL_145:
          if (v148 == ++v150)
          {
            v148 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v254, v290, 16);
            if (v148)
              goto LABEL_137;
            goto LABEL_147;
          }
        }
        v156 = v151;

        if (!v156)
          goto LABEL_163;
        v21 = v226;
        v137 = v227;
        v134 = v224;
        if (objc_msgSend(v141, "tvp_isSDHSubtitle") && (objc_msgSend(v156, "tvp_isSDHSubtitle") & 1) != 0
          || (objc_msgSend(v141, "tvp_isSDHSubtitle") & 1) == 0 && (objc_msgSend(v156, "tvp_isSDHSubtitle") & 1) == 0)
        {
          objc_msgSend(v233, "addObject:", v141);
          v137 = v227;
          objc_msgSend(v233, "addObject:", v156);
        }
        else
        {
          if (objc_msgSend(v141, "tvp_isSDHSubtitle"))
            v157 = v141;
          else
            v157 = v156;
          v158 = v157;
          if (objc_msgSend(v141, "tvp_isSDHSubtitle"))
            v159 = v156;
          else
            v159 = v141;
          v160 = v159;
          v161 = v160;
          if (v223)
            v162 = v158;
          else
            v162 = v160;
          objc_msgSend(v233, "addObject:", v162);

        }
LABEL_166:
        objc_msgSend(v134, "addObject:", v238);
        v142 = v238;
        v114 = v225;
        v138 = v228;
LABEL_167:

      }
      v232 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v258, v291, 16);
    }
    while (v232);
  }

  objc_msgSend(v233, "allObjects");
  v93 = (id)objc_claimAutoreleasedReturnValue();

  v17 = v212;
LABEL_170:
  v252 = 0u;
  v253 = 0u;
  v250 = 0u;
  v251 = 0u;
  v163 = v93;
  v164 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v250, v289, 16);
  if (v164)
  {
    v165 = v164;
    v166 = *(_QWORD *)v251;
    do
    {
      for (kk = 0; kk != v165; ++kk)
      {
        if (*(_QWORD *)v251 != v166)
          objc_enumerationMutation(v163);
        v168 = *(_QWORD *)(*((_QWORD *)&v250 + 1) + 8 * kk);
        objc_msgSend(v234, "firstObject");
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        v170 = (void *)objc_msgSend(v169, "mutableCopy");

        objc_msgSend(v170, "selectMediaOption:inMediaSelectionGroup:", v168, v21);
        objc_msgSend(v234, "addObject:", v170);

      }
      v165 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v250, v289, 16);
    }
    while (v165);
  }

  v44 = v234;
LABEL_178:
  v248 = 0u;
  v249 = 0u;
  v246 = 0u;
  v247 = 0u;
  v43 = v44;
  v171 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v246, v288, 16);
  if (v171)
  {
    v172 = v171;
    v173 = *(_QWORD *)v247;
    do
    {
      for (mm = 0; mm != v172; ++mm)
      {
        if (*(_QWORD *)v247 != v173)
          objc_enumerationMutation(v43);
        v175 = *(void **)(*((_QWORD *)&v246 + 1) + 8 * mm);
        v176 = (id)sLogObject_2;
        if (os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v175, "tvp_description");
          v177 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v306 = (uint64_t)v177;
          _os_log_impl(&dword_228A4E000, v176, OS_LOG_TYPE_DEFAULT, "Will download media selection: %@", buf, 0xCu);

        }
      }
      v172 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v246, v288, 16);
    }
    while (v172);
  }

  v15 = v215;
  v12 = v217;
  v21 = v226;
  v26 = v230;
LABEL_188:
  objc_msgSend(v231, "downloadTask");
  v178 = (void *)objc_claimAutoreleasedReturnValue();

  if (v178)
  {
    v179 = (id)sLogObject_2;
    if (os_log_type_enabled(v179, OS_LOG_TYPE_ERROR))
      __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_162_cold_1();
    v10 = v17;
    v9 = v219;
  }
  else
  {
    v218 = v12;
    v213 = v17;
    objc_msgSend(v231, "mediaItem");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v180, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataTitle"));
    v179 = objc_claimAutoreleasedReturnValue();

    v216 = v15;
    objc_msgSend(MEMORY[0x24BDB2388], "downloadConfigurationWithAsset:title:", v15, v179);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v231, "storageSettingsImageData");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v181, "setArtworkData:", v183);

    objc_msgSend(*(id *)(v211 + 32), "mediaItemLoader");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    v185 = objc_msgSend(v184, "containsStreamingAVAsset");

    if (v185)
    {
      v241[0] = MEMORY[0x24BDAC760];
      v241[1] = 3221225472;
      v241[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_176;
      v241[3] = &unk_24F15C100;
      v242 = v235;
      v243 = v231;
      v186 = v181;
      v244 = v186;
      v187 = v182;
      v245 = v187;
      objc_msgSend(v43, "enumerateObjectsUsingBlock:", v241);
      objc_msgSend(v186, "setAuxiliaryContentConfigurations:", v187);

    }
    v239 = v182;
    objc_msgSend(v231, "downloadSession");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "assetDownloadTaskWithConfiguration:", v181);
    v189 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v231, "setStorageSettingsImageData:", 0);
    v190 = (id)sLogObject_2;
    if (os_log_type_enabled(v190, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v306 = (uint64_t)v189;
      _os_log_impl(&dword_228A4E000, v190, OS_LOG_TYPE_DEFAULT, "Created download task %@", buf, 0xCu);
    }

    v191 = v231;
    objc_msgSend(v231, "downloadSession");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v192, "registerDownloadTask:forDownload:", v189, v231);

    objc_msgSend(v231, "setDownloadTask:", v189);
    objc_msgSend(v189, "addObserver:forKeyPath:options:context:", v231, CFSTR("progress.fractionCompleted"), 0, __DownloadTaskProgressKVOContext);
    objc_msgSend(v231, "setAddedProgressObserver:", 1);
    objc_msgSend(v231, "delegates");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    v194 = objc_msgSend(v193, "count");

    if (v194)
    {
      v195 = 0;
      do
      {
        objc_msgSend(v191, "delegates");
        v196 = (void *)objc_claimAutoreleasedReturnValue();
        v197 = (void *)objc_msgSend(v196, "pointerAtIndex:", v195);

        if (v197)
        {
          v198 = v197;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v189, "taskIdentifier"));
            v199 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v198, "download:didReceiveTaskIdentifier:", v231, v199);

          }
        }
        ++v195;
        v191 = v231;
        objc_msgSend(v231, "delegates");
        v200 = (void *)objc_claimAutoreleasedReturnValue();
        v201 = objc_msgSend(v200, "count");

      }
      while (v195 < v201);
    }

    v12 = v218;
    v9 = v219;
    v10 = v213;
    v15 = v216;
    v21 = v226;
    v26 = v230;
  }

  v16 = v231;
  objc_msgSend(v231, "downloadTask");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v202, "resume");

  v203 = MEMORY[0x24BDAC9B8];
  v204 = MEMORY[0x24BDAC9B8];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_182;
  block[3] = &unk_24F15BEF8;
  block[4] = v231;
  dispatch_async(v203, block);

  v11 = v220;
LABEL_205:

  return CFSTR("Downloading");
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_163(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:", CFSTR("Download task did complete"));
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_176(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "selectedMediaOptionInMediaSelectionGroup:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_variantQualifiersForCurrentSettingsAndAudioOption:useMultichannelAudio:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_variantQualifiersForCurrentSettingsAndAudioOption:useMultichannelAudio:", v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDB2390]);
    objc_msgSend(v9, "setVariantQualifiers:", v7);
    v18 = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMediaSelections:", v10);

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v9);
    if (objc_msgSend(*(id *)(a1 + 40), "allowMultichannelAudio")
      && (objc_msgSend(*(id *)(a1 + 40), "limitMultichannelAudioToSingleLanguage") & 1) == 0)
    {
      v11 = objc_alloc_init(MEMORY[0x24BDB2390]);
      objc_msgSend(v11, "setVariantQualifiers:", v8);
      v17 = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setMediaSelections:", v12);

      objc_msgSend(*(id *)(a1 + 56), "addObject:", v11);
    }
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 48), "primaryContentConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setVariantQualifiers:", v7);

  objc_msgSend(*(id *)(a1 + 48), "primaryContentConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMediaSelections:", v15);

  if (objc_msgSend(*(id *)(a1 + 40), "allowMultichannelAudio"))
  {
    v9 = objc_alloc_init(MEMORY[0x24BDB2390]);
    objc_msgSend(v9, "setVariantQualifiers:", v8);
    v19 = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMediaSelections:", v16);

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v9);
LABEL_7:

  }
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_182(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  result = objc_msgSend(*(id *)(a1 + 32), "downloadInitiationBackgroundTask");
  v3 = *MEMORY[0x24BDF7608];
  if (result != *MEMORY[0x24BDF7608])
  {
    v4 = (void *)sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 32);
      v6 = v4;
      v8 = 134217984;
      v9 = objc_msgSend(v5, "downloadInitiationBackgroundTask");
      _os_log_impl(&dword_228A4E000, v6, OS_LOG_TYPE_DEFAULT, "Ending download initiation background task with identifier %lu", (uint8_t *)&v8, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endBackgroundTask:", objc_msgSend(*(id *)(a1 + 32), "downloadInitiationBackgroundTask"));

    return objc_msgSend(*(id *)(a1 + 32), "setDownloadInitiationBackgroundTask:", v3);
  }
  return result;
}

id __44__TVPDownload__registerStateMachineHandlers__block_invoke_183(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a4;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR))
    __44__TVPDownload__registerStateMachineHandlers__block_invoke_183_cold_1();
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __44__TVPDownload__registerStateMachineHandlers__block_invoke_185;
  v14 = &unk_24F15BCB0;
  v15 = v5;
  v16 = v6;
  v7 = v6;
  v8 = v5;
  objc_msgSend(v8, "executeBlockAfterCurrentStateTransition:", &v11);
  objc_msgSend(v8, "currentState", v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_185(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:withContext:", CFSTR("Error did occur"), *(_QWORD *)(a1 + 40));
}

__CFString *__44__TVPDownload__registerStateMachineHandlers__block_invoke_2_186(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  __CFString *v14;
  id WeakRetained;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v11;
  objc_msgSend(v9, "currentState");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_4_188;
    v17[3] = &unk_24F15BCB0;
    v18 = v9;
    v19 = v13;
    objc_msgSend(v18, "executeBlockAfterCurrentStateTransition:", v17);

    WeakRetained = v18;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (objc_msgSend(WeakRetained, "_anyDelegateRespondsToProcessFinishedDownload"))
    {

      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_3_187;
      v20[3] = &unk_24F15C170;
      objc_copyWeak(&v21, (id *)(a1 + 40));
      objc_msgSend(WeakRetained, "_processFinishedDownloadWithCompletion:", v20);
      objc_destroyWeak(&v21);
      v14 = CFSTR("Processing finished download");
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

      v14 = CFSTR("Download complete");
    }
  }

  return v14;
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_3_187(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postEvent:withContext:", CFSTR("Did process finished download"), v3);

}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_4_188(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:withContext:", CFSTR("Error did occur"), *(_QWORD *)(a1 + 40));
}

id __44__TVPDownload__registerStateMachineHandlers__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  dispatch_time_t v4;
  id v5;
  void *v6;
  _QWORD block[4];
  id v9;
  uint8_t buf[16];

  v2 = a2;
  v3 = sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228A4E000, v3, OS_LOG_TYPE_DEFAULT, "Task is now completed.  Delaying failure to give task a chance to clean up", buf, 2u);
  }
  v4 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_190;
  block[3] = &unk_24F15BEF8;
  v9 = v2;
  v5 = v2;
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);
  objc_msgSend(v5, "currentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_190(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:", CFSTR("Termination delay did finish"));
}

__CFString *__44__TVPDownload__registerStateMachineHandlers__block_invoke_2_191(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  __CFString *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a2;
  v7 = a4;
  objc_msgSend(v6, "currentState");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_3_192;
    v10[3] = &unk_24F15BCB0;
    v11 = v6;
    v12 = v7;
    objc_msgSend(v11, "executeBlockAfterCurrentStateTransition:", v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    v8 = CFSTR("Download complete");
  }

  return v8;
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_3_192(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:withContext:", CFSTR("Error did occur"), *(_QWORD *)(a1 + 40));
}

const __CFString *__44__TVPDownload__registerStateMachineHandlers__block_invoke_4_193(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  dispatch_time_t v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD block[4];
  id v20;
  uint8_t buf[16];

  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setError:", v7);

  objc_msgSend(WeakRetained, "downloadTask");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(WeakRetained, "downloadTask");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "state");

    v12 = sLogObject_2;
    v13 = os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT);
    if (v11 == 3)
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_228A4E000, v12, OS_LOG_TYPE_DEFAULT, "Task exists and is completed.  Delaying download termination to give task a chance to clean up", buf, 2u);
      }
      v14 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_194;
      block[3] = &unk_24F15BEF8;
      v20 = v6;
      dispatch_after(v14, MEMORY[0x24BDAC9B8], block);
      v15 = v20;
    }
    else
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_228A4E000, v12, OS_LOG_TYPE_DEFAULT, "Task exists but is not completed.  Cancelling task and waiting for didCompleteWithError", buf, 2u);
      }
      objc_msgSend(WeakRetained, "downloadTask");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "cancel");
    }
  }
  else
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_195;
    v17[3] = &unk_24F15BEF8;
    v18 = v6;
    objc_msgSend(v18, "executeBlockAfterCurrentStateTransition:", v17);
    v15 = v18;
  }

  return CFSTR("Terminating");
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_194(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:", CFSTR("Termination delay did finish"));
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_195(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:", CFSTR("Termination delay did finish"));
}

const __CFString *__44__TVPDownload__registerStateMachineHandlers__block_invoke_2_196(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  const __CFString *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = CFSTR("Failed");
  else
    v4 = CFSTR("Cancelled");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v4;
}

- (TVPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItem, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)performKeyFetchOnly
{
  return self->_performKeyFetchOnly;
}

- (void)setPerformKeyFetchOnly:(BOOL)a3
{
  self->_performKeyFetchOnly = a3;
}

- (BOOL)allowCellularUsage
{
  return self->_allowCellularUsage;
}

- (void)setAllowCellularUsage:(BOOL)a3
{
  self->_allowCellularUsage = a3;
}

- (BOOL)preferMostCompatibleRendition
{
  return self->_preferMostCompatibleRendition;
}

- (void)setPreferMostCompatibleRendition:(BOOL)a3
{
  self->_preferMostCompatibleRendition = a3;
}

- (NSNumber)maximumPresentationWidth
{
  return self->_maximumPresentationWidth;
}

- (void)setMaximumPresentationWidth:(id)a3
{
  objc_storeStrong((id *)&self->_maximumPresentationWidth, a3);
}

- (NSNumber)maximumAverageBitrateForHDR
{
  return self->_maximumAverageBitrateForHDR;
}

- (void)setMaximumAverageBitrateForHDR:(id)a3
{
  objc_storeStrong((id *)&self->_maximumAverageBitrateForHDR, a3);
}

- (NSNumber)maximumAverageBitrateForSDRHEVC
{
  return self->_maximumAverageBitrateForSDRHEVC;
}

- (void)setMaximumAverageBitrateForSDRHEVC:(id)a3
{
  objc_storeStrong((id *)&self->_maximumAverageBitrateForSDRHEVC, a3);
}

- (NSNumber)maximumAverageBitrateForAVC
{
  return self->_maximumAverageBitrateForAVC;
}

- (void)setMaximumAverageBitrateForAVC:(id)a3
{
  objc_storeStrong((id *)&self->_maximumAverageBitrateForAVC, a3);
}

- (BOOL)prefer3DOrImmersiveDownload
{
  return self->_prefer3DOrImmersiveDownload;
}

- (void)setPrefer3DOrImmersiveDownload:(BOOL)a3
{
  self->_prefer3DOrImmersiveDownload = a3;
}

- (NSNumber)maximumPresentationWidthForImmersive
{
  return self->_maximumPresentationWidthForImmersive;
}

- (void)setMaximumPresentationWidthForImmersive:(id)a3
{
  objc_storeStrong((id *)&self->_maximumPresentationWidthForImmersive, a3);
}

- (NSNumber)maximumAverageBitrateForImmersive
{
  return self->_maximumAverageBitrateForImmersive;
}

- (void)setMaximumAverageBitrateForImmersive:(id)a3
{
  objc_storeStrong((id *)&self->_maximumAverageBitrateForImmersive, a3);
}

- (NSNumber)maximumPresentationWidthFor3D
{
  return self->_maximumPresentationWidthFor3D;
}

- (void)setMaximumPresentationWidthFor3D:(id)a3
{
  objc_storeStrong((id *)&self->_maximumPresentationWidthFor3D, a3);
}

- (NSNumber)maximumAverageBitrateForHDR3D
{
  return self->_maximumAverageBitrateForHDR3D;
}

- (void)setMaximumAverageBitrateForHDR3D:(id)a3
{
  objc_storeStrong((id *)&self->_maximumAverageBitrateForHDR3D, a3);
}

- (NSNumber)maximumAverageBitrateForSDR3D
{
  return self->_maximumAverageBitrateForSDR3D;
}

- (void)setMaximumAverageBitrateForSDR3D:(id)a3
{
  objc_storeStrong((id *)&self->_maximumAverageBitrateForSDR3D, a3);
}

- (NSNumber)maximumAverageBitrateForHDR3D48FPS
{
  return self->_maximumAverageBitrateForHDR3D48FPS;
}

- (void)setMaximumAverageBitrateForHDR3D48FPS:(id)a3
{
  objc_storeStrong((id *)&self->_maximumAverageBitrateForHDR3D48FPS, a3);
}

- (NSNumber)maximumAverageBitrateForSDR3D48FPS
{
  return self->_maximumAverageBitrateForSDR3D48FPS;
}

- (void)setMaximumAverageBitrateForSDR3D48FPS:(id)a3
{
  objc_storeStrong((id *)&self->_maximumAverageBitrateForSDR3D48FPS, a3);
}

- (BOOL)allowMultichannelAudio
{
  return self->_allowMultichannelAudio;
}

- (void)setAllowMultichannelAudio:(BOOL)a3
{
  self->_allowMultichannelAudio = a3;
}

- (BOOL)limitMultichannelAudioToSingleLanguage
{
  return self->_limitMultichannelAudioToSingleLanguage;
}

- (void)setLimitMultichannelAudioToSingleLanguage:(BOOL)a3
{
  self->_limitMultichannelAudioToSingleLanguage = a3;
}

- (BOOL)includeDefaultAudioOption
{
  return self->_includeDefaultAudioOption;
}

- (void)setIncludeDefaultAudioOption:(BOOL)a3
{
  self->_includeDefaultAudioOption = a3;
}

- (BOOL)includeOriginalAudio
{
  return self->_includeOriginalAudio;
}

- (void)setIncludeOriginalAudio:(BOOL)a3
{
  self->_includeOriginalAudio = a3;
}

- (BOOL)includeDeviceLanguageAudio
{
  return self->_includeDeviceLanguageAudio;
}

- (void)setIncludeDeviceLanguageAudio:(BOOL)a3
{
  self->_includeDeviceLanguageAudio = a3;
}

- (NSArray)preferredAudioLanguageCodes
{
  return self->_preferredAudioLanguageCodes;
}

- (void)setPreferredAudioLanguageCodes:(id)a3
{
  objc_storeStrong((id *)&self->_preferredAudioLanguageCodes, a3);
}

- (BOOL)includesAllSubtitles
{
  return self->_includesAllSubtitles;
}

- (void)setIncludesAllSubtitles:(BOOL)a3
{
  self->_includesAllSubtitles = a3;
}

- (NSArray)preferredSubtitleLanguageCodes
{
  return self->_preferredSubtitleLanguageCodes;
}

- (void)setPreferredSubtitleLanguageCodes:(id)a3
{
  objc_storeStrong((id *)&self->_preferredSubtitleLanguageCodes, a3);
}

- (NSData)storageSettingsImageData
{
  return self->_storageSettingsImageData;
}

- (void)setStorageSettingsImageData:(id)a3
{
  objc_storeStrong((id *)&self->_storageSettingsImageData, a3);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (TVPStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (TVPMediaItemLoader)mediaItemLoader
{
  return self->_mediaItemLoader;
}

- (void)setMediaItemLoader:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItemLoader, a3);
}

- (TVPDownloadSession)downloadSession
{
  return (TVPDownloadSession *)objc_loadWeakRetained((id *)&self->_downloadSession);
}

- (void)setDownloadSession:(id)a3
{
  objc_storeWeak((id *)&self->_downloadSession, a3);
}

- (AVAssetDownloadTask)downloadTask
{
  return self->_downloadTask;
}

- (void)setDownloadTask:(id)a3
{
  objc_storeStrong((id *)&self->_downloadTask, a3);
}

- (NSPointerArray)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_delegates, a3);
}

- (double)lastDownloadProgressFractionCompleted
{
  return self->_lastDownloadProgressFractionCompleted;
}

- (void)setLastDownloadProgressFractionCompleted:(double)a3
{
  self->_lastDownloadProgressFractionCompleted = a3;
}

- (unint64_t)downloadInitiationBackgroundTask
{
  return self->_downloadInitiationBackgroundTask;
}

- (void)setDownloadInitiationBackgroundTask:(unint64_t)a3
{
  self->_downloadInitiationBackgroundTask = a3;
}

- (unint64_t)downloadTerminationBackgroundTask
{
  return self->_downloadTerminationBackgroundTask;
}

- (void)setDownloadTerminationBackgroundTask:(unint64_t)a3
{
  self->_downloadTerminationBackgroundTask = a3;
}

- (TVPReportingSession)reportingSession
{
  return self->_reportingSession;
}

- (void)setReportingSession:(id)a3
{
  objc_storeStrong((id *)&self->_reportingSession, a3);
}

- (BOOL)addedMediaItemLoaderStateObserver
{
  return self->_addedMediaItemLoaderStateObserver;
}

- (void)setAddedMediaItemLoaderStateObserver:(BOOL)a3
{
  self->_addedMediaItemLoaderStateObserver = a3;
}

- (BOOL)addedProgressObserver
{
  return self->_addedProgressObserver;
}

- (void)setAddedProgressObserver:(BOOL)a3
{
  self->_addedProgressObserver = a3;
}

- (NSError)startError
{
  return self->_startError;
}

- (void)setStartError:(id)a3
{
  objc_storeStrong((id *)&self->_startError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startError, 0);
  objc_storeStrong((id *)&self->_reportingSession, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_downloadTask, 0);
  objc_destroyWeak((id *)&self->_downloadSession);
  objc_storeStrong((id *)&self->_mediaItemLoader, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_storageSettingsImageData, 0);
  objc_storeStrong((id *)&self->_preferredSubtitleLanguageCodes, 0);
  objc_storeStrong((id *)&self->_preferredAudioLanguageCodes, 0);
  objc_storeStrong((id *)&self->_maximumAverageBitrateForSDR3D48FPS, 0);
  objc_storeStrong((id *)&self->_maximumAverageBitrateForHDR3D48FPS, 0);
  objc_storeStrong((id *)&self->_maximumAverageBitrateForSDR3D, 0);
  objc_storeStrong((id *)&self->_maximumAverageBitrateForHDR3D, 0);
  objc_storeStrong((id *)&self->_maximumPresentationWidthFor3D, 0);
  objc_storeStrong((id *)&self->_maximumAverageBitrateForImmersive, 0);
  objc_storeStrong((id *)&self->_maximumPresentationWidthForImmersive, 0);
  objc_storeStrong((id *)&self->_maximumAverageBitrateForAVC, 0);
  objc_storeStrong((id *)&self->_maximumAverageBitrateForSDRHEVC, 0);
  objc_storeStrong((id *)&self->_maximumAverageBitrateForHDR, 0);
  objc_storeStrong((id *)&self->_maximumPresentationWidth, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
}

- (void)URLSession:task:didCompleteWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_228A4E000, v0, v1, "Unable to begin download termination background task since identifier is UIBackgroundTaskInvalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)URLSession:task:didCompleteWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_228A4E000, v0, v1, "Not beginning download termination background task since one already exists.  This is not expected to ever happen.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __52__TVPDownload_URLSession_task_didCompleteWithError___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = OUTLINED_FUNCTION_4(a1, a2);
  objc_msgSend(v2, "downloadTerminationBackgroundTask");
  OUTLINED_FUNCTION_3(&dword_228A4E000, v4, v5, "Download termination background task with identifier %lu expired.  This is not expected to ever happen.  Ending background task", v6, v7, v8, v9, 0);

  OUTLINED_FUNCTION_5();
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_92_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_228A4E000, v0, v1, "Unable to create media item loader", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_92_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_228A4E000, v0, v1, "Unable to begin download initiation background task since identifier is UIBackgroundTaskInvalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_92_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_228A4E000, v0, v1, "Not beginning download initiation background task since one already exists.  This is not expected to ever happen.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_95_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = OUTLINED_FUNCTION_4(a1, a2);
  objc_msgSend(v2, "downloadInitiationBackgroundTask");
  OUTLINED_FUNCTION_3(&dword_228A4E000, v4, v5, "Download initiation background task with identifier %lu expired.  Ending background task", v6, v7, v8, v9, 0);

  OUTLINED_FUNCTION_5();
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_162_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_228A4E000, v0, v1, "Download task already exists, but there shouldn't be one yet.  This isn't supposed to happen", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_162_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_228A4E000, v0, v1, "preferredMediaSelection does not exist", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_183_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_228A4E000, v0, v1, "Received task did complete while in an invalid state.  Posting error event.  This is never expected to happen.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
