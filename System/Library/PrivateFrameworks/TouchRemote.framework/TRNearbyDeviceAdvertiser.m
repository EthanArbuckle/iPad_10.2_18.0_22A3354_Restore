@implementation TRNearbyDeviceAdvertiser

+ (void)initialize
{
  _TRLogEnabled = 1;
  _TRLogVerboseEnabled = 1;
}

- (TRNearbyDeviceAdvertiser)init
{
  TRNearbyDeviceAdvertiser *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *advertiserQ;
  uint64_t v5;
  NSMapTable *sessionsTable;
  dispatch_queue_t v7;
  OS_dispatch_queue *sessionsTableQ;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TRNearbyDeviceAdvertiser;
  v2 = -[TRNearbyDeviceAdvertiser init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.TRNearbyDeviceAdvertiser.advertiserQ", 0);
    advertiserQ = v2->_advertiserQ;
    v2->_advertiserQ = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    sessionsTable = v2->_sessionsTable;
    v2->_sessionsTable = (NSMapTable *)v5;

    v7 = dispatch_queue_create("com.apple.TRNearbyDeviceAdvertiser.sessionsTableQ", MEMORY[0x24BDAC9C0]);
    sessionsTableQ = v2->_sessionsTableQ;
    v2->_sessionsTableQ = (OS_dispatch_queue *)v7;

    v2->_state = 1;
  }
  return v2;
}

- (void)startAdvertisingWithService:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  NSObject *advertiserQ;
  id v8;
  _QWORD v9[6];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[TRNearbyDeviceAdvertiser delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("TRNearbyDeviceAdvertiser requires a delegate."), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[TRNearbyDeviceAdvertiser startAdvertisingWithService:]";
      v12 = 2048;
      v13 = a3;
      _os_log_impl(&dword_20A2BF000, v6, OS_LOG_TYPE_DEFAULT, "%s Start advertising with service: %lu.", buf, 0x16u);
    }

  }
  advertiserQ = self->_advertiserQ;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__TRNearbyDeviceAdvertiser_startAdvertisingWithService___block_invoke;
  v9[3] = &unk_24C2E4E90;
  v9[4] = self;
  v9[5] = a3;
  dispatch_async(advertiserQ, v9);
}

void __56__TRNearbyDeviceAdvertiser_startAdvertisingWithService___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id v3;
  uint64_t v4;
  void *v5;
  dispatch_queue_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  char v16;
  uint64_t v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[2];
  _QWORD v24[2];
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[2] == 1)
  {
    v2[2] = 2;
    objc_msgSend(*(id *)(a1 + 32), "setRequestedService:", *(_QWORD *)(a1 + 40));
    v3 = objc_alloc_init(MEMORY[0x24BE901A8]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v6 = dispatch_queue_create("com.apple.TRNearbyDeviceAdvertiser.serviceQ", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDispatchQueue:", v6);

    if (*(_QWORD *)(a1 + 40) == 1)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setNeedsSetup:", 1);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setIdentifier:", *MEMORY[0x24BE90390]);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDeviceActionType:", 1);
    }
    v7 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __56__TRNearbyDeviceAdvertiser_startAdvertisingWithService___block_invoke_14;
    v22[3] = &unk_24C2E5508;
    v22[4] = *(_QWORD *)(a1 + 32);
    v8 = (void *)MEMORY[0x20BD22DF8](v22);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setEventMessageHandler:", v8);
    v21[0] = v7;
    v21[1] = 3221225472;
    v21[2] = __56__TRNearbyDeviceAdvertiser_startAdvertisingWithService___block_invoke_2;
    v21[3] = &unk_24C2E5530;
    v21[4] = *(_QWORD *)(a1 + 32);
    v9 = (void *)MEMORY[0x20BD22DF8](v21);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setRequestMessageHandler:", v9);
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __56__TRNearbyDeviceAdvertiser_startAdvertisingWithService___block_invoke_3;
    v20[3] = &unk_24C2E4F08;
    v20[4] = *(_QWORD *)(a1 + 32);
    v10 = (void *)MEMORY[0x20BD22DF8](v20);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setInvalidationHandler:", v10);
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __56__TRNearbyDeviceAdvertiser_startAdvertisingWithService___block_invoke_4;
    v19[3] = &unk_24C2E4F08;
    v19[4] = *(_QWORD *)(a1 + 32);
    v11 = (void *)MEMORY[0x20BD22DF8](v19);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setInterruptionHandler:", v11);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 24);
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __56__TRNearbyDeviceAdvertiser_startAdvertisingWithService___block_invoke_5;
    v18[3] = &unk_24C2E5558;
    v18[4] = v12;
    objc_msgSend(v13, "activateWithCompletion:", v18);

    goto LABEL_11;
  }
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[TRNearbyDeviceAdvertiser startAdvertisingWithService:]_block_invoke";
      _os_log_impl(&dword_20A2BF000, v14, OS_LOG_TYPE_DEFAULT, "%s Failed to start advertising. Advertiser is not stopped.", buf, 0xCu);
    }

    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v2, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    v17 = *MEMORY[0x24BDD0FD8];
    v23[0] = *MEMORY[0x24BDD0FC8];
    v23[1] = v17;
    v24[0] = CFSTR("Failed to start advertising.");
    v24[1] = CFSTR("Advertiser is not stopped.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9300, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nearbyDeviceAdvertiser:didFailToStartAdvertisingWithError:", *(_QWORD *)(a1 + 32), v9);
LABEL_11:

  }
}

uint64_t __56__TRNearbyDeviceAdvertiser_startAdvertisingWithService___block_invoke_14(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleEventMessage:", a2);
}

uint64_t __56__TRNearbyDeviceAdvertiser_startAdvertisingWithService___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRequestMessage:", a2);
}

uint64_t __56__TRNearbyDeviceAdvertiser_startAdvertisingWithService___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleInvalidation");
}

uint64_t __56__TRNearbyDeviceAdvertiser_startAdvertisingWithService___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleInterruption");
}

uint64_t __56__TRNearbyDeviceAdvertiser_startAdvertisingWithService___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleActivationWithError:", a2);
}

- (void)pauseAdvertising
{
  NSObject *advertiserQ;
  _QWORD block[5];

  advertiserQ = self->_advertiserQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__TRNearbyDeviceAdvertiser_pauseAdvertising__block_invoke;
  block[3] = &unk_24C2E4F08;
  block[4] = self;
  dispatch_async(advertiserQ, block);
}

void __44__TRNearbyDeviceAdvertiser_pauseAdvertising__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[2];
  if (v3 == 5)
  {
    if (_TRLogEnabled != 1)
      return;
    TRLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v7 = 136315138;
    v8 = "-[TRNearbyDeviceAdvertiser pauseAdvertising]_block_invoke";
    v6 = "%s Advertiser already paused.";
LABEL_16:
    _os_log_impl(&dword_20A2BF000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v7, 0xCu);
LABEL_17:

    return;
  }
  if (v3 != 3)
  {
    if (_TRLogEnabled != 1)
      return;
    TRLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v7 = 136315138;
    v8 = "-[TRNearbyDeviceAdvertiser pauseAdvertising]_block_invoke";
    v6 = "%s Failed to pause advertising. Advertiser is not started.";
    goto LABEL_16;
  }
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "-[TRNearbyDeviceAdvertiser pauseAdvertising]_block_invoke";
      _os_log_impl(&dword_20A2BF000, v4, OS_LOG_TYPE_DEFAULT, "%s Pausing advertiser.", (uint8_t *)&v7, 0xCu);
    }

    v2 = *(_QWORD **)(a1 + 32);
  }
  if (objc_msgSend(v2, "requestedService") == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDeviceActionType:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setNeedsSetup:", 0);
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 5;
}

- (void)resumeAdvertising
{
  NSObject *advertiserQ;
  _QWORD block[5];

  advertiserQ = self->_advertiserQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__TRNearbyDeviceAdvertiser_resumeAdvertising__block_invoke;
  block[3] = &unk_24C2E4F08;
  block[4] = self;
  dispatch_async(advertiserQ, block);
}

void __45__TRNearbyDeviceAdvertiser_resumeAdvertising__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[2];
  if (v3 != 5)
  {
    if (v3 == 3)
    {
      if (_TRLogEnabled != 1)
        return;
      TRLogHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      v7 = 136315138;
      v8 = "-[TRNearbyDeviceAdvertiser resumeAdvertising]_block_invoke";
      v5 = "%s Advertiser already running.";
    }
    else
    {
      if (_TRLogEnabled != 1)
        return;
      TRLogHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      v7 = 136315138;
      v8 = "-[TRNearbyDeviceAdvertiser resumeAdvertising]_block_invoke";
      v5 = "%s Failed to resume advertising. Advertiser is not started.";
    }
    _os_log_impl(&dword_20A2BF000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v7, 0xCu);
LABEL_17:

    return;
  }
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "-[TRNearbyDeviceAdvertiser resumeAdvertising]_block_invoke";
      _os_log_impl(&dword_20A2BF000, v6, OS_LOG_TYPE_DEFAULT, "%s Resuming advertiser.", (uint8_t *)&v7, 0xCu);
    }

    v2 = *(_QWORD **)(a1 + 32);
  }
  if (objc_msgSend(v2, "requestedService") == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDeviceActionType:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setNeedsSetup:", 1);
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 3;
}

- (void)stopAdvertising
{
  NSObject *advertiserQ;
  _QWORD block[5];

  advertiserQ = self->_advertiserQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__TRNearbyDeviceAdvertiser_stopAdvertising__block_invoke;
  block[3] = &unk_24C2E4F08;
  block[4] = self;
  dispatch_async(advertiserQ, block);
}

void __43__TRNearbyDeviceAdvertiser_stopAdvertising__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[2];
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[2];
  if (v3 == 5 || v3 == 3)
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[TRNearbyDeviceAdvertiser stopAdvertising]_block_invoke";
        _os_log_impl(&dword_20A2BF000, v5, OS_LOG_TYPE_DEFAULT, "%s Stopping advertiser.", buf, 0xCu);
      }

      v2 = *(_QWORD **)(a1 + 32);
    }
    v2[2] = 4;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
  }
  else if (v3 == 1)
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[TRNearbyDeviceAdvertiser stopAdvertising]_block_invoke";
        _os_log_impl(&dword_20A2BF000, v6, OS_LOG_TYPE_DEFAULT, "%s Advertiser stopped.", buf, 0xCu);
      }

      v2 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v2, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "nearbyDeviceAdvertiserDidStopAdvertising:", *(_QWORD *)(a1 + 32));
LABEL_24:

    }
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[TRNearbyDeviceAdvertiser stopAdvertising]_block_invoke";
        _os_log_impl(&dword_20A2BF000, v10, OS_LOG_TYPE_DEFAULT, "%s Failed to stop advertising. Advertiser is not started.", buf, 0xCu);
      }

      v2 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v2, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      v13 = *MEMORY[0x24BDD0FD8];
      v16[0] = *MEMORY[0x24BDD0FC8];
      v16[1] = v13;
      v17[0] = CFSTR("Failed to stop advertising.");
      v17[1] = CFSTR("Advertiser is not started.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9301, v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "nearbyDeviceAdvertiser:didFailToStopAdvertisingWithError:", *(_QWORD *)(a1 + 32), v14);

      goto LABEL_24;
    }
  }
}

- (void)_handleActivationWithError:(id)a3
{
  id v4;
  NSObject *advertiserQ;
  id v6;
  _QWORD block[4];
  id v8;
  TRNearbyDeviceAdvertiser *v9;

  v4 = a3;
  advertiserQ = self->_advertiserQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__TRNearbyDeviceAdvertiser__handleActivationWithError___block_invoke;
  block[3] = &unk_24C2E4F30;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(advertiserQ, block);

}

void __55__TRNearbyDeviceAdvertiser__handleActivationWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  char v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v3 = *(_QWORD *)(a1 + 32);
        v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
        v14 = 138412546;
        v15 = v4;
        v16 = 2112;
        v17 = v3;
        _os_log_impl(&dword_20A2BF000, v2, OS_LOG_TYPE_DEFAULT, "<%@> activation error %@", (uint8_t *)&v14, 0x16u);
      }

    }
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) = 1;
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = 0;

    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "nearbyDeviceAdvertiser:didFailToStartAdvertisingWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
LABEL_14:

    }
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
        v14 = 138412290;
        v15 = v11;
        _os_log_impl(&dword_20A2BF000, v10, OS_LOG_TYPE_DEFAULT, "SFService activation completed <%@>", (uint8_t *)&v14, 0xCu);
      }

    }
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) = 3;
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "nearbyDeviceAdvertiserDidStartAdvertising:", *(_QWORD *)(a1 + 40));
      goto LABEL_14;
    }
  }
}

- (void)_handleInvalidation
{
  NSObject *advertiserQ;
  _QWORD block[5];

  advertiserQ = self->_advertiserQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__TRNearbyDeviceAdvertiser__handleInvalidation__block_invoke;
  block[3] = &unk_24C2E4F08;
  block[4] = self;
  dispatch_async(advertiserQ, block);
}

void __47__TRNearbyDeviceAdvertiser__handleInvalidation__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[TRNearbyDeviceAdvertiser _handleInvalidation]_block_invoke";
      _os_log_impl(&dword_20A2BF000, v2, OS_LOG_TYPE_DEFAULT, "%s SFService invalidated", buf, 0xCu);
    }

  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 56);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__TRNearbyDeviceAdvertiser__handleInvalidation__block_invoke_29;
  block[3] = &unk_24C2E4F08;
  block[4] = v5;
  dispatch_barrier_sync(v6, block);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nearbyDeviceAdvertiserDidStopAdvertising:", *(_QWORD *)(a1 + 32));

  }
}

void __47__TRNearbyDeviceAdvertiser__handleInvalidation__block_invoke_29(uint64_t a1)
{
  void *v2;
  uint64_t v3;
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

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "sessionsTable", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "sessionsTable");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "disconnect");
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "sessionsTable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

}

- (void)_handleInterruption
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[TRNearbyDeviceAdvertiser _handleInterruption]";
      _os_log_impl(&dword_20A2BF000, v3, OS_LOG_TYPE_DEFAULT, "%s SFService interrupted", (uint8_t *)&v4, 0xCu);
    }

  }
  -[TRNearbyDeviceAdvertiser _handleInvalidation](self, "_handleInvalidation");
}

- (void)_handleEventMessage:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__TRNearbyDeviceAdvertiser__handleEventMessage___block_invoke;
  v6[3] = &unk_24C2E5580;
  v7 = v4;
  v5 = v4;
  -[TRNearbyDeviceAdvertiser _requestSessionForMessage:withCallback:](self, "_requestSessionForMessage:withCallback:", v5, v6);

}

void __48__TRNearbyDeviceAdvertiser__handleEventMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "eventMessageHandler");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v8[2](v8, *(_QWORD *)(a1 + 32));

  }
  else if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "-[TRNearbyDeviceAdvertiser _handleEventMessage:]_block_invoke";
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_20A2BF000, v9, OS_LOG_TYPE_DEFAULT, "%s Error fetching session: %@", (uint8_t *)&v10, 0x16u);
    }

  }
}

- (void)_handleRequestMessage:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  TRNearbyDeviceAdvertiser *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__TRNearbyDeviceAdvertiser__handleRequestMessage___block_invoke;
  v6[3] = &unk_24C2E55A8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[TRNearbyDeviceAdvertiser _requestSessionForMessage:withCallback:](self, "_requestSessionForMessage:withCallback:", v5, v6);

}

void __50__TRNearbyDeviceAdvertiser__handleRequestMessage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void (**v4)(_QWORD, _QWORD);
  id v5;

  if (a2)
  {
    objc_msgSend(a2, "connection");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestMessageHandler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, *(_QWORD *)(a1 + 32));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_respondToRequest:withError:", *(_QWORD *)(a1 + 32), a3);
  }
}

- (void)_requestSessionForMessage:(id)a3 withCallback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *sessionsTableQ;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD block[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "peerDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  v24 = 0;
  sessionsTableQ = self->_sessionsTableQ;
  v10 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__TRNearbyDeviceAdvertiser__requestSessionForMessage_withCallback___block_invoke;
  block[3] = &unk_24C2E55D0;
  v18 = &v19;
  block[4] = self;
  v11 = v8;
  v17 = v11;
  dispatch_sync(sessionsTableQ, block);
  v12 = (void *)v20[5];
  if (!v12)
  {
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __67__TRNearbyDeviceAdvertiser__requestSessionForMessage_withCallback___block_invoke_2;
    v14[3] = &unk_24C2E55F8;
    v15 = v7;
    -[TRNearbyDeviceAdvertiser _handleNewConnectionFromPeerDevice:withCompletionHandler:](self, "_handleNewConnectionFromPeerDevice:withCompletionHandler:", v11, v14);
    v13 = v15;
LABEL_6:

    goto LABEL_7;
  }
  if ((objc_msgSend(v12, "isConnected") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9101, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v13);
    goto LABEL_6;
  }
  (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, v20[5], 0);
LABEL_7:

  _Block_object_dispose(&v19, 8);
}

void __67__TRNearbyDeviceAdvertiser__requestSessionForMessage_withCallback___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "sessionsTable");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __67__TRNearbyDeviceAdvertiser__requestSessionForMessage_withCallback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_handleNewConnectionFromPeerDevice:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  TRNearbyDevice *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v18 = "-[TRNearbyDeviceAdvertiser _handleNewConnectionFromPeerDevice:withCompletionHandler:]";
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_20A2BF000, v8, OS_LOG_TYPE_DEFAULT, "%s New connection request from device: %@", buf, 0x16u);

    }
  }
  v10 = -[TRNearbyDevice initWithRepresentedDevice:supportedService:]([TRNearbyDevice alloc], "initWithRepresentedDevice:supportedService:", v6, -[TRNearbyDeviceAdvertiser requestedService](self, "requestedService"));
  -[TRNearbyDeviceAdvertiser delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __85__TRNearbyDeviceAdvertiser__handleNewConnectionFromPeerDevice_withCompletionHandler___block_invoke;
  v14[3] = &unk_24C2E5620;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  objc_msgSend(v11, "nearbyDeviceAdvertiser:didReceiveConnectionRequestFromDevice:requestHandler:", self, v10, v14);

}

void __85__TRNearbyDeviceAdvertiser__handleNewConnectionFromPeerDevice_withCompletionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  TRServerConnection *v10;
  void *v11;
  TRServerConnection *v12;
  void *v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Must provide a valid session object to accept the connection"), 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v14);
    }
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 56);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __85__TRNearbyDeviceAdvertiser__handleNewConnectionFromPeerDevice_withCompletionHandler___block_invoke_2;
    block[3] = &unk_24C2E5098;
    block[4] = v7;
    v9 = v5;
    v16 = v9;
    v17 = *(id *)(a1 + 40);
    dispatch_barrier_async(v8, block);
    v10 = [TRServerConnection alloc];
    objc_msgSend(*(id *)(a1 + 32), "service");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[TRServerConnection initWithService:](v10, "initWithService:", v11);

    objc_msgSend(v9, "setConnection:", v12);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9100, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __85__TRNearbyDeviceAdvertiser__handleNewConnectionFromPeerDevice_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "sessionsTable");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v2, v3);

}

- (void)_respondToRequest:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  TRErrorResponse *v11;

  v6 = a4;
  v7 = a3;
  v11 = objc_alloc_init(TRErrorResponse);
  -[TRErrorResponse setError:](v11, "setError:", v6);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE901A0]), "initWithRequestMessage:", v7);
  +[TRMessageEncoder encodeMessage:](TRMessageEncoder, "encodeMessage:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBodyData:", v9);

  objc_msgSend(v7, "peerDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setPeerDevice:", v10);
  -[SFService sendResponse:](self->_service, "sendResponse:", v8);

}

- (TRNearbyDeviceAdvertiserDelegate)delegate
{
  return (TRNearbyDeviceAdvertiserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (SFService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (OS_dispatch_queue)advertiserQ
{
  return self->_advertiserQ;
}

- (void)setAdvertiserQ:(id)a3
{
  objc_storeStrong((id *)&self->_advertiserQ, a3);
}

- (unint64_t)requestedService
{
  return self->_requestedService;
}

- (void)setRequestedService:(unint64_t)a3
{
  self->_requestedService = a3;
}

- (NSMapTable)sessionsTable
{
  return self->_sessionsTable;
}

- (void)setSessionsTable:(id)a3
{
  objc_storeStrong((id *)&self->_sessionsTable, a3);
}

- (OS_dispatch_queue)sessionsTableQ
{
  return self->_sessionsTableQ;
}

- (void)setSessionsTableQ:(id)a3
{
  objc_storeStrong((id *)&self->_sessionsTableQ, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionsTableQ, 0);
  objc_storeStrong((id *)&self->_sessionsTable, 0);
  objc_storeStrong((id *)&self->_advertiserQ, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
