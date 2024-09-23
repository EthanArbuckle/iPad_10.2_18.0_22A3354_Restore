@implementation CryptexRemoteService

- (CryptexRemoteService)initWithDevice:(id)a3 queue:(id)a4 flags:(unint64_t)a5
{
  OS_remote_device *v8;
  OS_dispatch_queue *v9;
  CryptexRemoteService *v10;
  OS_remote_device *device;
  OS_remote_device *v12;
  OS_dispatch_queue *client_queue;
  OS_dispatch_queue *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *internal_queue;
  OS_remote_service *service;
  OS_xpc_remote_connection *connection;
  objc_super v20;

  v8 = (OS_remote_device *)a3;
  v9 = (OS_dispatch_queue *)a4;
  v20.receiver = self;
  v20.super_class = (Class)CryptexRemoteService;
  v10 = -[CryptexRemoteService init](&v20, sel_init);
  device = v10->_device;
  v10->_device = v8;
  v12 = v8;

  client_queue = v10->_client_queue;
  v10->_client_queue = v9;
  v14 = v9;

  v10->_flags = a5;
  v15 = dispatch_queue_create("com.apple.security.libcryptex.remote_service", 0);
  internal_queue = v10->_internal_queue;
  v10->_internal_queue = (OS_dispatch_queue *)v15;

  service = v10->service;
  v10->service = 0;

  connection = v10->connection;
  v10->connection = 0;

  return v10;
}

- (void)dealloc
{
  int v3;
  NSObject *v4;
  OS_xpc_remote_connection *connection;
  OS_xpc_remote_connection *v6;
  objc_super v7;
  uint8_t buf[4];
  OS_xpc_remote_connection *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (self->connection)
  {
    v3 = *__error();
    _remote_service_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      connection = self->connection;
      *(_DWORD *)buf = 138543362;
      v9 = connection;
      _os_log_impl(&dword_2126F8000, v4, OS_LOG_TYPE_DEBUG, "canceling RXPC connection %{public}@", buf, 0xCu);
    }

    *__error() = v3;
    xpc_remote_connection_cancel();
    v6 = self->connection;
    self->connection = 0;

  }
  v7.receiver = self;
  v7.super_class = (Class)CryptexRemoteService;
  -[CryptexRemoteService dealloc](&v7, sel_dealloc);
}

- (id)remote_conn
{
  OS_xpc_remote_connection *connection;
  void *v4;
  OS_xpc_remote_connection *v5;
  OS_xpc_remote_connection *v6;
  int v7;
  NSObject *v8;
  OS_xpc_remote_connection *v9;
  int v11;
  OS_xpc_remote_connection *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  connection = self->connection;
  if (!connection)
  {
    -[CryptexRemoteService internal_queue](self, "internal_queue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (OS_xpc_remote_connection *)xpc_remote_connection_create_with_remote_service();
    v6 = self->connection;
    self->connection = v5;

    xpc_remote_connection_set_event_handler();
    xpc_remote_connection_activate();
    v7 = *__error();
    _remote_service_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = self->connection;
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_2126F8000, v8, OS_LOG_TYPE_DEBUG, "establish RXPC connection %{public}@", (uint8_t *)&v11, 0xCu);
    }

    *__error() = v7;
    connection = self->connection;
  }
  return connection;
}

int *__35__CryptexRemoteService_remote_conn__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  NSObject *v9;
  os_log_type_t v10;
  int *result;
  __int16 v12;
  uint8_t buf[2];

  v2 = MEMORY[0x212BF18F8](a2);
  v3 = MEMORY[0x24BDACFB8];
  v4 = *__error();
  _remote_service_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v2 == v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v7 = "error received on remote connection";
      v8 = buf;
      v9 = v6;
      v10 = OS_LOG_TYPE_DEBUG;
      goto LABEL_6;
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v12 = 0;
    v7 = "unexpected message from remote connection";
    v8 = (uint8_t *)&v12;
    v9 = v6;
    v10 = OS_LOG_TYPE_ERROR;
LABEL_6:
    _os_log_impl(&dword_2126F8000, v9, v10, v7, v8, 2u);
  }

  result = __error();
  *result = v4;
  return result;
}

- (__CFError)initService
{
  void *v3;
  int state;
  void *v5;
  OS_remote_service *v6;
  OS_remote_service *service;
  __CFError *v8;
  void *v9;
  NSObject *v10;
  char *v11;
  id v12;
  CFErrorRef Error;
  int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (self->service)
    -[CryptexRemoteService initService].cold.1(&v22, &v23);
  -[CryptexRemoteService device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  state = remote_device_get_state();

  if (state != 2)
  {
    _remote_service_log();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      _remote_service_log();
      v10 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      -[CryptexRemoteService device](self, "device");
      LODWORD(v23) = 138412290;
      *(_QWORD *)((char *)&v23 + 4) = objc_claimAutoreleasedReturnValue();
      v11 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v12 = MEMORY[0x24BDACB70];
      -[CryptexRemoteService device](self, "device");
      LODWORD(v23) = 138412290;
      *(_QWORD *)((char *)&v23 + 4) = objc_claimAutoreleasedReturnValue();
      v11 = (char *)_os_log_send_and_compose_impl();

      v10 = MEMORY[0x24BDACB70];
    }

    Error = createError("-[CryptexRemoteService initService]", "remote_service.m", 172, "com.apple.security.cryptex", 57, 0, v11);
    goto LABEL_9;
  }
  -[CryptexRemoteService device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (OS_remote_service *)remote_device_copy_service();
  service = self->service;
  self->service = v6;

  if (!self->service)
  {
    v15 = *__error();
    if (v15 == 83)
    {
      _remote_service_log();
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        _remote_service_log();
        v19 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
        *(_QWORD *)&v23 = 0x5304000100;
        v11 = (char *)_os_log_send_and_compose_impl();

      }
      else
      {
        *(_QWORD *)&v23 = 0x5304000100;
        v11 = (char *)_os_log_send_and_compose_impl();
      }
      Error = createError("-[CryptexRemoteService initService]", "remote_service.m", 191, "com.apple.security.cryptex.posix", 83, 0, v11);
    }
    else if (v15 == 3)
    {
      _remote_service_log();
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        _remote_service_log();
        v17 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
        *(_QWORD *)&v23 = 0x304000100;
        v11 = (char *)_os_log_send_and_compose_impl();

      }
      else
      {
        *(_QWORD *)&v23 = 0x304000100;
        v11 = (char *)_os_log_send_and_compose_impl();
      }
      Error = createError("-[CryptexRemoteService initService]", "remote_service.m", 185, "com.apple.security.cryptex.posix", 3, 0, v11);
    }
    else
    {
      _remote_service_log();
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        _remote_service_log();
        v21 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
        LODWORD(v23) = 67109120;
        DWORD1(v23) = v15;
        v11 = (char *)_os_log_send_and_compose_impl();

      }
      else
      {
        LODWORD(v23) = 67109120;
        DWORD1(v23) = v15;
        v11 = (char *)_os_log_send_and_compose_impl();
      }
      Error = createError("-[CryptexRemoteService initService]", "remote_service.m", 197, "com.apple.security.cryptex.posix", v15, 0, v11);
    }
LABEL_9:
    v8 = Error;
    free(v11);
    return v8;
  }
  return 0;
}

- (BOOL)supportsFeature:(const char *)a3
{
  __CFError *v4;
  __CFError *v5;
  int v6;
  NSObject *v7;
  int v8;
  __CFError *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (self->service)
    return remote_service_supports_feature();
  v4 = -[CryptexRemoteService initService](self, "initService", a3);
  if (!v4)
    return remote_service_supports_feature();
  v5 = v4;
  v6 = *__error();
  _remote_service_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_2126F8000, v7, OS_LOG_TYPE_ERROR, "failed to init service: %@", (uint8_t *)&v8, 0xCu);
  }

  *__error() = v6;
  CFRelease(v5);
  return 0;
}

- (__CFError)sendRequestSync:(id)a3 response:(id *)a4
{
  id v6;
  __CFError *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  __CFError *v12;
  int v13;
  NSObject *v14;
  int cferr;
  void *v16;
  NSObject *v17;
  char *v18;
  __CFError *Error;
  int v20;
  NSObject *v21;
  __CFError *v22;
  void *v23;
  NSObject *v24;
  char *v25;
  void *v26;
  NSObject *v27;
  char *v28;
  int argv;
  id v30;
  void *v31;
  void *v32;
  NSObject *v33;
  char *v34;
  id v36;
  CFTypeRef cf;
  uint8_t buf[4];
  __CFError *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  cf = 0;
  if (self->service || (Error = -[CryptexRemoteService initService](self, "initService")) == 0)
  {
    v7 = (__CFError *)xpc_copy_debug_description();
    v8 = *__error();
    _remote_service_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v39 = v7;
      _os_log_impl(&dword_2126F8000, v9, OS_LOG_TYPE_DEBUG, "sending request: %s", buf, 0xCu);
    }

    *__error() = v8;
    free(v7);
    -[CryptexRemoteService remote_conn](self, "remote_conn");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)xpc_remote_connection_send_message_with_reply_sync();

    if (MEMORY[0x212BF18F8](v11) == MEMORY[0x24BDACFB8])
    {
      v22 = (__CFError *)xpc_copy_debug_description();
      _remote_service_log();
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        _remote_service_log();
        v24 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
        *(_DWORD *)buf = 136315138;
        v39 = v22;
        v25 = (char *)_os_log_send_and_compose_impl();

      }
      else
      {
        *(_DWORD *)buf = 136315138;
        v39 = v22;
        v25 = (char *)_os_log_send_and_compose_impl();
      }
      Error = createError("-[CryptexRemoteService sendRequestSync:response:]", "remote_service.m", 249, "com.apple.security.cryptex", 54, 0, v25);
      free(v25);
      free(v22);

    }
    else
    {
      v12 = (__CFError *)xpc_copy_debug_description();
      v13 = *__error();
      _remote_service_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v39 = v12;
        _os_log_impl(&dword_2126F8000, v14, OS_LOG_TYPE_DEBUG, "got reply: %s", buf, 0xCu);
      }

      *__error() = v13;
      free(v12);
      cferr = _xpc_reply_get_cferr(v11, &cf);
      if (cferr)
      {
        _remote_service_log();
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          _remote_service_log();
          v17 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
          *(_WORD *)buf = 0;
          v18 = (char *)_os_log_send_and_compose_impl();

        }
        else
        {
          *(_WORD *)buf = 0;
          v18 = (char *)_os_log_send_and_compose_impl();
        }
        Error = createError("-[CryptexRemoteService sendRequestSync:response:]", "remote_service.m", 261, "com.apple.security.cryptex", cferr, 0, v18);
        free(v18);

      }
      else if (cf)
      {
        _remote_service_log();
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          _remote_service_log();
          v27 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
          *(_WORD *)buf = 0;
          v28 = (char *)_os_log_send_and_compose_impl();

        }
        else
        {
          *(_WORD *)buf = 0;
          v28 = (char *)_os_log_send_and_compose_impl();
        }
        Error = createError("-[CryptexRemoteService sendRequestSync:response:]", "remote_service.m", 269, "com.apple.security.cryptex", 16, cf, v28);
        free(v28);

      }
      else
      {
        v36 = 0;
        argv = _xpc_reply_get_argv(v11, &v36);
        v30 = v36;
        v31 = v30;
        if (argv)
        {
          _remote_service_log();
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            _remote_service_log();
            v33 = objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
            *(_WORD *)buf = 0;
            v34 = (char *)_os_log_send_and_compose_impl();

          }
          else
          {
            *(_WORD *)buf = 0;
            v34 = (char *)_os_log_send_and_compose_impl();
          }
          Error = createError("-[CryptexRemoteService sendRequestSync:response:]", "remote_service.m", 276, "com.apple.security.cryptex", argv, 0, v34);
          free(v34);

        }
        else
        {
          *a4 = xpc_copy(v30);

          Error = 0;
        }
      }
    }
  }
  else
  {
    v20 = *__error();
    _remote_service_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v39 = Error;
      _os_log_impl(&dword_2126F8000, v21, OS_LOG_TYPE_ERROR, "failed to init service: %@", buf, 0xCu);
    }

    *__error() = v20;
  }
  if (cf)
    CFRelease(cf);

  return Error;
}

- (OS_remote_device)device
{
  return self->_device;
}

- (OS_dispatch_queue)client_queue
{
  return self->_client_queue;
}

- (OS_dispatch_queue)internal_queue
{
  return self->_internal_queue;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal_queue, 0);
  objc_storeStrong((id *)&self->_client_queue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->connection, 0);
  objc_storeStrong((id *)&self->service, 0);
}

- (void)initService
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7_1();
  _os_crash_msg();
  __break(1u);
}

@end
