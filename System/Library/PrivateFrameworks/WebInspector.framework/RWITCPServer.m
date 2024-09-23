@implementation RWITCPServer

void __44___RWITCPServer__createListenDispatchSource__block_invoke(uint64_t a1)
{
  uint64_t v2;
  _RWITCPConnection *v3;
  NSObject *v4;
  _QWORD v5[5];
  _RWITCPConnection *v6;
  socklen_t v7;
  sockaddr v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v8.sa_len = 0;
  *(_QWORD *)&v8.sa_data[6] = 0;
  v7 = 16;
  v2 = accept(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 8), &v8, &v7);
  if ((_DWORD)v2 == -1)
  {
    RWIDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __44___RWITCPServer__createListenDispatchSource__block_invoke_cold_1();
  }
  else
  {
    v3 = -[_RWITCPConnection initWithServer:socket:]([_RWITCPConnection alloc], "initWithServer:socket:", *(_QWORD *)(a1 + 32), v2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", v3);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __44___RWITCPServer__createListenDispatchSource__block_invoke_5;
    v5[3] = &unk_24DE01098;
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v3;
    v4 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v5);

  }
}

void __44___RWITCPServer__createListenDispatchSource__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(v4, "tcpServer:receivedConnection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

void __34___RWITCPServer_connectionClosed___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  void *v6;
  uint64_t v7;
  id v8;

  v3 = MEMORY[0x24BDAC760];
  v4 = 3221225472;
  v5 = __34___RWITCPServer_connectionClosed___block_invoke_2;
  v6 = &unk_24DE01098;
  v2 = *(void **)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], &v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40), v3, v4, v5, v6, v7);

}

void __34___RWITCPServer_connectionClosed___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(v4, "tcpServer:closedConnection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

void __44___RWITCPServer__createListenDispatchSource__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0_1(&dword_21AD49000, v1, v2, "_RWITCPServer: Could not accept incoming connection: %{public}s", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_2();
}

@end
