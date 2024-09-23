@implementation SKAStatusPublishingServiceClient

- (SKAStatusPublishingServiceClient)initWithXPCConnection:(id)a3 queue:(id)a4 delegate:(id)a5 databaseManager:(id)a6 invitationManager:(id)a7 publishingManager:(id)a8 channelManager:(id)a9
{
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  SKAStatusPublishingServiceClient *v19;
  SKAStatusPublishingServiceClientConnection *v20;
  SKAStatusPublishingServiceClientConnection *clientConnection;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v15 = a4;
  v16 = a5;
  v24 = a6;
  v23 = a7;
  v17 = a8;
  v18 = a9;
  dispatch_assert_queue_V2(v15);
  v26.receiver = self;
  v26.super_class = (Class)SKAStatusPublishingServiceClient;
  v19 = -[SKAStatusPublishingServiceClient init](&v26, sel_init);
  if (v19)
  {
    v20 = -[SKAStatusPublishingServiceClientConnection initWithXPCConnection:queue:daemonProtocolDelegate:connectionLifecycleDelegate:]([SKAStatusPublishingServiceClientConnection alloc], "initWithXPCConnection:queue:daemonProtocolDelegate:connectionLifecycleDelegate:", v25, v15, v19, v19);
    clientConnection = v19->_clientConnection;
    v19->_clientConnection = v20;

    objc_storeWeak((id *)&v19->_delegate, v16);
    objc_storeStrong((id *)&v19->_databaseManager, a6);
    objc_storeStrong((id *)&v19->_invitationManager, a7);
    objc_storeStrong((id *)&v19->_channelManager, a9);
    objc_storeStrong((id *)&v19->_publishingManager, a8);
    objc_storeStrong((id *)&v19->_queue, a4);
  }

  return v19;
}

+ (id)_missingEntitlmentErrorForStatusTypeIdentifier:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Client is not entitled to publish status of type \"%@\". Missing entitlement \"%@\"), a3, CFSTR("com.apple.StatusKit.publish.types"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BEB10D0];
  v9 = *MEMORY[0x24BDD0BA0];
  v10[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, -2000, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_serverDisabledErrorForStatusTypeIdentifier:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Status of type \"%@\" is disabled by the server"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BEB10D0];
  v9 = *MEMORY[0x24BDD0BA0];
  v10[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, -2100, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_noPersonalChannelErrorForStatusTypeIdentifier:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not find or create a channel to publish status of type \"%@\"."), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BEB10D0];
  v9 = *MEMORY[0x24BDD0BA0];
  v10[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, -3000, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_noUsersToShareWithError
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not determine any users to share with from request"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BEB10D0];
  v8 = *MEMORY[0x24BDD0BA0];
  v9[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, -4000, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_accountNotCapableError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEB10D0];
  v7 = *MEMORY[0x24BDD0BA0];
  v8[0] = CFSTR("System iCloud account does not exist or is not statuskit capable");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -7000, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_unableToResolveSenderHandleError
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not determine sender handle to use"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BEB10D0];
  v8 = *MEMORY[0x24BDD0BA0];
  v9[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, -8000, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_dateCreatedDriftError
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dateCreated of StatusPayload differs too much from server time"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BEB10D0];
  v8 = *MEMORY[0x24BDD0BA0];
  v9[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, -9003, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)publishingServiceClientConnectionWasInterrupted:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Publishing service client connection was interrupted: %@", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "publishingServiceClientWasInvalidated:", self);

}

- (void)publishingServiceClientConnectionWasInvalidated:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Publishing service client connection was invalidated: %@", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "publishingServiceClientWasInvalidated:", self);

}

+ (id)logger
{
  if (logger_onceToken_8 != -1)
    dispatch_once(&logger_onceToken_8, &__block_literal_global_8);
  return (id)logger__logger_8;
}

void __42__SKAStatusPublishingServiceClient_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKAStatusPublishingServiceClient");
  v1 = (void *)logger__logger_8;
  logger__logger_8 = (uint64_t)v0;

}

- (void)publishStatusRequest:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, uint64_t);
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  SKAStatusPublishingServiceClient *v20;
  id v21;
  void (**v22)(id, _QWORD, uint64_t);
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, uint64_t))a5;
  +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v8;
    _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Received request to publish status: %@", buf, 0xCu);
  }

  -[SKAStatusPublishingServiceClient clientConnection](self, "clientConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "clientIsEntitledForPublishingWithStatusTypeIdentifier:", v9);

  if ((v13 & 1) == 0)
  {
    +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:].cold.2();

    +[SKAStatusPublishingServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:](SKAStatusPublishingServiceClient, "_missingEntitlmentErrorForStatusTypeIdentifier:", v9);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:](SKAServerBag, "statusEnabledByServerForStatusTypeIdentifier:", v9))
  {
    +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:].cold.1();

    +[SKAStatusPublishingServiceClient _serverDisabledErrorForStatusTypeIdentifier:](SKAStatusPublishingServiceClient, "_serverDisabledErrorForStatusTypeIdentifier:", v9);
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v14 = (void *)v16;
    v10[2](v10, 0, v16);
    goto LABEL_13;
  }
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke;
  v18[3] = &unk_24D976798;
  v22 = v10;
  v19 = v8;
  v20 = self;
  v21 = v9;
  -[SKAStatusPublishingServiceClient accountIsStatusKitCapableWithCompletion:](self, "accountIsStatusKitCapableWithCompletion:", v18);

  v14 = v22;
LABEL_13:

}

void __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  double v24;
  double v25;
  void *v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "statusUniqueIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "UUIDString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setStatusUniqueIdentifier:", v5);

    }
    objc_msgSend(*(id *)(a1 + 40), "channelManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serverTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "dateCreated");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v27 = 138412546;
        v28 = v10;
        v29 = 2112;
        v30 = v7;
        _os_log_impl(&dword_2188DF000, v9, OS_LOG_TYPE_DEFAULT, "dateCreated not set on statusPublishRequest:%@. Setting to serverTime: %@", (uint8_t *)&v27, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "setDateCreated:", v7);
    }
    objc_msgSend(*(id *)(a1 + 32), "dateCreated");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v7);
    v13 = v12;

    if (v13 <= 300.0)
    {
      objc_msgSend(*(id *)(a1 + 40), "_delayForStatusPublishRequest:", *(_QWORD *)(a1 + 32));
      v25 = v24;
      objc_msgSend(*(id *)(a1 + 40), "publishingManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "removePendingPublishRequestsForStatusTypeIdentifier:olderThanRequest:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

      objc_msgSend(*(id *)(a1 + 40), "publishingManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "publishStatusRequest:statusTypeIdentifier:afterTime:isPendingPublish:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56), v25);
    }
    else
    {
      +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);

      +[SKAStatusPublishingServiceClient _dateCreatedDriftError](SKAStatusPublishingServiceClient, "_dateCreatedDriftError");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAStatusPublishingServiceClient _accountNotCapableError](SKAStatusPublishingServiceClient, "_accountNotCapableError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)provisionPayloads:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, uint64_t);
  void *v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  void (**v19)(id, _QWORD, uint64_t);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, uint64_t))a5;
  -[SKAStatusPublishingServiceClient clientConnection](self, "clientConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "clientIsEntitledForPublishingWithStatusTypeIdentifier:", v9);

  if ((v12 & 1) == 0)
  {
    +[SKAStatusPublishingServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:](SKAStatusPublishingServiceClient, "_missingEntitlmentErrorForStatusTypeIdentifier:", v9);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v15 = (void *)v13;
    v10[2](v10, 0, v13);

    goto LABEL_9;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:](SKAServerBag, "statusEnabledByServerForStatusTypeIdentifier:", v9))
  {
    +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:].cold.1();

    +[SKAStatusPublishingServiceClient _serverDisabledErrorForStatusTypeIdentifier:](SKAStatusPublishingServiceClient, "_serverDisabledErrorForStatusTypeIdentifier:", v9);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __86__SKAStatusPublishingServiceClient_provisionPayloads_statusTypeIdentifier_completion___block_invoke;
  v16[3] = &unk_24D976798;
  v19 = v10;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  -[SKAStatusPublishingServiceClient accountIsStatusKitCapableWithCompletion:](self, "accountIsStatusKitCapableWithCompletion:", v16);

LABEL_9:
}

void __86__SKAStatusPublishingServiceClient_provisionPayloads_statusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v3;
  void *v4;
  id v5;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "publishingManager");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "provisionPayloads:statusTypeIdentifier:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
  else
  {
    +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAStatusPublishingServiceClient _accountNotCapableError](SKAStatusPublishingServiceClient, "_accountNotCapableError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

- (void)invitedHandlesForStatusTypeIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  void *v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  void (**v15)(id, _QWORD, uint64_t);

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  -[SKAStatusPublishingServiceClient clientConnection](self, "clientConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "clientIsEntitledForPublishingWithStatusTypeIdentifier:", v6);

  if ((v9 & 1) == 0)
  {
    +[SKAStatusPublishingServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:](SKAStatusPublishingServiceClient, "_missingEntitlmentErrorForStatusTypeIdentifier:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v12 = (void *)v10;
    v7[2](v7, 0, v10);

    goto LABEL_9;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:](SKAServerBag, "statusEnabledByServerForStatusTypeIdentifier:", v6))
  {
    +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:].cold.1();

    +[SKAStatusPublishingServiceClient _serverDisabledErrorForStatusTypeIdentifier:](SKAStatusPublishingServiceClient, "_serverDisabledErrorForStatusTypeIdentifier:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __85__SKAStatusPublishingServiceClient_invitedHandlesForStatusTypeIdentifier_completion___block_invoke;
  v13[3] = &unk_24D9767C0;
  v15 = v7;
  v13[4] = self;
  v14 = v6;
  -[SKAStatusPublishingServiceClient accountIsStatusKitCapableWithCompletion:](self, "accountIsStatusKitCapableWithCompletion:", v13);

LABEL_9:
}

void __85__SKAStatusPublishingServiceClient_invitedHandlesForStatusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void (*v14)(void);
  NSObject *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[8];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "databaseManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "newBackgroundContext");

    objc_msgSend(*(id *)(a1 + 32), "databaseManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "existingPersonalChannelForStatusTypeIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(v6, "invitedUsers", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "invitedSKHandle");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
              objc_msgSend(v7, "addObject:", v13);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        }
        while (v10);
      }

      v14 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    else
    {
      +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2188DF000, v16, OS_LOG_TYPE_DEFAULT, "Personal channel does not exist for status type identifier", buf, 2u);
      }

      +[SKAStatusPublishingServiceClient _noPersonalChannelErrorForStatusTypeIdentifier:](SKAStatusPublishingServiceClient, "_noPersonalChannelErrorForStatusTypeIdentifier:", *(_QWORD *)(a1 + 40));
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v14 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    v14();

  }
  else
  {
    +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAStatusPublishingServiceClient _accountNotCapableError](SKAStatusPublishingServiceClient, "_accountNotCapableError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)isHandleInvited:(id)a3 fromSenderHandle:(id)a4 forStatusTypeIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, uint64_t);
  NSObject *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  void (**v24)(id, _QWORD, uint64_t);
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, uint64_t))a6;
  +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v26 = v10;
    v27 = 2112;
    v28 = v11;
    _os_log_impl(&dword_2188DF000, v14, OS_LOG_TYPE_DEFAULT, "Attempting to determine if handle %@ has already been invited from handle: %@", buf, 0x16u);
  }

  -[SKAStatusPublishingServiceClient clientConnection](self, "clientConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "clientIsEntitledForPublishingWithStatusTypeIdentifier:", v12);

  if ((v16 & 1) == 0)
  {
    +[SKAStatusPublishingServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:](SKAStatusPublishingServiceClient, "_missingEntitlmentErrorForStatusTypeIdentifier:", v12);
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v17 = (void *)v18;
    v13[2](v13, 0, v18);
    goto LABEL_11;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:](SKAServerBag, "statusEnabledByServerForStatusTypeIdentifier:", v12))
  {
    +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:].cold.1();

    +[SKAStatusPublishingServiceClient _serverDisabledErrorForStatusTypeIdentifier:](SKAStatusPublishingServiceClient, "_serverDisabledErrorForStatusTypeIdentifier:", v12);
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __104__SKAStatusPublishingServiceClient_isHandleInvited_fromSenderHandle_forStatusTypeIdentifier_completion___block_invoke;
  v20[3] = &unk_24D9767E8;
  v24 = v13;
  v20[4] = self;
  v21 = v12;
  v22 = v11;
  v23 = v10;
  -[SKAStatusPublishingServiceClient accountIsStatusKitCapableWithCompletion:](self, "accountIsStatusKitCapableWithCompletion:", v20);

  v17 = v24;
LABEL_11:

}

void __104__SKAStatusPublishingServiceClient_isHandleInvited_fromSenderHandle_forStatusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  NSObject *v21;
  void (*v22)(void);
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "databaseManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "newBackgroundContext");

    objc_msgSend(*(id *)(a1 + 32), "databaseManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "existingPersonalChannelForStatusTypeIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "invitationManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "resolveSenderHandleWithPreferredSenderHandle:", *(_QWORD *)(a1 + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          __104__SKAStatusPublishingServiceClient_isHandleInvited_fromSenderHandle_forStatusTypeIdentifier_completion___block_invoke_cold_1(a1 + 48, v23, v24, v25, v26, v27, v28, v29);

        +[SKAStatusPublishingServiceClient _unableToResolveSenderHandleError](SKAStatusPublishingServiceClient, "_unableToResolveSenderHandleError");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

        goto LABEL_33;
      }
      v31 = v6;
      v32 = v4;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      objc_msgSend(v6, "invitedUsers");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v34;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v34 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend(v14, "invitedSKHandle");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(*(id *)(a1 + 56), "isNormalizedEqualToHandle:", v15))
            {
              objc_msgSend(v14, "senderSKHandle");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v8, "isNormalizedEqualToHandle:", v16);
              +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
              if (v17)
              {
                if (v19)
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_2188DF000, v18, OS_LOG_TYPE_DEFAULT, "We found a match to an existing invited user", buf, 2u);
                }

                goto LABEL_31;
              }
              if (v19)
              {
                *(_DWORD *)buf = 138412546;
                v38 = v16;
                v39 = 2112;
                v40 = v8;
                _os_log_impl(&dword_2188DF000, v18, OS_LOG_TYPE_DEFAULT, "We found an existing invitated user matching the requested user, but that invitation was sent with handle %@ instead of handle %@. Ignoring.", buf, 0x16u);
              }

            }
          }
          v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          if (v11)
            continue;
          break;
        }
      }

      +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2188DF000, v9, OS_LOG_TYPE_DEFAULT, "We did not find a match to any existing invited user", buf, 2u);
      }
LABEL_31:
      v6 = v31;
      v4 = v32;

      v22 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    }
    else
    {
      +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2188DF000, v21, OS_LOG_TYPE_DEFAULT, "Personal channel does not exist for status type identifier", buf, 2u);
      }

      +[SKAStatusPublishingServiceClient _noPersonalChannelErrorForStatusTypeIdentifier:](SKAStatusPublishingServiceClient, "_noPersonalChannelErrorForStatusTypeIdentifier:", *(_QWORD *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    }
    v22();
LABEL_33:

    goto LABEL_34;
  }
  +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

  +[SKAStatusPublishingServiceClient _accountNotCapableError](SKAStatusPublishingServiceClient, "_accountNotCapableError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_34:

}

- (void)isHandleInviteable:(id)a3 fromHandle:(id)a4 forStatusTypeIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, uint64_t);
  void *v14;
  char v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  void (**v22)(id, _QWORD, uint64_t);

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, uint64_t))a6;
  -[SKAStatusPublishingServiceClient clientConnection](self, "clientConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "clientIsEntitledForPublishingWithStatusTypeIdentifier:", v12);

  if ((v15 & 1) == 0)
  {
    +[SKAStatusPublishingServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:](SKAStatusPublishingServiceClient, "_missingEntitlmentErrorForStatusTypeIdentifier:", v12);
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v18 = (void *)v16;
    v13[2](v13, 0, v16);

    goto LABEL_9;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:](SKAServerBag, "statusEnabledByServerForStatusTypeIdentifier:", v12))
  {
    +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:].cold.1();

    +[SKAStatusPublishingServiceClient _serverDisabledErrorForStatusTypeIdentifier:](SKAStatusPublishingServiceClient, "_serverDisabledErrorForStatusTypeIdentifier:", v12);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __101__SKAStatusPublishingServiceClient_isHandleInviteable_fromHandle_forStatusTypeIdentifier_completion___block_invoke;
  v19[3] = &unk_24D976798;
  v22 = v13;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  -[SKAStatusPublishingServiceClient accountIsStatusKitCapableWithCompletion:](self, "accountIsStatusKitCapableWithCompletion:", v19);

LABEL_9:
}

void __101__SKAStatusPublishingServiceClient_isHandleInviteable_fromHandle_forStatusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "invitationManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __101__SKAStatusPublishingServiceClient_isHandleInviteable_fromHandle_forStatusTypeIdentifier_completion___block_invoke_26;
    v8[3] = &unk_24D976710;
    v9 = *(id *)(a1 + 56);
    objc_msgSend(v3, "isHandleInviteable:fromHandle:completion:", v4, v5, v8);

    v6 = v9;
  }
  else
  {
    +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAStatusPublishingServiceClient _accountNotCapableError](SKAStatusPublishingServiceClient, "_accountNotCapableError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __101__SKAStatusPublishingServiceClient_isHandleInviteable_fromHandle_forStatusTypeIdentifier_completion___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchHandleInvitability:(id)a3 fromHandle:(id)a4 forStatusTypeIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, uint64_t);
  void *v14;
  char v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  void (**v23)(id, _QWORD, uint64_t);

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, uint64_t))a6;
  -[SKAStatusPublishingServiceClient clientConnection](self, "clientConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "clientIsEntitledForPublishingWithStatusTypeIdentifier:", v12);

  if ((v15 & 1) == 0)
  {
    +[SKAStatusPublishingServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:](SKAStatusPublishingServiceClient, "_missingEntitlmentErrorForStatusTypeIdentifier:", v12);
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v18 = (void *)v16;
    v13[2](v13, 0, v16);

    goto LABEL_9;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:](SKAServerBag, "statusEnabledByServerForStatusTypeIdentifier:", v12))
  {
    +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:].cold.1();

    +[SKAStatusPublishingServiceClient _serverDisabledErrorForStatusTypeIdentifier:](SKAStatusPublishingServiceClient, "_serverDisabledErrorForStatusTypeIdentifier:", v12);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __106__SKAStatusPublishingServiceClient_fetchHandleInvitability_fromHandle_forStatusTypeIdentifier_completion___block_invoke;
  v19[3] = &unk_24D9767E8;
  v23 = v13;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  -[SKAStatusPublishingServiceClient accountIsStatusKitCapableWithCompletion:](self, "accountIsStatusKitCapableWithCompletion:", v19);

LABEL_9:
}

void __106__SKAStatusPublishingServiceClient_fetchHandleInvitability_fromHandle_forStatusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "invitationManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __106__SKAStatusPublishingServiceClient_fetchHandleInvitability_fromHandle_forStatusTypeIdentifier_completion___block_invoke_28;
    v9[3] = &unk_24D976810;
    v6 = *(_QWORD *)(a1 + 56);
    v10 = *(id *)(a1 + 64);
    objc_msgSend(v3, "fetchHandleInvitability:fromHandle:forStatusTypeIdentifier:completion:", v4, v5, v6, v9);

    v7 = v10;
  }
  else
  {
    +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAStatusPublishingServiceClient _accountNotCapableError](SKAStatusPublishingServiceClient, "_accountNotCapableError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

uint64_t __106__SKAStatusPublishingServiceClient_fetchHandleInvitability_fromHandle_forStatusTypeIdentifier_completion___block_invoke_28(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)inviteHandles:(id)a3 fromSenderHandle:(id)a4 withInvitationPayload:(id)a5 statusTypeIdentifier:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, uint64_t);
  NSObject *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  void (**v28)(id, uint64_t);
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, uint64_t))a7;
  +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v30 = v15;
    v31 = 2112;
    v32 = v12;
    _os_log_impl(&dword_2188DF000, v17, OS_LOG_TYPE_DEFAULT, "Received request to send invitation for personal channel with statusTypeIdentifier %@ to handles: %@", buf, 0x16u);
  }

  -[SKAStatusPublishingServiceClient clientConnection](self, "clientConnection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "clientIsEntitledForPublishingWithStatusTypeIdentifier:", v15);

  if ((v19 & 1) == 0)
  {
    +[SKAStatusPublishingServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:](SKAStatusPublishingServiceClient, "_missingEntitlmentErrorForStatusTypeIdentifier:", v15);
    v21 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v20 = (void *)v21;
    v16[2](v16, v21);
    goto LABEL_11;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:](SKAServerBag, "statusEnabledByServerForStatusTypeIdentifier:", v15))
  {
    +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:].cold.1();

    +[SKAStatusPublishingServiceClient _serverDisabledErrorForStatusTypeIdentifier:](SKAStatusPublishingServiceClient, "_serverDisabledErrorForStatusTypeIdentifier:", v15);
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __121__SKAStatusPublishingServiceClient_inviteHandles_fromSenderHandle_withInvitationPayload_statusTypeIdentifier_completion___block_invoke;
  v23[3] = &unk_24D976860;
  v28 = v16;
  v23[4] = self;
  v24 = v15;
  v25 = v12;
  v26 = v13;
  v27 = v14;
  -[SKAStatusPublishingServiceClient accountIsStatusKitCapableWithCompletion:](self, "accountIsStatusKitCapableWithCompletion:", v23);

  v20 = v28;
LABEL_11:

}

void __121__SKAStatusPublishingServiceClient_inviteHandles_fromSenderHandle_withInvitationPayload_statusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "invitationManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 64);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __121__SKAStatusPublishingServiceClient_inviteHandles_fromSenderHandle_withInvitationPayload_statusTypeIdentifier_completion___block_invoke_30;
    v10[3] = &unk_24D976838;
    v12 = *(id *)(a1 + 72);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v3, "sendInvitationForPersonalChannelWithStatusTypeIdentifier:toHandles:fromSenderHandle:withInvitationPayload:completion:", v4, v5, v6, v7, v10);

    v8 = v12;
  }
  else
  {
    +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAStatusPublishingServiceClient _accountNotCapableError](SKAStatusPublishingServiceClient, "_accountNotCapableError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

void __121__SKAStatusPublishingServiceClient_inviteHandles_fromSenderHandle_withInvitationPayload_statusTypeIdentifier_completion___block_invoke_30(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void (*v9)(void);
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __121__SKAStatusPublishingServiceClient_inviteHandles_fromSenderHandle_withInvitationPayload_statusTypeIdentifier_completion___block_invoke_30_cold_1();

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Successfully sent invitation to handles: %@", (uint8_t *)&v10, 0xCu);
    }

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v9();

}

- (void)removeInvitedHandles:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  void (**v20)(id, uint64_t);
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v9;
    v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Received request to remove invitation from personal channel with statusTypeIdentifier %@ for handles: %@", buf, 0x16u);
  }

  -[SKAStatusPublishingServiceClient clientConnection](self, "clientConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "clientIsEntitledForPublishingWithStatusTypeIdentifier:", v9);

  if ((v13 & 1) == 0)
  {
    +[SKAStatusPublishingServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:](SKAStatusPublishingServiceClient, "_missingEntitlmentErrorForStatusTypeIdentifier:", v9);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v14 = (void *)v15;
    v10[2](v10, v15);
    goto LABEL_11;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:](SKAServerBag, "statusEnabledByServerForStatusTypeIdentifier:", v9))
  {
    +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:].cold.1();

    +[SKAStatusPublishingServiceClient _serverDisabledErrorForStatusTypeIdentifier:](SKAStatusPublishingServiceClient, "_serverDisabledErrorForStatusTypeIdentifier:", v9);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __89__SKAStatusPublishingServiceClient_removeInvitedHandles_statusTypeIdentifier_completion___block_invoke;
  v17[3] = &unk_24D976798;
  v20 = v10;
  v17[4] = self;
  v18 = v9;
  v19 = v8;
  -[SKAStatusPublishingServiceClient accountIsStatusKitCapableWithCompletion:](self, "accountIsStatusKitCapableWithCompletion:", v17);

  v14 = v20;
LABEL_11:

}

void __89__SKAStatusPublishingServiceClient_removeInvitedHandles_statusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "invitationManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(a1 + 48);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __89__SKAStatusPublishingServiceClient_removeInvitedHandles_statusTypeIdentifier_completion___block_invoke_31;
    v8[3] = &unk_24D976888;
    v9 = v4;
    v10 = *(id *)(a1 + 56);
    objc_msgSend(v3, "revokeInvitationFromPersonalChannelWithStatusTypeIdentifier:forHandles:completion:", v5, v9, v8);

    v6 = v9;
  }
  else
  {
    +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAStatusPublishingServiceClient _accountNotCapableError](SKAStatusPublishingServiceClient, "_accountNotCapableError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __89__SKAStatusPublishingServiceClient_removeInvitedHandles_statusTypeIdentifier_completion___block_invoke_31(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_removeInvitedHandles_statusTypeIdentifier_completion___block_invoke_31_cold_1(a1, (uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Invitation revocation for handles %@ completed succesffully", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)removeAllInvitedHandlesFromPersonalChannelWithStatusTypeIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  void (**v16)(id, uint64_t);
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, "Received request to remove all invitations from personal channel with statusTypeIdentifier %@", buf, 0xCu);
  }

  -[SKAStatusPublishingServiceClient clientConnection](self, "clientConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "clientIsEntitledForPublishingWithStatusTypeIdentifier:", v6);

  if ((v10 & 1) == 0)
  {
    +[SKAStatusPublishingServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:](SKAStatusPublishingServiceClient, "_missingEntitlmentErrorForStatusTypeIdentifier:", v6);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v11 = (void *)v12;
    v7[2](v7, v12);
    goto LABEL_11;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:](SKAServerBag, "statusEnabledByServerForStatusTypeIdentifier:", v6))
  {
    +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:].cold.1();

    +[SKAStatusPublishingServiceClient _serverDisabledErrorForStatusTypeIdentifier:](SKAStatusPublishingServiceClient, "_serverDisabledErrorForStatusTypeIdentifier:", v6);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __114__SKAStatusPublishingServiceClient_removeAllInvitedHandlesFromPersonalChannelWithStatusTypeIdentifier_completion___block_invoke;
  v14[3] = &unk_24D9767C0;
  v16 = v7;
  v14[4] = self;
  v15 = v6;
  -[SKAStatusPublishingServiceClient accountIsStatusKitCapableWithCompletion:](self, "accountIsStatusKitCapableWithCompletion:", v14);

  v11 = v16;
LABEL_11:

}

void __114__SKAStatusPublishingServiceClient_removeAllInvitedHandlesFromPersonalChannelWithStatusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "invitationManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __114__SKAStatusPublishingServiceClient_removeAllInvitedHandlesFromPersonalChannelWithStatusTypeIdentifier_completion___block_invoke_33;
    v7[3] = &unk_24D976460;
    v4 = *(_QWORD *)(a1 + 40);
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v3, "revokeAllInvitationsFromPersonalChannelWithStatusTypeIdentifier:completion:", v4, v7);

    v5 = v8;
  }
  else
  {
    +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAStatusPublishingServiceClient _accountNotCapableError](SKAStatusPublishingServiceClient, "_accountNotCapableError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __114__SKAStatusPublishingServiceClient_removeAllInvitedHandlesFromPersonalChannelWithStatusTypeIdentifier_completion___block_invoke_33(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __114__SKAStatusPublishingServiceClient_removeAllInvitedHandlesFromPersonalChannelWithStatusTypeIdentifier_completion___block_invoke_33_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Invitation revocation for all handles completed succesffully", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registerForDelegateCallbacksWithStatusTypeIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  void (**v15)(id, uint64_t);

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  -[SKAStatusPublishingServiceClient clientConnection](self, "clientConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "clientIsEntitledForPublishingWithStatusTypeIdentifier:", v6);

  if ((v9 & 1) == 0)
  {
    +[SKAStatusPublishingServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:](SKAStatusPublishingServiceClient, "_missingEntitlmentErrorForStatusTypeIdentifier:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v12 = (void *)v10;
    v7[2](v7, v10);

    goto LABEL_9;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:](SKAServerBag, "statusEnabledByServerForStatusTypeIdentifier:", v6))
  {
    +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:].cold.1();

    +[SKAStatusPublishingServiceClient _serverDisabledErrorForStatusTypeIdentifier:](SKAStatusPublishingServiceClient, "_serverDisabledErrorForStatusTypeIdentifier:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __100__SKAStatusPublishingServiceClient_registerForDelegateCallbacksWithStatusTypeIdentifier_completion___block_invoke;
  v13[3] = &unk_24D9767C0;
  v15 = v7;
  v13[4] = self;
  v14 = v6;
  -[SKAStatusPublishingServiceClient accountIsStatusKitCapableWithCompletion:](self, "accountIsStatusKitCapableWithCompletion:", v13);

LABEL_9:
}

void __100__SKAStatusPublishingServiceClient_registerForDelegateCallbacksWithStatusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    v3 = *(id *)(a1 + 32);
    objc_sync_enter(v3);
    v4 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 8);
    *(_QWORD *)(v5 + 8) = v4;

    objc_sync_exit(v3);
    +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v12 = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Client %@ has registered for delegate callbacks for statusTypeIdentifier: %@.", (uint8_t *)&v12, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAStatusPublishingServiceClient _accountNotCapableError](SKAStatusPublishingServiceClient, "_accountNotCapableError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ PID=%ld>"), v5, -[SKAStatusPublishingServiceClientConnection processIdentifier](self->_clientConnection, "processIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)accountIsStatusKitCapableWithCompletion:(id)a3
{
  id v4;
  SKAStatusPublishingServiceClient *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[SKAStatusPublishingServiceClient databaseManager](v5, "databaseManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __76__SKAStatusPublishingServiceClient_accountIsStatusKitCapableWithCompletion___block_invoke;
  v8[3] = &unk_24D9762E8;
  v8[4] = v5;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "deviceToDeviceEncryptedDatabaseCapableWithCompletion:", v8);

  objc_sync_exit(v5);
}

void __76__SKAStatusPublishingServiceClient_accountIsStatusKitCapableWithCompletion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __76__SKAStatusPublishingServiceClient_accountIsStatusKitCapableWithCompletion___block_invoke_2;
  v5[3] = &unk_24D9768B0;
  v6 = *(id *)(a1 + 40);
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __76__SKAStatusPublishingServiceClient_accountIsStatusKitCapableWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (id)_serverBagNumberForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE4FE58], "sharedInstanceForBagType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SKAStatusPublishingServiceClient _serverBagNumberForKey:].cold.1();

    goto LABEL_7;
  }
  v6 = v5;
LABEL_8:

  return v6;
}

- (double)_serverBagTimeIntervalForKey:(id)a3 withDefaultValue:(double)a4
{
  void *v5;
  void *v6;
  double v7;

  -[SKAStatusPublishingServiceClient _serverBagNumberForKey:](self, "_serverBagNumberForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    a4 = v7;
  }

  return a4;
}

- (double)_scheduledPublishMaxDelayTime
{
  double result;

  -[SKAStatusPublishingServiceClient _serverBagTimeIntervalForKey:withDefaultValue:](self, "_serverBagTimeIntervalForKey:withDefaultValue:", CFSTR("shared-channels-scheduled-publish-variance-max-slop-period-seconds"), 20.0);
  return result;
}

- (double)_unscheduledPublishMaxDelayTime
{
  double result;

  -[SKAStatusPublishingServiceClient _serverBagTimeIntervalForKey:withDefaultValue:](self, "_serverBagTimeIntervalForKey:withDefaultValue:", CFSTR("shared-channels-unscheduled-publish-variance-max-slop-period-seconds"), 0.0);
  return result;
}

- (double)_randomScheduledPublishDelay
{
  double v2;

  -[SKAStatusPublishingServiceClient _scheduledPublishMaxDelayTime](self, "_scheduledPublishMaxDelayTime");
  return (double)arc4random_uniform(v2);
}

- (double)_randomUnscheduledPublishDelay
{
  double v2;

  -[SKAStatusPublishingServiceClient _unscheduledPublishMaxDelayTime](self, "_unscheduledPublishMaxDelayTime");
  return (double)arc4random_uniform(v2);
}

- (double)_secondaryDeviceRepublishMaxDelayTime
{
  double result;

  -[SKAStatusPublishingServiceClient _serverBagTimeIntervalForKey:withDefaultValue:](self, "_serverBagTimeIntervalForKey:withDefaultValue:", CFSTR("shared-channels-secondary-device-republish-variance-min-slop-period-seconds"), 30.0);
  return result;
}

- (double)_secondaryDeviceRepublishMinDelayTime
{
  double result;

  -[SKAStatusPublishingServiceClient _serverBagTimeIntervalForKey:withDefaultValue:](self, "_serverBagTimeIntervalForKey:withDefaultValue:", CFSTR("shared-channels-secondary-device-republish-variance-min-slop-period-seconds"), 20.0);
  return result;
}

- (double)_randomSecondaryDeviceRepublishDelay
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  int v10;
  double v11;
  __int16 v12;
  double v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[SKAStatusPublishingServiceClient _secondaryDeviceRepublishMaxDelayTime](self, "_secondaryDeviceRepublishMaxDelayTime");
  v4 = v3;
  -[SKAStatusPublishingServiceClient _secondaryDeviceRepublishMinDelayTime](self, "_secondaryDeviceRepublishMinDelayTime");
  v6 = v5;
  v7 = v5 + (double)arc4random_uniform((v4 - v5));
  +[SKAStatusPublishingServiceClient logger](SKAStatusPublishingServiceClient, "logger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218496;
    v11 = v7;
    v12 = 2048;
    v13 = v6;
    v14 = 2048;
    v15 = v4;
    _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, "Resolved secondary device republish delay of %.1f seconds, within allowed range of (%.1f,%.1f) seconds.", (uint8_t *)&v10, 0x20u);
  }

  return v7;
}

- (double)_delayForStatusPublishRequest:(id)a3
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  if (objc_msgSend(v4, "isSecondaryDeviceRepublish"))
  {
    -[SKAStatusPublishingServiceClient _randomSecondaryDeviceRepublishDelay](self, "_randomSecondaryDeviceRepublishDelay");
  }
  else if (objc_msgSend(v4, "isScheduledRequest"))
  {
    -[SKAStatusPublishingServiceClient _randomScheduledPublishDelay](self, "_randomScheduledPublishDelay");
  }
  else
  {
    -[SKAStatusPublishingServiceClient _randomUnscheduledPublishDelay](self, "_randomUnscheduledPublishDelay");
  }
  v6 = v5;

  return v6;
}

- (NSString)statusTypeIdenfifier
{
  return self->_statusTypeIdenfifier;
}

- (SKAStatusPublishingServiceClientConnection)clientConnection
{
  return self->_clientConnection;
}

- (void)setClientConnection:(id)a3
{
  objc_storeStrong((id *)&self->_clientConnection, a3);
}

- (SKAStatusPublishingServiceClientDelegate)delegate
{
  return (SKAStatusPublishingServiceClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SKADatabaseManaging)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
  objc_storeStrong((id *)&self->_databaseManager, a3);
}

- (SKADatabaseProviding)databaseProvider
{
  return self->_databaseProvider;
}

- (void)setDatabaseProvider:(id)a3
{
  objc_storeStrong((id *)&self->_databaseProvider, a3);
}

- (SKAMessagingProviding)messagingProvider
{
  return self->_messagingProvider;
}

- (void)setMessagingProvider:(id)a3
{
  objc_storeStrong((id *)&self->_messagingProvider, a3);
}

- (SKAInvitationManager)invitationManager
{
  return self->_invitationManager;
}

- (void)setInvitationManager:(id)a3
{
  objc_storeStrong((id *)&self->_invitationManager, a3);
}

- (SKAChannelManaging)channelManager
{
  return self->_channelManager;
}

- (void)setChannelManager:(id)a3
{
  objc_storeStrong((id *)&self->_channelManager, a3);
}

- (SKAStatusPublishingManaging)publishingManager
{
  return self->_publishingManager;
}

- (void)setPublishingManager:(id)a3
{
  objc_storeStrong((id *)&self->_publishingManager, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_publishingManager, 0);
  objc_storeStrong((id *)&self->_channelManager, 0);
  objc_storeStrong((id *)&self->_invitationManager, 0);
  objc_storeStrong((id *)&self->_messagingProvider, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_statusTypeIdenfifier, 0);
}

- (void)publishStatusRequest:statusTypeIdentifier:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Status type %@ disabled by server.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)publishStatusRequest:statusTypeIdentifier:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Rejecting publish request, client is not entitled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2188DF000, a1, a3, "dateCreated time differs too much from server time.  delta = %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Account is not StatusKit capable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __104__SKAStatusPublishingServiceClient_isHandleInvited_fromSenderHandle_forStatusTypeIdentifier_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2188DF000, a2, a3, "Error resolving sender handle for isInvited check. UnresolvedSenderHandle: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __121__SKAStatusPublishingServiceClient_inviteHandles_fromSenderHandle_withInvitationPayload_statusTypeIdentifier_completion___block_invoke_30_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Failed to send invitation to handles with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __89__SKAStatusPublishingServiceClient_removeInvitedHandles_statusTypeIdentifier_completion___block_invoke_31_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_6(&dword_2188DF000, a2, a3, "Invitation revocation for handles %@ failed with error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_3();
}

void __114__SKAStatusPublishingServiceClient_removeAllInvitedHandlesFromPersonalChannelWithStatusTypeIdentifier_completion___block_invoke_33_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Invitation revocation for all handles failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_serverBagNumberForKey:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v0, v1, "Server bag unexpected value type for key \"%@\". Value: %@");
  OUTLINED_FUNCTION_3();
}

@end
