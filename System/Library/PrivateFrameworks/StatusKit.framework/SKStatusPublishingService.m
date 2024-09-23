@implementation SKStatusPublishingService

- (SKStatusPublishingService)initWithStatusTypeIdentifier:(id)a3
{
  id v4;
  SKStatusPublishingService *v5;
  uint64_t v6;
  NSString *statusTypeIdentifier;
  uint64_t v8;
  NSMapTable *delegates;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *privateWorkQueue;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SKStatusPublishingService;
  v5 = -[SKStatusPublishingService init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    statusTypeIdentifier = v5->_statusTypeIdentifier;
    v5->_statusTypeIdentifier = (NSString *)v6;

    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    delegates = v5->_delegates;
    v5->_delegates = (NSMapTable *)v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_DEFAULT, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = dispatch_queue_create("com.apple.StatusKit.PublishingService", v11);
    privateWorkQueue = v5->_privateWorkQueue;
    v5->_privateWorkQueue = (OS_dispatch_queue *)v12;

  }
  return v5;
}

- (void)publishStatusRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SKStatusPublishingService _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKStatusPublishingService statusTypeIdentifier](self, "statusTypeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v26 = v8;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_213251000, v9, OS_LOG_TYPE_DEFAULT, "Publishing status request. StatusType: %{public}@ Request: %@", buf, 0x16u);
  }

  -[SKStatusPublishingService daemonConnection](self, "daemonConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v11 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __61__SKStatusPublishingService_publishStatusRequest_completion___block_invoke;
  v20[3] = &unk_24CF73558;
  v12 = v8;
  v21 = v12;
  v13 = v6;
  v22 = v13;
  objc_copyWeak(&v24, (id *)buf);
  v14 = v7;
  v23 = v14;
  objc_msgSend(v10, "asynchronousRemoteDaemonWithErrorHandler:", v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __61__SKStatusPublishingService_publishStatusRequest_completion___block_invoke_4;
  v17[3] = &unk_24CF73580;
  objc_copyWeak(&v19, (id *)buf);
  v16 = v14;
  v18 = v16;
  objc_msgSend(v15, "publishStatusRequest:statusTypeIdentifier:completion:", v13, v12, v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v24);

  objc_destroyWeak((id *)buf);
}

void __61__SKStatusPublishingService_publishStatusRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__SKStatusPublishingService_publishStatusRequest_completion___block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __61__SKStatusPublishingService_publishStatusRequest_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id WeakRetained;
  void (*v10)(void);
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __61__SKStatusPublishingService_publishStatusRequest_completion___block_invoke_4_cold_1();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v6);

    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_213251000, v8, OS_LOG_TYPE_DEFAULT, "Publish status request completed with statusUniqueIdentifier: %@", (uint8_t *)&v11, 0xCu);
    }

    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v10();

}

- (void)provisionPayloads:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SKStatusPublishingService _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKStatusPublishingService statusTypeIdentifier](self, "statusTypeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v6;
    _os_log_impl(&dword_213251000, v9, OS_LOG_TYPE_DEFAULT, "Provisioning request. Payloads: %{public}@", buf, 0xCu);
  }

  -[SKStatusPublishingService daemonConnection](self, "daemonConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v11 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __58__SKStatusPublishingService_provisionPayloads_completion___block_invoke;
  v21[3] = &unk_24CF735A8;
  v12 = v8;
  v22 = v12;
  objc_copyWeak(&v24, (id *)buf);
  v13 = v7;
  v23 = v13;
  objc_msgSend(v10, "asynchronousRemoteDaemonWithErrorHandler:", v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __58__SKStatusPublishingService_provisionPayloads_completion___block_invoke_6;
  v17[3] = &unk_24CF735D0;
  objc_copyWeak(&v20, (id *)buf);
  v15 = v13;
  v19 = v15;
  v16 = v12;
  v18 = v16;
  objc_msgSend(v14, "provisionPayloads:statusTypeIdentifier:completion:", v6, v16, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v24);

  objc_destroyWeak((id *)buf);
}

void __58__SKStatusPublishingService_provisionPayloads_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __58__SKStatusPublishingService_provisionPayloads_completion___block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __58__SKStatusPublishingService_provisionPayloads_completion___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id WeakRetained;
  void (*v10)(void);
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __58__SKStatusPublishingService_provisionPayloads_completion___block_invoke_6_cold_1();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v6);

    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 138412290;
      v13 = v11;
      _os_log_impl(&dword_213251000, v8, OS_LOG_TYPE_DEFAULT, "Provisioning request completed with statusUniqueIdentifier: %@", (uint8_t *)&v12, 0xCu);
    }

    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v10();

}

- (NSArray)invitedHandles
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  __int128 *v14;
  _QWORD v15[4];
  id v16;
  __int128 *p_buf;
  id v18;
  id location;
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[SKStatusPublishingService _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKStatusPublishingService statusTypeIdentifier](self, "statusTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_213251000, v4, OS_LOG_TYPE_DEFAULT, "Retrieving invited handles. StatusType: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  -[SKStatusPublishingService daemonConnection](self, "daemonConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __43__SKStatusPublishingService_invitedHandles__block_invoke;
  v15[3] = &unk_24CF735F8;
  v7 = v3;
  v16 = v7;
  objc_copyWeak(&v18, &location);
  p_buf = &buf;
  objc_msgSend(v5, "synchronousRemoteDaemonWithErrorHandler:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __43__SKStatusPublishingService_invitedHandles__block_invoke_8;
  v12[3] = &unk_24CF73620;
  v9 = v7;
  v13 = v9;
  v14 = &buf;
  objc_msgSend(v8, "invitedHandlesForStatusTypeIdentifier:completion:", v9, v12);
  v10 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
  return (NSArray *)v10;
}

void __43__SKStatusPublishingService_invitedHandles__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;

  v3 = a2;
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __43__SKStatusPublishingService_invitedHandles__block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v3);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

void __43__SKStatusPublishingService_invitedHandles__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v13 = 138543874;
      v14 = v9;
      v15 = 2112;
      v16 = v5;
      v17 = 2112;
      v18 = v6;
      _os_log_error_impl(&dword_213251000, v8, OS_LOG_TYPE_ERROR, "Retreived invited handles. StatusType: %{public}@ Handles: %@ Error: %@", (uint8_t *)&v13, 0x20u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v13 = 138543618;
    v14 = v10;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_213251000, v8, OS_LOG_TYPE_DEFAULT, "Retreived invited handles. StatusType: %{public}@ Handles: %@", (uint8_t *)&v13, 0x16u);
  }

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v5;

}

- (BOOL)isHandleInvitedFromPrimaryAccountHandle:(id)a3
{
  return -[SKStatusPublishingService _isHandleInvited:fromSenderHandle:](self, "_isHandleInvited:fromSenderHandle:", a3, 0);
}

- (BOOL)_isHandleInvited:(id)a3 fromSenderHandle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  _BYTE *v20;
  _QWORD v21[4];
  id v22;
  _BYTE *v23;
  _BYTE buf[24];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SKStatusPublishingService _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKStatusPublishingService statusTypeIdentifier](self, "statusTypeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2114;
    v25 = v8;
    _os_log_impl(&dword_213251000, v9, OS_LOG_TYPE_DEFAULT, "Checking if handle %@ has already been invited (sync) from handle: %@. StatusType: %{public}@", buf, 0x20u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v25) = 0;
  -[SKStatusPublishingService daemonConnection](self, "daemonConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __63__SKStatusPublishingService__isHandleInvited_fromSenderHandle___block_invoke;
  v21[3] = &unk_24CF73648;
  v12 = v8;
  v22 = v12;
  v23 = buf;
  objc_msgSend(v10, "synchronousRemoteDaemonWithErrorHandler:", v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __63__SKStatusPublishingService__isHandleInvited_fromSenderHandle___block_invoke_9;
  v17[3] = &unk_24CF73670;
  v14 = v12;
  v18 = v14;
  v15 = v6;
  v19 = v15;
  v20 = buf;
  objc_msgSend(v13, "isHandleInvited:fromSenderHandle:forStatusTypeIdentifier:completion:", v15, v7, v14, v17);
  LOBYTE(v12) = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return (char)v12;
}

void __63__SKStatusPublishingService__isHandleInvited_fromSenderHandle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __63__SKStatusPublishingService__isHandleInvited_fromSenderHandle___block_invoke_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

void __63__SKStatusPublishingService__isHandleInvited_fromSenderHandle___block_invoke_9(_QWORD *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = a1[4];
      v9 = a1[5];
      v12 = 138544130;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 1024;
      v17 = a2;
      v18 = 2112;
      v19 = v5;
      _os_log_error_impl(&dword_213251000, v7, OS_LOG_TYPE_ERROR, "Checked if handle is invited (sync). StatusType: %{public}@ Handle: %@ isInvited:%d Error: %@", (uint8_t *)&v12, 0x26u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = a1[4];
    v11 = a1[5];
    v12 = 138543874;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    v16 = 1024;
    v17 = a2;
    _os_log_impl(&dword_213251000, v7, OS_LOG_TYPE_DEFAULT, "Determined if handle is invited (sync). StatusType: %{public}@ Handle: %@ isInvited: %d", (uint8_t *)&v12, 0x1Cu);
  }

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
}

- (void)isHandleInvitedFromPrimaryAccountHandle:(id)a3 completion:(id)a4
{
  -[SKStatusPublishingService _isHandleInvited:fromSenderHandle:completion:](self, "_isHandleInvited:fromSenderHandle:completion:", a3, 0, a4);
}

- (void)_isHandleInvited:(id)a3 fromSenderHandle:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SKStatusPublishingService _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKStatusPublishingService statusTypeIdentifier](self, "statusTypeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v31 = v8;
    v32 = 2112;
    v33 = v9;
    v34 = 2114;
    v35 = v11;
    _os_log_impl(&dword_213251000, v12, OS_LOG_TYPE_DEFAULT, "Checking if handle %@ has already been invited (async) from handle: %@. StatusType: %{public}@", buf, 0x20u);
  }

  -[SKStatusPublishingService daemonConnection](self, "daemonConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __74__SKStatusPublishingService__isHandleInvited_fromSenderHandle_completion___block_invoke;
  v26[3] = &unk_24CF73698;
  v15 = v11;
  v27 = v15;
  v16 = v8;
  v28 = v16;
  v17 = v10;
  v29 = v17;
  objc_msgSend(v13, "asynchronousRemoteDaemonWithErrorHandler:", v26);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __74__SKStatusPublishingService__isHandleInvited_fromSenderHandle_completion___block_invoke_11;
  v22[3] = &unk_24CF736C0;
  v23 = v15;
  v24 = v16;
  v25 = v17;
  v19 = v17;
  v20 = v16;
  v21 = v15;
  objc_msgSend(v18, "isHandleInvited:fromSenderHandle:forStatusTypeIdentifier:completion:", v20, v9, v21, v22);

}

void __74__SKStatusPublishingService__isHandleInvited_fromSenderHandle_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __74__SKStatusPublishingService__isHandleInvited_fromSenderHandle_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __74__SKStatusPublishingService__isHandleInvited_fromSenderHandle_completion___block_invoke_11(_QWORD *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = a1[4];
      v9 = a1[5];
      v12 = 138544130;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 1024;
      v17 = a2;
      v18 = 2112;
      v19 = v5;
      _os_log_error_impl(&dword_213251000, v7, OS_LOG_TYPE_ERROR, "Error while checking if handle has already been invited (async). StatusType: %{public}@ Handle: %@ isInvited:%d Error: %@", (uint8_t *)&v12, 0x26u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = a1[4];
    v11 = a1[5];
    v12 = 138543874;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    v16 = 1024;
    v17 = a2;
    _os_log_impl(&dword_213251000, v7, OS_LOG_TYPE_DEFAULT, "Checked if handle is invited (async). StatusType: %{public}@ Handle: %@ isInvited: %d", (uint8_t *)&v12, 0x1Cu);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)isHandleInvitableFromPrimaryAccountHandle:(id)a3 completion:(id)a4
{
  -[SKStatusPublishingService _isHandleInvitable:fromSenderHandle:completion:](self, "_isHandleInvitable:fromSenderHandle:completion:", a3, 0, a4);
}

- (void)fetchHandleInvitabilityFromPrimaryAccountHandle:(id)a3 completion:(id)a4
{
  -[SKStatusPublishingService _fetchHandleInvitability:fromSenderHandle:completion:](self, "_fetchHandleInvitability:fromSenderHandle:completion:", a3, 0, a4);
}

- (void)_fetchHandleInvitability:(id)a3 fromSenderHandle:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[SKStatusPublishingService _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKStatusPublishingService statusTypeIdentifier](self, "statusTypeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v31 = v8;
    v32 = 2114;
    v33 = v11;
    _os_log_impl(&dword_213251000, v12, OS_LOG_TYPE_DEFAULT, "Fetching handle %@ invitability. StatusType: %{public}@", buf, 0x16u);
  }

  -[SKStatusPublishingService daemonConnection](self, "daemonConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __82__SKStatusPublishingService__fetchHandleInvitability_fromSenderHandle_completion___block_invoke;
  v26[3] = &unk_24CF73698;
  v15 = v11;
  v27 = v15;
  v16 = v8;
  v28 = v16;
  v17 = v9;
  v29 = v17;
  objc_msgSend(v13, "asynchronousRemoteDaemonWithErrorHandler:", v26);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __82__SKStatusPublishingService__fetchHandleInvitability_fromSenderHandle_completion___block_invoke_12;
  v22[3] = &unk_24CF736E8;
  v23 = v15;
  v24 = v16;
  v25 = v17;
  v19 = v17;
  v20 = v16;
  v21 = v15;
  objc_msgSend(v18, "fetchHandleInvitability:fromHandle:forStatusTypeIdentifier:completion:", v20, v10, v21, v22);

}

void __82__SKStatusPublishingService__fetchHandleInvitability_fromSenderHandle_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __82__SKStatusPublishingService__fetchHandleInvitability_fromSenderHandle_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __82__SKStatusPublishingService__fetchHandleInvitability_fromSenderHandle_completion___block_invoke_12(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = a1[4];
      v10 = a1[5];
      v13 = 138544130;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v5;
      v19 = 2112;
      v20 = v6;
      _os_log_error_impl(&dword_213251000, v8, OS_LOG_TYPE_ERROR, "Error fetching handle invitability. StatusType: %{public}@ Handle: %@ invitability:%@ Error: %@", (uint8_t *)&v13, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = a1[4];
    v12 = a1[5];
    v13 = 138543874;
    v14 = v11;
    v15 = 2112;
    v16 = v12;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_213251000, v8, OS_LOG_TYPE_DEFAULT, "Checked if handle is invitable. StatusType: %{public}@ Handle: %@ invitability: %@", (uint8_t *)&v13, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)_isHandleInvitable:(id)a3 fromSenderHandle:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[SKStatusPublishingService _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKStatusPublishingService statusTypeIdentifier](self, "statusTypeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v31 = v8;
    v32 = 2114;
    v33 = v11;
    _os_log_impl(&dword_213251000, v12, OS_LOG_TYPE_DEFAULT, "Checking if handle %@ is inviteable. StatusType: %{public}@", buf, 0x16u);
  }

  -[SKStatusPublishingService daemonConnection](self, "daemonConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __76__SKStatusPublishingService__isHandleInvitable_fromSenderHandle_completion___block_invoke;
  v26[3] = &unk_24CF73698;
  v15 = v11;
  v27 = v15;
  v16 = v8;
  v28 = v16;
  v17 = v9;
  v29 = v17;
  objc_msgSend(v13, "asynchronousRemoteDaemonWithErrorHandler:", v26);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __76__SKStatusPublishingService__isHandleInvitable_fromSenderHandle_completion___block_invoke_14;
  v22[3] = &unk_24CF736C0;
  v23 = v15;
  v24 = v16;
  v25 = v17;
  v19 = v17;
  v20 = v16;
  v21 = v15;
  objc_msgSend(v18, "isHandleInviteable:fromHandle:forStatusTypeIdentifier:completion:", v20, v10, v21, v22);

}

void __76__SKStatusPublishingService__isHandleInvitable_fromSenderHandle_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__SKStatusPublishingService__isHandleInvitable_fromSenderHandle_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __76__SKStatusPublishingService__isHandleInvitable_fromSenderHandle_completion___block_invoke_14(_QWORD *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = a1[4];
      v9 = a1[5];
      v12 = 138544130;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 1024;
      v17 = a2;
      v18 = 2112;
      v19 = v5;
      _os_log_error_impl(&dword_213251000, v7, OS_LOG_TYPE_ERROR, "Error while checking if handle is inviteable. StatusType: %{public}@ Handle: %@ isInviteable:%d Error: %@", (uint8_t *)&v12, 0x26u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = a1[4];
    v11 = a1[5];
    v12 = 138543874;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    v16 = 1024;
    v17 = a2;
    _os_log_impl(&dword_213251000, v7, OS_LOG_TYPE_DEFAULT, "Checked if handle is inviteable. StatusType: %{public}@ Handle: %@ isInviteable: %d", (uint8_t *)&v12, 0x1Cu);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)inviteHandleFromPrimaryAccountHandle:(id)a3 withInvitationPayload:(id)a4 completion:(id)a5
{
  -[SKStatusPublishingService _inviteHandle:fromSenderHandle:withInvitationPayload:completion:](self, "_inviteHandle:fromSenderHandle:withInvitationPayload:completion:", a3, 0, a4, a5);
}

- (void)_inviteHandle:(id)a3 fromSenderHandle:(id)a4 withInvitationPayload:(id)a5 completion:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v10 = (void *)MEMORY[0x24BDBCE30];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "arrayWithObjects:count:", &v16, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKStatusPublishingService inviteHandles:fromSenderHandle:withInvitationPayload:completion:](self, "inviteHandles:fromSenderHandle:withInvitationPayload:completion:", v15, v13, v12, v11, v16, v17);
}

- (void)inviteHandlesFromPrimaryAccountHandle:(id)a3 withInvitationPayload:(id)a4 completion:(id)a5
{
  -[SKStatusPublishingService _inviteHandles:fromSenderHandle:withInvitationPayload:completion:](self, "_inviteHandles:fromSenderHandle:withInvitationPayload:completion:", a3, 0, a4, a5);
}

- (void)_inviteHandles:(id)a3 fromSenderHandle:(id)a4 withInvitationPayload:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[SKStatusPublishingService _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKStatusPublishingService statusTypeIdentifier](self, "statusTypeIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v32 = v10;
    v33 = 2114;
    v34 = v14;
    v35 = 2112;
    v36 = v11;
    _os_log_impl(&dword_213251000, v15, OS_LOG_TYPE_DEFAULT, "Received request to invite handles: %@ to personal channel with statusTypeIdentifier: %{public}@ from sender handle: %@", buf, 0x20u);
  }

  -[SKStatusPublishingService daemonConnection](self, "daemonConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v17 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __94__SKStatusPublishingService__inviteHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke;
  v26[3] = &unk_24CF73558;
  v18 = v14;
  v27 = v18;
  v19 = v10;
  v28 = v19;
  objc_copyWeak(&v30, (id *)buf);
  v20 = v13;
  v29 = v20;
  objc_msgSend(v16, "asynchronousRemoteDaemonWithErrorHandler:", v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  v23[1] = 3221225472;
  v23[2] = __94__SKStatusPublishingService__inviteHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_16;
  v23[3] = &unk_24CF73710;
  objc_copyWeak(&v25, (id *)buf);
  v22 = v20;
  v24 = v22;
  objc_msgSend(v21, "inviteHandles:fromSenderHandle:withInvitationPayload:statusTypeIdentifier:completion:", v19, v11, v12, v18, v23);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v30);

  objc_destroyWeak((id *)buf);
}

void __94__SKStatusPublishingService__inviteHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __94__SKStatusPublishingService__inviteHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __94__SKStatusPublishingService__inviteHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *WeakRetained;
  uint8_t v6[16];

  v3 = a2;
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  WeakRetained = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __94__SKStatusPublishingService__inviteHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_16_cold_1();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[NSObject _simulateCrashIfNecessaryForError:](WeakRetained, "_simulateCrashIfNecessaryForError:", v3);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_213251000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Inviting handles completed.", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeInvitedHandle:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKStatusPublishingService removeInvitedHandles:completion:](self, "removeInvitedHandles:completion:", v9, v7, v10, v11);
}

- (void)removeInvitedHandles:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SKStatusPublishingService _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKStatusPublishingService statusTypeIdentifier](self, "statusTypeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v26 = v8;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_213251000, v9, OS_LOG_TYPE_DEFAULT, "Removing invited handles. StatusType: %{public}@ Handles: %@", buf, 0x16u);
  }

  -[SKStatusPublishingService daemonConnection](self, "daemonConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v11 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __61__SKStatusPublishingService_removeInvitedHandles_completion___block_invoke;
  v20[3] = &unk_24CF73558;
  v12 = v8;
  v21 = v12;
  v13 = v6;
  v22 = v13;
  objc_copyWeak(&v24, (id *)buf);
  v14 = v7;
  v23 = v14;
  objc_msgSend(v10, "asynchronousRemoteDaemonWithErrorHandler:", v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __61__SKStatusPublishingService_removeInvitedHandles_completion___block_invoke_17;
  v17[3] = &unk_24CF73710;
  objc_copyWeak(&v19, (id *)buf);
  v16 = v14;
  v18 = v16;
  objc_msgSend(v15, "removeInvitedHandles:statusTypeIdentifier:completion:", v13, v12, v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v24);

  objc_destroyWeak((id *)buf);
}

void __61__SKStatusPublishingService_removeInvitedHandles_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__SKStatusPublishingService_removeInvitedHandles_completion___block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __61__SKStatusPublishingService_removeInvitedHandles_completion___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *WeakRetained;
  uint8_t v6[16];

  v3 = a2;
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  WeakRetained = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __61__SKStatusPublishingService_removeInvitedHandles_completion___block_invoke_17_cold_1();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[NSObject _simulateCrashIfNecessaryForError:](WeakRetained, "_simulateCrashIfNecessaryForError:", v3);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_213251000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Remove invited handles completed.", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeAllInvitedHandlesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SKStatusPublishingService _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");
  -[SKStatusPublishingService statusTypeIdentifier](self, "statusTypeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v5;
    _os_log_impl(&dword_213251000, v6, OS_LOG_TYPE_DEFAULT, "Removing all invited handles. StatusType: %{public}@", buf, 0xCu);
  }

  -[SKStatusPublishingService daemonConnection](self, "daemonConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v8 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __67__SKStatusPublishingService_removeAllInvitedHandlesWithCompletion___block_invoke;
  v16[3] = &unk_24CF735A8;
  v9 = v5;
  v17 = v9;
  objc_copyWeak(&v19, (id *)buf);
  v10 = v4;
  v18 = v10;
  objc_msgSend(v7, "asynchronousRemoteDaemonWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __67__SKStatusPublishingService_removeAllInvitedHandlesWithCompletion___block_invoke_18;
  v13[3] = &unk_24CF73710;
  objc_copyWeak(&v15, (id *)buf);
  v12 = v10;
  v14 = v12;
  objc_msgSend(v11, "removeAllInvitedHandlesFromPersonalChannelWithStatusTypeIdentifier:completion:", v9, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v19);

  objc_destroyWeak((id *)buf);
}

void __67__SKStatusPublishingService_removeAllInvitedHandlesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __67__SKStatusPublishingService_removeAllInvitedHandlesWithCompletion___block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __67__SKStatusPublishingService_removeAllInvitedHandlesWithCompletion___block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *WeakRetained;
  uint8_t v6[16];

  v3 = a2;
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  WeakRetained = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __67__SKStatusPublishingService_removeAllInvitedHandlesWithCompletion___block_invoke_18_cold_1();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[NSObject _simulateCrashIfNecessaryForError:](WeakRetained, "_simulateCrashIfNecessaryForError:", v3);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_213251000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Remove all invited handles completed.", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6;
  NSMapTable *v7;
  SKDelegateResponseQueue *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self->_delegates;
  objc_sync_enter(v7);
  v8 = -[SKDelegateResponseQueue initWithQueue:]([SKDelegateResponseQueue alloc], "initWithQueue:", v6);
  -[NSMapTable setObject:forKey:](self->_delegates, "setObject:forKey:", v8, v9);

  objc_sync_exit(v7);
  -[SKStatusPublishingService _registerForDelegateCallbacksIfNecessary](self, "_registerForDelegateCallbacksIfNecessary");

}

- (void)removeDelegate:(id)a3
{
  NSMapTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_delegates;
  objc_sync_enter(v4);
  -[NSMapTable removeObjectForKey:](self->_delegates, "removeObjectForKey:", v5);
  objc_sync_exit(v4);

}

- (void)_registerForDelegateCallbacksIfNecessary
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSMapTable *obj;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  obj = self->_delegates;
  objc_sync_enter(obj);
  if (self->_registeredForDelegateCallbacks || !-[NSMapTable count](self->_delegates, "count"))
  {
    objc_sync_exit(obj);

  }
  else
  {
    self->_registeredForDelegateCallbacks = 1;
    objc_sync_exit(obj);

    -[SKStatusPublishingService statusTypeIdentifier](self, "statusTypeIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v3;
      _os_log_impl(&dword_213251000, v4, OS_LOG_TYPE_DEFAULT, "Registering for delegate callbacks for statusTypeIdentifier: %{public}@", buf, 0xCu);
    }

    -[SKStatusPublishingService daemonConnection](self, "daemonConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    v6 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __69__SKStatusPublishingService__registerForDelegateCallbacksIfNecessary__block_invoke;
    v13[3] = &unk_24CF73738;
    objc_copyWeak(&v14, (id *)buf);
    objc_msgSend(v5, "asynchronousRemoteDaemonWithErrorHandler:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __69__SKStatusPublishingService__registerForDelegateCallbacksIfNecessary__block_invoke_20;
    v10[3] = &unk_24CF73760;
    objc_copyWeak(&v12, (id *)buf);
    v8 = v3;
    v11 = v8;
    objc_msgSend(v7, "registerForDelegateCallbacksWithStatusTypeIdentifier:completion:", v8, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);

  }
}

void __69__SKStatusPublishingService__registerForDelegateCallbacksIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__SKStatusPublishingService__registerForDelegateCallbacksIfNecessary__block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_simulateCrashIfNecessaryForError:", v3);

}

void __69__SKStatusPublishingService__registerForDelegateCallbacksIfNecessary__block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *WeakRetained;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  WeakRetained = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __69__SKStatusPublishingService__registerForDelegateCallbacksIfNecessary__block_invoke_20_cold_1();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[NSObject _simulateCrashIfNecessaryForError:](WeakRetained, "_simulateCrashIfNecessaryForError:", v3);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_213251000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Completed registration for delegate callbacks for statusTypeIdentifier: %@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)_simulateCrashIfNecessaryForError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("SKStatusPublishingErrorDomain"));

  if (v6 && objc_msgSend(v4, "code") == -2000)
  {
    +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[SKStatusPublishingService _simulateCrashIfNecessaryForError:].cold.1(self, v7);

  }
}

- (void)_delegatesPerformOnResponseQueueForGroup:(id)a3 block:(id)a4
{
  NSObject *v6;
  id v7;
  NSMapTable *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id obj;
  _QWORD block[5];
  NSObject *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[16];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self->_delegates;
  objc_sync_enter(v8);
  v9 = (void *)-[NSMapTable copy](self->_delegates, "copy");
  objc_sync_exit(v8);

  if (!objc_msgSend(v9, "count"))
  {
    +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213251000, v10, OS_LOG_TYPE_DEFAULT, "No delegates available to perform publishing service delegate callback", buf, 2u);
    }

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v9, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dispatchQueue");
        v16 = objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v6);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __76__SKStatusPublishingService__delegatesPerformOnResponseQueueForGroup_block___block_invoke;
        block[3] = &unk_24CF73788;
        v20 = v7;
        block[4] = v14;
        v19 = v6;
        dispatch_async(v16, block);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v11);
  }

}

void __76__SKStatusPublishingService__delegatesPerformOnResponseQueueForGroup_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)publishingDaemonConnectionDidDisconnect:(id)a3
{
  NSMapTable *v4;
  dispatch_group_t v5;
  _QWORD v6[5];

  v4 = self->_delegates;
  objc_sync_enter(v4);
  self->_registeredForDelegateCallbacks = 0;
  objc_sync_exit(v4);

  v5 = dispatch_group_create();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__SKStatusPublishingService_publishingDaemonConnectionDidDisconnect___block_invoke;
  v6[3] = &unk_24CF737B0;
  v6[4] = self;
  -[SKStatusPublishingService _delegatesPerformOnResponseQueueForGroup:block:](self, "_delegatesPerformOnResponseQueueForGroup:block:", v5, v6);

}

void __69__SKStatusPublishingService_publishingDaemonConnectionDidDisconnect___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v3 = a2;
  v4 = objc_opt_respondsToSelector();
  +[SKStatusPublishingService logger](SKStatusPublishingService, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) != 0)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213251000, v5, OS_LOG_TYPE_DEFAULT, "Notifying publishing service delegate that the XPC connection has disconnected", buf, 2u);
    }

    objc_msgSend(v3, "publishingServiceDaemonDisconnected:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_213251000, v5, OS_LOG_TYPE_DEFAULT, "Subscription publishing delegate does not implement the delegate method to be notified the XPC connection has disconnected", v7, 2u);
    }

  }
}

+ (id)logger
{
  if (logger_onceToken_2 != -1)
    dispatch_once(&logger_onceToken_2, &__block_literal_global_2);
  return (id)logger__logger_2;
}

void __35__SKStatusPublishingService_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "PublishingService");
  v1 = (void *)logger__logger_2;
  logger__logger_2 = (uint64_t)v0;

}

- (SKStatusPublishingDaemonConnection)daemonConnection
{
  SKStatusPublishingService *v2;
  SKStatusPublishingDaemonConnection *daemonConnection;
  SKStatusPublishingDaemonConnection *v4;
  SKStatusPublishingDaemonConnection *v5;
  SKStatusPublishingDaemonConnection *v6;

  v2 = self;
  objc_sync_enter(v2);
  daemonConnection = v2->_daemonConnection;
  if (!daemonConnection)
  {
    v4 = -[SKStatusPublishingDaemonConnection initWithPublishingDaemonDelegate:connectionDelegate:]([SKStatusPublishingDaemonConnection alloc], "initWithPublishingDaemonDelegate:connectionDelegate:", v2, v2);
    v5 = v2->_daemonConnection;
    v2->_daemonConnection = v4;

    daemonConnection = v2->_daemonConnection;
  }
  v6 = daemonConnection;
  objc_sync_exit(v2);

  return v6;
}

- (void)setDaemonConnection:(id)a3
{
  objc_storeStrong((id *)&self->_daemonConnection, a3);
}

- (NSString)statusTypeIdentifier
{
  return self->_statusTypeIdentifier;
}

- (NSMapTable)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_delegates, a3);
}

- (BOOL)registeredForDelegateCallbacks
{
  return self->_registeredForDelegateCallbacks;
}

- (void)setRegisteredForDelegateCallbacks:(BOOL)a3
{
  self->_registeredForDelegateCallbacks = a3;
}

- (OS_dispatch_queue)privateWorkQueue
{
  return self->_privateWorkQueue;
}

- (void)setPrivateWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateWorkQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateWorkQueue, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_statusTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

void __61__SKStatusPublishingService_publishStatusRequest_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_213251000, v0, v1, "XPC Error publishing status request. StatusType: %{public}@ statusRequest:%@ Error: %{public}@");
  OUTLINED_FUNCTION_6();
}

void __61__SKStatusPublishingService_publishStatusRequest_completion___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "Publish status request failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __58__SKStatusPublishingService_provisionPayloads_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_213251000, v0, v1, "XPC Error Provisioning request. StatusType: %{public}@ Error: %{public}@");
  OUTLINED_FUNCTION_5();
}

void __58__SKStatusPublishingService_provisionPayloads_completion___block_invoke_6_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "Provisioning request failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __43__SKStatusPublishingService_invitedHandles__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_213251000, v0, v1, "XPC Error retrieving invited handles. StatusType: %{public}@ Error: %{public}@");
  OUTLINED_FUNCTION_5();
}

void __63__SKStatusPublishingService__isHandleInvited_fromSenderHandle___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_213251000, v0, v1, "XPC Error checking if handle is invited (sync). StatusType: %{public}@ Error: %{public}@");
  OUTLINED_FUNCTION_5();
}

void __74__SKStatusPublishingService__isHandleInvited_fromSenderHandle_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_213251000, v0, v1, "XPC Error checking if handle is invited (async). StatusType: %{public}@ handle:%@ Error: %{public}@");
  OUTLINED_FUNCTION_6();
}

void __82__SKStatusPublishingService__fetchHandleInvitability_fromSenderHandle_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_213251000, v0, v1, "XPC Error checking invitability. StatusType: %{public}@ handle:%@ Error: %{public}@");
  OUTLINED_FUNCTION_6();
}

void __76__SKStatusPublishingService__isHandleInvitable_fromSenderHandle_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_213251000, v0, v1, "XPC Error checking inviteability. StatusType: %{public}@ handle:%@ Error: %{public}@");
  OUTLINED_FUNCTION_6();
}

void __94__SKStatusPublishingService__inviteHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_213251000, v0, v1, "XPC Error inviting handles. StatusType: %{public}@ handles:%@ Error: %{public}@");
  OUTLINED_FUNCTION_6();
}

void __94__SKStatusPublishingService__inviteHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_16_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "Inviting handles completed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __61__SKStatusPublishingService_removeInvitedHandles_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_213251000, v0, v1, "XPC Error removing invited handles. StatusType: %{public}@ handles:%@ Error: %{public}@");
  OUTLINED_FUNCTION_6();
}

void __61__SKStatusPublishingService_removeInvitedHandles_completion___block_invoke_17_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "Remove invited handles completed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __67__SKStatusPublishingService_removeAllInvitedHandlesWithCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_213251000, v0, v1, "XPC Error removing all invited handles. StatusType: %{public}@ Error: %{public}@");
  OUTLINED_FUNCTION_5();
}

void __67__SKStatusPublishingService_removeAllInvitedHandlesWithCompletion___block_invoke_18_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "Remove all invited handles completed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __69__SKStatusPublishingService__registerForDelegateCallbacksIfNecessary__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "XPC Error registering for delegate callbacks. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __69__SKStatusPublishingService__registerForDelegateCallbacksIfNecessary__block_invoke_20_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "Error registering for delegate callbacks. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_simulateCrashIfNecessaryForError:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[12];
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "statusTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  v5 = 2112;
  v6 = CFSTR("com.apple.StatusKit.publish.types");
  _os_log_fault_impl(&dword_213251000, a2, OS_LOG_TYPE_FAULT, "Client is attempting to publish status of type %{public}@ but is not entitled. Client needs %@ entitlement with this status type identifier.", v4, 0x16u);

  OUTLINED_FUNCTION_6();
}

@end
