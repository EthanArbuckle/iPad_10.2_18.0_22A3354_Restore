@implementation WLDeviceDiscoveryController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_12);
  return (id)sharedInstance_instance_1;
}

void __45__WLDeviceDiscoveryController_sharedInstance__block_invoke()
{
  WLDeviceDiscoveryController *v0;
  void *v1;

  v0 = objc_alloc_init(WLDeviceDiscoveryController);
  v1 = (void *)sharedInstance_instance_1;
  sharedInstance_instance_1 = (uint64_t)v0;

}

- (WLDeviceDiscoveryController)init
{
  WLDeviceDiscoveryController *v2;
  WLDeviceDiscoveryController *v3;
  uint64_t v4;
  NSMutableArray *socketHandlers;
  uint64_t v6;
  NSMutableArray *sourceDevices;
  dispatch_queue_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WLDeviceDiscoveryController;
  v2 = -[WLDeviceDiscoveryController init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_starting = 0;
    v2->_listenerSocket = -1;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    socketHandlers = v3->_socketHandlers;
    v3->_socketHandlers = (NSMutableArray *)v4;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    sourceDevices = v3->_sourceDevices;
    v3->_sourceDevices = (NSMutableArray *)v6;

    v8 = dispatch_queue_create("com.apple.welcomekitcore.discoveryRequestSerialQueue", 0);
    -[WLDeviceDiscoveryController setQueue:](v3, "setQueue:", v8);

  }
  return v3;
}

- (WLSourceDevice)sourceDevice
{
  NSMutableArray *v3;
  void *v4;

  v3 = self->_sourceDevices;
  objc_sync_enter(v3);
  -[NSMutableArray firstObject](self->_sourceDevices, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return (WLSourceDevice *)v4;
}

- (BOOL)_shouldForceDiscoveryError
{
  return objc_msgSend(MEMORY[0x24BEC2830], "BOOLForKey:", CFSTR("ForceDiscoveryError")) == 1;
}

- (void)startWiFiAndDeviceDiscoveryWithPreGeneratedCode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __90__WLDeviceDiscoveryController_startWiFiAndDeviceDiscoveryWithPreGeneratedCode_completion___block_invoke;
  v11[3] = &unk_24E376CD8;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __90__WLDeviceDiscoveryController_startWiFiAndDeviceDiscoveryWithPreGeneratedCode_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 8) = 1;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __90__WLDeviceDiscoveryController_startWiFiAndDeviceDiscoveryWithPreGeneratedCode_completion___block_invoke_2;
    v5[3] = &unk_24E376CB0;
    v4 = *(_QWORD *)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v3, "_queue_startDiscoveryWithPreGeneratedCode:completion:", v4, v5);

  }
}

void __90__WLDeviceDiscoveryController_startWiFiAndDeviceDiscoveryWithPreGeneratedCode_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if ((a2 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEC2850], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "wifiDidFail");

  }
  v17 = *(_QWORD *)(a1 + 32);
  if (v17)
    (*(void (**)(uint64_t, uint64_t, id, id, id, uint64_t, id))(v17 + 16))(v17, a2, v18, v13, v14, a6, v15);

}

- (void)_queue_startDiscoveryWithPreGeneratedCode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  WLAutomation *v11;
  WLAutomation *automation;
  NSMutableArray *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id location;

  v6 = a3;
  v7 = a4;
  if (-[WLDeviceDiscoveryController _shouldForceDiscoveryError](self, "_shouldForceDiscoveryError"))
  {
    _WLLog();
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC2878], 1, MEMORY[0x24BDBD1B8], self);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, void *))v7 + 2))(v7, 0, 0, 0, 0, -1, v8);

    }
  }
  else
  {
    -[WLDeviceDiscoveryController _allowConnectionsFromAnyAddress](self, "_allowConnectionsFromAnyAddress");
    if (v6)
    {
      v9 = v6;
    }
    else
    {
      -[WLDeviceDiscoveryController _generatePairingSecret](self, "_generatePairingSecret");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    self->_countOfPairingAttemptsWithCurrentSecret = 0;
    v11 = objc_alloc_init(WLAutomation);
    automation = self->_automation;
    self->_automation = v11;

    -[WLAutomation writeCodeForTestAutomationIfNeeded:](self->_automation, "writeCodeForTestAutomationIfNeeded:", v10);
    v13 = self->_sourceDevices;
    objc_sync_enter(v13);
    -[NSMutableArray removeAllObjects](self->_sourceDevices, "removeAllObjects");
    objc_sync_exit(v13);

    -[WLDeviceDiscoveryController _postSourceDevicesDidChangeNotification](self, "_postSourceDevicesDidChangeNotification");
    objc_msgSend(v10, "substringWithRange:", 0, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLDeviceDiscoveryController _ssidWithSecret:](self, "_ssidWithSecret:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "substringWithRange:", 2, objc_msgSend(v10, "length") - 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLDeviceDiscoveryController setSsid:](self, "setSsid:", v15);
    objc_initWeak(&location, self);
    +[WLWiFiController sharedInstance](WLWiFiController, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __84__WLDeviceDiscoveryController__queue_startDiscoveryWithPreGeneratedCode_completion___block_invoke;
    v21[3] = &unk_24E376D00;
    objc_copyWeak(&v27, &location);
    v18 = v15;
    v22 = v18;
    v23 = 0;
    v19 = v10;
    v24 = v19;
    v20 = v16;
    v25 = v20;
    v26 = v7;
    objc_msgSend(v17, "preferredChannel:", v21);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

  }
}

void __84__WLDeviceDiscoveryController__queue_startDiscoveryWithPreGeneratedCode_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v4 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithObjects:", v5, 0);

  v8 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  _WLLog();
  objc_msgSend(WeakRetained, "enableSoftAPWithSSID:password:channels:secret:srp:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), WeakRetained, v7, v8, v6);

}

- (void)enableSoftAPWithSSID:(id)a3 password:(id)a4 channels:(id)a5 secret:(id)a6 srp:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id location;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  objc_msgSend(v16, "lastObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeLastObject");
  _WLLog();
  objc_initWeak(&location, self);
  +[WLWiFiController sharedInstance](WLWiFiController, "sharedInstance", self, v14, v15, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __92__WLDeviceDiscoveryController_enableSoftAPWithSSID_password_channels_secret_srp_completion___block_invoke;
  v29[3] = &unk_24E376D28;
  objc_copyWeak(&v37, &location);
  v22 = v14;
  v30 = v22;
  v23 = v15;
  v31 = v23;
  v24 = v16;
  v32 = v24;
  v25 = v17;
  v33 = v25;
  v26 = v18;
  v34 = v26;
  v27 = v19;
  v36 = v27;
  v28 = v20;
  v35 = v28;
  objc_msgSend(v21, "enableSoftAPWithSSID:password:channel:completion:", v22, v23, v28, v29);

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);

}

void __92__WLDeviceDiscoveryController_enableSoftAPWithSSID_password_channels_secret_srp_completion___block_invoke(_QWORD *a1, char a2, uint64_t a3, void *a4)
{
  id *v7;
  id v8;
  uint64_t v9;
  id WeakRetained;

  v7 = (id *)(a1 + 11);
  v8 = a4;
  WeakRetained = objc_loadWeakRetained(v7);
  LOBYTE(v9) = a2;
  objc_msgSend(WeakRetained, "_enableSoftAPWithSSID:password:channels:secret:srp:completion:enabled:error:channel:currentChannel:", a1[4], a1[5], a1[6], a1[7], a1[8], a1[10], v9, v8, a1[9], a3);

}

- (void)_enableSoftAPWithSSID:(id)a3 password:(id)a4 channels:(id)a5 secret:(id)a6 srp:(id)a7 completion:(id)a8 enabled:(BOOL)a9 error:(id)a10 channel:(id)a11 currentChannel:(int64_t)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD block[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44[2];
  BOOL v45;
  id location[2];

  v34 = a3;
  v18 = a4;
  v33 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a10;
  v23 = a11;
  objc_initWeak(location, self);
  -[WLDeviceDiscoveryController queue](self, "queue");
  v24 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __130__WLDeviceDiscoveryController__enableSoftAPWithSSID_password_channels_secret_srp_completion_enabled_error_channel_currentChannel___block_invoke;
  block[3] = &unk_24E376D50;
  objc_copyWeak(v44, location);
  v45 = a9;
  v36 = v22;
  v37 = v33;
  v38 = v23;
  v39 = v34;
  v40 = v18;
  v41 = v19;
  v42 = v20;
  v43 = v21;
  v44[1] = (id)a12;
  v32 = v21;
  v25 = v20;
  v26 = v19;
  v27 = v18;
  v28 = v34;
  v29 = v23;
  v30 = v33;
  v31 = v22;
  dispatch_async(v24, block);

  objc_destroyWeak(v44);
  objc_destroyWeak(location);
}

void __130__WLDeviceDiscoveryController__enableSoftAPWithSSID_password_channels_secret_srp_completion_enabled_error_channel_currentChannel___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  if ((!*(_BYTE *)(a1 + 112) || *(_QWORD *)(a1 + 32)) && objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v5 = *(_QWORD *)(a1 + 48);
    _WLLog();
    objc_msgSend(WeakRetained, "enableSoftAPWithSSID:password:channels:secret:srp:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), WeakRetained, v5);
  }
  else
  {
    v2 = *(id *)(a1 + 48);
    if (*(uint64_t *)(a1 + 104) < 1)
    {
      v4 = WeakRetained;
    }
    else
    {
      v6 = *(_QWORD *)(a1 + 104);
      _WLLog();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 104), WeakRetained, v6);
      v3 = objc_claimAutoreleasedReturnValue();

      v4 = WeakRetained;
      v2 = (id)v3;
    }
    objc_msgSend(v4, "softAPDidStart:ssid:psk:secret:srp:channel:error:completion:", *(unsigned __int8 *)(a1 + 112), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 88));

  }
}

- (void)softAPDidStart:(BOOL)a3 ssid:(id)a4 psk:(id)a5 secret:(id)a6 srp:(id)a7 channel:(id)a8 error:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void (**v23)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  int v24;
  WLDeviceDiscoveryController *v25;
  WLDeviceDiscoveryController *v26;
  uint64_t listenerSocket;
  WLDeviceDiscoveryController *v28;
  uint64_t v29;
  OS_dispatch_source *incomingConnSource;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  WLDeviceDiscoveryController *v38;
  id v39;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x24BDAC8D0];
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v22;
  if (self->_starting)
  {
    if ((objc_msgSend(v16, "isEqualToString:", self->_ssid) & 1) != 0)
    {
      if (a3)
      {
        if (self->_listenerSocket == -1
          && (v24 = -[WLDeviceDiscoveryController createListenerSocketOnPort:](self, "createListenerSocketOnPort:", 59523), self->_listenerSocket = v24, v24 == -1))
        {
          _WLLog();
          if (v23)
            v23[2](v23, 0, 0, 0, 0, -1, 0);
        }
        else
        {
          v25 = self;
          objc_sync_enter(v25);
          v26 = v25;
          listenerSocket = self->_listenerSocket;
          v37[0] = MEMORY[0x24BDAC760];
          v37[1] = 3221225472;
          v37[2] = __91__WLDeviceDiscoveryController_softAPDidStart_ssid_psk_secret_srp_channel_error_completion___block_invoke;
          v37[3] = &unk_24E376D78;
          v28 = v26;
          v38 = v28;
          v39 = v19;
          -[WLDeviceDiscoveryController listenForConnectionOnSocket:withConnectionHandler:](v28, "listenForConnectionOnSocket:withConnectionHandler:", listenerSocket, v37);
          v29 = objc_claimAutoreleasedReturnValue();
          incomingConnSource = v28->_incomingConnSource;
          v28->_incomingConnSource = (OS_dispatch_source *)v29;

          objc_sync_exit(v28);
          if (v23)
            ((void (**)(_QWORD, uint64_t, id, id, id, uint64_t, _QWORD))v23)[2](v23, 1, v16, v17, v18, objc_msgSend(v20, "integerValue"), 0);
        }
      }
      else if (v23)
      {
        ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, id))v23)[2](v23, 0, 0, 0, 0, -1, v21);
      }
    }
    else if (v23)
    {
      _WLLog();
      v34 = (void *)MEMORY[0x24BDD1540];
      v40 = *MEMORY[0x24BDD0FC8];
      v41 = CFSTR("a new SSID was already requested.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1, self);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC2878], 1, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, void *))v23)[2](v23, 0, 0, 0, 0, -1, v36);
    }
  }
  else if (v22)
  {
    _WLLog();
    v31 = (void *)MEMORY[0x24BDD1540];
    v42 = *MEMORY[0x24BDD0FC8];
    v43[0] = CFSTR("it is being stopped.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1, self);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC2878], 1, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, void *))v23)[2](v23, 0, 0, 0, 0, -1, v33);
  }

}

uint64_t __91__WLDeviceDiscoveryController_softAPDidStart_ssid_psk_secret_srp_channel_error_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "listenerDidStart:srp:", a2, *(_QWORD *)(a1 + 40));
}

- (void)listenerDidStart:(int)a3 srp:(id)a4
{
  uint64_t v4;
  uint64_t v6;
  WLDeviceDiscoveryController *v7;
  void (**nextIncomingConnectionHandler)(id, uint64_t, _QWORD);
  id v9;
  WLDeviceDiscoverySocketHandler *v10;
  NSMutableArray *v11;
  WLDeviceDiscoveryController *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = *(_QWORD *)&a3;
  v16 = a4;
  v6 = -[WLDeviceDiscoveryController acceptIncomingConnectionWithListenerSocket:nonBlocking:](self, "acceptIncomingConnectionWithListenerSocket:nonBlocking:", v4, 1);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  if ((_DWORD)v6 != -1)
  {
    v7 = self;
    objc_sync_enter(v7);
    v14 = (void *)MEMORY[0x2207BB4C4](v7->_nextIncomingConnectionHandler);
    _WLLog();

    nextIncomingConnectionHandler = (void (**)(id, uint64_t, _QWORD))v7->_nextIncomingConnectionHandler;
    if (nextIncomingConnectionHandler)
    {
      nextIncomingConnectionHandler[2](nextIncomingConnectionHandler, v6, 0);
      v9 = v7->_nextIncomingConnectionHandler;
      v7->_nextIncomingConnectionHandler = 0;

      objc_sync_exit(v7);
    }
    else
    {
      objc_sync_exit(v7);

      v10 = -[WLDeviceDiscoverySocketHandler initWithSocket:srpPassword:delegate:]([WLDeviceDiscoverySocketHandler alloc], "initWithSocket:srpPassword:delegate:", v6, v16, v7, v7, v14);
      v11 = v7->_socketHandlers;
      objc_sync_enter(v11);
      -[NSMutableArray addObject:](v7->_socketHandlers, "addObject:", v10);
      objc_sync_exit(v11);

      v12 = v7;
      objc_sync_enter(v12);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12->_countOfPairingAttemptsWithCurrentSecret);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _WLLog();

      ++v12->_countOfPairingAttemptsWithCurrentSecret;
      objc_sync_exit(v12);

      -[WLDeviceDiscoverySocketHandler resume](v10, "resume", v12, v15);
      v7 = (WLDeviceDiscoveryController *)v10;
    }

  }
}

- (void)stopDeviceDiscoveryWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__WLDeviceDiscoveryController_stopDeviceDiscoveryWithCompletion___block_invoke;
  block[3] = &unk_24E376908;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __65__WLDeviceDiscoveryController_stopDeviceDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __65__WLDeviceDiscoveryController_stopDeviceDiscoveryWithCompletion___block_invoke_2;
    v3[3] = &unk_24E375C80;
    v4 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "_queue_stopDeviceDiscoveryWithCompletion:", v3);

  }
}

uint64_t __65__WLDeviceDiscoveryController_stopDeviceDiscoveryWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)stopWiFiAndDeviceDiscoveryWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__WLDeviceDiscoveryController_stopWiFiAndDeviceDiscoveryWithCompletion___block_invoke;
  v7[3] = &unk_24E376CD8;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __72__WLDeviceDiscoveryController_stopWiFiAndDeviceDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 8) = 0;
    v5 = *(_QWORD *)(a1 + 32);
    _WLLog();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __72__WLDeviceDiscoveryController_stopWiFiAndDeviceDiscoveryWithCompletion___block_invoke_2;
    v6[3] = &unk_24E376DA0;
    v4 = *(void **)(a1 + 40);
    v6[4] = *(_QWORD *)(a1 + 32);
    v7 = v4;
    objc_msgSend(v3, "_queue_stopWiFiAndDeviceDiscoveryWithCompletion:", v6, v5);
    objc_msgSend(v3[8], "deleteTestAutomationCachesIfNeeded");

  }
}

void __72__WLDeviceDiscoveryController_stopWiFiAndDeviceDiscoveryWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v7);

}

- (void)_queue_stopDeviceDiscoveryWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (void)_queue_stopWiFiAndDeviceDiscoveryWithCompletion:(id)a3
{
  WLDeviceDiscoveryController *v4;
  void (**nextIncomingConnectionHandler)(id, _QWORD, void *);
  void *v6;
  id v7;
  NSObject *incomingConnSource;
  OS_dispatch_source *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = self;
  objc_sync_enter(v4);
  nextIncomingConnectionHandler = (void (**)(id, _QWORD, void *))v4->_nextIncomingConnectionHandler;
  if (nextIncomingConnectionHandler)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC2878], 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    nextIncomingConnectionHandler[2](nextIncomingConnectionHandler, 0, v6);

    v7 = v4->_nextIncomingConnectionHandler;
    v4->_nextIncomingConnectionHandler = 0;

  }
  objc_sync_exit(v4);

  incomingConnSource = v4->_incomingConnSource;
  if (incomingConnSource)
  {
    dispatch_source_cancel(incomingConnSource);
    v9 = v4->_incomingConnSource;
    v4->_incomingConnSource = 0;

  }
  _WLLog();
  +[WLWiFiController sharedInstance](WLWiFiController, "sharedInstance", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "disableSoftAPWithCompletion:", &__block_literal_global_49);

  v11 = v12;
  if (v12)
  {
    (*((void (**)(id, uint64_t, _QWORD))v12 + 2))(v12, 1, 0);
    v11 = v12;
  }

}

- (BOOL)supportsLocalImport
{
  return +[WLLocalDataSource localDataExists](WLLocalDataSource, "localDataExists");
}

- (void)importLocalContent
{
  void *v3;
  void *v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BEC2838]);
  objc_msgSend(v5, "setName:", CFSTR("Local Import"));
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPersistentIdentifier:", v4);

  objc_msgSend(v5, "setIsLocal:", 1);
  _WLLog();
  -[WLDeviceDiscoveryController deviceDiscoverySocketHandler:didFinishHandshakeWithSourceDevice:](self, "deviceDiscoverySocketHandler:didFinishHandshakeWithSourceDevice:", 0, v5, self, v5);

}

- (void)attemptDirectConnectionToAddress:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (objc_class *)MEMORY[0x24BEC2838];
  v5 = a3;
  v11 = objc_alloc_init(v4);
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(":"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIpAddress:", v7);

  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    objc_msgSend(v11, "setHttpPort:", 80);
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHttpPort:", (unsigned __int16)objc_msgSend(v8, "integerValue"));

  }
  objc_msgSend(v11, "setName:", CFSTR("Direct Connection"));
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPersistentIdentifier:", v10);

  _WLLog();
  -[WLDeviceDiscoveryController deviceDiscoverySocketHandler:didFinishHandshakeWithSourceDevice:](self, "deviceDiscoverySocketHandler:didFinishHandshakeWithSourceDevice:", 0, v11, self, v11);

}

- (void)setNextIncomingConnectionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id nextIncomingConnectionHandler;
  WLDeviceDiscoveryController *obj;

  if (a3)
  {
    obj = self;
    v4 = a3;
    objc_sync_enter(obj);
    v5 = MEMORY[0x2207BB4C4](v4);

    nextIncomingConnectionHandler = obj->_nextIncomingConnectionHandler;
    obj->_nextIncomingConnectionHandler = (id)v5;

    objc_sync_exit(obj);
  }
}

- (id)_generatePairingSecret
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%06u"), arc4random_uniform(0xF423Fu));
}

- (id)_ssidWithSecret:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[WLAuthenticationUtilities hashWithString:](WLAuthenticationUtilities, "hashWithString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "substringToIndex:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("iOS %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int)createListenerSocketOnPort:(unint64_t)a3
{
  unsigned int v3;
  int v4;
  int v6;
  int v7;
  sockaddr v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  v4 = socket(2, 1, 0);
  v7 = 1;
  setsockopt(v4, 0xFFFF, 4130, &v7, 4u);
  *(_WORD *)&v8.sa_len = 528;
  *(_WORD *)v8.sa_data = bswap32(v3) >> 16;
  *(_QWORD *)&v8.sa_data[2] = 0;
  *(_DWORD *)&v8.sa_data[10] = 0;
  v6 = 1;
  if (setsockopt(v4, 0xFFFF, 4, &v6, 4u) < 0 || bind(v4, &v8, 0x10u) < 0 || listen(v4, 128) < 0)
  {
    _WLLog();
    return -1;
  }
  return v4;
}

- (id)listenForConnectionOnSocket:(int)a3 withConnectionHandler:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  int v11;

  v5 = a4;
  v6 = dispatch_source_create(MEMORY[0x24BDACA00], a3, 0, MEMORY[0x24BDAC9B8]);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __81__WLDeviceDiscoveryController_listenForConnectionOnSocket_withConnectionHandler___block_invoke;
  v9[3] = &unk_24E376480;
  v10 = v5;
  v11 = a3;
  v7 = v5;
  dispatch_source_set_event_handler(v6, v9);
  dispatch_resume(v6);

  return v6;
}

uint64_t __81__WLDeviceDiscoveryController_listenForConnectionOnSocket_withConnectionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned int *)(a1 + 40));
  return result;
}

- (int)acceptIncomingConnectionWithListenerSocket:(int)a3 nonBlocking:(BOOL)a4
{
  _BOOL4 v4;
  int v6;
  int v7;
  unsigned int v8;
  int v9;
  WLDeviceDiscoveryController *v10;
  id v11;
  in_addr v12;
  void *v13;
  void *v14;
  char v15;
  NSString *allowedAddress;
  in_addr v17;
  in_addr v18;
  socklen_t v20;
  int v21;
  socklen_t v22;
  sockaddr v23;
  sockaddr v24;
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v24.sa_len = 0;
  *(_QWORD *)&v24.sa_data[6] = 0;
  v22 = 16;
  v6 = accept(a3, &v24, &v22);
  v7 = v6;
  if (v6 == -1)
  {
    _WLLog();
    return -1;
  }
  v21 = 1;
  setsockopt(v6, 0xFFFF, 4130, &v21, 4u);
  v8 = fcntl(v7, 3, 0) & 0xFFFFFFFB;
  if (v4)
    v9 = 4;
  else
    v9 = 0;
  if (fcntl(v7, 4, v8 | v9) == -1)
  {
    _WLLog();
    return -1;
  }
  *(_QWORD *)&v23.sa_len = 0;
  *(_QWORD *)&v23.sa_data[6] = 0;
  v20 = 16;
  if (getpeername(v7, &v23, &v20) == -1)
  {
    _WLLog();
    return -1;
  }
  v10 = self;
  objc_sync_enter(v10);
  v11 = objc_alloc(MEMORY[0x24BDD17C8]);
  v12.s_addr = *(_DWORD *)&v23.sa_data[2];
  v13 = (void *)objc_msgSend(v11, "initWithCString:encoding:", inet_ntoa(v12), 4);
  +[WLWiFiController sharedInstance](WLWiFiController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isIPAddressInRange:", v13);

  if ((v15 & 1) == 0)
  {
    _WLLog();
    goto LABEL_15;
  }
  allowedAddress = v10->_allowedAddress;
  if (!allowedAddress)
  {
    _WLLog();
    objc_storeStrong((id *)&v10->_allowedAddress, v13);
    goto LABEL_17;
  }
  if (!-[NSString isEqualToString:](allowedAddress, "isEqualToString:", v13))
  {
LABEL_15:
    v17.s_addr = *(_DWORD *)&v23.sa_data[2];
    inet_ntoa(v17);
    _WLLog();
    close(v7);
    v7 = -1;
  }
LABEL_17:

  objc_sync_exit(v10);
  if (v7 == -1)
    return -1;
  v18.s_addr = *(_DWORD *)&v23.sa_data[2];
  inet_ntoa(v18);
  _WLLog();
  return v7;
}

- (void)_allowConnectionsFromAnyAddress
{
  NSString *allowedAddress;
  WLDeviceDiscoveryController *obj;

  obj = self;
  objc_sync_enter(obj);
  _WLLog();
  allowedAddress = obj->_allowedAddress;
  obj->_allowedAddress = 0;

  objc_sync_exit(obj);
}

- (void)_postSourceDevicesDidChangeNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x24BEC28B0], 0, 0, 1u);
}

- (void)deviceDiscoverySocketHandler:(id)a3 didDiscoverCandidate:(id)a4
{
  id v6;
  NSMutableArray *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v9;

  v9 = a3;
  v6 = a4;
  _WLLog();
  v7 = self->_sourceDevices;
  objc_sync_enter(v7);
  -[NSMutableArray removeAllObjects](self->_sourceDevices, "removeAllObjects", self, v6);
  -[NSMutableArray addObject:](self->_sourceDevices, "addObject:", v6);
  objc_sync_exit(v7);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x24BEC28A8], 0, 0, 1u);

}

- (void)deviceDiscoverySocketHandler:(id)a3 didFinishHandshakeWithSourceDevice:(id)a4
{
  id v6;
  NSMutableArray *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  _WLLog();
  v7 = self->_sourceDevices;
  objc_sync_enter(v7);
  -[NSMutableArray removeAllObjects](self->_sourceDevices, "removeAllObjects", self, v6);
  -[NSMutableArray addObject:](self->_sourceDevices, "addObject:", v6);
  objc_sync_exit(v7);

  -[WLDeviceDiscoveryController _postSourceDevicesDidChangeNotification](self, "_postSourceDevicesDidChangeNotification");
}

- (void)deviceDiscoverySocketHandler:(id)a3 didFailToHandshakeWithSourceDevice:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableArray *v11;
  void *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD v14[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  _WLLog();
  close(objc_msgSend(v8, "sockfd", self, v9, v10));
  objc_msgSend(v8, "suspend");
  v11 = self->_socketHandlers;
  objc_sync_enter(v11);
  -[NSMutableArray removeObject:](self->_socketHandlers, "removeObject:", v8);
  objc_sync_exit(v11);

  -[WLDeviceDiscoveryController _allowConnectionsFromAnyAddress](self, "_allowConnectionsFromAnyAddress");
  objc_msgSend(MEMORY[0x24BEC2850], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deviceDidFailWithAuthenticationError");

  _WLLog();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x24BEC28B8], 0, 0, 1u);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __101__WLDeviceDiscoveryController_deviceDiscoverySocketHandler_didFailToHandshakeWithSourceDevice_error___block_invoke;
  v14[3] = &unk_24E3765B8;
  v14[4] = self;
  -[WLDeviceDiscoveryController stopWiFiAndDeviceDiscoveryWithCompletion:](self, "stopWiFiAndDeviceDiscoveryWithCompletion:", v14, self);

}

void __101__WLDeviceDiscoveryController_deviceDiscoverySocketHandler_didFailToHandshakeWithSourceDevice_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithBool:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_automation, 0);
  objc_storeStrong(&self->_nextIncomingConnectionHandler, 0);
  objc_storeStrong((id *)&self->_incomingConnSource, 0);
  objc_storeStrong((id *)&self->_sourceDevices, 0);
  objc_storeStrong((id *)&self->_socketHandlers, 0);
  objc_storeStrong((id *)&self->_allowedAddress, 0);
}

@end
