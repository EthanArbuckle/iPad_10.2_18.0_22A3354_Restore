@implementation SymptomLinkAdvisoryConnectionManager

- (SymptomLinkAdvisoryConnectionManager)init
{
  SymptomLinkAdvisoryConnectionManager *v2;
  SymptomLinkAdvisoryConnectionManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SymptomLinkAdvisoryConnectionManager;
  v2 = -[SymptomLinkAdvisoryConnectionManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SymptomLinkAdvisoryConnectionManager _setupXPCConnection](v2, "_setupXPCConnection");
  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_pred != -1)
    dispatch_once(&sharedInstance_pred, &__block_literal_global_0);
  return (id)sharedInstance_sharedInstance;
}

void __54__SymptomLinkAdvisoryConnectionManager_sharedInstance__block_invoke()
{
  SymptomLinkAdvisoryConnectionManager *v0;
  void *v1;

  v0 = objc_alloc_init(SymptomLinkAdvisoryConnectionManager);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (void)dealloc
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  objc_super v5;

  connection = self->_connection;
  if (connection)
  {
    -[NSXPCConnection setInvalidationHandler:](connection, "setInvalidationHandler:", 0);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", 0);
    -[NSXPCConnection invalidate](self->_connection, "invalidate");
    v4 = self->_connection;
    self->_connection = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)SymptomLinkAdvisoryConnectionManager;
  -[SymptomLinkAdvisoryConnectionManager dealloc](&v5, sel_dealloc);
}

- (void)_setupXPCConnection
{
  NSObject *v3;
  NSXPCConnection *v4;
  NSXPCConnection *connection;
  NSObject *v6;
  NSXPCConnection *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;
  uint8_t buf[4];
  NSXPCConnection *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!self->_connection)
  {
    connManagerLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_247C47000, v3, OS_LOG_TYPE_DEFAULT, "ConnManager: Creating XPC connection for symptomsd<->terminusd communication", buf, 2u);
    }

    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.symptom_analytics"), 4096);
    connection = self->_connection;
    self->_connection = v4;

    if (self->_connection)
    {
      if (_setupXPCConnection_onceToken != -1)
        dispatch_once(&_setupXPCConnection_onceToken, &__block_literal_global_7);
      -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", _setupXPCConnection_remoteObjectInterface);
      -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", _setupXPCConnection_exportedInterface);
      -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
      objc_initWeak(&location, self);
      v9 = MEMORY[0x24BDAC760];
      v10 = 3221225472;
      v11 = __59__SymptomLinkAdvisoryConnectionManager__setupXPCConnection__block_invoke_2;
      v12 = &unk_251937648;
      objc_copyWeak(&v13, &location);
      -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", &v9);
      -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_111, v9, v10, v11, v12);
      -[NSXPCConnection resume](self->_connection, "resume");
      connManagerLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = self->_connection;
        *(_DWORD *)buf = 138477827;
        v16 = v7;
        _os_log_impl(&dword_247C47000, v6, OS_LOG_TYPE_DEFAULT, "ConnManager: started %{private}@", buf, 0xCu);
      }

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
    {
      connManagerLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_247C47000, v8, OS_LOG_TYPE_ERROR, "ConnManager: Error creating XPC connection, returning", buf, 2u);
      }

    }
  }
}

void __59__SymptomLinkAdvisoryConnectionManager__setupXPCConnection__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2576EF6C8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_setupXPCConnection_exportedInterface;
  _setupXPCConnection_exportedInterface = v0;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2576F0350);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_setupXPCConnection_remoteObjectInterface;
  _setupXPCConnection_remoteObjectInterface = v2;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, objc_opt_class(), 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_setupXPCConnection_exportedInterface, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel__handleALUMessageFromSymptomsd_, 0, 0);

}

void __59__SymptomLinkAdvisoryConnectionManager__setupXPCConnection__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject **WeakRetained;
  NSObject **v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  NSObject *v8;
  os_log_type_t v9;
  __int16 v10;
  uint8_t v11[2];
  uint8_t buf[16];

  connManagerLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_247C47000, v2, OS_LOG_TYPE_DEFAULT, "ConnManager: symptomsd<->terminusd XPC connection invalidated", buf, 2u);
  }

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (!WeakRetained)
  {
    connManagerLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v10 = 0;
    v6 = "ConnManager: instance has gone away, returning";
    v7 = (uint8_t *)&v10;
    v8 = v5;
    v9 = OS_LOG_TYPE_ERROR;
LABEL_10:
    _os_log_impl(&dword_247C47000, v8, v9, v6, v7, 2u);
    goto LABEL_11;
  }
  v5 = WeakRetained[1];
  if (!v5)
  {
    connManagerLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    *(_WORD *)v11 = 0;
    v6 = "ConnManager: connection is already nil";
    v7 = v11;
    v8 = v5;
    v9 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_10;
  }
  WeakRetained[1] = 0;
LABEL_11:

}

void __59__SymptomLinkAdvisoryConnectionManager__setupXPCConnection__block_invoke_110()
{
  NSObject *v0;
  uint8_t v1[16];

  connManagerLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_247C47000, v0, OS_LOG_TYPE_DEFAULT, "ConnManager: symptomsd<->terminusd XPC connection interrupted", v1, 2u);
  }

}

- (void)_handleALUMessageFromSymptomsd:(id)a3
{
  ALUManager *aluManager;

  aluManager = self->_aluManager;
  if (aluManager)
    -[ALUManager _handleALUMessageFromSymptomsd:](aluManager, "_handleALUMessageFromSymptomsd:", a3);
}

- (void)_handleNWActivityFragmentMessageFromSymptomsd
{
  SymptomLinkAdvisoryNWActivityReporter *nwActivityReporter;

  nwActivityReporter = self->_nwActivityReporter;
  if (nwActivityReporter)
    -[SymptomLinkAdvisoryNWActivityReporter _handleNWActivityFragmentMessageFromSymptomsd](nwActivityReporter, "_handleNWActivityFragmentMessageFromSymptomsd");
}

- (ALUManager)aluManager
{
  return (ALUManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAluManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (SymptomLinkAdvisoryNWActivityReporter)nwActivityReporter
{
  return (SymptomLinkAdvisoryNWActivityReporter *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNwActivityReporter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nwActivityReporter, 0);
  objc_storeStrong((id *)&self->_aluManager, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
