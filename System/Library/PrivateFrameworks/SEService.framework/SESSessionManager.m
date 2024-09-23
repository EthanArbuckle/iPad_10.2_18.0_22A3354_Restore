@implementation SESSessionManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_5);
  return (id)sharedInstance_instance;
}

uint64_t __35__SESSessionManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = v0;

  v2 = (void *)objc_opt_new();
  objc_msgSend((id)sharedInstance_instance, "setSessions:", v2);

  return objc_msgSend((id)sharedInstance_instance, "setServiceName:", CFSTR("com.apple.seserviced.session"));
}

- (id)startDigitalCarKeySessionWithOptions:(id)a3 startCallback:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  SESSessionManager *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[5];
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  SESDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_impl(&dword_20A048000, v8, OS_LOG_TYPE_INFO, "startDigitalCarKeySessionWithOptions %@", buf, 0xCu);
  }

  v9 = +[SESDCKSession newInstance](SESDCKSession, "newInstance");
  objc_msgSend(v9, "setDidStartCallback:", v7);

  v10 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __72__SESSessionManager_startDigitalCarKeySessionWithOptions_startCallback___block_invoke;
  v24[3] = &unk_24C2BD348;
  v24[4] = self;
  objc_msgSend(v9, "setDidEndCallback:", v24);
  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = __72__SESSessionManager_startDigitalCarKeySessionWithOptions_startCallback___block_invoke_2;
  v22[3] = &unk_24C2BD370;
  v11 = v9;
  v23 = v11;
  -[SESSessionManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10;
  v17 = 3221225472;
  v18 = __72__SESSessionManager_startDigitalCarKeySessionWithOptions_startCallback___block_invoke_310;
  v19 = &unk_24C2BD398;
  v13 = v11;
  v20 = v13;
  v21 = self;
  objc_msgSend(v12, "startSESDCKSession:completion:", v13, &v16);

  objc_msgSend(v13, "resume", v16, v17, v18, v19);
  v14 = v13;

  return v14;
}

uint64_t __72__SESSessionManager_startDigitalCarKeySessionWithOptions_startCallback___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionEnded:", a2);
}

void __72__SESSessionManager_startDigitalCarKeySessionWithOptions_startCallback___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    SESDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_20A048000, v4, OS_LOG_TYPE_ERROR, "Failed to get proxy %@", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "endSession");
  }

}

void __72__SESSessionManager_startDigitalCarKeySessionWithOptions_startCallback___block_invoke_310(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  SESDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_20A048000, v8, OS_LOG_TYPE_ERROR, "Proxy error %@", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "endSession");
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = *(void **)(a1 + 32);
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_20A048000, v8, OS_LOG_TYPE_INFO, "Adding new SESDCKSession %@", (uint8_t *)&v11, 0xCu);
    }

    v10 = *(id *)(*(_QWORD *)(a1 + 40) + 8);
    objc_sync_enter(v10);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "addObject:", *(_QWORD *)(a1 + 32));
    objc_sync_exit(v10);

    objc_msgSend(*(id *)(a1 + 32), "setProxy:", v5);
  }

}

- (id)startRKESessionWithOptions:(id)a3 startCallback:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  SESSessionManager *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[5];
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  SESDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_impl(&dword_20A048000, v8, OS_LOG_TYPE_INFO, "startRKESessionWithOptions %@", buf, 0xCu);
  }

  v9 = +[SESRKESession newInstance](SESRKESession, "newInstance");
  objc_msgSend(v9, "setDidStartCallback:", v7);

  v10 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __62__SESSessionManager_startRKESessionWithOptions_startCallback___block_invoke;
  v24[3] = &unk_24C2BD348;
  v24[4] = self;
  objc_msgSend(v9, "setDidEndCallback:", v24);
  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = __62__SESSessionManager_startRKESessionWithOptions_startCallback___block_invoke_2;
  v22[3] = &unk_24C2BD370;
  v11 = v9;
  v23 = v11;
  -[SESSessionManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10;
  v17 = 3221225472;
  v18 = __62__SESSessionManager_startRKESessionWithOptions_startCallback___block_invoke_313;
  v19 = &unk_24C2BD398;
  v13 = v11;
  v20 = v13;
  v21 = self;
  objc_msgSend(v12, "startSESRKESession:options:completion:", v13, v6, &v16);

  objc_msgSend(v13, "resume", v16, v17, v18, v19);
  v14 = v13;

  return v14;
}

uint64_t __62__SESSessionManager_startRKESessionWithOptions_startCallback___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionEnded:", a2);
}

void __62__SESSessionManager_startRKESessionWithOptions_startCallback___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    SESDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_20A048000, v4, OS_LOG_TYPE_ERROR, "Failed to get proxy %@", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "endSession");
  }

}

void __62__SESSessionManager_startRKESessionWithOptions_startCallback___block_invoke_313(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  SESDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_20A048000, v8, OS_LOG_TYPE_ERROR, "Proxy error %@", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "endSessionWithError:", v6);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = *(void **)(a1 + 32);
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_20A048000, v8, OS_LOG_TYPE_INFO, "Adding new SESRKESession %@", (uint8_t *)&v11, 0xCu);
    }

    v10 = *(id *)(*(_QWORD *)(a1 + 40) + 8);
    objc_sync_enter(v10);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "addObject:", *(_QWORD *)(a1 + 32));
    objc_sync_exit(v10);

    objc_msgSend(*(id *)(a1 + 32), "setProxy:", v5);
  }

}

- (id)startACWGSessionWithOptions:(id)a3 startCallback:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  SESSessionManager *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[5];
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  SESDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_impl(&dword_20A048000, v8, OS_LOG_TYPE_INFO, "startACWGSessionWithOptions %@", buf, 0xCu);
  }

  v9 = +[SESACWGSession newInstance](SESACWGSession, "newInstance");
  objc_msgSend(v9, "setDidStartCallback:", v7);

  v10 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __63__SESSessionManager_startACWGSessionWithOptions_startCallback___block_invoke;
  v24[3] = &unk_24C2BD348;
  v24[4] = self;
  objc_msgSend(v9, "setDidEndCallback:", v24);
  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = __63__SESSessionManager_startACWGSessionWithOptions_startCallback___block_invoke_2;
  v22[3] = &unk_24C2BD370;
  v11 = v9;
  v23 = v11;
  -[SESSessionManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10;
  v17 = 3221225472;
  v18 = __63__SESSessionManager_startACWGSessionWithOptions_startCallback___block_invoke_315;
  v19 = &unk_24C2BD398;
  v13 = v11;
  v20 = v13;
  v21 = self;
  objc_msgSend(v12, "startSESACWGSession:completion:", v13, &v16);

  objc_msgSend(v13, "resume", v16, v17, v18, v19);
  v14 = v13;

  return v14;
}

uint64_t __63__SESSessionManager_startACWGSessionWithOptions_startCallback___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionEnded:", a2);
}

void __63__SESSessionManager_startACWGSessionWithOptions_startCallback___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    SESDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_20A048000, v4, OS_LOG_TYPE_ERROR, "Failed to get proxy %@", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "endSession");
  }

}

void __63__SESSessionManager_startACWGSessionWithOptions_startCallback___block_invoke_315(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  SESDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_20A048000, v8, OS_LOG_TYPE_ERROR, "Proxy error %@", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "endSession");
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = *(void **)(a1 + 32);
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_20A048000, v8, OS_LOG_TYPE_INFO, "Adding new SESACWGSession %@", (uint8_t *)&v11, 0xCu);
    }

    v10 = *(id *)(*(_QWORD *)(a1 + 40) + 8);
    objc_sync_enter(v10);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "addObject:", *(_QWORD *)(a1 + 32));
    objc_sync_exit(v10);

    objc_msgSend(*(id *)(a1 + 32), "setProxy:", v5);
  }

}

- (void)sessionEnded:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->_sessions;
  objc_sync_enter(v5);
  SESDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_20A048000, v6, OS_LOG_TYPE_INFO, "Session %@ ended", (uint8_t *)&v7, 0xCu);
  }

  -[NSMutableSet removeObject:](self->_sessions, "removeObject:", v4);
  objc_sync_exit(v5);

}

- (void)connect
{
  SESSessionManager *v2;
  NSObject *v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSXPCConnection *connection;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[16];
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id buf[2];

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_connection)
  {
    SESDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_20A048000, v3, OS_LOG_TYPE_INFO, "Already XPC connected", (uint8_t *)buf, 2u);
    }

  }
  else
  {
    v4 = objc_alloc(MEMORY[0x24BDD1988]);
    -[SESSessionManager serviceName](v2, "serviceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithMachServiceName:options:", v5, 4096);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v6;

    +[SESSessionManagerInterface interface](SESSessionManagerInterface, "interface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v8);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545DC358);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v2->_connection, "setExportedInterface:", v9);

    -[NSXPCConnection setExportedObject:](v2->_connection, "setExportedObject:", v2);
    objc_initWeak(buf, v2);
    v10 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __28__SESSessionManager_connect__block_invoke;
    v15[3] = &unk_24C2BD018;
    objc_copyWeak(&v16, buf);
    -[NSXPCConnection setInterruptionHandler:](v2->_connection, "setInterruptionHandler:", v15);
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __28__SESSessionManager_connect__block_invoke_359;
    v13[3] = &unk_24C2BD018;
    objc_copyWeak(&v14, buf);
    -[NSXPCConnection setInvalidationHandler:](v2->_connection, "setInvalidationHandler:", v13);
    -[NSXPCConnection resume](v2->_connection, "resume");
    SESDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_20A048000, v11, OS_LOG_TYPE_INFO, "XPC connected", v12, 2u);
    }

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(buf);
  }
  objc_sync_exit(v2);

}

void __28__SESSessionManager_connect__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  SESDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20A048000, v2, OS_LOG_TYPE_INFO, "Connection interrupted", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionDidInterrupt");

}

void __28__SESSessionManager_connect__block_invoke_359(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  SESDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20A048000, v2, OS_LOG_TYPE_INFO, "Connection invalidated", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionDidInvalidate");

}

- (void)connectionDidInterrupt
{
  SESSessionManager *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NSXPCConnection invalidate](obj->_connection, "invalidate");
  objc_sync_exit(obj);

}

- (void)connectionDidInvalidate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  SESSessionManager *v10;
  NSXPCConnection *connection;
  NSMutableSet *obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  obj = self->_sessions;
  objc_sync_enter(obj);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (void *)-[NSMutableSet copy](self->_sessions, "copy");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v6);
        SESDefaultLogObject();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        SESCreateAndLogError();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "didEndUnexpectedly:", v9);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

  objc_sync_exit(obj);
  v10 = self;
  objc_sync_enter(v10);
  connection = v10->_connection;
  v10->_connection = 0;

  objc_sync_exit(v10);
}

+ (id)pauseRangingForReaderIdentifier:(id)a3 durationInSec:(double)a4 withAppletIdentifier:(id)a5
{
  id v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD v20[5];
  _QWORD v21[5];
  uint8_t v22[4];
  uint64_t v23;
  _BYTE buf[24];
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (uint64_t (*)(uint64_t, uint64_t))a5;
  SESDefaultLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a4;
    *(_WORD *)&buf[22] = 2112;
    v25 = v8;
    _os_log_impl(&dword_20A048000, v9, OS_LOG_TYPE_INFO, "pauseRangingForReaderIdentifier %@ durationInSec %f appletIdentifier %@", buf, 0x20u);
  }

  if (a4 >= 1.0)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v25 = __Block_byref_object_copy__8;
    v26 = __Block_byref_object_dispose__8;
    v27 = 0;
    +[SESSessionManager sharedInstance](SESSessionManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __88__SESSessionManager_pauseRangingForReaderIdentifier_durationInSec_withAppletIdentifier___block_invoke;
    v21[3] = &unk_24C2BCCB0;
    v21[4] = buf;
    objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __88__SESSessionManager_pauseRangingForReaderIdentifier_durationInSec_withAppletIdentifier___block_invoke_2;
    v20[3] = &unk_24C2BCCB0;
    v20[4] = buf;
    objc_msgSend(v14, "pauseRangingForReaderIdentifier:durationInSec:withAppletIdentifier:reply:", v7, v15, v8, v20);

    v16 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v16)
    {
      SESDefaultLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v22 = 138412290;
        v23 = v18;
        _os_log_impl(&dword_20A048000, v17, OS_LOG_TYPE_ERROR, "%@", v22, 0xCu);
      }

      v16 = *(void **)(*(_QWORD *)&buf[8] + 40);
    }
    v11 = v16;
    _Block_object_dispose(buf, 8);

  }
  else
  {
    SESDefaultLogObject();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

void __88__SESSessionManager_pauseRangingForReaderIdentifier_durationInSec_withAppletIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __88__SESSessionManager_pauseRangingForReaderIdentifier_durationInSec_withAppletIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (id)resumeRangingForReaderIdentifier:(id)a3 withAppletIdentifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  _QWORD v16[5];
  _QWORD v17[5];
  uint8_t v18[4];
  uint64_t v19;
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  SESDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_20A048000, v7, OS_LOG_TYPE_INFO, "resumeRangingForReaderIdentifier %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__8;
  v23 = __Block_byref_object_dispose__8;
  v24 = 0;
  +[SESSessionManager sharedInstance](SESSessionManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __75__SESSessionManager_resumeRangingForReaderIdentifier_withAppletIdentifier___block_invoke;
  v17[3] = &unk_24C2BCCB0;
  v17[4] = &buf;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __75__SESSessionManager_resumeRangingForReaderIdentifier_withAppletIdentifier___block_invoke_2;
  v16[3] = &unk_24C2BCCB0;
  v16[4] = &buf;
  objc_msgSend(v10, "resumeRangingForReaderIdentifier:withAppletIdentifier:reply:", v5, v6, v16);

  v11 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  if (v11)
  {
    SESDefaultLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v18 = 138412290;
      v19 = v13;
      _os_log_impl(&dword_20A048000, v12, OS_LOG_TYPE_ERROR, "%@", v18, 0xCu);
    }

    v11 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  }
  v14 = v11;
  _Block_object_dispose(&buf, 8);

  return v14;
}

void __75__SESSessionManager_resumeRangingForReaderIdentifier_withAppletIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __75__SESSessionManager_resumeRangingForReaderIdentifier_withAppletIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (id)getVehicleReports:(id *)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t v26[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  SESDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20A048000, v4, OS_LOG_TYPE_INFO, "getVehicleReports", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v21 = buf;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__8;
  v24 = __Block_byref_object_dispose__8;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__8;
  v18 = __Block_byref_object_dispose__8;
  v19 = 0;
  +[SESSessionManager sharedInstance](SESSessionManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __39__SESSessionManager_getVehicleReports___block_invoke;
  v13[3] = &unk_24C2BCCB0;
  v13[4] = buf;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __39__SESSessionManager_getVehicleReports___block_invoke_2;
  v12[3] = &unk_24C2BD3C0;
  v12[4] = &v14;
  v12[5] = buf;
  objc_msgSend(v7, "getVehicleReports:", v12);

  if (*((_QWORD *)v21 + 5))
  {
    SESDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *((_QWORD *)v21 + 5);
      *(_DWORD *)v26 = 138412290;
      v27 = v9;
      _os_log_impl(&dword_20A048000, v8, OS_LOG_TYPE_ERROR, "%@", v26, 0xCu);
    }

  }
  if (a3)
    *a3 = objc_retainAutorelease(*((id *)v21 + 5));
  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(buf, 8);
  return v10;
}

void __39__SESSessionManager_getVehicleReports___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __39__SESSessionManager_getVehicleReports___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)startDCKAssertionForKeyIdentifier:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  SESDCKAssertion *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  SESDCKAssertion *v16;
  SESDCKAssertion *v17;
  SESDCKAssertion *v18;
  _QWORD v20[4];
  SESDCKAssertion *v21;
  _BYTE *v22;
  _QWORD v23[5];
  _BYTE buf[24];
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  SESDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_20A048000, v10, OS_LOG_TYPE_INFO, "startDCKAssertionForKeyIdentifier %@ options %@", buf, 0x16u);
  }

  v11 = -[SESDCKAssertion initWithKeyIdentifier:]([SESDCKAssertion alloc], "initWithKeyIdentifier:", v8);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v25 = __Block_byref_object_copy__8;
  v26 = __Block_byref_object_dispose__8;
  v12 = MEMORY[0x24BDAC760];
  v27 = 0;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __73__SESSessionManager_startDCKAssertionForKeyIdentifier_withOptions_error___block_invoke;
  v23[3] = &unk_24C2BCCB0;
  v23[4] = buf;
  -[SESSessionManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SESDCKAssertion keyIdentifier](v11, "keyIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SESDCKAssertion appletIdentifier](v11, "appletIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __73__SESSessionManager_startDCKAssertionForKeyIdentifier_withOptions_error___block_invoke_367;
  v20[3] = &unk_24C2BD3E8;
  v22 = buf;
  v16 = v11;
  v21 = v16;
  objc_msgSend(v13, "startSESAssertion:withKeyIdentifier:withAppletIdentifier:withOptions:completion:", v16, v14, v15, v9, v20);

  if (a5)
    *a5 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    v17 = 0;
  else
    v17 = v16;
  v18 = v17;

  _Block_object_dispose(buf, 8);
  return v18;
}

void __73__SESSessionManager_startDCKAssertionForKeyIdentifier_withOptions_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  if (v4)
  {
    SESDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_20A048000, v5, OS_LOG_TYPE_ERROR, "Failed to get proxy %@", (uint8_t *)&v6, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

void __73__SESSessionManager_startDCKAssertionForKeyIdentifier_withOptions_error___block_invoke_367(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  SESDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_20A048000, v8, OS_LOG_TYPE_ERROR, "Proxy error %@", (uint8_t *)&v10, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = *(void **)(a1 + 32);
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_20A048000, v8, OS_LOG_TYPE_INFO, "Started new SESDCKAssertion %@", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setProxy:", v5);
  }

}

+ (id)requestAssertionForKeyID:(id)a3 withAppletID:(id)a4 withOptions:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v16;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  +[SESSessionManager sharedInstance](SESSessionManager, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v12, "startAssertionForKeyIdentifier:withAppletIdentifier:withOptions:error:", v11, v10, v9, &v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v16;
  if (a6)
    *a6 = objc_retainAutorelease(v14);

  return v13;
}

- (id)startAssertionForKeyIdentifier:(id)a3 withAppletIdentifier:(id)a4 withOptions:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  NSObject *v13;
  SESAssertion *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  SESAssertion *v19;
  SESAssertion *v20;
  SESAssertion *v21;
  _QWORD v23[4];
  SESAssertion *v24;
  _BYTE *v25;
  _QWORD v26[5];
  _BYTE buf[24];
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (uint64_t (*)(uint64_t, uint64_t))a5;
  SESDefaultLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v28 = v12;
    _os_log_impl(&dword_20A048000, v13, OS_LOG_TYPE_INFO, "startAssertionForKeyIdentifier %@ appletIdentifier %@ options %@", buf, 0x20u);
  }

  v14 = -[SESAssertion initWithKeyIdentifier:appletIdentifier:]([SESAssertion alloc], "initWithKeyIdentifier:appletIdentifier:", v10, v11);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v28 = __Block_byref_object_copy__8;
  v29 = __Block_byref_object_dispose__8;
  v15 = MEMORY[0x24BDAC760];
  v30 = 0;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __91__SESSessionManager_startAssertionForKeyIdentifier_withAppletIdentifier_withOptions_error___block_invoke;
  v26[3] = &unk_24C2BCCB0;
  v26[4] = buf;
  -[SESSessionManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SESAssertion keyIdentifier](v14, "keyIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SESAssertion appletIdentifier](v14, "appletIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __91__SESSessionManager_startAssertionForKeyIdentifier_withAppletIdentifier_withOptions_error___block_invoke_370;
  v23[3] = &unk_24C2BD3E8;
  v25 = buf;
  v19 = v14;
  v24 = v19;
  objc_msgSend(v16, "startSESAssertion:withKeyIdentifier:withAppletIdentifier:withOptions:completion:", v19, v17, v18, v12, v23);

  if (a6)
    *a6 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    v20 = 0;
  else
    v20 = v19;
  v21 = v20;

  _Block_object_dispose(buf, 8);
  return v21;
}

void __91__SESSessionManager_startAssertionForKeyIdentifier_withAppletIdentifier_withOptions_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  if (v4)
  {
    SESDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_20A048000, v5, OS_LOG_TYPE_ERROR, "Failed to get proxy %@", (uint8_t *)&v6, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

void __91__SESSessionManager_startAssertionForKeyIdentifier_withAppletIdentifier_withOptions_error___block_invoke_370(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  SESDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_20A048000, v8, OS_LOG_TYPE_ERROR, "Proxy error %@", (uint8_t *)&v10, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = *(void **)(a1 + 32);
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_20A048000, v8, OS_LOG_TYPE_INFO, "Started new SESAssertion %@", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setProxy:", v5);
  }

}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  void (**v4)(id, void *);
  SESSessionManager *v5;
  NSXPCConnection *connection;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void (**)(id, void *))a3;
  v5 = self;
  objc_sync_enter(v5);
  -[SESSessionManager connect](v5, "connect");
  connection = v5->_connection;
  if (connection)
  {
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SESDefaultLogObject();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v9);

    v7 = 0;
  }
  objc_sync_exit(v5);

  return v7;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  void (**v4)(id, void *);
  SESSessionManager *v5;
  NSXPCConnection *connection;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void (**)(id, void *))a3;
  v5 = self;
  objc_sync_enter(v5);
  -[SESSessionManager connect](v5, "connect");
  connection = v5->_connection;
  if (connection)
  {
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SESDefaultLogObject();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v9);

    v7 = 0;
  }
  objc_sync_exit(v5);

  return v7;
}

+ (void)setMachServiceName:(id)a3
{
  id v3;
  void *v4;
  _QWORD *v5;

  v3 = a3;
  +[SESSessionManager sharedInstance](SESSessionManager, "sharedInstance");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)v5[3];
  v5[3] = v3;

}

- (NSMutableSet)sessions
{
  return (NSMutableSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSessions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
}

@end
