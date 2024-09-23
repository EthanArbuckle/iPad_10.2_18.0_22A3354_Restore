@implementation TUSimulatedConversationControllerXPCClient

- (TUSimulatedConversationControllerXPCClient)init
{
  TUSimulatedConversationControllerXPCClient *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUSimulatedConversationControllerXPCClient;
  v2 = -[TUSimulatedConversationControllerXPCClient init](&v8, sel_init);
  if (v2)
  {
    TUDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Initializing TUSimulatedConversationControllerXPCClient", v7, 2u);
    }

    v4 = dispatch_queue_create("com.apple.telephonyutilities.simulatedconversationcontrollerxpcclient", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TUSimulatedConversationControllerXPCClient;
  -[TUSimulatedConversationControllerXPCClient dealloc](&v3, sel_dealloc);
}

- (void)updateParticipant:(id)a3 withUpdate:(id)a4 onConversation:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[TUSimulatedConversationControllerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_12);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "groupUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "updateParticipant:withUpdate:onConversationWithGroupUUID:", v10, v9, v11);
}

void __90__TUSimulatedConversationControllerXPCClient_updateParticipant_withUpdate_onConversation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Updating simulated participant failed with error %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)addRemoteParticipantWithHandle:(id)a3 update:(id)a4 toConversation:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[TUSimulatedConversationControllerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "groupUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addRemoteParticipantWithHandle:update:toConversationWithGroupUUID:", v10, v9, v11);
}

void __99__TUSimulatedConversationControllerXPCClient_addRemoteParticipantWithHandle_update_toConversation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Adding remote participant failed with error %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)removeRemoteParticipant:(id)a3 fromConversation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[TUSimulatedConversationControllerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "groupUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "removeRemoteParticipant:fromConversationWithGroupUUID:", v7, v8);
}

void __87__TUSimulatedConversationControllerXPCClient_removeRemoteParticipant_fromConversation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Remove remote participant failed with error %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)createIncomingConversationWithHandles:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUSimulatedConversationControllerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_6);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createIncomingConversationWithHandles:", v4);

}

void __84__TUSimulatedConversationControllerXPCClient_createIncomingConversationWithHandles___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Creating incoming simulated conversation failed with error %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)invalidate
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[TUSimulatedConversationControllerXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__TUSimulatedConversationControllerXPCClient_invalidate__block_invoke;
  v4[3] = &unk_1E38A13D0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __56__TUSimulatedConversationControllerXPCClient_invalidate__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[1], "invalidate");
    WeakRetained = v2;
  }

}

- (NSXPCConnection)xpcConnection
{
  NSObject *v3;
  _QWORD block[5];

  -[TUSimulatedConversationControllerXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__TUSimulatedConversationControllerXPCClient_xpcConnection__block_invoke;
  block[3] = &unk_1E38A1360;
  block[4] = self;
  dispatch_sync(v3, block);

  return self->_xpcConnection;
}

void __59__TUSimulatedConversationControllerXPCClient_xpcConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
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
  id buf[2];

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    TUDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Starting XPC Connection.", (uint8_t *)buf, 2u);
    }

    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.telephonyutilities.callservicesdaemon.simulatedconversationcontroller"), 0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    objc_msgSend((id)objc_opt_class(), "simulatedConversationControllerServerXPCInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setRemoteObjectInterface:", v6);

    objc_msgSend((id)objc_opt_class(), "simulatedConversationControllerClientXPCInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedInterface:", v7);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:");
    objc_initWeak(buf, *(id *)(a1 + 32));
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__TUSimulatedConversationControllerXPCClient_xpcConnection__block_invoke_9;
    v14[3] = &unk_1E38A13D0;
    objc_copyWeak(&v15, buf);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setInvalidationHandler:", v14);
    v9 = v8;
    v10 = 3221225472;
    v11 = __59__TUSimulatedConversationControllerXPCClient_xpcConnection__block_invoke_10;
    v12 = &unk_1E38A13D0;
    objc_copyWeak(&v13, buf);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setInterruptionHandler:", &v9);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "resume", v9, v10, v11, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);
  }
}

void __59__TUSimulatedConversationControllerXPCClient_xpcConnection__block_invoke_9(uint64_t a1)
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
    block[2] = __59__TUSimulatedConversationControllerXPCClient_xpcConnection__block_invoke_2;
    block[3] = &unk_1E38A1360;
    block[4] = v2;
    dispatch_async(v3, block);

  }
}

void __59__TUSimulatedConversationControllerXPCClient_xpcConnection__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated.", v5, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = 0;

}

void __59__TUSimulatedConversationControllerXPCClient_xpcConnection__block_invoke_10(uint64_t a1)
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
    block[2] = __59__TUSimulatedConversationControllerXPCClient_xpcConnection__block_invoke_2_11;
    block[3] = &unk_1E38A1360;
    block[4] = v2;
    dispatch_async(v3, block);

  }
}

uint64_t __59__TUSimulatedConversationControllerXPCClient_xpcConnection__block_invoke_2_11(uint64_t a1)
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

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
}

- (id)asynchronousServerWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TUSimulatedConversationControllerXPCClient xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)synchronousServerWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TUSimulatedConversationControllerXPCClient xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)simulatedConversationControllerAllowedClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
}

+ (NSXPCInterface)simulatedConversationControllerClientXPCInterface
{
  if (simulatedConversationControllerClientXPCInterface_onceToken != -1)
    dispatch_once(&simulatedConversationControllerClientXPCInterface_onceToken, &__block_literal_global_20);
  return (NSXPCInterface *)(id)simulatedConversationControllerClientXPCInterface_conversationProviderManagerClientXPCInterface;
}

void __95__TUSimulatedConversationControllerXPCClient_simulatedConversationControllerClientXPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3B2C38);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)simulatedConversationControllerClientXPCInterface_conversationProviderManagerClientXPCInterface;
  simulatedConversationControllerClientXPCInterface_conversationProviderManagerClientXPCInterface = v0;

}

+ (NSXPCInterface)simulatedConversationControllerServerXPCInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__TUSimulatedConversationControllerXPCClient_simulatedConversationControllerServerXPCInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (simulatedConversationControllerServerXPCInterface_onceToken != -1)
    dispatch_once(&simulatedConversationControllerServerXPCInterface_onceToken, block);
  return (NSXPCInterface *)(id)simulatedConversationControllerServerXPCInterface_conversationProviderManagerXPCInterface;
}

void __95__TUSimulatedConversationControllerXPCClient_simulatedConversationControllerServerXPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3E6F80);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)simulatedConversationControllerServerXPCInterface_conversationProviderManagerXPCInterface;
  simulatedConversationControllerServerXPCInterface_conversationProviderManagerXPCInterface = v2;

  v4 = (void *)simulatedConversationControllerServerXPCInterface_conversationProviderManagerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "simulatedConversationControllerAllowedClasses");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_createIncomingConversationWithHandles_, 0, 0);

}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
