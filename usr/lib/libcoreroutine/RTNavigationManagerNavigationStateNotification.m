@implementation RTNavigationManagerNavigationStateNotification

- (RTNavigationManagerNavigationStateNotification)initWithNavigationState:(int)a3
{
  RTNavigationManagerNavigationStateNotification *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTNavigationManagerNavigationStateNotification;
  result = -[RTNotification init](&v5, sel_init);
  if (result)
    result->_state = a3;
  return result;
}

- (int)state
{
  return self->_state;
}

@end
