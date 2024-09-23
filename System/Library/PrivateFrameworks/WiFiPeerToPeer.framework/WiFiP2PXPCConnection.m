@implementation WiFiP2PXPCConnection

uint64_t __70__WiFiP2PXPCConnection_withRemoteObjectProxy_clientCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __70__WiFiP2PXPCConnection_withRemoteObjectProxy_clientCompletionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  id *v5;
  uint64_t v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *);
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[5])
  {
    v3 = (void *)v2[4];
    v4 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __70__WiFiP2PXPCConnection_withRemoteObjectProxy_clientCompletionHandler___block_invoke_2;
    v19[3] = &unk_1E6E1E878;
    v5 = &v20;
    v6 = *(_QWORD *)(a1 + 40);
    v20 = *(id *)(a1 + 48);
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v4;
    v17[1] = 3221225472;
    v17[2] = __70__WiFiP2PXPCConnection_withRemoteObjectProxy_clientCompletionHandler___block_invoke_3;
    v17[3] = &unk_1E6E1E510;
    v8 = &v18;
    v18 = *(id *)(a1 + 48);
    (*(void (**)(uint64_t, void *, _QWORD *))(v6 + 16))(v6, v7, v17);
  }
  else
  {
    objc_msgSend(v2, "attemptConnection");
    v9 = *(void **)(a1 + 40);
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __70__WiFiP2PXPCConnection_withRemoteObjectProxy_clientCompletionHandler___block_invoke_4;
    v14 = &unk_1E6E1E8A0;
    v5 = &v15;
    v15 = v9;
    v8 = &v16;
    v16 = *(id *)(a1 + 48);
    v7 = (void *)MEMORY[0x1BCCAF184](&v11);
    objc_msgSend(v10, "addObject:", v7, v11, v12, v13, v14);
  }

}

- (void)withRemoteObjectProxy:(id)a3 clientCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__WiFiP2PXPCConnection_withRemoteObjectProxy_clientCompletionHandler___block_invoke;
  block[3] = &unk_1E6E1E8C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

+ (BOOL)supportsWiFiP2P
{
  if (qword_1ED2303B0 != -1)
    dispatch_once(&qword_1ED2303B0, &__block_literal_global_3);
  return _MergedGlobals_0;
}

void __39__WiFiP2PXPCConnection_supportsWiFiP2P__block_invoke()
{
  __SecTask *v0;
  __SecTask *v1;
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  CFTypeID v4;
  BOOL v5;
  int v6;
  BOOL v7;
  pid_t v8;
  const char *v9;
  int v10;
  uint8_t buf[4];
  const char *v12;
  _DWORD buffer[10];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    v1 = v0;
    v2 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v0, CFSTR("com.apple.wifip2pd"), 0);
    if (v2)
    {
      v3 = v2;
      v4 = CFGetTypeID(v2);
      v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) != 0;
      CFRelease(v3);
    }
    else
    {
      v5 = 0;
    }
    CFRelease(v1);
  }
  else
  {
    v5 = 0;
  }
  getpid();
  v6 = sandbox_check();
  if (v6 < 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v10 = *__error();
      buffer[0] = 67109120;
      buffer[1] = v10;
      _os_log_error_impl(&dword_1B8247000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to check sandbox profile: %{errno}d", (uint8_t *)buffer, 8u);
    }
    v7 = 0;
  }
  else
  {
    v7 = v6 == 0;
  }
  v8 = getpid();
  v9 = (const char *)buffer;
  if (proc_name(v8, buffer, 0x20u) <= 0)
    v9 = "unknown";
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136446210;
    v12 = v9;
    _os_log_fault_impl(&dword_1B8247000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Process %{public}s is missing entitlement required for peer to peer Wi-Fi access: <key>com.apple.wifip2pd</key><true/>", buf, 0xCu);
    if (v7)
      goto LABEL_22;
  }
  else if (v7)
  {
    goto LABEL_22;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136446210;
    v12 = v9;
    _os_log_fault_impl(&dword_1B8247000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Process %{public}s is missing sandbox rule for peer to peer Wi-Fi access: (allow mach-lookup (global-name \"com.apple.wifip2pd\"))", buf, 0xCu);
  }
LABEL_22:
  _MergedGlobals_0 = v5 && v7;
}

+ (id)endpointForEndpointType:(unint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  pid_t v8;
  int v9;
  __CFString *v10;
  id v11;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _BYTE buffer[32];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (+[WiFiP2PXPCConnection supportsWiFiP2P](WiFiP2PXPCConnection, "supportsWiFiP2P"))
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy_;
    v19 = __Block_byref_object_dispose_;
    v20 = 0;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.wifip2pd"), 4096);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1A4DA0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRemoteObjectInterface:", v5);

    v6 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __48__WiFiP2PXPCConnection_endpointForEndpointType___block_invoke;
    v14[3] = &unk_1E6E1E6E8;
    v14[4] = &v15;
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activate");
    v8 = getpid();
    v9 = proc_name(v8, buffer, 0x20u);
    if (v9 < 1)
    {
      v10 = &stru_1E6E1F318;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buffer);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __48__WiFiP2PXPCConnection_endpointForEndpointType___block_invoke_2;
    v13[3] = &unk_1E6E1E710;
    v13[4] = &v15;
    objc_msgSend(v7, "endpointForType:processName:completionHandler:", a3, v10, v13);
    if (v9 >= 1)

    objc_msgSend(v4, "invalidate");
    v11 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

void __48__WiFiP2PXPCConnection_endpointForEndpointType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

void __48__WiFiP2PXPCConnection_endpointForEndpointType___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (id)directQueryOnEndpointType:(unint64_t)a3 exportedObject:(id)a4 withExportedInterface:(id)a5 error:(id *)a6 querying:(id)a7
{
  id v11;
  id v12;
  void (**v13)(id, uint64_t, _QWORD *);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v23[5];
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t, _QWORD *))a7;
  +[WiFiP2PXPCConnection endpointForEndpointType:](WiFiP2PXPCConnection, "endpointForEndpointType:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v14);
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setExportedInterface:", v16);

    }
    objc_msgSend(v15, "setExportedObject:", v11);
    +[WiFiP2PXPCConnection wifip2pRemoteXPCInterface](WiFiP2PXPCConnection, "wifip2pRemoteXPCInterface");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRemoteObjectInterface:", v17);

    objc_msgSend(v15, "activate");
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy_;
    v35 = __Block_byref_object_dispose_;
    v36 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy_;
    v29 = __Block_byref_object_dispose_;
    v30 = 0;
    v18 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __102__WiFiP2PXPCConnection_directQueryOnEndpointType_exportedObject_withExportedInterface_error_querying___block_invoke;
    v24[3] = &unk_1E6E1E738;
    v24[4] = &v25;
    v24[5] = &v31;
    objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", v24);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v15 && v19)
    {
      v23[0] = v18;
      v23[1] = 3221225472;
      v23[2] = __102__WiFiP2PXPCConnection_directQueryOnEndpointType_exportedObject_withExportedInterface_error_querying___block_invoke_2;
      v23[3] = &unk_1E6E1E760;
      v23[4] = &v31;
      v13[2](v13, v19, v23);
      if (a6)
        *a6 = objc_retainAutorelease((id)v26[5]);
      objc_msgSend(v15, "invalidate");
    }
    else
    {
      objc_msgSend(v15, "invalidate");
      if (a6 && !*a6)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 102, 0);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    v21 = (id)v32[5];

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v31, 8);

  }
  else if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 57, 0);
    v21 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

void __102__WiFiP2PXPCConnection_directQueryOnEndpointType_exportedObject_withExportedInterface_error_querying___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v6 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

void __102__WiFiP2PXPCConnection_directQueryOnEndpointType_exportedObject_withExportedInterface_error_querying___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (id)directQueryOnEndpointType:(unint64_t)a3 error:(id *)a4 querying:(id)a5
{
  return +[WiFiP2PXPCConnection directQueryOnEndpointType:exportedObject:withExportedInterface:error:querying:](WiFiP2PXPCConnection, "directQueryOnEndpointType:exportedObject:withExportedInterface:error:querying:", a3, 0, 0, a4, a5);
}

+ (BOOL)directRequestOnEndpointType:(unint64_t)a3 error:(id *)a4 requesting:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;

  v7 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__WiFiP2PXPCConnection_directRequestOnEndpointType_error_requesting___block_invoke;
  v13[3] = &unk_1E6E1E788;
  v8 = v7;
  v14 = v8;
  +[WiFiP2PXPCConnection directQueryOnEndpointType:error:querying:](WiFiP2PXPCConnection, "directQueryOnEndpointType:error:querying:", a3, a4, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "integerValue");
    if (!a4)
      goto LABEL_7;
  }
  else
  {
    v11 = 7;
    if (!a4)
      goto LABEL_7;
  }
  if (!*a4)
  {
    +[WiFiP2PXPCConnection convertError:](WiFiP2PXPCConnection, "convertError:", v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_7:

  return v11 == 0;
}

void __69__WiFiP2PXPCConnection_directRequestOnEndpointType_error_requesting___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, _QWORD *);
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__WiFiP2PXPCConnection_directRequestOnEndpointType_error_requesting___block_invoke_2;
  v9[3] = &unk_1E6E1E510;
  v10 = v5;
  v7 = *(void (**)(uint64_t, uint64_t, _QWORD *))(v6 + 16);
  v8 = v5;
  v7(v6, a2, v9);

}

void __69__WiFiP2PXPCConnection_directRequestOnEndpointType_error_requesting___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (WiFiP2PXPCConnection)initWithEndpointType:(unint64_t)a3 queue:(id)a4 retryTimeout:(int64_t)a5
{
  id v9;
  WiFiP2PXPCConnection *v10;
  WiFiP2PXPCConnection *v11;
  NSXPCConnection *connection;
  id remoteObject;
  OS_dispatch_source *retryTimer;
  uint64_t v15;
  NSMutableArray *queuedRequests;
  objc_super v18;

  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WiFiP2PXPCConnection;
  v10 = -[WiFiP2PXPCConnection init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_endpointType = a3;
    v10->_retryTimeout = a5;
    objc_storeStrong((id *)&v10->_queue, a4);
    connection = v11->_connection;
    v11->_connection = 0;

    remoteObject = v11->_remoteObject;
    v11->_remoteObject = 0;

    retryTimer = v11->_retryTimer;
    v11->_retryTimer = 0;

    v11->_notifyToken = -1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    queuedRequests = v11->_queuedRequests;
    v11->_queuedRequests = (NSMutableArray *)v15;

  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[WiFiP2PXPCConnection stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)WiFiP2PXPCConnection;
  -[WiFiP2PXPCConnection dealloc](&v3, sel_dealloc);
}

- (void)attemptConnection
{
  void *v3;
  void *v4;
  id remoteObject;
  NSXPCConnection *v6;
  NSXPCConnection *connection;
  NSXPCConnection *v8;
  void *v9;
  NSXPCConnection *v10;
  void *v11;
  NSXPCConnection *v12;
  void *v13;
  void *v14;
  NSXPCConnection *v15;
  uint64_t v16;
  NSXPCConnection *v17;
  NSXPCConnection *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_connection)
  {
    -[WiFiP2PXPCConnection delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      if (self->_retryTimeout < 0 || (objc_opt_respondsToSelector() & 1) == 0)
        -[WiFiP2PXPCConnection reconnectOnAvailableNotification](self, "reconnectOnAvailableNotification");
      +[WiFiP2PXPCConnection endpointForEndpointType:](WiFiP2PXPCConnection, "endpointForEndpointType:", self->_endpointType);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        remoteObject = self->_remoteObject;
        self->_remoteObject = 0;

        v6 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v4);
        connection = self->_connection;
        self->_connection = v6;

        -[NSXPCConnection _setQueue:](self->_connection, "_setQueue:", self->_queue);
        v8 = self->_connection;
        +[WiFiP2PXPCConnection wifip2pRemoteXPCInterface](WiFiP2PXPCConnection, "wifip2pRemoteXPCInterface");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSXPCConnection setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v9);

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v10 = self->_connection;
          objc_msgSend(v3, "exportedInterface");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSXPCConnection setExportedInterface:](v10, "setExportedInterface:", v11);

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v12 = self->_connection;
          objc_msgSend(v3, "exportedObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[WiFiP2PXPCConnection weakExportedObjectProxy:](WiFiP2PXPCConnection, "weakExportedObjectProxy:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSXPCConnection setExportedObject:](v12, "setExportedObject:", v14);

        }
        objc_initWeak(&location, self);
        v15 = self->_connection;
        v16 = MEMORY[0x1E0C809B0];
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __41__WiFiP2PXPCConnection_attemptConnection__block_invoke;
        v26[3] = &unk_1E6E1E7B0;
        objc_copyWeak(&v27, &location);
        -[NSXPCConnection setInvalidationHandler:](v15, "setInvalidationHandler:", v26);
        v17 = self->_connection;
        v24[0] = v16;
        v24[1] = 3221225472;
        v24[2] = __41__WiFiP2PXPCConnection_attemptConnection__block_invoke_2;
        v24[3] = &unk_1E6E1E7B0;
        objc_copyWeak(&v25, &location);
        -[NSXPCConnection setInterruptionHandler:](v17, "setInterruptionHandler:", v24);
        v18 = self->_connection;
        v22[0] = v16;
        v22[1] = 3221225472;
        v22[2] = __41__WiFiP2PXPCConnection_attemptConnection__block_invoke_3;
        v22[3] = &unk_1E6E1E7D8;
        objc_copyWeak(&v23, &location);
        -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v18, "remoteObjectProxyWithErrorHandler:", v22);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = v16;
        v20[1] = 3221225472;
        v20[2] = __41__WiFiP2PXPCConnection_attemptConnection__block_invoke_4;
        v20[3] = &unk_1E6E1E800;
        objc_copyWeak(&v21, &location);
        objc_msgSend(v3, "startConnectionUsingProxy:completionHandler:", v19, v20);

        -[NSXPCConnection activate](self->_connection, "activate");
        objc_destroyWeak(&v21);
        objc_destroyWeak(&v23);
        objc_destroyWeak(&v25);
        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
      }
      else
      {
        -[WiFiP2PXPCConnection handleError:](self, "handleError:", 1);
      }

    }
  }
}

void __41__WiFiP2PXPCConnection_attemptConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleConnectionInvalidated");

}

void __41__WiFiP2PXPCConnection_attemptConnection__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[4], "setInvalidationHandler:", 0);
    objc_msgSend(v2[4], "invalidate");
    objc_msgSend(v2, "handleConnectionInvalidated");
    WeakRetained = v2;
  }

}

void __41__WiFiP2PXPCConnection_attemptConnection__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleError:", 1);

}

void __41__WiFiP2PXPCConnection_attemptConnection__block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleError:", a2);

}

- (void)withRemoteObjectProxy:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__WiFiP2PXPCConnection_withRemoteObjectProxy___block_invoke;
  v7[3] = &unk_1E6E1E850;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __46__WiFiP2PXPCConnection_withRemoteObjectProxy___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[5])
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(v2, "attemptConnection");
    v3 = *(void **)(a1 + 40);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__WiFiP2PXPCConnection_withRemoteObjectProxy___block_invoke_2;
    v6[3] = &unk_1E6E1E828;
    v7 = v3;
    v5 = (void *)MEMORY[0x1BCCAF184](v6);
    objc_msgSend(v4, "addObject:", v5);

  }
}

void __46__WiFiP2PXPCConnection_withRemoteObjectProxy___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v5;
  _QWORD *v6;

  v5 = a3;
  if (!a2 && v5[5])
  {
    v6 = v5;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v5 = v6;
  }

}

uint64_t __70__WiFiP2PXPCConnection_withRemoteObjectProxy_clientCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void __70__WiFiP2PXPCConnection_withRemoteObjectProxy_clientCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  v6 = v5;
  if (a2 || (v8 = (void *)*((_QWORD *)v5 + 4)) == 0)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);
  }
  else
  {
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __70__WiFiP2PXPCConnection_withRemoteObjectProxy_clientCompletionHandler___block_invoke_5;
    v14[3] = &unk_1E6E1E878;
    v10 = *(_QWORD *)(a1 + 32);
    v15 = *(id *)(a1 + 40);
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __70__WiFiP2PXPCConnection_withRemoteObjectProxy_clientCompletionHandler___block_invoke_6;
    v12[3] = &unk_1E6E1E510;
    v13 = *(id *)(a1 + 40);
    (*(void (**)(uint64_t, void *, _QWORD *))(v10 + 16))(v10, v11, v12);

  }
}

uint64_t __70__WiFiP2PXPCConnection_withRemoteObjectProxy_clientCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __70__WiFiP2PXPCConnection_withRemoteObjectProxy_clientCompletionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)withRemoteObjectProxy:(id)a3 clientErrorHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__WiFiP2PXPCConnection_withRemoteObjectProxy_clientErrorHandler___block_invoke;
  block[3] = &unk_1E6E1E8C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __65__WiFiP2PXPCConnection_withRemoteObjectProxy_clientErrorHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  id *v5;
  uint64_t v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *);
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[5])
  {
    v3 = (void *)v2[4];
    v4 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __65__WiFiP2PXPCConnection_withRemoteObjectProxy_clientErrorHandler___block_invoke_2;
    v19[3] = &unk_1E6E1E878;
    v5 = &v20;
    v6 = *(_QWORD *)(a1 + 40);
    v20 = *(id *)(a1 + 48);
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v4;
    v17[1] = 3221225472;
    v17[2] = __65__WiFiP2PXPCConnection_withRemoteObjectProxy_clientErrorHandler___block_invoke_3;
    v17[3] = &unk_1E6E1E878;
    v8 = &v18;
    v18 = *(id *)(a1 + 48);
    (*(void (**)(uint64_t, void *, _QWORD *))(v6 + 16))(v6, v7, v17);
  }
  else
  {
    objc_msgSend(v2, "attemptConnection");
    v9 = *(void **)(a1 + 40);
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __65__WiFiP2PXPCConnection_withRemoteObjectProxy_clientErrorHandler___block_invoke_4;
    v14 = &unk_1E6E1E8A0;
    v5 = &v15;
    v15 = v9;
    v8 = &v16;
    v16 = *(id *)(a1 + 48);
    v7 = (void *)MEMORY[0x1BCCAF184](&v11);
    objc_msgSend(v10, "addObject:", v7, v11, v12, v13, v14);
  }

}

uint64_t __65__WiFiP2PXPCConnection_withRemoteObjectProxy_clientErrorHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __65__WiFiP2PXPCConnection_withRemoteObjectProxy_clientErrorHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __65__WiFiP2PXPCConnection_withRemoteObjectProxy_clientErrorHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a3;
  v6 = v5;
  if (a2 || (v9 = (void *)*((_QWORD *)v5 + 4)) == 0)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      +[WiFiP2PXPCConnection convertError:](WiFiP2PXPCConnection, "convertError:", a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    }
  }
  else
  {
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __65__WiFiP2PXPCConnection_withRemoteObjectProxy_clientErrorHandler___block_invoke_5;
    v15[3] = &unk_1E6E1E878;
    v11 = *(_QWORD *)(a1 + 32);
    v16 = *(id *)(a1 + 40);
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __65__WiFiP2PXPCConnection_withRemoteObjectProxy_clientErrorHandler___block_invoke_6;
    v13[3] = &unk_1E6E1E878;
    v14 = *(id *)(a1 + 40);
    (*(void (**)(uint64_t, void *, _QWORD *))(v11 + 16))(v11, v12, v13);

  }
}

uint64_t __65__WiFiP2PXPCConnection_withRemoteObjectProxy_clientErrorHandler___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __65__WiFiP2PXPCConnection_withRemoteObjectProxy_clientErrorHandler___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__WiFiP2PXPCConnection_start__block_invoke;
  block[3] = &unk_1E6E1E8F0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __29__WiFiP2PXPCConnection_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "attemptConnection");
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__WiFiP2PXPCConnection_invalidate__block_invoke;
  block[3] = &unk_1E6E1E8F0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __34__WiFiP2PXPCConnection_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stop");
}

- (void)stop
{
  -[WiFiP2PXPCConnection cleanUpRemovingNotifyToken:](self, "cleanUpRemovingNotifyToken:", 1);
}

- (void)cleanUpRemovingNotifyToken:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableArray *v5;
  NSMutableArray *v6;
  NSMutableArray *queuedRequests;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSXPCConnection *connection;
  id remoteObject;
  int notifyToken;
  NSObject *retryTimer;
  OS_dispatch_source *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v5 = self->_queuedRequests;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  queuedRequests = self->_queuedRequests;
  self->_queuedRequests = v6;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12) + 16))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", 0, (_QWORD)v18);
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  remoteObject = self->_remoteObject;
  self->_remoteObject = 0;

  notifyToken = self->_notifyToken;
  if ((notifyToken & 0x80000000) == 0 && v3)
  {
    notify_cancel(notifyToken);
    self->_notifyToken = -1;
  }
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    dispatch_source_cancel(retryTimer);
    v17 = self->_retryTimer;
    self->_retryTimer = 0;

  }
}

- (void)handleError:(int64_t)a3
{
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSMutableArray *queuedRequests;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  NSXPCConnection *connection;
  void *v16;
  void *v17;
  id remoteObject;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[WiFiP2PXPCConnection delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_queuedRequests;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  queuedRequests = self->_queuedRequests;
  self->_queuedRequests = v7;

  if (a3)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = v6;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v13) + 16))(*(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v13));
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v11);
    }

    v14 = objc_opt_respondsToSelector();
    if ((v14 & 1) != 0)
      objc_msgSend(v5, "handleError:", a3, (_QWORD)v24);
    -[WiFiP2PXPCConnection cleanUpRemovingNotifyToken:](self, "cleanUpRemovingNotifyToken:", v14 & 1, (_QWORD)v24);
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      connection = self->_connection;
      objc_msgSend(v5, "remoteObjectInterface");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](connection, "setRemoteObjectInterface:", v16);

    }
    -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    remoteObject = self->_remoteObject;
    self->_remoteObject = v17;

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "handleConnectionEstablishedWithProxy:", self->_remoteObject);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v19 = v6;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v29;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(v19);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v23++) + 16))();
        }
        while (v21 != v23);
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v21);
    }

  }
}

- (void)handleConnectionInvalidated
{
  NSXPCConnection *connection;
  id remoteObject;
  int64_t retryTimeout;
  NSObject *retryTimer;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_time_t v12;
  _QWORD v13[4];
  id v14;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  connection = self->_connection;
  self->_connection = 0;

  remoteObject = self->_remoteObject;
  self->_remoteObject = 0;

  objc_initWeak(&location, self);
  retryTimeout = self->_retryTimeout;
  if (retryTimeout)
  {
    if (retryTimeout >= 1)
    {
      retryTimer = self->_retryTimer;
      if (retryTimer)
      {
        dispatch_source_cancel(retryTimer);
        v7 = self->_retryTimer;
        self->_retryTimer = 0;

      }
      v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
      v9 = self->_retryTimer;
      self->_retryTimer = v8;

      v10 = self->_retryTimer;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __51__WiFiP2PXPCConnection_handleConnectionInvalidated__block_invoke;
      v13[3] = &unk_1E6E1E7B0;
      objc_copyWeak(&v14, &location);
      dispatch_source_set_event_handler(v10, v13);
      v11 = self->_retryTimer;
      v12 = dispatch_time(0, self->_retryTimeout);
      dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
      dispatch_activate((dispatch_object_t)self->_retryTimer);
      objc_destroyWeak(&v14);
    }
  }
  else
  {
    -[WiFiP2PXPCConnection attemptConnection](self, "attemptConnection");
  }
  objc_destroyWeak(&location);
}

void __51__WiFiP2PXPCConnection_handleConnectionInvalidated__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[7];
    WeakRetained[7] = 0;
    v3 = WeakRetained;

    objc_msgSend(v3, "attemptConnection");
    WeakRetained = v3;
  }

}

- (void)reconnectOnAvailableNotification
{
  int *p_notifyToken;
  const char *v4;
  NSObject *queue;
  _QWORD v6[4];
  id v7;
  id location;

  p_notifyToken = &self->_notifyToken;
  if (self->_notifyToken < 0)
  {
    objc_initWeak(&location, self);
    v4 = +[WiFiP2PXPCConnection wifiPeerToPeerAvailableNotification](WiFiP2PXPCConnection, "wifiPeerToPeerAvailableNotification");
    queue = self->_queue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__WiFiP2PXPCConnection_reconnectOnAvailableNotification__block_invoke;
    v6[3] = &unk_1E6E1E918;
    objc_copyWeak(&v7, &location);
    notify_register_dispatch(v4, p_notifyToken, queue, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __56__WiFiP2PXPCConnection_reconnectOnAvailableNotification__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "attemptConnection");

}

+ (const)wifiPeerToPeerAvailableNotification
{
  return (const char *)objc_msgSend(CFSTR("com.apple.wifip2pd.available"), "UTF8String");
}

+ (id)wifiPeerToPeerWorkloop
{
  if (qword_1ED2303B8 != -1)
    dispatch_once(&qword_1ED2303B8, &__block_literal_global_92);
  return (id)qword_1ED2303C0;
}

void __46__WiFiP2PXPCConnection_wifiPeerToPeerWorkloop__block_invoke()
{
  dispatch_workloop_t v0;
  void *v1;

  v0 = dispatch_workloop_create("com.apple.framework.WiFiPeerToPeer");
  v1 = (void *)qword_1ED2303C0;
  qword_1ED2303C0 = (uint64_t)v0;

}

+ (int64_t)defaultRetryTimeout
{
  return 1000000000;
}

+ (id)convertError:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v5 = 16;
  v6 = 0;
  switch(a3)
  {
    case 0:
      return v6;
    case 1:
      v5 = 57;
      goto LABEL_9;
    case 2:
      v5 = 22;
      goto LABEL_9;
    case 3:
      v5 = 2;
      goto LABEL_9;
    case 4:
      v5 = 12;
      goto LABEL_9;
    case 6:
      v5 = 1;
      goto LABEL_9;
    case 7:
      v5 = 35;
      goto LABEL_9;
    case 8:
      v5 = 45;
      goto LABEL_9;
    default:
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v5, 0, v3, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
  }
}

+ (id)frameworkBundle
{
  if (qword_1ED2303D0 != -1)
    dispatch_once(&qword_1ED2303D0, &__block_literal_global_94);
  return (id)qword_1ED2303C8;
}

void __39__WiFiP2PXPCConnection_frameworkBundle__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED2303C8;
  qword_1ED2303C8 = v0;

  if (!qword_1ED2303C8)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/WiFiPeerToPeer.framework"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)qword_1ED2303C8;
    qword_1ED2303C8 = v2;

  }
}

+ (id)localization
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB34D0];
  +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredLocalizationsFromArray:forPreferences:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0CB34D0];
    +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredLocalizationsFromArray:forPreferences:", v10, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localeIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v7;
}

+ (id)weakExportedObjectProxy:(id)a3
{
  id v3;
  WiFiP2PXPCExportedObjectProxy *v4;

  v3 = a3;
  v4 = objc_alloc_init(WiFiP2PXPCExportedObjectProxy);
  -[WiFiP2PXPCExportedObjectProxy setExportedObject:](v4, "setExportedObject:", v3);

  return v4;
}

+ (id)wifip2pRemoteXPCInterface
{
  if (qword_1ED2303D8 != -1)
    dispatch_once(&qword_1ED2303D8, &__block_literal_global_101);
  return (id)qword_1ED2303E0;
}

void __49__WiFiP2PXPCConnection_wifip2pRemoteXPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1A4E00);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED2303E0;
  qword_1ED2303E0 = v0;

  v2 = (void *)qword_1ED2303E0;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_updateAWDLLTERestrictedChannels_completionHandler_, 0, 0);

}

- (WiFiP2PXPCConnectionDelegate)delegate
{
  return (WiFiP2PXPCConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queuedRequests, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong(&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
