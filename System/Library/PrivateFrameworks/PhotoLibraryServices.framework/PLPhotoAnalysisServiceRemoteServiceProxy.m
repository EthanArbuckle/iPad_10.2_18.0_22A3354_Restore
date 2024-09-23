@implementation PLPhotoAnalysisServiceRemoteServiceProxy

- (PLPhotoAnalysisServiceRemoteServiceProxy)initWithServiceProvider:(id)a3 remoteInterface:(id)a4 synchronous:(BOOL)a5 errorHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  PLPhotoAnalysisServiceRemoteServiceProxy *v13;
  PLPhotoAnalysisServiceRemoteServiceProxy *v14;
  uint64_t v15;
  id errorHandler;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PLPhotoAnalysisServiceRemoteServiceProxy;
  v13 = -[PLPhotoAnalysisServiceRemoteServiceProxy init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_service, v10);
    objc_storeStrong((id *)&v14->_remoteInterface, a4);
    v14->_synchronous = a5;
    v15 = MEMORY[0x19AEC174C](v12);
    errorHandler = v14->_errorHandler;
    v14->_errorHandler = (id)v15;

  }
  return v14;
}

- (BOOL)conformsToProtocol:(id)a3
{
  Protocol *v4;
  BOOL v5;
  Protocol *v6;
  objc_super v8;

  v4 = (Protocol *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PLPhotoAnalysisServiceRemoteServiceProxy;
  if (-[PLPhotoAnalysisServiceRemoteServiceProxy conformsToProtocol:](&v8, sel_conformsToProtocol_, v4))
  {
    v5 = 1;
  }
  else
  {
    -[NSXPCInterface protocol](self->_remoteInterface, "protocol");
    v6 = (Protocol *)objc_claimAutoreleasedReturnValue();
    v5 = protocol_conformsToProtocol(v6, v4);

  }
  return v5;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  Protocol *v5;
  char *types;
  objc_method_description MethodDescription;
  objc_method_description v8;
  void *v9;
  objc_super v11;

  -[NSXPCInterface protocol](self->_remoteInterface, "protocol");
  v5 = (Protocol *)objc_claimAutoreleasedReturnValue();
  MethodDescription = protocol_getMethodDescription(v5, a3, 1, 1);
  types = MethodDescription.types;
  if (!MethodDescription.name && (v8 = protocol_getMethodDescription(v5, a3, 0, 1), types = v8.types, !v8.name)
    || (objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", types),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v11.receiver = self;
    v11.super_class = (Class)PLPhotoAnalysisServiceRemoteServiceProxy;
    -[PLPhotoAnalysisServiceRemoteServiceProxy methodSignatureForSelector:](&v11, sel_methodSignatureForSelector_, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v6;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)PLPhotoAnalysisServiceRemoteServiceProxy;
  return -[PLPhotoAnalysisServiceRemoteServiceProxy respondsToSelector:](&v6, sel_respondsToSelector_, a3);
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  id errorHandler;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = v4;
  if (self->_synchronous)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_service);
    objc_msgSend(WeakRetained, "synchronousRemoteServiceProxyWithErrorHandler:", self->_errorHandler);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v5, "invokeWithTarget:", v7);

  }
  else
  {
    objc_msgSend(v4, "retainArguments");
    v8 = objc_loadWeakRetained((id *)&self->_service);
    errorHandler = self->_errorHandler;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__PLPhotoAnalysisServiceRemoteServiceProxy_forwardInvocation___block_invoke;
    v10[3] = &unk_1E3670DE8;
    v11 = v5;
    objc_msgSend(v8, "remoteServiceProxyWithErrorHandler:reply:", errorHandler, v10);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_remoteInterface, 0);
  objc_destroyWeak((id *)&self->_service);
}

uint64_t __62__PLPhotoAnalysisServiceRemoteServiceProxy_forwardInvocation___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithTarget:", a2);
}

@end
