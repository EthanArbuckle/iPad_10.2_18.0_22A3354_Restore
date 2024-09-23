@implementation PBUIWallpaperServer

- (PBUIWallpaperServer)init
{
  PBUIWallpaperServer *v2;
  uint64_t v3;
  FBServiceClientAuthenticator *clientAuthenticator;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  void *v7;
  PBUIWallpaperServer *v8;
  uint64_t v9;
  BSServiceConnectionListener *connectionListener;
  uint64_t v11;
  NSMutableArray *connections;
  _QWORD v14[4];
  PBUIWallpaperServer *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PBUIWallpaperServer;
  v2 = -[PBUIWallpaperServer init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:additionalCredentials:", CFSTR("com.apple.paperboard.wallpaper-access"), 2);
    clientAuthenticator = v2->_clientAuthenticator;
    v2->_clientAuthenticator = (FBServiceClientAuthenticator *)v3;

    v5 = dispatch_queue_create("com.apple.PaperBoard.WallpaperServer.queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (void *)MEMORY[0x1E0D03460];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __27__PBUIWallpaperServer_init__block_invoke;
    v14[3] = &unk_1E6B96540;
    v8 = v2;
    v15 = v8;
    objc_msgSend(v7, "listenerWithConfigurator:", v14);
    v9 = objc_claimAutoreleasedReturnValue();
    connectionListener = v8->_connectionListener;
    v8->_connectionListener = (BSServiceConnectionListener *)v9;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    connections = v8->_connections;
    v8->_connections = (NSMutableArray *)v11;

  }
  return v2;
}

void __27__PBUIWallpaperServer_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.paperboard"));
  +[PBUIWallpaperServiceInterfaceSpecification identifier](PBUIWallpaperServiceInterfaceSpecification, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)invalidate
{
  -[BSServiceConnectionListener invalidate](self->_connectionListener, "invalidate");
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  FBServiceClientAuthenticator *clientAuthenticator;
  void *v10;
  void *v11;
  NSObject *queue;
  id v13;
  _QWORD block[5];
  id v15;
  _QWORD v16[5];
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  PBUILogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v6;
    _os_log_impl(&dword_1B71C0000, v7, OS_LOG_TYPE_INFO, "PBUIWallpaperServer received connection: %{public}@", buf, 0xCu);
  }

  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__PBUIWallpaperServer_listener_didReceiveConnection_withContext___block_invoke;
  v16[3] = &unk_1E6B96590;
  v16[4] = self;
  objc_msgSend(v6, "configureConnection:", v16);
  clientAuthenticator = self->_clientAuthenticator;
  objc_msgSend(v6, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "auditToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(clientAuthenticator) = -[FBServiceClientAuthenticator authenticateAuditToken:](clientAuthenticator, "authenticateAuditToken:", v11);

  if ((_DWORD)clientAuthenticator)
  {
    queue = self->_queue;
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __65__PBUIWallpaperServer_listener_didReceiveConnection_withContext___block_invoke_8;
    block[3] = &unk_1E6B94BC8;
    block[4] = self;
    v13 = v6;
    v15 = v13;
    dispatch_async(queue, block);
    objc_msgSend(v13, "activate");

  }
  else
  {
    objc_msgSend(v6, "invalidate");
  }

}

void __65__PBUIWallpaperServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = a2;
  +[PBUIWallpaperServiceInterfaceSpecification serviceQuality](PBUIWallpaperServiceInterfaceSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[PBUIWallpaperServiceInterfaceSpecification interface](PBUIWallpaperServiceInterfaceSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__PBUIWallpaperServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v6[3] = &unk_1E6B96568;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "setInvalidationHandler:", v6);
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

}

void __65__PBUIWallpaperServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PBUILogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1B71C0000, v4, OS_LOG_TYPE_INFO, "PBUIWallpaperServer received connection invalidation: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_removeConnection:", v3);
}

uint64_t __65__PBUIWallpaperServer_listener_didReceiveConnection_withContext___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addConnection:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_addConnection:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBUILogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1B71C0000, v5, OS_LOG_TYPE_INFO, "Adding Connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableArray addObject:](self->_connections, "addObject:", v4);

}

- (void)_queue_removeConnection:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBUILogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1B71C0000, v5, OS_LOG_TYPE_INFO, "Removing Connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableArray removeObject:](self->_connections, "removeObject:", v4);

}

- (void)activate
{
  -[BSServiceConnectionListener activate](self->_connectionListener, "activate");
}

- (BOOL)setWallpaperImage:(id)a3 adjustedImage:(id)a4 thumbnailData:(id)a5 imageHashData:(id)a6 wallpaperOptions:(id)a7 forLocations:(id)a8 currentWallpaperMode:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  char v24;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  -[PBUIWallpaperServer delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "setWallpaperImage:adjustedImage:thumbnailData:imageHashData:wallpaperOptions:forLocations:currentWallpaperMode:", v22, v21, v20, v19, v18, v17, v16);

  return v24;
}

- (void)setProceduralWallpaperIdentifier:(id)a3 options:(id)a4 locations:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PBUIWallpaperServer delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProceduralWallpaperIdentifier:options:locations:", v10, v9, v8);

}

- (void)removeWallpaperVideo
{
  id v2;

  -[PBUIWallpaperServer delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeWallpaperVideo");

}

- (BOOL)setWallpaperWithVideo:(id)a3 sandboxToken:(id)a4 cropRect:(id)a5 wallpaperMode:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[PBUIWallpaperServer delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "setWallpaperWithVideo:sandboxToken:cropRect:wallpaperMode:", v13, v12, v11, v10);

  return v15;
}

- (void)restoreDefaultWallpaper
{
  id v2;

  -[PBUIWallpaperServer delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "restoreDefaultWallpaper");

}

- (BOOL)setWallpaperColor:(id)a3 darkColor:(id)a4 forLocations:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PBUIWallpaperServer delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "setWallpaperColor:darkColor:forLocations:", v10, v9, v8);

  return v12;
}

- (BOOL)setWallpaperGradient:(id)a3 forLocations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[PBUIWallpaperServer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "setWallpaperGradient:forLocations:", v7, v6);

  return v9;
}

- (id)getWallpaperOptionsForVariant:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PBUIWallpaperServer delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getWallpaperOptionsForVariant:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getWallpaperLegibilitySettingsForVariant:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PBUIWallpaperServer delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getWallpaperLegibilitySettingsForVariant:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PBUIWallpaperServerDelegate)delegate
{
  return (PBUIWallpaperServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientAuthenticator, 0);
}

@end
