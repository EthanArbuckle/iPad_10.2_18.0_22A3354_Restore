@implementation AEAConcreteRestrictedNetworkToken

- (void)dealloc
{
  objc_super v3;

  -[AEAConcreteRestrictedNetworkToken releaseRestrictions](self, "releaseRestrictions");
  v3.receiver = self;
  v3.super_class = (Class)AEAConcreteRestrictedNetworkToken;
  -[AEAConcreteRestrictedNetworkToken dealloc](&v3, "dealloc");
}

- (BOOL)releaseRestrictions
{
  unsigned int v3;

  if (!self || !self->_policySession)
    goto LABEL_5;
  v3 = -[NEPolicySession removeAllPolicies](self->_policySession, "removeAllPolicies");
  if (v3)
  {
    sub_10000448C((uint64_t)self, 0);
LABEL_5:
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policySession, 0);
}

@end
