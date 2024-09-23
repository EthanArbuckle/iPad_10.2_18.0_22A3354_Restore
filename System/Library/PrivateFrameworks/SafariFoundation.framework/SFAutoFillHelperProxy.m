@implementation SFAutoFillHelperProxy

- (SFAutoFillHelperProxy)init
{
  SFAutoFillHelperProxy *v2;
  uint64_t v3;
  NSXPCConnection *connection;
  void *v5;
  SFAutoFillHelperProxy *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SFAutoFillHelperProxy;
  v2 = -[SFAutoFillHelperProxy init](&v14, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.SafariFoundation.AutoFillHelper"));
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A19680);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v5);
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __29__SFAutoFillHelperProxy_init__block_invoke;
    v11 = &unk_24C935838;
    objc_copyWeak(&v12, &location);
    -[NSXPCConnection setInvalidationHandler:](v2->_connection, "setInvalidationHandler:", &v8);
    -[NSXPCConnection resume](v2->_connection, "resume", v8, v9, v10, v11);
    v6 = v2;
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }

  return v2;
}

void __29__SFAutoFillHelperProxy_init__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SFAutoFillHelperProxy;
  -[SFAutoFillHelperProxy dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
}

- (void)getAutomaticStrongPasswordForAppWithPasswordRules:(id)a3 confirmPasswordRules:(id)a4 completion:(id)a5
{
  -[SFAutoFillHelperProxy _getAutomaticStrongPasswordForAppWithPasswordRules:confirmPasswordRules:overrideApplicationIdentifier:completion:](self, "_getAutomaticStrongPasswordForAppWithPasswordRules:confirmPasswordRules:overrideApplicationIdentifier:completion:", a3, a4, 0, a5);
}

- (void)_getAutomaticStrongPasswordForAppWithPasswordRules:(id)a3 confirmPasswordRules:(id)a4 overrideApplicationIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSXPCConnection *connection;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v13)
  {
    connection = self->_connection;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __138__SFAutoFillHelperProxy__getAutomaticStrongPasswordForAppWithPasswordRules_confirmPasswordRules_overrideApplicationIdentifier_completion___block_invoke;
    v19[3] = &unk_24C935860;
    v16 = v13;
    v20 = v16;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
      objc_msgSend(v17, "getAutomaticStrongPasswordForAppWithPasswordRules:confirmPasswordRules:overrideApplicationIdentifier:completion:", v10, v11, v12, v16);

  }
}

void __138__SFAutoFillHelperProxy__getAutomaticStrongPasswordForAppWithPasswordRules_confirmPasswordRules_overrideApplicationIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __138__SFAutoFillHelperProxy__getAutomaticStrongPasswordForAppWithPasswordRules_confirmPasswordRules_overrideApplicationIdentifier_completion___block_invoke_cold_1(v4, v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getRemoteAutoFillAvailabilityWithCompletionHandler:(id)a3
{
  id v4;
  NSXPCConnection *connection;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  connection = self->_connection;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __76__SFAutoFillHelperProxy_getRemoteAutoFillAvailabilityWithCompletionHandler___block_invoke;
  v9[3] = &unk_24C935860;
  v6 = v4;
  v10 = v6;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "getRemoteAutoFillAvailabilityWithCompletionHandler:", v6);

}

void __76__SFAutoFillHelperProxy_getRemoteAutoFillAvailabilityWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __138__SFAutoFillHelperProxy__getAutomaticStrongPasswordForAppWithPasswordRules_confirmPasswordRules_overrideApplicationIdentifier_completion___block_invoke_cold_1(v4, v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __138__SFAutoFillHelperProxy__getAutomaticStrongPasswordForAppWithPasswordRules_confirmPasswordRules_overrideApplicationIdentifier_completion___block_invoke_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_20E365000, v5, v6, "Failed to get a remote proxy object with error: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
