@implementation SiriAnalyticsXPCConnectionHandler

void __64__SiriAnalyticsXPCConnectionHandler_publishMessages_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 40), "mapToAnnotatedMessage:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7), (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
  objc_msgSend(WeakRetained, "handler:messagesReceived:", *(_QWORD *)(a1 + 40), v2);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __64__SiriAnalyticsXPCConnectionHandler_publishMessages_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)mapToAnnotatedMessage:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  SiriAnalyticsTimeAnnotatedMessage *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D9A3C8]);
  objc_msgSend(v4, "setAnyEventType:", objc_msgSend(v3, "messageType"));
  objc_msgSend(v3, "messageBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPayload:", v5);

  objc_msgSend(v4, "unwrap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(SiriAnalyticsTimeAnnotatedMessage);
    -[SiriAnalyticsTimeAnnotatedMessage setTimestamp:](v7, "setTimestamp:", objc_msgSend(v3, "timestamp"));
    objc_msgSend(v3, "streamUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriAnalyticsTimeAnnotatedMessage setStreamUUID:](v7, "setStreamUUID:", v8);

    objc_msgSend(v3, "messageUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriAnalyticsTimeAnnotatedMessage setMessageUUID:](v7, "setMessageUUID:", v9);

    -[SiriAnalyticsTimeAnnotatedMessage setMessage:](v7, "setMessage:", v6);
  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v10 = (void *)SiriAnalyticsLogContextXPC;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
    {
      v12 = v10;
      v13 = 136315394;
      v14 = "-[SiriAnalyticsXPCConnectionHandler mapToAnnotatedMessage:]";
      v15 = 2048;
      v16 = objc_msgSend(v3, "messageType");
      _os_log_error_impl(&dword_1A025F000, v12, OS_LOG_TYPE_ERROR, "%s Unable to unwrap anyEventType: %lu", (uint8_t *)&v13, 0x16u);

    }
    v7 = 0;
  }

  return v7;
}

- (void)publishMessages:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *queue;
  _QWORD v12[4];
  id v13;
  SiriAnalyticsXPCConnectionHandler *v14;
  void (**v15)(_QWORD);
  _QWORD aBlock[4];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__SiriAnalyticsXPCConnectionHandler_publishMessages_completion___block_invoke;
  aBlock[3] = &unk_1E4357C20;
  v9 = v7;
  v17 = v9;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(v6, "count"))
  {
    queue = self->_queue;
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __64__SiriAnalyticsXPCConnectionHandler_publishMessages_completion___block_invoke_2;
    v12[3] = &unk_1E4357C48;
    v13 = v6;
    v14 = self;
    v15 = v10;
    dispatch_async(queue, v12);

  }
  else
  {
    v10[2](v10);
  }

}

- (SiriAnalyticsXPCConnectionHandler)initWithConnection:(id)a3 entitlementsKey:(id)a4 queue:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SiriAnalyticsXPCConnectionHandler *v15;
  SiriAnalyticsXPCConnectionHandler *v16;
  SiriAnalyticsXPCConnectionEntitlements *v17;
  void *v18;
  uint64_t v19;
  SiriAnalyticsXPCConnectionEntitlements *entitlements;
  uint64_t v21;
  NSString *connectionApplicationIdentifier;
  __int128 v24;
  __int128 v25;
  objc_super v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)SiriAnalyticsXPCConnectionHandler;
  v15 = -[SiriAnalyticsXPCConnectionHandler init](&v26, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_connection, a3);
    objc_storeStrong((id *)&v16->_queue, a5);
    objc_storeWeak((id *)&v16->_delegate, v14);
    if (v11)
    {
      objc_msgSend(v11, "auditToken");
    }
    else
    {
      v24 = 0u;
      v25 = 0u;
    }
    *(_OWORD *)v16->_auditToken.val = v24;
    *(_OWORD *)&v16->_auditToken.val[4] = v25;
    v17 = [SiriAnalyticsXPCConnectionEntitlements alloc];
    objc_msgSend(v11, "valueForEntitlement:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[SiriAnalyticsXPCConnectionEntitlements initWithEntitlements:](v17, "initWithEntitlements:", v18);
    entitlements = v16->_entitlements;
    v16->_entitlements = (SiriAnalyticsXPCConnectionEntitlements *)v19;

    objc_msgSend(v11, "valueForEntitlement:", CFSTR("application-identifier"));
    v21 = objc_claimAutoreleasedReturnValue();
    connectionApplicationIdentifier = v16->_connectionApplicationIdentifier;
    v16->_connectionApplicationIdentifier = (NSString *)v21;

  }
  return v16;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0[4];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[1].var0;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (SiriAnalyticsXPCConnectionEntitlements)entitlements
{
  return self->_entitlements;
}

- (void)resolveMessages:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *queue;
  _QWORD v12[4];
  id v13;
  SiriAnalyticsXPCConnectionHandler *v14;
  void (**v15)(_QWORD);
  _QWORD aBlock[4];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__SiriAnalyticsXPCConnectionHandler_resolveMessages_completion___block_invoke;
  aBlock[3] = &unk_1E4357C20;
  v9 = v7;
  v17 = v9;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(v6, "count"))
  {
    queue = self->_queue;
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __64__SiriAnalyticsXPCConnectionHandler_resolveMessages_completion___block_invoke_2;
    v12[3] = &unk_1E4357C48;
    v13 = v6;
    v14 = self;
    v15 = v10;
    dispatch_async(queue, v12);

  }
  else
  {
    v10[2](v10);
  }

}

- (void)publishLargeMessage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SiriAnalyticsXPCConnectionHandler *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__SiriAnalyticsXPCConnectionHandler_publishLargeMessage_completion___block_invoke;
  block[3] = &unk_1E4357C48;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)publishUnorderedMessages:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *queue;
  _QWORD v12[5];
  id v13;
  void (**v14)(_QWORD);
  _QWORD aBlock[4];
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__SiriAnalyticsXPCConnectionHandler_publishUnorderedMessages_completion___block_invoke;
  aBlock[3] = &unk_1E4357C20;
  v9 = v7;
  v16 = v9;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(v6, "count"))
  {
    queue = self->_queue;
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __73__SiriAnalyticsXPCConnectionHandler_publishUnorderedMessages_completion___block_invoke_2;
    v12[3] = &unk_1E4357C48;
    v12[4] = self;
    v14 = v10;
    v13 = v6;
    dispatch_async(queue, v12);

  }
  else
  {
    v10[2](v10);
  }

}

- (void)sensitiveCondition:(int)a3 startedAt:(unint64_t)a4 completion:(id)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  int v14;

  v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__SiriAnalyticsXPCConnectionHandler_sensitiveCondition_startedAt_completion___block_invoke;
  v11[3] = &unk_1E4357C70;
  v14 = a3;
  v12 = v8;
  v13 = a4;
  v11[4] = self;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)sensitiveCondition:(int)a3 endedAt:(unint64_t)a4 completion:(id)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  int v14;

  v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__SiriAnalyticsXPCConnectionHandler_sensitiveCondition_endedAt_completion___block_invoke;
  v11[3] = &unk_1E4357C70;
  v14 = a3;
  v12 = v8;
  v13 = a4;
  v11[4] = self;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)resetLogicalClockWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__SiriAnalyticsXPCConnectionHandler_resetLogicalClockWithCompletion___block_invoke;
  v7[3] = &unk_1E4357C98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)vendSandboxExtensionWithResource:(int64_t)a3 readonly:(BOOL)a4 completion:(id)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;
  BOOL v14;

  v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90__SiriAnalyticsXPCConnectionHandler_vendSandboxExtensionWithResource_readonly_completion___block_invoke;
  v11[3] = &unk_1E4357CC0;
  v12 = v8;
  v13 = a3;
  v14 = a4;
  v11[4] = self;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)vendResource:(int64_t)a3 readonly:(BOOL)a4 completion:(id)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;
  BOOL v14;

  v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__SiriAnalyticsXPCConnectionHandler_vendResource_readonly_completion___block_invoke;
  v11[3] = &unk_1E4357CC0;
  v12 = v8;
  v13 = a3;
  v14 = a4;
  v11[4] = self;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)fetchLogicalClocksWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__SiriAnalyticsXPCConnectionHandler_fetchLogicalClocksWithCompletion___block_invoke;
  v7[3] = &unk_1E4357C98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)fetchTags:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__SiriAnalyticsXPCConnectionHandler_fetchTags___block_invoke;
  v7[3] = &unk_1E4357C98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)fetchStateForPluginWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__SiriAnalyticsXPCConnectionHandler_fetchStateForPluginWithCompletion___block_invoke;
  v7[3] = &unk_1E4357C98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)saveState:(id)a3 forPluginWithCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__SiriAnalyticsXPCConnectionHandler_saveState_forPluginWithCompletion___block_invoke;
  block[3] = &unk_1E4357C48;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (void)runPipelineWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__SiriAnalyticsXPCConnectionHandler_runPipelineWithCompletion___block_invoke;
  v7[3] = &unk_1E4357C98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)purgeStagedMessagesWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__SiriAnalyticsXPCConnectionHandler_purgeStagedMessagesWithCompletion___block_invoke;
  v7[3] = &unk_1E4357C98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)createTag:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SiriAnalyticsXPCConnectionHandler_createTag_completion___block_invoke;
  block[3] = &unk_1E4357C48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)fetchKillSwitchEnabledWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __74__SiriAnalyticsXPCConnectionHandler_fetchKillSwitchEnabledWithCompletion___block_invoke;
    v7[3] = &unk_1E4357C98;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)setKillSwitchEnabled:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__SiriAnalyticsXPCConnectionHandler_setKillSwitchEnabled_completion___block_invoke;
  block[3] = &unk_1E4357CE8;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __69__SiriAnalyticsXPCConnectionHandler_setKillSwitchEnabled_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "handler:setKillSwitchEnabled:completion:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

void __74__SiriAnalyticsXPCConnectionHandler_fetchKillSwitchEnabledWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "handler:fetchKillSwitchWithCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __58__SiriAnalyticsXPCConnectionHandler_createTag_completion___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  objc_msgSend(WeakRetained, "handler:createTag:completion:", a1[4], a1[5], a1[6]);

}

void __71__SiriAnalyticsXPCConnectionHandler_purgeStagedMessagesWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "hasRuntimeManagement") & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(WeakRetained, "handler:purgeStagedMessagesWithCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v2 = SiriAnalyticsLogContextXPC;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "-[SiriAnalyticsXPCConnectionHandler purgeStagedMessagesWithCompletion:]_block_invoke";
      _os_log_error_impl(&dword_1A025F000, v2, OS_LOG_TYPE_ERROR, "%s Connection lacks entitlement", buf, 0xCu);
    }
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, 0, 0);
  }
}

void __63__SiriAnalyticsXPCConnectionHandler_runPipelineWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "hasRuntimeManagement") & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(WeakRetained, "handler:runPipelineWithCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v2 = SiriAnalyticsLogContextXPC;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "-[SiriAnalyticsXPCConnectionHandler runPipelineWithCompletion:]_block_invoke";
      _os_log_error_impl(&dword_1A025F000, v2, OS_LOG_TYPE_ERROR, "%s Connection lacks entitlement", buf, 0xCu);
    }
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, 0, 0);
  }
}

void __71__SiriAnalyticsXPCConnectionHandler_saveState_forPluginWithCompletion___block_invoke(_QWORD *a1)
{
  void *v2;
  id WeakRetained;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1[4] + 64), "hasPluginState") & 1) == 0)
  {
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v4 = SiriAnalyticsLogContextXPC;
    if (!os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_DWORD *)buf = 136315138;
    v9 = "-[SiriAnalyticsXPCConnectionHandler saveState:forPluginWithCompletion:]_block_invoke";
    v5 = "%s Caller lacks entitlement.";
    goto LABEL_15;
  }
  v2 = *(void **)(a1[4] + 72);
  if (v2)
  {
    v7 = (id)objc_msgSend(v2, "copy");
    WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
    objc_msgSend(WeakRetained, "handler:saveState:forPluginName:completion:", a1[4], a1[5], v7, a1[6]);

    return;
  }
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SiriAnalyticsXPCConnectionHandler saveState:forPluginWithCompletion:]_block_invoke";
    v5 = "%s Caller lacks application-identifier entitlement.";
LABEL_15:
    _os_log_error_impl(&dword_1A025F000, v4, OS_LOG_TYPE_ERROR, v5, buf, 0xCu);
  }
LABEL_11:
  v6 = a1[6];
  if (v6)
    (*(void (**)(void))(v6 + 16))();
}

void __71__SiriAnalyticsXPCConnectionHandler_fetchStateForPluginWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "hasPluginState") & 1) == 0)
  {
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v4 = SiriAnalyticsLogContextXPC;
    if (!os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_DWORD *)buf = 136315138;
    v9 = "-[SiriAnalyticsXPCConnectionHandler fetchStateForPluginWithCompletion:]_block_invoke";
    v5 = "%s Caller lacks entitlement.";
    goto LABEL_15;
  }
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  if (v2)
  {
    v7 = (id)objc_msgSend(v2, "copy");
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(WeakRetained, "handler:fetchStateForPluginName:completion:", *(_QWORD *)(a1 + 32), v7, *(_QWORD *)(a1 + 40));

    return;
  }
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SiriAnalyticsXPCConnectionHandler fetchStateForPluginWithCompletion:]_block_invoke";
    v5 = "%s Caller lacks application-identifier entitlement.";
LABEL_15:
    _os_log_error_impl(&dword_1A025F000, v4, OS_LOG_TYPE_ERROR, v5, buf, 0xCu);
  }
LABEL_11:
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
}

void __47__SiriAnalyticsXPCConnectionHandler_fetchTags___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "hasRuntimeIntrospection") & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(WeakRetained, "handler:fetchTags:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v2 = SiriAnalyticsLogContextXPC;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "-[SiriAnalyticsXPCConnectionHandler fetchTags:]_block_invoke";
      _os_log_error_impl(&dword_1A025F000, v2, OS_LOG_TYPE_ERROR, "%s Connection lacks entitlement", buf, 0xCu);
    }
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v3 + 16))(v3, 0, 0, 0);
  }
}

void __70__SiriAnalyticsXPCConnectionHandler_fetchLogicalClocksWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "hasRuntimeIntrospection") & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(WeakRetained, "handler:fetchLogicalClocks:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v2 = SiriAnalyticsLogContextXPC;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "-[SiriAnalyticsXPCConnectionHandler fetchLogicalClocksWithCompletion:]_block_invoke";
      _os_log_error_impl(&dword_1A025F000, v2, OS_LOG_TYPE_ERROR, "%s Connection lacks entitlement", buf, 0xCu);
    }
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v3 + 16))(v3, 0, 0, 0);
  }
}

void __70__SiriAnalyticsXPCConnectionHandler_vendResource_readonly_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "handler:vendResource:readonly:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

void __90__SiriAnalyticsXPCConnectionHandler_vendSandboxExtensionWithResource_readonly_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "handler:vendSandboxExtensionWithResource:readonly:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

void __69__SiriAnalyticsXPCConnectionHandler_resetLogicalClockWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "hasRuntimeManagement") & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(WeakRetained, "handler:resetLogicalClockWithCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v2 = SiriAnalyticsLogContextXPC;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "-[SiriAnalyticsXPCConnectionHandler resetLogicalClockWithCompletion:]_block_invoke";
      _os_log_error_impl(&dword_1A025F000, v2, OS_LOG_TYPE_ERROR, "%s Connection lacks entitlement", buf, 0xCu);
    }
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v3 + 16))(v3, 0, 0, 0);
  }
}

void __75__SiriAnalyticsXPCConnectionHandler_sensitiveCondition_endedAt_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "handler:sensitiveCondition:endedAt:completion:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

void __77__SiriAnalyticsXPCConnectionHandler_sensitiveCondition_startedAt_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "handler:sensitiveCondition:startedAt:completion:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

uint64_t __73__SiriAnalyticsXPCConnectionHandler_publishUnorderedMessages_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __73__SiriAnalyticsXPCConnectionHandler_publishUnorderedMessages_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id WeakRetained;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "canPublishUnordered") & 1) != 0)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v3 = *(id *)(a1 + 40);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v16 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          v9 = objc_alloc(MEMORY[0x1E0D9A3C8]);
          v10 = objc_msgSend(v8, "eventTypeId", (_QWORD)v15);
          objc_msgSend(v8, "payload");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(v9, "initWithAnyEventType:payload:", v10, v11);

          objc_msgSend(v2, "addObject:", v12);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v5);
    }

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(WeakRetained, "handler:unorderedMessagesReceived:", *(_QWORD *)(a1 + 32), v2);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v14 = SiriAnalyticsLogContextXPC;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[SiriAnalyticsXPCConnectionHandler publishUnorderedMessages:completion:]_block_invoke_2";
      _os_log_error_impl(&dword_1A025F000, v14, OS_LOG_TYPE_ERROR, "%s Connection lacks entitlement", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __68__SiriAnalyticsXPCConnectionHandler_publishLargeMessage_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id WeakRetained;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "largeMessagePath");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x1E0D995F8]);
  objc_msgSend(*(id *)(a1 + 32), "serializedDataUploadMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithData:", v3);

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
  objc_msgSend(WeakRetained, "handler:largeMessageReceivedWithPath:messageWrapper:completion:", *(_QWORD *)(a1 + 40), v6, v4, *(_QWORD *)(a1 + 48));

}

uint64_t __64__SiriAnalyticsXPCConnectionHandler_resolveMessages_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __64__SiriAnalyticsXPCConnectionHandler_resolveMessages_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 40), "mapToAnnotatedMessage:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7), (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
  objc_msgSend(WeakRetained, "handler:unresolvedMessagesReceived:", *(_QWORD *)(a1 + 40), v2);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

@end
