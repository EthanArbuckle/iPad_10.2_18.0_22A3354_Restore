@implementation TVRCXPCClient

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_15);
  return (id)sharedInstance_sharedInstance_4;
}

void __31__TVRCXPCClient_sharedInstance__block_invoke()
{
  TVRCXPCClient *v0;
  void *v1;

  v0 = objc_alloc_init(TVRCXPCClient);
  v1 = (void *)sharedInstance_sharedInstance_4;
  sharedInstance_sharedInstance_4 = (uint64_t)v0;

}

- (TVRCXPCClient)init
{
  TVRCXPCClient *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *eventObserversByID;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TVRCXPCClient;
  v2 = -[TVRCXPCClient init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    eventObserversByID = v2->_eventObserversByID;
    v2->_eventObserversByID = v3;

    objc_initWeak(&location, v2);
    v5 = MEMORY[0x24BDAC760];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __21__TVRCXPCClient_init__block_invoke;
    v9[3] = &unk_24DCD8C08;
    objc_copyWeak(&v10, &location);
    _TVRCAddStateHandlerWithName((uint64_t)"TVRCEventObservers", v9);
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __21__TVRCXPCClient_init__block_invoke_2;
    v7[3] = &unk_24DCD8C08;
    objc_copyWeak(&v8, &location);
    _TVRCAddStateHandlerWithName((uint64_t)"TVRCDeviceQuery", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

id __21__TVRCXPCClient_init__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  id *v17;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v17 = WeakRetained;
    v3 = WeakRetained[5];
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v4)
    {
      v5 = v4;
      v18 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v3);
          v7 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v3, "objectForKey:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v10 = v8;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v21;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v21 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "_deviceStateDictionary");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "addObject:", v15);

              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            }
            while (v12);
          }

          objc_msgSend(v19, "setObject:forKeyedSubscript:", v9, v7);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v5);
    }

    WeakRetained = v17;
  }

  return v19;
}

id __21__TVRCXPCClient_init__block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    +[TVRCDeviceQuery _allDiscoveredDevices](TVRCDeviceQuery, "_allDiscoveredDevices", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v9, "_deviceStateDictionary");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, v11);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

  }
  return v2;
}

- (void)addEventObserver:(id)a3 forDeviceWithIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->_eventObserversByID, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "addObject:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);
    -[NSMutableDictionary setObject:forKey:](self->_eventObserversByID, "setObject:forKey:", v8, v6);
  }

}

- (void)removeEventObserver:(id)a3 forDeviceWithIdentifier:(id)a4
{
  void *v6;
  id v7;

  v7 = a3;
  -[NSMutableDictionary objectForKey:](self->_eventObserversByID, "objectForKey:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", v7))
    objc_msgSend(v6, "removeObject:", v7);

}

- (void)openConnectionToDeviceWithIdentifier:(id)a3 connectionContext:(int64_t)a4
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _TVRCXPCLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to open connection to device %@", (uint8_t *)&v8, 0xCu);
  }

  -[TVRCXPCClient _setupConnectionIfNeeded](self, "_setupConnectionIfNeeded");
  -[TVRCXPCRequestProtocol openConnectionToDeviceWithIdentifier:connectionContext:](self->_remoteObject, "openConnectionToDeviceWithIdentifier:connectionContext:", v6, a4);

}

- (void)closeConnectionToDeviceWithIdentifier:(id)a3 withType:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _TVRCXPCLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to close connection to device %{public}@", (uint8_t *)&v8, 0xCu);
  }

  -[TVRCXPCClient _setupConnectionIfNeeded](self, "_setupConnectionIfNeeded");
  -[TVRCXPCRequestProtocol closeConnectionToDeviceWithIdentifier:withType:](self->_remoteObject, "closeConnectionToDeviceWithIdentifier:withType:", v6, a4);

}

- (void)fulfillAuthChallengeForDeviceWithIdentifier:(id)a3 withLocallyEnteredCode:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _TVRCXPCLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to fulfill auth challenge to device %@ and code %{public}@", (uint8_t *)&v9, 0x16u);
  }

  -[TVRCXPCClient _setupConnectionIfNeeded](self, "_setupConnectionIfNeeded");
  -[TVRCXPCRequestProtocol fulfillAuthChallengeForDeviceWithIdentifier:withLocallyEnteredCode:](self->_remoteObject, "fulfillAuthChallengeForDeviceWithIdentifier:withLocallyEnteredCode:", v6, v7);

}

- (void)cancelAuthChallengeForDeviceWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRCXPCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to cancel auth challenge to device %{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[TVRCXPCClient _setupConnectionIfNeeded](self, "_setupConnectionIfNeeded");
  -[TVRCXPCRequestProtocol cancelAuthChallengeForDeviceWithIdentifier:](self->_remoteObject, "cancelAuthChallengeForDeviceWithIdentifier:", v4);

}

- (void)sendButtonEvent:(id)a3 toDeviceWithIdentifier:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[TVRCXPCClient _setupConnectionIfNeeded](self, "_setupConnectionIfNeeded");
  -[TVRCXPCRequestProtocol sendButtonEvent:toDeviceWithIdentifier:](self->_remoteObject, "sendButtonEvent:toDeviceWithIdentifier:", v7, v6);

}

- (void)sendTouchEvent:(id)a3 toDeviceWithIdentifier:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[TVRCXPCClient _setupConnectionIfNeeded](self, "_setupConnectionIfNeeded");
  -[TVRCXPCRequestProtocol sendTouchEvent:toDeviceWithIdentifier:](self->_remoteObject, "sendTouchEvent:toDeviceWithIdentifier:", v7, v6);

}

- (void)sendGameControllerEvent:(id)a3 toDeviceWithIdentifier:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[TVRCXPCClient _setupConnectionIfNeeded](self, "_setupConnectionIfNeeded");
  -[TVRCXPCRequestProtocol sendGameControllerEvent:toDeviceWithIdentifier:](self->_remoteObject, "sendGameControllerEvent:toDeviceWithIdentifier:", v7, v6);

}

- (void)sendInputText:(id)a3 toDeviceWithIdentifier:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[TVRCXPCClient _setupConnectionIfNeeded](self, "_setupConnectionIfNeeded");
  -[TVRCXPCRequestProtocol sendInputText:toDeviceWithIdentifier:](self->_remoteObject, "sendInputText:toDeviceWithIdentifier:", v7, v6);

}

- (void)sendInputReturnKeyToDeviceWithIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  -[TVRCXPCClient _setupConnectionIfNeeded](self, "_setupConnectionIfNeeded");
  -[TVRCXPCRequestProtocol sendInputReturnKeyToDeviceWithIdentifier:](self->_remoteObject, "sendInputReturnKeyToDeviceWithIdentifier:", v4);

}

- (void)sendInputTextPayload:(id)a3 toDeviceWithIdentifier:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[TVRCXPCClient _setupConnectionIfNeeded](self, "_setupConnectionIfNeeded");
  -[TVRCXPCRequestProtocol sendInputTextPayload:toDeviceWithIdentifier:](self->_remoteObject, "sendInputTextPayload:toDeviceWithIdentifier:", v7, v6);

}

- (void)beginDeviceQueryWithResponse:(id)a3
{
  id v4;
  NSObject *v5;
  TVRCXPCRequestProtocol *remoteObject;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id buf[2];

  v4 = a3;
  _TVRCXPCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to begin device query", (uint8_t *)buf, 2u);
  }

  -[TVRCXPCClient _setupConnectionIfNeeded](self, "_setupConnectionIfNeeded");
  objc_initWeak(buf, self);
  remoteObject = self->_remoteObject;
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __46__TVRCXPCClient_beginDeviceQueryWithResponse___block_invoke;
  v12[3] = &unk_24DCD8C30;
  objc_copyWeak(&v14, buf);
  v8 = v4;
  v13 = v8;
  -[TVRCXPCRequestProtocol beginDeviceQueryWithResponse:](remoteObject, "beginDeviceQueryWithResponse:", v12);
  if (!-[TVRCXPCClient deviceQueryRetryTimerFired](self, "deviceQueryRetryTimerFired"))
  {
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __46__TVRCXPCClient_beginDeviceQueryWithResponse___block_invoke_9;
    v9[3] = &unk_24DCD89A8;
    objc_copyWeak(&v11, buf);
    v10 = v8;
    -[TVRCXPCClient _startDeviceQueryRetryTimerWithEventHander:](self, "_startDeviceQueryRetryTimerWithEventHander:", v9);

    objc_destroyWeak(&v11);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(buf);

}

void __46__TVRCXPCClient_beginDeviceQueryWithResponse___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint8_t v8[16];

  _TVRCXPCLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Received response. Cancelling timer", v8, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_cancelRetryTimer");
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);
  }

}

void __46__TVRCXPCClient_beginDeviceQueryWithResponse___block_invoke_9(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_invalidateConnection");
    objc_msgSend(v3, "beginDeviceQueryWithResponse:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_startDeviceQueryRetryTimerWithEventHander:(id)a3
{
  id v4;
  NSObject *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *deviceQueryRetryTimer;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id buf[2];

  v4 = a3;
  -[TVRCXPCClient _cancelRetryTimer](self, "_cancelRetryTimer");
  -[TVRCXPCClient setDeviceQueryRetryTimerFired:](self, "setDeviceQueryRetryTimerFired:", 0);
  if (!self->_deviceQueryRetryTimer)
  {
    _TVRCXPCLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Starting Retry Timer", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
    deviceQueryRetryTimer = self->_deviceQueryRetryTimer;
    self->_deviceQueryRetryTimer = v6;

    v8 = self->_deviceQueryRetryTimer;
    v9 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    v10 = self->_deviceQueryRetryTimer;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __60__TVRCXPCClient__startDeviceQueryRetryTimerWithEventHander___block_invoke;
    v11[3] = &unk_24DCD89A8;
    objc_copyWeak(&v13, buf);
    v12 = v4;
    dispatch_source_set_event_handler(v10, v11);
    dispatch_activate((dispatch_object_t)self->_deviceQueryRetryTimer);

    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }

}

void __60__TVRCXPCClient__startDeviceQueryRetryTimerWithEventHander___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  uint8_t v5[16];

  _TVRCXPCLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A51B000, v2, OS_LOG_TYPE_DEFAULT, "Retry eventHandler called", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setDeviceQueryRetryTimerFired:", 1);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_cancelRetryTimer
{
  NSObject *v3;
  OS_dispatch_source *deviceQueryRetryTimer;
  uint8_t v5[16];

  if (self->_deviceQueryRetryTimer)
  {
    _TVRCXPCLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling Retry Timer", v5, 2u);
    }

    dispatch_source_cancel((dispatch_source_t)self->_deviceQueryRetryTimer);
    deviceQueryRetryTimer = self->_deviceQueryRetryTimer;
    self->_deviceQueryRetryTimer = 0;

  }
}

- (void)endDeviceQuery
{
  NSObject *v3;
  uint8_t v4[16];

  _TVRCXPCLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to end device query", v4, 2u);
  }

  -[TVRCXPCClient _setupConnectionIfNeeded](self, "_setupConnectionIfNeeded");
  -[TVRCXPCRequestProtocol endDeviceQuery](self->_remoteObject, "endDeviceQuery");
}

- (void)getSuggestedDevicesWithResponse:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  _TVRCXPCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to get suggested device if available", v6, 2u);
  }

  -[TVRCXPCClient _setupConnectionIfNeeded](self, "_setupConnectionIfNeeded");
  -[TVRCXPCRequestProtocol getSuggestedDevicesWithResponse:](self->_remoteObject, "getSuggestedDevicesWithResponse:", v4);

}

- (void)fetchActiveMREndpointUIDWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  _TVRCXPCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to fetch active MediaRemote endpoint", v6, 2u);
  }

  -[TVRCXPCClient _setupConnectionIfNeeded](self, "_setupConnectionIfNeeded");
  -[TVRCXPCRequestProtocol fetchActiveMREndpointUIDWithCompletion:](self->_remoteObject, "fetchActiveMREndpointUIDWithCompletion:", v4);

}

- (void)sendEvent:(id)a3 toDeviceWithIdentifier:(id)a4 options:(id)a5 response:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  _TVRCXPCLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412546;
    v16 = v10;
    v17 = 2114;
    v18 = v11;
    _os_log_impl(&dword_21A51B000, v14, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to send event with ID %@ to device %{public}@", (uint8_t *)&v15, 0x16u);
  }

  -[TVRCXPCClient _setupConnectionIfNeeded](self, "_setupConnectionIfNeeded");
  -[TVRCXPCRequestProtocol sendEvent:toDeviceWithIdentifier:options:response:](self->_remoteObject, "sendEvent:toDeviceWithIdentifier:options:response:", v10, v11, v13, v12);

}

- (void)launchViewServiceForDeviceWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  _TVRCXPCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to launch TVRemote view service", v6, 2u);
  }

  -[TVRCXPCClient _setupConnectionIfNeeded](self, "_setupConnectionIfNeeded");
  -[TVRCXPCRequestProtocol launchViewServiceForDeviceWithIdentifier:](self->_remoteObject, "launchViewServiceForDeviceWithIdentifier:", v4);

}

- (void)enableTVRemoteOnLockscreen:(BOOL)a3 forDeviceIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v4 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _TVRCXPCLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("hide");
    if (v4)
      v8 = CFSTR("show");
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to %@ TVRemote on Lockscreen", (uint8_t *)&v9, 0xCu);
  }

  -[TVRCXPCClient _setupConnectionIfNeeded](self, "_setupConnectionIfNeeded");
  -[TVRCXPCRequestProtocol enableTVRemoteOnLockscreen:forDeviceIdentifier:](self->_remoteObject, "enableTVRemoteOnLockscreen:forDeviceIdentifier:", v4, v6);

}

- (void)getConnectionStatusToDeviceWithIdentifier:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _TVRCXPCLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to fetch connection status for %{public}@", (uint8_t *)&v9, 0xCu);
  }

  -[TVRCXPCClient _setupConnectionIfNeeded](self, "_setupConnectionIfNeeded");
  -[TVRCXPCRequestProtocol getConnectionStatusToDeviceWithIdentifier:response:](self->_remoteObject, "getConnectionStatusToDeviceWithIdentifier:response:", v6, v7);

}

- (void)enableFindingSession:(BOOL)a3 forDeviceIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v4 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _TVRCXPCLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("disable");
    if (v4)
      v8 = CFSTR("enable");
    v9 = 138412546;
    v10 = v8;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to %@ finding session for %{public}@", (uint8_t *)&v9, 0x16u);
  }

  -[TVRCXPCClient _setupConnectionIfNeeded](self, "_setupConnectionIfNeeded");
  -[TVRCXPCRequestProtocol enableFindingSession:forDeviceIdentifier:](self->_remoteObject, "enableFindingSession:forDeviceIdentifier:", v4, v6);

}

- (void)fetchUpNextInfoForDeviceWithIdentifier:(id)a3 paginationToken:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  _TVRCXPCLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = v8;
    _os_log_impl(&dword_21A51B000, v11, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to fetch UpNext infos for %{public}@", (uint8_t *)&v12, 0xCu);
  }

  -[TVRCXPCClient _setupConnectionIfNeeded](self, "_setupConnectionIfNeeded");
  -[TVRCXPCRequestProtocol fetchUpNextInfoForDeviceWithIdentifier:paginationToken:completion:](self->_remoteObject, "fetchUpNextInfoForDeviceWithIdentifier:paginationToken:completion:", v8, v10, v9);

}

- (void)markAsWatchedForDeviceWithIdentifier:(id)a3 mediaIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _TVRCXPCLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v9;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_21A51B000, v11, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to mark %@ as watched for %{public}@", (uint8_t *)&v12, 0x16u);
  }

  -[TVRCXPCClient _setupConnectionIfNeeded](self, "_setupConnectionIfNeeded");
  -[TVRCXPCRequestProtocol markAsWatchedForDeviceWithIdentifier:mediaIdentifier:completion:](self->_remoteObject, "markAsWatchedForDeviceWithIdentifier:mediaIdentifier:completion:", v8, v9, v10);

}

- (void)removeItemForDeviceWithIdentifier:(id)a3 mediaIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _TVRCXPCLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v9;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_21A51B000, v11, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to remove %@ from UpNext for %{public}@", (uint8_t *)&v12, 0x16u);
  }

  -[TVRCXPCClient _setupConnectionIfNeeded](self, "_setupConnectionIfNeeded");
  -[TVRCXPCRequestProtocol removeItemForDeviceWithIdentifier:mediaIdentifier:completion:](self->_remoteObject, "removeItemForDeviceWithIdentifier:mediaIdentifier:completion:", v8, v9, v10);

}

- (void)playItem:(id)a3 deviceIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _TVRCXPCLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v8;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_21A51B000, v11, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to play media with item %@ for %{public}@", (uint8_t *)&v12, 0x16u);
  }

  -[TVRCXPCClient _setupConnectionIfNeeded](self, "_setupConnectionIfNeeded");
  -[TVRCXPCRequestProtocol playItem:deviceIdentifier:completion:](self->_remoteObject, "playItem:deviceIdentifier:completion:", v8, v9, v10);

}

- (void)deviceUpdatedState:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  TVRCXPCClient *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__TVRCXPCClient_deviceUpdatedState___block_invoke;
  v6[3] = &unk_24DCD8630;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __36__TVRCXPCClient_deviceUpdatedState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _TVRCXPCLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_21A51B000, v2, OS_LOG_TYPE_DEFAULT, "tvremoted informed us that a device's state changed - %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_broadcastStateUpdateToDevices:", *(_QWORD *)(a1 + 32));
}

- (void)deviceWithState:(id)a3 encounteredAuthChallengeOfType:(int64_t)a4 attributes:(int64_t)a5 codeToEnterOnDevice:(id)a6 throttleSeconds:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  int64_t v19;
  int64_t v20;
  int64_t v21;

  v12 = a3;
  v13 = a6;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __111__TVRCXPCClient_deviceWithState_encounteredAuthChallengeOfType_attributes_codeToEnterOnDevice_throttleSeconds___block_invoke;
  v16[3] = &unk_24DCD8C58;
  v16[4] = self;
  v17 = v12;
  v18 = v13;
  v19 = a4;
  v20 = a5;
  v21 = a7;
  v14 = v13;
  v15 = v12;
  dispatch_async(MEMORY[0x24BDAC9B8], v16);

}

void __111__TVRCXPCClient_deviceWithState_encounteredAuthChallengeOfType_attributes_codeToEnterOnDevice_throttleSeconds___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[8];
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  _TVRCXPCLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A51B000, v2, OS_LOG_TYPE_DEFAULT, "tvremoted informed us that we're encountering an auth challenge.", buf, 2u);
  }

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "alternateIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "unionHashTable:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v9);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v17++), "_deviceEncounteredAuthChallengeType:attributes:codeToEnterOnDevice:throttleSeconds:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), (_QWORD)v18);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    }
    while (v15);
  }

  objc_msgSend(*(id *)(a1 + 32), "_broadcastStateUpdateToDevices:", *(_QWORD *)(a1 + 40));
}

- (void)deviceQueryUpdatedDiscoveredDevices:(id)a3
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__TVRCXPCClient_deviceQueryUpdatedDiscoveredDevices___block_invoke;
  block[3] = &unk_24DCD70C8;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __53__TVRCXPCClient_deviceQueryUpdatedDiscoveredDevices___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  uint64_t v32;
  TVRCDevice *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  +[TVRCDeviceQuery _allDiscoveredDevices](TVRCDeviceQuery, "_allDiscoveredDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v58 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v9, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
    }
    while (v6);
  }
  v44 = v4;

  v11 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v3, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v15 = *(id *)(a1 + 32);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v54;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v54 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
        objc_msgSend(v20, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v20, v21);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
    }
    while (v17);
  }

  v22 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v14, "allKeys");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = v24;
  v25 = (void *)objc_msgSend(v24, "mutableCopy");
  v43 = (void *)v13;
  objc_msgSend(v25, "minusSet:", v13);
  v26 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v27 = v25;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v50;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v50 != v30)
          objc_enumerationMutation(v27);
        v32 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * k);
        v33 = -[TVRCDevice initWithDeviceIdentifier:]([TVRCDevice alloc], "initWithDeviceIdentifier:", v32);
        objc_msgSend(v14, "objectForKey:", v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVRCDevice _deviceUpdatedState:](v33, "_deviceUpdatedState:", v34);
        objc_msgSend(v26, "addObject:", v33);

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
    }
    while (v29);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v35 = v42;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v46;
    do
    {
      for (m = 0; m != v37; ++m)
      {
        if (*(_QWORD *)v46 != v38)
          objc_enumerationMutation(v35);
        objc_msgSend(v3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * m));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v40)
          objc_msgSend(v26, "addObject:", v40);

      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
    }
    while (v37);
  }

  v41 = (void *)objc_msgSend(v26, "copy");
  +[TVRCDeviceQuery _allDiscoveredDevicesDidUpdate:](TVRCDeviceQuery, "_allDiscoveredDevicesDidUpdate:", v41);

}

- (void)suggestedDevices:(id)a3
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__TVRCXPCClient_suggestedDevices___block_invoke;
  block[3] = &unk_24DCD70C8;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __34__TVRCXPCClient_suggestedDevices___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  _TVRCXPCLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v21 = v3;
    _os_log_impl(&dword_21A51B000, v2, OS_LOG_TYPE_DEFAULT, "tvremoted updated suggested devices - %{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v17;
    *(_QWORD *)&v7 = 138543362;
    v15 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        +[TVRCDeviceQuery deviceForDeviceState:](TVRCDeviceQuery, "deviceForDeviceState:", v11, v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        _TVRCXPCLog();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v21 = v11;
            v22 = 2114;
            v23 = v12;
            _os_log_impl(&dword_21A51B000, v14, OS_LOG_TYPE_DEFAULT, "Updating deviceState: %{public}@ for suggested device: %{public}@", buf, 0x16u);
          }

          objc_msgSend(v12, "_deviceUpdatedState:", v11);
          objc_msgSend(v4, "addObject:", v12);
        }
        else
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v15;
            v21 = v11;
            _os_log_error_impl(&dword_21A51B000, v14, OS_LOG_TYPE_ERROR, "Suggested deviceState %{public}@ was never discovered previously", buf, 0xCu);
          }

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v8);
  }

  +[TVRCDeviceQuery _updateSuggestedDevices:](TVRCDeviceQuery, "_updateSuggestedDevices:", v4);
}

- (void)_invalidateConnection
{
  NSObject *v3;
  NSXPCConnection *xpcConnection;
  uint8_t v5[16];

  if (self->_xpcConnection)
  {
    _TVRCXPCLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating XPC connection", v5, 2u);
    }

    -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = 0;

  }
}

- (void)_setupConnectionIfNeeded
{
  NSXPCConnection *v3;
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v5;
  void *v6;
  NSXPCConnection *v7;
  void *v8;
  NSXPCConnection *v9;
  uint64_t v10;
  NSXPCConnection *v11;
  NSObject *v12;
  NSObject *v13;
  TVRCXPCRequestProtocol *v14;
  TVRCXPCRequestProtocol *remoteObject;
  uint8_t v16[8];
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  if (!self->_xpcConnection)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.tvremotecore.xpc"), 4096);
    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = v3;

    v5 = self->_xpcConnection;
    +[TVRCXPCProtocolManager requestInterface](TVRCXPCProtocolManager, "requestInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", v6);

    v7 = self->_xpcConnection;
    +[TVRCXPCProtocolManager responseInterface](TVRCXPCProtocolManager, "responseInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v7, "setExportedInterface:", v8);

    -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", self);
    objc_initWeak(&location, self);
    v9 = self->_xpcConnection;
    v10 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __41__TVRCXPCClient__setupConnectionIfNeeded__block_invoke;
    v19[3] = &unk_24DCD71B8;
    objc_copyWeak(&v20, &location);
    -[NSXPCConnection setInterruptionHandler:](v9, "setInterruptionHandler:", v19);
    v11 = self->_xpcConnection;
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __41__TVRCXPCClient__setupConnectionIfNeeded__block_invoke_24;
    v17[3] = &unk_24DCD71B8;
    objc_copyWeak(&v18, &location);
    -[NSXPCConnection setInvalidationHandler:](v11, "setInvalidationHandler:", v17);
    _TVRCXPCLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "Resuming XPC connection", v16, 2u);
    }

    -[NSXPCConnection activate](self->_xpcConnection, "activate");
    _TVRCXPCLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_21A51B000, v13, OS_LOG_TYPE_DEFAULT, "Getting remote object proxy", v16, 2u);
    }

    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_xpcConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_27);
    v14 = (TVRCXPCRequestProtocol *)objc_claimAutoreleasedReturnValue();
    remoteObject = self->_remoteObject;
    self->_remoteObject = v14;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

void __41__TVRCXPCClient__setupConnectionIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 3);
    *((_QWORD *)WeakRetained + 3) = 0;

    _TVRCXPCLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted. Sending all devices a disconnect message.", v5, 2u);
    }

    objc_msgSend(v2, "_disconnectAllDevices");
    objc_msgSend(v2, "_postInvalidationNotification");
  }

}

void __41__TVRCXPCClient__setupConnectionIfNeeded__block_invoke_24(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 3);
    *((_QWORD *)WeakRetained + 3) = 0;

    _TVRCXPCLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated. Sending all devices a disconnect message.", v5, 2u);
    }

    objc_msgSend(v2, "_disconnectAllDevices");
    objc_msgSend(v2, "_postInvalidationNotification");
  }

}

void __41__TVRCXPCClient__setupConnectionIfNeeded__block_invoke_25(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _TVRCXPCLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __41__TVRCXPCClient__setupConnectionIfNeeded__block_invoke_25_cold_1((uint64_t)v2, v3);

}

- (void)_disconnectAllDevices
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__TVRCXPCClient__disconnectAllDevices__block_invoke;
  block[3] = &unk_24DCD70C8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __38__TVRCXPCClient__disconnectAllDevices__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "allValues");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v17;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v5);
        v12 = 0u;
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v13;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v13 != v10)
                objc_enumerationMutation(v7);
              objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "_disconnectDeviceDueToConnectionInterruption");
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
          }
          while (v9);
        }

        ++v5;
      }
      while (v5 != v3);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v3);
  }

}

- (void)_broadcastStateUpdateToDevices:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__TVRCXPCClient__broadcastStateUpdateToDevices___block_invoke;
  v6[3] = &unk_24DCD8630;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __48__TVRCXPCClient__broadcastStateUpdateToDevices___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "alternateIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "unionHashTable:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "_deviceUpdatedState:", *(_QWORD *)(a1 + 40), (_QWORD)v17);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (void)_postInvalidationNotification
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  _TVRCXPCLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21A51B000, v2, OS_LOG_TYPE_DEFAULT, "Posting TVRCConnectionInvalidatedNotification", v4, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.TVRemoteCore.connectionInvalidatedNotification"), 0);

}

- (OS_dispatch_source)deviceQueryRetryTimer
{
  return self->_deviceQueryRetryTimer;
}

- (void)setDeviceQueryRetryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_deviceQueryRetryTimer, a3);
}

- (BOOL)deviceQueryRetryTimerFired
{
  return self->_deviceQueryRetryTimerFired;
}

- (void)setDeviceQueryRetryTimerFired:(BOOL)a3
{
  self->_deviceQueryRetryTimerFired = a3;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (TVRCXPCRequestProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
  objc_storeStrong((id *)&self->_remoteObject, a3);
}

- (NSMutableDictionary)eventObserversByID
{
  return self->_eventObserversByID;
}

- (void)setEventObserversByID:(id)a3
{
  objc_storeStrong((id *)&self->_eventObserversByID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventObserversByID, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_deviceQueryRetryTimer, 0);
}

void __41__TVRCXPCClient__setupConnectionIfNeeded__block_invoke_25_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21A51B000, a2, OS_LOG_TYPE_ERROR, "Failed getting remote object proxy %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
