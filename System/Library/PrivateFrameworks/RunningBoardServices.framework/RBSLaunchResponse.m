@implementation RBSLaunchResponse

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RBSLaunchResponse;
  return -[RBSLaunchResponse init](&v3, sel_init);
}

- (void)setProcess:(id)a3
{
  objc_storeStrong((id *)&self->_process, a3);
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void)setAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_assertion, a3);
}

- (void)setManagedEndpointByLaunchIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_managedEndpointByLaunchIdentifier, a3);
}

- (NSDictionary)managedEndpointByLaunchIdentifier
{
  return self->_managedEndpointByLaunchIdentifier;
}

- (RBSProcessHandle)process
{
  return self->_process;
}

- (RBSAssertion)assertion
{
  return self->_assertion;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_managedEndpointByLaunchIdentifier, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

@end
