@implementation SBRepositionProgressSwitcherModifierEvent

- (SBRepositionProgressSwitcherModifierEvent)initWithProgress:(double)a3
{
  SBRepositionProgressSwitcherModifierEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBRepositionProgressSwitcherModifierEvent;
  result = -[SBRepositionProgressSwitcherModifierEvent init](&v5, sel_init);
  if (result)
    result->_progress = a3;
  return result;
}

- (int64_t)type
{
  return 23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBRepositionProgressSwitcherModifierEvent initWithProgress:]([SBRepositionProgressSwitcherModifierEvent alloc], "initWithProgress:", self->_progress);
}

- (double)progress
{
  return self->_progress;
}

@end
