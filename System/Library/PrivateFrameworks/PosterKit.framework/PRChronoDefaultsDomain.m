@implementation PRChronoDefaultsDomain

- (PRChronoDefaultsDomain)init
{
  return (PRChronoDefaultsDomain *)-[BSAbstractDefaultDomain _initWithDomain:](self, "_initWithDomain:", CFSTR("com.apple.chronod"));
}

- (void)_bindAndRegisterDefaults
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shouldShowInternalWidgets");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("showInternalWidgets"), MEMORY[0x1E0C9AAA0], 1);

}

@end
