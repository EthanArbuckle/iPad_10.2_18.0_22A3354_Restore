@implementation ICAVAssetDownloadURLSession

- (ICAVAssetDownloadURLSession)initWithConfiguration:(id)a3 maxConcurrentRequests:(unint64_t)a4 qualityOfService:(int64_t)a5
{
  ICAVAssetDownloadURLSession *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICAVAssetDownloadURLSession;
  v5 = -[ICURLSession initWithConfiguration:maxConcurrentRequests:qualityOfService:](&v9, sel_initWithConfiguration_maxConcurrentRequests_qualityOfService_, a3, a4, a5);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel_mediaServicesWereLost_, *MEMORY[0x1E0C89730], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, sel_mediaServicesWereReset_, *MEMORY[0x1E0C89EE8], 0);

  }
  return v5;
}

- (void)mediaServicesWereLost:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -8302, CFSTR("Media Services were lost"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICURLSession cancelPendingRequestsWithError:](self, "cancelPendingRequestsWithError:", v4);

}

- (void)mediaServicesWereReset:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(a3, "userInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C89EE0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), -8302, v5, CFSTR("Media Services were reset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICURLSession cancelPendingRequestsWithError:](self, "cancelPendingRequestsWithError:", v6);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICAVAssetDownloadURLSession;
  -[ICURLSession dealloc](&v4, sel_dealloc);
}

- (void)enqueueAVDownloadRequest:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v8 = (void *)MEMORY[0x1E0C99E98];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  NSTemporaryDirectory();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("tmp.%@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingPathComponent:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fileURLWithPath:", v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  -[ICAVAssetDownloadURLSession enqueueAVDownloadRequest:toDestination:withOptions:completionHandler:](self, "enqueueAVDownloadRequest:toDestination:withOptions:completionHandler:", v11, v18, v10, v9);
}

- (void)enqueueAVDownloadRequest:(id)a3 toDestination:(id)a4 withOptions:(id)a5 completionHandler:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v10 = (void *)MEMORY[0x1E0C8B3C0];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v14, "urlRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0C8ADB8];
  v20[0] = &unk_1E43E6760;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLAssetWithURL:options:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAVAssetDownloadURLSession enqueueAVDownloadRequest:toDestination:withAVURLAsset:options:completionHandler:](self, "enqueueAVDownloadRequest:toDestination:withAVURLAsset:options:completionHandler:", v14, v13, v18, v12, v11);
}

- (void)enqueueAVDownloadRequest:(id)a3 toDestination:(id)a4 withAVURLAsset:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v16, "setType:", 3);
  objc_msgSend(v16, "setAVDownloadOptions:", v13);

  objc_msgSend(v16, "setCompletionHandler:", v12);
  objc_msgSend(v16, "setResponseDataURL:", v15);

  objc_msgSend(v16, "setAVURLAsset:", v14);
  -[ICURLSession _enqueueRequest:](self, "_enqueueRequest:", v16);

}

- (void)enqueueAggregateAssetDownloadRequest:(id)a3 toDestination:(id)a4 withOptions:(id)a5 completionHandler:(id)a6
{
  -[ICAVAssetDownloadURLSession enqueueAggregateAssetDownloadRequest:toDestination:withOptions:resourceLoaderDelegate:completionHandler:](self, "enqueueAggregateAssetDownloadRequest:toDestination:withOptions:resourceLoaderDelegate:completionHandler:", a3, a4, a5, 0, a6);
}

- (void)enqueueAggregateAssetDownloadRequest:(id)a3 toDestination:(id)a4 withOptions:(id)a5 resourceLoaderDelegate:(id)a6 completionHandler:(id)a7
{
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v11 = (void *)MEMORY[0x1E0C8B3C0];
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v16, "urlRequest");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x1E0C8ADB8];
  v24[0] = &unk_1E43E6760;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLAssetWithURL:options:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "resourceLoader");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDelegate:queue:", v13, MEMORY[0x1E0C80D38]);

  -[ICAVAssetDownloadURLSession enqueueAggregateAssetDownloadRequest:toDestination:withAVURLAsset:options:completionHandler:](self, "enqueueAggregateAssetDownloadRequest:toDestination:withAVURLAsset:options:completionHandler:", v16, v15, v20, v14, v12);
}

- (void)enqueueAggregateAssetDownloadRequest:(id)a3 toDestination:(id)a4 withAVURLAsset:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v16, "setType:", 5);
  objc_msgSend(v16, "setCompletionHandler:", v12);

  objc_msgSend(v16, "setResponseDataURL:", v15);
  objc_msgSend(v16, "setAVURLAsset:", v14);

  objc_msgSend(v16, "setAVDownloadOptions:", v13);
  -[ICURLSession _enqueueRequest:](self, "_enqueueRequest:", v16);

}

- (void)URLSession:(id)a3 aggregateAssetDownloadTask:(id)a4 didLoadTimeRange:(id *)a5 totalTimeRangesLoaded:(id)a6 timeRangeExpectedToLoad:(id *)a7 forMediaSelection:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  Float64 Seconds;
  $3CC8671D27C23BF42ADDB32F2B5E48AE var1;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a8;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __150__ICAVAssetDownloadURLSession_URLSession_aggregateAssetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad_forMediaSelection___block_invoke;
  v19[3] = &unk_1E438CF38;
  v19[4] = &v20;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v19);
  var1 = a7->var1;
  Seconds = CMTimeGetSeconds((CMTime *)&var1);
  -[ICURLSession _updateProgressForSessionTask:withTotalBytesWritten:totalBytesExpectedToWrite:](self, "_updateProgressForSessionTask:withTotalBytesWritten:totalBytesExpectedToWrite:", v14, v21[3], (uint64_t)Seconds);
  _Block_object_dispose(&v20, 8);

}

- (id)_createURLSessionWithConfiguration:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C92BF0], "sessionWithConfiguration:assetDownloadDelegate:delegateQueue:", a3, self, 0);
}

- (id)_createURLSessionTaskForRequest:(id)a3 usingSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  objc_super v24;
  uint8_t buf[4];
  ICAVAssetDownloadURLSession *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "avDownloadOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "avDownloadOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v6, "responseDataURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0C89DD8]);

  v12 = objc_msgSend(v6, "type");
  if (v12 == 5)
  {
    objc_msgSend(v6, "avURLAsset");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v26 = self;
      v27 = 2114;
      v28 = v17;
      v29 = 2114;
      v30 = v10;
      _os_log_impl(&dword_1A03E3000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Creating aggregateAssetDownloadTask with urlAsset: %{public}@, options %{public}@", buf, 0x20u);
    }

    objc_msgSend(v17, "allMediaSelections");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "aggregateAssetDownloadTaskWithURLAsset:mediaSelections:assetTitle:assetArtworkData:options:", v17, v20, CFSTR("Aggregate Media Download"), 0, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (v12 == 3)
  {
    +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isWatch");

    if (v14)
    {
      v15 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "currentURLRequest");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = self;
        v27 = 2114;
        v28 = v16;
        _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Creating downloadTask with URLRequest: %{public}@", buf, 0x16u);

      }
      objc_msgSend(v6, "currentURLRequest");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "downloadTaskWithRequest:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    objc_msgSend(v6, "avURLAsset");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v26 = self;
      v27 = 2114;
      v28 = v17;
      v29 = 2114;
      v30 = v10;
      _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Creating assetDownloadTask with urlAsset: %{public}@, options %{public}@", buf, 0x20u);
    }

    objc_msgSend(v17, "URL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "responseDataURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_AVAssetDownloadTaskWithURL:destinationURL:options:", v20, v22, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
LABEL_18:

    goto LABEL_19;
  }
  v24.receiver = self;
  v24.super_class = (Class)ICAVAssetDownloadURLSession;
  -[ICURLSession _createURLSessionTaskForRequest:usingSession:](&v24, sel__createURLSessionTaskForRequest_usingSession_, v6, v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v18;
}

void __150__ICAVAssetDownloadURLSession_URLSession_aggregateAssetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad_forMediaSelection___block_invoke(uint64_t a1, void *a2)
{
  CMTime v3;
  CMTime v4[2];

  memset(v4, 0, sizeof(v4));
  objc_msgSend(a2, "getValue:", v4);
  v3 = v4[1];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += (uint64_t)CMTimeGetSeconds(&v3);
}

@end
