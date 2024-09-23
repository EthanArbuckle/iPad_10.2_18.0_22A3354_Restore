@implementation SBExternalIndigoDefaults

+ (id)defaults
{
  if (defaults___once != -1)
    dispatch_once(&defaults___once, &__block_literal_global_6);
  return (id)defaults___instance;
}

void __36__SBExternalIndigoDefaults_defaults__block_invoke()
{
  SBExternalIndigoDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(SBExternalIndigoDefaults);
  v1 = (void *)defaults___instance;
  defaults___instance = (uint64_t)v0;

}

- (SBExternalIndigoDefaults)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBExternalIndigoDefaults;
  return (SBExternalIndigoDefaults *)-[BSAbstractDefaultDomain _initWithDomain:](&v3, sel__initWithDomain_, CFSTR("com.apple.indigo"));
}

- (void)_bindAndRegisterDefaults
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "indigoConfigurationFlagsBitmask");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("IndigoConfigurationFlags"), &unk_24D4DD920, 1);

}

- (BOOL)indigoConfigurationFlagOne
{
  return -[SBExternalIndigoDefaults indigoConfigurationFlagsBitmask](self, "indigoConfigurationFlagsBitmask") & 1;
}

- (BOOL)indigoConfigurationFlagTwo
{
  return ((unint64_t)-[SBExternalIndigoDefaults indigoConfigurationFlagsBitmask](self, "indigoConfigurationFlagsBitmask") >> 1) & 1;
}

- (BOOL)indigoConfigurationFlagThree
{
  return ((unint64_t)-[SBExternalIndigoDefaults indigoConfigurationFlagsBitmask](self, "indigoConfigurationFlagsBitmask") >> 2) & 1;
}

@end
