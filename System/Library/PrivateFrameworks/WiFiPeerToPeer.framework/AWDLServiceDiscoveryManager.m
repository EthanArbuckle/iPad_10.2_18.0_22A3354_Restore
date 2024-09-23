@implementation AWDLServiceDiscoveryManager

- (AWDLServiceDiscoveryManager)init
{
  AWDLServiceDiscoveryManager *v2;
  NSLock *v3;
  NSLock *lock;
  uint64_t v5;
  NSMutableArray *activeTrafficRegistrations;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AWDLServiceDiscoveryManager;
  v2 = -[AWDLServiceDiscoveryManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v2->_lock;
    v2->_lock = v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    activeTrafficRegistrations = v2->_activeTrafficRegistrations;
    v2->_activeTrafficRegistrations = (NSMutableArray *)v5;

    v2->_suspendCount = 0;
    v2->_notifyToken = -1;
  }
  return v2;
}

- (void)dealloc
{
  int notifyToken;
  objc_super v4;

  -[NSLock lock](self->_lock, "lock");
  -[AWDLServiceDiscoveryManager _destroyConnection](self, "_destroyConnection");
  notifyToken = self->_notifyToken;
  if (notifyToken != -1)
    notify_cancel(notifyToken);
  self->_notifyToken = -1;
  -[NSLock unlock](self->_lock, "unlock");
  v4.receiver = self;
  v4.super_class = (Class)AWDLServiceDiscoveryManager;
  -[AWDLServiceDiscoveryManager dealloc](&v4, sel_dealloc);
}

- (BOOL)_requiresConnection
{
  return -[NSMutableArray count](self->_activeTrafficRegistrations, "count") || self->_suspendCount > 0;
}

- (void)_destroyConnection
{
  NSXPCConnection *xpcConnection;

  -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", 0);
  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

}

- (void)_retryConnection
{
  uint64_t v3;
  _QWORD v4[5];

  if (-[AWDLServiceDiscoveryManager _requiresConnection](self, "_requiresConnection"))
  {
    if (!self->_xpcConnection)
    {
      v3 = MEMORY[0x1E0C809B0];
      self->_attemptedReconnect = 0;
      v4[0] = v3;
      v4[1] = 3221225472;
      v4[2] = __47__AWDLServiceDiscoveryManager__retryConnection__block_invoke;
      v4[3] = &unk_1E6E1EC20;
      v4[4] = self;
      -[AWDLServiceDiscoveryManager _usingAWDLDiscoveryManagerProxy:onSuccess:error:](self, "_usingAWDLDiscoveryManagerProxy:onSuccess:error:", v4, 0, 0);
    }
  }
}

void __47__AWDLServiceDiscoveryManager__retryConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "trafficRegistration:enabled:completionHandler:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 1, &__block_literal_global_86, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  if (*(uint64_t *)(*(_QWORD *)(a1 + 32) + 40) >= 1)
    objc_msgSend(v3, "setAWDLSuspendedState:completionHandler:", 1, &__block_literal_global_87);

}

- (void)connectionInvalidated
{
  -[NSLock lock](self->_lock, "lock");
  -[AWDLServiceDiscoveryManager _destroyConnection](self, "_destroyConnection");
  if (-[NSMutableArray count](self->_activeTrafficRegistrations, "count") && !self->_attemptedReconnect)
  {
    -[AWDLServiceDiscoveryManager _retryConnection](self, "_retryConnection");
    self->_attemptedReconnect = 1;
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (BOOL)_usingAWDLDiscoveryManagerProxy:(id)a3 onSuccess:(id)a4 error:(id *)a5
{
  void (**v8)(id, void *, _QWORD *);
  void (**v9)(id, AWDLServiceDiscoveryManager *);
  int *p_notifyToken;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  NSXPCConnection *xpcConnection;
  NSXPCConnection **p_xpcConnection;
  void *v16;
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
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  char v33;
  id v35;
  void (**v36)(id, AWDLServiceDiscoveryManager *);
  _QWORD v37[6];
  _QWORD v38[5];
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[6];
  _QWORD v44[6];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  _QWORD handler[4];
  id v58;
  id location;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;

  v8 = (void (**)(id, void *, _QWORD *))a3;
  v9 = (void (**)(id, AWDLServiceDiscoveryManager *))a4;
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 0;
  objc_initWeak(&location, self);
  p_notifyToken = &self->_notifyToken;
  v11 = MEMORY[0x1E0C809B0];
  if (self->_notifyToken == -1)
  {
    v12 = +[WiFiP2PXPCConnection wifiPeerToPeerAvailableNotification](WiFiP2PXPCConnection, "wifiPeerToPeerAvailableNotification");
    +[WiFiP2PXPCConnection wifiPeerToPeerWorkloop](WiFiP2PXPCConnection, "wifiPeerToPeerWorkloop");
    v13 = objc_claimAutoreleasedReturnValue();
    handler[0] = v11;
    handler[1] = 3221225472;
    handler[2] = __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke;
    handler[3] = &unk_1E6E1E918;
    objc_copyWeak(&v58, &location);
    notify_register_dispatch(v12, &self->_notifyToken, v13, handler);

    objc_destroyWeak(&v58);
  }
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__0;
  v55 = __Block_byref_object_dispose__0;
  v56 = 0;
  p_xpcConnection = &self->_xpcConnection;
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
    goto LABEL_7;
  v36 = v9;
  +[WiFiP2PXPCConnection endpointForEndpointType:](WiFiP2PXPCConnection, "endpointForEndpointType:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v35 = v16;
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__0;
    v49 = __Block_byref_object_dispose__0;
    v50 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v16);
    v17 = (void *)v46[5];
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1A4E00);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setRemoteObjectInterface:", v18);

    v19 = (void *)v46[5];
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1A2FC0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setExportedInterface:", v20);

    v21 = (void *)v46[5];
    +[WiFiP2PXPCConnection weakExportedObjectProxy:](WiFiP2PXPCConnection, "weakExportedObjectProxy:", self);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setExportedObject:", v22);

    objc_msgSend((id)v46[5], "activate");
    v23 = (void *)v46[5];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_128;
    v44[3] = &unk_1E6E1E738;
    v44[4] = &v51;
    v44[5] = &v45;
    objc_msgSend(v23, "synchronousRemoteObjectProxyWithErrorHandler:", v44);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_2;
    v43[3] = &unk_1E6E1EC48;
    v43[4] = &v51;
    v43[5] = &v45;
    objc_msgSend(v24, "createXPCResponderWithType:completionHandler:", 1, v43);

    v25 = (void *)v46[5];
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1A4F80);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setRemoteObjectInterface:", v26);

    v27 = (void *)v46[5];
    v28 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_3;
    v41[3] = &unk_1E6E1E7B0;
    objc_copyWeak(&v42, &location);
    objc_msgSend(v27, "setInvalidationHandler:", v41);
    v29 = (void *)v46[5];
    v39[0] = v28;
    v39[1] = 3221225472;
    v39[2] = __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_5;
    v39[3] = &unk_1E6E1E7B0;
    objc_copyWeak(&v40, &location);
    objc_msgSend(v29, "setInterruptionHandler:", v39);
    objc_storeStrong((id *)&self->_xpcConnection, (id)v46[5]);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&v42);
    _Block_object_dispose(&v45, 8);

    v16 = v35;
  }

  xpcConnection = *p_xpcConnection;
  v9 = v36;
  if (*p_xpcConnection)
  {
LABEL_7:
    v30 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_7;
    v38[3] = &unk_1E6E1E6E8;
    v38[4] = &v51;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v38, v35);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v30;
    v37[1] = 3221225472;
    v37[2] = __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_8;
    v37[3] = &unk_1E6E1E738;
    v37[4] = &v60;
    v37[5] = &v51;
    v8[2](v8, v31, v37);

  }
  if (a5)
  {
    v32 = (unint64_t)objc_retainAutorelease((id)v52[5]);
    *a5 = (id)v32;
    if (!((unint64_t)*p_xpcConnection | v32))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 6, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  if (*((_BYTE *)v61 + 24))
  {
    if (v9)
      v9[2](v9, self);
    if (!-[AWDLServiceDiscoveryManager _requiresConnection](self, "_requiresConnection", v35))
    {
      -[AWDLServiceDiscoveryManager _destroyConnection](self, "_destroyConnection");
      if (*p_notifyToken != -1)
        notify_cancel(*p_notifyToken);
      *p_notifyToken = -1;
    }
    if (a5)
      *a5 = 0;
  }
  v33 = *((_BYTE *)v61 + 24);
  _Block_object_dispose(&v51, 8);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v60, 8);

  return v33;
}

void __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[1], "lock");
    objc_msgSend(v2, "_retryConnection");
    objc_msgSend(v2[1], "unlock");
    WeakRetained = v2;
  }

}

void __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_128(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v6 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

void __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  +[WiFiP2PXPCConnection convertError:](WiFiP2PXPCConnection, "convertError:", a2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = 0;

  }
}

void __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  +[WiFiP2PXPCConnection wifiPeerToPeerWorkloop](WiFiP2PXPCConnection, "wifiPeerToPeerWorkloop");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_4;
  block[3] = &unk_1E6E1E7B0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(v2, block);

  objc_destroyWeak(&v4);
}

void __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionInvalidated");

}

void __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  +[WiFiP2PXPCConnection wifiPeerToPeerWorkloop](WiFiP2PXPCConnection, "wifiPeerToPeerWorkloop");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_6;
  block[3] = &unk_1E6E1E7B0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(v2, block);

  objc_destroyWeak(&v4);
}

void __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionInvalidated");

}

void __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_7(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_8(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

- (BOOL)setTrafficRegistration:(id)a3 error:(id *)a4
{
  return -[AWDLServiceDiscoveryManager setTrafficRegistration:onInvalidationHandler:error:](self, "setTrafficRegistration:onInvalidationHandler:error:", a3, 0, a4);
}

- (BOOL)setTrafficRegistration:(id)a3 onInvalidationHandler:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  BOOL v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("airplay-connectivity-check"));

  if (!v11)
  {
    objc_msgSend(v8, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("airplay")))
    {
      objc_msgSend(v8, "peerAddress");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[WiFiMACAddress zeroAddress](WiFiMACAddress, "zeroAddress");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "isEqual:", v16) & 1) != 0)
      {
        v17 = objc_msgSend(v8, "options");

        if ((v17 & 1) == 0)
        {
          objc_msgSend(v8, "setActiveFlagOverride:", 1);
          v12 = -[AWDLServiceDiscoveryManager clearTrafficRegistration:error:](self, "clearTrafficRegistration:error:", v8, a5);
          goto LABEL_3;
        }
LABEL_10:
        objc_msgSend(v8, "setInvalidationHandler:", v9);
        -[NSLock lock](self->_lock, "lock");
        v18 = MEMORY[0x1E0C809B0];
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __82__AWDLServiceDiscoveryManager_setTrafficRegistration_onInvalidationHandler_error___block_invoke;
        v25[3] = &unk_1E6E1EC20;
        v26 = v8;
        v20 = v18;
        v21 = 3221225472;
        v22 = __82__AWDLServiceDiscoveryManager_setTrafficRegistration_onInvalidationHandler_error___block_invoke_2;
        v23 = &unk_1E6E1EC70;
        v24 = v26;
        v13 = -[AWDLServiceDiscoveryManager _usingAWDLDiscoveryManagerProxy:onSuccess:error:](self, "_usingAWDLDiscoveryManagerProxy:onSuccess:error:", v25, &v20, a5);
        -[NSLock unlock](self->_lock, "unlock", v20, v21, v22, v23);

        goto LABEL_11;
      }

    }
    goto LABEL_10;
  }
  v12 = -[AWDLServiceDiscoveryManager queryAirPlayConnectivityWithConfiguration:error:](self, "queryAirPlayConnectivityWithConfiguration:error:", v8, a5);
LABEL_3:
  v13 = v12;
LABEL_11:

  return v13;
}

void __82__AWDLServiceDiscoveryManager_setTrafficRegistration_onInvalidationHandler_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "trafficRegistration:enabled:completionHandler:", v4, objc_msgSend(v4, "activeFlagOverride") ^ 1, v5);

}

void __82__AWDLServiceDiscoveryManager_setTrafficRegistration_onInvalidationHandler_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v6;
  id *v7;

  v7 = a2;
  v3 = objc_msgSend(v7[4], "indexOfObject:", *(_QWORD *)(a1 + 32));
  if (v3 == 0x7FFFFFFFFFFFFFFFLL
    || (v4 = v3,
        objc_msgSend(v7[4], "objectAtIndex:", v3),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "hasSimilarOptionsTo:", *(_QWORD *)(a1 + 32)),
        v5,
        (v6 & 1) != 0))
  {
    objc_msgSend(v7[4], "addObject:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(v7[4], "replaceObjectAtIndex:withObject:", v4, *(_QWORD *)(a1 + 32));
  }

}

- (BOOL)clearTrafficRegistration:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a3;
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("airplay")))
    goto LABEL_6;
  objc_msgSend(v6, "peerAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiMACAddress zeroAddress](WiFiMACAddress, "zeroAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqual:", v9) & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  v10 = objc_msgSend(v6, "options");

  if ((v10 & 1) == 0)
  {
LABEL_7:
    -[NSLock lock](self->_lock, "lock");
    v12 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __62__AWDLServiceDiscoveryManager_clearTrafficRegistration_error___block_invoke;
    v19[3] = &unk_1E6E1EC20;
    v20 = v6;
    v14 = v12;
    v15 = 3221225472;
    v16 = __62__AWDLServiceDiscoveryManager_clearTrafficRegistration_error___block_invoke_2;
    v17 = &unk_1E6E1EC70;
    v18 = v20;
    v11 = -[AWDLServiceDiscoveryManager _usingAWDLDiscoveryManagerProxy:onSuccess:error:](self, "_usingAWDLDiscoveryManagerProxy:onSuccess:error:", v19, &v14, a4);
    -[NSLock unlock](self->_lock, "unlock", v14, v15, v16, v17);

    goto LABEL_8;
  }
  objc_msgSend(v6, "setActiveFlagOverride:", 1);
  v11 = -[AWDLServiceDiscoveryManager setTrafficRegistration:error:](self, "setTrafficRegistration:error:", v6, a4);
LABEL_8:

  return v11;
}

void __62__AWDLServiceDiscoveryManager_clearTrafficRegistration_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "trafficRegistration:enabled:completionHandler:", v4, objc_msgSend(v4, "activeFlagOverride"), v5);

}

uint64_t __62__AWDLServiceDiscoveryManager_clearTrafficRegistration_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_removeFirstTrafficRegistrationMatching:", *(_QWORD *)(a1 + 32));
}

- (BOOL)resumeAWDLWithError:(id *)a3
{
  int64_t suspendCount;
  BOOL v6;
  int64_t v7;
  BOOL v8;

  -[NSLock lock](self->_lock, "lock");
  suspendCount = self->_suspendCount;
  v6 = __OFSUB__(suspendCount, 1);
  v7 = suspendCount - 1;
  if (v7)
  {
    if (v7 < 0 == v6)
      self->_suspendCount = v7;
    v8 = 1;
  }
  else
  {
    v8 = -[AWDLServiceDiscoveryManager _usingAWDLDiscoveryManagerProxy:onSuccess:error:](self, "_usingAWDLDiscoveryManagerProxy:onSuccess:error:", &__block_literal_global_141, &__block_literal_global_142, a3);
  }
  -[NSLock unlock](self->_lock, "unlock");
  return v8;
}

uint64_t __51__AWDLServiceDiscoveryManager_resumeAWDLWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "setAWDLSuspendedState:completionHandler:", 0, a3);
}

void __51__AWDLServiceDiscoveryManager_resumeAWDLWithError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  --*(_QWORD *)(a2 + 40);
}

- (BOOL)suspendAWDLWithError:(id *)a3
{
  int64_t suspendCount;
  BOOL v6;

  -[NSLock lock](self->_lock, "lock");
  suspendCount = self->_suspendCount;
  if (suspendCount)
  {
    self->_suspendCount = suspendCount + 1;
    v6 = 1;
  }
  else
  {
    v6 = -[AWDLServiceDiscoveryManager _usingAWDLDiscoveryManagerProxy:onSuccess:error:](self, "_usingAWDLDiscoveryManagerProxy:onSuccess:error:", &__block_literal_global_143, &__block_literal_global_144, a3);
  }
  -[NSLock unlock](self->_lock, "unlock");
  return v6;
}

uint64_t __52__AWDLServiceDiscoveryManager_suspendAWDLWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "setAWDLSuspendedState:completionHandler:", 1, a3);
}

void __52__AWDLServiceDiscoveryManager_suspendAWDLWithError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  ++*(_QWORD *)(a2 + 40);
}

- (BOOL)performRealtimeConnectivityCheckWithConfiguration:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  BOOL v9;
  id v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *, uint64_t);
  void *v19;
  id v20;
  id v21;

  v5 = a3;
  v21 = 0;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __87__AWDLServiceDiscoveryManager_performRealtimeConnectivityCheckWithConfiguration_error___block_invoke;
  v19 = &unk_1E6E1ECD8;
  v6 = v5;
  v20 = v6;
  +[WiFiP2PXPCConnection directQueryOnEndpointType:error:querying:](WiFiP2PXPCConnection, "directQueryOnEndpointType:error:querying:", 2, &v21, &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v21;
  if (v8)
    v9 = 1;
  else
    v9 = v7 == 0;
  if (v9)
  {
    v10 = v8;
    if (a4)
    {
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 102, 0, v16, v17, v18, v19);
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = objc_retainAutorelease(v10);
      v11 = 0;
      *a4 = v10;
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v12 = objc_msgSend(v7, "integerValue", v16, v17, v18, v19);
    v13 = v12;
    if (a4)
    {
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v12, 0);
        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a4 = v14;

      }
      else
      {
        *a4 = 0;
      }
    }
    v10 = 0;
    v11 = v13 == 0;
  }

  return v11;
}

uint64_t __87__AWDLServiceDiscoveryManager_performRealtimeConnectivityCheckWithConfiguration_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "performRealtimeConnectivityCheckWithConfiguration:completionHandler:", *(_QWORD *)(a1 + 32), a3);
}

- (void)_removeFirstTrafficRegistrationMatching:(id)a3
{
  uint64_t v4;

  v4 = -[NSMutableArray indexOfObject:](self->_activeTrafficRegistrations, "indexOfObject:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray removeObjectAtIndex:](self->_activeTrafficRegistrations, "removeObjectAtIndex:", v4);
}

- (void)invalidatedActiveTrafficRegistration:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  int notifyToken;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSLock lock](self->_lock, "lock");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_activeTrafficRegistrations;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "isEqual:", v4, (_QWORD)v14))
        {
          objc_msgSend(v10, "invalidationHandler");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v10, "invalidationHandler");
            v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *))v12)[2](v12, v10);

          }
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  -[NSMutableArray removeObject:](self->_activeTrafficRegistrations, "removeObject:", v4);
  if (!-[AWDLServiceDiscoveryManager _requiresConnection](self, "_requiresConnection"))
  {
    -[AWDLServiceDiscoveryManager _destroyConnection](self, "_destroyConnection");
    notifyToken = self->_notifyToken;
    if (notifyToken != -1)
      notify_cancel(notifyToken);
    self->_notifyToken = -1;
  }
  -[NSLock unlock](self->_lock, "unlock", (_QWORD)v14);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTrafficRegistrations, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
