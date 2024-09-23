@implementation SXComponentAnimation

- (int)transitionBehavior
{
  return -[SXComponentAnimation userControllable](self, "userControllable") ^ 1;
}

- (Class)handlerClass
{
  return (Class)objc_opt_class();
}

@end
