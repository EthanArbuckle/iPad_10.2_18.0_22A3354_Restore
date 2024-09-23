@implementation TVRDServer

- (TVRDServer)init
{
  TVRDServer *v2;
  void *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *authChallengesByID;
  NSMutableSet *v6;
  NSMutableSet *cachedDevices;
  NSMutableSet *v8;
  NSMutableSet *clientConnections;
  NSMutableDictionary *v10;
  NSMutableDictionary *connectionContextByID;
  NSCountedSet *v12;
  NSCountedSet *deviceIdentifiers;
  NSMutableSet *v14;
  NSMutableSet *deviceQueryObservers;
  TVRXDeviceLocator *v16;
  TVRXDeviceLocator *deviceSearch;
  NSMutableSet *v18;
  NSMutableSet *identifiersRequestingConnection;
  CUSystemMonitor *v20;
  CUSystemMonitor *systemMonitor;
  CUSystemMonitor *v22;
  CUSystemMonitor *v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)TVRDServer;
  v2 = -[TVRDServer init](&v32, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVRXManagedConfigManager sharedInstance](TVRXManagedConfigManager, "sharedInstance"));
    objc_msgSend(v3, "refreshState");

    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    authChallengesByID = v2->_authChallengesByID;
    v2->_authChallengesByID = v4;

    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    cachedDevices = v2->_cachedDevices;
    v2->_cachedDevices = v6;

    v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    clientConnections = v2->_clientConnections;
    v2->_clientConnections = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    connectionContextByID = v2->_connectionContextByID;
    v2->_connectionContextByID = v10;

    v12 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
    deviceIdentifiers = v2->_deviceIdentifiers;
    v2->_deviceIdentifiers = v12;

    v14 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    deviceQueryObservers = v2->_deviceQueryObservers;
    v2->_deviceQueryObservers = v14;

    v16 = (TVRXDeviceLocator *)objc_alloc_init((Class)TVRXDeviceLocator);
    deviceSearch = v2->_deviceSearch;
    v2->_deviceSearch = v16;

    v18 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    identifiersRequestingConnection = v2->_identifiersRequestingConnection;
    v2->_identifiersRequestingConnection = v18;

    v20 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = v2->_systemMonitor;
    v2->_systemMonitor = v20;

    objc_initWeak(&location, v2);
    v22 = v2->_systemMonitor;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = __18__TVRDServer_init__block_invoke;
    v29[3] = &unk_10001C5D8;
    objc_copyWeak(&v30, &location);
    -[CUSystemMonitor setScreenLockedChangedHandler:](v22, "setScreenLockedChangedHandler:", v29);
    -[CUSystemMonitor activateWithCompletion:](v2->_systemMonitor, "activateWithCompletion:", &__block_literal_global_4);
    v23 = v2->_systemMonitor;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = __18__TVRDServer_init__block_invoke_12;
    v27[3] = &unk_10001C5D8;
    objc_copyWeak(&v28, &location);
    -[CUSystemMonitor setFirstUnlockHandler:](v23, "setFirstUnlockHandler:", v27);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __18__TVRDServer_init__block_invoke_14;
    v25[3] = &unk_10001C830;
    objc_copyWeak(&v26, &location);
    _TVRCAddStateHandlerWithName("TVRDServer", v25);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __18__TVRDServer_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "systemMonitor"));
    v4 = objc_msgSend(v3, "screenLocked");

    v5 = _TVRDXPCLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CFSTR("unlocked");
      if (v4)
        v7 = CFSTR("locked");
      v8 = 138412290;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Screen is now %@", (uint8_t *)&v8, 0xCu);
    }

  }
}

void __18__TVRDServer_init__block_invoke_11(id a1)
{
  id v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = _TVRDXPCLog();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Screen lock monitor activated", v3, 2u);
  }

}

void __18__TVRDServer_init__block_invoke_12(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id *v4;
  id WeakRetained;
  void *v6;
  unsigned int v7;
  id v8;
  uint8_t v9[16];

  v2 = _TVRDXPCLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "First unlock. Activating IRSessionManager", v9, 2u);
  }

  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "systemMonitor"));
  v7 = objc_msgSend(v6, "firstUnlocked");

  if (v7)
  {
    v8 = objc_loadWeakRetained(v4);
    objc_msgSend(v8, "_activateIRSessionManager");

  }
}

id __18__TVRDServer_init__block_invoke_14(uint64_t a1)
{
  void *v2;
  id *WeakRetained;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v5 = WeakRetained[4];
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stateDictionary"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v12);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v7);
    }

    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("cachedDevices"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[7], "description"));
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, CFSTR("deviceQueryObservers"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[2], "description"));
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v14, CFSTR("clientConnections"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[10], "devices", 0));
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v17);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j), "stateDictionary"));
          objc_msgSend(v16, "addObject:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v19);
    }

    objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("devices"));
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, CFSTR("deviceQueryResults"));

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer systemMonitor](self, "systemMonitor"));
  objc_msgSend(v3, "invalidate");

  -[TVRDServer _invalidateIRSessionManager](self, "_invalidateIRSessionManager");
  v4.receiver = self;
  v4.super_class = (Class)TVRDServer;
  -[TVRDServer dealloc](&v4, "dealloc");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  _QWORD v7[4];
  id v8;
  TVRDServer *v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __49__TVRDServer_listener_shouldAcceptNewConnection___block_invoke;
  v7[3] = &unk_10001C858;
  v8 = a4;
  v9 = self;
  v5 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

  return 1;
}

void __49__TVRDServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  TVRDClientProcessConnection *v4;
  TVRDClientProcessConnection *v5;
  id v6;
  NSObject *v7;
  id v8;
  int v9;
  TVRDClientProcessConnection *v10;
  __int16 v11;
  id v12;

  v2 = _TVRDXPCLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(TVRDClientProcessConnection **)(a1 + 32);
    v9 = 138543362;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "shouldAcceptNewConnection: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  v5 = -[TVRDClientProcessConnection initWithXPCConnection:delegate:]([TVRDClientProcessConnection alloc], "initWithXPCConnection:delegate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addObject:", v5);
  v6 = _TVRDXPCLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "count");
    v9 = 138543618;
    v10 = v5;
    v11 = 2048;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Added new %{public}@. Total connections: %ld", (uint8_t *)&v9, 0x16u);
  }

}

- (void)clientConnection:(id)a3 addedInterestedDeviceIdentifier:(id)a4 connectionContext:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  _QWORD block[5];
  id v14;
  int64_t v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = _TVRDXPCLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v17 = v8;
    v18 = 2114;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ requested connection to %{public}@", buf, 0x16u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __81__TVRDServer_clientConnection_addedInterestedDeviceIdentifier_connectionContext___block_invoke;
  block[3] = &unk_10001C880;
  block[4] = self;
  v14 = v9;
  v15 = a5;
  v12 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void __81__TVRDServer_clientConnection_addedInterestedDeviceIdentifier_connectionContext___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(a1 + 48)));
  v3 = (id *)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connectionContextByID"));
  v6 = *(_QWORD *)(a1 + 40);
  v5 = (uint64_t *)(a1 + 40);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, v6);

  v7 = (uint64_t)objc_msgSend(*((id *)*v3 + 3), "countForObject:", *v5);
  if (v7)
  {
    if (v7 >= 1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v3, "_cachedDeviceForIdentifier:", *v5));
      if (v8)
      {
        objc_msgSend(*v3, "_connectToDeviceIfNeeded:", v8);
      }
      else
      {
        v9 = _TVRDXPCLog();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          __81__TVRDServer_clientConnection_addedInterestedDeviceIdentifier_connectionContext___block_invoke_cold_1(v5, (uint64_t)v3, v10);

        objc_msgSend(*v3, "_informClientCouldNotLocateDeviceWithIdentifier:", *v5);
      }

    }
  }
  else
  {
    objc_msgSend(*v3, "_becameInterestedInDeviceWithIdentifier:", *v5);
  }
}

- (void)clientConnection:(id)a3 reiteratedInterestInDeviceIdentifier:(id)a4 connectionContext:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  int64_t v14;

  v8 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __86__TVRDServer_clientConnection_reiteratedInterestInDeviceIdentifier_connectionContext___block_invoke;
  v11[3] = &unk_10001C8A8;
  v11[4] = self;
  v12 = a4;
  v13 = v8;
  v14 = a5;
  v9 = v8;
  v10 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

}

void __86__TVRDServer_clientConnection_reiteratedInterestInDeviceIdentifier_connectionContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id *v5;
  int v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(a1 + 56)));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connectionContextByID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_cachedDeviceForIdentifier:", *(_QWORD *)(a1 + 40)));
  v5 = *(id **)(a1 + 32);
  v7 = (id)v4;
  if (v4)
  {
    objc_msgSend(v5, "_connectToDeviceIfNeeded:", v4);
  }
  else
  {
    if ((int)objc_msgSend(v5[3], "countForObject:", *(_QWORD *)(a1 + 40)) >= 1)
    {
      v6 = 0;
      do
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v6 < (int)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "countForObject:", *(_QWORD *)(a1 + 40)));
    }
    objc_msgSend(*(id *)(a1 + 32), "clientConnection:addedInterestedDeviceIdentifier:connectionContext:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }

}

- (void)clientConnection:(id)a3 removedInterestedDeviceIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = _TVRDXPCLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v14 = v6;
    v15 = 2114;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ requested disconnection to %{public}@", buf, 0x16u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __65__TVRDServer_clientConnection_removedInterestedDeviceIdentifier___block_invoke;
  v11[3] = &unk_10001C858;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

}

void __65__TVRDServer_clientConnection_removedInterestedDeviceIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "countForObject:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_cachedDeviceForIdentifier:", *(_QWORD *)(a1 + 40)));
  v3 = v2;
  if (v2)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allIdentifiers", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i));
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "countForObject:", *(_QWORD *)(a1 + 40)))
    objc_msgSend(*(id *)(a1 + 32), "_lostInterestInDeviceWithIdentifier:", *(_QWORD *)(a1 + 40));

}

- (void)clientConnection:(id)a3 receivedAuthChallengeLocallyEnteredCode:(id)a4 forDeviceIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v7 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __91__TVRDServer_clientConnection_receivedAuthChallengeLocallyEnteredCode_forDeviceIdentifier___block_invoke;
  block[3] = &unk_10001C8D0;
  block[4] = self;
  v11 = a5;
  v12 = v7;
  v8 = v7;
  v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void __91__TVRDServer_clientConnection_receivedAuthChallengeLocallyEnteredCode_forDeviceIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  int v13;
  uint64_t v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_cachedDeviceForIdentifier:", *(_QWORD *)(a1 + 40)));
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifier"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v5));

    if (v6)
    {
      -[NSObject userEnteredCodeLocally:](v6, "userEnteredCodeLocally:", *(_QWORD *)(a1 + 48));
      v7 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
      objc_msgSend(v7, "removeObjectForKey:", v8);
    }
    else
    {
      v11 = _TVRDXPCLog();
      v8 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 40);
        v13 = 138412290;
        v14 = v12;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client attempted to fulfill an auth challenge that appears to no longer exist, for device with identifier %@. Ignoring.", (uint8_t *)&v13, 0xCu);
      }
    }

  }
  else
  {
    v9 = _TVRDXPCLog();
    v6 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v13 = 138412290;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Client attempted to fulfill an auth challenge for a device that appears to no longer exist, device identifier %@. Ignoring.", (uint8_t *)&v13, 0xCu);
    }
  }

}

- (void)clientConnection:(id)a3 cancelledAuthChallengeForDeviceIdentifier:(id)a4
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __73__TVRDServer_clientConnection_cancelledAuthChallengeForDeviceIdentifier___block_invoke;
  v5[3] = &unk_10001C858;
  v5[4] = self;
  v6 = a4;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

void __73__TVRDServer_clientConnection_cancelledAuthChallengeForDeviceIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  int v13;
  uint64_t v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_cachedDeviceForIdentifier:", *(_QWORD *)(a1 + 40)));
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifier"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v5));

    if (v6)
    {
      -[NSObject cancel](v6, "cancel");
      v7 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
      objc_msgSend(v7, "removeObjectForKey:", v8);
    }
    else
    {
      v11 = _TVRDXPCLog();
      v8 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 40);
        v13 = 138412290;
        v14 = v12;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client attempted to cancel an auth challenge that appears to no longer exist, for device with identifier %@. Ignoring.", (uint8_t *)&v13, 0xCu);
      }
    }

  }
  else
  {
    v9 = _TVRDXPCLog();
    v6 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v13 = 138412290;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Client attempted to fulfill an auth challenge for a device that appears to no longer exist, device identifier %@. Ignoring.", (uint8_t *)&v13, 0xCu);
    }
  }

}

- (void)clientConnection:(id)a3 requestsSendingButtonEvent:(id)a4 toDeviceIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v7 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __77__TVRDServer_clientConnection_requestsSendingButtonEvent_toDeviceIdentifier___block_invoke;
  block[3] = &unk_10001C8D0;
  block[4] = self;
  v11 = a5;
  v12 = v7;
  v8 = v7;
  v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void __77__TVRDServer_clientConnection_requestsSendingButtonEvent_toDeviceIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_cachedDeviceForIdentifier:", *(_QWORD *)(a1 + 40)));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "sendButtonEvent:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "button"));
    v5 = (unint64_t)objc_msgSend(v4, "buttonType");

    if (v5 <= 0x1E && ((1 << v5) & 0x4000000C) != 0)
      objc_msgSend(*(id *)(a1 + 32), "_switchToCurrentUserProfileForDevice:", v3);
    if (objc_msgSend(*(id *)(a1 + 48), "eventType") != (id)1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "irSessionManager"));
      objc_msgSend(v7, "didInteractWithDevice:", v3);

    }
  }
  else
  {
    v8 = _TVRDXPCLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cachedDevices"));
      v12 = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No cached device found with identifier %@. All cached devices - %@", (uint8_t *)&v12, 0x16u);

    }
  }

}

- (void)clientConnection:(id)a3 requestsSendingGameControllerEvent:(id)a4 toDeviceIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v7 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __85__TVRDServer_clientConnection_requestsSendingGameControllerEvent_toDeviceIdentifier___block_invoke;
  block[3] = &unk_10001C8D0;
  block[4] = self;
  v11 = a5;
  v12 = v7;
  v8 = v7;
  v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void __85__TVRDServer_clientConnection_requestsSendingGameControllerEvent_toDeviceIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_cachedDeviceForIdentifier:", *(_QWORD *)(a1 + 40)));
  if (v2)
  {
    v4 = v2;
    objc_msgSend(v2, "sendGameControllerEvent:", *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "irSessionManager"));
    objc_msgSend(v3, "didInteractWithDevice:", v4);

    v2 = v4;
  }

}

- (void)clientConnection:(id)a3 requestsSendingTouchEvent:(id)a4 toDeviceIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v7 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __76__TVRDServer_clientConnection_requestsSendingTouchEvent_toDeviceIdentifier___block_invoke;
  block[3] = &unk_10001C8D0;
  block[4] = self;
  v11 = a5;
  v12 = v7;
  v8 = v7;
  v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void __76__TVRDServer_clientConnection_requestsSendingTouchEvent_toDeviceIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  BOOL v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_cachedDeviceForIdentifier:", *(_QWORD *)(a1 + 40)));
  if (v2)
  {
    v5 = v2;
    objc_msgSend(v2, "sendTouchEvent:", *(_QWORD *)(a1 + 48));
    v3 = objc_msgSend(*(id *)(a1 + 48), "phase") == (id)1;
    v2 = v5;
    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "irSessionManager"));
      objc_msgSend(v4, "didInteractWithDevice:", v5);

      v2 = v5;
    }
  }

}

- (void)clientConnection:(id)a3 fetchUpNextInfoForDeviceWithIdentifier:(id)a4 paginationToken:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __97__TVRDServer_clientConnection_fetchUpNextInfoForDeviceWithIdentifier_paginationToken_completion___block_invoke;
  v11[3] = &unk_10001C8F8;
  v11[4] = self;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v8 = v14;
  v9 = v13;
  v10 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

}

void __97__TVRDServer_clientConnection_fetchUpNextInfoForDeviceWithIdentifier_paginationToken_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_cachedDeviceForIdentifier:", *(_QWORD *)(a1 + 40)));
  v3 = (void *)v2;
  if (v2)
  {
    v5 = (void *)v2;
    v4 = objc_opt_respondsToSelector(v2, "fetchUpNextInfoWithPaginationToken:completion:");
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "fetchUpNextInfoWithPaginationToken:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      v3 = v5;
    }
  }

}

- (void)clientConnection:(id)a3 markAsWatchedForDeviceWithIdentifier:(id)a4 mediaIdentifier:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __95__TVRDServer_clientConnection_markAsWatchedForDeviceWithIdentifier_mediaIdentifier_completion___block_invoke;
  v11[3] = &unk_10001C8F8;
  v11[4] = self;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v8 = v14;
  v9 = v13;
  v10 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

}

void __95__TVRDServer_clientConnection_markAsWatchedForDeviceWithIdentifier_mediaIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_cachedDeviceForIdentifier:", *(_QWORD *)(a1 + 40)));
  v3 = (void *)v2;
  if (v2)
  {
    v5 = (void *)v2;
    v4 = objc_opt_respondsToSelector(v2, "markAsWatchedWithMediaIdentifier:completion:");
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "markAsWatchedWithMediaIdentifier:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      v3 = v5;
    }
  }

}

- (void)clientConnection:(id)a3 removeItemForDeviceWithIdentifier:(id)a4 mediaIdentifier:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __92__TVRDServer_clientConnection_removeItemForDeviceWithIdentifier_mediaIdentifier_completion___block_invoke;
  v11[3] = &unk_10001C8F8;
  v11[4] = self;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v8 = v14;
  v9 = v13;
  v10 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

}

void __92__TVRDServer_clientConnection_removeItemForDeviceWithIdentifier_mediaIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_cachedDeviceForIdentifier:", *(_QWORD *)(a1 + 40)));
  v3 = (void *)v2;
  if (v2)
  {
    v5 = (void *)v2;
    v4 = objc_opt_respondsToSelector(v2, "removeItemWithMediaIdentifier:completion:");
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "removeItemWithMediaIdentifier:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      v3 = v5;
    }
  }

}

- (void)clientConnection:(id)a3 playItem:(id)a4 deviceIdentifier:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v9 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __68__TVRDServer_clientConnection_playItem_deviceIdentifier_completion___block_invoke;
  v13[3] = &unk_10001C8F8;
  v13[4] = self;
  v14 = a5;
  v15 = v9;
  v16 = a6;
  v10 = v16;
  v11 = v9;
  v12 = v14;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);

}

void __68__TVRDServer_clientConnection_playItem_deviceIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_cachedDeviceForIdentifier:", *(_QWORD *)(a1 + 40)));
  v3 = (void *)v2;
  if (v2)
  {
    v5 = (void *)v2;
    v4 = objc_opt_respondsToSelector(v2, "playItem:completion:");
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "playItem:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      v3 = v5;
    }
  }

}

- (void)clientConnection:(id)a3 requestsSendingInputText:(id)a4 toDeviceIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v7 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __75__TVRDServer_clientConnection_requestsSendingInputText_toDeviceIdentifier___block_invoke;
  block[3] = &unk_10001C8D0;
  block[4] = self;
  v11 = a5;
  v12 = v7;
  v8 = v7;
  v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void __75__TVRDServer_clientConnection_requestsSendingInputText_toDeviceIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_cachedDeviceForIdentifier:", *(_QWORD *)(a1 + 40)));
  if (v2)
  {
    v4 = v2;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "keyboardController"));
    objc_msgSend(v3, "setText:", *(_QWORD *)(a1 + 48));

    v2 = v4;
  }

}

- (void)clientConnection:(id)a3 requestsSendingInputReturnKeyToDeviceIdentifier:(id)a4
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __79__TVRDServer_clientConnection_requestsSendingInputReturnKeyToDeviceIdentifier___block_invoke;
  v5[3] = &unk_10001C858;
  v5[4] = self;
  v6 = a4;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

void __79__TVRDServer_clientConnection_requestsSendingInputReturnKeyToDeviceIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_cachedDeviceForIdentifier:", *(_QWORD *)(a1 + 40)));
  if (v1)
  {
    v3 = v1;
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "keyboardController"));
    objc_msgSend(v2, "sendReturnKey");

    v1 = v3;
  }

}

- (void)clientConnection:(id)a3 requestsSendingInputDataPayload:(id)a4 toDeviceIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v7 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __82__TVRDServer_clientConnection_requestsSendingInputDataPayload_toDeviceIdentifier___block_invoke;
  block[3] = &unk_10001C8D0;
  block[4] = self;
  v11 = a5;
  v12 = v7;
  v8 = v7;
  v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void __82__TVRDServer_clientConnection_requestsSendingInputDataPayload_toDeviceIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_cachedDeviceForIdentifier:", *(_QWORD *)(a1 + 40)));
  if (v2)
  {
    v4 = v2;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "keyboardController"));
    objc_msgSend(v3, "sendTextActionPayload:", *(_QWORD *)(a1 + 48));

    v2 = v4;
  }

}

- (void)clientConnectionRequestsStartingDeviceQuery:(id)a3 withResponse:(id)a4
{
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  TVRDServer *v10;
  id v11;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __71__TVRDServer_clientConnectionRequestsStartingDeviceQuery_withResponse___block_invoke;
  block[3] = &unk_10001C920;
  v9 = a3;
  v10 = self;
  v11 = a4;
  v6 = v11;
  v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void __71__TVRDServer_clientConnectionRequestsStartingDeviceQuery_withResponse___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;

  v2 = _TVRDXPCLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v9 = 138543362;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ requested starting general device query", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "addObject:", *(_QWORD *)(a1 + 32));
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "count") == (id)1)
  {
    objc_msgSend(*(id *)(a1 + 40), "_startGeneralDeviceQuery");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "devices"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCDeviceState setOfStatesFromDevices:](TVRCDeviceState, "setOfStatesFromDevices:", v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteObjectProxy"));
    objc_msgSend(v8, "deviceQueryUpdatedDiscoveredDevices:", v7);

  }
}

- (void)clientConnectionRequestsEndingDeviceQuery:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  TVRDServer *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __56__TVRDServer_clientConnectionRequestsEndingDeviceQuery___block_invoke;
  v5[3] = &unk_10001C858;
  v6 = a3;
  v7 = self;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

void __56__TVRDServer_clientConnectionRequestsEndingDeviceQuery___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v2 = _TVRDXPCLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v8 = 138543362;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ requested ending general device query", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "removeObject:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "count"))
  {
    v5 = _TVRDXPCLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not ending device query - %{public}@", (uint8_t *)&v8, 0xCu);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_stopGeneralDeviceQuery");
  }
}

- (void)clientConnection:(id)a3 requestsSuggestedDeviceWithResponse:(id)a4
{
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  TVRDServer *v10;
  id v11;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __67__TVRDServer_clientConnection_requestsSuggestedDeviceWithResponse___block_invoke;
  block[3] = &unk_10001C920;
  v9 = a3;
  v10 = self;
  v11 = a4;
  v6 = v11;
  v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void __67__TVRDServer_clientConnection_requestsSuggestedDeviceWithResponse___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;

  v2 = _TVRDXPCLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v8 = 138543362;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ requested suggested device", (uint8_t *)&v8, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "irSessionManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "suggestedDevices"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCDeviceState arrayOfStatesFromDevices:](TVRCDeviceState, "arrayOfStatesFromDevices:", v6));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)clientConnectionSeveredConnection:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;

  v4 = a3;
  -[NSMutableSet removeObject:](self->_clientConnections, "removeObject:", v4);
  v5 = _TVRDXPCLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = -[NSMutableSet count](self->_clientConnections, "count");
    v8 = 138543618;
    v9 = v4;
    v10 = 2048;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Removed %{public}@. Total connections: %ld", (uint8_t *)&v8, 0x16u);
  }

}

- (void)clientConnection:(id)a3 requestsSendingEvent:(id)a4 toDeviceWithIdentifier:(id)a5 options:(id)a6 response:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  id v20;

  v11 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __92__TVRDServer_clientConnection_requestsSendingEvent_toDeviceWithIdentifier_options_response___block_invoke;
  block[3] = &unk_10001C948;
  block[4] = self;
  v17 = a5;
  v18 = v11;
  v19 = a6;
  v20 = a7;
  v12 = v20;
  v13 = v19;
  v14 = v11;
  v15 = v17;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void __92__TVRDServer_clientConnection_requestsSendingEvent_toDeviceWithIdentifier_options_response___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_cachedDeviceForIdentifier:", *(_QWORD *)(a1 + 40)));
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "sendEvent:options:response:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v2 = v3;
  }

}

- (void)clientConnection:(id)a3 requestsEnablingRemoteOnLockscreen:(BOOL)a4 forDeviceWithIdentifier:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  TVRDServer *v12;
  BOOL v13;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __90__TVRDServer_clientConnection_requestsEnablingRemoteOnLockscreen_forDeviceWithIdentifier___block_invoke;
  v9[3] = &unk_10001C970;
  v13 = a4;
  v10 = a3;
  v11 = a5;
  v12 = self;
  v7 = v11;
  v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

}

void __90__TVRDServer_clientConnection_requestsEnablingRemoteOnLockscreen_forDeviceWithIdentifier___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  char *v12;
  __CFString *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  void *v27;

  v2 = _TVRDXPCLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(const __CFString **)(a1 + 32);
    v5 = CFSTR("enable");
    if (!*(_BYTE *)(a1 + 56))
      v5 = CFSTR("disable");
    *(_DWORD *)buf = 138543618;
    v23 = v4;
    v24 = 2112;
    v25 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ requested to %@ remote on lockscreen", buf, 0x16u);
  }

  if (*(_QWORD *)(a1 + 40))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_cachedDeviceForIdentifier:"));
    v7 = v6;
    v8 = !v6 || objc_msgSend(v6, "connectionType") != (id)1 || objc_msgSend(v7, "attentionState") != (id)1;
    v9 = _TVRDXPCLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (v8)
        v11 = CFSTR("awake");
      else
        v11 = CFSTR("asleep");
      v12 = (char *)objc_msgSend(v7, "attentionState");
      if ((unint64_t)(v12 - 1) >= 3)
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %ld)"), v12));
      else
        v13 = off_10001CA30[(_QWORD)(v12 - 1)];
      v16 = TVRCDeviceConnectionTypeDescription(objc_msgSend(v7, "connectionType"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      *(_DWORD *)buf = 138412802;
      v23 = v11;
      v24 = 2114;
      v25 = v13;
      v26 = 2114;
      v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Device is %@ attentionState:%{public}@ connectionType:%{public}@", buf, 0x20u);

    }
    if (*(_BYTE *)(a1 + 56))
      v18 = v8;
    else
      v18 = 1;
    if ((v18 & 1) != 0)
    {
      if (*(_BYTE *)(a1 + 56))
      {
LABEL_28:
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[TVRDAssertionManager sharedInstance](TVRDAssertionManager, "sharedInstance"));
        objc_msgSend(v19, "acquireLockScreenAssertion");
LABEL_31:

        goto LABEL_32;
      }
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "systemMonitor"));
      v21 = objc_msgSend(v20, "screenLocked");

      if ((v21 & 1) != 0)
        goto LABEL_28;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[TVRDAssertionManager sharedInstance](TVRDAssertionManager, "sharedInstance"));
    objc_msgSend(v19, "releaseLockScreenAssertion");
    goto LABEL_31;
  }
  if (*(_BYTE *)(a1 + 56))
  {
    v14 = _TVRDXPCLog();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Client requested to enable lock screen assertion for nil device identifier. Releasing lock screen assertion", buf, 2u);
    }

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVRDAssertionManager sharedInstance](TVRDAssertionManager, "sharedInstance"));
  objc_msgSend(v7, "releaseLockScreenAssertion");
LABEL_32:

}

- (BOOL)clientConnection:(id)a3 isConnectedToDeviceWithIdentifier:(id)a4
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  id v7;
  NSObject *v8;
  int v10;
  void *v11;
  __int16 v12;
  _BOOL4 v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer _cachedDeviceForIdentifier:](self, "_cachedDeviceForIdentifier:", a4));
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "connectionState") == (id)2;
  else
    v6 = 0;
  v7 = _TVRDXPCLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = v5;
    v12 = 1024;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Connection to %{public}@ : %d", (uint8_t *)&v10, 0x12u);
  }

  return v6;
}

- (void)clientConnection:(id)a3 requestsEnablingFindingSession:(BOOL)a4 forDeviceWithIdentifier:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  TVRDServer *v11;
  id v12;
  BOOL v13;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __86__TVRDServer_clientConnection_requestsEnablingFindingSession_forDeviceWithIdentifier___block_invoke;
  v9[3] = &unk_10001C970;
  v13 = a4;
  v10 = a3;
  v11 = self;
  v12 = a5;
  v7 = v12;
  v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

}

void __86__TVRDServer_clientConnection_requestsEnablingFindingSession_forDeviceWithIdentifier___block_invoke(uint64_t a1)
{
  int v2;
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  int v13;
  uint64_t v14;

  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = _TVRDXPCLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v13 = 138543362;
      v14 = v6;
      v7 = "Client connection %{public}@ requested to start finding session";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v13, 0xCu);
    }
  }
  else if (v5)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v13 = 138543362;
    v14 = v8;
    v7 = "Client connection %{public}@ requested to stop finding session";
    goto LABEL_6;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_cachedDeviceForIdentifier:", *(_QWORD *)(a1 + 48)));
  v10 = v9;
  if (v9 && objc_msgSend(v9, "connectionType") == (id)1)
  {
    objc_msgSend(v10, "_enableFindingSession:", *(unsigned __int8 *)(a1 + 56));
  }
  else
  {
    v11 = _TVRDXPCLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __86__TVRDServer_clientConnection_requestsEnablingFindingSession_forDeviceWithIdentifier___block_invoke_cold_1();

  }
}

- (void)deviceBeganConnecting:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  _BYTE v25[128];

  v4 = a3;
  v5 = _TVRDXPCLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device started connecting: %{public}@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer _interestedClientProcessConnectionsForDevice:](self, "_interestedClientProcessConnectionsForDevice:", v4));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v13 = _TVRDXPCLog();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v22 = v12;
          v23 = 2114;
          v24 = v4;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that device started connecting: %{public}@", buf, 0x16u);
        }

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "remoteObjectProxy"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCDeviceState deviceStateFromDevice:](TVRCDeviceState, "deviceStateFromDevice:", v4));
        objc_msgSend(v15, "deviceUpdatedState:", v16);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v9);
  }

}

- (BOOL)deviceShouldAllowConnectionAuthentication:(id)a3
{
  return 1;
}

- (void)device:(id)a3 encounteredAuthenticationChallenge:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  NSMutableDictionary *authChallengesByID;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSMutableDictionary *v15;
  void *v16;
  TVRDServer *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  id v39;

  v6 = a3;
  v7 = a4;
  v8 = _TVRDXPCLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v39 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Encountered auth challenge for device: %{public}@", buf, 0xCu);
  }

  authChallengesByID = self->_authChallengesByID;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](authChallengesByID, "objectForKey:", v11));

  if (v12)
  {
    v13 = _TVRDXPCLog();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Already a pending auth challenge for device %@, cancelling.", buf, 0xCu);
    }

    objc_msgSend(v12, "cancel");
  }
  v31 = v12;
  v15 = self->_authChallengesByID;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v7, v16);

  v17 = self;
  v18 = v6;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[TVRDServer _interestedClientProcessConnectionsForDevice:](v17, "_interestedClientProcessConnectionsForDevice:", v6));
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v24 = _TVRDXPCLog();
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v39 = v23;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Sending auth challenge to interested client %{public}@", buf, 0xCu);
        }

        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "remoteObjectProxy"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCDeviceState deviceStateFromDevice:](TVRCDeviceState, "deviceStateFromDevice:", v18));
        v28 = objc_msgSend(v7, "challengeType");
        v29 = objc_msgSend(v7, "challengeAttributes");
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "codeToEnterOnDevice"));
        objc_msgSend(v26, "deviceWithState:encounteredAuthChallengeOfType:attributes:codeToEnterOnDevice:throttleSeconds:", v27, v28, v29, v30, objc_msgSend(v7, "throttleSeconds"));

      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v20);
  }

}

- (void)deviceConnected:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSMutableDictionary *authChallengesByID;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSDate *v24;
  NSDate *lastConnectionTimestamp;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  _BYTE v39[128];

  v4 = a3;
  v5 = _TVRDXPCLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v35 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device became connected: %{public}@", buf, 0xCu);
  }

  authChallengesByID = self->_authChallengesByID;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  -[NSMutableDictionary removeObjectForKey:](authChallengesByID, "removeObjectForKey:", v8);

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allIdentifiers"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v9);
        -[NSCountedSet addObject:](self->_deviceIdentifiers, "addObject:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v11);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer _interestedClientProcessConnectionsForDevice:](self, "_interestedClientProcessConnectionsForDevice:", v4));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j);
        v20 = _TVRDXPCLog();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v35 = v19;
          v36 = 2114;
          v37 = v4;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that device became connected: %{public}@", buf, 0x16u);
        }

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "remoteObjectProxy"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCDeviceState deviceStateFromDevice:](TVRCDeviceState, "deviceStateFromDevice:", v4));
        objc_msgSend(v22, "deviceUpdatedState:", v23);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v16);
  }
  objc_storeWeak((id *)&self->_lastConnectedDevice, v4);
  v24 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  lastConnectionTimestamp = self->_lastConnectionTimestamp;
  self->_lastConnectionTimestamp = v24;

  -[TVRDServer _switchToCurrentUserProfileForDevice:](self, "_switchToCurrentUserProfileForDevice:", v4);
}

- (void)_switchToCurrentUserProfileForDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  char *v10;
  __CFString *v11;
  _QWORD v12[4];
  NSObject *v13;
  uint8_t buf[4];
  __CFString *v15;
  uint64_t v16;
  NSObject *v17;

  v3 = a3;
  if (objc_msgSend(v3, "attentionState") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_activeiCloudAccount"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_altDSID"));

    if (v6)
    {
      v7 = TVRCSwitchActiveUserAccountEvent;
      v16 = TVRCiCloudAltDSID;
      v17 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = __51__TVRDServer__switchToCurrentUserProfileForDevice___block_invoke;
      v12[3] = &unk_10001C998;
      v6 = v6;
      v13 = v6;
      objc_msgSend(v3, "sendEvent:options:response:", v7, v8, v12);

    }
  }
  else
  {
    v9 = _TVRDXPCLog();
    v6 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (char *)objc_msgSend(v3, "attentionState");
      if ((unint64_t)(v10 - 1) >= 3)
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %ld)"), v10));
      else
        v11 = off_10001CA30[(_QWORD)(v10 - 1)];
      *(_DWORD *)buf = 138543362;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "device is: %{public}@. Ignore switching users", buf, 0xCu);

    }
  }

}

void __51__TVRDServer__switchToCurrentUserProfileForDevice___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v5 = a4;
  v6 = _TVRDXPCLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __51__TVRDServer__switchToCurrentUserProfileForDevice___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138412290;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully switched to account %@", (uint8_t *)&v10, 0xCu);
  }

}

- (void)device:(id)a3 disconnectedForReason:(int64_t)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSMutableDictionary *authChallengesByID;
  void *v11;
  id v12;
  __int128 v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  id obj;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  _BYTE v46[128];

  v7 = a3;
  v32 = a5;
  v8 = _TVRDXPCLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v43 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Device disconnected: %{public}@", buf, 0xCu);
  }

  authChallengesByID = self->_authChallengesByID;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  -[NSMutableDictionary removeObjectForKey:](authChallengesByID, "removeObjectForKey:", v11);

  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[TVRDServer _interestedClientProcessConnectionsForDevice:](self, "_interestedClientProcessConnectionsForDevice:", v7));
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v38;
    *(_QWORD *)&v13 = 138543618;
    v29 = v13;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v38 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v16);
        v18 = _TVRDXPCLog();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v29;
          v43 = v17;
          v44 = 2114;
          v45 = v7;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that device disconnected: %{public}@", buf, 0x16u);
        }

        v20 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCDeviceState deviceStateFromDevice:](TVRCDeviceState, "deviceStateFromDevice:", v7));
        objc_msgSend(v20, "setDisconnectReason:", a4);
        objc_msgSend(v20, "setDisconnectError:", v32);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "remoteObjectProxy"));
        objc_msgSend(v21, "deviceUpdatedState:", v20);

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
        objc_msgSend(v17, "removeInterestForDeviceWithIdentifier:", v22);

        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "alternateIdentifiers"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "allValues"));

        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v34;
          do
          {
            v28 = 0;
            do
            {
              if (*(_QWORD *)v34 != v27)
                objc_enumerationMutation(v24);
              objc_msgSend(v17, "removeInterestForDeviceWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v28), v29);
              v28 = (char *)v28 + 1;
            }
            while (v26 != v28);
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          }
          while (v26);
        }

        v16 = (char *)v16 + 1;
      }
      while (v16 != v14);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v14);
  }

}

- (void)deviceNameChanged:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  _BYTE v23[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer _interestedClientProcessConnectionsForDevice:](self, "_interestedClientProcessConnectionsForDevice:", v4));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v11 = _TVRDXPCLog();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v20 = v10;
          v21 = 2114;
          v22 = v4;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that device name changed: %{public}@", buf, 0x16u);
        }

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "remoteObjectProxy"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCDeviceState deviceStateFromDevice:](TVRCDeviceState, "deviceStateFromDevice:", v4));
        objc_msgSend(v13, "deviceUpdatedState:", v14);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v7);
  }

}

- (void)device:(id)a3 updatedSupportedButtons:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer _interestedClientProcessConnectionsForDevice:](self, "_interestedClientProcessConnectionsForDevice:", v5));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = _TVRDXPCLog();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v21 = v11;
          v22 = 2114;
          v23 = v5;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that device updated supported buttons: %{public}@", buf, 0x16u);
        }

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "remoteObjectProxy"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCDeviceState deviceStateFromDevice:](TVRCDeviceState, "deviceStateFromDevice:", v5));
        objc_msgSend(v14, "deviceUpdatedState:", v15);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v8);
  }

}

- (void)device:(id)a3 updatedAttentionState:(int64_t)a4
{
  __CFString *v6;
  id v7;
  NSObject *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  __CFString *v30;

  v6 = (__CFString *)a3;
  v7 = _TVRDXPCLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString name](v6, "name"));
    if ((unint64_t)(a4 - 1) >= 3)
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %ld)"), a4));
    else
      v10 = off_10001CA30[a4 - 1];
    *(_DWORD *)buf = 138543618;
    v28 = v9;
    v29 = 2114;
    v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ updateState to: %{public}@", buf, 0x16u);

  }
  switch(a4)
  {
    case 0:
    case 3:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVRDAssertionManager sharedInstance](TVRDAssertionManager, "sharedInstance"));
      objc_msgSend(v11, "acquireLockScreenAssertion");
      goto LABEL_10;
    case 1:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVRDAssertionManager sharedInstance](TVRDAssertionManager, "sharedInstance"));
      objc_msgSend(v11, "releaseLockScreenAssertion");
      goto LABEL_10;
    case 2:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVRDAssertionManager sharedInstance](TVRDAssertionManager, "sharedInstance"));
      objc_msgSend(v11, "startAssertionExpirationTimer");
LABEL_10:

      break;
    default:
      break;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer _interestedClientProcessConnectionsForDevice:](self, "_interestedClientProcessConnectionsForDevice:", v6));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v18 = _TVRDXPCLog();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v28 = v17;
          v29 = 2114;
          v30 = v6;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that device's attention state updated: %{public}@", buf, 0x16u);
        }

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "remoteObjectProxy"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCDeviceState deviceStateFromDevice:](TVRCDeviceState, "deviceStateFromDevice:", v6));
        objc_msgSend(v20, "deviceUpdatedState:", v21);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }

}

- (void)device:(id)a3 updatedSiriRemoteFindingState:(int64_t)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  __CFString *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  __CFString *v26;
  __int16 v27;
  id v28;
  _BYTE v29[128];

  v6 = a3;
  v7 = _TVRDXPCLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a4 < 7 && ((0x77u >> a4) & 1) != 0)
    {
      v10 = off_10001CA48[a4];
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown %@"), v9));

    }
    *(_DWORD *)buf = 138543362;
    v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updated remote finding state to: %{public}@", buf, 0xCu);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer _interestedClientProcessConnectionsForDevice:](self, "_interestedClientProcessConnectionsForDevice:", v6));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(__CFString **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v17 = _TVRDXPCLog();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v26 = v16;
          v27 = 2114;
          v28 = v6;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that siri remote finding session was updated: %{public}@", buf, 0x16u);
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString remoteObjectProxy](v16, "remoteObjectProxy"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCDeviceState deviceStateFromDevice:](TVRCDeviceState, "deviceStateFromDevice:", v6));
        objc_msgSend(v19, "deviceUpdatedState:", v20);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v13);
  }

}

- (void)device:(id)a3 updatedPairedRemoteInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = _TVRDXPCLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v27 = v6;
    v28 = 2114;
    v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "'%{public}@' pairedRemoteInfo: %{public}@", buf, 0x16u);
  }
  v20 = v7;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer _interestedClientProcessConnectionsForDevice:](self, "_interestedClientProcessConnectionsForDevice:", v6));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v16 = _TVRDXPCLog();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v27 = v15;
          v28 = 2114;
          v29 = v6;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that paired remote was updated: %{public}@", buf, 0x16u);
        }

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "remoteObjectProxy"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCDeviceState deviceStateFromDevice:](TVRCDeviceState, "deviceStateFromDevice:", v6));
        objc_msgSend(v18, "deviceUpdatedState:", v19);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

}

- (void)device:(id)a3 updatedNowPlayingInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = _TVRDXPCLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v27 = v6;
    v28 = 2112;
    v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "'%{public}@' nowPlayingInfo: %@", buf, 0x16u);
  }
  v20 = v7;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer _interestedClientProcessConnectionsForDevice:](self, "_interestedClientProcessConnectionsForDevice:", v6));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v16 = _TVRDXPCLog();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v27 = v15;
          v28 = 2114;
          v29 = v6;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that now playing info was updated: %{public}@", buf, 0x16u);
        }

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "remoteObjectProxy"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCDeviceState deviceStateFromDevice:](TVRCDeviceState, "deviceStateFromDevice:", v6));
        objc_msgSend(v18, "deviceUpdatedState:", v19);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

}

- (void)device:(id)a3 supportsFindMyRemote:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  TVRXDeviceQuery *generalDeviceQuery;
  id v11;
  __int128 v12;
  id v13;
  uint64_t v14;
  _UNKNOWN **v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  _UNKNOWN **v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  __int128 v33;
  NSMutableSet *obj;
  unsigned int v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  id v42;
  __int16 v43;
  const char *v44;

  v4 = a4;
  v6 = a3;
  v7 = _TVRDXPCLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = "no";
    if (v4)
      v9 = "yes";
    *(_DWORD *)buf = 138543618;
    v42 = v6;
    v43 = 2080;
    v44 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "'%{public}@' supports find my remote: %s", buf, 0x16u);
  }

  generalDeviceQuery = self->_generalDeviceQuery;
  if (generalDeviceQuery && -[TVRXDeviceQuery isRunning](generalDeviceQuery, "isRunning"))
    -[TVRDServer deviceQueryDidUpdateDevices:](self, "deviceQueryDidUpdateDevices:", self->_generalDeviceQuery);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = self->_clientConnections;
  v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v37;
    v15 = &CFGetInt64_ptr;
    *(_QWORD *)&v12 = 138543618;
    v33 = v12;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v14)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v18 = v15[35];
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "alternateIdentifiers", v33));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allValues"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "setWithArray:", v20));

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "deviceIdentifiers"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
        if (objc_msgSend(v22, "containsObject:", v23))
        {

        }
        else
        {
          v24 = v6;
          v25 = v13;
          v26 = v14;
          v27 = v15;
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "deviceIdentifiers"));
          v35 = objc_msgSend(v28, "intersectsSet:", v21);

          v15 = v27;
          v14 = v26;
          v13 = v25;
          v6 = v24;

          if (!v35)
            goto LABEL_19;
        }
        v29 = _TVRDXPCLog();
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v33;
          v42 = v17;
          v43 = 2114;
          v44 = (const char *)v6;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that paired remote was updated: %{public}@", buf, 0x16u);
        }

        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "remoteObjectProxy"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCDeviceState deviceStateFromDevice:](TVRCDeviceState, "deviceStateFromDevice:", v6));
        objc_msgSend(v31, "deviceUpdatedState:", v32);

LABEL_19:
      }
      v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v13);
  }

}

- (void)devicePoweredOff:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;

  v3 = _TVRDXPCLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[TVRDServer devicePoweredOff:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVRDAssertionManager sharedInstance](TVRDAssertionManager, "sharedInstance"));
  objc_msgSend(v5, "releaseLockScreenAssertion");

}

- (void)keyboardController:(id)a3 beganTextEditingWithAttributes:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  double v16;
  id WeakRetained;
  NSDate *lastConnectionTimestamp;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];

  v5 = (id)objc_claimAutoreleasedReturnValue(-[TVRDServer _deviceForKeyboardController:](self, "_deviceForKeyboardController:", a3, a4));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer _interestedClientProcessConnectionsForDevice:](self, "_interestedClientProcessConnectionsForDevice:", v5));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          v12 = _TVRDXPCLog();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v24 = v11;
            v25 = 2114;
            v26 = v5;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that device updated keyboard state: %{public}@", buf, 0x16u);
          }

          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "remoteObjectProxy"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCDeviceState deviceStateFromDevice:](TVRCDeviceState, "deviceStateFromDevice:", v5));
          objc_msgSend(v14, "deviceUpdatedState:", v15);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v8);
    }
    -[NSDate timeIntervalSinceNow](self->_lastConnectionTimestamp, "timeIntervalSinceNow");
    if (fabs(v16) < 5.0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_lastConnectedDevice);

      if (WeakRetained == v5)
      {
        lastConnectionTimestamp = self->_lastConnectionTimestamp;
        self->_lastConnectionTimestamp = 0;

        objc_storeWeak((id *)&self->_lastConnectedDevice, 0);
      }
    }

  }
}

- (void)keyboardControllerEndedTextEditing:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer _deviceForKeyboardController:](self, "_deviceForKeyboardController:", a3));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer _interestedClientProcessConnectionsForDevice:](self, "_interestedClientProcessConnectionsForDevice:", v4));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          v11 = _TVRDXPCLog();
          v12 = objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v20 = v10;
            v21 = 2114;
            v22 = v4;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that device updated keyboard state: %{public}@", buf, 0x16u);
          }

          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "remoteObjectProxy"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCDeviceState deviceStateFromDevice:](TVRCDeviceState, "deviceStateFromDevice:", v4));
          objc_msgSend(v13, "deviceUpdatedState:", v14);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v7);
    }

  }
}

- (void)keyboardController:(id)a3 didUpdateText:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer _deviceForKeyboardController:](self, "_deviceForKeyboardController:", a3, a4));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer _interestedClientProcessConnectionsForDevice:](self, "_interestedClientProcessConnectionsForDevice:", v5));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v12 = _TVRDXPCLog();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v21 = v11;
            v22 = 2114;
            v23 = v5;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that device updated keyboard state: %{public}@", buf, 0x16u);
          }

          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "remoteObjectProxy"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCDeviceState deviceStateFromDevice:](TVRCDeviceState, "deviceStateFromDevice:", v5));
          objc_msgSend(v14, "deviceUpdatedState:", v15);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v8);
    }

  }
}

- (void)keyboardController:(id)a3 didUpdateAttributes:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer _deviceForKeyboardController:](self, "_deviceForKeyboardController:", a3, a4));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer _interestedClientProcessConnectionsForDevice:](self, "_interestedClientProcessConnectionsForDevice:", v5));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v12 = _TVRDXPCLog();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v21 = v11;
            v22 = 2114;
            v23 = v5;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that device updated keyboard state: %{public}@", buf, 0x16u);
          }

          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "remoteObjectProxy"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCDeviceState deviceStateFromDevice:](TVRCDeviceState, "deviceStateFromDevice:", v5));
          objc_msgSend(v14, "deviceUpdatedState:", v15);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v8);
    }

  }
}

- (void)_becameInterestedInDeviceWithIdentifier:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  TVRXDeviceLocator *deviceSearch;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  uint64_t v22;

  v4 = a3;
  v5 = _TVRDXPCLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Server became interested in %{public}@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer _deviceForIdentifierInDeviceQuery:](self, "_deviceForIdentifierInDeviceQuery:", v4));
  if (v7)
  {
    v8 = _TVRDXPCLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer cachedDevices](self, "cachedDevices"));
      *(_DWORD *)buf = 138543618;
      v20 = v7;
      v21 = 2112;
      v22 = (uint64_t)v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Device Query contains device %{public}@. Adding to cachedDevices: %@", buf, 0x16u);

    }
    -[NSMutableSet addObject:](self->_cachedDevices, "addObject:", v7);
    -[TVRDServer _connectToDeviceIfNeeded:](self, "_connectToDeviceIfNeeded:", v7);
  }
  else
  {
    v11 = -[TVRXDeviceQuery isRunning](self->_generalDeviceQuery, "isRunning");
    v12 = _TVRDXPCLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v14)
      {
        *(_DWORD *)buf = 138412546;
        v20 = 0;
        v21 = 2048;
        v22 = 0x4024000000000000;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Device Query does not contain device %@, but device query is running. Putting a %.1f second timer to find the device", buf, 0x16u);
      }

      -[NSMutableSet addObject:](self->_identifiersRequestingConnection, "addObject:", v4);
      -[TVRDServer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_informClientCouldNotLocateDeviceWithIdentifier:", v4, 10.0);
    }
    else
    {
      if (v14)
      {
        *(_DWORD *)buf = 138543362;
        v20 = v4;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No device query running. Will attempt to locate device with ID %{public}@", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      deviceSearch = self->_deviceSearch;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = __54__TVRDServer__becameInterestedInDeviceWithIdentifier___block_invoke;
      v16[3] = &unk_10001C9C0;
      objc_copyWeak(&v18, (id *)buf);
      v16[4] = self;
      v17 = v4;
      -[TVRXDeviceLocator findDeviceWithIdentifier:timeout:completion:](deviceSearch, "findDeviceWithIdentifier:timeout:completion:", v17, v16, 10.0);

      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
  }

}

void __54__TVRDServer__becameInterestedInDeviceWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = _TVRDXPCLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cachedDevices"));
      v15 = 138543618;
      v16 = v3;
      v17 = 2112;
      v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Search found device %{public}@. Adding to cachedDevices: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_msgSend(WeakRetained[4], "addObject:", v3);
    objc_msgSend(WeakRetained, "_connectToDeviceIfNeeded:", v3);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __54__TVRDServer__becameInterestedInDeviceWithIdentifier___block_invoke_cold_1(a1, v7, v9, v10, v11, v12, v13, v14);

    objc_msgSend(WeakRetained, "_informClientCouldNotLocateDeviceWithIdentifier:", *(_QWORD *)(a1 + 40));
  }

}

- (void)_informClientCouldNotLocateDeviceWithIdentifier:(id)a3
{
  NSMutableSet *identifiersRequestingConnection;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  identifiersRequestingConnection = self->_identifiersRequestingConnection;
  v5 = a3;
  -[NSMutableSet removeObject:](identifiersRequestingConnection, "removeObject:", v5);
  v8 = objc_msgSend(objc_alloc((Class)TVRXDevice), "_init");
  objc_msgSend(v8, "_setIdentifier:alternateIdentifiers:name:model:supportedButtons:", v5, &__NSDictionary0__struct, 0, 0, 0);

  v6 = TVRCMakeError(103, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[TVRDServer device:disconnectedForReason:error:](self, "device:disconnectedForReason:error:", v8, 3, v7);

}

- (id)_deviceForIdentifierInDeviceQuery:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVRXDeviceQuery devices](self->_generalDeviceQuery, "devices", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "containsIdentifier:", v4))
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_lostInterestInDeviceWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  -[TVRXDeviceLocator cancelSearchForDeviceWithIdentifier:](self->_deviceSearch, "cancelSearchForDeviceWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_authChallengesByID, "objectForKey:", v4));
  objc_msgSend(v5, "cancel");
  -[NSMutableDictionary removeObjectForKey:](self->_authChallengesByID, "removeObjectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer _cachedDeviceForIdentifier:](self, "_cachedDeviceForIdentifier:", v4));
  if (v6)
  {
    v7 = _TVRDXPCLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543618;
      v13 = v4;
      v14 = 2114;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Server lost interest in %{public}@, calling -disconnect on TVRCDevice %{public}@", (uint8_t *)&v12, 0x16u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keyboardController"));
    objc_msgSend(v9, "setDelegate:", 0);

    objc_msgSend(v6, "disconnect");
    -[NSMutableSet removeObject:](self->_cachedDevices, "removeObject:", v6);
  }
  if (-[NSMutableSet containsObject:](self->_identifiersRequestingConnection, "containsObject:", v4))
  {
    v10 = _TVRDXPCLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Server lost interest in %{public}@, removing identifier", (uint8_t *)&v12, 0xCu);
    }

    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_informClientCouldNotLocateDeviceWithIdentifier:", v4);
    -[NSMutableSet removeObject:](self->_identifiersRequestingConnection, "removeObject:", v4);
  }

}

- (id)_interestedClientProcessConnectionsForDevice:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  _UNKNOWN **v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  _UNKNOWN **v19;
  void *v20;
  NSMutableSet *obj;
  id v23;
  unsigned int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v4 = a3;
  v23 = objc_alloc_init((Class)NSMutableArray);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = self->_clientConnections;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    v8 = &CFGetInt64_ptr;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v11 = v8[35];
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alternateIdentifiers"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allValues"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "setWithArray:", v13));

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceIdentifiers"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
        if (objc_msgSend(v15, "containsObject:", v16))
        {

        }
        else
        {
          v17 = v6;
          v18 = v7;
          v19 = v8;
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceIdentifiers"));
          v24 = objc_msgSend(v20, "intersectsSet:", v14);

          v8 = v19;
          v7 = v18;
          v6 = v17;

          if (!v24)
            goto LABEL_10;
        }
        objc_msgSend(v23, "addObject:", v10);
LABEL_10:

      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v6);
  }

  return v23;
}

- (id)_deviceForKeyboardController:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_cachedDevices;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "keyboardController", (_QWORD)v12));

        if (v10 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_hasNowPlayingControlsForButtons:(id)a3
{
  id v4;
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        v7 |= -[TVRDServer _isButtonOfNowPlayingType:](self, "_isButtonOfNowPlayingType:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7 & 1;
}

- (BOOL)_isButtonOfNowPlayingType:(id)a3
{
  unint64_t v3;

  v3 = (unint64_t)objc_msgSend(a3, "buttonType");
  return (v3 & 0xFFFFFFFFFFFFFFFELL) == 6 || (v3 & 0xFFFFFFFFFFFFFFFELL) == 8 || v3 == 31;
}

- (void)_connectToDeviceIfNeeded:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;

  v4 = a3;
  v5 = _TVRDXPCLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v29 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Connecting to device: %{public}@", buf, 0xCu);
  }

  objc_msgSend(v4, "setDelegate:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyboardController"));
  objc_msgSend(v7, "setDelegate:", self);

  if (objc_msgSend(v4, "connectionState") == (id)2)
  {
    v8 = _TVRDXPCLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Device %{public}@ is already connected, informing clients...", buf, 0xCu);
    }

    -[TVRDServer deviceConnected:](self, "deviceConnected:", v4);
  }
  else
  {
    if (objc_msgSend(v4, "connectionState") == (id)1)
    {
      objc_msgSend(v4, "setDelegate:", 0);
      objc_msgSend(v4, "disconnect");
    }
    objc_msgSend(v4, "setDelegate:", self);
    objc_msgSend(v4, "connect");
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allIdentifiers", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer connectionContextByID](self, "connectionContextByID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allKeys"));
        v18 = objc_msgSend(v17, "containsObject:", v15);

        if (v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer connectionContextByID](self, "connectionContextByID"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v15));
          v21 = objc_msgSend(v20, "integerValue");

          v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer irSessionManager](self, "irSessionManager"));
          objc_msgSend(v22, "updateDevice:withConnectionContext:", v4, v21);

        }
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

}

- (id)_cachedDeviceForIdentifier:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_cachedDevices;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "containsIdentifier:", v4, (_QWORD)v11) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_startGeneralDeviceQuery
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void *v7;
  TVRXDeviceQuery *v8;
  TVRXDeviceQuery *generalDeviceQuery;
  id v10;
  NSObject *v11;
  int v12;
  void *v13;

  v3 = _TVRDXPCLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting general device query", (uint8_t *)&v12, 2u);
  }

  v5 = _TVRDXPCLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer cachedDevices](self, "cachedDevices"));
    v12 = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Existing cached devices: %@", (uint8_t *)&v12, 0xCu);

  }
  if (!self->_generalDeviceQuery)
  {
    v8 = (TVRXDeviceQuery *)objc_alloc_init((Class)TVRXDeviceQuery);
    generalDeviceQuery = self->_generalDeviceQuery;
    self->_generalDeviceQuery = v8;

    -[TVRXDeviceQuery setDelegate:](self->_generalDeviceQuery, "setDelegate:", self);
  }
  v10 = _TVRDXPCLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Clearing cached devices", (uint8_t *)&v12, 2u);
  }

  -[NSMutableSet removeAllObjects](self->_cachedDevices, "removeAllObjects");
  -[TVRXDeviceQuery start](self->_generalDeviceQuery, "start");
  -[TVRDServer _activateIRSessionManager](self, "_activateIRSessionManager");
}

- (void)_activateIRSessionManager
{
  TVRDIRSessionManager *irSessionManager;
  TVRDIRSessionManager *v4;
  TVRDIRSessionManager *v5;
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;
  id location;

  irSessionManager = self->_irSessionManager;
  if (!irSessionManager)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc_init(TVRDIRSessionManager);
    v5 = self->_irSessionManager;
    self->_irSessionManager = v4;

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __39__TVRDServer__activateIRSessionManager__block_invoke;
    v7[3] = &unk_10001C9E8;
    objc_copyWeak(&v8, &location);
    -[TVRDIRSessionManager setFilteredDeviceListHandler:](self->_irSessionManager, "setFilteredDeviceListHandler:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    irSessionManager = self->_irSessionManager;
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __39__TVRDServer__activateIRSessionManager__block_invoke_64;
  v6[3] = &unk_10001CA10;
  v6[4] = self;
  -[TVRDIRSessionManager activateWithCompletion:](irSessionManager, "activateWithCompletion:", v6);
}

void __39__TVRDServer__activateIRSessionManager__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v5 = WeakRetained;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "generalDeviceQuery"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "devices"));
      v8 = objc_msgSend(v7, "count");

      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCDeviceState arrayOfStatesFromDevices:](TVRCDeviceState, "arrayOfStatesFromDevices:", v3));
        v10 = _TVRDXPCLog();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v24 = v9;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "IRSessionManager updated devices with deviceStates %{public}@", buf, 0xCu);
        }

        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceQueryObservers", 0));
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v19;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v19 != v15)
                objc_enumerationMutation(v12);
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1)
                                                                                 + 8 * (_QWORD)v16), "remoteObjectProxy"));
              objc_msgSend(v17, "suggestedDevices:", v9);

              v16 = (char *)v16 + 1;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          }
          while (v14);
        }

      }
      else
      {
        objc_msgSend(v5, "setInformDeviceQueryObserversWithUpdatedSuggestions:", 1);
      }

    }
  }

}

void __39__TVRDServer__activateIRSessionManager__block_invoke_64(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a2;
  if (v3)
  {
    v4 = _TVRDXPCLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __39__TVRDServer__activateIRSessionManager__block_invoke_64_cold_1();
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "irSessionManager"));
    -[NSObject requestCurrentRecommendedDevices](v5, "requestCurrentRecommendedDevices");
  }

}

- (void)_invalidateIRSessionManager
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer irSessionManager](self, "irSessionManager"));
  objc_msgSend(v3, "invalidate");

  -[TVRDServer setIrSessionManager:](self, "setIrSessionManager:", 0);
}

- (void)_stopGeneralDeviceQuery
{
  id v3;
  NSObject *v4;
  TVRXDeviceQuery *generalDeviceQuery;
  void *v6;
  uint8_t v7[16];

  v3 = _TVRDXPCLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping general device query", v7, 2u);
  }

  -[TVRXDeviceQuery stop](self->_generalDeviceQuery, "stop");
  -[TVRXDeviceQuery setDelegate:](self->_generalDeviceQuery, "setDelegate:", 0);
  generalDeviceQuery = self->_generalDeviceQuery;
  self->_generalDeviceQuery = 0;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer irSessionManager](self, "irSessionManager"));
  objc_msgSend(v6, "pause");

}

- (void)_updateDevicesWithRecommendations:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  uint64_t v22;
  _UNKNOWN **v23;
  void *i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  _UNKNOWN **v34;
  char *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];

  v4 = a3;
  v5 = _TVRDXPCLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v47 = "-[TVRDServer _updateDevicesWithRecommendations:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer irSessionManager](self, "irSessionManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "suggestedDevices"));
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer irSessionManager](self, "irSessionManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "suggestedDevices"));
    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v11));

    v13 = objc_msgSend(v4, "mutableCopy");
    v14 = _TVRDXPCLog();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[TVRDServer _updateDevicesWithRecommendations:].cold.3();

    v16 = _TVRDXPCLog();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[TVRDServer _updateDevicesWithRecommendations:].cold.2();
    v39 = v4;

    objc_msgSend(v13, "intersectSet:", v12);
    v18 = _TVRDXPCLog();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[TVRDServer _updateDevicesWithRecommendations:].cold.1();

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = v13;
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v43;
      v23 = &CFGetInt64_ptr;
      v40 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v43 != v22)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
          v26 = v23[33];
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "identifier"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "predicateWithFormat:", CFSTR("identifier ==[c] %@"), v27));
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject filteredSetUsingPredicate:](v12, "filteredSetUsingPredicate:", v28));

          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "anyObject"));
          if (v30)
          {
            v31 = _TVRDXPCLog();
            v32 = objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              v33 = v12;
              v34 = v23;
              v35 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "conciseDescription"));
              v36 = v21;
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "conciseDescription"));
              *(_DWORD *)buf = 138543618;
              v47 = v35;
              v48 = 2114;
              v49 = v37;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Assigning classification from suggestedDevice: %{public}@ to device: %{public}@", buf, 0x16u);

              v21 = v36;
              v23 = v34;
              v12 = v33;
              v22 = v40;
            }

            objc_msgSend(v25, "setClassification:", objc_msgSend(v30, "classification"));
          }

        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      }
      while (v21);
    }

    v4 = v39;
  }
  else
  {
    v38 = _TVRDXPCLog();
    v12 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "There are no suggested devices. Skipping updating devices with recommendations", buf, 2u);
    }
  }

}

- (void)deviceQueryDidUpdateDevices:(id)a3
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSMutableSet *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *k;
  uint64_t v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id obj;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];

  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "devices"));
  v5 = _TVRDXPCLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v52 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "General device query updated set of devices %{public}@", buf, 0xCu);
  }

  -[TVRDServer _updateDevicesWithRecommendations:](self, "_updateDevicesWithRecommendations:", v4);
  v7 = objc_claimAutoreleasedReturnValue(+[TVRCDeviceState setOfStatesFromDevices:](TVRCDeviceState, "setOfStatesFromDevices:", v4));
  v8 = _TVRDXPCLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v52 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "General device query updated deviceStates %{public}@", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer irSessionManager](self, "irSessionManager"));
  v38 = (void *)v4;
  objc_msgSend(v10, "processNewDevices:", v4);

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v11 = self->_deviceQueryObservers;
  v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v48 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "remoteObjectProxy"));
        objc_msgSend(v17, "deviceQueryUpdatedDiscoveredDevices:", v7);

        if (-[TVRDServer informDeviceQueryObserversWithUpdatedSuggestions](self, "informDeviceQueryObserversWithUpdatedSuggestions"))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer irSessionManager](self, "irSessionManager"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "suggestedDevices"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCDeviceState arrayOfStatesFromDevices:](TVRCDeviceState, "arrayOfStatesFromDevices:", v19));

          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "remoteObjectProxy"));
          objc_msgSend(v21, "suggestedDevices:", v20);

          -[TVRDServer setInformDeviceQueryObserversWithUpdatedSuggestions:](self, "setInformDeviceQueryObserversWithUpdatedSuggestions:", 0);
        }
      }
      v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    }
    while (v13);
  }
  v36 = (void *)v7;

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v38;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(_QWORD *)v44 != v24)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)j);
        objc_msgSend(v26, "setDelegate:", self);
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "allIdentifiers"));
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v40;
          while (2)
          {
            for (k = 0; k != v29; k = (char *)k + 1)
            {
              if (*(_QWORD *)v40 != v30)
                objc_enumerationMutation(v27);
              v32 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)k);
              if (-[NSMutableSet containsObject:](self->_identifiersRequestingConnection, "containsObject:", v32))
              {
                +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_informClientCouldNotLocateDeviceWithIdentifier:", v32);
                -[NSMutableSet removeObject:](self->_identifiersRequestingConnection, "removeObject:", v32);
                v33 = _TVRDXPCLog();
                v34 = objc_claimAutoreleasedReturnValue(v33);
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDServer cachedDevices](self, "cachedDevices"));
                  *(_DWORD *)buf = 138543618;
                  v52 = (uint64_t)v26;
                  v53 = 2112;
                  v54 = v35;
                  _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Adding %{public}@ to cachedDevices: %@", buf, 0x16u);

                }
                -[NSMutableSet addObject:](self->_cachedDevices, "addObject:", v26);
                -[TVRDServer _connectToDeviceIfNeeded:](self, "_connectToDeviceIfNeeded:", v26);
                goto LABEL_31;
              }
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
            if (v29)
              continue;
            break;
          }
        }
LABEL_31:

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
    }
    while (v23);
  }

}

- (NSMutableSet)clientConnections
{
  return self->_clientConnections;
}

- (void)setClientConnections:(id)a3
{
  objc_storeStrong((id *)&self->_clientConnections, a3);
}

- (NSCountedSet)deviceIdentifiers
{
  return self->_deviceIdentifiers;
}

- (void)setDeviceIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIdentifiers, a3);
}

- (NSMutableSet)cachedDevices
{
  return self->_cachedDevices;
}

- (void)setCachedDevices:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDevices, a3);
}

- (NSMutableDictionary)connectionContextByID
{
  return self->_connectionContextByID;
}

- (void)setConnectionContextByID:(id)a3
{
  objc_storeStrong((id *)&self->_connectionContextByID, a3);
}

- (NSMutableDictionary)authChallengesByID
{
  return self->_authChallengesByID;
}

- (void)setAuthChallengesByID:(id)a3
{
  objc_storeStrong((id *)&self->_authChallengesByID, a3);
}

- (NSMutableSet)deviceQueryObservers
{
  return self->_deviceQueryObservers;
}

- (void)setDeviceQueryObservers:(id)a3
{
  objc_storeStrong((id *)&self->_deviceQueryObservers, a3);
}

- (NSMutableSet)identifiersRequestingConnection
{
  return self->_identifiersRequestingConnection;
}

- (void)setIdentifiersRequestingConnection:(id)a3
{
  objc_storeStrong((id *)&self->_identifiersRequestingConnection, a3);
}

- (TVRXDeviceLocator)deviceSearch
{
  return self->_deviceSearch;
}

- (void)setDeviceSearch:(id)a3
{
  objc_storeStrong((id *)&self->_deviceSearch, a3);
}

- (TVRXDeviceQuery)generalDeviceQuery
{
  return self->_generalDeviceQuery;
}

- (void)setGeneralDeviceQuery:(id)a3
{
  objc_storeStrong((id *)&self->_generalDeviceQuery, a3);
}

- (NSDate)lastConnectionTimestamp
{
  return self->_lastConnectionTimestamp;
}

- (void)setLastConnectionTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_lastConnectionTimestamp, a3);
}

- (TVRXDevice)lastConnectedDevice
{
  return (TVRXDevice *)objc_loadWeakRetained((id *)&self->_lastConnectedDevice);
}

- (void)setLastConnectedDevice:(id)a3
{
  objc_storeWeak((id *)&self->_lastConnectedDevice, a3);
}

- (CUSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_systemMonitor, a3);
}

- (BOOL)isScreenLocked
{
  return self->_isScreenLocked;
}

- (void)setIsScreenLocked:(BOOL)a3
{
  self->_isScreenLocked = a3;
}

- (BOOL)informDeviceQueryObserversWithUpdatedSuggestions
{
  return self->_informDeviceQueryObserversWithUpdatedSuggestions;
}

- (void)setInformDeviceQueryObserversWithUpdatedSuggestions:(BOOL)a3
{
  self->_informDeviceQueryObserversWithUpdatedSuggestions = a3;
}

- (TVRDIRSessionManager)irSessionManager
{
  return self->_irSessionManager;
}

- (void)setIrSessionManager:(id)a3
{
  objc_storeStrong((id *)&self->_irSessionManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_irSessionManager, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_destroyWeak((id *)&self->_lastConnectedDevice);
  objc_storeStrong((id *)&self->_lastConnectionTimestamp, 0);
  objc_storeStrong((id *)&self->_generalDeviceQuery, 0);
  objc_storeStrong((id *)&self->_deviceSearch, 0);
  objc_storeStrong((id *)&self->_identifiersRequestingConnection, 0);
  objc_storeStrong((id *)&self->_deviceQueryObservers, 0);
  objc_storeStrong((id *)&self->_authChallengesByID, 0);
  objc_storeStrong((id *)&self->_connectionContextByID, 0);
  objc_storeStrong((id *)&self->_cachedDevices, 0);
  objc_storeStrong((id *)&self->_deviceIdentifiers, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
}

void __81__TVRDServer_clientConnection_addedInterestedDeviceIdentifier_connectionContext___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;

  v3 = *a1;
  v4 = *(_QWORD *)(*(_QWORD *)a2 + 32);
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not find cached device with ID %@, even though someone is already interested in that device. All cached devices - %@", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __86__TVRDServer_clientConnection_requestsEnablingFindingSession_forDeviceWithIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Find My not avaiable for device: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __51__TVRDServer__switchToCurrentUserProfileForDevice___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Failed to switch user profile %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __54__TVRDServer__becameInterestedInDeviceWithIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "Could not locate device with ID %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __39__TVRDServer__activateIRSessionManager__block_invoke_64_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Failed to active IRSession: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_updateDevicesWithRecommendations:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "Queried devices subset: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_updateDevicesWithRecommendations:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "Queried devices: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_updateDevicesWithRecommendations:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "Suggested devices: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
