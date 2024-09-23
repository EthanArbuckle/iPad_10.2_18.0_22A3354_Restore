@implementation WBSPasswordBreachHelperProxy

- (WBSPasswordBreachHelperProxy)init
{
  WBSPasswordBreachHelperProxy *v2;
  WBSPasswordBreachHelperProxy *v3;
  WBSPasswordBreachHelperProxy *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WBSPasswordBreachHelperProxy;
  v2 = -[WBSPasswordBreachHelperProxy init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_connectionLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[WBSPasswordBreachHelperProxy invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)WBSPasswordBreachHelperProxy;
  -[WBSPasswordBreachHelperProxy dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  os_unfair_lock_s *p_connectionLock;
  NSXPCConnection *v4;

  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  v4 = self->_connection;
  os_unfair_lock_unlock(p_connectionLock);
  -[NSXPCConnection invalidate](v4, "invalidate");

}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  os_unfair_lock_s *p_connectionLock;
  NSXPCConnection *connection;
  uint64_t v7;
  NSXPCConnection *v8;
  NSXPCConnection *v9;
  void *v10;
  NSXPCConnection *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  v4 = a3;
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  connection = self->_connection;
  v7 = MEMORY[0x1E0C809B0];
  if (!connection)
  {
    v8 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.Safari.PasswordBreachHelper"), 0);
    v9 = self->_connection;
    self->_connection = v8;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEFF1890);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v10);
    objc_initWeak(&location, self);
    v21[0] = v7;
    v21[1] = 3221225472;
    v21[2] = __67__WBSPasswordBreachHelperProxy__remoteObjectProxyWithErrorHandler___block_invoke;
    v21[3] = &unk_1E649B5B0;
    objc_copyWeak(&v22, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v21);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

    connection = self->_connection;
  }
  v11 = connection;
  os_unfair_lock_unlock(p_connectionLock);
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __67__WBSPasswordBreachHelperProxy__remoteObjectProxyWithErrorHandler___block_invoke_2;
  v19[3] = &unk_1E649DA98;
  v12 = v4;
  v20 = v12;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v11, "remoteObjectProxyWithErrorHandler:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    v16 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[WBSPasswordBreachHelperProxy _remoteObjectProxyWithErrorHandler:].cold.1(v16);
    objc_msgSend(MEMORY[0x1E0CB35C8], "safari_errorWithDomain:code:privacyPreservingDescription:", *MEMORY[0x1E0CB2FE0], 14, CFSTR("Failed to acquire remote object proxy."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v12 + 2))(v12, v17);

  }
  return v14;
}

void __67__WBSPasswordBreachHelperProxy__remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v2;
  void *v3;
  os_unfair_lock_s *v4;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 4;
    v4 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 4);
    v3 = *(void **)&v4[2]._os_unfair_lock_opaque;
    *(_QWORD *)&v4[2]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(v2);
    WeakRetained = v4;
  }

}

void __67__WBSPasswordBreachHelperProxy__remoteObjectProxyWithErrorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __67__WBSPasswordBreachHelperProxy__remoteObjectProxyWithErrorHandler___block_invoke_2_cold_1(v4, v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)runLookupSessionIgnoringMinimumDelay:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__WBSPasswordBreachHelperProxy_runLookupSessionIgnoringMinimumDelay_completionHandler___block_invoke;
  v9[3] = &unk_1E649DA98;
  v10 = v6;
  v7 = v6;
  -[WBSPasswordBreachHelperProxy _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "runLookupSessionIgnoringMinimumDelay:completionHandler:", v4, v7);

}

uint64_t __87__WBSPasswordBreachHelperProxy_runLookupSessionIgnoringMinimumDelay_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getResultRecordDictionariesForResultQueryDictionaries:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __108__WBSPasswordBreachHelperProxy_getResultRecordDictionariesForResultQueryDictionaries_withCompletionHandler___block_invoke;
  v10[3] = &unk_1E649DA98;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[WBSPasswordBreachHelperProxy _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getResultRecordDictionariesForResultQueryDictionaries:withCompletionHandler:", v8, v7);

}

uint64_t __108__WBSPasswordBreachHelperProxy_getResultRecordDictionariesForResultQueryDictionaries_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)recentlyBreachedResultRecordDictionariesWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __94__WBSPasswordBreachHelperProxy_recentlyBreachedResultRecordDictionariesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E649DA98;
  v8 = v4;
  v5 = v4;
  -[WBSPasswordBreachHelperProxy _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recentlyBreachedResultRecordDictionariesWithCompletionHandler:", v5);

}

uint64_t __94__WBSPasswordBreachHelperProxy_recentlyBreachedResultRecordDictionariesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clearRecentlyBreachedResultRecordsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__WBSPasswordBreachHelperProxy_clearRecentlyBreachedResultRecordsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E649DA98;
  v8 = v4;
  v5 = v4;
  -[WBSPasswordBreachHelperProxy _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clearRecentlyBreachedResultRecordsWithCompletionHandler:", v5);

}

uint64_t __88__WBSPasswordBreachHelperProxy_clearRecentlyBreachedResultRecordsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clearAllRecordsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__WBSPasswordBreachHelperProxy_clearAllRecordsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E649DA98;
  v8 = v4;
  v5 = v4;
  -[WBSPasswordBreachHelperProxy _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clearAllRecordsWithCompletionHandler:", v5);

}

uint64_t __69__WBSPasswordBreachHelperProxy_clearAllRecordsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addResultRecordDictionaries:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__WBSPasswordBreachHelperProxy_addResultRecordDictionaries_completionHandler___block_invoke;
  v10[3] = &unk_1E649DA98;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[WBSPasswordBreachHelperProxy _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addResultRecordDictionaries:completionHandler:", v8, v7);

}

uint64_t __78__WBSPasswordBreachHelperProxy_addResultRecordDictionaries_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)_remoteObjectProxyWithErrorHandler:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B2621000, log, OS_LOG_TYPE_ERROR, "Failed to acquire remote object proxy.", v1, 2u);
}

void __67__WBSPasswordBreachHelperProxy__remoteObjectProxyWithErrorHandler___block_invoke_2_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1B2621000, v3, OS_LOG_TYPE_ERROR, "Remote proxy object error handler invoked with error: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
