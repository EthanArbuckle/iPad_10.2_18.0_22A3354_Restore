@implementation SBRecentDisplayItemsDefaults

- (void)_bindAndRegisterDefaults
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "commandTabPlistRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("SBDefaultKeyCommandTabPlistRepresentation"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "dockRecentsPlistRepresentation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v4, CFSTR("SBDefaultKeyDockRecentsPlistRepresentation"), 0, 1);

}

@end
