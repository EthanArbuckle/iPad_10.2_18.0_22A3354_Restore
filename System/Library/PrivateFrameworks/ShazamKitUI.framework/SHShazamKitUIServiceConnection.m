@implementation SHShazamKitUIServiceConnection

- (void)dealloc
{
  objc_super v3;

  -[SHShazamKitUIServiceConnection tearDownConnection](self, "tearDownConnection");
  v3.receiver = self;
  v3.super_class = (Class)SHShazamKitUIServiceConnection;
  -[SHShazamKitUIServiceConnection dealloc](&v3, sel_dealloc);
}

- (SHShazamKitUIServiceConnection)initWithConnectionProvider:(id)a3
{
  id v5;
  SHShazamKitUIServiceConnection *v6;
  SHShazamKitUIServiceConnection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHShazamKitUIServiceConnection;
  v6 = -[SHShazamKitUIServiceConnection init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connectionProvider, a3);
    v7->_connectionLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (NSXPCConnection)connection
{
  os_unfair_lock_s *p_connectionLock;
  void *v4;
  NSXPCConnection *v5;
  NSXPCConnection *connection;

  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  if (!self->_connection)
  {
    -[SHShazamKitUIServiceConnection connectionProvider](self, "connectionProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shazamKitUIServiceConnection");
    v5 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
    connection = self->_connection;
    self->_connection = v5;

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    -[SHShazamKitUIServiceConnection attachDefaultConnectionHandlers](self, "attachDefaultConnectionHandlers");
    -[NSXPCConnection resume](self->_connection, "resume");
  }
  os_unfair_lock_unlock(p_connectionLock);
  return self->_connection;
}

- (void)attachDefaultConnectionHandlers
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC760];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__SHShazamKitUIServiceConnection_attachDefaultConnectionHandlers__block_invoke;
  v6[3] = &unk_24F136198;
  objc_copyWeak(&v7, &location);
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v6);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __65__SHShazamKitUIServiceConnection_attachDefaultConnectionHandlers__block_invoke_3;
  v4[3] = &unk_24F136198;
  objc_copyWeak(&v5, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __65__SHShazamKitUIServiceConnection_attachDefaultConnectionHandlers__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  shcore_log_object();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = 138412290;
    v6 = WeakRetained;
    _os_log_impl(&dword_2287A6000, v2, OS_LOG_TYPE_ERROR, "Fired XPC service interruption handler %@", (uint8_t *)&v5, 0xCu);

  }
  v4 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v4, "tearDownConnection");

}

void __65__SHShazamKitUIServiceConnection_attachDefaultConnectionHandlers__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  shcore_log_object();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = 138412290;
    v6 = WeakRetained;
    _os_log_impl(&dword_2287A6000, v2, OS_LOG_TYPE_ERROR, "Fired XPC service invalidation handler %@", (uint8_t *)&v5, 0xCu);

  }
  v4 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v4, "tearDownConnection");

}

- (void)tearDownConnection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  _QWORD v8[4];
  NSXPCConnection *v9;

  connection = self->_connection;
  if (connection)
  {
    -[NSXPCConnection setExportedObject:](connection, "setExportedObject:", 0);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", 0);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", 0);
    v4 = self->_connection;
    v5 = self->_connection;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __52__SHShazamKitUIServiceConnection_tearDownConnection__block_invoke;
    v8[3] = &unk_24F1360B8;
    v9 = v4;
    v6 = v4;
    -[NSXPCConnection scheduleSendBarrierBlock:](v5, "scheduleSendBarrierBlock:", v8);
    v7 = self->_connection;
    self->_connection = 0;

  }
}

uint64_t __52__SHShazamKitUIServiceConnection_tearDownConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)presentMediaItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD aBlock[4];
  id v13;

  v6 = a4;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__SHShazamKitUIServiceConnection_presentMediaItem_completionHandler___block_invoke;
  aBlock[3] = &unk_24F1361C0;
  v13 = v6;
  v7 = v6;
  v8 = a3;
  v9 = _Block_copy(aBlock);
  -[SHShazamKitUIServiceConnection connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentMediaItem:completionHandler:", v8, v7);

}

void __69__SHShazamKitUIServiceConnection_presentMediaItem_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BE90530], "errorWithCode:underlyingError:", 100, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)presentMediaItem:(id)a3 presentationSettings:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void *v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a5;
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __90__SHShazamKitUIServiceConnection_presentMediaItem_presentationSettings_completionHandler___block_invoke;
  v19 = &unk_24F1361E8;
  v20 = v8;
  v21 = v9;
  v10 = v8;
  v11 = v9;
  v12 = a4;
  v13 = _Block_copy(&v16);
  -[SHShazamKitUIServiceConnection connection](self, "connection", v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentMediaItem:presentationSettings:completionHandler:", v10, v12, v11);

}

void __90__SHShazamKitUIServiceConnection_presentMediaItem_presentationSettings_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE90530], "errorWithCode:underlyingError:", 100, a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "webURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *, id))(v3 + 16))(v3, 0, v4, v5);

}

- (void)presentMediaLibraryWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD aBlock[4];
  id v10;

  v4 = a3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__SHShazamKitUIServiceConnection_presentMediaLibraryWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_24F1361C0;
  v10 = v4;
  v5 = v4;
  v6 = _Block_copy(aBlock);
  -[SHShazamKitUIServiceConnection connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentMediaLibraryWithCompletionHandler:", v5);

}

void __75__SHShazamKitUIServiceConnection_presentMediaLibraryWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BE90530], "errorWithCode:underlyingError:", 100, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (SHShazamKitUIServiceConnectionProvider)connectionProvider
{
  return self->_connectionProvider;
}

- (os_unfair_lock_s)connectionLock
{
  return self->_connectionLock;
}

- (void)setConnectionLock:(os_unfair_lock_s)a3
{
  self->_connectionLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
