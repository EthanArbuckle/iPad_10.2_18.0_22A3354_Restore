@implementation OS_remote_service

- (int)proxySocketOverRemoteXPC:(int)a3
{
  uint64_t v3;
  SocketRemoteXpcProxy *v5;
  OS_remote_device *device;
  id v7;
  SocketRemoteXpcProxy *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v13[5];
  id v14;
  id location;

  v3 = *(_QWORD *)&a3;
  v5 = [SocketRemoteXpcProxy alloc];
  device = self->device;
  v7 = remoted_queue();
  v8 = -[SocketRemoteXpcProxy initWithSocket:device:queue:server:](v5, "initWithSocket:device:queue:server:", v3, device, v7, 0);

  if (v8)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v8);
    v9 = -[SocketRemoteXpcProxy takeOwnershipOfClientSocket](v8, "takeOwnershipOfClientSocket");
    if (v9 < 0)
    {
      v10 = rsd_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[OS_remote_service proxySocketOverRemoteXPC:].cold.2();

    }
    -[NSMutableArray addObject:](self->proxies, "addObject:", v8);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __46__OS_remote_service_proxySocketOverRemoteXPC___block_invoke;
    v13[3] = &unk_1E95389B8;
    v13[4] = self;
    objc_copyWeak(&v14, &location);
    -[SocketRemoteXpcProxy setOnCancel:](v8, "setOnCancel:", v13);
    -[SocketRemoteXpcProxy activate](v8, "activate");
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    v11 = rsd_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[OS_remote_service proxySocketOverRemoteXPC:].cold.1();

    v9 = -1;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  free(self->name);
  v3.receiver = self;
  v3.super_class = (Class)OS_remote_service;
  -[OS_remote_service dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->proxies, 0);
  objc_storeStrong((id *)&self->keepalive, 0);
  objc_storeStrong((id *)&self->device, 0);
  objc_storeStrong((id *)&self->connection, 0);
  objc_storeStrong((id *)&self->properties, 0);
}

- (void)proxySocketOverRemoteXPC:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Failed to proxy socket over RemoteXPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)proxySocketOverRemoteXPC:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "RemoteXPC proxy's client socket is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
