@implementation PLRemoteDiagnosticsClient

+ (id)diagnosticsAgentWithErrorHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;
  void *v9;
  int v10;
  id v11;
  id v12;
  BOOL v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  void (**v21)(_QWORD, _QWORD);
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __62__PLRemoteDiagnosticsClient_diagnosticsAgentWithErrorHandler___block_invoke;
  v24[3] = &unk_1E3676858;
  v6 = v4;
  v25 = v6;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](v24);
  v8 = objc_alloc_init(MEMORY[0x1E0D73268]);
  objc_msgSend(v8, "libraryManagementClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = 0;
  v10 = objc_msgSend(v9, "getPhotosXPCEndpoint:error:", &v23, &v22);
  v11 = v23;
  v12 = v22;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PXRemoteDiagnosticsService"), -36, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v7)[2](v7, v14);
    v18 = 0;
  }
  else
  {
    v14 = objc_alloc_init(MEMORY[0x1E0CB3B60]);
    objc_msgSend(v14, "_setEndpoint:", v11);
    objc_msgSend(a1, "_connectionForListenerEndpoint:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v5;
    v17 = (void *)v15;
    v20[0] = v16;
    v20[1] = 3221225472;
    v20[2] = __62__PLRemoteDiagnosticsClient_diagnosticsAgentWithErrorHandler___block_invoke_2;
    v20[3] = &unk_1E3676858;
    v21 = v7;
    objc_msgSend(v17, "remoteObjectProxyWithErrorHandler:", v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

+ (id)_connectionForListenerEndpoint:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3B38];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithListenerEndpoint:", v4);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE44D2F0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v6);

  objc_msgSend(v5, "resume");
  return v5;
}

void __62__PLRemoteDiagnosticsClient_diagnosticsAgentWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  else
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "error getting remote object proxy: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

uint64_t __62__PLRemoteDiagnosticsClient_diagnosticsAgentWithErrorHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
