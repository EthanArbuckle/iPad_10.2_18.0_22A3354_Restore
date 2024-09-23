@implementation SBInCallPresentationDefaults

- (void)_bindAndRegisterDefaults
{
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "assertNoZombieInCallScenes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C9AAA0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("SBAssertNoZombieInCallScenes"), MEMORY[0x1E0C9AAA0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "skipPromptUnlockEntitlementCheck");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v5, CFSTR("SBSkipPromptUnlockEntitlementCheck"), v4, 1);

}

@end
