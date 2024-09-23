@implementation _RWITCPConnection

+ (_RWITCPConnection)TCPConnectionWithSocketPath:(id)a3
{
  id v4;
  void *v5;
  char v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v12;
  id v13;
  int v14;
  NSObject *v15;
  int *v16;
  char *v17;
  NSObject *v18;
  int *v19;
  char *v20;
  uint64_t v21;
  sockaddr v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = objc_msgSend(v4, "lengthOfBytesUsingEncoding:", 4);
    if (v7 < 0x68)
    {
      v12 = socket(1, 1, 0);
      if ((_DWORD)v12 == -1)
      {
        RWIDefaultLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = __error();
          v17 = strerror(*v16);
          +[_RWITCPConnection TCPConnectionWithSocketPath:].cold.2((uint64_t)v17, (uint64_t)&v22, (uint64_t)v4);
        }

      }
      else
      {
        v22.sa_family = 1;
        v13 = objc_retainAutorelease(v4);
        strlcpy(v22.sa_data, (const char *)objc_msgSend(v13, "UTF8String"), 0x68uLL);
        v14 = strlen(v22.sa_data);
        if (connect(v12, &v22, v14 + 2) != -1)
        {
          v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithServer:socket:", 0, v12);
          goto LABEL_10;
        }
        RWIDefaultLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = __error();
          v20 = strerror(*v19);
          +[_RWITCPConnection TCPConnectionWithSocketPath:].cold.3((uint64_t)v20, (uint64_t)&v21, (uint64_t)v13);
        }

        close(v12);
      }
    }
    else
    {
      RWIDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[_RWITCPConnection TCPConnectionWithSocketPath:].cold.1((uint64_t)v4, v7, v8);

    }
  }
  else
  {
    RWIDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[_RWITCPConnection TCPConnectionWithSocketPath:].cold.4((uint64_t)v4, v9);

  }
  v10 = 0;
LABEL_10:

  return (_RWITCPConnection *)v10;
}

- (_RWITCPConnection)initWithServer:(id)a3 socket:(int)a4
{
  uint64_t v4;
  id v6;
  _RWITCPConnection *v7;
  _RWITCPConnection *v8;
  _RWITCPConnection *v9;
  objc_super v11;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_RWITCPConnection;
  v7 = -[_RWITCPConnection init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    -[_RWITCPConnection _commonInitializationWithServer:socket:type:](v7, "_commonInitializationWithServer:socket:type:", v6, v4, 0);
    v9 = v8;
  }

  return v8;
}

+ (_RWITCPConnection)TCPConnectionWithLockdownConnection:(_lockdown_connection *)a3
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (lockdown_get_socket() == -1)
  {
    RWIDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[_RWITCPConnection TCPConnectionWithLockdownConnection:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    v5 = 0;
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithServer:lockdownConnection:", 0, a3);
  }
  return (_RWITCPConnection *)v5;
}

- (_RWITCPConnection)initWithServer:(id)a3 lockdownConnection:(_lockdown_connection *)a4
{
  id v6;
  _RWITCPConnection *v7;
  uint64_t socket;
  _RWITCPConnection *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_RWITCPConnection;
  v7 = -[_RWITCPConnection init](&v11, sel_init);
  if (v7)
  {
    socket = lockdown_get_socket();
    v7->_connection = a4;
    -[_RWITCPConnection _commonInitializationWithServer:socket:type:](v7, "_commonInitializationWithServer:socket:type:", v6, socket, 1);
    v9 = v7;
  }

  return v7;
}

- (void)_commonInitializationWithServer:(id)a3 socket:(int)a4 type:(int64_t)a5
{
  NSMutableArray *v9;
  NSMutableArray *outputMessageQueue;
  NSMutableData *v11;
  NSMutableData *incomingData;
  OS_dispatch_queue *v13;
  OS_dispatch_queue *connectionQueue;
  id v15;

  v15 = a3;
  objc_storeStrong((id *)&self->_server, a3);
  self->_socket = a4;
  self->_type = a5;
  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  outputMessageQueue = self->_outputMessageQueue;
  self->_outputMessageQueue = v9;

  v11 = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
  incomingData = self->_incomingData;
  self->_incomingData = v11;

  v13 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.webinspector.tcpconnection", 0);
  connectionQueue = self->_connectionQueue;
  self->_connectionQueue = v13;

  -[_RWITCPConnection _createOutputSource](self, "_createOutputSource");
  -[_RWITCPConnection _createInputSource](self, "_createInputSource");

}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_delegate, 0);
  -[_RWITCPConnection _shutdown](self, "_shutdown");
  v3.receiver = self;
  v3.super_class = (Class)_RWITCPConnection;
  -[_RWITCPConnection dealloc](&v3, sel_dealloc);
}

- (void)_shutdown
{
  NSMutableArray *outputMessageQueue;
  NSMutableData *incomingData;
  OS_dispatch_queue *connectionQueue;

  if (!self->_shutdown)
  {
    self->_shutdown = 1;
    -[_RWITCPConnection _closeInputStream](self, "_closeInputStream");
    -[_RWITCPConnection _closeOutputStream](self, "_closeOutputStream");
    outputMessageQueue = self->_outputMessageQueue;
    self->_outputMessageQueue = 0;

    incomingData = self->_incomingData;
    self->_incomingData = 0;

    connectionQueue = self->_connectionQueue;
    self->_connectionQueue = 0;

  }
}

- (void)_dispatchSourceCancelled
{
  int64_t type;
  int socket;
  int *p_socket;

  if (self->_inputSourceCancelled && self->_outputSourceCancelled)
  {
    type = self->_type;
    if (type == 1)
    {
      if (!self->_connection)
        return;
      lockdown_disconnect();
      self->_connection = 0;
      p_socket = &self->_socket;
      goto LABEL_9;
    }
    if (!type)
    {
      p_socket = &self->_socket;
      socket = self->_socket;
      if ((socket & 0x80000000) == 0)
      {
        close(socket);
LABEL_9:
        *p_socket = -1;
      }
    }
  }
}

- (void)sendMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *connectionQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  connectionQueue = self->_connectionQueue;
  if (connectionQueue)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __33___RWITCPConnection_sendMessage___block_invoke;
    v7[3] = &unk_24DE01008;
    v7[4] = self;
    v8 = v4;
    dispatch_async(connectionQueue, v7);

  }
}

- (void)startReceiving
{
  dispatch_resume((dispatch_object_t)self->_inputSource);
}

- (void)_createOutputSource
{
  OS_dispatch_source *v3;
  OS_dispatch_source *outputSource;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD handler[5];

  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA30], self->_socket, 0, (dispatch_queue_t)self->_connectionQueue);
  outputSource = self->_outputSource;
  self->_outputSource = v3;

  v5 = MEMORY[0x24BDAC760];
  v6 = self->_outputSource;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __40___RWITCPConnection__createOutputSource__block_invoke;
  handler[3] = &unk_24DE01030;
  handler[4] = self;
  dispatch_source_set_event_handler(v6, handler);
  v7 = self->_outputSource;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __40___RWITCPConnection__createOutputSource__block_invoke_2;
  v8[3] = &unk_24DE01030;
  v8[4] = self;
  dispatch_source_set_cancel_handler(v7, v8);
  self->_outputSourceSuspended = 1;
}

- (void)_closeOutputStream
{
  NSObject *outputSource;
  OS_dispatch_source *v4;
  _RWITCPServer *server;
  _QWORD block[5];

  outputSource = self->_outputSource;
  if (outputSource)
  {
    if (self->_outputSourceSuspended)
    {
      -[_RWITCPConnection _setOutputSourceSuspended:](self, "_setOutputSourceSuspended:", 0);
      outputSource = self->_outputSource;
    }
    dispatch_source_cancel(outputSource);
    v4 = self->_outputSource;
    self->_outputSource = 0;

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39___RWITCPConnection__closeOutputStream__block_invoke;
    block[3] = &unk_24DE01030;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    server = self->_server;
    if (server)
      -[_RWITCPServer connectionClosed:](server, "connectionClosed:", self);
  }
}

- (void)_setOutputSourceSuspended:(BOOL)a3
{
  NSObject *outputSource;
  BOOL v5;

  outputSource = self->_outputSource;
  if (a3)
  {
    dispatch_suspend(outputSource);
    v5 = 1;
  }
  else
  {
    dispatch_resume(outputSource);
    v5 = 0;
  }
  self->_outputSourceSuspended = v5;
}

- (void)_handleOutput
{
  OUTLINED_FUNCTION_2_1(&dword_21AD49000, a1, a3, "_RWITCPConnection failed to write a message", a5, a6, a7, a8, 0);
}

- (void)_createInputSource
{
  OS_dispatch_source *v3;
  OS_dispatch_source *inputSource;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD handler[5];

  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA00], self->_socket, 0, (dispatch_queue_t)self->_connectionQueue);
  inputSource = self->_inputSource;
  self->_inputSource = v3;

  v5 = MEMORY[0x24BDAC760];
  v6 = self->_inputSource;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __39___RWITCPConnection__createInputSource__block_invoke;
  handler[3] = &unk_24DE01030;
  handler[4] = self;
  dispatch_source_set_event_handler(v6, handler);
  v7 = self->_inputSource;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __39___RWITCPConnection__createInputSource__block_invoke_2;
  v8[3] = &unk_24DE01030;
  v8[4] = self;
  dispatch_source_set_cancel_handler(v7, v8);
}

- (void)_closeInputStream
{
  NSObject *inputSource;
  OS_dispatch_source *v4;

  inputSource = self->_inputSource;
  if (inputSource)
  {
    dispatch_source_cancel(inputSource);
    v4 = self->_inputSource;
    self->_inputSource = 0;

  }
}

- (void)_handleInput
{
  *(_DWORD *)buf = 67240450;
  *((_DWORD *)buf + 1) = a3;
  *((_WORD *)buf + 4) = 2082;
  *(_QWORD *)(buf + 10) = a1;
  _os_log_error_impl(&dword_21AD49000, log, OS_LOG_TYPE_ERROR, "_RWITCPConnection read failed: %{public}d - %{public}s", buf, 0x12u);
}

- (void)_processIncomingBytes:(const char *)a3 length:(int64_t)a4
{
  NSMutableData *incomingData;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  NSMutableData *v11;
  _QWORD block[5];
  id v13;
  id v14;

  -[NSMutableData appendBytes:length:](self->_incomingData, "appendBytes:length:", a3, a4);
  incomingData = self->_incomingData;
  v14 = 0;
  +[_RWITCPRelayMessage TCPRelayMessageFromDataStream:error:](_RWITCPRelayMessage, "TCPRelayMessageFromDataStream:error:", incomingData, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  if (v7)
  {
LABEL_5:
    -[_RWITCPConnection _shutdown](self, "_shutdown");
  }
  else
  {
    v8 = MEMORY[0x24BDAC760];
    v9 = MEMORY[0x24BDAC9B8];
    while (v6)
    {
      -[NSMutableData replaceBytesInRange:withBytes:length:](self->_incomingData, "replaceBytesInRange:withBytes:length:", 0, objc_msgSend(v6, "length"), 0, 0);
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __50___RWITCPConnection__processIncomingBytes_length___block_invoke;
      block[3] = &unk_24DE01008;
      block[4] = self;
      v13 = v6;
      v10 = v6;
      dispatch_async(v9, block);

      v11 = self->_incomingData;
      v14 = 0;
      +[_RWITCPRelayMessage TCPRelayMessageFromDataStream:error:](_RWITCPRelayMessage, "TCPRelayMessageFromDataStream:error:", v11, &v14);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v14;
      if (v7)
        goto LABEL_5;
    }
  }

}

- (_RWITCPConnectionDelegate)delegate
{
  return (_RWITCPConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_incomingData, 0);
  objc_storeStrong((id *)&self->_outputMessageQueue, 0);
  objc_storeStrong((id *)&self->_outputSource, 0);
  objc_storeStrong((id *)&self->_inputSource, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

+ (void)TCPConnectionWithSocketPath:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 138478339;
  v4 = a1;
  v5 = 2050;
  v6 = a2;
  v7 = 2050;
  v8 = 104;
  _os_log_error_impl(&dword_21AD49000, log, OS_LOG_TYPE_ERROR, "_RWITCPConnection: path to unix domain socket at '%{private}@' is too long: path is %{public}lu bytes, but must be less than %{public}lu bytes", (uint8_t *)&v3, 0x20u);
}

+ (void)TCPConnectionWithSocketPath:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_0_0(a1, a2, a3, 5.8081e-34);
  OUTLINED_FUNCTION_1_0(&dword_21AD49000, "_RWITCPConnection: Could not create unix domain socket at patch %{private}@: %{public}s", v3, v4);
}

+ (void)TCPConnectionWithSocketPath:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_0_0(a1, a2, a3, 5.8081e-34);
  OUTLINED_FUNCTION_1_0(&dword_21AD49000, "_RWITCPConnection: Could not connect to unix domain socket at (%{private}@): %{public}s", v3, v4);
}

+ (void)TCPConnectionWithSocketPath:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138477827;
  v3 = a1;
  _os_log_error_impl(&dword_21AD49000, a2, OS_LOG_TYPE_ERROR, "_RWITCPConnection: provided unix domain socket does not exist at path %{private}@", (uint8_t *)&v2, 0xCu);
}

+ (void)TCPConnectionWithLockdownConnection:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_21AD49000, a1, a3, "_RWITCPConnection: lockdown_get_socket invalid socket", a5, a6, a7, a8, 0);
}

@end
