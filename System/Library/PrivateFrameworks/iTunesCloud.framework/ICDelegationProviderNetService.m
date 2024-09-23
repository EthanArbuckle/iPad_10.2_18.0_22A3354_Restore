@implementation ICDelegationProviderNetService

- (ICDelegationProviderNetService)initWithNetService:(id)a3
{
  id v5;
  ICDelegationProviderNetService *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *calloutQueue;
  NSNetService *netService;
  void *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ICDelegationProviderNetService;
  v6 = -[ICDelegationProviderNetService init](&v14, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationProviderNetService.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v6->_accessQueue;
    v6->_accessQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationProviderNetService.serialQueue", 0);
    calloutQueue = v6->_calloutQueue;
    v6->_calloutQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_netService, a3);
    -[NSNetService setDelegate:](v6->_netService, "setDelegate:", v6);
    v6->_state = 1;
    netService = v6->_netService;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNetService scheduleInRunLoop:forMode:](netService, "scheduleInRunLoop:forMode:", v12, *MEMORY[0x1E0C99860]);

    -[NSNetService resolveWithTimeout:](v6->_netService, "resolveWithTimeout:", 10.0);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[NSNetService setDelegate:](self->_netService, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ICDelegationProviderNetService;
  -[ICDelegationProviderNetService dealloc](&v3, sel_dealloc);
}

- (void)netService:(id)a3 didUpdateTXTRecordData:(id)a4
{
  NSObject *v5;
  NSObject *accessQueue;
  _QWORD block[5];
  uint8_t buf[4];
  ICDelegationProviderNetService *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = self;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: TXT record data updated.", buf, 0xCu);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__ICDelegationProviderNetService_netService_didUpdateTXTRecordData___block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

- (void)netServiceDidResolveAddress:(id)a3
{
  NSObject *v4;
  NSObject *accessQueue;
  _QWORD block[5];
  uint8_t buf[4];
  ICDelegationProviderNetService *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = self;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Net service did resolve address.", buf, 0xCu);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__ICDelegationProviderNetService_netServiceDidResolveAddress___block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

- (void)netService:(id)a3 didNotResolve:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *accessQueue;
  _QWORD block[5];
  uint8_t buf[4];
  ICDelegationProviderNetService *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Net service did not resolve address with error dictionary: %{public}@.", buf, 0x16u);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ICDelegationProviderNetService_netService_didNotResolve___block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_barrier_async(accessQueue, block);

}

- (void)getResolvedStreamsWithCompletionHandler:(id)a3
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
  v7[2] = __74__ICDelegationProviderNetService_getResolvedStreamsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4390EF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

- (NSArray)delegationAccountUUIDs
{
  NSObject *accessQueue;
  void *v3;
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
  v9 = __Block_byref_object_copy__34189;
  v10 = __Block_byref_object_dispose__34190;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__ICDelegationProviderNetService_delegationAccountUUIDs__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  objc_msgSend((id)v7[5], "delegationAccountUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSString)deviceName
{
  NSObject *accessQueue;
  void *v3;
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
  v9 = __Block_byref_object_copy__34189;
  v10 = __Block_byref_object_dispose__34190;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__ICDelegationProviderNetService_deviceName__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  objc_msgSend((id)v7[5], "deviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (int64_t)securityMode
{
  NSObject *accessQueue;
  int64_t v3;
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
  v9 = __Block_byref_object_copy__34189;
  v10 = __Block_byref_object_dispose__34190;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__ICDelegationProviderNetService_securityMode__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = objc_msgSend((id)v7[5], "securityMode");
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_resolveWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *resolutionCompletionHandlers;
  NSMutableArray *v7;
  NSMutableArray *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = v4;
  if (self->_state == 1)
  {
    resolutionCompletionHandlers = self->_resolutionCompletionHandlers;
    if (!resolutionCompletionHandlers)
    {
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v8 = self->_resolutionCompletionHandlers;
      self->_resolutionCompletionHandlers = v7;

      resolutionCompletionHandlers = self->_resolutionCompletionHandlers;
    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__ICDelegationProviderNetService__resolveWithCompletionHandler___block_invoke;
    v10[3] = &unk_1E4390D18;
    v11 = v5;
    v9 = (void *)MEMORY[0x1A1AFA8D0](v10);
    -[NSMutableArray addObject:](resolutionCompletionHandlers, "addObject:", v9);

  }
  else
  {
    (*((void (**)(id))v4 + 2))(v4);
  }

}

- (void)_setState:(int64_t)a3
{
  void *v4;
  NSMutableArray *resolutionCompletionHandlers;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  self->_state = a3;
  if (a3 != 1)
  {
    v4 = (void *)-[NSMutableArray copy](self->_resolutionCompletionHandlers, "copy");
    resolutionCompletionHandlers = self->_resolutionCompletionHandlers;
    self->_resolutionCompletionHandlers = 0;

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)_updateTXTRecordProperties
{
  void *v3;
  ICDelegationNetServiceTXTRecord *v4;
  ICDelegationNetServiceTXTRecord *txtRecord;
  NSObject *v6;
  NSObject *calloutQueue;
  _QWORD block[5];
  uint8_t buf[4];
  ICDelegationProviderNetService *v10;
  __int16 v11;
  ICDelegationNetServiceTXTRecord *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[NSNetService TXTRecordData](self->_netService, "TXTRecordData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[ICDelegationNetServiceTXTRecord initWithTXTRecordData:]([ICDelegationNetServiceTXTRecord alloc], "initWithTXTRecordData:", v3);
  else
    v4 = 0;
  txtRecord = self->_txtRecord;
  if (txtRecord != v4 && !-[ICDelegationNetServiceTXTRecord isEqual:](txtRecord, "isEqual:", v4))
  {
    objc_storeStrong((id *)&self->_txtRecord, v4);
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v10 = self;
      v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Updated net service TXTRecord: %{public}@", buf, 0x16u);
    }

    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__ICDelegationProviderNetService__updateTXTRecordProperties__block_invoke;
    block[3] = &unk_1E43913D8;
    block[4] = self;
    dispatch_async(calloutQueue, block);
  }

}

- (NSNetService)netService
{
  return self->_netService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netService, 0);
  objc_storeStrong((id *)&self->_txtRecord, 0);
  objc_storeStrong((id *)&self->_resolutionCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_netServiceStreamResolutionQueue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __60__ICDelegationProviderNetService__updateTXTRecordProperties__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ICDelegationProviderNetServiceDelegationAccountUUIDsDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

uint64_t __64__ICDelegationProviderNetService__resolveWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __46__ICDelegationProviderNetService_securityMode__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

void __44__ICDelegationProviderNetService_deviceName__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

void __56__ICDelegationProviderNetService_delegationAccountUUIDs__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

void __74__ICDelegationProviderNetService_getResolvedStreamsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __74__ICDelegationProviderNetService_getResolvedStreamsWithCompletionHandler___block_invoke_2;
  v2[3] = &unk_1E4390EF8;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_resolveWithCompletionHandler:", v2);

}

void __74__ICDelegationProviderNetService_getResolvedStreamsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  _QWORD block[5];
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 40) == 2)
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v17 = v4;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Resolved net service.", buf, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 24);
    if (!v6)
    {
      v7 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationProviderNetService.netServiceStreamResolutionQueue", 0);
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 24);
      *(_QWORD *)(v8 + 24) = v7;

      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(NSObject **)(v5 + 24);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__ICDelegationProviderNetService_getResolvedStreamsWithCompletionHandler___block_invoke_7;
    block[3] = &unk_1E4390EF8;
    block[4] = v5;
    v15 = *(id *)(a1 + 40);
    dispatch_async(v6, block);
    v10 = v15;
  }
  else
  {
    v11 = *(NSObject **)(v2 + 16);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __74__ICDelegationProviderNetService_getResolvedStreamsWithCompletionHandler___block_invoke_2_11;
    v12[3] = &unk_1E4390D18;
    v13 = *(id *)(a1 + 40);
    dispatch_async(v11, v12);
    v10 = v13;
  }

}

void __74__ICDelegationProviderNetService_getResolvedStreamsWithCompletionHandler___block_invoke_7(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  BOOL v9;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  v24 = 0;
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v27 = v3;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Getting streams...", buf, 0xCu);
  }

  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "getInputStream:outputStream:", &v25, &v24);
  v5 = v25;
  v6 = v24;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
    v9 = v5 == 0;
  else
    v9 = 1;
  if (v9 || v6 == 0)
  {
    if (v8)
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v27 = v11;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to create streams.", buf, 0xCu);
    }

    v12 = *(void **)(a1 + 40);
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __74__ICDelegationProviderNetService_getResolvedStreamsWithCompletionHandler___block_invoke_9;
    v18[3] = &unk_1E4390D18;
    v14 = &v19;
    v19 = v12;
    dispatch_async(v13, v18);
  }
  else
  {
    if (v8)
    {
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v27 = v15;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully created streams.", buf, 0xCu);
    }

    v16 = *(void **)(a1 + 40);
    v17 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__ICDelegationProviderNetService_getResolvedStreamsWithCompletionHandler___block_invoke_8;
    block[3] = &unk_1E4390E58;
    v14 = &v23;
    v23 = v16;
    v21 = v25;
    v22 = v24;
    dispatch_async(v17, block);

  }
}

void __74__ICDelegationProviderNetService_getResolvedStreamsWithCompletionHandler___block_invoke_2_11(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, v2);

}

uint64_t __74__ICDelegationProviderNetService_getResolvedStreamsWithCompletionHandler___block_invoke_8(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

void __74__ICDelegationProviderNetService_getResolvedStreamsWithCompletionHandler___block_invoke_9(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, v2);

}

uint64_t __59__ICDelegationProviderNetService_netService_didNotResolve___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setState:", 3);
}

uint64_t __62__ICDelegationProviderNetService_netServiceDidResolveAddress___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 40) != 3)
  {
    objc_msgSend((id)v2, "_setState:", 2);
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 56), "startMonitoring");
  return objc_msgSend(*(id *)(a1 + 32), "_updateTXTRecordProperties");
}

uint64_t __68__ICDelegationProviderNetService_netService_didUpdateTXTRecordData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTXTRecordProperties");
}

@end
