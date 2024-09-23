@implementation TRIXPCInternalSystemServiceListener

- (TRIXPCInternalSystemServiceListener)init
{
  TRIXPCInternalSystemServiceListener *v2;
  TRIInternalSystemServiceRequestHandler *v3;
  TRIXPCInternalSystemServiceWrapper *v4;
  TRIXPCInternalSystemServiceWrapper *wrapper;
  uint64_t v6;
  NSXPCInterface *interface;
  NSXPCInterface *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSXPCInterface *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSXPCInterface *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)TRIXPCInternalSystemServiceListener;
  v2 = -[TRIXPCInternalSystemServiceListener init](&v31, sel_init);
  if (v2)
  {
    v30 = (void *)objc_opt_new();
    v3 = -[TRIInternalSystemServiceRequestHandler initWithEntitlementWitness:]([TRIInternalSystemServiceRequestHandler alloc], "initWithEntitlementWitness:", v30);
    v4 = -[TRIXPCInternalSystemServiceWrapper initWithUnderlyingHandler:]([TRIXPCInternalSystemServiceWrapper alloc], "initWithUnderlyingHandler:", v3);

    wrapper = v2->_wrapper;
    v2->_wrapper = v4;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC7F860);
    v6 = objc_claimAutoreleasedReturnValue();
    interface = v2->_interface;
    v2->_interface = (NSXPCInterface *)v6;

    v8 = v2->_interface;
    v9 = (void *)MEMORY[0x1D8232A5C]();
    v10 = objc_alloc(MEMORY[0x1E0C99E60]);
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = (void *)objc_msgSend(v10, "initWithObjects:", v11, v12, v13, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v9);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v8, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_overwriteGlobalActiveFactorProvidersWithNamespaceMap_factorPackMap_rolloutDeploymentMap_completion_, 0, 0);

    v15 = v2->_interface;
    v16 = (void *)MEMORY[0x1D8232A5C]();
    v17 = objc_alloc(MEMORY[0x1E0C99E60]);
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = (void *)objc_msgSend(v17, "initWithObjects:", v18, v19, v20, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v16);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v15, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_overwriteGlobalActiveFactorProvidersWithNamespaceMap_factorPackMap_rolloutDeploymentMap_completion_, 1, 0);

    v22 = v2->_interface;
    v23 = (void *)MEMORY[0x1D8232A5C]();
    v24 = objc_alloc(MEMORY[0x1E0C99E60]);
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    v27 = objc_opt_class();
    v28 = (void *)objc_msgSend(v24, "initWithObjects:", v25, v26, v27, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v23);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v22, "setClasses:forSelector:argumentIndex:ofReply:", v28, sel_overwriteGlobalActiveFactorProvidersWithNamespaceMap_factorPackMap_rolloutDeploymentMap_completion_, 2, 0);

  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v4;
  NSXPCInterface *interface;
  TRIXPCInternalSystemServiceWrapper *wrapper;
  id v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0D81650];
  wrapper = self->_wrapper;
  interface = self->_interface;
  v7 = a4;
  TRILogCategory_Server();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "shouldAcceptConnection:serviceName:whitelistedServerInterface:whitelistedClientInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:logHandle:", v7, CFSTR("com.apple.triald.system.internal"), interface, 0, wrapper, &__block_literal_global_14, 0, &__block_literal_global_111, &__block_literal_global_112, v8);

  return (char)v4;
}

uint64_t __74__TRIXPCInternalSystemServiceListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D81650];
  v3 = a2;
  TRILogCategory_Server();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "checkForAndLogTrueBooleanEntitlement:connection:serviceName:logHandle:", CFSTR("com.apple.triald.system.internal"), v3, CFSTR("com.apple.triald.system.internal"), v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_wrapper, 0);
}

@end
