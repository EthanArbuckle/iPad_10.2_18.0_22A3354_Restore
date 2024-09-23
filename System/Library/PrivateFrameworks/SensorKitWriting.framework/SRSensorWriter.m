@implementation SRSensorWriter

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    SRLogWriter = (uint64_t)os_log_create("com.apple.SensorKit", "Writer");
}

+ (id)clientInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25751B730);
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v3, "setWithObjects:", v4, v5, v6, objc_opt_class(), 0), sel_resetDatastoreFiles_, 0, 0);
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0), sel_setMonitoring_withRequestedConfigurations_, 1, 0);
  return v2;
}

+ (id)remoteInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25751ECC8);
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, objc_opt_class(), 0), sel_requestFileHandleForWritingWithReply_, 0, 1);
  return v2;
}

+ (id)connectionToDaemon
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.SensorKit.writer"), 4096);
}

- (SRSensorWriter)init
{

  return 0;
}

- (SRSensorWriter)initWithIdentifier:(id)a3
{
  uint64_t v5;
  SRSensorWriter *v6;
  SRSensorWriter *v7;

  if (objc_msgSend(a3, "length"))
  {
    v5 = objc_msgSend((id)objc_opt_class(), "connectionToDaemon");
    v6 = (SRSensorWriter *)-[SRDaemonNotification initWithSensor:]([SRDaemonNotification alloc], a3);
    v7 = -[SRSensorWriter initWithIdentifier:xpcConnection:daemonNotification:authStore:tccStore:](self, "initWithIdentifier:xpcConnection:daemonNotification:authStore:tccStore:", a3, v5, v6, 0, 0);
    self = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (SRSensorWriter)initWithIdentifier:(id)a3 xpcConnection:(id)a4 daemonNotification:(id)a5 authStore:(id)a6 tccStore:(id)a7
{
  SRSensorWriter *v12;
  id *v13;
  id v14;
  NSObject *v15;
  double v16;
  NSString *v17;
  SRTCCStorePassThrough *v18;
  SRAuthorizationStore *v19;
  objc_super v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)SRSensorWriter;
  v12 = -[SRSensorWriter init](&v21, sel_init);
  if (v12)
  {
    if (objc_msgSend(a3, "length"))
    {
      -[SRSensorWriter setSensorIdentifier:](v12, "setSensorIdentifier:", a3);
      v12->_monitoring = 0;
      v12->_connection = (NSXPCConnection *)a4;
      -[SRSensorWriter setupConnection](v12, "setupConnection");
      v13 = (id *)a5;
      v12->_daemonNotification = (SRDaemonNotification *)v13;
      if (v13)
        objc_storeWeak(v13 + 3, v12);
      v12->_eligibilityCache = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
      v14 = +[SRSensorDescription sensorDescriptionForSensor:](SRSensorDescription, "sensorDescriptionForSensor:", v12->_sensorIdentifier);
      if (!v14)
      {
        v15 = SRLogWriter;
        if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543362;
          v23 = a3;
          _os_log_fault_impl(&dword_245CD7000, v15, OS_LOG_TYPE_FAULT, "Failed to find a sensor description for service: %{public}@", buf, 0xCu);
        }
      }
      objc_msgSend(v14, "roundingInterval");
      v12->_roundingInterval = v16;
      v17 = (NSString *)(id)objc_msgSend(v14, "writerAuthorizationService");
      v12->_writerAuthorizationService = v17;
      if (v17)
      {
        if (a7)
          v18 = (SRTCCStorePassThrough *)a7;
        else
          v18 = objc_alloc_init(SRTCCStorePassThrough);
        v12->_tccStore = (SRTCCStore *)v18;
        v12->_writerAuthorizationUpdateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SensorKit.writerAuthorizationUpdate", 0);
        -[SRSensorWriter startUpdatingAuthorizations](v12, "startUpdatingAuthorizations");
        -[SRAuthorizationClient addListener:forBundleId:](+[SRAuthorizationClient sharedInstance](SRAuthorizationClient, "sharedInstance"), "addListener:forBundleId:", v12, CFSTR("com.apple.private.SensorKit._compositeBundle"));
      }
      else
      {
        if (a6)
          v19 = (SRAuthorizationStore *)a6;
        else
          v19 = (SRAuthorizationStore *)-[SRSensorWriter chooseAuthStore](v12, "chooseAuthStore");
        v12->_authStore = v19;
        -[SRSensorWriter set_writerAuthorizationStatus:](v12, "set_writerAuthorizationStatus:", 1);
        -[SRAuthorizationStore addReaderAuthorizationDelegate:](-[SRSensorWriter authStore](v12, "authStore"), "addReaderAuthorizationDelegate:", v12);
      }
    }
    else
    {

      return 0;
    }
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  self->_daemonNotification = 0;
  -[NSXPCConnection invalidate](self->_connection, "invalidate");

  self->_connection = 0;
  self->_authStore = 0;
  -[SRSensorWriter setTccStore:](self, "setTccStore:", 0);

  self->_datastore = 0;
  -[SRSensorWriter setNextDatastoreFiles:](self, "setNextDatastoreFiles:", 0);

  self->_sensorIdentifier = 0;
  self->_defaults = 0;

  self->__requestedConfigurations = 0;
  notify_cancel(self->_notifyToken);
  -[SRSensorWriter setWriterAuthorizationUpdateQueue:](self, "setWriterAuthorizationUpdateQueue:", 0);

  self->_writerAuthorizationService = 0;
  -[SRSensorWriter setLastMetadata:](self, "setLastMetadata:", 0);
  -[SRSensorWriter setLastConfiguration:](self, "setLastConfiguration:", 0);

  v3.receiver = self;
  v3.super_class = (Class)SRSensorWriter;
  -[SRSensorWriter dealloc](&v3, sel_dealloc);
}

- (id)chooseAuthStore
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  SRAuthorizationStore *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(+[SRSensorDescription sensorDescriptionForSensor:](SRSensorDescription, "sensorDescriptionForSensor:", self->_sensorIdentifier), "authorizationStoreCohort");
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithObjects:", self->_sensorIdentifier, 0);
    v6 = (void *)MEMORY[0x2495465E0]();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = (_QWORD *)+[SRSensorsCache defaultCache]();
    v8 = -[SRSensorsCache allSensorDescriptions](v7);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
          v14 = (void *)MEMORY[0x2495465E0]();
          if (objc_msgSend(v4, "isEqualToString:", objc_msgSend(v13, "authorizationStoreCohort")))
            objc_msgSend(v5, "addObject:", objc_msgSend(v13, "name"));
          objc_autoreleasePoolPop(v14);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }
    objc_autoreleasePoolPop(v6);
    v15 = +[SRAuthorizationStore sharedAuthorizationStoreForSensors:](SRAuthorizationStore, "sharedAuthorizationStoreForSensors:", v5);

    return v15;
  }
  else
  {
    v17 = [SRAuthorizationStore alloc];
    return -[SRAuthorizationStore initWithSensors:](v17, "initWithSensors:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", self->_sensorIdentifier));
  }
}

- (void)daemonNotificationDaemonDidStart:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (-[SRSensorWriter connectionDidInvalidate](self, "connectionDidInvalidate", a3))
  {
    v4 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_245CD7000, v4, OS_LOG_TYPE_DEFAULT, "Daemon has restarted after being invalidated. Re-establishing connection", buf, 2u);
    }
    -[NSXPCConnection invalidate](-[SRSensorWriter connection](self, "connection"), "invalidate");
    -[SRSensorWriter setConnection:](self, "setConnection:", objc_msgSend((id)objc_opt_class(), "connectionToDaemon"));
    -[SRSensorWriter setupConnection](self, "setupConnection");
  }
  if (-[SRSensorWriter retryGetMonitoring](self, "retryGetMonitoring"))
  {
    v5 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_245CD7000, v5, OS_LOG_TYPE_INFO, "Trying to get monitoring flag after daemon restart", v6, 2u);
    }
    -[SRSensorWriter registerWithDaemonForWritingIfNeededWithReply:](self, "registerWithDaemonForWritingIfNeededWithReply:", &__block_literal_global);
  }
}

void __51__SRSensorWriter_daemonNotificationDaemonDidStart___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
    {
      v4 = 138543362;
      v5 = a2;
      _os_log_error_impl(&dword_245CD7000, v3, OS_LOG_TYPE_ERROR, "Failed to connect to daemon because %{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)daemonNotificationDaemonDidChangeTimeSignificantly:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v4 = SRLogWriter;
  if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_245CD7000, v4, OS_LOG_TYPE_DEFAULT, "Daemon has synced time. Requesting a new segment and time info", buf, 2u);
  }
  if (-[SRSensorWriter authorized](self, "authorized"))
  {
    -[SRSensorWriter requestNewSegment](self, "requestNewSegment");
  }
  else
  {
    v5 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_245CD7000, v5, OS_LOG_TYPE_DEFAULT, "Writer is not authorized so not asking for a new segment", v6, 2u);
    }
  }
}

- (void)daemonNotificationDaemonDidResetDatastore:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v4 = SRLogWriter;
  if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_245CD7000, v4, OS_LOG_TYPE_DEFAULT, "Daemon has reset our datastore. Requesting a new segment", buf, 2u);
  }
  if (-[SRSensorWriter authorized](self, "authorized"))
  {
    -[SRSensorWriter requestNewSegment](self, "requestNewSegment");
  }
  else
  {
    v5 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_245CD7000, v5, OS_LOG_TYPE_DEFAULT, "Writer is not authorized so not asking for a new segment", v6, 2u);
    }
  }
}

- (void)setupConnection
{
  NSXPCConnection *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = -[SRSensorWriter connection](self, "connection");
  -[NSXPCConnection setRemoteObjectInterface:](v3, "setRemoteObjectInterface:", objc_msgSend((id)objc_opt_class(), "remoteInterface"));
  -[NSXPCConnection setExportedObject:](v3, "setExportedObject:", +[SRSensorWriterClient sensorWriterClientWithWriter:](SRSensorWriterClient, "sensorWriterClientWithWriter:", self));
  -[NSXPCConnection setExportedInterface:](v3, "setExportedInterface:", objc_msgSend((id)objc_opt_class(), "clientInterface"));
  objc_initWeak(&location, self);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__SRSensorWriter_setupConnection__block_invoke;
  v7[3] = &unk_2516F1FE0;
  objc_copyWeak(&v8, &location);
  -[NSXPCConnection setInterruptionHandler:](v3, "setInterruptionHandler:", v7);
  -[SRSensorWriter setConnectionDidInterrupt:](self, "setConnectionDidInterrupt:", 0);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __33__SRSensorWriter_setupConnection__block_invoke_60;
  v5[3] = &unk_2516F1FE0;
  objc_copyWeak(&v6, &location);
  -[NSXPCConnection setInvalidationHandler:](v3, "setInvalidationHandler:", v5);
  -[SRSensorWriter setConnectionDidInvalidate:](self, "setConnectionDidInvalidate:", 0);
  -[NSXPCConnection resume](self->_connection, "resume");
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

uint64_t __33__SRSensorWriter_setupConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = SRLogWriter;
  if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_245CD7000, v2, OS_LOG_TYPE_DEFAULT, "Connection to daemon interrupted", v4, 2u);
  }
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "setConnectionDidInterrupt:", 1);
}

uint64_t __33__SRSensorWriter_setupConnection__block_invoke_60(uint64_t a1)
{
  NSObject *v2;
  id Weak;
  uint8_t v5[16];

  v2 = SRLogWriter;
  if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_245CD7000, v2, OS_LOG_TYPE_DEFAULT, "Connection to daemon invalidated", v5, 2u);
  }
  Weak = objc_loadWeak((id *)(a1 + 32));
  objc_msgSend(Weak, "setConnectionDidInvalidate:", 1);
  return objc_msgSend(Weak, "setMonitoring:", 0);
}

- (void)checkForMonitoring
{
  -[SRSensorWriter setRetryGetMonitoring:](self, "setRetryGetMonitoring:", 1);
  -[SRSensorWriter registerWithDaemonForWritingIfNeededWithReply:](self, "registerWithDaemonForWritingIfNeededWithReply:", &__block_literal_global_61);
}

void __36__SRSensorWriter_checkForMonitoring__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
    {
      v4 = 138543362;
      v5 = a2;
      _os_log_error_impl(&dword_245CD7000, v3, OS_LOG_TYPE_ERROR, "Failed to connect to daemon because %{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)registerWithDaemonForWritingIfNeededWithReply:(id)a3
{
  NSXPCConnection *v5;
  id v6;
  _QWORD v7[5];

  if (-[SRSensorWriter connectionDidInterrupt](self, "connectionDidInterrupt")
    || -[SRSensorWriter retryGetMonitoring](self, "retryGetMonitoring"))
  {
    v5 = -[SRSensorWriter connection](self, "connection");
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __64__SRSensorWriter_registerWithDaemonForWritingIfNeededWithReply___block_invoke;
    v7[3] = &unk_2516F2028;
    v7[4] = a3;
    v6 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v5, "remoteObjectProxyWithErrorHandler:", v7);
    objc_msgSend(v6, "startWritingForSensor:", self->_sensorIdentifier);
    if (v6)
    {
      -[SRSensorWriter setConnectionDidInterrupt:](self, "setConnectionDidInterrupt:", 0);
      (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
    }
  }
  else
  {
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  }
}

uint64_t __64__SRSensorWriter_registerWithDaemonForWritingIfNeededWithReply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = SRLogWriter;
  if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_245CD7000, v2, OS_LOG_TYPE_ERROR, "Failed to connect with daemon", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)daemonForcedResetDatastoreFiles:(id)a3
{
  NSObject *v5;
  NSString *sensorIdentifier;
  int v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a3, "objectForKeyedSubscript:", 0x2516F34D8))
  {
    -[SRSensorWriter resetDatastoreFiles:](self, "resetDatastoreFiles:", a3);
    if (objc_msgSend(a3, "count"))
    {
      if (-[NSArray count](-[SRSensorWriter _requestedConfigurations](self, "_requestedConfigurations"), "count"))
        -[SRSensorWriter didReceiveUpdateToConfigurationRequests](self, "didReceiveUpdateToConfigurationRequests");
    }
  }
  else
  {
    v5 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
    {
      sensorIdentifier = self->_sensorIdentifier;
      v7 = 138543362;
      v8 = sensorIdentifier;
      _os_log_impl(&dword_245CD7000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Daemon is resetting the writer datastore, asking for a new segment", (uint8_t *)&v7, 0xCu);
    }
    -[SRSensorWriter requestNewSegment](self, "requestNewSegment");
  }
}

- (SRDatastore)datastore
{
  NSDictionary *v3;
  NSDictionary *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  NSString *sensorIdentifier;
  SRDatastore *v11;
  NSObject *v12;
  NSDictionary *lastMetadata;
  NSObject *v14;
  NSDictionary *lastConfiguration;
  NSObject *v16;
  SRSensorWriterDelegate *v17;
  NSObject *v19;
  NSDictionary *v20;
  uint8_t buf[4];
  NSDictionary *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = -[SRSensorWriter nextDatastoreFiles](self, "nextDatastoreFiles");
  if (!v3)
    return self->_datastore;
  v4 = v3;
  -[SRSensorWriter setNextDatastoreFiles:](self, "setNextDatastoreFiles:", 0);
  -[SRSensorWriter flushDatabase](self, "flushDatabase");

  self->_datastore = 0;
  v5 = -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", 0x2516F34D8);
  v6 = -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", 0x2516F34F8);
  v7 = -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", 0x2516F3518);
  v8 = -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", 0x2516F3538);
  v9 = SRLogWriter;
  if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
  {
    sensorIdentifier = self->_sensorIdentifier;
    *(_DWORD *)buf = 138544386;
    v22 = (NSDictionary *)sensorIdentifier;
    v23 = 2114;
    v24 = v5;
    v25 = 2114;
    v26 = v6;
    v27 = 2114;
    v28 = v7;
    v29 = 2114;
    v30 = v8;
    _os_log_impl(&dword_245CD7000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Creating a new datastore with samples: %{public}@, metadata: %{public}@, configuration: %{public}@, defaults: %{public}@", buf, 0x34u);
  }
  if (-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", 0x2516F34D8))
  {

    self->_defaults = (SRDefaults *)-[SRDefaults initWithDictionary:]([SRDefaults alloc], v8);
    v11 = [SRDatastore alloc];
    if (v11)
      v11 = (SRDatastore *)-[SRDatastore initWithSampleFile:metadataFile:configurationFile:permission:defaults:](v11, v5, v6, v7, 1, (uint64_t)self->_defaults);
    self->_datastore = v11;
    if (v6)
    {
      v12 = SRLogWriter;
      if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_INFO))
      {
        lastMetadata = self->_lastMetadata;
        *(_DWORD *)buf = 138412290;
        v22 = lastMetadata;
        _os_log_impl(&dword_245CD7000, v12, OS_LOG_TYPE_INFO, "Carrying over previous metadata: %@", buf, 0xCu);
      }
      -[SRSensorWriter setMetadata:continuousTimestamp:datastore:](self, "setMetadata:continuousTimestamp:datastore:", -[SRSensorWriter lastMetadata](self, "lastMetadata"), -[SRSensorWriter lastMetadataContinuousTime](self, "lastMetadataContinuousTime"), self->_datastore);
    }
    if (v7)
    {
      v14 = SRLogWriter;
      if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_INFO))
      {
        lastConfiguration = self->_lastConfiguration;
        *(_DWORD *)buf = 138412290;
        v22 = lastConfiguration;
        _os_log_impl(&dword_245CD7000, v14, OS_LOG_TYPE_INFO, "Carrying over previous configuration: %@", buf, 0xCu);
      }
      v20 = 0;
      if (!-[SRSensorWriter _setSensorConfiguration:continuousTimestamp:error:](self, "_setSensorConfiguration:continuousTimestamp:error:", -[SRSensorWriter lastConfiguration](self, "lastConfiguration"), -[SRSensorWriter lastConfigurationContinuousTime](self, "lastConfigurationContinuousTime"), &v20))
      {
        v16 = SRLogWriter;
        if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v22 = v20;
          _os_log_error_impl(&dword_245CD7000, v16, OS_LOG_TYPE_ERROR, "Error carrying over previous configuration because %{public}@", buf, 0xCu);
        }
      }
    }
    v17 = -[SRSensorWriter delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[SRSensorWriterDelegate sensorWriterDidResetDatastore:](v17, "sensorWriterDidResetDatastore:", self);
    return self->_datastore;
  }
  v19 = SRLogWriter;
  if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_245CD7000, v19, OS_LOG_TYPE_DEBUG, "No sample file received so clearing the datastore", buf, 2u);
  }
  return 0;
}

- (void)provideSample:(id)a3
{
  -[SRSensorWriter provideSample:error:](self, "provideSample:error:", a3, 0);
}

- (BOOL)provideSample:(id)a3 error:(id *)a4
{
  uint64_t v7;

  v7 = mach_continuous_time();
  return -[SRSensorWriter provideSample:timestamp:error:](self, "provideSample:timestamp:error:", a3, a4, SRAbsoluteTimeFromContinuousTime(v7));
}

- (void)provideSample:(id)a3 timestamp:(double)a4
{
  -[SRSensorWriter provideSample:timestamp:error:](self, "provideSample:timestamp:error:", a3, 0, a4);
}

- (BOOL)provideSample:(id)a3 continuousTimestamp:(unint64_t)a4 error:(id *)a5
{
  return -[SRSensorWriter provideSample:timestamp:error:](self, "provideSample:timestamp:error:", a3, a5, SRAbsoluteTimeFromContinuousTime(a4));
}

- (BOOL)provideSample:(id)a3 timestamp:(double)a4 error:(id *)a5
{
  return -[SRSensorWriter provideSampleData:timestamp:error:](self, "provideSampleData:timestamp:error:", objc_msgSend(a3, "binarySampleRepresentation"), a5, a4);
}

- (void)provideSampleData:(id)a3
{
  -[SRSensorWriter provideSampleData:error:](self, "provideSampleData:error:", a3, 0);
}

- (BOOL)provideSampleData:(id)a3 error:(id *)a4
{
  uint64_t v7;

  v7 = mach_continuous_time();
  return -[SRSensorWriter provideSampleData:timestamp:error:](self, "provideSampleData:timestamp:error:", a3, a4, SRAbsoluteTimeFromContinuousTime(v7));
}

- (void)provideSampleData:(id)a3 continuousTimestamp:(unint64_t)a4
{
  -[SRSensorWriter provideSampleData:continuousTimestamp:error:](self, "provideSampleData:continuousTimestamp:error:", a3, a4, 0);
}

- (BOOL)provideSampleData:(id)a3 continuousTimestamp:(unint64_t)a4 error:(id *)a5
{
  return -[SRSensorWriter provideSampleData:timestamp:error:](self, "provideSampleData:timestamp:error:", a3, a5, SRAbsoluteTimeFromContinuousTime(a4));
}

- (void)provideSampleData:(id)a3 timestamp:(double)a4
{
  -[SRSensorWriter provideSampleData:timestamp:error:](self, "provideSampleData:timestamp:error:", a3, 0, a4);
}

- (BOOL)provideSampleData:(id)a3 timestamp:(double)a4 error:(id *)a5
{
  return -[SRSensorWriter provideSampleBytes:length:timestamp:error:](self, "provideSampleBytes:length:timestamp:error:", objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), a5, a4);
}

- (void)provideSampleBytes:(const void *)a3 length:(unint64_t)a4
{
  -[SRSensorWriter provideSampleBytes:length:error:](self, "provideSampleBytes:length:error:", a3, a4, 0);
}

- (BOOL)provideSampleBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  uint64_t v9;

  v9 = mach_continuous_time();
  return -[SRSensorWriter provideSampleBytes:length:timestamp:error:](self, "provideSampleBytes:length:timestamp:error:", a3, a4, a5, SRAbsoluteTimeFromContinuousTime(v9));
}

- (void)provideSampleBytes:(const void *)a3 length:(unint64_t)a4 continuousTimestamp:(unint64_t)a5
{
  -[SRSensorWriter provideSampleBytes:length:continuousTimestamp:error:](self, "provideSampleBytes:length:continuousTimestamp:error:", a3, a4, a5, 0);
}

- (BOOL)provideSampleBytes:(const void *)a3 length:(unint64_t)a4 continuousTimestamp:(unint64_t)a5 error:(id *)a6
{
  return -[SRSensorWriter provideSampleBytes:length:timestamp:error:](self, "provideSampleBytes:length:timestamp:error:", a3, a4, a6, SRAbsoluteTimeFromContinuousTime(a5));
}

- (void)provideSampleBytes:(const void *)a3 length:(unint64_t)a4 timestamp:(double)a5
{
  -[SRSensorWriter provideSampleBytes:length:timestamp:error:](self, "provideSampleBytes:length:timestamp:error:", a3, a4, 0, a5);
}

- (BOOL)provideSampleBytes:(const void *)a3 length:(unint64_t)a4 timestamp:(double)a5 error:(id *)a6
{
  SRError **v10;
  SRDatastore *v11;
  const char *v12;
  SRDatastore *v13;
  id Property;
  double v15;
  double v16;
  const char *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  SRError *v23;
  BOOL result;
  NSObject *v25;
  _BOOL4 v26;
  const char *v27;
  uint8_t *v28;
  _BOOL4 v29;
  uint64_t v30;
  SRDefaults *defaults;
  __int16 v32;
  __int16 v33;
  uint64_t v34;

  v34 = 0;
  if (a6)
    v10 = (SRError **)a6;
  else
    v10 = (SRError **)&v34;
  if (!-[SRSensorWriter authorized](self, "authorized"))
  {
    v22 = 12289;
LABEL_22:
    v23 = +[SRError errorWithCode:](SRError, "errorWithCode:", v22);
    result = 0;
    *v10 = v23;
    return result;
  }
  if (!-[SRSensorWriter isMonitoring](self, "isMonitoring"))
  {
    v22 = 12288;
    goto LABEL_22;
  }
  if (-[SRSensorWriter _writerAuthorizationStatus](self, "_writerAuthorizationStatus") != 1)
  {
    v22 = 12295;
    goto LABEL_22;
  }
  if (!a3)
  {
    *v10 = +[SRError errorWithCode:](SRError, "errorWithCode:", 12290);
    v25 = SRLogWriter;
    v26 = os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v26)
      return result;
    v33 = 0;
    v27 = "Trying to write null sample";
    v28 = (uint8_t *)&v33;
LABEL_28:
    _os_log_impl(&dword_245CD7000, v25, OS_LOG_TYPE_DEFAULT, v27, v28, 2u);
    return 0;
  }
  if (!a4)
  {
    *v10 = +[SRError errorWithCode:](SRError, "errorWithCode:", 12290);
    v25 = SRLogWriter;
    v29 = os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v29)
      return result;
    v32 = 0;
    v27 = "Trying to write a sample of 0 bytes";
    v28 = (uint8_t *)&v32;
    goto LABEL_28;
  }
  v11 = -[SRSensorWriter datastore](self, "datastore");
  v13 = v11;
  if (self->_roundingInterval > 0.0)
  {
    if (!v11)
    {
      if (-[SRDatastore writeSampleBytes:length:timestamp:error:](0, (const char *)a3, a4, v10, 0.000000999999997))
        goto LABEL_39;
LABEL_40:
      v22 = 12294;
      goto LABEL_22;
    }
    Property = objc_getProperty(v11, v12, 40, 1);
    if (Property)
    {
      v15 = *((double *)Property + 6);
      objc_msgSend(*((id *)Property + 5), "doubleValue");
      a5 = fmax(v15, v16) + 0.000000999999997;
    }
    else
    {
      a5 = 0.000000999999997;
    }
  }
  if (!-[SRDatastore writeSampleBytes:length:timestamp:error:]((_BOOL8)v13, (const char *)a3, a4, v10, a5))
  {
    if (v13)
      return 0;
    goto LABEL_40;
  }
  if (v13)
  {
    v18 = objc_getProperty(v13, v17, 40, 1);
    if (v18)
    {
      v19 = v18[3];
      if (v19 && (v20 = *(_QWORD *)(v19 + 16)) != 0)
      {
        v21 = *(_QWORD *)(v20 + 4);
      }
      else
      {
        v30 = v18[2];
        if (v30)
          v21 = *(_QWORD *)(v30 + 24) - *(_QWORD *)(v30 + 16) + 56;
        else
          v21 = 56;
      }
      goto LABEL_33;
    }
  }
LABEL_39:
  v21 = 0;
LABEL_33:
  defaults = self->_defaults;
  if (defaults)
    defaults = (SRDefaults *)defaults->_segmentSize;
  if (v21 > (unint64_t)defaults)
    -[SRSensorWriter requestNewSegment](self, "requestNewSegment");
  return 1;
}

- (void)requestNewSegment
{
  NSObject *v3;
  NSString *sensorIdentifier;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (-[SRSensorWriter requestNewSegmentInFlight](self, "requestNewSegmentInFlight"))
  {
    v3 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_INFO))
    {
      sensorIdentifier = self->_sensorIdentifier;
      *(_DWORD *)buf = 138543362;
      v8 = sensorIdentifier;
      _os_log_impl(&dword_245CD7000, v3, OS_LOG_TYPE_INFO, "[%{public}@] Request for a new segment is already inflight", buf, 0xCu);
    }
  }
  else
  {
    -[SRSensorWriter setRequestNewSegmentInFlight:](self, "setRequestNewSegmentInFlight:", 1);
    objc_initWeak((id *)buf, self);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __35__SRSensorWriter_requestNewSegment__block_invoke;
    v5[3] = &unk_2516F2050;
    objc_copyWeak(&v6, (id *)buf);
    -[SRSensorWriter registerWithDaemonForWritingIfNeededWithReply:](self, "registerWithDaemonForWritingIfNeededWithReply:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak((id *)buf);
  }
}

void __35__SRSensorWriter_requestNewSegment__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  id *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = a2;
      _os_log_error_impl(&dword_245CD7000, v3, OS_LOG_TYPE_ERROR, "Error registering with daemon because %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v4 = (id *)(a1 + 32);
    v5 = (void *)objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "connection");
    v6 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __35__SRSensorWriter_requestNewSegment__block_invoke_67;
    v10[3] = &unk_2516F2050;
    objc_copyWeak(&v11, v4);
    v7 = (void *)objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v10);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __35__SRSensorWriter_requestNewSegment__block_invoke_68;
    v8[3] = &unk_2516F2078;
    objc_copyWeak(&v9, v4);
    objc_msgSend(v7, "requestFileHandleForWritingWithReply:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
  }
}

uint64_t __35__SRSensorWriter_requestNewSegment__block_invoke_67(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = SRLogWriter;
  if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = a2;
    _os_log_error_impl(&dword_245CD7000, v4, OS_LOG_TYPE_ERROR, "Unable to get proxy object to request a new segment because %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "setRequestNewSegmentInFlight:", 0);
}

uint64_t __35__SRSensorWriter_requestNewSegment__block_invoke_68(uint64_t a1, void *a2)
{
  id Weak;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t result;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  Weak = objc_loadWeak((id *)(a1 + 32));
  objc_msgSend(Weak, "setRequestNewSegmentInFlight:", 0);
  v4 = objc_msgSend(a2, "objectForKeyedSubscript:", 0x2516F3558);
  if (v4)
  {
    v5 = v4;
    v6 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = v5;
      _os_log_error_impl(&dword_245CD7000, v6, OS_LOG_TYPE_ERROR, "Error requesting new segment %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  objc_msgSend(Weak, "resetDatastoreFiles:", a2);
  result = objc_msgSend(a2, "count");
  if (result)
  {
    result = objc_msgSend((id)objc_msgSend(Weak, "_requestedConfigurations"), "count");
    if (result)
      return objc_msgSend(Weak, "didReceiveUpdateToConfigurationRequests");
  }
  return result;
}

- (void)setMetadata:(id)a3
{
  -[SRSensorWriter setMetadata:continuousTimestamp:](self, "setMetadata:continuousTimestamp:", a3, mach_continuous_time());
}

- (void)setMetadata:(id)a3 continuousTimestamp:(unint64_t)a4
{
  -[SRSensorWriter setMetadata:continuousTimestamp:datastore:](self, "setMetadata:continuousTimestamp:datastore:", a3, a4, -[SRSensorWriter datastore](self, "datastore"));
}

- (void)setMetadata:(id)a3 continuousTimestamp:(unint64_t)a4 datastore:(id)a5
{
  void *v9;
  SRError *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  const void *v16;
  size_t v17;
  double v18;
  uint64_t v19;
  SRError *v20;
  uint8_t buf[4];
  SRError *v22;
  __int16 v23;
  SRError *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v20 = 0;
  v9 = (void *)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v20);
  v10 = v20;
  if (v20)
  {
    v11 = SRLogWriter;
    if (!os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 138543618;
    v22 = (SRError *)a3;
    v23 = 2114;
    v24 = v10;
    v12 = "Error trying to archive metadata %{public}@ %{public}@";
    v13 = v11;
    v14 = 22;
    goto LABEL_9;
  }
  v15 = v9;
  v16 = (const void *)objc_msgSend(v9, "bytes");
  v17 = objc_msgSend(v15, "length");
  v18 = SRAbsoluteTimeFromContinuousTime(a4);
  if (a5 && (writeMetadataBytesForFrameStore(*((_QWORD *)a5 + 6), v16, v17, &v20, v18) & 1) != 0)
  {
    -[SRSensorWriter setLastMetadata:](self, "setLastMetadata:", a3);
    -[SRSensorWriter setLastMetadataContinuousTime:](self, "setLastMetadataContinuousTime:", a4);
    return;
  }
  v19 = SRLogWriter;
  if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v20;
    v12 = "Failed to write metadata because %{public}@";
    v13 = v19;
    v14 = 12;
LABEL_9:
    _os_log_error_impl(&dword_245CD7000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
  }
}

- (BOOL)_setSensorConfiguration:(id)a3 error:(id *)a4
{
  return -[SRSensorWriter _setSensorConfiguration:continuousTimestamp:error:](self, "_setSensorConfiguration:continuousTimestamp:error:", a3, mach_continuous_time(), a4);
}

- (BOOL)_setSensorConfiguration:(id)a3 continuousTimestamp:(unint64_t)a4 error:(id *)a5
{
  SRError **v8;
  uint64_t v9;
  void *v10;
  SRDatastore *v11;
  const void *v12;
  size_t v13;
  double v14;
  int v15;
  uint64_t v16;
  SRError *v17;
  NSObject *v18;
  SRError *v19;
  uint64_t v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  SRError *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  if (a5)
    v8 = (SRError **)a5;
  else
    v8 = (SRError **)&v21;
  if (!-[SRSensorWriter authorized](self, "authorized"))
  {
    v16 = 12289;
LABEL_12:
    v17 = +[SRError errorWithCode:](SRError, "errorWithCode:", v16);
    LOBYTE(v15) = 0;
    *v8 = v17;
    return v15;
  }
  if (!-[SRSensorWriter isMonitoring](self, "isMonitoring"))
  {
    v16 = 12288;
    goto LABEL_12;
  }
  v9 = objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, v8);
  if (!v9)
  {
    v18 = SRLogWriter;
    v15 = os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR);
    if (!v15)
      return v15;
    v19 = *v8;
    *(_DWORD *)buf = 138543618;
    v23 = a3;
    v24 = 2114;
    v25 = v19;
    _os_log_error_impl(&dword_245CD7000, v18, OS_LOG_TYPE_ERROR, "Error trying to archive metadata %{public}@ %{public}@", buf, 0x16u);
    goto LABEL_16;
  }
  v10 = (void *)v9;
  v11 = -[SRSensorWriter datastore](self, "datastore");
  v12 = (const void *)objc_msgSend(v10, "bytes");
  v13 = objc_msgSend(v10, "length");
  v14 = SRAbsoluteTimeFromContinuousTime(a4);
  if (!v11)
  {
LABEL_16:
    LOBYTE(v15) = 0;
    return v15;
  }
  v15 = writeMetadataBytesForFrameStore((uint64_t)v11->_configuration, v12, v13, v8, v14);
  if (v15)
  {
    -[SRSensorWriter setLastConfiguration:](self, "setLastConfiguration:", a3);
    -[SRSensorWriter setLastConfigurationContinuousTime:](self, "setLastConfigurationContinuousTime:", a4);
    LOBYTE(v15) = 1;
  }
  return v15;
}

- (void)didReceiveUpdateToConfigurationRequests
{
  SRSensorWriterDelegate *delegate;

  if (-[SRSensorWriterDelegate conformsToProtocol:](self->_delegate, "conformsToProtocol:", &unk_25751ED28))
  {
    delegate = self->_delegate;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[SRSensorWriterDelegate sensorWriter:didReceiveUpdateToConfigurationRequests:](delegate, "sensorWriter:didReceiveUpdateToConfigurationRequests:", self, self->__requestedConfigurations);
  }
}

- (void)set_requestedConfigurations:(id)a3
{
  if (!-[NSArray isEqualToArray:](self->__requestedConfigurations, "isEqualToArray:")
    && (objc_msgSend(a3, "count") || -[NSArray count](self->__requestedConfigurations, "count")))
  {

    self->__requestedConfigurations = (NSArray *)objc_msgSend(a3, "copy");
    if (-[SRSensorWriter isMonitoring](self, "isMonitoring"))
      -[SRSensorWriter didReceiveUpdateToConfigurationRequests](self, "didReceiveUpdateToConfigurationRequests");
  }
}

- (void)setMonitoring:(BOOL)a3
{
  int v3;
  int v5;
  NSObject *v6;
  NSString *v7;
  int64_t v8;
  NSString *sensorIdentifier;
  NSObject *v10;
  NSString *v11;
  _BOOL4 v12;
  SRSensorWriterDelegate *v13;
  NSObject *v14;
  NSString *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  NSString *v19;
  __int16 v20;
  int64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x24BDAC8D0];
  -[SRSensorWriter setRetryGetMonitoring:](self, "setRetryGetMonitoring:", 0);
  v5 = -[SRSensorWriter isMonitoring](self, "isMonitoring");
  v6 = SRLogWriter;
  if (v5 == v3)
  {
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_INFO))
    {
      sensorIdentifier = self->_sensorIdentifier;
      *(_DWORD *)buf = 138412546;
      v19 = sensorIdentifier;
      v20 = 1026;
      LODWORD(v21) = -[SRSensorWriter isMonitoring](self, "isMonitoring");
      _os_log_impl(&dword_245CD7000, v6, OS_LOG_TYPE_INFO, "[%@] monitoring is already %{public, BOOL}d. Ignoring update", buf, 0x12u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
    {
      v7 = self->_sensorIdentifier;
      *(_DWORD *)buf = 138412546;
      v19 = v7;
      v20 = 1026;
      LODWORD(v21) = v3;
      _os_log_impl(&dword_245CD7000, v6, OS_LOG_TYPE_DEFAULT, "[%@] monitoring requested to set to %{public, BOOL}d", buf, 0x12u);
    }
    if ((v3 & 1) != 0)
    {
      v8 = -[SRSensorWriter _writerAuthorizationStatus](self, "_writerAuthorizationStatus");
      if (v8 == 1)
      {
        objc_initWeak((id *)buf, self);
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __32__SRSensorWriter_setMonitoring___block_invoke;
        v16[3] = &unk_2516F20C8;
        objc_copyWeak(&v17, (id *)buf);
        v16[4] = self;
        -[SRSensorWriter registerWithDaemonForWritingIfNeededWithReply:](self, "registerWithDaemonForWritingIfNeededWithReply:", v16);
        objc_destroyWeak(&v17);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v14 = SRLogWriter;
        if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
        {
          v15 = self->_sensorIdentifier;
          *(_DWORD *)buf = 138543874;
          v19 = v15;
          v20 = 2050;
          v21 = v8;
          v22 = 1026;
          v23 = 0;
          _os_log_impl(&dword_245CD7000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] does not have explicit writer authorization (status: %{public}ld). Setting monitoring to %{public, BOOL}d", buf, 0x1Cu);
        }
        -[SRSensorWriter setMonitoring:](self, "setMonitoring:", 0);
        -[SRSensorWriter setRetryGetMonitoring:](self, "setRetryGetMonitoring:", 1);
      }
    }
    else
    {
      atomic_store(0, (unsigned __int8 *)&self->_monitoring);
      v10 = SRLogWriter;
      if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_sensorIdentifier;
        v12 = -[SRSensorWriter isMonitoring](self, "isMonitoring");
        *(_DWORD *)buf = 138412546;
        v19 = v11;
        v20 = 1026;
        LODWORD(v21) = v12;
        _os_log_impl(&dword_245CD7000, v10, OS_LOG_TYPE_DEFAULT, "[%@] monitoring set to %{public, BOOL}d", buf, 0x12u);
      }
      -[SRSensorWriter resetDatastoreFiles:](self, "resetDatastoreFiles:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionary"));
      v13 = -[SRSensorWriter delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[SRSensorWriterDelegate sensorWriterDidStopMonitoring:](v13, "sensorWriterDidStopMonitoring:", self);
    }
  }
}

void __32__SRSensorWriter_setMonitoring___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v4;
  id Weak;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)(a1 + 40);
  Weak = objc_loadWeak((id *)(a1 + 40));
  v6 = Weak;
  if (a2)
  {
    v7 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      v14 = 2114;
      v15 = a2;
      _os_log_error_impl(&dword_245CD7000, v7, OS_LOG_TYPE_ERROR, "[%@] Error registering with daemon because %{public}@. Setting monitoring to false", buf, 0x16u);
    }
    objc_msgSend(v6, "setMonitoring:", 0);
    objc_msgSend(v6, "setRetryGetMonitoring:", 1);
  }
  else
  {
    v8 = (void *)objc_msgSend((id)objc_msgSend(Weak, "connection"), "remoteObjectProxy");
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __32__SRSensorWriter_setMonitoring___block_invoke_125;
    v10[3] = &unk_2516F20A0;
    objc_copyWeak(&v11, v4);
    v10[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "requestFileHandleForWritingWithReply:", v10);
    objc_destroyWeak(&v11);
  }
}

void __32__SRSensorWriter_setMonitoring___block_invoke_125(uint64_t a1, void *a2)
{
  unsigned __int8 *Weak;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  Weak = (unsigned __int8 *)objc_loadWeak((id *)(a1 + 40));
  v5 = objc_msgSend(a2, "objectForKeyedSubscript:", 0x2516F3558);
  if (v5)
  {
    v6 = v5;
    v7 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      v12 = 138412546;
      v13 = v11;
      v14 = 2114;
      v15 = v6;
      _os_log_error_impl(&dword_245CD7000, v7, OS_LOG_TYPE_ERROR, "[%@] Error requesting file handle %{public}@. Setting monitoring to false", (uint8_t *)&v12, 0x16u);
    }
    objc_msgSend(Weak, "resetDatastoreFiles:", MEMORY[0x24BDBD1B8]);
    objc_msgSend(Weak, "setMonitoring:", 0);
    objc_msgSend(Weak, "setRetryGetMonitoring:", 1);
  }
  else
  {
    objc_msgSend(Weak, "resetDatastoreFiles:", a2);
    if (Weak)
    {
      atomic_store(1u, Weak + 40);
      v8 = SRLogWriter;
      if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412546;
        v13 = objc_msgSend(Weak, "sensorIdentifier");
        v14 = 1026;
        LODWORD(v15) = objc_msgSend(Weak, "isMonitoring");
        _os_log_impl(&dword_245CD7000, v8, OS_LOG_TYPE_DEFAULT, "[%@] monitoring set to %{public, BOOL}d", (uint8_t *)&v12, 0x12u);
      }
      if (objc_msgSend((id)objc_msgSend(Weak, "_requestedConfigurations"), "count"))
        objc_msgSend(Weak, "didReceiveUpdateToConfigurationRequests");
      v9 = (void *)objc_msgSend(Weak, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v9, "sensorWriterWillStartMonitoring:", Weak);
    }
    else
    {
      v10 = SRLogWriter;
      if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v12) = 0;
        _os_log_error_impl(&dword_245CD7000, v10, OS_LOG_TYPE_ERROR, "Writer instance is nil so not setting the monitoring flag", (uint8_t *)&v12, 2u);
      }
    }
  }
}

- (BOOL)isMonitoring
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_monitoring);
  return v2 & 1;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SRSensorWriterDelegate *)a3;
  if (-[SRSensorWriter _writerAuthorizationStatus](self, "_writerAuthorizationStatus")
    && objc_msgSend(a3, "conformsToProtocol:", &unk_25751ED88)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a3, "sensorWriter:didChangeWriterAuthorizationStatus:", self, -[SRSensorWriter _writerAuthorizationStatus](self, "_writerAuthorizationStatus"));
  }
  if (-[SRSensorWriter isMonitoring](self, "isMonitoring"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(a3, "sensorWriterWillStartMonitoring:", self);
  }
}

- (SRSensorWriterDelegate)delegate
{
  return self->_delegate;
}

- (void)_requestWriterAuthorizationWithCompletion:(id)a3
{
  int64_t v5;
  SRTCCStore *tccStore;
  NSString *v7;
  NSObject *v8;
  NSString *sensorIdentifier;
  _QWORD v10[5];
  uint8_t buf[4];
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = -[SRSensorWriter _writerAuthorizationStatus](self, "_writerAuthorizationStatus");
  if ((unint64_t)(v5 - 1) >= 2)
  {
    if (!v5)
    {
      if (-[SRSensorWriter writerAuthorizationService](self, "writerAuthorizationService"))
      {
        tccStore = self->_tccStore;
        v7 = -[SRSensorWriter writerAuthorizationService](self, "writerAuthorizationService");
        v10[0] = MEMORY[0x24BDAC760];
        v10[1] = 3221225472;
        v10[2] = __60__SRSensorWriter__requestWriterAuthorizationWithCompletion___block_invoke;
        v10[3] = &unk_2516F20F0;
        v10[4] = a3;
        -[SRTCCStore requestAccessForService:completion:](tccStore, "requestAccessForService:completion:", v7, v10);
      }
      else
      {
        v8 = SRLogWriter;
        if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_FAULT))
        {
          sensorIdentifier = self->_sensorIdentifier;
          *(_DWORD *)buf = 138543362;
          v12 = sensorIdentifier;
          _os_log_fault_impl(&dword_245CD7000, v8, OS_LOG_TYPE_FAULT, "Failed to find authorization service for %{public}@. Unable to request authorization", buf, 0xCu);
        }
        (*((void (**)(id, SRError *))a3 + 2))(a3, +[SRError errorWithCode:](SRError, "errorWithCode:", 4));
      }
    }
  }
  else
  {
    (*((void (**)(id, SRError *))a3 + 2))(a3, +[SRError errorWithCode:](SRError, "errorWithCode:", 4));
  }
}

uint64_t __60__SRSensorWriter__requestWriterAuthorizationWithCompletion___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = SRLogWriter;
  if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67240192;
    v6[1] = a2;
    _os_log_impl(&dword_245CD7000, v4, OS_LOG_TYPE_DEFAULT, "TCC has returned from prompt with status: %{public, BOOL}d", (uint8_t *)v6, 8u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startUpdatingAuthorizations
{
  OS_dispatch_queue *v3;
  uint64_t v4;
  uint32_t v5;
  NSObject *v6;
  _QWORD block[5];
  _QWORD handler[4];
  id v9;
  id location;
  uint8_t buf[4];
  uint32_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  v3 = -[SRSensorWriter writerAuthorizationUpdateQueue](self, "writerAuthorizationUpdateQueue");
  v4 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __45__SRSensorWriter_startUpdatingAuthorizations__block_invoke;
  handler[3] = &unk_2516F2190;
  objc_copyWeak(&v9, &location);
  v5 = notify_register_dispatch("com.apple.tcc.access.changed", &self->_notifyToken, (dispatch_queue_t)v3, handler);
  if (v5)
  {
    v6 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67240192;
      v12 = v5;
      _os_log_fault_impl(&dword_245CD7000, v6, OS_LOG_TYPE_FAULT, "Failed to register for TCC notifications. Got status %{public}d", buf, 8u);
    }
  }
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __45__SRSensorWriter_startUpdatingAuthorizations__block_invoke_135;
  block[3] = &unk_2516F2118;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)-[SRSensorWriter writerAuthorizationUpdateQueue](self, "writerAuthorizationUpdateQueue"), block);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __45__SRSensorWriter_startUpdatingAuthorizations__block_invoke(uint64_t a1)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "updateWriterAuthorizationStatus");
}

uint64_t __45__SRSensorWriter_startUpdatingAuthorizations__block_invoke_135(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateWriterAuthorizationStatus");
}

- (void)updateWriterAuthorizationStatus
{
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  NSObject *v9;
  BOOL v10;
  SRSensorWriterDelegate *v11;
  NSObject *v12;
  NSString *sensorIdentifier;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  NSString *v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = -[SRAuthorizationClient dataCollectionEnabled](+[SRAuthorizationClient sharedInstance](SRAuthorizationClient, "sharedInstance"), "dataCollectionEnabled");
  v4 = -[SRTCCStore preflightAuthorizationStatusForService:](self->_tccStore, "preflightAuthorizationStatusForService:", -[SRSensorWriter writerAuthorizationService](self, "writerAuthorizationService"));
  v5 = v4;
  v6 = 2;
  if (v3)
    v6 = 0;
  if (v4)
    v7 = v4;
  else
    v7 = v6;
  v8 = -[SRSensorWriter _writerAuthorizationStatus](self, "_writerAuthorizationStatus");
  v9 = SRLogWriter;
  if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544386;
    v17 = -[SRSensorWriter writerAuthorizationService](self, "writerAuthorizationService");
    v18 = 2050;
    v19 = v8;
    v20 = 2050;
    v21 = v5;
    v22 = 1026;
    v23 = v3;
    v24 = 2050;
    v25 = v7;
    _os_log_impl(&dword_245CD7000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got writer authorization status update. Current: %{public}ld, TCC: %{public}ld, Data Collection: %{public, BOOL}d, New: %{public}ld", buf, 0x30u);
  }
  if (v8 != v7)
  {
    -[SRSensorWriter set_writerAuthorizationStatus:](self, "set_writerAuthorizationStatus:", v7);
    if (v7)
      v10 = v7 == 2;
    else
      v10 = 1;
    if (v10)
    {
      -[SRSensorWriter setMonitoring:](self, "setMonitoring:", 0);
      -[SRSensorWriter setRetryGetMonitoring:](self, "setRetryGetMonitoring:", 1);
      -[SRSensorWriter resetDatastoreFiles:](self, "resetDatastoreFiles:", MEMORY[0x24BDBD1B8]);
    }
    else if (v7 == 1)
    {
      objc_initWeak((id *)buf, self);
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __49__SRSensorWriter_updateWriterAuthorizationStatus__block_invoke;
      v14[3] = &unk_2516F2050;
      objc_copyWeak(&v15, (id *)buf);
      -[SRSensorWriter registerWithDaemonForWritingIfNeededWithReply:](self, "registerWithDaemonForWritingIfNeededWithReply:", v14);
      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
    }
    v11 = -[SRSensorWriter delegate](self, "delegate");
    if ((-[SRSensorWriterDelegate conformsToProtocol:](v11, "conformsToProtocol:", &unk_25751ED88) & 1) != 0)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[SRSensorWriterDelegate sensorWriter:didChangeWriterAuthorizationStatus:](v11, "sensorWriter:didChangeWriterAuthorizationStatus:", self, v7);
    }
    else
    {
      v12 = SRLogWriter;
      if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
      {
        sensorIdentifier = self->_sensorIdentifier;
        *(_DWORD *)buf = 138412546;
        v17 = sensorIdentifier;
        v18 = 2050;
        v19 = (int64_t)v11;
        _os_log_error_impl(&dword_245CD7000, v12, OS_LOG_TYPE_ERROR, "[%@] Got a writer authorization change notification but the delegate (%{public}p) does not conform to SRSensorWriterAuthorizationDelegate", buf, 0x16u);
      }
    }
  }
}

uint64_t __49__SRSensorWriter_updateWriterAuthorizationStatus__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = result;
    v4 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
    {
      v5 = 138543362;
      v6 = a2;
      _os_log_error_impl(&dword_245CD7000, v4, OS_LOG_TYPE_ERROR, "Failed to connect with daemon because %{public}@", (uint8_t *)&v5, 0xCu);
    }
    return objc_msgSend(objc_loadWeak((id *)(v3 + 32)), "setRetryGetMonitoring:", 1);
  }
  return result;
}

- (void)evaluateAuthorizationState
{
  -[SRSensorWriter evaluateAuthorizationStateWithNewValue:](self, "evaluateAuthorizationStateWithNewValue:", -[SRAuthorizationStore sensorHasReaderAuthorization:](-[SRSensorWriter authStore](self, "authStore"), "sensorHasReaderAuthorization:", self->_sensorIdentifier));
}

- (void)evaluateAuthorizationStateWithNewValue:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  NSObject *v6;
  _BOOL4 v7;
  NSString *sensorIdentifier;
  NSObject *v9;
  NSString *v10;
  int v11;
  _DWORD v12[7];

  v3 = a3;
  *(_QWORD *)&v12[5] = *MEMORY[0x24BDAC8D0];
  v5 = -[SRSensorWriter authorized](self, "authorized");
  -[SRSensorWriter setAuthorized:](self, "setAuthorized:", v3);
  v6 = SRLogWriter;
  if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_INFO))
  {
    v7 = -[SRSensorWriter authorized](self, "authorized");
    sensorIdentifier = self->_sensorIdentifier;
    v11 = 67240450;
    v12[0] = v7;
    LOWORD(v12[1]) = 2112;
    *(_QWORD *)((char *)&v12[1] + 2) = sensorIdentifier;
    _os_log_impl(&dword_245CD7000, v6, OS_LOG_TYPE_INFO, "Authorization set to %{public, BOOL}d for %@", (uint8_t *)&v11, 0x12u);
  }
  if (!v5 && -[SRSensorWriter authorized](self, "authorized"))
  {
    v9 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_sensorIdentifier;
      v11 = 138543362;
      *(_QWORD *)v12 = v10;
      _os_log_impl(&dword_245CD7000, v9, OS_LOG_TYPE_DEFAULT, "Writer is authorized for %{public}@ connecting to daemon to determine monitoring state", (uint8_t *)&v11, 0xCu);
    }
    -[SRSensorWriter checkForMonitoring](self, "checkForMonitoring");
  }
}

- (void)flushDatabase
{
  SRDatastore *datastore;
  NSObject *v4;
  NSString *sensorIdentifier;
  int v6;
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  datastore = self->_datastore;
  if (datastore)
  {
    v4 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
    {
      sensorIdentifier = self->_sensorIdentifier;
      v6 = 138543362;
      v7 = sensorIdentifier;
      _os_log_impl(&dword_245CD7000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Flushing datastore to disk", (uint8_t *)&v6, 0xCu);
      datastore = self->_datastore;
    }
  }
  -[SRDatastore syncMappedFiles](datastore, a2);
}

- (void)authorizedServicesDidChange:(id)a3 deniedServices:(id)a4 dataCollectionEnabled:(BOOL)a5 onboardingCompleted:(BOOL)a6 lastModifiedTimes:(id)a7 forBundleIdentifier:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  char v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  NSString *v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v9 = a6;
  v10 = a5;
  v27 = *MEMORY[0x24BDAC8D0];
  v14 = objc_msgSend(a8, "isEqualToString:", CFSTR("com.apple.private.SensorKit._compositeBundle"), a4, a5, a6, a7);
  v15 = SRLogWriter;
  if ((v14 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138544386;
      v18 = -[SRSensorWriter writerAuthorizationService](self, "writerAuthorizationService");
      v19 = 1026;
      v20 = v10;
      v21 = 1026;
      v22 = v9;
      v23 = 2114;
      v24 = a3;
      v25 = 2114;
      v26 = a4;
      _os_log_impl(&dword_245CD7000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got authorization client update: data collection: %{public, BOOL}d, onboarding: %{public, BOOL}d, authorized: %{public}@, denied: %{public}@", (uint8_t *)&v17, 0x2Cu);
    }
    v16 = 0;
    if (v10 && v9)
    {
      if (objc_msgSend(a3, "containsObject:", self->_sensorIdentifier))
        v16 = objc_msgSend(a4, "containsObject:", self->_sensorIdentifier) ^ 1;
      else
        v16 = 0;
    }
    -[SRSensorWriter updateWriterAuthorizationStatus](self, "updateWriterAuthorizationStatus");
    -[SRSensorWriter evaluateAuthorizationStateWithNewValue:](self, "evaluateAuthorizationStateWithNewValue:", v16);
  }
  else if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_FAULT))
  {
    v17 = 138543362;
    v18 = (NSString *)a8;
    _os_log_fault_impl(&dword_245CD7000, v15, OS_LOG_TYPE_FAULT, "Shouldn't be getting an auth update for %{public}@", (uint8_t *)&v17, 0xCu);
  }
}

- (void)bundleEligibility:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  _QWORD v9[7];
  id v10;
  id location;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v7 = -[NSCache objectForKey:](self->_eligibilityCache, "objectForKey:");
  if (v7)
  {
    v8 = objc_msgSend(v7, "integerValue");
    v13[3] = v8;
    (*((void (**)(id))a4 + 2))(a4);
  }
  else
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __47__SRSensorWriter_bundleEligibility_completion___block_invoke;
    v9[3] = &unk_2516F2168;
    v9[5] = a4;
    objc_copyWeak(&v10, &location);
    v9[4] = a3;
    v9[6] = &v12;
    -[SRSensorWriter registerWithDaemonForWritingIfNeededWithReply:](self, "registerWithDaemonForWritingIfNeededWithReply:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(&v12, 8);
}

void __47__SRSensorWriter_bundleEligibility_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  id *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[7];
  id v12;
  _QWORD v13[5];
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v4 = SRLogWriter;
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = a2;
      _os_log_error_impl(&dword_245CD7000, v4, OS_LOG_TYPE_ERROR, "Error registering with daemon because %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v5 = (id *)(a1 + 56);
    v6 = (void *)objc_msgSend(objc_loadWeak((id *)(a1 + 56)), "connection");
    v7 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __47__SRSensorWriter_bundleEligibility_completion___block_invoke_136;
    v13[3] = &unk_2516F2028;
    v13[4] = *(_QWORD *)(a1 + 40);
    v8 = (void *)objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
    v9 = *(_QWORD *)(a1 + 32);
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __47__SRSensorWriter_bundleEligibility_completion___block_invoke_137;
    v11[3] = &unk_2516F2140;
    v10 = *(_QWORD *)(a1 + 48);
    v11[4] = v9;
    v11[6] = v10;
    objc_copyWeak(&v12, v5);
    v11[5] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v8, "fetchEligibilityStatusForBundleIdentifier:reply:", v9, v11);
    objc_destroyWeak(&v12);
  }
}

uint64_t __47__SRSensorWriter_bundleEligibility_completion___block_invoke_136(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = SRLogWriter;
  if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = a2;
    _os_log_error_impl(&dword_245CD7000, v4, OS_LOG_TYPE_ERROR, "Unable to get proxy object to request eligibility because %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __47__SRSensorWriter_bundleEligibility_completion___block_invoke_137(uint64_t a1, unsigned int a2, uint64_t a3)
{
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = SRLogWriter;
  if (a3)
  {
    if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_ERROR))
    {
      v10 = 138543362;
      v11 = a3;
      _os_log_error_impl(&dword_245CD7000, v6, OS_LOG_TYPE_ERROR, "Error fetching eligibility %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)SRLogWriter, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("not eligible");
    v8 = *(_QWORD *)(a1 + 32);
    if (a2)
      v7 = CFSTR("eligible");
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_245CD7000, v6, OS_LOG_TYPE_INFO, "Bundle identifier %{public}@ %{public}@ for writing", (uint8_t *)&v10, 0x16u);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)(a1 + 56)), "eligibilityCache"), "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)), *(_QWORD *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (NSString)sensorIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSensorIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSDictionary)nextDatastoreFiles
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setNextDatastoreFiles:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)requestNewSegmentInFlight
{
  return self->_requestNewSegmentInFlight;
}

- (void)setRequestNewSegmentInFlight:(BOOL)a3
{
  self->_requestNewSegmentInFlight = a3;
}

- (BOOL)authorized
{
  return self->_authorized;
}

- (void)setAuthorized:(BOOL)a3
{
  self->_authorized = a3;
}

- (BOOL)connectionDidInterrupt
{
  return self->_connectionDidInterrupt;
}

- (void)setConnectionDidInterrupt:(BOOL)a3
{
  self->_connectionDidInterrupt = a3;
}

- (BOOL)connectionDidInvalidate
{
  return self->_connectionDidInvalidate;
}

- (void)setConnectionDidInvalidate:(BOOL)a3
{
  self->_connectionDidInvalidate = a3;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 72, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)retryGetMonitoring
{
  return self->_retryGetMonitoring;
}

- (void)setRetryGetMonitoring:(BOOL)a3
{
  self->_retryGetMonitoring = a3;
}

- (int64_t)_writerAuthorizationStatus
{
  return self->__writerAuthorizationStatus;
}

- (void)set_writerAuthorizationStatus:(int64_t)a3
{
  self->__writerAuthorizationStatus = a3;
}

- (NSString)writerAuthorizationService
{
  return self->_writerAuthorizationService;
}

- (SRTCCStore)tccStore
{
  return (SRTCCStore *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTccStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (OS_dispatch_queue)writerAuthorizationUpdateQueue
{
  return self->_writerAuthorizationUpdateQueue;
}

- (void)setWriterAuthorizationUpdateQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (SRAuthorizationStore)authStore
{
  return self->_authStore;
}

- (void)setAuthStore:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSCache)eligibilityCache
{
  return self->_eligibilityCache;
}

- (void)setEligibilityCache:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (double)roundingInterval
{
  return self->_roundingInterval;
}

- (void)setRoundingInterval:(double)a3
{
  self->_roundingInterval = a3;
}

- (NSDictionary)lastMetadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setLastMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (unint64_t)lastMetadataContinuousTime
{
  return self->_lastMetadataContinuousTime;
}

- (void)setLastMetadataContinuousTime:(unint64_t)a3
{
  self->_lastMetadataContinuousTime = a3;
}

- (NSDictionary)lastConfiguration
{
  return (NSDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setLastConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (unint64_t)lastConfigurationContinuousTime
{
  return self->_lastConfigurationContinuousTime;
}

- (void)setLastConfigurationContinuousTime:(unint64_t)a3
{
  self->_lastConfigurationContinuousTime = a3;
}

- (NSArray)_requestedConfigurations
{
  return self->__requestedConfigurations;
}

@end
