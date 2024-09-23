@implementation SBInCallTestRecipe

- (id)title
{
  return CFSTR("InCall");
}

- (void)handleVolumeIncrease
{
  id v2;

  if (!self->_isPresentationActive)
  {
    self->_isPresentationActive = 1;
    v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAEC0]), "initWithSceneBundleIdentifier:", CFSTR("com.apple.FakePhone"));
    objc_msgSend(MEMORY[0x1E0DAAEC8], "performPresentationWithConfiguration:completion:", v2, 0);

  }
}

- (void)handleVolumeDecrease
{
  void *v2;
  id v3;

  if (self->_isPresentationActive)
  {
    self->_isPresentationActive = 0;
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inCallPresentationManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_dismissAllPresentations");

  }
}

@end
