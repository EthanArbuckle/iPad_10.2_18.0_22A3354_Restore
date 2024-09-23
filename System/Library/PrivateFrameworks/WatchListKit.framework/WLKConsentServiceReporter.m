@implementation WLKConsentServiceReporter

- (WLKConsentServiceReporter)init
{
  WLKConsentServiceReporter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WLKConsentServiceReporter;
  result = -[WLKConsentServiceReporter init](&v3, sel_init);
  if (result)
    result->_xpcLock._os_unfair_lock_opaque = 0;
  return result;
}

- (id)_connection
{
  os_unfair_lock_s *p_xpcLock;
  NSXPCConnection *v4;
  NSXPCConnection *connection;
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
  if (!self->_connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.watchlistd.xpc"), 0);
    connection = self->_connection;
    self->_connection = v4;

    v6 = self->_connection;
    WLKConnectionClientInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v6, "setExportedInterface:", v7);

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    v8 = self->_connection;
    WLKConnectionServerInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v9);

    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_26);
    objc_initWeak(&location, self);
    v10 = self->_connection;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __40__WLKConsentServiceReporter__connection__block_invoke_2;
    v15 = &unk_1E68A7FC0;
    objc_copyWeak(&v16, &location);
    -[NSXPCConnection setInvalidationHandler:](v10, "setInvalidationHandler:", &v12);
    -[NSXPCConnection resume](self->_connection, "resume", v12, v13, v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  os_unfair_lock_unlock(p_xpcLock);
  return self->_connection;
}

void __40__WLKConsentServiceReporter__connection__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  WLKSystemLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B515A000, v0, OS_LOG_TYPE_DEFAULT, "WLKConsentServiceReporter - Connection interrupted.", v1, 2u);
  }

}

void __40__WLKConsentServiceReporter__connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidationHandler");

}

- (void)_invalidationHandler
{
  NSObject *v3;
  NSXPCConnection *connection;
  uint8_t v5[16];

  WLKSystemLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKConsentServiceReporter - Connection invalidated.", v5, 2u);
  }

  os_unfair_lock_lock(&self->_xpcLock);
  connection = self->_connection;
  self->_connection = 0;

  os_unfair_lock_unlock(&self->_xpcLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
