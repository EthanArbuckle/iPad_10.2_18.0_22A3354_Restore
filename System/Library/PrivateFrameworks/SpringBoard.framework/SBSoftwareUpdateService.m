@implementation SBSoftwareUpdateService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_13 != -1)
    dispatch_once(&sharedInstance_onceToken_13, &__block_literal_global_114);
  return (id)sharedInstance___sharedInstance_9;
}

void __41__SBSoftwareUpdateService_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SBSoftwareUpdateService _init]([SBSoftwareUpdateService alloc], "_init");
  v1 = (void *)sharedInstance___sharedInstance_9;
  sharedInstance___sharedInstance_9 = (uint64_t)v0;

}

- (id)_init
{
  SBSoftwareUpdateService *v2;
  id v3;
  uint64_t v4;
  FBServiceClientAuthenticator *serviceClientSoftwareUpdatePasscodePolicyEntitlementAuthenticator;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBSoftwareUpdateService;
  v2 = -[SBSoftwareUpdateService init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D22990]);
    v4 = objc_msgSend(v3, "initWithEntitlement:", *MEMORY[0x1E0DAB9A0]);
    serviceClientSoftwareUpdatePasscodePolicyEntitlementAuthenticator = v2->_serviceClientSoftwareUpdatePasscodePolicyEntitlementAuthenticator;
    v2->_serviceClientSoftwareUpdatePasscodePolicyEntitlementAuthenticator = (FBServiceClientAuthenticator *)v4;

    +[SBSystemServiceServer sharedInstance](SBSystemServiceServer, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSoftwareUpdateDelegate:", v2);

  }
  return v2;
}

- (void)systemServiceServer:(id)a3 client:(id)a4 passcodePolicy:(id)a5
{
  id v7;
  id v8;
  FBServiceClientAuthenticator *serviceClientSoftwareUpdatePasscodePolicyEntitlementAuthenticator;
  int v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  serviceClientSoftwareUpdatePasscodePolicyEntitlementAuthenticator = self->_serviceClientSoftwareUpdatePasscodePolicyEntitlementAuthenticator;
  v14 = 0;
  v10 = -[FBServiceClientAuthenticator authenticateClient:error:](serviceClientSoftwareUpdatePasscodePolicyEntitlementAuthenticator, "authenticateClient:error:", v7, &v14);
  v11 = v14;
  if (v10)
  {
    v13 = v8;
    BSDispatchMain();

  }
  else
  {
    SBLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SBSoftwareUpdateService systemServiceServer:client:passcodePolicy:].cold.1(v7);

    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

uint64_t __69__SBSoftwareUpdateService_systemServiceServer_client_passcodePolicy___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend((id)SBApp, "softwareUpdatePasscodePolicyManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "softwareUpdatePasscodePolicy");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setPasscodePolicy:(int64_t)a5
{
  id v6;
  FBServiceClientAuthenticator *serviceClientSoftwareUpdatePasscodePolicyEntitlementAuthenticator;
  int v8;
  id v9;
  NSObject *v10;
  id v11;

  v6 = a4;
  serviceClientSoftwareUpdatePasscodePolicyEntitlementAuthenticator = self->_serviceClientSoftwareUpdatePasscodePolicyEntitlementAuthenticator;
  v11 = 0;
  v8 = -[FBServiceClientAuthenticator authenticateClient:error:](serviceClientSoftwareUpdatePasscodePolicyEntitlementAuthenticator, "authenticateClient:error:", v6, &v11);
  v9 = v11;
  if (v8)
  {
    BSDispatchMain();
  }
  else
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SBSoftwareUpdateService systemServiceServer:client:setPasscodePolicy:].cold.1(v6);

  }
}

void __72__SBSoftwareUpdateService_systemServiceServer_client_setPasscodePolicy___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32) <= 2uLL)
  {
    objc_msgSend((id)SBApp, "softwareUpdatePasscodePolicyManager");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setSoftwareUpdatePasscodePolicy:", *(_QWORD *)(a1 + 32));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceClientSoftwareUpdatePasscodePolicyEntitlementAuthenticator, 0);
}

- (void)systemServiceServer:(void *)a1 client:passcodePolicy:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "pid");
  BSProcessDescriptionForPID();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  BSPrettyFunctionName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_9(&dword_1D0540000, v3, v4, "Failed to authenticate %{public}@ in %{public}@: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

- (void)systemServiceServer:(void *)a1 client:setPasscodePolicy:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "pid");
  BSProcessDescriptionForPID();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  BSPrettyFunctionName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_9(&dword_1D0540000, v3, v4, "Failed to authenticate %{public}@ in %{public}@: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

@end
