@implementation ICUserVerificationContext

+ (id)contextWithACAccount:(id)a3 accountStore:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "setACAccount:", v7);

  objc_msgSend(v8, "setACAccountStore:", v6);
  objc_msgSend(v8, "setVerificationStyle:", 0);
  return v8;
}

- (ICUserIdentityProperties)identityProperties
{
  ICUserIdentityProperties *identityProperties;
  ICUserIdentityProperties *v4;

  identityProperties = self->_identityProperties;
  if (identityProperties)
    return identityProperties;
  v4 = objc_alloc_init(ICUserIdentityProperties);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)(v5 + 32), self->_ACAccount);
    objc_storeStrong((id *)(v6 + 40), self->_ACAccountStore);
    *(_QWORD *)(v6 + 8) = self->_interactionLevel;
    v7 = -[ICUserIdentityProperties copyWithZone:](self->_identityProperties, "copyWithZone:", a3);
    v8 = *(void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = v7;

    objc_storeStrong((id *)(v6 + 48), self->_identityStore);
    *(_QWORD *)(v6 + 56) = self->_verificationStyle;
    objc_storeStrong((id *)(v6 + 24), self->_debugReason);
  }
  return (id)v6;
}

- (void)setIdentityProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)interactionLevel
{
  return self->_interactionLevel;
}

- (void)setInteractionLevel:(int64_t)a3
{
  self->_interactionLevel = a3;
}

- (NSString)debugReason
{
  return self->_debugReason;
}

- (void)setDebugReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (ACAccount)ACAccount
{
  return self->_ACAccount;
}

- (void)setACAccount:(id)a3
{
  objc_storeStrong((id *)&self->_ACAccount, a3);
}

- (ACAccountStore)ACAccountStore
{
  return self->_ACAccountStore;
}

- (void)setACAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_ACAccountStore, a3);
}

- (ICUserIdentityStore)identityStore
{
  return self->_identityStore;
}

- (void)setIdentityStore:(id)a3
{
  objc_storeStrong((id *)&self->_identityStore, a3);
}

- (int64_t)verificationStyle
{
  return self->_verificationStyle;
}

- (void)setVerificationStyle:(int64_t)a3
{
  self->_verificationStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityStore, 0);
  objc_storeStrong((id *)&self->_ACAccountStore, 0);
  objc_storeStrong((id *)&self->_ACAccount, 0);
  objc_storeStrong((id *)&self->_debugReason, 0);
  objc_storeStrong((id *)&self->_identityProperties, 0);
}

@end
