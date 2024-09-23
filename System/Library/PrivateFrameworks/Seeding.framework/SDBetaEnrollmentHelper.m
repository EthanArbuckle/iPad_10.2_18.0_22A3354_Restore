@implementation SDBetaEnrollmentHelper

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_2);
  return (id)sharedInstance_client_0;
}

void __40__SDBetaEnrollmentHelper_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_client_0;
  sharedInstance_client_0 = v0;

}

- (SDBetaEnrollmentHelper)init
{
  SDBetaEnrollmentHelper *v2;
  SDBetaEnrollmentHelper *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SDBetaEnrollmentHelper;
  v2 = -[SDBetaEnrollmentHelper init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SDBetaEnrollmentHelper connectToDaemon](v2, "connectToDaemon");
  return v3;
}

- (void)connectToDaemon
{
  SDBetaEnrollmentHelper *v2;
  uint64_t v3;
  NSXPCConnection *daemonConnection;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_daemonConnection)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.seeding.enrollment-helper"), 4096);
    daemonConnection = v2->_daemonConnection;
    v2->_daemonConnection = (NSXPCConnection *)v3;

    SDHelperDaemonInterface();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_daemonConnection, "setRemoteObjectInterface:", v5);

    objc_initWeak(&location, v2);
    v6 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __41__SDBetaEnrollmentHelper_connectToDaemon__block_invoke;
    v9[3] = &unk_1E98CF3B8;
    objc_copyWeak(&v10, &location);
    -[NSXPCConnection setInvalidationHandler:](v2->_daemonConnection, "setInvalidationHandler:", v9);
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __41__SDBetaEnrollmentHelper_connectToDaemon__block_invoke_66;
    v7[3] = &unk_1E98CF3B8;
    objc_copyWeak(&v8, &location);
    -[NSXPCConnection setInterruptionHandler:](v2->_daemonConnection, "setInterruptionHandler:", v7);
    -[NSXPCConnection resume](v2->_daemonConnection, "resume");
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);

}

void __41__SDBetaEnrollmentHelper_connectToDaemon__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;

  Log_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __41__SDBetaEnrollmentHelper_connectToDaemon__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setDaemonConnection:", 0);

}

void __41__SDBetaEnrollmentHelper_connectToDaemon__block_invoke_66(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;

  Log_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __41__SDBetaEnrollmentHelper_connectToDaemon__block_invoke_66_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setDaemonConnection:", 0);

}

- (id)remoteObjectProxyWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (!self->_daemonConnection)
    -[SDBetaEnrollmentHelper connectToDaemon](self, "connectToDaemon");
  -[SDBetaEnrollmentHelper daemonConnection](self, "daemonConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__SDBetaEnrollmentHelper_remoteObjectProxyWithCompletion___block_invoke;
  v9[3] = &unk_1E98CF330;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __58__SDBetaEnrollmentHelper_remoteObjectProxyWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  Log_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __58__SDBetaEnrollmentHelper_remoteObjectProxyWithCompletion___block_invoke_cold_1(v3);

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (id)remoteObjectProxy
{
  return -[SDBetaEnrollmentHelper remoteObjectProxyWithCompletion:](self, "remoteObjectProxyWithCompletion:", 0);
}

- (id)synchronousRemoteObjectProxy
{
  void *v3;
  void *v4;

  if (!self->_daemonConnection)
    -[SDBetaEnrollmentHelper connectToDaemon](self, "connectToDaemon");
  -[SDBetaEnrollmentHelper daemonConnection](self, "daemonConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_68);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __54__SDBetaEnrollmentHelper_synchronousRemoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  Log_0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __54__SDBetaEnrollmentHelper_synchronousRemoteObjectProxy__block_invoke_cold_1(v2);

}

- (id)synchronousDaemonRemoteObjectProxyWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (!self->_daemonConnection)
    -[SDBetaEnrollmentHelper connectToDaemon](self, "connectToDaemon");
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  -[SDBetaEnrollmentHelper daemonConnection](self, "daemonConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__SDBetaEnrollmentHelper_synchronousDaemonRemoteObjectProxyWithError___block_invoke;
  v11[3] = &unk_1E98CF420;
  v11[4] = &v12;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v13;
  if (a3)
  {
    v8 = (void *)v13[5];
    if (v8)
    {
      *a3 = objc_retainAutorelease(v8);
      v7 = v13;
    }
  }
  if (v7[5])
    v9 = 0;
  else
    v9 = v6;

  _Block_object_dispose(&v12, 8);
  return v9;
}

void __70__SDBetaEnrollmentHelper_synchronousDaemonRemoteObjectProxyWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  Log_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __70__SDBetaEnrollmentHelper_synchronousDaemonRemoteObjectProxyWithError___block_invoke_cold_1(v3);

  v5 = objc_msgSend(v3, "copy");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)addFBASymlink:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SDBetaEnrollmentHelper remoteObjectProxy](self, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addFBASymlink:", v4);

}

- (void)addFBAHelpMenu:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SDBetaEnrollmentHelper remoteObjectProxy](self, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addFBAHelpMenu:", v4);

}

- (void)removeFBAHelpMenu:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SDBetaEnrollmentHelper remoteObjectProxy](self, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFBAHelpMenu:", v4);

}

- (BOOL)isPreReleaseInstallationAllowed
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  -[SDBetaEnrollmentHelper synchronousRemoteObjectProxy](self, "synchronousRemoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__SDBetaEnrollmentHelper_isPreReleaseInstallationAllowed__block_invoke;
  v4[3] = &unk_1E98CF448;
  v4[4] = &v5;
  objc_msgSend(v2, "isPreReleaseInstallationAllowed:", v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __57__SDBetaEnrollmentHelper_isPreReleaseInstallationAllowed__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)removeSeedEnrollmentCookie:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SDBetaEnrollmentHelper remoteObjectProxy](self, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeSeedEnrollmentCookie:", v4);

}

- (void)removeBetaEnrollmentData
{
  id v2;

  -[SDBetaEnrollmentHelper synchronousRemoteObjectProxy](self, "synchronousRemoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeBetaEnrollmentData:", &__block_literal_global_70);

}

void __50__SDBetaEnrollmentHelper_removeBetaEnrollmentData__block_invoke(uint64_t a1, char a2)
{
  NSObject *v2;

  if ((a2 & 1) == 0)
  {
    Log_0();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __50__SDBetaEnrollmentHelper_removeBetaEnrollmentData__block_invoke_cold_1(v2);

  }
}

- (void)setupAssistant_enrollInProgramWithBetaEnrollmentToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SDBetaEnrollmentHelper remoteObjectProxyWithCompletion:](self, "remoteObjectProxyWithCompletion:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setupAssistant_enrollInProgramWithBetaEnrollmentToken:completion:", v7, v6);

}

- (id)fetchBetaEnrollmentTokensWithError:(id *)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  -[SDBetaEnrollmentHelper synchronousDaemonRemoteObjectProxyWithError:](self, "synchronousDaemonRemoteObjectProxyWithError:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (*a3)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (v6)
  {
    v7 = (id)objc_opt_new();
  }
  else
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy_;
    v14 = __Block_byref_object_dispose_;
    v15 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__SDBetaEnrollmentHelper_fetchBetaEnrollmentTokensWithError___block_invoke;
    v9[3] = &unk_1E98CF490;
    v9[4] = &v10;
    objc_msgSend(v4, "fetchBetaEnrollmentTokens:", v9);
    v7 = (id)v11[5];
    _Block_object_dispose(&v10, 8);

  }
  return v7;
}

void __61__SDBetaEnrollmentHelper_fetchBetaEnrollmentTokensWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)saveMDMConfiguration:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  -[SDBetaEnrollmentHelper synchronousDaemonRemoteObjectProxyWithError:](self, "synchronousDaemonRemoteObjectProxyWithError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (*a4)
    v9 = 1;
  else
    v9 = v7 == 0;
  if (!v9)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy_;
    v16 = __Block_byref_object_dispose_;
    v17 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__SDBetaEnrollmentHelper_saveMDMConfiguration_withError___block_invoke;
    v11[3] = &unk_1E98CF420;
    v11[4] = &v12;
    objc_msgSend(v7, "saveMDMConfiguration:withCompletion:", v6, v11);
    v10 = (void *)v13[5];
    if (v10)
      *a4 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v12, 8);

  }
}

void __57__SDBetaEnrollmentHelper_saveMDMConfiguration_withError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)loadMDMConfigurationWithError:(id *)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  id v7;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  -[SDBetaEnrollmentHelper synchronousDaemonRemoteObjectProxyWithError:](self, "synchronousDaemonRemoteObjectProxyWithError:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (*a3)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    v22 = 0;
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    v16 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__SDBetaEnrollmentHelper_loadMDMConfigurationWithError___block_invoke;
    v10[3] = &unk_1E98CF4B8;
    v10[4] = &v17;
    v10[5] = &v11;
    objc_msgSend(v4, "loadMDMConfigurationWithCompletion:", v10);
    v8 = (void *)v18[5];
    if (v8)
    {
      v7 = 0;
      *a3 = objc_retainAutorelease(v8);
    }
    else
    {
      v7 = (id)v12[5];
    }
    _Block_object_dispose(&v11, 8);

    _Block_object_dispose(&v17, 8);
  }

  return v7;
}

void __56__SDBetaEnrollmentHelper_loadMDMConfigurationWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (NSXPCConnection)daemonConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDaemonConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

void __41__SDBetaEnrollmentHelper_connectToDaemon__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1D4F89000, a1, a3, "fbahelperd connection invalidated", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

void __41__SDBetaEnrollmentHelper_connectToDaemon__block_invoke_66_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1D4F89000, a1, a3, "fbahelperd connection interrupted", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

void __58__SDBetaEnrollmentHelper_remoteObjectProxyWithCompletion___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1D4F89000, v2, v3, "Failed to get remote object proxy to root helper: %{public}@.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

void __54__SDBetaEnrollmentHelper_synchronousRemoteObjectProxy__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1D4F89000, v2, v3, "Failed to get synchronous remote object proxy to root helper: %{public}@.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

void __70__SDBetaEnrollmentHelper_synchronousDaemonRemoteObjectProxyWithError___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1D4F89000, v2, v3, "Failed to get synchronous remote object proxy to betaenrollmentd: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

void __50__SDBetaEnrollmentHelper_removeBetaEnrollmentData__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D4F89000, log, OS_LOG_TYPE_ERROR, "Failed to remove Beta enrollment data", v1, 2u);
  OUTLINED_FUNCTION_3_0();
}

@end
