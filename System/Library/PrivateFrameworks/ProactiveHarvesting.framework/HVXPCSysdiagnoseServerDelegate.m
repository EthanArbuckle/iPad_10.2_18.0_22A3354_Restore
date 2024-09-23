@implementation HVXPCSysdiagnoseServerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BDD1990];
  v5 = a4;
  objc_msgSend(v4, "interfaceWithProtocol:", &unk_25510CE50);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BE7A660];
  v8 = (void *)objc_opt_new();
  hv_default_log_handle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v7, "shouldAcceptConnection:serviceName:whitelistedServerInterface:whitelistedClientInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:logHandle:", v5, CFSTR("com.apple.proactive.ProactiveHarvesting.Sysdiagnose"), v6, 0, v8, &__block_literal_global_9, 0, &__block_literal_global_13, &__block_literal_global_15, v9);

  return (char)v7;
}

void __69__HVXPCSysdiagnoseServerDelegate_listener_shouldAcceptNewConnection___block_invoke_14()
{
  NSObject *v0;
  uint8_t v1[16];

  hv_default_log_handle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21AA1D000, v0, OS_LOG_TYPE_DEFAULT, "HVXPCSysdiagnoseService: invalidated.", v1, 2u);
  }

}

void __69__HVXPCSysdiagnoseServerDelegate_listener_shouldAcceptNewConnection___block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  hv_default_log_handle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21AA1D000, v0, OS_LOG_TYPE_DEFAULT, "HVXPCSysdiagnoseService: interrupted.", v1, 2u);
  }

}

uint64_t __69__HVXPCSysdiagnoseServerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x24BE7A660];
  v3 = a2;
  hv_default_log_handle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "checkForAndLogTrueBooleanEntitlement:connection:serviceName:logHandle:", CFSTR("com.apple.proactive.ProactiveHarvesting.Sysdiagnose"), v3, CFSTR("com.apple.proactive.ProactiveHarvesting.Sysdiagnose"), v4);

  return v5;
}

+ (id)server
{
  if (server__pasOnceToken4 != -1)
    dispatch_once(&server__pasOnceToken4, &__block_literal_global_72);
  return (id)server__pasExprOnceResult;
}

+ (void)start
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  hv_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21AA1D000, v2, OS_LOG_TYPE_DEFAULT, "HVXPCSysdiagnoseServerDelegate: start", v5, 2u);
  }

  v3 = (void *)MEMORY[0x24BE7A658];
  +[HVXPCSysdiagnoseServerDelegate server](HVXPCSysdiagnoseServerDelegate, "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForService:delegate:", CFSTR("com.apple.proactive.ProactiveHarvesting.Sysdiagnose"), v4);

}

void __40__HVXPCSysdiagnoseServerDelegate_server__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x22074FDF0]();
  v1 = objc_opt_new();
  v2 = (void *)server__pasExprOnceResult;
  server__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
