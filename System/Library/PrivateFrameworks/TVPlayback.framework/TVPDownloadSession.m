@implementation TVPDownloadSession

void __58__TVPDownloadSession_initializeWithDownloadingMediaItems___block_invoke_5(id *a1)
{
  void *v1;
  id v2;
  NSObject *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  TVPDownload *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  id obj;
  id v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54;
  _BYTE v55[15];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[4];
  uint64_t v66;
  __int16 v67;
  void *v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v1 = (void *)sLogObject_3;
  if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
  {
    v2 = a1[4];
    v3 = v1;
    *(_DWORD *)buf = 134217984;
    v66 = objc_msgSend(v2, "count");
    _os_log_impl(&dword_228A4E000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to rebuild %lu downloading media item(s)", buf, 0xCu);

  }
  v4 = (void *)sLogObject_3;
  if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[5];
    v6 = v4;
    v7 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 134217984;
    v66 = v7;
    _os_log_impl(&dword_228A4E000, v6, OS_LOG_TYPE_DEFAULT, "Found %lu existing download task(s)", buf, 0xCu);

  }
  v48 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", a1[5]);
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v9 = a1[5];
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v61 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v14, "taskIdentifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v14, v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    }
    while (v11);
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = a1[4];
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v57;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v57 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v19);
        objc_msgSend(v20, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataDownloadTaskIdentifier"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v21)
        {
          v27 = sLogObject_3;
          if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v66 = (uint64_t)v20;
            v28 = v27;
            v29 = "No saved download task identifier exists for media item %@";
            goto LABEL_39;
          }
LABEL_28:
          v24 = 0;
          goto LABEL_32;
        }
        objc_msgSend(v8, "objectForKey:", v21);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = sLogObject_3;
        if (!v22)
        {
          if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v66 = (uint64_t)v20;
            v28 = v23;
            v29 = "No download task exists for media item %@";
LABEL_39:
            _os_log_error_impl(&dword_228A4E000, v28, OS_LOG_TYPE_ERROR, v29, buf, 0xCu);
          }
          goto LABEL_28;
        }
        v24 = (void *)v22;
        if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v66 = (uint64_t)v20;
          v67 = 2112;
          v68 = v24;
          _os_log_impl(&dword_228A4E000, v23, OS_LOG_TYPE_DEFAULT, "For previously downloading media item %@, found existing download task %@", buf, 0x16u);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v24, "URLAsset");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = sLogObject_3;
          if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v66 = (uint64_t)v25;
            _os_log_impl(&dword_228A4E000, v26, OS_LOG_TYPE_DEFAULT, "Download task's AVAsset is %@", buf, 0xCu);
          }

        }
        else
        {
          v30 = sLogObject_3;
          if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_228A4E000, v30, OS_LOG_TYPE_DEFAULT, "Weird, download task isn't of type AVAssetDownloadTask.  This shouldn't happen.  Allowing download to continue anyway.", buf, 2u);
          }
        }
        objc_msgSend(v46, "removeObject:", v24);
LABEL_32:
        v31 = -[TVPDownload initWithMediaItem:downloadSession:existingDownloadTask:]([TVPDownload alloc], "initWithMediaItem:downloadSession:existingDownloadTask:", v20, a1[6], v24);
        objc_msgSend(v48, "addObject:", v31);
        if (!v24)
        {
          v32 = sLogObject_3;
          if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_ERROR))
            __58__TVPDownloadSession_initializeWithDownloadingMediaItems___block_invoke_5_cold_1(&v54, v55, v32);
          v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), 829, 0);
          -[TVPDownload setStartError:](v31, "setStartError:", v33);

        }
        ++v19;
      }
      while (v17 != v19);
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
      v17 = v34;
    }
    while (v34);
  }

  v35 = (void *)sLogObject_3;
  if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
  {
    v36 = v35;
    v37 = objc_msgSend(v46, "count");
    *(_DWORD *)buf = 134217984;
    v66 = v37;
    _os_log_impl(&dword_228A4E000, v36, OS_LOG_TYPE_DEFAULT, "Found %lu task(s) that don't belong to any media items", buf, 0xCu);

  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v38 = v46;
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v51 != v41)
          objc_enumerationMutation(v38);
        v43 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
        v44 = sLogObject_3;
        if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v66 = (uint64_t)v43;
          _os_log_impl(&dword_228A4E000, v44, OS_LOG_TYPE_DEFAULT, "Cancelling leftover task %@", buf, 0xCu);
        }
        objc_msgSend(v43, "cancel");
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
    }
    while (v40);
  }

  objc_msgSend(a1[6], "delegate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "downloadSession:didAddRestoredDownloads:", a1[6], v48);

}

- (TVPDownloadSessionDelegate)delegate
{
  return (TVPDownloadSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

void __58__TVPDownloadSession_initializeWithDownloadingMediaItems___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "setDownloadSession:", *(_QWORD *)(a1 + 40));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__TVPDownloadSession_initializeWithDownloadingMediaItems___block_invoke_4;
  v5[3] = &unk_24F15D1E0;
  v2 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "getAllTasksWithCompletionHandler:", v5);

}

- (void)setDownloadSession:(id)a3
{
  objc_storeStrong((id *)&self->_downloadSession, a3);
}

+ (TVPDownloadSession)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_11);
  return (TVPDownloadSession *)(id)sharedInstance_instance;
}

void __58__TVPDownloadSession_initializeWithDownloadingMediaItems___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDD1858], "backgroundSessionConfigurationWithIdentifier:", CFSTR("com.apple.TVPlayback Video download background session"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDB23A0];
  v4 = a1[4];
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sessionWithConfiguration:assetDownloadDelegate:delegateQueue:", v2, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__TVPDownloadSession_initializeWithDownloadingMediaItems___block_invoke_3;
  block[3] = &unk_24F15D1B8;
  v7 = (void *)a1[6];
  block[4] = a1[5];
  v10 = v6;
  v11 = v7;
  v8 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __36__TVPDownloadSession_sharedInstance__block_invoke()
{
  os_log_t v0;
  void *v1;
  TVPDownloadSession *v2;
  void *v3;

  v0 = os_log_create("com.apple.AppleTV.playback", "TVPDownloadSession");
  v1 = (void *)sLogObject_3;
  sLogObject_3 = (uint64_t)v0;

  v2 = objc_alloc_init(TVPDownloadSession);
  v3 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v2;

}

- (TVPDownloadSession)init
{
  TVPDownloadSession *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *taskIDsToDownloads;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TVPDownloadSession;
  v2 = -[TVPDownloadSession init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    taskIDsToDownloads = v2->_taskIDsToDownloads;
    v2->_taskIDsToDownloads = v3;

  }
  return v2;
}

void __58__TVPDownloadSession_initializeWithDownloadingMediaItems___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__TVPDownloadSession_initializeWithDownloadingMediaItems___block_invoke_5;
  v5[3] = &unk_24F15D1B8;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = *(_QWORD *)(a1 + 40);
  v4 = v3;
  TVPPerformBlockOnMainThreadIfNeeded(v5);

}

void __58__TVPDownloadSession_initializeWithDownloadingMediaItems___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  _QWORD block[6];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = dispatch_queue_create("com.apple.TVPBackgroundDownloadSession", 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__TVPDownloadSession_initializeWithDownloadingMediaItems___block_invoke_2;
  block[3] = &unk_24F15D1B8;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = WeakRetained;
  v6 = v4;
  dispatch_async(v3, block);

}

- (void)initializeWithDownloadingMediaItems:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__TVPDownloadSession_initializeWithDownloadingMediaItems___block_invoke;
  v7[3] = &unk_24F15C738;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v5 = initializeWithDownloadingMediaItems__onceToken;
  v6 = v4;
  if (v5 != -1)
    dispatch_once(&initializeWithDownloadingMediaItems__onceToken, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)downloadForMediaItem:(id)a3
{
  id v4;
  TVPDownload *v5;

  v4 = a3;
  v5 = -[TVPDownload initWithMediaItem:downloadSession:existingDownloadTask:]([TVPDownload alloc], "initWithMediaItem:downloadSession:existingDownloadTask:", v4, self, 0);

  return v5;
}

- (id)assetDownloadTaskWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TVPDownloadSession downloadSession](self, "downloadSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetDownloadTaskWithConfiguration:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)registerDownloadTask:(id)a3 forDownload:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "taskIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPDownloadSession taskIDsToDownloads](self, "taskIDsToDownloads");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = sLogObject_3;
      if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_ERROR))
        -[TVPDownloadSession registerDownloadTask:forDownload:].cold.1(v12, v13, v14);
    }
    else
    {
      -[TVPDownloadSession taskIDsToDownloads](self, "taskIDsToDownloads");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v8, v9);

    }
  }
  else
  {
    v15 = sLogObject_3;
    if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_ERROR))
      -[TVPDownloadSession registerDownloadTask:forDownload:].cold.2(v15, v16, v17);
  }

}

- (void)unregisterDownloadTaskForDownload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v11[16];
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  if (v4)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__2;
    v19 = __Block_byref_object_dispose__2;
    v20 = 0;
    -[TVPDownloadSession taskIDsToDownloads](self, "taskIDsToDownloads");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __56__TVPDownloadSession_unregisterDownloadTaskForDownload___block_invoke;
    v12[3] = &unk_24F15D208;
    v13 = v4;
    v14 = &v15;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v12);

    if (v16[5])
    {
      -[TVPDownloadSession taskIDsToDownloads](self, "taskIDsToDownloads");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObjectForKey:", v16[5]);

    }
    else
    {
      v10 = sLogObject_3;
      if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_228A4E000, v10, OS_LOG_TYPE_DEFAULT, "Unable to unregister task for download because no task is registered for it", v11, 2u);
      }
    }

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v7 = sLogObject_3;
    if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_ERROR))
      -[TVPDownloadSession unregisterDownloadTaskForDownload:].cold.1(v7, v8, v9);
  }

}

void __56__TVPDownloadSession_unregisterDownloadTaskForDownload___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v8 = *(void **)(a1 + 32);
  v9 = a3;
  objc_msgSend(v8, "mediaItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = objc_msgSend(v10, "isEqualToMediaItem:", v11);
  if ((_DWORD)v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 willDownloadToURL:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19[2];
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __69__TVPDownloadSession_URLSession_assetDownloadTask_willDownloadToURL___block_invoke;
  v15[3] = &unk_24F15C648;
  objc_copyWeak(v19, &location);
  v12 = v10;
  v16 = v12;
  v19[1] = (id)a2;
  v13 = v9;
  v17 = v13;
  v14 = v11;
  v18 = v14;
  TVPPerformBlockOnMainThreadIfNeeded(v15);

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

}

void __69__TVPDownloadSession_URLSession_assetDownloadTask_willDownloadToURL___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "taskIDsToDownloads");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "taskIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_2559EC0F8)
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "URLSession:assetDownloadTask:willDownloadToURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    }
  }
  else
  {
    v6 = (void *)sLogObject_3;
    if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(const char **)(a1 + 64);
      v8 = v6;
      NSStringFromSelector(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_228A4E000, v8, OS_LOG_TYPE_DEFAULT, "Unable to find download for task in %@", (uint8_t *)&v10, 0xCu);

    }
  }

}

- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 willDownloadVariants:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19[2];
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __72__TVPDownloadSession_URLSession_assetDownloadTask_willDownloadVariants___block_invoke;
  v15[3] = &unk_24F15C648;
  objc_copyWeak(v19, &location);
  v12 = v10;
  v16 = v12;
  v19[1] = (id)a2;
  v13 = v9;
  v17 = v13;
  v14 = v11;
  v18 = v14;
  TVPPerformBlockOnMainThreadIfNeeded(v15);

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

}

void __72__TVPDownloadSession_URLSession_assetDownloadTask_willDownloadVariants___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "taskIDsToDownloads");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "taskIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_2559EC088)
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "URLSession:assetDownloadTask:willDownloadVariants:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    }
  }
  else
  {
    v6 = (void *)sLogObject_3;
    if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(const char **)(a1 + 64);
      v8 = v6;
      NSStringFromSelector(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_228A4E000, v8, OS_LOG_TYPE_DEFAULT, "Unable to find download for task in %@", (uint8_t *)&v10, 0xCu);

    }
  }

}

- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 didLoadTimeRange:(id *)a5 totalTimeRangesLoaded:(id)a6 timeRangeExpectedToLoad:(id *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  __int128 v18;
  id v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25[2];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id location;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  objc_initWeak(&location, self);
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __114__TVPDownloadSession_URLSession_assetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad___block_invoke;
  v21[3] = &unk_24F15D230;
  objc_copyWeak(v25, &location);
  v16 = v14;
  v22 = v16;
  v25[1] = (id)a2;
  v17 = v13;
  v23 = v17;
  v18 = *(_OWORD *)&a5->var0.var3;
  v26 = *(_OWORD *)&a5->var0.var0;
  v27 = v18;
  v28 = *(_OWORD *)&a5->var1.var1;
  v19 = v15;
  v24 = v19;
  v20 = *(_OWORD *)&a7->var0.var3;
  v29 = *(_OWORD *)&a7->var0.var0;
  v30 = v20;
  v31 = *(_OWORD *)&a7->var1.var1;
  TVPPerformBlockOnMainThreadIfNeeded(v21);

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);

}

void __114__TVPDownloadSession_URLSession_assetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  void *v14;
  _OWORD v15[3];
  uint8_t buf[16];
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "taskIDsToDownloads");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "taskIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_2559EC088)
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 48);
      v9 = *(_OWORD *)(a1 + 88);
      *(_OWORD *)buf = *(_OWORD *)(a1 + 72);
      v17 = v9;
      v18 = *(_OWORD *)(a1 + 104);
      v10 = *(_OWORD *)(a1 + 136);
      v15[0] = *(_OWORD *)(a1 + 120);
      v15[1] = v10;
      v15[2] = *(_OWORD *)(a1 + 152);
      objc_msgSend(v5, "URLSession:assetDownloadTask:didLoadTimeRange:totalTimeRangesLoaded:timeRangeExpectedToLoad:", v6, v7, buf, v8, v15);
    }
  }
  else
  {
    v11 = (void *)sLogObject_3;
    if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(const char **)(a1 + 64);
      v13 = v11;
      NSStringFromSelector(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v14;
      _os_log_impl(&dword_228A4E000, v13, OS_LOG_TYPE_DEFAULT, "Unable to find download for task in %@", buf, 0xCu);

    }
  }

}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)sLogObject_3;
  if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v7;
    _os_log_impl(&dword_228A4E000, v6, OS_LOG_TYPE_DEFAULT, "Received %@", buf, 0xCu);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__TVPDownloadSession_URLSessionDidFinishEventsForBackgroundURLSession___block_invoke;
  block[3] = &unk_24F15BEF8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __71__TVPDownloadSession_URLSessionDidFinishEventsForBackgroundURLSession___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("TVPDownloadSessionDidFinishEventsForBackgroundURLSessionNotification"), *(_QWORD *)(a1 + 32));

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19[2];
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __59__TVPDownloadSession_URLSession_task_didCompleteWithError___block_invoke;
  v15[3] = &unk_24F15C648;
  objc_copyWeak(v19, &location);
  v12 = v10;
  v16 = v12;
  v19[1] = (id)a2;
  v13 = v9;
  v17 = v13;
  v14 = v11;
  v18 = v14;
  TVPPerformBlockOnMainThreadIfNeeded(v15);

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

}

void __59__TVPDownloadSession_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "taskIDsToDownloads");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "taskIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_2559EC088)
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "URLSession:task:didCompleteWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    }
  }
  else
  {
    v6 = (void *)sLogObject_3;
    if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(const char **)(a1 + 64);
      v8 = v6;
      NSStringFromSelector(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_228A4E000, v8, OS_LOG_TYPE_DEFAULT, "Unable to find download for task in %@", (uint8_t *)&v10, 0xCu);

    }
  }

}

- (NSMutableDictionary)taskIDsToDownloads
{
  return self->_taskIDsToDownloads;
}

- (void)setTaskIDsToDownloads:(id)a3
{
  objc_storeStrong((id *)&self->_taskIDsToDownloads, a3);
}

- (AVAssetDownloadURLSession)downloadSession
{
  return self->_downloadSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadSession, 0);
  objc_storeStrong((id *)&self->_taskIDsToDownloads, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __58__TVPDownloadSession_initializeWithDownloadingMediaItems___block_invoke_5_cold_1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_0(&dword_228A4E000, a3, (uint64_t)a3, "Will fail download when started since does no download task exists", a1);
}

- (void)registerDownloadTask:(uint64_t)a3 forDownload:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_0(&dword_228A4E000, a1, a3, "Unable to register task for download since a task is already registered", v3);
  OUTLINED_FUNCTION_1();
}

- (void)registerDownloadTask:(uint64_t)a3 forDownload:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_0(&dword_228A4E000, a1, a3, "Unable to register task for download since either downloadTask or download is nil", v3);
  OUTLINED_FUNCTION_1();
}

- (void)unregisterDownloadTaskForDownload:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_0(&dword_228A4E000, a1, a3, "Unable to unregister download task for download because download is nil", v3);
  OUTLINED_FUNCTION_1();
}

@end
