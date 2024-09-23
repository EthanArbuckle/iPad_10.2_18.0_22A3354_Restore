@implementation SKAStatusSubscriptionServiceClient

- (SKAStatusSubscriptionServiceClient)initWithXPCConnection:(id)a3 queue:(id)a4 delegate:(id)a5 databaseManager:(id)a6 subscriptionManager:(id)a7 encryptionManager:(id)a8 inTrafficMode:(BOOL)a9
{
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  SKAStatusSubscriptionServiceClient *v20;
  SKAStatusSubscriptionServiceClientConnection *v21;
  SKAStatusSubscriptionServiceClientConnection *clientConnection;
  id v24;
  objc_super v25;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v24 = a6;
  v18 = a7;
  v19 = a8;
  dispatch_assert_queue_V2(v16);
  v25.receiver = self;
  v25.super_class = (Class)SKAStatusSubscriptionServiceClient;
  v20 = -[SKAStatusSubscriptionServiceClient init](&v25, sel_init);
  if (v20)
  {
    v21 = -[SKAStatusSubscriptionServiceClientConnection initWithXPCConnection:queue:daemonProtocolDelegate:connectionLifecycleDelegate:]([SKAStatusSubscriptionServiceClientConnection alloc], "initWithXPCConnection:queue:daemonProtocolDelegate:connectionLifecycleDelegate:", v15, v16, v20, v20);
    clientConnection = v20->_clientConnection;
    v20->_clientConnection = v21;

    objc_storeWeak((id *)&v20->_delegate, v17);
    objc_storeStrong((id *)&v20->_databaseManager, a6);
    objc_storeStrong((id *)&v20->_subscriptionManager, a7);
    objc_storeStrong((id *)&v20->_encryptionManager, a8);
    objc_storeStrong((id *)&v20->_queue, a4);
    v20->_trafficModeEnabled = a9;
  }

  return v20;
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
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Client is not entitled to subscription information for status of type \"%@\". Missing entitlement \"%@\"), a3, CFSTR("com.apple.StatusKit.subscribe.types"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BEB10D8];
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
  v5 = *MEMORY[0x24BEB10D8];
  v9 = *MEMORY[0x24BDD0BA0];
  v10[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, -2100, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_genericMissingSubscriptionEntitlmentError
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Client is not entitled to subscription information for status. Missing entitlement \"%@\"), CFSTR("com.apple.StatusKit.subscribe.types"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BEB10D8];
  v8 = *MEMORY[0x24BDD0BA0];
  v9[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, -2000, v5);
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
  v3 = *MEMORY[0x24BEB10D8];
  v7 = *MEMORY[0x24BDD0BA0];
  v8[0] = CFSTR("System iCloud account does not exist or is not statuskit capable");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -4000, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_inTrafficError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEB10D8];
  v7 = *MEMORY[0x24BDD0BA0];
  v8[0] = CFSTR("Traffic mode is enable and status access is unavailable");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -5000, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_subscriptionIdentifierNotFoundError:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Subscription not found matching subscription identifier: \"%@\"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BEB10D8];
  v9 = *MEMORY[0x24BDD0BA0];
  v10[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, -3000, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)logger
{
  if (logger_onceToken_9 != -1)
    dispatch_once(&logger_onceToken_9, &__block_literal_global_9);
  return (id)logger__logger_9;
}

void __44__SKAStatusSubscriptionServiceClient_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKAStatusSubscriptionServiceClient");
  v1 = (void *)logger__logger_9;
  logger__logger_9 = (uint64_t)v0;

}

- (void)handleRemoteDatabaseChangeForChannels:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (-[SKAStatusSubscriptionServiceClient channelMatchesClientStatusTypeIdentifier:](self, "channelMatchesClientStatusTypeIdentifier:", v11))
        {
          objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    v12 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = v5;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          -[SKAStatusSubscriptionServiceClient _subscriptionMetadataForChannel:](self, "_subscriptionMetadataForChannel:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j), (_QWORD)v21);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v15);
    }

    -[SKAStatusSubscriptionServiceClientConnection asynchronousRemoteDaemonDelegateWithErrorHandler:](self->_clientConnection, "asynchronousRemoteDaemonDelegateWithErrorHandler:", &__block_literal_global_22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "subscriptionStateChangedForSubscriptions:completion:", v20, &__block_literal_global_25);

  }
}

void __76__SKAStatusSubscriptionServiceClient_handleRemoteDatabaseChangeForChannels___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __76__SKAStatusSubscriptionServiceClient_handleRemoteDatabaseChangeForChannels___block_invoke_cold_1();

}

void __76__SKAStatusSubscriptionServiceClient_handleRemoteDatabaseChangeForChannels___block_invoke_24()
{
  NSObject *v0;
  uint8_t v1[16];

  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2188DF000, v0, OS_LOG_TYPE_DEFAULT, "Connected client completed processing of remote database changes.", v1, 2u);
  }

}

- (void)handleReceivedStatusUpdate:(id)a3 onChannel:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSString *statusTypeIdenfifier;
  int v10;
  NSObject *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (-[SKAStatusSubscriptionServiceClient channelMatchesClientStatusTypeIdentifier:](self, "channelMatchesClientStatusTypeIdentifier:", v5))
  {
    -[SKAStatusSubscriptionServiceClient _subscriptionMetadataForChannel:](self, "_subscriptionMetadataForChannel:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Notifying client of updated subscription: %@", (uint8_t *)&v10, 0xCu);
    }

    if (v6)
    {
      -[SKAStatusSubscriptionServiceClientConnection asynchronousRemoteDaemonDelegateWithErrorHandler:](self->_clientConnection, "asynchronousRemoteDaemonDelegateWithErrorHandler:", &__block_literal_global_26);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "subscriptionReceivedStatusUpdate:completion:", v6, &__block_literal_global_28);
LABEL_8:

    }
  }
  else
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      statusTypeIdenfifier = self->_statusTypeIdenfifier;
      objc_msgSend(v5, "statusType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = statusTypeIdenfifier;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Connected client does not match status type identifier of changed subscription. Client: %@ Status: %@", (uint8_t *)&v10, 0x16u);
      goto LABEL_8;
    }
  }

}

void __75__SKAStatusSubscriptionServiceClient_handleReceivedStatusUpdate_onChannel___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __75__SKAStatusSubscriptionServiceClient_handleReceivedStatusUpdate_onChannel___block_invoke_cold_1();

}

void __75__SKAStatusSubscriptionServiceClient_handleReceivedStatusUpdate_onChannel___block_invoke_27()
{
  NSObject *v0;
  uint8_t v1[16];

  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2188DF000, v0, OS_LOG_TYPE_DEFAULT, "Connected client completed processing of status update.", v1, 2u);
  }

}

- (void)handleReceivedInvitationForChannel:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v4 = a3;
  if (-[SKAStatusSubscriptionServiceClient channelMatchesClientStatusTypeIdentifier:](self, "channelMatchesClientStatusTypeIdentifier:", v4))
  {
    -[SKAStatusSubscriptionServiceClientConnection asynchronousRemoteDaemonDelegateWithErrorHandler:](self->_clientConnection, "asynchronousRemoteDaemonDelegateWithErrorHandler:", &__block_literal_global_29);
    v5 = objc_claimAutoreleasedReturnValue();
    -[SKAStatusSubscriptionServiceClient _subscriptionMetadataForChannel:](self, "_subscriptionMetadataForChannel:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Notifying connected client of received channel invitation.", buf, 2u);
    }

    -[NSObject subscriptionInvitationReceived:completion:](v5, "subscriptionInvitationReceived:completion:", v6, &__block_literal_global_31);
  }
  else
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Connected client does not match invited channel status type.", v8, 2u);
    }
  }

}

void __73__SKAStatusSubscriptionServiceClient_handleReceivedInvitationForChannel___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __73__SKAStatusSubscriptionServiceClient_handleReceivedInvitationForChannel___block_invoke_cold_1();

}

void __73__SKAStatusSubscriptionServiceClient_handleReceivedInvitationForChannel___block_invoke_30()
{
  NSObject *v0;
  uint8_t v1[16];

  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2188DF000, v0, OS_LOG_TYPE_DEFAULT, "Connected client completed processing of channel invitation.", v1, 2u);
  }

}

- (id)_subscriptionMetadataForChannel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isPersonal");
  -[SKAStatusSubscriptionServiceClient _currentStatusForChannel:](self, "_currentStatusForChannel:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAStatusSubscriptionServiceClient _handlesAssociatedWithChannel:](self, "_handlesAssociatedWithChannel:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB10B0]), "initWithSubscriptionIdentifier:statusTypeIdentifier:isPersonalStatusSubscription:currentStatus:ownerHandles:", v5, v6, v7, v8, v9);
  return v10;
}

- (id)_handlesAssociatedWithChannel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "isPersonal") & 1) != 0)
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    v6 = (void *)-[SKADatabaseManaging newBackgroundContext](self->_databaseManager, "newBackgroundContext");
    -[SKADatabaseManaging receivedInvitationsForChannel:databaseContext:](self->_databaseManager, "receivedInvitationsForChannel:databaseContext:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "senderSKHandle", (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

    objc_msgSend(v8, "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_currentStatusForChannel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[2];
  __int16 v23;

  v4 = a3;
  v5 = (void *)-[SKADatabaseManaging newBackgroundContext](self->_databaseManager, "newBackgroundContext");
  -[SKADatabaseManaging existingStatusForChannel:databaseContext:](self->_databaseManager, "existingStatusForChannel:databaseContext:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if ((objc_msgSend(v6, "isExpired") & 1) == 0)
    {
      objc_msgSend(v7, "uniqueIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "datePublished");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dateReceived");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dateCreated");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "rawData");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKAStatusEncryptionManaging decryptStatusPayloadFromStatusEnvelopeData:channel:](self->_encryptionManager, "decryptStatusPayloadFromStatusEnvelopeData:channel:", v21, v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "statusPayload");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "invitation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "skInvitationPayload");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1088]), "initWithStatusPayload:statusUniqueIdentifier:datePublished:dateCreated:dateReceived:invitationPayload:", v15, v19, v12, v13, v20, v17);

      goto LABEL_10;
    }
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 0;
      v9 = "Current status for channel is expired";
      v10 = (uint8_t *)&v23;
LABEL_7:
      _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
  }
  else
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "No existing status for channel";
      v10 = buf;
      goto LABEL_7;
    }
  }

  v11 = 0;
LABEL_10:

  return v11;
}

- (BOOL)channelMatchesClientStatusTypeIdentifier:(id)a3
{
  void *v4;
  SKAStatusSubscriptionServiceClient *v5;
  NSString *v6;
  char v7;

  objc_msgSend(a3, "statusType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self;
  objc_sync_enter(v5);
  v6 = v5->_statusTypeIdenfifier;
  objc_sync_exit(v5);

  if (-[NSString length](v6, "length") || objc_msgSend(v4, "length"))
    v7 = objc_msgSend(v4, "isEqualToString:", v6);
  else
    v7 = 0;

  return v7;
}

- (void)subscriptionServiceClientConnectionWasInterrupted:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  uint8_t v6[16];

  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Beginning release of transient subscription assertions associated with interrupted client", v6, 2u);
  }

  -[SKAStatusSubscriptionManaging releaseAllTransientSubscriptionAssertionsAssociatedWithClient:completion:](self->_subscriptionManager, "releaseAllTransientSubscriptionAssertionsAssociatedWithClient:completion:", self, &__block_literal_global_34);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "subscriptionServiceClientWasInvalidated:", self);

}

void __88__SKAStatusSubscriptionServiceClient_subscriptionServiceClientConnectionWasInterrupted___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __88__SKAStatusSubscriptionServiceClient_subscriptionServiceClientConnectionWasInterrupted___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Success releasing transient subscription assertions associated with interrupted client", v5, 2u);
  }

}

- (void)subscriptionServiceClientConnectionWasInvalidated:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  uint8_t v6[16];

  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Beginning release of transient subscription assertions associated with invalidated client", v6, 2u);
  }

  -[SKAStatusSubscriptionManaging releaseAllTransientSubscriptionAssertionsAssociatedWithClient:completion:](self->_subscriptionManager, "releaseAllTransientSubscriptionAssertionsAssociatedWithClient:completion:", self, &__block_literal_global_35);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "subscriptionServiceClientWasInvalidated:", self);

}

void __88__SKAStatusSubscriptionServiceClient_subscriptionServiceClientConnectionWasInvalidated___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __88__SKAStatusSubscriptionServiceClient_subscriptionServiceClientConnectionWasInvalidated___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Success releasing transient subscription assertions associated with invalidated client", v5, 2u);
  }

}

- (void)subscriptionMetadataForHandle:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, uint64_t);
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  SKAStatusSubscriptionServiceClient *v19;
  id v20;
  void (**v21)(id, _QWORD, uint64_t);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, uint64_t))a5;
  -[SKAStatusSubscriptionServiceClient clientConnection](self, "clientConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "clientIsEntitledForSubscriptionWithStatusTypeIdentifier:", v9);

  if ((v12 & 1) == 0)
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SKAStatusSubscriptionServiceClient subscriptionMetadataForHandle:statusTypeIdentifier:completion:].cold.2();

    +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_missingEntitlmentErrorForStatusTypeIdentifier:", v9);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:](SKAServerBag, "statusEnabledByServerForStatusTypeIdentifier:", v9))
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:].cold.1();

    +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_serverDisabledErrorForStatusTypeIdentifier:", v9);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v13 = (void *)v15;
    v10[2](v10, 0, v15);
    goto LABEL_11;
  }
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __100__SKAStatusSubscriptionServiceClient_subscriptionMetadataForHandle_statusTypeIdentifier_completion___block_invoke;
  v17[3] = &unk_24D976798;
  v21 = v10;
  v18 = v8;
  v19 = self;
  v20 = v9;
  -[SKAStatusSubscriptionServiceClient accountIsStatusKitCapableWithCompletion:](self, "accountIsStatusKitCapableWithCompletion:", v17);

  v13 = v21;
LABEL_11:

}

void __100__SKAStatusSubscriptionServiceClient_subscriptionMetadataForHandle_statusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(a1 + 32);
      v16 = 138412290;
      v17 = v6;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Retrieving subscription information for handle: %@", (uint8_t *)&v16, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "databaseManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "newBackgroundContext");

    objc_msgSend(*(id *)(a1 + 40), "databaseManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "existingChannelForHandle:statusTypeIdentifier:databaseContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 40), "_subscriptionMetadataForChannel:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 32);
        v16 = 138412546;
        v17 = v11;
        v18 = 2112;
        v19 = v13;
        _os_log_impl(&dword_2188DF000, v12, OS_LOG_TYPE_DEFAULT, "Found subscription metadata: %@ for handle %@", (uint8_t *)&v16, 0x16u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(void **)(a1 + 32);
        v16 = 138412290;
        v17 = v15;
        _os_log_impl(&dword_2188DF000, v14, OS_LOG_TYPE_DEFAULT, "Subscription information not found for handle: %@", (uint8_t *)&v16, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAStatusSubscriptionServiceClient _accountNotCapableError](SKAStatusSubscriptionServiceClient, "_accountNotCapableError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)allSubscriptionMetadatasForStatusTypeIdentifier:(id)a3 includingPersonalSubscription:(BOOL)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, uint64_t);
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  SKAStatusSubscriptionServiceClient *v18;
  void (**v19)(id, _QWORD, uint64_t);
  BOOL v20;

  v8 = a3;
  v9 = (void (**)(id, _QWORD, uint64_t))a5;
  -[SKAStatusSubscriptionServiceClient clientConnection](self, "clientConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "clientIsEntitledForSubscriptionWithStatusTypeIdentifier:", v8);

  if ((v11 & 1) == 0)
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SKAStatusSubscriptionServiceClient subscriptionMetadataForHandle:statusTypeIdentifier:completion:].cold.2();

    +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_missingEntitlmentErrorForStatusTypeIdentifier:", v8);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:](SKAServerBag, "statusEnabledByServerForStatusTypeIdentifier:", v8))
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:].cold.1();

    +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_serverDisabledErrorForStatusTypeIdentifier:", v8);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v12 = (void *)v14;
    v9[2](v9, 0, v14);
    goto LABEL_11;
  }
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __127__SKAStatusSubscriptionServiceClient_allSubscriptionMetadatasForStatusTypeIdentifier_includingPersonalSubscription_completion___block_invoke;
  v16[3] = &unk_24D976A18;
  v19 = v9;
  v17 = v8;
  v18 = self;
  v20 = a4;
  -[SKAStatusSubscriptionServiceClient accountIsStatusKitCapableWithCompletion:](self, "accountIsStatusKitCapableWithCompletion:", v16);

  v12 = v19;
LABEL_11:

}

void __127__SKAStatusSubscriptionServiceClient_allSubscriptionMetadatasForStatusTypeIdentifier_includingPersonalSubscription_completion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v27 = v6;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Retrieving all subscription information for statusTypeIdentifier: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "databaseManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "newBackgroundContext");

    objc_msgSend(*(id *)(a1 + 40), "databaseManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allExistingChannelsForStatusTypeIdentifier:includingPersonalChannel:databaseContext:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v10, "count");
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      v27 = v12;
      v28 = 2112;
      v29 = v13;
      _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Found %ld channels for status type %@", buf, 0x16u);
    }

    v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v15 = v10;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(a1 + 40), "_subscriptionMetadataForChannel:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v19), (_QWORD)v21);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v17);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAStatusSubscriptionServiceClient _accountNotCapableError](SKAStatusSubscriptionServiceClient, "_accountNotCapableError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)allSubscriptionMetadatasWithActiveAssertionsForStatusTypeIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  SKAStatusSubscriptionServiceClient *v16;
  void (**v17)(id, _QWORD, uint64_t);

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  -[SKAStatusSubscriptionServiceClient clientConnection](self, "clientConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "clientIsEntitledForSubscriptionWithStatusTypeIdentifier:", v6);

  if ((v9 & 1) == 0)
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SKAStatusSubscriptionServiceClient subscriptionMetadataForHandle:statusTypeIdentifier:completion:].cold.2();

    +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_missingEntitlmentErrorForStatusTypeIdentifier:", v6);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:](SKAServerBag, "statusEnabledByServerForStatusTypeIdentifier:", v6))
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:].cold.1();

    +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_serverDisabledErrorForStatusTypeIdentifier:", v6);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v10 = (void *)v12;
    v7[2](v7, 0, v12);
    goto LABEL_11;
  }
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __117__SKAStatusSubscriptionServiceClient_allSubscriptionMetadatasWithActiveAssertionsForStatusTypeIdentifier_completion___block_invoke;
  v14[3] = &unk_24D9767C0;
  v17 = v7;
  v15 = v6;
  v16 = self;
  -[SKAStatusSubscriptionServiceClient accountIsStatusKitCapableWithCompletion:](self, "accountIsStatusKitCapableWithCompletion:", v14);

  v10 = v17;
LABEL_11:

}

void __117__SKAStatusSubscriptionServiceClient_allSubscriptionMetadatasWithActiveAssertionsForStatusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  int8x16_t v10;
  _QWORD v11[4];
  int8x16_t v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Retrieving all active assertions for statusTypeIdentifier: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "subscriptionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __117__SKAStatusSubscriptionServiceClient_allSubscriptionMetadatasWithActiveAssertionsForStatusTypeIdentifier_completion___block_invoke_38;
    v11[3] = &unk_24D976A40;
    v10 = *(int8x16_t *)(a1 + 32);
    v8 = (id)v10.i64[0];
    v12 = vextq_s8(v10, v10, 8uLL);
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v7, "allSubscriptionIdentifiersWithActiveAssertionsForStatusTypeIdentifier:completion:", v8, v11);

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAStatusSubscriptionServiceClient _accountNotCapableError](SKAStatusSubscriptionServiceClient, "_accountNotCapableError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __117__SKAStatusSubscriptionServiceClient_allSubscriptionMetadatasWithActiveAssertionsForStatusTypeIdentifier_completion___block_invoke_38(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "databaseManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "newBackgroundContext");

  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
        objc_msgSend(*(id *)(a1 + 32), "databaseManager", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "existingChannelForSubscriptionIdentifier:databaseContext:", v12, v5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v14, "statusType");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", *(_QWORD *)(a1 + 40));

          if (v16)
          {
            objc_msgSend(*(id *)(a1 + 32), "_subscriptionMetadataForChannel:", v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v17);

          }
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)allSubscriptionMetadatasWithActiveSubscriptionsForStatusTypeIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  SKAStatusSubscriptionServiceClient *v16;
  void (**v17)(id, _QWORD, uint64_t);

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  -[SKAStatusSubscriptionServiceClient clientConnection](self, "clientConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "clientIsEntitledForSubscriptionWithStatusTypeIdentifier:", v6);

  if ((v9 & 1) == 0)
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SKAStatusSubscriptionServiceClient subscriptionMetadataForHandle:statusTypeIdentifier:completion:].cold.2();

    +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_missingEntitlmentErrorForStatusTypeIdentifier:", v6);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:](SKAServerBag, "statusEnabledByServerForStatusTypeIdentifier:", v6))
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:].cold.1();

    +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_serverDisabledErrorForStatusTypeIdentifier:", v6);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v10 = (void *)v12;
    v7[2](v7, 0, v12);
    goto LABEL_11;
  }
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __120__SKAStatusSubscriptionServiceClient_allSubscriptionMetadatasWithActiveSubscriptionsForStatusTypeIdentifier_completion___block_invoke;
  v14[3] = &unk_24D9767C0;
  v17 = v7;
  v15 = v6;
  v16 = self;
  -[SKAStatusSubscriptionServiceClient accountIsStatusKitCapableWithCompletion:](self, "accountIsStatusKitCapableWithCompletion:", v14);

  v10 = v17;
LABEL_11:

}

void __120__SKAStatusSubscriptionServiceClient_allSubscriptionMetadatasWithActiveSubscriptionsForStatusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  int8x16_t v10;
  _QWORD v11[4];
  int8x16_t v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Retrieving all active assertions for statusTypeIdentifier: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "subscriptionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __120__SKAStatusSubscriptionServiceClient_allSubscriptionMetadatasWithActiveSubscriptionsForStatusTypeIdentifier_completion___block_invoke_40;
    v11[3] = &unk_24D976A40;
    v10 = *(int8x16_t *)(a1 + 32);
    v8 = (id)v10.i64[0];
    v12 = vextq_s8(v10, v10, 8uLL);
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v7, "allStatusSubscriptionIdentifiersWithActiveSubscriptionsWithCompletion:", v11);

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAStatusSubscriptionServiceClient _accountNotCapableError](SKAStatusSubscriptionServiceClient, "_accountNotCapableError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __120__SKAStatusSubscriptionServiceClient_allSubscriptionMetadatasWithActiveSubscriptionsForStatusTypeIdentifier_completion___block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "databaseManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "newBackgroundContext");

  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
        objc_msgSend(*(id *)(a1 + 32), "databaseManager", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "existingChannelForSubscriptionIdentifier:databaseContext:", v12, v5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v14, "statusType");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", *(_QWORD *)(a1 + 40));

          if (v16)
          {
            objc_msgSend(*(id *)(a1 + 32), "_subscriptionMetadataForChannel:", v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v17);

          }
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)allStatusSubscriptionsWithPersistentSubscriptionAssertionForApplicationIdentifier:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, uint64_t);
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  SKAStatusSubscriptionServiceClient *v20;
  void (**v21)(id, _QWORD, uint64_t);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, uint64_t))a5;
  -[SKAStatusSubscriptionServiceClient clientConnection](self, "clientConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "clientIsEntitledForSubscriptionWithStatusTypeIdentifier:", v9);

  if ((v12 & 1) == 0)
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SKAStatusSubscriptionServiceClient subscriptionMetadataForHandle:statusTypeIdentifier:completion:].cold.2();

    +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_missingEntitlmentErrorForStatusTypeIdentifier:", v9);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:](SKAServerBag, "statusEnabledByServerForStatusTypeIdentifier:", v9))
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:].cold.1();

    +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_serverDisabledErrorForStatusTypeIdentifier:", v9);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v13 = (void *)v15;
    v10[2](v10, 0, v15);
    goto LABEL_11;
  }
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __152__SKAStatusSubscriptionServiceClient_allStatusSubscriptionsWithPersistentSubscriptionAssertionForApplicationIdentifier_statusTypeIdentifier_completion___block_invoke;
  v17[3] = &unk_24D976798;
  v21 = v10;
  v18 = v9;
  v19 = v8;
  v20 = self;
  -[SKAStatusSubscriptionServiceClient accountIsStatusKitCapableWithCompletion:](self, "accountIsStatusKitCapableWithCompletion:", v17);

  v13 = v21;
LABEL_11:

}

void __152__SKAStatusSubscriptionServiceClient_allStatusSubscriptionsWithPersistentSubscriptionAssertionForApplicationIdentifier_statusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v30 = v6;
      v31 = 2112;
      v32 = v7;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Retrieving all subscription assertions for statusTypeIdentifier: %@ applicationIdentifier: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 48), "databaseManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "newBackgroundContext");

    objc_msgSend(*(id *)(a1 + 48), "databaseManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "existingSubscriptionAssertionsForStatusTypeIdentifier:applicationIdentifier:databaseContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v11, "count");
      *(_DWORD *)buf = 134217984;
      v30 = v13;
      _os_log_impl(&dword_2188DF000, v12, OS_LOG_TYPE_DEFAULT, "Found %ld subscription assertions", buf, 0xCu);
    }

    v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v15 = v11;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v19), "channelIdentifier", (_QWORD)v24);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "databaseManager");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "existingChannelForSubscriptionIdentifier:databaseContext:", v20, v9);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 48), "_subscriptionMetadataForChannel:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v23);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v17);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAStatusSubscriptionServiceClient _accountNotCapableError](SKAStatusSubscriptionServiceClient, "_accountNotCapableError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)subscriptionMetadataForPersonalSubscriptionWithStatusTypeIdentifier:(id)a3 completion:(id)a4
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
  -[SKAStatusSubscriptionServiceClient clientConnection](self, "clientConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "clientIsEntitledForSubscriptionWithStatusTypeIdentifier:", v6);

  if ((v9 & 1) == 0)
  {
    +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_missingEntitlmentErrorForStatusTypeIdentifier:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v12 = (void *)v10;
    v7[2](v7, 0, v10);

    goto LABEL_9;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:](SKAServerBag, "statusEnabledByServerForStatusTypeIdentifier:", v6))
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:].cold.1();

    +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_serverDisabledErrorForStatusTypeIdentifier:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __117__SKAStatusSubscriptionServiceClient_subscriptionMetadataForPersonalSubscriptionWithStatusTypeIdentifier_completion___block_invoke;
  v13[3] = &unk_24D9767C0;
  v15 = v7;
  v13[4] = self;
  v14 = v6;
  -[SKAStatusSubscriptionServiceClient accountIsStatusKitCapableWithCompletion:](self, "accountIsStatusKitCapableWithCompletion:", v13);

LABEL_9:
}

void __117__SKAStatusSubscriptionServiceClient_subscriptionMetadataForPersonalSubscriptionWithStatusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
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
      objc_msgSend(*(id *)(a1 + 32), "_subscriptionMetadataForChannel:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v7;
        _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, "Found subscription metadata for personal channel: %@", (uint8_t *)&v12, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(void **)(a1 + 40);
        v12 = 138412290;
        v13 = v11;
        _os_log_impl(&dword_2188DF000, v10, OS_LOG_TYPE_DEFAULT, "Subscription information not found for personal channel with statusTypeIdentifier: %@", (uint8_t *)&v12, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAStatusSubscriptionServiceClient _accountNotCapableError](SKAStatusSubscriptionServiceClient, "_accountNotCapableError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

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
  -[SKAStatusSubscriptionServiceClient clientConnection](self, "clientConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "clientIsEntitledForSubscriptionWithStatusTypeIdentifier:", v6);

  if ((v9 & 1) == 0)
  {
    +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_missingEntitlmentErrorForStatusTypeIdentifier:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v12 = (void *)v10;
    v7[2](v7, v10);

    goto LABEL_9;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:](SKAServerBag, "statusEnabledByServerForStatusTypeIdentifier:", v6))
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:].cold.1();

    +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_serverDisabledErrorForStatusTypeIdentifier:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __102__SKAStatusSubscriptionServiceClient_registerForDelegateCallbacksWithStatusTypeIdentifier_completion___block_invoke;
  v13[3] = &unk_24D9767C0;
  v15 = v7;
  v13[4] = self;
  v14 = v6;
  -[SKAStatusSubscriptionServiceClient accountIsStatusKitCapableWithCompletion:](self, "accountIsStatusKitCapableWithCompletion:", v13);

LABEL_9:
}

void __102__SKAStatusSubscriptionServiceClient_registerForDelegateCallbacksWithStatusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
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
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v4;

    objc_sync_exit(v3);
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
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
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAStatusSubscriptionServiceClient _accountNotCapableError](SKAStatusSubscriptionServiceClient, "_accountNotCapableError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

- (void)retainTransientSubscriptionAssertionForSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  char v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v24 = v8;
    v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Received request to retain transient subscription assertion for subscriptionIdentifier: %@ statusTypeIdentifier: %@", buf, 0x16u);
  }

  -[SKAStatusSubscriptionServiceClient clientConnection](self, "clientConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "clientIsEntitledForSubscriptionWithStatusTypeIdentifier:", v9);

  if ((v13 & 1) != 0)
  {
    if (+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:](SKAServerBag, "statusEnabledByServerForStatusTypeIdentifier:", v9))
    {
      if (!self->_trafficModeEnabled)
      {
        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3221225472;
        v19[2] = __132__SKAStatusSubscriptionServiceClient_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke;
        v19[3] = &unk_24D976798;
        v22 = v10;
        v19[4] = self;
        v20 = v8;
        v21 = v9;
        -[SKAStatusSubscriptionServiceClient accountIsStatusKitCapableWithCompletion:](self, "accountIsStatusKitCapableWithCompletion:", v19);

        v18 = v22;
        goto LABEL_16;
      }
      +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SKAStatusSubscriptionServiceClient retainTransientSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:completion:].cold.1();

      +[SKAStatusSubscriptionServiceClient _inTrafficError](SKAStatusSubscriptionServiceClient, "_inTrafficError");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:].cold.1();

      +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_serverDisabledErrorForStatusTypeIdentifier:", v9);
      v15 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SKAStatusSubscriptionServiceClient retainTransientSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:completion:].cold.3();

    +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_missingEntitlmentErrorForStatusTypeIdentifier:", v9);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v15;
  (*((void (**)(id, uint64_t))v10 + 2))(v10, v15);
LABEL_16:

}

void __132__SKAStatusSubscriptionServiceClient_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "databaseManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "newBackgroundContext");

    if ((objc_msgSend(*(id *)(a1 + 32), "_validateChannelIsKnownForSubscriptionIdentifier:statusTypeIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v4) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "subscriptionManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v8 = *(_QWORD *)(a1 + 32);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __132__SKAStatusSubscriptionServiceClient_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke_41;
      v12[3] = &unk_24D976A68;
      v13 = v6;
      v14 = *(id *)(a1 + 48);
      v15 = *(id *)(a1 + 56);
      objc_msgSend(v5, "retainTransientSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:client:completion:", v13, v7, v8, v12);

      v9 = v13;
    }
    else
    {
      +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __132__SKAStatusSubscriptionServiceClient_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke_cold_1();

      +[SKAStatusSubscriptionServiceClient _subscriptionIdentifierNotFoundError:](SKAStatusSubscriptionServiceClient, "_subscriptionIdentifierNotFoundError:", *(_QWORD *)(a1 + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAStatusSubscriptionServiceClient _accountNotCapableError](SKAStatusSubscriptionServiceClient, "_accountNotCapableError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __132__SKAStatusSubscriptionServiceClient_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke_41(_QWORD *a1, void *a2)
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
  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __132__SKAStatusSubscriptionServiceClient_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke_41_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = a1[5];
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Successfully retained transient subscription assertion for subscriptionIdentifier: %@ statusTypeIdentifier: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)releaseTransientSubscriptionAssertionForSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  void (**v21)(id, uint64_t);
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Received request to release transient subscription assertion for subscriptionIdentifier: %@ statusTypeIdentifier: %@", buf, 0x16u);
  }

  -[SKAStatusSubscriptionServiceClient clientConnection](self, "clientConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "clientIsEntitledForSubscriptionWithStatusTypeIdentifier:", v9);

  if ((v13 & 1) == 0)
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SKAStatusSubscriptionServiceClient releaseTransientSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:completion:].cold.2();

    +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_missingEntitlmentErrorForStatusTypeIdentifier:", v9);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:](SKAServerBag, "statusEnabledByServerForStatusTypeIdentifier:", v9))
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:].cold.1();

    +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_serverDisabledErrorForStatusTypeIdentifier:", v9);
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v14 = (void *)v16;
    v10[2](v10, v16);
    goto LABEL_13;
  }
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __133__SKAStatusSubscriptionServiceClient_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke;
  v18[3] = &unk_24D976798;
  v21 = v10;
  v18[4] = self;
  v19 = v8;
  v20 = v9;
  -[SKAStatusSubscriptionServiceClient accountIsStatusKitCapableWithCompletion:](self, "accountIsStatusKitCapableWithCompletion:", v18);

  v14 = v21;
LABEL_13:

}

void __133__SKAStatusSubscriptionServiceClient_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "databaseManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "newBackgroundContext");

    if ((objc_msgSend(*(id *)(a1 + 32), "_validateChannelIsKnownForSubscriptionIdentifier:statusTypeIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v4) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "subscriptionManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v8 = *(_QWORD *)(a1 + 32);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __133__SKAStatusSubscriptionServiceClient_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke_42;
      v12[3] = &unk_24D976A68;
      v13 = v6;
      v14 = *(id *)(a1 + 48);
      v15 = *(id *)(a1 + 56);
      objc_msgSend(v5, "releaseTransientSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:client:completion:", v13, v7, v8, v12);

      v9 = v13;
    }
    else
    {
      +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __132__SKAStatusSubscriptionServiceClient_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke_cold_1();

      +[SKAStatusSubscriptionServiceClient _subscriptionIdentifierNotFoundError:](SKAStatusSubscriptionServiceClient, "_subscriptionIdentifierNotFoundError:", *(_QWORD *)(a1 + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAStatusSubscriptionServiceClient _accountNotCapableError](SKAStatusSubscriptionServiceClient, "_accountNotCapableError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __133__SKAStatusSubscriptionServiceClient_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke_42(_QWORD *a1, void *a2)
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
  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __133__SKAStatusSubscriptionServiceClient_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke_42_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = a1[5];
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Successfully released transient subscription assertion for subscriptionIdentifier: %@ statusTypeIdentifier: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)retainPersistentSubscriptionAssertionForSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 applicationIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  char v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v28 = v10;
    v29 = 2112;
    v30 = v11;
    _os_log_impl(&dword_2188DF000, v14, OS_LOG_TYPE_DEFAULT, "Received request to retain persistent subscription assertion for subscriptionIdentifier: %@ statusTypeIdentifier: %@", buf, 0x16u);
  }

  -[SKAStatusSubscriptionServiceClient clientConnection](self, "clientConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "clientIsEntitledForSubscriptionWithStatusTypeIdentifier:", v11);

  if ((v16 & 1) != 0)
  {
    if (+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:](SKAServerBag, "statusEnabledByServerForStatusTypeIdentifier:", v11))
    {
      if (!self->_trafficModeEnabled)
      {
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __155__SKAStatusSubscriptionServiceClient_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke;
        v22[3] = &unk_24D9767E8;
        v26 = v13;
        v22[4] = self;
        v23 = v10;
        v24 = v11;
        v25 = v12;
        -[SKAStatusSubscriptionServiceClient accountIsStatusKitCapableWithCompletion:](self, "accountIsStatusKitCapableWithCompletion:", v22);

        v21 = v26;
        goto LABEL_16;
      }
      +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[SKAStatusSubscriptionServiceClient retainTransientSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:completion:].cold.1();

      +[SKAStatusSubscriptionServiceClient _inTrafficError](SKAStatusSubscriptionServiceClient, "_inTrafficError");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:].cold.1();

      +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_serverDisabledErrorForStatusTypeIdentifier:", v11);
      v18 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[SKAStatusSubscriptionServiceClient retainPersistentSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:applicationIdentifier:completion:].cold.3();

    +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_missingEntitlmentErrorForStatusTypeIdentifier:", v11);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v18;
  (*((void (**)(id, uint64_t))v13 + 2))(v13, v18);
LABEL_16:

}

void __155__SKAStatusSubscriptionServiceClient_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "databaseManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "newBackgroundContext");

    if ((objc_msgSend(*(id *)(a1 + 32), "_validateChannelIsKnownForSubscriptionIdentifier:statusTypeIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v4) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "subscriptionManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v8 = *(_QWORD *)(a1 + 56);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __155__SKAStatusSubscriptionServiceClient_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_43;
      v12[3] = &unk_24D976A68;
      v13 = v6;
      v14 = *(id *)(a1 + 48);
      v15 = *(id *)(a1 + 64);
      objc_msgSend(v5, "retainPersistentSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:applicationIdentifier:completion:", v13, v7, v8, v12);

      v9 = v13;
    }
    else
    {
      +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __132__SKAStatusSubscriptionServiceClient_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke_cold_1();

      +[SKAStatusSubscriptionServiceClient _subscriptionIdentifierNotFoundError:](SKAStatusSubscriptionServiceClient, "_subscriptionIdentifierNotFoundError:", *(_QWORD *)(a1 + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }

  }
  else
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAStatusSubscriptionServiceClient _accountNotCapableError](SKAStatusSubscriptionServiceClient, "_accountNotCapableError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __155__SKAStatusSubscriptionServiceClient_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_43(_QWORD *a1, void *a2)
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
  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __155__SKAStatusSubscriptionServiceClient_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_43_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = a1[5];
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Successfully retained persistent subscription assertion for subscriptionIdentifier: %@ statusTypeIdentifier: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)releasePersistentSubscriptionAssertionForSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 applicationIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t);
  NSObject *v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  void (**v25)(id, uint64_t);
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t))a6;
  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v27 = v10;
    v28 = 2112;
    v29 = v11;
    _os_log_impl(&dword_2188DF000, v14, OS_LOG_TYPE_DEFAULT, "Received request to release persistent subscription assertion for subscriptionIdentifier: %@ statusTypeIdentifier: %@", buf, 0x16u);
  }

  -[SKAStatusSubscriptionServiceClient clientConnection](self, "clientConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "clientIsEntitledForSubscriptionWithStatusTypeIdentifier:", v11);

  if ((v16 & 1) == 0)
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[SKAStatusSubscriptionServiceClient releasePersistentSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:applicationIdentifier:completion:].cold.2();

    +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_missingEntitlmentErrorForStatusTypeIdentifier:", v11);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:](SKAServerBag, "statusEnabledByServerForStatusTypeIdentifier:", v11))
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:].cold.1();

    +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_serverDisabledErrorForStatusTypeIdentifier:", v11);
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v17 = (void *)v19;
    v13[2](v13, v19);
    goto LABEL_13;
  }
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __156__SKAStatusSubscriptionServiceClient_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke;
  v21[3] = &unk_24D9767E8;
  v25 = v13;
  v21[4] = self;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  -[SKAStatusSubscriptionServiceClient accountIsStatusKitCapableWithCompletion:](self, "accountIsStatusKitCapableWithCompletion:", v21);

  v17 = v25;
LABEL_13:

}

void __156__SKAStatusSubscriptionServiceClient_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "databaseManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "newBackgroundContext");

    if ((objc_msgSend(*(id *)(a1 + 32), "_validateChannelIsKnownForSubscriptionIdentifier:statusTypeIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v4) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "subscriptionManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v8 = *(_QWORD *)(a1 + 56);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __156__SKAStatusSubscriptionServiceClient_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_44;
      v12[3] = &unk_24D976A68;
      v13 = v6;
      v14 = *(id *)(a1 + 48);
      v15 = *(id *)(a1 + 64);
      objc_msgSend(v5, "releasePersistentSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:applicationIdentifier:completion:", v13, v7, v8, v12);

      v9 = v13;
    }
    else
    {
      +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __132__SKAStatusSubscriptionServiceClient_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke_cold_1();

      +[SKAStatusSubscriptionServiceClient _subscriptionIdentifierNotFoundError:](SKAStatusSubscriptionServiceClient, "_subscriptionIdentifierNotFoundError:", *(_QWORD *)(a1 + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }

  }
  else
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAStatusSubscriptionServiceClient _accountNotCapableError](SKAStatusSubscriptionServiceClient, "_accountNotCapableError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __156__SKAStatusSubscriptionServiceClient_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_44(_QWORD *a1, void *a2)
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
  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __156__SKAStatusSubscriptionServiceClient_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_44_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = a1[5];
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Successfully released persistent subscription assertion for subscriptionIdentifier: %@ statusTypeIdentifier: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)deleteSubscriptionWithIdentifier:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  void *v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  void (**v19)(id, uint64_t);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  -[SKAStatusSubscriptionServiceClient clientConnection](self, "clientConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "clientIsEntitledForSubscriptionWithStatusTypeIdentifier:", v9);

  if ((v12 & 1) == 0)
  {
    +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_missingEntitlmentErrorForStatusTypeIdentifier:", v9);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v15 = (void *)v13;
    v10[2](v10, v13);

    goto LABEL_9;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:](SKAServerBag, "statusEnabledByServerForStatusTypeIdentifier:", v9))
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:].cold.1();

    +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_serverDisabledErrorForStatusTypeIdentifier:", v9);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __103__SKAStatusSubscriptionServiceClient_deleteSubscriptionWithIdentifier_statusTypeIdentifier_completion___block_invoke;
  v16[3] = &unk_24D976798;
  v19 = v10;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  -[SKAStatusSubscriptionServiceClient accountIsStatusKitCapableWithCompletion:](self, "accountIsStatusKitCapableWithCompletion:", v16);

LABEL_9:
}

void __103__SKAStatusSubscriptionServiceClient_deleteSubscriptionWithIdentifier_statusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "databaseManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v3, "newBackgroundContext");

    if ((objc_msgSend(*(id *)(a1 + 32), "_validateChannelIsKnownForSubscriptionIdentifier:statusTypeIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v7) & 1) != 0)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      +[SKAStatusSubscriptionServiceClient _subscriptionIdentifierNotFoundError:](SKAStatusSubscriptionServiceClient, "_subscriptionIdentifierNotFoundError:", *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    }
  }
  else
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAStatusSubscriptionServiceClient _accountNotCapableError](SKAStatusSubscriptionServiceClient, "_accountNotCapableError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

- (void)subscriptionValidationTokensForHandle:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, uint64_t);
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  void (**v21)(id, _QWORD, uint64_t);
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, uint64_t))a5;
  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "handleString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v12;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Received request for subscription and encryption validation token for handle \"%@\" statusTypeIdentifier: %@", buf, 0x16u);

  }
  -[SKAStatusSubscriptionServiceClient clientConnection](self, "clientConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "clientIsEntitledForSubscriptionWithStatusTypeIdentifier:", v9);

  if ((v14 & 1) == 0)
  {
    +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_missingEntitlmentErrorForStatusTypeIdentifier:", v9);
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v15 = (void *)v16;
    v10[2](v10, 0, v16);
    goto LABEL_11;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:](SKAServerBag, "statusEnabledByServerForStatusTypeIdentifier:", v9))
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:].cold.1();

    +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_serverDisabledErrorForStatusTypeIdentifier:", v9);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __108__SKAStatusSubscriptionServiceClient_subscriptionValidationTokensForHandle_statusTypeIdentifier_completion___block_invoke;
  v18[3] = &unk_24D976798;
  v21 = v10;
  v18[4] = self;
  v19 = v8;
  v20 = v9;
  -[SKAStatusSubscriptionServiceClient accountIsStatusKitCapableWithCompletion:](self, "accountIsStatusKitCapableWithCompletion:", v18);

  v15 = v21;
LABEL_11:

}

void __108__SKAStatusSubscriptionServiceClient_subscriptionValidationTokensForHandle_statusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "databaseManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "newBackgroundContext");

    objc_msgSend(*(id *)(a1 + 32), "databaseManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "existingChannelForHandle:statusTypeIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        objc_msgSend(*(id *)(a1 + 40), "handleString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412546;
        v20 = v6;
        v21 = 2112;
        v22 = v9;
        _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Found channel %@ matching handle: %@", (uint8_t *)&v19, 0x16u);

      }
      objc_msgSend(v6, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");
      if (v11 >= 4)
        v12 = 4;
      else
        v12 = v11;
      objc_msgSend(v10, "substringToIndex:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "encryptionManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "encryptionValidationTokenForChannel:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB10B8]), "initWithSubscriptionValidationToken:encryptionValidationToken:", v13, v15);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    }
    else
    {
      if (v8)
      {
        objc_msgSend(*(id *)(a1 + 40), "handleString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412290;
        v20 = v18;
        _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Did not find a channel matching handle: \"%@\". Returning empty string to indicate no match.", (uint8_t *)&v19, 0xCu);

      }
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB10B8]), "initWithSubscriptionValidationToken:encryptionValidationToken:", &stru_24D9798C8, &stru_24D9798C8);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAStatusSubscriptionServiceClient _accountNotCapableError](SKAStatusSubscriptionServiceClient, "_accountNotCapableError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens:(id)a3 fromSender:(id)a4 statusTypeIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, uint64_t);
  NSObject *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  void (**v25)(id, _QWORD, uint64_t);
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, uint64_t))a6;
  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "handleString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v27 = v10;
    v28 = 2112;
    v29 = v15;
    v30 = 2112;
    v31 = v12;
    _os_log_impl(&dword_2188DF000, v14, OS_LOG_TYPE_DEFAULT, "Received request for validate token \"%@\" from handle \"%@\" for statusTypeIdentifier: %@", buf, 0x20u);

  }
  -[SKAStatusSubscriptionServiceClient clientConnection](self, "clientConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "clientIsEntitledForSubscriptionWithStatusTypeIdentifier:", v12);

  if ((v17 & 1) == 0)
  {
    +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_missingEntitlmentErrorForStatusTypeIdentifier:", v12);
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v18 = (void *)v19;
    v13[2](v13, 0, v19);
    goto LABEL_11;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:](SKAServerBag, "statusEnabledByServerForStatusTypeIdentifier:", v12))
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:].cold.1();

    +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:](SKAStatusSubscriptionServiceClient, "_serverDisabledErrorForStatusTypeIdentifier:", v12);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __151__SKAStatusSubscriptionServiceClient_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_statusTypeIdentifier_completion___block_invoke;
  v21[3] = &unk_24D9767E8;
  v25 = v13;
  v21[4] = self;
  v22 = v12;
  v23 = v10;
  v24 = v11;
  -[SKAStatusSubscriptionServiceClient accountIsStatusKitCapableWithCompletion:](self, "accountIsStatusKitCapableWithCompletion:", v21);

  v18 = v25;
LABEL_11:

}

void __151__SKAStatusSubscriptionServiceClient_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_statusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void (*v18)(void);
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
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
      +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138412290;
        v21 = v6;
        _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Validating tokens against personal channel: %@", (uint8_t *)&v20, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 48), "subscriptionValidationToken");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(*(id *)(a1 + 32), "validatePersonalChannel:matchesSubscriptionValidationToken:fromSender:", v6, v8, *(_QWORD *)(a1 + 56));
      +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v9 == 1)
      {
        if (v11)
        {
          v20 = 138412290;
          v21 = v6;
          _os_log_impl(&dword_2188DF000, v10, OS_LOG_TYPE_DEFAULT, "Validating tokens against personal channel: %@", (uint8_t *)&v20, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 48), "encryptionValidationToken");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "validatePersonalChannel:matchesEncryptionValidationToken:fromSender:", v6, v12, *(_QWORD *)(a1 + 56));
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

      }
      else
      {
        if (v11)
        {
          LOWORD(v20) = 0;
          _os_log_impl(&dword_2188DF000, v10, OS_LOG_TYPE_DEFAULT, "Received invalid validity for subscription channel validation. Not validating encryption token.", (uint8_t *)&v20, 2u);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "subscriptionValidationToken");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length");

      +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          __151__SKAStatusSubscriptionServiceClient_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_statusTypeIdentifier_completion___block_invoke_cold_1(a1, v17);

        v18 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
      }
      else
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 56), "handleString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138412290;
          v21 = v19;
          _os_log_impl(&dword_2188DF000, v17, OS_LOG_TYPE_DEFAULT, "Sender \"%@\" asked us to verify that we do not have a personal channel, and they are correct", (uint8_t *)&v20, 0xCu);

        }
        v18 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
      }
      v18();
    }

  }
  else
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();

    +[SKAStatusSubscriptionServiceClient _accountNotCapableError](SKAStatusSubscriptionServiceClient, "_accountNotCapableError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

- (int64_t)validatePersonalChannel:(id)a3 matchesSubscriptionValidationToken:(id)a4 fromSender:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int64_t v15;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412546;
    v19 = v7;
    v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_2188DF000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to validate subscription channel token \"%@\" against personal channel with identifier \"%@\", (uint8_t *)&v18, 0x16u);
  }

  if (!objc_msgSend(v7, "length"))
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SKAStatusSubscriptionServiceClient validatePersonalChannel:matchesSubscriptionValidationToken:fromSender:].cold.1();
    goto LABEL_12;
  }
  v11 = objc_msgSend(v9, "hasPrefix:", v7);
  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "handleString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v17;
      v20 = 2112;
      v21 = v7;
      v22 = 2112;
      v23 = v9;
      _os_log_error_impl(&dword_2188DF000, v13, OS_LOG_TYPE_ERROR, "Sender \"%@\" has supplied a subscription channel validation token \"%@\", that does not match our current personal channel identifier \"%@\". Informing client that validation token is invalid, allowing them to re-invite the sender, if appropriate.", (uint8_t *)&v18, 0x20u);

    }
LABEL_12:
    v15 = 2;
    goto LABEL_13;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "handleString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412290;
    v19 = v14;
    _os_log_impl(&dword_2188DF000, v13, OS_LOG_TYPE_DEFAULT, "Sender \"%@\" has supplied a valid subscription channel validation token", (uint8_t *)&v18, 0xCu);

  }
  v15 = 1;
LABEL_13:

  return v15;
}

- (int64_t)validatePersonalChannel:(id)a3 matchesEncryptionValidationToken:(id)a4 fromSender:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  int64_t v18;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412546;
    v22 = v9;
    v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Attempting to validate encryption token \"%@\" against personal channel %@", (uint8_t *)&v21, 0x16u);
  }

  -[SKAStatusSubscriptionServiceClient encryptionManager](self, "encryptionManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encryptionValidationTokenForChannel:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v13, "length"))
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SKAStatusSubscriptionServiceClient validatePersonalChannel:matchesEncryptionValidationToken:fromSender:].cold.1();
    goto LABEL_13;
  }
  if (!v9)
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SKAStatusSubscriptionServiceClient validatePersonalChannel:matchesEncryptionValidationToken:fromSender:].cold.2();
    goto LABEL_13;
  }
  if (!objc_msgSend(v9, "length"))
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SKAStatusSubscriptionServiceClient validatePersonalChannel:matchesEncryptionValidationToken:fromSender:].cold.3();
    goto LABEL_18;
  }
  v14 = objc_msgSend(v13, "hasPrefix:", v9);
  +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "handleString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412802;
      v22 = v20;
      v23 = 2112;
      v24 = v9;
      v25 = 2112;
      v26 = v13;
      _os_log_error_impl(&dword_2188DF000, v16, OS_LOG_TYPE_ERROR, "Sender \"%@\" has supplied an encryptoin validation token \"%@\", that does not match our expected value \"%@\". Informing client that validation token is invalid, allowing them to re-invite the sender, if appropriate.", (uint8_t *)&v21, 0x20u);

    }
LABEL_18:
    v18 = 2;
    goto LABEL_19;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "handleString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412802;
    v22 = v17;
    v23 = 2112;
    v24 = v9;
    v25 = 2112;
    v26 = v13;
    _os_log_impl(&dword_2188DF000, v16, OS_LOG_TYPE_DEFAULT, "Sender \"%@\" has supplied a valid encryption validation token. Provided: \"%@\" Expected: \"%@\", (uint8_t *)&v21, 0x20u);

  }
LABEL_13:
  v18 = 1;
LABEL_19:

  return v18;
}

- (BOOL)_validateChannelIsKnownForSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 databaseContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  BOOL v14;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[SKADatabaseManaging existingChannelForSubscriptionIdentifier:databaseContext:](self->_databaseManager, "existingChannelForSubscriptionIdentifier:databaseContext:", v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "statusType");
    v12 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject length](v12, "length") && -[NSObject isEqualToString:](v12, "isEqualToString:", v9))
    {
      +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412546;
        v17 = v8;
        v18 = 2112;
        v19 = v9;
        _os_log_impl(&dword_2188DF000, v13, OS_LOG_TYPE_DEFAULT, "Validated subscriptionIdentifier: %@ statusTypeIdentifier: %@", (uint8_t *)&v16, 0x16u);
      }
      v14 = 1;
    }
    else
    {
      +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[SKAStatusSubscriptionServiceClient _validateChannelIsKnownForSubscriptionIdentifier:statusTypeIdentifier:databaseContext:].cold.2();
      v14 = 0;
    }

  }
  else
  {
    +[SKAStatusSubscriptionServiceClient logger](SKAStatusSubscriptionServiceClient, "logger");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SKAStatusSubscriptionServiceClient _validateChannelIsKnownForSubscriptionIdentifier:statusTypeIdentifier:databaseContext:].cold.1();
    v14 = 0;
  }

  return v14;
}

- (void)accountIsStatusKitCapableWithCompletion:(id)a3
{
  id v4;
  SKAStatusSubscriptionServiceClient *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[SKAStatusSubscriptionServiceClient databaseManager](v5, "databaseManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __78__SKAStatusSubscriptionServiceClient_accountIsStatusKitCapableWithCompletion___block_invoke;
  v8[3] = &unk_24D9762E8;
  v8[4] = v5;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "deviceToDeviceEncryptedDatabaseCapableWithCompletion:", v8);

  objc_sync_exit(v5);
}

void __78__SKAStatusSubscriptionServiceClient_accountIsStatusKitCapableWithCompletion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __78__SKAStatusSubscriptionServiceClient_accountIsStatusKitCapableWithCompletion___block_invoke_2;
  v5[3] = &unk_24D9768B0;
  v6 = *(id *)(a1 + 40);
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __78__SKAStatusSubscriptionServiceClient_accountIsStatusKitCapableWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (NSString)statusTypeIdenfifier
{
  return self->_statusTypeIdenfifier;
}

- (SKAStatusSubscriptionServiceClientConnection)clientConnection
{
  return self->_clientConnection;
}

- (void)setClientConnection:(id)a3
{
  objc_storeStrong((id *)&self->_clientConnection, a3);
}

- (SKAStatusSubscriptionServiceClientDelegate)delegate
{
  return (SKAStatusSubscriptionServiceClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (SKAStatusEncryptionManaging)encryptionManager
{
  return self->_encryptionManager;
}

- (void)setEncryptionManager:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionManager, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)trafficModeEnabled
{
  return self->_trafficModeEnabled;
}

- (void)setTrafficModeEnabled:(BOOL)a3
{
  self->_trafficModeEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_encryptionManager, 0);
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_statusTypeIdenfifier, 0);
}

void __76__SKAStatusSubscriptionServiceClient_handleRemoteDatabaseChangeForChannels___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "XPC Error notifying of remote database changes. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __75__SKAStatusSubscriptionServiceClient_handleReceivedStatusUpdate_onChannel___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "XPC Error notifying client of status update. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __73__SKAStatusSubscriptionServiceClient_handleReceivedInvitationForChannel___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "XPC Error notifying of received invitation. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __88__SKAStatusSubscriptionServiceClient_subscriptionServiceClientConnectionWasInterrupted___block_invoke_cold_1()
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

void __88__SKAStatusSubscriptionServiceClient_subscriptionServiceClientConnectionWasInvalidated___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error releasing transient subscription assertions associated with invalidated client: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)subscriptionMetadataForHandle:statusTypeIdentifier:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Client is not entitled to access subscription information for status type: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)retainTransientSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "We're in traffic mode -- rejecting subscription request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)retainTransientSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Client is not entitled to retain transient subscription assertion for status type: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __132__SKAStatusSubscriptionServiceClient_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v0, v1, "No subscription was found matching subscriptionIdentifier: %@ statusTypeIdentifier: %@");
  OUTLINED_FUNCTION_3();
}

void __132__SKAStatusSubscriptionServiceClient_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke_41_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9(&dword_2188DF000, v0, v1, "Error retaining transient subscription assertion for subscriptionIdentifier: %@ statusTypeIdentifier: %@ error: %@");
  OUTLINED_FUNCTION_14();
}

- (void)releaseTransientSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Client is not entitled to release transient subscription assertion for status type: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __133__SKAStatusSubscriptionServiceClient_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke_42_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9(&dword_2188DF000, v0, v1, "Error releasing transient subscription assertion for subscriptionIdentifier: %@ statusTypeIdentifier: %@ error: %@");
  OUTLINED_FUNCTION_14();
}

- (void)retainPersistentSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:applicationIdentifier:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Client is not entitled to retain persistent subscription assertion for status type: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __155__SKAStatusSubscriptionServiceClient_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_43_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9(&dword_2188DF000, v0, v1, "Error retaining persistent subscription assertion for subscriptionIdentifier: %@ statusTypeIdentifier: %@ error: %@");
  OUTLINED_FUNCTION_14();
}

- (void)releasePersistentSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:applicationIdentifier:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Client is not entitled to release persistent subscription assertion for status type: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __156__SKAStatusSubscriptionServiceClient_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_44_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9(&dword_2188DF000, v0, v1, "Error releasing persistent subscription assertion for subscriptionIdentifier: %@ statusTypeIdentifier: %@ error: %@");
  OUTLINED_FUNCTION_14();
}

void __151__SKAStatusSubscriptionServiceClient_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_statusTypeIdentifier_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 56), "handleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_2188DF000, a2, OS_LOG_TYPE_ERROR, "Sender \"%@\" asked us to verify a channel validation token, but we don't have a personal channel, this device may be out of sync, returning unknown", v4, 0xCu);

  OUTLINED_FUNCTION_14();
}

- (void)validatePersonalChannel:matchesSubscriptionValidationToken:fromSender:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_16();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "handleString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_5_0(&dword_2188DF000, v0, v3, "Sender \"%@\" asked us to verify that we do not have a personal channel, but we do have channel %@. Informing client that validation token is invalid, allowing them to re-invite the sender, if appropriate.", v4);

  OUTLINED_FUNCTION_12();
}

- (void)validatePersonalChannel:matchesEncryptionValidationToken:fromSender:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_16();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "handleString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_5_0(&dword_2188DF000, v0, v3, "Sender \"%@\" provided encryption validation token \"%@\", but we do not have a local value to validate against. Returning valid.", v4);

  OUTLINED_FUNCTION_12();
}

- (void)validatePersonalChannel:matchesEncryptionValidationToken:fromSender:.cold.2()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_16();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "handleString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_5_0(&dword_2188DF000, v0, v3, "Sender \"%@\" provided an nil encryption validation token, but we expected \"%@\". For backward compatibility, we assume nil means they are on an older OS and we should not fail validation. Returning valid.", v4);

  OUTLINED_FUNCTION_12();
}

- (void)validatePersonalChannel:matchesEncryptionValidationToken:fromSender:.cold.3()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_16();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "handleString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_5_0(&dword_2188DF000, v0, v3, "Sender \"%@\" provided an empty encryption validation token, but we expected \"%@\". Informing client that validation token is invalid, allowing them to re-invite the sender, if appropriate.", v4);

  OUTLINED_FUNCTION_12();
}

- (void)_validateChannelIsKnownForSubscriptionIdentifier:statusTypeIdentifier:databaseContext:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v0, v1, "Failed to validate subscriptionIdentifier: %@ statusTypeIdentifier: %@");
  OUTLINED_FUNCTION_3();
}

- (void)_validateChannelIsKnownForSubscriptionIdentifier:statusTypeIdentifier:databaseContext:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_6(&dword_2188DF000, v0, v1, "Failed to validate. subscriptionIdentifier: %@ does not match statusTypeIdentifier: %@");
  OUTLINED_FUNCTION_3();
}

@end
