@implementation SBIndirectPanGestureSwitcherModifierEvent

- (int64_t)type
{
  return 5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBIndirectPanGestureSwitcherModifierEvent;
  result = -[SBGestureSwitcherModifierEvent copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 19) = self->_indirectPanEndReason;
  return result;
}

- (BOOL)isIndirectPanGestureEvent
{
  return 1;
}

- (unint64_t)indirectPanEndReason
{
  return self->_indirectPanEndReason;
}

- (void)setIndirectPanEndReason:(unint64_t)a3
{
  self->_indirectPanEndReason = a3;
}

@end
