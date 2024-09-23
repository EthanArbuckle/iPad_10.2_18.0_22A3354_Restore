@implementation SBIdleTimerTimeoutRange

- (SBIdleTimerTimeoutRange)initWithLowerTimeout:(double)a3 upperTimeout:(double)a4
{
  SBIdleTimerTimeoutRange *result;
  void *v9;
  objc_super v10;

  if ((BSFloatLessThanOrEqualToFloat() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIdleTimerAggregateClientConfiguration.m"), 329, CFSTR("lower: %g not less than upper: %g"), *(_QWORD *)&a3, *(_QWORD *)&a4);

  }
  v10.receiver = self;
  v10.super_class = (Class)SBIdleTimerTimeoutRange;
  result = -[SBIdleTimerTimeoutRange init](&v10, sel_init);
  if (result)
  {
    result->_lowerTimeout = a3;
    result->_upperTimeout = a4;
  }
  return result;
}

- (BOOL)intersects:(id)a3
{
  objc_msgSend(a3, "lowerTimeout");
  return BSFloatLessThanFloat() && (BSFloatLessThanOrEqualToFloat() & 1) != 0;
}

- (id)clippedRangeWithFavoredRange:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  SBIdleTimerTimeoutRange *v10;
  double lowerTimeout;
  double upperTimeout;
  SBIdleTimerTimeoutRange *v13;
  void *v14;
  SBIdleTimerTimeoutRange *v15;

  v5 = a3;
  objc_msgSend(v5, "lowerTimeout");
  v7 = v6;
  objc_msgSend(v5, "upperTimeout");
  v9 = v8;
  if (BSFloatLessThanOrEqualToFloat() && BSFloatLessThanOrEqualToFloat())
    goto LABEL_21;
  if (BSFloatLessThanOrEqualToFloat()
    && BSFloatLessThanOrEqualToFloat()
    && BSFloatLessThanOrEqualToFloat())
  {
    v10 = [SBIdleTimerTimeoutRange alloc];
    lowerTimeout = self->_lowerTimeout;
LABEL_9:
    upperTimeout = v9;
LABEL_19:
    v13 = -[SBIdleTimerTimeoutRange initWithLowerTimeout:upperTimeout:](v10, "initWithLowerTimeout:upperTimeout:", lowerTimeout, upperTimeout);
    goto LABEL_22;
  }
  if (BSFloatLessThanOrEqualToFloat())
  {
    v10 = [SBIdleTimerTimeoutRange alloc];
    lowerTimeout = v9;
    goto LABEL_9;
  }
  if (!BSFloatLessThanOrEqualToFloat() || !BSFloatLessThanOrEqualToFloat())
  {
    if (BSFloatLessThanOrEqualToFloat()
      && BSFloatLessThanOrEqualToFloat()
      && BSFloatLessThanOrEqualToFloat())
    {
      v10 = [SBIdleTimerTimeoutRange alloc];
      upperTimeout = self->_upperTimeout;
      lowerTimeout = v7;
      goto LABEL_19;
    }
    if (BSFloatLessThanOrEqualToFloat())
    {
      v10 = [SBIdleTimerTimeoutRange alloc];
      lowerTimeout = v7;
      upperTimeout = v7;
      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIdleTimerAggregateClientConfiguration.m"), 384, CFSTR("Clipping range: %@ with favored range: %@ was not resolved."), self, v5);

LABEL_21:
    v13 = self;
    goto LABEL_22;
  }
  v13 = (SBIdleTimerTimeoutRange *)v5;
LABEL_22:
  v15 = v13;

  return v15;
}

- (NSString)description
{
  return (NSString *)-[SBIdleTimerTimeoutRange descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIdleTimerTimeoutRange succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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
  v4 = (id)objc_msgSend(v3, "appendTimeInterval:withName:decomposeUnits:", CFSTR("lower"), 0, self->_lowerTimeout);
  v5 = (id)objc_msgSend(v3, "appendTimeInterval:withName:decomposeUnits:", CFSTR("upper"), 0, self->_upperTimeout);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIdleTimerTimeoutRange descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)lowerTimeout
{
  return self->_lowerTimeout;
}

- (double)upperTimeout
{
  return self->_upperTimeout;
}

@end
