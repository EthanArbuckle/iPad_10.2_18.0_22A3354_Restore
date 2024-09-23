@implementation STXPCRemoteObjectProxy

+ (void)proxyFromConnection:(id)a3 proxyHandler:(id)a4
{
  objc_msgSend(a1, "_proxyFromConnection:withRetryCount:proxyHandler:", a3, 1, a4);
}

+ (void)_proxyFromConnection:(id)a3 withRetryCount:(unint64_t)a4 proxyHandler:(id)a5
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
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__STXPCRemoteObjectProxy__proxyFromConnection_withRetryCount_proxyHandler___block_invoke;
  v13[3] = &unk_1E9372048;
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

void __75__STXPCRemoteObjectProxy__proxyFromConnection_withRetryCount_proxyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  v4 = v3;
  if (!*(_QWORD *)(a1 + 48))
    goto LABEL_8;
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) == 0)
  {

    goto LABEL_8;
  }
  v6 = objc_msgSend(v4, "code");

  if (v6 != 4097)
  {
LABEL_8:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __75__STXPCRemoteObjectProxy__proxyFromConnection_withRetryCount_proxyHandler___block_invoke_cold_1(a1);
  objc_msgSend(*(id *)(a1 + 56), "_proxyFromConnection:withRetryCount:proxyHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48) - 1, *(_QWORD *)(a1 + 40));
LABEL_9:

}

+ (void)synchronousProxyFromConnection:(id)a3 proxyHandler:(id)a4
{
  objc_msgSend(a1, "_synchronousProxyFromConnection:withRetryCount:proxyHandler:", a3, 1, a4);
}

+ (void)_synchronousProxyFromConnection:(id)a3 withRetryCount:(unint64_t)a4 proxyHandler:(id)a5
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
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__STXPCRemoteObjectProxy__synchronousProxyFromConnection_withRetryCount_proxyHandler___block_invoke;
  v13[3] = &unk_1E9372048;
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

void __86__STXPCRemoteObjectProxy__synchronousProxyFromConnection_withRetryCount_proxyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  v4 = v3;
  if (!*(_QWORD *)(a1 + 48))
    goto LABEL_8;
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) == 0)
  {

    goto LABEL_8;
  }
  v6 = objc_msgSend(v4, "code");

  if (v6 != 4097)
  {
LABEL_8:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __75__STXPCRemoteObjectProxy__proxyFromConnection_withRetryCount_proxyHandler___block_invoke_cold_1(a1);
  objc_msgSend(*(id *)(a1 + 56), "_synchronousProxyFromConnection:withRetryCount:proxyHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48) - 1, *(_QWORD *)(a1 + 40));
LABEL_9:

}

void __75__STXPCRemoteObjectProxy__proxyFromConnection_withRetryCount_proxyHandler___block_invoke_cold_1(uint64_t a1)
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
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_2_5(&dword_1D22E7000, MEMORY[0x1E0C81028], v2, "Connection error from %{public}@: %{public}@\nAttempts remaining: %lu", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_8_2();
}

@end
