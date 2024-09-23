@implementation TPSAnalyticsEventController

void __59__TPSAnalyticsEventController_logAnalyticsEventsFromTipsd___block_invoke_2(uint64_t a1)
{
  id *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "mutableAnalyticsEventRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "persistKeys");
  if (v3)
  {
    +[TPSLogger analytics](TPSLogger, "analytics");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __59__TPSAnalyticsEventController_logAnalyticsEventsFromTipsd___block_invoke_2_cold_2(v2, v4);

    objc_msgSend(*v2, "deliveryInfoVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("rules_version"));

    +[TPSLogger analytics](TPSLogger, "analytics");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __59__TPSAnalyticsEventController_logAnalyticsEventsFromTipsd___block_invoke_2_cold_1(v2, (uint64_t)v3, v6);

    v7 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "eventName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendToCoreAnalytics:eventName:", v3, v8);

  }
}

- (void)sendToCoreAnalytics:(id)a3 eventName:(id)a4
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  AnalyticsSendEventLazy();

}

- (void)logAnalyticsEvent:(id)a3
{
  id v4;
  TPSAnalyticsEventController *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    if (+[TPSCommonDefines callerIsTipsdWithSource:](TPSCommonDefines, "callerIsTipsdWithSource:", CFSTR("Analytics")))
    {
      -[TPSAnalyticsEventController logAnalyticsEventFromTipsd:](self, "logAnalyticsEventFromTipsd:", v4);
    }
    else
    {
      v5 = self;
      objc_sync_enter(v5);
      -[TPSAnalyticsEventController xpcConnection](v5, "xpcConnection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        objc_msgSend(v7, "logAnalyticsEvent:", v4);

      objc_sync_exit(v5);
    }
  }

}

- (void)logAnalyticsEventFromTipsd:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TPSAnalyticsEventController logAnalyticsEventsFromTipsd:](self, "logAnalyticsEventsFromTipsd:", v6, v7, v8);
}

- (void)logAnalyticsEventsFromTipsd:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  TPSAnalyticsEventController *v9;

  v4 = a3;
  -[TPSAnalyticsEventController analyticsQueue](self, "analyticsQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__TPSAnalyticsEventController_logAnalyticsEventsFromTipsd___block_invoke;
  block[3] = &unk_1E395B150;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __59__TPSAnalyticsEventController_logAnalyticsEventsFromTipsd___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[6];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 40), "dataProvider");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setDataProvider:", v9);

        objc_msgSend(*(id *)(a1 + 40), "analyticsQueue");
        v10 = objc_claimAutoreleasedReturnValue();
        v12[0] = v6;
        v12[1] = 3221225472;
        v12[2] = __59__TPSAnalyticsEventController_logAnalyticsEventsFromTipsd___block_invoke_2;
        v12[3] = &unk_1E395B150;
        v11 = *(_QWORD *)(a1 + 40);
        v12[4] = v8;
        v12[5] = v11;
        dispatch_async(v10, v12);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

- (OS_dispatch_queue)analyticsQueue
{
  if (analyticsQueue_onceToken != -1)
    dispatch_once(&analyticsQueue_onceToken, &__block_literal_global_1);
  return (OS_dispatch_queue *)(id)analyticsQueue_gAnalyticsQueue;
}

- (TPSAnalyticsDataProvider)dataProvider
{
  return (TPSAnalyticsDataProvider *)objc_loadWeakRetained((id *)&self->_dataProvider);
}

+ (id)sharedInstance
{
  if (sharedInstance_predicate_7 != -1)
    dispatch_once(&sharedInstance_predicate_7, &__block_literal_global_25);
  return (id)sharedInstance_gTPSAnalyticsController;
}

void __45__TPSAnalyticsEventController_sharedInstance__block_invoke()
{
  TPSAnalyticsEventController *v0;
  void *v1;

  v0 = objc_alloc_init(TPSAnalyticsEventController);
  v1 = (void *)sharedInstance_gTPSAnalyticsController;
  sharedInstance_gTPSAnalyticsController = (uint64_t)v0;

}

void __45__TPSAnalyticsEventController_analyticsQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.tipsd.analyticsQueue", v2);
  v1 = (void *)analyticsQueue_gAnalyticsQueue;
  analyticsQueue_gAnalyticsQueue = (uint64_t)v0;

}

void __49__TPSAnalyticsEventController_logAnalyticsEvent___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[TPSLogger analytics](TPSLogger, "analytics");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __49__TPSAnalyticsEventController_logAnalyticsEvent___block_invoke_cold_1();

}

- (void)logAnalyticsEvents:(id)a3
{
  id v4;
  TPSAnalyticsEventController *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!v4)
  {
    +[TPSLogger analytics](TPSLogger, "analytics");
    v5 = (TPSAnalyticsEventController *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEBUG))
      -[TPSAnalyticsEventController logAnalyticsEvents:].cold.1();
    goto LABEL_9;
  }
  if (!+[TPSCommonDefines callerIsTipsdWithSource:](TPSCommonDefines, "callerIsTipsdWithSource:", CFSTR("Analytics")))
  {
    v5 = self;
    objc_sync_enter(v5);
    -[TPSAnalyticsEventController xpcConnection](v5, "xpcConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_9_1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v7, "logAnalyticsEvents:", v4);

    objc_sync_exit(v5);
LABEL_9:

    goto LABEL_10;
  }
  -[TPSAnalyticsEventController logAnalyticsEventsFromTipsd:](self, "logAnalyticsEventsFromTipsd:", v4);
LABEL_10:

}

void __50__TPSAnalyticsEventController_logAnalyticsEvents___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[TPSLogger analytics](TPSLogger, "analytics");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __49__TPSAnalyticsEventController_logAnalyticsEvent___block_invoke_cold_1();

}

id __61__TPSAnalyticsEventController_sendToCoreAnalytics_eventName___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (_TPSXPCConnection)xpcConnection
{
  TPSAnalyticsEventController *v2;
  _TPSXPCConnection *v3;
  _TPSXPCConnection *xpcConnection;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_xpcConnection)
  {
    v3 = -[_TPSXPCConnection initWithMachServiceName:options:]([_TPSXPCConnection alloc], "initWithMachServiceName:options:", CFSTR("com.apple.tipsd"), 4096);
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = v3;

    -[_TPSXPCConnection setExportedObject:](v2->_xpcConnection, "setExportedObject:", v2);
    -[_TPSXPCConnection resume](v2->_xpcConnection, "resume");
  }
  objc_sync_exit(v2);

  return v2->_xpcConnection;
}

- (void)_destroyXPCConnection
{
  _TPSXPCConnection *xpcConnection;
  TPSAnalyticsEventController *obj;

  obj = self;
  objc_sync_enter(obj);
  -[_TPSXPCConnection invalidate](obj->_xpcConnection, "invalidate");
  xpcConnection = obj->_xpcConnection;
  obj->_xpcConnection = 0;

  objc_sync_exit(obj);
}

- (void)connectionInvalidated
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_19A906000, v0, v1, "XPCConnection invalidated calling logEvent to proxy", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)connectionInterrupted
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_19A906000, v0, v1, "XPCConnection interrupted calling logEvent to proxy", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (id)exportedInterface
{
  return 0;
}

- (void)setDataProvider:(id)a3
{
  objc_storeWeak((id *)&self->_dataProvider, a3);
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_destroyWeak((id *)&self->_dataProvider);
}

void __59__TPSAnalyticsEventController_logAnalyticsEventsFromTipsd___block_invoke_2_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "eventName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_19A906000, a3, OS_LOG_TYPE_DEBUG, "event: %@ \n dictionary: %@", v6, 0x16u);

}

void __59__TPSAnalyticsEventController_logAnalyticsEventsFromTipsd___block_invoke_2_cold_2(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "eventName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_19A906000, a2, v4, "logging analytics event: %@", v5);

}

- (void)logAnalyticsEvent:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_3_0(&dword_19A906000, a3, (uint64_t)a3, "XPCConnection exception calling logEvent to proxy: %@", (uint8_t *)a2);

}

void __49__TPSAnalyticsEventController_logAnalyticsEvent___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_19A906000, v0, v1, "xpc connection failed: %@", v2);
}

- (void)logAnalyticsEvents:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_19A906000, v0, v1, "logging analytics event that is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)logAnalyticsEvents:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_19A906000, v0, v1, "XPCConnection exception calling logEvents to proxy", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
