@implementation TVRCRapportDeviceQuery

- (void)dealloc
{
  RPCompanionLinkClient *companionLinkClient;
  objc_super v4;

  -[RPCompanionLinkClient invalidate](self->_companionLinkClient, "invalidate");
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = 0;

  v4.receiver = self;
  v4.super_class = (Class)TVRCRapportDeviceQuery;
  -[TVRCRapportDeviceQuery dealloc](&v4, sel_dealloc);
}

- (TVRCRapportDeviceQuery)init
{
  TVRCRapportDeviceQuery *v2;
  _TVRCRapportDeviceManager *v3;
  _TVRCRapportDeviceManager *deviceManager;
  _TVRCExpiringStore *v5;
  _TVRCExpiringStore *expiringStore;
  NSMutableDictionary *v7;
  NSMutableDictionary *wrapperToIdentifierMapping;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TVRCRapportDeviceQuery;
  v2 = -[TVRCRapportDeviceQuery init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TVRCRapportDeviceManager);
    deviceManager = v2->_deviceManager;
    v2->_deviceManager = v3;

    v5 = objc_alloc_init(_TVRCExpiringStore);
    expiringStore = v2->_expiringStore;
    v2->_expiringStore = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    wrapperToIdentifierMapping = v2->_wrapperToIdentifierMapping;
    v2->_wrapperToIdentifierMapping = v7;

  }
  return v2;
}

- (void)start
{
  NSObject *v3;
  RPCompanionLinkClient *v4;
  RPCompanionLinkClient *companionLinkClient;
  RPCompanionLinkClient *v6;
  uint64_t v7;
  RPCompanionLinkClient *v8;
  RPCompanionLinkClient *v9;
  RPCompanionLinkClient *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  _TVRCRapportLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[TVRCRapportDeviceQuery start]";
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v4 = (RPCompanionLinkClient *)objc_alloc_init(MEMORY[0x24BE7CBF0]);
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = v4;

  -[RPCompanionLinkClient setControlFlags:](self->_companionLinkClient, "setControlFlags:", 0x4000000000404);
  -[RPCompanionLinkClient setDispatchQueue:](self->_companionLinkClient, "setDispatchQueue:", MEMORY[0x24BDAC9B8]);
  -[RPCompanionLinkClient setFlags:](self->_companionLinkClient, "setFlags:", 1);
  -[RPCompanionLinkClient setRssiThreshold:](self->_companionLinkClient, "setRssiThreshold:", -75);
  -[RPCompanionLinkClient tvrc_setAllowedTVs](self->_companionLinkClient, "tvrc_setAllowedTVs");
  objc_initWeak((id *)buf, self);
  v6 = self->_companionLinkClient;
  v7 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __31__TVRCRapportDeviceQuery_start__block_invoke;
  v21[3] = &unk_24DCD85A0;
  objc_copyWeak(&v22, (id *)buf);
  -[RPCompanionLinkClient setDeviceFoundHandler:](v6, "setDeviceFoundHandler:", v21);
  v8 = self->_companionLinkClient;
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __31__TVRCRapportDeviceQuery_start__block_invoke_96;
  v19[3] = &unk_24DCD85A0;
  objc_copyWeak(&v20, (id *)buf);
  -[RPCompanionLinkClient setDeviceLostHandler:](v8, "setDeviceLostHandler:", v19);
  v9 = self->_companionLinkClient;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __31__TVRCRapportDeviceQuery_start__block_invoke_99;
  v17[3] = &unk_24DCD85C8;
  objc_copyWeak(&v18, (id *)buf);
  -[RPCompanionLinkClient setDeviceChangedHandler:](v9, "setDeviceChangedHandler:", v17);
  v10 = self->_companionLinkClient;
  v12 = v7;
  v13 = 3221225472;
  v14 = __31__TVRCRapportDeviceQuery_start__block_invoke_103;
  v15 = &unk_24DCD71B8;
  objc_copyWeak(&v16, (id *)buf);
  -[RPCompanionLinkClient setInvalidationHandler:](v10, "setInvalidationHandler:", &v12);
  -[RPCompanionLinkClient setInterruptionHandler:](self->_companionLinkClient, "setInterruptionHandler:", &__block_literal_global_12, v12, v13, v14, v15);
  -[RPCompanionLinkClient activateWithCompletion:](self->_companionLinkClient, "activateWithCompletion:", &__block_literal_global_107);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__mdmConfigChanged_, CFSTR("TVRXManagedConfigManagerTVRemoteAllowedTVAdded"), 0);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
}

void __31__TVRCRapportDeviceQuery_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _TVRCRapportLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __31__TVRCRapportDeviceQuery_start__block_invoke_cold_2();

    if (objc_msgSend(WeakRetained, "_shouldReportDevice:", v3))
    {
      _TVRCRapportLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 134218242;
        v22 = v3;
        v23 = 2114;
        v24 = v3;
        _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "Device should be added, device<%p> %{public}@", (uint8_t *)&v21, 0x16u);
      }

      v7 = objc_msgSend(v3, "statusFlags");
      v8 = objc_msgSend(v3, "statusFlags");
      v9 = objc_msgSend(v3, "statusFlags");
      _TVRCRapportLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138544386;
        v22 = v11;
        v23 = 2114;
        v24 = v12;
        v25 = 1024;
        v26 = (v7 >> 1) & 1;
        v27 = 1024;
        v28 = (v8 >> 9) & 1;
        v29 = 1024;
        v30 = (v9 >> 2) & 1;
        _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "Device details name:%{public}@, id:%{public}@, ble:%{BOOL}d, wifip2p:%{BOOL}d, wifi:%{BOOL}d ", (uint8_t *)&v21, 0x28u);

      }
      objc_msgSend(WeakRetained, "deviceManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_identifierForDevice:", v3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(WeakRetained[2], "containsIdentifier:", v14))
      {
        _TVRCRapportLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v21 = 138412290;
          v22 = v3;
          _os_log_impl(&dword_21A51B000, v15, OS_LOG_TYPE_DEFAULT, "Device expired, but was found again, device=%@", (uint8_t *)&v21, 0xCu);
        }

        objc_msgSend(WeakRetained[2], "removeIdentifier:", v14);
        objc_msgSend(WeakRetained, "_wrapperForDevice:", v3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = v16;
          objc_msgSend(v16, "device");
          v18 = (id)objc_claimAutoreleasedReturnValue();

          if (v18 != v3)
            objc_msgSend(v17, "updateWithDevice:", v3);
          _TVRCRapportLog();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v21 = 138412290;
            v22 = v17;
            _os_log_impl(&dword_21A51B000, v19, OS_LOG_TYPE_DEFAULT, "Reconnecting: %@", (uint8_t *)&v21, 0xCu);
          }

          objc_msgSend(v17, "reconnect");
          goto LABEL_22;
        }
        _TVRCRapportLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          __31__TVRCRapportDeviceQuery_start__block_invoke_cold_1();

      }
      objc_msgSend(WeakRetained, "_deviceFound:", v3);
LABEL_22:

    }
  }

}

void __31__TVRCRapportDeviceQuery_start__block_invoke_96(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  _QWORD *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "_shouldReportDevice:", v3))
  {
    _TVRCRapportLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = (uint64_t)v3;
      _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "Device should be removed, device=%{public}@", buf, 0xCu);
    }

    objc_msgSend(v5, "deviceManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_identifierForDevice:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "_wrapperForDevice:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "connected");
    _TVRCRapportLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_DWORD *)buf = 134218498;
        v18 = 0x401C000000000000;
        v19 = 2112;
        v20 = v9;
        v21 = 2112;
        v22 = v3;
        _os_log_impl(&dword_21A51B000, v11, OS_LOG_TYPE_DEFAULT, "Device was lost, wait to see if it returns, timeout=%f, deviceWrapper=%@, device=%@", buf, 0x20u);
      }

      objc_initWeak((id *)buf, v5);
      v13 = (void *)v5[2];
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __31__TVRCRapportDeviceQuery_start__block_invoke_97;
      v14[3] = &unk_24DCD7230;
      objc_copyWeak(&v16, (id *)buf);
      v15 = v3;
      objc_msgSend(v13, "addIdentifier:withExpiration:completion:", v8, v14, 7.0);

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21A51B000, v11, OS_LOG_TYPE_DEFAULT, "Device wasn't connected so we won't try to reconnect", buf, 2u);
      }

      objc_msgSend(v5, "_deviceLost:", v3);
    }

  }
}

void __31__TVRCRapportDeviceQuery_start__block_invoke_97(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    _TVRCRapportLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Device was not found again, device=%{public}@", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(WeakRetained, "_deviceLost:", *(_QWORD *)(a1 + 32));
  }

}

void __31__TVRCRapportDeviceQuery_start__block_invoke_99(uint64_t a1, void *a2, char a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  const char *v11;
  int v12;
  id v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_wrapperForDevice:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _TVRCRapportLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = v5;
    _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "Device changed, device=%{public}@", (uint8_t *)&v12, 0xCu);
  }

  if (v7 && objc_msgSend(v7, "isPaired"))
  {
    _TVRCRapportLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = "yes";
      if ((a3 & 2) != 0)
        v11 = "yes";
      else
        v11 = "no";
      v12 = 138412802;
      v13 = v5;
      v15 = v11;
      v14 = 2080;
      if ((a3 & 0x10) == 0)
        v10 = "no";
      v16 = 2080;
      v17 = v10;
      _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "Rapport discovery device %@ changed handler attributesChanged :%s nameChanged: %s", (uint8_t *)&v12, 0x20u);
    }

    if ((a3 & 0x12) != 0)
      objc_msgSend(v7, "updateWithDevice:", v5);
  }

}

void __31__TVRCRapportDeviceQuery_start__block_invoke_103(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  _TVRCRapportLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21A51B000, v2, OS_LOG_TYPE_DEFAULT, "Rapport discovery companionLinkClient connection invalidated, disconnecting all devices", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_disconnectAllDevices");

}

void __31__TVRCRapportDeviceQuery_start__block_invoke_104()
{
  NSObject *v0;
  uint8_t v1[16];

  _TVRCRapportLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21A51B000, v0, OS_LOG_TYPE_DEFAULT, "Rapport discovery companionLinkClient connection interrupted", v1, 2u);
  }

}

void __31__TVRCRapportDeviceQuery_start__block_invoke_105(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  _TVRCRapportLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __31__TVRCRapportDeviceQuery_start__block_invoke_105_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Rapport discovery client activated. Searching for Rapport devices.", v5, 2u);
  }

}

- (void)stop
{
  NSObject *v3;
  _TVRCExpiringStore *expiringStore;
  NSMutableDictionary *wrapperToIdentifierMapping;
  _TVRCRapportDeviceManager *deviceManager;
  RPCompanionLinkClient *companionLinkClient;
  void *v8;
  uint8_t v9[16];

  _TVRCRapportLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Stopping rapport query", v9, 2u);
  }

  expiringStore = self->_expiringStore;
  self->_expiringStore = 0;

  -[NSMutableDictionary removeAllObjects](self->_wrapperToIdentifierMapping, "removeAllObjects");
  wrapperToIdentifierMapping = self->_wrapperToIdentifierMapping;
  self->_wrapperToIdentifierMapping = 0;

  deviceManager = self->_deviceManager;
  self->_deviceManager = 0;

  -[RPCompanionLinkClient invalidate](self->_companionLinkClient, "invalidate");
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = 0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("TVRXManagedConfigManagerTVRemoteAllowedTVAdded"), 0);

}

- (void)_deviceFound:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRCRapportLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[TVRCRapportDeviceQuery _deviceFound:]";
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__TVRCRapportDeviceQuery__deviceFound___block_invoke;
  v7[3] = &unk_24DCD8630;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  _os_activity_initiate(&dword_21A51B000, "RPCompanionLinkDevice device discovered", OS_ACTIVITY_FLAG_DETACHED, v7);

}

void __39__TVRCRapportDeviceQuery__deviceFound___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "deviceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "createOrUpdateRecordForDevice:", *(_QWORD *)(a1 + 40));

    if (v5)
    {
      _TVRCRapportLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 40);
        v12 = 138543362;
        v13 = v7;
        _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "Informing delegate device %{public}@ was added", (uint8_t *)&v12, 0xCu);
      }

      +[TVRCRPCompanionLinkClientWrapper wrapperWithDevice:](TVRCRPCompanionLinkClientWrapper, "wrapperWithDevice:", *(_QWORD *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      objc_msgSend(v8, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v8, v10);

      v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
      objc_msgSend(v11, "rapportDeviceQuery:addedDevice:", *(_QWORD *)(a1 + 32), v8);

    }
  }
}

- (void)_deviceLost:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  TVRCRapportDeviceQuery *v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRCRapportLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[TVRCRapportDeviceQuery _deviceLost:]";
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__TVRCRapportDeviceQuery__deviceLost___block_invoke;
  v7[3] = &unk_24DCD8630;
  v8 = v4;
  v9 = self;
  v6 = v4;
  _os_activity_initiate(&dword_21A51B000, "RPCompanionLinkDevice device lost", OS_ACTIVITY_FLAG_DETACHED, v7);

}

void __38__TVRCRapportDeviceQuery__deviceLost___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id *v4;
  id WeakRetained;
  char v6;
  void *v7;
  id *v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  _TVRCRapportLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v20 = 138543362;
    v21 = v3;
    _os_log_impl(&dword_21A51B000, v2, OS_LOG_TYPE_DEFAULT, "Informing delegate device %{public}@ was lost", (uint8_t *)&v20, 0xCu);
  }

  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "deviceManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v8 = (id *)(a1 + 32);
    v10 = objc_msgSend(v7, "removeDeviceRecordForDevice:", v9);

    if (v10)
    {
      objc_msgSend(*v4, "deviceManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_identifierForDevice:", *v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*v4, "_wrapperForDevice:", *v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        if (objc_msgSend(v13, "connected"))
        {
          _TVRCRapportLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            __38__TVRCRapportDeviceQuery__deviceLost___block_invoke_cold_3();

          TVRCMakeError(103, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "disconnectWithError:", v16);

        }
        v17 = objc_loadWeakRetained((id *)*v4 + 1);
        objc_msgSend(v17, "rapportDeviceQuery:removedDevice:", *v4, v14);

        _TVRCRapportLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          __38__TVRCRapportDeviceQuery__deviceLost___block_invoke_cold_2();

        objc_msgSend(*((id *)*v4 + 4), "removeObjectForKey:", v12);
      }
      else
      {
        _TVRCRapportLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          __38__TVRCRapportDeviceQuery__deviceLost___block_invoke_cold_1(v8);

      }
    }
  }
}

- (void)_disconnectAllDevices
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  NSObject *WeakRetained;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  _TVRCRapportLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[TVRCRapportDeviceQuery _disconnectAllDevices]";
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[NSMutableDictionary allValues](self->_wrapperToIdentifierMapping, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v15;
    *(_QWORD *)&v6 = 138543362;
    v13 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = *(const char **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          _TVRCRapportLog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            v20 = v10;
            _os_log_impl(&dword_21A51B000, v11, OS_LOG_TYPE_DEFAULT, "Telling device to disconnect, device=%{public}@", buf, 0xCu);
          }

          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          -[NSObject rapportDeviceQuery:removedDevice:](WeakRetained, "rapportDeviceQuery:removedDevice:", self, v10);
        }
        else
        {
          _TVRCRapportLog();
          WeakRetained = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v13;
            v20 = v10;
            _os_log_error_impl(&dword_21A51B000, WeakRetained, OS_LOG_TYPE_ERROR, "Invalid device was told to disconnect,  device=%{public}@", buf, 0xCu);
          }
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  -[NSMutableDictionary removeAllObjects](self->_wrapperToIdentifierMapping, "removeAllObjects", v13);

}

- (BOOL)_shouldReportDevice:(id)a3
{
  id v3;
  void *v4;
  int v5;
  __int16 v6;
  BOOL v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsString:", CFSTR("AppleTV"));

  v6 = objc_msgSend(v3, "statusFlags");
  v7 = 0;
  if (v5 && (v6 & 0x800) != 0)
  {
    +[TVRXManagedConfigManager sharedInstance](TVRXManagedConfigManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "allowedDeviceWithName:", v9);

    if ((v10 & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      _TVRCRapportLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138543362;
        v14 = v3;
        _os_log_impl(&dword_21A51B000, v11, OS_LOG_TYPE_DEFAULT, "Device will not be shown because it's now allowed by MDM! %{public}@", (uint8_t *)&v13, 0xCu);
      }

      v7 = 0;
    }
  }

  return v7;
}

- (id)_wrapperForDevice:(id)a3
{
  NSMutableDictionary *wrapperToIdentifierMapping;
  void *v4;
  void *v5;

  wrapperToIdentifierMapping = self->_wrapperToIdentifierMapping;
  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](wrapperToIdentifierMapping, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_disconnectAndRemoveDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id WeakRetained;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRCRapportDeviceQuery deviceManager](self, "deviceManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_identifierForDevice:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[TVRCRapportDeviceQuery deviceManager](self, "deviceManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeDeviceRecordForDevice:", v6);

    _TVRCRapportLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v5;
      _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "Telling device to disconnect, device=%{public}@", (uint8_t *)&v12, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "rapportDeviceQuery:removedDevice:", self, v5);

    -[NSMutableDictionary removeObjectForKey:](self->_wrapperToIdentifierMapping, "removeObjectForKey:", v8);
  }

}

- (void)_mdmConfigChanged:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  BOOL v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  _TVRCRapportLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "MDM config changed. Disconnecting non-approved devices.", buf, 2u);
  }

  +[TVRXManagedConfigManager sharedInstance](TVRXManagedConfigManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isManagedConfigProfileInstalled");

  if (v6)
  {
    -[NSMutableDictionary allValues](self->_wrapperToIdentifierMapping, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v12, "device");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[TVRCRapportDeviceQuery _shouldReportDevice:](self, "_shouldReportDevice:", v13);

          if (!v14)
            -[TVRCRapportDeviceQuery _disconnectAndRemoveDevice:](self, "_disconnectAndRemoveDevice:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v9);
    }

  }
}

- (TVRCRapportDeviceQueryDelegate)delegate
{
  return (TVRCRapportDeviceQueryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_TVRCExpiringStore)expiringStore
{
  return self->_expiringStore;
}

- (void)setExpiringStore:(id)a3
{
  objc_storeStrong((id *)&self->_expiringStore, a3);
}

- (RPCompanionLinkClient)companionLinkClient
{
  return self->_companionLinkClient;
}

- (void)setCompanionLinkClient:(id)a3
{
  objc_storeStrong((id *)&self->_companionLinkClient, a3);
}

- (NSMutableDictionary)wrapperToIdentifierMapping
{
  return self->_wrapperToIdentifierMapping;
}

- (void)setWrapperToIdentifierMapping:(id)a3
{
  objc_storeStrong((id *)&self->_wrapperToIdentifierMapping, a3);
}

- (_TVRCRapportDeviceManager)deviceManager
{
  return self->_deviceManager;
}

- (void)setDeviceManager:(id)a3
{
  objc_storeStrong((id *)&self->_deviceManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceManager, 0);
  objc_storeStrong((id *)&self->_wrapperToIdentifierMapping, 0);
  objc_storeStrong((id *)&self->_companionLinkClient, 0);
  objc_storeStrong((id *)&self->_expiringStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __31__TVRCRapportDeviceQuery_start__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_4(&dword_21A51B000, v0, v1, "Device wrapper not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __31__TVRCRapportDeviceQuery_start__block_invoke_cold_2()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_0();
  v4 = 2114;
  v5 = v0;
  OUTLINED_FUNCTION_9(&dword_21A51B000, v1, v2, "Device found, device<%p> %{public}@", v3);
  OUTLINED_FUNCTION_2();
}

void __31__TVRCRapportDeviceQuery_start__block_invoke_105_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_21A51B000, v0, OS_LOG_TYPE_ERROR, "Rapport discovery companionLinkClient failed to activate. Error - %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __38__TVRCRapportDeviceQuery__deviceLost___block_invoke_cold_1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_21A51B000, v2, v3, "No deviceWrapper found for device id:%{public}@ in mapping %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

void __38__TVRCRapportDeviceQuery__deviceLost___block_invoke_cold_2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_0();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_9(&dword_21A51B000, v1, (uint64_t)v1, "Removing %@ from dictionary: %@", v2);
  OUTLINED_FUNCTION_2();
}

void __38__TVRCRapportDeviceQuery__deviceLost___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_4(&dword_21A51B000, v0, v1, "Device was connected while lost, sending TVRCErrorCodeDeviceNotFoundError", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

@end
