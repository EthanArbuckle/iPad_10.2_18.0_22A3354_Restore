@implementation WLKPlaybackReporter

- (WLKPlaybackReporter)init
{
  WLKPlaybackReporter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WLKPlaybackReporter;
  result = -[WLKPlaybackReporter init](&v3, sel_init);
  if (result)
    result->_xpcLock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)reportPlayback:(id)a3 withCompletion:(id)a4
{
  -[WLKPlaybackReporter reportPlayback:sessionID:completion:](self, "reportPlayback:sessionID:completion:", a3, 0, a4);
}

- (void)reportPlayback:(id)a3 sessionID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __59__WLKPlaybackReporter_reportPlayback_sessionID_completion___block_invoke;
  v23[3] = &unk_1E68A7DB8;
  v24 = v10;
  v12 = v10;
  v13 = (void *)MEMORY[0x1B5E47FF4](v23);
  -[WLKPlaybackReporter _connection](self, "_connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v11;
  v19 = 3221225472;
  v20 = __59__WLKPlaybackReporter_reportPlayback_sessionID_completion___block_invoke_2;
  v21 = &unk_1E68A7E88;
  v22 = v13;
  v15 = v13;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", &v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  WLKPlaybackTrackingLogObject();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v26 = v9;
    v27 = 2112;
    v28 = v8;
    _os_log_impl(&dword_1B515A000, v17, OS_LOG_TYPE_DEFAULT, "WLKPlaybackReporter - Requesting playback report [%@] %@", buf, 0x16u);
  }

  objc_msgSend(v16, "reportPlayback:sessionID:completion:", v8, v9, v15, v18, v19, v20, v21);
}

uint64_t __59__WLKPlaybackReporter_reportPlayback_sessionID_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __59__WLKPlaybackReporter_reportPlayback_sessionID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WLKPlaybackTrackingLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "WLKPlaybackReporter - Error: Unable to communicate with the remote object proxy (%@)", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)endPlaybackSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WLKPlaybackReporter _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_31);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  WLKPlaybackTrackingLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1B515A000, v7, OS_LOG_TYPE_DEFAULT, "WLKPlaybackReporter - Requesting endPlaybackSession [%@]", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(v6, "endPlaybackSession:", v4);
}

void __42__WLKPlaybackReporter_endPlaybackSession___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKPlaybackReporter - Error: Unable to communicate with the remote object proxy (%@)", (uint8_t *)&v4, 0xCu);
  }

}

- (id)_connection
{
  os_unfair_lock_s *p_xpcLock;
  NSXPCConnection *v4;
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  void *v9;
  NSXPCConnection *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  p_xpcLock = &self->_xpcLock;
  os_unfair_lock_lock(&self->_xpcLock);
  if (!self->_xpcConnection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.watchlistd.xpc"), 0);
    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = v4;

    v6 = self->_xpcConnection;
    WLKConnectionClientInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v6, "setExportedInterface:", v7);

    -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", self);
    v8 = self->_xpcConnection;
    WLKConnectionServerInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v9);

    -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", &__block_literal_global_4);
    objc_initWeak(&location, self);
    v10 = self->_xpcConnection;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __34__WLKPlaybackReporter__connection__block_invoke_5;
    v15 = &unk_1E68A7FC0;
    objc_copyWeak(&v16, &location);
    -[NSXPCConnection setInvalidationHandler:](v10, "setInvalidationHandler:", &v12);
    -[NSXPCConnection resume](self->_xpcConnection, "resume", v12, v13, v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  os_unfair_lock_unlock(p_xpcLock);
  return self->_xpcConnection;
}

void __34__WLKPlaybackReporter__connection__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  WLKPlaybackTrackingLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B515A000, v0, OS_LOG_TYPE_DEFAULT, "WLKPlaybackReporter - Connection interrupted.", v1, 2u);
  }

}

void __34__WLKPlaybackReporter__connection__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidationHandler");

}

- (void)_invalidationHandler
{
  NSObject *v3;
  NSXPCConnection *xpcConnection;
  uint8_t v5[16];

  WLKPlaybackTrackingLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKPlaybackReporter - Connection invalidated.", v5, 2u);
  }

  os_unfair_lock_lock(&self->_xpcLock);
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

  os_unfair_lock_unlock(&self->_xpcLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
