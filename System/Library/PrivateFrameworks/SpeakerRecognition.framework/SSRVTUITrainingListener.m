@implementation SSRVTUITrainingListener

- (SSRVTUITrainingListener)initWithMessageHandler:(id)a3
{
  id v5;
  SSRVTUITrainingListener *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SSRVTUITrainingListener;
  v6 = -[SSRVTUITrainingListener init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE28488], "getSerialQueue:qualityOfService:", CFSTR("SSRVTUITrainingListener Queue"), 33);
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_messageHandler, a3);
  }

  return v6;
}

- (void)listen
{
  NSXPCListener *v3;
  NSXPCListener *listener;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.siri.ssrvtuitrainingservice.xpc"));
  listener = self->_listener;
  self->_listener = v3;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener resume](self->_listener, "resume");
  v5 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SSRVTUITrainingListener listen]";
    _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s SSRVTUITrainingListener start listening", (uint8_t *)&v6, 0xCu);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSXPCListener *v6;
  NSXPCListener *v7;
  os_log_t *v8;
  NSObject *v9;
  NSXPCListener *listener;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *queue;
  uint64_t v15;
  NSXPCListener *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;
  _QWORD block[4];
  NSXPCListener *v26;
  SSRVTUITrainingListener *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  NSXPCListener *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = (NSXPCListener *)a3;
  v7 = (NSXPCListener *)a4;
  v8 = (os_log_t *)MEMORY[0x24BE28368];
  v9 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[SSRVTUITrainingListener listener:shouldAcceptNewConnection:]";
    v30 = 2112;
    v31 = v7;
    _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s Got new connection on attending service: %@", buf, 0x16u);
  }
  listener = self->_listener;
  if (listener == v6)
  {
    SSRVTUITrainingServiceGetXPCInterface();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCListener setExportedInterface:](v7, "setExportedInterface:", v12);

    v13 = (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254AC8020);
    -[NSXPCListener setRemoteObjectInterface:](v7, "setRemoteObjectInterface:", v13);

    queue = self->_queue;
    v15 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__SSRVTUITrainingListener_listener_shouldAcceptNewConnection___block_invoke;
    block[3] = &unk_24CC85EE8;
    v16 = v7;
    v26 = v16;
    v27 = self;
    dispatch_sync(queue, block);
    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v16);
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = __62__SSRVTUITrainingListener_listener_shouldAcceptNewConnection___block_invoke_2;
    v21[3] = &unk_24CC852E8;
    objc_copyWeak(&v22, (id *)buf);
    objc_copyWeak(&v23, &location);
    -[NSXPCListener setInterruptionHandler:](v16, "setInterruptionHandler:", v21);
    v18[0] = v15;
    v18[1] = 3221225472;
    v18[2] = __62__SSRVTUITrainingListener_listener_shouldAcceptNewConnection___block_invoke_2_4;
    v18[3] = &unk_24CC852E8;
    objc_copyWeak(&v19, (id *)buf);
    objc_copyWeak(&v20, &location);
    -[NSXPCListener setInvalidationHandler:](v16, "setInvalidationHandler:", v18);
    -[NSXPCListener resume](v16, "resume");
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v11 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[SSRVTUITrainingListener listener:shouldAcceptNewConnection:]";
      v30 = 2114;
      v31 = v6;
      _os_log_error_impl(&dword_2117D4000, v11, OS_LOG_TYPE_ERROR, "%s Invalid listener - %{public}@", buf, 0x16u);
    }
  }

  return listener == v6;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSXPCConnection)activeConnection
{
  return self->_activeConnection;
}

- (void)setActiveConnection:(id)a3
{
  objc_storeStrong((id *)&self->_activeConnection, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (SSRVTUITrainingMessageHandler)messageHandler
{
  return self->_messageHandler;
}

- (void)setMessageHandler:(id)a3
{
  objc_storeStrong((id *)&self->_messageHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activeConnection, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

uint64_t __62__SSRVTUITrainingListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "setExportedObject:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
  objc_msgSend(*(id *)(a1 + 32), "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectProxy:", v3);

  objc_msgSend(*(id *)(a1 + 40), "activeConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "activeConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInvalidationHandler:", 0);

    objc_msgSend(*(id *)(a1 + 40), "activeConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

  }
  return objc_msgSend(*(id *)(a1 + 40), "setActiveConnection:", *(_QWORD *)(a1 + 32));
}

void __62__SSRVTUITrainingListener_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (void *)*MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = v5;
    *(_DWORD *)buf = 136315906;
    v14 = "-[SSRVTUITrainingListener listener:shouldAcceptNewConnection:]_block_invoke_2";
    v15 = 2114;
    v16 = CFSTR("com.apple.siri.ssrvtuitrainingservice.xpc");
    v17 = 2114;
    v18 = v5;
    v19 = 1026;
    v20 = objc_msgSend(v6, "processIdentifier");
    _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s [Service:%{public}@] Listener Interruption Handler: %{public}@, client PID: %{public}d)", buf, 0x26u);

  }
  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = v7;
  if (WeakRetained && v7)
  {
    objc_msgSend(WeakRetained, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __62__SSRVTUITrainingListener_listener_shouldAcceptNewConnection___block_invoke_3;
    v10[3] = &unk_24CC85EE8;
    v11 = v8;
    v12 = WeakRetained;
    dispatch_async(v9, v10);

  }
}

void __62__SSRVTUITrainingListener_listener_shouldAcceptNewConnection___block_invoke_2_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (void *)*MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = v5;
    *(_DWORD *)buf = 136315906;
    v12 = "-[SSRVTUITrainingListener listener:shouldAcceptNewConnection:]_block_invoke_2";
    v13 = 2114;
    v14 = CFSTR("com.apple.siri.ssrvtuitrainingservice.xpc");
    v15 = 2114;
    v16 = v5;
    v17 = 1026;
    v18 = objc_msgSend(v6, "processIdentifier");
    _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s [Service:%{public}@] Listener Invalidation Handler: %{public}@, client PID: %{public}d exited", buf, 0x26u);

  }
  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = v7;
  if (WeakRetained && v7)
  {
    objc_msgSend(WeakRetained, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__SSRVTUITrainingListener_listener_shouldAcceptNewConnection___block_invoke_5;
    block[3] = &unk_24CC864B8;
    block[4] = WeakRetained;
    dispatch_async(v9, block);

  }
}

void __62__SSRVTUITrainingListener_listener_shouldAcceptNewConnection___block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setActiveConnection:", 0);
  objc_msgSend(*(id *)(a1 + 32), "messageHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectProxy:", 0);

  objc_msgSend(*(id *)(a1 + 32), "messageHandler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vtuiTrainingXPCDisconnected");

}

void __62__SSRVTUITrainingListener_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  objc_msgSend(*(id *)(a1 + 40), "setActiveConnection:", 0);
  objc_msgSend(*(id *)(a1 + 40), "messageHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectProxy:", 0);

  objc_msgSend(*(id *)(a1 + 40), "messageHandler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vtuiTrainingXPCDisconnected");

}

@end
