@implementation STSystemStatusDefaults

+ (id)standardDefaults
{
  if (qword_1ED0CB4C0 != -1)
    dispatch_once(&qword_1ED0CB4C0, &__block_literal_global_21);
  return (id)_MergedGlobals_17;
}

void __42__STSystemStatusDefaults_standardDefaults__block_invoke()
{
  STSystemStatusDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(STSystemStatusDefaults);
  v1 = (void *)_MergedGlobals_17;
  _MergedGlobals_17 = (uint64_t)v0;

}

- (STSystemStatusDefaults)init
{
  return (STSystemStatusDefaults *)-[BSAbstractDefaultDomain _initWithDomain:](self, "_initWithDomain:", CFSTR("com.apple.systemstatus"));
}

- (void)_bindAndRegisterDefaults
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shouldEnableInternalBundles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("STEnableInternalBundles"), MEMORY[0x1E0C9AAB0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shouldEnableUnknownBundles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C9AAA0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v4, CFSTR("STEnableUnknownBundles"), MEMORY[0x1E0C9AAA0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shouldEnableUnknownBackgroundActivities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v6, CFSTR("STEnableUnknownBackgroundActivities"), v5, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shouldEnableUnknownStatusItems");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v7, CFSTR("STEnableUnknownStatusItems"), v5, 1);

}

@end
