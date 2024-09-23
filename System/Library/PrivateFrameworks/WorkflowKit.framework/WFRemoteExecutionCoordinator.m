@implementation WFRemoteExecutionCoordinator

- (id)initAndAllowRunRequests:(BOOL)a3
{
  WFRemoteExecutionCoordinator *v4;
  WFRemoteExecutionCoordinator *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  NSMutableArray *v10;
  NSMutableArray *activeSessions;
  uint64_t v12;
  NSMapTable *completionsForSessions;
  id v14;
  WFRemoteExecutionCoordinator *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)WFRemoteExecutionCoordinator;
  v4 = -[WFRemoteExecutionCoordinator init](&v17, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_allowRunRequests = a3;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INITIATED, 0);
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = dispatch_queue_create("com.apple.shortcuts.remote-execution", v7);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    activeSessions = v5->_activeSessions;
    v5->_activeSessions = v10;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v12 = objc_claimAutoreleasedReturnValue();
    completionsForSessions = v5->_completionsForSessions;
    v5->_completionsForSessions = (NSMapTable *)v12;

    v14 = -[WFRemoteExecutionCoordinator service](v5, "service");
    v15 = v5;

  }
  return v5;
}

- (void)cancelAllSessions
{
  id v3;

  -[WFRemoteExecutionCoordinator activeSessions](self, "activeSessions");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WFRemoteExecutionCoordinator cancelSessions:](self, "cancelSessions:", v3);

}

- (void)cancelPendingFileTransfers
{
  id v3;

  -[WFRemoteExecutionCoordinator sessionsOfClass:](self, "sessionsOfClass:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WFRemoteExecutionCoordinator cancelSessions:](self, "cancelSessions:", v3);

}

- (void)cancelSessions:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  __int128 v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v20;
    *(_QWORD *)&v6 = 136315650;
    v17 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
        -[WFRemoteExecutionCoordinator completionsForSessions](self, "completionsForSessions", v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObjectForKey:", v10);

        -[WFRemoteExecutionCoordinator service](self, "service");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "idsIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0;
        v14 = objc_msgSend(v12, "cancelIdentifier:error:", v13, &v18);
        v15 = v18;

        if ((v14 & 1) == 0)
        {
          getWFRemoteExecutionLogObject();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v17;
            v24 = "-[WFRemoteExecutionCoordinator cancelSessions:]";
            v25 = 2114;
            v26 = v10;
            v27 = 2114;
            v28 = v15;
            _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_INFO, "%s Cancelling session: %{public}@ failed with error: %{public}@", buf, 0x20u);
          }

        }
        objc_msgSend(v10, "finish");

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v7);
  }

}

- (void)cancelRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRemoteExecutionCoordinator sessionFromRequestIdentifier:](self, "sessionFromRequestIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v7[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionCoordinator cancelSessions:](self, "cancelSessions:", v6);

    }
  }
}

- (id)sessionFromRequestIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFRemoteExecutionCoordinator activeSessions](self, "activeSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "request", (_QWORD)v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v4);

        if (v16)
        {
          v17 = v13;

          v10 = v17;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)sendRunRequest:(id)a3 userInterface:(id)a4 parameterInputProvider:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  WFRemoteExecutionOutgoingRunRequestSession *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  WFRemoteExecutionOutgoingRunRequestSession *v19;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [WFRemoteExecutionOutgoingRunRequestSession alloc];
  -[WFRemoteExecutionCoordinator service](self, "service");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[WFRemoteExecutionOutgoingRunRequestSession initWithService:request:userInterface:parameterInputProvider:coordinator:completion:](v14, "initWithService:request:userInterface:parameterInputProvider:coordinator:completion:", v15, v13, v12, v11, self, v10);

  -[WFRemoteExecutionSession setDelegate:](v19, "setDelegate:", self);
  -[WFRemoteExecutionCoordinator pairedDevice](self, "pairedDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteExecutionCoordinator defaultIDSOptions](self, "defaultIDSOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteExecutionOutgoingRunRequestSession sendToDestinations:options:](v19, "sendToDestinations:options:", v16, v17);

  -[WFRemoteExecutionCoordinator activeSessions](self, "activeSessions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v19);

}

- (void)handleRunRequestResponse:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = a7;
  getWFRemoteExecutionLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[WFRemoteExecutionCoordinator handleRunRequestResponse:service:account:fromID:context:]";
    _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_INFO, "%s Received incoming run request response", buf, 0xCu);
  }

  if (-[WFRemoteExecutionCoordinator messageCameFromPairedDevice:](self, "messageCameFromPairedDevice:", v11))
  {
    objc_msgSend(v12, "serverReceivedTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[WFRemoteExecutionCoordinator shouldDropMessageDueToStaleness:](self, "shouldDropMessageDueToStaleness:", v14);

    if (!v15)
    {
      -[WFRemoteExecutionCoordinator sessionsOfClass:](self, "sessionsOfClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      getWFRemoteExecutionLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "-[WFRemoteExecutionCoordinator handleRunRequestResponse:service:account:fromID:context:]";
        v31 = 2114;
        v32 = v16;
        _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_INFO, "%s Has active sessions: %{public}@", buf, 0x16u);
      }

      if (!objc_msgSend(v16, "count"))
      {
        getWFRemoteExecutionLogObject();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v30 = "-[WFRemoteExecutionCoordinator handleRunRequestResponse:service:account:fromID:context:]";
          _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_INFO, "%s No matching session, dropping message", buf, 0xCu);
        }

      }
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v19 = v16;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v25;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v25 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v23++), "handleIncomingProtobuf:", v10, (_QWORD)v24);
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v21);
      }

    }
  }

}

- (void)handleAlertRequest:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  BOOL v16;
  WFRemoteExecutionIncomingAlertSession *v17;
  void *v18;
  WFRemoteExecutionIncomingAlertSession *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a7;
  v12 = a6;
  getWFRemoteExecutionLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v24 = 136315138;
    v25 = "-[WFRemoteExecutionCoordinator handleAlertRequest:service:account:fromID:context:]";
    _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_INFO, "%s Received incoming alert to display", (uint8_t *)&v24, 0xCu);
  }

  v14 = -[WFRemoteExecutionCoordinator messageCameFromPairedDevice:](self, "messageCameFromPairedDevice:", v12);
  if (v14)
  {
    objc_msgSend(v11, "serverReceivedTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[WFRemoteExecutionCoordinator shouldDropMessageDueToStaleness:](self, "shouldDropMessageDueToStaleness:", v15);

    if (!v16)
    {
      v17 = [WFRemoteExecutionIncomingAlertSession alloc];
      -[WFRemoteExecutionCoordinator service](self, "service");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[WFRemoteExecutionSession initWithService:](v17, "initWithService:", v18);

      -[WFRemoteExecutionSession setDelegate:](v19, "setDelegate:", self);
      -[WFRemoteExecutionCoordinator sessionsOfClass:](self, "sessionsOfClass:", objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionCoordinator pairedDevice](self, "pairedDevice");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionCoordinator defaultIDSOptions](self, "defaultIDSOptions");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionIncomingAlertSession handleIncomingProtobuf:currentlyActiveSessions:responseDestinations:options:](v19, "handleIncomingProtobuf:currentlyActiveSessions:responseDestinations:options:", v10, v20, v21, v22);

      -[WFRemoteExecutionCoordinator activeSessions](self, "activeSessions");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v19);

    }
  }

}

- (BOOL)sendStopRequest:(id)a3 error:(id *)a4
{
  id v6;
  WFRemoteExecutionOutgoingStopSession *v7;
  void *v8;
  WFRemoteExecutionOutgoingStopSession *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = [WFRemoteExecutionOutgoingStopSession alloc];
  -[WFRemoteExecutionCoordinator service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WFRemoteExecutionOutgoingStopSession initWithService:request:](v7, "initWithService:request:", v8, v6);

  -[WFRemoteExecutionSession setDelegate:](v9, "setDelegate:", self);
  -[WFRemoteExecutionCoordinator pairedDevice](self, "pairedDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteExecutionCoordinator defaultIDSOptions](self, "defaultIDSOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[WFRemoteExecutionOutgoingStopSession sendToDestinations:options:error:](v9, "sendToDestinations:options:error:", v10, v11, a4);

  -[WFRemoteExecutionCoordinator activeSessions](self, "activeSessions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v9);

  return (char)a4;
}

- (void)handleAskWhenRunRequest:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  BOOL v16;
  WFRemoteExecutionIncomingAskEachTimeSession *v17;
  void *v18;
  WFRemoteExecutionIncomingAskEachTimeSession *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a7;
  v12 = a6;
  getWFRemoteExecutionLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v24 = 136315138;
    v25 = "-[WFRemoteExecutionCoordinator handleAskWhenRunRequest:service:account:fromID:context:]";
    _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_INFO, "%s Received incoming ask each time to display", (uint8_t *)&v24, 0xCu);
  }

  v14 = -[WFRemoteExecutionCoordinator messageCameFromPairedDevice:](self, "messageCameFromPairedDevice:", v12);
  if (v14)
  {
    objc_msgSend(v11, "serverReceivedTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[WFRemoteExecutionCoordinator shouldDropMessageDueToStaleness:](self, "shouldDropMessageDueToStaleness:", v15);

    if (!v16)
    {
      v17 = [WFRemoteExecutionIncomingAskEachTimeSession alloc];
      -[WFRemoteExecutionCoordinator service](self, "service");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[WFRemoteExecutionSession initWithService:](v17, "initWithService:", v18);

      -[WFRemoteExecutionSession setDelegate:](v19, "setDelegate:", self);
      -[WFRemoteExecutionCoordinator sessionsOfClass:](self, "sessionsOfClass:", objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionCoordinator pairedDevice](self, "pairedDevice");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionCoordinator defaultIDSOptions](self, "defaultIDSOptions");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionIncomingAskEachTimeSession handleIncomingProtobuf:currentlyActiveSessions:responseDestinations:responseOptions:](v19, "handleIncomingProtobuf:currentlyActiveSessions:responseDestinations:responseOptions:", v10, v20, v21, v22);

      -[WFRemoteExecutionCoordinator activeSessions](self, "activeSessions");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v19);

    }
  }

}

- (void)sendAceCommandDictionary:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  WFRemoteExecutionOutgoingAceCommandSession *v8;
  void *v9;
  WFRemoteExecutionOutgoingAceCommandSession *v10;
  void *v11;
  void *v12;
  void *v13;
  WFRemoteExecutionAceCommandRequest *v14;

  v6 = a4;
  v7 = a3;
  v14 = -[WFRemoteExecutionAceCommandRequest initWithAceCommandDictionary:]([WFRemoteExecutionAceCommandRequest alloc], "initWithAceCommandDictionary:", v7);

  v8 = [WFRemoteExecutionOutgoingAceCommandSession alloc];
  -[WFRemoteExecutionCoordinator service](self, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WFRemoteExecutionOutgoingAceCommandSession initWithService:request:completion:](v8, "initWithService:request:completion:", v9, v14, v6);

  -[WFRemoteExecutionSession setDelegate:](v10, "setDelegate:", self);
  -[WFRemoteExecutionCoordinator pairedDevice](self, "pairedDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteExecutionCoordinator defaultIDSOptions](self, "defaultIDSOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteExecutionOutgoingAceCommandSession sendToDestinations:options:](v10, "sendToDestinations:options:", v11, v12);

  -[WFRemoteExecutionCoordinator activeSessions](self, "activeSessions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v10);

}

- (void)handleAceCommandResponse:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = a7;
  getWFRemoteExecutionLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[WFRemoteExecutionCoordinator handleAceCommandResponse:service:account:fromID:context:]";
    _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_INFO, "%s Received incoming ace command response", buf, 0xCu);
  }

  if (-[WFRemoteExecutionCoordinator messageCameFromPairedDevice:](self, "messageCameFromPairedDevice:", v11))
  {
    objc_msgSend(v12, "serverReceivedTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[WFRemoteExecutionCoordinator shouldDropMessageDueToStaleness:](self, "shouldDropMessageDueToStaleness:", v14);

    if (!v15)
    {
      -[WFRemoteExecutionCoordinator sessionsOfClass:](self, "sessionsOfClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      getWFRemoteExecutionLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "-[WFRemoteExecutionCoordinator handleAceCommandResponse:service:account:fromID:context:]";
        v31 = 2114;
        v32 = v16;
        _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_INFO, "%s Has active sessions: %{public}@", buf, 0x16u);
      }

      if (!objc_msgSend(v16, "count"))
      {
        getWFRemoteExecutionLogObject();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v30 = "-[WFRemoteExecutionCoordinator handleAceCommandResponse:service:account:fromID:context:]";
          _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_INFO, "%s No matching session, dropping message", buf, 0xCu);
        }

      }
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v19 = v16;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v25;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v25 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v23++), "handleIncomingProtobuf:", v10, (_QWORD)v24);
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v21);
      }

    }
  }

}

- (void)sendDialogRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  WFRemoteExecutionOutgoingDialogRequestSession *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  WFRemoteExecutionOutgoingDialogRequestSession *v13;

  v6 = a4;
  v7 = a3;
  v8 = [WFRemoteExecutionOutgoingDialogRequestSession alloc];
  -[WFRemoteExecutionCoordinator service](self, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[WFRemoteExecutionOutgoingDialogRequestSession initWithService:request:completion:](v8, "initWithService:request:completion:", v9, v7, v6);

  -[WFRemoteExecutionSession setDelegate:](v13, "setDelegate:", self);
  -[WFRemoteExecutionCoordinator pairedDevice](self, "pairedDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteExecutionCoordinator defaultIDSOptions](self, "defaultIDSOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteExecutionOutgoingDialogRequestSession sendToDestinations:options:](v13, "sendToDestinations:options:", v10, v11);

  -[WFRemoteExecutionCoordinator activeSessions](self, "activeSessions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

}

- (void)handleDialogRequestResponse:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = a7;
  getWFRemoteExecutionLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[WFRemoteExecutionCoordinator handleDialogRequestResponse:service:account:fromID:context:]";
    _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_INFO, "%s Received incoming dialog request response", buf, 0xCu);
  }

  if (-[WFRemoteExecutionCoordinator messageCameFromPairedDevice:](self, "messageCameFromPairedDevice:", v11))
  {
    objc_msgSend(v12, "serverReceivedTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[WFRemoteExecutionCoordinator shouldDropMessageDueToStaleness:](self, "shouldDropMessageDueToStaleness:", v14);

    if (!v15)
    {
      -[WFRemoteExecutionCoordinator sessionsOfClass:](self, "sessionsOfClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      getWFRemoteExecutionLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "-[WFRemoteExecutionCoordinator handleDialogRequestResponse:service:account:fromID:context:]";
        v31 = 2114;
        v32 = v16;
        _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_INFO, "%s Has active sessions: %{public}@", buf, 0x16u);
      }

      if (!objc_msgSend(v16, "count"))
      {
        getWFRemoteExecutionLogObject();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v30 = "-[WFRemoteExecutionCoordinator handleDialogRequestResponse:service:account:fromID:context:]";
          _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_INFO, "%s No matching session, dropping message", buf, 0xCu);
        }

      }
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v19 = v16;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v25;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v25 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v23++), "handleIncomingProtobuf:", v10, (_QWORD)v24);
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v21);
      }

    }
  }

}

- (void)handleRunRequest:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  WFRemoteExecutionRunRequest *v16;
  void *v17;
  WFRemoteExecutionRunRequest *v18;
  void *v19;
  WFRemoteExecutionIncomingRunRequestSession *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  WFRemoteExecutionIncomingRunRequestSession *v30;
  void *v31;
  WFRemoteExecutionIncomingRunRequestSession *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  WFRemoteExecutionRunRequest *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = a7;
  getWFRemoteExecutionLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[WFRemoteExecutionCoordinator handleRunRequest:service:account:fromID:context:]";
    _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_INFO, "%s Received incoming run request", buf, 0xCu);
  }

  if (-[WFRemoteExecutionCoordinator messageCameFromPairedDevice:](self, "messageCameFromPairedDevice:", v11))
  {
    objc_msgSend(v12, "serverReceivedTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[WFRemoteExecutionCoordinator shouldDropMessageDueToStaleness:](self, "shouldDropMessageDueToStaleness:", v14);

    if (!v15)
    {
      v38 = v12;
      v16 = [WFRemoteExecutionRunRequest alloc];
      objc_msgSend(v10, "data");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[WFRemoteExecutionRunRequest initWithData:error:](v16, "initWithData:error:", v17, 0);

      v39 = v18;
      if (v18)
      {
        -[WFRemoteExecutionRequest identifier](v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          v36 = v11;
          v37 = v10;
          -[WFRemoteExecutionCoordinator sessionsOfClass:](self, "sessionsOfClass:", objc_opt_class());
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v20 = (WFRemoteExecutionIncomingRunRequestSession *)(id)objc_claimAutoreleasedReturnValue();
          v21 = -[WFRemoteExecutionIncomingRunRequestSession countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v41;
            while (2)
            {
              for (i = 0; i != v22; ++i)
              {
                if (*(_QWORD *)v41 != v23)
                  objc_enumerationMutation(v20);
                v25 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
                objc_msgSend(v25, "request", v36, v37);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "identifier");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFRemoteExecutionRequest identifier](v39, "identifier");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v27, "isEqualToString:", v28);

                if (v29)
                {
                  getWFRemoteExecutionLogObject();
                  v35 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    v45 = "-[WFRemoteExecutionCoordinator handleRunRequest:service:account:fromID:context:]";
                    v46 = 2112;
                    v47 = v25;
                    _os_log_impl(&dword_1C15B3000, v35, OS_LOG_TYPE_DEFAULT, "%s Received an incoming run request, however, there is an existing session with the same identifier (%@). Dropping this request.", buf, 0x16u);
                  }

                  v32 = v20;
                  v11 = v36;
                  v10 = v37;
                  goto LABEL_20;
                }
              }
              v22 = -[WFRemoteExecutionIncomingRunRequestSession countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
              if (v22)
                continue;
              break;
            }
          }

          v11 = v36;
          v10 = v37;
        }
      }
      v30 = [WFRemoteExecutionIncomingRunRequestSession alloc];
      -[WFRemoteExecutionCoordinator service](self, "service");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[WFRemoteExecutionSession initWithService:](v30, "initWithService:", v31);

      -[WFRemoteExecutionSession setDelegate:](v32, "setDelegate:", self);
      -[WFRemoteExecutionCoordinator pairedDevice](self, "pairedDevice");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionCoordinator defaultIDSOptions](self, "defaultIDSOptions");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionIncomingRunRequestSession handleIncomingProtobuf:destinations:options:](v32, "handleIncomingProtobuf:destinations:options:", v10, v33, v34);

      -[WFRemoteExecutionCoordinator activeSessions](self, "activeSessions");
      v20 = (WFRemoteExecutionIncomingRunRequestSession *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionIncomingRunRequestSession addObject:](v20, "addObject:", v32);
LABEL_20:
      v12 = v38;

    }
  }

}

- (void)sendRunRequestResponse:(id)a3 completion:(id)a4
{
  id v6;
  WFRemoteExecutionOutgoingRunRequestResponseSession *v7;
  void *v8;
  WFRemoteExecutionOutgoingRunRequestResponseSession *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id aBlock;

  aBlock = a4;
  v6 = a3;
  v7 = [WFRemoteExecutionOutgoingRunRequestResponseSession alloc];
  -[WFRemoteExecutionCoordinator service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WFRemoteExecutionOutgoingRunRequestResponseSession initWithService:responseData:](v7, "initWithService:responseData:", v8, v6);

  -[WFRemoteExecutionSession setDelegate:](v9, "setDelegate:", self);
  -[WFRemoteExecutionCoordinator pairedDevice](self, "pairedDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteExecutionCoordinator defaultIDSOptions](self, "defaultIDSOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteExecutionOutgoingRunRequestResponseSession sendToDestinations:options:](v9, "sendToDestinations:options:", v10, v11);

  -[WFRemoteExecutionCoordinator activeSessions](self, "activeSessions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v9);

  if (aBlock)
  {
    -[WFRemoteExecutionCoordinator completionsForSessions](self, "completionsForSessions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = _Block_copy(aBlock);
    objc_msgSend(v13, "setObject:forKey:", v14, v9);

  }
}

- (void)sendAlertRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  WFRemoteExecutionOutgoingAlertSession *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  WFRemoteExecutionOutgoingAlertSession *v13;

  v6 = a4;
  v7 = a3;
  v8 = [WFRemoteExecutionOutgoingAlertSession alloc];
  -[WFRemoteExecutionCoordinator service](self, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[WFRemoteExecutionOutgoingAlertSession initWithService:request:completion:](v8, "initWithService:request:completion:", v9, v7, v6);

  -[WFRemoteExecutionSession setDelegate:](v13, "setDelegate:", self);
  -[WFRemoteExecutionCoordinator pairedDevice](self, "pairedDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteExecutionCoordinator defaultIDSOptions](self, "defaultIDSOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteExecutionOutgoingAlertSession sendToDestinations:options:](v13, "sendToDestinations:options:", v10, v11);

  -[WFRemoteExecutionCoordinator activeSessions](self, "activeSessions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

}

- (void)handleAlertRequestResponse:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = a7;
  getWFRemoteExecutionLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[WFRemoteExecutionCoordinator handleAlertRequestResponse:service:account:fromID:context:]";
    _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_INFO, "%s Received incoming alert response", buf, 0xCu);
  }

  if (-[WFRemoteExecutionCoordinator messageCameFromPairedDevice:](self, "messageCameFromPairedDevice:", v11))
  {
    objc_msgSend(v12, "serverReceivedTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[WFRemoteExecutionCoordinator shouldDropMessageDueToStaleness:](self, "shouldDropMessageDueToStaleness:", v14);

    if (!v15)
    {
      -[WFRemoteExecutionCoordinator sessionsOfClass:](self, "sessionsOfClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      getWFRemoteExecutionLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v29 = "-[WFRemoteExecutionCoordinator handleAlertRequestResponse:service:account:fromID:context:]";
        v30 = 2114;
        v31 = v16;
        _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_INFO, "%s Has active sessions: %{public}@", buf, 0x16u);
      }

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v18 = v16;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v24;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v24 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v22++), "handleIncomingProtobuf:", v10, (_QWORD)v23);
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v20);
      }

    }
  }

}

- (void)handleStopRequest:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  BOOL v16;
  WFRemoteExecutionIncomingStopSession *v17;
  void *v18;
  WFRemoteExecutionIncomingStopSession *v19;
  void *v20;
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a7;
  v12 = a6;
  getWFRemoteExecutionLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v21 = 136315138;
    v22 = "-[WFRemoteExecutionCoordinator handleStopRequest:service:account:fromID:context:]";
    _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_INFO, "%s Received incoming stop request", (uint8_t *)&v21, 0xCu);
  }

  v14 = -[WFRemoteExecutionCoordinator messageCameFromPairedDevice:](self, "messageCameFromPairedDevice:", v12);
  if (v14)
  {
    objc_msgSend(v11, "serverReceivedTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[WFRemoteExecutionCoordinator shouldDropMessageDueToStaleness:](self, "shouldDropMessageDueToStaleness:", v15);

    if (!v16)
    {
      v17 = [WFRemoteExecutionIncomingStopSession alloc];
      -[WFRemoteExecutionCoordinator service](self, "service");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[WFRemoteExecutionSession initWithService:](v17, "initWithService:", v18);

      -[WFRemoteExecutionCoordinator activeSessions](self, "activeSessions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionIncomingStopSession handleIncomingProtobuf:currentlyActiveSessions:](v19, "handleIncomingProtobuf:currentlyActiveSessions:", v10, v20);

    }
  }

}

- (void)sendAskWhenRunRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  WFRemoteExecutionOutgoingAskEachTimeSession *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  WFRemoteExecutionOutgoingAskEachTimeSession *v13;

  v6 = a4;
  v7 = a3;
  v8 = [WFRemoteExecutionOutgoingAskEachTimeSession alloc];
  -[WFRemoteExecutionCoordinator service](self, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[WFRemoteExecutionOutgoingAskEachTimeSession initWithService:request:completion:](v8, "initWithService:request:completion:", v9, v7, v6);

  -[WFRemoteExecutionSession setDelegate:](v13, "setDelegate:", self);
  -[WFRemoteExecutionCoordinator pairedDevice](self, "pairedDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteExecutionCoordinator defaultIDSOptions](self, "defaultIDSOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteExecutionOutgoingAskEachTimeSession sendToDestinations:options:](v13, "sendToDestinations:options:", v10, v11);

  -[WFRemoteExecutionCoordinator activeSessions](self, "activeSessions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

}

- (void)handleAskWhenRunRequestResponse:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = a7;
  getWFRemoteExecutionLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[WFRemoteExecutionCoordinator handleAskWhenRunRequestResponse:service:account:fromID:context:]";
    _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_INFO, "%s Received incoming ask each time response", buf, 0xCu);
  }

  if (-[WFRemoteExecutionCoordinator messageCameFromPairedDevice:](self, "messageCameFromPairedDevice:", v11))
  {
    objc_msgSend(v12, "serverReceivedTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[WFRemoteExecutionCoordinator shouldDropMessageDueToStaleness:](self, "shouldDropMessageDueToStaleness:", v14);

    if (!v15)
    {
      -[WFRemoteExecutionCoordinator sessionsOfClass:](self, "sessionsOfClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      getWFRemoteExecutionLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v29 = "-[WFRemoteExecutionCoordinator handleAskWhenRunRequestResponse:service:account:fromID:context:]";
        v30 = 2114;
        v31 = v16;
        _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_INFO, "%s Has active sessions: %{public}@", buf, 0x16u);
      }

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v18 = v16;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v24;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v24 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v22++), "handleIncomingProtobuf:", v10, (_QWORD)v23);
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v20);
      }

    }
  }

}

- (void)handleIncomingAceCommand:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  BOOL v16;
  WFRemoteExecutionIncomingAceCommandSession *v17;
  void *v18;
  WFRemoteExecutionIncomingAceCommandSession *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a7;
  v12 = a6;
  getWFRemoteExecutionLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v23 = 136315138;
    v24 = "-[WFRemoteExecutionCoordinator handleIncomingAceCommand:service:account:fromID:context:]";
    _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_INFO, "%s Received incoming ace command", (uint8_t *)&v23, 0xCu);
  }

  v14 = -[WFRemoteExecutionCoordinator messageCameFromPairedDevice:](self, "messageCameFromPairedDevice:", v12);
  if (v14)
  {
    objc_msgSend(v11, "serverReceivedTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[WFRemoteExecutionCoordinator shouldDropMessageDueToStaleness:](self, "shouldDropMessageDueToStaleness:", v15);

    if (!v16)
    {
      v17 = [WFRemoteExecutionIncomingAceCommandSession alloc];
      -[WFRemoteExecutionCoordinator service](self, "service");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[WFRemoteExecutionSession initWithService:](v17, "initWithService:", v18);

      -[WFRemoteExecutionSession setDelegate:](v19, "setDelegate:", self);
      -[WFRemoteExecutionCoordinator pairedDevice](self, "pairedDevice");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionCoordinator defaultIDSOptions](self, "defaultIDSOptions");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionIncomingAceCommandSession handleIncomingProtobuf:destinations:options:](v19, "handleIncomingProtobuf:destinations:options:", v10, v20, v21);

      -[WFRemoteExecutionCoordinator activeSessions](self, "activeSessions");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v19);

    }
  }

}

- (void)handleDialogRequest:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  BOOL v16;
  WFRemoteExecutionIncomingDialogRequestSession *v17;
  void *v18;
  WFRemoteExecutionIncomingDialogRequestSession *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a7;
  v12 = a6;
  getWFRemoteExecutionLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v24 = 136315138;
    v25 = "-[WFRemoteExecutionCoordinator handleDialogRequest:service:account:fromID:context:]";
    _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_INFO, "%s Received incoming dialog request", (uint8_t *)&v24, 0xCu);
  }

  v14 = -[WFRemoteExecutionCoordinator messageCameFromPairedDevice:](self, "messageCameFromPairedDevice:", v12);
  if (v14)
  {
    objc_msgSend(v11, "serverReceivedTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[WFRemoteExecutionCoordinator shouldDropMessageDueToStaleness:](self, "shouldDropMessageDueToStaleness:", v15);

    if (!v16)
    {
      v17 = [WFRemoteExecutionIncomingDialogRequestSession alloc];
      -[WFRemoteExecutionCoordinator service](self, "service");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[WFRemoteExecutionSession initWithService:](v17, "initWithService:", v18);

      -[WFRemoteExecutionSession setDelegate:](v19, "setDelegate:", self);
      -[WFRemoteExecutionCoordinator sessionsOfClass:](self, "sessionsOfClass:", objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionCoordinator pairedDevice](self, "pairedDevice");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionCoordinator defaultIDSOptions](self, "defaultIDSOptions");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionIncomingDialogRequestSession handleIncomingProtobuf:currentlyActiveSessions:destinations:options:](v19, "handleIncomingProtobuf:currentlyActiveSessions:destinations:options:", v10, v20, v21, v22);

      -[WFRemoteExecutionCoordinator activeSessions](self, "activeSessions");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v19);

    }
  }

}

- (void)sendFileAtURL:(id)a3 transferIdentifier:(id)a4 requestIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  WFRemoteExecutionOutgoingFileSession *v13;
  void *v14;
  void *v15;
  void *v16;
  WFRemoteExecutionOutgoingFileSession *v17;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = [WFRemoteExecutionOutgoingFileSession alloc];
  -[WFRemoteExecutionCoordinator service](self, "service");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[WFRemoteExecutionOutgoingFileSession initWithService:fileURL:transferIdentifier:requestIdentifier:](v13, "initWithService:fileURL:transferIdentifier:requestIdentifier:", v14, v12, v11, v10);

  -[WFRemoteExecutionSession setDelegate:](v17, "setDelegate:", self);
  -[WFRemoteExecutionCoordinator pairedDevice](self, "pairedDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteExecutionCoordinator defaultIDSOptions](self, "defaultIDSOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteExecutionOutgoingFileSession sendToDestinations:options:error:](v17, "sendToDestinations:options:error:", v15, v16, a6);

}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  id v54;
  _BYTE v55[128];
  uint8_t v56[128];
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  v13 = a7;
  objc_msgSend(v12, "objectForKey:", CFSTR("transferIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("requestIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  getWFRemoteExecutionLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v58 = "-[WFRemoteExecutionCoordinator service:account:incomingResourceAtURL:metadata:fromID:context:]";
    v59 = 2114;
    v60 = v15;
    v61 = 2114;
    v62 = v14;
    _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_INFO, "%s <%{public}@> Received file with id: %{public}@", buf, 0x20u);
  }

  if (-[WFRemoteExecutionCoordinator messageCameFromPairedDevice:](self, "messageCameFromPairedDevice:", v13))
  {
    v43 = v15;
    objc_msgSend(v11, "lastPathComponent");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D140A0], "proposedSharedTemporaryFileURLForFilename:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URLByDeletingLastPathComponent");
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    v41 = (void *)v18;
    objc_msgSend(v19, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v18, 1, 0, &v54);
    v20 = v54;

    if (v20)
    {
      getWFRemoteExecutionLogObject();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315650;
        v58 = "-[WFRemoteExecutionCoordinator service:account:incomingResourceAtURL:metadata:fromID:context:]";
        v59 = 2114;
        v60 = v41;
        v22 = v41;
        v61 = 2114;
        v62 = v20;
        _os_log_impl(&dword_1C15B3000, v21, OS_LOG_TYPE_FAULT, "%s Unable to create directory at URL: %{public}@ for incoming file. error: %{public}@", buf, 0x20u);
LABEL_26:

        goto LABEL_27;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = 0;
      objc_msgSend(v23, "copyItemAtURL:toURL:error:", v11, v17, &v53);
      v20 = v53;

      if (v20)
      {
        getWFRemoteExecutionLogObject();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v58 = "-[WFRemoteExecutionCoordinator service:account:incomingResourceAtURL:metadata:fromID:context:]";
          v59 = 2114;
          v60 = v20;
          _os_log_impl(&dword_1C15B3000, v21, OS_LOG_TYPE_FAULT, "%s Unable to move incoming file from ids URL to temporary URL with error: %{public}@", buf, 0x16u);
        }
      }
      else
      {
        v44 = v17;
        v24 = v14;
        v25 = v12;
        v39 = v13;
        v40 = v11;
        -[WFRemoteExecutionCoordinator sessionsOfClass:](self, "sessionsOfClass:", objc_opt_class());
        v21 = objc_claimAutoreleasedReturnValue();
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v26 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v50;
          do
          {
            v29 = v21;
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v50 != v28)
                objc_enumerationMutation(v29);
              v31 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
              -[WFRemoteExecutionCoordinator pairedDevice](self, "pairedDevice", v39, v40);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[WFRemoteExecutionCoordinator defaultIDSOptions](self, "defaultIDSOptions");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "handleIncomingFileForRemoteExecutionWithURL:withIdentifier:metadata:destinations:options:", v44, v24, v25, v32, v33);

            }
            v21 = v29;
            v27 = -[NSObject countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
          }
          while (v27);
        }
        -[WFRemoteExecutionCoordinator sessionsOfClass:](self, "sessionsOfClass:", objc_opt_class());
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
        v13 = v39;
        v11 = v40;
        v12 = v25;
        v14 = v24;
        v17 = v44;
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v46;
          do
          {
            for (j = 0; j != v36; ++j)
            {
              if (*(_QWORD *)v46 != v37)
                objc_enumerationMutation(v34);
              objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * j), "handleIncomingFileForRemoteExecutionWithURL:withIdentifier:metadata:", v44, v14, v12, v39, v40);
            }
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
          }
          while (v36);
        }

        v20 = 0;
      }
    }
    v15 = v43;
    v22 = v41;
    goto LABEL_26;
  }
LABEL_27:

}

- (id)unknownRequestMessageWithIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("messageType");
  v7[1] = CFSTR("identifier");
  v8[0] = CFSTR("unknownRequest");
  v8[1] = a3;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  if (objc_msgSend(v9, "type") != 1 && objc_msgSend(v9, "type") != 8)
  {
    objc_msgSend(v9, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    +[WFRemoteExecutionRequest identifierFromData:error:](WFRemoteExecutionRequest, "identifierFromData:error:", v11, &v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v24;

    getWFRemoteExecutionLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "data");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v9, "type");
        *(_DWORD *)buf = 136315650;
        v26 = "-[WFRemoteExecutionCoordinator service:account:incomingUnhandledProtobuf:fromID:context:]";
        v27 = 2114;
        v28 = v16;
        v29 = 1024;
        v30 = v17;
        _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_ERROR, "%s Received unknown request with data: %{public}@, message type: %i", buf, 0x1Cu);

      }
      -[WFRemoteExecutionCoordinator unknownRequestMessageWithIdentifier:](self, "unknownRequestMessageWithIdentifier:", v12);
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionCoordinator service](self, "service");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionCoordinator defaultIDSOptions](self, "defaultIDSOptions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      v21 = objc_msgSend(v19, "sendMessage:toDestinations:priority:options:identifier:error:", v15, v18, 300, v20, 0, &v23);

      if ((v21 & 1) == 0)
      {
        getWFRemoteExecutionLogObject();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v26 = "-[WFRemoteExecutionCoordinator service:account:incomingUnhandledProtobuf:fromID:context:]";
          _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_FAULT, "%s Received unknown request but failed to send the unknown identifier back to the originating device", buf, 0xCu);
        }

      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[WFRemoteExecutionCoordinator service:account:incomingUnhandledProtobuf:fromID:context:]";
      v27 = 2114;
      v28 = v13;
      _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_FAULT, "%s Received unknown request but failed to read the identifier from it. %{public}@", buf, 0x16u);
    }

  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  void *v8;
  id v9;

  v9 = a5;
  objc_msgSend(v9, "objectForKey:", CFSTR("messageType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("unknownRequest")))
    -[WFRemoteExecutionCoordinator handleUnknownRequestMessage:](self, "handleUnknownRequestMessage:", v9);

}

- (id)unknownRequestError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0CB2D50];
  WFLocalizedString(CFSTR("While running your shortcut remotely, we encountered an unknown request. Please update your device."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("WFRemoteExecutionCoordinatorErrorDomain"), 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)handleUnknownRequestMessage:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteExecutionCoordinator sessionFromRequestIdentifier:](self, "sessionFromRequestIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  getWFRemoteExecutionLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315394;
    v11 = "-[WFRemoteExecutionCoordinator handleUnknownRequestMessage:]";
    v12 = 2112;
    v13 = (id)objc_opt_class();
    v8 = v13;
    _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_ERROR, "%s Remote device did not understand request of class: %@", (uint8_t *)&v10, 0x16u);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[WFRemoteExecutionCoordinator unknownRequestError](self, "unknownRequestError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishWithError:", v9);

  }
}

- (id)sessionsOfClass:(Class)a3
{
  void *v4;
  void *v5;

  -[WFRemoteExecutionCoordinator activeSessions](self, "activeSessions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsMatchingClass:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)sessionDidFinish:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD);
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFRemoteExecutionLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = 136315394;
    v11 = "-[WFRemoteExecutionCoordinator sessionDidFinish:]";
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_INFO, "%s %{public}@", (uint8_t *)&v10, 0x16u);
  }

  -[WFRemoteExecutionCoordinator activeSessions](self, "activeSessions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

  -[WFRemoteExecutionCoordinator completionsForSessions](self, "completionsForSessions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v4);
  v8 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

  -[WFRemoteExecutionCoordinator completionsForSessions](self, "completionsForSessions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectForKey:", v4);

  if (v8)
    v8[2](v8);

}

- (void)finishSessionWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFRemoteExecutionCoordinator activeSessions](self, "activeSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "request", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqualToString:", v15);

        if (v16)
        {
          v17 = v12;
          if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(v17, "finishWithError:", 0);

          }
          else
          {

            objc_msgSend(v17, "finish");
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

}

- (BOOL)messageCameFromPairedDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFRemoteExecutionCoordinator service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceForFromID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isLocallyPaired") && (objc_msgSend(v6, "isActive") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    getWFRemoteExecutionLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 136315138;
      v11 = "-[WFRemoteExecutionCoordinator messageCameFromPairedDevice:]";
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_INFO, "%s Dropping message as it did not come from a paired device", (uint8_t *)&v10, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (BOOL)shouldDropMessageDueToStaleness:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (shouldDropMessageDueToStaleness__onceToken != -1)
    dispatch_once(&shouldDropMessageDueToStaleness__onceToken, &__block_literal_global_154);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)shouldDropMessageDueToStaleness__calendar, "components:fromDate:toDate:options:", 64, v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "minute");
  if (v6 >= 2)
  {
    getWFRemoteExecutionLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 136315650;
      v10 = "-[WFRemoteExecutionCoordinator shouldDropMessageDueToStaleness:]";
      v11 = 2114;
      v12 = v3;
      v13 = 2114;
      v14 = v4;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_INFO, "%s Dropping message because it was sent more than one minute ago. server received message at %{public}@, it is currently: %{public}@", (uint8_t *)&v9, 0x20u);
    }

  }
  return v6 > 1;
}

- (BOOL)hasPairedDevice
{
  void *v2;
  BOOL v3;

  -[WFRemoteExecutionCoordinator pairedDevice](self, "pairedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)pairedDevice
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[WFRemoteExecutionCoordinator service](self, "service", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "isLocallyPaired") && objc_msgSend(v9, "isActive"))
        {
          v10 = (void *)MEMORY[0x1E0C99E60];
          v11 = (void *)IDSCopyIDForDevice();
          objc_msgSend(v10, "setWithObject:", v11);
          v12 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)pairedDeviceModelIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[WFRemoteExecutionCoordinator service](self, "service", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reverseObjectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "isLocallyPaired") && (objc_msgSend(v8, "isActive") & 1) != 0)
        {
          objc_msgSend(v8, "modelIdentifier");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
      }
      v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

  return (NSString *)v5;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL4 v8;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  int v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint8_t v39[128];
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  _BOOL4 v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v8 = a6;
  v48 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a7;
  getWFRemoteExecutionLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v41 = "-[WFRemoteExecutionCoordinator service:account:identifier:didSendWithSuccess:error:]";
    v42 = 2114;
    v43 = v10;
    v44 = 1024;
    v45 = v8;
    v46 = 2114;
    v47 = v11;
    _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_INFO, "%s <%{public}@> Sent with success: %i, %{public}@", buf, 0x26u);
  }

  if (v8)
  {
    -[WFRemoteExecutionCoordinator sessionsOfClass:](self, "sessionsOfClass:", objc_opt_class());
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v31 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v18, "idsIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v10, "isEqualToString:", v19);

          if (v20)
            objc_msgSend(v18, "fileSentWithSuccess:error:", 1, v11);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v15);
    }
  }
  else
  {
    -[WFRemoteExecutionCoordinator activeSessions](self, "activeSessions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v13 = v22;
    v23 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v35 != v25)
            objc_enumerationMutation(v13);
          v27 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
          objc_msgSend(v27, "idsIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isEqualToString:", v10);

          if (v29)
            objc_msgSend(v27, "finishWithError:", v11);
        }
        v24 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v24);
    }

  }
}

- (id)defaultIDSOptions
{
  uint64_t v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D341C8];
  v4[0] = *MEMORY[0x1E0D34020];
  v4[1] = v2;
  v5[0] = MEMORY[0x1E0C9AAB0];
  v5[1] = &unk_1E7B8B248;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)mapSelectorsForIncomingProtobuf
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[WFRemoteExecutionCoordinator service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProtobufAction:forIncomingRequestsOfType:", sel_handleRunRequestResponse_service_account_fromID_context_, 2);

  -[WFRemoteExecutionCoordinator service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProtobufAction:forIncomingRequestsOfType:", sel_handleAlertRequest_service_account_fromID_context_, 3);

  -[WFRemoteExecutionCoordinator service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProtobufAction:forIncomingRequestsOfType:", sel_handleAlertRequestResponse_service_account_fromID_context_, 4);

  -[WFRemoteExecutionCoordinator service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProtobufAction:forIncomingRequestsOfType:", sel_handleAskWhenRunRequest_service_account_fromID_context_, 5);

  -[WFRemoteExecutionCoordinator service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProtobufAction:forIncomingRequestsOfType:", sel_handleAskWhenRunRequestResponse_service_account_fromID_context_, 6);

  -[WFRemoteExecutionCoordinator service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProtobufAction:forIncomingRequestsOfType:", sel_handleAceCommandResponse_service_account_fromID_context_, 9);

  -[WFRemoteExecutionCoordinator service](self, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setProtobufAction:forIncomingRequestsOfType:", sel_handleStopRequest_service_account_fromID_context_, 7);

  -[WFRemoteExecutionCoordinator service](self, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProtobufAction:forIncomingRequestsOfType:", sel_handleDialogRequest_service_account_fromID_context_, 10);

  -[WFRemoteExecutionCoordinator service](self, "service");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProtobufAction:forIncomingRequestsOfType:", sel_handleDialogRequestResponse_service_account_fromID_context_, 11);

  if (-[WFRemoteExecutionCoordinator allowRunRequests](self, "allowRunRequests"))
  {
    getWFRemoteExecutionLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v15 = 136315138;
      v16 = "-[WFRemoteExecutionCoordinator mapSelectorsForIncomingProtobuf]";
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_INFO, "%s Started listening for run requests", (uint8_t *)&v15, 0xCu);
    }

    -[WFRemoteExecutionCoordinator service](self, "service");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setProtobufAction:forIncomingRequestsOfType:", sel_handleRunRequest_service_account_fromID_context_, 1);

    -[WFRemoteExecutionCoordinator service](self, "service");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setProtobufAction:forIncomingRequestsOfType:", sel_handleIncomingAceCommand_service_account_fromID_context_, 8);

  }
}

- (IDSService)service
{
  IDSService *service;
  IDSService *v4;
  IDSService *v5;
  IDSService *v6;
  void *v7;
  IDSService *v8;

  service = self->_service;
  if (!service)
  {
    v4 = (IDSService *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", CFSTR("com.apple.private.alloy.shortcuts"));
    v5 = self->_service;
    self->_service = v4;

    if (!self->_service)
    {
      v8 = 0;
      return v8;
    }
    -[WFRemoteExecutionCoordinator mapSelectorsForIncomingProtobuf](self, "mapSelectorsForIncomingProtobuf");
    v6 = self->_service;
    -[WFRemoteExecutionCoordinator queue](self, "queue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSService addDelegate:queue:](v6, "addDelegate:queue:", self, v7);

    service = self->_service;
  }
  v8 = service;
  return v8;
}

- (NSMutableArray)activeSessions
{
  return self->_activeSessions;
}

- (void)setActiveSessions:(id)a3
{
  objc_storeStrong((id *)&self->_activeSessions, a3);
}

- (NSMapTable)completionsForSessions
{
  return self->_completionsForSessions;
}

- (void)setCompletionsForSessions:(id)a3
{
  objc_storeStrong((id *)&self->_completionsForSessions, a3);
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)allowRunRequests
{
  return self->_allowRunRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_completionsForSessions, 0);
  objc_storeStrong((id *)&self->_activeSessions, 0);
}

void __64__WFRemoteExecutionCoordinator_shouldDropMessageDueToStaleness___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)shouldDropMessageDueToStaleness__calendar;
  shouldDropMessageDueToStaleness__calendar = v0;

}

+ (id)sharedCoordinator
{
  if (sharedCoordinator_onceToken != -1)
    dispatch_once(&sharedCoordinator_onceToken, &__block_literal_global_12929);
  return (id)sharedCoordinator_sharedCoordinator;
}

void __49__WFRemoteExecutionCoordinator_sharedCoordinator__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[WFRemoteExecutionCoordinator initAndAllowRunRequests:]([WFRemoteExecutionCoordinator alloc], "initAndAllowRunRequests:", 0);
  v1 = (void *)sharedCoordinator_sharedCoordinator;
  sharedCoordinator_sharedCoordinator = (uint64_t)v0;

}

@end
