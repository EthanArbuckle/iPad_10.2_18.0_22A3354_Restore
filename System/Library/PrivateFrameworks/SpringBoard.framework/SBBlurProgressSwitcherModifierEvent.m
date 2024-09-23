@implementation SBBlurProgressSwitcherModifierEvent

- (SBBlurProgressSwitcherModifierEvent)initWithProgress:(double)a3
{
  SBBlurProgressSwitcherModifierEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBBlurProgressSwitcherModifierEvent;
  result = -[SBBlurProgressSwitcherModifierEvent init](&v5, sel_init);
  if (result)
    result->_progress = a3;
  return result;
}

- (int64_t)type
{
  return 22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBBlurProgressSwitcherModifierEvent initWithProgress:]([SBBlurProgressSwitcherModifierEvent alloc], "initWithProgress:", self->_progress);
}

- (double)progress
{
  return self->_progress;
}

@end
