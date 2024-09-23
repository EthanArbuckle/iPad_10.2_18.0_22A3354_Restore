@implementation RWIRelay

- (RWIRelay)init
{
  RWIRelay *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *applicationConnections;
  NSMutableDictionary *v5;
  NSMutableDictionary *clientConnections;
  NSMutableDictionary *v7;
  NSMutableDictionary *driverInterfaces;
  NSMutableArray *v9;
  NSMutableArray *pendingClientConnections;
  NSMutableDictionary *v11;
  NSMutableDictionary *pendingProxyApplicationConnections;
  NSMutableArray *v13;
  NSMutableArray *automaticInspectionDebuggers;
  NSMutableDictionary *v15;
  NSMutableDictionary *automaticInspectionSessions;
  NSObject *v17;
  xpc_connection_t mach_service;
  OS_xpc_object *xpcApplicationListenConnection;
  _xpc_connection_s *v20;
  uint64_t v21;
  RWIRelay *v22;
  RWIRelay *v23;
  RWIRelay *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  RWIRelay *v28;
  _QWORD v30[4];
  RWIRelay *v31;
  _QWORD v32[4];
  RWIRelay *v33;
  _QWORD v34[4];
  RWIRelay *v35;
  int out_token;
  _QWORD handler[4];
  RWIRelay *v38;
  objc_super v39;
  uint8_t buf[4];
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v39.receiver = self;
  v39.super_class = (Class)RWIRelay;
  v2 = -[RWIRelay init](&v39, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    applicationConnections = v2->_applicationConnections;
    v2->_applicationConnections = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    clientConnections = v2->_clientConnections;
    v2->_clientConnections = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    driverInterfaces = v2->_driverInterfaces;
    v2->_driverInterfaces = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    pendingClientConnections = v2->_pendingClientConnections;
    v2->_pendingClientConnections = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    pendingProxyApplicationConnections = v2->_pendingProxyApplicationConnections;
    v2->_pendingProxyApplicationConnections = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    automaticInspectionDebuggers = v2->_automaticInspectionDebuggers;
    v2->_automaticInspectionDebuggers = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    automaticInspectionSessions = v2->_automaticInspectionSessions;
    v2->_automaticInspectionSessions = v15;

    -[RWIRelay _setGlobalNotifyStateWithAutomaticInspectionEnabled:](v2, "_setGlobalNotifyStateWithAutomaticInspectionEnabled:", 0);
    v17 = MEMORY[0x24BDAC9B8];
    mach_service = xpc_connection_create_mach_service("com.apple.webinspector", MEMORY[0x24BDAC9B8], 1uLL);
    xpcApplicationListenConnection = v2->_xpcApplicationListenConnection;
    v2->_xpcApplicationListenConnection = mach_service;

    v20 = v2->_xpcApplicationListenConnection;
    v21 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __16__RWIRelay_init__block_invoke;
    handler[3] = &unk_24DE00FE0;
    v22 = v2;
    v38 = v22;
    xpc_connection_set_event_handler(v20, handler);
    xpc_connection_resume(v2->_xpcApplicationListenConnection);
    out_token = 0;
    v34[0] = v21;
    v34[1] = 3221225472;
    v34[2] = __16__RWIRelay_init__block_invoke_2;
    v34[3] = &unk_24DE03190;
    v23 = v22;
    v35 = v23;
    notify_register_dispatch("com.apple.webinspectord.enabled", &out_token, v17, v34);

    v32[0] = v21;
    v32[1] = 3221225472;
    v32[2] = __16__RWIRelay_init__block_invoke_9;
    v32[3] = &unk_24DE03190;
    v24 = v23;
    v33 = v24;
    notify_register_dispatch("com.apple.webinspectord.disabled", &out_token, v17, v32);

    notify_register_dispatch("com.apple.webinspectord.availability_check", &out_token, v17, &__block_literal_global_0);
    notify_post("com.apple.webinspectord.available");
    RWIDefaultLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v41 = "com.apple.webinspectord.available";
      _os_log_impl(&dword_21AD49000, v25, OS_LOG_TYPE_INFO, "notify post for %s", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v24, sel__developerPreferencesChanged, CFSTR("_SFDeveloperPreferencesDidChangeNotification"), 0);

    if (isInternalInstall())
    {
      v30[0] = v21;
      v30[1] = 3221225472;
      v30[2] = __16__RWIRelay_init__block_invoke_17;
      v30[3] = &unk_24DE03190;
      v31 = v24;
      v27 = (void *)MEMORY[0x24BDAC9B8];
      notify_register_dispatch("com.apple.webinspectord.debug_dump_state", &out_token, MEMORY[0x24BDAC9B8], v30);

    }
    v28 = v24;

  }
  return v2;
}

uint64_t __16__RWIRelay_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleApplicationListenConnectionEvent:", a2);
}

uint64_t __16__RWIRelay_init__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  RWIDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "com.apple.webinspectord.enabled";
    _os_log_impl(&dword_21AD49000, v2, OS_LOG_TYPE_INFO, "notify handler for %s", (uint8_t *)&v4, 0xCu);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "relay:remoteInspectionEnablementDidChange:", *(_QWORD *)(a1 + 32), 1);
}

void __16__RWIRelay_init__block_invoke_9(uint64_t a1)
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  RWIDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = 136315138;
    v4 = "com.apple.webinspectord.disabled";
    _os_log_impl(&dword_21AD49000, v2, OS_LOG_TYPE_INFO, "notify handler for %s", (uint8_t *)&v3, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_setGlobalNotifyStateWithAutomaticInspectionEnabled:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "relay:remoteInspectionEnablementDidChange:", *(_QWORD *)(a1 + 32), 0);
  exit(0);
}

uint64_t __16__RWIRelay_init__block_invoke_11()
{
  NSObject *v0;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  RWIDefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v2 = 136315138;
    v3 = "com.apple.webinspectord.availability_check";
    _os_log_impl(&dword_21AD49000, v0, OS_LOG_TYPE_INFO, "notify handler for %s", (uint8_t *)&v2, 0xCu);
  }

  return notify_post("com.apple.webinspectord.available");
}

uint64_t __16__RWIRelay_init__block_invoke_17(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  RWIDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "com.apple.webinspectord.debug_dump_state";
    _os_log_impl(&dword_21AD49000, v2, OS_LOG_TYPE_INFO, "notify handler for %s", (uint8_t *)&v4, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_handleDumpStateNotification");
}

- (void)setup
{
  RWIRelayDelegate *delegate;
  id v4;

  -[RWIRelayDelegate relayInitialize:](self->_delegate, "relayInitialize:", self);
  delegate = self->_delegate;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RWIRelayDelegate relay:remoteInspectionEnablementDidChange:](delegate, "relay:remoteInspectionEnablementDidChange:", self, objc_msgSend(v4, "BOOLForKey:", CFSTR("RemoteInspectorEnabled")));

}

- (void)shutdownIfDisabled
{
  void *v3;
  char v4;
  NSObject *v5;
  uint8_t v6[16];

  if (MGGetSInt32Answer() != 7)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("RemoteInspectorEnabled"));

    if ((v4 & 1) == 0)
    {
      RWIDefaultLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_21AD49000, v5, OS_LOG_TYPE_DEFAULT, "Shutting Down, Preference Disabled", v6, 2u);
      }

      -[RWIRelay _setGlobalNotifyStateWithAutomaticInspectionEnabled:](self, "_setGlobalNotifyStateWithAutomaticInspectionEnabled:", 0);
      notify_post("com.apple.webinspectord.disabled");
      exit(0);
    }
  }
}

- (id)_allApplicationDetails
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  const __CFString *v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_applicationConnections;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_applicationConnections, "objectForKey:", v9, (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dictionaryRepresentation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v11, v9);

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);
  }

  v18 = CFSTR("WIRApplicationDictionaryKey");
  v19 = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_allDriverDetails
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  const __CFString *v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_driverInterfaces;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_driverInterfaces, "objectForKey:", v9, (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dictionaryRepresentation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v11, v9);

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);
  }

  v18 = CFSTR("WIRDriverDictionaryKey");
  v19 = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_setGlobalNotifyStateWithAutomaticInspectionEnabled:(BOOL)a3
{
  uint64_t v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  LODWORD(v3) = a3;
  v6 = *MEMORY[0x24BDAC8D0];
  if (_setGlobalNotifyStateWithAutomaticInspectionEnabled__sToken
    || !notify_register_check("com.apple.webinspectord.automatic_inspection_enabled", &_setGlobalNotifyStateWithAutomaticInspectionEnabled__sToken))
  {
    RWIDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl(&dword_21AD49000, v4, OS_LOG_TYPE_DEFAULT, "Automatic Inspection Configuration Changed : enabled(%d)", (uint8_t *)v5, 8u);
    }

    v3 = v3;
    if (isInternalInstall())
    {
      if (isSimulatingCustomerInstall())
        v3 = v3 | 0x8000000000000000;
    }
    notify_set_state(_setGlobalNotifyStateWithAutomaticInspectionEnabled__sToken, v3);
  }
}

- (void)_dumpClientConnection:(id)a3 withOrdinal:(unint64_t)a4
{
  id v5;
  char isKindOfClass;
  NSObject *v7;
  void *v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  int v12;
  unint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  RWIMessageDumpStateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "tag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((isKindOfClass & 1) != 0)
      v9 = CFSTR("TCP");
    else
      v9 = CFSTR("XPC");
    v10 = objc_msgSend(v5, "sleeping");
    v11 = CFSTR("NO");
    v12 = 134218754;
    v13 = a4;
    v14 = 2114;
    if (v10)
      v11 = CFSTR("YES");
    v15 = v8;
    v16 = 2114;
    v17 = v9;
    v18 = 2114;
    v19 = v11;
    _os_log_debug_impl(&dword_21AD49000, v7, OS_LOG_TYPE_DEBUG, "  %zu: Client[%{public}@] type[%{public}@] sleeping[%{public}@]", (uint8_t *)&v12, 0x2Au);

  }
}

- (void)_dumpApplication:(id)a3 withOrdinal:(unint64_t)a4
{
  id v5;
  __CFString *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  uint8_t buf[4];
  unint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (objc_msgSend(v5, "isProxy"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("isProxied[YES, via %d]"), objc_msgSend(v5, "hostApplicationPID"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("isProxied[NO]");
  }
  RWIMessageDumpStateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "hasRemoteDebugSession");
    v11 = CFSTR("NO");
    *(_DWORD *)buf = 134218754;
    v13 = a4;
    v14 = 2114;
    if (v10)
      v11 = CFSTR("YES");
    v15 = v9;
    v16 = 2114;
    v17 = v6;
    v18 = 2114;
    v19 = v11;
    _os_log_debug_impl(&dword_21AD49000, v7, OS_LOG_TYPE_DEBUG, "  %zu: Application[%{public}@] %{public}@ hasRemoteDebugSession[%{public}@]", buf, 0x2Au);

  }
  RWIMessageDumpStateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[RWIRelay _dumpApplication:withOrdinal:].cold.1(v5, v8);

}

- (void)_handleDumpStateNotification
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = getpid();
  _os_log_debug_impl(&dword_21AD49000, a1, OS_LOG_TYPE_DEBUG, "Dumping state of webinspectord[%d]...", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_3();
}

uint64_t __40__RWIRelay__handleDumpStateNotification__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dumpClientConnection:withOrdinal:", a2, a3);
}

uint64_t __40__RWIRelay__handleDumpStateNotification__block_invoke_44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dumpClientConnection:withOrdinal:", a2, a3);
}

uint64_t __40__RWIRelay__handleDumpStateNotification__block_invoke_45(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dumpApplication:withOrdinal:", a2, a3);
}

uint64_t __40__RWIRelay__handleDumpStateNotification__block_invoke_47(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dumpApplication:withOrdinal:", a2, a3);
}

- (void)_reportCurrentStateToAllClients
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allValues](self->_clientConnections, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[RWIRelay _reportCurrentStateToClient:](self, "_reportCurrentStateToClient:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_reportCurrentStateToClient:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCF50];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("RemoteAutomationEnabled"));

  v7 = CFSTR("WIRAutomationAvailabilityNotAvailable");
  if (v6)
    v7 = CFSTR("WIRAutomationAvailabilityAvailable");
  v11 = CFSTR("WIRAutomationAvailabilityKey");
  v12[0] = v7;
  v8 = (void *)MEMORY[0x24BDBCE70];
  v9 = v7;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_rpc_reportCurrentState:", v10);
}

- (void)_rpc_reportIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WIRConnectionIdentifierKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RWIServiceConnectionKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RWIRelay _finalizePendingClientConnection:withIdentifier:](self, "_finalizePendingClientConnection:withIdentifier:", v5, v4);
  }
  else
  {
    v6 = (void *)objc_opt_class();
    logUnexpectedType(v6, v5);
  }

}

- (void)_rpc_getConnectedApplications:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WIRConnectionIdentifierKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    -[NSMutableDictionary objectForKey:](self->_clientConnections, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[RWIRelay _allApplicationDetails](self, "_allApplicationDetails");
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_rpc_reportConnectedApplicationList:", v6);
    }
    else
    {
      RWIDefaultLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[RWIRelay _rpc_getConnectedApplications:].cold.1();
    }

  }
  else
  {
    v7 = (void *)objc_opt_class();
    logUnexpectedType(v7, v5);
  }

}

- (void)_rpc_forwardGetListing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("WIRApplicationIdentifierKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    -[NSMutableDictionary objectForKey:](self->_applicationConnections, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryWithValuesForKeys:", &unk_24DE10F28);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendMessage:userInfo:", CFSTR("WIRApplicationGetListingMessage"), v7);

  }
  else
  {
    v8 = (void *)objc_opt_class();
    logUnexpectedType(v8, v5);
  }

}

- (void)_rpc_forwardWakeUpDebuggables:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("WIRApplicationIdentifierKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    -[NSMutableDictionary objectForKey:](self->_applicationConnections, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryWithValuesForKeys:", &unk_24DE10F40);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendMessage:userInfo:", CFSTR("WIRApplicationWakeUpDebuggablesMessage"), v7);

  }
  else
  {
    v8 = (void *)objc_opt_class();
    logUnexpectedType(v8, v5);
  }

}

- (void)_rpc_forwardIndicateWebView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("WIRApplicationIdentifierKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    -[NSMutableDictionary objectForKey:](self->_applicationConnections, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryWithValuesForKeys:", &unk_24DE10F58);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendMessage:userInfo:", CFSTR("WIRIndicateMessage"), v7);

  }
  else
  {
    v8 = (void *)objc_opt_class();
    logUnexpectedType(v8, v5);
  }

}

- (void)_rpc_forwardDidClose:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("WIRApplicationIdentifierKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    -[NSMutableDictionary objectForKey:](self->_applicationConnections, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryWithValuesForKeys:", &unk_24DE10F70);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendMessage:userInfo:", CFSTR("WIRWebPageCloseMessage"), v7);

  }
  else
  {
    v8 = (void *)objc_opt_class();
    logUnexpectedType(v8, v5);
  }

}

- (void)_rpc_forwardSocketSetup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSMutableDictionary *automaticInspectionSessions;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WIRApplicationIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WIRPageIdentifierKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      -[NSMutableDictionary objectForKey:](self->_applicationConnections, "objectForKey:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "connection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dictionaryWithValuesForKeys:", &unk_24DE10F88);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sendMessage:userInfo:", CFSTR("WIRSocketSetupMessage"), v9);

      if (-[NSMutableDictionary count](self->_automaticInspectionSessions, "count"))
      {
        -[NSMutableDictionary allValues](self->_automaticInspectionSessions, "allValues");
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v23;
          while (2)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
              if (objc_msgSend(v15, "matchesPageId:applicationIdentifier:", v6, v5, (_QWORD)v22))
              {
                RWIDefaultLog();
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v15, "identifier");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v27 = v19;
                  _os_log_impl(&dword_21AD49000, v18, OS_LOG_TYPE_DEFAULT, "Automatic Inspection Candidate ACCEPT : Session (%{public}@)", buf, 0xCu);

                }
                automaticInspectionSessions = self->_automaticInspectionSessions;
                objc_msgSend(v15, "identifier");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary removeObjectForKey:](automaticInspectionSessions, "removeObjectForKey:", v21);

                goto LABEL_18;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
            if (v12)
              continue;
            break;
          }
        }
LABEL_18:

      }
    }
    else
    {
      v17 = (void *)objc_opt_class();
      logUnexpectedType(v17, v7);
    }

  }
  else
  {
    v16 = (void *)objc_opt_class();
    logUnexpectedType(v16, v6);
  }

}

- (void)_rpc_forwardSocketData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("WIRApplicationIdentifierKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    -[NSMutableDictionary objectForKey:](self->_applicationConnections, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryWithValuesForKeys:", &unk_24DE10FA0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendMessage:userInfo:", CFSTR("WIRSocketDataMessage"), v7);

  }
  else
  {
    v8 = (void *)objc_opt_class();
    logUnexpectedType(v8, v5);
  }

}

- (void)_rpc_forwardAutomaticInspectionConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSMutableArray *automaticInspectionDebuggers;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  const __CFString *v24;
  _QWORD v25[3];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WIRAutomaticInspectionEnabledKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = (void *)objc_opt_class();
    logUnexpectedType(v10, v6);
    goto LABEL_15;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RWIServiceConnectionKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "BOOLValue");
  automaticInspectionDebuggers = self->_automaticInspectionDebuggers;
  if ((_DWORD)v7)
  {
    v9 = -[NSMutableArray count](automaticInspectionDebuggers, "count");
    -[NSMutableArray addObject:](self->_automaticInspectionDebuggers, "addObject:", v6);
    if (v9)
      goto LABEL_15;
  }
  else
  {
    removeObjectFromArray(automaticInspectionDebuggers, v6);
    if (-[NSMutableArray count](self->_automaticInspectionDebuggers, "count"))
      goto LABEL_15;
  }
  -[RWIRelay _setGlobalNotifyStateWithAutomaticInspectionEnabled:](self, "_setGlobalNotifyStateWithAutomaticInspectionEnabled:", v7);
  v24 = CFSTR("WIRAutomaticInspectionEnabledKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary allValues](self->_applicationConnections, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17), "connection");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "sendMessage:userInfo:", CFSTR("WIRAutomaticInspectionConfigurationMessage"), v12);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v15);
  }

LABEL_15:
}

- (void)_rpc_forwardAutomaticInspectionRejection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("WIRApplicationIdentifierKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("WIRAutomaticInspectionSessionIdentifierKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      -[NSMutableDictionary objectForKey:](self->_automaticInspectionSessions, "objectForKey:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "receivedRejectResponse"))
      {
        -[NSMutableDictionary objectForKey:](self->_applicationConnections, "objectForKey:", v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "connection");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dictionaryWithValuesForKeys:", &unk_24DE10FB8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "sendMessage:userInfo:", CFSTR("WIRAutomaticInspectionRejectMessage"), v9);

        -[NSMutableDictionary removeObjectForKey:](self->_automaticInspectionSessions, "removeObjectForKey:", v6);
      }
    }
    else
    {
      v11 = (void *)objc_opt_class();
      logUnexpectedType(v11, v6);
    }

  }
  else
  {
    v10 = (void *)objc_opt_class();
    logUnexpectedType(v10, v5);
  }

}

- (void)_rpc_forwardDriverStateChangeRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WIRDriverIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WIRDriverIsActiveKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      -[NSMutableDictionary objectForKey:](self->_driverInterfaces, "objectForKey:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "connection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[1] = CFSTR("WIRDriverIsActiveKey");
      v15[0] = v5;
      v14[0] = CFSTR("WIRDriverIdentifierKey");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "BOOLValue"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15[1] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_rpc_requestDriverStateChange:", v11);

    }
    else
    {
      v13 = (void *)objc_opt_class();
      logUnexpectedType(v13, v7);

    }
  }
  else
  {
    v12 = (void *)objc_opt_class();
    logUnexpectedType(v12, v6);
  }

}

- (void)_rpc_reportDriverConnected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _RWIDriverInterfaceInfo *v9;
  void *v10;
  NSObject *v11;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WIRConnectionIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    +[RWIDriverConfiguration decodeFromPayload:](RWIDriverConfiguration, "decodeFromPayload:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[RWIDriverState decodeFromPayload:](RWIDriverState, "decodeFromPayload:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[NSMutableDictionary objectForKey:](self->_clientConnections, "objectForKey:", v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[_RWIDriverInterfaceInfo initWithConfiguration:connection:]([_RWIDriverInterfaceInfo alloc], "initWithConfiguration:connection:", v6, v8);
        -[_RWIDriverInterfaceInfo updateDriverState:](v9, "updateDriverState:", v7);
        -[RWIRelay _driverConnected:](self, "_driverConnected:", v9);

      }
      else
      {
        RWIDefaultLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[RWIRelay _rpc_reportDriverConnected:].cold.2();

      }
    }
    else
    {
      RWIDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[RWIRelay _rpc_reportDriverConnected:].cold.1();
    }

  }
  else
  {
    v10 = (void *)objc_opt_class();
    logUnexpectedType(v10, v6);
  }

}

- (void)_rpc_reportDriverUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WIRDriverIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    +[RWIDriverState decodeFromPayload:](RWIDriverState, "decodeFromPayload:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NSMutableDictionary objectForKey:](self->_driverInterfaces, "objectForKey:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateDriverState:", v6);
      -[RWIRelay _driverUpdated:](self, "_driverUpdated:", v7);

    }
    else
    {
      RWIDefaultLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[RWIRelay _rpc_reportDriverConnected:].cold.2();

    }
  }
  else
  {
    v8 = (void *)objc_opt_class();
    logUnexpectedType(v8, v6);
  }

}

- (void)_rpc_reportDriverDisconnected:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WIRDriverIdentifierKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    -[NSMutableDictionary objectForKey:](self->_driverInterfaces, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[RWIRelay _driverDisconnected:](self, "_driverDisconnected:", v5);
    }
    else
    {
      RWIDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[RWIRelay _rpc_reportDriverDisconnected:].cold.1();

    }
  }
  else
  {
    v6 = (void *)objc_opt_class();
    logUnexpectedType(v6, v5);
  }

}

- (void)_rpc_getConnectedDrivers:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WIRConnectionIdentifierKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    -[NSMutableDictionary objectForKey:](self->_clientConnections, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[RWIRelay _allDriverDetails](self, "_allDriverDetails");
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_rpc_reportConnectedDriverList:", v6);
    }
    else
    {
      RWIDefaultLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[RWIRelay _rpc_getConnectedApplications:].cold.1();
    }

  }
  else
  {
    v7 = (void *)objc_opt_class();
    logUnexpectedType(v7, v5);
  }

}

- (void)_rpc_forwardAutomationSessionRequest:(id)a3
{
  void *v4;
  void *v5;
  RWIRelayDelegate *delegate;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("WIRApplicationIdentifierKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    -[NSMutableDictionary objectForKey:](self->_applicationConnections, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    delegate = self->_delegate;
    objc_msgSend(v5, "bundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RWIRelayDelegate relay:activateApplicationWithBundleIdentifier:](delegate, "relay:activateApplicationWithBundleIdentifier:", self, v7);

    objc_msgSend(v5, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryWithValuesForKeys:", &unk_24DE10FD0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendMessage:userInfo:", CFSTR("WIRAutomationSessionRequestMessage"), v9);

  }
  else
  {
    v10 = (void *)objc_opt_class();
    logUnexpectedType(v10, v5);
  }

}

- (void)_rpc_requestApplicationLaunch:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WIRApplicationBundleIdentifierKey"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    -[RWIRelayDelegate relay:activateApplicationWithBundleIdentifier:](self->_delegate, "relay:activateApplicationWithBundleIdentifier:", self, v6);
  }
  else
  {
    v5 = (void *)objc_opt_class();
    logUnexpectedType(v5, v4);

  }
}

- (void)_rpc_debuggerWillSleep:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WIRConnectionIdentifierKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    -[NSMutableDictionary objectForKey:](self->_clientConnections, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    RWIDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138543362;
        v10 = v5;
        _os_log_impl(&dword_21AD49000, v7, OS_LOG_TYPE_DEFAULT, "Client Connection will sleep: %{public}@", (uint8_t *)&v9, 0xCu);
      }

      objc_msgSend(v5, "setSleeping:", 1);
      -[RWIRelayDelegate relayClientConnectionDidChange:](self->_delegate, "relayClientConnectionDidChange:", self);
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[RWIRelay _rpc_getConnectedApplications:].cold.1();

    }
  }
  else
  {
    v8 = (void *)objc_opt_class();
    logUnexpectedType(v8, v5);
  }

}

- (void)_rpc_debuggerDidWake:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WIRConnectionIdentifierKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    -[NSMutableDictionary objectForKey:](self->_clientConnections, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    RWIDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138543362;
        v10 = v5;
        _os_log_impl(&dword_21AD49000, v7, OS_LOG_TYPE_DEFAULT, "Client Connection did wake: %{public}@", (uint8_t *)&v9, 0xCu);
      }

      objc_msgSend(v5, "setSleeping:", 0);
      -[RWIRelayDelegate relayClientConnectionDidChange:](self->_delegate, "relayClientConnectionDidChange:", self);
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[RWIRelay _rpc_getConnectedApplications:].cold.1();

    }
  }
  else
  {
    v8 = (void *)objc_opt_class();
    logUnexpectedType(v8, v5);
  }

}

- (void)_proxyApplicationConnected:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  void *v7;
  void *v8;
  NSMutableDictionary *pendingProxyApplicationConnections;
  void *v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  RWIDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v4, "pid");
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = 67109635;
    v12[1] = v6;
    v13 = 2114;
    v14 = v7;
    v15 = 2113;
    v16 = v8;
    _os_log_impl(&dword_21AD49000, v5, OS_LOG_TYPE_DEFAULT, "Proxy Application Connected: %d - %{public}@ - %{private}@", (uint8_t *)v12, 0x1Cu);

  }
  pendingProxyApplicationConnections = self->_pendingProxyApplicationConnections;
  objc_msgSend(v4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](pendingProxyApplicationConnections, "setObject:forKey:", v4, v10);

  objc_msgSend(v4, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendMessage:userInfo:", CFSTR("WIRProxyApplicationSetupMessage"), 0);

}

- (void)_proxyApplicationResponse:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  void *v10;
  void *v11;
  NSMutableDictionary *pendingProxyApplicationConnections;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  int v25;
  _BYTE v26[14];
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  RWIDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v6, "pid");
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 67109635;
    *(_DWORD *)v26 = v9;
    *(_WORD *)&v26[4] = 2114;
    *(_QWORD *)&v26[6] = v10;
    v27 = 2113;
    v28 = v11;
    _os_log_impl(&dword_21AD49000, v8, OS_LOG_TYPE_DEFAULT, "Proxy Application Response: %d - %{public}@ - %{private}@", (uint8_t *)&v25, 0x1Cu);

  }
  pendingProxyApplicationConnections = self->_pendingProxyApplicationConnections;
  objc_msgSend(v6, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](pendingProxyApplicationConnections, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = self->_pendingProxyApplicationConnections;
    objc_msgSend(v6, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v15, "removeObjectForKey:", v16);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WIRProxyApplicationParentPID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      RWIDefaultLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_21AD49000, v21, OS_LOG_TYPE_DEFAULT, "Proxy setup response message missing data", (uint8_t *)&v25, 2u);
      }

      objc_msgSend(v6, "connection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[RWIRelay _disconnectApplicationConnect:](self, "_disconnectApplicationConnect:", v18);
      goto LABEL_19;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WIRProxyApplicationParentAuditData"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v18, "length"))
    {
      if (objc_msgSend(v18, "length") == 32)
      {
        objc_msgSend(v6, "setHostApplicationPID:", objc_msgSend(v17, "unsignedLongValue"));
        -[RWIRelay _applicationConnected:](self, "_applicationConnected:", v6);
LABEL_19:

        goto LABEL_20;
      }
      RWIDefaultLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        v23 = "Proxy setup response audit data does not appear to be valid.";
        goto LABEL_17;
      }
    }
    else
    {
      RWIDefaultLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        v23 = "Proxy setup response message missing data";
LABEL_17:
        _os_log_impl(&dword_21AD49000, v22, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v25, 2u);
      }
    }

    objc_msgSend(v6, "connection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[RWIRelay _disconnectApplicationConnect:](self, "_disconnectApplicationConnect:", v24);

    goto LABEL_19;
  }
  RWIDefaultLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543362;
    *(_QWORD *)v26 = v20;
    _os_log_impl(&dword_21AD49000, v19, OS_LOG_TYPE_DEFAULT, "Attempted to Complete Setup of a Proxy Connection not found in Pending Proxy Connections: %{public}@", (uint8_t *)&v25, 0xCu);

  }
  objc_msgSend(v6, "connection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[RWIRelay _disconnectApplicationConnect:](self, "_disconnectApplicationConnect:", v17);
LABEL_20:

}

- (void)_applicationUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  int v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  RWIDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_msgSend(v4, "pid");
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109635;
    v21 = v6;
    v22 = 2114;
    v23 = v7;
    v24 = 2113;
    v25 = v8;
    _os_log_impl(&dword_21AD49000, v5, OS_LOG_TYPE_INFO, "Application Updated: %d - %{public}@ - %{private}@", buf, 0x1Cu);

  }
  objc_msgSend(v4, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allValues](self->_clientConnections, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "_rpc_applicationUpdated:", v9);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }
  -[RWIRelayDelegate relay:applicationUpdated:](self->_delegate, "relay:applicationUpdated:", self, v4);

}

- (void)_applicationConnected:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  void *v7;
  void *v8;
  NSMutableDictionary *applicationConnections;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  int v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  RWIDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v4, "pid");
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109635;
    v24 = v6;
    v25 = 2114;
    v26 = v7;
    v27 = 2113;
    v28 = v8;
    _os_log_impl(&dword_21AD49000, v5, OS_LOG_TYPE_DEFAULT, "Application Connected: %d - %{public}@ - %{private}@", buf, 0x1Cu);

  }
  applicationConnections = self->_applicationConnections;
  objc_msgSend(v4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](applicationConnections, "setObject:forKey:", v4, v10);

  if (-[NSMutableArray count](self->_automaticInspectionDebuggers, "count"))
  {
    objc_msgSend(v4, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendMessage:userInfo:", CFSTR("WIRAutomaticInspectionConfigurationMessage"), &unk_24DE11000);

  }
  objc_msgSend(v4, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allValues](self->_clientConnections, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v17++), "_rpc_applicationConnected:", v12);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }
  -[RWIRelayDelegate relay:applicationConnected:](self->_delegate, "relay:applicationConnected:", self, v4);

}

- (void)_applicationDisconnected:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableDictionary *applicationConnections;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  int v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  RWIDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v4, "pid");
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109635;
    v23 = v6;
    v24 = 2114;
    v25 = v7;
    v26 = 2113;
    v27 = v8;
    _os_log_impl(&dword_21AD49000, v5, OS_LOG_TYPE_DEFAULT, "Application Disconnected: %d - %{public}@ - %{private}@", buf, 0x1Cu);

  }
  objc_msgSend(v4, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allValues](self->_clientConnections, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14++), "_rpc_applicationDisconnected:", v9);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }
  applicationConnections = self->_applicationConnections;
  objc_msgSend(v4, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](applicationConnections, "removeObjectForKey:", v16);

  -[RWIRelayDelegate relay:applicationDisconnected:](self->_delegate, "relay:applicationDisconnected:", self, v4);
}

- (void)_disconnectApplicationConnect:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "sendMessage:userInfo:", CFSTR("WIRPermissionDenied"), 0);
  objc_msgSend(v3, "setDelegate:", 0);

}

- (void)_handleApplicationListenConnectionEvent:(id)a3
{
  id v4;
  _xpc_connection_s *v5;
  uint64_t pid;
  _RWIRelayConnectionToApplication *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint8_t buf[40];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (MEMORY[0x220757BC4]() == MEMORY[0x24BDACF88])
  {
    v5 = (_xpc_connection_s *)v4;
    xpc_connection_get_audit_token();
    pid = xpc_connection_get_pid(v5);
    v7 = -[_RWIRelayConnectionToApplication initWithConnection:]([_RWIRelayConnectionToApplication alloc], "initWithConnection:", v5);
    -[_RWIRelayConnectionToApplication setDelegate:](v7, "setDelegate:", self);
    +[_RWIApplicationInfo identifierForPID:](_RWIApplicationInfo, "identifierForPID:", pid);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_applicationConnections, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      memset(buf, 0, 32);
      if (CPCopyBundleIdentifierAndTeamFromAuditToken())
      {
        v10 = 0;
      }
      else
      {
        v11 = (void *)MEMORY[0x24BDD17C8];
        processNameForPID();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("process-%@"), v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      RWIDefaultLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109379;
        *(_DWORD *)&buf[4] = pid;
        *(_WORD *)&buf[8] = 2113;
        *(_QWORD *)&buf[10] = v10;
        _os_log_impl(&dword_21AD49000, v13, OS_LOG_TYPE_DEFAULT, "XPC Application Connection Event: %d - %{private}@", buf, 0x12u);
      }

      -[RWIRelayDelegate relay:applicationInfoForIncomingConnection:bundleIdentifier:](self->_delegate, "relay:applicationInfoForIncomingConnection:bundleIdentifier:", self, v7, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        -[_RWIRelayConnectionToApplication setTag:](v7, "setTag:", v8);
        if (objc_msgSend(v14, "isProxy"))
          -[RWIRelay _proxyApplicationConnected:](self, "_proxyApplicationConnected:", v14);
        else
          -[RWIRelay _applicationConnected:](self, "_applicationConnected:", v14);
      }
      else
      {
        -[RWIRelay _disconnectApplicationConnect:](self, "_disconnectApplicationConnect:", v7);
      }

    }
  }

}

- (void)_addPendingClientConnection:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  RWIDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_21AD49000, v5, OS_LOG_TYPE_DEFAULT, "Received Pending Client Connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[NSMutableArray addObject:](self->_pendingClientConnections, "addObject:", v4);
}

- (void)_finalizePendingClientConnection:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  RWIDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = v6;
    _os_log_impl(&dword_21AD49000, v8, OS_LOG_TYPE_DEFAULT, "Finalized Client Connection: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  if ((removeObjectFromArray(self->_pendingClientConnections, v6) & 1) != 0)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_clientConnections, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      RWIDefaultLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[RWIRelay _finalizePendingClientConnection:withIdentifier:].cold.1();
    }
    else
    {
      objc_msgSend(v6, "setTag:", v7);
      MEMORY[0x220757BD0](-[NSMutableDictionary setObject:forKey:](self->_clientConnections, "setObject:forKey:", v6, v7));
      -[RWIRelay _reportCurrentStateToClient:](self, "_reportCurrentStateToClient:", v6);
      -[RWIRelay _allApplicationDetails](self, "_allApplicationDetails");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_rpc_reportConnectedApplicationList:", v11);

      -[RWIRelay _allDriverDetails](self, "_allDriverDetails");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_rpc_reportConnectedDriverList:", v10);
    }
  }
  else
  {
    RWIDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[RWIRelay _finalizePendingClientConnection:withIdentifier:].cold.2();
  }

}

- (void)clientConnectionDidClose:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableDictionary *clientConnections;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  NSObject *v24;
  uint8_t v25[16];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  const __CFString *v36;
  _QWORD v37[3];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "tag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v36 = CFSTR("WIRConnectionIdentifierKey");
    objc_msgSend(v4, "tag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary allValues](self->_applicationConnections, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "connection");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "sendMessage:userInfo:", CFSTR("WIRConnectionDiedMessage"), v7);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v10);
    }
    clientConnections = self->_clientConnections;
    objc_msgSend(v4, "tag");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](clientConnections, "removeObjectForKey:", v15);

    v16 = removeObjectFromArray(self->_automaticInspectionDebuggers, v4);
    MEMORY[0x220757BDC](v16);
    -[NSMutableDictionary allValues](self->_driverInterfaces, "allValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
          objc_msgSend(v22, "connection");
          v23 = (id)objc_claimAutoreleasedReturnValue();

          if (v23 == v4)
            -[RWIRelay _driverDisconnected:](self, "_driverDisconnected:", v22);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v19);
    }

  }
  else
  {
    removeObjectFromArray(self->_pendingClientConnections, v4);
  }
  if (!-[NSMutableDictionary count](self->_clientConnections, "count"))
  {
    RWIDefaultLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_21AD49000, v24, OS_LOG_TYPE_DEFAULT, "Shutting Down, last client disconnected.", v25, 2u);
    }

    -[RWIRelay _setGlobalNotifyStateWithAutomaticInspectionEnabled:](self, "_setGlobalNotifyStateWithAutomaticInspectionEnabled:", 0);
    exit(0);
  }

}

- (void)_driverConnected:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  NSMutableDictionary *driverInterfaces;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  RWIDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "isActive");
    v9 = CFSTR("Inactive");
    *(_DWORD *)buf = 138543875;
    v25 = v6;
    if (v8)
      v9 = CFSTR("Active");
    v26 = 2113;
    v27 = v7;
    v28 = 2114;
    v29 = v9;
    _os_log_impl(&dword_21AD49000, v5, OS_LOG_TYPE_DEFAULT, "Added Driver Interface: %{public}@ - %{private}@ (%{public}@)", buf, 0x20u);

  }
  driverInterfaces = self->_driverInterfaces;
  objc_msgSend(v4, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](driverInterfaces, "setObject:forKey:", v4, v11);

  -[NSMutableDictionary allValues](self->_clientConnections, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v16);
        objc_msgSend(v4, "dictionaryRepresentation");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_rpc_driverConnected:", v18);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

}

- (void)_driverUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  RWIDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "isActive");
    v9 = CFSTR("Inactive");
    *(_DWORD *)buf = 138543875;
    v23 = v6;
    if (v8)
      v9 = CFSTR("Active");
    v24 = 2113;
    v25 = v7;
    v26 = 2114;
    v27 = v9;
    _os_log_impl(&dword_21AD49000, v5, OS_LOG_TYPE_DEFAULT, "Updated Driver Interface %{public}@ - %{private}@ (%{public}@)", buf, 0x20u);

  }
  -[NSMutableDictionary allValues](self->_clientConnections, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
        objc_msgSend(v4, "dictionaryRepresentation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_rpc_driverUpdated:", v16);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

}

- (void)_driverDisconnected:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  NSMutableDictionary *driverInterfaces;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  RWIDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "isActive");
    v9 = CFSTR("Inactive");
    *(_DWORD *)buf = 138543875;
    v25 = v6;
    if (v8)
      v9 = CFSTR("Active");
    v26 = 2113;
    v27 = v7;
    v28 = 2114;
    v29 = v9;
    _os_log_impl(&dword_21AD49000, v5, OS_LOG_TYPE_DEFAULT, "Removed Driver Interface %{public}@ - %{private}@ (%{public}@)", buf, 0x20u);

  }
  driverInterfaces = self->_driverInterfaces;
  objc_msgSend(v4, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](driverInterfaces, "removeObjectForKey:", v11);

  -[NSMutableDictionary allValues](self->_clientConnections, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v16);
        objc_msgSend(v4, "dictionaryRepresentation");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_rpc_driverDisconnected:", v18);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

}

- (void)xpcConnectionFailed:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *applicationConnections;
  void *v7;
  void *v8;
  NSObject *v9;
  NSMutableDictionary *pendingProxyApplicationConnections;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "tag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    applicationConnections = self->_applicationConnections;
    objc_msgSend(v4, "tag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](applicationConnections, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    RWIDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[RWIRelay xpcConnectionFailed:].cold.1(v8, v9);

    if (v8)
      -[RWIRelay _applicationDisconnected:](self, "_applicationDisconnected:", v8);
    pendingProxyApplicationConnections = self->_pendingProxyApplicationConnections;
    objc_msgSend(v4, "tag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](pendingProxyApplicationConnections, "removeObjectForKey:", v11);

  }
}

- (void)xpcConnection:(id)a3 receivedMessage:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v11, "tag");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("WIRRawDataMessage")))
    {
      -[RWIRelay _receivedDataMessage:connection:](self, "_receivedDataMessage:connection:", v9, v11);
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("WIRListingMessage")))
    {
      -[RWIRelay _receivedListingMessage:connection:](self, "_receivedListingMessage:connection:", v9, v11);
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("WIRProxyApplicationSetupResponseMessage")))
    {
      -[RWIRelay _receivedProxyApplicationSetupResponseMessage:connection:](self, "_receivedProxyApplicationSetupResponseMessage:connection:", v9, v11);
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("WIRAutomaticInspectionCandidateMessage")))
    {
      -[RWIRelay _receivedAutomaticInspectionCandidate:connection:](self, "_receivedAutomaticInspectionCandidate:connection:", v9, v11);
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("WIRPingMessage")))
    {
      -[RWIRelay _receivedPingMessage:connection:](self, "_receivedPingMessage:connection:", v9, v11);
    }
  }

}

- (void)xpcConnection:(id)a3 unhandledMessage:(id)a4
{
  -[RWIRelayDelegate relay:unhandledApplicationXPCMessage:](self->_delegate, "relay:unhandledApplicationXPCMessage:", self, a4);
}

- (void)_receivedDataMessage:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  _QWORD v26[5];

  v26[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("WIRConnectionIdentifierKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("WIRRawDataKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("WIRMessageDataTypeKey"));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      v13 = CFSTR("WIRMessageDataTypeFull");
      if (v11)
        v13 = (__CFString *)v11;
      v14 = v13;

      v10 = v14;
      objc_opt_class();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("WIRDestinationKey"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {

          -[NSMutableDictionary objectForKey:](self->_clientConnections, "objectForKey:", v8);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v25[0] = CFSTR("WIRMessageDataKey");
          v25[1] = CFSTR("WIRMessageDataTypeKey");
          v26[0] = v9;
          v26[1] = v10;
          v26[2] = v16;
          v25[2] = CFSTR("WIRDestinationKey");
          v25[3] = CFSTR("WIRApplicationIdentifierKey");
          objc_msgSend(v7, "tag");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v26[3] = v19;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "_rpc_applicationSentData:", v20);

        }
        else
        {
          v24 = (void *)objc_opt_class();
          logUnexpectedType(v24, v17);

        }
      }
      else
      {
        v23 = (void *)objc_opt_class();
        logUnexpectedType(v23, v15);

      }
    }
    else
    {
      v22 = (void *)objc_opt_class();
      logUnexpectedType(v22, v10);
    }

  }
  else
  {
    v21 = (void *)objc_opt_class();
    logUnexpectedType(v21, v9);
  }

}

- (void)_receivedListingMessage:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSMutableDictionary *pendingProxyApplicationConnections;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  NSMutableDictionary *applicationConnections;
  void *v31;
  void *v32;
  void *v33;
  RWIRelay *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _QWORD v40[2];
  _QWORD v41[4];

  v41[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("WIRConnectionIdentifierKey"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = (void *)objc_opt_class();
    logUnexpectedType(v20, v9);

  }
  else
  {

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("WIRListingKey"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      v21 = (void *)objc_opt_class();
      logUnexpectedType(v21, v11);

    }
    else
    {

      pendingProxyApplicationConnections = self->_pendingProxyApplicationConnections;
      objc_msgSend(v7, "tag");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](pendingProxyApplicationConnections, "objectForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        if (v14)
        {
          objc_msgSend(v10, "allValues");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "indexOfObjectPassingTest:", &__block_literal_global_166);

          if (v16 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v17 = self->_pendingProxyApplicationConnections;
            objc_msgSend(v14, "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary removeObjectForKey:](v17, "removeObjectForKey:", v18);

            -[RWIRelay _applicationConnected:](self, "_applicationConnected:", v14);
          }
        }
      }
      if (v8)
      {
        -[NSMutableDictionary objectForKey:](self->_clientConnections, "objectForKey:", v8);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = 0;
      }
      if (v10)
        v22 = v10;
      else
        v22 = (id)MEMORY[0x24BDBD1B8];
      v40[0] = CFSTR("WIRListingKey");
      v40[1] = CFSTR("WIRApplicationIdentifierKey");
      v41[0] = v22;
      objc_msgSend(v7, "tag");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v41[1] = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v19, "_rpc_applicationSentListing:", v24);
      }
      else
      {
        v33 = v14;
        v34 = self;
        -[NSMutableDictionary allValues](self->_clientConnections, "allValues");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v36;
          do
          {
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v36 != v28)
                objc_enumerationMutation(v25);
              objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "_rpc_applicationSentListing:", v24);
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
          }
          while (v27);
        }

        v14 = v33;
        self = v34;
      }
      applicationConnections = self->_applicationConnections;
      objc_msgSend(v7, "tag");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](applicationConnections, "objectForKey:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v32, "updateFromListing:", v6))
        -[RWIRelay _applicationUpdated:](self, "_applicationUpdated:", v32);

    }
  }

}

BOOL __47__RWIRelay__receivedListingMessage_connection___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;
  void *v5;

  v2 = a2;
  objc_opt_class();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("WIRHostApplicationIdentifierKey"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;
  }
  else
  {
    v5 = (void *)objc_opt_class();
    logUnexpectedType(v5, v3);
    v4 = 0;
  }

  return v4;
}

- (void)_receivedProxyApplicationSetupResponseMessage:(id)a3 connection:(id)a4
{
  NSMutableDictionary *pendingProxyApplicationConnections;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  pendingProxyApplicationConnections = self->_pendingProxyApplicationConnections;
  objc_msgSend(a4, "tag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](pendingProxyApplicationConnections, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    -[RWIRelay _proxyApplicationResponse:userInfo:](self, "_proxyApplicationResponse:userInfo:", v8, v9);

}

- (void)_receivedAutomaticInspectionCandidate:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSMutableDictionary *applicationConnections;
  void *v11;
  _RWIAutomaticInspectionSession *v12;
  void *v13;
  _RWIAutomaticInspectionSession *v14;
  NSMutableDictionary *automaticInspectionSessions;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint8_t v21[16];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("WIRPageIdentifierKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    applicationConnections = self->_applicationConnections;
    objc_msgSend(v7, "tag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](applicationConnections, "objectForKey:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (-[NSMutableArray count](self->_automaticInspectionDebuggers, "count"))
      {
        v12 = [_RWIAutomaticInspectionSession alloc];
        objc_msgSend(v7, "tag");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[_RWIAutomaticInspectionSession initWithPageId:applicationIdentifier:applicationPID:debuggers:](v12, "initWithPageId:applicationIdentifier:applicationPID:debuggers:", v8, v13, objc_msgSend(v9, "pid"), self->_automaticInspectionDebuggers);

        automaticInspectionSessions = self->_automaticInspectionSessions;
        -[_RWIAutomaticInspectionSession identifier](v14, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](automaticInspectionSessions, "setObject:forKey:", v14, v16);

        -[_RWIAutomaticInspectionSession start](v14, "start");
      }
      else
      {
        RWIDefaultLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_21AD49000, v18, OS_LOG_TYPE_DEFAULT, "Automatic Inspection Candidate REJECT : No Automatic Inspection Debuggers", v21, 2u);
        }

        objc_msgSend(v9, "connection");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dictionaryWithValuesForKeys:", &unk_24DE10FE8);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "sendMessage:userInfo:", CFSTR("WIRAutomaticInspectionRejectMessage"), v20);

      }
    }
  }
  else
  {
    v17 = (void *)objc_opt_class();
    logUnexpectedType(v17, v9);
  }

}

- (void)_receivedPingMessage:(id)a3 connection:(id)a4
{
  objc_msgSend(a4, "sendMessage:userInfo:", CFSTR("WIRPingSuccessMessage"), 0);
}

- (RWIRelayDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (RWIRelayDelegate *)a3;
}

- (NSMutableDictionary)applicationConnections
{
  return self->_applicationConnections;
}

- (NSMutableDictionary)clientConnections
{
  return self->_clientConnections;
}

- (NSMutableDictionary)driverInterfaces
{
  return self->_driverInterfaces;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_driverInterfaces, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_applicationConnections, 0);
  objc_storeStrong((id *)&self->_automaticInspectionSessions, 0);
  objc_storeStrong((id *)&self->_automaticInspectionDebuggers, 0);
  objc_storeStrong((id *)&self->_pendingProxyApplicationConnections, 0);
  objc_storeStrong((id *)&self->_pendingClientConnections, 0);
  objc_storeStrong((id *)&self->_xpcApplicationListenConnection, 0);
}

- (void)_dumpApplication:(void *)a1 withOrdinal:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("(UNKNOWN)");
  objc_msgSend(a1, "bundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138478083;
  v9 = v6;
  v10 = 2113;
  v11 = v7;
  _os_log_debug_impl(&dword_21AD49000, a2, OS_LOG_TYPE_DEBUG, "    %{private}@ (%{private}@)", (uint8_t *)&v8, 0x16u);

}

- (void)_rpc_getConnectedApplications:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_4(&dword_21AD49000, v0, v1, "Message from unknown client connection: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_rpc_reportDriverConnected:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_4(&dword_21AD49000, v0, v1, "Could not parse RWIDriverConfiguration from payload: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_rpc_reportDriverConnected:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_4(&dword_21AD49000, v0, v1, "Could not parse RWIDriverState from payload: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_rpc_reportDriverDisconnected:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_4(&dword_21AD49000, v0, v1, "Could not find interface information for driver with identifier: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_finalizePendingClientConnection:withIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_4(&dword_21AD49000, v0, v1, "Attempted to open multiple connections from the same client: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_finalizePendingClientConnection:withIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_4(&dword_21AD49000, v0, v1, "Attempted to Complete Setup of a Remote Connection not found in Pending Connections: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)xpcConnectionFailed:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  int v4;
  void *v5;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(a1, "pid");
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 67109635;
  v7[1] = v4;
  v8 = 2114;
  v9 = v5;
  v10 = 2113;
  v11 = v6;
  _os_log_error_impl(&dword_21AD49000, a2, OS_LOG_TYPE_ERROR, "XPC Connection Failed for Application: %d - %{public}@ - %{private}@", (uint8_t *)v7, 0x1Cu);

}

@end
