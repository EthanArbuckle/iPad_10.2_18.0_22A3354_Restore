@implementation ICDelegationProviderServiceSession

- (ICDelegationProviderServiceSession)initWithUserIdentities:(id)a3 userIdentityStore:(id)a4 requestContext:(id)a5 netService:(id)a6 delegationAccountUUIDs:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  ICDelegationProviderServiceSession *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v20;
  OS_dispatch_queue *calloutQueue;
  uint64_t v22;
  NSArray *userIdentities;
  uint64_t v24;
  NSArray *delegationAccountUUIDs;
  ICDelegationProviderServiceProtocolHandler *v26;
  ICDelegationProviderServiceProtocolHandler *protocolHandler;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)ICDelegationProviderServiceSession;
  v17 = -[ICDelegationProviderServiceSession init](&v29, sel_init);
  if (v17)
  {
    v18 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationProviderServiceSession.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v17->_accessQueue;
    v17->_accessQueue = (OS_dispatch_queue *)v18;

    v20 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationProviderServiceSession.calloutQueue", 0);
    calloutQueue = v17->_calloutQueue;
    v17->_calloutQueue = (OS_dispatch_queue *)v20;

    v22 = objc_msgSend(v12, "copy");
    userIdentities = v17->_userIdentities;
    v17->_userIdentities = (NSArray *)v22;

    objc_storeStrong((id *)&v17->_userIdentityStore, a4);
    objc_storeStrong((id *)&v17->_netService, a6);
    v24 = objc_msgSend(v16, "copy");
    delegationAccountUUIDs = v17->_delegationAccountUUIDs;
    v17->_delegationAccountUUIDs = (NSArray *)v24;

    objc_storeStrong((id *)&v17->_requestContext, a5);
    v26 = -[ICDelegationProviderServiceProtocolHandler initWithUserIdentityStore:requestContext:]([ICDelegationProviderServiceProtocolHandler alloc], "initWithUserIdentityStore:requestContext:", v13, v14);
    protocolHandler = v17->_protocolHandler;
    v17->_protocolHandler = v26;

  }
  return v17;
}

- (void)delegationServiceConnectionDidClose:(id)a3
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__ICDelegationProviderServiceSession_delegationServiceConnectionDidClose___block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

- (void)delegationServiceConnection:(id)a3 didEncouterError:(id)a4
{
  id v5;
  NSObject *accessQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__ICDelegationProviderServiceSession_delegationServiceConnection_didEncouterError___block_invoke;
  v8[3] = &unk_1E4391110;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_barrier_async(accessQueue, v8);

}

- (ICDelegationProviderServiceSessionDelegate)delegate
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__26630;
  v10 = __Block_byref_object_dispose__26631;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__ICDelegationProviderServiceSession_delegate__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ICDelegationProviderServiceSessionDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__ICDelegationProviderServiceSession_setDelegate___block_invoke;
  v7[3] = &unk_1E4391110;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

- (void)start
{
  NSObject *v3;
  NSObject *accessQueue;
  _QWORD block[5];
  uint8_t buf[4];
  ICDelegationProviderServiceSession *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting session...", buf, 0xCu);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__ICDelegationProviderServiceSession_start__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

- (void)stop
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__ICDelegationProviderServiceSession_stop__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

- (void)_handleStartDelegationResponse:(id)a3
{
  id *v4;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  ICDelegationProviderServiceProtocolHandler *protocolHandler;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[5];
  _QWORD v15[4];
  NSObject *v16;
  ICDelegationProviderServiceSession *v17;
  uint8_t buf[4];
  ICDelegationProviderServiceSession *v19;
  __int16 v20;
  id *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v19 = self;
    v20 = 2114;
    v21 = v4;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Received response: %{public}@", buf, 0x16u);
  }

  if (v4 && (v6 = v4[3]) != 0)
  {
    v7 = v6;
    v8 = dispatch_group_create();
    dispatch_group_enter(v8);
    protocolHandler = self->_protocolHandler;
    v10 = (void *)-[NSMutableDictionary copy](self->_sessionIDToStreamContext, "copy");
    v11 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __69__ICDelegationProviderServiceSession__handleStartDelegationResponse___block_invoke;
    v15[3] = &unk_1E438E790;
    v16 = v8;
    v17 = self;
    v12 = v8;
    -[ICDelegationProviderServiceProtocolHandler getFinishDelegationRequestsWithStartDelegationResponse:streamContexts:replyHandler:](protocolHandler, "getFinishDelegationRequestsWithStartDelegationResponse:streamContexts:replyHandler:", v7, v10, v15);

    dispatch_get_global_queue(0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __69__ICDelegationProviderServiceSession__handleStartDelegationResponse___block_invoke_3;
    block[3] = &unk_1E43913D8;
    block[4] = self;
    dispatch_group_notify(v12, v13, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    -[ICDelegationProviderServiceSession _finishWithError:](self, "_finishWithError:", v12);
    v7 = 0;
  }

}

- (void)_finishWithError:(id)a3
{
  id v4;
  ICDelegationProviderServiceSessionDelegate *v5;
  NSObject *calloutQueue;
  id v7;
  ICDelegationProviderServiceSessionDelegate *v8;
  _QWORD block[4];
  ICDelegationProviderServiceSessionDelegate *v10;
  ICDelegationProviderServiceSession *v11;
  id v12;

  v4 = a3;
  -[ICDelegationServiceConnection setDelegate:](self->_connection, "setDelegate:", 0);
  -[ICDelegationServiceConnection close](self->_connection, "close");
  self->_state = 4;
  v5 = self->_delegate;
  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__ICDelegationProviderServiceSession__finishWithError___block_invoke;
  block[3] = &unk_1E4391230;
  v10 = v5;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(calloutQueue, block);

}

- (void)_startDelegation
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  ICDelegationProviderServiceProtocolHandler *protocolHandler;
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_userIdentities;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "DSID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 && (objc_msgSend(v3, "containsObject:", v9) & 1) == 0)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  protocolHandler = self->_protocolHandler;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__ICDelegationProviderServiceSession__startDelegation__block_invoke;
  v11[3] = &unk_1E438E7B8;
  v11[4] = self;
  -[ICDelegationProviderServiceProtocolHandler getStartDelegationRequestForAccountIDs:withCompletionHandler:](protocolHandler, "getStartDelegationRequestForAccountIDs:withCompletionHandler:", v3, v11);

}

- (NSArray)delegationAccountUUIDs
{
  return self->_delegationAccountUUIDs;
}

- (ICDelegationProviderNetService)netService
{
  return self->_netService;
}

- (ICRequestContext)requestContext
{
  return self->_requestContext;
}

- (NSArray)userIdentities
{
  return self->_userIdentities;
}

- (ICUserIdentityStore)userIdentityStore
{
  return self->_userIdentityStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityStore, 0);
  objc_storeStrong((id *)&self->_userIdentities, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_netService, 0);
  objc_storeStrong((id *)&self->_delegationAccountUUIDs, 0);
  objc_storeStrong((id *)&self->_sessionIDToStreamContext, 0);
  objc_storeStrong((id *)&self->_protocolHandler, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __54__ICDelegationProviderServiceSession__startDelegation__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 8);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__ICDelegationProviderServiceSession__startDelegation__block_invoke_2;
  v15[3] = &unk_1E43912A8;
  v15[4] = v10;
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v7;
  dispatch_barrier_async(v11, v15);

}

void __54__ICDelegationProviderServiceSession__startDelegation__block_invoke_2(uint64_t a1)
{
  _QWORD *v1;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  ICPBDGSRequest *v7;
  ICPBDGSRequest *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[5];

  v1 = *(_QWORD **)(a1 + 32);
  if (v1[7] == 3)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      if (objc_msgSend(*(id *)(a1 + 48), "count"))
      {
        v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
        if (!v3)
        {
          v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v5 = *(_QWORD *)(a1 + 32);
          v6 = *(void **)(v5 + 48);
          *(_QWORD *)(v5 + 48) = v4;

          v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
        }
        objc_msgSend(v3, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 48));
      }
      v7 = objc_alloc_init(ICPBDGSRequest);
      v8 = v7;
      if (v7)
        objc_storeStrong((id *)&v7->_startDelegationRequest, *(id *)(a1 + 40));
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 24);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __54__ICDelegationProviderServiceSession__startDelegation__block_invoke_3;
      v12[3] = &unk_1E438E768;
      v12[4] = v9;
      objc_msgSend(v10, "sendRequest:withResponseHandler:", v8, v12);

    }
    else if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 32), "_finishWithError:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7101, 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "_finishWithError:", v11);

    }
  }
}

void __54__ICDelegationProviderServiceSession__startDelegation__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__ICDelegationProviderServiceSession__startDelegation__block_invoke_4;
  v7[3] = &unk_1E4391110;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_barrier_async(v5, v7);

}

_QWORD *__54__ICDelegationProviderServiceSession__startDelegation__block_invoke_4(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[7] == 3)
    return (_QWORD *)objc_msgSend(result, "_handleStartDelegationResponse:", *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __55__ICDelegationProviderServiceSession__finishWithError___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "delegationProviderServiceSession:didFinishWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

void __69__ICDelegationProviderServiceSession__handleStartDelegationResponse___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v8;
  id v9;
  ICPBDGSRequest *v10;
  ICPBDGSRequest *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a2;
  v9 = a3;
  if (v8)
  {
    v10 = objc_alloc_init(ICPBDGSRequest);
    v11 = v10;
    if (v10)
      objc_storeStrong((id *)&v10->_finishDelegationRequest, a2);
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v12 = *(void **)(a1 + 32);
    v13 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__ICDelegationProviderServiceSession__handleStartDelegationResponse___block_invoke_2;
    v14[3] = &unk_1E438E768;
    v15 = v12;
    objc_msgSend(v13, "sendRequest:withResponseHandler:", v11, v14);

  }
  if (a4)
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __69__ICDelegationProviderServiceSession__handleStartDelegationResponse___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__ICDelegationProviderServiceSession__handleStartDelegationResponse___block_invoke_4;
  block[3] = &unk_1E43913D8;
  block[4] = v1;
  dispatch_barrier_async(v2, block);
}

uint64_t __69__ICDelegationProviderServiceSession__handleStartDelegationResponse___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", 0);
}

void __69__ICDelegationProviderServiceSession__handleStartDelegationResponse___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __42__ICDelegationProviderServiceSession_stop__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 56) = 4;
  return result;
}

uint64_t __43__ICDelegationProviderServiceSession_start__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (!*(_QWORD *)(v1 + 56))
  {
    v2 = result;
    *(_QWORD *)(v1 + 56) = 1;
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(v2 + 32);
      *(_DWORD *)buf = 138543362;
      v9 = v4;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Resolving streams...", buf, 0xCu);
    }

    v5 = *(_QWORD *)(v2 + 32);
    v6 = *(void **)(v5 + 72);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43__ICDelegationProviderServiceSession_start__block_invoke_3;
    v7[3] = &unk_1E438E740;
    v7[4] = v5;
    return objc_msgSend(v6, "getResolvedStreamsWithCompletionHandler:", v7);
  }
  return result;
}

void __43__ICDelegationProviderServiceSession_start__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 8);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __43__ICDelegationProviderServiceSession_start__block_invoke_2;
  v15[3] = &unk_1E43912A8;
  v15[4] = v10;
  v16 = v9;
  v17 = v7;
  v18 = v8;
  v12 = v8;
  v13 = v7;
  v14 = v9;
  dispatch_barrier_async(v11, v15);

}

void __43__ICDelegationProviderServiceSession_start__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) == 1)
  {
    v2 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v15 = v3;
      v16 = 2114;
      v17 = v4;
      _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished resolving streams with error: %{public}@", buf, 0x16u);
    }

    if (*(_QWORD *)(a1 + 48) && *(_QWORD *)(a1 + 56))
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 2;
      v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "securityMode");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "deviceName");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (v6)
        v8 = (const __CFString *)v6;
      else
        v8 = &stru_1E4391778;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __43__ICDelegationProviderServiceSession_start__block_invoke_6;
      v11[3] = &unk_1E438F0A0;
      v11[4] = *(_QWORD *)(a1 + 32);
      v12 = *(id *)(a1 + 48);
      v13 = *(id *)(a1 + 56);
      +[ICDelegationServiceSecuritySettings getDeviceSenderSettingsForReceiverName:securityMode:completion:](ICDelegationServiceSecuritySettings, "getDeviceSenderSettingsForReceiverName:securityMode:completion:", v8, v5, v11);

    }
    else
    {
      v9 = *(void **)(a1 + 32);
      if (*(_QWORD *)(a1 + 40))
      {
        objc_msgSend(*(id *)(a1 + 32), "_finishWithError:");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7801, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_finishWithError:", v10);

      }
    }
  }
}

void __43__ICDelegationProviderServiceSession_start__block_invoke_6(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  ICDelegationServiceConnection *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = -[ICDelegationServiceConnection initWithConnectionRole:inputStream:outputStream:securitySettings:]([ICDelegationServiceConnection alloc], "initWithConnectionRole:inputStream:outputStream:securitySettings:", 1, a1[5], a1[6], v5);
    v8 = a1[4];
    v9 = *(void **)(v8 + 24);
    *(_QWORD *)(v8 + 24) = v7;

    objc_msgSend(*(id *)(a1[4] + 24), "setDelegate:");
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = a1[4];
      *(_DWORD *)buf = 138543362;
      v20 = v11;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Opening connection...", buf, 0xCu);
    }

    v12 = a1[4];
    v13 = *(void **)(v12 + 24);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __43__ICDelegationProviderServiceSession_start__block_invoke_8;
    v18[3] = &unk_1E438E718;
    v18[4] = v12;
    objc_msgSend(v13, "openWithCompletionHandler:", v18);
  }
  else
  {
    v14 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = a1[4];
      *(_DWORD *)buf = 138543618;
      v20 = v15;
      v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to get device sender security settings with error: %{public}@", buf, 0x16u);
    }

    v16 = (void *)a1[4];
    if (v6)
    {
      objc_msgSend(v16, "_finishWithError:", v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7807, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_finishWithError:", v17);

    }
  }

}

void __43__ICDelegationProviderServiceSession_start__block_invoke_8(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  char v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = CFSTR("NO");
    *(_DWORD *)buf = 138543874;
    if (a2)
      v8 = CFSTR("YES");
    v16 = v7;
    v17 = 2114;
    v18 = v8;
    v19 = 2114;
    v20 = v5;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished opening connection with success: %{public}@ error: %{public}@", buf, 0x20u);
  }

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(NSObject **)(v9 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__ICDelegationProviderServiceSession_start__block_invoke_13;
  block[3] = &unk_1E438E9A0;
  v14 = a2;
  block[4] = v9;
  v13 = v5;
  v11 = v5;
  dispatch_barrier_async(v10, block);

}

void __43__ICDelegationProviderServiceSession_start__block_invoke_13(uint64_t a1)
{
  _QWORD *v1;
  id v2;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1[7] == 2)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      v1[7] = 3;
      objc_msgSend(*(id *)(a1 + 32), "_startDelegation");
    }
    else if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "_finishWithError:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7802, 0);
      v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "_finishWithError:", v2);

    }
  }
}

void __50__ICDelegationProviderServiceSession_setDelegate___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

void __46__ICDelegationProviderServiceSession_delegate__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

_QWORD *__83__ICDelegationProviderServiceSession_delegationServiceConnection_didEncouterError___block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[7] == 3)
    return (_QWORD *)objc_msgSend(result, "_finishWithError:", *(_QWORD *)(a1 + 40));
  return result;
}

_QWORD *__74__ICDelegationProviderServiceSession_delegationServiceConnectionDidClose___block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[7] == 3)
    return (_QWORD *)objc_msgSend(result, "_finishWithError:", 0);
  return result;
}

@end
