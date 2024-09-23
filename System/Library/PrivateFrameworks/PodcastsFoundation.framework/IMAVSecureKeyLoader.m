@implementation IMAVSecureKeyLoader

- (IMAVSecureKeyLoader)initWithRecipient:(id)a3 useCase:(unint64_t)a4 account:(id)a5 urlProtocolDelegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  IMAVSecureKeyLoader *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  MTStandardKeyRequestHandler *v16;
  void *v17;
  MTCoreDataKeyRequestStorage *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)IMAVSecureKeyLoader;
  v13 = -[IMAVSecureKeyLoader init](&v23, sel_init);
  if (v13)
  {
    if (initWithRecipient_useCase_account_urlProtocolDelegate__onceToken != -1)
      dispatch_once(&initWithRecipient_useCase_account_urlProtocolDelegate__onceToken, &__block_literal_global_23);
    if (a4 == 1)
    {
      v14 = dispatch_queue_create("IMAVSecureKeyLoader.Download", 0);
      -[IMAVSecureKeyLoader setKeyLoaderQueue:](v13, "setKeyLoaderQueue:", v14);
    }
    else
    {
      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = dispatch_queue_create("IMAVSecureKeyLoader", v14);
      -[IMAVSecureKeyLoader setKeyLoaderQueue:](v13, "setKeyLoaderQueue:", v15);

    }
    -[IMAVSecureKeyLoader setRecipient:](v13, "setRecipient:", v10);
    -[IMAVSecureKeyLoader setAccount:](v13, "setAccount:", v11);
    v16 = objc_alloc_init(MTStandardKeyRequestHandler);
    if (v12)
    {
      -[IMAVSecureKeyLoader setUrlProtocolDelegate:](v13, "setUrlProtocolDelegate:", v12);
      -[IMAVSecureKeyLoader urlProtocolDelegate](v13, "urlProtocolDelegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMBaseStoreService setURLProtocolDelegate:](v16, "setURLProtocolDelegate:", v17);

    }
    -[IMAVSecureKeyLoader setSecureKeyRequestHandler:](v13, "setSecureKeyRequestHandler:", v16);
    v18 = objc_alloc_init(MTCoreDataKeyRequestStorage);
    -[IMAVSecureKeyLoader setSecureKeyRequestStorage:](v13, "setSecureKeyRequestStorage:", v18);

    -[IMAVSecureKeyLoader setUseCase:](v13, "setUseCase:", a4);
    objc_msgSend(MEMORY[0x1E0C8B1A0], "contentKeySessionWithKeySystem:", *MEMORY[0x1E0C8A1F0]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAVSecureKeyLoader setContentKeySession:](v13, "setContentKeySession:", v19);

    -[IMAVSecureKeyLoader contentKeySession](v13, "contentKeySession");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAVSecureKeyLoader keyLoaderQueue](v13, "keyLoaderQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDelegate:queue:", v13, v21);

  }
  return v13;
}

void __77__IMAVSecureKeyLoader_initWithRecipient_useCase_account_urlProtocolDelegate___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)__pendingStopNonceRequestAdamIds;
  __pendingStopNonceRequestAdamIds = (uint64_t)v0;

}

- (void)startKeyLoadingProcessWithKeyRequestData:(id)a3 isRenewal:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "keyIdentifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentAdamId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMAVSecureKeyLoader startKeyLoadingProcessWithKeyIdentifier:contentAdamId:isRenewal:completion:](self, "startKeyLoadingProcessWithKeyIdentifier:contentAdamId:isRenewal:completion:", v11, v10, v5, v8);
}

- (void)startKeyLoadingProcessWithKeyIdentifier:(id)a3 contentAdamId:(id)a4 isRenewal:(BOOL)a5 completion:(id)a6
{
  void *v6;
  _BOOL8 v8;
  id v11;
  id v12;
  void (**v13)(id, void *);
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _QWORD v29[5];
  id v30;
  void (**v31)(id, void *);
  _QWORD block[5];
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v8 = a5;
  v39 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = (void (**)(id, void *))a6;
  _MTLogCategoryDRM();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v34 = v11;
    v35 = 2112;
    v36 = v12;
    _os_log_impl(&dword_1A904E000, v14, OS_LOG_TYPE_DEFAULT, "[Key Loading Process] for key: %@, content adam id: %@.", buf, 0x16u);
  }

  -[IMAVSecureKeyLoader contentAdamId](self, "contentAdamId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[IMAVSecureKeyLoader contentAdamId](self, "contentAdamId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", v12) & 1) == 0)
    {

LABEL_9:
      _MTLogCategoryDRM();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        -[IMAVSecureKeyLoader contentAdamId](self, "contentAdamId");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v34 = v11;
        v35 = 2112;
        v36 = v12;
        v37 = 2112;
        v38 = v18;
        _os_log_impl(&dword_1A904E000, v17, OS_LOG_TYPE_ERROR, "[Key Loading Process] Fail to start key: %@, content adam id: %@. Another request is in progress for content adam id: %@.", buf, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMAVSecureKeyLoaderErrorDomain"), -383006, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        v13[2](v13, v19);
      _MTLogCategoryDRM();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        -[IMAVSecureKeyLoader startKeyLoadingProcessWithKeyIdentifier:contentAdamId:isRenewal:completion:].cold.1(v20);

      goto LABEL_21;
    }
  }
  -[IMAVSecureKeyLoader pendingCompletion](self, "pendingCompletion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {

  }
  if (v16)
    goto LABEL_9;
  -[IMAVSecureKeyLoader setContentAdamId:](self, "setContentAdamId:", v12);
  -[IMAVSecureKeyLoader setIsRenewal:](self, "setIsRenewal:", v8);
  v21 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__IMAVSecureKeyLoader_startKeyLoadingProcessWithKeyIdentifier_contentAdamId_isRenewal_completion___block_invoke;
  block[3] = &unk_1E54D0DE0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  -[IMAVSecureKeyLoader recipient](self, "recipient");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    _MTLogCategoryDRM();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      -[IMAVSecureKeyLoader recipient](self, "recipient");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMAVSecureKeyLoader contentAdamId](self, "contentAdamId");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v34 = v24;
      v35 = 2112;
      v36 = v11;
      v37 = 2112;
      v38 = v25;
      _os_log_impl(&dword_1A904E000, v23, OS_LOG_TYPE_DEFAULT, "[Key Loading Process] Add recipient %@ key: %@, content adam id: %@.", buf, 0x20u);

    }
    -[IMAVSecureKeyLoader contentKeySession](self, "contentKeySession");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAVSecureKeyLoader recipient](self, "recipient");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addContentKeyRecipient:", v27);

  }
  -[IMAVSecureKeyLoader keyLoaderQueue](self, "keyLoaderQueue");
  v28 = objc_claimAutoreleasedReturnValue();
  v29[0] = v21;
  v29[1] = 3221225472;
  v29[2] = __98__IMAVSecureKeyLoader_startKeyLoadingProcessWithKeyIdentifier_contentAdamId_isRenewal_completion___block_invoke_47;
  v29[3] = &unk_1E54D3868;
  v29[4] = self;
  v31 = v13;
  v30 = v11;
  dispatch_async(v28, v29);

LABEL_21:
}

uint64_t __98__IMAVSecureKeyLoader_startKeyLoadingProcessWithKeyIdentifier_contentAdamId_isRenewal_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel_timeoutKeyRequest, 0);
}

void __98__IMAVSecureKeyLoader_startKeyLoadingProcessWithKeyIdentifier_contentAdamId_isRenewal_completion___block_invoke_47(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setPendingCompletion:", *(_QWORD *)(a1 + 48));
  if (objc_msgSend(*(id *)(a1 + 40), "length"))
  {
    _MTLogCategoryDRM();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "contentAdamId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v8 = v3;
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_1A904E000, v2, OS_LOG_TYPE_DEFAULT, "[Key Loading Process] Pre-loading key: %@, content adam id: %@.", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "contentKeySession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "processContentKeyRequestWithIdentifier:initializationData:options:", *(_QWORD *)(a1 + 40), 0, 0);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__IMAVSecureKeyLoader_startKeyLoadingProcessWithKeyIdentifier_contentAdamId_isRenewal_completion___block_invoke_48;
  block[3] = &unk_1E54D0DE0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __98__IMAVSecureKeyLoader_startKeyLoadingProcessWithKeyIdentifier_contentAdamId_isRenewal_completion___block_invoke_48(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel_timeoutKeyRequest, 0, 10.0);
}

- (void)sendStopRequestForStreamingLicenseIfNecessary
{
  NSObject *v3;
  _QWORD block[5];

  if (!-[IMAVSecureKeyLoader _isOfflineAsset](self, "_isOfflineAsset"))
  {
    -[IMAVSecureKeyLoader keyLoaderQueue](self, "keyLoaderQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__IMAVSecureKeyLoader_sendStopRequestForStreamingLicenseIfNecessary__block_invoke;
    block[3] = &unk_1E54D0DE0;
    block[4] = self;
    dispatch_async(v3, block);

  }
}

void __68__IMAVSecureKeyLoader_sendStopRequestForStreamingLicenseIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  NSObject *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "contentKeySession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recipient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeContentKeyRecipient:", v3);

  _MTLogCategoryDRM();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "recipient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_1A904E000, v4, OS_LOG_TYPE_ERROR, "Removing content key recipient for URL: %@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "savedRequestToUseForStopping");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(*(id *)(a1 + 32), "savedRequestDataToUseForStopping");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "savedRequestToUseForStopping");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copyWith:", 2);

      objc_msgSend(*(id *)(a1 + 32), "secureKeyRequestHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "account");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __68__IMAVSecureKeyLoader_sendStopRequestForStreamingLicenseIfNecessary__block_invoke_50;
      v16[3] = &unk_1E54D3C38;
      v16[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v12, "loadKeyDataFor:account:completion:", v13, v14, v16);

LABEL_8:
      goto LABEL_9;
    }
  }
  _MTLogCategoryDRM();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "recipient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "contentAdamId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v13;
    v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_1A904E000, v11, OS_LOG_TYPE_ERROR, "Failed to send stop request because a start request was never made. URL: %@ Content ID %@", buf, 0x16u);

    goto LABEL_8;
  }
LABEL_9:

}

void __68__IMAVSecureKeyLoader_sendStopRequestForStreamingLicenseIfNecessary__block_invoke_50(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    _MTLogCategoryDRM();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "recipient");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "contentAdamId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_1A904E000, v5, OS_LOG_TYPE_ERROR, "Stop request failed with error %@ for Content ID %@", (uint8_t *)&v9, 0x16u);

    }
  }
}

- (void)securelyInvalidateOfflineDataForRequests:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  IMAVSecureKeyLoader *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (-[IMAVSecureKeyLoader useCase](self, "useCase") != 1)
    -[IMAVSecureKeyLoader securelyInvalidateOfflineDataForRequests:completion:].cold.1();
  -[IMAVSecureKeyLoader keyLoaderQueue](self, "keyLoaderQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__IMAVSecureKeyLoader_securelyInvalidateOfflineDataForRequests_completion___block_invoke;
  block[3] = &unk_1E54D3248;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __75__IMAVSecureKeyLoader_securelyInvalidateOfflineDataForRequests_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  __int128 v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  MTContentKeyRequest *v15;
  void *v16;
  void *v17;
  void *v18;
  MTContentKeyRequest *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  dispatch_time_t v34;
  uint64_t v35;
  __int128 v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  void *v43;
  id v44;
  id obj;
  _QWORD v46[5];
  id v47;
  id v48;
  id v49;
  NSObject *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  uint64_t v56;
  _BYTE v57[128];
  uint64_t v58;

  v1 = a1;
  v58 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v3 = dispatch_group_create();
  v4 = objc_msgSend(*(id *)(v1 + 32), "count");
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    *(_QWORD *)&v5 = 138412290;
    v36 = v5;
    v38 = v2;
    v39 = v1;
    v37 = v3;
    do
    {
      v42 = v6;
      if (v6 >= 0xA)
        v8 = 10;
      else
        v8 = v6;
      v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(v1 + 32), "count"));
      v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v40 = v8;
      v41 = v7;
      objc_msgSend(*(id *)(v1 + 32), "subarrayWithRange:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v3);
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      obj = v9;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v52;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v52 != v12)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v13);
            v15 = [MTContentKeyRequest alloc];
            objc_msgSend(v14, "keyIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "contentAdamId");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "secureInvalidationDsid");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = -[MTContentKeyRequest initWithKeyIdentifier:adamId:requestType:offlineRequest:secureInvalidationDsid:](v15, "initWithKeyIdentifier:adamId:requestType:offlineRequest:secureInvalidationDsid:", v16, v17, 3, 1, v18);

            objc_msgSend(v14, "contentAdamId");
            v20 = objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              v21 = (void *)v20;
              objc_msgSend(v14, "keyData");
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              if (v22)
              {
                objc_msgSend(v14, "keyData");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "contentAdamId");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "setObject:forKeyedSubscript:", v23, v24);

              }
            }
            v25 = __pendingStopNonceRequestAdamIds;
            -[MTContentKeyRequest adamId](v19, "adamId", v36);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v25) = objc_msgSend((id)v25, "containsObject:", v26);

            if ((v25 & 1) == 0)
            {
              objc_msgSend(v44, "addObject:", v19);
              v27 = (void *)__pendingStopNonceRequestAdamIds;
              -[MTContentKeyRequest adamId](v19, "adamId");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "addObject:", v28);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
        }
        while (v11);
      }

      _MTLogCategoryDRM();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v36;
        v56 = __pendingStopNonceRequestAdamIds;
        _os_log_impl(&dword_1A904E000, v29, OS_LOG_TYPE_DEFAULT, "Pending stop nonce requests: %@", buf, 0xCu);
      }

      v1 = v39;
      objc_msgSend(*(id *)(v39 + 40), "secureKeyRequestHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v39 + 40), "account");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __75__IMAVSecureKeyLoader_securelyInvalidateOfflineDataForRequests_completion___block_invoke_57;
      v46[3] = &unk_1E54D3CD8;
      v46[4] = *(_QWORD *)(v39 + 40);
      v47 = v44;
      v2 = v38;
      v48 = v38;
      v49 = v43;
      v3 = v37;
      v50 = v37;
      v32 = v43;
      v33 = v44;
      objc_msgSend(v30, "loadKeyDataFor:account:completion:", v33, v31, v46);

      v6 = v42 - v40;
      v7 = v40 + v41;

    }
    while (v42 != v40);
  }
  v34 = dispatch_time(0, 60000000000);
  dispatch_group_wait(v3, v34);
  v35 = *(_QWORD *)(v1 + 48);
  if (v35)
    (*(void (**)(uint64_t, void *))(v35 + 16))(v35, v2);

}

void __75__IMAVSecureKeyLoader_securelyInvalidateOfflineDataForRequests_completion___block_invoke_57(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  objc_msgSend(a1[4], "keyLoaderQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__IMAVSecureKeyLoader_securelyInvalidateOfflineDataForRequests_completion___block_invoke_2;
  v8[3] = &unk_1E54D3CB0;
  v9 = a1[5];
  v10 = v3;
  v11 = a1[6];
  v5 = a1[7];
  v6 = a1[4];
  v12 = v5;
  v13 = v6;
  v14 = a1[8];
  v7 = v3;
  dispatch_async(v4, v8);

}

void __75__IMAVSecureKeyLoader_securelyInvalidateOfflineDataForRequests_completion___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
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
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  dispatch_time_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  __int128 v47;
  uint64_t v49;
  uint64_t v50;
  NSObject *group;
  id v52;
  _QWORD v53[4];
  id v54;
  uint64_t v55;
  id v56;
  _QWORD v57[5];
  id v58;
  NSObject *v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  void *v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v66 != v4)
          objc_enumerationMutation(v1);
        v6 = (void *)__pendingStopNonceRequestAdamIds;
        objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "adamId");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "removeObject:", v7);

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
    }
    while (v3);
  }

  v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  group = dispatch_group_create();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v8 = a1;
  v9 = *(id *)(a1 + 40);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v62;
    v49 = *MEMORY[0x1E0C8A1E8];
    *(_QWORD *)&v11 = 138412546;
    v47 = v11;
    v50 = *(_QWORD *)v62;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v62 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
        objc_msgSend(v15, "error", v47);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v15, "request");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "adamId");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
            continue;
          v19 = *(void **)(v8 + 48);
          objc_msgSend(v15, "error");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "request");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "adamId");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKey:", v20, v22);

        }
        else
        {
          v23 = *(void **)(v8 + 56);
          objc_msgSend(v15, "request");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "adamId");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKey:", v25);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            v26 = v9;
            _MTLogCategoryDRM();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v15, "keyData");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "base64EncodedStringWithOptions:", 0);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "request");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "adamId");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v47;
              v72 = v29;
              v73 = 2112;
              v74 = v31;
              _os_log_impl(&dword_1A904E000, v27, OS_LOG_TYPE_DEFAULT, "Stop request sending nonce data %@ for adam id %@", buf, 0x16u);

              v8 = a1;
            }

            objc_msgSend(v15, "keyData");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (v32)
            {
              v69 = v49;
              objc_msgSend(v15, "keyData");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = v33;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v21 = 0;
            }

            dispatch_group_enter(group);
            objc_msgSend(*(id *)(v8 + 64), "contentKeySession");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v57[0] = MEMORY[0x1E0C809B0];
            v57[1] = 3221225472;
            v57[2] = __75__IMAVSecureKeyLoader_securelyInvalidateOfflineDataForRequests_completion___block_invoke_59;
            v57[3] = &unk_1E54D3C60;
            v57[4] = v15;
            v58 = *(id *)(v8 + 48);
            v59 = group;
            v60 = v52;
            objc_msgSend(v39, "invalidatePersistableContentKey:options:completionHandler:", v20, v21, v57);

            v9 = v26;
            v13 = v50;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMAVSecureKeyLoaderErrorDomain"), -383005, 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "request");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "adamId");
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (v35)
            {
              v36 = *(void **)(v8 + 48);
              objc_msgSend(v15, "request");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "adamId");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "setObject:forKey:", v21, v38);

            }
          }
        }

      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
    }
    while (v12);
  }

  v40 = dispatch_time(0, 30000000000);
  dispatch_group_wait(group, v40);
  objc_msgSend(*(id *)(v8 + 64), "secureKeyRequestHandler");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v8 + 64), "account");
  v42 = v8;
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __75__IMAVSecureKeyLoader_securelyInvalidateOfflineDataForRequests_completion___block_invoke_2_61;
  v53[3] = &unk_1E54D3C88;
  v44 = *(id *)(v42 + 48);
  v45 = *(_QWORD *)(v42 + 64);
  v46 = *(void **)(v42 + 72);
  v54 = v44;
  v55 = v45;
  v56 = v46;
  objc_msgSend(v41, "loadKeyDataFor:account:completion:", v52, v43, v53);

}

void __75__IMAVSecureKeyLoader_securelyInvalidateOfflineDataForRequests_completion___block_invoke_59(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MTContentKeyRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MTContentKeyRequest *v18;
  id v19;

  v19 = a2;
  v5 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "adamId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "request");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "adamId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v5, v10);

    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
  else
  {
    v11 = [MTContentKeyRequest alloc];
    objc_msgSend(*(id *)(a1 + 32), "request");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "keyIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "request");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "adamId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "request");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "secureInvalidationDsid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[MTContentKeyRequest initWithKeyIdentifier:adamId:requestType:offlineRequest:secureInvalidationDsid:](v11, "initWithKeyIdentifier:adamId:requestType:offlineRequest:secureInvalidationDsid:", v13, v15, 2, 1, v17);

    -[MTContentKeyRequest setRequestData:](v18, "setRequestData:", v19);
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v18);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

  }
}

void __75__IMAVSecureKeyLoader_securelyInvalidateOfflineDataForRequests_completion___block_invoke_2_61(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v26;
    *(_QWORD *)&v5 = 138412546;
    v24 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v9, "error", v24);
        v10 = objc_claimAutoreleasedReturnValue();
        if (!v10)
          goto LABEL_12;
        v11 = (void *)v10;
        objc_msgSend(v9, "error");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "code") == -1002)
        {

LABEL_12:
          objc_msgSend(*(id *)(a1 + 40), "secureKeyRequestStorage");
          v19 = objc_claimAutoreleasedReturnValue();
          -[NSObject removeKeyDataFor:](v19, "removeKeyDataFor:", v9);
          goto LABEL_13;
        }
        objc_msgSend(v9, "request");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "adamId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
          goto LABEL_12;
        v15 = *(void **)(a1 + 32);
        objc_msgSend(v9, "error");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "request");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "adamId");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKey:", v16, v18);

        _MTLogCategoryDRM();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v9, "error");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "localizedDescription");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "request");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "adamId");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v24;
          v30 = v21;
          v31 = 2112;
          v32 = v23;
          _os_log_impl(&dword_1A904E000, v19, OS_LOG_TYPE_ERROR, "Stop request failed with error %@ for adam id %@", buf, 0x16u);

        }
LABEL_13:

      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v6);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

- (void)invalidateAndCancel
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _MTLogCategoryDRM();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[IMAVSecureKeyLoader recipient](self, "recipient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1A904E000, v3, OS_LOG_TYPE_DEFAULT, "Invalidate and cancel for %@", (uint8_t *)&v9, 0xCu);

  }
  -[IMAVSecureKeyLoader contentKeySession](self, "contentKeySession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAVSecureKeyLoader recipient](self, "recipient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeContentKeyRecipient:", v8);

  -[IMAVSecureKeyLoader setContentKeySession:](self, "setContentKeySession:", 0);
}

- (void)requestKeyResponseFromContentKeyRequest:(id)a3 requestType:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD block[4];
  id v19;
  IMAVSecureKeyLoader *v20;
  id v21;
  id v22;
  int64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  int64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAVSecureKeyLoader contentKeySession](self, "contentKeySession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _MTLogCategoryDRM();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v14;
      v26 = 2048;
      v27 = a4;
      _os_log_impl(&dword_1A904E000, v13, OS_LOG_TYPE_DEFAULT, "[Request Key Response] for %@. Request type %ld", buf, 0x16u);

    }
    if (!v9)
      -[IMAVSecureKeyLoader requestKeyResponseFromContentKeyRequest:requestType:completion:].cold.1();
    -[IMAVSecureKeyLoader keyLoaderQueue](self, "keyLoaderQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke;
    block[3] = &unk_1E54D3DF0;
    v19 = v8;
    v20 = self;
    v23 = a4;
    v22 = v9;
    v21 = v10;
    dispatch_async(v15, block);

    v16 = v19;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v17;
      v26 = 2048;
      v27 = a4;
      _os_log_impl(&dword_1A904E000, v13, OS_LOG_TYPE_ERROR, "[Request Key Response] Failed for %@. Request type %ld. ContentKeySession is nil.", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMAVSecureKeyLoaderErrorDomain"), -383006, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAVSecureKeyLoader cleanupAfterContentKeyRequestWithError:](self, "cleanupAfterContentKeyRequestWithError:", v16);
  }

}

void __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  MTContentKeyRequest *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  BOOL v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (objc_msgSend(*(id *)(a1 + 40), "_isOfflineAsset") & 1) != 0 || objc_msgSend(*(id *)(a1 + 40), "useCase") == 1;
  v5 = [MTContentKeyRequest alloc];
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "contentAdamId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MTContentKeyRequest initFrom:adamId:requestType:offlineRequest:](v5, "initFrom:adamId:requestType:offlineRequest:", v6, v7, *(_QWORD *)(a1 + 64), v4);

  if (objc_msgSend(*(id *)(a1 + 40), "_isOfflineAsset") && !objc_msgSend(*(id *)(a1 + 40), "useCase"))
  {
    _MTLogCategoryDRM();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "contentAdamId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v32 = v18;
      v33 = 2112;
      v34 = v19;
      _os_log_impl(&dword_1A904E000, v17, OS_LOG_TYPE_DEFAULT, "[Request Key Response] offline key %@ content adam id %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "secureKeyRequestStorage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "retrieveKeyDataFor:", v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

      goto LABEL_11;
    }
    _MTLogCategoryDRM();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A904E000, v22, OS_LOG_TYPE_DEFAULT, "[Request Key Response] offline key should be local, but is missing. This will be reported, but we will attempt to recover.", buf, 2u);
    }

    +[PFBugReporterBridge reportMissingFairPlayOfflineKey](_TtC18PodcastsFoundation19PFBugReporterBridge, "reportMissingFairPlayOfflineKey");
  }
  if (objc_msgSend(*(id *)(a1 + 40), "_isOfflineAsset"))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "useCase") == 1)
    {
      objc_msgSend(*(id *)(a1 + 40), "secureKeyRequestStorage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "adamId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "keyExistsInStorageFor:", objc_msgSend(v10, "longLongValue"));

      if (v11)
      {
        objc_msgSend(*(id *)(a1 + 40), "secureKeyRequestStorage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "adamId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "markOfflineKeyFor:pendingDeletion:", objc_msgSend(v13, "longLongValue"), 0);

      }
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "secureKeyRequestHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke_64;
  v23[3] = &unk_1E54D3DC8;
  v23[4] = *(_QWORD *)(a1 + 40);
  v24 = v3;
  v25 = *(id *)(a1 + 32);
  v26 = v8;
  v28 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 64);
  v27 = v15;
  v29 = v16;
  v30 = v4;
  objc_msgSend(v14, "loadCertificateDataWithCompletion:", v23);

LABEL_11:
}

void __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke_64(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  char v19;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "keyLoaderQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke_2;
  block[3] = &unk_1E54D3DA0;
  v11 = v3;
  v12 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v5 = *(id *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 32);
  v17 = v5;
  v15 = v6;
  v7 = *(id *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 80);
  v16 = v7;
  v18 = v8;
  v19 = *(_BYTE *)(a1 + 88);
  v9 = v3;
  dispatch_async(v4, block);

}

void __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  MTContentKeyResponse *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  int8x16_t v16;
  _QWORD v17[4];
  int8x16_t v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "keyData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && *(_QWORD *)(a1 + 40))
  {
    if (objc_msgSend(*(id *)(a1 + 48), "status") != 5 && objc_msgSend(*(id *)(a1 + 48), "status") != 4)
    {
      v12 = *(_QWORD *)(a1 + 40);
      v11 = *(void **)(a1 + 48);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke_3;
      v17[3] = &unk_1E54D3D78;
      v16 = *(int8x16_t *)(a1 + 56);
      v13 = (id)v16.i64[0];
      v18 = vextq_s8(v16, v16, 8uLL);
      v21 = *(id *)(a1 + 80);
      v14 = *(id *)(a1 + 72);
      v15 = *(_QWORD *)(a1 + 88);
      v19 = v14;
      v22 = v15;
      v20 = *(id *)(a1 + 48);
      v23 = *(_BYTE *)(a1 + 96);
      objc_msgSend(v11, "makeStreamingContentKeyRequestDataForApp:contentIdentifier:options:completionHandler:", v2, v12, 0, v17);

      goto LABEL_12;
    }
    objc_msgSend(*(id *)(a1 + 48), "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v24 = *MEMORY[0x1E0CB3388];
      objc_msgSend(*(id *)(a1 + 48), "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = -383003;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v8;
    if (v3)
      objc_msgSend(v8, "setObject:forKey:", v3, *MEMORY[0x1E0CB3388]);
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = -383001;
  }
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("IMAVSecureKeyLoaderErrorDomain"), v7, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MTContentKeyResponse initWithRequest:error:]([MTContentKeyResponse alloc], "initWithRequest:error:", *(_QWORD *)(a1 + 56), v9);
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

LABEL_12:
}

void __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  char v21;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "keyLoaderQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke_4;
  block[3] = &unk_1E54D3D50;
  v13 = v6;
  v14 = *(id *)(a1 + 40);
  v19 = *(id *)(a1 + 64);
  v15 = v5;
  v8 = *(id *)(a1 + 48);
  v20 = *(_QWORD *)(a1 + 72);
  v9 = *(_QWORD *)(a1 + 32);
  v16 = v8;
  v17 = v9;
  v18 = *(id *)(a1 + 56);
  v21 = *(_BYTE *)(a1 + 80);
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, block);

}

void __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  MTContentKeyResponse *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  char v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v9 = -[MTContentKeyResponse initWithRequest:error:]([MTContentKeyResponse alloc], "initWithRequest:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setRequestData:", *(_QWORD *)(a1 + 48));
    _MTLogCategoryDRM();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 40), "adamId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 88);
      *(_DWORD *)buf = 138412802;
      v17 = v3;
      v18 = 2112;
      v19 = v4;
      v20 = 2048;
      v21 = v5;
      _os_log_impl(&dword_1A904E000, v2, OS_LOG_TYPE_DEFAULT, "[Request Key Response] Loading key request data from network for %@ adam id %@. Request type %ld", buf, 0x20u);

    }
    if (*(_QWORD *)(a1 + 88) != 2)
    {
      objc_msgSend(*(id *)(a1 + 64), "setSavedRequestToUseForStopping:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 64), "setSavedRequestDataToUseForStopping:", *(_QWORD *)(a1 + 48));
    }
    objc_msgSend(*(id *)(a1 + 64), "secureKeyRequestHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke_66;
    v10[3] = &unk_1E54D3D28;
    v10[4] = *(_QWORD *)(a1 + 64);
    v13 = *(id *)(a1 + 80);
    v11 = *(id *)(a1 + 72);
    v14 = *(_BYTE *)(a1 + 96);
    v12 = *(id *)(a1 + 56);
    objc_msgSend(v6, "loadKeyDataFor:account:completion:", v7, v8, v10);

  }
}

void __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke_66(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  char v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "keyLoaderQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke_2_67;
  v8[3] = &unk_1E54D3D00;
  v9 = v3;
  v13 = *(id *)(a1 + 56);
  v5 = *(id *)(a1 + 40);
  v14 = *(_BYTE *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 48);
  v7 = v3;
  dispatch_async(v4, v8);

}

void __86__IMAVSecureKeyLoader_requestKeyResponseFromContentKeyRequest_requestType_completion___block_invoke_2_67(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(v2, "keyData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = *(void **)(a1 + 40);
      objc_msgSend(v2, "keyData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      objc_msgSend(v5, "persistableContentKeyFromKeyVendorResponse:options:error:", v6, 0, &v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v13;

      if (v8)
      {
        objc_msgSend(v2, "setError:", v8);
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

LABEL_13:
        goto LABEL_14;
      }
    }
    else
    {
      v7 = v4;
    }
    objc_msgSend(v2, "setKeyData:", v7);
    if (*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(*(id *)(a1 + 48), "secureKeyRequestStorage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "saveKeyDataFor:", v2);

      if ((v10 & 1) == 0)
      {
        _MTLogCategoryDRM();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = *(_QWORD *)(a1 + 56);
          *(_DWORD *)buf = 138412290;
          v15 = v12;
          _os_log_impl(&dword_1A904E000, v11, OS_LOG_TYPE_ERROR, "[Request Key Response] Failed to save offline keyData for %@", buf, 0xCu);
        }

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_13;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_14:

}

- (void)timeoutKeyRequest
{
  NSObject *v3;
  _QWORD block[5];

  -[IMAVSecureKeyLoader keyLoaderQueue](self, "keyLoaderQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__IMAVSecureKeyLoader_timeoutKeyRequest__block_invoke;
  block[3] = &unk_1E54D0DE0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __40__IMAVSecureKeyLoader_timeoutKeyRequest__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _MTLogCategoryDRM();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "contentAdamId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A904E000, v2, OS_LOG_TYPE_ERROR, "Content key request timeout for content id %@", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMAVSecureKeyLoaderErrorDomain"), -383002, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cleanupAfterContentKeyRequestForOfflineRenewal:withError:", objc_msgSend(*(id *)(a1 + 32), "isRenewal"), v4);

}

- (void)finishContentKeyRequest:(id)a3 withResponse:(id)a4
{
  -[IMAVSecureKeyLoader finishContentKeyRequest:forOfflineRenewal:withResponse:](self, "finishContentKeyRequest:forOfflineRenewal:withResponse:", a3, 0, a4);
}

- (void)finishContentKeyRequest:(id)a3 forOfflineRenewal:(BOOL)a4 withResponse:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD block[5];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v6 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  _MTLogCategoryDRM();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAVSecureKeyLoader contentAdamId](self, "contentAdamId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v23 = v11;
    v24 = 2112;
    v25 = v12;
    v26 = 2112;
    v27 = v13;
    _os_log_impl(&dword_1A904E000, v10, OS_LOG_TYPE_DEFAULT, "Finished content key request for identifier %@ for content id %@ with error %@", buf, 0x20u);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__IMAVSecureKeyLoader_finishContentKeyRequest_forOfflineRenewal_withResponse___block_invoke;
  block[3] = &unk_1E54D0DE0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_msgSend(v9, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v15)
  {
    v17 = (void *)MEMORY[0x1E0C8B198];
    objc_msgSend(v9, "keyData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "renewalDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "contentKeyResponseWithFairPlayStreamingKeyResponseData:renewalDate:", v18, v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "processContentKeyResponse:", v16);
  }
  else
  {
    objc_msgSend(v9, "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "processContentKeyResponseError:", v16);
  }

  objc_msgSend(v9, "error");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAVSecureKeyLoader cleanupAfterContentKeyRequestForOfflineRenewal:withError:](self, "cleanupAfterContentKeyRequestForOfflineRenewal:withError:", v6, v20);

}

uint64_t __78__IMAVSecureKeyLoader_finishContentKeyRequest_forOfflineRenewal_withResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel_timeoutKeyRequest, 0);
}

- (void)cleanupAfterContentKeyRequestWithError:(id)a3
{
  -[IMAVSecureKeyLoader cleanupAfterContentKeyRequestForOfflineRenewal:withError:](self, "cleanupAfterContentKeyRequestForOfflineRenewal:withError:", 0, a3);
}

- (void)cleanupAfterContentKeyRequestForOfflineRenewal:(BOOL)a3 withError:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  v6 = a4;
  if (v4)
    -[IMAVSecureKeyLoader setContentAdamId:](self, "setContentAdamId:", 0);
  -[IMAVSecureKeyLoader pendingCompletion](self, "pendingCompletion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[IMAVSecureKeyLoader pendingCompletion](self, "pendingCompletion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAVSecureKeyLoader setPendingCompletion:](self, "setPendingCompletion:", 0);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __80__IMAVSecureKeyLoader_cleanupAfterContentKeyRequestForOfflineRenewal_withError___block_invoke;
    v10[3] = &unk_1E54D1148;
    v12 = v8;
    v11 = v6;
    v9 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], v10);

  }
}

uint64_t __80__IMAVSecureKeyLoader_cleanupAfterContentKeyRequestForOfflineRenewal_withError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)_isOfflineAsset
{
  void *v2;
  void *v3;
  char v4;

  -[IMAVSecureKeyLoader recipient](self, "recipient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFileURL");

  return v4;
}

- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _MTLogCategoryDRM();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A904E000, v6, OS_LOG_TYPE_DEFAULT, "Received content key request", buf, 2u);
  }

  if (-[IMAVSecureKeyLoader useCase](self, "useCase") == 1
    || -[IMAVSecureKeyLoader _isOfflineAsset](self, "_isOfflineAsset"))
  {
    _MTLogCategoryDRM();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl(&dword_1A904E000, v7, OS_LOG_TYPE_DEFAULT, "Offline key: received initial request, now waiting for offline request for %@", buf, 0xCu);

    }
    v16 = 0;
    v9 = objc_msgSend(v5, "respondByRequestingPersistableContentKeyRequestAndReturnError:", &v16);
    v10 = v16;
    if ((v9 & 1) == 0)
    {
      _MTLogCategoryDRM();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMAVSecureKeyLoader contentAdamId](self, "contentAdamId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v18 = v12;
        v19 = 2112;
        v20 = v13;
        v21 = 2112;
        v22 = v10;
        _os_log_impl(&dword_1A904E000, v11, OS_LOG_TYPE_DEFAULT, "Offline key: offline request failed for %@ episode %@ with error %@", buf, 0x20u);

      }
      -[IMAVSecureKeyLoader cleanupAfterContentKeyRequestWithError:](self, "cleanupAfterContentKeyRequestWithError:", v10);
    }

  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__IMAVSecureKeyLoader_contentKeySession_didProvideContentKeyRequest___block_invoke;
    v14[3] = &unk_1E54D3E18;
    v14[4] = self;
    v15 = v5;
    -[IMAVSecureKeyLoader requestKeyResponseFromContentKeyRequest:requestType:completion:](self, "requestKeyResponseFromContentKeyRequest:requestType:completion:", v15, 0, v14);

  }
}

uint64_t __69__IMAVSecureKeyLoader_contentKeySession_didProvideContentKeyRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishContentKeyRequest:withResponse:", *(_QWORD *)(a1 + 40), a2);
}

- (void)contentKeySession:(id)a3 didProvideRenewingContentKeyRequest:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _MTLogCategoryDRM();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v7;
    _os_log_impl(&dword_1A904E000, v6, OS_LOG_TYPE_DEFAULT, "Received content key request for renewal for %@.", buf, 0xCu);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__IMAVSecureKeyLoader_contentKeySession_didProvideRenewingContentKeyRequest___block_invoke;
  v9[3] = &unk_1E54D3E18;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  -[IMAVSecureKeyLoader requestKeyResponseFromContentKeyRequest:requestType:completion:](self, "requestKeyResponseFromContentKeyRequest:requestType:completion:", v8, 1, v9);

}

uint64_t __77__IMAVSecureKeyLoader_contentKeySession_didProvideRenewingContentKeyRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishContentKeyRequest:withResponse:", *(_QWORD *)(a1 + 40), a2);
}

- (void)contentKeySession:(id)a3 didProvidePersistableContentKeyRequest:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _MTLogCategoryDRM();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v13 = v7;
    v14 = 1024;
    v15 = -[IMAVSecureKeyLoader isRenewal](self, "isRenewal");
    _os_log_impl(&dword_1A904E000, v6, OS_LOG_TYPE_DEFAULT, "Received content key request for persistable key for %@. renewal? %d", buf, 0x12u);

  }
  v8 = -[IMAVSecureKeyLoader isRenewal](self, "isRenewal");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__IMAVSecureKeyLoader_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke;
  v10[3] = &unk_1E54D3E18;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  -[IMAVSecureKeyLoader requestKeyResponseFromContentKeyRequest:requestType:completion:](self, "requestKeyResponseFromContentKeyRequest:requestType:completion:", v9, v8, v10);

}

void __80__IMAVSecureKeyLoader_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "finishContentKeyRequest:forOfflineRenewal:withResponse:", v3, objc_msgSend(v2, "isRenewal"), v4);

}

- (void)contentKeySession:(id)a3 contentKeyRequestDidSucceed:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  _MTLogCategoryDRM();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1A904E000, v5, OS_LOG_TYPE_DEFAULT, "🔑 Content key request succeeded for %@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)contentKeySession:(id)a3 contentKeyRequest:(id)a4 didFailWithError:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  _MTLogCategoryDRM();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v10;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_1A904E000, v9, OS_LOG_TYPE_ERROR, "🔑🚨 Content key request failed for %@ with error: %@", (uint8_t *)&v14, 0x16u);

  }
  -[IMAVSecureKeyLoader delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[IMAVSecureKeyLoader delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentKeyRequestDidFailWithError:", v8);

  }
}

- (IMAVSecureKeyLoaderDelegate)delegate
{
  return (IMAVSecureKeyLoaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVContentKeySession)contentKeySession
{
  return self->_contentKeySession;
}

- (void)setContentKeySession:(id)a3
{
  objc_storeStrong((id *)&self->_contentKeySession, a3);
}

- (AVURLAsset)recipient
{
  return self->_recipient;
}

- (void)setRecipient:(id)a3
{
  objc_storeStrong((id *)&self->_recipient, a3);
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSString)contentAdamId
{
  return self->_contentAdamId;
}

- (void)setContentAdamId:(id)a3
{
  objc_storeStrong((id *)&self->_contentAdamId, a3);
}

- (id)pendingCompletion
{
  return self->_pendingCompletion;
}

- (void)setPendingCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isRenewal
{
  return self->_isRenewal;
}

- (void)setIsRenewal:(BOOL)a3
{
  self->_isRenewal = a3;
}

- (MTSecureKeyRequestHandler)secureKeyRequestHandler
{
  return self->_secureKeyRequestHandler;
}

- (void)setSecureKeyRequestHandler:(id)a3
{
  objc_storeStrong((id *)&self->_secureKeyRequestHandler, a3);
}

- (NSURLSessionDelegate)urlProtocolDelegate
{
  return self->_urlProtocolDelegate;
}

- (void)setUrlProtocolDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_urlProtocolDelegate, a3);
}

- (MTSecureKeyRequestStorage)secureKeyRequestStorage
{
  return self->_secureKeyRequestStorage;
}

- (void)setSecureKeyRequestStorage:(id)a3
{
  objc_storeStrong((id *)&self->_secureKeyRequestStorage, a3);
}

- (unint64_t)useCase
{
  return self->_useCase;
}

- (void)setUseCase:(unint64_t)a3
{
  self->_useCase = a3;
}

- (MTContentKeyRequest)savedRequestToUseForStopping
{
  return self->_savedRequestToUseForStopping;
}

- (void)setSavedRequestToUseForStopping:(id)a3
{
  objc_storeStrong((id *)&self->_savedRequestToUseForStopping, a3);
}

- (NSData)savedRequestDataToUseForStopping
{
  return self->_savedRequestDataToUseForStopping;
}

- (void)setSavedRequestDataToUseForStopping:(id)a3
{
  objc_storeStrong((id *)&self->_savedRequestDataToUseForStopping, a3);
}

- (OS_dispatch_queue)keyLoaderQueue
{
  return self->_keyLoaderQueue;
}

- (void)setKeyLoaderQueue:(id)a3
{
  objc_storeStrong((id *)&self->_keyLoaderQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyLoaderQueue, 0);
  objc_storeStrong((id *)&self->_savedRequestDataToUseForStopping, 0);
  objc_storeStrong((id *)&self->_savedRequestToUseForStopping, 0);
  objc_storeStrong((id *)&self->_secureKeyRequestStorage, 0);
  objc_storeStrong((id *)&self->_urlProtocolDelegate, 0);
  objc_storeStrong((id *)&self->_secureKeyRequestHandler, 0);
  objc_storeStrong(&self->_pendingCompletion, 0);
  objc_storeStrong((id *)&self->_contentAdamId, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
  objc_storeStrong((id *)&self->_contentKeySession, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)startKeyLoadingProcessWithKeyIdentifier:(os_log_t)log contentAdamId:isRenewal:completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A904E000, log, OS_LOG_TYPE_FAULT, "[Key Loading Process] Fail to start loading key.", v1, 2u);
}

- (void)securelyInvalidateOfflineDataForRequests:completion:.cold.1()
{
  __assert_rtn("-[IMAVSecureKeyLoader securelyInvalidateOfflineDataForRequests:completion:]", "IMAVSecureKeyLoader.m", 189, "self.useCase == IMAVSecureKeyLoaderUseCaseDownload");
}

- (void)requestKeyResponseFromContentKeyRequest:requestType:completion:.cold.1()
{
  __assert_rtn("-[IMAVSecureKeyLoader requestKeyResponseFromContentKeyRequest:requestType:completion:]", "IMAVSecureKeyLoader.m", 348, "completion");
}

@end
