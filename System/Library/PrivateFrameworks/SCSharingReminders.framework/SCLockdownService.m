@implementation SCLockdownService

- (id)interestedNotifications
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251665C48);
}

- (SCLockdownService)init
{
  SCLockdownService *v2;
  id v3;
  dispatch_queue_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCLockdownService;
  v2 = -[SCLockdownService init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BE2A8D8]);
    -[SCLockdownService setRemotePairingStore:](v2, "setRemotePairingStore:", v3);

    v4 = dispatch_queue_create("LockdownServiceQueue", 0);
    -[SCLockdownService setWorkQueue:](v2, "setWorkQueue:", v4);

  }
  return v2;
}

- (void)fetchWifiSyncIdentifiersWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    -[SCLockdownService remotePairingStore](self, "remotePairingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLockdownService workQueue](self, "workQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __60__SCLockdownService_fetchWifiSyncIdentifiersWithCompletion___block_invoke;
    v7[3] = &unk_251662A78;
    v8 = v4;
    objc_msgSend(v5, "fetchPairedDevicesOnQueue:completion:", v6, v7);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, MEMORY[0x24BDBD1A8]);
  }

}

void __60__SCLockdownService_fetchWifiSyncIdentifiersWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    SCLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __60__SCLockdownService_fetchWifiSyncIdentifiersWithCompletion___block_invoke_cold_1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v20, "lockdownFrameworkKey", (_QWORD)v23);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v20, "lockdownFrameworkKey");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v22);

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v17);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)hostForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  int v9;
  char v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  void (**v15)(id, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[SCLockdownService remotePairingStore](self, "remotePairingStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isWifiSyncEnabled");
  if (!v6 || !v9)
  {

    goto LABEL_6;
  }
  v10 = _os_feature_enabled_impl();

  if ((v10 & 1) == 0)
  {
LABEL_6:
    v7[2](v7, 0);
    goto LABEL_7;
  }
  -[SCLockdownService remotePairingStore](self, "remotePairingStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLockdownService workQueue](self, "workQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __50__SCLockdownService_hostForIdentifier_completion___block_invoke;
  v13[3] = &unk_251662AA0;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  objc_msgSend(v11, "fetchPairedDevicesOnQueue:completion:", v12, v13);

LABEL_7:
}

void __50__SCLockdownService_hostForIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  const __CFArray *v16;
  const __CFArray *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint8_t buf[16];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    SCLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __60__SCLockdownService_fetchWifiSyncIdentifiersWithCompletion___block_invoke_cold_1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

  }
  objc_msgSend(*(id *)(a1 + 32), "interestedNotifications");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v15)
  {
    v16 = (const __CFArray *)lockdown_copy_wireless_connections_list();
    if (v16)
    {
      v17 = v16;
      CFArrayGetValueAtIndex(v16, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v17);
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = v6;
      v19 = v6;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v37;
        while (2)
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v37 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v23), "lockdownFrameworkKey");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v18, "isEqualToString:", v24);

            if (v25)
            {
              (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

              goto LABEL_22;
            }
            ++v23;
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
          if (v21)
            continue;
          break;
        }
      }

      SCLogger();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2454C0000, v26, OS_LOG_TYPE_DEFAULT, "\"Found no wirelessly connected hosts\", buf, 2u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_22:

      v6 = v34;
    }
  }
  else
  {
    SCLogger();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      __50__SCLockdownService_hostForIdentifier_completion___block_invoke_cold_1(a1 + 40, v27, v28, v29, v30, v31, v32, v33);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (DSRemotePairingStore)remotePairingStore
{
  return self->_remotePairingStore;
}

- (void)setRemotePairingStore:(id)a3
{
  objc_storeStrong((id *)&self->_remotePairingStore, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_remotePairingStore, 0);
}

void __60__SCLockdownService_fetchWifiSyncIdentifiersWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_2454C0000, a2, a3, "\"Failed to fetch paired devices. Error: %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __50__SCLockdownService_hostForIdentifier_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_2454C0000, a2, a3, "\"Returning null because notification: %@ was not recognized\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
