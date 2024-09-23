@implementation PTTraceSession

- (PTTraceSession)init
{
  PTTraceSession *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PTTraceSession;
  result = -[PTTraceSession init](&v3, sel_init);
  if (result)
    result->_isValid = 1;
  return result;
}

+ (id)initWithConfig:(id)a3
{
  id v3;
  PTTraceSession *v4;

  v3 = a3;
  v4 = objc_alloc_init(PTTraceSession);
  -[PTTraceSession setConfig:](v4, "setConfig:", v3);

  -[PTTraceSession setConnection:](v4, "setConnection:", 0);
  return v4;
}

- (void)startPerformanceTrace
{
  void *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_213A76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Starting Performance Trace", v6, 2u);
  }
  if (-[PTTraceSession isValid](self, "isValid"))
  {
    -[PTTraceSession connection](self, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      -[PTTraceSession _initConnection](self, "_initConnection");
    -[PTTraceSession _getRemoteObjectProxy](self, "_getRemoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTTraceSession config](self, "config");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startPerformanceTrace:", v5);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "error:description:", 1, CFSTR("Unable to start Performance Trace as the session is no longer valid"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTTraceSession performanceTraceDidStart:](self, "performanceTraceDidStart:", v4);
  }

}

- (void)stopPerformanceTrace
{
  void *v3;
  void *v4;
  uint8_t v5[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_213A76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Stopping Performance Trace", v5, 2u);
  }
  -[PTTraceSession connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[PTTraceSession _initConnection](self, "_initConnection");
  -[PTTraceSession _getRemoteObjectProxy](self, "_getRemoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopPerformanceTrace");

}

- (void)_ping:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_213A76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Sending Ping: %@", (uint8_t *)&v7, 0xCu);
  }
  -[PTTraceSession connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[PTTraceSession _initConnection](self, "_initConnection");
  -[PTTraceSession _getRemoteObjectProxy](self, "_getRemoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pingService:", v4);

}

- (void)_initConnection
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.PerformanceTrace.PerformanceTraceService"));
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D18968);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRemoteObjectInterface:", v3);
  objc_msgSend(v6, "setInvalidationHandler:", &__block_literal_global_0);
  objc_msgSend(v6, "setInterruptionHandler:", &__block_literal_global_22);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D189C8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v4);

  objc_msgSend(v6, "setExportedObject:", self);
  -[PTTraceSession setConnection:](self, "setConnection:", v6);
  -[PTTraceSession connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resume");

}

void __33__PTTraceSession__initConnection__block_invoke()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_213A76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "XPC connection invalidated.", v0, 2u);
  }
}

void __33__PTTraceSession__initConnection__block_invoke_21()
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __33__PTTraceSession__initConnection__block_invoke_21_cold_1();
}

- (id)_getRemoteObjectProxy
{
  void *v2;
  void *v3;

  -[PTTraceSession connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_75);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __39__PTTraceSession__getRemoteObjectProxy__block_invoke(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __39__PTTraceSession__getRemoteObjectProxy__block_invoke_cold_1(a2);
}

- (void)_invalidateSession
{
  void *v3;
  id v4;

  self->_isValid = 0;
  -[PTTraceSession connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PTTraceSession connection](self, "connection");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

  }
}

- (void)performanceTraceDidStart:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PTTraceSession delegate](self, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[PTTraceSession delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[PTTraceSession delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "performanceTraceDidStart:", v9);

    }
  }

}

- (void)performanceTraceDidStop:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PTTraceSession delegate](self, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[PTTraceSession delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[PTTraceSession delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "performanceTraceDidStop:", v9);

    }
  }

}

- (void)performanceTraceDidComplete:(id)a3 withToken:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  -[PTTraceSession delegate](self, "delegate");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[PTTraceSession delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[PTTraceSession delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "performanceTraceDidComplete:withToken:withError:", v15, v8, v9);

    }
  }
  -[PTTraceSession _invalidateSession](self, "_invalidateSession");

}

- (void)_didPingService:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PTTraceSession delegate](self, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[PTTraceSession delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[PTTraceSession delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_didPingService:", v9);

    }
  }

}

- (PTTraceConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (PTTraceSessionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (BOOL)isValid
{
  return self->_isValid;
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
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

void __33__PTTraceSession__initConnection__block_invoke_21_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_213A76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "XPC connection interrupted.", v0, 2u);
}

void __39__PTTraceSession__getRemoteObjectProxy__block_invoke_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138543362;
  v2 = a1;
  _os_log_error_impl(&dword_213A76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to connect to the service protocol: %{public}@", (uint8_t *)&v1, 0xCu);
}

@end
