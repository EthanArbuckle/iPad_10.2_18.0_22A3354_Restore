@implementation WPBonjourNearBy

- (WPBonjourNearBy)initWithDelegate:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  WPBonjourNearBy *v9;
  WPBonjourNearBy *v10;
  SFBonjourNearBy *v11;
  SFBonjourNearBy *sfBonjourNearBy;
  uint64_t v13;
  NSMutableDictionary *advertiserNearbyTypesAdvData;
  NSMutableDictionary *v15;
  NSMutableDictionary *scannerNearbyTypesToScan;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WPBonjourNearBy;
  v9 = -[WPBonjourNearBy init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_delegate, a3);
    objc_storeStrong((id *)&v10->_dispatch_queue, a4);
    v11 = -[SFBonjourNearBy initWithQueue:]([SFBonjourNearBy alloc], "initWithQueue:", v8);
    sfBonjourNearBy = v10->_sfBonjourNearBy;
    v10->_sfBonjourNearBy = v11;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    advertiserNearbyTypesAdvData = v10->_advertiserNearbyTypesAdvData;
    v10->_advertiserNearbyTypesAdvData = (NSMutableDictionary *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    scannerNearbyTypesToScan = v10->_scannerNearbyTypesToScan;
    v10->_scannerNearbyTypesToScan = v15;

    v10->_state = 3;
    -[WPBonjourNearBy _listenForSFBonjourEvents](v10, "_listenForSFBonjourEvents");
  }

  return v10;
}

- (void)_listenForSFBonjourEvents
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke;
  v16[3] = &unk_1E482E280;
  objc_copyWeak(&v17, &location);
  -[SFBonjourNearBy setDeviceDidStartScanning:](self->_sfBonjourNearBy, "setDeviceDidStartScanning:", v16);
  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_2;
  v14[3] = &unk_1E4832E40;
  objc_copyWeak(&v15, &location);
  -[SFBonjourNearBy setDeviceFoundHandler:](self->_sfBonjourNearBy, "setDeviceFoundHandler:", v14);
  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_2_94;
  v12[3] = &unk_1E4832E40;
  objc_copyWeak(&v13, &location);
  -[SFBonjourNearBy setDeviceLostHandler:](self->_sfBonjourNearBy, "setDeviceLostHandler:", v12);
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_2_98;
  v10[3] = &unk_1E482DB08;
  objc_copyWeak(&v11, &location);
  -[SFBonjourNearBy setAdvertisingStateUpdateHandler:](self->_sfBonjourNearBy, "setAdvertisingStateUpdateHandler:", v10);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_2_105;
  v8[3] = &unk_1E4832E90;
  objc_copyWeak(&v9, &location);
  -[SFBonjourNearBy setDeviceDidConnectHandler:](self->_sfBonjourNearBy, "setDeviceDidConnectHandler:", v8);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_109;
  v6[3] = &unk_1E4832EB8;
  objc_copyWeak(&v7, &location);
  -[SFBonjourNearBy setDeviceDidDisconnectHandler:](self->_sfBonjourNearBy, "setDeviceDidDisconnectHandler:", v6);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_113;
  v4[3] = &unk_1E4832EE0;
  objc_copyWeak(&v5, &location);
  -[SFBonjourNearBy setDeviceDidReceiveDataHandler:](self->_sfBonjourNearBy, "setDeviceDidReceiveDataHandler:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    daemon_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1A2830000, v5, OS_LOG_TYPE_DEFAULT, "deviceDidStartScanning with error %@\n", buf, 0xCu);
    }

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = (void *)WeakRetained[3];
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_82;
      v7[3] = &unk_1E48326A8;
      v7[4] = WeakRetained;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);
    }
  }

}

uint64_t __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_82(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "nearby:didStartScanningForType:", *(_QWORD *)(a1 + 32), objc_msgSend(a2, "unsignedIntValue"));
}

void __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    daemon_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1A2830000, v8, OS_LOG_TYPE_DEFAULT, "Found device %@ with advertisementData %@\n", buf, 0x16u);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_87;
      v10[3] = &unk_1E4832E18;
      v10[4] = WeakRetained;
      v11 = v5;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

    }
  }

}

void __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_87(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  v5 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WPBonjourNearbyType"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "unsignedIntValue");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WPBonjourNearbyPayloadKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "nearby:didDiscoverType:withData:fromPeer:peerInfo:", v3, v6, v7, *(_QWORD *)(a1 + 40), 0);
}

void __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_2_94(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  daemon_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v9;
    _os_log_impl(&dword_1A2830000, v8, OS_LOG_TYPE_DEFAULT, "Lost device %@\n", buf, 0xCu);

  }
  if (WeakRetained)
  {
    if (v6)
      objc_msgSend(v6, "valueForKey:", CFSTR("WPBonjourNearbyType"));
    else
      objc_msgSend(WeakRetained[3], "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_97;
      v11[3] = &unk_1E4832E18;
      v11[4] = WeakRetained;
      v12 = v5;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

    }
  }

}

uint64_t __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_97(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "nearby:didLosePeer:type:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), objc_msgSend(a2, "unsignedIntValue"));
}

void __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_2_98(uint64_t a1, int a2, void *a3)
{
  id v5;
  _QWORD *WeakRetained;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  char v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    daemon_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v13 = a2;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1A2830000, v7, OS_LOG_TYPE_DEFAULT, "Advertising state update isStarted %d with error %@\n", buf, 0x12u);
    }

    v8 = (void *)WeakRetained[3];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_99;
    v9[3] = &unk_1E4832E68;
    v11 = a2;
    v9[4] = WeakRetained;
    v10 = v5;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v9);

  }
}

void __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_99(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (*(_BYTE *)(a1 + 48))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "nearby:didStartAdvertisingType:", *(_QWORD *)(a1 + 32), objc_msgSend(v6, "unsignedIntValue"));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "nearby:didStopAdvertisingType:withError:", *(_QWORD *)(a1 + 32), objc_msgSend(v6, "unsignedIntValue"), *(_QWORD *)(a1 + 40));
  }

}

void __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_2_105(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    daemon_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1A2830000, v8, OS_LOG_TYPE_DEFAULT, "Device didConnect %@ with error %@\n", (uint8_t *)&v9, 0x16u);
    }

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained[5], "nearby:didConnectToPeer:transport:error:", WeakRetained, v5, 0, v6);
  }

}

void __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_109(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    daemon_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1A2830000, v5, OS_LOG_TYPE_DEFAULT, "Device didDisConnect %@", (uint8_t *)&v6, 0xCu);
    }

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained[5], "nearby:didDisconnectFromPeer:error:", WeakRetained, v3, 0);
  }

}

void __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_113(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    daemon_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1A2830000, v8, OS_LOG_TYPE_DEFAULT, "Device didReceiveData from %@ with data %@\n", (uint8_t *)&v9, 0x16u);
    }

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained[5], "nearby:didReceiveData:fromPeer:", WeakRetained, v6, v5);
  }

}

- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4
{
  -[WPBonjourNearBy startAdvertisingOfType:data:priority:mode:options:](self, "startAdvertisingOfType:data:priority:mode:options:", a3, a4, 0, 290, 0);
}

- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4 priority:(int64_t)a5
{
  -[WPBonjourNearBy startAdvertisingOfType:data:priority:mode:options:](self, "startAdvertisingOfType:data:priority:mode:options:", a3, a4, a5, 290, 0);
}

- (void)startAdvertisingOfType:(int64_t)a3 data:(id)a4 priority:(int64_t)a5 mode:(int64_t)a6
{
  -[WPBonjourNearBy startAdvertisingOfType:data:priority:mode:options:](self, "startAdvertisingOfType:data:priority:mode:options:", a3, a4, a5, a6, 0);
}

- (void)startAdvertisingOfType:(int64_t)a3 data:(id)a4 priority:(int64_t)a5 mode:(int64_t)a6 options:(id)a7
{
  id v10;
  id v11;
  WPBonjourNearBy *v12;
  NSObject *v13;
  NSMutableDictionary *advertiserNearbyTypesAdvData;
  void *v15;
  void *v16;
  void *v17;
  SFBonjourNearBy *sfBonjourNearBy;
  _QWORD v19[5];
  id v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _BYTE buf[12];
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a7;
  v12 = self;
  objc_sync_enter(v12);
  daemon_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = a3;
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_1A2830000, v13, OS_LOG_TYPE_DEFAULT, "startAdvertisingOfType %ld with data %@\n", buf, 0x16u);
  }

  advertiserNearbyTypesAdvData = v12->_advertiserNearbyTypesAdvData;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](advertiserNearbyTypesAdvData, "setObject:forKeyedSubscript:", v10, v15);

  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, v12);
  v21[0] = CFSTR("WPBonjourNearbyType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = CFSTR("WPBonjourNearbyPayloadKey");
  v22[0] = v16;
  v22[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  sfBonjourNearBy = v12->_sfBonjourNearBy;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __69__WPBonjourNearBy_startAdvertisingOfType_data_priority_mode_options___block_invoke;
  v19[3] = &unk_1E4832F08;
  objc_copyWeak(v20, (id *)buf);
  v20[1] = (id)a3;
  v19[4] = v12;
  -[SFBonjourNearBy startAdvertisingWithData:completionHandler:](sfBonjourNearBy, "startAdvertisingWithData:completionHandler:", v17, v19);
  objc_destroyWeak(v20);

  objc_destroyWeak((id *)buf);
  objc_sync_exit(v12);

}

void __69__WPBonjourNearBy_startAdvertisingOfType_data_priority_mode_options___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)*((_QWORD *)WeakRetained + 5);
    v7 = *(_QWORD *)(a1 + 48);
    if (v10)
    {
      objc_msgSend(v6, "nearby:didFailToStartAdvertisingOfType:withError:", v5, v7, v10);
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectForKey:", v9);

    }
    else
    {
      objc_msgSend(v6, "nearby:didStartAdvertisingType:", v5, v7);
    }
  }

}

- (void)stopAdvertisingOfType:(int64_t)a3
{
  WPBonjourNearBy *v4;
  NSMutableDictionary *advertiserNearbyTypesAdvData;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSMutableDictionary *v14;
  void *v15;
  SFBonjourNearBy *sfBonjourNearBy;
  _QWORD v17[4];
  id v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _BYTE buf[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  advertiserNearbyTypesAdvData = v4->_advertiserNearbyTypesAdvData;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](advertiserNearbyTypesAdvData, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    daemon_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = a3;
      _os_log_impl(&dword_1A2830000, v8, OS_LOG_TYPE_DEFAULT, "stopAdvertisingOfType %ld", buf, 0xCu);
    }

    v19[0] = CFSTR("WPBonjourNearbyType");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = CFSTR("WPBonjourNearbyPayloadKey");
    v20[0] = v9;
    v10 = v4->_advertiserNearbyTypesAdvData;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = v4->_advertiserNearbyTypesAdvData;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v14, "removeObjectForKey:", v15);

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, v4);
    sfBonjourNearBy = v4->_sfBonjourNearBy;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __41__WPBonjourNearBy_stopAdvertisingOfType___block_invoke;
    v17[3] = &unk_1E4832F30;
    objc_copyWeak(v18, (id *)buf);
    v18[1] = (id)a3;
    -[SFBonjourNearBy stopAdvertisingForData:completionHandler:](sfBonjourNearBy, "stopAdvertisingForData:completionHandler:", v13, v17);
    objc_destroyWeak(v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    daemon_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = a3;
      _os_log_impl(&dword_1A2830000, v13, OS_LOG_TYPE_DEFAULT, "No Advertising for type %ld, not stopping anything!\n", buf, 0xCu);
    }
  }

  objc_sync_exit(v4);
}

void __41__WPBonjourNearBy_stopAdvertisingOfType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *WeakRetained;
  id *v5;
  id v6;

  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[5], "nearby:didStopAdvertisingType:withError:", WeakRetained, *(_QWORD *)(a1 + 40), v6);

}

- (void)startScanningForType:(int64_t)a3 data:(id)a4 mask:(id)a5 peers:(id)a6 scanMode:(int64_t)a7 rssi:(id)a8 duplicates:(BOOL)a9 scanCache:(BOOL)a10 useCaseList:(id)a11
{
  id v16;
  id v17;
  WPBonjourNearBy *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  NSMutableDictionary *scannerNearbyTypesToScan;
  void *v30;
  NSObject *v31;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  _QWORD v39[8];
  _QWORD v40[10];

  v40[8] = *MEMORY[0x1E0C80C00];
  v16 = a4;
  v17 = a5;
  v34 = a6;
  v36 = a8;
  v35 = a11;
  v18 = self;
  objc_sync_enter(v18);
  v39[0] = CFSTR("scanMode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v19;
  v40[1] = v36;
  v39[1] = CFSTR("rssi");
  v39[2] = CFSTR("duplicates");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v20;
  v39[3] = CFSTR("scanCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a10);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  v23 = (void *)MEMORY[0x1E0C9AA60];
  v24 = v35;
  if (!v35)
    v24 = (id)MEMORY[0x1E0C9AA60];
  v40[3] = v21;
  v40[4] = v24;
  v39[4] = CFSTR("useCaseList");
  v39[5] = CFSTR("payloadFilterData");
  v25 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v40[5] = v25;
  v39[6] = CFSTR("payloadFilterMaskData");
  v26 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v39[7] = CFSTR("peers");
  v27 = v34;
  if (!v34)
    v27 = v23;
  v40[6] = v26;
  v40[7] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 8, a3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)

  if (!v16)
  scannerNearbyTypesToScan = v18->_scannerNearbyTypesToScan;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v33);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](scannerNearbyTypesToScan, "setObject:forKey:", v28, v30);

  daemon_log();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v38 = v33;
    _os_log_impl(&dword_1A2830000, v31, OS_LOG_TYPE_DEFAULT, "[Discovery] starting for type %ld\n", buf, 0xCu);
  }

  -[SFBonjourNearBy startDiscovery](v18->_sfBonjourNearBy, "startDiscovery");
  objc_sync_exit(v18);

}

- (void)stopScanningForType:(int64_t)a3
{
  WPBonjourNearBy *v4;
  NSObject *v5;
  NSMutableDictionary *scannerNearbyTypesToScan;
  void *v7;
  void *v8;
  SFBonjourNearBy *sfBonjourNearBy;
  int v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  daemon_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = a3;
    _os_log_impl(&dword_1A2830000, v5, OS_LOG_TYPE_DEFAULT, "[Discovery] stopping for type %ld\n", (uint8_t *)&v10, 0xCu);
  }

  scannerNearbyTypesToScan = v4->_scannerNearbyTypesToScan;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](scannerNearbyTypesToScan, "removeObjectForKey:", v7);

  -[NSMutableDictionary allKeys](v4->_scannerNearbyTypesToScan, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(scannerNearbyTypesToScan) = objc_msgSend(v8, "count") == 0;

  sfBonjourNearBy = v4->_sfBonjourNearBy;
  if ((_DWORD)scannerNearbyTypesToScan)
    -[SFBonjourNearBy stopDiscovery](sfBonjourNearBy, "stopDiscovery");
  else
    -[SFBonjourNearBy startDiscovery](sfBonjourNearBy, "startDiscovery");
  objc_sync_exit(v4);

}

- (void)connectToPeer:(id)a3 withOptions:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  daemon_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1A2830000, v6, OS_LOG_TYPE_DEFAULT, "Connecting to peer %@", (uint8_t *)&v7, 0xCu);
  }

  -[SFBonjourNearBy connectToDevice:](self->_sfBonjourNearBy, "connectToDevice:", v5);
}

- (void)disconnectFromPeer:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  daemon_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1A2830000, v5, OS_LOG_TYPE_DEFAULT, "Disconnecting from peer %@", (uint8_t *)&v6, 0xCu);
  }

  -[SFBonjourNearBy disconnectFromDevice:](self->_sfBonjourNearBy, "disconnectFromDevice:", v4);
}

- (void)sendData:(id)a3 toPeer:(id)a4
{
  id v6;
  id v7;
  SFBonjourNearBy *sfBonjourNearBy;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  location = 0;
  objc_initWeak(&location, self);
  sfBonjourNearBy = self->_sfBonjourNearBy;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __35__WPBonjourNearBy_sendData_toPeer___block_invoke;
  v11[3] = &unk_1E4832F58;
  objc_copyWeak(&v14, &location);
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  -[SFBonjourNearBy sendData:toDevice:completionHandler:](sfBonjourNearBy, "sendData:toDevice:completionHandler:", v9, v10, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __35__WPBonjourNearBy_sendData_toPeer___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained[5], "nearby:didSendData:toPeer:error:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v4);

}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_dispatch_queue, 0);
  objc_storeStrong((id *)&self->_scannerNearbyTypesToScan, 0);
  objc_storeStrong((id *)&self->_advertiserNearbyTypesAdvData, 0);
  objc_storeStrong((id *)&self->_sfBonjourNearBy, 0);
}

@end
