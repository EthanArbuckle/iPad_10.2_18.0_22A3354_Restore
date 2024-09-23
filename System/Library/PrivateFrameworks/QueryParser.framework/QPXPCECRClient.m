@implementation QPXPCECRClient

+ (id)sharedClient
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__QPXPCECRClient_sharedClient__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedClient_onceToken_96 != -1)
    dispatch_once(&sharedClient_onceToken_96, block);
  return (id)sharedClient_client_95;
}

void __30__QPXPCECRClient_sharedClient__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedClient_client_95;
  sharedClient_client_95 = (uint64_t)v1;

}

- (QPXPCECRClient)init
{
  QPXPCECRClient *v2;
  NSObject *v3;
  GDEntityResolutionTextClient *v4;
  GDEntityResolutionTextClient *client;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)QPXPCECRClient;
  v2 = -[QPECRClient init](&v8, sel_init);
  if (v2)
  {
    if (ecrClientLogger_token != -1)
      dispatch_once(&ecrClientLogger_token, &__block_literal_global_13);
    v3 = ecrClientLogger_log;
    if (os_log_type_enabled((os_log_t)ecrClientLogger_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_218E10000, v3, OS_LOG_TYPE_DEFAULT, "Initializing QPXPCECRClient", v7, 2u);
    }
    v4 = (GDEntityResolutionTextClient *)objc_alloc_init(MEMORY[0x24BE584E8]);
    client = v2->_client;
    v2->_client = v4;

  }
  return v2;
}

- (id)resolveEntitiesWithRequest:(id)a3 error:(id *)a4
{
  return (id)-[GDEntityResolutionTextClient resolveEntitiesForRequest:error:](self->_client, "resolveEntitiesForRequest:error:", a3, a4);
}

- (BOOL)warmUpECRClientSyncWithError:(id *)a3
{
  GDEntityResolutionTextClient *client;
  id v5;
  void *v6;
  id v8;

  client = self->_client;
  v8 = 0;
  -[GDEntityResolutionTextClient warmupForMode:error:](client, "warmupForMode:error:", 3, &v8);
  v5 = v8;
  v6 = v5;
  if (a3)
    *a3 = objc_retainAutorelease(v5);

  return v6 == 0;
}

- (BOOL)coolDownECRClientSyncWithError:(id *)a3
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
}

@end
