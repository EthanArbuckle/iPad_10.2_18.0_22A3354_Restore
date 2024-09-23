@implementation ICMediaAssetDownloadRequest

- (ICMediaAssetDownloadRequest)initWithRequestContext:(id)a3 storeMediaResponseItem:(id)a4 resumeData:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICMediaAssetDownloadRequest *v12;
  ICMediaAssetDownloadRequest *v13;
  uint64_t v14;
  NSMutableDictionary *additionalHTTPHeaderFields;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ICMediaAssetDownloadRequest;
  v12 = -[ICRequestOperation init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_requestContext, a3);
    v13->_allowsCellularData = 1;
    v13->_allowsProxyCellularData = 1;
    v13->_allowsCellularFallback = 1;
    v13->_allowDownloadOnConstrainedNetworks = 1;
    objc_storeStrong((id *)&v13->_storeMediaResponseItem, a4);
    v13->_discretionary = 0;
    v13->_prefersHLSAsset = 0;
    objc_storeStrong((id *)&v13->_resumeData, a5);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    additionalHTTPHeaderFields = v13->_additionalHTTPHeaderFields;
    v13->_additionalHTTPHeaderFields = (NSMutableDictionary *)v14;

  }
  return v13;
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3828], "ic_sharedRequestOperationQueueWithQualityOfService:", -[ICMediaAssetDownloadRequest qualityOfService](self, "qualityOfService"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__ICMediaAssetDownloadRequest_performRequestWithResponseHandler___block_invoke;
  v7[3] = &unk_1E43915E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[ICRequestOperation performRequestOnOperationQueue:withCompletionHandler:](self, "performRequestOnOperationQueue:withCompletionHandler:", v5, v7);

}

- (void)execute
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;
  ICURLSession *v8;
  ICURLSession *downloadSession;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  ICURLRequest *v15;
  ICURLRequest *request;
  void *v17;
  void *v18;
  NSObject *v19;
  ICURLSession *v20;
  ICURLRequest *v21;
  NSURL *destinationURL;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSURL *v30;
  NSURL *v31;
  _BOOL4 prefersHLSAsset;
  ICURLSession *v33;
  ICURLSession *v34;
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
  id v45;
  NSObject *v46;
  NSURL *v47;
  __CFString *v48;
  __CFString *v49;
  uint64_t v50;
  NSObject *v51;
  ICStoreMediaResponseItem *storeMediaResponseItem;
  void *v53;
  NSObject *v54;
  ICURLRequest *v55;
  NSURL *v56;
  void *v57;
  ICContentKeySession *v58;
  ICStoreRequestContext *requestContext;
  ICFileContentKeyStore *v60;
  void *v61;
  ICFileContentKeyStore *v62;
  ICContentKeySession *v63;
  ICContentKeySession *contentKeySession;
  void *v65;
  ICContentKeySession *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  ICContentKeySession *v71;
  ICURLRequest *v72;
  NSURL *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  ICURLSession *v78;
  uint64_t v79;
  void *v80;
  id v81;
  id v82;
  id v83;
  id v84;
  _QWORD v85[5];
  _QWORD v86[5];
  _QWORD v87[5];
  id v88;
  id v89;
  id v90;
  _QWORD v91[4];
  id v92;
  ICMediaAssetDownloadRequest *v93;
  char v94;
  uint64_t v95;
  void *v96;
  uint8_t buf[4];
  ICMediaAssetDownloadRequest *v98;
  __int16 v99;
  id v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isWatch");

  -[ICMediaAssetDownloadRequest _sessionIdentifier](self, "_sessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICURLSessionManager sharedSessionManager](ICURLSessionManager, "sharedSessionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = MEMORY[0x1E0C809B0];
  v91[1] = 3221225472;
  v91[2] = __38__ICMediaAssetDownloadRequest_execute__block_invoke;
  v91[3] = &unk_1E438A310;
  v94 = v4 ^ 1;
  v7 = v5;
  v92 = v7;
  v93 = self;
  objc_msgSend(v6, "sessionWithIdentifier:creationBlock:", v7, v91);
  v8 = (ICURLSession *)objc_claimAutoreleasedReturnValue();
  downloadSession = self->_downloadSession;
  self->_downloadSession = v8;

  if (self->_downloadSession)
  {
    -[ICStoreMediaResponseItem hlsAsset](self->_storeMediaResponseItem, "hlsAsset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playlistURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && self->_prefersHLSAsset)
    {
      v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v98 = self;
        _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ An HLS asset is available and is preferred, so we will use it", buf, 0xCu);
      }

      v13 = v11;
    }
    else
    {
      -[ICStoreMediaResponseItem downloadableAsset](self->_storeMediaResponseItem, "downloadableAsset");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "assetURL");
      v13 = (id)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        v51 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          storeMediaResponseItem = self->_storeMediaResponseItem;
          *(_DWORD *)buf = 138543618;
          v98 = self;
          v99 = 2114;
          v100 = storeMediaResponseItem;
          _os_log_impl(&dword_1A03E3000, v51, OS_LOG_TYPE_ERROR, "%{public}@ Failed to download because the item is invalid (assetURL=nil) %{public}@", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -8301, CFSTR("Invalid ICStoreMediaResponseItem object (assetURL=nil)"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICMediaAssetDownloadRequest finishWithError:](self, "finishWithError:", v53);

        v13 = 0;
        goto LABEL_38;
      }
    }
    v15 = -[ICURLRequest initWithURL:requestContext:resumeData:]([ICURLRequest alloc], "initWithURL:requestContext:resumeData:", v13, self->_requestContext, self->_resumeData);
    request = self->_request;
    self->_request = v15;

    -[ICRequestOperation progress](self, "progress");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICURLRequest progress](self->_request, "progress");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addChild:withPendingUnitCount:", v18, 100);

    if (self->_destinationURL)
    {
      if ((v4 & 1) != 0)
      {
LABEL_10:
        v19 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v98 = self;
          _os_log_impl(&dword_1A03E3000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Enqueueing standard file asset download", buf, 0xCu);
        }

        v20 = self->_downloadSession;
        v21 = self->_request;
        destinationURL = self->_destinationURL;
        v85[0] = MEMORY[0x1E0C809B0];
        v85[1] = 3221225472;
        v85[2] = __38__ICMediaAssetDownloadRequest_execute__block_invoke_38;
        v85[3] = &unk_1E4391630;
        v85[4] = self;
        -[ICURLSession enqueueDownloadRequest:toDestination:withCompletionHandler:](v20, "enqueueDownloadRequest:toDestination:withCompletionHandler:", v21, destinationURL, v85);
LABEL_38:

        goto LABEL_39;
      }
    }
    else
    {
      v24 = (void *)MEMORY[0x1E0C99E98];
      NSTemporaryDirectory();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v83 = v7;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "UUIDString");
      v81 = v13;
      v27 = v11;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringByAppendingPathComponent:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "fileURLWithPath:", v29);
      v30 = (NSURL *)objc_claimAutoreleasedReturnValue();
      v31 = self->_destinationURL;
      self->_destinationURL = v30;

      v11 = v27;
      v13 = v81;

      v7 = v83;
      if ((v4 & 1) != 0)
        goto LABEL_10;
    }
    prefersHLSAsset = self->_prefersHLSAsset;
    v33 = self->_downloadSession;
    v34 = v33;
    if (prefersHLSAsset)
    {
      v77 = v11;
      v78 = v33;
      v84 = v7;
      v35 = (void *)MEMORY[0x1E0C8B3C0];
      v95 = *MEMORY[0x1E0C8ADB8];
      v96 = &unk_1E43E6580;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = v13;
      objc_msgSend(v35, "URLAssetWithURL:options:", v13, v36);
      v37 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)MEMORY[0x1E0C99E98];
      NSTemporaryDirectory();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "UUIDString");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringByAppendingPathComponent:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "fileURLWithPath:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v90 = 0;
      v76 = v38;
      LOBYTE(v39) = objc_msgSend(v38, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v44, 1, 0, &v90);
      v45 = v90;
      if ((v39 & 1) == 0)
      {
        v46 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v98 = self;
          v99 = 2114;
          v100 = v45;
          _os_log_impl(&dword_1A03E3000, v46, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create download destination directory. This isn't fatal but may result in failure to save the playback keys. err=%{public}@", buf, 0x16u);
        }

        v47 = self->_destinationURL;
        v44 = v47;
      }
      v75 = v45;
      objc_msgSend(v10, "keyServerURL");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "keyCertificateURL");
      v79 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "keyServerProtocolType");
      v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v49 = v48;
      if (v48 == CFSTR("simplified"))
        v50 = 1;
      else
        v50 = -[__CFString isEqual:](v48, "isEqual:", CFSTR("simplified"));

      v58 = [ICContentKeySession alloc];
      requestContext = self->_requestContext;
      v60 = [ICFileContentKeyStore alloc];
      objc_msgSend(v44, "path");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = -[ICFileContentKeyStore initWithPath:](v60, "initWithPath:", v61);
      v63 = -[ICContentKeySession initWithRequestContext:keyStore:delegate:](v58, "initWithRequestContext:keyStore:delegate:", requestContext, v62, self);
      contentKeySession = self->_contentKeySession;
      self->_contentKeySession = v63;

      -[ICContentKeySession setRequestOfflineKeys:](self->_contentKeySession, "setRequestOfflineKeys:", 1);
      -[ICContentKeySession setKeyServerURL:](self->_contentKeySession, "setKeyServerURL:", v80);
      -[ICContentKeySession setKeyServerProtocolType:](self->_contentKeySession, "setKeyServerProtocolType:", v50);
      v65 = (void *)v79;
      -[ICContentKeySession setKeyCertificateURL:](self->_contentKeySession, "setKeyCertificateURL:", v79);
      v66 = self->_contentKeySession;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[ICStoreMediaResponseItem storeAdamID](self->_storeMediaResponseItem, "storeAdamID"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICContentKeySession setAdamID:](v66, "setAdamID:", v67);

      v68 = (void *)v37;
      -[ICContentKeySession addAsset:shouldPreloadKeys:waitForKeyIdentifiers:](self->_contentKeySession, "addAsset:shouldPreloadKeys:waitForKeyIdentifiers:", v37, 1, 1);
      -[ICContentKeySession waitForAllKeysToProcess](self->_contentKeySession, "waitForAllKeysToProcess");
      if (self->_keyDeliveryError)
      {
        -[ICMediaAssetDownloadRequest finishWithError:](self, "finishWithError:");
        v11 = v77;
        v34 = v78;
        v13 = v82;
        v69 = v76;
      }
      else
      {
        v70 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        v11 = v77;
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          v71 = self->_contentKeySession;
          *(_DWORD *)buf = 138543618;
          v98 = self;
          v99 = 2114;
          v100 = v71;
          _os_log_impl(&dword_1A03E3000, v70, OS_LOG_TYPE_DEFAULT, "%{public}@ Enqueueing aggregate asset download using key session %{public}@", buf, 0x16u);
        }

        v72 = self->_request;
        v73 = self->_destinationURL;
        -[ICMediaAssetDownloadRequest _createAVAssetDownloadOptionsDictionary](self, "_createAVAssetDownloadOptionsDictionary");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v87[0] = MEMORY[0x1E0C809B0];
        v87[1] = 3221225472;
        v87[2] = __38__ICMediaAssetDownloadRequest_execute__block_invoke_34;
        v87[3] = &unk_1E438BF78;
        v87[4] = self;
        v88 = v44;
        v69 = v38;
        v89 = v38;
        v34 = v78;
        -[ICURLSession enqueueAggregateAssetDownloadRequest:toDestination:withAVURLAsset:options:completionHandler:](v78, "enqueueAggregateAssetDownloadRequest:toDestination:withAVURLAsset:options:completionHandler:", v72, v73, v37, v74, v87);

        v13 = v82;
        v65 = (void *)v79;
      }

      v7 = v84;
    }
    else
    {
      v54 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v98 = self;
        _os_log_impl(&dword_1A03E3000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@ Enqueueing AV asset download", buf, 0xCu);
      }

      v55 = self->_request;
      v56 = self->_destinationURL;
      -[ICMediaAssetDownloadRequest _createAVAssetDownloadOptionsDictionary](self, "_createAVAssetDownloadOptionsDictionary");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v86[0] = MEMORY[0x1E0C809B0];
      v86[1] = 3221225472;
      v86[2] = __38__ICMediaAssetDownloadRequest_execute__block_invoke_37;
      v86[3] = &unk_1E4391630;
      v86[4] = self;
      -[ICURLSession enqueueAVDownloadRequest:toDestination:withOptions:completionHandler:](v34, "enqueueAVDownloadRequest:toDestination:withOptions:completionHandler:", v55, v56, v57, v86);

    }
    goto LABEL_38;
  }
  v23 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v98 = self;
    _os_log_impl(&dword_1A03E3000, v23, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create an ICURLSession instance", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -8300, CFSTR("Failed to create an ICURLSession instance"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[ICMediaAssetDownloadRequest finishWithError:](self, "finishWithError:", v13);
LABEL_39:

}

- (void)setValue:(id)a3 forHTTPHeaderField:(id)a4
{
  NSMutableDictionary *additionalHTTPHeaderFields;

  additionalHTTPHeaderFields = self->_additionalHTTPHeaderFields;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](additionalHTTPHeaderFields, "setObject:forKey:", a3, a4);
  else
    -[NSMutableDictionary removeObjectForKey:](additionalHTTPHeaderFields, "removeObjectForKey:", a4);
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICMediaAssetDownloadRequest;
  -[ICMediaAssetDownloadRequest cancel](&v3, sel_cancel);
  if (self->_request)
    -[ICURLSession cancelRequest:](self->_downloadSession, "cancelRequest:");
}

- (void)finishWithError:(id)a3
{
  ICURLRequest *request;
  ICURLSession *downloadSession;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICMediaAssetDownloadRequest;
  -[ICRequestOperation finishWithError:](&v6, sel_finishWithError_, a3);
  request = self->_request;
  self->_request = 0;

  downloadSession = self->_downloadSession;
  self->_downloadSession = 0;

}

- (void)contentKeySession:(id)a3 didFinishProcessingKey:(id)a4 withResponse:(id)a5 error:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  ICMediaAssetDownloadRequest *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a6;
  if (v9)
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 138543874;
      v12 = self;
      v13 = 2114;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch key with identifier '%{public}@'. err=%{public}@", (uint8_t *)&v11, 0x20u);
    }

    objc_storeStrong((id *)&self->_keyDeliveryError, a6);
  }

}

- (id)_sessionIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("com.apple.iTunesCloud.ICMediaAssetDownloadRequest."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRequestContext clientInfo](self->_requestContext, "clientInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "appendString:", v5);
    objc_msgSend(v3, "appendString:", CFSTR("."));
  }
  -[ICRequestContext clientInfo](self->_requestContext, "clientInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestingBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "appendString:", v7);
    objc_msgSend(v3, "appendString:", CFSTR("."));
  }
  if (self->_discretionary)
    objc_msgSend(v3, "appendString:", CFSTR("discretionary."));
  if (self->_requiresPower)
    objc_msgSend(v3, "appendString:", CFSTR("power."));
  if (!self->_allowsCellularData)
    objc_msgSend(v3, "appendString:", CFSTR("wifi."));
  if (!self->_allowDownloadOnConstrainedNetworks)
    objc_msgSend(v3, "appendString:", CFSTR("failDownloadOnConstrainedNetworks."));
  objc_msgSend(v3, "appendString:", CFSTR("av"));

  return v3;
}

- (id)_createAVAssetDownloadOptionsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  NSNumber *minimumBitrate;
  NSNumber *maximumSampleRate;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  ICMediaAssetDownloadRequest *v56;
  __int16 v57;
  id v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRequestContext clientInfo](self->_requestContext, "clientInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0C89D70]);

  v6 = (void *)-[NSMutableDictionary mutableCopy](self->_additionalHTTPHeaderFields, "mutableCopy");
  -[ICStoreMediaResponseItem downloadableAsset](self->_storeMediaResponseItem, "downloadableAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "downloadKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "downloadKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("downloadKey=%@"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v12, CFSTR("Cookie"));

    }
  }
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0C89D78]);
  if (((-[ICMediaAssetDownloadRequest qualityOfService](self, "qualityOfService") - 25) & 0xFFFFFFFFFFFFFFF7) != 0)
    v13 = -1;
  else
    v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0C89D88]);

  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "md5");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D0D520]);

  objc_msgSend(v8, "fairPlayInfoList");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    v48 = v6;
    v19 = v15;
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend(v8, "fairPlayInfoList");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v52 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "responseSinfDictionary");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
      }
      while (v23);
    }

    v15 = v19;
    if (objc_msgSend(v20, "count"))
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D0D538]);

    v6 = v48;
  }
  v49 = v15;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0C89D90]);
  v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[ICStoreRequestContext identity](self->_requestContext, "identity");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStoreRequestContext identityStore](self->_requestContext, "identityStore");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v47 = v29;
  if (v28
    && v29
    && (v50 = 0,
        objc_msgSend(v29, "getPropertiesForUserIdentity:error:", v28, &v50),
        v30 = (void *)objc_claimAutoreleasedReturnValue(),
        (v31 = v50) != 0))
  {
    v32 = v31;
    v33 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    v46 = v30;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v56 = self;
      v57 = 2114;
      v58 = v32;
      _os_log_impl(&dword_1A03E3000, v33, OS_LOG_TYPE_ERROR, "%{public}@ failed to load identity properties. err=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    v46 = v30;
    objc_msgSend(v30, "DSID");
    v33 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v33, *MEMORY[0x1E0C89D98]);
    v32 = 0;
  }
  v34 = v32;

  -[ICStoreMediaResponseItem redownloadParameters](self->_storeMediaResponseItem, "redownloadParameters");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v35, *MEMORY[0x1E0C89DA0]);

  -[ICStoreMediaResponseItem metadata](self->_storeMediaResponseItem, "metadata");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v36)
  {
    objc_msgSend(v8, "metadata");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v36, "itemCloudID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(v36, "itemCloudID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = CFSTR("match");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[ICStoreMediaResponseItem storeAdamID](self->_storeMediaResponseItem, "storeAdamID"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = CFSTR("purchaseHistory");
  }
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v38, *MEMORY[0x1E0C89DA8]);

  objc_msgSend(v27, "setObject:forKeyedSubscript:", v39, *MEMORY[0x1E0C89DC0]);
  if (v36)
  {
    -[ICMediaAssetDownloadRequest _mediaKindFromResponseItemMetadata:](self, "_mediaKindFromResponseItemMetadata:", v36);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v40, *MEMORY[0x1E0C89DB8]);

  }
  -[ICStoreRequestContext userAgent](self->_requestContext, "userAgent");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v41, *MEMORY[0x1E0C89DC8]);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0C89DB0]);
  if (!self->_allowsCellularData)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E43E6598, *MEMORY[0x1E0C89D80]);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0C89D68]);
  }
  minimumBitrate = self->_minimumBitrate;
  if (minimumBitrate)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", minimumBitrate, *MEMORY[0x1E0C89DF8]);
  maximumSampleRate = self->_maximumSampleRate;
  if (maximumSampleRate)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", maximumSampleRate, *MEMORY[0x1E0C89DE0]);
  if (self->_prefersLossless)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C89E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_prefersMultichannel);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, *MEMORY[0x1E0C89DF0]);

  return v3;
}

- (id)_mediaKindFromResponseItemMetadata:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = _mediaKindFromResponseItemMetadata__sOnceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_mediaKindFromResponseItemMetadata__sOnceToken, &__block_literal_global_3197);
  v5 = (void *)_mediaKindFromResponseItemMetadata__sDownloadMediaTypeToAVMediaKind;
  objc_msgSend(v4, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (void)setDestinationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (BOOL)allowsCellularData
{
  return self->_allowsCellularData;
}

- (void)setAllowsCellularData:(BOOL)a3
{
  self->_allowsCellularData = a3;
}

- (BOOL)allowsProxyCellularData
{
  return self->_allowsProxyCellularData;
}

- (void)setAllowsProxyCellularData:(BOOL)a3
{
  self->_allowsProxyCellularData = a3;
}

- (BOOL)allowsCellularFallback
{
  return self->_allowsCellularFallback;
}

- (void)setAllowsCellularFallback:(BOOL)a3
{
  self->_allowsCellularFallback = a3;
}

- (BOOL)allowDownloadOnConstrainedNetworks
{
  return self->_allowDownloadOnConstrainedNetworks;
}

- (void)setAllowDownloadOnConstrainedNetworks:(BOOL)a3
{
  self->_allowDownloadOnConstrainedNetworks = a3;
}

- (BOOL)isDiscretionary
{
  return self->_discretionary;
}

- (void)setDiscretionary:(BOOL)a3
{
  self->_discretionary = a3;
}

- (BOOL)requiresPower
{
  return self->_requiresPower;
}

- (void)setRequiresPower:(BOOL)a3
{
  self->_requiresPower = a3;
}

- (BOOL)prefersHLSAsset
{
  return self->_prefersHLSAsset;
}

- (void)setPrefersHLSAsset:(BOOL)a3
{
  self->_prefersHLSAsset = a3;
}

- (NSData)resumeData
{
  return self->_resumeData;
}

- (void)setResumeData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (NSNumber)minimumBitrate
{
  return self->_minimumBitrate;
}

- (void)setMinimumBitrate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSNumber)maximumSampleRate
{
  return self->_maximumSampleRate;
}

- (void)setMaximumSampleRate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (BOOL)prefersLossless
{
  return self->_prefersLossless;
}

- (void)setPrefersLossless:(BOOL)a3
{
  self->_prefersLossless = a3;
}

- (BOOL)prefersMultichannel
{
  return self->_prefersMultichannel;
}

- (void)setPrefersMultichannel:(BOOL)a3
{
  self->_prefersMultichannel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumSampleRate, 0);
  objc_storeStrong((id *)&self->_minimumBitrate, 0);
  objc_storeStrong((id *)&self->_resumeData, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong((id *)&self->_keyDeliveryError, 0);
  objc_storeStrong((id *)&self->_contentKeySession, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_downloadSession, 0);
  objc_storeStrong((id *)&self->_additionalHTTPHeaderFields, 0);
  objc_storeStrong((id *)&self->_storeMediaResponseItem, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
}

void __66__ICMediaAssetDownloadRequest__mediaKindFromResponseItemMetadata___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("song");
  v2[1] = CFSTR("feature-movie");
  v3[0] = CFSTR("music");
  v3[1] = CFSTR("movie");
  v2[2] = CFSTR("music-video");
  v2[3] = CFSTR("tv-episode");
  v3[2] = CFSTR("musicvideo");
  v3[3] = CFSTR("tvshow");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_mediaKindFromResponseItemMetadata__sDownloadMediaTypeToAVMediaKind;
  _mediaKindFromResponseItemMetadata__sDownloadMediaTypeToAVMediaKind = v0;

}

id __38__ICMediaAssetDownloadRequest_execute__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  __objc2_class **v15;
  void *v16;

  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(MEMORY[0x1E0C92CA0], "backgroundSessionConfigurationWithIdentifier:", *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDiscretionary:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 372));
  objc_msgSend(v2, "setHTTPCookieAcceptPolicy:", 1);
  objc_msgSend(v2, "setHTTPShouldSetCookies:", 0);
  objc_msgSend(v2, "setHTTPShouldUsePipelining:", 1);
  objc_msgSend(v2, "setRequestCachePolicy:", 1);
  objc_msgSend(v2, "setSessionSendsLaunchEvents:", 1);
  objc_msgSend(v2, "set_requiresPowerPluggedIn:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 373));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 304), "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestingBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
LABEL_7:
    objc_msgSend(v2, "set_sourceApplicationBundleIdentifier:", v5);

    goto LABEL_8;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 304), "clientInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_7;
LABEL_8:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 40);
  v10 = MEMORY[0x1E0C9AAA0];
  if (*(_BYTE *)(v9 + 370) && *(_BYTE *)(v9 + 368))
    v10 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v7, "setObject:forKey:", v10, *MEMORY[0x1E0C93200]);
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 40) + 371))
    objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0C93030]);
  objc_msgSend(v2, "set_socketStreamProperties:", v8);
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isWatch");

  if (!v12)
  {
    v14 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 368);
    goto LABEL_17;
  }
  objc_msgSend(v2, "set_prefersInfraWiFi:", 1);
  objc_msgSend(v2, "set_companionProxyPreference:", 2);
  v13 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v13 + 368) || !*(_BYTE *)(v13 + 369))
  {
    v14 = *(unsigned __int8 *)(v13 + 368) != 0;
LABEL_17:
    objc_msgSend(v2, "setAllowsCellularAccess:", v14);
    goto LABEL_18;
  }
  objc_msgSend(v2, "set_allowsWCA:", 0);
LABEL_18:
  v15 = off_1E437AB58;
  if (*(_BYTE *)(a1 + 48))
    v15 = off_1E437A490;
  v16 = (void *)objc_msgSend(objc_alloc(*v15), "initWithConfiguration:", v2);

  return v16;
}

void __38__ICMediaAssetDownloadRequest_execute__block_invoke_34(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  char v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  _QWORD *v33;
  void *v34;
  id v35;
  id v36;
  id obj;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  uint8_t v44[128];
  uint8_t buf[4];
  id v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = a1[4];
    objc_msgSend(v5, "bodyDataURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v46 = v8;
    v47 = 2114;
    v48 = v6;
    v49 = 2114;
    v50 = v9;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Aggregate asset download complete. err=%{public}@, destinationPath=%{public}@", buf, 0x20u);

  }
  v10 = (id)*((_QWORD *)a1[4] + 48);
  v11 = a1[5];
  if (v10 == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = v10;
    v14 = objc_msgSend(v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
    {
      if (!v6)
      {
        v36 = v5;
        v16 = a1[5];
        v15 = a1[6];
        objc_msgSend(MEMORY[0x1E0C99D20], "array");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 0;
        objc_msgSend(v15, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v16, v17, 0, &v43);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v43;

        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        obj = v18;
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v40;
          do
          {
            v23 = 0;
            v24 = v19;
            do
            {
              if (*(_QWORD *)v40 != v22)
                objc_enumerationMutation(obj);
              v25 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v23);
              objc_msgSend(v25, "lastPathComponent");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*((id *)a1[4] + 48), "path");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "stringByAppendingPathComponent:", v26);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = a1[6];
              v38 = v24;
              LOBYTE(v25) = objc_msgSend(v30, "moveItemAtURL:toURL:error:", v25, v29, &v38);
              v19 = v38;

              if ((v25 & 1) == 0)
              {
                v31 = os_log_create("com.apple.amp.iTunesCloud", "Default");
                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                {
                  v32 = a1[4];
                  *(_DWORD *)buf = 138543874;
                  v46 = v32;
                  v47 = 2114;
                  v48 = v26;
                  v49 = 2114;
                  v50 = v19;
                  _os_log_impl(&dword_1A03E3000, v31, OS_LOG_TYPE_ERROR, "%{public}@ Failed to copy key file '%{public}@'. err=%{public}@", buf, 0x20u);
                }

              }
              ++v23;
              v24 = v19;
            }
            while (v21 != v23);
            v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
          }
          while (v21);
        }

        v5 = v36;
        v6 = 0;
      }
      objc_msgSend(a1[6], "removeItemAtURL:error:", a1[5], 0);
    }
  }
  v33 = a1[4];
  v34 = (void *)v33[43];
  v33[43] = v5;
  v35 = v5;

  objc_msgSend(a1[4], "finishWithError:", v6);
}

void __38__ICMediaAssetDownloadRequest_execute__block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "bodyDataURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v8;
    v15 = 2114;
    v16 = v6;
    v17 = 2114;
    v18 = v9;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ AV asset download complete. err=%{public}@, destinationPath=%{public}@", (uint8_t *)&v13, 0x20u);

  }
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 344);
  *(_QWORD *)(v10 + 344) = v5;
  v12 = v5;

  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
}

void __38__ICMediaAssetDownloadRequest_execute__block_invoke_38(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "bodyDataURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v8;
    v15 = 2114;
    v16 = v6;
    v17 = 2114;
    v18 = v9;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ File asset download complete. err=%{public}@, destinationPath=%{public}@", (uint8_t *)&v13, 0x20u);

  }
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 344);
  *(_QWORD *)(v10 + 344) = v5;
  v12 = v5;

  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
}

void __65__ICMediaAssetDownloadRequest_performRequestWithResponseHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 344);
  *(_QWORD *)(v2 + 344) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 392);
  *(_QWORD *)(v4 + 392) = 0;

}

@end
