@implementation SFBLEClient

- (id)addNearbyDelegate:(id)a3
{
  id v4;
  SFBLEClient *v5;
  uint64_t Int64;
  _BOOL4 IsVirtualMachine;
  _BOOL4 v8;
  objc_class *v9;
  uint64_t v10;
  WPNearby *wpNearby;
  NSMutableSet *wpNearbyDelegates;
  NSMutableSet *v13;
  NSMutableSet *v14;
  WPNearby *v15;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5->_wpNearby)
  {
    Int64 = CFPrefs_GetInt64();
    IsVirtualMachine = SFDeviceIsVirtualMachine();
    if (Int64)
      v8 = 0;
    else
      v8 = IsVirtualMachine;
    if (v8)
      v9 = (objc_class *)WPBonjourNearBy;
    else
      v9 = (Class)getWPNearbyClass[0]();
    v10 = objc_msgSend([v9 alloc], "initWithDelegate:queue:", v5, v5->_dispatchQueue);
    wpNearby = v5->_wpNearby;
    v5->_wpNearby = (WPNearby *)v10;

  }
  wpNearbyDelegates = v5->_wpNearbyDelegates;
  if (!wpNearbyDelegates)
  {
    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v14 = v5->_wpNearbyDelegates;
    v5->_wpNearbyDelegates = v13;

    wpNearbyDelegates = v5->_wpNearbyDelegates;
  }
  -[NSMutableSet addObject:](wpNearbyDelegates, "addObject:", v4);
  v15 = v5->_wpNearby;
  objc_sync_exit(v5);

  return v15;
}

+ (id)sharedClient
{
  if (sharedClient_sOnce != -1)
    dispatch_once(&sharedClient_sOnce, &__block_literal_global_30);
  return (id)sharedClient_sClient;
}

- (void)nearby:(id)a3 didStartScanningForType:(int64_t)a4
{
  id v6;
  SFBLEClient *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  int64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMutableSet allObjects](v7->_wpNearbyDelegates, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v12, "dispatchQueue");
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13 == v7->_dispatchQueue)
          {
            objc_msgSend(v12, "nearby:didStartScanningForType:", v6, a4);
          }
          else
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __46__SFBLEClient_nearby_didStartScanningForType___block_invoke;
            block[3] = &unk_1E4831000;
            block[4] = v12;
            v15 = v6;
            v16 = a4;
            dispatch_async(v13, block);

          }
        }
        else
        {
          v13 = 0;
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  objc_sync_exit(v7);
}

- (void)nearby:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6 peerInfo:(id)a7
{
  id v11;
  SFBLEClient *v12;
  SFBLEClient *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  id v21;
  id v22;
  id v23;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  id v28;
  int64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v22 = a5;
  v21 = a6;
  v11 = a7;
  v12 = self;
  objc_sync_enter(v12);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = v12;
  -[NSMutableSet allObjects](v12->_wpNearbyDelegates, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v31;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v17);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v18, "dispatchQueue");
          v19 = objc_claimAutoreleasedReturnValue();
          if (v19 == v13->_dispatchQueue)
          {
            objc_msgSend(v18, "nearby:didDiscoverType:withData:fromPeer:peerInfo:", v23, a4, v22, v21, v11);
          }
          else
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __65__SFBLEClient_nearby_didDiscoverType_withData_fromPeer_peerInfo___block_invoke;
            block[3] = &unk_1E4831028;
            block[4] = v18;
            v25 = v23;
            v29 = a4;
            v26 = v22;
            v27 = v21;
            v28 = v11;
            dispatch_async(v19, block);

          }
        }
        else
        {
          v19 = 0;
        }

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v15);
  }

  objc_sync_exit(v13);
}

- (void)removeNearbyDelegate:(id)a3
{
  SFBLEClient *v4;
  WPNearby *wpNearby;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableSet removeObject:](v4->_wpNearbyDelegates, "removeObject:", v6);
  if (!-[NSMutableSet count](v4->_wpNearbyDelegates, "count"))
  {
    if (gLogCategory_SFBLEClient <= 30 && (gLogCategory_SFBLEClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
    -[WPNearby invalidate](v4->_wpNearby, "invalidate");
    wpNearby = v4->_wpNearby;
    v4->_wpNearby = 0;

  }
  objc_sync_exit(v4);

}

void __27__SFBLEClient_sharedClient__block_invoke()
{
  SFBLEClient *v0;
  void *v1;

  v0 = objc_alloc_init(SFBLEClient);
  v1 = (void *)sharedClient_sClient;
  sharedClient_sClient = (uint64_t)v0;

}

- (SFBLEClient)init
{
  SFBLEClient *v2;
  uint64_t v3;
  OS_dispatch_queue *dispatchQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFBLEClient;
  v2 = -[SFBLEClient init](&v6, sel_init);
  if (v2)
  {
    if (CFPrefs_GetInt64())
      SFHighPriorityQueue();
    else
      SFMainQueue(0);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (id)addAirDropDelegate:(id)a3
{
  id v4;
  SFBLEClient *v5;
  uint64_t v6;
  WPAWDL *wpAirDrop;
  NSMutableSet *wpAirDropDelegates;
  NSMutableSet *v9;
  NSMutableSet *v10;
  WPAWDL *v11;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5->_wpAirDrop)
  {
    v6 = objc_msgSend(objc_alloc((Class)getWPAWDLClass[0]()), "initWithDelegate:queue:", v5, v5->_dispatchQueue);
    wpAirDrop = v5->_wpAirDrop;
    v5->_wpAirDrop = (WPAWDL *)v6;

  }
  wpAirDropDelegates = v5->_wpAirDropDelegates;
  if (!wpAirDropDelegates)
  {
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v10 = v5->_wpAirDropDelegates;
    v5->_wpAirDropDelegates = v9;

    wpAirDropDelegates = v5->_wpAirDropDelegates;
  }
  -[NSMutableSet addObject:](wpAirDropDelegates, "addObject:", v4);
  v11 = v5->_wpAirDrop;
  objc_sync_exit(v5);

  return v11;
}

- (void)removeAirDropDelegate:(id)a3
{
  SFBLEClient *v4;
  WPAWDL *wpAirDrop;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableSet removeObject:](v4->_wpAirDropDelegates, "removeObject:", v6);
  if (!-[NSMutableSet count](v4->_wpAirDropDelegates, "count"))
  {
    if (gLogCategory_SFBLEClient <= 30 && (gLogCategory_SFBLEClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
    -[WPAWDL invalidate](v4->_wpAirDrop, "invalidate");
    wpAirDrop = v4->_wpAirDrop;
    v4->_wpAirDrop = 0;

  }
  objc_sync_exit(v4);

}

- (void)awdlDidUpdateState:(id)a3
{
  id v4;
  SFBLEClient *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableSet allObjects](v5->_wpAirDropDelegates, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, "dispatchQueue");
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11 == v5->_dispatchQueue)
          {
            objc_msgSend(v10, "awdlDidUpdateState:", v4);
          }
          else
          {
            v12[0] = MEMORY[0x1E0C809B0];
            v12[1] = 3221225472;
            v12[2] = __34__SFBLEClient_awdlDidUpdateState___block_invoke;
            v12[3] = &unk_1E482D3A0;
            v12[4] = v10;
            v13 = v4;
            dispatch_async(v11, v12);

          }
        }
        else
        {
          v11 = 0;
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

uint64_t __34__SFBLEClient_awdlDidUpdateState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "awdlDidUpdateState:", *(_QWORD *)(a1 + 40));
}

- (void)awdlStartedAdvertising:(id)a3
{
  id v4;
  SFBLEClient *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableSet allObjects](v5->_wpAirDropDelegates, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, "dispatchQueue");
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11 == v5->_dispatchQueue)
          {
            objc_msgSend(v10, "awdlStartedAdvertising:", v4);
          }
          else
          {
            v12[0] = MEMORY[0x1E0C809B0];
            v12[1] = 3221225472;
            v12[2] = __38__SFBLEClient_awdlStartedAdvertising___block_invoke;
            v12[3] = &unk_1E482D3A0;
            v12[4] = v10;
            v13 = v4;
            dispatch_async(v11, v12);

          }
        }
        else
        {
          v11 = 0;
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

uint64_t __38__SFBLEClient_awdlStartedAdvertising___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "awdlStartedAdvertising:", *(_QWORD *)(a1 + 40));
}

- (void)awdlAdvertisingPending:(id)a3
{
  id v4;
  SFBLEClient *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableSet allObjects](v5->_wpAirDropDelegates, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, "dispatchQueue");
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11 == v5->_dispatchQueue)
          {
            objc_msgSend(v10, "awdlAdvertisingPending:", v4);
          }
          else
          {
            v12[0] = MEMORY[0x1E0C809B0];
            v12[1] = 3221225472;
            v12[2] = __38__SFBLEClient_awdlAdvertisingPending___block_invoke;
            v12[3] = &unk_1E482D3A0;
            v12[4] = v10;
            v13 = v4;
            dispatch_async(v11, v12);

          }
        }
        else
        {
          v11 = 0;
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

uint64_t __38__SFBLEClient_awdlAdvertisingPending___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "awdlAdvertisingPending:", *(_QWORD *)(a1 + 40));
}

- (void)awdl:(id)a3 failedToStartAdvertisingWithError:(id)a4
{
  id v6;
  id v7;
  SFBLEClient *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD block[5];
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableSet allObjects](v8->_wpAirDropDelegates, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v13, "dispatchQueue");
          v14 = objc_claimAutoreleasedReturnValue();
          if (v14 == v8->_dispatchQueue)
          {
            objc_msgSend(v13, "awdl:failedToStartAdvertisingWithError:", v6, v7);
          }
          else
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __54__SFBLEClient_awdl_failedToStartAdvertisingWithError___block_invoke;
            block[3] = &unk_1E482EBA0;
            block[4] = v13;
            v16 = v6;
            v17 = v7;
            dispatch_async(v14, block);

          }
        }
        else
        {
          v14 = 0;
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

uint64_t __54__SFBLEClient_awdl_failedToStartAdvertisingWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "awdl:failedToStartAdvertisingWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)awdlStartedScanning:(id)a3
{
  id v4;
  SFBLEClient *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableSet allObjects](v5->_wpAirDropDelegates, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, "dispatchQueue");
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11 == v5->_dispatchQueue)
          {
            objc_msgSend(v10, "awdlStartedScanning:", v4);
          }
          else
          {
            v12[0] = MEMORY[0x1E0C809B0];
            v12[1] = 3221225472;
            v12[2] = __35__SFBLEClient_awdlStartedScanning___block_invoke;
            v12[3] = &unk_1E482D3A0;
            v12[4] = v10;
            v13 = v4;
            dispatch_async(v11, v12);

          }
        }
        else
        {
          v11 = 0;
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

uint64_t __35__SFBLEClient_awdlStartedScanning___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "awdlStartedScanning:", *(_QWORD *)(a1 + 40));
}

- (void)awdl:(id)a3 failedToStartScanningWithError:(id)a4
{
  id v6;
  id v7;
  SFBLEClient *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD block[5];
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableSet allObjects](v8->_wpAirDropDelegates, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v13, "dispatchQueue");
          v14 = objc_claimAutoreleasedReturnValue();
          if (v14 == v8->_dispatchQueue)
          {
            objc_msgSend(v13, "awdl:failedToStartScanningWithError:", v6, v7);
          }
          else
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __51__SFBLEClient_awdl_failedToStartScanningWithError___block_invoke;
            block[3] = &unk_1E482EBA0;
            block[4] = v13;
            v16 = v6;
            v17 = v7;
            dispatch_async(v14, block);

          }
        }
        else
        {
          v14 = 0;
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

uint64_t __51__SFBLEClient_awdl_failedToStartScanningWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "awdl:failedToStartScanningWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)awdl:(id)a3 foundDevice:(id)a4 rssi:(id)a5
{
  id v8;
  id v9;
  SFBLEClient *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v8 = a4;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMutableSet allObjects](v10->_wpAirDropDelegates, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v23;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v15, "dispatchQueue");
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16 == v10->_dispatchQueue)
          {
            objc_msgSend(v15, "awdl:foundDevice:rssi:", v17, v8, v9);
          }
          else
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __37__SFBLEClient_awdl_foundDevice_rssi___block_invoke;
            block[3] = &unk_1E482E7D8;
            block[4] = v15;
            v19 = v17;
            v20 = v8;
            v21 = v9;
            dispatch_async(v16, block);

          }
        }
        else
        {
          v16 = 0;
        }

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  objc_sync_exit(v10);
}

uint64_t __37__SFBLEClient_awdl_foundDevice_rssi___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "awdl:foundDevice:rssi:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)nearbyDidChangeBluetoothBandwidthState:(id)a3
{
  id v4;
  SFBLEClient *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableSet allObjects](v5->_wpNearbyDelegates, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, "dispatchQueue");
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11 == v5->_dispatchQueue)
          {
            objc_msgSend(v10, "nearbyDidChangeBluetoothBandwidthState:", v4);
          }
          else
          {
            v12[0] = MEMORY[0x1E0C809B0];
            v12[1] = 3221225472;
            v12[2] = __54__SFBLEClient_nearbyDidChangeBluetoothBandwidthState___block_invoke;
            v12[3] = &unk_1E482D3A0;
            v12[4] = v10;
            v13 = v4;
            dispatch_async(v11, v12);

          }
        }
        else
        {
          v11 = 0;
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

uint64_t __54__SFBLEClient_nearbyDidChangeBluetoothBandwidthState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nearbyDidChangeBluetoothBandwidthState:", *(_QWORD *)(a1 + 40));
}

- (void)nearbyDidUpdateState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SFBLEClient *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  const __CFString *v22;
  _QWORD v23[3];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = CFSTR("SFBluetoothNotificationKeyState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("SFBluetoothNotificationNameStateChanged"), self, v7);

  v8 = self;
  objc_sync_enter(v8);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMutableSet allObjects](v8->_wpNearbyDelegates, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v13, "dispatchQueue");
          v14 = objc_claimAutoreleasedReturnValue();
          if (v14 == v8->_dispatchQueue)
          {
            objc_msgSend(v13, "nearbyDidUpdateState:", v4);
          }
          else
          {
            v15[0] = MEMORY[0x1E0C809B0];
            v15[1] = 3221225472;
            v15[2] = __36__SFBLEClient_nearbyDidUpdateState___block_invoke;
            v15[3] = &unk_1E482D3A0;
            v15[4] = v13;
            v16 = v4;
            dispatch_async(v14, v15);

          }
        }
        else
        {
          v14 = 0;
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

uint64_t __36__SFBLEClient_nearbyDidUpdateState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nearbyDidUpdateState:", *(_QWORD *)(a1 + 40));
}

- (void)nearby:(id)a3 didStartAdvertisingType:(int64_t)a4
{
  id v6;
  SFBLEClient *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  int64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMutableSet allObjects](v7->_wpNearbyDelegates, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v12, "dispatchQueue");
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13 == v7->_dispatchQueue)
          {
            objc_msgSend(v12, "nearby:didStartAdvertisingType:", v6, a4);
          }
          else
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __46__SFBLEClient_nearby_didStartAdvertisingType___block_invoke;
            block[3] = &unk_1E4831000;
            block[4] = v12;
            v15 = v6;
            v16 = a4;
            dispatch_async(v13, block);

          }
        }
        else
        {
          v13 = 0;
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  objc_sync_exit(v7);
}

uint64_t __46__SFBLEClient_nearby_didStartAdvertisingType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nearby:didStartAdvertisingType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)nearby:(id)a3 didStopAdvertisingType:(int64_t)a4 withError:(id)a5
{
  id v8;
  SFBLEClient *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  int64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v8 = a5;
  v9 = self;
  objc_sync_enter(v9);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMutableSet allObjects](v9->_wpNearbyDelegates, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v14, "dispatchQueue");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15 == v9->_dispatchQueue)
          {
            objc_msgSend(v14, "nearby:didStopAdvertisingType:withError:", v16, a4, v8);
          }
          else
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __55__SFBLEClient_nearby_didStopAdvertisingType_withError___block_invoke;
            block[3] = &unk_1E482E348;
            block[4] = v14;
            v18 = v16;
            v20 = a4;
            v19 = v8;
            dispatch_async(v15, block);

          }
        }
        else
        {
          v15 = 0;
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  objc_sync_exit(v9);
}

uint64_t __55__SFBLEClient_nearby_didStopAdvertisingType_withError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nearby:didStopAdvertisingType:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)nearby:(id)a3 didDeferAdvertisingType:(int64_t)a4
{
  id v6;
  SFBLEClient *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  int64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMutableSet allObjects](v7->_wpNearbyDelegates, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v12, "dispatchQueue");
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13 == v7->_dispatchQueue)
          {
            objc_msgSend(v12, "nearby:didDeferAdvertisingType:", v6, a4);
          }
          else
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __46__SFBLEClient_nearby_didDeferAdvertisingType___block_invoke;
            block[3] = &unk_1E4831000;
            block[4] = v12;
            v15 = v6;
            v16 = a4;
            dispatch_async(v13, block);

          }
        }
        else
        {
          v13 = 0;
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  objc_sync_exit(v7);
}

uint64_t __46__SFBLEClient_nearby_didDeferAdvertisingType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nearby:didDeferAdvertisingType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)nearby:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5
{
  id v8;
  SFBLEClient *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  int64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v8 = a5;
  v9 = self;
  objc_sync_enter(v9);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMutableSet allObjects](v9->_wpNearbyDelegates, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v14, "dispatchQueue");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15 == v9->_dispatchQueue)
          {
            objc_msgSend(v14, "nearby:didFailToStartAdvertisingOfType:withError:", v16, a4, v8);
          }
          else
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __64__SFBLEClient_nearby_didFailToStartAdvertisingOfType_withError___block_invoke;
            block[3] = &unk_1E482E348;
            block[4] = v14;
            v18 = v16;
            v20 = a4;
            v19 = v8;
            dispatch_async(v15, block);

          }
        }
        else
        {
          v15 = 0;
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  objc_sync_exit(v9);
}

uint64_t __64__SFBLEClient_nearby_didFailToStartAdvertisingOfType_withError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nearby:didFailToStartAdvertisingOfType:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t __46__SFBLEClient_nearby_didStartScanningForType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nearby:didStartScanningForType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)nearby:(id)a3 didFailToStartScanningForType:(int64_t)a4 WithError:(id)a5
{
  id v8;
  SFBLEClient *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  int64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v8 = a5;
  v9 = self;
  objc_sync_enter(v9);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMutableSet allObjects](v9->_wpNearbyDelegates, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v14, "dispatchQueue");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15 == v9->_dispatchQueue)
          {
            objc_msgSend(v14, "nearby:didFailToStartScanningForType:WithError:", v16, a4, v8);
          }
          else
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __62__SFBLEClient_nearby_didFailToStartScanningForType_WithError___block_invoke;
            block[3] = &unk_1E482E348;
            block[4] = v14;
            v18 = v16;
            v20 = a4;
            v19 = v8;
            dispatch_async(v15, block);

          }
        }
        else
        {
          v15 = 0;
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  objc_sync_exit(v9);
}

uint64_t __62__SFBLEClient_nearby_didFailToStartScanningForType_WithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nearby:didFailToStartScanningForType:WithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t __65__SFBLEClient_nearby_didDiscoverType_withData_fromPeer_peerInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nearby:didDiscoverType:withData:fromPeer:peerInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)nearby:(id)a3 didLosePeer:(id)a4 type:(int64_t)a5
{
  id v8;
  SFBLEClient *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  int64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMutableSet allObjects](v9->_wpNearbyDelegates, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v14, "dispatchQueue");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15 == v9->_dispatchQueue)
          {
            objc_msgSend(v14, "nearby:didLosePeer:type:", v16, v8, a5);
          }
          else
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __39__SFBLEClient_nearby_didLosePeer_type___block_invoke;
            block[3] = &unk_1E482E348;
            block[4] = v14;
            v18 = v16;
            v19 = v8;
            v20 = a5;
            dispatch_async(v15, block);

          }
        }
        else
        {
          v15 = 0;
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  objc_sync_exit(v9);
}

uint64_t __39__SFBLEClient_nearby_didLosePeer_type___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nearby:didLosePeer:type:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)nearby:(id)a3 didConnectToPeer:(id)a4 transport:(int64_t)a5 error:(id)a6
{
  id v10;
  SFBLEClient *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  int64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v18 = a4;
  v10 = a6;
  v11 = self;
  objc_sync_enter(v11);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[NSMutableSet allObjects](v11->_wpNearbyDelegates, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v26;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v16, "dispatchQueue");
          v17 = objc_claimAutoreleasedReturnValue();
          if (v17 == v11->_dispatchQueue)
          {
            objc_msgSend(v16, "nearby:didConnectToPeer:transport:error:", v19, v18, a5, v10);
          }
          else
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __55__SFBLEClient_nearby_didConnectToPeer_transport_error___block_invoke;
            block[3] = &unk_1E4831050;
            block[4] = v16;
            v21 = v19;
            v22 = v18;
            v24 = a5;
            v23 = v10;
            dispatch_async(v17, block);

          }
        }
        else
        {
          v17 = 0;
        }

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }

  objc_sync_exit(v11);
}

uint64_t __55__SFBLEClient_nearby_didConnectToPeer_transport_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nearby:didConnectToPeer:transport:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

- (void)nearby:(id)a3 didDisconnectFromPeer:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  SFBLEClient *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v8 = a4;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMutableSet allObjects](v10->_wpNearbyDelegates, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v23;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v15, "dispatchQueue");
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16 == v10->_dispatchQueue)
          {
            objc_msgSend(v15, "nearby:didDisconnectFromPeer:error:", v17, v8, v9);
          }
          else
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __50__SFBLEClient_nearby_didDisconnectFromPeer_error___block_invoke;
            block[3] = &unk_1E482E7D8;
            block[4] = v15;
            v19 = v17;
            v20 = v8;
            v21 = v9;
            dispatch_async(v16, block);

          }
        }
        else
        {
          v16 = 0;
        }

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  objc_sync_exit(v10);
}

uint64_t __50__SFBLEClient_nearby_didDisconnectFromPeer_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nearby:didDisconnectFromPeer:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)nearby:(id)a3 didSendData:(id)a4 toPeer:(id)a5 error:(id)a6
{
  id v10;
  SFBLEClient *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v19 = a4;
  v18 = a5;
  v10 = a6;
  v11 = self;
  objc_sync_enter(v11);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[NSMutableSet allObjects](v11->_wpNearbyDelegates, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v27;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v16, "dispatchQueue");
          v17 = objc_claimAutoreleasedReturnValue();
          if (v17 == v11->_dispatchQueue)
          {
            objc_msgSend(v16, "nearby:didSendData:toPeer:error:", v20, v19, v18, v10);
          }
          else
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __47__SFBLEClient_nearby_didSendData_toPeer_error___block_invoke;
            block[3] = &unk_1E4831078;
            block[4] = v16;
            v22 = v20;
            v23 = v19;
            v24 = v18;
            v25 = v10;
            dispatch_async(v17, block);

          }
        }
        else
        {
          v17 = 0;
        }

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v13);
  }

  objc_sync_exit(v11);
}

uint64_t __47__SFBLEClient_nearby_didSendData_toPeer_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nearby:didSendData:toPeer:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)nearby:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5
{
  id v8;
  id v9;
  SFBLEClient *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v8 = a4;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMutableSet allObjects](v10->_wpNearbyDelegates, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v23;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v15, "dispatchQueue");
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16 == v10->_dispatchQueue)
          {
            objc_msgSend(v15, "nearby:didReceiveData:fromPeer:", v17, v8, v9);
          }
          else
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __46__SFBLEClient_nearby_didReceiveData_fromPeer___block_invoke;
            block[3] = &unk_1E482E7D8;
            block[4] = v15;
            v19 = v17;
            v20 = v8;
            v21 = v9;
            dispatch_async(v16, block);

          }
        }
        else
        {
          v16 = 0;
        }

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  objc_sync_exit(v10);
}

uint64_t __46__SFBLEClient_nearby_didReceiveData_fromPeer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nearby:didReceiveData:fromPeer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (id)addPairingDelegate:(id)a3
{
  id v4;
  SFBLEClient *v5;
  uint64_t v6;
  WPPairing *wpPairing;
  NSMutableSet *wpPairingDelegates;
  NSMutableSet *v9;
  NSMutableSet *v10;
  WPPairing *v11;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5->_wpPairing)
  {
    v6 = objc_msgSend(objc_alloc((Class)getWPPairingClass[0]()), "initWithDelegate:queue:", v5, v5->_dispatchQueue);
    wpPairing = v5->_wpPairing;
    v5->_wpPairing = (WPPairing *)v6;

  }
  wpPairingDelegates = v5->_wpPairingDelegates;
  if (!wpPairingDelegates)
  {
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v10 = v5->_wpPairingDelegates;
    v5->_wpPairingDelegates = v9;

    wpPairingDelegates = v5->_wpPairingDelegates;
  }
  -[NSMutableSet addObject:](wpPairingDelegates, "addObject:", v4);
  v11 = v5->_wpPairing;
  objc_sync_exit(v5);

  return v11;
}

- (void)removePairingDelegate:(id)a3
{
  SFBLEClient *v4;
  WPPairing *wpPairing;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableSet removeObject:](v4->_wpPairingDelegates, "removeObject:", v6);
  if (!-[NSMutableSet count](v4->_wpPairingDelegates, "count"))
  {
    if (gLogCategory_SFBLEClient <= 30 && (gLogCategory_SFBLEClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
    -[WPPairing invalidate](v4->_wpPairing, "invalidate");
    wpPairing = v4->_wpPairing;
    v4->_wpPairing = 0;

  }
  objc_sync_exit(v4);

}

- (void)pairingDidUpdateState:(id)a3
{
  id v4;
  SFBLEClient *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableSet allObjects](v5->_wpPairingDelegates, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, "dispatchQueue");
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11 == v5->_dispatchQueue)
          {
            objc_msgSend(v10, "pairingDidUpdateState:", v4);
          }
          else
          {
            v12[0] = MEMORY[0x1E0C809B0];
            v12[1] = 3221225472;
            v12[2] = __37__SFBLEClient_pairingDidUpdateState___block_invoke;
            v12[3] = &unk_1E482D3A0;
            v12[4] = v10;
            v13 = v4;
            dispatch_async(v11, v12);

          }
        }
        else
        {
          v11 = 0;
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

uint64_t __37__SFBLEClient_pairingDidUpdateState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pairingDidUpdateState:", *(_QWORD *)(a1 + 40));
}

- (void)pairingStartedScanning:(id)a3
{
  id v4;
  SFBLEClient *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableSet allObjects](v5->_wpPairingDelegates, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, "dispatchQueue");
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11 == v5->_dispatchQueue)
          {
            objc_msgSend(v10, "pairingStartedScanning:", v4);
          }
          else
          {
            v12[0] = MEMORY[0x1E0C809B0];
            v12[1] = 3221225472;
            v12[2] = __38__SFBLEClient_pairingStartedScanning___block_invoke;
            v12[3] = &unk_1E482D3A0;
            v12[4] = v10;
            v13 = v4;
            dispatch_async(v11, v12);

          }
        }
        else
        {
          v11 = 0;
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

uint64_t __38__SFBLEClient_pairingStartedScanning___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pairingStartedScanning:", *(_QWORD *)(a1 + 40));
}

- (void)pairingStoppedScanning:(id)a3
{
  id v4;
  SFBLEClient *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableSet allObjects](v5->_wpPairingDelegates, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, "dispatchQueue");
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11 == v5->_dispatchQueue)
          {
            objc_msgSend(v10, "pairingStoppedScanning:", v4);
          }
          else
          {
            v12[0] = MEMORY[0x1E0C809B0];
            v12[1] = 3221225472;
            v12[2] = __38__SFBLEClient_pairingStoppedScanning___block_invoke;
            v12[3] = &unk_1E482D3A0;
            v12[4] = v10;
            v13 = v4;
            dispatch_async(v11, v12);

          }
        }
        else
        {
          v11 = 0;
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

uint64_t __38__SFBLEClient_pairingStoppedScanning___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pairingStoppedScanning:", *(_QWORD *)(a1 + 40));
}

- (void)pairing:(id)a3 failedToStartScanningWithError:(id)a4
{
  id v6;
  id v7;
  SFBLEClient *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD block[5];
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NSMutableSet allObjects](v8->_wpPairingDelegates, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v13, "dispatchQueue");
          v14 = objc_claimAutoreleasedReturnValue();
          if (v14 == v8->_dispatchQueue)
          {
            objc_msgSend(v13, "pairing:failedToStartScanningWithError:", v6, v7);
          }
          else
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __54__SFBLEClient_pairing_failedToStartScanningWithError___block_invoke;
            block[3] = &unk_1E482EBA0;
            block[4] = v13;
            v16 = v6;
            v17 = v7;
            dispatch_async(v14, block);

          }
        }
        else
        {
          v14 = 0;
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

uint64_t __54__SFBLEClient_pairing_failedToStartScanningWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pairing:failedToStartScanningWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)pairing:(id)a3 foundDevice:(id)a4 payload:(id)a5 rssi:(id)a6 peerInfo:(id)a7
{
  id v12;
  SFBLEClient *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v22 = a4;
  v21 = a5;
  v20 = a6;
  v12 = a7;
  v13 = self;
  objc_sync_enter(v13);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[NSMutableSet allObjects](v13->_wpPairingDelegates, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v31;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v17);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v18, "dispatchQueue");
          v19 = objc_claimAutoreleasedReturnValue();
          if (v19 == v13->_dispatchQueue)
          {
            objc_msgSend(v18, "pairing:foundDevice:payload:rssi:peerInfo:", v23, v22, v21, v20, v12);
          }
          else
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __57__SFBLEClient_pairing_foundDevice_payload_rssi_peerInfo___block_invoke;
            block[3] = &unk_1E48310A0;
            block[4] = v18;
            v25 = v23;
            v26 = v22;
            v27 = v21;
            v28 = v20;
            v29 = v12;
            dispatch_async(v19, block);

          }
        }
        else
        {
          v19 = 0;
        }

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v15);
  }

  objc_sync_exit(v13);
}

uint64_t __57__SFBLEClient_pairing_foundDevice_payload_rssi_peerInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pairing:foundDevice:payload:rssi:peerInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wpPairing, 0);
  objc_storeStrong((id *)&self->_wpPairingDelegates, 0);
  objc_storeStrong((id *)&self->_wpNearby, 0);
  objc_storeStrong((id *)&self->_wpNearbyDelegates, 0);
  objc_storeStrong((id *)&self->_wpAirDrop, 0);
  objc_storeStrong((id *)&self->_wpAirDropDelegates, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
