@implementation PSGInternalServerDelegate

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
  objc_msgSend(v4, "interfaceWithProtocol:", &unk_255E077B0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BE7A660];
  v8 = (void *)objc_opt_new();
  psg_default_log_handle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v7, "shouldAcceptConnection:serviceName:whitelistedServerInterface:whitelistedClientInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:logHandle:", v5, CFSTR("com.apple.private.psg.internal"), v6, 0, v8, &__block_literal_global_104, 0, &__block_literal_global_6, &__block_literal_global_7, v9);

  return (char)v7;
}

uint64_t __64__PSGInternalServerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x24BE7A660];
  v3 = a2;
  psg_default_log_handle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "checkForAndLogTrueBooleanEntitlement:connection:serviceName:logHandle:", CFSTR("com.apple.private.psg.internal"), v3, CFSTR("com.apple.private.psg.internal"), v4);

  return v5;
}

@end
