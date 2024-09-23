@implementation PerfPowerServicesReaderHelper

- (id)postDataRequest:(id)a3 outError:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  if (v6)
  {
    -[PerfPowerServicesReaderHelper createXPCConnection](self, "createXPCConnection");
    v7 = objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__6;
    v23 = __Block_byref_object_dispose__6;
    v24 = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__6;
    v17 = __Block_byref_object_dispose__6;
    v18 = 0;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __58__PerfPowerServicesReaderHelper_postDataRequest_outError___block_invoke;
    v12[3] = &unk_25142CF68;
    v12[4] = &v13;
    v12[5] = &v19;
    -[NSObject dataForRequest:withReply:](v7, "dataForRequest:withReply:", v6, v12);
    *a4 = objc_retainAutorelease((id)v14[5]);
    -[PerfPowerServicesReaderHelper closeXPCConnection](self, "closeXPCConnection");
    v8 = (id)v20[5];
    _Block_object_dispose(&v13, 8);

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    logHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PerfPowerServicesReaderHelper postDataRequest:outError:].cold.1(v7, v9, v10);
    v8 = 0;
  }

  return v8;
}

void __58__PerfPowerServicesReaderHelper_postDataRequest_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    logHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __58__PerfPowerServicesReaderHelper_postDataRequest_outError___block_invoke_cold_1(v6, v7);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

}

- (id)createXPCConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *connectionToServer;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[16];

  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.PerfPowerTelemetryReaderService"));
  connectionToServer = self->_connectionToServer;
  self->_connectionToServer = v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2572EDF18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_connectionToServer, "setRemoteObjectInterface:", v5);

  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection remoteObjectInterface](self->_connectionToServer, "remoteObjectInterface");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_dataForRequest_withReply_, 0, 1);

  -[NSXPCConnection remoteObjectInterface](self->_connectionToServer, "remoteObjectInterface");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_dataForRequest_withReply_, 1, 1);

  -[NSXPCConnection setInterruptionHandler:](self->_connectionToServer, "setInterruptionHandler:", &__block_literal_global_10);
  -[NSXPCConnection setInvalidationHandler:](self->_connectionToServer, "setInvalidationHandler:", &__block_literal_global_14);
  -[NSXPCConnection resume](self->_connectionToServer, "resume");
  logHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2439D9000, v14, OS_LOG_TYPE_INFO, "Spinning up XPC service", buf, 2u);
  }

  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connectionToServer, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_17_0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __52__PerfPowerServicesReaderHelper_createXPCConnection__block_invoke()
{
  NSObject *v0;

  logHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __52__PerfPowerServicesReaderHelper_createXPCConnection__block_invoke_cold_1(v0);

}

void __52__PerfPowerServicesReaderHelper_createXPCConnection__block_invoke_13()
{
  NSObject *v0;

  logHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __52__PerfPowerServicesReaderHelper_createXPCConnection__block_invoke_13_cold_1(v0);

}

void __52__PerfPowerServicesReaderHelper_createXPCConnection__block_invoke_15(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  logHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __52__PerfPowerServicesReaderHelper_createXPCConnection__block_invoke_15_cold_1(v2, v3);

}

- (void)closeXPCConnection
{
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

- (void)postDataRequest:(uint64_t)a3 outError:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = "-[PerfPowerServicesReaderHelper postDataRequest:outError:]";
  v5 = 2112;
  v6 = CFSTR("Empty request");
  OUTLINED_FUNCTION_0_5(&dword_2439D9000, a1, a3, "(%s) %@", (uint8_t *)&v3);
}

void __58__PerfPowerServicesReaderHelper_postDataRequest_outError___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315394;
  v6 = "-[PerfPowerServicesReaderHelper postDataRequest:outError:]_block_invoke";
  v7 = 2112;
  v8 = v3;
  OUTLINED_FUNCTION_0_5(&dword_2439D9000, a2, v4, "(%s) Error while processing request: %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_8();
}

void __52__PerfPowerServicesReaderHelper_createXPCConnection__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2439D9000, log, OS_LOG_TYPE_ERROR, "Connection was interrupted.", v1, 2u);
}

void __52__PerfPowerServicesReaderHelper_createXPCConnection__block_invoke_13_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2439D9000, log, OS_LOG_TYPE_DEBUG, "Connection to handler is invalid.", v1, 2u);
}

void __52__PerfPowerServicesReaderHelper_createXPCConnection__block_invoke_15_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_2439D9000, a2, OS_LOG_TYPE_ERROR, "Connection error: %@", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_8();
}

@end
