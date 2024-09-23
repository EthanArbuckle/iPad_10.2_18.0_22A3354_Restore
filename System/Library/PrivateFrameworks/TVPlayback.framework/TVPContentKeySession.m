@implementation TVPContentKeySession

void __34__TVPContentKeySession_initialize__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppleTV.playback", "SecureKeyDelivery");
  v1 = (void *)sLogObject_7;
  sLogObject_7 = (uint64_t)v0;

}

- (TVPContentKeySession)initWithContentKeyLoader:(id)a3 avAsset:(id)a4
{
  id v7;
  id v8;
  TVPContentKeySession *v9;
  TVPContentKeySession *v10;
  uint64_t v11;
  AVContentKeySession *contentKeySession;
  NSMutableArray *v13;
  NSMutableArray *keyRequestsInProgress;
  dispatch_queue_t v15;
  OS_dispatch_queue *contentKeyProcessingQueue;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TVPContentKeySession;
  v9 = -[TVPContentKeySession init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contentKeyLoader, a3);
    objc_msgSend(MEMORY[0x24BDB2538], "contentKeySessionWithKeySystem:", *MEMORY[0x24BDB1BB8]);
    v11 = objc_claimAutoreleasedReturnValue();
    contentKeySession = v10->_contentKeySession;
    v10->_contentKeySession = (AVContentKeySession *)v11;

    -[AVContentKeySession setDelegate:queue:](v10->_contentKeySession, "setDelegate:queue:", v10, MEMORY[0x24BDAC9B8]);
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    keyRequestsInProgress = v10->_keyRequestsInProgress;
    v10->_keyRequestsInProgress = v13;

    if (v8)
      -[AVContentKeySession addContentKeyRecipient:](v10->_contentKeySession, "addContentKeyRecipient:", v8);
    v15 = dispatch_queue_create("com.apple.TVPContentKeyProcessing", 0);
    contentKeyProcessingQueue = v10->_contentKeyProcessingQueue;
    v10->_contentKeyProcessingQueue = (OS_dispatch_queue *)v15;

  }
  return v10;
}

+ (void)initialize
{
  if (initialize_onceToken_10 != -1)
    dispatch_once(&initialize_onceToken_10, &__block_literal_global_19);
}

- (TVPContentKeySession)init
{
  return -[TVPContentKeySession initWithContentKeyLoader:avAsset:](self, "initWithContentKeyLoader:avAsset:", 0, 0);
}

- (void)makeSecureInvalidationDataForOfflineKeyData:(id)a3 nonceData:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    v16 = *MEMORY[0x24BDB1BB0];
    v17[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  -[TVPContentKeySession contentKeySession](self, "contentKeySession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __89__TVPContentKeySession_makeSecureInvalidationDataForOfflineKeyData_nonceData_completion___block_invoke;
  v14[3] = &unk_24F15D780;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v12, "invalidatePersistableContentKey:options:completionHandler:", v8, v11, v14);

}

void __89__TVPContentKeySession_makeSecureInvalidationDataForOfflineKeyData_nonceData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__TVPContentKeySession_makeSecureInvalidationDataForOfflineKeyData_nonceData_completion___block_invoke_2;
  block[3] = &unk_24F15D758;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __89__TVPContentKeySession_makeSecureInvalidationDataForOfflineKeyData_nonceData_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)generateOfflineKeyRequestsForIdentifiers:(id)a3 completion:(id)a4
{
  -[TVPContentKeySession _generateOfflineKeyRequestsForIdentifiers:isRenewal:completion:](self, "_generateOfflineKeyRequestsForIdentifiers:isRenewal:completion:", a3, 1, a4);
}

- (void)fetchOfflineKeysForParams:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  TVPContentKeySession *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v14, "keyIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v14, "keyIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v16);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __61__TVPContentKeySession_fetchOfflineKeysForParams_completion___block_invoke;
  v19[3] = &unk_24F15E198;
  v20 = v9;
  v21 = self;
  v22 = v7;
  v17 = v7;
  v18 = v9;
  -[TVPContentKeySession _generateOfflineKeyRequestsForIdentifiers:isRenewal:completion:](self, "_generateOfflineKeyRequestsForIdentifiers:isRenewal:completion:", v8, 0, v19);

}

void __61__TVPContentKeySession_fetchOfflineKeysForParams_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t i;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  uint64_t v24;
  id v25;
  id obj;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!objc_msgSend(v3, "count"))
  {
    if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_ERROR))
      __61__TVPContentKeySession_fetchOfflineKeysForParams_completion___block_invoke_cold_1();
    v24 = *(_QWORD *)(a1 + 48);
    if (!v24)
      goto LABEL_30;
LABEL_29:
    (*(void (**)(void))(v24 + 16))();
    goto LABEL_30;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v25 = v3;
  v4 = v3;
  v30 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v36;
    obj = v4;
    v27 = a1;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v36 != v29)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v7 = sLogObject_7;
        if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v6;
          _os_log_impl(&dword_228A4E000, v7, OS_LOG_TYPE_DEFAULT, "Loading key request %@", buf, 0xCu);
        }
        objc_msgSend(v6, "keyIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "absoluteString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v28 = v6;
          v33 = 0u;
          v34 = 0u;
          v31 = 0u;
          v32 = 0u;
          v10 = *(id *)(a1 + 32);
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v32;
            while (2)
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v32 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
                objc_msgSend(v15, "keyIdentifier");
                v16 = objc_claimAutoreleasedReturnValue();
                if (v16)
                {
                  v17 = (void *)v16;
                  objc_msgSend(v15, "keyIdentifier");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = objc_msgSend(v18, "isEqualToString:", v9);

                  if (v19)
                  {
                    objc_msgSend(v15, "keyFormatVersions");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v28, "setKeyFormatVersions:", v20);

                    goto LABEL_21;
                  }
                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
              if (v12)
                continue;
              break;
            }
          }
LABEL_21:

          a1 = v27;
        }

      }
      v4 = obj;
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    }
    while (v30);
  }

  objc_msgSend(*(id *)(a1 + 40), "contentKeyLoader");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_respondsToSelector();

  if ((v22 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "contentKeyLoader");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "loadFairPlayStreamingKeyRequests:completion:", v4, *(_QWORD *)(a1 + 48));

    v3 = v25;
    goto LABEL_30;
  }
  if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_ERROR))
    __61__TVPContentKeySession_fetchOfflineKeysForParams_completion___block_invoke_cold_2();
  v24 = *(_QWORD *)(a1 + 48);
  v3 = v25;
  if (v24)
    goto LABEL_29;
LABEL_30:

}

- (void)finishKeyRequest:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  int v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "isCancelled") & 1) != 0)
  {
    v5 = sLogObject_7;
    if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Key request cancelled or failed, not processing response";
LABEL_4:
      _os_log_impl(&dword_228A4E000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    }
  }
  else if (objc_msgSend(v4, "type") || !objc_msgSend(v4, "wantsOfflineKeysIfPossible"))
  {
    if (objc_msgSend(v4, "type") != 3)
    {
      objc_msgSend(v4, "keyResponseData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "length"))
      {
        -[TVPContentKeySession contentKeySession](self, "contentKeySession");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "contentKeyRecipients");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        v14 = sLogObject_7;
        v15 = os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT);
        if (v13)
        {
          if (v15)
          {
            v16 = v14;
            objc_msgSend(v4, "renewalDate");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v34 = v4;
            v35 = 2112;
            v36 = v17;
            _os_log_impl(&dword_228A4E000, v16, OS_LOG_TYPE_DEFAULT, "Received key response data.  Will call processContentKeyResponse on separate queue for key request %@, renewal date: %@", buf, 0x16u);

          }
          objc_initWeak((id *)buf, self);
          -[TVPContentKeySession contentKeyProcessingQueue](self, "contentKeyProcessingQueue");
          v18 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __41__TVPContentKeySession_finishKeyRequest___block_invoke_11;
          block[3] = &unk_24F15C738;
          objc_copyWeak(&v29, (id *)buf);
          v27 = v4;
          v28 = v10;
          dispatch_async(v18, block);

          objc_destroyWeak(&v29);
          objc_destroyWeak((id *)buf);
        }
        else if (v15)
        {
          *(_DWORD *)buf = 138412290;
          v34 = v4;
          _os_log_impl(&dword_228A4E000, v14, OS_LOG_TYPE_DEFAULT, "Key request was successful, but not processing because no content key recipient exists.  %@", buf, 0xCu);
        }
      }
      else
      {
        objc_msgSend(v4, "error");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19)
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.ATV.secureKeyDelivery"), -345007, 0);
        -[TVPContentKeySession contentKeySession](self, "contentKeySession");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "contentKeyRecipients");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "count");

        v23 = (void *)sLogObject_7;
        v24 = os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_ERROR);
        if (v22)
        {
          if (v24)
            -[TVPContentKeySession finishKeyRequest:].cold.2(v23, v4);
          objc_msgSend(v4, "avContentKeyRequest");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "processContentKeyResponseError:", v19);

        }
        else if (v24)
        {
          -[TVPContentKeySession finishKeyRequest:].cold.1(v23, v4);
        }

      }
    }
  }
  else
  {
    objc_msgSend(v4, "avContentKeyRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "respondByRequestingPersistableContentKeyRequestAndReturnError:", 0);

    v5 = sLogObject_7;
    v9 = os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (!v9)
        goto LABEL_31;
      *(_WORD *)buf = 0;
      v6 = "Request can use offline keys.  Waiting for new offline key request.";
      goto LABEL_4;
    }
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228A4E000, v5, OS_LOG_TYPE_DEFAULT, "Request cannot use offline keys.  Re-sending request with type set to streaming.", buf, 2u);
    }
    objc_msgSend(v4, "setType:", 1);
    objc_initWeak((id *)buf, self);
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __41__TVPContentKeySession_finishKeyRequest___block_invoke;
    v30[3] = &unk_24F15BA88;
    objc_copyWeak(&v32, (id *)buf);
    v31 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v30);

    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);
  }
LABEL_31:

}

void __41__TVPContentKeySession_finishKeyRequest___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "contentKeyLoader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadFairPlayStreamingKeyRequests:", v4);

}

void __41__TVPContentKeySession_finishKeyRequest___block_invoke_11(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22E2BA30C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = sLogObject_7;
  v5 = os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v15 = 138412290;
      v16 = v6;
      _os_log_impl(&dword_228A4E000, v4, OS_LOG_TYPE_DEFAULT, "Calling processContentKeyResponse for %@", (uint8_t *)&v15, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "avContentKeyRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDB2530];
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "renewalDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentKeyResponseWithFairPlayStreamingKeyResponseData:renewalDate:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "processContentKeyResponse:", v11);

    v4 = sLogObject_7;
    if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v15 = 138412290;
      v16 = v12;
      v13 = "processContentKeyResponse complete for %@";
LABEL_8:
      _os_log_impl(&dword_228A4E000, v4, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0xCu);
    }
  }
  else if (v5)
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = 138412290;
    v16 = v14;
    v13 = "Not calling processContentKeyResponse since content key session no longer exists for %@";
    goto LABEL_8;
  }

  objc_autoreleasePoolPop(v2);
}

- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  char v11;
  id v12;
  NSObject *v13;
  id v14;
  uint8_t buf[16];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[TVPContentKeySession offlineKeyIdentifiersInProgress](self, "offlineKeyIdentifiersInProgress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v10 = sLogObject_7;
      if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_228A4E000, v10, OS_LOG_TYPE_DEFAULT, "Offline key generation: received initial key request, now waiting for new offline key request.", buf, 2u);
      }
      v14 = 0;
      v11 = objc_msgSend(v7, "respondByRequestingPersistableContentKeyRequestAndReturnError:", &v14);
      v12 = v14;
      if ((v11 & 1) == 0)
      {
        v13 = sLogObject_7;
        if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_ERROR))
          -[TVPContentKeySession contentKeySession:didProvideContentKeyRequest:].cold.1((uint64_t)v12, v13);
      }
    }
    else
    {
      v16[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[TVPContentKeySession _loadAVContentKeyRequests:type:isRenewal:](self, "_loadAVContentKeyRequests:type:isRenewal:", v12, 0, 0);
    }

  }
}

- (void)contentKeySession:(id)a3 didProvideRenewingContentKeyRequest:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v8 = a4;
    v5 = (void *)MEMORY[0x24BDBCE30];
    v6 = a4;
    objc_msgSend(v5, "arrayWithObjects:count:", &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[TVPContentKeySession _loadAVContentKeyRequests:type:isRenewal:](self, "_loadAVContentKeyRequests:type:isRenewal:", v7, 0, 1, v8, v9);
  }
}

- (void)contentKeySession:(id)a3 didProvidePersistableContentKeyRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  TVPContentKeyRequest *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint8_t buf[4];
  TVPContentKeyRequest *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[TVPContentKeySession offlineKeyIdentifiersInProgress](self, "offlineKeyIdentifiersInProgress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v10 = -[TVPContentKeyRequest initWithAVContentKeyRequest:]([TVPContentKeyRequest alloc], "initWithAVContentKeyRequest:", v7);
      -[TVPContentKeyRequest setContentKeySession:](v10, "setContentKeySession:", self);
      -[TVPContentKeyRequest setIsRenewal:](v10, "setIsRenewal:", -[TVPContentKeySession offlineKeyGenerationIsForRenewal](self, "offlineKeyGenerationIsForRenewal"));
      -[TVPContentKeyRequest setType:](v10, "setType:", 2);
      v11 = sLogObject_7;
      if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v10;
        _os_log_impl(&dword_228A4E000, v11, OS_LOG_TYPE_DEFAULT, "Offline key generation: received offline content key request: %@", buf, 0xCu);
      }
      -[TVPContentKeySession keyRequestsInProgress](self, "keyRequestsInProgress");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v10);

      -[TVPContentKeySession keyRequestsInProgress](self, "keyRequestsInProgress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");
      -[TVPContentKeySession offlineKeyIdentifiersInProgress](self, "offlineKeyIdentifiersInProgress");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      v17 = sLogObject_7;
      v18 = os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT);
      if (v14 == v16)
      {
        if (v18)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_228A4E000, v17, OS_LOG_TYPE_DEFAULT, "Offline key generation: all offline content key requests received", buf, 2u);
        }
        objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__timeoutOfflineKeyRequestGeneration, 0);
        -[TVPContentKeySession _finishOfflineKeyGeneration](self, "_finishOfflineKeyGeneration");
      }
      else if (v18)
      {
        v19 = v17;
        -[TVPContentKeySession offlineKeyIdentifiersInProgress](self, "offlineKeyIdentifiersInProgress");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");
        -[TVPContentKeySession keyRequestsInProgress](self, "keyRequestsInProgress");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");
        *(_DWORD *)buf = 134217984;
        v26 = (TVPContentKeyRequest *)(v21 - v23);
        _os_log_impl(&dword_228A4E000, v19, OS_LOG_TYPE_DEFAULT, "Offline key generation: still waiting for %lu offline content key requests", buf, 0xCu);

      }
    }
    else
    {
      v24 = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
      v10 = (TVPContentKeyRequest *)objc_claimAutoreleasedReturnValue();
      -[TVPContentKeySession _loadAVContentKeyRequests:type:isRenewal:](self, "_loadAVContentKeyRequests:type:isRenewal:", v10, 2, 0);
    }

  }
}

- (void)contentKeySession:(id)a3 didUpdatePersistableContentKey:(id)a4 forContentKeyIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  char v14;
  id v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sLogObject_7;
  if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v10;
    _os_log_impl(&dword_228A4E000, v11, OS_LOG_TYPE_DEFAULT, "Received updated persistable content key for identifier %@", (uint8_t *)&v16, 0xCu);
  }
  if (!v10)
    goto LABEL_12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = v10;
      if (!objc_msgSend(v15, "length"))
      {
        v12 = 0;
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v15);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (!v12)
        goto LABEL_15;
      goto LABEL_6;
    }
LABEL_12:
    v12 = 0;
    goto LABEL_15;
  }
  v12 = v10;
LABEL_6:
  -[TVPContentKeySession contentKeyLoader](self, "contentKeyLoader");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[TVPContentKeySession contentKeyLoader](self, "contentKeyLoader");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateOfflineKeyWithIdentifier:updatedOfflineKeyData:", v12, v9);
LABEL_14:

  }
LABEL_15:

}

- (void)_timeoutOfflineKeyRequestGeneration
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_228A4E000, v0, v1, "Offline key generation: key request generation timed out before all key requests were generated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_finishOfflineKeyGeneration
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  id v6;

  -[TVPContentKeySession keyRequestsInProgress](self, "keyRequestsInProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "copy");

  -[TVPContentKeySession offlineKeyGenerationCompletionHandler](self, "offlineKeyGenerationCompletionHandler");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[TVPContentKeySession setOfflineKeyGenerationCompletionHandler:](self, "setOfflineKeyGenerationCompletionHandler:", 0);
  -[TVPContentKeySession setOfflineKeyIdentifiersInProgress:](self, "setOfflineKeyIdentifiersInProgress:", 0);
  -[TVPContentKeySession setOfflineKeyGenerationIsForRenewal:](self, "setOfflineKeyGenerationIsForRenewal:", 0);
  -[TVPContentKeySession keyRequestsInProgress](self, "keyRequestsInProgress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  if (v4)
    ((void (**)(_QWORD, id))v4)[2](v4, v6);

}

- (void)_generateOfflineKeyRequestsForIdentifiers:(id)a3 isRenewal:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v6 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  -[TVPContentKeySession offlineKeyGenerationCompletionHandler](self, "offlineKeyGenerationCompletionHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_ERROR))
      -[TVPContentKeySession _generateOfflineKeyRequestsForIdentifiers:isRenewal:completion:].cold.1();
    goto LABEL_4;
  }
  if (!objc_msgSend(v8, "count"))
  {
LABEL_4:
    if (v9)
      v9[2](v9, 0);
    goto LABEL_17;
  }
  -[TVPContentKeySession setOfflineKeyGenerationCompletionHandler:](self, "setOfflineKeyGenerationCompletionHandler:", v9);
  -[TVPContentKeySession setOfflineKeyIdentifiersInProgress:](self, "setOfflineKeyIdentifiersInProgress:", v8);
  -[TVPContentKeySession setOfflineKeyGenerationIsForRenewal:](self, "setOfflineKeyGenerationIsForRenewal:", v6);
  -[TVPContentKeySession performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__timeoutOfflineKeyRequestGeneration, 0, 10.0);
  v11 = (void *)sLogObject_7;
  if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    *(_DWORD *)buf = 134217984;
    v26 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_228A4E000, v12, OS_LOG_TYPE_DEFAULT, "Offline key generation: manually generating %lu key request(s)", buf, 0xCu);

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v17);
        -[TVPContentKeySession contentKeySession](self, "contentKeySession", (_QWORD)v20);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "processContentKeyRequestWithIdentifier:initializationData:options:", v18, 0, 0);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

LABEL_17:
}

- (void)_loadAVContentKeyRequests:(id)a3 type:(int64_t)a4 isRenewal:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  TVPContentKeyRequest *v14;
  NSObject *v15;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  TVPContentKeyRequest *v23;
  _BYTE v24[128];
  uint64_t v25;

  v5 = a5;
  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(obj);
        v14 = -[TVPContentKeyRequest initWithAVContentKeyRequest:]([TVPContentKeyRequest alloc], "initWithAVContentKeyRequest:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
        -[TVPContentKeyRequest setContentKeySession:](v14, "setContentKeySession:", self);
        -[TVPContentKeyRequest setIsRenewal:](v14, "setIsRenewal:", v5);
        -[TVPContentKeyRequest setType:](v14, "setType:", a4);
        objc_msgSend(v9, "addObject:", v14);
        v15 = sLogObject_7;
        if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v14;
          _os_log_impl(&dword_228A4E000, v15, OS_LOG_TYPE_DEFAULT, "Loading key request %@", buf, 0xCu);
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v11);
  }

  -[TVPContentKeySession contentKeyLoader](self, "contentKeyLoader");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "loadFairPlayStreamingKeyRequests:", v9);

}

- (AVContentKeySession)contentKeySession
{
  return self->_contentKeySession;
}

- (void)setContentKeySession:(id)a3
{
  objc_storeStrong((id *)&self->_contentKeySession, a3);
}

- (TVPContentKeyLoading)contentKeyLoader
{
  return self->_contentKeyLoader;
}

- (void)setContentKeyLoader:(id)a3
{
  objc_storeStrong((id *)&self->_contentKeyLoader, a3);
}

- (id)offlineKeyGenerationCompletionHandler
{
  return self->_offlineKeyGenerationCompletionHandler;
}

- (void)setOfflineKeyGenerationCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)offlineKeyIdentifiersInProgress
{
  return self->_offlineKeyIdentifiersInProgress;
}

- (void)setOfflineKeyIdentifiersInProgress:(id)a3
{
  objc_storeStrong((id *)&self->_offlineKeyIdentifiersInProgress, a3);
}

- (NSMutableArray)keyRequestsInProgress
{
  return self->_keyRequestsInProgress;
}

- (void)setKeyRequestsInProgress:(id)a3
{
  objc_storeStrong((id *)&self->_keyRequestsInProgress, a3);
}

- (BOOL)offlineKeyGenerationIsForRenewal
{
  return self->_offlineKeyGenerationIsForRenewal;
}

- (void)setOfflineKeyGenerationIsForRenewal:(BOOL)a3
{
  self->_offlineKeyGenerationIsForRenewal = a3;
}

- (OS_dispatch_queue)contentKeyProcessingQueue
{
  return self->_contentKeyProcessingQueue;
}

- (void)setContentKeyProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_contentKeyProcessingQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentKeyProcessingQueue, 0);
  objc_storeStrong((id *)&self->_keyRequestsInProgress, 0);
  objc_storeStrong((id *)&self->_offlineKeyIdentifiersInProgress, 0);
  objc_storeStrong(&self->_offlineKeyGenerationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_contentKeyLoader, 0);
  objc_storeStrong((id *)&self->_contentKeySession, 0);
}

void __61__TVPContentKeySession_fetchOfflineKeysForParams_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_228A4E000, v0, v1, "Unable to fetch keys because no key requests could be generated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __61__TVPContentKeySession_fetchOfflineKeysForParams_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_228A4E000, v0, v1, "Unable to fetch keys because object does not respond to loadFairPlayStreamingKeyRequests:completion:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)finishKeyRequest:(void *)a1 .cold.1(void *a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = a1;
  OUTLINED_FUNCTION_6_0();
  objc_msgSend(a2, "keyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_228A4E000, v6, v7, "Received error for key request, but not processing because no content key recipient exists.  [%lu: %{public}@] : %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_4_0();
}

- (void)finishKeyRequest:(void *)a1 .cold.2(void *a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = a1;
  OUTLINED_FUNCTION_6_0();
  objc_msgSend(a2, "keyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_228A4E000, v6, v7, "Processing error for key request [%lu: %{public}@] : %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_4_0();
}

- (void)contentKeySession:(uint64_t)a1 didProvideContentKeyRequest:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_228A4E000, a2, OS_LOG_TYPE_ERROR, "Offline key generation: Request for persistable key request failed: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_generateOfflineKeyRequestsForIdentifiers:isRenewal:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_228A4E000, v0, v1, "Offline key generation: got offline key request generation while one is already in progress.  Ignoring new request.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
