@implementation PLPhotoAnalysisServiceClientSideService

- (PLPhotoAnalysisServiceClientSideService)initWithConnection:(id)a3 remoteInterface:(id)a4 instantiationBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  PLPhotoAnalysisServiceClientSideService *v12;
  PLPhotoAnalysisServiceClientSideService *v13;
  uint64_t v14;
  id instantiationBlock;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PLPhotoAnalysisServiceClientSideService;
  v12 = -[PLPhotoAnalysisServiceClientSideService init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connection, a3);
    objc_storeStrong((id *)&v13->_remoteInterface, a4);
    v14 = MEMORY[0x19AEC174C](v11);
    instantiationBlock = v13->_instantiationBlock;
    v13->_instantiationBlock = (id)v14;

    v13->_lock._os_unfair_lock_opaque = 0;
  }

  return v13;
}

- (id)remoteObjectProxy
{
  return -[PLPhotoAnalysisServiceRemoteServiceProxy initWithServiceProvider:remoteInterface:synchronous:errorHandler:]([PLPhotoAnalysisServiceRemoteServiceProxy alloc], "initWithServiceProvider:remoteInterface:synchronous:errorHandler:", self, self->_remoteInterface, 0, 0);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  PLPhotoAnalysisServiceRemoteServiceProxy *v5;

  v4 = a3;
  v5 = -[PLPhotoAnalysisServiceRemoteServiceProxy initWithServiceProvider:remoteInterface:synchronous:errorHandler:]([PLPhotoAnalysisServiceRemoteServiceProxy alloc], "initWithServiceProvider:remoteInterface:synchronous:errorHandler:", self, self->_remoteInterface, 0, v4);

  return v5;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  PLPhotoAnalysisServiceRemoteServiceProxy *v5;

  v4 = a3;
  v5 = -[PLPhotoAnalysisServiceRemoteServiceProxy initWithServiceProvider:remoteInterface:synchronous:errorHandler:]([PLPhotoAnalysisServiceRemoteServiceProxy alloc], "initWithServiceProvider:remoteInterface:synchronous:errorHandler:", self, self->_remoteInterface, 1, v4);

  return v5;
}

- (void)remoteServiceProxyWithErrorHandler:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSXPCProxyCreating *v8;
  void *v9;
  void *v10;
  void (**instantiationBlock)(id, void *, _QWORD *);
  _QWORD v12[5];
  id v13;
  void (**v14)(id, void *);

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  os_unfair_lock_lock(&self->_lock);
  v8 = self->_service;
  os_unfair_lock_unlock(&self->_lock);
  if (v8)
  {
    -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](v8, "remoteObjectProxyWithErrorHandler:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v7[2](v7, v9);

  }
  else
  {
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      instantiationBlock = (void (**)(id, void *, _QWORD *))self->_instantiationBlock;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __84__PLPhotoAnalysisServiceClientSideService_remoteServiceProxyWithErrorHandler_reply___block_invoke;
      v12[3] = &unk_1E3673470;
      v12[4] = self;
      v13 = v6;
      v14 = v7;
      instantiationBlock[2](instantiationBlock, v10, v12);

    }
  }

}

- (id)synchronousRemoteServiceProxyWithErrorHandler:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  id *p_service;
  NSXPCProxyCreating *v7;
  void *v8;
  void (**instantiationBlock)(id, void *, _QWORD *);
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  p_service = (id *)&self->_service;
  v7 = self->_service;
  os_unfair_lock_unlock(&self->_lock);
  if (!v7)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__82623;
    v23 = __Block_byref_object_dispose__82624;
    v24 = 0;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      instantiationBlock = (void (**)(id, void *, _QWORD *))self->_instantiationBlock;
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __89__PLPhotoAnalysisServiceClientSideService_synchronousRemoteServiceProxyWithErrorHandler___block_invoke;
      v16 = &unk_1E3673498;
      v18 = &v19;
      v17 = v4;
      instantiationBlock[2](instantiationBlock, v8, &v13);

    }
    if (v20[5])
    {
      os_unfair_lock_lock(p_lock);
      v10 = *p_service;
      if (!*p_service)
      {
        objc_storeStrong(p_service, (id)v20[5]);
        v10 = *p_service;
      }
      v7 = (NSXPCProxyCreating *)v10;
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      v7 = 0;
    }

    _Block_object_dispose(&v19, 8);
  }
  -[NSXPCProxyCreating synchronousRemoteObjectProxyWithErrorHandler:](v7, "synchronousRemoteObjectProxyWithErrorHandler:", v4, v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong(&self->_instantiationBlock, 0);
  objc_storeStrong((id *)&self->_remoteInterface, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __89__PLPhotoAnalysisServiceClientSideService_synchronousRemoteServiceProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __84__PLPhotoAnalysisServiceClientSideService_remoteServiceProxyWithErrorHandler_reply___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  if (v10)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 40));
    v4 = a1[4];
    v7 = *(void **)(v4 + 32);
    v5 = (id *)(v4 + 32);
    v6 = v7;
    if (!v7)
    {
      objc_storeStrong(v5, a2);
      v6 = *(void **)(a1[4] + 32);
    }
    v8 = v6;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 40));
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", a1[5]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      (*(void (**)(void))(a1[6] + 16))();

  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
  }

}

@end
