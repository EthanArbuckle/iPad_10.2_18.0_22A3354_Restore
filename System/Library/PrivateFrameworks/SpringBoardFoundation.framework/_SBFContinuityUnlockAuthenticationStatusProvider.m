@implementation _SBFContinuityUnlockAuthenticationStatusProvider

- (_SBFContinuityUnlockAuthenticationStatusProvider)initWithMobileKeyBag:(id)a3 underlyingProvider:(id)a4
{
  id v7;
  id v8;
  _SBFContinuityUnlockAuthenticationStatusProvider *v9;
  _SBFContinuityUnlockAuthenticationStatusProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_SBFContinuityUnlockAuthenticationStatusProvider;
  v9 = -[_SBFContinuityUnlockAuthenticationStatusProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keybag, a3);
    objc_storeStrong((id *)&v10->_underlyingProvider, a4);
  }

  return v10;
}

- (BOOL)isAuthenticated
{
  return (-[SBFAuthenticationStatusProvider isAuthenticated](self->_underlyingProvider, "isAuthenticated") & 1) != 0
      || -[SBFMobileKeyBag isContinuityUnlocked](self->_keybag, "isContinuityUnlocked");
}

- (uint64_t)_isContinuityUnlocked
{
  if (result)
    return objc_msgSend(*(id *)(result + 8), "isContinuityUnlocked");
  return result;
}

- (BOOL)isAuthenticatedCached
{
  return (-[SBFAuthenticationStatusProvider isAuthenticatedCached](self->_underlyingProvider, "isAuthenticatedCached") & 1) != 0
      || -[SBFMobileKeyBag isContinuityUnlocked](self->_keybag, "isContinuityUnlocked");
}

- (BOOL)hasPasscodeSet
{
  return -[SBFAuthenticationStatusProvider hasPasscodeSet](self->_underlyingProvider, "hasPasscodeSet");
}

- (BOOL)hasAuthenticatedAtLeastOnceSinceBoot
{
  return -[SBFAuthenticationStatusProvider hasAuthenticatedAtLeastOnceSinceBoot](self->_underlyingProvider, "hasAuthenticatedAtLeastOnceSinceBoot");
}

- (void)revokeAuthenticationImmediatelyForPublicReason:(id)a3
{
  -[SBFAuthenticationStatusProvider revokeAuthenticationImmediatelyForPublicReason:](self->_underlyingProvider, "revokeAuthenticationImmediatelyForPublicReason:", a3);
}

- (void)revokeAuthenticationIfNecessaryForPublicReason:(id)a3
{
  -[SBFAuthenticationStatusProvider revokeAuthenticationIfNecessaryForPublicReason:](self->_underlyingProvider, "revokeAuthenticationIfNecessaryForPublicReason:", a3);
}

- (void)revokeAuthenticationImmediatelyIfNecessaryForPublicReason:(id)a3
{
  -[SBFAuthenticationStatusProvider revokeAuthenticationImmediatelyIfNecessaryForPublicReason:](self->_underlyingProvider, "revokeAuthenticationImmediatelyIfNecessaryForPublicReason:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingProvider, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
}

@end
