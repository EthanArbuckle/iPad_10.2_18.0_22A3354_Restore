@implementation UAFXPCConnection

- (UAFXPCConnection)init
{
  return -[UAFXPCConnection initWithMachServiceName:](self, "initWithMachServiceName:", CFSTR("com.apple.siri.uaf.service"));
}

- (UAFXPCConnection)initWithMachServiceName:(id)a3
{
  id v5;
  UAFXPCConnection *v6;
  UAFXPCConnection *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UAFXPCConnection;
  v6 = -[UAFXPCConnection init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceName, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INTERACTIVE, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "stringByAppendingString:", CFSTR(".queue.connection"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = dispatch_queue_create((const char *)objc_msgSend(v10, "cStringUsingEncoding:", 1), v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v11;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[UAFXPCConnection _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)UAFXPCConnection;
  -[UAFXPCConnection dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__UAFXPCConnection_invalidate__block_invoke;
  block[3] = &unk_24F1F6F88;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __30__UAFXPCConnection_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v4;

  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    -[NSXPCConnection setExportedObject:](xpcConnection, "setExportedObject:", 0);
    -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
    v4 = self->_xpcConnection;
    self->_xpcConnection = 0;

  }
}

- (id)_connection
{
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  uint64_t v9;
  NSXPCConnection *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", self->_serviceName, 0);
    v5 = self->_xpcConnection;
    self->_xpcConnection = v4;

    -[NSXPCConnection _setQueue:](self->_xpcConnection, "_setQueue:", self->_queue);
    v6 = self->_xpcConnection;
    +[UAFXPCProxyServiceInterface defaultInterface](UAFXPCProxyServiceInterface, "defaultInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", 0);
    -[NSXPCConnection setExportedInterface:](self->_xpcConnection, "setExportedInterface:", 0);
    objc_initWeak(&location, self);
    v8 = self->_xpcConnection;
    v9 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __31__UAFXPCConnection__connection__block_invoke;
    v14[3] = &unk_24F1F6FD8;
    objc_copyWeak(&v15, &location);
    -[NSXPCConnection setInterruptionHandler:](v8, "setInterruptionHandler:", v14);
    v10 = self->_xpcConnection;
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __31__UAFXPCConnection__connection__block_invoke_183;
    v12[3] = &unk_24F1F6FD8;
    objc_copyWeak(&v13, &location);
    -[NSXPCConnection setInvalidationHandler:](v10, "setInvalidationHandler:", v12);
    -[NSXPCConnection resume](self->_xpcConnection, "resume");
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    xpcConnection = self->_xpcConnection;
  }
  return xpcConnection;
}

void __31__UAFXPCConnection__connection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[UAFXPCConnection _connection]_block_invoke";
    _os_log_debug_impl(&dword_229282000, v2, OS_LOG_TYPE_DEBUG, "%s XPC Connection interrupted", (uint8_t *)&v4, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInterrupted");

}

void __31__UAFXPCConnection__connection__block_invoke_183(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[UAFXPCConnection _connection]_block_invoke";
    _os_log_debug_impl(&dword_229282000, v2, OS_LOG_TYPE_DEBUG, "%s XPC Connection invalidated", (uint8_t *)&v4, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInvalidated");

}

- (void)operationWithConfig:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__UAFXPCConnection_operationWithConfig_completion___block_invoke;
  block[3] = &unk_24F1F7510;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

void __51__UAFXPCConnection_operationWithConfig_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__UAFXPCConnection_operationWithConfig_completion___block_invoke_2;
  v8[3] = &unk_24F1F74E8;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __51__UAFXPCConnection_operationWithConfig_completion___block_invoke_185;
  v6[3] = &unk_24F1F74E8;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "operationWithConfig:completion:", v5, v6);

}

void __51__UAFXPCConnection_operationWithConfig_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v6 = 136315394;
      v7 = "-[UAFXPCConnection operationWithConfig:completion:]_block_invoke_2";
      v8 = 2112;
      v9 = v3;
      _os_log_debug_impl(&dword_229282000, v4, OS_LOG_TYPE_DEBUG, "%s remoteObjectProxyWithErrorHandler failed with: %@", (uint8_t *)&v6, 0x16u);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __51__UAFXPCConnection_operationWithConfig_completion___block_invoke_185(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v6 = 136315394;
      v7 = "-[UAFXPCConnection operationWithConfig:completion:]_block_invoke";
      v8 = 2112;
      v9 = v3;
      _os_log_debug_impl(&dword_229282000, v4, OS_LOG_TYPE_DEBUG, "%s operationWithConfig failed with: %@", (uint8_t *)&v6, 0x16u);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)diagnosticInformation:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__UAFXPCConnection_diagnosticInformation___block_invoke;
  v7[3] = &unk_24F1F7560;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __42__UAFXPCConnection_diagnosticInformation___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__UAFXPCConnection_diagnosticInformation___block_invoke_2;
  v7[3] = &unk_24F1F74E8;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __42__UAFXPCConnection_diagnosticInformation___block_invoke_186;
  v5[3] = &unk_24F1F7538;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "diagnosticInformation:", v5);

}

void __42__UAFXPCConnection_diagnosticInformation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v6 = 136315394;
      v7 = "-[UAFXPCConnection diagnosticInformation:]_block_invoke_2";
      v8 = 2112;
      v9 = v3;
      _os_log_debug_impl(&dword_229282000, v4, OS_LOG_TYPE_DEBUG, "%s remoteObjectProxyWithErrorHandler failed with: %@", (uint8_t *)&v6, 0x16u);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __42__UAFXPCConnection_diagnosticInformation___block_invoke_186(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = 136315394;
      v10 = "-[UAFXPCConnection diagnosticInformation:]_block_invoke";
      v11 = 2112;
      v12 = v6;
      _os_log_debug_impl(&dword_229282000, v7, OS_LOG_TYPE_DEBUG, "%s diagnosticInformation failed with: %@", (uint8_t *)&v9, 0x16u);
    }

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

- (void)lockLatestAtomicInstance:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__UAFXPCConnection_lockLatestAtomicInstance_completion___block_invoke;
  block[3] = &unk_24F1F75A8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __56__UAFXPCConnection_lockLatestAtomicInstance_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__UAFXPCConnection_lockLatestAtomicInstance_completion___block_invoke_188;
  v5[3] = &unk_24F1F74E8;
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "lockLatestAtomicInstance:completion:", v4, v5);

}

void __56__UAFXPCConnection_lockLatestAtomicInstance_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315394;
      v5 = "-[UAFXPCConnection lockLatestAtomicInstance:completion:]_block_invoke_2";
      v6 = 2112;
      v7 = v2;
      _os_log_impl(&dword_229282000, v3, OS_LOG_TYPE_DEFAULT, "%s remoteObjectProxyWithErrorHandler failed with: %@", (uint8_t *)&v4, 0x16u);
    }

  }
}

void __56__UAFXPCConnection_lockLatestAtomicInstance_completion___block_invoke_188(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[UAFXPCConnection lockLatestAtomicInstance:completion:]_block_invoke";
    _os_log_impl(&dword_229282000, v4, OS_LOG_TYPE_DEFAULT, "%s updateAutoAssetsFromAssetSetUsages complete", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)downloadSiriAssets
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__UAFXPCConnection_downloadSiriAssets__block_invoke;
  block[3] = &unk_24F1F6F88;
  block[4] = self;
  dispatch_async(queue, block);
}

void __38__UAFXPCConnection_downloadSiriAssets__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_189);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "downloadSiriAssets");

}

void __38__UAFXPCConnection_downloadSiriAssets__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = 136315394;
      v5 = "-[UAFXPCConnection downloadSiriAssets]_block_invoke_2";
      v6 = 2112;
      v7 = v2;
      _os_log_debug_impl(&dword_229282000, v3, OS_LOG_TYPE_DEBUG, "%s remoteObjectProxyWithErrorHandler failed with: %@", (uint8_t *)&v4, 0x16u);
    }

  }
}

- (void)downloadSiriAssetsOverCellular
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__UAFXPCConnection_downloadSiriAssetsOverCellular__block_invoke;
  block[3] = &unk_24F1F6F88;
  block[4] = self;
  dispatch_async(queue, block);
}

void __50__UAFXPCConnection_downloadSiriAssetsOverCellular__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_190);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "downloadSiriAssetsOverCellular");

}

void __50__UAFXPCConnection_downloadSiriAssetsOverCellular__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = 136315394;
      v5 = "-[UAFXPCConnection downloadSiriAssetsOverCellular]_block_invoke_2";
      v6 = 2112;
      v7 = v2;
      _os_log_debug_impl(&dword_229282000, v3, OS_LOG_TYPE_DEBUG, "%s remoteObjectProxyWithErrorHandler failed with: %@", (uint8_t *)&v4, 0x16u);
    }

  }
}

- (void)postAssetNotificationIfNeeded
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__UAFXPCConnection_postAssetNotificationIfNeeded__block_invoke;
  block[3] = &unk_24F1F6F88;
  block[4] = self;
  dispatch_async(queue, block);
}

void __49__UAFXPCConnection_postAssetNotificationIfNeeded__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_191);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postAssetNotificationIfNeeded");

}

void __49__UAFXPCConnection_postAssetNotificationIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = 136315394;
      v5 = "-[UAFXPCConnection postAssetNotificationIfNeeded]_block_invoke_2";
      v6 = 2112;
      v7 = v2;
      _os_log_debug_impl(&dword_229282000, v3, OS_LOG_TYPE_DEBUG, "%s remoteObjectProxyWithErrorHandler failed with: %@", (uint8_t *)&v4, 0x16u);
    }

  }
}

- (void)downloadDictationAssetsForLanguage:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__UAFXPCConnection_downloadDictationAssetsForLanguage___block_invoke;
  v7[3] = &unk_24F1F70C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __55__UAFXPCConnection_downloadDictationAssetsForLanguage___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_192);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloadDictationAssetsForLanguage:", *(_QWORD *)(a1 + 40));

}

void __55__UAFXPCConnection_downloadDictationAssetsForLanguage___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = 136315394;
      v5 = "-[UAFXPCConnection downloadDictationAssetsForLanguage:]_block_invoke_2";
      v6 = 2112;
      v7 = v2;
      _os_log_debug_impl(&dword_229282000, v3, OS_LOG_TYPE_DEBUG, "%s remoteObjectProxyWithErrorHandler failed with: %@", (uint8_t *)&v4, 0x16u);
    }

  }
}

- (void)postDictationAssetNotificationForLanguage:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__UAFXPCConnection_postDictationAssetNotificationForLanguage___block_invoke;
  v7[3] = &unk_24F1F70C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __62__UAFXPCConnection_postDictationAssetNotificationForLanguage___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_193);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postDictationAssetNotificationForLanguage:", *(_QWORD *)(a1 + 40));

}

void __62__UAFXPCConnection_postDictationAssetNotificationForLanguage___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = 136315394;
      v5 = "-[UAFXPCConnection postDictationAssetNotificationForLanguage:]_block_invoke_2";
      v6 = 2112;
      v7 = v2;
      _os_log_debug_impl(&dword_229282000, v3, OS_LOG_TYPE_DEBUG, "%s remoteObjectProxyWithErrorHandler failed with: %@", (uint8_t *)&v4, 0x16u);
    }

  }
}

- (void)checkAssetStatus:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__UAFXPCConnection_checkAssetStatus___block_invoke;
  v7[3] = &unk_24F1F7560;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __37__UAFXPCConnection_checkAssetStatus___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__UAFXPCConnection_checkAssetStatus___block_invoke_2;
  v7[3] = &unk_24F1F74E8;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __37__UAFXPCConnection_checkAssetStatus___block_invoke_194;
  v5[3] = &unk_24F1F7670;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "checkAssetStatus:", v5);

}

void __37__UAFXPCConnection_checkAssetStatus___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v6 = 136315394;
      v7 = "-[UAFXPCConnection checkAssetStatus:]_block_invoke_2";
      v8 = 2112;
      v9 = v3;
      _os_log_debug_impl(&dword_229282000, v4, OS_LOG_TYPE_DEBUG, "%s remoteObjectProxyWithErrorHandler failed with: %@", (uint8_t *)&v6, 0x16u);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __37__UAFXPCConnection_checkAssetStatus___block_invoke_194(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = 136315394;
      v10 = "-[UAFXPCConnection checkAssetStatus:]_block_invoke";
      v11 = 2112;
      v12 = v6;
      _os_log_debug_impl(&dword_229282000, v7, OS_LOG_TYPE_DEBUG, "%s checkAssetStatus failed with: %@", (uint8_t *)&v9, 0x16u);
    }

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

- (void)diskSpaceNeededInBytesForLanguage:(id)a3 forClient:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __75__UAFXPCConnection_diskSpaceNeededInBytesForLanguage_forClient_completion___block_invoke;
  v13[3] = &unk_24F1F76C0;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v8;
  v12 = v9;
  dispatch_async(queue, v13);

}

void __75__UAFXPCConnection_diskSpaceNeededInBytesForLanguage_forClient_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __75__UAFXPCConnection_diskSpaceNeededInBytesForLanguage_forClient_completion___block_invoke_2;
  v10[3] = &unk_24F1F74E8;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 56);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __75__UAFXPCConnection_diskSpaceNeededInBytesForLanguage_forClient_completion___block_invoke_196;
  v7[3] = &unk_24F1F7698;
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v4, "diskSpaceNeededInBytesForLanguage:forClient:completion:", v8, v6, v7);

}

void __75__UAFXPCConnection_diskSpaceNeededInBytesForLanguage_forClient_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v6 = 136315394;
      v7 = "-[UAFXPCConnection diskSpaceNeededInBytesForLanguage:forClient:completion:]_block_invoke_2";
      v8 = 2112;
      v9 = v3;
      _os_log_debug_impl(&dword_229282000, v4, OS_LOG_TYPE_DEBUG, "%s remoteObjectProxyWithErrorHandler failed with: %@", (uint8_t *)&v6, 0x16u);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __75__UAFXPCConnection_diskSpaceNeededInBytesForLanguage_forClient_completion___block_invoke_196(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 136315650;
      v11 = "-[UAFXPCConnection diskSpaceNeededInBytesForLanguage:forClient:completion:]_block_invoke";
      v12 = 2112;
      v13 = v9;
      v14 = 2112;
      v15 = v6;
      _os_log_debug_impl(&dword_229282000, v7, OS_LOG_TYPE_DEBUG, "%s diskSpaceInBytesForLanguage %@ failed with: %@", (uint8_t *)&v10, 0x20u);
    }

  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
