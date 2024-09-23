@implementation ICUserCredentialProvider

void __105__ICUserCredentialProvider__handleIdentityProperties_forIdentity_loadingError_credentialRequest_session___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  ICUserCredentialResponse *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  ICUserCredentialResponse *v15;
  ICUserCredentialResponse *v16;
  ICUserCredentialResponse *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  ICUserCredentialResponse *v27;
  id v28;
  id v29;
  char v30;
  _QWORD block[4];
  id v32;
  ICUserCredentialResponse *v33;
  id v34;
  id v35;
  char v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "pendingPropertyLoadCredentialRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "delegationCredentialRequestToSpecificUserIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 48), "isDelegated") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "delegateToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && (objc_msgSend(v4, "isExpired") & 1) == 0 && objc_msgSend(v5, "type") == 1)
    {
      v6 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 56);
        v8 = *(_QWORD *)(a1 + 72);
        *(_DWORD *)buf = 138543874;
        v38 = v7;
        v39 = 2114;
        v40 = v8;
        v41 = 2114;
        v42 = v5;
        _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Using existing delegation token for identity %{public}@: %{public}@", buf, 0x20u);
      }

      v9 = objc_alloc_init(ICUserCredentialResponse);
      -[ICUserCredentialResponse setIdentityProperties:](v9, "setIdentityProperties:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 32), "activeICloudAccountProperties");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICUserCredentialResponse setICloudIdentityProperties:](v9, "setICloudIdentityProperties:", v10);

      objc_msgSend(*(id *)(a1 + 32), "pendingResponseCredentialRequests");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObject:", *(_QWORD *)(a1 + 40));

      v12 = objc_msgSend(*(id *)(a1 + 32), "hasPendingResponses") ^ 1;
      objc_msgSend(*(id *)(a1 + 32), "responseHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(NSObject **)(*(_QWORD *)(a1 + 56) + 16);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __105__ICUserCredentialProvider__handleIdentityProperties_forIdentity_loadingError_credentialRequest_session___block_invoke_20;
      v25[3] = &unk_1E43912F8;
      v29 = v13;
      v26 = *(id *)(a1 + 40);
      v27 = v9;
      v28 = *(id *)(a1 + 64);
      v30 = v12;
      v15 = v9;
      v16 = v13;
      dispatch_async(v14, v25);

    }
    else
    {
      v22 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = *(_QWORD *)(a1 + 56);
        v24 = *(_QWORD *)(a1 + 72);
        *(_DWORD *)buf = 138543618;
        v38 = v23;
        v39 = 2114;
        v40 = v24;
        _os_log_impl(&dword_1A03E3000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Fetching new delegation token for identity %{public}@", buf, 0x16u);
      }

      if (!v3)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setDelegationCredentialRequestToSpecificUserIdentity:", v3);
      }
      objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "delegationCredentialRequestToIdentityProperties");
      v16 = (ICUserCredentialResponse *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
        v16 = (ICUserCredentialResponse *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setDelegationCredentialRequestToIdentityProperties:", v16);
      }
      -[ICUserCredentialResponse setObject:forKey:](v16, "setObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    }
  }
  else
  {
    v17 = objc_alloc_init(ICUserCredentialResponse);
    -[ICUserCredentialResponse setIdentityProperties:](v17, "setIdentityProperties:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "activeICloudAccountProperties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICUserCredentialResponse setICloudIdentityProperties:](v17, "setICloudIdentityProperties:", v18);

    objc_msgSend(*(id *)(a1 + 32), "pendingResponseCredentialRequests");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObject:", *(_QWORD *)(a1 + 40));

    LOBYTE(v19) = objc_msgSend(*(id *)(a1 + 32), "hasPendingResponses") ^ 1;
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(NSObject **)(*(_QWORD *)(a1 + 56) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __105__ICUserCredentialProvider__handleIdentityProperties_forIdentity_loadingError_credentialRequest_session___block_invoke_2;
    block[3] = &unk_1E43912F8;
    v35 = v20;
    v32 = *(id *)(a1 + 40);
    v33 = v17;
    v34 = *(id *)(a1 + 64);
    v36 = (char)v19;
    v16 = v17;
    v5 = v20;
    dispatch_async(v21, block);

  }
  if (!objc_msgSend(v2, "count") && objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 56), "_handleDelegationAccountUUIDsForSession:", *(_QWORD *)(a1 + 32));

}

uint64_t __105__ICUserCredentialProvider__handleIdentityProperties_forIdentity_loadingError_credentialRequest_session___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
}

- (void)performCredentialRequests:(id)a3 withResponseHandler:(id)a4
{
  id v7;
  id v8;
  _ICUserCredentialProviderRequestSession *v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  ICUserCredentialProvider *v13;
  __int16 v14;
  _ICUserCredentialProviderRequestSession *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICUserCredentialProvider.m"), 272, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[credentialRequests count] > 0"));

  }
  v9 = -[_ICUserCredentialProviderRequestSession initWithCredentialRequests:responseHandler:]([_ICUserCredentialProviderRequestSession alloc], "initWithCredentialRequests:responseHandler:", v8, v7);

  v10 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Created new credentials provider session %{public}@", buf, 0x16u);
  }

  -[ICUserCredentialProvider _handleRequestIndependentPropertiesForSession:](self, "_handleRequestIndependentPropertiesForSession:", v9);
}

+ (ICUserCredentialProvider)sharedProvider
{
  if (sharedProvider_sOnceToken_35746 != -1)
    dispatch_once(&sharedProvider_sOnceToken_35746, &__block_literal_global_35747);
  return (ICUserCredentialProvider *)(id)sharedProvider_sSharedProvider_35748;
}

void __74__ICUserCredentialProvider__handleRequestIndependentPropertiesForSession___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "getPropertiesForActiveICloudAccountReturningError:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setActiveICloudAccountProperties:", v5);
  objc_msgSend(*(id *)(a1 + 48), "_handleCredentialRequestIdentityPropertiesForSession:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "finish");

}

- (void)_handleCredentialRequestIdentityPropertiesForSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __int128 v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  void *v19;
  __int128 v20;
  id obj;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  ICUserCredentialProvider *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "credentialRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v4, "setPendingPropertyLoadCredentialRequests:", v6);

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v5;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v22)
  {
    v8 = *(_QWORD *)v25;
    *(_QWORD *)&v7 = 138543874;
    v20 = v7;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v11 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v29 = self;
          v30 = 2114;
          v31 = v10;
          _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Loading identity properties for request %{public}@", buf, 0x16u);
        }

        objc_msgSend(v10, "identity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identityStore");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        objc_msgSend(v13, "getPropertiesForUserIdentity:error:", v12, &v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v23;

        if (v15)
        {
          v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v15, "msv_description");
            v17 = v8;
            v18 = v4;
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v20;
            v29 = self;
            v30 = 2114;
            v31 = v10;
            v32 = 2114;
            v33 = v19;
            _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load identity properties for request: %{public}@ error=%{public}@", buf, 0x20u);

            v4 = v18;
            v8 = v17;
          }

        }
        -[ICUserCredentialProvider _handleIdentityProperties:forIdentity:loadingError:credentialRequest:session:](self, "_handleIdentityProperties:forIdentity:loadingError:credentialRequest:session:", v14, v12, v15, v10, v4, v20);

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v22);
  }

}

- (void)_handleIdentityProperties:(id)a3 forIdentity:(id)a4 loadingError:(id)a5 credentialRequest:(id)a6 session:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *accessQueue;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD block[4];
  id v30;
  id v31;
  id v32;
  ICUserCredentialProvider *v33;
  id v34;
  id v35;
  id v36;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v12)
  {
    v17 = v12;
    objc_msgSend(v17, "DSID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      +[ICUserIdentity specificAccountWithDSID:](ICUserIdentity, "specificAccountWithDSID:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v17, "carrierBundleDeviceIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        +[ICUserIdentity carrierBundleWithDeviceIdentifier:](ICUserIdentity, "carrierBundleWithDeviceIdentifier:", v21);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = 0;
      }

    }
    objc_msgSend(v19, "identityAllowingDelegation:", objc_msgSend(v13, "allowsDelegation"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__ICUserCredentialProvider__handleIdentityProperties_forIdentity_loadingError_credentialRequest_session___block_invoke;
  block[3] = &unk_1E4391370;
  v30 = v16;
  v31 = v15;
  v32 = v12;
  v33 = self;
  v34 = v14;
  v35 = v13;
  v36 = v20;
  v23 = v20;
  v24 = v13;
  v25 = v14;
  v26 = v12;
  v27 = v15;
  v28 = v16;
  dispatch_barrier_async(accessQueue, block);

}

- (void)_handleRequestIndependentPropertiesForSession:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  ICAsyncBlockOperation *v8;
  id v9;
  id v10;
  ICAsyncBlockOperation *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  ICUserCredentialProvider *v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "maximumQualityOfService");
  objc_msgSend(MEMORY[0x1E0CB3828], "ic_sharedRequestOperationQueueWithQualityOfService:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identityStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [ICAsyncBlockOperation alloc];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__ICUserCredentialProvider__handleRequestIndependentPropertiesForSession___block_invoke;
  v12[3] = &unk_1E4391208;
  v13 = v7;
  v14 = v4;
  v15 = self;
  v9 = v4;
  v10 = v7;
  v11 = -[ICAsyncBlockOperation initWithStartHandler:](v8, "initWithStartHandler:", v12);
  objc_msgSend(v6, "addOperation:", v11);

}

void __42__ICUserCredentialProvider_sharedProvider__block_invoke()
{
  ICUserCredentialProvider *v0;
  void *v1;

  v0 = objc_alloc_init(ICUserCredentialProvider);
  v1 = (void *)sharedProvider_sSharedProvider_35748;
  sharedProvider_sSharedProvider_35748 = (uint64_t)v0;

}

- (ICUserCredentialProvider)init
{
  ICUserCredentialProvider *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *calloutQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICUserCredentialProvider;
  v2 = -[ICUserCredentialProvider init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iTunesCloud.ICUserCredentialProvider.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.iTunesCloud.ICUserCredentialProvider.calloutQueue", 0);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)performCredentialRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13[0] = a3;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__ICUserCredentialProvider_performCredentialRequest_withResponseHandler___block_invoke;
  v11[3] = &unk_1E43911E0;
  v12 = v6;
  v10 = v6;
  -[ICUserCredentialProvider performCredentialRequests:withResponseHandler:](self, "performCredentialRequests:withResponseHandler:", v9, v11);

}

- (void)_handleDelegationAccountUUIDsForSession:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  ICAsyncBlockOperation *v16;
  ICAsyncBlockOperation *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  dispatch_qos_class_t qos_class;
  void *v24;
  id obj;
  void *v26;
  _QWORD block[4];
  id v29;
  ICUserCredentialProvider *v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  ICUserCredentialProvider *v36;
  id v37;
  NSObject *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  ICUserCredentialProvider *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v45 = self;
    v46 = 2114;
    v47 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Fetching delegation UUIDs for session %{public}@", buf, 0x16u);
  }

  v5 = objc_msgSend(v3, "maximumQualityOfService");
  v6 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  qos_class = v5;
  objc_msgSend(v6, "setQualityOfService:", v5);
  objc_msgSend(v6, "setMaxConcurrentOperationCount:", 3);
  objc_msgSend(v6, "setName:", CFSTR("com.apple.iTunesCloud.ICUserCredentialProvider.delegationAccountUUIDOperationQueue"));
  v7 = dispatch_group_create();
  objc_msgSend(v3, "identityStore");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v24 = v3;
  objc_msgSend(v3, "delegationCredentialRequestToSpecificUserIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectEnumerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v10;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v40 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        dispatch_group_enter(v7);
        v16 = [ICAsyncBlockOperation alloc];
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __68__ICUserCredentialProvider__handleDelegationAccountUUIDsForSession___block_invoke;
        v33[3] = &unk_1E4391280;
        v34 = v26;
        v35 = v15;
        v36 = self;
        v37 = v8;
        v38 = v7;
        v17 = -[ICAsyncBlockOperation initWithStartHandler:](v16, "initWithStartHandler:", v33);
        objc_msgSend(v6, "addOperation:", v17);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v12);
  }

  dispatch_queue_attr_make_with_qos_class(0, qos_class, 0);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = dispatch_queue_create("com.apple.iTunesCloud.ICUserCredentialProvider.delegationAccountUUIDSerialQueue", v18);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__ICUserCredentialProvider__handleDelegationAccountUUIDsForSession___block_invoke_4;
  block[3] = &unk_1E43912A8;
  v29 = v6;
  v30 = self;
  v31 = v3;
  v32 = v8;
  v20 = v8;
  v21 = v24;
  v22 = v6;
  dispatch_group_notify(v7, v19, block);

}

- (void)_handlePendingDelegationRequestsForSession:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  ICStoreRequestContext *v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  void *v16;
  ICStoreRequestContext *v17;
  void *v18;
  double v19;
  ICDelegationConsumerServiceRequest *v20;
  void *v21;
  void *v22;
  ICDelegationConsumerServiceRequest *v23;
  ICDelegationConsumerService *delegationConsumerService;
  ICDelegationConsumerService *v25;
  ICDelegationConsumerService *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  ICUserCredentialProvider *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v42 = self;
    v43 = 2114;
    v44 = v4;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling pending delegation requests for session %{public}@", buf, 0x16u);
  }

  objc_msgSend(v4, "delegationCredentialRequestToIdentityProperties");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v4;
  objc_msgSend(v4, "delegationCredentialRequestToSpecificUserIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v37;
    v13 = 30.0;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v37 != v12)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v7, "addObject:", v16);
        if (!v11)
        {
          v17 = [ICStoreRequestContext alloc];
          objc_msgSend(v15, "clientInfo");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[ICRequestContext initWithClientInfo:](v17, "initWithClientInfo:", v18);

        }
        objc_msgSend(v15, "timeoutInterval");
        if (v13 >= v19)
          v13 = v19;

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
    v13 = 30.0;
  }

  v20 = [ICDelegationConsumerServiceRequest alloc];
  objc_msgSend(v31, "delegationUserIdentityToUUIDs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  v23 = -[ICDelegationConsumerServiceRequest initWithUserIdentityDelegationAccountUUIDs:requestContext:timeoutInterval:](v20, "initWithUserIdentityDelegationAccountUUIDs:requestContext:timeoutInterval:", v22, v11, v13);

  delegationConsumerService = self->_delegationConsumerService;
  if (!delegationConsumerService)
  {
    v25 = objc_alloc_init(ICDelegationConsumerService);
    v26 = self->_delegationConsumerService;
    self->_delegationConsumerService = v25;

    delegationConsumerService = self->_delegationConsumerService;
  }
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __71__ICUserCredentialProvider__handlePendingDelegationRequestsForSession___block_invoke;
  v32[3] = &unk_1E4391348;
  v32[4] = self;
  v33 = v31;
  v34 = v8;
  v35 = v30;
  v27 = v30;
  v28 = v8;
  v29 = v31;
  -[ICDelegationConsumerService performRequest:withResponseHandler:](delegationConsumerService, "performRequest:withResponseHandler:", v23, v32);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegationConsumerService, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

uint64_t __105__ICUserCredentialProvider__handleIdentityProperties_forIdentity_loadingError_credentialRequest_session___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
}

void __71__ICUserCredentialProvider__handlePendingDelegationRequestsForSession___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, int a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  char v32;
  _QWORD block[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  id v41;
  char v42;
  char v43;
  _QWORD v44[4];
  id v45;
  id v46;
  char v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  id v51;
  __int16 v52;
  int v53;
  __int16 v54;
  id v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v14, "msv_description");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v49 = v17;
      v50 = 2114;
      v51 = v11;
      v52 = 1024;
      v53 = a6;
      v54 = 2114;
      v55 = v12;
      v56 = 2114;
      v57 = v18;
      _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Finished delegation request for identity: %{public}@. isLastResponse=%{BOOL}u. delegateToken=%{public}@ error=%{public}@", buf, 0x30u);

    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138544130;
    v49 = v19;
    v50 = 2114;
    v51 = v11;
    v52 = 1024;
    v53 = a6;
    v54 = 2114;
    v55 = v12;
    _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished delegation request for identity: %{public}@. isLastResponse=%{BOOL}u. delegateToken=%{public}@", buf, 0x26u);
  }
  v32 = a6;

  v20 = MEMORY[0x1E0C809B0];
  if (v12 && objc_msgSend(v12, "type") == 1)
  {
    v21 = 1;
LABEL_10:
    objc_msgSend(*(id *)(a1 + 40), "identityStore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v20;
    v44[1] = 3221225472;
    v44[2] = __71__ICUserCredentialProvider__handlePendingDelegationRequestsForSession___block_invoke_16;
    v44[3] = &unk_1E43912D0;
    v47 = v21;
    v45 = v12;
    v46 = v13;
    objc_msgSend(v23, "updatePropertiesForUserIdentity:usingBlock:", v11, v44);

    v22 = v21;
    goto LABEL_11;
  }
  v21 = 0;
  v22 = 0;
  if (objc_msgSend(v13, "length"))
    goto LABEL_10;
LABEL_11:
  v24 = *(void **)(a1 + 40);
  v25 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = v20;
  block[1] = 3221225472;
  block[2] = __71__ICUserCredentialProvider__handlePendingDelegationRequestsForSession___block_invoke_2;
  block[3] = &unk_1E4391320;
  v34 = v24;
  v35 = *(id *)(a1 + 48);
  v36 = v11;
  v42 = v32;
  v26 = *(id *)(a1 + 56);
  v43 = v22;
  v37 = v26;
  v38 = v12;
  v27 = *(_QWORD *)(a1 + 32);
  v39 = v13;
  v40 = v27;
  v41 = v14;
  v28 = v14;
  v29 = v13;
  v30 = v12;
  v31 = v11;
  dispatch_barrier_async(v25, block);

}

void __71__ICUserCredentialProvider__handlePendingDelegationRequestsForSession___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(v3, "setDelegateToken:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(*(id *)(a1 + 40), "length"))
    objc_msgSend(v3, "setStorefrontIdentifier:", *(_QWORD *)(a1 + 40));

}

void __71__ICUserCredentialProvider__handlePendingDelegationRequestsForSession___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  ICUserCredentialResponse *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  NSObject *v17;
  ICUserCredentialResponse *v18;
  id v19;
  id obj;
  void *v21;
  uint64_t v22;
  _QWORD block[5];
  ICUserCredentialResponse *v24;
  id v25;
  id v26;
  char v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "pendingResponseCredentialRequests");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  obj = (id)objc_msgSend(v21, "copy");
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v2)
  {
    v3 = v2;
    v22 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v5, "identityStore");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v6, "isEqualToIdentity:inStore:", v7, v8) & 1) != 0)
        {

        }
        else
        {
          v9 = *(unsigned __int8 *)(a1 + 96);

          if (!v9)
            goto LABEL_14;
        }
        v10 = objc_alloc_init(ICUserCredentialResponse);
        objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "mutableCopy");

        if (*(_BYTE *)(a1 + 97))
          objc_msgSend(v12, "setDelegateToken:", *(_QWORD *)(a1 + 64));
        if (*(_QWORD *)(a1 + 72))
          objc_msgSend(v12, "setStorefrontIdentifier:");
        -[ICUserCredentialResponse setIdentityProperties:](v10, "setIdentityProperties:", v12);
        objc_msgSend(*(id *)(a1 + 32), "activeICloudAccountProperties");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICUserCredentialResponse setICloudIdentityProperties:](v10, "setICloudIdentityProperties:", v13);

        objc_msgSend(v21, "removeObject:", v5);
        v14 = objc_msgSend(*(id *)(a1 + 32), "hasPendingResponses") ^ 1;
        objc_msgSend(*(id *)(a1 + 32), "responseHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(void **)(a1 + 88);
        v17 = *(NSObject **)(*(_QWORD *)(a1 + 80) + 16);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __71__ICUserCredentialProvider__handlePendingDelegationRequestsForSession___block_invoke_3;
        block[3] = &unk_1E43912F8;
        v26 = v15;
        block[4] = v5;
        v24 = v10;
        v25 = v16;
        v27 = v14;
        v18 = v10;
        v19 = v15;
        dispatch_async(v17, block);

LABEL_14:
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v3);
  }

}

uint64_t __71__ICUserCredentialProvider__handlePendingDelegationRequestsForSession___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
}

void __68__ICUserCredentialProvider__handleDelegationAccountUUIDsForSession___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v3 = a2;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __68__ICUserCredentialProvider__handleDelegationAccountUUIDsForSession___block_invoke_2;
  v10[3] = &unk_1E4391258;
  v4 = *(void **)(a1 + 56);
  v10[4] = *(_QWORD *)(a1 + 48);
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v10[1] = 3221225472;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 40);
  v11 = v7;
  v12 = v8;
  v13 = *(id *)(a1 + 64);
  v14 = v3;
  v9 = v3;
  objc_msgSend(v5, "getDelegationUUIDsForUserIdentity:completionHandler:", v6, v10);

}

void __68__ICUserCredentialProvider__handleDelegationAccountUUIDsForSession___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__ICUserCredentialProvider__handleDelegationAccountUUIDsForSession___block_invoke_5;
  block[3] = &unk_1E4391230;
  block[4] = v2;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v5 = v3;
  dispatch_barrier_async(v4, block);

}

uint64_t __68__ICUserCredentialProvider__handleDelegationAccountUUIDsForSession___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v7 = 138543874;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished loading delegation UUIDs for session %{public}@: %{public}@", (uint8_t *)&v7, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 40), "setDelegationUserIdentityToUUIDs:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_handlePendingDelegationRequestsForSession:", *(_QWORD *)(a1 + 40));
}

void __68__ICUserCredentialProvider__handleDelegationAccountUUIDsForSession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v7 = *(void **)(a1 + 40);
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__ICUserCredentialProvider__handleDelegationAccountUUIDsForSession___block_invoke_3;
    block[3] = &unk_1E4391230;
    v12 = v7;
    v9 = v5;
    v10 = *(_QWORD *)(a1 + 48);
    v13 = v9;
    v14 = v10;
    dispatch_barrier_async(v8, block);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 64), "finishWithError:", v6);

}

uint64_t __68__ICUserCredentialProvider__handleDelegationAccountUUIDsForSession___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __73__ICUserCredentialProvider_performCredentialRequest_withResponseHandler___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if (a5)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

@end
