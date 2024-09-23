@implementation TUCallServicesInterface

- (TUCallContainerPrivate)callContainer
{
  NSObject *v3;
  TUCallContainer *v4;
  void *v5;
  TUCallContainer *v6;

  -[TUCallServicesInterface queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = [TUCallContainer alloc];
  -[TUCallServicesInterface currentCalls](self, "currentCalls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TUCallContainer initWithCalls:](v4, "initWithCalls:", v5);

  return (TUCallContainerPrivate *)v6;
}

- (NSArray)currentCalls
{
  NSObject *v3;

  -[TUCallServicesInterface queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TUCallServicesInterface waitForInitialStateIfNecessary](self, "waitForInitialStateIfNecessary");
  return self->_currentCalls;
}

- (void)waitForInitialStateIfNecessary
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[TUCallServicesInterface queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!self->_currentCalls)
  {
    if (!-[TUCallServicesInterface hasRequestedInitialState](self, "hasRequestedInitialState"))
      -[TUCallServicesInterface requestCurrentStateWithCompletionHandler:](self, "requestCurrentStateWithCompletionHandler:", 0);
    TUDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Waiting for initial state", v5, 2u);
    }

    -[TUCallServicesInterface fetchCurrentCalls](self, "fetchCurrentCalls");
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)hasRequestedInitialState
{
  return self->_hasRequestedInitialState;
}

- (void)fetchCurrentCalls
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  uint8_t buf[16];

  -[TUCallServicesInterface queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Proxying fetch current calls", buf, 2u);
  }

  -[TUCallServicesInterface _ignorePendingServerDisconnectionHandlers](self, "_ignorePendingServerDisconnectionHandlers");
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__TUCallServicesInterface_fetchCurrentCalls__block_invoke;
  v8[3] = &unk_1E38A2310;
  v8[4] = self;
  -[TUCallServicesInterface synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __44__TUCallServicesInterface_fetchCurrentCalls__block_invoke_24;
  v7[3] = &unk_1E38A30B8;
  v7[4] = self;
  objc_msgSend(v6, "requestInitialState:", v7);

}

- (id)synchronousServerWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[TUCallServicesInterface server](self, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[TUCallServicesInterface xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)_ignorePendingServerDisconnectionHandlers
{
  void *v3;
  _QWORD v4[5];

  -[TUCallServicesInterface xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__TUCallServicesInterface__ignorePendingServerDisconnectionHandlers__block_invoke;
  v4[3] = &unk_1E38A1360;
  v4[4] = self;
  objc_msgSend(v3, "performBlockOnQueue:", v4);

}

- (void)setShouldHandleServerDisconnect:(BOOL)a3
{
  self->_shouldHandleServerDisconnect = a3;
}

- (TUCallNotificationManager)callNotificationManager
{
  return self->_callNotificationManager;
}

void __44__TUCallServicesInterface_fetchCurrentCalls__block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Received current state with calls for synchronousServer: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "setHasReceivedInitialState:", 1);
  objc_msgSend(*(id *)(a1 + 32), "callNotificationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__TUCallServicesInterface_fetchCurrentCalls__block_invoke_25;
  v8[3] = &unk_1E38A1388;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  objc_msgSend(v5, "deferNotificationsUntilAfterPerformingBlock:", v8);

}

- (void)_updateCurrentCalls:(id)a3 withNotificationsUsingUpdatedCalls:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  _QWORD aBlock[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[TUCallServicesInterface _updateCurrentCalls:](self, "_updateCurrentCalls:", a3);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __82__TUCallServicesInterface__updateCurrentCalls_withNotificationsUsingUpdatedCalls___block_invoke;
        aBlock[3] = &unk_1E38A1360;
        aBlock[4] = v11;
        v12 = _Block_copy(aBlock);
        if (-[TUCallServicesInterface isServerLocal](self, "isServerLocal"))
        {
          v13 = v11;
        }
        else
        {
          objc_msgSend(v11, "comparativeCall");
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        v14 = v13;
        -[TUCallServicesInterface _registerCall:](self, "_registerCall:", v13);
        -[TUCallServicesInterface callNotificationManager](self, "callNotificationManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "comparativeCall");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "postNotificationsForCall:usingComparisonCall:afterUpdatesInBlock:", v14, v16, v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

}

uint64_t __68__TUCallServicesInterface_requestCurrentStateWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t result;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Received current state with calls for asynchronousServer: %@", (uint8_t *)&v8, 0xCu);
  }

  if ((objc_msgSend(*(id *)(a1 + 40), "hasReceivedInitialState") & 1) != 0)
  {
    TUDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Dropping asynchronous response for current state, since we already have received initial state", (uint8_t *)&v8, 2u);
    }

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD **)(a1 + 40);
    if (v5[10])
      objc_msgSend(v5, "_handleCurrentCallsChanged:callsDisconnected:", v6, MEMORY[0x1E0C9AA60]);
    else
      objc_msgSend(v5, "_updateCurrentCallsWithoutNotifications:", v6);
    objc_msgSend(*(id *)(a1 + 40), "setHasReceivedInitialState:", 1);
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)hasReceivedInitialState
{
  return self->_hasReceivedInitialState;
}

- (void)setHasReceivedInitialState:(BOOL)a3
{
  self->_hasReceivedInitialState = a3;
}

- (void)_updateCurrentCallsWithoutNotifications:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUCallServicesInterface _updateCurrentCalls:](self, "_updateCurrentCalls:", v4);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[TUCallServicesInterface _proxyCallWithCall:](self, "_proxyCallWithCall:", v10, (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "updateWithCall:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

void __68__TUCallServicesInterface_requestCurrentStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  void *v9;
  id v10;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__TUCallServicesInterface_requestCurrentStateWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E38A3068;
  v5 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v10 = v4;
  v6 = v3;
  objc_msgSend(v5, "performBlockOnQueue:", v7);

}

- (void)_setUpXPCConnection
{
  NSObject *v3;
  NSXPCConnection *v4;
  NSXPCConnection *xpcConnection;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  TUCallServicesInterface *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = self;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "%@: Setting up XPC connection", buf, 0xCu);
  }

  v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.telephonyutilities.callservicesdaemon.callstatecontroller"), 0);
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v4;

  objc_msgSend(MEMORY[0x1E0CB3B38], "callServicesServerXPCInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v6);

  objc_msgSend(MEMORY[0x1E0CB3B38], "callServicesClientXPCInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](self->_xpcConnection, "setExportedInterface:", v7);

  -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", self);
  objc_initWeak((id *)buf, self);
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __46__TUCallServicesInterface__setUpXPCConnection__block_invoke;
  v14[3] = &unk_1E38A13D0;
  objc_copyWeak(&v15, (id *)buf);
  -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v14);
  v9 = v8;
  v10 = 3221225472;
  v11 = __46__TUCallServicesInterface__setUpXPCConnection__block_invoke_18;
  v12 = &unk_1E38A13D0;
  objc_copyWeak(&v13, (id *)buf);
  -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", &v9);
  -[NSXPCConnection resume](self->_xpcConnection, "resume", v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)performBlockOnQueue:(id)a3
{
  -[TUCallServicesInterface performBlockOnQueue:andWait:](self, "performBlockOnQueue:andWait:", a3, 0);
}

- (TUCallServicesInterface)initWithQueue:(id)a3 callCenter:(id)a4
{
  return -[TUCallServicesInterface initWithQueue:callCenter:wantsCallNotifications:](self, "initWithQueue:callCenter:wantsCallNotifications:", a3, a4, 1);
}

- (void)performBlockOnQueue:(id)a3 andWait:(BOOL)a4
{
  _BOOL4 v4;
  void *specific;
  NSObject *v7;
  NSObject *v8;
  void (**block)(void);

  v4 = a4;
  block = (void (**)(void))a3;
  specific = dispatch_get_specific(-[TUCallServicesInterface queueContext](self, "queueContext"));
  if (specific == -[TUCallServicesInterface queueContext](self, "queueContext"))
  {
    block[2]();
  }
  else
  {
    -[TUCallServicesInterface queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v4)
      dispatch_sync(v7, block);
    else
      dispatch_async(v7, block);

  }
}

- (void)setServer:(id)a3
{
  objc_storeWeak((id *)&self->_server, a3);
}

- (void)fetchAnonymousXPCEndpoint:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Proxying fetchAnonymousXPCEndpoint", v8, 2u);
  }

  -[TUCallServicesInterface asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_51_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchAnonymousXPCEndpoint:", v4);

}

- (void)_updateCurrentCalls:(id)a3
{
  NSArray *v4;
  NSObject *v5;
  NSArray *currentCalls;
  NSArray *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSArray *v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint8_t v29[128];
  uint8_t buf[4];
  NSArray *v31;
  __int16 v32;
  NSArray *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    currentCalls = self->_currentCalls;
    *(_DWORD *)buf = 138412546;
    v31 = currentCalls;
    v32 = 2112;
    v33 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "_currentCalls: %@ currentCalls: %@", buf, 0x16u);
  }

  if (!-[NSArray isEqualToArray:](self->_currentCalls, "isEqualToArray:", v4) && self->_currentCalls != v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = v4;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v8);
          -[TUCallServicesInterface _proxyCallWithCall:](self, "_proxyCallWithCall:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v12));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v10);
    }

    -[TUCallServicesInterface setLocalProxyCalls:](self, "setLocalProxyCalls:", v7);
    if (-[TUCallServicesInterface isServerLocal](self, "isServerLocal"))
      v14 = v8;
    else
      v14 = v7;
    -[TUCallServicesInterface setCurrentCalls:](self, "setCurrentCalls:", v14);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v15 = self->_currentCalls;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v21;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v15);
          -[TUCallServicesInterface _registerCall:](self, "_registerCall:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19++), (_QWORD)v20);
        }
        while (v17 != v19);
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v17);
    }

  }
}

- (void)setLocalProxyCalls:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setCurrentCalls:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)requestCurrentStateWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  TUCallServicesInterface *v11;
  id v12;

  v4 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __68__TUCallServicesInterface_requestCurrentStateWithCompletionHandler___block_invoke;
  v10 = &unk_1E38A3090;
  v11 = self;
  v12 = v4;
  v5 = v4;
  v6 = _Block_copy(&v7);
  -[TUCallServicesInterface requestCurrentStateWithCompletionHandler:handleInitialState:](self, "requestCurrentStateWithCompletionHandler:handleInitialState:", v5, v6, v7, v8, v9, v10, v11);

}

- (void)requestCurrentStateWithCompletionHandler:(id)a3 handleInitialState:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v5 = a4;
  -[TUCallServicesInterface queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[TUCallServicesInterface setHasRequestedInitialState:](self, "setHasRequestedInitialState:", 1);
  TUDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "Requesting current state", buf, 2u);
  }

  -[TUCallServicesInterface callServicesClientCapabilities](self, "callServicesClientCapabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "save");

  if (-[TUCallServicesInterface isServerLocal](self, "isServerLocal"))
  {
    -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "requestInitialState:", v5);

  }
  else if (-[TUCallServicesInterface hasServerLaunched](self, "hasServerLaunched"))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __87__TUCallServicesInterface_requestCurrentStateWithCompletionHandler_handleInitialState___block_invoke;
    v13[3] = &unk_1E38A1448;
    v10 = v5;
    v14 = v10;
    -[TUCallServicesInterface asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "requestInitialState:", v10);

  }
  else
  {
    TUDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v12, OS_LOG_TYPE_DEFAULT, "CSD hasn't launched since boot so assuming no current calls exist", buf, 2u);
    }

    (*((void (**)(id, _QWORD))v5 + 2))(v5, MEMORY[0x1E0C9AA60]);
  }

}

- (void)setHasRequestedInitialState:(BOOL)a3
{
  self->_hasRequestedInitialState = a3;
}

- (BOOL)hasServerLaunched
{
  _BOOL4 v2;
  uint32_t state;
  uint32_t v5;
  NSObject *v6;
  uint64_t state64;
  uint8_t buf[4];
  uint32_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_hasServerLaunched)
    return 1;
  if (-[TUCallServicesInterface isServerLocal](self, "isServerLocal"))
  {
    v2 = 1;
LABEL_10:
    self->_hasServerLaunched = v2;
    return v2;
  }
  state64 = 0;
  state = notify_get_state(-[TUCallServicesInterface connectionRequestNotificationToken](self, "connectionRequestNotificationToken"), &state64);
  if (!state)
  {
    v2 = state64 != 0;
    goto LABEL_10;
  }
  v5 = state;
  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v10 = v5;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "[WARN] Bad status received attempting to get server launched state: %d", buf, 8u);
  }

  return self->_hasServerLaunched;
}

- (int)connectionRequestNotificationToken
{
  return self->_connectionRequestNotificationToken;
}

- (TUCallServicesClientCapabilities)callServicesClientCapabilities
{
  return self->_callServicesClientCapabilities;
}

- (void)setClientCapabilities:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Proxying setClientCapabilities through CSD for capabilities %@", (uint8_t *)&v8, 0xCu);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClientCapabilities:", v4);

}

- (TUCallServicesXPCServer)asynchronousServer
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[TUCallServicesInterface server](self, "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[TUCallServicesInterface xpcConnection](self, "xpcConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteObjectProxy");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (TUCallServicesXPCServer *)v5;
}

- (id)asynchronousServerWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[TUCallServicesInterface server](self, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[TUCallServicesInterface xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (NSXPCConnection)xpcConnection
{
  NSXPCConnection *xpcConnection;

  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    -[TUCallServicesInterface _setUpXPCConnection](self, "_setUpXPCConnection");
    xpcConnection = self->_xpcConnection;
  }
  return xpcConnection;
}

- (BOOL)isServerLocal
{
  void *v2;
  BOOL v3;

  -[TUCallServicesInterface server](self, "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (TUCallServicesXPCServer)server
{
  return (TUCallServicesXPCServer *)objc_loadWeakRetained((id *)&self->_server);
}

uint64_t __68__TUCallServicesInterface__ignorePendingServerDisconnectionHandlers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShouldHandleServerDisconnect:", 0);
}

- (TUCallServicesInterface)init
{

  return 0;
}

- (TUCallServicesInterface)initWithQueue:(id)a3 callCenter:(id)a4 wantsCallNotifications:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  TUCallServicesInterface *v11;
  TUCallServicesInterface *v12;
  TUFeatureFlags *v13;
  TUFeatureFlags *featureFlags;
  uint64_t v15;
  NSMapTable *uniqueProxyIdentifierToProxyCall;
  TUCallServicesClientCapabilities *v17;
  TUCallServicesClientCapabilities *callServicesClientCapabilities;
  void *v19;
  TUCallNotificationManager *v20;
  TUCallNotificationManager *callNotificationManager;
  NSObject *v22;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v27.receiver = self;
  v27.super_class = (Class)TUCallServicesInterface;
  v11 = -[TUCallServicesInterface init](&v27, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queue, a3);
    dispatch_queue_set_specific((dispatch_queue_t)v12->_queue, -[TUCallServicesInterface queueContext](v12, "queueContext"), -[TUCallServicesInterface queueContext](v12, "queueContext"), 0);
    objc_storeWeak((id *)&v12->_callCenter, v10);
    v13 = objc_alloc_init(TUFeatureFlags);
    featureFlags = v12->_featureFlags;
    v12->_featureFlags = v13;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v15 = objc_claimAutoreleasedReturnValue();
    uniqueProxyIdentifierToProxyCall = v12->_uniqueProxyIdentifierToProxyCall;
    v12->_uniqueProxyIdentifierToProxyCall = (NSMapTable *)v15;

    v17 = objc_alloc_init(TUCallServicesClientCapabilities);
    callServicesClientCapabilities = v12->_callServicesClientCapabilities;
    v12->_callServicesClientCapabilities = v17;

    -[TUCallServicesClientCapabilities setDelegate:](v12->_callServicesClientCapabilities, "setDelegate:", v12);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[TUCallNotificationManager initWithNotificationCenter:wantsCallNotifications:]([TUCallNotificationManager alloc], "initWithNotificationCenter:wantsCallNotifications:", v19, v5);
    callNotificationManager = v12->_callNotificationManager;
    v12->_callNotificationManager = v20;

    v12->_lastDaemonConnectTime = 0;
    objc_initWeak(&location, v12);
    -[TUCallServicesInterface queue](v12, "queue");
    v22 = objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __75__TUCallServicesInterface_initWithQueue_callCenter_wantsCallNotifications___block_invoke;
    v24[3] = &unk_1E38A1698;
    objc_copyWeak(&v25, &location);
    notify_register_dispatch("com.apple.telephonyutilities.callservicesdaemon.connectionrequest", &v12->_connectionRequestNotificationToken, v22, v24);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

  }
  return v12;
}

void __75__TUCallServicesInterface_initWithQueue_callCenter_wantsCallNotifications___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "com.apple.telephonyutilities.callservicesdaemon.connectionrequest";
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Handling %s by requesting current state", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setHasReceivedInitialState:", 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setLastDaemonConnectTime:", v4);

  objc_msgSend(WeakRetained, "_tearDownXPCConnection");
  objc_msgSend(WeakRetained, "handleServerReconnect");

}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TUCallServicesInterface currentCalls](self, "currentCalls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p calls=%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_connectionRequestNotificationToken);
  -[TUCallServicesInterface _tearDownXPCConnection](self, "_tearDownXPCConnection");
  dispatch_queue_set_specific((dispatch_queue_t)self->_queue, -[TUCallServicesInterface queueContext](self, "queueContext"), 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)TUCallServicesInterface;
  -[TUCallServicesInterface dealloc](&v3, sel_dealloc);
}

void __46__TUCallServicesInterface__setUpXPCConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  _QWORD v4[5];
  uint8_t buf[16];

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setShouldHandleServerDisconnect:", 1);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__TUCallServicesInterface__setUpXPCConnection__block_invoke_16;
  v4[3] = &unk_1E38A1360;
  v4[4] = WeakRetained;
  objc_msgSend(WeakRetained, "performBlockOnQueue:", v4);

}

uint64_t __46__TUCallServicesInterface__setUpXPCConnection__block_invoke_16(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Handling XPC connection invalidation", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "handleServerDisconnectIfNecessary");
  return objc_msgSend(*(id *)(a1 + 32), "_tearDownXPCConnection");
}

void __46__TUCallServicesInterface__setUpXPCConnection__block_invoke_18(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  _QWORD v4[5];
  uint8_t buf[16];

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setShouldHandleServerDisconnect:", 1);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__TUCallServicesInterface__setUpXPCConnection__block_invoke_19;
  v4[3] = &unk_1E38A1360;
  v4[4] = WeakRetained;
  objc_msgSend(WeakRetained, "performBlockOnQueue:", v4);

}

uint64_t __46__TUCallServicesInterface__setUpXPCConnection__block_invoke_19(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Handling XPC connection interruption", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "handleServerDisconnectIfNecessary");
}

- (void)_tearDownXPCConnection
{
  NSXPCConnection *xpcConnection;

  -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", 0);
  -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", 0);
  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

}

- (void)_registerCall:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setQueue:", v4);

  objc_msgSend(v5, "setCallServicesInterface:", self);
}

uint64_t __82__TUCallServicesInterface__updateCurrentCalls_withNotificationsUsingUpdatedCalls___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateComparativeCall");
}

- (id)_proxyCallWithCall:(id)a3
{
  id v4;
  void *v5;
  TUProxyCall *v6;
  TUProxyCall *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  TUProxyCall *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uniqueProxyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallServicesInterface _proxyCallWithUniqueProxyIdentifier:](self, "_proxyCallWithUniqueProxyIdentifier:", v5);
  v6 = (TUProxyCall *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = [TUProxyCall alloc];
    objc_msgSend(v4, "uniqueProxyIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[TUCall initWithUniqueProxyIdentifier:](v7, "initWithUniqueProxyIdentifier:", v8);

    -[TUProxyCall setIsVideo:](v6, "setIsVideo:", objc_msgSend(v4, "isVideo"));
    -[TUProxyCall setProxyCallActionsDelegate:](v6, "setProxyCallActionsDelegate:", self);
    TUDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "uniqueProxyIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v10;
      v16 = 2048;
      v17 = v6;
      _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "No cached call found for %@. Initialized new proxy call %p", (uint8_t *)&v14, 0x16u);

    }
    -[TUCallServicesInterface uniqueProxyIdentifierToProxyCall](self, "uniqueProxyIdentifierToProxyCall");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueProxyIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v6, v12);

  }
  return v6;
}

- (id)_proxyCallWithUniqueProxyIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[TUCallServicesInterface uniqueProxyIdentifierToProxyCall](self, "uniqueProxyIdentifierToProxyCall");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)registerCall:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[TUCallServicesInterface _registerCall:](self, "_registerCall:", v5);
}

- (void)tearDownXPCConnection
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[TUCallServicesInterface queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Asked to tear down XPC connection", v5, 2u);
  }

  -[TUCallServicesInterface _tearDownXPCConnection](self, "_tearDownXPCConnection");
}

void __87__TUCallServicesInterface_requestCurrentStateWithCompletionHandler_handleInitialState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __87__TUCallServicesInterface_requestCurrentStateWithCompletionHandler_handleInitialState___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __44__TUCallServicesInterface_fetchCurrentCalls__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __87__TUCallServicesInterface_requestCurrentStateWithCompletionHandler_handleInitialState___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "handleServerDisconnect");
}

void __44__TUCallServicesInterface_fetchCurrentCalls__block_invoke_25(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "_proxyCallWithCall:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setComparativeCall:", v8);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  objc_msgSend(*(id *)(a1 + 40), "_updateCurrentCalls:withNotificationsUsingUpdatedCalls:", *(_QWORD *)(a1 + 32), v2);

}

- (void)handleServerReconnect
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[TUCallServicesInterface setHasServerLaunched:](self, "setHasServerLaunched:", 1);
  -[TUCallServicesInterface requestCurrentStateWithCompletionHandler:](self, "requestCurrentStateWithCompletionHandler:", 0);
  -[TUCallServicesInterface anonymousXPCEndpoint](self, "anonymousXPCEndpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TUCallServicesInterface anonymousXPCEndpoint](self, "anonymousXPCEndpoint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallServicesInterface registerAnonymousXPCEndpoint:](self, "registerAnonymousXPCEndpoint:", v4);

  }
  -[TUCallServicesInterface localRouteController](self, "localRouteController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleServerReconnect");

  -[TUCallServicesInterface pairedHostDeviceRouteController](self, "pairedHostDeviceRouteController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleServerReconnect");

}

- (void)handleServerDisconnectIfNecessary
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[TUCallServicesInterface queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[TUCallServicesInterface shouldHandleServerDisconnect](self, "shouldHandleServerDisconnect"))
  {
    -[TUCallServicesInterface handleServerDisconnect](self, "handleServerDisconnect");
  }
  else
  {
    TUDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring server disconnect", v5, 2u);
    }

  }
}

- (void)handleServerDisconnect
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  TUCallServicesInterface *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[TUCallServicesInterface queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[TUCallServicesInterface hasReceivedInitialState](self, "hasReceivedInitialState"))
  {
    -[TUCallServicesInterface _ignorePendingServerDisconnectionHandlers](self, "_ignorePendingServerDisconnectionHandlers");
    v4 = (void *)MEMORY[0x1E0C99DE8];
    -[TUCallServicesInterface currentCalls](self, "currentCalls");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v17 = self;
    -[TUCallServicesInterface currentCalls](self, "currentCalls");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
          TUDefaultLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v12;
            _os_log_error_impl(&dword_19A50D000, v13, OS_LOG_TYPE_ERROR, "Disconnecting call with TUCallDisconnectedReasonComponentCrashed: %@", buf, 0xCu);
          }

          +[TUProxyCall proxyCallWithCall:](TUProxyCall, "proxyCallWithCall:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setCallDisconnectedDueToComponentCrash");
          objc_msgSend(v6, "addObject:", v14);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v9);
    }

    -[TUCallServicesInterface _handleCurrentCallsChanged:callsDisconnected:](v17, "_handleCurrentCallsChanged:callsDisconnected:", MEMORY[0x1E0C9AA60], v6);
    -[TUCallServicesInterface resetCallProvisionalStates](v17, "resetCallProvisionalStates");
    -[TUCallServicesInterface localRouteController](v17, "localRouteController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleServerDisconnect");

    -[TUCallServicesInterface pairedHostDeviceRouteController](v17, "pairedHostDeviceRouteController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleServerDisconnect");

  }
}

- (id)dialWithRequest:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  TUProxyCall *v16;
  void *v17;
  TUProxyCall *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  TUDynamicCallDisplayContext *v28;
  void *v29;
  void *v30;
  TUDynamicCallDisplayContext *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  id v41;
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[TUCallServicesInterface queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  TUDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v43 = v7;
    _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "Proxying dial through CSD for %@", buf, 0xCu);
  }

  if (v8)
  {
    v11 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __54__TUCallServicesInterface_dialWithRequest_completion___block_invoke;
    v40[3] = &unk_1E38A30E0;
    v40[4] = self;
    v12 = v8;
    v41 = v12;
    -[TUCallServicesInterface asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v40);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v11;
    v38[1] = 3221225472;
    v38[2] = __54__TUCallServicesInterface_dialWithRequest_completion___block_invoke_27;
    v38[3] = &unk_1E38A3130;
    v38[4] = self;
    v39 = v12;
    objc_msgSend(v13, "dialWithRequest:reply:", v7, v38);

    v14 = 0;
  }
  else
  {
    if (-[TUCallServicesInterface isServerLocal](self, "isServerLocal"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Local daemon delegate must pass in a completion block"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("** TUAssertion failure: %@"), v15);

      if (_TUAssertShouldCrashApplication())
      {
        if (-[TUCallServicesInterface isServerLocal](self, "isServerLocal"))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUCallServicesInterface.m"), 530, CFSTR("Local daemon delegate must pass in a completion block"));

        }
      }
    }
    v16 = [TUProxyCall alloc];
    objc_msgSend(v7, "uniqueProxyIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[TUCall initWithUniqueProxyIdentifier:](v16, "initWithUniqueProxyIdentifier:", v17);

    -[TUCallServicesInterface registerCall:](self, "registerCall:", v18);
    -[TUProxyCall setProxyCallActionsDelegate:](v18, "setProxyCallActionsDelegate:", self);
    objc_msgSend(v7, "provider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUProxyCall setProvider:](v18, "setProvider:", v19);

    objc_msgSend(v7, "handle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUProxyCall setHandle:](v18, "setHandle:", v20);

    -[TUProxyCall handle](v18, "handle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0C99E60];
    if (v21)
    {
      -[TUProxyCall handle](v18, "handle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setWithObject:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUProxyCall setRemoteParticipantHandles:](v18, "setRemoteParticipantHandles:", v24);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUProxyCall setRemoteParticipantHandles:](v18, "setRemoteParticipantHandles:", v23);
    }

    -[TUProxyCall setCallStatus:](v18, "setCallStatus:", 3);
    objc_msgSend(v7, "audioSourceIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCall setSourceIdentifier:](v18, "setSourceIdentifier:", v25);

    objc_msgSend(v7, "localSenderIdentityUUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUProxyCall setLocalSenderIdentityUUID:](v18, "setLocalSenderIdentityUUID:", v26);

    objc_msgSend(v7, "localSenderIdentityAccountUUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUProxyCall setLocalSenderIdentityAccountUUID:](v18, "setLocalSenderIdentityAccountUUID:", v27);

    -[TUProxyCall setOutgoing:](v18, "setOutgoing:", 1);
    -[TUProxyCall setVoicemail:](v18, "setVoicemail:", objc_msgSend(v7, "dialType") == 2);
    -[TUProxyCall setHostedOnCurrentDevice:](v18, "setHostedOnCurrentDevice:", objc_msgSend(v7, "hostOnCurrentDevice"));
    -[TUProxyCall setEndpointOnCurrentDevice:](v18, "setEndpointOnCurrentDevice:", objc_msgSend(v7, "endpointOnCurrentDevice"));
    -[TUProxyCall setIsVideo:](v18, "setIsVideo:", objc_msgSend(v7, "isVideo"));
    -[TUProxyCall setIsSendingVideo:](v18, "setIsSendingVideo:", objc_msgSend(v7, "isVideo"));
    -[TUProxyCall setEmergency:](v18, "setEmergency:", objc_msgSend(v7, "dialType") == 1);
    -[TUProxyCall setSOS:](v18, "setSOS:", objc_msgSend(v7, "isSOS"));
    -[TUProxyCall setTtyType:](v18, "setTtyType:", TUCallTTYTypeForTUDialRequestTTYType(objc_msgSend(v7, "ttyType")));
    -[TUProxyCall setShouldSuppressInCallUI:](v18, "setShouldSuppressInCallUI:", objc_msgSend(v7, "shouldSuppressInCallUI"));
    -[TUProxyCall setOriginatingUIType:](v18, "setOriginatingUIType:", objc_msgSend(v7, "originatingUIType"));
    v28 = [TUDynamicCallDisplayContext alloc];
    objc_msgSend(v7, "contactIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallServicesInterface queue](self, "queue");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[TUDynamicCallDisplayContext initWithCall:contactIdentifier:serialQueue:](v28, "initWithCall:contactIdentifier:serialQueue:", v18, v29, v30);

    -[TUProxyCall setDisplayContext:](v18, "setDisplayContext:", v31);
    -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)-[TUDynamicCallDisplayContext copy](v31, "copy");
    objc_msgSend(v32, "dialWithRequest:displayContext:", v7, v33);

    -[TUCallServicesInterface _proxyCallWithCall:](self, "_proxyCallWithCall:", v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallServicesInterface currentCalls](self, "currentCalls");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "arrayByAddingObject:", v18);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallServicesInterface _handleCurrentCallsChanged:callsDisconnected:](self, "_handleCurrentCallsChanged:callsDisconnected:", v35, MEMORY[0x1E0C9AA60]);

  }
  return v14;
}

void __54__TUCallServicesInterface_dialWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__TUCallServicesInterface_dialWithRequest_completion___block_invoke_2;
  v6[3] = &unk_1E38A1838;
  v7 = v3;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "performBlockOnQueue:", v6);

}

uint64_t __54__TUCallServicesInterface_dialWithRequest_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __54__TUCallServicesInterface_dialWithRequest_completion___block_invoke_2_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __54__TUCallServicesInterface_dialWithRequest_completion___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  void *v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__TUCallServicesInterface_dialWithRequest_completion___block_invoke_2_28;
  v11[3] = &unk_1E38A3108;
  v8 = *(void **)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v12 = v5;
  v13 = v8;
  v14 = v6;
  v15 = v7;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v8, "performBlockOnQueue:", v11);

}

uint64_t __54__TUCallServicesInterface_dialWithRequest_completion___block_invoke_2_28(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2 && objc_msgSend(v2, "status") == 6)
  {
    v4 = *(void **)(a1 + 40);
    v3 = *(_QWORD *)(a1 + 48);
    v9[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_handleCurrentCallsChanged:callsDisconnected:", v3, v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_handleCurrentCallsChanged:callsDisconnected:", *(_QWORD *)(a1 + 48), MEMORY[0x1E0C9AA60]);
  }
  if (!*(_QWORD *)(a1 + 32))
  {
    TUDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "[WARN] Passing nil call to dialWithRequest completion block", v8, 2u);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (id)joinConversationWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  TUProxyCall *v10;
  TUProxyCall *v11;
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
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  int v30;
  int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  TUDynamicCallDisplayContext *v41;
  void *v42;
  TUDynamicCallDisplayContext *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  _BYTE v57[10];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v57 = v4;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Proxying joinConversationWithRequest request: %@", buf, 0xCu);
  }

  objc_msgSend(v4, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallServicesInterface _proxyCallWithUniqueProxyIdentifier:](self, "_proxyCallWithUniqueProxyIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
  }
  else
  {
    v11 = [TUProxyCall alloc];
    objc_msgSend(v4, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[TUCall initWithUniqueProxyIdentifier:](v11, "initWithUniqueProxyIdentifier:", v13);

  }
  -[TUCallServicesInterface registerCall:](self, "registerCall:", v10);
  -[TUProxyCall setProxyCallActionsDelegate:](v10, "setProxyCallActionsDelegate:", self);
  -[TUCallServicesInterface callCenter](self, "callCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "providerManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUCallServicesInterface featureFlags](self, "featureFlags");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "groupFacetimeAsAServiceEnabled") & 1) != 0)
  {
    objc_msgSend(v4, "provider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "providerWithIdentifier:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v15, "faceTimeProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[TUProxyCall setProvider:](v10, "setProvider:", v19);
  -[TUProxyCall setCallStatus:](v10, "setCallStatus:", 3);
  -[TUProxyCall setOutgoing:](v10, "setOutgoing:", 1);
  -[TUProxyCall setHostedOnCurrentDevice:](v10, "setHostedOnCurrentDevice:", 1);
  -[TUProxyCall setEndpointOnCurrentDevice:](v10, "setEndpointOnCurrentDevice:", 1);
  if ((objc_msgSend(v4, "isVideo") & 1) != 0)
  {
    objc_msgSend(v4, "provider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUProxyCall setIsVideo:](v10, "setIsVideo:", objc_msgSend(v20, "supportsVideo"));

  }
  else
  {
    -[TUProxyCall setIsVideo:](v10, "setIsVideo:", 0);
  }
  -[TUProxyCall setShouldSuppressInCallUI:](v10, "setShouldSuppressInCallUI:", objc_msgSend(v4, "shouldSuppressInCallUI"));
  -[TUProxyCall setWantsStagingArea:](v10, "setWantsStagingArea:", objc_msgSend(v4, "wantsStagingArea"));
  objc_msgSend(v4, "callerID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "senderIdentityForHandle:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "UUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUProxyCall setLocalSenderIdentityUUID:](v10, "setLocalSenderIdentityUUID:", v23);

  -[TUProxyCall setOriginatingUIType:](v10, "setOriginatingUIType:", objc_msgSend(v4, "originatingUIType"));
  if ((objc_msgSend(v4, "requestToShareScreen") & 1) != 0)
    v24 = 2;
  else
    v24 = objc_msgSend(v4, "requestToShareMyScreen");
  -[TUProxyCall setScreenSharingIntention:](v10, "setScreenSharingIntention:", v24);
  objc_msgSend(v4, "remoteMembers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v15;
  if (objc_msgSend(v25, "count") == 1)
  {
    objc_msgSend(v4, "conversationLink");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      -[TUProxyCall setConversation:](v10, "setConversation:", 1);
    }
    else
    {
      objc_msgSend(v4, "otherInvitedHandles");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "count"))
      {
        -[TUProxyCall setConversation:](v10, "setConversation:", 1);
      }
      else
      {
        objc_msgSend(v4, "provider");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "isDefaultProvider"))
        {
          objc_msgSend(v4, "participantAssociation");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[TUProxyCall setConversation:](v10, "setConversation:", v48 != 0);

        }
        else
        {
          -[TUProxyCall setConversation:](v10, "setConversation:", 1);
        }

      }
    }

  }
  else
  {
    -[TUProxyCall setConversation:](v10, "setConversation:", 1);
  }

  if (v9)
  {
    objc_msgSend(v4, "setVideoEnabled:", -[TUProxyCall isSendingVideo](v10, "isSendingVideo"));
    objc_msgSend(v4, "setUplinkMuted:", -[TUProxyCall isUplinkMuted](v10, "isUplinkMuted"));
    TUDefaultLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = objc_msgSend(v4, "isVideoEnabled");
      v31 = objc_msgSend(v4, "isUplinkMuted");
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v57 = v30;
      *(_WORD *)&v57[4] = 1024;
      *(_DWORD *)&v57[6] = v31;
      _os_log_impl(&dword_19A50D000, v29, OS_LOG_TYPE_DEFAULT, "Updated joinConversationWithRequest videoEnable=%d uplinkMuted=%d", buf, 0xEu);
    }

  }
  -[TUProxyCall setIsSendingVideo:](v10, "setIsSendingVideo:", objc_msgSend(v4, "isVideoEnabled", v9));
  -[TUProxyCall setUplinkMuted:](v10, "setUplinkMuted:", objc_msgSend(v4, "isUplinkMuted"));
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v4, "remoteMembers");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v52 != v36)
          objc_enumerationMutation(v33);
        objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "handle");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addObject:", v38);

      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v35);
  }

  -[TUProxyCall setRemoteParticipantHandles:](v10, "setRemoteParticipantHandles:", v32);
  -[TUProxyCall remoteParticipantHandles](v10, "remoteParticipantHandles");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "anyObject");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUProxyCall setHandle:](v10, "setHandle:", v40);

  v41 = [TUDynamicCallDisplayContext alloc];
  -[TUCallServicesInterface queue](self, "queue");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[TUDynamicCallDisplayContext initWithCall:contactIdentifier:serialQueue:](v41, "initWithCall:contactIdentifier:serialQueue:", v10, 0, v42);

  -[TUProxyCall setDisplayContext:](v10, "setDisplayContext:", v43);
  -[TUCallServicesInterface currentCalls](self, "currentCalls");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "arrayByAddingObject:", v10);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallServicesInterface _handleCurrentCallsChanged:callsDisconnected:](self, "_handleCurrentCallsChanged:callsDisconnected:", v45, MEMORY[0x1E0C9AA60]);

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "joinConversationWithRequest:", v4);

  return v10;
}

- (void)reportLocalPreviewStoppedForCallWithUniqueProxyIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Proxying reportLocalPreviewStopped for %@", (uint8_t *)&v8, 0xCu);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reportLocalPreviewStoppedForCallWithUniqueProxyIdentifier:", v4);

}

- (void)saveCustomGreeting:(id)a3 forAccountUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];

  v6 = a4;
  v7 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  TUDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "Proxying saveCustomGreeting", v11, 2u);
  }

  -[TUCallServicesInterface asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_33);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "saveCustomSandboxedURLGreeting:forAccountUUID:", v7, v6);

}

void __61__TUCallServicesInterface_saveCustomGreeting_forAccountUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __61__TUCallServicesInterface_saveCustomGreeting_forAccountUUID___block_invoke_cold_1();

}

- (id)customGreetingForAccountUUID:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint8_t buf[8];
  uint8_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Proxying defaultGreetingForAccountUUID:", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v12 = buf;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__9;
  v15 = __Block_byref_object_dispose__9;
  v16 = 0;
  -[TUCallServicesInterface synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", &__block_literal_global_41_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__TUCallServicesInterface_customGreetingForAccountUUID___block_invoke_42;
  v10[3] = &unk_1E38A3158;
  v10[4] = buf;
  objc_msgSend(v7, "customSandboxedURLGreetingForAccountUUID:withCompletion:", v4, v10);

  v8 = *((id *)v12 + 5);
  _Block_object_dispose(buf, 8);

  return v8;
}

void __56__TUCallServicesInterface_customGreetingForAccountUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __56__TUCallServicesInterface_customGreetingForAccountUUID___block_invoke_cold_1();

}

void __56__TUCallServicesInterface_customGreetingForAccountUUID___block_invoke_42(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "URL");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)deleteCustomGreetingForAccountUUID:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Proxying deleteCustomGreetingForAccountUUID", v8, 2u);
  }

  -[TUCallServicesInterface asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_44_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deleteCustomGreetingForAccountUUID:", v4);

}

void __62__TUCallServicesInterface_deleteCustomGreetingForAccountUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __61__TUCallServicesInterface_saveCustomGreeting_forAccountUUID___block_invoke_cold_1();

}

- (id)defaultGreeting
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint8_t buf[8];
  uint8_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  -[TUCallServicesInterface queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Proxying defaultGreeting", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v10 = buf;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__9;
  v13 = __Block_byref_object_dispose__9;
  v14 = 0;
  -[TUCallServicesInterface synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", &__block_literal_global_45);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__TUCallServicesInterface_defaultGreeting__block_invoke_46;
  v8[3] = &unk_1E38A3158;
  v8[4] = buf;
  objc_msgSend(v5, "defaultGreeting:", v8);

  v6 = *((id *)v10 + 5);
  _Block_object_dispose(buf, 8);

  return v6;
}

void __42__TUCallServicesInterface_defaultGreeting__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __42__TUCallServicesInterface_defaultGreeting__block_invoke_cold_1();

}

void __42__TUCallServicesInterface_defaultGreeting__block_invoke_46(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "URL");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)fetchCurrentCallUpdates
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint8_t buf[8];
  uint8_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  -[TUCallServicesInterface queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Proxying fetchCurrentCallUpdates", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v10 = buf;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__9;
  v13 = __Block_byref_object_dispose__9;
  v14 = 0;
  -[TUCallServicesInterface synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", &__block_literal_global_47_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__TUCallServicesInterface_fetchCurrentCallUpdates__block_invoke_48;
  v8[3] = &unk_1E38A2760;
  v8[4] = buf;
  objc_msgSend(v5, "fetchCurrentCallUpdates:", v8);

  v6 = (void *)objc_msgSend(*((id *)v10 + 5), "copy");
  _Block_object_dispose(buf, 8);

  return v6;
}

void __50__TUCallServicesInterface_fetchCurrentCallUpdates__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __50__TUCallServicesInterface_fetchCurrentCallUpdates__block_invoke_cold_1();

}

void __50__TUCallServicesInterface_fetchCurrentCallUpdates__block_invoke_48(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)screenWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Proxying screenWithRequest", v8, 2u);
  }

  -[TUCallServicesInterface asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_49_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "screenWithRequest:", v4);

}

void __45__TUCallServicesInterface_screenWithRequest___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __45__TUCallServicesInterface_screenWithRequest___block_invoke_cold_1();

}

- (void)performRecordingRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Proxying perform recording request %@", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__TUCallServicesInterface_performRecordingRequest_completion___block_invoke;
  v11[3] = &unk_1E38A1448;
  v12 = v7;
  v9 = v7;
  -[TUCallServicesInterface asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "performRecordingRequest:completion:", v6, v9);

}

void __62__TUCallServicesInterface_performRecordingRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__TUCallServicesInterface_performRecordingRequest_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registerAnonymousXPCEndpoint:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[TUCallServicesInterface setAnonymousXPCEndpoint:](self, "setAnonymousXPCEndpoint:", v4);
  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Proxying registerAnonymousXPCEndpoint", v8, 2u);
  }

  -[TUCallServicesInterface asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_50_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerAnonymousXPCEndpoint:", v4);

}

void __56__TUCallServicesInterface_registerAnonymousXPCEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __56__TUCallServicesInterface_registerAnonymousXPCEndpoint___block_invoke_cold_1();

}

void __53__TUCallServicesInterface_fetchAnonymousXPCEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __53__TUCallServicesInterface_fetchAnonymousXPCEndpoint___block_invoke_cold_1();

}

- (void)answerCallWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Proxying answer through CSD for %@", (uint8_t *)&v8, 0xCu);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "answerCallWithRequest:", v4);

}

- (void)holdCallWithUniqueProxyIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Proxying hold through CSD for %@", (uint8_t *)&v8, 0xCu);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "holdCallWithUniqueProxyIdentifier:", v4);

}

- (void)unholdCallWithUniqueProxyIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Proxying unhold through CSD for %@", (uint8_t *)&v8, 0xCu);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unholdCallWithUniqueProxyIdentifier:", v4);

}

- (void)requestVideoUpgradeForCallWithUniqueProxyIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Proxying upgrade video call through CSD for %@", (uint8_t *)&v8, 0xCu);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestVideoUpgradeForCallWithUniqueProxyIdentifier:", v4);

}

- (void)disconnectCallWithUniqueProxyIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Proxying disconnect through CSD for %@", (uint8_t *)&v8, 0xCu);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "disconnectCallWithUniqueProxyIdentifier:", v4);

}

- (void)groupCallWithUniqueProxyIdentifier:(id)a3 withOtherCallWithUniqueProxyIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TUCallServicesInterface queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  TUDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "Proxying groupCall through CSD for %@ and %@", (uint8_t *)&v11, 0x16u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "groupCallWithUniqueProxyIdentifier:withOtherCallWithUniqueProxyIdentifier:", v6, v7);

}

- (void)ungroupCallWithUniqueProxyIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Proxying ungroupCall through CSD for %@", (uint8_t *)&v8, 0xCu);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ungroupCallWithUniqueProxyIdentifier:", v4);

}

- (void)swapCalls
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[TUCallServicesInterface queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Proxying swapCalls through CSD", v6, 2u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "swapCalls");

}

- (void)playDTMFToneForCallWithUniqueProxyIdentifier:(id)a3 key:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a4;
  v6 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Proxying playDTMFToneForCall:key: through CSD", v10, 2u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "playDTMFToneForCallWithUniqueProxyIdentifier:key:", v6, v4);

}

- (void)disconnectCurrentCallAndActivateHeld
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[TUCallServicesInterface queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Proxying disconnectCurrentCallAndActivateHeld through CSD", v6, 2u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "disconnectCurrentCallAndActivateHeld");

}

- (void)disconnectAllCalls
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[TUCallServicesInterface queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Proxying disconnectAllCalls through CSD", v6, 2u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "disconnectAllCalls");

}

- (void)setTTYType:(int)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[TUCallServicesInterface queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Proxying setTTYType:forCall: through CSD", v10, 2u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTTYType:forCallWithUniqueProxyIdentifier:", v4, v6);

}

- (void)setLiveVoicemailUnavailableReason:(int64_t)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v6 = a4;
  -[TUCallServicesInterface queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Proxying setLiveVoicemailUnavailableReason:forCall: through CSD", v10, 2u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLiveVoicemailUnavailableReason:forCallWithUniqueProxyIdentifier:", a3, v6);

}

- (void)pullRelayingCallsFromClient
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[TUCallServicesInterface queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Proxying pullRelayingCallsFromClient through CSD", v6, 2u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pullRelayingCallsFromClient");

}

- (void)pullRelayingGFTCallsFromClientIfNecessary
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[TUCallServicesInterface queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Proxying pullRelayingGFTCallsFromClientIfNecessary through CSD", v6, 2u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pullRelayingGFTCallsFromClientIfNecessary");

}

- (void)pushRelayingCallsToHostWithSourceIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Proxying pushRelayingCallsToHost through CSD", v8, 2u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushRelayingCallsToHostWithSourceIdentifier:", v4);

}

- (void)pullCallFromClientUsingHandoffActivityUserInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  const __CFString *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[5];
  id v18;
  uint8_t buf[4];
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  TUDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("non-nil");
    if (!v6)
      v10 = CFSTR("nil");
    *(_DWORD *)buf = 138412290;
    v20 = v10;
    _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "Proxying pullCallFromClientUsingHandoffActivityUserInfo through CSD with completion block (%@)", buf, 0xCu);
  }

  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__TUCallServicesInterface_pullCallFromClientUsingHandoffActivityUserInfo_completion___block_invoke;
  aBlock[3] = &unk_1E38A3130;
  aBlock[4] = self;
  v18 = v6;
  v12 = v6;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __85__TUCallServicesInterface_pullCallFromClientUsingHandoffActivityUserInfo_completion___block_invoke_3;
  v15[3] = &unk_1E38A1448;
  v16 = _Block_copy(aBlock);
  v13 = v16;
  -[TUCallServicesInterface asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pullCallFromClientUsingHandoffActivityUserInfo:reply:", v7, v13);

}

void __85__TUCallServicesInterface_pullCallFromClientUsingHandoffActivityUserInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  void *v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__TUCallServicesInterface_pullCallFromClientUsingHandoffActivityUserInfo_completion___block_invoke_2;
  v11[3] = &unk_1E38A2100;
  v8 = *(void **)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v12 = v6;
  v13 = v8;
  v14 = v5;
  v15 = v7;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v8, "performBlockOnQueue:", v11);

}

uint64_t __85__TUCallServicesInterface_pullCallFromClientUsingHandoffActivityUserInfo_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    objc_msgSend(*(id *)(a1 + 40), "_handleCurrentCallsChanged:callsDisconnected:", v2, MEMORY[0x1E0C9AA60]);
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(_QWORD *)(a1 + 48) != 0);
  return result;
}

void __85__TUCallServicesInterface_pullCallFromClientUsingHandoffActivityUserInfo_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __85__TUCallServicesInterface_pullCallFromClientUsingHandoffActivityUserInfo_completion___block_invoke_3_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)pullPersistedChannel:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Proxying pullPersistedChannel through CSD", v8, 2u);
  }

  -[TUCallServicesInterface synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", &__block_literal_global_56);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pullPersistedChannel:", v4);

}

void __48__TUCallServicesInterface_pullPersistedChannel___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __85__TUCallServicesInterface_pullCallFromClientUsingHandoffActivityUserInfo_completion___block_invoke_3_cold_1();

}

- (void)startTransmissionForBargeCall:(id)a3 sourceIsHandsfreeAccessory:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a4;
  v6 = a3;
  TUDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "Proxying start transmission through CSD", v9, 2u);
  }

  -[TUCallServicesInterface synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", &__block_literal_global_57_1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startTransmissionForBargeCall:sourceIsHandsfreeAccessory:", v6, v4);

}

void __84__TUCallServicesInterface_startTransmissionForBargeCall_sourceIsHandsfreeAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __85__TUCallServicesInterface_pullCallFromClientUsingHandoffActivityUserInfo_completion___block_invoke_3_cold_1();

}

- (void)stopTransmissionForBargeCall:(id)a3 sourceIsHandsfreeAccessory:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a4;
  v6 = a3;
  TUDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "Proxying stop transmission through CSD", v9, 2u);
  }

  -[TUCallServicesInterface synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", &__block_literal_global_58);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stopTransmissionForBargeCall:sourceIsHandsfreeAccessory:", v6, v4);

}

void __83__TUCallServicesInterface_stopTransmissionForBargeCall_sourceIsHandsfreeAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __85__TUCallServicesInterface_pullCallFromClientUsingHandoffActivityUserInfo_completion___block_invoke_3_cold_1();

}

- (void)pushHostedCallsToDestination:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Proxying pushHostedCallsToDestination through CSD for destination %@", (uint8_t *)&v8, 0xCu);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushHostedCallsToDestination:", v4);

}

- (void)pullHostedCallsFromPairedHostDevice
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[TUCallServicesInterface queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Proxying pullHostedCallsFromPairedHostDevice through CSD", v6, 2u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pullHostedCallsFromPairedHostDevice");

}

- (void)sendHardPauseDigitsForCallWithUniqueProxyIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Proxying sendHardPauseDigits through CSD", v8, 2u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendHardPauseDigitsForCallWithUniqueProxyIdentifier:", v4);

}

- (void)updateCallWithProxy:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Proxying updateCallWithProxy through CSD for proxy call %@", (uint8_t *)&v8, 0xCu);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateCallWithProxy:", v4);

}

- (void)enteredForegroundForCallWithUniqueProxyIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Proxying enteredForegroundForCallWithUniqueProxyIdentifier through CSD for uniqueProxyIdentifier %@", (uint8_t *)&v8, 0xCu);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enteredForegroundForCallWithUniqueProxyIdentifier:", v4);

}

- (void)willEnterBackgroundForAllCalls
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[TUCallServicesInterface queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Proxying willEnterBackgroundForAllCalls through CSD", v6, 2u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willEnterBackgroundForAllCalls");

}

- (void)enteredBackgroundForAllCalls
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[TUCallServicesInterface queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Proxying enteredBackgroundForAllCalls through CSD", v6, 2u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enteredBackgroundForAllCalls");

}

- (void)setRemoteVideoPresentationSizeForCallWithUniqueProxyIdentifier:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;
  NSSize v17;

  height = a4.height;
  width = a4.width;
  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  TUDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v17.width = width;
    v17.height = height;
    NSStringFromSize(v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "Proxying setRemoteVideoPresentationSizeForCallWithUniqueProxyIdentifier through CSD for uniqueProxyIdentifier %@, size %@", (uint8_t *)&v12, 0x16u);

  }
  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRemoteVideoPresentationSizeForCallWithUniqueProxyIdentifier:size:", v7, width, height);

}

- (void)setRemoteVideoPresentationStateForCallWithUniqueProxyIdentifier:(id)a3 presentationState:(int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v4 = *(_QWORD *)&a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 1024;
    v13 = v4;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Proxying setRemoteVideoPresentationStateForCallWithUniqueProxyIdentifier through CSD for uniqueProxyIdentifier %@, presentationState %d", (uint8_t *)&v10, 0x12u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRemoteVideoPresentationStateForCallWithUniqueProxyIdentifier:presentationState:", v6, v4);

}

- (void)setScreenShareAttributesForCallWithUniqueProxyIdentifier:(id)a3 attributes:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TUCallServicesInterface queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  TUDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "Proxying setScreenShareAttributesForCallWithUniqueProxyIdentifier through CSD for uniqueProxyIdentifier %@, screenShareAttributes %@", (uint8_t *)&v11, 0x16u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setScreenShareAttributesForCallWithUniqueProxyIdentifier:attributes:", v6, v7);

}

- (void)setSharingScreen:(BOOL)a3 attributes:(id)a4 forCallWithUniqueProxyIdentifier:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  _DWORD v13[2];
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v6 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[TUCallServicesInterface queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  TUDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109634;
    v13[1] = v6;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_19A50D000, v11, OS_LOG_TYPE_DEFAULT, "Proxying setSharingScreen: %d through CSD for uniqueProxyIdentifier %@, screenShareAttributes %@", (uint8_t *)v13, 0x1Cu);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSharingScreen:attributes:forCallWithUniqueProxyIdentifier:", v6, v8, v9);

}

- (void)setBluetoothAudioFormatForCallWithUniqueProxyIdentifier:(id)a3 bluetoothAudioFormat:(int64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 2048;
    v13 = a4;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Proxying setBluetoothAudioFormatForCallWithUniqueProxyIdentifier through CSD for uniqueProxyIdentifier %@, bluetoothAudioFormat %ld", (uint8_t *)&v10, 0x16u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBluetoothAudioFormatForCallWithUniqueProxyIdentifier:bluetoothAudioFormat:", v6, a4);

}

- (void)sendMMIOrUSSDCodeWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Sending MMI/USSD code through CSD for %@", (uint8_t *)&v8, 0xCu);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendMMIOrUSSDCodeWithRequest:", v4);

}

- (void)setUplinkMuted:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  id v12;
  uint64_t v13;

  v4 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[TUCallServicesInterface queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = v4;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Proxying setUplinkMuted=%d for %@", (uint8_t *)v10, 0x12u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUplinkMuted:forCallWithUniqueProxyIdentifier:", v4, v6);

}

- (void)setDownlinkMuted:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  id v12;
  uint64_t v13;

  v4 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[TUCallServicesInterface queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = v4;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Proxying setDownlinkMuted=%d for %@", (uint8_t *)v10, 0x12u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDownlinkMuted:forCallWithUniqueProxyIdentifier:", v4, v6);

}

- (void)addScreenSharingType:(unint64_t)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  unint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[TUCallServicesInterface queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218242;
    v11 = a3;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Proxying addScreenSharingType=%lu for %@", (uint8_t *)&v10, 0x16u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addScreenSharingType:forCallWithUniqueProxyIdentifier:", a3, v6);

}

- (void)setIsSendingVideo:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  id v12;
  uint64_t v13;

  v4 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[TUCallServicesInterface queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = v4;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Proxying setIsSendingVideo=%d for %@", (uint8_t *)v10, 0x12u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsSendingVideo:forCallWithUniqueProxyIdentifier:", v4, v6);

}

- (void)setMixesVoiceWithMedia:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  id v12;
  uint64_t v13;

  v4 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[TUCallServicesInterface queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = v4;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Proxying setMixesVoiceWithMedia=%d for %@", (uint8_t *)v10, 0x12u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMixesVoiceWithMedia:forCallWithUniqueProxyIdentifier:", v4, v6);

}

- (void)setSharingScreen:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  id v12;
  uint64_t v13;

  v4 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[TUCallServicesInterface queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = v4;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Proxying setSharingScreen=%d for %@", (uint8_t *)v10, 0x12u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSharingScreen:forCallWithUniqueProxyIdentifier:", v4, v6);

}

- (void)setHasEmergencyVideoStream:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  id v12;
  uint64_t v13;

  v4 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[TUCallServicesInterface queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = v4;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Proxying setHasEmergencyVideoStream=%d for %@", (uint8_t *)v10, 0x12u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHasEmergencyVideoStream:forCallWithUniqueProxyIdentifier:", v4, v6);

}

- (void)setEmergencyMediaItems:(id)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TUCallServicesInterface queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  TUDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "Proxying setEmergencyMediaItems=%@ for %@", (uint8_t *)&v11, 0x16u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEmergencyMediaItems:forCallWithUniqueProxyIdentifier:", v6, v7);

}

- (void)shouldSuppressInCallStatusBar:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  -[TUCallServicesInterface queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Proxying shouldSuppressInCallStatusBar=%d through CSD", (uint8_t *)v8, 8u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shouldSuppressInCallStatusBar:", v3);

}

- (void)shouldAllowRingingCallStatusIndicator:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  -[TUCallServicesInterface queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Proxying shouldAllowRingingCallStatusIndicator=%d through CSD", (uint8_t *)v8, 8u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shouldAllowRingingCallStatusIndicator:", v3);

}

- (void)activateInCallUIWithActivityContinuationIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Proying activateInCallUIWithActivityContinuationIdentifier=%@", (uint8_t *)&v8, 0xCu);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activateInCallUIWithActivityContinuationIdentifier:", v4);

}

- (void)sendUserScoreToRTCReporting:(id)a3 withScore:(int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v4 = *(_QWORD *)&a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 1024;
    v13 = v4;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "CallServicesInterface: sendUserScoreToRTCReporting with UUID: %@ and Score: %d", (uint8_t *)&v10, 0x12u);
  }

  -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendUserScoreToRTCReporting:withScore:", v6, v4);

}

- (void)setCurrentAudioInputDeviceToDeviceWithUID:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!-[TUCallServicesInterface isServerLocal](self, "isServerLocal"))
  {
    TUDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Proxying setCurrentAudioInputDeviceToDeviceWithUID through CSD for UID %@", (uint8_t *)&v8, 0xCu);
    }

    -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCurrentAudioInputDeviceToDeviceWithUID:", v4);

  }
}

- (void)setCurrentAudioOutputDeviceToDeviceWithUID:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!-[TUCallServicesInterface isServerLocal](self, "isServerLocal"))
  {
    TUDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Proxying setCurrentOutputDeviceToDeviceWithUID through CSD for deviceUID %@", (uint8_t *)&v8, 0xCu);
    }

    -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCurrentAudioOutputDeviceToDeviceWithUID:", v4);

  }
}

- (id)routesByUniqueIdentifierForRouteController:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v13[5];
  _QWORD v14[5];
  uint8_t buf[16];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  -[TUCallServicesInterface queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__9;
  v20 = __Block_byref_object_dispose__9;
  v21 = (id)MEMORY[0x1E0C9AA70];
  -[TUCallServicesInterface localRouteController](self, "localRouteController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    TUDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "Proxying localRoutesByUniqueIdentifier synchronously", buf, 2u);
    }

    -[TUCallServicesInterface synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", &__block_literal_global_59_0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __70__TUCallServicesInterface_routesByUniqueIdentifierForRouteController___block_invoke_60;
    v14[3] = &unk_1E38A31C0;
    v14[4] = &v16;
    objc_msgSend(v9, "localRoutesByUniqueIdentifier:", v14);
    goto LABEL_9;
  }
  -[TUCallServicesInterface pairedHostDeviceRouteController](self, "pairedHostDeviceRouteController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
    TUDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Proxying pairedHostDeviceRoutesByUniqueIdentifier synchronously", buf, 2u);
    }

    -[TUCallServicesInterface synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", &__block_literal_global_63_0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __70__TUCallServicesInterface_routesByUniqueIdentifierForRouteController___block_invoke_64;
    v13[3] = &unk_1E38A31C0;
    v13[4] = &v16;
    objc_msgSend(v9, "pairedHostDeviceRoutesByUniqueIdentifier:", v13);
LABEL_9:

  }
  v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

void __70__TUCallServicesInterface_routesByUniqueIdentifierForRouteController___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __70__TUCallServicesInterface_routesByUniqueIdentifierForRouteController___block_invoke_cold_1();

}

void __70__TUCallServicesInterface_routesByUniqueIdentifierForRouteController___block_invoke_60(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __70__TUCallServicesInterface_routesByUniqueIdentifierForRouteController___block_invoke_62(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __70__TUCallServicesInterface_routesByUniqueIdentifierForRouteController___block_invoke_62_cold_1();

}

void __70__TUCallServicesInterface_routesByUniqueIdentifierForRouteController___block_invoke_64(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)pickRouteWithUniqueIdentifier:(id)a3 shouldWaitUntilAvailable:(BOOL)a4 forRouteController:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  int v16;
  id v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v6 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[TUCallServicesInterface queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[TUCallServicesInterface localRouteController](self, "localRouteController");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v9)
  {
    TUDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412546;
      v17 = v8;
      v18 = 1024;
      v19 = v6;
      _os_log_impl(&dword_19A50D000, v15, OS_LOG_TYPE_DEFAULT, "Proxying pickLocalRouteWithUniqueIdentifier for %@ shouldWaitUntilAvailable: %d", (uint8_t *)&v16, 0x12u);
    }

    -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pickLocalRouteWithUniqueIdentifier:shouldWaitUntilAvailable:", v8, v6);
    goto LABEL_9;
  }
  -[TUCallServicesInterface pairedHostDeviceRouteController](self, "pairedHostDeviceRouteController");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v9)
  {
    TUDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412546;
      v17 = v8;
      v18 = 1024;
      v19 = v6;
      _os_log_impl(&dword_19A50D000, v13, OS_LOG_TYPE_DEFAULT, "Proxying pickPairedHostDeviceRouteWithUniqueIdentifier for %@ shouldWaitUntilAvailable: %d", (uint8_t *)&v16, 0x12u);
    }

    -[TUCallServicesInterface asynchronousServer](self, "asynchronousServer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pickPairedHostDeviceRouteWithUniqueIdentifier:shouldWaitUntilAvailable:", v8, v6);
LABEL_9:

  }
}

- (BOOL)containsRestrictedHandle:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5
{
  uint64_t v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[TUCallServicesInterface queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[TUCallServicesInterface synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", &__block_literal_global_65_0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __93__TUCallServicesInterface_containsRestrictedHandle_forBundleIdentifier_performSynchronously___block_invoke_66;
  v13[3] = &unk_1E38A31E8;
  v13[4] = &v14;
  objc_msgSend(v11, "containsRestrictedHandle:forBundleIdentifier:performSynchronously:reply:", v8, v9, v5, v13);

  LOBYTE(v5) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v5;
}

void __93__TUCallServicesInterface_containsRestrictedHandle_forBundleIdentifier_performSynchronously___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __93__TUCallServicesInterface_containsRestrictedHandle_forBundleIdentifier_performSynchronously___block_invoke_cold_1();

}

uint64_t __93__TUCallServicesInterface_containsRestrictedHandle_forBundleIdentifier_performSynchronously___block_invoke_66(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)policyForAddresses:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = a4;
  -[TUCallServicesInterface queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__9;
  v17 = __Block_byref_object_dispose__9;
  v18 = 0;
  -[TUCallServicesInterface synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", &__block_literal_global_68);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__TUCallServicesInterface_policyForAddresses_forBundleIdentifier___block_invoke_69;
  v12[3] = &unk_1E38A31C0;
  v12[4] = &v13;
  objc_msgSend(v9, "policyForAddresses:forBundleIdentifier:reply:", v6, v7, v12);

  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __66__TUCallServicesInterface_policyForAddresses_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __66__TUCallServicesInterface_policyForAddresses_forBundleIdentifier___block_invoke_cold_1();

}

void __66__TUCallServicesInterface_policyForAddresses_forBundleIdentifier___block_invoke_69(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)willRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v6 = a3;
  v7 = a4;
  -[TUCallServicesInterface queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[TUCallServicesInterface synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", &__block_literal_global_70);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__TUCallServicesInterface_willRestrictAddresses_forBundleIdentifier___block_invoke_71;
  v11[3] = &unk_1E38A31E8;
  v11[4] = &v12;
  objc_msgSend(v9, "willRestrictAddresses:forBundleIdentifier:reply:", v6, v7, v11);

  LOBYTE(v9) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v9;
}

void __69__TUCallServicesInterface_willRestrictAddresses_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __93__TUCallServicesInterface_containsRestrictedHandle_forBundleIdentifier_performSynchronously___block_invoke_cold_1();

}

uint64_t __69__TUCallServicesInterface_willRestrictAddresses_forBundleIdentifier___block_invoke_71(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)shouldRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[TUCallServicesInterface synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", &__block_literal_global_72);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __92__TUCallServicesInterface_shouldRestrictAddresses_forBundleIdentifier_performSynchronously___block_invoke_73;
  v12[3] = &unk_1E38A31E8;
  v12[4] = &v13;
  objc_msgSend(v10, "shouldRestrictAddresses:forBundleIdentifier:performSynchronously:reply:", v8, v9, v5, v12);

  LOBYTE(v5) = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return v5;
}

void __92__TUCallServicesInterface_shouldRestrictAddresses_forBundleIdentifier_performSynchronously___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __92__TUCallServicesInterface_shouldRestrictAddresses_forBundleIdentifier_performSynchronously___block_invoke_cold_1();

}

uint64_t __92__TUCallServicesInterface_shouldRestrictAddresses_forBundleIdentifier_performSynchronously___block_invoke_73(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (unint64_t)filterStatusForAddresses:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[TUCallServicesInterface synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", &__block_literal_global_74_0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__TUCallServicesInterface_filterStatusForAddresses_forBundleIdentifier___block_invoke_75;
  v11[3] = &unk_1E38A3290;
  v11[4] = &v12;
  objc_msgSend(v8, "filterStatusForAddresses:forBundleIdentifier:reply:", v6, v7, v11);

  v9 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __72__TUCallServicesInterface_filterStatusForAddresses_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __92__TUCallServicesInterface_shouldRestrictAddresses_forBundleIdentifier_performSynchronously___block_invoke_cold_1();

}

uint64_t __72__TUCallServicesInterface_filterStatusForAddresses_forBundleIdentifier___block_invoke_75(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isUnknownAddress:(id)a3 normalizedAddress:(id)a4 forBundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[TUCallServicesInterface synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", &__block_literal_global_77_0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__TUCallServicesInterface_isUnknownAddress_normalizedAddress_forBundleIdentifier___block_invoke_78;
  v13[3] = &unk_1E38A31E8;
  v13[4] = &v14;
  objc_msgSend(v11, "isUnknownAddress:normalizedAddress:forBundleIdentifier:reply:", v8, v9, v10, v13);

  LOBYTE(v11) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return (char)v11;
}

void __82__TUCallServicesInterface_isUnknownAddress_normalizedAddress_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __82__TUCallServicesInterface_isUnknownAddress_normalizedAddress_forBundleIdentifier___block_invoke_cold_1();

}

uint64_t __82__TUCallServicesInterface_isUnknownAddress_normalizedAddress_forBundleIdentifier___block_invoke_78(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)handleLocalRoutesByUniqueIdentifierUpdated:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__TUCallServicesInterface_handleLocalRoutesByUniqueIdentifierUpdated___block_invoke;
  v6[3] = &unk_1E38A1388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[TUCallServicesInterface performBlockOnQueue:](self, "performBlockOnQueue:", v6);

}

void __70__TUCallServicesInterface_handleLocalRoutesByUniqueIdentifierUpdated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "localRouteController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleRoutesByUniqueIdentifierUpdated:", *(_QWORD *)(a1 + 40));

}

- (void)handlePairedHostDeviceRoutesByUniqueIdentifierUpdated:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__TUCallServicesInterface_handlePairedHostDeviceRoutesByUniqueIdentifierUpdated___block_invoke;
  v6[3] = &unk_1E38A1388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[TUCallServicesInterface performBlockOnQueue:](self, "performBlockOnQueue:", v6);

}

void __81__TUCallServicesInterface_handlePairedHostDeviceRoutesByUniqueIdentifierUpdated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "pairedHostDeviceRouteController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleRoutesByUniqueIdentifierUpdated:", *(_QWORD *)(a1 + 40));

}

- (void)handleFrequencyChangedTo:(id)a3 inDirection:(int)a4 forCallsWithUniqueProxyIdentifiers:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  TUCallServicesInterface *v14;
  id v15;
  int v16;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __99__TUCallServicesInterface_handleFrequencyChangedTo_inDirection_forCallsWithUniqueProxyIdentifiers___block_invoke;
  v12[3] = &unk_1E38A32B8;
  v13 = v9;
  v14 = self;
  v16 = a4;
  v15 = v8;
  v10 = v8;
  v11 = v9;
  -[TUCallServicesInterface performBlockOnQueue:](self, "performBlockOnQueue:", v12);

}

void __99__TUCallServicesInterface_handleFrequencyChangedTo_inDirection_forCallsWithUniqueProxyIdentifiers___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_proxyCallWithUniqueProxyIdentifier:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = *(_DWORD *)(a1 + 56);
        if (v9 == 2)
        {
          objc_msgSend(v7, "setLocalFrequency:", *(_QWORD *)(a1 + 48));
        }
        else if (v9 == 1)
        {
          objc_msgSend(v7, "setRemoteFrequency:", *(_QWORD *)(a1 + 48));
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void)handleCurrentCallsChanged:(id)a3 callDisconnected:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v11 = v6;
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = a3;
    objc_msgSend(v8, "arrayWithObjects:count:", &v11, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[TUCallServicesInterface _handleCurrentCallsChanged:callsDisconnected:](self, "_handleCurrentCallsChanged:callsDisconnected:", v9, v10, v11, v12);

  }
  else
  {
    v10 = a3;
    -[TUCallServicesInterface _handleCurrentCallsChanged:callsDisconnected:](self, "_handleCurrentCallsChanged:callsDisconnected:", v10, MEMORY[0x1E0C9AA60]);
  }

}

- (void)handleMeterLevelChangedTo:(float)a3 inDirection:(int)a4 forCallsWithUniqueProxyIdentifiers:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  TUCallServicesInterface *v12;
  int v13;
  float v14;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __100__TUCallServicesInterface_handleMeterLevelChangedTo_inDirection_forCallsWithUniqueProxyIdentifiers___block_invoke;
  v10[3] = &unk_1E38A2150;
  v11 = v8;
  v12 = self;
  v13 = a4;
  v14 = a3;
  v9 = v8;
  -[TUCallServicesInterface performBlockOnQueue:](self, "performBlockOnQueue:", v10);

}

void __100__TUCallServicesInterface_handleMeterLevelChangedTo_inDirection_forCallsWithUniqueProxyIdentifiers___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  double v8;
  void *v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_proxyCallWithUniqueProxyIdentifier:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v7;
        v10 = *(_DWORD *)(a1 + 48);
        if (v10 == 2)
        {
          LODWORD(v8) = *(_DWORD *)(a1 + 52);
          objc_msgSend(v7, "setLocalMeterLevel:", v8);
        }
        else if (v10 == 1)
        {
          LODWORD(v8) = *(_DWORD *)(a1 + 52);
          objc_msgSend(v7, "setRemoteMeterLevel:", v8);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (void)handleUIXPCEndpointChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__TUCallServicesInterface_handleUIXPCEndpointChanged___block_invoke;
  v6[3] = &unk_1E38A1388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[TUCallServicesInterface performBlockOnQueue:](self, "performBlockOnQueue:", v6);

}

void __54__TUCallServicesInterface_handleUIXPCEndpointChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  TUUIXPCClientConnection *v3;
  uint64_t v4;
  void *v5;
  TUUIXPCClientConnection *v6;
  void *v7;
  uint8_t v8[16];

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "HandlingUIXPCEndpointChanged", v8, 2u);
  }

  v3 = [TUUIXPCClientConnection alloc];
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "callCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TUUIXPCClientConnection initWithListenerEndpoint:callCenter:](v3, "initWithListenerEndpoint:callCenter:", v4, v5);
  objc_msgSend(*(id *)(a1 + 32), "callCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUiDataSource:", v6);

}

- (void)handleReceivedCallDTMFUpdate:(id)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  TUCallServicesInterface *v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __89__TUCallServicesInterface_handleReceivedCallDTMFUpdate_forCallWithUniqueProxyIdentifier___block_invoke;
  v10[3] = &unk_1E38A19B8;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  -[TUCallServicesInterface performBlockOnQueue:](self, "performBlockOnQueue:", v10);

}

void __89__TUCallServicesInterface_handleReceivedCallDTMFUpdate_forCallWithUniqueProxyIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v13 = 138412546;
    v14 = v3;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "handleReceivedCallDTMFUpdate %@ for call with unique proxy identifier %@", (uint8_t *)&v13, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 48), "_proxyCallWithUniqueProxyIdentifier:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 48), "callCenter");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject _handleReceivedCallDTMFUpdate:forCall:](v6, "_handleReceivedCallDTMFUpdate:forCall:", *(_QWORD *)(a1 + 32), v5);
  }
  else
  {
    TUDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __89__TUCallServicesInterface_handleReceivedCallDTMFUpdate_forCallWithUniqueProxyIdentifier___block_invoke_cold_1(a1 + 40, v6, v7, v8, v9, v10, v11, v12);
  }

}

- (void)_handleCurrentCallsChanged:(id)a3 callsDisconnected:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  TUCallServicesInterface *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__TUCallServicesInterface__handleCurrentCallsChanged_callsDisconnected___block_invoke;
  v10[3] = &unk_1E38A19B8;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[TUCallServicesInterface performBlockOnQueue:](self, "performBlockOnQueue:", v10);

}

void __72__TUCallServicesInterface__handleCurrentCallsChanged_callsDisconnected___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Handling current calls changed: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "callNotificationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "callCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__TUCallServicesInterface__handleCurrentCallsChanged_callsDisconnected___block_invoke_80;
  v7[3] = &unk_1E38A19B8;
  v6 = *(void **)(a1 + 48);
  v7[4] = *(_QWORD *)(a1 + 40);
  v8 = v6;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v4, "postNotificationsForCallContainer:afterUpdatesInBlock:", v5, v7);

}

void __72__TUCallServicesInterface__handleCurrentCallsChanged_callsDisconnected___block_invoke_80(id *a1)
{
  void *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(a1[4], "callNotificationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__TUCallServicesInterface__handleCurrentCallsChanged_callsDisconnected___block_invoke_2;
  v5[3] = &unk_1E38A19B8;
  v6 = a1[5];
  v3 = a1[6];
  v4 = a1[4];
  v7 = v3;
  v8 = v4;
  objc_msgSend(v2, "deferNotificationsUntilAfterPerformingBlock:", v5);

}

void __72__TUCallServicesInterface__handleCurrentCallsChanged_callsDisconnected___block_invoke_2(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1[4], "count"))
  {
    TUDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = a1[4];
      *(_DWORD *)buf = 138412290;
      v18 = v3;
      _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Handling call changed for disconnected calls: %@", buf, 0xCu);
    }

    objc_msgSend(a1[5], "arrayByAddingObjectsFromArray:", a1[4]);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = a1[5];
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(a1[6], "_proxyCallWithCall:", v10, (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setComparativeCall:", v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(a1[6], "_updateCurrentCalls:withNotificationsUsingUpdatedCalls:", a1[5], v5);
}

- (void)resetCallProvisionalStates
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __53__TUCallServicesInterface_resetCallProvisionalStates__block_invoke;
  v2[3] = &unk_1E38A1360;
  v2[4] = self;
  -[TUCallServicesInterface performBlockOnQueue:](self, "performBlockOnQueue:", v2);
}

void __53__TUCallServicesInterface_resetCallProvisionalStates__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = CFSTR("TUCallCenterResetCallStateNotification");
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Resetting call transition states and posting %@", buf, 0xCu);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "currentCalls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_msgSend(*(id *)(a1 + 32), "callNotificationManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = v7;
        v12[1] = 3221225472;
        v12[2] = __53__TUCallServicesInterface_resetCallProvisionalStates__block_invoke_81;
        v12[3] = &unk_1E38A1360;
        v12[4] = v9;
        objc_msgSend(v10, "postNotificationsForCall:afterUpdatesInBlock:", v9, v12);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:", CFSTR("TUCallCenterResetCallStateNotification"), 0);

}

uint64_t __53__TUCallServicesInterface_resetCallProvisionalStates__block_invoke_81(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetProvisionalState");
}

- (void)handleNotificationName:(id)a3 forCallWithUniqueProxyIdentifier:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  TUCallServicesInterface *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __92__TUCallServicesInterface_handleNotificationName_forCallWithUniqueProxyIdentifier_userInfo___block_invoke;
  v14[3] = &unk_1E38A1B38;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v18 = self;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[TUCallServicesInterface performBlockOnQueue:](self, "performBlockOnQueue:", v14);

}

void __92__TUCallServicesInterface_handleNotificationName_forCallWithUniqueProxyIdentifier_userInfo___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v8 = 138412802;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Handling notification %@ for call with unique proxy identifier %@ userInfo %@", (uint8_t *)&v8, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 56), "_proxyCallWithUniqueProxyIdentifier:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", *(_QWORD *)(a1 + 32), v6, *(_QWORD *)(a1 + 48));

}

- (TUCallCenter)callCenter
{
  return (TUCallCenter *)objc_loadWeakRetained((id *)&self->_callCenter);
}

- (void)setCallCenter:(id)a3
{
  objc_storeWeak((id *)&self->_callCenter, a3);
}

- (TURouteController)localRouteController
{
  return self->_localRouteController;
}

- (void)setLocalRouteController:(id)a3
{
  objc_storeStrong((id *)&self->_localRouteController, a3);
}

- (TURouteController)pairedHostDeviceRouteController
{
  return self->_pairedHostDeviceRouteController;
}

- (void)setPairedHostDeviceRouteController:(id)a3
{
  objc_storeStrong((id *)&self->_pairedHostDeviceRouteController, a3);
}

- (NSDate)lastDaemonConnectTime
{
  return self->_lastDaemonConnectTime;
}

- (void)setLastDaemonConnectTime:(id)a3
{
  self->_lastDaemonConnectTime = (NSDate *)a3;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (BOOL)shouldHandleServerDisconnect
{
  return self->_shouldHandleServerDisconnect;
}

- (NSMapTable)uniqueProxyIdentifierToProxyCall
{
  return self->_uniqueProxyIdentifierToProxyCall;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (NSXPCListenerEndpoint)anonymousXPCEndpoint
{
  return self->_anonymousXPCEndpoint;
}

- (void)setAnonymousXPCEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_anonymousXPCEndpoint, a3);
}

- (NSArray)localProxyCalls
{
  return self->_localProxyCalls;
}

- (void)setHasServerLaunched:(BOOL)a3
{
  self->_hasServerLaunched = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localProxyCalls, 0);
  objc_storeStrong((id *)&self->_anonymousXPCEndpoint, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_callNotificationManager, 0);
  objc_storeStrong((id *)&self->_uniqueProxyIdentifierToProxyCall, 0);
  objc_storeStrong((id *)&self->_currentCalls, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pairedHostDeviceRouteController, 0);
  objc_storeStrong((id *)&self->_localRouteController, 0);
  objc_destroyWeak((id *)&self->_callCenter);
  objc_storeStrong((id *)&self->_callServicesClientCapabilities, 0);
  objc_destroyWeak((id *)&self->_server);
}

void __87__TUCallServicesInterface_requestCurrentStateWithCompletionHandler_handleInitialState___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error using remote object proxy: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __54__TUCallServicesInterface_dialWithRequest_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19A50D000, a2, a3, "Error using remote object proxy for dial: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __61__TUCallServicesInterface_saveCustomGreeting_forAccountUUID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error using remote object proxy when requesting answering machine availability: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__TUCallServicesInterface_customGreetingForAccountUUID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error using remote object proxy when requesting custom greeting: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __42__TUCallServicesInterface_defaultGreeting__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error using remote object proxy when requesting default greeting: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __50__TUCallServicesInterface_fetchCurrentCallUpdates__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error using remote object proxy when fetching TUCallUpdates: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __45__TUCallServicesInterface_screenWithRequest___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error using remote object proxy when screenWithRequest: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __62__TUCallServicesInterface_performRecordingRequest_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error using remote object proxy when perform audio recording request: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__TUCallServicesInterface_registerAnonymousXPCEndpoint___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error using remote object proxy when registerAnonymousXPCEndpoint: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__TUCallServicesInterface_fetchAnonymousXPCEndpoint___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error using remote object proxy when fetchAnonymousXPCEndpoint: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __85__TUCallServicesInterface_pullCallFromClientUsingHandoffActivityUserInfo_completion___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error using remote object proxy for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __70__TUCallServicesInterface_routesByUniqueIdentifierForRouteController___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error using remote object proxy when requesting synchronous local routes: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __70__TUCallServicesInterface_routesByUniqueIdentifierForRouteController___block_invoke_62_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error using remote object proxy when requesting synchronous paired host device routes: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __93__TUCallServicesInterface_containsRestrictedHandle_forBundleIdentifier_performSynchronously___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error using remote object proxy when requesting synchronous restricted handle check: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __66__TUCallServicesInterface_policyForAddresses_forBundleIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error using remote object proxy when requesting synchronous policy check for addresses: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __92__TUCallServicesInterface_shouldRestrictAddresses_forBundleIdentifier_performSynchronously___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error using remote object proxy when requesting synchronous restricted addresses check: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __82__TUCallServicesInterface_isUnknownAddress_normalizedAddress_forBundleIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error using remote object proxy when requesting synchronous unknown address check: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __89__TUCallServicesInterface_handleReceivedCallDTMFUpdate_forCallWithUniqueProxyIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19A50D000, a2, a3, "handleReceivedCallDTMFUpdate: No call found for unique proxy identifier %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
