@implementation SBSServiceFacilityClient

void __52__SBSServiceFacilityClient_checkOutClientWithClass___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)__sharedServiceClients;
  __sharedServiceClients = (uint64_t)v0;

}

void __52__SBSServiceFacilityClient_checkOutClientWithClass___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0D23260];
  v6 = a2;
  objc_msgSend(v3, "defaultShellEndpoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEndpoint:", v4);

  objc_msgSend(v6, "setIdentifier:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setServiceQuality:", v5);

  objc_msgSend(v6, "setCalloutQueue:", *(_QWORD *)(a1 + 40));
}

+ (id)checkOutClientWithClass:(Class)a3
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *Serial;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBSServiceFacilityClient.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clazz"));

  }
  if (checkOutClientWithClass____once != -1)
    dispatch_once(&checkOutClientWithClass____once, &__block_literal_global_3);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBSServiceFacilityClient.m"), 34, CFSTR("Class must have a serviceFacilityIdentifier: %@"), a3);

  }
  -[objc_class serviceFacilityIdentifier](a3, "serviceFacilityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a1;
  objc_sync_enter(v8);
  objc_msgSend((id)__sharedServiceClients, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.springboardservices.service.%@.callback"), v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    Serial = (void *)BSDispatchQueueCreateSerial();

    v12 = [a3 alloc];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __52__SBSServiceFacilityClient_checkOutClientWithClass___block_invoke_2;
    v18[3] = &unk_1E288D220;
    v19 = v7;
    v13 = Serial;
    v20 = v13;
    v9 = (void *)objc_msgSend(v12, "initWithConfigurator:", v18);
    v14 = (void *)__sharedServiceClients;
    objc_msgSend(v9, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v9, v15);

  }
  objc_msgSend(v9, "_incrementCheckout");
  objc_sync_exit(v8);

  return v9;
}

- (void)_incrementCheckout
{
  SBSServiceFacilityClient *obj;

  obj = self;
  objc_sync_enter(obj);
  ++obj->_numberOfCheckOuts;
  objc_sync_exit(obj);

}

+ (void)checkInClient:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBSServiceFacilityClient.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

  }
  v5 = a1;
  objc_sync_enter(v5);
  if (objc_msgSend(v9, "_decrementCheckout"))
  {
    v6 = (void *)__sharedServiceClients;
    objc_msgSend(v9, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v7);

    objc_msgSend(v9, "invalidate");
    v9 = 0;
  }
  objc_sync_exit(v5);

}

- (BOOL)_decrementCheckout
{
  SBSServiceFacilityClient *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_numberOfCheckOuts-- == 1;
  objc_sync_exit(v2);

  return v3;
}

- (SBSServiceFacilityClient)initWithCalloutQueue:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSServiceFacilityClient.m"), 70, CFSTR("Unavailable initializer."));

  return 0;
}

- (SBSServiceFacilityClient)initWithIdentifier:(id)a3 calloutQueue:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSServiceFacilityClient;
  return -[FBSServiceFacilityClient initWithIdentifier:calloutQueue:](&v5, sel_initWithIdentifier_calloutQueue_, a3, a4);
}

+ (id)serviceFacilityIdentifier
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBSServiceFacilityClient.m"), 82, CFSTR("Cannot have a nil service facility identifier"));

  return 0;
}

@end
