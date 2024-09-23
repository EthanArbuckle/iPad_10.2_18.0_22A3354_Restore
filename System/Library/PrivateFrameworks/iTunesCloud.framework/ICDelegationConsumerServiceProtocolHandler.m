@implementation ICDelegationConsumerServiceProtocolHandler

- (ICDelegationConsumerServiceProtocolHandler)init
{
  ICDelegationConsumerServiceProtocolHandler *v2;
  NSOperationQueue *v3;
  NSOperationQueue *operationQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *calloutQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICDelegationConsumerServiceProtocolHandler;
  v2 = -[ICDelegationConsumerServiceProtocolHandler init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    -[NSOperationQueue setName:](v2->_operationQueue, "setName:", CFSTR("com.apple.iTunesCloud.ICDelegationConsumerServiceProtocolHandler.operationQueue"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 3);
    v5 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationConsumerServiceProtocolHandler.calloutQueue", 0);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)getResponseForFinishDelegationRequest:(id)a3 withSessionIDToRequestInfoMap:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICAsyncBlockOperation *v11;
  id v12;
  id v13;
  id v14;
  ICAsyncBlockOperation *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  ICDelegationConsumerServiceProtocolHandler *v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [ICAsyncBlockOperation alloc];
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __132__ICDelegationConsumerServiceProtocolHandler_getResponseForFinishDelegationRequest_withSessionIDToRequestInfoMap_completionHandler___block_invoke;
  v19 = &unk_1E438FB38;
  v20 = v8;
  v21 = v9;
  v22 = self;
  v23 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  v15 = -[ICAsyncBlockOperation initWithStartHandler:](v11, "initWithStartHandler:", &v16);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v15, v16, v17, v18, v19);

}

- (void)getResponseForStartDelegationRequest:(id)a3 requestContext:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICAsyncBlockOperation *v11;
  id v12;
  id v13;
  id v14;
  ICAsyncBlockOperation *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  ICDelegationConsumerServiceProtocolHandler *v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [ICAsyncBlockOperation alloc];
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __120__ICDelegationConsumerServiceProtocolHandler_getResponseForStartDelegationRequest_requestContext_withCompletionHandler___block_invoke;
  v19 = &unk_1E438FB38;
  v20 = v9;
  v21 = v8;
  v22 = self;
  v23 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  v15 = -[ICAsyncBlockOperation initWithStartHandler:](v11, "initWithStartHandler:", &v16);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v15, v16, v17, v18, v19);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

void __120__ICDelegationConsumerServiceProtocolHandler_getResponseForStartDelegationRequest_requestContext_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  _BOOL4 v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  ICStoreRequestContext *v17;
  void *v18;
  void *v19;
  void *v20;
  ICStoreRequestContext *v21;
  void *v22;
  ICStoreRequestContext *v23;
  _QWORD v24[4];
  id v25;
  ICStoreRequestContext *v26;
  uint64_t v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "deviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __120__ICDelegationConsumerServiceProtocolHandler_getResponseForStartDelegationRequest_requestContext_withCompletionHandler___block_invoke_2;
  v31[3] = &unk_1E438AA78;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v32 = v5;
  v33 = v6;
  v7 = v4;
  v34 = v7;
  v35 = *(id *)(a1 + 32);
  v37 = *(id *)(a1 + 56);
  v8 = v3;
  v36 = v8;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A1AFA8D0](v31);
  v29 = 0;
  v30 = 0;
  v10 = +[ICADIUtilities generateMachineDataForAccountID:returningMachineIDData:otpData:error:](ICADIUtilities, "generateMachineDataForAccountID:returningMachineIDData:otpData:error:", -1, &v30, 0, &v29);
  v11 = v30;
  v12 = v29;
  v13 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v14)
    {
      v15 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543362;
      v39 = v15;
      _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Had existing anisette data.", buf, 0xCu);
    }

    ((void (**)(_QWORD, uint64_t, id))v9)[2](v9, 1, v11);
  }
  else
  {
    if (v14)
    {
      v16 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v39 = v16;
      v40 = 2114;
      v41 = v12;
      _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Missing anisette data (error: %{public}@), starting provisioning...", buf, 0x16u);
    }

    v17 = [ICStoreRequestContext alloc];
    +[ICUserIdentity nullIdentity](ICUserIdentity, "nullIdentity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "clientInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[ICStoreRequestContext initWithIdentity:identityStore:clientInfo:](v17, "initWithIdentity:identityStore:clientInfo:", v18, v19, v20);

    +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __120__ICDelegationConsumerServiceProtocolHandler_getResponseForStartDelegationRequest_requestContext_withCompletionHandler___block_invoke_25;
    v24[3] = &unk_1E4390738;
    v25 = v7;
    v26 = v21;
    v27 = *(_QWORD *)(a1 + 48);
    v28 = v9;
    v23 = v21;
    objc_msgSend(v22, "getBagForRequestContext:withCompletionHandler:", v23, v24);

  }
}

void __120__ICDelegationConsumerServiceProtocolHandler_getResponseForStartDelegationRequest_requestContext_withCompletionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6;
  int ContextIdentifierForFolderPath;
  id v8;
  ICPBDGSStartDelegationResponse *v9;
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  id v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  ICPBDGSPlayerInfoContextToken *v24;
  ICPBDGSPlayerInfoContextToken *v25;
  id v26;
  id v27;
  int v28;
  NSData *v29;
  NSObject *p_super;
  uint64_t v31;
  NSData *v32;
  ICDelegationConsumerServiceSessionRequestInfo *v33;
  uint64_t v34;
  ICPBDGSStartDelegationResponse *v35;
  void *v36;
  void *playerInfoContextTokens;
  NSMutableArray *v38;
  NSObject *v39;
  id v40;
  id v41;
  int v42;
  void *v43;
  id v44;
  uint64_t v45;
  _QWORD *obj;
  id v47;
  uint64_t v48;
  _QWORD block[4];
  ICPBDGSStartDelegationResponse *v50;
  id v51;
  id v52;
  id v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  int v62;
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  NSData *v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v62 = 0;
  v61 = 0;
  ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(0, &v62, &v61);
  v8 = v61;
  v9 = 0;
  v10 = 0;
  if (ContextIdentifierForFolderPath)
  {
    v47 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = *(_QWORD **)(a1 + 32);
    v43 = v8;
    v44 = v6;
    v45 = a1;
    v41 = a3;
    v42 = a2;
    if (v11)
      v11 = (_QWORD *)v11[1];
    v12 = v11;
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    obj = v12;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
    if (v14)
    {
      v15 = v14;
      v48 = *(_QWORD *)v58;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v58 != v48)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD **)(*((_QWORD *)&v57 + 1) + 8 * v16);
          if (v17)
            v18 = (void *)v17[3];
          else
            v18 = 0;
          v19 = v18;
          v20 = (void *)objc_msgSend(v19, "copy", v41);

          if (v17)
          {
            v21 = v17[2];
            v22 = v17[1];
          }
          else
          {
            v21 = 0;
            v22 = 0;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_alloc_init(ICPBDGSPlayerInfoContextToken);
          v25 = v24;
          if (v24)
          {
            *(_BYTE *)&v24->_has |= 1u;
            v24->_sessionID = v21;
          }
          v56 = 0;
          if (objc_msgSend(v20, "length"))
          {
            v26 = v13;
            v55 = 0;
            v54 = 0;
            v27 = objc_retainAutorelease(v20);
            objc_msgSend(v27, "bytes");
            objc_msgSend(v27, "length");
            woqRTqq9PL5McfBs891();
            if (v28)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICFairPlayError"), v28, 0);
              v29 = (NSData *)objc_claimAutoreleasedReturnValue();
              p_super = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
              if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
              {
                v31 = *(_QWORD *)(a1 + 40);
                *(_DWORD *)buf = 138543618;
                v64 = v31;
                v65 = 2114;
                v66 = v29;
                _os_log_impl(&dword_1A03E3000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to create PIC with error: %{public}@.", buf, 0x16u);
              }
LABEL_21:

            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99D50], "ic_dataWithFairPlayBytes:length:", v55, v54);
              v32 = (NSData *)objc_claimAutoreleasedReturnValue();
              v29 = v32;
              if (v25)
              {
                v29 = v32;
                p_super = &v25->_token->super;
                v25->_token = v29;
                goto LABEL_21;
              }
            }

            v33 = -[ICDelegationConsumerServiceSessionRequestInfo initWithAccountID:fairPlaySessionID:]([ICDelegationConsumerServiceSessionRequestInfo alloc], "initWithAccountID:fairPlaySessionID:", v22, v56);
            objc_msgSend(v47, "setObject:forKey:", v33, v23);

            v13 = v26;
          }
          objc_msgSend(v13, "addObject:", v25);

          ++v16;
        }
        while (v15 != v16);
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
        v15 = v34;
      }
      while (v34);
    }

    v35 = objc_alloc_init(ICPBDGSStartDelegationResponse);
    objc_msgSend(*(id *)(a1 + 48), "deviceFairPlayGUIDData");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
      objc_storeStrong((id *)&v35->_playerDeviceGUID, v36);

    objc_msgSend(*(id *)(a1 + 56), "userAgent");
    playerInfoContextTokens = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v43;
    v6 = v44;
    if (v35)
    {
      objc_storeStrong((id *)&v35->_playerUserAgent, playerInfoContextTokens);

      if (v42)
        objc_storeStrong((id *)&v35->_playerAnisetteMID, v41);
      v38 = (NSMutableArray *)v13;
      playerInfoContextTokens = v35->_playerInfoContextTokens;
      v35->_playerInfoContextTokens = v38;
    }

    v39 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __120__ICDelegationConsumerServiceProtocolHandler_getResponseForStartDelegationRequest_requestContext_withCompletionHandler___block_invoke_18;
    block[3] = &unk_1E4390EA8;
    v53 = *(id *)(a1 + 72);
    v9 = v35;
    v50 = v9;
    v10 = v47;
    v51 = v10;
    v40 = v43;
    v52 = v40;
    dispatch_async(v39, block);
    objc_msgSend(*(id *)(v45 + 64), "finishWithError:", v40);

  }
}

void __120__ICDelegationConsumerServiceProtocolHandler_getResponseForStartDelegationRequest_requestContext_withCompletionHandler___block_invoke_25(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  ICStoreURLRequest *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  objc_msgSend(a2, "urlForBagKey:", CFSTR("subDownload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v3);
    objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", CFSTR("lease-start"), CFSTR("action"), 0);
    objc_msgSend(*(id *)(a1 + 32), "deviceGUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("guid"));
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 0, &v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v15;
    v9 = v8;
    if (!v7 || v8)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      objc_msgSend(v4, "setHTTPBody:", v7);
      objc_msgSend(v4, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
      v10 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", v4, *(_QWORD *)(a1 + 40));
      -[ICURLRequest setPrioritize:](v10, "setPrioritize:", 1);
      -[ICStoreURLRequest setShouldParseBodyData:](v10, "setShouldParseBodyData:", 0);
      +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __120__ICDelegationConsumerServiceProtocolHandler_getResponseForStartDelegationRequest_requestContext_withCompletionHandler___block_invoke_2_38;
      v13[3] = &unk_1E4391008;
      v12 = *(void **)(a1 + 56);
      v13[4] = *(_QWORD *)(a1 + 48);
      v14 = v12;
      objc_msgSend(v11, "enqueueDataRequest:withCompletionHandler:", v10, v13);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __120__ICDelegationConsumerServiceProtocolHandler_getResponseForStartDelegationRequest_requestContext_withCompletionHandler___block_invoke_2_38(uint64_t a1)
{
  _BOOL4 v2;
  id v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = 0;
  v2 = +[ICADIUtilities generateMachineDataForAccountID:returningMachineIDData:otpData:error:](ICADIUtilities, "generateMachineDataForAccountID:returningMachineIDData:otpData:error:", -1, &v10, 0, &v9);
  v3 = v10;
  v4 = v9;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v12 = v7;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Provisioned anisette data.", buf, 0xCu);
    }
  }
  else if (v6)
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v12 = v8;
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Missing anisette data (error: %{public}@.", buf, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __120__ICDelegationConsumerServiceProtocolHandler_getResponseForStartDelegationRequest_requestContext_withCompletionHandler___block_invoke_18(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __132__ICDelegationConsumerServiceProtocolHandler_getResponseForFinishDelegationRequest_withSessionIDToRequestInfoMap_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  int v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  ICDelegateToken *v21;
  double v22;
  ICDelegationConsumerServiceSessionRequestResult *v23;
  void *v24;
  id v25;
  ICDelegationConsumerServiceSessionRequestResult *v26;
  uint64_t v27;
  ICPBDGSFinishDelegationResponse *v28;
  void *v29;
  NSObject *v30;
  id v31;
  ICPBDGSFinishDelegationResponse *v32;
  id v33;
  _QWORD *obj;
  id v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD block[4];
  ICPBDGSFinishDelegationResponse *v39;
  id v40;
  id v41;
  unsigned int v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v33 = a2;
  v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v37 = a1;
  v3 = *(_QWORD **)(a1 + 32);
  if (v3)
    v3 = (_QWORD *)v3[1];
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v4)
  {
    v5 = v4;
    v36 = *(_QWORD *)v45;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v45 != v36)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v6);
        if (v7)
          v8 = *(_QWORD *)(v7 + 16);
        else
          v8 = 0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v37 + 40), "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v43 = 0;
          v42 = 0;
          if (v7)
            v11 = *(void **)(v7 + 32);
          else
            v11 = 0;
          v12 = v11;
          v13 = (void *)objc_msgSend(v12, "copy");

          v14 = objc_msgSend(v10, "fairPlaySessionID");
          v15 = objc_retainAutorelease(v13);
          nXJ7Amk1zyK93(v14, objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), (uint64_t)&v43, (uint64_t)&v42);
          if (v16)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICFairPlayError"), v16, 0);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v19 = *(_QWORD *)(v37 + 48);
              *(_DWORD *)buf = 138543618;
              v49 = v19;
              v50 = 2114;
              v51 = v17;
              _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to extract PDInfo with error: %{public}@.", buf, 0x16u);
            }
            v20 = 0;
            v21 = 0;
            goto LABEL_23;
          }
          objc_msgSend(MEMORY[0x1E0C99D50], "ic_dataWithFairPlayBytes:length:", v43, v42);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            if (v7)
              v22 = *(double *)(v7 + 8);
            else
              v22 = 0.0;
            if (v22 < 600.0)
              v22 = 600.0;
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v22);
            v18 = objc_claimAutoreleasedReturnValue();
            v21 = -[ICDelegateToken initWithType:data:expirationDate:]([ICDelegateToken alloc], "initWithType:data:expirationDate:", 1, v20, v18);
            v17 = 0;
LABEL_23:

          }
          else
          {
            v17 = 0;
            v21 = 0;
          }
          v23 = [ICDelegationConsumerServiceSessionRequestResult alloc];
          if (v7)
            v24 = *(void **)(v7 + 24);
          else
            v24 = 0;
          v25 = v24;
          v26 = -[ICDelegationConsumerServiceSessionRequestResult initWithDelegateToken:storefrontIdentifier:resultError:](v23, "initWithDelegateToken:storefrontIdentifier:resultError:", v21, v25, v17);

          objc_msgSend(v35, "setObject:forKey:", v26, v9);
        }

        ++v6;
      }
      while (v5 != v6);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      v5 = v27;
    }
    while (v27);
  }
  v28 = objc_alloc_init(ICPBDGSFinishDelegationResponse);
  v29 = *(void **)(v37 + 56);
  v30 = *(NSObject **)(*(_QWORD *)(v37 + 48) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __132__ICDelegationConsumerServiceProtocolHandler_getResponseForFinishDelegationRequest_withSessionIDToRequestInfoMap_completionHandler___block_invoke_11;
  block[3] = &unk_1E4390E58;
  v39 = v28;
  v40 = v35;
  v41 = v29;
  v31 = v35;
  v32 = v28;
  dispatch_async(v30, block);
  objc_msgSend(v33, "finishWithError:", 0);

}

uint64_t __132__ICDelegationConsumerServiceProtocolHandler_getResponseForFinishDelegationRequest_withSessionIDToRequestInfoMap_completionHandler___block_invoke_11(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

@end
