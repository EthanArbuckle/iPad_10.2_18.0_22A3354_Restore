@implementation _SBIdleTimerConfigurationInfo

- (_SBIdleTimerConfigurationInfo)initWithConfiguration:(id)a3 reason:(id)a4
{
  id v7;
  id v8;
  _SBIdleTimerConfigurationInfo *v9;
  _SBIdleTimerConfigurationInfo *v10;
  uint64_t v11;
  NSString *reason;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_SBIdleTimerConfigurationInfo;
  v9 = -[_SBIdleTimerConfigurationInfo init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    v11 = objc_msgSend(v8, "copy");
    reason = v10->_reason;
    v10->_reason = (NSString *)v11;

  }
  return v10;
}

- (NSString)description
{
  return (NSString *)-[_SBIdleTimerConfigurationInfo descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_SBIdleTimerConfigurationInfo succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_reason, CFSTR("reason"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_configuration, CFSTR("configuration"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_SBIdleTimerConfigurationInfo descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SBIdleTimerRequestConfiguration)configuration
{
  return self->_configuration;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
