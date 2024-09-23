@implementation SPXPCServer

void __55__SPXPCServer_initListenerWithServiceName_onQueue_qos___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unsigned int *WeakRetained;
  unsigned int *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a2;
  WeakRetained = (unsigned int *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained && !*((_BYTE *)WeakRetained + 69))
  {
    v6 = MEMORY[0x2199AE6A4](v3);
    if (v6 == MEMORY[0x24BDACF88])
    {
      objc_msgSend(v5, "_handleNewConnection:qos:", v3, v5[16]);
    }
    else
    {
      v7 = v6;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        __55__SPXPCServer_initListenerWithServiceName_onQueue_qos___block_invoke_cold_1((uint64_t)v5, v7);
    }
  }

}

- (void)_handleNewConnection:(id)a3 qos:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  SPXPCConnection *v7;
  uint64_t v8;
  SPXPCConnection *v9;
  void (**firstConnectionBlock)(void);
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id from[6];
  SPXPCConnection *v19;
  id location;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  location = 0;
  objc_initWeak(&location, self);
  v7 = -[SPXPCConnection initWithXPCConnection:qos:]([SPXPCConnection alloc], "initWithXPCConnection:qos:", v6, v4);
  v8 = MEMORY[0x24BDAC760];
  from[1] = (id)MEMORY[0x24BDAC760];
  from[2] = (id)3221225472;
  from[3] = __40__SPXPCServer__handleNewConnection_qos___block_invoke;
  from[4] = &unk_24CF63C90;
  from[5] = self;
  v9 = v7;
  v19 = v9;
  tracing_dispatch_sync();
  if (!self->hadConnection)
  {
    self->hadConnection = 1;
    firstConnectionBlock = (void (**)(void))self->_firstConnectionBlock;
    if (firstConnectionBlock)
    {
      firstConnectionBlock[2]();
      v11 = self->_firstConnectionBlock;
      self->_firstConnectionBlock = 0;

    }
  }
  from[0] = 0;
  objc_initWeak(from, v9);
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __40__SPXPCServer__handleNewConnection_qos___block_invoke_2;
  v15[3] = &unk_24CF648C0;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, from);
  -[SPXPCConnection setMessageHandler:](v9, "setMessageHandler:", v15);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __40__SPXPCServer__handleNewConnection_qos___block_invoke_122;
  v12[3] = &unk_24CF648E8;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, from);
  -[SPXPCConnection setDisconnectHandler:](v9, "setDisconnectHandler:", v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(from);

  objc_destroyWeak(&location);
}

void __40__SPXPCServer__handleNewConnection_qos___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    __40__SPXPCServer__handleNewConnection_qos___block_invoke_2_cold_3(v3);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained && !*((_BYTE *)WeakRetained + 69))
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v6)
    {
      objc_msgSend(v3, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_handlerForMessageName:", v7);
      v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
          __40__SPXPCServer__handleNewConnection_qos___block_invoke_2_cold_2(v3);
        ((void (**)(_QWORD, id, id))v8)[2](v8, v6, v3);
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        __40__SPXPCServer__handleNewConnection_qos___block_invoke_2_cold_1(v3);
      }

    }
  }

}

- (id)_handlerForMessageName:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_handlerMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v6)
      -[SPXPCServer _handlerForMessageName:].cold.2();
  }
  else
  {
    if (v6)
      -[SPXPCServer _handlerForMessageName:].cold.1();
    v5 = (void *)MEMORY[0x2199AE320](self->_defaultMessageHandler);
  }
  v7 = (void *)MEMORY[0x2199AE320](v5);

  return v7;
}

uint64_t __40__SPXPCServer__handleNewConnection_qos___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
}

- (BOOL)shutdown
{
  self->_shutdown = 1;
  return 1;
}

- (id)_highAvailabilityQueue
{
  if (_highAvailabilityQueue_onceToken != -1)
    dispatch_once(&_highAvailabilityQueue_onceToken, &__block_literal_global_15);
  return (id)_highAvailabilityQueue_queue;
}

void __37__SPXPCServer__highAvailabilityQueue__block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;

  dispatch_queue_attr_make_initially_inactive(0);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(v0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_USER_INTERACTIVE, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("searchd xpc high availability queue", v2);
  v4 = (void *)_highAvailabilityQueue_queue;
  _highAvailabilityQueue_queue = (uint64_t)v3;

  dispatch_activate((dispatch_object_t)_highAvailabilityQueue_queue);
}

void __40__SPXPCServer__handleNewConnection_qos___block_invoke_122(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  id v3;
  NSObject *v4;
  id v5;
  _QWORD *WeakRetained;
  _QWORD block[4];
  _QWORD *v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "disconnectHandler");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    v4 = WeakRetained[5];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__SPXPCServer__handleNewConnection_qos___block_invoke_2_123;
    block[3] = &unk_24CF63C90;
    v8 = WeakRetained;
    v5 = v3;
    v9 = v5;
    dispatch_sync(v4, block);
    if (v2)
      ((void (**)(_QWORD, id))v2)[2](v2, v5);

  }
}

uint64_t __40__SPXPCServer__handleNewConnection_qos___block_invoke_2_123(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (id)initListenerWithServiceName:(id)a3 onQueue:(id)a4 qos:(unsigned int)a5
{
  id v8;
  NSObject *v9;
  SPXPCServer *v10;
  xpc_connection_t mach_service;
  OS_xpc_object *conn;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *timerQueue;
  NSMutableSet *v16;
  NSMutableSet *connections;
  NSObject *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *connectionsQueue;
  _xpc_connection_s *v22;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)SPXPCServer;
  v10 = -[SPXPCServer init](&v27, sel_init);
  if (v10)
  {
    mach_service = xpc_connection_create_mach_service((const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), v9, 1uLL);
    conn = v10->_conn;
    v10->_conn = mach_service;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("idle_timer", v13);
    timerQueue = v10->_timerQueue;
    v10->_timerQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v10->_eventQueue, a4);
    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    connections = v10->_connections;
    v10->_connections = v16;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_UNSPECIFIED, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("connection_queue", v19);
    connectionsQueue = v10->_connectionsQueue;
    v10->_connectionsQueue = (OS_dispatch_queue *)v20;

    v10->_qos = a5;
    location = 0;
    objc_initWeak(&location, v10);
    v22 = v10->_conn;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __55__SPXPCServer_initListenerWithServiceName_onQueue_qos___block_invoke;
    v24[3] = &unk_24CF64878;
    objc_copyWeak(&v25, &location);
    xpc_connection_set_event_handler(v22, v24);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)startListening
{
  xpc_connection_activate(self->_conn);
}

- (id)initListenerWithServiceName:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SPXPCServer _highAvailabilityQueue](self, "_highAvailabilityQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SPXPCServer initListenerWithServiceName:onQueue:qos:](self, "initListenerWithServiceName:onQueue:qos:", v4, v5, 33);

  return v6;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  SPXPCServer *v8;

  v4 = MEMORY[0x24BDAC760];
  v5 = 3221225472;
  v6 = __22__SPXPCServer_dealloc__block_invoke;
  v7 = &unk_24CF63D90;
  v8 = self;
  tracing_dispatch_sync();
  v3.receiver = self;
  v3.super_class = (Class)SPXPCServer;
  -[SPXPCServer dealloc](&v3, sel_dealloc);
}

void __22__SPXPCServer_dealloc__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "setMessageHandler:", 0, (_QWORD)v10);
        objc_msgSend(v7, "setDisconnectHandler:", 0);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 24);
  *(_QWORD *)(v8 + 24) = 0;

}

- (void)setHandlerForMessageName:(id)a3 handler:(id)a4
{
  id v6;
  NSMutableDictionary *handlerMap;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11)
  {
    handlerMap = self->_handlerMap;
    if (!handlerMap)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v9 = self->_handlerMap;
      self->_handlerMap = v8;

      handlerMap = self->_handlerMap;
    }
    v10 = (void *)objc_msgSend(v6, "copy");
    -[NSMutableDictionary setObject:forKey:](handlerMap, "setObject:forKey:", v10, v11);

  }
  else
  {
    -[SPXPCServer setDefaultMessageHandler:](self, "setDefaultMessageHandler:", v6);
  }

}

- (id)disconnectHandler
{
  return self->_disconnectHandler;
}

- (void)setDisconnectHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)defaultMessageHandler
{
  return self->_defaultMessageHandler;
}

- (void)setDefaultMessageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)firstConnectionBlock
{
  return self->_firstConnectionBlock;
}

- (void)setFirstConnectionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_firstConnectionBlock, 0);
  objc_storeStrong(&self->_defaultMessageHandler, 0);
  objc_storeStrong(&self->_disconnectHandler, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_connectionsQueue, 0);
  objc_storeStrong((id *)&self->_handlerMap, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

- (void)_handlerForMessageName:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_213202000, MEMORY[0x24BDACB70], v0, "Use default handler for %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

- (void)_handlerForMessageName:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_213202000, MEMORY[0x24BDACB70], v0, "Use specific handler for %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void __40__SPXPCServer__handleNewConnection_qos___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8_0(&dword_213202000, MEMORY[0x24BDACB70], v2, "No handler for %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1_2();
}

void __40__SPXPCServer__handleNewConnection_qos___block_invoke_2_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_213202000, MEMORY[0x24BDACB70], v2, "Passing message %@ to handler", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1_2();
}

void __40__SPXPCServer__handleNewConnection_qos___block_invoke_2_cold_3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_6(&dword_213202000, MEMORY[0x24BDACB70], v2, "Got message %@ %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1_2();
}

void __55__SPXPCServer_initListenerWithServiceName_onQueue_qos___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  _StringForXPCType(a2);
  OUTLINED_FUNCTION_6(&dword_213202000, MEMORY[0x24BDACB70], v2, "%@ %s", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_1_2();
}

@end
