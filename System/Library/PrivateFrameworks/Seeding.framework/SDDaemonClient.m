@implementation SDDaemonClient

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_6);
  return (id)sharedInstance_client_1;
}

void __32__SDDaemonClient_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_client_1;
  sharedInstance_client_1 = v0;

}

- (SDDaemonClient)init
{
  SDDaemonClient *v2;
  SDDaemonClient *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SDDaemonClient;
  v2 = -[SDDaemonClient init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SDDaemonClient initializeDaemonConnection](v2, "initializeDaemonConnection");
  return v3;
}

- (void)initializeDaemonConnection
{
  SDDaemonClient *v2;
  uint64_t v3;
  NSXPCConnection *daemonConnection;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_daemonConnection)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.seeding.client"), 4096);
    daemonConnection = v2->_daemonConnection;
    v2->_daemonConnection = (NSXPCConnection *)v3;

    +[SDDaemonCommon _allowListedXPCServerInterface](SDDaemonCommon, "_allowListedXPCServerInterface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_daemonConnection, "setRemoteObjectInterface:", v5);

    +[SDDaemonCommon _allowListedXPCClientInterface](SDDaemonCommon, "_allowListedXPCClientInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v2->_daemonConnection, "setExportedInterface:", v6);

    -[NSXPCConnection setExportedObject:](v2->_daemonConnection, "setExportedObject:", v2);
    objc_initWeak(&location, v2);
    v7 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __44__SDDaemonClient_initializeDaemonConnection__block_invoke;
    v10[3] = &unk_1E98CF3B8;
    objc_copyWeak(&v11, &location);
    -[NSXPCConnection setInvalidationHandler:](v2->_daemonConnection, "setInvalidationHandler:", v10);
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __44__SDDaemonClient_initializeDaemonConnection__block_invoke_3;
    v8[3] = &unk_1E98CF3B8;
    objc_copyWeak(&v9, &location);
    -[NSXPCConnection setInterruptionHandler:](v2->_daemonConnection, "setInterruptionHandler:", v8);
    -[NSXPCConnection resume](v2->_daemonConnection, "resume");
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);

}

void __44__SDDaemonClient_initializeDaemonConnection__block_invoke(uint64_t a1)
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

  Log_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __44__SDDaemonClient_initializeDaemonConnection__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setDaemonConnection:", 0);

}

void __44__SDDaemonClient_initializeDaemonConnection__block_invoke_3(uint64_t a1)
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

  Log_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __44__SDDaemonClient_initializeDaemonConnection__block_invoke_3_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setDaemonConnection:", 0);

}

- (void)betaenrollmentdProxyObjectWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v4 = a3;
  if (!self->_daemonConnection)
    -[SDDaemonClient initializeDaemonConnection](self, "initializeDaemonConnection");
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[SDDaemonClient daemonConnection](self, "daemonConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __59__SDDaemonClient_betaenrollmentdProxyObjectWithCompletion___block_invoke;
  v14 = &unk_1E98CF7A0;
  v16 = &v17;
  v6 = v4;
  v15 = v6;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "conformsToProtocol:", &unk_1EFEFFAA8, v11, v12, v13, v14) & 1) != 0)
  {
    v8 = v18;
    if (!*((_BYTE *)v18 + 24))
    {
      (*((void (**)(id, void *, _QWORD))v6 + 2))(v6, v7, 0);
      v8 = v18;
    }
  }
  else
  {
    Log_2();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[SDDaemonClient betaenrollmentdProxyObjectWithCompletion:].cold.1();

    v8 = v18;
    if (!*((_BYTE *)v18 + 24))
    {
      -[SDDaemonClient _SDErrorForDaemonClientErrorType](self, "_SDErrorForDaemonClientErrorType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v10);

      v8 = v18;
    }
    *((_BYTE *)v8 + 24) = 1;
  }
  *((_BYTE *)v8 + 24) = 1;

  _Block_object_dispose(&v17, 8);
}

void __59__SDDaemonClient_betaenrollmentdProxyObjectWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  Log_2();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59__SDDaemonClient_betaenrollmentdProxyObjectWithCompletion___block_invoke_cold_1(v3);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (!*(_BYTE *)(v5 + 24))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v5 + 24) = 1;

}

- (id)synchronousDaemonRemoteObjectProxy
{
  return -[SDDaemonClient synchronousDaemonRemoteObjectProxyWithError:](self, "synchronousDaemonRemoteObjectProxyWithError:", 0);
}

- (id)synchronousDaemonRemoteObjectProxyWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  if (!self->_daemonConnection)
    -[SDDaemonClient initializeDaemonConnection](self, "initializeDaemonConnection");
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  -[SDDaemonClient daemonConnection](self, "daemonConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__SDDaemonClient_synchronousDaemonRemoteObjectProxyWithError___block_invoke;
  v12[3] = &unk_1E98CF420;
  v12[4] = &v13;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v14;
  if (a3)
  {
    v8 = (void *)v14[5];
    if (v8)
    {
      *a3 = objc_retainAutorelease(v8);
      v7 = v14;
    }
  }
  if (!v7[5])
  {
    if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1EFEFFAA8) & 1) != 0)
    {
      v9 = v6;
      goto LABEL_14;
    }
    Log_2();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[SDDaemonClient synchronousDaemonRemoteObjectProxyWithError:].cold.1();

    if (a3)
    {
      -[SDDaemonClient _SDErrorForDaemonClientErrorType](self, "_SDErrorForDaemonClientErrorType");
      v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
  }
  v9 = 0;
LABEL_14:

  _Block_object_dispose(&v13, 8);
  return v9;
}

void __62__SDDaemonClient_synchronousDaemonRemoteObjectProxyWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  Log_2();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__SDDaemonClient_synchronousDaemonRemoteObjectProxyWithError___block_invoke_cold_1(v3);

  v5 = objc_msgSend(v3, "copy");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)getCurrentDevice:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__SDDaemonClient_getCurrentDevice___block_invoke;
  v6[3] = &unk_1E98CF7C8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SDDaemonClient betaenrollmentdProxyObjectWithCompletion:](self, "betaenrollmentdProxyObjectWithCompletion:", v6);

}

void __35__SDDaemonClient_getCurrentDevice___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;

  if (!a2 || a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_SDErrorForDaemonClientErrorType");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[SDDevice blankDeviceWithErrorMessage:](SDDevice, "blankDeviceWithErrorMessage:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(a2, "getCurrentDevice:", *(_QWORD *)(a1 + 40));
  }
}

- (id)getCurrentDeviceSynchronously
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  -[SDDaemonClient synchronousDaemonRemoteObjectProxy](self, "synchronousDaemonRemoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__SDDaemonClient_getCurrentDeviceSynchronously__block_invoke;
  v5[3] = &unk_1E98CF7F0;
  v5[4] = &v6;
  objc_msgSend(v2, "getCurrentDevice:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__SDDaemonClient_getCurrentDeviceSynchronously__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)enrollDevice:(id)a3 inProgram:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__SDDaemonClient_enrollDevice_inProgram_completion___block_invoke;
  v14[3] = &unk_1E98CF818;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[SDDaemonClient betaenrollmentdProxyObjectWithCompletion:](self, "betaenrollmentdProxyObjectWithCompletion:", v14);

}

uint64_t __52__SDDaemonClient_enrollDevice_inProgram_completion___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  if (!a2 || a3)
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  else
    return objc_msgSend(a2, "enrollDevice:inProgram:completion:", a1[4], a1[5], a1[6]);
}

- (void)getDevicesForPlatforms:(unint64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  unint64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__SDDaemonClient_getDevicesForPlatforms_completion___block_invoke;
  v8[3] = &unk_1E98CF840;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  -[SDDaemonClient betaenrollmentdProxyObjectWithCompletion:](self, "betaenrollmentdProxyObjectWithCompletion:", v8);

}

uint64_t __52__SDDaemonClient_getDevicesForPlatforms_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a2 || a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return objc_msgSend(a2, "getDevicesForPlatforms:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)queryProgramsForSystemAccountsWithPlatforms:(unint64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  unint64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__SDDaemonClient_queryProgramsForSystemAccountsWithPlatforms_completion___block_invoke;
  v8[3] = &unk_1E98CF840;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  -[SDDaemonClient betaenrollmentdProxyObjectWithCompletion:](self, "betaenrollmentdProxyObjectWithCompletion:", v8);

}

uint64_t __73__SDDaemonClient_queryProgramsForSystemAccountsWithPlatforms_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a2 || a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return objc_msgSend(a2, "queryProgramsForSystemAccountsWithPlatforms:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)canCurrentDeviceEnrollInBetaProgram
{
  void *v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[SDDaemonClient synchronousDaemonRemoteObjectProxy](self, "synchronousDaemonRemoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SDDaemonClient getCurrentDeviceSynchronously](self, "getCurrentDeviceSynchronously");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__SDDaemonClient_canCurrentDeviceEnrollInBetaProgram__block_invoke;
  v6[3] = &unk_1E98CF448;
  v6[4] = &v7;
  objc_msgSend(v3, "canDeviceEnrollInBetaUpdates:completion:", v4, v6);

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

uint64_t __53__SDDaemonClient_canCurrentDeviceEnrollInBetaProgram__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)isDeviceEnrolledInBetaProgram:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__SDDaemonClient_isDeviceEnrolledInBetaProgram_completion___block_invoke;
  v10[3] = &unk_1E98CF868;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[SDDaemonClient betaenrollmentdProxyObjectWithCompletion:](self, "betaenrollmentdProxyObjectWithCompletion:", v10);

}

uint64_t __59__SDDaemonClient_isDeviceEnrolledInBetaProgram_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a2 || a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return objc_msgSend(a2, "isDeviceEnrolledInBetaProgram:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)enrolledBetaProgramForDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__SDDaemonClient_enrolledBetaProgramForDevice_completion___block_invoke;
  v10[3] = &unk_1E98CF868;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[SDDaemonClient betaenrollmentdProxyObjectWithCompletion:](self, "betaenrollmentdProxyObjectWithCompletion:", v10);

}

uint64_t __58__SDDaemonClient_enrolledBetaProgramForDevice_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a2 || a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return objc_msgSend(a2, "enrolledBetaProgramForDevice:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)getCurrentDeviceEnrolledBetaProgramSynchronously
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  -[SDDaemonClient synchronousDaemonRemoteObjectProxy](self, "synchronousDaemonRemoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SDDaemonClient getCurrentDeviceSynchronously](self, "getCurrentDeviceSynchronously");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__SDDaemonClient_getCurrentDeviceEnrolledBetaProgramSynchronously__block_invoke;
  v7[3] = &unk_1E98CF890;
  v7[4] = &v8;
  objc_msgSend(v3, "enrolledBetaProgramForDevice:completion:", v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __66__SDDaemonClient_getCurrentDeviceEnrolledBetaProgramSynchronously__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)unenrollDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__SDDaemonClient_unenrollDevice_completion___block_invoke;
  v10[3] = &unk_1E98CF868;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[SDDaemonClient betaenrollmentdProxyObjectWithCompletion:](self, "betaenrollmentdProxyObjectWithCompletion:", v10);

}

uint64_t __44__SDDaemonClient_unenrollDevice_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a2 || a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return objc_msgSend(a2, "unenrollDevice:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)canFileFeedbackOnDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__SDDaemonClient_canFileFeedbackOnDevice_completion___block_invoke;
  v10[3] = &unk_1E98CF868;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[SDDaemonClient betaenrollmentdProxyObjectWithCompletion:](self, "betaenrollmentdProxyObjectWithCompletion:", v10);

}

uint64_t __53__SDDaemonClient_canFileFeedbackOnDevice_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a2 || a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return objc_msgSend(a2, "canFileFeedbackOnDevice:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)seedingAppleIDUsernameForCurrentDevice
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  -[SDDaemonClient synchronousDaemonRemoteObjectProxy](self, "synchronousDaemonRemoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SDDaemonClient getCurrentDeviceSynchronously](self, "getCurrentDeviceSynchronously");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__SDDaemonClient_seedingAppleIDUsernameForCurrentDevice__block_invoke;
  v7[3] = &unk_1E98CF8B8;
  v7[4] = &v8;
  objc_msgSend(v3, "getCurrentSeedingAppleIDForDevice:completion:", v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __56__SDDaemonClient_seedingAppleIDUsernameForCurrentDevice__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)seedingAppleIDUsernameForCurrentDevice:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__SDDaemonClient_seedingAppleIDUsernameForCurrentDevice___block_invoke;
  v6[3] = &unk_1E98CF930;
  v7 = v4;
  v5 = v4;
  -[SDDaemonClient betaenrollmentdProxyObjectWithCompletion:](self, "betaenrollmentdProxyObjectWithCompletion:", v6);

}

void __57__SDDaemonClient_seedingAppleIDUsernameForCurrentDevice___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a2;
  v6 = v5;
  if (!v5 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__SDDaemonClient_seedingAppleIDUsernameForCurrentDevice___block_invoke_2;
    v7[3] = &unk_1E98CF908;
    v8 = v5;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v8, "getCurrentDevice:", v7);

  }
}

void __57__SDDaemonClient_seedingAppleIDUsernameForCurrentDevice___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__SDDaemonClient_seedingAppleIDUsernameForCurrentDevice___block_invoke_3;
  v4[3] = &unk_1E98CF8E0;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "getCurrentSeedingAppleIDForDevice:completion:", a2, v4);

}

uint64_t __57__SDDaemonClient_seedingAppleIDUsernameForCurrentDevice___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)deviceAppleIDUsernameForCurrentDevice
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  -[SDDaemonClient synchronousDaemonRemoteObjectProxy](self, "synchronousDaemonRemoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SDDaemonClient getCurrentDeviceSynchronously](self, "getCurrentDeviceSynchronously");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SDDaemonClient_deviceAppleIDUsernameForCurrentDevice__block_invoke;
  v7[3] = &unk_1E98CF958;
  v7[4] = &v8;
  objc_msgSend(v3, "getCurrentPrimaryAppleIDForDevice:completion:", v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __55__SDDaemonClient_deviceAppleIDUsernameForCurrentDevice__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)setAppleAccountIdentifierWithAlternateDSIDForCurrentDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__SDDaemonClient_setAppleAccountIdentifierWithAlternateDSIDForCurrentDevice_completion___block_invoke;
  v10[3] = &unk_1E98CF868;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[SDDaemonClient betaenrollmentdProxyObjectWithCompletion:](self, "betaenrollmentdProxyObjectWithCompletion:", v10);

}

void __88__SDDaemonClient_setAppleAccountIdentifierWithAlternateDSIDForCurrentDevice_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v5 = a2;
  v6 = v5;
  if (!v5 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __88__SDDaemonClient_setAppleAccountIdentifierWithAlternateDSIDForCurrentDevice_completion___block_invoke_2;
    v7[3] = &unk_1E98CF980;
    v8 = v5;
    v9 = *(id *)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v8, "getCurrentDevice:", v7);

  }
}

void __88__SDDaemonClient_setAppleAccountIdentifierWithAlternateDSIDForCurrentDevice_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __88__SDDaemonClient_setAppleAccountIdentifierWithAlternateDSIDForCurrentDevice_completion___block_invoke_3;
  v5[3] = &unk_1E98CF330;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "setAppleAccountIdentifierFromAlternateDSID:forDevice:completion:", v4, a2, v5);

}

uint64_t __88__SDDaemonClient_setAppleAccountIdentifierWithAlternateDSIDForCurrentDevice_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteSeedingAppleAccountWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__SDDaemonClient_deleteSeedingAppleAccountWithCompletion___block_invoke;
  v6[3] = &unk_1E98CF930;
  v7 = v4;
  v5 = v4;
  -[SDDaemonClient betaenrollmentdProxyObjectWithCompletion:](self, "betaenrollmentdProxyObjectWithCompletion:", v6);

}

void __58__SDDaemonClient_deleteSeedingAppleAccountWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a2;
  v6 = v5;
  if (!v5 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__SDDaemonClient_deleteSeedingAppleAccountWithCompletion___block_invoke_2;
    v7[3] = &unk_1E98CF908;
    v8 = v5;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v8, "getCurrentDevice:", v7);

  }
}

void __58__SDDaemonClient_deleteSeedingAppleAccountWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__SDDaemonClient_deleteSeedingAppleAccountWithCompletion___block_invoke_3;
  v4[3] = &unk_1E98CF330;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "deleteSeedingAppleAccountForDevice:completion:", a2, v4);

}

uint64_t __58__SDDaemonClient_deleteSeedingAppleAccountWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)isCurrentDeviceUsingSeedingAppleID
{
  void *v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[SDDaemonClient synchronousDaemonRemoteObjectProxy](self, "synchronousDaemonRemoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SDDaemonClient getCurrentDeviceSynchronously](self, "getCurrentDeviceSynchronously");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__SDDaemonClient_isCurrentDeviceUsingSeedingAppleID__block_invoke;
  v6[3] = &unk_1E98CF448;
  v6[4] = &v7;
  objc_msgSend(v3, "isDeviceUsingSeedingAppleID:completion:", v4, v6);

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

uint64_t __52__SDDaemonClient_isCurrentDeviceUsingSeedingAppleID__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)invalidateCacheWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__SDDaemonClient_invalidateCacheWithCompletion___block_invoke;
  v6[3] = &unk_1E98CF930;
  v7 = v4;
  v5 = v4;
  -[SDDaemonClient betaenrollmentdProxyObjectWithCompletion:](self, "betaenrollmentdProxyObjectWithCompletion:", v6);

}

uint64_t __48__SDDaemonClient_invalidateCacheWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  if (!a2 || a3)
    return (*(uint64_t (**)(_QWORD, uint64_t))(v3 + 16))(*(_QWORD *)(a1 + 32), a3);
  else
    return objc_msgSend(a2, "invalidateDaemonCacheWithCompletion:", v3);
}

- (void)enrollInProgramWithToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__SDDaemonClient_enrollInProgramWithToken_completion___block_invoke;
  v10[3] = &unk_1E98CF7C8;
  v11 = v6;
  v12 = v7;
  v8 = v6;
  v9 = v7;
  -[SDDaemonClient betaenrollmentdProxyObjectWithCompletion:](self, "betaenrollmentdProxyObjectWithCompletion:", v10);

}

void __54__SDDaemonClient_enrollInProgramWithToken_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __54__SDDaemonClient_enrollInProgramWithToken_completion___block_invoke_2;
    v5[3] = &unk_1E98CF9A8;
    v4 = *(_QWORD *)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    objc_msgSend(a2, "enrollInProgramWithToken:completion:", v4, v5);

  }
}

void __54__SDDaemonClient_enrollInProgramWithToken_completion___block_invoke_2(uint64_t a1, unint64_t a2)
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

- (void)configureWithOfferProgramTokens:(id)a3 requireProgramToken:(id)a4 enrollmentPolicy:(int64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  unint64_t v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v10 = a3;
  v11 = a4;
  -[SDDaemonClient synchronousDaemonRemoteObjectProxyWithError:](self, "synchronousDaemonRemoteObjectProxyWithError:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (*a6)
    v14 = 1;
  else
    v14 = v12 == 0;
  if (!v14)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __93__SDDaemonClient_configureWithOfferProgramTokens_requireProgramToken_enrollmentPolicy_error___block_invoke;
    v16[3] = &unk_1E98CF9D0;
    v16[4] = &v17;
    objc_msgSend(v12, "configureWithOfferProgramTokens:requireProgramToken:enrollmentPolicy:completion:", v10, v11, a5, v16);
    v15 = v18[3];
    if (v15)
    {
      SDMDMConfiguratorErrorWithType(v15);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    _Block_object_dispose(&v17, 8);
  }

}

uint64_t __93__SDDaemonClient_configureWithOfferProgramTokens_requireProgramToken_enrollmentPolicy_error___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
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

  -[SDDaemonClient synchronousDaemonRemoteObjectProxyWithError:](self, "synchronousDaemonRemoteObjectProxyWithError:");
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
    v20 = __Block_byref_object_copy__0;
    v21 = __Block_byref_object_dispose__0;
    v22 = 0;
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__0;
    v15 = __Block_byref_object_dispose__0;
    v16 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__SDDaemonClient_loadMDMConfigurationWithError___block_invoke;
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

void __48__SDDaemonClient_loadMDMConfigurationWithError___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_SDErrorForDaemonClientErrorType
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.seeding.daemon-client"), 0, 0);
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

void __44__SDDaemonClient_initializeDaemonConnection__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1D4F89000, a1, a3, "betaenrollmentd connection invalidated", a5, a6, a7, a8, 0);
}

void __44__SDDaemonClient_initializeDaemonConnection__block_invoke_3_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1D4F89000, a1, a3, "betaenrollmentd connection interrupted", a5, a6, a7, a8, 0);
}

- (void)betaenrollmentdProxyObjectWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_1D4F89000, v0, v1, "Found a betaenrollmentdProxy that does not conform to SDDaemonXPCServer: %{public}@.", v2, v3, v4, v5, v6);
}

void __59__SDDaemonClient_betaenrollmentdProxyObjectWithCompletion___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_1D4F89000, v2, v3, "Failed to get remote object proxy to betaenrollmentd: %{public}@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)synchronousDaemonRemoteObjectProxyWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_1D4F89000, v0, v1, "Found a remoteObjectProxy that does not conform to SDDaemonXPCServer: %{public}@.", v2, v3, v4, v5, v6);
}

void __62__SDDaemonClient_synchronousDaemonRemoteObjectProxyWithError___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_1D4F89000, v2, v3, "Failed to get synchronous remote object proxy to betaenrollmentd: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end
