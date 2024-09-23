@implementation TRIXPCNamespaceManagementServiceListener

- (TRIXPCNamespaceManagementServiceListener)initWithServerContextPromise:(id)a3
{
  id v5;
  TRIXPCNamespaceManagementServiceListener *v6;
  uint64_t v7;
  NSXPCInterface *interface;
  NSXPCInterface *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSXPCInterface *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  NSXPCInterface *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  NSXPCInterface *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSXPCInterface *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  objc_super v36;

  v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)TRIXPCNamespaceManagementServiceListener;
  v6 = -[TRIXPCNamespaceManagementServiceListener init](&v36, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC7EE50);
    v7 = objc_claimAutoreleasedReturnValue();
    interface = v6->_interface;
    v6->_interface = (NSXPCInterface *)v7;

    v9 = v6->_interface;
    v10 = (void *)MEMORY[0x1D8232A5C]();
    v11 = objc_alloc(MEMORY[0x1E0C99E60]);
    v12 = objc_opt_class();
    v13 = (void *)objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v10);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v9, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_startDownloadLevelsForFactors_withNamespace_factorsState_options_completion_, 0, 0);

    v14 = v6->_interface;
    v15 = (void *)MEMORY[0x1D8232A5C]();
    v16 = objc_alloc(MEMORY[0x1E0C99E60]);
    v17 = objc_opt_class();
    v18 = (void *)objc_msgSend(v16, "initWithObjects:", v17, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v15);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v14, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_immediateDownloadForNamespaceNames_allowExpensiveNetworking_completion_, 0, 0);

    v19 = v6->_interface;
    v20 = (void *)MEMORY[0x1D8232A5C]();
    v21 = objc_alloc(MEMORY[0x1E0C99E60]);
    v22 = objc_opt_class();
    v23 = (void *)objc_msgSend(v21, "initWithObjects:", v22, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v20);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v19, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_completion_, 0, 0);

    v24 = v6->_interface;
    v25 = (void *)MEMORY[0x1D8232A5C]();
    v26 = objc_alloc(MEMORY[0x1E0C99E60]);
    v27 = objc_opt_class();
    v28 = objc_opt_class();
    v29 = (void *)objc_msgSend(v26, "initWithObjects:", v27, v28, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v25);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v24, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_setPurgeabilityLevelsForFactors_forNamespaceName_completion_, 0, 0);

    v30 = v6->_interface;
    v31 = (void *)MEMORY[0x1D8232A5C]();
    v32 = objc_alloc(MEMORY[0x1E0C99E60]);
    v33 = objc_opt_class();
    v34 = (void *)objc_msgSend(v32, "initWithObjects:", v33, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v31);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v30, "setClasses:forSelector:argumentIndex:ofReply:", v34, sel_statusOfDownloadForFactors_withNamespace_factorsState_completion_, 0, 0);

    objc_storeStrong((id *)&v6->_promise, a3);
  }

  return v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  id v8;
  TRIXPCNamespaceManagementRequestHandler *v9;
  TRIXPCServerContextPromise *promise;
  TRIXPCNamespaceManagementRequestHandler *v11;
  TRIXPCNamespaceManagementServiceWrapper *v12;
  void *v13;
  NSXPCInterface *interface;
  void *v15;
  _OWORD v17[2];
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__TRIXPCNamespaceManagementServiceListener_listener_shouldAcceptNewConnection___block_invoke;
  block[3] = &unk_1E932F918;
  block[4] = self;
  if (qword_1EFC74318 != -1)
    dispatch_once(&qword_1EFC74318, block);
  v8 = (id)qword_1EFC74310;
  objc_msgSend(v7, "_setQueue:", v8);
  v9 = [TRIXPCNamespaceManagementRequestHandler alloc];
  promise = self->_promise;
  if (v7)
    objc_msgSend(v7, "auditToken");
  else
    memset(v17, 0, sizeof(v17));
  v11 = -[TRIXPCNamespaceManagementRequestHandler initWithServerContextPromise:auditToken:](v9, "initWithServerContextPromise:auditToken:", promise, v17);
  v12 = -[TRIXPCNamespaceManagementServiceWrapper initWithUnderlyingHandler:]([TRIXPCNamespaceManagementServiceWrapper alloc], "initWithUnderlyingHandler:", v11);

  v13 = (void *)MEMORY[0x1E0D81650];
  interface = self->_interface;
  TRILogCategory_Server();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(interface) = objc_msgSend(v13, "shouldAcceptConnection:serviceName:whitelistedServerInterface:whitelistedClientInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:logHandle:", v7, CFSTR("com.apple.triald.namespace-management"), interface, 0, v12, &__block_literal_global_396, 0, &__block_literal_global_397, &__block_literal_global_398, v15);

  return (char)interface;
}

void __79__TRIXPCNamespaceManagementServiceListener_listener_shouldAcceptNewConnection___block_invoke()
{
  void *v0;
  void *v1;
  objc_class *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)MEMORY[0x1D8232A5C]();
  v1 = (void *)MEMORY[0x1E0D81598];
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v1, "autoreleasingSerialQueueWithLabel:qosClass:", objc_msgSend(v3, "UTF8String"), 17);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1EFC74310;
  qword_1EFC74310 = v4;

  objc_autoreleasePoolPop(v0);
}

uint64_t __79__TRIXPCNamespaceManagementServiceListener_listener_shouldAcceptNewConnection___block_invoke_2()
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promise, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_serverContext, 0);
  objc_storeStrong((id *)&self->_interface, 0);
}

@end
