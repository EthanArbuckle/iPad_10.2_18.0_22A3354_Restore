@implementation SLGLogXPCClient

- (SLGLogXPCClient)init
{
  SLGLogXPCClient *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *lockQueue;
  dispatch_queue_t v6;
  OS_dispatch_queue *calloutQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SLGLogXPCClient;
  v2 = -[SLGLogXPCClient init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("SLGLogXPCClientLock", v3);
    lockQueue = v2->_lockQueue;
    v2->_lockQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_create("SLGLogXPCClientCallout", v3);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v6;

    -[SLGLogXPCClient _handshake](v2, "_handshake");
  }
  return v2;
}

- (void)dealloc
{
  NSXPCConnection *connection;
  objc_super v4;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)SLGLogXPCClient;
  -[SLGLogXPCClient dealloc](&v4, sel_dealloc);
}

- (void)queryServer:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__SLGLogXPCClient_queryServer_errorHandler___block_invoke;
  v10[3] = &unk_1E81F34B8;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[SLGLogXPCClient _connectWithCompletion:](self, "_connectWithCompletion:", v10);

}

void __44__SLGLogXPCClient_queryServer_errorHandler___block_invoke(_QWORD *a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  if (a2)
  {
    v6 = (void *)a1[5];
    v7 = *(void **)(a1[4] + 8);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __44__SLGLogXPCClient_queryServer_errorHandler___block_invoke_2;
    v10[3] = &unk_1E81F3490;
    v11 = v6;
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(a1[6] + 16))();

  }
  else
  {
    v9 = a1[5];
    if (v9)
      (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v5);
  }

}

uint64_t __44__SLGLogXPCClient_queryServer_errorHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)didReceiveInitialLogMessageFromDomain:(id)a3
{
  id v4;
  NSObject *lockQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  lockQueue = self->_lockQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__SLGLogXPCClient_didReceiveInitialLogMessageFromDomain___block_invoke;
  block[3] = &unk_1E81F3248;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(lockQueue, block);

}

void __57__SLGLogXPCClient_didReceiveInitialLogMessageFromDomain___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(v3 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__SLGLogXPCClient_didReceiveInitialLogMessageFromDomain___block_invoke_2;
  block[3] = &unk_1E81F3420;
  v8 = WeakRetained;
  v9 = v3;
  v10 = v4;
  v6 = WeakRetained;
  dispatch_async(v5, block);

}

uint64_t __57__SLGLogXPCClient_didReceiveInitialLogMessageFromDomain___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "client:didReceiveInitialLogMessageFromDomain:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)serverDidReset
{
  NSObject *lockQueue;
  _QWORD block[5];

  lockQueue = self->_lockQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SLGLogXPCClient_serverDidReset__block_invoke;
  block[3] = &unk_1E81F3270;
  block[4] = self;
  dispatch_sync(lockQueue, block);
}

void __33__SLGLogXPCClient_serverDidReset__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 24);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__SLGLogXPCClient_serverDidReset__block_invoke_2;
  v6[3] = &unk_1E81F3248;
  v7 = WeakRetained;
  v8 = v3;
  v5 = WeakRetained;
  dispatch_async(v4, v6);

}

uint64_t __33__SLGLogXPCClient_serverDidReset__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clientDidReceiveServerReset:", *(_QWORD *)(a1 + 40));
}

- (void)_connectWithCompletion:(id)a3
{
  id v4;
  NSObject *lockQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  lockQueue = self->_lockQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__SLGLogXPCClient__connectWithCompletion___block_invoke;
  v7[3] = &unk_1E81F3508;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(lockQueue, v7);

}

void __42__SLGLogXPCClient__connectWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (v2)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, 1, 0);
  }
  else
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.internal.studylogd"), 0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF8FF718);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRemoteObjectInterface:", v7);

    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF8FF1C0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExportedInterface:", v9);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:");
    objc_initWeak(&location, *(id *)(a1 + 32));
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v11 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __42__SLGLogXPCClient__connectWithCompletion___block_invoke_2;
    v16[3] = &unk_1E81F34E0;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v10, "setInterruptionHandler:", v16);
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __42__SLGLogXPCClient__connectWithCompletion___block_invoke_67;
    v14[3] = &unk_1E81F34E0;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v12, "setInvalidationHandler:", v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "resume");
    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v13 + 16))(v13, 1, 0);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __42__SLGLogXPCClient__connectWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  slg_general_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1C890B000, v2, OS_LOG_TYPE_DEFAULT, "Connection to daemon was interrupted", v3, 2u);
  }

  objc_msgSend(WeakRetained, "_handshake");
}

void __42__SLGLogXPCClient__connectWithCompletion___block_invoke_67(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  slg_general_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __42__SLGLogXPCClient__connectWithCompletion___block_invoke_67_cold_1(v2);

  v3 = WeakRetained[2];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SLGLogXPCClient__connectWithCompletion___block_invoke_68;
  block[3] = &unk_1E81F3270;
  block[4] = WeakRetained;
  dispatch_async(v3, block);

}

void __42__SLGLogXPCClient__connectWithCompletion___block_invoke_68(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

- (void)_handshake
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __29__SLGLogXPCClient__handshake__block_invoke;
  v2[3] = &unk_1E81F3530;
  v2[4] = self;
  -[SLGLogXPCClient _connectWithCompletion:](self, "_connectWithCompletion:", v2);
}

void __29__SLGLogXPCClient__handshake__block_invoke(uint64_t a1, int a2)
{
  id v2;

  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteObjectProxy");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handshake");

  }
}

- (SLGLogClientProtocolDelegate)delegate
{
  return (SLGLogClientProtocolDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_lockQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __42__SLGLogXPCClient__connectWithCompletion___block_invoke_67_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C890B000, log, OS_LOG_TYPE_ERROR, "Connection to daemon was invalidated", v1, 2u);
}

@end
