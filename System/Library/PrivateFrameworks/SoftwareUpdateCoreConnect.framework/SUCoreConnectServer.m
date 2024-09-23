@implementation SUCoreConnectServer

- (SUCoreConnectServer)initWithServerPolicy:(id)a3
{
  id v5;
  SUCoreConnectServer *v6;
  SUCoreConnectServer *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  SUCoreLog *logger;
  const char *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *connectionsAccessQueue;
  NSMutableDictionary *v18;
  NSMutableDictionary *connections;
  NSMutableSet *v20;
  NSMutableSet *observerConnections;
  const char *v22;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *connectionSendMessageQueue;
  objc_super v27;

  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SUCoreConnectServer;
  v6 = -[SUCoreConnectServer init](&v27, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connectionPolicy, a3);
    v8 = objc_alloc(MEMORY[0x24BEAEA70]);
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "serviceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("SERVER-%@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "initWithCategory:", v11);
    logger = v7->_logger;
    v7->_logger = (SUCoreLog *)v12;

    v14 = (const char *)objc_msgSend(CFSTR("com.apple.SUCoreConnect.ConnectionsAccessQueue"), "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create(v14, v15);
    connectionsAccessQueue = v7->_connectionsAccessQueue;
    v7->_connectionsAccessQueue = (OS_dispatch_queue *)v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    connections = v7->_connections;
    v7->_connections = v18;

    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    observerConnections = v7->_observerConnections;
    v7->_observerConnections = v20;

    v22 = (const char *)objc_msgSend(CFSTR("com.apple.SUCoreConnect.ConnectionSendMessageQueue"), "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = dispatch_queue_create(v22, v23);
    connectionSendMessageQueue = v7->_connectionSendMessageQueue;
    v7->_connectionSendMessageQueue = (OS_dispatch_queue *)v24;

  }
  return v7;
}

- (BOOL)isConnectionEntitled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  void *v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUCoreConnectServer connectionPolicy](self, "connectionPolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[SUCoreConnectServer logger](self, "logger");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "oslog");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SUCoreConnectServer isConnectionEntitled:].cold.1();
    goto LABEL_31;
  }
  -[SUCoreConnectServer connectionPolicy](self, "connectionPolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entitlements");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {

LABEL_20:
    -[SUCoreConnectServer logger](self, "logger");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "oslog");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SUCoreConnectServer isConnectionEntitled:].cold.2();
LABEL_31:
    v23 = 0;
    goto LABEL_32;
  }
  v8 = (void *)v7;
  -[SUCoreConnectServer connectionPolicy](self, "connectionPolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "entitlements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
    goto LABEL_20;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[SUCoreConnectServer connectionPolicy](self, "connectionPolicy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "entitlements");
  v13 = objc_claimAutoreleasedReturnValue();

  v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (!v14)
  {
    v23 = 1;
    goto LABEL_32;
  }
  v16 = v14;
  v17 = *(_QWORD *)v34;
  *(_QWORD *)&v15 = 138543618;
  v32 = v15;
  while (2)
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v34 != v17)
        objc_enumerationMutation(v13);
      v19 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
      -[SUCoreConnectServer logger](self, "logger", v32);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "oslog");
      v21 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v32;
        v38 = v4;
        v39 = 2112;
        v40 = v19;
        _os_log_impl(&dword_2067B0000, v21, OS_LOG_TYPE_DEFAULT, "[EntitlementValidation](%{public}@)(%@) Checking for entitlement", buf, 0x16u);
      }

      objc_msgSend(v4, "valueForEntitlement:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        -[SUCoreConnectServer logger](self, "logger");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "oslog");
        v27 = objc_claimAutoreleasedReturnValue();

        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          goto LABEL_30;
        *(_DWORD *)buf = v32;
        v38 = v4;
        v39 = 2112;
        v40 = v19;
        v28 = "[EntitlementValidation](%{public}@)(%@) Client process does not have the entitlement";
LABEL_29:
        _os_log_impl(&dword_2067B0000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 0x16u);
        goto LABEL_30;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        -[SUCoreConnectServer logger](self, "logger");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "oslog");
        v27 = objc_claimAutoreleasedReturnValue();

        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          goto LABEL_30;
        *(_DWORD *)buf = v32;
        v38 = v4;
        v39 = 2112;
        v40 = v19;
        v28 = "[EntitlementValidation](%{public}@)(%@) New connection's entitlement is not a BOOLean";
        goto LABEL_29;
      }
      if ((objc_msgSend(v22, "BOOLValue") & 1) == 0)
      {
        -[SUCoreConnectServer logger](self, "logger");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "oslog");
        v27 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v32;
          v38 = v4;
          v39 = 2112;
          v40 = v19;
          v28 = "[EntitlementValidation](%{public}@)(%@) New connection's value for entitlement is false";
          goto LABEL_29;
        }
LABEL_30:

        goto LABEL_31;
      }

    }
    v16 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    v23 = 1;
    if (v16)
      continue;
    break;
  }
LABEL_32:

  return v23;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  BOOL v30;
  void *v31;
  void *v33;
  id v34;
  _QWORD block[4];
  id v36;
  SUCoreConnectServer *v37;
  _QWORD v38[6];
  _QWORD v39[6];
  _QWORD v40[5];
  id v41;
  uint8_t v42[4];
  id v43;
  __int128 buf;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48[5];

  v48[2] = *(id *)MEMORY[0x24BDAC8D0];
  v34 = a3;
  v6 = a4;
  -[SUCoreConnectServer logger](self, "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "oslog");
  v8 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_2067B0000, v8, OS_LOG_TYPE_DEFAULT, "[ListenerNewConnection](%{public}@) Attempting to connect with new connection", (uint8_t *)&buf, 0xCu);
  }

  -[SUCoreConnectServer connectionPolicy](self, "connectionPolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serverDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[SUCoreConnectServer connectionPolicy](self, "connectionPolicy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serverDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isConnectionAuthorized:", v6);

    if ((v14 & 1) == 0)
    {
      -[SUCoreConnectServer logger](self, "logger");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "oslog");
      v16 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[SUCoreConnectServer listener:shouldAcceptNewConnection:].cold.1();
LABEL_14:

      objc_msgSend(v6, "invalidate");
      v30 = 0;
      goto LABEL_15;
    }
  }
  else if (!-[SUCoreConnectServer isConnectionEntitled:](self, "isConnectionEntitled:", v6))
  {
    -[SUCoreConnectServer logger](self, "logger");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "oslog");
    v16 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SUCoreConnectServer listener:shouldAcceptNewConnection:].cold.2();
    goto LABEL_14;
  }
  -[SUCoreConnectServer connectionPolicy](self, "connectionPolicy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "connectionQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setQueue:", v18);

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v45 = 0x3042000000;
  v46 = __Block_byref_object_copy__0;
  v47 = __Block_byref_object_dispose__0;
  v48[0] = 0;
  objc_initWeak(v48, self);
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3042000000;
  v40[3] = __Block_byref_object_copy__0;
  v40[4] = __Block_byref_object_dispose__0;
  v41 = 0;
  objc_initWeak(&v41, v6);
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke;
  v39[3] = &unk_24BFDC198;
  v39[4] = &buf;
  v39[5] = v40;
  v33 = (void *)MEMORY[0x20BCFD0F8](v39);
  objc_msgSend(v6, "setInterruptionHandler:", v33);
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2;
  v38[3] = &unk_24BFDC198;
  v38[4] = &buf;
  v38[5] = v40;
  v19 = (void *)MEMORY[0x20BCFD0F8](v38);
  objc_msgSend(v6, "setInvalidationHandler:", v19);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254515B48);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545160A8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_connectProtocolFromClientSendServerMessage_proxyObject_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_connectProtocolFromClientSendServerMessage_proxyObject_withReply_, 1, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_connectProtocolFromClientSendServerMessage_proxyObject_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_connectProtocolFromClientSendServerMessage_proxyObject_withReply_, 1, 1);

  objc_msgSend(v20, "setInterface:forSelector:argumentIndex:ofReply:", v21, sel_connectProtocolFromClientSendServerMessage_proxyObject_withReply_, 1, 0);
  objc_msgSend(v6, "setExportedInterface:", v20);
  objc_msgSend(v6, "setExportedObject:", self);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254516540);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRemoteObjectInterface:", v26);
  objc_msgSend(v6, "resume");
  -[SUCoreConnectServer logger](self, "logger");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "oslog");
  v28 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v42 = 138543362;
    v43 = v6;
    _os_log_impl(&dword_2067B0000, v28, OS_LOG_TYPE_DEFAULT, "[ListenerNewConnection](%{public}@) Resumed connection, requesting clientID", v42, 0xCu);
  }

  -[SUCoreConnectServer connectionSendMessageQueue](self, "connectionSendMessageQueue");
  v29 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_83;
  block[3] = &unk_24BFDC150;
  v36 = v6;
  v37 = self;
  dispatch_async(v29, block);

  _Block_object_dispose(v40, 8);
  objc_destroyWeak(&v41);
  _Block_object_dispose(&buf, 8);
  objc_destroyWeak(v48);
  v30 = 1;
LABEL_15:

  return v30;
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v4 = v3;
  if (WeakRetained)
  {
    if (v3)
    {
      objc_msgSend(WeakRetained, "logger");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "oslog");
      v6 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v4;
        _os_log_impl(&dword_2067B0000, v6, OS_LOG_TYPE_DEFAULT, "[InterruptedHandler](%{public}@) Client connection interrupted, removing from connections list", buf, 0xCu);
      }

      objc_msgSend(WeakRetained, "connectionsAccessQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_11;
      v11[3] = &unk_24BFDC150;
      v12 = WeakRetained;
      v13 = v4;
      dispatch_async(v7, v11);

      v8 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "oslog");
      v8 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_cold_2();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_cold_1();
  }

}

uint64_t __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeConnection:", *(_QWORD *)(a1 + 40));
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v4 = v3;
  if (WeakRetained)
  {
    if (v3)
    {
      objc_msgSend(WeakRetained, "logger");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "oslog");
      v6 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v4;
        _os_log_impl(&dword_2067B0000, v6, OS_LOG_TYPE_DEFAULT, "[InvalidatedHandler](%{public}@) Client connection invalidated, removing from connections list", buf, 0xCu);
      }

      objc_msgSend(WeakRetained, "connectionsAccessQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_13;
      v11[3] = &unk_24BFDC150;
      v12 = WeakRetained;
      v13 = v4;
      dispatch_async(v7, v11);

      v8 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "oslog");
      v8 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2_cold_2();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2_cold_1();
  }

}

uint64_t __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeConnection:", *(_QWORD *)(a1 + 40));
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_83(int8x16_t *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  int8x16_t v5;
  int8x16_t v6;
  _QWORD v7[4];
  int8x16_t v8;
  _QWORD v9[4];
  int8x16_t v10;

  v2 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2_84;
  v9[3] = &unk_24BFDC1C0;
  v5 = a1[2];
  v10 = vextq_s8(v5, v5, 8uLL);
  objc_msgSend((id)v5.i64[0], "remoteObjectProxyWithErrorHandler:", v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_86;
  v7[3] = &unk_24BFDC210;
  v6 = a1[2];
  v4 = (id)v6.i64[0];
  v8 = vextq_s8(v6, v6, 8uLL);
  objc_msgSend(v3, "connectProtocolFromServerRequestClientID:", v7);

}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2_84(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2_84_cold_1(a1, (uint64_t)v3, v5);

  objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_86(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v14 = v6;
    v15 = 2114;
    v16 = v3;
    _os_log_impl(&dword_2067B0000, v5, OS_LOG_TYPE_DEFAULT, "[ListenerNewConnection](%{public}@) Completion successfully received for request of clientID: %{public}@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "connectionsAccessQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_87;
  block[3] = &unk_24BFDC1E8;
  v8 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = v8;
  v12 = v3;
  v9 = v3;
  dispatch_async(v7, block);

}

uint64_t __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_87(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setConnection:forClientID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)setupListenerAndResumeConnection
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SUCoreConnectServer_setupListenerAndResumeConnection__block_invoke;
  block[3] = &unk_24BFDC238;
  block[4] = self;
  if (setupListenerAndResumeConnection_onceToken != -1)
    dispatch_once(&setupListenerAndResumeConnection_onceToken, block);
}

void __55__SUCoreConnectServer_setupListenerAndResumeConnection__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "connectionPolicy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v4;
    _os_log_impl(&dword_2067B0000, v3, OS_LOG_TYPE_DEFAULT, "[ListenerStartup] Setting up listener, enabling transactions, and resuming connection using policy: %{public}@", (uint8_t *)&v13, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDD1998], "enableTransactions");
  v5 = objc_alloc(MEMORY[0x24BDD1998]);
  objc_msgSend(*(id *)(a1 + 32), "connectionPolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithMachServiceName:", v7);

  objc_msgSend(v8, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "connectionPolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "connectionQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setQueue:", v10);

  objc_msgSend(v8, "resume");
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "oslog");
  v12 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_2067B0000, v12, OS_LOG_TYPE_DEFAULT, "[ListenerStartup] Listener connection resumed, setup completed.", (uint8_t *)&v13, 2u);
  }

}

- (void)connectProtocolFromClientSendServerMessage:(id)a3
{
  -[SUCoreConnectServer connectProtocolFromClientSendServerMessage:proxyObject:withReply:](self, "connectProtocolFromClientSendServerMessage:proxyObject:withReply:", a3, 0, 0);
}

- (void)connectProtocolFromClientSendServerMessage:(id)a3 proxyObject:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  _QWORD v46[5];
  id v47;
  id v48;
  void (**v49)(id, _QWORD, void *);
  _OWORD v50[2];
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  const __CFString *v56;
  __int16 v57;
  const __CFString *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  -[SUCoreConnectServer logger](self, "logger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "oslog");
  v12 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("YES");
    if (v9)
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    *(_DWORD *)buf = 138543874;
    v54 = v8;
    v56 = v14;
    v55 = 2114;
    if (!v10)
      v13 = CFSTR("NO");
    v57 = 2114;
    v58 = v13;
    _os_log_impl(&dword_2067B0000, v12, OS_LOG_TYPE_DEFAULT, "[SendServerMessage] Received message: %{public}@ (proxyObject:%{public}@, reply:%{public}@)", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("*"));

  if (v17)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("[SendServerMessage](%@) Observer clients cannot send messages to server"), v15);
    objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "buildError:underlying:description:", 8906, 0, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreConnectServer _informObserversOfCompletionReplyWithMessage:error:](self, "_informObserversOfCompletionReplyWithMessage:error:", v8, v20);
    -[SUCoreConnectServer logger](self, "logger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "oslog");
    v22 = objc_claimAutoreleasedReturnValue();

    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      if (v23)
        goto LABEL_17;
      goto LABEL_18;
    }
    if (v23)
      -[SUCoreConnectServer connectProtocolFromClientSendServerMessage:proxyObject:withReply:].cold.1();
    goto LABEL_32;
  }
  -[SUCoreConnectServer connectionPolicy](self, "connectionPolicy");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "serverDelegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_opt_respondsToSelector();

  if ((v26 & 1) == 0)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("[SendServerMessage](%@) handleMessage selector is not implemented by server delegate"), v15);
    objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "buildError:underlying:description:", 8113, 0, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreConnectServer _informObserversOfCompletionReplyWithMessage:error:](self, "_informObserversOfCompletionReplyWithMessage:error:", v8, v20);
    -[SUCoreConnectServer logger](self, "logger");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "oslog");
    v22 = objc_claimAutoreleasedReturnValue();

    v29 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      if (v29)
LABEL_17:
        -[SUCoreConnectServer connectProtocolFromClientSendServerMessage:proxyObject:withReply:].cold.2();
LABEL_18:

      v10[2](v10, 0, v20);
LABEL_33:

      goto LABEL_39;
    }
    if (v29)
      -[SUCoreConnectServer connectProtocolFromClientSendServerMessage:proxyObject:withReply:].cold.3();
LABEL_32:

    goto LABEL_33;
  }
  if (v15)
  {
    objc_msgSend(v15, "auditToken");
  }
  else
  {
    v51 = 0u;
    v52 = 0u;
  }
  v50[0] = v51;
  v50[1] = v52;
  objc_msgSend(v8, "setClientConnectionAuditToken:", v50);
  -[SUCoreConnectServer connectionPolicy](self, "connectionPolicy");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "serverDelegate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_opt_respondsToSelector();

  if ((v32 & 1) != 0)
  {
    -[SUCoreConnectServer logger](self, "logger");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "oslog");
    v34 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v54 = v15;
      _os_log_impl(&dword_2067B0000, v34, OS_LOG_TYPE_DEFAULT, "[SendServerMessage](%{public}@) connectProtocolFromClientSendServerMessage using isConnection:authorizedForMessage: via server delegate", buf, 0xCu);
    }

    -[SUCoreConnectServer connectionPolicy](self, "connectionPolicy");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "serverDelegate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "isConnection:authorizedForMessage:", v15, v8);

    if ((v37 & 1) == 0)
    {
      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("[SendServerMessage](%@) client is not entitled for specific message request"), v15);
      objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "buildError:underlying:description:", 8113, 0, v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      -[SUCoreConnectServer _informObserversOfCompletionReplyWithMessage:error:](self, "_informObserversOfCompletionReplyWithMessage:error:", v8, v40);
      -[SUCoreConnectServer logger](self, "logger");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "oslog");
      v42 = objc_claimAutoreleasedReturnValue();

      v43 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
      if (v10)
      {
        if (v43)
          -[SUCoreConnectServer connectProtocolFromClientSendServerMessage:proxyObject:withReply:].cold.2();

        v10[2](v10, 0, v40);
      }
      else
      {
        if (v43)
          -[SUCoreConnectServer connectProtocolFromClientSendServerMessage:proxyObject:withReply:].cold.3();

      }
    }
  }
  -[SUCoreConnectServer connectionPolicy](self, "connectionPolicy");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "serverDelegate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = __88__SUCoreConnectServer_connectProtocolFromClientSendServerMessage_proxyObject_withReply___block_invoke;
  v46[3] = &unk_24BFDC260;
  v46[4] = self;
  v47 = v8;
  v49 = v10;
  v48 = v15;
  objc_msgSend(v45, "handleMessage:proxyObject:reply:", v47, v9, v46);

LABEL_39:
}

void __88__SUCoreConnectServer_connectProtocolFromClientSendServerMessage_proxyObject_withReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_informObserversOfCompletionReplyWithMessage:error:", *(_QWORD *)(a1 + 40), v6);
  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
  {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v6, "checkedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v10;
      v14 = 2114;
      v15 = v5;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_2067B0000, v9, OS_LOG_TYPE_DEFAULT, "[SendServerMessage](%{public}@) connectProtocolFromClientSendServerMessage was not provided a reply block, response:%{public}@ error:%{public}@", (uint8_t *)&v12, 0x20u);

    }
  }

}

- (void)_informObserversOfCompletionReplyWithMessage:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  SUCoreConnectServer *v14;

  v6 = a3;
  v7 = a4;
  -[SUCoreConnectServer connectionsAccessQueue](self, "connectionsAccessQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__SUCoreConnectServer__informObserversOfCompletionReplyWithMessage_error___block_invoke;
  block[3] = &unk_24BFDC1E8;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __74__SUCoreConnectServer__informObserversOfCompletionReplyWithMessage_error___block_invoke(uint64_t a1)
{
  id v2;
  SUCoreConnectMessage *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  SUCoreConnectMessage *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id obj;
  _QWORD block[6];
  SUCoreConnectMessage *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v2, "setSafeObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("SUCoreConnectMonitorReplyMessage"));
  objc_msgSend(v2, "setSafeObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("SUCoreConnectMonitorReplyError"));
  v3 = [SUCoreConnectMessage alloc];
  v4 = objc_msgSend(*(id *)(a1 + 32), "messageType");
  objc_msgSend(*(id *)(a1 + 32), "messageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "clientID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SUCoreConnectMessage initWithType:messageName:clientID:version:message:](v3, "initWithType:messageName:clientID:version:message:", v4, v5, v6, v7, v2);

  objc_msgSend(*(id *)(a1 + 48), "_getAllObserverConnections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && objc_msgSend(v9, "count"))
  {
    v20 = v10;
    v21 = v2;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = v10;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 48), "logger", v20, v21);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "oslog");
          v17 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v30 = v15;
            _os_log_impl(&dword_2067B0000, v17, OS_LOG_TYPE_DEFAULT, "[InformObserversOfReplyCompletion] Attempting to send message (no reply expected) to observer client with connection %{public}@", buf, 0xCu);
          }

          objc_msgSend(*(id *)(a1 + 48), "connectionSendMessageQueue");
          v18 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __74__SUCoreConnectServer__informObserversOfCompletionReplyWithMessage_error___block_invoke_107;
          block[3] = &unk_24BFDC1E8;
          v19 = *(_QWORD *)(a1 + 48);
          block[4] = v15;
          block[5] = v19;
          v24 = v8;
          dispatch_async(v18, block);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v12);
    }

    v10 = v20;
    v2 = v21;
  }

}

void __74__SUCoreConnectServer__informObserversOfCompletionReplyWithMessage_error___block_invoke_107(int8x16_t *a1)
{
  int8x16_t v2;
  void *v3;
  _QWORD v4[4];
  int8x16_t v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __74__SUCoreConnectServer__informObserversOfCompletionReplyWithMessage_error___block_invoke_2;
  v4[3] = &unk_24BFDC1C0;
  v2 = a1[2];
  v5 = vextq_s8(v2, v2, 8uLL);
  objc_msgSend((id)v2.i64[0], "remoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connectProtocolFromServerSendClientMessage:", a1[3].i64[0]);

}

void __74__SUCoreConnectServer__informObserversOfCompletionReplyWithMessage_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "checkedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_2067B0000, v5, OS_LOG_TYPE_DEFAULT, "[InformObserversOfReplyCompletion] ErrorHandler: Connection failed (no completion was expected to be called) for observer client connection %{public}@ with error %{public}@", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "invalidate");

}

- (void)connectServerSendClientMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SUCoreConnectServer connectionsAccessQueue](self, "connectionsAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke;
  v7[3] = &unk_24BFDC150;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id *v37;
  NSObject *obj;
  id obja;
  _QWORD v40[6];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD block[6];
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  uint64_t v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v54 = v4;
    _os_log_impl(&dword_2067B0000, v3, OS_LOG_TYPE_DEFAULT, "[SendClientMessage] Method called to send message: %{public}@", buf, 0xCu);
  }

  v37 = (id *)(a1 + 40);
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "clientID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_connectionsForClientID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = v7;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    if (v8)
    {
      v9 = v8;
      v35 = v7;
      v10 = *(_QWORD *)v49;
      v11 = MEMORY[0x24BDAC760];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v49 != v10)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "logger");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "oslog");
          v15 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*v37, "clientID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v54 = v16;
            v55 = 2114;
            v56 = v13;
            _os_log_impl(&dword_2067B0000, v15, OS_LOG_TYPE_DEFAULT, "[SendClientMessage] Attempting to send message (no reply expected) to client %{public}@ with connection %{public}@", buf, 0x16u);

          }
          objc_msgSend(*(id *)(a1 + 32), "connectionSendMessageQueue");
          v17 = objc_claimAutoreleasedReturnValue();
          block[0] = v11;
          block[1] = 3221225472;
          block[2] = __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_108;
          block[3] = &unk_24BFDC1E8;
          v18 = *(_QWORD *)(a1 + 32);
          v19 = *(void **)(a1 + 40);
          block[4] = v13;
          block[5] = v18;
          v47 = v19;
          dispatch_async(v17, block);

        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      }
      while (v9);
      v7 = v35;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "oslog");
    v21 = objc_claimAutoreleasedReturnValue();

    obj = v21;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_cold_1(v37, v21);
  }

  objc_msgSend(*(id *)(a1 + 32), "_getAllObserverConnections");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22 && objc_msgSend(v22, "count"))
  {
    v36 = v7;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    obja = v23;
    v24 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v43;
      v27 = MEMORY[0x24BDAC760];
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v43 != v26)
            objc_enumerationMutation(obja);
          v29 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
          objc_msgSend(*(id *)(a1 + 32), "logger");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "oslog");
          v31 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v54 = v29;
            _os_log_impl(&dword_2067B0000, v31, OS_LOG_TYPE_DEFAULT, "[SendClientMessage] Attempting to send message (no reply expected) to observer client with connection %{public}@", buf, 0xCu);
          }

          objc_msgSend(*(id *)(a1 + 32), "connectionSendMessageQueue");
          v32 = objc_claimAutoreleasedReturnValue();
          v40[0] = v27;
          v40[1] = 3221225472;
          v40[2] = __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_109;
          v40[3] = &unk_24BFDC1E8;
          v33 = *(_QWORD *)(a1 + 32);
          v34 = *(void **)(a1 + 40);
          v40[4] = v29;
          v40[5] = v33;
          v41 = v34;
          dispatch_async(v32, v40);

        }
        v25 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
      }
      while (v25);
    }

    v7 = v36;
  }

}

void __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_108(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_2;
  v6[3] = &unk_24BFDC288;
  v2 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connectProtocolFromServerSendClientMessage:", *(_QWORD *)(a1 + 48));

}

void __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_2_cold_1(a1, v3, v5);

  objc_msgSend(*(id *)(a1 + 48), "invalidate");
}

void __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_109(int8x16_t *a1)
{
  int8x16_t v2;
  void *v3;
  _QWORD v4[4];
  int8x16_t v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_2_110;
  v4[3] = &unk_24BFDC1C0;
  v2 = a1[2];
  v5 = vextq_s8(v2, v2, 8uLL);
  objc_msgSend((id)v2.i64[0], "remoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connectProtocolFromServerSendClientMessage:", a1[3].i64[0]);

}

void __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_2_110(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_2_110_cold_1(a1, v3);

  objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

- (id)_getAllObserverConnections
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[SUCoreConnectServer connectionsAccessQueue](self, "connectionsAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreConnectServer logger](self, "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreConnectServer observerConnections](self, "observerConnections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 134217984;
    v9 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_2067B0000, v5, OS_LOG_TYPE_DEFAULT, "[GetAllObserverConnections] Returning %lu observable connections", (uint8_t *)&v8, 0xCu);

  }
  -[SUCoreConnectServer observerConnections](self, "observerConnections");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setConnection:(id)a3 forClientID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  uint64_t v22;
  int v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  _BYTE v34[12];
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SUCoreConnectServer connectionsAccessQueue](self, "connectionsAccessQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[SUCoreConnectServer logger](self, "logger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "oslog");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v34 = 138543618;
    *(_QWORD *)&v34[4] = v7;
    v35 = 2114;
    v36 = v6;
    _os_log_impl(&dword_2067B0000, v10, OS_LOG_TYPE_DEFAULT, "[SetConnection] Attempting to set new clientID: %{public}@, for connection: %{public}@", v34, 0x16u);
  }

  if (v6)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("*")))
    {
      -[SUCoreConnectServer logger](self, "logger");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "oslog");
      v12 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v34 = 138543362;
        *(_QWORD *)&v34[4] = v6;
        _os_log_impl(&dword_2067B0000, v12, OS_LOG_TYPE_DEFAULT, "[SetConnection] Adding new observable connection: %{public}@", v34, 0xCu);
      }

      *(_QWORD *)v34 = 0;
      objc_initWeak((id *)v34, v6);
      -[SUCoreConnectServer observerConnections](self, "observerConnections");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)v34);
      objc_msgSend(v13, "addObject:", WeakRetained);

      objc_destroyWeak((id *)v34);
    }
    else
    {
      -[SUCoreConnectServer connections](self, "connections");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "safeObjectForKey:ofClass:", v7, objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[SUCoreConnectServer logger](self, "logger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "oslog");
      v20 = objc_claimAutoreleasedReturnValue();

      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v21)
        {
          v22 = objc_msgSend(v18, "count");
          *(_DWORD *)v34 = 134218242;
          *(_QWORD *)&v34[4] = v22;
          v35 = 2114;
          v36 = v7;
          _os_log_impl(&dword_2067B0000, v20, OS_LOG_TYPE_DEFAULT, "[SetConnection] Found %lu existing connections for clientID: %{public}@", v34, 0x16u);
        }

        v23 = objc_msgSend(v18, "containsObject:", v6);
        -[SUCoreConnectServer logger](self, "logger");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "oslog");
        v25 = objc_claimAutoreleasedReturnValue();

        v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
        if (v23)
        {
          if (v26)
          {
            *(_DWORD *)v34 = 138543362;
            *(_QWORD *)&v34[4] = v7;
            _os_log_impl(&dword_2067B0000, v25, OS_LOG_TYPE_DEFAULT, "[SetConnection] Same connection already exists for clientID: %{public}@", v34, 0xCu);
          }

        }
        else
        {
          if (v26)
          {
            *(_DWORD *)v34 = 138543618;
            *(_QWORD *)&v34[4] = v7;
            v35 = 2114;
            v36 = v6;
            _os_log_impl(&dword_2067B0000, v25, OS_LOG_TYPE_DEFAULT, "[SetConnection] Setting new connection (to existing set) for clientID: %{public}@, newConnection: %{public}@", v34, 0x16u);
          }

          *(_QWORD *)v34 = 0;
          objc_initWeak((id *)v34, v6);
          -[SUCoreConnectServer connections](self, "connections");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_loadWeakRetained((id *)v34);
          objc_msgSend(v18, "setByAddingObject:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setSafeObject:forKey:", v33, v7);

          objc_destroyWeak((id *)v34);
        }
      }
      else
      {
        if (v21)
        {
          *(_DWORD *)v34 = 138543618;
          *(_QWORD *)&v34[4] = v7;
          v35 = 2114;
          v36 = v6;
          _os_log_impl(&dword_2067B0000, v20, OS_LOG_TYPE_DEFAULT, "[SetConnection] Setting new connection (to new set) for clientID: %{public}@, newConnection: %{public}@", v34, 0x16u);
        }

        *(_QWORD *)v34 = 0;
        objc_initWeak((id *)v34, v6);
        -[SUCoreConnectServer connections](self, "connections");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)MEMORY[0x24BDBCF20];
        v29 = objc_loadWeakRetained((id *)v34);
        objc_msgSend(v28, "setWithObject:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setSafeObject:forKey:", v30, v7);

        objc_destroyWeak((id *)v34);
      }

    }
  }
  else
  {
    -[SUCoreConnectServer logger](self, "logger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "oslog");
    v16 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SUCoreConnectServer _setConnection:forClientID:].cold.1();

  }
}

- (void)_removeConnection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  NSObject *v30;
  _QWORD v31[5];
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  NSObject *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUCoreConnectServer connectionsAccessQueue](self, "connectionsAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreConnectServer logger](self, "logger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oslog");
  v7 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreConnectServer connections](self, "connections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v34 = objc_msgSend(v8, "count");
    v35 = 2114;
    v36 = v4;
    _os_log_impl(&dword_2067B0000, v7, OS_LOG_TYPE_DEFAULT, "[RemoveConnection] From %lu clientIDs currently connected, attempting to remove connection: %{public}@", buf, 0x16u);

  }
  if (v4)
  {
    -[SUCoreConnectServer observerConnections](self, "observerConnections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v4);

    if (v10)
    {
      -[SUCoreConnectServer logger](self, "logger");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "oslog");
      v12 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v34 = (uint64_t)v4;
        _os_log_impl(&dword_2067B0000, v12, OS_LOG_TYPE_DEFAULT, "[RemoveConnection] Removing observable connection: %{public}@", buf, 0xCu);
      }

      -[SUCoreConnectServer observerConnections](self, "observerConnections");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObject:", v4);

      LOBYTE(v10) = 1;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  -[SUCoreConnectServer _clientIDForConnection:](self, "_clientIDForConnection:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[SUCoreConnectServer logger](self, "logger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "oslog");
    v16 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v34 = (uint64_t)v14;
      v35 = 2114;
      v36 = v4;
      _os_log_impl(&dword_2067B0000, v16, OS_LOG_TYPE_DEFAULT, "[RemoveConnection] Removing connection for clientID: %{public}@, connection: %{public}@", buf, 0x16u);
    }

    -[SUCoreConnectServer connections](self, "connections");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "safeObjectForKey:ofClass:", v14, objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "mutableCopy");

    if (-[NSObject containsObject:](v19, "containsObject:", v4))
      -[NSObject removeObject:](v19, "removeObject:", v4);
    v20 = -[NSObject count](v19, "count");
    -[SUCoreConnectServer logger](self, "logger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "oslog");
    v22 = objc_claimAutoreleasedReturnValue();

    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (v23)
      {
        v24 = -[NSObject count](v19, "count");
        *(_DWORD *)buf = 134218498;
        v34 = v24;
        v35 = 2114;
        v36 = v14;
        v37 = 2114;
        v38 = v19;
        _os_log_impl(&dword_2067B0000, v22, OS_LOG_TYPE_DEFAULT, "[RemoveConnection] Set remaining %lu connections for clientID: %{public}@, connections: %{public}@", buf, 0x20u);
      }

      -[SUCoreConnectServer connections](self, "connections");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setSafeObject:forKey:", v19, v14);
    }
    else
    {
      if (v23)
      {
        *(_DWORD *)buf = 138543362;
        v34 = (uint64_t)v14;
        _os_log_impl(&dword_2067B0000, v22, OS_LOG_TYPE_DEFAULT, "[RemoveConnection] No remaining connections for clientID: %{public}@", buf, 0xCu);
      }

      -[SUCoreConnectServer connections](self, "connections");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeObjectForKey:", v14);
    }

  }
  else
  {
    if ((v10 & 1) != 0)
      goto LABEL_26;
    -[SUCoreConnectServer logger](self, "logger");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v34 = (uint64_t)v4;
      _os_log_impl(&dword_2067B0000, v19, OS_LOG_TYPE_DEFAULT, "[RemoveConnection] Unable to locate the clientID for connection: %{public}@", buf, 0xCu);
    }
  }

LABEL_26:
  -[SUCoreConnectServer connectionPolicy](self, "connectionPolicy");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "serverDelegate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_opt_respondsToSelector();

  if ((v29 & 1) != 0)
  {
    -[SUCoreConnectServer connectionSendMessageQueue](self, "connectionSendMessageQueue");
    v30 = objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __41__SUCoreConnectServer__removeConnection___block_invoke;
    v31[3] = &unk_24BFDC150;
    v31[4] = self;
    v32 = v14;
    dispatch_async(v30, v31);

  }
}

void __41__SUCoreConnectServer__removeConnection___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_2067B0000, v3, OS_LOG_TYPE_DEFAULT, "[RemoveConnection] Informing server of connection disconnect for clientID: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "connectionPolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectionClosedForClientID:", *(_QWORD *)(a1 + 40));

}

- (id)_connectionsForClientID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUCoreConnectServer connectionsAccessQueue](self, "connectionsAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreConnectServer connections](self, "connections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeObjectForKey:ofClass:", v4, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreConnectServer logger](self, "logger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "oslog");
  v9 = objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreConnectServer connections](self, "connections");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 134218754;
      v13 = objc_msgSend(v10, "count");
      v14 = 2048;
      v15 = objc_msgSend(v7, "count");
      v16 = 2114;
      v17 = v4;
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_2067B0000, v9, OS_LOG_TYPE_DEFAULT, "[ConnectionForClientID] From %lu clientIDs, %lu connections located for clientID: %{public}@, connections: %{public}@", (uint8_t *)&v12, 0x2Au);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[SUCoreConnectServer _connectionsForClientID:].cold.1(self);
  }

  return v7;
}

- (id)_clientIDForConnection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id obj;
  SUCoreConnectServer *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUCoreConnectServer connectionsAccessQueue](self, "connectionsAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v26 = self;
  -[SUCoreConnectServer connections](self, "connections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v32;
    obj = v6;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        -[SUCoreConnectServer connections](v26, "connections", obj);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "safeObjectForKey:ofClass:", v12, objc_opt_class());
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v28;
          while (2)
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v28 != v18)
                objc_enumerationMutation(v15);
              if (objc_msgSend(v4, "isEqual:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j)))
              {
                v20 = v12;

                v9 = v20;
                goto LABEL_16;
              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
            if (v17)
              continue;
            break;
          }
        }
LABEL_16:

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v8);

    if (v9)
    {
      -[SUCoreConnectServer logger](v26, "logger");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "oslog");
      v22 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v36 = v9;
        v37 = 2114;
        v38 = v4;
        _os_log_impl(&dword_2067B0000, v22, OS_LOG_TYPE_DEFAULT, "[ClientIDForConnection] Located clientID: %{public}@, for connection: %{public}@", buf, 0x16u);
      }
      goto LABEL_25;
    }
  }
  else
  {

  }
  -[SUCoreConnectServer logger](v26, "logger");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "oslog");
  v22 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[SUCoreConnectServer _clientIDForConnection:].cold.1();
  v9 = 0;
LABEL_25:

  return v9;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[SUCoreConnectServer connectionPolicy](self, "connectionPolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SUCoreConnectServer(connectionPolicy:%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (SUCoreConnectServerPolicy)connectionPolicy
{
  return self->_connectionPolicy;
}

- (SUCoreLog)logger
{
  return self->_logger;
}

- (OS_dispatch_queue)connectionsAccessQueue
{
  return self->_connectionsAccessQueue;
}

- (NSMutableDictionary)connections
{
  return self->_connections;
}

- (NSMutableSet)observerConnections
{
  return self->_observerConnections;
}

- (OS_dispatch_queue)connectionSendMessageQueue
{
  return self->_connectionSendMessageQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionSendMessageQueue, 0);
  objc_storeStrong((id *)&self->_observerConnections, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionsAccessQueue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_connectionPolicy, 0);
}

- (void)isConnectionEntitled:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_2067B0000, v0, v1, "[EntitlementValidation](%{public}@) No connection policy provided, unable to determine what entitlements are required for new connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)isConnectionEntitled:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_2067B0000, v0, v1, "[EntitlementValidation](%{public}@) Policy did not define entitlements; unable to determine entitlements and one is "
    "always required for new connection",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_6();
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_2067B0000, v0, v1, "[ListenerNewConnection](%{public}@) Rejecting connection - client is not entitled correctly per server delegate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)listener:shouldAcceptNewConnection:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_2067B0000, v0, v1, "[ListenerNewConnection](%{public}@) Rejecting connection - client is not entitled correctly", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_5(&dword_2067B0000, v0, v1, "[InterruptedHandler] Server connection interrupted to XPC client, found no retained server object available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_5(&dword_2067B0000, v0, v1, "[InterruptedHandler] Server connection interrupted to XPC client, found no retained connection object available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_5(&dword_2067B0000, v0, v1, "[InvalidatedHandler] Server connection invalidated to XPC client, found no retained server object available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_5(&dword_2067B0000, v0, v1, "[InvalidatedHandler] Server connection invalidated to XPC client, found no retained connection object available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2_84_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  OUTLINED_FUNCTION_2(&dword_2067B0000, a3, (uint64_t)a3, "[ListenerNewConnection](%{public}@) ErrorHandler: Failed to receive clientID when requested for new connection, error: %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_6();
}

- (void)connectProtocolFromClientSendServerMessage:proxyObject:withReply:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_12();
  v3 = v0;
  OUTLINED_FUNCTION_2(&dword_2067B0000, v1, (uint64_t)v1, "[SendServerMessage](%{public}@) Observer clients cannot send messages to server, error: %{public}@", v2);
  OUTLINED_FUNCTION_6();
}

- (void)connectProtocolFromClientSendServerMessage:proxyObject:withReply:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_10();
  objc_msgSend((id)OUTLINED_FUNCTION_9(v0, v1), "checkedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2067B0000, v3, v4, "[SendServerMessage](%{public}@) Calling completion block with error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

- (void)connectProtocolFromClientSendServerMessage:proxyObject:withReply:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_10();
  objc_msgSend((id)OUTLINED_FUNCTION_9(v0, v1), "checkedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2067B0000, v3, v4, "[SendServerMessage](%{public}@) connectProtocolFromClientSendServerMessage was not provided a reply block, error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "clientID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_2067B0000, a2, OS_LOG_TYPE_ERROR, "[SendClientMessage] Unable to send message, no connection could be located for clientID: %{public}@", v4, 0xCu);

}

void __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_2_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 40), "clientID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(a2, "checkedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543874;
  v10 = v6;
  v11 = 2114;
  v12 = v7;
  v13 = 2114;
  v14 = v8;
  _os_log_error_impl(&dword_2067B0000, a3, OS_LOG_TYPE_ERROR, "[SendClientMessage] ErrorHandler: Connection failed (no completion was expected to be called) for client with clientID: %{public}@ %{public}@ with error %{public}@", (uint8_t *)&v9, 0x20u);

}

void __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_2_110_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "checkedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_2067B0000, v2, v3, "[SendClientMessage] ErrorHandler: Connection failed (no completion was expected to be called) for observer client connection %{public}@ with error %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)_setConnection:forClientID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_5(&dword_2067B0000, v0, v1, "[SetConnection] New connection to add is nil, aborting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_connectionsForClientID:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "connections");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "count");
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0(&dword_2067B0000, v2, v3, "[ConnectionForClientID] From %lu current clientIDs, no connection was located for clientID: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)_clientIDForConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_2067B0000, v0, v1, "[ClientIDForConnection] No clientID located for connection: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
