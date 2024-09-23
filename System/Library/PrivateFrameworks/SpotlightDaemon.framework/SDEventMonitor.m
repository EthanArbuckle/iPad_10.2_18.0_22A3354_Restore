@implementation SDEventMonitor

void __50__SDEventMonitor__startMonitoringEventsForStream___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  SDTransactionDone(*(void **)(a1 + 64));
}

void __50__SDEventMonitor__startMonitoringEventsForStream___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF50]), 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  logForCSLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    v21 = v6;
    v22 = 2112;
    v23 = v4;
    _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_DEFAULT, "Received \"%s\" notification for keyName:%@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "eventHandlers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __50__SDEventMonitor__startMonitoringEventsForStream___block_invoke_6;
    v18[3] = &unk_24D0EDBA8;
    v19 = v8;
    v9 = MEMORY[0x2199C2F34](v18);
    v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v9;
    v11 = *(_QWORD *)(a1 + 48);
    if (v11 != 1)
    {
      if (!v11)
        (*(void (**)(uint64_t, _QWORD, void *, _QWORD, _QWORD))(v9 + 16))(v9, *(_QWORD *)(a1 + 32), v4, 0, 0);
      goto LABEL_17;
    }
    xpc_dictionary_get_value(v3, "UserInfo");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
    {
      if (MEMORY[0x2199C3444](v12) == MEMORY[0x24BDACFA0])
      {
        v16 = (void *)_CFXPCCreateCFObjectFromXPCObject();
        if (v16)
        {
          v17 = 0;
        }
        else
        {
          _SDEventMonitorErrorMake(CFSTR("Failed to convert user info XPC dictionary to CF dictionary."));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        ((void (**)(_QWORD, _QWORD, void *, void *, void *))v10)[2](v10, *(_QWORD *)(a1 + 32), v4, v16, v17);

        goto LABEL_16;
      }
      v14 = CFSTR("User info was not a dictionary.");
    }
    else
    {
      v14 = CFSTR("Didn't get any user info from event.");
    }
    _SDEventMonitorErrorMake(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *, _QWORD, void *))v10)[2](v10, *(_QWORD *)(a1 + 32), v4, 0, v15);

LABEL_16:
LABEL_17:

  }
}

- (NSMutableDictionary)eventHandlers
{
  return self->_eventHandlers;
}

void __50__SDEventMonitor__startMonitoringEventsForStream___block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id obj;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = *(id *)(a1 + 32);
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    v16 = MEMORY[0x24BDAC9B8];
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v17);
        SDTransactionCreate(&unk_24D0FD120);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __50__SDEventMonitor__startMonitoringEventsForStream___block_invoke_2;
        block[3] = &unk_24D0EDB80;
        v28 = v18;
        v23 = v9;
        v24 = v10;
        v25 = v11;
        v26 = v12;
        v27 = v19;
        v20 = v19;
        dispatch_async(v16, block);

        ++v17;
      }
      while (v14 != v17);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v14);
  }

}

- (SDEventMonitor)init
{

  return 0;
}

- (id)_init
{
  SDEventMonitor *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSMutableDictionary *eventHandlers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SDEventMonitor;
  v2 = -[SDEventMonitor init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.searchd.eventMonitor", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_opt_new();
    eventHandlers = v2->_eventHandlers;
    v2->_eventHandlers = (NSMutableDictionary *)v6;

  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__SDEventMonitor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, block);
  return (id)sharedInstance_sharedInstance;
}

void __32__SDEventMonitor_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_init");
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;

}

- (void)startMonitoringEvents
{
  -[SDEventMonitor _startMonitoringEventsForStream:](self, "_startMonitoringEventsForStream:", 1);
  -[SDEventMonitor _startMonitoringEventsForStream:](self, "_startMonitoringEventsForStream:", 0);
}

- (void)_startMonitoringEventsForStream:(unint64_t)a3
{
  const char *v5;
  const char *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD handler[7];

  v5 = "com.apple.distnoted.matching";
  if (a3 != 1)
    v5 = 0;
  if (a3)
    v6 = v5;
  else
    v6 = "com.apple.notifyd.matching";
  logForCSLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SDEventMonitor _startMonitoringEventsForStream:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  -[SDEventMonitor queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __50__SDEventMonitor__startMonitoringEventsForStream___block_invoke;
  handler[3] = &unk_24D0EDBD0;
  handler[4] = self;
  handler[5] = v6;
  handler[6] = a3;
  xpc_set_event_stream_handler(v6, v14, handler);

}

- (void)registerHandler:(id)a3 forEventName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  logForCSLogCategoryDefault();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SDEventMonitor registerHandler:forEventName:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

  -[SDEventMonitor queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__SDEventMonitor_registerHandler_forEventName___block_invoke;
  block[3] = &unk_24D0EB758;
  block[4] = self;
  v19 = v7;
  v20 = v6;
  v16 = v6;
  v17 = v7;
  dispatch_sync(v15, block);

}

void __47__SDEventMonitor_registerHandler_forEventName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "eventHandlers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "eventHandlers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 40));

  }
  v4 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(v5, "addObject:", v4);

}

- (void)unregisterHandler:(id)a3 forEventName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SDEventMonitor queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SDEventMonitor_unregisterHandler_forEventName___block_invoke;
  block[3] = &unk_24D0EB758;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(v8, block);

}

void __49__SDEventMonitor_unregisterHandler_forEventName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "eventHandlers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x2199C2F34](*(_QWORD *)(a1 + 48));
  objc_msgSend(v2, "removeObject:", v3);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setEventHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_eventHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventHandlers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_startMonitoringEventsForStream:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_213CF1000, a2, a3, "Monitoring notifications for \"%s\", a5, a6, a7, a8, 2u);
}

- (void)registerHandler:(uint64_t)a3 forEventName:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_213CF1000, a2, a3, "Registering handler for \"%@\", a5, a6, a7, a8, 2u);
}

@end
