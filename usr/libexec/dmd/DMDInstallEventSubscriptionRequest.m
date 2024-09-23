@implementation DMDInstallEventSubscriptionRequest

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CEMEventSubscriptionDeclaration)subscriptionDeclaration
{
  return self->_subscriptionDeclaration;
}

- (void)setSubscriptionDeclaration:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionDeclaration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionDeclaration, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
}

@end
