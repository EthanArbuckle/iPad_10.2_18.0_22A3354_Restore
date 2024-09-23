@implementation STConcretePasscodeAuthenticationProviderService

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[STConcretePasscodeAuthenticationProviderService pendingAuthenticationCompletionHandler](self, "pendingAuthenticationCompletionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ { Pending: %ld }>"), v4, v5 != 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (STConcretePasscodeAuthenticationProviderService)initWithClientListenerEndpoint:(id)a3
{
  NSXPCListenerEndpoint *v4;
  STConcretePasscodeAuthenticationProviderService *v5;
  NSXPCListenerEndpoint *clientListenerEndpoint;
  objc_super v8;

  v4 = (NSXPCListenerEndpoint *)a3;
  v8.receiver = self;
  v8.super_class = (Class)STConcretePasscodeAuthenticationProviderService;
  v5 = -[STConcretePasscodeAuthenticationProviderService init](&v8, sel_init);
  clientListenerEndpoint = v5->_clientListenerEndpoint;
  v5->_clientListenerEndpoint = v4;

  return v5;
}

- (void)authenticatePasscodeWithCommunicationServiceProxy:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[STConcretePasscodeAuthenticationProviderService setPendingAuthenticationCompletionHandler:](self, "setPendingAuthenticationCompletionHandler:", a4);
  -[STConcretePasscodeAuthenticationProviderService clientListenerEndpoint](self, "clientListenerEndpoint");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "authenticatePasscodeForUserWithEndpoint:completionHandler:", v7, &__block_literal_global_6);

}

void __119__STConcretePasscodeAuthenticationProviderService_authenticatePasscodeWithCommunicationServiceProxy_completionHandler___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  +[STLog passcodeAuthenticationProviderService](STLog, "passcodeAuthenticationProviderService");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D22E7000, v0, OS_LOG_TYPE_DEFAULT, "Prompted for passcode authentication", v1, 2u);
  }

}

- (void)receivePasscodeAuthenticationResult:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void (**v8)(_QWORD, _QWORD, _QWORD);
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint8_t v28[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[STConcretePasscodeAuthenticationProviderService pendingAuthenticationCompletionHandler](self, "pendingAuthenticationCompletionHandler");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[STLog passcodeAuthenticationProviderService](STLog, "passcodeAuthenticationProviderService");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_1D22E7000, v10, OS_LOG_TYPE_DEFAULT, "Resolving pending completion with authentication result", v28, 2u);
      }

      ((void (**)(_QWORD, id, _QWORD))v8)[2](v8, v6, 0);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[STConcretePasscodeAuthenticationProviderService receivePasscodeAuthenticationResult:completionHandler:].cold.2(v10, v20, v21, v22, v23, v24, v25, v26);

      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 51, 0);
      ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v27);

    }
    -[STConcretePasscodeAuthenticationProviderService setPendingAuthenticationCompletionHandler:](self, "setPendingAuthenticationCompletionHandler:", 0);
    v7[2](v7, 0);
  }
  else
  {
    +[STLog passcodeAuthenticationProviderService](STLog, "passcodeAuthenticationProviderService");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[STConcretePasscodeAuthenticationProviderService receivePasscodeAuthenticationResult:completionHandler:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 1, 0);
    v7[2](v7, v19);

    v7 = (void (**)(id, _QWORD))v19;
  }

}

- (NSXPCListenerEndpoint)clientListenerEndpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 8, 1);
}

- (id)pendingAuthenticationCompletionHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setPendingAuthenticationCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingAuthenticationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_clientListenerEndpoint, 0);
}

- (void)receivePasscodeAuthenticationResult:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_1D22E7000, a1, a3, "No pending completion handler to resolve with authentication result", a5, a6, a7, a8, 0);
}

- (void)receivePasscodeAuthenticationResult:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_1D22E7000, a1, a3, "Resolving pending completion with error", a5, a6, a7, a8, 0);
}

@end
