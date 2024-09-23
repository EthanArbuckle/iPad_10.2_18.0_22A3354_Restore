@implementation SASPresentationConnectionListener

+ (id)listener
{
  if (listener_onceToken_1 != -1)
    dispatch_once(&listener_onceToken_1, &__block_literal_global_24);
  return (id)listener_sharedListener_1;
}

void __45__SASPresentationConnectionListener_listener__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SASPresentationConnectionListener _init]([SASPresentationConnectionListener alloc], "_init");
  v1 = (void *)listener_sharedListener_1;
  listener_sharedListener_1 = (uint64_t)v0;

}

- (SASPresentationConnectionListener)init
{

  return 0;
}

+ (id)new
{
  return 0;
}

- (id)_init
{
  SASPresentationConnectionListener *v2;
  SASPresentationConnectionListener *v3;
  void *v4;
  SASPresentationConnectionListener *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  SASPresentationConnectionListener *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SASPresentationConnectionListener;
  v2 = -[SASPresentationConnectionListener init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E0D03460];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__SASPresentationConnectionListener__init__block_invoke;
    v9[3] = &unk_1E91FD068;
    v5 = v2;
    v10 = v5;
    objc_msgSend(v4, "listenerWithConfigurator:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASPresentationConnectionListener setListener:](v5, "setListener:", v6);

    -[SASPresentationConnectionListener listener](v5, "listener");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activate");

  }
  return v3;
}

void __42__SASPresentationConnectionListener__init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  +[SASBoardServicesConfiguration configuration](SASBoardServicesConfiguration, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "domainForService:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDomain:", v4);

  +[SASBoardServicesConfiguration configuration](SASBoardServicesConfiguration, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifierForService:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setService:", v6);

  objc_msgSend(v7, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "remoteProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = +[SASPresentationServer serverForConnection:](SASPresentationServer, "serverForConnection:", v5);
  }
  else
  {
    v8 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315394;
      v10 = "-[SASPresentationConnectionListener listener:didReceiveConnection:withContext:]";
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s SASPresentationConnectionListener: Unable to assign new incoming connection to a process because the remote was unknown : connection=%@", (uint8_t *)&v9, 0x16u);
    }
    objc_msgSend(v5, "invalidate");
  }

}

- (BSServiceConnectionListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
