@implementation WiFiP2PDNSServiceDiscoveryManager

- (id)initUsingWiFiAware:(BOOL)a3 serviceCallback:(id)a4
{
  id v6;
  WiFiP2PDNSServiceDiscoveryManager *v7;
  WiFiP2PDNSServiceDiscoveryManager *v8;
  uint64_t v9;
  id serviceCallback;
  NSMutableArray *v11;
  NSMutableArray *registeredServices;
  WiFiP2PXPCConnection *v13;
  uint64_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  uint64_t v17;
  WiFiP2PXPCConnection *xpcConnection;
  objc_super v20;

  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)WiFiP2PDNSServiceDiscoveryManager;
  v7 = -[WiFiP2PDNSServiceDiscoveryManager init](&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_useWiFiAware = a3;
    v9 = MEMORY[0x1BCCAF184](v6);
    serviceCallback = v8->_serviceCallback;
    v8->_serviceCallback = (id)v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    registeredServices = v8->_registeredServices;
    v8->_registeredServices = v11;

    v13 = [WiFiP2PXPCConnection alloc];
    if (v8->_useWiFiAware)
      v14 = 1;
    else
      v14 = 2;
    +[WiFiP2PXPCConnection wifiPeerToPeerWorkloop](WiFiP2PXPCConnection, "wifiPeerToPeerWorkloop");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create_with_target_V2("com.apple.wifip2p.WiFiP2PDNSServiceDiscoveryManager", 0, v15);
    v17 = -[WiFiP2PXPCConnection initWithEndpointType:queue:retryTimeout:](v13, "initWithEndpointType:queue:retryTimeout:", v14, v16, +[WiFiP2PXPCConnection defaultRetryTimeout](WiFiP2PXPCConnection, "defaultRetryTimeout"));
    xpcConnection = v8->_xpcConnection;
    v8->_xpcConnection = (WiFiP2PXPCConnection *)v17;

    -[WiFiP2PXPCConnection setDelegate:](v8->_xpcConnection, "setDelegate:", v8);
  }

  return v8;
}

- (id)remoteObjectInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1A4F20);
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1A2E58);
}

- (void)startConnectionUsingProxy:(id)a3 completionHandler:(id)a4
{
  uint64_t v5;

  if (self->_useWiFiAware)
    v5 = 3;
  else
    v5 = 2;
  objc_msgSend(a3, "createXPCResponderWithType:completionHandler:", v5, a4);
}

- (void)handleConnectionEstablishedWithProxy:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_registeredServices;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "startServiceDiscoveryWithConfiguration:completionHandler:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), &__block_literal_global_6, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)handleEventType:(unint64_t)a3 keyData:(id)a4 valueData:(id)a5
{
  id v8;
  id v9;

  v9 = a4;
  v8 = a5;
  if (a3 <= 3)
    (*((void (**)(void))self->_serviceCallback + 2))();

}

- (void)startServiceDiscoveryWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  WiFiP2PXPCConnection *xpcConnection;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;
  _QWORD *v18;
  _QWORD v19[3];
  char v20;

  v6 = a3;
  v7 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  v8 = MEMORY[0x1E0C809B0];
  xpcConnection = self->_xpcConnection;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __94__WiFiP2PDNSServiceDiscoveryManager_startServiceDiscoveryWithConfiguration_completionHandler___block_invoke;
  v16[3] = &unk_1E6E1EB68;
  v16[4] = self;
  v17 = v6;
  v18 = v19;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __94__WiFiP2PDNSServiceDiscoveryManager_startServiceDiscoveryWithConfiguration_completionHandler___block_invoke_2;
  v12[3] = &unk_1E6E1EB90;
  v15 = v19;
  v12[4] = self;
  v10 = v17;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  -[WiFiP2PXPCConnection withRemoteObjectProxy:clientCompletionHandler:](xpcConnection, "withRemoteObjectProxy:clientCompletionHandler:", v16, v12);

  _Block_object_dispose(v19, 8);
}

void __94__WiFiP2PDNSServiceDiscoveryManager_startServiceDiscoveryWithConfiguration_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v5 = a1[5];
  v6 = *(void **)(a1[4] + 24);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "addObject:", v5);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  objc_msgSend(v8, "startServiceDiscoveryWithConfiguration:completionHandler:", a1[5], v7);

}

uint64_t __94__WiFiP2PDNSServiceDiscoveryManager_startServiceDiscoveryWithConfiguration_completionHandler___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    objc_msgSend(*(id *)(a1[4] + 24), "addObject:", a1[5]);
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)startServiceDiscoveryWithConfiguration:(id)a3
{
  -[WiFiP2PDNSServiceDiscoveryManager startServiceDiscoveryWithConfiguration:completionHandler:](self, "startServiceDiscoveryWithConfiguration:completionHandler:", a3, 0);
}

- (void)stopServiceDiscoveryWithConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  WiFiP2PXPCConnection *xpcConnection;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  _QWORD v14[3];
  char v15;

  v4 = a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  v5 = MEMORY[0x1E0C809B0];
  xpcConnection = self->_xpcConnection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__WiFiP2PDNSServiceDiscoveryManager_stopServiceDiscoveryWithConfiguration___block_invoke;
  v11[3] = &unk_1E6E1EB68;
  v11[4] = self;
  v12 = v4;
  v13 = v14;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __75__WiFiP2PDNSServiceDiscoveryManager_stopServiceDiscoveryWithConfiguration___block_invoke_2;
  v8[3] = &unk_1E6E1EBB8;
  v10 = v14;
  v8[4] = self;
  v7 = v12;
  v9 = v7;
  -[WiFiP2PXPCConnection withRemoteObjectProxy:clientCompletionHandler:](xpcConnection, "withRemoteObjectProxy:clientCompletionHandler:", v11, v8);

  _Block_object_dispose(v14, 8);
}

void __75__WiFiP2PDNSServiceDiscoveryManager_stopServiceDiscoveryWithConfiguration___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v5 = a1[5];
  v6 = *(void **)(a1[4] + 24);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "removeObject:", v5);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  objc_msgSend(v8, "stopServiceDiscoveryWithConfiguration:completionHandler:", a1[5], v7);

}

uint64_t __75__WiFiP2PDNSServiceDiscoveryManager_stopServiceDiscoveryWithConfiguration___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    objc_msgSend(*(id *)(a1[4] + 24), "removeObject:", a1[5]);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  result = objc_msgSend(*(id *)(a1[4] + 24), "count");
  if (!result)
    return objc_msgSend(*(id *)(a1[4] + 32), "stop");
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_registeredServices, 0);
  objc_storeStrong(&self->_serviceCallback, 0);
}

@end
