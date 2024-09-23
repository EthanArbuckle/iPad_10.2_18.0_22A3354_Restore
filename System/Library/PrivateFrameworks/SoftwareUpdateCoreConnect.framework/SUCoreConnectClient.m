@implementation SUCoreConnectClient

- (SUCoreConnectClient)initWithClientPolicy:(id)a3
{
  id v5;
  SUCoreConnectClient *v6;
  SUCoreConnectClient *v7;
  uint64_t v8;
  SUCoreLog *logger;
  const char *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *clientConnectionStateAccessQueue;
  const char *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *clientDelegateCallbackQueue;
  const char *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *clientCompletionQueue;
  const char *v22;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *clientMessageQueue;
  const char *v26;
  NSObject *v27;
  dispatch_queue_t v28;
  OS_dispatch_queue *clientReplyCompletionQueue;
  objc_super v31;

  v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SUCoreConnectClient;
  v6 = -[SUCoreConnectClient init](&v31, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_policy, a3);
    +[SUCoreConnectClient _sharedClientLogger](SUCoreConnectClient, "_sharedClientLogger");
    v8 = objc_claimAutoreleasedReturnValue();
    logger = v7->_logger;
    v7->_logger = (SUCoreLog *)v8;

    v10 = (const char *)objc_msgSend(CFSTR("com.apple.SUCoreConnect.ClientConnectionStateAccessQueue"), "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create(v10, v11);
    clientConnectionStateAccessQueue = v7->_clientConnectionStateAccessQueue;
    v7->_clientConnectionStateAccessQueue = (OS_dispatch_queue *)v12;

    v14 = (const char *)objc_msgSend(CFSTR("com.apple.SUCoreConnect.ClientDelegateCallbackQueue"), "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create(v14, v15);
    clientDelegateCallbackQueue = v7->_clientDelegateCallbackQueue;
    v7->_clientDelegateCallbackQueue = (OS_dispatch_queue *)v16;

    v18 = (const char *)objc_msgSend(CFSTR("com.apple.SUCoreConnect.ClientCompletionQueue"), "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create(v18, v19);
    clientCompletionQueue = v7->_clientCompletionQueue;
    v7->_clientCompletionQueue = (OS_dispatch_queue *)v20;

    v22 = (const char *)objc_msgSend(CFSTR("com.apple.SUCoreConnect.ClientMessageQueue"), "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = dispatch_queue_create(v22, v23);
    clientMessageQueue = v7->_clientMessageQueue;
    v7->_clientMessageQueue = (OS_dispatch_queue *)v24;

    v26 = (const char *)objc_msgSend(CFSTR("com.apple.SUCoreConnect.ClientReplyCompletionQueue"), "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = dispatch_queue_create(v26, v27);
    clientReplyCompletionQueue = v7->_clientReplyCompletionQueue;
    v7->_clientReplyCompletionQueue = (OS_dispatch_queue *)v28;

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[SUCoreConnectClient serverConnection](self, "serverConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SUCoreConnectClient logger](self, "logger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "oslog");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreConnectClient policy](self, "policy");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "serviceName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreConnectClient serverConnection](self, "serverConnection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v7;
      v15 = 2114;
      v16 = v8;
      _os_log_impl(&dword_2067B0000, v5, OS_LOG_TYPE_DEFAULT, "[InvalidateConnection](%{public}@) Invalidating the persistent server connection %{public}@", buf, 0x16u);

    }
    -[SUCoreConnectClient serverConnection](self, "serverConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setInvalidationHandler:", 0);

    -[SUCoreConnectClient serverConnection](self, "serverConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setInterruptionHandler:", 0);

    -[SUCoreConnectClient serverConnection](self, "serverConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidate");

    -[SUCoreConnectClient setServerConnection:](self, "setServerConnection:", 0);
  }
  v12.receiver = self;
  v12.super_class = (Class)SUCoreConnectClient;
  -[SUCoreConnectClient dealloc](&v12, sel_dealloc);
}

+ (id)_sharedClientLogger
{
  if (_sharedClientLogger_oneClientLoggerToken != -1)
    dispatch_once(&_sharedClientLogger_oneClientLoggerToken, &__block_literal_global_1);
  return (id)_sharedClientLogger___sharedLogger;
}

void __42__SUCoreConnectClient__sharedClientLogger__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BEAEA70]), "initWithCategory:", CFSTR("CLIENT"));
  v1 = (void *)_sharedClientLogger___sharedLogger;
  _sharedClientLogger___sharedLogger = v0;

}

- (void)_invalidateConnection:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SUCoreConnectClient clientConnectionStateAccessQueue](self, "clientConnectionStateAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__SUCoreConnectClient__invalidateConnection___block_invoke;
  v7[3] = &unk_24BFDC150;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __45__SUCoreConnectClient__invalidateConnection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "policy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "usesPersistentXPCConnections") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "serverConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "logger");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "oslog");
      v5 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "policy");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "serviceName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(a1 + 40);
        v14 = 138543618;
        v15 = v7;
        v16 = 2114;
        v17 = v8;
        _os_log_impl(&dword_2067B0000, v5, OS_LOG_TYPE_DEFAULT, "[InvalidateConnection](%{public}@) Not invalidating server connection %{public}@ as client usesPersistentXPCConnections", (uint8_t *)&v14, 0x16u);

      }
      return;
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "oslog");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "policy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serviceName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    v14 = 138543618;
    v15 = v12;
    v16 = 2114;
    v17 = v13;
    _os_log_impl(&dword_2067B0000, v10, OS_LOG_TYPE_DEFAULT, "[InvalidateConnection](%{public}@) Invalidating the server connection %{public}@", (uint8_t *)&v14, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setInterruptionHandler:", 0);
  objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

- (void)_droppedConnection:(id)a3
{
  id v4;
  SUCoreConnectClient *v5;
  SUCoreConnectClient *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _QWORD block[4];
  NSObject *v11;
  id v12;
  NSObject *v13;

  v4 = a3;
  v5 = self;
  v6 = v5;
  if (v5)
  {
    -[SUCoreConnectClient clientConnectionStateAccessQueue](v5, "clientConnectionStateAccessQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__SUCoreConnectClient__droppedConnection___block_invoke;
    block[3] = &unk_24BFDC1E8;
    v11 = v6;
    v12 = v4;
    v13 = v11;
    dispatch_async(v7, block);

    v8 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SUCoreConnectClient _droppedConnection:].cold.1(v8);
  }

}

uint64_t __42__SUCoreConnectClient__droppedConnection___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "policy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  v5 = a1[4];
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v5, "clientDelegateCallbackQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __42__SUCoreConnectClient__droppedConnection___block_invoke_2;
    v13[3] = &unk_24BFDC150;
    v14 = a1[4];
    v15 = a1[5];
    dispatch_async(v6, v13);

    v7 = v14;
  }
  else
  {
    objc_msgSend(v5, "logger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1[4], "policy");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "serviceName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = a1[5];
      *(_DWORD *)buf = 138543618;
      v17 = v10;
      v18 = 2114;
      v19 = v11;
      _os_log_impl(&dword_2067B0000, v7, OS_LOG_TYPE_DEFAULT, "[ConnectionDropped](%{public}@) Client connection dropped from XPC server, no delegate callback provided for connection %{public}@", buf, 0x16u);

    }
  }

  objc_msgSend(a1[6], "setServerConnection:", 0);
  return objc_msgSend(a1[5], "invalidate");
}

void __42__SUCoreConnectClient__droppedConnection___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "policy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_2067B0000, v3, OS_LOG_TYPE_DEFAULT, "[ConnectionDropped](%{public}@) Client connection dropped to XPC server, calling connectionClosed delegate callback for connection %{public}@", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "policy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connectionClosed");

}

- (void)_internalConnectToServerWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SUCoreConnectClient clientConnectionStateAccessQueue](self, "clientConnectionStateAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__SUCoreConnectClient__internalConnectToServerWithCompletion___block_invoke;
  v7[3] = &unk_24BFDC2F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __62__SUCoreConnectClient__internalConnectToServerWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  dispatch_queue_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id *location;
  id *locationa;
  void *v50;
  _QWORD v51[4];
  id v52;
  _BYTE *v53;
  _QWORD v54[4];
  id v55;
  _BYTE *v56;
  uint8_t v57[4];
  void *v58;
  __int16 v59;
  id v60;
  _BYTE buf[24];
  void (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64[5];

  v64[2] = *(id *)MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "policy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "usesPersistentXPCConnections") & 1) == 0)
  {

    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "serverConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
LABEL_8:
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "policy");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "serviceName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v14;
      _os_log_impl(&dword_2067B0000, v12, OS_LOG_TYPE_DEFAULT, "[ConnectToServer](%{public}@) Attempting to connect to server", buf, 0xCu);

    }
    v15 = objc_alloc(MEMORY[0x24BDD1988]);
    objc_msgSend(*(id *)(a1 + 32), "policy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "serviceName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithMachServiceName:options:", v17, 0);

    v19 = (const char *)objc_msgSend(CFSTR("com.apple.SUCoreConnect.ServerConnectionQueue"), "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create(v19, v20);

    objc_msgSend(v18, "_setQueue:", v21);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254516540);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254515B48);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545160A8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3042000000;
    v62 = __Block_byref_object_copy__2;
    v63 = __Block_byref_object_dispose__2;
    v64[0] = 0;
    location = v64;
    objc_initWeak(v64, *(id *)(a1 + 32));
    v25 = MEMORY[0x24BDAC760];
    v54[0] = MEMORY[0x24BDAC760];
    v54[1] = 3221225472;
    v54[2] = __62__SUCoreConnectClient__internalConnectToServerWithCompletion___block_invoke_84;
    v54[3] = &unk_24BFDC128;
    v56 = buf;
    v26 = v18;
    v55 = v26;
    v50 = (void *)MEMORY[0x20BCFD0F8](v54);
    objc_msgSend(v26, "setInvalidationHandler:", v50);
    v51[0] = v25;
    v51[1] = 3221225472;
    v51[2] = __62__SUCoreConnectClient__internalConnectToServerWithCompletion___block_invoke_85;
    v51[3] = &unk_24BFDC128;
    v53 = buf;
    v10 = v26;
    v52 = v10;
    v27 = (void *)MEMORY[0x20BCFD0F8](v51);
    objc_msgSend(v10, "setInterruptionHandler:", v27);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v28, sel_connectProtocolFromServerSendClientMessage_reply_, 0, 0);

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_connectProtocolFromServerSendClientMessage_reply_, 0, 1);

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_connectProtocolFromServerSendClientMessage_reply_, 1, 1);

    objc_msgSend(*(id *)(a1 + 32), "policy");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "proxyObjectClasses");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(*(id *)(a1 + 32), "policy", v64);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "proxyObjectClasses");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v34, sel_executeGenericBlock_, 0, 0);

      objc_msgSend(*(id *)(a1 + 32), "policy");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "proxyObjectClasses");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v36, sel_executeGenericBlock_disableVerboseLogging_, 0, 0);

    }
    objc_msgSend(v23, "setInterface:forSelector:argumentIndex:ofReply:", v24, sel_connectProtocolFromClientSendServerMessage_proxyObject_withReply_, 1, 0, location);
    objc_msgSend(v10, "setExportedInterface:", v22);
    objc_msgSend(v10, "setRemoteObjectInterface:", v23);
    objc_msgSend(v10, "setExportedObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v10, "resume");
    objc_msgSend(*(id *)(a1 + 32), "policy");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "usesPersistentXPCConnections");

    if (v38)
    {
      objc_msgSend(*(id *)(a1 + 32), "logger");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "oslog");
      v40 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "policy");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "serviceName");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v57 = 138543362;
        v58 = v42;
        _os_log_impl(&dword_2067B0000, v40, OS_LOG_TYPE_DEFAULT, "[ConnectToServer](%{public}@) Client usesPersistentXPCConnections, assigning serverConnection", v57, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "setServerConnection:", v10);
    }
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "oslog");
    v44 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "policy");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "serviceName");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v57 = 138543618;
      v58 = v46;
      v59 = 2114;
      v60 = v10;
      _os_log_impl(&dword_2067B0000, v44, OS_LOG_TYPE_DEFAULT, "[ConnectToServer](%{public}@) Successfully connected to server with connection %{public}@", v57, 0x16u);

    }
    v47 = *(_QWORD *)(a1 + 40);
    if (v47)
      (*(void (**)(uint64_t, id))(v47 + 16))(v47, v10);

    _Block_object_dispose(buf, 8);
    objc_destroyWeak(locationa);

    goto LABEL_21;
  }
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "policy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serviceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "serverConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_2067B0000, v5, OS_LOG_TYPE_DEFAULT, "[ConnectToServer](%{public}@) Already connected to server, not reconnecting for client that usesPersistentXPCConnections for connection %{public}@", buf, 0x16u);

  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "serverConnection");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);
LABEL_21:

  }
}

void __62__SUCoreConnectClient__internalConnectToServerWithCompletion___block_invoke_84(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(WeakRetained, "policy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(v7, "policy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serviceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v6;
    v13 = 2114;
    v14 = v9;
    _os_log_impl(&dword_2067B0000, v3, OS_LOG_TYPE_DEFAULT, "[CLIENT-%{public}@][InvalidatedHandler](%{public}@) Connection invalidated", (uint8_t *)&v11, 0x16u);

  }
  v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(v10, "_droppedConnection:", *(_QWORD *)(a1 + 32));

}

void __62__SUCoreConnectClient__internalConnectToServerWithCompletion___block_invoke_85(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(WeakRetained, "policy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(v7, "policy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serviceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v6;
    v13 = 2114;
    v14 = v9;
    _os_log_impl(&dword_2067B0000, v3, OS_LOG_TYPE_DEFAULT, "[CLIENT-%{public}@][InterruptedHandler](%{public}@) Connection interrupted", (uint8_t *)&v11, 0x16u);

  }
  v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(v10, "_droppedConnection:", *(_QWORD *)(a1 + 32));

}

- (void)connectToServerWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__SUCoreConnectClient_connectToServerWithCompletion___block_invoke;
  v6[3] = &unk_24BFDC340;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SUCoreConnectClient _internalConnectToServerWithCompletion:](self, "_internalConnectToServerWithCompletion:", v6);

}

void __53__SUCoreConnectClient_connectToServerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "clientCompletionQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SUCoreConnectClient_connectToServerWithCompletion___block_invoke_2;
  block[3] = &unk_24BFDC318;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __53__SUCoreConnectClient_connectToServerWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection:", *(_QWORD *)(a1 + 40));
}

- (void)connectClientSendServerMessage:(id)a3
{
  -[SUCoreConnectClient connectClientSendServerMessage:proxyObject:withReply:](self, "connectClientSendServerMessage:proxyObject:withReply:", a3, 0, 0);
}

- (void)connectClientSendServerMessage:(id)a3 proxyObject:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  _QWORD block[4];
  id v36;
  NSObject *v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BEAEA30];
  objc_msgSend(v8, "clientID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreConnectClient policy](self, "policy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clientID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_msgSend(v11, "stringIsEqual:to:", v12, v14);

  if ((v11 & 1) != 0)
  {
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_101;
    v31[3] = &unk_24BFDC408;
    v31[4] = self;
    v34 = v10;
    v32 = v8;
    v33 = v9;
    -[SUCoreConnectClient _internalConnectToServerWithCompletion:](self, "_internalConnectToServerWithCompletion:", v31);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v8, "clientID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreConnectClient policy](self, "policy");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "clientID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("ClientID of message (%@) does not align with policy clientID (%@)"), v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "buildError:underlying:description:", 8907, 0, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEAEA50], "sharedDiag");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "description");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trackAnomaly:forReason:withResult:withError:", CFSTR("connectClientSendServerMessage"), v23, objc_msgSend(v21, "code"), v21);

    -[SUCoreConnectClient logger](self, "logger");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "oslog");
    v25 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[SUCoreConnectClient connectClientSendServerMessage:proxyObject:withReply:].cold.1(self, (uint64_t)v21, v25);

    if (v10)
    {
      -[SUCoreConnectClient clientCompletionQueue](self, "clientCompletionQueue");
      v26 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke;
      block[3] = &unk_24BFDC368;
      v37 = v10;
      v36 = v21;
      dispatch_async(v26, block);

      v27 = v37;
    }
    else
    {
      -[SUCoreConnectClient logger](self, "logger");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "oslog");
      v27 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        -[SUCoreConnectClient policy](self, "policy");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "serviceName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v39 = v30;
        _os_log_impl(&dword_2067B0000, v27, OS_LOG_TYPE_DEFAULT, "[SendServerMessage](%{public}@) Validation Error: No reply completion was provided", buf, 0xCu);

      }
    }

  }
}

uint64_t __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_101(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD block[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oslog");
  v6 = objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "policy");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "serviceName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v29 = v8;
      v30 = 2114;
      v31 = v9;
      v32 = 2114;
      v33 = v3;
      _os_log_impl(&dword_2067B0000, v6, OS_LOG_TYPE_DEFAULT, "[SendServerMessage](%{public}@) Connected to server and calling sendMessage %{public}@ for connection %{public}@", buf, 0x20u);

    }
    v10 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_105;
    v23[3] = &unk_24BFDC3B8;
    v23[4] = *(_QWORD *)(a1 + 32);
    v11 = v3;
    v24 = v11;
    v25 = *(id *)(a1 + 56);
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v10;
    v20[1] = 3221225472;
    v20[2] = __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_108;
    v20[3] = &unk_24BFDC3E0;
    v14 = *(_QWORD *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 48);
    v20[4] = *(_QWORD *)(a1 + 32);
    v21 = v11;
    v22 = *(id *)(a1 + 56);
    objc_msgSend(v12, "connectProtocolFromClientSendServerMessage:proxyObject:withReply:", v14, v13, v20);

    v15 = v24;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_101_cold_2((id *)(a1 + 32));

  v16 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(v16, "clientCompletionQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_102;
    block[3] = &unk_24BFDC390;
    v27 = *(id *)(a1 + 56);
    dispatch_async(v17, block);

    v15 = v27;
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(v16, "logger");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "oslog");
  v19 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_101_cold_1(v4);

LABEL_10:
}

void __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_102(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buildError:underlying:description:", 8909, 0, CFSTR("No server connection present to send client->server message"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v2);

}

void __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_105(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  NSObject *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "policy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "serviceName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v20 = v14;
    v21 = 2114;
    v22 = v3;
    v23 = 2114;
    v24 = v15;
    _os_log_error_impl(&dword_2067B0000, v5, OS_LOG_TYPE_ERROR, "[SendServerMessage](%{public}@) ErrorHandler: Calling provided reply completion on connection error %{public}@ for connection %{public}@", buf, 0x20u);

  }
  v6 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(v6, "clientCompletionQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_106;
    v16[3] = &unk_24BFDC368;
    v18 = *(id *)(a1 + 48);
    v17 = v3;
    dispatch_async(v7, v16);

    v8 = v18;
  }
  else
  {
    objc_msgSend(v6, "logger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "policy");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "serviceName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v20 = v11;
      v21 = 2114;
      v22 = v12;
      _os_log_impl(&dword_2067B0000, v8, OS_LOG_TYPE_DEFAULT, "[SendServerMessage](%{public}@) ErrorHandler: No reply completion was provided for connection %{public}@", buf, 0x16u);

    }
  }

  objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection:", *(_QWORD *)(a1 + 40));
}

uint64_t __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_106(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_108(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  _QWORD block[4];
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "oslog");
  v8 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "policy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serviceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    v40 = v10;
    v41 = 2114;
    v42 = v5;
    v43 = 2114;
    v44 = v6;
    v45 = 2114;
    v46 = v11;
    _os_log_impl(&dword_2067B0000, v8, OS_LOG_TYPE_DEFAULT, "[SendServerMessage](%{public}@) sendMessage response received from server with response %{public}@ error %{public}@ for connection %{public}@", buf, 0x2Au);

  }
  v12 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(v12, "clientCompletionQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_109;
    block[3] = &unk_24BFDC318;
    v38 = *(id *)(a1 + 48);
    v36 = v5;
    v37 = v6;
    dispatch_async(v13, block);

    v14 = v38;
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(v12, "policy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "clientDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "oslog");
  v19 = objc_claimAutoreleasedReturnValue();

  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if ((v17 & 1) != 0)
  {
    if (v20)
    {
      objc_msgSend(*(id *)(a1 + 32), "policy");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "serviceName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v40 = v22;
      v41 = 2114;
      v42 = v23;
      _os_log_impl(&dword_2067B0000, v19, OS_LOG_TYPE_DEFAULT, "[SendServerMessage](%{public}@) Calling reply delegate callback 'handleResponse:error:' for connection %{public}@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "clientDelegateCallbackQueue");
    v24 = objc_claimAutoreleasedReturnValue();
    v28 = MEMORY[0x24BDAC760];
    v29 = 3221225472;
    v30 = __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_112;
    v31 = &unk_24BFDC1E8;
    v32 = *(_QWORD *)(a1 + 32);
    v33 = v5;
    v34 = v6;
    dispatch_async(v24, &v28);

    v14 = v33;
    goto LABEL_9;
  }
  if (v20)
  {
    objc_msgSend(*(id *)(a1 + 32), "policy");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "serviceName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v40 = v26;
    v41 = 2114;
    v42 = v27;
    _os_log_impl(&dword_2067B0000, v19, OS_LOG_TYPE_DEFAULT, "[SendServerMessage](%{public}@) Client does not respond to the handleMessage:reply: delegate callback and no reply completion was provided for connection %{public}@", buf, 0x16u);

  }
LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection:", *(_QWORD *)(a1 + 40), v28, v29, v30, v31, v32);

}

uint64_t __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_109(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_112(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "policy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleResponse:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)forceCloseConnection
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[SUCoreConnectClient logger](self, "logger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "oslog");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreConnectClient policy](self, "policy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_2067B0000, v4, OS_LOG_TYPE_DEFAULT, "[ForceCloseConnection](%{public}@) Incoming client request to force close connection", (uint8_t *)&v7, 0xCu);

  }
}

- (void)connectProtocolFromServerRequestClientID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[SUCoreConnectClient clientReplyCompletionQueue](self, "clientReplyCompletionQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __64__SUCoreConnectClient_connectProtocolFromServerRequestClientID___block_invoke;
    v12[3] = &unk_24BFDC2F0;
    v12[4] = self;
    v13 = v4;
    dispatch_async(v5, v12);

  }
  else
  {
    -[SUCoreConnectClient logger](self, "logger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreConnectClient policy](self, "policy");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "serviceName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreConnectClient policy](self, "policy");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "clientID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v9;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_2067B0000, v7, OS_LOG_TYPE_DEFAULT, "[RequestClientID](%{public}@) Replying to server for clientID request: %{public}@, no reply block provided", buf, 0x16u);

    }
  }

}

void __64__SUCoreConnectClient_connectProtocolFromServerRequestClientID___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "policy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "policy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v5;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_2067B0000, v3, OS_LOG_TYPE_DEFAULT, "[RequestClientID](%{public}@) Replying to server for clientID request: %{public}@", (uint8_t *)&v11, 0x16u);

  }
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v10);

}

- (void)connectProtocolFromServerSendClientMessage:(id)a3
{
  -[SUCoreConnectClient connectProtocolFromServerSendClientMessage:reply:](self, "connectProtocolFromServerSendClientMessage:reply:", a3, 0);
}

- (void)connectProtocolFromServerSendClientMessage:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  NSObject *v28;
  _QWORD block[5];
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SUCoreConnectClient policy](self, "policy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[SUCoreConnectClient logger](self, "logger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreConnectClient policy](self, "policy");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "serviceName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v14;
      _os_log_impl(&dword_2067B0000, v12, OS_LOG_TYPE_DEFAULT, "[SendClientMessage](%{public}@) Calling client delegate method handleMessage", buf, 0xCu);

    }
    -[SUCoreConnectClient clientMessageQueue](self, "clientMessageQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__SUCoreConnectClient_connectProtocolFromServerSendClientMessage_reply___block_invoke;
    block[3] = &unk_24BFDC430;
    block[4] = self;
    v30 = v6;
    v31 = v7;
    dispatch_async(v15, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "buildError:underlying:description:", 8900, 0, CFSTR("Client does not respond to messages"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreConnectClient logger](self, "logger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v20)
      {
        -[SUCoreConnectClient policy](self, "policy");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "serviceName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v33 = v22;
        v34 = 2114;
        v35 = v6;
        v36 = 2114;
        v37 = v17;
        _os_log_impl(&dword_2067B0000, v19, OS_LOG_TYPE_DEFAULT, "[SendClientMessage](%{public}@) Client does not respond to handleMessage:%{public}@, error:%{public}@, calling reply block", buf, 0x20u);

      }
      -[SUCoreConnectClient clientReplyCompletionQueue](self, "clientReplyCompletionQueue");
      v23 = objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __72__SUCoreConnectClient_connectProtocolFromServerSendClientMessage_reply___block_invoke_118;
      v26[3] = &unk_24BFDC368;
      v28 = v7;
      v27 = v17;
      dispatch_async(v23, v26);

      v19 = v28;
    }
    else if (v20)
    {
      -[SUCoreConnectClient policy](self, "policy");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "serviceName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v25;
      v34 = 2114;
      v35 = v6;
      v36 = 2114;
      v37 = v17;
      _os_log_impl(&dword_2067B0000, v19, OS_LOG_TYPE_DEFAULT, "[SendClientMessage](%{public}@) Client does not respond to handleMessage:%{public}@, error: %{public}@, and no reply block provided", buf, 0x20u);

    }
  }

}

void __72__SUCoreConnectClient_connectProtocolFromServerSendClientMessage_reply___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "policy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleMessage:reply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __72__SUCoreConnectClient_connectProtocolFromServerSendClientMessage_reply___block_invoke_118(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
  objc_storeStrong((id *)&self->_serverConnection, a3);
}

- (SUCoreConnectClientPolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_policy, a3);
}

- (SUCoreLog)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (OS_dispatch_queue)clientConnectionStateAccessQueue
{
  return self->_clientConnectionStateAccessQueue;
}

- (OS_dispatch_queue)clientDelegateCallbackQueue
{
  return self->_clientDelegateCallbackQueue;
}

- (OS_dispatch_queue)clientCompletionQueue
{
  return self->_clientCompletionQueue;
}

- (OS_dispatch_queue)clientMessageQueue
{
  return self->_clientMessageQueue;
}

- (OS_dispatch_queue)clientReplyCompletionQueue
{
  return self->_clientReplyCompletionQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientReplyCompletionQueue, 0);
  objc_storeStrong((id *)&self->_clientMessageQueue, 0);
  objc_storeStrong((id *)&self->_clientCompletionQueue, 0);
  objc_storeStrong((id *)&self->_clientDelegateCallbackQueue, 0);
  objc_storeStrong((id *)&self->_clientConnectionStateAccessQueue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
}

- (void)_droppedConnection:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2067B0000, log, OS_LOG_TYPE_ERROR, "[ConnectionDropped] Client connection dropped to XPC server, found no retained client object available during cleanup", v1, 2u);
}

- (void)connectClientSendServerMessage:(void *)a1 proxyObject:(uint64_t)a2 withReply:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "policy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v6;
  v9 = 2114;
  v10 = a2;
  _os_log_error_impl(&dword_2067B0000, a3, OS_LOG_TYPE_ERROR, "[SendServerMessage](%{public}@) Validation Error: Calling provided reply completion with error %{public}@", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_1();
}

void __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_101_cold_1(id *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(*a1, "policy");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "serviceName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1(&dword_2067B0000, v3, v4, "[SendServerMessage](%{public}@) No reply completion provided", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1();
}

void __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_101_cold_2(id *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(*a1, "policy");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "serviceName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1(&dword_2067B0000, v3, v4, "[SendServerMessage](%{public}@) No server connection present to send client->server message", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1();
}

@end
