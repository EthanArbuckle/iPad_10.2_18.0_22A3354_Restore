@implementation SidecarDisplayReceivingManager

- (void)fetchSendingDeviceSessionStatesWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint8_t buf[16];

  v3 = a3;
  SidecarCoreLogSubsystem(OS_LOG_TYPE_INFO);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_220044000, v5, OS_LOG_TYPE_INFO, "Fetching the sending remote display device session states.", buf, 2u);
  }

  SidecarQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__SidecarDisplayReceivingManager_fetchSendingDeviceSessionStatesWithCompletion___block_invoke;
  block[3] = &unk_24E5E1050;
  v9 = v3;
  v7 = v3;
  dispatch_async(v6, block);

}

- (void)requestConnectionFromDeviceWithIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  SidecarCoreLogSubsystem(OS_LOG_TYPE_DEFAULT);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v5;
    _os_log_impl(&dword_220044000, v8, OS_LOG_TYPE_DEFAULT, "Requesting that device with identifier [%{public}@] open a virtual display session with this device.", buf, 0xCu);
  }

  SidecarQueue();
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __87__SidecarDisplayReceivingManager_requestConnectionFromDeviceWithIdentifier_completion___block_invoke;
  v12[3] = &unk_24E5E12B0;
  v13 = v5;
  v14 = v6;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, v12);

}

- (void)disconnectFromDeviceWithIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  SidecarCoreLogSubsystem(OS_LOG_TYPE_DEFAULT);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v5;
    _os_log_impl(&dword_220044000, v8, OS_LOG_TYPE_DEFAULT, "Disconnecting the virtual display session from device with identifier: [%{public}@].", buf, 0xCu);
  }

  SidecarQueue();
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __80__SidecarDisplayReceivingManager_disconnectFromDeviceWithIdentifier_completion___block_invoke;
  v12[3] = &unk_24E5E12B0;
  v13 = v5;
  v14 = v6;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, v12);

}

- (void)ignoreDetectionForAnchorIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  SidecarCoreLogSubsystem(OS_LOG_TYPE_DEFAULT);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v5;
    _os_log_impl(&dword_220044000, v8, OS_LOG_TYPE_DEFAULT, "Requesting to ignore detection for identifier: [%{public}@]", buf, 0xCu);
  }

  SidecarQueue();
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __80__SidecarDisplayReceivingManager_ignoreDetectionForAnchorIdentifier_completion___block_invoke;
  v12[3] = &unk_24E5E12B0;
  v13 = v5;
  v14 = v6;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, v12);

}

- (void)fetchDeviceReadinessStatusWithIDSIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  SidecarCoreLogSubsystem(OS_LOG_TYPE_DEFAULT);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v5;
    _os_log_impl(&dword_220044000, v8, OS_LOG_TYPE_DEFAULT, "Fetching readiness for identifier: [%{public}@]", buf, 0xCu);
  }

  SidecarQueue();
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __89__SidecarDisplayReceivingManager_fetchDeviceReadinessStatusWithIDSIdentifier_completion___block_invoke;
  v12[3] = &unk_24E5E12B0;
  v13 = v5;
  v14 = v6;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, v12);

}

void __89__SidecarDisplayReceivingManager_fetchDeviceReadinessStatusWithIDSIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  void *v6;
  id v7;
  id v8;

  v3 = MEMORY[0x24BDAC760];
  v4 = 3221225472;
  v5 = __89__SidecarDisplayReceivingManager_fetchDeviceReadinessStatusWithIDSIdentifier_completion___block_invoke_2;
  v6 = &unk_24E5E1078;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  SidecarRelayProxyAsync(0, &v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relayFetchDeviceReadinessStatusWithIDSIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v3, v4, v5, v6);

}

void __89__SidecarDisplayReceivingManager_fetchDeviceReadinessStatusWithIDSIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *log;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v15 = v7;
    _os_log_impl(&dword_220044000, v5, OS_LOG_TYPE_ERROR, "Encountered error while trying to fetch readiness for device with IDS identifier [%{public}@].  The error will be logged separately.", buf, 0xCu);
  }

  v6 = v3;
  if (v6)
  {
    SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      log = v8;
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      v8 = log;
      if (v9)
      {
        objc_msgSend(v6, "domain");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v6, "code");
        objc_msgSend(v6, "localizedDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543875;
        v15 = v10;
        v16 = 2048;
        v17 = v11;
        v18 = 2113;
        v19 = v12;
        _os_log_impl(&dword_220044000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

        v8 = log;
      }
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __80__SidecarDisplayReceivingManager_ignoreDetectionForAnchorIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  void *v6;
  id v7;
  id v8;

  v3 = MEMORY[0x24BDAC760];
  v4 = 3221225472;
  v5 = __80__SidecarDisplayReceivingManager_ignoreDetectionForAnchorIdentifier_completion___block_invoke_2;
  v6 = &unk_24E5E1078;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  SidecarRelayProxyAsync(0, &v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relayIgnoreDetectionForAnchorIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v3, v4, v5, v6);

}

void __80__SidecarDisplayReceivingManager_ignoreDetectionForAnchorIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *log;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v15 = v7;
    _os_log_impl(&dword_220044000, v5, OS_LOG_TYPE_ERROR, "Encountered error while trying to ignore detection for identifier [%{public}@].  The error will be logged separately.", buf, 0xCu);
  }

  v6 = v3;
  if (v6)
  {
    SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      log = v8;
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      v8 = log;
      if (v9)
      {
        objc_msgSend(v6, "domain");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v6, "code");
        objc_msgSend(v6, "localizedDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543875;
        v15 = v10;
        v16 = 2048;
        v17 = v11;
        v18 = 2113;
        v19 = v12;
        _os_log_impl(&dword_220044000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

        v8 = log;
      }
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __80__SidecarDisplayReceivingManager_disconnectFromDeviceWithIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  void *v6;
  id v7;
  id v8;

  v3 = MEMORY[0x24BDAC760];
  v4 = 3221225472;
  v5 = __80__SidecarDisplayReceivingManager_disconnectFromDeviceWithIdentifier_completion___block_invoke_2;
  v6 = &unk_24E5E1078;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  SidecarRelayProxyAsync(0, &v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relayIssueRemoteDisplayDisconnectionRequestToSendingDeviceWithIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v3, v4, v5, v6);

}

void __80__SidecarDisplayReceivingManager_disconnectFromDeviceWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *log;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v15 = v7;
    _os_log_impl(&dword_220044000, v5, OS_LOG_TYPE_ERROR, "Encountered error while trying to disconnect the virtual display session from device with identifier: [%{public}@]. The error will be logged separately.", buf, 0xCu);
  }

  v6 = v3;
  if (v6)
  {
    SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      log = v8;
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      v8 = log;
      if (v9)
      {
        objc_msgSend(v6, "domain");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v6, "code");
        objc_msgSend(v6, "localizedDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543875;
        v15 = v10;
        v16 = 2048;
        v17 = v11;
        v18 = 2113;
        v19 = v12;
        _os_log_impl(&dword_220044000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

        v8 = log;
      }
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __87__SidecarDisplayReceivingManager_requestConnectionFromDeviceWithIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  void *v6;
  id v7;
  id v8;

  v3 = MEMORY[0x24BDAC760];
  v4 = 3221225472;
  v5 = __87__SidecarDisplayReceivingManager_requestConnectionFromDeviceWithIdentifier_completion___block_invoke_2;
  v6 = &unk_24E5E1078;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  SidecarRelayProxyAsync(0, &v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relayIssueRemoteDisplayConnectionRequestToSendingDeviceWithIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v3, v4, v5, v6);

}

void __87__SidecarDisplayReceivingManager_requestConnectionFromDeviceWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *log;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v15 = v7;
    _os_log_impl(&dword_220044000, v5, OS_LOG_TYPE_ERROR, "Encountered error while trying to request that device with identifier [%{public}@] open a virtual display session with this device.  The error will be logged separately.", buf, 0xCu);
  }

  v6 = v3;
  if (v6)
  {
    SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      log = v8;
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      v8 = log;
      if (v9)
      {
        objc_msgSend(v6, "domain");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v6, "code");
        objc_msgSend(v6, "localizedDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543875;
        v15 = v10;
        v16 = 2048;
        v17 = v11;
        v18 = 2113;
        v19 = v12;
        _os_log_impl(&dword_220044000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

        v8 = log;
      }
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __80__SidecarDisplayReceivingManager_fetchSendingDeviceSessionStatesWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __80__SidecarDisplayReceivingManager_fetchSendingDeviceSessionStatesWithCompletion___block_invoke_2;
  v3[3] = &unk_24E5E1028;
  v4 = *(id *)(a1 + 32);
  SidecarRelayProxyAsync(0, v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relayFetchRemoteDisplaySendingDeviceStatesWithCompletion:", *(_QWORD *)(a1 + 32));

}

void __80__SidecarDisplayReceivingManager_fetchSendingDeviceSessionStatesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *log;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_220044000, v5, OS_LOG_TYPE_ERROR, "Encountered error while trying to fetch sending remote display device session states.  The error will be logged separately.", buf, 2u);
  }

  v6 = v3;
  if (v6)
  {
    SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      log = v9;
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
      v9 = log;
      if (v10)
      {
        objc_msgSend(v6, "domain");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v6, "code");
        objc_msgSend(v6, "localizedDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543875;
        v16 = v11;
        v17 = 2048;
        v18 = v12;
        v19 = 2113;
        v20 = v13;
        _os_log_impl(&dword_220044000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

        v9 = log;
      }
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v6);

}

@end
