@implementation MCCCategoryRulesController

- (MCCCategoryRulesController)init
{
  MCCCategoryRulesController *v2;
  uint64_t v3;
  NSXPCListener *callbackListener;
  MCCSecretAgentController *v5;
  MCCSecretAgentController *agentController;
  MCCBgTimer *v7;
  id *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  _QWORD v13[4];
  id *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MCCCategoryRulesController;
  v2 = -[MCCCategoryRulesController init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
    v3 = objc_claimAutoreleasedReturnValue();
    callbackListener = v2->_callbackListener;
    v2->_callbackListener = (NSXPCListener *)v3;

    -[NSXPCListener setDelegate:](v2->_callbackListener, "setDelegate:", v2);
    v5 = -[MCCSecretAgentController initWithCallbackListener:]([MCCSecretAgentController alloc], "initWithCallbackListener:", v2->_callbackListener);
    agentController = v2->_agentController;
    v2->_agentController = v5;

    v7 = [MCCBgTimer alloc];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __34__MCCCategoryRulesController_init__block_invoke;
    v13[3] = &unk_251C899D8;
    v8 = v2;
    v14 = v8;
    v9 = -[MCCBgTimer initWithTimeIntervalSinceNow:block:](v7, "initWithTimeIntervalSinceNow:block:", v13, 630.0);
    v10 = v8[4];
    v8[4] = (id)v9;

    objc_msgSend(v8[4], "start");
    _MCCLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[MCCCategoryRulesController init].cold.1();

  }
  return v2;
}

void __34__MCCCategoryRulesController_init__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_checkConnectionWith:", v3);
  objc_msgSend(v3, "cancel");

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener invalidate](self->_callbackListener, "invalidate");
  objc_storeWeak((id *)&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)MCCCategoryRulesController;
  -[MCCCategoryRulesController dealloc](&v3, sel_dealloc);
}

- (void)registerForWebRuleNotifications
{
  NSDate *v3;
  NSDate *lastCheckin;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastCheckin = self->_lastCheckin;
  self->_lastCheckin = v3;

  -[MCCSecretAgentController registerCategoryRulesCallback](self->_agentController, "registerCategoryRulesCallback");
}

- (BOOL)createWebRuleWithSender:(id)a3 category:(id)a4 lastModified:(double)a5
{
  id v8;
  id v9;
  RCWebRule *v10;
  MCCSecretAgentController *agentController;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v8 = a3;
  v9 = a4;
  v10 = -[RCWebRule initWithSender:category:lastModified:]([RCWebRule alloc], "initWithSender:category:lastModified:", v8, v9, a5);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  agentController = self->_agentController;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __76__MCCCategoryRulesController_createWebRuleWithSender_category_lastModified___block_invoke;
  v13[3] = &unk_251C89A00;
  v13[4] = &v14;
  -[MCCSecretAgentController createWebRule:completion:](agentController, "createWebRule:completion:", v10, v13);
  LOBYTE(self) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return (char)self;
}

void __76__MCCCategoryRulesController_createWebRuleWithSender_category_lastModified___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  if (v5)
  {
    _MCCLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __76__MCCCategoryRulesController_createWebRuleWithSender_category_lastModified___block_invoke_cold_1();

  }
}

- (BOOL)notifyWebRuleWithSender:(id)a3 category:(id)a4 lastModified:(double)a5
{
  id v8;
  id v9;
  RCWebRule *v10;
  MCCSecretAgentController *agentController;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v8 = a3;
  v9 = a4;
  v10 = -[RCWebRule initWithSender:category:lastModified:]([RCWebRule alloc], "initWithSender:category:lastModified:", v8, v9, a5);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  agentController = self->_agentController;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __76__MCCCategoryRulesController_notifyWebRuleWithSender_category_lastModified___block_invoke;
  v13[3] = &unk_251C89A00;
  v13[4] = &v14;
  -[MCCSecretAgentController notifyWebRule:completion:](agentController, "notifyWebRule:completion:", v10, v13);
  LOBYTE(self) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return (char)self;
}

void __76__MCCCategoryRulesController_notifyWebRuleWithSender_category_lastModified___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  if (v5)
  {
    _MCCLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __76__MCCCategoryRulesController_notifyWebRuleWithSender_category_lastModified___block_invoke_cold_1();

  }
}

- (BOOL)sendPendingRules
{
  MCCSecretAgentController *agentController;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  agentController = self->_agentController;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__MCCCategoryRulesController_sendPendingRules__block_invoke;
  v5[3] = &unk_251C89A00;
  v5[4] = &v6;
  -[MCCSecretAgentController sendPendingRulesWithCompletion:](agentController, "sendPendingRulesWithCompletion:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __46__MCCCategoryRulesController_sendPendingRules__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  if (v5)
  {
    _MCCLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46__MCCCategoryRulesController_sendPendingRules__block_invoke_cold_1();

  }
}

- (void)_checkConnectionWith:(id)a3
{
  void *v4;
  NSObject *v5;
  double v6;
  NSObject *v7;

  objc_msgSend(MEMORY[0x24BDBCE60], "date", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _MCCLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[MCCCategoryRulesController _checkConnectionWith:].cold.2((uint64_t)self, (uint64_t)v4, v5);

  objc_msgSend(v4, "timeIntervalSinceDate:", self->_lastCheckin);
  if (v6 > 630.0)
  {
    _MCCLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MCCCategoryRulesController _checkConnectionWith:].cold.1();

    -[MCCCategoryRulesController registerForWebRuleNotifications](self, "registerForWebRuleNotifications");
  }

}

- (void)rulesChanged:(id)a3
{
  id WeakRetained;
  id v5;
  char v6;
  id v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v7, "categoryRulesController:didReceiveRules:", self, v8);

    }
  }

}

- (void)agentIsAlive
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24B68B000, v0, v1, "[rules] Remote service checked in", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSXPCListener *v6;
  id v7;
  NSXPCListener *callbackListener;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[5];
  _QWORD v16[5];

  v6 = (NSXPCListener *)a3;
  v7 = a4;
  callbackListener = self->_callbackListener;
  if (callbackListener == v6)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2579ADC38);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v9, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_rulesChanged_, 0, 0);
    objc_msgSend(v7, "setExportedInterface:", v9);
    objc_msgSend(v7, "setExportedObject:", self);
    v13 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __65__MCCCategoryRulesController_listener_shouldAcceptNewConnection___block_invoke;
    v16[3] = &unk_251C89A28;
    v16[4] = self;
    objc_msgSend(v7, "setInterruptionHandler:", v16);
    v15[0] = v13;
    v15[1] = 3221225472;
    v15[2] = __65__MCCCategoryRulesController_listener_shouldAcceptNewConnection___block_invoke_63;
    v15[3] = &unk_251C89A28;
    v15[4] = self;
    objc_msgSend(v7, "setInvalidationHandler:", v15);
    objc_msgSend(v7, "resume");

  }
  else
  {
    _MCCLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MCCCategoryRulesController listener:shouldAcceptNewConnection:].cold.1();
  }

  return callbackListener == v6;
}

void __65__MCCCategoryRulesController_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;

  _MCCLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __65__MCCCategoryRulesController_listener_shouldAcceptNewConnection___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "categoryRulesController:didAlterConnectionWithReason:", *(_QWORD *)(a1 + 32), 1);

    }
  }
}

uint64_t __65__MCCCategoryRulesController_listener_shouldAcceptNewConnection___block_invoke_63(uint64_t a1)
{
  NSObject *v2;
  MCCBgTimer *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v9[5];

  _MCCLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __65__MCCCategoryRulesController_listener_shouldAcceptNewConnection___block_invoke_63_cold_2();

  v3 = [MCCBgTimer alloc];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __65__MCCCategoryRulesController_listener_shouldAcceptNewConnection___block_invoke_64;
  v9[3] = &unk_251C899D8;
  v9[4] = *(_QWORD *)(a1 + 32);
  v4 = -[MCCBgTimer initWithTimeIntervalSinceNow:block:](v3, "initWithTimeIntervalSinceNow:block:", v9, 60.0);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  _MCCLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __65__MCCCategoryRulesController_listener_shouldAcceptNewConnection___block_invoke_63_cold_1();

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "start");
}

void __65__MCCCategoryRulesController_listener_shouldAcceptNewConnection___block_invoke_64(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;

  v3 = a2;
  _MCCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __65__MCCCategoryRulesController_listener_shouldAcceptNewConnection___block_invoke_64_cold_3();

  v6 = *(void **)(a1 + 32);
  v5 = (id *)(a1 + 32);
  objc_msgSend(v6, "registerForWebRuleNotifications");
  objc_msgSend(*v5, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*v5, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      _MCCLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __65__MCCCategoryRulesController_listener_shouldAcceptNewConnection___block_invoke_64_cold_2(v5, v10);

      objc_msgSend(*v5, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "categoryRulesController:didAlterConnectionWithReason:", *v5, 4);

    }
  }
  _MCCLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    __65__MCCCategoryRulesController_listener_shouldAcceptNewConnection___block_invoke_64_cold_1();

  objc_msgSend(v3, "cancel");
}

- (MCCCategoryRulesDelegate)delegate
{
  return (MCCCategoryRulesDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reconnectTimer, 0);
  objc_storeStrong((id *)&self->_bgTimer, 0);
  objc_storeStrong((id *)&self->_lastCheckin, 0);
  objc_storeStrong((id *)&self->_callbackListener, 0);
  objc_storeStrong((id *)&self->_agentController, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24B68B000, v0, v1, "[rules] started checkup timer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __76__MCCCategoryRulesController_createWebRuleWithSender_category_lastModified___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "[rules] Remote create-web-rule failed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __76__MCCCategoryRulesController_notifyWebRuleWithSender_category_lastModified___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "[rules] Remote notify-web-rule failed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __46__MCCCategoryRulesController_sendPendingRules__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Remote send pending rules failed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_checkConnectionWith:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_24B68B000, v0, v1, "[rules] Remote service has not checked in recently. Re-starting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_checkConnectionWith:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 24);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_24B68B000, log, OS_LOG_TYPE_DEBUG, "[rules] Checking last:%@ vs now:%@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_4();
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_24B68B000, v1, OS_LOG_TYPE_ERROR, "[rules] MCCCategoryRulesController NOT accepting new connection: %@ vs %@\n", v2, 0x16u);
  OUTLINED_FUNCTION_4();
}

void __65__MCCCategoryRulesController_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_24B68B000, v0, v1, "[rules] NSXPCListenerDelegate interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __65__MCCCategoryRulesController_listener_shouldAcceptNewConnection___block_invoke_63_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24B68B000, v0, v1, "[rules] Starting reconnect timer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __65__MCCCategoryRulesController_listener_shouldAcceptNewConnection___block_invoke_63_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24B68B000, v0, v1, "[rules] NSXPCListenerDelegate invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __65__MCCCategoryRulesController_listener_shouldAcceptNewConnection___block_invoke_64_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24B68B000, v0, v1, "[rules] Cancelling reconnect timer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __65__MCCCategoryRulesController_listener_shouldAcceptNewConnection___block_invoke_64_cold_2(id *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[12];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  v5 = 1024;
  v6 = 4;
  _os_log_debug_impl(&dword_24B68B000, a2, OS_LOG_TYPE_DEBUG, "[rules] Sending to client %@:%d", v4, 0x12u);

}

void __65__MCCCategoryRulesController_listener_shouldAcceptNewConnection___block_invoke_64_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24B68B000, v0, v1, "[rules] Attempting reconnect to launchagent", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
