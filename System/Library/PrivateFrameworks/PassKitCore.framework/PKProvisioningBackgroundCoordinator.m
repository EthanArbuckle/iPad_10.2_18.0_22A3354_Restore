@implementation PKProvisioningBackgroundCoordinator

- (PKProvisioningBackgroundCoordinator)init
{

  return 0;
}

- (PKProvisioningBackgroundCoordinator)initWithSetupContext:(id)a3 credential:(id)a4 previouslyAcceptedTerms:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  PKProvisioningBackgroundCoordinator *v10;
  _PKProvisioningBackgroundCoordinator *v11;
  _PKProvisioningBackgroundCoordinator *coordinator;
  objc_super v14;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKProvisioningBackgroundCoordinator;
  v10 = -[PKProvisioningBackgroundCoordinator init](&v14, sel_init);
  if (v10)
  {
    v11 = -[_PKProvisioningBackgroundCoordinator initWithPkContext:credential:previouslyAcceptedTerms:]([_PKProvisioningBackgroundCoordinator alloc], "initWithPkContext:credential:previouslyAcceptedTerms:", v8, v9, v5);
    coordinator = v10->_coordinator;
    v10->_coordinator = v11;

  }
  return v10;
}

- (void)startWithCompletion:(id)a3
{
  -[_PKProvisioningBackgroundCoordinator startWithCompletion:](self->_coordinator, "startWithCompletion:", a3);
}

- (void)cancel
{
  -[_PKProvisioningBackgroundCoordinator cancel](self->_coordinator, "cancel");
}

- (void)invalidate
{
  -[_PKProvisioningBackgroundCoordinator invalidate](self->_coordinator, "invalidate");
}

- (void)cleanUpArchivedProvisioningAndInvalidateWithCompletion:(id)a3
{
  -[_PKProvisioningBackgroundCoordinator cleanUpArchivedProvisioningAndInvalidateWithCompletion:](self->_coordinator, "cleanUpArchivedProvisioningAndInvalidateWithCompletion:", a3);
}

- (id)archivedState
{
  return -[_PKProvisioningBackgroundCoordinator archivedState](self->_coordinator, "archivedState");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end
