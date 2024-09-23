@implementation SBBiometricKitDefaults

- (SBBiometricKitDefaults)init
{
  return (SBBiometricKitDefaults *)-[BSAbstractDefaultDomain _initWithDomain:](self, "_initWithDomain:", CFSTR("com.apple.biometrickitd"));
}

- (void)_bindAndRegisterDefaults
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "coachingHintsEnabled");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("coachingHintsEnabled"), MEMORY[0x1E0C9AAB0], 1);

}

@end
