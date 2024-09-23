@implementation ICMusicSubscriptionPlaybackRequestOperation

- (ICMusicSubscriptionPlaybackRequestOperation)init
{
  ICMusicSubscriptionPlaybackRequestOperation *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICMusicSubscriptionPlaybackRequestOperation;
  v2 = -[ICAsyncOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicSubscriptionPlaybackRequestOperation.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)cancel
{
  NSObject *accessQueue;
  void *v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICMusicSubscriptionPlaybackRequestOperation;
  -[ICMusicSubscriptionPlaybackRequestOperation cancel](&v12, sel_cancel);
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5548;
  v10 = __Block_byref_object_dispose__5549;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__ICMusicSubscriptionPlaybackRequestOperation_cancel__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  if (v7[5])
  {
    +[ICURLSessionManager unlimitedHighPrioritySession](ICURLSessionManager, "unlimitedHighPrioritySession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelRequest:", v7[5]);

  }
  _Block_object_dispose(&v6, 8);

}

- (void)start
{
  void (**willBeginExecutionHandler)(id, ICMusicSubscriptionPlaybackRequestOperation *);
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  ICStoreRequestContext *requestContext;
  _QWORD v19[5];
  void (**v20)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  uint8_t buf[4];
  ICMusicSubscriptionPlaybackRequestOperation *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  willBeginExecutionHandler = (void (**)(id, ICMusicSubscriptionPlaybackRequestOperation *))self->_willBeginExecutionHandler;
  if (willBeginExecutionHandler)
  {
    willBeginExecutionHandler[2](willBeginExecutionHandler, self);
    v4 = self->_willBeginExecutionHandler;
    self->_willBeginExecutionHandler = 0;

  }
  v5 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke;
  v29[3] = &unk_1E438AAC0;
  v29[4] = self;
  v6 = (void *)MEMORY[0x1A1AFA8D0](v29, a2);
  v7 = objc_alloc(MEMORY[0x1E0D4D048]);
  v27[0] = v5;
  v27[1] = 3221225472;
  v27[2] = __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_2;
  v27[3] = &unk_1E438AAE8;
  v27[4] = self;
  v8 = v6;
  v28 = v8;
  v24[0] = v5;
  v24[1] = 3221225472;
  v24[2] = __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_16;
  v24[3] = &unk_1E438AB10;
  v9 = (id)objc_msgSend(v7, "initWithTimeout:interruptionHandler:", v27, 60.0);
  v25 = v9;
  v10 = v8;
  v26 = v10;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A1AFA8D0](v24);
  -[ICStoreRequestContext identity](self->_requestContext, "identity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:](ICPrivacyInfo, "sharedPrivacyInfoForUserIdentity:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "privacyAcknowledgementRequiredForMusic");

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7007, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, void *))v11)[2](v11, 0, 0, 0, v15);

  }
  else
  {
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__5548;
    v22[4] = __Block_byref_object_dispose__5549;
    v23 = 0;
    v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v31 = self;
      _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Fetching bag", buf, 0xCu);
    }

    +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    requestContext = self->_requestContext;
    v19[0] = v5;
    v19[1] = 3221225472;
    v19[2] = __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_19;
    v19[3] = &unk_1E438ABD8;
    v21 = v22;
    v19[4] = self;
    v20 = v11;
    objc_msgSend(v17, "getBagAndURLMetricsForRequestContext:forceRefetch:withCompletionHandler:", requestContext, 0, v19);

    _Block_object_dispose(v22, 8);
  }

}

- (NSString)assetSourceStorefrontID
{
  return self->_assetSourceStorefrontID;
}

- (void)setAssetSourceStorefrontID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (BOOL)isDelegatedPlayback
{
  return self->_delegatedPlayback;
}

- (void)setDelegatedPlayback:(BOOL)a3
{
  self->_delegatedPlayback = a3;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(int64_t)a3
{
  self->_requestType = a3;
}

- (id)willBeginExecutionHandler
{
  return self->_willBeginExecutionHandler;
}

- (void)setWillBeginExecutionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setRequestContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (unint64_t)storeCloudID
{
  return self->_storeCloudID;
}

- (void)setStoreCloudID:(unint64_t)a3
{
  self->_storeCloudID = a3;
}

- (int64_t)storeSubscriptionAdamID
{
  return self->_storeSubscriptionAdamID;
}

- (void)setStoreSubscriptionAdamID:(int64_t)a3
{
  self->_storeSubscriptionAdamID = a3;
}

- (int64_t)storePurchasedAdamID
{
  return self->_storePurchasedAdamID;
}

- (void)setStorePurchasedAdamID:(int64_t)a3
{
  self->_storePurchasedAdamID = a3;
}

- (NSString)cloudUniversalLibraryID
{
  return self->_cloudUniversalLibraryID;
}

- (void)setCloudUniversalLibraryID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (BOOL)isFollowUp
{
  return self->_followUp;
}

- (void)setFollowUp:(BOOL)a3
{
  self->_followUp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudUniversalLibraryID, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong(&self->_willBeginExecutionHandler, 0);
  objc_storeStrong((id *)&self->_assetSourceStorefrontID, 0);
  objc_storeStrong((id *)&self->_activeURLRequest, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v9 = a5;
  v10 = *(_QWORD **)(a1 + 32);
  v11 = v10[43];
  v14 = v9;
  if (v11)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, id))(v11 + 16))(v11, a2, a3, a4, v9);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 344);
    *(_QWORD *)(v12 + 344) = 0;

    v9 = v14;
    v10 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v10, "finishWithError:", v9);

}

uint64_t __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v8 = v3;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_ERROR, "%{public}@ execution timed out", buf, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -7003, CFSTR("ICMusicSubscriptionPlaybackRequestOperation timed out"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v4 + 16))(v4, 0, 0, 0, v5);

  return objc_msgSend(MEMORY[0x1E0D4D030], "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", *MEMORY[0x1E0D4CE48], CFSTR("Timeout"), CFSTR("SubPlaybackDispatchTimedOut"), &stru_1E4391778, 0, 0, 0);
}

void __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_16(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;

  v12 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_19(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void (**v29)(_QWORD, _QWORD, _QWORD);
  void *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  ICStoreURLRequest *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  ICStoreURLRequest *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  _QWORD v50[5];
  id v51;
  void (**v52)(_QWORD, _QWORD, _QWORD);
  uint64_t v53;
  _QWORD block[5];
  ICStoreURLRequest *v55;
  _QWORD v56[5];
  id v57;
  __CFString *v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  ICStoreURLRequest *v63;
  uint64_t v64;
  void *v65;
  uint8_t buf[4];
  uint64_t v67;
  __int16 v68;
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  +[ICURLAggregatedPerformanceMetrics aggregatedMetricsFromAggregatedMetrics:addingAggregatedMetrics:](ICURLAggregatedPerformanceMetrics, "aggregatedMetricsFromAggregatedMetrics:addingAggregatedMetrics:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  if (!v8)
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 304))
      v14 = CFSTR("delegatePlayback");
    else
      v14 = CFSTR("subDownload");
    v15 = v14;
    objc_msgSend(v7, "urlForBagKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v67 = v21;
        _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_ERROR, "%{public}@ playback endpoing missing from bag - treating as an error", buf, 0xCu);
      }

      v22 = *(_QWORD *)(a1 + 40);
      v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v64 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing bag key '%@'"), v15);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t, void *))(v22 + 16))(v22, 0, 0, v23, v27);

      goto LABEL_27;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
    {
      v17 = *(_QWORD *)(a1 + 40);
      v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7004, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t, void *))(v17 + 16))(v17, 0, 0, v18, v19);

LABEL_27:
      goto LABEL_28;
    }
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_25;
    v56[3] = &unk_1E438AB88;
    v56[4] = *(_QWORD *)(a1 + 32);
    v57 = v16;
    v58 = v15;
    v61 = *(_QWORD *)(a1 + 48);
    v28 = v7;
    v59 = v28;
    v60 = *(id *)(a1 + 40);
    v29 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A1AFA8D0](v56);
    +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "isMac"))
    {
      v31 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320);

      if (v31 != 3)
      {
        objc_msgSend(v28, "urlForBagKey:", CFSTR("fps-cert"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        v34 = v33;
        if (v32)
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            v35 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543362;
            v67 = v35;
            _os_log_impl(&dword_1A03E3000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ Fetching certificate", buf, 0xCu);
          }

          v36 = -[ICStoreURLRequest initWithURL:requestContext:]([ICStoreURLRequest alloc], "initWithURL:requestContext:", v32, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336));
          -[ICStoreURLRequest setShouldParseBodyData:](v36, "setShouldParseBodyData:", 0);
          v37 = *(_QWORD *)(a1 + 32);
          v38 = *(NSObject **)(v37 + 288);
          v39 = MEMORY[0x1E0C809B0];
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_50;
          block[3] = &unk_1E4391110;
          block[4] = v37;
          v55 = v36;
          v40 = v36;
          dispatch_barrier_async(v38, block);
          +[ICURLSessionManager unlimitedHighPrioritySession](ICURLSessionManager, "unlimitedHighPrioritySession");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v50[0] = v39;
          v50[1] = 3221225472;
          v50[2] = __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_2_51;
          v50[3] = &unk_1E438ABB0;
          v43 = *(void **)(a1 + 40);
          v42 = *(_QWORD *)(a1 + 48);
          v50[4] = *(_QWORD *)(a1 + 32);
          v53 = v42;
          v51 = v43;
          v52 = v29;
          objc_msgSend(v41, "enqueueDataRequest:withCompletionHandler:", v40, v50);

        }
        else
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            v44 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543362;
            v67 = v44;
            _os_log_impl(&dword_1A03E3000, v34, OS_LOG_TYPE_ERROR, "%{public}@ certificate url missing from bag - treating as an error", buf, 0xCu);
          }

          v45 = *(_QWORD *)(a1 + 40);
          v49 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          v46 = (void *)MEMORY[0x1E0CB35C8];
          v62 = *MEMORY[0x1E0CB2938];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing bag key '%@'"), CFSTR("fps-cert"));
          v40 = (ICStoreURLRequest *)objc_claimAutoreleasedReturnValue();
          v63 = v40;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t, void *))(v45 + 16))(v45, 0, 0, v49, v48);

        }
        goto LABEL_26;
      }
    }
    else
    {

    }
    v29[2](v29, 0, 0);
LABEL_26:

    goto LABEL_27;
  }
  v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v67 = v13;
    v68 = 2114;
    v69 = v8;
    _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load bag. err=%{public}@", buf, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_28:

}

void __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  ICMusicSubscriptionPlaybackURLRequest *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void **v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  ICMusicSubscriptionPlaybackURLRequest *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  _QWORD block[5];
  ICMusicSubscriptionPlaybackURLRequest *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v34 = v8;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting playback request", buf, 0xCu);
  }

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v9, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICMusicSubscriptionPlaybackURLRequest alloc], "initWithURLRequest:requestContext:", v9, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336));
  -[ICMusicSubscriptionPlaybackURLRequest setAssetSourceStorefrontID:](v10, "setAssetSourceStorefrontID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 312));
  -[ICMusicSubscriptionPlaybackURLRequest setRequestType:](v10, "setRequestType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320));
  -[ICMusicSubscriptionPlaybackURLRequest setStoreCloudID:](v10, "setStoreCloudID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 352));
  -[ICMusicSubscriptionPlaybackURLRequest setStorePurchasedAdamID:](v10, "setStorePurchasedAdamID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 368));
  -[ICMusicSubscriptionPlaybackURLRequest setStoreSubscriptionAdamID:](v10, "setStoreSubscriptionAdamID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 360));
  -[ICMusicSubscriptionPlaybackURLRequest setDelegatedPlayback:](v10, "setDelegatedPlayback:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 304));
  -[ICMusicSubscriptionPlaybackURLRequest setCloudUniversalLibraryID:](v10, "setCloudUniversalLibraryID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 376));
  -[ICMusicSubscriptionPlaybackURLRequest setLeaseCertificateData:](v10, "setLeaseCertificateData:", v6);

  -[ICMusicSubscriptionPlaybackURLRequest setLeaseAssetIDData:](v10, "setLeaseAssetIDData:", v5);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("subPlaybackDispatch/%@"), *(_QWORD *)(a1 + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICURLRequest enableLoadURLMetricsWithRequestName:](v10, "enableLoadURLMetricsWithRequestName:", v11);

  v12 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v12 + 320) != 1)
  {
    -[ICURLRequest setRetryDelay:](v10, "setRetryDelay:", 1.0);
    v12 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v12 + 305))
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("followup"), CFSTR("1"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v13;
    v14 = &v32;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICStoreURLRequest setAdditionalQueryItems:](v10, "setAdditionalQueryItems:", v15);

    goto LABEL_12;
  }
  if (!*(_QWORD *)(v12 + 352)
    && !*(_QWORD *)(v12 + 368)
    && !*(_QWORD *)(v12 + 360)
    && !objc_msgSend(*(id *)(v12 + 376), "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("lease-only"), CFSTR("1"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v13;
    v14 = &v31;
    goto LABEL_7;
  }
LABEL_12:
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(NSObject **)(v16 + 288);
  v18 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_41;
  block[3] = &unk_1E4391110;
  block[4] = v16;
  v30 = v10;
  v19 = v10;
  dispatch_barrier_async(v17, block);
  +[ICURLSessionManager unlimitedHighPrioritySession](ICURLSessionManager, "unlimitedHighPrioritySession");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v18;
  v24[1] = 3221225472;
  v24[2] = __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_2_42;
  v24[3] = &unk_1E438AB60;
  v21 = *(_QWORD *)(a1 + 32);
  v28 = *(_QWORD *)(a1 + 72);
  v24[4] = v21;
  v25 = v23;
  v26 = *(id *)(a1 + 56);
  v27 = *(id *)(a1 + 64);
  v22 = v23;
  objc_msgSend(v20, "enqueueDataRequest:withCompletionHandler:", v19, v24);

}

void __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_50(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 296), *(id *)(a1 + 40));
}

void __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_2_51(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = a1[4];
  v8 = *(NSObject **)(v7 + 288);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_3_52;
  block[3] = &unk_1E43913D8;
  block[4] = v7;
  dispatch_barrier_async(v8, block);
  v9 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  objc_msgSend(v5, "aggregatedPerformanceMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICURLAggregatedPerformanceMetrics aggregatedMetricsFromAggregatedMetrics:addingAggregatedMetrics:](ICURLAggregatedPerformanceMetrics, "aggregatedMetricsFromAggregatedMetrics:addingAggregatedMetrics:", v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1[7] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  if (v6)
  {
    v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = a1[4];
      *(_DWORD *)buf = 138543618;
      v24 = v15;
      v25 = 2114;
      v26 = v6;
      _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load certificate data. err=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    objc_msgSend(v5, "bodyData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", "lease", 5);
      (*(void (**)(void))(a1[6] + 16))();
    }
    else
    {
      v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = a1[4];
        *(_DWORD *)buf = 138543362;
        v24 = v19;
        _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_ERROR, "%{public}@ No certificate data in response - treating as an error", buf, 0xCu);
      }

      v20 = a1[5];
      v21 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t, void *))(v20 + 16))(v20, 0, 0, v21, v17);
    }

  }
}

void __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_3_52(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 296);
  *(_QWORD *)(v1 + 296) = 0;

}

void __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_41(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 296), *(id *)(a1 + 40));
}

void __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_2_42(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  ICMusicSubscriptionPlaybackResponse *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  ICMusicSubscriptionPlaybackResponse *v20;
  uint64_t v21;
  _QWORD v22[4];
  ICMusicSubscriptionPlaybackResponse *v23;
  id v24;
  uint64_t v25;
  _QWORD block[5];

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 288);
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_3;
  block[3] = &unk_1E43913D8;
  block[4] = v6;
  v9 = a2;
  dispatch_barrier_async(v7, block);
  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(v9, "aggregatedPerformanceMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICURLAggregatedPerformanceMetrics aggregatedMetricsFromAggregatedMetrics:addingAggregatedMetrics:](ICURLAggregatedPerformanceMetrics, "aggregatedMetricsFromAggregatedMetrics:addingAggregatedMetrics:", v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  objc_msgSend(v9, "parsedBodyDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = -[ICMusicSubscriptionPlaybackResponse initWithResponseDictionary:requestDate:urlBag:]([ICMusicSubscriptionPlaybackResponse alloc], "initWithResponseDictionary:requestDate:urlBag:", v15, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    -[ICMusicSubscriptionPlaybackResponse leaseInfoData](v16, "leaseInfoData");
    v17 = objc_claimAutoreleasedReturnValue();
    -[ICMusicSubscriptionPlaybackResponse subscriptionKeyBagData](v16, "subscriptionKeyBagData");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v17 | v18)
    {
      +[ICMusicSubscriptionFairPlayController sharedController](ICMusicSubscriptionFairPlayController, "sharedController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v8;
      v22[1] = 3221225472;
      v22[2] = __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_4;
      v22[3] = &unk_1E438AB38;
      v24 = *(id *)(a1 + 56);
      v20 = v16;
      v21 = *(_QWORD *)(a1 + 64);
      v23 = v20;
      v25 = v21;
      objc_msgSend(v19, "importSubscriptionKeyBagData:leaseInfoData:completionHandler:", v18, v17, v22);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    v16 = (ICMusicSubscriptionPlaybackResponse *)v5;
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
      v16 = (ICMusicSubscriptionPlaybackResponse *)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 296);
  *(_QWORD *)(v1 + 296) = 0;

}

uint64_t __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD, uint64_t))(a1[5] + 16))(a1[5], a1[4], a2, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
}

void __53__ICMusicSubscriptionPlaybackRequestOperation_cancel__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 296));
}

@end
