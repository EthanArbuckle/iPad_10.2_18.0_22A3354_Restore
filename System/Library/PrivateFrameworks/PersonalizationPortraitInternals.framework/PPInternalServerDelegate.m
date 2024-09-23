@implementation PPInternalServerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = (void *)MEMORY[0x1E0CB3B50];
  v5 = a4;
  objc_msgSend(v4, "interfaceWithProtocol:", &unk_1EF903368);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v8 = +[PPXPCServerHelper shouldAcceptConnection:serviceName:allowedServerInterface:allowedClientInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:](PPXPCServerHelper, "shouldAcceptConnection:serviceName:allowedServerInterface:allowedClientInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:", v5, CFSTR("com.apple.proactive.PersonalizationPortrait.Internal"), v6, 0, v7, &__block_literal_global_17342, 0, &__block_literal_global_66_17346, &__block_literal_global_67_17347);

  return v8;
}

BOOL __63__PPInternalServerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PPXPCServerHelper checkForAndLogTrueBooleanEntitlement:connection:serviceName:](PPXPCServerHelper, "checkForAndLogTrueBooleanEntitlement:connection:serviceName:", CFSTR("com.apple.proactive.PersonalizationPortrait.Internal"), a2, CFSTR("com.apple.proactive.PersonalizationPortrait.Internal"));
}

@end
