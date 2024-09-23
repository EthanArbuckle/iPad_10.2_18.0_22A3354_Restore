@implementation SBExternalDemoDefaults

- (SBExternalDemoDefaults)init
{
  return (SBExternalDemoDefaults *)-[BSAbstractDefaultDomain _initWithDomain:](self, "_initWithDomain:", CFSTR("com.apple.demo-settings"));
}

- (void)_bindAndRegisterDefaults
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shouldLockIconsInStoreDemoMode");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("LockIcons"), MEMORY[0x1E0C9AAA0], 1);

}

@end
