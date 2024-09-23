@implementation STDiagnosticsServiceClient

- (STDiagnosticsServiceClient)init
{
  STDiagnosticsServiceClient *v2;
  uint64_t v3;
  NSXPCConnection *connection;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  STDiagnosticsServiceProtocol *remoteObject;
  STDiagnosticsServiceClient *v16;
  NSObject *v17;
  uint8_t buf[16];
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)STDiagnosticsServiceClient;
  v2 = -[STDiagnosticsServiceClient init](&v20, sel_init);
  if (!v2)
    goto LABEL_4;
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.ScreenTimeAgent.command-line-tool"), 4096);
  connection = v2->_connection;
  v2->_connection = (NSXPCConnection *)v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC90498);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_didReceiveInboundMessage_, 0, 0);

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_didReceiveOutboundMessage_, 0, 0);

  -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v5);
  -[NSXPCConnection setExportedInterface:](v2->_connection, "setExportedInterface:", v5);
  -[NSXPCConnection setExportedObject:](v2->_connection, "setExportedObject:", v2);
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v2->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_4);
  v14 = objc_claimAutoreleasedReturnValue();
  remoteObject = v2->_remoteObject;
  v2->_remoteObject = (STDiagnosticsServiceProtocol *)v14;

  -[NSXPCConnection setInterruptionHandler:](v2->_connection, "setInterruptionHandler:", &__block_literal_global_37);
  -[NSXPCConnection setInvalidationHandler:](v2->_connection, "setInvalidationHandler:", &__block_literal_global_39);
  if (v2->_remoteObject)
  {
    -[NSXPCConnection resume](v2->_connection, "resume");

LABEL_4:
    v16 = v2;
    goto LABEL_8;
  }
  +[STLog test](STLog, "test");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D22E7000, v17, OS_LOG_TYPE_DEFAULT, "Failed to connect to ScreenTimeAgent", buf, 2u);
  }

  v16 = 0;
LABEL_8:

  return v16;
}

void __34__STDiagnosticsServiceClient_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[STLog test](STLog, "test");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1D22E7000, v3, OS_LOG_TYPE_DEFAULT, "Failed to connect to ScreenTimeAgent: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __34__STDiagnosticsServiceClient_init__block_invoke_35()
{
  NSObject *v0;
  uint8_t v1[16];

  +[STLog test](STLog, "test");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D22E7000, v0, OS_LOG_TYPE_DEFAULT, "ScreenTimeAgent connection interrupted", v1, 2u);
  }

}

void __34__STDiagnosticsServiceClient_init__block_invoke_38()
{
  NSObject *v0;
  uint8_t v1[16];

  +[STLog test](STLog, "test");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D22E7000, v0, OS_LOG_TYPE_DEFAULT, "ScreenTimeAgent connection invalidated", v1, 2u);
  }

}

- (void)registerCallback:(id)a3 forInboundMessagesFromIDSInterfaces:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  v8 = v6;
  if (v6)
  {
    -[STDiagnosticsServiceClient setInboundMessageCallback:](self, "setInboundMessageCallback:", v6);
    v6 = v8;
  }
  if ((unint64_t)a4 <= 1)
  {
    -[STDiagnosticsServiceClient remoteObject](self, "remoteObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerForInboundMessages");

    v6 = v8;
  }

}

- (void)registerCallback:(id)a3 forOutboundMessagesFromIDSInterfaces:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  v8 = v6;
  if (v6)
  {
    -[STDiagnosticsServiceClient setOutboundMessageCallback:](self, "setOutboundMessageCallback:", v6);
    v6 = v8;
  }
  if ((unint64_t)a4 <= 1)
  {
    -[STDiagnosticsServiceClient remoteObject](self, "remoteObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerForOutboundMessages");

    v6 = v8;
  }

}

- (void)didReceiveInboundMessage:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[STDiagnosticsServiceClient inboundMessageCallback](self, "inboundMessageCallback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[STDiagnosticsServiceClient inboundMessageCallback](self, "inboundMessageCallback");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (void)didReceiveOutboundMessage:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[STDiagnosticsServiceClient outboundMessageCallback](self, "outboundMessageCallback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[STDiagnosticsServiceClient outboundMessageCallback](self, "outboundMessageCallback");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (id)localConfigurationVersionWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  -[STDiagnosticsServiceClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__STDiagnosticsServiceClient_localConfigurationVersionWithError___block_invoke;
  v10[3] = &unk_1E9370AF0;
  v10[4] = &v11;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __65__STDiagnosticsServiceClient_localConfigurationVersionWithError___block_invoke_2;
  v9[3] = &unk_1E9371120;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v6, "localConfigurationVersionWithCompletionHandler:", v9);
  if (a3)
    *a3 = objc_retainAutorelease((id)v12[5]);
  v7 = (id)v18[5];

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

void __65__STDiagnosticsServiceClient_localConfigurationVersionWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __65__STDiagnosticsServiceClient_localConfigurationVersionWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);

}

- (BOOL)setLocalConfigurationVersion:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  _QWORD v12[6];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  -[STDiagnosticsServiceClient connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__STDiagnosticsServiceClient_setLocalConfigurationVersion_error___block_invoke;
  v13[3] = &unk_1E9371148;
  v13[4] = &v14;
  v13[5] = &v20;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __65__STDiagnosticsServiceClient_setLocalConfigurationVersion_error___block_invoke_2;
  v12[3] = &unk_1E9371148;
  v12[4] = &v14;
  v12[5] = &v20;
  objc_msgSend(v9, "setLocalConfigurationVersion:completionHandler:", v6, v12);
  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v10 = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __65__STDiagnosticsServiceClient_setLocalConfigurationVersion_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

void __65__STDiagnosticsServiceClient_setLocalConfigurationVersion_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

- (id)configurationVersionWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  -[STDiagnosticsServiceClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__STDiagnosticsServiceClient_configurationVersionWithError___block_invoke;
  v10[3] = &unk_1E9370AF0;
  v10[4] = &v11;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __60__STDiagnosticsServiceClient_configurationVersionWithError___block_invoke_2;
  v9[3] = &unk_1E9371120;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v6, "configurationVersionWithCompletionHandler:", v9);
  if (a3)
    *a3 = objc_retainAutorelease((id)v12[5]);
  v7 = (id)v18[5];

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

void __60__STDiagnosticsServiceClient_configurationVersionWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __60__STDiagnosticsServiceClient_configurationVersionWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);

}

- (BOOL)repairBlueprintsWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  -[STDiagnosticsServiceClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__STDiagnosticsServiceClient_repairBlueprintsWithError___block_invoke;
  v10[3] = &unk_1E9370AF0;
  v10[4] = &v11;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __56__STDiagnosticsServiceClient_repairBlueprintsWithError___block_invoke_2;
  v9[3] = &unk_1E9370B18;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v6, "repairBlueprintsWithCompletionHandler:", v9);
  if (a3)
    *a3 = objc_retainAutorelease((id)v12[5]);
  v7 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void __56__STDiagnosticsServiceClient_repairBlueprintsWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __56__STDiagnosticsServiceClient_repairBlueprintsWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)sendCheckInRequestWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  -[STDiagnosticsServiceClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__STDiagnosticsServiceClient_sendCheckInRequestWithError___block_invoke;
  v10[3] = &unk_1E9370AF0;
  v10[4] = &v11;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __58__STDiagnosticsServiceClient_sendCheckInRequestWithError___block_invoke_2;
  v9[3] = &unk_1E9370B18;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v6, "sendCheckInRequestWithCompletionHandler:", v9);
  if (a3)
    *a3 = objc_retainAutorelease((id)v12[5]);
  v7 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void __58__STDiagnosticsServiceClient_sendCheckInRequestWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __58__STDiagnosticsServiceClient_sendCheckInRequestWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)sendCheckInRequestOnV2WithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  -[STDiagnosticsServiceClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__STDiagnosticsServiceClient_sendCheckInRequestOnV2WithError___block_invoke;
  v10[3] = &unk_1E9370AF0;
  v10[4] = &v11;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __62__STDiagnosticsServiceClient_sendCheckInRequestOnV2WithError___block_invoke_2;
  v9[3] = &unk_1E9370B18;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v6, "sendCheckInRequestOnV2WithCompletionHandler:", v9);
  if (a3)
    *a3 = objc_retainAutorelease((id)v12[5]);
  v7 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void __62__STDiagnosticsServiceClient_sendCheckInRequestOnV2WithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __62__STDiagnosticsServiceClient_sendCheckInRequestOnV2WithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)sendBlueprintsWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  -[STDiagnosticsServiceClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__STDiagnosticsServiceClient_sendBlueprintsWithError___block_invoke;
  v10[3] = &unk_1E9370AF0;
  v10[4] = &v11;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __54__STDiagnosticsServiceClient_sendBlueprintsWithError___block_invoke_2;
  v9[3] = &unk_1E9370B18;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v6, "sendBlueprintsWithCompletionHandler:", v9);
  if (a3)
    *a3 = objc_retainAutorelease((id)v12[5]);
  v7 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void __54__STDiagnosticsServiceClient_sendBlueprintsWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __54__STDiagnosticsServiceClient_sendBlueprintsWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)sendBlueprintChangesWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  -[STDiagnosticsServiceClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__STDiagnosticsServiceClient_sendBlueprintChangesWithError___block_invoke;
  v10[3] = &unk_1E9370AF0;
  v10[4] = &v11;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __60__STDiagnosticsServiceClient_sendBlueprintChangesWithError___block_invoke_2;
  v9[3] = &unk_1E9370B18;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v6, "sendBlueprintChangesWithCompletionHandler:", v9);
  if (a3)
    *a3 = objc_retainAutorelease((id)v12[5]);
  v7 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void __60__STDiagnosticsServiceClient_sendBlueprintChangesWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __60__STDiagnosticsServiceClient_sendBlueprintChangesWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)sendSettingsWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  -[STDiagnosticsServiceClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__STDiagnosticsServiceClient_sendSettingsWithError___block_invoke;
  v10[3] = &unk_1E9370AF0;
  v10[4] = &v11;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __52__STDiagnosticsServiceClient_sendSettingsWithError___block_invoke_2;
  v9[3] = &unk_1E9370B18;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v6, "sendSettingsWithCompletionHandler:", v9);
  if (a3)
    *a3 = objc_retainAutorelease((id)v12[5]);
  v7 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void __52__STDiagnosticsServiceClient_sendSettingsWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __52__STDiagnosticsServiceClient_sendSettingsWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)sendSettingsChangesWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  -[STDiagnosticsServiceClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__STDiagnosticsServiceClient_sendSettingsChangesWithError___block_invoke;
  v10[3] = &unk_1E9370AF0;
  v10[4] = &v11;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __59__STDiagnosticsServiceClient_sendSettingsChangesWithError___block_invoke_2;
  v9[3] = &unk_1E9370B18;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v6, "sendSettingsChangesWithCompletionHandler:", v9);
  if (a3)
    *a3 = objc_retainAutorelease((id)v12[5]);
  v7 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void __59__STDiagnosticsServiceClient_sendSettingsChangesWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __59__STDiagnosticsServiceClient_sendSettingsChangesWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)sendUserDeviceStateWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  -[STDiagnosticsServiceClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__STDiagnosticsServiceClient_sendUserDeviceStateWithError___block_invoke;
  v10[3] = &unk_1E9370AF0;
  v10[4] = &v11;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __59__STDiagnosticsServiceClient_sendUserDeviceStateWithError___block_invoke_2;
  v9[3] = &unk_1E9370B18;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v6, "sendUserDeviceStateWithCompletionHandler:", v9);
  if (a3)
    *a3 = objc_retainAutorelease((id)v12[5]);
  v7 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void __59__STDiagnosticsServiceClient_sendUserDeviceStateWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __59__STDiagnosticsServiceClient_sendUserDeviceStateWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)postWeeklyReportNotification:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  _QWORD v9[6];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  -[STDiagnosticsServiceClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__STDiagnosticsServiceClient_postWeeklyReportNotification___block_invoke;
  v10[3] = &unk_1E9371148;
  v10[4] = &v11;
  v10[5] = &v17;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __59__STDiagnosticsServiceClient_postWeeklyReportNotification___block_invoke_2;
  v9[3] = &unk_1E9370B18;
  v9[4] = &v11;
  v9[5] = &v17;
  objc_msgSend(v6, "postWeeklyReportNotificationWithCompletionHandler:", v9);
  if (a3)
    *a3 = objc_retainAutorelease((id)v12[5]);
  v7 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void __59__STDiagnosticsServiceClient_postWeeklyReportNotification___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

void __59__STDiagnosticsServiceClient_postWeeklyReportNotification___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if ((a2 & 1) == 0)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

- (BOOL)postNotificationWithContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  _QWORD v12[6];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  -[STDiagnosticsServiceClient connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__STDiagnosticsServiceClient_postNotificationWithContext_error___block_invoke;
  v13[3] = &unk_1E9371148;
  v13[4] = &v14;
  v13[5] = &v20;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __64__STDiagnosticsServiceClient_postNotificationWithContext_error___block_invoke_2;
  v12[3] = &unk_1E9370B18;
  v12[4] = &v14;
  v12[5] = &v20;
  objc_msgSend(v9, "postNotificationWithContext:completionHandler:", v6, v12);
  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v10 = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __64__STDiagnosticsServiceClient_postNotificationWithContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

void __64__STDiagnosticsServiceClient_postNotificationWithContext_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if ((a2 & 1) == 0)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

- (BOOL)removeNotificationWithContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  _QWORD v12[6];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  -[STDiagnosticsServiceClient connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__STDiagnosticsServiceClient_removeNotificationWithContext_error___block_invoke;
  v13[3] = &unk_1E9371148;
  v13[4] = &v14;
  v13[5] = &v20;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __66__STDiagnosticsServiceClient_removeNotificationWithContext_error___block_invoke_2;
  v12[3] = &unk_1E9370B18;
  v12[4] = &v14;
  v12[5] = &v20;
  objc_msgSend(v9, "removeNotificationWithContext:completionHandler:", v6, v12);
  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v10 = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __66__STDiagnosticsServiceClient_removeNotificationWithContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

void __66__STDiagnosticsServiceClient_removeNotificationWithContext_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if ((a2 & 1) == 0)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

- (id)inboundMessageCallback
{
  return self->_inboundMessageCallback;
}

- (void)setInboundMessageCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)outboundMessageCallback
{
  return self->_outboundMessageCallback;
}

- (void)setOutboundMessageCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (STDiagnosticsServiceProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
  objc_storeStrong((id *)&self->_remoteObject, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong(&self->_outboundMessageCallback, 0);
  objc_storeStrong(&self->_inboundMessageCallback, 0);
}

@end
