@implementation SYDocumentWorkflowsService

+ (id)serviceName
{
  return CFSTR("com.apple.synapse.DocumentWorkflowsService");
}

- (SYDocumentWorkflowsService)init
{
  SYDocumentWorkflowsService *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *serviceQueue;
  SYDocumentWorkflowsRepository *v6;
  SYDocumentWorkflowsRepository *repository;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SYDocumentWorkflowsService;
  v2 = -[SYDocumentWorkflowsService init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.synapse.DocumentWorkflowsService", v3);
    serviceQueue = v2->_serviceQueue;
    v2->_serviceQueue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(SYDocumentWorkflowsRepository);
    repository = v2->_repository;
    v2->_repository = v6;

  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  NSXPCListener *listener;
  objc_super v5;
  uint8_t buf[16];

  v3 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCC38000, v3, OS_LOG_TYPE_INFO, "Document Workflows Service deallocated", buf, 2u);
  }

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  listener = self->_listener;
  self->_listener = 0;

  v5.receiver = self;
  v5.super_class = (Class)SYDocumentWorkflowsService;
  -[SYDocumentWorkflowsService dealloc](&v5, sel_dealloc);
}

- (void)beginListeningToConnections
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  -[SYDocumentWorkflowsService listener](self, "listener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1BCC38000, v4, OS_LOG_TYPE_INFO, "Starting Document Workflows Service...", v12, 2u);
    }

    v5 = objc_alloc(MEMORY[0x1E0CB3B58]);
    objc_msgSend((id)objc_opt_class(), "serviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithMachServiceName:", v6);
    -[SYDocumentWorkflowsService setListener:](self, "setListener:", v7);

    -[SYDocumentWorkflowsService listener](self, "listener");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYDocumentWorkflowsService serviceQueue](self, "serviceQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setQueue:", v9);

    -[SYDocumentWorkflowsService listener](self, "listener");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", self);

    -[SYDocumentWorkflowsService listener](self, "listener");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resume");

  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  SYDocumentWorkflowsServiceHandle *v11;
  NSObject *v12;
  _DWORD v14[2];
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SYDocumentWorkflowsService listener](self, "listener");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[SYDocumentWorkflowsService serviceQueue](self, "serviceQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setQueue:", v9);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF497620);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v10);

    v11 = -[SYDocumentWorkflowsServiceHandle initWithRepository:]([SYDocumentWorkflowsServiceHandle alloc], "initWithRepository:", self->_repository);
    objc_msgSend(v7, "setExportedObject:", v11);

    objc_msgSend(v7, "resume");
  }
  v12 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v14[0] = 67109376;
    v14[1] = objc_msgSend(v7, "processIdentifier");
    v15 = 1024;
    v16 = v8 == v6;
    _os_log_impl(&dword_1BCC38000, v12, OS_LOG_TYPE_INFO, "Service should accept new connection from PID: %d, accepted: %d", (uint8_t *)v14, 0xEu);
  }

  return v8 == v6;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (OS_dispatch_queue)serviceQueue
{
  return self->_serviceQueue;
}

- (void)setServiceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serviceQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_repository, 0);
}

@end
