@implementation PPSFeatureFlagReaderHelper

- (id)getFeatureFlags
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  logPPSFeatureFlagReaderHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PPSFeatureFlagReaderHelper getFeatureFlags].cold.2();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSFeatureFlagReaderHelper createXPCConnection](self, "createXPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15[0] = &v14;
  v15[1] = 0x3032000000;
  v15[2] = __Block_byref_object_copy__7;
  v15[3] = __Block_byref_object_dispose__7;
  v16 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __45__PPSFeatureFlagReaderHelper_getFeatureFlags__block_invoke;
  v13[3] = &unk_1E6A53B18;
  v13[4] = &v14;
  objc_msgSend(v5, "getFeatureFlags:", v13);
  logPPSFeatureFlagReaderHelper();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[PPSFeatureFlagReaderHelper getFeatureFlags].cold.1((uint64_t)v15, v6);

  -[PPSFeatureFlagReaderHelper closeXPCConnection](self, "closeXPCConnection");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v4);
  v9 = v8;
  logPPSFeatureFlagReaderHelper();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v18 = v9;
    v19 = 2112;
    v20 = v4;
    v21 = 2112;
    v22 = v7;
    _os_log_debug_impl(&dword_1B6AB6000, v10, OS_LOG_TYPE_DEBUG, "[PPSFeatureFlagReader] Time for getting getFeatureFlags reading to run: %f, %@, %@", buf, 0x20u);
  }

  v11 = *(id *)(v15[0] + 40);
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __45__PPSFeatureFlagReaderHelper_getFeatureFlags__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)createXPCConnection
{
  NSObject *v3;
  NSXPCConnection *v4;
  NSXPCConnection *connectionToServer;
  void *v6;
  NSObject *v7;

  logPPSFeatureFlagReaderHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PPSFeatureFlagReaderHelper createXPCConnection].cold.2();

  v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.PPSFeatureFlagReader"));
  connectionToServer = self->_connectionToServer;
  self->_connectionToServer = v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF15EE58);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_connectionToServer, "setRemoteObjectInterface:", v6);

  -[NSXPCConnection setInterruptionHandler:](self->_connectionToServer, "setInterruptionHandler:", &__block_literal_global_8);
  -[NSXPCConnection setInvalidationHandler:](self->_connectionToServer, "setInvalidationHandler:", &__block_literal_global_10);
  -[NSXPCConnection resume](self->_connectionToServer, "resume");
  logPPSFeatureFlagReaderHelper();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PPSFeatureFlagReaderHelper createXPCConnection].cold.1();

  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connectionToServer, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_13);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __49__PPSFeatureFlagReaderHelper_createXPCConnection__block_invoke()
{
  NSObject *v0;

  logPPSFeatureFlagReaderHelper();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __49__PPSFeatureFlagReaderHelper_createXPCConnection__block_invoke_cold_1();

}

void __49__PPSFeatureFlagReaderHelper_createXPCConnection__block_invoke_9()
{
  NSObject *v0;

  logPPSFeatureFlagReaderHelper();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __49__PPSFeatureFlagReaderHelper_createXPCConnection__block_invoke_9_cold_1();

}

void __49__PPSFeatureFlagReaderHelper_createXPCConnection__block_invoke_11(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  logPPSFeatureFlagReaderHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __49__PPSFeatureFlagReaderHelper_createXPCConnection__block_invoke_11_cold_1(v2, v3);

}

- (void)closeXPCConnection
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "[PPSFeatureFlagReader] getFeatureFlags Connection Closed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (NSXPCConnection)connectionToServer
{
  return self->_connectionToServer;
}

- (void)setConnectionToServer:(id)a3
{
  objc_storeStrong((id *)&self->_connectionToServer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionToServer, 0);
}

- (void)getFeatureFlags
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "[PPSFeatureFlagReader] getFeatureFlags called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)createXPCConnection
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "[PPSFeatureFlagReader] establishing a connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __49__PPSFeatureFlagReaderHelper_createXPCConnection__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_1(&dword_1B6AB6000, v0, v1, "[PPSFeatureFlagReader] Connection was interrupted.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __49__PPSFeatureFlagReaderHelper_createXPCConnection__block_invoke_9_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_1(&dword_1B6AB6000, v0, v1, "[PPSFeatureFlagReader] Invalid connection handler is happening.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __49__PPSFeatureFlagReaderHelper_createXPCConnection__block_invoke_11_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1B6AB6000, a2, OS_LOG_TYPE_ERROR, "os_log_debug Connection error happened %@", (uint8_t *)&v4, 0xCu);

}

@end
