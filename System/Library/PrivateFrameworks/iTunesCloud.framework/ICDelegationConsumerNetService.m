@implementation ICDelegationConsumerNetService

- (ICDelegationConsumerNetService)initWithUserIdentityDelegationAccountUUIDs:(id)a3
{
  id v4;
  ICDelegationConsumerNetService *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v8;
  OS_dispatch_queue *netServiceQueue;
  dispatch_queue_t v10;
  OS_dispatch_queue *calloutQueue;
  uint64_t v12;
  NSDictionary *userIdentityDelegationAccountUUIDs;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICDelegationConsumerNetService;
  v5 = -[ICDelegationConsumerNetService init](&v15, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationConsumerNetService.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationConsumerNetService.netServiceQueue", 0);
    netServiceQueue = v5->_netServiceQueue;
    v5->_netServiceQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationConsumerNetService.calloutQueue", 0);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v10;

    v12 = objc_msgSend(v4, "copy");
    userIdentityDelegationAccountUUIDs = v5->_userIdentityDelegationAccountUUIDs;
    v5->_userIdentityDelegationAccountUUIDs = (NSDictionary *)v12;

  }
  return v5;
}

- (void)dealloc
{
  NSNetService *v3;
  NSObject *netServiceQueue;
  NSNetService *v5;
  objc_super v6;
  _QWORD block[4];
  NSNetService *v8;

  -[NSNetService setDelegate:](self->_netService, "setDelegate:", 0);
  if (self->_isPublished)
  {
    v3 = self->_netService;
    netServiceQueue = self->_netServiceQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__ICDelegationConsumerNetService_dealloc__block_invoke;
    block[3] = &unk_1E43913D8;
    v8 = v3;
    v5 = v3;
    dispatch_async(netServiceQueue, block);

  }
  v6.receiver = self;
  v6.super_class = (Class)ICDelegationConsumerNetService;
  -[ICDelegationConsumerNetService dealloc](&v6, sel_dealloc);
}

- (void)netService:(id)a3 didAcceptConnectionWithInputStream:(id)a4 outputStream:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *accessQueue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  ICDelegationConsumerNetService *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v19 = self;
    v20 = 2114;
    v21 = v8;
    v22 = 2114;
    v23 = v9;
    v24 = 2114;
    v25 = v10;
    _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Did accept connection with service: %{public}@ input: %{public}@ output: %{public}@", buf, 0x2Au);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__ICDelegationConsumerNetService_netService_didAcceptConnectionWithInputStream_outputStream___block_invoke;
  block[3] = &unk_1E4391230;
  block[4] = self;
  v16 = v9;
  v17 = v10;
  v13 = v10;
  v14 = v9;
  dispatch_async(accessQueue, block);

}

- (void)netServiceDidPublish:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  ICDelegationConsumerNetService *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543618;
    v7 = self;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Remote server advertisement success with service: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)netService:(id)a3 didNotPublish:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  NSObject *v14;
  NSObject *accessQueue;
  uint64_t v16;
  dispatch_time_t v17;
  NSObject *v18;
  _QWORD v19[5];
  _QWORD block[6];
  uint8_t buf[4];
  ICDelegationConsumerNetService *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0C92B28];
  v9 = *MEMORY[0x1E0C92B20];
  v10 = a4;
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, objc_msgSend(v11, "integerValue"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "code") == -72001)
    v13 = 0.0;
  else
    v13 = 5.0;
  v14 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v22 = self;
    v23 = 2114;
    v24 = v6;
    v25 = 2114;
    v26 = v12;
    v27 = 2048;
    v28 = v13;
    _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Remote server advertisement failed with service: %{public}@, error: %{public}@, retrying in %f seconds...", buf, 0x2Au);
  }

  accessQueue = self->_accessQueue;
  v16 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ICDelegationConsumerNetService_netService_didNotPublish___block_invoke;
  block[3] = &unk_1E438E1E8;
  block[4] = self;
  *(double *)&block[5] = v13;
  dispatch_barrier_async(accessQueue, block);
  if (v13 > 0.00000011920929)
  {
    v17 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
    dispatch_get_global_queue(0, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19[0] = v16;
    v19[1] = 3221225472;
    v19[2] = __59__ICDelegationConsumerNetService_netService_didNotPublish___block_invoke_2;
    v19[3] = &unk_1E43913D8;
    v19[4] = self;
    dispatch_after(v17, v18, v19);

  }
}

- (ICDelegationServiceSecuritySettings)securitySettings
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
  v9 = __Block_byref_object_copy__2998;
  v10 = __Block_byref_object_dispose__2999;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__ICDelegationConsumerNetService_securitySettings__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ICDelegationServiceSecuritySettings *)v3;
}

- (void)publish
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__ICDelegationConsumerNetService_publish__block_invoke;
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
  block[2] = __38__ICDelegationConsumerNetService_stop__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

- (void)_updateNetServiceStatus
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSNetService *v6;
  NSNetService *netService;
  NSObject *v8;
  NSNetService *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSNetService *v16;
  NSObject *v17;
  NSObject *netServiceQueue;
  NSNetService *v19;
  NSNetService *v20;
  NSNetService *v21;
  NSObject *v22;
  NSObject *v23;
  _QWORD v24[4];
  NSNetService *v25;
  _QWORD block[5];
  id v27;
  NSNetService *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  ICDelegationConsumerNetService *v36;
  __int16 v37;
  NSNetService *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (self->_isPublished)
  {
    if (self->_didPublish)
      return;
    if (!self->_netService)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "UUIDString");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)objc_msgSend(v4, "length") >= 0x40)
      {
        objc_msgSend(v4, "substringToIndex:", 63);
        v5 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v5;
      }
      v6 = (NSNetService *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C38]), "initWithDomain:type:name:port:", CFSTR("local."), CFSTR("_itsdlgt._tcp."), v4, 0);
      netService = self->_netService;
      self->_netService = v6;

      -[NSNetService setDelegate:](self->_netService, "setDelegate:", self);
      v8 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = self->_netService;
        *(_DWORD *)buf = 138543618;
        v36 = self;
        v37 = 2114;
        v38 = v9;
        _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Created net service %{public}@.", buf, 0x16u);
      }

    }
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[NSDictionary objectEnumerator](self->_userIdentityDelegationAccountUUIDs, "objectEnumerator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v31;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(v10, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v15++));
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v13);
    }

    self->_didPublish = 1;
    v16 = self->_netService;
    v17 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v36 = self;
      v37 = 2114;
      v38 = v16;
      _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Published net service %{public}@.", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    netServiceQueue = self->_netServiceQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__ICDelegationConsumerNetService__updateNetServiceStatus__block_invoke;
    block[3] = &unk_1E438A298;
    block[4] = self;
    v27 = v10;
    v19 = (NSNetService *)v10;
    objc_copyWeak(&v29, (id *)buf);
    v28 = v16;
    v20 = v16;
    dispatch_async(netServiceQueue, block);

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v21 = self->_netService;
    v22 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v36 = self;
      v37 = 2114;
      v38 = v21;
      _os_log_impl(&dword_1A03E3000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopped net service %{public}@.", buf, 0x16u);
    }

    self->_didPublish = 0;
    v23 = self->_netServiceQueue;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __57__ICDelegationConsumerNetService__updateNetServiceStatus__block_invoke_17;
    v24[3] = &unk_1E43913D8;
    v25 = v21;
    v19 = v21;
    dispatch_async(v23, v24);

  }
}

- (ICDelegationConsumerNetServiceDelegate)delegate
{
  return (ICDelegationConsumerNetServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDictionary)userIdentityDelegationAccountUUIDs
{
  return self->_userIdentityDelegationAccountUUIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityDelegationAccountUUIDs, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_securitySettings, 0);
  objc_storeStrong((id *)&self->_netServiceQueue, 0);
  objc_storeStrong((id *)&self->_netService, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __57__ICDelegationConsumerNetService__updateNetServiceStatus__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;

  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 40));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__ICDelegationConsumerNetService__updateNetServiceStatus__block_invoke_2;
  v3[3] = &unk_1E438A270;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  v5 = *(id *)(a1 + 48);
  +[ICDelegationServiceSecuritySettings getDeviceReceiverSettingsWithCompletion:](ICDelegationServiceSecuritySettings, "getDeviceReceiverSettingsWithCompletion:", v3);

  objc_destroyWeak(&v6);
}

uint64_t __57__ICDelegationConsumerNetService__updateNetServiceStatus__block_invoke_17(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stop");
}

void __57__ICDelegationConsumerNetService__updateNetServiceStatus__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  ICDelegationNetServiceTXTRecord *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  ICDelegationNetServiceTXTRecord *v9;
  void *v10;
  void *v11;
  _QWORD *WeakRetained;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  _QWORD *v20;
  ICDelegationNetServiceTXTRecord *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  ICDelegationNetServiceTXTRecord *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v23 = v8;
    v24 = 2114;
    v25 = v5;
    v26 = 2114;
    v27 = v6;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Retrieved security settings: %{public}@ with error: %{public}@", buf, 0x20u);
  }

  v9 = objc_alloc_init(ICDelegationNetServiceTXTRecord);
  -[ICDelegationNetServiceTXTRecord setDelegationAccountUUIDs:](v9, "setDelegationAccountUUIDs:", *(_QWORD *)(a1 + 40));
  -[ICDelegationNetServiceTXTRecord setServiceVersion:](v9, "setServiceVersion:", 1);
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deviceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDelegationNetServiceTXTRecord setDeviceName:](v9, "setDeviceName:", v11);

  if (v5)
  {
    -[ICDelegationNetServiceTXTRecord setSecurityMode:](v9, "setSecurityMode:", -[ICDelegationNetServiceTXTRecord securityMode](v5, "securityMode"));
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v13 = WeakRetained;
    if (WeakRetained)
    {
      v14 = WeakRetained[1];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __57__ICDelegationConsumerNetService__updateNetServiceStatus__block_invoke_15;
      v19[3] = &unk_1E4391110;
      v20 = WeakRetained;
      v21 = v5;
      dispatch_barrier_async(v14, v19);

    }
  }
  v15 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v23 = v16;
    v24 = 2114;
    v25 = v9;
    _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Published net service TXTRecord: %{public}@", buf, 0x16u);
  }

  v17 = *(void **)(a1 + 48);
  -[ICDelegationNetServiceTXTRecord TXTRecordData](v9, "TXTRecordData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTXTRecordData:", v18);

  objc_msgSend(*(id *)(a1 + 48), "publishWithOptions:", 2051);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 40));

}

void __57__ICDelegationConsumerNetService__updateNetServiceStatus__block_invoke_15(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
}

uint64_t __38__ICDelegationConsumerNetService_stop__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 25))
  {
    *(_BYTE *)(v1 + 25) = 0;
    return objc_msgSend(*(id *)(result + 32), "_updateNetServiceStatus");
  }
  return result;
}

uint64_t __41__ICDelegationConsumerNetService_publish__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 25))
  {
    *(_BYTE *)(v1 + 25) = 1;
    return objc_msgSend(*(id *)(result + 32), "_updateNetServiceStatus");
  }
  return result;
}

void __50__ICDelegationConsumerNetService_securitySettings__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

void __59__ICDelegationConsumerNetService_netService_didNotPublish___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "stop");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  if (*(double *)(a1 + 40) <= 0.00000011920929)
    objc_msgSend(*(id *)(a1 + 32), "_updateNetServiceStatus");
}

void __59__ICDelegationConsumerNetService_netService_didNotPublish___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ICDelegationConsumerNetService_netService_didNotPublish___block_invoke_3;
  block[3] = &unk_1E43913D8;
  block[4] = v1;
  dispatch_barrier_async(v2, block);
}

uint64_t __59__ICDelegationConsumerNetService_netService_didNotPublish___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateNetServiceStatus");
}

void __93__ICDelegationConsumerNetService_netService_didAcceptConnectionWithInputStream_outputStream___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __93__ICDelegationConsumerNetService_netService_didAcceptConnectionWithInputStream_outputStream___block_invoke_2;
    v7[3] = &unk_1E43912A8;
    v4 = WeakRetained;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v8 = v4;
    v9 = v5;
    v10 = v6;
    v11 = *(id *)(a1 + 48);
    dispatch_async(v3, v7);

  }
}

uint64_t __93__ICDelegationConsumerNetService_netService_didAcceptConnectionWithInputStream_outputStream___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "delegationConsumerNetService:didAcceptConnectionWithInputStream:outputStream:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __41__ICDelegationConsumerNetService_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stop");
}

@end
