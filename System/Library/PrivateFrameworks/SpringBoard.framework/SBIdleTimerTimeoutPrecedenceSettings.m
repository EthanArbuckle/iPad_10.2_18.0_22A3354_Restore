@implementation SBIdleTimerTimeoutPrecedenceSettings

- (double)_intervalForPrecedence:(unint64_t)a3
{
  double result;

  if (a3 <= 2)
    return *(&self->_normalTimeout + a3);
  return result;
}

- (void)_setTimeout:(double)a3 withPrecedence:(unint64_t)a4
{
  if (a4 <= 2)
    *(&self->_normalTimeout + a4) = a3;
}

- (void)_setTimeout:(double)a3 ifLeastForPrecedence:(unint64_t)a4
{
  if ((BSFloatIsZero() & 1) == 0
    && ((BSFloatIsZero() & 1) != 0 || (BSFloatIsZero() & 1) == 0 && BSFloatLessThanFloat()))
  {
    -[SBIdleTimerTimeoutPrecedenceSettings _setTimeout:withPrecedence:](self, "_setTimeout:withPrecedence:", a4, a3);
  }
}

- (void)_setTimeout:(double)a3 ifGreatestForPrecedence:(unint64_t)a4
{
  if ((BSFloatIsZero() & 1) == 0
    && ((BSFloatIsZero() & 1) != 0 || (BSFloatIsZero() & 1) == 0 && BSFloatGreaterThanFloat()))
  {
    -[SBIdleTimerTimeoutPrecedenceSettings _setTimeout:withPrecedence:](self, "_setTimeout:withPrecedence:", a4, a3);
  }
}

- (unint64_t)highestPrecedence
{
  if (BSFloatIsZero())
    return BSFloatIsZero() ^ 1;
  else
    return 2;
}

- (double)leastTimeout
{
  int IsZero;
  double criticalTimeout;
  int v5;
  double result;

  IsZero = BSFloatIsZero();
  if ((IsZero & 1) != 0)
    criticalTimeout = 1.79769313e308;
  else
    criticalTimeout = self->_criticalTimeout;
  v5 = IsZero ^ 1;
  if ((BSFloatIsZero() & 1) == 0 && BSFloatLessThanFloat())
  {
    criticalTimeout = self->_highTimeout;
    v5 = 1;
  }
  if ((BSFloatIsZero() & 1) == 0 && BSFloatLessThanFloat())
    return self->_normalTimeout;
  result = 0.0;
  if (!v5)
    return result;
  return criticalTimeout;
}

- (double)greatestTimeout
{
  double result;

  result = self->_criticalTimeout;
  if (result < self->_highTimeout)
    result = self->_highTimeout;
  if (result < self->_normalTimeout)
    return self->_normalTimeout;
  return result;
}

- (NSString)description
{
  return (NSString *)-[SBIdleTimerTimeoutPrecedenceSettings descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIdleTimerTimeoutPrecedenceSettings succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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
  id v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSFloatIsZero() & 1) == 0)
    v4 = (id)objc_msgSend(v3, "appendTimeInterval:withName:decomposeUnits:", CFSTR("normalTimeout"), 0, self->_normalTimeout);
  if ((BSFloatIsZero() & 1) == 0)
    v5 = (id)objc_msgSend(v3, "appendTimeInterval:withName:decomposeUnits:", CFSTR("highTimeout"), 0, self->_highTimeout);
  if ((BSFloatIsZero() & 1) == 0)
    v6 = (id)objc_msgSend(v3, "appendTimeInterval:withName:decomposeUnits:", CFSTR("criticalTimeout"), 0, self->_criticalTimeout);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIdleTimerTimeoutPrecedenceSettings descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)normalTimeout
{
  return self->_normalTimeout;
}

- (double)highTimeout
{
  return self->_highTimeout;
}

- (double)criticalTimeout
{
  return self->_criticalTimeout;
}

@end
