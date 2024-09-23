@implementation HKSPXPCConnectionListener

BOOL __57__HKSPXPCConnectionListener__currentClientForConnection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  void *v20;
  HKSPXPCConnectionInfo *connectionInfo;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id from;
  _BYTE location[12];
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HKSPXPCConnectionInfo requiredEntitlement](self->_connectionInfo, "requiredEntitlement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_3;
  -[HKSPXPCConnectionInfo requiredEntitlement](self->_connectionInfo, "requiredEntitlement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForEntitlement:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (!v11)
  {
    HKSPLogForCategory(4uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_opt_class();
      connectionInfo = self->_connectionInfo;
      v22 = v20;
      -[HKSPXPCConnectionInfo requiredEntitlement](connectionInfo, "requiredEntitlement");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543874;
      *(_QWORD *)&location[4] = v20;
      v37 = 2114;
      v38 = v7;
      v39 = 2114;
      v40 = v23;
      _os_log_error_impl(&dword_1A4F0E000, v18, OS_LOG_TYPE_ERROR, "[%{public}@] connection %{public}@ not entitled (%{public}@)", location, 0x20u);

    }
    v17 = 0;
  }
  else
  {
LABEL_3:
    -[HKSPXPCConnectionInfo exportedObjectInterface](self->_connectionInfo, "exportedObjectInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v12);

    -[HKSPXPCConnectionInfo exportedObject](self->_connectionInfo, "exportedObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedObject:", v13);

    -[HKSPXPCConnectionInfo remoteObjectInterface](self->_connectionInfo, "remoteObjectInterface");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v14);

    objc_initWeak((id *)location, self);
    objc_initWeak(&from, v7);
    v15 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __64__HKSPXPCConnectionListener_listener_shouldAcceptNewConnection___block_invoke;
    v32[3] = &unk_1E4E3CB58;
    objc_copyWeak(&v33, (id *)location);
    objc_copyWeak(&v34, &from);
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v32);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v15;
    v29[1] = 3221225472;
    v29[2] = __64__HKSPXPCConnectionListener_listener_shouldAcceptNewConnection___block_invoke_2;
    v29[3] = &unk_1E4E3CB80;
    objc_copyWeak(&v30, (id *)location);
    objc_copyWeak(&v31, &from);
    objc_msgSend(v7, "setInvalidationHandler:", v29);
    v24 = v15;
    v25 = 3221225472;
    v26 = __64__HKSPXPCConnectionListener_listener_shouldAcceptNewConnection___block_invoke_187;
    v27 = &unk_1E4E3BC80;
    objc_copyWeak(&v28, (id *)location);
    objc_msgSend(v7, "setInterruptionHandler:", &v24);
    -[HKSPXPCConnectionListener addClientConnection:clientLink:](self, "addClientConnection:clientLink:", v7, v16, v24, v25, v26, v27);
    objc_msgSend(v7, "resume");
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v30);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&from);
    objc_destroyWeak((id *)location);
    v17 = 1;
  }

  return v17;
}

- (void)addClientConnection:(id)a3 clientLink:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  HKSPXPCConnectionListener *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__7;
  v23 = __Block_byref_object_dispose__7;
  v24 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __60__HKSPXPCConnectionListener_addClientConnection_clientLink___block_invoke;
  v14 = &unk_1E4E3CBA8;
  v8 = v7;
  v18 = &v19;
  v15 = v8;
  v16 = self;
  v9 = v6;
  v17 = v9;
  -[HKSPXPCConnectionListener _withLock:](self, "_withLock:", &v11);
  -[HKSPThrottler execute](self->_logThrottler, "execute", v11, v12, v13, v14);
  if (v20[5])
  {
    -[HKSPXPCConnectionListener delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "connectionListenerDidAddClient:", v20[5]);

  }
  _Block_object_dispose(&v19, 8);

}

- (HKSPXPCConnectionListenerDelegate)delegate
{
  return (HKSPXPCConnectionListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

uint64_t __68__HKSPXPCConnectionListener__clientIdentifierProviderForClientLink___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

- (HKSPXPCClient)currentClient
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__7;
  v14 = __Block_byref_object_dispose__7;
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__HKSPXPCConnectionListener_currentClient__block_invoke;
  v7[3] = &unk_1E4E3AF20;
  v9 = &v10;
  v7[4] = self;
  v4 = v3;
  v8 = v4;
  -[HKSPXPCConnectionListener _withLock:](self, "_withLock:", v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return (HKSPXPCClient *)v5;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_clientLock;
  void (**v4)(_QWORD);

  p_clientLock = &self->_clientLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_clientLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_clientLock);
}

void __42__HKSPXPCConnectionListener_currentClient__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_currentClientForConnection:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_currentClientForConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (v4)
  {
    -[NSMutableSet allObjects](self->_connectedClientSet, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__HKSPXPCConnectionListener__currentClientForConnection___block_invoke;
    v8[3] = &unk_1E4E3CC68;
    v9 = v4;
    objc_msgSend(v5, "na_firstObjectPassingTest:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __60__HKSPXPCConnectionListener_addClientConnection_clientLink___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 40), "_clientWithConnection:clientLink:", *(_QWORD *)(result + 48));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    HKSPLogForCategory(4uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_opt_class();
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 40);
      v9 = 138543618;
      v10 = v6;
      v11 = 2114;
      v12 = v7;
      v8 = v6;
      _os_log_impl(&dword_1A4F0E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] adding XPC client: %{public}@", (uint8_t *)&v9, 0x16u);

    }
    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 48), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 40));
  }
  return result;
}

- (id)_clientWithConnection:(id)a3 clientLink:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  -[HKSPXPCConnectionListener _clientIdentifierProviderForClientLink:](self, "_clientIdentifierProviderForClientLink:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKSPXPCClient clientForConnection:clientIdentifierProvider:clientLink:](HKSPXPCClient, "clientForConnection:clientIdentifierProvider:clientLink:", v6, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_initWeak(&from, v9);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__HKSPXPCConnectionListener__clientWithConnection_clientLink___block_invoke;
  v12[3] = &unk_1E4E3CBD0;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, &from);
  v10 = (id)objc_msgSend(v8, "addSuccessBlock:", v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v9;
}

- (id)_clientIdentifierProviderForClientLink:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (objc_class *)MEMORY[0x1E0D519C0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__HKSPXPCConnectionListener__clientIdentifierProviderForClientLink___block_invoke;
  v8[3] = &unk_1E4E3CBF8;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "getClientIdentifierWithCompletion:", v8);

  return v6;
}

void __52__HKSPXPCConnectionListener_removeClientConnection___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1[4] + 48), "allObjects", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "connection");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)a1[5];

        if (v8 == v9)
        {
          HKSPLogForCategory(4uLL);
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v11 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v18 = v11;
            v19 = 2114;
            v20 = v7;
            v12 = v11;
            _os_log_impl(&dword_1A4F0E000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] removing XPC client: %{public}@", buf, 0x16u);

          }
          objc_msgSend(*(id *)(a1[4] + 48), "removeObject:", v7);
          objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v7);
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

}

void __62__HKSPXPCConnectionListener__clientWithConnection_clientLink___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  HKSPLogForCategory(4uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543618;
    v7 = (id)objc_opt_class();
    v8 = 2114;
    v9 = v3;
    v5 = v7;
    _os_log_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] determined identity of client: %{public}@", (uint8_t *)&v6, 0x16u);

  }
}

void __64__HKSPXPCConnectionListener_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  HKSPLogForCategory(4uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543618;
    v7 = (id)objc_opt_class();
    v8 = 2114;
    v9 = v3;
    v5 = v7;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] invalidation handler called for connection %{public}@...", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(WeakRetained, "_didInvalidateConnection:", v3);

}

- (void)_didInvalidateConnection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HKSPXPCConnectionInfo *connectionInfo;
  id v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HKSPLogForCategory(4uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_opt_class();
    connectionInfo = self->_connectionInfo;
    v8 = v6;
    -[HKSPXPCConnectionInfo machServiceName](connectionInfo, "machServiceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v6;
    v12 = 2114;
    v13 = v9;
    _os_log_error_impl(&dword_1A4F0E000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] connection to server via %{public}@ mach port was invalidated.", (uint8_t *)&v10, 0x16u);

  }
  -[HKSPXPCConnectionListener removeClientConnection:](self, "removeClientConnection:", v4);

}

- (void)removeClientConnection:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__7;
  v14 = __Block_byref_object_dispose__7;
  v15 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HKSPXPCConnectionListener_removeClientConnection___block_invoke;
  v7[3] = &unk_1E4E3CC20;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[HKSPXPCConnectionListener _withLock:](self, "_withLock:", v7);
  -[HKSPThrottler execute](self->_logThrottler, "execute");
  if (v11[5])
  {
    -[HKSPXPCConnectionListener delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "connectionListenerDidRemoveClient:", v11[5]);

  }
  _Block_object_dispose(&v10, 8);

}

+ (id)listenerWithConnectionInfo:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithConnectionInfo:", v3);

  return v4;
}

- (HKSPXPCConnectionListener)initWithConnectionInfo:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HKSPXPCConnectionListener *v10;

  v4 = (objc_class *)MEMORY[0x1E0CB3B58];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "machServiceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithMachServiceName:", v7);
  HKSPStandardHeartbeatGenerator(v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HKSPXPCConnectionListener initWithConnectionInfo:connectionListener:heartbeatGenerator:](self, "initWithConnectionInfo:connectionListener:heartbeatGenerator:", v5, v8, v9);

  return v10;
}

- (HKSPXPCConnectionListener)initWithConnectionInfo:(id)a3 connectionListener:(id)a4 heartbeatGenerator:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKSPXPCConnectionListener *v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSMutableSet *v16;
  NSMutableSet *connectedClientSet;
  HKSPThrottler *v18;
  uint64_t v19;
  HKSPThrottler *logThrottler;
  HKSPXPCConnectionListener *v21;
  _QWORD v23[4];
  id v24;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)HKSPXPCConnectionListener;
  v12 = -[HKSPXPCConnectionListener init](&v25, sel_init);
  if (v12)
  {
    HKSPLogForCategory(4uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v27 = v14;
      v28 = 2114;
      v29 = v9;
      v15 = v14;
      _os_log_impl(&dword_1A4F0E000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] initializing with %{public}@", buf, 0x16u);

    }
    objc_storeStrong((id *)&v12->_connectionInfo, a3);
    objc_storeStrong((id *)&v12->_heartbeatGenerator, a5);
    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    connectedClientSet = v12->_connectedClientSet;
    v12->_connectedClientSet = v16;

    v12->_clientLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_connectionListener, a4);
    -[NSXPCListener setDelegate:](v12->_connectionListener, "setDelegate:", v12);
    objc_initWeak((id *)buf, v12);
    v18 = [HKSPThrottler alloc];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __90__HKSPXPCConnectionListener_initWithConnectionInfo_connectionListener_heartbeatGenerator___block_invoke;
    v23[3] = &unk_1E4E3BC80;
    objc_copyWeak(&v24, (id *)buf);
    v19 = -[HKSPThrottler initWithInterval:executeBlock:](v18, "initWithInterval:executeBlock:", v23, 1.0);
    logThrottler = v12->_logThrottler;
    v12->_logThrottler = (HKSPThrottler *)v19;

    v21 = v12;
    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }

  return v12;
}

void __90__HKSPXPCConnectionListener_initWithConnectionInfo_connectionListener_heartbeatGenerator___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_logConnectedClients");

}

- (void)startListening
{
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[NSXPCListener resume](self->_connectionListener, "resume");
  HKSPLogForCategory(4uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = (id)objc_opt_class();
    v4 = v6;
    _os_log_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] sending heartbeat", (uint8_t *)&v5, 0xCu);

  }
  -[HKSPXPCHeartbeatGenerator sendHeartbeat](self->_heartbeatGenerator, "sendHeartbeat");
}

void __64__HKSPXPCConnectionListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didInvalidateConnection:", v2);

}

void __64__HKSPXPCConnectionListener_listener_shouldAcceptNewConnection___block_invoke_187(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didInterruptConnection");

}

- (void)_didInterruptConnection
{
  NSObject *v3;
  void *v4;
  HKSPXPCConnectionInfo *connectionInfo;
  id v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  HKSPLogForCategory(4uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_opt_class();
    connectionInfo = self->_connectionInfo;
    v6 = v4;
    -[HKSPXPCConnectionInfo machServiceName](connectionInfo, "machServiceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v4;
    v10 = 2114;
    v11 = v7;
    _os_log_error_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_ERROR, "[%{public}@] connection to server via %{public}@ mach port was interrupted.", (uint8_t *)&v8, 0x16u);

  }
}

- (void)_logConnectedClients
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  __int128 v6;
  NSObject *v7;
  id v8;
  void *v9;
  __int128 v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  _WORD v21[17];

  *(_QWORD *)&v21[13] = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__7;
  v16 = __Block_byref_object_dispose__7;
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__HKSPXPCConnectionListener__logConnectedClients__block_invoke;
  v11[3] = &unk_1E4E3AED0;
  v11[4] = self;
  v11[5] = &v12;
  -[HKSPXPCConnectionListener _withLock:](self, "_withLock:", v11);
  HKSPLogForCategory(4uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (id)objc_opt_class();
    v4 = objc_msgSend((id)v13[5], "count");
    *(_DWORD *)buf = 138543618;
    v19 = v3;
    v20 = 2048;
    *(_QWORD *)v21 = v4;
    _os_log_impl(&dword_1A4F0E000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] current XPC clients: %lu", buf, 0x16u);

  }
  v5 = 0;
  *(_QWORD *)&v6 = 138543874;
  v10 = v6;
  while (objc_msgSend((id)v13[5], "count", v10) > v5)
  {
    HKSPLogForCategory(4uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (id)objc_opt_class();
      objc_msgSend((id)v13[5], "objectAtIndexedSubscript:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v10;
      v19 = v8;
      v20 = 1024;
      *(_DWORD *)v21 = v5;
      v21[2] = 2114;
      *(_QWORD *)&v21[3] = v9;
      _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] connected client[%i]: %{public}@", buf, 0x1Cu);

    }
    ++v5;
  }
  _Block_object_dispose(&v12, 8);

}

void __49__HKSPXPCConnectionListener__logConnectedClients__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)connectedClients
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__7;
  v9 = __Block_byref_object_dispose__7;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__HKSPXPCConnectionListener_connectedClients__block_invoke;
  v4[3] = &unk_1E4E3AED0;
  v4[4] = self;
  v4[5] = &v5;
  -[HKSPXPCConnectionListener _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __45__HKSPXPCConnectionListener_connectedClients__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)connectedClientsWithPID:(int)a3
{
  void *v4;
  void *v5;
  _QWORD v7[4];
  int v8;

  -[HKSPXPCConnectionListener connectedClients](self, "connectedClients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__HKSPXPCConnectionListener_connectedClientsWithPID___block_invoke;
  v7[3] = &__block_descriptor_36_e23_B16__0__HKSPXPCClient_8l;
  v8 = a3;
  objc_msgSend(v4, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL __53__HKSPXPCConnectionListener_connectedClientsWithPID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processID") == *(_DWORD *)(a1 + 32);
}

- (void)performRemoteBlockOnClients:(id)a3
{
  -[HKSPXPCConnectionListener performRemoteBlockOnClients:passingTest:](self, "performRemoteBlockOnClients:passingTest:", a3, &__block_literal_global_18);
}

uint64_t __57__HKSPXPCConnectionListener_performRemoteBlockOnClients___block_invoke()
{
  return 1;
}

- (void)performRemoteBlockOnClients:(id)a3 passingTest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HKSPXPCConnectionListener connectedClients](self, "connectedClients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__HKSPXPCConnectionListener_performRemoteBlockOnClients_passingTest___block_invoke;
  v11[3] = &unk_1E4E3CCB0;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "na_each:", v11);

}

void __69__HKSPXPCConnectionListener_performRemoteBlockOnClients_passingTest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "clientLink");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
}

- (void)performRemoteBlock:(id)a3 onClient:(id)a4
{
  void (**v6)(id, NSObject *);
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, NSObject *))a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__HKSPXPCConnectionListener_performRemoteBlock_onClient___block_invoke;
  v12[3] = &unk_1E4E3AF20;
  v14 = &v15;
  v12[4] = self;
  v8 = v7;
  v13 = v8;
  -[HKSPXPCConnectionListener _withLock:](self, "_withLock:", v12);
  if (*((_BYTE *)v16 + 24))
  {
    objc_msgSend(v8, "clientLink");
    v9 = objc_claimAutoreleasedReturnValue();
    v6[2](v6, v9);
  }
  else
  {
    HKSPLogForCategory(4uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v20 = v10;
      v21 = 2114;
      v22 = v8;
      v11 = v10;
      _os_log_error_impl(&dword_1A4F0E000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] client doesn't exist: %{public}@", buf, 0x16u);

    }
  }

  _Block_object_dispose(&v15, 8);
}

uint64_t __57__HKSPXPCConnectionListener_performRemoteBlock_onClient___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 48), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)dealloc
{
  NSXPCListener *connectionListener;
  objc_super v4;

  -[NSXPCListener setDelegate:](self->_connectionListener, "setDelegate:", 0);
  -[NSXPCListener invalidate](self->_connectionListener, "invalidate");
  connectionListener = self->_connectionListener;
  self->_connectionListener = 0;

  v4.receiver = self;
  v4.super_class = (Class)HKSPXPCConnectionListener;
  -[HKSPXPCConnectionListener dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)-[HKSPXPCConnectionListener descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", &stru_1E4E3E220);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[HKSPXPCConnectionListener succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[HKSPXPCConnectionListener descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPXPCConnectionListener connectionInfo](self, "connectionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("connectionInfo"));

  -[HKSPXPCConnectionListener connectedClients](self, "connectedClients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", v7, CFSTR("connectedClients"), 0);

  return v4;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HKSPXPCConnectionInfo)connectionInfo
{
  return self->_connectionInfo;
}

- (HKSPXPCHeartbeatGenerator)heartbeatGenerator
{
  return self->_heartbeatGenerator;
}

- (NSXPCListener)connectionListener
{
  return self->_connectionListener;
}

- (os_unfair_lock_s)clientLock
{
  return self->_clientLock;
}

- (NSMutableSet)connectedClientSet
{
  return self->_connectedClientSet;
}

- (HKSPThrottler)logThrottler
{
  return self->_logThrottler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logThrottler, 0);
  objc_storeStrong((id *)&self->_connectedClientSet, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_heartbeatGenerator, 0);
  objc_storeStrong((id *)&self->_connectionInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
