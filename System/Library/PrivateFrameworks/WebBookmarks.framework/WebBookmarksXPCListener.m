@implementation WebBookmarksXPCListener

- (id)initListenerForMachService:(const char *)a3
{
  WebBookmarksXPCListener *v4;
  NSMutableArray *v5;
  NSMutableArray *clientConnections;
  NSMutableDictionary *v7;
  NSMutableDictionary *messageHandlers;
  NSObject *v9;
  id v10;
  xpc_connection_t mach_service;
  OS_xpc_object *listenerConnection;
  _xpc_connection_s *v13;
  WebBookmarksXPCListener *v14;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)WebBookmarksXPCListener;
  v4 = -[WebBookmarksXPCListener init](&v19, sel_init);
  if (v4)
  {
    objc_initWeak(&location, v4);
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    clientConnections = v4->_clientConnections;
    v4->_clientConnections = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    messageHandlers = v4->_messageHandlers;
    v4->_messageHandlers = v7;

    v9 = MEMORY[0x24BDAC9B8];
    v10 = MEMORY[0x24BDAC9B8];
    mach_service = xpc_connection_create_mach_service(a3, v9, 1uLL);
    listenerConnection = v4->_listenerConnection;
    v4->_listenerConnection = mach_service;

    v13 = v4->_listenerConnection;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __54__WebBookmarksXPCListener_initListenerForMachService___block_invoke;
    v16[3] = &unk_24CB350C8;
    objc_copyWeak(&v17, &location);
    xpc_connection_set_event_handler(v13, v16);
    xpc_connection_set_target_queue(v4->_listenerConnection, MEMORY[0x24BDAC9B8]);

    xpc_connection_resume(v4->_listenerConnection);
    v14 = v4;
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v4;
}

void __54__WebBookmarksXPCListener_initListenerForMachService___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleIncomingConnection:", v3);

}

- (void)_handleIncomingConnection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  const _xpc_type_s *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  WebBookmarksXPCConnection *v11;
  int v12;
  const char *name;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x212BD5098](v4);
    if (v6 == MEMORY[0x24BDACF88])
    {
      v11 = -[WebBookmarksXPCConnection initWithConnection:]([WebBookmarksXPCConnection alloc], "initWithConnection:", v5);
      -[WebBookmarksXPCConnection setDelegate:](v11, "setDelegate:", self);
      -[WebBookmarksXPCConnection setMessageHandlers:](v11, "setMessageHandlers:", self->_messageHandlers);
      -[NSMutableArray addObject:](self->_clientConnections, "addObject:", v11);

    }
    else
    {
      v7 = (const _xpc_type_s *)v6;
      v8 = WBS_LOG_CHANNEL_PREFIXWebBookmarkServer();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = v8;
        v12 = 136446210;
        name = xpc_type_get_name(v7);
        _os_log_impl(&dword_211022000, v9, OS_LOG_TYPE_INFO, "Ignoring incoming message because the message type is %{public}s", (uint8_t *)&v12, 0xCu);

      }
    }
  }
  else
  {
    v10 = WBS_LOG_CHANNEL_PREFIXWebBookmarkServer();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_211022000, v10, OS_LOG_TYPE_INFO, "Ignoring incoming message because the message is nil.", (uint8_t *)&v12, 2u);
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

- (void)connection:(id)a3 didCloseWithError:(id)a4
{
  WebBookmarksXPCConnectionDelegate **p_delegate;
  id v7;
  id WeakRetained;
  id v9;

  p_delegate = &self->_delegate;
  v7 = a4;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "connection:didCloseWithError:", v9, v7);

  objc_msgSend(v9, "setDelegate:", 0);
  -[NSMutableArray removeObject:](self->_clientConnections, "removeObject:", v9);

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
  objc_storeStrong((id *)&self->_messageHandlers, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_listenerConnection, 0);
}

@end
