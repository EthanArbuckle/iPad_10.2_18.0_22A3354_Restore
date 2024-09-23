@implementation SKAStatusServer

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_21);
  return (id)sharedInstance_instance;
}

void __33__SKAStatusServer_sharedInstance__block_invoke()
{
  SKAStatusServer *v0;
  void *v1;

  v0 = objc_alloc_init(SKAStatusServer);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (SKAStatusServer)init
{
  NSObject *v3;
  SKAStatusServer *v4;
  SKAStatusServer *v5;
  OS_dispatch_queue *v6;
  NSMutableArray *v7;
  NSMutableArray *publishingServiceConnectedClients;
  OS_dispatch_queue *subscriptionServiceConnectionQueue;
  NSMutableArray *v10;
  NSMutableArray *subscriptionServiceConnectedClients;
  OS_dispatch_queue *presenceConnectionQueue;
  NSMutableArray *v13;
  NSMutableArray *presenceConnectedClients;
  SKADatabaseProvider *v15;
  SKADatabaseProviding *databaseProvider;
  SKADatabaseManager *v17;
  SKADatabaseManaging *databaseManager;
  _BOOL4 v19;
  NSObject *v20;
  SKAPushManager *v21;
  void *v22;
  SKAPushManager *v23;
  SKAAccountProvider *v24;
  SKAChannelManager *v25;
  SKAChannelManaging *channelManager;
  SKAStatusSubscriptionManager *v27;
  SKAStatusSubscriptionManaging *subscriptionManager;
  OS_dispatch_queue *invitationManagerMessagingQueue;
  SKAMessagingProvider *v30;
  SKAMessagingProviding *invitationMessagingProvider;
  SKAPresenceManager *v32;
  SKAPresenceManaging *presenceManager;
  SKAInvitationManager *v34;
  SKAInvitationManaging *invitationManager;
  SKAStatusEncryptionManager *v36;
  SKAStatusEncryptionManaging *encryptionManager;
  SKAStatusReceivingManager *v38;
  SKAStatusReceivingManaging *statusReceivingManager;
  SKAStatusPublishingManager *v40;
  SKAStatusPublishingManaging *publishingManager;
  uint64_t v42;
  NSXPCListener *publishingServiceListener;
  uint64_t v44;
  NSXPCListener *subscriptionServiceListener;
  uint64_t v46;
  NSXPCListener *presenceListener;
  objc_super v49;
  uint8_t buf[16];

  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "Initializing", buf, 2u);
  }

  v49.receiver = self;
  v49.super_class = (Class)SKAStatusServer;
  v4 = -[SKAStatusServer init](&v49, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = (OS_dispatch_queue *)MEMORY[0x24BDAC9B8];
    objc_storeStrong((id *)&v4->_publishingServiceConnectionQueue, MEMORY[0x24BDAC9B8]);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    publishingServiceConnectedClients = v5->_publishingServiceConnectedClients;
    v5->_publishingServiceConnectedClients = v7;

    subscriptionServiceConnectionQueue = v5->_subscriptionServiceConnectionQueue;
    v5->_subscriptionServiceConnectionQueue = v6;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    subscriptionServiceConnectedClients = v5->_subscriptionServiceConnectedClients;
    v5->_subscriptionServiceConnectedClients = v10;

    presenceConnectionQueue = v5->_presenceConnectionQueue;
    v5->_presenceConnectionQueue = v6;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    presenceConnectedClients = v5->_presenceConnectedClients;
    v5->_presenceConnectedClients = v13;

    v15 = -[SKADatabaseProvider initWithDelegate:]([SKADatabaseProvider alloc], "initWithDelegate:", v5);
    databaseProvider = v5->_databaseProvider;
    v5->_databaseProvider = (SKADatabaseProviding *)v15;

    v17 = -[SKADatabaseManager initWithDatabaseProvider:delegate:]([SKADatabaseManager alloc], "initWithDatabaseProvider:delegate:", v5->_databaseProvider, v5);
    databaseManager = v5->_databaseManager;
    v5->_databaseManager = (SKADatabaseManaging *)v17;

    v19 = -[SKAStatusServer _inTextTrafficMode](v5, "_inTextTrafficMode");
    v5->_trafficModeEnabled = v19;
    if (v19)
    {
      +[SKAStatusServer logger](SKAStatusServer, "logger");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2188DF000, v20, OS_LOG_TYPE_DEFAULT, "In Traffic Mode--will not honor status subscriptions and will drop incoming status's", buf, 2u);
      }

    }
    v21 = [SKAPushManager alloc];
    +[SKASystemMonitor sharedInstance](SKASystemMonitor, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[SKAPushManager initWithQueue:systemMonitor:inTrafficMode:](v21, "initWithQueue:systemMonitor:inTrafficMode:", v6, v22, v5->_trafficModeEnabled);

    v24 = objc_alloc_init(SKAAccountProvider);
    v25 = -[SKAChannelManager initWithPushManager:accountProvider:delegate:]([SKAChannelManager alloc], "initWithPushManager:accountProvider:delegate:", v23, v24, v5);
    channelManager = v5->_channelManager;
    v5->_channelManager = (SKAChannelManaging *)v25;

    v27 = -[SKAStatusSubscriptionManager initWithDatabaseManager:channelManager:pushManager:]([SKAStatusSubscriptionManager alloc], "initWithDatabaseManager:channelManager:pushManager:", v5->_databaseManager, v5->_channelManager, v23);
    subscriptionManager = v5->_subscriptionManager;
    v5->_subscriptionManager = (SKAStatusSubscriptionManaging *)v27;

    invitationManagerMessagingQueue = v5->_invitationManagerMessagingQueue;
    v5->_invitationManagerMessagingQueue = v6;

    v30 = -[SKAMessagingProvider initWithDelegate:serviceIdentifier:pushManager:queue:]([SKAMessagingProvider alloc], "initWithDelegate:serviceIdentifier:pushManager:queue:", v5, CFSTR("com.apple.private.alloy.status.keysharing"), v23, v5->_invitationManagerMessagingQueue);
    invitationMessagingProvider = v5->_invitationMessagingProvider;
    v5->_invitationMessagingProvider = (SKAMessagingProviding *)v30;

    v32 = -[SKAPresenceManager initWithDatabaseManager:channelManager:subscriptionManager:accountProvider:messagingProvider:delegate:]([SKAPresenceManager alloc], "initWithDatabaseManager:channelManager:subscriptionManager:accountProvider:messagingProvider:delegate:", v5->_databaseManager, v5->_channelManager, v5->_subscriptionManager, v24, v5->_invitationMessagingProvider, v5);
    presenceManager = v5->_presenceManager;
    v5->_presenceManager = (SKAPresenceManaging *)v32;

    v34 = -[SKAInvitationManager initWithMessagingProvider:databaseManager:accountProvider:channelManager:presenceManager:trafficMode:]([SKAInvitationManager alloc], "initWithMessagingProvider:databaseManager:accountProvider:channelManager:presenceManager:trafficMode:", v5->_invitationMessagingProvider, v5->_databaseManager, v24, v5->_channelManager, v5->_presenceManager, v5->_trafficModeEnabled);
    invitationManager = v5->_invitationManager;
    v5->_invitationManager = (SKAInvitationManaging *)v34;

    -[SKAInvitationManaging setDelegate:](v5->_invitationManager, "setDelegate:", v5);
    v36 = -[SKAStatusEncryptionManager initWithDatabaseManager:invitationManager:]([SKAStatusEncryptionManager alloc], "initWithDatabaseManager:invitationManager:", v5->_databaseManager, v5->_invitationManager);
    encryptionManager = v5->_encryptionManager;
    v5->_encryptionManager = (SKAStatusEncryptionManaging *)v36;

    v38 = -[SKAStatusReceivingManager initWithDatabaseManager:encryptionManager:delegate:]([SKAStatusReceivingManager alloc], "initWithDatabaseManager:encryptionManager:delegate:", v5->_databaseManager, v5->_encryptionManager, v5);
    statusReceivingManager = v5->_statusReceivingManager;
    v5->_statusReceivingManager = (SKAStatusReceivingManaging *)v38;

    v40 = -[SKAStatusPublishingManager initWithDatabaseManager:channelManager:accountProvider:encryptionManager:invitationManager:]([SKAStatusPublishingManager alloc], "initWithDatabaseManager:channelManager:accountProvider:encryptionManager:invitationManager:", v5->_databaseManager, v5->_channelManager, v24, v5->_encryptionManager, v5->_invitationManager);
    publishingManager = v5->_publishingManager;
    v5->_publishingManager = (SKAStatusPublishingManaging *)v40;

    v42 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.StatusKit.publish"));
    publishingServiceListener = v5->_publishingServiceListener;
    v5->_publishingServiceListener = (NSXPCListener *)v42;

    -[NSXPCListener setDelegate:](v5->_publishingServiceListener, "setDelegate:", v5);
    -[NSXPCListener _setQueue:](v5->_publishingServiceListener, "_setQueue:", v5->_publishingServiceConnectionQueue);
    -[NSXPCListener resume](v5->_publishingServiceListener, "resume");
    v44 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.StatusKit.subscribe"));
    subscriptionServiceListener = v5->_subscriptionServiceListener;
    v5->_subscriptionServiceListener = (NSXPCListener *)v44;

    -[NSXPCListener setDelegate:](v5->_subscriptionServiceListener, "setDelegate:", v5);
    -[NSXPCListener _setQueue:](v5->_subscriptionServiceListener, "_setQueue:", v5->_subscriptionServiceConnectionQueue);
    -[NSXPCListener resume](v5->_subscriptionServiceListener, "resume");
    v46 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.StatusKit.presence"));
    presenceListener = v5->_presenceListener;
    v5->_presenceListener = (NSXPCListener *)v46;

    -[NSXPCListener setDelegate:](v5->_presenceListener, "setDelegate:", v5);
    -[NSXPCListener _setQueue:](v5->_presenceListener, "_setQueue:", v5->_presenceConnectionQueue);
    -[NSXPCListener resume](v5->_presenceListener, "resume");
    -[SKAStatusServer _setupMaintenanceActivity](v5, "_setupMaintenanceActivity");

  }
  return v5;
}

- (void)shutdown
{
  NSObject *v3;
  NSMutableArray *publishingServiceConnectedClients;
  NSXPCListener *publishingServiceListener;
  NSMutableArray *subscriptionServiceConnectedClients;
  NSXPCListener *subscriptionServiceListener;
  NSMutableArray *presenceConnectedClients;
  NSXPCListener *presenceListener;
  uint8_t v10[16];

  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "Shutting down", v10, 2u);
  }

  -[NSMutableArray removeAllObjects](self->_publishingServiceConnectedClients, "removeAllObjects");
  publishingServiceConnectedClients = self->_publishingServiceConnectedClients;
  self->_publishingServiceConnectedClients = 0;

  -[NSXPCListener invalidate](self->_publishingServiceListener, "invalidate");
  publishingServiceListener = self->_publishingServiceListener;
  self->_publishingServiceListener = 0;

  -[NSMutableArray removeAllObjects](self->_subscriptionServiceConnectedClients, "removeAllObjects");
  subscriptionServiceConnectedClients = self->_subscriptionServiceConnectedClients;
  self->_subscriptionServiceConnectedClients = 0;

  -[NSXPCListener invalidate](self->_subscriptionServiceListener, "invalidate");
  subscriptionServiceListener = self->_subscriptionServiceListener;
  self->_subscriptionServiceListener = 0;

  -[NSMutableArray removeAllObjects](self->_presenceConnectedClients, "removeAllObjects");
  presenceConnectedClients = self->_presenceConnectedClients;
  self->_presenceConnectedClients = 0;

  -[NSXPCListener invalidate](self->_presenceListener, "invalidate");
  presenceListener = self->_presenceListener;
  self->_presenceListener = 0;

}

- (void)logState
{
  NSObject *v2;
  uint8_t v3[16];

  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2188DF000, v2, OS_LOG_TYPE_DEFAULT, "Logging state", v3, 2u);
  }

}

+ (id)logger
{
  if (logger_onceToken_21 != -1)
    dispatch_once(&logger_onceToken_21, &__block_literal_global_25_0);
  return (id)logger__logger_21;
}

void __25__SKAStatusServer_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKAStatusServer");
  v1 = (void *)logger__logger_21;
  logger__logger_21 = (uint64_t)v0;

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  BOOL v15;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.StatusKit.publish")))
  {
    +[SKAStatusServer logger](SKAStatusServer, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 134217984;
      v18 = (int)objc_msgSend(v7, "processIdentifier");
      _os_log_impl(&dword_2188DF000, v9, OS_LOG_TYPE_DEFAULT, "Receiving XPC connection from PID %ld for publishing service", (uint8_t *)&v17, 0xCu);
    }

    v10 = -[SKAStatusServer _publishingServiceListener:shouldAcceptNewConnection:](self, "_publishingServiceListener:shouldAcceptNewConnection:", v6, v7);
LABEL_13:
    v15 = v10;
    goto LABEL_14;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.StatusKit.subscribe")))
  {
    +[SKAStatusServer logger](SKAStatusServer, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 134217984;
      v18 = (int)objc_msgSend(v7, "processIdentifier");
      _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Receiving XPC connection from PID %ld for subscription service", (uint8_t *)&v17, 0xCu);
    }

    v10 = -[SKAStatusServer _subscriptionServiceListener:shouldAcceptNewConnection:](self, "_subscriptionServiceListener:shouldAcceptNewConnection:", v6, v7);
    goto LABEL_13;
  }
  v12 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.StatusKit.presence"));
  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 134217984;
      v18 = (int)objc_msgSend(v7, "processIdentifier");
      _os_log_impl(&dword_2188DF000, v14, OS_LOG_TYPE_DEFAULT, "Receiving XPC connection from PID %ld for presence", (uint8_t *)&v17, 0xCu);
    }

    v10 = -[SKAStatusServer _presenceServiceListener:shouldAcceptNewConnection:](self, "_presenceServiceListener:shouldAcceptNewConnection:", v6, v7);
    goto LABEL_13;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    -[SKAStatusServer listener:shouldAcceptNewConnection:].cold.1(v7, (const char *)v8, v14);

  v15 = 0;
LABEL_14:

  return v15;
}

- (BOOL)_publishingServiceListener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  BOOL v6;
  NSObject *v7;
  SKAStatusPublishingServiceClient *v8;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = +[SKAStatusPublishingServiceClientConnection clientIsEntitledForAtLeastOnePublishingServiceType:](SKAStatusPublishingServiceClientConnection, "clientIsEntitledForAtLeastOnePublishingServiceType:", v5);
  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (SKAStatusPublishingServiceClient *)v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v11 = (int)objc_msgSend(v5, "processIdentifier");
      _os_log_impl(&dword_2188DF000, &v8->super, OS_LOG_TYPE_DEFAULT, "Accepted XPC connection from PID %ld for publishing service", buf, 0xCu);
    }

    v8 = -[SKAStatusPublishingServiceClient initWithXPCConnection:queue:delegate:databaseManager:invitationManager:publishingManager:channelManager:]([SKAStatusPublishingServiceClient alloc], "initWithXPCConnection:queue:delegate:databaseManager:invitationManager:publishingManager:channelManager:", v5, self->_publishingServiceConnectionQueue, self, self->_databaseManager, self->_invitationManager, self->_publishingManager, self->_channelManager);
    -[NSMutableArray addObject:](self->_publishingServiceConnectedClients, "addObject:", v8);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[SKAStatusServer _publishingServiceListener:shouldAcceptNewConnection:].cold.1(v5, (char *)v8);
  }

  return v6;
}

- (BOOL)_presenceServiceListener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  SKAPresenceClient *v10;
  int v11;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v14 = (int)objc_msgSend(v5, "processIdentifier");
    _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Incoming XPC connection from PID %ld for presence service", buf, 0xCu);
  }

  objc_msgSend(v5, "sk_stringValueForEntitlement:", CFSTR("com.apple.StatusKit.presence.clientID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (SKAPresenceClient *)v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v5, "processIdentifier");
      *(_DWORD *)buf = 134218242;
      v14 = v11;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_2188DF000, &v10->super, OS_LOG_TYPE_DEFAULT, "Accepting XPC connection from PID %ld for presence service with clientid:%@", buf, 0x16u);
    }

    v10 = -[SKAPresenceClient initWithXPCConnection:queue:delegate:subscriptionManager:presenceManager:invitationManager:databaseManager:]([SKAPresenceClient alloc], "initWithXPCConnection:queue:delegate:subscriptionManager:presenceManager:invitationManager:databaseManager:", v5, self->_presenceConnectionQueue, self, self->_subscriptionManager, self->_presenceManager, self->_invitationManager, self->_databaseManager);
    -[NSMutableArray addObject:](self->_presenceConnectedClients, "addObject:", v10);
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[SKAStatusServer _presenceServiceListener:shouldAcceptNewConnection:].cold.1(v5, (char *)v10);
  }

  return v8 != 0;
}

- (BOOL)_subscriptionServiceListener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  SKAStatusSubscriptionServiceClient *v9;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = +[SKAStatusSubscriptionServiceClientConnection clientIsEntitledForAtLeastOneSubscriptionServiceType:](SKAStatusSubscriptionServiceClientConnection, "clientIsEntitledForAtLeastOneSubscriptionServiceType:", v5);
  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v13 = (int)objc_msgSend(v5, "processIdentifier");
      _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, "Accepted XPC connection from PID %ld for subscription service", buf, 0xCu);
    }

    v9 = [SKAStatusSubscriptionServiceClient alloc];
    LOBYTE(v11) = self->_trafficModeEnabled;
    v8 = -[SKAStatusSubscriptionServiceClient initWithXPCConnection:queue:delegate:databaseManager:subscriptionManager:encryptionManager:inTrafficMode:](v9, "initWithXPCConnection:queue:delegate:databaseManager:subscriptionManager:encryptionManager:inTrafficMode:", v5, self->_publishingServiceConnectionQueue, self, self->_databaseManager, self->_subscriptionManager, self->_encryptionManager, v11);
    -[NSMutableArray addObject:](self->_subscriptionServiceConnectedClients, "addObject:", v8);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[SKAStatusServer _subscriptionServiceListener:shouldAcceptNewConnection:].cold.1(v5, (char *)v8);
  }

  return v6;
}

- (void)subscriptionServiceClientWasInvalidated:(id)a3
{
  id v4;
  NSObject *subscriptionServiceConnectionQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  subscriptionServiceConnectionQueue = self->_subscriptionServiceConnectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__SKAStatusServer_subscriptionServiceClientWasInvalidated___block_invoke;
  block[3] = &unk_24D977800;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(subscriptionServiceConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __59__SKAStatusServer_subscriptionServiceClientWasInvalidated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "Subscription service client was invalidated. Removing client: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(WeakRetained, "subscriptionServiceConnectedClients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 32));

}

- (void)publishingServiceClientWasInvalidated:(id)a3
{
  id v4;
  NSObject *publishingServiceConnectionQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  publishingServiceConnectionQueue = self->_publishingServiceConnectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__SKAStatusServer_publishingServiceClientWasInvalidated___block_invoke;
  block[3] = &unk_24D977800;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(publishingServiceConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __57__SKAStatusServer_publishingServiceClientWasInvalidated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "Publishing service client was invalidated. Removing client: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(WeakRetained, "publishingServiceConnectedClients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 32));

}

- (void)presenceClientWasInvalidated:(id)a3
{
  id v4;
  NSObject *presenceConnectionQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  presenceConnectionQueue = self->_presenceConnectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SKAStatusServer_presenceClientWasInvalidated___block_invoke;
  block[3] = &unk_24D977800;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(presenceConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__SKAStatusServer_presenceClientWasInvalidated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 32);
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "Presence client was invalidated. Removing client: %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(WeakRetained, "presenceConnectedClients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 32));

  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "transaction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "SKATransaction: Completed transaction %@", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "setTransaction:", 0);

}

- (void)databaseDidReceiveRemoteChangesForChannels:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *subscriptionServiceConnectionQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Received remote database changes for channels: %@", buf, 0xCu);
  }

  -[SKAStatusSubscriptionManaging updateRegisteredSubscriptionsForActiveAssertionsWithCompletion:](self->_subscriptionManager, "updateRegisteredSubscriptionsForActiveAssertionsWithCompletion:", &__block_literal_global_36);
  objc_initWeak((id *)buf, self);
  subscriptionServiceConnectionQueue = self->_subscriptionServiceConnectionQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__SKAStatusServer_databaseDidReceiveRemoteChangesForChannels___block_invoke_37;
  v8[3] = &unk_24D977800;
  objc_copyWeak(&v10, (id *)buf);
  v9 = v4;
  v7 = v4;
  dispatch_async(subscriptionServiceConnectionQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __62__SKAStatusServer_databaseDidReceiveRemoteChangesForChannels___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];

  v2 = a2;
  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __62__SKAStatusServer_databaseDidReceiveRemoteChangesForChannels___block_invoke_cold_1((uint64_t)v2, v4, v5);
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Success updating subscriptions following remote database changes", v6, 2u);
  }

}

void __62__SKAStatusServer_databaseDidReceiveRemoteChangesForChannels___block_invoke_37(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  id WeakRetained;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint8_t v38[128];
  uint8_t buf[4];
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "databaseManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newBackgroundContext");
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v2, "existingChannelForSubscriptionIdentifier:databaseContext:", v10, v3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v4, "addObject:", v11);
        }
        else
        {
          +[SKAStatusServer logger](SKAStatusServer, "logger");
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v40 = v10;
            _os_log_error_impl(&dword_2188DF000, v12, OS_LOG_TYPE_ERROR, "Could not find channel matching changed channelIdentifier: %@", buf, 0xCu);
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = WeakRetained;
    objc_msgSend(WeakRetained, "subscriptionServiceConnectedClients");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v30 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "handleRemoteDatabaseChangeForChannels:", v4);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v16);
    }

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v19 = v4;
    v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v26;
      do
      {
        for (k = 0; k != v21; ++k)
        {
          if (*(_QWORD *)v26 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(WeakRetained, "_notifyPresenceClientsIfNeededOfChannelChangeForChannel:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * k));
        }
        v21 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
      }
      while (v21);
    }
  }
  else
  {
    +[SKAStatusServer logger](SKAStatusServer, "logger");
    v19 = objc_claimAutoreleasedReturnValue();
    v13 = WeakRetained;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __62__SKAStatusServer_databaseDidReceiveRemoteChangesForChannels___block_invoke_37_cold_1();
  }

}

- (void)initialCloudKitImportReceived:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[SKAStatusServer presenceConnectedClients](self, "presenceConnectedClients", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "initialCloudKitImportReceived");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)service:(id)a3 didReceiveIncomingMessage:(id)a4 fromID:(id)a5 toID:(id)a6 messageGuid:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = a6;
  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412802;
    v24 = v12;
    v25 = 2112;
    v26 = v14;
    v27 = 2112;
    v28 = v13;
    _os_log_impl(&dword_2188DF000, v17, OS_LOG_TYPE_DEFAULT, "Incoming message received. Service: %@ senderID: %@ guid: %@", (uint8_t *)&v23, 0x20u);
  }

  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_2188DF000, v18, OS_LOG_TYPE_DEFAULT, "Handling message as key invite", (uint8_t *)&v23, 2u);
  }

  v19 = (void *)IDSCopyRawAddressForDestination();
  v20 = (void *)IDSCopyRawAddressForDestination();

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1028]), "initWithString:", v19);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1028]), "initWithString:", v20);
  -[SKAInvitationManaging handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:](self->_invitationManager, "handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:", v13, v21, v14, v22, v15);

}

- (void)service:(id)a3 outgoingMessageWithIdentifier:(id)a4 fromID:(id)a5 toID:(id)a6 didSendWithSuccess:(BOOL)a7
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a7;
  v10 = a6;
  v11 = a4;
  v15 = (id)IDSCopyRawAddressForDestination();
  v12 = (void *)IDSCopyRawAddressForDestination();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1028]), "initWithString:", v15);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1028]), "initWithString:", v12);
  -[SKAInvitationManaging outgoingMessageWithIdentifier:fromHandle:toHandle:didSendWithSuccess:](self->_invitationManager, "outgoingMessageWithIdentifier:fromHandle:toHandle:didSendWithSuccess:", v11, v13, v14, v7);

}

- (void)networkBecameReachable
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "Received network reachable notification", buf, 2u);
  }

  if (-[SKAStatusServer _kettleFeatureEnabled](self, "_kettleFeatureEnabled"))
  {
    -[SKAStatusPublishingManaging publishPendingRequestForReason:](self->_publishingManager, "publishPendingRequestForReason:", 0);
  }
  else
  {
    +[SKAStatusServer logger](SKAStatusServer, "logger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Kettle feature flag not enabled.  Exiting.", v5, 2u);
    }

  }
}

- (void)channelManager:(id)a3 didReceiveData:(id)a4 onChannel:(id)a5 identifier:(unint64_t)a6 dateReceived:(id)a7 dateExpired:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  SKAStatusReceivingManaging *statusReceivingManager;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = a8;
  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v31 = v14;
    v32 = 2048;
    v33 = a6;
    _os_log_impl(&dword_2188DF000, v17, OS_LOG_TYPE_DEFAULT, "Received data on channel: %@ identifier: %lu", buf, 0x16u);
  }

  -[SKAStatusServer databaseManager](self, "databaseManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "newBackgroundContext");

  -[SKAStatusServer databaseManager](self, "databaseManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "existingChannelForSubscriptionIdentifier:databaseContext:", v14, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    +[SKAStatusServer logger](SKAStatusServer, "logger");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[SKAStatusServer channelManager:didReceiveData:onChannel:identifier:dateReceived:dateExpired:].cold.1();
    goto LABEL_21;
  }
  if (!objc_msgSend(v21, "channelType"))
  {
    +[SKAStatusServer logger](SKAStatusServer, "logger");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v27, OS_LOG_TYPE_DEFAULT, "Handling as status update", buf, 2u);
    }

    if (self->_trafficModeEnabled)
    {
      +[SKAStatusServer logger](SKAStatusServer, "logger");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[SKAStatusServer channelManager:didReceiveData:onChannel:identifier:dateReceived:dateExpired:].cold.2();
    }
    else
    {
      statusReceivingManager = self->_statusReceivingManager;
      -[SKAChannelManaging serverTime](self->_channelManager, "serverTime");
      v26 = objc_claimAutoreleasedReturnValue();
      -[SKAStatusReceivingManaging handleIncomingStatusData:onChannelIdentifier:dateReceived:dateExpired:serverTime:](statusReceivingManager, "handleIncomingStatusData:onChannelIdentifier:dateReceived:dateExpired:serverTime:", v13, v14, v15, v16, v26);
    }
LABEL_21:

    goto LABEL_22;
  }
  v29 = v16;
  v22 = v15;
  v23 = objc_msgSend(v21, "channelType");
  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v23 == 1)
  {
    v15 = v22;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v25, OS_LOG_TYPE_DEFAULT, "Handling as presence update", buf, 2u);
    }

    -[SKAPresenceManaging channelReceivedIncomingPayloadUpdate:channel:withIdentifier:](self->_presenceManager, "channelReceivedIncomingPayloadUpdate:channel:withIdentifier:", v13, v21, a6);
  }
  else
  {
    v15 = v22;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[SKAStatusServer channelManager:didReceiveData:onChannel:identifier:dateReceived:dateExpired:].cold.3();

  }
  v16 = v29;
LABEL_22:

}

- (void)channelManager:(id)a3 failedToSubscribeToChannel:(id)a4 withError:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a4;
  v7 = a5;
  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[SKAStatusServer channelManager:failedToSubscribeToChannel:withError:].cold.1((uint64_t)v6, (uint64_t)v7, v8);

}

- (void)statusReceivingManager:(id)a3 didReceiveStatusUpdate:(id)a4 onChannel:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *subscriptionServiceConnectionQueue;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v9;
    _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Server received status update: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  subscriptionServiceConnectionQueue = self->_subscriptionServiceConnectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__SKAStatusServer_statusReceivingManager_didReceiveStatusUpdate_onChannel___block_invoke;
  block[3] = &unk_24D977200;
  objc_copyWeak(&v18, (id *)buf);
  v13 = v9;
  v16 = v13;
  v14 = v10;
  v17 = v14;
  dispatch_async(subscriptionServiceConnectionQueue, block);
  -[SKAStatusServer donateReceivedStatusToBiomeOnChannel:](self, "donateReceivedStatusToBiomeOnChannel:", v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

}

void __75__SKAStatusServer_statusReceivingManager_didReceiveStatusUpdate_onChannel___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(WeakRetained, "subscriptionServiceConnectedClients", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "handleReceivedStatusUpdate:onChannel:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)donateReceivedStatusToBiomeOnChannel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "statusType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SKAStatusServer _shouldDonateToBiomeForStatusTypeIdentifier:](self, "_shouldDonateToBiomeForStatusTypeIdentifier:", v5))
  {
    -[SKAStatusServer _senderHandlesForChannel:](self, "_senderHandlesForChannel:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKAStatusServer logger](SKAStatusServer, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "allObjects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v8;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Writing to Biome event with IDSHandle: %@, statusTypeIdentifier %@", (uint8_t *)&v16, 0x16u);

    }
    BiomeLibrary();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UserFocus");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "StatusChange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc(MEMORY[0x24BE0C828]);
    objc_msgSend(v6, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithIdsHandle:statusChangeType:idsHandles:", 0, v5, v13);

    objc_msgSend(v11, "source");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sendEvent:", v14);

  }
}

- (id)_senderHandlesForChannel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)-[SKADatabaseManaging newBackgroundContext](self->_databaseManager, "newBackgroundContext");
  -[SKADatabaseManaging receivedInvitationsForChannel:databaseContext:](self->_databaseManager, "receivedInvitationsForChannel:databaseContext:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "senderHandle", (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v13, "senderHandle");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v16 = (void *)objc_msgSend(v7, "copy");
  return v16;
}

- (BOOL)_shouldDonateToBiomeForStatusTypeIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("BiomeDonationEnabled"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && !objc_msgSend(v5, "BOOLValue"))
      v7 = 0;
    else
      v7 = objc_msgSend(&unk_24D98DE38, "containsObject:", v3);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)databaseManager:(id)a3 didCreateChannel:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, "Channel created with identifier: %@ type: %@", (uint8_t *)&v11, 0x16u);
  }

  if (objc_msgSend(v5, "isPersonal"))
  {
    +[SKAStatusServer logger](SKAStatusServer, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_2188DF000, v9, OS_LOG_TYPE_DEFAULT, "Updating registered subscription to allow self subscription to personal channel, if necessary", (uint8_t *)&v11, 2u);
    }

    -[SKAStatusServer subscriptionManager](self, "subscriptionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateRegisteredSubscriptionsForActiveAssertionsWithCompletion:", &__block_literal_global_46);

  }
}

void __52__SKAStatusServer_databaseManager_didCreateChannel___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];

  v2 = a2;
  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __52__SKAStatusServer_databaseManager_didCreateChannel___block_invoke_cold_1((uint64_t)v2, v4, v5);
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Updating registered subscription to allow self subscriptions completed", v6, 2u);
  }

}

- (void)presenceManager:(id)a3 didReceivePresentDevicesUpdateForPresenceIdentifier:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *presenceConnectionQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Server received present devices update on presence identifier: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  presenceConnectionQueue = self->_presenceConnectionQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __87__SKAStatusServer_presenceManager_didReceivePresentDevicesUpdateForPresenceIdentifier___block_invoke;
  v9[3] = &unk_24D977800;
  objc_copyWeak(&v11, (id *)buf);
  v10 = v5;
  v8 = v5;
  dispatch_async(presenceConnectionQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __87__SKAStatusServer_presenceManager_didReceivePresentDevicesUpdateForPresenceIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(WeakRetained, "presenceConnectedClients", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "handleReceivedPresentDevicesUpdateForPresenceIdentifier:", *(_QWORD *)(a1 + 32));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)presenceManager:(id)a3 didCreateChannel:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "New presence channel created. Sending self invite for channel: %@", (uint8_t *)&v9, 0xCu);
  }

  -[SKAStatusServer invitationManager](self, "invitationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presenceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendSelfInvitationForPresenceChannelWithPresenceIdentifier:isPersonal:completion:", v8, objc_msgSend(v5, "isPersonal"), &__block_literal_global_48);

}

void __52__SKAStatusServer_presenceManager_didCreateChannel___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = a2;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Sent self-invite with success:%d and error:%@", (uint8_t *)v6, 0x12u);
  }

}

- (void)presenceManager:(id)a3 didRequestToRollChannel:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = a4;
  -[SKAStatusServer invitationManager](self, "invitationManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presenceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isPersonal");

  objc_msgSend(v8, "rollPresenceChannelWithPresenceIdentifier:isPersonal:completion:", v6, v7, &__block_literal_global_50);
}

void __59__SKAStatusServer_presenceManager_didRequestToRollChannel___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "Finished rolling channel with success %d", (uint8_t *)v4, 8u);
  }

}

- (void)invitationManager:(id)a3 didReceiveInvitation:(id)a4 forChannel:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *presenceConnectionQueue;
  id *v14;
  id *v15;
  id v16;
  _QWORD *v17;
  NSObject *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  uint8_t v26[16];
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v10;
    _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Received channel invitation on channel: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  if (objc_msgSend(v9, "invitationType"))
  {
    +[SKAStatusServer logger](SKAStatusServer, "logger");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_2188DF000, v12, OS_LOG_TYPE_DEFAULT, "Handling invitation as presence invite", v26, 2u);
    }

    -[SKAStatusServer _notifyPresenceClientsIfNeededOfChannelChangeForChannel:](self, "_notifyPresenceClientsIfNeededOfChannelChangeForChannel:", v10);
    presenceConnectionQueue = self->_presenceConnectionQueue;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __69__SKAStatusServer_invitationManager_didReceiveInvitation_forChannel___block_invoke_51;
    v20[3] = &unk_24D977800;
    v14 = &v22;
    objc_copyWeak(&v22, (id *)buf);
    v15 = &v21;
    v21 = v10;
    v16 = v10;
    v17 = v20;
  }
  else
  {
    +[SKAStatusServer logger](SKAStatusServer, "logger");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_2188DF000, v18, OS_LOG_TYPE_DEFAULT, "Handling invitation as status invite", v26, 2u);
    }

    presenceConnectionQueue = self->_subscriptionServiceConnectionQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__SKAStatusServer_invitationManager_didReceiveInvitation_forChannel___block_invoke;
    block[3] = &unk_24D977800;
    v14 = &v25;
    objc_copyWeak(&v25, (id *)buf);
    v15 = &v24;
    v24 = v10;
    v19 = v10;
    v17 = block;
  }
  dispatch_async(presenceConnectionQueue, v17);

  objc_destroyWeak(v14);
  objc_destroyWeak((id *)buf);

}

void __69__SKAStatusServer_invitationManager_didReceiveInvitation_forChannel___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(WeakRetained, "subscriptionServiceConnectedClients", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "handleReceivedInvitationForChannel:", *(_QWORD *)(a1 + 32));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

void __69__SKAStatusServer_invitationManager_didReceiveInvitation_forChannel___block_invoke_51(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(WeakRetained, "presenceConnectedClients", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 32), "presenceIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleReceivedInvitationForPresenceIdentifier:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)_notifyPresenceClientsIfNeededOfChannelChangeForChannel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *presenceConnectionQueue;
  _QWORD block[4];
  id v14;
  id v15;
  id location;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)-[SKADatabaseManaging newBackgroundContext](self->_databaseManager, "newBackgroundContext");
  objc_msgSend(v4, "presenceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  if (v6)
  {
    -[SKADatabaseManaging existingChannelForPresenceIdentifier:isPersonal:databaseContext:](self->_databaseManager, "existingChannelForPresenceIdentifier:isPersonal:databaseContext:", v6, objc_msgSend(v4, "isPersonal"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10)
    {
      +[SKAStatusServer logger](SKAStatusServer, "logger");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v6;
        _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "New received invitation for presence identifier %@ updated the mapped channel.  Notifying connected clients to reassert if needed", buf, 0xCu);
      }

      presenceConnectionQueue = self->_presenceConnectionQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __75__SKAStatusServer__notifyPresenceClientsIfNeededOfChannelChangeForChannel___block_invoke;
      block[3] = &unk_24D977800;
      objc_copyWeak(&v15, &location);
      v14 = v6;
      dispatch_async(presenceConnectionQueue, block);

      objc_destroyWeak(&v15);
    }

  }
  objc_destroyWeak(&location);

}

void __75__SKAStatusServer__notifyPresenceClientsIfNeededOfChannelChangeForChannel___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(WeakRetained, "presenceConnectedClients", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "refreshAssertionsForPresenceIdentifier:", *(_QWORD *)(a1 + 32));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)invitationManager:(id)a3 didRevokeInvitationOnChannel:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SKAStatusPublishingManaging *publishingManager;
  NSObject *v20;
  uint64_t v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v5;
    _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Revoked invitation(s) on channel: %@. Republishing current status", buf, 0xCu);
  }

  objc_msgSend(v5, "statusType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)-[SKADatabaseManaging newBackgroundContext](self->_databaseManager, "newBackgroundContext");
  -[SKADatabaseManaging existingStatusForChannel:databaseContext:](self->_databaseManager, "existingStatusForChannel:databaseContext:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "rawData");
    v11 = objc_claimAutoreleasedReturnValue();
    -[SKAStatusEncryptionManaging decryptStatusPayloadFromStatusEnvelopeData:channel:](self->_encryptionManager, "decryptStatusPayloadFromStatusEnvelopeData:channel:", v11, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "statusPayload");
      v21 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1098]), "initWithStatusPayload:isScheduledRequest:", v21, 0);
      objc_msgSend(v10, "dateCreated");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dateByAddingTimeInterval:", 1.0);
      v16 = v8;
      v17 = v7;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setDateCreated:", v18);

      v7 = v17;
      v8 = v16;

      publishingManager = self->_publishingManager;
      v20 = v21;
      -[SKAStatusPublishingManaging publishStatusRequest:statusTypeIdentifier:afterTime:isPendingPublish:completion:](publishingManager, "publishStatusRequest:statusTypeIdentifier:afterTime:isPendingPublish:completion:", v14, v7, 0, &__block_literal_global_54, 0.0);

    }
    else
    {
      +[SKAStatusServer logger](SKAStatusServer, "logger");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[SKAStatusServer invitationManager:didRevokeInvitationOnChannel:].cold.1();
    }

  }
  else
  {
    +[SKAStatusServer logger](SKAStatusServer, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "No current status to republish", buf, 2u);
    }
  }

}

void __66__SKAStatusServer_invitationManager_didRevokeInvitationOnChannel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Finished republishing status.  ID:%@ error:%@", (uint8_t *)&v7, 0x16u);
  }

}

- (BOOL)_kettleFeatureEnabled
{
  if (_kettleFeatureEnabled_onceToken != -1)
    dispatch_once(&_kettleFeatureEnabled_onceToken, &__block_literal_global_55);
  return _kettleFeatureEnabled_kettleEnabled;
}

uint64_t __40__SKAStatusServer__kettleFeatureEnabled__block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  _kettleFeatureEnabled_kettleEnabled = result;
  return result;
}

- (BOOL)_inTextTrafficMode
{
  void *v2;
  char v3;

  objc_msgSend((id)MEMORY[0x219A1D12C](CFSTR("LockdownModeManager"), CFSTR("LockdownMode")), "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enabled");

  return v3;
}

- (void)_setupMaintenanceActivity
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)*MEMORY[0x24BDAC5A0];
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __44__SKAStatusServer__setupMaintenanceActivity__block_invoke;
  v3[3] = &unk_24D977968;
  objc_copyWeak(&v4, &location);
  xpc_activity_register("com.apple.statuskit.maintenance", v2, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __44__SKAStatusServer__setupMaintenanceActivity__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  id WeakRetained;
  xpc_activity_state_t state;
  xpc_object_t v6;
  xpc_object_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  xpc_object_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    objc_msgSend(WeakRetained, "subscriptionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateRegisteredSubscriptionsForActiveAssertionsWithCompletion:", &__block_literal_global_64);

    objc_msgSend(WeakRetained, "databaseManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (xpc_object_t)objc_msgSend(v11, "newBackgroundContext");

    +[SKAStatusServer logger](SKAStatusServer, "logger");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_2188DF000, v12, OS_LOG_TYPE_DEFAULT, "Removing decomissioned channels", (uint8_t *)&v13, 2u);
    }

    objc_msgSend(WeakRetained, "databaseManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cleanupDecommisionedChannelsWithDatabaseContext:", v6);
    goto LABEL_12;
  }
  if (!state)
  {
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v6, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A0]);
    xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x24BDAC598], 0);
    xpc_dictionary_set_int64(v6, (const char *)*MEMORY[0x24BDAC5F0], *MEMORY[0x24BDAC600]);
    xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x24BDAC6E0], 1);
    v7 = xpc_activity_copy_criteria(v3);
    v8 = v7;
    if (!v7 || !xpc_equal(v7, v6))
      xpc_activity_set_criteria(v3, v6);
    +[SKAStatusServer logger](SKAStatusServer, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v6;
      _os_log_impl(&dword_2188DF000, v9, OS_LOG_TYPE_DEFAULT, "Scheduling maintenance XPC activity %@", (uint8_t *)&v13, 0xCu);
    }

LABEL_12:
  }

}

void __44__SKAStatusServer__setupMaintenanceActivity__block_invoke_63(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  +[SKAStatusServer logger](SKAStatusServer, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "Finished maintenance subscription update with error %@", (uint8_t *)&v4, 0xCu);
  }

}

- (NSArray)idsDevices
{
  return (NSArray *)-[SKAMessagingProviding idsDevices](self->_invitationMessagingProvider, "idsDevices");
}

- (id)registerIDSDeviceChangedObserver:(id)a3
{
  return (id)-[SKAMessagingProviding registerIDSDeviceChangedObserver:](self->_invitationMessagingProvider, "registerIDSDeviceChangedObserver:", a3);
}

- (void)unregisterIDSDeviceChangedObserver:(id)a3
{
  -[SKAMessagingProviding unregisterIDSDeviceChangedObserver:](self->_invitationMessagingProvider, "unregisterIDSDeviceChangedObserver:", a3);
}

- (SKADatabaseProviding)databaseProvider
{
  return self->_databaseProvider;
}

- (void)setDatabaseProvider:(id)a3
{
  objc_storeStrong((id *)&self->_databaseProvider, a3);
}

- (NSXPCListener)publishingServiceListener
{
  return self->_publishingServiceListener;
}

- (void)setPublishingServiceListener:(id)a3
{
  objc_storeStrong((id *)&self->_publishingServiceListener, a3);
}

- (OS_dispatch_queue)publishingServiceConnectionQueue
{
  return self->_publishingServiceConnectionQueue;
}

- (void)setPublishingServiceConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_publishingServiceConnectionQueue, a3);
}

- (NSMutableArray)publishingServiceConnectedClients
{
  return self->_publishingServiceConnectedClients;
}

- (void)setPublishingServiceConnectedClients:(id)a3
{
  objc_storeStrong((id *)&self->_publishingServiceConnectedClients, a3);
}

- (NSXPCListener)subscriptionServiceListener
{
  return self->_subscriptionServiceListener;
}

- (void)setSubscriptionServiceListener:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionServiceListener, a3);
}

- (OS_dispatch_queue)subscriptionServiceConnectionQueue
{
  return self->_subscriptionServiceConnectionQueue;
}

- (void)setSubscriptionServiceConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionServiceConnectionQueue, a3);
}

- (NSMutableArray)subscriptionServiceConnectedClients
{
  return self->_subscriptionServiceConnectedClients;
}

- (void)setSubscriptionServiceConnectedClients:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionServiceConnectedClients, a3);
}

- (NSXPCListener)presenceListener
{
  return self->_presenceListener;
}

- (void)setPresenceListener:(id)a3
{
  objc_storeStrong((id *)&self->_presenceListener, a3);
}

- (OS_dispatch_queue)presenceConnectionQueue
{
  return self->_presenceConnectionQueue;
}

- (void)setPresenceConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_presenceConnectionQueue, a3);
}

- (NSMutableArray)presenceConnectedClients
{
  return self->_presenceConnectedClients;
}

- (void)setPresenceConnectedClients:(id)a3
{
  objc_storeStrong((id *)&self->_presenceConnectedClients, a3);
}

- (SKADatabaseManaging)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
  objc_storeStrong((id *)&self->_databaseManager, a3);
}

- (OS_dispatch_queue)invitationManagerMessagingQueue
{
  return self->_invitationManagerMessagingQueue;
}

- (void)setInvitationManagerMessagingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_invitationManagerMessagingQueue, a3);
}

- (SKAMessagingProviding)invitationMessagingProvider
{
  return self->_invitationMessagingProvider;
}

- (void)setInvitationMessagingProvider:(id)a3
{
  objc_storeStrong((id *)&self->_invitationMessagingProvider, a3);
}

- (SKAInvitationManaging)invitationManager
{
  return self->_invitationManager;
}

- (void)setInvitationManager:(id)a3
{
  objc_storeStrong((id *)&self->_invitationManager, a3);
}

- (SKAChannelManaging)channelManager
{
  return self->_channelManager;
}

- (void)setChannelManager:(id)a3
{
  objc_storeStrong((id *)&self->_channelManager, a3);
}

- (SKAStatusPublishingManaging)publishingManager
{
  return self->_publishingManager;
}

- (void)setPublishingManager:(id)a3
{
  objc_storeStrong((id *)&self->_publishingManager, a3);
}

- (SKAStatusSubscriptionManaging)subscriptionManager
{
  return self->_subscriptionManager;
}

- (void)setSubscriptionManager:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionManager, a3);
}

- (SKAPresenceManaging)presenceManager
{
  return self->_presenceManager;
}

- (void)setPresenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_presenceManager, a3);
}

- (SKAStatusEncryptionManaging)encryptionManager
{
  return self->_encryptionManager;
}

- (void)setEncryptionManager:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionManager, a3);
}

- (SKAStatusReceivingManaging)statusReceivingManager
{
  return self->_statusReceivingManager;
}

- (void)setStatusReceivingManager:(id)a3
{
  objc_storeStrong((id *)&self->_statusReceivingManager, a3);
}

- (BOOL)trafficModeEnabled
{
  return self->_trafficModeEnabled;
}

- (void)setTrafficModeEnabled:(BOOL)a3
{
  self->_trafficModeEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusReceivingManager, 0);
  objc_storeStrong((id *)&self->_encryptionManager, 0);
  objc_storeStrong((id *)&self->_presenceManager, 0);
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_storeStrong((id *)&self->_publishingManager, 0);
  objc_storeStrong((id *)&self->_channelManager, 0);
  objc_storeStrong((id *)&self->_invitationManager, 0);
  objc_storeStrong((id *)&self->_invitationMessagingProvider, 0);
  objc_storeStrong((id *)&self->_invitationManagerMessagingQueue, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_presenceConnectedClients, 0);
  objc_storeStrong((id *)&self->_presenceConnectionQueue, 0);
  objc_storeStrong((id *)&self->_presenceListener, 0);
  objc_storeStrong((id *)&self->_subscriptionServiceConnectedClients, 0);
  objc_storeStrong((id *)&self->_subscriptionServiceConnectionQueue, 0);
  objc_storeStrong((id *)&self->_subscriptionServiceListener, 0);
  objc_storeStrong((id *)&self->_publishingServiceConnectedClients, 0);
  objc_storeStrong((id *)&self->_publishingServiceConnectionQueue, 0);
  objc_storeStrong((id *)&self->_publishingServiceListener, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
}

- (void)listener:(NSObject *)a3 shouldAcceptNewConnection:.cold.1(void *a1, const char *a2, NSObject *a3)
{
  uint8_t v5[12];
  __int16 v6;
  const char *v7;

  OUTLINED_FUNCTION_5_2(a1, a2);
  OUTLINED_FUNCTION_4_0();
  v6 = 2114;
  v7 = a2;
  _os_log_fault_impl(&dword_2188DF000, a3, OS_LOG_TYPE_FAULT, "Receiving XPC connection from PID %ld for unknown service name: %{public}@", v5, 0x16u);
  OUTLINED_FUNCTION_12_0();
}

- (void)_publishingServiceListener:(void *)a1 shouldAcceptNewConnection:(char *)a2 .cold.1(void *a1, char *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_5_2(a1, a2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1(&dword_2188DF000, a2, v3, "Rejected XPC connection from PID %ld for publishing service. Client is not entitled for any publishing service.", v4);
  OUTLINED_FUNCTION_12_0();
}

- (void)_presenceServiceListener:(void *)a1 shouldAcceptNewConnection:(char *)a2 .cold.1(void *a1, char *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const __CFString *v7;

  v4 = 134218242;
  v5 = (int)OUTLINED_FUNCTION_5_2(a1, a2);
  v6 = 2112;
  v7 = CFSTR("com.apple.StatusKit.presence.clientID");
  OUTLINED_FUNCTION_5_0(&dword_2188DF000, a2, v3, "Rejecting incoming XPC connection from PID %ld because of missing or blank entitlement: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_12_0();
}

- (void)_subscriptionServiceListener:(void *)a1 shouldAcceptNewConnection:(char *)a2 .cold.1(void *a1, char *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_5_2(a1, a2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1(&dword_2188DF000, a2, v3, "Rejected XPC connection from PID %ld for subscription service. Client is not entitled for any subscription service.", v4);
  OUTLINED_FUNCTION_12_0();
}

void __62__SKAStatusServer_databaseDidReceiveRemoteChangesForChannels___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_2_1(&dword_2188DF000, a2, a3, "Error updating subscriptions following remote database changes: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

void __62__SKAStatusServer_databaseDidReceiveRemoteChangesForChannels___block_invoke_37_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Could not find any database channel matching changed channelIdentifiers", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)channelManager:didReceiveData:onChannel:identifier:dateReceived:dateExpired:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Unable to find database channel for channel id for incoming message", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)channelManager:didReceiveData:onChannel:identifier:dateReceived:dateExpired:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "We're in traffic mode--dropping incoming status", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)channelManager:didReceiveData:onChannel:identifier:dateReceived:dateExpired:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Unrecognized channel type for incoming message", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)channelManager:(uint64_t)a1 failedToSubscribeToChannel:(uint64_t)a2 withError:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_5_0(&dword_2188DF000, a3, (uint64_t)a3, "Failed to subscribe to channel %@ with error: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

void __52__SKAStatusServer_databaseManager_didCreateChannel___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_2_1(&dword_2188DF000, a2, a3, "Updating registered subscription failed with error: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

- (void)invitationManager:didRevokeInvitationOnChannel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Couldn't decrypt current status on channel", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
