@implementation ICDelegationProviderServiceProtocolHandler

- (ICDelegationProviderServiceProtocolHandler)initWithUserIdentityStore:(id)a3 requestContext:(id)a4
{
  id v7;
  id v8;
  ICDelegationProviderServiceProtocolHandler *v9;
  ICDelegationProviderServiceProtocolHandler *v10;
  NSOperationQueue *v11;
  NSOperationQueue *operationQueue;
  dispatch_queue_t v13;
  OS_dispatch_queue *calloutQueue;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ICDelegationProviderServiceProtocolHandler;
  v9 = -[ICDelegationProviderServiceProtocolHandler init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identityStore, a3);
    objc_storeStrong((id *)&v10->_requestContext, a4);
    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v10->_operationQueue;
    v10->_operationQueue = v11;

    -[NSOperationQueue setName:](v10->_operationQueue, "setName:", CFSTR("com.apple.iTunesCloud.ICDelegationProviderServiceProtocolHandler.operationQueue"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v10->_operationQueue, "setMaxConcurrentOperationCount:", 3);
    v13 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationProviderServiceProtocolHandler.calloutQueue", 0);
    calloutQueue = v10->_calloutQueue;
    v10->_calloutQueue = (OS_dispatch_queue *)v13;

  }
  return v10;
}

- (void)getFinishDelegationRequestsWithStartDelegationResponse:(id)a3 streamContexts:(id)a4 replyHandler:(id)a5
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
  ICDelegationProviderServiceProtocolHandler *v20;
  id v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [ICAsyncBlockOperation alloc];
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __129__ICDelegationProviderServiceProtocolHandler_getFinishDelegationRequestsWithStartDelegationResponse_streamContexts_replyHandler___block_invoke;
  v19 = &unk_1E438FB38;
  v20 = self;
  v21 = v8;
  v22 = v9;
  v23 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  v15 = -[ICAsyncBlockOperation initWithStartHandler:](v11, "initWithStartHandler:", &v16);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v15, v16, v17, v18, v19, v20);

}

- (void)getStartDelegationRequestForAccountIDs:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  ICAsyncBlockOperation *v8;
  id v9;
  id v10;
  ICAsyncBlockOperation *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = [ICAsyncBlockOperation alloc];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __107__ICDelegationProviderServiceProtocolHandler_getStartDelegationRequestForAccountIDs_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E438FB60;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  v11 = -[ICAsyncBlockOperation initWithStartHandler:](v8, "initWithStartHandler:", v12);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v11);

}

- (void)_getPlayInfoRequestWithStartDelegationResponse:(id)a3 streamContexts:(id)a4 completionHandler:(id)a5
{
  _QWORD *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  _QWORD *v24;
  NSObject *v25;
  ICDelegationPlayInfoTokenRequest *v26;
  uint64_t v27;
  ICDelegationPlayInfoRequest *v28;
  void *v29;
  id *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  unsigned __int8 *v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int v40;
  void *v41;
  id v42;
  id v43;
  ICUserIdentityStore *identityStore;
  NSObject *v45;
  void (**v46)(_QWORD, _QWORD, _QWORD);
  id *v47;
  void *v49;
  id obj;
  id v51;
  _QWORD v52[7];
  void (**v53)(_QWORD, _QWORD, _QWORD);
  _QWORD v54[5];
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  ICDelegationProviderServiceProtocolHandler *v63;
  __int16 v64;
  _QWORD *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v51 = a4;
  v8 = a5;
  v9 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v63 = self;
    v64 = 2114;
    v65 = v7;
    _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: _getPlayInfoRequestWithStartDelegationResponse - Starting - response=%{public}@", buf, 0x16u);
  }

  v46 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  v47 = (id *)v7;
  if (v7)
    v10 = (void *)v7[3];
  else
    v10 = 0;
  v11 = v10;
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v58;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v58 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v15);
        if (v16)
        {
          v17 = *(id *)(v16 + 16);
          v18 = *(_QWORD *)(v16 + 8);
        }
        else
        {
          v17 = 0;
          v18 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "objectForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          v21 = (void *)objc_msgSend(v17, "copy");
          v55 = 0;
          v56 = 0;
          v22 = objc_msgSend(v20, "getStreamerInfoContextDataUsingPlayerInfoContextData:returningData:error:", v21, &v56, &v55);
          v23 = v56;
          v24 = v55;

          if ((v22 & 1) != 0)
          {
            v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", objc_msgSend(v20, "accountID"));
            v26 = -[ICDelegationPlayInfoTokenRequest initWithDSID:SICData:]([ICDelegationPlayInfoTokenRequest alloc], "initWithDSID:SICData:", v25, v23);
            objc_msgSend(v49, "setObject:forKey:", v26, v25);

          }
          else
          {
            v25 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v63 = self;
              v64 = 2114;
              v65 = v24;
              _os_log_impl(&dword_1A03E3000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: _getPlayInfoRequestWithStartDelegationResponse - Failed [Generating streamer info context] - error=%{public}@", buf, 0x16u);
            }
          }

        }
        ++v15;
      }
      while (v13 != v15);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      v13 = v27;
    }
    while (v27);
  }

  if (objc_msgSend(v49, "count"))
  {
    v28 = objc_alloc_init(ICDelegationPlayInfoRequest);
    v29 = v28;
    v31 = v46;
    v30 = v47;
    if (v47)
    {
      v32 = v47[1];
      objc_msgSend(v29, "setPlayerAnisetteMID:", v32);

      v33 = v47[2];
    }
    else
    {
      -[ICDelegationPlayInfoRequest setPlayerAnisetteMID:](v28, "setPlayerAnisetteMID:", 0);
      v33 = 0;
    }
    v34 = v33;
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 2 * objc_msgSend(v34, "length"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_retainAutorelease(v34);
    v37 = (unsigned __int8 *)objc_msgSend(v36, "bytes");
    v38 = objc_msgSend(v36, "length");
    if (v38 >= 1)
    {
      v39 = v38;
      do
      {
        v40 = *v37++;
        objc_msgSend(v35, "appendFormat:", CFSTR("%02X"), v40);
        --v39;
      }
      while (v39);
    }

    objc_msgSend(v35, "lowercaseString");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setPlayerDeviceGUID:", v41);

    if (v47)
      v42 = v47[4];
    else
      v42 = 0;
    v43 = v42;
    objc_msgSend(v29, "setPlayerUserAgent:", v43);

    identityStore = self->_identityStore;
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __126__ICDelegationProviderServiceProtocolHandler__getPlayInfoRequestWithStartDelegationResponse_streamContexts_completionHandler___block_invoke;
    v54[3] = &unk_1E438FB88;
    v54[4] = v49;
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __126__ICDelegationProviderServiceProtocolHandler__getPlayInfoRequestWithStartDelegationResponse_streamContexts_completionHandler___block_invoke_2;
    v52[3] = &unk_1E4390EA8;
    v52[4] = v29;
    v52[5] = v49;
    v52[6] = self;
    v53 = v46;
    -[ICUserIdentityStore enumerateDelegateTokensWithType:usingBlock:completionHandler:](identityStore, "enumerateDelegateTokensWithType:usingBlock:completionHandler:", 1, v54, v52);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7503, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    v31 = v46;
    v30 = v47;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v63 = self;
      v64 = 2114;
      v65 = v29;
      _os_log_impl(&dword_1A03E3000, v45, OS_LOG_TYPE_ERROR, "%{public}@: _getPlayInfoRequestWithStartDelegationResponse - Failed [no tokens] - error=%{public}@", buf, 0x16u);
    }

    ((void (**)(_QWORD, _QWORD, void *))v46)[2](v46, 0, v29);
  }

}

- (unint64_t)_nextSessionUniqueID
{
  unint64_t *p_nextSessionUniqueID;
  unint64_t v3;
  unint64_t result;

  p_nextSessionUniqueID = &self->_nextSessionUniqueID;
  do
  {
    v3 = __ldaxr(p_nextSessionUniqueID);
    result = v3 + 1;
  }
  while (__stlxr(v3 + 1, p_nextSessionUniqueID));
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_identityStore, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

void __126__ICDelegationProviderServiceProtocolHandler__getPlayInfoRequestWithStartDelegationResponse_streamContexts_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(a3, "DSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCloudCredentialsTokenData:", v7);

  }
}

uint64_t __126__ICDelegationProviderServiceProtocolHandler__getPlayInfoRequestWithStartDelegationResponse_streamContexts_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTokenRequests:", v3);

  v4 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: _getPlayInfoRequestWithStartDelegationResponse - Finished [Request ready] - tokens=%{public}@", (uint8_t *)&v8, 0x16u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __107__ICDelegationProviderServiceProtocolHandler_getStartDelegationRequestForAccountIDs_withCompletionHandler___block_invoke(id *a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  ICPBDGSPlayerInfoContextRequestToken *v5;
  int ContextIdentifierForFolderPath;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  ICPBDGSPlayerInfoContextRequestToken *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  ICFPStreamContext *v18;
  ICFPStreamContext *v19;
  id v20;
  ICPBDGSPlayerInfoContextRequestToken *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSMutableArray *v25;
  void *v26;
  NSObject *v27;
  id v28;
  id v29;
  uint64_t v30;
  ICPBDGSPlayerInfoContextRequestToken *v31;
  ICPBDGSPlayerInfoContextRequestToken *v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  id v36;
  ICPBDGSStartDelegationRequest *v37;
  NSMutableArray *v38;
  NSObject *p_super;
  id v40;
  NSObject *v41;
  id v42;
  ICPBDGSPlayerInfoContextRequestToken *v43;
  id v44;
  ICPBDGSStartDelegationRequest *v45;
  id v46;
  id v47;
  uint64_t v48;
  id obj;
  NSMutableArray *v51;
  _QWORD block[4];
  ICPBDGSStartDelegationRequest *v53;
  id v54;
  ICPBDGSPlayerInfoContextRequestToken *v55;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  unsigned int v63;
  uint8_t buf[4];
  id v65;
  __int16 v66;
  ICPBDGSPlayerInfoContextRequestToken *v67;
  __int16 v68;
  id v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v63 = 0;
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = a1[4];
    v5 = (ICPBDGSPlayerInfoContextRequestToken *)a1[5];
    *(_DWORD *)buf = 138543618;
    v65 = v4;
    v66 = 2112;
    v67 = v5;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: getStartDelegationRequestForAccountIDs - Starting - accountIDs=%@", buf, 0x16u);
  }

  v62 = 0;
  ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(0, &v63, &v62);
  v7 = v62;
  v8 = v7;
  if (ContextIdentifierForFolderPath)
  {
    v46 = v7;
    v47 = v2;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = a1[5];
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v51 = 0;
      v12 = *(_QWORD *)v59;
      do
      {
        v13 = 0;
        v48 = v10;
        do
        {
          if (*(_QWORD *)v59 != v12)
            objc_enumerationMutation(obj);
          v14 = *(ICPBDGSPlayerInfoContextRequestToken **)(*((_QWORD *)&v58 + 1) + 8 * v13);
          v15 = -[ICPBDGSPlayerInfoContextRequestToken unsignedLongLongValue](v14, "unsignedLongLongValue", v46, v47);
          if (v15)
          {
            v16 = v15;
            +[ICFPContentInfo whaContentInfoWithAccountID:](ICFPContentInfo, "whaContentInfoWithAccountID:", v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = [ICFPStreamContext alloc];
            v57 = 0;
            v19 = -[ICFPStreamContext initWithVersion:contextID:contentInfo:returningError:](v18, "initWithVersion:contextID:contentInfo:returningError:", 3, v63, v17, &v57);
            v20 = v57;
            if (v19)
            {
              v21 = objc_alloc_init(ICPBDGSPlayerInfoContextRequestToken);
              -[ICFPStreamContext playerInfoContextRequestData](v19, "playerInfoContextRequestData");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v22;
              if (v21)
              {
                objc_storeStrong((id *)&v21->_token, v22);

                *(_BYTE *)&v21->_has |= 1u;
                v21->_accountID = v16;
                v24 = objc_msgSend(a1[4], "_nextSessionUniqueID");
                *(_BYTE *)&v21->_has |= 2u;
                v21->_sessionID = v24;
              }
              else
              {

                v24 = objc_msgSend(a1[4], "_nextSessionUniqueID");
              }
              v25 = v51;
              if (!v51)
                v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v51 = v25;
              -[NSMutableArray addObject:](v25, "addObject:", v21);
              if (!v11)
                v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v24);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setObject:forKey:", v19, v26);

              v27 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
              v10 = v48;
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                v28 = a1[4];
                *(_DWORD *)buf = 138543618;
                v65 = v28;
                v66 = 2112;
                v67 = v21;
                _os_log_impl(&dword_1A03E3000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: getStartDelegationRequestForAccountIDs - Built request token: %@", buf, 0x16u);
              }

            }
            else
            {
              v21 = (ICPBDGSPlayerInfoContextRequestToken *)os_log_create("com.apple.amp.iTunesCloud", "Delegation");
              if (os_log_type_enabled(&v21->super.super, OS_LOG_TYPE_ERROR))
              {
                v29 = a1[4];
                *(_DWORD *)buf = 138543874;
                v65 = v29;
                v66 = 2112;
                v67 = v14;
                v68 = 2114;
                v69 = v20;
                _os_log_impl(&dword_1A03E3000, &v21->super.super, OS_LOG_TYPE_ERROR, "%{public}@: getStartDelegationRequestForAccountIDs - Failed to generate stream context - accountID=%@ - error=%{public}@", buf, 0x20u);
              }
            }

          }
          ++v13;
        }
        while (v10 != v13);
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
        v10 = v30;
      }
      while (v30);
    }
    else
    {
      v11 = 0;
      v51 = 0;
    }

    if (-[NSMutableArray count](v51, "count"))
    {
      v32 = 0;
      v8 = v46;
      v2 = v47;
      goto LABEL_38;
    }
    v8 = v46;
    v2 = v47;
LABEL_44:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7101, 0, v46, v47);
    v32 = (ICPBDGSPlayerInfoContextRequestToken *)objc_claimAutoreleasedReturnValue();
    p_super = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      v40 = a1[4];
      *(_DWORD *)buf = 138543618;
      v65 = v40;
      v66 = 2114;
      v67 = v32;
      _os_log_impl(&dword_1A03E3000, p_super, OS_LOG_TYPE_ERROR, "%{public}@: getStartDelegationRequestForAccountIDs - Unknown issue [request building failed] - error=%{public}@", buf, 0x16u);
    }
    v37 = 0;
    goto LABEL_47;
  }
  if (v7)
  {
    v31 = (ICPBDGSPlayerInfoContextRequestToken *)v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7002, 0);
    v31 = (ICPBDGSPlayerInfoContextRequestToken *)objc_claimAutoreleasedReturnValue();
  }
  v32 = v31;
  v33 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    v34 = a1[4];
    *(_DWORD *)buf = 138543618;
    v65 = v34;
    v66 = 2114;
    v67 = v32;
    _os_log_impl(&dword_1A03E3000, v33, OS_LOG_TYPE_ERROR, "%{public}@: getStartDelegationRequestForAccountIDs - Fairplay issue [get context failed] - error=%{public}@", buf, 0x16u);
  }

  v11 = 0;
  if (!objc_msgSend(0, "count"))
  {
    v51 = 0;
    v37 = 0;
    if (v32)
      goto LABEL_48;
    goto LABEL_44;
  }
  v51 = 0;
LABEL_38:
  v35 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v36 = a1[4];
    *(_DWORD *)buf = 138543362;
    v65 = v36;
    _os_log_impl(&dword_1A03E3000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: getStartDelegationRequestForAccountIDs - Request tokens ready", buf, 0xCu);
  }

  v37 = objc_alloc_init(ICPBDGSStartDelegationRequest);
  if (v37)
  {
    v38 = v51;
    p_super = &v37->_playerInfoContextRequestTokens->super.super;
    v51 = v38;
    v37->_playerInfoContextRequestTokens = v38;
LABEL_47:

  }
LABEL_48:
  v41 = *((_QWORD *)a1[4] + 1);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__ICDelegationProviderServiceProtocolHandler_getStartDelegationRequestForAccountIDs_withCompletionHandler___block_invoke_23;
  block[3] = &unk_1E4390EA8;
  v42 = a1[6];
  v53 = v37;
  v54 = v11;
  v55 = v32;
  v56 = v42;
  v43 = v32;
  v44 = v11;
  v45 = v37;
  dispatch_async(v41, block);
  objc_msgSend(v2, "finishWithError:", v43);

}

uint64_t __107__ICDelegationProviderServiceProtocolHandler_getStartDelegationRequestForAccountIDs_withCompletionHandler___block_invoke_23(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __129__ICDelegationProviderServiceProtocolHandler_getFinishDelegationRequestsWithStartDelegationResponse_streamContexts_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: getFinishDelegationRequestsWithStartDelegationResponse - Starting - startResponse=%@", buf, 0x16u);
  }

  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __129__ICDelegationProviderServiceProtocolHandler_getFinishDelegationRequestsWithStartDelegationResponse_streamContexts_replyHandler___block_invoke_3;
  v11[3] = &unk_1E438FB10;
  v11[4] = v7;
  v9 = *(_QWORD *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  v12 = v3;
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v10 = v3;
  objc_msgSend(v7, "_getPlayInfoRequestWithStartDelegationResponse:streamContexts:completionHandler:", v8, v9, v11);

}

void __129__ICDelegationProviderServiceProtocolHandler_getFinishDelegationRequestsWithStartDelegationResponse_streamContexts_replyHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  ICDelegationPlayInfoRequestOperation *v7;
  ICStoreRequestContext *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  ICStoreRequestContext *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  ICDelegationPlayInfoRequestOperation *v23;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = objc_alloc_init(ICDelegationPlayInfoRequestOperation);
    -[ICDelegationPlayInfoRequestOperation setPlayInfoRequest:](v7, "setPlayInfoRequest:", v5);
    v8 = [ICStoreRequestContext alloc];
    +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(v10 + 16);
    objc_msgSend(*(id *)(v10 + 40), "clientInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[ICStoreRequestContext initWithIdentity:identityStore:clientInfo:](v8, "initWithIdentity:identityStore:clientInfo:", v9, v11, v12);

    -[ICDelegationPlayInfoRequestOperation setStoreRequestContext:](v7, "setStoreRequestContext:", v13);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __129__ICDelegationProviderServiceProtocolHandler_getFinishDelegationRequestsWithStartDelegationResponse_streamContexts_replyHandler___block_invoke_3;
    v16[3] = &unk_1E438FAE8;
    v16[4] = *(_QWORD *)(a1 + 32);
    v20 = *(id *)(a1 + 64);
    v17 = *(id *)(a1 + 40);
    v18 = *(id *)(a1 + 48);
    v19 = *(id *)(a1 + 56);
    -[ICDelegationPlayInfoRequestOperation setResponseHandler:](v7, "setResponseHandler:", v16);
    -[ICDelegationPlayInfoRequestOperation execute](v7, "execute");

  }
  else
  {
    v14 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __129__ICDelegationProviderServiceProtocolHandler_getFinishDelegationRequestsWithStartDelegationResponse_streamContexts_replyHandler___block_invoke_2;
    block[3] = &unk_1E4390EF8;
    v23 = (ICDelegationPlayInfoRequestOperation *)*(id *)(a1 + 64);
    v15 = v6;
    v22 = v15;
    dispatch_async(v14, block);
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v15);

    v7 = v23;
  }

}

uint64_t __129__ICDelegationProviderServiceProtocolHandler_getFinishDelegationRequestsWithStartDelegationResponse_streamContexts_replyHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32), 1);
}

void __129__ICDelegationProviderServiceProtocolHandler_getFinishDelegationRequestsWithStartDelegationResponse_streamContexts_replyHandler___block_invoke_3(uint64_t a1, char a2, void *a3, void *a4)
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  id v31;
  NSObject *v32;
  id v33;
  ICPBDGSPlayerDelegateInfoToken *v34;
  os_log_t p_super;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  ICPBDGSFinishDelegationRequest *v45;
  ICPBDGSFinishDelegationRequest *v46;
  void *v47;
  NSObject *v48;
  id v49;
  uint64_t v50;
  NSObject *v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  _QWORD *obj;
  id v58;
  uint64_t v59;
  _QWORD block[5];
  id v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[4];
  id v69;
  id v70;
  uint8_t v71[128];
  uint8_t buf[4];
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v58 = a3;
  v6 = a4;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  v8 = v7;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD **)(a1 + 48);
      if (v10)
        v10 = (_QWORD *)v10[3];
      v11 = v10;
      v12 = objc_msgSend(v11, "count");
      v13 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v73 = v9;
      v74 = 2048;
      v75 = v12;
      v76 = 2112;
      v77 = v13;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: getFinishDelegationRequestsWithStartDelegationResponse [%lu tokens] - Received Response - response=%@", buf, 0x20u);

    }
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = *(_QWORD **)(a1 + 48);
    v53 = v6;
    v54 = v14;
    if (v15)
      v15 = (_QWORD *)v15[3];
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    obj = v15;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
    v17 = a1;
    if (v16)
    {
      v18 = v16;
      v19 = 0x1E0CB3000uLL;
      v59 = *(_QWORD *)v65;
      do
      {
        v20 = 0;
        v55 = v18;
        do
        {
          if (*(_QWORD *)v65 != v59)
            objc_enumerationMutation(obj);
          v21 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v20);
          if (v21)
            v22 = *(objc_class **)(v21 + 8);
          else
            v22 = 0;
          v23 = *(void **)(v17 + 56);
          objc_msgSend(*(id *)(v19 + 2024), "numberWithUnsignedLongLong:", v22, v53);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKey:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            v26 = (void *)objc_msgSend(objc_alloc(*(Class *)(v19 + 2024)), "initWithUnsignedLongLong:", objc_msgSend(v25, "accountID"));
            objc_msgSend(v58, "objectForKey:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v27;
            if (v27)
            {
              objc_msgSend(v27, "tokenData");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = 0;
              v63 = 0;
              v30 = objc_msgSend(v25, "getPlayerDelegateInfoDataUsingPlayerDelegateInfoResponseData:returningData:error:", v29, &v63, &v62);
              v31 = v63;
              v32 = v63;
              v33 = v62;

              if ((v30 & 1) != 0)
              {
                v34 = objc_alloc_init(ICPBDGSPlayerDelegateInfoToken);
                p_super = &v34->super.super;
                if (v34)
                {
                  objc_storeStrong((id *)&v34->_token, v31);
                  LOBYTE(p_super[5].isa) |= 2u;
                  p_super[2].isa = v22;
                }
                objc_msgSend(v28, "storefrontIdentifier");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                if (v36 && p_super)
                  objc_storeStrong((id *)&p_super[3].isa, v36);
                objc_msgSend(v28, "expirationDate");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = v37;
                v39 = 604800.0;
                if (v37)
                {
                  objc_msgSend(v37, "timeIntervalSinceNow", 604800.0);
                  if (v39 < 0.0)
                    v39 = 0.0;
                }
                if (p_super)
                {
                  LOBYTE(p_super[5].isa) |= 1u;
                  *(double *)&p_super[1].isa = v39;
                }
                objc_msgSend(v54, "addObject:", p_super, v39);
                v40 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                {
                  v41 = *(_QWORD *)(a1 + 32);
                  *(_DWORD *)buf = 138543618;
                  v73 = v41;
                  v74 = 2114;
                  v75 = (uint64_t)p_super;
                  _os_log_impl(&dword_1A03E3000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: getFinishDelegationRequestsWithStartDelegationResponse - Generated player delegate info - delegateInfoToken=%{public}@", buf, 0x16u);
                }

LABEL_35:
                v17 = a1;
              }
              else
              {
                p_super = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
                if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
                  goto LABEL_35;
                v17 = a1;
                v43 = *(_QWORD *)(a1 + 32);
                *(_DWORD *)buf = 138543618;
                v73 = v43;
                v74 = 2114;
                v75 = (uint64_t)v33;
                _os_log_impl(&dword_1A03E3000, p_super, OS_LOG_TYPE_ERROR, "%{public}@: getFinishDelegationRequestsWithStartDelegationResponse - Generating player delegate info data failed - error=%{public}@", buf, 0x16u);
              }

              v19 = 0x1E0CB3000;
              v18 = v55;
            }
            else
            {
              v32 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                v42 = *(_QWORD *)(v17 + 32);
                *(_DWORD *)buf = 138543618;
                v73 = v42;
                v74 = 2112;
                v75 = (uint64_t)v26;
                _os_log_impl(&dword_1A03E3000, v32, OS_LOG_TYPE_ERROR, "%{public}@: getFinishDelegationRequestsWithStartDelegationResponse - Missing token data for account: %@", buf, 0x16u);
              }
            }

          }
          ++v20;
        }
        while (v18 != v20);
        v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
        v18 = v44;
      }
      while (v44);
    }
    v45 = objc_alloc_init(ICPBDGSFinishDelegationRequest);
    v46 = v45;
    v47 = v54;
    if (v45)
      objc_storeStrong((id *)&v45->_playerDelegateInfoTokens, v54);
    v48 = *(NSObject **)(*(_QWORD *)(v17 + 32) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __129__ICDelegationProviderServiceProtocolHandler_getFinishDelegationRequestsWithStartDelegationResponse_streamContexts_replyHandler___block_invoke_13;
    block[3] = &unk_1E4390EF8;
    v49 = *(id *)(v17 + 64);
    block[4] = v46;
    v61 = v49;
    dispatch_async(v48, block);
    objc_msgSend(*(id *)(v17 + 40), "finishWithError:", 0);

    v6 = v53;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v50 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v73 = v50;
      v74 = 2112;
      v75 = (uint64_t)v6;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "%{public}@: getFinishDelegationRequestsWithStartDelegationResponse - Failed [no response] - error=%@", buf, 0x16u);
    }

    v51 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __129__ICDelegationProviderServiceProtocolHandler_getFinishDelegationRequestsWithStartDelegationResponse_streamContexts_replyHandler___block_invoke_8;
    v68[3] = &unk_1E4390EF8;
    v70 = *(id *)(a1 + 64);
    v52 = v6;
    v69 = v52;
    dispatch_async(v51, v68);
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v52);

    v47 = v70;
  }

}

uint64_t __129__ICDelegationProviderServiceProtocolHandler_getFinishDelegationRequestsWithStartDelegationResponse_streamContexts_replyHandler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32), 1);
}

uint64_t __129__ICDelegationProviderServiceProtocolHandler_getFinishDelegationRequestsWithStartDelegationResponse_streamContexts_replyHandler___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, 1);
}

@end
