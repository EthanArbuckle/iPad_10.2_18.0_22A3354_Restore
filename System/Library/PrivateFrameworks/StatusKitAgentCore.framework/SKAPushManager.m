@implementation SKAPushManager

- (SKAPushManager)initWithQueue:(id)a3 systemMonitor:(id)a4 inTrafficMode:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  SKAPushManager *v11;
  SKAPushManager *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  FTMessageDelivery *messageDelivery;
  NSObject *v19;
  uint8_t v21[16];
  objc_super v22;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SKAPushManager;
  v11 = -[SKAPushManager init](&v22, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queue, a3);
    objc_storeStrong((id *)&v12->_systemMonitor, a4);
    -[SKASystemMonitor addListener:](v12->_systemMonitor, "addListener:", v12);
    -[SKAPushManager _initializeAPSConnection](v12, "_initializeAPSConnection");
    -[SKAPushManager _pushEnvironment](v12, "_pushEnvironment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x24BE08738]);
    v15 = (void *)objc_msgSend(v14, "initWithEnvironmentName:namedDelegatePort:queue:", v13, *MEMORY[0x24BE08708], v9);
    -[objc_class sharedInstance](NSClassFromString(CFSTR("IMMobileNetworkManager")), "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BE30350]), "initWithAPSConnection:mobileNetworkManager:", v15, v16);
    messageDelivery = v12->_messageDelivery;
    v12->_messageDelivery = (FTMessageDelivery *)v17;

    v12->_trafficModeEnabled = v5;
    if (v5)
    {
      +[SKAPushManager logger](SKAPushManager, "logger");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_2188DF000, v19, OS_LOG_TYPE_DEFAULT, "In Traffic Mode--will not honor status subscriptions and will drop incoming status's", v21, 2u);
      }

    }
  }

  return v12;
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  NSObject *v3;
  uint8_t v4[16];

  +[SKAPushManager logger](SKAPushManager, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "Received did leave first unlock notification.", v4, 2u);
  }

  -[SKAPushManager _initializeAPSConnection](self, "_initializeAPSConnection");
}

- (void)_initializeAPSConnection
{
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  APSConnection *v6;
  APSConnection *connection;
  void *v8;
  APSConnection *v9;
  void *v10;
  uint8_t v11[16];
  const __CFString *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  if (!self->_connection)
  {
    v3 = -[SKASystemMonitor isUnderFirstDataProtectionLock](self->_systemMonitor, "isUnderFirstDataProtectionLock");
    +[SKAPushManager logger](SKAPushManager, "logger");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Deferring connection initialization as device is before first unlock.", v11, 2u);
      }
    }
    else
    {
      if (v5)
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Initializing APS connection.", v11, 2u);
      }

      -[SKAPushManager _pushEnvironment](self, "_pushEnvironment");
      v4 = objc_claimAutoreleasedReturnValue();
      v6 = (APSConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BE08738]), "initWithEnvironmentName:namedDelegatePort:queue:", v4, CFSTR("com.apple.aps.StatusKit"), self->_queue);
      connection = self->_connection;
      self->_connection = v6;

      -[APSConnection setDelegate:](self->_connection, "setDelegate:", self);
      v13[0] = CFSTR("com.apple.icloud.presence.mode.status");
      v13[1] = CFSTR("com.apple.icloud.presence.shared.experience");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[APSConnection _setNonWakingTopics:](self->_connection, "_setNonWakingTopics:", v8);

      v9 = self->_connection;
      v12 = CFSTR("com.apple.icloud.presence.mode.status");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[APSConnection setUltraConstrainedTopics:](v9, "setUltraConstrainedTopics:", v10);

      -[APSConnection setTrackActivityPresence:](self->_connection, "setTrackActivityPresence:", 0);
    }

  }
}

- (id)_pushEnvironment
{
  int AppBooleanValue;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  BOOL v6;
  id *v7;
  uint8_t v9[16];
  uint8_t buf[15];
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("useSandbox"), CFSTR("com.apple.StatusKitAgent"), &keyExistsAndHasValidFormat);
  v3 = keyExistsAndHasValidFormat;
  +[SKAPushManager logger](SKAPushManager, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
    v6 = AppBooleanValue == 0;
  else
    v6 = 1;
  if (v6)
  {
    if (v5)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Using production push environment", v9, 2u);
    }
    v7 = (id *)MEMORY[0x24BE08720];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Using sandbox push environment", buf, 2u);
    }
    v7 = (id *)MEMORY[0x24BE08718];
  }

  return *v7;
}

- (void)createChannelWithProtoData:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  NSObject *v8;
  void *v9;
  uint64_t v10;
  OS_dispatch_queue *v11;
  void *v12;
  uint64_t v13;
  OS_dispatch_queue *v14;
  NSObject *v15;
  NSObject *queue;
  id v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[16];
  _QWORD v23[4];
  OS_dispatch_queue *v24;
  void (**v25)(id, _QWORD, id);

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if (-[SKAPushManager _sharedChannelsIsDisabledByServer](self, "_sharedChannelsIsDisabledByServer"))
  {
    +[SKAPushManager logger](SKAPushManager, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SKAPushManager createChannelWithProtoData:completion:].cold.1();

    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = -999;
LABEL_16:
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("SKPushManagerErrorDomain"), v10, 0);
    v14 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v14);
    goto LABEL_17;
  }
  if (!self->_connection)
  {
    +[SKAPushManager logger](SKAPushManager, "logger");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[SKAPushManager createChannelWithProtoData:completion:].cold.3();

    if (!-[SKASystemMonitor isUnderFirstDataProtectionLock](self->_systemMonitor, "isUnderFirstDataProtectionLock"))
    {
      +[SKAPushManager logger](SKAPushManager, "logger");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        -[SKAPushManager createChannelWithProtoData:completion:].cold.2();

    }
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = -1000;
    goto LABEL_16;
  }
  v11 = self->_queue;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE30380]), "initWithProtoData:messageType:", v6, 1);
  v13 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __56__SKAPushManager_createChannelWithProtoData_completion___block_invoke;
  v23[3] = &unk_24D9774C0;
  v14 = v11;
  v24 = v14;
  v25 = v7;
  objc_msgSend(v12, "setCompletionBlock:", v23);
  objc_msgSend(v12, "setTimeout:", 5.0);
  +[SKAPushManager logger](SKAPushManager, "logger");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v15, OS_LOG_TYPE_DEFAULT, "Sending create channel message.", buf, 2u);
  }

  queue = self->_queue;
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __56__SKAPushManager_createChannelWithProtoData_completion___block_invoke_26;
  v20[3] = &unk_24D9774E8;
  v20[4] = self;
  v21 = v12;
  v17 = v12;
  dispatch_async(queue, v20);

LABEL_17:
}

void __56__SKAPushManager_createChannelWithProtoData_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id *v18;
  NSObject *v19;
  id *v20;
  _QWORD *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[16];
  _QWORD v26[4];
  id v27;
  id v28;

  v7 = a2;
  v8 = a3;
  v9 = v7;
  +[SKAPushManager logger](SKAPushManager, "logger");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a4)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __56__SKAPushManager_createChannelWithProtoData_completion___block_invoke_cold_1((uint64_t)v8, v11, v12, v13, v14, v15, v16, v17);

    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __56__SKAPushManager_createChannelWithProtoData_completion___block_invoke_22;
    v26[3] = &unk_24D976FE0;
    v18 = &v28;
    v19 = *(NSObject **)(a1 + 32);
    v28 = *(id *)(a1 + 40);
    v20 = &v27;
    v27 = v8;
    v21 = v26;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Create channel reverse push completed, calling completion with proto response", buf, 2u);
    }

    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __56__SKAPushManager_createChannelWithProtoData_completion___block_invoke_24;
    v22[3] = &unk_24D976FE0;
    v18 = &v24;
    v19 = *(NSObject **)(a1 + 32);
    v24 = *(id *)(a1 + 40);
    v20 = &v23;
    v23 = v9;
    v21 = v22;
  }
  dispatch_async(v19, v21);

}

uint64_t __56__SKAPushManager_createChannelWithProtoData_completion___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __56__SKAPushManager_createChannelWithProtoData_completion___block_invoke_24(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "protoResponse");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

void __56__SKAPushManager_createChannelWithProtoData_completion___block_invoke_26(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "messageDelivery");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendMessage:", *(_QWORD *)(a1 + 40));

}

- (void)switchStatusFilterToNonwaking
{
  -[SKAPushManager _switchFilterToNonwakingForTopic:](self, "_switchFilterToNonwakingForTopic:", CFSTR("com.apple.icloud.presence.mode.status"));
}

- (void)switchStatusFilterToEnabled
{
  -[SKAPushManager _switchFilterToEnabledForTopic:](self, "_switchFilterToEnabledForTopic:", CFSTR("com.apple.icloud.presence.mode.status"));
}

- (void)switchPresenceFilterToNonwaking
{
  -[SKAPushManager _switchFilterToNonwakingForTopic:](self, "_switchFilterToNonwakingForTopic:", CFSTR("com.apple.icloud.presence.shared.experience"));
}

- (void)switchPresenceFilterToEnabled
{
  -[SKAPushManager _switchFilterToEnabledForTopic:](self, "_switchFilterToEnabledForTopic:", CFSTR("com.apple.icloud.presence.shared.experience"));
}

- (void)_switchFilterToNonwakingForTopic:(id)a3
{
  id v4;
  APSConnection *connection;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  connection = self->_connection;
  +[SKAPushManager logger](SKAPushManager, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (connection)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Switching %@ to non-waking", (uint8_t *)&v12, 0xCu);
    }

    -[APSConnection nonWakingTopics](self->_connection, "nonWakingTopics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "mutableCopy");

    -[APSConnection enabledTopics](self->_connection, "enabledTopics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    if (!-[NSObject containsObject:](v9, "containsObject:", v4)
      || objc_msgSend(v11, "containsObject:", v4))
    {
      if (objc_msgSend(v11, "containsObject:", v4))
        objc_msgSend(v11, "removeObject:", v4);
      if ((-[NSObject containsObject:](v9, "containsObject:", v4) & 1) == 0)
        -[NSObject addObject:](v9, "addObject:", v4);
      -[APSConnection setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:](self->_connection, "setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:", v11, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], v9);
    }

LABEL_17:
    goto LABEL_18;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[SKAPushManager createChannelWithProtoData:completion:].cold.3();

  if (!-[SKASystemMonitor isUnderFirstDataProtectionLock](self->_systemMonitor, "isUnderFirstDataProtectionLock"))
  {
    +[SKAPushManager logger](SKAPushManager, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[SKAPushManager createChannelWithProtoData:completion:].cold.2();
    goto LABEL_17;
  }
LABEL_18:

}

- (void)_switchFilterToEnabledForTopic:(id)a3
{
  id v4;
  APSConnection *connection;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  connection = self->_connection;
  +[SKAPushManager logger](SKAPushManager, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (connection)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Switching %@ to enabled", (uint8_t *)&v12, 0xCu);
    }

    -[APSConnection nonWakingTopics](self->_connection, "nonWakingTopics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "mutableCopy");

    -[APSConnection enabledTopics](self->_connection, "enabledTopics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    if ((-[NSObject containsObject:](v9, "containsObject:", v4) & 1) != 0
      || (objc_msgSend(v11, "containsObject:", v4) & 1) == 0)
    {
      if (-[NSObject containsObject:](v9, "containsObject:", v4))
        -[NSObject removeObject:](v9, "removeObject:", v4);
      if ((objc_msgSend(v11, "containsObject:", v4) & 1) == 0)
        objc_msgSend(v11, "addObject:", v4);
      -[APSConnection setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:](self->_connection, "setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:", v11, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], v9);
    }

LABEL_17:
    goto LABEL_18;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[SKAPushManager createChannelWithProtoData:completion:].cold.3();

  if (!-[SKASystemMonitor isUnderFirstDataProtectionLock](self->_systemMonitor, "isUnderFirstDataProtectionLock"))
  {
    +[SKAPushManager logger](SKAPushManager, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[SKAPushManager createChannelWithProtoData:completion:].cold.2();
    goto LABEL_17;
  }
LABEL_18:

}

- (void)publishStatus:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  OS_dispatch_queue *v12;
  APSConnection *connection;
  NSObject *v14;
  NSObject *v15;
  OS_dispatch_queue *v16;
  void *v17;
  uint64_t v18;
  NSObject *queue;
  id v20;
  NSObject *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  OS_dispatch_queue *v25;
  void (**v26)(id, _QWORD, id);
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if (-[SKAPushManager _sharedChannelsIsDisabledByServer](self, "_sharedChannelsIsDisabledByServer"))
  {
    +[SKAPushManager logger](SKAPushManager, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SKAPushManager createChannelWithProtoData:completion:].cold.1();

    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = -999;
LABEL_9:
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("SKPushManagerErrorDomain"), v10, 0);
    v12 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v12);
    goto LABEL_10;
  }
  if (self->_trafficModeEnabled)
  {
    +[SKAPushManager logger](SKAPushManager, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SKAPushManager publishStatus:completion:].cold.4();

    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = -1001;
    goto LABEL_9;
  }
  connection = self->_connection;
  +[SKAPushManager logger](SKAPushManager, "logger");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!connection)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SKAPushManager createChannelWithProtoData:completion:].cold.3();

    if (!-[SKASystemMonitor isUnderFirstDataProtectionLock](self->_systemMonitor, "isUnderFirstDataProtectionLock"))
    {
      +[SKAPushManager logger](SKAPushManager, "logger");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        -[SKAPushManager createChannelWithProtoData:completion:].cold.2();

    }
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = -1000;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v15, OS_LOG_TYPE_DEFAULT, "Publishing status", buf, 2u);
  }

  v16 = self->_queue;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE30380]), "initWithProtoData:messageType:", v6, 2);
  v18 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __43__SKAPushManager_publishStatus_completion___block_invoke;
  v24[3] = &unk_24D9774C0;
  v25 = v16;
  v26 = v7;
  v12 = v16;
  objc_msgSend(v17, "setCompletionBlock:", v24);
  objc_msgSend(v17, "setTimeout:", 5.0);
  queue = self->_queue;
  v22[0] = v18;
  v22[1] = 3221225472;
  v22[2] = __43__SKAPushManager_publishStatus_completion___block_invoke_2;
  v22[3] = &unk_24D9774E8;
  v22[4] = self;
  v23 = v17;
  v20 = v17;
  dispatch_async(queue, v22);

LABEL_10:
}

void __43__SKAPushManager_publishStatus_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id *v12;
  NSObject *v13;
  id *v14;
  _QWORD *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[16];
  _QWORD v20[4];
  id v21;
  id v22;

  v7 = a2;
  v8 = a3;
  v9 = v7;
  +[SKAPushManager logger](SKAPushManager, "logger");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a4)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __43__SKAPushManager_publishStatus_completion___block_invoke_cold_1();

    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __43__SKAPushManager_publishStatus_completion___block_invoke_27;
    v20[3] = &unk_24D976FE0;
    v12 = &v22;
    v13 = *(NSObject **)(a1 + 32);
    v22 = *(id *)(a1 + 40);
    v14 = &v21;
    v21 = v8;
    v15 = v20;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Publishing status, reverse push completed, calling completion with protobuf response data", buf, 2u);
    }

    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __43__SKAPushManager_publishStatus_completion___block_invoke_28;
    v16[3] = &unk_24D976FE0;
    v12 = &v18;
    v13 = *(NSObject **)(a1 + 32);
    v18 = *(id *)(a1 + 40);
    v14 = &v17;
    v17 = v9;
    v15 = v16;
  }
  dispatch_async(v13, v15);

}

uint64_t __43__SKAPushManager_publishStatus_completion___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __43__SKAPushManager_publishStatus_completion___block_invoke_28(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "protoResponse");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

void __43__SKAPushManager_publishStatus_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "messageDelivery");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendMessage:", *(_QWORD *)(a1 + 40));

}

- (void)provisionPayload:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  OS_dispatch_queue *v12;
  APSConnection *connection;
  NSObject *v14;
  NSObject *v15;
  OS_dispatch_queue *v16;
  void *v17;
  uint64_t v18;
  NSObject *queue;
  id v20;
  NSObject *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  OS_dispatch_queue *v25;
  void (**v26)(id, _QWORD, id);
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if (-[SKAPushManager _sharedChannelsIsDisabledByServer](self, "_sharedChannelsIsDisabledByServer"))
  {
    +[SKAPushManager logger](SKAPushManager, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SKAPushManager createChannelWithProtoData:completion:].cold.1();

    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = -999;
LABEL_9:
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("SKPushManagerErrorDomain"), v10, 0);
    v12 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v12);
    goto LABEL_10;
  }
  if (self->_trafficModeEnabled)
  {
    +[SKAPushManager logger](SKAPushManager, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SKAPushManager provisionPayload:completion:].cold.4();

    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = -1001;
    goto LABEL_9;
  }
  connection = self->_connection;
  +[SKAPushManager logger](SKAPushManager, "logger");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!connection)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SKAPushManager createChannelWithProtoData:completion:].cold.3();

    if (!-[SKASystemMonitor isUnderFirstDataProtectionLock](self->_systemMonitor, "isUnderFirstDataProtectionLock"))
    {
      +[SKAPushManager logger](SKAPushManager, "logger");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        -[SKAPushManager createChannelWithProtoData:completion:].cold.2();

    }
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = -1000;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v15, OS_LOG_TYPE_DEFAULT, "Provisioning", buf, 2u);
  }

  v16 = self->_queue;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE30380]), "initWithProtoData:messageType:", v6, 3);
  v18 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __46__SKAPushManager_provisionPayload_completion___block_invoke;
  v24[3] = &unk_24D9774C0;
  v25 = v16;
  v26 = v7;
  v12 = v16;
  objc_msgSend(v17, "setCompletionBlock:", v24);
  objc_msgSend(v17, "setTimeout:", 5.0);
  queue = self->_queue;
  v22[0] = v18;
  v22[1] = 3221225472;
  v22[2] = __46__SKAPushManager_provisionPayload_completion___block_invoke_2;
  v22[3] = &unk_24D9774E8;
  v22[4] = self;
  v23 = v17;
  v20 = v17;
  dispatch_async(queue, v22);

LABEL_10:
}

void __46__SKAPushManager_provisionPayload_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id *v12;
  NSObject *v13;
  id *v14;
  _QWORD *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[16];
  _QWORD v20[4];
  id v21;
  id v22;

  v7 = a2;
  v8 = a3;
  v9 = v7;
  +[SKAPushManager logger](SKAPushManager, "logger");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a4)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __46__SKAPushManager_provisionPayload_completion___block_invoke_cold_1();

    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __46__SKAPushManager_provisionPayload_completion___block_invoke_29;
    v20[3] = &unk_24D976FE0;
    v12 = &v22;
    v13 = *(NSObject **)(a1 + 32);
    v22 = *(id *)(a1 + 40);
    v14 = &v21;
    v21 = v8;
    v15 = v20;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Provisioning, reverse push completed, calling completion with protobuf response data", buf, 2u);
    }

    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __46__SKAPushManager_provisionPayload_completion___block_invoke_30;
    v16[3] = &unk_24D976FE0;
    v12 = &v18;
    v13 = *(NSObject **)(a1 + 32);
    v18 = *(id *)(a1 + 40);
    v14 = &v17;
    v17 = v9;
    v15 = v16;
  }
  dispatch_async(v13, v15);

}

uint64_t __46__SKAPushManager_provisionPayload_completion___block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __46__SKAPushManager_provisionPayload_completion___block_invoke_30(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "protoResponse");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

void __46__SKAPushManager_provisionPayload_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "messageDelivery");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendMessage:", *(_QWORD *)(a1 + 40));

}

- (void)enableActivityTracking
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Asked to enable activity tracking but we're missing a connection.  Likely before first unlock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)disableActivityTracking
{
  APSConnection *connection;
  NSObject *v4;

  connection = self->_connection;
  if (connection)
  {
    if (-[APSConnection trackActivityPresence](connection, "trackActivityPresence"))
      -[APSConnection setTrackActivityPresence:](self->_connection, "setTrackActivityPresence:", 0);
  }
  else
  {
    +[SKAPushManager logger](SKAPushManager, "logger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SKAPushManager enableActivityTracking].cold.1();

  }
}

- (id)pushToken
{
  APSConnection *connection;
  void *v3;
  NSObject *v4;

  connection = self->_connection;
  if (connection)
  {
    -[APSConnection publicToken](connection, "publicToken");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[SKAPushManager logger](SKAPushManager, "logger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SKAPushManager pushToken].cold.1();

    v3 = 0;
  }
  return v3;
}

- (void)sendPresenceMessage:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  NSObject *v8;
  void *v9;
  uint64_t v10;
  APSConnection *connection;
  NSObject *v12;
  NSObject *v13;
  OS_dispatch_queue *v14;
  void *v15;
  uint64_t v16;
  OS_dispatch_queue *v17;
  NSObject *queue;
  id v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  OS_dispatch_queue *v24;
  void (**v25)(id, _QWORD, id);
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if (-[SKAPushManager _sharedChannelsIsDisabledByServer](self, "_sharedChannelsIsDisabledByServer"))
  {
    +[SKAPushManager logger](SKAPushManager, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SKAPushManager createChannelWithProtoData:completion:].cold.1();

    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = -999;
LABEL_16:
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("SKPushManagerErrorDomain"), v10, 0);
    v17 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v17);
    goto LABEL_17;
  }
  connection = self->_connection;
  +[SKAPushManager logger](SKAPushManager, "logger");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!connection)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SKAPushManager createChannelWithProtoData:completion:].cold.3();

    if (!-[SKASystemMonitor isUnderFirstDataProtectionLock](self->_systemMonitor, "isUnderFirstDataProtectionLock"))
    {
      +[SKAPushManager logger](SKAPushManager, "logger");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        -[SKAPushManager createChannelWithProtoData:completion:].cold.2();

    }
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = -1000;
    goto LABEL_16;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v13, OS_LOG_TYPE_DEFAULT, "Sending presence protobuff message to server", buf, 2u);
  }

  v14 = self->_queue;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE30368]), "initWithPushTopic:protoData:", CFSTR("com.apple.icloud.presence.channel.management"), v6);
  v16 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __49__SKAPushManager_sendPresenceMessage_completion___block_invoke;
  v23[3] = &unk_24D9774C0;
  v24 = v14;
  v25 = v7;
  v17 = v14;
  objc_msgSend(v15, "setCompletionBlock:", v23);
  objc_msgSend(v15, "setTimeout:", 5.0);
  queue = self->_queue;
  v21[0] = v16;
  v21[1] = 3221225472;
  v21[2] = __49__SKAPushManager_sendPresenceMessage_completion___block_invoke_2;
  v21[3] = &unk_24D9774E8;
  v21[4] = self;
  v22 = v15;
  v19 = v15;
  dispatch_async(queue, v21);

LABEL_17:
}

void __49__SKAPushManager_sendPresenceMessage_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id *v12;
  NSObject *v13;
  id *v14;
  _QWORD *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[16];
  _QWORD v20[4];
  id v21;
  id v22;

  v7 = a2;
  v8 = a3;
  v9 = v7;
  +[SKAPushManager logger](SKAPushManager, "logger");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a4)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __49__SKAPushManager_sendPresenceMessage_completion___block_invoke_cold_1();

    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __49__SKAPushManager_sendPresenceMessage_completion___block_invoke_32;
    v20[3] = &unk_24D976FE0;
    v12 = &v22;
    v13 = *(NSObject **)(a1 + 32);
    v22 = *(id *)(a1 + 40);
    v14 = &v21;
    v21 = v8;
    v15 = v20;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Presence protobuff sent, reverse push completed, calling completion with protobuf response data", buf, 2u);
    }

    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __49__SKAPushManager_sendPresenceMessage_completion___block_invoke_33;
    v16[3] = &unk_24D976FE0;
    v12 = &v18;
    v13 = *(NSObject **)(a1 + 32);
    v18 = *(id *)(a1 + 40);
    v14 = &v17;
    v17 = v9;
    v15 = v16;
  }
  dispatch_async(v13, v15);

}

uint64_t __49__SKAPushManager_sendPresenceMessage_completion___block_invoke_32(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __49__SKAPushManager_sendPresenceMessage_completion___block_invoke_33(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "protoResponse");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

void __49__SKAPushManager_sendPresenceMessage_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "messageDelivery");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendMessage:", *(_QWORD *)(a1 + 40));

}

- (void)subscribeToStatusChannels:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_trafficModeEnabled)
  {
    +[SKAPushManager logger](SKAPushManager, "logger", a3);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "Not subscribing to status channels because traffic mode is enabled", v4, 2u);
    }

  }
  else
  {
    -[SKAPushManager _subscribeToChannels:forTopic:](self, "_subscribeToChannels:forTopic:", a3, CFSTR("com.apple.icloud.presence.mode.status"));
  }
}

- (void)unsubscribeFromStatusChannels:(id)a3
{
  -[SKAPushManager _unsubscribeFromChannels:forTopic:](self, "_unsubscribeFromChannels:forTopic:", a3, CFSTR("com.apple.icloud.presence.mode.status"));
}

- (void)subscribedStatusChannelsWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__SKAPushManager_subscribedStatusChannelsWithCompletion___block_invoke;
  v6[3] = &unk_24D9772A0;
  v7 = v4;
  v5 = v4;
  -[SKAPushManager _subscribedChannelsForTopic:WithCompletion:](self, "_subscribedChannelsForTopic:WithCompletion:", CFSTR("com.apple.icloud.presence.mode.status"), v6);

}

uint64_t __57__SKAPushManager_subscribedStatusChannelsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)subscribeToPresenceChannels:(id)a3
{
  -[SKAPushManager _subscribeToChannels:forTopic:](self, "_subscribeToChannels:forTopic:", a3, CFSTR("com.apple.icloud.presence.shared.experience"));
}

- (void)unsubscribeFromPresenceChannels:(id)a3
{
  -[SKAPushManager _unsubscribeFromChannels:forTopic:](self, "_unsubscribeFromChannels:forTopic:", a3, CFSTR("com.apple.icloud.presence.shared.experience"));
}

- (void)subscribedPresenceChannelsWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__SKAPushManager_subscribedPresenceChannelsWithCompletion___block_invoke;
  v6[3] = &unk_24D9772A0;
  v7 = v4;
  v5 = v4;
  -[SKAPushManager _subscribedChannelsForTopic:WithCompletion:](self, "_subscribedChannelsForTopic:WithCompletion:", CFSTR("com.apple.icloud.presence.shared.experience"), v6);

}

uint64_t __59__SKAPushManager_subscribedPresenceChannelsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_subscribeToChannels:(id)a3 forTopic:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  APSConnection *connection;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[SKAPushManager _sharedChannelsIsDisabledByServer](self, "_sharedChannelsIsDisabledByServer"))
  {
    +[SKAPushManager logger](SKAPushManager, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SKAPushManager createChannelWithProtoData:completion:].cold.1();
LABEL_20:

    goto LABEL_21;
  }
  connection = self->_connection;
  +[SKAPushManager logger](SKAPushManager, "logger");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (connection)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v6;
      v29 = 2112;
      v30 = v7;
      _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Subscribing to channels: %@ for topic %@", buf, 0x16u);
    }

    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16);
          v18 = objc_alloc(MEMORY[0x24BDE53D8]);
          v19 = (void *)objc_msgSend(v18, "initWithChannelID:", v17, (_QWORD)v22);
          -[NSObject addObject:](v8, "addObject:", v19);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v14);
    }

    -[SKAPushManager connection](self, "connection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[NSObject copy](v8, "copy");
    objc_msgSend(v20, "subscribeToChannels:forTopic:", v21, v7);

    goto LABEL_20;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[SKAPushManager createChannelWithProtoData:completion:].cold.3();

  if (!-[SKASystemMonitor isUnderFirstDataProtectionLock](self->_systemMonitor, "isUnderFirstDataProtectionLock"))
  {
    +[SKAPushManager logger](SKAPushManager, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[SKAPushManager createChannelWithProtoData:completion:].cold.2();
    goto LABEL_20;
  }
LABEL_21:

}

- (void)_unsubscribeFromChannels:(id)a3 forTopic:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  APSConnection *connection;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[SKAPushManager _sharedChannelsIsDisabledByServer](self, "_sharedChannelsIsDisabledByServer"))
  {
    +[SKAPushManager logger](SKAPushManager, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SKAPushManager createChannelWithProtoData:completion:].cold.1();
LABEL_20:

    goto LABEL_21;
  }
  connection = self->_connection;
  +[SKAPushManager logger](SKAPushManager, "logger");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (connection)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v6;
      _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Unsubscribing from channels: %@", buf, 0xCu);
    }

    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16);
          v18 = objc_alloc(MEMORY[0x24BDE53D8]);
          v19 = (void *)objc_msgSend(v18, "initWithChannelID:", v17, (_QWORD)v22);
          -[NSObject addObject:](v8, "addObject:", v19);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v14);
    }

    -[SKAPushManager connection](self, "connection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[NSObject copy](v8, "copy");
    objc_msgSend(v20, "unsubscribeFromChannels:forTopic:", v21, v7);

    goto LABEL_20;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[SKAPushManager createChannelWithProtoData:completion:].cold.3();

  if (!-[SKASystemMonitor isUnderFirstDataProtectionLock](self->_systemMonitor, "isUnderFirstDataProtectionLock"))
  {
    +[SKAPushManager logger](SKAPushManager, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[SKAPushManager createChannelWithProtoData:completion:].cold.2();
    goto LABEL_20;
  }
LABEL_21:

}

- (void)_subscribedChannelsForTopic:(id)a3 WithCompletion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  NSObject *v8;
  id v9;
  APSConnection *connection;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  void (**v16)(id, id);
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  if (-[SKAPushManager _sharedChannelsIsDisabledByServer](self, "_sharedChannelsIsDisabledByServer"))
  {
    +[SKAPushManager logger](SKAPushManager, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SKAPushManager createChannelWithProtoData:completion:].cold.1();
    goto LABEL_4;
  }
  connection = self->_connection;
  +[SKAPushManager logger](SKAPushManager, "logger");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!connection)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SKAPushManager createChannelWithProtoData:completion:].cold.3();

    if (-[SKASystemMonitor isUnderFirstDataProtectionLock](self->_systemMonitor, "isUnderFirstDataProtectionLock"))
      goto LABEL_5;
    +[SKAPushManager logger](SKAPushManager, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[SKAPushManager createChannelWithProtoData:completion:].cold.2();
LABEL_4:

LABEL_5:
    v9 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    v7[2](v7, v9);
    goto LABEL_10;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl(&dword_2188DF000, v12, OS_LOG_TYPE_DEFAULT, "Fetching subscribed channels for topic %@", buf, 0xCu);
  }

  -[SKAPushManager connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __61__SKAPushManager__subscribedChannelsForTopic_WithCompletion___block_invoke;
  v14[3] = &unk_24D977510;
  v15 = v6;
  v16 = v7;
  objc_msgSend(v13, "getRegisteredChannelsForTopic:withCompletion:", v15, v14);

  v9 = v15;
LABEL_10:

}

void __61__SKAPushManager__subscribedChannelsForTopic_WithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[SKAPushManager logger](SKAPushManager, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __61__SKAPushManager__subscribedChannelsForTopic_WithCompletion___block_invoke_cold_1(a1, (uint64_t)v6, v7);

    v8 = *(_QWORD *)(a1 + 40);
    v9 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v9);
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "channelID", (_QWORD)v20);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "length"))
            objc_msgSend(v9, "addObject:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v12);
    }

    +[SKAPushManager logger](SKAPushManager, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v25 = v17;
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_2188DF000, v16, OS_LOG_TYPE_DEFAULT, "Fetching subscribed channels completed for topic %@ with channels: %@", buf, 0x16u);
    }

    v18 = *(_QWORD *)(a1 + 40);
    v19 = (void *)objc_msgSend(v9, "copy");
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);

  }
}

- (id)serverTime
{
  APSConnection *connection;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  NSObject *v9;

  connection = self->_connection;
  if (!connection || (-[APSConnection isConnected](connection, "isConnected") & 1) == 0)
  {
    +[SKAPushManager logger](SKAPushManager, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SKAPushManager serverTime].cold.1();
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BE08738], "serverTime");
  v4 = v3;
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = v6;

  if (v4 <= v7)
  {
    +[SKAPushManager logger](SKAPushManager, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SKAPushManager serverTime].cold.2();
LABEL_7:

    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    return v8;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  return v8;
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  +[SKAPushManager logger](SKAPushManager, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v5, "identifier");
    objc_msgSend(v5, "expirationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v14 = v7;
    v15 = 2112;
    v16 = v5;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Receieved aps incoming message %lu : %@ -- expiration: %@", buf, 0x20u);

  }
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__SKAPushManager_connection_didReceiveIncomingMessage___block_invoke;
  v11[3] = &unk_24D9774E8;
  v11[4] = self;
  v12 = v5;
  v10 = v5;
  dispatch_async(queue, v11);

}

void __55__SKAPushManager_connection_didReceiveIncomingMessage___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  if (objc_msgSend(*(id *)(a1 + 32), "_sharedChannelsIsDisabledByServer"))
  {
    +[SKAPushManager logger](SKAPushManager, "logger");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      -[SKAPushManager createChannelWithProtoData:completion:].cold.1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v2 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", CFSTR("StatusKitDataKey"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = (objc_class *)MEMORY[0x24BDBCE50];
      v5 = v3;
      v6 = (void *)objc_msgSend([v4 alloc], "initWithBase64EncodedString:options:", v5, 0);

    }
    else
    {
      +[SKAPushManager logger](SKAPushManager, "logger");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __55__SKAPushManager_connection_didReceiveIncomingMessage___block_invoke_cold_2();

      v6 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "channelID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(*(id *)(a1 + 40), "identifier");
    objc_msgSend(*(id *)(a1 + 40), "timestamp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "expirationDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pushManager:didReceiveData:onChannel:identifier:dateReceived:dateExpired:", v9, v6, v10, v11, v12, v13);

  }
}

- (void)connection:(id)a3 channelSubscriptionsFailedWithFailures:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  NSObject *queue;
  id v22;
  _QWORD block[6];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  +[SKAPushManager logger](SKAPushManager, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[SKAPushManager connection:channelSubscriptionsFailedWithFailures:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
    v17 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v19, "channelID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        queue = self->_queue;
        block[0] = v17;
        block[1] = 3221225472;
        block[2] = __68__SKAPushManager_connection_channelSubscriptionsFailedWithFailures___block_invoke;
        block[3] = &unk_24D977538;
        block[4] = v19;
        block[5] = self;
        v24 = v20;
        v22 = v20;
        dispatch_async(queue, block);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v15);
  }

}

void __68__SKAPushManager_connection_channelSubscriptionsFailedWithFailures___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEB10D8], (int)objc_msgSend(*(id *)(a1 + 32), "failureReason"), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushManager:failedToSubscribeToChannel:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);

}

- (BOOL)_sharedChannelsIsDisabledByServer
{
  void *v2;
  void *v3;
  NSObject *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x24BE4FE58], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("shared-channels-disabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v3, "BOOLValue"))
  {
    +[SKAPushManager logger](SKAPushManager, "logger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SKAPushManager _sharedChannelsIsDisabledByServer].cold.1();

    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)logger
{
  if (logger_onceToken_17 != -1)
    dispatch_once(&logger_onceToken_17, &__block_literal_global_17);
  return (id)logger__logger_17;
}

void __24__SKAPushManager_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKAPushManager");
  v1 = (void *)logger__logger_17;
  logger__logger_17 = (uint64_t)v0;

}

- (SKAPushManagingDelegate)delegate
{
  return (SKAPushManagingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (SKASystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_systemMonitor, a3);
}

- (APSConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (FTMessageDelivery)messageDelivery
{
  return self->_messageDelivery;
}

- (void)setMessageDelivery:(id)a3
{
  objc_storeStrong((id *)&self->_messageDelivery, a3);
}

- (BOOL)trafficModeEnabled
{
  return self->_trafficModeEnabled;
}

- (void)setTrafficModeEnabled:(BOOL)a3
{
  self->_trafficModeEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDelivery, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)createChannelWithProtoData:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Shared channels disabled by server! Aborting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)createChannelWithProtoData:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_1(&dword_2188DF000, v0, v1, "Not under first data protection lock but no APS connection!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)createChannelWithProtoData:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "No active APS connection. Cannot change topic filter.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __56__SKAPushManager_createChannelWithProtoData_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2188DF000, a2, a3, "Trying to create a channel resulted in error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)publishStatus:completion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Traffic mode is enabled. Aborting publish", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __43__SKAPushManager_publishStatus_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v0, v1, "Publishing status failed with resultCode %ld error: %@");
  OUTLINED_FUNCTION_3();
}

- (void)provisionPayload:completion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Traffic mode is enabled. Aborting provision", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __46__SKAPushManager_provisionPayload_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v0, v1, "Provisioning failed with resultCode %ld error: %@");
  OUTLINED_FUNCTION_3();
}

- (void)pushToken
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "No APSConnection. Cannot fetch push token", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __49__SKAPushManager_sendPresenceMessage_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v0, v1, "Presence protobuff send failed with resultCode %ld error: %@");
  OUTLINED_FUNCTION_3();
}

void __61__SKAPushManager__subscribedChannelsForTopic_WithCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_6(&dword_2188DF000, a2, a3, "Error fetching subscribed channels for topic %@! Error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_3();
}

- (void)serverTime
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "APSConnection server time is invalid. Using current system time", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __55__SKAPushManager_connection_didReceiveIncomingMessage___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Status kit message data undecodable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)connection:(uint64_t)a3 channelSubscriptionsFailedWithFailures:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2188DF000, a2, a3, "Channel subscription failed. Failures: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_sharedChannelsIsDisabledByServer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Shared channels has been disabled in the server bag!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
