@implementation SBSAbstractFacilityService

- (OS_dispatch_queue)callbackQueue
{
  void *v2;
  void *v3;

  -[SBSAbstractFacilityService client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calloutQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (SBSServiceFacilityClient)client
{
  return self->_client;
}

- (SBSAbstractFacilityService)init
{
  SBSAbstractFacilityService *v2;
  uint64_t v3;
  SBSServiceFacilityClient *client;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSAbstractFacilityService;
  v2 = -[SBSAbstractFacilityService init](&v6, sel_init);
  if (v2)
  {
    +[SBSServiceFacilityClient checkOutClientWithClass:](SBSServiceFacilityClient, "checkOutClientWithClass:", objc_msgSend((id)objc_opt_class(), "serviceFacilityClientClass"));
    v3 = objc_claimAutoreleasedReturnValue();
    client = v2->_client;
    v2->_client = (SBSServiceFacilityClient *)v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)dealloc
{
  objc_super v3;

  +[SBSServiceFacilityClient checkInClient:](SBSServiceFacilityClient, "checkInClient:", self->_client);
  v3.receiver = self;
  v3.super_class = (Class)SBSAbstractFacilityService;
  -[SBSAbstractFacilityService dealloc](&v3, sel_dealloc);
}

+ (Class)serviceFacilityClientClass
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBSAbstractFacilityService.m"), 42, CFSTR("A service identifier must be provided."));

  return 0;
}

@end
