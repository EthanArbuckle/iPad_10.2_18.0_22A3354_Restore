@implementation VSKeepAlive

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_serverConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)VSKeepAlive;
  -[VSKeepAlive dealloc](&v3, sel_dealloc);
}

- (id)_serverConnection
{
  NSXPCConnection *serverConnection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  serverConnection = self->_serverConnection;
  if (!serverConnection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.voiceservices.keepalive"), 0);
    v5 = self->_serverConnection;
    self->_serverConnection = v4;

    v6 = self->_serverConnection;
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F04444D8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);

    objc_initWeak(&location, self);
    v8 = self->_serverConnection;
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __32__VSKeepAlive__serverConnection__block_invoke;
    v13 = &unk_1EA8AFF90;
    objc_copyWeak(&v14, &location);
    -[NSXPCConnection setInterruptionHandler:](v8, "setInterruptionHandler:", &v10);
    -[NSXPCConnection resume](self->_serverConnection, "resume", v10, v11, v12, v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    serverConnection = self->_serverConnection;
  }
  return serverConnection;
}

- (id)_remoteKeepAlive
{
  void *v2;
  void *v3;

  -[VSKeepAlive _serverConnection](self, "_serverConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (self->_active != a3)
  {
    v3 = a3;
    self->_active = a3;
    -[VSKeepAlive _remoteKeepAlive](self, "_remoteKeepAlive");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      objc_msgSend(v5, "maintainWithAudioType:keepAudioSessionActive:", self->_audioType, self->_keepAudioSessionActive);
    else
      objc_msgSend(v5, "cancel");

  }
}

- (void)setKeepAudioSessionActive:(BOOL)a3
{
  self->_keepAudioSessionActive = a3;
}

- (void)_ensureKeepAliveMaintenance
{
  id v3;

  if (self->_active)
  {
    -[VSKeepAlive _remoteKeepAlive](self, "_remoteKeepAlive");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "maintainWithAudioType:keepAudioSessionActive:", self->_audioType, self->_keepAudioSessionActive);

  }
}

- (int64_t)audioType
{
  return self->_audioType;
}

- (void)setAudioType:(int64_t)a3
{
  self->_audioType = a3;
}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)keepAudioSessionActive
{
  return self->_keepAudioSessionActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverConnection, 0);
}

void __32__VSKeepAlive__serverConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_ensureKeepAliveMaintenance");

}

@end
