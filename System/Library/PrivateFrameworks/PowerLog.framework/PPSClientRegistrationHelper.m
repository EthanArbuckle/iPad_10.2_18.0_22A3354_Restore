@implementation PPSClientRegistrationHelper

- (BOOL)permissionsForSubsystem:(id)a3 category:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v6 = a3;
  v7 = a4;
  if ((os_variant_is_darwinos() & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[PPSClientRegistrationHelper createXPCConnection](self, "createXPCConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__PPSClientRegistrationHelper_permissionsForSubsystem_category___block_invoke;
    v11[3] = &unk_1E41660E8;
    v11[4] = &v12;
    objc_msgSend(v9, "checkPermissionForSubsystem:category:withReply:", v6, v7, v11);
    -[PPSClientRegistrationHelper closeXPCConnection](self, "closeXPCConnection");
    v8 = *((_BYTE *)v13 + 24) != 0;
    _Block_object_dispose(&v12, 8);

  }
  return v8;
}

- (id)createXPCConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *connectionToServer;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];

  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.PerfPowerTelemetryClientRegistrationService"));
  connectionToServer = self->_connectionToServer;
  self->_connectionToServer = v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE534430);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_connectionToServer, "setRemoteObjectInterface:", v5);

  -[NSXPCConnection setInterruptionHandler:](self->_connectionToServer, "setInterruptionHandler:", &__block_literal_global_1);
  -[NSXPCConnection setInvalidationHandler:](self->_connectionToServer, "setInvalidationHandler:", &__block_literal_global_7);
  -[NSXPCConnection resume](self->_connectionToServer, "resume");
  logHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19EA99000, v6, OS_LOG_TYPE_INFO, "Spinning up XPC service", v8, 2u);
  }

  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connectionToServer, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_10);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __64__PPSClientRegistrationHelper_permissionsForSubsystem_category___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __50__PPSClientRegistrationHelper_createXPCConnection__block_invoke_6()
{
  NSObject *v0;
  uint8_t v1[16];

  logHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19EA99000, v0, OS_LOG_TYPE_INFO, "Client Permission check completed. Invalidating XPC Connection.", v1, 2u);
  }

}

- (void)closeXPCConnection
{
  -[NSXPCConnection invalidate](self->_connectionToServer, "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionToServer, 0);
}

void __50__PPSClientRegistrationHelper_createXPCConnection__block_invoke()
{
  NSObject *v0;

  logHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __50__PPSClientRegistrationHelper_createXPCConnection__block_invoke_cold_1(v0);

}

void __50__PPSClientRegistrationHelper_createXPCConnection__block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  logHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __50__PPSClientRegistrationHelper_createXPCConnection__block_invoke_8_cold_1(v2, v3);

}

- (NSXPCConnection)connectionToServer
{
  return self->_connectionToServer;
}

- (void)setConnectionToServer:(id)a3
{
  objc_storeStrong((id *)&self->_connectionToServer, a3);
}

void __50__PPSClientRegistrationHelper_createXPCConnection__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19EA99000, log, OS_LOG_TYPE_ERROR, "Connection was interrupted.", v1, 2u);
}

void __50__PPSClientRegistrationHelper_createXPCConnection__block_invoke_8_cold_1(void *a1, NSObject *a2)
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
  _os_log_error_impl(&dword_19EA99000, a2, OS_LOG_TYPE_ERROR, "Connection error: %@", (uint8_t *)&v4, 0xCu);

}

@end
