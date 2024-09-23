@implementation SKAPresenceClient

- (SKAPresenceClient)initWithXPCConnection:(id)a3 queue:(id)a4 delegate:(id)a5 subscriptionManager:(id)a6 presenceManager:(id)a7 invitationManager:(id)a8 databaseManager:(id)a9
{
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  SKAPresenceClient *v19;
  SKAPresenceClientConnection *v20;
  SKAPresenceClientConnection *clientConnection;
  OS_os_transaction *transaction;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v15 = a4;
  v16 = a5;
  v25 = a6;
  v24 = a7;
  v17 = a8;
  v18 = a9;
  dispatch_assert_queue_V2(v15);
  v27.receiver = self;
  v27.super_class = (Class)SKAPresenceClient;
  v19 = -[SKAPresenceClient init](&v27, sel_init);
  if (v19)
  {
    v20 = -[SKAPresenceClientConnection initWithXPCConnection:queue:daemonProtocolDelegate:connectionLifecycleDelegate:]([SKAPresenceClientConnection alloc], "initWithXPCConnection:queue:daemonProtocolDelegate:connectionLifecycleDelegate:", v26, v15, v19, v19);
    clientConnection = v19->_clientConnection;
    v19->_clientConnection = v20;

    objc_storeWeak((id *)&v19->_delegate, v16);
    objc_storeStrong((id *)&v19->_databaseManager, a9);
    objc_storeStrong((id *)&v19->_subscriptionManager, a6);
    objc_storeStrong((id *)&v19->_invitationManager, a8);
    objc_storeStrong((id *)&v19->_presenceManager, a7);
    *(_WORD *)&v19->_activeSubscription = 0;
    objc_storeStrong((id *)&v19->_queue, a4);
    transaction = v19->_transaction;
    v19->_transaction = 0;

    v19->_lastSelfInviteSentTimestamp = 0.0;
  }

  return v19;
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
  v3 = *MEMORY[0x24BEB10C8];
  v7 = *MEMORY[0x24BDD0BA0];
  v8[0] = CFSTR("System iCloud account does not exist or is not presence capable");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -7000, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_noChannelError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEB10C8];
  v7 = *MEMORY[0x24BDD0BA0];
  v8[0] = CFSTR("No channel exists for presence identifier");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -7002, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_noChannelCreatedError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEB10C8];
  v7 = *MEMORY[0x24BDD0BA0];
  v8[0] = CFSTR("No channel exists or could be created for presence identifier");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -7002, v4);
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
  v4 = *MEMORY[0x24BEB10C8];
  v8 = *MEMORY[0x24BDD0BA0];
  v9[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, -7003, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_noClientIDError
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing client ID entitlement"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BEB10C8];
  v8 = *MEMORY[0x24BDD0BA0];
  v9[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, -7003, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_crossAccountError
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("This action isn't available when isPersonal is True"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BEB10C8];
  v8 = *MEMORY[0x24BDD0BA0];
  v9[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, -7011, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)presenceClientConnectionWasInterrupted:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  SKAPresenceManaging *presenceManager;
  void *v8;
  id WeakRetained;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Presence client connection was interrupted: %@", (uint8_t *)&v10, 0xCu);
  }

  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Beginning release of transient subscription assertions associated with interrupted client", (uint8_t *)&v10, 2u);
  }

  -[SKAStatusSubscriptionManaging releaseAllPresenceSubscriptionAssertionsAssociatedWithClient:completion:](self->_subscriptionManager, "releaseAllPresenceSubscriptionAssertionsAssociatedWithClient:completion:", self, &__block_literal_global_26);
  presenceManager = self->_presenceManager;
  -[SKAPresenceClient options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPresenceManaging releaseAllPresenceAssertionsAssociatedWithClient:options:completion:](presenceManager, "releaseAllPresenceAssertionsAssociatedWithClient:options:completion:", self, v8, &__block_literal_global_19);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presenceClientWasInvalidated:", self);

}

void __60__SKAPresenceClient_presenceClientConnectionWasInterrupted___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __60__SKAPresenceClient_presenceClientConnectionWasInterrupted___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Success releasing transient subscription assertions associated with interrupted client", v5, 2u);
  }

}

void __60__SKAPresenceClient_presenceClientConnectionWasInterrupted___block_invoke_18(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __60__SKAPresenceClient_presenceClientConnectionWasInterrupted___block_invoke_18_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Success releasing presence assertions associated with interrupted client", v5, 2u);
  }

}

- (void)presenceClientConnectionWasInvalidated:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  SKAPresenceManaging *presenceManager;
  void *v9;
  id WeakRetained;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Presence client connection was invalidated: %@", (uint8_t *)&v11, 0xCu);
  }

  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Beginning release of presence subscription assertions associated with interrupted client", (uint8_t *)&v11, 2u);
  }

  -[SKAStatusSubscriptionManaging releaseAllPresenceSubscriptionAssertionsAssociatedWithClient:completion:](self->_subscriptionManager, "releaseAllPresenceSubscriptionAssertionsAssociatedWithClient:completion:", self, &__block_literal_global_20);
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Beginning release of presence assertions associated with interrupted client", (uint8_t *)&v11, 2u);
  }

  presenceManager = self->_presenceManager;
  -[SKAPresenceClient options](self, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPresenceManaging releaseAllPresenceAssertionsAssociatedWithClient:options:completion:](presenceManager, "releaseAllPresenceAssertionsAssociatedWithClient:options:completion:", self, v9, &__block_literal_global_22_0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presenceClientWasInvalidated:", self);

}

void __60__SKAPresenceClient_presenceClientConnectionWasInvalidated___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __60__SKAPresenceClient_presenceClientConnectionWasInvalidated___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Success releasing presence subscription assertions associated with invalidated client", v5, 2u);
  }

}

void __60__SKAPresenceClient_presenceClientConnectionWasInvalidated___block_invoke_21(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __60__SKAPresenceClient_presenceClientConnectionWasInvalidated___block_invoke_21_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Success releasing presence assertions associated with invalidated client", v5, 2u);
  }

}

+ (id)logger
{
  if (logger_onceToken_26 != -1)
    dispatch_once(&logger_onceToken_26, &__block_literal_global_24);
  return (id)logger__logger_26;
}

void __27__SKAPresenceClient_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKAPresenceClient");
  v1 = (void *)logger__logger_26;
  logger__logger_26 = (uint64_t)v0;

}

+ (id)oversizeLogger
{
  if (oversizeLogger_onceToken_0[0] != -1)
    dispatch_once(oversizeLogger_onceToken_0, &__block_literal_global_27);
  return (id)oversizeLogger__logger_0;
}

void __35__SKAPresenceClient_oversizeLogger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "StatusKit-oversized");
  v1 = (void *)oversizeLogger__logger_0;
  oversizeLogger__logger_0 = (uint64_t)v0;

}

- (void)hasInitialCloudKitImportOccurredWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[SKAPresenceClient databaseManager](self, "databaseManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__SKAPresenceClient_hasInitialCloudKitImportOccurredWithCompletion___block_invoke;
  v7[3] = &unk_24D976270;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "hasInitialCloudKitImportOccurred:", v7);

}

uint64_t __68__SKAPresenceClient_hasInitialCloudKitImportOccurredWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)assertPresenceForIdentifier:(id)a3 withPresencePayload:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  SKAPresenceClient *v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SKAPresenceClient clientPrefixedPresenceIdentifierForPresenceIdentifier:](self, "clientPrefixedPresenceIdentifierForPresenceIdentifier:", v8);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v9)
  {
    if (v11)
    {
LABEL_3:
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __80__SKAPresenceClient_assertPresenceForIdentifier_withPresencePayload_completion___block_invoke;
      v16[3] = &unk_24D9767E8;
      v21 = v10;
      v17 = v12;
      v18 = self;
      v19 = v9;
      v20 = v8;
      -[SKAPresenceClient accountIsPresenceCapableWithCompletion:](self, "accountIsPresenceCapableWithCompletion:", v16);

      v13 = v21;
      goto LABEL_10;
    }
  }
  else
  {
    +[SKAPresenceClient logger](SKAPresenceClient, "logger");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v14, OS_LOG_TYPE_DEFAULT, "Client did not specify a payload", buf, 2u);
    }

    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB1070]), "initWithData:", 0);
    if (v12)
      goto LABEL_3;
  }
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[SKAPresenceClient assertPresenceForIdentifier:withPresencePayload:completion:].cold.1();

  +[SKAPresenceClient _noClientIDError](SKAPresenceClient, "_noClientIDError");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v10 + 2))(v10, v13);
LABEL_10:

}

void __80__SKAPresenceClient_assertPresenceForIdentifier_withPresencePayload_completion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v23 = v6;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Retaining presence assertion for presenceIdentifier: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "setActiveAssertion:", 1);
    objc_msgSend(*(id *)(a1 + 40), "setCurrentPayload:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "presenceManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "options");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __80__SKAPresenceClient_assertPresenceForIdentifier_withPresencePayload_completion___block_invoke_31;
    v16[3] = &unk_24D977EF0;
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(id *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(void **)(a1 + 48);
    v17 = v12;
    v18 = v13;
    v19 = v14;
    v20 = *(id *)(a1 + 56);
    v21 = *(id *)(a1 + 64);
    objc_msgSend(v7, "retainPresenceAssertionForPresenceIdentifier:withPresencePayload:options:client:completion:", v9, v8, v10, v11, v16);

    v15 = v17;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAPresenceClient _accountNotCapableError](SKAPresenceClient, "_accountNotCapableError");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __80__SKAPresenceClient_assertPresenceForIdentifier_withPresencePayload_completion___block_invoke_31(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[5];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __80__SKAPresenceClient_assertPresenceForIdentifier_withPresencePayload_completion___block_invoke_31_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "setActiveAssertion:", 0);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v24 = v6;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Successfully retained presence assertion for presenceIdentifier: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "setCurrentPayload:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "options");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isPersonal");

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSince1970");
      v11 = v10;
      objc_msgSend(*(id *)(a1 + 40), "lastSelfInviteSentTimestamp");
      v13 = v11 - v12;

      +[SKAPresenceClient logger](SKAPresenceClient, "logger");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v13 <= 21600.0)
      {
        if (v15)
        {
          objc_msgSend(*(id *)(a1 + 40), "presenceIdenfifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "lastSelfInviteSentTimestamp");
          *(_DWORD *)buf = 138412546;
          v24 = v20;
          v25 = 2048;
          v26 = v21;
          _os_log_impl(&dword_2188DF000, v14, OS_LOG_TYPE_DEFAULT, "Not sending self invitation for personal channel with presenceIdentifier: %@ as last self invite was sent at %f", buf, 0x16u);

        }
      }
      else
      {
        if (v15)
        {
          objc_msgSend(*(id *)(a1 + 40), "presenceIdenfifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v24 = v16;
          _os_log_impl(&dword_2188DF000, v14, OS_LOG_TYPE_DEFAULT, "Sending self invitation for personal channel with presenceIdentifier: %@", buf, 0xCu);

        }
        objc_msgSend(*(id *)(a1 + 40), "invitationManager");
        v14 = objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 56);
        objc_msgSend(*(id *)(a1 + 40), "options");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isPersonal");
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __80__SKAPresenceClient_assertPresenceForIdentifier_withPresencePayload_completion___block_invoke_33;
        v22[3] = &unk_24D976658;
        v22[4] = *(_QWORD *)(a1 + 40);
        -[NSObject sendSelfInvitationForPresenceChannelWithPresenceIdentifier:isPersonal:completion:](v14, "sendSelfInvitationForPresenceChannelWithPresenceIdentifier:isPersonal:completion:", v17, v19, v22);

      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void __80__SKAPresenceClient_assertPresenceForIdentifier_withPresencePayload_completion___block_invoke_33(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Sent self invites for personal channel %@, with error %@", (uint8_t *)&v9, 0x16u);
  }

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSince1970");
    objc_msgSend(*(id *)(a1 + 32), "setLastSelfInviteSentTimestamp:");

  }
}

- (void)releasePresenceForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a4;
  -[SKAPresenceClient clientPrefixedPresenceIdentifierForPresenceIdentifier:](self, "clientPrefixedPresenceIdentifierForPresenceIdentifier:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __61__SKAPresenceClient_releasePresenceForIdentifier_completion___block_invoke;
    v10[3] = &unk_24D9767C0;
    v12 = v6;
    v10[4] = self;
    v11 = v7;
    -[SKAPresenceClient accountIsPresenceCapableWithCompletion:](self, "accountIsPresenceCapableWithCompletion:", v10);

    v8 = v12;
  }
  else
  {
    +[SKAPresenceClient logger](SKAPresenceClient, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SKAPresenceClient assertPresenceForIdentifier:withPresencePayload:completion:].cold.1();

    +[SKAPresenceClient _noClientIDError](SKAPresenceClient, "_noClientIDError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v8);
  }

}

void __61__SKAPresenceClient_releasePresenceForIdentifier_completion___block_invoke(id *a1, char a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(a1[4], "setActiveAssertion:", 0);
    objc_msgSend(a1[4], "presenceManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = a1[5];
    objc_msgSend(a1[4], "options");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __61__SKAPresenceClient_releasePresenceForIdentifier_completion___block_invoke_39;
    v9[3] = &unk_24D976888;
    v6 = a1[4];
    v10 = a1[5];
    v11 = a1[6];
    objc_msgSend(v3, "releasePresenceAssertionForPresenceIdentifier:options:client:completion:", v4, v5, v6, v9);

    v7 = v10;
  }
  else
  {
    +[SKAPresenceClient logger](SKAPresenceClient, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAPresenceClient _accountNotCapableError](SKAPresenceClient, "_accountNotCapableError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))a1[6] + 2))();
  }

}

void __61__SKAPresenceClient_releasePresenceForIdentifier_completion___block_invoke_39(uint64_t a1, void *a2)
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
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __61__SKAPresenceClient_releasePresenceForIdentifier_completion___block_invoke_39_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Successfully released presence assertion for presenceIdentifier: %@", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchHandleInvitability:(id)a3 fromHandle:(id)a4 forPresenceIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[SKAPresenceClient clientPrefixedPresenceIdentifierForPresenceIdentifier:](self, "clientPrefixedPresenceIdentifierForPresenceIdentifier:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __89__SKAPresenceClient_fetchHandleInvitability_fromHandle_forPresenceIdentifier_completion___block_invoke;
    v16[3] = &unk_24D9767E8;
    v20 = v12;
    v16[4] = self;
    v17 = v10;
    v18 = v11;
    v19 = v13;
    -[SKAPresenceClient accountIsPresenceCapableWithCompletion:](self, "accountIsPresenceCapableWithCompletion:", v16);

    v14 = v20;
  }
  else
  {
    +[SKAPresenceClient logger](SKAPresenceClient, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SKAPresenceClient assertPresenceForIdentifier:withPresencePayload:completion:].cold.1();

    +[SKAPresenceClient _noClientIDError](SKAPresenceClient, "_noClientIDError");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v14);
  }

}

void __89__SKAPresenceClient_fetchHandleInvitability_fromHandle_forPresenceIdentifier_completion___block_invoke(uint64_t a1, char a2)
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
    v9[2] = __89__SKAPresenceClient_fetchHandleInvitability_fromHandle_forPresenceIdentifier_completion___block_invoke_40;
    v9[3] = &unk_24D976810;
    v6 = *(_QWORD *)(a1 + 56);
    v10 = *(id *)(a1 + 64);
    objc_msgSend(v3, "fetchHandleInvitability:fromHandle:forPresenceIdentifier:completion:", v4, v5, v6, v9);

    v7 = v10;
  }
  else
  {
    +[SKAPresenceClient logger](SKAPresenceClient, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAPresenceClient _accountNotCapableError](SKAPresenceClient, "_accountNotCapableError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

uint64_t __89__SKAPresenceClient_fetchHandleInvitability_fromHandle_forPresenceIdentifier_completion___block_invoke_40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchPresenceCapability:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__SKAPresenceClient_fetchPresenceCapability___block_invoke;
  v6[3] = &unk_24D976270;
  v7 = v4;
  v5 = v4;
  -[SKAPresenceClient accountIsPresenceCapableWithCompletion:](self, "accountIsPresenceCapableWithCompletion:", v6);

}

uint64_t __45__SKAPresenceClient_fetchPresenceCapability___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Presence account check completed with result: %d", (uint8_t *)v6, 8u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)inviteHandles:(id)a3 fromSenderHandle:(id)a4 presenceIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  void (**v25)(id, void *);
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  -[SKAPresenceClient options](self, "options");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isPersonal");

  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SKAPresenceClient inviteHandles:fromSenderHandle:presenceIdentifier:completion:].cold.1();

    +[SKAPresenceClient _crossAccountError](SKAPresenceClient, "_crossAccountError");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v18);
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v27 = v12;
      v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_2188DF000, v17, OS_LOG_TYPE_DEFAULT, "Received request to send invitation for presence channel with presence identifier %@ to handles: %@", buf, 0x16u);
    }

    -[SKAPresenceClient clientPrefixedPresenceIdentifierForPresenceIdentifier:](self, "clientPrefixedPresenceIdentifierForPresenceIdentifier:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __82__SKAPresenceClient_inviteHandles_fromSenderHandle_presenceIdentifier_completion___block_invoke;
      v21[3] = &unk_24D9767E8;
      v25 = v13;
      v21[4] = self;
      v22 = v18;
      v23 = v10;
      v24 = v11;
      -[SKAPresenceClient accountIsPresenceCapableWithCompletion:](self, "accountIsPresenceCapableWithCompletion:", v21);

      v19 = v25;
    }
    else
    {
      +[SKAPresenceClient logger](SKAPresenceClient, "logger");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[SKAPresenceClient assertPresenceForIdentifier:withPresencePayload:completion:].cold.1();

      +[SKAPresenceClient _noClientIDError](SKAPresenceClient, "_noClientIDError");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, v19);
    }

  }
}

void __82__SKAPresenceClient_inviteHandles_fromSenderHandle_presenceIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "invitationManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "options");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __82__SKAPresenceClient_inviteHandles_fromSenderHandle_presenceIdentifier_completion___block_invoke_42;
    v10[3] = &unk_24D976838;
    v12 = *(id *)(a1 + 64);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v3, "sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:", v6, v4, v5, v7, v10);

    v8 = v12;
  }
  else
  {
    +[SKAPresenceClient logger](SKAPresenceClient, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __82__SKAPresenceClient_inviteHandles_fromSenderHandle_presenceIdentifier_completion___block_invoke_cold_1();

    +[SKAPresenceClient _accountNotCapableError](SKAPresenceClient, "_accountNotCapableError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __82__SKAPresenceClient_inviteHandles_fromSenderHandle_presenceIdentifier_completion___block_invoke_42(uint64_t a1, char a2, void *a3)
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
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __82__SKAPresenceClient_inviteHandles_fromSenderHandle_presenceIdentifier_completion___block_invoke_42_cold_1();

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

- (void)invitedHandlesForPresenceIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  void (**v16)(id, _QWORD, void *);

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  -[SKAPresenceClient options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isPersonal");

  if (v9)
  {
    +[SKAPresenceClient logger](SKAPresenceClient, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SKAPresenceClient inviteHandles:fromSenderHandle:presenceIdentifier:completion:].cold.1();

    +[SKAPresenceClient _crossAccountError](SKAPresenceClient, "_crossAccountError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v11);
  }
  else
  {
    -[SKAPresenceClient clientPrefixedPresenceIdentifierForPresenceIdentifier:](self, "clientPrefixedPresenceIdentifierForPresenceIdentifier:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __68__SKAPresenceClient_invitedHandlesForPresenceIdentifier_completion___block_invoke;
      v14[3] = &unk_24D9767C0;
      v16 = v7;
      v14[4] = self;
      v15 = v11;
      -[SKAPresenceClient accountIsPresenceCapableWithCompletion:](self, "accountIsPresenceCapableWithCompletion:", v14);

      v12 = v16;
    }
    else
    {
      +[SKAPresenceClient logger](SKAPresenceClient, "logger");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[SKAPresenceClient assertPresenceForIdentifier:withPresencePayload:completion:].cold.1();

      +[SKAPresenceClient _noClientIDError](SKAPresenceClient, "_noClientIDError");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v12);
    }

  }
}

void __68__SKAPresenceClient_invitedHandlesForPresenceIdentifier_completion___block_invoke(uint64_t a1, char a2)
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
    objc_msgSend(v5, "existingChannelForPresenceIdentifier:isPersonal:databaseContext:", *(_QWORD *)(a1 + 40), 0, v4);
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
      +[SKAPresenceClient logger](SKAPresenceClient, "logger");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2188DF000, v16, OS_LOG_TYPE_DEFAULT, "Personal channel does not exist for presence identifier", buf, 2u);
      }

      +[SKAPresenceClient _noChannelError](SKAPresenceClient, "_noChannelError");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v14 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    v14();

  }
  else
  {
    +[SKAPresenceClient logger](SKAPresenceClient, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __82__SKAPresenceClient_inviteHandles_fromSenderHandle_presenceIdentifier_completion___block_invoke_cold_1();

    +[SKAPresenceClient _accountNotCapableError](SKAPresenceClient, "_accountNotCapableError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)isHandleInvited:(id)a3 fromSenderHandle:(id)a4 forPresenceIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  void (**v24)(id, _QWORD, void *);

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  -[SKAPresenceClient options](self, "options");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isPersonal");

  if (v15)
  {
    +[SKAPresenceClient logger](SKAPresenceClient, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SKAPresenceClient inviteHandles:fromSenderHandle:presenceIdentifier:completion:].cold.1();

    +[SKAPresenceClient _crossAccountError](SKAPresenceClient, "_crossAccountError");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v17);
  }
  else
  {
    -[SKAPresenceClient clientPrefixedPresenceIdentifierForPresenceIdentifier:](self, "clientPrefixedPresenceIdentifierForPresenceIdentifier:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __87__SKAPresenceClient_isHandleInvited_fromSenderHandle_forPresenceIdentifier_completion___block_invoke;
      v20[3] = &unk_24D9767E8;
      v24 = v13;
      v20[4] = self;
      v21 = v17;
      v22 = v11;
      v23 = v10;
      -[SKAPresenceClient accountIsPresenceCapableWithCompletion:](self, "accountIsPresenceCapableWithCompletion:", v20);

      v18 = v24;
    }
    else
    {
      +[SKAPresenceClient logger](SKAPresenceClient, "logger");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[SKAPresenceClient assertPresenceForIdentifier:withPresencePayload:completion:].cold.1();

      +[SKAPresenceClient _noClientIDError](SKAPresenceClient, "_noClientIDError");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, 0, v18);
    }

  }
}

void __87__SKAPresenceClient_isHandleInvited_fromSenderHandle_forPresenceIdentifier_completion___block_invoke(uint64_t a1, char a2)
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
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "databaseManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "newBackgroundContext");

    objc_msgSend(*(id *)(a1 + 32), "databaseManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "existingChannelForPresenceIdentifier:isPersonal:databaseContext:", *(_QWORD *)(a1 + 40), 0, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "invitationManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "resolveSenderHandleWithPreferredSenderHandle:", *(_QWORD *)(a1 + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        +[SKAPresenceClient logger](SKAPresenceClient, "logger");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          __87__SKAPresenceClient_isHandleInvited_fromSenderHandle_forPresenceIdentifier_completion___block_invoke_cold_1();

        +[SKAPresenceClient _unableToResolveSenderHandleError](SKAPresenceClient, "_unableToResolveSenderHandleError");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

        goto LABEL_33;
      }
      v25 = v6;
      v26 = v4;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      objc_msgSend(v6, "invitedUsers");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v28;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v28 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            objc_msgSend(v14, "invitedSKHandle");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(*(id *)(a1 + 56), "isNormalizedEqualToHandle:", v15))
            {
              objc_msgSend(v14, "senderSKHandle");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v8, "isNormalizedEqualToHandle:", v16);
              +[SKAPresenceClient logger](SKAPresenceClient, "logger");
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
                v32 = v16;
                v33 = 2112;
                v34 = v8;
                _os_log_impl(&dword_2188DF000, v18, OS_LOG_TYPE_DEFAULT, "We found an existing invitated user matching the requested user, but that invitation was sent with handle %@ instead of handle %@. Ignoring.", buf, 0x16u);
              }

            }
          }
          v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v11)
            continue;
          break;
        }
      }

      +[SKAPresenceClient logger](SKAPresenceClient, "logger");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2188DF000, v9, OS_LOG_TYPE_DEFAULT, "We did not find a match to any existing invited user", buf, 2u);
      }
LABEL_31:
      v6 = v25;
      v4 = v26;

      v22 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    }
    else
    {
      +[SKAPresenceClient logger](SKAPresenceClient, "logger");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2188DF000, v21, OS_LOG_TYPE_DEFAULT, "Personal channel does not exist for presence identifier", buf, 2u);
      }

      +[SKAPresenceClient _noChannelError](SKAPresenceClient, "_noChannelError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    }
    v22();
LABEL_33:

    goto LABEL_34;
  }
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    __82__SKAPresenceClient_inviteHandles_fromSenderHandle_presenceIdentifier_completion___block_invoke_cold_1();

  +[SKAPresenceClient _accountNotCapableError](SKAPresenceClient, "_accountNotCapableError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_34:

}

- (void)registerForDelegateCallbacksWithPresenceIdentifier:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v8;
    _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Registering for delegate callbacks with presence identifier %@", buf, 0xCu);
  }

  -[SKAPresenceClient clientPrefixedPresenceIdentifierForPresenceIdentifier:](self, "clientPrefixedPresenceIdentifierForPresenceIdentifier:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __91__SKAPresenceClient_registerForDelegateCallbacksWithPresenceIdentifier_options_completion___block_invoke;
    v15[3] = &unk_24D976798;
    v18 = v10;
    v15[4] = self;
    v16 = v12;
    v17 = v9;
    -[SKAPresenceClient accountIsPresenceCapableWithCompletion:](self, "accountIsPresenceCapableWithCompletion:", v15);

    v13 = v18;
  }
  else
  {
    +[SKAPresenceClient logger](SKAPresenceClient, "logger");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SKAPresenceClient assertPresenceForIdentifier:withPresencePayload:completion:].cold.1();

    +[SKAPresenceClient _noClientIDError](SKAPresenceClient, "_noClientIDError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v13);
  }

}

void __91__SKAPresenceClient_registerForDelegateCallbacksWithPresenceIdentifier_options_completion___block_invoke(uint64_t a1, char a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    v3 = *(id *)(a1 + 32);
    objc_sync_enter(v3);
    v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(*(id *)(a1 + 32), "setPresenceIdenfifier:", v4);

    objc_msgSend(*(id *)(a1 + 32), "setOptions:", *(_QWORD *)(a1 + 48));
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.statuskit.presence.%@"), *(_QWORD *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[SKAPresenceClient logger](SKAPresenceClient, "logger");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v5;
        _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "SKATransaction: Creating transaction {%@}", buf, 0xCu);
      }

      v7 = objc_retainAutorelease(v5);
      objc_msgSend(v7, "cStringUsingEncoding:", 4);
      v8 = os_transaction_create();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 24);
      *(_QWORD *)(v9 + 24) = v8;

    }
    objc_sync_exit(v3);

    +[SKAPresenceClient logger](SKAPresenceClient, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(void **)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Client %@ has registered for delegate callbacks for presence identifier: %@.", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    +[SKAPresenceClient logger](SKAPresenceClient, "logger");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __82__SKAPresenceClient_inviteHandles_fromSenderHandle_presenceIdentifier_completion___block_invoke_cold_1();

    +[SKAPresenceClient _accountNotCapableError](SKAPresenceClient, "_accountNotCapableError");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

- (void)removeInvitedHandles:(id)a3 presenceIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  void (**v20)(id, void *);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  -[SKAPresenceClient options](self, "options");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isPersonal");

  if (v12)
  {
    +[SKAPresenceClient logger](SKAPresenceClient, "logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SKAPresenceClient removeInvitedHandles:presenceIdentifier:completion:].cold.1();

    +[SKAPresenceClient _crossAccountError](SKAPresenceClient, "_crossAccountError");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v14);
  }
  else
  {
    -[SKAPresenceClient clientPrefixedPresenceIdentifierForPresenceIdentifier:](self, "clientPrefixedPresenceIdentifierForPresenceIdentifier:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __72__SKAPresenceClient_removeInvitedHandles_presenceIdentifier_completion___block_invoke;
      v17[3] = &unk_24D976798;
      v20 = v10;
      v17[4] = self;
      v18 = v14;
      v19 = v8;
      -[SKAPresenceClient accountIsPresenceCapableWithCompletion:](self, "accountIsPresenceCapableWithCompletion:", v17);

      v15 = v20;
    }
    else
    {
      +[SKAPresenceClient logger](SKAPresenceClient, "logger");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[SKAPresenceClient assertPresenceForIdentifier:withPresencePayload:completion:].cold.1();

      +[SKAPresenceClient _noClientIDError](SKAPresenceClient, "_noClientIDError");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v15);
    }

  }
}

void __72__SKAPresenceClient_removeInvitedHandles_presenceIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "invitationManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(a1 + 48);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __72__SKAPresenceClient_removeInvitedHandles_presenceIdentifier_completion___block_invoke_46;
    v11[3] = &unk_24D977F18;
    v6 = v4;
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v12 = v6;
    v13 = v7;
    v14 = v8;
    v15 = *(id *)(a1 + 56);
    objc_msgSend(v3, "revokeInvitationFromPresenceChannelWithPresenceIdentifier:forHandles:completion:", v5, v6, v11);

    v9 = v12;
  }
  else
  {
    +[SKAPresenceClient logger](SKAPresenceClient, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __82__SKAPresenceClient_inviteHandles_fromSenderHandle_presenceIdentifier_completion___block_invoke_cold_1();

    +[SKAPresenceClient _accountNotCapableError](SKAPresenceClient, "_accountNotCapableError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __72__SKAPresenceClient_removeInvitedHandles_presenceIdentifier_completion___block_invoke_46(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    +[SKAPresenceClient logger](SKAPresenceClient, "logger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __72__SKAPresenceClient_removeInvitedHandles_presenceIdentifier_completion___block_invoke_46_cold_1();
  }
  else
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "activeAssertion") & 1) != 0
      || objc_msgSend(*(id *)(a1 + 40), "activeSubscription"))
    {
      objc_msgSend(*(id *)(a1 + 40), "refreshAssertionsForPresenceIdentifier:", *(_QWORD *)(a1 + 48));
    }
    +[SKAPresenceClient logger](SKAPresenceClient, "logger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Invitation revocation for handles %@ completed succesffully", (uint8_t *)&v6, 0xCu);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)retainTransientSubscriptionAssertionForPresenceIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  SKAPresenceClient *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, "Retaining transient subscription assertion for presence identifier %@", buf, 0xCu);
  }

  -[SKAPresenceClient clientPrefixedPresenceIdentifierForPresenceIdentifier:](self, "clientPrefixedPresenceIdentifierForPresenceIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __90__SKAPresenceClient_retainTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke;
    v12[3] = &unk_24D976798;
    v16 = v7;
    v13 = v6;
    v14 = self;
    v15 = v9;
    -[SKAPresenceClient accountIsPresenceCapableWithCompletion:](self, "accountIsPresenceCapableWithCompletion:", v12);

    v10 = v16;
  }
  else
  {
    +[SKAPresenceClient logger](SKAPresenceClient, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SKAPresenceClient assertPresenceForIdentifier:withPresencePayload:completion:].cold.1();

    +[SKAPresenceClient _noClientIDError](SKAPresenceClient, "_noClientIDError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }

}

void __90__SKAPresenceClient_retainTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Account is presence capable, finding channel for identifier %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "setActiveSubscription:", 1);
    objc_msgSend(*(id *)(a1 + 40), "databaseManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "newBackgroundContext");

    objc_msgSend(*(id *)(a1 + 40), "presenceManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "options");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __90__SKAPresenceClient_retainTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_47;
    v13[3] = &unk_24D976248;
    v14 = *(id *)(a1 + 48);
    v12 = *(id *)(a1 + 56);
    v15 = *(_QWORD *)(a1 + 40);
    v16 = v12;
    objc_msgSend(v9, "findOrCreatePresenceChannelForPresenceIdentifier:options:databaseContext:completion:", v10, v11, v8, v13);

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAPresenceClient _accountNotCapableError](SKAPresenceClient, "_accountNotCapableError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __90__SKAPresenceClient_retainTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_47(id *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v5 = a2;
  v6 = v5;
  if (!v5 || a3)
  {
    +[SKAPresenceClient logger](SKAPresenceClient, "logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __90__SKAPresenceClient_retainTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_47_cold_1();

    +[SKAPresenceClient _noChannelCreatedError](SKAPresenceClient, "_noChannelCreatedError");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "setActiveSubscriptionIdentifier:", v7);
    objc_msgSend(a1[5], "subscriptionManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __90__SKAPresenceClient_retainTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_48;
    v14[3] = &unk_24D977EF0;
    v15 = v7;
    v9 = a1[5];
    v10 = a1[4];
    v11 = a1[5];
    v16 = v10;
    v17 = v11;
    v18 = v6;
    v19 = a1[6];
    v12 = v7;
    objc_msgSend(v8, "retainPresenceSubscriptionAssertionForSubscriptionIdentifier:client:completion:", v12, v9, v14);

  }
}

void __90__SKAPresenceClient_retainTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_48(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __90__SKAPresenceClient_retainTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_48_cold_1();

    objc_msgSend(*(id *)(a1 + 48), "setActiveSubscription:", 0);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v10 = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Successfully retained presence subscription assertion for subscriptionIdentifier: %@ presenceIdentifier: %@", (uint8_t *)&v10, 0x16u);
    }

    if ((objc_msgSend(*(id *)(a1 + 48), "activeAssertion") & 1) == 0)
    {
      +[SKAPresenceClient logger](SKAPresenceClient, "logger");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, "Polling for current state as there is no active assertion", (uint8_t *)&v10, 2u);
      }

      objc_msgSend(*(id *)(a1 + 48), "presenceManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sendPollingMessageForChannel:", *(_QWORD *)(a1 + 56));

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

- (void)releaseTransientSubscriptionAssertionForPresenceIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a4;
  -[SKAPresenceClient clientPrefixedPresenceIdentifierForPresenceIdentifier:](self, "clientPrefixedPresenceIdentifierForPresenceIdentifier:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __91__SKAPresenceClient_releaseTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke;
    v10[3] = &unk_24D9767C0;
    v12 = v6;
    v10[4] = self;
    v11 = v7;
    -[SKAPresenceClient accountIsPresenceCapableWithCompletion:](self, "accountIsPresenceCapableWithCompletion:", v10);

    v8 = v12;
  }
  else
  {
    +[SKAPresenceClient logger](SKAPresenceClient, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SKAPresenceClient assertPresenceForIdentifier:withPresencePayload:completion:].cold.1();

    +[SKAPresenceClient _noClientIDError](SKAPresenceClient, "_noClientIDError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v8);
  }

}

void __91__SKAPresenceClient_releaseTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke(id *a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(a1[4], "setActiveSubscription:", 0);
    objc_msgSend(a1[4], "databaseManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "newBackgroundContext");

    objc_msgSend(a1[4], "presenceManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1[5];
    objc_msgSend(a1[4], "options");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isPersonal");
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __91__SKAPresenceClient_releaseTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_50;
    v11[3] = &unk_24D976248;
    v12 = a1[5];
    v9 = a1[6];
    v13 = a1[4];
    v14 = v9;
    objc_msgSend(v5, "findPresenceChannelForPresenceIdentifier:isPersonal:databaseContext:completion:", v6, v8, v4, v11);

  }
  else
  {
    +[SKAPresenceClient logger](SKAPresenceClient, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAPresenceClient _accountNotCapableError](SKAPresenceClient, "_accountNotCapableError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))a1[6] + 2))();
  }

}

void __91__SKAPresenceClient_releaseTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_50(id *a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  if (!a2 || a3)
  {
    +[SKAPresenceClient logger](SKAPresenceClient, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __90__SKAPresenceClient_retainTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_47_cold_1();

    +[SKAPresenceClient _noChannelCreatedError](SKAPresenceClient, "_noChannelCreatedError");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    objc_msgSend(a2, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "subscriptionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __91__SKAPresenceClient_releaseTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_51;
    v9[3] = &unk_24D976A68;
    v10 = v4;
    v6 = a1[5];
    v11 = a1[4];
    v12 = a1[6];
    v7 = v4;
    objc_msgSend(v5, "releasePresenceSubscriptionAssertionForSubscriptionIdentifier:client:completion:", v7, v6, v9);

  }
}

void __91__SKAPresenceClient_releaseTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_51(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __90__SKAPresenceClient_retainTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_48_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = a1[5];
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Successfully released presence subscription assertion for subscriptionIdentifier: %@ presenceIdentifier: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)presentDevicesForPresenceIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a4;
  -[SKAPresenceClient clientPrefixedPresenceIdentifierForPresenceIdentifier:](self, "clientPrefixedPresenceIdentifierForPresenceIdentifier:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __68__SKAPresenceClient_presentDevicesForPresenceIdentifier_completion___block_invoke;
    v11[3] = &unk_24D9767C0;
    v13 = v6;
    v11[4] = self;
    v12 = v7;
    -[SKAPresenceClient accountIsPresenceCapableWithCompletion:](self, "accountIsPresenceCapableWithCompletion:", v11);

    v8 = v13;
  }
  else
  {
    +[SKAPresenceClient logger](SKAPresenceClient, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SKAPresenceClient assertPresenceForIdentifier:withPresencePayload:completion:].cold.1();

    +[SKAPresenceClient _noClientIDError](SKAPresenceClient, "_noClientIDError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    (*((void (**)(id, id, void *))v6 + 2))(v6, v10, v8);

  }
}

void __68__SKAPresenceClient_presentDevicesForPresenceIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "presenceManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "options");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isPersonal");
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __68__SKAPresenceClient_presentDevicesForPresenceIdentifier_completion___block_invoke_53;
    v11[3] = &unk_24D977F40;
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v3, "presentDevicesForPresenceIdentifier:isPersonal:completion:", v4, v6, v11);

    v7 = v12;
  }
  else
  {
    +[SKAPresenceClient logger](SKAPresenceClient, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAPresenceClient _accountNotCapableError](SKAPresenceClient, "_accountNotCapableError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    v10 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v10, v7);

  }
}

void __68__SKAPresenceClient_presentDevicesForPresenceIdentifier_completion___block_invoke_53(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  if (v5)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v8);

  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, a2, 0);
  }

}

- (id)clientPrefixedPresenceIdentifierForPresenceIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    -[SKAPresenceClient clientConnection](self, "clientConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[SKAPresenceClient _shortHashOfClientID:](self, "_shortHashOfClientID:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("%@-%@-%@"), v6, v4, v7);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)rawPresenceIdentifierForPrefixedPresenceIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = v4;
  if (v4 && (unint64_t)objc_msgSend(v4, "length") >= 4)
  {
    -[SKAPresenceClient clientConnection](self, "clientConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clientID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[SKAPresenceClient _shortHashOfClientID:](self, "_shortHashOfClientID:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("-"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", v8))
      {
        objc_msgSend(v10, "lastObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToString:", v9))
        {
          objc_msgSend(v10, "subarrayWithRange:", 1, objc_msgSend(v10, "count") - 2);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "componentsJoinedByString:", CFSTR("-"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v6 = 0;
        }

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_shortHashOfClientID:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "ska_sha256Hash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "substringToIndex:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)accountIsPresenceCapableWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  SKAPresenceClient *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Checking if account is presence capable...", buf, 2u);
  }

  v6 = self;
  objc_sync_enter(v6);
  -[SKAPresenceClient databaseManager](v6, "databaseManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__SKAPresenceClient_accountIsPresenceCapableWithCompletion___block_invoke;
  v9[3] = &unk_24D9762E8;
  v9[4] = v6;
  v8 = v4;
  v10 = v8;
  objc_msgSend(v7, "deviceToDeviceEncryptedDatabaseCapableWithCompletion:", v9);

  objc_sync_exit(v6);
}

void __60__SKAPresenceClient_accountIsPresenceCapableWithCompletion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__SKAPresenceClient_accountIsPresenceCapableWithCompletion___block_invoke_2;
  v5[3] = &unk_24D9768B0;
  v6 = *(id *)(a1 + 40);
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __60__SKAPresenceClient_accountIsPresenceCapableWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)presenceIdentifierMatchesClient:(id)a3
{
  id v4;
  SKAPresenceClient *v5;
  NSString *v6;
  char v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = v5->_presenceIdenfifier;
  objc_sync_exit(v5);

  if (-[NSString length](v6, "length") || objc_msgSend(v4, "length"))
    v7 = objc_msgSend(v4, "isEqualToString:", v6);
  else
    v7 = 0;

  return v7;
}

- (void)handleReceivedPresentDevicesUpdateForPresenceIdentifier:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *presenceIdenfifier;
  _QWORD v13[4];
  id v14;
  SKAPresenceClient *v15;
  id v16;
  uint8_t buf[4];
  NSString *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[SKAPresenceClient presenceIdentifierMatchesClient:](self, "presenceIdentifierMatchesClient:", v4);
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Notifying client of updated present devices", buf, 2u);
    }

    -[SKAPresenceClientConnection asynchronousRemoteDaemonDelegateWithErrorHandler:](self->_clientConnection, "asynchronousRemoteDaemonDelegateWithErrorHandler:", &__block_literal_global_60);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKAPresenceClient presenceManager](self, "presenceManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKAPresenceClient options](self, "options");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isPersonal");
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __77__SKAPresenceClient_handleReceivedPresentDevicesUpdateForPresenceIdentifier___block_invoke_61;
    v13[3] = &unk_24D977FA8;
    v14 = v4;
    v15 = self;
    v16 = v8;
    v6 = v8;
    objc_msgSend(v9, "presentDevicesForPresenceIdentifier:isPersonal:completion:", v14, v11, v13);

  }
  else if (v7)
  {
    presenceIdenfifier = self->_presenceIdenfifier;
    *(_DWORD *)buf = 138412546;
    v18 = presenceIdenfifier;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Connected client does not match presence identifier of changed channel. Client: %@ Presence: %@", buf, 0x16u);
  }

}

void __77__SKAPresenceClient_handleReceivedPresentDevicesUpdateForPresenceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __77__SKAPresenceClient_handleReceivedPresentDevicesUpdateForPresenceIdentifier___block_invoke_cold_1();

}

void __77__SKAPresenceClient_handleReceivedPresentDevicesUpdateForPresenceIdentifier___block_invoke_61(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  id *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[SKAPresenceClient oversizeLogger](SKAPresenceClient, "oversizeLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v19 = 138543874;
      v20 = v9;
      v21 = 2112;
      v22 = v5;
      v23 = 2112;
      v24 = v6;
      _os_log_error_impl(&dword_2188DF000, v8, OS_LOG_TYPE_ERROR, "Retrieved present devices. Presence: %{public}@ Handles: %@ Error: %@", (uint8_t *)&v19, 0x20u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v19 = 138543618;
    v20 = v10;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, "Retrieved present devices. Presence: %{public}@ Handles: %@", (uint8_t *)&v19, 0x16u);
  }

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  }
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 40);
  v16 = *(void **)(v13 + 96);
  v14 = (id *)(v13 + 96);
  v15 = v16;
  if (v16)
  {
    if ((objc_msgSend(v15, "isEqualToSet:", v12) & 1) != 0)
    {
      +[SKAPresenceClient logger](SKAPresenceClient, "logger");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_2188DF000, v17, OS_LOG_TYPE_DEFAULT, "No change in present devices - not notifying delegate", (uint8_t *)&v19, 2u);
      }
      goto LABEL_17;
    }
  }
  else
  {
    objc_storeStrong(v14, v12);
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 96), v12);
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_2188DF000, v18, OS_LOG_TYPE_DEFAULT, "Notifying delegate of present devices change", (uint8_t *)&v19, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "rawPresenceIdentifierForPrefixedPresenceIdentifier:", *(_QWORD *)(a1 + 32));
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "presentHandlesChangedForPresenceIdentifier:completion:", v17, &__block_literal_global_64_0);
LABEL_17:

}

void __77__SKAPresenceClient_handleReceivedPresentDevicesUpdateForPresenceIdentifier___block_invoke_63()
{
  NSObject *v0;
  uint8_t v1[16];

  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2188DF000, v0, OS_LOG_TYPE_DEFAULT, "Connected client completed processing of present devices update.", v1, 2u);
  }

}

- (void)handleReceivedInvitationForPresenceIdentifier:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  NSString *presenceIdenfifier;
  int v10;
  NSString *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[SKAPresenceClient presenceIdentifierMatchesClient:](self, "presenceIdentifierMatchesClient:", v4);
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Notifying client of updated invitations", (uint8_t *)&v10, 2u);
    }

    -[SKAPresenceClientConnection asynchronousRemoteDaemonDelegateWithErrorHandler:](self->_clientConnection, "asynchronousRemoteDaemonDelegateWithErrorHandler:", &__block_literal_global_65);
    v6 = objc_claimAutoreleasedReturnValue();
    -[SKAPresenceClient rawPresenceIdentifierForPrefixedPresenceIdentifier:](self, "rawPresenceIdentifierForPrefixedPresenceIdentifier:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject invitedHandlesChangedForPresenceIdentifier:completion:](v6, "invitedHandlesChangedForPresenceIdentifier:completion:", v8, &__block_literal_global_67);

  }
  else if (v7)
  {
    presenceIdenfifier = self->_presenceIdenfifier;
    v10 = 138412546;
    v11 = presenceIdenfifier;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Connected client does not match presence identifier of changed channel. Client: %@ Presence: %@", (uint8_t *)&v10, 0x16u);
  }

}

void __67__SKAPresenceClient_handleReceivedInvitationForPresenceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __67__SKAPresenceClient_handleReceivedInvitationForPresenceIdentifier___block_invoke_cold_1();

}

void __67__SKAPresenceClient_handleReceivedInvitationForPresenceIdentifier___block_invoke_66()
{
  NSObject *v0;
  uint8_t v1[16];

  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2188DF000, v0, OS_LOG_TYPE_DEFAULT, "Connected client completed processing of invited handles update.", v1, 2u);
  }

}

- (void)refreshAssertionsForPresenceIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id *v10;
  NSString *v11;
  NSObject *v12;
  NSString *presenceIdenfifier;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[2];
  _QWORD v17[4];
  _QWORD v18[2];
  uint8_t buf[4];
  NSString *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[SKAPresenceClient presenceIdentifierMatchesClient:](self, "presenceIdentifierMatchesClient:", v4))
  {
    -[SKAPresenceClient databaseManager](self, "databaseManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "newBackgroundContext");

    if (-[SKAPresenceClient activeSubscription](self, "activeSubscription"))
    {
      -[SKAPresenceClient presenceManager](self, "presenceManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKAPresenceClient options](self, "options");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isPersonal");
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke;
      v17[3] = &unk_24D978060;
      v10 = (id *)v18;
      v18[0] = v4;
      v18[1] = self;
      objc_msgSend(v7, "findPresenceChannelForPresenceIdentifier:isPersonal:databaseContext:completion:", v18[0], v9, v6, v17);
LABEL_10:

      goto LABEL_11;
    }
    if (-[SKAPresenceClient activeAssertion](self, "activeAssertion"))
    {
      +[SKAPresenceClient logger](SKAPresenceClient, "logger");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        presenceIdenfifier = self->_presenceIdenfifier;
        *(_DWORD *)buf = 138412290;
        v20 = presenceIdenfifier;
        _os_log_impl(&dword_2188DF000, v12, OS_LOG_TYPE_DEFAULT, "Reasserting presence to handle change in underlying channel for presenceIdentifier %@", buf, 0xCu);
      }

      -[SKAPresenceClient presenceManager](self, "presenceManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKAPresenceClient currentPayload](self, "currentPayload");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKAPresenceClient options](self, "options");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_71;
      v15[3] = &unk_24D978088;
      v10 = (id *)v16;
      v16[0] = v4;
      v16[1] = self;
      objc_msgSend(v7, "retainPresenceAssertionForPresenceIdentifier:withPresencePayload:options:client:completion:", v16[0], v8, v14, self, v15);

      goto LABEL_10;
    }
  }
  else
  {
    +[SKAPresenceClient logger](SKAPresenceClient, "logger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_presenceIdenfifier;
      *(_DWORD *)buf = 138412546;
      v20 = v11;
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Connected client does not match presence identifier of changed channel. Client: %@ Presence: %@", buf, 0x16u);
    }
  }
LABEL_11:

}

void __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v4;
  void *v5;
  char v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  uint64_t v17;
  id v18;
  NSObject *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (!a2 || a3)
  {
    +[SKAPresenceClient logger](SKAPresenceClient, "logger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(a2, "identifier");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "activeSubscriptionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NSObject isEqualToString:](v4, "isEqualToString:", v5);

    +[SKAPresenceClient logger](SKAPresenceClient, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if ((v6 & 1) != 0)
    {
      if (v8)
      {
        objc_msgSend(*(id *)(a1 + 40), "presenceIdenfifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "activeSubscriptionIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v21 = v9;
        v22 = 2112;
        v23 = v10;
        v24 = 2112;
        v25 = v4;
        _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Not moving over to new channel for presence identifier %@. Old channel %@ is same as the New channel %@", buf, 0x20u);

      }
    }
    else
    {
      if (v8)
      {
        objc_msgSend(*(id *)(a1 + 40), "presenceIdenfifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "activeSubscriptionIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v21 = v11;
        v22 = 2112;
        v23 = v12;
        v24 = 2112;
        v25 = v4;
        _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Moving over to new channel for presence identifier %@. Old channel %@ New channel %@", buf, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 40), "subscriptionManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "activeSubscriptionIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_68;
      v16[3] = &unk_24D978010;
      v15 = *(void **)(a1 + 32);
      v17 = *(_QWORD *)(a1 + 40);
      v18 = v15;
      v4 = v4;
      v19 = v4;
      objc_msgSend(v13, "releasePresenceSubscriptionAssertionForSubscriptionIdentifier:client:completion:", v14, v17, v16);

    }
  }

}

void __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_68(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_68_cold_1(a1, (uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "activeSubscriptionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Successfully released presence subscription assertion for subscriptionIdentifier: %@ presenceIdentifier: %@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setActiveSubscriptionIdentifier:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "subscriptionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_69;
  v14[3] = &unk_24D978038;
  v15 = v3;
  v10 = *(void **)(a1 + 48);
  v16 = v10;
  v11 = *(id *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 32);
  v17 = v11;
  v18 = v12;
  v13 = v3;
  objc_msgSend(v8, "retainPresenceSubscriptionAssertionForSubscriptionIdentifier:client:completion:", v10, v9, v14);

}

void __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_69(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_69_cold_1();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(void **)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    v23 = v7;
    v24 = 2112;
    v25 = v8;
    _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Successfully retained presence subscription assertion for subscriptionIdentifier: %@ presenceIdentifier: %@", buf, 0x16u);
  }

  if (objc_msgSend(*(id *)(a1 + 56), "activeAssertion"))
  {
    +[SKAPresenceClient logger](SKAPresenceClient, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 56), "presenceIdenfifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v10;
      _os_log_impl(&dword_2188DF000, v9, OS_LOG_TYPE_DEFAULT, "Reasserting presence to handle change in underlying channel for presenceIdentifier %@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 56), "presenceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "currentPayload");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "options");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 56);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_70;
    v18[3] = &unk_24D978010;
    v19 = *(id *)(a1 + 32);
    v16 = *(id *)(a1 + 48);
    v17 = *(_QWORD *)(a1 + 56);
    v20 = v16;
    v21 = v17;
    objc_msgSend(v11, "retainPresenceAssertionForPresenceIdentifier:withPresencePayload:options:client:completion:", v12, v13, v14, v15, v18);

  }
}

void __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_70(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_70_cold_1();

    objc_msgSend(*(id *)(a1 + 48), "setActiveAssertion:", 0);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Successfully retained presence assertion for presenceIdentifier: %@", (uint8_t *)&v8, 0xCu);
    }

  }
}

void __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_71(uint64_t a1, void *a2)
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
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __80__SKAPresenceClient_assertPresenceForIdentifier_withPresencePayload_completion___block_invoke_31_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "setActiveAssertion:", 0);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Successfully retained presence assertion for presenceIdentifier: %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)initialCloudKitImportReceived
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "Notifying client of initial cloud kit import.", v5, 2u);
  }

  -[SKAPresenceClientConnection asynchronousRemoteDaemonDelegateWithErrorHandler:](self->_clientConnection, "asynchronousRemoteDaemonDelegateWithErrorHandler:", &__block_literal_global_72);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "initialCloudKitImportReceivedWithCompletion:", &__block_literal_global_74);

}

void __50__SKAPresenceClient_initialCloudKitImportReceived__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __50__SKAPresenceClient_initialCloudKitImportReceived__block_invoke_cold_1();

}

void __50__SKAPresenceClient_initialCloudKitImportReceived__block_invoke_73()
{
  NSObject *v0;
  uint8_t v1[16];

  +[SKAPresenceClient logger](SKAPresenceClient, "logger");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2188DF000, v0, OS_LOG_TYPE_DEFAULT, "Connected client completed processing of initial cloud kit import.", v1, 2u);
  }

}

- (NSString)presenceIdenfifier
{
  return self->_presenceIdenfifier;
}

- (void)setPresenceIdenfifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (SKAPresenceClientConnection)clientConnection
{
  return self->_clientConnection;
}

- (void)setClientConnection:(id)a3
{
  objc_storeStrong((id *)&self->_clientConnection, a3);
}

- (SKAPresenceClientDelegate)delegate
{
  return (SKAPresenceClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (SKAStatusSubscriptionManaging)subscriptionManager
{
  return self->_subscriptionManager;
}

- (void)setSubscriptionManager:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionManager, a3);
}

- (SKAInvitationManaging)invitationManager
{
  return self->_invitationManager;
}

- (void)setInvitationManager:(id)a3
{
  objc_storeStrong((id *)&self->_invitationManager, a3);
}

- (SKAPresenceManaging)presenceManager
{
  return self->_presenceManager;
}

- (void)setPresenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_presenceManager, a3);
}

- (BOOL)activeSubscription
{
  return self->_activeSubscription;
}

- (void)setActiveSubscription:(BOOL)a3
{
  self->_activeSubscription = a3;
}

- (NSString)activeSubscriptionIdentifier
{
  return self->_activeSubscriptionIdentifier;
}

- (void)setActiveSubscriptionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_activeSubscriptionIdentifier, a3);
}

- (BOOL)activeAssertion
{
  return self->_activeAssertion;
}

- (void)setActiveAssertion:(BOOL)a3
{
  self->_activeAssertion = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSSet)lastSeenPresentDevices
{
  return self->_lastSeenPresentDevices;
}

- (void)setLastSeenPresentDevices:(id)a3
{
  objc_storeStrong((id *)&self->_lastSeenPresentDevices, a3);
}

- (SKPresencePayload)currentPayload
{
  return self->_currentPayload;
}

- (void)setCurrentPayload:(id)a3
{
  objc_storeStrong((id *)&self->_currentPayload, a3);
}

- (SKPresenceOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (double)lastSelfInviteSentTimestamp
{
  return self->_lastSelfInviteSentTimestamp;
}

- (void)setLastSelfInviteSentTimestamp:(double)a3
{
  self->_lastSelfInviteSentTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_currentPayload, 0);
  objc_storeStrong((id *)&self->_lastSeenPresentDevices, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activeSubscriptionIdentifier, 0);
  objc_storeStrong((id *)&self->_presenceManager, 0);
  objc_storeStrong((id *)&self->_invitationManager, 0);
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_presenceIdenfifier, 0);
}

void __60__SKAPresenceClient_presenceClientConnectionWasInterrupted___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error releasing transient subscription assertions associated with interrupted client: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __60__SKAPresenceClient_presenceClientConnectionWasInterrupted___block_invoke_18_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error releasing presence assertions associated with interrupted client: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __60__SKAPresenceClient_presenceClientConnectionWasInvalidated___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error releasing presence subscription assertions associated with invalidated client: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __60__SKAPresenceClient_presenceClientConnectionWasInvalidated___block_invoke_21_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error releasing presence assertions associated with invalidated client: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)assertPresenceForIdentifier:withPresencePayload:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Missing client ID entitlement or presence identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __80__SKAPresenceClient_assertPresenceForIdentifier_withPresencePayload_completion___block_invoke_31_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_14_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v0, v1, "Error retaining presence assertion for presenceIdentifier: %@ error: %@");
  OUTLINED_FUNCTION_3();
}

void __61__SKAPresenceClient_releasePresenceForIdentifier_completion___block_invoke_39_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_14_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v0, v1, "Error releasing presence assertion for presenceIdentifier: %@ error: %@");
  OUTLINED_FUNCTION_3();
}

- (void)inviteHandles:fromSenderHandle:presenceIdentifier:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Inviting handles isn't available when isPersonal is true", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __82__SKAPresenceClient_inviteHandles_fromSenderHandle_presenceIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Account is not Presence capable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __82__SKAPresenceClient_inviteHandles_fromSenderHandle_presenceIdentifier_completion___block_invoke_42_cold_1()
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

void __87__SKAPresenceClient_isHandleInvited_fromSenderHandle_forPresenceIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error resolving sender handle for isInvited check. UnresolvedSenderHandle: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)removeInvitedHandles:presenceIdentifier:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Inviting (or removing) handles isn't available when isPersonal is true", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __72__SKAPresenceClient_removeInvitedHandles_presenceIdentifier_completion___block_invoke_46_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_14_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v0, v1, "Invitation revocation for handles %@ failed with error: %@");
  OUTLINED_FUNCTION_3();
}

void __90__SKAPresenceClient_retainTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_47_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Unable to find or create channel for presenceIdentifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __90__SKAPresenceClient_retainTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_48_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9(&dword_2188DF000, v0, v1, "Error retaining presence subscription assertion for subscriptionIdentifier: %@ presenceIdentifier: %@ error: %@");
  OUTLINED_FUNCTION_14();
}

void __77__SKAPresenceClient_handleReceivedPresentDevicesUpdateForPresenceIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "XPC Error notifying client of present devices update. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __67__SKAPresenceClient_handleReceivedInvitationForPresenceIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "XPC Error notifying client of invitations update. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Unable to find channel for presenceIdentifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_68_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "activeSubscriptionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  v8 = 2112;
  v9 = v6;
  v10 = 2112;
  v11 = a2;
  _os_log_error_impl(&dword_2188DF000, a3, OS_LOG_TYPE_ERROR, "Error releasing presence subscription assertion for subscriptionIdentifier: %@ presenceIdentifier: %@ error: %@", v7, 0x20u);

}

void __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_69_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9(&dword_2188DF000, v0, v1, "Error retaining presence subscription assertion for subscriptionIdentifier: %@ presenceIdentifier: %@ error: %@");
  OUTLINED_FUNCTION_14();
}

void __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_70_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v0, v1, "Error retaining presence assertion for presenceIdentifier: %@ error: %@");
  OUTLINED_FUNCTION_3();
}

void __50__SKAPresenceClient_initialCloudKitImportReceived__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "XPC Error notifying client of initial cloud kit import. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
