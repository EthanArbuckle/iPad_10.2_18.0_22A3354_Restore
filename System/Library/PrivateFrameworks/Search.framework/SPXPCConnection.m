@implementation SPXPCConnection

- (id)context
{
  return self->_context;
}

void __51__SPXPCConnection__sendInteractiveMessage_handler___block_invoke(uint64_t a1)
{
  void *v2;
  _xpc_connection_s *v3;
  xpc_object_t v4;
  void *v5;
  id v6;
  id v7;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_createXPCMessage");
  if (v2)
  {
    v3 = *(_xpc_connection_s **)(a1 + 40);
    if (*(_QWORD *)(a1 + 56))
    {
      v4 = xpc_connection_send_message_with_reply_sync(v3, v2);
      if (v4)
      {
        objc_msgSend(*(id *)(a1 + 48), "eventQueue");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = *(id *)(a1 + 56);
        v6 = v4;
        tracing_dispatch_async();

      }
    }
    else
    {
      xpc_connection_send_message(v3, v2);
    }
  }

}

- (NSString)bundleID
{
  NSString *bundleID;
  uint64_t v4;
  void *v5;
  const char *string_ptr;
  NSString *v7;
  NSString *v8;

  bundleID = self->_bundleID;
  if (!bundleID)
  {
    objc_msgSend(CFSTR("application-identifier"), "UTF8String");
    v4 = xpc_connection_copy_entitlement_value();
    v5 = (void *)v4;
    if (v4)
    {
      if (MEMORY[0x2199AE6A4](v4) == MEMORY[0x24BDACFF0])
      {
        string_ptr = xpc_string_get_string_ptr(v5);
        if (string_ptr)
        {
          v7 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", string_ptr);
          v8 = self->_bundleID;
          self->_bundleID = v7;

        }
      }
    }

    bundleID = self->_bundleID;
  }
  return bundleID;
}

- (SPXPCConnection)initWithXPCConnection:(id)a3 qos:(unsigned int)a4
{
  uint64_t v4;
  id v8;
  SPXPCConnection *v9;
  SPXPCConnection *v10;
  _xpc_connection_s *conn;
  NSObject *v12;
  void *v14;
  objc_super v15;

  v4 = *(_QWORD *)&a4;
  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SPXPCConnection.m"), 75, CFSTR("Must have xpc_connection"));

  }
  v15.receiver = self;
  v15.super_class = (Class)SPXPCConnection;
  v9 = -[SPXPCConnection init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_conn, a3);
    conn = v10->_conn;
    -[SPXPCConnection eventQueueWithQOS:](v10, "eventQueueWithQOS:", v4);
    v12 = objc_claimAutoreleasedReturnValue();
    xpc_connection_set_target_queue(conn, v12);

    -[SPXPCConnection _setEventHandlerOnConnection:](v10, "_setEventHandlerOnConnection:", v10->_conn);
    xpc_connection_resume(v10->_conn);
  }

  return v10;
}

- (id)eventQueueWithQOS:(unsigned int)a3
{
  OS_dispatch_queue *eventQueue;
  NSObject *v6;
  NSObject *v7;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *v9;

  eventQueue = self->_eventQueue;
  if (!eventQueue)
  {
    self->_ownsQueue = 1;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v6, (dispatch_qos_class_t)a3, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.search.XPCEvent", v7);
    v9 = self->_eventQueue;
    self->_eventQueue = v8;

    eventQueue = self->_eventQueue;
  }
  return eventQueue;
}

void __48__SPXPCConnection__setEventHandlerOnConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x2199AE17C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = MEMORY[0x2199AE6A4](v3);
  if (v6 == MEMORY[0x24BDACFB8])
  {
    objc_msgSend(WeakRetained, "_handleXPCError:", v3);
  }
  else
  {
    v7 = v6;
    if (v6 == MEMORY[0x24BDACFA0])
    {
      objc_msgSend(WeakRetained, "_handleXPCMessage:", v3);
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v8 = 136315138;
      v9 = _StringForXPCType(v7);
      _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Ignoring unexpected event of type %s", (uint8_t *)&v8, 0xCu);
    }
  }

  objc_autoreleasePoolPop(v4);
}

- (void)_handleXPCMessage:(id)a3
{
  id v4;
  id v5;

  if (self->_messageHandler)
  {
    v4 = a3;
    v5 = -[SPXPCMessage _initWithXPCMessage:onConnection:]([SPXPCMessage alloc], "_initWithXPCMessage:onConnection:", v4, self);

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[SPXPCConnection _handleXPCMessage:].cold.1(v5);
    (*((void (**)(void))self->_messageHandler + 2))();

  }
}

- (void)sendMessage:(id)a3
{
  -[SPXPCConnection _sendMessage:handler:](self, "_sendMessage:handler:", a3, 0);
}

- (void)setMessageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setDisconnectHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)_sendMessage:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  OS_xpc_object *conn;
  NSObject *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SPXPCConnection.m"), 126, CFSTR("Message must have a name"));

  }
  if (self->_conn)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[SPXPCConnection _sendMessage:handler:].cold.1();
    v10 = (void *)objc_msgSend(v7, "_createXPCMessage");
    if (v10)
    {
      conn = self->_conn;
      if (v8)
      {
        -[SPXPCConnection eventQueue](self, "eventQueue");
        v12 = objc_claimAutoreleasedReturnValue();
        xpc_connection_send_message_with_reply(conn, v10, v12, v8);

      }
      else
      {
        xpc_connection_send_message(self->_conn, v10);
      }
    }

  }
}

- (SPXPCConnection)initWithServiceName:(id)a3 onQueue:(id)a4
{
  id v6;
  id v7;
  SPXPCConnection *v8;
  SPXPCConnection *v9;
  const char *v10;
  NSObject *v11;
  xpc_connection_t mach_service;
  OS_xpc_object *conn;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SPXPCConnection;
  v8 = -[SPXPCConnection init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_eventQueue, a4);
    v10 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    -[SPXPCConnection eventQueue](v9, "eventQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    mach_service = xpc_connection_create_mach_service(v10, v11, 0);
    conn = v9->_conn;
    v9->_conn = mach_service;

    -[SPXPCConnection _setEventHandlerOnConnection:](v9, "_setEventHandlerOnConnection:", v9->_conn);
    xpc_connection_resume(v9->_conn);
  }

  return v9;
}

- (void)_setEventHandlerOnConnection:(id)a3
{
  _xpc_connection_s *v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = (_xpc_connection_s *)a3;
  location = 0;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__SPXPCConnection__setEventHandlerOnConnection___block_invoke;
  v5[3] = &unk_24CF64878;
  objc_copyWeak(&v6, &location);
  xpc_connection_set_event_handler(v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (id)eventQueue
{
  OS_dispatch_queue *eventQueue;
  NSObject *v4;
  qos_class_t v5;
  NSObject *v6;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *v8;

  eventQueue = self->_eventQueue;
  if (!eventQueue)
  {
    self->_ownsQueue = 1;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = qos_class_self();
    dispatch_queue_attr_make_with_qos_class(v4, v5, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.search.XPCEvent", v6);
    v8 = self->_eventQueue;
    self->_eventQueue = v7;

    eventQueue = self->_eventQueue;
  }
  return eventQueue;
}

- (void)sendInteractiveMessage:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  SPXPCConnection *v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      -[SPXPCConnection sendMessage:withReply:].cold.2((uint64_t)self, v6);
      if (v7)
        goto LABEL_4;
    }
    else if (v7)
    {
LABEL_4:
      v17 = MEMORY[0x24BDAC760];
      v18 = 3221225472;
      v19 = __52__SPXPCConnection_sendInteractiveMessage_withReply___block_invoke;
      v20 = &unk_24CF64850;
      v21 = self;
      v22 = v7;
      v16 = (void *)MEMORY[0x2199AE320](&v17);

LABEL_9:
      -[SPXPCConnection _sendInteractiveMessage:handler:](self, "_sendInteractiveMessage:handler:", v6, v16, v17, v18, v19, v20, v21);

      goto LABEL_10;
    }
    v16 = 0;
    goto LABEL_9;
  }
  if (v8)
    -[SPXPCConnection sendMessage:withReply:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
LABEL_10:

}

- (void)_sendInteractiveMessage:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  OS_xpc_object *v10;
  void *v11;
  OS_xpc_object *v12;
  void *v13;
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SPXPCConnection.m"), 141, CFSTR("Message must have a name"));

  }
  if (self->_conn)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[SPXPCConnection _sendMessage:handler:].cold.1();
    v10 = self->_conn;
    dispatch_get_global_queue(33, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v7;
    v15 = v8;
    v12 = v10;
    tracing_dispatch_async();

  }
}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (void)dealloc
{
  OUTLINED_FUNCTION_4_0(&dword_213202000, MEMORY[0x24BDACB70], a3, "SPXPCConnection dealloc", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (NSString)serviceName
{
  _xpc_connection_s *conn;

  conn = self->_conn;
  if (conn)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_connection_get_name(conn));
    conn = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)conn;
}

uint64_t __51__SPXPCConnection__sendInteractiveMessage_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)sendMessage:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  SPXPCConnection *v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      -[SPXPCConnection sendMessage:withReply:].cold.2((uint64_t)self, v6);
      if (v7)
        goto LABEL_4;
    }
    else if (v7)
    {
LABEL_4:
      v17 = MEMORY[0x24BDAC760];
      v18 = 3221225472;
      v19 = __41__SPXPCConnection_sendMessage_withReply___block_invoke;
      v20 = &unk_24CF64850;
      v21 = self;
      v22 = v7;
      v16 = (void *)MEMORY[0x2199AE320](&v17);

LABEL_9:
      -[SPXPCConnection _sendMessage:handler:](self, "_sendMessage:handler:", v6, v16, v17, v18, v19, v20, v21);

      goto LABEL_10;
    }
    v16 = 0;
    goto LABEL_9;
  }
  if (v8)
    -[SPXPCConnection sendMessage:withReply:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
LABEL_10:

}

void __41__SPXPCConnection_sendMessage_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = MEMORY[0x2199AE6A4]();
  if (v4 == MEMORY[0x24BDACFB8])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __41__SPXPCConnection_sendMessage_withReply___block_invoke_cold_1(a1, v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v5 = v4;
    if (v4 == MEMORY[0x24BDACFA0])
    {
      v6 = -[SPXPCMessage _initWithXPCMessage:onConnection:]([SPXPCMessage alloc], "_initWithXPCMessage:onConnection:", v3, *(_QWORD *)(a1 + 32));
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v7 = 136315138;
      v8 = _StringForXPCType(v5);
      _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Ignoring unexpected event of type %s", (uint8_t *)&v7, 0xCu);
    }
  }

}

void __52__SPXPCConnection_sendInteractiveMessage_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = MEMORY[0x2199AE6A4]();
  if (v4 == MEMORY[0x24BDACFB8])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __41__SPXPCConnection_sendMessage_withReply___block_invoke_cold_1(a1, v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v5 = v4;
    if (v4 == MEMORY[0x24BDACFA0])
    {
      v6 = -[SPXPCMessage _initWithXPCMessage:onConnection:]([SPXPCMessage alloc], "_initWithXPCMessage:onConnection:", v3, *(_QWORD *)(a1 + 32));
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v7 = 136315138;
      v8 = _StringForXPCType(v5);
      _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Ignoring unexpected event of type %s", (uint8_t *)&v7, 0xCu);
    }
  }

}

- (void)barrier:(id)a3
{
  xpc_connection_send_barrier(self->_conn, a3);
}

- (void)_handleXPCError:(id)a3
{
  id v4;
  const char *string;
  const char *v6;
  void (**disconnectHandler)(void);
  id v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4 == (id)MEMORY[0x24BDACF30])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[SPXPCConnection _handleXPCError:].cold.1();
  }
  else
  {
    if (v4 != (id)MEMORY[0x24BDACF38])
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x24BDACF40]);
        v6 = "Unknown error";
        if (string)
          v6 = string;
        v9 = 136315138;
        v10 = v6;
        _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Error: %s", (uint8_t *)&v9, 0xCu);
      }
      goto LABEL_13;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[SPXPCConnection _handleXPCError:].cold.2();
  }
  disconnectHandler = (void (**)(void))self->_disconnectHandler;
  if (disconnectHandler)
  {
    disconnectHandler[2]();
    v8 = self->_disconnectHandler;
    self->_disconnectHandler = 0;

  }
LABEL_13:

}

- (void)shutdown
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_213202000, MEMORY[0x24BDACB70], v0, "Shutdown called on XPC connection %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void __27__SPXPCConnection_shutdown__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  xpc_connection_cancel(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

}

- (id)messageHandler
{
  return self->_messageHandler;
}

- (id)disconnectHandler
{
  return self->_disconnectHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong(&self->_disconnectHandler, 0);
  objc_storeStrong(&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

- (void)_sendMessage:handler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  qos_class_self();
  OUTLINED_FUNCTION_10(&dword_213202000, MEMORY[0x24BDACB70], v0, "SPXPC message QOS: %d", v1, v2, v3, v4, 0);
  OUTLINED_FUNCTION_9();
}

- (void)sendMessage:(uint64_t)a3 withReply:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_213202000, MEMORY[0x24BDACB70], a3, "Ignoring request to send a nil message", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (void)sendMessage:(uint64_t)a1 withReply:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_213202000, MEMORY[0x24BDACB70], v3, "sendMessage on %p: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_2();
}

void __41__SPXPCConnection_sendMessage_withReply___block_invoke_cold_1(int a1, xpc_object_t xdict)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x24BDACF40]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9_0(&dword_213202000, MEMORY[0x24BDACB70], v2, "Reply Error on %p:%s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_2();
}

- (void)_handleXPCError:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_213202000, MEMORY[0x24BDACB70], v0, "XPC Connection interrupted %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

- (void)_handleXPCError:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_213202000, MEMORY[0x24BDACB70], v0, "XPC Connection invalid %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

- (void)_handleXPCMessage:(void *)a1 .cold.1(void *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_213202000, MEMORY[0x24BDACB70], v2, "Handle message: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1_2();
}

@end
