@implementation SBBiometricsService

+ (id)sharedInstance
{
  if (sharedInstance___once_12 != -1)
    dispatch_once(&sharedInstance___once_12, &__block_literal_global_412);
  return (id)sharedInstance___instance_12;
}

uint64_t __37__SBBiometricsService_sharedInstance__block_invoke()
{
  SBBiometricsService *v0;
  void *v1;

  kdebug_trace();
  v0 = objc_alloc_init(SBBiometricsService);
  v1 = (void *)sharedInstance___instance_12;
  sharedInstance___instance_12 = (uint64_t)v0;

  return kdebug_trace();
}

- (SBBiometricsService)init
{
  SBBiometricsService *v2;
  uint64_t v3;
  SBUIBiometricResource *biometricResource;
  uint64_t v5;
  FBServiceClientAuthenticator *unlockCredentialAuthenticator;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBBiometricsService;
  v2 = -[SBBiometricsService init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    biometricResource = v2->_biometricResource;
    v2->_biometricResource = (SBUIBiometricResource *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.mesa.unlockCredential"));
    unlockCredentialAuthenticator = v2->_unlockCredentialAuthenticator;
    v2->_unlockCredentialAuthenticator = (FBServiceClientAuthenticator *)v5;

    +[SBSystemServiceServer sharedInstance](SBSystemServiceServer, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBiometricsDelegate:", v2);

  }
  return v2;
}

- (void)systemServiceServer:(id)a3 client:(id)a4 fetchUnlockCredentialSet:(id)a5
{
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void (**v10)(id, void *);

  v7 = (void (**)(id, void *))a5;
  if (v7)
  {
    v10 = v7;
    if (-[FBServiceClientAuthenticator authenticateClient:](self->_unlockCredentialAuthenticator, "authenticateClient:", a4))
    {
      -[SBUIBiometricResource unlockCredentialSet](self->_biometricResource, "unlockCredentialSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "serializedCredentialSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
    v10[2](v10, v9);

    v7 = v10;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlockCredentialAuthenticator, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
}

@end
