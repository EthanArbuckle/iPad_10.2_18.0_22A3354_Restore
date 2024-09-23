@implementation ICBuyProductRequest

- (ICBuyProductRequest)initWithRequestContext:(id)a3 buyParameters:(id)a4 includeKeybagSyncData:(BOOL)a5
{
  id v9;
  id v10;
  ICBuyProductRequest *v11;
  ICBuyProductRequest *v12;

  v9 = a3;
  v10 = a4;
  v11 = -[ICRequestOperation init](self, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_requestContext, a3);
    objc_storeStrong((id *)&v12->_buyParameters, a4);
    v12->_includeKeybagSyncData = a5;
  }

  return v12;
}

- (ICBuyProductRequest)initWithRequestContext:(id)a3 buyParametersString:(id)a4 includeKeybagSyncData:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  void *v10;
  ICBuyProductRequest *v11;

  v5 = a5;
  v8 = (void *)MEMORY[0x1E0C99E98];
  v9 = a3;
  objc_msgSend(v8, "ic_queryParametersDictionaryFromString:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ICBuyProductRequest initWithRequestContext:buyParameters:includeKeybagSyncData:](self, "initWithRequestContext:buyParameters:includeKeybagSyncData:", v9, v10, v5);

  return v11;
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3828], "ic_sharedRequestOperationQueueWithQualityOfService:", 25);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__ICBuyProductRequest_performRequestWithResponseHandler___block_invoke;
  v7[3] = &unk_1E43915E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[ICRequestOperation performRequestOnOperationQueue:withCompletionHandler:](self, "performRequestOnOperationQueue:withCompletionHandler:", v5, v7);

}

- (void)execute
{
  NSObject *v3;
  NSDictionary *buyParameters;
  void *v5;
  ICStoreRequestContext *requestContext;
  _QWORD v7[5];
  uint8_t buf[4];
  ICBuyProductRequest *v9;
  __int16 v10;
  NSDictionary *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    buyParameters = self->_buyParameters;
    *(_DWORD *)buf = 138543618;
    v9 = self;
    v10 = 2114;
    v11 = buyParameters;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing BuyProdcut request with params %{public}@", buf, 0x16u);
  }

  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  requestContext = self->_requestContext;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__ICBuyProductRequest_execute__block_invoke;
  v7[3] = &unk_1E4391658;
  v7[4] = self;
  objc_msgSend(v5, "getBagForRequestContext:withCompletionHandler:", requestContext, v7);

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICBuyProductRequest;
  -[ICBuyProductRequest cancel](&v4, sel_cancel);
  +[ICURLSessionManager highPrioritySession](ICURLSessionManager, "highPrioritySession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelRequest:", self->_storeURLRequest);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_parsedResponse, 0);
  objc_storeStrong((id *)&self->_buyParameters, 0);
  objc_storeStrong((id *)&self->_storeURLRequest, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
}

void __30__ICBuyProductRequest_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v20 = v8;
      v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to load url bag. err=%{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  else
  {
    objc_msgSend(v5, "urlForBagKey:", CFSTR("buyProduct"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "identityStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "identity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __30__ICBuyProductRequest_execute__block_invoke_4;
      v16[3] = &unk_1E438E6F0;
      v16[4] = *(_QWORD *)(a1 + 32);
      v17 = v9;
      v18 = v5;
      objc_msgSend(v10, "getPropertiesForUserIdentity:completionHandler:", v11, v16);

    }
    else
    {
      v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v20 = v13;
        _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Missing buyProduct url in bag - skipping", buf, 0xCu);
      }

      v14 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "finishWithError:", v15);

    }
  }

}

void __30__ICBuyProductRequest_execute__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  id v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  ICStoreURLRequest *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[5];
  id v41;
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v44 = v8;
      v45 = 2114;
      v46 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to load identity properties. err=%{public}@", buf, 0x16u);
    }

    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishWithError:", v10);
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v10, "setValue:forHTTPHeaderField:", CFSTR("application/x-apple-plist"), CFSTR("Content-Type"));
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isWatch") & 1) != 0)
  {
    +[ICEnvironmentMonitor sharedMonitor](ICEnvironmentMonitor, "sharedMonitor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "networkType");

    if (v13 == 500)
      objc_msgSend(v10, "setValue:forHTTPHeaderField:", CFSTR("WiFi"), CFSTR("X-Apple-Connection-Type"));
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "deviceInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deviceGUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "deviceInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "deviceGUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v18, CFSTR("guid"));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "deviceInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isWatch");

  if (v20)
  {
    +[ICNanoPairedDeviceStatusMonitor sharedMonitor](ICNanoPairedDeviceStatusMonitor, "sharedMonitor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "pairedDeviceMediaGUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
      objc_msgSend(v14, "setObject:forKey:", v22, CFSTR("companion-guid"));

  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 328) && objc_msgSend(*(id *)(a1 + 48), "canPostKeybagSyncData"))
  {
    objc_msgSend(v5, "DSID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    v42 = 0;
    v24 = ICFairPlayCopyKeyBagSyncData(objc_msgSend(v23, "unsignedLongLongValue"), 1, &v42, &v41);
    v25 = v42;
    v26 = v41;

    if (v24)
    {
      if (!v25)
      {
LABEL_24:

        goto LABEL_25;
      }
      objc_msgSend(v25, "base64EncodedStringWithOptions:", 0);
      v27 = objc_claimAutoreleasedReturnValue();
      if (v27)
        objc_msgSend(v14, "setObject:forKey:", v27, CFSTR("kbsync"));
    }
    else
    {
      v27 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v44 = v28;
        v45 = 2114;
        v46 = v26;
        _os_log_impl(&dword_1A03E3000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to copy keybag sync data. err=%{public}@", buf, 0x16u);
      }
    }

    goto LABEL_24;
  }
LABEL_25:
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isWatch");

  if (v30)
    objc_msgSend(v14, "setObject:forKey:", CFSTR("true"), CFSTR("wasWarnedOverLimitBuyOnCellular"));
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v14, 100, 0, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    objc_msgSend(v10, "setHTTPBody:", v31);
  v32 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", v10, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304));
  v33 = *(_QWORD *)(a1 + 32);
  v34 = *(void **)(v33 + 312);
  *(_QWORD *)(v33 + 312) = v32;

  objc_msgSend(*(id *)(a1 + 32), "progress");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "progress");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addChild:withPendingUnitCount:", v36, 100);

  +[ICURLSessionManager highPrioritySession](ICURLSessionManager, "highPrioritySession");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = *(_QWORD *)(a1 + 32);
  v39 = *(_QWORD *)(v38 + 312);
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __30__ICBuyProductRequest_execute__block_invoke_26;
  v40[3] = &unk_1E4391630;
  v40[4] = v38;
  objc_msgSend(v37, "enqueueDataRequest:withCompletionHandler:", v39, v40);

LABEL_30:
}

void __30__ICBuyProductRequest_execute__block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v14 = 138543618;
      v15 = v7;
      v16 = 2114;
      v17 = v5;
      v8 = "%{public}@ buyProduct request failed. err=%{public}@";
LABEL_6:
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    objc_msgSend(a2, "parsedBody");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 336);
    *(_QWORD *)(v10 + 336) = v9;

    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(v12 + 336);
      v14 = 138543618;
      v15 = v12;
      v16 = 2114;
      v17 = v13;
      v8 = "%{public}@ buyProduct request returned response %{public}@";
      goto LABEL_6;
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);
}

uint64_t __57__ICBuyProductRequest_performRequestWithResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336), a2);
}

@end
