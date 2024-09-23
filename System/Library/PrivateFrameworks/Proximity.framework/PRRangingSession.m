@implementation PRRangingSession

- (PRRangingSession)init
{
  PRRangingSession *v2;
  os_log_t v3;
  OS_os_log *logger;
  PRRangingDevice *v5;
  PRRangingDevice *rangingDevice;
  PRPeer *v7;
  void *v8;
  uint64_t v9;
  PRPeer *localPeer;
  id v11;
  void *v12;
  uint64_t v13;
  NSMutableSet *sessionParticipants;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PRRangingSession;
  v2 = -[PRRangingSession init](&v16, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.nearbyd", "RangingSession");
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v3;

    v5 = objc_alloc_init(PRRangingDevice);
    rangingDevice = v2->_rangingDevice;
    v2->_rangingDevice = v5;

    v7 = [PRPeer alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PRPeer initWithUUID:](v7, "initWithUUID:", v8);
    localPeer = v2->_localPeer;
    v2->_localPeer = (PRPeer *)v9;

    v11 = objc_alloc(MEMORY[0x1E0C99E20]);
    -[PRPeer uuid](v2->_localPeer, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithObjects:", v12, 0);
    sessionParticipants = v2->_sessionParticipants;
    v2->_sessionParticipants = (NSMutableSet *)v13;

    *(_WORD *)&v2->_isReady = 256;
    -[PRRangingSession connectToDaemon](v2, "connectToDaemon");
  }
  return v2;
}

- (void)startRangingWithPeer:(id)a3
{
  id v4;
  NSObject *logger;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  _QWORD v11[2];
  _QWORD v12[2];
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = (uint64_t)v4;
    _os_log_impl(&dword_19BF46000, logger, OS_LOG_TYPE_DEFAULT, "startRangingWithPeer: %@", buf, 0xCu);
  }
  if (!self->_isReady)
  {
    v8 = *MEMORY[0x1E0CB2D68];
    v11[0] = *MEMORY[0x1E0CB2D50];
    v11[1] = v8;
    v12[0] = CFSTR("Failed to start ranging.");
    v12[1] = CFSTR("Service not ready.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PRErrorWithCodeAndUserInfo(999, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "rangingSession:didFailWithError:", self, v7);

LABEL_9:
    goto LABEL_10;
  }
  if (-[NSMutableSet count](self->_sessionParticipants, "count") == 2)
  {
    v6 = self->_logger;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v14 = 2;
      _os_log_impl(&dword_19BF46000, v6, OS_LOG_TYPE_DEFAULT, "ARKitParticipantsCount = %ld. Resuming session.", buf, 0xCu);
    }
    -[PRRangingSession setRangedPeer:](self, "setRangedPeer:", v4);
    -[PRRangingSession remoteObject](self, "remoteObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resume");
    goto LABEL_9;
  }
LABEL_10:

}

- (void)stopRangingWithPeer:(id)a3
{
  id v4;
  NSObject *logger;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19BF46000, logger, OS_LOG_TYPE_DEFAULT, "stopRangingWithPeer: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)pushCollaborationData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSObject *logger;
  PRPeer *localPeer;
  NSObject *v11;
  void *v12;
  NSMutableSet *sessionParticipants;
  void *v14;
  void *v15;
  PRRemoteDevice *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  unint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  NSMutableSet *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "sendingPeer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((-[NSMutableSet containsObject:](self->_sessionParticipants, "containsObject:", v6) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_sessionParticipants, "addObject:", v6);
    -[PRPeer uuid](self->_localPeer, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[PRRangingSession computeLocalDeviceIndex:sessionParticipants:](PRRangingSession, "computeLocalDeviceIndex:sessionParticipants:", v7, self->_sessionParticipants);

    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      localPeer = self->_localPeer;
      v11 = logger;
      -[PRPeer uuid](localPeer, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      sessionParticipants = self->_sessionParticipants;
      *(_DWORD *)buf = 134218498;
      v22 = v8;
      v23 = 2112;
      v24 = v12;
      v25 = 2112;
      v26 = sessionParticipants;
      _os_log_impl(&dword_19BF46000, v11, OS_LOG_TYPE_DEFAULT, "Local device index is: %lu, local UUID: %@, participants: %@", buf, 0x20u);

    }
    -[PRRangingSession rangingConfigurationWithDeviceIndex:](self, "rangingConfigurationWithDeviceIndex:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    -[PRRangingSession remoteObject](self, "remoteObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __42__PRRangingSession_pushCollaborationData___block_invoke;
    v19[3] = &unk_1E3D04538;
    objc_copyWeak(&v20, (id *)buf);
    objc_msgSend(v15, "runWithConfiguration:reply:", v14, v19);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);

  }
  v16 = -[PRRemoteDevice initWithCompanionUUID:]([PRRemoteDevice alloc], "initWithCompanionUUID:", v6);
  -[PRRangingSession remoteObject](self, "remoteObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "receivedData:fromPeer:", v18, v16);

}

void __42__PRRangingSession_pushCollaborationData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject **WeakRetained;
  NSObject **v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained[1];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)MEMORY[0x1E0CB37E8];
      v10 = v8;
      objc_msgSend(v9, "numberWithBool:", a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v11;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_19BF46000, v10, OS_LOG_TYPE_DEFAULT, "reply to runWithConfiguration. Success: %@, Error: %@", (uint8_t *)&v12, 0x16u);

    }
  }

}

- (void)invokeDelegateBlock:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *delegateQueue;
  NSObject *logger;
  uint8_t v7[16];

  v4 = (void (**)(_QWORD))a3;
  if (-[PRRangingSession isValid](self, "isValid"))
  {
    delegateQueue = self->_delegateQueue;
    if (delegateQueue)
      dispatch_async(delegateQueue, v4);
    else
      v4[2](v4);
  }
  else
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19BF46000, logger, OS_LOG_TYPE_DEFAULT, "session has been invalidated, dropping delegate block", v7, 2u);
    }
  }

}

- (void)requestInitialCollaborationDataWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *logger;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BF46000, logger, OS_LOG_TYPE_DEFAULT, "requesting initial collaboration data", buf, 2u);
  }
  -[PRRangingSession remoteObject](self, "remoteObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__PRRangingSession_requestInitialCollaborationDataWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E3D04560;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "requestInitialCollaborationDataWithCompletionHandler:", v8);

}

void __73__PRRangingSession_requestInitialCollaborationDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PRCollaborationData *v4;
  void *v5;
  PRCollaborationData *v6;

  v3 = a2;
  v4 = [PRCollaborationData alloc];
  objc_msgSend(*(id *)(a1 + 32), "localPeer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PRCollaborationData initWithData:sendingPeer:](v4, "initWithData:sendingPeer:", v3, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)invalidate
{
  NSObject *logger;
  NSXPCConnection *connection;
  int v5;
  PRRangingSession *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = self;
    _os_log_impl(&dword_19BF46000, logger, OS_LOG_TYPE_DEFAULT, "Invalidating ranging session %p", (uint8_t *)&v5, 0xCu);
  }
  -[PRRangingSession setValid:](self, "setValid:", 0);
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

}

- (void)connectToDaemon
{
  NSXPCConnection *v3;
  NSXPCConnection *connection;
  NSXPCConnection *v5;
  void *v6;
  NSXPCConnection *v7;
  PRRangingClientExportedObject *v8;
  NSXPCConnection *v9;
  void *v10;
  NSXPCConnection *v11;
  uint64_t v12;
  NSXPCConnection *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.nearbyd.xpc.aided"), 4096);
  connection = self->_connection;
  self->_connection = v3;

  v5 = self->_connection;
  PRMakeAidedRangingClientXPCInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](v5, "setExportedInterface:", v6);

  v7 = self->_connection;
  v8 = -[PRRangingClientExportedObject initWithRangingClient:]([PRRangingClientExportedObject alloc], "initWithRangingClient:", self);
  -[NSXPCConnection setExportedObject:](v7, "setExportedObject:", v8);

  v9 = self->_connection;
  PRMakeAidedRangingServerXPCInterface();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](v9, "setRemoteObjectInterface:", v10);

  objc_initWeak(&location, self);
  v11 = self->_connection;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __35__PRRangingSession_connectToDaemon__block_invoke;
  v18[3] = &unk_1E3D04588;
  objc_copyWeak(&v19, &location);
  -[NSXPCConnection setInterruptionHandler:](v11, "setInterruptionHandler:", v18);
  v13 = self->_connection;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __35__PRRangingSession_connectToDaemon__block_invoke_2;
  v16[3] = &unk_1E3D04588;
  objc_copyWeak(&v17, &location);
  -[NSXPCConnection setInvalidationHandler:](v13, "setInvalidationHandler:", v16);
  -[NSXPCConnection resume](self->_connection, "resume");
  -[PRRangingSession remoteObject](self, "remoteObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRRangingDevice clientInfo](self->_rangingDevice, "clientInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "connectWithClientInfo:", v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __35__PRRangingSession_connectToDaemon__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleInterruption");

}

void __35__PRRangingSession_connectToDaemon__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleInvalidation");

}

- (void)handleInterruption
{
  NSObject *logger;
  NSXPCConnection *connection;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    v5 = logger;
    -[NSXPCConnection debugDescription](connection, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_19BF46000, v5, OS_LOG_TYPE_DEFAULT, "connection was interrupted: %@", (uint8_t *)&v9, 0xCu);

  }
  -[PRRangingSession remoteObject](self, "remoteObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRRangingDevice clientInfo](self->_rangingDevice, "clientInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connectWithClientInfo:", v8);

}

- (void)handleInvalidation
{
  NSObject *logger;
  NSXPCConnection *connection;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    v5 = logger;
    -[NSXPCConnection debugDescription](connection, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_19BF46000, v5, OS_LOG_TYPE_DEFAULT, "connection was invalidated: %@", (uint8_t *)&v7, 0xCu);

  }
}

- (id)remoteObject
{
  NSXPCConnection *connection;
  _QWORD v4[5];

  connection = self->_connection;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__PRRangingSession_remoteObject__block_invoke;
  v4[3] = &unk_1E3D045B0;
  v4[4] = self;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __32__PRRangingSession_remoteObject__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19BF46000, v4, OS_LOG_TYPE_DEFAULT, "Error getting remote object proxy %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)sendDataToPeers:(id)a3
{
  id v4;
  PRCollaborationData *v5;
  void *v6;
  PRCollaborationData *v7;
  PRCollaborationData *v8;
  _QWORD v9[5];
  PRCollaborationData *v10;

  v4 = a3;
  v5 = [PRCollaborationData alloc];
  -[PRRangingSession localPeer](self, "localPeer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PRCollaborationData initWithData:sendingPeer:](v5, "initWithData:sendingPeer:", v4, v6);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__PRRangingSession_sendDataToPeers___block_invoke;
  v9[3] = &unk_1E3D045D8;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  -[PRRangingSession invokeDelegateBlock:](self, "invokeDelegateBlock:", v9);

}

void __36__PRRangingSession_sendDataToPeers___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rangingSession:didOutputCollaborationData:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didFailWithError:(id)a3
{
  id v4;
  NSObject *logger;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_19BF46000, logger, OS_LOG_TYPE_DEFAULT, "ranging session failed with error %@", (uint8_t *)&v7, 0xCu);
  }
  -[PRRangingSession delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rangingSession:didFailWithError:", self, v4);

}

- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4
{
  NSObject *logger;
  void *v7;
  void *v8;
  int v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = a3;
    _os_log_impl(&dword_19BF46000, logger, OS_LOG_TYPE_DEFAULT, "ranging service updated state %ld", (uint8_t *)&v9, 0xCu);
  }
  if (a3 == 3)
  {
    PRErrorWithCodeAndUserInfo(999, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRRangingSession delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rangingSession:didFailWithError:", self, v7);

    self->_isReady = 0;
  }
  else
  {
    self->_isReady = a3 == 2;
  }
}

- (void)didReceiveNewSolutions:(id)a3
{
  id v4;
  NSObject *logger;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  _QWORD v13[6];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BF46000, logger, OS_LOG_TYPE_DEFAULT, "received new solutions", buf, 2u);
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        v13[0] = v10;
        v13[1] = 3221225472;
        v13[2] = __43__PRRangingSession_didReceiveNewSolutions___block_invoke;
        v13[3] = &unk_1E3D045D8;
        v13[4] = v12;
        v13[5] = self;
        -[PRRangingSession invokeDelegateBlock:](self, "invokeDelegateBlock:", v13);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v8);
  }

}

void __43__PRRangingSession_didReceiveNewSolutions___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "range_m");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "range_unc_m");
  +[PRRangeMeasurement measurementWithRange:uncertainty:](PRRangeMeasurement, "measurementWithRange:uncertainty:", v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mach_absolute_time_sec");
  +[PRRelativePosition relativePositionWithTimestamp:range:azimuth:elevation:](PRRelativePosition, "relativePositionWithTimestamp:range:azimuth:elevation:", v9, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 48));
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v7, "rangedPeer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "rangingSession:didMeasurePeer:atRelativePosition:", v7, v8, v5);

}

- (void)rangingRequestDidUpdateStatus:(unint64_t)a3
{
  NSObject *logger;
  int v5;
  unint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = a3;
    _os_log_impl(&dword_19BF46000, logger, OS_LOG_TYPE_DEFAULT, "ranging request updated status: %ld", (uint8_t *)&v5, 0xCu);
  }
}

+ (unint64_t)computeLocalDeviceIndex:(id)a3 sessionParticipants:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  char v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = a1;
  objc_sync_enter(v8);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("UUIDString"), 1);
  v16[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingDescriptors:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  while (objc_msgSend(v11, "count") > v12)
  {
    objc_msgSend(v11, "objectAtIndex:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", v6);

    ++v12;
    if ((v14 & 1) != 0)
    {
      v12 = v12;
      goto LABEL_6;
    }
  }
  v12 = 0;
LABEL_6:

  objc_sync_exit(v8);
  return v12;
}

- (id)rangingConfigurationWithDeviceIndex:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("MultiSessionDevIndex");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PRRangingSessionDelegate)delegate
{
  return (PRRangingSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDelegateQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PRPeer)localPeer
{
  return (PRPeer *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableSet)sessionParticipants
{
  return (NSMutableSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSessionParticipants:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)setIsReady:(BOOL)a3
{
  self->_isReady = a3;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (PRPeer)rangedPeer
{
  return (PRPeer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRangedPeer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rangedPeer, 0);
  objc_storeStrong((id *)&self->_sessionParticipants, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rangingDevice, 0);
  objc_storeStrong((id *)&self->_localPeer, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
