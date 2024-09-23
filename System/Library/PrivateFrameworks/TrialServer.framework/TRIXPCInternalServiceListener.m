@implementation TRIXPCInternalServiceListener

- (TRIXPCInternalServiceListener)initWithServerContextPromise:(id)a3
{
  id v5;
  TRIXPCInternalServiceListener *v6;
  TRIXPCInternalServiceListener *v7;
  uint64_t v8;
  NSXPCInterface *interface;
  NSXPCInterface *v10;
  void *v11;
  void *v12;
  NSXPCInterface *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TRIXPCInternalServiceListener;
  v6 = -[TRIXPCInternalServiceListener init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_promise, a3);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC7E850);
    v8 = objc_claimAutoreleasedReturnValue();
    interface = v7->_interface;
    v7->_interface = (NSXPCInterface *)v8;

    v10 = v7->_interface;
    +[TRITaskSupport sharedInstance](TRITaskSupport, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "XPCTaskAllowlist");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v10, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_submitTask_options_completion_, 0, 0);

    v13 = v7->_interface;
    v14 = (void *)MEMORY[0x1D8232A5C]();
    v15 = objc_alloc(MEMORY[0x1E0C99E60]);
    v16 = objc_opt_class();
    v17 = (void *)objc_msgSend(v15, "initWithObjects:", v16, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v14);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v13, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_setSubscription_namespaceName_completion_, 0, 0);

  }
  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  TRIInternalServiceRequestHandler *v7;
  TRIXPCServerContextPromise *promise;
  TRIInternalServiceRequestHandler *v9;
  TRIXPCInternalServiceWrapper *v10;
  void *v11;
  NSXPCInterface *interface;
  void *v13;
  _OWORD v15[2];

  v5 = a4;
  v6 = (void *)objc_opt_new();
  v7 = [TRIInternalServiceRequestHandler alloc];
  promise = self->_promise;
  if (v5)
    objc_msgSend(v5, "auditToken");
  else
    memset(v15, 0, sizeof(v15));
  v9 = -[TRIInternalServiceRequestHandler initWithPromise:auditToken:entitlementWitness:](v7, "initWithPromise:auditToken:entitlementWitness:", promise, v15, v6);
  v10 = -[TRIXPCInternalServiceWrapper initWithUnderlyingHandler:]([TRIXPCInternalServiceWrapper alloc], "initWithUnderlyingHandler:", v9);

  v11 = (void *)MEMORY[0x1E0D81650];
  interface = self->_interface;
  TRILogCategory_Server();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(interface) = objc_msgSend(v11, "shouldAcceptConnection:serviceName:whitelistedServerInterface:whitelistedClientInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:logHandle:", v5, CFSTR("com.apple.triald.internal"), interface, 0, v10, &__block_literal_global_280, 0, &__block_literal_global_281, &__block_literal_global_282, v13);

  return (char)interface;
}

uint64_t __68__TRIXPCInternalServiceListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D81650];
  v3 = a2;
  TRILogCategory_Server();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "checkForAndLogTrueBooleanEntitlement:connection:serviceName:logHandle:", CFSTR("com.apple.triald.internal"), v3, CFSTR("com.apple.triald.internal"), v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_promise, 0);
}

@end
