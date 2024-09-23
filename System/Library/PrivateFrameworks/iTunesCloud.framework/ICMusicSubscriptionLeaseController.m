@implementation ICMusicSubscriptionLeaseController

void __54__ICMusicSubscriptionLeaseController_sharedController__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ICMusicSubscriptionLeaseController _init]([ICMusicSubscriptionLeaseController alloc], "_init");
  v1 = (void *)sharedController_sSharedController_31624;
  sharedController_sSharedController_31624 = (uint64_t)v0;

}

- (id)_init
{
  ICMusicSubscriptionLeaseController *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v6;
  OS_dispatch_queue *calloutQueue;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *lastKnownHouseholdID;
  NSOperationQueue *v12;
  NSOperationQueue *leaseSessionPreparationOperationQueue;
  NSObject *v14;
  NSObject *v15;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)ICMusicSubscriptionLeaseController;
  v2 = -[ICMusicSubscriptionLeaseController init](&v20, sel_init);
  if (v2)
  {
    v3 = MEMORY[0x1E0C80D50];
    v4 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicSubscriptionLeaseController.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicSubscriptionLeaseController.accessQueue", v3);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v6;

    +[ICEnvironmentMonitor sharedMonitor](ICEnvironmentMonitor, "sharedMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_isRemoteServerLikelyReachable = objc_msgSend(v8, "isRemoteServerLikelyReachable");
    objc_msgSend(v8, "registerObserver:", v2);
    v2->_isServerReachable = v2->_isRemoteServerLikelyReachable;
    +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastKnownHouseholdID");
    v10 = objc_claimAutoreleasedReturnValue();
    lastKnownHouseholdID = v2->_lastKnownHouseholdID;
    v2->_lastKnownHouseholdID = (NSString *)v10;

    v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    leaseSessionPreparationOperationQueue = v2->_leaseSessionPreparationOperationQueue;
    v2->_leaseSessionPreparationOperationQueue = v12;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_leaseSessionPreparationOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](v2->_leaseSessionPreparationOperationQueue, "setName:", CFSTR("com.apple.iTunesCloud.ICMusicSubscriptionLeaseController.leaseSessionPreparationOperationQueue"));
    -[NSOperationQueue setQualityOfService:](v2->_leaseSessionPreparationOperationQueue, "setQualityOfService:", 25);
    objc_initWeak(&location, v2);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicSubscriptionLeaseController.notificationSerialQueue", v14);

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __43__ICMusicSubscriptionLeaseController__init__block_invoke;
    v17[3] = &unk_1E438FDE0;
    objc_copyWeak(&v18, &location);
    notify_register_dispatch("com.apple.itunesstored.PlaybackLeaseDidEnd", &v2->_leaseDidEndNotificationToken, v15, v17);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
  }
  return v2;
}

void __58__ICMusicSubscriptionLeaseController_lastKnownHouseholdID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (ICMusicSubscriptionLeaseController)sharedController
{
  if (sharedController_sOnceToken_31622 != -1)
    dispatch_once(&sharedController_sOnceToken_31622, &__block_literal_global_31623);
  return (ICMusicSubscriptionLeaseController *)(id)sharedController_sSharedController_31624;
}

- (NSString)lastKnownHouseholdID
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
  v9 = __Block_byref_object_copy__31553;
  v10 = __Block_byref_object_dispose__31554;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__ICMusicSubscriptionLeaseController_lastKnownHouseholdID__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[ICEnvironmentMonitor sharedMonitor](ICEnvironmentMonitor, "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  notify_cancel(self->_leaseDidEndNotificationToken);
  v4.receiver = self;
  v4.super_class = (Class)ICMusicSubscriptionLeaseController;
  -[ICMusicSubscriptionLeaseController dealloc](&v4, sel_dealloc);
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  ICMusicSubscriptionLeaseController *v9;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__ICMusicSubscriptionLeaseController_environmentMonitorDidChangeNetworkReachability___block_invoke;
  v7[3] = &unk_1E4391110;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

- (void)musicLeaseSession:(id)a3 didFinishPlaybackRequest:(id)a4 withPlaybackResponse:(id)a5 responseError:(id)a6 updatedFairPlayKeyStatusList:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  NSObject *accessQueue;
  BOOL v22;
  char v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD block[5];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  char v35;
  uint8_t buf[4];
  ICMusicSubscriptionLeaseController *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  int v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v37 = self;
    v38 = 2048;
    v39 = v16;
    v40 = 1024;
    v41 = objc_msgSend(v18, "count");
    v42 = 2114;
    v43 = v17;
    _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_DEFAULT, "[Lease] - %{public}@ - musicLeaseSession:didFinishPlaybackRequest:withPlaybackResponse: finshed with response=%p, updatedFairPlayKeyStatusList(count)=%d, error=%{public}@...", buf, 0x26u);
  }

  accessQueue = self->_accessQueue;
  if (v16)
    v22 = v17 == 0;
  else
    v22 = 0;
  v23 = v22;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __163__ICMusicSubscriptionLeaseController_musicLeaseSession_didFinishPlaybackRequest_withPlaybackResponse_responseError_updatedFairPlayKeyStatusList_completionHandler___block_invoke;
  block[3] = &unk_1E438FEA0;
  v35 = v23;
  block[4] = self;
  v30 = v16;
  v31 = v18;
  v32 = v14;
  v33 = v15;
  v34 = v19;
  v24 = v19;
  v25 = v15;
  v26 = v14;
  v27 = v18;
  v28 = v16;
  dispatch_barrier_sync(accessQueue, block);

}

- (void)musicLeaseSession:(id)a3 requestsFairPlayKeyStatusUpdateWithCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  ICMusicSubscriptionLeaseController *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = self;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "[Lease] - %{public}@ - musicLeaseSession:requestsFairPlayKeyStatusUpdateWithCompletion:", buf, 0xCu);
  }

  +[ICMusicSubscriptionFairPlayController sharedController](ICMusicSubscriptionFairPlayController, "sharedController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __102__ICMusicSubscriptionLeaseController_musicLeaseSession_requestsFairPlayKeyStatusUpdateWithCompletion___block_invoke;
  v12[3] = &unk_1E438FEF0;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "getKeyStatusListWithCompletionHandler:", v12);

}

- (void)getLastKnownHouseholdIDWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *accessQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76__ICMusicSubscriptionLeaseController_getLastKnownHouseholdIDWithCompletion___block_invoke;
    v7[3] = &unk_1E4390EF8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(accessQueue, v7);

  }
}

- (void)getLeaseSessionWithRequestContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identityStore");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8 && v9)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke;
    v14[3] = &unk_1E4390008;
    v14[4] = self;
    v18 = v7;
    v15 = v6;
    v16 = v10;
    v17 = v8;
    objc_msgSend(v16, "getPropertiesForUserIdentity:completionHandler:", v17, v14);

  }
  else if (v7)
  {
    v19 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to get lease session [missing user identity or user identity store] - userIdentity=%@ - userIdentityStore=%@"), v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7400, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v13);

  }
}

- (void)receivedUserInteractionEvent
{
  NSObject *accessQueue;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _QWORD block[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__31553;
  v16 = __Block_byref_object_dispose__31554;
  v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__ICMusicSubscriptionLeaseController_receivedUserInteractionEvent__block_invoke;
  block[3] = &unk_1E4391568;
  block[4] = self;
  block[5] = &v12;
  dispatch_barrier_sync(accessQueue, block);
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v3 = (id)v13[5];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_receivedUserInteractionEvent", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v18, 16);
    }
    while (v4);
  }

  _Block_object_dispose(&v12, 8);
}

- (void)_handlePlaybackLeaseDidEndPushNotification
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMutableDictionary allValues](self->_cacheKeyToLeaseSession, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_handlePlaybackLeaseDidEndPushNotification");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaseSessionPreparationOperationQueue, 0);
  objc_storeStrong((id *)&self->_lastKnownHouseholdID, 0);
  objc_storeStrong((id *)&self->_cacheKeyToLeaseSession, 0);
  objc_storeStrong((id *)&self->_accountDSIDToFairPlayKeyStatus, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __66__ICMusicSubscriptionLeaseController_receivedUserInteractionEvent__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  void (**v19)(_QWORD, _QWORD);
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  id v24;
  id v25;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_2;
    v21[3] = &unk_1E438FFB8;
    v8 = v5;
    v9 = *(_QWORD *)(a1 + 32);
    v22 = v8;
    v23 = v9;
    v25 = *(id *)(a1 + 64);
    v24 = *(id *)(a1 + 40);
    v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AFA8D0](v21);
    objc_msgSend(*(id *)(a1 + 40), "delegatedIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = *(void **)(a1 + 48);
      v17[0] = v7;
      v17[1] = 3221225472;
      v17[2] = __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_11;
      v17[3] = &unk_1E438FFE0;
      v19 = v10;
      v20 = *(id *)(a1 + 64);
      v18 = v11;
      objc_msgSend(v12, "getPropertiesForUserIdentity:completionHandler:", v18, v17);

    }
    else
    {
      v10[2](v10, 0);
    }

  }
  else if (*(_QWORD *)(a1 + 64))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to get lease session [no properties for user identity] - userIdentity=%@"), *(_QWORD *)(a1 + 56));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CB2938]);

    v15 = *(_QWORD *)(a1 + 64);
    if (v6)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v15 + 16))(v15, 0, v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7400, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v16);

    }
  }

}

void __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _ICMusicSubscriptionLeaseIdentityCacheKey *v6;
  void *v7;
  _ICMusicSubscriptionLeaseIdentityCacheKey *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  _ICMusicSubscriptionLeaseIdentityCacheKey *v12;
  uint64_t v13;
  ICAsyncBlockOperation *v14;
  ICAsyncBlockOperation *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  uint64_t v20;
  _ICMusicSubscriptionLeaseIdentityCacheKey *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  _QWORD block[5];
  _ICMusicSubscriptionLeaseIdentityCacheKey *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "DSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [_ICMusicSubscriptionLeaseIdentityCacheKey alloc];
  objc_msgSend(*(id *)(a1 + 32), "carrierBundleDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_ICMusicSubscriptionLeaseIdentityCacheKey initWithDSID:carrierBundleDeviceIdentifier:delegatedDSID:](v6, "initWithDSID:carrierBundleDeviceIdentifier:delegatedDSID:", v4, v7, v5);

  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__31553;
  v34 = __Block_byref_object_dispose__31554;
  v35 = 0;
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(NSObject **)(v9 + 8);
  v11 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_3;
  block[3] = &unk_1E43907D8;
  v29 = &v30;
  block[4] = v9;
  v12 = v8;
  v28 = v12;
  dispatch_sync(v10, block);
  if (v31[5])
  {
    v13 = *(_QWORD *)(a1 + 56);
    if (v13)
      (*(void (**)(void))(v13 + 16))();
  }
  else
  {
    v14 = [ICAsyncBlockOperation alloc];
    v16 = v11;
    v17 = 3221225472;
    v18 = __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_4;
    v19 = &unk_1E438FF90;
    v20 = *(_QWORD *)(a1 + 40);
    v26 = &v30;
    v21 = v12;
    v25 = *(id *)(a1 + 56);
    v22 = v4;
    v23 = *(id *)(a1 + 48);
    v24 = v3;
    v15 = -[ICAsyncBlockOperation initWithStartHandler:](v14, "initWithStartHandler:", &v16);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "addOperation:", v15, v16, v17, v18, v19, v20);

  }
  _Block_object_dispose(&v30, 8);

}

void __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_11(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  char v8;
  void (*v9)(void);
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  v6 = v14;
  v7 = v5;
  if (v14)
  {
    v8 = objc_msgSend(v14, "isDelegated");
    v6 = v14;
    if ((v8 & 1) == 0)
    {
      v9 = *(void (**)(void))(a1[5] + 16);
      goto LABEL_8;
    }
  }
  if (objc_msgSend(v6, "isDelegated"))
  {
    v9 = *(void (**)(void))(a1[5] + 16);
LABEL_8:
    v9();
    goto LABEL_9;
  }
  if (a1[6])
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to get lease session [invalid delegated identity] - delegatedIdentity=%@"), a1[4]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CB2938]);

    v12 = a1[6];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7400, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

  }
LABEL_9:

}

void __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  _QWORD block[5];
  id v29;
  uint64_t v30;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 8);
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_5;
  block[3] = &unk_1E43907D8;
  v30 = *(_QWORD *)(a1 + 80);
  block[4] = v4;
  v29 = v5;
  dispatch_sync(v6, block);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v25[0] = v7;
    v25[1] = 3221225472;
    v25[2] = __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_6;
    v25[3] = &unk_1E438FF18;
    v9 = *(id *)(a1 + 72);
    v10 = *(_QWORD *)(a1 + 80);
    v26 = v9;
    v27 = v10;
    dispatch_async(v8, v25);
    objc_msgSend(v3, "finish");
    v11 = v26;
  }
  else
  {
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_7;
    v18[3] = &unk_1E438FF40;
    v18[4] = *(_QWORD *)(a1 + 32);
    v19 = *(id *)(a1 + 48);
    v20 = *(id *)(a1 + 56);
    v21 = *(id *)(a1 + 64);
    v22 = *(id *)(a1 + 40);
    v24 = *(id *)(a1 + 72);
    v23 = v3;
    v12 = (void *)MEMORY[0x1A1AFA8D0](v18);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(NSObject **)(v13 + 8);
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_9;
    v16[3] = &unk_1E4390EF8;
    v16[4] = v13;
    v17 = v12;
    v15 = v12;
    dispatch_barrier_async(v14, v16);

    v11 = v19;
  }

}

void __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_5(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
  return result;
}

void __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  ICMusicSubscriptionLeaseStatus *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
    v4 = v2;
  else
    v4 = &unk_1E43E68C8;
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(ICMusicSubscriptionLeaseStatus);
  -[ICMusicSubscriptionLeaseStatus setShouldPlaybackRequireOnlineKeys:](v6, "setShouldPlaybackRequireOnlineKeys:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 42));
  if (objc_msgSend(v5, "hasOnlinePlaybackKeys"))
  {
    -[ICMusicSubscriptionLeaseStatus setHasOnlinePlaybackKeys:](v6, "setHasOnlinePlaybackKeys:", 1);
    -[ICMusicSubscriptionLeaseStatus setLeaseState:](v6, "setLeaseState:", 1);
  }
  -[ICMusicSubscriptionLeaseStatus setHasOfflinePlaybackKeys:](v6, "setHasOfflinePlaybackKeys:", objc_msgSend(v5, "hasOfflinePlaybackKeys"));
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 40))
    -[ICMusicSubscriptionLeaseStatus setHasPendingLeaseAcquisition:](v6, "setHasPendingLeaseAcquisition:", 1);
  v7 = -[ICMusicSubscriptionLeaseSession _initWithRequestContext:isDelegatedLeaseSession:delegate:leaseStatus:]([ICMusicSubscriptionLeaseSession alloc], "_initWithRequestContext:isDelegatedLeaseSession:delegate:leaseStatus:", *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "isDelegated"), *(_QWORD *)(a1 + 32), v6);
  if (v7)
  {
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    if (!v8)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 32);
      *(_QWORD *)(v10 + 32) = v9;

      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    }
    objc_msgSend(v8, "setObject:forKey:", v7, *(_QWORD *)(a1 + 64));
  }
  v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_8;
  v18 = &unk_1E4390EF8;
  v13 = *(id *)(a1 + 80);
  v19 = v7;
  v20 = v13;
  v14 = v7;
  dispatch_async(v12, &v15);
  objc_msgSend(*(id *)(a1 + 72), "finish", v15, v16, v17, v18);

}

void __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_9(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    +[ICMusicSubscriptionFairPlayController sharedController](ICMusicSubscriptionFairPlayController, "sharedController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_10;
    v4[3] = &unk_1E438FF68;
    v3 = *(void **)(a1 + 40);
    v4[4] = *(_QWORD *)(a1 + 32);
    v5 = v3;
    objc_msgSend(v2, "getKeyStatusListWithCompletionHandler:", v4);

  }
}

void __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
        {
          v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v11 = *(_QWORD *)(a1 + 32);
          v12 = *(void **)(v11 + 24);
          *(_QWORD *)(v11 + 24) = v10;

        }
        v13 = objc_msgSend(v9, "accountUniqueIdentifier", (_QWORD)v16);
        v14 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v9, v15);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __90__ICMusicSubscriptionLeaseController_getLeaseSessionWithRequestContext_completionHandler___block_invoke_8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32), 0);
  return result;
}

void __76__ICMusicSubscriptionLeaseController_getLastKnownHouseholdIDWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__ICMusicSubscriptionLeaseController_getLastKnownHouseholdIDWithCompletion___block_invoke_2;
  v6[3] = &unk_1E4390EF8;
  v7 = v2;
  v8 = v3;
  v5 = v2;
  dispatch_async(v4, v6);

}

uint64_t __76__ICMusicSubscriptionLeaseController_getLastKnownHouseholdIDWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __102__ICMusicSubscriptionLeaseController_musicLeaseSession_requestsFairPlayKeyStatusUpdateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  uint64_t *v30;
  _QWORD v31[5];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v26 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v41;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v41 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v9);
        if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
        {
          v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v12 = *(_QWORD *)(a1 + 32);
          v13 = *(void **)(v12 + 24);
          *(_QWORD *)(v12 + 24) = v11;

        }
        v14 = objc_msgSend(v10, "accountUniqueIdentifier");
        v15 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKey:", v10, v16);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v7);
  }

  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__31553;
  v38 = __Block_byref_object_dispose__31554;
  v39 = 0;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(void **)(a1 + 40);
  v19 = *(void **)(v17 + 32);
  v31[2] = __102__ICMusicSubscriptionLeaseController_musicLeaseSession_requestsFairPlayKeyStatusUpdateWithCompletion___block_invoke_2;
  v31[3] = &unk_1E438FEC8;
  v20 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[4] = v17;
  v32 = v18;
  v33 = &v34;
  objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v31);
  if (!v35[5])
  {
    objc_msgSend(*(id *)(a1 + 40), "leaseStatus");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v35[5];
    v35[5] = v21;

  }
  v23 = *(void **)(a1 + 48);
  if (v23)
  {
    v24 = *(_QWORD *)(a1 + 32);
    v25 = *(NSObject **)(v24 + 16);
    block[0] = v20;
    block[1] = 3221225472;
    block[2] = __102__ICMusicSubscriptionLeaseController_musicLeaseSession_requestsFairPlayKeyStatusUpdateWithCompletion___block_invoke_3;
    block[3] = &unk_1E43909E8;
    block[4] = v24;
    v30 = &v34;
    v29 = v23;
    v28 = v26;
    dispatch_async(v25, block);

  }
  _Block_object_dispose(&v34, 8);

}

void __102__ICMusicSubscriptionLeaseController_musicLeaseSession_requestsFairPlayKeyStatusUpdateWithCompletion___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = a2;
  objc_msgSend(v14, "leaseStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "leaseState");
  objc_msgSend(v5, "DSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = &unk_1E43E68C8;
  if (v9)
    v10 = v9;
  v11 = v10;

  objc_msgSend(v7, "stateReasonDialog");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "hasOnlinePlaybackKeys"))
  {

    v12 = 0;
    v8 = 1;
  }
  else if (v8 == 1)
  {
    v8 = 0;
  }
  objc_msgSend(v7, "setStateReasonDialog:", v12);
  objc_msgSend(v7, "setLeaseState:", v8);
  objc_msgSend(v7, "setHasOnlinePlaybackKeys:", objc_msgSend(v13, "hasOnlinePlaybackKeys"));
  objc_msgSend(v7, "setHasOfflinePlaybackKeys:", objc_msgSend(v13, "hasOfflinePlaybackKeys"));
  if ((id)a1[5] == v14)
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v7);
  else
    objc_msgSend(v14, "_setLeaseStatus:updatedLeaseExpirationDate:", v7, 0);

}

uint64_t __102__ICMusicSubscriptionLeaseController_musicLeaseSession_requestsFairPlayKeyStatusUpdateWithCompletion___block_invoke_3(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "[Lease] - %{public}@ - musicLeaseSession:requestsFairPlayKeyStatusUpdateWithCompletion: - Completing with lease status: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __163__ICMusicSubscriptionLeaseController_musicLeaseSession_didFinishPlaybackRequest_withPlaybackResponse_responseError_updatedFairPlayKeyStatusList_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  id *v25;
  void *v26;
  _QWORD block[4];
  _QWORD v28[3];
  _QWORD v29[4];
  _QWORD v30[3];
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  _QWORD *v37;
  char v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _QWORD v45[5];
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 42) = *(_BYTE *)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 40), "householdID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v2;
  if (v2)
  {
    v3 = objc_msgSend(v2, "copy");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v3;

    +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLastKnownHouseholdID:", v26);

  }
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v7 = *(id *)(a1 + 48);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v54;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v54 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v10);
          if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
          {
            v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v13 = *(_QWORD *)(a1 + 32);
            v14 = *(void **)(v13 + 24);
            *(_QWORD *)(v13 + 24) = v12;

          }
          v15 = objc_msgSend(v11, "accountUniqueIdentifier");
          v16 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKey:", v11, v17);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
      }
      while (v8);
    }

  }
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__31553;
  v51 = __Block_byref_object_dispose__31554;
  v52 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__31553;
  v45[4] = __Block_byref_object_dispose__31554;
  v46 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__31553;
  v43 = __Block_byref_object_dispose__31554;
  v44 = 0;
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 32);
  v20 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __163__ICMusicSubscriptionLeaseController_musicLeaseSession_didFinishPlaybackRequest_withPlaybackResponse_responseError_updatedFairPlayKeyStatusList_completionHandler___block_invoke_2;
  v31[3] = &unk_1E438FE50;
  v38 = *(_BYTE *)(a1 + 80);
  v31[4] = v18;
  v32 = *(id *)(a1 + 56);
  v33 = *(id *)(a1 + 40);
  v35 = &v39;
  v34 = *(id *)(a1 + 64);
  v36 = &v47;
  v37 = v45;
  objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v31);
  if (!v48[5])
  {
    objc_msgSend(*(id *)(a1 + 56), "leaseStatus");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v48[5];
    v48[5] = v21;

  }
  v23 = v40[5];
  v24 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  if (v23)
  {
    block[0] = v20;
    block[1] = 3221225472;
    block[2] = __163__ICMusicSubscriptionLeaseController_musicLeaseSession_didFinishPlaybackRequest_withPlaybackResponse_responseError_updatedFairPlayKeyStatusList_completionHandler___block_invoke_3;
    block[3] = &unk_1E438FE78;
    v25 = (id *)v28;
    v28[0] = *(id *)(a1 + 72);
    v28[1] = &v47;
    v28[2] = v45;
    dispatch_group_notify(v23, v24, block);
  }
  else
  {
    v29[0] = v20;
    v29[1] = 3221225472;
    v29[2] = __163__ICMusicSubscriptionLeaseController_musicLeaseSession_didFinishPlaybackRequest_withPlaybackResponse_responseError_updatedFairPlayKeyStatusList_completionHandler___block_invoke_2_23;
    v29[3] = &unk_1E438FE78;
    v25 = (id *)v30;
    v30[0] = *(id *)(a1 + 72);
    v30[1] = &v47;
    v30[2] = v45;
    dispatch_async(v24, v29);
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(v45, 8);

  _Block_object_dispose(&v47, 8);
}

void __163__ICMusicSubscriptionLeaseController_musicLeaseSession_didFinishPlaybackRequest_withPlaybackResponse_responseError_updatedFairPlayKeyStatusList_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  dispatch_group_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  _QWORD v39[5];
  uint8_t buf[4];
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v5, "leaseStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  objc_msgSend(v8, "setShouldPlaybackRequireOnlineKeys:", *(unsigned __int8 *)(a1 + 88));
  objc_msgSend(v6, "DSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = &unk_1E43E68C8;
  if (v9)
    v10 = v9;
  v11 = v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "leaseState");
  objc_msgSend(v8, "stateReasonDialog");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stateReasonDialogMetricsDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(id *)(a1 + 40) == v5)
  {
    objc_msgSend(*(id *)(a1 + 48), "serverError");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v38 = v11;
      objc_msgSend(v16, "domain");
      v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("ICStoreServerError"));

      if (v20)
      {
        v21 = objc_msgSend(v18, "code");
        v17 = v18;
        if ((unint64_t)(v21 - 3059) > 0x19)
        {
LABEL_18:
          v11 = v38;
          goto LABEL_21;
        }
        v11 = v38;
        if (((1 << (v21 + 13)) & 0x2000003) == 0)
        {
LABEL_21:

          goto LABEL_22;
        }
        objc_msgSend(*(id *)(a1 + 48), "dialog");
        v37 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 48), "metricsDictionary");
        v22 = objc_claimAutoreleasedReturnValue();

        v23 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        if (!v23)
        {
          v24 = dispatch_group_create();
          v25 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v26 = *(void **)(v25 + 40);
          *(_QWORD *)(v25 + 40) = v24;

          v23 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        }
        dispatch_group_enter(v23);
        +[ICMusicSubscriptionFairPlayController sharedController](ICMusicSubscriptionFairPlayController, "sharedController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __163__ICMusicSubscriptionLeaseController_musicLeaseSession_didFinishPlaybackRequest_withPlaybackResponse_responseError_updatedFairPlayKeyStatusList_completionHandler___block_invoke_21;
        v39[3] = &unk_1E438FE28;
        v39[4] = *(_QWORD *)(a1 + 64);
        objc_msgSend(v27, "stopSubscriptionLeaseWithCompletion:", v39);

        if (!v12)
        {
          v13 = 2;
          v14 = (void *)v37;
          v15 = (void *)v22;
          goto LABEL_21;
        }
        v18 = v17;
        v28 = (void *)objc_msgSend(v12, "copy");

        objc_msgSend(v28, "setHasOnlinePlaybackKeys:", 0);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v28, v38);
        v13 = 2;
        v14 = (void *)v37;
        v15 = (void *)v22;
        v12 = v28;
      }
    }
    else
    {
      +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v29, "shouldForceStreamingOnlyKeysForPlayback"))
      {

        goto LABEL_21;
      }
      v38 = v11;
      v18 = 0;
      v30 = objc_msgSend(v12, "hasOfflinePlaybackKeys");

      if (v30)
      {
        v31 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          v41 = v32;
          _os_log_impl(&dword_1A03E3000, v31, OS_LOG_TYPE_DEFAULT, "[Lease] - %{public}@ - Resetting default to force streaming-only playback keys now that we have offline FairPlay keys", buf, 0xCu);
        }

        +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setShouldForceStreamingOnlyKeysForPlayback:", 0);

      }
    }
    v17 = v18;
    goto LABEL_18;
  }
LABEL_22:
  if (objc_msgSend(v12, "hasOnlinePlaybackKeys"))
  {
    if (*(id *)(a1 + 40) == v5 && (v35 = *(void **)(a1 + 48)) != 0)
    {
      objc_msgSend(v35, "leaseExpirationDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = 0;
    }

    v14 = 0;
    v13 = 1;
  }
  else
  {
    v34 = 0;
    if (v13 == 1)
      v13 = 0;
  }
  objc_msgSend(v8, "setStateReasonDialog:", v14);
  objc_msgSend(v8, "setStateReasonDialogMetricsDictionary:", v15);
  objc_msgSend(v8, "setLeaseState:", v13);
  if (v13 == 2)
    v36 = objc_msgSend(*(id *)(a1 + 56), "isTriggeredByLeasePrevention");
  else
    v36 = 0;
  objc_msgSend(v8, "setTakenDueToLeasePrevention:", v36);
  objc_msgSend(v8, "setHasOnlinePlaybackKeys:", objc_msgSend(v12, "hasOnlinePlaybackKeys"));
  objc_msgSend(v8, "setHasOfflinePlaybackKeys:", objc_msgSend(v12, "hasOfflinePlaybackKeys"));
  if (*(id *)(a1 + 40) == v5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v8);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v34);
  }
  else
  {
    objc_msgSend(v5, "_setLeaseStatus:updatedLeaseExpirationDate:", v8, v34);
  }

}

uint64_t __163__ICMusicSubscriptionLeaseController_musicLeaseSession_didFinishPlaybackRequest_withPlaybackResponse_responseError_updatedFairPlayKeyStatusList_completionHandler___block_invoke_2_23(_QWORD *a1)
{
  uint64_t result;

  result = a1[4];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  return result;
}

uint64_t __163__ICMusicSubscriptionLeaseController_musicLeaseSession_didFinishPlaybackRequest_withPlaybackResponse_responseError_updatedFairPlayKeyStatusList_completionHandler___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[4];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  return result;
}

void __163__ICMusicSubscriptionLeaseController_musicLeaseSession_didFinishPlaybackRequest_withPlaybackResponse_responseError_updatedFairPlayKeyStatusList_completionHandler___block_invoke_21(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

void __85__ICMusicSubscriptionLeaseController_environmentMonitorDidChangeNetworkReachability___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isRemoteServerLikelyReachable");
  v3 = *(_QWORD *)(a1 + 40);
  if (*(unsigned __int8 *)(v3 + 41) != v2)
  {
    *(_BYTE *)(v3 + 41) = v2;
    v4 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(v4 + 41))
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      objc_msgSend(*(id *)(v4 + 32), "allValues", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v11;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_handleRemoteServerDidBecomeLikelyReachable");
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }

    }
    else
    {
      objc_msgSend(*(id *)(v4 + 32), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_16);
    }
  }
}

void __85__ICMusicSubscriptionLeaseController_environmentMonitorDidChangeNetworkReachability___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(v3, "leaseStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "copy");

  objc_msgSend(v5, "setShouldPlaybackRequireOnlineKeys:", 0);
  objc_msgSend(v3, "_setLeaseStatus:updatedLeaseExpirationDate:", v5, 0);

}

void __43__ICMusicSubscriptionLeaseController__init__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id WeakRetained;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "BOOLForKey:", CFSTR("ICMusicSubscriptionLeaseIgnorePushNotifications")) & 1) == 0)
  {

    goto LABEL_5;
  }
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternalBuild");

  if ((v4 & 1) == 0)
  {
LABEL_5:
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_handlePlaybackLeaseDidEndPushNotification");

  }
}

@end
