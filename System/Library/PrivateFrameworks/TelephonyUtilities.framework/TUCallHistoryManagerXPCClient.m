@implementation TUCallHistoryManagerXPCClient

+ (TUCallHistoryManagerXPCServer)asynchronousServer
{
  return (TUCallHistoryManagerXPCServer *)objc_loadWeakRetained(&sAsynchronousServer_6);
}

+ (void)setAsynchronousServer:(id)a3
{
  objc_storeWeak(&sAsynchronousServer_6, a3);
}

+ (TUCallHistoryManagerXPCServer)synchronousServer
{
  return (TUCallHistoryManagerXPCServer *)objc_loadWeakRetained(&sSynchronousServer_6);
}

+ (void)setSynchronousServer:(id)a3
{
  objc_storeWeak(&sSynchronousServer_6, a3);
}

+ (id)callHistoryManagerAllowedClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

+ (NSXPCInterface)callHistoryManagerClientXPCInterface
{
  if (callHistoryManagerClientXPCInterface_onceToken != -1)
    dispatch_once(&callHistoryManagerClientXPCInterface_onceToken, &__block_literal_global_55);
  return (NSXPCInterface *)(id)callHistoryManagerClientXPCInterface_callHistoryManagerClientXPCInterface;
}

void __69__TUCallHistoryManagerXPCClient_callHistoryManagerClientXPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3D2998);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)callHistoryManagerClientXPCInterface_callHistoryManagerClientXPCInterface;
  callHistoryManagerClientXPCInterface_callHistoryManagerClientXPCInterface = v0;

}

+ (NSXPCInterface)callHistoryManagerServerXPCInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__TUCallHistoryManagerXPCClient_callHistoryManagerServerXPCInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (callHistoryManagerServerXPCInterface_onceToken != -1)
    dispatch_once(&callHistoryManagerServerXPCInterface_onceToken, block);
  return (NSXPCInterface *)(id)callHistoryManagerServerXPCInterface_callHistoryManagerServerXPCInterface;
}

void __69__TUCallHistoryManagerXPCClient_callHistoryManagerServerXPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3E7220);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)callHistoryManagerServerXPCInterface_callHistoryManagerServerXPCInterface;
  callHistoryManagerServerXPCInterface_callHistoryManagerServerXPCInterface = v2;

  v4 = (void *)callHistoryManagerServerXPCInterface_callHistoryManagerServerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "callHistoryManagerAllowedClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_updateOutgoingLocalParticipantUUID_forCallsWithOutgoingLocalParticipantUUID_, 0, 0);

  v6 = (void *)callHistoryManagerServerXPCInterface_callHistoryManagerServerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "callHistoryManagerAllowedClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_reportRecentCallForConversation_withStartDate_avMode_, 0, 0);

  v8 = (void *)callHistoryManagerServerXPCInterface_callHistoryManagerServerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "callHistoryManagerAllowedClasses");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_reportRecentCallForConversation_withStartDate_avMode_, 1, 0);

}

- (TUCallHistoryManagerXPCClient)init
{
  TUCallHistoryManagerXPCClient *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  NSObject *v5;
  _QWORD block[4];
  TUCallHistoryManagerXPCClient *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TUCallHistoryManagerXPCClient;
  v2 = -[TUCallHistoryManagerXPCClient init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.telephonyutilities.callhistorymanagerxpcclient", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = v2->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__TUCallHistoryManagerXPCClient_init__block_invoke;
    block[3] = &unk_1E38A1360;
    v8 = v2;
    dispatch_async(v5, block);

  }
  return v2;
}

void __37__TUCallHistoryManagerXPCClient_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_6);
  objc_msgSend(WeakRetained, "registerClient:", *(_QWORD *)(a1 + 32));

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TUCallHistoryManagerXPCClient;
  -[TUCallHistoryManagerXPCClient dealloc](&v3, sel_dealloc);
}

- (void)handleServerDisconnect
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];

  -[TUCallHistoryManagerXPCClient queue](self, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Server disconnected.", v4, 2u);
  }

}

- (void)invalidate
{
  NSObject *v3;
  _QWORD block[5];

  -[TUCallHistoryManagerXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__TUCallHistoryManagerXPCClient_invalidate__block_invoke;
  block[3] = &unk_1E38A1360;
  block[4] = self;
  dispatch_async(v3, block);

}

void __43__TUCallHistoryManagerXPCClient_invalidate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");
  WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_6);
  objc_msgSend(WeakRetained, "unregisterClient:", *(_QWORD *)(a1 + 32));

}

- (void)updateOutgoingLocalParticipantUUID:(id)a3 forCallsWithOutgoingLocalParticipantUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TUCallHistoryManagerXPCClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__TUCallHistoryManagerXPCClient_updateOutgoingLocalParticipantUUID_forCallsWithOutgoingLocalParticipantUUID___block_invoke;
  block[3] = &unk_1E38A19B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __109__TUCallHistoryManagerXPCClient_updateOutgoingLocalParticipantUUID_forCallsWithOutgoingLocalParticipantUUID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "synchronousServerWithErrorHandler:", &__block_literal_global_64_0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateOutgoingLocalParticipantUUID:forCallsWithOutgoingLocalParticipantUUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __109__TUCallHistoryManagerXPCClient_updateOutgoingLocalParticipantUUID_forCallsWithOutgoingLocalParticipantUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __109__TUCallHistoryManagerXPCClient_updateOutgoingLocalParticipantUUID_forCallsWithOutgoingLocalParticipantUUID___block_invoke_2_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (void)reportRecentCallForConversation:(id)a3 withStartDate:(id)a4 avMode:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a4;
  -[TUCallHistoryManagerXPCClient queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__TUCallHistoryManagerXPCClient_reportRecentCallForConversation_withStartDate_avMode___block_invoke;
  v13[3] = &unk_1E38A1768;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __86__TUCallHistoryManagerXPCClient_reportRecentCallForConversation_withStartDate_avMode___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "synchronousServerWithErrorHandler:", &__block_literal_global_65_1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportRecentCallForConversation:withStartDate:avMode:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __86__TUCallHistoryManagerXPCClient_reportRecentCallForConversation_withStartDate_avMode___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __86__TUCallHistoryManagerXPCClient_reportRecentCallForConversation_withStartDate_avMode___block_invoke_2_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (NSXPCConnection)xpcConnection
{
  NSObject *v3;
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  -[TUCallHistoryManagerXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.telephonyutilities.callservicesdaemon.callhistorymanager"), 0);
    v6 = self->_xpcConnection;
    self->_xpcConnection = v5;

    objc_msgSend((id)objc_opt_class(), "callHistoryManagerServerXPCInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v7);

    objc_msgSend((id)objc_opt_class(), "callHistoryManagerClientXPCInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcConnection, "setExportedInterface:", v8);

    -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", self);
    objc_initWeak(&location, self);
    v9 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __46__TUCallHistoryManagerXPCClient_xpcConnection__block_invoke;
    v13[3] = &unk_1E38A13D0;
    objc_copyWeak(&v14, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v13);
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __46__TUCallHistoryManagerXPCClient_xpcConnection__block_invoke_68;
    v11[3] = &unk_1E38A13D0;
    objc_copyWeak(&v12, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v11);
    -[NSXPCConnection resume](self->_xpcConnection, "resume");
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    xpcConnection = self->_xpcConnection;
  }
  return xpcConnection;
}

void __46__TUCallHistoryManagerXPCClient_xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__TUCallHistoryManagerXPCClient_xpcConnection__block_invoke_2;
    block[3] = &unk_1E38A1360;
    block[4] = v2;
    dispatch_async(v3, block);

  }
}

uint64_t __46__TUCallHistoryManagerXPCClient_xpcConnection__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v6[16];

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated.", v6, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "handleServerDisconnect");
}

void __46__TUCallHistoryManagerXPCClient_xpcConnection__block_invoke_68(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__TUCallHistoryManagerXPCClient_xpcConnection__block_invoke_2_69;
    block[3] = &unk_1E38A1360;
    block[4] = v2;
    dispatch_async(v3, block);

  }
}

uint64_t __46__TUCallHistoryManagerXPCClient_xpcConnection__block_invoke_2_69(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted.", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "handleServerDisconnect");
}

- (id)serverWithErrorHandler:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_6);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
  }
  else
  {
    -[TUCallHistoryManagerXPCClient xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)synchronousServerWithErrorHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  -[TUCallHistoryManagerXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  WeakRetained = objc_loadWeakRetained(&sSynchronousServer_6);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
  }
  else
  {
    -[TUCallHistoryManagerXPCClient xpcConnection](self, "xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __109__TUCallHistoryManagerXPCClient_updateOutgoingLocalParticipantUUID_forCallsWithOutgoingLocalParticipantUUID___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19A50D000, a2, a3, "Error updating outgoing local participant UUID: %@", a5, a6, a7, a8, 2u);
}

void __86__TUCallHistoryManagerXPCClient_reportRecentCallForConversation_withStartDate_avMode___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19A50D000, a2, a3, "Error reporting recent call for conversation: %@", a5, a6, a7, a8, 2u);
}

@end
