@implementation REHTTPServer

- (REHTTPServer)initWithPort:(unsigned __int16)a3 delegate:(id)a4
{
  id v7;
  REHTTPServer *v8;
  REHTTPServer *v9;
  uint64_t v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  NSMutableArray *connections;
  void *v14;
  objc_super v16;

  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)REHTTPServer;
  v8 = -[REHTTPServer init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_delegate, a4);
    RECreateSharedQueue(CFSTR("HTTPServer"));
    v10 = objc_claimAutoreleasedReturnValue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    connections = v9->_connections;
    v9->_connections = (NSMutableArray *)v12;

    objc_msgSend(MEMORY[0x24BDD1968], "valueWithWeakObject:", v9);
    v9->_port = a3;
    v9->_server = (_CFHTTPServer *)_CFHTTPServerCreateService();
    _CFHTTPServerSetDispatchQueue();
    if (!v9->_port)
    {
      v14 = (void *)_CFHTTPServerCopyProperty();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && objc_msgSend(v14, "unsignedIntegerValue", 1, 0x2133BF688, _HTTPServerRecievedError, _HTTPServerDidOpenConnection, _HTTPServerDidCloseConnection))
      {
        v9->_port = objc_msgSend(v14, "unsignedIntegerValue");
      }

    }
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[REHTTPServer invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)REHTTPServer;
  -[REHTTPServer dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  if (-[REHTTPServer _valid](self, "_valid"))
    _CFHTTPServerInvalidate();
}

- (BOOL)_valid
{
  _CFHTTPServer *server;

  server = self->_server;
  if (server)
    LOBYTE(server) = _CFHTTPServerIsValid() != 0;
  return (char)server;
}

- (void)invalidated
{
  OUTLINED_FUNCTION_2_1(&dword_2132F7000, a1, a3, "Server invalidated", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)didRecievedError:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a3;
  RELogForDomain(21);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[REHTTPServer didRecievedError:].cold.1((uint64_t)v3, v4, v5);

}

- (void)didOpenConnection:(_CFHTTPServerConnection *)a3
{
  REHTTPConnection *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = -[REHTTPConnection initWithConnection:]([REHTTPConnection alloc], "initWithConnection:", a3);
  if (v4)
  {
    -[NSMutableArray addObject:](self->_connections, "addObject:", v4);
    -[REHTTPConnection setDelegate:](v4, "setDelegate:", self);
    -[REHTTPConnection open](v4, "open");
    RELogForDomain(21);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[REHTTPServer didOpenConnection:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
}

- (void)didCloseConnection:(_CFHTTPServerConnection *)a3
{
  NSMutableArray *connections;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0x7FFFFFFFFFFFFFFFLL;
  connections = self->_connections;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __35__REHTTPServer_didCloseConnection___block_invoke;
  v13[3] = &unk_24CF91270;
  v13[4] = &v14;
  v13[5] = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](connections, "enumerateObjectsUsingBlock:", v13);
  if (v15[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_connections, "removeObjectAtIndex:");
    RELogForDomain(21);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[REHTTPServer didCloseConnection:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  _Block_object_dispose(&v14, 8);
}

void __35__REHTTPServer_didCloseConnection___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "connection") == *(_QWORD *)(a1 + 40))
  {
    *a4 = 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    objc_msgSend(v7, "close");
  }

}

- (void)connection:(id)a3 didReceiveRequest:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v7 = a4;
  v8 = a5;
  RELogForDomain(21);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[REHTTPServer connection:didReceiveRequest:completion:].cold.1(v7, v9);

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__REHTTPServer_connection_didReceiveRequest_completion___block_invoke;
  block[3] = &unk_24CF8AA00;
  block[4] = self;
  v14 = v7;
  v15 = v8;
  v11 = v8;
  v12 = v7;
  dispatch_async(queue, block);

}

void __56__REHTTPServer_connection_didReceiveRequest_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "httpServer:handleRequest:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (unsigned)port
{
  return self->_port;
}

- (REHTTPServerDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)didRecievedError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_1(&dword_2132F7000, a2, a3, "Server encountered error %@", (uint8_t *)&v3);
}

- (void)didOpenConnection:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_2132F7000, a1, a3, "Opening new server connection", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)didCloseConnection:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_2132F7000, a1, a3, "Closing server connection", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)connection:(void *)a1 didReceiveRequest:(NSObject *)a2 completion:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_1_1(&dword_2132F7000, a2, v4, "Received request at path %@", (uint8_t *)&v5);

}

@end
