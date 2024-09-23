@implementation STAskForTimeClient

- (STAskForTimeClient)init
{
  STAskForTimeClient *v2;
  STAskServiceClient *v3;
  STAskServiceClient *askServiceClient;
  uint64_t v5;
  NSXPCConnection *xpcConnection;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STAskForTimeClient;
  v2 = -[STAskForTimeClient init](&v9, sel_init);
  if (v2)
  {
    if (_os_feature_enabled_impl())
    {
      v3 = objc_alloc_init(STAskServiceClient);
      askServiceClient = v2->_askServiceClient;
      v2->_askServiceClient = v3;

    }
    else
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.ScreenTimeAgent.ask-for-time"), 4096);
      xpcConnection = v2->_xpcConnection;
      v2->_xpcConnection = (NSXPCConnection *)v5;

      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC7CA48);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](v2->_xpcConnection, "setRemoteObjectInterface:", v7);

      -[NSXPCConnection resume](v2->_xpcConnection, "resume");
    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  if ((_os_feature_enabled_impl() & 1) == 0)
    -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)STAskForTimeClient;
  -[STAskForTimeClient dealloc](&v3, sel_dealloc);
}

- (void)sendAskForTimeRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  STAskForTimeClient *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (_os_feature_enabled_impl())
  {
    -[STAskForTimeClient askServiceClient](self, "askServiceClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendAskForTimeRequest:completionHandler:", v6, v7);

  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__STAskForTimeClient_sendAskForTimeRequest_completionHandler___block_invoke;
    v9[3] = &unk_1E9370B68;
    v10 = v6;
    v11 = self;
    v12 = v7;
    -[STAskForTimeClient _asynchronousProxyWithHandler:](self, "_asynchronousProxyWithHandler:", v9);

  }
}

void __62__STAskForTimeClient_sendAskForTimeRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__STAskForTimeClient_sendAskForTimeRequest_completionHandler___block_invoke_2;
    v9[3] = &unk_1E9370B40;
    v7 = *(_QWORD *)(a1 + 32);
    v9[4] = *(_QWORD *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v5, "sendAskForTimeRequest:completionHandler:", v7, v9);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
  }

}

uint64_t __62__STAskForTimeClient_sendAskForTimeRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)approveExceptionForRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  STAskForTimeClient *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (_os_feature_enabled_impl())
  {
    -[STAskForTimeClient askServiceClient](self, "askServiceClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "approveExceptionForRequest:completionHandler:", v6, v7);

  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __67__STAskForTimeClient_approveExceptionForRequest_completionHandler___block_invoke;
    v9[3] = &unk_1E9370B68;
    v10 = v6;
    v11 = self;
    v12 = v7;
    -[STAskForTimeClient _asynchronousProxyWithHandler:](self, "_asynchronousProxyWithHandler:", v9);

  }
}

void __67__STAskForTimeClient_approveExceptionForRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __67__STAskForTimeClient_approveExceptionForRequest_completionHandler___block_invoke_2;
    v9[3] = &unk_1E9370B40;
    v7 = *(_QWORD *)(a1 + 32);
    v9[4] = *(_QWORD *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v5, "approveExceptionForRequest:completionHandler:", v7, v9);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
  }

}

uint64_t __67__STAskForTimeClient_approveExceptionForRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchLastResponseForRequestedResourceIdentifier:(id)a3 usageType:(int64_t)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  STAskForTimeClient *v12;
  id v13;
  int64_t v14;

  v8 = a3;
  v9 = a5;
  if (_os_feature_enabled_impl())
  {
    if (v9)
      (*((void (**)(id, uint64_t, _QWORD, _QWORD))v9 + 2))(v9, 4, 0, 0);
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __102__STAskForTimeClient_fetchLastResponseForRequestedResourceIdentifier_usageType_withCompletionHandler___block_invoke;
    v10[3] = &unk_1E9370BB8;
    v14 = a4;
    v11 = v8;
    v12 = self;
    v13 = v9;
    -[STAskForTimeClient _asynchronousProxyWithHandler:](self, "_asynchronousProxyWithHandler:", v10);

  }
}

void __102__STAskForTimeClient_fetchLastResponseForRequestedResourceIdentifier_usageType_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __102__STAskForTimeClient_fetchLastResponseForRequestedResourceIdentifier_usageType_withCompletionHandler___block_invoke_2;
    v10[3] = &unk_1E9370B90;
    v7 = *(_QWORD *)(a1 + 32);
    v10[4] = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 56);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v5, "fetchLastResponseForRequestedResourceIdentifier:usageType:withCompletionHandler:", v7, v8, v10);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v9 + 16))(v9, 0, 0, v6);
  }

}

uint64_t __102__STAskForTimeClient_fetchLastResponseForRequestedResourceIdentifier_usageType_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)handleAnswer:(int64_t)a3 requestIdentifier:(id)a4 timeApproved:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  STAskForTimeClient *v20;
  id v21;
  int64_t v22;
  _QWORD v23[4];
  id v24;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (_os_feature_enabled_impl())
  {
    -[STAskForTimeClient askServiceClient](self, "askServiceClient");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __84__STAskForTimeClient_handleAnswer_requestIdentifier_timeApproved_completionHandler___block_invoke;
    v23[3] = &unk_1E9370BE0;
    v14 = &v24;
    v24 = v12;
    v15 = v12;
    objc_msgSend(v13, "handleAnswer:requestIdentifier:timeApproved:completionHandler:", a3, v10, v11, v23);
  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __84__STAskForTimeClient_handleAnswer_requestIdentifier_timeApproved_completionHandler___block_invoke_61;
    v17[3] = &unk_1E9370C30;
    v22 = a3;
    v14 = &v18;
    v18 = v10;
    v19 = v11;
    v20 = self;
    v21 = v12;
    v16 = v12;
    -[STAskForTimeClient _asynchronousProxyWithHandler:](self, "_asynchronousProxyWithHandler:", v17);

    v13 = v19;
  }

}

void __84__STAskForTimeClient_handleAnswer_requestIdentifier_timeApproved_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[STLog ask](STLog, "ask");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __84__STAskForTimeClient_handleAnswer_requestIdentifier_timeApproved_completionHandler___block_invoke_cold_1((uint64_t)v3, v4);

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

void __84__STAskForTimeClient_handleAnswer_requestIdentifier_timeApproved_completionHandler___block_invoke_61(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = a1[4];
    v8 = a1[5];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __84__STAskForTimeClient_handleAnswer_requestIdentifier_timeApproved_completionHandler___block_invoke_2;
    v12[3] = &unk_1E9370C08;
    v9 = (void *)a1[7];
    v10 = a1[8];
    v12[4] = a1[6];
    v13 = v9;
    objc_msgSend(v5, "handleAnswer:requestIdentifier:timeApproved:completionHandler:", v10, v7, v8, v12);

  }
  else
  {
    v11 = a1[7];
    if (v11)
      (*(void (**)(void))(v11 + 16))();
  }

}

uint64_t __84__STAskForTimeClient_handleAnswer_requestIdentifier_timeApproved_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_synchronousProxyWithHandler:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(id, void *, _QWORD);
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[STAskForTimeClient xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__STAskForTimeClient__synchronousProxyWithHandler___block_invoke;
  v8[3] = &unk_1E9370BE0;
  v9 = v4;
  v6 = (void (**)(id, void *, _QWORD))v4;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7, 0);

}

void __51__STAskForTimeClient__synchronousProxyWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[STLog ask](STLog, "ask");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __51__STAskForTimeClient__synchronousProxyWithHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_asynchronousProxyWithHandler:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(id, void *, _QWORD);
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[STAskForTimeClient xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__STAskForTimeClient__asynchronousProxyWithHandler___block_invoke;
  v8[3] = &unk_1E9370BE0;
  v9 = v4;
  v6 = (void (**)(id, void *, _QWORD))v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7, 0);

}

void __52__STAskForTimeClient__asynchronousProxyWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[STLog ask](STLog, "ask");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __51__STAskForTimeClient__synchronousProxyWithHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (STAskServiceClient)askServiceClient
{
  return self->_askServiceClient;
}

- (void)setAskServiceClient:(id)a3
{
  objc_storeStrong((id *)&self->_askServiceClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_askServiceClient, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __84__STAskForTimeClient_handleAnswer_requestIdentifier_timeApproved_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D22E7000, a2, OS_LOG_TYPE_ERROR, "handleAnswer failed with: %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __51__STAskForTimeClient__synchronousProxyWithHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1D22E7000, v0, v1, "Connection error from %{public}@: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
