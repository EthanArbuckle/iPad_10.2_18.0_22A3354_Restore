@implementation USXPCRemoteObjectProxy

+ (void)proxyFromConnection:(id)a3 withRetryCount:(unint64_t)a4 proxyHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  unint64_t v16;
  id v17;

  v8 = a3;
  v9 = a5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __74__USXPCRemoteObjectProxy_proxyFromConnection_withRetryCount_proxyHandler___block_invoke;
  v13[3] = &unk_24C7DB8C0;
  v16 = a4;
  v17 = a1;
  v14 = v8;
  v15 = v9;
  v10 = (void (**)(id, void *, _QWORD))v9;
  v11 = v8;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2](v10, v12, 0);

}

void __74__USXPCRemoteObjectProxy_proxyFromConnection_withRetryCount_proxyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __74__USXPCRemoteObjectProxy_proxyFromConnection_withRetryCount_proxyHandler___block_invoke_cold_1(a1);
  if (!*(_QWORD *)(a1 + 48))
    goto LABEL_8;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD0B88]) & 1) == 0)
  {

    goto LABEL_8;
  }
  v5 = objc_msgSend(v3, "code");

  if (v5 != 4097)
  {
LABEL_8:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 56), "proxyFromConnection:withRetryCount:proxyHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48) - 1, *(_QWORD *)(a1 + 40));
LABEL_9:

}

+ (void)synchronousProxyFromConnection:(id)a3 withRetryCount:(unint64_t)a4 proxyHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  unint64_t v16;
  id v17;

  v8 = a3;
  v9 = a5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __85__USXPCRemoteObjectProxy_synchronousProxyFromConnection_withRetryCount_proxyHandler___block_invoke;
  v13[3] = &unk_24C7DB8C0;
  v16 = a4;
  v17 = a1;
  v14 = v8;
  v15 = v9;
  v10 = (void (**)(id, void *, _QWORD))v9;
  v11 = v8;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2](v10, v12, 0);

}

void __85__USXPCRemoteObjectProxy_synchronousProxyFromConnection_withRetryCount_proxyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __74__USXPCRemoteObjectProxy_proxyFromConnection_withRetryCount_proxyHandler___block_invoke_cold_1(a1);
  if (!*(_QWORD *)(a1 + 48))
    goto LABEL_8;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD0B88]) & 1) == 0)
  {

    goto LABEL_8;
  }
  v5 = objc_msgSend(v3, "code");

  if (v5 != 4097)
  {
LABEL_8:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 56), "synchronousProxyFromConnection:withRetryCount:proxyHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48) - 1, *(_QWORD *)(a1 + 40));
LABEL_9:

}

void __74__USXPCRemoteObjectProxy_proxyFromConnection_withRetryCount_proxyHandler___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(*(id *)(a1 + 32), "serviceName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_1(&dword_20D894000, MEMORY[0x24BDACB70], v2, "Connection error from %{public}@: %{public}@\nAttempts remaining: %lu", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1_0();
}

@end
