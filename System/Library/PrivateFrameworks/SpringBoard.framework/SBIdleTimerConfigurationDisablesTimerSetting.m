@implementation SBIdleTimerConfigurationDisablesTimerSetting

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIdleTimerConfigurationDisablesTimerSetting descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)succinctDescriptionBuilder
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSBIdleTimerConfigSettingPrecedence();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("precedence"));

  return v2;
}

- (SBIdleTimerConfigurationDisablesTimerSetting)initWithPrecedence:(unint64_t)a3
{
  SBIdleTimerConfigurationDisablesTimerSetting *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBIdleTimerConfigurationDisablesTimerSetting;
  result = -[SBIdleTimerConfigurationDisablesTimerSetting init](&v5, sel_init);
  if (result)
    result->_precedence = a3;
  return result;
}

- (NSString)description
{
  return (NSString *)-[SBIdleTimerConfigurationDisablesTimerSetting descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIdleTimerConfigurationDisablesTimerSetting succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)precedence
{
  return self->_precedence;
}

@end
