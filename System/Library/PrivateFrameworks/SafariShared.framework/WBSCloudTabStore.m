@implementation WBSCloudTabStore

- (id)syncedRemoteCloudTabDevicesForProfileWithIdentifier:(id)a3
{
  -[WBSCloudTabStore syncedCloudTabDevices](self, "syncedCloudTabDevices", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)syncAgentIsAvailable
{
  return self->_syncAgentIsAvailable;
}

- (WBSCloudTabStore)init
{
  WBSCloudTabStore *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *internalQueue;
  uint64_t v5;
  NSHashTable *observers;
  void *v7;
  WBSCloudTabStore *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WBSCloudTabStore;
  v2 = -[WBSCloudTabStore init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.SafariShared.WBSCloudTabStore", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v3;

    v2->_syncAgentIsAvailable = 1;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__syncAgentProxyConnectionWasInvalidated_, *MEMORY[0x1E0D89F60], 0);

    v8 = v2;
  }

  return v2;
}

- (void)setWbsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_wbsDelegate, a3);
}

void __74__WBSCloudTabStore_fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A3D90000, v2, OS_LOG_TYPE_DEFAULT, "Received cached CloudTab devices from the sync agent", v4, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didFetchDeviceDictionariesFromCloudKit:fetchedCloseRequests:fetchedDevicesBySyncing:error:", *(_QWORD *)(a1 + 32), 0, 0, 0);

}

- (void)_didFetchDeviceDictionariesFromCloudKit:(id)a3 fetchedCloseRequests:(id)a4 error:(id)a5
{
  -[WBSCloudTabStore _didFetchDeviceDictionariesFromCloudKit:fetchedCloseRequests:fetchedDevicesBySyncing:error:](self, "_didFetchDeviceDictionariesFromCloudKit:fetchedCloseRequests:fetchedDevicesBySyncing:error:", a3, a4, 1, a5);
}

- (void)handleCloseTabRequestsFromCloudKit
{
  NSObject *v3;
  NSMutableDictionary *deviceUUIDsToCloseRequestsFromCloudKit;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[8];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_DEFAULT, "Handling close requests from CloudKit", buf, 2u);
  }
  deviceUUIDsToCloseRequestsFromCloudKit = self->_deviceUUIDsToCloseRequestsFromCloudKit;
  -[WBSCloudTabStore _currentDeviceUUID](self, "_currentDeviceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](deviceUUIDsToCloseRequestsFromCloudKit, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          -[WBSCloudTabStore _closeRequestedTabIfPossible:](self, "_closeRequestedTabIfPossible:", v13, (_QWORD)v18);
          objc_msgSend(v13, "requestUUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "UUIDString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v10);
    }

    v16 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3D90000, v16, OS_LOG_TYPE_DEFAULT, "Deleting close requests for this device from CloudKit", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy", (_QWORD)v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "deleteCloudTabCloseRequestsWithUUIDStrings:completionHandler:", v8, &__block_literal_global_23);

  }
}

- (void)fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit
{
  NSObject *v3;
  char v4;
  NSObject *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];
  id location[2];

  if (self->_syncAgentIsAvailable)
  {
    objc_initWeak(location, self);
    v3 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_DEFAULT, "Fetching data from CloudKit", buf, 2u);
    }
    if (self->_hasAttemptedToFetchDevicesAtLeastOnce)
    {
      v4 = 0;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_wbsDelegate);
      v4 = objc_opt_respondsToSelector();

    }
    self->_hasAttemptedToFetchDevicesAtLeastOnce = 1;
    objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    if ((v4 & 1) != 0)
    {
      v10 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3D90000, v10, OS_LOG_TYPE_DEFAULT, "Getting cached CloudTab devices from the sync agent", buf, 2u);
      }
      v13[0] = v9;
      v13[1] = 3221225472;
      v13[2] = __74__WBSCloudTabStore_fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit__block_invoke;
      v13[3] = &unk_1E4B2BF30;
      objc_copyWeak(&v14, location);
      objc_msgSend(v8, "getCloudTabDevicesWithCompletionHandler:", v13);
      objc_destroyWeak(&v14);
    }
    self->_isFetchingDataFromCloudKit = 1;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __74__WBSCloudTabStore_fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit__block_invoke_19;
    v11[3] = &unk_1E4B2BF80;
    objc_copyWeak(&v12, location);
    objc_msgSend(v8, "fetchSyncedCloudTabDevicesAndCloseRequestsWithCompletionHandler:", v11);
    objc_destroyWeak(&v12);

    objc_destroyWeak(location);
  }
  else
  {
    v5 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_DEFAULT, "Bypassing fetching data from CloudKit because CloudKit syncing of iCloud Tabs is not available", (uint8_t *)location, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4099, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSCloudTabStore _didFetchDeviceDictionariesFromCloudKit:fetchedCloseRequests:error:](self, "_didFetchDeviceDictionariesFromCloudKit:fetchedCloseRequests:error:", 0, 0, v6);

  }
}

- (void)_didFetchDeviceDictionariesFromCloudKit:(id)a3 fetchedCloseRequests:(id)a4 fetchedDevicesBySyncing:(BOOL)a5 error:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *internalQueue;
  id v15;
  id v16;
  id v17;
  id WeakRetained;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  BOOL v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v7 = a5;
  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218243;
    v25 = objc_msgSend(v10, "count");
    v26 = 2113;
    v27 = v10;
    _os_log_impl(&dword_1A3D90000, v13, OS_LOG_TYPE_DEFAULT, "Fetched %lu devices from CloudKit: %{private}@", buf, 0x16u);
  }

  self->_isFetchingDataFromCloudKit = !v7;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111__WBSCloudTabStore__didFetchDeviceDictionariesFromCloudKit_fetchedCloseRequests_fetchedDevicesBySyncing_error___block_invoke;
  block[3] = &unk_1E4B2C0A8;
  block[4] = self;
  v23 = v7;
  v15 = v12;
  v20 = v15;
  v16 = v10;
  v21 = v16;
  v17 = v11;
  v22 = v17;
  dispatch_sync(internalQueue, block);
  WeakRetained = objc_loadWeakRetained((id *)&self->_wbsDelegate);
  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "didUpdateDevicesAndCloseRequestsFromCloudKitForCloudTabStore:error:", self, v15);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "didGetCachedDevicesFromCloudKitForCloudTabStore:", self);
  }

}

void __111__WBSCloudTabStore__didFetchDeviceDictionariesFromCloudKit_fetchedCloseRequests_fetchedDevicesBySyncing_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  WBSCloudTabDevice *v17;
  uint64_t v18;
  WBSCloudTabDevice *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  _QWORD *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  void *v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  if (*(_BYTE *)(a1 + 64))
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_currentDeviceUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = *(id *)(a1 + 48);
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
  if (v10)
  {
    v12 = *(_QWORD *)v49;
    *(_QWORD *)&v11 = 134218242;
    v41 = v11;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v49 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v14, "deviceOrCloseRequestDictionary", v41);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[WBSCloudTabDevice isCloudTabDeviceDictionary:](WBSCloudTabDevice, "isCloudTabDeviceDictionary:", v15))
        {
          objc_msgSend(v14, "uuidString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[WBSCloudTabDevice initWithDictionary:uuid:]([WBSCloudTabDevice alloc], "initWithDictionary:uuid:", v15, v16);
          if (v17)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", v17);
            if (objc_msgSend(v16, "isEqualToString:", v42))
            {
              v18 = *(_QWORD *)(a1 + 32);
              v19 = v17;
              v20 = *(NSObject **)(v18 + 40);
              *(_QWORD *)(v18 + 40) = v19;
            }
            else
            {
              v20 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                -[WBSCloudTabDevice tabs](v17, "tabs");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v21, "count");
                *(_DWORD *)buf = v41;
                v54 = v22;
                v55 = 2114;
                v56 = v16;
                _os_log_impl(&dword_1A3D90000, v20, OS_LOG_TYPE_DEFAULT, "Fetched %lu tabs from CloudKit for device with UUID %{public}@", buf, 0x16u);

              }
            }

          }
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    }
    while (v10);
  }

  v23 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = objc_msgSend(*(id *)(a1 + 56), "count");
    v25 = *(void **)(a1 + 56);
    *(_DWORD *)buf = 134218243;
    v54 = v24;
    v55 = 2113;
    v56 = v25;
    _os_log_impl(&dword_1A3D90000, v23, OS_LOG_TYPE_DEFAULT, "Fetched %lu close requests from CloudKit: %{private}@", buf, 0x16u);
  }

  v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(void **)(v27 + 48);
  *(_QWORD *)(v27 + 48) = v26;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v29 = *(id *)(a1 + 56);
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v45 != v31)
          objc_enumerationMutation(v29);
        v33 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
        objc_msgSend(v33, "deviceOrCloseRequestDictionary");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[WBSCloudTabCloseRequest isCloudTabCloseRequestDictionary:](WBSCloudTabCloseRequest, "isCloudTabCloseRequestDictionary:", v34))
        {
          v35 = *(_QWORD **)(a1 + 32);
          v36 = v35[6];
          objc_msgSend(v33, "uuidString");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "_addCloseRequestDictionary:toDeviceUUIDsToCloseRequestsDictionary:requestUUID:", v34, v36, v37);

        }
      }
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v30);
  }

  objc_msgSend(*(id *)(a1 + 32), "_devicesByFilteringAndSortingDevices:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = *(_QWORD *)(a1 + 32);
  v40 = *(void **)(v39 + 32);
  *(_QWORD *)(v39 + 32) = v38;

}

- (id)_devicesByFilteringAndSortingDevices:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableDictionary *deviceUUIDsToCloseRequestsFromCloudKit;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = v26;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        deviceUUIDsToCloseRequestsFromCloudKit = self->_deviceUUIDsToCloseRequestsFromCloudKit;
        objc_msgSend(v9, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](deviceUUIDsToCloseRequestsFromCloudKit, "objectForKeyedSubscript:", v11);
        v12 = objc_claimAutoreleasedReturnValue();
        -[WBSCloudTabStore _deviceWithTabsWithOutstandingCloseRequestsRemoved:closeRequestsForDevice:](self, "_deviceWithTabsWithOutstandingCloseRequestsRemoved:closeRequestsForDevice:", v9, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "tabs");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v12) = objc_msgSend(v14, "count") == 0;

        if ((v12 & 1) == 0)
        {
          objc_msgSend(v13, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v17 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "name");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, v18);

            v16 = (void *)v17;
          }
          objc_msgSend(v16, "addObject:", v13);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v6);
  }

  -[WBSCloudTabStore _currentDeviceUUID](self, "_currentDeviceUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "UUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __57__WBSCloudTabStore__devicesByFilteringAndSortingDevices___block_invoke;
  v27[3] = &unk_1E4B2C138;
  v22 = v20;
  v28 = v22;
  v23 = v21;
  v29 = v23;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v27);
  objc_msgSend(v23, "sortUsingComparator:", &__block_literal_global_45);
  v24 = (void *)objc_msgSend(v23, "copy");

  return v24;
}

void __74__WBSCloudTabStore_fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__WBSCloudTabStore_fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit__block_invoke_2;
  v5[3] = &unk_1E4B2BF08;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

- (NSArray)syncedCloudTabDevices
{
  NSObject *internalQueue;
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  v12 = 0;
  internalQueue = self->_internalQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__WBSCloudTabStore_syncedCloudTabDevices__block_invoke;
  v6[3] = &unk_1E4B2BDF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(internalQueue, v6);
  v3 = (void *)v8[5];
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v3;
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __41__WBSCloudTabStore_syncedCloudTabDevices__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (unint64_t)totalSyncedCloudTabDeviceCount
{
  return -[NSMutableArray count](self->_syncedCloudTabDevicesFromCloudKit, "count");
}

- (BOOL)atLeastOneOtherActiveDeviceIsRegistered
{
  return (-[WBSCloudTabStore uniqueDeviceMultiplicity](self, "uniqueDeviceMultiplicity") & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (BOOL)closeTab:(id)a3 onDevice:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  NSObject *internalQueue;
  BOOL v15;
  NSObject *v16;
  _QWORD block[5];
  id v19;
  id v20;
  uint8_t v21[16];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "uuidString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v9;
    v24 = 2114;
    v25 = v10;
    _os_log_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_DEFAULT, "Closing single tab with UUID %{public}@ on device with UUID %{public}@", buf, 0x16u);

  }
  v11 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "description");
    objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    objc_claimAutoreleasedReturnValue();
    -[WBSCloudTabStore closeTab:onDevice:].cold.1();
  }

  if ((objc_msgSend(v7, "isCloseRequestSupported") & 1) == 0)
  {
    v16 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    v15 = 0;
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_1A3D90000, v16, OS_LOG_TYPE_DEFAULT, "Device doesn't support close requests", v21, 2u);
LABEL_11:
    v15 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v7, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length") == 0;

  if (v13
    || !-[WBSCloudTabStore _writeCloseRequestForTab:onDevice:](self, "_writeCloseRequestForTab:onDevice:", v6, v7))
  {
    goto LABEL_11;
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__WBSCloudTabStore_closeTab_onDevice___block_invoke;
  block[3] = &unk_1E4B2B2A8;
  block[4] = self;
  v19 = v6;
  v20 = v7;
  dispatch_sync(internalQueue, block);

  v15 = 1;
LABEL_12:

  return v15;
}

void __38__WBSCloudTabStore_closeTab_onDevice___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_tabWasClosed:onDevice:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_devicesByFilteringAndSortingDevices:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

}

- (BOOL)closeAllTabsOnDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  uint8_t v14[16];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_DEFAULT, "Closing all tabs on device with UUID %{public}@", buf, 0xCu);

  }
  v7 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "name");
    objc_claimAutoreleasedReturnValue();
    -[WBSCloudTabStore closeAllTabsOnDevice:].cold.1();
  }

  if ((objc_msgSend(v4, "isCloseRequestSupported") & 1) == 0)
  {
    v12 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    v11 = 0;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1A3D90000, v12, OS_LOG_TYPE_DEFAULT, "Device doesn't support close requests", v14, 2u);
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v4, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length") == 0;

  if (v9)
    goto LABEL_10;
  objc_msgSend(v4, "tabs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WBSCloudTabStore _closeTabs:onDevice:](self, "_closeTabs:onDevice:", v10, v4);

LABEL_11:
  return v11;
}

- (void)resetSyncedCloudTabDevicesAndCloseRequestsFromCloudKit
{
  NSObject *internalQueue;
  NSMutableDictionary *deviceUUIDsToCloseRequestsFromCloudKit;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__WBSCloudTabStore_resetSyncedCloudTabDevicesAndCloseRequestsFromCloudKit__block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_sync(internalQueue, block);
  deviceUUIDsToCloseRequestsFromCloudKit = self->_deviceUUIDsToCloseRequestsFromCloudKit;
  self->_deviceUUIDsToCloseRequestsFromCloudKit = 0;

}

void __74__WBSCloudTabStore_resetSyncedCloudTabDevicesAndCloseRequestsFromCloudKit__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = 0;

}

- (void)saveCurrentCloudTabDeviceDictionaryToCloudKit:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  WBSCloudTabDevice *v12;
  WBSCloudTabDevice *currentDevice;
  void *v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_DEFAULT, "Saving current device to CloudKit", v15, 2u);
  }
  v9 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "description");
    objc_claimAutoreleasedReturnValue();
    -[WBSCloudTabStore saveCurrentCloudTabDeviceDictionaryToCloudKit:completionHandler:].cold.1();
  }

  -[WBSCloudTabStore _currentDeviceUUID](self, "_currentDeviceUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[WBSCloudTabDevice initWithDictionary:uuid:]([WBSCloudTabDevice alloc], "initWithDictionary:uuid:", v6, v11);
  currentDevice = self->_currentDevice;
  self->_currentDevice = v12;

  objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "saveTabsForCurrentDeviceWithDictionaryRepresentation:deviceUUIDString:completionHandler:", v6, v11, v7);

}

- (int64_t)uniqueDeviceMultiplicity
{
  NSObject *internalQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__WBSCloudTabStore_uniqueDeviceMultiplicity__block_invoke;
  v5[3] = &unk_1E4B2BE20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __44__WBSCloudTabStore_uniqueDeviceMultiplicity__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
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
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 56))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v3 = *(id *)(v2 + 24);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v8;
      while (2)
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v3);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6), "hasDuplicateName", (_QWORD)v7) & 1) == 0)
          {
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 2;

            return;
          }
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        if (v4)
          continue;
        break;
      }
    }

  }
}

- (NSError)lastFetchError
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
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__WBSCloudTabStore_lastFetchError__block_invoke;
  v5[3] = &unk_1E4B2BDF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

void __34__WBSCloudTabStore_lastFetchError__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

- (BOOL)currentDeviceIsRegisteredInCloudKit
{
  return self->_currentDevice != 0;
}

- (NSDictionary)dictionaryRepresentationOfCurrentDeviceInCloudKit
{
  return -[WBSCloudTabDevice dictionaryRepresentation](self->_currentDevice, "dictionaryRepresentation");
}

- (void)pruneExpiredDevicesFromCloudKit
{
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, a1, a3, "No expired devices found in CloudKit", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __51__WBSCloudTabStore_pruneExpiredDevicesFromCloudKit__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v2 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __51__WBSCloudTabStore_pruneExpiredDevicesFromCloudKit__block_invoke_cold_1(a1, v2, v3);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__WBSCloudTabStore_pruneExpiredDevicesFromCloudKit__block_invoke_9;
  v9[3] = &unk_1E4B2BE48;
  v10 = v4;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v9);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

id __51__WBSCloudTabStore_pruneExpiredDevicesFromCloudKit__block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "hasDuplicateName");
  v5 = 40;
  if (v4)
    v5 = 32;
  v6 = *(id *)(a1 + v5);
  objc_msgSend(v3, "lastModified");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "compare:", v6);

  if (v8 == -1)
  {
    v10 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_1A3D90000, v10, OS_LOG_TYPE_DEFAULT, "Pruning expired CloudKit device with UUID %{public}@", (uint8_t *)&v13, 0xCu);

    }
    objc_msgSend(v3, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __51__WBSCloudTabStore_pruneExpiredDevicesFromCloudKit__block_invoke_11(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __51__WBSCloudTabStore_pruneExpiredDevicesFromCloudKit__block_invoke_11_cold_1();
    }

  }
}

- (void)clearTabsForFirstDuplicateDeviceInCloudKitWithName:(id)a3
{
  -[WBSCloudTabStore clearTabsForFirstDuplicateDeviceInCloudKitWithName:passingTest:](self, "clearTabsForFirstDuplicateDeviceInCloudKitWithName:passingTest:", a3, 0);
}

- (void)clearTabsForFirstDuplicateDeviceInCloudKitWithName:(id)a3 passingTest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *internalQueue;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  WBSCloudTabDevice *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  WBSCloudTabStore *v26;
  id v27;
  id v28;
  uint8_t *v29;
  uint8_t buf[8];
  uint8_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint8_t v36[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_DEFAULT, "Clearing tabs for first duplicate device in CloudKit", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v31 = buf;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__6;
  v34 = __Block_byref_object_dispose__6;
  v35 = 0;
  internalQueue = self->_internalQueue;
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __83__WBSCloudTabStore_clearTabsForFirstDuplicateDeviceInCloudKitWithName_passingTest___block_invoke;
  v25 = &unk_1E4B2BEE0;
  v26 = self;
  v10 = v6;
  v27 = v10;
  v29 = buf;
  v11 = v7;
  v28 = v11;
  dispatch_sync(internalQueue, &v22);
  v12 = (void *)*((_QWORD *)v31 + 5);
  if (v12)
  {
    objc_msgSend(v12, "uuid", v22, v23, v24, v25, v26, v27);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v36 = 138543362;
      v37 = v13;
      _os_log_impl(&dword_1A3D90000, v14, OS_LOG_TYPE_DEFAULT, "Marking device with UUID %{public}@ as a duplicate", v36, 0xCu);
    }
    v15 = [WBSCloudTabDevice alloc];
    objc_msgSend(*((id *)v31 + 5), "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v31 + 5), "lastModified");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[WBSCloudTabDevice initWithDeviceName:lastModified:hasDuplicateName:tabs:uuid:](v15, "initWithDeviceName:lastModified:hasDuplicateName:tabs:uuid:", v16, v17, 1, 0, v13);
    v19 = (void *)*((_QWORD *)v31 + 5);
    *((_QWORD *)v31 + 5) = v18;

    objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v31 + 5), "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "saveTabsForCurrentDeviceWithDictionaryRepresentation:deviceUUIDString:completionHandler:", v21, v13, 0);

  }
  _Block_object_dispose(buf, 8);

}

void __83__WBSCloudTabStore_clearTabsForFirstDuplicateDeviceInCloudKitWithName_passingTest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint8_t buf[8];
  _QWORD v16[4];
  id v17;
  __int128 v18;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
  {
    v2 = *(void **)(a1 + 40);
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __83__WBSCloudTabStore_clearTabsForFirstDuplicateDeviceInCloudKitWithName_passingTest___block_invoke_13;
    v16[3] = &unk_1E4B2BEB8;
    v17 = v2;
    v14 = *(_OWORD *)(a1 + 48);
    v4 = (id)v14;
    v18 = v14;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v16);
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      v5 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_DEFAULT, "No eligible device with the same name found when looking for duplicates", buf, 2u);
      }
    }

  }
  else
  {
    v6 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __83__WBSCloudTabStore_clearTabsForFirstDuplicateDeviceInCloudKitWithName_passingTest___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
}

void __83__WBSCloudTabStore_clearTabsForFirstDuplicateDeviceInCloudKitWithName_passingTest___block_invoke_13(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  WBSCloudTabDevice *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if ((objc_msgSend(v6, "isEphemeralDevice") & 1) == 0)
  {
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", a1[4]);

    if ((v8 & 1) != 0 && (objc_msgSend(v6, "hasDuplicateName") & 1) == 0)
    {
      if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
      {
        v9 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "uuid");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 138543362;
          v25 = v10;
          _os_log_impl(&dword_1A3D90000, v9, OS_LOG_TYPE_DEFAULT, "Found more than one device with the same name when looking for duplicates, second device has UUID %{public}@", (uint8_t *)&v24, 0xCu);

        }
        v11 = *(_QWORD *)(a1[6] + 8);
        v12 = *(void **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = 0;

        *a4 = 1;
      }
      else
      {
        v13 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "uuid");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 138543362;
          v25 = v14;
          _os_log_impl(&dword_1A3D90000, v13, OS_LOG_TYPE_DEFAULT, "Found device with UUID %{public}@ with the same name as this device when looking for duplicates", (uint8_t *)&v24, 0xCu);

        }
        v15 = [WBSCloudTabDevice alloc];
        objc_msgSend(v6, "dictionaryRepresentation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[WBSCloudTabDevice initWithDictionary:uuid:](v15, "initWithDictionary:uuid:", v16, v17);
        v19 = *(_QWORD *)(a1[6] + 8);
        v20 = *(void **)(v19 + 40);
        *(_QWORD *)(v19 + 40) = v18;

        v21 = a1[5];
        if (v21
          && ((*(uint64_t (**)(uint64_t, _QWORD))(v21 + 16))(v21, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40)) & 1) == 0)
        {
          v22 = *(_QWORD *)(a1[6] + 8);
          v23 = *(void **)(v22 + 40);
          *(_QWORD *)(v22 + 40) = 0;

        }
      }
    }
  }

}

void __74__WBSCloudTabStore_fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit__block_invoke_19(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__WBSCloudTabStore_fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit__block_invoke_2_20;
  v13[3] = &unk_1E4B2BF58;
  objc_copyWeak(&v17, (id *)(a1 + 32));
  v14 = v7;
  v15 = v8;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  v12 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

  objc_destroyWeak(&v17);
}

void __74__WBSCloudTabStore_fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit__block_invoke_2_20(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_didFetchDeviceDictionariesFromCloudKit:fetchedCloseRequests:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __54__WBSCloudTabStore_handleCloseTabRequestsFromCloudKit__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __54__WBSCloudTabStore_handleCloseTabRequestsFromCloudKit__block_invoke_cold_1();
    }

  }
  v4 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_DEFAULT, "Finished deleting close requests for this device from CloudKit", v5, 2u);
  }

}

- (void)deleteAllDevicesFromCloudKit
{
  NSObject *v3;
  NSObject *internalQueue;
  uint64_t v5;
  WBSCloudTabDevice *currentDevice;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id location[2];
  _QWORD block[6];
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_DEFAULT, "Deleting all devices from CloudKit", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v19 = buf;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  v23 = 0;
  internalQueue = self->_internalQueue;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__WBSCloudTabStore_deleteAllDevicesFromCloudKit__block_invoke;
  block[3] = &unk_1E4B2BE20;
  block[4] = self;
  block[5] = buf;
  dispatch_sync(internalQueue, block);
  currentDevice = self->_currentDevice;
  if (currentDevice)
  {
    v7 = (void *)*((_QWORD *)v19 + 5);
    -[WBSCloudTabDevice uuid](currentDevice, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v7, "arrayByAddingObject:", v8);
    }
    else
    {
      v24[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    }
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v19 + 5);
    *((_QWORD *)v19 + 5) = v9;

  }
  if (objc_msgSend(*((id *)v19 + 5), "count"))
  {
    objc_initWeak(location, self);
    objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *((_QWORD *)v19 + 5);
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __48__WBSCloudTabStore_deleteAllDevicesFromCloudKit__block_invoke_26;
    v14[3] = &unk_1E4B2C030;
    objc_copyWeak(&v15, location);
    objc_msgSend(v11, "deleteDevicesWithUUIDStrings:completionHandler:", v12, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(location);
  }
  else
  {
    v13 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1A3D90000, v13, OS_LOG_TYPE_DEFAULT, "No devices found in CloudKit to delete", (uint8_t *)location, 2u);
    }
  }
  _Block_object_dispose(buf, 8);

}

void __48__WBSCloudTabStore_deleteAllDevicesFromCloudKit__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_24_0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

id __48__WBSCloudTabStore_deleteAllDevicesFromCloudKit__block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "uuid");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __48__WBSCloudTabStore_deleteAllDevicesFromCloudKit__block_invoke_26(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD block[4];
  id v6[5];

  v6[4] = *(id *)MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __48__WBSCloudTabStore_deleteAllDevicesFromCloudKit__block_invoke_26_cold_1();
    }

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__WBSCloudTabStore_deleteAllDevicesFromCloudKit__block_invoke_27;
  block[3] = &unk_1E4B2C008;
  objc_copyWeak(v6, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(v6);

}

void __48__WBSCloudTabStore_deleteAllDevicesFromCloudKit__block_invoke_27(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A3D90000, v2, OS_LOG_TYPE_DEFAULT, "Fetching data from CloudKit after deleting all devices", v4, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit");

}

- (BOOL)cloudTabsAreEnabled
{
  return 1;
}

- (void)addCloudTabsObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)notifyObserversOfSyncedCloudTabDevicesChanged
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    v6 = *MEMORY[0x1E0D89E20];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "cloudTabDeviceProvider:didUpdateCloudTabsInProfileWithIdentifier:", self, v6);
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (BOOL)_writeCloseRequestForTab:(id)a3 onDevice:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  WBSCloudTabCloseRequest *v12;
  void *v13;
  void *v14;
  void *v15;
  WBSCloudTabCloseRequest *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v24;
  _QWORD v25[5];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24 = a4;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCloudTabStore _currentDeviceUUID](self, "_currentDeviceUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v24, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithUUIDString:", v10);

  v12 = [WBSCloudTabCloseRequest alloc];
  objc_msgSend(v6, "url");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuidString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[WBSCloudTabCloseRequest initWithURL:tabUUIDString:lastModified:sourceDeviceUUID:destinationDeviceUUID:requestUUID:](v12, "initWithURL:tabUUIDString:lastModified:sourceDeviceUUID:destinationDeviceUUID:requestUUID:", v13, v14, v15, v8, v11, v7);
  -[WBSCloudTabCloseRequest dictionaryRepresentation](v16, "dictionaryRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "UUIDString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v19;
      _os_log_impl(&dword_1A3D90000, v18, OS_LOG_TYPE_DEFAULT, "Writing close request to CloudKit for device with UUID %{public}@", buf, 0xCu);

    }
    v20 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v11, "UUIDString");
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "url");
      objc_claimAutoreleasedReturnValue();
      -[WBSCloudTabStore _writeCloseRequestForTab:onDevice:].cold.1();
    }

    objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __54__WBSCloudTabStore__writeCloseRequestForTab_onDevice___block_invoke;
    v25[3] = &unk_1E4B2AD70;
    v25[4] = self;
    objc_msgSend(v21, "saveCloudTabCloseRequestWithDictionaryRepresentation:closeRequestUUIDString:completionHandler:", v17, v22, v25);

  }
  return v17 != 0;
}

void __54__WBSCloudTabStore__writeCloseRequestForTab_onDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD block[9];

  block[8] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __54__WBSCloudTabStore__writeCloseRequestForTab_onDevice___block_invoke_cold_1();
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__WBSCloudTabStore__writeCloseRequestForTab_onDevice___block_invoke_32;
    block[3] = &unk_1E4B2A2C8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __54__WBSCloudTabStore__writeCloseRequestForTab_onDevice___block_invoke_32(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __54__WBSCloudTabStore__writeCloseRequestForTab_onDevice___block_invoke_32_cold_1(v2);
  return objc_msgSend(*(id *)(a1 + 32), "fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit");
}

- (BOOL)_closeTabs:(id)a3 onDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  NSObject *internalQueue;
  _QWORD block[5];
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (-[WBSCloudTabStore _writeCloseRequestForTab:onDevice:](self, "_writeCloseRequestForTab:onDevice:", v13, v7))
          objc_msgSend(v8, "addObject:", v13);
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  v14 = objc_msgSend(v8, "count");
  if (v14)
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__WBSCloudTabStore__closeTabs_onDevice___block_invoke;
    block[3] = &unk_1E4B2B2A8;
    block[4] = self;
    v18 = v8;
    v19 = v7;
    dispatch_sync(internalQueue, block);

  }
  return v14 != 0;
}

void __40__WBSCloudTabStore__closeTabs_onDevice___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_tabsWereClosed:onDevice:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_devicesByFilteringAndSortingDevices:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

}

- (id)_deviceWithTabsWithOutstandingCloseRequestsRemoved:(id)a3 closeRequestsForDevice:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  WBSCloudTabDevice *v18;
  void *v19;
  WBSCloudTabDevice *v20;
  NSObject *v21;
  void *v22;
  id v24;
  void *v25;
  id v26;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v26 = a4;
  if (objc_msgSend(v26, "count"))
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v24, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v6;
      _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_DEFAULT, "Removing tabs with outstanding close requests for device with UUID %{public}@", buf, 0xCu);

    }
    objc_msgSend(v24, "tabs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v24, "tabs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v29;
      v12 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v27[0] = v12;
          v27[1] = 3221225472;
          v27[2] = __94__WBSCloudTabStore__deviceWithTabsWithOutstandingCloseRequestsRemoved_closeRequestsForDevice___block_invoke;
          v27[3] = &unk_1E4B2C058;
          v27[4] = v14;
          if (objc_msgSend(v26, "indexOfObjectPassingTest:", v27) == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v25, "addObject:", v14);
          }
          else
          {
            v15 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v14, "uuid");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v34 = v16;
              _os_log_impl(&dword_1A3D90000, v15, OS_LOG_TYPE_DEFAULT, "Removing tab with outstanding close request with UUID %{public}@", buf, 0xCu);

            }
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v25, "count"))
    {
      +[WBSCloudTabDeviceParameters parametersWithDevice:](WBSCloudTabDeviceParameters, "parametersWithDevice:", v24);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTabs:", v25);
      v18 = [WBSCloudTabDevice alloc];
      objc_msgSend(v24, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[WBSCloudTabDevice initWithParameters:uuid:](v18, "initWithParameters:uuid:", v17, v19);

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v21 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v24, "uuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v22;
      _os_log_impl(&dword_1A3D90000, v21, OS_LOG_TYPE_DEFAULT, "No outstanding close requests for device with UUID %{public}@", buf, 0xCu);

    }
    v20 = (WBSCloudTabDevice *)v24;
  }

  return v20;
}

uint64_t __94__WBSCloudTabStore__deviceWithTabsWithOutstandingCloseRequestsRemoved_closeRequestsForDevice___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matchesCloudTab:", *(_QWORD *)(a1 + 32));
}

- (void)_addCloseRequestDictionary:(id)a3 toDeviceUUIDsToCloseRequestsDictionary:(id)a4 requestUUID:(id)a5
{
  id v7;
  id v8;
  WBSCloudTabCloseRequest *v9;
  void *v10;
  WBSCloudTabCloseRequest *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a3;
  v7 = a4;
  v8 = a5;
  v9 = [WBSCloudTabCloseRequest alloc];
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v8);
  v11 = -[WBSCloudTabCloseRequest initWithDictionary:requestUUID:](v9, "initWithDictionary:requestUUID:", v15, v10);

  if (v11)
  {
    -[WBSCloudTabCloseRequest destinationDeviceUUID](v11, "destinationDeviceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v13);
    }
    objc_msgSend(v14, "addObject:", v11);

  }
}

- (unint64_t)_indexOfDeviceInSyncedCloudTabDevicesFromCloudKit:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *syncedCloudTabDevicesFromCloudKit;
  id v7;
  unint64_t v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  syncedCloudTabDevicesFromCloudKit = self->_syncedCloudTabDevicesFromCloudKit;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__WBSCloudTabStore__indexOfDeviceInSyncedCloudTabDevicesFromCloudKit___block_invoke;
  v10[3] = &unk_1E4B2C080;
  v11 = v5;
  v7 = v5;
  v8 = -[NSMutableArray indexOfObjectPassingTest:](syncedCloudTabDevicesFromCloudKit, "indexOfObjectPassingTest:", v10);

  return v8;
}

uint64_t __70__WBSCloudTabStore__indexOfDeviceInSyncedCloudTabDevicesFromCloudKit___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (void)_tabWasClosed:(id)a3 onDevice:(id)a4
{
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = -[WBSCloudTabStore _indexOfDeviceInSyncedCloudTabDevicesFromCloudKit:](self, "_indexOfDeviceInSyncedCloudTabDevicesFromCloudKit:", a4);
  -[NSMutableArray objectAtIndexedSubscript:](self->_syncedCloudTabDevicesFromCloudKit, "objectAtIndexedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceByRemovingTab:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_syncedCloudTabDevicesFromCloudKit, "replaceObjectAtIndex:withObject:", v6, v8);

}

- (void)_tabsWereClosed:(id)a3 onDevice:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = -[WBSCloudTabStore _indexOfDeviceInSyncedCloudTabDevicesFromCloudKit:](self, "_indexOfDeviceInSyncedCloudTabDevicesFromCloudKit:", v6);
  objc_msgSend(v6, "deviceByRemovingTabs:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_syncedCloudTabDevicesFromCloudKit, "replaceObjectAtIndex:withObject:", v7, v8);

}

- (void)_syncAgentProxyConnectionWasInvalidated:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__WBSCloudTabStore__syncAgentProxyConnectionWasInvalidated___block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __60__WBSCloudTabStore__syncAgentProxyConnectionWasInvalidated___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BYTE *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[16];

  v2 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A3D90000, v2, OS_LOG_TYPE_DEFAULT, "CloudKit syncing of iCloud Tabs is not available", v6, 2u);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 0;
  v3 = *(_BYTE **)(a1 + 32);
  if (v3[16])
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4099, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_didFetchDeviceDictionariesFromCloudKit:fetchedCloseRequests:error:", 0, 0, v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "resetSyncedCloudTabDevicesAndCloseRequestsFromCloudKit");
    v5 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;
  }

}

void __57__WBSCloudTabStore__devicesByFilteringAndSortingDevices___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v9 = a3;
  if (objc_msgSend(v9, "count") != 1)
  {
    objc_msgSend(v9, "sortUsingComparator:", &__block_literal_global_40);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__WBSCloudTabStore__devicesByFilteringAndSortingDevices___block_invoke_3;
    v10[3] = &unk_1E4B2C110;
    v11 = *(id *)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

    v8 = v11;
    goto LABEL_5;
  }
  objc_msgSend(v9, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((v6 & 1) == 0)
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v9, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);
LABEL_5:

  }
}

uint64_t __57__WBSCloudTabStore__devicesByFilteringAndSortingDevices___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  return v7;
}

void __57__WBSCloudTabStore__devicesByFilteringAndSortingDevices___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((v6 & 1) == 0)
  {
    v7 = *(void **)(a1 + 40);
    v8 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v9, v10, a3 + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "deviceBySettingDisambiguatedName:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v12);

  }
}

uint64_t __57__WBSCloudTabStore__devicesByFilteringAndSortingDevices___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "lastModified");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastModified");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  return v7;
}

- (id)_currentDeviceUUID
{
  return 0;
}

- (WBSCloudTabStoreDelegate)wbsDelegate
{
  return (WBSCloudTabStoreDelegate *)objc_loadWeakRetained((id *)&self->_wbsDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_wbsDelegate);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_lastFetchError, 0);
  objc_storeStrong((id *)&self->_deviceUUIDsToCloseRequestsFromCloudKit, 0);
  objc_storeStrong((id *)&self->_currentDevice, 0);
  objc_storeStrong((id *)&self->_filteredAndSortedSyncedCloudTabDevicesFromCloudKit, 0);
  objc_storeStrong((id *)&self->_syncedCloudTabDevicesFromCloudKit, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

- (void)closeTab:onDevice:.cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(v2, v3, v4, 5.8081e-34);
  OUTLINED_FUNCTION_7_0(&dword_1A3D90000, "Closing single tab %{private}@ on \"%{private}@\", v5, v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)closeAllTabsOnDevice:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.808e-34);
  OUTLINED_FUNCTION_4_2(&dword_1A3D90000, v3, (uint64_t)v3, "Closing all tabs on \"%{private}@\", v4);

  OUTLINED_FUNCTION_2_0();
}

- (void)saveCurrentCloudTabDeviceDictionaryToCloudKit:completionHandler:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.808e-34);
  OUTLINED_FUNCTION_4_2(&dword_1A3D90000, v3, (uint64_t)v3, "Saving current device to CloudKit with dictionary: %{private}@", v4);

  OUTLINED_FUNCTION_2_0();
}

void __51__WBSCloudTabStore_pruneExpiredDevicesFromCloudKit__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v4 = 138477827;
  v5 = v3;
  OUTLINED_FUNCTION_4_2(&dword_1A3D90000, a2, a3, "Current CloudKit devices: %{private}@", (uint8_t *)&v4);
}

void __51__WBSCloudTabStore_pruneExpiredDevicesFromCloudKit__block_invoke_11_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Deleting expired devices failed with error %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __83__WBSCloudTabStore_clearTabsForFirstDuplicateDeviceInCloudKitWithName_passingTest___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, a1, a3, "No other devices found when when looking for duplicates", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __54__WBSCloudTabStore_handleCloseTabRequestsFromCloudKit__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Deleting close requests for this device failed with error %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __48__WBSCloudTabStore_deleteAllDevicesFromCloudKit__block_invoke_26_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Deleting all devices in CloudKit failed with error %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_writeCloseRequestForTab:onDevice:.cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_7_0(&dword_1A3D90000, "Writing close request to CloudKit for device with UUID %{public}@ and tab URL %{private}@", v5, v6);

  OUTLINED_FUNCTION_2_0();
}

void __54__WBSCloudTabStore__writeCloseRequestForTab_onDevice___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Writing close request failed with error %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __54__WBSCloudTabStore__writeCloseRequestForTab_onDevice___block_invoke_32_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Fetching data from CloudKit after writing close request failed", v1, 2u);
  OUTLINED_FUNCTION_5();
}

@end
