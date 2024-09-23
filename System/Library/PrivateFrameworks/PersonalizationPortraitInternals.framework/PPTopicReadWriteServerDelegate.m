@implementation PPTopicReadWriteServerDelegate

- (PPTopicReadWriteServerDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPTopicReadWriteServerDelegate;
  return -[PPTopicReadWriteServerDelegate init](&v3, sel_init);
}

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
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF8EF878);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1C3BD6630]();
  v9 = objc_alloc(MEMORY[0x1E0C99E60]);
  v10 = objc_opt_class();
  v11 = (void *)objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_donateTopics_source_algorithm_cloudSync_sentimentScore_exactMatchesInSourceText_completion_, 0, 0);

  v12 = (void *)MEMORY[0x1C3BD6630]();
  v13 = objc_alloc(MEMORY[0x1E0C99E60]);
  v14 = objc_opt_class();
  v15 = (void *)objc_msgSend(v13, "initWithObjects:", v14, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v12);
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_deleteAllTopicsFromSourcesWithBundleId_groupIds_completion_, 1, 0);

  v16 = (void *)MEMORY[0x1C3BD6630]();
  v17 = objc_alloc(MEMORY[0x1E0C99E60]);
  v18 = objc_opt_class();
  v19 = (void *)objc_msgSend(v17, "initWithObjects:", v18, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v16);
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_deleteAllTopicsFromSourcesWithBundleId_documentIds_completion_, 1, 0);

  v20 = (void *)objc_opt_new();
  LOBYTE(v16) = +[PPXPCServerHelper shouldAcceptConnection:serviceName:allowedServerInterface:allowedClientInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:](PPXPCServerHelper, "shouldAcceptConnection:serviceName:allowedServerInterface:allowedClientInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:", v6, CFSTR("com.apple.proactive.PersonalizationPortrait.Topic.readWrite"), v7, 0, v20, &__block_literal_global_4245, 0, &__block_literal_global_67_4254, &__block_literal_global_68_4255);

  return (char)v16;
}

BOOL __69__PPTopicReadWriteServerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PPXPCServerHelper checkForAndLogTrueBooleanEntitlement:connection:serviceName:](PPXPCServerHelper, "checkForAndLogTrueBooleanEntitlement:connection:serviceName:", CFSTR("com.apple.proactive.PersonalizationPortrait.Topic.readWrite"), a2, CFSTR("com.apple.proactive.PersonalizationPortrait.Topic.readWrite"));
}

@end
