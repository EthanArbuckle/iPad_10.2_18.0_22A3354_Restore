@implementation SBBiometricAuthenticationPolicy

- (SBBiometricAuthenticationPolicy)initWithLockOutProvider:(id)a3
{
  id v5;
  SBBiometricAuthenticationPolicy *v6;
  SBBiometricAuthenticationPolicy *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBBiometricAuthenticationPolicy;
  v6 = -[SBBiometricAuthenticationPolicy init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_lockOutStatusProvider, a3);

  return v7;
}

- (BOOL)shouldRelockAfterBioUnlock
{
  return -[SBFLockOutStatusProvider isBlocked](self->_lockOutStatusProvider, "isBlocked");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockOutStatusProvider, 0);
}

@end
