@implementation PPTemporalClusterServerDelegate

- (PPTemporalClusterServerDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPTemporalClusterServerDelegate;
  return -[PPTemporalClusterServerDelegate init](&v3, sel_init);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD aBlock[4];
  id v32;

  v24 = a3;
  v23 = a4;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF8FFD78);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1C3BD6630]();
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = (void *)objc_msgSend(v7, "initWithObjects:", v8, v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_rankedTemporalClustersForStartDate_endDate_queryId_, 0, 0);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF9194A0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_opt_new();
  v18 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PPTemporalClusterServerDelegate_listener_shouldAcceptNewConnection___block_invoke;
  aBlock[3] = &unk_1E7E1D460;
  v19 = v17;
  v32 = v19;
  v20 = _Block_copy(aBlock);
  v29[0] = v18;
  v29[1] = 3221225472;
  v29[2] = __70__PPTemporalClusterServerDelegate_listener_shouldAcceptNewConnection___block_invoke_2;
  v29[3] = &unk_1E7E1D488;
  v30 = v19;
  v27[0] = v18;
  v27[1] = 3221225472;
  v27[2] = __70__PPTemporalClusterServerDelegate_listener_shouldAcceptNewConnection___block_invoke_3;
  v27[3] = &unk_1E7E1F4F0;
  v28 = v30;
  v25[0] = v18;
  v25[1] = 3221225472;
  v25[2] = __70__PPTemporalClusterServerDelegate_listener_shouldAcceptNewConnection___block_invoke_4;
  v25[3] = &unk_1E7E1F4F0;
  v26 = v28;
  v21 = v28;
  LOBYTE(v14) = +[PPXPCServerHelper shouldAcceptConnection:serviceName:allowedServerInterface:allowedClientInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:](PPXPCServerHelper, "shouldAcceptConnection:serviceName:allowedServerInterface:allowedClientInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:", v23, CFSTR("com.apple.proactive.PersonalizationPortrait.TemporalCluster"), v5, v16, v21, v20, v29, v27, v25);

  return v14;
}

BOOL __70__PPTemporalClusterServerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  _BOOL8 v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "setClientProcessName:", a3);
  v6 = +[PPXPCServerHelper checkForAndLogTrueBooleanEntitlement:connection:serviceName:](PPXPCServerHelper, "checkForAndLogTrueBooleanEntitlement:connection:serviceName:", CFSTR("com.apple.proactive.PersonalizationPortrait.TemporalCluster"), v5, CFSTR("com.apple.proactive.PersonalizationPortrait.TemporalCluster"));

  return v6;
}

uint64_t __70__PPTemporalClusterServerDelegate_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRemoteObjectProxy:", a2);
}

uint64_t __70__PPTemporalClusterServerDelegate_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unblockPendingQueries");
}

uint64_t __70__PPTemporalClusterServerDelegate_listener_shouldAcceptNewConnection___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unblockPendingQueries");
}

@end
