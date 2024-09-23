@implementation HVXPCSysdiagnoseService

- (HVXPCSysdiagnoseService)init
{
  HVXPCSysdiagnoseService *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  _PASXPCClientHelper *helper;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HVXPCSysdiagnoseService;
  v2 = -[HVXPCSysdiagnoseService init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25510CE50);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x22074FDF0]();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", objc_opt_class(), 0);
    objc_autoreleasePoolPop(v4);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_sysdiagnoseStringWithCompletion_, 0, 1);

    v6 = objc_alloc(MEMORY[0x24BE7A650]);
    hv_default_log_handle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithServiceName:whitelistedServerInterface:whitelistedClientInterface:serverInitiatedRequestHandler:interruptionHandler:invalidationHandler:logHandle:", CFSTR("com.apple.proactive.ProactiveHarvesting.Sysdiagnose"), v3, 0, 0, &__block_literal_global_570, &__block_literal_global_9_571, v7);
    helper = v2->_helper;
    v2->_helper = (_PASXPCClientHelper *)v8;

  }
  return v2;
}

- (id)synchronousProxy
{
  return (id)-[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_helper, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_11);
}

- (id)sysdiagnoseStringWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  hv_default_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AA1D000, v5, OS_LOG_TYPE_DEFAULT, "HVXPCSysdiagnoseService: sysdiagnoseStringWithError called.", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v18 = buf;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__559;
  v21 = __Block_byref_object_dispose__560;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__559;
  v15 = __Block_byref_object_dispose__560;
  v16 = 0;
  -[HVXPCSysdiagnoseService synchronousProxy](self, "synchronousProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__HVXPCSysdiagnoseService_sysdiagnoseStringWithError___block_invoke;
  v10[3] = &unk_24DD7E3F8;
  v10[4] = buf;
  v10[5] = &v11;
  objc_msgSend(v6, "sysdiagnoseStringWithCompletion:", v10);

  v7 = (void *)*((_QWORD *)v18 + 5);
  if (a3 && !v7)
  {
    *a3 = objc_retainAutorelease((id)v12[5]);
    v7 = (void *)*((_QWORD *)v18 + 5);
  }
  v8 = v7;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(buf, 8);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helper, 0);
}

void __54__HVXPCSysdiagnoseService_sysdiagnoseStringWithError___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __43__HVXPCSysdiagnoseService_synchronousProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  hv_default_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl(&dword_21AA1D000, v3, OS_LOG_TYPE_ERROR, "HVXPCSysdiagnoseService: error: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __31__HVXPCSysdiagnoseService_init__block_invoke_8()
{
  NSObject *v0;
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  hv_default_log_handle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 138412290;
    v2 = CFSTR("com.apple.proactive.ProactiveHarvesting.Sysdiagnose");
    _os_log_impl(&dword_21AA1D000, v0, OS_LOG_TYPE_DEFAULT, "Connection to %@ invalidated", (uint8_t *)&v1, 0xCu);
  }

}

void __31__HVXPCSysdiagnoseService_init__block_invoke()
{
  NSObject *v0;
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  hv_default_log_handle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 138412290;
    v2 = CFSTR("com.apple.proactive.ProactiveHarvesting.Sysdiagnose");
    _os_log_impl(&dword_21AA1D000, v0, OS_LOG_TYPE_DEFAULT, "Connection to %@ interrupted", (uint8_t *)&v1, 0xCu);
  }

}

@end
