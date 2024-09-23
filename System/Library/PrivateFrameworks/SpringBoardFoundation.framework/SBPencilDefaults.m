@implementation SBPencilDefaults

- (void)_bindAndRegisterDefaults
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "squeezeConfiguredActionArchive");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("SBPencilSystemShortcutAction"), 0, 1);

}

@end
