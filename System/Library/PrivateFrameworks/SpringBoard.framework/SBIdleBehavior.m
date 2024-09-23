@implementation SBIdleBehavior

- (SBIdleBehavior)initWithDuration:(int64_t)a3 warnMode:(int64_t)a4
{
  SBIdleBehavior *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBIdleBehavior;
  result = -[SBIdleBehavior init](&v7, sel_init);
  if (result)
  {
    result->_duration = a3;
    result->_warnMode = a4;
  }
  return result;
}

- (int64_t)idleTimerMode
{
  return 1;
}

- (int64_t)duration
{
  return self->_duration;
}

- (int64_t)warnMode
{
  return self->_warnMode;
}

@end
