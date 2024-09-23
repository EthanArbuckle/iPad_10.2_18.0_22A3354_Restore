@implementation PPQuickTypeServerDelegate

- (PPQuickTypeServerDelegate)init
{
  NSObject *v3;
  objc_super v5;
  uint8_t buf[16];

  pp_xpc_server_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C392E000, v3, OS_LOG_TYPE_DEBUG, "instantiating PPQuickTypeServerDelegate", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)PPQuickTypeServerDelegate;
  return -[PPQuickTypeServerDelegate init](&v5, sel_init);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v18;
  void *context;
  id v20;
  id v21;

  v21 = a3;
  v20 = a4;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF9008F0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x1C3BD6630]();
  v18 = objc_alloc(MEMORY[0x1E0C99E60]);
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = (void *)objc_msgSend(v18, "initWithObjects:", v6, v7, v8, v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
  objc_autoreleasePoolPop(context);
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_quickTypeItemsWithLanguageModelingTokens_localeIdentifier_recipients_bundleIdentifier_limit_completion_, 0, 0);

  v16 = (void *)objc_opt_new();
  LOBYTE(v15) = +[PPXPCServerHelper shouldAcceptConnection:serviceName:allowedServerInterface:allowedClientInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:](PPXPCServerHelper, "shouldAcceptConnection:serviceName:allowedServerInterface:allowedClientInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:", v20, CFSTR("com.apple.proactive.PersonalizationPortrait.QuickType"), v5, 0, v16, &__block_literal_global_14186, 0, &__block_literal_global_67_14202, &__block_literal_global_68_14203);

  return (char)v15;
}

BOOL __64__PPQuickTypeServerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PPXPCServerHelper checkForAndLogTrueBooleanEntitlement:connection:serviceName:](PPXPCServerHelper, "checkForAndLogTrueBooleanEntitlement:connection:serviceName:", CFSTR("com.apple.proactive.PersonalizationPortrait.QuickType"), a2, CFSTR("com.apple.proactive.PersonalizationPortrait.QuickType"));
}

@end
