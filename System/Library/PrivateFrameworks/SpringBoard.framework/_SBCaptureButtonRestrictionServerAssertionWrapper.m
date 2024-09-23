@implementation _SBCaptureButtonRestrictionServerAssertionWrapper

- (BSInvalidatable)wrappedAssertion
{
  return self->_wrappedAssertion;
}

- (void)setWrappedAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_wrappedAssertion, a3);
}

- (BSServiceConnection)associatedConnection
{
  return (BSServiceConnection *)objc_loadWeakRetained((id *)&self->_associatedConnection);
}

- (void)setAssociatedConnection:(id)a3
{
  objc_storeWeak((id *)&self->_associatedConnection, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_associatedConnection);
  objc_storeStrong((id *)&self->_wrappedAssertion, 0);
}

@end
