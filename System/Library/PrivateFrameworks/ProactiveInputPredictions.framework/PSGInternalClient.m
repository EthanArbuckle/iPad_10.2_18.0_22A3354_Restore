@implementation PSGInternalClient

- (PSGInternalClient)init
{
  PSGInternalClient *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  _PASXPCClientHelper *clientHelper;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PSGInternalClient;
  v2 = -[PSGInternalClient init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F0315DE0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x1E0D81640]);
    psg_default_log_handle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithServiceName:whitelistedServerInterface:whitelistedClientInterface:serverInitiatedRequestHandler:interruptionHandler:invalidationHandler:logHandle:", CFSTR("com.apple.private.psg.internal"), v3, 0, 0, &__block_literal_global_5, &__block_literal_global_7, v5);
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = (_PASXPCClientHelper *)v6;

  }
  return v2;
}

- (id)_remoteObjectProxy
{
  return (id)-[_PASXPCClientHelper remoteObjectProxy](self->_clientHelper, "remoteObjectProxy");
}

- (id)sysdiagnoseInformationWithError:(id *)a3
{
  void *v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  -[PSGInternalClient _remoteObjectProxy](self, "_remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__56;
  v24 = __Block_byref_object_dispose__57;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__56;
  v18 = __Block_byref_object_dispose__57;
  v19 = 0;
  v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__PSGInternalClient_sysdiagnoseInformationWithError___block_invoke;
  v10[3] = &unk_1EA3F0B50;
  v12 = &v20;
  v13 = &v14;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v4, "sysdiagnoseInformationWithCompletion:", v10);
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:", v6);
  if (a3)
    *a3 = objc_retainAutorelease((id)v15[5]);
  v7 = (void *)v21[5];
  if (!v7)
  {
    v21[5] = (uint64_t)CFSTR("{\"error\": \"No info returned from server\"}");
    v7 = (void *)v21[5];
  }
  v8 = v7;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientHelper, 0);
}

void __53__PSGInternalClient_sysdiagnoseInformationWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __25__PSGInternalClient_init__block_invoke_6()
{
  NSObject *v0;
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  psg_default_log_handle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v1 = 138412290;
    v2 = CFSTR("com.apple.private.psg.internal");
    _os_log_impl(&dword_1DBD27000, v0, OS_LOG_TYPE_INFO, "Connection to %@ invalidated.", (uint8_t *)&v1, 0xCu);
  }

}

void __25__PSGInternalClient_init__block_invoke()
{
  NSObject *v0;
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  psg_default_log_handle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    v1 = 138412290;
    v2 = CFSTR("com.apple.private.psg.internal");
    _os_log_error_impl(&dword_1DBD27000, v0, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v1, 0xCu);
  }

}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_73 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_73, &__block_literal_global_74);
  return (id)sharedInstance__pasExprOnceResult_75;
}

void __35__PSGInternalClient_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1DF0B9950]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_75;
  sharedInstance__pasExprOnceResult_75 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
