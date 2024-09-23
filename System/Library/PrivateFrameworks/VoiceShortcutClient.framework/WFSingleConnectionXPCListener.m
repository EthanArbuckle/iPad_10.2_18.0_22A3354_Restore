@implementation WFSingleConnectionXPCListener

- (WFSingleConnectionXPCListener)initWithExportedObject:(id)a3 exportedInterface:(id)a4
{
  id v8;
  id v9;
  void *v10;
  WFSingleConnectionXPCListener *v11;
  WFSingleConnectionXPCListener *v12;
  uint64_t v13;
  NSXPCListener *listener;
  WFSingleConnectionXPCListener *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSingleConnectionXPCListener.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("exportedObject"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSingleConnectionXPCListener.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("exportedInterface"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)WFSingleConnectionXPCListener;
  v11 = -[WFSingleConnectionXPCListener init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_exportedObject, a3);
    objc_storeStrong((id *)&v12->_exportedInterface, a4);
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v13 = objc_claimAutoreleasedReturnValue();
    listener = v12->_listener;
    v12->_listener = (NSXPCListener *)v13;

    -[NSXPCListener setDelegate:](v12->_listener, "setDelegate:", v12);
    -[NSXPCListener resume](v12->_listener, "resume");
    v15 = v12;
  }

  return v12;
}

- (NSXPCListenerEndpoint)endpoint
{
  void *v2;
  void *v3;

  -[WFSingleConnectionXPCListener listener](self, "listener");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSXPCListenerEndpoint *)v3;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  WFSingleConnectionXPCListener *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[WFSingleConnectionXPCListener activeConnection](self, "activeConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  getWFVoiceShortcutClientLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[WFSingleConnectionXPCListener listener:shouldAcceptNewConnection:]";
      _os_log_impl(&dword_1AF681000, v10, OS_LOG_TYPE_ERROR, "%s Not accepting new connection since there is already an active one.", buf, 0xCu);
    }

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[WFSingleConnectionXPCListener listener:shouldAcceptNewConnection:]";
      v24 = 2112;
      v25 = self;
      _os_log_impl(&dword_1AF681000, v10, OS_LOG_TYPE_DEFAULT, "%s Received incoming XPC connection for listener: %@", buf, 0x16u);
    }

    -[WFSingleConnectionXPCListener setActiveConnection:](self, "setActiveConnection:", v7);
    objc_initWeak((id *)buf, self);
    v11 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __68__WFSingleConnectionXPCListener_listener_shouldAcceptNewConnection___block_invoke;
    v20[3] = &unk_1E5FC83E8;
    objc_copyWeak(&v21, (id *)buf);
    objc_msgSend(v7, "setInvalidationHandler:", v20);
    v15 = v11;
    v16 = 3221225472;
    v17 = __68__WFSingleConnectionXPCListener_listener_shouldAcceptNewConnection___block_invoke_9;
    v18 = &unk_1E5FC83E8;
    objc_copyWeak(&v19, (id *)buf);
    objc_msgSend(v7, "setInterruptionHandler:", &v15);
    -[WFSingleConnectionXPCListener exportedInterface](self, "exportedInterface", v15, v16, v17, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v12);

    -[WFSingleConnectionXPCListener exportedObject](self, "exportedObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedObject:", v13);

    objc_msgSend(v7, "resume");
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }

  return v8 == 0;
}

- (id)exportedObject
{
  return self->_exportedObject;
}

- (NSXPCInterface)exportedInterface
{
  return self->_exportedInterface;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (NSXPCConnection)activeConnection
{
  return self->_activeConnection;
}

- (void)setActiveConnection:(id)a3
{
  objc_storeStrong((id *)&self->_activeConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConnection, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong(&self->_exportedObject, 0);
}

void __68__WFSingleConnectionXPCListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  getWFVoiceShortcutClientLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = 136315138;
    v4 = "-[WFSingleConnectionXPCListener listener:shouldAcceptNewConnection:]_block_invoke";
    _os_log_impl(&dword_1AF681000, v2, OS_LOG_TYPE_ERROR, "%s Connection to dialog was invalidated.", (uint8_t *)&v3, 0xCu);
  }

  objc_msgSend(WeakRetained, "setActiveConnection:", 0);
}

void __68__WFSingleConnectionXPCListener_listener_shouldAcceptNewConnection___block_invoke_9(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  getWFVoiceShortcutClientLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = 136315138;
    v4 = "-[WFSingleConnectionXPCListener listener:shouldAcceptNewConnection:]_block_invoke";
    _os_log_impl(&dword_1AF681000, v2, OS_LOG_TYPE_ERROR, "%s Connection to dialog was interrupted", (uint8_t *)&v3, 0xCu);
  }

  objc_msgSend(WeakRetained, "setActiveConnection:", 0);
}

@end
