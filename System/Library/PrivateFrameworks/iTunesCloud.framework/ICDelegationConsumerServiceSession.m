@implementation ICDelegationConsumerServiceSession

- (ICDelegationConsumerServiceSession)initWithRequest:(id)a3 responseHandler:(id)a4
{
  id v7;
  id v8;
  ICDelegationConsumerServiceSession *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v12;
  OS_dispatch_queue *calloutQueue;
  void *v14;
  void *v15;
  uint64_t v16;
  NSMutableArray *pendingUserIdentities;
  uint64_t v18;
  id responseHandler;
  ICDelegationConsumerServiceProtocolHandler *v20;
  ICDelegationConsumerServiceProtocolHandler *protocolHandler;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)ICDelegationConsumerServiceSession;
  v9 = -[ICDelegationConsumerServiceSession init](&v23, sel_init);
  if (v9)
  {
    v10 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationConsumerServiceSession.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v9->_accessQueue;
    v9->_accessQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationConsumerServiceSession.calloutQueue", 0);
    calloutQueue = v9->_calloutQueue;
    v9->_calloutQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v9->_request, a3);
    -[ICDelegationConsumerServiceRequest userIdentityDelegationAccountUUIDs](v9->_request, "userIdentityDelegationAccountUUIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "mutableCopy");
    pendingUserIdentities = v9->_pendingUserIdentities;
    v9->_pendingUserIdentities = (NSMutableArray *)v16;

    v18 = MEMORY[0x1A1AFA8D0](v8);
    responseHandler = v9->_responseHandler;
    v9->_responseHandler = (id)v18;

    v20 = objc_alloc_init(ICDelegationConsumerServiceProtocolHandler);
    protocolHandler = v9->_protocolHandler;
    v9->_protocolHandler = v20;

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[ICDelegationConsumerServiceSession _stop](self, "_stop");
  v3.receiver = self;
  v3.super_class = (Class)ICDelegationConsumerServiceSession;
  -[ICDelegationConsumerServiceSession dealloc](&v3, sel_dealloc);
}

- (void)delegationConsumerNetService:(id)a3 didAcceptConnectionWithInputStream:(id)a4 outputStream:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  ICDelegationConsumerServiceSession *v14;

  v7 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __115__ICDelegationConsumerServiceSession_delegationConsumerNetService_didAcceptConnectionWithInputStream_outputStream___block_invoke;
  v11[3] = &unk_1E438F0A0;
  v12 = v7;
  v13 = v8;
  v14 = self;
  v9 = v8;
  v10 = v7;
  +[ICDelegationServiceSecuritySettings getDeviceReceiverSettingsWithCompletion:](ICDelegationServiceSecuritySettings, "getDeviceReceiverSettingsWithCompletion:", v11);

}

- (void)delegationServiceConnectionDidClose:(id)a3
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
  v7[2] = __74__ICDelegationConsumerServiceSession_delegationServiceConnectionDidClose___block_invoke;
  v7[3] = &unk_1E4391110;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

- (void)delegationServiceConnection:(id)a3 didEncouterError:(id)a4
{
  id v5;
  NSObject *accessQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__ICDelegationConsumerServiceSession_delegationServiceConnection_didEncouterError___block_invoke;
  v8[3] = &unk_1E4391110;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_barrier_async(accessQueue, v8);

}

- (BOOL)delegationServiceConnection:(id)a3 didReceiveRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  ICDelegationConsumerServiceProtocolHandler *protocolHandler;
  void *v12;
  BOOL v13;
  id v14;
  NSObject *accessQueue;
  uint64_t v16;
  ICDelegationConsumerServiceProtocolHandler *v17;
  uint64_t v18;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD block[6];
  _QWORD v24[5];
  id v25;
  id v26;
  id location;
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping", (uint8_t *)&buf, 0xCu);
  }

  if (v7)
    v9 = (void *)*((_QWORD *)v7 + 2);
  else
    v9 = 0;
  v10 = v9;
  objc_initWeak(&location, v6);
  if (v10)
  {
    protocolHandler = self->_protocolHandler;
    -[ICDelegationConsumerServiceRequest requestContext](self->_request, "requestContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke;
    v24[3] = &unk_1E438F0C8;
    v24[4] = self;
    objc_copyWeak(&v26, &location);
    v25 = v7;
    -[ICDelegationConsumerServiceProtocolHandler getResponseForStartDelegationRequest:requestContext:withCompletionHandler:](protocolHandler, "getResponseForStartDelegationRequest:requestContext:withCompletionHandler:", v10, v12, v24);

    objc_destroyWeak(&v26);
    v13 = 1;
  }
  else
  {
    if (v7)
    {
      v14 = *((id *)v7 + 1);
      if (v14)
      {
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v29 = 0x3032000000;
        v30 = __Block_byref_object_copy__28868;
        v31 = __Block_byref_object_dispose__28869;
        v32 = 0;
        accessQueue = self->_accessQueue;
        v16 = MEMORY[0x1E0C809B0];
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke_13;
        block[3] = &unk_1E4391568;
        block[4] = self;
        block[5] = &buf;
        dispatch_sync(accessQueue, block);
        v17 = self->_protocolHandler;
        if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
          v18 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        else
          v18 = MEMORY[0x1E0C9AA70];
        v20[0] = v16;
        v20[1] = 3221225472;
        v20[2] = __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke_2_14;
        v20[3] = &unk_1E438F118;
        v20[4] = self;
        objc_copyWeak(&v22, &location);
        v21 = v7;
        -[ICDelegationConsumerServiceProtocolHandler getResponseForFinishDelegationRequest:withSessionIDToRequestInfoMap:completionHandler:](v17, "getResponseForFinishDelegationRequest:withSessionIDToRequestInfoMap:completionHandler:", v14, v18, v20);

        objc_destroyWeak(&v22);
        _Block_object_dispose(&buf, 8);

        v13 = 1;
      }
      else
      {
        v13 = 0;
      }
    }
    else
    {
      v13 = 0;
      v14 = 0;
    }

  }
  objc_destroyWeak(&location);

  return v13;
}

- (void)start
{
  NSObject *v3;
  NSObject *accessQueue;
  _QWORD block[5];
  uint8_t buf[4];
  ICDelegationConsumerServiceSession *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting session", buf, 0xCu);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__ICDelegationConsumerServiceSession_start__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

- (void)stop
{
  NSObject *v3;
  NSObject *accessQueue;
  _QWORD block[5];
  uint8_t buf[4];
  ICDelegationConsumerServiceSession *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping", buf, 0xCu);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__ICDelegationConsumerServiceSession_stop__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

- (void)_handleTimeout
{
  void *v3;
  NSMutableArray *pendingUserIdentities;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  ICDelegationConsumerServiceSession *v10;
  id v11;

  -[ICDelegationConsumerServiceSession _stop](self, "_stop");
  v3 = (void *)-[NSMutableArray copy](self->_pendingUserIdentities, "copy");
  pendingUserIdentities = self->_pendingUserIdentities;
  self->_pendingUserIdentities = 0;

  v5 = (void *)MEMORY[0x1A1AFA8D0](self->_responseHandler);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__ICDelegationConsumerServiceSession__handleTimeout__block_invoke;
  v8[3] = &unk_1E438F140;
  v9 = v3;
  v10 = self;
  v11 = v5;
  v6 = v5;
  v7 = v3;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

- (void)_stop
{
  NSObject *timeoutDispatchSource;
  OS_dispatch_source *v4;
  void *v5;
  NSMutableArray *acceptedConnections;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  timeoutDispatchSource = self->_timeoutDispatchSource;
  if (timeoutDispatchSource)
  {
    dispatch_source_cancel(timeoutDispatchSource);
    v4 = self->_timeoutDispatchSource;
    self->_timeoutDispatchSource = 0;

  }
  -[ICDelegationConsumerNetService stop](self->_netService, "stop");
  v5 = (void *)-[NSMutableArray copy](self->_acceptedConnections, "copy");
  acceptedConnections = self->_acceptedConnections;
  self->_acceptedConnections = 0;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v12, "setDelegate:", 0, (_QWORD)v13);
        objc_msgSend(v12, "close");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (ICDelegationConsumerServiceRequest)request
{
  return self->_request;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_timeoutDispatchSource, 0);
  objc_storeStrong((id *)&self->_sessionIDToRequestInfoMap, 0);
  objc_storeStrong((id *)&self->_protocolHandler, 0);
  objc_storeStrong((id *)&self->_pendingUserIdentities, 0);
  objc_storeStrong((id *)&self->_netService, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_acceptedConnections, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __52__ICDelegationConsumerServiceSession__handleTimeout__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  char v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  char v14;

  v5 = a2;
  v6 = objc_msgSend(*(id *)(a1 + 32), "count") - 1 == a3;
  v7 = *(void **)(a1 + 48);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[2] = __52__ICDelegationConsumerServiceSession__handleTimeout__block_invoke_2;
  v11[3] = &unk_1E4390B20;
  v9 = v6;
  v11[1] = 3221225472;
  v12 = v5;
  v13 = v7;
  v11[4] = *(_QWORD *)(a1 + 40);
  v14 = v9;
  v10 = v5;
  dispatch_async(v8, v11);

}

void __52__ICDelegationConsumerServiceSession__handleTimeout__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7003, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, id, _QWORD))(v2 + 16))(v2, v4, v3, 0, 0, v5, *(unsigned __int8 *)(a1 + 56));

}

uint64_t __42__ICDelegationConsumerServiceSession_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stop");
}

uint64_t __43__ICDelegationConsumerServiceSession_start__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  dispatch_source_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  void *v12;
  ICDelegationConsumerNetService *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id location;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 64))
  {
    dispatch_get_global_queue(0, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v3);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v4;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "timeoutInterval");
    v8 = v7;
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
    v10 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, (uint64_t)(v8 * 0.01 * 1000000000.0));
    objc_initWeak(&location, *(id *)(a1 + 32));
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __43__ICDelegationConsumerServiceSession_start__block_invoke_2;
    v22 = &unk_1E4391400;
    objc_copyWeak(&v23, &location);
    dispatch_source_set_event_handler(v11, &v19);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 64));
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v12 = *(void **)(v2 + 32);
  if (!v12)
  {
    v13 = [ICDelegationConsumerNetService alloc];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "userIdentityDelegationAccountUUIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[ICDelegationConsumerNetService initWithUserIdentityDelegationAccountUUIDs:](v13, "initWithUserIdentityDelegationAccountUUIDs:", v14);
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 32);
    *(_QWORD *)(v16 + 32) = v15;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setDelegate:");
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  return objc_msgSend(v12, "publish", v19, v20, v21, v22);
}

void __43__ICDelegationConsumerServiceSession_start__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__ICDelegationConsumerServiceSession_start__block_invoke_3;
    block[3] = &unk_1E43913D8;
    v5 = WeakRetained;
    dispatch_barrier_async(v3, block);

  }
}

uint64_t __43__ICDelegationConsumerServiceSession_start__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleTimeout");
}

void __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id WeakRetained;
  ICPBDGSResponse *v11;
  ICPBDGSResponse *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  uint64_t v17;
  id v18;

  v6 = a2;
  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(NSObject **)(v8 + 8);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke_2;
    v16 = &unk_1E4391110;
    v17 = v8;
    v18 = v7;
    dispatch_barrier_async(v9, &v13);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v11 = objc_alloc_init(ICPBDGSResponse);
    v12 = v11;
    if (v11)
      objc_storeStrong((id *)&v11->_startDelegationResponse, a2);
    objc_msgSend(WeakRetained, "sendResponse:forRequest:withCompletionHandler:", v12, *(_QWORD *)(a1 + 40), 0, v13, v14, v15, v16, v17);

  }
}

void __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke_13(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke_2_14(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id WeakRetained;
  ICPBDGSResponse *v11;
  ICPBDGSResponse *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  uint64_t v17;
  id v18;

  v6 = a2;
  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(NSObject **)(v8 + 8);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke_3;
    v16 = &unk_1E4391110;
    v17 = v8;
    v18 = v7;
    dispatch_barrier_async(v9, &v13);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v11 = objc_alloc_init(ICPBDGSResponse);
    v12 = v11;
    if (v11)
      objc_storeStrong((id *)&v11->_finishDelegationResponse, a2);
    objc_msgSend(WeakRetained, "sendResponse:forRequest:withCompletionHandler:", v12, *(_QWORD *)(a1 + 40), 0, v13, v14, v15, v16, v17);

  }
}

void __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v2 = (void *)MEMORY[0x1A1AFA8D0](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke_4;
  v5[3] = &unk_1E438F0F0;
  v3 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v6 = v4;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
    objc_msgSend(*(id *)(a1 + 32), "_stop");

}

void __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[6];
  id v23;
  id v24;
  BOOL v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v21 = v5;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObjectForKey:", v5);
    v20 = v7;
    v8 = objc_msgSend(v7, "accountID");
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v14, "DSID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "unsignedLongLongValue");

          if (v16 == v8)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", v14);
            v17 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count") == 0;
            v18 = *(void **)(a1 + 40);
            v19 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke_5;
            block[3] = &unk_1E43912F8;
            v24 = v18;
            block[4] = *(_QWORD *)(a1 + 32);
            block[5] = v14;
            v23 = v6;
            v25 = v17;
            dispatch_async(v19, block);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v11);
    }

    v7 = v20;
    v5 = v21;
  }

}

void __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 48), "delegateToken");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "storefrontIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "resultError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, id, void *, void *, _QWORD))(v4 + 16))(v4, v2, v3, v7, v5, v6, *(unsigned __int8 *)(a1 + 64));

}

uint64_t __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  }
  return objc_msgSend(v2, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));
}

uint64_t __83__ICDelegationConsumerServiceSession_delegationServiceConnection_didEncouterError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __74__ICDelegationConsumerServiceSession_delegationServiceConnectionDidClose___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

void __115__ICDelegationConsumerServiceSession_delegationConsumerNetService_didAcceptConnectionWithInputStream_outputStream___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  ICDelegationServiceConnection *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[5];
  ICDelegationServiceConnection *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = -[ICDelegationServiceConnection initWithConnectionRole:inputStream:outputStream:securitySettings:]([ICDelegationServiceConnection alloc], "initWithConnectionRole:inputStream:outputStream:securitySettings:", 2, a1[4], a1[5], v5);
    -[ICDelegationServiceConnection setDelegate:](v7, "setDelegate:", a1[6]);
    v8 = a1[6];
    v9 = *(NSObject **)(v8 + 8);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __115__ICDelegationConsumerServiceSession_delegationConsumerNetService_didAcceptConnectionWithInputStream_outputStream___block_invoke_2;
    v12[3] = &unk_1E4391110;
    v12[4] = v8;
    v13 = v7;
    v10 = v7;
    dispatch_barrier_async(v9, v12);

  }
  else
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = a1[6];
      *(_DWORD *)buf = 138543618;
      v15 = v11;
      v16 = 2114;
      v17 = v6;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed to get device receiver security settings with error: %{public}@", buf, 0x16u);
    }
  }

}

void __115__ICDelegationConsumerServiceSession_delegationConsumerNetService_didAcceptConnectionWithInputStream_outputStream___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __115__ICDelegationConsumerServiceSession_delegationConsumerNetService_didAcceptConnectionWithInputStream_outputStream___block_invoke_3;
  v7[3] = &unk_1E438F078;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(v8, "openWithCompletionHandler:", v7);

}

void __115__ICDelegationConsumerServiceSession_delegationConsumerNetService_didAcceptConnectionWithInputStream_outputStream___block_invoke_3(uint64_t a1, char a2)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  if ((a2 & 1) == 0)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v4 = *(NSObject **)(v2 + 8);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __115__ICDelegationConsumerServiceSession_delegationConsumerNetService_didAcceptConnectionWithInputStream_outputStream___block_invoke_4;
    v5[3] = &unk_1E4391110;
    v5[4] = v2;
    v6 = v3;
    dispatch_barrier_async(v4, v5);

  }
}

uint64_t __115__ICDelegationConsumerServiceSession_delegationConsumerNetService_didAcceptConnectionWithInputStream_outputStream___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

@end
