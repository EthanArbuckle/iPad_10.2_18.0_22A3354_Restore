@implementation WBSSafariBookmarksSyncAgentConnection

- (WBSSafariBookmarksSyncAgentConnection)init
{
  WBSSafariBookmarksSyncAgentConnection *v2;
  WBSSafariBookmarksSyncAgentConnection *v3;
  WBSSafariBookmarksSyncAgentConnection *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WBSSafariBookmarksSyncAgentConnection;
  v2 = -[WBSSafariBookmarksSyncAgentConnection init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_connectionLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)_setUpConnectionIfNeeded
{
  os_unfair_lock_s *p_connectionLock;
  NSObject *v4;
  NSXPCConnection *v5;
  NSXPCConnection *connection;
  void *v7;
  _QWORD v8[4];
  id v9;
  id buf[2];

  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  if (!self->_connection)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXXPC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B2621000, v4, OS_LOG_TYPE_DEFAULT, "Setting up XPC to SBSA", (uint8_t *)buf, 2u);
    }
    v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.SafariBookmarksSyncAgent"), 0);
    connection = self->_connection;
    self->_connection = v5;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEFF6988);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v7);
    objc_initWeak(buf, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__WBSSafariBookmarksSyncAgentConnection__setUpConnectionIfNeeded__block_invoke;
    v8[3] = &unk_1E649B5B0;
    objc_copyWeak(&v9, buf);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v8);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);

  }
  os_unfair_lock_unlock(p_connectionLock);
}

void __65__WBSSafariBookmarksSyncAgentConnection__setUpConnectionIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionDidInvalidate");

}

- (void)_connectionDidInvalidate
{
  os_unfair_lock_s *p_connectionLock;
  NSObject *v4;
  NSXPCConnection *connection;
  uint8_t v6[16];

  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  v4 = WBS_LOG_CHANNEL_PREFIXXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B2621000, v4, OS_LOG_TYPE_DEFAULT, "XPC to SBSA invalidated", v6, 2u);
  }
  connection = self->_connection;
  self->_connection = 0;

  os_unfair_lock_unlock(p_connectionLock);
}

- (WBSSafariBookmarksSyncAgentProtocol)remoteObjectProxy
{
  void *v3;
  void *v4;
  WBSSafariBookmarksSyncAgentProtocol *v5;

  -[WBSSafariBookmarksSyncAgentConnection _setUpConnectionIfNeeded](self, "_setUpConnectionIfNeeded");
  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EEFF6988))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
