@implementation RMStoreKeychainController

+ (void)setTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 scope:(int64_t)a6 completionHandler:(id)a7
{
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v8 = a5;
  v11 = a7;
  v12 = a4;
  v13 = a3;
  v14 = +[RMStoreXPCProxy newConnectionWithScope:](RMStoreXPCProxy, "newConnectionWithScope:", a6);
  objc_msgSend(v14, "resume");
  v15 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __106__RMStoreKeychainController_setTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke;
  v23[3] = &unk_25162EF90;
  v16 = v11;
  v24 = v16;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __106__RMStoreKeychainController_setTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_6;
  v20[3] = &unk_25162EF18;
  v21 = v14;
  v22 = v16;
  v18 = v14;
  v19 = v16;
  objc_msgSend(v17, "setTrustForCertificateRef:configurationKey:fullTrust:completionHandler:", v13, v12, v8, v20);

}

void __106__RMStoreKeychainController_setTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BE7EB20], "storeKeychainController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __106__RMStoreKeychainController_setTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __106__RMStoreKeychainController_setTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BE7EB20], "storeKeychainController");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __106__RMStoreKeychainController_setTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_6_cold_2();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __106__RMStoreKeychainController_setTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_6_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

+ (void)removeTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 scope:(int64_t)a6 completionHandler:(id)a7
{
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v8 = a5;
  v11 = a7;
  v12 = a4;
  v13 = a3;
  v14 = +[RMStoreXPCProxy newConnectionWithScope:](RMStoreXPCProxy, "newConnectionWithScope:", a6);
  objc_msgSend(v14, "resume");
  v15 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __109__RMStoreKeychainController_removeTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke;
  v23[3] = &unk_25162EF90;
  v16 = v11;
  v24 = v16;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __109__RMStoreKeychainController_removeTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_7;
  v20[3] = &unk_25162EF18;
  v21 = v14;
  v22 = v16;
  v18 = v14;
  v19 = v16;
  objc_msgSend(v17, "removeTrustForCertificateRef:configurationKey:fullTrust:completionHandler:", v13, v12, v8, v20);

}

void __109__RMStoreKeychainController_removeTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BE7EB20], "storeKeychainController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __109__RMStoreKeychainController_removeTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __109__RMStoreKeychainController_removeTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BE7EB20], "storeKeychainController");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __109__RMStoreKeychainController_removeTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_7_cold_2();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __109__RMStoreKeychainController_removeTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_7_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

void __106__RMStoreKeychainController_setTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Failed XPC connection while setting certificate trust: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __106__RMStoreKeychainController_setTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_6_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_245188000, a1, a3, "Set certificate trust", a5, a6, a7, a8, 0);
}

void __106__RMStoreKeychainController_setTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_6_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Could not set certificate trust: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __109__RMStoreKeychainController_removeTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Failed XPC connection while removing certificate trust: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __109__RMStoreKeychainController_removeTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_7_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_245188000, a1, a3, "Removed certificate trust", a5, a6, a7, a8, 0);
}

void __109__RMStoreKeychainController_removeTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_7_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Could not remove certificate trust: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
