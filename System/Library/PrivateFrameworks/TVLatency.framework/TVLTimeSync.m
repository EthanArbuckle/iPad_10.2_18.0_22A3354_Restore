@implementation TVLTimeSync

+ (void)timeSyncWithRemoteIPv4:(id)a3 IPv6:(id)a4 interface:(id)a5 session:(id)a6 master:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  void (**v17)(_QWORD);
  id v18;
  TVLTimeSync *v19;
  void *v20;
  id v21;

  v9 = a7;
  v21 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (void (**)(_QWORD))a8;
  v18 = a1;
  objc_sync_enter(v18);
  if (_timeSync)
  {
    v17[2](v17);
  }
  else
  {
    v19 = -[TVLTimeSync initWithRemoteIPv4:IPv6:interface:]([TVLTimeSync alloc], "initWithRemoteIPv4:IPv6:interface:", v21, v14, v15);
    v20 = (void *)_timeSync;
    _timeSync = (uint64_t)v19;

    objc_msgSend((id)_timeSync, "setMaster:", v9);
    objc_msgSend((id)_timeSync, "_startPTPWithSession:completionHandler:", v16, v17);
  }
  objc_sync_exit(v18);

}

- (void)_startPTPWithSession:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  CUMessageSession *session;
  uint64_t v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_session, a3);
  objc_initWeak(&location, self);
  session = self->_session;
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke;
  v15[3] = &unk_24E3E94F0;
  objc_copyWeak(&v16, &location);
  -[CUMessageSession registerRequestID:options:handler:](session, "registerRequestID:options:handler:", CFSTR("com.apple.tvlatency.timesync"), 0, v15);
  dispatch_get_global_queue(25, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_13;
  v13[3] = &unk_24E3E9540;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  dispatch_async(v11, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, int, void *, void *);
  void *v24;
  id v25;
  id v26;
  _QWORD v27[2];
  _QWORD v28[2];
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (_TVLLogDefault_onceToken != -1)
      dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
    v9 = _TVLLogDefault_log;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v6;
      _os_log_impl(&dword_21F2AB000, v9, OS_LOG_TYPE_DEFAULT, "Incoming Grandmaster Sync Request: %{public}@", buf, 0xCu);
    }
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_1;
    v24 = &unk_24E3E94C8;
    v10 = v6;
    v25 = v10;
    v26 = v7;
    v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x2207C5BC0](&v21);
    objc_msgSend(v10, "objectForKey:", CFSTR("MESSAGE"), v21, v22, v23, v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("GM"));

    if (v13)
    {
      v27[0] = CFSTR("GM");
      v14 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(WeakRetained, "clock");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "numberWithUnsignedLongLong:", objc_msgSend(v15, "grandmasterIdentity"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = CFSTR("LOCKED");
      v28[0] = v16;
      v17 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(WeakRetained, "clock");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "numberWithInt:", objc_msgSend(v18, "lockState") == 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, _QWORD, void *))v11)[2](v11, 0, 0, v20);

    }
  }

}

void __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_1(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (_TVLLogDefault_onceToken != -1)
    dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
  v9 = (id)_TVLLogDefault_log;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (a2)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], a2, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    v12 = 138543874;
    v13 = v10;
    v14 = 2114;
    v15 = v8;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_21F2AB000, v9, OS_LOG_TYPE_DEFAULT, "Responding To Grandmaster Sync Request: %{public}@ | Response: %{public}@ | Error: %{public}@", (uint8_t *)&v12, 0x20u);
    if (a2)

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_13(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = (void *)MEMORY[0x24BEB70C0];
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_2;
  v3[3] = &unk_24E3E9568;
  objc_copyWeak(&v5, &location);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "notifyWhenClockManagerIsAvailable:", v3);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x24BEB70C0], "sharedClockManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v3 = objc_msgSend(v2, "addgPTPServicesWithError:", &v9);
  v4 = v9;

  if (v3)
  {
    v5 = (void *)MEMORY[0x24BEB70D0];
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_3;
    v6[3] = &unk_24E3E9568;
    objc_copyWeak(&v8, (id *)(a1 + 40));
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "notifyWhengPTPManagerIsAvailable:", v6);

    objc_destroyWeak(&v8);
  }

}

void __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  id v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
  dispatch_semaphore_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  __int16 v31;
  _QWORD block[5];
  NSObject *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  id v40;
  uint64_t v41;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v41 = *MEMORY[0x24BEB70E0];
  objc_msgSend(MEMORY[0x24BEB70D0], "sharedgPTPManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  v4 = objc_msgSend(v3, "addDomain:error:", &v41, &v40);
  v5 = v40;

  if (v4)
  {
    v6 = dispatch_semaphore_create(0);
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    dispatch_get_global_queue(25, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_4;
    block[3] = &unk_24E3E9518;
    block[4] = WeakRetained;
    v34 = &v36;
    v35 = v41;
    v8 = v6;
    v33 = v8;
    dispatch_async(v7, block);

    v9 = dispatch_time(0, 1000000000);
    dispatch_semaphore_wait(v8, v9);
    *((_BYTE *)v37 + 24) = 1;
    v31 = -1;
    if (objc_msgSend(WeakRetained, "IPv4"))
    {
      objc_msgSend(WeakRetained, "clock");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "networkInterfaceName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      v12 = objc_msgSend(v10, "addUnicastUDPv4EtEPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:", v11, objc_msgSend(WeakRetained, "IPv4"), &v31, &v30);
      v13 = v30;

      if ((v12 & 1) == 0)
        goto LABEL_9;
    }
    else
    {
      objc_msgSend(WeakRetained, "IPv6");
      v13 = (id)objc_claimAutoreleasedReturnValue();

      if (!v13)
        goto LABEL_9;
      objc_msgSend(WeakRetained, "clock");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "networkInterfaceName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "IPv6");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v29 = 0;
      v17 = objc_msgSend(v14, "addUnicastUDPv6EtEPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:", v15, objc_msgSend(v16, "bytes"), &v31, &v29);
      v13 = v29;

      if (!v17)
        goto LABEL_9;
    }
    objc_msgSend(WeakRetained, "clock");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = dispatch_semaphore_create(0);
      objc_msgSend(WeakRetained, "setWaitForPTPLock:", v19);

      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_17;
      v27[3] = &unk_24E3E9540;
      v27[4] = WeakRetained;
      v28 = *(id *)(a1 + 32);
      dispatch_async(v7, v27);

LABEL_14:
      _Block_object_dispose(&v36, 8);

      goto LABEL_15;
    }
LABEL_9:
    if (_TVLLogDefault_onceToken != -1)
      dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
    v20 = _TVLLogDefault_log;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_ERROR))
      __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_3_cold_1((uint64_t)v13, v20, v21, v22, v23, v24, v25, v26);
    +[TVLTimeSync invalidate](TVLTimeSync, "invalidate");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_14;
  }
LABEL_15:

}

intptr_t __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "clock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
LABEL_2:

  }
  else
  {
    *(_QWORD *)&v3 = 138543618;
    v16 = v3;
    while (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      usleep(0x64u);
      objc_msgSend(MEMORY[0x24BEB70C0], "sharedClockManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clockWithClockIdentifier:", *(_QWORD *)(a1 + 56));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setClock:", v6);

      if (_TVLLogDefault_onceToken != -1)
        dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
      v7 = (void *)_TVLLogDefault_log;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_INFO))
      {
        v8 = *(void **)(a1 + 32);
        v9 = v7;
        objc_msgSend(v8, "clock");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "clockName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "clock");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "grandmasterIdentity");
        *(_DWORD *)buf = v16;
        v18 = v11;
        v19 = 2048;
        v20 = v13;
        _os_log_impl(&dword_21F2AB000, v9, OS_LOG_TYPE_INFO, "Initialized PTP clock %{public}@ with grandmasterIdentity %llu", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "clock", v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(*(id *)(a1 + 32), "clock");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addClient:", *(_QWORD *)(a1 + 32));

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      }
      objc_msgSend(*(id *)(a1 + 32), "clock");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2)
        goto LABEL_2;
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_17(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(void);
  NSObject *v19;
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "waitForPTPLock");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_time(0, 3000000000);
  dispatch_semaphore_wait(v2, v3);

  objc_msgSend(*(id *)(a1 + 32), "clock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "lockState");

  if (v5 == 1)
  {
    if (_TVLLogDefault_onceToken != -1)
      dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
    v6 = _TVLLogDefault_log;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2AB000, v6, OS_LOG_TYPE_DEFAULT, "PTP clock is locking. Waiting for lock...", buf, 2u);
    }
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "clock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "lockState");

  if (v8 != 2)
  {
    if (_TVLLogDefault_onceToken != -1)
      dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
    v10 = _TVLLogDefault_log;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_ERROR))
      __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_17_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    objc_msgSend(*(id *)(a1 + 32), "_clearWaitForPTPClock");
    +[TVLTimeSync invalidate](TVLTimeSync, "invalidate");
    v18 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_23;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "isMaster"))
  {
    if (_TVLLogDefault_onceToken != -1)
      dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
    v19 = _TVLLogDefault_log;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_21F2AB000, v19, OS_LOG_TYPE_DEFAULT, "PTP clock is locked. Negotiating grandmaster with master remote...", v20, 2u);
    }
    v18 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_23:
    v18();
    return;
  }
  if (_TVLLogDefault_onceToken != -1)
    dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
  v9 = _TVLLogDefault_log;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_21F2AB000, v9, OS_LOG_TYPE_DEFAULT, "PTP clock is locked. Negotiating grandmaster with non-master remote...", v21, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "negotiateGrandmasterIdentityAttempt:withCompletion:", 1, *(_QWORD *)(a1 + 40));
}

+ (void)invalidate
{
  void *v2;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  objc_msgSend((id)_timeSync, "invalidate");
  v2 = (void *)_timeSync;
  _timeSync = 0;

  objc_sync_exit(obj);
}

- (TVLTimeSync)initWithRemoteIPv4:(id)a3 IPv6:(id)a4 interface:(id)a5
{
  id v8;
  id v9;
  id v10;
  TVLTimeSync *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  void *v18;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)TVLTimeSync;
  v11 = -[TVLTimeSync init](&v20, sel_init);
  if (v11)
  {
    if (v8)
      v12 = _IPv4ToHostByteOrder(v8);
    else
      v12 = 0;
    -[TVLTimeSync setIPv4:](v11, "setIPv4:", v12);
    if (v9)
    {
      _IPv6ToHostByteOrder(v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVLTimeSync setIPv6:](v11, "setIPv6:", v13);

    }
    else
    {
      -[TVLTimeSync setIPv6:](v11, "setIPv6:", 0);
    }
    -[TVLTimeSync setNetworkInterfaceName:](v11, "setNetworkInterfaceName:", v10);
    if (_TVLLogDefault_onceToken != -1)
      dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
    v14 = (void *)_TVLLogDefault_log;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      -[TVLTimeSync IPv6](v11, "IPv6");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        if (-[TVLTimeSync IPv4](v11, "IPv4"))
          v17 = "4/6";
        else
          v17 = "6";
      }
      else
      {
        v17 = "4";
      }
      -[TVLTimeSync networkInterfaceName](v11, "networkInterfaceName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v22 = v17;
      v23 = 2114;
      v24 = v18;
      _os_log_impl(&dword_21F2AB000, v15, OS_LOG_TYPE_DEFAULT, "Initializing PTP (IPv%s) Clock using network interface: %{public}@", buf, 0x16u);

    }
  }

  return v11;
}

- (void)invalidate
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[TVLTimeSync clock](self, "clock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TVLTimeSync clock](self, "clock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "clockIdentifier");

    -[TVLTimeSync clock](self, "clock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVLTimeSync networkInterfaceName](self, "networkInterfaceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVLTimeSync IPv6](self, "IPv6");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "removeUnicastUDPv6EtEPortFromInterfaceNamed:withDestinationAddress:error:", v7, objc_msgSend(v8, "bytes"), 0);

    -[TVLTimeSync clock](self, "clock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVLTimeSync networkInterfaceName](self, "networkInterfaceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeUnicastUDPv4EtEPortFromInterfaceNamed:withDestinationAddress:error:", v10, -[TVLTimeSync IPv4](self, "IPv4"), 0);

    -[TVLTimeSync clock](self, "clock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeClient:", self);

    -[TVLTimeSync setClock:](self, "setClock:", 0);
    objc_msgSend(MEMORY[0x24BEB70D0], "sharedgPTPManager");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeDomainWithIdentifier:error:", v5, 0);

  }
}

- (void)negotiateGrandmasterIdentityAttempt:(int64_t)a3 withCompletion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  CUMessageSession *session;
  id v18;
  _QWORD v19[4];
  id v20;
  TVLTimeSync *v21;
  id v22;
  id v23[2];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  int64_t v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (a3 < 21)
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    -[TVLTimeSync clock](self, "clock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberWithUnsignedLongLong:", objc_msgSend(v9, "grandmasterIdentity"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v30[0] = CFSTR("MESSAGE");
    v30[1] = CFSTR("OPTIONS");
    v31[0] = CFSTR("GM");
    v28[0] = CFSTR("GM");
    v28[1] = CFSTR("LOCKED");
    v29[0] = v10;
    v11 = (void *)MEMORY[0x24BDD16E0];
    -[TVLTimeSync clock](self, "clock");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "lockState") == 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (_TVLLogDefault_onceToken != -1)
      dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
    v16 = _TVLLogDefault_log;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v25 = v15;
      v26 = 2048;
      v27 = a3;
      _os_log_impl(&dword_21F2AB000, v16, OS_LOG_TYPE_DEFAULT, "Outgoing Grandmaster Sync Request: %{public}@ | Attempt: %li", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    session = self->_session;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __66__TVLTimeSync_negotiateGrandmasterIdentityAttempt_withCompletion___block_invoke;
    v19[3] = &unk_24E3E95B8;
    objc_copyWeak(v23, (id *)buf);
    v18 = v15;
    v20 = v18;
    v21 = self;
    v22 = v6;
    v23[1] = (id)a3;
    -[CUMessageSession sendRequestID:options:request:responseHandler:](session, "sendRequestID:options:request:responseHandler:", CFSTR("com.apple.tvlatency.timesync"), 0, v18, v19);

    objc_destroyWeak(v23);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    if (_TVLLogDefault_onceToken != -1)
      dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
    v7 = _TVLLogDefault_log;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_ERROR))
      -[TVLTimeSync negotiateGrandmasterIdentityAttempt:withCompletion:].cold.1(v7);
    +[TVLTimeSync invalidate](TVLTimeSync, "invalidate");
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

void __66__TVLTimeSync_negotiateGrandmasterIdentityAttempt_withCompletion___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  dispatch_time_t v25;
  NSObject *v26;
  _QWORD block[4];
  id v28;
  id v29[2];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  _BYTE v33[10];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (_TVLLogDefault_onceToken != -1)
      dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
    v8 = (id)_TVLLogDefault_log;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      if (a2)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], a2, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      *(_DWORD *)buf = 138543874;
      v31 = v9;
      v32 = 2114;
      *(_QWORD *)v33 = v6;
      *(_WORD *)&v33[8] = 2114;
      v34[0] = v10;
      _os_log_impl(&dword_21F2AB000, v8, OS_LOG_TYPE_DEFAULT, "Response To Grandmaster Sync Request: %{public}@ | Response: %{public}@ | Error: %{public}@", buf, 0x20u);
      if (a2)

    }
    objc_msgSend(v6, "objectForKey:", CFSTR("GM"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedLongLongValue");

    objc_msgSend(v6, "objectForKey:", CFSTR("LOCKED"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(WeakRetained, "clock");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "grandmasterIdentity");

    if (v12 == v16)
    {
      if (_TVLLogDefault_onceToken != -1)
        dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
      v17 = (void *)_TVLLogDefault_log;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v17;
        objc_msgSend(WeakRetained, "clock");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "lockState");
        *(_DWORD *)buf = 134218496;
        v31 = v12;
        v32 = 1024;
        *(_DWORD *)v33 = v14;
        *(_WORD *)&v33[4] = 1024;
        *(_DWORD *)&v33[6] = v20 == 2;
        _os_log_impl(&dword_21F2AB000, v18, OS_LOG_TYPE_DEFAULT, "Grandmaster Sync match=%llu, remoteLocked=%d, localLocked=%d", buf, 0x18u);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      if (_TVLLogDefault_onceToken != -1)
        dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
      v21 = (void *)_TVLLogDefault_log;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_DEFAULT))
      {
        v22 = v21;
        objc_msgSend(WeakRetained, "clock");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "lockState");
        *(_DWORD *)buf = 134218752;
        v31 = v12;
        v32 = 2048;
        *(_QWORD *)v33 = v16;
        *(_WORD *)&v33[8] = 1024;
        LODWORD(v34[0]) = v14;
        WORD2(v34[0]) = 1024;
        *(_DWORD *)((char *)v34 + 6) = v24 == 2;
        _os_log_impl(&dword_21F2AB000, v22, OS_LOG_TYPE_DEFAULT, "Grandmaster Sync mismatch: remote=%llu, local=%llu, remoteLocked=%d, localLocked=%d", buf, 0x22u);

      }
      objc_initWeak((id *)buf, *(id *)(a1 + 40));
      v25 = dispatch_time(0, 1000000000);
      dispatch_get_global_queue(33, 0);
      v26 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __66__TVLTimeSync_negotiateGrandmasterIdentityAttempt_withCompletion___block_invoke_23;
      block[3] = &unk_24E3E9590;
      objc_copyWeak(v29, (id *)buf);
      v29[1] = *(id *)(a1 + 64);
      v28 = *(id *)(a1 + 48);
      dispatch_after(v25, v26, block);

      objc_destroyWeak(v29);
      objc_destroyWeak((id *)buf);
    }
  }

}

void __66__TVLTimeSync_negotiateGrandmasterIdentityAttempt_withCompletion___block_invoke_23(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "negotiateGrandmasterIdentityAttempt:withCompletion:", *(_QWORD *)(a1 + 48) + 1, *(_QWORD *)(a1 + 32));

}

- (unint64_t)convertToHostTimeFromDomainTime:(unint64_t)a3 grandmasterIdentity:(unint64_t *)a4
{
  void *v6;
  unint64_t v7;
  NSObject *v8;
  unint64_t v9;
  __int16 v11;
  uint8_t buf[4];
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  -[TVLTimeSync clock](self, "clock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:", a3, a4, &v11);

  if (_TVLLogDefault_onceToken != -1)
    dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
  v8 = _TVLLogDefault_log;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *a4;
    *(_DWORD *)buf = 134217984;
    v13 = v9;
    _os_log_impl(&dword_21F2AB000, v8, OS_LOG_TYPE_DEFAULT, "Converted Domain Time -> Host Time using GM: %llu", buf, 0xCu);
  }
  return v7;
}

- (unint64_t)convertToDomainTimeFromHostTime:(unint64_t)a3 grandmasterIdentity:(unint64_t *)a4
{
  void *v6;
  unint64_t v7;
  NSObject *v8;
  unint64_t v9;
  __int16 v11;
  uint8_t buf[4];
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  -[TVLTimeSync clock](self, "clock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "convertFromMachAbsoluteToDomainTime:grandmasterUsed:portNumber:", a3, a4, &v11);

  if (_TVLLogDefault_onceToken != -1)
    dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
  v8 = _TVLLogDefault_log;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *a4;
    *(_DWORD *)buf = 134217984;
    v13 = v9;
    _os_log_impl(&dword_21F2AB000, v8, OS_LOG_TYPE_DEFAULT, "Converted Host Time -> Domain Time using GM: %llu", buf, 0xCu);
  }
  return v7;
}

- (void)_clearWaitForPTPClock
{
  void *v2;
  NSObject *v3;
  TVLTimeSync *obj;

  obj = self;
  objc_sync_enter(obj);
  -[TVLTimeSync waitForPTPLock](obj, "waitForPTPLock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    -[TVLTimeSync waitForPTPLock](obj, "waitForPTPLock");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v3);

    -[TVLTimeSync setWaitForPTPLock:](obj, "setWaitForPTPLock:", 0);
  }
  objc_sync_exit(obj);

}

- (void)didChangeLockStateTo:(int)a3 forClock:(id)a4
{
  id v6;
  NSObject *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (_TVLLogDefault_onceToken != -1)
    dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
  v7 = _TVLLogDefault_log;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = a3;
    _os_log_impl(&dword_21F2AB000, v7, OS_LOG_TYPE_DEFAULT, "PTP clock lock state is now %i", (uint8_t *)v8, 8u);
  }
  if (a3)
  {
    if (a3 == 2)
      -[TVLTimeSync _clearWaitForPTPClock](self, "_clearWaitForPTPClock");
  }
  else
  {
    +[TVLTimeSync invalidate](TVLTimeSync, "invalidate");
  }

}

- (void)didChangeClockMasterForClock:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (_TVLLogDefault_onceToken != -1)
    dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
  v4 = (void *)_TVLLogDefault_log;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    objc_msgSend(v3, "clockName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_21F2AB000, v5, OS_LOG_TYPE_DEFAULT, "Changed Clock Master for Clock %{public}@\n", (uint8_t *)&v7, 0xCu);

  }
}

- (unsigned)IPv4
{
  return self->_IPv4;
}

- (void)setIPv4:(unsigned int)a3
{
  self->_IPv4 = a3;
}

- (NSData)IPv6
{
  return self->_IPv6;
}

- (void)setIPv6:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (TSgPTPClock)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
  objc_storeStrong((id *)&self->_clock, a3);
}

- (NSString)networkInterfaceName
{
  return self->_networkInterfaceName;
}

- (void)setNetworkInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (OS_dispatch_semaphore)waitForPTPLock
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 40, 1);
}

- (void)setWaitForPTPLock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (CUMessageSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (BOOL)isMaster
{
  return self->_master;
}

- (void)setMaster:(BOOL)a3
{
  self->_master = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_waitForPTPLock, 0);
  objc_storeStrong((id *)&self->_networkInterfaceName, 0);
  objc_storeStrong((id *)&self->_clock, 0);
  objc_storeStrong((id *)&self->_IPv6, 0);
}

void __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21F2AB000, a2, a3, "There was an error creating a PTP clock at this time: %{public}@", a5, a6, a7, a8, 2u);
}

void __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_17_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21F2AB000, a1, a3, "Waiting for PTP clock lock has timed out (took over %fs).", a5, a6, a7, a8, 0);
}

- (void)negotiateGrandmasterIdentityAttempt:(os_log_t)log withCompletion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F2AB000, log, OS_LOG_TYPE_ERROR, "Failed to negotiate grandmaster with remote", v1, 2u);
}

@end
