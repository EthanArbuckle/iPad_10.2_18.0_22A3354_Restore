@implementation SFXPCClient

- (SFXPCClient)init
{
  SFXPCClient *v2;
  uint64_t v3;
  OS_dispatch_queue *dispatchQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFXPCClient;
  v2 = -[SFXPCClient init](&v6, sel_init);
  if (v2)
  {
    SFMainQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)dealloc
{
  OS_dispatch_queue *dispatchQueue;
  SFXPCClient *v4;
  SEL v5;
  id v6;
  objc_super v7;

  if (self->_connection)
  {
    v4 = (SFXPCClient *)FatalErrorF();
    -[SFXPCClient setDispatchQueue:](v4, v5, v6);
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    if (dispatchQueue)
    {
      self->_dispatchQueue = 0;

    }
    v7.receiver = self;
    v7.super_class = (Class)SFXPCClient;
    -[SFXPCClient dealloc](&v7, sel_dealloc);
  }
}

- (void)setDispatchQueue:(id)a3
{
  OS_dispatch_queue *v4;
  OS_dispatch_queue *dispatchQueue;
  SFXPCClient *obj;

  v4 = (OS_dispatch_queue *)a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_activateCalled)
  {
    FatalErrorF();
    __break(1u);
  }
  else
  {
    dispatchQueue = obj->_dispatchQueue;
    obj->_dispatchQueue = v4;

    objc_sync_exit(obj);
  }
}

- (void)getRemoteObjectProxyOnQueue:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__SFXPCClient_getRemoteObjectProxyOnQueue___block_invoke;
  v7[3] = &unk_1E482DFC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __43__SFXPCClient_getRemoteObjectProxyOnQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_getRemoteObjectProxyOnQueue:", *(_QWORD *)(a1 + 40));
}

- (void)onqueue_getRemoteObjectProxyOnQueue:(id)a3
{
  void *v4;
  uint64_t v5;
  void (**v6)(id, void *);

  v6 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_activateCalled)
  {
    -[SFXPCClient onqueue_ensureXPCStarted](self, "onqueue_ensureXPCStarted");
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_25);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v4);

  }
  else
  {
    v5 = FatalErrorF();
    __51__SFXPCClient_onqueue_getRemoteObjectProxyOnQueue___block_invoke(v5);
  }
}

void __51__SFXPCClient_onqueue_getRemoteObjectProxyOnQueue___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  daemon_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __51__SFXPCClient_onqueue_getRemoteObjectProxyOnQueue___block_invoke_cold_1(v2, v3);

}

- (void)_activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__SFXPCClient__activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __24__SFXPCClient__activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_activate");
}

- (void)onqueue_activate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "Activate already called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__SFXPCClient__invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__SFXPCClient__invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_invalidate");
}

- (void)onqueue_invalidate
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    connection = self->_connection;
    if (connection)
    {
      -[NSXPCConnection invalidate](connection, "invalidate");
      v4 = self->_connection;
      self->_connection = 0;

    }
    else
    {
      -[SFXPCClient onqueue_invalidated](self, "onqueue_invalidated");
    }
  }
}

- (void)onqueue_ensureXPCStarted
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_1A2830000, v0, OS_LOG_TYPE_DEBUG, "connection created", v1, 2u);
  OUTLINED_FUNCTION_5();
}

void __39__SFXPCClient_onqueue_ensureXPCStarted__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  int v3;
  id v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "shouldEscapeXpcTryCatch");

  v4 = objc_loadWeakRetained(v1);
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "onqueue_interrupted");
  else
    objc_msgSend(v4, "interrupted");

}

void __39__SFXPCClient_onqueue_ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  int v3;
  id v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "shouldEscapeXpcTryCatch");

  v4 = objc_loadWeakRetained(v1);
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "onqueue_invalidated");
  else
    objc_msgSend(v4, "invalidated");

}

- (void)onqueue_ensureConnectionEstablished
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  uint8_t buf[8];

  daemon_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "Establishing connection", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__SFXPCClient_onqueue_ensureConnectionEstablished__block_invoke;
  v4[3] = &unk_1E482FDE8;
  objc_copyWeak(&v5, (id *)buf);
  -[SFXPCClient onqueue_getRemoteObjectProxyOnQueue:](self, "onqueue_getRemoteObjectProxyOnQueue:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak((id *)buf);
}

void __50__SFXPCClient_onqueue_ensureConnectionEstablished__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  v3 = a2;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__SFXPCClient_onqueue_ensureConnectionEstablished__block_invoke_2;
  v4[3] = &unk_1E482E2A8;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  objc_msgSend(v3, "establishConnectionWithCompletionHandler:", v4);
  objc_destroyWeak(&v5);

}

void __50__SFXPCClient_onqueue_ensureConnectionEstablished__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  int v5;
  id v6;
  void *v7;
  uint8_t v8[16];

  daemon_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1A2830000, v2, OS_LOG_TYPE_DEFAULT, "connection established", v8, 2u);
  }

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = objc_msgSend(WeakRetained, "shouldEscapeXpcTryCatch");

  v6 = objc_loadWeakRetained(v3);
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "onqueue_connectionEstablished");
  else
    objc_msgSend(v6, "connectionEstablished");

}

- (void)interrupted
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__SFXPCClient_interrupted__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__SFXPCClient_interrupted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_interrupted");
}

- (void)onqueue_interrupted
{
  NSObject *v3;
  uint8_t v4[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  daemon_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "Interrupted", v4, 2u);
  }

  -[SFXPCClient onqueue_connectionInterrupted](self, "onqueue_connectionInterrupted");
  -[SFXPCClient onqueue_ensureConnectionEstablished](self, "onqueue_ensureConnectionEstablished");
}

- (void)invalidated
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__SFXPCClient_invalidated__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__SFXPCClient_invalidated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_invalidated");
}

- (void)onqueue_invalidated
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "XPC connection unexpectedly invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)connectionEstablished
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SFXPCClient_connectionEstablished__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __36__SFXPCClient_connectionEstablished__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_connectionEstablished");
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[4];
  id v10;

  v6 = a4;
  objc_msgSend(v6, "retainArguments");
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SFXPCClient_connection_handleInvocation_isReply___block_invoke;
  block[3] = &unk_1E482DF78;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __51__SFXPCClient_connection_handleInvocation_isReply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invoke");
}

- (id)machServiceName
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Subclass %@ must override %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (id)exportedInterface
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Subclass %@ must override %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (id)remoteObjectInterface
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Subclass %@ must override %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (BOOL)shouldEscapeXpcTryCatch
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Subclass %@ must override %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)onqueue_connectionEstablished
{
  NSObject *v2;
  uint8_t v3[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  daemon_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A2830000, v2, OS_LOG_TYPE_DEFAULT, "connection established", v3, 2u);
  }

}

- (void)onqueue_connectionInterrupted
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "connection interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)onqueue_connectionInvalidated
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "connection invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

void __51__SFXPCClient_onqueue_getRemoteObjectProxyOnQueue___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1A2830000, a2, OS_LOG_TYPE_ERROR, "Failed to get remote object proxy: %@", (uint8_t *)&v4, 0xCu);

}

@end
