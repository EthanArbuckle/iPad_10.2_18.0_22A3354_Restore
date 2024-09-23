@implementation SiriAnalyticsXPCConnection

uint64_t __75__SiriAnalyticsXPCConnection__publishMessagesToRemote_attempts_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__SiriAnalyticsXPCConnection_publishMessages_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_publishMessages:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __75__SiriAnalyticsXPCConnection__publishMessagesToRemote_attempts_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

{
  return objc_msgSend(*(id *)(a1 + 32), "_publishMessagesToRemote:attempts:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56) + 1, *(_QWORD *)(a1 + 48));
}

void __75__SiriAnalyticsXPCConnection__publishMessagesToRemote_attempts_completion___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__SiriAnalyticsXPCConnection__publishMessagesToRemote_attempts_completion___block_invoke_2;
  block[3] = &unk_1E4357C20;
  v4 = v1;
  dispatch_async(v2, block);

}

uint64_t __58__SiriAnalyticsXPCConnection__publishMessages_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_startIdleTimer");
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_startIdleTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *idleTimer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  if (!self->_idleTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
    idleTimer = self->_idleTimer;
    self->_idleTimer = v3;

    v5 = self->_idleTimer;
    v6 = dispatch_time(0, 4000000000);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak(&location, self);
    v7 = self->_idleTimer;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__SiriAnalyticsXPCConnection__startIdleTimer__block_invoke;
    v8[3] = &unk_1E4357B38;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler(v7, v8);
    dispatch_resume((dispatch_object_t)self->_idleTimer);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_publishMessages:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  v7 = a3;
  -[SiriAnalyticsXPCConnection _stopIdleTimer](self, "_stopIdleTimer");
  dispatch_group_enter((dispatch_group_t)self->_xpcPublishingGroup);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__SiriAnalyticsXPCConnection__publishMessages_completion___block_invoke;
  v9[3] = &unk_1E4357C98;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[SiriAnalyticsXPCConnection _publishMessagesToRemote:attempts:completion:](self, "_publishMessagesToRemote:attempts:completion:", v7, 0, v9);

}

- (void)_stopIdleTimer
{
  NSObject *idleTimer;
  OS_dispatch_source *v4;

  idleTimer = self->_idleTimer;
  if (idleTimer)
  {
    dispatch_source_cancel(idleTimer);
    v4 = self->_idleTimer;
    self->_idleTimer = 0;

  }
}

- (void)_publishMessagesToRemote:(id)a3 attempts:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  SiriAnalyticsXPCConnection *v23;
  id v24;
  id v25;
  unint64_t v26;
  _QWORD aBlock[5];
  id v28;

  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__SiriAnalyticsXPCConnection__publishMessagesToRemote_attempts_completion___block_invoke;
  aBlock[3] = &unk_1E4357C98;
  aBlock[4] = self;
  v11 = v9;
  v28 = v11;
  v12 = _Block_copy(aBlock);
  -[SiriAnalyticsXPCConnection _currentConnection](self, "_currentConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __75__SiriAnalyticsXPCConnection__publishMessagesToRemote_attempts_completion___block_invoke_3;
  v21[3] = &unk_1E43574C0;
  v22 = v8;
  v23 = self;
  v26 = a4;
  v24 = v11;
  v14 = v12;
  v25 = v14;
  v15 = v11;
  v16 = v8;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __75__SiriAnalyticsXPCConnection__publishMessagesToRemote_attempts_completion___block_invoke_5;
  v19[3] = &unk_1E4357C20;
  v20 = v14;
  v18 = v14;
  objc_msgSend(v17, "publishMessages:completion:", v16, v19);

}

- (id)_currentConnection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  uint64_t v9;
  NSXPCConnection *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", self->_machServiceName, 0);
    v5 = self->_connection;
    self->_connection = v4;

    -[NSXPCConnection _setQueue:](self->_connection, "_setQueue:", self->_queue);
    v6 = self->_connection;
    SiriAnalyticsXPCServiceInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);

    objc_initWeak(&location, self);
    v8 = self->_connection;
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __48__SiriAnalyticsXPCConnection__currentConnection__block_invoke;
    v14[3] = &unk_1E4357B38;
    objc_copyWeak(&v15, &location);
    -[NSXPCConnection setInterruptionHandler:](v8, "setInterruptionHandler:", v14);
    v10 = self->_connection;
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __48__SiriAnalyticsXPCConnection__currentConnection__block_invoke_2;
    v12[3] = &unk_1E4357B38;
    objc_copyWeak(&v13, &location);
    -[NSXPCConnection setInvalidationHandler:](v10, "setInvalidationHandler:", v12);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

- (void)publishMessages:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *queue;
  _QWORD block[5];
  id v10;
  void (**v11)(_QWORD);

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v6, "count"))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__SiriAnalyticsXPCConnection_publishMessages_completion___block_invoke;
    block[3] = &unk_1E4357C48;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(queue, block);

  }
  else if (v7)
  {
    v7[2](v7);
  }

}

- (SiriAnalyticsXPCConnection)initWithMachServiceName:(id)a3
{
  id v4;
  SiriAnalyticsXPCConnection *v5;
  NSObject *v6;
  id v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  dispatch_group_t v10;
  OS_dispatch_group *xpcPublishingGroup;
  uint64_t v12;
  NSString *machServiceName;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SiriAnalyticsXPCConnection;
  v5 = -[SiriAnalyticsXPCConnection init](&v15, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.analytics.xpc.connection"), v4);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = dispatch_queue_create((const char *)objc_msgSend(v7, "UTF8String"), v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    v10 = dispatch_group_create();
    xpcPublishingGroup = v5->_xpcPublishingGroup;
    v5->_xpcPublishingGroup = (OS_dispatch_group *)v10;

    v12 = objc_msgSend(v4, "copy");
    machServiceName = v5->_machServiceName;
    v5->_machServiceName = (NSString *)v12;

  }
  return v5;
}

- (void)publishUnorderedMessages:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *queue;
  _QWORD block[5];
  id v10;
  void (**v11)(_QWORD);

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v6, "count"))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__SiriAnalyticsXPCConnection_publishUnorderedMessages_completion___block_invoke;
    block[3] = &unk_1E4357C48;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(queue, block);

  }
  else if (v7)
  {
    v7[2](v7);
  }

}

- (void)_publishUnorderedMessages:(id)a3 attempts:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  SiriAnalyticsXPCConnection *v23;
  id v24;
  id v25;
  unint64_t v26;
  _QWORD aBlock[5];
  id v28;

  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__SiriAnalyticsXPCConnection__publishUnorderedMessages_attempts_completion___block_invoke;
  aBlock[3] = &unk_1E4357C98;
  aBlock[4] = self;
  v11 = v9;
  v28 = v11;
  v12 = _Block_copy(aBlock);
  -[SiriAnalyticsXPCConnection _stopIdleTimer](self, "_stopIdleTimer");
  -[SiriAnalyticsXPCConnection _currentConnection](self, "_currentConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __76__SiriAnalyticsXPCConnection__publishUnorderedMessages_attempts_completion___block_invoke_3;
  v21[3] = &unk_1E43574C0;
  v22 = v8;
  v23 = self;
  v26 = a4;
  v24 = v11;
  v14 = v12;
  v25 = v14;
  v15 = v11;
  v16 = v8;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __76__SiriAnalyticsXPCConnection__publishUnorderedMessages_attempts_completion___block_invoke_8;
  v19[3] = &unk_1E4357C20;
  v20 = v14;
  v18 = v14;
  objc_msgSend(v17, "publishUnorderedMessages:completion:", v16, v19);

}

- (void)resolveMessages:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *queue;
  _QWORD block[5];
  id v10;
  void (**v11)(_QWORD);

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v6, "count"))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__SiriAnalyticsXPCConnection_resolveMessages_completion___block_invoke;
    block[3] = &unk_1E4357C48;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(queue, block);

  }
  else if (v7)
  {
    v7[2](v7);
  }

}

- (void)_resolveMessages:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  v7 = a3;
  -[SiriAnalyticsXPCConnection _stopIdleTimer](self, "_stopIdleTimer");
  dispatch_group_enter((dispatch_group_t)self->_xpcPublishingGroup);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__SiriAnalyticsXPCConnection__resolveMessages_completion___block_invoke;
  v9[3] = &unk_1E4357C98;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[SiriAnalyticsXPCConnection _resolveMessagesAtRemote:attempts:completion:](self, "_resolveMessagesAtRemote:attempts:completion:", v7, 0, v9);

}

- (void)_resolveMessagesAtRemote:(id)a3 attempts:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  SiriAnalyticsXPCConnection *v30;
  id v31;
  id v32;
  unint64_t v33;
  _QWORD aBlock[5];
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__SiriAnalyticsXPCConnection__resolveMessagesAtRemote_attempts_completion___block_invoke;
  aBlock[3] = &unk_1E4357C98;
  aBlock[4] = self;
  v11 = v9;
  v35 = v11;
  v12 = _Block_copy(aBlock);
  -[SiriAnalyticsXPCConnection _currentConnection](self, "_currentConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v14 = (void *)SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    v22 = v14;
    v23 = objc_msgSend(v8, "count");
    *(_DWORD *)buf = 136315650;
    v37 = "-[SiriAnalyticsXPCConnection _resolveMessagesAtRemote:attempts:completion:]";
    v38 = 2048;
    v39 = v23;
    v40 = 2112;
    v41 = v13;
    _os_log_debug_impl(&dword_1A025F000, v22, OS_LOG_TYPE_DEBUG, "%s Sending %lu unresolved messages to connection %@", buf, 0x20u);

  }
  v28[0] = v10;
  v28[1] = 3221225472;
  v28[2] = __75__SiriAnalyticsXPCConnection__resolveMessagesAtRemote_attempts_completion___block_invoke_9;
  v28[3] = &unk_1E43574C0;
  v15 = v8;
  v29 = v15;
  v30 = self;
  v33 = a4;
  v31 = v11;
  v16 = v12;
  v32 = v16;
  v17 = v11;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v28);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v10;
  v24[1] = 3221225472;
  v24[2] = __75__SiriAnalyticsXPCConnection__resolveMessagesAtRemote_attempts_completion___block_invoke_12;
  v24[3] = &unk_1E4357C48;
  v25 = v15;
  v26 = v13;
  v27 = v16;
  v19 = v16;
  v20 = v13;
  v21 = v15;
  objc_msgSend(v18, "resolveMessages:completion:", v21, v24);

}

- (void)publishLargeMessage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  NSObject *queue;
  SiriAnalyticsError *v10;
  _QWORD block[5];
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__SiriAnalyticsXPCConnection_publishLargeMessage_completion___block_invoke;
    block[3] = &unk_1E4357C48;
    block[4] = self;
    v12 = v6;
    v13 = v8;
    dispatch_async(queue, block);

  }
  else if (v7)
  {
    v10 = -[SiriAnalyticsError initWithErrorType:message:]([SiriAnalyticsError alloc], "initWithErrorType:message:", 0, CFSTR("XPC envelope is nil"));
    ((void (**)(_QWORD, _QWORD, SiriAnalyticsError *))v8)[2](v8, 0, v10);

  }
}

- (void)_publishLargeMessage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  v7 = a3;
  -[SiriAnalyticsXPCConnection _stopIdleTimer](self, "_stopIdleTimer");
  dispatch_group_enter((dispatch_group_t)self->_xpcPublishingGroup);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__SiriAnalyticsXPCConnection__publishLargeMessage_completion___block_invoke;
  v9[3] = &unk_1E43574E8;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[SiriAnalyticsXPCConnection _publishLargeMessageToRemote:attempts:completion:](self, "_publishLargeMessageToRemote:attempts:completion:", v7, 0, v9);

}

- (void)_publishLargeMessageToRemote:(id)a3 attempts:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  _QWORD aBlock[5];
  id v27;

  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__SiriAnalyticsXPCConnection__publishLargeMessageToRemote_attempts_completion___block_invoke;
  aBlock[3] = &unk_1E43574E8;
  aBlock[4] = self;
  v11 = v9;
  v27 = v11;
  v12 = _Block_copy(aBlock);
  -[SiriAnalyticsXPCConnection _currentConnection](self, "_currentConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __79__SiriAnalyticsXPCConnection__publishLargeMessageToRemote_attempts_completion___block_invoke_3;
  v21[3] = &unk_1E43574C0;
  v21[4] = self;
  v22 = v8;
  v25 = a4;
  v23 = v11;
  v14 = v12;
  v24 = v14;
  v15 = v11;
  v16 = v8;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __79__SiriAnalyticsXPCConnection__publishLargeMessageToRemote_attempts_completion___block_invoke_19;
  v19[3] = &unk_1E4357510;
  v20 = v14;
  v18 = v14;
  objc_msgSend(v17, "publishLargeMessage:completion:", v16, v19);

}

- (void)barrierWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *xpcPublishingGroup;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v5 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[SiriAnalyticsXPCConnection barrierWithCompletion:]";
    _os_log_debug_impl(&dword_1A025F000, v5, OS_LOG_TYPE_DEBUG, "%s entering barrier", buf, 0xCu);
  }
  xpcPublishingGroup = self->_xpcPublishingGroup;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SiriAnalyticsXPCConnection_barrierWithCompletion___block_invoke;
  block[3] = &unk_1E4357C20;
  v10 = v4;
  v8 = v4;
  dispatch_group_notify(xpcPublishingGroup, queue, block);

}

- (void)sensitiveCondition:(int)a3 startedAt:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  int v14;

  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__SiriAnalyticsXPCConnection_sensitiveCondition_startedAt_completion___block_invoke;
  v11[3] = &unk_1E4357C70;
  v14 = a3;
  v12 = v8;
  v13 = a4;
  v11[4] = self;
  v9 = v8;
  v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_DEFAULT, 0, v11);
  dispatch_async((dispatch_queue_t)self->_queue, v10);

}

- (void)_sensitiveCondition:(int)a3 startedAt:(unint64_t)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  int v21;
  _QWORD aBlock[5];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v6 = *(_QWORD *)&a3;
  v30 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__SiriAnalyticsXPCConnection__sensitiveCondition_startedAt_completion___block_invoke;
  aBlock[3] = &unk_1E43574E8;
  aBlock[4] = self;
  v10 = v8;
  v23 = v10;
  v11 = _Block_copy(aBlock);
  -[SiriAnalyticsXPCConnection _stopIdleTimer](self, "_stopIdleTimer");
  -[SiriAnalyticsXPCConnection _currentConnection](self, "_currentConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v13 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "-[SiriAnalyticsXPCConnection _sensitiveCondition:startedAt:completion:]";
    v26 = 2048;
    v27 = (int)v6;
    v28 = 2112;
    v29 = v12;
    _os_log_debug_impl(&dword_1A025F000, v13, OS_LOG_TYPE_DEBUG, "%s Starting sensitiveCondition %lu for connection:%@", buf, 0x20u);
  }
  v16 = v9;
  v17 = 3221225472;
  v18 = __71__SiriAnalyticsXPCConnection__sensitiveCondition_startedAt_completion___block_invoke_20;
  v19 = &unk_1E4357560;
  v21 = v6;
  v20 = v11;
  v14 = v11;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", &v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sensitiveCondition:startedAt:completion:", v6, a4, v14, v16, v17, v18, v19);

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
  v11[2] = __68__SiriAnalyticsXPCConnection_sensitiveCondition_endedAt_completion___block_invoke;
  v11[3] = &unk_1E4357C70;
  v14 = a3;
  v12 = v8;
  v13 = a4;
  v11[4] = self;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)_sensitiveCondition:(int)a3 endedAt:(unint64_t)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  NSObject *queue;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  unint64_t v22;
  int v23;
  _QWORD v24[4];
  id v25;
  int v26;
  _QWORD aBlock[5];
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__SiriAnalyticsXPCConnection__sensitiveCondition_endedAt_completion___block_invoke;
  aBlock[3] = &unk_1E43574E8;
  aBlock[4] = self;
  v10 = v8;
  v28 = v10;
  v11 = _Block_copy(aBlock);
  -[SiriAnalyticsXPCConnection _stopIdleTimer](self, "_stopIdleTimer");
  -[SiriAnalyticsXPCConnection _currentConnection](self, "_currentConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v13 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v30 = "-[SiriAnalyticsXPCConnection _sensitiveCondition:endedAt:completion:]";
    v31 = 2048;
    v32 = a3;
    v33 = 2112;
    v34 = v12;
    _os_log_debug_impl(&dword_1A025F000, v13, OS_LOG_TYPE_DEBUG, "%s Ending sensitiveCondition %lu for connection:%@", buf, 0x20u);
  }
  v24[0] = v9;
  v24[1] = 3221225472;
  v24[2] = __69__SiriAnalyticsXPCConnection__sensitiveCondition_endedAt_completion___block_invoke_21;
  v24[3] = &unk_1E4357560;
  v26 = a3;
  v14 = v11;
  v25 = v14;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __69__SiriAnalyticsXPCConnection__sensitiveCondition_endedAt_completion___block_invoke_22;
  v19[3] = &unk_1E4357C70;
  v23 = a3;
  v21 = v14;
  v22 = a4;
  v20 = v15;
  v17 = v14;
  v18 = v15;
  dispatch_async(queue, v19);

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
  v7[2] = __62__SiriAnalyticsXPCConnection_resetLogicalClockWithCompletion___block_invoke;
  v7[3] = &unk_1E4357C98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_resetLogicalClockWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD aBlock[5];
  id v20;
  id v21;
  id location;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__SiriAnalyticsXPCConnection__resetLogicalClockWithCompletion___block_invoke;
  aBlock[3] = &unk_1E43575B0;
  aBlock[4] = self;
  objc_copyWeak(&v21, &location);
  v6 = v4;
  v20 = v6;
  v7 = _Block_copy(aBlock);
  -[SiriAnalyticsXPCConnection _stopIdleTimer](self, "_stopIdleTimer");
  dispatch_group_enter((dispatch_group_t)self->_xpcPublishingGroup);
  -[SiriAnalyticsXPCConnection _currentConnection](self, "_currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v9 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[SiriAnalyticsXPCConnection _resetLogicalClockWithCompletion:]";
    v25 = 2112;
    v26 = v8;
    _os_log_debug_impl(&dword_1A025F000, v9, OS_LOG_TYPE_DEBUG, "%s Resetting logical clock for connection: %@", buf, 0x16u);
  }
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __63__SiriAnalyticsXPCConnection__resetLogicalClockWithCompletion___block_invoke_24;
  v17[3] = &unk_1E4357AB8;
  v10 = v7;
  v18 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __63__SiriAnalyticsXPCConnection__resetLogicalClockWithCompletion___block_invoke_25;
  v14[3] = &unk_1E43575D8;
  v12 = v8;
  v15 = v12;
  v13 = v10;
  v16 = v13;
  objc_msgSend(v11, "resetLogicalClockWithCompletion:", v14);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

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
  v11[2] = __83__SiriAnalyticsXPCConnection_vendSandboxExtensionWithResource_readonly_completion___block_invoke;
  v11[3] = &unk_1E4357CC0;
  v12 = v8;
  v13 = a3;
  v14 = a4;
  v11[4] = self;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)_vendSandboxExtensionWithResource:(int64_t)a3 readonly:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD aBlock[5];
  id v24;
  id v25;
  id location;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v5 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__SiriAnalyticsXPCConnection__vendSandboxExtensionWithResource_readonly_completion___block_invoke;
  aBlock[3] = &unk_1E4357628;
  aBlock[4] = self;
  objc_copyWeak(&v25, &location);
  v10 = v8;
  v24 = v10;
  v11 = _Block_copy(aBlock);
  -[SiriAnalyticsXPCConnection _stopIdleTimer](self, "_stopIdleTimer");
  dispatch_group_enter((dispatch_group_t)self->_xpcPublishingGroup);
  -[SiriAnalyticsXPCConnection _currentConnection](self, "_currentConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v13 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[SiriAnalyticsXPCConnection _vendSandboxExtensionWithResource:readonly:completion:]";
    v29 = 2112;
    v30 = v12;
    _os_log_debug_impl(&dword_1A025F000, v13, OS_LOG_TYPE_DEBUG, "%s Vending sandbox extension for connection: %@", buf, 0x16u);
  }
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __84__SiriAnalyticsXPCConnection__vendSandboxExtensionWithResource_readonly_completion___block_invoke_27;
  v21[3] = &unk_1E4357AB8;
  v14 = v11;
  v22 = v14;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __84__SiriAnalyticsXPCConnection__vendSandboxExtensionWithResource_readonly_completion___block_invoke_28;
  v18[3] = &unk_1E4357650;
  v16 = v12;
  v19 = v16;
  v17 = v14;
  v20 = v17;
  objc_msgSend(v15, "vendSandboxExtensionWithResource:readonly:completion:", a3, v5, v18);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

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
  v11[2] = __63__SiriAnalyticsXPCConnection_vendResource_readonly_completion___block_invoke;
  v11[3] = &unk_1E4357CC0;
  v12 = v8;
  v13 = a3;
  v14 = a4;
  v11[4] = self;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)_vendResource:(int64_t)a3 readonly:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD aBlock[5];
  id v24;
  id v25;
  id location;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v5 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__SiriAnalyticsXPCConnection__vendResource_readonly_completion___block_invoke;
  aBlock[3] = &unk_1E43576A0;
  aBlock[4] = self;
  objc_copyWeak(&v25, &location);
  v10 = v8;
  v24 = v10;
  v11 = _Block_copy(aBlock);
  -[SiriAnalyticsXPCConnection _stopIdleTimer](self, "_stopIdleTimer");
  dispatch_group_enter((dispatch_group_t)self->_xpcPublishingGroup);
  -[SiriAnalyticsXPCConnection _currentConnection](self, "_currentConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v13 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[SiriAnalyticsXPCConnection _vendResource:readonly:completion:]";
    v29 = 2112;
    v30 = v12;
    _os_log_debug_impl(&dword_1A025F000, v13, OS_LOG_TYPE_DEBUG, "%s Vending sandbox extension for connection: %@", buf, 0x16u);
  }
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __64__SiriAnalyticsXPCConnection__vendResource_readonly_completion___block_invoke_30;
  v21[3] = &unk_1E4357AB8;
  v14 = v11;
  v22 = v14;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __64__SiriAnalyticsXPCConnection__vendResource_readonly_completion___block_invoke_31;
  v18[3] = &unk_1E43576C8;
  v16 = v12;
  v19 = v16;
  v17 = v14;
  v20 = v17;
  objc_msgSend(v15, "vendResource:readonly:completion:", a3, v5, v18);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

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
  v7[2] = __63__SiriAnalyticsXPCConnection_fetchLogicalClocksWithCompletion___block_invoke;
  v7[3] = &unk_1E4357C98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_fetchLogicalClocksWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD aBlock[5];
  id v15;
  id v16;
  id location;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__SiriAnalyticsXPCConnection__fetchLogicalClocksWithCompletion___block_invoke;
  aBlock[3] = &unk_1E43576F0;
  aBlock[4] = self;
  objc_copyWeak(&v16, &location);
  v6 = v4;
  v15 = v6;
  v7 = _Block_copy(aBlock);
  -[SiriAnalyticsXPCConnection _stopIdleTimer](self, "_stopIdleTimer");
  dispatch_group_enter((dispatch_group_t)self->_xpcPublishingGroup);
  -[SiriAnalyticsXPCConnection _currentConnection](self, "_currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v9 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[SiriAnalyticsXPCConnection _fetchLogicalClocksWithCompletion:]";
    v20 = 2112;
    v21 = v8;
    _os_log_debug_impl(&dword_1A025F000, v9, OS_LOG_TYPE_DEBUG, "%s Fetching logical clocks for connection: %@", buf, 0x16u);
  }
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __64__SiriAnalyticsXPCConnection__fetchLogicalClocksWithCompletion___block_invoke_33;
  v12[3] = &unk_1E4357AB8;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchLogicalClocksWithCompletion:", v10);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

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
  v7[2] = __40__SiriAnalyticsXPCConnection_fetchTags___block_invoke;
  v7[3] = &unk_1E4357C98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_fetchTags:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD aBlock[5];
  id v15;
  id v16;
  id location;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__SiriAnalyticsXPCConnection__fetchTags___block_invoke;
  aBlock[3] = &unk_1E4357718;
  aBlock[4] = self;
  objc_copyWeak(&v16, &location);
  v6 = v4;
  v15 = v6;
  v7 = _Block_copy(aBlock);
  -[SiriAnalyticsXPCConnection _stopIdleTimer](self, "_stopIdleTimer");
  dispatch_group_enter((dispatch_group_t)self->_xpcPublishingGroup);
  -[SiriAnalyticsXPCConnection _currentConnection](self, "_currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v9 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[SiriAnalyticsXPCConnection _fetchTags:]";
    v20 = 2112;
    v21 = v8;
    _os_log_debug_impl(&dword_1A025F000, v9, OS_LOG_TYPE_DEBUG, "%s Fetching tags for connection: %@", buf, 0x16u);
  }
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __41__SiriAnalyticsXPCConnection__fetchTags___block_invoke_35;
  v12[3] = &unk_1E4357AB8;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchTags:", v10);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

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
  v7[2] = __64__SiriAnalyticsXPCConnection_fetchStateForPluginWithCompletion___block_invoke;
  v7[3] = &unk_1E4357C98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_fetchStateForPluginWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[5];
  id v18;
  id v19;
  id location;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__SiriAnalyticsXPCConnection__fetchStateForPluginWithCompletion___block_invoke;
  aBlock[3] = &unk_1E4357740;
  aBlock[4] = self;
  objc_copyWeak(&v19, &location);
  v6 = v4;
  v18 = v6;
  v7 = _Block_copy(aBlock);
  -[SiriAnalyticsXPCConnection _stopIdleTimer](self, "_stopIdleTimer");
  dispatch_group_enter((dispatch_group_t)self->_xpcPublishingGroup);
  -[SiriAnalyticsXPCConnection _currentConnection](self, "_currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v9 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[SiriAnalyticsXPCConnection _fetchStateForPluginWithCompletion:]";
    v23 = 2112;
    v24 = v8;
    _os_log_debug_impl(&dword_1A025F000, v9, OS_LOG_TYPE_DEBUG, "%s Fetching state for plugin for connection: %@", buf, 0x16u);
  }
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __65__SiriAnalyticsXPCConnection__fetchStateForPluginWithCompletion___block_invoke_37;
  v15[3] = &unk_1E4357AB8;
  v10 = v7;
  v16 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __65__SiriAnalyticsXPCConnection__fetchStateForPluginWithCompletion___block_invoke_38;
  v13[3] = &unk_1E4357768;
  v12 = v10;
  v14 = v12;
  objc_msgSend(v11, "fetchStateForPluginWithCompletion:", v13);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

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
  block[2] = __64__SiriAnalyticsXPCConnection_saveState_forPluginWithCompletion___block_invoke;
  block[3] = &unk_1E4357C48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)_saveState:(id)a3 forPluginWithCompletion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[5];
  id v21;
  id v22;
  id location;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__SiriAnalyticsXPCConnection__saveState_forPluginWithCompletion___block_invoke;
  aBlock[3] = &unk_1E4357A48;
  aBlock[4] = self;
  objc_copyWeak(&v22, &location);
  v9 = v7;
  v21 = v9;
  v10 = _Block_copy(aBlock);
  -[SiriAnalyticsXPCConnection _stopIdleTimer](self, "_stopIdleTimer");
  dispatch_group_enter((dispatch_group_t)self->_xpcPublishingGroup);
  -[SiriAnalyticsXPCConnection _currentConnection](self, "_currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v12 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[SiriAnalyticsXPCConnection _saveState:forPluginWithCompletion:]";
    v26 = 2112;
    v27 = v11;
    _os_log_debug_impl(&dword_1A025F000, v12, OS_LOG_TYPE_DEBUG, "%s Saving state for plugin for connection: %@", buf, 0x16u);
  }
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __65__SiriAnalyticsXPCConnection__saveState_forPluginWithCompletion___block_invoke_39;
  v18[3] = &unk_1E4357AB8;
  v13 = v10;
  v19 = v13;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __65__SiriAnalyticsXPCConnection__saveState_forPluginWithCompletion___block_invoke_40;
  v16[3] = &unk_1E4357C20;
  v15 = v13;
  v17 = v15;
  objc_msgSend(v14, "saveState:forPluginWithCompletion:", v6, v16);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (void)createTag:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  dispatch_block_t v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SiriAnalyticsXPCConnection_createTag_completion___block_invoke;
  block[3] = &unk_1E4357C48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_DEFAULT, 0, block);
  dispatch_async((dispatch_queue_t)self->_queue, v10);

}

- (void)_createTag:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  _QWORD aBlock[5];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__SiriAnalyticsXPCConnection__createTag_completion___block_invoke;
  aBlock[3] = &unk_1E43574E8;
  aBlock[4] = self;
  v9 = v7;
  v23 = v9;
  v10 = _Block_copy(aBlock);
  -[SiriAnalyticsXPCConnection _stopIdleTimer](self, "_stopIdleTimer");
  -[SiriAnalyticsXPCConnection _currentConnection](self, "_currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v12 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "-[SiriAnalyticsXPCConnection _createTag:completion:]";
    v26 = 2112;
    v27 = v6;
    v28 = 2112;
    v29 = v11;
    _os_log_debug_impl(&dword_1A025F000, v12, OS_LOG_TYPE_DEBUG, "%s Starting tagSensitiveCondition %@ for connection:%@", buf, 0x20u);
  }
  v16 = v8;
  v17 = 3221225472;
  v18 = __52__SiriAnalyticsXPCConnection__createTag_completion___block_invoke_41;
  v19 = &unk_1E43577B8;
  v20 = v6;
  v21 = v10;
  v13 = v10;
  v14 = v6;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", &v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "createTag:completion:", v14, v13, v16, v17, v18, v19);

}

- (void)fetchKillSwitchEnabledWithCompletion:(id)a3
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
  v7[2] = __67__SiriAnalyticsXPCConnection_fetchKillSwitchEnabledWithCompletion___block_invoke;
  v7[3] = &unk_1E4357C98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_fetchKillSwitchEnabledWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD aBlock[5];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__SiriAnalyticsXPCConnection__fetchKillSwitchEnabledWithCompletion___block_invoke;
  aBlock[3] = &unk_1E43574E8;
  aBlock[4] = self;
  v6 = v4;
  v15 = v6;
  v7 = _Block_copy(aBlock);
  -[SiriAnalyticsXPCConnection _stopIdleTimer](self, "_stopIdleTimer");
  -[SiriAnalyticsXPCConnection _currentConnection](self, "_currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v9 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[SiriAnalyticsXPCConnection _fetchKillSwitchEnabledWithCompletion:]";
    v18 = 2112;
    v19 = v8;
    _os_log_debug_impl(&dword_1A025F000, v9, OS_LOG_TYPE_DEBUG, "%s Starting for connection:%@", buf, 0x16u);
  }
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __68__SiriAnalyticsXPCConnection__fetchKillSwitchEnabledWithCompletion___block_invoke_42;
  v12[3] = &unk_1E4357AB8;
  v13 = v7;
  v10 = v7;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchKillSwitchEnabledWithCompletion:", v10);

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
  block[2] = __62__SiriAnalyticsXPCConnection_setKillSwitchEnabled_completion___block_invoke;
  block[3] = &unk_1E4357CE8;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)_setKillSwitchEnabled:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD aBlock[5];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v4 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__SiriAnalyticsXPCConnection__setKillSwitchEnabled_completion___block_invoke;
  aBlock[3] = &unk_1E43574E8;
  aBlock[4] = self;
  v8 = v6;
  v17 = v8;
  v9 = _Block_copy(aBlock);
  -[SiriAnalyticsXPCConnection _stopIdleTimer](self, "_stopIdleTimer");
  -[SiriAnalyticsXPCConnection _currentConnection](self, "_currentConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v11 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[SiriAnalyticsXPCConnection _setKillSwitchEnabled:completion:]";
    v20 = 2112;
    v21 = v10;
    _os_log_debug_impl(&dword_1A025F000, v11, OS_LOG_TYPE_DEBUG, "%s Starting for connection:%@", buf, 0x16u);
  }
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __63__SiriAnalyticsXPCConnection__setKillSwitchEnabled_completion___block_invoke_43;
  v14[3] = &unk_1E4357AB8;
  v15 = v9;
  v12 = v9;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setKillSwitchEnabled:completion:", v4, v12);

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
  v7[2] = __56__SiriAnalyticsXPCConnection_runPipelineWithCompletion___block_invoke;
  v7[3] = &unk_1E4357C98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_runPipelineWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD aBlock[5];
  id v20;
  id v21;
  id location;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__SiriAnalyticsXPCConnection__runPipelineWithCompletion___block_invoke;
  aBlock[3] = &unk_1E4357808;
  aBlock[4] = self;
  objc_copyWeak(&v21, &location);
  v6 = v4;
  v20 = v6;
  v7 = _Block_copy(aBlock);
  -[SiriAnalyticsXPCConnection _stopIdleTimer](self, "_stopIdleTimer");
  dispatch_group_enter((dispatch_group_t)self->_xpcPublishingGroup);
  -[SiriAnalyticsXPCConnection _currentConnection](self, "_currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v9 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[SiriAnalyticsXPCConnection _runPipelineWithCompletion:]";
    v25 = 2112;
    v26 = v8;
    _os_log_debug_impl(&dword_1A025F000, v9, OS_LOG_TYPE_DEBUG, "%s Running pipeline for connection: %@", buf, 0x16u);
  }
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __57__SiriAnalyticsXPCConnection__runPipelineWithCompletion___block_invoke_44;
  v17[3] = &unk_1E4357AB8;
  v10 = v7;
  v18 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __57__SiriAnalyticsXPCConnection__runPipelineWithCompletion___block_invoke_45;
  v14[3] = &unk_1E43574E8;
  v12 = v8;
  v15 = v12;
  v13 = v10;
  v16 = v13;
  objc_msgSend(v11, "runPipelineWithCompletion:", v14);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

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
  v7[2] = __64__SiriAnalyticsXPCConnection_purgeStagedMessagesWithCompletion___block_invoke;
  v7[3] = &unk_1E4357C98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_purgeStagedMessagesWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD aBlock[5];
  id v20;
  id v21;
  id location;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__SiriAnalyticsXPCConnection__purgeStagedMessagesWithCompletion___block_invoke;
  aBlock[3] = &unk_1E4357808;
  aBlock[4] = self;
  objc_copyWeak(&v21, &location);
  v6 = v4;
  v20 = v6;
  v7 = _Block_copy(aBlock);
  -[SiriAnalyticsXPCConnection _stopIdleTimer](self, "_stopIdleTimer");
  dispatch_group_enter((dispatch_group_t)self->_xpcPublishingGroup);
  -[SiriAnalyticsXPCConnection _currentConnection](self, "_currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v9 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[SiriAnalyticsXPCConnection _purgeStagedMessagesWithCompletion:]";
    v25 = 2112;
    v26 = v8;
    _os_log_debug_impl(&dword_1A025F000, v9, OS_LOG_TYPE_DEBUG, "%s Purging staged messages connection: %@", buf, 0x16u);
  }
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __65__SiriAnalyticsXPCConnection__purgeStagedMessagesWithCompletion___block_invoke_46;
  v17[3] = &unk_1E4357AB8;
  v10 = v7;
  v18 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __65__SiriAnalyticsXPCConnection__purgeStagedMessagesWithCompletion___block_invoke_47;
  v14[3] = &unk_1E43574E8;
  v12 = v8;
  v15 = v12;
  v13 = v10;
  v16 = v13;
  objc_msgSend(v11, "purgeStagedMessagesWithCompletion:", v14);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (void)_connectionInterrupted
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v3 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SiriAnalyticsXPCConnection _connectionInterrupted]";
    _os_log_debug_impl(&dword_1A025F000, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SiriAnalyticsXPCConnection__connectionInterrupted__block_invoke;
  block[3] = &unk_1E4357B10;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_connectionInvalidated
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v3 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SiriAnalyticsXPCConnection _connectionInvalidated]";
    _os_log_debug_impl(&dword_1A025F000, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SiriAnalyticsXPCConnection__connectionInvalidated__block_invoke;
  block[3] = &unk_1E4357B10;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_cleanupConnection
{
  NSObject *v3;
  NSXPCConnection *connection;
  NSXPCConnection *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v3 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    v6 = 136315138;
    v7 = "-[SiriAnalyticsXPCConnection _cleanupConnection]";
    _os_log_debug_impl(&dword_1A025F000, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }
  connection = self->_connection;
  if (connection)
  {
    -[NSXPCConnection setExportedObject:](connection, "setExportedObject:", 0);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", 0);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", 0);
    -[NSXPCConnection invalidate](self->_connection, "invalidate");
    v5 = self->_connection;
    self->_connection = 0;

  }
}

- (void)_idleTimerFired
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v3 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[SiriAnalyticsXPCConnection _idleTimerFired]";
    _os_log_debug_impl(&dword_1A025F000, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v4, 0xCu);
  }
  -[SiriAnalyticsXPCConnection _stopIdleTimer](self, "_stopIdleTimer");
  -[SiriAnalyticsXPCConnection _cleanupConnection](self, "_cleanupConnection");
}

- (void)dealloc
{
  objc_super v3;

  -[SiriAnalyticsXPCConnection _stopIdleTimer](self, "_stopIdleTimer");
  -[SiriAnalyticsXPCConnection _cleanupConnection](self, "_cleanupConnection");
  v3.receiver = self;
  v3.super_class = (Class)SiriAnalyticsXPCConnection;
  -[SiriAnalyticsXPCConnection dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcPublishingGroup, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
}

void __45__SiriAnalyticsXPCConnection__startIdleTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_idleTimerFired");

}

uint64_t __52__SiriAnalyticsXPCConnection__connectionInvalidated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupConnection");
}

uint64_t __52__SiriAnalyticsXPCConnection__connectionInterrupted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupConnection");
}

void __48__SiriAnalyticsXPCConnection__currentConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInterrupted");

}

void __48__SiriAnalyticsXPCConnection__currentConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInvalidated");

}

void __65__SiriAnalyticsXPCConnection__purgeStagedMessagesWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  char v13;

  v5 = a3;
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__SiriAnalyticsXPCConnection__purgeStagedMessagesWithCompletion___block_invoke_2;
  v9[3] = &unk_1E43577E0;
  objc_copyWeak(&v12, (id *)(a1 + 48));
  v7 = *(id *)(a1 + 40);
  v13 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, v9);

  objc_destroyWeak(&v12);
}

void __65__SiriAnalyticsXPCConnection__purgeStagedMessagesWithCompletion___block_invoke_46(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[SiriAnalyticsXPCConnection _purgeStagedMessagesWithCompletion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_error_impl(&dword_1A025F000, v4, OS_LOG_TYPE_ERROR, "%s Failed to purge staged messages due to %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __65__SiriAnalyticsXPCConnection__purgeStagedMessagesWithCompletion___block_invoke_47(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v6 = SiriAnalyticsLogContextXPC;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(void **)(a1 + 32);
      v8 = 136315394;
      v9 = "-[SiriAnalyticsXPCConnection _purgeStagedMessagesWithCompletion:]_block_invoke";
      v10 = 2112;
      v11 = v7;
      _os_log_debug_impl(&dword_1A025F000, v6, OS_LOG_TYPE_DEBUG, "%s Staged messages purged for connection:%@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    v8 = 136315394;
    v9 = "-[SiriAnalyticsXPCConnection _purgeStagedMessagesWithCompletion:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    _os_log_error_impl(&dword_1A025F000, v6, OS_LOG_TYPE_ERROR, "%s Failed to purge staged messages due to %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __65__SiriAnalyticsXPCConnection__purgeStagedMessagesWithCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_group_t *WeakRetained;
  dispatch_group_t *v3;
  uint64_t v4;
  dispatch_group_t *v5;

  WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  v5 = WeakRetained;
  if (WeakRetained)
  {
    -[dispatch_group_t _startIdleTimer](WeakRetained, "_startIdleTimer");
    dispatch_group_leave(v5[5]);
    v3 = v5;
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
    v3 = v5;
  }

}

uint64_t __64__SiriAnalyticsXPCConnection_purgeStagedMessagesWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgeStagedMessagesWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __57__SiriAnalyticsXPCConnection__runPipelineWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  char v13;

  v5 = a3;
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__SiriAnalyticsXPCConnection__runPipelineWithCompletion___block_invoke_2;
  v9[3] = &unk_1E43577E0;
  objc_copyWeak(&v12, (id *)(a1 + 48));
  v7 = *(id *)(a1 + 40);
  v13 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, v9);

  objc_destroyWeak(&v12);
}

void __57__SiriAnalyticsXPCConnection__runPipelineWithCompletion___block_invoke_44(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[SiriAnalyticsXPCConnection _runPipelineWithCompletion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_error_impl(&dword_1A025F000, v4, OS_LOG_TYPE_ERROR, "%s Failed to run pipeline due to %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __57__SiriAnalyticsXPCConnection__runPipelineWithCompletion___block_invoke_45(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v6 = SiriAnalyticsLogContextXPC;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(void **)(a1 + 32);
      v8 = 136315394;
      v9 = "-[SiriAnalyticsXPCConnection _runPipelineWithCompletion:]_block_invoke";
      v10 = 2112;
      v11 = v7;
      _os_log_debug_impl(&dword_1A025F000, v6, OS_LOG_TYPE_DEBUG, "%s Pipeline ran for connection:%@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    v8 = 136315394;
    v9 = "-[SiriAnalyticsXPCConnection _runPipelineWithCompletion:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    _os_log_error_impl(&dword_1A025F000, v6, OS_LOG_TYPE_ERROR, "%s Failed to run pipeline due to %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __57__SiriAnalyticsXPCConnection__runPipelineWithCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_group_t *WeakRetained;
  dispatch_group_t *v3;
  uint64_t v4;
  dispatch_group_t *v5;

  WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  v5 = WeakRetained;
  if (WeakRetained)
  {
    -[dispatch_group_t _startIdleTimer](WeakRetained, "_startIdleTimer");
    dispatch_group_leave(v5[5]);
    v3 = v5;
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
    v3 = v5;
  }

}

uint64_t __56__SiriAnalyticsXPCConnection_runPipelineWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runPipelineWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __63__SiriAnalyticsXPCConnection__setKillSwitchEnabled_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  char v13;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 16);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__SiriAnalyticsXPCConnection__setKillSwitchEnabled_completion___block_invoke_2;
  v10[3] = &unk_1E4357538;
  v10[4] = v6;
  v13 = a2;
  v11 = v5;
  v12 = v7;
  v9 = v5;
  dispatch_async(v8, v10);

}

void __63__SiriAnalyticsXPCConnection__setKillSwitchEnabled_completion___block_invoke_43(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[SiriAnalyticsXPCConnection _setKillSwitchEnabled:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_error_impl(&dword_1A025F000, v4, OS_LOG_TYPE_ERROR, "%s Failed due to %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __63__SiriAnalyticsXPCConnection__setKillSwitchEnabled_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_startIdleTimer");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __62__SiriAnalyticsXPCConnection_setKillSwitchEnabled_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setKillSwitchEnabled:completion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __68__SiriAnalyticsXPCConnection__fetchKillSwitchEnabledWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  char v13;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 16);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__SiriAnalyticsXPCConnection__fetchKillSwitchEnabledWithCompletion___block_invoke_2;
  v10[3] = &unk_1E4357538;
  v10[4] = v6;
  v13 = a2;
  v11 = v5;
  v12 = v7;
  v9 = v5;
  dispatch_async(v8, v10);

}

void __68__SiriAnalyticsXPCConnection__fetchKillSwitchEnabledWithCompletion___block_invoke_42(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[SiriAnalyticsXPCConnection _fetchKillSwitchEnabledWithCompletion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_error_impl(&dword_1A025F000, v4, OS_LOG_TYPE_ERROR, "%s Failed due to %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __68__SiriAnalyticsXPCConnection__fetchKillSwitchEnabledWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_startIdleTimer");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __67__SiriAnalyticsXPCConnection_fetchKillSwitchEnabledWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchKillSwitchEnabledWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __52__SiriAnalyticsXPCConnection__createTag_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  dispatch_block_t v8;
  _QWORD v9[5];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__SiriAnalyticsXPCConnection__createTag_completion___block_invoke_2;
  v9[3] = &unk_1E4357538;
  v6 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v7 = v5;
  v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_DEFAULT, 0, v9);
  dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16), v8);

}

void __52__SiriAnalyticsXPCConnection__createTag_completion___block_invoke_41(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[SiriAnalyticsXPCConnection _createTag:completion:]_block_invoke";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_error_impl(&dword_1A025F000, v4, OS_LOG_TYPE_ERROR, "%s Failed to tag sensitive condition %@ due to %@", (uint8_t *)&v6, 0x20u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __52__SiriAnalyticsXPCConnection__createTag_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_startIdleTimer");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __51__SiriAnalyticsXPCConnection_createTag_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createTag:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __65__SiriAnalyticsXPCConnection__saveState_forPluginWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__SiriAnalyticsXPCConnection__saveState_forPluginWithCompletion___block_invoke_2;
  v3[3] = &unk_1E4357790;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v5);
}

void __65__SiriAnalyticsXPCConnection__saveState_forPluginWithCompletion___block_invoke_39(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[SiriAnalyticsXPCConnection _saveState:forPluginWithCompletion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_error_impl(&dword_1A025F000, v4, OS_LOG_TYPE_ERROR, "%s Failed to save state due to %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __65__SiriAnalyticsXPCConnection__saveState_forPluginWithCompletion___block_invoke_40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__SiriAnalyticsXPCConnection__saveState_forPluginWithCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_group_t *WeakRetained;
  dispatch_group_t *v3;
  uint64_t v4;
  dispatch_group_t *v5;

  WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  v5 = WeakRetained;
  if (WeakRetained)
  {
    -[dispatch_group_t _startIdleTimer](WeakRetained, "_startIdleTimer");
    dispatch_group_leave(v5[5]);
    v3 = v5;
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    (*(void (**)(uint64_t, dispatch_group_t *))(v4 + 16))(v4, v3);
    v3 = v5;
  }

}

uint64_t __64__SiriAnalyticsXPCConnection_saveState_forPluginWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveState:forPluginWithCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __65__SiriAnalyticsXPCConnection__fetchStateForPluginWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__SiriAnalyticsXPCConnection__fetchStateForPluginWithCompletion___block_invoke_2;
  block[3] = &unk_1E4357A48;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v10);
}

void __65__SiriAnalyticsXPCConnection__fetchStateForPluginWithCompletion___block_invoke_37(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[SiriAnalyticsXPCConnection _fetchStateForPluginWithCompletion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_error_impl(&dword_1A025F000, v4, OS_LOG_TYPE_ERROR, "%s Failed to fetch state due to %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __65__SiriAnalyticsXPCConnection__fetchStateForPluginWithCompletion___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__SiriAnalyticsXPCConnection__fetchStateForPluginWithCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_group_t *WeakRetained;
  dispatch_group_t *v3;
  uint64_t v4;
  dispatch_group_t *v5;

  WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  v5 = WeakRetained;
  if (WeakRetained)
  {
    -[dispatch_group_t _startIdleTimer](WeakRetained, "_startIdleTimer");
    dispatch_group_leave(v5[5]);
    v3 = v5;
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 32));
    v3 = v5;
  }

}

uint64_t __64__SiriAnalyticsXPCConnection_fetchStateForPluginWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchStateForPluginWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __41__SiriAnalyticsXPCConnection__fetchTags___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  char v18;

  v7 = a3;
  v8 = a4;
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SiriAnalyticsXPCConnection__fetchTags___block_invoke_2;
  block[3] = &unk_1E4357588;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  v10 = *(id *)(a1 + 40);
  v15 = v8;
  v16 = v10;
  v18 = a2;
  v14 = v7;
  v11 = v8;
  v12 = v7;
  dispatch_async(v9, block);

  objc_destroyWeak(&v17);
}

void __41__SiriAnalyticsXPCConnection__fetchTags___block_invoke_35(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[SiriAnalyticsXPCConnection _fetchTags:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_error_impl(&dword_1A025F000, v4, OS_LOG_TYPE_ERROR, "%s Failed to fetch tags due to %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __41__SiriAnalyticsXPCConnection__fetchTags___block_invoke_2(uint64_t a1)
{
  dispatch_group_t *WeakRetained;
  dispatch_group_t *v3;
  uint64_t v4;
  dispatch_group_t *v5;

  WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  v5 = WeakRetained;
  if (WeakRetained)
  {
    -[dispatch_group_t _startIdleTimer](WeakRetained, "_startIdleTimer");
    dispatch_group_leave(v5[5]);
    v3 = v5;
  }
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v4 + 16))(v4, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v3 = v5;
  }

}

uint64_t __40__SiriAnalyticsXPCConnection_fetchTags___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchTags:", *(_QWORD *)(a1 + 40));
}

void __64__SiriAnalyticsXPCConnection__fetchLogicalClocksWithCompletion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  char v18;

  v7 = a3;
  v8 = a4;
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SiriAnalyticsXPCConnection__fetchLogicalClocksWithCompletion___block_invoke_2;
  block[3] = &unk_1E4357588;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  v10 = *(id *)(a1 + 40);
  v15 = v8;
  v16 = v10;
  v18 = a2;
  v14 = v7;
  v11 = v8;
  v12 = v7;
  dispatch_async(v9, block);

  objc_destroyWeak(&v17);
}

void __64__SiriAnalyticsXPCConnection__fetchLogicalClocksWithCompletion___block_invoke_33(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[SiriAnalyticsXPCConnection _fetchLogicalClocksWithCompletion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_error_impl(&dword_1A025F000, v4, OS_LOG_TYPE_ERROR, "%s Failed to fetch logical clocks due to %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __64__SiriAnalyticsXPCConnection__fetchLogicalClocksWithCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_group_t *WeakRetained;
  dispatch_group_t *v3;
  uint64_t v4;
  dispatch_group_t *v5;

  WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  v5 = WeakRetained;
  if (WeakRetained)
  {
    -[dispatch_group_t _startIdleTimer](WeakRetained, "_startIdleTimer");
    dispatch_group_leave(v5[5]);
    v3 = v5;
  }
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v4 + 16))(v4, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v3 = v5;
  }

}

uint64_t __63__SiriAnalyticsXPCConnection_fetchLogicalClocksWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLogicalClocksWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __64__SiriAnalyticsXPCConnection__vendResource_readonly_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SiriAnalyticsXPCConnection__vendResource_readonly_completion___block_invoke_2;
  block[3] = &unk_1E4357678;
  objc_copyWeak(&v20, (id *)(a1 + 48));
  v11 = *(id *)(a1 + 40);
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v19 = v11;
  v12 = v9;
  v13 = v8;
  v14 = v7;
  dispatch_async(v10, block);

  objc_destroyWeak(&v20);
}

void __64__SiriAnalyticsXPCConnection__vendResource_readonly_completion___block_invoke_30(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[SiriAnalyticsXPCConnection _vendResource:readonly:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_error_impl(&dword_1A025F000, v4, OS_LOG_TYPE_ERROR, "%s Failed to vend sandbox extension due to %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __64__SiriAnalyticsXPCConnection__vendResource_readonly_completion___block_invoke_31(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  v9 = a3;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v10 = SiriAnalyticsLogContextXPC;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 136315650;
      v13 = "-[SiriAnalyticsXPCConnection _vendResource:readonly:completion:]_block_invoke";
      v14 = 2112;
      v15 = v7;
      v16 = 2112;
      v17 = v11;
      _os_log_debug_impl(&dword_1A025F000, v10, OS_LOG_TYPE_DEBUG, "%s Sandbox extension vended successfully (token: %@) for %@", (uint8_t *)&v12, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    v12 = 136315394;
    v13 = "-[SiriAnalyticsXPCConnection _vendResource:readonly:completion:]_block_invoke";
    v14 = 2112;
    v15 = v8;
    _os_log_error_impl(&dword_1A025F000, v10, OS_LOG_TYPE_ERROR, "%s Failed to vend sandbox extension due to %@", (uint8_t *)&v12, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __64__SiriAnalyticsXPCConnection__vendResource_readonly_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_t *WeakRetained;
  dispatch_group_t *v3;
  uint64_t v4;
  dispatch_group_t *v5;

  WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  v5 = WeakRetained;
  if (WeakRetained)
  {
    -[dispatch_group_t _startIdleTimer](WeakRetained, "_startIdleTimer");
    dispatch_group_leave(v5[5]);
    v3 = v5;
  }
  v4 = *(_QWORD *)(a1 + 56);
  if (v4)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v3 = v5;
  }

}

uint64_t __63__SiriAnalyticsXPCConnection_vendResource_readonly_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_vendResource:readonly:completion:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

void __84__SiriAnalyticsXPCConnection__vendSandboxExtensionWithResource_readonly_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__SiriAnalyticsXPCConnection__vendSandboxExtensionWithResource_readonly_completion___block_invoke_2;
  v11[3] = &unk_1E4357600;
  objc_copyWeak(&v15, (id *)(a1 + 48));
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, v11);

  objc_destroyWeak(&v15);
}

void __84__SiriAnalyticsXPCConnection__vendSandboxExtensionWithResource_readonly_completion___block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[SiriAnalyticsXPCConnection _vendSandboxExtensionWithResource:readonly:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_error_impl(&dword_1A025F000, v4, OS_LOG_TYPE_ERROR, "%s Failed to vend sandbox extension due to %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __84__SiriAnalyticsXPCConnection__vendSandboxExtensionWithResource_readonly_completion___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v7 = SiriAnalyticsLogContextXPC;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 136315650;
      v10 = "-[SiriAnalyticsXPCConnection _vendSandboxExtensionWithResource:readonly:completion:]_block_invoke";
      v11 = 2112;
      v12 = v5;
      v13 = 2112;
      v14 = v8;
      _os_log_debug_impl(&dword_1A025F000, v7, OS_LOG_TYPE_DEBUG, "%s Sandbox extension vended successfully (token: %@) for %@", (uint8_t *)&v9, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    v9 = 136315394;
    v10 = "-[SiriAnalyticsXPCConnection _vendSandboxExtensionWithResource:readonly:completion:]_block_invoke";
    v11 = 2112;
    v12 = v6;
    _os_log_error_impl(&dword_1A025F000, v7, OS_LOG_TYPE_ERROR, "%s Failed to vend sandbox extension due to %@", (uint8_t *)&v9, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __84__SiriAnalyticsXPCConnection__vendSandboxExtensionWithResource_readonly_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_t *WeakRetained;
  dispatch_group_t *v3;
  uint64_t v4;
  dispatch_group_t *v5;

  WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  v5 = WeakRetained;
  if (WeakRetained)
  {
    -[dispatch_group_t _startIdleTimer](WeakRetained, "_startIdleTimer");
    dispatch_group_leave(v5[5]);
    v3 = v5;
  }
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v3 = v5;
  }

}

uint64_t __83__SiriAnalyticsXPCConnection_vendSandboxExtensionWithResource_readonly_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_vendSandboxExtensionWithResource:readonly:completion:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

void __63__SiriAnalyticsXPCConnection__resetLogicalClockWithCompletion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  char v18;

  v7 = a3;
  v8 = a4;
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SiriAnalyticsXPCConnection__resetLogicalClockWithCompletion___block_invoke_2;
  block[3] = &unk_1E4357588;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  v10 = *(id *)(a1 + 40);
  v15 = v8;
  v16 = v10;
  v18 = a2;
  v14 = v7;
  v11 = v8;
  v12 = v7;
  dispatch_async(v9, block);

  objc_destroyWeak(&v17);
}

void __63__SiriAnalyticsXPCConnection__resetLogicalClockWithCompletion___block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[SiriAnalyticsXPCConnection _resetLogicalClockWithCompletion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_error_impl(&dword_1A025F000, v4, OS_LOG_TYPE_ERROR, "%s Failed to reset logical clock due to %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __63__SiriAnalyticsXPCConnection__resetLogicalClockWithCompletion___block_invoke_25(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v9 = SiriAnalyticsLogContextXPC;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 136315650;
      v12 = "-[SiriAnalyticsXPCConnection _resetLogicalClockWithCompletion:]_block_invoke";
      v13 = 2112;
      v14 = v7;
      v15 = 2112;
      v16 = v10;
      _os_log_debug_impl(&dword_1A025F000, v9, OS_LOG_TYPE_DEBUG, "%s Logical clock: %@ reset for connection:%@", (uint8_t *)&v11, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    v11 = 136315394;
    v12 = "-[SiriAnalyticsXPCConnection _resetLogicalClockWithCompletion:]_block_invoke";
    v13 = 2112;
    v14 = v8;
    _os_log_error_impl(&dword_1A025F000, v9, OS_LOG_TYPE_ERROR, "%s Failed to reset logical clock due to %@", (uint8_t *)&v11, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __63__SiriAnalyticsXPCConnection__resetLogicalClockWithCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_group_t *WeakRetained;
  dispatch_group_t *v3;
  uint64_t v4;
  dispatch_group_t *v5;

  WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  v5 = WeakRetained;
  if (WeakRetained)
  {
    -[dispatch_group_t _startIdleTimer](WeakRetained, "_startIdleTimer");
    dispatch_group_leave(v5[5]);
    v3 = v5;
  }
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v4 + 16))(v4, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v3 = v5;
  }

}

uint64_t __62__SiriAnalyticsXPCConnection_resetLogicalClockWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetLogicalClockWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __69__SiriAnalyticsXPCConnection__sensitiveCondition_endedAt_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  char v13;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 16);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__SiriAnalyticsXPCConnection__sensitiveCondition_endedAt_completion___block_invoke_2;
  v10[3] = &unk_1E4357538;
  v10[4] = v6;
  v13 = a2;
  v11 = v5;
  v12 = v7;
  v9 = v5;
  dispatch_async(v8, v10);

}

void __69__SiriAnalyticsXPCConnection__sensitiveCondition_endedAt_completion___block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    v5 = *(int *)(a1 + 40);
    v6 = 136315650;
    v7 = "-[SiriAnalyticsXPCConnection _sensitiveCondition:endedAt:completion:]_block_invoke";
    v8 = 2048;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_error_impl(&dword_1A025F000, v4, OS_LOG_TYPE_ERROR, "%s Failed to end sensitive condition %lu due to %@", (uint8_t *)&v6, 0x20u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __69__SiriAnalyticsXPCConnection__sensitiveCondition_endedAt_completion___block_invoke_22(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sensitiveCondition:endedAt:completion:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __69__SiriAnalyticsXPCConnection__sensitiveCondition_endedAt_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_startIdleTimer");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __68__SiriAnalyticsXPCConnection_sensitiveCondition_endedAt_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sensitiveCondition:endedAt:completion:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __71__SiriAnalyticsXPCConnection__sensitiveCondition_startedAt_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  dispatch_block_t v8;
  _QWORD v9[5];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__SiriAnalyticsXPCConnection__sensitiveCondition_startedAt_completion___block_invoke_2;
  v9[3] = &unk_1E4357538;
  v6 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v7 = v5;
  v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_DEFAULT, 0, v9);
  dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16), v8);

}

void __71__SiriAnalyticsXPCConnection__sensitiveCondition_startedAt_completion___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    v5 = *(int *)(a1 + 40);
    v6 = 136315650;
    v7 = "-[SiriAnalyticsXPCConnection _sensitiveCondition:startedAt:completion:]_block_invoke";
    v8 = 2048;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_error_impl(&dword_1A025F000, v4, OS_LOG_TYPE_ERROR, "%s Failed to start sensitive condition %lu due to %@", (uint8_t *)&v6, 0x20u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __71__SiriAnalyticsXPCConnection__sensitiveCondition_startedAt_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_startIdleTimer");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __70__SiriAnalyticsXPCConnection_sensitiveCondition_startedAt_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sensitiveCondition:startedAt:completion:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __52__SiriAnalyticsXPCConnection_barrierWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v2 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[SiriAnalyticsXPCConnection barrierWithCompletion:]_block_invoke";
    _os_log_debug_impl(&dword_1A025F000, v2, OS_LOG_TYPE_DEBUG, "%s exiting barrier", (uint8_t *)&v4, 0xCu);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __79__SiriAnalyticsXPCConnection__publishLargeMessageToRemote_attempts_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__SiriAnalyticsXPCConnection__publishLargeMessageToRemote_attempts_completion___block_invoke_2;
  block[3] = &unk_1E4357CE8;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

void __79__SiriAnalyticsXPCConnection__publishLargeMessageToRemote_attempts_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  dispatch_time_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    v12 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 136315650;
    v19 = "-[SiriAnalyticsXPCConnection _publishLargeMessageToRemote:attempts:completion:]_block_invoke_3";
    v20 = 2112;
    v21 = v3;
    v22 = 2048;
    v23 = v12;
    _os_log_error_impl(&dword_1A025F000, v4, OS_LOG_TYPE_ERROR, "%s Failed to send large message due to %@. (attempts = %tu)", buf, 0x20u);
  }
  if (*(_QWORD *)(a1 + 64) > 2uLL)
  {
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v11 = SiriAnalyticsLogContextXPC;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
    {
      v13 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      v19 = "-[SiriAnalyticsXPCConnection _publishLargeMessageToRemote:attempts:completion:]_block_invoke_2";
      v20 = 2112;
      v21 = v13;
      _os_log_error_impl(&dword_1A025F000, v11, OS_LOG_TYPE_ERROR, "%s Dropping %@ because the maximum number of retries was reached.", buf, 0x16u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v5 = dispatch_time(0, 1000000000);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v8 = *(NSObject **)(v6 + 16);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __79__SiriAnalyticsXPCConnection__publishLargeMessageToRemote_attempts_completion___block_invoke_17;
    v14[3] = &unk_1E4357498;
    v14[4] = v6;
    v9 = v7;
    v10 = *(_QWORD *)(a1 + 64);
    v15 = v9;
    v17 = v10;
    v16 = *(id *)(a1 + 48);
    dispatch_after(v5, v8, v14);

  }
}

uint64_t __79__SiriAnalyticsXPCConnection__publishLargeMessageToRemote_attempts_completion___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __79__SiriAnalyticsXPCConnection__publishLargeMessageToRemote_attempts_completion___block_invoke_17(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_publishLargeMessageToRemote:attempts:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56) + 1, *(_QWORD *)(a1 + 48));
}

uint64_t __79__SiriAnalyticsXPCConnection__publishLargeMessageToRemote_attempts_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

void __62__SiriAnalyticsXPCConnection__publishLargeMessage_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_startIdleTimer");
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

uint64_t __61__SiriAnalyticsXPCConnection_publishLargeMessage_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_publishLargeMessage:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __75__SiriAnalyticsXPCConnection__resolveMessagesAtRemote_attempts_completion___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__SiriAnalyticsXPCConnection__resolveMessagesAtRemote_attempts_completion___block_invoke_2;
  block[3] = &unk_1E4357C20;
  v4 = v1;
  dispatch_async(v2, block);

}

void __75__SiriAnalyticsXPCConnection__resolveMessagesAtRemote_attempts_completion___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  dispatch_time_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v4 = (void *)SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    v12 = *(void **)(a1 + 32);
    v13 = v4;
    v14 = objc_msgSend(v12, "count");
    v15 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 136315906;
    v22 = "-[SiriAnalyticsXPCConnection _resolveMessagesAtRemote:attempts:completion:]_block_invoke";
    v23 = 2048;
    v24 = v14;
    v25 = 2112;
    v26 = v3;
    v27 = 2048;
    v28 = v15;
    _os_log_error_impl(&dword_1A025F000, v13, OS_LOG_TYPE_ERROR, "%s Failed to send %tu unresolved messages due to %@. (attempts = %tu)", buf, 0x2Au);

  }
  if (*(_QWORD *)(a1 + 64) > 2uLL)
  {
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v11 = SiriAnalyticsLogContextXPC;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v22 = "-[SiriAnalyticsXPCConnection _resolveMessagesAtRemote:attempts:completion:]_block_invoke_2";
      v23 = 2112;
      v24 = v16;
      _os_log_error_impl(&dword_1A025F000, v11, OS_LOG_TYPE_ERROR, "%s Dropping %@ because the maximum number of retries was reached.", buf, 0x16u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v5 = dispatch_time(0, 1000000000);
    v7 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = *(NSObject **)(v6 + 16);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __75__SiriAnalyticsXPCConnection__resolveMessagesAtRemote_attempts_completion___block_invoke_10;
    v17[3] = &unk_1E4357498;
    v17[4] = v6;
    v9 = v7;
    v10 = *(_QWORD *)(a1 + 64);
    v18 = v9;
    v20 = v10;
    v19 = *(id *)(a1 + 48);
    dispatch_after(v5, v8, v17);

  }
}

uint64_t __75__SiriAnalyticsXPCConnection__resolveMessagesAtRemote_attempts_completion___block_invoke_12(_QWORD *a1)
{
  void *v2;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v2 = (void *)SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    v4 = (void *)a1[4];
    v5 = v2;
    v6 = objc_msgSend(v4, "count");
    v7 = a1[5];
    v8 = 136315650;
    v9 = "-[SiriAnalyticsXPCConnection _resolveMessagesAtRemote:attempts:completion:]_block_invoke";
    v10 = 2048;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_debug_impl(&dword_1A025F000, v5, OS_LOG_TYPE_DEBUG, "%s Resolved %lu messages to connection %@", (uint8_t *)&v8, 0x20u);

  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __75__SiriAnalyticsXPCConnection__resolveMessagesAtRemote_attempts_completion___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resolveMessagesAtRemote:attempts:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56) + 1, *(_QWORD *)(a1 + 48));
}

uint64_t __75__SiriAnalyticsXPCConnection__resolveMessagesAtRemote_attempts_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __58__SiriAnalyticsXPCConnection__resolveMessages_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_startIdleTimer");
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __57__SiriAnalyticsXPCConnection_resolveMessages_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resolveMessages:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __76__SiriAnalyticsXPCConnection__publishUnorderedMessages_attempts_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 16);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__SiriAnalyticsXPCConnection__publishUnorderedMessages_attempts_completion___block_invoke_2;
  v4[3] = &unk_1E4357C98;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

void __76__SiriAnalyticsXPCConnection__publishUnorderedMessages_attempts_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  dispatch_time_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v4 = (void *)SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    v12 = *(void **)(a1 + 32);
    v13 = v4;
    v14 = objc_msgSend(v12, "count");
    v15 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 136315906;
    v22 = "-[SiriAnalyticsXPCConnection _publishUnorderedMessages:attempts:completion:]_block_invoke_3";
    v23 = 2048;
    v24 = v14;
    v25 = 2112;
    v26 = v3;
    v27 = 2048;
    v28 = v15;
    _os_log_error_impl(&dword_1A025F000, v13, OS_LOG_TYPE_ERROR, "%s Failed to send %tu messages due to %@. (attempts = %tu)", buf, 0x2Au);

  }
  if (*(_QWORD *)(a1 + 64) > 2uLL)
  {
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v11 = SiriAnalyticsLogContextXPC;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v22 = "-[SiriAnalyticsXPCConnection _publishUnorderedMessages:attempts:completion:]_block_invoke_2";
      v23 = 2112;
      v24 = v16;
      _os_log_error_impl(&dword_1A025F000, v11, OS_LOG_TYPE_ERROR, "%s Dropping %@ because the maximum number of retries was reached.", buf, 0x16u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v5 = dispatch_time(0, 1000000000);
    v7 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = *(NSObject **)(v6 + 16);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __76__SiriAnalyticsXPCConnection__publishUnorderedMessages_attempts_completion___block_invoke_6;
    v17[3] = &unk_1E4357498;
    v17[4] = v6;
    v9 = v7;
    v10 = *(_QWORD *)(a1 + 64);
    v18 = v9;
    v20 = v10;
    v19 = *(id *)(a1 + 48);
    dispatch_after(v5, v8, v17);

  }
}

uint64_t __76__SiriAnalyticsXPCConnection__publishUnorderedMessages_attempts_completion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__SiriAnalyticsXPCConnection__publishUnorderedMessages_attempts_completion___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_publishUnorderedMessages:attempts:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56) + 1, *(_QWORD *)(a1 + 48));
}

uint64_t __76__SiriAnalyticsXPCConnection__publishUnorderedMessages_attempts_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_startIdleTimer");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __66__SiriAnalyticsXPCConnection_publishUnorderedMessages_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_publishUnorderedMessages:attempts:completion:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

void __75__SiriAnalyticsXPCConnection__publishMessagesToRemote_attempts_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  dispatch_time_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v4 = (void *)SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    v12 = *(void **)(a1 + 32);
    v13 = v4;
    v14 = objc_msgSend(v12, "count");
    v15 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 136315906;
    v22 = "-[SiriAnalyticsXPCConnection _publishMessagesToRemote:attempts:completion:]_block_invoke_3";
    v23 = 2048;
    v24 = v14;
    v25 = 2112;
    v26 = v3;
    v27 = 2048;
    v28 = v15;
    _os_log_error_impl(&dword_1A025F000, v13, OS_LOG_TYPE_ERROR, "%s Failed to send %tu messages due to %@. (attempts = %tu)", buf, 0x2Au);

  }
  if (*(_QWORD *)(a1 + 64) > 2uLL)
  {
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v11 = SiriAnalyticsLogContextXPC;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v22 = "-[SiriAnalyticsXPCConnection _publishMessagesToRemote:attempts:completion:]_block_invoke_2";
      v23 = 2112;
      v24 = v16;
      _os_log_error_impl(&dword_1A025F000, v11, OS_LOG_TYPE_ERROR, "%s Dropping %@ because the maximum number of retries was reached.", buf, 0x16u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v5 = dispatch_time(0, 1000000000);
    v7 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = *(NSObject **)(v6 + 16);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __75__SiriAnalyticsXPCConnection__publishMessagesToRemote_attempts_completion___block_invoke_2;
    v17[3] = &unk_1E4357498;
    v17[4] = v6;
    v9 = v7;
    v10 = *(_QWORD *)(a1 + 64);
    v18 = v9;
    v20 = v10;
    v19 = *(id *)(a1 + 48);
    dispatch_after(v5, v8, v17);

  }
}

@end
