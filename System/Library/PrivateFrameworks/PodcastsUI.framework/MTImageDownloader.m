@implementation MTImageDownloader

- (void)_onImageWorkQueuePurgeUnneededItemsInTemporaryResourcesDirectoryIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  int v18;
  id v19;
  _QWORD v20[4];
  id v21;
  MTImageDownloader *v22;
  uint8_t *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  uint8_t *v33;
  uint8_t buf[8];
  uint8_t *v35;
  uint64_t v36;
  char v37;
  _QWORD v38[5];
  uint8_t v39[4];
  int v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!-[MTImageDownloader hasPurgedTemporaryResourcesDirectory](self, "hasPurgedTemporaryResourcesDirectory"))
  {
    -[MTImageDownloader setHasPurgedTemporaryResourcesDirectory:](self, "setHasPurgedTemporaryResourcesDirectory:", 1);
    -[MTImageDownloader _temporaryResourcesDirectory](self, "_temporaryResourcesDirectory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subpathsAtPath:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "count"))
    {
      _MTLogCategoryArtworkDownload();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA478000, v6, OS_LOG_TYPE_DEFAULT, "Cleaning temporary resources directory", buf, 2u);
      }

      v7 = MEMORY[0x1E0C809B0];
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __96__MTImageDownloader__onImageWorkQueuePurgeUnneededItemsInTemporaryResourcesDirectoryIfNecessary__block_invoke;
      v38[3] = &unk_1EA0C5A98;
      v38[4] = self;
      objc_msgSend(v5, "mt_compactMap:", v38);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D7F218], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "privateQueueContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      *(_QWORD *)buf = 0;
      v35 = buf;
      v36 = 0x2020000000;
      v37 = 0;
      v29[0] = v7;
      v29[1] = 3221225472;
      v29[2] = __96__MTImageDownloader__onImageWorkQueuePurgeUnneededItemsInTemporaryResourcesDirectoryIfNecessary__block_invoke_2;
      v29[3] = &unk_1EA0C5AC0;
      v12 = v8;
      v30 = v12;
      v13 = v11;
      v31 = v13;
      v33 = buf;
      v14 = v9;
      v32 = v14;
      objc_msgSend(v13, "performBlockAndWait:", v29);
      v27[0] = v7;
      v27[1] = 3221225472;
      v27[2] = __96__MTImageDownloader__onImageWorkQueuePurgeUnneededItemsInTemporaryResourcesDirectoryIfNecessary__block_invoke_3;
      v27[3] = &unk_1EA0C5AE8;
      v27[4] = self;
      v15 = v14;
      v28 = v15;
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v27);
      objc_msgSend(v15, "allKeys");
      v24[0] = v7;
      v24[1] = 3221225472;
      v24[2] = __96__MTImageDownloader__onImageWorkQueuePurgeUnneededItemsInTemporaryResourcesDirectoryIfNecessary__block_invoke_4;
      v24[3] = &unk_1EA0C5B10;
      v24[4] = self;
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v25 = v16;
      v26 = v3;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v24);
      if (objc_msgSend(v16, "count"))
      {
        _MTLogCategoryArtworkDownload();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = objc_msgSend(v16, "count");
          *(_DWORD *)v39 = 67109378;
          v40 = v18;
          v41 = 2112;
          v42 = v16;
          _os_log_impl(&dword_1DA478000, v17, OS_LOG_TYPE_DEFAULT, "Found %d reusable orphaned items for podcasts without cached artwork:  %@", v39, 0x12u);
        }

      }
      v20[0] = v7;
      v20[1] = 3221225472;
      v20[2] = __96__MTImageDownloader__onImageWorkQueuePurgeUnneededItemsInTemporaryResourcesDirectoryIfNecessary__block_invoke_63;
      v20[3] = &unk_1EA0C5B38;
      v19 = v15;
      v22 = self;
      v23 = buf;
      v21 = v19;
      objc_msgSend(v16, "enumerateObjectsUsingBlock:", v20);

      _Block_object_dispose(buf, 8);
    }

  }
}

- (MTImageDownloader)init
{
  MTImageDownloader *v2;
  id v3;
  dispatch_queue_t v4;
  objc_class *v5;
  id v6;
  dispatch_queue_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTImageDownloader;
  v2 = -[MTURLSessionManager init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[MTImageDownloader setClientRequestsByUrl:](v2, "setClientRequestsByUrl:", v3);

    v4 = dispatch_queue_create(0, 0);
    -[MTImageDownloader setSyncQueue:](v2, "setSyncQueue:", v4);

    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), 0);
    -[MTImageDownloader setImageWorkQueue:](v2, "setImageWorkQueue:", v7);

    +[MTImageStore defaultStore](MTImageStore, "defaultStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTImageDownloader setImageStore:](v2, "setImageStore:", v8);

    -[MTImageDownloader setHasPurgedTemporaryResourcesDirectory:](v2, "setHasPurgedTemporaryResourcesDirectory:", 0);
  }
  return v2;
}

- (void)setHasPurgedTemporaryResourcesDirectory:(BOOL)a3
{
  self->_hasPurgedTemporaryResourcesDirectory = a3;
}

- (void)setSyncQueue:(id)a3
{
  objc_storeStrong((id *)&self->_syncQueue, a3);
}

- (void)setImageWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_imageWorkQueue, a3);
}

- (void)setImageStore:(id)a3
{
  objc_storeStrong((id *)&self->_imageStore, a3);
}

- (void)setClientRequestsByUrl:(id)a3
{
  objc_storeStrong((id *)&self->_clientRequestsByUrl, a3);
}

- (BOOL)hasPurgedTemporaryResourcesDirectory
{
  return self->_hasPurgedTemporaryResourcesDirectory;
}

- (id)_temporaryResourcesDirectory
{
  void *v2;
  void *v3;

  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("MTImageDownloader"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __66__MTImageDownloader_cleanupTemporaryResourcesDirectoryIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onImageWorkQueuePurgeUnneededItemsInTemporaryResourcesDirectoryIfNecessary");
}

- (void)cleanupTemporaryResourcesDirectoryIfNecessary
{
  NSObject *v3;
  _QWORD block[5];

  -[MTImageDownloader imageWorkQueue](self, "imageWorkQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MTImageDownloader_cleanupTemporaryResourcesDirectoryIfNecessary__block_invoke;
  block[3] = &unk_1EA0C4FB0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (OS_dispatch_queue)imageWorkQueue
{
  return self->_imageWorkQueue;
}

- (void)downloadImageForPodcastUuid:(id)a3 userInitiated:(BOOL)a4 backgroundFetch:(BOOL)a5 callback:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  MTImageDownloader *v18;
  id v19;
  BOOL v20;
  BOOL v21;

  v10 = a3;
  v11 = a6;
  if (objc_msgSend(MEMORY[0x1E0D7F278], "supportsImageStore") && objc_msgSend(v10, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D7F218], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "privateQueueContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __88__MTImageDownloader_downloadImageForPodcastUuid_userInitiated_backgroundFetch_callback___block_invoke;
    v15[3] = &unk_1EA0C5770;
    v16 = v13;
    v17 = v10;
    v18 = self;
    v20 = a4;
    v21 = a5;
    v19 = v11;
    v14 = v13;
    objc_msgSend(v14, "performBlock:", v15);

  }
}

void __88__MTImageDownloader_downloadImageForPodcastUuid_userInitiated_backgroundFetch_callback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "podcastForUuid:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "requestsAreNonAppInitiated");
  objc_msgSend(v5, "imageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7F298]), "init:nonAppInitiated:", v3, v2);
    objc_msgSend(*(id *)(a1 + 48), "downloadImageForPodcastUuid:urlOptions:userInitiated:useBackgroundFetch:callback:", *(_QWORD *)(a1 + 40), v4, *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), *(_QWORD *)(a1 + 56));

  }
}

- (void)downloadImageForPodcastUuid:(id)a3 urlOptions:(id)a4 userInitiated:(BOOL)a5 useBackgroundFetch:(BOOL)a6 callback:(id)a7
{
  -[MTImageDownloader _downloadImageUrl:cacheKey:podcastUuid:userInitiated:backgroundFetch:callback:](self, "_downloadImageUrl:cacheKey:podcastUuid:userInitiated:backgroundFetch:callback:", a4, a3, a3, a5, a6, a7);
}

- (void)downloadImageForPodcastUuid:(id)a3 urlOptions:(id)a4 userInitiated:(BOOL)a5 useBackgroundFetch:(BOOL)a6
{
  -[MTImageDownloader downloadImageForPodcastUuid:urlOptions:userInitiated:useBackgroundFetch:callback:](self, "downloadImageForPodcastUuid:urlOptions:userInitiated:useBackgroundFetch:callback:", a3, a4, a5, a6, 0);
}

- (void)downloadImageUrl:(id)a3 cacheKey:(id)a4 userInitiated:(BOOL)a5 backgroundFetch:(BOOL)a6 callback:(id)a7
{
  -[MTImageDownloader _downloadImageUrl:cacheKey:podcastUuid:userInitiated:backgroundFetch:callback:](self, "_downloadImageUrl:cacheKey:podcastUuid:userInitiated:backgroundFetch:callback:", a3, a4, 0, a5, a6, a7);
}

- (void)downloadImageUrl:(id)a3 cacheKey:(id)a4 userInitiated:(BOOL)a5 callback:(id)a6
{
  -[MTImageDownloader _downloadImageUrl:cacheKey:podcastUuid:userInitiated:backgroundFetch:callback:](self, "_downloadImageUrl:cacheKey:podcastUuid:userInitiated:backgroundFetch:callback:", a3, a4, 0, a5, 0, a6);
}

- (void)downloadImageUrl:(id)a3 cacheKey:(id)a4 userInitiated:(BOOL)a5 backgroundFetch:(BOOL)a6
{
  -[MTImageDownloader _downloadImageUrl:cacheKey:podcastUuid:userInitiated:backgroundFetch:callback:](self, "_downloadImageUrl:cacheKey:podcastUuid:userInitiated:backgroundFetch:callback:", a3, a4, 0, a5, a6, 0);
}

- (void)_downloadImageUrl:(id)a3 cacheKey:(id)a4 podcastUuid:(id)a5 userInitiated:(BOOL)a6 backgroundFetch:(BOOL)a7 callback:(id)a8
{
  _BOOL4 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int64_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  _BOOL4 v26;
  _QWORD v27[4];
  id v28;
  _QWORD aBlock[4];
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v9 = a7;
  v10 = a6;
  v35 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  if (objc_msgSend(MEMORY[0x1E0D7F278], "supportsImageStore"))
  {
    v26 = v9;
    -[MTImageDownloader cleanupTemporaryResourcesDirectoryIfNecessary](self, "cleanupTemporaryResourcesDirectoryIfNecessary");
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __99__MTImageDownloader__downloadImageUrl_cacheKey_podcastUuid_userInitiated_backgroundFetch_callback___block_invoke;
    aBlock[3] = &unk_1EA0C5720;
    v18 = v17;
    v30 = v18;
    v19 = _Block_copy(aBlock);
    objc_msgSend(v14, "url");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "absoluteString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v21, "length"))
    {
      v22 = -[MTImageDownloader _enqueueClientInfoWithUrl:key:podcastUuid:completion:](self, "_enqueueClientInfoWithUrl:key:podcastUuid:completion:", v21, v15, v16, v18);
      if (v22 == 2)
      {
        _MTLogCategoryArtworkDownload();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v32 = v16;
          v33 = 2112;
          v34 = v21;
          _os_log_impl(&dword_1DA478000, v24, OS_LOG_TYPE_DEFAULT, "download request - appended callback to already running download task (uuid=%@, imageUrl=%@)", buf, 0x16u);
        }

        goto LABEL_17;
      }
      if (v22 == 1)
      {
        _MTLogCategoryArtworkDownload();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v32 = v16;
          v33 = 2112;
          v34 = v21;
          _os_log_impl(&dword_1DA478000, v25, OS_LOG_TYPE_DEFAULT, "download request - started download task (uuid=%@, imageUrl=%@)", buf, 0x16u);
        }

        if (!-[MTImageDownloader _completeUsingExistingDownloadedImageForUuid:imageUrl:](self, "_completeUsingExistingDownloadedImageForUuid:imageUrl:", v16, v21))
        {
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __99__MTImageDownloader__downloadImageUrl_cacheKey_podcastUuid_userInitiated_backgroundFetch_callback___block_invoke_15;
          v27[3] = &unk_1EA0C5798;
          v28 = v19;
          -[MTURLSessionManager startDownloadTaskForURL:userInitiated:useBackgroundFetch:usePrivatePath:downloadStartedBlock:](self, "startDownloadTaskForURL:userInitiated:useBackgroundFetch:usePrivatePath:downloadStartedBlock:", v14, v10, v26, 0, v27);

        }
        goto LABEL_17;
      }
      if (v22)
      {
LABEL_17:

        goto LABEL_18;
      }
      _MTLogCategoryArtworkDownload();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v32 = v16;
        v33 = 2112;
        v34 = v21;
        _os_log_impl(&dword_1DA478000, v23, OS_LOG_TYPE_ERROR, "download request error - unable to enqueue request (uuid=%@, imageUrl=%@)", buf, 0x16u);
      }

    }
    (*((void (**)(void *, _QWORD))v19 + 2))(v19, 0);
    goto LABEL_17;
  }
LABEL_18:

}

uint64_t __99__MTImageDownloader__downloadImageUrl_cacheKey_podcastUuid_userInitiated_backgroundFetch_callback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __99__MTImageDownloader__downloadImageUrl_cacheKey_podcastUuid_userInitiated_backgroundFetch_callback___block_invoke_15(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (BOOL)_completeUsingExistingDownloadedImageForUuid:(id)a3 imageUrl:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  BOOL v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0D7F278], "supportsImageStore"))
  {
    -[MTImageDownloader _temporaryImagePathForDownloadedImageWithUuid:](self, "_temporaryImagePathForDownloadedImageWithUuid:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "path");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "fileExistsAtPath:", v11);

        if (v12)
        {
          _MTLogCategoryArtworkDownload();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v9, "path");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v23 = v6;
            v24 = 2112;
            v25 = v7;
            v26 = 2112;
            v27 = v14;
            _os_log_impl(&dword_1DA478000, v13, OS_LOG_TYPE_DEFAULT, "didComplete download - Using orphaned downloaded image results (uuid = %@, imageUrl = %@, contentPath = %@)", buf, 0x20u);

          }
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __75__MTImageDownloader__completeUsingExistingDownloadedImageForUuid_imageUrl___block_invoke;
          v18[3] = &unk_1EA0C51D0;
          v19 = v6;
          v20 = v7;
          v9 = v9;
          v21 = v9;
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[MTImageDownloader _processFinishedDownloadWithContentURL:originalUrl:actualRequestUrl:finishedWithContentHandler:processedKeys:](self, "_processFinishedDownloadWithContentURL:originalUrl:actualRequestUrl:finishedWithContentHandler:processedKeys:", v9, v20, v20, v18, v15);

          v16 = 1;
          goto LABEL_11;
        }
      }
    }
    else
    {
      v9 = 0;
    }
    v16 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v16 = 0;
LABEL_12:

  return v16;
}

void __75__MTImageDownloader__completeUsingExistingDownloadedImageForUuid_imageUrl___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _MTLogCategoryArtworkDownload();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1DA478000, v2, OS_LOG_TYPE_DEFAULT, "didComplete download - Did finish processing image, cleaning up temporary file (uuid = %@, imageUrl = %@)", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItemAtURL:error:", a1[6], 0);

}

- (void)configureSession:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setTimeoutIntervalForRequest:", 120.0);
  -[MTImageDownloader _urlSessionResourceTimeout](self, "_urlSessionResourceTimeout");
  objc_msgSend(v4, "setTimeoutIntervalForResource:");
  objc_msgSend(v4, "setRequestCachePolicy:", 0);

}

- (void)task:(id)a3 didFailWithError:(id)a4 orStatusCode:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "originalURLForTask:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTImageDownloader _clientRequestsForUrl:](self, "_clientRequestsForUrl:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _MTLogCategoryArtworkDownload();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v14 = 138412802;
    v15 = v7;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_1DA478000, v12, OS_LOG_TYPE_ERROR, "didFailWithError with error = %@.  originalUrl = %@, clientRequests = %@", (uint8_t *)&v14, 0x20u);
  }

  MTImageDownloadErrorWithUnderlyingError(5, CFSTR("URL Session"), v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTImageDownloader _finishProcessingClientRequests:originalUrl:success:error:](self, "_finishProcessingClientRequests:originalUrl:success:error:", v11, v10, 0, v13);
}

- (void)task:(id)a3 didCompleteWithDownloadedContentUrl:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  id v38;
  void *v39;
  _QWORD v40[4];
  NSObject *v41;
  NSObject *v42;
  id v43;
  id v44;
  uint8_t buf[4];
  NSObject *v46;
  __int16 v47;
  NSObject *v48;
  __int16 v49;
  NSObject *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "originalURLForTask:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "response");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "absoluteString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTImageDownloader _clientRequestsForUrl:](self, "_clientRequestsForUrl:", v9);
  v13 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject count](v13, "count"))
  {
    v14 = objc_msgSend((id)objc_opt_class(), "statusCodeForTask:", v6);
    if (v14 == 200)
    {
      -[NSObject firstObject](v13, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "uuid");
      v22 = objc_claimAutoreleasedReturnValue();

      v44 = 0;
      v39 = (void *)v22;
      -[MTImageDownloader _temporaryImagePathByCopyingDownloadedContent:uuid:error:](self, "_temporaryImagePathByCopyingDownloadedContent:uuid:error:", v7, v22, &v44);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v44;
      if (v23)
      {
        v38 = v7;
        _MTLogCategoryArtworkDownload();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v23, "path");
          v32 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v46 = v9;
          v47 = 2112;
          v48 = v32;
          v49 = 2112;
          v50 = v13;
          _os_log_impl(&dword_1DA478000, v31, OS_LOG_TYPE_DEFAULT, "didComplete download - Will begin processing (originalUrl = %@, contentPath = %@, clientRequests = %@)", buf, 0x20u);

        }
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __62__MTImageDownloader_task_didCompleteWithDownloadedContentUrl___block_invoke;
        v40[3] = &unk_1EA0C51D0;
        v41 = v9;
        v42 = v13;
        v43 = v23;
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTImageDownloader _processFinishedDownloadWithContentURL:originalUrl:actualRequestUrl:finishedWithContentHandler:processedKeys:](self, "_processFinishedDownloadWithContentURL:originalUrl:actualRequestUrl:finishedWithContentHandler:processedKeys:", v43, v41, v12, v40, v33);

        v34 = v41;
        v7 = v38;
      }
      else
      {
        MTImageDownloadErrorWithCode(4, CFSTR("unable to copy downloaded content"), v24, v25, v26, v27, v28, v29, v37);
        v34 = objc_claimAutoreleasedReturnValue();
        _MTLogCategoryArtworkDownload();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v46 = v34;
          v47 = 2112;
          v48 = v9;
          v49 = 2112;
          v50 = v13;
          _os_log_impl(&dword_1DA478000, v36, OS_LOG_TYPE_ERROR, "didComplete download encountered error creating temp file (error = %@, originalUrl = %@, clientRequests = %@)", buf, 0x20u);
        }

        -[MTImageDownloader _finishProcessingClientRequests:originalUrl:success:error:](self, "_finishProcessingClientRequests:originalUrl:success:error:", v13, v9, 0, v34);
      }

    }
    else
    {
      MTImageDownloadErrorWithCode(3, CFSTR("bad server response (status = %ld)"), v15, v16, v17, v18, v19, v20, v14);
      v30 = objc_claimAutoreleasedReturnValue();
      _MTLogCategoryArtworkDownload();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v46 = v30;
        v47 = 2112;
        v48 = v9;
        v49 = 2112;
        v50 = v13;
        _os_log_impl(&dword_1DA478000, v35, OS_LOG_TYPE_ERROR, "didComplete download encountered HTTP error = %@ (originalUrl = %@, clientRequests = %@)", buf, 0x20u);
      }

      -[MTImageDownloader _finishProcessingClientRequests:originalUrl:success:error:](self, "_finishProcessingClientRequests:originalUrl:success:error:", v13, v9, 0, v30);
    }
  }
  else
  {
    _MTLogCategoryArtworkDownload();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v46 = v9;
      v47 = 2112;
      v48 = v13;
      _os_log_impl(&dword_1DA478000, v30, OS_LOG_TYPE_ERROR, "didComplete download, but no clients remain (originalUrl = %@, clientRequests = %@)", buf, 0x16u);
    }
  }

}

void __62__MTImageDownloader_task_didCompleteWithDownloadedContentUrl___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _MTLogCategoryArtworkDownload();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1DA478000, v2, OS_LOG_TYPE_DEFAULT, "didComplete download - Did finish processing, cleaning up temporary file (originalUrl = %@, clientRequests = %@)", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItemAtURL:error:", a1[6], 0);

}

- (void)_processFinishedDownloadWithContentURL:(id)a3 originalUrl:(id)a4 actualRequestUrl:(id)a5 finishedWithContentHandler:(id)a6 processedKeys:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  uint64_t v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  BOOL v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  dispatch_block_t v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  NSObject *v52;
  NSObject *group;
  id v54;
  id v55;
  id v56;
  id v57;
  __CFString *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  __CFString *v64;
  _QWORD v65[4];
  id v66;
  __CFString *v67;
  MTImageDownloader *v68;
  id v69;
  id v70;
  id v71;
  id v72;
  void (**v73)(_QWORD);
  _QWORD v74[4];
  id v75;
  id v76;
  __CFString *v77;
  MTImageDownloader *v78;
  id v79;
  id v80;
  NSObject *v81;
  _BYTE *v82;
  _QWORD block[4];
  __CFString *v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  MTImageDownloader *v90;
  id v91;
  NSObject *v92;
  _BYTE *v93;
  BOOL v94;
  _QWORD aBlock[4];
  id v96;
  _BYTE buf[24];
  char v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v61 = a3;
  v12 = a4;
  v62 = a5;
  v13 = a6;
  v14 = a7;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke;
  aBlock[3] = &unk_1EA0C5070;
  v60 = v13;
  v96 = v60;
  v15 = (void (**)(_QWORD))_Block_copy(aBlock);
  v16 = objc_msgSend(v14, "count");
  v17 = CFSTR("processFinishedDownload (secondary-phase): ");
  if (!v16)
    v17 = CFSTR("processFinishedDownload (initial-phase): ");
  v64 = v17;
  -[MTImageDownloader imageStore](self, "imageStore");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTImageDownloader _clientRequestsForUrl:](self, "_clientRequestsForUrl:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count"))
  {
    if (v12)
    {
      objc_msgSend(v18, "mt_compactMap:", &__block_literal_global_9);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (void *)objc_msgSend(v25, "mutableCopy");

      if (objc_msgSend(v59, "count"))
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v98 = 0;
        v32 = dispatch_group_create();
        dispatch_group_enter(v32);
        v33 = -[MTImageDownloader _shouldDiscardTransparency](self, "_shouldDiscardTransparency");
        objc_msgSend(v59, "mt_compactMap:", &__block_literal_global_38);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "mt_uniqued");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v59, "mt_compactMap:", &__block_literal_global_39);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "mt_uniqued");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        -[MTImageDownloader imageWorkQueue](self, "imageWorkQueue");
        v38 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_3;
        block[3] = &unk_1EA0C5888;
        v58 = v64;
        v84 = v58;
        v54 = v35;
        v85 = v54;
        v57 = v37;
        v86 = v57;
        v56 = v14;
        v87 = v56;
        v39 = v63;
        v88 = v39;
        v94 = v33;
        v93 = buf;
        v55 = v61;
        v89 = v55;
        v90 = self;
        v40 = v62;
        v91 = v40;
        v41 = v32;
        v92 = v41;
        dispatch_async(v38, block);

        v42 = v41;
        if (objc_msgSend(MEMORY[0x1E0D7F278], "isRunningOnTV"))
        {
          group = v41;
          v43 = dispatch_group_create();
          dispatch_group_enter(v43);
          -[MTImageDownloader imageWorkQueue](self, "imageWorkQueue");
          v44 = objc_claimAutoreleasedReturnValue();
          v74[0] = MEMORY[0x1E0C809B0];
          v74[1] = 3221225472;
          v74[2] = __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_41;
          v74[3] = &unk_1EA0C58B0;
          v82 = buf;
          v75 = v59;
          v76 = v39;
          v77 = v58;
          v78 = self;
          v79 = v40;
          v80 = v57;
          v45 = v43;
          v81 = v45;
          v46 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, -15, v74);
          v42 = group;
          dispatch_group_notify(group, v44, v46);

          v41 = v45;
        }
        -[MTImageDownloader imageWorkQueue](self, "imageWorkQueue", group);
        v47 = objc_claimAutoreleasedReturnValue();
        v65[0] = MEMORY[0x1E0C809B0];
        v65[1] = 3221225472;
        v65[2] = __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_46;
        v65[3] = &unk_1EA0C5968;
        v66 = v18;
        v67 = v58;
        v68 = self;
        v69 = v12;
        v70 = v56;
        v71 = v55;
        v72 = v40;
        v73 = v15;
        dispatch_group_notify(v41, v47, v65);

        _Block_object_dispose(buf, 8);
      }
      else
      {
        MTImageDownloadErrorWithCode(2, CFSTR("download finished, but no keysToProcess"), v26, v27, v28, v29, v30, v31, (uint64_t)group);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        _MTLogCategoryArtworkDownload();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v64;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v12;
          _os_log_impl(&dword_1DA478000, v52, OS_LOG_TYPE_ERROR, "%@ unexpected error - no client with a valid key (originalUrl = %@)", buf, 0x16u);
        }

        -[MTImageDownloader _finishProcessingClientRequests:originalUrl:success:error:](self, "_finishProcessingClientRequests:originalUrl:success:error:", v18, v12, 0, v51);
        v15[2](v15);

      }
    }
    else
    {
      MTImageDownloadErrorWithCode(2, CFSTR("downloaded location not available"), v19, v20, v21, v22, v23, v24, (uint64_t)group);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      _MTLogCategoryArtworkDownload();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v64;
        _os_log_impl(&dword_1DA478000, v50, OS_LOG_TYPE_ERROR, "%@ unexpected error - unable to determine originalUrl", buf, 0xCu);
      }

      -[MTImageDownloader _finishProcessingClientRequests:originalUrl:success:error:](self, "_finishProcessingClientRequests:originalUrl:success:error:", v18, 0, 0, v49);
      v15[2](v15);

    }
  }
  else
  {
    _MTLogCategoryArtworkDownload();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v64;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl(&dword_1DA478000, v48, OS_LOG_TYPE_DEFAULT, "%@ exiting - no clients remain (originalUrl = %@)", buf, 0x16u);
    }

    v15[2](v15);
  }

}

uint64_t __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_32(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_msgSend(v2, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

uint64_t __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_36(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "key");
}

uint64_t __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

void __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  _MTLogCategoryArtworkDownload();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    v24 = v3;
    v25 = 2112;
    v26 = v4;
    v27 = 2112;
    v28 = v5;
    _os_log_impl(&dword_1DA478000, v2, OS_LOG_TYPE_DEFAULT, "%@ will add-to-image-store (keys = %@, uuids = %@)", buf, 0x20u);
  }

  v6 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  v8 = *(void **)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 72);
  v10 = *(unsigned __int8 *)(a1 + 112);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_40;
  v15[3] = &unk_1EA0C5860;
  v22 = *(_QWORD *)(a1 + 104);
  v11 = *(_QWORD *)(a1 + 40);
  v16 = *(id *)(a1 + 32);
  v17 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 80);
  v14 = *(void **)(a1 + 88);
  v18 = v12;
  v19 = v13;
  v20 = v14;
  v21 = *(id *)(a1 + 96);
  objc_msgSend(v8, "addImagesWithSourceUrl:forKeys:removeOldItems:discardTransparency:completion:", v9, v11, 1, v10, v15);

}

void __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_40(uint64_t a1, char a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = a2;
  _MTLogCategoryArtworkDownload();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = 138412802;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1DA478000, v3, OS_LOG_TYPE_DEFAULT, "%@ finished add-to-image-store (keys = %@, uuids = %@)", (uint8_t *)&v7, 0x20u);
  }

  if ((objc_msgSend(MEMORY[0x1E0D7F278], "isRunningOnTV") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 56), "_saveArtworkImageUrl:forPodcastUuids:logHeader:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_41(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) && objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v3 = *(id *)(a1 + 32);
    v27 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v27)
    {
      v4 = *(_QWORD *)v29;
      v26 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v29 != v4)
            objc_enumerationMutation(v3);
          v6 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v6, "uuid");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "length");

          if (v8)
          {
            v9 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v6, "key");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "uuid");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "stringWithFormat:", CFSTR("key=%@, uuid=%@"), v10, v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v2, "containsObject:", v12) & 1) == 0)
            {
              v13 = (void *)MEMORY[0x1DF09FCE8]();
              objc_msgSend(v2, "addObject:", v12);
              v14 = *(void **)(a1 + 40);
              objc_msgSend(v6, "key");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "imageForKey:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16)
              {
                _MTLogCategoryArtworkDownload();
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  v25 = v13;
                  v18 = v3;
                  v19 = v2;
                  v20 = *(_QWORD *)(a1 + 48);
                  objc_msgSend(v6, "uuid");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v33 = v20;
                  v2 = v19;
                  v3 = v18;
                  v13 = v25;
                  v34 = 2112;
                  v35 = v21;
                  _os_log_impl(&dword_1DA478000, v17, OS_LOG_TYPE_DEFAULT, "%@ analyzing image for uuid = %@", buf, 0x16u);

                }
                +[MTSingleton sharedInstance](MTImageAnalyzer, "sharedInstance");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "uuid");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = (id)objc_msgSend(v22, "addImage:forKey:", v16, v23);

                v4 = v26;
              }

              objc_autoreleasePoolPop(v13);
            }

          }
        }
        v27 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v27);
    }

  }
  objc_msgSend(*(id *)(a1 + 56), "_saveArtworkImageUrl:forPodcastUuids:logHeader:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));
}

void __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_46(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD block[4];
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1[4], "mt_compactMap:", &__block_literal_global_49);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  v8 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1[4], "mt_compactMap:", &__block_literal_global_51);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  v14 = objc_msgSend(v7, "count");
  v15 = MEMORY[0x1E0C809B0];
  if (v14 || objc_msgSend(v13, "count"))
  {
    block[0] = v15;
    block[1] = 3221225472;
    block[2] = __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_4;
    block[3] = &unk_1EA0C51D0;
    v31 = a1[5];
    v32 = v13;
    v33 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  _MTLogCategoryArtworkDownload();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = a1[5];
    *(_DWORD *)buf = 138412290;
    v35 = v17;
    _os_log_impl(&dword_1DA478000, v16, OS_LOG_TYPE_DEFAULT, "%@ finished succesfully (...will attempt to process again to ensure no new requests came in...)", buf, 0xCu);
  }

  objc_msgSend(a1[6], "_clientRequestsForUrl:", a1[7]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v15;
  v27[1] = 3221225472;
  v27[2] = __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_54;
  v27[3] = &unk_1EA0C5918;
  v28 = a1[4];
  v29 = a1[8];
  objc_msgSend(v18, "mt_filter:", v27);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[6], "_finishProcessingClientRequests:originalUrl:success:error:", v19, a1[7], 1, 0);
  dispatch_get_global_queue(0, 0);
  v20 = objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_2_56;
  v21[3] = &unk_1EA0C5940;
  v21[4] = a1[6];
  v22 = a1[9];
  v23 = a1[7];
  v24 = a1[10];
  v26 = a1[11];
  v25 = a1[8];
  dispatch_async(v20, v21);

}

uint64_t __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_2_48(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

uint64_t __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_3_50(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "key");
}

void __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_4(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _MTLogCategoryArtworkDownload();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v5 = a1[6];
    *(_DWORD *)buf = 138412802;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1DA478000, v2, OS_LOG_TYPE_DEFAULT, "%@ posting notification (keys = %@, uuids = %@)", buf, 0x20u);
  }

  v9[0] = CFSTR("uuids");
  v9[1] = CFSTR("keys");
  v6 = a1[5];
  v10[0] = a1[6];
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("kMTImageDownloaderArtworkDidLoadNotification"), 0, v7);

}

uint64_t __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(v3, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "containsObject:", v6);

  }
  return v4;
}

uint64_t __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_2_56(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processFinishedDownloadWithContentURL:originalUrl:actualRequestUrl:finishedWithContentHandler:processedKeys:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));
}

- (void)_saveArtworkImageUrl:(id)a3 forPodcastUuids:(id)a4 logHeader:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0D7F218], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mainOrPrivateContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__MTImageDownloader__saveArtworkImageUrl_forPodcastUuids_logHeader___block_invoke;
  v16[3] = &unk_1EA0C5990;
  v17 = v8;
  v18 = v9;
  v19 = v11;
  v20 = v7;
  v12 = v7;
  v13 = v11;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v13, "performBlockAndWait:", v16);

}

uint64_t __68__MTImageDownloader__saveArtworkImageUrl_forPodcastUuids_logHeader___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        _MTLogCategoryArtworkDownload();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          v18 = v9;
          v19 = 2112;
          v20 = v7;
          _os_log_impl(&dword_1DA478000, v8, OS_LOG_TYPE_DEFAULT, "%@ updating DB (actualUrl, artNeedsUpdate=NO) for %@", buf, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 48), "podcastForUuid:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "setImageURL:", *(_QWORD *)(a1 + 56));
          objc_msgSend(v11, "setNeedsArtworkUpdate:", 0);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 48), "saveInCurrentBlock");
}

- (void)_finishProcessingClientRequests:(id)a3 originalUrl:(id)a4 success:(BOOL)a5 error:(id)a6
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "mt_filter:", &__block_literal_global_57);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTImageDownloader _dequeueClientRequests:](self, "_dequeueClientRequests:", v7);
  if (objc_msgSend(v8, "count"))
  {
    v22 = v8;
    v23 = v7;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      v13 = MEMORY[0x1E0C80D38];
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v15, "completion", v22, v23);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            -[MTImageDownloader imageStore](self, "imageStore");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "key");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "imageForKey:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __79__MTImageDownloader__finishProcessingClientRequests_originalUrl_success_error___block_invoke_2;
            block[3] = &unk_1EA0C59F8;
            v20 = v16;
            v25 = v19;
            v26 = v20;
            v21 = v19;
            dispatch_async(v13, block);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v11);
    }

    v8 = v22;
    v7 = v23;
  }

}

BOOL __79__MTImageDownloader__finishProcessingClientRequests_originalUrl_success_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "completion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __79__MTImageDownloader__finishProcessingClientRequests_originalUrl_success_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (int64_t)_enqueueClientInfoWithUrl:(id)a3 key:(id)a4 podcastUuid:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  int64_t v18;
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t *v23;
  uint8_t buf[16];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  if (!objc_msgSend(v10, "length"))
  {
    _MTLogCategoryDefault();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA478000, v14, OS_LOG_TYPE_ERROR, "Invalid url specified", buf, 2u);
    }

  }
  if (objc_msgSend(v10, "length"))
  {
    +[MTImageDownloadClientRequest requestForUrl:key:podcastUuid:completion:](MTImageDownloadClientRequest, "requestForUrl:key:podcastUuid:completion:", v10, v11, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTImageDownloader syncQueue](self, "syncQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __74__MTImageDownloader__enqueueClientInfoWithUrl_key_podcastUuid_completion___block_invoke;
    v20[3] = &unk_1EA0C5A20;
    v20[4] = self;
    v21 = v10;
    v22 = v15;
    v23 = &v25;
    v17 = v15;
    dispatch_sync(v16, v20);

    v18 = v26[3];
  }
  else
  {
    v18 = v26[3];
  }
  _Block_object_dispose(&v25, 8);

  return v18;
}

void __74__MTImageDownloader__enqueueClientInfoWithUrl_key_podcastUuid_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "clientRequestsByUrl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x1E0C9AA60];
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  objc_msgSend(v6, "arrayByAddingObject:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  v9 = 1;
  if (v8 != 1)
    v9 = 2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v9;
  _MTLogCategoryArtworkDownload();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 48);
    v13 = 138412290;
    v14 = v11;
    _os_log_impl(&dword_1DA478000, v10, OS_LOG_TYPE_DEFAULT, "adding request to image download queue: %@", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "clientRequestsByUrl");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 40));

}

- (id)_clientRequestsForUrl:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2;
  v17 = __Block_byref_object_dispose__2;
  v18 = 0;
  -[MTImageDownloader syncQueue](self, "syncQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__MTImageDownloader__clientRequestsForUrl___block_invoke;
  block[3] = &unk_1EA0C5A48;
  v11 = v4;
  v12 = &v13;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (void *)v14[5];
  if (!v7)
    v7 = (void *)MEMORY[0x1E0C9AA60];
  v8 = v7;

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __43__MTImageDownloader__clientRequestsForUrl___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "clientRequestsByUrl");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)_dequeueClientRequests:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  MTImageDownloader *v9;

  v4 = a3;
  -[MTImageDownloader syncQueue](self, "syncQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MTImageDownloader__dequeueClientRequests___block_invoke;
  block[3] = &unk_1EA0C5098;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __44__MTImageDownloader__dequeueClientRequests___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  _MTLogCategoryArtworkDownload();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v23 = v3;
    _os_log_impl(&dword_1DA478000, v2, OS_LOG_TYPE_DEFAULT, "removing requests from image download queue: %@", buf, 0xCu);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
        objc_msgSend(*(id *)(a1 + 40), "clientRequestsByUrl");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "url");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __44__MTImageDownloader__dequeueClientRequests___block_invoke_59;
          v16[3] = &unk_1EA0C5A70;
          v16[4] = v9;
          objc_msgSend(v12, "mt_filter:", v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "clientRequestsByUrl");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "url");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

}

uint64_t __44__MTImageDownloader__dequeueClientRequests___block_invoke_59(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4) ^ 1;

  return v5;
}

uint64_t __96__MTImageDownloader__onImageWorkQueuePurgeUnneededItemsInTemporaryResourcesDirectoryIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_keyForImageDownloaderTempFilename:", a2);
}

void __96__MTImageDownloader__onImageWorkQueuePurgeUnneededItemsInTemporaryResourcesDirectoryIfNecessary__block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "podcastForUuid:", v7, (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v8, "requestsAreNonAppInitiated");
        if (v8)
        {
          objc_msgSend(v8, "imageURL");
          v9 = objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v10 = (void *)v9;
            objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v9, v7);

          }
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

void __96__MTImageDownloader__onImageWorkQueuePurgeUnneededItemsInTemporaryResourcesDirectoryIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "imageStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasItemForKey:", v4))
    objc_msgSend(*(id *)(a1 + 40), "removeObjectForKey:", v4);

}

void __96__MTImageDownloader__onImageWorkQueuePurgeUnneededItemsInTemporaryResourcesDirectoryIfNecessary__block_invoke_4(id *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1[4], "_keyForImageDownloaderTempFilename:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || (objc_msgSend(a1[5], "containsObject:", v4) & 1) == 0)
  {
    _MTLogCategoryArtworkDownload();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1DA478000, v5, OS_LOG_TYPE_DEFAULT, "Deleting orphaned item at path %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(a1[6], "stringByAppendingPathComponent:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeItemAtPath:error:", v6, 0);

  }
}

void __96__MTImageDownloader__onImageWorkQueuePurgeUnneededItemsInTemporaryResourcesDirectoryIfNecessary__block_invoke_63(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7F298]), "init:nonAppInitiated:", v6, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  objc_msgSend(*(id *)(a1 + 40), "downloadImageForPodcastUuid:urlOptions:userInitiated:useBackgroundFetch:callback:", v4, v5, 0, 0, 0);

}

- (id)_keyForImageDownloaderTempFilename:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "hasSuffix:", CFSTR("_image")))
  {
    objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - objc_msgSend(CFSTR("_image"), "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_temporaryImagePathForDownloadedImageWithUuid:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[MTImageDownloader _temporaryResourcesDirectory](self, "_temporaryResourcesDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", CFSTR("_image"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_temporaryImagePathByCopyingDownloadedContent:(id)a3 uuid:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  id v15;
  NSObject *v16;
  const __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  __CFString *v23;
  NSObject *v24;
  _BOOL4 v25;
  __CFString *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  void *v30;
  id v31;
  id *v33;
  id v34;
  id v35;
  uint8_t buf[4];
  const __CFString *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[MTImageDownloader _temporaryResourcesDirectory](self, "_temporaryResourcesDirectory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "fileExistsAtPath:", v10);

  if ((v12 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v14 = objc_msgSend(v13, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v35);
    v15 = v35;

    _MTLogCategoryArtworkDownload();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v33 = a5;
      if (v14)
        v17 = CFSTR("Did");
      else
        v17 = CFSTR("Failed to");
      if ((v14 & 1) != 0)
      {
        v18 = &stru_1EA0D7620;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", error = %@"), v15);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412802;
      v37 = v17;
      v38 = 2112;
      v39 = v10;
      v40 = 2112;
      v41 = v18;
      _os_log_impl(&dword_1DA478000, v16, OS_LOG_TYPE_DEFAULT, "%@ create temporaryResourcesDirectory (%@)%@", buf, 0x20u);
      if ((v14 & 1) == 0)

      a5 = v33;
    }

  }
  -[MTImageDownloader _temporaryImagePathForDownloadedImageWithUuid:](self, "_temporaryImagePathForDownloadedImageWithUuid:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v22 = objc_msgSend(v21, "copyItemAtURL:toURL:error:", v8, v20, &v34);
  v23 = (__CFString *)v34;

  _MTLogCategoryArtworkDownload();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if ((v22 & 1) != 0)
  {
    if (v25)
    {
      objc_msgSend(v8, "path");
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v37 = v26;
      v38 = 2112;
      v39 = v19;
      v27 = "copying %@ to %@ succeeded!";
      v28 = v24;
      v29 = 22;
LABEL_18:
      _os_log_impl(&dword_1DA478000, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);

    }
  }
  else if (v25)
  {
    objc_msgSend(v8, "path");
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v37 = v26;
    v38 = 2112;
    v39 = v19;
    v40 = 2112;
    v41 = v23;
    v27 = "copying %@ to %@ failed (error = %@)";
    v28 = v24;
    v29 = 32;
    goto LABEL_18;
  }

  if (a5 && v23)
    *a5 = objc_retainAutorelease(v23);
  if (v22)
    v30 = v20;
  else
    v30 = 0;
  v31 = v30;

  return v31;
}

- (BOOL)_shouldDiscardTransparency
{
  return 0;
}

- (double)_urlSessionResourceTimeout
{
  return 300.0;
}

- (NSMutableDictionary)clientRequestsByUrl
{
  return self->_clientRequestsByUrl;
}

- (MTImageStore)imageStore
{
  return self->_imageStore;
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageWorkQueue, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_imageStore, 0);
  objc_storeStrong((id *)&self->_clientRequestsByUrl, 0);
}

@end
