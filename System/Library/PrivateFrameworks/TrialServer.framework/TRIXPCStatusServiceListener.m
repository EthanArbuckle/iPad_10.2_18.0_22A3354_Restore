@implementation TRIXPCStatusServiceListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  TRIXPCStatusRequestHandler *v6;
  TRIXPCServerContextPromise *promise;
  TRIXPCStatusRequestHandler *v8;
  TRIXPCStatusServiceWrapper *v9;
  void *v10;
  NSXPCInterface *interface;
  void *v12;
  _OWORD v14[2];

  v5 = a4;
  v6 = [TRIXPCStatusRequestHandler alloc];
  promise = self->_promise;
  if (v5)
    objc_msgSend(v5, "auditToken");
  else
    memset(v14, 0, sizeof(v14));
  v8 = -[TRIXPCStatusRequestHandler initWithPromise:auditToken:](v6, "initWithPromise:auditToken:", promise, v14);
  v9 = -[TRIXPCStatusServiceWrapper initWithUnderlyingHandler:]([TRIXPCStatusServiceWrapper alloc], "initWithUnderlyingHandler:", v8);

  v10 = (void *)MEMORY[0x1E0D81650];
  interface = self->_interface;
  TRILogCategory_Server();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(interface) = objc_msgSend(v10, "shouldAcceptConnection:serviceName:whitelistedServerInterface:whitelistedClientInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:logHandle:", v5, CFSTR("com.apple.trial.status"), interface, 0, v9, &__block_literal_global_32, 0, &__block_literal_global_149, &__block_literal_global_150, v12);

  return (char)interface;
}

uint64_t __66__TRIXPCStatusServiceListener_listener_shouldAcceptNewConnection___block_invoke()
{
  return 1;
}

- (TRIXPCStatusServiceListener)initWithPromise:(id)a3
{
  id v6;
  TRIXPCStatusServiceListener *v7;
  TRIXPCStatusServiceListener *v8;
  uint64_t v9;
  NSXPCInterface *interface;
  NSXPCInterface *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v17;
  objc_super v18;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCStatusService.m"), 812, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("promise"));

  }
  v18.receiver = self;
  v18.super_class = (Class)TRIXPCStatusServiceListener;
  v7 = -[TRIXPCStatusServiceListener init](&v18, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_promise, a3);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC7F1B8);
    v9 = objc_claimAutoreleasedReturnValue();
    interface = v8->_interface;
    v8->_interface = (NSXPCInterface *)v9;

    v11 = v8->_interface;
    v12 = (void *)MEMORY[0x1D8232A5C]();
    v13 = objc_alloc(MEMORY[0x1E0C99E60]);
    v14 = objc_opt_class();
    v15 = (void *)objc_msgSend(v13, "initWithObjects:", v14, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v12);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v11, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion_, 0, 0);

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promise, 0);
  objc_storeStrong((id *)&self->_interface, 0);
}

@end
