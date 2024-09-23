@implementation WFUIPresenterLaunchAngelConnection

- (WFUIPresenterLaunchAngelConnection)init
{
  WFUIPresenterLaunchAngelConnection *v2;
  WFUIPresenterLaunchAngelConnection *v3;
  WFUIPresenterLaunchAngelConnection *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFUIPresenterLaunchAngelConnection;
  v2 = -[WFUIPresenterLaunchAngelConnection init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  objc_super v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[WFUIPresenterLaunchAngelConnection cleanUpWithReason:](self, "cleanUpWithReason:", CFSTR("the connection class is deallocating"));
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)WFUIPresenterLaunchAngelConnection;
  -[WFUIPresenterLaunchAngelConnection dealloc](&v4, sel_dealloc);
}

- (void)cleanUpWithReason:(id)a3
{
  id v4;
  void *v5;
  NSObject *connection;
  _BOOL4 v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[WFUIPresenterLaunchAngelConnection connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  getWFLaunchAngelLogObject();
  connection = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(connection, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v9 = 136315394;
      v10 = "-[WFUIPresenterLaunchAngelConnection cleanUpWithReason:]";
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1C15B3000, connection, OS_LOG_TYPE_DEFAULT, "%s Invalidating launch angel connection because '%@'", (uint8_t *)&v9, 0x16u);
    }

    -[WFUIPresenterLaunchAngelConnection connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");

    connection = self->_connection;
    self->_connection = 0;
  }
  else if (v7)
  {
    v9 = 136315394;
    v10 = "-[WFUIPresenterLaunchAngelConnection cleanUpWithReason:]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1C15B3000, connection, OS_LOG_TYPE_DEFAULT, "%s Tried to invalidate any existing launch angel connections because '%@', but there aren't any. Moving on.", (uint8_t *)&v9, 0x16u);
  }

}

- (void)setHost:(id)a3
{
  os_unfair_lock_s *p_lock;
  WFUIPresenterHostInterface *v5;
  WFUIPresenterHostInterface *host;

  p_lock = &self->_lock;
  v5 = (WFUIPresenterHostInterface *)a3;
  os_unfair_lock_lock(p_lock);
  host = self->_host;

  if (host != v5)
    -[WFUIPresenterLaunchAngelConnection cleanUpWithReason:](self, "cleanUpWithReason:", CFSTR("got a new host object, have to set up a bidirectional connection"));
  self->_host = v5;
  os_unfair_lock_unlock(p_lock);
}

- (void)prepareConnectionIfNecessary
{
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  BSServiceConnectionClient *connection;
  id v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  -[WFUIPresenterLaunchAngelConnection connection](self, "connection");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        v6 = -[WFUIPresenterLaunchAngelConnection connectionInterrupted](self, "connectionInterrupted"),
        v5,
        v6))
  {
    -[WFUIPresenterLaunchAngelConnection connection](self, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activate");

    -[WFUIPresenterLaunchAngelConnection setConnectionInterrupted:](self, "setConnectionInterrupted:", 0);
  }
  else
  {
    -[WFUIPresenterLaunchAngelConnection connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0D03458], "endpointForMachName:service:instance:", CFSTR("com.apple.shortcuts.view-service"), CFSTR("com.apple.shortcuts.ui-presenter"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFUIPresenterConnection.m"), 209, CFSTR("This process cannot connect to the view service endpoint."));

      }
      objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __66__WFUIPresenterLaunchAngelConnection_prepareConnectionIfNecessary__block_invoke;
      v15[3] = &unk_1E7AEED60;
      v15[4] = self;
      objc_msgSend(v10, "configureConnection:", v15);
      getWFLaunchAngelLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v17 = "-[WFUIPresenterLaunchAngelConnection prepareConnectionIfNecessary]";
        _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_DEFAULT, "%s [Host-side] Launch angel activating", buf, 0xCu);
      }

      objc_msgSend(v10, "activate");
      connection = self->_connection;
      self->_connection = (BSServiceConnectionClient *)v10;
      v13 = v10;

    }
  }
}

- (id)presenterWithErrorHandler:(id)a3
{
  id v4;
  NSObject *v5;
  os_unfair_lock_s *p_lock;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  CFTimeInterval v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFXPCRunnerLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[WFUIPresenterLaunchAngelConnection presenterWithErrorHandler:]";
    v15 = 2048;
    v16 = CACurrentMediaTime();
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEBUG, "%s [Performance] Opening connection to the UI presenter, %f", buf, 0x16u);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[WFUIPresenterLaunchAngelConnection prepareConnectionIfNecessary](self, "prepareConnectionIfNecessary");
  -[WFUIPresenterLaunchAngelConnection setErrorHandler:](self, "setErrorHandler:", v4);

  -[WFUIPresenterLaunchAngelConnection connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteTargetWithLaunchingAssertionAttributes:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (BOOL)isConnected
{
  WFUIPresenterLaunchAngelConnection *v2;
  os_unfair_lock_s *p_lock;
  void *v4;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[WFUIPresenterLaunchAngelConnection connection](v2, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != 0;

  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (WFUIPresenterHostInterface)host
{
  return self->_host;
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)connectionInterrupted
{
  return self->_connectionInterrupted;
}

- (void)setConnectionInterrupted:(BOOL)a3
{
  self->_connectionInterrupted = a3;
}

- (BSServiceConnectionClient)connection
{
  return self->_connection;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
}

void __66__WFUIPresenterLaunchAngelConnection_prepareConnectionIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  WFUIPresenterServiceInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(*(id *)(a1 + 32), "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "setInterfaceTarget:", v6);
  objc_msgSend(v3, "setActivationHandler:", &__block_literal_global_242_20225);
  v7 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__WFUIPresenterLaunchAngelConnection_prepareConnectionIfNecessary__block_invoke_243;
  v9[3] = &unk_1E7AEED38;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __66__WFUIPresenterLaunchAngelConnection_prepareConnectionIfNecessary__block_invoke_244;
  v8[3] = &unk_1E7AEED38;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "setInvalidationHandler:", v8);

}

void __66__WFUIPresenterLaunchAngelConnection_prepareConnectionIfNecessary__block_invoke_243(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  getWFLaunchAngelLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[WFUIPresenterLaunchAngelConnection prepareConnectionIfNecessary]_block_invoke";
    _os_log_impl(&dword_1C15B3000, v2, OS_LOG_TYPE_DEFAULT, "%s [Host-side] Launch angel connection interruption", (uint8_t *)&v9, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  objc_msgSend(*(id *)(a1 + 32), "setConnectionInterrupted:", 1);
  objc_msgSend(*(id *)(a1 + 32), "errorHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "errorHandler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    WFRunnerFailureErrorMessage(0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v4)[2](v4, v5);

    objc_msgSend(*(id *)(a1 + 32), "setErrorHandler:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "interruptionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "interruptionHandler");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    WFRunnerFailureErrorMessage(0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v7)[2](v7, v8);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

void __66__WFUIPresenterLaunchAngelConnection_prepareConnectionIfNecessary__block_invoke_244(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  getWFLaunchAngelLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[WFUIPresenterLaunchAngelConnection prepareConnectionIfNecessary]_block_invoke";
    _os_log_impl(&dword_1C15B3000, v2, OS_LOG_TYPE_DEFAULT, "%s [Host-side] Launch angel connection invalidated", (uint8_t *)&v5, 0xCu);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

void __66__WFUIPresenterLaunchAngelConnection_prepareConnectionIfNecessary__block_invoke_2()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  getWFLaunchAngelLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[WFUIPresenterLaunchAngelConnection prepareConnectionIfNecessary]_block_invoke_2";
    _os_log_impl(&dword_1C15B3000, v0, OS_LOG_TYPE_DEFAULT, "%s [Host-side] Launch angel connection activated", (uint8_t *)&v1, 0xCu);
  }

}

@end
