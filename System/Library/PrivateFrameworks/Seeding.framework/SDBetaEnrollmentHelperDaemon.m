@implementation SDBetaEnrollmentHelperDaemon

- (void)start
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.seeding.enrollment-helper"));
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "resume");

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  BOOL v17;
  NSObject *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.seeding.client-helper"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && (objc_msgSend(v8, "BOOLValue") & 1) != 0)
  {

    v10 = objc_msgSend(v7, "processIdentifier");
    Log_3();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v30 = v10;
      _os_log_impl(&dword_1D4F89000, v11, OS_LOG_TYPE_DEFAULT, "New connection from pid [%ld]", buf, 0xCu);
    }

    SDHelperDaemonInterface();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v12);

    objc_msgSend(v7, "setExportedObject:", self);
    objc_initWeak((id *)buf, self);
    objc_msgSend(v7, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __67__SDBetaEnrollmentHelperDaemon_listener_shouldAcceptNewConnection___block_invoke;
    v26[3] = &unk_1E98CFE48;
    v15 = v13;
    v27 = v15;
    objc_copyWeak(&v28, (id *)buf);
    objc_msgSend(v7, "setInvalidationHandler:", v26);
    v20 = v14;
    v21 = 3221225472;
    v22 = __67__SDBetaEnrollmentHelperDaemon_listener_shouldAcceptNewConnection___block_invoke_1;
    v23 = &unk_1E98CFE48;
    v16 = v15;
    v24 = v16;
    objc_copyWeak(&v25, (id *)buf);
    objc_msgSend(v7, "setInterruptionHandler:", &v20);
    -[SDBetaEnrollmentHelperDaemon setConnection:](self, "setConnection:", v7, v20, v21, v22, v23);
    objc_msgSend(v7, "resume");
    objc_destroyWeak(&v25);

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
    v17 = 1;
  }
  else
  {
    Log_3();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[SDBetaEnrollmentHelperDaemon listener:shouldAcceptNewConnection:].cold.1(v7, v18);

    v17 = 0;
  }

  return v17;
}

void __67__SDBetaEnrollmentHelperDaemon_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  Log_3();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1D4F89000, v2, OS_LOG_TYPE_DEFAULT, "connection [%{public}@] was invalidated", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setConnection:", 0);

}

void __67__SDBetaEnrollmentHelperDaemon_listener_shouldAcceptNewConnection___block_invoke_1(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  Log_3();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1D4F89000, v2, OS_LOG_TYPE_DEFAULT, "connection [%{public}@] was interrupted", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setConnection:", 0);

}

- (void)addFBAHelpMenu:(id)a3
{
  +[SDSeedProgramManager _setHelpFeedbackMenuEnabled:](SDSeedProgramManager, "_setHelpFeedbackMenuEnabled:", 1);
}

- (void)removeFBAHelpMenu:(id)a3
{
  +[SDSeedProgramManager _setHelpFeedbackMenuEnabled:](SDSeedProgramManager, "_setHelpFeedbackMenuEnabled:", 0);
}

- (void)addFBASymlink:(id)a3
{
  +[SDSeedProgramManager _createFeedbackAssistantSymlink](SDSeedProgramManager, "_createFeedbackAssistantSymlink", a3);
}

- (void)isPreReleaseInstallationAllowed:(id)a3
{
  id v4;

  v4 = a3;
  (*((void (**)(id, BOOL))a3 + 2))(v4, +[SDSeedProgramManager _canEnrollInBetaSoftware](SDSeedProgramManager, "_canEnrollInBetaSoftware"));

}

- (void)removeSeedEnrollmentCookie:(id)a3
{
  id v4;

  v4 = a3;
  (*((void (**)(id, BOOL))a3 + 2))(v4, +[SDSeedProgramManager _removeSeedEnrollmentCookie](SDSeedProgramManager, "_removeSeedEnrollmentCookie"));

}

- (void)removeBetaEnrollmentData:(id)a3
{
  void (**v3)(id, uint64_t);
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = (void (**)(id, uint64_t))a3;
  Log_3();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D4F89000, v4, OS_LOG_TYPE_DEFAULT, "Deleting beta enrollment data", v6, 2u);
  }

  +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_deleteBetaProgram");

  v3[2](v3, 1);
}

- (void)setupAssistant_enrollInProgramWithBetaEnrollmentToken:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __97__SDBetaEnrollmentHelperDaemon_setupAssistant_enrollInProgramWithBetaEnrollmentToken_completion___block_invoke;
  v9[3] = &unk_1E98CF9A8;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "enrollInProgramWithToken:userIdentifier:completion:", v6, 0, v9);

}

void __97__SDBetaEnrollmentHelperDaemon_setupAssistant_enrollInProgramWithBetaEnrollmentToken_completion___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    SDMDMConfiguratorErrorWithType(a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
  else
  {
    (*(void (**)(_QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32));
  }
}

- (void)fetchBetaEnrollmentTokens:(id)a3
{
  void (**v3)(id, id);
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = (void (**)(id, id))a3;
  +[SDPersistence betaEnrollmentTokensFromOldLocation](SDPersistence, "betaEnrollmentTokensFromOldLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_opt_new();
  v8 = v7;

  v3[2](v3, v8);
}

- (void)saveMDMConfiguration:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  +[SDPersistence saveMDMConfiguration:](SDPersistence, "saveMDMConfiguration:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (void)loadMDMConfigurationWithCompletion:(id)a3
{
  void (**v3)(id, id, void *);
  void *v4;
  id v5;
  id v6;

  v6 = 0;
  v3 = (void (**)(id, id, void *))a3;
  +[SDPersistence loadMDMConfigurationWithError:](SDPersistence, "loadMDMConfigurationWithError:", &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  v3[2](v3, v5, v4);

}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = (int)objc_msgSend(a1, "processIdentifier");
  _os_log_error_impl(&dword_1D4F89000, a2, OS_LOG_TYPE_ERROR, "A client [%ld] tried to use Seeding.fmwk but is not entitled.", (uint8_t *)&v3, 0xCu);
}

@end
