@implementation SBIdleTimerAggregateClientConfiguration

- (SBIdleTimerTimeoutPrecedenceSettings)minExpirationTimeoutSettings
{
  return self->_minExpirationTimeoutSettings;
}

- (SBIdleTimerTimeoutPrecedenceSettings)maxExpirationTimeoutSettings
{
  return self->_maxExpirationTimeoutSettings;
}

- (NSString)description
{
  return (NSString *)-[SBIdleTimerAggregateClientConfiguration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (SBIdleTimerConfigurationDisablesTimerSetting)disableTimerSetting
{
  return self->_disableTimerSetting;
}

- (void)setDisablesTimerWithPrecedence:(unint64_t)a3
{
  SBIdleTimerConfigurationDisablesTimerSetting *v4;
  SBIdleTimerConfigurationDisablesTimerSetting *disableTimerSetting;

  v4 = -[SBIdleTimerConfigurationDisablesTimerSetting initWithPrecedence:]([SBIdleTimerConfigurationDisablesTimerSetting alloc], "initWithPrecedence:", a3);
  disableTimerSetting = self->_disableTimerSetting;
  self->_disableTimerSetting = v4;

}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIdleTimerAggregateClientConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_disableTimerSetting, CFSTR("disableTimerSetting"), 1);
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_minExpirationTimeoutSettings, CFSTR("minExpirationTimeoutSettings"), 1);
  v6 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_maxExpirationTimeoutSettings, CFSTR("maxExpirationTimeoutSettings"), 1);
  return v3;
}

- (void)setMinExpirationTimeout:(double)a3 withPrecedence:(unint64_t)a4
{
  SBIdleTimerTimeoutRange *resolvedExpirationTimeoutRange;
  SBIdleTimerTimeoutPrecedenceSettings *minExpirationTimeoutSettings;
  SBIdleTimerTimeoutPrecedenceSettings *v9;
  SBIdleTimerTimeoutPrecedenceSettings *v10;

  resolvedExpirationTimeoutRange = self->_resolvedExpirationTimeoutRange;
  self->_resolvedExpirationTimeoutRange = 0;

  minExpirationTimeoutSettings = self->_minExpirationTimeoutSettings;
  if (!minExpirationTimeoutSettings)
  {
    v9 = objc_alloc_init(SBIdleTimerTimeoutPrecedenceSettings);
    v10 = self->_minExpirationTimeoutSettings;
    self->_minExpirationTimeoutSettings = v9;

    minExpirationTimeoutSettings = self->_minExpirationTimeoutSettings;
  }
  -[SBIdleTimerTimeoutPrecedenceSettings _setTimeout:withPrecedence:](minExpirationTimeoutSettings, "_setTimeout:withPrecedence:", a4, a3);
}

- (void)setMinExpirationTimeout:(double)a3 ifGreatestForPrecedence:(unint64_t)a4
{
  SBIdleTimerTimeoutRange *resolvedExpirationTimeoutRange;
  SBIdleTimerTimeoutPrecedenceSettings *minExpirationTimeoutSettings;

  resolvedExpirationTimeoutRange = self->_resolvedExpirationTimeoutRange;
  self->_resolvedExpirationTimeoutRange = 0;

  minExpirationTimeoutSettings = self->_minExpirationTimeoutSettings;
  if (minExpirationTimeoutSettings)
    -[SBIdleTimerTimeoutPrecedenceSettings _setTimeout:ifGreatestForPrecedence:](minExpirationTimeoutSettings, "_setTimeout:ifGreatestForPrecedence:", a4, a3);
  else
    -[SBIdleTimerAggregateClientConfiguration setMinExpirationTimeout:withPrecedence:](self, "setMinExpirationTimeout:withPrecedence:", a4, a3);
}

- (void)setMaxExpirationTimeout:(double)a3 withPrecedence:(unint64_t)a4
{
  SBIdleTimerTimeoutRange *resolvedExpirationTimeoutRange;
  SBIdleTimerTimeoutPrecedenceSettings *maxExpirationTimeoutSettings;
  SBIdleTimerTimeoutPrecedenceSettings *v9;
  SBIdleTimerTimeoutPrecedenceSettings *v10;

  resolvedExpirationTimeoutRange = self->_resolvedExpirationTimeoutRange;
  self->_resolvedExpirationTimeoutRange = 0;

  maxExpirationTimeoutSettings = self->_maxExpirationTimeoutSettings;
  if (!maxExpirationTimeoutSettings)
  {
    v9 = objc_alloc_init(SBIdleTimerTimeoutPrecedenceSettings);
    v10 = self->_maxExpirationTimeoutSettings;
    self->_maxExpirationTimeoutSettings = v9;

    maxExpirationTimeoutSettings = self->_maxExpirationTimeoutSettings;
  }
  -[SBIdleTimerTimeoutPrecedenceSettings _setTimeout:withPrecedence:](maxExpirationTimeoutSettings, "_setTimeout:withPrecedence:", a4, a3);
}

- (void)setMaxExpirationTimeout:(double)a3 ifLeastForPrecedence:(unint64_t)a4
{
  SBIdleTimerTimeoutRange *resolvedExpirationTimeoutRange;
  SBIdleTimerTimeoutPrecedenceSettings *maxExpirationTimeoutSettings;

  resolvedExpirationTimeoutRange = self->_resolvedExpirationTimeoutRange;
  self->_resolvedExpirationTimeoutRange = 0;

  maxExpirationTimeoutSettings = self->_maxExpirationTimeoutSettings;
  if (maxExpirationTimeoutSettings)
    -[SBIdleTimerTimeoutPrecedenceSettings _setTimeout:ifLeastForPrecedence:](maxExpirationTimeoutSettings, "_setTimeout:ifLeastForPrecedence:", a4, a3);
  else
    -[SBIdleTimerAggregateClientConfiguration setMaxExpirationTimeout:withPrecedence:](self, "setMaxExpirationTimeout:withPrecedence:", a4, a3);
}

- (id)expirationTimeoutIntervalRangeForPrecedence:(unint64_t)a3
{
  SBIdleTimerTimeoutPrecedenceSettings *minExpirationTimeoutSettings;
  double v6;
  double v7;
  double v8;
  SBIdleTimerTimeoutPrecedenceSettings *maxExpirationTimeoutSettings;
  double v10;

  minExpirationTimeoutSettings = self->_minExpirationTimeoutSettings;
  v6 = 0.0;
  v7 = 0.0;
  if (minExpirationTimeoutSettings)
  {
    -[SBIdleTimerTimeoutPrecedenceSettings _intervalForPrecedence:](minExpirationTimeoutSettings, "_intervalForPrecedence:", a3);
    v7 = v8;
  }
  maxExpirationTimeoutSettings = self->_maxExpirationTimeoutSettings;
  if (maxExpirationTimeoutSettings)
  {
    -[SBIdleTimerTimeoutPrecedenceSettings _intervalForPrecedence:](maxExpirationTimeoutSettings, "_intervalForPrecedence:", a3);
    v6 = v10;
    if ((BSFloatIsZero() & 1) == 0)
    {
      if (BSFloatGreaterThanFloat())
        v7 = v6;
    }
  }
  if (BSFloatIsZero())
    v6 = 1.79769313e308;
  return -[SBIdleTimerTimeoutRange initWithLowerTimeout:upperTimeout:]([SBIdleTimerTimeoutRange alloc], "initWithLowerTimeout:upperTimeout:", v7, v6);
}

- (id)resolvedExpirationTimeoutRange
{
  SBIdleTimerTimeoutRange *resolvedExpirationTimeoutRange;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SBIdleTimerTimeoutRange *v8;
  SBIdleTimerTimeoutRange *v9;

  resolvedExpirationTimeoutRange = self->_resolvedExpirationTimeoutRange;
  if (!resolvedExpirationTimeoutRange)
  {
    -[SBIdleTimerAggregateClientConfiguration expirationTimeoutIntervalRangeForPrecedence:](self, "expirationTimeoutIntervalRangeForPrecedence:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIdleTimerAggregateClientConfiguration expirationTimeoutIntervalRangeForPrecedence:](self, "expirationTimeoutIntervalRangeForPrecedence:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIdleTimerAggregateClientConfiguration expirationTimeoutIntervalRangeForPrecedence:](self, "expirationTimeoutIntervalRangeForPrecedence:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clippedRangeWithFavoredRange:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clippedRangeWithFavoredRange:", v6);
    v8 = (SBIdleTimerTimeoutRange *)objc_claimAutoreleasedReturnValue();
    v9 = self->_resolvedExpirationTimeoutRange;
    self->_resolvedExpirationTimeoutRange = v8;

    resolvedExpirationTimeoutRange = self->_resolvedExpirationTimeoutRange;
  }
  return resolvedExpirationTimeoutRange;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIdleTimerAggregateClientConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxExpirationTimeoutSettings, 0);
  objc_storeStrong((id *)&self->_minExpirationTimeoutSettings, 0);
  objc_storeStrong((id *)&self->_disableTimerSetting, 0);
  objc_storeStrong((id *)&self->_resolvedExpirationTimeoutRange, 0);
}

@end
