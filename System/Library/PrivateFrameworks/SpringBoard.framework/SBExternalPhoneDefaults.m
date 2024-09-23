@implementation SBExternalPhoneDefaults

- (SBExternalPhoneDefaults)init
{
  return (SBExternalPhoneDefaults *)-[BSAbstractDefaultDomain _initWithDomain:](self, "_initWithDomain:", CFSTR("com.apple.mobilephone"));
}

- (void)_bindAndRegisterDefaults
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "hideMyPhoneNumber");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("HideMyNumber"), MEMORY[0x1E0C9AAA0], 1);

}

@end
