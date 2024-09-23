@implementation _UIMotionEffectEvent

- (double)timestamp
{
  return self->_timestamp;
}

- (_UIMotionEffectEvent)initWithTimestamp:(double)a3
{
  _UIMotionEffectEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIMotionEffectEvent;
  result = -[_UIMotionEffectEvent init](&v5, sel_init);
  if (result)
    result->_timestamp = a3;
  return result;
}

- (id)copyWithTimestamp:(double)a3
{
  return 0;
}

- (double)velocityRelativeToPreviousEvent:(id)a3
{
  return 0.0;
}

@end
