@implementation GameControllerDaemon

+ (void)run
{
  NSObject *v2;
  void *v3;
  os_activity_scope_state_s v4;

  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  v2 = _os_activity_create((void *)&_mh_execute_header, "Daemon Start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GameControllerDaemon sharedInstance](GameControllerDaemon, "sharedInstance", v4.opaque[0], v4.opaque[1]));
  objc_msgSend(v3, "_start");

  os_activity_scope_leave(&v4);
}

+ (id)sharedInstance
{
  if (qword_100011FE8 != -1)
    dispatch_once(&qword_100011FE8, &stru_10000C5E0);
  return (id)qword_100011FE0;
}

- (id)_init
{
  GameControllerDaemon *v2;
  GameControllerDaemon *v3;
  NSXPCListener *v4;
  NSXPCListener *appServiceListener;
  NSXPCListener *v6;
  NSXPCListener *driverServiceListener;
  NSXPCListener *v8;
  NSXPCListener *hapticServiceListener;
  NSXPCListener *v10;
  NSXPCListener *agentServiceListener;
  NSMutableDictionary *v12;
  NSMutableDictionary *agentRegistrations;
  NSMutableSet *v14;
  NSMutableSet *clients;
  GameControllerDaemonAnalytics *v16;
  GameControllerDaemonAnalytics *analytics;
  id v18;
  void *v19;
  GCSSettingsStore *v20;
  GCSSettingsStore *settingsStore;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)GameControllerDaemon;
  v2 = -[GameControllerDaemon init](&v24, "init");
  v3 = v2;
  if (v2)
  {
    GCLookupSetFallbackProvider(v2);
    v4 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.GameController.gamecontrollerd.app"));
    appServiceListener = v3->_appServiceListener;
    v3->_appServiceListener = v4;

    -[NSXPCListener setDelegate:](v3->_appServiceListener, "setDelegate:", v3);
    v6 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.GameController.gamecontrollerd.driver"));
    driverServiceListener = v3->_driverServiceListener;
    v3->_driverServiceListener = v6;

    -[NSXPCListener setDelegate:](v3->_driverServiceListener, "setDelegate:", v3);
    v8 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.GameController.gamecontrollerd.haptics"));
    hapticServiceListener = v3->_hapticServiceListener;
    v3->_hapticServiceListener = v8;

    -[NSXPCListener setDelegate:](v3->_hapticServiceListener, "setDelegate:", v3);
    v10 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.GameController.gamecontrollerd.agent"));
    agentServiceListener = v3->_agentServiceListener;
    v3->_agentServiceListener = v10;

    -[NSXPCListener setDelegate:](v3->_agentServiceListener, "setDelegate:", v3);
    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    agentRegistrations = v3->_agentRegistrations;
    v3->_agentRegistrations = v12;

    v14 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    clients = v3->_clients;
    v3->_clients = v14;

    v16 = objc_opt_new(GameControllerDaemonAnalytics);
    analytics = v3->_analytics;
    v3->_analytics = v16;

    v18 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.GameController"));
    v19 = v18;
    if (!v18)
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_storeStrong((id *)&v3->_defaults, v19);
    if (!v18)

    v20 = (GCSSettingsStore *)objc_msgSend(objc_alloc((Class)GCSSettingsStore), "initWithUserDefaults:", v3->_defaults);
    settingsStore = v3->_settingsStore;
    v3->_settingsStore = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[_GCControllerManagerServer sharedInstance](_GCControllerManagerServer, "sharedInstance"));
    objc_msgSend(v22, "addObserver:forKeyPath:options:context:", v3, CFSTR("activeControllerDevices"), 5, off_100011E50);

    xpc_set_event_stream_handler("com.apple.iokit.match.gamecontroller", 0, &stru_10000C620);
  }
  return v3;
}

- (GameControllerDaemon)init
{
  -[GameControllerDaemon doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)_start
{
  -[NSXPCListener resume](self->_appServiceListener, "resume");
  -[NSXPCListener resume](self->_driverServiceListener, "resume");
  -[NSXPCListener resume](self->_hapticServiceListener, "resume");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_GCControllerManagerServer sharedInstance](_GCControllerManagerServer, "sharedInstance"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("activeControllerDevices"));

  v4.receiver = self;
  v4.super_class = (Class)GameControllerDaemon;
  -[GameControllerDaemon dealloc](&v4, "dealloc");
}

- (id)serviceFor:(id)a3 client:(id)a4
{
  __objc2_prot *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v6 = (__objc2_prot *)a3;
  v7 = a4;
  if (&OBJC_PROTOCOL___GCAnalytics == v6)
  {
    v10 = 64;
LABEL_8:
    v9 = *(id *)&self->GCDaemon_opaque[v10];
    goto LABEL_9;
  }
  if (&OBJC_PROTOCOL___GCUserDefaults == v6)
  {
    v10 = 72;
    goto LABEL_8;
  }
  if (&OBJC_PROTOCOL___GCSSettingsStoreService == v6)
  {
    v10 = 80;
    goto LABEL_8;
  }
  v13.receiver = self;
  v13.super_class = (Class)GameControllerDaemon;
  v8 = -[GameControllerDaemon serviceFor:client:](&v13, "serviceFor:client:", v6, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue(v8);
LABEL_9:
  v11 = v9;

  return v11;
}

- (id)clientForConnection:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  id v9;
  NSObject *v10;
  int v11;
  id v12;

  v4 = a3;
  v5 = self->_clients;
  objc_sync_enter(v5);
  v6 = objc_msgSend(objc_alloc((Class)_GCIPCRemoteProcess), "initWithConnection:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableSet member:](self->_clients, "member:", v6));

  if (!v7)
  {
    v7 = objc_msgSend(objc_alloc((Class)_GCIPCRemoteProcess), "initWithConnection:", v4);
    -[NSMutableSet addObject:](self->_clients, "addObject:", v7);
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("connections"), 1, 0);
    -[GameControllerDaemon refreshClientTransaction](self, "refreshClientTransaction");
    if (sub_1000065E0())
    {
      v9 = sub_100006804();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Added client: %@", (uint8_t *)&v11, 0xCu);
      }

    }
  }
  objc_sync_exit(v5);

  return v7;
}

- (void)refreshClientTransaction
{
  NSMutableSet *v3;
  OS_os_transaction *v4;
  OS_os_transaction *clientTransaction;
  id v6;
  NSObject *v7;
  OS_os_transaction *v8;
  unint64_t activeDevicesCount;
  id v10;
  NSObject *v11;
  OS_os_transaction *v12;
  int v13;
  OS_os_transaction *v14;
  __int16 v15;
  unint64_t v16;

  v3 = self->_clients;
  objc_sync_enter(v3);
  if (sub_1000065E0())
  {
    v6 = sub_100006804();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (OS_os_transaction *)-[NSMutableSet count](self->_clients, "count");
      activeDevicesCount = self->_activeDevicesCount;
      v13 = 134218240;
      v14 = v8;
      v15 = 2048;
      v16 = activeDevicesCount;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "refreshClientTransaction - %lu clients and %lu active devices", (uint8_t *)&v13, 0x16u);
    }

  }
  if (-[NSMutableSet count](self->_clients, "count") && self->_activeDevicesCount)
  {
    if (self->_clientTransaction)
      goto LABEL_8;
    v4 = (OS_os_transaction *)os_transaction_create("gamecontrollerd has a client and a game controller device is active");
    clientTransaction = self->_clientTransaction;
    self->_clientTransaction = v4;
  }
  else
  {
    clientTransaction = self->_clientTransaction;
    self->_clientTransaction = 0;
  }

LABEL_8:
  if (sub_1000065E0())
  {
    v10 = sub_100006804();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = self->_clientTransaction;
      v13 = 138412290;
      v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "client transaction = %@", (uint8_t *)&v13, 0xCu);
    }

  }
  objc_sync_exit(v3);

}

- (void)client:(id)a3 connectionsDidChange:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = self->_clients;
  objc_sync_enter(v8);
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("connections"), 0);
    -[NSMutableSet removeObject:](self->_clients, "removeObject:", v6);
    if (sub_1000065E0())
    {
      v9 = sub_100006804();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Removed client: %@", (uint8_t *)&v11, 0xCu);
      }

    }
  }
  -[GameControllerDaemon refreshClientTransaction](self, "refreshClientTransaction");
  objc_sync_exit(v8);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  unsigned __int8 v10;
  void *v11;
  unsigned int v12;
  unsigned __int8 v13;
  void *v15;
  unsigned int v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  os_activity_scope_state_s v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;

  v5 = a4;
  v21.opaque[0] = 0;
  v21.opaque[1] = 0;
  v6 = _os_activity_create((void *)&_mh_execute_header, "Incoming Connection", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v6, &v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GameControllerDaemon clientForConnection:](self, "clientForConnection:", v5, v21.opaque[0], v21.opaque[1]));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceName"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.GameController.gamecontrollerd.app"));

  if (v9)
  {
    v10 = -[GameControllerDaemon acceptNewConnection:fromGCEnabledApp:](self, "acceptNewConnection:fromGCEnabledApp:", v5, v7);
LABEL_5:
    v13 = v10;
    goto LABEL_6;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceName"));
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.GameController.gamecontrollerd.driver"));

  if (v12)
  {
    v10 = -[GameControllerDaemon acceptNewConnection:fromHIDServer:](self, "acceptNewConnection:fromHIDServer:", v5, v7);
    goto LABEL_5;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceName"));
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.GameController.gamecontrollerd.haptics"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[_GCHapticServerManager sharedInstance](_GCHapticServerManager, "sharedInstance"));
    v13 = objc_msgSend(v17, "acceptNewConnection:fromHapticsEnabledApp:", v5, v7);

  }
  else
  {
    if (sub_1000065E0())
    {
      v18 = sub_100006804();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceName"));
        *(_DWORD *)buf = 138412546;
        v23 = v5;
        v24 = 2112;
        v25 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Rejecting connection '%@' for unknown mach service '%@'", buf, 0x16u);

      }
    }
    v13 = 0;
  }
LABEL_6:
  os_activity_scope_leave(&v21);

  return v13;
}

- (BOOL)acceptNewConnection:(id)a3 fromHIDServer:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  if (sub_1000065E0())
  {
    v11 = sub_100006804();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceName"));
      v14 = 138412546;
      v15 = v5;
      v16 = 2112;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Accepting driver connection '%@' to mach service '%@'", (uint8_t *)&v14, 0x16u);

    }
  }
  v7 = objc_msgSend(objc_alloc((Class)_GCDriverClientConnection), "initWithConnection:fromProcess:", v5, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_GCControllerManagerServer sharedInstance](_GCControllerManagerServer, "sharedInstance"));
  v9 = objc_msgSend(v8, "acceptIncomingDriverConnection:", v7);

  return v9;
}

- (BOOL)acceptNewConnection:(id)a3 fromGCEnabledApp:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  if (sub_1000065E0())
  {
    v11 = sub_100006804();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceName"));
      v14 = 138412546;
      v15 = v5;
      v16 = 2112;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Accepting app connection '%@' to mach service '%@'", (uint8_t *)&v14, 0x16u);

    }
  }
  v7 = objc_msgSend(objc_alloc((Class)_GCAppClientConnection), "initWithConnection:fromProcess:", v5, v6);
  objc_msgSend(v6, "addConnection:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_GCControllerManagerServer sharedInstance](_GCControllerManagerServer, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_GCAppClientProxy clientProxyWithConnection:server:](_GCAppClientProxy, "clientProxyWithConnection:server:", v7, v8));

  objc_msgSend(v7, "setServer:", v9);
  objc_msgSend(v7, "resume");

  return 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (off_100011E50 == a6)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("activeControllerDevices")))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
      self->_activeDevicesCount = (unint64_t)objc_msgSend(v14, "count");
      -[GameControllerDaemon refreshClientTransaction](self, "refreshClientTransaction");
      goto LABEL_7;
    }
LABEL_8:
    v15.receiver = self;
    v15.super_class = (Class)GameControllerDaemon;
    -[GameControllerDaemon observeValueForKeyPath:ofObject:change:context:](&v15, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
    goto LABEL_9;
  }
  v13 = objc_opt_class(_GCIPCRemoteProcess);
  if ((objc_opt_isKindOfClass(v11, v13) & 1) == 0
    || !objc_msgSend(v10, "isEqualToString:", CFSTR("connections")))
  {
    goto LABEL_8;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
  -[GameControllerDaemon client:connectionsDidChange:](self, "client:connectionsDidChange:", v11, v14);
LABEL_7:

LABEL_9:
}

- (void)registerAgentConnection:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *agentRegistrations;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self->_agentRegistrations;
  objc_sync_enter(v4);
  agentRegistrations = self->_agentRegistrations;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "userIdentifier")));
  -[NSMutableDictionary setObject:forKey:](agentRegistrations, "setObject:forKey:", v7, v6);

  objc_sync_exit(v4);
}

- (void)unregisterAgentConnection:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *agentRegistrations;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self->_agentRegistrations;
  objc_sync_enter(v4);
  agentRegistrations = self->_agentRegistrations;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "userIdentifier")));
  -[NSMutableDictionary removeObjectForKey:](agentRegistrations, "removeObjectForKey:", v6);

  objc_msgSend(v7, "invalidate");
  objc_sync_exit(v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsStore, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_clientTransaction, 0);
  objc_storeStrong((id *)&self->_agentRegistrations, 0);
  objc_storeStrong((id *)&self->_agentServiceListener, 0);
  objc_storeStrong((id *)&self->_hapticServiceListener, 0);
  objc_storeStrong((id *)&self->_driverServiceListener, 0);
  objc_storeStrong((id *)&self->_appServiceListener, 0);
}

@end
