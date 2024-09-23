@implementation SBStateDumpDefaults

- (void)_bindAndRegisterDefaults
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "remoteDumpEnabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("SBRemoteDumpEnabled"), MEMORY[0x1E0C9AAA0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "remoteDumpTimeout");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v4, CFSTR("SBRemoteDumpTimeout"), 0, 1);

}

@end
