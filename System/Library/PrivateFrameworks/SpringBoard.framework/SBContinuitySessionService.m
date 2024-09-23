@implementation SBContinuitySessionService

- (SBContinuitySessionService)init
{
  SBContinuitySessionServiceConnectionListenerFactory *v3;
  SBContinuitySessionService *v4;

  v3 = objc_alloc_init(SBContinuitySessionServiceConnectionListenerFactory);
  v4 = -[SBContinuitySessionService initWithServiceListenerFactory:](self, "initWithServiceListenerFactory:", v3);

  return v4;
}

- (SBContinuitySessionService)initWithServiceListenerFactory:(id)a3
{
  id v4;
  SBContinuitySessionService *v5;
  void *v6;
  uint64_t v7;
  _SBContinuitySessionServiceConnectionListening *serviceConnectionListener;
  uint64_t v9;
  NSMapTable *sessions;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBContinuitySessionService;
  v5 = -[SBContinuitySessionService init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)BSDispatchQueueCreateWithQualityOfService();
    v7 = objc_msgSend(v4, "newContinuitySessionServiceListenerForDelegate:serviceQueue:", v5, v6);
    serviceConnectionListener = v5->_serviceConnectionListener;
    v5->_serviceConnectionListener = (_SBContinuitySessionServiceConnectionListening *)v7;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    sessions = v5->_sessions;
    v5->_sessions = (NSMapTable *)v9;

  }
  return v5;
}

- (void)activate
{
  -[_SBContinuitySessionServiceConnectionListening activate](self->_serviceConnectionListener, "activate");
}

- (void)clientDidConnect:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

void __47__SBContinuitySessionService_clientDidConnect___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogContinuitySessionService();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "client connected: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKey:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("SBContinuitySessionService.m"), 54, CFSTR("already have a session for this client"));

    if (WeakRetained)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("SBContinuitySessionService.m"), 55, CFSTR("client connected but we don't have a session factory to hook him up to"));

    goto LABEL_5;
  }
  if (!WeakRetained)
    goto LABEL_7;
LABEL_5:
  v6 = (void *)objc_msgSend(WeakRetained, "newContinuitySession");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setObject:forKey:", v6, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "setSession:", v6);
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", v6);
  objc_msgSend(v6, "continuitySessionServiceClientConnected:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "continuitySessionDidUpdateState:", v6);

}

- (void)clientDidDisconnect:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

void __50__SBContinuitySessionService_clientDidDisconnect___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  SBLogContinuitySessionService();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "client disconnected: %{public}@ invalidating session", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKey:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSession:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", 0);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("terminal.client-disconnected"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateForReasons:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 32));
}

- (SBContinuitySessionFactory)sessionFactory
{
  return (SBContinuitySessionFactory *)objc_loadWeakRetained((id *)&self->_sessionFactory);
}

- (void)setSessionFactory:(id)a3
{
  objc_storeWeak((id *)&self->_sessionFactory, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sessionFactory);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_serviceConnectionListener, 0);
}

@end
