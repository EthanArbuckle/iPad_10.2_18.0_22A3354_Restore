@implementation TUIImpressionConfiguration

- (TUIImpressionConfiguration)init
{
  TUIImpressionConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIImpressionConfiguration;
  result = -[TUIImpressionConfiguration init](&v3, "init");
  if (result)
    *(_OWORD *)&result->_minUpdateInterval = xmmword_22EB00;
  return result;
}

- (double)minUpdateInterval
{
  return self->_minUpdateInterval;
}

- (void)setMinUpdateInterval:(double)a3
{
  self->_minUpdateInterval = a3;
}

- (double)timingThreshold
{
  return self->_timingThreshold;
}

- (void)setTimingThreshold:(double)a3
{
  self->_timingThreshold = a3;
}

@end
