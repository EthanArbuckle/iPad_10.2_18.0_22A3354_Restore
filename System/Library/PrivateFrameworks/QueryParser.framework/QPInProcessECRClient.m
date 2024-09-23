@implementation QPInProcessECRClient

+ (id)sharedClient
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__QPInProcessECRClient_sharedClient__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedClient_onceToken != -1)
    dispatch_once(&sharedClient_onceToken, block);
  return (id)sharedClient_client;
}

void __53__QPInProcessECRClient_warmUpECRClientSyncWithError___block_invoke(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)warmUpECRClientSyncWithError:(id *)a3
{
  void *v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  BOOL v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  -[QPInProcessECRClient ecrClientWithError:](self, "ecrClientWithError:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__11;
    v16 = __Block_byref_object_dispose__11;
    v17 = 0;
    v5 = dispatch_semaphore_create(0);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __53__QPInProcessECRClient_warmUpECRClientSyncWithError___block_invoke;
    v9[3] = &unk_24DA26930;
    v11 = &v12;
    v6 = v5;
    v10 = v6;
    objc_msgSend(v4, "warmupForMode:completionHandler:", 3, v9);
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    if (a3)
      *a3 = objc_retainAutorelease((id)v13[5]);
    v7 = v13[5] == 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (QPInProcessECRClient)ecrClientWithError:(id *)a3
{
  os_unfair_lock_s *p_clientLock;
  GDEntityResolutionInProcessTextClient **p_client;
  GDEntityResolutionInProcessTextClient *v7;

  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  p_client = &self->_client;
  v7 = *p_client;
  if (!v7)
  {
    v7 = (GDEntityResolutionInProcessTextClient *)objc_msgSend(objc_alloc(MEMORY[0x24BE584D8]), "initWithMode:warmup:error:", 3, 0, a3);
    objc_storeStrong((id *)p_client, v7);
  }
  os_unfair_lock_unlock(p_clientLock);
  return (QPInProcessECRClient *)v7;
}

void __36__QPInProcessECRClient_sharedClient__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedClient_client;
  sharedClient_client = (uint64_t)v1;

}

- (QPInProcessECRClient)init
{
  QPInProcessECRClient *v2;
  NSObject *v3;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QPInProcessECRClient;
  v2 = -[QPECRClient init](&v6, sel_init);
  if (v2)
  {
    if (ecrClientLogger_token != -1)
      dispatch_once(&ecrClientLogger_token, &__block_literal_global_13);
    v3 = ecrClientLogger_log;
    if (os_log_type_enabled((os_log_t)ecrClientLogger_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_218E10000, v3, OS_LOG_TYPE_DEFAULT, "Initializing QPInProcessECRClient", v5, 2u);
    }
  }
  return v2;
}

- (id)resolveEntitiesWithRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  id v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  -[QPInProcessECRClient ecrClientWithError:](self, "ecrClientWithError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = dispatch_semaphore_create(0);
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__11;
    v26 = __Block_byref_object_dispose__11;
    v27 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__11;
    v20 = __Block_byref_object_dispose__11;
    v21 = 0;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __57__QPInProcessECRClient_resolveEntitiesWithRequest_error___block_invoke;
    v12[3] = &unk_24DA26908;
    v14 = &v22;
    v15 = &v16;
    v9 = v8;
    v13 = v9;
    objc_msgSend(v7, "resolveEntitiesForRequest:completionHandler:", v6, v12);
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    if (a4)
      *a4 = objc_retainAutorelease((id)v17[5]);
    v10 = (id)v23[5];

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __57__QPInProcessECRClient_resolveEntitiesWithRequest_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)coolDownECRClientSyncWithError:(id *)a3
{
  os_unfair_lock_s *p_clientLock;
  GDEntityResolutionInProcessTextClient *client;
  GDEntityResolutionInProcessTextClient *v6;
  id v7;
  id v9;

  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  client = self->_client;
  self->_client = 0;
  v6 = client;

  os_unfair_lock_unlock(p_clientLock);
  v9 = 0;
  -[GDEntityResolutionInProcessTextClient cooldownWithError:](v6, "cooldownWithError:", &v9);
  v7 = v9;

  return v7 == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
}

@end
