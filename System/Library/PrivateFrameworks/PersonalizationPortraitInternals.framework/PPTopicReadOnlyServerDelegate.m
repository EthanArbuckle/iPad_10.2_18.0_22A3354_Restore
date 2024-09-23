@implementation PPTopicReadOnlyServerDelegate

- (PPTopicReadOnlyServerDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPTopicReadOnlyServerDelegate;
  return -[PPTopicReadOnlyServerDelegate init](&v3, sel_init);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  BOOL v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD aBlock[4];
  id v22;

  v4 = (void *)MEMORY[0x1E0CB3B50];
  v5 = a4;
  objc_msgSend(v4, "interfaceWithProtocol:", &unk_1EF8FFBB0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF919400);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PPTopicReadOnlyServerDelegate_listener_shouldAcceptNewConnection___block_invoke;
  aBlock[3] = &unk_1E7E1D460;
  v10 = v8;
  v22 = v10;
  v11 = _Block_copy(aBlock);
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __68__PPTopicReadOnlyServerDelegate_listener_shouldAcceptNewConnection___block_invoke_2;
  v19[3] = &unk_1E7E1D488;
  v20 = v10;
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __68__PPTopicReadOnlyServerDelegate_listener_shouldAcceptNewConnection___block_invoke_3;
  v17[3] = &unk_1E7E1F4F0;
  v18 = v20;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __68__PPTopicReadOnlyServerDelegate_listener_shouldAcceptNewConnection___block_invoke_4;
  v15[3] = &unk_1E7E1F4F0;
  v16 = v18;
  v12 = v18;
  v13 = +[PPXPCServerHelper shouldAcceptConnection:serviceName:allowedServerInterface:allowedClientInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:](PPXPCServerHelper, "shouldAcceptConnection:serviceName:allowedServerInterface:allowedClientInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:", v5, CFSTR("com.apple.proactive.PersonalizationPortrait.Topic.readOnly"), v6, v7, v12, v11, v19, v17, v15);

  return v13;
}

BOOL __68__PPTopicReadOnlyServerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  _BOOL8 v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "setClientProcessName:", a3);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81540]), "initWithProcessIdentifier:", objc_msgSend(v6, "processIdentifier"));
  objc_msgSend(*(id *)(a1 + 32), "setBundleIdResolver:", v7);

  v8 = +[PPXPCServerHelper checkForAndLogTrueBooleanEntitlement:connection:serviceName:](PPXPCServerHelper, "checkForAndLogTrueBooleanEntitlement:connection:serviceName:", CFSTR("com.apple.proactive.PersonalizationPortrait.Topic.readOnly"), v6, CFSTR("com.apple.proactive.PersonalizationPortrait.Topic.readOnly"));
  return v8;
}

uint64_t __68__PPTopicReadOnlyServerDelegate_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRemoteObjectProxy:", a2);
}

uint64_t __68__PPTopicReadOnlyServerDelegate_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unblockPendingQueries");
}

uint64_t __68__PPTopicReadOnlyServerDelegate_listener_shouldAcceptNewConnection___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unblockPendingQueries");
}

@end
