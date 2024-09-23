@implementation VSIdentityProviderRequestContext

- (VSIdentityProviderRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (BOOL)attemptedVerificationStateReset
{
  return self->_attemptedVerificationStateReset;
}

- (void)setAttemptedVerificationStateReset:(BOOL)a3
{
  self->_attemptedVerificationStateReset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
