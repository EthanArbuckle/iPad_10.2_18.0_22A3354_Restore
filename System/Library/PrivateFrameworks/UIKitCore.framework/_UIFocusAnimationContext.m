@implementation _UIFocusAnimationContext

- (_UIFocusAnimationContext)initWithDuration:(double)a3
{
  _UIFocusAnimationContext *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIFocusAnimationContext;
  result = -[_UIFocusAnimationContext init](&v5, sel_init);
  if (result)
    result->_duration = a3;
  return result;
}

- (double)duration
{
  return self->_duration;
}

@end
