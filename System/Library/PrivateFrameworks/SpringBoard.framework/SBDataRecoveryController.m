@implementation SBDataRecoveryController

- (SBDataRecoveryController)init
{
  void *v3;
  SBDataRecoveryController *v4;

  objc_msgSend(MEMORY[0x1E0DA9E80], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBDataRecoveryController initWithMobileKeyBag:](self, "initWithMobileKeyBag:", v3);

  return v4;
}

- (SBDataRecoveryController)initWithMobileKeyBag:(id)a3
{
  id v5;
  SBDataRecoveryController *v6;
  SBDataRecoveryController *v7;
  void *v8;
  int v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBDataRecoveryController;
  v6 = -[SBDataRecoveryController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mobileKeyBag, a3);
    -[SBFMobileKeyBag state](v7->_mobileKeyBag, "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "recoveryEnabled");

    if (v9)
      ADClientSetValueForScalarKey();
  }

  return v7;
}

- (BOOL)dataRecoveryRequired
{
  void *v2;
  char v3;

  -[SBFMobileKeyBag state](self->_mobileKeyBag, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "recoveryRequired");

  return v3;
}

- (void)performDataRecovery
{
  -[SBFMobileKeyBag lockSkippingGracePeriod:](self->_mobileKeyBag, "lockSkippingGracePeriod:", 1);
  DMPerformMigration();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileKeyBag, 0);
}

@end
