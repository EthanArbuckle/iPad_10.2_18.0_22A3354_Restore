@implementation SBResizeProgressSwitcherModifierEvent

- (SBResizeProgressSwitcherModifierEvent)initWithProgress:(double)a3
{
  SBResizeProgressSwitcherModifierEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBResizeProgressSwitcherModifierEvent;
  result = -[SBResizeProgressSwitcherModifierEvent init](&v5, sel_init);
  if (result)
    result->_progress = a3;
  return result;
}

- (int64_t)type
{
  return 21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBResizeProgressSwitcherModifierEvent initWithProgress:]([SBResizeProgressSwitcherModifierEvent alloc], "initWithProgress:", self->_progress);
}

- (double)progress
{
  return self->_progress;
}

@end
