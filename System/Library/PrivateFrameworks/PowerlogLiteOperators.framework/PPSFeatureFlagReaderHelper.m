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
  uint64_t v13;
  _QWORD v14[5];
  uint8_t buf[8];
  uint8_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t v21[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  logPPSFeatureFlagReaderHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEBUG, "[PPSFeatureFlagReader] getFeatureFlags called", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSFeatureFlagReaderHelper createXPCConnection](self, "createXPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  v16 = buf;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __45__PPSFeatureFlagReaderHelper_getFeatureFlags__block_invoke;
  v14[3] = &unk_1E857A070;
  v14[4] = buf;
  objc_msgSend(v5, "getFeatureFlags:", v14);
  logPPSFeatureFlagReaderHelper();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v13 = *((_QWORD *)v16 + 5);
    *(_DWORD *)v21 = 138412290;
    v22 = v13;
    _os_log_debug_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEBUG, "[PPSFeatureFlagReader] getFeatureFlags result: %@", v21, 0xCu);
  }

  -[PPSFeatureFlagReaderHelper closeXPCConnection](self, "closeXPCConnection");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v4);
  v9 = v8;
  logPPSFeatureFlagReaderHelper();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v21 = 134218498;
    v22 = v9;
    v23 = 2112;
    v24 = v4;
    v25 = 2112;
    v26 = v7;
    _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "[PPSFeatureFlagReader] Time for getting getFeatureFlags reading to run: %f, %@, %@", v21, 0x20u);
  }

  v11 = *((id *)v16 + 5);
  _Block_object_dispose(buf, 8);

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
  uint8_t v9[16];
  uint8_t buf[16];

  logPPSFeatureFlagReaderHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEBUG, "[PPSFeatureFlagReader] establishing a connection", buf, 2u);
  }

  v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.PPSFeatureFlagReader"));
  connectionToServer = self->_connectionToServer;
  self->_connectionToServer = v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF9F63E0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_connectionToServer, "setRemoteObjectInterface:", v6);

  -[NSXPCConnection setInterruptionHandler:](self->_connectionToServer, "setInterruptionHandler:", &__block_literal_global_8);
  -[NSXPCConnection setInvalidationHandler:](self->_connectionToServer, "setInvalidationHandler:", &__block_literal_global_10);
  -[NSXPCConnection resume](self->_connectionToServer, "resume");
  logPPSFeatureFlagReaderHelper();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "[PPSFeatureFlagReader] Spinning up xpc svc", v9, 2u);
  }

  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connectionToServer, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_13);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __49__PPSFeatureFlagReaderHelper_createXPCConnection__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  logPPSFeatureFlagReaderHelper();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_1CAF47000, v0, OS_LOG_TYPE_ERROR, "[PPSFeatureFlagReader] Connection was interrupted.", v1, 2u);
  }

}

void __49__PPSFeatureFlagReaderHelper_createXPCConnection__block_invoke_9()
{
  NSObject *v0;
  uint8_t v1[16];

  logPPSFeatureFlagReaderHelper();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_1CAF47000, v0, OS_LOG_TYPE_ERROR, "[PPSFeatureFlagReader] Invalid connection handler is happening.", v1, 2u);
  }

}

void __49__PPSFeatureFlagReaderHelper_createXPCConnection__block_invoke_11(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  logPPSFeatureFlagReaderHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_ERROR, "os_log_debug Connection error happened %@", (uint8_t *)&v5, 0xCu);

  }
}

- (void)closeXPCConnection
{
  NSObject *v3;
  uint8_t v4[16];

  logPPSFeatureFlagReaderHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEBUG, "[PPSFeatureFlagReader] getFeatureFlags Connection Closed", v4, 2u);
  }

  -[NSXPCConnection invalidate](self->_connectionToServer, "invalidate");
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

@end
