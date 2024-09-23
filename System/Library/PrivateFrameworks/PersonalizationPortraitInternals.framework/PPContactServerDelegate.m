@implementation PPContactServerDelegate

- (PPContactServerDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPContactServerDelegate;
  return -[PPContactServerDelegate init](&v3, sel_init);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  BOOL v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD aBlock[4];
  id v27;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF9015B0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1C3BD6630]();
  v9 = objc_alloc(MEMORY[0x1E0C99E60]);
  v10 = objc_opt_class();
  v11 = (void *)objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_contactHandlesForTopics_queryId_, 0, 0);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF919738);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PPContactServerDelegate_listener_shouldAcceptNewConnection___block_invoke;
  aBlock[3] = &unk_1E7E1D460;
  v15 = v13;
  v27 = v15;
  v16 = _Block_copy(aBlock);
  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = __62__PPContactServerDelegate_listener_shouldAcceptNewConnection___block_invoke_2;
  v24[3] = &unk_1E7E1D488;
  v25 = v15;
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __62__PPContactServerDelegate_listener_shouldAcceptNewConnection___block_invoke_3;
  v22[3] = &unk_1E7E1F4F0;
  v23 = v25;
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __62__PPContactServerDelegate_listener_shouldAcceptNewConnection___block_invoke_4;
  v20[3] = &unk_1E7E1F4F0;
  v21 = v23;
  v17 = v23;
  v18 = +[PPXPCServerHelper shouldAcceptConnection:serviceName:allowedServerInterface:allowedClientInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:](PPXPCServerHelper, "shouldAcceptConnection:serviceName:allowedServerInterface:allowedClientInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:", v6, CFSTR("com.apple.proactive.PersonalizationPortrait.Contact"), v7, v12, v17, v16, v24, v22, v20);

  return v18;
}

BOOL __62__PPContactServerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  _BOOL8 v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "setClientProcessName:", a3);
  v6 = +[PPXPCServerHelper checkForAndLogTrueBooleanEntitlement:connection:serviceName:](PPXPCServerHelper, "checkForAndLogTrueBooleanEntitlement:connection:serviceName:", CFSTR("com.apple.proactive.PersonalizationPortrait.Contact"), v5, CFSTR("com.apple.proactive.PersonalizationPortrait.Contact"));

  return v6;
}

uint64_t __62__PPContactServerDelegate_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRemoteObjectProxy:", a2);
}

uint64_t __62__PPContactServerDelegate_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIsTerminated");
  return objc_msgSend(*(id *)(a1 + 32), "unblockPendingQueries");
}

uint64_t __62__PPContactServerDelegate_listener_shouldAcceptNewConnection___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIsTerminated");
  return objc_msgSend(*(id *)(a1 + 32), "unblockPendingQueries");
}

@end
