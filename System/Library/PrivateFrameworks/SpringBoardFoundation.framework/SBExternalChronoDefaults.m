@implementation SBExternalChronoDefaults

- (SBExternalChronoDefaults)init
{
  return (SBExternalChronoDefaults *)-[BSAbstractDefaultDomain _initWithDomain:](self, "_initWithDomain:", CFSTR("com.apple.chronod"));
}

- (void)_bindAndRegisterDefaults
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showInternalWidgets");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("showInternalWidgets"), MEMORY[0x1E0C9AAA0], 1);

}

+ (id)sharedInstance
{
  void *v2;
  SBExternalChronoDefaults *v3;
  void *v4;

  v2 = (void *)__shared;
  if (!__shared)
  {
    v3 = objc_alloc_init(SBExternalChronoDefaults);
    v4 = (void *)__shared;
    __shared = (uint64_t)v3;

    v2 = (void *)__shared;
  }
  return v2;
}

@end
