@implementation TRIXPCServices

+ (void)registerAllServicesWithPromise:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__TRIXPCServices_registerAllServicesWithPromise___block_invoke;
  block[3] = &unk_1E932F918;
  v9 = v3;
  v4 = registerAllServicesWithPromise___pasOnceToken2;
  v5 = v3;
  v7 = v5;
  if (v4 == -1)
  {
    v6 = v5;
  }
  else
  {
    dispatch_once(&registerAllServicesWithPromise___pasOnceToken2, block);
    v6 = v9;
  }

}

void __49__TRIXPCServices_registerAllServicesWithPromise___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  TRIXPCInternalServiceListener *v4;
  void *v5;
  TRIXPCNamespaceManagementServiceListener *v6;
  void *v7;
  TRIXPCStatusServiceListener *v8;

  v2 = (void *)MEMORY[0x1D8232A5C]();
  v3 = (void *)MEMORY[0x1E0D81648];
  v4 = -[TRIXPCInternalServiceListener initWithServerContextPromise:]([TRIXPCInternalServiceListener alloc], "initWithServerContextPromise:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "registerForService:delegate:", CFSTR("com.apple.triald.internal"), v4);

  v5 = (void *)MEMORY[0x1E0D81648];
  v6 = -[TRIXPCNamespaceManagementServiceListener initWithServerContextPromise:]([TRIXPCNamespaceManagementServiceListener alloc], "initWithServerContextPromise:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "registerForService:delegate:", CFSTR("com.apple.triald.namespace-management"), v6);

  v7 = (void *)MEMORY[0x1E0D81648];
  v8 = -[TRIXPCStatusServiceListener initWithPromise:]([TRIXPCStatusServiceListener alloc], "initWithPromise:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v7, "registerForService:delegate:", CFSTR("com.apple.trial.status"), v8);

  objc_autoreleasePoolPop(v2);
}

+ (void)registerSystemService
{
  if (registerSystemService__pasOnceToken3 != -1)
    dispatch_once(&registerSystemService__pasOnceToken3, &__block_literal_global_17);
}

void __39__TRIXPCServices_registerSystemService__block_invoke()
{
  void *v0;
  void *v1;
  TRIXPCInternalSystemServiceListener *v2;

  v0 = (void *)MEMORY[0x1D8232A5C]();
  v1 = (void *)MEMORY[0x1E0D81648];
  v2 = objc_alloc_init(TRIXPCInternalSystemServiceListener);
  objc_msgSend(v1, "registerForService:delegate:", CFSTR("com.apple.triald.system.internal"), v2);

  objc_autoreleasePoolPop(v0);
}

@end
