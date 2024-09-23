@implementation PSGInputSuggesterServerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255E06A00);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x2348A15A8]();
  v9 = objc_alloc(MEMORY[0x24BDBCF20]);
  v10 = objc_opt_class();
  v11 = (void *)objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_logImpression_request_, 0, 0);

  v12 = (void *)MEMORY[0x2348A15A8]();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v12);
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_logImpression_request_, 1, 0);

  v14 = (void *)MEMORY[0x2348A15A8]();
  v15 = objc_alloc(MEMORY[0x24BDBCF20]);
  v16 = objc_opt_class();
  v17 = (void *)objc_msgSend(v15, "initWithObjects:", v16, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v14);
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_logEngagement_request_position_, 0, 0);

  v18 = (void *)MEMORY[0x2348A15A8]();
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v18);
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_logEngagement_request_position_, 1, 0);

  v20 = (void *)MEMORY[0x24BE7A660];
  v21 = (void *)objc_opt_new();
  psg_default_log_handle();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = objc_msgSend(v20, "shouldAcceptConnection:serviceName:whitelistedServerInterface:whitelistedClientInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:logHandle:", v6, CFSTR("com.apple.proactive.input.suggester"), v7, 0, v21, &__block_literal_global, 0, &__block_literal_global_33, &__block_literal_global_34, v22);

  return (char)v20;
}

uint64_t __70__PSGInputSuggesterServerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x24BE7A660];
  v3 = a2;
  psg_default_log_handle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "checkForAndLogTrueBooleanEntitlement:connection:serviceName:logHandle:", CFSTR("com.apple.proactive.input.suggester"), v3, CFSTR("com.apple.proactive.input.suggester"), v4);

  return v5;
}

@end
