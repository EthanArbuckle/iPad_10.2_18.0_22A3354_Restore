@implementation TCSCallCenter

- (TCSCallCenter)init
{
  TCSCallCenter *v2;
  uint64_t v3;
  NSXPCConnection *connection;
  NSXPCConnection *v5;
  void *v6;
  NSXPCConnection *v7;
  void *v8;
  NSXPCConnection *v9;
  uint64_t v10;
  NSXPCConnection *v11;
  NSObject *v12;
  TCSCall *call;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id from;
  id location;
  objc_super v24;
  uint8_t buf[4];
  TCSCall *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)TCSCallCenter;
  v2 = -[TCSCallCenter init](&v24, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.tincan.server"), 0);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    v5 = v2->_connection;
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254BA16E8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", v6);

    v7 = v2->_connection;
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254BA1968);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v7, "setExportedInterface:", v8);

    -[NSXPCConnection setExportedObject:](v2->_connection, "setExportedObject:", v2);
    objc_initWeak(&location, v2);
    objc_initWeak(&from, v2->_connection);
    v9 = v2->_connection;
    v10 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __21__TCSCallCenter_init__block_invoke;
    v20[3] = &unk_24CFC2448;
    objc_copyWeak(&v21, &location);
    -[NSXPCConnection setInvalidationHandler:](v9, "setInvalidationHandler:", v20);
    v11 = v2->_connection;
    v15 = v10;
    v16 = 3221225472;
    v17 = __21__TCSCallCenter_init__block_invoke_102;
    v18 = &unk_24CFC2448;
    objc_copyWeak(&v19, &from);
    -[NSXPCConnection setInterruptionHandler:](v11, "setInterruptionHandler:", &v15);
    -[NSXPCConnection resume](v2->_connection, "resume", v15, v16, v17, v18);
    -[TCSCallCenter synchronouslyFetchCall](v2, "synchronouslyFetchCall");
    _TCSInitializeLogging();
    v12 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      call = v2->_call;
      *(_DWORD *)buf = 138412290;
      v26 = call;
      _os_log_impl(&dword_21342E000, v12, OS_LOG_TYPE_DEFAULT, "TCSCallCenter (init) now tracking call: %@", buf, 0xCu);
    }
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __21__TCSCallCenter_init__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _TCSInitializeLogging();
    v2 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v3 = WeakRetained[1];
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_21342E000, v2, OS_LOG_TYPE_DEFAULT, "TCSCallCenter connection invalidation handler called for %@", (uint8_t *)&v5, 0xCu);
    }
    v4 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;

  }
}

void __21__TCSCallCenter_init__block_invoke_102(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _TCSInitializeLogging();
    v2 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = WeakRetained;
      _os_log_impl(&dword_21342E000, v2, OS_LOG_TYPE_DEFAULT, "TCSCallCenter connection interruption handler called for %@", (uint8_t *)&v3, 0xCu);
    }
    objc_msgSend(WeakRetained, "invalidate");
  }

}

- (void)invalidate
{
  NSObject *v3;
  uint8_t v4[16];

  _TCSInitializeLogging();
  v3 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21342E000, v3, OS_LOG_TYPE_DEFAULT, "TCSCallCenter explicitly invalidating connection.", v4, 2u);
  }
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
}

- (BOOL)hasValidConnection
{
  return self->_connection != 0;
}

- (id)_callPassingPredicate:(id)a3
{
  TCSCall *call;

  if ((*((unsigned int (**)(id, TCSCall *))a3 + 2))(a3, self->_call))
    call = self->_call;
  else
    call = 0;
  return call;
}

- (void)synchronouslyFetchCall
{
  void *v3;
  _QWORD v4[5];

  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_104);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __39__TCSCallCenter_synchronouslyFetchCall__block_invoke_105;
  v4[3] = &unk_24CFC2958;
  v4[4] = self;
  objc_msgSend(v3, "getCall:", v4);

}

void __39__TCSCallCenter_synchronouslyFetchCall__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (v2)
  {
    _TCSInitializeLogging();
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
      __39__TCSCallCenter_synchronouslyFetchCall__block_invoke_cold_1();
  }

}

void __39__TCSCallCenter_synchronouslyFetchCall__block_invoke_105(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setCallCenter:");
  _TCSInitializeLogging();
  v5 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_21342E000, v5, OS_LOG_TYPE_DEFAULT, "TCSCallCenter synchronously fetched call: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (id)ringingCall
{
  void *v2;
  NSObject *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  -[TCSCallCenter _callPassingPredicate:](self, "_callPassingPredicate:", &__block_literal_global_99);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    _TCSInitializeLogging();
    v3 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_impl(&dword_21342E000, v3, OS_LOG_TYPE_DEFAULT, "TCSCallCenter has a ringing call: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  return v2;
}

- (id)activeCall
{
  void *v2;
  NSObject *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  -[TCSCallCenter _callPassingPredicate:](self, "_callPassingPredicate:", &__block_literal_global_2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    _TCSInitializeLogging();
    v3 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_impl(&dword_21342E000, v3, OS_LOG_TYPE_DEFAULT, "TCSCallCenter has an active call: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  return v2;
}

- (id)currentCall
{
  void *v2;
  NSObject *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  -[TCSCallCenter _callPassingPredicate:](self, "_callPassingPredicate:", &__block_literal_global_97);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    _TCSInitializeLogging();
    v3 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_impl(&dword_21342E000, v3, OS_LOG_TYPE_DEFAULT, "TCSCallCenter has a current call: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  return v2;
}

- (id)endingCall
{
  return -[TCSCallCenter _callPassingPredicate:](self, "_callPassingPredicate:", &__block_literal_global_98);
}

- (void)sessionViewControllerViewDidAppear
{
  id v2;

  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionViewControllerViewDidAppear");

}

- (void)queryIsTinCannable:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint8_t buf[16];

  v4 = a3;
  if (+[TCSBehavior isRunningInStoreDemoModeOrSimulator](TCSBehavior, "isRunningInStoreDemoModeOrSimulator"))
  {
    _TCSInitializeLogging();
    v5 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21342E000, v5, OS_LOG_TYPE_DEFAULT, "Skipping invitation IDS query since we are running in store demo mode or the simulator.", buf, 2u);
    }
    v6 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didReceiveCallFromContact:date:", v4, v7);

  }
  else
  {
    -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "queryIsTinCannable:", v4);

  }
}

- (void)completeInvitationFlowForContact:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  id v5;

  connection = self->_connection;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "completeInvitationFlowForContact:", v4);

}

- (void)logEntryForCallWithUniqueProxyIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  NSXPCConnection *connection;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  connection = self->_connection;
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __69__TCSCallCenter_logEntryForCallWithUniqueProxyIdentifier_completion___block_invoke;
  v15[3] = &unk_24CFC2980;
  v9 = v6;
  v16 = v9;
  v10 = a3;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __69__TCSCallCenter_logEntryForCallWithUniqueProxyIdentifier_completion___block_invoke_111;
  v13[3] = &unk_24CFC29A8;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "getLogEntryForCallWithUniqueProxyIdentifier:completion:", v10, v13);

}

void __69__TCSCallCenter_logEntryForCallWithUniqueProxyIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (v3)
  {
    _TCSInitializeLogging();
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
      __69__TCSCallCenter_logEntryForCallWithUniqueProxyIdentifier_completion___block_invoke_cold_1();
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      v5 = (void *)objc_opt_new();
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

    }
  }

}

uint64_t __69__TCSCallCenter_logEntryForCallWithUniqueProxyIdentifier_completion___block_invoke_111(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setUplinkMuted:(BOOL)a3 for:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  dispatch_time_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD block[4];
  id v19;
  _QWORD *v20;
  _QWORD v21[3];
  char v22;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  v10 = dispatch_time(0, 100000000);
  v11 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__TCSCallCenter_setUplinkMuted_for_completion___block_invoke;
  block[3] = &unk_24CFC29D0;
  v20 = v21;
  v12 = v9;
  v19 = v12;
  dispatch_after(v10, MEMORY[0x24BDAC9B8], block);
  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __47__TCSCallCenter_setUplinkMuted_for_completion___block_invoke_112;
  v15[3] = &unk_24CFC29D0;
  v17 = v21;
  v14 = v12;
  v16 = v14;
  objc_msgSend(v13, "setUplinkMuted:for:completion:", v6, v8, v15);

  _Block_object_dispose(v21, 8);
}

uint64_t __47__TCSCallCenter_setUplinkMuted_for_completion___block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v1 = result;
    _TCSInitializeLogging();
    v2 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 136315138;
      v4 = "-[TCSCallCenter setUplinkMuted:for:completion:]_block_invoke";
      _os_log_impl(&dword_21342E000, v2, OS_LOG_TYPE_DEFAULT, "Timed out waiting for completion to fire for %s, manually firing", (uint8_t *)&v3, 0xCu);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = 1;
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

uint64_t __47__TCSCallCenter_setUplinkMuted_for_completion___block_invoke_112(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v1 = result;
    _TCSInitializeLogging();
    v2 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 136315138;
      v4 = "-[TCSCallCenter setUplinkMuted:for:completion:]_block_invoke";
      _os_log_impl(&dword_21342E000, v2, OS_LOG_TYPE_DEFAULT, "Calling completion for %s", (uint8_t *)&v3, 0xCu);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = 1;
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

- (void)disconnectCall:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  id v5;

  connection = self->_connection;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "disconnectCall:", v4);

}

- (void)callStatusChanged:(id)a3
{
  id v5;
  NSObject *v6;
  TCSCall *call;
  void *v8;
  int v9;
  TCSCall *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_call, a3);
  -[TCSCall setCallCenter:](self->_call, "setCallCenter:", self);
  _TCSInitializeLogging();
  v6 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    call = self->_call;
    v9 = 138412290;
    v10 = call;
    _os_log_impl(&dword_21342E000, v6, OS_LOG_TYPE_DEFAULT, "TCSCallCenter (callStatusChanged) now tracking call: %@", (uint8_t *)&v9, 0xCu);
  }
  -[TCSCallCenter delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "callStatusChanged:", v5);

}

- (void)callConnected:(id)a3
{
  id v5;
  NSObject *v6;
  TCSCall *call;
  void *v8;
  int v9;
  TCSCall *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_call, a3);
  -[TCSCall setCallCenter:](self->_call, "setCallCenter:", self);
  _TCSInitializeLogging();
  v6 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    call = self->_call;
    v9 = 138412290;
    v10 = call;
    _os_log_impl(&dword_21342E000, v6, OS_LOG_TYPE_DEFAULT, "TCSCallCenter (callConnected) now tracking call: %@", (uint8_t *)&v9, 0xCu);
  }
  -[TCSCallCenter delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "callConnected:", v5);

}

- (void)remoteUplinkMuteChanged:(id)a3
{
  id v5;
  NSObject *v6;
  TCSCall *call;
  void *v8;
  int v9;
  TCSCall *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_call, a3);
  -[TCSCall setCallCenter:](self->_call, "setCallCenter:", self);
  _TCSInitializeLogging();
  v6 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    call = self->_call;
    v9 = 138412290;
    v10 = call;
    _os_log_impl(&dword_21342E000, v6, OS_LOG_TYPE_DEFAULT, "TCSCallCenter (remoteUplinkMuteChanged) now tracking call: %@", (uint8_t *)&v9, 0xCu);
  }
  -[TCSCallCenter delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteUplinkMuteChanged:", v5);

}

- (TCSCallCenterDelegate)delegate
{
  return (TCSCallCenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_call, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __39__TCSCallCenter_synchronouslyFetchCall__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_21342E000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_1();
}

void __69__TCSCallCenter_logEntryForCallWithUniqueProxyIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_21342E000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_1();
}

@end
