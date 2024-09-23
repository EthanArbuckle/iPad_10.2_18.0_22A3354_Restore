@implementation SBPreemptAnimationSwitcherEventResponse

- (unint64_t)options
{
  return self->_options;
}

- (SBPreemptAnimationSwitcherEventResponse)initWithOptions:(unint64_t)a3
{
  SBPreemptAnimationSwitcherEventResponse *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBPreemptAnimationSwitcherEventResponse;
  result = -[SBChainableModifierEventResponse init](&v5, sel_init);
  if (result)
    result->_options = a3;
  return result;
}

- (int64_t)type
{
  return 24;
}

@end
