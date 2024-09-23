@implementation WLWiFiController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_4);
  return (id)sharedInstance_instance;
}

void __34__WLWiFiController_sharedInstance__block_invoke()
{
  WLWiFiController *v0;
  void *v1;

  v0 = objc_alloc_init(WLWiFiController);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (WLWiFiController)init
{
  WLWiFiManager *v3;
  WLNETRBClient *v4;
  WLWiFiController *v5;

  v3 = objc_alloc_init(WLWiFiManager);
  v4 = objc_alloc_init(WLNETRBClient);
  v5 = -[WLWiFiController _initWithWiFiManager:netrbClient:](self, "_initWithWiFiManager:netrbClient:", v3, v4);

  return v5;
}

- (id)_initWithWiFiManager:(id)a3 netrbClient:(id)a4
{
  id v7;
  id v8;
  WLWiFiController *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *requestQueue;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WLWiFiController;
  v9 = -[WLWiFiController init](&v13, sel_init);
  if (v9)
  {
    v10 = dispatch_queue_create("com.apple.welcomekitcore.wificontroller.requestqueue", 0);
    requestQueue = v9->_requestQueue;
    v9->_requestQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_wifiManager, a3);
    objc_storeStrong((id *)&v9->_netrbClient, a4);
  }

  return v9;
}

- (unint64_t)_newRequestID
{
  WLWiFiController *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_lastRequestID + 1;
  v2->_lastRequestID = v3;
  objc_sync_exit(v2);

  return v3;
}

- (void)enableSoftAPWithSSID:(id)a3 password:(id)a4 channel:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t, uint64_t, _QWORD);
  NSObject *requestQueue;
  unint64_t v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  void (**v20)(id, uint64_t, uint64_t, _QWORD);
  unint64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t, uint64_t, _QWORD))a6;
  _WLLog();
  if (objc_msgSend(MEMORY[0x24BEC2830], "BOOLForKey:", *MEMORY[0x24BEC2868], self) == 1)
  {
    _WLLog();
    v13[2](v13, 1, -1, 0);
  }
  else if (-[WLWiFiController hasSoftAPCapability](self, "hasSoftAPCapability") && objc_msgSend(v10, "length"))
  {
    v15 = -[WLWiFiController _newRequestID](self, "_newRequestID");
    _WLLog();
    requestQueue = self->_requestQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__WLWiFiController_enableSoftAPWithSSID_password_channel_completion___block_invoke;
    block[3] = &unk_24E375C58;
    v21 = v15;
    block[4] = self;
    v17 = v10;
    v18 = v11;
    v19 = v12;
    v20 = v13;
    dispatch_async(requestQueue, block);

  }
  else
  {
    _WLLog();
    v13[2](v13, 0, -1, 0);
  }

}

void __69__WLWiFiController_enableSoftAPWithSSID_password_channel_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v5 = *(_QWORD *)(a1 + 72);
  _WLLog();
  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(a1 + 32), "_ensureStartedNetworkReflectsPreferences", v5);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__WLWiFiController_enableSoftAPWithSSID_password_channel_completion___block_invoke_2;
  v6[3] = &unk_24E375C30;
  v2 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v2;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v3 = *(id *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 72);
  v11 = v3;
  v12 = v4;
  objc_msgSend(v7, "_disableSoftAPWithCompletion:", v6);

}

void __69__WLWiFiController_enableSoftAPWithSSID_password_channel_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__WLWiFiController_enableSoftAPWithSSID_password_channel_completion___block_invoke_3;
  v8[3] = &unk_24E375C08;
  v6 = *(id *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  v9 = v6;
  v10 = v7;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "_enableSoftAPWithSSID:password:channel:completion:", v3, v4, v5, v8);

}

void __69__WLWiFiController_enableSoftAPWithSSID_password_channel_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _WLLog();
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)_enableSoftAPWithSSID:(id)a3 password:(id)a4 channel:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v10 = a6;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __70__WLWiFiController__enableSoftAPWithSSID_password_channel_completion___block_invoke;
  v12[3] = &unk_24E375CD0;
  v12[4] = self;
  v13 = v10;
  v11 = v10;
  -[WLWiFiController _startWiFiWithSSID:password:channel:completion:](self, "_startWiFiWithSSID:password:channel:completion:", a3, a4, a5, v12);

}

void __70__WLWiFiController__enableSoftAPWithSSID_password_channel_completion___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  v7 = a4;
  _WLLog();
  if (a2)
  {
    v8 = *(void **)(a1 + 40);
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __70__WLWiFiController__enableSoftAPWithSSID_password_channel_completion___block_invoke_2;
    v10[3] = &unk_24E375CA8;
    v11 = v8;
    v12 = a3;
    v10[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v9, "startDHCPWithCompletion:", v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __70__WLWiFiController__enableSoftAPWithSSID_password_channel_completion___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  if (a2)
  {
    _WLLog();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    _WLLog();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __70__WLWiFiController__enableSoftAPWithSSID_password_channel_completion___block_invoke_3;
    v4[3] = &unk_24E375C80;
    v3 = *(void **)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    objc_msgSend(v3, "_stopWiFiWithCompletion:", v4);

  }
}

uint64_t __70__WLWiFiController__enableSoftAPWithSSID_password_channel_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)disableSoftAPWithCompletion:(id)a3
{
  id v4;
  NSObject *requestQueue;
  id v6;
  unint64_t v7;
  _QWORD block[5];
  id v9;
  unint64_t v10;

  v4 = a3;
  v7 = -[WLWiFiController _newRequestID](self, "_newRequestID");
  _WLLog();
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__WLWiFiController_disableSoftAPWithCompletion___block_invoke;
  block[3] = &unk_24E375D20;
  v9 = v4;
  v10 = v7;
  block[4] = self;
  v6 = v4;
  dispatch_async(requestQueue, block);

}

void __48__WLWiFiController_disableSoftAPWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a1 + 48);
  _WLLog();
  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(a1 + 32), "_ensureStartedNetworkReflectsPreferences", v5);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__WLWiFiController_disableSoftAPWithCompletion___block_invoke_2;
  v6[3] = &unk_24E375CF8;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v7 = v3;
  v8 = v4;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "_disableSoftAPWithCompletion:", v6);

}

void __48__WLWiFiController_disableSoftAPWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _WLLog();
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)_disableSoftAPWithCompletion:(id)a3
{
  id v4;
  WLWiFiController *v5;
  WLWiFiNetwork *startedNetwork;
  WLNETRBClient *netrbClient;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  startedNetwork = v5->_startedNetwork;
  objc_sync_exit(v5);

  _WLLog();
  if (startedNetwork)
  {
    netrbClient = v5->_netrbClient;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __49__WLWiFiController__disableSoftAPWithCompletion___block_invoke;
    v8[3] = &unk_24E375D70;
    v8[4] = v5;
    v9 = v4;
    -[WLNETRBClient stopDHCPWithCompletion:](netrbClient, "stopDHCPWithCompletion:", v8);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
  }

}

void __49__WLWiFiController__disableSoftAPWithCompletion___block_invoke(uint64_t a1, unsigned int a2)
{
  char v2;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  char v8;

  v2 = a2;
  v5 = a2;
  _WLLog();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__WLWiFiController__disableSoftAPWithCompletion___block_invoke_2;
  v6[3] = &unk_24E375D48;
  v8 = v2;
  v4 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "_stopWiFiWithCompletion:", v6, v5);

}

void __49__WLWiFiController__disableSoftAPWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  _WLLog();
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2);

}

- (void)_ensureStartedNetworkReflectsPreferences
{
  WLWiFiController *v2;
  id *p_startedNetwork;
  WLWiFiNetwork *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WLWiFiController *v9;
  WLWiFiNetwork *v10;

  if (!self->_didConsultPreferencesForStartedNetwork)
  {
    self->_didConsultPreferencesForStartedNetwork = 1;
    v2 = self;
    objc_sync_enter(v2);
    p_startedNetwork = (id *)&v2->_startedNetwork;
    v10 = v2->_startedNetwork;
    objc_sync_exit(v2);

    v4 = v10;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringForKey:", *MEMORY[0x24BEC2860]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[WLWiFiManager createDeviceClient](v2->_wifiManager, "createDeviceClient");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "hostedNetworkMatchingSSID:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = v2;
          objc_sync_enter(v9);
          objc_storeStrong(p_startedNetwork, v8);
          objc_sync_exit(v9);

        }
      }

      v4 = 0;
    }

  }
}

- (id)_startedNetwork
{
  NSObject *requestQueue;
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
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  requestQueue = self->_requestQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __35__WLWiFiController__startedNetwork__block_invoke;
  v5[3] = &unk_24E375D98;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(requestQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __35__WLWiFiController__startedNetwork__block_invoke(uint64_t a1)
{
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "_ensureStartedNetworkReflectsPreferences");
  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_sync_exit(obj);

}

- (BOOL)hasSoftAPCapability
{
  return -[WLWiFiManager isTetheringSupported](self->_wifiManager, "isTetheringSupported");
}

- (void)_startWiFiWithSSID:(id)a3 password:(id)a4 channel:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[WLWiFiManager createDeviceClient](self->_wifiManager, "createDeviceClient");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[WLWiFiController _networkRecordFromSSID:password:channel:](self, "_networkRecordFromSSID:password:channel:", v10, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __67__WLWiFiController__startWiFiWithSSID_password_channel_completion___block_invoke;
    v16[3] = &unk_24E375DC0;
    v16[4] = self;
    v17 = v13;
    objc_msgSend(v14, "startNetworkWithHostRole:request:completion:", 2, v15, v16);

  }
  else
  {
    _WLLog();
    (*((void (**)(id, _QWORD, uint64_t, _QWORD))v13 + 2))(v13, 0, -1, 0);
  }

}

void __67__WLWiFiController__startWiFiWithSSID_password_channel_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  id v10;

  v3 = a2;
  v9 = v3 != 0;
  _WLLog();
  if (v3)
  {
    objc_msgSend(v3, "ssid", v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, *MEMORY[0x24BEC2860]);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults", v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", *MEMORY[0x24BEC2860]);
  }

  v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;
  v10 = v3;

  objc_sync_exit(v6);
  (*(void (**)(_QWORD, BOOL, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3 != 0, objc_msgSend(v10, "channel"), 0);

}

- (id)_networkRecordFromSSID:(id)a3 password:(id)a4 channel:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCED8];
  v8 = a5;
  objc_msgSend(v7, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("HIDDEN_NETWORK"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("AP_MODE_AUTH_LOWER"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("AP_MODE_AUTH_UPPER"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("AP_MODE_CYPHER_TYPE"));

  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v6, CFSTR("SSID_STR"));
  objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("AP_MODE_SSID_BYTES"));
  objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("CHANNEL"));

  v14 = v6;
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", 8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v15, CFSTR("AP_MODE_AUTH_UPPER"));

    objc_msgSend(v9, "setObject:forKey:", v14, CFSTR("AP_MODE_KEY"));
  }
  v16 = (void *)objc_msgSend(v9, "copy");

  return v16;
}

- (void)_stopWiFiWithCompletion:(id)a3
{
  id v4;
  void *v5;
  WLWiFiController *v6;
  WLWiFiNetwork *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  _WLLog();
  -[WLWiFiManager createDeviceClient](self->_wifiManager, "createDeviceClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = self;
    objc_sync_enter(v6);
    v7 = v6->_startedNetwork;
    objc_sync_exit(v6);

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __44__WLWiFiController__stopWiFiWithCompletion___block_invoke;
    v8[3] = &unk_24E375D70;
    v8[4] = v6;
    v9 = v4;
    objc_msgSend(v5, "stopNetwork:completion:", v7, v8);

  }
  else
  {
    _WLLog();
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

uint64_t __44__WLWiFiController__stopWiFiWithCompletion___block_invoke(uint64_t a1, unsigned int a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;

  v9 = a2;
  _WLLog();
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults", v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", *MEMORY[0x24BEC2860]);

    v5 = *(id *)(a1 + 32);
    objc_sync_enter(v5);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

    objc_sync_exit(v5);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)isIPAddressInRange:(id)a3
{
  return -[WLNETRBClient isIPAddressInRange:](self->_netrbClient, "isIPAddressInRange:", a3);
}

- (void)preferredChannel:(id)a3
{
  -[WLWiFiManager preferredChannel:](self->_wifiManager, "preferredChannel:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netrbClient, 0);
  objc_storeStrong((id *)&self->_startedNetwork, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
}

@end
