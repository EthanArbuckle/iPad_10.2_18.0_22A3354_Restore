@implementation SRAuthorizationClient

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    SRLogAuthorizationClient = (uint64_t)os_log_create("com.apple.SensorKit", "AuthorizationClient");
}

+ (SRAuthorizationClient)authClient
{
  return (SRAuthorizationClient *)_MergedGlobals_0;
}

+ (void)setAuthClient:(id)a3
{
  if ((id)_MergedGlobals_0 != a3)
  {

    _MergedGlobals_0 = (uint64_t)a3;
  }
}

+ (SRAuthorizationClient)sharedInstance
{
  SRAuthorizationClient *result;

  result = (SRAuthorizationClient *)_MergedGlobals_0;
  if (!_MergedGlobals_0)
  {
    if (qword_25751A020 != -1)
      dispatch_once(&qword_25751A020, &__block_literal_global_1);
    return (SRAuthorizationClient *)qword_25751A018;
  }
  return result;
}

SRAuthorizationClient *__39__SRAuthorizationClient_sharedInstance__block_invoke()
{
  SRAuthorizationClient *result;

  result = objc_alloc_init(SRAuthorizationClient);
  qword_25751A018 = (uint64_t)result;
  return result;
}

- (SRAuthorizationClient)init
{
  return -[SRAuthorizationClient initWithConnection:](self, "initWithConnection:", (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.SensorKit.authorization"), 4096));
}

- (SRAuthorizationClient)initWithConnection:(id)a3
{
  SRAuthorizationClient *v4;
  SRAuthorizationClient *v5;
  void *v6;
  SEL v7;
  void *v8;
  SEL v9;
  void *v10;
  SEL v11;
  void *v12;
  SEL v13;
  SEL v14;
  uint64_t v15;
  NSObject *v16;
  int *p_registrationToken;
  const char *v18;
  uint32_t v19;
  NSObject *v20;
  int v21;
  _QWORD v23[5];
  id v24;
  id location;
  objc_super v26;
  _QWORD handler[4];
  id v28;
  id from;
  uint8_t buf[4];
  uint32_t v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v26.receiver = self;
  v26.super_class = (Class)SRAuthorizationClient;
  v4 = -[SRAuthorizationClient init](&v26, sel_init);
  v5 = v4;
  if (v4)
  {
    -[SRAuthorizationClient setInitialAuthNeeded:](v4, "setInitialAuthNeeded:", 1);
    v6 = (void *)objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    objc_setProperty_nonatomic(v5, v7, v6, 24);
    v8 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    objc_setProperty_atomic(v5, v9, v8, 32);
    v10 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    objc_setProperty_atomic(v5, v11, v10, 40);
    v12 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    objc_setProperty_atomic(v5, v13, v12, 48);
    objc_setProperty_nonatomic(v5, v14, a3, 16);
    -[NSXPCConnection setRemoteObjectInterface:](v5->_connection, "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25751EDE8));
    -[NSXPCConnection setExportedInterface:](v5->_connection, "setExportedInterface:", objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25751CE50));
    -[NSXPCConnection setExportedObject:](v5->_connection, "setExportedObject:", v5);
    objc_initWeak(&location, v5);
    v15 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __44__SRAuthorizationClient_initWithConnection___block_invoke;
    v23[3] = &unk_2516F2230;
    objc_copyWeak(&v24, &location);
    v23[4] = a3;
    -[NSXPCConnection setInterruptionHandler:](v5->_connection, "setInterruptionHandler:", v23);
    -[NSXPCConnection resume](v5->_connection, "resume");
    v16 = SRLogAuthorizationClient;
    if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(handler[0]) = 0;
      _os_log_debug_impl(&dword_245CD7000, v16, OS_LOG_TYPE_DEBUG, "Registering for prerequisites notification", (uint8_t *)handler, 2u);
    }
    objc_initWeak(&from, v5);
    v5->_registrationToken = -1;
    p_registrationToken = &v5->_registrationToken;
    v18 = (const char *)objc_msgSend(CFSTR("com.apple.SensorKit.prerequisitesUpdated"), "UTF8String");
    handler[0] = v15;
    handler[1] = 3221225472;
    handler[2] = __56__SRAuthorizationClient_registerForPrerequisitesUpdated__block_invoke;
    handler[3] = &unk_2516F2190;
    objc_copyWeak(&v28, &from);
    v19 = notify_register_dispatch(v18, &v5->_registrationToken, MEMORY[0x24BDAC9B8], handler);
    if (v19 || *p_registrationToken == -1)
    {
      v20 = SRLogAuthorizationClient;
      if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_ERROR))
      {
        v21 = *p_registrationToken;
        *(_DWORD *)buf = 67240448;
        v31 = v19;
        v32 = 1026;
        v33 = v21;
        _os_log_error_impl(&dword_245CD7000, v20, OS_LOG_TYPE_ERROR, "Failed to register for prerequisites notification status %{public}d, registration token %{public}d", buf, 0xEu);
      }
    }
    objc_destroyWeak(&v28);
    objc_destroyWeak(&from);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  return v5;
}

id *__44__SRAuthorizationClient_initWithConnection___block_invoke(uint64_t a1)
{
  id *result;
  id *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id *v11;
  uint64_t v12;
  id *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  result = (id *)objc_loadWeak((id *)(a1 + 40));
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)(a1 + 32);
    v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = v3[3];
    objc_sync_enter(v6);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v3[3];
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(v5, "addObject:", objc_msgSend(v3[3], "objectForKey:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i)));
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v8);
    }
    objc_sync_exit(v6);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    result = (id *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    v11 = result;
    if (result)
    {
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v5);
          v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v13);
          if (objc_msgSend(v14, "isEqualToString:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "bundleIdentifier")))v15 = 0;
          else
            v15 = v14;
          objc_msgSend(v3, "reregisterAfterInterruption:effectiveBundleId:", v4, v15);
          v13 = (id *)((char *)v13 + 1);
        }
        while (v11 != v13);
        result = (id *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        v11 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)invalidate
{
  -[NSXPCConnection invalidate](self->_connection, "invalidate");

  self->_connection = 0;
}

- (void)dealloc
{
  int registrationToken;
  NSObject *v4;
  NSObject *v5;
  SEL v6;
  SEL v7;
  SEL v8;
  int v9;
  objc_super v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (self)
  {
    registrationToken = self->_registrationToken;
    if (registrationToken != -1)
    {
      v4 = SRLogAuthorizationClient;
      if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_245CD7000, v4, OS_LOG_TYPE_DEBUG, "Unregistering for prerequisites notification", buf, 2u);
        registrationToken = self->_registrationToken;
      }
      if (notify_cancel(registrationToken))
      {
        v5 = SRLogAuthorizationClient;
        if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_ERROR))
        {
          v9 = self->_registrationToken;
          *(_DWORD *)buf = 67240192;
          v12 = v9;
          _os_log_error_impl(&dword_245CD7000, v5, OS_LOG_TYPE_ERROR, "Failed to cancel notification status %{public}d", buf, 8u);
        }
      }
      self->_registrationToken = -1;
    }
  }

  self->_listeners = 0;
  self->_actualAuthorizedServices = 0;
  objc_setProperty_atomic(self, v6, 0, 56);
  objc_setProperty_atomic(self, v7, 0, 40);

  self->_connection = 0;
  objc_setProperty_atomic(self, v8, 0, 48);
  v10.receiver = self;
  v10.super_class = (Class)SRAuthorizationClient;
  -[SRAuthorizationClient dealloc](&v10, sel_dealloc);
}

- (void)reregisterAfterInterruption:(id)a3 effectiveBundleId:(id)a4
{
  objc_msgSend((id)objc_msgSend(a3, "remoteObjectProxy"), "registerForAuthorizationChangeNotificationsWithEffectiveBundleId:", a4);
}

- (void)updateInitialAuthorizationStateIfNeeded
{
  uint64_t v1;
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  if (result)
  {
    v1 = (uint64_t)result;
    result = (void *)objc_msgSend(result, "initialAuthNeeded");
    if ((_DWORD)result)
    {
      v2 = SRLogAuthorizationClient;
      if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_245CD7000, v2, OS_LOG_TYPE_INFO, "Retrieving initial authorization state", buf, 2u);
      }
      v3 = (void *)-[SRAuthorizationClient syncProxy](v1);
      v4[0] = MEMORY[0x24BDAC760];
      v4[1] = 3221225472;
      v4[2] = __64__SRAuthorizationClient_updateInitialAuthorizationStateIfNeeded__block_invoke;
      v4[3] = &unk_2516F2258;
      v4[4] = v1;
      return (void *)objc_msgSend(v3, "retrieveCurrentAuthorizedServicesWithReply:", v4);
    }
  }
  return result;
}

- (uint64_t)syncProxy
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[8];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  if (!a1)
    return 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v2 = *(void **)(a1 + 16);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __34__SRAuthorizationClient_syncProxy__block_invoke;
  v8[3] = &unk_2516F2280;
  v8[4] = &v9;
  v3 = objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  if (!v3)
  {
    v4 = (void *)objc_msgSend((id)v10[5], "domain");
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD0B88])
      && objc_msgSend((id)v10[5], "code") == 4097)
    {

      v5 = SRLogAuthorizationClient;
      if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_245CD7000, v5, OS_LOG_TYPE_DEFAULT, "Connection was interrupted, retrying...", v7, 2u);
      }
      v3 = objc_msgSend(*(id *)(a1 + 16), "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_34);
    }
    else
    {
      v3 = 0;
    }
  }
  _Block_object_dispose(&v9, 8);
  return v3;
}

uint64_t __64__SRAuthorizationClient_updateInitialAuthorizationStateIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  id Property;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  NSObject *v36;
  const char *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  uint64_t v43;
  NSObject *v44;
  const char *v45;
  id v46;
  uint64_t v47;
  id v49;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint8_t v66[128];
  uint8_t buf[4];
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    v8 = *(void **)(v7 + 24);
  else
    v8 = 0;
  v49 = v8;
  objc_sync_enter(v8);
  v10 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a2);
  v11 = *(void **)(a1 + 32);
  if (v11)
    objc_setProperty_atomic(v11, v9, v10, 32);
  v13 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a3);
  v14 = *(void **)(a1 + 32);
  if (v14)
    objc_setProperty_atomic(v14, v12, v13, 40);
  v16 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a4);
  v17 = *(void **)(a1 + 32);
  if (v17)
    objc_setProperty_atomic(v17, v15, v16, 48);
  v19 = (void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
  v20 = *(void **)(a1 + 32);
  if (v20)
    objc_setProperty_atomic(v20, v18, v19, 56);
  v21 = SRLogAuthorizationClient;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_INFO))
  {
    Property = *(id *)(a1 + 32);
    if (Property)
      Property = objc_getProperty(Property, v22, 56, 1);
    *(_DWORD *)buf = 134217984;
    v68 = objc_msgSend(Property, "integerValue");
    _os_log_impl(&dword_245CD7000, v21, OS_LOG_TYPE_INFO, "Retrieved initial authorization state. prerequisites: %ld", buf, 0xCu);
  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v24 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v62 != v25)
          objc_enumerationMutation(a2);
        v27 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
        v28 = SRLogAuthorizationClient;
        if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_INFO))
        {
          v30 = *(id *)(a1 + 32);
          if (v30)
            v30 = objc_getProperty(v30, v29, 32, 1);
          v31 = objc_msgSend(v30, "objectForKeyedSubscript:", v27);
          *(_DWORD *)buf = 138543619;
          v68 = v27;
          v69 = 2113;
          v70 = v31;
          _os_log_impl(&dword_245CD7000, v28, OS_LOG_TYPE_INFO, "%{public}@ authorized: %{private}@", buf, 0x16u);
        }
      }
      v24 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
    }
    while (v24);
  }
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v32 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v58 != v33)
          objc_enumerationMutation(a3);
        v35 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j);
        v36 = SRLogAuthorizationClient;
        if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_INFO))
        {
          v38 = *(id *)(a1 + 32);
          if (v38)
            v38 = objc_getProperty(v38, v37, 40, 1);
          v39 = objc_msgSend(v38, "objectForKeyedSubscript:", v35);
          *(_DWORD *)buf = 138543619;
          v68 = v35;
          v69 = 2113;
          v70 = v39;
          _os_log_impl(&dword_245CD7000, v36, OS_LOG_TYPE_INFO, "%{public}@ denied: %{private}@", buf, 0x16u);
        }
      }
      v32 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    }
    while (v32);
  }
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v40 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
  if (v40)
  {
    v41 = *(_QWORD *)v54;
    do
    {
      for (k = 0; k != v40; ++k)
      {
        if (*(_QWORD *)v54 != v41)
          objc_enumerationMutation(a4);
        v43 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * k);
        v44 = SRLogAuthorizationClient;
        if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_INFO))
        {
          v46 = *(id *)(a1 + 32);
          if (v46)
            v46 = objc_getProperty(v46, v45, 48, 1);
          v47 = objc_msgSend(v46, "objectForKeyedSubscript:", v43);
          *(_DWORD *)buf = 138543619;
          v68 = v43;
          v69 = 2113;
          v70 = v47;
          _os_log_impl(&dword_245CD7000, v44, OS_LOG_TYPE_INFO, "%{public}@ last modified times: %{private}@", buf, 0x16u);
        }
      }
      v40 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
    }
    while (v40);
  }
  objc_msgSend(*(id *)(a1 + 32), "setInitialAuthNeeded:", 0);
  return objc_sync_exit(v49);
}

void __56__SRAuthorizationClient_registerForPrerequisitesUpdated__block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "setInitialAuthNeeded:", 1);
  v1 = SRLogAuthorizationClient;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v2 = 0;
    _os_log_debug_impl(&dword_245CD7000, v1, OS_LOG_TYPE_DEBUG, "Received notification of prerequisite change", v2, 2u);
  }
}

- (NSDictionary)authorizedServices
{
  NSMapTable *listeners;
  void *v4;
  SEL v5;
  id Property;
  NSDictionary *v7;

  -[SRAuthorizationClient updateInitialAuthorizationStateIfNeeded](self);
  if (self)
  {
    listeners = self->_listeners;
    objc_sync_enter(listeners);
    v4 = (void *)MEMORY[0x24BDBCE70];
    Property = objc_getProperty(self, v5, 32, 1);
  }
  else
  {
    objc_sync_enter(0);
    listeners = 0;
    Property = 0;
    v4 = (void *)MEMORY[0x24BDBCE70];
  }
  v7 = (NSDictionary *)objc_msgSend(v4, "dictionaryWithDictionary:", (id)objc_msgSend(Property, "copy"));
  objc_sync_exit(listeners);
  return v7;
}

- (BOOL)dataCollectionEnabled
{
  const char *v3;
  id Property;

  -[SRAuthorizationClient updateInitialAuthorizationStateIfNeeded](self);
  if (self)
    Property = objc_getProperty(self, v3, 56, 1);
  else
    Property = 0;
  return objc_msgSend(Property, "integerValue") & 1;
}

- (void)setDataCollectionEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[SRAuthorizationClient setInitialAuthNeeded:](self, "setInitialAuthNeeded:", 1);
  objc_msgSend((id)-[SRAuthorizationClient syncProxy]((uint64_t)self), "setDataCollectionEnabled:", v3);
}

- (BOOL)firstRunOnboardingCompleted
{
  const char *v3;
  id Property;

  -[SRAuthorizationClient updateInitialAuthorizationStateIfNeeded](self);
  if (self)
    Property = objc_getProperty(self, v3, 56, 1);
  else
    Property = 0;
  return ((unint64_t)objc_msgSend(Property, "integerValue") >> 1) & 1;
}

- (void)setFirstRunOnboardingCompleted:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[SRAuthorizationClient setInitialAuthNeeded:](self, "setInitialAuthNeeded:", 1);
  objc_msgSend((id)-[SRAuthorizationClient syncProxy]((uint64_t)self), "setFirstRunOnboardingCompleted:", v3);
}

id __34__SRAuthorizationClient_syncProxy__block_invoke(uint64_t a1, void *a2)
{
  NSObject *v4;
  id result;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = SRLogAuthorizationClient;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = a2;
    _os_log_error_impl(&dword_245CD7000, v4, OS_LOG_TYPE_ERROR, "Failed to get sync proxy to daemon, error %{public}@", (uint8_t *)&v6, 0xCu);
  }
  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

void __34__SRAuthorizationClient_syncProxy__block_invoke_33(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = SRLogAuthorizationClient;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = a2;
    _os_log_error_impl(&dword_245CD7000, v3, OS_LOG_TYPE_ERROR, "Failed to get sync proxy to daemon, error %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (NSArray)legacyResearchStudyBundleIDs
{
  void *v2;
  NSArray *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  v2 = (void *)-[SRAuthorizationClient syncProxy]((uint64_t)self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__SRAuthorizationClient_legacyResearchStudyBundleIDs__block_invoke;
  v5[3] = &unk_2516F22C8;
  v5[4] = &v6;
  objc_msgSend(v2, "legacyResearchStudyBundleIDs:", v5);
  v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__SRAuthorizationClient_legacyResearchStudyBundleIDs__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (NSString)legacyResearchStudyEntitlement
{
  void *v2;
  NSString *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  v2 = (void *)-[SRAuthorizationClient syncProxy]((uint64_t)self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__SRAuthorizationClient_legacyResearchStudyEntitlement__block_invoke;
  v5[3] = &unk_2516F22F0;
  v5[4] = &v6;
  objc_msgSend(v2, "legacyResearchStudyEntitlement:", v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__SRAuthorizationClient_legacyResearchStudyEntitlement__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)addListener:(id)a3
{
  -[SRAuthorizationClient addListener:forBundleId:](self, "addListener:forBundleId:", a3, 0);
}

- (void)addListener:(id)a3 forBundleId:(id)a4
{
  NSMapTable *listeners;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  int v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint8_t v18[16];

  if (self)
    listeners = self->_listeners;
  else
    listeners = 0;
  objc_sync_enter(listeners);
  v8 = -[NSMapTable objectForKey:](self->_listeners, "objectForKey:", a3);
  v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "bundleIdentifier");
  v10 = v9;
  if (a4)
    v11 = a4;
  else
    v11 = (id)v9;
  -[NSMapTable setObject:forKey:](self->_listeners, "setObject:forKey:", v11, a3);
  if ((!v8 || objc_msgSend(v8, "isEqualToString:", v11))
    && ((v12 = objc_msgSend(a4, "isEqualToString:", v10),
         v13 = -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"),
         !v12)
      ? (v14 = a4)
      : (v14 = 0),
        objc_msgSend(v13, "registerForAuthorizationChangeNotificationsWithEffectiveBundleId:", v14),
        -[SRAuthorizationClient initialAuthNeeded](self, "initialAuthNeeded")))
  {
    v15 = SRLogAuthorizationClient;
    if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_245CD7000, v15, OS_LOG_TYPE_DEFAULT, "Authorization state has not yet been sent from the daemon.", v18, 2u);
    }
    objc_sync_exit(listeners);
  }
  else
  {
    objc_sync_exit(listeners);
    v16 = (void *)-[SRAuthorizationClient authorizedServicesForBundleId:](self, (uint64_t)v11);
    v17 = (void *)-[SRAuthorizationClient deniedServicesForBundleId:](self, (uint64_t)v11);
    if (objc_msgSend(v16, "count") || objc_msgSend(v17, "count"))
      -[SRAuthorizationClient notifyListener:withAuthorizationChangeForBundleIdentifier:](self, a3, (uint64_t)v11);
  }
}

- (uint64_t)authorizedServicesForBundleId:(_QWORD *)a1
{
  void *v4;
  SEL v5;
  id v6;

  if (!a1)
    return 0;
  v4 = (void *)a1[3];
  objc_sync_enter(v4);
  v6 = (id)objc_msgSend((id)objc_msgSend(objc_getProperty(a1, v5, 32, 1), "objectForKeyedSubscript:", a2), "copy");
  objc_sync_exit(v4);
  if (v6)
    return (uint64_t)v6;
  return objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

- (uint64_t)deniedServicesForBundleId:(_QWORD *)a1
{
  void *v4;
  SEL v5;
  id v6;

  if (!a1)
    return 0;
  v4 = (void *)a1[3];
  objc_sync_enter(v4);
  v6 = (id)objc_msgSend((id)objc_msgSend(objc_getProperty(a1, v5, 40, 1), "objectForKeyedSubscript:", a2), "copy");
  objc_sync_exit(v4);
  if (v6)
    return (uint64_t)v6;
  return objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

- (_QWORD)notifyListener:(uint64_t)a3 withAuthorizationChangeForBundleIdentifier:
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  if (result)
  {
    v5 = result;
    v6 = -[SRAuthorizationClient authorizedServicesForBundleId:](result, a3);
    v7 = -[SRAuthorizationClient deniedServicesForBundleId:](v5, a3);
    return (_QWORD *)objc_msgSend(a2, "authorizedServicesDidChange:deniedServices:dataCollectionEnabled:onboardingCompleted:lastModifiedTimes:forBundleIdentifier:", v6, v7, objc_msgSend(v5, "dataCollectionEnabled"), objc_msgSend(v5, "firstRunOnboardingCompleted"), -[SRAuthorizationClient lastModifiedTimesForBundleId:](v5, a3), a3);
  }
  return result;
}

- (void)removeListener:(id)a3
{
  NSMapTable *listeners;
  NSMapTable *v6;

  if (self)
  {
    listeners = self->_listeners;
    objc_sync_enter(listeners);
    v6 = self->_listeners;
  }
  else
  {
    objc_sync_enter(0);
    listeners = 0;
    v6 = 0;
  }
  -[NSMapTable removeObjectForKey:](v6, "removeObjectForKey:", a3);
  objc_sync_exit(listeners);
}

- (_QWORD)lastModifiedTimesForBundleId:(_QWORD *)result
{
  void *v3;
  void *v4;
  SEL v5;
  id v6;

  if (result)
  {
    v3 = result;
    v4 = (void *)result[3];
    objc_sync_enter(v4);
    v6 = (id)objc_msgSend((id)objc_msgSend(objc_getProperty(v3, v5, 48, 1), "objectForKeyedSubscript:", a2), "copy");
    objc_sync_exit(v4);
    if (v6)
      return v6;
    else
      return (_QWORD *)MEMORY[0x24BDBD1B8];
  }
  return result;
}

- (void)initialAuthorizationStateForBundleId:(id)a3 authorizationState:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  _BOOL8 v10;
  _QWORD *v11;

  -[SRAuthorizationClient updateInitialAuthorizationStateIfNeeded](self);
  v7 = -[SRAuthorizationClient authorizedServicesForBundleId:](self, (uint64_t)a3);
  v8 = -[SRAuthorizationClient deniedServicesForBundleId:](self, (uint64_t)a3);
  v9 = -[SRAuthorizationClient dataCollectionEnabled](self, "dataCollectionEnabled");
  v10 = -[SRAuthorizationClient firstRunOnboardingCompleted](self, "firstRunOnboardingCompleted");
  v11 = -[SRAuthorizationClient lastModifiedTimesForBundleId:](self, (uint64_t)a3);
  (*((void (**)(id, uint64_t, uint64_t, _BOOL8, _BOOL8, _QWORD *))a4 + 2))(a4, v7, v8, v9, v10, v11);
}

- (void)authorizedServicesDidChange:(id)a3 deniedServices:(id)a4 prerequisites:(int64_t)a5 lastModifiedTimes:(id)a6 bundleIdentifier:(id)a7
{
  NSObject *v13;
  NSMapTable *listeners;
  SEL v15;
  id Property;
  const char *v17;
  id v18;
  NSObject *v19;
  id v20;
  const char *v21;
  id v22;
  void *v23;
  const char *v24;
  SEL v25;
  id v26;
  NSMapTable *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  int64_t v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v13 = SRLogAuthorizationClient;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544387;
    v38 = a7;
    v39 = 2050;
    v40 = a5;
    v41 = 2114;
    v42 = a3;
    v43 = 2114;
    v44 = a4;
    v45 = 2113;
    v46 = a6;
    _os_log_impl(&dword_245CD7000, v13, OS_LOG_TYPE_DEFAULT, "Daemon authorization update for bundle: %{public}@, prerequisites: %{public}ld, authorized: %{public}@, denied: %{public}@, last modified times: %{private}@", buf, 0x34u);
  }
  if (self)
  {
    listeners = self->_listeners;
    objc_sync_enter(listeners);
    Property = objc_getProperty(self, v15, 32, 1);
  }
  else
  {
    objc_sync_enter(0);
    listeners = 0;
    Property = 0;
  }
  if (objc_msgSend((id)objc_msgSend(Property, "objectForKeyedSubscript:", a7), "isEqual:", a3)
    && (!self ? (v18 = 0) : (v18 = objc_getProperty(self, v17, 40, 1)),
        objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", a7), "isEqualToSet:", a4)))
  {
    if (self)
    {
      if (objc_getProperty(self, v17, 56, 1)
        && objc_msgSend(objc_getProperty(self, v17, 56, 1), "integerValue") == a5)
      {
        v19 = SRLogAuthorizationClient;
        if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_245CD7000, v19, OS_LOG_TYPE_DEFAULT, "Ignoring duplicate daemon authorization update", buf, 2u);
        }
        objc_sync_exit(listeners);
        return;
      }
      goto LABEL_16;
    }
  }
  else if (self)
  {
LABEL_16:
    v20 = objc_getProperty(self, v17, 32, 1);
    goto LABEL_17;
  }
  v20 = 0;
LABEL_17:
  objc_msgSend(v20, "setObject:forKeyedSubscript:", a3, a7);
  if (self)
    v22 = objc_getProperty(self, v21, 40, 1);
  else
    v22 = 0;
  objc_msgSend(v22, "setObject:forKeyedSubscript:", a4, a7);
  v23 = (void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
  if (self)
  {
    objc_setProperty_atomic(self, v24, v23, 56);
    v26 = objc_getProperty(self, v25, 48, 1);
  }
  else
  {
    v26 = 0;
  }
  objc_msgSend(v26, "setObject:forKeyedSubscript:", a6, a7);
  objc_sync_exit(listeners);
  -[SRAuthorizationClient setInitialAuthNeeded:](self, "setInitialAuthNeeded:", 0);
  if (self)
  {
    v27 = self->_listeners;
    objc_sync_enter(v27);
    v28 = (void *)-[NSMapTable copy](self->_listeners, "copy");
    objc_sync_exit(v27);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v33, buf, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v34 != v30)
            objc_enumerationMutation(v28);
          v32 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if ((objc_msgSend((id)objc_msgSend(v28, "objectForKey:", v32), "isEqual:", a7) & 1) != 0)
            -[SRAuthorizationClient notifyListener:withAuthorizationChangeForBundleIdentifier:](self, v32, (uint64_t)a7);
        }
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v33, buf, 16);
      }
      while (v29);
    }

  }
}

- (BOOL)initialAuthNeeded
{
  return self->_initialAuthNeeded;
}

- (void)setInitialAuthNeeded:(BOOL)a3
{
  self->_initialAuthNeeded = a3;
}

@end
