@implementation SBLockScreenContentAssertionTestRecipe

- (id)title
{
  return CFSTR("Lock Screen Content Assertion");
}

- (void)handleVolumeIncrease
{
  void *v3;
  SBSLockScreenRemoteContentAssertion *v4;
  SBSLockScreenRemoteContentAssertion *currentAssertion;
  id v6;

  if (!self->_currentAssertion)
  {
    v6 = xpc_null_create();
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAFB8]), "initWithServiceName:viewControllerClassName:xpcEndpoint:userInfo:", CFSTR("com.apple.TestRemoteAlert"), CFSTR("RemoteContentViewController"), v6, 0);
    objc_msgSend(MEMORY[0x1E0DAAEF8], "acquireRemoteContentAssertionWithDefinition:errorHandler:", v3, &__block_literal_global_382);
    v4 = (SBSLockScreenRemoteContentAssertion *)objc_claimAutoreleasedReturnValue();
    currentAssertion = self->_currentAssertion;
    self->_currentAssertion = v4;

  }
}

- (void)handleVolumeDecrease
{
  SBSLockScreenRemoteContentAssertion *currentAssertion;

  -[SBSLockScreenRemoteContentAssertion invalidate](self->_currentAssertion, "invalidate");
  currentAssertion = self->_currentAssertion;
  self->_currentAssertion = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAssertion, 0);
}

@end
