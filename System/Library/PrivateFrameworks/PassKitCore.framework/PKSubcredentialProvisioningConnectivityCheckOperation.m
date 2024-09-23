@implementation PKSubcredentialProvisioningConnectivityCheckOperation

- (void)performOperation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKSubcredentialProvisioningConnectivityCheckOperation;
  -[PKSubcredentialProvisioningOperation performOperation](&v3, sel_performOperation);
  if (PKNetworkConnectivityAvailable())
    -[PKSubcredentialProvisioningOperation advanceToState:](self, "advanceToState:", 8);
  else
    -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 19, CFSTR("Device connectivity check failed"));
}

- (BOOL)canBeRestarted
{
  return 1;
}

@end
