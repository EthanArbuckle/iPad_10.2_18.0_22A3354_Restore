@implementation STAskClient

- (STAskClient)init
{
  STAskClient *v2;
  STAskServiceClient *v3;
  STAskServiceClient *askServiceClient;
  NSXPCConnection *v5;
  NSXPCConnection *connection;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STAskClient;
  v2 = -[STAskClient init](&v8, sel_init);
  if (_os_feature_enabled_impl())
  {
    v3 = -[STAskServiceClient initWithAlternateMachService]([STAskServiceClient alloc], "initWithAlternateMachService");
    askServiceClient = v2->_askServiceClient;
    v2->_askServiceClient = v3;

  }
  else
  {
    v5 = +[STAskClient _newConnection](STAskClient, "_newConnection");
    connection = v2->_connection;
    v2->_connection = v5;

    -[NSXPCConnection resume](v2->_connection, "resume");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  if ((_os_feature_enabled_impl() & 1) == 0)
    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)STAskClient;
  -[STAskClient dealloc](&v3, sel_dealloc);
}

+ (id)_newConnection
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.ScreenTimeAgent.ask"), 4096);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC907F8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);

  return v2;
}

- (BOOL)respondToAskForTimeRequestWithIdentifier:(id)a3 answer:(int64_t)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD v19[5];
  _QWORD v20[5];
  uint8_t v21[4];
  id v22;
  __int16 v23;
  uint64_t v24;
  _BYTE buf[24];
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  +[STLog askClient](STLog, "askClient");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a4 - 1) > 2)
      v10 = CFSTR("Not Approved");
    else
      v10 = off_1E9371F50[a4 - 1];
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_1D22E7000, v9, OS_LOG_TYPE_DEFAULT, "Responding to ask for time request: %{public}@ - response: %{public}@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v26 = __Block_byref_object_copy__19;
  v27 = __Block_byref_object_dispose__19;
  v28 = 0;
  if (_os_feature_enabled_impl())
  {
    -[STAskClient askServiceClient](self, "askServiceClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "respondToAskForTimeRequestWithIdentifier:answer:error:", v8, a4, a5);

  }
  else
  {
    -[STAskClient connection](self, "connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __69__STAskClient_respondToAskForTimeRequestWithIdentifier_answer_error___block_invoke;
    v20[3] = &unk_1E9370AF0;
    v20[4] = buf;
    objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __69__STAskClient_respondToAskForTimeRequestWithIdentifier_answer_error___block_invoke_2;
    v19[3] = &unk_1E9370AF0;
    v19[4] = buf;
    objc_msgSend(v15, "respondToAskForTimeRequestWithIdentifier:answer:completionHandler:", v8, a4, v19);

    +[STLog askClient](STLog, "askClient");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v21 = 138543618;
      v22 = v8;
      v23 = 2114;
      v24 = v17;
      _os_log_impl(&dword_1D22E7000, v16, OS_LOG_TYPE_DEFAULT, "Responded to ask for time request: %{public}@ - Error: %{public}@", v21, 0x16u);
    }

    if (a5)
      *a5 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
    v12 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40) == 0;
  }
  _Block_object_dispose(buf, 8);

  return v12;
}

void __69__STAskClient_respondToAskForTimeRequestWithIdentifier_answer_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __69__STAskClient_respondToAskForTimeRequestWithIdentifier_answer_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
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
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
