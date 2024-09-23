@implementation SBFCARenderer

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_25);
  return (id)sharedInstance_renderer;
}

void __31__SBFCARenderer_sharedInstance__block_invoke()
{
  SBFCARenderer *v0;
  void *v1;

  v0 = objc_alloc_init(SBFCARenderer);
  v1 = (void *)sharedInstance_renderer;
  sharedInstance_renderer = (uint64_t)v0;

}

- (void)_createConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *rendererServiceConnection;
  NSXPCConnection *v5;
  void *v6;
  _QWORD v7[5];

  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.springboard.SBRendererService"));
  rendererServiceConnection = self->_rendererServiceConnection;
  self->_rendererServiceConnection = v3;

  -[NSXPCConnection setInterruptionHandler:](self->_rendererServiceConnection, "setInterruptionHandler:", &__block_literal_global_3);
  v5 = self->_rendererServiceConnection;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__SBFCARenderer__createConnection__block_invoke_4;
  v7[3] = &unk_1E200E188;
  v7[4] = self;
  -[NSXPCConnection setInvalidationHandler:](v5, "setInvalidationHandler:", v7);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDFC8078);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_rendererServiceConnection, "setRemoteObjectInterface:", v6);
  -[NSXPCConnection resume](self->_rendererServiceConnection, "resume");

}

void __34__SBFCARenderer__createConnection__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  SBLogWallpaper();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_18AB69000, v0, OS_LOG_TYPE_DEFAULT, "SBRendererService connection interrupted", v1, 2u);
  }

}

void __34__SBFCARenderer__createConnection__block_invoke_4(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[8];
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SBFCARenderer__createConnection__block_invoke_2;
  block[3] = &unk_1E200E188;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  SBLogWallpaper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_18AB69000, v1, OS_LOG_TYPE_DEFAULT, "SBRendererService connection invalidated", v2, 2u);
  }

}

void __34__SBFCARenderer__createConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

- (id)_remoteObjectProxy
{
  NSXPCConnection *rendererServiceConnection;

  rendererServiceConnection = self->_rendererServiceConnection;
  if (!rendererServiceConnection)
  {
    -[SBFCARenderer _createConnection](self, "_createConnection");
    rendererServiceConnection = self->_rendererServiceConnection;
  }
  return -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](rendererServiceConnection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_17_0);
}

void __35__SBFCARenderer__remoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  SBLogWallpaper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_18AB69000, v3, OS_LOG_TYPE_DEFAULT, " SBRenderer's syncRemoteObjectProxy encountered an error %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)warmup
{
  NSObject *v3;
  _QWORD block[5];

  if (+[SBFCARenderer shouldUseXPCServiceForRendering](SBFCARenderer, "shouldUseXPCServiceForRendering"))
  {
    dispatch_get_global_queue(25, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __23__SBFCARenderer_warmup__block_invoke;
    block[3] = &unk_1E200E188;
    block[4] = self;
    dispatch_async(v3, block);

  }
}

void __23__SBFCARenderer_warmup__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "service_warmup:", &__block_literal_global_19_1);

}

void __23__SBFCARenderer_warmup__block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  SBLogWallpaper();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_18AB69000, v0, OS_LOG_TYPE_DEFAULT, "Renderer Service Launched successfully", v1, 2u);
  }

}

+ (BOOL)shouldUseXPCServiceForRendering
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFrontBoard");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rendererServiceConnection, 0);
}

@end
