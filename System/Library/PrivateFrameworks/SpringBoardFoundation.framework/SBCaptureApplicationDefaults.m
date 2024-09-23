@implementation SBCaptureApplicationDefaults

- (void)_bindAndRegisterDefaults
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ignoreCaptureApplicationLaunchMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("SBIgnoreCaptureApplicationLaunchMonitor"), MEMORY[0x1E0C9AAA0], 4);

  -[SBCaptureApplicationDefaults _addStateCaptureHandlers](self, "_addStateCaptureHandlers");
}

- (void)_addStateCaptureHandlers
{
  id v2;
  id v3;
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = MEMORY[0x1E0C80D38];
  objc_copyWeak(&v4, &location);
  v3 = (id)BSLogAddStateCaptureBlockWithTitle();

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

__CFString *__56__SBCaptureApplicationDefaults__addStateCaptureHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  __CFString *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "description");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E2010FC0;
  }

  return v3;
}

@end
