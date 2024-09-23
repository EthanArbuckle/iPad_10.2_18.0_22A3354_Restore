@implementation ICMediaRedownloadRequest

- (ICMediaRedownloadRequest)init
{
  ICMediaRedownloadRequest *v2;
  ICMediaRedownloadRequest *v3;
  ICUnfairLock *v4;
  ICUnfairLock *lock;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICMediaRedownloadRequest;
  v2 = -[ICRequestOperation init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_requestURLBagKey, CFSTR("redownloadProduct"));
    v3->_includeKeybagSyncData = 1;
    v3->_includeSubscriptionKeybagSyncData = 0;
    v3->_usePrioritizedURLSession = 0;
    v4 = objc_alloc_init(ICUnfairLock);
    lock = v3->_lock;
    v3->_lock = v4;

  }
  return v3;
}

- (ICMediaRedownloadRequest)initWithRequestContext:(id)a3 redownloadParameters:(id)a4
{
  id v7;
  id v8;
  ICMediaRedownloadRequest *v9;
  ICMediaRedownloadRequest *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[ICMediaRedownloadRequest init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestContext, a3);
    objc_storeStrong((id *)&v10->_redownloadParameters, a4);
  }

  return v10;
}

- (ICMediaRedownloadRequest)initWithRequestContext:(id)a3 redownloadParametersString:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  ICMediaRedownloadRequest *v9;

  v6 = (void *)MEMORY[0x1E0C99E98];
  v7 = a3;
  objc_msgSend(v6, "ic_queryParametersDictionaryFromString:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICMediaRedownloadRequest initWithRequestContext:redownloadParameters:](self, "initWithRequestContext:redownloadParameters:", v7, v8);

  return v9;
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (self->_usePrioritizedURLSession)
    v5 = 25;
  else
    v5 = -1;
  objc_msgSend(MEMORY[0x1E0CB3828], "ic_sharedRequestOperationQueueWithQualityOfService:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__ICMediaRedownloadRequest_performRequestWithResponseHandler___block_invoke;
  v8[3] = &unk_1E43915E8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[ICRequestOperation performRequestOnOperationQueue:withCompletionHandler:](self, "performRequestOnOperationQueue:withCompletionHandler:", v6, v8);

}

- (void)execute
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  ICMediaRedownloadRequest *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = self;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting", buf, 0xCu);
  }

  -[ICRequestContext deviceInfo](self->_requestContext, "deviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAppleTV");

  if ((v5 & 1) != 0)
  {
    -[ICMediaRedownloadRequest _executeWithActiveICloudAccountProperties:](self, "_executeWithActiveICloudAccountProperties:", 0);
  }
  else
  {
    -[ICStoreRequestContext identityStore](self->_requestContext, "identityStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v6, "getPropertiesForActiveICloudAccountReturningError:", &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;

    if (v8)
    {
      v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v12 = self;
        v13 = 2114;
        v14 = v8;
        _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load icloud account properties. err=%{public}@", buf, 0x16u);
      }

    }
    -[ICMediaRedownloadRequest _executeWithActiveICloudAccountProperties:](self, "_executeWithActiveICloudAccountProperties:", v7);

  }
}

- (void)cancel
{
  ICUnfairLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__ICMediaRedownloadRequest_cancel__block_invoke;
  v3[3] = &unk_1E43913D8;
  v3[4] = self;
  -[ICUnfairLock lockWithBlock:](lock, "lockWithBlock:", v3);
}

- (void)_executeWithActiveICloudAccountProperties:(id)a3
{
  id v4;
  void *v5;
  ICStoreRequestContext *requestContext;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  requestContext = self->_requestContext;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__ICMediaRedownloadRequest__executeWithActiveICloudAccountProperties___block_invoke;
  v8[3] = &unk_1E438BEC0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "getBagAndURLMetricsForRequestContext:forceRefetch:withCompletionHandler:", requestContext, 0, v8);

}

- (BOOL)isPlaybackRequest
{
  return self->_playbackRequest;
}

- (void)setPlaybackRequest:(BOOL)a3
{
  self->_playbackRequest = a3;
}

- (BOOL)isStreamingRental
{
  return self->_streamingRental;
}

- (void)setStreamingRental:(BOOL)a3
{
  self->_streamingRental = a3;
}

- (BOOL)usePrioritizedURLSession
{
  return self->_usePrioritizedURLSession;
}

- (void)setUsePrioritizedURLSession:(BOOL)a3
{
  self->_usePrioritizedURLSession = a3;
}

- (ICURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
  objc_storeStrong((id *)&self->_urlSession, a3);
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setRequestContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSDictionary)redownloadParameters
{
  return self->_redownloadParameters;
}

- (void)setRedownloadParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (NSString)requestURLBagKey
{
  return self->_requestURLBagKey;
}

- (void)setRequestURLBagKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (BOOL)includeKeybagSyncData
{
  return self->_includeKeybagSyncData;
}

- (void)setIncludeKeybagSyncData:(BOOL)a3
{
  self->_includeKeybagSyncData = a3;
}

- (BOOL)includeSubscriptionKeybagSyncData
{
  return self->_includeSubscriptionKeybagSyncData;
}

- (void)setIncludeSubscriptionKeybagSyncData:(BOOL)a3
{
  self->_includeSubscriptionKeybagSyncData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestURLBagKey, 0);
  objc_storeStrong((id *)&self->_redownloadParameters, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_urlMetrics, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_storeURLRequest, 0);
  objc_storeStrong((id *)&self->_redownloadResponse, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
}

void __70__ICMediaRedownloadRequest__executeWithActiveICloudAccountProperties___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  BOOL v45;
  id v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  dispatch_semaphore_t v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  NSObject *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  uint64_t v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  _QWORD v79[5];
  id v80;
  id v81;
  id v82;
  id v83;
  _QWORD v84[5];
  id v85;
  dispatch_semaphore_t v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  uint64_t v92;
  void *v93;
  uint8_t buf[4];
  id v95;
  __int16 v96;
  id v97;
  __int16 v98;
  void *v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v8)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 336), a3);
  if (v9)
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v95 = v11;
      v96 = 2114;
      v97 = v9;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load url bag. err=%{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v9);
    goto LABEL_61;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    objc_msgSend(v7, "urlForBagKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 368));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = *(_QWORD **)(a1 + 32);
        v23 = (void *)v22[46];
        *(_DWORD *)buf = 138543618;
        v95 = v22;
        v96 = 2114;
        v97 = v23;
        _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_ERROR, "%{public}@ Failing due to missing bag key '%{public}@", buf, 0x16u);
      }

      v24 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "finishWithError:", v25);

      goto LABEL_60;
    }
    objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHTTPMethod:", CFSTR("POST"));
    v76 = v17;
    objc_msgSend(v17, "setValue:forHTTPHeaderField:", CFSTR("application/x-apple-plist"), CFSTR("Content-Type"));
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 360));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "deviceInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "deviceGUID");
    v20 = objc_claimAutoreleasedReturnValue();

    v77 = (void *)v20;
    if (v20)
    {
      objc_msgSend(v18, "setObject:forKey:", v20, CFSTR("guid"));
    }
    else
    {
      v26 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v95 = v27;
        _os_log_impl(&dword_1A03E3000, v26, OS_LOG_TYPE_ERROR, "%{public}@ Error getting deviceGUID", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "deviceInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isWatch");

    if (v29)
    {
      +[ICNanoPairedDeviceStatusMonitor sharedMonitor](ICNanoPairedDeviceStatusMonitor, "sharedMonitor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "pairedDeviceMediaGUID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
        objc_msgSend(v18, "setObject:forKey:", v31, CFSTR("companion-guid"));

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "deviceInfo");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "isAppleTV");

    if ((v33 & 1) == 0 && objc_msgSend(*(id *)(a1 + 40), "isCloudBackupEnabled"))
      objc_msgSend(v18, "setObject:forKey:", CFSTR("1"), CFSTR("icloud-backup-enabled"));
    v34 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v34 + 344))
    {
      objc_msgSend(v18, "setObject:forKey:", CFSTR("1"), CFSTR("lightweight"));
      objc_msgSend(v18, "setObject:forKey:", CFSTR("1"), CFSTR("playback"));
      v34 = *(_QWORD *)(a1 + 32);
    }
    if (*(_BYTE *)(v34 + 345))
    {
      objc_msgSend(v18, "setObject:forKey:", CFSTR("1"), CFSTR("streamingRental"));
      v34 = *(_QWORD *)(a1 + 32);
    }
    v78 = v18;
    objc_msgSend(*(id *)(v34 + 304), "identityStore");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "identity");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = 0;
    objc_msgSend(v35, "getPropertiesForUserIdentity:error:", v36, &v91);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v91;

    if (v38)
    {
      v39 = v37;
      v40 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      v41 = v77;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v42 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v95 = v42;
        v96 = 2114;
        v97 = v38;
        _os_log_impl(&dword_1A03E3000, v40, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve user account properties. err='%{public}@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v38);
      v43 = v76;
LABEL_59:

LABEL_60:
      goto LABEL_61;
    }
    v75 = v16;
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 347) || !objc_msgSend(v7, "canPostKeybagSyncData"))
    {
LABEL_46:
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 348))
      {
        objc_msgSend(v37, "DSID");
        v51 = objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend((id)v51, "unsignedLongLongValue");

        v87 = 0;
        v88 = 0;
        LOBYTE(v51) = +[ICADIUtilities generateMachineDataForAccountID:returningMachineIDData:otpData:error:](ICADIUtilities, "generateMachineDataForAccountID:returningMachineIDData:otpData:error:", -1, &v88, 0, &v87);
        v73 = v88;
        v53 = v87;
        if ((v51 & 1) != 0)
        {
          v54 = dispatch_semaphore_create(0);
          +[ICMusicSubscriptionFairPlayController sharedController](ICMusicSubscriptionFairPlayController, "sharedController");
          v71 = v53;
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v84[0] = MEMORY[0x1E0C809B0];
          v84[1] = 3221225472;
          v84[2] = __70__ICMediaRedownloadRequest__executeWithActiveICloudAccountProperties___block_invoke_31;
          v84[3] = &unk_1E438BE98;
          v84[4] = *(_QWORD *)(a1 + 32);
          v85 = v78;
          v86 = v54;
          v56 = v54;
          v57 = v52;
          v58 = v56;
          v59 = v73;
          objc_msgSend(v55, "generateSubscriptionBagRequestWithAccountUniqueIdentifier:transactionType:machineIDData:completionHandler:", v57, 312, v73, v84);

          v53 = v71;
          dispatch_semaphore_wait(v58, 0xFFFFFFFFFFFFFFFFLL);

        }
        else
        {
          v59 = v73;
          _ICLogCategoryDefault();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v95 = v53;
            _os_log_impl(&dword_1A03E3000, v58, OS_LOG_TYPE_DEFAULT, "failed to generate machine data for download request. err=%{public}@", buf, 0xCu);
          }
        }

      }
      v83 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v78, 100, 0, &v83);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v83;
      v62 = v61;
      if (!v60 || v61)
      {
        v74 = v60;
        v39 = v37;
        v65 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          v66 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138543874;
          v95 = v66;
          v96 = 2114;
          v97 = v62;
          v98 = 2114;
          v99 = v78;
          _os_log_impl(&dword_1A03E3000, v65, OS_LOG_TYPE_ERROR, "%{public}@ failed to serialize body data. err=%{public}@, bodyDictionary=%{public}@", buf, 0x20u);
        }

        v67 = *(void **)(a1 + 32);
        v68 = (void *)MEMORY[0x1E0CB35C8];
        v92 = *MEMORY[0x1E0CB3388];
        v93 = v62;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7005, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "finishWithError:", v70);

        v43 = v76;
        v60 = v74;
      }
      else
      {
        v39 = v37;
        v63 = *(_QWORD *)(a1 + 32);
        v64 = *(void **)(v63 + 328);
        v79[0] = MEMORY[0x1E0C809B0];
        v79[1] = 3221225472;
        v79[2] = __70__ICMediaRedownloadRequest__executeWithActiveICloudAccountProperties___block_invoke_37;
        v79[3] = &unk_1E43912A8;
        v79[4] = v63;
        v43 = v76;
        v80 = v76;
        v81 = v60;
        v82 = v7;
        objc_msgSend(v64, "lockWithBlock:", v79);

      }
      v16 = v75;
      v41 = v77;
      goto LABEL_59;
    }
    objc_msgSend(v37, "DSID");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = 0;
    v90 = 0;
    v45 = ICFairPlayCopyKeyBagSyncData(objc_msgSend(v44, "unsignedLongLongValue"), 1, &v90, &v89);
    v46 = v90;
    v72 = v89;

    if (v45)
    {
      v47 = v72;
      v48 = v46;
      if (!v46)
      {
LABEL_45:

        goto LABEL_46;
      }
      objc_msgSend(v46, "base64EncodedStringWithOptions:", 0);
      v49 = objc_claimAutoreleasedReturnValue();
      if (v49)
        objc_msgSend(v78, "setObject:forKey:", v49, CFSTR("kbsync"));
    }
    else
    {
      v48 = v46;
      _ICLogCategoryDefault();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v50 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v95 = v50;
        v96 = 2114;
        v47 = v72;
        v97 = v72;
        _os_log_impl(&dword_1A03E3000, v49, OS_LOG_TYPE_ERROR, "%{public}@ failed to copy keybag sync data. err=%{public}@", buf, 0x16u);
      }
      else
      {
        v47 = v72;
      }
    }

    goto LABEL_45;
  }
  v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v95 = v13;
    _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "%{public}@ stopping because the operation was cancelled", buf, 0xCu);
  }

  v14 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7004, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "finishWithError:", v15);

LABEL_61:
}

void __70__ICMediaRedownloadRequest__executeWithActiveICloudAccountProperties___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138543618;
      v10 = v8;
      v11 = 2114;
      v12 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "%{public}@ failed to generate subscription sync data. err=%{public}@", (uint8_t *)&v9, 0x16u);
    }
LABEL_7:

    goto LABEL_8;
  }
  if (v5)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v7, CFSTR("sbsync"));
    goto LABEL_7;
  }
LABEL_8:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void __70__ICMediaRedownloadRequest__executeWithActiveICloudAccountProperties___block_invoke_37(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  ICStoreURLRequest *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v25 = v3;
      _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_ERROR, "%{public}@ stopping because the operation was cancelled", buf, 0xCu);
    }

    v4 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7004, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishWithError:", v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setHTTPBody:", *(_QWORD *)(a1 + 48));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304));
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 320);
    *(_QWORD *)(v8 + 320) = v7;

    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 320);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mediaRedownload/%@"), *(_QWORD *)(v10 + 368));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "enableLoadURLMetricsWithRequestName:", v12);

    objc_msgSend(*(id *)(a1 + 32), "progress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "progress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addChild:withPendingUnitCount:", v14, 100);

    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 352);
    if (v16)
    {
      v17 = v16;
    }
    else
    {
      if (*(_BYTE *)(v15 + 346))
        +[ICURLSessionManager highPrioritySession](ICURLSessionManager, "highPrioritySession");
      else
        +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(_QWORD *)(v19 + 320);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __70__ICMediaRedownloadRequest__executeWithActiveICloudAccountProperties___block_invoke_43;
    v21[3] = &unk_1E438BF78;
    v21[4] = v19;
    v22 = v6;
    v23 = *(id *)(a1 + 56);
    v5 = v6;
    objc_msgSend(v18, "enqueueDataRequest:withCompletionHandler:", v20, v21);

  }
}

void __70__ICMediaRedownloadRequest__executeWithActiveICloudAccountProperties___block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  ICMediaRedownloadResponse *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v20 = 138543618;
    v21 = v8;
    v22 = 2114;
    v23 = v5;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Request completed with error %{public}@", (uint8_t *)&v20, 0x16u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "lock");
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 320);
  *(_QWORD *)(v9 + 320) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "unlock");
  objc_msgSend(v6, "parsedBodyDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ICMediaRedownloadResponse initWithResponseDictionary:requestDate:urlBag:]([ICMediaRedownloadResponse alloc], "initWithResponseDictionary:requestDate:urlBag:", v11, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 312);
  *(_QWORD *)(v13 + 312) = v12;

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336);
  objc_msgSend(v6, "aggregatedPerformanceMetrics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICURLAggregatedPerformanceMetrics aggregatedMetricsFromAggregatedMetrics:addingAggregatedMetrics:](ICURLAggregatedPerformanceMetrics, "aggregatedMetricsFromAggregatedMetrics:addingAggregatedMetrics:", v15, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 336);
  *(_QWORD *)(v18 + 336) = v17;

  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);
}

void __34__ICMediaRedownloadRequest_cancel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  objc_super v4;

  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)ICMediaRedownloadRequest;
  objc_msgSendSuper2(&v4, sel_cancel);
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 320))
  {
    if (*(_BYTE *)(v2 + 346))
      +[ICURLSessionManager highPrioritySession](ICURLSessionManager, "highPrioritySession");
    else
      +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelRequest:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320));

  }
}

void __62__ICMediaRedownloadRequest_performRequestWithResponseHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 312);
  *(_QWORD *)(v2 + 312) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 336);
  *(_QWORD *)(v4 + 336) = 0;

}

@end
