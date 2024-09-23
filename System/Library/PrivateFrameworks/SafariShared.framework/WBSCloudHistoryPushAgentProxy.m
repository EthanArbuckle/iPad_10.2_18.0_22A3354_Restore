@implementation WBSCloudHistoryPushAgentProxy

- (WBSCloudHistoryPushAgentProxy)init
{
  WBSCloudHistoryPushAgentProxy *v2;
  uint64_t v3;
  NSXPCConnection *agentConnection;
  void *v5;
  WBSCloudHistoryPushAgentProxy *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WBSCloudHistoryPushAgentProxy;
  v2 = -[WBSCloudHistoryPushAgentProxy init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.SafariCloudHistoryPushAgent"), 0);
    agentConnection = v2->_agentConnection;
    v2->_agentConnection = (NSXPCConnection *)v3;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE705CE8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_agentConnection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection resume](v2->_agentConnection, "resume");
    v6 = v2;
  }

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_agentConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)WBSCloudHistoryPushAgentProxy;
  -[WBSCloudHistoryPushAgentProxy dealloc](&v3, sel_dealloc);
}

- (void)getPushNotifications:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSXPCConnection remoteObjectProxy](self->_agentConnection, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getPushNotifications:", v5);

}

- (id)queryMemoryFootprintWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v5 = MEMORY[0x1E0C809B0];
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__WBSCloudHistoryPushAgentProxy_queryMemoryFootprintWithError___block_invoke;
  v11[3] = &unk_1E4B2B830;
  v11[4] = &v12;
  v6 = (void *)MEMORY[0x1A8599ED0](v11, a2);
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_agentConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __63__WBSCloudHistoryPushAgentProxy_queryMemoryFootprintWithError___block_invoke_2;
  v10[3] = &unk_1E4B2B858;
  v10[4] = &v18;
  v10[5] = &v12;
  objc_msgSend(v7, "queryMemoryFootprint:", v10);

  if (a3)
    *a3 = objc_retainAutorelease((id)v13[5]);
  v8 = (id)v19[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __63__WBSCloudHistoryPushAgentProxy_queryMemoryFootprintWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __63__WBSCloudHistoryPushAgentProxy_queryMemoryFootprintWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)queryMemoryFootprint:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__WBSCloudHistoryPushAgentProxy_queryMemoryFootprint___block_invoke;
  v8[3] = &unk_1E4B2B320;
  v5 = v4;
  v9 = v5;
  v6 = (void *)MEMORY[0x1A8599ED0](v8);
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_agentConnection, "remoteObjectProxyWithErrorHandler:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryMemoryFootprint:", v5);

}

uint64_t __54__WBSCloudHistoryPushAgentProxy_queryMemoryFootprint___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)acknowledgePendingPushNotifications
{
  id v2;

  -[NSXPCConnection remoteObjectProxy](self->_agentConnection, "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "acknowledgePendingPushNotifications");

}

- (void)clearAcknowledgedPushNotifications
{
  id v2;

  -[NSXPCConnection remoteObjectProxy](self->_agentConnection, "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearAcknowledgedPushNotifications");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agentConnection, 0);
}

@end
