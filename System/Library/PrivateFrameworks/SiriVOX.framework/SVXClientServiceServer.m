@implementation SVXClientServiceServer

- (void)dealloc
{
  objc_super v3;

  -[SVXClientServiceServer _removeAllConnections](self, "_removeAllConnections");
  v3.receiver = self;
  v3.super_class = (Class)SVXClientServiceServer;
  -[SVXClientServiceServer dealloc](&v3, sel_dealloc);
}

- (void)addConnection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SVXClientServiceServer addConnection:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s connection = %@", buf, 0x16u);
  }
  -[SVXModule performer](self->_module, "performer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__SVXClientServiceServer_addConnection___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "performBlock:", v8);

}

- (void)removeConnection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SVXClientServiceServer removeConnection:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s connection = %@", buf, 0x16u);
  }
  -[SVXModule performer](self->_module, "performer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__SVXClientServiceServer_removeConnection___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "performBlock:", v8);

}

- (SVXClientServiceServer)initWithModule:(id)a3
{
  id v5;
  SVXClientServiceServer *v6;
  SVXClientServiceServer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVXClientServiceServer;
  v6 = -[SVXClientServiceServer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_module, a3);

  return v7;
}

- (void)startWithModuleInstanceProvider:(id)a3 platformDependencies:(id)a4
{
  id v5;
  NSObject *v6;
  SVXSessionManager *v7;
  SVXSessionManager *sessionManager;
  SVXSpeechSynthesizer *v9;
  SVXSpeechSynthesizer *speechSynthesizer;
  SVXDeviceSetupManager *v11;
  SVXDeviceSetupManager *deviceSetupManager;
  SVXSynthesisManager *v13;
  SVXSynthesisManager *synthesisManager;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v15 = 136315138;
    v16 = "-[SVXClientServiceServer startWithModuleInstanceProvider:platformDependencies:]";
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v15, 0xCu);
  }
  -[SVXClientServiceServer _removeAllConnections](self, "_removeAllConnections");
  objc_msgSend(v5, "sessionManager");
  v7 = (SVXSessionManager *)objc_claimAutoreleasedReturnValue();
  sessionManager = self->_sessionManager;
  self->_sessionManager = v7;

  objc_msgSend(v5, "speechSynthesizer");
  v9 = (SVXSpeechSynthesizer *)objc_claimAutoreleasedReturnValue();
  speechSynthesizer = self->_speechSynthesizer;
  self->_speechSynthesizer = v9;

  objc_msgSend(v5, "deviceSetupManager");
  v11 = (SVXDeviceSetupManager *)objc_claimAutoreleasedReturnValue();
  deviceSetupManager = self->_deviceSetupManager;
  self->_deviceSetupManager = v11;

  objc_msgSend(v5, "synthesisManager");
  v13 = (SVXSynthesisManager *)objc_claimAutoreleasedReturnValue();
  synthesisManager = self->_synthesisManager;
  self->_synthesisManager = v13;

}

- (void)stopWithModuleInstanceProvider:(id)a3
{
  NSObject *v4;
  SVXSpeechSynthesizer *speechSynthesizer;
  SVXSessionManager *sessionManager;
  SVXDeviceSetupManager *deviceSetupManager;
  SVXSynthesisManager *synthesisManager;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v9 = 136315138;
    v10 = "-[SVXClientServiceServer stopWithModuleInstanceProvider:]";
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }
  -[SVXClientServiceServer _removeAllConnections](self, "_removeAllConnections");
  speechSynthesizer = self->_speechSynthesizer;
  self->_speechSynthesizer = 0;

  sessionManager = self->_sessionManager;
  self->_sessionManager = 0;

  deviceSetupManager = self->_deviceSetupManager;
  self->_deviceSetupManager = 0;

  synthesisManager = self->_synthesisManager;
  self->_synthesisManager = 0;

}

- (void)_addConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSMutableDictionary *connectionsByUUID;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_connectionsByUUID, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
    {
      v11 = 136315394;
      v12 = "-[SVXClientServiceServer _addConnection:]";
      v13 = 2112;
      v14 = v4;
      _os_log_debug_impl(&dword_214934000, v7, OS_LOG_TYPE_DEBUG, "%s connection = %@", (uint8_t *)&v11, 0x16u);
    }
    connectionsByUUID = self->_connectionsByUUID;
    if (!connectionsByUUID)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v10 = self->_connectionsByUUID;
      self->_connectionsByUUID = v9;

      connectionsByUUID = self->_connectionsByUUID;
    }
    -[NSMutableDictionary setObject:forKey:](connectionsByUUID, "setObject:forKey:", v4, v5);
    objc_msgSend(v4, "configureWithDeviceSetupManager:sessionManager:speechSynthesizer:synthesisManager:", self->_deviceSetupManager, self->_sessionManager, self->_speechSynthesizer, self->_synthesisManager);
  }

}

- (void)_removeConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_connectionsByUUID, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
    {
      v8 = 136315394;
      v9 = "-[SVXClientServiceServer _removeConnection:]";
      v10 = 2112;
      v11 = v4;
      _os_log_debug_impl(&dword_214934000, v7, OS_LOG_TYPE_DEBUG, "%s connection = %@", (uint8_t *)&v8, 0x16u);
    }
    -[NSMutableDictionary removeObjectForKey:](self->_connectionsByUUID, "removeObjectForKey:", v5);
    objc_msgSend(v4, "invalidate");
  }

}

- (void)_removeAllConnections
{
  NSMutableDictionary *connectionsByUUID;
  NSMutableDictionary *v3;

  connectionsByUUID = self->_connectionsByUUID;
  self->_connectionsByUUID = 0;
  v3 = connectionsByUUID;

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_5023);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synthesisManager, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_deviceSetupManager, 0);
  objc_storeStrong((id *)&self->_connectionsByUUID, 0);
  objc_storeStrong((id *)&self->_module, 0);
}

void __47__SVXClientServiceServer__removeAllConnections__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315394;
    v6 = "-[SVXClientServiceServer _removeAllConnections]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_debug_impl(&dword_214934000, v4, OS_LOG_TYPE_DEBUG, "%s connection = %@", (uint8_t *)&v5, 0x16u);
  }
  objc_msgSend(v3, "invalidate");

}

uint64_t __43__SVXClientServiceServer_removeConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeConnection:", *(_QWORD *)(a1 + 40));
}

uint64_t __40__SVXClientServiceServer_addConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addConnection:", *(_QWORD *)(a1 + 40));
}

@end
