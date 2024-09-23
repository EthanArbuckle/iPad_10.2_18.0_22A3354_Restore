@implementation SocketRemoteXpcProxy

- (SocketRemoteXpcProxy)initWithSocket:(int)a3 device:(id)a4 queue:(id)a5 server:(BOOL)a6
{
  id v8;
  NSObject *v9;
  SocketRemoteXpcProxy *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  int connected_ipv6_pair;
  NSObject *v16;
  SocketRemoteXpcProxy *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  OS_xpc_remote_connection *peer;
  id v23;
  dispatch_source_t v24;
  OS_dispatch_source *proxyServer;
  id onCancel;
  id v28;
  objc_super v29;
  uintptr_t handle;

  v8 = a4;
  v9 = a5;
  handle = -1;
  v29.receiver = self;
  v29.super_class = (Class)SocketRemoteXpcProxy;
  v10 = -[SocketRemoteXpcProxy init](&v29, sel_init);
  if (!v10)
    goto LABEL_14;
  remote_device_get_type(v8);
  if (MEMORY[0x1E0D87390])
  {
    xpc_remote_connection_get_version_flags();
    v12 = (void *)xpc_remote_connection_create_with_connected_fd();
    if (remote_device_xpc_remote_connection_tls_enabled(v8))
    {
      remote_device_copy_xpc_remote_connection_tls_identity(v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v8;
      xpc_remote_connection_set_tls();

    }
    v14 = rsd_log();
    connected_ipv6_pair = remote_socket_create_connected_ipv6_pair((int *)&handle + 1, (int *)&handle, v14);

    if (connected_ipv6_pair)
    {
      v16 = rsd_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[SocketRemoteXpcProxy initWithSocket:device:queue:server:].cold.2(v16);

      goto LABEL_12;
    }
    v18 = HIDWORD(handle);
    v19 = fcntl(SHIDWORD(handle), 3, 0);
    fcntl(v18, 4, v19 & 0xFFFFFFFB);
    v20 = handle;
    v21 = fcntl(handle, 3, 0);
    fcntl(v20, 4, v21 | 4u);
    fcntl(SHIDWORD(handle), 2, 1);
    fcntl(handle, 2, 1);
    v10->_proxyClient = HIDWORD(handle);
    objc_storeStrong((id *)&v10->_queue, a5);
    peer = v10->_peer;
    v10->_peer = (OS_xpc_remote_connection *)v12;
    v23 = v12;

    v24 = dispatch_source_create(MEMORY[0x1E0C80DB8], (int)handle, 0, v9);
    proxyServer = v10->_proxyServer;
    v10->_proxyServer = (OS_dispatch_source *)v24;

    onCancel = v10->_onCancel;
    v10->_onCancel = 0;

LABEL_14:
    v17 = v10;
    goto LABEL_15;
  }
  v11 = rsd_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[SocketRemoteXpcProxy initWithSocket:device:queue:server:].cold.1();

LABEL_12:
  v17 = 0;
LABEL_15:

  return v17;
}

void __59__SocketRemoteXpcProxy_initWithSocket_device_queue_server___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  remote_device_authenticate(*(void **)(a1 + 32), a3, a4);
}

- (void)activate
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  _QWORD handler[10];

  -[SocketRemoteXpcProxy peer](self, "peer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SocketRemoteXpcProxy queue](self, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_remote_connection_set_target_queue();

  -[SocketRemoteXpcProxy peer](self, "peer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  handler[5] = MEMORY[0x1E0C809B0];
  handler[6] = 3221225472;
  handler[7] = __32__SocketRemoteXpcProxy_activate__block_invoke;
  handler[8] = &unk_1E9538968;
  handler[9] = self;
  xpc_remote_connection_set_event_handler();

  -[SocketRemoteXpcProxy proxyServer](self, "proxyServer");
  v7 = objc_claimAutoreleasedReturnValue();
  handler[0] = v6;
  handler[1] = 3221225472;
  handler[2] = __32__SocketRemoteXpcProxy_activate__block_invoke_5;
  handler[3] = &unk_1E9538990;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);

  -[SocketRemoteXpcProxy proxyServer](self, "proxyServer");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __32__SocketRemoteXpcProxy_activate__block_invoke_7;
  v11[3] = &unk_1E9538990;
  v11[4] = self;
  dispatch_source_set_cancel_handler(v8, v11);

  -[SocketRemoteXpcProxy peer](self, "peer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_remote_connection_activate();

  -[SocketRemoteXpcProxy proxyServer](self, "proxyServer");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_activate(v10);

}

void __32__SocketRemoteXpcProxy_activate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  size_t length;
  NSObject *v6;
  NSObject *v7;
  int handle;
  const void *bytes_ptr;
  NSObject *v10;
  int v11;
  size_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MEMORY[0x1D824F93C]() == MEMORY[0x1E0C81310])
  {
    v10 = rsd_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = 138543362;
      v12 = (size_t)v3;
      _os_log_impl(&dword_1D3442000, v10, OS_LOG_TYPE_INFO, "RemoteXPC error: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "cancel");
  }
  else
  {
    xpc_dictionary_get_value(v3, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    length = xpc_data_get_length(v4);
    v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v11 = 134217984;
      v12 = length;
      _os_log_impl(&dword_1D3442000, v6, OS_LOG_TYPE_INFO, "Proxying %zu bytes from RemoteXPC to socket", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "proxyServer");
    v7 = objc_claimAutoreleasedReturnValue();
    handle = dispatch_source_get_handle(v7);
    bytes_ptr = xpc_data_get_bytes_ptr(v4);
    write(handle, bytes_ptr, length);

  }
}

void __32__SocketRemoteXpcProxy_activate__block_invoke_5(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  int handle;
  NSObject *v5;
  size_t v6;
  void *v7;
  ssize_t v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *empty;
  void *v12;
  int v13;
  ssize_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "proxyServer");
  v3 = objc_claimAutoreleasedReturnValue();
  handle = dispatch_source_get_handle(v3);

  objc_msgSend(*v2, "proxyServer");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_source_get_data(v5) + 1;

  v7 = malloc_type_malloc(v6, 0x9087CE49uLL);
  v8 = read(handle, v7, v6);
  v9 = rsd_log();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      v13 = 134217984;
      v14 = v8;
      _os_log_impl(&dword_1D3442000, v9, OS_LOG_TYPE_INFO, "Proxying %zu bytes from socket over RemoteXPC", (uint8_t *)&v13, 0xCu);
    }

    empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_data(empty, "data", v7, v8);
    objc_msgSend(*(id *)(a1 + 32), "peer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_remote_connection_send_message();

  }
  else
  {
    if (v10)
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1D3442000, v9, OS_LOG_TYPE_INFO, "Client closed their socket", (uint8_t *)&v13, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "proxyServer");
    empty = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(empty);
  }

  free(v7);
}

void __32__SocketRemoteXpcProxy_activate__block_invoke_7(uint64_t a1)
{
  NSObject *v2;
  int handle;
  void *v4;
  NSObject *v5;
  void (**v6)(void);
  uint8_t v7[16];

  objc_msgSend(*(id *)(a1 + 32), "proxyServer");
  v2 = objc_claimAutoreleasedReturnValue();
  handle = dispatch_source_get_handle(v2);

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  close(handle);
  if ((objc_msgSend(*(id *)(a1 + 32), "proxyClient") & 0x80000000) == 0)
  {
    close(objc_msgSend(*(id *)(a1 + 32), "proxyClient"));
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) = -1;
  }
  objc_msgSend(*(id *)(a1 + 32), "onCancel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D3442000, v5, OS_LOG_TYPE_INFO, "Cancel socket proxy", v7, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "onCancel");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

    objc_msgSend(*(id *)(a1 + 32), "setOnCancel:", 0);
  }
}

- (int)takeOwnershipOfClientSocket
{
  int result;

  result = -[SocketRemoteXpcProxy proxyClient](self, "proxyClient");
  self->_proxyClient = -1;
  return result;
}

- (void)cancel
{
  NSObject *v3;
  void *v4;

  -[SocketRemoteXpcProxy proxyServer](self, "proxyServer");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v3);

  -[SocketRemoteXpcProxy peer](self, "peer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_remote_connection_send_barrier();

}

void __30__SocketRemoteXpcProxy_cancel__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "peer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  xpc_remote_connection_cancel();

}

- (OS_xpc_remote_connection)peer
{
  return self->_peer;
}

- (int)proxyClient
{
  return self->_proxyClient;
}

- (OS_dispatch_source)proxyServer
{
  return self->_proxyServer;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)onCancel
{
  return self->_onCancel;
}

- (void)setOnCancel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onCancel, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_proxyServer, 0);
  objc_storeStrong((id *)&self->_peer, 0);
}

- (void)initWithSocket:device:queue:server:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "RemoteXPC is unavailable.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)initWithSocket:(NSObject *)a1 device:queue:server:.cold.2(NSObject *a1)
{
  int *v2;
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_14();
  _os_log_error_impl(&dword_1D3442000, a1, OS_LOG_TYPE_ERROR, "creating socket pair failed: %s", v3, 0xCu);
}

@end
