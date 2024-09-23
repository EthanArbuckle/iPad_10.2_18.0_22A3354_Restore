@implementation WebBookmarksXPCConnection

- (WebBookmarksXPCConnection)initWithConnection:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _xpc_connection_s *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WebBookmarksXPCConnection;
  v6 = -[WebBookmarksXPCConnection init](&v20, sel_init);
  if (v6)
  {
    objc_initWeak(&location, v6);
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8 = (void *)*((_QWORD *)v6 + 1);
    *((_QWORD *)v6 + 1) = v7;

    v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v10 = (void *)*((_QWORD *)v6 + 2);
    *((_QWORD *)v6 + 2) = v9;

    objc_storeStrong((id *)v6 + 3, a3);
    v11 = (_xpc_connection_s *)*((_QWORD *)v6 + 3);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __48__WebBookmarksXPCConnection_initWithConnection___block_invoke;
    v17[3] = &unk_24CB350C8;
    objc_copyWeak(&v18, &location);
    xpc_connection_set_event_handler(v11, v17);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.WebBookmarks.WebBookmarksXPCConnectionQueue", v12);
    v14 = (void *)*((_QWORD *)v6 + 4);
    *((_QWORD *)v6 + 4) = v13;

    xpc_connection_set_target_queue(*((xpc_connection_t *)v6 + 3), *((dispatch_queue_t *)v6 + 4));
    xpc_connection_resume(*((xpc_connection_t *)v6 + 3));
    v15 = v6;
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return (WebBookmarksXPCConnection *)v6;
}

void __48__WebBookmarksXPCConnection_initWithConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__WebBookmarksXPCConnection_initWithConnection___block_invoke_2;
  v5[3] = &unk_24CB350A0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v7);
}

void __48__WebBookmarksXPCConnection_initWithConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleMessage:", *(_QWORD *)(a1 + 32));

}

- (id)initClientForMachService:(const char *)a3
{
  xpc_connection_t mach_service;
  WebBookmarksXPCConnection *v5;

  mach_service = xpc_connection_create_mach_service(a3, 0, 0);
  v5 = -[WebBookmarksXPCConnection initWithConnection:](self, "initWithConnection:", mach_service);

  return v5;
}

- (void)_handleMessage:(id)a3
{
  id v4;
  const char *string;
  NSObject *v6;
  _BOOL4 v7;
  NSMutableDictionary *messageHandlers;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  OS_xpc_object *connection;
  id WeakRetained;
  NSObject *v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (MEMORY[0x212BD5098]() == MEMORY[0x24BDACFB8])
  {
    connection = self->_connection;
    self->_connection = 0;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "connection:didCloseWithError:", self, v4);

  }
  else
  {
    string = xpc_dictionary_get_string(v4, "_name");
    v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (string)
    {
      if (v7)
      {
        v14 = 136446210;
        v15 = string;
        _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "Handling XPC message name: %{public}s.", (uint8_t *)&v14, 0xCu);
      }
      messageHandlers = self->_messageHandlers;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](messageHandlers, "objectForKey:", v9);
      v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        ((void (**)(_QWORD, WebBookmarksXPCConnection *, id))v10)[2](v10, self, v4);
      }
      else
      {
        v13 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          -[WebBookmarksXPCConnection _handleMessage:].cold.1((uint64_t)string, v13);
      }

    }
    else if (v7)
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "XPC message name unexpectedly nil, nothing to handle.", (uint8_t *)&v14, 2u);
    }
  }

}

- (void)setHandler:(id)a3 forMessageNamed:(const char *)a4
{
  NSMutableDictionary *messageHandlers;
  void *v6;
  id v7;

  messageHandlers = self->_messageHandlers;
  v7 = (id)MEMORY[0x212BD4C84](a3, a2);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](messageHandlers, "setObject:forKey:", v7, v6);

}

- (void)setMessageHandlers:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *messageHandlers;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;

  v4 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  messageHandlers = self->_messageHandlers;
  self->_messageHandlers = v4;

  if (!self->_messageHandlers)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v7 = self->_messageHandlers;
    self->_messageHandlers = v6;

  }
}

- (BOOL)hasBoolEntitlement:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  char v9;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_entitlementLookupCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = objc_retainAutorelease(v4);
    objc_msgSend(v6, "UTF8String");
    v7 = xpc_connection_copy_entitlement_value();
    v8 = (void *)v7;
    if (v7 && MEMORY[0x212BD5098](v7) == MEMORY[0x24BDACF80])
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", xpc_BOOL_get_value(v8));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = (void *)MEMORY[0x24BDBD1C0];
    }
    -[NSMutableDictionary setObject:forKey:](self->_entitlementLookupCache, "setObject:forKey:", v5, v6);

  }
  v9 = objc_msgSend(v5, "BOOLValue");

  return v9;
}

- (id)messageWithName:(const char *)a3
{
  xpc_object_t v3;
  xpc_object_t v4;
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x24BDAC8D0];
  v3 = xpc_string_create(a3);
  values = v3;
  keys[0] = "_name";
  v4 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);

  return v4;
}

- (void)sendMessage:(id)a3
{
  -[WebBookmarksXPCConnection sendMessage:withReplyHandler:](self, "sendMessage:withReplyHandler:", a3, 0);
}

- (void)sendMessage:(id)a3 withReplyHandler:(id)a4
{
  id v6;
  id v7;
  OS_xpc_object *connection;
  WebBookmarksXPCConnection *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  WebBookmarksXPCConnection *v16;

  v6 = a3;
  v7 = a4;
  connection = self->_connection;
  if (connection)
  {
    if (v7)
    {
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x3032000000;
      v15[3] = __Block_byref_object_copy__8;
      v15[4] = __Block_byref_object_dispose__8;
      v9 = self;
      v16 = v9;
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __58__WebBookmarksXPCConnection_sendMessage_withReplyHandler___block_invoke;
      v12[3] = &unk_24CB350F0;
      v13 = v7;
      v14 = v15;
      v10 = (void *)MEMORY[0x212BD4C84](v12);
      xpc_connection_send_message_with_reply(self->_connection, v6, (dispatch_queue_t)v9->_connectionQueue, v10);

      _Block_object_dispose(v15, 8);
    }
    else
    {
      xpc_connection_send_message(connection, v6);
    }
  }
  else
  {
    v11 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[WebBookmarksXPCConnection sendMessage:withReplyHandler:].cold.1(v11);
  }

}

void __58__WebBookmarksXPCConnection_sendMessage_withReplyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  if (MEMORY[0x212BD5098]() == MEMORY[0x24BDACFA0])
  {
    (*(void (**)(_QWORD, id, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3, 0);
    goto LABEL_5;
  }
  v4 = MEMORY[0x212BD5098](v3);

  if (v4 == MEMORY[0x24BDACFB8])
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WebBookmarksXPCConnectionErrorDomain"), v3 == (id)MEMORY[0x24BDACF30], 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);
LABEL_5:

  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (WebBookmarksXPCConnectionDelegate)delegate
{
  return (WebBookmarksXPCConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_entitlementLookupCache, 0);
  objc_storeStrong((id *)&self->_messageHandlers, 0);
}

- (void)_handleMessage:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 136446210;
  v3 = a1;
  _os_log_fault_impl(&dword_211022000, a2, OS_LOG_TYPE_FAULT, "WebBookmarksXPCConnection: No handler registered for the message %{public}s.", (uint8_t *)&v2, 0xCu);
}

- (void)sendMessage:(os_log_t)log withReplyHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_211022000, log, OS_LOG_TYPE_ERROR, "Unable to send message since there is no connection", v1, 2u);
}

@end
