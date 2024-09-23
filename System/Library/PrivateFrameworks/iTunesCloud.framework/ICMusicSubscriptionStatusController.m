@implementation ICMusicSubscriptionStatusController

void __113__ICMusicSubscriptionStatusController_getSubscriptionStatusForUserIdentity_bypassingCache_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  ICStoreURLResponseAuthenticationProvider *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setIdentity:", v2);
  v4 = -[ICURLResponseAuthenticationProvider initWithUserInteractionLevel:]([ICStoreURLResponseAuthenticationProvider alloc], "initWithUserInteractionLevel:", 1);
  objc_msgSend(v3, "setAuthenticationProvider:", v4);

}

void __116__ICMusicSubscriptionStatusController_deliverSubscriptionStatusResponse_forRemoteRequestWithUniqueIdentifier_error___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    objc_msgSend(*(id *)(a1 + 32), "_deliverSubscriptionStatusResponse:forRequest:error:", *(_QWORD *)(a1 + 48), v2, *(_QWORD *)(a1 + 56));
    v3 = objc_msgSend(*(id *)(a1 + 48), "isFinalResponse");
    v2 = v4;
    if ((v3 & 1) != 0 || *(_QWORD *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 32), "_didEndRemoteRequestWithUniqueIdentifier:", *(_QWORD *)(a1 + 40));
      v2 = v4;
    }
  }

}

- (void)_scheduleInvalidationOfRemoteRequestingClientConnection
{
  OS_dispatch_source *v3;
  OS_dispatch_source *remoteRequestingClientConnectionInvalidationTimer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD handler[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_accessQueue);
  remoteRequestingClientConnectionInvalidationTimer = self->_remoteRequestingClientConnectionInvalidationTimer;
  self->_remoteRequestingClientConnectionInvalidationTimer = v3;

  v5 = self->_remoteRequestingClientConnectionInvalidationTimer;
  v6 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  v7 = self->_remoteRequestingClientConnectionInvalidationTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __94__ICMusicSubscriptionStatusController__scheduleInvalidationOfRemoteRequestingClientConnection__block_invoke;
  handler[3] = &unk_1E43913D8;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume((dispatch_object_t)self->_remoteRequestingClientConnectionInvalidationTimer);
}

- (void)_didEndRemoteRequestWithUniqueIdentifier:(id)a3
{
  unint64_t v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v4 = self->_numberOfActiveRemoteRequests - 1;
  self->_numberOfActiveRemoteRequests = v4;
  if (!v4)
    -[ICMusicSubscriptionStatusController _scheduleInvalidationOfRemoteRequestingClientConnection](self, "_scheduleInvalidationOfRemoteRequestingClientConnection");
}

void __95__ICMusicSubscriptionStatusController__willPerformSubscriptionStatusRequest_withStatusHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__28694;
  v21 = __Block_byref_object_dispose__28695;
  v22 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[2] = __95__ICMusicSubscriptionStatusController__willPerformSubscriptionStatusRequest_withStatusHandler___block_invoke_2;
  v13[3] = &unk_1E438F028;
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  v13[1] = 3221225472;
  v14 = v2;
  v15 = &v17;
  v16 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v13);
  if (v18[5])
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKey:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1A1AFA8D0](*(_QWORD *)(a1 + 48));
    objc_msgSend(v4, "addObject:", v5);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DE8];
    v7 = (void *)MEMORY[0x1A1AFA8D0](*(_QWORD *)(a1 + 48));
    objc_msgSend(v6, "arrayWithObject:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    objc_msgSend(*(id *)(a1 + 40), "requestIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v4, v9);

    v10 = *(void **)(a1 + 40);
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    objc_msgSend(v10, "requestIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v10, v12);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v4, "count");

  _Block_object_dispose(&v17, 8);
}

- (void)_deliverSubscriptionStatusResponse:(id)a3 forRequest:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableDictionary *statusHandlersForPendingIdenticalRequests;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSMutableDictionary *pendingRequests;
  void *v17;
  void *v18;
  int v19;
  NSMutableDictionary *v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  const char *v27;
  const char *v28;
  NSObject *v29;
  os_log_type_t v30;
  const char *v31;
  NSObject *callbackQueue;
  NSObject *v33;
  NSMutableDictionary *v34;
  _QWORD block[4];
  NSObject *v36;
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__28694;
  v43 = __Block_byref_object_dispose__28695;
  v44 = 0;
  statusHandlersForPendingIdenticalRequests = self->_statusHandlersForPendingIdenticalRequests;
  objc_msgSend(v9, "requestIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](statusHandlersForPendingIdenticalRequests, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "copy");
  v15 = (void *)v40[5];
  v40[5] = v14;

  pendingRequests = self->_pendingRequests;
  objc_msgSend(v9, "requestIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](pendingRequests, "objectForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v8, "isFinalResponse") ^ 1;
  if (v10)
    LOBYTE(v19) = 0;
  if ((v19 & 1) == 0)
  {
    v20 = self->_pendingRequests;
    objc_msgSend(v9, "requestIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v20, "removeObjectForKey:", v21);

    v22 = self->_statusHandlersForPendingIdenticalRequests;
    objc_msgSend(v9, "requestIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v22, "removeObjectForKey:", v23);

  }
  v24 = objc_msgSend((id)v40[5], "count");
  v25 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  v26 = v25;
  if (v10)
  {
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v27 = "s";
    *(_DWORD *)buf = 138544130;
    v47 = 2048;
    v46 = v18;
    if (v24 == 1)
      v27 = "";
    v48 = v24;
    v49 = 2080;
    v50 = v27;
    v51 = 2114;
    v52 = v10;
    v28 = "Delivering result for %{public}@ to %llu status handler%s: error = %{public}@.";
    v29 = v26;
    v30 = OS_LOG_TYPE_ERROR;
  }
  else
  {
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v31 = "s";
    *(_DWORD *)buf = 138544130;
    v47 = 2048;
    v46 = v18;
    if (v24 == 1)
      v31 = "";
    v48 = v24;
    v49 = 2080;
    v50 = v31;
    v51 = 2114;
    v52 = v8;
    v28 = "Delivering result for %{public}@ to %llu status handler%s: response = %{public}@.";
    v29 = v26;
    v30 = OS_LOG_TYPE_DEFAULT;
  }
  _os_log_impl(&dword_1A03E3000, v29, v30, v28, buf, 0x2Au);
LABEL_15:

  if (v24)
  {
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__ICMusicSubscriptionStatusController__deliverSubscriptionStatusResponse_forRequest_error___block_invoke;
    block[3] = &unk_1E43907D8;
    v38 = &v39;
    v36 = v8;
    v37 = v10;
    dispatch_async(callbackQueue, block);

    v33 = v36;
  }
  else
  {
    v33 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = self->_pendingRequests;
      *(_DWORD *)buf = 138543618;
      v46 = v9;
      v47 = 2114;
      v48 = (uint64_t)v34;
      _os_log_impl(&dword_1A03E3000, v33, OS_LOG_TYPE_ERROR, "No status handlers found for request %{public}@. pendingRequests = %{public}@", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v39, 8);
}

uint64_t __90__ICMusicSubscriptionStatusController_performSubscriptionStatusRequest_withStatusHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deliverSubscriptionStatusResponse:forRequest:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

+ (ICMusicSubscriptionStatusController)sharedStatusController
{
  if (sharedStatusController_sOnceToken != -1)
    dispatch_once(&sharedStatusController_sOnceToken, &__block_literal_global_28763);
  return (ICMusicSubscriptionStatusController *)(id)sharedStatusController_sSharedStatusController;
}

- (void)performSubscriptionStatusRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__ICMusicSubscriptionStatusController_performSubscriptionStatusRequest_withCompletionHandler___block_invoke;
  v8[3] = &unk_1E438EEE8;
  v9 = v6;
  v7 = v6;
  -[ICMusicSubscriptionStatusController performSubscriptionStatusRequest:withStatusHandler:](self, "performSubscriptionStatusRequest:withStatusHandler:", a3, v8);

}

- (void)performSubscriptionStatusRequest:(id)a3 withStatusHandler:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  ICMusicSubscriptionStatusController *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;

  v6 = a3;
  if (-[ICMusicSubscriptionStatusController _willPerformSubscriptionStatusRequest:withStatusHandler:](self, "_willPerformSubscriptionStatusRequest:withStatusHandler:", v6, a4))
  {
    v7 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __90__ICMusicSubscriptionStatusController_performSubscriptionStatusRequest_withStatusHandler___block_invoke;
    v20[3] = &unk_1E438EF10;
    v20[4] = self;
    v8 = v6;
    v21 = v8;
    v9 = (void *)MEMORY[0x1A1AFA8D0](v20);
    objc_msgSend(v8, "storeRequestContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identityStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __90__ICMusicSubscriptionStatusController_performSubscriptionStatusRequest_withStatusHandler___block_invoke_3;
    v15[3] = &unk_1E438EF38;
    v16 = v10;
    v17 = self;
    v19 = v9;
    v18 = v8;
    v13 = v9;
    v14 = v10;
    objc_msgSend(v11, "getPropertiesForUserIdentity:completionHandler:", v12, v15);

  }
}

- (BOOL)_willPerformSubscriptionStatusRequest:(id)a3 withStatusHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  ICMusicSubscriptionStatusController *v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 1;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__28694;
  v40 = __Block_byref_object_dispose__28695;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  accessQueue = self->_accessQueue;
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __95__ICMusicSubscriptionStatusController__willPerformSubscriptionStatusRequest_withStatusHandler___block_invoke;
  v25 = &unk_1E438F050;
  v26 = self;
  v9 = v6;
  v27 = v9;
  v29 = &v36;
  v10 = v7;
  v28 = v10;
  v30 = &v42;
  v31 = &v32;
  dispatch_sync(accessQueue, &v22);
  LODWORD(accessQueue) = *((unsigned __int8 *)v43 + 24);
  v11 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)accessQueue)
  {
    if (v12)
    {
      v13 = -[NSMutableDictionary count](self->_pendingRequests, "count", v22, v23, v24, v25, v26, v27);
      *(_DWORD *)buf = 138543618;
      v47 = v9;
      v48 = 2048;
      v49 = v13;
      v14 = "Performing %{public}@; total number of pending requests %llu";
      v15 = v11;
      v16 = 22;
LABEL_6:
      _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    }
  }
  else if (v12)
  {
    v17 = v37[5];
    v18 = v33[3];
    v19 = -[NSMutableDictionary count](self->_pendingRequests, "count", v22, v23, v24, v25, v26, v27);
    *(_DWORD *)buf = 138544130;
    v47 = v9;
    v48 = 2114;
    v49 = v17;
    v50 = 2048;
    v51 = v18;
    v52 = 2048;
    v53 = v19;
    v14 = "Skipping redundant %{public}@; pending identical request %{public}@; total number of status handlers: %llu. to"
          "tal number of pending requests %llu";
    v15 = v11;
    v16 = 42;
    goto LABEL_6;
  }

  v20 = *((_BYTE *)v43 + 24) != 0;
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  return v20;
}

void __90__ICMusicSubscriptionStatusController_performSubscriptionStatusRequest_withStatusHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 8);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __90__ICMusicSubscriptionStatusController_performSubscriptionStatusRequest_withStatusHandler___block_invoke_2;
  v12[3] = &unk_1E43912A8;
  v12[4] = v7;
  v13 = v5;
  v14 = v8;
  v15 = v6;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, v12);

}

_QWORD *__97__ICMusicSubscriptionStatusController__willBeginRemoteRequestWithUniqueIdentifier_statusHandler___block_invoke(uint64_t a1)
{
  _QWORD *result;

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  result = *(_QWORD **)(a1 + 32);
  if (result[3] == 1)
    return (_QWORD *)objc_msgSend(result, "_cancelRemoteRequestingClientConnectionInvalidationTimer");
  return result;
}

void __90__ICMusicSubscriptionStatusController_performSubscriptionStatusRequest_withStatusHandler___block_invoke_3(id *a1, void *a2)
{
  NSObject *v3;
  __CFString *v4;
  id v5;
  NSObject *v6;
  ICMusicSubscriptionStatusRequestOperation *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const __CFString *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  _QWORD block[4];
  ICMusicSubscriptionStatusRequestOperation *v24;
  id v25;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "isSandboxed"))
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1[4], "identity");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v4;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "Disallowing subscription status request for sandboxed user identity %@", buf, 0xCu);

    }
    v5 = a1[4];
    v6 = *((_QWORD *)a1[5] + 2);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__ICMusicSubscriptionStatusController_performSubscriptionStatusRequest_withStatusHandler___block_invoke_41;
    block[3] = &unk_1E4390EF8;
    v24 = (ICMusicSubscriptionStatusRequestOperation *)v5;
    v25 = a1[7];
    dispatch_async(v6, block);

    v7 = v24;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "ic_isCloudDaemon");

  if ((v9 & 1) != 0)
  {
LABEL_13:
    v7 = -[ICMusicSubscriptionStatusRequestOperation initWithRequest:]([ICMusicSubscriptionStatusRequestOperation alloc], "initWithRequest:", a1[6]);
    -[ICMusicSubscriptionStatusRequestOperation setAllowsFuseHeaderEnrichment:](v7, "setAllowsFuseHeaderEnrichment:", v9);
    -[ICMusicSubscriptionStatusRequestOperation setResponseHandler:](v7, "setResponseHandler:", a1[7]);
    objc_msgSend(*((id *)a1[5] + 4), "addOperation:", v7);
    goto LABEL_14;
  }
  if ((objc_msgSend((id)objc_opt_class(), "_canConnectToMusicSubscriptionStatusService") & 1) == 0)
  {
    v15 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      +[ICMusicSubscriptionStatusRemoteRequesting machServiceName](ICMusicSubscriptionStatusRemoteRequesting, "machServiceName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v27 = CFSTR("com.apple.security.exception.mach-lookup.global-name");
      v28 = 2113;
      v29 = v16;
      _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_ERROR, "warning: it has recently become deprecated to request the music subscription status in process; the new supporte"
        "d code path fetches it in itunescloudd, but you need to add %{private}@ %{private}@ to your sandbox in order to "
        "opt in to this new code path.",
        buf,
        0x16u);

    }
    goto LABEL_13;
  }
  objc_msgSend(a1[6], "requestIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (const __CFString *)a1[5];
    *(_DWORD *)buf = 138543618;
    v27 = v12;
    v28 = 2114;
    v29 = v10;
    _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Sending request %{public}@ to subscription status service", buf, 0x16u);
  }

  objc_msgSend(a1[5], "_willBeginRemoteRequestWithUniqueIdentifier:statusHandler:", v10, a1[7]);
  objc_msgSend(a1[5], "_remoteRequestingClientConnection");
  v7 = (ICMusicSubscriptionStatusRequestOperation *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __90__ICMusicSubscriptionStatusController_performSubscriptionStatusRequest_withStatusHandler___block_invoke_48;
  v20 = &unk_1E4390278;
  v21 = a1[5];
  v22 = v10;
  v13 = v10;
  -[ICMusicSubscriptionStatusRequestOperation remoteObjectProxyWithErrorHandler:](v7, "remoteObjectProxyWithErrorHandler:", &v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "performSubscriptionStatusRequest:forUniqueIdentifier:", a1[6], v13, v17, v18, v19, v20, v21);

LABEL_14:
}

- (void)_willBeginRemoteRequestWithUniqueIdentifier:(id)a3 statusHandler:(id)a4
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__ICMusicSubscriptionStatusController__willBeginRemoteRequestWithUniqueIdentifier_statusHandler___block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (id)_remoteRequestingClientConnection
{
  NSObject *accessQueue;
  id v4;
  _QWORD v6[6];
  id v7;
  id location;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__28694;
  v13 = __Block_byref_object_dispose__28695;
  v14 = 0;
  objc_initWeak(&location, self);
  accessQueue = self->_accessQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__ICMusicSubscriptionStatusController__remoteRequestingClientConnection__block_invoke;
  v6[3] = &unk_1E438F000;
  v6[4] = self;
  objc_copyWeak(&v7, &location);
  v6[5] = &v9;
  dispatch_sync(accessQueue, v6);
  v4 = (id)v10[5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);

  return v4;
}

- (void)_cancelRemoteRequestingClientConnectionInvalidationTimer
{
  NSObject *remoteRequestingClientConnectionInvalidationTimer;
  OS_dispatch_source *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  remoteRequestingClientConnectionInvalidationTimer = self->_remoteRequestingClientConnectionInvalidationTimer;
  if (remoteRequestingClientConnectionInvalidationTimer)
  {
    dispatch_source_cancel(remoteRequestingClientConnectionInvalidationTimer);
    v4 = self->_remoteRequestingClientConnectionInvalidationTimer;
    self->_remoteRequestingClientConnectionInvalidationTimer = 0;

  }
}

void __61__ICMusicSubscriptionStatusController_sharedStatusController__block_invoke()
{
  ICMusicSubscriptionStatusController *v0;
  void *v1;

  v0 = objc_alloc_init(ICMusicSubscriptionStatusController);
  v1 = (void *)sharedStatusController_sSharedStatusController;
  sharedStatusController_sSharedStatusController = (uint64_t)v0;

}

- (ICMusicSubscriptionStatusController)init
{
  ICMusicSubscriptionStatusController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *callbackQueue;
  NSOperationQueue *v7;
  NSOperationQueue *operationQueue;
  NSObject *v9;
  uint64_t v10;
  ICMusicSubscriptionStatusController *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  NSCopying *privacyAcknowledgementObservationToken;
  NSObject *v19;
  NSCopying *v20;
  _QWORD v22[4];
  id v23;
  id location;
  _QWORD block[4];
  ICMusicSubscriptionStatusController *v26;
  objc_super v27;
  uint8_t buf[4];
  ICMusicSubscriptionStatusController *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  NSCopying *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)ICMusicSubscriptionStatusController;
  v2 = -[ICMusicSubscriptionStatusController init](&v27, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicSubscriptionStatusController.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicSubscriptionStatusController.callbackQueue", MEMORY[0x1E0C80D50]);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v5;

    v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v7;

    -[NSOperationQueue setName:](v2->_operationQueue, "setName:", CFSTR("com.apple.iTunesCloud.ICMusicSubscriptionStatusController.operationQueue"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v2->_operationQueue, "setQualityOfService:", 25);
    v9 = v2->_accessQueue;
    v10 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__ICMusicSubscriptionStatusController_init__block_invoke;
    block[3] = &unk_1E43913D8;
    v11 = v2;
    v26 = v11;
    dispatch_sync(v9, block);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v11, sel__handleSubscriptionStatusCacheDidChangeNotification_, CFSTR("ICMusicSubscriptionStatusCacheDidChangeNotification"), 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v11, sel__handleSubscriptionStatusCacheUnderlyingCachingPropertiesDidChangeNotification_, CFSTR("ICMusicSubscriptionStatusCacheUnderlyingCachingPropertiesDidChangeNotification"), 0);
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v11, sel__handleSubscriptionStatusDidChangeFollowingPrivacyAcknowledgementNotification_, CFSTR("com.apple.itunescloud.ICMusicSubscriptionStatusDidChangeFollowingPrivacyAcknowledgementDistributedNotification"), 0);
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "ic_isCloudDaemon");

    if (v15)
    {
      objc_initWeak(&location, v11);
      +[ICPrivacyInfo sharedPrivacyInfo](ICPrivacyInfo, "sharedPrivacyInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v10;
      v22[1] = 3221225472;
      v22[2] = __43__ICMusicSubscriptionStatusController_init__block_invoke_2;
      v22[3] = &unk_1E438EE98;
      objc_copyWeak(&v23, &location);
      objc_msgSend(v16, "beginObservingPrivacyAcknowledgementForIdentifier:handler:", CFSTR("Music"), v22);
      v17 = objc_claimAutoreleasedReturnValue();
      privacyAcknowledgementObservationToken = v11->_privacyAcknowledgementObservationToken;
      v11->_privacyAcknowledgementObservationToken = (NSCopying *)v17;

      v19 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = v11->_privacyAcknowledgementObservationToken;
        *(_DWORD *)buf = 138543874;
        v29 = v11;
        v30 = 2114;
        v31 = CFSTR("Music");
        v32 = 2114;
        v33 = v20;
        _os_log_impl(&dword_1A03E3000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ began observing privacy acknowledgement for %{public}@ with token %{public}@.", buf, 0x20u);
      }

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(v13, "addObserver:selector:name:object:", v11, sel__handleSubscriptionStatusDidChangeDistributedNotification_, CFSTR("_ICMusicSubscriptionStatusDidChangeDistributedNotification"), 0);
    }

  }
  return v2;
}

void __91__ICMusicSubscriptionStatusController__deliverSubscriptionStatusResponse_forRequest_error___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void __94__ICMusicSubscriptionStatusController_performSubscriptionStatusRequest_withCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void (*v6)(void);
  int v7;
  void *v8;
  id v9;

  v5 = a2;
  v9 = v5;
  if (a3)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_5:
    v6();
    v8 = v9;
    goto LABEL_6;
  }
  v7 = objc_msgSend(v5, "isFinalResponse");
  v8 = v9;
  if (v7)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_5;
  }
LABEL_6:

}

void __113__ICMusicSubscriptionStatusController_getSubscriptionStatusForUserIdentity_bypassingCache_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "subscriptionStatus");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)deliverSubscriptionStatusResponse:(id)a3 forRemoteRequestWithUniqueIdentifier:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *accessQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __116__ICMusicSubscriptionStatusController_deliverSubscriptionStatusResponse_forRemoteRequestWithUniqueIdentifier_error___block_invoke;
  v15[3] = &unk_1E43912A8;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(accessQueue, v15);

}

void __43__ICMusicSubscriptionStatusController_init__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v2;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v5;

}

void __72__ICMusicSubscriptionStatusController__remoteRequestingClientConnection__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), v3);
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Creating connection with identifier %{public}@ to music subscription status service.", buf, 0xCu);
    }

    v5 = objc_alloc(MEMORY[0x1E0CB3B38]);
    +[ICMusicSubscriptionStatusRemoteRequesting machServiceName](ICMusicSubscriptionStatusRemoteRequesting, "machServiceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithMachServiceName:options:", v6, 0);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 48);
    *(_QWORD *)(v8 + 48) = v7;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setExportedObject:");
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    +[ICMusicSubscriptionStatusRemoteRequesting clientInterface](ICMusicSubscriptionStatusRemoteRequesting, "clientInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setExportedInterface:", v11);

    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    +[ICMusicSubscriptionStatusRemoteRequesting serviceInterface](ICMusicSubscriptionStatusRemoteRequesting, "serviceInterface");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRemoteObjectInterface:", v13);

    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v15 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __72__ICMusicSubscriptionStatusController__remoteRequestingClientConnection__block_invoke_65;
    v25[3] = &unk_1E438EFD8;
    v16 = v3;
    v26 = v16;
    objc_copyWeak(&v27, (id *)(a1 + 48));
    objc_msgSend(v14, "setInterruptionHandler:", v25);
    v17 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v19 = v15;
    v20 = 3221225472;
    v21 = __72__ICMusicSubscriptionStatusController__remoteRequestingClientConnection__block_invoke_2;
    v22 = &unk_1E438EFD8;
    v18 = v16;
    v23 = v18;
    objc_copyWeak(&v24, (id *)(a1 + 48));
    objc_msgSend(v17, "setInvalidationHandler:", &v19);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "resume", v19, v20, v21, v22);
    objc_destroyWeak(&v24);

    objc_destroyWeak(&v27);
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

- (void)getSubscriptionStatusForUserIdentity:(id)a3 bypassingCache:(BOOL)a4 withCompletionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  ICStoreRequestContext *v10;
  uint64_t v11;
  id v12;
  ICStoreRequestContext *v13;
  ICMusicSubscriptionStatusRequest *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = [ICStoreRequestContext alloc];
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __113__ICMusicSubscriptionStatusController_getSubscriptionStatusForUserIdentity_bypassingCache_withCompletionHandler___block_invoke;
  v18[3] = &unk_1E438EEC0;
  v19 = v8;
  v12 = v8;
  v13 = -[ICStoreRequestContext initWithBlock:](v10, "initWithBlock:", v18);
  v14 = -[ICMusicSubscriptionStatusRequest initWithStoreRequestContext:]([ICMusicSubscriptionStatusRequest alloc], "initWithStoreRequestContext:", v13);
  -[ICMusicSubscriptionStatusRequest setCarrierBundleProvisioningStyle:](v14, "setCarrierBundleProvisioningStyle:", 1);
  -[ICMusicSubscriptionStatusRequest setShouldIgnoreCache:](v14, "setShouldIgnoreCache:", v6);
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __113__ICMusicSubscriptionStatusController_getSubscriptionStatusForUserIdentity_bypassingCache_withCompletionHandler___block_invoke_2;
  v16[3] = &unk_1E438EEE8;
  v17 = v9;
  v15 = v9;
  -[ICMusicSubscriptionStatusController performSubscriptionStatusRequest:withCompletionHandler:](self, "performSubscriptionStatusRequest:withCompletionHandler:", v14, v16);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  NSCopying *privacyAcknowledgementObservationToken;
  void *v9;
  NSObject *accessQueue;
  objc_super v11;
  _QWORD block[5];
  uint8_t buf[4];
  ICMusicSubscriptionStatusController *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  NSCopying *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("ICMusicSubscriptionStatusCacheDidChangeNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("ICMusicSubscriptionStatusCacheUnderlyingCachingPropertiesDidChangeNotification"), 0);
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("com.apple.itunescloud.ICMusicSubscriptionStatusDidChangeFollowingPrivacyAcknowledgementDistributedNotification"), 0);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ic_isCloudDaemon");

  if ((v6 & 1) == 0)
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("_ICMusicSubscriptionStatusDidChangeDistributedNotification"), 0);
  if (self->_privacyAcknowledgementObservationToken)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      privacyAcknowledgementObservationToken = self->_privacyAcknowledgementObservationToken;
      *(_DWORD *)buf = 138543874;
      v14 = self;
      v15 = 2114;
      v16 = CFSTR("Music");
      v17 = 2114;
      v18 = privacyAcknowledgementObservationToken;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ ending observation of privacy acknowledgement for %{public}@ with token %{public}@.", buf, 0x20u);
    }

    +[ICPrivacyInfo sharedPrivacyInfo](ICPrivacyInfo, "sharedPrivacyInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endObservingPrivacyAcknowledgementForIdentifier:withToken:", CFSTR("Music"), self->_privacyAcknowledgementObservationToken);

  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__ICMusicSubscriptionStatusController_dealloc__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_sync(accessQueue, block);

  v11.receiver = self;
  v11.super_class = (Class)ICMusicSubscriptionStatusController;
  -[ICMusicSubscriptionStatusController dealloc](&v11, sel_dealloc);
}

- (void)getSubscriptionStatusWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICMusicSubscriptionStatusController getSubscriptionStatusForUserIdentity:withCompletionHandler:](self, "getSubscriptionStatusForUserIdentity:withCompletionHandler:", v5, v4);

}

- (void)getSubscriptionStatusForUserIdentity:(id)a3 withCompletionHandler:(id)a4
{
  -[ICMusicSubscriptionStatusController getSubscriptionStatusForUserIdentity:bypassingCache:withCompletionHandler:](self, "getSubscriptionStatusForUserIdentity:bypassingCache:withCompletionHandler:", a3, 0, a4);
}

- (void)enableSubscriptionWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICMusicSubscriptionStatusController enableSubscriptionForUserIdentity:withCompletionHandler:](self, "enableSubscriptionForUserIdentity:withCompletionHandler:", v5, v4);

}

- (void)enableSubscriptionForUserIdentity:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  ICAsyncBlockOperation *v8;
  id v9;
  id v10;
  ICAsyncBlockOperation *v11;
  _QWORD v12[4];
  id v13;
  ICMusicSubscriptionStatusController *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = [ICAsyncBlockOperation alloc];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __95__ICMusicSubscriptionStatusController_enableSubscriptionForUserIdentity_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E438FB60;
  v14 = self;
  v15 = v7;
  v13 = v6;
  v9 = v7;
  v10 = v6;
  v11 = -[ICAsyncBlockOperation initWithStartHandler:](v8, "initWithStartHandler:", v12);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v11);

}

- (void)disableSubscriptionWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICMusicSubscriptionStatusController disableSubscriptionForUserIdentity:withCompletionHandler:](self, "disableSubscriptionForUserIdentity:withCompletionHandler:", v5, v4);

}

- (void)disableSubscriptionForUserIdentity:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  ICAsyncBlockOperation *v8;
  id v9;
  id v10;
  ICAsyncBlockOperation *v11;
  _QWORD v12[4];
  id v13;
  ICMusicSubscriptionStatusController *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = [ICAsyncBlockOperation alloc];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __96__ICMusicSubscriptionStatusController_disableSubscriptionForUserIdentity_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E438FB60;
  v14 = self;
  v15 = v7;
  v13 = v6;
  v9 = v7;
  v10 = v6;
  v11 = -[ICAsyncBlockOperation initWithStartHandler:](v8, "initWithStartHandler:", v12);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v11);

}

- (void)refreshSubscriptionWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICMusicSubscriptionStatusController refreshSubscriptionForUserIdentity:withCompletionHandler:](self, "refreshSubscriptionForUserIdentity:withCompletionHandler:", v5, v4);

}

- (void)refreshSubscriptionForUserIdentity:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  ICStoreRequestContext *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[ICStoreRequestContext initWithIdentity:]([ICStoreRequestContext alloc], "initWithIdentity:", v7);

  -[ICMusicSubscriptionStatusController refreshSubscriptionUsingRequestContext:withCompletionHandler:](self, "refreshSubscriptionUsingRequestContext:withCompletionHandler:", v8, v6);
}

- (void)refreshSubscriptionUsingRequestContext:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  ICAsyncBlockOperation *v8;
  id v9;
  id v10;
  ICAsyncBlockOperation *v11;
  _QWORD v12[4];
  id v13;
  ICMusicSubscriptionStatusController *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = [ICAsyncBlockOperation alloc];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __100__ICMusicSubscriptionStatusController_refreshSubscriptionUsingRequestContext_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E438FB60;
  v14 = self;
  v15 = v7;
  v13 = v6;
  v9 = v7;
  v10 = v6;
  v11 = -[ICAsyncBlockOperation initWithStartHandler:](v8, "initWithStartHandler:", v12);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v11);

}

- (void)invalidateCachedSubscriptionStatusWithCompletionHandler:(id)a3
{
  id v4;
  ICAsyncBlockOperation *v5;
  id v6;
  ICAsyncBlockOperation *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  ICMusicSubscriptionStatusController *v12;
  id v13;

  v4 = a3;
  v5 = [ICAsyncBlockOperation alloc];
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __95__ICMusicSubscriptionStatusController_invalidateCachedSubscriptionStatusWithCompletionHandler___block_invoke;
  v11 = &unk_1E438EFB0;
  v12 = self;
  v13 = v4;
  v6 = v4;
  v7 = -[ICAsyncBlockOperation initWithStartHandler:](v5, "initWithStartHandler:", &v8);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v7, v8, v9, v10, v11, v12);

}

- (void)invalidateCachedSubscriptionStatusForUserIdentity:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  ICAsyncBlockOperation *v8;
  id v9;
  id v10;
  ICAsyncBlockOperation *v11;
  _QWORD v12[4];
  id v13;
  ICMusicSubscriptionStatusController *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = [ICAsyncBlockOperation alloc];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __111__ICMusicSubscriptionStatusController_invalidateCachedSubscriptionStatusForUserIdentity_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E438FB60;
  v14 = self;
  v15 = v7;
  v13 = v6;
  v9 = v7;
  v10 = v6;
  v11 = -[ICAsyncBlockOperation initWithStartHandler:](v8, "initWithStartHandler:", v12);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v11);

}

- (void)_invalidateRemoteRequestingClientConnection
{
  NSXPCConnection *remoteRequestingClientConnection;
  NSXPCConnection *v4;
  NSUUID *v5;
  NSXPCConnection *v6;
  NSUUID *remoteRequestingClientConnectionIdentifier;
  NSObject *v8;
  int v9;
  NSUUID *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  remoteRequestingClientConnection = self->_remoteRequestingClientConnection;
  if (remoteRequestingClientConnection)
  {
    v4 = remoteRequestingClientConnection;
    v5 = self->_remoteRequestingClientConnectionIdentifier;
    v6 = self->_remoteRequestingClientConnection;
    self->_remoteRequestingClientConnection = 0;

    remoteRequestingClientConnectionIdentifier = self->_remoteRequestingClientConnectionIdentifier;
    self->_remoteRequestingClientConnectionIdentifier = 0;

    v8 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v5;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "Invalidating connection with identifier %{public}@ to music subscription status service.", (uint8_t *)&v9, 0xCu);
    }

    -[NSXPCConnection invalidate](v4, "invalidate");
  }
}

- (void)_handleSeveredRemoteClientConnectionWithIdentifier:(id)a3
{
  NSUUID *v4;
  NSUUID *v5;
  NSUUID *v6;
  int v7;
  NSObject *v8;
  NSUUID *remoteRequestingClientConnectionIdentifier;
  int v10;
  NSUUID *v11;
  __int16 v12;
  NSUUID *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (NSUUID *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v5 = self->_remoteRequestingClientConnectionIdentifier;
  if (v5 == v4)
  {

    goto LABEL_7;
  }
  v6 = v5;
  v7 = -[NSUUID isEqual:](v5, "isEqual:", v4);

  if (v7)
  {
LABEL_7:
    -[ICMusicSubscriptionStatusController _cancelPendingRequests](self, "_cancelPendingRequests");
    goto LABEL_8;
  }
  v8 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    remoteRequestingClientConnectionIdentifier = self->_remoteRequestingClientConnectionIdentifier;
    v10 = 138543618;
    v11 = v4;
    v12 = 2114;
    v13 = remoteRequestingClientConnectionIdentifier;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "Identifier for severed connection to music subscription status service %{public}@ doesn't match current identifier: %{public}@. Ignoring.", (uint8_t *)&v10, 0x16u);
  }

LABEL_8:
}

- (void)_remoteRequestingClientConnectionInvalidationTimerDidExpire
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  -[ICMusicSubscriptionStatusController _cancelRemoteRequestingClientConnectionInvalidationTimer](self, "_cancelRemoteRequestingClientConnectionInvalidationTimer");
  -[ICMusicSubscriptionStatusController _invalidateRemoteRequestingClientConnection](self, "_invalidateRemoteRequestingClientConnection");
}

- (void)_cancelPendingRequests
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[NSMutableDictionary allKeys](self->_pendingRequests, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v4;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling requests for identifiers: %{public}@", buf, 0xCu);

  }
  -[NSMutableDictionary allValues](self->_pendingRequests, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICMusicSubscriptionStatusController _deliverSubscriptionStatusResponse:forRequest:error:](self, "_deliverSubscriptionStatusResponse:forRequest:error:", 0, v10, v11);

        objc_msgSend(v10, "requestIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICMusicSubscriptionStatusController _didEndRemoteRequestWithUniqueIdentifier:](self, "_didEndRemoteRequestWithUniqueIdentifier:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)_handlePrivacyAcknowledgementRequirementChanged:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  int v7;
  ICMusicSubscriptionStatusController *v8;
  __int16 v9;
  _BOOL4 v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543874;
    v8 = self;
    v9 = 1024;
    v10 = v3;
    v11 = 2114;
    v12 = CFSTR("com.apple.itunescloud.ICMusicSubscriptionStatusDidChangeFollowingPrivacyAcknowledgementDistributedNotification");
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ handling privacy acknowledgement requirement changed notification: isPrivacyAcknowledgementRequired = %{BOOL}u. Posting distributed notification %{public}@.", (uint8_t *)&v7, 0x1Cu);
  }

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("com.apple.itunescloud.ICMusicSubscriptionStatusDidChangeFollowingPrivacyAcknowledgementDistributedNotification"), 0);

}

- (void)_handleSubscriptionStatusDidChangeFollowingPrivacyAcknowledgementNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  ICMusicSubscriptionStatusController *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v13 = self;
    v14 = 2114;
    v15 = v6;
    v16 = 2114;
    v17 = CFSTR("ICMusicSubscriptionStatusDidChangeNotification");
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ handling %{public}@. Posting %{public}@.", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount", CFSTR("ICUserIdentityForMusicSubscriptionStatusDidChangeKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("ICMusicSubscriptionStatusDidChangeNotification"), self, v9);

}

- (void)_handleSubscriptionStatusCacheDidChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  ICMusicSubscriptionStatusController *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = self;
    v13 = 2114;
    v14 = v6;
    v15 = 2114;
    v16 = CFSTR("ICMusicSubscriptionStatusDidChangeNotification");
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ handling %{public}@. Posting %{public}@.", (uint8_t *)&v11, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("ICMusicSubscriptionStatusDidChangeNotification"), self, v8);

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v9, "ic_isCloudDaemon");

  if ((_DWORD)v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("_ICMusicSubscriptionStatusDidChangeDistributedNotification"), 0, 0, 1);

  }
}

- (void)_handleSubscriptionStatusCacheUnderlyingCachingPropertiesDidChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  ICMusicSubscriptionStatusController *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = self;
    v13 = 2114;
    v14 = v6;
    v15 = 2114;
    v16 = CFSTR("ICMusicSubscriptionStatusDidChangeNotification");
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ handling %{public}@. Posting %{public}@.", (uint8_t *)&v11, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("ICMusicSubscriptionStatusDidChangeNotification"), self, v8);

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v9, "ic_isCloudDaemon");

  if ((_DWORD)v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("_ICMusicSubscriptionStatusDidChangeDistributedNotification"), 0, 0, 1);

  }
}

- (void)_handleSubscriptionStatusDidChangeDistributedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  ICMusicSubscriptionStatusController *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = self;
    v11 = 2114;
    v12 = v6;
    v13 = 2114;
    v14 = CFSTR("ICMusicSubscriptionStatusDidChangeNotification");
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ handling %{public}@. Posting %{public}@.", (uint8_t *)&v9, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("ICMusicSubscriptionStatusDidChangeNotification"), self, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_statusHandlersForPendingIdenticalRequests, 0);
  objc_storeStrong((id *)&self->_remoteRequestingClientConnectionInvalidationTimer, 0);
  objc_storeStrong((id *)&self->_remoteRequestingClientConnectionIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteRequestingClientConnection, 0);
  objc_storeStrong((id *)&self->_privacyAcknowledgementObservationToken, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __95__ICMusicSubscriptionStatusController__willPerformSubscriptionStatusRequest_withStatusHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  id v9;

  v9 = a2;
  v8 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", v8))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
    *a4 = 1;
  }

}

uint64_t __94__ICMusicSubscriptionStatusController__scheduleInvalidationOfRemoteRequestingClientConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_remoteRequestingClientConnectionInvalidationTimerDidExpire");
}

void __72__ICMusicSubscriptionStatusController__remoteRequestingClientConnection__block_invoke_65(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  _QWORD *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "Connection to music subscription status service with identifier %{public}@ interrupted.", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained[1];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__ICMusicSubscriptionStatusController__remoteRequestingClientConnection__block_invoke_66;
  v7[3] = &unk_1E4391110;
  v8 = WeakRetained;
  v9 = *(id *)(a1 + 32);
  v6 = WeakRetained;
  dispatch_async(v5, v7);

}

void __72__ICMusicSubscriptionStatusController__remoteRequestingClientConnection__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  _QWORD *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "Connection to music subscription status service with identifier %{public}@ invalidated.", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained[1];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__ICMusicSubscriptionStatusController__remoteRequestingClientConnection__block_invoke_67;
  v7[3] = &unk_1E4391110;
  v8 = WeakRetained;
  v9 = *(id *)(a1 + 32);
  v6 = WeakRetained;
  dispatch_async(v5, v7);

}

uint64_t __72__ICMusicSubscriptionStatusController__remoteRequestingClientConnection__block_invoke_67(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSeveredRemoteClientConnectionWithIdentifier:", *(_QWORD *)(a1 + 40));
}

uint64_t __72__ICMusicSubscriptionStatusController__remoteRequestingClientConnection__block_invoke_66(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSeveredRemoteClientConnectionWithIdentifier:", *(_QWORD *)(a1 + 40));
}

void __111__ICMusicSubscriptionStatusController_invalidateCachedSubscriptionStatusForUserIdentity_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  ICStoreRequestContext *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = -[ICStoreRequestContext initWithIdentity:]([ICStoreRequestContext alloc], "initWithIdentity:", *(_QWORD *)(a1 + 32));
  +[ICMusicSubscriptionStatusCache sharedCache](ICMusicSubscriptionStatusCache, "sharedCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __111__ICMusicSubscriptionStatusController_invalidateCachedSubscriptionStatusForUserIdentity_withCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E438EF88;
  v6 = *(id *)(a1 + 48);
  v9 = v3;
  v10 = v6;
  v8[4] = *(_QWORD *)(a1 + 40);
  v7 = v3;
  objc_msgSend(v5, "setCachedSubscriptionStatusResponseNeedsReloadForRequestContext:completion:", v4, v8);

}

void __111__ICMusicSubscriptionStatusController_invalidateCachedSubscriptionStatusForUserIdentity_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 48);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __111__ICMusicSubscriptionStatusController_invalidateCachedSubscriptionStatusForUserIdentity_withCompletionHandler___block_invoke_3;
    v9 = &unk_1E4390EF8;
    v11 = v4;
    v10 = v3;
    dispatch_async(v5, &v6);

  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3, v6, v7, v8, v9);

}

uint64_t __111__ICMusicSubscriptionStatusController_invalidateCachedSubscriptionStatusForUserIdentity_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __95__ICMusicSubscriptionStatusController_invalidateCachedSubscriptionStatusWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint8_t buf[16];

  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating cached subscription status", buf, 2u);
  }

  +[ICMusicSubscriptionStatusCache sharedCache](ICMusicSubscriptionStatusCache, "sharedCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __95__ICMusicSubscriptionStatusController_invalidateCachedSubscriptionStatusWithCompletionHandler___block_invoke_59;
  v8[3] = &unk_1E438EF88;
  v6 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  v8[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  objc_msgSend(v5, "setCachedSubscriptionStatusResponseNeedsReloadForAllRequestContextsWithCompletion:", v8);

}

void __95__ICMusicSubscriptionStatusController_invalidateCachedSubscriptionStatusWithCompletionHandler___block_invoke_59(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 48);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __95__ICMusicSubscriptionStatusController_invalidateCachedSubscriptionStatusWithCompletionHandler___block_invoke_2;
    v9 = &unk_1E4390EF8;
    v11 = v4;
    v10 = v3;
    dispatch_async(v5, &v6);

  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3, v6, v7, v8, v9);

}

uint64_t __95__ICMusicSubscriptionStatusController_invalidateCachedSubscriptionStatusWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __100__ICMusicSubscriptionStatusController_refreshSubscriptionUsingRequestContext_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  ICMusicSubscriptionRequest *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "Refreshing subscription for user identity %@", buf, 0xCu);
  }

  v6 = -[ICMusicSubscriptionRequest initWithStoreRequestContext:requestType:requestingOfflineSlot:]([ICMusicSubscriptionRequest alloc], "initWithStoreRequestContext:requestType:requestingOfflineSlot:", *(_QWORD *)(a1 + 32), 2, 0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __100__ICMusicSubscriptionStatusController_refreshSubscriptionUsingRequestContext_withCompletionHandler___block_invoke_57;
  v10[3] = &unk_1E438EF60;
  v11 = v4;
  v7 = *(id *)(a1 + 48);
  v13 = v3;
  v14 = v7;
  v12 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  -[ICRequestOperation performRequestWithCompletionHandler:](v6, "performRequestWithCompletionHandler:", v10);

}

void __100__ICMusicSubscriptionStatusController_refreshSubscriptionUsingRequestContext_withCompletionHandler___block_invoke_57(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 138412546;
      v8 = v5;
      v9 = 2114;
      v10 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Failed to refresh subscription for user identity %@. err=%{public}@", (uint8_t *)&v7, 0x16u);
    }

    v6 = *(_QWORD *)(a1 + 56);
    if (v6)
      (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "getSubscriptionStatusForUserIdentity:bypassingCache:withCompletionHandler:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 56));
  }
  objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v3);

}

void __96__ICMusicSubscriptionStatusController_disableSubscriptionForUserIdentity_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  ICStoreRequestContext *v6;
  ICMusicSubscriptionRequest *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Disabling subscription for user identity %@", buf, 0xCu);
  }

  v6 = -[ICStoreRequestContext initWithIdentity:]([ICStoreRequestContext alloc], "initWithIdentity:", *(_QWORD *)(a1 + 32));
  v7 = -[ICMusicSubscriptionRequest initWithStoreRequestContext:requestType:requestingOfflineSlot:]([ICMusicSubscriptionRequest alloc], "initWithStoreRequestContext:requestType:requestingOfflineSlot:", v6, 1, 0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__ICMusicSubscriptionStatusController_disableSubscriptionForUserIdentity_withCompletionHandler___block_invoke_56;
  v10[3] = &unk_1E438EF60;
  v11 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 48);
  v13 = v3;
  v14 = v8;
  v12 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  -[ICRequestOperation performRequestWithCompletionHandler:](v7, "performRequestWithCompletionHandler:", v10);

}

void __96__ICMusicSubscriptionStatusController_disableSubscriptionForUserIdentity_withCompletionHandler___block_invoke_56(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 138543618;
      v8 = v5;
      v9 = 2114;
      v10 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Failed to disable subscription for user identity %{public}@. err=%{public}@", (uint8_t *)&v7, 0x16u);
    }

    v6 = *(_QWORD *)(a1 + 56);
    if (v6)
      (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "getSubscriptionStatusForUserIdentity:bypassingCache:withCompletionHandler:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 56));
  }
  objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v3);

}

void __95__ICMusicSubscriptionStatusController_enableSubscriptionForUserIdentity_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  ICStoreRequestContext *v6;
  ICMusicSubscriptionRequest *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Enabling subscription for user identity %@", buf, 0xCu);
  }

  v6 = -[ICStoreRequestContext initWithIdentity:]([ICStoreRequestContext alloc], "initWithIdentity:", *(_QWORD *)(a1 + 32));
  v7 = -[ICMusicSubscriptionRequest initWithStoreRequestContext:requestType:requestingOfflineSlot:]([ICMusicSubscriptionRequest alloc], "initWithStoreRequestContext:requestType:requestingOfflineSlot:", v6, 0, 0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __95__ICMusicSubscriptionStatusController_enableSubscriptionForUserIdentity_withCompletionHandler___block_invoke_54;
  v10[3] = &unk_1E438EF60;
  v11 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 48);
  v13 = v3;
  v14 = v8;
  v12 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  -[ICRequestOperation performRequestWithCompletionHandler:](v7, "performRequestWithCompletionHandler:", v10);

}

void __95__ICMusicSubscriptionStatusController_enableSubscriptionForUserIdentity_withCompletionHandler___block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 138543618;
      v8 = v5;
      v9 = 2114;
      v10 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Failed to enable subscription for user identity %{public}@. err=%{public}@", (uint8_t *)&v7, 0x16u);
    }

    v6 = *(_QWORD *)(a1 + 56);
    if (v6)
      (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "getSubscriptionStatusForUserIdentity:bypassingCache:withCompletionHandler:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 56));
  }
  objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v3);

}

void __90__ICMusicSubscriptionStatusController_performSubscriptionStatusRequest_withStatusHandler___block_invoke_41(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0CB2938];
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Disallowing subscription status request for sandboxed user identity %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7400, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

}

void __90__ICMusicSubscriptionStatusController_performSubscriptionStatusRequest_withStatusHandler___block_invoke_48(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to obtain remote proxy to perform subscription status request. error = %{public}@.", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "deliverSubscriptionStatusResponse:forRemoteRequestWithUniqueIdentifier:error:", 0, *(_QWORD *)(a1 + 40), v3);
}

uint64_t __46__ICMusicSubscriptionStatusController_dealloc__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cancelRemoteRequestingClientConnectionInvalidationTimer");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateRemoteRequestingClientConnection");
}

void __43__ICMusicSubscriptionStatusController_init__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_handlePrivacyAcknowledgementRequirementChanged:", a3);
    WeakRetained = v5;
  }

}

+ (BOOL)_canConnectToMusicSubscriptionStatusService
{
  id v2;
  int v3;

  getpid();
  +[ICMusicSubscriptionStatusRemoteRequesting machServiceName](ICMusicSubscriptionStatusRemoteRequesting, "machServiceName");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "UTF8String");
  v3 = sandbox_check();

  return v3 == 0;
}

@end
