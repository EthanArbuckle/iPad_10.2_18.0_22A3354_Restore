@implementation WLKFederatedAnalyticsReporter

+ (id)defaultFederatedAnalyticsReporter
{
  if (defaultFederatedAnalyticsReporter_token != -1)
    dispatch_once(&defaultFederatedAnalyticsReporter_token, &__block_literal_global_36);
  return (id)defaultFederatedAnalyticsReporter_defaultReporter;
}

void __66__WLKFederatedAnalyticsReporter_defaultFederatedAnalyticsReporter__block_invoke()
{
  WLKFederatedAnalyticsReporter *v0;
  void *v1;

  v0 = objc_alloc_init(WLKFederatedAnalyticsReporter);
  v1 = (void *)defaultFederatedAnalyticsReporter_defaultReporter;
  defaultFederatedAnalyticsReporter_defaultReporter = (uint64_t)v0;

}

- (void)reportPunchout:(id)a3
{
  WLKFederatedAnalyticsReporter *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[WLKFederatedAnalyticsReporter connection](v4, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_2_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "reportFederatedPunchout:", v7);
  objc_sync_exit(v4);

}

void __48__WLKFederatedAnalyticsReporter_reportPunchout___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  WLKPlaybackTrackingLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKFederatedAnalyticsReporter - Error: Unable to communicate with the remote object proxy (%@)", (uint8_t *)&v4, 0xCu);
  }

}

- (NSXPCConnection)connection
{
  WLKFederatedAnalyticsReporter *v2;
  uint64_t v3;
  NSXPCConnection *connection;
  NSXPCConnection *v5;
  void *v6;
  NSXPCConnection *v7;
  void *v8;
  NSXPCConnection *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_connection)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.watchlistd.xpc"), 0);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    v5 = v2->_connection;
    WLKConnectionClientInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v5, "setExportedInterface:", v6);

    -[NSXPCConnection setExportedObject:](v2->_connection, "setExportedObject:", v2);
    v7 = v2->_connection;
    WLKConnectionServerInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v7, "setRemoteObjectInterface:", v8);

    -[NSXPCConnection setInterruptionHandler:](v2->_connection, "setInterruptionHandler:", &__block_literal_global_5_1);
    objc_initWeak(&location, v2);
    v9 = v2->_connection;
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __43__WLKFederatedAnalyticsReporter_connection__block_invoke_6;
    v14 = &unk_1E68A7FC0;
    objc_copyWeak(&v15, &location);
    -[NSXPCConnection setInvalidationHandler:](v9, "setInvalidationHandler:", &v11);
    -[NSXPCConnection resume](v2->_connection, "resume", v11, v12, v13, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);

  return v2->_connection;
}

void __43__WLKFederatedAnalyticsReporter_connection__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  WLKPlaybackTrackingLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B515A000, v0, OS_LOG_TYPE_DEFAULT, "WLKFederatedAnalyticsReporter - Connection interrupted.", v1, 2u);
  }

}

void __43__WLKFederatedAnalyticsReporter_connection__block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidationHandler");

}

- (void)_invalidationHandler
{
  NSObject *v3;
  WLKFederatedAnalyticsReporter *v4;
  NSXPCConnection *connection;
  uint8_t v6[16];

  WLKPlaybackTrackingLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKFederatedAnalyticsReporter - Connection invalidated.", v6, 2u);
  }

  v4 = self;
  objc_sync_enter(v4);
  connection = v4->_connection;
  v4->_connection = 0;

  objc_sync_exit(v4);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
