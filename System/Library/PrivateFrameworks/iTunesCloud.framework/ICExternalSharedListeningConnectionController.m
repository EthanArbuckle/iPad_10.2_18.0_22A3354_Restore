@implementation ICExternalSharedListeningConnectionController

- (ICExternalSharedListeningConnectionController)initWithSessionIdentifier:(id)a3 identity:(id)a4 bundleID:(id)a5
{
  ICExternalSharedListeningConnectionController *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *delegateQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICExternalSharedListeningConnectionController;
  v5 = -[ICSharedListeningConnectionController initWithSessionIdentifier:identity:bundleID:](&v10, sel_initWithSessionIdentifier_identity_bundleID_, a3, a4, a5);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.iTunesCloud.ICExternalSharedListeningConnectionController.delegateQueue", v6);
    delegateQueue = v5->_delegateQueue;
    v5->_delegateQueue = (OS_dispatch_queue *)v7;

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[ICExternalSharedListeningConnectionController xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)ICExternalSharedListeningConnectionController;
  -[ICExternalSharedListeningConnectionController dealloc](&v4, sel_dealloc);
}

- (void)_initializeConnectionIfNeeded
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  ICExternalSharedListeningConnectionController *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[ICExternalSharedListeningConnectionController xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v21 = self;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "[ICSharedListeningConnectionController][E] <%p> Initializing XPC connection.", buf, 0xCu);
    }

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.iTunesCloud.SharedListeningConnectionService"));
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5CA8C8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4D120], "proxyWithObject:protocol:", self, &unk_1EE5CA8C8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedObject:", v7);

    objc_msgSend(v5, "setExportedInterface:", v6);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5DDD88);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_populateSessionIdentifier_identity_, 1, 0);

    objc_msgSend(v5, "setRemoteObjectInterface:", v8);
    objc_initWeak((id *)buf, self);
    v10 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __78__ICExternalSharedListeningConnectionController__initializeConnectionIfNeeded__block_invoke;
    v18[3] = &unk_1E4391400;
    objc_copyWeak(&v19, (id *)buf);
    objc_msgSend(v5, "setInterruptionHandler:", v18);
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __78__ICExternalSharedListeningConnectionController__initializeConnectionIfNeeded__block_invoke_191;
    v16[3] = &unk_1E4391400;
    objc_copyWeak(&v17, (id *)buf);
    objc_msgSend(v5, "setInvalidationHandler:", v16);
    -[ICExternalSharedListeningConnectionController setXpcConnection:](self, "setXpcConnection:", v5);
    objc_msgSend(v5, "resume");
    -[ICExternalSharedListeningConnectionController xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __78__ICExternalSharedListeningConnectionController__initializeConnectionIfNeeded__block_invoke_194;
    v15[3] = &unk_1E43902A0;
    v15[4] = self;
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSharedListeningConnectionController sessionIdentifier](self, "sessionIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSharedListeningConnectionController identity](self, "identity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "populateSessionIdentifier:identity:", v13, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);

  }
}

- (void)start
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  ICExternalSharedListeningConnectionController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[ICExternalSharedListeningConnectionController _initializeConnectionIfNeeded](self, "_initializeConnectionIfNeeded");
  v3 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v8 = self;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "[ICSharedListeningConnectionController][E] <%p> Requesting hosted connection.", buf, 0xCu);
  }

  -[ICExternalSharedListeningConnectionController xpcConnection](self, "xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__ICExternalSharedListeningConnectionController_start__block_invoke;
  v6[3] = &unk_1E43902A0;
  v6[4] = self;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "start");

}

- (void)stop
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[ICExternalSharedListeningConnectionController xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__ICExternalSharedListeningConnectionController_stop__block_invoke;
  v5[3] = &unk_1E43902A0;
  v5[4] = self;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

}

- (void)sendMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v4 = a3;
  -[ICExternalSharedListeningConnectionController xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__ICExternalSharedListeningConnectionController_sendMessage___block_invoke;
  v8[3] = &unk_1E43902A0;
  v8[4] = self;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sendMessageData:", v7);
}

- (void)receiveStartWithSessionIdentifier:(id)a3 sessionToken:(id)a4 inviteURLString:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  ICExternalSharedListeningConnectionController *v15;

  v8 = a5;
  v9 = a4;
  -[ICSharedListeningConnectionController setSessionIdentifier:](self, "setSessionIdentifier:", a3);
  -[ICSharedListeningConnectionController setSessionToken:](self, "setSessionToken:", v9);

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICSharedListeningConnectionController setInviteURL:](self, "setInviteURL:", v10);
  -[ICSharedListeningConnectionController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ICExternalSharedListeningConnectionController delegateQueue](self, "delegateQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __112__ICExternalSharedListeningConnectionController_receiveStartWithSessionIdentifier_sessionToken_inviteURLString___block_invoke;
    v13[3] = &unk_1E4391110;
    v14 = v11;
    v15 = self;
    dispatch_async(v12, v13);

  }
}

- (void)receiveConnectionError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  ICExternalSharedListeningConnectionController *v9;
  id v10;

  v4 = a3;
  -[ICSharedListeningConnectionController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ICExternalSharedListeningConnectionController delegateQueue](self, "delegateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__ICExternalSharedListeningConnectionController_receiveConnectionError___block_invoke;
    block[3] = &unk_1E4391230;
    v8 = v5;
    v9 = self;
    v10 = v4;
    dispatch_async(v6, block);

  }
}

- (void)receiveFatalError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  ICExternalSharedListeningConnectionController *v9;
  id v10;

  v4 = a3;
  -[ICSharedListeningConnectionController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ICExternalSharedListeningConnectionController delegateQueue](self, "delegateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__ICExternalSharedListeningConnectionController_receiveFatalError___block_invoke;
    block[3] = &unk_1E4391230;
    v8 = v5;
    v9 = self;
    v10 = v4;
    dispatch_async(v6, block);

  }
}

- (void)receiveMessageData:(id)a3
{
  id v4;
  void *v5;
  _ICLLProtocolMessage *v6;
  NSObject *v7;
  _ICLLProtocolMessage *v8;
  _QWORD block[4];
  id v10;
  ICExternalSharedListeningConnectionController *v11;
  _ICLLProtocolMessage *v12;

  v4 = a3;
  -[ICSharedListeningConnectionController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = -[_ICLLProtocolMessage initWithData:]([_ICLLProtocolMessage alloc], "initWithData:", v4);
    -[ICExternalSharedListeningConnectionController delegateQueue](self, "delegateQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__ICExternalSharedListeningConnectionController_receiveMessageData___block_invoke;
    block[3] = &unk_1E4391230;
    v10 = v5;
    v11 = self;
    v12 = v6;
    v8 = v6;
    dispatch_async(v7, block);

  }
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

uint64_t __68__ICExternalSharedListeningConnectionController_receiveMessageData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "connectionController:connectionDidReceiveMessage:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __67__ICExternalSharedListeningConnectionController_receiveFatalError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "connectionController:didEncounterFatalError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __72__ICExternalSharedListeningConnectionController_receiveConnectionError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "connectionController:connectionDidEndWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __112__ICExternalSharedListeningConnectionController_receiveStartWithSessionIdentifier_sessionToken_inviteURLString___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "connectionControllerConnectionDidStart:", *(_QWORD *)(a1 + 40));
}

void __61__ICExternalSharedListeningConnectionController_sendMessage___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 134217984;
    v5 = v3;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_ERROR, "[ICSharedListeningConnectionController][E] <%p> Error retrieving proxy.", (uint8_t *)&v4, 0xCu);
  }

}

void __53__ICExternalSharedListeningConnectionController_stop__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 134217984;
    v5 = v3;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_ERROR, "[ICSharedListeningConnectionController][E] <%p> Error retrieving proxy.", (uint8_t *)&v4, 0xCu);
  }

}

void __54__ICExternalSharedListeningConnectionController_start__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 134217984;
    v5 = v3;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_ERROR, "[ICSharedListeningConnectionController][E] <%p> Error retrieving proxy.", (uint8_t *)&v4, 0xCu);
  }

}

void __78__ICExternalSharedListeningConnectionController__initializeConnectionIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = 134217984;
      v5 = WeakRetained;
      _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_ERROR, "[ICSharedListeningConnectionController][E] <%p> XPC interrupted.", (uint8_t *)&v4, 0xCu);
    }

    objc_msgSend(WeakRetained, "setXpcConnection:", 0);
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICSharedListeningConnectionControllerError"), 1, CFSTR("XPC connection interrupted."));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "receiveConnectionError:", v3);

  }
}

void __78__ICExternalSharedListeningConnectionController__initializeConnectionIfNeeded__block_invoke_191(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = 134217984;
      v5 = WeakRetained;
      _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_ERROR, "[ICSharedListeningConnectionController][E] <%p> XPC invalidated.", (uint8_t *)&v4, 0xCu);
    }

    objc_msgSend(WeakRetained, "setXpcConnection:", 0);
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICSharedListeningConnectionControllerError"), 1, CFSTR("XPC connection invalidated."));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "receiveConnectionError:", v3);

  }
}

void __78__ICExternalSharedListeningConnectionController__initializeConnectionIfNeeded__block_invoke_194(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 134217984;
    v5 = v3;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_ERROR, "[ICSharedListeningConnectionController][E] <%p> Error retrieving proxy.", (uint8_t *)&v4, 0xCu);
  }

}

@end
