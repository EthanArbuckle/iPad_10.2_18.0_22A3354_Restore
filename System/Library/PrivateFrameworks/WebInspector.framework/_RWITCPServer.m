@implementation _RWITCPServer

- (id)_initWithDelegate:(id)a3
{
  id v4;
  _RWITCPServer *v5;
  _RWITCPServer *v6;
  NSMutableArray *v7;
  NSMutableArray *connections;
  _RWITCPServer *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_RWITCPServer;
  v5 = -[_RWITCPServer init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_listenSocket = -1;
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    connections = v6->_connections;
    v6->_connections = v7;

    v9 = v6;
  }

  return v6;
}

- (_RWITCPServer)initWithPort:(unsigned __int16)a3 delegate:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  _RWITCPServer *v7;

  v4 = a3;
  v5 = -[_RWITCPServer _initWithDelegate:](self, "_initWithDelegate:", a4);
  v6 = v5;
  if (v5 && objc_msgSend(v5, "_listenOnPort:", v4))
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (_RWITCPServer)initWithLaunchdSocketName:(const char *)a3 delegate:(id)a4
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  RWIDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_RWITCPServer initWithLaunchdSocketName:delegate:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  return 0;
}

- (void)dealloc
{
  int listenSocket;
  objc_super v4;

  listenSocket = self->_listenSocket;
  if ((listenSocket & 0x80000000) == 0)
    close(listenSocket);
  v4.receiver = self;
  v4.super_class = (Class)_RWITCPServer;
  -[_RWITCPServer dealloc](&v4, sel_dealloc);
}

- (BOOL)_listenOnPort:(unsigned __int16)a3
{
  unsigned int v3;
  int v5;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  __int128 v10;
  int v11;
  int v12;

  v3 = a3;
  v5 = socket(30, 1, 6);
  self->_listenSocket = v5;
  if (v5 == -1)
  {
    RWIDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_RWITCPServer _listenOnPort:].cold.1();
  }
  else
  {
    v12 = 1;
    setsockopt(v5, 0xFFFF, 4, &v12, 4u);
    setsockopt(self->_listenSocket, 0xFFFF, 512, &v12, 4u);
    v10 = 0uLL;
    v9 = 7680;
    v11 = 0;
    WORD1(v9) = __rev16(v3);
    v10 = *MEMORY[0x24BDAE880];
    if (bind(self->_listenSocket, (const sockaddr *)&v9, 0x1Cu) == -1)
    {
      RWIDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[_RWITCPServer _listenOnPort:].cold.2(v3, v8);

      return 0;
    }
    if (listen(self->_listenSocket, 5) != -1)
      return -[_RWITCPServer _createListenDispatchSource](self, "_createListenDispatchSource");
    RWIDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_RWITCPServer _listenOnPort:].cold.3();
  }

  return 0;
}

- (BOOL)_createListenDispatchSource
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *serverQueue;
  OS_dispatch_source *v5;
  OS_dispatch_source *serverSource;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD handler[5];

  v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.webinspector.tcpserver", 0);
  serverQueue = self->_serverQueue;
  self->_serverQueue = v3;

  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA00], self->_listenSocket, 0, (dispatch_queue_t)self->_serverQueue);
  serverSource = self->_serverSource;
  self->_serverSource = v5;

  v7 = self->_serverSource;
  if (v7)
  {
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __44___RWITCPServer__createListenDispatchSource__block_invoke;
    handler[3] = &unk_24DE010C0;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume((dispatch_object_t)self->_serverSource);
  }
  else
  {
    RWIDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_RWITCPServer _createListenDispatchSource].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  }
  return v7 != 0;
}

- (void)connectionClosed:(id)a3
{
  id v4;
  NSObject *serverQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serverQueue = self->_serverQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34___RWITCPServer_connectionClosed___block_invoke;
  v7[3] = &unk_24DE01098;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serverQueue, v7);

}

- (_RWITCPServerDelegate)delegate
{
  return (_RWITCPServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_serverSource, 0);
  objc_storeStrong((id *)&self->_serverQueue, 0);
}

- (void)initWithLaunchdSocketName:(uint64_t)a3 delegate:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_21AD49000, a1, a3, "_RWITCPServer from launchd socket is only supported in the Simulator", a5, a6, a7, a8, 0);
}

- (void)_listenOnPort:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_3(v0);
  OUTLINED_FUNCTION_0_1(&dword_21AD49000, v1, v2, "_RWITCPServer: Could not create TCP listen socket: %{public}s", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_listenOnPort:(unsigned __int16)a1 .cold.2(unsigned __int16 a1, NSObject *a2)
{
  int v3;
  int *v4;
  _DWORD v5[2];
  __int16 v6;
  char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = __error();
  v5[0] = 67240450;
  v5[1] = v3;
  v6 = 2082;
  v7 = OUTLINED_FUNCTION_2_3(v4);
  _os_log_error_impl(&dword_21AD49000, a2, OS_LOG_TYPE_ERROR, "_RWITCPServer: Could not bind the Server socket to port (%{public}hu): %{public}s", (uint8_t *)v5, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (void)_listenOnPort:.cold.3()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_3(v0);
  OUTLINED_FUNCTION_0_1(&dword_21AD49000, v1, v2, "_RWITCPServer: Could not make the Server socket a listening socket: %{public}s", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_createListenDispatchSource
{
  OUTLINED_FUNCTION_2_1(&dword_21AD49000, a1, a3, "_RWITCPServer: Could not create dispatch source for socket.", a5, a6, a7, a8, 0);
}

@end
