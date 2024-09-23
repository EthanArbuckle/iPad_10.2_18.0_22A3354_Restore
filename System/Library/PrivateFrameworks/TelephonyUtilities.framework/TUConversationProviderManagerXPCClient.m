@implementation TUConversationProviderManagerXPCClient

+ (TUConversationProviderManagerXPCServer)asynchronousServer
{
  return (TUConversationProviderManagerXPCServer *)objc_loadWeakRetained(&sAsynchronousServer_4);
}

+ (void)setAsynchronousServer:(id)a3
{
  objc_storeWeak(&sAsynchronousServer_4, a3);
}

+ (TUConversationProviderManagerXPCServer)synchronousServer
{
  return (TUConversationProviderManagerXPCServer *)objc_loadWeakRetained(&sSynchronousServer_4);
}

+ (void)setSynchronousServer:(id)a3
{
  objc_storeWeak(&sSynchronousServer_4, a3);
}

- (TUConversationProviderManagerXPCClient)init
{
  TUConversationProviderManagerXPCClient *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  id WeakRetained;
  NSObject *v8;
  _QWORD handler[4];
  id v11;
  id buf[2];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TUConversationProviderManagerXPCClient;
  v2 = -[TUConversationProviderManagerXPCClient init](&v13, sel_init);
  if (v2)
  {
    TUDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Initializing TUConversationProviderManagerXPCClient", (uint8_t *)buf, 2u);
    }

    v4 = dispatch_queue_create("com.apple.telephonyutilities.conversationprovidermanagerxpcclient", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    objc_initWeak(buf, v2);
    v6 = v2->_queue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __46__TUConversationProviderManagerXPCClient_init__block_invoke;
    handler[3] = &unk_1E38A1698;
    objc_copyWeak(&v11, buf);
    notify_register_dispatch("CSDConversationProviderManagerClientsShouldConnectNotification", &v2->_shouldConnectToken, v6, handler);
    WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_4);
    TUDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[TUConversationProviderManagerXPCClient init].cold.1((uint64_t)v2, (uint64_t)WeakRetained, v8);

    objc_msgSend(WeakRetained, "registerClient:", v2);
    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
  return v2;
}

void __46__TUConversationProviderManagerXPCClient_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "CSDConversationProviderManagerClientsShouldConnectNotification";
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Handling %s by setting up XPC connection for ProviderManager1", buf, 0xCu);
  }

  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__TUConversationProviderManagerXPCClient_init__block_invoke_2;
    block[3] = &unk_1E38A1360;
    v5 = WeakRetained;
    dispatch_async(v3, block);

  }
}

uint64_t __46__TUConversationProviderManagerXPCClient_init__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "CSDConversationProviderManagerClientsShouldConnectNotification";
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Handling %s by setting up XPC connection for ProviderManager2", (uint8_t *)&v4, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_requestInitialStateWithCompletionHandler:", 0);
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_shouldConnectToken);
  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TUConversationProviderManagerXPCClient;
  -[TUConversationProviderManagerXPCClient dealloc](&v3, sel_dealloc);
}

- (void)registerWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUConversationProviderManagerXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__TUConversationProviderManagerXPCClient_registerWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E38A1838;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __72__TUConversationProviderManagerXPCClient_registerWithCompletionHandler___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasRequestedInitialState");
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if ((v2 & 1) != 0)
    return objc_msgSend(v3, "_invokeCompletionHandler:", v4);
  else
    return objc_msgSend(v3, "_requestInitialStateWithCompletionHandler:", v4);
}

- (void)conversationProviderForIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __94__TUConversationProviderManagerXPCClient_conversationProviderForIdentifier_completionHandler___block_invoke;
  v14 = &unk_1E38A30E0;
  v15 = v6;
  v16 = v7;
  v8 = v7;
  v9 = v6;
  -[TUConversationProviderManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "conversationProviderForIdentifier:completionHandler:", v9, v8, v11, v12, v13, v14);

}

void __94__TUConversationProviderManagerXPCClient_conversationProviderForIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Error getting conversation provider with identifier: %@ error: %@", (uint8_t *)&v7, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);

}

- (void)registerForCallbacksForProvider:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __92__TUConversationProviderManagerXPCClient_registerForCallbacksForProvider_completionHandler___block_invoke;
  v14 = &unk_1E38A30E0;
  v15 = v6;
  v16 = v7;
  v8 = v7;
  v9 = v6;
  -[TUConversationProviderManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerForCallbacksForProvider:completionHandler:", v9, v8, v11, v12, v13, v14);

}

void __92__TUConversationProviderManagerXPCClient_registerForCallbacksForProvider_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Error registering callbacks for conversation provider: %@ error: %@", (uint8_t *)&v7, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

- (void)registerConversationProvider:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __89__TUConversationProviderManagerXPCClient_registerConversationProvider_completionHandler___block_invoke;
  v14 = &unk_1E38A30E0;
  v15 = v6;
  v16 = v7;
  v8 = v7;
  v9 = v6;
  -[TUConversationProviderManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerConversationProvider:completionHandler:", v9, v8, v11, v12, v13, v14);

}

void __89__TUConversationProviderManagerXPCClient_registerConversationProvider_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Error registering conversation provider: %@ error: %@", (uint8_t *)&v7, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

- (void)generatePseudonymHandleForConversationProvider:(id)a3 expiryDuration:(double)a4 URI:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;

  v10 = a3;
  v11 = a6;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __126__TUConversationProviderManagerXPCClient_generatePseudonymHandleForConversationProvider_expiryDuration_URI_completionHandler___block_invoke;
  v19 = &unk_1E38A30E0;
  v20 = v10;
  v21 = v11;
  v12 = v11;
  v13 = v10;
  v14 = a5;
  -[TUConversationProviderManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "generatePseudonymHandleForConversationProvider:expiryDuration:URI:completionHandler:", v13, v14, v12, a4, v16, v17, v18, v19);

}

void __126__TUConversationProviderManagerXPCClient_generatePseudonymHandleForConversationProvider_expiryDuration_URI_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Error generating pseudonym handle for conversation provider: %@ error: %@", (uint8_t *)&v7, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v6 + 16))(v6, 0, 0, v3);

}

- (void)renewPseudonymHandle:(id)a3 forConversationProvider:(id)a4 expirationDate:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __120__TUConversationProviderManagerXPCClient_renewPseudonymHandle_forConversationProvider_expirationDate_completionHandler___block_invoke;
  v18[3] = &unk_1E38A2128;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  v16 = a5;
  -[TUConversationProviderManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "renewPseudonymHandle:forConversationProvider:expirationDate:completionHandler:", v15, v14, v16, v13);

}

void __120__TUConversationProviderManagerXPCClient_renewPseudonymHandle_forConversationProvider_expirationDate_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v8 = 138412802;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Error renewing pseudonym handle: %@ for conversation provider: %@ error: %@", (uint8_t *)&v8, 0x20u);
  }

  v7 = a1[6];
  if (v7)
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v7 + 16))(v7, 0, 0, v3);

}

- (void)revokePseudonymHandle:(id)a3 forConversationProvider:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __106__TUConversationProviderManagerXPCClient_revokePseudonymHandle_forConversationProvider_completionHandler___block_invoke;
  v15[3] = &unk_1E38A2128;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[TUConversationProviderManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "revokePseudonymHandle:forConversationProvider:completionHandler:", v13, v12, v11);

}

void __106__TUConversationProviderManagerXPCClient_revokePseudonymHandle_forConversationProvider_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v8 = 138412802;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Error revoking pseudonym handle: %@ for conversation provider: %@ error: %@", (uint8_t *)&v8, 0x20u);
  }

  v7 = a1[6];
  if (v7)
    (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v3);

}

- (void)doesHandle:(id)a3 correspondToConversationProvider:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __104__TUConversationProviderManagerXPCClient_doesHandle_correspondToConversationProvider_completionHandler___block_invoke;
  v15[3] = &unk_1E38A2128;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[TUConversationProviderManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doesHandle:correspondToConversationProvider:completionHandler:", v13, v12, v11);

}

void __104__TUConversationProviderManagerXPCClient_doesHandle_correspondToConversationProvider_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v8 = 138412802;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Error when checking if pseudonym handle: %@ corresponds to conversation provider: %@ error: %@", (uint8_t *)&v8, 0x20u);
  }

  v7 = a1[6];
  if (v7)
    (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v3);

}

- (void)invalidate
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[TUConversationProviderManagerXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__TUConversationProviderManagerXPCClient_invalidate__block_invoke;
  v4[3] = &unk_1E38A13D0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __52__TUConversationProviderManagerXPCClient_invalidate__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  id v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained[2], "invalidate");
    v3 = objc_loadWeakRetained(&sAsynchronousServer_4);
    objc_msgSend(v3, "unregisterClient:", v5);

    v4 = objc_loadWeakRetained(&sSynchronousServer_4);
    objc_msgSend(v4, "unregisterClient:", v5);

    v2 = v5;
  }

}

- (void)_requestInitialStateIfNecessary
{
  NSObject *v3;

  -[TUConversationProviderManagerXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!-[TUConversationProviderManagerXPCClient hasRequestedInitialState](self, "hasRequestedInitialState"))
    -[TUConversationProviderManagerXPCClient _requestInitialStateWithCompletionHandler:](self, "_requestInitialStateWithCompletionHandler:", 0);
}

- (void)_requestInitialStateWithCompletionHandler:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  -[TUConversationProviderManagerXPCClient queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[TUConversationProviderManagerXPCClient setHasRequestedInitialState:](self, "setHasRequestedInitialState:", 1);
  -[TUConversationProviderManagerXPCClient _invokeCompletionHandler:](self, "_invokeCompletionHandler:", v5);

}

- (void)_invokeCompletionHandler:(id)a3
{
  NSObject *v4;

  if (a3)
  {
    dispatch_get_global_queue(21, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v4, a3);

  }
}

- (NSXPCConnection)xpcConnection
{
  NSObject *v3;
  _QWORD block[5];

  -[TUConversationProviderManagerXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__TUConversationProviderManagerXPCClient_xpcConnection__block_invoke;
  block[3] = &unk_1E38A1360;
  block[4] = self;
  dispatch_sync(v3, block);

  return self->_xpcConnection;
}

void __55__TUConversationProviderManagerXPCClient_xpcConnection__block_invoke(uint64_t a1)
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

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    TUDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Starting XPC Connection.", (uint8_t *)buf, 2u);
    }

    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.telephonyutilities.callservicesdaemon.conversationprovidermanager"), 0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    objc_msgSend((id)objc_opt_class(), "conversationProviderManagerServerXPCInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setRemoteObjectInterface:", v6);

    objc_msgSend((id)objc_opt_class(), "conversationProviderManagerClientXPCInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setExportedInterface:", v7);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setExportedObject:");
    objc_initWeak(buf, *(id *)(a1 + 32));
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55__TUConversationProviderManagerXPCClient_xpcConnection__block_invoke_9;
    v14[3] = &unk_1E38A13D0;
    objc_copyWeak(&v15, buf);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setInvalidationHandler:", v14);
    v9 = v8;
    v10 = 3221225472;
    v11 = __55__TUConversationProviderManagerXPCClient_xpcConnection__block_invoke_10;
    v12 = &unk_1E38A13D0;
    objc_copyWeak(&v13, buf);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setInterruptionHandler:", &v9);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resume", v9, v10, v11, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);
  }
}

void __55__TUConversationProviderManagerXPCClient_xpcConnection__block_invoke_9(uint64_t a1)
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
    block[2] = __55__TUConversationProviderManagerXPCClient_xpcConnection__block_invoke_2;
    block[3] = &unk_1E38A1360;
    block[4] = v2;
    dispatch_async(v3, block);

  }
}

void __55__TUConversationProviderManagerXPCClient_xpcConnection__block_invoke_2(uint64_t a1)
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
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = 0;

}

void __55__TUConversationProviderManagerXPCClient_xpcConnection__block_invoke_10(uint64_t a1)
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
    block[2] = __55__TUConversationProviderManagerXPCClient_xpcConnection__block_invoke_2_11;
    block[3] = &unk_1E38A1360;
    block[4] = v2;
    dispatch_async(v3, block);

  }
}

uint64_t __55__TUConversationProviderManagerXPCClient_xpcConnection__block_invoke_2_11(uint64_t a1)
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

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");
}

- (id)asynchronousServerWithErrorHandler:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_4);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
  }
  else
  {
    -[TUConversationProviderManagerXPCClient xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)synchronousServerWithErrorHandler:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained(&sSynchronousServer_4);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
  }
  else
  {
    -[TUConversationProviderManagerXPCClient xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (NSSet)conversationProviderManagerAllowedClasses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v16 = (void *)MEMORY[0x1E0C99E60];
  v15 = objc_opt_class();
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  return (NSSet *)objc_msgSend(v16, "setWithObjects:", v15, v14, v13, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
}

+ (NSXPCInterface)conversationProviderManagerClientXPCInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__TUConversationProviderManagerXPCClient_conversationProviderManagerClientXPCInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (conversationProviderManagerClientXPCInterface_onceToken != -1)
    dispatch_once(&conversationProviderManagerClientXPCInterface_onceToken, block);
  return (NSXPCInterface *)(id)conversationProviderManagerClientXPCInterface_conversationProviderManagerClientXPCInterface;
}

void __87__TUConversationProviderManagerXPCClient_conversationProviderManagerClientXPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3D0BE0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)conversationProviderManagerClientXPCInterface_conversationProviderManagerClientXPCInterface;
  conversationProviderManagerClientXPCInterface_conversationProviderManagerClientXPCInterface = v2;

  v4 = (void *)conversationProviderManagerClientXPCInterface_conversationProviderManagerClientXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationProviderManagerAllowedClasses");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_updateConversationProviders_, 0, 0);

}

+ (NSXPCInterface)conversationProviderManagerServerXPCInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__TUConversationProviderManagerXPCClient_conversationProviderManagerServerXPCInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (conversationProviderManagerServerXPCInterface_onceToken != -1)
    dispatch_once(&conversationProviderManagerServerXPCInterface_onceToken, block);
  return (NSXPCInterface *)(id)conversationProviderManagerServerXPCInterface_conversationProviderManagerXPCInterface;
}

void __87__TUConversationProviderManagerXPCClient_conversationProviderManagerServerXPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3E7160);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)conversationProviderManagerServerXPCInterface_conversationProviderManagerXPCInterface;
  conversationProviderManagerServerXPCInterface_conversationProviderManagerXPCInterface = v2;

  v4 = (void *)conversationProviderManagerServerXPCInterface_conversationProviderManagerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationProviderManagerAllowedClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_conversationProviders_, 0, 0);

  v6 = (void *)conversationProviderManagerServerXPCInterface_conversationProviderManagerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationProviderManagerAllowedClasses");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_registerConversationProvider_completionHandler_, 0, 0);

}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)hasRequestedInitialState
{
  return self->_hasRequestedInitialState;
}

- (void)setHasRequestedInitialState:(BOOL)a3
{
  self->_hasRequestedInitialState = a3;
}

- (BOOL)hasInitialState
{
  return self->_hasInitialState;
}

- (void)setHasInitialState:(BOOL)a3
{
  self->_hasInitialState = a3;
}

- (int)shouldConnectToken
{
  return self->_shouldConnectToken;
}

- (void)setShouldConnectToken:(int)a3
{
  self->_shouldConnectToken = a3;
}

- (BOOL)shouldConnectToHost
{
  return self->_shouldConnectToHost;
}

- (void)setShouldConnectToHost:(BOOL)a3
{
  self->_shouldConnectToHost = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)init
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_debug_impl(&dword_19A50D000, log, OS_LOG_TYPE_DEBUG, "Registering TUConversationProviderManagerXPCClient %p with async server %p", (uint8_t *)&v3, 0x16u);
}

@end
