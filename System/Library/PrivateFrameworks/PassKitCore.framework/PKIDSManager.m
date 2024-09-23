@implementation PKIDSManager

- (PKIDSManager)init
{
  void *v3;
  PKIDSManager *v4;
  NSObject *v5;
  uint8_t v7[16];

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", CFSTR("com.apple.private.alloy.applepay"));
  v4 = -[PKIDSManager initWithIDSService:](self, "initWithIDSService:", v3);
  if (v4)
  {
    PKLogFacilityTypeGetObject(8uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Initializing IDS manager", v7, 2u);
    }

  }
  return v4;
}

- (PKIDSManager)initWithTargetQueue:(id)a3
{
  NSObject *v4;
  PKIDSManager *v5;
  PKIDSManager *v6;

  v4 = a3;
  v5 = -[PKIDSManager init](self, "init");
  v6 = v5;
  if (v5)
  {
    dispatch_set_target_queue((dispatch_object_t)v5->_internalQueue, v4);
    dispatch_set_target_queue((dispatch_object_t)v6->_callbackQueue, v4);
  }

  return v6;
}

- (PKIDSManager)initWithIDSService:(id)a3
{
  id v5;
  PKIDSManager *v6;
  PKIDSManager *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *internalQueue;
  dispatch_queue_t v10;
  OS_dispatch_queue *callbackQueue;
  NSMutableArray *v12;
  NSMutableArray *remoteDevices;
  NSMutableArray *v14;
  NSMutableArray *paymentRequests;
  NSMutableArray *v16;
  NSMutableArray *pendingCancellations;
  NSMutableDictionary *v18;
  NSMutableDictionary *pendingDiscoveries;
  NSMutableDictionary *v20;
  NSMutableDictionary *completionHandlers;
  NSMutableDictionary *v22;
  NSMutableDictionary *thumbnailCompletionHandlers;
  PKProximityAdvertiser *v24;
  PKProximityAdvertiser *proximityAdvertiser;
  NSMutableDictionary *v26;
  NSMutableDictionary *recentlySeenUUIDs;
  NSObject *v28;
  PKIDSManager *v29;
  _QWORD block[4];
  PKIDSManager *v32;
  objc_super v33;

  v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)PKIDSManager;
  v6 = -[PKIDSManager init](&v33, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_delegatesLock._os_unfair_lock_opaque = 0;
    v8 = dispatch_queue_create("com.apple.passd.idsmanager.internal", 0);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_create("com.apple.passd.idsmanager.callback", 0);
    callbackQueue = v7->_callbackQueue;
    v7->_callbackQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v7->_service, a3);
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    remoteDevices = v7->_remoteDevices;
    v7->_remoteDevices = v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    paymentRequests = v7->_paymentRequests;
    v7->_paymentRequests = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingCancellations = v7->_pendingCancellations;
    v7->_pendingCancellations = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingDiscoveries = v7->_pendingDiscoveries;
    v7->_pendingDiscoveries = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    completionHandlers = v7->_completionHandlers;
    v7->_completionHandlers = v20;

    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    thumbnailCompletionHandlers = v7->_thumbnailCompletionHandlers;
    v7->_thumbnailCompletionHandlers = v22;

    v24 = objc_alloc_init(PKProximityAdvertiser);
    proximityAdvertiser = v7->_proximityAdvertiser;
    v7->_proximityAdvertiser = v24;

    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    recentlySeenUUIDs = v7->_recentlySeenUUIDs;
    v7->_recentlySeenUUIDs = v26;

    -[PKIDSManager _registerCTLMThrottleUncapNotification](v7, "_registerCTLMThrottleUncapNotification");
    -[PKIDSManager _registerListeners](v7, "_registerListeners");
    -[PKIDSManager _createThumbnailCacheDirectory](v7, "_createThumbnailCacheDirectory");
    v28 = v7->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__PKIDSManager_initWithIDSService___block_invoke;
    block[3] = &unk_1E2ABE120;
    v29 = v7;
    v32 = v29;
    dispatch_async(v28, block);
    -[IDSService addDelegate:queue:](v7->_service, "addDelegate:queue:", v29, v7->_internalQueue);

  }
  return v7;
}

uint64_t __35__PKIDSManager_initWithIDSService___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[1];
  objc_msgSend(v2, "_remoteDevicesWithArchive");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "_populateDevicesIfNeeded");
}

- (void)dealloc
{
  objc_super v3;

  -[IDSService removeDelegate:](self->_service, "removeDelegate:", self);
  -[PKIDSManager _unregisterCTLMThrottleUncapNotification](self, "_unregisterCTLMThrottleUncapNotification");
  v3.receiver = self;
  v3.super_class = (Class)PKIDSManager;
  -[PKIDSManager dealloc](&v3, sel_dealloc);
}

- (NSArray)delegates
{
  os_unfair_lock_s *p_delegatesLock;
  void *v4;
  void *v5;

  p_delegatesLock = &self->_delegatesLock;
  os_unfair_lock_lock(&self->_delegatesLock);
  -[NSHashTable allObjects](self->_delegates, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_delegatesLock);
  return (NSArray *)v5;
}

- (void)addDelegate:(id)a3
{
  NSHashTable *delegates;
  NSHashTable *v5;
  NSHashTable *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_delegatesLock);
  delegates = self->_delegates;
  if (!delegates)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v6 = self->_delegates;
    self->_delegates = v5;

    delegates = self->_delegates;
  }
  -[NSHashTable addObject:](delegates, "addObject:", v7);
  os_unfair_lock_unlock(&self->_delegatesLock);

}

- (void)removeDelegate:(id)a3
{
  os_unfair_lock_s *p_delegatesLock;
  id v5;

  p_delegatesLock = &self->_delegatesLock;
  v5 = a3;
  os_unfair_lock_lock(p_delegatesLock);
  -[NSHashTable removeObject:](self->_delegates, "removeObject:", v5);

  os_unfair_lock_unlock(p_delegatesLock);
}

- (NSArray)remoteDevices
{
  NSObject *internalQueue;
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
  v9 = __Block_byref_object_copy__75;
  v10 = __Block_byref_object_dispose__75;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__PKIDSManager_remoteDevices__block_invoke;
  v5[3] = &unk_1E2AC1F78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __29__PKIDSManager_remoteDevices__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)paymentRequests
{
  NSObject *internalQueue;
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
  v9 = __Block_byref_object_copy__75;
  v10 = __Block_byref_object_dispose__75;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__PKIDSManager_paymentRequests__block_invoke;
  v5[3] = &unk_1E2AC1F78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __31__PKIDSManager_paymentRequests__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)hasRemoteDevices
{
  NSObject *internalQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__PKIDSManager_hasRemoteDevices__block_invoke;
  v5[3] = &unk_1E2AC1F78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__PKIDSManager_hasRemoteDevices__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_hasRemoteDevices");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)discoverRemoteDevices
{
  -[PKIDSManager discoverRemoteDevicesWithProximity:](self, "discoverRemoteDevicesWithProximity:", 1);
}

- (void)discoverRemoteDevicesWithProximity:(BOOL)a3
{
  NSObject *internalQueue;
  _QWORD v4[5];
  BOOL v5;

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__PKIDSManager_discoverRemoteDevicesWithProximity___block_invoke;
  v4[3] = &unk_1E2ABE1C0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(internalQueue, v4);
}

void __51__PKIDSManager_discoverRemoteDevicesWithProximity___block_invoke(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  BOOL v4;
  unsigned int v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _QWORD *v13;
  void *v14;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_hasRegisteredAccounts");
  v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_hasRemoteDevices");
  if (v2)
    v4 = v3 == 0;
  else
    v4 = 1;
  if (v4)
  {
    v5 = v3;
    PKLogFacilityTypeGetObject(8uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 134218496;
      v21 = v7;
      v22 = 2048;
      v23 = v2;
      v24 = 2048;
      v25 = v5;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "PKIDSManager: skipped discovering remote devices, proximityEnabled: %ld, hasRegisteredAccounts: %ld, hasRemoteDevices: %ld", buf, 0x20u);
    }

  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "setProximityState:", 2);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
      }
      while (v10);
    }

    v13 = *(_QWORD **)(a1 + 32);
    if (*(_BYTE *)(a1 + 40))
    {
      v14 = (void *)v13[5];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __51__PKIDSManager_discoverRemoteDevicesWithProximity___block_invoke_2;
      v15[3] = &unk_1E2AC0EF0;
      v15[4] = v13;
      objc_msgSend(v14, "startAdvertisingForDuration:completion:", v15, 30.0);
    }
    else
    {
      objc_msgSend(v13, "_queue_sendDeviceDiscoveryRequestToAllDevicesWithProximity:", 0);
    }
    objc_msgSend(*(id *)(a1 + 32), "_queue_logCloudPairingState");
  }
}

void __51__PKIDSManager_discoverRemoteDevicesWithProximity___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 120);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__PKIDSManager_discoverRemoteDevicesWithProximity___block_invoke_3;
  v7[3] = &unk_1E2ABE0D0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __51__PKIDSManager_discoverRemoteDevicesWithProximity___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "_queue_sendDeviceDiscoveryRequestToAllDevicesWithProximity:", *(_QWORD *)(a1 + 32) == 0);
}

- (id)sendSetupRequest:(id)a3 appDisplayName:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  PKIDSManager *v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  internalQueue = self->_internalQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__PKIDSManager_sendSetupRequest_appDisplayName_completion___block_invoke;
  v16[3] = &unk_1E2ABE1E8;
  v17 = v9;
  v18 = self;
  v19 = v8;
  v20 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_sync(internalQueue, v16);

  return 0;
}

void __59__PKIDSManager_sendSetupRequest_appDisplayName_completion___block_invoke(uint64_t a1)
{
  PKProtobufPaymentSetupRequest *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;

  v2 = objc_alloc_init(PKProtobufPaymentSetupRequest);
  -[PKProtobufPaymentSetupRequest setAppName:](v2, "setAppName:", *(_QWORD *)(a1 + 32));
  v3 = objc_alloc(MEMORY[0x1E0D34E08]);
  -[PKProtobufPaymentSetupRequest data](v2, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithProtobufData:type:isResponse:", v4, 7, 0);

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__75;
  v12[4] = __Block_byref_object_dispose__75;
  v13 = 0;
  v6 = *(void **)(*(_QWORD *)(a1 + 40) + 104);
  objc_msgSend(*(id *)(a1 + 48), "pk_idsDestination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__PKIDSManager_sendSetupRequest_appDisplayName_completion___block_invoke_2;
  v9[3] = &unk_1E2AD9DF0;
  v8 = *(id *)(a1 + 56);
  v9[4] = *(_QWORD *)(a1 + 40);
  v10 = v8;
  v11 = v12;
  PKProtobufSend(v6, v5, (uint64_t)v7, 0, 0, v9);

  _Block_object_dispose(v12, 8);
}

void __59__PKIDSManager_sendSetupRequest_appDisplayName_completion___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a2;
  v7 = a3;
  if (v7 && (v8 = (void *)a1[5]) != 0)
  {
    v9 = *(NSObject **)(a1[4] + 64);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__PKIDSManager_sendSetupRequest_appDisplayName_completion___block_invoke_3;
    v13[3] = &unk_1E2ABDA18;
    v15 = v8;
    v14 = v7;
    dispatch_async(v9, v13);

  }
  else if (v6)
  {
    v10 = (void *)a1[5];
    if (v10)
    {
      v11 = *(void **)(a1[4] + 24);
      v12 = (void *)objc_msgSend(v10, "copy");
      objc_msgSend(v11, "setObject:forKey:", v12, v6);

      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    }
  }

}

uint64_t __59__PKIDSManager_sendSetupRequest_appDisplayName_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)sendRemotePaymentRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__75;
  v21 = __Block_byref_object_dispose__75;
  v22 = 0;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__PKIDSManager_sendRemotePaymentRequest_completion___block_invoke;
  v13[3] = &unk_1E2AD9E18;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(internalQueue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __52__PKIDSManager_sendRemotePaymentRequest_completion___block_invoke(uint64_t a1)
{
  PKProtobufRemotePaymentRequest *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "startAdvertisingForDuration:completion:", 0, 30.0);
  v2 = objc_alloc_init(PKProtobufRemotePaymentRequest);
  objc_msgSend(*(id *)(a1 + 40), "paymentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "protobuf");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufRemotePaymentRequest setPaymentRequest:](v2, "setPaymentRequest:", v4);

  objc_msgSend(*(id *)(a1 + 40), "selectedApplicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufRemotePaymentRequest setPaymentApplicationIdentifier:](v2, "setPaymentApplicationIdentifier:", v5);

  -[PKProtobufRemotePaymentRequest setPaymentType:](v2, "setPaymentType:", objc_msgSend(*(id *)(a1 + 40), "selectedPaymentMethodType"));
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufRemotePaymentRequest setIdentifier:](v2, "setIdentifier:", v6);

  v7 = objc_alloc(MEMORY[0x1E0D34E08]);
  -[PKProtobufRemotePaymentRequest data](v2, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithProtobufData:type:isResponse:", v8, 2, 0);

  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  objc_msgSend(*(id *)(a1 + 40), "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pk_idsDestination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__PKIDSManager_sendRemotePaymentRequest_completion___block_invoke_2;
  v14[3] = &unk_1E2AD9DF0;
  v13 = *(id *)(a1 + 48);
  v14[4] = *(_QWORD *)(a1 + 32);
  v15 = v13;
  v16 = *(_QWORD *)(a1 + 56);
  PKProtobufSend(v10, v9, (uint64_t)v12, 0, 0, v14);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

void __52__PKIDSManager_sendRemotePaymentRequest_completion___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a2;
  v7 = a3;
  if (v7 && (v8 = (void *)a1[5]) != 0)
  {
    v9 = *(NSObject **)(a1[4] + 64);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__PKIDSManager_sendRemotePaymentRequest_completion___block_invoke_3;
    v13[3] = &unk_1E2ABDA18;
    v15 = v8;
    v14 = v7;
    dispatch_async(v9, v13);

  }
  else if (v6)
  {
    v10 = (void *)a1[5];
    if (v10)
    {
      v11 = *(void **)(a1[4] + 24);
      v12 = (void *)objc_msgSend(v10, "copy");
      objc_msgSend(v11, "setObject:forKey:", v12, v6);

      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    }
  }

}

uint64_t __52__PKIDSManager_sendRemotePaymentRequest_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)sendPaymentHostUpdate:(id)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v18;
  id v19;
  PKIDSManager *v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__75;
  v27 = __Block_byref_object_dispose__75;
  v28 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PKIDSManager_sendPaymentHostUpdate_forRemotePaymentRequest_completion___block_invoke;
  block[3] = &unk_1E2AD0CC0;
  v18 = v8;
  v19 = v9;
  v20 = self;
  v21 = v10;
  v22 = &v23;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(internalQueue, block);
  v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __73__PKIDSManager_sendPaymentHostUpdate_forRemotePaymentRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemotePaymentRequestIdentifier:", v3);

  v4 = objc_alloc(MEMORY[0x1E0D34E08]);
  objc_msgSend(v2, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithProtobufData:type:isResponse:", v5, 4, 0);

  v7 = *(void **)(*(_QWORD *)(a1 + 48) + 104);
  objc_msgSend(*(id *)(a1 + 40), "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pk_idsDestination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__PKIDSManager_sendPaymentHostUpdate_forRemotePaymentRequest_completion___block_invoke_2;
  v11[3] = &unk_1E2AD9DF0;
  v10 = *(id *)(a1 + 56);
  v11[4] = *(_QWORD *)(a1 + 48);
  v12 = v10;
  v13 = *(_QWORD *)(a1 + 64);
  PKProtobufSend(v7, v6, (uint64_t)v9, 0, 0, v11);

}

void __73__PKIDSManager_sendPaymentHostUpdate_forRemotePaymentRequest_completion___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a2;
  v7 = a3;
  if (v7 && (v8 = (void *)a1[5]) != 0)
  {
    v9 = *(NSObject **)(a1[4] + 64);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __73__PKIDSManager_sendPaymentHostUpdate_forRemotePaymentRequest_completion___block_invoke_3;
    v13[3] = &unk_1E2ABDA18;
    v15 = v8;
    v14 = v7;
    dispatch_async(v9, v13);

  }
  else if (v6)
  {
    v10 = (void *)a1[5];
    if (v10)
    {
      v11 = *(void **)(a1[4] + 24);
      v12 = (void *)objc_msgSend(v10, "copy");
      objc_msgSend(v11, "setObject:forKey:", v12, v6);

      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    }
  }

}

uint64_t __73__PKIDSManager_sendPaymentHostUpdate_forRemotePaymentRequest_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)sendPaymentClientUpdate:(id)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v18;
  id v19;
  PKIDSManager *v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__75;
  v27 = __Block_byref_object_dispose__75;
  v28 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PKIDSManager_sendPaymentClientUpdate_forRemotePaymentRequest_completion___block_invoke;
  block[3] = &unk_1E2AD0CC0;
  v18 = v8;
  v19 = v9;
  v20 = self;
  v21 = v10;
  v22 = &v23;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(internalQueue, block);
  v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __75__PKIDSManager_sendPaymentClientUpdate_forRemotePaymentRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemotePaymentRequestIdentifier:", v3);

  v4 = objc_alloc(MEMORY[0x1E0D34E08]);
  objc_msgSend(v2, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithProtobufData:type:isResponse:", v5, 3, 0);

  v7 = *(void **)(*(_QWORD *)(a1 + 48) + 104);
  objc_msgSend(*(id *)(a1 + 40), "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pk_idsDestination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__PKIDSManager_sendPaymentClientUpdate_forRemotePaymentRequest_completion___block_invoke_2;
  v11[3] = &unk_1E2AD9DF0;
  v10 = *(id *)(a1 + 56);
  v11[4] = *(_QWORD *)(a1 + 48);
  v12 = v10;
  v13 = *(_QWORD *)(a1 + 64);
  PKProtobufSend(v7, v6, (uint64_t)v9, 0, 0, v11);

}

void __75__PKIDSManager_sendPaymentClientUpdate_forRemotePaymentRequest_completion___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a2;
  v7 = a3;
  if (v7 && (v8 = (void *)a1[5]) != 0)
  {
    v9 = *(NSObject **)(a1[4] + 64);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __75__PKIDSManager_sendPaymentClientUpdate_forRemotePaymentRequest_completion___block_invoke_3;
    v13[3] = &unk_1E2ABDA18;
    v15 = v8;
    v14 = v7;
    dispatch_async(v9, v13);

  }
  else if (v6)
  {
    v10 = (void *)a1[5];
    if (v10)
    {
      v11 = *(void **)(a1[4] + 24);
      v12 = (void *)objc_msgSend(v10, "copy");
      objc_msgSend(v11, "setObject:forKey:", v12, v6);

      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    }
  }

}

uint64_t __75__PKIDSManager_sendPaymentClientUpdate_forRemotePaymentRequest_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)sendPayment:(id)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v18;
  id v19;
  PKIDSManager *v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__75;
  v27 = __Block_byref_object_dispose__75;
  v28 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PKIDSManager_sendPayment_forRemotePaymentRequest_completion___block_invoke;
  block[3] = &unk_1E2AD0CC0;
  v18 = v9;
  v19 = v8;
  v20 = self;
  v21 = v10;
  v22 = &v23;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_sync(internalQueue, block);
  v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __63__PKIDSManager_sendPayment_forRemotePaymentRequest_completion___block_invoke(uint64_t a1)
{
  PKProtobufRemotePaymentResponse *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;

  AnalyticsSendEvent();
  v2 = objc_alloc_init(PKProtobufRemotePaymentResponse);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufRemotePaymentResponse setRemotePaymentRequestIdentifier:](v2, "setRemotePaymentRequestIdentifier:", v3);

  objc_msgSend(*(id *)(a1 + 40), "protobuf");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufRemotePaymentResponse setPayment:](v2, "setPayment:", v4);

  v5 = objc_alloc(MEMORY[0x1E0D34E08]);
  -[PKProtobufRemotePaymentResponse data](v2, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithProtobufData:type:isResponse:", v6, 2, 1);

  v8 = *(void **)(*(_QWORD *)(a1 + 48) + 104);
  objc_msgSend(*(id *)(a1 + 32), "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pk_idsDestination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__PKIDSManager_sendPayment_forRemotePaymentRequest_completion___block_invoke_2;
  v12[3] = &unk_1E2AD9DF0;
  v11 = *(id *)(a1 + 56);
  v12[4] = *(_QWORD *)(a1 + 48);
  v13 = v11;
  v14 = *(_QWORD *)(a1 + 64);
  PKProtobufSend(v8, v7, (uint64_t)v10, 0, 0, v12);

}

void __63__PKIDSManager_sendPayment_forRemotePaymentRequest_completion___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a2;
  v7 = a3;
  if (v7 && (v8 = (void *)a1[5]) != 0)
  {
    v9 = *(NSObject **)(a1[4] + 64);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __63__PKIDSManager_sendPayment_forRemotePaymentRequest_completion___block_invoke_3;
    v13[3] = &unk_1E2ABDA18;
    v15 = v8;
    v14 = v7;
    dispatch_async(v9, v13);

  }
  else if (v6)
  {
    v10 = (void *)a1[5];
    if (v10)
    {
      v11 = *(void **)(a1[4] + 24);
      v12 = (void *)objc_msgSend(v10, "copy");
      objc_msgSend(v11, "setObject:forKey:", v12, v6);

      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    }
  }

}

uint64_t __63__PKIDSManager_sendPayment_forRemotePaymentRequest_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)sendPaymentResult:(id)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__75;
  v26 = __Block_byref_object_dispose__75;
  v27 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PKIDSManager_sendPaymentResult_forRemotePaymentRequest_completion___block_invoke;
  block[3] = &unk_1E2AD0CC0;
  block[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v21 = &v22;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(internalQueue, block);
  v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v15;
}

void __69__PKIDSManager_sendPaymentResult_forRemotePaymentRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  PKProtobufPaymentStatus *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_paymentAuthorizationStatusForPaymentResult:forRemotePaymentRequest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = objc_alloc_init(PKProtobufPaymentStatus);
  -[PKProtobufPaymentStatus setStatus:](v3, "setStatus:", v2);
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentStatus setRemotePaymentRequestIdentifier:](v3, "setRemotePaymentRequestIdentifier:", v4);

  v5 = objc_alloc(MEMORY[0x1E0D34E08]);
  -[PKProtobufPaymentStatus data](v3, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithProtobufData:type:isResponse:", v6, 5, 0);

  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  objc_msgSend(*(id *)(a1 + 48), "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pk_idsDestination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__PKIDSManager_sendPaymentResult_forRemotePaymentRequest_completion___block_invoke_2;
  v12[3] = &unk_1E2AD9DF0;
  v11 = *(id *)(a1 + 56);
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v11;
  v14 = *(_QWORD *)(a1 + 64);
  PKProtobufSend(v8, v7, (uint64_t)v10, 0, 0, v12);

  if (!v2)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 48));

}

void __69__PKIDSManager_sendPaymentResult_forRemotePaymentRequest_completion___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a2;
  v7 = a3;
  if (v7 && (v8 = (void *)a1[5]) != 0)
  {
    v9 = *(NSObject **)(a1[4] + 64);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __69__PKIDSManager_sendPaymentResult_forRemotePaymentRequest_completion___block_invoke_3;
    v13[3] = &unk_1E2ABDA18;
    v15 = v8;
    v14 = v7;
    dispatch_async(v9, v13);

  }
  else if (v6)
  {
    v10 = (void *)a1[5];
    if (v10)
    {
      v11 = *(void **)(a1[4] + 24);
      v12 = (void *)objc_msgSend(v10, "copy");
      objc_msgSend(v11, "setObject:forKey:", v12, v6);

      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    }
  }

}

uint64_t __69__PKIDSManager_sendPaymentResult_forRemotePaymentRequest_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)sendPaymentStatus:(int64_t)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  PKPaymentAuthorizationResult *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = objc_alloc_init(PKPaymentAuthorizationResult);
  -[PKPaymentAuthorizationResult setStatus:](v10, "setStatus:", a3);
  -[PKIDSManager sendPaymentResult:forRemotePaymentRequest:completion:](self, "sendPaymentResult:forRemotePaymentRequest:completion:", v10, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)cancelRemotePaymentRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__75;
  v21 = __Block_byref_object_dispose__75;
  v22 = 0;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__PKIDSManager_cancelRemotePaymentRequest_completion___block_invoke;
  v13[3] = &unk_1E2AD9E18;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(internalQueue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __54__PKIDSManager_cancelRemotePaymentRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_cancelRemotePaymentRequest:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)requestInstrumentThumbnail:(id)a3 forRemoteDevice:(id)a4 size:(CGSize)a5 completion:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v10;
  id v11;
  NSObject *internalQueue;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  PKIDSManager *v19;
  id v20;
  uint64_t *v21;
  CGFloat v22;
  CGFloat v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  height = a5.height;
  width = a5.width;
  v10 = a3;
  v11 = a6;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__75;
  v28 = __Block_byref_object_dispose__75;
  v29 = 0;
  internalQueue = self->_internalQueue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke;
  v17[3] = &unk_1E2AD9EB8;
  v22 = width;
  v23 = height;
  v18 = v10;
  v19 = self;
  v20 = v11;
  v21 = &v24;
  v13 = v11;
  v14 = v10;
  dispatch_sync(internalQueue, v17);
  v15 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v15;
}

void __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  PKProtobufPaymentInstrumentThumbnailRequest *v15;
  PKProtobufPaymentInstrumentThumbnailRequest *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  PKProtobufPaymentInstrumentThumbnailRequest *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  _QWORD block[4];
  id v45;
  PKProtobufPaymentInstrumentThumbnailRequest *v46;
  _QWORD v47[5];
  PKProtobufPaymentInstrumentThumbnailRequest *v48;
  id v49;
  uint64_t v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  _QWORD v56[4];
  PKProtobufPaymentInstrumentThumbnailRequest *v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "manifestHash");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hexEncoding");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKRemotePaymentInstrument thumbnailCachePathForManifestHash:size:](PKRemotePaymentInstrument, "thumbnailCachePathForManifestHash:size:", v3, *(double *)(a1 + 64), *(double *)(a1 + 72));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PKLogFacilityTypeGetObject(8uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "passIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "manifestHash");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hexEncoding");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v59 = v4;
    v60 = 2112;
    v61 = v6;
    v62 = 2112;
    v63 = v8;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Looking for card thumbnail: %@ for instrument: %@ with manifest: %@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v4, 0);

  if (!v10
    || (objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v4),
        (v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v16 = objc_alloc_init(PKProtobufPaymentInstrumentThumbnailRequest);
    objc_msgSend(*(id *)(a1 + 32), "passIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPaymentInstrumentThumbnailRequest setPassIdentifier:](v16, "setPassIdentifier:", v17);

    objc_msgSend(*(id *)(a1 + 32), "manifestHash");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hexEncoding");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPaymentInstrumentThumbnailRequest setManifestHash:](v16, "setManifestHash:", v19);

    -[PKProtobufPaymentInstrumentThumbnailRequest setWidth:](v16, "setWidth:", *(double *)(a1 + 64));
    -[PKProtobufPaymentInstrumentThumbnailRequest setHeight:](v16, "setHeight:", *(double *)(a1 + 72));
    v20 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    v21 = MEMORY[0x1E0C809B0];
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_45;
    v56[3] = &unk_1E2AD9E40;
    v15 = v16;
    v57 = v15;
    objc_msgSend(v20, "keysOfEntriesPassingTest:", v56);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "count"))
    {
      objc_msgSend(v22, "anyObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "requestIdentifier");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v26 = *(void **)(v25 + 40);
      *(_QWORD *)(v25 + 40) = v24;

      v27 = *(_QWORD *)(a1 + 48);
      if (v27)
        objc_msgSend(*(id *)(a1 + 40), "_queue_addThumbnailCompletionHandler:forKey:", v27, v23);

    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      v28 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v29 = *(void **)(a1 + 32);
      v30 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
      v53[0] = v21;
      v53[1] = 3221225472;
      v53[2] = __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_2;
      v53[3] = &unk_1E2AD9E68;
      v54 = v29;
      v31 = v28;
      v55 = v31;
      objc_msgSend(v30, "enumerateObjectsUsingBlock:", v53);
      if (objc_msgSend(v31, "count"))
      {
        v32 = objc_alloc(MEMORY[0x1E0D34E08]);
        -[PKProtobufPaymentInstrumentThumbnailRequest data](v15, "data");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(v32, "initWithProtobufData:type:isResponse:", v33, 8, 0);

        v35 = *(void **)(a1 + 48);
        v36 = *(void **)(*(_QWORD *)(a1 + 40) + 104);
        v47[0] = v21;
        v47[1] = 3221225472;
        v47[2] = __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_2_51;
        v47[3] = &unk_1E2AD9E90;
        v37 = v35;
        v38 = *(_QWORD *)(a1 + 40);
        v49 = v37;
        v47[4] = v38;
        v39 = v15;
        v40 = *(_QWORD *)(a1 + 56);
        v48 = v39;
        v50 = v40;
        PKProtobufSendWithOptions(v36, v34, v31, 300, 0, 1, 0, v47, 0);

      }
      else
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v41 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          v59 = v41;
          _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Couldn't find remote device to send thumbnail request: %@", buf, 0xCu);
        }

        v42 = *(void **)(a1 + 48);
        v43 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 64);
        v51[0] = v21;
        v51[1] = 3221225472;
        v51[2] = __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_49;
        v51[3] = &unk_1E2ABD9A0;
        v52 = v42;
        dispatch_async(v43, v51);
        v34 = v52;
      }

    }
    v12 = 0;
    goto LABEL_21;
  }
  v12 = (id)v11;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Found cached image", buf, 2u);
  }

  v13 = *(void **)(a1 + 48);
  if (v13)
  {
    v14 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 64);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_53;
    block[3] = &unk_1E2ABDA18;
    v46 = v13;
    v12 = v12;
    v45 = v12;
    dispatch_async(v14, block);

    v15 = v46;
LABEL_21:

  }
}

uint64_t __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_45(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "requestDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToDictionary:", v4);

  return v5;
}

void __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v3, "remotePaymentInstruments", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "passIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "passIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToString:", v10);

        if (v11)
        {
          v12 = *(void **)(a1 + 40);
          objc_msgSend(v3, "pk_idsDestination");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v13);

          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

}

void __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_49(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_2_51(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  PKRemoteThumbnailKey *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a2;
  v7 = a3;
  if (v7 && (v8 = *(void **)(a1 + 48)) != 0)
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_3;
    v12[3] = &unk_1E2ABDA18;
    v14 = v8;
    v13 = v7;
    dispatch_async(v9, v12);

  }
  else if (v6 && *(_QWORD *)(a1 + 48))
  {
    v10 = objc_alloc_init(PKRemoteThumbnailKey);
    -[PKRemoteThumbnailKey setRequestIdentifier:](v10, "setRequestIdentifier:", v6);
    objc_msgSend(*(id *)(a1 + 40), "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRemoteThumbnailKey setRequestDictionary:](v10, "setRequestDictionary:", v11);

    objc_msgSend(*(id *)(a1 + 32), "_queue_addThumbnailCompletionHandler:forKey:", *(_QWORD *)(a1 + 48), v10);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);

  }
}

uint64_t __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_53(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)invalidateMessage:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__PKIDSManager_invalidateMessage___block_invoke;
  block[3] = &unk_1E2ABE0D0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(internalQueue, block);

}

uint64_t __34__PKIDSManager_invalidateMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (id)requestForIdentifier:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__75;
  v16 = __Block_byref_object_dispose__75;
  v17 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__PKIDSManager_requestForIdentifier___block_invoke;
  block[3] = &unk_1E2AD9EE0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __37__PKIDSManager_requestForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_requestForIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)promptDetailsForVirtualCard:(id)a3 showNotification:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PKIDSManager_promptDetailsForVirtualCard_showNotification_completion___block_invoke;
  block[3] = &unk_1E2ABE210;
  block[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_sync(internalQueue, block);

}

void __72__PKIDSManager_promptDetailsForVirtualCard_showNotification_completion___block_invoke(uint64_t a1)
{
  PKProtobufPromptDetailsForVirtualCard *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "startAdvertisingForDuration:completion:", 0, 30.0);
  v2 = objc_alloc_init(PKProtobufPromptDetailsForVirtualCard);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPromptDetailsForVirtualCard setIdentifier:](v2, "setIdentifier:", v3);

  -[PKProtobufPromptDetailsForVirtualCard setShowNotification:](v2, "setShowNotification:", *(unsigned __int8 *)(a1 + 56));
  v4 = objc_alloc(MEMORY[0x1E0D34E08]);
  -[PKProtobufPromptDetailsForVirtualCard data](v2, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithProtobufData:type:isResponse:", v5, 9, 0);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__PKIDSManager_promptDetailsForVirtualCard_showNotification_completion___block_invoke_2;
  v15[3] = &unk_1E2AD9F08;
  v16 = v7;
  v10 = v7;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v15);
  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __72__PKIDSManager_promptDetailsForVirtualCard_showNotification_completion___block_invoke_3;
  v13[3] = &unk_1E2ABE828;
  v12 = *(id *)(a1 + 48);
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v12;
  PKProtobufSendWithOptions(v11, v6, v10, 300, 0, 1, 0, v13, 0);

}

void __72__PKIDSManager_promptDetailsForVirtualCard_showNotification_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_msgSend(v5, "type") == 1 || objc_msgSend(v5, "type") == 2) && !objc_msgSend(v5, "proximityState"))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v5, "pk_idsDestination");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

void __72__PKIDSManager_promptDetailsForVirtualCard_showNotification_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PKLogFacilityTypeGetObject(8uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Failed to send prompt details for virtual card request: %@", buf, 0xCu);
    }

  }
  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72__PKIDSManager_promptDetailsForVirtualCard_showNotification_completion___block_invoke_55;
    v10[3] = &unk_1E2ABDA18;
    v12 = v8;
    v11 = v6;
    dispatch_async(v9, v10);

  }
}

uint64_t __72__PKIDSManager_promptDetailsForVirtualCard_showNotification_completion___block_invoke_55(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_paymentSetupRequestReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  void *v10;
  NSObject *v11;
  PKProtobufPaymentSetupRequest *v12;
  void *v13;
  PKProtobufPaymentSetupRequest *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *callbackQueue;
  id v23;
  _QWORD block[5];
  PKProtobufPaymentSetupRequest *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[16];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[IDSService deviceForFromID:](self->_service, "deviceForFromID:", a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    PKLogFacilityTypeGetObject(8uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Received payment setup request", buf, 2u);
    }

    -[PKIDSManager _postCTLMThrottleUncapNotification](self, "_postCTLMThrottleUncapNotification");
    v12 = [PKProtobufPaymentSetupRequest alloc];
    v23 = v9;
    objc_msgSend(v9, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PKProtobufPaymentSetupRequest initWithData:](v12, "initWithData:", v13);

    -[PKIDSManager delegates](self, "delegates");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v27;
      v19 = MEMORY[0x1E0C809B0];
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v27 != v18)
            objc_enumerationMutation(v15);
          v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v20);
          callbackQueue = self->_callbackQueue;
          block[0] = v19;
          block[1] = 3221225472;
          block[2] = __76__PKIDSManager__paymentSetupRequestReceived_service_account_fromID_context___block_invoke;
          block[3] = &unk_1E2ABE0D0;
          block[4] = v21;
          v25 = v14;
          dispatch_async(callbackQueue, block);

          ++v20;
        }
        while (v17 != v20);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v17);
    }

    v9 = v23;
  }

}

void __76__PKIDSManager__paymentSetupRequestReceived_service_account_fromID_context___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "appName");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "didReceiveSetupRequest:", v3);

  }
}

- (void)_paymentDiscoveryRequestReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  PKProtobufPaymentDeviceRequest *v23;
  void *v24;
  PKProtobufPaymentDeviceRequest *v25;
  _BOOL4 v26;
  PKProximityDetector *v27;
  void *v28;
  PKProximityDetector *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  _QWORD aBlock[5];
  id v38;
  uint8_t *v39;
  uint8_t buf[8];
  uint8_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint8_t v46[4];
  id v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v34 = a4;
  v35 = a5;
  v13 = a6;
  v36 = a7;
  PKLogFacilityTypeGetObject(8uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Received discovery request", buf, 2u);
  }

  -[IDSService deviceForFromID:](self->_service, "deviceForFromID:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PKIDSManager _queue_deviceIsRegistered:](self, "_queue_deviceIsRegistered:", v15);

  if (v16)
  {
    -[IDSService deviceForFromID:](self->_service, "deviceForFromID:", v13, v34, v35, v36);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v41 = buf;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__75;
    v44 = __Block_byref_object_dispose__75;
    v45 = 0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v17, "name");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "uniqueID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v46 = 138412546;
      v47 = v18;
      v48 = 2112;
      v49 = v19;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Received payment discovery request from %@ - %@", v46, 0x16u);

    }
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    objc_msgSend(v20, "setObject:forKeyedSubscript:", CFSTR("discovery-request"), CFSTR("message"));
    v21 = -[PKIDSManagerDataSource continuityDisabledByUser:](self->_dataSource, "continuityDisabledByUser:", self);
    if ((v21 & 1) != 0)
    {
      v22 = 0;
    }
    else
    {
      v23 = [PKProtobufPaymentDeviceRequest alloc];
      objc_msgSend(v12, "data");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[PKProtobufPaymentDeviceRequest initWithData:](v23, "initWithData:", v24);

      v26 = -[PKProtobufPaymentDeviceRequest shouldAdvertise](v25, "shouldAdvertise");
      v22 = v26;
      if (v26)
      {
        v27 = [PKProximityDetector alloc];
        objc_msgSend(v17, "nsuuid");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[PKProximityDetector initWithAdvertisingDeviceUUID:](v27, "initWithAdvertisingDeviceUUID:", v28);

        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __80__PKIDSManager__paymentDiscoveryRequestReceived_service_account_fromID_context___block_invoke;
        aBlock[3] = &unk_1E2AD9F58;
        aBlock[4] = self;
        v39 = buf;
        v38 = v13;
        v30 = _Block_copy(aBlock);
        -[PKProximityDetector setHandler:](v29, "setHandler:", v30);
        -[PKProximityDetector startDetectingWithDuration:completion:](v29, "startDetectingWithDuration:completion:", 0, 30.0);
        objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("proximity"));

      }
      else
      {
        objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("proximity"));
      }

    }
    -[PKIDSManager _preparePaymentDeviceResponseForRequestingDevice:userDisabled:](self, "_preparePaymentDeviceResponseForRequestingDevice:userDisabled:", v17, v21);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)*((_QWORD *)v41 + 5);
    *((_QWORD *)v41 + 5) = v31;

    if (!v22)
      -[PKIDSManager _queue_sendDiscoveryResponse:toDeviceWithFromID:](self, "_queue_sendDiscoveryResponse:toDeviceWithFromID:", *((_QWORD *)v41 + 5), v13);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*((id *)v41 + 5), "locked"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v33, CFSTR("locked"));

    AnalyticsSendEvent();
    -[PKIDSManager _queue_logCloudPairingState](self, "_queue_logCloudPairingState");

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Received payment discovery request, ignoring (device not recognized)", buf, 2u);
    }
    v17 = v14;
  }

}

void __80__PKIDSManager__paymentDiscoveryRequestReceived_service_account_fromID_context___block_invoke(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[5];
  id v13;
  __int128 v14;
  char v15;

  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 120);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PKIDSManager__paymentDiscoveryRequestReceived_service_account_fromID_context___block_invoke_2;
  block[3] = &unk_1E2AD9F30;
  v15 = a4;
  block[4] = v7;
  v13 = v6;
  v11 = *(_OWORD *)(a1 + 40);
  v9 = (id)v11;
  v14 = v11;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __80__PKIDSManager__paymentDiscoveryRequestReceived_service_account_fromID_context___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = *(unsigned __int8 *)(a1 + 64);
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v2)
    v4 = 1;
  else
    v4 = 2;
  objc_msgSend(v3, "setNearby:", v4);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 112);
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, *(_QWORD *)(a1 + 40));

  }
  else
  {
    objc_msgSend(*(id *)(v5 + 112), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_sendDiscoveryResponse:toDeviceWithFromID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 48));
}

- (void)_paymentRequestReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  void *v10;
  PKProtobufRemotePaymentRequest *v11;
  void *v12;
  PKProtobufRemotePaymentRequest *v13;
  NSMutableArray *pendingCancellations;
  void *v15;
  int v16;
  NSObject *v17;
  _BOOL4 v18;
  const char *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void (**v23)(_QWORD);
  NSMutableDictionary *recentlySeenUUIDs;
  void *v25;
  void *v26;
  double v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  PKProximityDetector *v31;
  void *v32;
  PKProximityDetector *v33;
  void *v34;
  _QWORD v35[5];
  void (**v36)(_QWORD);
  _QWORD v37[5];
  id v38;
  _QWORD aBlock[4];
  NSObject *v40;
  id v41;
  PKIDSManager *v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[IDSService deviceForFromID:](self->_service, "deviceForFromID:", a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [PKProtobufRemotePaymentRequest alloc];
  objc_msgSend(v9, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PKProtobufRemotePaymentRequest initWithData:](v11, "initWithData:", v12);

  pendingCancellations = self->_pendingCancellations;
  -[PKProtobufRemotePaymentRequest identifier](v13, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[NSMutableArray containsObject:](pendingCancellations, "containsObject:", v15);

  if ((-[PKIDSManagerDataSource continuityDisabledByUser:](self->_dataSource, "continuityDisabledByUser:", self) & 1) != 0
    || ((!-[PKIDSManager _queue_deviceIsRegistered:](self, "_queue_deviceIsRegistered:", v10) | v16) & 1) != 0)
  {
    PKLogFacilityTypeGetObject(8uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if ((v16 & 1) != 0)
    {
      if (v18)
      {
        *(_WORD *)buf = 0;
        v19 = "Received payment request but handoff is disabled or device unrecognized. Ignoring.";
LABEL_8:
        _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
      }
    }
    else if (v18)
    {
      *(_WORD *)buf = 0;
      v19 = "Received payment request but was previously cancelled. Ignoring.";
      goto LABEL_8;
    }
  }
  else
  {
    AnalyticsSendEvent();
    v20 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __71__PKIDSManager__paymentRequestReceived_service_account_fromID_context___block_invoke;
    aBlock[3] = &unk_1E2ABE0F8;
    v40 = v9;
    v21 = v10;
    v41 = v21;
    v42 = self;
    v37[0] = v20;
    v37[1] = 3221225472;
    v37[2] = __71__PKIDSManager__paymentRequestReceived_service_account_fromID_context___block_invoke_3;
    v37[3] = &unk_1E2ABE058;
    v37[4] = self;
    v22 = _Block_copy(aBlock);
    v38 = v22;
    v23 = (void (**)(_QWORD))_Block_copy(v37);
    recentlySeenUUIDs = self->_recentlySeenUUIDs;
    objc_msgSend(v21, "nsuuid");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](recentlySeenUUIDs, "objectForKey:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26 && (objc_msgSend(v26, "timeIntervalSinceNow"), v27 > -300.0))
    {
      PKLogFacilityTypeGetObject(8uLL);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v28, OS_LOG_TYPE_DEFAULT, "Found device in recently seen devices. Displaying payment request", buf, 2u);
      }

      v23[2](v23);
    }
    else
    {
      PKLogFacilityTypeGetObject(8uLL);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "Device not found in recently seen devices. Triggering proximity detection", buf, 2u);
      }

      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        -[NSMutableDictionary description](self->_recentlySeenUUIDs, "description");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v44 = v30;
        _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "Recently seen devices: %@", buf, 0xCu);

        v20 = MEMORY[0x1E0C809B0];
      }

      v31 = [PKProximityDetector alloc];
      objc_msgSend(v21, "nsuuid");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[PKProximityDetector initWithAdvertisingDeviceUUID:](v31, "initWithAdvertisingDeviceUUID:", v32);

      v35[0] = v20;
      v35[1] = 3221225472;
      v35[2] = __71__PKIDSManager__paymentRequestReceived_service_account_fromID_context___block_invoke_82;
      v35[3] = &unk_1E2AD9F80;
      v35[4] = self;
      v36 = v23;
      v34 = _Block_copy(v35);
      -[PKProximityDetector setHandler:](v33, "setHandler:", v34);
      -[PKProximityDetector startDetectingWithDuration:completion:](v33, "startDetectingWithDuration:completion:", 0, 30.0);

    }
    v17 = v40;
  }

}

void __71__PKIDSManager__paymentRequestReceived_service_account_fromID_context___block_invoke(uint64_t a1)
{
  PKProtobufRemotePaymentRequest *v2;
  void *v3;
  PKProtobufRemotePaymentRequest *v4;
  PKRemoteDevice *v5;
  PKRemotePaymentRequest *v6;
  void *v7;
  PKRemotePaymentRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  NSObject *v21;
  PKProtobufRemotePaymentRequest *v22;
  _QWORD block[5];
  PKRemotePaymentRequest *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = [PKProtobufRemotePaymentRequest alloc];
  objc_msgSend(*(id *)(a1 + 32), "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKProtobufRemotePaymentRequest initWithData:](v2, "initWithData:", v3);

  v5 = -[PKRemoteDevice initWithIDSDevice:]([PKRemoteDevice alloc], "initWithIDSDevice:", *(_QWORD *)(a1 + 40));
  v6 = [PKRemotePaymentRequest alloc];
  -[PKProtobufRemotePaymentRequest identifier](v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKRemotePaymentRequest initWithDevice:identifier:](v6, "initWithDevice:identifier:", v5, v7);

  -[PKProtobufRemotePaymentRequest paymentRequest](v4, "paymentRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaymentRequest requestWithProtobuf:](PKPaymentRequest, "requestWithProtobuf:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRequiredBillingContactFields:", v11);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRequiredShippingContactFields:", v12);

  -[PKRemotePaymentRequest setPaymentRequest:](v8, "setPaymentRequest:", v10);
  -[PKProtobufRemotePaymentRequest paymentApplicationIdentifier](v4, "paymentApplicationIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemotePaymentRequest setSelectedApplicationIdentifier:](v8, "setSelectedApplicationIdentifier:", v13);

  v22 = v4;
  -[PKRemotePaymentRequest setSelectedPaymentMethodType:](v8, "setSelectedPaymentMethodType:", -[PKProtobufRemotePaymentRequest paymentType](v4, "paymentType"));
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "containsObject:", v8) & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "addObject:", v8);
  objc_msgSend(*(id *)(a1 + 48), "_postCTLMThrottleUncapNotification");
  objc_msgSend(*(id *)(a1 + 48), "delegates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    v18 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        v20 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 64);
        block[0] = v18;
        block[1] = 3221225472;
        block[2] = __71__PKIDSManager__paymentRequestReceived_service_account_fromID_context___block_invoke_2;
        block[3] = &unk_1E2ABE0D0;
        block[4] = v20;
        v24 = v8;
        dispatch_async(v21, block);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }

}

uint64_t __71__PKIDSManager__paymentRequestReceived_service_account_fromID_context___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "didReceiveRemotePaymentRequest:", *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __71__PKIDSManager__paymentRequestReceived_service_account_fromID_context___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  NSObject *v16;
  __int128 v18;
  id obj;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD block[6];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"))
  {
    PKLogFacilityTypeGetObject(8uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Requested a payment request to be presented, but we're already displaying one. Cancelling existing requests...", buf, 2u);
    }

    v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v3;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    if (v22)
    {
      v20 = *(_QWORD *)v29;
      *(_QWORD *)&v4 = 138412290;
      v18 = v4;
      v5 = MEMORY[0x1E0C809B0];
      v21 = v2;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v8 = (id)objc_msgSend(*(id *)(a1 + 32), "_queue_cancelRemotePaymentRequest:completion:", v7, 0, v18);
          if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v7, "identifier");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v18;
            v34 = v9;
            _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Cancelled request: %@", buf, 0xCu);

          }
          objc_msgSend(*(id *)(a1 + 32), "delegates");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v25;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v25 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
                v16 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
                block[0] = v5;
                block[1] = 3221225472;
                block[2] = __71__PKIDSManager__paymentRequestReceived_service_account_fromID_context___block_invoke_79;
                block[3] = &unk_1E2ABE0D0;
                block[4] = v15;
                block[5] = v7;
                dispatch_async(v16, block);
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v12);
          }

          v2 = v21;
        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      }
      while (v22);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __71__PKIDSManager__paymentRequestReceived_service_account_fromID_context___block_invoke_79(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "didReceiveCancellationForRemotePaymentRequest:", *(_QWORD *)(a1 + 40));
  return result;
}

void __71__PKIDSManager__paymentRequestReceived_service_account_fromID_context___block_invoke_82(uint64_t a1, void *a2, void *a3, char a4)
{
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = a2;
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  if ((a4 & 1) != 0)
  {
    v8 = a3;
    objc_msgSend(v7, "removeObjectForKey:", v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(v12, "endDetecting");
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C99D68];
    v10 = a3;
    objc_msgSend(v9, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v11, v10);

  }
}

- (void)_paymentResponseReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  void *v10;
  PKProtobufRemotePaymentResponse *v11;
  void *v12;
  PKProtobufRemotePaymentResponse *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  NSObject *callbackQueue;
  id v25;
  id obj;
  _QWORD block[5];
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[IDSService deviceForFromID:](self->_service, "deviceForFromID:", a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = [PKProtobufRemotePaymentResponse alloc];
    v25 = v9;
    objc_msgSend(v9, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PKProtobufRemotePaymentResponse initWithData:](v11, "initWithData:", v12);

    -[PKProtobufRemotePaymentResponse remotePaymentRequestIdentifier](v13, "remotePaymentRequestIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKIDSManager _queue_requestForIdentifier:](self, "_queue_requestForIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKProtobufRemotePaymentResponse payment](v13, "payment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPayment paymentWithProtobuf:](PKPayment, "paymentWithProtobuf:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKIDSManager delegates](self, "delegates");
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v31;
      v21 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v31 != v20)
            objc_enumerationMutation(obj);
          v23 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          callbackQueue = self->_callbackQueue;
          block[0] = v21;
          block[1] = 3221225472;
          block[2] = __72__PKIDSManager__paymentResponseReceived_service_account_fromID_context___block_invoke;
          block[3] = &unk_1E2ABE0F8;
          block[4] = v23;
          v28 = v17;
          v29 = v15;
          dispatch_async(callbackQueue, block);

        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v19);
    }

    v9 = v25;
  }

}

uint64_t __72__PKIDSManager__paymentResponseReceived_service_account_fromID_context___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "didReceivePayment:forRemotePaymentRequest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

- (void)_paymentResultReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  void *v10;
  PKProtobufPaymentStatus *v11;
  void *v12;
  PKProtobufPaymentStatus *v13;
  void *v14;
  PKPaymentAuthorizationResult *v15;
  void *v16;
  void *v17;
  PKIDSManager *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *callbackQueue;
  void *v27;
  id v28;
  void *v29;
  _QWORD block[5];
  PKPaymentAuthorizationResult *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _QWORD v38[2];
  _QWORD v39[4];

  v39[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[IDSService deviceForFromID:](self->_service, "deviceForFromID:", a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = [PKProtobufPaymentStatus alloc];
    v28 = v9;
    objc_msgSend(v9, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PKProtobufPaymentStatus initWithData:](v11, "initWithData:", v12);

    -[PKProtobufPaymentStatus remotePaymentRequestIdentifier](v13, "remotePaymentRequestIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKIDSManager _queue_requestForIdentifier:](self, "_queue_requestForIdentifier:", v14);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc_init(PKPaymentAuthorizationResult);
    -[PKPaymentAuthorizationResult setStatus:](v15, "setStatus:", -[PKProtobufPaymentStatus status](v13, "status"));
    -[PKPaymentAuthorizationResult setResultSource:](v15, "setResultSource:", 1);
    if (!-[PKProtobufPaymentStatus status](v13, "status"))
      -[NSMutableArray removeObject:](self->_paymentRequests, "removeObject:", v29);
    v38[0] = CFSTR("message");
    v38[1] = CFSTR("complete");
    v39[0] = CFSTR("payment");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PKProtobufPaymentStatus status](v13, "status", v13) == 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

    v18 = self;
    -[PKIDSManager delegates](self, "delegates");
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v34;
      v23 = MEMORY[0x1E0C809B0];
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v34 != v22)
            objc_enumerationMutation(v19);
          v25 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v24);
          callbackQueue = v18->_callbackQueue;
          block[0] = v23;
          block[1] = 3221225472;
          block[2] = __70__PKIDSManager__paymentResultReceived_service_account_fromID_context___block_invoke;
          block[3] = &unk_1E2ABE0F8;
          block[4] = v25;
          v31 = v15;
          v32 = v29;
          dispatch_async(callbackQueue, block);

          ++v24;
        }
        while (v21 != v24);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v21);
    }

    v9 = v28;
  }

}

uint64_t __70__PKIDSManager__paymentResultReceived_service_account_fromID_context___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "didReceivePaymentResult:forRemotePaymentRequest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

- (void)_paymentCancellationReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  void *v10;
  PKProtobufPaymentCancellation *v11;
  void *v12;
  PKProtobufPaymentCancellation *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  NSObject *callbackQueue;
  PKProtobufPaymentCancellation *v26;
  NSMutableArray *pendingCancellations;
  void *v28;
  id v29;
  _QWORD block[5];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[IDSService deviceForFromID:](self->_service, "deviceForFromID:", a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    AnalyticsSendEvent();
    v11 = [PKProtobufPaymentCancellation alloc];
    v29 = v9;
    objc_msgSend(v9, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PKProtobufPaymentCancellation initWithData:](v11, "initWithData:", v12);

    -[PKProtobufPaymentCancellation remotePaymentRequestIdentifier](v13, "remotePaymentRequestIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKIDSManager _queue_requestForIdentifier:](self, "_queue_requestForIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    PKLogFacilityTypeGetObject(8uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[PKProtobufPaymentCancellation remotePaymentRequestIdentifier](v13, "remotePaymentRequestIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v38 = v17;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Received cancellation for payment request with identifier: %@", buf, 0xCu);

    }
    -[PKIDSManager delegates](self, "delegates");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v33;
      v22 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v33 != v21)
            objc_enumerationMutation(v18);
          v24 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          callbackQueue = self->_callbackQueue;
          block[0] = v22;
          block[1] = 3221225472;
          block[2] = __76__PKIDSManager__paymentCancellationReceived_service_account_fromID_context___block_invoke;
          block[3] = &unk_1E2ABE0D0;
          block[4] = v24;
          v31 = v15;
          dispatch_async(callbackQueue, block);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v20);
    }
    if (v15)
    {
      -[NSMutableArray removeObject:](self->_paymentRequests, "removeObject:", v15);
      v26 = v13;
      v9 = v29;
    }
    else
    {
      pendingCancellations = self->_pendingCancellations;
      v26 = v13;
      -[PKProtobufPaymentCancellation remotePaymentRequestIdentifier](v13, "remotePaymentRequestIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray safelyAddObject:](pendingCancellations, "safelyAddObject:", v28);

      v9 = v29;
    }

  }
}

uint64_t __76__PKIDSManager__paymentCancellationReceived_service_account_fromID_context___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "didReceiveCancellationForRemotePaymentRequest:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)_paymentHostUpdateReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  void *v10;
  PKProtobufPaymentHostUpdate *v11;
  void *v12;
  PKProtobufPaymentHostUpdate *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  NSObject *callbackQueue;
  id v26;
  id obj;
  _QWORD block[5];
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[IDSService deviceForFromID:](self->_service, "deviceForFromID:", a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = [PKProtobufPaymentHostUpdate alloc];
    v26 = v9;
    objc_msgSend(v9, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PKProtobufPaymentHostUpdate initWithData:](v11, "initWithData:", v12);

    -[PKProtobufPaymentHostUpdate remotePaymentRequestIdentifier](v13, "remotePaymentRequestIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKIDSManager _queue_requestForIdentifier:](self, "_queue_requestForIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[PKPaymentHostUpdate paymentUpdateWithProtobuf:](PKPaymentHostUpdate, "paymentUpdateWithProtobuf:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(8uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v16, "description");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v37 = v18;
      _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Received payment host update: %@", buf, 0xCu);

    }
    -[PKIDSManager delegates](self, "delegates");
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v32;
      v22 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v32 != v21)
            objc_enumerationMutation(obj);
          v24 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          callbackQueue = self->_callbackQueue;
          block[0] = v22;
          block[1] = 3221225472;
          block[2] = __74__PKIDSManager__paymentHostUpdateReceived_service_account_fromID_context___block_invoke;
          block[3] = &unk_1E2ABE0F8;
          block[4] = v24;
          v29 = v16;
          v30 = v15;
          dispatch_async(callbackQueue, block);

        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v20);
    }

    v9 = v26;
  }

}

uint64_t __74__PKIDSManager__paymentHostUpdateReceived_service_account_fromID_context___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "didReceivePaymentHostUpdate:forRemotePaymentRequest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

- (void)_paymentClientUpdateReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  void *v10;
  PKProtobufPaymentClientUpdate *v11;
  void *v12;
  PKProtobufPaymentClientUpdate *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  NSObject *callbackQueue;
  id v26;
  id obj;
  _QWORD block[5];
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[IDSService deviceForFromID:](self->_service, "deviceForFromID:", a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    AnalyticsSendEvent();
    v11 = [PKProtobufPaymentClientUpdate alloc];
    v26 = v9;
    objc_msgSend(v9, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PKProtobufPaymentClientUpdate initWithData:](v11, "initWithData:", v12);

    -[PKProtobufPaymentClientUpdate remotePaymentRequestIdentifier](v13, "remotePaymentRequestIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKIDSManager _queue_requestForIdentifier:](self, "_queue_requestForIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[PKPaymentClientUpdate paymentUpdateResponseWithProtobuf:](PKPaymentClientUpdate, "paymentUpdateResponseWithProtobuf:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(8uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v16, "description");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v37 = v18;
      _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Received payment client update: %@", buf, 0xCu);

    }
    -[PKIDSManager delegates](self, "delegates");
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v32;
      v22 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v32 != v21)
            objc_enumerationMutation(obj);
          v24 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          callbackQueue = self->_callbackQueue;
          block[0] = v22;
          block[1] = 3221225472;
          block[2] = __76__PKIDSManager__paymentClientUpdateReceived_service_account_fromID_context___block_invoke;
          block[3] = &unk_1E2ABE0F8;
          block[4] = v24;
          v29 = v16;
          v30 = v15;
          dispatch_async(callbackQueue, block);

        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v20);
    }

    v9 = v26;
  }

}

uint64_t __76__PKIDSManager__paymentClientUpdateReceived_service_account_fromID_context___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "didReceivePaymentClientUpdate:forRemotePaymentRequest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

- (void)_thumbnailRequestReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  PKProtobufPaymentInstrumentThumbnailRequest *v20;
  void *v21;
  PKProtobufPaymentInstrumentThumbnailRequest *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  PKIDSManagerDataSource *dataSource;
  void *v28;
  uint64_t v29;
  PKProtobufPaymentInstrumentThumbnailResponse *v30;
  PKProtobufPaymentInstrumentThumbnailResponse *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  IDSService *service;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint8_t buf[16];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[IDSService deviceForFromID:](self->_service, "deviceForFromID:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    PKLogFacilityTypeGetObject(8uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Received thumbnail request", buf, 2u);
    }
    v42 = v13;

    v19 = (void *)MEMORY[0x19400CFE8]();
    v20 = [PKProtobufPaymentInstrumentThumbnailRequest alloc];
    objc_msgSend(v12, "data");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[PKProtobufPaymentInstrumentThumbnailRequest initWithData:](v20, "initWithData:", v21);

    v41 = v14;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[PKProtobufPaymentInstrumentThumbnailRequest width](v22, "width");
      v24 = v23;
      -[PKProtobufPaymentInstrumentThumbnailRequest height](v22, "height");
      v26 = v25;
      dataSource = self->_dataSource;
      -[PKProtobufPaymentInstrumentThumbnailRequest passIdentifier](v22, "passIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[PKIDSManagerDataSource thumbnailImageForPassIdentifier:size:manager:](dataSource, "thumbnailImageForPassIdentifier:size:manager:", v28, self, v24, v26);

      v30 = objc_alloc_init(PKProtobufPaymentInstrumentThumbnailResponse);
      v31 = v30;
      if (v29)
      {
        -[PKProtobufPaymentInstrumentThumbnailResponse setStatus:](v30, "setStatus:", 0);
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithCGImage:", v29);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKProtobufPaymentInstrumentThumbnailResponse setThumbnailImage:](v31, "setThumbnailImage:", v32);

        -[PKProtobufPaymentInstrumentThumbnailRequest manifestHash](v22, "manifestHash");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKProtobufPaymentInstrumentThumbnailResponse setManifestHash:](v31, "setManifestHash:", v33);

LABEL_9:
        v34 = objc_alloc(MEMORY[0x1E0D34E08]);
        -[PKProtobufPaymentInstrumentThumbnailResponse data](v31, "data");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)objc_msgSend(v34, "initWithProtobufData:type:isResponse:", v35, 8, 1);

        objc_autoreleasePoolPop(v19);
        service = self->_service;
        -[IDSService deviceForFromID:](service, "deviceForFromID:", v15);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "pk_idsDestination");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "outgoingResponseIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        PKProtobufSend(service, v36, (uint64_t)v39, v40, 0, &__block_literal_global_200);

        v14 = v41;
        v13 = v42;
        goto LABEL_10;
      }
    }
    else
    {
      v31 = objc_alloc_init(PKProtobufPaymentInstrumentThumbnailResponse);
    }
    -[PKProtobufPaymentInstrumentThumbnailResponse setStatus:](v31, "setStatus:", 1, v14);
    goto LABEL_9;
  }
LABEL_10:

}

void __73__PKIDSManager__thumbnailRequestReceived_service_account_fromID_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (v5)
  {
    PKLogFacilityTypeGetObject(8uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Failed to send message: %@", (uint8_t *)&v8, 0xCu);

    }
  }

}

- (void)_promptDetailsForVirtualCardRequestReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  PKProtobufPromptDetailsForVirtualCard *v19;
  void *v20;
  PKProtobufPromptDetailsForVirtualCard *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  NSObject *callbackQueue;
  void *v30;
  id v31;
  id v32;
  id v33;
  _QWORD block[5];
  PKProtobufPromptDetailsForVirtualCard *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[16];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  PKLogFacilityTypeGetObject(8uLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Received virtual card details request", buf, 2u);
  }

  -[IDSService deviceForFromID:](self->_service, "deviceForFromID:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v30 = v18;
    v31 = v16;
    v32 = v14;
    v33 = v13;
    v19 = [PKProtobufPromptDetailsForVirtualCard alloc];
    objc_msgSend(v12, "data");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[PKProtobufPromptDetailsForVirtualCard initWithData:](v19, "initWithData:", v20);

    -[PKIDSManager delegates](self, "delegates");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v37;
      v26 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v37 != v25)
            objc_enumerationMutation(v22);
          v28 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          callbackQueue = self->_callbackQueue;
          block[0] = v26;
          block[1] = 3221225472;
          block[2] = __91__PKIDSManager__promptDetailsForVirtualCardRequestReceived_service_account_fromID_context___block_invoke;
          block[3] = &unk_1E2ABE0D0;
          block[4] = v28;
          v35 = v21;
          dispatch_async(callbackQueue, block);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v24);
    }

    v13 = v33;
    v14 = v32;
    v18 = v30;
    v16 = v31;
  }

}

void __91__PKIDSManager__promptDetailsForVirtualCardRequestReceived_service_account_fromID_context___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "didReceivePromptForVirtualCard:showNotification:", v3, objc_msgSend(*(id *)(a1 + 40), "showNotification"));

  }
}

- (void)_paymentDiscoveryResponseReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *pendingDiscoveries;
  void *v16;
  PKProtobufPaymentDeviceResponse *v17;
  void *v18;
  PKProtobufPaymentDeviceResponse *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  PKRemoteDevice *v36;
  PKIDSManager *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  void *v46;
  unsigned int v47;
  NSMutableArray *remoteDevices;
  uint64_t v49;
  PKRemoteDevice *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t m;
  uint64_t v57;
  NSObject *callbackQueue;
  NSObject *oslog;
  PKRemoteDevice *v60;
  PKIDSManager *v61;
  void *v62;
  id v63;
  PKProtobufPaymentDeviceResponse *v64;
  id obj;
  void *v66;
  _QWORD block[6];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[4];
  PKRemoteDevice *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint8_t v89[128];
  uint8_t buf[4];
  void *v91;
  __int16 v92;
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[IDSService deviceForFromID:](self->_service, "deviceForFromID:", a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(8uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v91 = v12;
    v92 = 2112;
    v93 = v13;
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Received discovery response from device name:%@; identifier:%@",
      buf,
      0x16u);

  }
  if (v10)
  {
    objc_msgSend(v10, "uniqueID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      oslog = v11;
      v61 = self;
      pendingDiscoveries = self->_pendingDiscoveries;
      objc_msgSend(v10, "uniqueID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](pendingDiscoveries, "removeObjectForKey:", v16);

      v62 = v10;
      v60 = -[PKRemoteDevice initWithIDSDevice:]([PKRemoteDevice alloc], "initWithIDSDevice:", v10);
      v17 = [PKProtobufPaymentDeviceResponse alloc];
      v63 = v9;
      objc_msgSend(v9, "data");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[PKProtobufPaymentDeviceResponse initWithData:](v17, "initWithData:", v18);

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v85 = 0u;
      v64 = v19;
      -[PKProtobufPaymentDeviceResponse paymentInstruments](v19, "paymentInstruments");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v89, 16);
      v66 = v20;
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v83;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v83 != v23)
              objc_enumerationMutation(obj);
            +[PKRemotePaymentInstrument remotePaymentInstrumentWithProtobuf:](PKRemotePaymentInstrument, "remotePaymentInstrumentWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            v78 = 0u;
            v79 = 0u;
            v80 = 0u;
            v81 = 0u;
            objc_msgSend(v25, "paymentApplications");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
            if (v28)
            {
              v29 = v28;
              v30 = *(_QWORD *)v79;
              do
              {
                for (j = 0; j != v29; ++j)
                {
                  if (*(_QWORD *)v79 != v30)
                    objc_enumerationMutation(v27);
                  v32 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * j);
                  if (objc_msgSend(v32, "supportsInAppPayment")
                    && objc_msgSend(v32, "supportsComboCard"))
                  {
                    objc_msgSend(v32, "paymentApplicationsIncludingAuxiliaryPaymentTypes");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "addObjectsFromArray:", v33);

                  }
                  else
                  {
                    objc_msgSend(v26, "addObject:", v32);
                  }
                }
                v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
              }
              while (v29);
            }

            v34 = (void *)objc_msgSend(v26, "pk_arrayCopy");
            objc_msgSend(v25, "setPaymentApplications:", v34);

            v20 = v66;
            objc_msgSend(v66, "addObject:", v25);

          }
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v89, 16);
        }
        while (v22);
      }

      if (-[PKProtobufPaymentDeviceResponse hasDefaultPaymentInstrumentIndex](v64, "hasDefaultPaymentInstrumentIndex"))
      {
        objc_msgSend(v20, "objectAtIndex:", -[PKProtobufPaymentDeviceResponse defaultPaymentInstrumentIndex](v64, "defaultPaymentInstrumentIndex"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v60;
        -[PKRemoteDevice setDefaultRemotePaymentInstrument:](v60, "setDefaultRemotePaymentInstrument:", v35);
        v37 = v61;
      }
      else
      {
        v35 = oslog;
        v36 = v60;
        v37 = v61;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, oslog, OS_LOG_TYPE_DEFAULT, "No default card was found when parsing discovery response", buf, 2u);
        }
      }

      -[PKRemoteDevice setRemotePaymentInstruments:](v36, "setRemotePaymentInstruments:", v20);
      -[PKRemoteDevice setIsLocked:](v36, "setIsLocked:", -[PKProtobufPaymentDeviceResponse locked](v64, "locked"));
      -[PKRemoteDevice setUserDisabled:](v36, "setUserDisabled:", -[PKProtobufPaymentDeviceResponse userDisabled](v64, "userDisabled"));
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKRemoteDevice setLastSeen:](v36, "setLastSeen:", v38);

      -[PKRemoteDevice setDeviceDisabled:](v36, "setDeviceDisabled:", -[PKProtobufPaymentDeviceResponse deviceDisabled](v64, "deviceDisabled"));
      -[PKRemoteDevice setSupportsFaceID:](v36, "setSupportsFaceID:", -[PKProtobufPaymentDeviceResponse supportsFaceID](v64, "supportsFaceID"));
      v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v74 = 0u;
      v75 = 0u;
      v76 = 0u;
      v77 = 0u;
      -[PKProtobufPaymentDeviceResponse supportedSetupFeatures](v64, "supportedSetupFeatures");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v75;
        do
        {
          for (k = 0; k != v42; ++k)
          {
            if (*(_QWORD *)v75 != v43)
              objc_enumerationMutation(v40);
            +[PKPaymentSetupFeature paymentSetupFeatureWithProtobuf:](PKPaymentSetupFeature, "paymentSetupFeatureWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * k));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "addObject:", v45);

          }
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
        }
        while (v42);
      }

      v46 = (void *)objc_msgSend(v39, "copy");
      -[PKRemoteDevice setSupportedSetupFeatures:](v36, "setSupportedSetupFeatures:", v46);

      v47 = -[PKProtobufPaymentDeviceResponse nearby](v64, "nearby");
      if (v47 <= 2)
        -[PKRemoteDevice setProximityState:](v36, "setProximityState:", qword_1904561A8[v47]);
      remoteDevices = v37->_remoteDevices;
      v49 = MEMORY[0x1E0C809B0];
      v72[0] = MEMORY[0x1E0C809B0];
      v72[1] = 3221225472;
      v72[2] = __81__PKIDSManager__paymentDiscoveryResponseReceived_service_account_fromID_context___block_invoke;
      v72[3] = &unk_1E2AC5E30;
      v50 = v36;
      v73 = v50;
      v51 = -[NSMutableArray indexOfObjectPassingTest:](remoteDevices, "indexOfObjectPassingTest:", v72);
      if (v51 != 0x7FFFFFFFFFFFFFFFLL)
        -[NSMutableArray removeObjectAtIndex:](v37->_remoteDevices, "removeObjectAtIndex:", v51);
      -[NSMutableArray addObject:](v37->_remoteDevices, "addObject:", v50);
      -[PKIDSManager delegates](v37, "delegates");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
      if (v53)
      {
        v54 = v53;
        v55 = *(_QWORD *)v69;
        do
        {
          for (m = 0; m != v54; ++m)
          {
            if (*(_QWORD *)v69 != v55)
              objc_enumerationMutation(v52);
            v57 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * m);
            callbackQueue = v37->_callbackQueue;
            block[0] = v49;
            block[1] = 3221225472;
            block[2] = __81__PKIDSManager__paymentDiscoveryResponseReceived_service_account_fromID_context___block_invoke_2;
            block[3] = &unk_1E2ABE0D0;
            block[4] = v57;
            block[5] = v37;
            dispatch_async(callbackQueue, block);
          }
          v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
        }
        while (v54);
      }
      -[PKIDSManager _archiveDevicesToDisk](v37, "_archiveDevicesToDisk");

      v10 = v62;
      v9 = v63;
    }
  }

}

uint64_t __81__PKIDSManager__paymentDiscoveryResponseReceived_service_account_fromID_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __81__PKIDSManager__paymentDiscoveryResponseReceived_service_account_fromID_context___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "managerDevicesDidChange:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)_thumbnailResponseReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  PKProtobufPaymentInstrumentThumbnailResponse *v15;
  void *v16;
  PKProtobufPaymentInstrumentThumbnailResponse *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSData *v22;
  CGImage *v23;
  id v24;
  size_t Height;
  void *v26;
  const __CFURL *v27;
  CGImageDestination *v28;
  CGImageDestination *v29;
  BOOL v30;
  NSMutableDictionary *thumbnailCompletionHandlers;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  uint64_t v42;
  NSObject *callbackQueue;
  const char *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  id obj;
  size_t Width;
  uint64_t v53;
  uint64_t v54;
  PKIDSManager *v55;
  _QWORD block[4];
  PKProtobufPaymentInstrumentThumbnailResponse *v57;
  id v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[4];
  id v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;
  void *v73;
  uint8_t buf[4];
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a7;
  v55 = self;
  -[IDSService deviceForFromID:](self->_service, "deviceForFromID:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_31;
  objc_msgSend(v11, "incomingResponseIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(8uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v75 = v13;
    _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Received thumbnail response: %@", buf, 0xCu);
  }

  v15 = [PKProtobufPaymentInstrumentThumbnailResponse alloc];
  objc_msgSend(v10, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PKProtobufPaymentInstrumentThumbnailResponse initWithData:](v15, "initWithData:", v16);

  if (!-[PKProtobufPaymentInstrumentThumbnailResponse status](v17, "status"))
  {
    if (!-[PKProtobufPaymentInstrumentThumbnailResponse hasThumbnailImage](v17, "hasThumbnailImage")
      || (-[PKProtobufPaymentInstrumentThumbnailResponse thumbnailImage](v17, "thumbnailImage"),
          v22 = (NSData *)objc_claimAutoreleasedReturnValue(),
          v23 = PKCreateCGImage(v22),
          v22,
          !v23))
    {
      v21 = 0;
      goto LABEL_14;
    }
    v24 = v11;
    Width = CGImageGetWidth(v23);
    Height = CGImageGetHeight(v23);
    -[PKProtobufPaymentInstrumentThumbnailResponse manifestHash](v17, "manifestHash");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789ABCDEFabcdef"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "invertedSet");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v19, "rangeOfCharacterFromSet:", v20) != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Manifest hash for thumbnail was not a valid SHA1 hash. Ignoring.", buf, 2u);
      }
      v11 = v24;
      goto LABEL_42;
    }
    +[PKRemotePaymentInstrument thumbnailCachePathForManifestHash:size:](PKRemotePaymentInstrument, "thumbnailCachePathForManifestHash:size:", v19, (double)Width, (double)Height);
    v53 = objc_claimAutoreleasedReturnValue();
    v27 = (const __CFURL *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:");
    v28 = CGImageDestinationCreateWithURL(v27, (CFStringRef)objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier"), 1uLL, 0);
    if (v28)
    {
      v29 = v28;
      CGImageDestinationAddImage(v28, v23, 0);
      v30 = CGImageDestinationFinalize(v29);
      CFRelease(v29);
      if (v30)
      {
        v11 = v24;
LABEL_41:
        v14 = v53;
LABEL_42:

        CGImageRelease(v23);
        v21 = 0;
        goto LABEL_6;
      }
      v11 = v24;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v44 = "Error saving thumbnail to disk";
        goto LABEL_39;
      }
    }
    else
    {
      v11 = v24;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v44 = "Thumbnail destination is nil - this is not expected behavior";
LABEL_39:
        _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, v44, buf, 2u);
      }
    }

    goto LABEL_41;
  }
  v18 = (void *)MEMORY[0x1E0CB35C8];
  v72 = *MEMORY[0x1E0CB2D50];
  -[PKProtobufPaymentInstrumentThumbnailResponse statusAsString:](v17, "statusAsString:", -[PKProtobufPaymentInstrumentThumbnailResponse status](v17, "status"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

LABEL_14:
  thumbnailCompletionHandlers = v55->_thumbnailCompletionHandlers;
  v32 = MEMORY[0x1E0C809B0];
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __74__PKIDSManager__thumbnailResponseReceived_service_account_fromID_context___block_invoke;
  v68[3] = &unk_1E2AD9E40;
  v33 = v13;
  v69 = v33;
  -[NSMutableDictionary keysOfEntriesPassingTest:](thumbnailCompletionHandlers, "keysOfEntriesPassingTest:", v68);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "count"))
  {
    v46 = v33;
    v47 = v11;
    v48 = v10;
    v66 = 0u;
    v67 = 0u;
    v65 = 0u;
    v64 = 0u;
    v45 = v34;
    obj = v34;
    v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
    if (v50)
    {
      v49 = *(_QWORD *)v65;
      do
      {
        v35 = 0;
        do
        {
          if (*(_QWORD *)v65 != v49)
            objc_enumerationMutation(obj);
          v54 = v35;
          -[NSMutableDictionary objectForKey:](v55->_thumbnailCompletionHandlers, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v35), v45, v46, v47, v48);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKIDSManager _queue_removeThumbnailCompletionHandlersForKeys:](v55, "_queue_removeThumbnailCompletionHandlersForKeys:", obj);
          v62 = 0u;
          v63 = 0u;
          v60 = 0u;
          v61 = 0u;
          v37 = v36;
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
          if (v38)
          {
            v39 = v38;
            v40 = *(_QWORD *)v61;
            do
            {
              for (i = 0; i != v39; ++i)
              {
                if (*(_QWORD *)v61 != v40)
                  objc_enumerationMutation(v37);
                v42 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
                callbackQueue = v55->_callbackQueue;
                block[0] = v32;
                block[1] = 3221225472;
                block[2] = __74__PKIDSManager__thumbnailResponseReceived_service_account_fromID_context___block_invoke_2;
                block[3] = &unk_1E2ABDA68;
                v59 = v42;
                v57 = v17;
                v58 = v21;
                dispatch_async(callbackQueue, block);

              }
              v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
            }
            while (v39);
          }

          v35 = v54 + 1;
        }
        while (v54 + 1 != v50);
        v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
      }
      while (v50);
    }

    v11 = v47;
    v10 = v48;
    v34 = v45;
    v33 = v46;
  }

LABEL_31:
}

uint64_t __74__PKIDSManager__thumbnailResponseReceived_service_account_fromID_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "requestIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __74__PKIDSManager__thumbnailResponseReceived_service_account_fromID_context___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "thumbnailImage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40));

}

- (int64_t)_paymentAuthorizationStatusForPaymentResult:(id)a3 forRemotePaymentRequest:(id)a4
{
  id v5;
  id v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  PKPaymentSheetExperiment *v11;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "status");
  objc_msgSend(v6, "errors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  objc_msgSend(v5, "paymentRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v10, "requestType") && !objc_msgSend(v10, "APIType"))
  {
    v11 = objc_alloc_init(PKPaymentSheetExperiment);
    if (-[PKPaymentSheetExperiment isTaggedForAllowInAppPaymentFailureRetry](v11, "isTaggedForAllowInAppPaymentFailureRetry"))
    {
      -[PKExperiment trackExperimentExposure](v11, "trackExperimentExposure");
      if (-[PKPaymentSheetExperiment shouldAllowInAppPaymentFailureRetry](v11, "shouldAllowInAppPaymentFailureRetry"))
      {
        if (v7 == 1)
          v7 = 1000;

        goto LABEL_11;
      }
    }

  }
  if (v9)
    v7 = 1000;
LABEL_11:

  return v7;
}

- (BOOL)_queue_hasRemoteDevices
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  NSObject *v9;
  uint8_t v11[16];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  -[IDSService devices](self->_service, "devices");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "pk_isApplePayCapable"))
        {
          if (!-[NSMutableArray count](self->_remoteDevices, "count"))
          {
            PKLogFacilityTypeGetObject(8uLL);
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v11 = 0;
              _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "IDS service has devices but cache is empty.", v11, 2u);
            }

            -[PKIDSManager _queue_sendDeviceDiscoveryRequestWithProximity:devices:](self, "_queue_sendDeviceDiscoveryRequestWithProximity:devices:", 0, v3);
          }
          v8 = 1;
          goto LABEL_15;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_15:

  return v8;
}

- (id)_queue_requestForIdentifier:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_paymentRequests;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_queue_addThumbnailCompletionHandler:(id)a3 forKey:(id)a4
{
  NSObject *internalQueue;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  internalQueue = self->_internalQueue;
  v7 = a3;
  dispatch_assert_queue_V2(internalQueue);
  -[NSMutableDictionary objectForKey:](self->_thumbnailCompletionHandlers, "objectForKey:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = v10;

  v12 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v11, "addObject:", v12);

  -[NSMutableDictionary setObject:forKey:](self->_thumbnailCompletionHandlers, "setObject:forKey:", v11, v13);
}

- (void)_queue_removeThumbnailCompletionHandlersForKeys:(id)a3
{
  NSObject *internalQueue;
  id v5;
  NSMutableDictionary *thumbnailCompletionHandlers;
  id v7;

  internalQueue = self->_internalQueue;
  v5 = a3;
  dispatch_assert_queue_V2(internalQueue);
  thumbnailCompletionHandlers = self->_thumbnailCompletionHandlers;
  objc_msgSend(v5, "allObjects");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary removeObjectsForKeys:](thumbnailCompletionHandlers, "removeObjectsForKeys:", v7);
}

- (void)_queue_sendDeviceDiscoveryRequestToAllDevicesWithProximity:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[IDSService devices](self->_service, "devices");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKIDSManager _queue_sendDeviceDiscoveryRequestWithProximity:devices:](self, "_queue_sendDeviceDiscoveryRequestWithProximity:devices:", v3, v5);

}

- (void)_queue_sendDeviceDiscoveryRequestWithProximity:(BOOL)a3 devices:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSMutableArray *remoteDevices;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PKProtobufPaymentDeviceRequest *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  double v30;
  double v31;
  _BOOL4 v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  IDSService *service;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  PKProtobufPaymentDeviceRequest *v44;
  void *v45;
  id v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  PKIDSManager *v50;
  _QWORD v51[5];
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  id v58;
  uint8_t v59[128];
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  uint64_t v66;

  v4 = a3;
  v66 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  -[IDSService devices](self->_service, "devices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  remoteDevices = self->_remoteDevices;
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __71__PKIDSManager__queue_sendDeviceDiscoveryRequestWithProximity_devices___block_invoke;
  v57[3] = &unk_1E2AC5E30;
  v46 = v7;
  v58 = v46;
  -[NSMutableArray indexesOfObjectsPassingTest:](remoteDevices, "indexesOfObjectsPassingTest:", v57);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    -[NSMutableArray removeObjectsAtIndexes:](self->_remoteDevices, "removeObjectsAtIndexes:", v9);
    -[PKIDSManager _archiveDevicesToDisk](self, "_archiveDevicesToDisk");
    PKLogFacilityTypeGetObject(8uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v9, "count");
      v12 = -[NSMutableArray count](self->_remoteDevices, "count");
      v13 = objc_msgSend(v6, "count");
      *(_DWORD *)buf = 134218496;
      v61 = v11;
      v62 = 2048;
      v63 = v12;
      v64 = 2048;
      v65 = v13;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "PKIDSManager: %lu remote devices disappeared, %lu remote devices remains, %lu IDS devices in total", buf, 0x20u);
    }

  }
  v45 = v9;
  v14 = objc_alloc_init(PKProtobufPaymentDeviceRequest);
  -[PKProtobufPaymentDeviceRequest setProtocolVersion:](v14, "setProtocolVersion:", 1);
  -[PKProtobufPaymentDeviceRequest setShouldAdvertise:](v14, "setShouldAdvertise:", v4);
  v15 = objc_alloc(MEMORY[0x1E0D34E08]);
  v44 = v14;
  -[PKProtobufPaymentDeviceRequest data](v14, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v15, "initWithProtobufData:type:isResponse:", v16, 1, 0);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v19 = v6;
  v20 = (void *)v17;
  v21 = v19;
  v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  v47 = (void *)v17;
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v54;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v54 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v25);
        objc_msgSend(v26, "uniqueID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27 && objc_msgSend(v26, "pk_isValidHandoffDevice"))
        {
          -[NSMutableDictionary objectForKey:](self->_pendingDiscoveries, "objectForKey:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v28 || PKForceLocalIDS())
            goto LABEL_20;
          PKLogFacilityTypeGetObject(8uLL);
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v61 = (uint64_t)v27;
            v62 = 2112;
            v63 = (uint64_t)v28;
            _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "Discovery attempt already in-flight for device %@ sent at %@", buf, 0x16u);
          }

          objc_msgSend(v28, "timeIntervalSinceNow");
          v31 = v30;
          v32 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
          if (v31 >= -60.0)
          {
            if (v32)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "Previous discovery attempt is less than one minute ago, ignoring", buf, 2u);
            }

            v20 = v47;
          }
          else
          {
            if (v32)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "Previous discovery attempt older than one minute, re-trying", buf, 2u);
            }

            v20 = v47;
LABEL_20:
            objc_msgSend(v20, "addObject:", v26);
          }

          goto LABEL_23;
        }
        objc_msgSend(v18, "addObject:", v26);
LABEL_23:

        ++v25;
      }
      while (v23 != v25);
      v33 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      v23 = v33;
    }
    while (v33);
  }

  if (objc_msgSend(v20, "count"))
  {
    objc_msgSend(v20, "pk_setByApplyingBlock:", &__block_literal_global_127_1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = MEMORY[0x1E0C809B0];
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __71__PKIDSManager__queue_sendDeviceDiscoveryRequestWithProximity_devices___block_invoke_2;
    v51[3] = &unk_1E2AD9FE8;
    v51[4] = self;
    v52 = v35;
    v37 = v35;
    objc_msgSend(v34, "enumerateObjectsUsingBlock:", v51);
    service = self->_service;
    v48[0] = v36;
    v48[1] = 3221225472;
    v48[2] = __71__PKIDSManager__queue_sendDeviceDiscoveryRequestWithProximity_devices___block_invoke_3;
    v48[3] = &unk_1E2ADA010;
    v49 = v34;
    v50 = self;
    v39 = v34;
    v40 = v43;
    PKProtobufSendWithOptions(service, v43, v39, 300, 0, 1, 0, v48, 0);

    v20 = v47;
    v41 = v45;
LABEL_31:

    goto LABEL_32;
  }
  PKLogFacilityTypeGetObject(8uLL);
  v37 = objc_claimAutoreleasedReturnValue();
  v40 = v43;
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v37, OS_LOG_TYPE_DEFAULT, "No devices to send discovery requests", buf, 2u);
  }

  v41 = v45;
  if (!objc_msgSend(v21, "count"))
  {
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v37, OS_LOG_TYPE_DEFAULT, "IDS device list is empty.", buf, 2u);
    }
    goto LABEL_31;
  }
  if (objc_msgSend(v18, "count"))
  {
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v61 = (uint64_t)v18;
      _os_log_impl(&dword_18FC92000, v37, OS_LOG_TYPE_DEFAULT, "Some IDS devices are invalid handoff devices: %@", buf, 0xCu);
    }

  }
  if (-[NSMutableDictionary count](self->_pendingDiscoveries, "count"))
  {
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      -[NSMutableDictionary description](self->_pendingDiscoveries, "description");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v61 = (uint64_t)v42;
      _os_log_impl(&dword_18FC92000, v37, OS_LOG_TYPE_DEFAULT, "Discovery requests pending: %@", buf, 0xCu);

      v20 = v47;
    }
    goto LABEL_31;
  }
LABEL_32:

}

uint64_t __71__PKIDSManager__queue_sendDeviceDiscoveryRequestWithProximity_devices___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)IDSCopyIDForDevice();
        objc_msgSend(v3, "uniqueID", v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToString:", v10);

        if ((v11 & 1) != 0)
        {
          v12 = 0;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_11:

  return v12;
}

uint64_t __71__PKIDSManager__queue_sendDeviceDiscoveryRequestWithProximity_devices___block_invoke_125(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pk_idsDestination");
}

void __71__PKIDSManager__queue_sendDeviceDiscoveryRequestWithProximity_devices___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  objc_msgSend(a2, "deviceIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v2, v4);

}

void __71__PKIDSManager__queue_sendDeviceDiscoveryRequestWithProximity_devices___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PKLogFacilityTypeGetObject(8uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v8;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Failed to send message: %@", buf, 0xCu);

    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = *(id *)(a1 + 32);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*(_QWORD *)(a1 + 40) + 96);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "deviceIdentifier", (_QWORD)v16);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "removeObjectForKey:", v15);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

  }
}

- (void)_queue_sendDiscoveryResponse:(id)a3 toDeviceWithFromID:(id)a4
{
  NSObject *internalQueue;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  IDSService *service;
  void *v13;
  id v14;

  v14 = a3;
  internalQueue = self->_internalQueue;
  v7 = a4;
  dispatch_assert_queue_V2(internalQueue);
  -[IDSService deviceForFromID:](self->_service, "deviceForFromID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0D34E08]);
    objc_msgSend(v14, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithProtobufData:type:isResponse:", v10, 1, 1);

    service = self->_service;
    objc_msgSend(v8, "pk_idsDestination");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PKProtobufSend(service, v11, (uint64_t)v13, 0, 0, &__block_literal_global_129_1);

  }
}

void __64__PKIDSManager__queue_sendDiscoveryResponse_toDeviceWithFromID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (v5)
  {
    PKLogFacilityTypeGetObject(8uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Failed to send message: %@", (uint8_t *)&v8, 0xCu);

    }
  }

}

- (id)_queue_cancelRemotePaymentRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKProtobufPaymentCancellation *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  IDSService *service;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__75;
  v26 = __Block_byref_object_dispose__75;
  v27 = 0;
  AnalyticsSendEvent();
  v8 = objc_alloc_init(PKProtobufPaymentCancellation);
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentCancellation setRemotePaymentRequestIdentifier:](v8, "setRemotePaymentRequestIdentifier:", v9);

  v10 = objc_alloc(MEMORY[0x1E0D34E08]);
  -[PKProtobufPaymentCancellation data](v8, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithProtobufData:type:isResponse:", v11, 6, 0);

  service = self->_service;
  objc_msgSend(v6, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pk_idsDestination");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __61__PKIDSManager__queue_cancelRemotePaymentRequest_completion___block_invoke;
  v19[3] = &unk_1E2AD9DF0;
  v16 = v7;
  v19[4] = self;
  v20 = v16;
  v21 = &v22;
  PKProtobufSend(service, v12, (uint64_t)v15, 0, 0, v19);

  -[NSMutableArray removeObject:](self->_paymentRequests, "removeObject:", v6);
  v17 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v17;
}

void __61__PKIDSManager__queue_cancelRemotePaymentRequest_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a2;
  v7 = a3;
  if (v7 && (v8 = (void *)a1[5]) != 0)
  {
    v9 = *(NSObject **)(a1[4] + 64);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __61__PKIDSManager__queue_cancelRemotePaymentRequest_completion___block_invoke_2;
    v13[3] = &unk_1E2ABDA18;
    v15 = v8;
    v14 = v7;
    dispatch_async(v9, v13);

  }
  else if (v6)
  {
    v10 = (void *)a1[5];
    if (v10)
    {
      v11 = *(void **)(a1[4] + 24);
      v12 = (void *)objc_msgSend(v10, "copy");
      objc_msgSend(v11, "setObject:forKey:", v12, v6);

      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    }
  }

}

uint64_t __61__PKIDSManager__queue_cancelRemotePaymentRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)_queue_hasRegisteredAccounts
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[IDSService accounts](self->_service, "accounts", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isActive") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)_queue_deviceIsRegistered:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (v4)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[IDSService devices](self->_service, "devices", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "uniqueID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "uniqueID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v9;
          v12 = v10;
          if (v11 == v12)
          {

LABEL_20:
            LOBYTE(v6) = 1;
            goto LABEL_21;
          }
          v13 = v12;
          if (v11)
            v14 = v12 == 0;
          else
            v14 = 1;
          if (v14)
          {

          }
          else
          {
            v15 = objc_msgSend(v11, "isEqualToString:", v12);

            if ((v15 & 1) != 0)
              goto LABEL_20;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_21:

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)_queue_logCloudPairingState
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  -[IDSService devices](self->_service, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pk_objectsPassingTest:", &__block_literal_global_134);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    PKLogFacilityTypeGetObject(8uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Missing cloud pairing state: %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "count", CFSTR("present")) == 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

uint64_t __43__PKIDSManager__queue_logCloudPairingState__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_msgSend(v2, "nsuuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 || !objc_msgSend(v2, "supportsHandoff"))
    v4 = 0;
  else
    v4 = objc_msgSend(v2, "supportsApplePay");

  return v4;
}

- (void)_registerCTLMThrottleUncapNotification
{
  uint32_t v2;
  uint32_t v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = notify_register_check((const char *)objc_msgSend(CFSTR("com.apple.request.hipuncap"), "UTF8String"), &self->_requestCLTMThrottleUncapToken);
  if (v2)
  {
    v3 = v2;
    PKLogFacilityTypeGetObject(8uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "notify_register_check failed: %u", (uint8_t *)v5, 8u);
    }

  }
}

- (void)_unregisterCTLMThrottleUncapNotification
{
  notify_cancel(self->_requestCLTMThrottleUncapToken);
}

- (void)_postCTLMThrottleUncapNotification
{
  NSObject *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject(8uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Posting CLTMThrottleUncapNotification", v4, 2u);
  }

  notify_set_state(self->_requestCLTMThrottleUncapToken, 3uLL);
  notify_post((const char *)objc_msgSend(CFSTR("com.apple.request.hipuncap"), "UTF8String"));
}

- (void)_registerListeners
{
  -[IDSService setProtobufAction:forIncomingRequestsOfType:](self->_service, "setProtobufAction:forIncomingRequestsOfType:", sel__paymentDiscoveryRequestReceived_service_account_fromID_context_, 1);
  -[IDSService setProtobufAction:forIncomingRequestsOfType:](self->_service, "setProtobufAction:forIncomingRequestsOfType:", sel__paymentRequestReceived_service_account_fromID_context_, 2);
  -[IDSService setProtobufAction:forIncomingRequestsOfType:](self->_service, "setProtobufAction:forIncomingRequestsOfType:", sel__paymentResultReceived_service_account_fromID_context_, 5);
  -[IDSService setProtobufAction:forIncomingRequestsOfType:](self->_service, "setProtobufAction:forIncomingRequestsOfType:", sel__paymentCancellationReceived_service_account_fromID_context_, 6);
  -[IDSService setProtobufAction:forIncomingRequestsOfType:](self->_service, "setProtobufAction:forIncomingRequestsOfType:", sel__paymentClientUpdateReceived_service_account_fromID_context_, 3);
  -[IDSService setProtobufAction:forIncomingRequestsOfType:](self->_service, "setProtobufAction:forIncomingRequestsOfType:", sel__paymentSetupRequestReceived_service_account_fromID_context_, 7);
  -[IDSService setProtobufAction:forIncomingRequestsOfType:](self->_service, "setProtobufAction:forIncomingRequestsOfType:", sel__thumbnailRequestReceived_service_account_fromID_context_, 8);
  -[IDSService setProtobufAction:forIncomingRequestsOfType:](self->_service, "setProtobufAction:forIncomingRequestsOfType:", sel__promptDetailsForVirtualCardRequestReceived_service_account_fromID_context_, 9);
  -[IDSService setProtobufAction:forIncomingRequestsOfType:](self->_service, "setProtobufAction:forIncomingRequestsOfType:", sel__paymentCancellationReceived_service_account_fromID_context_, 6);
}

- (id)_preparePaymentDeviceResponseForRequestingDevice:(id)a3 userDisabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  PKProtobufPaymentDeviceResponse *v7;
  NSObject *v8;
  PKIDSManagerDataSource *dataSource;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  PKRemotePaymentInstrument *v18;
  void *v19;
  PKRemotePaymentInstrument *v20;
  uint64_t v21;
  _QWORD v23[4];
  PKRemotePaymentInstrument *v24;
  _QWORD v25[4];
  PKProtobufPaymentDeviceResponse *v26;
  NSObject *v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(PKProtobufPaymentDeviceResponse);
  -[PKProtobufPaymentDeviceResponse setProtocolVersion:](v7, "setProtocolVersion:", 1);
  -[PKProtobufPaymentDeviceResponse setUserDisabled:](v7, "setUserDisabled:", v4);
  -[PKProtobufPaymentDeviceResponse setSupportsFaceID:](v7, "setSupportsFaceID:", PKPearlIsAvailable());
  if (!-[PKProtobufPaymentDeviceResponse userDisabled](v7, "userDisabled"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v8 = dispatch_group_create();
      dispatch_group_enter(v8);
      dataSource = self->_dataSource;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __78__PKIDSManager__preparePaymentDeviceResponseForRequestingDevice_userDisabled___block_invoke;
      v25[3] = &unk_1E2AC61B8;
      v26 = v7;
      v27 = v8;
      v10 = v8;
      -[PKIDSManagerDataSource supportedPaymentSetupFeatures:completion:](dataSource, "supportedPaymentSetupFeatures:completion:", self, v25);
      dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[PKProtobufPaymentDeviceResponse setDeviceDisabled:](v7, "setDeviceDisabled:", -[PKIDSManagerDataSource deviceAvailableForContinuityPayments:](self->_dataSource, "deviceAvailableForContinuityPayments:", self) ^ 1);
    -[PKIDSManager _fetchPaymentInstrumentsForRequestingDevice:](self, "_fetchPaymentInstrumentsForRequestingDevice:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPaymentDeviceResponse setPaymentInstruments:](v7, "setPaymentInstruments:", v11);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[PKIDSManagerDataSource defaultPaymentPassForContinuityDiscovery:](self->_dataSource, "defaultPaymentPassForContinuityDiscovery:", self);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[PKIDSManagerDataSource webServiceConfigurationForContinuityPayments:](self->_dataSource, "webServiceConfigurationForContinuityPayments:", self);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v13, "unsupportedWebPaymentConfigurations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v6, "productVersion");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v12, "supportsWebPaymentMode:withExclusionList:clientOSVersion:", 2, v14, v15);

      if (v16)
      {
        PKLogFacilityTypeGetObject(8uLL);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v12;
          _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Default pass: %@", buf, 0xCu);
        }

        v18 = -[PKRemotePaymentInstrument initWithPaymentPass:]([PKRemotePaymentInstrument alloc], "initWithPaymentPass:", v12);
        -[PKProtobufPaymentDeviceResponse paymentInstruments](v7, "paymentInstruments");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __78__PKIDSManager__preparePaymentDeviceResponseForRequestingDevice_userDisabled___block_invoke_170;
        v23[3] = &unk_1E2ADA058;
        v24 = v18;
        v20 = v18;
        v21 = objc_msgSend(v19, "indexOfObjectPassingTest:", v23);

        if (v21 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Unable to match the default card to provided passes", buf, 2u);
          }

        }
        else
        {
          -[PKProtobufPaymentDeviceResponse setDefaultPaymentInstrumentIndex:](v7, "setDefaultPaymentInstrumentIndex:", v21);
        }

      }
    }
    -[PKProtobufPaymentDeviceResponse setLocked:](v7, "setLocked:", MKBGetDeviceLockState() != 0);

  }
  return v7;
}

void __78__PKIDSManager__preparePaymentDeviceResponseForRequestingDevice_userDisabled___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 32), "supportedSetupFeatures");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "protobuf");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __78__PKIDSManager__preparePaymentDeviceResponseForRequestingDevice_userDisabled___block_invoke_170(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "passIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqualToString:", v5);
  return v6;
}

- (id)_fetchPaymentInstrumentsForRequestingDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  __objc2_class **v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  __objc2_class **v21;
  PKIDSManagerDataSource *dataSource;
  PKIDSManagerDataSource *v23;
  void *v24;
  void *v25;
  void *v27;
  PKIDSManager *v28;
  NSObject *group;
  id v30;
  id obj;
  _QWORD v32[4];
  id v33;
  NSObject *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PKIDSManagerDataSource paymentPassesForContinuityDiscovery:](self->_dataSource, "paymentPassesForContinuityDiscovery:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (-[PKIDSManagerDataSource webServiceConfigurationForContinuityPayments:](self->_dataSource, "webServiceConfigurationForContinuityPayments:", self), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v27 = v6;
      objc_msgSend(v6, "unsupportedWebPaymentConfigurations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __60__PKIDSManager__fetchPaymentInstrumentsForRequestingDevice___block_invoke;
      v39[3] = &unk_1E2ADA080;
      v40 = v7;
      v41 = v4;
      v8 = v7;
      objc_msgSend(v5, "pk_objectsPassingTest:", v39);
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v9;
    }
    else
    {
      v27 = 0;
    }
    group = dispatch_group_create();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v5;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    if (v10)
    {
      v11 = v10;
      v28 = self;
      v12 = 0;
      v13 = *(_QWORD *)v36;
      v14 = off_1E2AA0000;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v36 != v13)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          v17 = (void *)objc_msgSend(objc_alloc(v14[159]), "initWithPaymentPass:", v16);
          if (objc_msgSend(v16, "hasAssociatedPeerPaymentAccount"))
          {
            v18 = v17;
            v19 = v12;
            v20 = v18;

            dispatch_group_enter(group);
            v21 = v14;
            dataSource = v28->_dataSource;
            v32[0] = MEMORY[0x1E0C809B0];
            v32[1] = 3221225472;
            v32[2] = __60__PKIDSManager__fetchPaymentInstrumentsForRequestingDevice___block_invoke_2;
            v32[3] = &unk_1E2ADA0A8;
            v12 = v20;
            v33 = v12;
            v34 = group;
            v23 = dataSource;
            v14 = v21;
            -[PKIDSManagerDataSource accountForPaymentPass:manager:completion:](v23, "accountForPaymentPass:manager:completion:", v16, v28, v32);

            v24 = v33;
          }
          else
          {
            objc_msgSend(v17, "protobuf");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "addObject:", v24);
          }

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }

    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
    if (v12)
    {
      objc_msgSend(v12, "protobuf");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObject:", v25);

    }
  }

  return v30;
}

uint64_t __60__PKIDSManager__fetchPaymentInstrumentsForRequestingDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = a2;
  objc_msgSend(v3, "deviceInAppPaymentApplications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
  {

    goto LABEL_5;
  }
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "productVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v3, "supportsWebPaymentMode:withExclusionList:clientOSVersion:", 2, v5, v6);

  if ((_DWORD)v5)
  {
LABEL_5:
    objc_msgSend(v3, "devicePrimaryPaymentApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "productVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "supportsWebPaymentMode:withExclusionList:clientOSVersion:", 2, v9, v10);

    goto LABEL_6;
  }
  v7 = 0;
LABEL_6:

  return v7;
}

void __60__PKIDSManager__fetchPaymentInstrumentsForRequestingDevice___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v4, "currentBalance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPeerPaymentAccountBalance:", v5);

    v6 = *(void **)(a1 + 32);
    v7 = objc_msgSend(v4, "state");

    objc_msgSend(v6, "setPeerPaymentAccountState:", v7);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *callbackQueue;
  _QWORD v17[6];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(8uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[PKIDSManager service:activeAccountsChanged:]";
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  -[PKIDSManager delegates](self, "delegates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    v13 = MEMORY[0x1E0C809B0];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14);
        callbackQueue = self->_callbackQueue;
        v17[0] = v13;
        v17[1] = 3221225472;
        v17[2] = __46__PKIDSManager_service_activeAccountsChanged___block_invoke;
        v17[3] = &unk_1E2ABE0D0;
        v17[4] = v15;
        v17[5] = self;
        dispatch_async(callbackQueue, v17);
        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

uint64_t __46__PKIDSManager_service_activeAccountsChanged___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "managerAccountsDidChange:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *callbackQueue;
  _QWORD v17[6];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(8uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[PKIDSManager service:devicesChanged:]";
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  -[PKIDSManager delegates](self, "delegates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    v13 = MEMORY[0x1E0C809B0];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14);
        callbackQueue = self->_callbackQueue;
        v17[0] = v13;
        v17[1] = 3221225472;
        v17[2] = __39__PKIDSManager_service_devicesChanged___block_invoke_180;
        v17[3] = &unk_1E2ABE0D0;
        v17[4] = v15;
        v17[5] = self;
        dispatch_async(callbackQueue, v17);
        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

uint64_t __39__PKIDSManager_service_devicesChanged___block_invoke_180(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "managerDevicesDidChange:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *callbackQueue;
  _QWORD block[4];
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  PKLogFacilityTypeGetObject(8uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v12;
    v21 = 2112;
    v22 = v13;
    _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "IDS Service has delivered message: %@, context: %@", buf, 0x16u);
  }

  -[NSMutableDictionary objectForKey:](self->_completionHandlers, "objectForKey:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_completionHandlers, "removeObjectForKey:", v12);
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__PKIDSManager_service_account_identifier_hasBeenDeliveredWithContext___block_invoke;
    block[3] = &unk_1E2ABD9A0;
    v18 = v15;
    dispatch_async(callbackQueue, block);

  }
}

uint64_t __71__PKIDSManager_service_account_identifier_hasBeenDeliveredWithContext___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(8uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136316418;
    v14 = "-[PKIDSManager service:account:incomingUnhandledProtobuf:fromID:context:]";
    v15 = 2112;
    v16 = a3;
    v17 = 2112;
    v18 = a4;
    v19 = 2112;
    v20 = a5;
    v21 = 2112;
    v22 = a6;
    v23 = 2112;
    v24 = a7;
    _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "%s %@ %@ %@ %@ %@", (uint8_t *)&v13, 0x3Eu);
  }

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  char *v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *callbackQueue;
  id *v19;
  id v20;
  NSMutableDictionary *thumbnailCompletionHandlers;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  NSObject *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  char *v50;
  _QWORD block[4];
  id v52;
  id v53;
  _BYTE v54[128];
  uint8_t v55[128];
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  __int16 v62;
  char *v63;
  __int16 v64;
  _BOOL4 v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v8 = a6;
  v68 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = (char *)a5;
  v15 = a7;
  PKLogFacilityTypeGetObject(8uLL);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v57 = "-[PKIDSManager service:account:identifier:didSendWithSuccess:error:]";
    v58 = 2112;
    v59 = v12;
    v60 = 2112;
    v61 = v13;
    v62 = 2112;
    v63 = v14;
    v64 = 1024;
    v65 = v8;
    v66 = 2112;
    v67 = v15;
    _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "%s %@ %@ %@ %d %@", buf, 0x3Au);
  }

  if (!v8)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v57 = v14;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Failed to send with success: %@", buf, 0xCu);
    }

    -[NSMutableDictionary objectForKey:](self->_completionHandlers, "objectForKey:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_completionHandlers, "removeObjectForKey:", v14);
      callbackQueue = self->_callbackQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __68__PKIDSManager_service_account_identifier_didSendWithSuccess_error___block_invoke;
      block[3] = &unk_1E2ABDA18;
      v19 = &v53;
      v53 = v17;
      v52 = v15;
      dispatch_async(callbackQueue, block);
      v20 = v52;
    }
    else
    {
      thumbnailCompletionHandlers = self->_thumbnailCompletionHandlers;
      v22 = MEMORY[0x1E0C809B0];
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __68__PKIDSManager_service_account_identifier_didSendWithSuccess_error___block_invoke_2;
      v49[3] = &unk_1E2AD9E40;
      v19 = (id *)&v50;
      v50 = v14;
      -[NSMutableDictionary keysOfEntriesPassingTest:](thumbnailCompletionHandlers, "keysOfEntriesPassingTest:", v49);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "count"))
      {
        v32 = v13;
        v33 = v12;
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v20 = v20;
        v36 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
        if (v36)
        {
          v34 = *(_QWORD *)v46;
          v35 = v20;
          do
          {
            v23 = 0;
            do
            {
              if (*(_QWORD *)v46 != v34)
                objc_enumerationMutation(v20);
              v37 = v23;
              -[NSMutableDictionary objectForKey:](self->_thumbnailCompletionHandlers, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v23));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKIDSManager _queue_removeThumbnailCompletionHandlersForKeys:](self, "_queue_removeThumbnailCompletionHandlersForKeys:", v20);
              v43 = 0u;
              v44 = 0u;
              v41 = 0u;
              v42 = 0u;
              v25 = v24;
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
              if (v26)
              {
                v27 = v26;
                v28 = *(_QWORD *)v42;
                do
                {
                  for (i = 0; i != v27; ++i)
                  {
                    if (*(_QWORD *)v42 != v28)
                      objc_enumerationMutation(v25);
                    v30 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
                    v31 = self->_callbackQueue;
                    v38[0] = v22;
                    v38[1] = 3221225472;
                    v38[2] = __68__PKIDSManager_service_account_identifier_didSendWithSuccess_error___block_invoke_3;
                    v38[3] = &unk_1E2ABDA18;
                    v40 = v30;
                    v39 = v15;
                    dispatch_async(v31, v38);

                  }
                  v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
                }
                while (v27);
              }

              v23 = v37 + 1;
              v20 = v35;
            }
            while (v37 + 1 != v36);
            v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
          }
          while (v36);
        }

        v13 = v32;
        v12 = v33;
        v17 = 0;
        v19 = (id *)&v50;
      }
    }

  }
}

uint64_t __68__PKIDSManager_service_account_identifier_didSendWithSuccess_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __68__PKIDSManager_service_account_identifier_didSendWithSuccess_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "requestIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __68__PKIDSManager_service_account_identifier_didSendWithSuccess_error___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)deleteArchivedDevices
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  PKLogFacilityTypeGetObject(8uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Deleting IDS device archive", v9, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKHomeDirectoryPath();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("RemoteDevices.archive"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "removeItemAtPath:error:", v6, 0);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKRemoteInstrumentThumbnailsCachePath();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeItemAtPath:error:", v8, 0);

  -[PKIDSManager _createThumbnailCacheDirectory](self, "_createThumbnailCacheDirectory");
}

- (id)_remoteDevicesWithArchive
{
  return objc_alloc_init(MEMORY[0x1E0C99DE8]);
}

- (void)_createThumbnailCacheDirectory
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  char v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  PKRemoteInstrumentThumbnailsCachePath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v2, &v10);

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v6 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v2, 1, 0, &v9);
    v7 = v9;

    if ((v6 & 1) == 0)
    {
      PKLogFacilityTypeGetObject(8uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v7;
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Failed to create thumbnail cache: %@", buf, 0xCu);
      }

    }
  }

}

- (PKIDSManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  self->_dataSource = (PKIDSManagerDataSource *)a3;
}

- (NSMutableArray)pendingCancellations
{
  return self->_pendingCancellations;
}

- (void)setPendingCancellations:(id)a3
{
  objc_storeStrong((id *)&self->_pendingCancellations, a3);
}

- (NSMutableDictionary)pendingDiscoveries
{
  return self->_pendingDiscoveries;
}

- (void)setPendingDiscoveries:(id)a3
{
  objc_storeStrong((id *)&self->_pendingDiscoveries, a3);
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (NSMutableDictionary)recentlySeenUUIDs
{
  return self->_recentlySeenUUIDs;
}

- (void)setRecentlySeenUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_recentlySeenUUIDs, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_recentlySeenUUIDs, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_pendingDiscoveries, 0);
  objc_storeStrong((id *)&self->_pendingCancellations, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_proximityAdvertiser, 0);
  objc_storeStrong((id *)&self->_thumbnailCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_paymentRequests, 0);
  objc_storeStrong((id *)&self->_remoteDevices, 0);
}

@end
